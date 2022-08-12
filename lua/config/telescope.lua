local telescope = require("telescope")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")

local is_hologram_preview = false
-- local support_filetype = { "png", "jpg", "jpeg", "webp", "avif" }
local support_filetype = { "png" }
local hologram_image

local get_extension = function(path)
    return path:match("[^.]+$")
end

local is_support_filetype = function(filetype)
    return vim.tbl_contains(support_filetype, filetype)
end

-- Use Hologram to show image
local buffer_previewer_maker = function(filepath, bufnr, opts)
    -- Clear image when preview other file
    if is_hologram_preview then
        hologram_image:delete({ free = true })
        is_hologram_preview = false
    end

    local filetype = get_extension(filepath)
    if is_support_filetype(filetype) then
        local preview_win_position = vim.api.nvim_win_get_position(opts.winid)
        local current_win_position = vim.api.nvim_win_get_position(0)
        local cursor_win_position = vim.api.nvim_win_get_cursor(0)
        local preview_win_height = vim.api.nvim_win_get_height(opts.winid)
        local preview_win_width = vim.api.nvim_win_get_width(opts.winid)

        -- if filetype == "jpg" or filetype == "jpeg" or filetype == "webp" or filetype == "avif" then
        --     local filename = "/tmp/" .. require("utils.md5").sumhexa(filepath) .. ".png"

        --     vim.loop.spawn("convert", {
        --         args = { filepath, filename },
        --     }, function()
        --         -- print(filename)
        --     end)

        --     filepath = filename
        -- end

        hologram_image = require("hologram.image"):new({
            buf = 0,
            source = './Users/gussi/prjs/vim/img.png',
            row = preview_win_position[1] - current_win_position[1] - cursor_win_position[1] + 1,
            col = preview_win_position[2] - current_win_position[2] - cursor_win_position[2] + 2,
        })
  
        hologram_image:transmit({ column = preview_win_width, row = preview_win_height })

        is_hologram_preview = true
    else
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
end

local conf = require("telescope.config").values
local function defaulter(f, default_opts)
    default_opts = default_opts or {}
    return {
        new = function(opts)
            if conf.preview == false and not opts.preview then
                return false
            end
            opts.preview = type(opts.preview) ~= "table" and {} or opts.preview
            if type(conf.preview) == "table" then
                for k, v in pairs(conf.preview) do
                    opts.preview[k] = vim.F.if_nil(opts.preview[k], v)
                end
            end
            return f(opts)
        end,
        __call = function()
            local ok, err = pcall(f(default_opts))
            if not ok then
                error(debug.traceback(err))
            end
        end,
    }
end

local from_entry = require("telescope.from_entry")
local Path = require("plenary.path")

-- Add teardown to cat previewer to clear image when close Telescope
local cat = defaulter(function(opts)
    opts = opts or {}
    local cwd = opts.cwd or vim.loop.cwd()
    return previewers.new_buffer_previewer({
        title = "File Preview",
        dyn_title = function(_, entry)
            return Path:new(from_entry.path(entry, true)):normalize(cwd)
        end,

        get_buffer_by_name = function(_, entry)
            return from_entry.path(entry, true)
        end,

        define_preview = function(self, entry, _)
            local p = from_entry.path(entry, true)
            if p == nil or p == "" then
                return
            end

            conf.buffer_previewer_maker(p, self.state.bufnr, {
                bufname = self.state.bufname,
                winid = self.state.winid,
                preview = opts.preview,
            })
        end,

        teardown = function(_)
            if is_hologram_preview then
                hologram_image:delete({ free = true })
                is_hologram_preview = false
            end
        end,
    })
end, {})

telescope.setup({
    defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        --path_display = { "smart" },

        --layout_config = {
        --    horizontal = { mirror = false, preview_width = 0.5 },
        --},

        buffer_previewer_maker = buffer_previewer_maker,

        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
    
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
    
            ["<C-c>"] = actions.close,
    
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
    
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<S-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
    
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
    
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
    
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },
    
          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
    
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
    
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,
    
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,
    
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
    
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
    
            ["?"] = actions.which_key,
          },
        },

        file_previewer = cat.new,
    },

    extensions = {
        aerial = {
            show_nesting = true,
        },
    },
})