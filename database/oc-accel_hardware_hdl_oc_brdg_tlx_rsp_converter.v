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
`timescale 1ns / 1ps

`include "snap_global_vars.v"

module brdg_tlx_rsp_converter (
                               input                      clk_tlx                        ,
                               input                      clk_afu                        ,
                               input                      rst_n                          ,

                               //---- TLX side interface --------------------------------
                                 // response
                               input                      tlx_afu_resp_valid             ,
                               input      [015:0]         tlx_afu_resp_afutag            ,
                               input      [007:0]         tlx_afu_resp_opcode            ,
                               input      [003:0]         tlx_afu_resp_code              ,
                               input      [001:0]         tlx_afu_resp_dl                ,
                               input      [001:0]         tlx_afu_resp_dp                ,
                                 // read data
                               output reg                 afu_tlx_resp_rd_req            ,
                               output reg [002:0]         afu_tlx_resp_rd_cnt            ,                                                                  
                               input                      tlx_afu_resp_data_valid        , 
                               input      [511:0]         tlx_afu_resp_data_bus          ,
                               input                      tlx_afu_resp_data_bdi          ,
                                 // response credit
                               output reg                 afu_tlx_resp_credit            ,
                               output     [006:0]         afu_tlx_resp_initial_credit    ,

                               
                               //---- AFU side interface --------------------------------
                                 // write channel
                               output                     tlx_w_rsp_valid               ,
                               output     [015:0]         tlx_w_rsp_afutag              ,
                               output     [007:0]         tlx_w_rsp_opcode              ,
                               output     [003:0]         tlx_w_rsp_code                ,
                               output     [001:0]         tlx_w_rsp_dl                  ,
                               output     [001:0]         tlx_w_rsp_dp                  ,
                                 // read channel
                               output                     tlx_r_rsp_valid               ,
                               output     [015:0]         tlx_r_rsp_afutag              ,
                               output     [007:0]         tlx_r_rsp_opcode              ,
                               output     [003:0]         tlx_r_rsp_code                ,
                               output     [001:0]         tlx_r_rsp_dl                  ,
                               output     [001:0]         tlx_r_rsp_dp                  ,
                               output                     tlx_r_rdata_o_dv              ,
                               output                     tlx_r_rdata_e_dv              ,
                               output                     tlx_r_rdata_o_bdi             ,
                               output                     tlx_r_rdata_e_bdi             ,
                               output     [511:0]         tlx_r_rdata_o                 ,
                               output     [511:0]         tlx_r_rdata_e                 ,
                                 // interrupt channel
                               output                     tlx_i_rsp_valid               ,
                               output     [015:0]         tlx_i_rsp_afutag              ,
                               output     [007:0]         tlx_i_rsp_opcode              ,
                               output     [003:0]         tlx_i_rsp_code                ,

                               //---- control and status ---------------------
                               input      [031:0]         debug_tlx_rsp_idle_lim         ,
                               output reg                 debug_tlx_rsp_idle             ,
                               output reg [005:0]         fir_fifo_overflow              ,
	                              output reg                 fir_tlx_rsp_err              
                               );                                                      
                                                                                       
                                                                                       
 reg          fifo_wr_rspcnv_den;
 reg [031:00] fifo_wr_rspcnv_din;
 reg          fifo_wr_rspcnv_rdrq;
 wire         fifo_wr_rspcnv_dv;
 wire         fifo_wr_rspcnv_alempty;
 wire         fifo_wr_rspcnv_empty;
 wire[031:00] fifo_wr_rspcnv_dout;
 wire[004:00] fifo_wr_rspcnv_wrcnt;
 reg          fifo_rd_rspcnv_den;
 reg [031:00] fifo_rd_rspcnv_din;
 reg          fifo_rd_rspcnv_rdrq;
 wire         fifo_rd_rspcnv_dv;
 wire         fifo_rd_rspcnv_alempty;
 wire         fifo_rd_rspcnv_empty;
 wire[031:00] fifo_rd_rspcnv_dout;
 wire[004:00] fifo_rd_rspcnv_wrcnt;
 reg [004:00] rsp_credit_cnt;
 reg          tlx_dpdl_wr_toggle;
 wire[001:00] real_dp_din_o;
 wire[001:00] real_dp_din_e;
 reg          fifo_dpdl_o_den;
 reg          fifo_dpdl_e_den;
 reg [003:00] fifo_dpdl_o_din;
 wire[003:00] fifo_dpdl_o_dout;
 reg [003:00] fifo_dpdl_e_din;
 wire[003:00] fifo_dpdl_e_dout;
 reg          tlx_dpdl_rd_toggle;
 wire         fifo_dpdl_o_rdrq;
 wire         fifo_dpdl_e_rdrq;
 wire         fifo_dpdl_o_dv;
 wire         fifo_dpdl_e_dv;
 wire[001:00] rdata_dp;
 wire[001:00] rdata_dl;
 reg [511:00] rdata_bus;
 reg          rdata_valid;
 reg          rdata_bdi;
 reg          tlx_o_dv;
 reg          tlx_e_dv;
 reg [511:00] tlx_o_data;
 reg [511:00] tlx_e_data;
 reg          tlx_o_bdi;
 reg          tlx_e_bdi;
 wire         fifo_datcnv_o_den;
 wire[512:00] fifo_datcnv_o_din;
 reg          fifo_datcnv_o_rdrq;
 wire         fifo_datcnv_o_empty;
 wire[512:00] fifo_datcnv_o_dout;
 wire         fifo_datcnv_o_dv;
 wire[003:00] fifo_datcnv_o_wrcnt;
 wire         fifo_datcnv_e_den;
 wire[512:00] fifo_datcnv_e_din;
 reg          fifo_datcnv_e_rdrq;
 wire         fifo_datcnv_e_empty;
 wire[512:00] fifo_datcnv_e_dout;
 wire         fifo_datcnv_e_dv;
 wire         fifo_rd_rspcnv_ovfl;
 wire         fifo_wr_rspcnv_ovfl;
 wire         fifo_dpdl_o_ovfl;
 wire         fifo_dpdl_e_ovfl;
 wire         fifo_dpdl_o_udfl;
 wire         fifo_dpdl_e_udfl;
 wire         fifo_datcnv_o_ovfl;
 wire         fifo_datcnv_e_ovfl;


