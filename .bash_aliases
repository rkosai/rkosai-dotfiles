#alias longprompt="PS1='\$(perl ~/.custom/prompt.pl --user=\\u --host=\\h --dir=\`pwd\` --time=\\t | sed \"s!LEFT_BRACKET!\[!g\" | sed \"s!RIGHT_BRACKET!\]!g\")'"
#alias shortprompt="PS1='\$(perl ~/.custom/prompt.pl --short --user=\\u --host=\\h --dir=\`pwd\` --time=\\t | sed \"s!LEFT_BRACKET!\[!g\" | sed \"s!RIGHT_BRACKET!\]!g\")'"
#shortprompt

# Set bash into vi mode (sadly, not vim)
EDITOR=vim
set -o vi
