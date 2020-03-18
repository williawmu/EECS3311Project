note
	description: "[
		Starter code to help students generate the initial placement
		of movable and stationary entities in the sectors of a galaxy
		Note: This code is not well-designed, but can be refactored
		in your design. 
	]"
	author: "JSO"
	date: "$Date$"
	revision: "$Revision$"

class
	ROOT

inherit

	ARGUMENTS_32

	ES_SUITE -- testing via ESpec

create
	make

feature {NONE} -- Initialization

    g: GALAXY  -- has access to shared information
    info: SHARED_INFORMATION

    make
            -- Run application.
        local
        	sa: SHARED_INFORMATION_ACCESS -- singleton
        do
        	info := sa.shared_info
            print("This code is creating two boards with different thresholds.%N")

        	--set first threshold
        	info.test(3,5,7,15,30)
         	create g.make
           	print(g.out)
			print("%N")

           	--set second threshold
        	info.test (10, 20, 30, 40, 50)
         	create g.make
           	print(g.out)
           	io.new_line
        end


end
