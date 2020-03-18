class
 	 ETF_TYPE_CONSTRAINTS

feature -- type queries 

	is_direction(etf_v: INTEGER_32): BOOLEAN 
		require
			comment("etf_v: DIRECTION = {N, NE, E, SE, S, SW, W, NW}")
		do
			 Result := 
				(( etf_v ~ N ) or else ( etf_v ~ NE ) or else ( etf_v ~ E ) or else ( etf_v ~ SE ) or else ( etf_v ~ S ) or else ( etf_v ~ SW ) or else ( etf_v ~ W ) or else ( etf_v ~ NW ))
		ensure
			 Result = 
				(( etf_v ~ N ) or else ( etf_v ~ NE ) or else ( etf_v ~ E ) or else ( etf_v ~ SE ) or else ( etf_v ~ S ) or else ( etf_v ~ SW ) or else ( etf_v ~ W ) or else ( etf_v ~ NW ))
		end

	is_threshold(etf_v: INTEGER_32): BOOLEAN 
		require
			comment("etf_v: THRESHOLD = 1 .. 101")
		do
			 Result := 
				(1 <= etf_v) and then (etf_v <= 101)
		ensure
			 Result = 
				(1 <= etf_v) and then (etf_v <= 101)
		end

feature -- constants for enumerated items 
	N: INTEGER =1
	NE: INTEGER =2
	E: INTEGER =3
	SE: INTEGER =4
	S: INTEGER =5
	SW: INTEGER =6
	W: INTEGER =7
	NW: INTEGER =8

feature -- list of enumeratd constants
	enum_items : HASH_TABLE[INTEGER, STRING]
		do
			create Result.make (10)
			Result.extend(1, "N")
			Result.extend(2, "NE")
			Result.extend(3, "E")
			Result.extend(4, "SE")
			Result.extend(5, "S")
			Result.extend(6, "SW")
			Result.extend(7, "W")
			Result.extend(8, "NW")
		end

	enum_items_inverse : HASH_TABLE[STRING, INTEGER_32]
		do
			create Result.make (10)
			Result.extend("N", 1)
			Result.extend("NE", 2)
			Result.extend("E", 3)
			Result.extend("SE", 4)
			Result.extend("S", 5)
			Result.extend("SW", 6)
			Result.extend("W", 7)
			Result.extend("NW", 8)
		end
feature -- query on declarations of event parameters
	evt_param_types_table : HASH_TABLE[HASH_TABLE[ETF_PARAM_TYPE, STRING], STRING]
		local
			test_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			play_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			abort_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			move_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			land_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			liftoff_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			pass_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			wormhole_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			status_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
		do
			create Result.make (10)
			Result.compare_objects
			create test_param_types.make (10)
			test_param_types.compare_objects
			test_param_types.extend (create {ETF_NAMED_PARAM_TYPE}.make("THRESHOLD", create {ETF_INTERVAL_PARAM}.make(1, 101)), "a_threshold")
			test_param_types.extend (create {ETF_NAMED_PARAM_TYPE}.make("THRESHOLD", create {ETF_INTERVAL_PARAM}.make(1, 101)), "j_threshold")
			test_param_types.extend (create {ETF_NAMED_PARAM_TYPE}.make("THRESHOLD", create {ETF_INTERVAL_PARAM}.make(1, 101)), "m_threshold")
			test_param_types.extend (create {ETF_NAMED_PARAM_TYPE}.make("THRESHOLD", create {ETF_INTERVAL_PARAM}.make(1, 101)), "b_threshold")
			test_param_types.extend (create {ETF_NAMED_PARAM_TYPE}.make("THRESHOLD", create {ETF_INTERVAL_PARAM}.make(1, 101)), "p_threshold")
			Result.extend (test_param_types, "test")
			create play_param_types.make (10)
			play_param_types.compare_objects
			Result.extend (play_param_types, "play")
			create abort_param_types.make (10)
			abort_param_types.compare_objects
			Result.extend (abort_param_types, "abort")
			create move_param_types.make (10)
			move_param_types.compare_objects
			move_param_types.extend (create {ETF_NAMED_PARAM_TYPE}.make("DIRECTION", create {ETF_ENUM_PARAM}.make(<<"N", "NE", "E", "SE", "S", "SW", "W", "NW">>)), "dir")
			Result.extend (move_param_types, "move")
			create land_param_types.make (10)
			land_param_types.compare_objects
			Result.extend (land_param_types, "land")
			create liftoff_param_types.make (10)
			liftoff_param_types.compare_objects
			Result.extend (liftoff_param_types, "liftoff")
			create pass_param_types.make (10)
			pass_param_types.compare_objects
			Result.extend (pass_param_types, "pass")
			create wormhole_param_types.make (10)
			wormhole_param_types.compare_objects
			Result.extend (wormhole_param_types, "wormhole")
			create status_param_types.make (10)
			status_param_types.compare_objects
			Result.extend (status_param_types, "status")
		end
feature -- query on declarations of event parameters
	evt_param_types_list : HASH_TABLE[LINKED_LIST[ETF_PARAM_TYPE], STRING]
		local
			test_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			play_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			abort_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			move_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			land_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			liftoff_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			pass_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			wormhole_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			status_param_types: LINKED_LIST[ETF_PARAM_TYPE]
		do
			create Result.make (10)
			Result.compare_objects
			create test_param_types.make
			test_param_types.compare_objects
			test_param_types.extend (create {ETF_NAMED_PARAM_TYPE}.make("THRESHOLD", create {ETF_INTERVAL_PARAM}.make(1, 101)))
			test_param_types.extend (create {ETF_NAMED_PARAM_TYPE}.make("THRESHOLD", create {ETF_INTERVAL_PARAM}.make(1, 101)))
			test_param_types.extend (create {ETF_NAMED_PARAM_TYPE}.make("THRESHOLD", create {ETF_INTERVAL_PARAM}.make(1, 101)))
			test_param_types.extend (create {ETF_NAMED_PARAM_TYPE}.make("THRESHOLD", create {ETF_INTERVAL_PARAM}.make(1, 101)))
			test_param_types.extend (create {ETF_NAMED_PARAM_TYPE}.make("THRESHOLD", create {ETF_INTERVAL_PARAM}.make(1, 101)))
			Result.extend (test_param_types, "test")
			create play_param_types.make
			play_param_types.compare_objects
			Result.extend (play_param_types, "play")
			create abort_param_types.make
			abort_param_types.compare_objects
			Result.extend (abort_param_types, "abort")
			create move_param_types.make
			move_param_types.compare_objects
			move_param_types.extend (create {ETF_NAMED_PARAM_TYPE}.make("DIRECTION", create {ETF_ENUM_PARAM}.make(<<"N", "NE", "E", "SE", "S", "SW", "W", "NW">>)))
			Result.extend (move_param_types, "move")
			create land_param_types.make
			land_param_types.compare_objects
			Result.extend (land_param_types, "land")
			create liftoff_param_types.make
			liftoff_param_types.compare_objects
			Result.extend (liftoff_param_types, "liftoff")
			create pass_param_types.make
			pass_param_types.compare_objects
			Result.extend (pass_param_types, "pass")
			create wormhole_param_types.make
			wormhole_param_types.compare_objects
			Result.extend (wormhole_param_types, "wormhole")
			create status_param_types.make
			status_param_types.compare_objects
			Result.extend (status_param_types, "status")
		end
feature -- comments for contracts
	comment(etf_s: STRING): BOOLEAN
		do
			Result := TRUE
		end
end