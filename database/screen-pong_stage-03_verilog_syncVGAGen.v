////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: syncVGAGen.v
//
// Description: Sync VGA generator.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module syncVGAGen
(
    input  wire       px_clk,        // Pixel clock.
    output wire [9:0] x_px,          // X position for actual pixel.
    output wire [9:0] y_px,          // Y position for actual pixel.
    output wire       hsync,         // Horizontal sync out.
    output wire       vsync,         // Vertical sync out.
    output wire       activevideo    // Active video.
);

    // TODO: Utilizar una tabla de parámetros para obtener los valores para
    //       distintas resoluciones y poder modificar desde pines externos.
    //
    // https://www.digikey.com/eewiki/pages/viewpage.action?pageId=15925278#VGAController(VHDL)-Appendix:VGATimingSpecifications
    //
    // parameter [8:0] vga_table = {"800x600@72",72,50,800,56,120,64,600,37,6,23,'p','p'},
    //

    // Video structure constants.
    parameter activeHvideo = 800;               // Width of visible pixels.
    parameter activeVvideo = 600;               // Height of visible lines.
    parameter hfp = 56;                         // Horizontal front porch length.
    parameter hpulse = 120;                     // Hsync pulse length.
    parameter hbp = 64;                         // Horizontal back porch length.
    parameter vfp = 37;                         // Vertical front porch length.
    parameter vpulse = 6;                       // Vsync pulse length.
    parameter vbp = 23;                         // Vertical back porch length.
    parameter blackH = hfp + hpulse + hbp;      // Hide pixels in one line.
    parameter blackV = vfp + vpulse + vbp;      // Hide lines in one frame.
    parameter hpixels = blackH + activeHvideo;  // Total horizontal pixels.
    parameter vlines = blackV + activeVvideo;   // Total lines.

    // Registers for storing the horizontal & vertical counters.
    reg [10:0] hc;
    reg [10:0] vc;

    reg [9:0] x_px;          // X position for actual pixel.
    reg [9:0] y_px;          // Y position for actual pixel.

    // Counting pixels.
    always @(posedge px_clk)
    begin
        // Keep counting until the end of the line.
        if (hc < hpixels - 1)
            hc <= hc + 1;
        else
        // When we hit the end of the line, reset the horizontal
        // counter and increment the vertical counter.
        // If vertical counter is at the end of the frame, then
        // reset that one too.
        begin
            hc <= 0;
            if (vc < vlines - 1)
            vc <= vc + 1;
            else
            vc <= 0;
        end
    end

    // Generate sync pulses (active low) and active video.
    assign hsync = (hc >= hfp && hc < hfp + hpulse) ? 0:1;
    assign vsync = (vc >= vfp && vc < vfp + vpulse) ? 0:1;
    assign activevideo = (hc >= blackH && vc >= blackV) ? 1:0;

    // Generate new pixel position.
    always @(posedge px_clk)
    begin
        // First check if we are within vertical active video range.
        if (activevideo)
        begin
            x_px <= hc - blackH;
            y_px <= vc - blackV;
        end
        else
        // We are outside active video range so initial position it's ok.
        begin
            x_px <= 0;
            y_px <= 0;
        end
    end

endmodule
