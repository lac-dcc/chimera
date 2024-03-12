// Quick blinking a LED

/* module */
module counter (
  input rst,
  input clk,
  output led
    
);

    /* reg */
    reg [7:0] counter = 0;
    reg state;
    
    /* assign */
    assign led = counter[7];
    
    /* always */
    always @ (posedge clk) begin
      if (!rst) begin
        counter <= 8'b0;
      end else begin
        counter <= counter + 1'b1;
      end
    end

endmodule
