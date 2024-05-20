// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;

	reg clk, rst, sense_entry, sense_exit;
    reg [1:0] password_1, password_2;
    wire green_light, red_light;
    wire [6:0] hex_1, hex_2;
    wire [3:0] space_available, space_utilized, count_cars;

	car_parking_management dut(clk, rst, sense_entry, sense_exit, password_1, password_2, green_light, red_light, hex_1, hex_2, space_available, space_utilized, count_cars);

    initial begin
        clk = 1;
        forever #5 clk = ~clk;
    end
    
    initial begin
        rst = 1;
        sense_entry = 0;
        sense_exit = 0;
        password_1 = 0;
        password_2 = 0;
    
        #10; 
        rst = 1'b0; 
        sense_entry = 1'b1;  
        sense_exit = 1'b0;
        password_1 = 2'b01;
        password_2 = 2'b01;
        #80;  sense_exit = 1'b1; sense_entry = 1'b0;  
    end
    
    initial begin
        $monitor("time=%g, clk=%b, rst=%b, sense_entry=%b, sense_exit=%b, password_1=%b, password_2=%b,\ngreen_light=%b, red_light=%b, hex_1=%b, hex_2=%b, space_available=%d, space_utilized=%d, count_cars=%d", $time, clk, rst, sense_entry, sense_exit, password_1, password_2, green_light, red_light, hex_1, hex_2, space_available, space_utilized, count_cars);
        #150 $finish;
    end
endmodule
