////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: strVGAGen.v
//
// Description: Stream VGA generator.
//
// Dependencies: 
//      pxClkGen
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module strVGAGen (
    input  wire sys_clk,            // System clock.
    output wire px_clk,             // Pixel clock.
    output wire [22:0] strVGA       // Stream VGA output.
);

wire [9:0] x_px;
wire [9:0] y_px;
wire hsync;
wire vsync;
wire activevideo;

// Pixel clock generator.
pxClkGen pxClkGen_0 (
    .sys_clk (sys_clk),
    .px_clk (px_clk)
);

// From pixel clock to sync.
syncVGAGen syncVGAGen_0 (
    .px_clk(px_clk),
    .x_px(x_px),
    .y_px(y_px),
    .hsync(hsync),
    .vsync(vsync),
    .activevideo(activevideo)
);

// From sync to stream VGA.
zipVGAStr zipVGAStr_0 (
    .x_px(x_px),
    .y_px(y_px),
    .hsync(hsync),
    .vsync(vsync),
    .activevideo(activevideo),
    .strVGA(strVGA)
);

endmodule
