function rest
	set len (count $argv)
	if test $len -gt 1
		echo $argv[(seq 2 $len)];
	end
end
