// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// ODDRE1 primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
module ODDRE1
#(
    parameter [0:0] IS_C_INVERTED  = 1'b0,
    parameter [0:0] IS_D1_INVERTED = 1'b0,
    parameter [0:0] IS_D2_INVERTED = 1'b0,
    parameter       SIM_DEVICE     = "ULTRASCALE",
    parameter [0:0] SRVAL          = 1'b0
)
(
    input  C,
    input  D1,
    input  D2,
    input  SR,
    output Q
);
  
    wire       w_CLK = C  ^ IS_C_INVERTED;
    wire       w_D1  = D1 ^ IS_D1_INVERTED;
    wire       w_D2  = D2 ^ IS_D2_INVERTED;
    wire       w_SR;
    
    reg  [2:0] r_SR_cdc;
    
    reg        r_Q_p;
    reg        r_D2_p;
    reg        r_Q_n;

generate
    /* verilator lint_off WIDTH */
    if ((SIM_DEVICE == "EVEREST") || (SIM_DEVICE == "EVEREST_ES1") || (SIM_DEVICE == "EVEREST_ES2")) begin
    /* verilator lint_on WIDTH */
    
        assign w_SR = SR;
        
    end
    else begin

        always @(posedge w_CLK) begin
        
            r_SR_cdc <= { r_SR_cdc[1:0], SR };
        end
    
        assign w_SR = |{ SR, r_SR_cdc };
        
    end
endgenerate

    always @(posedge w_CLK) begin
    
        if (w_SR) begin
            r_Q_p  <= SRVAL ^ r_Q_n;
            r_D2_p <= SRVAL;
        end
        else begin
            r_Q_p  <= w_D1 ^ r_Q_n;
            r_D2_p <= w_D2;
        end
    end
    
    always @(negedge w_CLK) begin
    
        if (w_SR) begin
            r_Q_n <= SRVAL ^ r_Q_p;
        end
        else begin
            r_Q_n <= r_D2_p ^ r_Q_p;
        end
    end
    
    assign Q = r_Q_p ^ r_Q_n;
 
endmodule
/* verilator coverage_on */
