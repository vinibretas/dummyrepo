export DEVICE=server
interactive_echo "├── Sourced /home/vinibretas/.bash_aliases ($(whoami)@$DEVICE)"

SECONDS=0
#log_time "File: .bashrc_aliases Line: $LINENO" 4
#cd $ASHELDIR
source ~/.bash_profile
#log_time "File: .bashrc_aliases Line: $LINENO" 4
alias nvimrc="vim ~/.config/nvim/init.vim"
# alias python="python3.10"
# alias python3="python3.10"
# alias pip="python3.12 -m pip"
alias pip="pipwrapper"

alias myipaddr='python3.12 -c "import tinytuya.scanner as sc; print(sc.getmyIPaddr())"'
alias scanssh='nmap -p 22 --open 192.168.1.0/24'
alias ipconfig="sudo vim /etc/netplan/50-cloud-init.yaml"

alias disable_services="sudo xargs -a ~/disabled_services -I {} bash -c 'sudo systemctl disable "{}"'"
alias enable_services="sudo xargs -a ~/disabled_services -I {} bash -c 'sudo systemctl enable --now "{}"'"
alias mask_services="sudo xargs -a ~/disabled_services -I {} bash -c 'sudo systemctl mask "{}"'"
alias unmask_services="sudo xargs -a ~/disabled_services -I {} bash -c 'sudo systemctl unmask "{}"'"
alias start_services="sudo xargs -a ~/disabled_services -I {} bash -c 'sudo systemctl start "{}"'"
alias stop_services="sudo xargs -a ~/disabled_services -I {} bash -c 'sudo systemctl stop "{}"'"

alias bootime="echo Bootime: $(systemd-analyze | grep "Startup finished" | grep -oP '(?<= = )([0-9]+min )?[0-9.]+s')"


PATH=$PATH:~/.local/bin
#log_time "File: .bashrc_aliases Line: $LINENO" 4

# Env variables
    export PYTHONPATH=$PYTHONPATH:home/vinibretas/root/gitrepos/a-shell/root/Python_codes/gutils/app
    export GLOBAL_ENVS=$ASHELDIR/.global_envs
    export MYLIB=$VDP/mylib

    #python3 -c "from urgent_task_manager import main; main()"
    #$ASHELDIR/bin/print_urgent_task
    #source $ASHELDIR/.global_envs

# Misc Aliases: 
    # Actions
        alias facul="cd $HOME/Documents/Faculdade"
        alias diff=colordiff
        alias cdfree="cd /media/vinibretas/free1"
        alias freemount="sudo mount /dev/sdb2 /media/vinibretas/free1"
        alias freeumount="sudo umount /media/vinibretas/free1"
        alias cdhd="cd /media/vinibretas/HD_EXTERNO"
        alias ratings="cd /home/vinibretas/.local/share/vlc"
        alias tempcode="mkdir temporary_code && cd temporary_code && cp ~/.vim/snipets/python.py temp.py && vim temp.py"

        alias cleantempcode="rm -rdf temporary_code && cd ../ && rm -rdf temporary_code"
        alias cdbkchem="cd $bkchemdir"
        alias pwatch="ls $CURRENT_FILE | entr -r python3.10 $CURRENT_FILE"
        alias pwatchtest="ls $CURRENT_FILE | entr -r python3.10"
        alias p="ls $CURRENT_FILE | entr -r python3.10 $CURRENT_FILE"
        alias reloadBatteryMonitor="sudo systemctl daemon-reload && sudo systemctl restart battery-monitor.service"
        alias batteryMonitorLogs="journalctl -u battery-monitor.service -f"
        alias restartBatteryMonitor="sudo systemctl restart battery-monitor.service"
        alias stopBatteryMonitor="sudo systemctl stop battery-monitor.service"
        alias cdcurf="cd ${CURRENT_FILE%/*}"
        alias curfcd="cd ${CURRENT_FILE%/*}"
        alias cdc="cd ${CURRENT_FILE%/*}"
        alias lscount="ls -1 | wc -l" 
        alias count="ls -1 | wc -l" 
        alias lscountfile="find . -type f | wc -l"
        alias lscountdir="find . -type d | wc -l"
        alias tempdir="mkdir temp && cd temp" 
        alias chromelink="sudo vim /usr/share/applications/google-chrome.desktop"
        alias applications="cd ~/.local/share/applications"
        alias speedtest=speedtest-cli
        alias bright="changebrightness 20"
        alias dark="changebrightness -20"
        alias stui="s-tui"
    

        alias install="sudo apt-get install -y"
        alias rmlintnot="rmlint -o sh:rmlint.sh -o pretty:stdout -o summary:rmlint_sum.txt -o json:rmlint.json && echo -e ' "message": "'$(cat rmlint_sum.txt)'"'"\n}" >> msg3.json && send msg3.json"
        alias send="~/bin/send" 
        alias ntfytest1="ntfy pub -t min -p 1 vinibretas_alerts 'test notification...'"
        alias ntfytest2="ntfy pub -t low -p 2 vinibretas_alerts 'test notification...'"
        alias ntfytest3="ntfy pub -t def -p 3 vinibretas_alerts 'test notification...'"
        alias ntfytest4="ntfy pub -t high -p 4 vinibretas_alerts 'test notification...'"
        alias ntfytest5="ntfy pub -t max -p 5 vinibretas_alerts 'test notification...'"
        alias rmcache="rm -rdfv __pycache__/"
        alias vi="vim"
        alias edex="/home/vinibretas/programs/edex/eDEX-UI-Linux-x86_64.AppImage"
        alias tree="eza -Ta"
        #alias pip="pip3"
        alias lsmylib="/home/vinibretas/root/gitrepos/a-shell/bin/lsmylib"
        alias richdoc="cd $VDP/rich_module/resources/rich_docs"
        alias richdocs="cd $VDP/rich_module/resources/rich_docs"
        alias duhelp="python -m rich.markdown $ASHELDIR/other/du_help.md"
