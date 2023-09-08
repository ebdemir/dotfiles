local function create_buffer()
    vim.cmd("split")
    local window = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_height(window, 20)
    local buffer = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(window, buffer)
    return buffer
end

local function lookup(backend, query, useTerminal)
    local handle = io.popen(backend .. ' ' .. query)
    local buffer = create_buffer()
    local output = ""

    if handle ~= nil then
        output = handle:read("a")
    else
        print("Failed to execute query")
    end

    if useTerminal then
        local chan = vim.api.nvim_open_term(buffer, {})
        vim.api.nvim_chan_send(chan, string.find(output, "\r\n") and output or output:gsub("\n", "\r\n"))
    else
        vim.api.nvim_buf_attach(buffer, true, {})
        local lines = {}
        for s in output:gmatch("[^\r\n]+") do
            table.insert(lines, s)
        end
        vim.api.nvim_buf_set_lines(buffer, 0, 0, false, lines)
    end
end

local function cht_sh(query)
    local cht_dir = "/home/ebdemir/scripts/cht.sh"
    lookup(cht_dir, query, true)
end

local function cpp_man(query)
    lookup("cppman", query, false)
end

vim.api.nvim_create_user_command("Cht", function(opts)
    cht_sh(opts.args)
end, { nargs = '+' })

vim.api.nvim_create_user_command("Cppman", function(opts)
    cpp_man(opts.args)
end, { nargs = '+' })

