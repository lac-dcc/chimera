/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/********************************************************************
 * Author: Sam Payne
 * 
 * Module encapsulates an asynchronus FIFO used for bridging signals
 * across clock domains, parameters allow for different sized modules
 * compatible with wide range of frequencies.
 *
 * * *******************************************************************/



module async_fifo 
#(
	parameter DSIZE = 64,
	parameter ASIZE = 5,
	parameter MEMSIZE = 16 // should be 2 ^ (ASIZE-1)
)
(
	rdata, 
	rempty,
	rclk,
	ren,
	wdata,
	wfull,
	wclk,
	wval,
	wreset,
	rreset
	);

//Inputs and Outputs
output  [DSIZE-1:0] 	rdata;
output			rempty;
output 			wfull;
input	[DSIZE-1:0]	wdata;
input			wval;
input			ren;
input			rclk;
input			wclk;
input 			wreset;
input			rreset;

//Internal Registers
reg	[ASIZE-1:0]	g_wptr;
reg	[ASIZE-1:0]	g_rptr;

reg	[ASIZE-1:0]	g_rsync1, g_rsync2;
reg	[ASIZE-1:0]	g_wsync1, g_wsync2;

//Memory
reg	[DSIZE-1:0] 	fifo[MEMSIZE-1:0];

wire [ASIZE-1:0] b_wptr;
wire [ASIZE-1:0] b_wptr_next;
wire [ASIZE-1:0] g_wptr_next;
wire [ASIZE-1:0] b_rptr;
wire [ASIZE-1:0] b_rptr_next;
wire [ASIZE-1:0] g_rptr_next;

/********************************************************************
COMBINATIONAL LOGIC
********************************************************************/

