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

module axi_lite_global_slave #(
    parameter KERNEL_NUM = 8,
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32
)(
                      input             clk                   ,
                      input             rst_n                 ,

                      //---- AXI Lite bus----
                        // AXI write address channel
                      output reg        s_axi_awready         ,
                      input      [ADDR_WIDTH - 1:0] s_axi_awaddr          ,
                      input      [02:0] s_axi_awprot          ,
                      input             s_axi_awvalid         ,
                        // axi write data channel
                      output reg        s_axi_wready          ,
                      input      [DATA_WIDTH - 1:0] s_axi_wdata           ,
                      input      [(DATA_WIDTH/8) - 1:0] s_axi_wstrb           ,
                      input             s_axi_wvalid          ,
                        // AXI response channel
                      output     [01:0] s_axi_bresp           ,
                      output reg        s_axi_bvalid          ,
                      input             s_axi_bready          ,
                        // AXI read address channel
                      output reg        s_axi_arready         ,
                      input             s_axi_arvalid         ,
                      input      [ADDR_WIDTH - 1:0] s_axi_araddr          ,
                      input      [02:0] s_axi_arprot          ,
                        // AXI read data channel
                      output reg [DATA_WIDTH - 1:0] s_axi_rdata           ,
                      output     [01:0] s_axi_rresp           ,
                      input             s_axi_rready          ,
                      output reg        s_axi_rvalid          ,
                      //---- local control ----
                      output            manager_start         ,
                      output            run_mode              ,
                      output     [63:0] init_addr             ,
                      output     [63:0] completion_addr       ,
                      output     [31:0] completion_size       ,
                      output            new_job               ,
                      output            job_done              ,
                      input             job_start             ,
                      output reg        real_done             ,
                      input      [31:0] i_action_type         ,
                      input      [31:0] i_action_version      ,
                      output reg [KERNEL_NUM-1:0]       kernel_start,
                      input      [KERNEL_NUM-1:0]       kernel_complete,
                      output     [KERNEL_NUM-1:0]       kernel_complete_posedge,
                      output     o_interrupt                  ,
                      input      i_interrupt_ack
                      );


//---- declarations ----
// For 32bit write data.
 reg [31:0] write_address;
 wire[31:0] wr_mask;

 wire [31:0] write_data_interrupt_control;
 //wire [31:0] write_data_interrupt_mask;
 wire [31:0] REG_interrupt_mask_rd;
 wire [31:0] REG_interrupt_control_rd;

 reg [31:0] completion_q;
 reg [KERNEL_NUM-1:0] kernel_complete_prev;
 reg [KERNEL_NUM-1:0] pending_completed_kernels;
 reg interrupt_req_reg;
 reg interrupt_wait_soft_clear;
 reg [KERNEL_NUM-1:0] kernel_busy;
 ///////////////////////////////////////////////////
 //***********************************************//
 //>                REGISTERS                    <//
 //***********************************************//
 //                                               //
 /**/   reg [31:0] REG_interrupt_control     ;  /*W1C*/
 /**/   reg [31:0] REG_interrupt_mask        ;  /*RO*/
 /**/   reg [31:0] REG_global_control        ;  /*RW*/
 /**/   reg [31:0] REG_init_addr_hi          ;  /*RW*/
 /**/   reg [31:0] REG_init_addr_lo          ;  /*RW*/
 /**/   reg [31:0] REG_completion_addr_hi    ;  /*RW*/
 /**/   reg [31:0] REG_completion_addr_lo    ;  /*RW*/
 /**/   reg [31:0] REG_completion_size       ;  /*RW*/
 //                                               //
 //-----------------------------------------------//
 //                                               //
 ///////////////////////////////////////////////////

 reg [31:0] cnt0;
 reg [31:0] cnt1;
 reg [31:0] cnt2;
 reg [31:0] cnt3;
 reg [31:0] cnt4;
 reg [31:0] cnt5;
 reg [31:0] cnt6;
 reg [31:0] cnt7;
 reg        job_done_r;

