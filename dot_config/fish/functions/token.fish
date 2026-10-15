function token
   jwt $argv[1] --output=json | jq .payload  | pbcopy
   pbpaste
end
