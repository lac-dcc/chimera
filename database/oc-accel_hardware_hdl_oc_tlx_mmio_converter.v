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

module tlx_mmio_converter (
                           input                  clk_tlx                          ,
                           input                  clk_afu                          ,
                           input                  rst_n                            ,
                                        
                           //---- configuration ------------------------------------
                           input           [63:0] cfg_f1_mmio_bar0                 ,
                           input           [63:0] cfg_f1_mmio_bar0_mask            ,
                                        
                           //---- TL CAPP command ----------------------------------
                           input                  tlx_afu_cmd_valid                ,
                           input            [7:0] tlx_afu_cmd_opcode               ,
                           input           [15:0] tlx_afu_cmd_capptag              ,
                           input            [1:0] tlx_afu_cmd_dl                   ,
                           input            [2:0] tlx_afu_cmd_pl                   ,
                           input           [63:0] tlx_afu_cmd_be                   , // not supported
                           input                  tlx_afu_cmd_end                  , // not supported
                           input           [63:0] tlx_afu_cmd_pa                   ,
                           input            [3:0] tlx_afu_cmd_flag                 , // not supported
                           input                  tlx_afu_cmd_os                   , // not supported
                                        
                           output                 afu_tlx_cmd_credit               ,
                           output           [6:0] afu_tlx_cmd_initial_credit       ,

                           output reg             afu_tlx_cmd_rd_req               ,
                           output           [2:0] afu_tlx_cmd_rd_cnt               ,

                           input                  tlx_afu_cmd_data_valid           ,
                           input                  tlx_afu_cmd_data_bdi             ,
                           input          [511:0] tlx_afu_cmd_data_bus             ,

                           //---- TL CAPP response ---------------------------------
                           output reg             afu_tlx_resp_valid               ,
                           output reg       [7:0] afu_tlx_resp_opcode              ,
                           output           [1:0] afu_tlx_resp_dl                  ,
                           output          [15:0] afu_tlx_resp_capptag             ,
                           output           [1:0] afu_tlx_resp_dp                  ,
                           output reg       [3:0] afu_tlx_resp_code                ,

                           output                 afu_tlx_rdata_valid              ,
                           output                 afu_tlx_rdata_bdi                ,
                           output reg     [511:0] afu_tlx_rdata_bus                ,

                           input                  tlx_afu_resp_credit              ,
                           input                  tlx_afu_resp_data_credit         ,
                           input            [3:0] tlx_afu_resp_initial_credit      ,
                           input            [5:0] tlx_afu_resp_data_initial_credit ,

                           //---- MMIO side interface ------------------------------
                           output                 mmio_wr                          ,
                           output                 mmio_rd                          ,
                           output                 mmio_dw                          ,
                           output         [31:0]  mmio_addr                        ,
                           output         [63:0]  mmio_din                         ,
                           input          [63:0]  mmio_dout                        ,
                           input                  mmio_done                        ,                       
                           input                  mmio_failed                                             
                           );


 reg [07:00] cmd_opcode;
 reg [15:00] cmd_capptag;
 reg [01:00] cmd_dl;
 reg [02:00] cmd_pl;
 reg [63:00] cmd_addr;
 wire        cmd_wr;
 wire        cmd_rd;
 wire        cmd_dw;
 reg         cmd_valid;
 reg         cmd_data_valid;
 reg [63:00] cmd_data;
 reg         cmd_data_bdi;
 wire        address_in_bar0;
 wire        address_aligned;
 wire        cmd_is_granted;
 wire        cmd_event;
 wire        cmd_incident;
 reg         cmd_req;
 reg         cmd_ack;
 reg [02:00] cmd_ack_pipe;
 reg         cmd_done;
 reg         rsp_ack;
 reg         rsp_req;
 reg [01:00] rsp_req_pipe;
 reg [63:00] rsp_data;
 reg         rsp_pending;
 wire        rsp_valid;
 reg         rsp_failed;
 reg [01:00] rsp_failed_pipe;
 reg [03:00] rsp_credit_cnt;
 reg [05:00] rsp_data_credit_cnt;
 reg         rsp_credit_run_out;
 reg         cmd_req_afu;
 reg [01:00] cmd_req_afu_pipe;
 reg         cmd_wr_afu;
 reg [01:00] cmd_wr_afu_pipe;
 reg         cmd_rd_afu;
 reg [01:00] cmd_rd_afu_pipe;
 reg         cmd_dw_afu;
 reg [01:00] cmd_dw_afu_pipe;
 reg [63:00] cmd_data_afu;
 reg [31:00] cmd_addr_afu;
 reg         cmd_ack_afu;
 reg         rsp_req_afu;
 reg         rsp_failed_afu;
 reg         rsp_ack_afu;
 reg [02:00] rsp_ack_afu_pipe;
 reg [63:00] rsp_data_afu;



 // TL CAPP command opcode
 localparam    [7:0] TLX_AFU_CMD_OPCODE_RETURN_ADR_TAG        = 8'b00011001;  // Return Address Tag
 localparam    [7:0] TLX_AFU_CMD_OPCODE_RD_MEM                = 8'b00100000;  // Read Memory
 localparam    [7:0] TLX_AFU_CMD_OPCODE_PR_RD_MEM             = 8'b00101000;  // Partial Memory Read
 localparam    [7:0] TLX_AFU_CMD_OPCODE_AMO_RD                = 8'b00110000;  // Atomic Memory Operation - Read
 localparam    [7:0] TLX_AFU_CMD_OPCODE_AMO_RW                = 8'b00111000;  // Atomic Memory Operation - Read Write
 localparam    [7:0] TLX_AFU_CMD_OPCODE_AMO_W                 = 8'b01000000;  // Atomic Memory Operation - Write
 localparam    [7:0] TLX_AFU_CMD_OPCODE_WRITE_MEM             = 8'b10000001;  // Write Memory
 localparam    [7:0] TLX_AFU_CMD_OPCODE_WRITE_MEM_BE          = 8'b10000010;  // Byte Enable Memory Write
 localparam    [7:0] TLX_AFU_CMD_OPCODE_PR_WR_MEM             = 8'b10000110;  // Partial Cache Line Memory Write
 localparam    [7:0] TLX_AFU_CMD_OPCODE_FORCE_EVICT           = 8'b11010000;  // Force Eviction
 localparam    [7:0] TLX_AFU_CMD_OPCODE_WAKE_AFU_THREAD       = 8'b11011111;  // Wake AFU Thread
 localparam    [7:0] TLX_AFU_CMD_OPCODE_CONFIG_READ           = 8'b11100000;  // Configuration Read
 localparam    [7:0] TLX_AFU_CMD_OPCODE_CONFIG_WRITE          = 8'b11100001;  // Configuration Write

 // TLX AP response opcode
 localparam    [7:0] AFU_TLX_RESP_OPCODE_NOP                  = 8'b00000000;  // Nop
 localparam    [7:0] AFU_TLX_RESP_OPCODE_MEM_RD_RESPONSE      = 8'b00000001;  // Memory Read Response
 localparam    [7:0] AFU_TLX_RESP_OPCODE_MEM_RD_FAIL          = 8'b00000010;  // Memory Read Failure
 localparam    [7:0] AFU_TLX_RESP_OPCODE_MEM_WR_RESPONSE      = 8'b00000100;  // Memory Write Response
 localparam    [7:0] AFU_TLX_RESP_OPCODE_MEM_WR_FAIL          = 8'b00000101;  // Memory Write Failure
 localparam    [7:0] AFU_TLX_RESP_OPCODE_RETURN_TL_CREDITS    = 8'b00001000;  // Return TL Credits
 localparam    [7:0] AFU_TLX_RESP_OPCODE_WAKE_AFU_RESP        = 8'b00001010;  // Wake AFU Thread Response

 // TLX AP response code
 localparam    [3:0] AFU_TLX_RESP_CODE_NULL                   = 4'b0000;  // Nop
 localparam    [3:0] AFU_TLX_RESP_CODE_RTY_REQ                = 4'b0010;  // Retry request
 localparam    [3:0] AFU_TLX_RESP_CODE_DERROR                 = 4'b1000;  // Data error
 localparam    [3:0] AFU_TLX_RESP_CODE_UOL                    = 4'b1001;  // Unsupported operand length
 localparam    [3:0] AFU_TLX_RESP_CODE_BAD_ADDR               = 4'b1011;  // Bad address specification
 localparam    [3:0] AFU_TLX_RESP_CODE_FAILED                 = 4'b1110;  // The operation has failed and cannot be recovered


