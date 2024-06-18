// This program was cloned from: https://github.com/HurleyResearch/nRFICE
// License: GNU General Public License v3.0

// =============================================================================
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// -----------------------------------------------------------------------------
//   Copyright (c) 2018 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED
// --------------------------------------------------------------------
//
//   Permission:
//
//      Lattice SG Pte. Ltd. grants permission to use this code
//      pursuant to the terms of the Lattice Reference Design License Agreement.
//
//
//   Disclaimer:
//
//      This VHDL or Verilog source code is intended as a design reference
//      which illustrates how these types of functions can be implemented.
//      It is the user's responsibility to verify their design for
//      consistency and functionality through the use of formal
//      verification methods.  Lattice provides no warranty
//      regarding the use or functionality of this code.
//
// -----------------------------------------------------------------------------
//
//                  Lattice SG Pte. Ltd.
//                  101 Thomson Road, United Square #07-02
//                  Singapore 307591
//
//
//                  TEL: 1-800-Lattice (USA and Canada)
//                       +65-6631-2000 (Singapore)
//                       +1-503-268-8001 (other locations)
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
// -----------------------------------------------------------------------------
//
// =============================================================================
//                         FILE DETAILS
// Project               :
// File                  : tb_top.v
// Title                 : Testbench for ram_dq.
// Dependencies          : 1.
//                       : 2.
// Description           :
// =============================================================================
//                        REVISION HISTORY
// Version               : 1.0.1
// Author(s)             :
// Mod. Date             : 03/05/2018
// Changes Made          : Initial version of testbench for ram_dq
// =============================================================================

`ifndef TB_TOP
`define TB_TOP

//==========================================================================
// Module : tb_top
//==========================================================================

`timescale 1ns/1ns

module tb_top();

`include "dut_params.v"

localparam TARGET_WRITE = ADDR_DEPTH;
localparam TARGET_READ = ADDR_DEPTH;
localparam T_BYTE_WIDTH = BYTE_WIDTH == 0 ? 1 : BYTE_WIDTH;

localparam CLK_FREQ = (FAMILY == "iCE40UP") ? 40 : 10;
localparam RESET_CNT = (FAMILY == "iCE40UP") ? 140 : 100;

reg                        chk_init = 1'b1;
reg                        chk_norm = 1'b1;

reg [T_BYTE_WIDTH-1:0]     ben_i;
reg                        clk_i;
reg                        rst_i;
reg                        clk_en_i;
reg                        rd_out_clk_en_i;

reg                        wr_en_i;
reg [DATA_WIDTH-1:0]       wr_data_i;
reg [ADDR_WIDTH-1:0]       addr_i;

wire [DATA_WIDTH-1:0]      rd_data_o;

