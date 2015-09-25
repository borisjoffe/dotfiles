function abbr-get
	# useful for getting the abbreviation into an argument to another function
	set myAbbr $argv[1]
	abbr -s | grep $myAbbr | sed 's/^abbr '$myAbbr' \'\(.*\)\'/\1/'
end
