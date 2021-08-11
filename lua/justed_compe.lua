local compe = require'compe'
local Source = {}

function Source.new()
  return setmetatable({}, { __index = Source })
end

function Source.get_metadata(self)
  return {
    priority = 10;
    menu = '[RSpec]';
    filetypes = {"ruby"}
  }
end

function Source.determine(self, context)
  return compe.helper.determine(context)
end

local SharedExamples = {
  loaded = false;
}

function SharedExamples:get()
  if self.loaded then
    return self.items
  else
    local cmd=[=[
      !ack shared_examples ./spec/support --no-color --no-group | sed "s/^[^']*'\([^']*\)'.*$/\1/" | sed "/:/d" | sort -u
    ]=]

    local result = vim.api.nvim_exec(cmd, true)

    local lines = {}
    for line in result:gmatch("[^\r\n]+") do
      table.insert(lines, line)
    end

    table.remove(lines,1)


    local items = {}
    for key, line in pairs(lines) do
      table.insert(
        items,
        { word = line }
      )
    end

    self.items = items
    self.loaded = true

    return items
  end
end

function Source.complete(self, context)
  local items = {}
  local filename = vim.api.nvim_exec("echo expand('%:t')", true)
  local line = vim.api.nvim_get_current_line()

  if string.find(filename, "_spec.rb") then
    if string.find(line, "it_behaves_like '") then
      items = SharedExamples:get()
    else
      items = {
        { word = 'let_it_be' };
        { word = 'it_behaves_like' };
        { word = 'include_context' };
        { word = 'create' };
        { word = 'build' };
        { word = 'build_stubbed' };
      }
    end
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

