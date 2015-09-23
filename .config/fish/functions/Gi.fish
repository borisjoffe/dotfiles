function Gi
	set searchTerm (first $argv)
	set otherArgs (rest $argv)
	eval "$otherArgs" | grep -i $searchTerm
end
