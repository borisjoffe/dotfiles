function G
	set searchTerm (first $argv)
	set otherArgs (rest $argv)
	eval "$otherArgs" | grep $searchTerm
end
