// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module pma (
    input       clk_in,     // 100 MHz System Clock
    output      clk_pma,    // 125 MHz Ethernet Clock

    input       reset,      // Reset Signal
    output      locked      // PLL Locked
);

    pll pma_pll (
        .CLK_IN   (clk_in),
        .CLK_PMA  (clk_pma),
        .RESET    (reset),
        .LOCKED   (locked)
    );

endmodule

`include "../rtl/phy/pma/pll.v"
