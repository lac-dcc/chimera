// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef icache.v
`else
 `define icache.v
// ----------------------------------------------------------------------------------------------------
 `include "defines.v"

module icache
  #(
    parameter WORD_SELECT_BIT = 3,
    parameter INDEX_BIT = 2,
    parameter NASSOC = 2
    )
   (
    input 	       clk,
    input 	       rst,
    input 	       ce,
   
    // About CPU
    input [31:0]       addr,

    input 	       read_flag,
    output reg [31:0]  read_data,

    // About memory
    output reg 	       cache_req_o,
    output reg [31:0]  cache_addr_o,

    output reg 	       cache_write_o,
    output wire [31:0] cache_write_data_o,
    output wire [3:0]  cache_write_mask_o,
   
    input 	       cache_rep_i,
    input [63:0]       cache_rep_data_i,

    // About control
    output reg 	       stallreq
    );
   
   parameter NBLOCK = 1<<INDEX_BIT;
   parameter TAG_BIT = 32-INDEX_BIT-WORD_SELECT_BIT;
   
   wire [TAG_BIT-1:0]  addr_tag = addr[31:31-TAG_BIT+1]; // TAG
   wire [INDEX_BIT-1:0] addr_index = addr[WORD_SELECT_BIT+INDEX_BIT-1:WORD_SELECT_BIT]; // index

   reg [TAG_BIT-1:0] 	ctag[NASSOC-1:0][NBLOCK-1:0];
   reg 			cvalid[NASSOC-1:0][NBLOCK-1:0];
   reg [7:0] 		cdata[NASSOC-1:0][NBLOCK-1:0][1<<WORD_SELECT_BIT:0];
   
   reg 			crep[NBLOCK-1:0];
   
   integer 		i,j,k;
   
   // --------------------------------------------------Read--------------------------------------------------

   always @ (clk)
     begin
   	if (rst == `RstEnable)
   	  begin
	     for (i = 0;i < NASSOC;i = i+1)
	       for (j = 0;j < NBLOCK;j = j+1)
		 begin
		    ctag[i][j] <= 0;
		    cvalid[i][j] <= 0;
		    for (k = 0;k < (1<<WORD_SELECT_BIT);k = k+1)
		      cdata[i][j][k] <= 0;
		 end
	     for (i = 0;i < NBLOCK;i = i+1) crep[i] = 0;
	     read_data <= 0;
	     cache_req_o <= 0;
	     cache_addr_o <= 0;
	     cache_write_o <= 0;
	     stallreq <= 0;
   	  end // if (rst == `RstEnable)
	
	else if (ce !== 1'b1)
	  begin
	     read_data <= 0;
	     cache_req_o <= 0;
	     cache_addr_o <= 0;
	     cache_write_o <= 0;
	     stallreq <= 0;	
	  end
	
	else if (read_flag == 1)
	  begin
	     read_data <= 0;
	     cache_req_o <= 0;
	     cache_addr_o <= 0;
	     cache_write_o <= 0;
   	     if (ctag[0][addr_index] == addr_tag&&cvalid[0][addr_index] == 1'b1)
   	       begin
      		  crep[addr_index] <= 1;
		  stallreq <= 0;
   		  if (addr[2] == 0)
   		    read_data <= {cdata[0][addr_index][0],cdata[0][addr_index][1],
   				  cdata[0][addr_index][2],cdata[0][addr_index][3]};
   		  if (addr[2] == 1)
   		    read_data <= {cdata[0][addr_index][4],cdata[0][addr_index][5],
   				  cdata[0][addr_index][6],cdata[0][addr_index][7]};
   	       end // if (ctag[0][addr_index] == addr_tag&&cvalid[0][addr_index] == 1'b1)
	     
   	     if (ctag[1][addr_index] == addr_tag&&cvalid[1][addr_index] == 1'b1)
   	       begin
		  crep[addr_index] <= 0;
   		  stallreq <= 0;	
		  if (addr[2] == 0)
   		    read_data <= {cdata[1][addr_index][0],cdata[1][addr_index][1],
   				  cdata[1][addr_index][2],cdata[1][addr_index][3]};
   		  if (addr[2] == 1)
   		    read_data <= {cdata[1][addr_index][4],cdata[1][addr_index][5],
   				  cdata[1][addr_index][6],cdata[1][addr_index][7]};
   	       end // if (ctag[1][addr_index] == addr_tag&&cvalid[1][addr_index] == 1'b1)

	     if (!(ctag[0][addr_index] == addr_tag&&cvalid[0][addr_index] == 1'b1)&&!(ctag[1][addr_index] == addr_tag&&cvalid[1][addr_index] == 1'b1))
   	       begin
		  stallreq <= 1'b1;
   		  cache_addr_o <= addr;
   		  cache_req_o <= 1'b1;
    	       end
	  end // if (read_flag == 1)
		
     end // always @ (read_flag or addr)
   
   always @ (cache_req_o)
     begin

	if (rst == `RstEnable)
   	  begin
	     for (i = 0;i < NASSOC;i = i+1)
	       for (j = 0;j < NBLOCK;j = j+1)
		 begin
		    ctag[i][j] <= 0;
		    cvalid[i][j] <= 0;
		    for (k = 0;k < (1<<WORD_SELECT_BIT);k = k+1)
		      cdata[i][j][k] <= 0;
		 end
	     for (i = 0;i < NBLOCK;i = i+1) crep[i] = 0;
	     read_data <= 0;
	     cache_req_o <= 0;
	     cache_addr_o <= 0;
	     cache_write_o <= 0;
	     stallreq <= 0;
   	  end // if (rst == `RstEnable)
	
	else if (ce !== 1'b1)
	  begin
	     read_data <= 0;
	     cache_req_o <= 0;
	     cache_addr_o <= 0;
	     cache_write_o <= 0;
	     stallreq <= 0;	
	  end
	
	else if (cache_rep_i == 1)
	  begin
	     if (crep[addr_index] == 1'b0)
	       begin
		  cvalid[0][addr_index] <= 1'b1;
		  ctag[0][addr_index] <= addr_tag;
		  cdata[0][addr_index][0] <= cache_rep_data_i[7:0];
		  cdata[0][addr_index][1] <= cache_rep_data_i[15:8];
		  cdata[0][addr_index][2] <= cache_rep_data_i[23:16];
		  cdata[0][addr_index][3] <= cache_rep_data_i[31:24];
		  cdata[0][addr_index][4] <= cache_rep_data_i[39:32];
		  cdata[0][addr_index][5] <= cache_rep_data_i[47:40];
		  cdata[0][addr_index][6] <= cache_rep_data_i[55:48];
		  cdata[0][addr_index][7] <= cache_rep_data_i[63:56];
	       end

	     if (crep[addr_index] == 1'b1)
	       begin
		  cvalid[1][addr_index] <= 1'b1;
		  ctag[1][addr_index] <= addr_tag;
		  cdata[1][addr_index][0] <= cache_rep_data_i[7:0];
		  cdata[1][addr_index][1] <= cache_rep_data_i[15:8];
		  cdata[1][addr_index][2] <= cache_rep_data_i[23:16];
		  cdata[1][addr_index][3] <= cache_rep_data_i[31:24];
		  cdata[1][addr_index][4] <= cache_rep_data_i[39:32];
		  cdata[1][addr_index][5] <= cache_rep_data_i[47:40];
		  cdata[1][addr_index][6] <= cache_rep_data_i[55:48];
		  cdata[1][addr_index][7] <= cache_rep_data_i[63:56];
	       end
	  end // if (cache_rep_i == 1)
     end // always @ (cache_rep_i or addr)
   
   
endmodule // icache

// ----------------------------------------------------------------------------------------------------
`endif
