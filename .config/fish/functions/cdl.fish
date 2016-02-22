function cdl --description 'Go into a directory and list contents'
	cd $argv[1]

	set len (count $argv)
	if test $len -gt 1
		ls $argv[2..$len]
	else
		ls
	end
end
