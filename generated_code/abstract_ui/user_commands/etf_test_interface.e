note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ETF_TEST_INTERFACE
inherit
	ETF_COMMAND
		redefine 
			make 
		end

feature {NONE} -- Initialization

	make(an_etf_cmd_name: STRING; etf_cmd_args: TUPLE; an_etf_cmd_container: ETF_ABSTRACT_UI_INTERFACE)
		do
			Precursor(an_etf_cmd_name,etf_cmd_args,an_etf_cmd_container)
			etf_cmd_routine := agent test(? , ? , ? , ? , ?)
			etf_cmd_routine.set_operands (etf_cmd_args)
			if
				attached {INTEGER_32} etf_cmd_args[1] as a_threshold and then attached {INTEGER_32} etf_cmd_args[2] as j_threshold and then attached {INTEGER_32} etf_cmd_args[3] as m_threshold and then attached {INTEGER_32} etf_cmd_args[4] as b_threshold and then attached {INTEGER_32} etf_cmd_args[5] as p_threshold
			then
				out := "test(" + etf_event_argument_out("test", "a_threshold", a_threshold) + "," + etf_event_argument_out("test", "j_threshold", j_threshold) + "," + etf_event_argument_out("test", "m_threshold", m_threshold) + "," + etf_event_argument_out("test", "b_threshold", b_threshold) + "," + etf_event_argument_out("test", "p_threshold", p_threshold) + ")"
			else
				etf_cmd_error := True
			end
		end

feature -- command precondition 
	test_precond(a_threshold: INTEGER_32 ; j_threshold: INTEGER_32 ; m_threshold: INTEGER_32 ; b_threshold: INTEGER_32 ; p_threshold: INTEGER_32): BOOLEAN
		do  
			Result := 
				         is_threshold(a_threshold)
					-- (1 <= a_threshold) and then (a_threshold <= 101)
				and then is_threshold(j_threshold)
					-- (1 <= j_threshold) and then (j_threshold <= 101)
				and then is_threshold(m_threshold)
					-- (1 <= m_threshold) and then (m_threshold <= 101)
				and then is_threshold(b_threshold)
					-- (1 <= b_threshold) and then (b_threshold <= 101)
				and then is_threshold(p_threshold)
					-- (1 <= p_threshold) and then (p_threshold <= 101)
		ensure then  
			Result = 
				         is_threshold(a_threshold)
					-- (1 <= a_threshold) and then (a_threshold <= 101)
				and then is_threshold(j_threshold)
					-- (1 <= j_threshold) and then (j_threshold <= 101)
				and then is_threshold(m_threshold)
					-- (1 <= m_threshold) and then (m_threshold <= 101)
				and then is_threshold(b_threshold)
					-- (1 <= b_threshold) and then (b_threshold <= 101)
				and then is_threshold(p_threshold)
					-- (1 <= p_threshold) and then (p_threshold <= 101)
		end 
feature -- command 
	test(a_threshold: INTEGER_32 ; j_threshold: INTEGER_32 ; m_threshold: INTEGER_32 ; b_threshold: INTEGER_32 ; p_threshold: INTEGER_32)
		require 
			test_precond(a_threshold, j_threshold, m_threshold, b_threshold, p_threshold)
    	deferred
    	end
end
