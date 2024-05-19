// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License


`define counter_instance 89

module test_up_counter32_async_unit (en, clock0, reset, count);
input clock0, reset;
output [31:0] count;
reg [31:0] count;
input wire en;                                   

always @ (posedge clock0 or posedge reset)
if (reset) begin
  count <= 0;
end 
else if(en) begin
  count <= count + 1;
end

endmodule  


module counterup32_1clk_async_reset_n_instances(id, clock0, reset, count);
input clock0, reset;
output wire [31:0] count;
input [0:$clog2(`counter_instance) - 1] id;
wire [31:0] count_w[0:`counter_instance - 1];
reg [`counter_instance - 1:0] en;



always @(*)begin
  if(reset)begin
    en = 0;
  end
  else begin
    en[id] = 1;
  end
end
generate
genvar k;
for(k=0;k<`counter_instance;k=k+1)begin
  test_up_counter32_async_unit a0(en[k], clock0, reset, count_w[k]);
end
endgenerate

assign count = count_w[id];
/* 
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, counterup32_1clk_async_reset_n_instances);
    end
*/    
endmodule

