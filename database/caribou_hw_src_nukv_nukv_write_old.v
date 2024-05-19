// This program was cloned from: https://github.com/fpgasystems/caribou
// License: GNU General Public License v3.0

//---------------------------------------------------------------------------
//--  Copyright 2015 - 2017 Systems Group, ETH Zurich
//-- 
//--  This hardware module is free software: you can redistribute it and/or
//--  modify it under the terms of the GNU General Public License as published
//--  by the Free Software Foundation, either version 3 of the License, or
//--  (at your option) any later version.
//-- 
//--  This program is distributed in the hope that it will be useful,
//--  but WITHOUT ANY WARRANTY; without even the implied warranty of
//--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//--  GNU General Public License for more details.
//-- 
//--  You should have received a copy of the GNU General Public License
//--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//---------------------------------------------------------------------------




module nukv_Write #(
	parameter KEY_WIDTH = 128,
	parameter HEADER_WIDTH = 42, //vallen + val addr
	parameter META_WIDTH = 96,
	parameter HASHADDR_WIDTH = 32,
	parameter MEMORY_WIDTH = 512,
	parameter FASTFORWARD_BITS = 5,
	parameter MEM_WRITE_WAIT = 512,
	parameter MEMADDR_WIDTH = 20,
	parameter IS_SIM = 0
	)


    (
	// Clock
	input wire         clk,
	input wire         rst,

	input  wire [KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:0] input_data,
	input  wire         input_valid,
	output reg         input_ready,

	output reg [KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:0] feedback_data,
	output reg         feedback_valid,
	input  wire         feedback_ready,

	output reg [KEY_WIDTH+HEADER_WIDTH+META_WIDTH-1:0] output_data,
	output reg         output_valid,
	input  wire         output_ready,

	input wire [31:0] malloc_pointer,
	input wire 		  malloc_valid,
	input wire		malloc_failed,
	output reg 	  malloc_ready,
	
	output reg [31:0] free_pointer,
	output reg [15:0] free_size,
	output reg 		free_valid,
	input wire 			free_ready,
	output reg 		free_wipe,


	input wire [MEMORY_WIDTH-1:0]  rd_data,
	input wire         rd_valid,
	output  reg         rd_ready,	

	output reg [MEMORY_WIDTH-1:0] wr_data,
	output reg         wr_valid,
	input  wire         wr_ready,

	output reg [31:0] wrcmd_data,
	output reg         wrcmd_valid,
	input  wire         wrcmd_ready
);

localparam [2:0]
	ST_IDLE   = 0,
	ST_CHECK_FF = 1,
	ST_CHECK_MEM  = 3,
	ST_SKIP_MEM = 4,
	ST_DECIDE  = 5,
	ST_WRITEDATA = 6,
	ST_WIPE = 7;
reg [2:0] state;

localparam [1:0] 
	OP_GET = 0,
	OP_INSERT = 1,
	OP_DELETE = 2,
	OP_UPDATE = 3;

reg [1:0] opmode;
reg op_retry;
reg op_addrchoice;

reg [32-1:0] fastforward_addr [0:2**FASTFORWARD_BITS];
 (* ram_style = "block" *) reg [MEMORY_WIDTH-1:0] fastforward_mem [0:2**FASTFORWARD_BITS];
reg [FASTFORWARD_BITS-1:0] ff_head;
reg [FASTFORWARD_BITS-1:0] ff_tail;
reg [FASTFORWARD_BITS-1:0] ff_cnt;
reg [FASTFORWARD_BITS-1:0] pos_ff;

(* ram_style = "block" *) reg [1+KEY_WIDTH+HEADER_WIDTH-1:0] kicked_keys [0:2**FASTFORWARD_BITS]; // the plus bit is to say whether this is a 'real kicked key' (=1) or just a regular retry for second address (=0)
reg [FASTFORWARD_BITS-1:0] kk_head;
reg [FASTFORWARD_BITS-1:0] kk_tail;
reg [FASTFORWARD_BITS-1:0] kk_cnt;
reg [FASTFORWARD_BITS-1:0] pos_kk;

