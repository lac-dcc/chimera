/*!
   btcminer
   Copyright 2011 ngzhang & lee
   ngzhang1983@msn.com

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/


`timescale 1ns/1ps

module sha256_top (
    clk,
    rst,
    midstate,
    data2,
    miner_busy,
    got_ticket,
    golden_nonce,
	 nonce_start,
	 start_mining
);

parameter NONCE_CT = 31'd256;

input           clk;
input           rst;
input nonce_start;
input start_mining;

input   [255:0] midstate;
input   [95:0]  data2;

output          miner_busy;
output          got_ticket;
output  [31:0]  golden_nonce;

wire    [30:0]  nonce_next;
wire            pipe1_end, pipe2_end;
wire    [255:0] hash;
wire    [31:0]  hash2;
wire    [511:0] data;
wire 	  nonce_to_set;
reg     [30:0]  nonce;
wire     start_mining;
reg     [31:0]  golden_nonce;
reg 	  [30:0]  golden_nonce_ct;
reg             got_ticket, got_ticket_d1,got_ticket_d2, got_ticket_d3 ;
reg             work;
reg             nonce_to = 1'b1;
reg		[255:0]	midstate_d1;
reg		[95:0]	data2_d1;
reg 		nonce_to_num_d1;
reg		start_mining_d1;
reg	[31:0]	hash2_head;
reg    miner_busy;
reg    reset_n1,reset_n2,reset_n3,reset_n4,reset_n5,reset_n6;


//  BUFGCE clkout1_buf
//   (.O   (clk_work),
//    .CE  (work),
//    .I   (clk));

	sha256_pipe130 p1 (
		.clk(clk),
		.state(midstate_d1),
		.state2(midstate_d1),
		.data({384'h000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000, nonce_start,nonce, data2_d1}),
		.hash(hash)
	);

	sha256_pipe123 p2 (
		.clk(clk),
		.data({256'h0000010000000000000000000000000000000000000000000000000080000000, hash}),
		.hash(hash2)
	);


////////////////////////////////////////////////////////////////////////////////////////////////////

assign nonce_next    = nonce + 31'd1;


always@(posedge clk)
    if(reset_n5)
        work <= #1 1'b0;
    else  
		if(start_mining_d1)
			work <= #1 1'b1;
		 else
			if(got_ticket_d1 || nonce_to_num_d1)
				work <= 1'b0;
			else
				work <= work;


always@(posedge clk)
begin
    if(reset_n6)
        nonce <= #1 NONCE_CT;
	 else if(start_mining_d1)
		  nonce <= #1 NONCE_CT;
    else if(work)
        nonce <= #1 nonce_next;
	 else
		  nonce <= #1 NONCE_CT;
end



always@(posedge clk)
	begin
			got_ticket_d1 <= (hash2_head== 32'ha41f32e7);
			got_ticket_d2 <= got_ticket_d1;
			got_ticket_d3 <= got_ticket_d2;
			nonce_to_num_d1 <= (nonce == 31'h7fffffff);
			midstate_d1 <= midstate;
			hash2_head <= hash2;
			data2_d1 <= data2;
			start_mining_d1 <= start_mining;
			miner_busy    <= work;
	end

always@(*)
	begin
			reset_n1	= rst;
			reset_n2	= rst;
			reset_n3	= rst;
			reset_n5	= rst;
			reset_n6	= rst;
	end

always@(posedge clk)
begin
    if(reset_n1)
		  got_ticket <= #1 1'b0;
	 else if (start_mining_d1)
		got_ticket <= #1 1'b0;
    else if(got_ticket_d3)
      got_ticket <= #1 1'b1;
	 else
		got_ticket <= #1 got_ticket;
end

always@(posedge clk)
begin
    if(reset_n2)
        golden_nonce_ct <= #1 31'b0;
	 else if (start_mining_d1)
		  golden_nonce_ct <= #1 31'b0;
	 else if (work)
		  golden_nonce_ct <= #1 golden_nonce_ct + 1'b1;
    else
        golden_nonce_ct <= #1 golden_nonce_ct;
end
//////////////////////////////////////////////
always@(*)
begin
	golden_nonce = got_ticket?{nonce_start,golden_nonce_ct}:32'b0;
end


endmodule

