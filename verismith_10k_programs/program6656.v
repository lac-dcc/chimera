module top
#(parameter param175 = ({(|(((8'had) & (8'haf)) && ((8'hb0) >>> (8'hb3))))} >>> ({{(~^(8'ha6)), ((8'hb9) & (7'h44))}} >>> (({(8'hb0)} ? (!(8'haa)) : ((8'hb5) == (7'h44))) ? (^~((8'hb2) ? (8'hb7) : (8'h9e))) : (~(~|(8'hb2)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire174;
  wire [(2'h2):(1'h0)] wire171;
  wire [(4'h8):(1'h0)] wire170;
  wire signed [(2'h3):(1'h0)] wire169;
  wire signed [(5'h13):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire167;
  reg signed [(4'h8):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  assign y = {wire174,
                 wire171,
                 wire170,
                 wire169,
                 wire110,
                 wire80,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire4,
                 wire167,
                 reg173,
                 reg172,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 (1'h0)};
  assign wire4 = $unsigned(($signed($signed((~|wire0))) >>> $unsigned(wire3[(1'h1):(1'h1)])));
  module5 #() modinst70 (.clk(clk), .y(wire69), .wire7(wire0), .wire6(wire4), .wire9(wire2), .wire8(wire3));
  assign wire71 = wire69;
  assign wire72 = (wire1 ?
                      wire0[(2'h2):(2'h2)] : $signed((~|(~&$unsigned(wire4)))));
  assign wire73 = (|(($unsigned(wire0) << $signed((&wire3))) ?
                      $unsigned($unsigned((wire71 ?
                          wire69 : wire71))) : (~|(|$signed(wire71)))));
  assign wire74 = ((~($unsigned($unsigned((8'ha8))) ?
                          $unsigned((-(8'ha0))) : (((7'h43) ^ wire2) & $unsigned(wire4)))) ?
                      (|(wire73 > wire69)) : wire71[(2'h3):(1'h0)]);
  assign wire75 = (|({$unsigned((wire71 && (7'h40)))} ?
                      ((8'h9c) ?
                          wire69 : ((wire74 ^~ wire69) ?
                              ((8'ha7) ?
                                  wire3 : wire0) : (&(8'ha6)))) : (wire0 != (&$unsigned(wire3)))));
  always
    @(posedge clk) begin
      reg76 <= $unsigned(((wire3 * wire0) > {($unsigned(wire69) ?
              (wire74 ? wire0 : wire0) : (wire2 >= wire71))}));
      reg77 <= (-($unsigned($unsigned(wire2[(3'h5):(2'h2)])) > wire74[(1'h0):(1'h0)]));
      reg78 <= (8'hac);
      reg79 <= (&(wire0 ?
          wire74[(2'h3):(2'h2)] : (~&{$signed(wire3), {wire72, wire3}})));
    end
  assign wire80 = (~|$unsigned(wire2[(2'h3):(1'h0)]));
  module81 #() modinst111 (wire110, clk, wire69, wire71, wire2, wire75, wire80);
  module112 #() modinst168 (wire167, clk, wire110, wire73, wire71, reg78);
  assign wire169 = (|(wire110[(3'h6):(1'h0)] ?
                       wire75[(3'h7):(1'h1)] : wire1[(5'h12):(4'ha)]));
  assign wire170 = wire169;
  assign wire171 = (-$signed(wire170));
  always
    @(posedge clk) begin
      reg172 <= {($unsigned(wire2) ^ ((wire171[(1'h0):(1'h0)] & (|wire2)) * ($signed(wire73) * $unsigned(wire171)))),
          $signed(wire170)};
      reg173 <= (-$unsigned($unsigned(wire71)));
    end
  assign wire174 = wire74[(2'h3):(2'h3)];
endmodule

module module112  (y, clk, wire113, wire114, wire115, wire116);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire113;
  input wire signed [(4'ha):(1'h0)] wire114;
  input wire [(5'h12):(1'h0)] wire115;
  input wire signed [(5'h10):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire166;
  wire signed [(4'ha):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire164;
  wire [(2'h3):(1'h0)] wire163;
  wire [(3'h7):(1'h0)] wire162;
  wire [(5'h15):(1'h0)] wire161;
  wire [(3'h7):(1'h0)] wire159;
  wire signed [(5'h15):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire118;
  wire [(3'h4):(1'h0)] wire119;
  wire [(4'hb):(1'h0)] wire120;
  wire signed [(4'hc):(1'h0)] wire141;
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire159,
                 wire117,
                 wire118,
                 wire119,
                 wire120,
                 wire141,
                 (1'h0)};
  assign wire117 = {(!$unsigned(wire113[(5'h10):(3'h4)]))};
  assign wire118 = wire116;
  assign wire119 = ((((^wire113) >= $unsigned(wire115)) ?
                           (-(~{wire114,
                               wire113})) : $unsigned((wire115 == wire118))) ?
                       wire118 : (8'hbc));
  assign wire120 = {wire118};
  module121 #() modinst142 (wire141, clk, wire120, wire114, wire116, wire117, wire115);
  module143 #() modinst160 (wire159, clk, wire113, wire115, wire117, wire116);
  assign wire161 = wire120;
  assign wire162 = $signed((8'haa));
  assign wire163 = wire120[(3'h5):(1'h1)];
  assign wire164 = ({(~|({wire159} ?
                               wire119[(1'h1):(1'h0)] : $unsigned(wire115)))} ?
                       (wire163 ?
                           (8'ha3) : $signed((&(wire119 ?
                               wire120 : (8'hb6))))) : (!(({wire113} || $unsigned(wire113)) ?
                           ({wire116, wire113} ?
                               (wire117 ? (8'h9d) : wire141) : (wire159 ?
                                   wire141 : wire120)) : wire116[(4'ha):(3'h4)])));
  assign wire165 = ((|$signed((wire115 ?
                       {wire161,
                           wire114} : wire119[(2'h3):(1'h1)]))) >>> $signed(wire116[(1'h0):(1'h0)]));
  assign wire166 = wire162[(3'h5):(2'h3)];
endmodule

module module81
#(parameter param108 = (((8'hb5) ? {{((8'ha5) == (8'hb3))}, {{(8'haf), (8'hb8)}}} : ((((8'ha7) ? (8'hac) : (8'h9f)) >>> ((8'had) >>> (8'hbb))) ? ((~^(8'hb3)) || {(8'haf), (8'ha3)}) : ((~&(8'hb2)) ? {(8'hbb)} : ((8'ha3) ? (8'h9e) : (8'haa))))) ^~ (~(&(-(~&(8'hba)))))), 
parameter param109 = (param108 || (~^param108)))
(y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire86;
  input wire [(5'h11):(1'h0)] wire85;
  input wire signed [(5'h10):(1'h0)] wire84;
  input wire [(5'h12):(1'h0)] wire83;
  input wire signed [(5'h14):(1'h0)] wire82;
  wire signed [(4'hf):(1'h0)] wire107;
  wire signed [(5'h10):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire94;
  wire signed [(2'h2):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  wire [(4'hb):(1'h0)] wire87;
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire94,
                 wire89,
                 wire88,
                 wire87,
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
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire87 = $signed($signed(wire82[(5'h14):(1'h1)]));
  assign wire88 = (((wire83[(3'h5):(3'h5)] ?
                      $unsigned((8'hba)) : wire86) < (^wire85[(4'ha):(4'ha)])) - wire85[(4'hf):(4'hf)]);
  assign wire89 = wire84[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg90 <= wire82;
      reg91 <= (wire82 ?
          (+(wire88 ?
              (reg90 ? $signed(wire82) : $signed(wire83)) : wire86)) : wire85);
      reg92 <= wire88;
      reg93 <= (wire89 << (8'hb4));
    end
  assign wire94 = (!{$signed({(~wire86)}),
                      {$unsigned($unsigned(wire89)), (~|((8'hae) >> reg90))}});
  always
    @(posedge clk) begin
      if ({$unsigned({(~|(wire84 & wire94)), wire84[(1'h1):(1'h0)]}),
          $signed(wire89[(2'h2):(1'h0)])})
        begin
          reg95 <= reg93;
          reg96 <= {((reg90 + (wire86[(4'h9):(3'h4)] && (wire89 < wire87))) ?
                  reg95[(3'h7):(3'h5)] : wire94[(5'h10):(4'hc)])};
          reg97 <= (|{$unsigned($unsigned(wire89[(1'h1):(1'h0)])),
              $signed($unsigned(reg90))});
          if (((+(+$signed($unsigned(wire89)))) - $signed($signed(reg92[(3'h7):(1'h1)]))))
            begin
              reg98 <= reg92[(3'h5):(3'h5)];
              reg99 <= reg91[(1'h1):(1'h1)];
              reg100 <= reg95;
            end
          else
            begin
              reg98 <= (8'hba);
              reg99 <= (+($unsigned($signed(wire88)) ?
                  wire88[(3'h7):(1'h0)] : $unsigned(reg93)));
            end
          if ($unsigned(((^$unsigned((wire82 ? reg93 : reg91))) ?
              ((((8'ha6) ? wire83 : wire85) && wire84[(4'he):(3'h5)]) ?
                  ({wire84, wire88} ?
                      (^wire83) : wire86[(2'h3):(2'h2)]) : (~wire82)) : (&$signed((reg97 ?
                  reg99 : reg93))))))
            begin
              reg101 <= (^~$signed($unsigned((|(&reg90)))));
              reg102 <= (wire94[(1'h1):(1'h1)] ?
                  wire83[(4'hd):(3'h7)] : wire89[(1'h1):(1'h0)]);
            end
          else
            begin
              reg101 <= ($signed($unsigned($signed(wire85[(4'h8):(2'h2)]))) + ($unsigned(($unsigned(wire87) ?
                  wire88 : (reg91 ? wire88 : wire94))) && ({(reg102 || wire85),
                  $unsigned(reg91)} > wire84[(4'he):(2'h3)])));
              reg102 <= (7'h43);
              reg103 <= $unsigned($unsigned((reg98[(2'h2):(1'h1)] | wire87[(4'hb):(2'h3)])));
              reg104 <= ($unsigned((8'hbc)) ^ $signed($unsigned({{reg95, reg91},
                  reg96})));
              reg105 <= (reg103[(3'h5):(2'h3)] == wire94);
            end
        end
      else
        begin
          if (reg99[(1'h1):(1'h1)])
            begin
              reg95 <= reg91;
            end
          else
            begin
              reg95 <= (((-$unsigned(((8'had) ? reg102 : reg100))) ?
                      wire85[(2'h2):(1'h1)] : $unsigned($signed(reg91[(2'h3):(2'h3)]))) ?
                  ($unsigned($signed({reg95})) ?
                      {$signed($unsigned(reg93)),
                          (^reg99)} : $signed({$signed(reg96)})) : (({(reg92 ^ reg93)} ?
                          ($signed(wire89) <= wire89[(1'h1):(1'h0)]) : (reg90[(4'hb):(4'hb)] ?
                              (reg98 ? reg95 : (8'hbc)) : $unsigned(reg91))) ?
                      reg105[(3'h4):(1'h0)] : wire87[(1'h0):(1'h0)]));
              reg96 <= (((wire86 ?
                      ($signed(reg96) & ((8'hb1) ?
                          (7'h41) : reg92)) : ($signed(reg95) ?
                          (reg93 <<< (8'hb1)) : wire87[(4'hb):(3'h6)])) != $signed(reg99)) ?
                  (|(!$unsigned((wire86 ?
                      reg105 : wire87)))) : {{(wire94 & (~|reg92)),
                          $signed(wire94)}});
              reg97 <= $unsigned(($unsigned((reg93[(1'h1):(1'h1)] ?
                      wire83 : (reg101 | wire84))) ?
                  (~(reg91[(3'h4):(1'h1)] ?
                      $signed((8'ha4)) : (&reg104))) : $unsigned(($signed((8'hb6)) ?
                      reg98[(1'h1):(1'h0)] : wire89))));
            end
          reg98 <= (|wire83);
          reg99 <= (($unsigned((reg91[(3'h5):(3'h5)] >> reg102[(1'h1):(1'h0)])) > $signed(wire88[(4'h8):(4'h8)])) << ($signed((reg95[(5'h14):(5'h12)] ?
                  wire85[(3'h4):(1'h0)] : (wire89 << reg93))) ?
              (~^(reg96 ?
                  $unsigned(wire94) : $unsigned(wire88))) : (^$signed((wire85 < (8'hbe))))));
        end
    end
  assign wire106 = wire86[(1'h0):(1'h0)];
  assign wire107 = reg91[(1'h0):(1'h0)];
endmodule

module module5
#(parameter param67 = (!(-(&({(7'h40), (7'h43)} << ((8'ha5) ? (7'h43) : (8'hb7)))))), 
parameter param68 = (8'h9e))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire65;
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  assign y = {wire33,
                 wire21,
                 wire12,
                 wire11,
                 wire10,
                 wire35,
                 wire36,
                 wire48,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire65,
                 reg49,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  assign wire10 = wire8;
  assign wire11 = wire7[(4'hc):(3'h4)];
  assign wire12 = wire8;
  always
    @(posedge clk) begin
      if (wire8)
        begin
          if ($unsigned($unsigned($unsigned($signed((&wire9))))))
            begin
              reg13 <= (wire8 ?
                  (&$unsigned(wire8)) : $signed((((-wire10) & (~(8'hb0))) ?
                      $signed((wire8 ?
                          wire6 : (8'h9e))) : (&$signed(wire12)))));
              reg14 <= wire10;
              reg15 <= $signed((&($signed($signed(wire11)) ?
                  ((|wire12) ?
                      {reg14} : $signed(reg14)) : ((|wire11) & (^~wire11)))));
            end
          else
            begin
              reg13 <= (($signed($unsigned((wire11 ?
                      wire11 : reg15))) > $signed($signed((~^wire10)))) ?
                  wire9 : $unsigned(reg13));
            end
          reg16 <= (~^$unsigned($unsigned((8'hb8))));
          reg17 <= wire9[(4'ha):(4'h9)];
        end
      else
        begin
          reg13 <= (($signed($unsigned($signed(wire9))) ?
              wire7 : $signed((&wire11))) > $unsigned($unsigned($unsigned((&wire10)))));
          if ($unsigned((&$unsigned(({(8'hb2)} > $unsigned((8'hbd)))))))
            begin
              reg14 <= $unsigned((~($signed((wire8 * reg14)) ^~ (~&(8'hb6)))));
            end
          else
            begin
              reg14 <= wire9;
            end
          reg15 <= wire8;
        end
      reg18 <= reg17;
      reg19 <= ($signed($unsigned(reg15[(4'hf):(4'hd)])) ?
          (((reg18[(1'h0):(1'h0)] != wire11) ?
                  {(!reg18)} : ((^reg15) ? {wire6} : reg17)) ?
              wire12[(2'h3):(1'h0)] : $unsigned((^(reg13 ^~ wire10)))) : (wire9 == {$signed((!reg13)),
              ((&reg13) >> (8'ha7))}));
      reg20 <= $signed((8'hb5));
    end
  assign wire21 = {$unsigned(reg16)};
  module22 #() modinst34 (wire33, clk, wire9, wire12, wire6, reg14);
  assign wire35 = ((|$signed(wire9)) ?
                      $signed({$signed((wire9 || reg20))}) : wire21[(3'h5):(2'h3)]);
  assign wire36 = ($unsigned(((8'h9e) ?
                      $signed((wire11 ?
                          reg19 : reg20)) : $signed(wire10))) | reg16);
  always
    @(posedge clk) begin
      if (((~&(wire8[(1'h0):(1'h0)] ?
              $unsigned((wire36 ? reg16 : wire10)) : wire36[(3'h6):(3'h5)])) ?
          ($unsigned((~&(reg13 > wire21))) >= ((&$unsigned(reg17)) | ((wire12 && wire8) ?
              wire36 : (^wire12)))) : (((^reg19) ?
                  (~^(wire10 ? wire6 : reg14)) : wire11) ?
              (~|wire10[(2'h2):(1'h0)]) : {reg13[(1'h1):(1'h1)]})))
        begin
          reg37 <= $unsigned(wire12[(3'h6):(2'h2)]);
          reg38 <= {((8'hbb) || ({(&wire33)} ?
                  $signed(wire6[(3'h7):(3'h6)]) : $unsigned((wire35 ?
                      wire36 : wire6))))};
          if ((($unsigned({(&reg18)}) ?
              {{((8'hae) ? reg14 : wire35)},
                  $signed((wire11 >= wire33))} : (reg19 >>> (^~(8'hbd)))) + (^~reg15)))
            begin
              reg39 <= (~^((~|((reg18 || wire8) ?
                      $signed(reg14) : $signed(reg37))) ?
                  reg17[(1'h1):(1'h0)] : wire11));
              reg40 <= reg16[(1'h1):(1'h0)];
              reg41 <= (-(|$unsigned((|$signed(wire11)))));
            end
          else
            begin
              reg39 <= (~^($signed({$signed((8'hbe)), (+reg15)}) ?
                  (8'hb8) : wire9));
              reg40 <= reg39[(3'h6):(1'h1)];
              reg41 <= (reg20 & ($signed((wire8[(1'h0):(1'h0)] >= $signed((8'hb6)))) ?
                  $unsigned((!(reg39 < wire12))) : $signed(reg17[(3'h4):(2'h2)])));
              reg42 <= wire36;
            end
          reg43 <= {reg40, {((~$signed(reg14)) && wire9)}};
          reg44 <= $signed(reg42);
        end
      else
        begin
          reg37 <= $unsigned(wire21);
        end
      reg45 <= {(!wire7)};
      reg46 <= reg13[(3'h4):(1'h0)];
      reg47 <= $unsigned(wire21);
    end
  assign wire48 = $signed(wire8);
  always
    @(posedge clk) begin
      reg49 <= $unsigned($signed(reg42));
    end
  assign wire50 = $signed({reg46[(1'h0):(1'h0)],
                      ((8'ha0) & wire12[(4'hb):(1'h0)])});
  assign wire51 = wire48[(1'h1):(1'h0)];
  assign wire52 = $unsigned($signed($signed(reg41)));
  assign wire53 = $signed((~^((((8'hb4) + wire33) ?
                          $signed(wire50) : (reg38 ? (8'ha2) : wire6)) ?
                      $signed($unsigned((8'hb3))) : $unsigned(reg17[(5'h10):(4'hc)]))));
  module54 #() modinst66 (.wire59(reg44), .wire58(reg38), .y(wire65), .wire55(wire48), .clk(clk), .wire56(reg41), .wire57(reg49));
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire59;
  input wire [(5'h13):(1'h0)] wire58;
  input wire signed [(3'h6):(1'h0)] wire57;
  input wire signed [(4'hf):(1'h0)] wire56;
  input wire [(3'h4):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  assign y = {wire64, wire63, wire62, wire61, wire60, (1'h0)};
  assign wire60 = (!$unsigned((^((wire57 ? wire59 : wire55) ~^ wire57))));
  assign wire61 = ($signed(wire56) + ((({wire58, wire60} >>> (8'hbf)) ?
                      $unsigned($signed((8'hb1))) : wire58) ~^ $unsigned(((|wire59) > wire59[(2'h3):(2'h2)]))));
  assign wire62 = (^~wire60);
  assign wire63 = wire62[(2'h2):(1'h1)];
  assign wire64 = $signed($unsigned($signed($unsigned($unsigned(wire62)))));
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire26;
  input wire [(3'h6):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire24;
  input wire [(5'h13):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  assign y = {wire32, wire31, wire30, wire28, wire27, reg29, (1'h0)};
  assign wire27 = (8'hbe);
  assign wire28 = wire26;
  always
    @(posedge clk) begin
      reg29 <= $unsigned($unsigned($unsigned($unsigned((wire28 << wire27)))));
    end
  assign wire30 = reg29;
  assign wire31 = wire28[(1'h0):(1'h0)];
  assign wire32 = wire25;
endmodule

module module143
#(parameter param157 = ((((&{(8'hbe), (8'hbb)}) >>> ((~&(8'hb1)) ? (|(8'hb7)) : ((8'haa) * (8'hbc)))) ? ((^~((8'hb0) && (8'hbb))) <<< (((8'ha6) ? (8'hb6) : (8'hac)) ? (~&(8'ha0)) : ((8'h9c) ? (8'ha7) : (8'h9c)))) : (!(((7'h43) <<< (8'hb2)) ? {(8'hb0)} : {(8'haa), (8'ha5)}))) * (~|({(&(8'ha2))} <<< (|((8'ha2) ? (8'haf) : (8'ha2)))))), 
parameter param158 = param157)
(y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire147;
  input wire [(4'hb):(1'h0)] wire146;
  input wire [(5'h15):(1'h0)] wire145;
  input wire signed [(3'h6):(1'h0)] wire144;
  wire [(4'hc):(1'h0)] wire156;
  wire signed [(5'h12):(1'h0)] wire155;
  wire signed [(2'h3):(1'h0)] wire154;
  wire [(4'hf):(1'h0)] wire153;
  wire [(3'h4):(1'h0)] wire152;
  wire signed [(4'h9):(1'h0)] wire151;
  wire signed [(4'hf):(1'h0)] wire150;
  wire [(5'h11):(1'h0)] wire149;
  wire signed [(3'h4):(1'h0)] wire148;
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 (1'h0)};
  assign wire148 = wire147;
  assign wire149 = (!$signed(wire146));
  assign wire150 = (((8'haf) ?
                           (wire149 ?
                               wire146[(3'h6):(3'h6)] : (~{(8'ha8)})) : $signed(wire148)) ?
                       {(7'h40)} : ((^~wire148[(3'h4):(2'h2)]) ?
                           ($unsigned((~wire148)) || {(~|wire148)}) : $unsigned($signed((^(8'h9e))))));
  assign wire151 = {$signed(((-(wire145 ?
                           wire150 : wire148)) < {$signed(wire144)})),
                       wire147[(4'hc):(4'h9)]};
  assign wire152 = wire151;
  assign wire153 = ($signed($unsigned($unsigned((wire151 - wire145)))) <= (wire148[(2'h2):(2'h2)] ?
                       (!((wire144 == wire147) ?
                           (wire148 + wire148) : (wire148 && wire152))) : wire149[(4'hf):(4'h9)]));
  assign wire154 = wire153[(3'h5):(2'h3)];
  assign wire155 = (~&$signed($signed($unsigned($signed(wire151)))));
  assign wire156 = wire144[(2'h2):(1'h0)];
endmodule

module module121  (y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire126;
  input wire [(4'ha):(1'h0)] wire125;
  input wire signed [(5'h10):(1'h0)] wire124;
  input wire [(4'h8):(1'h0)] wire123;
  input wire signed [(4'ha):(1'h0)] wire122;
  wire [(3'h5):(1'h0)] wire140;
  wire [(4'hf):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire138;
  reg [(5'h12):(1'h0)] reg137 = (1'h0);
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg127 <= wire122[(3'h6):(1'h1)];
      if ((((8'ha7) ?
          (wire124 | $signed(wire123[(4'h8):(3'h7)])) : $unsigned($unsigned($unsigned(wire125)))) - wire123))
        begin
          reg128 <= {$signed((8'h9e)), reg127[(3'h7):(3'h7)]};
          reg129 <= reg127;
          if (reg129[(3'h6):(1'h0)])
            begin
              reg130 <= (+reg129);
              reg131 <= wire122[(4'h8):(1'h0)];
              reg132 <= wire124[(1'h1):(1'h1)];
            end
          else
            begin
              reg130 <= (+reg128);
              reg131 <= reg128;
              reg132 <= {(+(reg132 ?
                      $unsigned((wire126 > reg129)) : reg127[(2'h3):(2'h3)])),
                  wire125};
              reg133 <= (wire122[(3'h7):(3'h5)] | (8'h9e));
            end
          reg134 <= ((-$signed(($signed(reg128) ?
              wire122[(1'h1):(1'h0)] : (wire125 ?
                  (8'h9f) : reg128)))) + $unsigned($signed((-$unsigned(reg129)))));
        end
      else
        begin
          reg128 <= ((&{{(reg132 <= (8'ha3))}, {(reg133 ? wire125 : reg128)}}) ?
              reg132 : reg134[(5'h12):(4'hf)]);
          if (wire124[(2'h2):(1'h1)])
            begin
              reg129 <= (((wire126 ?
                      {(reg134 ?
                              reg129 : reg133)} : $signed((^wire126))) & ((wire125 + (wire124 ^~ wire122)) ?
                      (reg127 ? reg133[(2'h2):(1'h0)] : reg130) : wire126)) ?
                  reg132[(3'h5):(2'h2)] : reg131);
              reg130 <= reg130;
              reg131 <= (^~wire122);
              reg132 <= ($unsigned(($unsigned((wire126 > (8'hb4))) >> (wire123[(3'h5):(2'h3)] ?
                  ((8'hbf) ? reg131 : reg127) : wire125))) < wire124);
              reg133 <= (($unsigned((~|wire126)) == {reg133[(2'h3):(1'h0)],
                  ($unsigned((8'hae)) & $unsigned(wire125))}) + (&(~|reg131[(4'h9):(1'h1)])));
            end
          else
            begin
              reg129 <= reg128;
              reg130 <= wire123[(3'h5):(1'h1)];
              reg131 <= reg132[(4'h8):(3'h4)];
              reg132 <= $unsigned((~((+$unsigned(reg134)) ?
                  (+$unsigned(reg133)) : $signed(wire122))));
            end
          reg134 <= $signed(wire123);
        end
      reg135 <= (wire126 ?
          $signed($signed({{reg130, reg130}, (!(8'hb0))})) : $signed((7'h40)));
      reg136 <= (8'hb6);
      reg137 <= reg135[(4'h9):(2'h3)];
    end
  assign wire138 = (~^(7'h41));
  assign wire139 = $signed(reg134);
  assign wire140 = (-$signed($signed((reg136[(4'ha):(3'h6)] <= {wire139}))));
endmodule
