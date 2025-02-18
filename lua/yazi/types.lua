---@class YaziConfig
---@field public open_for_directories? boolean
---@field public chosen_file_path? string "the path to a temporary file that will be created by yazi to store the chosen file path"
---@field public events_file_path? string "the path to a temporary file that will be created by yazi to store events. A random path will be used by default"
---@field public enable_mouse_support? boolean
---@field public open_file_function? fun(chosen_file: string, config: YaziConfig): nil "a function that will be called when a file is chosen in yazi"
---@field public set_keymappings_function? fun(buffer: integer, config: YaziConfig): nil "the function that will set the keymappings for the yazi floating window. It will be called after the floating window is created."
---@field public hooks? YaziConfigHooks
---@field public floating_window_scaling_factor? float "the scaling factor for the floating window. 1 means 100%, 0.9 means 90%, etc."
---@field public yazi_floating_window_winblend? float "the transparency of the yazi floating window (0-100). See :h winblend"
---@field public yazi_floating_window_border? any "the type of border to use. See nvim_open_win() for the values your neovim version supports"
---@field public log_level? yazi.LogLevel

---@class YaziConfigHooks
---@field public yazi_opened fun(preselected_path: string | nil, buffer: integer, config: YaziConfig):nil
---@field public yazi_closed_successfully fun(chosen_file: string | nil, config: YaziConfig): nil
---@field public yazi_opened_multiple_files fun(chosen_files: string[], config: YaziConfig): nil

---@alias YaziEvent YaziRenameEvent | YaziMoveEvent | YaziDeleteEvent | YaziTrashEvent

---@class YaziRenameEvent
---@field public type "rename"
---@field public timestamp string
---@field public id string
---@field public data YaziEventDataRenameOrMove

---@class YaziMoveEvent
---@field public type "move"
---@field public timestamp string
---@field public id string
---@field public data {items: YaziEventDataRenameOrMove[]}

---@class YaziEventDataRenameOrMove
---@field public from string
---@field public to string

---@class YaziDeleteEvent
---@field public type "delete"
---@field public timestamp string
---@field public id string
---@field public data {urls: string[]}

---@class YaziTrashEvent
---@field public type "trash"
---@field public timestamp string
---@field public id string
---@field public data {urls: string[]}

---@class yazi.AutoCmdEvent # the nvim_create_autocmd() event object copied from the nvim help docs
---@field public id number
---@field public event string
---@field public group number | nil
---@field public match string
---@field public buf number
---@field public file string
---@field public data any
