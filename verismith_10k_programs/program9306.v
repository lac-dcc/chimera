module top
#(parameter param136 = (((~(((8'hbd) ^ (7'h43)) && (&(8'hb3)))) ? ((^~{(8'hb6), (8'ha2)}) & (^((8'ha3) ? (8'hb9) : (8'hb6)))) : (^~((!(8'ha0)) - ((8'hb7) ? (8'h9f) : (8'ha9))))) == ((&(((8'hb5) ? (8'ha1) : (8'h9c)) ? ((8'ha1) ? (8'hbe) : (7'h43)) : ((8'haf) << (8'hbe)))) ^~ (8'ha5))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire135;
  wire [(5'h14):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire84;
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg130 = (1'h0);
  reg [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  assign y = {wire135,
                 wire110,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire84,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
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
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
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
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  module5 #() modinst85 (wire84, clk, wire2, wire3, wire0, wire1);
  assign wire86 = $unsigned($signed((((wire3 && wire0) ?
                          (wire84 <= wire0) : wire1[(4'hc):(4'h9)]) ?
                      (!wire4) : (wire0 ? {wire84} : $signed(wire84)))));
  assign wire87 = $signed(wire1);
  assign wire88 = $signed((!wire3[(3'h6):(3'h5)]));
  assign wire89 = ((|(wire2[(2'h2):(1'h0)] == $signed(wire2[(2'h3):(1'h0)]))) - ({($unsigned(wire87) ?
                          wire4 : wire86[(1'h0):(1'h0)]),
                      $signed((wire88 || (8'ha4)))} && wire86));
  always
    @(posedge clk) begin
      reg90 <= ((7'h41) == wire88);
      reg91 <= $signed(wire4);
      if (wire2[(3'h5):(3'h5)])
        begin
          reg92 <= ($signed($unsigned(wire0[(5'h14):(4'ha)])) * ($signed($signed((wire0 ?
              wire3 : (8'hb4)))) >> wire88[(3'h7):(3'h5)]));
          reg93 <= ((wire84 <<< ($signed({reg90, reg90}) || $unsigned((reg91 ?
              (7'h41) : reg91)))) ^ (&(8'hab)));
          reg94 <= wire1[(1'h1):(1'h1)];
          reg95 <= wire87[(3'h4):(2'h3)];
        end
      else
        begin
          reg92 <= reg92;
        end
      if ($signed(wire84[(3'h6):(3'h4)]))
        begin
          if ((({(wire1[(3'h7):(3'h6)] ?
                          (wire0 ? wire84 : (8'ha6)) : wire1[(1'h1):(1'h1)])} ?
                  wire0[(2'h3):(1'h0)] : (~^(8'h9d))) ?
              reg93[(3'h4):(3'h4)] : ({reg94,
                  wire2[(4'ha):(4'h9)]} != (((wire3 ? wire0 : wire3) ?
                  $signed(reg94) : ((8'hbe) == wire88)) ^~ (!{(8'h9e),
                  (8'hb0)})))))
            begin
              reg96 <= (wire88[(3'h7):(1'h0)] ?
                  (~(&{(~|wire89)})) : $signed((^~((wire87 ? (8'hb5) : wire89) ?
                      wire86[(1'h0):(1'h0)] : wire4[(3'h5):(1'h0)]))));
              reg97 <= reg93;
              reg98 <= (8'ha8);
            end
          else
            begin
              reg96 <= $unsigned(reg95);
              reg97 <= wire87[(3'h6):(3'h5)];
              reg98 <= $unsigned(reg96[(3'h7):(2'h3)]);
            end
          if ((wire88[(2'h2):(1'h1)] <<< ($signed($signed((reg94 ^~ (8'ha5)))) <= (+((^~wire1) <= $unsigned((8'ha5)))))))
            begin
              reg99 <= (wire84 <= (wire0[(5'h14):(4'ha)] ?
                  (reg95[(1'h0):(1'h0)] ?
                      wire89[(4'ha):(3'h5)] : $signed({reg98})) : reg98));
              reg100 <= wire87;
              reg101 <= $signed({reg93[(3'h7):(3'h4)],
                  (wire86 ? wire1 : ((wire1 ^ reg97) >> wire3))});
              reg102 <= {wire89};
            end
          else
            begin
              reg99 <= $signed((^~($unsigned(wire0) ?
                  $signed(reg97[(1'h0):(1'h0)]) : ((wire89 ? wire2 : reg98) ?
                      (+reg99) : wire89))));
            end
          if ((^wire0))
            begin
              reg103 <= $unsigned(($unsigned(reg100) >> (~|reg101)));
            end
          else
            begin
              reg103 <= (-reg96);
              reg104 <= reg102;
              reg105 <= $signed($signed(($signed(wire87[(4'h8):(1'h1)]) << ((8'ha0) ?
                  (^~reg100) : (reg90 ? reg91 : reg98)))));
              reg106 <= $signed($signed(({reg90,
                  $signed(wire86)} * (reg100 - (wire86 | reg96)))));
              reg107 <= $unsigned((|{(~&reg94)}));
            end
          reg108 <= reg91;
        end
      else
        begin
          reg96 <= (8'h9e);
        end
      reg109 <= $unsigned(((8'ha1) == (($signed(reg106) >= (reg94 ?
          wire1 : reg107)) >> (reg93 << reg101[(2'h3):(1'h1)]))));
    end
  assign wire110 = reg97;
  always
    @(posedge clk) begin
      if (((((-(reg108 << wire84)) ?
              (((8'hb1) ? wire4 : reg103) ?
                  (-wire89) : wire2[(4'h9):(2'h2)]) : reg109[(2'h2):(1'h1)]) ?
          $signed(wire89[(2'h2):(1'h1)]) : $unsigned(($unsigned((8'hb7)) ?
              (~&reg92) : (8'hab)))) ~^ wire84))
        begin
          reg111 <= $signed((|(!(|(reg94 - reg97)))));
          reg112 <= $signed({(reg108[(5'h11):(5'h11)] + (reg97 || (~wire89)))});
          reg113 <= (reg106[(2'h3):(1'h1)] ?
              reg101 : (($signed(reg102) ~^ $unsigned((reg91 == (8'hb1)))) >>> ((^$unsigned((8'hbf))) <= reg94)));
          if ($unsigned({$unsigned(reg104)}))
            begin
              reg114 <= (|wire0);
              reg115 <= ($signed(reg91) ~^ $signed(wire87));
              reg116 <= (($unsigned(((wire88 && wire3) && ((8'had) ?
                  reg115 : reg99))) & (!$unsigned((&wire87)))) << $signed(reg100));
              reg117 <= reg96[(3'h4):(3'h4)];
            end
          else
            begin
              reg114 <= wire1;
              reg115 <= ((8'hbd) + (wire2[(4'h8):(1'h1)] & ($signed(wire3[(2'h3):(1'h1)]) ?
                  reg103 : $signed(((8'hb5) >> reg105)))));
            end
          if ($signed($signed($unsigned((reg108 ? reg90 : (reg102 - reg101))))))
            begin
              reg118 <= reg99[(2'h3):(1'h1)];
              reg119 <= reg95;
              reg120 <= reg113[(2'h2):(1'h0)];
              reg121 <= wire87[(3'h7):(1'h1)];
            end
          else
            begin
              reg118 <= (!reg116[(2'h3):(2'h3)]);
              reg119 <= (reg115[(2'h2):(1'h0)] ?
                  {($signed({reg104}) == (~&{reg103}))} : ((wire87[(1'h0):(1'h0)] ?
                      ((&reg96) ?
                          reg98 : (wire2 >= (8'hb1))) : (^$signed(reg120))) * (^(reg106 ?
                      (&reg120) : $signed(reg106)))));
              reg120 <= $unsigned((+reg94));
            end
        end
      else
        begin
          reg111 <= ((|(8'hb9)) ? wire89 : (8'hba));
          reg112 <= ({$unsigned(($unsigned((8'h9d)) ~^ reg96))} ^ (^reg98[(3'h5):(3'h4)]));
          if ($unsigned(reg107))
            begin
              reg113 <= wire86[(1'h0):(1'h0)];
              reg114 <= {(~&$signed((8'ha0))),
                  $unsigned($unsigned(($signed((8'ha0)) | $unsigned(reg107))))};
              reg115 <= ((&(((wire2 ? reg90 : wire88) | (-reg118)) ?
                      $unsigned(reg96) : $unsigned(reg116))) ?
                  reg117 : wire4[(5'h10):(4'hb)]);
              reg116 <= {$signed((reg107 ?
                      wire3 : ($signed(reg107) > (8'h9f)))),
                  ((((^reg107) | reg100) ?
                          {(reg121 >>> reg98)} : {$unsigned(reg100)}) ?
                      ((!(+wire88)) > wire84[(2'h2):(1'h0)]) : reg109)};
              reg117 <= ((~|(!reg94)) << reg98);
            end
          else
            begin
              reg113 <= reg96[(1'h0):(1'h0)];
            end
        end
      if ((reg105 >= (~({$unsigned(reg117), $signed(reg102)} ?
          reg98 : ((wire0 <<< wire3) - (8'ha1))))))
        begin
          reg122 <= $signed(wire86);
          reg123 <= $signed((reg112 ? reg102 : {wire88[(1'h1):(1'h1)]}));
          reg124 <= $signed(reg113[(2'h2):(1'h0)]);
        end
      else
        begin
          reg122 <= $signed(reg114);
          reg123 <= (&reg117[(3'h6):(3'h4)]);
          if ((((~(8'hbe)) * ($signed({reg92, reg92}) ?
              $signed((&wire0)) : reg94)) >= ((reg92[(4'h8):(3'h5)] ~^ {{reg104}}) ^~ reg115)))
            begin
              reg124 <= $signed((reg92 < $unsigned({$unsigned(wire89),
                  $signed(reg112)})));
              reg125 <= (((~{reg95}) ?
                  $signed((wire2 | reg115)) : {(|(^wire1)),
                      $unsigned(reg113)}) && reg119[(1'h0):(1'h0)]);
              reg126 <= reg108[(3'h4):(1'h0)];
              reg127 <= ($signed($signed((&(~wire2)))) | reg124);
            end
          else
            begin
              reg124 <= wire0[(5'h12):(4'hf)];
              reg125 <= ((8'haf) ?
                  $unsigned(reg102[(2'h2):(1'h1)]) : {(+reg91)});
            end
          if (reg120[(5'h10):(2'h3)])
            begin
              reg128 <= $unsigned(((^~reg98) ?
                  ((&(reg94 > wire87)) ?
                      (~(~wire0)) : ($unsigned(reg95) ?
                          {wire3} : (reg91 ?
                              (7'h44) : (8'hbc)))) : reg98[(3'h6):(1'h0)]));
              reg129 <= (!wire84);
            end
          else
            begin
              reg128 <= reg125;
              reg129 <= wire87;
              reg130 <= ({reg116[(4'h9):(3'h5)],
                      (reg111[(2'h3):(2'h3)] >> {wire4})} ?
                  $signed(($signed(reg125) ^ (!$signed(reg96)))) : reg121);
              reg131 <= $unsigned((!{$unsigned(reg101[(4'hc):(3'h6)])}));
              reg132 <= $unsigned((~$signed(($unsigned(reg108) >= reg92))));
            end
        end
      reg133 <= $signed(((wire87[(4'h8):(1'h1)] >> ($signed(reg130) ?
              (reg92 ? reg101 : (8'hb9)) : $unsigned(reg108))) ?
          $unsigned((^$unsigned((8'ha1)))) : ((((8'hbf) == reg95) >> $unsigned(reg120)) ?
              (!(reg109 ? reg101 : (8'ha2))) : {wire1})));
      reg134 <= $signed(reg90[(2'h3):(1'h0)]);
    end
  assign wire135 = (reg121 ?
                       wire88[(3'h5):(1'h1)] : ((8'hbb) << ((^$unsigned(reg130)) ?
                           (^wire110[(3'h5):(1'h1)]) : (~^(+reg128)))));
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire6;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(2'h2):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire41;
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  assign y = {wire82,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire10,
                 wire11,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire41,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire10 = (-wire9[(3'h6):(1'h1)]);
  assign wire11 = (((~^wire8[(1'h1):(1'h1)]) ^ wire7[(2'h2):(1'h0)]) ?
                      (wire10 ^~ ((~&(wire7 ~^ wire8)) <<< (8'h9c))) : $unsigned((~|$signed(wire9))));
  always
    @(posedge clk) begin
      reg12 <= (($unsigned(wire8) << wire9) ?
          ($signed($signed((~^wire6))) - ((~|$signed((8'hae))) || ($signed(wire7) >> wire10))) : wire6[(1'h0):(1'h0)]);
      reg13 <= ($signed(($unsigned(wire10) ?
              $unsigned($unsigned(wire11)) : (reg12[(5'h10):(4'ha)] ?
                  $unsigned(wire10) : (~^(8'h9d))))) ?
          (wire8[(1'h0):(1'h0)] ?
              {((wire6 <<< (8'ha6)) ? {wire10} : $signed((8'ha2))),
                  (|wire6[(1'h0):(1'h0)])} : ((~&$signed(wire11)) != wire6[(1'h1):(1'h0)])) : $unsigned(((~^(wire10 || wire6)) ?
              $unsigned({(7'h42), wire6}) : ((wire6 ? wire6 : wire10) ?
                  (wire7 - reg12) : wire9[(2'h3):(1'h1)]))));
      reg14 <= $signed(wire10[(4'ha):(2'h2)]);
      reg15 <= ($signed(wire8) ^~ wire10);
    end
  assign wire16 = $unsigned($unsigned(({$signed(reg14)} <= wire11)));
  assign wire17 = wire6[(1'h0):(1'h0)];
  assign wire18 = wire6;
  assign wire19 = $signed($unsigned($signed(wire7[(2'h2):(2'h2)])));
  assign wire20 = ((~^$signed((|reg15[(3'h4):(2'h3)]))) <<< $signed((wire8 ^ ((wire9 <= reg14) != $signed(wire18)))));
  assign wire21 = ($unsigned($signed((wire17 ?
                      $unsigned((7'h44)) : $unsigned(wire19)))) && {$signed(((^reg14) <= (8'hb9)))});
  module22 #() modinst42 (wire41, clk, wire9, wire16, wire8, reg15);
  assign wire43 = wire10[(5'h11):(4'hd)];
  assign wire44 = wire8;
  assign wire45 = (~$unsigned(($signed({reg12, wire18}) ?
                      $unsigned(wire9[(3'h6):(3'h4)]) : wire7)));
  assign wire46 = $signed($unsigned((+wire45[(3'h4):(2'h3)])));
  assign wire47 = wire8;
  assign wire48 = $signed((!$signed((8'hbe))));
  assign wire49 = $signed((~|(~^reg14)));
  assign wire50 = (!$signed(wire41[(5'h10):(2'h3)]));
  module51 #() modinst83 (wire82, clk, wire18, wire50, wire7, wire8);
endmodule

module module51
#(parameter param81 = (((({(8'h9e), (8'hbe)} >= ((7'h44) | (8'h9c))) >= (((8'ha6) ^ (8'hb7)) >>> ((7'h42) ? (8'hbb) : (8'ha4)))) & ((|((8'hb5) ? (8'hae) : (7'h44))) <<< {(^(7'h41)), ((8'hbb) ? (8'had) : (8'hb2))})) ? (7'h40) : {(~(!((8'ha2) & (8'hab))))}))
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire55;
  input wire [(5'h11):(1'h0)] wire54;
  input wire [(2'h2):(1'h0)] wire53;
  input wire signed [(5'h14):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
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
                 reg60,
                 (1'h0)};
  assign wire56 = ({wire52[(4'h8):(2'h2)]} ?
                      $signed((wire54[(3'h7):(2'h3)] ?
                          wire53[(1'h0):(1'h0)] : $unsigned(wire53))) : ($signed(wire52) ?
                          ($unsigned($signed(wire52)) ?
                              wire55 : (8'hb8)) : (((|wire53) & (wire52 << wire52)) & {wire54})));
  assign wire57 = ((^~(($unsigned(wire55) ?
                          $signed(wire53) : wire55) * (wire52[(3'h4):(1'h0)] ?
                          (wire53 ? wire55 : wire53) : $signed(wire55)))) ?
                      (|(~$signed({wire54}))) : wire55[(4'hc):(4'ha)]);
  assign wire58 = $unsigned(wire56[(4'h8):(2'h2)]);
  assign wire59 = {$unsigned(wire52), wire53};
  always
    @(posedge clk) begin
      reg60 <= wire59[(2'h3):(1'h1)];
      reg61 <= (~|($unsigned(((&wire58) ?
          ((8'ha0) & wire58) : $signed(wire59))) >> {wire58}));
      reg62 <= (reg61 || ((&wire58[(3'h7):(2'h3)]) ?
          $signed($unsigned(wire52[(5'h11):(1'h1)])) : {$unsigned($signed(wire54))}));
      reg63 <= {(&$signed((wire56 ? $signed((8'haf)) : (+wire57))))};
      if ((&(~^($signed(reg61) << (wire52 < {wire59, reg63})))))
        begin
          reg64 <= (8'hb0);
        end
      else
        begin
          reg64 <= (&$signed((~^(wire52 - wire59[(2'h2):(1'h1)]))));
          if (($unsigned($signed(($unsigned((8'hb4)) ?
              (wire53 & reg62) : reg60[(4'hc):(4'h8)]))) ^ (!(wire52 >> $unsigned((reg61 > wire56))))))
            begin
              reg65 <= reg62;
              reg66 <= $unsigned(wire53);
            end
          else
            begin
              reg65 <= reg64;
              reg66 <= reg62[(3'h6):(1'h0)];
              reg67 <= $signed((reg62 ?
                  wire58[(3'h6):(2'h2)] : reg64[(3'h7):(2'h3)]));
            end
          reg68 <= reg63;
          if ($unsigned((-($signed(reg64[(4'he):(4'h9)]) ?
              reg63[(2'h3):(2'h3)] : $signed({reg61, wire53})))))
            begin
              reg69 <= reg67;
              reg70 <= wire58;
              reg71 <= ((&{($signed(wire52) != (~|reg62)),
                      reg68[(1'h1):(1'h1)]}) ?
                  wire55 : $signed(($signed((wire59 ?
                      (8'ha6) : (8'hac))) >> (^~$unsigned(reg62)))));
              reg72 <= {($signed($unsigned((8'hbb))) * $signed($unsigned($unsigned(reg67)))),
                  (^($signed($unsigned((8'ha5))) == wire53))};
            end
          else
            begin
              reg69 <= {$unsigned($unsigned($unsigned((wire55 < reg63))))};
              reg70 <= (~&(8'hb7));
              reg71 <= $unsigned(((reg71[(4'ha):(2'h3)] ?
                      $unsigned($signed(reg63)) : $signed($unsigned(reg72))) ?
                  $signed(reg70) : (($signed(wire58) ?
                      wire55[(4'ha):(3'h6)] : $signed(wire59)) >= {(reg60 ?
                          reg69 : reg60)})));
              reg72 <= (^reg66);
              reg73 <= $unsigned($signed((reg72 != ((+(8'hb5)) >>> (reg62 <<< reg67)))));
            end
          reg74 <= $unsigned(wire58);
        end
    end
  always
    @(posedge clk) begin
      if ((reg63[(4'ha):(3'h4)] <= ((reg74[(3'h4):(2'h3)] || wire52[(1'h1):(1'h1)]) ?
          (reg69 ?
              {((7'h43) ? reg66 : reg69),
                  $signed(reg61)} : reg66[(3'h4):(1'h0)]) : $unsigned(wire59[(2'h2):(1'h0)]))))
        begin
          reg75 <= (&($unsigned((^reg69[(2'h2):(1'h1)])) | reg63));
          reg76 <= ((reg70[(1'h1):(1'h0)] ?
              ($unsigned((reg69 << reg74)) ?
                  ((reg67 ? wire53 : reg72) ?
                      wire58 : $signed(wire58)) : reg72) : $unsigned($signed(reg66))) > (&(!reg64)));
        end
      else
        begin
          reg75 <= (7'h41);
        end
      reg77 <= reg63;
      reg78 <= ($unsigned(reg77) & (~&(|{reg66, wire54})));
      reg79 <= (wire53[(1'h1):(1'h0)] ?
          ((+reg76) | wire52[(3'h5):(1'h0)]) : wire54);
      reg80 <= {(8'h9f),
          ({reg74[(3'h4):(2'h3)]} ? (~&reg74) : $signed(reg61[(2'h2):(2'h2)]))};
    end
endmodule

module module22
#(parameter param40 = (|(~^{{{(8'ha5), (7'h40)}}, {(~(7'h44)), ((8'hb6) ? (8'hb3) : (8'ha6))}})))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire26;
  input wire signed [(5'h11):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire27;
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 reg33,
                 reg29,
                 (1'h0)};
  assign wire27 = $unsigned((~wire26));
  assign wire28 = ((((^~wire26) ? (~wire26) : $signed($signed(wire27))) ?
                          wire27[(2'h2):(2'h2)] : $unsigned((-(~wire27)))) ?
                      {(({wire24} ? wire26[(1'h1):(1'h0)] : $signed(wire23)) ?
                              {$signed(wire25)} : $unsigned(wire26[(4'h8):(2'h3)]))} : (~&$signed(($unsigned(wire27) ?
                          wire27[(2'h2):(1'h0)] : (-wire23)))));
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire27)))
        begin
          reg29 <= $signed((($unsigned((8'h9f)) ?
                  wire23 : $unsigned({wire28, wire27})) ?
              $unsigned($unsigned($signed(wire24))) : wire23[(1'h1):(1'h1)]));
        end
      else
        begin
          reg29 <= $signed(wire28[(4'hd):(4'h9)]);
        end
    end
  assign wire30 = $signed(reg29[(4'h9):(2'h3)]);
  assign wire31 = $signed($signed(wire24[(4'hb):(3'h4)]));
  assign wire32 = wire27;
  always
    @(posedge clk) begin
      reg33 <= wire26[(1'h1):(1'h1)];
    end
  assign wire34 = {wire25[(3'h4):(2'h2)], wire24};
  assign wire35 = ($signed((wire27 ?
                      (wire28 ?
                          (wire24 ?
                              wire25 : wire27) : wire28) : wire34[(1'h1):(1'h1)])) && wire26[(1'h0):(1'h0)]);
  assign wire36 = ((reg33 ?
                      $unsigned((-(^wire31))) : (wire30 >>> reg29)) | {wire23[(3'h6):(1'h0)]});
  assign wire37 = wire27[(1'h1):(1'h0)];
  assign wire38 = (~($unsigned(reg33) ?
                      $signed(wire35) : ((wire32 != $signed(wire25)) <= reg33)));
  assign wire39 = (^~{$unsigned((^~(!wire34))), wire31[(4'ha):(1'h1)]});
endmodule