#log_time "File: .bashrc_aliases Line: $LINENO" 4
        alias vimhelp="python -m rich.markdown /home/vinibretas/root/gitrepos/a-shell/other/vimhelp.md"
        alias diskusage="du -sh * | sort -hr | head > .diskusage.txt; cat .diskusage.txt"
        # alias diskusage="du -sh * | sort -hr | head > diskusage.txt; cat diskusage.txt; rm diskusage.txt"
        alias diskusageall="du -sh * | sort -hr"
        alias c="clear"
        #alias l="ls"
        #alias la="ls -tal"
        alias la="eza -al"
        alias SOURCE_bash_profile="source ~/.bash_profile"
        alias cl="clear ; ls"
        alias lc="clear ; ls"
        alias rmtexall="rm main.log main.pdf main.aux"
        alias rmtex="rm main.log main.aux"
        alias pbcopy="xclip -sel clip"
        alias sl=$ASHELDIR/bin/sololink
        alias cp="cp -vRfp" # (v)erbose, (R)ecursive, (f)orce
        alias cp="cp -vRip" # (v)erbose, (R)ecursive, (i)nteractive
        # alias rm="rm -rdfv" # (r)ecursive, (d)rmEmptydir, (f)orce, (v)erbose
        # alias rm="trash-put -v" # (r)ecursive, (d)rmEmptydir, (f)orce, (v)erbose
        alias rmr="rm"
        # alias mv="mv -vi" # (v)erbose, (i)nteractive
        alias mv="mv -v" # (v)erbose, (i)nteractive
        alias vm="gcloud compute ssh --zone "us-east1-b" "instance-1"  --project "cloud-server-374417""

    # EZA / ls
        alias ls="eza"
        alias lall="eza --sort=size --time-style=+'%a %d-%b-%C %H:%M:%S' --no-user --total-size -lahH"
        #alias lall="ls -aghNoS --time-style=+'%a %d-%b-%C %H:%M:%S'" 
        alias lal="lall"
        # One hashtag = being used. Two ## = not being used
        #  a = list all
        ## A = exclude starting with .
        #  g = do not list owner
        #  h = print size on human readable way
        ## n = list numeric user as group ID
        #  N = Print names without quoting
        #  o = no listing group info
        #  r = print in reverse
        ## S = Sort by file Size
    # SSH
        alias deskenable="sudo systemctl enable --now xrdp"
        alias deskstatus="sudo systemctl status xrdp"

        alias deskstart="sudo systemctl start xrdp"
        alias deskstartnow="sudo systemctl enable xrdp --now"
        alias deskenable="sudo systemctl enable xrdp"

        alias deskstop="sudo systemctl stop xrdp"
        alias deskrestart="sudo systemctl restart xrdpd"
        alias deskdisable="sudo systemctl disable xrdp"



        alias sshstatus="sudo systemctl status ssh"
        alias sshst="sudo systemctl status ssh"
        alias sshconf="sudo vim /etc/ssh/sshd_config"

        alias sshstart="sudo systemctl start ssh"
        alias sshstartnow="sudo systemctl enable ssh --now"
        alias sshenable="sudo systemctl enable ssh"

        alias sshstop="systemctl stop ssh"
        alias sshrestart="sudo systemctl restart sshd"
        alias sshdisable="systemctl disable ssh"
        alias sshusage="python ~/root/gitrepos/a-shell/bin/ssh_usage_main.py"
        alias sshusagedit="vim ~/root/gitrepos/a-shell/bin/ssh_usage_main.py"
        alias sshcrenata="ssh -p 3520 $renata"
    # File edit
        alias strshipcfg="vim ~/.config/starship.toml"
        alias bashrc="vim ~/.bash_aliases"
        alias bashp="vim ~/.bash_profile"
        alias dotbashrc="vim ~/.bashrc"
        alias vimrc="vim ~/.vimrc"
    # Go to folder (Shortcut to non git repo folders)
        alias oop="cd $VDP/Python_codes/random/oop"
        alias bin="cd ~/bin"
        alias abin="cd ~/root/gitrepos/a-shell/bin"
        alias media="cd /media/vinibretas/"
        alias temp="cd ~/root/temp"
        alias tmp="cd ~/root/tmp"
        alias vd="cd $ASHELDIR"
        alias mylib="cd $MYLIB"
        alias commands="vim ~/root/gitrepos/a-shell/other/savedcommands.md"
        alias edir="cd $edir"
        alias chal="cd $VDP/Python_codes/practice/challenges/cwf"
        alias sql="cd $ASHELDIR/root/sql"  
        alias solo="cd ~/root/gitrepos/solo"
        alias cdr="cd /home/vinibretas/root"
        alias ldir="cd $lastdir"
        alias ldr="cd $lastdir"

