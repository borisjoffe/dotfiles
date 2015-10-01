function lag
	set searchTerm (first $argv)
	set directoryAndArgs (rest $argv)
	ll -a $directoryAndArgs | grep -i $searchTerm;
end
