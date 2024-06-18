// This program was cloned from: https://github.com/buttercutter/DDR
// License: GNU General Public License v3.0

// Credits to:
// https://github.com/jbush001/NyuziProcessor/blob/master/hardware/fpga/common/async_fifo.sv
// https://github.com/ZipCPU/website/blob/master/examples/afifo.v
//
// Copyright 2011-2015 Jeff Bush
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

//
// Asynchronous FIFO, with two clock domains
// reset is asynchronous and is synchronized to each clock domain
// internally.
// NUM_ENTRIES must be >= 2
//

//`default_nettype none


`ifdef FORMAL
	// for writing and reading 2 different values into 2 different FIFO entry locations
	`define ENABLE_TWIN_WRITE_TEST 1
`endif


// enables this setting if the asynchronous FIFO has non-power-of-two of location entries
// However, this settings might cause STA setup issue in write clock domain
// given the extra tcomb for manual rollover logic and gray2bin logic for 'full' detection
//`define NUM_ENTRIES_IS_NON_POWER_OF_TWO 1

// enables this setting if it improves STA setup timing violations in read clock domain
// the performance may vary across different user design and different EDA STA engines
`define REGISTER_RETIMING_FOR_READ_DATA 1


module async_fifo
    #(
    	`ifdef FORMAL
    				
			`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
				parameter NUM_ENTRIES = 10,  // for checking using non-power-of-two values
			`else
				parameter NUM_ENTRIES = 8,
			`endif
			
			parameter WIDTH = $clog2(NUM_ENTRIES << 1),  // index as data for loop testing
		`else
		
			`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
				parameter NUM_ENTRIES = 10,  // for checking using non-power-of-two values
			`else
				parameter NUM_ENTRIES = 4,
			`endif
			
			parameter WIDTH = 32,
		`endif

		// The following 2 simplification tricks are devised such that we do not need the
		// extra few clock cycles delay arising from the use of FF synchronizers for
		// write_ptr_sync and read_ptr_sync signals which are used in the computation
		// logic for 'empty' and 'full' respectively.
		// This will help to speed up the read and write pipeline.

		// To simplify 'full' logic with all the following criteria fulfilled:
		// 1. read clock has the same or higher frequency than write clock
		// 2. read_en is asserted forever
		parameter TO_SIMPLIFY_FULL_LOGIC = 0,
		
		// To simplify 'empty' logic with all the following criteria fulfilled:
		// 1. read clock and write clock have same frequency, OR 
		//    frequency ratio between read clock and write clock is an integer (freq_ratio), 
		//    with NUM_ENTRIES = freq_ratio
		// 2. read clock and write clock with different phase shift must pass STA timing check 
		//    after this option is enabled.
		// 3. read_en and write_en are asserted forever
		parameter TO_SIMPLIFY_EMPTY_LOGIC = 0		
    )

    (input                  write_reset,
     input					read_reset,

    // Read.
    input                   read_clk,
    input                   read_en,
    output reg [WIDTH - 1:0]    read_data,
    output 		            empty,

    // Write
    input                   write_clk,
    input                   write_en,
    output		            full,
    input [WIDTH - 1:0]     write_data);


    parameter ADDR_WIDTH = $clog2(NUM_ENTRIES);

	`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
	
		parameter POINTER_WIDTH = ADDR_WIDTH-1;  // no need for MSB flipping to signal rollover 
	`else
		parameter POINTER_WIDTH = ADDR_WIDTH;
	`endif


    wire [POINTER_WIDTH:0] write_ptr_sync;
    reg  [POINTER_WIDTH:0] read_ptr;
    reg  [POINTER_WIDTH:0] read_ptr_gray;
    reg  [POINTER_WIDTH:0] read_ptr_nxt;
    wire [POINTER_WIDTH:0] read_ptr_gray_nxt;
    wire reset_rsync;
    
    wire [POINTER_WIDTH:0] read_ptr_sync;
    reg  [POINTER_WIDTH:0] write_ptr;
    reg  [POINTER_WIDTH:0] write_ptr_gray;
    reg  [POINTER_WIDTH:0] write_ptr_nxt;
    wire [POINTER_WIDTH:0] write_ptr_gray_nxt;
    wire reset_wsync;
    
    reg [WIDTH - 1:0] fifo_data[0:NUM_ENTRIES - 1];


	`ifdef FORMAL
		// just for easier debugging
	
		initial read_ptr = 0;
		initial write_ptr = 0;
		initial read_ptr_gray = 0;
		initial write_ptr_gray = 0;
		initial assume(read_en == 0);
		initial assume(write_en == 0);	
	
		genvar fifo_entry_index;
		generate
			for (fifo_entry_index=0; fifo_entry_index<NUM_ENTRIES; fifo_entry_index++)
			begin
				initial fifo_data[fifo_entry_index] <= {WIDTH{1'b0}};
			end 
		endgenerate
	`endif


	// Gray code encoding
	// Decimal	|	Gray Code	|	Binary
	// 0		|	0000		|	0000
	// 1		|	0001		|	0001	
	// 2		|	0011		|	0010
	// 3		|	0010		|	0011
	// 4		|	0110		|	0100
	// 5		|	0111		|	0101	
	// 6		|	0101		|	0110
	// 7		|	0100		|	0111
	// 8		|	1100		|	1000
	// 9		|	1101		|	1001	
	// 10		|	1111		|	1010
	// 11		|	1110		|	1011
	// 12		|	1010		|	1100
	// 13		|	1011		|	1101	
	// 14		|	1001		|	1110
	// 15		|	1000		|	1111	
		
	// Due to strict CDC synchronization rule with multi-bits gray-coded signal,
	// the 'read_ptr_gray' and 'write_ptr_gray' signals must have proper rollover.
	// This phenomenon becomes evident whenever 'NUM_ENTRIES' is not of power of two. 
	// For example when 'NUM_ENTRIES' = 10 , we cannot use 'b0000 and 'b1001 as start and end
	// pointer positions respectively, and we need to do address pointers rollover (wrap around)
	// from end position back to the start position for the gray-coded pointers.
	
	// The issue is that there are 2 bits changes between 'b0000 and 'b1001 during rollover
	// which violates the multi-bits CDC synchronization rule.
	// The solution to above mentioned CDC issue is to ensure that there is only one bit
	// changing when wrapping around.
	
	// If we want 10 entries, we need to remove (or subtract) 6 from 16. 
	// Remove codes in pairs, one from top and one from bottom. 
	// If we do that, we will end up with codes that wraparound with only a single bit changing.
	// And therefore we cannot get an afifo design with an odd number of entries.
	
	// 10 is 6 short of 16. Divide it as 3 on top and 3 below.
	// So for 10, we run it from 3 to 12
	
	`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
		`ifdef FORMAL
			// for easier waveform debugging
			(* keep *)
		`endif
		localparam [POINTER_WIDTH:0] UPPER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER = 
					{ADDR_WIDTH{1'b1}} - (({ADDR_WIDTH{1'b1}} + 1'b1 - NUM_ENTRIES[POINTER_WIDTH:0]) >> 1);

		`ifdef FORMAL
			// for easier waveform debugging
			(* keep *)
		`endif						
		localparam [POINTER_WIDTH:0] LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER =
					UPPER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER - NUM_ENTRIES[POINTER_WIDTH:0] + 1;
	`endif
	

    always @(*) 
    begin
    	`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
    	
			if(read_ptr == UPPER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER)
			begin 
				read_ptr_nxt = LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER;  // needs manual rollover
			end

			else read_ptr_nxt = read_ptr + 1;  // no need manual rollover
			
		`else	
			read_ptr_nxt = read_ptr + 1;  // no need manual rollover
		`endif
    end
        
    always @(*) 
    begin
    	`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
    	
			if(write_ptr == UPPER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER)
			begin 
				write_ptr_nxt = LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER;  // needs manual rollover
			end
			
			else write_ptr_nxt = write_ptr + 1;  // no need manual rollover
			
		`else	
			write_ptr_nxt = write_ptr + 1;  // no need manual rollover
		`endif
    end
    
    assign read_ptr_gray_nxt = read_ptr_nxt ^ (read_ptr_nxt >> 1);
    assign write_ptr_gray_nxt = write_ptr_nxt ^ (write_ptr_nxt >> 1);

    //
    // Read clock domain
    //
    synchronizer #(.WIDTH(POINTER_WIDTH+1)) write_ptr_synchronizer(
        .clk(read_clk),
        .reset(reset_rsync),
        .data_o(write_ptr_sync),
        .data_i(write_ptr_gray));

	generate
		if(TO_SIMPLIFY_EMPTY_LOGIC)
			assign empty = 0;
		
		else assign empty = write_ptr_sync == read_ptr_gray;
	endgenerate
	
	// For further info on reset synchronizer, see 
	// https://www.youtube.com/watch?v=mYSEVdUPvD8 and
	// http://zipcpu.com/formal/2018/04/12/areset.html

    synchronizer #(.RESET_STATE(1)) read_reset_synchronizer(
        .clk(read_clk),
        .reset(read_reset),
        .data_i(1'b0),
        .data_o(reset_rsync));

	generate
		always @(posedge read_clk)
		begin
		    if (reset_rsync)
		    begin
		    	`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
		    	
			        read_ptr <= LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER;
			    `else
			    	read_ptr <= 0;
			    `endif
			    
		        read_ptr_gray <= 0;
		    end
		    
		    else if (read_en && !empty)
		    begin        	
		        if(TO_SIMPLIFY_EMPTY_LOGIC) read_ptr <= write_ptr;
		        
		        else read_ptr <= read_ptr_nxt;        
		        
		        read_ptr_gray <= read_ptr_gray_nxt;
		    end
		end
	endgenerate

	`ifdef REGISTER_RETIMING_FOR_READ_DATA
	
		reg [WIDTH - 1:0] previous_read_data;
		always @(posedge read_clk) read_data <= previous_read_data;  // register retiming technique for STA setup
	
		//assign read_data = fifo_data[read_ptr[ADDR_WIDTH-1:0]];  // passed verilator Warning-WIDTH
		// See https://www.edaboard.com/threads/asychronous-fifo-read_data-is-not-entirely-in-phase-with-read_ptr.400461/
		always @(posedge read_clk)
		begin
			`ifdef FORMAL
			if(reset_rsync) previous_read_data <= 0;
		
			else 
			`endif
			
			`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
			
				if(read_en && !empty) 
				begin
					previous_read_data <= fifo_data[read_ptr - LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER];
				end
			
			`else
			
				if(read_en && !empty) 
				begin
					previous_read_data <= fifo_data[read_ptr[ADDR_WIDTH-1:0]];  // passed verilator Warning-WIDTH
				end			
			
			`endif
		end
		
	`else
	
		//assign read_data = fifo_data[read_ptr[ADDR_WIDTH-1:0]];  // passed verilator Warning-WIDTH
		// See https://www.edaboard.com/threads/asychronous-fifo-read_data-is-not-entirely-in-phase-with-read_ptr.400461/
		always @(posedge read_clk)
		begin
			`ifdef FORMAL
			if(reset_rsync) read_data <= 0;
		
			else 
			`endif
			
			`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
			
				if(read_en && !empty) 
				begin
					read_data <= fifo_data[read_ptr - LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER];
				end
			
			`else
			
				if(read_en && !empty) 
				begin
					read_data <= fifo_data[read_ptr[ADDR_WIDTH-1:0]];  // passed verilator Warning-WIDTH
				end			
			
			`endif
		end
			
	`endif


`ifdef FORMAL

    always @(posedge read_clk)
    begin
    	if(first_read_clock_had_passed)
    	begin
		    if ($past(reset_rsync))
		    begin
		    	`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
		    	
			        assert(read_ptr == LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER);
			    `else
			    	assert(read_ptr == 0);
			    `endif
			    
		        assert(read_ptr_gray == 0);
		    end
		    
		    else if ($past(read_en) && !$past(empty))
		    begin
		        assert(read_ptr == $past(read_ptr_nxt));
		        assert(read_ptr_gray == $past(read_ptr_gray_nxt));
		        
				`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO

					`ifdef REGISTER_RETIMING_FOR_READ_DATA					
						assert(previous_read_data == 
					`else
						assert(read_data ==
					`endif
							fifo_data[$past(read_ptr) -
							 			LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER]);
				
					if($past(read_ptr) == UPPER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER)
					begin 
						assert(read_ptr == LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER);  // needs manual rollover
					end

					else assert(read_ptr == $past(read_ptr) + 1);  // no need manual rollover
					
				`else
					`ifdef REGISTER_RETIMING_FOR_READ_DATA					
						assert(previous_read_data == 
					`else
						assert(read_data ==
					`endif
							fifo_data[$past(read_ptr[ADDR_WIDTH-1:0]]));  // passed verilator Warning-WIDTH					
					assert(read_ptr == $past(read_ptr) + 1);  // no need manual rollover
				`endif
									        
		    end
		end
    end

`endif

	
    //
    // Write clock domain
    //
    synchronizer #(.WIDTH(POINTER_WIDTH+1)) read_ptr_synchronizer(
        .clk(write_clk),
        .reset(reset_wsync),
        .data_o(read_ptr_sync),
        .data_i(read_ptr_gray));

	generate
		if(TO_SIMPLIFY_FULL_LOGIC)
			// compensates for the delay in synchronizer chain which results in false-positive full detection
			// STA setup issue in read clock domain is solved by choosing not to increase NUM_ENTRIES when full logic
			// is now correctly implemented for certain corner simulation coverage case, 
			// taking into account the cycles delay brought by the 'read_ptr_synchronizer' synchronizer chain.
			assign full = 0;
		
		else begin
			`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO

				// compares pointers in binary because no simple logic to do arithmetic with gray codes
				wire [POINTER_WIDTH:0] read_ptr_sync_in_binary;

				generate genvar bin_i;
					for (bin_i=0; bin_i<=POINTER_WIDTH; bin_i=bin_i+1) begin : gray_to_binary
					
						assign read_ptr_sync_in_binary[bin_i] = 
										^read_ptr_sync[POINTER_WIDTH:bin_i];
					end
				endgenerate
			
				// We cannot use MSB. We have to check whether the pointers are in different halves.
				// Run the pointers to 2x depth like before. 
				// And full when wr ptr = rd ptr + depth. Adjust for wrap around etc.
				
				assign full = (write_ptr == read_ptr_sync_in_binary + NUM_ENTRIES[POINTER_WIDTH:0] - 1);
				
			`else
				// See https://electronics.stackexchange.com/questions/596233/address-rollover-for-asynchronous-fifo
				// and http://www.sunburst-design.com/papers/CummingsSNUG2002SJ_FIFO1.pdf#page=19
				// if observed carefully, the following 'full' logic managed to get around the
				// under-utilization of 1 fifo entry experienced by the sunburst document.
			
				assign full = (write_ptr_gray == {~read_ptr_sync[ADDR_WIDTH:ADDR_WIDTH-1], 
												   read_ptr_sync[0 +: (ADDR_WIDTH-1)]});			
			`endif
		end
    endgenerate

    synchronizer #(.RESET_STATE(1)) write_reset_synchronizer(
        .clk(write_clk),
        .reset(write_reset),
        .data_i(1'b0),
        .data_o(reset_wsync));

	`ifdef FORMAL
	integer i;
	`endif

    always @(posedge write_clk)
    begin
        if (reset_wsync)
        begin
            `ifdef FORMAL
		        for (i=0; i<NUM_ENTRIES; i++)
				begin
					fifo_data[i] <= {WIDTH{1'b0}};
				end    
            `endif

			`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
			
				write_ptr <= LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER;
			`else
            	write_ptr <= 0;
            `endif
            
            write_ptr_gray <= 0;
        end
        
        else if (write_en && !full)
        begin
        	`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
        	
	            fifo_data[write_ptr - LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER] <= write_data;
	            
	        `else
	        	fifo_data[write_ptr[ADDR_WIDTH-1:0]] <= write_data;  // passed verilator Warning-WIDTH
	        `endif
	        
            write_ptr <= write_ptr_nxt;
            write_ptr_gray <= write_ptr_gray_nxt;
        end
    end

`ifdef FORMAL

    always @(posedge write_clk)
    begin
    	if(first_write_clock_had_passed)
    	begin
		    if ($past(reset_wsync))
		    begin
				`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
				
					assert(write_ptr == LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER);
				`else
		        	assert(write_ptr == 0);
		        `endif
		        
		        assert(write_ptr_gray == 0);
		    end
		    
		    else if ($past(write_en) && !$past(full))
		    begin
		    	`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
		    	
			        assert(fifo_data[$past(write_ptr) -
			         	   LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER] == $past(write_data));
			        
			    `else
			    	assert(fifo_data[$past(write_ptr[ADDR_WIDTH-1:0])] ==
			    	 	   $past(write_data));  // passed verilator Warning-WIDTH
			    `endif
			    
		        assert(write_ptr == $past(write_ptr_nxt));
		        assert(write_ptr_gray == $past(write_ptr_gray_nxt));
		        
				`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
				
					if($past(write_ptr) == UPPER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER)
					begin 
						assert(write_ptr == LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER);  // needs manual rollover
					end
					
					else assert(write_ptr == $past(write_ptr) + 1);  // no need manual rollover
					
				`else	
					assert(write_ptr == $past(write_ptr) + 1);  // no need manual rollover
				`endif		        
		    end
		end
    end

`endif


/*See https://zipcpu.com/blog/2018/07/06/afifo.html for a formal proof of afifo in general*/

`ifdef FORMAL

	reg first_clock_had_passed;
	reg first_write_clock_had_passed;
	reg first_read_clock_had_passed;

	initial first_clock_had_passed = 0;
	initial first_write_clock_had_passed = 0;
	initial first_read_clock_had_passed = 0;

	always @($global_clock)
		first_clock_had_passed <= 1;	

	// to ensure proper initial reset
	initial assume(write_clk == 0); 
	initial assume(read_clk == 0);

	always @(posedge write_clk)
		first_write_clock_had_passed <= first_clock_had_passed;

	always @(posedge read_clk)
		first_read_clock_had_passed <= first_clock_had_passed;

	always @($global_clock)
	begin
		if(first_clock_had_passed)
		begin
			if($rose(write_clk))
				assert(first_write_clock_had_passed == $past(first_clock_had_passed));

			if($rose(read_clk))
				assert(first_read_clock_had_passed == $past(first_clock_had_passed));
		end
		
		else begin
			assert(first_write_clock_had_passed == 0);
			assert(first_read_clock_had_passed == 0);
		end
	end
	
	//always @($global_clock)
		//assert($rose(reset_wsync)==$rose(reset_rsync));  // comment this out for experiment
/*
	always @($global_clock) 
	begin
		if(first_write_clock_had_passed && first_read_clock_had_passed)
			assert(~empty || ~full);  // ensures that only one condition is satisfied
	end
*/
	initial assume(write_reset);
	initial assume(read_reset);
	//always @($global_clock) 
	//	assume(write_reset == read_reset);  // these are system-wide reset signals affecting all clock domains
	
	initial assume(empty);
	initial assume(!full);

	reg reset_rsync_is_done;
	initial reset_rsync_is_done = 0;
	initial assert(reset_rsync == 0);	

    always @(posedge read_clk)
    begin
    	if (read_reset) reset_rsync_is_done <= 0;
    
        else if (reset_rsync) reset_rsync_is_done <= 1;
    end

	always @($global_clock) if(~first_read_clock_had_passed) assert(~reset_rsync_is_done);

    always @(posedge read_clk)
    begin
    	if(first_read_clock_had_passed)
    	begin
			if ($past(read_reset)) assert(reset_rsync_is_done == 0);
		
		    else if ($past(reset_rsync)) assert(reset_rsync_is_done == 1);
		    
		    else assert(reset_rsync_is_done == $past(reset_rsync_is_done));
		end
		
		else assert(reset_rsync_is_done == 0);
    end

	reg reset_wsync_is_done;
	initial reset_wsync_is_done = 0;	
	initial assert(reset_wsync == 0);	

    always @(posedge write_clk)
    begin
    	if (write_reset) reset_wsync_is_done <= 0;
    
        else if (reset_wsync) reset_wsync_is_done <= 1;
    end

	always @($global_clock) if(~first_write_clock_had_passed) assert(~reset_wsync_is_done);
	
    always @(posedge write_clk)
    begin
    	if(first_write_clock_had_passed)
    	begin
			if ($past(write_reset)) assert(reset_wsync_is_done == 0);
		
		    else if ($past(reset_wsync)) assert(reset_wsync_is_done == 1);
		end
		
		else assert(reset_wsync_is_done == 0);
    end	
    
	always @($global_clock)
	begin
		if (first_clock_had_passed)
		begin
			if($past(reset_wsync) && ($rose(write_clk)))
			begin
				assert(write_ptr == LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER);
				assert(write_ptr_gray == 0);
			end

			else if (!$rose(write_clk))
			begin
				assume($stable(write_reset));
				assume($stable(write_en));
				assume($stable(write_data));
			end		
			
			if($past(reset_rsync) && ($rose(read_clk)))
			begin
				assert(read_ptr == LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER);
				assert(read_ptr_gray == 0);
				assert(read_data == 0);
				assert(empty);
			end	

			else if (!$rose(read_clk))
			begin
				assume($stable(read_reset));
				assume($stable(read_en));
				assert(empty == (write_ptr_sync == read_ptr_gray));
				
				if(!reset_wsync && !$rose(write_clk) && !write_en) assert($stable(read_data));				
			end						
		end
	end
	
	always @(posedge write_clk)
	begin
		if(reset_wsync_is_done) assume(write_data != 0);  // for easier debugging
	end
	
`endif

/*The following is a fractional clock divider code*/

`ifdef FORMAL

	/*
	if f_wclk_step and f_rclk_step have different value, how do the code guarantee that it will still generate two different clocks, both with 50% duty cycle ?
	This is a fundamental oscillator generation technique.
	Imagine a table, indexed from 0 to 2^N-1, filled with a square wave
	If you stepped through that table one at a time, and did a lookup, the output would be a square wave
	If you stepped through it two at a time--same thing
	Indeed, you might imagine the square wave going on for infinity as the table replicates itself time after time, and that the N bits used to index it are only the bottom N--the top bits index which table--but they become irrelevant since we are only looking for a repeating waveform
	Hence, no matter how fast you step as long as it is less than 2^(N-1), you'll always get a square wave

	http://zipcpu.com/blog/2017/06/02/generating-timing.html
	http://zipcpu.com/dsp/2017/07/11/simplest-sinewave-generator.html
	http://zipcpu.com/dsp/2017/12/09/nco.html
	*/	

	localparam	F_CLKBITS=5;
	wire	[F_CLKBITS-1:0]	f_wclk_step, f_rclk_step;

	assign	f_wclk_step = $anyconst;
	assign	f_rclk_step = $anyconst;

	always @(*)
		assume(f_wclk_step != 0);
	always @(*)
		assume(f_rclk_step != 0);
	always @(*)
		assume(f_rclk_step != f_wclk_step); // so that we have two different clock speed
		
	reg	[F_CLKBITS-1:0]	f_wclk_count, f_rclk_count;

	always @($global_clock)
		f_wclk_count <= f_wclk_count + f_wclk_step;
	always @($global_clock)
		f_rclk_count <= f_rclk_count + f_rclk_step;

	always @(*)
	begin
		assume(write_clk == gclk_w);
		assume(read_clk == gclk_r);
		cover(write_clk);
		cover(read_clk);
	end

	wire gclk_w, gclk_r;
	wire enable_in_w, enable_in_r;

	assign enable_in_w = $anyseq;
	assign enable_in_r = $anyseq;

	clock_gate cg_w (.gclk(gclk_w), .clk(f_wclk_count[F_CLKBITS-1]), .enable_in(enable_in_w));

	clock_gate cg_r (.gclk(gclk_r), .clk(f_rclk_count[F_CLKBITS-1]), .enable_in(enable_in_r));

`endif

	
`ifdef FORMAL
	
	/* twin-write test */
	// write two pieces of different data into the asynchronous fifo
	// then read them back from the asynchronous fifo
	
	wire [WIDTH - 1:0] first_data;
	wire [WIDTH - 1:0] second_data;
	
	assign first_data = $anyconst;
	assign second_data = $anyconst;
	
	reg first_data_is_written;
	reg first_data_is_read;
	reg second_data_is_written;
	reg second_data_is_read;
	
	initial first_data_is_read = 0;
	initial second_data_is_read = 0;
	initial first_data_is_written = 0;
	initial second_data_is_written = 0;
	
	// just for easier tracking and debugging
	always @(*) assume(first_data > (NUM_ENTRIES << 1));
	always @(*) assume(second_data > (NUM_ENTRIES << 1));
	always @(*) assume(first_data != second_data);

	reg [POINTER_WIDTH:0] first_address;
	reg [POINTER_WIDTH:0] second_address;
	
	initial first_address = 0;
	initial second_address = 1;
	
	always @(posedge write_clk) assume(first_address < NUM_ENTRIES);
	always @(posedge write_clk) assume(second_address < NUM_ENTRIES);
	always @(posedge write_clk) assume(first_address != second_address);
	
		
	always @(posedge write_clk)
	begin
		if(reset_wsync || ~reset_wsync_is_done)
		begin
			first_data_is_written <= 0;
			second_data_is_written <= 0;
		end
	
		else if(write_en && !full && !first_data_is_written && !second_data_is_written)
		begin
			assume(write_data == first_data);
			first_data_is_written <= 1;
			
			`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
				
				first_address <= write_ptr - LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER;
			`else
				first_address <= write_ptr;
			`endif
		end
		
		else if(write_en && !full && first_data_is_written && !second_data_is_written)
		begin
			assume(write_data == second_data);
			second_data_is_written <= 1;
			
			`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
			
				second_address <= write_ptr - LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER;	
			`else
				second_address <= write_ptr;
			`endif
		end
	end

	always @(*)
	begin
		if(~first_write_clock_had_passed)
		begin
			assert(first_data_is_written == 0);
			assert(second_data_is_written == 0);
		end
		
		if(~first_read_clock_had_passed)
		begin
			assert(first_data_is_read == 0);
			assert(second_data_is_read == 0);		
		end		
	end

	always @(posedge write_clk)
	begin
		if(first_write_clock_had_passed)
		begin
			if($past(reset_wsync) || ~$past(reset_wsync_is_done))
			begin
				assert(first_data_is_written == 0);
				assert(second_data_is_written == 0);
			end
			
			else begin
			
				if($past(write_en) && !$past(full) && !$past(first_data_is_written) && !$past(second_data_is_written))
				begin
					assert(first_data_is_written == 1);
					assert(second_data_is_written == 0);
					assert(first_data_is_read == 0);	
					assert(second_data_is_read == 0);
					
					`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
					
						assert(first_address == $past(write_ptr) - LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER);
					`else
						assert(first_address == $past(write_ptr));
					`endif
					
					assert($past(first_data) == fifo_data[first_address]);
				end
				
				else if($past(write_en) && !$past(full) && $past(first_data_is_written) && !$past(second_data_is_written))
				begin
					assert(first_data_is_written == 1);
					assert(second_data_is_written == 1);
					
					`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
					
						assert(second_address == $past(write_ptr)- LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER);	
					`else
						assert(second_address == $past(write_ptr));
					`endif
					
					assert($past(second_data) == fifo_data[second_address]);
				end
				
				else begin
					if(second_data_is_written) assert(first_data_is_written);
					
					else begin
						assert(~second_data_is_written);
						assert(first_data_is_written == $past(first_data_is_written));
					end
					
					if(~first_data_is_written) assert(~second_data_is_written);
					
					else begin
						assert(first_data_is_written);
						assert(second_data_is_written == $past(second_data_is_written));
					end
				end
			end
		end
		
		else begin
			assert(first_data_is_written == 0);
			assert(second_data_is_written == 0);
		end
	end
	

	reg [WIDTH - 1:0] first_data_read_out;
	reg [WIDTH - 1:0] second_data_read_out;
	
	initial first_data_is_read = 0;
	initial second_data_is_read = 0;

	always @(posedge read_clk)
	begin
		if(reset_rsync || ~reset_rsync_is_done)
		begin  
			first_data_read_out <= 0;
			second_data_read_out <= 0;
			first_data_is_read <= 0;
			second_data_is_read <= 0;
		end

		`ifdef ENABLE_TWIN_WRITE_TEST	
		
			else if(read_en && !empty && first_data_is_written && !first_data_is_read && !second_data_is_read)
			begin
				first_data_read_out <= read_data;
				first_data_is_read <= 1;	
			end
			
			else if(read_en && !empty && first_data_is_written && first_data_is_read && second_data_is_written && !second_data_is_read)
			begin
				second_data_read_out <= read_data;
				second_data_is_read <= 1;	
			end
			
		`else
			else begin
				first_data_read_out <= read_data;
				second_data_read_out <= read_data;
				first_data_is_read <= 1;
				second_data_is_read <= 1;
			end
		`endif
	end

	always @(posedge read_clk)
	begin
		if(first_read_clock_had_passed)
		begin
			if($past(reset_rsync) || ~$past(reset_rsync_is_done))
			begin
				assert(first_data_is_read == 0);
				assert(second_data_is_read == 0);
			end

			`ifdef ENABLE_TWIN_WRITE_TEST
			
				else if($past(read_en) && !$past(empty) && $past(first_data_is_written) && !$past(first_data_is_read) && !$past(second_data_is_read))
				begin
					assert(first_data_read_out == $past(read_data));				
					assert(first_data_is_read == 1);
					assert(second_data_is_read == 0);	
				end
				
				else if($past(read_en) && !$past(empty) && $past(first_data_is_written) && $past(first_data_is_read) && $past(second_data_is_written) && !$past(second_data_is_read))
				begin
					assert(second_data_read_out == $past(read_data));
					assert(second_data_is_read == 1);
					assert(first_data_is_read == 1);
				end
				
				else begin
					assert($stable(first_data_read_out));				
					assert($stable(first_data_is_read));	
					assert($stable(second_data_read_out));
					assert($stable(second_data_is_read));
					
					if(second_data_is_read) assert(first_data_is_read);
					
					else begin
						assert(~second_data_is_read);
						assert(first_data_is_read == $past(first_data_is_read));
					end
					
					if(~first_data_is_read) assert(~second_data_is_read);
					
					else begin
						assert(first_data_is_read);
						assert(second_data_is_read == $past(second_data_is_read));
					end
				end				
				
			`else
				else begin
					assert(first_data_read_out == $past(read_data));				
					assert(first_data_is_read == 1);	
					assert(second_data_read_out == $past(read_data));
					assert(second_data_is_read == 1);	
													
					assert($stable(second_data_read_out));
					assert($stable(second_data_is_read));					
				end
			`endif
		end
		
		else begin
			assert(first_data_is_read == 0);
			assert(second_data_is_read == 0);
		end
	end

`endif

`ifdef FORMAL
	// mechanism needed for 'full' and 'empty' coverage check
	
	// writes to FIFO for many clock cycles, then
	// read from FIFO for many clock cycles
	
	// for this particular test, we need NUM_ENTRIES to be power of 2 
	// since address rollover (MSB flipping) mechanism is used to check whether 
	// every FIFO entries had been visited at least twice
	localparam CYCLES_FOR_FULL_EMPTY_CHECK = NUM_ENTRIES; 
	
	reg [$clog2(CYCLES_FOR_FULL_EMPTY_CHECK):0] previous_write_counter_loop_around_fifo;
	reg [$clog2(CYCLES_FOR_FULL_EMPTY_CHECK):0] previous_read_counter_loop_around_fifo;	

	initial previous_write_counter_loop_around_fifo = 0;
	initial previous_read_counter_loop_around_fifo = 0;
	
	always @(posedge write_clk)
	begin
		if(reset_wsync_is_done) 
			previous_write_counter_loop_around_fifo <= write_ptr;
	end

	always @(posedge read_clk)
	begin
		if(reset_rsync_is_done) 
			previous_read_counter_loop_around_fifo <= read_ptr;
	end

	
	// initially no testing
	reg test_write_en;
	reg test_read_en;	
	initial test_write_en = 0;
	initial test_read_en = 0;
	
	reg [$clog2(CYCLES_FOR_FULL_EMPTY_CHECK):0] test_write_data;

	wire finished_loop_writing;
	reg finished_loop_writing_previously;
	initial finished_loop_writing_previously = 0;

	always @(posedge write_clk) 
	begin
		if(reset_wsync) finished_loop_writing_previously <= 0;
	
		else finished_loop_writing_previously <= finished_loop_writing;
	end
		
	assign finished_loop_writing = (~finished_loop_writing_previously) &&  // to make this a single clock pulse
				`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
				
					// every FIFO entries had been visited once in each loop iteration
					((previous_write_counter_loop_around_fifo == UPPER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER) && 
					 (write_ptr == LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER));
					 
				`else
				
					// every FIFO entries had been visited once in each loop iteration
					((previous_write_counter_loop_around_fifo == (NUM_ENTRIES-1)) && 
					 (write_ptr == 0));				
					 
				`endif


	wire test_write_enable = $anyseq;  // for synchronizing both 'test_write_en' and 'test_write_data' signals
	
	always @(posedge write_clk)
	begin
		if(reset_wsync || (num_of_loop_tests_done == TOTAL_NUM_OF_LOOP_TESTS))
		begin
			test_write_en <= 0;
			test_write_data <= 0;
		end
		
		else if(second_data_is_read)  // starts after twin-write test
		begin
			test_write_en <= test_write_enable;
			
			// for easy tracking on write test progress
			test_write_data <= test_write_data + (!full && test_write_enable);
		end
		
		else test_write_en <= 0;
	end

	wire finished_loop_reading;
	reg finished_loop_reading_previously;
	initial finished_loop_reading_previously = 0;

	always @(posedge read_clk) 
	begin
		if(reset_rsync) finished_loop_reading_previously <= 0;
	
		else finished_loop_reading_previously <= finished_loop_reading;
	end

	assign finished_loop_reading = (~finished_loop_reading_previously) &&  // to make this a single clock pulse
				`ifdef NUM_ENTRIES_IS_NON_POWER_OF_TWO
				
					// every FIFO entries had been visited once in each loop iteration
					((previous_read_counter_loop_around_fifo == UPPER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER) && 
					 (read_ptr == LOWER_BINARY_LIMIT_FOR_GRAY_POINTER_ROLLOVER));
					 
				`else
				
					// every FIFO entries had been visited once in each loop iteration
					((previous_read_counter_loop_around_fifo == (NUM_ENTRIES-1)) && 
					 (read_ptr == 0));				
					 
				`endif

	always @(posedge read_clk)
	begin
		if(reset_rsync || finished_loop_reading)
		begin
			test_read_en <= 0;
		end
		
		else if(second_data_is_read)  // starts after twin-write test
		begin
			test_read_en <= $anyseq;
		end
		
		else test_read_en <= 0;
	end

	reg finished_one_loop_test;
	initial finished_one_loop_test = 0;
	
	always @(posedge read_clk)
	begin
		if(finished_one_loop_test) finished_one_loop_test <= 0;
		
		else if(finished_loop_reading) finished_one_loop_test <= 1;
	end

	localparam TOTAL_NUM_OF_LOOP_TESTS = 2;  // write and read operations occur concurrently for two FIFO loops
	reg [$clog2(TOTAL_NUM_OF_LOOP_TESTS):0] num_of_loop_tests_done;
	initial num_of_loop_tests_done = 0;
	
	always @(posedge read_clk)
	begin
		num_of_loop_tests_done <= num_of_loop_tests_done + (finished_one_loop_test);
	end

	always @(posedge write_clk)
	begin
		if(test_write_en) 
		begin
			assume(write_en);
			assume(write_data == test_write_data);
		end
		
		else if(second_data_is_written)  // after twin-write test, but before full/empty coverage
		begin
			assume(!write_en);
		end
	end

	always @(posedge read_clk)
	begin
		if(test_read_en) assume(read_en);
	end

	always @(*)
	begin
		if(first_clock_had_passed &&  // only initial reset
			(num_of_loop_tests_done <= TOTAL_NUM_OF_LOOP_TESTS))  // another reset after the initial reset
		begin
			assume(!write_reset);
			assume(!read_reset);
		end
	end


	// checks for fifo data integrity across all different scenarios during the loop testing

	generate
		genvar fifo_check_index;
	
		for(fifo_check_index = 0; fifo_check_index < NUM_ENTRIES;
			fifo_check_index = fifo_check_index + 1)
		begin : check_fifo_data_state
			
			always @(posedge write_clk)
			begin
				if(first_write_clock_had_passed) 
				begin					
					if($past(reset_wsync)) 
						// none other than unknown 'X' state
						assert(fifo_data[fifo_check_index] == {WIDTH{1'b0}});
					
					else assert(fifo_data[fifo_check_index] <= {WIDTH{1'b1}});  // don't care
				end
			end			
		end
	endgenerate

	localparam NUM_OF_SYNC_FF = 3;

	always @(posedge read_clk)
	begin
		if(first_read_clock_had_passed)
		begin
			if($past(second_data_is_read))
			begin			
				if(~$past(empty) && ~$past(empty, NUM_OF_SYNC_FF-1) && $past(read_en)) 
				begin
					if(read_data == 1) assert($past(read_data) == second_data);
						
					else assert(read_data == $past(read_data) + 1);
				end
				
				else assert(read_data <= {WIDTH{1'b1}});  // don't care 
			end
		
			else begin
				if(~$past(empty) && $past(read_en)) 
				begin
					if(~$past(first_data_is_read) && $past(first_data_is_read)) 
						assert(read_data > (NUM_ENTRIES << 1));
						
					else assert(read_data <= {WIDTH{1'b1}});  // don't care
				end
				
				else begin
					assert(read_data <= {WIDTH{1'b1}});  // don't care 
				end
			end
		end
	end

`endif


`ifdef FORMAL

	////////////////////////////////////////////////////
	//
	// Some cover statements, to make sure valuable states
	// are even reachable
	//
	////////////////////////////////////////////////////
	//

	// Make sure a reset is possible in either domain
	always @(posedge write_clk)
		cover(first_write_clock_had_passed && write_reset);

	always @(posedge read_clk)
		cover(first_read_clock_had_passed && read_reset);


	always @($global_clock)
	if (first_clock_had_passed && reset_rsync_is_done)
		cover((empty)&&(!$past(empty)));

	always @(*)
	if (first_clock_had_passed && reset_wsync_is_done)
		cover(full);

	always @(posedge write_clk)
	if (first_write_clock_had_passed && reset_wsync_is_done)
		cover((write_en)&&(full));

	always @(posedge write_clk)
	if (first_write_clock_had_passed && reset_wsync_is_done)
		cover($past(full)&&(!full));

	always @(posedge write_clk)
		cover((full)&&(write_en));

	always @(posedge write_clk)
		cover(write_en);

	always @(posedge read_clk)
		cover((empty)&&(read_en));

	always @(posedge read_clk)
	if (first_read_clock_had_passed && reset_rsync_is_done)
		cover($past(!empty)&&($past(read_en))&&(empty));
		
	always @($global_clock)
		cover(first_read_clock_had_passed && (num_of_loop_tests_done == TOTAL_NUM_OF_LOOP_TESTS));
		
`endif

endmodule
