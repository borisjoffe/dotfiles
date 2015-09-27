function llg
	set searchTerm (first $argv)
	set directoryAndArgs (rest $argv)
	ll $directoryAndArgs | grep -i $searchTerm;
end
