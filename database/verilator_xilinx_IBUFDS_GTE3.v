// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// IBUFDS_GTE3 primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
module IBUFDS_GTE3
#(
    parameter [0:0] REFCLK_EN_TX_PATH  = 1'b0,
    parameter [1:0] REFCLK_HROW_CK_SEL = 2'b00,
    parameter [1:0] REFCLK_ICNTL_RX    = 2'b00
)
(
    // Clock input
    input      I,
    input      IB,
    // Clock enable
    input      CEB,
    // Clock outputs
    output     O /* verilator clocker */,
    output reg ODIV2 /* verilator clocker */
);

    reg r_IDIV2;
    
    initial begin
        r_IDIV2 = 1'b0;
    end
    
    always @ (posedge I) begin
        r_IDIV2 <= (CEB) ? 1'b0 : ~r_IDIV2;
    end
    
    always @(*) begin
        case (REFCLK_HROW_CK_SEL)
            2'b00   : ODIV2 = (REFCLK_EN_TX_PATH | CEB) ? 1'b0 : I;
            2'b01   : ODIV2 = r_IDIV2;
            default : ODIV2 = 1'b0;
        endcase
    end
    
    assign O = (REFCLK_EN_TX_PATH | CEB) ? 1'b0 : I;

endmodule
/* verilator coverage_on */
