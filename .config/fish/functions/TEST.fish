function TEST
	eval $argv > /dev/null; and echo "true"; or echo "false"
end
