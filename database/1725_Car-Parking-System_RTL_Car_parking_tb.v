// This program was cloned from: https://github.com/Nilesh002/Car-Parking-System
// License: MIT License

module car_parking_tb();
reg [3:0] password;
reg [31:0] vehicle_no;
reg vehicle_present;
reg password_entered;
reg clk;
reg reset;
wire car_parked;
wire password_check;
wire gate;

car_parking DUT(vehicle_no,gate,clk,vehicle_present,password,password_entered,reset,password_check,car_parked);

always #5 clk=~clk;

initial
begin
reset = 1'b1;
clk = 1'b1;
#5 reset =1'b0;

vehicle_present = 1'b1;
password_entered = 1'b1;
vehicle_no = 32'd1104;
password = 4'b0000;
//#100 password_entered = 1'b0;
//vehicle_present = 1'b0;

#100;
vehicle_present = 1'b1;
password_entered = 1'b1;
vehicle_no = 32'd2501;
password = 4'b0011;
//#100 password_entered = 1'b0;
//vehicle_present = 1'b0;

#80;
vehicle_present = 1'b1;
password_entered = 1'b1;
vehicle_no = 32'd5601;
 password = 4'b0110;
//#100 password_entered = 1'b0;
//vehicle_present = 1'b0;

#50;
vehicle_present = 1'b1;
password_entered = 1'b1;
vehicle_no = 32'd1104;
password = 4'b0011;
//#100 password_entered = 1'b0;
//vehicle_present = 1'b0;

end

initial
begin
$monitor($time," S1: %b S2: %b Password: %b Password Check: %b and Car Entered: %b",DUT.s1, DUT.s2,DUT.password,password_check,car_parked);
#350 $finish;
end

endmodule