//-----------------------------------------------------------------------------------------------------------------
//  CREDIT MANAGEMENT                                                   
//-----------------------------------------------------------------------------------------------------------------

//---- set response initial credit number with almost half capacity of response FIFO ----
 assign afu_tlx_resp_initial_credit = 7'b0000111;

 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     rsp_credit_cnt <= 4'd0;
   else
     case({tlx_afu_resp_valid,afu_tlx_resp_credit})
       2'b10 : rsp_credit_cnt <= rsp_credit_cnt + 4'd1;
       2'b01 : rsp_credit_cnt <= rsp_credit_cnt - 4'd1;
     endcase

//---- give response credit back when response is received, withdraw credit when response FIFO is more than half full ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     afu_tlx_resp_credit <= 1'b0;
   else if(fifo_rd_rspcnv_wrcnt[4] || fifo_wr_rspcnv_wrcnt[4] || (fifo_datcnv_o_wrcnt > 4'd5))
     afu_tlx_resp_credit <= 1'b0;
   else 
     afu_tlx_resp_credit <= ((~afu_tlx_resp_credit && (rsp_credit_cnt == 4'd1)) || (rsp_credit_cnt > 4'd1)); 


//=====================================================================================================================================
//
// CLOCK DOMAIN CONVERTION FIFO SET: TLX -> AFU
//
//   For read, care must be taken to identify even and odd data correctly.
//                                                                                             :
//                                                           +---+              +---------------------------------+
//   tlx_afu_resp_dp/dl/afutag =============================>|   |============> | write response conversion FIFO  | ==> tlx_w_rsp_dp/dl/afutag
//                                  ||                       | M |              +---------------------------------+
//                                  ||                       | U |                             :
//                                  ||                       | X |              +---------------------------------+
//                                  ||                       |   |============> | read response conversion FIFO   | ==> tlx_r_rsp_dp/dl/afutag
//                                  ||                       +---+              +---------------------------------+
//                                  ||                                                         :
//                            ......||..........................................................................................
//                                  ||                                                         :                 V
//                                  ||  +--+    +-----------------+                            :             for read only
//                                  ||  |  | => | dp/dl FIFO odd  | =======                    :  
//                                  ||  |M |    +-----------------+      ||                    :  
//                                  ==> |U |    +--------------^--+      ||                    :
//                                      |X | => | dp/dl FIFO even | ===  ||         TLX clock  :  AFU clock
//                                      +--+    +-----------------+   V  V             domain  :  domain
//                                       ^                     ^   +-------+                   :
//                   dpdl_write_toggle __|                     |   | dp dl |                   :
//                                                             |   +-------+                   :
//   tlx_afu_resp_data_valid  _________(dpdl_read_toggle)______|    ||  ||                     :
//                                                                  V   V                      :
//                                                               +----------+    +---------------------------+
//                                                               |    odd   | => | data conversion FIFO odd  | ==> tlx_r_rsp_data_o 
//    tlx_afu_resp_data_bus   =================================> |   even   |    +---------------------------+
//                                                               |   data   |    +---------------------------+
//                                                               | splitter | => | data conversion FIFO even | ==> tlx_r_rsp_data_e 
//                                                               +----------+    +---------------------------+
//                                                                                             :
//  
//=====================================================================================================================================



//----------------------------------------------------------------------------------------------------------
// READ FIFO for response info clock domain conversion
//   * write in response in TLX time domain
//   * read out response in AFU time domain whenever available
//----------------------------------------------------------------------------------------------------------

//---- FIFO input from TLX info ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       fifo_rd_rspcnv_den <= 1'b0;
       fifo_rd_rspcnv_din <= 32'd0;
     end
   else
     begin
       fifo_rd_rspcnv_den <= tlx_afu_resp_valid && tlx_afu_resp_afutag[15];
       fifo_rd_rspcnv_din <= {tlx_afu_resp_dp, tlx_afu_resp_dl, tlx_afu_resp_code, tlx_afu_resp_opcode, tlx_afu_resp_afutag}; //2+2+4+8+16=32
     end

//---- FIFO for response info ---- 
 fifo_async #(
              .DATA_WIDTH(32),
              .ADDR_WIDTH(5),
              .DISTR(1)
              ) mfifo_rd_rspcnv (
                                 .wr_clk       (clk_tlx               ),
                                 .rd_clk       (clk_afu               ),
                                 .wr_rst       (~rst_n                ),
                                 .rd_rst       (~rst_n                ),
                                 .din          (fifo_rd_rspcnv_din    ),
                                 .wr_en        (fifo_rd_rspcnv_den    ),
                                 .rd_en        (fifo_rd_rspcnv_rdrq   ),
                                 .valid        (fifo_rd_rspcnv_dv     ),
                                 .dout         (fifo_rd_rspcnv_dout   ),
                                 .overflow     (fifo_rd_rspcnv_ovfl   ),
                                 .wr_data_count(fifo_rd_rspcnv_wrcnt  ),
                                 .almost_empty (fifo_rd_rspcnv_alempty),
                                 .empty        (fifo_rd_rspcnv_empty  )
                                 );

 always@(posedge clk_afu or negedge rst_n)
   if(~rst_n) 
     fifo_rd_rspcnv_rdrq <= 1'b0;
   else if((fifo_rd_rspcnv_alempty && fifo_rd_rspcnv_rdrq) || fifo_rd_rspcnv_empty)  // make sure no residual data in FIFO
     fifo_rd_rspcnv_rdrq <= 1'b0;
   else
     fifo_rd_rspcnv_rdrq <= 1'b1;

//----------------------------------------------------------------------------------------------------------
// WRITE FIFO for response info clock domain conversion
//   * write in response in TLX time domain
//   * read out response in AFU time domain whenever available
//----------------------------------------------------------------------------------------------------------

//---- FIFO input from TLX info ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       fifo_wr_rspcnv_den <= 1'b0;
       fifo_wr_rspcnv_din <= 32'd0;
     end
   else
     begin
       fifo_wr_rspcnv_den <= tlx_afu_resp_valid && ~tlx_afu_resp_afutag[15];
       fifo_wr_rspcnv_din <= {tlx_afu_resp_dp, tlx_afu_resp_dl, tlx_afu_resp_code, tlx_afu_resp_opcode, tlx_afu_resp_afutag}; //2+2+4+8+16=32
     end

//---- FIFO for response info ---- 
 fifo_async #(
              .DATA_WIDTH(32),
              .ADDR_WIDTH(5),
              .DISTR(1)
              ) mfifo_wr_rspcnv (
                                 .wr_clk       (clk_tlx               ),
                                 .rd_clk       (clk_afu               ),
                                 .wr_rst       (~rst_n                ),
                                 .rd_rst       (~rst_n                ),
                                 .din          (fifo_wr_rspcnv_din    ),
                                 .wr_en        (fifo_wr_rspcnv_den    ),
                                 .rd_en        (fifo_wr_rspcnv_rdrq   ),
                                 .valid        (fifo_wr_rspcnv_dv     ),
                                 .dout         (fifo_wr_rspcnv_dout   ),
                                 .overflow     (fifo_wr_rspcnv_ovfl   ),
                                 .wr_data_count(fifo_wr_rspcnv_wrcnt  ),
                                 .almost_empty (fifo_wr_rspcnv_alempty),
                                 .empty        (fifo_wr_rspcnv_empty  )
                                 );

 always@(posedge clk_afu or negedge rst_n)
   if(~rst_n) 
     fifo_wr_rspcnv_rdrq <= 1'b0;
   else if((fifo_wr_rspcnv_alempty && fifo_wr_rspcnv_rdrq) || fifo_wr_rspcnv_empty)  // make sure no residual data in FIFO
     fifo_wr_rspcnv_rdrq <= 1'b0;
   else
     fifo_wr_rspcnv_rdrq <= 1'b1;


//----------------------------------------------------------------------------------------------------------
// FIFO for data length/ data position of good response
//   * dual FIFOs are used to expand 128B response twice
//   * write in dp and dl when read response is good
//   * output of this FIFO is an indicator of response data that comes afterwards
//----------------------------------------------------------------------------------------------------------

 localparam [7:0] TLX_AFU_RESP_OPCODE_READ_RESPONSE = 8'b00000100;  // -- Read Response

//---- toggle write position for FIFO with 64B response ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     tlx_dpdl_wr_toggle <= 1'b0;
   else if((tlx_afu_resp_valid) && (tlx_afu_resp_dl == 2'd1) && (tlx_afu_resp_opcode == TLX_AFU_RESP_OPCODE_READ_RESPONSE))
     tlx_dpdl_wr_toggle <= ~tlx_dpdl_wr_toggle;

//---- for 128B response, write dl and dp in both even and odd FIFO; for 64B response, write alternately in even or odd FIFO, starting from even ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       fifo_dpdl_o_den <= 1'b0;
       fifo_dpdl_e_den <= 1'b0;
     end
   else if(tlx_afu_resp_valid && (tlx_afu_resp_opcode == TLX_AFU_RESP_OPCODE_READ_RESPONSE))
     begin
       fifo_dpdl_o_den <= ((tlx_afu_resp_dl == 2'd2) || ((tlx_afu_resp_dl == 2'd1) &&  tlx_dpdl_wr_toggle));
       fifo_dpdl_e_den <= ((tlx_afu_resp_dl == 2'd2) || ((tlx_afu_resp_dl == 2'd1) && ~tlx_dpdl_wr_toggle));
     end
   else
     begin
       fifo_dpdl_o_den <= 1'b0;
       fifo_dpdl_e_den <= 1'b0;
     end

//---- manage real write position with 128B. this is to help the read side distinguish between the 1st 64B and 2nd 64B for an 128B response ----
// if current 64B dpdl in even FIFO, then next 128B dpdl should be in odd FIFO, so it should be 00 in odd FIFO for the 1st dp of the next 128B
// tlx_afu_resp_dl     <01><10><10><01><01><01><10>
// real_dp_din_o       <  ><00><00><dp><  ><dp><01>
// real_dp_din_e       <dp><01><01><  ><dp><  ><00>
// tlx_dpdl_wr_toggle  ____/-----------\___/---\___

 wire h_64B = tlx_afu_resp_afutag[8];
 wire l_64B = tlx_afu_resp_afutag[7];
 wire[1:0] pos_64B = ({h_64B,l_64B} == 2'b01)? 2'b00 : (({h_64B,l_64B} == 2'b10)? 2'b01 : tlx_afu_resp_dp);
 assign real_dp_din_o = (tlx_afu_resp_dl == 2'd2)? {1'b0,~tlx_dpdl_wr_toggle} : pos_64B;
 assign real_dp_din_e = (tlx_afu_resp_dl == 2'd2)? {1'b0, tlx_dpdl_wr_toggle} : pos_64B;

 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       fifo_dpdl_e_din <= 4'd0;
       fifo_dpdl_o_din <= 4'd0;
     end
   else
     begin
       fifo_dpdl_e_din <= {real_dp_din_e, tlx_afu_resp_dl};
       fifo_dpdl_o_din <= {real_dp_din_o, tlx_afu_resp_dl};
     end

//---- FIFO for response dl/dp odd ----
 fifo_sync #(
             .DATA_WIDTH (4),
             .ADDR_WIDTH (5) 
             ) mfifo_dpdl_o (
                             .clk      (clk_tlx          ),
                             .rst_n    (rst_n            ),
                             .din      (fifo_dpdl_o_din  ),
                             .wr_en    (fifo_dpdl_o_den  ),
                             .rd_en    (fifo_dpdl_o_rdrq ),
                             .dout     (fifo_dpdl_o_dout ),
                             .valid    (fifo_dpdl_o_dv   ),
                             .overflow (fifo_dpdl_o_ovfl ),
                             .underflow(fifo_dpdl_o_udfl )
                             );

//---- FIFO for response dl/dp even ----
 fifo_sync #(
             .DATA_WIDTH (4),
             .ADDR_WIDTH (5) 
             ) mfifo_dpdl_e (
                             .clk      (clk_tlx          ),
                             .rst_n    (rst_n            ),
                             .din      (fifo_dpdl_e_din  ),
                             .wr_en    (fifo_dpdl_e_den  ),
                             .rd_en    (fifo_dpdl_e_rdrq ),
                             .dout     (fifo_dpdl_e_dout ),
                             .valid    (fifo_dpdl_e_dv   ),
                             .overflow (fifo_dpdl_e_ovfl ),
                             .underflow(fifo_dpdl_e_udfl )
                             );




//---- reflect good TLX read request to accept responsed data----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       afu_tlx_resp_rd_req <= 1'b0;
       afu_tlx_resp_rd_cnt <= 2'b0;
     end
   else
     begin
       afu_tlx_resp_rd_req <= tlx_afu_resp_valid && (tlx_afu_resp_opcode == TLX_AFU_RESP_OPCODE_READ_RESPONSE);
       afu_tlx_resp_rd_cnt <= tlx_afu_resp_dl;
     end

//---- always pop dp/dl out when response data is available, from even or odd FIFO alternatively. MUST always starts from even ----
// assuming that the dpdl FIFO can never be empty when valid data comes
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     tlx_dpdl_rd_toggle <= 1'b0;
   else if(tlx_afu_resp_data_valid)
     tlx_dpdl_rd_toggle <= ~tlx_dpdl_rd_toggle;

 assign fifo_dpdl_o_rdrq = tlx_afu_resp_data_valid &&  tlx_dpdl_rd_toggle;
 assign fifo_dpdl_e_rdrq = tlx_afu_resp_data_valid && ~tlx_dpdl_rd_toggle;

//---- extract dl and dp from read data ----
 assign rdata_dl = (fifo_dpdl_e_dv)? fifo_dpdl_e_dout[1:0] : fifo_dpdl_o_dout[1:0];
 assign rdata_dp = (fifo_dpdl_e_dv)? fifo_dpdl_e_dout[3:2] : fifo_dpdl_o_dout[3:2];

//---- delay once to sync with dp and dl output ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       rdata_valid <= 1'b0;
       rdata_bus   <= 512'd0;
       rdata_bdi   <= 1'b0;
     end
   else
     begin
       rdata_valid <= tlx_afu_resp_data_valid;
       rdata_bus   <= tlx_afu_resp_data_bus;
       rdata_bdi   <= tlx_afu_resp_data_bdi;
     end

//---- split 64B TLX resp data into even and odd lanes to prepare for AFU time domain conversion ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       tlx_e_data <= 512'd0;
       tlx_o_data <= 512'd0;
       tlx_e_bdi  <= 1'b0;
       tlx_o_bdi  <= 1'b0;
     end
   else
     case(rdata_dp)
       2'b01 : begin tlx_o_data <= rdata_bus; tlx_o_bdi <= rdata_bdi; tlx_e_bdi <= 1'b0; end
       2'b00 : begin tlx_e_data <= rdata_bus; tlx_e_bdi <= rdata_bdi; tlx_o_bdi <= 1'b0; end
     endcase 

 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       tlx_e_dv <= 1'b0;
       tlx_o_dv <= 1'b0;
     end
   else 
     begin   // write both even and odd for dl=1 (64B) regardless of dp
       tlx_e_dv <= rdata_valid && (((rdata_dp == 2'b00) || (rdata_dl == 2'b01)) && (fifo_dpdl_e_dv || fifo_dpdl_o_dv));  
       tlx_o_dv <= rdata_valid && (((rdata_dp == 2'b01) || (rdata_dl == 2'b01)) && (fifo_dpdl_e_dv || fifo_dpdl_o_dv));
     end


//----------------------------------------------------------------------------------------------------------
// FIFO for response data time domain conversion 
//   TLX data must be first correctly split into dual channels before going through time conversion
//----------------------------------------------------------------------------------------------------------

//---- FIFO input from TLX data ---
 assign fifo_datcnv_o_den = tlx_o_dv;
 assign fifo_datcnv_o_din = {tlx_o_bdi, tlx_o_data};

//---- FIFO for response data ---- 
 fifo_async #(
              .DATA_WIDTH(513),
              .ADDR_WIDTH(4),
              .DISTR(1)
              ) mfifo_datcnv_o (
                                .wr_clk       (clk_tlx              ),
                                .rd_clk       (clk_afu              ),
                                .wr_rst       (~rst_n               ),
                                .rd_rst       (~rst_n               ),
                                .din          (fifo_datcnv_o_din    ),
                                .wr_en        (fifo_datcnv_o_den    ),
                                .rd_en        (fifo_datcnv_o_rdrq   ),
                                .dout         (fifo_datcnv_o_dout   ),
                                .valid        (fifo_datcnv_o_dv     ),
                                .overflow     (fifo_datcnv_o_ovfl   ),
                                .wr_data_count(fifo_datcnv_o_wrcnt  ),
                                .empty        (fifo_datcnv_o_empty  )
                                );