//---- parameters ----
 // Register addresses arrangement
 parameter ADDR_GLOBAL_INTR_CONTROL          = 32'h30,
           ADDR_GLOBAL_INTR_MASK             = 32'h34,
           ADDR_GLOBAL_CONTROL               = 32'h38,
           ADDR_INIT_ADDR_HI                 = 32'h3C,
           ADDR_INIT_ADDR_LO                 = 32'h40,
           ADDR_GLOBAL_DONE                  = 32'h44,
           ADDR_KERNEL0_CNT                  = 32'h48,
           ADDR_KERNEL1_CNT                  = 32'h4C,
           ADDR_KERNEL2_CNT                  = 32'h50,
           ADDR_KERNEL3_CNT                  = 32'h54,
           ADDR_KERNEL4_CNT                  = 32'h58,
           ADDR_KERNEL5_CNT                  = 32'h5C,
           ADDR_KERNEL6_CNT                  = 32'h60,
           ADDR_KERNEL7_CNT                  = 32'h64,
           ADDR_CMPL_ADDR_HI                 = 32'h68,
           ADDR_CMPL_ADDR_LO                 = 32'h6C,
           ADDR_CMPL_SIZE                    = 32'h70,
           ADDR_SNAP_ACTION_TYPE             = 32'h10,
           ADDR_SNAP_ACTION_VERSION          = 32'h14;

/***********************************************************************
*                          interrupt generation                        *
***********************************************************************/
genvar i;
generate
  for (i = 0; i < KERNEL_NUM; i = i + 1) begin:kernel_complete_posedge_gen
    assign kernel_complete_posedge[i] = (kernel_complete_prev[i] == 0) & (kernel_complete[i] == 1);
  end