#log_time "File: .bashrc_aliases Line: $LINENO" 4

# flet aliases
    alias fletcolors="python /home/vinibretas/root/learnFlet/examples/python/community/colors_browser/main.py"

# /bin scripts
    alias geekbench="/home/vinibretas/root/geekbench-6.2.1-Linux/geekbench6"
    alias tprint="sudo /home/vinibretas/root/printest/mainprint.py"
    alias zenit="python $VDP/Python_codes/zenitPolar/main.py"
    alias zenitpolar="python $VDP/Python_codes/zenitPolar/main.py"
    alias setlastdir="source ~/bin/setlastdir"
    alias cdld="cd $lastdir"
    alias sld="source ~/bin/setlastdir"
    alias sldroot="source ~/bin/sldroot"
    alias pythonpacks="cd ~/.local/lib/python3.10/site-packages"
    alias fix="/home/vinibretas/root/gitrepos/a-shell/bin/fixRepository"
    alias randomfiles="python /home/vinibretas/bin/genRandomFiles/genf-main.py"
    alias rrandomfiles="python /home/vinibretas/bin/genRandomFiles/genf-main.py $((RANDOM % 300))"
    alias delrandomfiles="python /home/vinibretas/bin/genRandomFiles/genf-emp.py"
    # todoManager script
        export RAW="todoraw.md"
        export RAW="todoraw2.md"
        export TODOSCRIPT=$ASHELDIR/root/todoManager/todoManager*.py
        alias todoraw="vim $ASHELDIR/todoraw.md"
        alias todoraw2="vim $ASHELDIR/todoraw2.md"
        alias todo="python $TODOSCRIPT"

        alias prettify="python ~/root/gitrepos/a-shell/root/todoManager/main.py prettify"
        alias todolist="python ~/root/gitrepos/a-shell/root/todoManager/main.py "
        alias todop="source ~/root/gitrepos/a-shell/bin/todop_main"
        alias curf="python $ASHELDIR/bin/setcurrent_file.py"
        alias todour="vim $ASHELDIR/notes/urgent.md"
    # genfiles (genf) script
        alias genfiles="python ~/bin/genfiles/genfiles.py"
        alias gen="python ~/bin/genfiles/genfiles.py"
        alias gfedit="vim ~/bin/genfiles/genfiles.py"

        alias rmg="python ~/bin/genfiles/emp.py"
        alias rmgenfiles="python ~/bin/genfiles/emp.py"
    # whatsapp
        alias wpp="python ~/bin/sendwppmsg.py vinicius"
        alias wppr="python ~/bin/sendwppmsg.py renata"
        alias wpph="python ~/bin/sendwppmsg.py heloisa"
        alias wppedit="vim ~/bin/sendwppmsg.py"

    # git-utils (gutils) script
        # alias cdgutils="cd $GUTILS/app"
        alias cdgutils="cd $GUTILS"
        alias delbranch="gutils delbranch"
        alias gutilsconf="vim $GUTILS/app/gutils/settings.json"
        alias logs="cd $GUTILS/app/gutils/logs"
        alias gutedit="vim $GUTILS/app/gutils_main.py"

        alias guteditlibh="vim $GUTILS/app/gutils/highlighters.py"
        alias guteditlib="cd $GUTILS/app/gutils"
        alias gtlib="cd $GUTILS/app/gutils"

        alias gutilstest="python $GUTILS/app/gutils/testing/test_gutils_main.py"
        alias hashes="gutils hashes"
        alias gutils_hash="gutils hash"
        alias add="gutils add"
        alias commit="gutils commit"
        alias push="gutils push"
        alias pull="gutils pull"
        alias branches="gutils branches"
        alias st="gutils status"
        alias checkout="gutils checkout"
        alias log="gutils log"
        alias comp="gutils comp"
        alias compcach="gutils compcach"
        alias compid="gutils compid"
        alias gitrm="gutils gitrm"
        alias clone="gutils clone"
    # systeminfo script
        alias systeminfo="python ~/root/gitrepos/a-shell/bin/sysinfo_main.py"
        alias sys="python ~/root/gitrepos/a-shell/bin/sysinfo_main.py"
        alias mysys="$ASHELDIR/bin/mysys"

        alias systeminfoedit="vim ~/root/gitrepos/a-shell/bin/sysinfo_main.py"
        alias sysedit="vim ~/root/gitrepos/a-shell/bin/sysinfo_main.py"
    # Arm mounting
        alias arm="source ~/root/gitrepos/a-shell/bin/arm-mount"
        alias mountarm="sudo mount -o rw,nosuid,nodev,relatime,user_id=0,group_id=0,default_permissions,allow_other,blksize=4096,uhelper=udisks2 /dev/sda2 /media/vinibretas/Armazenamento"
        alias umountarm="source ~/root/gitrepos/a-shell/bin/arm-umount"
    # fname
        alias fname="/home/vinibretas/root/gitrepos/a-shell/bin/foldername"
        alias fnameedit="vim /home/vinibretas/root/gitrepos/a-shell/bin/foldername"
    
    # fav
        alias fav="$ASHELDIR/bin/fav"