//---- FIFO read request, making sure no residual data in FIFO ----
 always@(posedge clk_afu or negedge rst_n)
   if(~rst_n) 
     fifo_datcnv_o_rdrq <= 1'b0;
   else 
     fifo_datcnv_o_rdrq <= ~fifo_datcnv_o_empty;

//---- FIFO input from TLX data ---
 assign fifo_datcnv_e_den = tlx_e_dv;
 assign fifo_datcnv_e_din = {tlx_e_bdi, tlx_e_data};

//---- FIFO for response data ---- 
 fifo_async #(
              .DATA_WIDTH(513),
              .ADDR_WIDTH(4),
              .DISTR(1)
              ) mfifo_datcnv_e (
                                .wr_clk      (clk_tlx              ),
                                .rd_clk      (clk_afu              ),
                                .wr_rst      (~rst_n               ),
                                .rd_rst      (~rst_n               ),
                                .din         (fifo_datcnv_e_din    ),
                                .wr_en       (fifo_datcnv_e_den    ),
                                .rd_en       (fifo_datcnv_e_rdrq   ),
                                .dout        (fifo_datcnv_e_dout   ),
                                .valid       (fifo_datcnv_e_dv     ),
                                .overflow    (fifo_datcnv_e_ovfl   ),
                                .empty       (fifo_datcnv_e_empty  )
                                );

