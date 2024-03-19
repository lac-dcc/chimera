/*****************************************************************************/
/*   SHA 256 module testbench, 24bit input, 32bit output version             */ 
/*   Aishwarya Nagarajan, UW-Madison, ERCBench Researcher                    */
/*   Inputs: clk, rst, valid, msg_in (24bits)                                */
/*   Outputs: ready, msg_out (32 bits)                                      */
/*****************************************************************************/

//declaring module
module t_sha2_multi_out();
   
   //declaring input and output regs and wires
   reg clk, rst, valid;
   reg [23:0] msg_in;
   wire [31:0] msg_out; 
   wire ready;
   
   //instantiating UUT 
   sha2_multi_out UUT (clk, rst, valid, msg_in, msg_out, ready);
   
   //defining clock
   initial clk=1'b0;
   always @(clk) clk<= #5 ~clk;

   //assigning 24bit input along with valid signal
   initial begin
       rst = 1'b1; //initial reset signal
       valid = 1'b0;
       #11 rst = 1'b0;
       #10 valid = 1'b1;
       msg_in = 24'b01100001_01100010_01100011;
       #720 msg_in = 24'b00000000_00000000_00000000;
       #720 msg_in = 24'b11111111_11111111_11111111;
       #720 msg_in = 24'b11000011_10101010_00001111;
       #720 msg_in = 24'b11111111_00000000_11111111;
       #720 msg_in = 24'b00000000_11111111_00000000;
       #720 msg_in = 24'b11100010_00011101_01010101;
       #720 msg_in = 24'b01111110_10000001_11110101;
       #720 msg_in = 24'b01101001_01101001_01101001;
       #720 msg_in = 24'b11000011_00111100_11001100;
   end  
   
   //force end of simulation
   initial begin
       #10000 $stop; 
   end
   
endmodule

