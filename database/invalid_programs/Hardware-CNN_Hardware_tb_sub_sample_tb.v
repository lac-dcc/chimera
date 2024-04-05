`include "../network_params.h"
module sub_sample_tb;
 reg clock;
 reg reset;
 reg [`NH_VECTOR_BITWIDTH:0] sub_in;
 wire [`POOL_OUT_BITWIDTH:0] sub_out;
 wire [`POOL_OUT_BITWIDTH:0] element[`NEIGHBORHOOD_SIZE-1:0];
 reg [`POOL_OUT_BITWIDTH:0] tb_mean;

sub_sample dut(
  .clock(clock),
  .reset(reset),
  .nh_vector(sub_in),
  .pool_out(sub_out)
);

initial begin
  clock = 1'b0;
  reset = 1'b0;
  sub_in = 1'b0;
  tb_mean = `NN_WIDTH'd0;
end

always 
  #5 clock = !clock;

// loop ints
//integer i;
integer j;

genvar i;
generate
	for(i=0; i < `NEIGHBORHOOD_SIZE; i=i+1) begin : nh_assignment
		assign element[i] = sub_in[(`NN_WIDTH*i)+`NN_BITWIDTH:i*`NN_WIDTH];
	end  
endgenerate


initial begin
  #20 reset = 1'b1;

  #20 reset = 1'b0;

  #20 
  reset = 1'b1;
  sub_in = {$random, $random};
  
  #30
  for(j=0; j < `NEIGHBORHOOD_SIZE; j=j+1) begin 
	  $display ("Element %d = %d", j, element[j]);
		tb_mean = tb_mean +element[j];
		$display("element %d = %d",j,element[j]);
  end
	$display ("tb_mean %d sum = %d", j, tb_mean);
  tb_mean = tb_mean/`NEIGHBORHOOD_SIZE;
  $display ("tb_mean %d", tb_mean);	
  $display ("dut mean: %d", sub_out);

  if(tb_mean == sub_out) begin
    $display("PASS!");
  end else begin
    $display("FAIL!");
  end


 # 100
   $stop;
	
end
endmodule