reg [255:0]                data_in = {256{1'b0}};

genvar din0;

generate
    for(din0 = 0; din0 < 8; din0 = din0 + 1) begin
        always @ (posedge clk_i) begin
            data_in[din0*32+31:din0*32] <= $urandom_range({32{1'b0}}, {32{1'b1}});
        end
    end
endgenerate

initial begin
  clk_i = 1'b0;
  forever #CLK_FREQ clk_i = ~clk_i;
end

initial begin
  rst_i <= 1'b1;
  #RESET_CNT;
  rst_i <= 1'b0;
end

// ----------------------------
// GSR instance
// ----------------------------
`ifndef iCE40UP
    GSR GSR_INST ( .GSR_N(1'b1), .CLK(1'b0));
`endif

`include "dut_inst.v"

initial begin
  clk_en_i <= 1'b0;
  rd_out_clk_en_i <= 1'b1;
  wr_en_i <= 1'b0;
  ben_i <= {T_BYTE_WIDTH{1'b1}};
  addr_i <= 'h0;
  wr_data_i <= {DATA_WIDTH{1'b0}};
end

localparam INIT_EN             = (INIT_MODE == "none") ? 0 : 1;
localparam [1:0] SM_IDLE       = 2'b00;
localparam [1:0] SM_INIT_MODE  = 2'b01;
localparam [1:0] SM_WRITE_MODE = 2'b10;
localparam [1:0] SM_READ_MODE  = 2'b11;

reg [1:0] current_state;
reg [1:0] prev_state = SM_IDLE;
reg [1:0] prev2_state = SM_IDLE;

always @ (posedge clk_i) begin
    prev_state <= current_state;
    prev2_state <= prev_state;
end

integer i0, i1;
initial begin
    current_state <= (INIT_EN == 1) ? SM_INIT_MODE : SM_WRITE_MODE;
    @(negedge rst_i);
    @(posedge clk_i);
    if(current_state == SM_INIT_MODE) begin
        addr_i <= 'h0;
        wr_en_i <= 1'b0;
        clk_en_i <= 1'b1;
        for(i1 = 0; i1 < TARGET_READ; i1 = i1 + 1) begin
            @(posedge clk_i);
            addr_i <= addr_i + 1;
        end
        current_state <= SM_WRITE_MODE;
        @(posedge clk_i);
        if(REGMODE == "reg") @(posedge clk_i);
        wr_en_i <= 1'b1;
        clk_en_i <= 1'b0;
        if(chk_init == 1'b1) begin
            $display("-----------------------------------------------------");
            $display("----------- MEMORY INITIALIZATION PASSED ------------");
            $display("-----------------------------------------------------");
        end
        else begin
            $display("-----------------------------------------------------");
            $display("!!!!!!!!!!! MEMORY INITIALIZATION FAILED !!!!!!!!!!!!");
            $display("-----------------------------------------------------");
        end
    end
    if(current_state == SM_WRITE_MODE) begin
        addr_i <= 'h0;
        wr_data_i <= data_in[DATA_WIDTH-1:0];
        wr_en_i <= 1'b1;
        clk_en_i <= 1'b1;
        for(i1 = 0; i1 < TARGET_WRITE; i1 = i1 + 1) begin
            @(posedge clk_i);
            addr_i <= addr_i + 1'b1;
            wr_data_i <= data_in[DATA_WIDTH-1:0];
            if(BYTE_ENABLE == 1) begin
                ben_i <= (ben_i == {T_BYTE_WIDTH{1'b1}}) ?  {{(T_BYTE_WIDTH-1){1'b0}}, 1'b1} :
                         (ben_i == {T_BYTE_WIDTH{1'b0}}) ?  {T_BYTE_WIDTH{1'b1}} : (ben_i << 1);   
            end      
        end
        wr_en_i <= 1'b0;
        clk_en_i <= 1'b0;
        current_state <= SM_READ_MODE;
        @(posedge clk_i);
    end
    if(current_state == SM_READ_MODE) begin
        addr_i <= 'h0;
        wr_en_i <= 1'b0;
        clk_en_i <= 1'b1;
        for(i1 = 0; i1 < TARGET_READ; i1 = i1 + 1) begin
            @(posedge clk_i);
            addr_i <= addr_i + 1;
        end
        @(posedge clk_i);
        current_state <= SM_IDLE;
        if(REGMODE == "reg") @(posedge clk_i);    
    end
    if(chk_norm == 1'b1) begin
        $display("-----------------------------------------------------");
        $display("----------------- SIMULATION PASSED -----------------");
        $display("-----------------------------------------------------");
    end
    else begin
        $display("-----------------------------------------------------");
        $display("!!!!!!!!!!!!!!!!! SIMULATION FAILED !!!!!!!!!!!!!!!!!");
        $display("-----------------------------------------------------");
    end
    $finish;
end

genvar i_1;
if(INIT_EN == 1) begin : INIT_MODE_CHECKER
    reg [DATA_WIDTH-1:0] mem_init [2**ADDR_WIDTH-1:0];
    initial begin
        if (INIT_MODE == "mem_file" && INIT_FILE != "none") begin
            if (INIT_FILE_FORMAT == "hex") begin
              $readmemh(INIT_FILE, mem_init, 0, ADDR_DEPTH-1);
            end
            else begin
              $readmemb(INIT_FILE, mem_init, 0, ADDR_DEPTH-1);
            end
        end
    end
    wire [1:0] state_check = (REGMODE == "noreg") ? prev_state : prev2_state;
    wire [ADDR_WIDTH-1:0] addr_chk_w = addr_i;
    reg [ADDR_WIDTH-1:0] addr_p = {ADDR_WIDTH{1'b0}};
    reg rd_en_p_r = 1'b0;
    wire [DATA_WIDTH-1:0] sel_mem = (INIT_MODE == "mem_file") ? mem_init[addr_p] :
                                     (INIT_MODE == "all_one") ? {DATA_WIDTH{1'b1}} : {DATA_WIDTH{1'b0}};
    
    if(REGMODE == "noreg") begin
        always @ (posedge clk_i) begin
            addr_p <= addr_chk_w;
            rd_en_p_r <= ~wr_en_i & clk_en_i;
        end
    end
    else begin
        reg [ADDR_WIDTH-1:0] addr_p2 = {ADDR_WIDTH{1'b0}};
        reg rd_en_p2_r = 1'b0; 
        always @ (posedge clk_i) begin
            addr_p <= addr_p2;
            rd_en_p_r <= rd_en_p2_r;
            addr_p2 <= addr_chk_w;
            rd_en_p2_r <= ~wr_en_i & clk_en_i;
        end
    end

    always @ (posedge clk_i) begin
        if(rd_en_p_r & state_check == SM_INIT_MODE) begin
            if(sel_mem !== rd_data_o) begin
                $display("Expected DATA = %h, Read DATA = %h @%0d ns", sel_mem, rd_data_o, $time);
                chk_init = 1'b0;
            end
        end
    end 
end

genvar ben0;
integer mem_normi0;
localparam BIT_SIZE_NORM_INIT = INIT_MODE == "all_one" ? 1'b1 : 1'b0;
generate
    reg [DATA_WIDTH-1:0] mem_norm [2**ADDR_WIDTH-1:0];
    reg [T_BYTE_WIDTH-1:0] byte_en_rec [2**ADDR_WIDTH-1:0];

    initial begin
        if (INIT_MODE == "mem_file" && INIT_FILE != "none") begin
          if (INIT_FILE_FORMAT == "hex") begin
            $readmemh(INIT_FILE, mem_norm, 0, ADDR_DEPTH-1);
          end
          else begin
            $readmemb(INIT_FILE, mem_norm, 0, ADDR_DEPTH-1);
          end
        end
        else begin
            for(mem_normi0 = 0; mem_normi0 < 2**ADDR_WIDTH; mem_normi0 = mem_normi0 + 1) begin
                mem_norm[mem_normi0] = {DATA_WIDTH{BIT_SIZE_NORM_INIT}};
            end
        end
    end

    if(BYTE_ENABLE == 0) begin
        always @ (posedge clk_i) begin
            if(current_state == SM_WRITE_MODE & wr_en_i & clk_en_i) begin
                mem_norm[addr_i] <= wr_data_i;
            end
        end
    end
    else begin
        localparam BYTE_SIZE = (DATA_WIDTH % 9 == 0) ? 9 : 8;
        localparam EQUIV_LEN = (DATA_WIDTH/BYTE_SIZE);
        wire [BYTE_SIZE-1:0] act_wr_data [EQUIV_LEN-1:0];
        wire [DATA_WIDTH-1:0] pref_data = mem_norm[addr_i];
        for(ben0 = 0; ben0 < EQUIV_LEN; ben0 = ben0 + 1) begin
            assign act_wr_data [ben0] = (ben_i[ben0] == 1'b1) ? (wr_data_i[ben0*BYTE_SIZE+BYTE_SIZE-1:ben0*BYTE_SIZE]) : 
                                                                (pref_data[ben0*BYTE_SIZE+BYTE_SIZE-1:ben0*BYTE_SIZE]);
        end
        wire [DATA_WIDTH-1:0] wr_data_t_w;
        for(ben0 = 0; ben0 < EQUIV_LEN; ben0 = ben0 + 1) begin
            assign wr_data_t_w[ben0*BYTE_SIZE+BYTE_SIZE-1:ben0*BYTE_SIZE] = act_wr_data[ben0];
        end
        always @ (posedge clk_i) begin
            if(current_state == SM_WRITE_MODE & wr_en_i & clk_en_i) begin
                mem_norm[addr_i] <= wr_data_t_w;
            end
        end
    end

    wire [1:0] state_check = (REGMODE == "noreg") ? prev_state : prev2_state;

    wire [ADDR_WIDTH-1:0] addr_chk_w = addr_i;
    reg [ADDR_WIDTH-1:0] addr_p = {ADDR_WIDTH{1'b0}};
    reg rd_en_p_r = 1'b0;
    wire [DATA_WIDTH-1:0] sel_mem = mem_norm[addr_p];
    
    if(REGMODE == "noreg") begin
        always @ (posedge clk_i) begin
            addr_p <= addr_chk_w;
            rd_en_p_r <= ~wr_en_i & clk_en_i;
        end
    end
    else begin
        reg [ADDR_WIDTH-1:0] addr_p2 = {ADDR_WIDTH{1'b0}};
        reg rd_en_p2_r = 1'b0; 
        always @ (posedge clk_i) begin
            addr_p <= addr_p2;
            rd_en_p_r <= rd_en_p2_r;
            addr_p2 <= addr_chk_w;
            rd_en_p2_r <= ~wr_en_i & clk_en_i;
        end
    end

    always @ (posedge clk_i) begin
        if(rd_en_p_r & state_check == SM_READ_MODE) begin
            if(sel_mem !== rd_data_o) begin
                $display("Expected DATA = %h, Read DATA = %h @%0d ns", sel_mem, rd_data_o, $time);
                chk_norm = 1'b0;
            end
        end
    end
endgenerate

endmodule
`endif
