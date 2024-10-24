module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire211;
  wire [(5'h14):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire77;
  reg signed [(5'h15):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  assign y = {wire211,
                 wire80,
                 wire79,
                 wire5,
                 wire10,
                 wire11,
                 wire12,
                 wire77,
                 reg214,
                 reg213,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = $unsigned((8'had));
  always
    @(posedge clk) begin
      reg6 <= $unsigned(wire3[(4'ha):(2'h2)]);
      reg7 <= (&{$signed((^~$unsigned(wire4))),
          ((&wire0) ? wire5 : wire4[(5'h13):(5'h13)])});
      reg8 <= wire4;
      reg9 <= {$signed({wire5, reg7})};
    end
  assign wire10 = reg9[(1'h1):(1'h1)];
  assign wire11 = $unsigned($signed((($unsigned((7'h43)) ?
                          $unsigned((8'had)) : (reg7 ? wire4 : reg8)) ?
                      {reg7} : {$signed(reg6)})));
  assign wire12 = {(({(reg7 * reg8)} << $unsigned($unsigned(wire4))) >>> ((+$unsigned(reg9)) ?
                          $unsigned(wire4[(4'h8):(2'h3)]) : (~^(wire11 + wire4)))),
                      $signed($signed(reg9))};
  module13 #() modinst78 (.wire15(wire0), .wire16(wire10), .wire17(wire3), .wire18(wire12), .wire14(wire2), .clk(clk), .y(wire77));
  assign wire79 = wire3[(4'h8):(4'h8)];
  assign wire80 = (~wire12[(5'h12):(3'h5)]);
  module81 #() modinst212 (.wire82(wire0), .wire84(wire10), .wire86(wire80), .wire85(wire5), .clk(clk), .wire83(reg7), .y(wire211));
  always
    @(posedge clk) begin
      reg213 <= (&$unsigned(((reg9[(1'h1):(1'h1)] - $signed(reg8)) <<< wire80[(4'hb):(4'hb)])));
      reg214 <= wire4[(3'h4):(1'h0)];
    end
endmodule

module module81  (y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire86;
  input wire signed [(4'h8):(1'h0)] wire85;
  input wire signed [(3'h7):(1'h0)] wire84;
  input wire [(5'h14):(1'h0)] wire83;
  input wire [(3'h5):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire210;
  wire [(5'h13):(1'h0)] wire209;
  wire signed [(3'h7):(1'h0)] wire208;
  wire signed [(2'h3):(1'h0)] wire207;
  wire [(5'h14):(1'h0)] wire205;
  wire [(4'hc):(1'h0)] wire140;
  wire [(4'hf):(1'h0)] wire139;
  wire [(3'h6):(1'h0)] wire138;
  wire [(4'hb):(1'h0)] wire125;
  wire signed [(4'h9):(1'h0)] wire123;
  wire signed [(5'h13):(1'h0)] wire87;
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  reg [(2'h3):(1'h0)] reg141 = (1'h0);
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg [(4'ha):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg128 = (1'h0);
  reg [(4'hb):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  assign y = {wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire205,
                 wire140,
                 wire139,
                 wire138,
                 wire125,
                 wire123,
                 wire87,
                 reg143,
                 reg142,
                 reg141,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire87 = ({((7'h40) ?
                          wire84 : $signed((~^wire82)))} == wire82[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      if (wire82)
        begin
          reg88 <= wire83[(4'hc):(4'h9)];
          if (wire86)
            begin
              reg89 <= {(($signed($unsigned(wire87)) < $signed(reg88[(2'h3):(1'h0)])) ?
                      {(~$signed((7'h42))),
                          $signed(wire85)} : {reg88[(2'h3):(2'h2)],
                          $unsigned(wire83)}),
                  $unsigned(wire85)};
            end
          else
            begin
              reg89 <= $unsigned(wire84);
            end
          reg90 <= $unsigned($unsigned(((8'hab) << (8'ha5))));
          if ({$signed((+(8'hb5)))})
            begin
              reg91 <= {(~(!reg88[(4'hc):(3'h5)]))};
              reg92 <= reg90;
              reg93 <= $unsigned($unsigned((8'haf)));
              reg94 <= wire85[(1'h0):(1'h0)];
            end
          else
            begin
              reg91 <= $signed((((wire84 >= wire87) ?
                      (&(reg92 >= reg90)) : (8'hb6)) ?
                  (((reg92 <<< reg91) && $unsigned((7'h42))) ^ $unsigned(wire85)) : reg94));
              reg92 <= $signed((&$signed($unsigned((~&(8'ha1))))));
              reg93 <= $unsigned($unsigned((({wire82, wire87} ?
                      (~reg90) : (reg90 ? wire82 : (8'hbb))) ?
                  reg88[(2'h2):(2'h2)] : (wire86 ? (|reg89) : (!reg94)))));
            end
          reg95 <= wire87;
        end
      else
        begin
          reg88 <= $signed($signed({((|wire85) ?
                  $unsigned(wire83) : reg91[(4'ha):(2'h2)]),
              ($unsigned((8'hba)) < (wire85 ? wire87 : wire86))}));
          if (reg90)
            begin
              reg89 <= (($unsigned($signed($signed(reg91))) ?
                  (+$signed(reg93[(4'h9):(1'h0)])) : $signed((7'h42))) == $unsigned((~&(reg94[(2'h3):(2'h2)] ?
                  wire86[(3'h4):(2'h3)] : ((8'h9e) <= wire82)))));
              reg90 <= wire87;
              reg91 <= $signed($signed((reg89 ?
                  $unsigned((8'h9e)) : ($signed(reg89) | reg93))));
              reg92 <= ($unsigned(($signed({wire85, wire82}) ?
                  (wire87 ?
                      $unsigned(reg93) : (reg93 ?
                          reg90 : reg90)) : (~^(wire86 >> reg90)))) < (|wire83));
              reg93 <= wire82;
            end
          else
            begin
              reg89 <= {(~&((wire84 >>> (wire85 || reg95)) && ((reg95 ?
                      wire86 : wire86) >>> $unsigned(wire83)))),
                  reg93};
            end
        end
      reg96 <= wire87[(4'hd):(4'hb)];
      reg97 <= $unsigned($signed(wire83[(4'h9):(2'h2)]));
    end
  module98 #() modinst124 (.wire101(reg88), .wire99(reg89), .wire102(reg96), .y(wire123), .wire100(reg97), .clk(clk));
  assign wire125 = (&reg92[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg126 <= {(reg97[(1'h0):(1'h0)] ?
              (wire84[(2'h3):(1'h1)] ?
                  $unsigned($signed((8'hae))) : ((wire83 - (8'hb3)) || $unsigned(reg94))) : reg92[(2'h3):(1'h1)]),
          (&($signed((wire82 ? reg90 : wire87)) ?
              ({reg92, reg91} ?
                  {reg96, wire84} : ((8'hb5) ?
                      reg93 : wire85)) : $unsigned($unsigned((8'hb1)))))};
      if (wire86[(5'h11):(4'h9)])
        begin
          if (wire82)
            begin
              reg127 <= wire125[(1'h1):(1'h1)];
              reg128 <= (+(7'h41));
              reg129 <= (~^reg96[(3'h6):(2'h2)]);
              reg130 <= ((($unsigned(reg96[(3'h5):(3'h4)]) ?
                  reg97[(3'h6):(3'h5)] : wire87[(1'h1):(1'h0)]) && (^~(+reg91))) >> (($signed((reg127 ?
                      reg129 : (8'hb3))) ?
                  $signed(((8'hb8) ?
                      (8'hbf) : reg88)) : (^~wire85[(2'h2):(1'h1)])) == ((~^$unsigned(reg95)) + $unsigned(reg126))));
            end
          else
            begin
              reg127 <= wire85;
              reg128 <= (reg126[(3'h5):(2'h2)] ?
                  {$signed({wire83})} : $signed(($signed({wire82, wire84}) ?
                      ((8'hbd) ?
                          (wire85 ? wire84 : reg129) : (8'ha7)) : ((^(8'hb7)) ?
                          (wire83 & reg127) : reg92[(1'h1):(1'h0)]))));
              reg129 <= $signed(reg92[(1'h0):(1'h0)]);
            end
          reg131 <= reg89[(2'h3):(1'h0)];
        end
      else
        begin
          reg127 <= $signed(wire82[(3'h5):(2'h3)]);
          reg128 <= $unsigned((($unsigned(((8'hb6) ~^ reg128)) + (~^{wire123})) ?
              ($unsigned((~^reg127)) ?
                  ($signed(reg128) <= reg130[(2'h2):(1'h1)]) : (((8'hae) + wire82) ?
                      $signed((7'h41)) : (reg130 ?
                          wire123 : reg127))) : wire87));
          reg129 <= $unsigned((|(~^reg131)));
        end
      reg132 <= $unsigned(reg128);
      reg133 <= ($signed((((reg132 ? reg130 : reg94) ?
              (-wire125) : reg95[(2'h3):(2'h3)]) ?
          reg128[(3'h6):(3'h5)] : {{reg131},
              (wire82 != reg92)})) <= reg89[(3'h7):(1'h1)]);
      reg134 <= (wire87 >>> $unsigned(({reg91} ?
          wire123 : ((^reg126) ? $signed(reg131) : (^reg90)))));
    end
  always
    @(posedge clk) begin
      reg135 <= (~|(wire86[(4'he):(3'h6)] != {($unsigned(reg92) << (~|reg127)),
          $signed(((8'h9e) >>> (8'ha2)))}));
      reg136 <= reg132[(4'hb):(4'h9)];
      reg137 <= ((8'h9d) || $unsigned(reg131));
    end
  assign wire138 = ($unsigned((&$signed(((7'h43) <= reg93)))) && ($unsigned((~reg136[(2'h3):(1'h0)])) ?
                       (+($unsigned(reg133) ?
                           $unsigned(reg133) : wire84[(3'h7):(1'h0)])) : reg137));
  assign wire139 = $signed($signed(reg93[(3'h4):(2'h2)]));
  assign wire140 = (wire86 ?
                       (wire87 ?
                           $unsigned($signed((~wire139))) : reg95) : ((reg95[(3'h7):(3'h5)] & ($unsigned(reg128) || $signed(reg131))) ?
                           $signed((!(-reg95))) : wire125));
  always
    @(posedge clk) begin
      reg141 <= (^~($signed((reg135[(3'h6):(1'h0)] ?
              (reg91 ? reg127 : wire123) : (^~wire140))) ?
          $unsigned(((reg127 != wire85) ^ ((8'hba) | reg131))) : reg131));
      reg142 <= (+($unsigned(((^wire83) ?
          $signed((8'hae)) : $unsigned(reg126))) > ((~&(reg133 >> wire138)) || $signed(reg134))));
      reg143 <= (-$signed(($unsigned(reg135[(3'h6):(3'h6)]) ?
          {{reg141}, wire85} : (-$signed((8'ha4))))));
    end
  module144 #() modinst206 (.clk(clk), .wire146(reg96), .y(wire205), .wire148(reg131), .wire145(reg128), .wire147(reg127));
  assign wire207 = ($signed(reg128) < $unsigned({(~|$unsigned(wire138)),
                       ($signed(wire84) ?
                           (wire84 ? reg136 : reg89) : (^~reg97))}));
  assign wire208 = {({(reg135[(3'h4):(3'h4)] ? (^(8'ha6)) : {wire139, (8'hbe)}),
                           wire84[(3'h7):(1'h0)]} <<< $signed(reg96))};
  assign wire209 = (wire139[(3'h7):(2'h2)] ?
                       $unsigned((&wire87[(2'h2):(2'h2)])) : $unsigned(((!(reg129 ?
                           (7'h40) : reg131)) >= $signed($unsigned(wire140)))));
  assign wire210 = wire83;
endmodule

module module13
#(parameter param75 = (8'hbb), 
parameter param76 = (((param75 ^ param75) | (((param75 ? param75 : param75) - (param75 - param75)) ? ((param75 ? param75 : param75) || param75) : (param75 * (param75 ? param75 : (8'hba))))) ? {(param75 + (((8'hb9) || param75) ? (param75 ? param75 : param75) : (~param75)))} : (+((^~param75) ? {param75, (param75 ? (8'haa) : param75)} : ((~|param75) ? (8'ha5) : (param75 << param75))))))
(y, clk, wire14, wire15, wire16, wire17, wire18);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire signed [(3'h4):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire16;
  input wire signed [(4'hb):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire73;
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  assign y = {wire19,
                 wire20,
                 wire21,
                 wire73,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = $unsigned({$unsigned($unsigned(wire18)),
                      ((wire17 ?
                          wire15 : $signed((8'hb9))) < $signed(wire18[(2'h2):(1'h1)]))});
  assign wire20 = {$signed(wire14)};
  assign wire21 = $signed(wire14);
  always
    @(posedge clk) begin
      reg22 <= $signed({{wire19, (+wire21[(2'h3):(2'h3)])}});
      if ($signed(wire21))
        begin
          if ($unsigned((wire19 ^ (-reg22))))
            begin
              reg23 <= (&($unsigned(({wire15, wire14} ?
                  wire19[(2'h2):(2'h2)] : wire21[(4'ha):(2'h2)])) * $signed($unsigned($signed(wire18)))));
            end
          else
            begin
              reg23 <= wire21[(4'h9):(1'h0)];
              reg24 <= (+($signed(({wire18, wire19} > (-(8'hb1)))) ?
                  {(!wire19)} : (((~&wire15) <<< $signed(wire17)) | wire21[(4'hb):(3'h7)])));
              reg25 <= ($unsigned(wire17) < {$signed(wire16)});
              reg26 <= (8'hbf);
            end
          reg27 <= reg24[(4'h9):(3'h4)];
          reg28 <= ($unsigned(wire20) ?
              (((^~(wire20 ? (8'hb6) : wire18)) ?
                      ({wire20} == {reg27}) : $signed({reg26})) ?
                  (wire17 ?
                      wire21[(3'h5):(3'h5)] : (&(wire15 ?
                          reg22 : reg26))) : $unsigned(wire14[(2'h3):(2'h3)])) : reg26);
          reg29 <= ((+$signed({{reg23}})) ? reg25 : wire18[(4'he):(3'h6)]);
          reg30 <= {(&wire14[(2'h3):(1'h1)])};
        end
      else
        begin
          reg23 <= reg27;
          reg24 <= (($unsigned(wire17[(3'h4):(2'h3)]) ?
              (wire17[(1'h0):(1'h0)] ?
                  wire19[(2'h2):(2'h2)] : $unsigned(reg28)) : (((reg22 * reg24) | (8'hbd)) ?
                  ({wire15} ?
                      reg22[(1'h1):(1'h1)] : wire17) : (8'ha2))) | wire15);
          reg25 <= reg29[(3'h5):(3'h5)];
        end
    end
  module31 #() modinst74 (.clk(clk), .wire35(reg28), .wire34(wire18), .wire33(wire15), .wire36(reg30), .wire32(wire20), .y(wire73));
endmodule

module module31
#(parameter param71 = ({((~^((8'hac) ? (8'hb1) : (8'hb2))) & ({(8'ha7)} ? (+(7'h41)) : ((7'h41) ^ (8'h9f)))), (~&((+(8'h9f)) <<< ((8'ha6) ^ (8'hb0))))} - {(^{((8'ha9) >>> (8'haa)), ((8'ha6) && (8'hbd))}), {(~^(~(8'hb1)))}}), 
parameter param72 = ((~&{{(~|param71), param71}, (~|(param71 * param71))}) & (param71 ? ({param71, {param71, param71}} && param71) : (param71 ? ((~&param71) ? param71 : (-(8'hb2))) : ({param71} ? (~|param71) : (param71 ^~ param71))))))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire36;
  input wire [(3'h5):(1'h0)] wire35;
  input wire [(5'h14):(1'h0)] wire34;
  input wire signed [(3'h4):(1'h0)] wire33;
  input wire [(4'h8):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg37,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg37 <= (~$unsigned((~^wire35)));
    end
  assign wire38 = {($signed($unsigned((8'h9e))) < wire36),
                      (($unsigned(((8'h9f) > wire33)) | ((^(8'hbb)) & $signed(wire35))) > reg37)};
  assign wire39 = ({(~&{$signed((7'h40))})} ?
                      $unsigned($unsigned((+{wire36,
                          (8'hbd)}))) : $signed((8'hb8)));
  assign wire40 = (^~wire36[(2'h2):(2'h2)]);
  assign wire41 = (($signed((^~(-wire33))) ^~ ((-(|wire40)) ?
                      {(|wire39), $unsigned(wire32)} : (((8'hba) >= wire40) ?
                          ((7'h43) >= wire32) : ((8'ha0) + wire38)))) << $unsigned((&($unsigned(wire35) + $unsigned(wire33)))));
  always
    @(posedge clk) begin
      if ($unsigned(wire33))
        begin
          reg42 <= $unsigned((wire39 <= {((wire36 ?
                  wire35 : wire39) || (reg37 <= wire33))}));
        end
      else
        begin
          reg42 <= ((((-$unsigned(wire40)) >= ({wire36} ?
                  ((8'hb1) + wire33) : wire32)) ?
              (|wire40[(4'hb):(4'ha)]) : (((^~wire34) ^ (wire36 ?
                  reg42 : (8'hb3))) || $signed($signed(wire35)))) ~^ wire39);
          reg43 <= $signed((8'ha8));
          if ({$signed((|$unsigned(wire34[(4'h8):(2'h3)])))})
            begin
              reg44 <= $signed(wire35);
              reg45 <= (wire39 && {wire40[(5'h12):(4'h8)],
                  {(wire38 >> (!wire32)), wire38}});
              reg46 <= {reg43};
              reg47 <= reg45[(4'h8):(3'h5)];
            end
          else
            begin
              reg44 <= $signed((+((~&(wire36 ? wire39 : (8'ha1))) ?
                  (+$unsigned(reg42)) : $unsigned($signed(reg47)))));
              reg45 <= $signed((~^(!((wire40 ? (8'hb6) : wire35) ?
                  (-reg42) : (-reg44)))));
              reg46 <= wire38;
              reg47 <= {reg43[(4'ha):(2'h2)]};
            end
          reg48 <= (8'hb0);
          if ((($unsigned(reg42) && (reg48[(4'h9):(3'h4)] ?
                  ((wire33 ? wire32 : reg47) ?
                      $unsigned(wire32) : (wire33 ?
                          wire32 : wire39)) : $signed((reg48 ?
                      reg47 : reg46)))) ?
              reg47[(4'hc):(4'hc)] : wire38))
            begin
              reg49 <= $signed(wire40[(4'hc):(3'h7)]);
              reg50 <= wire41[(1'h1):(1'h1)];
              reg51 <= (($signed($unsigned(wire36)) ?
                  $unsigned(reg49[(2'h2):(1'h1)]) : (wire38[(2'h2):(1'h0)] == $unsigned((^~reg50)))) <= ((wire32[(3'h5):(2'h3)] ?
                  $signed((~&reg49)) : $unsigned((wire32 > reg45))) <<< $signed(($signed(reg45) >> (8'hb2)))));
              reg52 <= ((+$signed((~&$unsigned(wire34)))) ?
                  $signed((!($unsigned(wire38) ?
                      wire33 : $signed(reg46)))) : reg45);
            end
          else
            begin
              reg49 <= {$unsigned(reg44[(2'h2):(1'h0)])};
              reg50 <= $unsigned(wire33);
              reg51 <= reg44[(3'h5):(2'h2)];
            end
        end
      reg53 <= $signed((((~&$unsigned(wire41)) <<< (reg44[(3'h5):(1'h0)] > (reg49 < reg43))) != {$unsigned(reg51[(2'h2):(1'h0)]),
          (~(reg51 ? (8'hbf) : (8'h9d)))}));
    end
  always
    @(posedge clk) begin
      reg54 <= $unsigned($signed((^((~|reg47) >>> (|wire39)))));
      reg55 <= $unsigned((|(|((!(8'haa)) && {wire41, reg46}))));
      reg56 <= (($signed({(8'ha3), $unsigned(wire39)}) << wire38) ?
          $unsigned((($signed(reg43) ? (wire38 | wire33) : reg45) > ((&wire38) ?
              reg42 : (7'h41)))) : ((~&$signed((wire39 ^~ (8'hb3)))) ?
              $signed($unsigned($unsigned(reg44))) : ($signed(reg42[(2'h2):(1'h1)]) << wire38)));
    end
  assign wire57 = ($signed($unsigned(($signed(reg44) ?
                          (reg52 != reg55) : reg37[(2'h3):(1'h1)]))) ?
                      ({$signed($signed(wire34))} ^~ $unsigned(reg47[(3'h7):(1'h1)])) : $signed($signed(wire39[(1'h1):(1'h1)])));
  assign wire58 = ($unsigned($signed(($signed(reg44) >> $unsigned(wire41)))) ?
                      (~^$signed(({reg51} ?
                          $signed((8'hab)) : reg50[(2'h2):(1'h1)]))) : ({{(+reg48),
                                  ((8'hba) != (8'hba))},
                              ((|reg46) >= wire33)} ?
                          $unsigned((reg44[(3'h4):(2'h2)] ?
                              $signed(wire38) : $signed(reg43))) : (|($signed(wire41) ?
                              (reg48 || (8'ha9)) : $signed((8'hb1))))));
  assign wire59 = {{((-{(8'hb5), wire34}) ?
                              ($unsigned((8'hac)) * $signed(wire58)) : (+$signed(wire33))),
                          $unsigned($signed({reg48}))}};
  assign wire60 = ($unsigned(reg50[(2'h2):(1'h0)]) ?
                      $unsigned((~|$unsigned(reg43[(4'hf):(1'h1)]))) : reg47[(4'h8):(1'h1)]);
  assign wire61 = (!$unsigned($unsigned(({(8'hb2)} - (^~reg37)))));
  assign wire62 = $signed((8'had));
  assign wire63 = wire57[(1'h1):(1'h1)];
  assign wire64 = $signed(((~|wire58[(2'h2):(1'h1)]) ?
                      ((reg52[(2'h2):(2'h2)] ?
                              $signed((8'had)) : $unsigned(wire41)) ?
                          {reg54} : ($signed(reg46) <<< reg55)) : wire32[(2'h3):(2'h3)]));
  assign wire65 = {$signed($signed($unsigned({wire38, wire40}))),
                      reg54[(3'h7):(1'h1)]};
  assign wire66 = wire40[(3'h7):(1'h1)];
  assign wire67 = (($signed($signed(reg53[(3'h7):(3'h7)])) >= $unsigned(wire59)) ?
                      $unsigned($signed((wire61[(4'hd):(1'h0)] < (reg51 ~^ reg51)))) : wire59[(4'hc):(3'h7)]);
  assign wire68 = $signed({$signed(($unsigned((8'ha5)) != ((8'ha3) ?
                          wire58 : wire66))),
                      $unsigned((~wire38))});
  assign wire69 = (~(!(~^wire66[(1'h1):(1'h1)])));
  assign wire70 = (&(8'hbe));
endmodule

module module144  (y, clk, wire148, wire147, wire146, wire145);
  output wire [(32'h2c6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire148;
  input wire [(4'hb):(1'h0)] wire147;
  input wire signed [(4'he):(1'h0)] wire146;
  input wire signed [(5'h11):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire204;
  wire signed [(2'h3):(1'h0)] wire167;
  wire signed [(3'h4):(1'h0)] wire166;
  wire [(4'hf):(1'h0)] wire165;
  wire [(3'h4):(1'h0)] wire164;
  wire signed [(4'hf):(1'h0)] wire163;
  wire signed [(4'ha):(1'h0)] wire162;
  wire [(4'ha):(1'h0)] wire161;
  wire signed [(5'h15):(1'h0)] wire160;
  wire signed [(3'h5):(1'h0)] wire159;
  wire signed [(5'h15):(1'h0)] wire158;
  wire [(5'h15):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire156;
  wire [(4'hf):(1'h0)] wire155;
  wire [(5'h12):(1'h0)] wire154;
  wire [(5'h15):(1'h0)] wire153;
  wire signed [(4'he):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire151;
  reg [(4'he):(1'h0)] reg203 = (1'h0);
  reg [(4'hb):(1'h0)] reg202 = (1'h0);
  reg [(3'h4):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg199 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg198 = (1'h0);
  reg [(3'h7):(1'h0)] reg197 = (1'h0);
  reg signed [(4'he):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg194 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg192 = (1'h0);
  reg [(4'h9):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg190 = (1'h0);
  reg [(5'h11):(1'h0)] reg189 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg188 = (1'h0);
  reg [(5'h12):(1'h0)] reg187 = (1'h0);
  reg [(4'hf):(1'h0)] reg186 = (1'h0);
  reg [(5'h13):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg181 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg175 = (1'h0);
  reg [(4'hf):(1'h0)] reg174 = (1'h0);
  reg [(5'h13):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg171 = (1'h0);
  reg [(2'h2):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg168 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  assign y = {wire204,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg150,
                 reg149,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg149 <= $signed(wire147[(4'hb):(3'h4)]);
      reg150 <= $unsigned((((|$unsigned(wire145)) ?
          reg149 : wire147[(4'ha):(3'h5)]) >> (8'ha1)));
    end
  assign wire151 = (^~$unsigned((reg150 ?
                       wire147[(1'h1):(1'h1)] : ((wire145 >> reg149) << (wire147 * (8'hab))))));
  assign wire152 = wire148[(3'h4):(3'h4)];
  assign wire153 = (^(!$signed((|wire148[(3'h4):(3'h4)]))));
  assign wire154 = (8'ha5);
  assign wire155 = wire146[(4'hc):(4'ha)];
  assign wire156 = wire145;
  assign wire157 = ($signed($unsigned(reg149)) ^~ (reg149 & (reg150 || wire147[(4'h8):(1'h1)])));
  assign wire158 = (((~^(wire157[(2'h3):(1'h1)] < wire157[(3'h5):(1'h0)])) ^~ $unsigned($signed(wire147))) ?
                       $unsigned(wire157[(4'hd):(1'h1)]) : (-$unsigned((reg150[(4'hd):(3'h4)] ?
                           (wire157 ? (8'ha4) : wire155) : (wire152 ?
                               wire156 : wire153)))));
  assign wire159 = ((~$signed((~|$signed((8'ha3))))) ?
                       wire153 : ($unsigned({{(8'hbc), reg149}}) ?
                           $signed(wire152) : (!wire145[(4'h8):(1'h0)])));
  assign wire160 = (^~{{wire156[(4'hb):(4'ha)], (7'h40)}});
  assign wire161 = {(-$unsigned((-reg149[(5'h14):(3'h7)])))};
  assign wire162 = reg149;
  assign wire163 = {({{$signed(wire147), wire146}} ~^ wire159[(1'h0):(1'h0)]),
                       wire159};
  assign wire164 = (($unsigned($signed(wire145)) == (((!wire151) ?
                       ((8'hb0) ?
                           wire161 : wire151) : ((8'ha4) ^~ wire153)) < wire161)) <<< wire147[(2'h2):(1'h1)]);
  assign wire165 = $unsigned(($unsigned(wire153[(2'h2):(1'h0)]) >= (((wire162 ?
                           wire161 : wire163) ?
                       ((8'hb0) * wire164) : $signed(wire153)) <<< ({wire148,
                       (8'hbb)} || wire155))));
  assign wire166 = wire162[(3'h4):(2'h2)];
  assign wire167 = wire161;
  always
    @(posedge clk) begin
      if (($signed($signed(((wire146 ^ wire158) << $unsigned(wire160)))) ?
          ($signed($signed(wire160)) ?
              wire145[(2'h2):(1'h1)] : wire164) : (~&(8'hb2))))
        begin
          if ($signed($signed((((8'had) && $signed((8'hb0))) || {(+wire148)}))))
            begin
              reg168 <= wire153;
              reg169 <= {({(|{wire151}),
                          ($unsigned(wire145) ^~ ((8'hb3) ?
                              wire162 : reg149))} ?
                      (wire158 ?
                          ((wire157 ?
                              wire163 : wire148) != wire153[(2'h2):(2'h2)]) : $unsigned($unsigned(wire166))) : $signed((~$unsigned(wire167)))),
                  (wire161[(3'h7):(3'h6)] ?
                      (wire153 ? (^$signed(wire164)) : (8'ha7)) : (~&((reg149 ?
                              reg150 : wire161) ?
                          (wire153 ? wire157 : (7'h43)) : $signed(wire155))))};
              reg170 <= $unsigned($signed((^wire156[(3'h7):(2'h2)])));
            end
          else
            begin
              reg168 <= $signed(wire154[(4'ha):(4'ha)]);
              reg169 <= (~&reg170);
              reg170 <= ((^~(7'h42)) - (wire153 ?
                  $unsigned((^$unsigned(wire159))) : wire164[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          if ((~&wire165[(4'h8):(3'h7)]))
            begin
              reg168 <= (~^{(~^(^(wire158 ? reg170 : reg150)))});
              reg169 <= {wire162};
              reg170 <= $unsigned((-(^~(((8'ha7) ? wire161 : reg169) ?
                  wire152[(3'h4):(1'h0)] : (wire147 ? wire161 : wire157)))));
            end
          else
            begin
              reg168 <= (~|{((wire153[(1'h1):(1'h1)] == (wire160 ?
                      reg169 : reg149)) ^~ ((reg149 == reg170) ?
                      $signed(reg149) : reg169[(4'h9):(4'h9)])),
                  $unsigned($signed($unsigned(wire162)))});
              reg169 <= wire161[(3'h5):(2'h3)];
              reg170 <= (&(((^~$signed(reg168)) | wire160) ?
                  (~^$unsigned((-wire166))) : $signed(($signed(wire167) ?
                      (wire152 | wire146) : $signed(reg149)))));
              reg171 <= (~&wire154[(5'h12):(1'h1)]);
              reg172 <= (&$unsigned((^~reg169[(2'h3):(1'h1)])));
            end
          reg173 <= ($unsigned((^((8'hbe) ?
              reg172[(4'hc):(1'h1)] : (+(8'hb8))))) & {(reg169 ^ $unsigned($signed(wire165)))});
          if (wire165)
            begin
              reg174 <= {($signed((|$unsigned(wire163))) ?
                      reg170[(2'h2):(1'h0)] : (~&(8'hba))),
                  $signed($signed($unsigned(wire146)))};
              reg175 <= $signed(reg169[(4'ha):(2'h2)]);
              reg176 <= $unsigned((~^((wire152 * (~&(8'hb0))) != ($unsigned(wire145) ?
                  ((8'ha7) ? reg169 : wire157) : (reg171 ?
                      wire158 : wire151)))));
              reg177 <= wire167;
            end
          else
            begin
              reg174 <= ($unsigned($signed($unsigned((~^wire156)))) ?
                  {{((reg169 + wire157) <<< (wire167 ? reg171 : wire165)),
                          wire165[(4'hc):(1'h1)]}} : reg150[(3'h7):(2'h2)]);
              reg175 <= ($signed(wire157[(1'h1):(1'h0)]) ?
                  wire158 : (reg171 ?
                      {($unsigned(wire148) ?
                              (wire162 ? wire157 : wire155) : {(8'ha2),
                                  wire167}),
                          (((7'h41) ^~ wire160) >= (reg168 << reg168))} : $signed({(wire154 ?
                              (8'ha9) : wire151)})));
              reg176 <= wire165[(4'hf):(2'h3)];
            end
          reg178 <= reg169[(2'h3):(1'h1)];
          reg179 <= wire160[(3'h7):(2'h3)];
        end
      if ((-($signed($signed($unsigned(reg169))) >> (~^wire148))))
        begin
          reg180 <= reg168;
          if ($unsigned(($signed(reg168[(3'h6):(1'h1)]) <<< {($unsigned(wire148) >= $signed(reg169))})))
            begin
              reg181 <= wire165[(2'h2):(2'h2)];
              reg182 <= $unsigned(({wire153[(5'h10):(3'h7)],
                      (wire146[(4'he):(3'h4)] <= reg149[(4'hc):(3'h5)])} ?
                  wire147 : wire164));
              reg183 <= {(~$unsigned(((wire154 && (7'h41)) <<< $unsigned(wire167))))};
              reg184 <= (8'ha1);
              reg185 <= wire165;
            end
          else
            begin
              reg181 <= $unsigned((8'hb8));
              reg182 <= (($unsigned((^((8'hb6) ? reg181 : wire165))) ?
                  ((8'hb1) <<< reg173[(2'h2):(2'h2)]) : $signed((8'hb1))) <<< (wire163 ?
                  $unsigned(reg182[(3'h4):(2'h3)]) : (~|{(^(8'hb1)),
                      $signed(wire167)})));
            end
        end
      else
        begin
          reg180 <= ($signed((~$signed(reg178))) ?
              {$unsigned({$signed(wire164)})} : ((wire147[(3'h7):(3'h5)] < reg172) ?
                  ((wire165 > (reg177 << reg172)) ?
                      reg171 : $unsigned($signed(reg176))) : $unsigned(((reg150 >> wire146) > $signed(reg175)))));
          reg181 <= wire166;
        end
      if (reg184[(5'h10):(4'hc)])
        begin
          reg186 <= (reg173 | $signed({($unsigned(reg184) ^~ (!(8'haf)))}));
          reg187 <= wire165[(3'h7):(3'h7)];
          reg188 <= wire154;
        end
      else
        begin
          if (wire163)
            begin
              reg186 <= {(wire163[(4'hf):(3'h4)] >>> ($signed((^wire158)) ^ reg184[(5'h14):(5'h14)]))};
            end
          else
            begin
              reg186 <= $signed((~(~((reg170 | wire162) ?
                  (wire163 << wire151) : (&reg174)))));
            end
          reg187 <= reg150[(4'hf):(1'h1)];
          reg188 <= $signed((reg175 || (-wire164[(3'h4):(2'h3)])));
          reg189 <= (wire167 ?
              (~|$signed(($signed((8'hb9)) ?
                  wire164 : $unsigned(reg183)))) : (8'hba));
          reg190 <= {($signed((reg149 < (wire165 ? reg174 : reg176))) ?
                  wire147[(3'h4):(1'h1)] : (reg180[(2'h3):(2'h2)] || reg175))};
        end
      if (($signed(reg190[(2'h3):(1'h1)]) << (~wire160)))
        begin
          reg191 <= reg171;
        end
      else
        begin
          if ($unsigned((((((8'h9f) ? reg150 : (8'ha1)) ?
                      wire166[(2'h2):(2'h2)] : {reg186}) ?
                  (+wire155[(3'h7):(2'h2)]) : wire163) ?
              $signed($signed((reg183 & reg171))) : {$unsigned(wire155[(3'h6):(2'h3)])})))
            begin
              reg191 <= {(($signed((&reg149)) ?
                      (((7'h41) ? wire160 : wire160) & {wire146,
                          reg180}) : reg191) < (($unsigned(reg172) ?
                          (wire158 == reg149) : (-wire166)) ?
                      (~reg170[(2'h2):(2'h2)]) : $unsigned($unsigned(reg185))))};
              reg192 <= $unsigned(($signed($unsigned(wire166)) ~^ $signed((reg186[(3'h5):(3'h4)] >>> wire166[(2'h3):(1'h0)]))));
              reg193 <= (($signed($signed({wire147})) ?
                      reg190 : (~(~^reg181[(2'h2):(1'h1)]))) ?
                  reg183[(3'h4):(1'h1)] : ({(~|reg180)} | ($signed(reg170) - $signed((&wire163)))));
              reg194 <= $signed(wire157);
            end
          else
            begin
              reg191 <= (^~$unsigned((|{(&wire157)})));
              reg192 <= $signed((wire147[(4'h9):(3'h5)] ?
                  ($unsigned(wire154) <= (8'hbb)) : (($signed(reg168) + (wire164 ?
                          reg177 : reg189)) ?
                      $signed(wire145) : (reg178 ?
                          (~^(7'h43)) : (wire156 ? wire159 : (8'had))))));
              reg193 <= reg190;
              reg194 <= (($signed(wire148[(1'h1):(1'h0)]) ?
                  {(reg180 >>> (reg189 ? reg175 : reg191)),
                      reg187[(4'hc):(2'h3)]} : (wire153[(4'ha):(3'h5)] ?
                      reg191[(2'h3):(2'h3)] : wire155[(4'hc):(3'h4)])) && ($unsigned((^(!wire167))) >>> reg179));
              reg195 <= (((+(~&$signed(reg189))) >> (((~^(8'h9e)) ?
                      $unsigned((8'ha2)) : $unsigned(wire159)) ?
                  $signed((-reg187)) : wire153)) <= (^wire158[(5'h13):(4'hf)]));
            end
          reg196 <= reg178[(4'he):(4'hb)];
          reg197 <= (reg189 <= wire167);
          if (reg180[(1'h1):(1'h0)])
            begin
              reg198 <= ($signed($unsigned((~&(reg194 == reg174)))) ~^ (|reg181));
              reg199 <= reg174[(2'h2):(1'h0)];
              reg200 <= ($unsigned(reg189) <= reg192[(2'h3):(2'h2)]);
              reg201 <= $unsigned($unsigned($unsigned({(reg191 ?
                      reg149 : reg178)})));
              reg202 <= {reg183[(3'h5):(3'h5)],
                  $unsigned(((reg186[(4'hf):(4'hb)] ?
                      ((8'ha0) ?
                          reg183 : reg178) : $unsigned((8'ha8))) == {(wire162 ?
                          reg195 : reg171),
                      wire161}))};
            end
          else
            begin
              reg198 <= $signed(reg199);
              reg199 <= $unsigned($signed((^~$unsigned({reg173, reg173}))));
              reg200 <= (~$unsigned({(reg174 << $signed(wire151))}));
              reg201 <= ((~&$unsigned($signed((wire166 ? reg183 : reg175)))) ?
                  (!$unsigned($unsigned((wire160 ?
                      wire161 : wire157)))) : $signed((8'hb3)));
              reg202 <= {({wire167} && $unsigned((reg177 ^~ ((8'hb2) ?
                      reg192 : wire161))))};
            end
        end
      reg203 <= (^~(((~|wire158) && reg187[(2'h3):(1'h0)]) ?
          reg172[(5'h10):(4'hd)] : $signed((&(-reg193)))));
    end
  assign wire204 = ((((reg169[(4'hf):(3'h7)] ?
                               (~&(8'hb7)) : ((8'hb1) ? wire147 : reg150)) ?
                           ((^reg199) ^~ {reg174}) : ($unsigned(reg193) ?
                               (~|reg194) : reg187)) ?
                       reg185 : ($signed({(8'hb8),
                           reg180}) ^ reg193)) + (~|reg196[(1'h0):(1'h0)]));
endmodule

module module98  (y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire102;
  input wire signed [(3'h5):(1'h0)] wire101;
  input wire signed [(3'h4):(1'h0)] wire100;
  input wire signed [(5'h15):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire120;
  wire signed [(4'hd):(1'h0)] wire119;
  wire signed [(3'h4):(1'h0)] wire118;
  wire [(2'h2):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire103;
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg [(4'h8):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  assign y = {wire122,
                 wire120,
                 wire119,
                 wire118,
                 wire104,
                 wire103,
                 reg121,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire103 = (^~$signed($unsigned((!$signed(wire101)))));
  assign wire104 = wire99[(4'hc):(4'hb)];
  always
    @(posedge clk) begin
      reg105 <= $unsigned($signed({$signed(wire99)}));
      if (wire101[(2'h2):(1'h0)])
        begin
          reg106 <= wire100;
          reg107 <= {((reg105 + wire100[(2'h2):(2'h2)]) < {{$signed(wire102),
                      $unsigned(reg105)}}),
              ($unsigned(($unsigned(reg105) != $unsigned(wire99))) >= wire99[(2'h3):(1'h1)])};
          if ($signed(wire100[(1'h0):(1'h0)]))
            begin
              reg108 <= $signed({$unsigned(wire100)});
              reg109 <= $signed(wire99);
              reg110 <= (reg106[(4'he):(4'ha)] ?
                  wire100[(1'h1):(1'h0)] : (8'hb9));
              reg111 <= reg105;
              reg112 <= reg108[(2'h2):(2'h2)];
            end
          else
            begin
              reg108 <= (&$signed(((7'h41) ?
                  wire104[(1'h0):(1'h0)] : {reg106[(2'h2):(2'h2)]})));
              reg109 <= (8'hae);
            end
          if (reg110[(2'h2):(1'h0)])
            begin
              reg113 <= (+wire103[(3'h5):(3'h5)]);
              reg114 <= (~((((^~reg107) <= (reg110 ? (8'ha4) : reg111)) ?
                  reg105[(3'h6):(3'h5)] : ($unsigned(wire104) ?
                      (wire101 ?
                          reg107 : reg111) : reg108[(4'hf):(2'h2)])) | (~|$signed($unsigned(reg106)))));
              reg115 <= $unsigned((&$unsigned(wire100)));
            end
          else
            begin
              reg113 <= (reg107 ?
                  $signed(reg112[(1'h0):(1'h0)]) : $signed($signed($unsigned(reg114[(1'h1):(1'h1)]))));
            end
        end
      else
        begin
          reg106 <= $signed($signed($unsigned(reg106[(4'hb):(3'h5)])));
        end
      reg116 <= $unsigned((wire100 ?
          (8'hbf) : (((^~reg108) ? {reg108} : {reg114, wire103}) ?
              {(reg113 & wire100)} : $unsigned((reg105 & reg107)))));
      reg117 <= ($unsigned(reg113) ?
          (~$signed((reg110[(2'h2):(2'h2)] ?
              reg115 : reg109[(4'ha):(1'h0)]))) : ((|$unsigned($signed(wire103))) ?
              ((reg110 ^~ reg108) & (reg110 ?
                  reg115[(5'h11):(4'h8)] : $unsigned((8'hb4)))) : (+(reg116[(4'hc):(1'h1)] ~^ $unsigned(reg111)))));
    end
  assign wire118 = reg115;
  assign wire119 = (|$unsigned((wire104[(1'h0):(1'h0)] ?
                       (~&$unsigned(reg116)) : (|(reg108 > (8'hbc))))));
  assign wire120 = (+(~&(-reg108[(5'h12):(4'ha)])));
  always
    @(posedge clk) begin
      reg121 <= (wire119 <<< reg113);
    end
  assign wire122 = {reg111[(1'h1):(1'h1)], $unsigned(reg107[(3'h5):(1'h1)])};
endmodule
