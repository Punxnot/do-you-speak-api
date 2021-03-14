Rails.application.routes.draw do
  get 'api/texts', controller: 'texts', action: 'all_texts'
  get 'api/level1', controller: 'texts', action: 'level_1'
  get 'api/level2', controller: 'texts', action: 'level_2'
  get 'api/level3', controller: 'texts', action: 'level_3'
end
