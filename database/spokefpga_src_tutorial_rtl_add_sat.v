module add_sat( x, y, satsum );
  parameter limit = 8'H0A;
  input [3:0] x;
  input [3:0] y;
  output reg [4:0] satsum;
  always @(*) begin
    if ( x + y > limit)
      satsum = limit;
    else
      satsum = x + y;
    end
endmodule