# File editor for main.* files
    # Run from /bin
        alias q="vim genitems.py"
        alias q="vim main.sh"
        alias q="vim main.c"
        alias q="vim main.ino"
        alias q="vim -O utils.py main.py"
        alias q="vim utils.py"
        alias q="vim count_codes.py"
        alias q="vim menu.py"
        alias q="vim $CURRENT_FILE && rm main_out"
        alias q="vim $CURRENT_FILE"
        alias qa="vim responses/pickled/analyze_pkl.py"
        alias ra="python3 responses/pickled/analyze_pkl.py"
        alias qq="vim myplots.py"
        alias qq="vim rename_dumm_prof.py"
        alias qq="vim main.py"
        #alias q="vim ../timeparser/atimeparser_main.py"
        #alias q="vim main.pyx"


# Prog runner aliases
        alias r="sh $ASHELDIR/bin/rpy"
        alias r="python cmdata.py"
        alias r="./main.sh"
        alias r="python /home/vinibretas/root/gitrepos/a-shell/bin/genf-main.py"
        alias r="python mysys_main.py"
        alias r="python test_main.py"
        alias r="sudo ./main.py"
        alias r="arduino --upload main.ino"
        alias r="python utils.py"
        alias rr="python myplots.py"
        alias rr="python rename_dumm_prof.py"
        alias rr="python main.py"
        alias r="clang $CURRENT_FILE -o main_out && printf 'c     : ' && ./main_out && printf 'ptyhon: ' && python main.py"
        alias r="clang $CURRENT_FILE -o main_out"
        alias r="python main.py"
        alias r="python $CURRENT_FILE"
        alias rp="sudo ./mainprint.py"
        alias rp="sudo python3 main.py"
        alias qp="vim mainprint.py"
        alias rc="clang main.c -o a && ./a"
        



        alias m="mv *.py seen/"

        #alias rp="sh ~/bin/vimOpenStd/run/rpy"
        #alias rt="pdflatex main.tex main.pdf"
        #alias rt="python test_*"
        #alias rs="python main.py main.smath"
        #alias vt="view main.pdf"

        alias qs="sh ~/root/gitrepos/a-shell/bin/qsmath"
        alias qtest="sh ~/root/gitrepos/a-shell/bin/qtest"
        alias qt="vim test_main.py"
        alias rt="python test_main.py"
        #alias qc="sh ~/root/gitrepos/a-shell/bin/qc"
        #alias qp="sh ~/root/gitrepos/a-shell/bin/qpy"

