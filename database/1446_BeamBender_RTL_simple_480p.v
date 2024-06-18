// This program was cloned from: https://github.com/jbilander/BeamBender
// License: Creative Commons Attribution Share Alike 4.0 International

// Project F: FPGA Graphics - Simple 640x480p60 Display
// (C)2023 Will Green, open source hardware released under the MIT License
// Learn more at https://projectf.io/posts/fpga-graphics/
//
// Modified by J.Bilander for Gowin GW1NR-UV9LQ144PC6/I5 2024-04-23

`timescale 1ns / 1ps

module simple_480p(
    input PCLK,             // pixel clock
    input RST_PCLK,         // reset in pixel clock domain
    output reg [9:0] SX,    // horizontal screen position
    output reg [9:0] SY,    // vertical screen position
    output HSYNC,           // horizontal sync
    output VSYNC,           // vertical sync
    output DE               // data enable (low in blanking interval)
);

// horizontal timings
parameter HA_END = 639;           // end of active pixels
parameter HS_STA = HA_END + 16;   // sync starts after front porch
parameter HS_END = HS_STA + 96;   // sync ends
parameter LINE   = 799;           // last pixel on line (after back porch)

// vertical timings
parameter VA_END = 479;           // end of active pixels
parameter VS_STA = VA_END + 10;   // sync starts after front porch
parameter VS_END = VS_STA + 2;    // sync ends
parameter SCREEN = 524;           // last line on screen (after back porch)

// Negative polarity means that the active edge is a high-to-low transition.
assign HSYNC = ~(SX >= HS_STA && SX < HS_END);  // invert: negative polarity
assign VSYNC = ~(SY >= VS_STA && SY < VS_END);  // invert: negative polarity
assign DE = (SX <= HA_END && SY <= VA_END);

always @ (posedge PCLK) begin

    if (SX == LINE) begin   // last pixel on line?
        SX <= 'b0;
        SY <= (SY == SCREEN) ? 'b0 : SY + 1;  // last line on screen?
    end else begin
        SX <= SX + 1;
    end

    if (RST_PCLK) begin
        SX <= 'b0;
        SY <= 'b0;
    end

end

endmodule
