function rest
	set len (count $argv)
	if test $len -lt 2
		echo " "
	else
		echo $argv[(seq 2 $len)];
	end
end
