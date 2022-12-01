local dap = require("dap")
local dapui = require("dapui")
local dap_vscode = require("dap-vscode-js")

dapui.setup({})
--
-- local javascript_settings = {
-- 	{
-- 		type = "chrome",
-- 		request = "launch",
-- 		program = "${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		console = "integratedTerminal",
-- 	},
-- }
--
-- dap.adapters.chrome = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { vim.fn.stdpath("data") .. "/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
-- }
--
-- dap.configurations.javascript = javascript_settings
--
-- dap.configurations.typescript = javascript_settings
--
-- dap.configurations.javascriptreact = javascript_settings
--
-- dap.configurations.typescriptreact = javascript_settings
--
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dap_vscode.setup({
	debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "Debug Jest Tests",
		-- 	-- trace = true, -- include debugger info
		-- 	runtimeExecutable = "node",
		-- 	runtimeArgs = {
		-- 		"./node_modules/jest/bin/jest.js",
		-- 		"--runInBand",
		-- 	},
		-- 	rootPath = "${workspaceFolder}",
		-- 	cwd = "${workspaceFolder}",
		-- 	console = "integratedTerminal",
		-- 	internalConsoleOptions = "neverOpen",
		-- },
	}
end
