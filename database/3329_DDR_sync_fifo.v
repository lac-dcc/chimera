// This program was cloned from: https://github.com/buttercutter/DDR
// License: GNU General Public License v3.0

// Credit : https://github.com/jbush001/NyuziProcessor/blob/master/hardware/core/sync_fifo.sv
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
// First-in, first-out queue, with synchronous read/write
// - SIZE DOES NOT need to be a power of two, 
//   but as we interpret the purpose of FIFO usage, SIZE should be as least 2
// - almost_full asserts when there are ALMOST_FULL_THRESHOLD or more entries
//   queued.
// - almost_empty asserts when there are ALMOST_EMPTY_THRESHOLD or fewer
//   entries queued.
// - almost_full is still asserted when full is asserted, as is almost_empty
//   when empty is asserted.
// - flush takes precedence over enqueue/dequeue if it is asserted
//   simultaneously. It is synchronous, unlike reset.
// - It is not legal to assert enqueue when the FIFO is full or dequeue when it
//   is empty (The former is true even if there is a dequeue and enqueue in the
//   same cycle, which wouldn't change the count). Doing this will trigger an
//   error in the simulator and have incorrect behavior in synthesis.
// - dequeue_value will contain the next value to be dequeued even if dequeue_en is
//   not asserted.
//

module sync_fifo
    #(parameter WIDTH = 4, // please use very large value of WIDTH to test for 'keep_running' == 1
    parameter SIZE = 2,
    parameter ALMOST_FULL_THRESHOLD = SIZE-1
    //parameter ALMOST_EMPTY_THRESHOLD = 1
	)

    (input                       clk,
    input                        reset,
    output		                 full,
    output 	    	             almost_full,
    input                        enqueue_en,
    input [WIDTH - 1:0]          enqueue_value,
    output		                 empty,
    //output reg                 almost_empty,
    input                        dequeue_en,
    output [WIDTH - 1:0]    	 dequeue_value);


    parameter ADDR_WIDTH = $clog2(SIZE);

	// read and write pointers need one extra MSB bit to differentiate between empty and full

    reg[ADDR_WIDTH:0] rd_addr;
    reg[ADDR_WIDTH:0] wr_addr;

	reg[WIDTH - 1:0] data[SIZE - 1:0];


