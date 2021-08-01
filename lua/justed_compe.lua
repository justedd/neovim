local compe = require'compe'
local Source = {}

function Source.new()
  return setmetatable({}, { __index = Source })
end

function Source.get_metadata(self)
  return {
    priority = 10;
    menu = '[Shared Examples]';
    filetypes = {"ruby"}
  }
end


local cmd=[=[
  !ack shared_examples ./spec/support --no-color --no-group | sed "s/^[^']*'\([^']*\)'.*$/\1/" | sed "/:/d" | sort -u
]=]

function Source.determine(self, context)
  return compe.helper.determine(context)
end

local result = vim.api.nvim_exec(cmd, true)

lines = {}
for line in result:gmatch("[^\r\n]+") do
  table.insert(lines, line)
end

table.remove(lines,1)

autocomplete_items = {}
for key, line in pairs(lines) do
  table.insert(
    autocomplete_items,
    { word = "it_behaves_like '" .. line .. "'" }
  )
end

function Source.complete(self, context)
  items = {}
  local filename = vim.api.nvim_exec("echo expand('%:t')", true)

  if string.find(filename, "_spec.rb") then
    items = autocomplete_items
  end

  context.callback({
    items = items
  })
end

function Source.documentation(self, context)
  local doc = {
     January = 'Documentation for January';
  }

  -- will show the current selected item documentation
  context.callback({ doc[context.completed_item.word] })
end

function Source.confirm(self, context)
  -- to special stuff here like snippets expansion for example
end

-- Register your custom source.
compe.register_source('month', Source)

