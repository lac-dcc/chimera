// This program was cloned from: https://github.com/hutch31/tv80
// License: MIT License

// converter bewteen TV80 interface and srdy-drdy scoreboard
// assumes 64-bit wide scoreboard interface,
// single-transaction, with txid used by scoreboard to steer
// requests back (not used by this block).

// z_asz -- number of Z80 address bits being decoded
// s_asz -- address size of scoreboard (

`define TV80DELAY

module sd_access64
  #(parameter z_asz = 14,
    parameter s_asz = (z_asz-3))
  (
   input         reset, 
   input         clk,
   output reg    ack,     // maps to wait_n signal, only valid when cs_n is valid
   input         mreq_n,
   input         cs_n,    // block select for this block
   input         rd_n, 
   input         wr_n, 
   input [z_asz-1:0]  addr,
   input [7:0]   wr_data,
   output [7:0]  rd_data,

   output reg       z2s_srdy,
   input            z2s_drdy,
   output reg       z2s_req_type, // 0=read, 1=write
   output reg [63:0] z2s_mask,
   output reg [63:0] z2s_data,
   output reg [s_asz-1:0]   z2s_itemid,

   input               s2z_srdy,
   output reg          s2z_drdy,
   input [63:0]        s2z_data
   );

  localparam s_idle = 0, s_wait_idle = 1, s_wait_rd = 2;

  reg 		       nxt_ack;
//  reg [7:0] 	       nxt_rd_data;
  reg [1:0] 	       state, nxt_state;
  //wire [7:0] 	       nxt_rd_data;
  reg [63:0] 	       cline, nxt_cline;  // cache line data
  reg [s_asz-1:0]      caddr, nxt_caddr;  // cache line addr
  reg 		       cvld, nxt_cvld;    // cache line valid
  wire 		       c_hit;

  assign c_hit = cvld & (caddr == addr[z_asz-1:3]);

  function [7:0] read_mux;
    input [2:0]        f_addr;
    input [63:0]       data;
    begin
      case (f_addr)
	0 : read_mux = data[63:56];
	1 : read_mux = data[55:48];
	2 : read_mux = data[47:40];
	3 : read_mux = data[39:32];
	4 : read_mux = data[31:24];
	5 : read_mux = data[23:16];
	6 : read_mux = data[15:8];
	7 : read_mux = data[7:0];
      endcase // case (f_addr)
    end
  endfunction // case

  function [63:0] write_mask;
    input [2:0] f_addr;
    begin
      case (f_addr)
	0 : write_mask = {8'hFF, {7{8'h00}}};
	1 : write_mask = {8'h00, 8'hFF, {6{8'h00}}};
	2 : write_mask = {{2{8'h00}}, 8'hFF, {5{8'h00}}};
	3 : write_mask = {{3{8'h00}}, 8'hFF, {4{8'h00}}};
	4 : write_mask = {{4{8'h00}}, 8'hFF, {3{8'h00}}};
	5 : write_mask = {{5{8'h00}}, 8'hFF, {2{8'h00}}};
	6 : write_mask = {{6{8'h00}}, 8'hFF, {1{8'h00}}};
	7 : write_mask = {{7{8'h00}}, 8'hFF};
      endcase // case (f_addr)
    end
  endfunction // case

  assign rd_data = read_mux (addr[2:0], cline);

  always @*
    begin
      nxt_ack = ack;
      nxt_state = state;
      z2s_req_type = 0;
      z2s_mask = write_mask (addr[2:0]);
      z2s_data = {8{wr_data}};
      z2s_itemid = addr[z_asz-1:3];
      z2s_srdy = 0;
//      nxt_rd_data = rd_data;
      s2z_drdy = 0;
      nxt_cline = cline;
      nxt_caddr = caddr;
      nxt_cvld  = cvld;

      case (state)
	s_idle :
	  begin
	    nxt_ack = 0;

	    // check for cache line hit
	    if (!mreq_n & !cs_n & !rd_n & c_hit)
	      begin
		nxt_ack = 1;
		nxt_state = s_wait_idle;
	      end
	    else if (!mreq_n & !cs_n & (!rd_n | !wr_n))
	      begin
		z2s_srdy = 1;
		if (!wr_n)
		  begin
		    z2s_req_type = 1;
		    if (c_hit)
		      nxt_cvld = 0;
		  end
		else
		  z2s_req_type = 0;
		z2s_data = {8{wr_data}};
		z2s_itemid = addr[z_asz-1:3];
		if (z2s_drdy)
		  begin
		    if (!wr_n)
		      begin
			nxt_ack = 1;
			nxt_state = s_wait_idle;
		      end
		    else
		      nxt_state = s_wait_rd;
		  end
	      end // if (!mreq_n & !cs_n & (!rd_n | !wr_n))
	  end // case: s_idle

	s_wait_idle :
	  begin
	    if (mreq_n | cs_n)
	      begin
		nxt_state = s_idle;
		nxt_ack = 0;
	      end
	  end

	s_wait_rd :
	  begin
	    s2z_drdy = 1;
	    //nxt_rd_data = read_mux (addr[2:0], s2z_data);
	    if (s2z_srdy)
	      begin
		//nxt_rd_data = s2z_data >> {addr[2:0], 3'h0};
		//nxt_ack = 1;
		nxt_state = s_idle;
		nxt_cvld = 1;
		nxt_caddr = addr[z_asz-1:3];
		nxt_cline = s2z_data;
	      end
	  end // case: s_wait_rd

	default :
	  nxt_state = s_idle;
      endcase // case (state)
    end // always @ *

  always @(posedge clk or posedge reset)
    begin
      if (reset)
	begin
	  /*AUTORESET*/
	  // Beginning of autoreset for uninitialized flops
	  ack <= 1'h0;
	  caddr <= {s_asz{1'b0}};
	  cline <= 64'h0;
	  cvld <= 1'h0;
	  state <= 2'h0;
	  // End of automatics
	end
      else
	begin
	  state <= `TV80DELAY nxt_state;
	  ack   <= `TV80DELAY nxt_ack;
//	  rd_data <= `TV80DELAY nxt_rd_data;
	  cvld  <= `TV80DELAY nxt_cvld;
	  caddr <= `TV80DELAY nxt_caddr;
	  cline <= `TV80DELAY nxt_cline;
	end
    end // always @ (posedge clk or posedge reset)

endmodule // sd_access64