# Git repos aliases
    alias vda="cd ~/root/gitrepos/a-shell"
    alias vdac="cd ~/root/gitrepos/academico"
    alias vdc="cd ~/root/gitrepos/learnc"
    alias vde="cd ~/root/gitrepos/eqSolver"
    alias vdi="cd ~/root/gitrepos/interpreters"
    alias vdl="cd ~/root/gitrepos/latex"
    alias vds="cd ~/root/gitrepos/smath"
    alias vdp="cd $VDP"
    alias vdr="cd $VDP/apps/rtcwakeManager"
    alias vdsl="cd $VDP/Python_codes/apps/slotmachine"
    alias vdu="cd ~/root/gitrepos/unitconverter"
    alias vdw="cd ~/root/gitrepos/whatsapp"
    alias vdedir="cd /media/vinibretas/Armazenamento1/Documentos/outros/e"
    alias vdgm="cd $VDP/Python_codes/gmtube"

#log_time "File: .bashrc_aliases Line: $LINENO" 4
# Enviroment variables
    export lastdir='/home/vinibretas/root'
    #export PYTHONPATH=~/root/gitrepos/a-shell/root/Python_codes/mylib
    #export PYTHONPATH=$PYTHONPATH:/home/vinibretas/root/gitrepos/a-shell/root/Python_codes/mylib
    #export PYTHONPATH=$PYTHONPATH:/home/vinibretas/root/gitrepos/a-shell/root/Python_codes/mylib/time_parser
    export USERNAME=vinibretas-server

# Commands to run
    #git config --local user.email "lawliet_chan@hotmail.com"
    #git config --local user.name "vinibretas-PC"
    #git config --local user.email "plexa6289@gmail.com"
    #git config --local user.name "plexa6"
    
    # dont remember exactly what this was for
    #if echo $lastdir | grep -q Armazenamento;
    #then
        ##echo "sld in arm -> mount first"
        #source ~/root/gitrepos/a-shell/bin/arm-mount
    #fi

    alias varget="~/root/gitrepos/a-shell/bin/varget"
    alias runvar="~/root/gitrepos/a-shell/bin/runvar"
    alias runvar2="~/root/gitrepos/a-shell/bin/runvar2"
    alias echovar="~/root/gitrepos/a-shell/bin/echovar"
    export HIDAPI_CFLAGS=/home/vinibretas/lpg/hidapi
    export HIDAPI_LIBS=/home/vinibretas/lpg/hidapi 

    export HISTCONTROL=ignoredups:erasedups
    export HISTIGNORE="ls:pwd:exit:bashrc:c:r:q"
    export HISTTIMEFORMAT="%d-%b-%y %X  "

    export SEPARATOR="---"

export GLOBAL_COUNTER=0
increment_counter() {
    export GLOBAL_COUNTER=$((GLOBAL_COUNTER + 1))
    echo $GLOBAL_COUNTER
}


# Enable dotglob: This makes wildcard (*) patterns include hidden files
# (those starting with a dot) when expanding filenames.
shopt -s dotglob


export BASHP="$ROOT/.bash_profile"
#cd /home/vinibretas/root
#cd $lastdir
#
# Append each command to the history file after execution
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
#

#log_time "File: .bashrc_aliases Line: $LINENO" 4
#ntfy publish -q --title "Sourced .bash_aliases" -m "$(mysys list)" -T warning vinibretas_alerts
# setxkbmap -option kpdl:dot

