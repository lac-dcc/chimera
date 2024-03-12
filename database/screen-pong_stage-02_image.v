//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
//
// Create Date: 09:30:38 19/09/2017
// Module Name: image
// Description: Image with logo for screen-saver.
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module image (
                input  wire clk,            // System clock.
                input  wire [9:0] x_img,    // X position in image.
                input  wire [9:0] y_img,    // Y position in image.
                output reg  pixel           // Pixel (B&W) in x and y positon.
             );

    // Image name file in binary ASCII code.
    localparam FILE_LOGO = "logo.list";

    // Width and height image.
    parameter width = 80;
    parameter height = 96;

    // Memory
    reg [width-1:0] logo [height-1:0];

    // Load file in memory.
    initial
    begin
        $readmemb(FILE_LOGO, logo);
    end

    // Read memory.
    always @(posedge clk)
    begin
        if ((x_img >= 0) && (x_img < width ) && (y_img >= 0) && (y_img < height))
			// A little trick in x position for a mirror image.
			pixel = logo [y_img][width-1-x_img];
		else
			pixel = 1'b0;
    end
endmodule
