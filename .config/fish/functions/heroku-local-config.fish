function heroku-local-config
	if [ -z $argv[1] ]
		set envfile "heroku.env"
	else
		set envfile $argv[1]
	end

	if [ ! -f $envfile ]
		echo "File $envfile does not exist."
		return
	end

	for line in (cat $envfile)
		set name (echo $line | awk '{print $1}' | tr -d ':')
		set value (echo $line | awk '{print $2}')

		setenv "__OLD_$name" (echo $name)
		setenv $name $value
		echo "Set $name=$value"
	end
end