`ifdef FORMAL
	
	initial rd_addr = 0;
	initial wr_addr = 0;
	
	reg [WIDTH:0] wr_addr_flip = 0; // measures how many rounds of address rollover, can just use any bitwidth
	reg [WIDTH:0] rd_addr_flip = 0; // measures how many rounds of address rollover, can just use any bitwidth
	
	reg [SIZE-1:0] this_data_location_had_been_written_once;
	initial this_data_location_had_been_written_once = {SIZE{1'b0}};
	
	integer index;
	
	wire keep_running = $anyseq; // this is to test for perpetual running operation reliability of the fifo
`endif

	reg [ADDR_WIDTH:0] count = 0;

    assign almost_full = count >= (ADDR_WIDTH + 1)'(ALMOST_FULL_THRESHOLD);
    //assign almost_empty = count <= (ADDR_WIDTH + 1)'(ALMOST_EMPTY_THRESHOLD);

    assign full = (count == SIZE[ADDR_WIDTH:0]);
    assign empty = (count == 0);
    assign dequeue_value = data[rd_addr[ADDR_WIDTH-1:0]]; // passed verilator width warning
    

    always @(posedge clk)
    begin
        if (reset)
        begin
            rd_addr <= 0;
            wr_addr <= 0;
			count <= 0;
			
			`ifdef FORMAL
				for(index=0; index<SIZE; index=index+1)
				begin
					data[index] <= 0;
					this_data_location_had_been_written_once[index] <= 0;
				end

				wr_addr_flip <= 0;
				rd_addr_flip <= 0;
			`endif
        end

        else begin

			// https://twitter.com/zipcpu/status/1143134086950789120
			// if enqueue_en and dequeue_en and full at the same time, nothing is added, one item is removed,
			// but count is not modified. Same for empty.

			// https://zipcpu.com/blog/2017/07/29/fifo.html 
			// https://zipcpu.com/tutorial/lsn-10-fifo.pdf

			case( {(dequeue_en && !empty), (enqueue_en && !full) })
				
				'b00 : 	begin 
							wr_addr <= wr_addr;
							rd_addr <= rd_addr; 
							count <= count;							
						end

				'b01 : 	begin
							/* verilator lint_off WIDTH */
							if(wr_addr[ADDR_WIDTH-1:0] == (SIZE - 1))
							/* verilator lint_on WIDTH */
							begin
								wr_addr[ADDR_WIDTH] <= ~wr_addr[ADDR_WIDTH]; // for full/empty decision
								wr_addr[ADDR_WIDTH-1:0] <= 0;
								
								`ifdef FORMAL
									wr_addr_flip <= wr_addr_flip + 1;
								`endif
							end
							
							else wr_addr <= wr_addr + 1;
							
							data[wr_addr[ADDR_WIDTH-1:0]] <= enqueue_value; // passed verilator width warning
							
							`ifdef FORMAL
								this_data_location_had_been_written_once[wr_addr[ADDR_WIDTH-1:0]] <= 1;
							`endif

							rd_addr <= rd_addr;
							count <= count + 1;
						end

				'b10 : 	begin
							wr_addr <= wr_addr;
								
							/* verilator lint_off WIDTH */
							if(rd_addr[ADDR_WIDTH-1:0] == (SIZE - 1))
							/* verilator lint_on WIDTH */
							begin
								rd_addr[ADDR_WIDTH] <= ~rd_addr[ADDR_WIDTH]; // for full/empty decision
								rd_addr[ADDR_WIDTH-1:0] <= 0;
								
								`ifdef FORMAL
									rd_addr_flip <= rd_addr_flip + 1;
								`endif										
							end
							
							else rd_addr <= rd_addr + 1;
							
							count <= count - 1;
						end

				'b11 : 	begin
							/* verilator lint_off WIDTH */
							if(wr_addr[ADDR_WIDTH-1:0] == (SIZE - 1))
							/* verilator lint_on WIDTH */
							begin
								wr_addr[ADDR_WIDTH] <= ~wr_addr[ADDR_WIDTH]; // for full/empty decision
								wr_addr[ADDR_WIDTH-1:0] <= 0;
								
								`ifdef FORMAL
									wr_addr_flip <= wr_addr_flip + 1;
								`endif								
							end
								
							else wr_addr <= wr_addr + 1;		
											
							data[wr_addr[ADDR_WIDTH-1:0]] <= enqueue_value; // passed verilator width warning
							
							`ifdef FORMAL
								this_data_location_had_been_written_once[wr_addr[ADDR_WIDTH-1:0]] <= 1;
							`endif
							
							/* verilator lint_off WIDTH */
							if(rd_addr[ADDR_WIDTH-1:0] == (SIZE - 1))
							/* verilator lint_on WIDTH */
							begin
								rd_addr[ADDR_WIDTH] <= ~rd_addr[ADDR_WIDTH]; // for full/empty decision
								rd_addr[ADDR_WIDTH-1:0] <= 0;
								
								`ifdef FORMAL
									rd_addr_flip <= rd_addr_flip + 1;
								`endif								
							end
								
							else rd_addr <= rd_addr + 1;	
							
							count <= count;											
						end

				default: begin
							wr_addr <= wr_addr;
							rd_addr <= rd_addr;
							count <= count;
						 end
			endcase				
        end
    end


// All the following formal proofs are modified from https://github.com/promach/afifo/blob/master/async_fifo.sv
// and sfifo.v in http://zipcpu.com/tutorial/ex-10-fifo.zip

/*See https://zipcpu.com/blog/2018/07/06/afifo.html for a formal proof of afifo in general*/

