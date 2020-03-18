note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ETF_MOVE_INTERFACE
inherit
	ETF_COMMAND
		redefine 
			make 
		end

feature {NONE} -- Initialization

	make(an_etf_cmd_name: STRING; etf_cmd_args: TUPLE; an_etf_cmd_container: ETF_ABSTRACT_UI_INTERFACE)
		do
			Precursor(an_etf_cmd_name,etf_cmd_args,an_etf_cmd_container)
			etf_cmd_routine := agent move(?)
			etf_cmd_routine.set_operands (etf_cmd_args)
			if
				attached {INTEGER_32} etf_cmd_args[1] as dir
			then
				out := "move(" + etf_event_argument_out("move", "dir", dir) + ")"
			else
				etf_cmd_error := True
			end
		end

feature -- command precondition 
	move_precond(dir: INTEGER_32): BOOLEAN
		do  
			Result := 
				         is_direction(dir)
					-- (( dir ~ N ) or else ( dir ~ NE ) or else ( dir ~ E ) or else ( dir ~ SE ) or else ( dir ~ S ) or else ( dir ~ SW ) or else ( dir ~ W ) or else ( dir ~ NW ))
		ensure then  
			Result = 
				         is_direction(dir)
					-- (( dir ~ N ) or else ( dir ~ NE ) or else ( dir ~ E ) or else ( dir ~ SE ) or else ( dir ~ S ) or else ( dir ~ SW ) or else ( dir ~ W ) or else ( dir ~ NW ))
		end 
feature -- command 
	move(dir: INTEGER_32)
		require 
			move_precond(dir)
    	deferred
    	end
end
