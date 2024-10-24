module top
#(parameter param11 = (&(7'h40)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire10, wire9, wire8, wire5, wire4, reg7, reg6, (1'h0)};
  assign wire4 = ($signed(wire3) + wire1[(1'h1):(1'h0)]);
  assign wire5 = (&$signed($unsigned((((8'had) || wire1) | (-wire4)))));
  always
    @(posedge clk) begin
      reg6 <= (($unsigned($unsigned($unsigned((8'had)))) ?
          wire3 : wire4) >> (|$signed($signed(wire2[(4'hd):(3'h7)]))));
      reg7 <= (~&wire4);
    end
  assign wire8 = reg6;
  assign wire9 = wire2;
  assign wire10 = $signed((((!(~&wire5)) | {reg6[(4'hd):(3'h7)],
                      reg6[(4'hc):(1'h0)]}) && (-wire8[(3'h4):(1'h1)])));
endmodule
