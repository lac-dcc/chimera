//Module CRC-16-test 
//Module function: The module is a crc16 check code serial coding circuit, 
//This encoding circuit encodes the data entered serially 
module CRC_16_serial_test; 
reg clk; 
reg rst; 
reg load; 
reg d_finish; 
reg crc_in; 
wire crc_out;//wire-net data, 1bit 
parameter clk_period = 40; //The clk cycle is 40ns 
initial //initializes the relevant value
begin 
 #clk_period clk = 1; 
 #clk_period rst = 1; 
 #clk_period rst = 0; 
 #clk_period crc_in = 1; // Enter the data to be encoded
 #clk_period load = 1; 
 #clk_period load = 0; 
 #clk_period d_finish = 0; 
 #(80*clk_period) d_finish = 1; 
 #clk_period d_finish = 0; 
end
always #(clk_period/2) clk = ~clk; //Change the power level every 20ns
always #(2*clk_period) crc_in = ~crc_in; // change the input level for the word to be encoded every 80ns 

//Call the serial encoding module
CRC_16_serial u1(.clk(clk), .rst(rst), .load(load), .d_finish(d_finish), .crc_in(crc_in), .crc_out(crc_out)); 

endmodule
