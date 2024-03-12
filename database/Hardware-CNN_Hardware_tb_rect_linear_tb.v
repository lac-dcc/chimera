`include "../network_params.h"
module rect_linear_tb;
 reg clock;
 reg reset;
 reg [`NN_BITWIDTH:0] rect_in;
 wire [`NN_BITWIDTH:0] rect_out;

rect_linear dut(
  .clock(clock),
  .reset(reset),
  .rect_in(rect_in),
  .rect_out(rect_out)
);

initial begin
  clock = 1'b0;
  reset = 1'b0;
  rect_in = 1'b0;
end

always 
  #5 clock = !clock;

initial begin
  #20 reset = 1'b1;

  #20 reset = 1'b0;

  #20 
  reset = 1'b1;
  rect_in = $random;
  
  # 10
  if(rect_in[`NN_BITWIDTH] == 1'b1 && rect_out == `NN_WIDTH'd0) begin
    $display ("Pass");
  end else if(rect_in[`NN_BITWIDTH] == 1'b0 && rect_out == rect_in) begin
    $display ("Pass");
  end else begin
    $display ("Fail!!!");
    $display ("rect_in: %d", rect_in);
    $display ("rect_out: %d", rect_out); 
  end 
 
  #20 
  rect_in = $random;
  
  # 10
  if(rect_in[`NN_BITWIDTH] == 1'b1 && rect_out == `NN_WIDTH'd0) begin
    $display ("Pass");
  end else if(rect_in[`NN_BITWIDTH] == 1'b0 && rect_out == rect_in) begin
    $display ("Pass");
  end else begin
    $display ("Fail!!!");
    $display ("rect_in: %d", rect_in);
    $display ("rect_out: %d", rect_out); 
  end 
 
   #20 
  rect_in = $random;
  
  # 10
  if(rect_in[`NN_BITWIDTH] == 1'b1 && rect_out == `NN_WIDTH'd0) begin
    $display ("Pass");
  end else if(rect_in[`NN_BITWIDTH] == 1'b0 && rect_out == rect_in) begin
    $display ("Pass");
  end else begin
    $display ("Fail!!!");
    $display ("rect_in: %d", rect_in);
    $display ("rect_out: %d", rect_out); 
  end 
  
 # 100
   $finish;
	
end
endmodule