//---- FIFO read request, making sure no residual data in FIFO ----
 always@(posedge clk_afu or negedge rst_n)
   if(~rst_n) 
     fifo_datcnv_e_rdrq <= 1'b0;
   else 
     fifo_datcnv_e_rdrq <= ~fifo_datcnv_e_empty;


//---- FIFO output to response decoder ----
 // write info
 assign tlx_w_rsp_valid   = fifo_wr_rspcnv_dv;
 assign tlx_w_rsp_afutag  = fifo_wr_rspcnv_dout[15:00];
 assign tlx_w_rsp_opcode  = fifo_wr_rspcnv_dout[23:16];
 assign tlx_w_rsp_code    = fifo_wr_rspcnv_dout[27:24];
 assign tlx_w_rsp_dl      = fifo_wr_rspcnv_dout[29:28];
 assign tlx_w_rsp_dp      = fifo_wr_rspcnv_dout[31:30];

 // read info
 assign tlx_r_rsp_valid   = fifo_rd_rspcnv_dv && (tlx_r_rsp_afutag != {2'b11, 14'd0});
 assign tlx_r_rsp_afutag  = fifo_rd_rspcnv_dout[15:00];
 assign tlx_r_rsp_opcode  = fifo_rd_rspcnv_dout[23:16];
 assign tlx_r_rsp_code    = fifo_rd_rspcnv_dout[27:24];
 assign tlx_r_rsp_dl      = fifo_rd_rspcnv_dout[29:28];
 assign tlx_r_rsp_dp      = fifo_rd_rspcnv_dout[31:30];
 // read data
 assign tlx_r_rdata_o_dv  = fifo_datcnv_o_dv;
 assign tlx_r_rdata_o_bdi = fifo_datcnv_o_dout[512];
 assign tlx_r_rdata_o     = fifo_datcnv_o_dout[511:0];
 assign tlx_r_rdata_e_dv  = fifo_datcnv_e_dv;
 assign tlx_r_rdata_e_bdi = fifo_datcnv_e_dout[512];
 assign tlx_r_rdata_e     = fifo_datcnv_e_dout[511:0];

 // interrupt info
 assign tlx_i_rsp_valid   = fifo_rd_rspcnv_dv && (tlx_r_rsp_afutag == {2'b11, 14'd0});
 assign tlx_i_rsp_afutag  = fifo_rd_rspcnv_dout[15:00];
 assign tlx_i_rsp_opcode  = fifo_rd_rspcnv_dout[23:16];
 assign tlx_i_rsp_code    = fifo_rd_rspcnv_dout[27:24];