`ifdef FORMAL

	reg first_clock_had_passed;

	initial first_clock_had_passed = 0;

	always @(posedge clk)
		first_clock_had_passed <= 1;	

	always @(*) 
	begin
		if(!first_clock_had_passed) 
		begin
			assert(!full);
			assert(empty);
			assert(count == 0);
		end
	end

	initial assume(reset);

	always @(posedge clk)
	begin
		if(first_clock_had_passed && $past(reset))
		begin
			assert(rd_addr == 0);
			assert(!full);

			assert(wr_addr == 0);
			assert(empty);
		end

		else if(first_clock_had_passed) 
		begin
			assert(wr_addr[ADDR_WIDTH-1:0] < SIZE);
			assert(rd_addr[ADDR_WIDTH-1:0] < SIZE);
			assert(count <= SIZE);
    		assert(full == (count == SIZE));
    		assert(empty == (count == 0));
		end
	end

	always @(posedge clk)
	begin
		if (first_clock_had_passed)
		begin
			if($past(reset))
			begin
				assert(count == 0);
				assert(!full);	
				assert(empty);			
				assert(dequeue_value == 0);
			end						
		end
	end
	
	always @(posedge clk)
	begin
		if(first_clock_had_passed)
		begin
			if($past(reset))
			begin
				assert(wr_addr == 0);
				assert(rd_addr == 0);
				assert(count == 0);
				
				assert(wr_addr_flip == 0);
				assert(rd_addr_flip == 0);
			end
			
			else begin
				case( {($past(dequeue_en) && !$past(empty)), ($past(enqueue_en) && !$past(full)) })
					'b00 : begin
								assert(rd_addr == $past(rd_addr));
								assert(wr_addr == $past(wr_addr));
								assert(wr_addr_flip == $past(wr_addr_flip));
								assert(rd_addr_flip == $past(rd_addr_flip));
								
								assert(count == $past(count));								
						   end
					
					'b01 : begin
								assert(this_data_location_had_been_written_once[$past(wr_addr[ADDR_WIDTH-1:0])]);
								assert(data[$past(wr_addr[ADDR_WIDTH-1:0])] == $past(enqueue_value));
								assert(data[rd_addr[ADDR_WIDTH-1:0]] == dequeue_value);
								
								assert(rd_addr == $past(rd_addr));
								assert(rd_addr_flip == $past(rd_addr_flip));
													
								assert(count == $past(count) + 1);
					
								if($past(wr_addr[ADDR_WIDTH-1:0]) == (SIZE - 1))
								begin
									// for full/empty decision
									assert(wr_addr[ADDR_WIDTH] == ~$past(wr_addr[ADDR_WIDTH])); 
									assert(wr_addr[ADDR_WIDTH-1:0] == 0);

									if(&$past(wr_addr_flip)) 
										assert(wr_addr_flip == 0);
									
									else assert(wr_addr_flip == $past(wr_addr_flip) + 1);
								end
									
								else begin
									assert(wr_addr == $past(wr_addr) + 1);					
									assert(wr_addr_flip == $past(wr_addr_flip));
								end
						   end
						   
					'b10 : begin
								assert(wr_addr == $past(wr_addr));
								assert(wr_addr_flip == $past(wr_addr_flip));
								
								assert(count == $past(count) - 1);
					
								if($past(rd_addr[ADDR_WIDTH-1:0]) == (SIZE - 1))
								begin
									// for full/empty decision
									assert(rd_addr[ADDR_WIDTH] == ~$past(rd_addr[ADDR_WIDTH])); 
									assert(rd_addr[ADDR_WIDTH-1:0] == 0);

									if(&$past(rd_addr_flip)) 
										assert(rd_addr_flip == 0);
									
									else assert(rd_addr_flip == $past(rd_addr_flip) + 1);
								end
									
								else begin
									assert(rd_addr == $past(rd_addr) + 1);
									assert(rd_addr_flip == $past(rd_addr_flip));
								end							
					   	   end
					
					'b11 : begin
								assert(this_data_location_had_been_written_once[$past(wr_addr[ADDR_WIDTH-1:0])]);
								assert(data[$past(wr_addr[ADDR_WIDTH-1:0])] == $past(enqueue_value));
								assert(data[rd_addr[ADDR_WIDTH-1:0]] == dequeue_value);
					
								assert(count == $past(count));
					
								if($past(wr_addr[ADDR_WIDTH-1:0]) == (SIZE - 1))
								begin
									// for full/empty decision
									assert(wr_addr[ADDR_WIDTH] == ~$past(wr_addr[ADDR_WIDTH])); 
									assert(wr_addr[ADDR_WIDTH-1:0] == 0);

									if(&$past(wr_addr_flip)) 
										assert(wr_addr_flip == 0);
									
									else assert(wr_addr_flip == $past(wr_addr_flip) + 1);
								end
									
								else begin
									assert(wr_addr == $past(wr_addr) + 1);
									assert(wr_addr_flip == $past(wr_addr_flip));
								end
								
								if($past(rd_addr[ADDR_WIDTH-1:0]) == (SIZE - 1))
								begin
									// for full/empty decision
									assert(rd_addr[ADDR_WIDTH] == ~$past(rd_addr[ADDR_WIDTH])); 
									assert(rd_addr[ADDR_WIDTH-1:0] == 0);
									
									if(&$past(rd_addr_flip)) 
										assert(rd_addr_flip == 0);
									
									else assert(rd_addr_flip == $past(rd_addr_flip) + 1);
								end
									
								else begin
									assert(rd_addr == $past(rd_addr) + 1);								
									assert(rd_addr_flip == $past(rd_addr_flip));
								end
						   end
				endcase
			end
		end
		
		else begin
			assert(wr_addr == 0);
			assert(rd_addr == 0);
			assert(wr_addr_flip == 0);
			assert(rd_addr_flip == 0);			
			
			assert(count == 0);
		end
	end
/*	
	always @(posedge clk) 
	begin
		if(wr_addr[ADDR_WIDTH] == rd_addr[ADDR_WIDTH]) 
			assert(wr_addr >= rd_addr); // read pointer is always lagging behind write pointer
			
		else assert(wr_addr < rd_addr);
	end
*/	
`endif


