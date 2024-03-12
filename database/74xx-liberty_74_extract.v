module _74xx_counter8 (
  input rst,
  input clk,
  input [7:0] preset,
  output reg [7:0] counter
);
    always @ (posedge clk) begin
      if (!rst) begin
        counter <= preset;
      end else begin
        counter <= counter + 1'b1;
      end
    end
endmodule

module _74xx_counter16 (
  input rst,
  input clk,
  input [15:0] preset,
  output reg [15:0] counter
);
    always @ (posedge clk) begin
      if (!rst) begin
        counter <= preset;
      end else begin
        counter <= counter + 1'b1;
      end
    end
endmodule

module _74xx_counter32 (
  input rst,
  input clk,
  input [32:0] preset,
  output reg [31:0] counter
);
    always @ (posedge clk) begin
      if (!rst) begin
        counter <= preset;
      end else begin
        counter <= counter + 1'b1;
      end
    end
endmodule

