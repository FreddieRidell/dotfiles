function _task (){
	COMPLETIONS=$( _task_complete "$words" $CURRENT );
	compadd $=COMPLETIONS ;
}
compdef _task task