//=================================================================================================================
//  TLX TIME DOMAIN
//    Command 
//=================================================================================================================

//---- latch command info at the start ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       cmd_opcode  <= 8'd0;
       cmd_capptag <= 16'd0;
       cmd_dl      <= 2'd0;
       cmd_pl      <= 3'd0;
       cmd_addr    <= 64'd0;
     end
   else if(tlx_afu_cmd_valid)
     begin
       cmd_opcode  <= tlx_afu_cmd_opcode;
       cmd_capptag <= tlx_afu_cmd_capptag;
       cmd_dl      <= tlx_afu_cmd_dl;
       cmd_pl      <= tlx_afu_cmd_pl;
       cmd_addr    <= tlx_afu_cmd_pa;
     end

 assign cmd_wr = (cmd_opcode == TLX_AFU_CMD_OPCODE_PR_WR_MEM);
 assign cmd_rd = (cmd_opcode == TLX_AFU_CMD_OPCODE_PR_RD_MEM);
 assign cmd_dw = (cmd_pl == 3'b011);
     
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       cmd_valid      <= 1'b0;
       cmd_data_valid <= 1'b0;
     end
   else
     begin
       cmd_valid      <= tlx_afu_cmd_valid;
       cmd_data_valid <= tlx_afu_cmd_data_valid;
     end

//---- latch command data at the start ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       cmd_data <= 64'd0;
       cmd_data_bdi <= 1'b0;
     end
   else if(tlx_afu_cmd_data_valid)
     begin
       case(cmd_addr[5:3])
         3'b111 : cmd_data <= tlx_afu_cmd_data_bus[511:448];
         3'b110 : cmd_data <= tlx_afu_cmd_data_bus[447:384];
         3'b101 : cmd_data <= tlx_afu_cmd_data_bus[383:320];
         3'b100 : cmd_data <= tlx_afu_cmd_data_bus[319:256];
         3'b011 : cmd_data <= tlx_afu_cmd_data_bus[255:192];
         3'b010 : cmd_data <= tlx_afu_cmd_data_bus[191:128];
         3'b001 : cmd_data <= tlx_afu_cmd_data_bus[127:064];
         3'b000 : cmd_data <= tlx_afu_cmd_data_bus[063:000];
       endcase

      cmd_data_bdi <= tlx_afu_cmd_data_bdi;
    end

//---- command address shall match BAR0 ----
 assign address_in_bar0 = ((cmd_addr & cfg_f1_mmio_bar0_mask) == cfg_f1_mmio_bar0);

//---- command address shall be 4B or 8B aligned ----
 assign address_aligned = (((cmd_pl == 3'b010) && (cmd_addr [1:0] == 2'b00)) || //4B aligned
                           ((cmd_pl == 3'b011) && (cmd_addr [2:0] == 3'b000))); //8B aligned

//---- commmand is permitted for MMIO access when 1. BAR0 matched; 2. address aligned with 4B or 8B ----
 assign cmd_is_granted = address_in_bar0 && address_aligned;

//---- generate command event to trigger MMIO access when 1. command is granted; 2. command data is not corrupted (write only) ---- 
 assign cmd_event = ((cmd_data_valid && ~cmd_data_bdi) || (cmd_valid && cmd_rd)) && cmd_is_granted;

//---- indicate invalid command incident when 1. command is not granted; 2. command data is corrupted even if command is granted (write only) ----
 assign cmd_incident = (cmd_data_valid && cmd_data_bdi && cmd_is_granted) || (cmd_valid && ~cmd_is_granted);


//------------------------------------------------------------------------------
// command event time domain crossing handshake
//               _
//   cmd_event _/ \__________    :
//                 ______________:_                  TLX domain
//   cmd_req   ___/              : \__
//   ............................................................
//                        _______:__________              AFU 
//   cmd_req_afu ________/       :          \__           domain
//                             __:_________________       dual-FF 
//   cmd_ack_afu _____________/  :                 \__    sync
//                                  _____
//   mmio_wr/rd  __________________/     \________        MMIO access 
//   ............................................................
//                               :_
//   cmd_ack   __________________/ \__________      TLX domain dual-FF sync
//
//------------------------------------------------------------------------------

always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     cmd_req <= 1'b0;
   else if(cmd_event)
     cmd_req <= 1'b1;
   else if(cmd_ack)
     cmd_req <= 1'b0;

 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       { cmd_ack_pipe } <= 3'd0;
     end
   else
     begin
       { cmd_ack_pipe } <= { cmd_ack_pipe , cmd_ack_afu };
     end
       
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     cmd_ack <= 1'b0;
   else
     cmd_ack <= (~cmd_ack_pipe[2] && cmd_ack_pipe[1]);

       
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     cmd_done <= 1'b0;
   else
     cmd_done <= cmd_req && cmd_ack;

//---- request command data immediately after command valid, one 64B each time ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     afu_tlx_cmd_rd_req <= 1'b0;
   else
     afu_tlx_cmd_rd_req <= tlx_afu_cmd_valid && (tlx_afu_cmd_opcode == TLX_AFU_CMD_OPCODE_PR_WR_MEM);

 assign afu_tlx_cmd_rd_cnt[2:0] = 3'b001;   // Supports 4B or 8B only from partial write (Request 64B for partial)

//---- command credit ----
 assign afu_tlx_cmd_initial_credit = 7'd1;
 assign afu_tlx_cmd_credit = afu_tlx_resp_valid;


//=================================================================================================================
//  TLX TIME DOMAIN
//    Response 
//=================================================================================================================

 assign afu_tlx_resp_dl = 2'b01;             // forced 64B for partial commands
 assign afu_tlx_resp_dp = 2'b00;             // forced for partial commands
 assign afu_tlx_resp_capptag = cmd_capptag;  // reflect command tag
 assign afu_tlx_rdata_valid = afu_tlx_resp_valid && cmd_rd && (afu_tlx_resp_opcode == AFU_TLX_RESP_OPCODE_MEM_RD_RESPONSE);
 assign afu_tlx_rdata_bdi = 1'b0;

//---- response request pipeline, acknowledge and data ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       { rsp_ack, rsp_req , rsp_req_pipe } <= 4'd0;
       { rsp_failed , rsp_failed_pipe }    <= 3'd0;

       rsp_data <= 64'd0;
     end
   else
     begin
       { rsp_ack, rsp_req , rsp_req_pipe } <= { rsp_req, rsp_req_pipe , rsp_req_afu };
       { rsp_failed , rsp_failed_pipe }    <= { rsp_failed_pipe , rsp_failed_afu };

       rsp_data <= rsp_data_afu;
     end
       
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     rsp_pending <= 1'b0;
   else if(~rsp_ack && rsp_req)
     rsp_pending <= 1'b1;
   else if(~rsp_credit_run_out)
     rsp_pending <= 1'b0;

 assign rsp_valid = rsp_pending && ~rsp_credit_run_out;

//---- assert response valid when command not viable or response returned from MMIO ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     afu_tlx_resp_valid <= 1'b0;
   else
     afu_tlx_resp_valid <= cmd_incident || rsp_valid;

//---- return response opcode and code ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     begin
       afu_tlx_resp_opcode <= AFU_TLX_RESP_OPCODE_NOP;
       afu_tlx_resp_code   <= AFU_TLX_RESP_CODE_NULL;
     end
   else if(~cmd_is_granted)     // when command information not viable for MMIO access
     begin
       afu_tlx_resp_opcode <= (cmd_wr)? AFU_TLX_RESP_OPCODE_MEM_WR_FAIL : AFU_TLX_RESP_OPCODE_MEM_RD_FAIL;
       afu_tlx_resp_code   <= AFU_TLX_RESP_CODE_BAD_ADDR;
     end
   else if(cmd_data_bdi)  // when command data corrupted
     begin
       afu_tlx_resp_opcode <= AFU_TLX_RESP_OPCODE_MEM_WR_FAIL;
       afu_tlx_resp_code   <= AFU_TLX_RESP_CODE_DERROR;
     end
   else if(rsp_failed)         // when MMIO read/write failed
     begin
       afu_tlx_resp_opcode <= (cmd_wr)? AFU_TLX_RESP_OPCODE_MEM_WR_FAIL : AFU_TLX_RESP_OPCODE_MEM_RD_FAIL;
       afu_tlx_resp_code   <= AFU_TLX_RESP_CODE_FAILED;
     end
   else                        // otherwise MMIO read/write done
     begin
       afu_tlx_resp_opcode <= (cmd_wr)? AFU_TLX_RESP_OPCODE_MEM_WR_RESPONSE : AFU_TLX_RESP_OPCODE_MEM_RD_RESPONSE;
       afu_tlx_resp_code   <= AFU_TLX_RESP_CODE_NULL;
     end

//---- response data ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n) 
     afu_tlx_rdata_bus <= 512'd0;
   else 
     case(cmd_addr[5:3])
       3'b000: afu_tlx_rdata_bus <= {448'h0, rsp_data_afu[63:0]};
       3'b001: afu_tlx_rdata_bus <= {384'h0, rsp_data_afu[63:0], 64'h0};
       3'b010: afu_tlx_rdata_bus <= {320'h0, rsp_data_afu[63:0], 128'h0};
       3'b011: afu_tlx_rdata_bus <= {256'h0, rsp_data_afu[63:0], 192'h0};
       3'b100: afu_tlx_rdata_bus <= {192'h0, rsp_data_afu[63:0], 256'h0};
       3'b101: afu_tlx_rdata_bus <= {128'h0, rsp_data_afu[63:0], 320'h0};
       3'b110: afu_tlx_rdata_bus <= {064'h0, rsp_data_afu[63:0], 384'h0};
       3'b111: afu_tlx_rdata_bus <= {rsp_data_afu[63:0], 448'h0};
     endcase

