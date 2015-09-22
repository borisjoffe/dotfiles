# From https://gist.github.com/rsff/9366074
# this script can never fail
# i use it in the fish_config
# call it with ssh_agent_start

function ssh_agent_start
	if [ -n "$SSH_AGENT_PID" ]
    		ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    		if [ $status -eq 0 ]
        		ssh_test_identities
    		end
	else
    		if [ -f $SSH_ENV ]
        		. $SSH_ENV > /dev/null
    		end
    	ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    	if [ $status -eq 0 ]
        	ssh_test_identities
    	else
    		echo "Initializing new SSH agent ..."
	        ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    		echo "succeeded"
		chmod 600 $SSH_ENV
		. $SSH_ENV > /dev/null
    		ssh-add
	end
	end
end

# Is this necessary?
# function fish_title
#     if [ $_ = 'fish' ]
# 	echo (prompt_pwd)
#     else
#         echo $_
#     end
#end
