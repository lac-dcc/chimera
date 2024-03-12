////////////////////////////////////////////////////////////////////////////////////////////////////
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
// 02111-1307, USA.
//
// ©2013 - Roman Ovseitsev <romovs@gmail.com>
////////////////////////////////////////////////////////////////////////////////////////////////////

//##################################################################################################
//
// OmniVision Camera setup module. Configured to initialize OV7670 model.
//
// Initializes camera module using register set defined in OV7670Init and once done raises 
// done_o signal.
//
// Other camera models require modification of register set and timing parameters.
// After a hardware reset delay for 1ms prior to raising rst_n.
// External pull-up register (4.7k should be enough) is required on SIOD line. FPGA`s internal 
// pull-ups may not be sufficient.
//
//##################################################################################################

`timescale 1ns / 1ps
`include "macros.vh"

module CamSetup (
    
    input       clk,                  // Main clock.
    input       rst_n,                  // 0 - reset.
    
    //Camera reg read/write cmd,
    input [16:0] rw_cmd,            //{rw, rw_addr[7:0], rw_data7:0
    input       rw_cmd_valid,
    output reg     rw_cmd_ready,

    output [31:0] debug,

    //camera reg resonse
    output [16:0] rw_resp,
    output reg     rw_resp_valid,
    output      sioc_o,                 // Camera's SIOC.
    inout       siod_io                // Camera's SIOD. Should have a pullup resistor.
);

    `include "math.v" 
    parameter   IN_FREQ = 100_000_000;   // clk frequency in Hz.
    parameter   CAM_ID = 8'h42;         // OV7670 ID. Bit 0 is Don't Care since we specify r/w op in register lookup table.

    
    localparam  SCCB_FREQ = 100_000;    // SCCB frequency in Hz.
    localparam  T_SREG = 300;           // Register setup time in ms. 300ms for OV7670.
 
    localparam  integer SREG_CYCLES = (IN_FREQ/1000)*T_SREG;   
    localparam  SCCB_PERIOD = IN_FREQ/SCCB_FREQ/2;
                
    reg         [clog2(SCCB_PERIOD):0] sccb_clk_cnt;
    reg         sccb_clk;
    wire        [7:0] reg_data_rcvd;
    reg         sccb_start;
    wire        transact_done;
    reg         [clog2(SREG_CYCLES):0] reg_setup_cnt;
    reg         [clog2(SREG_CYCLES):0] reg_setup_cnt_nxt;
    wire        data_pulse;
   
    reg [7:0] rw_addr;
    reg [7:0] rw_data;
    reg         rw; // (0: read, 1: writea)
    wire delay_cmd;
    assign delay_cmd = (rw==1 && rw_addr==8'hF0 && rw_data==8'hF0);
   
    assign  data_pulse = (sccb_clk_cnt == SCCB_PERIOD/2 && sccb_clk == 0); 

    always @(posedge clk) begin
        if(rw_cmd_valid && rw_cmd_ready) begin
            rw_addr <= rw_cmd[15:8];
            rw_data <= rw_cmd[7:0];
            rw <= rw_cmd[16];
        end
    end
    wire [6:0] stm;
    assign debug = {1'h0, (stm[6:0]+1'b1),3'h0,rw,1'b0, cs[2:0], rw_addr[7:0], rw_data[7:0]};

    assign rw_resp = rw ? {rw,rw_addr,rw_data} : {rw,rw_addr,reg_data_rcvd};
    
    reg [2:0] cs, ns;
    localparam IDLE=3'h0, CMD=3'h1, DELAY=3'h2, RW=3'h3, DONE=3'h4; 

    /*
    inputs 
        rw_cmd_valid
        delay_cmd
        data_pulse
        ack_error
        transact_done
    
    control
        ns
        sccb_start 
        reg_setup_cnt_nxt
        rw_cmd_ready
        rw_resp_valid
    */
    always @(*) begin
        (* parallel_case *) case(cs)
            IDLE: begin
                ns = rw_cmd_valid ? CMD : IDLE ;
                sccb_start = 0;
                reg_setup_cnt_nxt = 0;
                rw_cmd_ready = 1;
                rw_resp_valid = 0;
            end
            CMD: begin
                ns = data_pulse ? (delay_cmd ? DELAY : RW) : CMD ;
                sccb_start = (data_pulse && !delay_cmd) ? 1: 0;
                reg_setup_cnt_nxt = 0;
                rw_cmd_ready = 0;
                rw_resp_valid = 0;
            end
            DELAY: begin
                ns = reg_setup_cnt==SREG_CYCLES ? DONE : DELAY;
                sccb_start = 0;
                reg_setup_cnt_nxt = reg_setup_cnt+1'b1;
                rw_cmd_ready = 0;
                rw_resp_valid = 0;
            end
            RW: begin // TODO add ERR state and check ack_error
                //ns = (data_pulse&&transact_done) ? (ack_error ? CMD : DONE) : RW ;
                ns = (data_pulse&&transact_done) ? (DONE) : RW ;
                sccb_start = 1;
                reg_setup_cnt_nxt = 0 ;
                rw_cmd_ready = 0;
                rw_resp_valid = 0;
            end
            DONE: begin
                ns = data_pulse ? IDLE : DONE;
                sccb_start = 0;
                reg_setup_cnt_nxt = 0;
                rw_cmd_ready = 0;
                rw_resp_valid = data_pulse ? 1 : 0;
            end
            default: begin
                ns = IDLE;
                sccb_start = 0;
                reg_setup_cnt_nxt = 0;
                rw_cmd_ready = 0;
                rw_resp_valid = 0;
            end
        endcase
    end
    
    `REG(clk, cs, 0, ns)
    // Read/Write the registers.
    `REG(clk, reg_setup_cnt, 0, reg_setup_cnt_nxt)
   
    SCCBCtrl sccbcntl 
    (   
        .clk_i(clk),
        .rst_i(rst_n),
        .sccb_clk_i(sccb_clk),
        .data_pulse_i(data_pulse),
        .addr_i(CAM_ID),
        .data_i({rw_addr[7:0],rw_data[7:0]}),
        .rw_i(rw),
        .start_i(sccb_start),
        .ack_error_o(ack_error),
        .done_o(transact_done),
        .data_o(reg_data_rcvd),
        .sioc_o(sioc_o),
        .siod_io(siod_io),
        .stm(stm)
    );    
 
    // Generate clock for the SCCB.
    always @(posedge clk or negedge rst_n) begin
        if (rst_n == 0) begin
            sccb_clk_cnt <= 0;
            sccb_clk <= 0;
        end else begin
            if (sccb_clk_cnt < SCCB_PERIOD) begin
                sccb_clk_cnt <= sccb_clk_cnt + 1'b1;
            end else begin
                sccb_clk <= ~sccb_clk;
                sccb_clk_cnt <= 0;
            end
        end
    end
 
endmodule