reg found_ff;
reg found_addr_ff;
reg empty_ff;
reg [FASTFORWARD_BITS-1:0] found_ff_pos;
reg [1:0] found_ff_idx;
reg [1:0] empty_ff_idx;
reg found_kk;
reg [FASTFORWARD_BITS-1:0] found_kk_pos;
reg found_mem;
reg [1:0] found_mem_idx;
reg empty_mem;
reg [1:0] empty_mem_idx;

reg [31:0] oldpointer;

reg [MEMADDR_WIDTH-1:0] wipe_location;
reg wipe_start;

(* keep = "true", max_fanout = 4 *) reg[KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:0] inputReg;

reg [MEM_WRITE_WAIT-1:0] delayer;

wire [7:0] curr_opcode;
assign curr_opcode = (state==ST_IDLE) ? input_data[KEY_WIDTH+META_WIDTH-1:KEY_WIDTH+META_WIDTH-8] : inputReg[KEY_WIDTH+META_WIDTH-1:KEY_WIDTH+META_WIDTH-8];

wire [31:0] curr_hash;
assign curr_hash = (state==ST_IDLE) ? input_data[KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:KEY_WIDTH+META_WIDTH] : inputReg[KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:KEY_WIDTH+META_WIDTH];


integer c;
integer x;

reg[511:0] fastforward_mem_pos_reg;
reg[511:0] fastforward_mem_found_reg;
reg [1+KEY_WIDTH+HEADER_WIDTH-1:0] kicked_keys_pos_reg;
reg [1+KEY_WIDTH+HEADER_WIDTH-1:0] kicked_keys_found_reg;

reg[511:0] fastforward_write_data; 
reg[7:0] fastforward_write_addr; 
reg fastforward_write_valid;

reg[1+KEY_WIDTH+HEADER_WIDTH-1:0] kicked_keys_write_data;
reg[7:0] kicked_keys_write_addr; 
reg kicked_keys_write_valid;

reg[511:0] write_data_prep;

reg mallocRegValid;
reg[31:0] mallocRegData;
reg mallocRegFail;


