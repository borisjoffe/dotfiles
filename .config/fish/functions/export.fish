function export
	if [ $argv ]
        set var (echo $argv | cut -f1 -d=)
		# colons separate array elements like in $PATH; quotes are ignored
        set val (echo $argv | sed 's/[^=]*=//' | tr ':' ' ' | sed 's/["\']//g')
        setenv $var (strsplit $val " ")
    else
        echo 'export var=value'
    end
end