//=================================================================================================================
// STATUS output for SNAP registers
//=================================================================================================================

 reg [31:0] rsp_idle_cnt;
 reg        rsp_idle;
 reg [31:0] rsp_idle_lim;

//---- DEBUG registers ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     rsp_idle <= 1'b0;
   else if(tlx_afu_resp_valid)
     rsp_idle <= 1'b0;
   else if(rsp_idle_cnt == rsp_idle_lim)
     rsp_idle <= 1'b1;

 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     rsp_idle_cnt <= 32'd0;
   else if(tlx_afu_resp_valid)
     rsp_idle_cnt <= 32'd0;
   else 
     rsp_idle_cnt <= rsp_idle_cnt + 32'd1;

 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     rsp_idle_lim <= 32'd0;
   else
     rsp_idle_lim <= debug_tlx_rsp_idle_lim;

 always@(posedge clk_afu or negedge rst_n)
   if(~rst_n) 
     debug_tlx_rsp_idle <= 1'b0;
   else
     debug_tlx_rsp_idle <= rsp_idle;


//---- FAULT ISOLATION REGISTER ----
 reg fir_fifo_rd_rspcnv_overflow;
 reg fir_fifo_wr_rspcnv_overflow;
 reg fir_fifo_dpdl_o_overflow; 
 reg fir_fifo_dpdl_e_overflow; 
 reg fir_fifo_datcnv_o_overflow;
 reg fir_fifo_datcnv_e_overflow;
 reg fir_tlx_rsp_deficient_or_delayed;

 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       fir_fifo_rd_rspcnv_overflow <= 1'b0; 
       fir_fifo_wr_rspcnv_overflow <= 1'b0; 
       fir_fifo_dpdl_o_overflow <= 1'b0; 
       fir_fifo_dpdl_e_overflow <= 1'b0; 
       fir_fifo_datcnv_o_overflow <= 1'b0; 
       fir_fifo_datcnv_e_overflow <= 1'b0; 
       fir_tlx_rsp_deficient_or_delayed <= 1'b0; 
     end
   else
     begin
       if (fifo_rd_rspcnv_ovfl) fir_fifo_rd_rspcnv_overflow <= 1'b1; 
       if (fifo_wr_rspcnv_ovfl) fir_fifo_wr_rspcnv_overflow <= 1'b1; 
       if (fifo_dpdl_o_ovfl) fir_fifo_dpdl_o_overflow <= 1'b1; 
       if (fifo_dpdl_e_ovfl) fir_fifo_dpdl_e_overflow <= 1'b1; 
       if (fifo_datcnv_o_ovfl) fir_fifo_datcnv_o_overflow <= 1'b1; 
       if (fifo_datcnv_e_ovfl) fir_fifo_datcnv_e_overflow <= 1'b1; 
       if (rdata_valid) 
         begin
           if (~(fifo_dpdl_e_dv || fifo_dpdl_o_dv))
             fir_tlx_rsp_deficient_or_delayed <= 1'b1; 
         end
     end

 always@(posedge clk_afu or negedge rst_n)
   if(~rst_n) 
     begin
       fir_fifo_overflow <= 6'd0;
       fir_tlx_rsp_err   <= 1'b0;
     end
   else
     begin
       fir_fifo_overflow <= { fir_fifo_rd_rspcnv_overflow, fir_fifo_wr_rspcnv_overflow, fir_fifo_dpdl_o_overflow, fir_fifo_dpdl_e_overflow, fir_fifo_datcnv_o_overflow, fir_fifo_datcnv_e_overflow };
       fir_tlx_rsp_err   <= fir_tlx_rsp_deficient_or_delayed;
     end

 wire check_dpdl;
 wire clk_check;
 assign check_dpdl = fifo_dpdl_e_dv || fifo_dpdl_o_dv;
 assign clk_check  = clk_check && clk_tlx;
