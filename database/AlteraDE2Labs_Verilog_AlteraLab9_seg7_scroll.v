module seg7_scroll (ADDR, Clock, data, wren, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
  input [15:0] ADDR;
  input Clock;
  input [15:0] data;
  input wren;
  output reg [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

  reg [0:6] H0, H1, H2, H3, H4, H5, H6, H7;



  always @ (posedge Clock) begin
    case (ADDR[2:0])
      3'b000: HEX0 = data[6:0];
      3'b001: HEX1 = data[6:0];
      3'b010: HEX2 = data[6:0];
      3'b011: HEX3 = data[6:0];
      3'b100: HEX4 = data[6:0];
      3'b101: HEX5 = data[6:0];
      3'b110: HEX6 = data[6:0];
      3'b111: HEX7 = data[6:0];
    endcase
  end
endmodule