`ifdef FORMAL

	////////////////////////////////////////////////////
	//
	// Some cover statements, to make sure valuable states
	// are even reachable
	//
	////////////////////////////////////////////////////
	//

	// Make sure a reset is possible
	always @(posedge clk)
		cover(reset);

	always @(posedge clk)
	if (first_clock_had_passed)
		cover((!$past(reset)) && (empty) && (!$past(empty)));

	always @(posedge clk)
	if (first_clock_had_passed) 
		cover(full);

	always @(posedge clk)
	if (first_clock_had_passed) 
		cover($past(full)&&($past(enqueue_en))&&(full));

	always @(posedge clk)
	if (first_clock_had_passed) 
		cover($past(full)&&(!full));

	always @(posedge clk) 
		cover((full)&&(enqueue_en));

	always @(posedge clk)
		cover(enqueue_en);

	always @(posedge clk)
		cover((empty)&&(dequeue_en));

	always @(posedge clk)
	if (first_clock_had_passed)
		cover($past(!empty)&&($past(dequeue_en))&&(empty));
		
	always @(posedge clk) // to test for address rollover
	if (first_clock_had_passed)
		cover((!$past(reset)) && $past(rd_addr[ADDR_WIDTH-1:0]) == (SIZE - 1));
		
	always @(posedge clk) // to test for address rollover
	if (first_clock_had_passed)
		cover((!$past(reset)) && $past(wr_addr[ADDR_WIDTH-1:0]) == (SIZE - 1));
		
	always @(posedge clk) // to test for address rollover
		cover((rd_addr[ADDR_WIDTH] == 1'b1) && (rd_addr[ADDR_WIDTH-1:0] == 1)); 
		
	always @(posedge clk) // to test for address rollover
		cover((wr_addr[ADDR_WIDTH] == 1'b1) && (wr_addr[ADDR_WIDTH-1:0] == 0)); 
		
	wire [ADDR_WIDTH:0] user_wr_addr = 0;
	wire [ADDR_WIDTH:0] user_rd_addr = {1'b1 , {(ADDR_WIDTH-1){1'b0}}, 1'b1};			
				
	always @(posedge clk) // to test for address rollover
		cover((wr_addr == user_wr_addr) && (rd_addr == user_rd_addr)); 				
		
	localparam COVER_DEPTH = 40; // please check sync_fifo.sby
	localparam NUM_OF_PREPARATORY_CYCLES = 2; // 1 cycle due to initial reset, 1 cycle due to 'keep_running'
	
	integer max_flip_number = $rtoi($floor((COVER_DEPTH-NUM_OF_PREPARATORY_CYCLES)/SIZE));
	
	wire [WIDTH:0] wr_flip = $anyseq;
	wire [WIDTH:0] rd_flip = $anyseq;
	
	// due to cover() depth limit, for large flip number, we need to increase cover depth
	always @(*) assume(wr_flip <= max_flip_number);
	always @(*) assume(rd_flip <= max_flip_number);
	
	always @(posedge clk) // to test for address rollover
		if (first_clock_had_passed) // this checks whether wr_addr and rd_addr could flip for multiple times
			cover((!$past(reset)) && (wr_addr_flip == wr_flip) && (rd_addr_flip == rd_flip)); 	

`endif
	
