module top
#(parameter param47 = (8'hb1), 
parameter param48 = (((({param47, param47} ? {param47} : (param47 ? param47 : param47)) ? ((param47 ? param47 : param47) ? (param47 ^ param47) : (~param47)) : ((param47 < (7'h40)) ^~ (param47 >> param47))) ~^ ((~param47) ? (~|((8'h9c) ? param47 : param47)) : (8'ha0))) ^ (param47 + (-(|(param47 ^ param47))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire33,
                 wire30,
                 wire4,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg32,
                 (1'h0)};
  assign wire4 = $signed($signed($signed(wire3[(2'h2):(1'h1)])));
  module5 #() modinst31 (wire30, clk, wire4, wire0, wire1, wire2);
  always
    @(posedge clk) begin
      reg32 <= (8'hb8);
    end
  assign wire33 = wire30[(4'hc):(4'ha)];
  always
    @(posedge clk) begin
      reg34 <= wire0[(4'hc):(4'h8)];
      if (wire3[(1'h0):(1'h0)])
        begin
          reg35 <= $unsigned($unsigned((wire3[(3'h6):(3'h5)] ?
              (&{wire2, reg34}) : {(|(8'ha8))})));
        end
      else
        begin
          if (wire33)
            begin
              reg35 <= $unsigned({wire3[(3'h5):(2'h2)]});
              reg36 <= wire33;
              reg37 <= reg32;
              reg38 <= {{($signed((8'hb9)) << ((^(8'ha7)) >= $unsigned(wire2)))},
                  (((&{wire33, wire2}) ?
                          (!(wire0 & reg34)) : wire30[(2'h2):(2'h2)]) ?
                      wire4[(3'h7):(3'h5)] : {$unsigned((~&wire1)),
                          $signed($signed(reg35))})};
            end
          else
            begin
              reg35 <= $signed($unsigned($unsigned(wire33)));
              reg36 <= (8'had);
              reg37 <= (wire0 * $signed($unsigned(reg37[(3'h6):(3'h6)])));
            end
          reg39 <= {$signed(wire2), $signed((wire1[(2'h2):(1'h1)] || reg37))};
        end
      reg40 <= (8'hbf);
      reg41 <= (wire1 ?
          (wire2 ? reg32 : {reg34[(3'h6):(3'h4)], reg39}) : wire3);
    end
  assign wire42 = $unsigned(wire2[(5'h11):(3'h7)]);
  assign wire43 = $signed(reg32);
  assign wire44 = reg37[(3'h7):(2'h2)];
  assign wire45 = $signed(wire0);
  assign wire46 = (-((((wire43 <= (8'hb4)) || {reg41, wire4}) ?
                      ((wire43 ^ wire2) ?
                          (wire33 ^~ (8'hb1)) : (|reg37)) : $unsigned(((8'hb1) != wire30))) >= {$unsigned($unsigned(wire45)),
                      (~(!reg34))}));
endmodule

module module5
#(parameter param28 = {{(+(((8'ha6) & (8'hac)) & (^(8'hb6)))), ((+{(8'hb1), (8'hab)}) ? ({(8'h9c), (8'haf)} ? ((8'ha1) >> (8'hbc)) : {(7'h44)}) : (((7'h44) ^~ (8'hb2)) ^~ (~&(8'hbc))))}, (({(!(8'hb4)), ((8'ha6) ? (8'ha3) : (8'h9d))} != (+((8'had) ^~ (8'haf)))) ? (({(8'h9e), (8'hb4)} ? (&(8'ha3)) : (~&(8'hbc))) - (((7'h43) ? (8'haa) : (8'hae)) ? (^~(7'h44)) : (7'h44))) : (((^~(8'ha1)) ? ((8'had) ? (8'ha2) : (8'hbb)) : ((8'hb6) >>> (8'hba))) & (+((8'haf) <= (8'haf)))))}, 
parameter param29 = (8'ha2))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire23;
  assign y = {wire27, wire26, wire25, wire23, (1'h0)};
  module10 #() modinst24 (.clk(clk), .wire12(wire9), .wire11(wire8), .wire14(wire6), .wire13(wire7), .y(wire23));
  assign wire25 = {$unsigned((((7'h41) ^ wire8) ?
                          ((~&wire23) ?
                              wire9 : $signed(wire6)) : $signed((wire8 != wire23))))};
  assign wire26 = $signed(({$unsigned($unsigned(wire9))} <<< $unsigned(wire7)));
  assign wire27 = wire8[(4'hb):(1'h1)];
endmodule

module module10
#(parameter param22 = (((({(8'hb3), (8'hb2)} ? {(8'hba)} : ((8'hba) ? (8'hac) : (8'hb4))) ? ((~|(8'hac)) * (+(8'ha4))) : (8'hb5)) ^ {(((8'hb7) ? (8'hb8) : (8'ha2)) << ((8'hb5) ^ (8'hab)))}) | (((((8'had) && (8'ha2)) ? ((8'h9f) ? (7'h40) : (8'hb3)) : (!(8'hb6))) ? (((8'hbe) ? (8'h9c) : (8'ha5)) + ((8'ha3) ~^ (8'hbf))) : {(8'hbe)}) < ((+((8'ha4) ? (8'hb1) : (8'hbd))) ? (((8'hb2) < (8'hb8)) >= ((8'hb7) ? (8'hab) : (8'hb3))) : (8'h9d)))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire14;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire [(4'hc):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  assign y = {wire21, wire20, wire19, wire18, wire17, wire16, wire15, (1'h0)};
  assign wire15 = {$signed({$signed(((8'hbe) & wire11)),
                          ((wire13 <= wire11) ? (+wire14) : (^~wire11))})};
  assign wire16 = $unsigned(wire15[(1'h0):(1'h0)]);
  assign wire17 = (~&(+(^~(~wire14))));
  assign wire18 = wire14;
  assign wire19 = (((wire16 == {$signed(wire15)}) ?
                          {wire11} : $unsigned((wire12 ^~ {(8'haa), wire16}))) ?
                      (wire15[(3'h7):(3'h7)] >>> $signed($unsigned(((8'hbc) || wire11)))) : wire15);
  assign wire20 = (((7'h40) == ((^~(wire19 ?
                      wire13 : wire12)) - $unsigned($signed(wire16)))) != wire17);
  assign wire21 = $unsigned({$signed(wire18),
                      (!(((8'ha7) > wire12) ? {wire12} : (8'ha0)))});
endmodule
