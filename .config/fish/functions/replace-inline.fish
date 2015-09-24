function replace-inline
	set filename (first $argv)
	set commandWithArgs (rest $argv)

	cp $filename $filename".bak"
	eval "$commandWithArgs" > $filename".tmp"
	cp $filename".tmp" $filename
	rm $filename".tmp"
end
