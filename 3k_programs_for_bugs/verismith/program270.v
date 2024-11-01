module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire124;
  wire [(4'he):(1'h0)] wire122;
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  assign y = {wire128, wire124, wire122, reg127, reg126, reg125, (1'h0)};
  module4 #() modinst123 (.wire8(wire3), .wire7(wire1), .y(wire122), .clk(clk), .wire6(wire2), .wire5(wire0));
  assign wire124 = $unsigned($unsigned((^~$unsigned(wire2[(4'h9):(4'h8)]))));
  always
    @(posedge clk) begin
      reg125 <= $unsigned(wire2);
      reg126 <= wire3[(1'h0):(1'h0)];
      reg127 <= $unsigned(reg125);
    end
  assign wire128 = $signed((!$unsigned($unsigned(wire3))));
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire121;
  wire [(4'hf):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire65;
  wire [(2'h3):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire119;
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  assign y = {wire121,
                 wire52,
                 wire10,
                 wire9,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire119,
                 reg59,
                 reg60,
                 reg61,
                 (1'h0)};
  assign wire9 = wire8;
  assign wire10 = (($signed(wire9[(3'h7):(3'h5)]) ?
                          wire5[(3'h6):(3'h4)] : (wire5 ?
                              (wire6[(4'he):(2'h2)] >> (+wire8)) : $signed(((8'h9c) == (8'hb8))))) ?
                      (wire7 ?
                          (~^(~|(~|wire5))) : wire6[(1'h1):(1'h1)]) : wire7);
  module11 #() modinst53 (.wire13(wire8), .clk(clk), .wire16(wire5), .wire14(wire9), .y(wire52), .wire12(wire10), .wire15(wire6));
  assign wire54 = $signed(({$signed((wire8 ? wire9 : wire52))} ?
                      wire52[(4'ha):(1'h0)] : (|wire7)));
  assign wire55 = $unsigned((!($unsigned($unsigned(wire10)) ?
                      ($signed(wire54) ?
                          (^~wire52) : wire8) : $signed($unsigned(wire10)))));
  assign wire56 = wire9[(3'h6):(1'h0)];
  assign wire57 = $unsigned(($signed(wire8[(2'h3):(1'h1)]) <<< ($signed((wire5 - wire10)) ?
                      $unsigned((wire6 != wire52)) : (wire10[(2'h2):(1'h0)] <= ((7'h42) ?
                          wire10 : wire52)))));
  assign wire58 = ((wire52[(4'ha):(2'h3)] + wire6[(5'h13):(4'ha)]) || $signed($signed({(wire9 ^ (8'had)),
                      (~&(8'hbc))})));
  always
    @(posedge clk) begin
      reg59 <= wire52[(4'he):(4'h8)];
      reg60 <= $signed($unsigned($signed($signed((-wire7)))));
    end
  always
    @(posedge clk) begin
      reg61 <= wire55[(4'hd):(3'h7)];
    end
  assign wire62 = (&($signed(((^~(8'ha8)) ?
                          (reg61 ~^ wire56) : $unsigned(wire9))) ?
                      wire54[(4'hb):(3'h7)] : wire9));
  assign wire63 = (((&(8'hb2)) & wire9[(4'hc):(1'h1)]) ? (8'h9c) : wire54);
  assign wire64 = (wire52[(4'ha):(2'h3)] == wire10);
  assign wire65 = wire56[(3'h7):(3'h5)];
  assign wire66 = reg61;
  assign wire67 = $signed((~^(|wire55)));
  assign wire68 = reg61;
  assign wire69 = (wire55[(3'h5):(2'h2)] < $unsigned($signed((wire52 ?
                      (wire52 > wire54) : wire68[(3'h7):(2'h2)]))));
  module70 #() modinst120 (wire119, clk, reg60, wire52, wire10, wire65);
  assign wire121 = (wire6 && wire58[(3'h6):(1'h0)]);
endmodule

module module70
#(parameter param117 = (~^(~|({(~(8'hb4))} ? (^~{(7'h41), (8'ha2)}) : {((7'h40) - (8'hac)), ((8'hae) ^ (8'hb2))}))), 
parameter param118 = param117)
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h21a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire74;
  input wire signed [(4'h8):(1'h0)] wire73;
  input wire [(4'hb):(1'h0)] wire72;
  input wire [(2'h2):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire116;
  wire [(4'ha):(1'h0)] wire115;
  wire signed [(3'h7):(1'h0)] wire114;
  wire [(4'hf):(1'h0)] wire113;
  wire [(4'hd):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire75;
  reg signed [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire75,
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
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire75 = $signed(wire71);
  always
    @(posedge clk) begin
      if ((|wire73))
        begin
          reg76 <= wire71;
          reg77 <= ((~|(^~((wire74 <= wire75) ?
                  $unsigned(wire75) : $unsigned((8'hab))))) ?
              $signed($signed(wire74)) : {{(wire71[(1'h0):(1'h0)] == wire72[(2'h3):(1'h1)])}});
          reg78 <= wire75;
        end
      else
        begin
          if ($signed(($signed((wire74[(4'ha):(3'h7)] < $signed(reg78))) >>> (reg78[(1'h1):(1'h1)] ?
              ({wire73} <<< $unsigned(reg78)) : wire72))))
            begin
              reg76 <= wire73[(2'h3):(2'h3)];
              reg77 <= $unsigned($signed(((8'h9f) ?
                  wire72 : $unsigned(wire75))));
              reg78 <= (wire73[(1'h1):(1'h1)] ~^ (wire71[(1'h0):(1'h0)] ?
                  (~^wire75) : {wire72[(4'hb):(3'h4)], reg78[(1'h1):(1'h0)]}));
              reg79 <= $unsigned((~&reg78[(1'h1):(1'h1)]));
            end
          else
            begin
              reg76 <= (((8'hb9) ?
                  wire71 : $unsigned(wire71[(1'h0):(1'h0)])) << $unsigned(wire75));
              reg77 <= ($signed($unsigned($signed((reg77 ?
                  wire74 : (8'hac))))) << wire72);
            end
          if (($signed(($unsigned((~^wire75)) - $signed((8'hb4)))) ?
              ((wire75[(2'h2):(1'h1)] & reg76) + wire71) : $signed((((wire73 ?
                          reg76 : wire73) ?
                      wire75 : wire74) ?
                  $unsigned(wire71) : ((wire73 - wire72) ~^ (reg76 <= (8'h9c)))))))
            begin
              reg80 <= ((~((reg76[(3'h5):(3'h5)] ?
                          (|wire71) : $signed(wire71)) ?
                      ($unsigned(wire73) ?
                          (reg79 ?
                              wire75 : wire72) : wire72) : ($signed(wire72) ?
                          (reg77 ? reg78 : wire75) : (reg77 - wire74)))) ?
                  (wire72[(4'h8):(3'h6)] >= ($signed((wire73 ?
                          wire74 : wire72)) ?
                      ({reg76,
                          reg79} <= $unsigned(reg76)) : wire71)) : $signed($unsigned($signed({reg77}))));
              reg81 <= {(reg79 ?
                      ((reg79 ?
                              reg78[(1'h1):(1'h1)] : (reg78 ? reg80 : reg80)) ?
                          $signed((reg78 - reg78)) : {(^~wire74),
                              (~&wire72)}) : {wire72[(4'ha):(3'h4)],
                          {$unsigned(wire72)}}),
                  (^wire71[(1'h0):(1'h0)])};
              reg82 <= $signed((($signed(wire73[(1'h0):(1'h0)]) ?
                  {(^reg78),
                      $unsigned(reg76)} : $unsigned(wire71[(1'h1):(1'h1)])) + (wire72[(4'h8):(1'h0)] << reg81[(4'he):(1'h0)])));
              reg83 <= reg79[(1'h0):(1'h0)];
            end
          else
            begin
              reg80 <= {((~|wire74) << (8'haf))};
              reg81 <= wire71[(1'h0):(1'h0)];
              reg82 <= $unsigned(reg80[(1'h1):(1'h1)]);
              reg83 <= (&wire73);
              reg84 <= $unsigned($signed((+$signed(wire74))));
            end
          reg85 <= $unsigned(($unsigned((|(+reg78))) ?
              (reg76 ?
                  (reg76 ?
                      reg79[(1'h1):(1'h1)] : reg77[(5'h15):(3'h4)]) : $signed((reg82 && (8'hba)))) : reg79));
          if ((((((reg76 ? (8'h9c) : reg76) <= $unsigned(reg84)) ?
                  {(reg85 != (8'h9e)), {wire75}} : (reg77[(4'he):(4'he)] ?
                      ((8'haf) ? reg79 : reg78) : reg83)) ?
              ($unsigned((|(8'hba))) ?
                  reg81[(1'h1):(1'h0)] : ((reg80 << reg85) ?
                      $unsigned(wire74) : (|(8'hb7)))) : (wire74 ?
                  $unsigned({wire72, reg77}) : {(-reg82)})) < ((!{(reg78 ?
                  wire72 : reg76)}) | (($unsigned(reg81) & $unsigned(reg77)) | {(+(8'hae)),
              (+wire74)}))))
            begin
              reg86 <= $unsigned(reg76);
              reg87 <= $unsigned($signed((+(reg79[(1'h1):(1'h1)] ^ (wire72 <<< (8'hb7))))));
            end
          else
            begin
              reg86 <= $unsigned({$unsigned($unsigned(reg81[(2'h3):(1'h1)])),
                  (~$unsigned((reg79 != reg83)))});
              reg87 <= reg86;
              reg88 <= wire72;
              reg89 <= reg87[(1'h0):(1'h0)];
              reg90 <= reg83;
            end
        end
      if ($unsigned($unsigned(reg78)))
        begin
          if ($signed(reg79[(1'h0):(1'h0)]))
            begin
              reg91 <= ((($unsigned((reg79 >> reg90)) >>> (!(wire71 <= wire71))) ?
                  $signed($unsigned((reg90 || reg83))) : {(!(reg86 >> reg85))}) || (~|{reg78[(1'h1):(1'h1)]}));
              reg92 <= (8'haf);
              reg93 <= (!$signed(reg83));
            end
          else
            begin
              reg91 <= ((7'h40) <= reg77);
              reg92 <= $signed((reg84[(1'h1):(1'h0)] && (~&reg82)));
              reg93 <= ((reg79[(3'h4):(3'h4)] - reg93) >> (reg77 ?
                  reg83[(3'h4):(1'h1)] : $signed($signed(reg82))));
            end
          reg94 <= (($signed(((reg83 < reg80) ^ ((8'hb2) - reg90))) ?
                  ($signed(((8'hbe) ? (8'h9d) : wire71)) ?
                      wire71[(1'h1):(1'h0)] : (~^(reg85 ?
                          (8'hb0) : reg93))) : (~|(8'ha0))) ?
              (-(reg87 ?
                  reg82[(4'hb):(3'h4)] : reg78[(2'h2):(2'h2)])) : (reg77[(4'h8):(2'h3)] ?
                  reg76 : (~|$signed(reg91))));
          reg95 <= ((!($signed((-reg86)) <= {$unsigned(wire72)})) < reg94[(1'h1):(1'h0)]);
        end
      else
        begin
          reg91 <= (((~&(reg76[(4'he):(4'h8)] >>> $unsigned(reg82))) ?
              (8'haa) : reg92[(2'h3):(1'h1)]) != ($signed((^{reg77, reg80})) ?
              ((((8'hab) ? wire72 : reg92) ?
                      (reg88 >> reg78) : $unsigned(reg76)) ?
                  $unsigned($signed(reg79)) : reg82) : (-(~&(reg78 ?
                  (8'h9d) : reg88)))));
          reg92 <= {reg89, (~&reg92[(3'h5):(3'h4)])};
          reg93 <= (~$unsigned((~&(8'hbe))));
          reg94 <= ((|$signed($signed((reg86 > reg95)))) != {$unsigned(($unsigned((8'ha3)) && $signed(reg82))),
              reg92});
          if ((~&$unsigned((reg94[(4'hd):(4'hb)] >> {$signed(reg88),
              reg81[(4'h9):(1'h1)]}))))
            begin
              reg95 <= ($unsigned($signed(((^reg89) ?
                      $signed(wire71) : {reg79, wire71}))) ?
                  $signed((reg91 | (8'hb0))) : (8'ha4));
              reg96 <= $signed($unsigned(reg76));
              reg97 <= (8'ha0);
              reg98 <= (($unsigned($unsigned($signed(reg89))) ?
                  {(~|$unsigned(reg84))} : (8'ha4)) >>> (~&reg81));
              reg99 <= reg83;
            end
          else
            begin
              reg95 <= ($unsigned($unsigned($unsigned($unsigned(reg81)))) != {(~|(^$unsigned(reg93)))});
              reg96 <= reg99;
            end
        end
      if ((reg78[(1'h1):(1'h0)] ?
          reg96[(4'hc):(4'h9)] : (&(({reg92, wire75} | (reg96 ?
                  reg96 : (8'ha3))) ?
              (~^{wire73}) : wire73[(1'h0):(1'h0)]))))
        begin
          reg100 <= wire72[(4'ha):(2'h2)];
          reg101 <= (reg85 ?
              reg79[(3'h4):(1'h0)] : $unsigned((wire74[(3'h7):(1'h0)] ^~ reg83)));
          reg102 <= (((8'ha4) ?
              ((^reg90[(3'h7):(3'h6)]) ^ $signed((~&(8'hac)))) : {reg101[(1'h1):(1'h1)]}) == ({(+$signed(reg77))} ?
              ($signed((reg81 ? wire73 : reg80)) ?
                  ((~|reg92) | (~&reg77)) : reg101) : (reg94 - ($signed(reg92) <<< reg98[(4'h9):(3'h7)]))));
          reg103 <= (~^$signed(reg91));
          reg104 <= reg87[(2'h2):(2'h2)];
        end
      else
        begin
          if (reg101[(4'ha):(3'h7)])
            begin
              reg100 <= $unsigned(reg104[(2'h2):(2'h2)]);
              reg101 <= ({(^~$unsigned(reg80)),
                  (8'hb6)} == ($unsigned(reg81) ^ reg94));
              reg102 <= (~$unsigned($signed(($unsigned(wire75) << reg81[(3'h7):(3'h4)]))));
              reg103 <= (~|(!(-$unsigned((+(8'ha8))))));
            end
          else
            begin
              reg100 <= reg91[(1'h1):(1'h0)];
              reg101 <= (!(+reg78));
              reg102 <= (reg86[(3'h4):(2'h3)] ?
                  ((^~reg79[(4'hb):(4'h8)]) ?
                      (&reg80[(3'h6):(2'h2)]) : $unsigned(reg97)) : $unsigned(wire75));
              reg103 <= $signed(($unsigned($unsigned(((8'hb1) ?
                      (7'h40) : reg94))) ?
                  (reg95 ?
                      $unsigned((8'h9c)) : (reg82 ~^ (wire71 ?
                          wire75 : reg98))) : $signed($signed($signed((8'hbc))))));
              reg104 <= reg76[(4'hb):(3'h5)];
            end
          reg105 <= (8'hbb);
        end
    end
  assign wire106 = ($unsigned(($signed((8'ha5)) < $signed((reg105 - reg98)))) ?
                       (~&(+reg79[(2'h2):(1'h1)])) : {reg77[(4'h9):(2'h2)],
                           $signed(reg84[(3'h5):(1'h1)])});
  assign wire107 = (+reg80);
  assign wire108 = wire106;
  assign wire109 = wire106;
  assign wire110 = {$unsigned($signed(reg94)),
                       (($signed((+wire106)) ?
                           $signed(((8'hba) * reg103)) : (!(reg102 & reg100))) || (((reg85 ?
                                   wire72 : reg103) ?
                               reg105[(4'ha):(1'h0)] : {reg98}) ?
                           ((~^(8'ha4)) && $unsigned(reg99)) : ((|reg77) ?
                               wire107[(4'hc):(4'h8)] : (reg97 * wire74))))};
  assign wire111 = (wire74 & $unsigned($unsigned(($unsigned(wire73) ~^ (&reg86)))));
  assign wire112 = reg94;
  assign wire113 = (wire107 - wire72[(2'h3):(1'h1)]);
  assign wire114 = $signed((reg104 <= wire74[(2'h2):(1'h0)]));
  assign wire115 = ({wire114, (8'ha8)} >> (~&{$signed($signed(reg98))}));
  assign wire116 = $signed($signed((reg78 ?
                       ((reg101 ? reg97 : wire109) ?
                           $signed(reg90) : $signed(reg87)) : {reg95[(2'h3):(2'h2)]})));
endmodule

module module11
#(parameter param51 = (^((|({(8'hbc)} ? (-(8'hb9)) : ((7'h40) << (8'hbf)))) & (~(+(!(8'ha5)))))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire [(2'h3):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire17;
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire32,
                 wire31,
                 wire30,
                 wire17,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg35,
                 reg34,
                 reg33,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire17 = ({wire16,
                          $signed((wire12 ?
                              {wire12} : (wire14 ? wire13 : wire12)))} ?
                      ({{(!wire16)}, wire14} ?
                          (wire16 ^~ (8'h9c)) : $signed((!(wire13 ^ wire12)))) : wire13[(4'hb):(3'h5)]);
  always
    @(posedge clk) begin
      reg18 <= $unsigned(wire17[(4'h9):(4'h9)]);
      reg19 <= {{(~|$unsigned((^~wire15))),
              $signed((wire16[(3'h5):(2'h3)] ?
                  $signed(wire17) : ((8'hb6) <= wire15)))}};
      if (reg18)
        begin
          if ((wire15[(2'h3):(2'h2)] ?
              $unsigned({{(wire13 || wire13)}}) : (wire15[(2'h3):(2'h2)] ?
                  {$signed(wire16)} : (^~(^~(wire15 != wire17))))))
            begin
              reg20 <= wire15[(1'h0):(1'h0)];
              reg21 <= ((wire12 >= wire15) * $unsigned(((!reg20) ?
                  wire16 : wire15)));
              reg22 <= $unsigned(wire13[(4'hc):(2'h3)]);
              reg23 <= wire13[(2'h2):(1'h1)];
              reg24 <= $signed(($unsigned({$unsigned((8'ha9)),
                      reg19[(2'h3):(1'h1)]}) ?
                  (&((&wire14) ?
                      reg22[(1'h0):(1'h0)] : (^reg23))) : (~($signed(reg20) & reg19[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg20 <= reg22[(3'h4):(1'h1)];
              reg21 <= wire14;
            end
          reg25 <= ((+wire17) < reg19);
          if ($signed((+wire17)))
            begin
              reg26 <= $signed((&reg22));
              reg27 <= reg25;
              reg28 <= ({$signed(wire16)} ? wire16 : $unsigned(wire17));
            end
          else
            begin
              reg26 <= (((|reg27) ~^ (wire14 >>> reg27[(4'h8):(3'h6)])) ~^ wire16);
              reg27 <= reg19[(1'h1):(1'h1)];
              reg28 <= {reg22,
                  $unsigned(((((8'hbc) && reg20) ?
                      (^(8'hb0)) : $unsigned(reg28)) || (~$unsigned(reg25))))};
            end
        end
      else
        begin
          if (wire17)
            begin
              reg20 <= (wire17 ?
                  ((($unsigned(reg22) | $unsigned(reg22)) ?
                          $unsigned((+wire16)) : reg25) ?
                      ($signed(reg22[(2'h3):(2'h3)]) == (~|wire15)) : reg24) : (wire13 ?
                      ({wire15,
                          (^~(8'hb9))} >> $unsigned({wire15})) : reg24[(3'h5):(3'h4)]));
              reg21 <= reg24[(3'h4):(3'h4)];
            end
          else
            begin
              reg20 <= wire15[(2'h2):(1'h0)];
              reg21 <= ((reg27[(2'h3):(2'h2)] <= $signed((wire16[(4'h9):(1'h0)] ?
                  (~wire12) : $signed(reg26)))) ^~ ($signed($unsigned((&reg24))) * ($unsigned(reg27[(3'h7):(3'h5)]) > (reg19[(3'h5):(1'h1)] & $signed((8'ha1))))));
              reg22 <= wire17;
              reg23 <= (~|wire16[(3'h5):(2'h3)]);
            end
          reg24 <= (^$signed(wire15[(1'h1):(1'h1)]));
          if ((reg23[(1'h0):(1'h0)] ? (8'ha9) : reg26))
            begin
              reg25 <= {reg22[(2'h3):(2'h2)]};
              reg26 <= $signed(reg24);
              reg27 <= (^{$signed(($unsigned(reg22) ?
                      (reg20 * reg22) : $signed(wire16)))});
            end
          else
            begin
              reg25 <= {((^~reg20[(4'h8):(3'h6)]) && (reg25 ?
                      $signed(reg24) : ($signed((8'ha5)) == (reg18 ?
                          reg23 : reg24)))),
                  $unsigned($unsigned((^~(|reg28))))};
            end
          reg28 <= reg26[(3'h4):(2'h3)];
        end
      reg29 <= (^~$unsigned((((8'hbb) ?
          (^reg26) : (~|reg21)) != ((wire15 != (8'ha3)) ?
          $signed(wire16) : $unsigned(reg19)))));
    end
  assign wire30 = (($unsigned($unsigned((7'h44))) * {((wire16 * reg29) || reg24)}) ?
                      (reg26[(3'h6):(1'h0)] ^ $signed((&wire14[(4'ha):(3'h7)]))) : (-(^~$unsigned(reg22[(1'h0):(1'h0)]))));
  assign wire31 = {$signed({(~&(reg27 ^~ reg20)), wire17[(1'h1):(1'h0)]}),
                      (^reg27[(2'h3):(2'h2)])};
  assign wire32 = ((^~$signed(reg23)) >>> (~reg20[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg33 <= {wire15};
      reg34 <= ($unsigned((^~wire17)) != reg33[(1'h0):(1'h0)]);
      reg35 <= wire16[(2'h2):(1'h0)];
    end
  assign wire36 = (+((|$signed((|wire16))) <= reg33[(2'h3):(1'h1)]));
  assign wire37 = $unsigned((reg18 >>> $signed(((wire12 ^ (8'hbf)) ?
                      (|reg20) : (reg35 << wire16)))));
  assign wire38 = reg19;
  assign wire39 = ($unsigned(wire30) + ((wire31 && ($unsigned(reg20) >>> (wire13 ?
                          (8'hb7) : reg27))) ?
                      $signed((8'hb3)) : {(((8'ha5) ?
                              (8'ha2) : wire16) - (8'hb8))}));
  always
    @(posedge clk) begin
      if ((-(8'hb8)))
        begin
          if (((~&$unsigned((-$unsigned((7'h41))))) ?
              $unsigned(({(reg23 ? reg19 : wire31)} ?
                  (reg22[(1'h1):(1'h0)] ?
                      (wire15 ?
                          reg28 : reg35) : (wire32 + (8'hab))) : (wire14 >> {reg34}))) : ($unsigned((&reg23)) ?
                  (({reg19, (8'had)} || $signed(reg34)) ?
                      wire32[(4'hc):(3'h7)] : wire31) : (~^($unsigned(reg28) ^ $signed(reg27))))))
            begin
              reg40 <= {((wire39 < (!wire30[(2'h3):(2'h2)])) || $signed($signed(reg21[(4'hf):(4'ha)]))),
                  (~|($signed((^reg28)) > wire17[(1'h1):(1'h0)]))};
              reg41 <= $signed($signed($unsigned((^reg40[(2'h2):(2'h2)]))));
              reg42 <= wire17[(3'h7):(2'h3)];
            end
          else
            begin
              reg40 <= {reg19,
                  {($unsigned((^~(8'ha2))) ?
                          reg22[(2'h2):(1'h0)] : reg26[(4'hb):(3'h6)]),
                      (&$signed($unsigned(wire32)))}};
              reg41 <= reg42;
              reg42 <= reg22[(3'h4):(1'h0)];
              reg43 <= reg35;
            end
          reg44 <= (&($unsigned(((^~(8'hbb)) ?
              (reg21 ? wire37 : reg35) : {(8'hbd)})) > wire38));
        end
      else
        begin
          reg40 <= reg43;
          if ($signed(wire32[(4'h9):(1'h0)]))
            begin
              reg41 <= {$unsigned(reg19[(3'h5):(3'h5)])};
              reg42 <= wire36[(2'h2):(1'h1)];
              reg43 <= (-wire32);
            end
          else
            begin
              reg41 <= reg26[(5'h11):(4'h9)];
            end
        end
      reg45 <= reg40[(3'h4):(2'h2)];
      reg46 <= ({{((reg27 ? wire31 : wire17) ?
                  reg20[(1'h0):(1'h0)] : ((8'ha7) > (8'ha7)))}} & {($unsigned($signed(wire39)) ?
              wire31[(2'h3):(1'h1)] : (^(reg43 ? wire16 : wire31))),
          ($signed((wire30 >= reg18)) > (!wire32[(2'h3):(1'h1)]))});
      reg47 <= (~$signed((|{(wire17 <= wire39), reg40[(3'h5):(3'h4)]})));
    end
  assign wire48 = (!$unsigned(wire13[(3'h7):(3'h7)]));
  assign wire49 = $signed($signed(($unsigned((7'h43)) ?
                      (wire37[(4'hd):(4'hb)] >>> $signed(reg33)) : (^~$unsigned(wire14)))));
  assign wire50 = wire36[(3'h7):(3'h7)];
endmodule
