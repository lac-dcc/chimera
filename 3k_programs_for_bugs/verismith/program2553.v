module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire63,
                 wire61,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire15,
                 wire5,
                 wire4,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire4;
  module6 #() modinst16 (wire15, clk, wire3, wire2, wire5, wire0);
  assign wire17 = (&$signed(((~&(^~wire15)) | wire4[(1'h1):(1'h1)])));
  assign wire18 = wire3[(4'he):(4'he)];
  assign wire19 = $signed(wire2);
  assign wire20 = $signed(wire2[(4'ha):(2'h3)]);
  assign wire21 = {(8'hb6), wire0[(2'h2):(1'h1)]};
  assign wire22 = $unsigned(((($unsigned((8'hb3)) < $unsigned(wire4)) ?
                          $unsigned(wire18) : $signed((wire20 > wire15))) ?
                      wire2[(3'h5):(1'h1)] : $unsigned((wire0 ?
                          (~|wire1) : wire17))));
  module23 #() modinst62 (.wire25(wire4), .clk(clk), .wire26(wire21), .wire24(wire3), .y(wire61), .wire27(wire1));
  assign wire63 = (~(8'ha3));
  always
    @(posedge clk) begin
      reg64 <= wire17[(4'h8):(3'h4)];
      reg65 <= $unsigned((7'h41));
      reg66 <= (wire3[(4'ha):(3'h6)] ?
          $signed((&((wire20 != (8'hb5)) ?
              wire63 : (~&wire2)))) : reg64[(3'h5):(1'h0)]);
    end
  assign wire67 = ((+{wire20[(2'h2):(1'h0)]}) ?
                      ((((wire4 ? wire21 : wire63) ? $signed(wire15) : wire61) ?
                              (-$signed(wire3)) : (!(wire20 ?
                                  (8'ha7) : reg65))) ?
                          wire22[(2'h3):(1'h1)] : $signed(wire5)) : $signed((($unsigned((8'h9d)) & (&wire18)) ?
                          (-(wire4 ^~ wire19)) : (wire1 ?
                              ((8'ha2) != reg66) : wire4[(2'h2):(2'h2)]))));
  assign wire68 = wire3;
  assign wire69 = ($unsigned((wire68[(1'h1):(1'h1)] ?
                          (&$signed(wire3)) : reg65[(4'h8):(3'h5)])) ?
                      wire18[(2'h2):(2'h2)] : $signed((7'h40)));
  assign wire70 = $unsigned($unsigned(wire5));
  assign wire71 = wire5[(4'hc):(4'ha)];
endmodule

module module23
#(parameter param59 = ((&(8'hbf)) >= (({((8'hbc) >= (8'h9d))} || ({(8'ha6)} < ((7'h44) ~^ (8'ha7)))) ? ((+{(8'ha8), (8'ha9)}) ~^ (((8'ha9) <= (8'hbb)) > (7'h41))) : (^~({(8'hb6), (8'hbe)} != ((8'hbf) && (7'h43)))))), 
parameter param60 = (8'ha9))
(y, clk, wire24, wire25, wire26, wire27);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire24;
  input wire signed [(3'h5):(1'h0)] wire25;
  input wire [(4'h8):(1'h0)] wire26;
  input wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire57;
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  assign y = {wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire36,
                 wire57,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire28 = (+$signed(wire26[(2'h3):(2'h2)]));
  assign wire29 = ($unsigned($signed({(-wire25),
                      $unsigned(wire26)})) <<< $unsigned($unsigned({$unsigned(wire25),
                      (wire27 ? wire27 : (8'h9c))})));
  assign wire30 = wire29[(4'hf):(4'hd)];
  assign wire31 = (|(wire28[(3'h5):(2'h2)] ?
                      $unsigned(wire26) : (~(|wire25[(3'h5):(2'h3)]))));
  assign wire32 = $signed($unsigned($signed({$unsigned(wire29), wire29})));
  assign wire33 = ((wire30 ~^ ($unsigned($signed(wire30)) ?
                      wire24 : {wire26})) < (($signed((wire31 ?
                      wire31 : (8'hb3))) < ((&wire24) <<< ((8'hb9) << (8'ha9)))) + wire31[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg34 <= wire27[(4'h9):(1'h1)];
      reg35 <= $unsigned(($unsigned((^~((8'hb1) >>> wire33))) ?
          ((~&$unsigned(wire27)) || (~&(8'hbf))) : ($signed(wire27[(3'h4):(1'h0)]) ^ wire24[(4'hb):(4'ha)])));
    end
  assign wire36 = ($signed((wire28 ^ $signed(wire27[(1'h0):(1'h0)]))) ?
                      $signed($unsigned($unsigned((wire24 ?
                          wire32 : wire33)))) : wire25);
  module37 #() modinst58 (.wire38(wire29), .wire39(reg34), .wire42(wire31), .y(wire57), .wire40(wire30), .wire41(reg35), .clk(clk));
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  assign y = {wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = wire10;
  assign wire12 = wire11;
  assign wire13 = wire9[(1'h0):(1'h0)];
  assign wire14 = ($unsigned(wire10) ~^ wire11);
endmodule

module module37
#(parameter param56 = ((+(((+(8'ha0)) ? (!(8'ha7)) : (!(8'ha7))) > (((8'hb0) >>> (8'h9f)) ? ((8'hba) ? (8'had) : (8'hbf)) : ((8'ha7) == (8'ha5))))) ? ((({(7'h41)} || (~|(7'h42))) ? ((~&(8'hab)) > {(8'hb6)}) : (&(8'h9e))) ? (-(((8'ha4) | (8'hb9)) == ((8'haa) ? (8'hb0) : (8'had)))) : {{((8'ha1) <<< (8'ha3)), ((8'h9d) >= (8'hb0))}, {{(8'h9d), (8'hb2)}}}) : ((^~{(+(8'ha5)), ((7'h43) ? (8'hba) : (8'hae))}) ? ((((8'ha6) ? (8'ha9) : (8'ha1)) ? ((8'hb9) ^~ (8'ha2)) : {(8'ha6), (8'ha2)}) ? {(~&(7'h41))} : ((!(8'hb6)) ? ((7'h43) ? (8'hbf) : (8'hbc)) : (8'hb7))) : {((-(8'hac)) ? (8'ha2) : ((8'hb5) ? (8'hac) : (8'hba))), (8'hb1)})))
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire42;
  input wire signed [(4'hf):(1'h0)] wire41;
  input wire [(4'h9):(1'h0)] wire40;
  input wire [(5'h14):(1'h0)] wire39;
  input wire [(2'h2):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  assign y = {wire55,
                 wire50,
                 wire49,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg48,
                 (1'h0)};
  assign wire43 = $signed((!wire40[(4'h8):(2'h3)]));
  assign wire44 = wire38[(1'h1):(1'h0)];
  assign wire45 = $signed(wire44[(2'h2):(1'h1)]);
  assign wire46 = ((^~wire41[(3'h5):(1'h1)]) == {$signed($signed(wire40))});
  assign wire47 = ($unsigned((wire42 ?
                      {$signed((8'hb0))} : ($unsigned(wire43) ?
                          (+wire46) : (wire45 ?
                              (8'hb0) : wire42)))) + wire40[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg48 <= wire46[(4'he):(3'h6)];
    end
  assign wire49 = $signed($signed((($signed(wire39) || wire43) ?
                      wire46 : $signed((+reg48)))));
  assign wire50 = $unsigned($unsigned(wire41[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      reg51 <= wire45;
      reg52 <= $signed(wire44[(4'hb):(1'h1)]);
      reg53 <= (8'hbd);
      reg54 <= {{((((8'hb9) ^ reg52) ? $signed((8'ha3)) : wire43) ?
                  {(reg48 > wire50), wire38[(1'h1):(1'h0)]} : $signed((wire43 ?
                      wire42 : reg51))),
              $signed(($signed((8'h9e)) == (8'hb0)))}};
    end
  assign wire55 = $signed((~^(reg48 ^~ ($signed(wire50) >= $unsigned(wire46)))));
endmodule
