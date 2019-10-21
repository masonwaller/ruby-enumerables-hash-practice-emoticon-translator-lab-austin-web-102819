# require modules here
require 'pry'
require 'yaml'
def load_library(file_path)
  list = YAML.load_file(file_path)
  hash={"get_meaning" =>{}, "get_emoticon" =>{}}
  list.each do |meaning, emoticon|
   hash["get_meaning"][emoticon[1]]= meaning
   hash["get_emoticon"][emoticon[0]]= emoticon[1]
   end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  lists= load_library(file_path)
  if lists["get_emoticon"].include?(emoticon)
    return lists["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  lists= load_library(file_path)
  if lists["get_meaning"].include?(emoticon)
    return lists["get_meaning"][emoticon]
  else 
    return "Sorry"
  end
end