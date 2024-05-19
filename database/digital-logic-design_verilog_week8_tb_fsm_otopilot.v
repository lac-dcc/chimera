// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2022 10:05:37 PM
// Design Name: 
// Module Name: tb_fsm_otopilot
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_fsm_otopilot;

reg clk;
reg rst_n;
reg [15:0] gnss_i;
reg [15:0] altimetre_i;
reg [7:0] hedef_yukseklik_i;
reg yukseklik_bilgisi_i;
wire  motor_o;
wire  yesil_led_o;
wire  kirmizi_led_o;

localparam real c_clk_period = 20;

fsm_otopilot DUT
(
.clk                 (clk                ),
.rst_n               (rst_n              ),
.gnss_i              (gnss_i             ),
.altimetre_i         (altimetre_i        ),
.hedef_yukseklik_i   (hedef_yukseklik_i  ),
.yukseklik_bilgisi_i (yukseklik_bilgisi_i),
.motor_o             (motor_o            ),
.yesil_led_o         (yesil_led_o        ),
.kirmizi_led_o       (kirmizi_led_o      )
);

always begin
    // #10 clk = !clk;
    #(c_clk_period/2) clk = !clk;
end

initial begin
clk = 1'b0;
rst_n = 1'b0;
gnss_i = 0;
altimetre_i = 0;
hedef_yukseklik_i = 0;
yukseklik_bilgisi_i = 0;
#40;
rst_n = 1'b1;
#20;
yukseklik_bilgisi_i = 1;
hedef_yukseklik_i = 5;
#20;
hedef_yukseklik_i = 7;
#20;
hedef_yukseklik_i = 9;
#60;
rst_n = 0;
#20;
rst_n = 1;
#20
yukseklik_bilgisi_i = 1;
hedef_yukseklik_i = 110;
#20;
yukseklik_bilgisi_i = 0;
hedef_yukseklik_i = 0;
#60;
rst_n = 0;
#20;
rst_n = 1;
#20
yukseklik_bilgisi_i = 1;
hedef_yukseklik_i = 50;
#20;
gnss_i = 4;
altimetre_i = 6;
#20;
gnss_i = 8;
altimetre_i = 16;
#20;
gnss_i = 20;
altimetre_i = 36;
#20;
gnss_i = 40;
altimetre_i = 46;
#20;
gnss_i = 36;
altimetre_i = 20;
#20;
gnss_i = 46;
altimetre_i = 52;
#20;
gnss_i = 56;
altimetre_i = 72;
#20;
gnss_i = 46;
altimetre_i = 60;
#20;
gnss_i = 36;
altimetre_i = 40;
#20;
gnss_i = 56;
altimetre_i = 60;
#20;
gnss_i = 46;
altimetre_i = 50;
#20;
gnss_i = 45;
altimetre_i = 45;
#40
$finish;
end

endmodule