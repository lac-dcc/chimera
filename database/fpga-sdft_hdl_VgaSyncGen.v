//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
// 
// Create Date:    09:34:23 30/09/2017 
// Module Name:    vga_controller
// Description:    Basic control for 640x480@72Hz VGA signal.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created for Roland Coeurjoly (RCoeurjoly) in 640x480@85Hz.
// Revision 0.02 - Change for 640x480@60Hz.
// Revision 0.03 - Solved some mistakes.
// Revision 0.04 - Change for 640x480@72Hz and output signals 'activevideo'
//                 and 'px_clk'.
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module VgaSyncGen (
            input wire       clk,           // Input clock: 12MHz
            output wire      hsync,         // Horizontal sync out
            output wire      vsync,         // Vertical sync out
            output reg [9:0] x_px,          // X position for actual pixel.
            output reg [9:0] y_px,          // Y position for actual pixel.
            output wire      activevideo,
            output wire      px_clk
         );

    // Generated values for pixel clock of 31.5Mhz and 72Hz frame frecuency.
    // # icepll -i12 -o31.5
    //
    // F_PLLIN:    12.000 MHz (given)
    // F_PLLOUT:   31.500 MHz (requested)
    // F_PLLOUT:   31.500 MHz (achieved)
    //
    // FEEDBACK: SIMPLE
    // F_PFD:   12.000 MHz
    // F_VCO: 1008.000 MHz
    //
    // DIVR:  0 (4'b0000)
    // DIVF: 83 (7'b1010011)
    // DIVQ:  5 (3'b101)
    //
    // FILTER_RANGE: 1 (3'b001)
    //
    `ifdef __ICARUS__
        assign px_clk = clk;
    `else
    SB_PLL40_CORE #(.FEEDBACK_PATH("SIMPLE"),
                    .PLLOUT_SELECT("GENCLK"),
                    .DIVR(4'b0000),
                    .DIVF(7'b1010011),
                    .DIVQ(3'b101),
                    .FILTER_RANGE(3'b001)
            )
            uut
            (
                    .REFERENCECLK(clk),
                    .PLLOUTCORE(px_clk),
                    .RESETB(1'b1),
                    .BYPASS(1'b0)
              );

    `endif
        
    /*
    http://www.epanorama.net/faq/vga2rgb/calc.html
    [*User-Defined_mode,(640X480)]
    PIXEL_CLK   =   31500
    H_DISP      =   640
    V_DISP      =   480
    H_FPORCH    =   24
    H_SYNC      =   40
    H_BPORCH    =   128
    V_FPORCH    =   9
    V_SYNC      =   3
    V_BPORCH    =   28
    */

    // Video structure constants.
    parameter activeHvideo = 640;               // Width of visible pixels.
    parameter activeVvideo =  480;              // Height of visible lines.
    parameter hfp = 24;                         // Horizontal front porch length.
    parameter hpulse = 40;                      // Hsync pulse length.
    parameter hbp = 128;                        // Horizontal back porch length.
    parameter vfp = 9;                          // Vertical front porch length.
    parameter vpulse = 3;                       // Vsync pulse length.
    parameter vbp = 28;                         // Vertical back porch length.
    parameter blackH = hfp + hpulse + hbp;      // Hide pixels in one line.
    parameter blackV = vfp + vpulse + vbp;      // Hide lines in one frame.
    parameter hpixels = blackH + activeHvideo;  // Total horizontal pixels.
    parameter vlines = blackV + activeVvideo;   // Total lines.

    // Registers for storing the horizontal & vertical counters.
    reg [9:0] hc;
    reg [9:0] vc;

    // Initial values.
    initial
    begin
      x_px <= 0;
      y_px <= 0;
      hc <= 0;
      vc <= 0;
    end

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

    // Generate color.
    always @(posedge px_clk)
    begin
        // First check if we are within vertical active video range.
        if (activevideo)
        begin
            x_px <= hc - blackH;
            y_px <= vc - blackV;
        end
        else
        // We are outside active video range so display black.
        begin
            x_px <= 0;
            y_px <= 0;
        end
     end
 endmodule
