// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../network_params.h"
module hex_out_tb;
   reg clock;
   reg reset;
   reg [(`FFN_OUT_WIDTH*`NUM_CLASSES)-1:0] test_in;
   wire [6:0] 				   test_out;
   
	reg [`FFN_OUT_BITWIDTH:0] 		   in0;
   reg [`FFN_OUT_BITWIDTH:0] 		   in1;
   reg [`FFN_OUT_BITWIDTH:0] 		   in2;
   reg [`FFN_OUT_BITWIDTH:0] 		   in3;
   reg [`FFN_OUT_BITWIDTH:0] 		   in4;
   reg [`FFN_OUT_BITWIDTH:0] 		   in5;
   reg [`FFN_OUT_BITWIDTH:0] 		   in6;
   reg [`FFN_OUT_BITWIDTH:0] 		   in7;
   reg [`FFN_OUT_BITWIDTH:0] 		   in8;
   reg [`FFN_OUT_BITWIDTH:0] 		   in9;
   wire [(`FFN_OUT_WIDTH*`NUM_CLASSES)-1:0] in_vec;
   assign in_vec = {in9,in8,in7,in6,in5,in4,in3,in2,in1,in0};
	
   hex_out_final dut(
		   .clock(clock),
		   .reset(reset),
		   .data(in_vec),
		   .hex(test_out)
		   );
   

   

initial begin
   clock = 1'b0;
   reset = 1'b0;
end
   
   always 
     #5 clock = !clock;
   
   initial begin
      in0 = 5;
      in1 = 5;
      in2 = 5;
      in3 = 5;
      in4 = 5;
      in5 = 5;
      in6 = 5;
      in7 = 5;
      in8 = 5;
      in9 = 5;
      #20 reset = 1'b1;
      
      #20 reset = 1'b0;
      
      #20 reset = 1'b1;
      
      # 10
	if(test_out == 7'b1110111) begin
	   $display ("Pass");
	end else begin
	   $display ("Fail!!!");
	   $display ("test_in: %d", in_vec);
	   $display ("test_out: %d", test_out); 
	end 
      
      #20 in0 = 10;
      # 10
	if(test_out == 7'b1000000) begin
	   $display ("Pass");
	end else begin
	   $display ("Fail!!!");
	   $display ("rect_in: %d", in_vec);
	   $display ("test_out: %d", test_out); 
	end 
      #20 in1= `FFN_OUT_WIDTH'hffffffffffffffff;
		# 10
	if(test_out == 7'b1000000) begin
	   $display ("Pass");
	end else begin
	   $display ("Fail!!!");
	   $display ("rect_in: %d", in_vec);
	   $display ("test_out: %d", test_out); 
	end 
		
		
      # 100
	$stop;
      
   end
endmodule
