// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module clk_div #(parameter X = 16)(
  
    /* Clocking signal */
    input wire clk,

    /* Divided clocking signal */
    output wire clk_divided
);

/* Counter for division */
reg [$clog2(X):0]cnt = 0;

/* Output is risen each X input clk's */
assign clk_divided = (cnt == X);

always @(posedge clk) begin

  /* Increment counter each input clk signal */
  cnt <= cnt + 1;

end

always @(negedge clk) begin

  /* Down output on the end of the input clk */
  if (clk_divided)
    cnt <= 0;

end

endmodule