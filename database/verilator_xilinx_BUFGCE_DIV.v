// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// BUFGCE_DIV primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator lint_off WIDTH */
/* verilator lint_off SYNCASYNCNET */
/* verilator coverage_off */
module BUFGCE_DIV
#(
    parameter integer BUFGCE_DIVIDE   = 1,
    parameter         CE_TYPE         = "SYNC",
    parameter         HARDSYNC_CLR    = "FALSE",
    parameter   [0:0] IS_CE_INVERTED  = 1'b0,
    parameter   [0:0] IS_CLR_INVERTED = 1'b0,
    parameter   [0:0] IS_I_INVERTED   = 1'b0
)
(
    input      I,
    input      CE,
    input      CLR,
    output reg O /* verilator clocker */
);

    wire       w_CLK = I ^ IS_I_INVERTED;
    wire       w_CE;
    wire       w_CLR;
    wire [2:0] w_DIV = BUFGCE_DIVIDE[2:0] - 3'd1;

    reg  [2:0] r_CE_cdc;
    reg  [2:0] r_CLR_cdc;
    reg  [2:0] r_clk_div;
  
    initial begin
        r_CE_cdc  = 3'b000;
        r_CLR_cdc = 3'b000;
        r_clk_div = 3'd0;
    end

    always @(negedge w_CLK) begin
    
        if (HARDSYNC_CLR == "FALSE") begin
            r_CLR_cdc <= 3'b0;
        end
        else begin
            r_CLR_cdc <= {r_CLR_cdc[1:0], CLR ^ IS_CLR_INVERTED };
        end
    end

    assign w_CLR = (HARDSYNC_CLR == "FALSE") ? CLR ^ IS_CLR_INVERTED
                 : (HARDSYNC_CLR == "TRUE") ? r_CLR_cdc[2]
                 : 1'b0;

    always @(posedge w_CLR or negedge w_CLK) begin
    
        if (w_CLR) begin
            r_CE_cdc <= 3'b000;
        end
        else begin
            r_CE_cdc <= { r_CE_cdc[1:0], CE ^ IS_CE_INVERTED };
        end
    end

    assign w_CE = (CE_TYPE == "SYNC") ? r_CE_cdc[0]
                : (CE_TYPE == "HARDSYNC") ? r_CE_cdc[2]
                : 1'b0;

    always @(posedge I) begin
    
        if (w_CLR) begin
            r_clk_div <= (w_DIV[2:1] == 2'b10) ? 3'd1 : 3'd0;
        end
        else if (w_CE | O) begin
            if (w_DIV[2:1] == 2'b10) begin
                r_clk_div <= (r_clk_div == (w_DIV + 3'd1)) ? 3'd1 : r_clk_div + 3'd1;
            end
            else begin
                r_clk_div <= (r_clk_div == w_DIV) ? 3'd0 : r_clk_div + 3'd1;
            end
        end
    end
    
    always @(*) begin
    
        casez (w_DIV)
            3'b000 : O = I & w_CE;
            3'b001 : O = r_clk_div[0];
            3'b01? : O = r_clk_div[1];
            3'b1?? : O = r_clk_div[2];
        endcase
    end

endmodule
/* verilator lint_on WIDTH */
/* verilator lint_on SYNCASYNCNET */
/* verilator coverage_off */
