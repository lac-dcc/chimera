module top
#(parameter param139 = (8'ha6), 
parameter param140 = ({(8'h9f), param139} ^~ (^((~param139) ? param139 : (-param139)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire133;
  wire [(5'h11):(1'h0)] wire132;
  wire signed [(4'h9):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire118;
  wire [(5'h11):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire115;
  wire signed [(5'h15):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire95;
  wire signed [(3'h5):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire80;
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  reg [(4'hb):(1'h0)] reg136 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire118,
                 wire117,
                 wire115,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire41,
                 wire44,
                 wire80,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg43,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 (1'h0)};
  module5 #() modinst42 (wire41, clk, wire1, wire2, wire4, wire3, wire0);
  always
    @(posedge clk) begin
      reg43 <= $signed($signed(((!$unsigned(wire4)) ?
          $unsigned((+wire2)) : ($signed(wire3) ? (+wire3) : wire2))));
    end
  assign wire44 = {wire41[(2'h3):(1'h0)], (|reg43)};
  module45 #() modinst81 (wire80, clk, reg43, wire0, wire1, wire3);
  always
    @(posedge clk) begin
      if (wire2[(2'h3):(2'h3)])
        begin
          reg82 <= $signed((wire2[(3'h6):(3'h6)] < $signed($unsigned((wire3 << wire80)))));
          reg83 <= ($unsigned({((+reg82) ^~ $unsigned(reg43)),
              (-$unsigned(wire4))}) != wire44[(1'h0):(1'h0)]);
        end
      else
        begin
          if (((~&reg82[(1'h0):(1'h0)]) ? (8'ha0) : reg43))
            begin
              reg82 <= {reg82[(3'h7):(1'h0)],
                  (^~$unsigned(($unsigned((8'hb1)) - (wire1 ?
                      wire2 : (8'hbf)))))};
              reg83 <= wire80;
            end
          else
            begin
              reg82 <= $unsigned({$unsigned($unsigned((wire4 - reg83))),
                  (reg82 & wire3[(2'h3):(2'h2)])});
              reg83 <= ($unsigned(wire44[(1'h0):(1'h0)]) == {wire3});
              reg84 <= $unsigned(((reg83 ?
                  $unsigned(wire44[(1'h0):(1'h0)]) : wire80[(3'h4):(2'h3)]) - (-(wire80 ?
                  {wire80, wire41} : (-wire2)))));
            end
        end
      if (wire44[(1'h0):(1'h0)])
        begin
          reg85 <= {wire0[(4'h8):(3'h4)]};
        end
      else
        begin
          reg85 <= $signed((-reg43));
          if ($signed(reg85[(5'h13):(3'h4)]))
            begin
              reg86 <= wire4[(5'h11):(3'h7)];
              reg87 <= $signed(wire80[(4'h8):(3'h4)]);
              reg88 <= (wire2 ?
                  $signed($unsigned($unsigned((wire0 == reg83)))) : (+wire0));
              reg89 <= wire41[(3'h4):(1'h0)];
            end
          else
            begin
              reg86 <= reg84;
              reg87 <= ({(~&(((8'h9d) ? wire44 : reg88) ?
                      $unsigned((8'h9f)) : $signed(wire44))),
                  (reg85 <= $unsigned($unsigned(reg83)))} < $unsigned($unsigned(reg83)));
              reg88 <= ($unsigned({(|{reg83, wire2}),
                      ((wire2 + wire80) ?
                          $unsigned(wire41) : (reg85 - reg88))}) ?
                  $signed($unsigned((wire2[(2'h3):(2'h3)] >= (reg86 ?
                      (8'hae) : wire4)))) : $unsigned(({wire4[(4'he):(4'he)]} ?
                      ($signed(reg82) ? (+reg87) : $signed(reg83)) : ({wire1} ?
                          $signed((8'hb9)) : (8'hb3)))));
              reg89 <= (~((($unsigned(wire41) ?
                      {wire4, wire1} : {reg85, wire1}) ?
                  $signed(wire41) : (-$unsigned(wire4))) < $unsigned(reg88[(4'ha):(4'h9)])));
            end
          reg90 <= $signed(($signed((8'hbe)) != wire1[(4'ha):(4'ha)]));
        end
    end
  assign wire91 = wire1;
  assign wire92 = $unsigned(((+(reg82[(1'h1):(1'h1)] > reg89[(1'h1):(1'h1)])) ?
                      ($unsigned(((7'h41) ?
                          reg87 : reg86)) >> ((~wire41) || (wire2 != reg85))) : (reg90 ~^ $signed((&reg85)))));
  assign wire93 = ({wire92, reg83} < $unsigned(wire41));
  assign wire94 = (reg84[(3'h7):(2'h2)] ?
                      {($signed((reg90 ? wire93 : wire93)) ?
                              ((wire92 ?
                                  wire44 : wire80) >> wire91[(4'he):(4'hb)]) : $signed((reg85 - (8'hbd))))} : reg84);
  assign wire95 = $signed({($unsigned($signed(reg85)) && reg86[(2'h2):(1'h0)]),
                      (&$unsigned(reg88))});
  assign wire96 = reg87;
  module97 #() modinst116 (.wire101(reg90), .wire98(wire96), .y(wire115), .wire100(reg43), .wire102(reg86), .wire99(wire2), .clk(clk));
  assign wire117 = reg85;
  assign wire118 = {(~$unsigned(wire4))};
  always
    @(posedge clk) begin
      reg119 <= (wire44 ?
          $signed(reg89[(3'h7):(2'h2)]) : $unsigned((reg88 <= ((wire3 ?
              wire2 : wire0) ~^ $signed(reg90)))));
      reg120 <= $signed(($unsigned(reg86[(3'h5):(2'h3)]) >> reg85[(4'hf):(4'h9)]));
      reg121 <= (reg83[(4'h8):(2'h3)] ?
          $signed((((^reg85) ?
              wire96 : (8'ha0)) && $unsigned(wire0))) : $signed($unsigned((wire92 ?
              $unsigned(reg90) : $unsigned(wire115)))));
      if ((wire80[(3'h4):(1'h0)] ?
          (({wire92[(4'h9):(1'h1)]} >= $unsigned(reg90[(4'hb):(3'h4)])) ~^ ((7'h44) ?
              ((wire2 ? (8'ha4) : wire1) ? (~&wire44) : reg121) : (reg90 ?
                  (wire95 & wire93) : (~|(8'ha3))))) : reg84))
        begin
          reg122 <= $unsigned((~&{wire91[(3'h5):(3'h5)]}));
          reg123 <= $unsigned({wire44[(1'h0):(1'h0)]});
          reg124 <= (~^(!((wire95[(3'h5):(2'h3)] != (wire95 ? wire93 : reg84)) ?
              $unsigned((!wire44)) : (|(^~(8'hbd))))));
          reg125 <= $unsigned(wire117);
          reg126 <= (((&$unsigned({reg121, reg90})) ~^ ((&reg120) ?
                  wire95[(3'h6):(2'h2)] : wire41[(1'h0):(1'h0)])) ?
              reg43 : $signed($unsigned((8'ha5))));
        end
      else
        begin
          reg122 <= reg83[(4'h9):(3'h7)];
        end
    end
  always
    @(posedge clk) begin
      reg127 <= (8'haf);
      reg128 <= reg84[(4'h8):(4'h8)];
      reg129 <= ($signed(reg127[(5'h10):(4'h8)]) ?
          $unsigned(reg119[(3'h7):(3'h7)]) : $signed($unsigned(($unsigned(reg121) ?
              $unsigned(wire115) : (reg82 ? (7'h43) : wire2)))));
      reg130 <= $unsigned((8'hb3));
    end
  assign wire131 = ($signed($signed({wire4})) ?
                       reg86 : (-{reg127[(3'h7):(1'h1)],
                           (wire93 * (wire92 ? (8'hbd) : wire3))}));
  assign wire132 = reg82[(2'h3):(2'h3)];
  assign wire133 = ($unsigned($unsigned(($signed(reg82) || (wire93 ?
                           wire115 : reg122)))) ?
                       reg124 : ($signed($signed(wire118[(4'he):(3'h7)])) ?
                           wire93[(1'h1):(1'h1)] : $unsigned(reg90)));
  always
    @(posedge clk) begin
      reg134 <= (^~($signed(reg126) ?
          {{reg86},
              {$unsigned(wire115),
                  $unsigned(reg89)}} : ($unsigned((~^reg90)) > wire4[(3'h6):(2'h3)])));
      reg135 <= reg84[(1'h1):(1'h1)];
      reg136 <= $unsigned($unsigned((~|(reg130[(2'h2):(2'h2)] || (reg82 <<< wire92)))));
      reg137 <= $signed(reg124[(1'h1):(1'h0)]);
      reg138 <= wire133;
    end
endmodule

module module97  (y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire102;
  input wire signed [(4'h9):(1'h0)] wire101;
  input wire [(5'h11):(1'h0)] wire100;
  input wire [(3'h7):(1'h0)] wire99;
  input wire signed [(4'hb):(1'h0)] wire98;
  wire [(4'he):(1'h0)] wire114;
  wire signed [(3'h6):(1'h0)] wire113;
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  assign y = {wire114,
                 wire113,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~(wire101[(3'h5):(1'h0)] >>> ($unsigned((wire98 - (7'h43))) ?
          $signed($signed(wire101)) : wire101))))
        begin
          reg103 <= ((((&$unsigned(wire100)) - (8'hb0)) * (wire100[(2'h2):(1'h1)] ^~ $signed($signed((8'hb2))))) ?
              wire100[(4'h8):(3'h6)] : (~|(($signed(wire99) ?
                  wire99[(2'h3):(2'h3)] : $unsigned(wire102)) && (8'hbc))));
          reg104 <= wire102[(4'h8):(3'h5)];
          if (wire102[(3'h5):(1'h1)])
            begin
              reg105 <= (wire98[(1'h0):(1'h0)] ?
                  $unsigned($unsigned(((|(8'ha8)) ?
                      $unsigned(wire100) : {(8'ha8),
                          wire101}))) : $unsigned($signed(((reg104 + wire100) - (7'h43)))));
            end
          else
            begin
              reg105 <= reg105[(1'h0):(1'h0)];
              reg106 <= $unsigned($unsigned(((reg105[(1'h0):(1'h0)] | (wire101 ?
                      wire102 : reg105)) ?
                  {wire98, reg103[(1'h1):(1'h1)]} : (^~wire98))));
              reg107 <= (~|{wire98[(3'h7):(3'h4)]});
              reg108 <= reg104[(5'h11):(5'h11)];
            end
        end
      else
        begin
          if ($unsigned(wire100))
            begin
              reg103 <= (reg108[(2'h2):(1'h1)] > reg108);
              reg104 <= $signed(reg107);
            end
          else
            begin
              reg103 <= (~reg103[(4'he):(2'h2)]);
              reg104 <= (reg106[(1'h0):(1'h0)] | {(^~reg103[(4'hb):(1'h1)]),
                  $unsigned(reg104[(1'h1):(1'h1)])});
              reg105 <= (wire99 ? (^~(wire98 ? (8'hbd) : (^~reg104))) : reg104);
            end
          reg106 <= (({$unsigned((8'hb6))} ?
                  $unsigned(((wire99 ? reg103 : reg104) ?
                      reg103[(4'ha):(2'h2)] : $unsigned(wire99))) : (~((~wire101) ?
                      reg107 : {reg105}))) ?
              wire100[(5'h11):(4'he)] : (((^(wire99 ?
                  reg107 : reg106)) * {((8'ha1) == wire98),
                  {reg103}}) <= $signed($signed($unsigned(reg106)))));
        end
    end
  always
    @(posedge clk) begin
      if ($signed((&$signed(reg105))))
        begin
          reg109 <= (-$signed($signed($signed((wire101 ^~ wire102)))));
          reg110 <= (|(~|$signed((~(!reg107)))));
          reg111 <= ($signed(reg105) ?
              (+($unsigned($signed(reg109)) ^ $signed((wire98 - reg104)))) : $unsigned($unsigned({(wire99 ?
                      wire102 : wire100)})));
        end
      else
        begin
          if (($signed($unsigned((^(~^(8'h9f))))) != (|reg110[(3'h7):(3'h5)])))
            begin
              reg109 <= wire101;
              reg110 <= {$signed((^~$signed(reg109[(2'h2):(1'h0)])))};
            end
          else
            begin
              reg109 <= $unsigned(wire100[(3'h4):(1'h1)]);
              reg110 <= ((8'hb2) ? $signed($signed(reg108)) : $signed(reg106));
            end
          reg111 <= reg109[(1'h1):(1'h1)];
          reg112 <= (^~((8'haf) ?
              (($unsigned(reg105) > $unsigned(wire102)) * reg108) : reg103[(2'h2):(1'h0)]));
        end
    end
  assign wire113 = (&((~^reg106[(4'he):(4'h9)]) ?
                       {reg108} : $unsigned(((wire98 ? wire98 : reg107) ?
                           reg103[(3'h5):(2'h2)] : reg104))));
  assign wire114 = $unsigned({wire101});
endmodule

module module45
#(parameter param78 = ({(((+(8'ha7)) ? {(8'hb4)} : ((8'h9e) ? (8'ha4) : (8'had))) <= (+(|(8'hb0))))} ? (((~&((7'h44) ? (8'hbf) : (8'haf))) & (&(-(8'hab)))) ? ((~^(&(8'ha8))) > (((7'h40) <<< (8'had)) ? (8'hba) : (~^(8'hbe)))) : ((~^((8'hab) ~^ (8'hb3))) < ((^~(7'h40)) ^ (!(8'hab))))) : (^~(({(8'hac)} ? (7'h41) : ((8'ha4) >>> (8'hbd))) ^~ (!((7'h40) ~^ (8'hbf)))))), 
parameter param79 = (((^~param78) | (~|param78)) ? (|param78) : {(^~({(8'hb5)} ? (&param78) : param78))}))
(y, clk, wire46, wire47, wire48, wire49);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire46;
  input wire signed [(4'hf):(1'h0)] wire47;
  input wire [(3'h5):(1'h0)] wire48;
  input wire signed [(5'h10):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire74;
  assign y = {wire77, wire76, wire50, wire51, wire52, wire53, wire74, (1'h0)};
  assign wire50 = (~&wire47[(4'ha):(3'h5)]);
  assign wire51 = ((wire49[(3'h6):(1'h0)] ?
                      (~(8'h9c)) : (((wire50 ? wire49 : (8'haa)) ?
                              $signed(wire46) : $unsigned((8'hb1))) ?
                          $unsigned(((8'hab) | wire49)) : (wire49 > wire49[(3'h5):(1'h0)]))) ^~ wire46[(2'h2):(1'h0)]);
  assign wire52 = wire50[(4'hf):(1'h1)];
  assign wire53 = wire47[(4'ha):(4'ha)];
  module54 #() modinst75 (wire74, clk, wire50, wire49, wire53, wire47, wire52);
  assign wire76 = ((wire50[(1'h1):(1'h1)] ?
                          {$unsigned(((8'ha2) && wire49)),
                              $unsigned((wire50 | wire48))} : (wire53 ?
                              wire51[(3'h7):(3'h4)] : (wire47 ?
                                  (wire51 ?
                                      wire49 : wire74) : (wire51 ^ wire51)))) ?
                      (wire46 > (&(~|$unsigned(wire52)))) : wire74[(2'h3):(2'h2)]);
  assign wire77 = (wire49[(4'h9):(3'h7)] && wire48);
endmodule

module module5
#(parameter param40 = (7'h43))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire38;
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  assign y = {wire11,
                 wire12,
                 wire13,
                 wire20,
                 wire38,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire11 = $unsigned(wire8);
  assign wire12 = $unsigned(wire10);
  assign wire13 = $signed((~|$signed(($unsigned(wire12) >> wire10[(4'hd):(1'h1)]))));
  always
    @(posedge clk) begin
      if ($signed(wire9))
        begin
          if (wire11)
            begin
              reg14 <= $signed(wire11[(2'h2):(1'h0)]);
              reg15 <= $unsigned($signed(wire13[(1'h1):(1'h0)]));
              reg16 <= $signed((8'h9c));
              reg17 <= reg16;
            end
          else
            begin
              reg14 <= $unsigned($signed(wire11));
              reg15 <= {$unsigned($unsigned(({wire11} <= (wire8 != wire7))))};
            end
          reg18 <= wire9[(3'h6):(3'h4)];
          reg19 <= wire6;
        end
      else
        begin
          if (wire8[(1'h1):(1'h1)])
            begin
              reg14 <= wire13;
              reg15 <= ((reg18[(3'h5):(2'h2)] <= {reg19}) ?
                  reg14 : $signed((8'ha3)));
              reg16 <= reg19[(2'h3):(1'h1)];
              reg17 <= $unsigned(wire9[(2'h2):(1'h1)]);
            end
          else
            begin
              reg14 <= $signed(wire8[(1'h1):(1'h1)]);
              reg15 <= $unsigned((reg18 >>> $unsigned(wire7[(4'h8):(3'h5)])));
              reg16 <= (($signed($signed((wire12 ? wire9 : reg18))) ?
                      wire9 : $unsigned(wire8)) ?
                  $signed($signed((~^(8'ha2)))) : {$signed($signed(wire13)),
                      $signed(reg14[(1'h1):(1'h0)])});
              reg17 <= (~|(8'hb6));
              reg18 <= ($signed($signed(($signed(wire12) ?
                  $signed(reg18) : (reg18 & reg19)))) * ($signed({$signed((8'ha1))}) || $unsigned($unsigned((-wire13)))));
            end
          reg19 <= (reg17 ? wire10 : (-wire7));
        end
    end
  assign wire20 = reg18;
  module21 #() modinst39 (.wire25(wire9), .clk(clk), .wire24(reg17), .wire22(wire12), .wire26(reg19), .y(wire38), .wire23(wire11));
endmodule

module module21
#(parameter param36 = ((~|(+({(8'h9e), (8'ha7)} ? (~(8'ha4)) : ((8'hb0) ? (8'hab) : (8'haf))))) != (((((8'h9d) ? (8'hbc) : (7'h40)) ? {(7'h42), (8'hba)} : ((8'hb9) >>> (8'ha5))) ? (((7'h42) ? (8'ha6) : (8'haf)) ? (|(8'haf)) : ((8'ha4) != (8'hbe))) : (8'hb6)) ? ((((8'ha0) ^~ (7'h42)) ? (^~(8'hb0)) : ((8'h9f) ? (8'hba) : (8'hb6))) ? {((8'ha7) ? (8'ha4) : (8'h9c)), (|(8'hb7))} : {((8'hbe) ? (8'hb3) : (8'h9c)), ((8'hba) ? (8'hb3) : (8'h9f))}) : ((((7'h42) && (8'h9d)) - ((8'ha1) ? (8'hb9) : (8'ha4))) ? (((8'hb5) ? (8'hb1) : (8'haa)) ? ((8'ha5) > (8'ha9)) : (8'hba)) : (((8'hb0) >>> (8'hb0)) < ((8'ha0) > (8'hbd)))))), 
parameter param37 = param36)
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire26;
  input wire [(5'h10):(1'h0)] wire25;
  input wire signed [(4'ha):(1'h0)] wire24;
  input wire signed [(3'h4):(1'h0)] wire23;
  input wire signed [(4'hd):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 (1'h0)};
  assign wire27 = (wire23 != wire25[(3'h5):(1'h1)]);
  assign wire28 = ($unsigned({{(wire22 ~^ (8'hb0))}}) - {(((wire22 ?
                          wire24 : wire23) > $unsigned(wire22)) - ((wire24 ?
                              wire25 : wire22) ?
                          (wire22 >>> (8'ha8)) : wire26)),
                      $signed($unsigned(wire25[(4'hf):(4'he)]))});
  assign wire29 = {$unsigned(wire23[(1'h1):(1'h1)]), wire24};
  assign wire30 = $unsigned((8'h9c));
  assign wire31 = ($unsigned($unsigned(wire26)) ^~ ($signed(wire24[(3'h5):(3'h5)]) == ((^~wire24) ?
                      (7'h40) : wire27)));
  assign wire32 = (($signed(((wire23 ~^ wire24) >= (|wire30))) < $unsigned($unsigned(wire26[(1'h1):(1'h0)]))) ?
                      $unsigned($signed(($unsigned(wire29) ?
                          $signed(wire27) : (&wire29)))) : $signed(wire22[(4'hb):(4'h8)]));
  assign wire33 = ((^~((wire32 ? $signed(wire22) : (&(8'h9e))) ?
                          ($signed(wire23) <<< $signed((8'hbe))) : $signed((wire27 << (8'ha0))))) ?
                      ((-$signed(wire31[(3'h6):(1'h0)])) ?
                          $unsigned($signed(wire31)) : wire29[(4'hb):(4'ha)]) : (+$signed($unsigned((|wire32)))));
  assign wire34 = $unsigned(($unsigned((~^(-wire27))) * (($signed(wire31) >>> (~^(8'ha8))) <<< $signed(wire25))));
  assign wire35 = (8'hae);
endmodule

module module54
#(parameter param72 = {{((((7'h42) >= (8'had)) + (8'hba)) >>> {((8'hb5) | (8'hb7))}), ((((8'hb6) <= (8'hac)) ? (&(8'h9c)) : {(8'hbf)}) ? ((!(8'hb8)) <= ((8'ha8) | (7'h43))) : ((~(8'hb5)) ? ((8'hb8) ? (8'hbf) : (8'ha8)) : ((8'hab) ? (8'hb1) : (8'ha7))))}, (((~&(+(8'ha3))) + {(~^(8'ha0)), {(8'ha6), (8'hb8)}}) ? (({(7'h43)} || (!(8'hbd))) ? (((8'had) - (7'h42)) && ((7'h41) >> (8'hac))) : (+((8'hab) + (8'hb8)))) : (((~&(7'h41)) || (^~(7'h42))) ? (((8'hba) ? (8'ha2) : (8'haa)) ? (~(8'hbd)) : (!(8'h9e))) : (((8'ha5) ? (8'hb4) : (7'h42)) ? ((7'h40) ? (8'hbe) : (8'ha9)) : (|(8'ha0)))))}, 
parameter param73 = (!param72))
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire59;
  input wire signed [(5'h10):(1'h0)] wire58;
  input wire [(5'h15):(1'h0)] wire57;
  input wire signed [(4'hf):(1'h0)] wire56;
  input wire [(4'hd):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire60;
  reg signed [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire60 = $signed(wire57[(5'h13):(5'h10)]);
  assign wire61 = ((^(~&(+(wire60 ? wire57 : wire59)))) ?
                      (($unsigned($unsigned(wire58)) || ((&wire57) > $signed(wire57))) >= {({wire58,
                              wire60} < wire56)}) : (($unsigned((+wire56)) > (~$signed(wire58))) ?
                          ((&$unsigned(wire55)) ?
                              {wire55[(1'h0):(1'h0)],
                                  $unsigned((8'h9e))} : (~(wire58 < wire56))) : (8'had)));
  assign wire62 = $unsigned(wire61[(3'h5):(1'h1)]);
  assign wire63 = {(wire62 << (({wire57, wire55} ?
                          {wire61,
                              (8'hb2)} : $signed(wire58)) <<< (wire60 >> wire61[(4'hd):(3'h6)])))};
  assign wire64 = wire61[(4'hf):(4'hc)];
  assign wire65 = (|$unsigned(wire64));
  assign wire66 = $unsigned({(^wire62[(4'he):(2'h2)]),
                      (~&(wire60 ?
                          $signed(wire58) : (wire65 ? wire57 : wire59)))});
  always
    @(posedge clk) begin
      reg67 <= wire60;
    end
  always
    @(posedge clk) begin
      reg68 <= (~$unsigned($unsigned($unsigned(wire56))));
    end
  assign wire69 = (($signed(((8'hb7) ? {wire62} : (wire56 ^ wire65))) ?
                      ((^~wire64[(2'h3):(1'h1)]) + (^$signed(wire57))) : wire56) && $unsigned(reg67));
  assign wire70 = ($unsigned($unsigned(((wire57 ?
                      wire58 : wire66) <= $signed(reg67)))) != (+($signed((!wire57)) < wire60)));
  assign wire71 = wire55;
endmodule
