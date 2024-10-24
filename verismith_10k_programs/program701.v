module top
#(parameter param10 = (~^(8'ha4)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire4;
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire9, wire8, wire7, wire6, wire4, reg5, (1'h0)};
  assign wire4 = (^{wire1, (wire3[(4'h9):(4'h9)] & {wire2})});
  always
    @(posedge clk) begin
      reg5 <= ((-(~&{(~&(8'haf))})) > ((&(+wire1[(5'h10):(4'hb)])) ?
          wire4 : {({wire3} || $unsigned(wire1)), (&wire0[(4'h9):(3'h7)])}));
    end
  assign wire6 = ((~$unsigned(wire3[(3'h6):(2'h2)])) >>> $unsigned(reg5));
  assign wire7 = wire6[(4'h8):(2'h2)];
  assign wire8 = $signed((($unsigned((~^reg5)) ~^ (~^(wire0 << reg5))) ?
                     reg5[(3'h6):(3'h5)] : (reg5[(3'h4):(3'h4)] ^~ $signed((!reg5)))));
  assign wire9 = $signed(((|{$unsigned(wire7),
                     (wire6 < wire7)}) + $unsigned(($unsigned(wire8) >> (wire1 - reg5)))));
endmodule