//---- credit management ----
 always@(posedge clk_tlx)
   if(~rst_n) 
     rsp_credit_cnt <= tlx_afu_resp_initial_credit;   // this should be set through soft resetting 
   else
     case({tlx_afu_resp_credit, afu_tlx_resp_valid})
       2'b10 : rsp_credit_cnt <= rsp_credit_cnt + 4'd1;
       2'b01 : rsp_credit_cnt <= rsp_credit_cnt - 4'd1;
       default:;
     endcase

 always@(posedge clk_tlx)
   if(~rst_n) 
     rsp_data_credit_cnt <= tlx_afu_resp_data_initial_credit;
   else
     case({tlx_afu_resp_data_credit, afu_tlx_rdata_valid})
       2'b10 : rsp_data_credit_cnt <= rsp_data_credit_cnt + 6'd1;
       2'b01 : rsp_data_credit_cnt <= rsp_data_credit_cnt - 6'd1;
       default:;
     endcase

//---- credit deficiency alert ----
 always@(posedge clk_tlx or negedge rst_n)
   if(~rst_n)
     rsp_credit_run_out <= 1'b0;
   else 
     rsp_credit_run_out <= (rsp_credit_cnt == 4'd0) || (rsp_data_credit_cnt == 6'd0);


//=================================================================================================================
//  AFU TIME DOMAIN
//    Command
//=================================================================================================================