//==== PSL ASSERTION ==============================================================================
 // psl DPDL_FIFO_UNDERFLOW : assert never (fifo_dpdl_o_udfl | fifo_dpdl_e_udfl) @(posedge clk_tlx) report "dpdl FIFO underflow! dpdl FIFOs are used to store response information of dp and dl, which comes earlier than response data. So when response data arrives to read dpdl FIFOs, either of them are expeced to be empty.";
 
 // psl DL_IN_PAIR : assert always (((rdata_dl == 2'b10) && (rdata_dp == 2'b00)) -> next ((rdata_dl == 2'b10) && (rdata_dp == 2'b01))) @(posedge clk_check) report "the sequence of dp for dl=2 should always be dp=00 -> dp=01! Assertion fires under the following circumstances: 1) dl=1 -> dl=2,dp=1; 2) dl=2,dp=0 -> dl=1.";
 
 // psl DL_IN_ERROR : assert never {(rdata_dl == 2'b01); ((rdata_dl == 2'b10) && (rdata_dp == 2'b01))} @(posedge clk_check) report "the sequence of dp for dl=2 should always be dp=00 -> dp=01! Assertion fires under the following circumstances: 1. dl=1 -> dl=2,dp=1; 2. dl=2,dp=0 -> dl=1.";
//==== PSL ASSERTION ==============================================================================

//==== PSL COVERAGE ==============================================================================
 // psl RSP_FIFO_ALMOST_FULL : cover {(fifo_rd_rspcnv_wrcnt[4] || fifo_wr_rspcnv_wrcnt[4] || (fifo_datcnv_o_wrcnt > 4'd5))} @(posedge clk_tlx) ;
//==== PSL COVERAGE ==============================================================================

endmodule