always @(posedge clk) begin
	if (rst) begin
		// reset
		state <= ST_IDLE;
		ff_head <= 0;
		ff_tail <= 0;
		ff_cnt <= 0;
		kk_head <= 0;
		kk_tail <= 0;
		kk_cnt <= 0;
		delayer <= 0;

		rd_ready <= 0;
		wr_valid <= 0;
		wrcmd_valid <= 0;

		input_ready <= 0;

		free_valid <= 0;
		free_wipe <= 0;
		malloc_ready <= 0;
		output_valid <= 0;
		
		feedback_valid <= 0;

		kicked_keys_write_valid <= 0;
		fastforward_write_valid <= 0;

		malloc_ready <= 0;

		empty_ff_idx <= 0;
		empty_mem_idx <= 0;

	end
	else begin

		fastforward_mem_pos_reg <= fastforward_mem[pos_ff];		
		kicked_keys_pos_reg <= kicked_keys[pos_kk];

		kicked_keys_write_valid <= 0;
		fastforward_write_valid <= 0;

		if (kicked_keys_write_valid==1) begin
			kicked_keys[kicked_keys_write_addr] <= kicked_keys_write_data;
		end

		if (fastforward_write_valid==1) begin
			fastforward_mem[fastforward_write_addr] <= fastforward_write_data;
		end

		delayer <= {delayer[MEM_WRITE_WAIT-2:0],1'b0};

		if (delayer[MEM_WRITE_WAIT-1]==1 && ff_cnt>0) begin
			ff_cnt <= ff_cnt-1;
			ff_tail <= ff_tail+1;
		end

		if (output_valid==1 && output_ready==1) begin
			output_valid <= 0;
		end

		if (feedback_valid==1 && feedback_ready==1) begin
			feedback_valid <= 0;
		end

		if (free_valid==1 && free_ready==1) begin
			free_valid <= 0;
			free_wipe <= 0;
		end

		if (wrcmd_valid==1 && wrcmd_ready==1) begin
			wrcmd_valid <= 0;			
		end

		if (wr_valid==1 && wr_ready==1) begin
			wr_valid <= 0;
		end

		input_ready <= 0;

		malloc_ready <= 0;

		rd_ready <= 0;

		case (state)

			ST_WIPE: begin

				if (wrcmd_ready==1 && wrcmd_valid==1) begin
					wrcmd_valid <= 0;
				end

				if (wr_ready==1 && wr_valid==1) begin
					wr_valid <= 0;
				end


				if (wrcmd_ready==1 && wr_ready==1 && wrcmd_valid==0 && wr_valid==0) begin
					wipe_start <= 0;

					wrcmd_data[31:MEMADDR_WIDTH] <= 0;
					wrcmd_data[MEMADDR_WIDTH-1:0] <= wipe_location;	
					wrcmd_valid <= 1;

					wr_data <= 0;
					wr_valid <= 1;

					wipe_location <= wipe_location+1;

				end
				

				if (wipe_start==0 && wipe_location== (IS_SIM==0 ? 0 : 16) ) begin  // 16 for sim!

					if (ff_cnt>0 || kk_cnt>0) begin
						state <= ST_CHECK_FF;
						pos_ff <= ff_tail;
						pos_kk <= kk_tail;
					end else begin
						state <= ST_CHECK_MEM;						
					end

				end
			end

			ST_IDLE: begin
				if (input_valid==1) begin
					opmode <= curr_opcode[1:0];
					op_retry <= curr_opcode[6];
					op_addrchoice <= curr_opcode[7];

					inputReg <= input_data;

					input_ready <= 1;

					found_ff <= 0;
					found_addr_ff <= 0;
					found_kk <= 0;
					found_mem <= 0;
					empty_mem <= 0;
					empty_ff <= 0;

					if (ff_cnt>0 || kk_cnt>0) begin
						state <= ST_CHECK_FF;
						pos_ff <= ff_tail;
						pos_kk <= kk_tail;
					end else begin
						state <= ST_CHECK_MEM;						
					end


					if ( (curr_opcode[1:0]==1 || curr_opcode[1:0]==2) && curr_opcode[4]==1) begin
						// this is to keep order
						state <= ST_DECIDE;
					end
					
					if (curr_opcode[7:0]==8'b00001000) begin
						state <= ST_WIPE;

						free_valid <= 1;
						free_wipe <= 1;

						wipe_start <= 1;
						wipe_location <= 0;
					end
				end
			end

			ST_CHECK_FF: begin
				if (pos_ff==(ff_head+1)%2**FASTFORWARD_BITS && pos_kk==(kk_head+1)%2**FASTFORWARD_BITS) begin
					if (found_addr_ff==1) begin
						state <= ST_SKIP_MEM;
					end else begin
						state <= ST_CHECK_MEM;					
					end
				end else begin

					if (pos_ff!=(ff_head+1)%2**FASTFORWARD_BITS) begin
						pos_ff <= pos_ff+1;

						if (pos_ff!=ff_tail) begin
							if (fastforward_addr[pos_ff-1]==curr_hash) begin
								found_addr_ff <= 1;
								found_ff_pos <= pos_ff-1;
								fastforward_mem_found_reg <= fastforward_mem_pos_reg;
								found_ff_idx <= 0;
								empty_ff <= 0;

								// compare to this data
								for (c=0; c<MEMORY_WIDTH/(KEY_WIDTH+HEADER_WIDTH); c=c+1) begin       
									if (fastforward_mem_pos_reg[(c)*(KEY_WIDTH+HEADER_WIDTH) +: KEY_WIDTH]==inputReg[KEY_WIDTH-1:0]) begin
										found_ff <= 1;
										found_ff_pos <= pos_ff-1;
										found_ff_idx <= c;
									end else begin
										found_ff <= 0;
									end

									if (fastforward_mem_pos_reg[(c)*(KEY_WIDTH+HEADER_WIDTH) +: KEY_WIDTH]==0) begin
										empty_ff_idx <= c;
										empty_ff <= 1;
									end
	    						end
							end
						end
					end

					if (pos_kk!=(kk_head+1)%2**FASTFORWARD_BITS) begin
						pos_kk <= pos_kk+1;

						
						if (pos_kk!=kk_tail) begin
							if (kicked_keys_pos_reg[KEY_WIDTH-1:0]==inputReg[KEY_WIDTH-1:0] && found_kk==0) begin
								// this is the same, do something

								found_kk <= 1;
								found_kk_pos <= pos_kk-1;
								kicked_keys_found_reg <= kicked_keys_pos_reg;

								if (op_retry==1 && opmode==OP_INSERT && pos_kk==kk_tail+1) begin
									oldpointer <= kicked_keys_pos_reg[KEY_WIDTH+31:KEY_WIDTH];
									kk_cnt <= kk_cnt-1;
									kk_tail <= kk_tail +1;
								end
							end
						end
					end
				end

			end

			ST_SKIP_MEM: begin
				if (rd_valid==1  && (malloc_valid==1 || opmode!=1 || op_retry==1)) begin
					state <= ST_DECIDE;

					malloc_ready <= (opmode == 1 && op_retry == 0) ? 1 : 0;

    				mallocRegValid <= malloc_valid;
    				mallocRegData <= malloc_pointer;
    				mallocRegFail <= malloc_failed;
				end
			end

			ST_CHECK_MEM: begin
				if (rd_valid==1 && (malloc_valid==1 || opmode!=1 || op_retry==1)) begin
					// compare to this data

					for (x=0; x<MEMORY_WIDTH/(KEY_WIDTH+HEADER_WIDTH); x=x+1) begin       
						if (rd_data[(x)*(KEY_WIDTH+HEADER_WIDTH) +: KEY_WIDTH]==inputReg[KEY_WIDTH-1:0]) begin
							found_mem <= 1;
							found_mem_idx[1:0] <= x;
						end
						if (rd_data[(x)*(KEY_WIDTH+HEADER_WIDTH) +: KEY_WIDTH]==0) begin
							empty_mem_idx <= x;
							empty_mem <= 1;
						end
    				end

    				malloc_ready <= (opmode == 1 && op_retry==0) ? 1 : 0;

    				mallocRegValid <= malloc_valid;
    				mallocRegData <= malloc_pointer;
    				mallocRegFail <= malloc_failed;

					state <= ST_DECIDE;
				end
			end

			ST_DECIDE: begin
				// if write

				if ((opmode==OP_GET || opmode==OP_UPDATE) && feedback_ready==1) begin

					rd_ready <= 1;

					state <= ST_IDLE;

					if (found_mem==1 || found_kk==1 || found_ff==1) begin
						output_valid <= 1;

						if (found_kk==1) begin
							//found in kicked out zone
							output_data[KEY_WIDTH+HEADER_WIDTH-1:0] <= kicked_keys_found_reg;

						end else if (found_ff==1) begin
							//found in fastforward zone (just been added)
							output_data[KEY_WIDTH+HEADER_WIDTH-1:0] <= fastforward_mem_found_reg[found_ff_idx*(KEY_WIDTH+HEADER_WIDTH) +: (KEY_WIDTH+HEADER_WIDTH)];

						end else begin
							//found in memory
							output_data[KEY_WIDTH+HEADER_WIDTH-1:0] <= rd_data[found_mem_idx*(KEY_WIDTH+HEADER_WIDTH) +: (KEY_WIDTH+HEADER_WIDTH)];							
						end

						output_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-1:KEY_WIDTH+HEADER_WIDTH] <= inputReg[META_WIDTH+KEY_WIDTH-1:KEY_WIDTH];
						if (opmode==OP_UPDATE) begin
							output_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8 +: 2] <= 2'b01; // make this look like a set
						end

					end	else begin
						if (op_addrchoice==0) begin
							//recirculate with second address
							feedback_valid <= 1;
							feedback_data <= inputReg;
							feedback_data[KEY_WIDTH+META_WIDTH-1] <= 1;
							feedback_data[KEY_WIDTH+META_WIDTH-2] <= 0;
							feedback_data[KEY_WIDTH+META_WIDTH-3] <= 1;
							feedback_data[KEY_WIDTH+META_WIDTH-4] <= 0;

						end else begin
							//truly a miss
							output_valid <= 1;
							output_data[KEY_WIDTH-1:0] <= inputReg[KEY_WIDTH-1:0];
							output_data[KEY_WIDTH+HEADER_WIDTH-1:KEY_WIDTH] <= 0;  
							output_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-1:KEY_WIDTH+HEADER_WIDTH] <= inputReg[META_WIDTH+KEY_WIDTH-1:KEY_WIDTH];
							if (opmode==OP_UPDATE) begin
								output_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8 +: 2] <= 2'b01; // make this look like a set
							end
						end
					end
				end

				if (opmode==OP_DELETE && inputReg[KEY_WIDTH+META_WIDTH-4]==1) begin

					output_valid <= 1;
					output_data[KEY_WIDTH-1:0] <= inputReg[KEY_WIDTH-1:0];
					output_data[KEY_WIDTH+HEADER_WIDTH-1:KEY_WIDTH] <= 1;  
					output_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-1:KEY_WIDTH+HEADER_WIDTH] <= inputReg[META_WIDTH+KEY_WIDTH-1:KEY_WIDTH];

					state <= ST_IDLE;

				end else 
				if (opmode==OP_DELETE && free_ready==1 && feedback_ready==1 && ff_cnt<2**FASTFORWARD_BITS-1 && wrcmd_ready==1 && wr_ready==1) begin
					rd_ready <= 1;

					state <= ST_IDLE;

					if (found_mem==1 || found_ff==1) begin

						if (found_addr_ff==1) begin 
							write_data_prep <= fastforward_mem_found_reg;
							write_data_prep[(found_ff_idx)*(KEY_WIDTH+HEADER_WIDTH) +: (KEY_WIDTH+HEADER_WIDTH)] <= 0;

							fastforward_write_data <= fastforward_mem_found_reg;
							fastforward_write_data[(found_ff_idx)*(KEY_WIDTH+HEADER_WIDTH) +: (KEY_WIDTH+HEADER_WIDTH)] <= 0;

							fastforward_write_valid <= 1;
							fastforward_write_addr <= ff_head;

							free_pointer <= fastforward_mem_found_reg[(found_ff_idx)*(KEY_WIDTH+HEADER_WIDTH)+KEY_WIDTH +: 31];
							free_size <=  fastforward_mem_found_reg[(found_ff_idx)*(KEY_WIDTH+HEADER_WIDTH)+KEY_WIDTH+31 +: 10];


						end else begin
							write_data_prep <= rd_data;
							write_data_prep[(found_mem_idx)*(KEY_WIDTH+HEADER_WIDTH) +: (KEY_WIDTH+HEADER_WIDTH)] <= 0;

							fastforward_write_data <= rd_data;
							fastforward_write_data[(found_mem_idx)*(KEY_WIDTH+HEADER_WIDTH) +: (KEY_WIDTH+HEADER_WIDTH)] <= 0;

							fastforward_write_valid <= 1;
							fastforward_write_addr <= ff_head;

							free_pointer <= rd_data[(found_mem_idx)*(KEY_WIDTH+HEADER_WIDTH)+KEY_WIDTH +: 31];
							free_size <=  rd_data[(found_mem_idx)*(KEY_WIDTH+HEADER_WIDTH)+KEY_WIDTH+31 +: 10];
							
							
						end

						//wr_valid <= 1;						
						state <= ST_WRITEDATA;
						rd_ready <= 0;
						
						wrcmd_data <= inputReg[KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:KEY_WIDTH+META_WIDTH];
						wrcmd_valid <= 1;
						wrcmd_data[31:MEMADDR_WIDTH] <= 0;
						
						fastforward_addr[ff_head] <= inputReg[KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:KEY_WIDTH+META_WIDTH];						

						free_valid <= 1;


						ff_head <= ff_head+1;

						if (delayer[MEM_WRITE_WAIT-1]==1) begin
							ff_cnt <= ff_cnt; // to counter the decrease from before
						end else begin
							ff_cnt <= ff_cnt+1;
						end

						delayer[0] <= 1;


						if (op_retry==0 && op_addrchoice==0) begin
							feedback_valid <= 1;
							feedback_data <= inputReg;
							feedback_data[KEY_WIDTH+META_WIDTH-1] <= 1;	
							feedback_data[KEY_WIDTH+META_WIDTH-2] <= 1;
							feedback_data[KEY_WIDTH+META_WIDTH-3] <= 0;
							feedback_data[KEY_WIDTH+META_WIDTH-4] <= 1; // this means don't issue a read for this
							
						end 
						
					end else begin
						if (op_addrchoice==0) begin
							//recirculate with second address
							feedback_valid <= 1;
							feedback_data <= inputReg;
							feedback_data[KEY_WIDTH+META_WIDTH-1] <= 1;							
							feedback_data[KEY_WIDTH+META_WIDTH-3] <= 1;	

						end else begin
							//truly a miss
							output_valid <= 1;
							output_data[KEY_WIDTH-1:0] <= inputReg[KEY_WIDTH-1:0];
							output_data[KEY_WIDTH+HEADER_WIDTH-1:KEY_WIDTH] <= 0;  
							output_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-1:KEY_WIDTH+HEADER_WIDTH] <= inputReg[META_WIDTH+KEY_WIDTH-1:KEY_WIDTH];
						end
					end
					
				end
				
				if (opmode==OP_INSERT && inputReg[KEY_WIDTH+META_WIDTH-4]==1) begin
					// this is an insert that has been resent for the sake of order
					output_valid <= 1;
					output_data[KEY_WIDTH-1:0] <= 0;
					output_data[KEY_WIDTH+HEADER_WIDTH-1:KEY_WIDTH] <= {inputReg[KEY_WIDTH+META_WIDTH-1],inputReg[10+64+KEY_WIDTH-1:KEY_WIDTH+64],inputReg[30:0]};
					output_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-1:KEY_WIDTH+HEADER_WIDTH] <= inputReg[META_WIDTH+KEY_WIDTH-1:KEY_WIDTH];
					state <= ST_IDLE;
						
				end else if (opmode==OP_INSERT && (mallocRegValid==1 || op_retry==1) && feedback_ready==1 && ff_cnt<2**FASTFORWARD_BITS-1 && wr_ready==1 && wrcmd_ready==1) begin	

					if (empty_mem==0) begin
						if (empty_mem_idx==2) begin
							empty_mem_idx <= 0; 
						end else begin
							empty_mem_idx <= empty_mem_idx+1;
						end
					end

					rd_ready <= 1;
					state <= ST_IDLE;

					if (found_mem==0 && found_ff==0 && (mallocRegValid==0 || mallocRegFail==0 || op_retry==1) && (found_kk==0 || found_kk_pos==kk_tail-1) && ((found_addr_ff==1 && empty_ff==1) || (found_addr_ff==0 && empty_mem==1) || op_addrchoice==1 || op_retry==1) ) begin

						if (found_addr_ff==1) begin 
							write_data_prep <= fastforward_mem_found_reg;
							write_data_prep[(empty_ff_idx)*(KEY_WIDTH+HEADER_WIDTH) +: (KEY_WIDTH+HEADER_WIDTH)] <= {inputReg[KEY_WIDTH+META_WIDTH-1],inputReg[10+64+KEY_WIDTH-1:KEY_WIDTH+64], (op_retry==0) ? mallocRegData[30:0] : oldpointer[30:0] ,inputReg[KEY_WIDTH-1:0]};

							fastforward_write_data <= fastforward_mem_found_reg;
							fastforward_write_data[(empty_ff_idx)*(KEY_WIDTH+HEADER_WIDTH) +: (KEY_WIDTH+HEADER_WIDTH)] <= {inputReg[KEY_WIDTH+META_WIDTH-1],inputReg[10+64+KEY_WIDTH-1:KEY_WIDTH+64],(op_retry==0) ? mallocRegData[30:0] : oldpointer[30:0] ,inputReg[KEY_WIDTH-1:0]};

							fastforward_write_valid <= 1;
							fastforward_write_addr <= ff_head;


							feedback_valid <= ~empty_ff;
							feedback_data[KEY_WIDTH-1:0] <= fastforward_mem_found_reg[(empty_ff_idx)*(KEY_WIDTH+HEADER_WIDTH) +: (KEY_WIDTH)];
							feedback_data[KEY_WIDTH +: META_WIDTH] <= 0;
							feedback_data[KEY_WIDTH+META_WIDTH-1:KEY_WIDTH+META_WIDTH-8] <= {~fastforward_mem_found_reg[(empty_ff_idx+1)*(KEY_WIDTH+HEADER_WIDTH)-1],1'b1,1'b1,1'b0,4'b1};
							feedback_data[KEY_WIDTH+META_WIDTH-5] <= 1;
							
							if (empty_ff==0) begin
								kicked_keys_write_data <= {1'b1, fastforward_mem_found_reg[(empty_ff_idx)*(KEY_WIDTH+HEADER_WIDTH) +: KEY_WIDTH+HEADER_WIDTH]};							
								kicked_keys_write_addr <= kk_head;
								kicked_keys_write_valid <= 1;
								kk_head <= kk_head+1;
								kk_cnt <= kk_cnt+1;
							end

						end else begin
							write_data_prep <= rd_data;
							write_data_prep[(empty_mem_idx)*(KEY_WIDTH+HEADER_WIDTH) +: (KEY_WIDTH+HEADER_WIDTH)] <= {inputReg[KEY_WIDTH+META_WIDTH-1],inputReg[10+64+KEY_WIDTH-1:KEY_WIDTH+64],(op_retry==0) ? mallocRegData[30:0] : oldpointer[30:0] ,inputReg[KEY_WIDTH-1:0]};

							fastforward_write_data <= rd_data;
							fastforward_write_data[(empty_mem_idx)*(KEY_WIDTH+HEADER_WIDTH) +: (KEY_WIDTH+HEADER_WIDTH)] <= {inputReg[KEY_WIDTH+META_WIDTH-1],inputReg[10+64+KEY_WIDTH-1:KEY_WIDTH+64],(op_retry==0) ? mallocRegData[30:0] : oldpointer[30:0] ,inputReg[KEY_WIDTH-1:0]};

							fastforward_write_valid <= 1;
							fastforward_write_addr <= ff_head;

							feedback_valid <= ~empty_mem;
							feedback_data[KEY_WIDTH-1:0] <= rd_data[(empty_mem_idx)*(KEY_WIDTH+HEADER_WIDTH) +: (KEY_WIDTH)];
							feedback_data[KEY_WIDTH +: META_WIDTH] <= 0;
							feedback_data[KEY_WIDTH+META_WIDTH-1:KEY_WIDTH+META_WIDTH-8] <= {~rd_data[(empty_mem_idx+1)*(KEY_WIDTH+HEADER_WIDTH)-1],1'b1,1'b1,1'b0,4'b1};
							feedback_data[KEY_WIDTH+META_WIDTH-5] <= 1;

							if (empty_mem==0) begin
								kicked_keys_write_data <= {1'b1,rd_data[(empty_mem_idx)*(KEY_WIDTH+HEADER_WIDTH) +: KEY_WIDTH+HEADER_WIDTH]};
								kicked_keys_write_addr <= kk_head;
								kicked_keys_write_valid <= 1;
								kk_head <= kk_head+1;
								kk_cnt <= kk_cnt+1;

							end
						end

						if (op_retry==1 && op_addrchoice==1 && inputReg[META_WIDTH+KEY_WIDTH-5]==0) begin
							output_valid <= 1;
							output_data[KEY_WIDTH-1:0] <= inputReg[KEY_WIDTH-1:0];
							output_data[KEY_WIDTH+HEADER_WIDTH-1:KEY_WIDTH] <= {inputReg[KEY_WIDTH+META_WIDTH-1],inputReg[10+64+KEY_WIDTH-1:KEY_WIDTH+64],(op_retry==0) ? mallocRegData[30:0] : oldpointer[30:0]};
							output_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-1:KEY_WIDTH+HEADER_WIDTH] <= inputReg[META_WIDTH+KEY_WIDTH-1:KEY_WIDTH];
						end

						if (op_retry==0 && op_addrchoice==0) begin
							feedback_valid <= 1;
							feedback_data <= inputReg;
							feedback_data[KEY_WIDTH-1:0] <= {inputReg[KEY_WIDTH+META_WIDTH-1],inputReg[10+64+KEY_WIDTH-1:KEY_WIDTH+64],(op_retry==0) ? mallocRegData[30:0] : oldpointer[30:0]};
							feedback_data[KEY_WIDTH+META_WIDTH-1] <= 1;	
							feedback_data[KEY_WIDTH+META_WIDTH-2] <= 1;
							feedback_data[KEY_WIDTH+META_WIDTH-3] <= 0;
							feedback_data[KEY_WIDTH+META_WIDTH-4] <= 1; // this means don't issue a read for this
							
						end 

						//wr_valid <= 1;
						state <= ST_WRITEDATA;
						rd_ready <= 0;
						
						wrcmd_data <= inputReg[KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:KEY_WIDTH+META_WIDTH];
						wrcmd_valid <= 1;
						wrcmd_data[31:MEMADDR_WIDTH] <= 0;
						
						fastforward_addr[ff_head] <= inputReg[KEY_WIDTH+META_WIDTH+HASHADDR_WIDTH-1:KEY_WIDTH+META_WIDTH];
						

						//malloc_ready <= ~op_retry;

						ff_head <= ff_head+1;

						if (delayer[MEM_WRITE_WAIT-1]==1) begin
							ff_cnt <= ff_cnt; // to counter the decrease from before
						end else begin
							ff_cnt <= ff_cnt+1;
						end

						delayer[0] <= 1;

					end else if (found_mem==1 || found_ff==1 || (found_kk==1 && found_kk_pos!=kk_tail-1) || (mallocRegValid==1 && mallocRegFail==1 && op_retry==0)) begin
						//the key already exists...
						//if (found_kk==0 || kicked_keys_found_reg[KEY_WIDTH+HEADER_WIDTH]==0) begin
						//	output_valid <= 1;
						//end						

						//output_data[KEY_WIDTH-1:0] <= inputReg[KEY_WIDTH-1:0];
						//output_data[KEY_WIDTH+HEADER_WIDTH-1:KEY_WIDTH] <= 0;  
						//output_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-1:KEY_WIDTH+HEADER_WIDTH] <= inputReg[META_WIDTH+KEY_WIDTH-1:KEY_WIDTH];

						if (op_retry==0 && op_addrchoice==0) begin
							feedback_valid <= 1;
							feedback_data <= inputReg;
							feedback_data[KEY_WIDTH-1:0] <= {inputReg[KEY_WIDTH+META_WIDTH-1],inputReg[10+64+KEY_WIDTH-1:KEY_WIDTH+64],31'd0};
							feedback_data[KEY_WIDTH+META_WIDTH-1] <= 1;	
							feedback_data[KEY_WIDTH+META_WIDTH-2] <= 1;
							feedback_data[KEY_WIDTH+META_WIDTH-3] <= 0;
							feedback_data[KEY_WIDTH+META_WIDTH-4] <= 1; // this means don't issue a read for this
							
						end 	
						

						if (found_kk==1 && kicked_keys_found_reg[KEY_WIDTH+HEADER_WIDTH]==0) begin 
							free_valid <= 1;
							free_pointer <= {1'b1, oldpointer[30:0]};
							free_size <= kicked_keys_found_reg[KEY_WIDTH+31 +: 10];
						end else if ((found_mem==1 || found_ff==1) && mallocRegValid==1) begin
							free_valid <= ~mallocRegFail;
							free_pointer <= mallocRegData;
							free_size <= inputReg[10+64+KEY_WIDTH-1:KEY_WIDTH+64];
						end

					end else begin
						//recirculate with second address
						feedback_valid <= 1;
						feedback_data <= inputReg;
						feedback_data[KEY_WIDTH+META_WIDTH-1] <= 1;	
						feedback_data[KEY_WIDTH+META_WIDTH-2] <= 1;	
						feedback_data[KEY_WIDTH+META_WIDTH-3] <= 1;	
						feedback_data[KEY_WIDTH+META_WIDTH-4] <= 0;	

						kicked_keys_write_data <= {1'b0, inputReg[KEY_WIDTH+META_WIDTH-1],inputReg[10+64+KEY_WIDTH-1:KEY_WIDTH+64],mallocRegData[30:0],inputReg[KEY_WIDTH-1:0]};							
						kicked_keys_write_valid <= 1;
						kicked_keys_write_addr <= kk_head;
						kk_head <= kk_head+1;
						kk_cnt <= kk_cnt+1;	
					end
					
				end
				
				
			end


			ST_WRITEDATA : begin
				wr_data <= write_data_prep;
				wr_valid <= 1;

				rd_ready <= 1;
				state <= ST_IDLE;

				
			end

		endcase
		
	end
end

        
   endmodule