//---- command request pipeline, acknowledge, data and address ----
 always@(posedge clk_afu or negedge rst_n)
   if(~rst_n) 
     begin
       { cmd_req_afu , cmd_req_afu_pipe } <= 3'd0;
       { cmd_wr_afu  , cmd_wr_afu_pipe  } <= 3'd0;
       { cmd_rd_afu  , cmd_rd_afu_pipe  } <= 3'd0;
       { cmd_dw_afu  , cmd_dw_afu_pipe  } <= 3'd0;

       cmd_data_afu <= 64'd0;
       cmd_addr_afu <= 32'd0;

       cmd_ack_afu <= 1'd0;
     end
   else
     begin
       { cmd_req_afu , cmd_req_afu_pipe } <= { cmd_req_afu_pipe , cmd_req };
       { cmd_wr_afu  , cmd_wr_afu_pipe  } <= { cmd_wr_afu_pipe  , cmd_wr  };
       { cmd_rd_afu  , cmd_rd_afu_pipe  } <= { cmd_rd_afu_pipe  , cmd_rd  };
       { cmd_dw_afu  , cmd_dw_afu_pipe  } <= { cmd_dw_afu_pipe  , cmd_dw  };

       cmd_data_afu <=  cmd_data;
       cmd_addr_afu <=  cmd_addr;

       cmd_ack_afu <= cmd_req_afu;
     end
       
