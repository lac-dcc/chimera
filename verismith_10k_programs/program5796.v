module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire4 = $unsigned($signed($unsigned(($signed(wire2) ?
                     wire1[(1'h1):(1'h0)] : wire0[(4'h9):(3'h4)]))));
  assign wire5 = (wire1[(4'hc):(3'h4)] ?
                     ((($unsigned(wire3) == wire1[(1'h0):(1'h0)]) ?
                         wire3[(4'h8):(4'h8)] : ($unsigned(wire2) ~^ wire4[(3'h5):(3'h5)])) <<< $unsigned(((^wire1) ?
                         wire3 : wire1[(4'he):(1'h1)]))) : wire2[(4'hf):(2'h3)]);
  assign wire6 = {(~|(~wire3[(1'h1):(1'h0)]))};
  assign wire7 = ({wire5[(4'hd):(1'h1)]} ^ wire0[(4'h8):(3'h7)]);
  assign wire8 = (wire3[(4'h9):(2'h3)] ?
                     wire2[(1'h0):(1'h0)] : {((~^(~wire0)) * (wire1 ?
                             ((8'ha0) ? wire2 : wire0) : (8'ha4)))});
  assign wire9 = wire2[(1'h1):(1'h0)];
  assign wire10 = (wire2 == $signed(wire6[(1'h0):(1'h0)]));
  assign wire11 = $signed(wire5[(1'h1):(1'h1)]);
  assign wire12 = (^(((((8'hbc) ^~ wire10) ?
                          wire11[(3'h5):(2'h3)] : $signed((7'h42))) ?
                      (wire10[(2'h2):(2'h2)] ?
                          wire7 : wire11[(3'h4):(2'h2)]) : wire10) ~^ {($unsigned((7'h43)) & $unsigned(wire5))}));
  always
    @(posedge clk) begin
      reg13 <= (~$signed(wire11[(3'h5):(3'h4)]));
      reg14 <= (|(|wire10[(1'h0):(1'h0)]));
      reg15 <= (^$signed($unsigned({(8'hb3), (wire5 + wire9)})));
      reg16 <= wire7;
      reg17 <= (8'hbe);
    end
endmodule
