fish_vi_key_bindings

function fish_mode_prompt; end

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set -x ANSIBLE_HOST_KEY_CHECKING False
set -x ANSIBLE_HOSTS /etc/ansible/ec2.py
set -x EC2_INI_PATH /etc/ansible/ec2.ini

alias vim nvim

abbr sv source ~/.config/fish/config.fish
abbr ev vim ~/.config/fish/config.fish 

abbr gom "git add .; and git commit"
abbr goma "git commit --amend"
abbr gomaa "git add .; and git commit --amend"
abbr gl "git log --no-merges"
abbr trash "git stash; and git stash drop"
abbr gdm "git branch --merged | grep -v '\*' | grep -v master | grep -v dev | xargs -n 1 git branch -d"
abbr gc "git checkout"

abbr mongod mongod --fork --syslog

function fe
    fzf | read MYRESULT; and vim $MYRESULT;
end

function clean
    find . -name "*.pyc" -exec rm -rf {} \;
    find . -name "*.log*" -exec rm -rf {} \;
    find . -name "*.bak.py" -exec rm -rf {} \;
    find . -name "*.egg-info" -exec rm -rf {} \;
    find . -name "__pycache__" -exec rm -rf {} \;
    find . -name ".coverage.*" -exec rm -rf {} \;
end

# Work profile only
set -gx LSCOLORS gxfxcxdxbxegedabagacad

set -x DEPLOY_ENV "testing"

abbr dx-test venv/bin/ptw -- -vv \
        --cov dx \
        --cov-report html

function fish_prompt
    ~/bin/powerline-shell.py $status --shell bare ^/dev/null
end

abbr lint "pylint dx/*"
abbr gel "isort -q -ds -rc dx/; and find dx -type f -name '*.py' -print | xargs pcregrep --multiline --line-number '^import.*\nfrom' | python ~/bin/ib.py; and yapf dx --recursive -i"

set -x ROOT_URL http://localhost:8000/datacentral/
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
set -x GRADLE_HOME ~/bin/gradle-2.4