`ifdef FORMAL
	
	// twin-write test
	// write two pieces of different data into the synchronous fifo
	// then read them back from the synchronous fifo
	
	wire [WIDTH - 1:0] first_data = $anyconst;
	wire [WIDTH - 1:0] second_data = $anyconst;

	always @(*) assume(first_data != 0);
	always @(*) assume(second_data != 0);
	always @(*) assume(first_data != second_data);


	// for induction verification
	wire [ADDR_WIDTH : 0] f_first_addr = $anyconst;
	reg [ADDR_WIDTH : 0] f_second_addr;

	always @(*) f_second_addr <= f_first_addr + 1;

	always @(*) assume(f_first_addr[ADDR_WIDTH-1:0] < SIZE);
	always @(*) assume(f_second_addr[ADDR_WIDTH-1:0] < SIZE);
	
	wire	wr = (enqueue_en && !full);
	wire	rd = (dequeue_en && !empty);


	localparam IDLE = 0;
	localparam FIRST_DATA_IS_WRITTEN = 1;
	localparam SECOND_DATA_IS_WRITTEN = 2;
	localparam FIRST_DATA_IS_READ = 3;

	reg	[1:0]	f_state;
	initial	f_state = IDLE;

	// See http://zipcpu.com/tutorial/lsn-10-fifo.pdf#page=21 for understanding the state machine

	always @(posedge clk)
	begin
		if(reset) f_state <= IDLE;

		else begin

			case(f_state)
				IDLE: 

					if (wr && (wr_addr == f_first_addr) && (enqueue_value == first_data))
						// Wrote first value
						f_state <= FIRST_DATA_IS_WRITTEN;

				FIRST_DATA_IS_WRITTEN: 

					//if (rd && rd_addr == f_first_addr)
						// Test sprung early
						//f_state <= IDLE;

					if (wr && (wr_addr == f_second_addr) && (enqueue_value == second_data))
						f_state <= SECOND_DATA_IS_WRITTEN;

				SECOND_DATA_IS_WRITTEN: 

					if (dequeue_en && rd_addr == f_first_addr)
						f_state <= FIRST_DATA_IS_READ;

				FIRST_DATA_IS_READ: 

					if (dequeue_en) // second data is read, thus goes back idling
						f_state <= IDLE;
			endcase
		end
	end

/*
	reg	f_first_addr_in_fifo, f_second_addr_in_fifo;
	reg	[ADDR_WIDTH :0]	f_distance_to_first, f_distance_to_second;

	always @(*)
	begin
		f_distance_to_first <= (f_first_addr - rd_addr);
		f_first_addr_in_fifo <= 0;

		if ((count != 0) && (f_distance_to_first < count))
			f_first_addr_in_fifo <= 1;
		else
			f_first_addr_in_fifo <= 0;
	end

	always @(*)
	begin
		f_distance_to_second <= (f_second_addr - rd_addr);

		if ((count != 0) && (f_distance_to_second < count))
			f_second_addr_in_fifo <= 1;
		else
			f_second_addr_in_fifo <= 0;
	end
*/

	integer location_index;

	always @(posedge clk)
	begin
		for(location_index = SIZE-1; location_index >= 0; location_index = location_index - 1)
		begin
			// since this is FIFO, if address_A location had been written before, 
			// then (address_A-1) location must have also been written before.
			// in other words, look at FIFO as a data queue
		
			if(location_index == (SIZE-1))
			begin
				if(this_data_location_had_been_written_once[location_index])
				begin
					assert(this_data_location_had_been_written_once == 
				  {{(SIZE-location_index[ADDR_WIDTH-1:0]-1){1'b0}}, {(location_index[ADDR_WIDTH-1:0]+1){1'b1}}});								
				end
			end
			
			else begin // else if(location_index < (SIZE-1))

				if(this_data_location_had_been_written_once[location_index] &&
			   	  ~this_data_location_had_been_written_once[location_index+1])
			   	  
					assert(this_data_location_had_been_written_once == 
				  {{(SIZE-location_index[ADDR_WIDTH-1:0]-1){1'b0}}, {(location_index[ADDR_WIDTH-1:0]+1){1'b1}}});
			end
		end
	end

	reg address_rollover_had_occured_previously = 0;
	
	always @(posedge clk) 
	begin
		if(reset) address_rollover_had_occured_previously <= 0;
	
		else if(address_rollover_had_occured) address_rollover_had_occured_previously <= 1;
	end
	
	wire address_rollover_had_occured = (wr_addr_flip > 0) || 
										(address_rollover_had_occured_previously && (wr_addr_flip == 0));

	always @(posedge clk)
	begin
		if(first_clock_had_passed && $past(reset))
			assert(this_data_location_had_been_written_once == 0);
		
		else begin
			if(address_rollover_had_occured)									 
				assert(&this_data_location_had_been_written_once); // all fifo locations had been traversed
				
			else assert(this_data_location_had_been_written_once == 
						((1 << wr_addr[ADDR_WIDTH-1:0]) - 1)); // same as {{wr_addr[ADDR_WIDTH-1:0]}1'b1}
		end
	end

	// for address rollover
	always @(posedge clk)
	begin
		if(wr_addr[ADDR_WIDTH-1:0] == rd_addr[ADDR_WIDTH-1:0])
		begin 
			if((wr_addr[ADDR_WIDTH:0] == rd_addr[ADDR_WIDTH:0])) assert(empty);
			
			else assert(full);
		end
	end

	(* keep *) wire [ADDR_WIDTH:0] addr_diff = wr_addr - rd_addr;

	always @(posedge clk) 
	begin
		if(wr_addr[ADDR_WIDTH-1:0] > rd_addr[ADDR_WIDTH-1:0]) assert(count == wr_addr - rd_addr);
		
		else if(wr_addr[ADDR_WIDTH-1:0] == rd_addr[ADDR_WIDTH-1:0]) 
		begin
			if(wr_addr[ADDR_WIDTH] != rd_addr[ADDR_WIDTH]) assert(count == SIZE);
			
			else assert(count == 0);
		end
		
		else begin
			assert(count == (addr_diff - ((1 << ADDR_WIDTH) - SIZE[ADDR_WIDTH:0])));
		
			// the following assert logic is wrong when wr_addr='b00000 and rd_addr='b10001
			// in other words, wr_addr[ADDR_WIDTH-1:0] < rd_addr[ADDR_WIDTH-1:0]   and
			// wr_addr[ADDR_WIDTH] != rd_addr[ADDR_WIDTH]
			//assert(count == ((wr_addr - rd_addr) % SIZE)); 
			
		 	// it is impossible for write pointer to lag behind read pointer 
		 	// when write pointer had not done an address rollover yet. 
		 	// A flip in the msb of write pointer indicates address rollover 
		 	// from the fifo's last entry to fifo's first entry 
			assert(wr_addr[ADDR_WIDTH] != rd_addr[ADDR_WIDTH]);
		end
	end

	genvar data_block_index;
	generate
		for(data_block_index = 0; data_block_index < SIZE; data_block_index = data_block_index + 1)
		begin	
			always @(posedge clk)
				if(first_clock_had_passed && this_data_location_had_been_written_once[data_block_index]) 
				   
				    // data blocks had been filled with valid data
					assert(data[data_block_index] >= 0); // != {WIDTH{1'bx}}); , use >= 0 since 'data' is unsigned
		end
	endgenerate

	always @(posedge clk)
	begin
		case(f_state)

			IDLE: 
			begin

			end

			FIRST_DATA_IS_WRITTEN: 
			begin
				if($past(f_state) == IDLE) 
					assert($past(wr) && ($past(wr_addr) == f_first_addr) && 
					      ($past(enqueue_value) == first_data));			
			
				//assert(f_first_addr_in_fifo);
				assume(!dequeue_en); // do not read until the two pieces of data is written
				
				if(!((!full) && (wr_addr == f_second_addr) && (enqueue_value == second_data))) 
					assume(!enqueue_en);
				
				assert(data[f_first_addr] == first_data);

				assert(!empty);
				//assert(wr_addr == f_second_addr);
			end

			SECOND_DATA_IS_WRITTEN: 
			begin
				if(rd_addr != f_first_addr) assume(!dequeue_en);
			
				assert(count >= 2);
				assert(!empty);			
				
				//assert(f_first_addr_in_fifo);
				assume(!enqueue_en); // do not write anymore since this is only a twin-write test
				assert(data[f_first_addr] == first_data);
				
				//assert(f_second_addr_in_fifo);
				assert(data[f_second_addr] == second_data);

				if (dequeue_en && rd_addr == f_first_addr)
					assert(dequeue_value == first_data);
			end

			FIRST_DATA_IS_READ: 
			begin
				if(rd_addr != f_second_addr) assume(!dequeue_en);
			
				assert(!empty); // we have only read out one data, there is still one more data in the fifo
			
				assume(!enqueue_en); // do not write anymore since this is only a twin-write test
				
				if(rd_addr != f_first_addr) assume(!dequeue_en);
				
				//assert(f_second_addr_in_fifo);
				assert(data[f_second_addr] == second_data);

				assert(dequeue_value == second_data);
			end

		endcase
	end

`endif
/*
`ifdef FORMAL
	
	// for 'keep_running' == 1
	
	localparam IDLE = 0;
	localparam FOREVER_RUNNING = 1;

	reg	f_running_state;
	initial	f_running_state = IDLE;

	always @(posedge clk)
	begin
		if(reset) f_running_state <= IDLE;
	
		else begin
		
			case(f_running_state)
			
				IDLE: 
				begin
					if (keep_running)
					begin
						f_running_state <= FOREVER_RUNNING;
					end
				end
				
				FOREVER_RUNNING: // to check for FIFO reliability
				begin
					assume(enqueue_value == $past(enqueue_value) + 1); // an ever increasing trend
					f_running_state <= FOREVER_RUNNING; // keep looping forever
				end
				
			endcase
		end
	end	

	always @(*) 
	begin
		if(f_running_state == FOREVER_RUNNING) 
		begin
			assume(!reset);
			assume(enqueue_en);
			assume(dequeue_en);
		end
	end

	always @(*) 
	begin
		if((f_running_state == IDLE) && keep_running) 
		begin
//			assume(!reset);
			assume(enqueue_en);
			assume(!dequeue_en); // do not read yet when the desired data had not been written
			assume(enqueue_value == 1); // Wrote first value
		end
	end
	
	always @(posedge clk) // test for reliability
		if(first_clock_had_passed) 
			cover((f_running_state == FOREVER_RUNNING) && ($past(f_running_state) == FOREVER_RUNNING) && 
				  ($past(count) == 1) && ($past(enqueue_value) == SIZE-1)); 
`endif
*/
endmodule
