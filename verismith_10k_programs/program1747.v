module top
#(parameter param22 = ((~^{(((7'h43) ? (8'hb6) : (8'hbc)) * {(8'hb2)})}) || (|((~&{(8'hbe), (8'hbf)}) ^~ (~&((8'hb6) <= (8'h9e)))))), 
parameter param23 = (^~(((-(~|param22)) | param22) == (+((^~param22) ? (~param22) : param22)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  assign y = {wire21,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg20,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = (&((((!wire1) ? (wire2 - wire3) : (~|wire2)) ?
                         (^~wire1[(3'h5):(1'h0)]) : $unsigned($unsigned(wire1))) ?
                     (-((~&wire1) || (wire2 ^~ wire3))) : $signed((wire1[(2'h3):(2'h3)] ?
                         $signed((8'haa)) : $unsigned(wire1)))));
  assign wire5 = $unsigned($unsigned($unsigned((|(^~wire0)))));
  assign wire6 = $unsigned((wire1 ?
                     (((^~wire0) ? $unsigned(wire4) : (wire3 < wire4)) ?
                         wire5 : $unsigned((|wire2))) : ((+$signed(wire2)) == (wire5 - (wire2 ?
                         (8'ha5) : wire0)))));
  assign wire7 = (+{(~^$signed(wire6)), wire3});
  assign wire8 = $unsigned((($unsigned(wire6[(3'h4):(3'h4)]) <<< ((~^wire0) <<< wire4[(3'h4):(2'h3)])) ?
                     (wire2[(2'h3):(1'h1)] & wire7) : (&wire0)));
  assign wire9 = ((~&wire5[(5'h10):(1'h1)]) ~^ $signed($unsigned(wire1[(4'h9):(2'h3)])));
  always
    @(posedge clk) begin
      reg10 <= {{$signed($unsigned($signed(wire7)))}};
      reg11 <= wire1[(3'h4):(2'h2)];
      reg12 <= $signed(wire7[(4'ha):(3'h5)]);
      reg13 <= wire5[(4'hf):(4'hf)];
    end
  assign wire14 = $unsigned($signed(wire4[(3'h4):(3'h4)]));
  assign wire15 = (wire3 ~^ {((~^$signed(reg11)) & wire0[(4'hc):(4'hb)])});
  assign wire16 = (~|($unsigned({(wire7 ? wire14 : (8'hbd)),
                          wire0[(4'hc):(4'ha)]}) ?
                      wire6[(1'h0):(1'h0)] : (!$unsigned(reg12))));
  assign wire17 = $unsigned({wire1[(3'h7):(2'h3)]});
  assign wire18 = ((8'h9f) ?
                      reg10[(4'hf):(4'h8)] : ($signed($unsigned((wire2 ^~ wire3))) || (((wire8 > wire4) ^~ (wire6 ?
                              wire7 : wire7)) ?
                          wire9[(1'h1):(1'h1)] : wire14)));
  assign wire19 = wire3;
  always
    @(posedge clk) begin
      reg20 <= (((^$unsigned(wire9)) - $signed($unsigned((wire0 <<< (8'ha8))))) << wire18);
    end
  assign wire21 = wire0;
endmodule