endgenerate

 //assign o_interrupt = |REG_interrupt_mask;
 assign o_interrupt = interrupt_req_reg;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) begin
     interrupt_req_reg <= 1'b0;
     interrupt_wait_soft_clear <= 1'b0;
   end
   else begin
     // Interrupt acknowledged, clear the interrupt request
     if (i_interrupt_ack == 1'b1) begin
       interrupt_req_reg <= 1'b0;
       interrupt_wait_soft_clear <= 1'b1;
     end
     else if ((interrupt_wait_soft_clear == 1'b1) & (REG_interrupt_mask[KERNEL_NUM-1:0] == {KERNEL_NUM{1'b0}})) begin
       interrupt_wait_soft_clear <= 1'b0;
     end
     else if (interrupt_wait_soft_clear == 1'b0) begin
       interrupt_req_reg <= |REG_interrupt_mask;
     end
     else begin
       interrupt_req_reg <= interrupt_req_reg;
       interrupt_wait_soft_clear <= interrupt_wait_soft_clear;
     end
   end

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     kernel_complete_prev <= {KERNEL_NUM{1'b1}};
   else
     kernel_complete_prev <= kernel_complete;

 always@(posedge clk or negedge rst_n)
    if(!rst_n)
        job_done_r <= 1'b0;
    else
        job_done_r <= job_done;

 always@(posedge clk or negedge rst_n)
    if(!rst_n)
        real_done <= 1'b0;
    else if(manager_start)
        real_done <= 1'b0;
    else if(job_done & !job_done_r)
        real_done <= 1'b1;

 always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt0 <= 32'b0;
    else if(manager_start)
        cnt0 <= 32'b0;
    else if(kernel_complete_posedge[0])
        cnt0 <= cnt0 + 1'b1;

 always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt1 <= 32'b0;
    else if(manager_start)
        cnt1 <= 32'b0;
    else if(kernel_complete_posedge[1])
        cnt1 <= cnt1 + 1'b1;

 always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt2 <= 32'b0;
    else if(manager_start)
        cnt2 <= 32'b0;
    else if(kernel_complete_posedge[2])
        cnt2 <= cnt2 + 1'b1;

 always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt3 <= 32'b0;
    else if(manager_start)
        cnt3 <= 32'b0;
    else if(kernel_complete_posedge[3])
        cnt3 <= cnt3 + 1'b1;

 always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt4 <= 32'b0;
    else if(manager_start)
        cnt4 <= 32'b0;
    else if(kernel_complete_posedge[4])
        cnt4 <= cnt4 + 1'b1;

 always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt5 <= 32'b0;
    else if(manager_start)
        cnt5 <= 32'b0;
    else if(kernel_complete_posedge[5])
        cnt5 <= cnt5 + 1'b1;

 always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt6 <= 32'b0;
    else if(manager_start)
        cnt6 <= 32'b0;
    else if(kernel_complete_posedge[6])
        cnt6 <= cnt6 + 1'b1;

 always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt7 <= 32'b0;
    else if(manager_start)
        cnt7 <= 32'b0;
    else if(kernel_complete_posedge[7])
        cnt7 <= cnt7 + 1'b1;

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     REG_interrupt_mask <= 32'b0;
   else begin
     if ((REG_interrupt_mask[KERNEL_NUM-1:0] == {KERNEL_NUM{1'b0}}) & ~(s_axi_wvalid & s_axi_wready)) begin
       REG_interrupt_mask[KERNEL_NUM-1:0] <= pending_completed_kernels;
     end
     else if (s_axi_wvalid & s_axi_wready) begin
       case(write_address)
         ADDR_GLOBAL_INTR_CONTROL       : begin
           REG_interrupt_mask <= REG_interrupt_mask & ~write_data_interrupt_control;
         end
         default :;
       endcase
     end
     else begin
       REG_interrupt_mask <= REG_interrupt_mask;
     end
   end

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     pending_completed_kernels <= {KERNEL_NUM{1'b0}};
   else begin
     pending_completed_kernels <= (pending_completed_kernels | kernel_complete_posedge) & ~REG_interrupt_mask[KERNEL_NUM-1:0];
   end

/***********************************************************************
*                          writing registers                           *
***********************************************************************/

//---- write address capture ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     write_address <= 32'd0;
   else if(s_axi_awvalid & s_axi_awready)
     write_address <= s_axi_awaddr;

//---- write address ready ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_awready <= 1'b0;
   else if(s_axi_awvalid)
     s_axi_awready <= 1'b1;
   else if(s_axi_wvalid & s_axi_wready)
     s_axi_awready <= 1'b0;

//---- write data ready ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_wready <= 1'b0;
   else if(s_axi_awvalid & s_axi_awready)
     s_axi_wready <= 1'b1;
   else if(s_axi_wvalid)
     s_axi_wready <= 1'b0;

//---- handle write data strobe ----
 assign wr_mask = {{8{s_axi_wstrb[3]}},{8{s_axi_wstrb[2]}},{8{s_axi_wstrb[1]}},{8{s_axi_wstrb[0]}}};

 assign write_data_interrupt_control            = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_interrupt_control)};
 //assign write_data_interrupt_mask               = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_interrupt_mask)};

//---- registers behaviour ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       REG_interrupt_control     <= 32'd0;
       //REG_interrupt_mask        <= 32'd0;
     end
   else if(s_axi_wvalid & s_axi_wready)
     case(write_address)
       ADDR_GLOBAL_INTR_CONTROL       : begin
         REG_interrupt_control <= write_data_interrupt_control;
       end
       //ADDR_GLOBAL_INTR_MASK          : REG_interrupt_mask    <= write_data_interrupt_mask;

       default :;
     endcase

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        completion_q <= 0;
    end
end

/***********************************************************************
*                       reading registers                              *
***********************************************************************/

assign REG_interrupt_control_rd = REG_interrupt_control;
assign REG_interrupt_mask_rd = REG_interrupt_mask;

//---- read registers ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_rdata <= 32'd0;
   else if(s_axi_arvalid & s_axi_arready)
     case(s_axi_araddr)
       ADDR_GLOBAL_INTR_CONTROL  : s_axi_rdata <= REG_interrupt_control_rd;
       ADDR_GLOBAL_INTR_MASK     : s_axi_rdata <= REG_interrupt_mask_rd;
       ADDR_SNAP_ACTION_TYPE     : s_axi_rdata <= i_action_type;
       ADDR_SNAP_ACTION_VERSION  : s_axi_rdata <= i_action_version;
       ADDR_GLOBAL_CONTROL       : s_axi_rdata <= REG_global_control;
       ADDR_INIT_ADDR_HI         : s_axi_rdata <= REG_init_addr_hi;
       ADDR_INIT_ADDR_LO         : s_axi_rdata <= REG_init_addr_lo;
       ADDR_GLOBAL_DONE          : s_axi_rdata <= {31'b0,real_done};
       ADDR_CMPL_ADDR_HI         : s_axi_rdata <= REG_completion_addr_hi;
       ADDR_CMPL_ADDR_LO         : s_axi_rdata <= REG_completion_addr_lo;
       ADDR_CMPL_SIZE            : s_axi_rdata <= REG_completion_size;
       ADDR_KERNEL0_CNT          : s_axi_rdata <= cnt0;
       ADDR_KERNEL1_CNT          : s_axi_rdata <= cnt1;
       ADDR_KERNEL2_CNT          : s_axi_rdata <= cnt2;
       ADDR_KERNEL3_CNT          : s_axi_rdata <= cnt3;
       ADDR_KERNEL4_CNT          : s_axi_rdata <= cnt4;
       ADDR_KERNEL5_CNT          : s_axi_rdata <= cnt5;
       ADDR_KERNEL6_CNT          : s_axi_rdata <= cnt6;
       ADDR_KERNEL7_CNT          : s_axi_rdata <= cnt7;
       default                   : s_axi_rdata <= 32'h5a5aa5a5;
     endcase

//---- address ready: deasserts once arvalid is seen; reasserts when current read is done ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_arready <= 1'b1;
   else if(s_axi_arvalid)
     s_axi_arready <= 1'b0;
   else if(s_axi_rvalid & s_axi_rready)
     s_axi_arready <= 1'b1;

//---- data ready: deasserts once rvalid is seen; reasserts when new address has come ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_rvalid <= 1'b0;
   else if (s_axi_arvalid & s_axi_arready)
     s_axi_rvalid <= 1'b1;
   else if (s_axi_rready)
     s_axi_rvalid <= 1'b0;

/***********************************************************************
*                        status reporting                              *
***********************************************************************/

//---- axi write response ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_bvalid <= 1'b0;
   else if(s_axi_wvalid & s_axi_wready)
     s_axi_bvalid <= 1'b1;
   else if(s_axi_bready)
     s_axi_bvalid <= 1'b0;

 assign s_axi_bresp = 2'd0;

//---- axi read response ----
 assign s_axi_rresp = 2'd0;

/***********************************************************************
*                        control                                       *
***********************************************************************/

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        REG_completion_size <= 32'b0;
    else if(s_axi_wvalid & s_axi_wready & (write_address == ADDR_CMPL_SIZE))
        REG_completion_size <= s_axi_wdata;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        REG_completion_addr_hi <= 32'b0;
    else if(s_axi_wvalid & s_axi_wready & (write_address == ADDR_CMPL_ADDR_HI))
        REG_completion_addr_hi <= s_axi_wdata;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        REG_completion_addr_lo <= 32'b0;
    else if(s_axi_wvalid & s_axi_wready & (write_address == ADDR_CMPL_ADDR_LO))
        REG_completion_addr_lo <= s_axi_wdata;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        REG_init_addr_lo <= 32'b0;
    else if(s_axi_wvalid & s_axi_wready & (write_address == ADDR_INIT_ADDR_LO))
        REG_init_addr_lo <= s_axi_wdata;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        REG_init_addr_hi <= 32'b0;
    else if(s_axi_wvalid & s_axi_wready & (write_address == ADDR_INIT_ADDR_HI))
        REG_init_addr_hi <= s_axi_wdata;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        REG_global_control <= 32'b0;
    else if(s_axi_wvalid & s_axi_wready & (write_address == ADDR_GLOBAL_CONTROL))
        REG_global_control <= s_axi_wdata;

assign manager_start = REG_global_control[0];
assign run_mode = REG_global_control[8];
assign init_addr = {REG_init_addr_hi,REG_init_addr_lo};
assign completion_addr = {REG_completion_addr_hi,REG_completion_addr_lo};
assign completion_size = REG_completion_size;
assign new_job = !(&kernel_busy);
assign job_done = !(|kernel_busy);

genvar j;
generate
  for (j = 0; j < KERNEL_NUM; j = j + 1) begin:kernel_busy_gen
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            kernel_busy[j] <= 1'b0;
        else if(kernel_start[j] == 1'b1)
            kernel_busy[j] <= 1'b1;
        else if(kernel_complete_posedge[j] == 1'b1)
            kernel_busy[j] <= 1'b0;
  end
endgenerate

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        kernel_start <= 8'b0;
    else if(job_start) begin
        casex(kernel_busy)
            8'b0xxxxxxx: kernel_start <= 8'b10000000;
            8'b10xxxxxx: kernel_start <= 8'b01000000;
            8'b110xxxxx: kernel_start <= 8'b00100000;
            8'b1110xxxx: kernel_start <= 8'b00010000;
            8'b11110xxx: kernel_start <= 8'b00001000;
            8'b111110xx: kernel_start <= 8'b00000100;
            8'b1111110x: kernel_start <= 8'b00000010;
            8'b11111110: kernel_start <= 8'b00000001;
            default:     kernel_start <= 8'b00000000;
        endcase
        end
    else
        kernel_start <= 8'b00000000;

endmodule
