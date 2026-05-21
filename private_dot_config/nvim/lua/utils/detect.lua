local cache = {}

local function find_up(patterns, bufnr)
  bufnr = bufnr or 0
  local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
  if dir == "" then return nil end
  local key = table.concat(patterns, ",") .. ":" .. dir
  if cache[key] ~= nil then return cache[key] end

  local found = vim.fs.find(patterns, {
    upward = true,
    path = dir,
    type = "file"
  })[1]

  cache[key] = found
  return found
end


local M = {}

function M.has_prettier_config(bufnr)
  local patterns = {
     ".prettierrc", ".prettierrc.json", ".prettierrc.yaml", ".prettierrc.yml",
    ".prettierrc.js", ".prettierrc.cjs", ".prettierrc.mjs", ".prettierrc.toml",
    "prettier.config.js", "prettier.config.cjs", "prettier.config.mjs", "prettier.config.ts",
  }
  if find_up(patterns, bufnr) then return true end

  return false
end

function M.has_oxlint_config(bufnr)
  return find_up({ ".oxlintrc.json", "oxlintrc.json", "oxlint.config.json" }, bufnr) ~= nil
end

return M
