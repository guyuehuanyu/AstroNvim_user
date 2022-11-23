
local options = {
  opt = {
    mouse = '', -- 禁用鼠标
    wildmode = 'list:longest', -- 改变tab名称的模式
    clipboard = '', -- 让复制功能不自动复制到windows
    expandtab = true, -- 空格替代tab
    ignorecase = false, -- 不忽略大小写搜索
    laststatus = 3, -- globalstatus
    splitbelow = false, -- Splitting a new window below the current one
    splitright = false, -- Splitting a new window at the right of the current one
    wrap = false, -- 一行过长是否换行
    foldenable = false,
    foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
    foldmethod = "expr",
    list = true, -- 显示空白字符，tab、换行、制表
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
    tabstop = 2, -- tab显示的num数
    conceallevel = 2, -- enable conceal 隐藏字符的控制相关
    linebreak = true, -- 当开启换行功能是，是否要显示断点
    showbreak = "↪ ",
    -- FIXED 会报错 shortmess = vim.opt.shortmess + { I = true },
  },
}

return options
