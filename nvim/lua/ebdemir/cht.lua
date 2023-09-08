local function create_channel()
    vim.cmd("split")
    local window = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_height(window, 20)
    local buffer = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(window, buffer)
    local chan = vim.api.nvim_open_term(buffer, {})
    return chan
end

local function lookup(backend, query)
    local handle = io.popen(backend .. ' ' .. query)
    local chan = create_channel()

    if handle ~= nil then
        local output = handle:read("a")
        vim.api.nvim_chan_send(chan, string.find(output, "\r\n") and output or output:gsub("\n", "\r\n"))
    else
        print("Failed to execute query")
    end
end

local function cht_sh(query)
    local cht_dir = "/home/ebdemir/scripts/cht.sh"
    lookup(cht_dir, query)
end

local function cpp_man(query)
    lookup("cppman", query)
end

vim.api.nvim_create_user_command("Cht", function(opts)
    cht_sh(opts.args)
end, { nargs = '+' })

vim.api.nvim_create_user_command("Cppman", function(opts)
    cpp_man(opts.args)
end, { nargs = '+' })
