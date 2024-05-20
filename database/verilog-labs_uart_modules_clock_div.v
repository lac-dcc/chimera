// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module clock_div #(parameter X = 16)(
  
  /* Non-divided input signal */
  input wire clk,

  /* Reset signal */
  input wire reset,

  /* Divided result signal */
  output wire clk_divided
);

/* Divider counter */
reg [$clog2(X):0]cnt = 0;

/* Rise output signal every X input clocks */
assign clk_divided = !reset && (cnt == X);

always @(posedge clk) begin

  /* 
   * Increment counter every input clock 
   * Reset divider counter on reset signal
   */
  cnt <= (reset)? 1 : cnt + 1;
end

always @(negedge clk) begin
  
  /* 
   * Make output clock signal the 
   * same width as input clocking 
   */
  if (clk_divided)
    cnt <= 0;
end

endmodule
