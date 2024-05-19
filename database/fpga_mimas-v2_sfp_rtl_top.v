// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top(
    input   CLK_100MHz,             // 100 MHz System Clock

    output  [7:0]   LED,            // Status LEDs
    output  [7:0]   SEV_SEG,        // Seven Segment Display
    output  [2:0]   SEV_SEG_EN      // Seven Segment Display Enable
    );

    // Clock Generator (125 MHz)
    wire clk_eth;
    wire pll_ok;
    pll pll_eth (
        .clk_in   (CLK_100MHz),
        .clk_out  (clk_eth),

        .reset    (1'b0),   // Active LOW
        .locked   (pll_ok)  // Active HIGH
    );

    // Synchronous Reset Generator
    wire resetn;
    reset_gen rst(
        .clk     (clk_eth),
        .resetn  (resetn)
    );

    // Status Display
    reg [7:0] status = 8'h00;
    hex #(
		.refresh_rate     (100),
		.sys_clk_freq     (125000000)
    )
    display (
        .clk              (clk_eth),
        .hex_byte         (status),
        .segments         (SEV_SEG),
        .segments_enable  (SEV_SEG_EN)
    );

    // Status LEDs
    assign LED[0]   = pll_ok;       // PLL Lock Indicator
    assign LED[1]   = resetn;       // System RESET
    assign LED[7:2] = 6'b000000;
endmodule


/**
 * Generates synchronous RESET signal after 16 clock cycles
 */
module reset_gen(
    input  clk,
    output resetn
    );

    reg [15:0] x = 16'hFFFF;
    always @(posedge clk)
        x <= {x[14:0], 1'b0};

    assign resetn = !x[15];

endmodule


`include "../rtl/phy/pma/pll.v"     // Phase Locked Loop
`include "../rtl/hex.v"             // Seven Segment Hexadecimal Display