//convert gray to binary
assign b_wptr[ASIZE-1:0] = ({1'b0, b_wptr[ASIZE-1:1]} ^ g_wptr[ASIZE-1:0]);
assign b_rptr[ASIZE-1:0] = ({1'b0, b_rptr[ASIZE-1:1]} ^ g_rptr[ASIZE-1:0]);

//increment
assign b_wptr_next = b_wptr + 1;
assign b_rptr_next = b_rptr + 1;

//convert binary to gray
assign g_wptr_next[ASIZE-1:0] = {1'b0, b_wptr_next[ASIZE-1:1]} ^ b_wptr_next[ASIZE-1:0];
assign g_rptr_next[ASIZE-1:0] = {1'b0, b_rptr_next[ASIZE-1:1]} ^ b_rptr_next[ASIZE-1:0];

//full and empty signals
assign wfull =  (g_wptr[ASIZE-1]   != g_rsync2[ASIZE-1]  ) && 
		(g_wptr[ASIZE-2]   != g_rsync2[ASIZE-2]  ) &&
		(g_wptr[ASIZE-3:0] == g_rsync2[ASIZE-3:0]) ||
		(wreset || rreset);

assign rempty =  (g_wsync2[ASIZE-1:0] == g_rptr[ASIZE-1:0]) ||
	         (wreset || rreset);

//output values
assign rdata = fifo[b_rptr[ASIZE-2:0]];

/********************************************************************
SEQUENTIAL LOGIC
********************************************************************/

//transfer register values
always @(posedge rclk) begin
	if (rreset) begin
		g_rptr <= 0;
	end
	else if (ren && !rempty) begin
		g_rptr <= g_rptr_next;
	end

	g_wsync1 <= g_wptr;
	g_wsync2 <= g_wsync1;
end

always @(posedge wclk) begin
	if (wreset) begin
		g_wptr <= 0;
	end
	else if (wval && !wfull) begin
		fifo[b_wptr[ASIZE-2:0]] <= wdata;
		g_wptr <= g_wptr_next;
	end

	g_rsync1 <= g_rptr;
	g_rsync2 <= g_rsync1;

	
end

endmodule
// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Author:      Alexey Lavrov, Tri Nguyen
// Description: A simple wrapper to infer Xilinx BRAMs for SRAMs, modified to be synthesizable

module bram_1r1w_wrapper 
#(parameter NAME="", DEPTH=1, ADDR_WIDTH=1, BITMASK_WIDTH=1, DATA_WIDTH=1)
(
  input wire MEMCLK,
  input wire RESET_N,
  input wire CEA,
  input wire [ADDR_WIDTH-1:0] AA,
  input wire [ADDR_WIDTH-1:0] AB,

  input wire RDWENA,
  input wire CEB,
  input wire RDWENB,
  input wire [DATA_WIDTH-1:0] BWA,
  input wire [DATA_WIDTH-1:0] DINA,
  output reg [DATA_WIDTH-1:0] DOUTA,
  input wire [DATA_WIDTH-1:0] BWB,
  input wire [DATA_WIDTH-1:0] DINB,
  output wire [DATA_WIDTH-1:0] DOUTB
  // input wire [`BIST_OP_WIDTH-1:0] BIST_COMMAND,
  // input wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DIN,
  // output reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DOUT,
  // input wire [`BIST_ID_WIDTH-1:0] SRAMID
);

wire                            write_enable_in;
wire                            read_enable_in;

// Temporary storage for write data
reg                             write_enable_in_reg;
reg   [ADDR_WIDTH-1:0    ]      WRITE_ADDRESS_REG;
reg   [ADDR_WIDTH-1:0    ]      WRITE_ADDRESS_REG_muxed;
reg   [BITMASK_WIDTH-1:0 ]      WRITE_BIT_MASK_REG;
reg   [DATA_WIDTH-1:0    ]      DIN_r;
// reg   [DATA_WIDTH-1:0    ]      DOUTB_r;

reg                             read_enable_in_reg;

reg   [DATA_WIDTH-1:0    ]      bram_data_in_r;

wire                            bram_write_en;
reg                            bram_write_en_muxed;
wire                            bram_read_en;
wire                            bram_write_read_en;
reg  [DATA_WIDTH-1:0    ]      bram_data_write_read_out_reg;
reg  [DATA_WIDTH-1:0    ]      bram_data_read_out_reg;
reg  [DATA_WIDTH-1:0    ]      bram_data_in;
reg  [DATA_WIDTH-1:0    ]      bram_data_in_muxed;
wire  [DATA_WIDTH-1:0    ]      last_wrote_data;
wire                            rw_conflict;
reg                             rw_conflict_r;
wire                            ww_conflict;
reg                             ww_conflict_r;

/* renaming signals */
assign read_enable_in    = CEA & (RDWENA == 1'b1);
assign write_enable_in   = CEB & (RDWENB == 1'b0);
wire [ADDR_WIDTH-1:0    ] READ_ADDRESS = AA;
wire [ADDR_WIDTH-1:0    ] WRITE_ADDRESS = AB;
wire [BITMASK_WIDTH-1:0    ] WRITE_BIT_MASK = BWB;

// Intermediate logic for write processing
always @(posedge MEMCLK) begin
  write_enable_in_reg <= write_enable_in;
  WRITE_ADDRESS_REG   <= WRITE_ADDRESS;
  WRITE_BIT_MASK_REG  <= WRITE_BIT_MASK;
  DIN_r <= DINB;
  read_enable_in_reg  <= read_enable_in;
  bram_data_in_r <= bram_data_in;
  rw_conflict_r  <= rw_conflict;
  ww_conflict_r  <= ww_conflict;
  // DOUTB_r  <= DOUTB;
end

// determining read-write and write-write conflict for data bypassing
assign rw_conflict      = write_enable_in_reg & read_enable_in & (WRITE_ADDRESS_REG == READ_ADDRESS);
assign ww_conflict      = write_enable_in_reg & write_enable_in & (WRITE_ADDRESS_REG == WRITE_ADDRESS);
assign DOUTB = {DATA_WIDTH{1'bx}}; // port B is always used for write

// calculate the correct read and write data after accoutning for conflicts
always @ * begin
  bram_data_in = (DIN_r & WRITE_BIT_MASK_REG);
  if (ww_conflict_r)
    bram_data_in = bram_data_in | (bram_data_in_r & ~WRITE_BIT_MASK_REG);
  else
    bram_data_in = bram_data_in | (bram_data_write_read_out_reg & ~WRITE_BIT_MASK_REG);
  

  // note: DOUT retains value if read enable is not asserted
  // which is why default value is not set for DOUT
  if (read_enable_in_reg) begin
    DOUTA = bram_data_read_out_reg; 
    if (rw_conflict_r) begin
      DOUTA = bram_data_in_r;
    end
  end
end

// synthesizable BRAM
assign bram_write_en      = write_enable_in_reg;
assign bram_read_en         = (read_enable_in) & ~rw_conflict;             // do not read in case of a conflict
assign bram_write_read_en         = (write_enable_in) & ~ww_conflict;             // do not read in case of a conflict

reg [DATA_WIDTH-1:0] ram [DEPTH-1:0];
// reg [%d-1:0] bram_data_write_read_out_reg;
always @(posedge MEMCLK) begin
  if (bram_write_en_muxed) begin
    ram[WRITE_ADDRESS_REG_muxed] <= bram_data_in_muxed;
  end
  if (bram_read_en) begin
    bram_data_read_out_reg <= ram[READ_ADDRESS];
  end
  if (bram_write_read_en) begin
    bram_data_write_read_out_reg <= ram[WRITE_ADDRESS];
  end
end
// END BRAM


/* BIST logic for resetting RAM content to 0s on reset*/
localparam INIT_STATE = 1'd0;
localparam DONE_STATE  = 1'd1;

reg [ADDR_WIDTH-1:0] bist_index;
reg [ADDR_WIDTH-1:0] bist_index_next;
reg init_done;
reg init_done_next;

always @ (posedge MEMCLK)
begin
   if (!RESET_N)
   begin
      bist_index <= 0;
      init_done <= 0;
   end
   else
   begin
      bist_index <= bist_index_next;
      init_done <= init_done_next;
   end
end

always @ *
begin
   bist_index_next = init_done ? bist_index : bist_index + 1;
   init_done_next = ((|(~bist_index)) == 0) | init_done;
end

// MUX for BIST
always @ *
begin
   if (!init_done)
   begin
      WRITE_ADDRESS_REG_muxed = bist_index;
      bram_write_en_muxed = 1'b1;
      bram_data_in_muxed = {DATA_WIDTH{1'b0}};
   end
   else
   begin
      WRITE_ADDRESS_REG_muxed = WRITE_ADDRESS_REG;
      bram_write_en_muxed = bram_write_en;
      bram_data_in_muxed = bram_data_in;
   end
end


endmodule
// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Author:      Alexey Lavrov, Tri Nguyen
// Description: A simple wrapper to infer Xilinx BRAMs for SRAMs

module bram_1rw_wrapper 
#(parameter NAME="", DEPTH=1, ADDR_WIDTH=1, BITMASK_WIDTH=1, DATA_WIDTH=1)
(
    input                         MEMCLK,
    input wire RESET_N,
    input                         CE,
    input   [ADDR_WIDTH-1:0]      A,
    input                         RDWEN,
    input   [BITMASK_WIDTH-1:0]   BW,
    input   [DATA_WIDTH-1:0]      DIN,
    output  [DATA_WIDTH-1:0]      DOUT
);

wire                            write_en;
wire                            read_en;

// Temporary storage for write data
reg                             wen_r;
reg   [ADDR_WIDTH-1:0    ]      A_r;
reg   [BITMASK_WIDTH-1:0 ]      BW_r;
reg   [DATA_WIDTH-1:0    ]      DIN_r;
reg   [DATA_WIDTH-1:0    ]      DOUT_r;

reg                             ren_r;

reg   [DATA_WIDTH-1:0    ]      bram_data_in_r;

wire                            bram_wen;
wire                            bram_ren;
reg  [DATA_WIDTH-1:0    ]      bram_data_out;
wire  [DATA_WIDTH-1:0    ]      bram_data_in;
wire  [DATA_WIDTH-1:0    ]      up_to_date_data;
wire                            rw_conflict;
reg                             rw_conflict_r;



reg   [ADDR_WIDTH-1:0    ]      WRITE_ADDRESS_REG_muxed;
reg                            bram_write_en_muxed;
reg  [DATA_WIDTH-1:0    ]      bram_data_in_muxed;

assign write_en   = CE & (RDWEN == 1'b0);
assign read_en    = CE & (RDWEN == 1'b1);


// Intermediate logic for write processing
always @(posedge MEMCLK) begin
   wen_r <= write_en;
   A_r   <= A;
   BW_r  <= BW;
   DIN_r <= DIN;
end

always @(posedge MEMCLK) begin
  ren_r  <= read_en;
end

always @(posedge MEMCLK)
   bram_data_in_r <= bram_data_in;

always @(posedge MEMCLK)
   rw_conflict_r  <= rw_conflict;

always @(posedge MEMCLK)
  DOUT_r  <= DOUT;

assign bram_data_in = (up_to_date_data & ~BW_r) | (DIN_r & BW_r);

// processing of read in case if it just in the next cycle after read to the same address
assign rw_conflict      = wen_r & CE & (A_r == A);                         // read or write to the same address
assign up_to_date_data  = rw_conflict_r ? bram_data_in_r : bram_data_out;  // delay of mem is 1 cycle
assign bram_ren         = (read_en | write_en) & ~rw_conflict;             // do not read in case of a conflict
                                                                        // to make behaviour of a memory robust
assign bram_wen      = wen_r;

assign DOUT          = ren_r ? up_to_date_data : DOUT_r;

// BRAM
reg [DATA_WIDTH-1:0] ram [DEPTH-1:0];
// reg [%d-1:0] bram_data_out;
always @(posedge MEMCLK) begin
  if (bram_write_en_muxed) begin
      ram[WRITE_ADDRESS_REG_muxed] <= bram_data_in_muxed;
  end
  if (bram_ren) begin
    bram_data_out <= ram[A];
  end
end
// END BRAM

 // undefined by default

/* BIST logic for resetting RAM content to 0s on reset*/
localparam INIT_STATE = 1'd0;
localparam DONE_STATE  = 1'd1;

reg [ADDR_WIDTH-1:0] bist_index;
reg [ADDR_WIDTH-1:0] bist_index_next;
reg init_done;
reg init_done_next;

always @ (posedge MEMCLK)
begin
   if (!RESET_N)
   begin
      bist_index <= 0;
      init_done <= 0;
   end
   else
   begin
      bist_index <= bist_index_next;
      init_done <= init_done_next;
   end
end

always @ *
begin
   bist_index_next = init_done ? bist_index : bist_index + 1;
   init_done_next = ((|(~bist_index)) == 0) | init_done;
end

// MUX for BIST
always @ *
begin
   if (!init_done)
   begin
      WRITE_ADDRESS_REG_muxed = bist_index;
      bram_write_en_muxed = 1'b1;
      bram_data_in_muxed = {DATA_WIDTH{1'b0}};
   end
   else
   begin
      WRITE_ADDRESS_REG_muxed = A_r;
      bram_write_en_muxed = bram_wen;
      bram_data_in_muxed = bram_data_in;
   end
end













endmodule
// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : synchronizer.v
//  Created On    : 2014-01-31 12:52:57
//  Last Modified : 2018-11-29 17:02:47
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   :
//==================================================================================================





module synchronizer (
    clk,
    presyncdata,
    syncdata
    );

// synopsys template
parameter SIZE = 1;

input wire clk;
input wire [SIZE-1:0] presyncdata;
output reg [SIZE-1:0] syncdata;













  reg [SIZE-1:0] presyncdata_tmp;



    // bw_u1_syncff_4x u_synchronizer_syncff [SIZE-1:0](.q(presyncdata_tmp),
    //                  .so(),
    //                  .ck(clk),
    //                  .d(presyncdata),
    //                  .sd(),
    //                  .se(1'b0)
    //                  );

    // bw_u1_soff_2x u_synchronizer_ff[SIZE-1:0] (.q(syncdata),
    //                  .so(),
    //                  .ck(clk),
    //                  .d(presyncdata_tmp),
    //                  .sd(),
    //                  .se(1'b0)
    //                  );

always @ (posedge clk)
begin
    presyncdata_tmp <= presyncdata;
    syncdata        <= presyncdata_tmp;
end

endmodule

/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//==================================================================================================
//  Filename      : sync_fifo.v
//  Created On    : 2014-10-13
//  Last Modified : 2014-10-13
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : A replacement for async fifo in case it doesn't work
//  Note          : It uses positive reset to be consistant with Sam's async fifo
//
//==================================================================================================


module sync_fifo 
#(
	parameter DSIZE = 64,
	parameter ASIZE = 5,
	parameter MEMSIZE = 16 // should be 2 ^ (ASIZE-1)
)
(
	rdata, 
	empty,
	clk,
	ren,
	wdata,
	full,
	wval,
	reset
	);

//Inputs and Outputs
output reg [DSIZE-1:0] 	rdata;
output reg			empty;
output reg			full;
input	[DSIZE-1:0]	wdata;
input			wval;
input			ren;
input			clk;
input 			reset;


reg [DSIZE-1:0] sync_buf_mem_f [MEMSIZE-1:0];
reg [ASIZE:0] sync_buf_counter_f;
reg [ASIZE:0] sync_buf_counter_next;
reg [ASIZE-2:0] sync_rd_ptr_f;
reg [ASIZE-2:0] sync_rd_ptr_next;
reg [ASIZE-2:0] sync_wr_ptr_f;
reg [ASIZE-2:0] sync_wr_ptr_next;

always @ *
begin
    empty = (sync_buf_counter_f == 0);
    full =  (sync_buf_counter_f ==  MEMSIZE);
end

always @ *
begin
    if (reset)
    begin
        sync_buf_counter_next = 0;
    end
    else if ((wval && !full) && (ren && !empty))
    begin
        sync_buf_counter_next = sync_buf_counter_f;
    end
    else if (wval && !full)
    begin
        sync_buf_counter_next = sync_buf_counter_f + 1;
    end
    else if (ren && !empty)
    begin
        sync_buf_counter_next = sync_buf_counter_f - 1;
    end
    else
    begin
        sync_buf_counter_next = sync_buf_counter_f;
    end
end


always @ (posedge clk)
begin
    sync_buf_counter_f <= sync_buf_counter_next;
end


always @ *
begin
    if (reset)
    begin   
        sync_rd_ptr_next = 0;
    end
    else if (ren && !empty)
    begin
        sync_rd_ptr_next = sync_rd_ptr_f + 1;
    end
    else
    begin
        sync_rd_ptr_next = sync_rd_ptr_f;
    end
end

always @ (posedge clk)
begin
    sync_rd_ptr_f <= sync_rd_ptr_next;
end

always @ *
begin
    if (reset)
    begin   
        sync_wr_ptr_next = 0;
    end
    else if (wval && !full)
    begin
        sync_wr_ptr_next = sync_wr_ptr_f + 1;
    end
    else
    begin
        sync_wr_ptr_next = sync_wr_ptr_f;
    end
end


always @ (posedge clk)
begin
    sync_wr_ptr_f <= sync_wr_ptr_next;
end

always @ *
begin
    rdata = sync_buf_mem_f[sync_rd_ptr_f];
end

always @ (posedge clk)
begin
    if (wval && !full)
    begin
        sync_buf_mem_f[sync_wr_ptr_f] <= wdata;
    end
    else
    begin 
        sync_buf_mem_f[sync_wr_ptr_f] <= sync_buf_mem_f[sync_wr_ptr_f];
    end
end



endmodule
/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/********************************************************************
 * Author: Sam Payne
 * 
 * Module encapsulates the off chip receive interface for networks 
 * 1, 2 and 3. packets received are 64 bits wide, received in 2 
 * 32-bit payloads.
 *
 *******************************************************************/

// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Header file for FPGA and system level macros

// Generally, if doing FPGA synth, certain things
// are not needed or are fixed, always.  These
// can be used for other purposes though



 // endif PITON_FPGA_SYNTH

// If we are doing FPGA prototype,
// at least for now, all prototypes
// include chip+chipset in same FPGA,
// include a real io_ctrl module,
// include a UART (not necessarily for boot),
// and include an SPI (not always used for boot,
// but for top-level constraints I/Os are needed)
// so the following macros always apply







































 // PITON_NOC_POWER_CHIPSET_TEST

// If we are synthesizing chipset
// for use with piton ASIC, we need
// these macros







 // endif PITON_ASIC_CHIPSET






  // PITON_BOARD_CHIPSET

// If we are synthesizing the chip
// only for FPGA, we need to use these
// macros






    
 // endif PITON_CLKS_PASSTHRU
 // endif PITON_CLKS_CHIPSET














// Nexys4ddr and NexysVideo has single ended clock input

// Reset is active high on VC707 and VCU118















// If PITON_FPGA_SD_BOOT is set we should always include SPI


 // endif PITON_FPGA_SD_BOOT

// If PITONSYS_UART_BOOT is set, we should always include a UART


 // endif PITONSYS_UART_BOOT







`timescale 1ns/1ps

module chip_bridge_in (
    rst, 
    wr_clk,
    rd_clk,
    async_mux,
    bout_data_1,
    bout_val_1,
    bout_rdy_1,
    bout_data_2,
    bout_val_2,
    bout_rdy_2,
    bout_data_3,
    bout_val_3,
    bout_rdy_3,
    data_from_fpga,
    data_channel,
    credit_to_fpga
); 

input rst;
input wr_clk;
input rd_clk;
input async_mux;
input bout_rdy_1;
input bout_rdy_2;
input bout_rdy_3;
input [31:0] data_from_fpga;
input [ 1:0] data_channel;

output [63:0]   bout_data_1;
output          bout_val_1;
output [63:0]   bout_data_2;
output          bout_val_2;
output [63:0]   bout_data_3;
output          bout_val_3;
output [2:0]    credit_to_fpga;


wire [63:0] async_bout_data_1;
wire [63:0] async_bout_data_2;
wire [63:0] async_bout_data_3;

wire [63:0] sync_bout_data_1;
wire [63:0] sync_bout_data_2;
wire [63:0] sync_bout_data_3;

wire sort_rdy_1;
wire sort_rdy_2;
wire sort_rdy_3;


wire [63:0] sort_data_1;
wire [63:0] sort_data_2;
wire [63:0] sort_data_3;

wire sort_val_1;
wire sort_val_2;
wire sort_val_3;

wire fifo1_empty;
wire fifo2_empty;
wire fifo3_empty;

wire async_fifo1_empty;
wire async_fifo2_empty;
wire async_fifo3_empty;

wire sync_fifo1_empty;
wire sync_fifo2_empty;
wire sync_fifo3_empty;


wire fifo1_full;
wire fifo2_full;
wire fifo3_full;
wire credit_fifo_full;

wire async_fifo1_full;
wire async_fifo2_full;
wire async_fifo3_full;
wire async_credit_fifo_full;

wire sync_fifo1_full;
wire sync_fifo2_full;
wire sync_fifo3_full;
wire sync_credit_fifo_full;

assign bout_val_1 = ~fifo1_empty & ~credit_fifo_full;
assign bout_val_2 = ~fifo2_empty & ~credit_fifo_full;
assign bout_val_3 = ~fifo3_empty & ~credit_fifo_full;


reg [31:0] channel_buffer;
reg [0:0]  channel_buffer_count;
wire [63:0] buffered_data;
reg [1:0] buffered_channel;




















/*********************************************************
//credit FIFO boot system
*********************************************************/

assign sort_data_1 = (buffered_channel == 2'b01 && channel_buffer_count == 1'b1) ? buffered_data : 64'd0;
assign sort_data_2 = (buffered_channel == 2'b10 && channel_buffer_count == 1'b1) ? buffered_data : 64'd0;
assign sort_data_3 = (buffered_channel == 2'b11 && channel_buffer_count == 1'b1) ? buffered_data : 64'd0;


assign sort_val_1  = (buffered_channel == 2'b01 && channel_buffer_count == 1'b1) ? 1'b1 : 1'b0;
assign sort_val_2  = (buffered_channel == 2'b10 && channel_buffer_count == 1'b1) ? 1'b1 : 1'b0;
assign sort_val_3  = (buffered_channel == 2'b11 && channel_buffer_count == 1'b1) ? 1'b1 : 1'b0;

/*********************************************************
//buffer broken up flits
*********************************************************/
assign buffered_data = {data_from_fpga, channel_buffer};

always @(posedge wr_clk) begin


 // ifndef PITON_PROTO
    if(rst) begin

        channel_buffer <= 32'd0;
        channel_buffer_count <= 0;
    end
    else begin
        if(data_channel != 0) begin //do not store data if no channel is assigned
            channel_buffer <= data_from_fpga;
            buffered_channel <= data_channel;
            channel_buffer_count <= channel_buffer_count + 1'b1;
        end
        else begin
            buffered_channel <= data_channel;
            channel_buffer_count <= 1'b0;
        end
    end
end

//input-output fixed to 64 bits
/*********************************************************
//data FIFOs
*********************************************************/













 // ifndef PITON_PROTO
async_fifo #(
.DSIZE(64),
.ASIZE(5),
.MEMSIZE(16) )
async_fifo_1(
    .rreset(rst),
    .wreset(rst),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(bout_rdy_1 & ~credit_fifo_full & async_mux),
    .wval(sort_val_1 & async_mux),
    .wdata(sort_data_1),
    .rdata(async_bout_data_1),
    .wfull(async_fifo1_full), //credit system should prevent this from ever being full
    .rempty(async_fifo1_empty)
);
 // endif PITON_PROTO













 //ifndef PITON_PROTO
async_fifo #(
.DSIZE(64),
.ASIZE(5),
.MEMSIZE(16) )
async_fifo_2(
    .rreset(rst),
    .wreset(rst),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(bout_rdy_2 & ~credit_fifo_full & async_mux),
    .wval(sort_val_2 & async_mux),
    .wdata(sort_data_2),
    .rdata(async_bout_data_2),
    .wfull(async_fifo2_full), //credit system should prevent this from ever being full
    .rempty(async_fifo2_empty)
);
 // endif PITON_PROTO














 // ifndef PITON_PROTO
async_fifo #(
.DSIZE(64),
.ASIZE(5),
.MEMSIZE(16) )
async_fifo_3(
    .rreset(rst),
    .wreset(rst),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(bout_rdy_3 & ~credit_fifo_full & async_mux),
    .wval(sort_val_3 & async_mux),
    .wdata(sort_data_3),
    .rdata(async_bout_data_3),
    .wfull(async_fifo3_full), //credit system should prevent this from ever being full
    .rempty(async_fifo3_empty)
);
 // endif PITON_PROTO
















 // ifndef PITON_PROTO
sync_fifo #(
.DSIZE(64),
.ASIZE(5),
.MEMSIZE(16) )
sync_fifo_1(
    .reset(rst),
    .clk(wr_clk),
    .ren(bout_rdy_1 & ~credit_fifo_full & ~async_mux),
    .wval(sort_val_1 & ~async_mux),
    .wdata(sort_data_1),
    .rdata(sync_bout_data_1),
    .full(sync_fifo1_full), //credit system should prevent this from ever being full
    .empty(sync_fifo1_empty)
);
 //endif PITON_PROTO
















 // ifndef PITON_PROTO
sync_fifo #(
.DSIZE(64),
.ASIZE(5),
.MEMSIZE(16) )
sync_fifo_2(
    .reset(rst),
    .clk(wr_clk),
    .ren(bout_rdy_2 & ~credit_fifo_full & ~async_mux),
    .wval(sort_val_2 & ~async_mux),
    .wdata(sort_data_2),
    .rdata(sync_bout_data_2),
    .full(sync_fifo2_full), //credit system should prevent this from ever being full
    .empty(sync_fifo2_empty)
);
 // endif PITON_PROTO
















 // ifndef PITON_PROTO
sync_fifo #(
.DSIZE(64),
.ASIZE(5),
.MEMSIZE(16) )
sync_fifo_3(
    .reset(rst),
    .clk(wr_clk),
    .ren(bout_rdy_3 & ~credit_fifo_full & ~async_mux),
    .wval(sort_val_3 & ~async_mux),
    .wdata(sort_data_3),
    .rdata(sync_bout_data_3),
    .full(sync_fifo3_full), //credit system should prevent this from ever being full
    .empty(sync_fifo3_empty)
);
 // endif PITON_PROTO

assign fifo1_full = async_mux ? async_fifo1_full : sync_fifo1_full;
assign fifo2_full = async_mux ? async_fifo2_full : sync_fifo2_full;
assign fifo3_full = async_mux ? async_fifo3_full : sync_fifo3_full;

assign fifo1_empty = async_mux ? async_fifo1_empty : sync_fifo1_empty;
assign fifo2_empty = async_mux ? async_fifo2_empty : sync_fifo2_empty;
assign fifo3_empty = async_mux ? async_fifo3_empty : sync_fifo3_empty;

assign bout_data_1 = async_mux ? async_bout_data_1 : sync_bout_data_1;
assign bout_data_2 = async_mux ? async_bout_data_2 : sync_bout_data_2;
assign bout_data_3 = async_mux ? async_bout_data_3 : sync_bout_data_3;


/*********************************************************
//credit FIFO
*********************************************************/

wire [2:0] credit_gather;
wire credit_empty;
wire async_credit_empty;
wire sync_credit_empty;

wire [2:0] credit_fifo_out;
wire [2:0] async_credit_fifo_out;
wire [2:0] sync_credit_fifo_out;

reg  [2:0] credit_to_fpga_r /* synthesis iob = true */;

//FIFO used for bridging credits between clock domains













 // ifndef PITON_PROTO
async_fifo #(
.DSIZE(3),
.ASIZE(5),
.MEMSIZE(16) )
async_credit_fifo(
    .rreset(rst),
    .wreset(rst),
    .wclk(rd_clk),
    .rclk(wr_clk),
    .ren(~rst & async_mux),
    .wval(~(rst) & (| credit_gather) & async_mux),
    .wdata(credit_gather),
    .rdata(async_credit_fifo_out),
    .wfull(async_credit_fifo_full),   
    .rempty(async_credit_empty)
);
 //endif PITON_PROTO
















 // ifndef PITON_PROTO
sync_fifo #(
.DSIZE(3),
.ASIZE(5),
.MEMSIZE(16) )
sync_credit_fifo(
    .reset(rst),
    .clk(wr_clk),
    .ren(~rst & ~async_mux),
    .wval(~(rst) & (| credit_gather) & ~async_mux),
    .wdata(credit_gather),
    .rdata(sync_credit_fifo_out),
    .full(sync_credit_fifo_full),   
    .empty(sync_credit_empty)
);
 // endif PITON_PROTO

assign credit_fifo_out = async_mux ? async_credit_fifo_out : sync_credit_fifo_out;
assign credit_fifo_full = async_mux ? async_credit_fifo_full : sync_credit_fifo_full;
assign credit_empty = async_mux ? async_credit_empty: sync_credit_empty;

assign credit_to_fpga = credit_to_fpga_r;

assign credit_gather[0] = bout_rdy_1 & bout_val_1;
assign credit_gather[1] = bout_rdy_2 & bout_val_2;
assign credit_gather[2] = bout_rdy_3 & bout_val_3;

/****************************************************
 channel side sequential logic 
 ****************************************************/
always@(posedge wr_clk) begin


 // ifndef PITON_PROTO
   if(rst) begin
 // endif PITON_PROTO
        credit_to_fpga_r <= 3'b000;       
   end
   else begin
       if(~credit_empty) begin 
           credit_to_fpga_r <= credit_fifo_out;
       end
       else
           credit_to_fpga_r <= 3'b000;       
   end 
end

endmodule

/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/********************************************************************
 * Author: Sam Payne
 * 
 * Module encapsulates the off chip interface for networks 1, 2 and 3
 * channel is 32 bits wide, splitting flits into two parts before send
 * relies on arbitration logic in chip_net_chooser.v
 *
 *******************************************************************/

// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Header file for FPGA and system level macros

// Generally, if doing FPGA synth, certain things
// are not needed or are fixed, always.  These
// can be used for other purposes though



 // endif PITON_FPGA_SYNTH

// If we are doing FPGA prototype,
// at least for now, all prototypes
// include chip+chipset in same FPGA,
// include a real io_ctrl module,
// include a UART (not necessarily for boot),
// and include an SPI (not always used for boot,
// but for top-level constraints I/Os are needed)
// so the following macros always apply







































 // PITON_NOC_POWER_CHIPSET_TEST

// If we are synthesizing chipset
// for use with piton ASIC, we need
// these macros







 // endif PITON_ASIC_CHIPSET






  // PITON_BOARD_CHIPSET

// If we are synthesizing the chip
// only for FPGA, we need to use these
// macros






    
 // endif PITON_CLKS_PASSTHRU
 // endif PITON_CLKS_CHIPSET














// Nexys4ddr and NexysVideo has single ended clock input

// Reset is active high on VC707 and VCU118















// If PITON_FPGA_SD_BOOT is set we should always include SPI


 // endif PITON_FPGA_SD_BOOT

// If PITONSYS_UART_BOOT is set, we should always include a UART


 // endif PITONSYS_UART_BOOT







`timescale 1ns/1ps

module chip_bridge_out (
    rst, 
    wr_clk,
    rd_clk,
    async_mux,
    bin_data_1,
    bin_val_1,
    bin_rdy_1,
    bin_data_2,
    bin_val_2,
    bin_rdy_2,
    bin_data_3,
    bin_val_3,
    bin_rdy_3,
    data_to_fpga,
    data_channel,
    credit_from_fpga
);  

input rst;
input wr_clk;
input rd_clk;
input async_mux;

output          bin_rdy_1;
output          bin_rdy_2;
output          bin_rdy_3;
output [31:0]   data_to_fpga;
output [ 1:0]    data_channel;

input [63:0]    bin_data_1;
input           bin_val_1;
input [63:0]    bin_data_2;
input           bin_val_2;
input [63:0]    bin_data_3;
input           bin_val_3;
input [2:0]     credit_from_fpga;

wire network_rdy_1;
wire network_rdy_2;
wire network_rdy_3;

wire fifo1_full;
wire fifo2_full;
wire fifo3_full;

wire [63:0] network_data_1;
wire [63:0] network_data_2;
wire [63:0] network_data_3;

wire network_val_1;
wire network_val_2;
wire network_val_3;

wire async_fifo1_full;
wire async_fifo2_full;
wire async_fifo3_full;

wire [63:0] async_network_data_1;
wire [63:0] async_network_data_2;
wire [63:0] async_network_data_3;

wire async_network_val_1;
wire async_network_val_2;
wire async_network_val_3;

wire sync_fifo1_full;
wire sync_fifo2_full;
wire sync_fifo3_full;

wire [63:0] sync_network_data_1;
wire [63:0] sync_network_data_2;
wire [63:0] sync_network_data_3;

wire sync_network_val_1;
wire sync_network_val_2;
wire sync_network_val_3;


wire [63:0] data_to_serial_buffer;
reg  [31:0] serial_buffer_data;
reg  [31:0] serial_buffer_data_f /* synthesis iob = true */;
reg   [0:0] serial_buffer_data_counter;
wire  [1:0] channel_to_serial_buffer;
reg   [1:0] serial_buffer_channel /* synthesis iob = true */;
reg   [1:0] serial_buffer_channel_dup /* synthesis dont_touch = true */;



















assign bin_rdy_1 = ~fifo1_full; 
assign bin_rdy_2 = ~fifo2_full; 
assign bin_rdy_3 = ~fifo3_full; 

assign data_to_fpga = serial_buffer_data_f;
assign data_channel = serial_buffer_channel;

bridge_network_chooser separator(


 // ifndef PITON_PROTO
    .rst    (rst),

    .clk    (rd_clk),
    .data_out(data_to_serial_buffer),
    .data_channel(channel_to_serial_buffer),
    .din_1  (network_data_1),
    .rdy_1  (network_rdy_1),
    .val_1  (~network_val_1),
    .din_2  (network_data_2),
    .rdy_2  (network_rdy_2),
    .val_2  (~network_val_2),
    .din_3  (network_data_3),
    .rdy_3  (network_rdy_3),
    .val_3  (~network_val_3),
    .credit_from_fpga(credit_from_fpga)
);
//TODO: determine if full/empty are active high or low
//input-output fixed to 64 bits












 // ifndef PITON_PROTO
async_fifo #(
.DSIZE(64),
.ASIZE(4),
.MEMSIZE(8) )
async_fifo_1(
    .rreset(rst),
    .wreset(rst),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(network_rdy_1 && async_mux),
    .wval(bin_val_1 && async_mux),
    .wdata(bin_data_1),
    .rdata(async_network_data_1),
    .wfull(async_fifo1_full),
    .rempty(async_network_val_1)
);
 // endif PITON_PROTO













 // ifndef PITON_PROTO
async_fifo #(
.DSIZE(64),
.ASIZE(4),
.MEMSIZE(8) )
async_fifo_2(
    .rreset(rst),
    .wreset(rst),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(network_rdy_2 && async_mux),
    .wval(bin_val_2 && async_mux),
    .wdata(bin_data_2),
    .rdata(async_network_data_2),
    .wfull(async_fifo2_full),
    .rempty(async_network_val_2)
);
 // endif PITON_PROTO













 // ifndef PITON_PROTO
async_fifo #(
.DSIZE(64),
.ASIZE(4),
.MEMSIZE(8) )
async_fifo_3(
    .rreset(rst),
    .wreset(rst),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(network_rdy_3 && async_mux),
    .wval(bin_val_3 && async_mux),
    .wdata(bin_data_3),
    .rdata(async_network_data_3),
    .wfull(async_fifo3_full),
    .rempty(async_network_val_3)
);
 // endif PITON_PROTO
















 // ifndef PITON_PROTO
sync_fifo #(
.DSIZE(64),
.ASIZE(4),
.MEMSIZE(8) )
sync_fifo_1(
    .reset(rst),
    .clk(rd_clk),
    .ren(network_rdy_1 && ~async_mux),
    .wval(bin_val_1 && ~async_mux),
    .wdata(bin_data_1),
    .rdata(sync_network_data_1),
    .full(sync_fifo1_full),
    .empty(sync_network_val_1)
);
 // endif PITON_PROTO
















 // ifndef PITON_PROTO
sync_fifo #(
.DSIZE(64),
.ASIZE(4),
.MEMSIZE(8) )
sync_fifo_2(
    .reset(rst),
    .clk(rd_clk),
    .ren(network_rdy_2 && ~async_mux),
    .wval(bin_val_2 && ~async_mux),
    .wdata(bin_data_2),
    .rdata(sync_network_data_2),
    .full(sync_fifo2_full),
    .empty(sync_network_val_2)
);
 // endif PITON_PROTO
















 // ifndef PITON_PROTO
sync_fifo #(
.DSIZE(64),
.ASIZE(4),
.MEMSIZE(8) )
sync_fifo_3(
    .reset(rst),
    .clk(rd_clk),
    .ren(network_rdy_3 && ~async_mux),
    .wval(bin_val_3 && ~async_mux),
    .wdata(bin_data_3),
    .rdata(sync_network_data_3),
    .full(sync_fifo3_full),
    .empty(sync_network_val_3)
);
 // endif PITON_PROTO

assign network_val_1  = async_mux ? async_network_val_1 : sync_network_val_1;
assign network_val_2  = async_mux ? async_network_val_2 : sync_network_val_2;
assign network_val_3  = async_mux ? async_network_val_3 : sync_network_val_3;

assign network_data_1  = async_mux ? async_network_data_1 : sync_network_data_1;
assign network_data_2  = async_mux ? async_network_data_2 : sync_network_data_2;
assign network_data_3  = async_mux ? async_network_data_3 : sync_network_data_3;

assign fifo1_full = async_mux ? async_fifo1_full : sync_fifo1_full;
assign fifo2_full = async_mux ? async_fifo2_full : sync_fifo2_full;
assign fifo3_full = async_mux ? async_fifo3_full : sync_fifo3_full;

always @(posedge rd_clk) begin


 // ifndef PITON_PROTO
    if(rst) begin
 // endif PITON_PROTO
        serial_buffer_data <= 32'd0;
        serial_buffer_data_f <= 32'd0;
        serial_buffer_channel <= 2'd0;
        serial_buffer_channel_dup <= 2'd0;
        serial_buffer_data_counter <= 1'b1;
    end
    else begin
        if( channel_to_serial_buffer != 0 && serial_buffer_data_counter == 1) begin
            
            serial_buffer_data_f <= data_to_serial_buffer[31:0];
            serial_buffer_data <= data_to_serial_buffer[63:32];
            serial_buffer_channel <= channel_to_serial_buffer;
            serial_buffer_channel_dup <= channel_to_serial_buffer;

            serial_buffer_data_counter <= serial_buffer_data_counter + 1'b1;
        end
        else if( serial_buffer_channel_dup != 0 && serial_buffer_data_counter != 1'b1) begin
            serial_buffer_data_f <= serial_buffer_data;

            serial_buffer_data_counter <= serial_buffer_data_counter + 1'b1;
        end
        else begin
            serial_buffer_data_counter <= 1'b1;
            serial_buffer_channel <= channel_to_serial_buffer;
            serial_buffer_channel_dup <= channel_to_serial_buffer;
        end
    end
end 

endmodule
/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/********************************************************************
 * Author: Sam Payne
 * 
 * Module encapsulates logic used to choose between 3 on chip networks
 * based upon round robin ordering factoring in which networks are 
 * empty and which have been given priority previously
 * *******************************************************************/


`timescale 1ns/1ps

module bridge_network_chooser(
    rst,
    clk,
    data_out,
    data_channel,
    din_1,
    rdy_1,
    val_1,
    din_2,
    rdy_2,
    val_2,
    din_3,
    rdy_3,
    val_3,
    credit_from_fpga
);


input rst;
input clk;

input [63:0] din_1;
input [63:0] din_2;
input [63:0] din_3;
input        val_1;
input        val_2;
input        val_3;
input [ 2:0] credit_from_fpga;

output [63:0] data_out;
output [ 1:0] data_channel;
output        rdy_1;
output        rdy_2;
output        rdy_3;

reg [8:0] credit_1; //holds the number of in flight instructions
reg [8:0] credit_2;
reg [8:0] credit_3;

wire [1:0] select;
reg  [1:0] select_reg;
reg  [0:0] select_counter;

reg sel_23;
reg sel_13;
reg sel_12;
reg [1:0] sel_123;


/*********************************************************
//Combinational Logic
*********************************************************/
assign data_out =   rdy_1 ? din_1 :
                    rdy_2 ? din_2 :
                    rdy_3 ? din_3 : 64'd0;

assign data_channel = select; 

assign rdy_1 = (select == 2'b01 && select_counter == 1'b0) ? 1'b1 : 1'b0;
assign rdy_2 = (select == 2'b10 && select_counter == 1'b0) ? 1'b1 : 1'b0;
assign rdy_3 = (select == 2'b11 && select_counter == 1'b0) ? 1'b1 : 1'b0;

assign select = ( (select_counter != 1'b0         ) )   ? select_reg :
                ( (credit_1 == 9'd255 || ~val_1) &&            //3 networks full
                  (credit_2 == 9'd255 || ~val_2) && 
                  (credit_3 == 9'd255 || ~val_3) )   ? 2'b00  :
                ( (credit_2 == 9'd255 || ~val_2) &&            //2 networks full
                  (credit_3 == 9'd255 || ~val_3) )   ? 2'b01  :
                ( (credit_1 == 9'd255 || ~val_1) &&
                  (credit_3 == 9'd255 || ~val_3) )   ? 2'b10  :
                ( (credit_1 == 9'd255 || ~val_1) &&
                  (credit_2 == 9'd255 || ~val_2) )   ? 2'b11  :
                ( (credit_1 == 9'd255 || ~val_1) )   ? (sel_23 ? 2'b11 : 2'b10) : //1 network full
                ( (credit_2 == 9'd255 || ~val_2) )   ? (sel_13 ? 2'b11 : 2'b01) :
                ( (credit_3 == 9'd255 || ~val_3) )   ? (sel_12 ? 2'b10 : 2'b01) :
                                                sel_123; //0 networks full


/*********************************************************
//Sequential Logic
*********************************************************/

always @(posedge clk) begin
    if(rst) begin
        select_reg <= 2'd0;
    end
    else begin
        select_reg <= select;
    end
end

always @(posedge clk) begin
    if(rst) begin
        credit_1 <= 9'd0;
        credit_2 <= 9'd0;
        credit_3 <= 9'd0;
        sel_23 <= 0;
        sel_13 <= 0;
        sel_12 <= 0;
        sel_123 <= 0;

        select_counter <= 0;
    end
    else begin
        //update select hold
        if(select == 0) begin
            select_counter <= 0;
        end
        else begin
            select_counter <= select_counter + 2'b01; 
        end

        //update incoming credits
        if(credit_from_fpga[0] & ~(rdy_1 & val_1)) begin
            credit_1 <= credit_1 - 9'd1;
        end
        if(credit_from_fpga[1] & ~(rdy_2 & val_2)) begin
            credit_2 <= credit_2 - 9'd1;
        end
        if(credit_from_fpga[2] & ~(rdy_3 & val_3)) begin
            credit_3 <= credit_3 - 9'd1;
        end
        
        if((credit_1 < 9'd255) &&
           (credit_2 < 9'd255) &&
           (credit_3 < 9'd255) &&
           (sel_123 == 0)         )
            sel_123 <= 2'b01;

        //update outgoing credits
        if(rdy_1 & val_1) begin
            sel_13 <= 1;
            sel_12 <= 1;
            if (sel_123 == 2'b01) begin
                sel_123 <= 2'b10;
            end
            if(~credit_from_fpga[0]) begin
                credit_1 <= credit_1 + 9'd1;
            end
        end 
        if(rdy_2 & val_2) begin
            sel_23 <= 1;
            sel_12 <= 0;
            if (sel_123 == 2'b10) begin
                sel_123 <= 2'b11;
            end
            if( ~credit_from_fpga[1]) begin
                credit_2 <= credit_2 + 9'd1;
            end
        end
        if(rdy_3 & val_3) begin
            sel_23 <= 0;
            sel_13 <= 0;
            if (sel_123 == 2'b11) begin
                sel_123 <= 2'b01;
            end
            if (~credit_from_fpga[2]) begin
                credit_3 <= credit_3 + 9'd1;
            end
        end


    end
end //end always

endmodule
/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//top level module for chip_send tests 

//`timescale 1ns/1ps
module chip_bridge(
    rst_n,
    chip_clk,
    intcnct_clk,
    async_mux,
    network_out_1,
    network_out_2,
    network_out_3,
    data_out_val_1,
    data_out_val_2,
    data_out_val_3,
    data_out_rdy_1,
    data_out_rdy_2,
    data_out_rdy_3,
    intcnct_data_in,
    intcnct_channel_in,
    intcnct_credit_back_in,
    network_in_1,
    network_in_2,
    network_in_3,
    data_in_val_1,
    data_in_val_2,
    data_in_val_3,
    data_in_rdy_1,
    data_in_rdy_2,
    data_in_rdy_3,
    intcnct_data_out,
    intcnct_channel_out,
    intcnct_credit_back_out
//    dbg_interconnect_data,
//    dbg_interconnect_channel
);

input           rst_n;
input           chip_clk;
input           intcnct_clk;
input           async_mux;

input  [63:0]   network_out_1;
input  [63:0]   network_out_2;
input  [63:0]   network_out_3;
input           data_out_val_1;
input           data_out_val_2;
input           data_out_val_3;
output          data_out_rdy_1;
output          data_out_rdy_2;
output          data_out_rdy_3;

output [31:0]   intcnct_data_out;
output [1:0]    intcnct_channel_out;
input  [2:0]    intcnct_credit_back_out;

output [63:0]   network_in_1;
output [63:0]   network_in_2;
output [63:0]   network_in_3;
output          data_in_val_1;
output          data_in_val_2;
output          data_in_val_3;
input           data_in_rdy_1;
input           data_in_rdy_2;
input           data_in_rdy_3;

input  [31:0]   intcnct_data_in;
input  [1:0]    intcnct_channel_in;
output [2:0]    intcnct_credit_back_in;

//output [31:0]   dbg_interconnect_data;
//output [1:0]    dbg_interconnect_channel;

//assign dbg_interconnect_data = intcnct_data;
//assign dbg_interconnect_channel = intcnct_channel;

chip_bridge_out chip_fpga_out(
    .rst(~rst_n), 
    .wr_clk(chip_clk),
    .rd_clk(intcnct_clk),
    .async_mux(async_mux),
    .bin_data_1(network_out_1),
    .bin_val_1(data_out_val_1),
    .bin_rdy_1(data_out_rdy_1),
    .bin_data_2(network_out_2),
    .bin_val_2(data_out_val_2),
    .bin_rdy_2(data_out_rdy_2),
    .bin_data_3(network_out_3),
    .bin_val_3(data_out_val_3),
    .bin_rdy_3(data_out_rdy_3),
    .data_to_fpga(intcnct_data_out),
    .data_channel(intcnct_channel_out),
    .credit_from_fpga(intcnct_credit_back_out)
    );  

chip_bridge_in chip_fpga_in(
    .rst(~rst_n), 
    .wr_clk(intcnct_clk),
    .rd_clk(chip_clk),
    .async_mux(async_mux),
    .bout_data_1(network_in_1),
    .bout_val_1(data_in_val_1),
    .bout_rdy_1(data_in_rdy_1),
    .bout_data_2(network_in_2),
    .bout_val_2(data_in_val_2),
    .bout_rdy_2(data_in_rdy_2),
    .bout_data_3(network_in_3),
    .bout_val_3(data_in_val_3),
    .bout_rdy_3(data_in_rdy_3),
    .data_from_fpga(intcnct_data_in),
    .data_channel(intcnct_channel_in),
    .credit_to_fpga(intcnct_credit_back_in)
    );

endmodule
