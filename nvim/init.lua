-- require("options")
require("start")
require("configs")

-- Mappings file for custom mappings
require("keymaps")

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			vim.cmd("TSUpdate")
		end
	end,
})


-- Here to help with vim.pack
gh = function(x)
	return "https://github.com/" .. x
end
cb = function(x)
	return "https://codeberg.org/" .. x
end
