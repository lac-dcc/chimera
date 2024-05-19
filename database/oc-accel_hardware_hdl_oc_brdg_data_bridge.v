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

module brdg_data_bridge 
                        #(
                          parameter MODE = 0 //0: write; 1: read
                          )
                        (
                         input                 clk                   ,
                         input                 rst_n                 ,

                         //---- buffer empty indicatior -------
                         output                buf_empty             ,

                         //---- local bus ---------------------
                             //--- address ---
                         input                 lcl_addr_idle         ,
                         output reg            lcl_addr_ready        ,
                         input                 lcl_addr_valid        ,
                         input      [0063:0]   lcl_addr_ea           ,
                         input                 lcl_addr_ctx_valid    ,
                         input      [`CTXW-1:0]lcl_addr_ctx          ,  
                         input      [`IDW-1:0] lcl_addr_axi_id       ,  
                         input                 lcl_addr_first        ,
                         input                 lcl_addr_last         ,
                         input      [0127:0]   lcl_addr_be           ,  

                             //--- data ---
                         input      [1023:0]   lcl_data_in           , 
                         output     [1023:0]   lcl_data_out          , 
                         output                lcl_data_out_last     ,
                         output     [`CTXW-1:0]lcl_data_ctx          ,  
                             //--- response and data out ---
                         `ifndef ENABLE_ODMA
                         input                 lcl_resp_ready        ,
                         `else
                         input      [0031:0]   lcl_resp_ready        ,
                         input      [0031:0]   lcl_resp_ready_hint   ,
                         `endif
                         output                lcl_resp_valid        ,
                         output     [`IDW-1:0] lcl_resp_axi_id       ,
                         output                lcl_resp_code         ,
                         output     [`CTXW-1:0]lcl_resp_ctx          ,  

                         //---- command encoder ---------------
                         input                 dma_cmd_ready         ,
                         output reg            dma_cmd_valid         ,
                         output reg [1023:0]   dma_cmd_data          , 
                         output reg [0127:0]   dma_cmd_be            , 
                         output reg [0063:0]   dma_cmd_ea            , 
                         output reg [`TAGW-1:0]dma_cmd_tag           , 
                         output reg [`CTXW-1:0]dma_cmd_ctx           ,

                         //---- response decoder --------------
                         input                 dma_resp_valid        ,
                         input      [1023:0]   dma_resp_data         , 
                         input      [`TAGW-1:0]dma_resp_tag          , 
                         input      [0001:0]   dma_resp_pos          , 
                         input      [0002:0]   dma_resp_code         ,  

                         //---- control and status ------------
                         input                 debug_cnt_clear       ,
                         input      [0031:0]   debug_axi_cmd_idle_lim,
                         input      [0031:0]   debug_axi_rsp_idle_lim,
                         output reg            debug_axi_cmd_idle    ,
                         output reg            debug_axi_rsp_idle    ,
                         output reg [0031:0]   debug_axi_cnt_cmd     , 
                         output reg [0031:0]   debug_axi_cnt_rsp     , 
                         output reg [0007:0]   debug_buf_cnt         , 
                         output reg [0001:0]   fir_fifo_overflow
                         );



 wire            local_cmd_valid;
 reg             retry_tag_out_valid_sync;
 reg             local_cmd_valid_sync;
 reg  [1023:0]   lcl_data_in_sync;
 reg  [0127:0]   lcl_addr_be_sync;
 reg  [0063:0]   lcl_addr_ea_sync;
 reg  [`CTXW-1:0]lcl_addr_ctx_sync;
 reg  [`CTXW-1:0]lcl_addr_ctx_real;
 reg  [`TAGW-1:0]retry_tag_out_sync;
 reg  [`TAGW-1:0]recycle_tag_out_sync;
 wire            recycle_tag_out_req;
 wire [`TAGW-1:0]recycle_tag_out;
 reg             retry_tag_in_valid;
 wire            retry_tag_out_req;
 wire[`TAGW-1:0] retry_tag_out;
 wire            retry_tag_out_valid;
 reg [`TAGW-1:0] retry_tag_in;
 reg [000001:0]  retry_pos_in;
 wire[000001:0]  retry_pos_out;
 wire [`TAGW+1:0]fifo_rty_tag_din;
 wire [`TAGW+1:0]fifo_rty_tag_dout;
 wire [`TAGW-1:0]fifo_rty_tag_count;
 wire            fifo_rty_tag_wr_en;
 wire            fifo_rty_tag_rd_en;
 wire            fifo_rty_tag_empty;
 wire            fifo_rty_tag_ovfl;
 reg             retry_intrpt;
 reg [0003:0]    powerup_cnt;
 reg             fifo_rcy_init;
 reg [`TAGW-1:0] fifo_rcy_init_cnt;
 reg             fifo_rcy_tag_wr_en;
 reg [`TAGW-1:0] fifo_rcy_tag_din;
 wire[`TAGW-1:0] fifo_rcy_tag_count;
 wire            fifo_rcy_tag_rd_en;
 wire[`TAGW-1:0] fifo_rcy_tag_dout;
 wire            fifo_rcy_tag_full;
 wire            fifo_rcy_tag_ovfl;
 wire[`TAGW-1:0] recycle_tag_dout;
 wire            fifo_rcy_tag_empty;
 wire            fifo_rcy_tag_alempty;
 reg             buf_w_data_o_en; 
 reg             buf_w_data_e_en; 
 reg [`TAGW-1:0] buf_w_data_addr;
 reg [1023:0]    buf_w_data; 
 reg             buf_w_info_en;  
 reg [`TAGW-1:0] buf_w_info_addr;
 reg [0200:0]    buf_w_info;    
 wire            buf_r_data_en; 
 wire[1023:0]    buf_r_data;
 wire[`TAGW-1:0] buf_r_data_addr;
 wire            buf_r_info_en_for_wr; 
 wire[`TAGW-1:0] buf_r_info_addr;
 wire[0200:0]    buf_r_info;              
 wire[0127:0]    buf_r_be;       
 reg [0127:0]    retry_be;       
 wire[0063:0]    buf_r_ea;       
 wire[`CTXW:0]   buf_r_ctx;       
 wire            rsv_valid;
 wire[0001:0]    rsv_pos;
 wire[`TAGW-1:0] rsv_tag;
 wire            rsv_first;
 wire            rsv_last;
 wire[`IDW-1:0]  rsv_axi_id;
 wire            rsp_valid;
 wire[`TAGW-1:0] rsp_tag;
 wire[0001:0]    rsp_pos;
 wire[0002:0]    rsp_code;
 wire            rec_valid;
 wire[`TAGW-1:0] rec_tag;
 wire            rd_valid;
 wire[`TAGW-1:0] rd_tag;
 wire            ret_resp;
 `ifndef ENABLE_ODMA
 wire            ret_ready;
 `else
 wire[0031:0]    ret_ready;
 wire[0031:0]    ret_ready_hint; 
 `endif
 wire            ret_valid;
 wire[`TAGW-1:0] ret_tag;
 wire[`IDW-1:0]  ret_axi_id;
 wire            ret_last;
 wire            recycle_tag_out_ready;
 reg [`IDW-1:0]  ret_axi_id_sync;
 reg ret_valid_sync, ret_resp_sync;


 parameter DMA_W = 0,
           DMA_R = 1;

 parameter RESP_GOOD  = 3'b001,
           RESP_RETRY = 3'b010,
           RESP_BAD   = 3'b100;


//---- signaling readiness to AXI slave ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     lcl_addr_ready <= 1'b0;
   else                                             // When:
     lcl_addr_ready <= recycle_tag_out_ready &&     //   1) Tag available in the recycling tag FIFO
                       dma_cmd_ready         &&     //   2) Enough credits for TLX command, no partial command is in process 
                       ~retry_intrpt         ;      //   3) No retry interuption
                       //~retry_intrpt         &&     //   3) No retry interuption
                       //~lcl_addr_idle;              //   4) Transaction in AXI is active

//---- valid AXI command indication ----
 assign local_cmd_valid = (lcl_addr_valid && lcl_addr_ready);

////---- timing alignment for normal and retry data ----
// always@(posedge clk or negedge rst_n)
//   if(~rst_n) 
//     lcl_addr_ctx_real <= {`CTXW{1'b0}};
//   else if(lcl_addr_ctx_valid)
//     lcl_addr_ctx_real <= lcl_addr_ctx;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       retry_tag_out_valid_sync <= 1'b0;
       local_cmd_valid_sync     <= 1'b0;
       lcl_data_in_sync         <= 1024'd0;
       lcl_addr_be_sync         <= 128'd0;
       lcl_addr_ea_sync         <= 64'd0;
       lcl_addr_ctx_sync        <= {`CTXW{1'b0}};
       retry_tag_out_sync       <= {`TAGW{1'b0}};
       recycle_tag_out_sync     <= {`TAGW{1'b0}};
     end
   else
     begin
       retry_tag_out_valid_sync <= retry_tag_out_valid;
       local_cmd_valid_sync     <= local_cmd_valid;
       lcl_data_in_sync         <= lcl_data_in;
       lcl_addr_be_sync         <= lcl_addr_be;
       lcl_addr_ea_sync         <= lcl_addr_ea;
       lcl_addr_ctx_sync        <= lcl_addr_ctx;
       retry_tag_out_sync       <= retry_tag_out;
       recycle_tag_out_sync     <= recycle_tag_out;
     end

//---- direct input data and info out to command encoder ----
// When retry is enabled, select data/info from data buffer for retry
// Otherwise, AXI data/info are routed to command encoder without delay
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       dma_cmd_valid <= 1'd0;
       dma_cmd_data  <= 1024'd0;
       dma_cmd_be    <= 128'd0;
       dma_cmd_ea    <= 64'd0;
       dma_cmd_ctx   <= {`CTXW{1'b0}};
       dma_cmd_tag   <= {`TAGW{1'b0}};
     end
   else
     begin
       dma_cmd_valid <= (retry_tag_out_valid_sync) || local_cmd_valid_sync;
       dma_cmd_data  <= (retry_tag_out_valid_sync)? buf_r_data         : lcl_data_in_sync;
       dma_cmd_be    <= (retry_tag_out_valid_sync)? buf_r_be           : lcl_addr_be_sync;
       dma_cmd_ea    <= (retry_tag_out_valid_sync)? buf_r_ea           : lcl_addr_ea_sync;
       dma_cmd_ctx   <= (retry_tag_out_valid_sync)? buf_r_ctx          : lcl_addr_ctx_sync;
       dma_cmd_tag   <= (retry_tag_out_valid_sync)? retry_tag_out_sync : recycle_tag_out_sync;
     end


//-------------------------------------------------------------------------------------------------------------------------------------
// RECYCLE TAG FIFO
//
//                    -
//   dma_cmd_*   <== | | ================================= lcl_data_in/lcl_addr_*
//                    -
//                         +------------------+
//             rec_tag ==> | recycle tag FIFO | <--------- lcl_addr_ready && lcl_addr_valid
//                         +------------------+
//                    -                     ||
//   dma_cmd_tag <== | | =======================> rsv_tag
//                    -        
//-------------------------------------------------------------------------------------------------------------------------------------

//---- power up after reset ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     powerup_cnt <= 4'd0;
   else if(~&powerup_cnt)
     powerup_cnt <= powerup_cnt + 4'd1;

//---- initialize FIFO contents at the start ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     fifo_rcy_init <= 1'b0;
   else if(&powerup_cnt[3:1] && ~powerup_cnt[0])
     fifo_rcy_init <= 1'b1;
   else if(&fifo_rcy_init_cnt)
     fifo_rcy_init <= 1'b0;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     fifo_rcy_init_cnt <= {`TAGW{1'b0}};
   else if(fifo_rcy_init)
     fifo_rcy_init_cnt <= fifo_rcy_init_cnt + 1'b1;

//---- tag recycling FIFO (FWFT) ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     fifo_rcy_tag_wr_en <= 1'b0;
   else 
     fifo_rcy_tag_wr_en <= fifo_rcy_init || rec_valid;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     fifo_rcy_tag_din <= {`TAGW{1'b0}};
   else if(fifo_rcy_init)
     fifo_rcy_tag_din <= fifo_rcy_init_cnt;
   else
     fifo_rcy_tag_din <= rec_tag;

 //fifo_sync_64_6i6o_fwft mfifo_rcy_tag (
 fifo_sync #(
             .DATA_WIDTH (`TAGW),
             .ADDR_WIDTH (`TAGW),
             .FWFT       (1)
             ) mfifo_rcy_tag (
                              .clk          (clk                 ), // input clk
                              .rst_n        (rst_n               ), // input rst
                              .din          (fifo_rcy_tag_din    ), // input [6 : 0] din
                              .wr_en        (fifo_rcy_tag_wr_en  ), // input wr_en
                              .rd_en        (fifo_rcy_tag_rd_en  ), // input rd_en
                              .dout         (fifo_rcy_tag_dout   ), // output [6 : 0] dout
                              .full         (fifo_rcy_tag_full   ), // output full
                              .empty        (fifo_rcy_tag_empty  ), // output almost_empty 
                              .almost_empty (fifo_rcy_tag_alempty), // output almost_empty 
                              .overflow     (fifo_rcy_tag_ovfl   ), // output overflow
                              .count        (fifo_rcy_tag_count  )  // output [6:0] count
                              );

//---- read out recycled tag whenever AXI is ready ----
// Caution: no latency between tag out request (AXI address info valid) and valid tag out
 assign fifo_rcy_tag_rd_en    = local_cmd_valid;
 //TODO: check with xiaodi if recycle_tag_out_req can be assigned as follow
 assign recycle_tag_out_req   = fifo_rcy_tag_rd_en;
 assign recycle_tag_out       = fifo_rcy_tag_dout;
 assign recycle_tag_out_ready = ~(fifo_rcy_tag_alempty | fifo_rcy_tag_empty); 
 assign buf_empty             = fifo_rcy_tag_full;



//-------------------------------------------------------------------------------------------------------------------------------------
// RETRY TAG FIFO
//
//                                     
//                                     -----o<|-----lcl_addr_idle
//                                    |
//                                    V
//                    +----------------+                       +-------------+
//   dma_resp_tag ==> | retry tag FIFO | ==> retry_out_tag ==> | data buffer |
//    (retry)         +----------------+         ||            +-------------+
//                     --                        ||             ||
//   dma_cmd_tag  <== |F| ========================              ||
//                    --                                        ||
//                     --                                       ||
//   dma_cmd_*    <== |F| =======================================
//                    --                         
//-------------------------------------------------------------------------------------------------------------------------------------

//---- fill in retry tag when response with retry request is available ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       retry_tag_in_valid <= 1'b0;
       retry_tag_in       <= {`TAGW{1'b0}};
       retry_pos_in       <= 2'b0;
     end
   else
     begin
       retry_tag_in_valid <= dma_resp_valid && (dma_resp_code == RESP_RETRY);
       retry_tag_in       <= dma_resp_tag;
       retry_pos_in       <= dma_resp_pos;
     end
     
//---- interrupt when FIFO's half full ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     retry_intrpt <= 1'b0;
   else if(~fifo_rty_tag_empty)
     retry_intrpt <= 1'b0;
   else if(fifo_rty_tag_count[`TAGW-1])
     retry_intrpt <= 1'b1;

//---- retry tag FIFO ----
 assign fifo_rty_tag_din   = {retry_pos_in, retry_tag_in};
 assign fifo_rty_tag_wr_en = retry_tag_in_valid;

 //fifo_sync_64_6i6o_fwft mfifo_rty_tag (
 fifo_sync #(
             .DATA_WIDTH (`TAGW+2),
             .ADDR_WIDTH (`TAGW),
             .FWFT       (1)
             ) mfifo_rty_tag (
                              .clk          (clk                 ), // input clk
                              .rst_n        (rst_n               ), // input rst
                              .din          (fifo_rty_tag_din    ), // input [8 : 0] din
                              .wr_en        (fifo_rty_tag_wr_en  ), // input wr_en
                              .rd_en        (fifo_rty_tag_rd_en  ), // input rd_en
                              .dout         (fifo_rty_tag_dout   ), // output [8 : 0] dout
                              .count        (fifo_rty_tag_count  ), // output [8 : 0] count
                              .empty        (fifo_rty_tag_empty  ), // output empty
                              .overflow     (fifo_rty_tag_ovfl   )  // output overflow
                              );


//---- enable retry when retry interupt is asserted or no transaction in AXI ----
// Caution: no latency between tag out request (AXI address info valid) and valid tag out
 assign retry_tag_out_req   = (retry_intrpt || ~local_cmd_valid) && dma_cmd_ready && (((~rd_valid) && (MODE == DMA_R)) || ((MODE == DMA_W) && ~ret_valid));
 assign fifo_rty_tag_rd_en  = retry_tag_out_req && (!fifo_rty_tag_empty);
 assign retry_tag_out       = fifo_rty_tag_dout[6:0];
 assign retry_tag_out_valid = fifo_rty_tag_rd_en;
 assign retry_pos_out       = fifo_rty_tag_dout[8:7];

//---- extended mask for command BE, used to pick out retry high or low 64B command ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       retry_be <= 127'd0;
     end
   else
     begin
       retry_be <= {{64{retry_pos_out[1]}}, {64{retry_pos_out[0]}}};
     end


//-------------------------------------------------------------------------------------------------------------------------------------
// BUFFER SET
//   * data and information buffers for command data (write) or response data (read)
//   * command data is buffered as preparation for retry
//   * response data is buffered to reorder for AXI read response
//-------------------------------------------------------------------------------------------------------------------------------------

//---- direct input data/info into data buffer ----
//
//     ------------------------------------------
//     |           | Write data  |  Write EA/BE |
//     ------------------------------------------
//     | DMA write | command     |  command     |
//     | DMA read  | response    |  command     |
//     ------------------------------------------

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       buf_w_data_o_en <= 1'b0;
       buf_w_data_e_en <= 1'b0;
       buf_w_data_addr <= {`TAGW{1'b1}};
       buf_w_data      <= 1024'd0;
       buf_w_info_en   <= 1'b0;
       buf_w_info_addr <= {`TAGW{1'b1}};
       buf_w_info      <= 201'd0;
     end
   else
     begin
       buf_w_data_o_en <= (MODE == DMA_W)? local_cmd_valid_sync : (dma_resp_valid && dma_resp_pos[1]);
       buf_w_data_e_en <= (MODE == DMA_W)? local_cmd_valid_sync : (dma_resp_valid && dma_resp_pos[0]);
       buf_w_data_addr <= (MODE == DMA_W)? recycle_tag_out_sync : dma_resp_tag;
       buf_w_data      <= (MODE == DMA_W)? lcl_data_in_sync     : dma_resp_data;
       buf_w_info_en   <= local_cmd_valid_sync;
       buf_w_info_addr <= recycle_tag_out_sync;
       buf_w_info      <= {lcl_addr_ctx_sync, lcl_addr_ea_sync, lcl_addr_be_sync};
     end

//---- buffer for data ----
 ram_simple_dual #(512,`TAGW) mbuf_data_o (
                                     .clk   (clk                 ), 
                                     .ena   (1'b1                ),
                                     .enb   (1'b1                ),
                                     .wea   (buf_w_data_o_en     ), 
                                     .addra (buf_w_data_addr     ), 
                                     .dia   (buf_w_data[1023:512]), 
                                     .addrb (buf_r_data_addr     ), 
                                     .dob   (buf_r_data[1023:512])  
                                     );

 ram_simple_dual #(512,`TAGW) mbuf_data_e (
                                     .clk   (clk                 ), 
                                     .ena   (1'b1                ),
                                     .enb   (1'b1                ),
                                     .wea   (buf_w_data_e_en     ), 
                                     .addra (buf_w_data_addr     ), 
                                     .dia   (buf_w_data[511:0]   ), 
                                     .addrb (buf_r_data_addr     ), 
                                     .dob   (buf_r_data[511:0]   )  
                                     );
//---- buffer for information ----
 ram_simple_dual #(201,`TAGW) mbuf_info (
                                     .clk   (clk            ), 
                                     .ena   (1'b1           ),
                                     .enb   (1'b1           ),
                                     .wea   (buf_w_info_en  ), 
                                     .addra (buf_w_info_addr), 
                                     .dia   (buf_w_info     ), 
                                     .addrb (buf_r_info_addr), 
                                     .dob   (buf_r_info     )  
                                     );

//---- read buffer data and info out of buffer ----
//
//     -----------------------------------------------
//     |           | Read data   |  Read EA/BE/CTX   |
//     -----------------------------------------------
//     | DMA write | retry       |  retry or reclaim |
//     | DMA read  | reclaim     |  retry or reclaim |
//     -----------------------------------------------

 assign buf_r_data_en        = (MODE == DMA_W)? retry_tag_out_valid : rd_valid;
 assign buf_r_data_addr      = (MODE == DMA_W)? retry_tag_out       : rd_tag;
 `ifdef ENABLE_ODMA
 assign buf_r_info_en_for_wr = (MODE == DMA_W) && (ret_valid);
 `else
 assign buf_r_info_en_for_wr = (MODE == DMA_W) && ((ret_valid && ret_ready) || (ret_valid_sync && !lcl_resp_ready));
 `endif
 assign buf_r_info_addr      = retry_tag_out_valid? retry_tag_out : (buf_r_info_en_for_wr ? ret_tag : rd_tag);
 assign buf_r_be             = buf_r_info[127:0] & retry_be;
 assign buf_r_ea             = buf_r_info[191:128];
 assign buf_r_ctx            = buf_r_info[200:192];


//=====================================================================================================================================
// transaction order management
//=====================================================================================================================================

//---- slot reservation ----
 assign rsv_valid  = recycle_tag_out_req;
 assign rsv_tag    = recycle_tag_out;
 assign rsv_first  = lcl_addr_first;
 assign rsv_last   = lcl_addr_last;
 assign rsv_pos[0] = |lcl_addr_be[63:0];
 assign rsv_pos[1] = |lcl_addr_be[127:64];
 assign rsv_axi_id = lcl_addr_axi_id;

//---- response with tags ----
 assign rsp_valid = dma_resp_valid && (dma_resp_code != RESP_RETRY);
 assign rsp_tag   = dma_resp_tag;
 assign rsp_pos   = dma_resp_pos;
 assign rsp_code  = dma_resp_code;

 generate
     if(MODE == 1)
     begin: rd_order_mng_gen
         //---- maintaining the order of AXI burst return for read channel----
         brdg_rd_order_mng_array mrd_order_mng (
                        .clk            (clk           ), 
                        .rst_n          (rst_n         ), 
                        .rsv_valid      (rsv_valid     ),  
                        .rsv_tag        (rsv_tag       ),   
                        .rsv_pos        (rsv_pos       ),   
                        .rsv_axi_id     (rsv_axi_id    ),
                        .rsv_first      (rsv_first     ), 
                        .rsv_last       (rsv_last      ), 
                        .rsp_valid      (rsp_valid     ),  
                        .rsp_tag        (rsp_tag       ), 
                        .rsp_code       (rsp_code      ), 
                        .rsp_pos        (rsp_pos       ),   
                        .ret_ready      (ret_ready     ),
                        `ifdef ENABLE_ODMA
                        .ret_ready_hint (ret_ready_hint),
                        `endif
                        .ret_valid      (ret_valid     ), 
                        .ret_axi_id     (ret_axi_id    ),
                        .ret_resp       (ret_resp      ),  
                        .ret_last       (ret_last      ),   
                        .rd_valid       (rd_valid      ), 
                        .rd_tag         (rd_tag        ), 
                        .rec_valid      (rec_valid     ), 
                        .rec_tag        (rec_tag       ) 
                        );
     end
     else
     begin:wr_order_mng_gen
         //---- maintaining the order of AXI burst return for write channel----
         brdg_wr_order_mng_array mwr_order_mng (
                        .clk       (clk       ), 
                        .rst_n     (rst_n     ), 
                        .rsv_valid (rsv_valid ),  
                        .rsv_tag   (rsv_tag   ),   
                        .rsv_pos   (rsv_pos   ),   
                        .rsv_axi_id(rsv_axi_id),
                        .rsv_first (rsv_first ), 
                        .rsv_last  (rsv_last  ), 
                        .rsp_valid (rsp_valid ),  
                        .rsp_tag   (rsp_tag   ), 
                        .rsp_code  (rsp_code  ), 
                        .rsp_pos   (rsp_pos   ),   
                        .ret_ready (ret_ready ),
                        .ret_valid (ret_valid ), 
                        .ret_tag   (ret_tag   ), 
                        .ret_axi_id(ret_axi_id),
                        .ret_resp  (ret_resp  ),  
                        .ret_last  (ret_last  ),   
                        .rec_valid (rec_valid ), 
                        .rec_tag   (rec_tag   ) 
                        );
     end
 endgenerate

//---- return data and response back to AXI, which should be one cycle later than reclaim channel ----
 `ifdef ENABLE_ODMA
 //NOTE:
 // In ODMA mode, lcl_resp_valid of wr channel will be a fixed value, this fixed value will only be given to 
 // wr_order_mng_array to decide whether a ret_valid response can be generated to ST, MM or cmpl channle.
 // As lcl_resp_valid is a fixed value, once a ret_valid can be generated, it means the related 
 // ret_valid_sync(lcl_resp_valid) can definately be passed to the downstream modules, we do not need to care
 // about lcl_resp_valid singal any more.
 //TODO: if the lcl_resp_valid in ODMA mode is modified to a non-fixed value, this part should be modified accordingly.
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     ret_valid_sync <= 1'b0;
   else if(ret_valid)
     ret_valid_sync <= 1'b1;
   else
     ret_valid_sync <= 1'b0;

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       ret_axi_id_sync <= {`IDW{1'd0}};
       ret_resp_sync <= 'd0;
     end
   else if(ret_valid)
     begin
       ret_axi_id_sync <= ret_axi_id;
       ret_resp_sync <= ret_resp;
     end

 assign ret_ready         = lcl_resp_ready;
 assign lcl_resp_valid    = (MODE == DMA_W)? ret_valid_sync : ret_valid;
 assign lcl_resp_axi_id   = (MODE == DMA_W)? ret_axi_id_sync : ret_axi_id;
 assign lcl_resp_code     = (MODE == DMA_W)? ret_resp_sync : ret_resp;
 assign lcl_resp_ctx      = buf_r_ctx;
 assign lcl_data_out      = buf_r_data;
 assign lcl_data_out_last = ret_last;
 assign lcl_data_ctx      = buf_r_ctx;
 assign ret_ready_hint    = lcl_resp_ready_hint;
 `else
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     ret_valid_sync <= 1'b0;
   else if(ret_valid && ret_ready)
     ret_valid_sync <= 1'b1;
   else if(lcl_resp_ready)
     ret_valid_sync <= 1'b0;

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       ret_axi_id_sync <= {`IDW{1'd0}};
       ret_resp_sync <= 'd0;
     end
   else if(ret_valid && ret_ready)
     begin
       ret_axi_id_sync <= ret_axi_id;
       ret_resp_sync <= ret_resp;
     end

 assign ret_ready         = (MODE == DMA_W)?(!ret_valid_sync || lcl_resp_ready) : lcl_resp_ready;
 assign lcl_resp_valid    = (MODE == DMA_W)? ret_valid_sync : ret_valid;
 assign lcl_resp_axi_id   = (MODE == DMA_W)? ret_axi_id_sync : ret_axi_id;
 assign lcl_resp_code     = (MODE == DMA_W)? ret_resp_sync : ret_resp;
 assign lcl_resp_ctx      = buf_r_ctx;
 assign lcl_data_out      = buf_r_data;
 assign lcl_data_out_last = ret_last;
 assign lcl_data_ctx      = buf_r_ctx;
 `endif



//=================================================================================================================
// STATUS output for SNAP registers
//=================================================================================================================

 reg [31:0] cmd_idle_cnt;
 reg [31:0] rsp_idle_cnt;

//---- DEBUG registers ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     debug_axi_cmd_idle <= 1'b0;
   else if(local_cmd_valid)
     debug_axi_cmd_idle <= 1'b0;
   else if(cmd_idle_cnt == debug_axi_cmd_idle_lim)
     debug_axi_cmd_idle <= 1'b1;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     cmd_idle_cnt <= 32'd0;
   else if(local_cmd_valid)
     cmd_idle_cnt <= 32'd0;
   else 
     cmd_idle_cnt <= cmd_idle_cnt + 32'd1;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     debug_axi_rsp_idle <= 1'b0;
   else if(lcl_resp_valid)
     debug_axi_rsp_idle <= 1'b0;
   else if(rsp_idle_cnt == debug_axi_rsp_idle_lim)
     debug_axi_rsp_idle <= 1'b1;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     rsp_idle_cnt <= 32'd0;
   else if(lcl_resp_valid)
     rsp_idle_cnt <= 32'd0;
   else 
     rsp_idle_cnt <= rsp_idle_cnt + 32'd1;


//---- DEBUG registers ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     debug_axi_cnt_cmd <= 32'd0;
   else if (debug_cnt_clear)
     debug_axi_cnt_cmd <= 32'd0;
   else if (lcl_addr_first && lcl_addr_valid && lcl_addr_ready)
     debug_axi_cnt_cmd <= debug_axi_cnt_cmd + 32'd1;

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     debug_axi_cnt_rsp <= 32'd0;
   else if (debug_cnt_clear)
     debug_axi_cnt_rsp <= 32'd0;
   `ifdef ENABLE_ODMA
   else if ((MODE)? (lcl_data_out_last && lcl_resp_valid) : (lcl_resp_valid))
   `else
   else if ((MODE)? (lcl_data_out_last && lcl_resp_ready && lcl_resp_valid) : (lcl_resp_ready && lcl_resp_valid))
   `endif
     debug_axi_cnt_rsp <= debug_axi_cnt_rsp + 32'd1;

//---- DEBUG register ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     debug_buf_cnt <= 8'd0;
   else 
     debug_buf_cnt <= (buf_empty)? 8'd0 : (8'd128 - fifo_rcy_tag_count);

//---- FAULT ISOLATION REGISTER ----
 reg fir_fifo_rcy_tag_overflow;
 reg fir_fifo_rty_tag_overflow;

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       fir_fifo_rcy_tag_overflow <= 1'b0;
       fir_fifo_rty_tag_overflow <= 1'b0;

       fir_fifo_overflow <= 2'b0;
     end
   else
     begin
       if (fifo_rcy_tag_ovfl) fir_fifo_rcy_tag_overflow <= 1'b1;
       if (fifo_rty_tag_ovfl) fir_fifo_rty_tag_overflow <= 1'b1;

       fir_fifo_overflow <= { fir_fifo_rcy_tag_overflow, fir_fifo_rty_tag_overflow };
     end


 // psl default clock = (posedge clk);

//==== PSL ASSERTION ==============================================================================
// psl NEW_CONTEXT_CONGESTED : assert always onehot0({retry_tag_out_valid, ((MODE == DMA_R) && rd_valid), ((MODE == DMA_W) && ret_valid)}) report "information buffer read conflict! Reading the infor BUF for TLX retry command and for AXI reclaim should never happen in the same time.";
//==== PSL ASSERTION ==============================================================================

//==== PSL ASSERTION ==============================================================================
// psl DMA_COMMAND_RETRY_CONFLICT : assert never (retry_tag_out_valid_sync && local_cmd_valid_sync) report "retry and normal command conflict! It's not allowed to send both retry command from retry FIFO and normal command from AXI to command encoder simultanuously.";

// psl SURPLUS_TLX_RSP : assert never (fifo_rcy_tag_full && dma_resp_valid) report "all buffer slots have been released, response from TLX is nevertheless received.";

// psl SURPLUS_AXI_CMD : assert never (fifo_rcy_tag_empty && local_cmd_valid) report "buffer slots have been used up, command from AXI is nevertheless received.";
//==== PSL ASSERTION ==============================================================================

//==== PSL COVERAGE ==============================================================================
 // psl RETRY_FIFO_ALMOST_FULL : cover {retry_intrpt};
 // psl TAG_ALL_CLAIMED : cover {~fifo_rcy_tag_full; fifo_rcy_tag_full};
 // psl TAG_ALL_SET_FREE : cover {~fifo_rcy_tag_empty; fifo_rcy_tag_empty};
//==== PSL COVERAGE ==============================================================================


endmodule
