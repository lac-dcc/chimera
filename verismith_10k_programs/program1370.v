module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire9,
                 wire8,
                 wire7,
                 wire4,
                 reg10,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (wire0[(3'h7):(3'h7)] ?
                     ((((wire2 ? wire1 : wire3) >>> $unsigned(wire2)) ?
                             wire0 : wire2[(4'hb):(3'h6)]) ?
                         (~(~^((8'hb9) ?
                             wire1 : wire3))) : $signed(wire2[(2'h3):(1'h1)])) : wire3);
  always
    @(posedge clk) begin
      reg5 <= $unsigned(($signed($signed((wire0 ?
          wire4 : wire0))) && $unsigned(wire0)));
      reg6 <= wire4[(3'h4):(3'h4)];
    end
  assign wire7 = ((^~((wire2 ?
                         (wire0 ? reg5 : wire1) : ((8'had) ?
                             wire2 : wire3)) & (wire2[(4'h9):(1'h1)] ?
                         (wire2 ? wire1 : wire0) : {reg5, wire4}))) ?
                     ($signed((|$signed(wire2))) ?
                         ($unsigned($signed(wire3)) || wire2) : ((&(wire3 <<< wire3)) ?
                             $unsigned($unsigned(reg6)) : $signed(reg5))) : $signed(reg6));
  assign wire8 = wire4;
  assign wire9 = ((($signed(reg5) && {(8'ha2), (wire2 == (8'hb8))}) ?
                     wire1 : (&wire3)) > ($signed(wire0) - (({wire2, (8'hb9)} ?
                     {wire3, wire0} : wire7) <= wire7[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg10 <= wire1[(1'h0):(1'h0)];
    end
  assign wire11 = (|{(wire1 && $signed(wire3[(2'h3):(1'h1)])), wire0});
  assign wire12 = wire3[(2'h2):(1'h0)];
endmodule
