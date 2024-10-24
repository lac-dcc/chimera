module top
#(parameter param161 = ((8'hb2) & {{(&((7'h40) - (8'hae))), {{(7'h44)}}}, (~(&((8'ha9) != (8'ha6))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire160;
  wire signed [(4'hd):(1'h0)] wire159;
  wire signed [(3'h6):(1'h0)] wire158;
  wire [(5'h11):(1'h0)] wire157;
  wire [(4'hf):(1'h0)] wire156;
  wire [(5'h14):(1'h0)] wire155;
  wire [(5'h12):(1'h0)] wire153;
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire153,
                 (1'h0)};
  module5 #() modinst154 (.wire8(wire0), .clk(clk), .wire6(wire4), .y(wire153), .wire9(wire1), .wire7(wire2));
  assign wire155 = {$unsigned((8'hb7)), wire4[(3'h5):(2'h3)]};
  assign wire156 = $signed($signed({$unsigned(wire1), (^wire0)}));
  assign wire157 = (-(wire0[(4'hd):(4'hc)] - $unsigned($signed(wire0))));
  assign wire158 = wire156;
  assign wire159 = (-wire3);
  assign wire160 = wire159[(3'h7):(3'h7)];
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire151;
  wire signed [(5'h14):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  wire signed [(5'h15):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  assign y = {wire151,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire60,
                 wire58,
                 wire11,
                 wire10,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
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
                 (1'h0)};
  assign wire10 = $signed($signed(wire8[(3'h6):(2'h2)]));
  assign wire11 = wire9[(4'hb):(2'h2)];
  module12 #() modinst59 (wire58, clk, wire8, wire9, wire6, wire10);
  assign wire60 = (^(8'ha2));
  module61 #() modinst88 (.wire65(wire10), .wire62(wire9), .wire63(wire60), .clk(clk), .wire64(wire6), .y(wire87));
  assign wire89 = (wire9 <= ((~^$unsigned(((8'ha9) ? wire10 : wire11))) ?
                      ($unsigned({wire87, wire8}) ?
                          (~|wire7[(1'h0):(1'h0)]) : wire60) : ($signed(wire6[(3'h5):(3'h4)]) ?
                          $signed((!wire60)) : $signed({wire11, (8'hab)}))));
  assign wire90 = (^~(~^wire89[(1'h0):(1'h0)]));
  assign wire91 = $unsigned((!($signed((8'ha8)) ?
                      (((8'hb7) ?
                          wire90 : wire11) ^~ $signed(wire60)) : (wire90 ?
                          {wire10} : (wire7 ? wire58 : wire60)))));
  assign wire92 = (wire90 ? {wire6} : wire11);
  assign wire93 = (!{((wire91[(5'h12):(4'hb)] ? (^wire58) : $unsigned(wire8)) ?
                          (^wire6[(2'h2):(2'h2)]) : {$signed(wire11)})});
  always
    @(posedge clk) begin
      reg94 <= $unsigned(($signed(wire58) >= wire92));
      reg95 <= wire90;
      if ($unsigned((+wire60)))
        begin
          if ($signed((~&(|$signed((wire90 & (8'haf)))))))
            begin
              reg96 <= (($unsigned(wire11[(2'h2):(1'h0)]) << (((-wire8) ?
                      $unsigned(wire89) : (-wire89)) ?
                  ($signed(wire9) ?
                      $signed(wire89) : wire9[(5'h10):(3'h4)]) : $signed($unsigned(wire60)))) - wire7);
              reg97 <= (^~(((((8'hb5) >> wire93) + $signed(wire92)) ?
                      wire90[(4'h8):(1'h0)] : wire10[(2'h3):(1'h0)]) ?
                  ($signed($signed(wire10)) ?
                      (!(reg95 <= wire6)) : $signed($unsigned(wire91))) : (+wire11[(4'hf):(2'h3)])));
              reg98 <= ({(^~(8'hbe)),
                  ((+wire10) ^~ $signed((wire60 * wire10)))} - ($unsigned((-(^~reg95))) ?
                  wire10 : {reg94, wire93[(1'h1):(1'h0)]}));
              reg99 <= $unsigned(($unsigned((~(wire9 >= wire58))) ?
                  reg98[(3'h7):(2'h3)] : $unsigned($unsigned(wire92[(1'h1):(1'h1)]))));
              reg100 <= reg98;
            end
          else
            begin
              reg96 <= (wire6 ^ (^(~reg99)));
              reg97 <= ((($signed($unsigned(reg95)) >= $unsigned((wire10 < (8'ha7)))) ?
                  $unsigned((8'hb7)) : wire93) >> {reg95,
                  wire7[(1'h1):(1'h0)]});
              reg98 <= ((($unsigned(((8'ha4) ?
                  wire58 : wire10)) >> $unsigned($unsigned(wire87))) <<< (wire93 ?
                  wire89 : wire87[(3'h6):(3'h6)])) * (!$unsigned((wire87 && (wire11 << reg95)))));
            end
        end
      else
        begin
          reg96 <= wire6[(3'h4):(1'h1)];
          reg97 <= ($unsigned(wire8[(3'h5):(1'h0)]) ?
              $signed(reg94) : (((!wire91) >= $unsigned(reg99)) ?
                  {($signed(wire58) ?
                          reg96[(2'h2):(2'h2)] : reg100[(4'hc):(3'h5)]),
                      (reg100[(5'h10):(4'h8)] ?
                          (^~wire89) : {reg94,
                              (8'hb7)})} : $unsigned($signed((reg97 >= wire90)))));
          reg98 <= $unsigned(((!$unsigned((wire60 ~^ wire92))) ?
              $unsigned(((wire89 ? reg98 : wire93) ?
                  (~|wire11) : ((7'h40) != wire58))) : ($signed((wire92 ?
                  wire11 : wire90)) >= (8'hbe))));
          if ((wire92 || ((((reg95 ?
              wire90 : wire8) | $signed(wire10)) <<< $signed({wire92})) == $signed((|wire11[(4'hc):(1'h0)])))))
            begin
              reg99 <= wire60[(3'h4):(3'h4)];
              reg100 <= reg96[(1'h0):(1'h0)];
              reg101 <= wire6;
              reg102 <= (&$unsigned((8'hab)));
            end
          else
            begin
              reg99 <= $unsigned((($signed(((8'haa) ?
                      wire11 : wire90)) < (wire87[(3'h7):(2'h3)] >> (wire91 || wire11))) ?
                  (wire87 ?
                      ({wire9, reg96} ?
                          (~|reg102) : $unsigned(wire92)) : $unsigned({wire90})) : $signed(wire87)));
              reg100 <= wire9[(4'hf):(4'hb)];
            end
        end
      if (reg94)
        begin
          reg103 <= wire89[(2'h3):(1'h0)];
        end
      else
        begin
          if (($signed($unsigned(((reg96 ? reg100 : wire87) ?
                  $unsigned(reg94) : (wire93 <<< reg96)))) ?
              (~&(^~$signed((reg96 ?
                  reg99 : wire11)))) : ((&$signed($unsigned(wire7))) << $unsigned($unsigned({reg99})))))
            begin
              reg103 <= reg98;
              reg104 <= $signed((~^($unsigned($signed(wire93)) >> ({wire89} >= $unsigned(reg103)))));
              reg105 <= wire89;
              reg106 <= $signed(($unsigned((!wire60[(3'h4):(3'h4)])) <= (^~(!reg100))));
            end
          else
            begin
              reg103 <= (wire91[(5'h12):(1'h1)] ?
                  {$unsigned(wire6[(3'h6):(2'h2)])} : wire9[(5'h12):(4'hd)]);
              reg104 <= $signed($signed($unsigned(((wire6 ?
                  wire9 : reg97) + (^~wire8)))));
              reg105 <= (|(8'hbb));
              reg106 <= (!$unsigned($unsigned(({wire60} ?
                  $unsigned(wire10) : $signed((8'hb8))))));
              reg107 <= $unsigned($signed($signed(reg101[(1'h1):(1'h0)])));
            end
          reg108 <= reg106[(3'h4):(1'h0)];
          if (((wire90[(4'hd):(3'h5)] & (!wire93)) ?
              ((^(reg106[(1'h1):(1'h1)] ? (!reg103) : {wire60})) ?
                  reg107 : (7'h43)) : reg108))
            begin
              reg109 <= ((~|$signed(($unsigned(reg104) * (^reg104)))) ?
                  $signed((wire11[(4'h9):(3'h6)] ?
                      $unsigned(wire60) : (~(wire93 - wire92)))) : $unsigned((^(~$signed(wire92)))));
            end
          else
            begin
              reg109 <= reg98[(2'h3):(1'h1)];
              reg110 <= reg107;
              reg111 <= $signed((~$unsigned((~^{wire9}))));
              reg112 <= wire89;
            end
        end
    end
  module113 #() modinst152 (.clk(clk), .wire115(reg97), .wire114(reg110), .y(wire151), .wire117(wire10), .wire116(wire9));
endmodule

module module113
#(parameter param150 = ({{(!((8'haf) ? (8'h9e) : (8'hb9)))}, ((((8'ha0) ? (8'hb6) : (8'h9d)) ^ ((8'ha3) ? (8'haa) : (8'hbd))) & ({(8'h9c), (8'hb8)} ? {(8'ha7)} : (~|(7'h42))))} ? ({(((8'ha1) ? (8'hb0) : (7'h41)) * {(8'hb4), (8'hb4)}), (8'ha5)} * (({(8'hb6), (8'hbf)} & ((8'ha3) ? (8'ha6) : (8'hb6))) >= (~&(&(8'haa))))) : ((~|(((8'had) >>> (8'hbe)) ~^ ((8'hb7) ? (8'hb1) : (7'h41)))) ? ({((8'h9c) & (8'ha1))} <<< (((7'h41) ? (8'hb6) : (8'hac)) ? ((8'ha7) << (8'ha1)) : (8'h9d))) : ((|{(8'hba), (8'ha0)}) & (^{(8'hbf)})))))
(y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire117;
  input wire [(3'h6):(1'h0)] wire116;
  input wire [(3'h5):(1'h0)] wire115;
  input wire signed [(5'h12):(1'h0)] wire114;
  wire [(4'he):(1'h0)] wire149;
  wire [(3'h6):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire139;
  wire signed [(4'ha):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire135;
  wire [(4'h8):(1'h0)] wire134;
  wire [(4'hb):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire121;
  wire signed [(4'he):(1'h0)] wire120;
  wire [(5'h14):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire118;
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(2'h2):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 (1'h0)};
  assign wire118 = ((wire115[(1'h0):(1'h0)] <<< (({wire115} ~^ wire114[(2'h3):(2'h2)]) ^~ (|wire117))) << $unsigned((|((wire114 ?
                           wire115 : wire115) ?
                       $signed(wire115) : (wire117 ? wire116 : wire117)))));
  assign wire119 = ($unsigned((8'hbb)) ?
                       $signed({wire116}) : {$unsigned(({wire115} ?
                               wire114 : $signed((8'ha7))))});
  assign wire120 = {wire117};
  assign wire121 = $signed(($unsigned($unsigned(((8'hb5) ?
                           wire115 : (8'ha5)))) ?
                       wire116[(2'h2):(1'h1)] : $signed($unsigned($signed(wire117)))));
  assign wire122 = ((-($signed(wire120) ~^ (-wire121))) ?
                       wire115[(1'h0):(1'h0)] : wire116);
  assign wire123 = $unsigned(({wire116} ?
                       ($signed(wire115[(3'h4):(3'h4)]) ?
                           ((wire115 == wire115) >>> wire117[(3'h6):(3'h5)]) : ({(8'hbd)} >>> wire114[(4'h8):(4'h8)])) : wire115[(1'h0):(1'h0)]));
  assign wire124 = ($unsigned(wire121[(4'h8):(3'h4)]) ?
                       (&wire114[(4'he):(4'hb)]) : $signed((+{$signed(wire122)})));
  always
    @(posedge clk) begin
      reg125 <= ({$signed($unsigned(wire118)), wire124[(4'h8):(4'h8)]} ?
          (~&{({wire118, wire124} == $signed(wire123)),
              (|wire120[(1'h1):(1'h0)])}) : (wire114[(2'h3):(1'h1)] ^ $unsigned(($unsigned(wire117) ^ $signed(wire119)))));
      reg126 <= wire116[(3'h4):(3'h4)];
      if (wire114)
        begin
          if ((~^((~&($signed((8'hb0)) < (8'ha6))) > wire118)))
            begin
              reg127 <= reg125[(1'h0):(1'h0)];
              reg128 <= (-(8'haa));
              reg129 <= (&wire119[(5'h11):(3'h7)]);
              reg130 <= (wire117[(3'h5):(1'h0)] < wire116[(3'h5):(2'h2)]);
              reg131 <= reg130;
            end
          else
            begin
              reg127 <= {$signed($unsigned($signed($signed(wire124))))};
              reg128 <= $unsigned((reg130 ?
                  ($unsigned(reg125[(1'h1):(1'h1)]) ?
                      {$unsigned((8'hbe))} : $signed((^~wire116))) : $signed($signed((8'hac)))));
              reg129 <= ((!reg127[(3'h6):(2'h2)]) ?
                  $signed(wire120[(1'h0):(1'h0)]) : $signed((+wire116[(2'h2):(1'h1)])));
              reg130 <= $unsigned((((-wire114) & (~|$signed(wire118))) ?
                  (&((7'h44) ?
                      $signed(wire119) : ((8'ha9) ?
                          reg125 : reg128))) : wire122));
            end
          reg132 <= $unsigned((reg129 ?
              (&$signed((wire122 ?
                  (8'ha8) : wire117))) : $unsigned(((wire114 ~^ wire121) ?
                  $unsigned((8'ha5)) : (reg131 ? reg128 : wire121)))));
          reg133 <= $signed(wire123);
        end
      else
        begin
          if (({({reg133[(3'h6):(3'h5)]} ?
                      $unsigned($unsigned(reg131)) : $unsigned($unsigned(wire116)))} ?
              $unsigned($signed(wire124[(1'h0):(1'h0)])) : wire117))
            begin
              reg127 <= $signed((^($signed((reg129 ^ wire122)) << wire116)));
              reg128 <= (^(^~((~^((8'ha5) ^~ wire119)) ?
                  $signed(wire117[(1'h1):(1'h1)]) : ($unsigned(reg128) >= (reg130 ?
                      (7'h43) : wire122)))));
            end
          else
            begin
              reg127 <= reg126[(3'h5):(1'h0)];
              reg128 <= ({$signed(($signed(wire115) ?
                          $unsigned(wire117) : (reg131 | (8'ha5)))),
                      $signed(wire115)} ?
                  $signed($signed(reg125)) : reg127);
            end
          if (wire121[(4'hb):(1'h0)])
            begin
              reg129 <= $signed($signed((((reg126 ?
                      (7'h40) : wire124) ^~ wire120[(4'he):(4'h8)]) ?
                  ((|wire116) || {wire123}) : reg132[(1'h1):(1'h1)])));
              reg130 <= (!($signed(((reg131 || reg128) != (wire118 <<< (8'hb8)))) << $signed(((|wire123) ?
                  reg131[(4'hc):(4'hb)] : (reg125 ? reg130 : reg125)))));
              reg131 <= (8'hb8);
              reg132 <= $unsigned(wire114[(3'h4):(2'h2)]);
            end
          else
            begin
              reg129 <= ($signed($unsigned($unsigned(((8'had) != wire122)))) <<< wire117);
              reg130 <= reg132;
              reg131 <= wire121[(1'h0):(1'h0)];
              reg132 <= wire118;
              reg133 <= $signed(reg129[(5'h10):(3'h6)]);
            end
        end
    end
  assign wire134 = reg126;
  assign wire135 = wire122[(5'h11):(4'hc)];
  assign wire136 = $unsigned(reg130[(1'h0):(1'h0)]);
  assign wire137 = $unsigned(wire114);
  assign wire138 = reg127[(4'h9):(3'h7)];
  assign wire139 = {$unsigned($signed(wire119)),
                       $unsigned({wire117[(1'h1):(1'h0)],
                           (wire115[(2'h3):(2'h2)] && $unsigned(wire114))})};
  always
    @(posedge clk) begin
      reg140 <= (|wire137);
      if ($unsigned((((+$signed(wire121)) || $unsigned((reg132 ?
          (8'hbb) : wire121))) != {reg140})))
        begin
          reg141 <= {(^~((~|(reg131 * wire122)) ?
                  {(wire138 | wire121),
                      wire115[(2'h3):(2'h3)]} : ((^~reg140) || $unsigned(wire124))))};
          reg142 <= ((~&(&(reg126 ?
              $signed(reg127) : (~reg131)))) || ($unsigned((reg126 * wire123)) ?
              (wire118[(1'h1):(1'h0)] ~^ $signed($unsigned((7'h44)))) : (((wire136 | (8'ha9)) && $unsigned((8'hb2))) ?
                  ($unsigned(wire115) ?
                      {wire123} : $unsigned(reg125)) : reg141)));
          reg143 <= (&(^~reg142[(3'h4):(1'h0)]));
        end
      else
        begin
          reg141 <= (8'hb4);
          reg142 <= {{(-$unsigned(reg132))}, $unsigned((8'hbd))};
          reg143 <= ($signed(wire123[(3'h7):(3'h6)]) ?
              (($signed($signed((7'h41))) < ($signed(reg128) + $signed(wire115))) ?
                  (($signed(wire123) ?
                      (wire124 ?
                          wire116 : wire134) : {wire139}) > reg125) : ($signed(reg125[(3'h5):(1'h1)]) ?
                      $unsigned($signed(reg129)) : $signed((wire116 ?
                          wire116 : reg143)))) : {wire119});
          reg144 <= wire117;
        end
      reg145 <= reg133;
      reg146 <= wire114;
      reg147 <= wire138;
    end
  assign wire148 = {(~|reg129[(4'h9):(3'h6)]),
                       $signed({wire138[(4'ha):(4'h9)]})};
  assign wire149 = $unsigned((reg125[(4'ha):(4'h8)] ~^ $unsigned(reg143)));
endmodule

module module61  (y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire65;
  input wire [(4'h9):(1'h0)] wire64;
  input wire signed [(3'h7):(1'h0)] wire63;
  input wire signed [(5'h14):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire82,
                 wire81,
                 wire80,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg84,
                 reg83,
                 reg79,
                 reg78,
                 reg77,
                 reg70,
                 (1'h0)};
  assign wire66 = wire62;
  assign wire67 = $signed((wire63 ?
                      wire66[(2'h2):(1'h0)] : ((8'hbf) ?
                          $signed($signed(wire65)) : wire63[(2'h3):(2'h2)])));
  assign wire68 = (-wire64);
  assign wire69 = wire62;
  always
    @(posedge clk) begin
      reg70 <= ((&wire69) ?
          $signed($signed(wire69)) : $unsigned(wire66[(1'h0):(1'h0)]));
    end
  assign wire71 = wire62;
  assign wire72 = ((($signed($signed(wire71)) ^~ (wire71[(4'he):(2'h3)] ?
                          wire65[(4'h8):(4'h8)] : (wire64 & wire69))) & wire64) ?
                      (((~|((8'hb5) ? wire66 : (8'ha4))) ?
                          $unsigned(wire66[(3'h5):(2'h2)]) : $unsigned(wire68[(3'h7):(2'h3)])) < wire63[(2'h2):(2'h2)]) : wire71);
  assign wire73 = $unsigned(wire65);
  assign wire74 = (wire62[(4'hc):(2'h2)] ?
                      $unsigned(((|(wire64 ? (8'hbb) : wire72)) ?
                          ((8'ha6) ?
                              $signed((8'hb0)) : (wire63 >> wire62)) : $unsigned(wire63))) : (^~reg70));
  assign wire75 = ((^({(wire67 == wire69)} ^~ (-(wire71 ?
                      reg70 : reg70)))) <<< wire72);
  assign wire76 = $signed({($unsigned((&(8'h9c))) ?
                          ($signed(wire71) <= {(8'ha2), wire65}) : ((^~wire63) ?
                              reg70[(3'h7):(1'h0)] : {wire62}))});
  always
    @(posedge clk) begin
      reg77 <= wire63[(2'h3):(1'h1)];
      reg78 <= wire72;
      reg79 <= wire74[(4'ha):(4'h9)];
    end
  assign wire80 = $unsigned({$signed(((wire62 - wire68) ^~ $signed(reg78)))});
  assign wire81 = $signed($signed(wire73));
  assign wire82 = wire66[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg83 <= (!((wire74 + wire67) & $unsigned({$unsigned(wire65)})));
      reg84 <= $signed($signed($unsigned(((wire81 >= wire81) == (~&wire72)))));
    end
  assign wire85 = $unsigned({$signed(((~^wire64) ?
                          $signed(reg77) : {(8'haf), wire80})),
                      {$signed($unsigned(reg83)), wire76[(4'h8):(3'h5)]}});
  assign wire86 = (8'haa);
endmodule

module module12
#(parameter param57 = (8'hb4))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h1d8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire [(2'h3):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire17;
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire18,
                 wire17,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg31,
                 reg30,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire17 = $unsigned(wire15);
  assign wire18 = $signed(((^~wire13[(4'hb):(1'h0)]) ?
                      {wire15,
                          (wire13 ^~ $signed(wire15))} : wire13[(3'h5):(3'h4)]));
  always
    @(posedge clk) begin
      if ((+(8'ha5)))
        begin
          if ($signed($signed(($unsigned(wire15[(1'h1):(1'h1)]) ?
              ((wire15 ?
                  wire15 : wire16) ~^ (~&wire17)) : wire17[(2'h2):(1'h0)]))))
            begin
              reg19 <= wire18;
            end
          else
            begin
              reg19 <= wire15[(2'h3):(2'h3)];
              reg20 <= wire18[(4'he):(4'hb)];
              reg21 <= (~|{((wire13 ?
                      $signed(reg19) : $signed(wire17)) >>> wire16[(4'hc):(4'hb)])});
            end
        end
      else
        begin
          reg19 <= ({$signed((wire15[(2'h3):(1'h1)] ?
                  (^~wire13) : $unsigned(reg20))),
              ((wire14[(2'h3):(2'h2)] ?
                  reg19[(2'h3):(1'h1)] : $unsigned(wire13)) && reg20)} - wire18);
          reg20 <= wire18;
          reg21 <= (wire16[(4'hc):(3'h6)] ?
              ($signed($unsigned(reg21)) || wire17[(1'h1):(1'h1)]) : (~$signed($unsigned({wire15,
                  wire15}))));
          reg22 <= (wire13 ?
              wire14 : ($unsigned(wire13[(4'hc):(1'h0)]) && (~($signed(reg19) ?
                  (-reg21) : {wire15}))));
          reg23 <= $signed(((^((reg20 << wire15) ^ $signed((8'ha6)))) ?
              wire13 : $signed(((wire16 & wire16) - (reg19 ^ wire17)))));
        end
      reg24 <= (-$signed(($signed((~&wire14)) != reg22[(3'h4):(2'h3)])));
      reg25 <= (wire15[(2'h3):(1'h1)] ?
          {({(&reg22), $unsigned(reg20)} < $signed($unsigned(reg24)))} : reg21);
      reg26 <= {$unsigned((reg19[(2'h2):(1'h0)] ?
              ({(8'hb0)} ?
                  {reg21,
                      reg25} : $signed(wire16)) : $signed($unsigned((8'ha4)))))};
      reg27 <= ((~&reg24[(2'h3):(2'h2)]) || (7'h40));
    end
  assign wire28 = $unsigned((((!(reg26 ? reg20 : wire13)) ?
                          reg25[(4'h8):(3'h6)] : (|reg21)) ?
                      (reg26[(2'h3):(2'h2)] >= {reg20}) : ($unsigned(wire15[(1'h1):(1'h1)]) + ((^~(8'ha0)) ?
                          reg24[(3'h6):(1'h1)] : $signed(reg24)))));
  assign wire29 = (8'hae);
  always
    @(posedge clk) begin
      reg30 <= $unsigned((&(wire14[(3'h4):(2'h2)] ?
          ((8'hbe) >= reg21) : ((reg21 ? reg21 : reg24) ?
              (wire16 && (8'hb0)) : (wire16 | (8'hb3))))));
      reg31 <= (~|$signed({$unsigned((wire15 ^~ reg27))}));
    end
  assign wire32 = reg23[(2'h2):(1'h1)];
  assign wire33 = ((!({reg23} ?
                      reg26 : $unsigned($signed(wire28)))) || ($unsigned(wire32) ?
                      $unsigned($signed($signed(wire32))) : (($unsigned((8'hbc)) ?
                              $unsigned(wire17) : reg20) ?
                          {$signed((8'hb0)),
                              {wire14,
                                  wire28}} : ($unsigned(reg23) & wire32))));
  assign wire34 = wire29;
  assign wire35 = wire14[(1'h0):(1'h0)];
  assign wire36 = wire13[(2'h2):(2'h2)];
  assign wire37 = wire32[(4'hb):(1'h1)];
  assign wire38 = {wire28,
                      ((&((wire29 >= wire33) ?
                          {reg23,
                              wire15} : reg31[(4'h8):(2'h3)])) ^~ wire36[(2'h2):(1'h0)])};
  assign wire39 = ((~^(!(^wire28))) ?
                      (wire16 >>> (^~$signed(wire34[(1'h1):(1'h0)]))) : {(($unsigned((8'hb0)) > {reg21,
                              wire16}) << reg19[(3'h6):(3'h6)])});
  assign wire40 = $unsigned(((((~&reg24) ?
                      $signed(reg20) : (reg31 ?
                          wire39 : wire18)) >>> $unsigned($signed(reg26))) - $signed((~&(&reg19)))));
  assign wire41 = $unsigned(wire14[(3'h4):(1'h0)]);
  assign wire42 = {reg19[(4'h8):(3'h5)]};
  assign wire43 = wire14;
  assign wire44 = (~reg27[(4'he):(4'hc)]);
  assign wire45 = $signed(reg23);
  always
    @(posedge clk) begin
      if ((8'ha9))
        begin
          reg46 <= ((-{((8'ha3) >> (wire45 >> reg30)),
              ($signed(wire35) <= (|wire28))}) == ((!wire15[(2'h2):(2'h2)]) ?
              ((wire34[(4'h9):(2'h3)] ?
                  reg22[(5'h13):(4'hf)] : {wire43, wire16}) ^~ ((~|wire13) ?
                  $signed(reg19) : $unsigned(wire38))) : wire13));
          reg47 <= (~wire38);
          reg48 <= wire32;
          reg49 <= (+$unsigned($unsigned(reg20[(3'h5):(3'h4)])));
        end
      else
        begin
          reg46 <= (^{(8'ha3)});
          reg47 <= ((reg47 ?
              ($unsigned($unsigned((8'hae))) ?
                  wire14 : $signed(reg22[(4'h8):(4'h8)])) : $unsigned($signed((wire29 ?
                  wire38 : wire35)))) != {(reg30[(3'h4):(1'h1)] ^~ $signed(wire18[(4'h9):(3'h5)])),
              ($unsigned((wire34 ? reg31 : reg25)) ?
                  reg31[(4'h8):(3'h4)] : wire41[(1'h1):(1'h0)])});
          reg48 <= wire39;
          if (reg22[(2'h2):(1'h0)])
            begin
              reg49 <= (((^$signed((7'h44))) ?
                  (8'hbb) : (wire28 * (+reg26))) & {{(!$signed(wire29))}});
              reg50 <= ((wire15[(2'h3):(1'h0)] > $signed(((!(7'h44)) ~^ {reg31,
                      wire13}))) ?
                  ($unsigned(($unsigned(wire42) ?
                      (8'hba) : (reg27 ?
                          reg48 : (8'h9f)))) >>> wire38) : ((&($unsigned(wire14) ?
                          (reg46 << wire18) : (wire37 ? wire32 : (8'hbc)))) ?
                      (+$unsigned(((8'hb4) ?
                          reg21 : wire36))) : ($unsigned($signed((7'h40))) ?
                          (wire43 ?
                              $signed(wire44) : reg47) : $signed($signed((8'hb9))))));
            end
          else
            begin
              reg49 <= (+reg25[(1'h0):(1'h0)]);
              reg50 <= wire33[(2'h2):(2'h2)];
            end
        end
      reg51 <= ($unsigned(({$unsigned(wire43)} ?
          (reg27 ^ $signed(reg31)) : ((reg49 ?
              wire36 : wire38) >= (reg19 - reg49)))) <= reg19[(3'h6):(3'h6)]);
      if ((7'h41))
        begin
          reg52 <= reg20[(4'ha):(3'h7)];
          reg53 <= $unsigned(wire14[(1'h0):(1'h0)]);
          reg54 <= wire33[(2'h3):(2'h3)];
        end
      else
        begin
          reg52 <= (~|(reg54 ?
              {$unsigned(wire14),
                  ($unsigned(reg24) ?
                      $signed((8'ha1)) : $unsigned(wire28))} : ($signed((^reg48)) ?
                  {$signed(wire17)} : $signed($signed(reg23)))));
          reg53 <= (|$unsigned(reg21[(1'h0):(1'h0)]));
        end
    end
  assign wire55 = (~&$signed(($unsigned($unsigned(reg31)) ?
                      reg23[(1'h1):(1'h0)] : reg26)));
  assign wire56 = wire43[(1'h0):(1'h0)];
endmodule