//---- MMIO access event generation ----
 assign mmio_wr = ~cmd_ack_afu && cmd_req_afu && cmd_wr_afu;
 assign mmio_rd = ~cmd_ack_afu && cmd_req_afu && cmd_rd_afu;
 assign mmio_dw = ~cmd_ack_afu && cmd_req_afu && cmd_dw_afu;
 assign mmio_din = cmd_data_afu;
 assign mmio_addr = cmd_addr_afu;


//=================================================================================================================
//  AFU TIME DOMAIN
//    Response
//=================================================================================================================

//------------------------------------------------------------------------------
// response event time domain crossing handshake
//                        ____
//   mmio_done/failed   _/    \__________ :             AFU domain
//                             ___________:____
//   rsp_req_afu           ___/           :    \__
//   .....................................:......................
//                                ________:__________         TLX 
//   rsp_req               ______/        :          \__      domain
//                                 _______:____________       dual-FF 
//   rsp_ack         _____________/       :            \__    sync
//                                 _      :
//   rsp_valid                  __/ \___  :
//   .....................................:......................
//                                        :_____________________
//   rsp_ack_afu        __________________/                     \_   AFU domain
//
//------------------------------------------------------------------------------

 always@(posedge clk_afu or negedge rst_n)
   if(~rst_n) 
     rsp_req_afu <= 1'b0;
   else if(rsp_ack_afu)
     rsp_req_afu <= 1'b0;
   else if(mmio_done || mmio_failed)
     rsp_req_afu <= 1'b1;

 always@(posedge clk_afu or negedge rst_n)
   if(~rst_n) 
     rsp_failed_afu <= 1'b0;
   else if(rsp_ack_afu)
     rsp_failed_afu <= 1'b0;
   else if(mmio_failed)
     rsp_failed_afu <= 1'b1;

 always@(posedge clk_afu or negedge rst_n)
   if(~rst_n) 
     { rsp_ack_afu_pipe } <= 3'd0;
   else
     { rsp_ack_afu_pipe } <= { rsp_ack_afu_pipe , rsp_ack };

 always@(posedge clk_afu or negedge rst_n)
   if(~rst_n) 
     rsp_ack_afu <= 1'b0;
   else
     rsp_ack_afu <= (~rsp_ack_afu_pipe[2] && rsp_ack_afu_pipe[1]);

 always@(posedge clk_afu or negedge rst_n)
   if(~rst_n) 
     rsp_data_afu <= 64'd0;
   else if(mmio_done)
     rsp_data_afu <= mmio_dout;


endmodule
