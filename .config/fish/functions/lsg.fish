function lsg
	set searchTerm (first $argv)
	set directoryAndArgs (rest $argv)
	ls $directoryAndArgs | grep -i $searchTerm;
end
