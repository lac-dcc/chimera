module top
#(parameter param143 = ((((((8'hbf) + (8'h9c)) ? ((8'hac) ? (8'hb5) : (8'hbb)) : (-(8'hbd))) + ({(8'hb2)} ? ((8'ha2) && (8'hb9)) : (8'haf))) ? (~&(~&((7'h41) ^~ (8'ha5)))) : {(((8'hbf) ? (8'hb3) : (8'had)) ? ((8'hab) <= (8'hac)) : (8'ha1)), ({(8'hbd)} ^~ (+(8'hae)))}) && (~&((~^((8'haa) ? (8'ha4) : (8'hb9))) == {(~^(8'haf))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire125;
  wire [(4'hd):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire121;
  wire signed [(3'h4):(1'h0)] wire120;
  wire [(5'h14):(1'h0)] wire119;
  wire signed [(4'hf):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire115;
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  reg [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire5,
                 wire6,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire115,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
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
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (!({{{wire3}}} >= wire2[(3'h5):(3'h4)]));
  assign wire6 = $signed(wire1[(4'ha):(3'h5)]);
  always
    @(posedge clk) begin
      if (((($signed((7'h42)) ?
                  (8'hb1) : ($unsigned(wire2) ?
                      wire2[(2'h2):(1'h1)] : {wire5, wire6})) ?
              ((wire2 != wire0) ?
                  wire1[(5'h10):(1'h0)] : $unsigned(((8'hb3) ?
                      wire4 : wire2))) : $signed(wire6)) ?
          (wire3[(4'h8):(3'h7)] ?
              (8'hb4) : ((!(8'hbf)) < wire3)) : $unsigned((($unsigned(wire0) >>> $unsigned(wire2)) ?
              ($signed(wire1) << wire3[(4'ha):(3'h6)]) : $signed($unsigned((8'h9d)))))))
        begin
          if ((!$unsigned(wire4[(3'h4):(1'h0)])))
            begin
              reg7 <= $unsigned(wire2);
              reg8 <= wire1[(4'hd):(1'h1)];
              reg9 <= $signed($unsigned((+$signed((wire1 ? reg8 : wire0)))));
            end
          else
            begin
              reg7 <= ({((|(wire2 >>> wire0)) ? wire6 : wire5[(2'h2):(2'h2)])} ?
                  wire1 : wire2[(3'h7):(3'h7)]);
              reg8 <= (~(^$signed((8'ha3))));
              reg9 <= ($unsigned($unsigned($unsigned($signed(wire6)))) << {({(wire5 ?
                              reg8 : wire4)} ?
                      wire6 : ((~wire2) <= wire6))});
              reg10 <= $signed((((8'hb0) ^~ wire4[(3'h7):(1'h0)]) ?
                  reg8 : (+(~|reg8[(3'h7):(3'h5)]))));
              reg11 <= $signed(((8'ha2) ?
                  (^~wire3[(4'he):(4'hc)]) : {$signed((~|reg10)),
                      {(reg9 - reg8), (wire2 == wire0)}}));
            end
          if ({$unsigned($unsigned((8'ha2))),
              (-$unsigned(reg11[(3'h5):(2'h2)]))})
            begin
              reg12 <= {(~$signed({$signed(wire0), {wire2}})),
                  {wire3[(4'h8):(3'h6)]}};
              reg13 <= $signed((!$unsigned($unsigned(((8'hb4) >>> wire0)))));
            end
          else
            begin
              reg12 <= reg12[(4'h8):(2'h2)];
              reg13 <= $signed($signed(reg7[(3'h7):(3'h4)]));
              reg14 <= $unsigned($signed($signed($unsigned(wire6[(1'h1):(1'h0)]))));
            end
        end
      else
        begin
          if (reg14)
            begin
              reg7 <= (^$unsigned(($unsigned($unsigned(reg8)) ?
                  wire0[(4'h8):(3'h7)] : {$unsigned(wire1), reg14})));
            end
          else
            begin
              reg7 <= $signed(($unsigned({(wire4 ? reg14 : wire5)}) ?
                  (reg7[(1'h1):(1'h1)] * ($signed(wire5) ?
                      (reg10 + wire1) : reg14)) : ($signed(reg14[(1'h0):(1'h0)]) ?
                      reg11 : (^~(wire4 ? wire5 : reg9)))));
              reg8 <= (~&wire4);
              reg9 <= {(^wire6)};
            end
          if (($unsigned($signed(reg13)) ?
              (8'hb2) : ((|reg11[(1'h1):(1'h1)]) ?
                  ($unsigned(wire0[(1'h0):(1'h0)]) <<< (&(reg13 > (8'hab)))) : (($signed(wire4) ?
                      {wire4} : ((8'had) ?
                          wire2 : wire4)) > $signed($unsigned(wire4))))))
            begin
              reg10 <= reg8[(5'h15):(5'h10)];
              reg11 <= $signed($signed((^~(^(~^reg10)))));
              reg12 <= ((^{(|((7'h40) ?
                      (8'h9e) : reg7))}) * {$signed((wire6 == reg9[(3'h6):(1'h1)]))});
            end
          else
            begin
              reg10 <= $signed($signed({($signed(reg9) & reg9[(3'h6):(1'h0)])}));
              reg11 <= ($signed($unsigned(reg9)) ? (~|(~|reg9)) : wire6);
              reg12 <= reg14[(3'h6):(1'h0)];
              reg13 <= (|($unsigned($unsigned(wire4)) ^~ ($unsigned(reg9) ?
                  $unsigned($signed(wire4)) : {$unsigned(wire6)})));
            end
          reg14 <= $signed((^~(((~(8'haf)) ?
              (wire0 < reg7) : $signed(wire1)) | (+wire1[(4'ha):(2'h2)]))));
        end
      reg15 <= (((~^wire3[(3'h4):(2'h3)]) ?
          $unsigned(wire5) : reg12[(3'h4):(2'h3)]) <<< (-(($signed(wire4) ?
              {wire3, reg11} : (reg11 ? reg12 : wire3)) ?
          (wire6 ^ reg12[(4'ha):(2'h2)]) : reg12)));
      reg16 <= wire5[(1'h1):(1'h1)];
      reg17 <= wire5[(3'h6):(1'h1)];
      if (reg8)
        begin
          reg18 <= (reg7[(3'h5):(1'h0)] * $unsigned(wire3[(4'hd):(3'h4)]));
          reg19 <= (&wire0);
          reg20 <= reg14[(3'h4):(1'h0)];
        end
      else
        begin
          reg18 <= $unsigned(reg13);
          reg19 <= ({(^wire2[(3'h5):(2'h3)]), (8'ha5)} ?
              {(8'ha0),
                  ((~^$signed(reg16)) ?
                      ((~|reg14) ?
                          (^wire0) : wire3[(3'h4):(2'h3)]) : reg11[(3'h6):(1'h0)])} : reg13);
        end
    end
  assign wire21 = (8'ha6);
  assign wire22 = $unsigned(reg8[(2'h2):(2'h2)]);
  assign wire23 = $unsigned($signed((($signed(wire21) && (reg12 ?
                          reg8 : reg9)) ?
                      ($signed((8'h9d)) ?
                          $unsigned((8'hb5)) : (^~wire1)) : (+(reg14 ?
                          reg20 : wire2)))));
  assign wire24 = $signed((|reg12[(3'h6):(3'h6)]));
  assign wire25 = reg15[(1'h1):(1'h0)];
  assign wire26 = (~|(~&(&((!reg8) ~^ (wire2 || reg19)))));
  assign wire27 = reg19;
  module28 #() modinst116 (wire115, clk, wire23, reg10, wire1, wire21, reg14);
  assign wire117 = $unsigned($unsigned((|wire4[(2'h2):(1'h0)])));
  assign wire118 = reg18[(4'ha):(4'h9)];
  assign wire119 = wire6[(3'h5):(1'h1)];
  assign wire120 = reg14[(3'h4):(1'h0)];
  assign wire121 = reg13[(2'h2):(1'h1)];
  assign wire122 = $signed((&$signed(reg15)));
  assign wire123 = (8'hbf);
  assign wire124 = $unsigned(($unsigned({wire27[(4'hc):(4'hb)]}) ?
                       ({wire118,
                           $unsigned(wire26)} && ((!reg11) ~^ $unsigned(wire21))) : $unsigned((|$unsigned((8'hb1))))));
  assign wire125 = ($signed((~(reg7 | $unsigned(wire23)))) > ((($signed(reg8) != $unsigned(wire25)) - wire1) <<< reg11[(4'hc):(4'h9)]));
  always
    @(posedge clk) begin
      if ($signed(wire119))
        begin
          reg126 <= (8'h9e);
          reg127 <= wire117[(4'h9):(1'h0)];
          reg128 <= (({$unsigned(reg18[(1'h0):(1'h0)]),
                  ((+reg7) <<< wire22[(2'h3):(2'h3)])} ?
              (|wire25[(1'h1):(1'h0)]) : wire23[(4'hd):(4'hb)]) == {(&reg14)});
          reg129 <= (&(&wire5));
          reg130 <= (^~(|$signed((reg13 ?
              $unsigned(reg10) : {(8'ha2), (8'ha3)}))));
        end
      else
        begin
          reg126 <= $unsigned({$unsigned(((reg12 ? (8'ha9) : reg15) ?
                  wire125 : (|wire21)))});
          if ($signed((|(wire120 == wire6))))
            begin
              reg127 <= (^~{{wire119[(1'h0):(1'h0)],
                      ({wire4, (8'hbe)} ^ $signed(wire0))},
                  ((!wire123) ? (^wire125) : {wire120})});
              reg128 <= reg19;
              reg129 <= $unsigned(wire115);
            end
          else
            begin
              reg127 <= $unsigned(wire22);
            end
          reg130 <= {$signed(wire120), reg11};
        end
      reg131 <= (reg9[(4'h8):(1'h0)] ?
          $unsigned((^((reg127 & (8'hbd)) && (reg14 == wire21)))) : {(~&$signed(reg127)),
              (reg9 ?
                  $signed($unsigned(reg20)) : ((+(8'hb4)) ?
                      reg7[(3'h4):(3'h4)] : wire2))});
      if ({(^~(&(reg17 ? (reg128 ? reg130 : wire5) : wire125))),
          (wire118[(4'hc):(3'h7)] >>> (($unsigned(wire25) ?
                  $unsigned(reg130) : $unsigned(reg15)) ?
              (reg15[(1'h0):(1'h0)] ?
                  (~(8'h9c)) : {(8'h9f)}) : (((8'hbe) ^~ reg13) & $signed(reg19))))})
        begin
          reg132 <= ($signed($unsigned(({reg14, wire2} ?
                  (^~reg129) : $signed(reg7)))) ?
              ({(reg19 ?
                      (reg18 ? reg130 : reg19) : (wire120 ?
                          wire122 : (8'ha7)))} >= wire118) : $unsigned(({$signed(wire2),
                  (wire3 ? wire4 : wire0)} & reg10[(3'h4):(1'h1)])));
          reg133 <= {($unsigned($signed((wire119 ?
                  (8'ha9) : reg20))) <= (reg129 >>> wire120[(3'h4):(3'h4)]))};
          reg134 <= (($signed(reg8[(5'h11):(4'hb)]) & (wire123[(4'hb):(3'h7)] * $signed((!wire1)))) >= reg19[(3'h4):(3'h4)]);
          reg135 <= $unsigned(reg132[(4'h8):(2'h3)]);
          reg136 <= $signed($signed(({(reg18 ?
                  wire123 : reg18)} == {(~&(7'h42))})));
        end
      else
        begin
          if (wire115)
            begin
              reg132 <= $unsigned({(($signed(wire123) ?
                      (reg17 ? reg16 : (8'hb1)) : {reg11,
                          wire123}) == (!reg11[(4'hc):(2'h3)]))});
              reg133 <= (8'haa);
            end
          else
            begin
              reg132 <= reg135;
              reg133 <= {$unsigned($signed($signed(wire115))),
                  (reg131[(4'hc):(1'h1)] ?
                      (8'hb4) : (((~reg136) | (!reg129)) ?
                          wire22[(3'h4):(3'h4)] : (^~reg9)))};
              reg134 <= reg8[(4'hd):(2'h2)];
              reg135 <= wire23[(4'hf):(4'he)];
              reg136 <= (~((&((reg17 & reg129) + (reg17 ? (8'h9e) : reg130))) ?
                  reg131 : ($signed($unsigned(wire25)) ?
                      ({reg8, wire1} >>> reg135) : ($signed((8'h9c)) ?
                          reg13[(4'hc):(1'h1)] : (reg20 != wire117)))));
            end
          reg137 <= $unsigned((^reg8));
          reg138 <= (~&$unsigned($unsigned($signed({reg136, reg130}))));
          if (wire124[(3'h4):(3'h4)])
            begin
              reg139 <= reg126[(4'hc):(2'h3)];
              reg140 <= wire124;
            end
          else
            begin
              reg139 <= reg129;
              reg140 <= (($unsigned((|(wire5 ?
                      reg16 : reg19))) - ((|wire23[(4'ha):(4'h9)]) == (7'h40))) ?
                  reg139[(5'h12):(3'h4)] : reg7);
              reg141 <= (~&$unsigned(($signed((&reg7)) ?
                  $signed(((8'hbd) != wire115)) : (wire115[(1'h1):(1'h0)] < ((8'hb2) ?
                      reg131 : reg137)))));
              reg142 <= (~&{(|wire24), (&{(~&reg127), $unsigned(reg131)})});
            end
        end
    end
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire33;
  input wire [(4'h9):(1'h0)] wire32;
  input wire signed [(4'he):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire113;
  wire [(4'hd):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire110;
  wire [(5'h10):(1'h0)] wire109;
  wire signed [(4'h8):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire102;
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire58,
                 wire36,
                 wire35,
                 wire34,
                 wire60,
                 wire102,
                 (1'h0)};
  assign wire34 = (7'h42);
  assign wire35 = wire32[(2'h3):(1'h0)];
  assign wire36 = wire34;
  module37 #() modinst59 (.wire39(wire29), .clk(clk), .wire40(wire30), .wire42(wire34), .wire41(wire33), .y(wire58), .wire38(wire31));
  assign wire60 = wire34[(2'h2):(1'h1)];
  module61 #() modinst103 (wire102, clk, wire31, wire30, wire34, wire33, wire36);
  assign wire104 = wire35;
  assign wire105 = wire58[(1'h0):(1'h0)];
  assign wire106 = {$signed($signed(((wire102 > wire105) ~^ $unsigned(wire60))))};
  assign wire107 = (&(^~$signed((~^$signed((7'h42))))));
  assign wire108 = $signed((!{wire106[(4'h9):(3'h4)]}));
  assign wire109 = wire29;
  assign wire110 = wire60[(4'h9):(2'h2)];
  assign wire111 = wire36;
  assign wire112 = {(wire110 ?
                           (&(~(wire34 ?
                               wire35 : wire31))) : $unsigned($signed($unsigned(wire105))))};
  assign wire113 = wire111;
  assign wire114 = {wire104[(4'ha):(3'h7)]};
endmodule

module module61
#(parameter param100 = {(|(((|(7'h40)) ? (&(8'ha1)) : {(8'ha7), (8'ha8)}) >= (((8'hb7) != (8'hb5)) ? {(8'hac)} : (|(8'hba))))), ((+(^~(^(8'hbc)))) && ((((7'h41) ? (8'haf) : (8'hb6)) ? ((8'ha7) ? (8'ha9) : (8'ha1)) : {(8'had)}) ? (((8'ha6) ? (8'hb5) : (8'hac)) ~^ ((8'ha7) ? (8'ha1) : (8'hb1))) : ({(8'hb8)} ? (&(8'ha9)) : {(7'h42)})))}, 
parameter param101 = param100)
(y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire66;
  input wire signed [(3'h6):(1'h0)] wire65;
  input wire [(5'h13):(1'h0)] wire64;
  input wire signed [(3'h6):(1'h0)] wire63;
  input wire signed [(3'h6):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire [(5'h15):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  assign y = {wire99,
                 wire91,
                 wire90,
                 wire89,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire67 = (+{($signed((wire66 - wire62)) & wire62[(2'h3):(2'h3)]),
                      ((wire63 ?
                              (wire66 ? wire64 : wire62) : (wire66 ?
                                  (8'hbf) : wire64)) ?
                          ((!(8'ha9)) ?
                              $signed(wire62) : {wire66}) : wire63[(1'h0):(1'h0)])});
  assign wire68 = ((($signed(wire63[(3'h5):(3'h4)]) ?
                              wire64 : wire66[(4'h8):(3'h5)]) ?
                          $unsigned(((wire66 - wire62) >>> $unsigned((8'hae)))) : ({(wire67 ^ wire63)} ?
                              {wire64} : $signed((wire65 ^ wire66)))) ?
                      wire62[(1'h0):(1'h0)] : $unsigned($unsigned(wire65[(3'h5):(3'h5)])));
  assign wire69 = ($unsigned((((wire64 ? wire68 : wire64) ^ (wire66 ?
                      wire66 : wire68)) & wire64)) <= wire67);
  assign wire70 = wire67;
  always
    @(posedge clk) begin
      reg71 <= $signed(wire70[(2'h2):(1'h0)]);
      reg72 <= (wire70 ? (!(!wire70)) : wire63);
    end
  always
    @(posedge clk) begin
      if ((~|$signed(($unsigned({wire64,
          wire67}) || $unsigned(wire69[(4'he):(4'h9)])))))
        begin
          reg73 <= wire64[(5'h11):(3'h4)];
          reg74 <= ({(!reg73),
              (!wire68[(2'h3):(2'h3)])} ^ $signed(($signed((reg71 ?
                  wire70 : wire68)) ?
              (8'hbc) : $signed(wire67))));
          reg75 <= ((~(~reg73)) ?
              (~&(^~wire65)) : {wire62[(1'h1):(1'h0)], (~(~&(8'haf)))});
          reg76 <= $signed(reg71);
        end
      else
        begin
          reg73 <= wire70[(3'h6):(3'h6)];
        end
      reg77 <= $unsigned($signed($signed(($unsigned(wire70) || wire65[(3'h4):(1'h0)]))));
      reg78 <= wire70[(3'h4):(3'h4)];
      if ((~&$unsigned(reg78)))
        begin
          reg79 <= $signed($signed((^~(reg72[(1'h1):(1'h0)] ?
              reg71 : wire67))));
          reg80 <= $signed((($signed((|reg75)) ~^ ((|(8'hb7)) ?
              wire66 : wire66)) == (reg77 < (reg77[(4'h9):(1'h0)] ^ ((8'hac) ?
              wire69 : wire64)))));
        end
      else
        begin
          reg79 <= $unsigned($unsigned(wire70[(3'h5):(1'h0)]));
          if ((((wire68 | $unsigned((reg78 ?
                  reg74 : reg79))) && (reg77[(2'h2):(1'h1)] < {{wire62},
                  reg72})) ?
              (wire70 ?
                  $unsigned(reg80[(3'h6):(3'h4)]) : wire63[(3'h6):(1'h1)]) : (wire70 ?
                  wire70 : (8'ha4))))
            begin
              reg80 <= (wire62 ~^ wire69);
              reg81 <= ($unsigned(($unsigned((reg72 ~^ reg78)) ^ ($signed(wire70) >= {reg72}))) ?
                  reg79 : wire69);
            end
          else
            begin
              reg80 <= $signed(wire63[(2'h2):(1'h0)]);
              reg81 <= reg76;
              reg82 <= wire67;
              reg83 <= (reg77[(3'h4):(2'h2)] ?
                  $unsigned(wire65[(2'h3):(1'h0)]) : wire65[(2'h2):(2'h2)]);
              reg84 <= ((~^reg77[(1'h1):(1'h0)]) ?
                  $signed(reg75) : ($unsigned((8'hb4)) >> (~|reg79[(3'h4):(2'h3)])));
            end
          reg85 <= wire63[(1'h0):(1'h0)];
        end
      if (($signed((((reg73 ? reg74 : reg83) ? (wire64 ^ reg73) : reg73) ?
              ((^~reg75) <= (wire70 ^~ reg73)) : {((8'ha2) ? reg85 : reg73),
                  (reg77 <<< (8'had))})) ?
          wire64[(5'h12):(5'h11)] : ({$unsigned((reg78 * wire63)),
              wire67} <<< (&$unsigned(wire70[(1'h0):(1'h0)])))))
        begin
          reg86 <= $signed(wire70[(3'h4):(2'h3)]);
          reg87 <= reg74;
          reg88 <= wire64;
        end
      else
        begin
          reg86 <= (($unsigned(reg79[(4'ha):(1'h0)]) ?
              {wire68, wire63[(3'h4):(3'h4)]} : $signed({(wire63 ?
                      wire64 : reg74)})) + reg81[(3'h5):(2'h3)]);
          reg87 <= $signed($signed((8'hba)));
        end
    end
  assign wire89 = $signed({$unsigned((~|{(8'hb2), reg81}))});
  assign wire90 = (($signed(reg76[(2'h3):(1'h0)]) & wire66) <<< ((((reg80 >>> wire67) ?
                      $signed(wire69) : (wire68 ?
                          wire63 : reg71)) <= $signed((^wire62))) > {reg74[(1'h0):(1'h0)]}));
  assign wire91 = $unsigned(reg81);
  always
    @(posedge clk) begin
      reg92 <= $signed(reg72[(3'h5):(2'h2)]);
      reg93 <= wire89;
      reg94 <= $signed(reg83[(1'h1):(1'h0)]);
      reg95 <= (reg86[(2'h2):(1'h1)] & reg83[(2'h3):(1'h0)]);
      if ((((($signed(reg73) ?
                  $signed(wire89) : ((8'h9f) ?
                      wire68 : wire69)) ^~ (-$signed(reg76))) ?
              wire63[(3'h5):(1'h0)] : $signed($signed(reg77))) ?
          reg84[(1'h0):(1'h0)] : wire66[(4'h8):(4'h8)]))
        begin
          reg96 <= (|$signed(reg75));
          reg97 <= ($unsigned($unsigned(($signed(reg87) >= ((8'hbf) - reg79)))) == (&((~|$unsigned(reg73)) ?
              {(reg87 ? wire90 : reg82),
                  $unsigned(wire69)} : $unsigned((wire67 == reg81)))));
          reg98 <= {$unsigned((&(reg73[(1'h1):(1'h1)] ?
                  (reg75 ? reg93 : reg74) : (reg86 >> reg75))))};
        end
      else
        begin
          reg96 <= (($signed($unsigned($unsigned(wire63))) ?
              ((7'h41) ? reg76 : (!reg88)) : reg76) * ({{$signed((8'h9e))},
              (wire66[(3'h5):(1'h1)] ?
                  {wire70, reg73} : (^~reg96))} == (8'haa)));
        end
    end
  assign wire99 = (({$unsigned((wire64 ? wire63 : wire89)),
                      $signed({reg94,
                          (8'h9e)})} >= $unsigned(((^~wire65) == (^reg96)))) > wire65);
endmodule

module module37
#(parameter param57 = (~^(((!(~&(8'ha0))) ^ {((8'ha4) ? (8'haf) : (8'ha4)), (^~(8'hac))}) ? (({(8'ha1)} ? ((8'hbb) <<< (8'hb8)) : ((8'hb2) > (8'hb0))) ? (7'h40) : (((8'ha8) + (8'hb0)) ? ((8'ha8) ? (8'hab) : (8'ha2)) : {(8'ha7)})) : (-(((8'hb8) ? (8'hb2) : (8'hb4)) == ((8'hbf) >= (8'ha4)))))))
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire42;
  input wire signed [(5'h12):(1'h0)] wire41;
  input wire signed [(5'h15):(1'h0)] wire40;
  input wire [(4'hd):(1'h0)] wire39;
  input wire signed [(2'h3):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire50,
                 wire49,
                 wire44,
                 wire43,
                 reg52,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire43 = $unsigned({({wire38[(2'h3):(2'h3)], wire39} ?
                          (wire42[(1'h1):(1'h1)] || {wire38,
                              wire42}) : $signed($signed(wire38))),
                      (wire41 ^~ $signed((|wire39)))});
  assign wire44 = wire42;
  always
    @(posedge clk) begin
      reg45 <= {wire39[(3'h5):(3'h5)]};
      if (reg45)
        begin
          reg46 <= wire41;
          reg47 <= (({wire43} ^~ $unsigned({{wire43, wire40},
                  (wire41 << wire38)})) ?
              wire38[(1'h0):(1'h0)] : ($signed(reg45) ?
                  (&(wire41 * wire44[(1'h1):(1'h0)])) : $unsigned((^~wire43))));
        end
      else
        begin
          reg46 <= (|wire40[(1'h1):(1'h0)]);
        end
      reg48 <= (wire41[(2'h2):(1'h1)] ?
          $unsigned({wire44[(3'h4):(2'h3)],
              $unsigned($signed(wire38))}) : (reg45 << wire42));
    end
  assign wire49 = (wire39[(1'h1):(1'h1)] * reg45);
  assign wire50 = (+(wire49[(3'h4):(2'h3)] ?
                      (((8'h9e) ?
                          reg46[(3'h5):(2'h3)] : (~|reg47)) ^ (+wire41[(5'h12):(1'h0)])) : wire41));
  assign wire51 = ($unsigned((~^{{reg48},
                      reg45[(4'h9):(4'h8)]})) ^~ wire49[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg52 <= (^$signed(($signed(reg47) ^ reg47[(5'h10):(1'h0)])));
    end
  assign wire53 = (~&($unsigned($unsigned((wire39 >> (8'ha6)))) ?
                      reg47[(3'h7):(2'h3)] : wire39));
  assign wire54 = ($signed(wire53[(3'h5):(1'h0)]) && (8'ha2));
  assign wire55 = $unsigned($signed($unsigned($signed($unsigned(reg48)))));
  assign wire56 = (wire51[(2'h2):(1'h0)] ?
                      $signed((reg48 ?
                          ((-wire54) ?
                              (!wire53) : $signed(reg47)) : (+wire39))) : reg48[(4'he):(2'h3)]);
endmodule
