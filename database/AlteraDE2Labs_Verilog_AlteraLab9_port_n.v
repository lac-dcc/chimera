module port_n (Clock, SW, wren, out);
  input [15:0] SW;
  input Clock;
  output reg [15:0] out;
  input wren;



  always @ (posedge Clock) begin
    out <= SW;
  end
endmodule
