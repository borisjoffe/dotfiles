function fish_prompt --description 'Write out the prompt'
	# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	set -l color_cwd
	set -l suffix
	switch $USER
	case root toor
		if set -q fish_color_cwd_root
			set color_cwd $fish_color_cwd_root
		else
			set color_cwd $fish_color_cwd
		end
		set suffix '#'
	case '*'
		set color_cwd $fish_color_cwd
		set suffix '$'
	end

	#set git_prompt ''
	#set git_prompt (__fish_git_prompt)
	#set git_prompt (__terlar_git_prompt)
	set git_prompt '|'([ -d .git ]; and git cbr)
	#set git_prompt (eval ~/.config/fish/functions/__boris_git_prompt.fish)
	#set git_prompt (__boris_git_prompt)

	# echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
	echo -n -s (set_color $color_cwd) (prompt_pwd) $git_prompt ' ' "$suffix " (set_color normal)
end
