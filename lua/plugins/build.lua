local yabs = require 'yabs'

local lua_config = {
  default_task = 'Löve',
  tasks = {
    ['Löve'] = {
      command = 'love .',
      type = 'shell' -- vim, lua, shell
    }
  }
}

local python_config = {
  default_task = 'Run file',
  tasks = {
    ['Run file'] = {
      command = 'python %'
    },
    ['Run in terminal'] = {
      command = 'python %'
    }
  }
}

local chordpro_config = {
  default_task = 'Compile',
  tasks = {
    ['Compile'] = {
        command = 'chordpro %',
        output = 'terminal'
    },
    ['songbook'] = {
        command = 'chordpro *.cho -o songbook.pdf'
    }
  }
}

yabs:setup {
  languages = {
    lua = lua_config,
    python = python_config,
    chordpro = chordpro_config
  }
}
