////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: unzipRGB.v
//
// Description: Unzip RGB in a VGA out signals.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module unzipRGB (
    input wire [25:0] strRGB,   // Input stream.
    output wire       hsync,    // Horizontal sync out.
    output wire       vsync,    // Vertical sync out.
    output wire       Red,      // RED vga output.
    output wire       Green,    // GREEN vga output.
    output wire       Blue      // BLUE vga output.
);

    // Bit position alias.
    `define VS 1:1
    `define HS 2:2
    `define B 23:23
    `define G 24:24
    `define R 25:25

    assign hsync = strRGB [`HS];
    assign vsync = strRGB [`VS];
    assign Red =   strRGB [`R];
    assign Green = strRGB [`G];
    assign Blue =  strRGB [`B];

endmodule
