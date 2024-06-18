// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// BUFG_GT primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
module BUFG_GT
(
    input       I,
    input [2:0] DIV,
    input       CE,
    input       CEMASK,
    input       CLR,
    input       CLRMASK,
    
    output      O /* verilator clocker */
);

    reg  [1:0] r_CE_cdc;
    wire       w_CE_msk;
    reg        r_CE_msk;
    
    reg  [1:0] r_CLR_cdc;
    wire       w_CLR_msk;
    
    reg  [2:0] r_clk_div;
    
    /* verilator lint_off MULTIDRIVEN */
    reg        r_O;
    /* verilator lint_on MULTIDRIVEN */
   
    initial begin
        r_CE_cdc  = 2'b00;
        r_CE_msk  = 1'b0;
        r_CLR_cdc = 2'b00;
        r_clk_div = 3'd0;
    end
    
    always @(posedge I) begin
    
        r_CE_cdc <= { r_CE_cdc[0], CE };
    end

    assign w_CE_msk = r_CE_cdc[1] | CEMASK;

    always @(negedge I) begin
    
        if (w_CLR_msk) begin
            r_CE_msk <= 1'b0;
        end
        else begin
            r_CE_msk <= w_CE_msk;
        end
    end

    always @(posedge CLR or posedge I) begin
    
        if (CLR) begin
            r_CLR_cdc <= 2'b11;
        end
        else begin
            r_CLR_cdc <= { r_CLR_cdc[0], 1'b0 };
        end
    end
    
    assign w_CLR_msk = r_CLR_cdc[1] & ~CLRMASK;

    always @(posedge I) begin
    
        if (w_CLR_msk) begin
            r_clk_div <= (DIV[2:1] == 2'b10) ? 3'd1 : 3'd0;
        end
        else if (r_CE_msk | O) begin
            if (DIV[2:1] == 2'b10) begin
                r_clk_div <= (r_clk_div == (DIV + 3'd1)) ? 3'd1 : r_clk_div + 3'd1;
            end
            else begin
                r_clk_div <= (r_clk_div == DIV) ? 3'd0 : r_clk_div + 3'd1;
            end
        end
    end
    
    always @(posedge I) begin
    
        casez (DIV)
            3'b000 : r_O <= r_CE_msk;
            3'b001 : r_O <= r_clk_div[0];
            3'b01? : r_O <= r_clk_div[1];
            3'b1?? : r_O <= r_clk_div[2];
        endcase
    end

    always @(negedge I) begin
    
        if (DIV == 3'b000) begin
            r_O <= 1'b0;
        end
    end
    
    assign O = r_O;

endmodule
/* verilator coverage_on */
