module top
#(parameter param72 = (~&(~&(+(((8'h9d) ? (8'ha4) : (8'hb6)) ? ((8'hb1) <= (8'hae)) : (+(8'hae)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire68;
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire39,
                 wire41,
                 wire44,
                 wire45,
                 wire49,
                 wire52,
                 wire68,
                 reg51,
                 reg50,
                 reg48,
                 reg47,
                 reg46,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire5 = {(~&(-(wire3 ? (!wire2) : wire2[(5'h12):(4'he)])))};
  assign wire6 = $signed(wire0);
  assign wire7 = {wire0, wire0[(4'hb):(2'h2)]};
  assign wire8 = (wire1 ?
                     $signed($unsigned(wire0)) : ((wire3 >> (~^{wire7})) || $unsigned($signed((wire7 >> (8'hb3))))));
  assign wire9 = (((wire8[(2'h2):(1'h0)] != (8'ha2)) ?
                     wire8 : wire8) ^ wire5[(5'h11):(4'hd)]);
  assign wire10 = $signed($unsigned((($unsigned(wire8) ?
                          {wire4, (7'h43)} : (wire0 & (8'ha6))) ?
                      {{(8'h9e)},
                          (wire0 ? wire6 : wire6)} : {$unsigned((8'hb0))})));
  module11 #() modinst40 (.y(wire39), .wire13(wire9), .clk(clk), .wire12(wire4), .wire14(wire10), .wire15(wire1));
  assign wire41 = ($unsigned($unsigned({(^~wire6), (wire6 >> wire39)})) ?
                      (~^wire9[(3'h4):(3'h4)]) : $unsigned(({wire39[(2'h2):(1'h1)],
                          (wire1 | (8'hb5))} | wire5)));
  always
    @(posedge clk) begin
      reg42 <= (~|((-((8'hb2) - wire9[(4'hb):(4'hb)])) ?
          (~^((wire1 ? wire39 : wire2) ?
              wire7 : wire6[(3'h5):(2'h2)])) : wire41));
      reg43 <= (|{$unsigned($unsigned(wire2[(4'hf):(4'hc)])),
          {(^~$unsigned(wire10)), wire9[(2'h3):(2'h3)]}});
    end
  assign wire44 = $signed($unsigned($signed($unsigned((~|wire4)))));
  assign wire45 = ((8'hba) - wire41[(4'hd):(4'hb)]);
  always
    @(posedge clk) begin
      reg46 <= ($signed(wire1) + (-{$signed({wire9})}));
      reg47 <= (~|$signed($signed({$unsigned(wire5), wire39})));
      reg48 <= {((^(+reg46[(2'h3):(1'h1)])) >> (({wire9} ?
              (wire8 > (8'hb6)) : (wire9 ?
                  wire39 : wire4)) < $unsigned($signed(wire1)))),
          $unsigned(($signed($unsigned((8'hbc))) + wire7))};
    end
  assign wire49 = (wire8 ?
                      (wire4 ?
                          $signed({(wire7 & wire5),
                              (-wire10)}) : (wire7[(4'h8):(3'h5)] ?
                              (^~(wire2 >>> wire45)) : (wire4[(2'h2):(2'h2)] ?
                                  $signed(reg42) : $unsigned(wire3)))) : wire0[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg50 <= $unsigned((((!((8'haf) != wire7)) < ((reg46 ? wire44 : wire7) ?
              reg47[(1'h0):(1'h0)] : $signed(wire6))) ?
          $unsigned($unsigned((~&(8'ha5)))) : wire5));
      reg51 <= $signed((~$signed(wire4)));
    end
  assign wire52 = ((^wire10) ?
                      {$unsigned((7'h41)),
                          ($signed({reg48, (8'hbd)}) ?
                              (((8'hbc) || wire41) ?
                                  (wire1 == wire1) : (wire44 ?
                                      wire44 : reg51)) : (^{wire5}))} : $signed(wire2[(4'he):(2'h3)]));
  module53 #() modinst69 (wire68, clk, wire41, wire6, wire0, wire8, wire10);
  assign wire70 = $unsigned(wire10[(4'hf):(4'hb)]);
  assign wire71 = wire7;
endmodule

module module53  (y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire58;
  input wire signed [(3'h4):(1'h0)] wire57;
  input wire [(4'ha):(1'h0)] wire56;
  input wire signed [(4'h8):(1'h0)] wire55;
  input wire signed [(4'h9):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 reg67,
                 (1'h0)};
  assign wire59 = {$unsigned(wire56[(3'h4):(1'h1)])};
  assign wire60 = $unsigned(({$signed($unsigned(wire58)),
                          wire54[(4'h8):(3'h4)]} ?
                      (((wire57 | wire56) && wire54[(3'h7):(3'h4)]) ^~ $unsigned((wire59 ?
                          wire58 : wire55))) : $signed(($unsigned(wire56) ?
                          (wire56 * wire57) : {wire55, wire55}))));
  assign wire61 = (~|((~|({(8'hac)} ?
                      wire55 : {wire60})) <= $signed(wire58[(3'h5):(2'h2)])));
  assign wire62 = wire61;
  assign wire63 = ($unsigned((({wire59, wire57} ?
                      (wire54 ?
                          wire55 : wire55) : wire57[(1'h0):(1'h0)]) <<< $signed($unsigned((8'hb0))))) ^ ((+(~|(^~wire60))) <= wire61[(2'h2):(1'h1)]));
  assign wire64 = ((~^wire55) >> wire54[(1'h1):(1'h1)]);
  assign wire65 = ($unsigned((wire59[(1'h1):(1'h1)] ^ ($signed((8'ha3)) ?
                          (wire54 || (7'h40)) : $signed(wire59)))) ?
                      {($unsigned((wire58 > wire56)) << $unsigned($signed(wire63)))} : ((~&$unsigned(wire60[(1'h0):(1'h0)])) ?
                          (wire55[(3'h5):(2'h2)] << $signed($unsigned(wire61))) : $unsigned({(+wire59),
                              wire63})));
  assign wire66 = (~|(8'hbb));
  always
    @(posedge clk) begin
      reg67 <= wire64;
    end
endmodule

module module11
#(parameter param37 = {(~|(7'h43))}, 
parameter param38 = ((((param37 ? (param37 ? param37 : (8'hb7)) : (~^param37)) ? ((^~param37) ? (^~(8'hb4)) : param37) : ((8'ha0) != (8'h9f))) ? (8'hb6) : (param37 ? (param37 != (param37 ? param37 : (8'hab))) : (|{param37}))) ? {(param37 > ((param37 ? param37 : param37) | param37)), param37} : param37))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire13;
  input wire [(4'hc):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire17;
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire17,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg20,
                 reg19,
                 reg18,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= (~^$signed(wire14));
    end
  assign wire17 = (wire14 ?
                      wire12 : ((wire13[(4'hc):(4'hc)] ?
                          reg16[(3'h4):(2'h2)] : ((-wire12) ?
                              (~^wire15) : $unsigned(wire15))) ~^ wire13));
  always
    @(posedge clk) begin
      reg18 <= wire14[(3'h7):(1'h0)];
      reg19 <= $unsigned(wire14);
      reg20 <= reg19[(1'h1):(1'h1)];
    end
  assign wire21 = (wire15[(4'hd):(2'h2)] ?
                      $unsigned((reg19[(1'h1):(1'h1)] ?
                          ((wire14 ? reg16 : wire13) ?
                              $signed(reg19) : {reg20, wire13}) : (wire17 ?
                              (reg19 ?
                                  wire13 : wire14) : reg16))) : wire15[(3'h5):(3'h4)]);
  assign wire22 = reg16[(1'h0):(1'h0)];
  assign wire23 = wire15;
  assign wire24 = ($signed(reg20) ?
                      (($signed($unsigned((7'h44))) ?
                          ($unsigned(wire12) ?
                              $signed(wire22) : $signed(wire14)) : $unsigned($signed((8'hb8)))) ^~ $signed($signed((!reg20)))) : wire12[(2'h3):(1'h1)]);
  assign wire25 = (((reg16[(3'h6):(2'h3)] ? wire24[(3'h6):(3'h6)] : wire22) ?
                          ((wire13[(3'h4):(2'h2)] <<< (7'h44)) ?
                              $signed((~|(8'hac))) : wire13) : $signed((~^$unsigned(wire15)))) ?
                      $signed((^~(|(wire15 <= wire17)))) : $signed($unsigned((^~wire21[(2'h2):(1'h0)]))));
  assign wire26 = (wire25 && wire21[(4'h8):(3'h7)]);
  assign wire27 = (^wire12);
  assign wire28 = reg18;
  assign wire29 = (&(wire25 <<< reg20[(5'h12):(4'ha)]));
  assign wire30 = (wire17[(3'h5):(2'h2)] ?
                      ((~|wire25) == (~^wire26[(4'h8):(2'h2)])) : wire23);
  always
    @(posedge clk) begin
      reg31 <= (!wire27[(4'hc):(3'h7)]);
      reg32 <= reg19;
      reg33 <= (wire29[(3'h6):(3'h5)] && wire27[(4'h9):(4'h9)]);
    end
  always
    @(posedge clk) begin
      reg34 <= $signed((~^$signed((reg19[(2'h3):(2'h2)] ?
          $signed(reg19) : $signed(wire27)))));
      reg35 <= $signed($signed(($signed((~wire24)) ?
          ((reg32 && (8'hb9)) ? (~|reg31) : $unsigned((8'hb4))) : {(-wire17),
              $unsigned(reg31)})));
      reg36 <= wire21[(2'h2):(1'h1)];
    end
endmodule
