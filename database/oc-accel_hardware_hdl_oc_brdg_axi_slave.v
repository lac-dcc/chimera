// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`timescale 1ns/1ps

`include "snap_global_vars.v"


//  Description: Buffers AXI write and read burst data and connects AXI slave
//               interface and local bus.
//      +---------+                 +---------------+
//      |         |                 |               |
//      |         | write req+data  |               |<--AW*
//      |         |<----------------|               |
//      |         |   write resp    |               |<--AR*
//      |         |---------------->|               |
// TLX  |  data   |                 |   axi_slave   |<--W*
//      | channel |                 | (this module) |
// side | bridge  |    read req     |               |-->B*
//      |         |<----------------|               |
//      |         | read resp+data  |               |-->R*
//      |         |---------------->|               |
//      |         |                 |               |
//      |         |                 |               |
//      +---------+                 +---------------+
//
//                  local bus (lcl)                    AXI



module brdg_axi_slave 
                (
                input                clk,
                input                rst_n,
                
                //---- local bus --------------------
                // "early" means it should be 1 cycle earlier than lcl_wr_valid or lcl_rd_valid
                
                  // write address & data channel
                output                lcl_wr_valid,      //A valid write beat to bridge
                output reg [63:0]     lcl_wr_ea,         //Effective address
                output reg [`IDW-1:0]  lcl_wr_axi_id,     //AXI ID of current beat
                output     [127:0]    lcl_wr_be,         //Byte enable of current beat
                output                lcl_wr_first,      //This is the first beat in a burst
                output                lcl_wr_last,       //This is the last beat in a burst
                output     [1023:0]   lcl_wr_data,       //Write data
                output                lcl_wr_idle,       //Current write channel is idle,
                input                 lcl_wr_ready,      //From bridge
                  // write ctx channel
                output reg            lcl_wr_ctx_valid,  //Indicate current write context is valid (one cycle) 
                output reg [`CTXW-1:0] lcl_wr_ctx,        //AWUSER in AXI world and PASID in TLX world
                  // write response channel
                input                 lcl_wr_rsp_valid,  //A response valid from bridge
                input      [`IDW-1:0]  lcl_wr_rsp_axi_id, //AXI ID of current beat in response
                input                 lcl_wr_rsp_code,   //Response code. 0: good;  1: error
                output                lcl_wr_rsp_ready,  //axi_slave is ready to accept the response.
                input     [`CTXW-1:0] lcl_wr_rsp_ctx          ,  
                
                
                   // read address channel
                output                lcl_rd_valid,      //A valid read beat command
                output reg [63:0]     lcl_rd_ea,         //Effective address
                output reg [`IDW-1:0]  lcl_rd_axi_id,     //AXI ID of current beat
                output     [127:0]    lcl_rd_be,         //Byte enable of current beat
                output                lcl_rd_first,      //This is the first beat in a burst
                output                lcl_rd_last,       //This is the last beat in a burst
                output                lcl_rd_idle,       //Current read channel is idle,
                input                 lcl_rd_ready,      //From bridge
                  // read ctx channel
                output reg            lcl_rd_ctx_valid,  //Indicate current read context is valid (one cycle)
                output reg [`CTXW-1:0] lcl_rd_ctx,        //ARUSER in AXI world and PASID in TLX world
                  // read response & data channel
                input                 lcl_rd_data_valid, //Data valid from bridge
                input      [`IDW-1:0]  lcl_rd_data_axi_id,//AXI ID of current beat in response
                input [1023:0]        lcl_rd_data,       //Read data for the current beat
                input     [`CTXW-1:0] lcl_rd_data_ctx       ,  
                input                 lcl_rd_data_last,  //This the last beat in a burst
                input                 lcl_rd_rsp_code,   //Response code. 0: good;  1: error
                output                lcl_rd_data_ready, //To bridge: axi_slave is ready to accept the response.
                
                
                //---- AXI bus ----------------------
                  // AXI write address channel
                input      [`IDW-1:0]  s_axi_awid,
                input      [63:0]     s_axi_awaddr,
                input      [7:0]      s_axi_awlen,
                input      [2:0]      s_axi_awsize,
                input      [1:0]      s_axi_awburst,
                input      [`CTXW-1:0] s_axi_awuser,
                input                 s_axi_awvalid,
                output reg            s_axi_awready,
                  // AXI write data channel
                  // We suppose wuser = awuser. No wuser input.
                input      [1023:0]   s_axi_wdata,
                input      [127:0]    s_axi_wstrb,
                input                 s_axi_wlast,
                input                 s_axi_wvalid,
                output                s_axi_wready,
                  // AXI write response channel
                output reg [`IDW-1:0]  s_axi_bid,
                output reg [1:0]      s_axi_bresp,
                output reg [`CTXW-1:0] s_axi_buser,
                output reg            s_axi_bvalid,
                input                 s_axi_bready,
                  // AXI read address channel
                input      [`IDW-1:0]  s_axi_arid,
                input      [63:0]     s_axi_araddr,
                input      [7:0]      s_axi_arlen,
                input      [2:0]      s_axi_arsize,
                input      [1:0]      s_axi_arburst,
                input      [`CTXW-1:0] s_axi_aruser,
                input                 s_axi_arvalid,
                output reg            s_axi_arready,
                  // AXI read data channel
                output reg [`IDW-1:0]  s_axi_rid,
                output reg [1023:0]   s_axi_rdata,
                output reg [1:0]      s_axi_rresp,
                output reg [`CTXW-1:0]s_axi_ruser,
                output reg            s_axi_rlast,
                output reg            s_axi_rvalid,
                input                 s_axi_rready
                );

                  
parameter AXI_FIXED=2'b00,
          AXI_INCR=2'b01,
          AXI_WRAP=2'b10;

parameter AXI_OKAY=2'b00,
          AXI_EXOKAY=2'b01,
          AXI_SLVERR=2'b10,
          AXI_DECERR=2'b11;

//=============================================================================================
// Address phase
// Input: addr, len, size, burst
// Output: ea, be1_q
//
// be1_q is generated in address phase, decided by ea[6:0] and size;
// for both read and write.
//
// For write, we will still 'AND' wstrb with be1_q together in data phase
//=============================================================================================
//
//1st ea = axi_addr;
//Following ea = ea_aligned_q, step = ea_incr_q; (INCR)
//               or ea_aligned_q, (FIXED)
//               or ea_aligned_q, step = ea_incr_q; if hit upper_wrap_boundary, go
//               to lower_wrap_boundary (WRAP) (TODO: not implement in first draft)
//
// be1_q = (byte_mask << ea[6:0]);

// For read:  be = be1_q
// For write: be = be1_q & wstrb

//=============================================================================================
// All AXI commands AR* and AW* will enter axi_slave_cmd_fifo first.
//=====================================AR======================================================
 parameter RD_IDLE           = 4'b0001,
           RD_REQ_FIRST      = 4'b0010,
           RD_HOLD_FIRST     = 4'b0100,
           RD_REQ_REMAINING  = 4'b1000;

 wire ar_cf_empty;
 wire ar_cf_almost_full;
 wire ar_cf_full;
 wire  ar_cf_rd_en;

 wire [`IDW-1:0]  ar_cf_id;
 wire [63:0]     ar_cf_addr;
 wire [7:0]      ar_cf_len;
 wire [2:0]      ar_cf_size;
 wire [1:0]      ar_cf_burst;
 wire [`CTXW-1:0] ar_cf_user;

 reg [3:0]   rd_cstate, rd_nstate;
 reg [7:0]   rd_beat_counter;
 reg [7:0]   rd_ea_incr_q;
 wire [63:0] rd_ea_next;
 reg [63:0]  rd_ea_aligned_q;
 reg [6:0]   rd_ea_low_mask;
 reg [127:0] rd_byte_mask; 
 reg [127:0] rd_byte_mask_q; 
 reg [1:0]   rd_burst_q;
 reg [127:0] rd_be1_q;
 wire        rd_addr_present;
 wire             burst_wr_ctx_valid;  //Indicate current write context is valid (one cycle) (early)
 wire [`CTXW-1:0] burst_wr_ctx;        //AWUSER in AXI world and PASID in TLX world
 wire             burst_rd_ctx_valid;  //Indicate current write context is valid (one cycle) (early)
 wire [`CTXW-1:0] burst_rd_ctx;        //AWUSER in AXI world and PASID in TLX world

brdg_axi_slave_cmd_fifo  ar_cf(
        .clk            (clk             ),
        .rst_n          (rst_n           ),

        .axi_id         (s_axi_arid      ),
        .axi_addr       (s_axi_araddr    ),
        .axi_len        (s_axi_arlen     ),
        .axi_size       (s_axi_arsize    ),
        .axi_burst      (s_axi_arburst   ),
        .axi_user       (s_axi_aruser    ),

        .cf_id          (ar_cf_id        ),
        .cf_addr        (ar_cf_addr      ),
        .cf_len         (ar_cf_len       ),
        .cf_size        (ar_cf_size      ),
        .cf_burst       (ar_cf_burst     ),
        .cf_user        (ar_cf_user      ),

        .cf_wr_en       (rd_addr_present ),

        .cf_full        (ar_cf_full      ),
        .cf_almost_full (ar_cf_almost_full),
        .cf_empty       (ar_cf_empty     ),
        .cf_rd_en       (ar_cf_rd_en     )
);

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_arready <= 1'b1;
   else if (ar_cf_almost_full || ar_cf_full)
     s_axi_arready <= 1'b0;
   else
     s_axi_arready <= 1'b1;

//=====================================AW======================================================

parameter  WR_IDLE           = 6'b000001,
           WR_WAIT_ADDR      = 6'b000010,
           WR_REQ_FIRST      = 6'b000100,
           WR_HOLD_FIRST     = 6'b001000,
           WR_REQ_REMAINING  = 6'b010000,
           WR_WAIT_DATA      = 6'b100000;

 wire aw_cf_empty;
 wire aw_cf_almost_full;
 wire aw_cf_full;
 wire aw_cf_rd_en;

 wire [`IDW-1:0]  aw_cf_id;
 wire [63:0]     aw_cf_addr;
 wire [7:0]      aw_cf_len;
 wire [2:0]      aw_cf_size;
 wire [1:0]      aw_cf_burst;
 wire [`CTXW-1:0] aw_cf_user;

 reg [5:0]    wr_cstate, wr_nstate;
 reg [7:0]    wr_beat_counter;
 reg [7:0]    wr_ea_incr_q;
 wire [63:0]  wr_ea_next;
 reg [63:0]   wr_ea_aligned_q;
 reg [6:0]    wr_ea_low_mask;
 reg [127:0]  wr_byte_mask; 
 reg [127:0]  wr_byte_mask_q; 
 reg [127:0]  wr_be1_q;
 reg [1:0]    wr_burst_q;
 wire         wr_addr_present;
 wire         wr_data_present;
 reg [1023:0] wdata_q;
 reg [127:0]  wstrb_q;


brdg_axi_slave_cmd_fifo aw_cf (
        .clk            (clk             ),
        .rst_n          (rst_n           ),

        .axi_id         (s_axi_awid      ),
        .axi_addr       (s_axi_awaddr    ),
        .axi_len        (s_axi_awlen     ),
        .axi_size       (s_axi_awsize    ),
        .axi_burst      (s_axi_awburst   ),
        .axi_user       (s_axi_awuser    ),

        .cf_id          (aw_cf_id        ),
        .cf_addr        (aw_cf_addr      ),
        .cf_len         (aw_cf_len       ),
        .cf_size        (aw_cf_size      ),
        .cf_burst       (aw_cf_burst     ),
        .cf_user        (aw_cf_user      ),

        .cf_wr_en       (wr_addr_present ),

        .cf_full        (aw_cf_full       ),
        .cf_almost_full (aw_cf_almost_full),
        .cf_empty       (aw_cf_empty     ),
        .cf_rd_en       (aw_cf_rd_en     )
);

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_awready <= 1'b1;
   else if (aw_cf_almost_full || aw_cf_full)
     s_axi_awready <= 1'b0;
   else
     s_axi_awready <= 1'b1;



//=============================================================================================
// WRITE COMMAND+DATA CHANNEL
//=============================================================================================
// Need to wait for write data, use wvalid/wready as the trigger
// Sending commands when W data comes (wr_data_present)
//
// State Machine to send lcl_wr*

 assign wr_addr_present = s_axi_awvalid && s_axi_awready;
 assign wr_data_present = s_axi_wvalid && s_axi_wready;

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     wr_cstate <= WR_IDLE;
   else
     wr_cstate <= wr_nstate;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) begin
     wdata_q <= 1024'h0;
     wstrb_q <= 128'hffffffff_ffffffff_ffffffff_ffffffff;
   end
   else if (wr_data_present) begin
     wdata_q <= s_axi_wdata;
     wstrb_q <= s_axi_wstrb;
   end


 always@*
   if(wr_cstate == WR_IDLE) begin
       if (wr_data_present) begin //I already have one valid data beat to send
         if (aw_cf_empty)
           wr_nstate = WR_WAIT_ADDR;
         else
           wr_nstate = WR_REQ_FIRST;
       end
       else
         wr_nstate = WR_IDLE;
   end
   //-------------------------------------
   else if (wr_cstate == WR_WAIT_ADDR) begin
       if (aw_cf_empty)
         wr_nstate = WR_WAIT_ADDR;
       else
         wr_nstate = WR_REQ_FIRST;
   end
   //-------------------------------------
   else if (wr_cstate == WR_REQ_FIRST || wr_cstate == WR_HOLD_FIRST || wr_cstate == WR_REQ_REMAINING) begin
       if (lcl_wr_ready) begin
         if (wr_beat_counter == 8'd0) begin //This is the last beat
           if (wr_data_present) //Deal with new burst
             if (aw_cf_empty)
               wr_nstate = WR_WAIT_ADDR;
             else
               wr_nstate = WR_REQ_FIRST;
           else
             wr_nstate = WR_IDLE;
         end
         else //Deal with next beat in this burst
           if (wr_data_present)
             wr_nstate = WR_REQ_REMAINING;
           else
             wr_nstate = WR_WAIT_DATA;
       end
       else begin
         if(wr_cstate == WR_REQ_REMAINING)
           wr_nstate = WR_REQ_REMAINING;
         else
           wr_nstate = WR_HOLD_FIRST;
       end
   end
   //-------------------------------------
   else if (wr_cstate == WR_WAIT_DATA) begin
       if (wr_data_present)
         wr_nstate = WR_REQ_REMAINING;
       else
         wr_nstate = WR_WAIT_DATA;
   end
   //-------------------------------------
   else
       wr_nstate = WR_IDLE;

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     wr_beat_counter <= 8'hFF;
   else if (wr_nstate == WR_IDLE)
     wr_beat_counter <= 8'hFF;
   else begin
     if (wr_nstate == WR_REQ_FIRST) //Address information is ready
       wr_beat_counter <= aw_cf_len;
     else if (lcl_wr_valid && lcl_wr_ready && wr_beat_counter >= 1) //A real data has been send to bridge
       wr_beat_counter = wr_beat_counter - 8'd1;
   end

 always@*
   case (aw_cf_size)
     3'h0: wr_ea_low_mask = 7'b1111111;
     3'h1: wr_ea_low_mask = 7'b1111110;
     3'h2: wr_ea_low_mask = 7'b1111100;
     3'h3: wr_ea_low_mask = 7'b1111000;
     3'h4: wr_ea_low_mask = 7'b1110000;
     3'h5: wr_ea_low_mask = 7'b1100000;
     3'h6: wr_ea_low_mask = 7'b1000000;
     3'h7: wr_ea_low_mask = 7'b0000000;
     default: wr_ea_low_mask = 7'h0;
   endcase

 always@*
   case (aw_cf_size)
     3'h0: wr_byte_mask = 128'h00000000_00000000_00000000_00000001;
     3'h1: wr_byte_mask = 128'h00000000_00000000_00000000_00000003;
     3'h2: wr_byte_mask = 128'h00000000_00000000_00000000_0000000f;
     3'h3: wr_byte_mask = 128'h00000000_00000000_00000000_000000ff;
     3'h4: wr_byte_mask = 128'h00000000_00000000_00000000_0000ffff;
     3'h5: wr_byte_mask = 128'h00000000_00000000_00000000_ffffffff;
     3'h6: wr_byte_mask = 128'h00000000_00000000_ffffffff_ffffffff;
     3'h7: wr_byte_mask = 128'hffffffff_ffffffff_ffffffff_ffffffff;
     default: wr_byte_mask = 128'hffffffff_ffffffff_ffffffff_ffffffff;
   endcase

 assign wr_ea_next = wr_ea_aligned_q + wr_ea_incr_q;
 always@(posedge clk or negedge rst_n)
   if(~rst_n) begin
     lcl_wr_ea                 <= 64'h0;
     wr_ea_incr_q              <= 8'd128;
     wr_ea_aligned_q           <= 64'h0;
     wr_be1_q                  <= 128'hffffffff_ffffffff_ffffffff_ffffffff;
     wr_byte_mask_q            <= 128'hffffffff_ffffffff_ffffffff_ffffffff;
     wr_burst_q                <= AXI_INCR;
   end
   else begin
     if (wr_nstate == WR_REQ_FIRST) begin
       lcl_wr_ea               <= aw_cf_addr;
       wr_ea_incr_q            <= (8'h1 << aw_cf_size);
       wr_ea_aligned_q         <= {aw_cf_addr[63:7], aw_cf_addr[6:0]&wr_ea_low_mask};
       wr_be1_q                <= (wr_byte_mask << aw_cf_addr[6:0]);
       wr_byte_mask_q          <= wr_byte_mask;
       wr_burst_q              <= aw_cf_burst;
     end
     else if (wr_nstate == WR_REQ_REMAINING && lcl_wr_ready == 1) begin
       if(wr_burst_q == AXI_INCR) begin
         lcl_wr_ea             <= wr_ea_next;
         wr_ea_aligned_q       <= wr_ea_next;
         wr_be1_q              <= (wr_byte_mask_q << wr_ea_next[6:0]);
       end
       //AXI_FIXED: lcl_wr_ea doesn't change.
       //AXI_WRAP: Not supported.
     end
   end
  
 assign lcl_wr_valid = (wr_cstate == WR_REQ_FIRST || wr_cstate == WR_HOLD_FIRST || wr_cstate == WR_REQ_REMAINING);
 assign lcl_wr_data  = wdata_q;
 assign lcl_wr_be    = wstrb_q & wr_be1_q;
 
 assign lcl_wr_first = (wr_cstate == WR_REQ_FIRST || wr_cstate == WR_HOLD_FIRST) && lcl_wr_ready;
 //assign lcl_wr_first = (wr_nstate == WR_REQ_FIRST || wr_nstate == WR_HOLD_FIRST) && lcl_wr_ready;
 assign lcl_wr_idle  = (wr_nstate == WR_IDLE || wr_nstate == WR_WAIT_ADDR); //One cycle earlier before lcl_wr_valid.

 //assign lcl_wr_last  = (wr_beat_counter == 0) && lcl_wr_ready && lcl_rd_ready; //?? 
 assign lcl_wr_last  = (wr_beat_counter == 0) && lcl_wr_ready && lcl_wr_valid; 
 

 //The state machine can deal with current aw* command in next cycle.
 //So there is no need to enter the fifo

 //s_axi_wready: if bridge cannot handle it (lcl_wr_ready=0), pull down;
 //              if command info (aw*) hasn't arrived, pull down;
 assign s_axi_wready = lcl_wr_ready && ~(wr_cstate == WR_WAIT_ADDR);

 assign aw_cf_rd_en = ~aw_cf_empty && (wr_nstate == WR_REQ_FIRST);


 always@(posedge clk or negedge rst_n)
   if(~rst_n) begin
     lcl_wr_axi_id <= 0;
   end
   else if (wr_nstate == WR_IDLE) begin
     lcl_wr_axi_id <= 0;
   end
   else if (wr_nstate == WR_REQ_FIRST) begin
     lcl_wr_axi_id <= aw_cf_id;
   end

  assign burst_wr_ctx_valid = (wr_nstate == WR_REQ_FIRST); //One cycle earlier before lcl_wr_valid.
  assign burst_wr_ctx = (wr_nstate ==  WR_REQ_FIRST) ? aw_cf_user : 0;

 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
         lcl_wr_ctx_valid <= 1'b0;
     else
         lcl_wr_ctx_valid <= burst_wr_ctx_valid;
 end
 
 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
         lcl_wr_ctx       <= {`CTXW{1'b0}};
     else if(burst_wr_ctx_valid)
         lcl_wr_ctx       <= burst_wr_ctx;
 end

//=============================================================================================
// READ COMMAND CHANNEL
//=============================================================================================
// When ar_cf is not empty, we can send read requests.

// State Machine to send lcl_rd*
 
 assign rd_addr_present = s_axi_arvalid && s_axi_arready;
 
 //The state machine can deal with current ar* command in next cycle.
 //So there is no need to enter the fifo.

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     rd_cstate <= RD_IDLE;
   else
     rd_cstate <= rd_nstate;


 always@*
   if(rd_cstate == RD_IDLE) begin
       if (~ar_cf_empty)
         rd_nstate = RD_REQ_FIRST;
       else
         rd_nstate = RD_IDLE;
   end
   //-------------------------------------
   else if (rd_cstate == RD_REQ_FIRST || rd_cstate == RD_HOLD_FIRST || rd_cstate == RD_REQ_REMAINING) begin
       if(lcl_rd_ready) begin
         if(rd_beat_counter == 8'd0) begin //This is the last beat
           if (~ar_cf_empty) //There is new burst
             rd_nstate = RD_REQ_FIRST;
           else
             rd_nstate = RD_IDLE;
         end
         else
           rd_nstate = RD_REQ_REMAINING;
       end
       else begin
         if (rd_cstate == RD_REQ_REMAINING)
           rd_nstate = RD_REQ_REMAINING;
         else
           rd_nstate = RD_HOLD_FIRST;
       end
   end
   //-------------------------------------
   else
       rd_nstate = RD_IDLE;

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     rd_beat_counter <= 8'hFF;
   else if (rd_nstate == RD_IDLE)
     rd_beat_counter <= 8'hFF;
   else begin
     if (rd_nstate == RD_REQ_FIRST) //Initial value, address information is ready
       rd_beat_counter <= ar_cf_len;
     else if (lcl_rd_valid && lcl_rd_ready && rd_beat_counter >= 1)
       rd_beat_counter = rd_beat_counter - 8'd1;
   end

 always@*
   case (ar_cf_size)
     3'h0: rd_ea_low_mask = 7'b1111111;
     3'h1: rd_ea_low_mask = 7'b1111110;
     3'h2: rd_ea_low_mask = 7'b1111100;
     3'h3: rd_ea_low_mask = 7'b1111000;
     3'h4: rd_ea_low_mask = 7'b1110000;
     3'h5: rd_ea_low_mask = 7'b1100000;
     3'h6: rd_ea_low_mask = 7'b1000000;
     3'h7: rd_ea_low_mask = 7'b0000000;
     default: rd_ea_low_mask = 7'h0;
   endcase

 always@*
   case (ar_cf_size)
     3'h0: rd_byte_mask = 128'h00000000_00000000_00000000_00000001;
     3'h1: rd_byte_mask = 128'h00000000_00000000_00000000_00000003;
     3'h2: rd_byte_mask = 128'h00000000_00000000_00000000_0000000f;
     3'h3: rd_byte_mask = 128'h00000000_00000000_00000000_000000ff;
     3'h4: rd_byte_mask = 128'h00000000_00000000_00000000_0000ffff;
     3'h5: rd_byte_mask = 128'h00000000_00000000_00000000_ffffffff;
     3'h6: rd_byte_mask = 128'h00000000_00000000_ffffffff_ffffffff;
     3'h7: rd_byte_mask = 128'hffffffff_ffffffff_ffffffff_ffffffff;
     default: rd_byte_mask = 128'hffffffff_ffffffff_ffffffff_ffffffff;
   endcase

 assign rd_ea_next = rd_ea_aligned_q + rd_ea_incr_q;
 always@(posedge clk or negedge rst_n)
   if(~rst_n) begin
     lcl_rd_ea                  <= 64'h0;
     rd_ea_incr_q               <= 8'd128;
     rd_ea_aligned_q            <= 64'h0;
     rd_be1_q                   <= 128'hffffffff_ffffffff_ffffffff_ffffffff;
     rd_byte_mask_q             <= 128'hffffffff_ffffffff_ffffffff_ffffffff;
     rd_burst_q                 <= AXI_INCR;
   end
   else begin
     if (rd_nstate == RD_REQ_FIRST) begin //Initial value
       lcl_rd_ea                <= ar_cf_addr;
       rd_ea_incr_q             <= (8'h1 << ar_cf_size);
       rd_ea_aligned_q          <= {ar_cf_addr[63:7], ar_cf_addr[6:0]&rd_ea_low_mask};
       rd_be1_q                 <= (rd_byte_mask << ar_cf_addr[6:0]);
       rd_byte_mask_q           <= rd_byte_mask;
       rd_burst_q               <= ar_cf_burst;
     end
     else if (lcl_rd_valid && lcl_rd_ready) begin //Update
       if(rd_burst_q == AXI_INCR) begin
         lcl_rd_ea              <= rd_ea_next;
         rd_ea_aligned_q        <= rd_ea_next;
         rd_be1_q               <= (rd_byte_mask_q << rd_ea_next[6:0]);
       end
       //AXI_FIXED: lcl_rd_ea doesn't change.
       //AXI_WRAP: Not supported.
     end
   end
  
 assign lcl_rd_valid = (rd_cstate != RD_IDLE);
 assign lcl_rd_be    = rd_be1_q;
 assign lcl_rd_first = (rd_cstate == RD_REQ_FIRST || rd_cstate == RD_HOLD_FIRST) && lcl_rd_ready;
 assign lcl_rd_idle  = (rd_nstate == RD_IDLE); //One cycle earlier before lcl_rd_valid.

 assign lcl_rd_last  = (rd_beat_counter == 0) && lcl_rd_ready && lcl_rd_valid;

 assign ar_cf_rd_en = ~ar_cf_empty && (rd_nstate == RD_REQ_FIRST);


 always@(posedge clk or negedge rst_n)
   if(~rst_n) begin
     lcl_rd_axi_id <= 0;
   end
   else if (rd_nstate == RD_IDLE) begin
     lcl_rd_axi_id <= 0;
   end
   else if (rd_nstate == RD_REQ_FIRST) begin
     lcl_rd_axi_id <= ar_cf_id;
   end
  
  assign burst_rd_ctx_valid = (rd_nstate == RD_REQ_FIRST); //One cycle earlier before lcl_rd_valid.
  assign burst_rd_ctx = (rd_nstate ==  RD_REQ_FIRST) ? ar_cf_user : 0;

 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
         lcl_rd_ctx_valid <= 1'b0;
     else
         lcl_rd_ctx_valid <= burst_rd_ctx_valid;
 end

 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
         lcl_rd_ctx       <= {`CTXW{1'b0}};
     else if(burst_rd_ctx_valid)
         lcl_rd_ctx       <= burst_rd_ctx;
 end

//=============================================================================================
// WRITE RESPONSE CHANNEL
//=============================================================================================
//---- AXI write response ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_bvalid <= 1'b0;
   else if(lcl_wr_rsp_valid && lcl_wr_rsp_ready)
     s_axi_bvalid <= 1'b1;
   else if(s_axi_bready)
     s_axi_bvalid <= 1'b0;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) begin
     s_axi_bid   <= 0;
     s_axi_bresp <= AXI_OKAY;
     s_axi_buser <= 0;
   end
   else if(lcl_wr_rsp_valid && lcl_wr_rsp_ready) begin
     s_axi_bid   <= lcl_wr_rsp_axi_id;
     s_axi_bresp <= lcl_wr_rsp_code;
     s_axi_buser <= lcl_wr_rsp_ctx;
   end

 assign lcl_wr_rsp_ready = !s_axi_bvalid && s_axi_bready;


//=============================================================================================
// READ RESPONSE CHANNEL
//=============================================================================================
//---- AXI read response ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_rvalid <= 1'b0;
   else if(lcl_rd_data_valid && lcl_rd_data_ready)
     s_axi_rvalid <= 1'b1;
   else if(s_axi_rready)
     s_axi_rvalid <= 1'b0;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) begin
     s_axi_rid   <= 0;
     s_axi_ruser <= 0;
     s_axi_rresp <= AXI_OKAY;
     s_axi_rdata <= 1024'h0;
     s_axi_rlast <= 1'b0;
   end
   //RDATA must remain stable when RVALID is asserted and RREADY low
   else if(lcl_rd_data_valid && lcl_rd_data_ready) begin
     s_axi_rid   <= lcl_rd_data_axi_id;
     s_axi_ruser <= lcl_rd_data_ctx;
     s_axi_rresp <= lcl_rd_rsp_code;
     s_axi_rdata <= lcl_rd_data;
     s_axi_rlast <= lcl_rd_data_last;
   end

 assign lcl_rd_data_ready = !s_axi_rvalid || s_axi_rready;

endmodule
