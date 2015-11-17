function strsplit
	set str $argv[1]
	if expr (count $argv) '>' 1 > /dev/null
		set delim $argv[2]
	else
		set delim ' '
	end

	# Newlines are currently the default array element separators
	# See https://github.com/fish-shell/fish-shell/issues/441 for potential future behavior
	# See https://github.com/fish-shell/fish-shell/issues/445
	echo $str | tr $delim '\n'
end
