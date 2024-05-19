// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

/**
 * Interfaces SoC module with real I/O on the
 * Numato Lab Mimas V2 Spartan 6 (XC6SLX9) development board.
 * 
 * A delayed synchronous reset signal for the CPU is also generated here.
 */
module top(
    input CLK,                      // 100 MHz system clock

    output UART_TX,                 // PIC uC USB UART transmit
    input  UART_RX,                 // PIC uC USB UART receive

    output [7:0] LED,               // LEDs D1-D8
    
    output [7:0] SEV_SEG,           // Seven segment display anodes
    output [2:0] SEV_SEG_EN,        // Seven segment display cathodes (enable)

    output       VGA_HSYNC,         // VGA horizontal sync pulse
    output       VGA_VSYNC,         // VGA vertical sync pulse
    output [7:0] VGA_PIX            // VGA pixel data for R3G3B3 R2R DAC
);

    wire resetn;
    reset_gen rst(
        .clk   (CLK   ),
        .resetn(resetn)
    );

    picosoc soc(
        .clk     (CLK       ),
        .resetn  (resetn    ),
        .led     (LED       ),
        .rxd     (UART_RX   ),
        .txd     (UART_TX   ),
        .ss      (SEV_SEG   ),
        .ssen    (SEV_SEG_EN),
        .vga_h   (VGA_HSYNC ),
        .vga_v   (VGA_VSYNC ),
        .vga_pix (VGA_PIX   )
    );

endmodule


/**
 * Generates synchronous RESET signal after 8 clock cycles
 */
module reset_gen(
    input  clk,
    output resetn
);

    reg [7:0] x = 8'hFF;
    always @(posedge clk)
        x <= {x[6:0], 1'b0};

    assign resetn = !x[7];

endmodule


`include "../rtl/soc/picosoc.v"
`include "../rtl/soc/picorv32.v"
`include "../rtl/util/pll.v"
`include "../rtl/peripheral/uart.v"
`include "../rtl/peripheral/sevseg.v"
`include "../rtl/peripheral/vga.v"
