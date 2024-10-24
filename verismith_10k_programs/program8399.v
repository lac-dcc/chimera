module top
#(parameter param40 = (((~{((8'ha4) ? (8'hb1) : (8'ha8))}) ? ((((8'hb1) ? (8'h9e) : (8'ha5)) - {(8'hbd), (8'hb7)}) <<< {((8'hb0) ? (8'ha3) : (8'h9d)), ((8'ha3) ? (8'hbd) : (8'h9f))}) : {{((8'hb1) ? (8'hbd) : (8'hb2)), {(8'hac)}}, (~^((8'hbd) ^ (7'h43)))}) < (((((7'h44) ? (8'ha6) : (8'h9f)) ^ ((8'h9c) ? (8'hbd) : (8'ha2))) ? (~((8'hab) > (8'hbe))) : (((7'h43) ? (8'hb9) : (8'hbc)) ? ((8'hb3) ^~ (8'hb6)) : {(8'h9d), (8'hbd)})) > ((-(8'hac)) ? ({(8'hac)} << (|(8'ha9))) : (((7'h42) && (8'ha8)) ? ((8'hb6) - (8'hb8)) : ((8'hac) != (8'hb6)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire38;
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire38,
                 (1'h0)};
  assign wire4 = ((({(|wire1),
                         (wire1 ?
                             wire3 : wire3)} && {wire2}) << wire1[(4'hd):(3'h5)]) ?
                     $unsigned((-(((8'hbe) ? wire3 : wire3) ?
                         wire0[(4'hf):(4'ha)] : $signed(wire0)))) : $unsigned(wire0));
  assign wire5 = {(wire0[(4'hf):(4'hf)] ?
                         (wire4[(4'he):(2'h2)] >> (wire4[(3'h6):(2'h2)] ~^ wire2)) : {{wire2,
                                 wire4[(3'h4):(1'h0)]},
                             $unsigned($signed(wire1))}),
                     wire1[(4'h8):(1'h0)]};
  assign wire6 = $signed($unsigned($unsigned({(-(8'ha8)), (!wire2)})));
  assign wire7 = wire6;
  assign wire8 = (($signed($unsigned((wire3 ? wire3 : wire1))) ?
                         $signed((wire1 || (wire5 ?
                             wire6 : wire1))) : $unsigned(($unsigned(wire6) ?
                             (wire7 ? wire2 : wire1) : {wire4, (8'hbe)}))) ?
                     wire5 : ($signed(wire3) ? (~^wire4) : wire5));
  assign wire9 = $signed(wire0);
  assign wire10 = wire9;
  assign wire11 = $unsigned((~wire6));
  assign wire12 = ((^~(wire3 - (wire6[(3'h4):(3'h4)] ?
                      $signed(wire5) : ((7'h43) * wire1)))) && $unsigned($signed(($signed(wire11) ?
                      (wire8 + wire5) : $signed(wire3)))));
  assign wire13 = $unsigned(wire7[(1'h1):(1'h0)]);
  assign wire14 = ($unsigned($unsigned({wire6[(3'h6):(2'h3)]})) > wire8[(4'h9):(3'h4)]);
  module15 #() modinst39 (.y(wire38), .wire18(wire1), .wire20(wire0), .clk(clk), .wire19(wire10), .wire16(wire3), .wire17(wire11));
endmodule

module module15
#(parameter param36 = ({((((8'haa) != (8'hb2)) + ((8'hae) || (8'hae))) == (~|(~(8'h9d)))), ((((8'ha2) <= (8'hbd)) + (^(8'hb5))) ? (((8'hae) >> (8'ha7)) * ((8'ha0) * (8'h9f))) : (((8'ha0) ^ (8'h9c)) >> (~(8'h9c))))} | ((^~{((8'h9d) ? (8'ha2) : (8'h9c)), ((8'ha4) & (7'h40))}) ? (8'h9d) : {(8'haa), ((~^(8'ha4)) ? (^~(7'h40)) : ((8'had) ? (8'hac) : (8'h9c)))})), 
parameter param37 = (((^~param36) >= param36) < param36))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire23,
                 wire22,
                 wire21,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire21 = wire17;
  assign wire22 = {wire18};
  assign wire23 = ($unsigned({$unsigned(wire22)}) <<< wire21[(4'h9):(2'h3)]);
  always
    @(posedge clk) begin
      reg24 <= $signed({((wire20 ?
              (~^wire20) : (wire18 ? wire17 : wire17)) + {(wire22 ?
                  wire18 : (8'h9c)),
              $signed(wire23)})});
      reg25 <= $signed($signed(((&((8'haa) != wire19)) || ((wire19 ?
              wire23 : wire18) ?
          ((8'hbf) ? wire19 : reg24) : (wire17 ? (8'ha3) : wire19)))));
      reg26 <= ($unsigned(wire20) ?
          reg25 : $unsigned((^~(!$unsigned(wire17)))));
    end
  assign wire27 = $unsigned(($unsigned((-$signed(reg24))) ?
                      (wire18 + (|$signed(reg24))) : (~^{(wire17 >>> reg26),
                          reg26[(4'hf):(3'h4)]})));
  assign wire28 = $signed($unsigned(wire20));
  assign wire29 = $unsigned($unsigned(({wire16,
                      wire28[(3'h5):(3'h5)]} << ((&wire17) && $unsigned((8'hab))))));
  assign wire30 = reg26[(3'h6):(2'h3)];
  assign wire31 = ($signed({wire22,
                      $unsigned((wire29 ? reg25 : wire17))}) || wire19);
  assign wire32 = $signed({wire23, wire30});
  assign wire33 = wire31[(4'hf):(4'he)];
  assign wire34 = wire17;
  assign wire35 = $unsigned($unsigned(wire32));
endmodule
