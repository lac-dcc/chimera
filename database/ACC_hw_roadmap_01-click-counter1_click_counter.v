// This program was cloned from: https://github.com/Obijuan/ACC
// License: GNU General Public License v3.0

module main (input clk,
             input rst,
             output c0,
             output c1,
             output c2,
             output c3,
             output c4,
             output c5,
             output c6,
             output c7);

//-- Configure the pull-up resistors for clk and rst inputs

wire clk_in, clk2;
wire rst_in, rst2;

   SB_IO #(
       .PIN_TYPE(6'b 1010_01),
       .PULLUP(1'b 1)
   ) io_pin (
       .PACKAGE_PIN(clk),
       .D_IN_0(clk2)
   );

   SB_IO #(
       .PIN_TYPE(6'b 1010_01),
       .PULLUP(1'b 1)
   ) io_pin2 (
       .PACKAGE_PIN(rst),
       .D_IN_0(rst2)
   );

//-- rst_in and clk_in are the signals from the switches, with
//-- standar logic (1 pressed, 0 not presssed)
assign rst_in = ~rst2;
assign clk_in = ~clk2;


//-- Counter with asynchronous reset
reg [7:0] counter;

 always @(posedge clk_in or posedge rst_in) begin
   if (rst_in==1'b1)
     counter <= 7'b0;
   else
     counter <= counter + 1;
 end

 //-- Output the counter's bits
 assign c0 = counter[0];
 assign c1 = counter[1];
 assign c2 = counter[2];
 assign c3 = counter[3];
 assign c4 = counter[4];
 assign c5 = counter[5];
 assign c6 = counter[6];
 assign c7 = counter[7];

endmodule
