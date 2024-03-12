////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: zipVGAStr.v
//
// Description: Zipper VGA stream.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

 module zipVGAStr (
    input  wire         hsync,         // Horizontal sync out.
    input  wire         vsync,         // Vertical sync out.
    input  wire [9:0]   x_px,          // X screen position.
    input  wire [9:0]   y_px,          // Y screen position.
    input  wire         activevideo,   // Active video signal.
    output wire [22:0]  strVGA         // Output stream VGA.
);
    // Bit position alias.
    `define Active 0:0
    `define VS 1:1
    `define HS 2:2
    `define YC 12:3
    `define XC 22:13

    assign strVGA [`XC] = x_px;
    assign strVGA [`YC] = y_px;
    assign strVGA [`HS] = hsync;
    assign strVGA [`VS] = vsync;
    assign strVGA [`Active] = activevideo;

endmodule
