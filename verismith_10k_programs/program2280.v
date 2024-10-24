module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(3'h4):(1'h0)] wire134;
  wire signed [(4'he):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire132;
  wire signed [(3'h5):(1'h0)] wire131;
  wire signed [(2'h2):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire104;
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(5'h10):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire128,
                 wire121,
                 wire106,
                 wire4,
                 wire75,
                 wire104,
                 reg130,
                 reg129,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg120,
                 reg119,
                 reg118,
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
                 (1'h0)};
  assign wire4 = $signed(wire0[(2'h2):(1'h1)]);
  module5 #() modinst76 (.clk(clk), .wire9(wire1), .wire6(wire4), .y(wire75), .wire7(wire0), .wire8(wire2));
  module77 #() modinst105 (wire104, clk, wire1, wire2, wire75, wire0, wire3);
  assign wire106 = $unsigned(((wire0 < wire104) ?
                       $unsigned((wire2 ?
                           (wire3 ?
                               wire0 : (8'hbf)) : (wire75 ^ wire1))) : (~^$signed($unsigned(wire104)))));
  always
    @(posedge clk) begin
      reg107 <= $signed($unsigned($unsigned($unsigned(wire104))));
      reg108 <= wire3;
      reg109 <= $signed(((~$unsigned({wire4})) ?
          wire75[(1'h0):(1'h0)] : $signed({(^~wire75)})));
      if (wire75[(4'h8):(1'h0)])
        begin
          reg110 <= ({wire3, reg107} < $signed(((8'hbf) ? wire3 : wire3)));
          reg111 <= (+(-$signed(reg109[(3'h6):(1'h1)])));
        end
      else
        begin
          reg110 <= ($unsigned($signed(reg109)) ?
              reg110 : ((8'ha6) ? reg109 : wire106));
        end
      if ($signed(wire4[(5'h14):(4'hc)]))
        begin
          reg112 <= wire75[(4'h9):(1'h0)];
          reg113 <= (&(!$unsigned(wire104)));
          reg114 <= (~^$signed(($signed(((8'haf) + (7'h40))) ?
              {wire4[(5'h10):(1'h1)],
                  (wire0 ? wire2 : wire106)} : (reg112 && (wire1 < reg108)))));
        end
      else
        begin
          reg112 <= reg112;
          reg113 <= $signed($unsigned($signed((^(wire3 >= reg112)))));
          reg114 <= (wire1 <<< {$signed($unsigned(reg108))});
          if (reg109[(3'h4):(1'h1)])
            begin
              reg115 <= (reg109[(3'h7):(3'h4)] ?
                  ($signed((^(reg109 ?
                      wire4 : reg107))) != {wire106[(4'hc):(4'hb)],
                      (wire75[(3'h4):(1'h1)] * {(8'haf)})}) : $signed($signed((^reg112))));
              reg116 <= $unsigned(((~&(~|wire75)) ?
                  reg107 : $unsigned($unsigned((-wire106)))));
            end
          else
            begin
              reg115 <= (~|$unsigned(wire1[(5'h12):(3'h5)]));
              reg116 <= $signed(($unsigned($unsigned((+wire4))) ?
                  $unsigned(reg116[(4'hd):(4'h9)]) : reg115[(2'h2):(1'h1)]));
              reg117 <= ((8'hb9) > $signed({(+(wire0 < wire4))}));
            end
          if (wire0)
            begin
              reg118 <= $unsigned((reg107[(2'h3):(2'h2)] | (~&{$unsigned(reg116)})));
            end
          else
            begin
              reg118 <= reg116;
              reg119 <= (((($signed(wire104) != (8'ha2)) << (^~((8'hb5) ?
                      reg115 : wire2))) ?
                  ($signed(reg111) ?
                      ((reg111 > wire4) ?
                          wire0 : reg117[(3'h7):(1'h0)]) : reg108) : $unsigned(($signed((8'hbb)) >= {wire0,
                      reg111}))) << reg117[(2'h3):(1'h0)]);
              reg120 <= (^~$unsigned($signed((reg112 ?
                  {reg108} : (reg116 ~^ wire1)))));
            end
        end
    end
  assign wire121 = (+reg120);
  always
    @(posedge clk) begin
      if (((^~(&(reg108 ?
          $unsigned(wire1) : reg109))) | $signed($signed(reg111))))
        begin
          reg122 <= reg117[(3'h6):(3'h4)];
          reg123 <= (-reg120[(4'h8):(3'h7)]);
        end
      else
        begin
          reg122 <= $unsigned(((-(reg117 ?
              (reg111 ~^ (8'hb7)) : {reg120})) >>> ({$signed(reg115)} ?
              reg116[(3'h4):(1'h1)] : reg113)));
          reg123 <= reg123[(3'h6):(3'h4)];
          reg124 <= ($signed(($unsigned((wire2 ? wire1 : (8'hbb))) | ({(8'hb2),
              reg116} & $signed((8'ha8))))) <<< {(((^~reg111) ?
                  (wire104 < (7'h41)) : reg114[(2'h2):(1'h0)]) >>> reg113[(3'h5):(3'h4)]),
              reg119});
        end
      reg125 <= $unsigned($signed(($signed((8'hae)) <= wire0)));
      reg126 <= (8'h9e);
      reg127 <= reg116[(3'h4):(2'h2)];
    end
  assign wire128 = {((8'hb4) <= reg110), {$signed((|$signed((8'hbe))))}};
  always
    @(posedge clk) begin
      reg129 <= (wire75[(3'h6):(3'h6)] + (8'hb8));
      reg130 <= $unsigned(({{(&reg113), (wire121 ? reg123 : wire121)}} ?
          $unsigned(((^~wire128) >> $signed((8'hb1)))) : $signed(reg109)));
    end
  assign wire131 = $unsigned((reg127[(3'h4):(1'h0)] ?
                       $unsigned($unsigned(reg111[(5'h11):(1'h1)])) : (8'hb1)));
  assign wire132 = wire104[(1'h1):(1'h0)];
  assign wire133 = ($unsigned($signed(((reg115 ?
                           reg107 : reg109) < (+(8'haf))))) ?
                       reg120 : ({reg125[(3'h6):(3'h5)],
                           reg127} + $unsigned((^~wire106))));
  assign wire134 = (~|((reg108[(1'h0):(1'h0)] ?
                       $signed($signed(wire104)) : {wire106[(3'h4):(2'h2)],
                           {reg117}}) >= reg114[(2'h2):(1'h0)]));
endmodule

module module77
#(parameter param103 = (~(((8'ha0) == {((8'h9f) + (8'hab)), (-(7'h40))}) + (8'hbe))))
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire82;
  input wire [(5'h15):(1'h0)] wire81;
  input wire [(4'h9):(1'h0)] wire80;
  input wire signed [(3'h6):(1'h0)] wire79;
  input wire signed [(5'h10):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire101;
  wire signed [(5'h13):(1'h0)] wire100;
  wire signed [(5'h15):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire signed [(3'h7):(1'h0)] wire96;
  wire [(4'hd):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire92;
  wire signed [(2'h3):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire90;
  wire signed [(4'h8):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  wire signed [(2'h3):(1'h0)] wire87;
  wire [(3'h4):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 (1'h0)};
  assign wire83 = $signed(wire82[(3'h5):(2'h3)]);
  assign wire84 = (&(wire78[(5'h10):(4'ha)] ?
                      ($signed(wire78[(4'he):(1'h1)]) ?
                          wire80[(4'h9):(3'h6)] : $unsigned($signed(wire81))) : wire82[(4'he):(4'ha)]));
  assign wire85 = (($signed({wire81}) + {$signed(wire81)}) <<< wire79[(3'h5):(2'h3)]);
  assign wire86 = (~&wire80[(1'h0):(1'h0)]);
  assign wire87 = (-((((^wire85) << (wire82 > wire81)) | wire81) || (((wire84 ?
                              wire78 : wire83) ?
                          (wire81 > wire82) : wire82[(4'hc):(3'h6)]) ?
                      wire86[(2'h2):(1'h0)] : (wire81 ?
                          (wire86 ? wire83 : wire81) : (|(8'ha7))))));
  assign wire88 = (({$signed(wire80)} & ((wire80 ?
                              wire79[(3'h5):(3'h5)] : wire83) ?
                          wire79[(3'h6):(3'h5)] : $unsigned({wire81,
                              wire79}))) ?
                      (-$unsigned($unsigned(wire83))) : $unsigned(wire85[(3'h7):(2'h3)]));
  assign wire89 = (($unsigned(((wire78 ? (8'had) : wire82) << wire80)) ?
                          $unsigned(($signed(wire87) ?
                              {wire79, wire79} : (-wire79))) : (&wire85)) ?
                      (wire81[(4'h9):(4'h8)] ?
                          ($signed(wire85) & ((8'hb6) ?
                              {wire84} : wire86)) : ((^~(^~wire79)) ^~ $unsigned((^wire84)))) : wire80);
  assign wire90 = $unsigned(((&wire87[(2'h3):(2'h3)]) ?
                      ((wire89[(2'h2):(2'h2)] ?
                              ((8'hbb) ? wire89 : (8'h9e)) : (wire80 ?
                                  wire78 : wire79)) ?
                          (8'hb7) : wire79[(3'h5):(1'h1)]) : ((wire83[(3'h6):(2'h2)] ?
                          {wire79,
                              wire82} : wire79[(3'h5):(2'h2)]) > {(+wire82)})));
  assign wire91 = ((((8'hb0) ? $signed($signed(wire79)) : {{wire88, wire78}}) ?
                          (~$signed(wire89[(3'h5):(2'h3)])) : wire82[(4'hf):(4'hc)]) ?
                      (&$signed((wire79[(3'h4):(2'h3)] - $signed(wire86)))) : wire86[(2'h3):(2'h2)]);
  assign wire92 = (|($unsigned(wire81[(2'h2):(2'h2)]) ?
                      (wire90 ?
                          {{wire83}, (~^(7'h43))} : ((wire82 ?
                                  (8'ha8) : wire89) ?
                              (&wire90) : wire80[(2'h2):(2'h2)])) : wire90[(1'h0):(1'h0)]));
  assign wire93 = $unsigned($signed((~^wire79)));
  assign wire94 = $unsigned(((wire82[(3'h4):(1'h0)] ^ $unsigned((wire83 ?
                      wire88 : wire78))) ~^ ($unsigned((wire79 | wire83)) ?
                      wire78 : (wire78[(3'h7):(3'h4)] >>> wire81))));
  assign wire95 = wire90[(4'h9):(1'h1)];
  assign wire96 = ($unsigned(wire89[(2'h3):(1'h1)]) ? wire93 : wire79);
  assign wire97 = wire88[(1'h1):(1'h1)];
  assign wire98 = {(wire84[(1'h1):(1'h1)] << (wire93[(3'h5):(2'h3)] || wire96[(1'h0):(1'h0)])),
                      wire80};
  assign wire99 = (+(|(($unsigned(wire95) || $signed(wire83)) || $signed(wire96))));
  assign wire100 = $signed($unsigned(((8'ha8) >= (wire95 ?
                       wire84[(4'he):(3'h5)] : $unsigned(wire90)))));
  assign wire101 = wire85;
  assign wire102 = (8'hac);
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire55;
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire35,
                 wire21,
                 wire37,
                 wire38,
                 wire39,
                 wire55,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= $unsigned({$unsigned(wire9[(2'h2):(1'h1)]),
          {($unsigned(wire9) & wire8)}});
      if (wire7)
        begin
          if ($signed((~^((~^(8'ha5)) ? wire9[(3'h4):(2'h2)] : (8'ha2)))))
            begin
              reg11 <= (8'hb5);
              reg12 <= reg11[(4'he):(1'h0)];
              reg13 <= $signed((reg11 ?
                  (-$signed((^~reg12))) : {reg12, {reg10}}));
              reg14 <= reg12[(3'h7):(3'h5)];
              reg15 <= ((wire8[(5'h15):(1'h1)] ?
                      $unsigned({(reg12 ? reg14 : wire6),
                          $unsigned(wire6)}) : wire6[(3'h5):(2'h2)]) ?
                  ((~$signed((~&reg12))) ^~ ($signed(wire7) ?
                      (+$unsigned(wire9)) : (((8'hb3) ?
                          reg10 : reg14) - reg11[(5'h10):(4'hc)]))) : ($signed(wire6[(3'h7):(3'h6)]) ^ (!($unsigned(wire6) & $unsigned(reg14)))));
            end
          else
            begin
              reg11 <= $unsigned(reg15[(4'h9):(3'h4)]);
              reg12 <= $unsigned(((~&{(reg15 ?
                      wire7 : reg10)}) < $unsigned(((wire6 ?
                  reg12 : (8'hbf)) != $signed((8'ha1))))));
              reg13 <= {(((reg15 || (reg13 ^ reg13)) >> reg14) ?
                      (|reg15[(1'h1):(1'h0)]) : (~|reg13[(3'h4):(1'h1)])),
                  ($unsigned({wire6,
                      (reg11 ? reg11 : wire6)}) == reg13[(3'h6):(1'h1)])};
            end
          reg16 <= reg11[(4'hc):(4'h9)];
          reg17 <= (^(($signed($unsigned(reg14)) ?
                  (-wire8) : reg12[(2'h3):(2'h3)]) ?
              (+wire9[(4'h8):(1'h1)]) : {({wire8, (8'ha7)} ?
                      ((8'h9c) >= wire6) : reg11[(4'ha):(3'h5)])}));
          reg18 <= $unsigned({{wire9}});
        end
      else
        begin
          reg11 <= reg16;
        end
      reg19 <= (reg12[(2'h3):(1'h1)] ?
          ((+reg18[(2'h2):(1'h0)]) ?
              reg15 : ($signed($signed(reg15)) ?
                  reg13 : (wire9[(3'h6):(1'h1)] || {reg14}))) : $signed(($unsigned((~reg11)) ?
              ((wire8 ? wire9 : reg14) ?
                  reg12[(1'h0):(1'h0)] : reg10[(4'h9):(3'h4)]) : $signed((wire7 ^~ reg15)))));
      reg20 <= $unsigned($signed({reg18, (reg18 ^ (~|reg19))}));
    end
  assign wire21 = $signed(wire6);
  module22 #() modinst36 (wire35, clk, reg16, wire6, reg10, reg18);
  assign wire37 = reg17[(4'h8):(2'h2)];
  assign wire38 = $signed(wire8[(5'h10):(5'h10)]);
  assign wire39 = (^~(^(~^(~&$signed(wire6)))));
  module40 #() modinst56 (.wire44(wire38), .wire41(wire6), .wire45(reg12), .wire43(reg17), .y(wire55), .clk(clk), .wire42(wire7));
  assign wire57 = wire55;
  assign wire58 = (^$unsigned(wire55));
  assign wire59 = wire35;
  assign wire60 = $signed({reg20[(1'h0):(1'h0)],
                      $unsigned(reg10[(4'hd):(3'h6)])});
  always
    @(posedge clk) begin
      reg61 <= (($signed(((8'h9d) ? $signed(wire38) : reg17[(4'hf):(4'hb)])) ?
          ((8'ha7) <<< ($unsigned(reg17) ~^ {(8'ha5),
              wire59})) : (reg15 || wire6[(4'hd):(3'h6)])) - wire58[(3'h5):(2'h3)]);
      reg62 <= ((~|{{reg11, (wire59 ? reg13 : reg11)}, reg20[(4'h8):(3'h6)]}) ?
          (|reg19) : reg17[(3'h6):(3'h6)]);
      reg63 <= reg62[(1'h0):(1'h0)];
      reg64 <= wire35;
      if (wire21[(3'h6):(2'h2)])
        begin
          reg65 <= {((~$unsigned({reg20, reg10})) ?
                  (~^wire37) : (!$unsigned({wire58})))};
          reg66 <= reg17;
          if ($signed(((wire6 ? reg15[(2'h2):(2'h2)] : reg15) ?
              $unsigned(((wire35 ? (7'h40) : reg13) ?
                  (~reg13) : reg64)) : (|$signed($unsigned(reg18))))))
            begin
              reg67 <= reg66;
              reg68 <= ({reg16, reg17} == $unsigned((~|reg66)));
              reg69 <= reg64;
            end
          else
            begin
              reg67 <= {(($unsigned($signed(reg14)) ?
                      (wire55 << (reg14 ?
                          reg68 : wire7)) : $signed($signed(wire37))) <<< ($unsigned($unsigned(reg19)) ?
                      (reg19 ^~ (~&(8'ha0))) : $unsigned({reg12, (8'h9e)})))};
              reg68 <= ($unsigned(($signed(wire39) ?
                      $signed(reg68[(4'ha):(4'h9)]) : reg62)) ?
                  $signed((($unsigned((8'hba)) < wire57[(3'h7):(3'h7)]) ?
                      (&(|wire55)) : $signed({(8'hbd), (7'h42)}))) : (^reg10));
            end
          reg70 <= ((((((8'ha0) ^~ wire38) ?
                      reg10[(4'hf):(3'h7)] : $signed(reg19)) + (&$unsigned((8'hb3)))) ?
                  reg64 : reg16) ?
              (-$unsigned({$unsigned(reg14)})) : ((wire39[(4'h8):(4'h8)] ?
                      (^~$unsigned(reg16)) : (((8'hbc) < wire57) ^~ reg10)) ?
                  ($unsigned($signed(wire8)) + {wire38[(2'h2):(2'h2)]}) : ({$unsigned(reg10)} ?
                      $unsigned((!(8'had))) : reg10[(4'ha):(4'h9)])));
        end
      else
        begin
          reg65 <= wire37[(3'h4):(2'h3)];
          reg66 <= reg62[(1'h0):(1'h0)];
          reg67 <= wire9[(1'h0):(1'h0)];
        end
    end
  assign wire71 = (((~&$unsigned($unsigned((8'hb7)))) ?
                      $signed($signed((8'hb9))) : $signed($signed($unsigned(reg64)))) > (reg12 && (({wire8} && wire57) ?
                      reg65[(3'h6):(2'h3)] : ((8'ha2) ?
                          (wire38 ? reg13 : wire55) : (reg16 ?
                              reg20 : (8'hb6))))));
  assign wire72 = ($signed($unsigned($signed($unsigned(reg69)))) ?
                      (reg69[(2'h2):(1'h1)] ?
                          reg69[(1'h1):(1'h1)] : $signed((8'hb7))) : (~^((wire6[(5'h11):(5'h10)] <<< (wire8 < reg70)) ?
                          {((8'haf) ?
                                  wire37 : (8'ha2))} : (-wire57[(4'he):(3'h5)]))));
  assign wire73 = ($unsigned(($signed((~reg65)) ?
                          $unsigned($signed(wire59)) : (8'hab))) ?
                      (((~&(reg12 ?
                          (8'ha0) : reg15)) && (!$signed(reg19))) != $signed(wire55)) : $signed(reg10));
  assign wire74 = $signed($unsigned($unsigned(wire58[(5'h10):(2'h3)])));
endmodule

module module40  (y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire45;
  input wire [(4'hd):(1'h0)] wire44;
  input wire signed [(3'h4):(1'h0)] wire43;
  input wire signed [(5'h13):(1'h0)] wire42;
  input wire [(4'he):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 (1'h0)};
  assign wire46 = $signed(wire45);
  assign wire47 = (wire42[(4'hf):(2'h3)] ?
                      $unsigned($unsigned((^wire41[(4'he):(4'h8)]))) : wire43);
  assign wire48 = wire41[(4'hc):(2'h2)];
  assign wire49 = wire46;
  assign wire50 = $signed(((+wire44[(4'hd):(4'hc)]) ?
                      (+{wire46[(2'h3):(2'h3)],
                          $unsigned(wire49)}) : {{(wire41 || wire43)}}));
  assign wire51 = $signed({($signed((~&wire46)) ?
                          $unsigned($signed(wire42)) : ((wire48 >> (7'h42)) || {wire43})),
                      wire41});
  assign wire52 = $unsigned(((^($unsigned(wire45) ? wire43 : wire50)) ?
                      wire45 : {(~|wire47[(4'hf):(4'ha)])}));
  assign wire53 = (($signed(wire42) | {($signed(wire52) | $unsigned(wire49))}) < (|$unsigned(($signed((8'ha1)) ?
                      wire49 : $unsigned(wire43)))));
  assign wire54 = $signed({wire50[(4'h9):(1'h1)], (~&wire48)});
endmodule

module module22
#(parameter param34 = (~|{{(!((7'h41) ? (8'ha7) : (8'haa))), (8'ha6)}, (^~(((8'haf) <= (7'h43)) ? (8'hb6) : ((7'h43) >> (8'hab))))}))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire25;
  input wire signed [(3'h5):(1'h0)] wire24;
  input wire signed [(4'hb):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  assign y = {wire33, wire32, wire30, wire29, wire28, wire27, reg31, (1'h0)};
  assign wire27 = (~|(&(|(8'ha3))));
  assign wire28 = wire23;
  assign wire29 = ($signed(($signed({wire28}) | ((+wire25) ?
                      (~^wire28) : {wire24}))) <<< (wire26[(3'h7):(3'h7)] ?
                      ($signed((!wire28)) ?
                          (wire23 ?
                              (|wire25) : {wire24,
                                  wire28}) : wire23[(4'h8):(3'h5)]) : (wire23[(3'h4):(2'h3)] ?
                          $unsigned((wire26 ^~ wire26)) : wire23)));
  assign wire30 = ($unsigned(($unsigned((wire23 <= wire25)) ?
                          wire23[(3'h4):(1'h0)] : $signed($unsigned((8'h9c))))) ?
                      wire27 : wire28[(4'he):(3'h7)]);
  always
    @(posedge clk) begin
      reg31 <= {wire30[(4'h8):(2'h2)]};
    end
  assign wire32 = ($signed(wire28[(4'hb):(3'h5)]) ?
                      wire28[(2'h3):(1'h0)] : ($unsigned((&$signed(wire23))) * ((8'haf) <= ((!wire25) ~^ wire30[(3'h4):(1'h1)]))));
  assign wire33 = $unsigned($signed((reg31 >= wire26[(3'h5):(3'h5)])));
endmodule
