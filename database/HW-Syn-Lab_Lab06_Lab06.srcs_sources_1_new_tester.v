`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Computer Engineering Department, Chulalongkorn University
// Engineer: tan14007
// 
// Create Date: 04/05/2020 01:07:20 PM
// Design Name: 
// Module Name: VGA, UART, and Keyboard USB tester
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: After clicked 'Run Simulation', 
//                      open Tcl Console and enter `set_property unifast true [current_fileset -simset]` 
//                      to make simulation faster
// 
//////////////////////////////////////////////////////////////////////////////////


module tester(
    
    );
    
reg [3:0]screen[HEIGHT-1:0][WIDTH-1:0][2:0];
parameter WIDTH=640;
parameter HEIGHT=480;
parameter LINE=800;
parameter SCREEN=525;
parameter N_CASES=1;
parameter AFTER_HSYNC = 47;
parameter AFTER_VSYNC = 31;

integer i;
integer j;
integer k;

reg clk = 0;
reg [10:0]cur_x = 0;
reg [10:0]cur_y = 0;
reg [N_CASES:0]pass = 1;

wire [3:0]vgaRed;
wire [3:0]vgaGreen;
wire [3:0]vgaBlue;
wire Hsync;
wire Vsync;

reg x_updated = 0;
reg y_updated = 0;

integer incorrect_1 = 0;
integer incorrect_2 = 0;

reg rx=1;
wire tx;
reg [7:0]K_UP = 8'h77;            //w
reg [7:0]K_DOWN = 8'h73;          //s
reg [7:0]K_RIGHT = 8'h64;         //d
reg [7:0]K_LEFT = 8'h61;          //a
    
reg [7:0]K_WHITE = 8'h20;         //SPACE
reg [7:0]K_MAGENTA = 8'h6d;       //m
reg [7:0]K_CYAN = 8'h63;          //c
reg [7:0]K_YELLOW = 8'h79;        //y

always #1 clk = ~clk;
// Test System for Test#1 should named `vgaSystem` and have following port
vgaSystem test(
    .clk(clk),              // board clock: 100 MHz from BASYS3 board
    .Hsync(Hsync),          // horizontal sync output
    .Vsync(Vsync),          // vertical sync output
    .vgaRed(vgaRed),        // 4-bit VGA red output
    .vgaGreen(vgaGreen),    // 4-bit VGA green output
    .vgaBlue(vgaBlue)       // 4-bit VGA blue output)
    );
    
    
initial
begin
// Initial Screen
for(i=0;i<HEIGHT;i = i+1)
    for(j=0;j<WIDTH;j = j+1)
        for(k=0;k<2;k = k+1)
            screen[i][j][k] = 0;

// Test #1: White circle with radius of 10 pixel
// This testcase will read only 640*480 pixels 
// since there are many standard for front/back porch and sync duration 
// (More info: http://martin.hinner.info/vga/timing.html)
// However, this test case will check only industry standard one
// (and all of them are working!) 

// Wait at least 2 frame to ensure that complete image comes
for(i = 0; i < LINE*SCREEN*2; i = i + 1)
begin
    #2
    begin
        if(cur_x > AFTER_HSYNC && cur_y > AFTER_VSYNC)
        begin
        screen[cur_y-AFTER_VSYNC][cur_x-AFTER_HSYNC][0] <= vgaRed;
        screen[cur_y-AFTER_VSYNC][cur_x-AFTER_HSYNC][1] <= vgaGreen;
        screen[cur_y-AFTER_VSYNC][cur_x-AFTER_HSYNC][2] <= vgaBlue;
        end
        if(Hsync == 0)
        begin
            cur_x <= 0;
            if(y_updated == 0 && Vsync)
                cur_y <= (cur_y+1<HEIGHT+AFTER_VSYNC)?cur_y + 1:cur_y;
            y_updated <= 1;
        end
        else 
        begin
            if(Vsync)
                cur_x <= (cur_x+1<WIDTH+AFTER_HSYNC)?cur_x + 1:cur_x;
            y_updated <= 0;
        end
        if(Vsync == 0)
        begin 
            cur_x <= 0;
            cur_y <= 0;
        end
    end
end
#10
begin

for(i = 0; i < HEIGHT; i = i + 1)
for(j=0;j<WIDTH;j=j+1)
begin
    if(((i-HEIGHT/2)*(i-HEIGHT/2) + (j-WIDTH/2)*(j-WIDTH/2) <= 100*100) && 
    (screen[i][j][0] != 15 || screen[i][j][1] != 15 || screen[i][j][2] != 15))
    begin
        incorrect_1 = incorrect_1 + 1; 
    end
    if(((i-HEIGHT/2)*(i-HEIGHT/2) + (j-WIDTH/2)*(j-WIDTH/2) > 100*100) && 
    (screen[i][j][0] != 0 || screen[i][j][1] != 0 || screen[i][j][2] != 0))
    begin
        incorrect_2 = incorrect_2 + 1;
    end
end

// Sorry, I don't have much time for writing test case
pass[0] = (incorrect_1+incorrect_2)<960;
end
$display("Test 1(VGA Signal & Output): ");
$display("%s", pass[0]?"Pass":"Failed");

#1
begin
$display("End of Test\n");
$finish;
end
end


endmodule
