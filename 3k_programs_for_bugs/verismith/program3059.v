module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h211):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  wire signed [(5'h14):(1'h0)] wire147;
  wire signed [(3'h6):(1'h0)] wire125;
  wire signed [(3'h7):(1'h0)] wire124;
  wire [(5'h14):(1'h0)] wire123;
  wire signed [(4'h9):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire118;
  wire [(3'h6):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire115;
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg143 = (1'h0);
  reg [(4'h8):(1'h0)] reg142 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg130 = (1'h0);
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire147,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire4,
                 wire5,
                 wire6,
                 wire15,
                 wire115,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = $signed((!($unsigned((wire1 ?
                     (8'haa) : wire2)) ^~ $signed(wire0))));
  assign wire5 = wire2[(3'h5):(1'h1)];
  assign wire6 = wire4;
  always
    @(posedge clk) begin
      if ($unsigned((wire4 << wire1)))
        begin
          reg7 <= ((&$signed({$signed(wire3), (wire2 & (8'hb3))})) ?
              (wire5[(1'h0):(1'h0)] ?
                  $unsigned(((wire4 && wire3) ?
                      (&(8'ha7)) : $signed(wire1))) : $signed($signed(wire5))) : (-wire6));
          if (wire2[(2'h3):(1'h1)])
            begin
              reg8 <= wire1[(2'h3):(2'h2)];
            end
          else
            begin
              reg8 <= $unsigned(wire3);
              reg9 <= wire0[(4'h8):(1'h1)];
            end
          reg10 <= $signed((8'hbd));
          reg11 <= $signed($unsigned(($signed($signed(wire1)) + (|reg9[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg7 <= $unsigned(reg9);
        end
      reg12 <= ((~wire0) ?
          (~(8'hbf)) : (wire3[(2'h3):(2'h2)] ^ (reg7[(1'h0):(1'h0)] ?
              reg8[(1'h0):(1'h0)] : ((reg9 ~^ wire0) ?
                  $signed(wire2) : (reg8 ? wire1 : wire6)))));
      reg13 <= reg7[(2'h3):(2'h2)];
      reg14 <= $unsigned((($unsigned(wire5) ?
          $unsigned({wire4}) : ($signed(reg7) ?
              $unsigned(wire0) : (~reg12))) ^~ ((~&(~wire6)) >= reg8[(3'h7):(3'h7)])));
    end
  assign wire15 = {(((~|reg12[(4'hc):(4'h8)]) ?
                              (!(!(8'ha1))) : ($unsigned(wire0) ?
                                  wire4[(4'hd):(4'hc)] : reg13[(3'h5):(2'h3)])) ?
                          reg13 : $signed(reg10[(2'h2):(1'h0)])),
                      wire4};
  module16 #() modinst116 (wire115, clk, reg11, reg7, wire2, wire6, wire5);
  assign wire117 = (&(8'ha4));
  assign wire118 = $signed(($unsigned({$signed(wire5)}) ?
                       reg8 : ($unsigned(wire5[(3'h7):(1'h0)]) ?
                           ($unsigned((8'ha5)) ^ (8'ha1)) : ((wire5 ^~ (8'hb2)) <= (wire2 ?
                               wire4 : wire5)))));
  assign wire119 = (wire2 ?
                       (^((~^$unsigned(reg9)) <= (wire117 ?
                           $signed(reg11) : (!reg11)))) : $signed({($signed((8'ha1)) ?
                               (-wire2) : (reg7 ? (8'hb1) : wire3)),
                           reg12}));
  assign wire120 = (($signed(wire2) < ((reg7[(4'h8):(3'h7)] ?
                       (!wire118) : (reg9 ? wire117 : wire2)) <<< (((7'h42) ?
                       wire1 : reg8) && $unsigned(wire1)))) | (wire2[(3'h4):(2'h3)] ^~ ($signed((wire0 ?
                       wire4 : reg14)) == $unsigned($signed(reg13)))));
  assign wire121 = wire15[(3'h5):(1'h0)];
  assign wire122 = (~&$unsigned($unsigned(wire119[(4'h8):(3'h5)])));
  assign wire123 = reg11;
  assign wire124 = reg12;
  assign wire125 = (~^wire124);
  always
    @(posedge clk) begin
      if (wire6[(1'h1):(1'h1)])
        begin
          reg126 <= $signed((&$signed(((&wire3) ?
              $signed(reg7) : wire124[(3'h6):(2'h3)]))));
          reg127 <= reg126;
          if ($signed(($unsigned(wire119[(3'h5):(3'h5)]) ?
              ((reg8 << {wire115}) ?
                  (|$unsigned(wire122)) : $unsigned((wire5 ^ (8'hb9)))) : $signed((^((8'hb9) ?
                  wire5 : reg14))))))
            begin
              reg128 <= $signed((($signed($signed(wire122)) ?
                  $unsigned((~^(8'h9f))) : wire118) * wire15));
            end
          else
            begin
              reg128 <= (wire119[(2'h2):(1'h0)] ?
                  (~^($signed((~&wire5)) ?
                      {(reg9 || (8'ha2))} : {{reg14,
                              (8'hb6)}})) : ($unsigned(wire4) ?
                      (-($unsigned((8'hbc)) == (~^wire5))) : ({(wire122 << (8'haf))} > wire0)));
              reg129 <= $unsigned((reg7 <<< $signed(((wire0 ?
                      (8'hae) : wire125) ?
                  (reg7 ? (7'h42) : wire0) : wire1))));
              reg130 <= reg8;
            end
        end
      else
        begin
          reg126 <= (~^reg129[(1'h0):(1'h0)]);
          reg127 <= ((reg129[(5'h14):(4'hb)] <<< (!(~reg126[(1'h1):(1'h0)]))) & (^~{(8'ha7)}));
        end
      if ((~|reg130))
        begin
          reg131 <= (($unsigned($signed((reg8 ?
                  wire118 : reg8))) != (wire2[(3'h6):(2'h2)] ?
                  (wire124[(2'h3):(2'h2)] ?
                      $signed((8'hb0)) : (reg14 ?
                          wire124 : reg127)) : ({(8'ha1), reg12} ?
                      {reg130, reg11} : (reg130 ? wire15 : wire117)))) ?
              wire4 : $unsigned(($signed(wire125) ?
                  ($signed(reg129) ?
                      (reg9 > (8'ha1)) : $unsigned(reg126)) : wire115)));
          if (wire6[(1'h0):(1'h0)])
            begin
              reg132 <= (wire15[(3'h4):(2'h2)] || reg12);
              reg133 <= $unsigned(reg8);
              reg134 <= ($signed($signed($unsigned(reg8[(4'ha):(3'h5)]))) ?
                  (($signed($unsigned(wire121)) & $signed(reg10)) <= (wire4 ?
                      $signed({wire123,
                          reg129}) : reg129[(3'h7):(1'h1)])) : $unsigned(((~wire118) ?
                      (^$unsigned(reg127)) : $signed((wire6 <= (8'ha5))))));
              reg135 <= (reg11 ^ {wire1[(1'h1):(1'h0)],
                  {reg11[(4'h8):(3'h5)], $signed($signed(reg130))}});
            end
          else
            begin
              reg132 <= ((~|(+(&{wire119, wire3}))) ?
                  (wire125[(2'h3):(1'h1)] ?
                      ({(~^reg126),
                          {wire0}} == $unsigned((~^(8'ha3)))) : (+({(8'h9c)} || reg128[(5'h10):(2'h2)]))) : {reg8[(2'h2):(2'h2)]});
              reg133 <= (~&((reg128[(4'hc):(3'h7)] && ((+reg134) > $signed(wire117))) * ({$signed(reg130)} != $signed($unsigned(reg11)))));
            end
          reg136 <= ($signed(($unsigned(wire118) ^ $unsigned((wire118 > reg9)))) - $unsigned((reg14[(3'h4):(3'h4)] ~^ $signed((wire1 ?
              reg130 : reg132)))));
        end
      else
        begin
          reg131 <= wire115;
          reg132 <= ($signed(wire125[(1'h0):(1'h0)]) ?
              (($unsigned({reg14, wire2}) ?
                      {wire121[(4'hb):(4'h8)],
                          (reg12 ? wire121 : (8'hb1))} : reg136) ?
                  $unsigned($signed(reg13)) : reg7[(1'h1):(1'h0)]) : $unsigned((8'hbd)));
          if (((-wire1) >> $unsigned($signed(reg132))))
            begin
              reg133 <= wire117[(1'h0):(1'h0)];
              reg134 <= (((+{reg127[(2'h3):(1'h0)], (|reg130)}) >= (~^reg11)) ?
                  ((({reg9, reg129} ?
                              $signed(reg10) : (wire1 ? reg128 : wire115)) ?
                          wire4[(3'h7):(3'h4)] : ((|reg130) | $signed(wire121))) ?
                      (($signed(reg7) ?
                              (reg8 ? wire6 : wire6) : {reg132, (8'hbb)}) ?
                          ((wire118 ? reg134 : reg128) >> (reg10 ?
                              wire121 : wire6)) : $signed(reg12[(4'hc):(3'h4)])) : (^~$unsigned(wire121[(4'ha):(3'h5)]))) : $unsigned(wire1));
              reg135 <= $signed($unsigned(wire5[(3'h4):(3'h4)]));
              reg136 <= (({$unsigned($signed((8'ha0))), (|wire115)} ?
                  $unsigned(((wire124 && wire2) & (reg126 ?
                      wire119 : reg129))) : (((reg13 ? (8'h9c) : reg127) ?
                          (reg9 ^~ reg9) : reg130[(5'h10):(3'h6)]) ?
                      $unsigned((wire122 + reg14)) : (wire120 ?
                          $signed(reg134) : $unsigned((8'hb0))))) && (!$signed($signed((wire4 ~^ reg131)))));
              reg137 <= wire117[(1'h0):(1'h0)];
            end
          else
            begin
              reg133 <= {wire118[(2'h3):(2'h3)]};
              reg134 <= reg129[(4'hd):(4'h8)];
              reg135 <= (^{$signed(((-wire117) ?
                      ((8'hbb) ? wire118 : wire1) : $signed((7'h40))))});
              reg136 <= reg126;
              reg137 <= (reg9[(1'h1):(1'h0)] ?
                  ((&wire1) ?
                      reg128[(3'h5):(3'h4)] : {(-{(8'hb9)}),
                          ((wire121 ? reg133 : reg12) | (reg127 ?
                              reg126 : reg13))}) : $unsigned(reg126));
            end
          reg138 <= $signed((reg136[(3'h5):(3'h5)] == $signed((!wire122))));
          reg139 <= ((|$unsigned({wire118[(3'h5):(1'h0)]})) ?
              $unsigned((^wire6)) : ($signed((~^(wire120 || wire0))) >> (((wire119 ~^ reg13) - ((8'ha9) ?
                  reg132 : wire120)) | (~&(|reg8)))));
        end
      if (({($unsigned($signed(reg131)) ?
                  ((^~(7'h41)) ^ $signed(wire125)) : reg12[(5'h12):(4'hf)])} ?
          (^~wire121[(4'hc):(4'ha)]) : (((reg13[(3'h5):(3'h4)] ?
                      (wire117 & wire0) : {reg133}) ?
                  ({reg133} < reg9) : $signed($signed((8'ha4)))) ?
              $unsigned($unsigned(reg135[(1'h0):(1'h0)])) : ({$unsigned((8'hb7))} ?
                  (^(~wire0)) : {reg137[(2'h3):(2'h2)]}))))
        begin
          reg140 <= (~|(wire5 ?
              wire4 : $unsigned(((reg134 > wire123) ~^ wire125[(2'h2):(2'h2)]))));
          reg141 <= $unsigned({(((reg131 != wire6) ?
                      $unsigned(reg139) : $unsigned(reg131)) ?
                  (wire118 && (|reg12)) : (wire0 ?
                      (reg139 - wire3) : $unsigned((8'ha0))))});
        end
      else
        begin
          reg140 <= reg126;
          if (($unsigned($unsigned((|wire121[(4'h8):(1'h1)]))) << $unsigned({(~^(~^reg14))})))
            begin
              reg141 <= ((((reg13 >= (wire119 ?
                      reg14 : wire117)) << (^$signed(reg127))) ?
                  ({(!wire117)} ?
                      (^((8'ha8) ?
                          wire117 : (8'ha0))) : ($unsigned(reg141) == $signed(reg139))) : (|reg139[(4'hd):(4'h8)])) <<< (wire1 ?
                  $unsigned((8'haf)) : {(reg139[(4'h9):(3'h7)] ?
                          {reg131, reg126} : {reg8})}));
              reg142 <= $unsigned(reg139[(4'h8):(1'h1)]);
            end
          else
            begin
              reg141 <= {$signed((((^~(8'hbc)) ? reg14 : (~&wire119)) ?
                      (~^(reg128 || wire123)) : {(reg131 ^ reg132),
                          $signed((8'ha9))}))};
            end
          reg143 <= (^~$signed(reg127[(5'h13):(3'h6)]));
          reg144 <= {(((|$signed((8'hbf))) ?
                  $unsigned(wire122) : ($signed(reg128) <<< reg131[(2'h3):(1'h1)])) || (reg139 ?
                  (|(~|wire121)) : (~^$signed((8'ha8))))),
              (~wire120[(2'h2):(1'h0)])};
          reg145 <= ($signed({(reg133[(4'hb):(1'h0)] ?
                  $unsigned(reg132) : ((8'hb6) ? reg7 : (8'hb0))),
              wire120[(4'h8):(3'h7)]}) || {(&(8'hb8)), wire1});
        end
      reg146 <= (wire0[(3'h6):(3'h6)] != reg128);
    end
  assign wire147 = reg141[(1'h0):(1'h0)];
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire signed [(4'hf):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire [(2'h2):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire113;
  wire signed [(4'hd):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire110;
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire49,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire51,
                 wire110,
                 reg29,
                 (1'h0)};
  assign wire22 = $signed(($unsigned(wire21[(1'h1):(1'h0)]) ?
                      (!((wire17 ?
                          wire17 : wire17) <= wire21[(1'h0):(1'h0)])) : ($unsigned((wire18 ?
                              (8'hbb) : wire20)) ?
                          wire17 : (wire21 >> $unsigned(wire17)))));
  assign wire23 = wire22[(3'h6):(3'h5)];
  assign wire24 = (~$unsigned($unsigned(wire20)));
  assign wire25 = {$signed((+wire20))};
  assign wire26 = ($signed((^~wire24)) ?
                      ($signed(($signed(wire24) ?
                              (wire20 >> wire17) : wire20)) ?
                          {(&wire19[(1'h0):(1'h0)])} : $unsigned(wire25[(4'hf):(4'he)])) : $signed($unsigned(wire25[(3'h7):(3'h4)])));
  assign wire27 = (&((~$signed((~wire19))) - $unsigned($signed((wire24 ?
                      wire26 : wire18)))));
  assign wire28 = ($signed(wire20[(2'h3):(1'h1)]) ?
                      {({(!wire25)} ~^ ((wire19 ? (7'h42) : wire19) ?
                              (wire21 ?
                                  wire17 : wire19) : $unsigned(wire17)))} : (^~(wire18[(1'h1):(1'h0)] ?
                          $signed((7'h43)) : wire24)));
  always
    @(posedge clk) begin
      reg29 <= ($signed(wire23[(3'h6):(2'h3)]) ?
          $unsigned(($unsigned($unsigned(wire18)) ?
              (-(~^wire28)) : (|wire21))) : wire25);
    end
  assign wire30 = wire25[(4'hf):(3'h6)];
  module31 #() modinst50 (wire49, clk, wire27, wire24, wire17, reg29);
  assign wire51 = {$signed({$unsigned((wire18 ? reg29 : wire23))})};
  module52 #() modinst111 (wire110, clk, wire20, wire21, wire28, wire51, wire30);
  assign wire112 = $signed(wire21[(4'he):(4'he)]);
  assign wire113 = {wire27};
  assign wire114 = (8'hb6);
endmodule

module module52
#(parameter param108 = ({(!({(8'hb8), (8'ha3)} ? ((8'hb6) ? (7'h42) : (8'hae)) : ((8'hbe) | (8'hb6)))), ((((8'hb4) ^~ (8'ha1)) < ((8'h9d) ? (7'h42) : (8'h9d))) > ({(7'h40), (8'ha7)} ? (~^(8'hbd)) : (~|(8'hb1))))} * ((~|({(8'ha3)} ? (+(7'h42)) : ((8'ha3) <= (8'ha0)))) ? (8'ha7) : (((^~(8'h9d)) ? ((8'hb4) > (8'ha5)) : (&(8'hbb))) ^ (((8'ha6) <<< (8'hbc)) && (~&(8'hbb)))))), 
parameter param109 = (8'h9e))
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h268):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire57;
  input wire signed [(4'he):(1'h0)] wire56;
  input wire signed [(3'h7):(1'h0)] wire55;
  input wire signed [(5'h15):(1'h0)] wire54;
  input wire signed [(5'h11):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire106;
  wire [(4'hf):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire58;
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire81,
                 wire80,
                 wire74,
                 wire73,
                 wire72,
                 wire63,
                 wire60,
                 wire59,
                 wire58,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
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
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire58 = (+(($unsigned($unsigned(wire53)) ?
                      wire56[(1'h1):(1'h0)] : $unsigned(wire55)) >>> wire57));
  assign wire59 = wire55[(3'h7):(3'h4)];
  assign wire60 = (~((^{(~^wire59)}) ?
                      $unsigned((~(~wire57))) : {$unsigned((wire58 ?
                              wire59 : wire56))}));
  always
    @(posedge clk) begin
      reg61 <= $signed($signed((wire59[(2'h3):(1'h1)] >= (~^$unsigned(wire53)))));
      reg62 <= $signed($signed((({wire58, (8'hb3)} != ((8'hb1) ?
              wire53 : (8'hae))) ?
          (~|wire56) : wire57[(3'h5):(2'h2)])));
    end
  assign wire63 = reg61[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg64 <= $unsigned($signed((wire57[(1'h1):(1'h0)] | $signed({wire63}))));
      if ((+((^~($unsigned(wire56) > $signed(wire59))) || ($signed($signed(reg62)) ?
          {(reg61 ? reg64 : wire59),
              (wire53 ? wire59 : wire59)} : reg64[(1'h1):(1'h0)]))))
        begin
          reg65 <= ((~&$unsigned($signed($signed(wire59)))) >>> wire59);
          if ({(($unsigned($unsigned(reg61)) ?
                  (reg61 & wire59[(1'h1):(1'h0)]) : ((wire59 ^~ wire56) ?
                      wire60 : {(8'hba), wire60})) && {(~(wire54 ?
                      wire53 : reg61)),
                  wire56})})
            begin
              reg66 <= $unsigned(reg61[(3'h5):(2'h3)]);
              reg67 <= $unsigned(reg61[(3'h5):(3'h5)]);
              reg68 <= (+($unsigned((+(^~wire57))) ^ wire53));
              reg69 <= wire63;
            end
          else
            begin
              reg66 <= ((~^$signed({(wire56 ?
                      wire57 : reg69)})) < ((8'ha1) ^~ ((((8'ha8) ?
                  (8'hb4) : (8'ha0)) + reg69) | {reg68[(3'h5):(2'h2)]})));
            end
        end
      else
        begin
          if (reg69[(2'h3):(1'h1)])
            begin
              reg65 <= ({(8'hb6)} ?
                  $unsigned(((wire57 ?
                      (&reg61) : {(8'hbb),
                          wire54}) & (!(8'hb4)))) : (~^$signed(($unsigned(wire55) ?
                      ((8'hbf) ? wire57 : wire56) : (reg65 && wire58)))));
            end
          else
            begin
              reg65 <= {($unsigned({$unsigned(reg62), $signed((8'hba))}) ?
                      (wire55[(2'h3):(1'h1)] ?
                          $signed((wire53 ? reg64 : (8'hb5))) : {{reg65,
                                  wire59}}) : $signed(reg69[(1'h0):(1'h0)]))};
              reg66 <= wire53[(4'h9):(2'h2)];
              reg67 <= wire53;
              reg68 <= reg68[(3'h5):(1'h1)];
            end
          if (wire60)
            begin
              reg69 <= {wire58[(3'h7):(3'h6)], $signed(wire63)};
              reg70 <= $signed($signed({(~^$unsigned(wire63))}));
              reg71 <= (reg65 ?
                  wire63[(3'h5):(1'h0)] : $signed((~^($signed(reg68) == $signed(wire58)))));
            end
          else
            begin
              reg69 <= $signed((8'ha0));
              reg70 <= (~|($unsigned((wire60 ?
                  {reg62} : (8'hb1))) | reg67[(1'h0):(1'h0)]));
            end
        end
    end
  assign wire72 = (^~$signed((~{(wire60 ? reg71 : (8'hbd))})));
  assign wire73 = wire60[(2'h3):(2'h2)];
  assign wire74 = {$signed($unsigned(wire63))};
  always
    @(posedge clk) begin
      reg75 <= (reg62[(2'h3):(1'h1)] ? wire63[(3'h7):(3'h6)] : reg61);
      reg76 <= reg70[(2'h2):(2'h2)];
      reg77 <= ((~$signed(reg67[(3'h4):(2'h3)])) ~^ ($signed(((8'had) ?
          $unsigned(wire63) : $unsigned(wire55))) <= {reg68}));
      reg78 <= reg64[(3'h4):(3'h4)];
      reg79 <= wire53;
    end
  assign wire80 = (((!(wire72 ? $signed(reg61) : (wire53 ? wire63 : wire63))) ?
                          $unsigned($signed({reg66,
                              reg67})) : (|(-wire58[(4'h8):(2'h3)]))) ?
                      $signed(wire55) : {(|reg75), wire74[(3'h5):(3'h5)]});
  assign wire81 = (^wire74);
  always
    @(posedge clk) begin
      if ($unsigned((8'hbe)))
        begin
          reg82 <= reg66;
        end
      else
        begin
          reg82 <= (wire56 ?
              (~|(((wire54 ^~ (8'hb5)) <= $unsigned((8'hb2))) ^~ $unsigned($unsigned((8'hb3))))) : $signed($signed(wire72[(3'h6):(1'h1)])));
          if ($unsigned((({wire55} ?
              $unsigned($unsigned(wire54)) : reg78[(1'h1):(1'h0)]) >>> $unsigned(wire81))))
            begin
              reg83 <= $unsigned($unsigned($signed(((reg62 + wire73) ?
                  wire63 : {reg69}))));
              reg84 <= {($unsigned((&reg75)) ?
                      (~^{reg83[(4'hf):(2'h2)],
                          $signed(reg75)}) : $unsigned($unsigned((reg82 ?
                          (8'hb1) : reg76)))),
                  (8'ha8)};
              reg85 <= (reg77[(1'h1):(1'h1)] ^ reg68);
              reg86 <= wire58;
            end
          else
            begin
              reg83 <= $unsigned(reg71);
              reg84 <= (&$unsigned({{reg61[(1'h0):(1'h0)],
                      reg77[(2'h2):(1'h1)]},
                  ($unsigned((8'ha2)) != ((8'ha9) ? reg69 : wire73))}));
              reg85 <= {{((~|(reg68 ? reg82 : reg64)) >= $unsigned(wire80))},
                  $unsigned($signed({$signed(wire63)}))};
              reg86 <= $unsigned($unsigned({{wire59[(1'h0):(1'h0)]},
                  (+(wire55 ? reg84 : reg71))}));
              reg87 <= $signed($unsigned(((((8'h9c) ?
                      reg75 : (8'hab)) << (reg69 ~^ wire53)) ?
                  reg64[(3'h4):(1'h1)] : (8'ha9))));
            end
          if ($signed(reg69[(3'h4):(1'h1)]))
            begin
              reg88 <= (!$signed($unsigned(wire53)));
              reg89 <= (wire56 ?
                  {reg67} : $unsigned((($signed(reg64) | reg67) - ($unsigned(reg71) ?
                      $unsigned((7'h44)) : wire72[(1'h0):(1'h0)]))));
              reg90 <= (!reg70);
            end
          else
            begin
              reg88 <= $unsigned(((wire60[(1'h0):(1'h0)] ?
                  reg89 : wire81[(2'h3):(2'h2)]) ^ (!$unsigned((^reg79)))));
            end
          reg91 <= wire63;
          reg92 <= (reg62 && ((~(~^reg67[(2'h3):(1'h1)])) << $unsigned($signed(reg88))));
        end
      reg93 <= ($signed((reg92 ?
          $unsigned((reg89 ? reg68 : (8'ha7))) : {{wire53,
                  reg82}})) && (~^reg91[(1'h1):(1'h1)]));
      reg94 <= ($signed((({reg92, wire63} || (wire58 ?
          wire72 : (8'ha8))) & (~$signed(wire63)))) == $signed($signed((wire60[(1'h0):(1'h0)] ?
          (8'haa) : wire57))));
      reg95 <= reg68;
      if ($signed($signed(reg92)))
        begin
          reg96 <= reg86[(1'h0):(1'h0)];
          reg97 <= reg64[(4'hc):(4'hb)];
          if (reg90[(4'h8):(4'h8)])
            begin
              reg98 <= {(reg67 ^~ $unsigned(wire72[(3'h5):(1'h1)]))};
              reg99 <= reg68;
              reg100 <= $unsigned(reg85[(4'he):(4'hc)]);
              reg101 <= reg75[(5'h14):(1'h1)];
            end
          else
            begin
              reg98 <= $unsigned(({($unsigned(reg95) ?
                      (~^wire60) : (reg95 + reg70)),
                  ($signed(reg87) ?
                      ((8'hbc) < (8'hab)) : (reg83 >>> (8'hb6)))} ~^ ($signed($signed(wire54)) | ($signed(wire57) + (~wire57)))));
              reg99 <= {reg68};
              reg100 <= $signed((reg69[(2'h2):(1'h1)] ?
                  (reg62 == $signed((8'hae))) : ((8'hb5) >> (wire53 ?
                      (~reg99) : (-reg98)))));
              reg101 <= $signed(((8'hbf) > $signed((~$unsigned(reg85)))));
            end
          reg102 <= reg97[(5'h12):(1'h1)];
          reg103 <= ((reg96[(5'h15):(4'hf)] >> $signed({$unsigned(reg79),
                  (8'ha6)})) ?
              (((8'hb1) || ($signed(reg99) ? (~(8'hb5)) : (!reg89))) ?
                  reg70[(4'h8):(3'h7)] : $unsigned($signed((~^reg100)))) : (8'ha3));
        end
      else
        begin
          reg96 <= $signed({(($unsigned(wire59) ?
                  (|reg102) : ((7'h44) ^ reg85)) || ($signed(reg88) ?
                  wire60 : (reg101 ? reg76 : reg95)))});
        end
    end
  assign wire104 = $signed(wire63[(2'h2):(1'h0)]);
  assign wire105 = $unsigned(reg93);
  assign wire106 = ($unsigned(wire56) ^~ (reg92[(5'h14):(5'h14)] ?
                       $signed($unsigned($signed(wire74))) : {reg86[(4'h9):(4'h8)],
                           (~&$signed(reg93))}));
  assign wire107 = $unsigned({(((8'hb3) ?
                           $signed(reg100) : reg67[(2'h3):(1'h1)]) <= ({(8'hba),
                               reg69} ?
                           {reg92} : reg87[(2'h2):(2'h2)])),
                       $unsigned(reg71[(5'h15):(4'h8)])});
endmodule

module module31  (y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire35;
  input wire [(4'h8):(1'h0)] wire34;
  input wire [(5'h13):(1'h0)] wire33;
  input wire [(2'h2):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire36;
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire41,
                 wire40,
                 wire36,
                 reg44,
                 reg43,
                 reg42,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire36 = wire33[(5'h11):(1'h0)];
  always
    @(posedge clk) begin
      reg37 <= wire34[(3'h7):(1'h0)];
      reg38 <= $signed(wire35[(3'h4):(1'h0)]);
      reg39 <= $unsigned((~&reg38[(4'hb):(2'h3)]));
    end
  assign wire40 = $unsigned($signed(wire35[(2'h3):(1'h0)]));
  assign wire41 = reg39[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg42 <= (($signed((~^{reg37, wire36})) ?
          $unsigned(wire41[(1'h1):(1'h0)]) : {wire40,
              (^~$signed(reg38))}) & ((-(((8'ha2) ? reg37 : reg37) ?
              (^~wire35) : (-wire40))) ?
          $signed((reg37[(2'h3):(1'h1)] >>> $signed(reg37))) : reg39[(4'hf):(4'h9)]));
      reg43 <= wire32[(2'h2):(1'h1)];
      reg44 <= wire33[(3'h6):(3'h4)];
    end
  assign wire45 = $unsigned(wire40);
  assign wire46 = {$signed($signed(($signed(wire32) ?
                          $signed(reg42) : $unsigned(wire45)))),
                      $signed((~|($signed((8'hb1)) || $signed((8'hba)))))};
  assign wire47 = ((wire32[(1'h0):(1'h0)] - ((wire35[(4'hf):(3'h5)] >>> (wire41 || reg39)) ?
                          wire40 : ((wire36 ?
                              (7'h41) : wire41) - reg43[(2'h2):(1'h0)]))) ?
                      reg43 : reg39[(1'h1):(1'h1)]);
  assign wire48 = reg37;
endmodule
