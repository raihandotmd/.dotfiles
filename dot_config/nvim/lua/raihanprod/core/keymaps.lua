-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
---------------------
-- General Keymaps -------------------

-- change the motion $, ^ to H, L
keymap.set({ "n", "v" }, "H", "^")
keymap.set({ "n", "v" }, "L", "$")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
--
-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sh", "<C-w>v", { desc = "Split window horizontally" }) -- split window vertically
keymap.set("n", "<leader>sv", "<C-w>s", { desc = "Split window vertically" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>cc", "<cmd>ChatGPT<CR>", { desc = "ChatGPT" }) -- Open ChatGPT menu

-- Edit with instruction (normal and visual mode)
keymap.set({ "n", "v" }, "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", { desc = "Edit with instruction" })

-- Other ChatGPT functions (normal and visual mode)
keymap.set({ "n", "v" }, "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", { desc = "Grammar Correction" })
keymap.set({ "n", "v" }, "<leader>ct", "<cmd>ChatGPTRun translate<CR>", { desc = "Translate" })
keymap.set({ "n", "v" }, "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", { desc = "Keywords" })
keymap.set({ "n", "v" }, "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", { desc = "Docstring" })
keymap.set({ "n", "v" }, "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", { desc = "Add Tests" })
keymap.set({ "n", "v" }, "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", { desc = "Optimize Code" })
keymap.set({ "n", "v" }, "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", { desc = "Summarize" })
keymap.set({ "n", "v" }, "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", { desc = "Fix Bugs" })
keymap.set({ "n", "v" }, "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", { desc = "Explain Code" })
keymap.set({ "n", "v" }, "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", { desc = "Roxygen Edit" }) -- Assuming this is for R users
keymap.set(
	{ "n", "v" },
	"<leader>cl",
	"<cmd>ChatGPTRun code_readability_analysis<CR>",
	{ desc = "Code Readability Analysis" }
)

keymap.set("n", "<leader>nn", "<cmd>ZenMode<CR>", { desc = "Zen Mode" }) -- Enter Zenmode

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Highlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

keymap.set("n", "<leader>ef", "<CMD>Oil<CR>", { desc = "Open parent directory (uses oil.nvim)" })
