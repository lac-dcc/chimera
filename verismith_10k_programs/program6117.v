module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire181;
  wire signed [(5'h15):(1'h0)] wire180;
  wire signed [(4'hc):(1'h0)] wire179;
  wire signed [(5'h14):(1'h0)] wire178;
  wire signed [(4'hb):(1'h0)] wire177;
  wire signed [(5'h14):(1'h0)] wire174;
  wire [(3'h5):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire105;
  wire [(5'h15):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire107;
  wire signed [(2'h3):(1'h0)] wire108;
  wire [(4'ha):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire172;
  reg signed [(2'h2):(1'h0)] reg176 = (1'h0);
  reg [(2'h3):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire174,
                 wire103,
                 wire29,
                 wire28,
                 wire26,
                 wire25,
                 wire23,
                 wire5,
                 wire4,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire109,
                 wire172,
                 reg176,
                 reg175,
                 reg27,
                 (1'h0)};
  assign wire4 = wire3[(4'h8):(1'h0)];
  assign wire5 = wire0;
  module6 #() modinst24 (.clk(clk), .y(wire23), .wire8(wire1), .wire10(wire3), .wire9(wire5), .wire7(wire0));
  assign wire25 = wire23[(2'h2):(1'h1)];
  assign wire26 = wire3;
  always
    @(posedge clk) begin
      reg27 <= wire23;
    end
  assign wire28 = reg27[(4'hb):(4'h9)];
  assign wire29 = (wire26 ^~ (^~$signed(wire0)));
  module30 #() modinst104 (wire103, clk, wire3, reg27, wire5, wire29);
  assign wire105 = reg27;
  assign wire106 = wire2;
  assign wire107 = ((^~wire5[(3'h7):(3'h4)]) ~^ ((($signed((8'h9f)) ?
                       (^wire28) : wire3) ~^ $signed($unsigned(wire29))) >> ((wire103 ^~ (wire25 && wire25)) ?
                       wire28 : wire1)));
  assign wire108 = $unsigned(((($unsigned(wire23) == ((8'ha1) ?
                           (7'h41) : wire29)) ?
                       $unsigned(wire103[(1'h0):(1'h0)]) : ((wire3 ^~ wire28) | wire0)) <<< $signed((wire23 <<< (wire2 ~^ wire0)))));
  assign wire109 = {((^(^{wire105})) ?
                           $unsigned((wire108 + wire2)) : wire108[(2'h3):(1'h1)])};
  module110 #() modinst173 (.wire111(wire106), .y(wire172), .wire113(wire105), .wire114(wire4), .clk(clk), .wire112(reg27));
  assign wire174 = {$unsigned(({$unsigned(wire26)} ? (-wire105) : wire4)),
                       wire105[(3'h6):(2'h3)]};
  always
    @(posedge clk) begin
      reg175 <= {$unsigned($unsigned($unsigned(((8'h9f) ~^ wire23))))};
      reg176 <= $unsigned((reg175[(1'h1):(1'h0)] - $unsigned($unsigned((wire106 ?
          wire0 : (8'ha0))))));
    end
  assign wire177 = $signed(wire4[(5'h12):(3'h6)]);
  assign wire178 = (((!wire172) ?
                       (!wire4[(3'h7):(2'h2)]) : ((^~wire1) ?
                           (+(~^(7'h41))) : (~$signed(wire25)))) && $unsigned(wire105));
  assign wire179 = $unsigned((+{$signed($unsigned(wire0))}));
  assign wire180 = (((8'hbe) * (wire105[(4'ha):(1'h0)] << ((wire28 ^~ wire178) >> wire107[(4'hd):(4'ha)]))) <= ((wire28[(1'h1):(1'h1)] | wire28[(2'h2):(2'h2)]) || $signed((-{(8'h9f),
                       (8'hb5)}))));
  assign wire181 = $unsigned($unsigned(reg175));
endmodule

module module110
#(parameter param170 = (((({(8'ha3), (8'h9f)} ? ((7'h43) ? (8'ha4) : (8'ha5)) : ((7'h40) >= (8'hae))) ? (((8'hb1) ~^ (8'ha9)) >> ((8'hbc) != (8'hbe))) : (((8'hac) == (8'hb3)) >>> ((8'had) ? (8'hb0) : (8'hae)))) >= (!((~|(8'h9e)) ^ ((8'hb7) > (7'h42))))) ^~ (((|{(8'hb3)}) ? (!((8'ha9) & (7'h42))) : {(~&(8'haa)), (~(8'hb3))}) ~^ (((&(8'hbf)) ? (|(8'hb1)) : (|(8'hbd))) + (((8'ha3) ? (8'h9d) : (8'ha2)) ? (&(8'ha4)) : ((8'ha9) ? (8'hae) : (8'hba)))))), 
parameter param171 = (-param170))
(y, clk, wire111, wire112, wire113, wire114);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire111;
  input wire signed [(5'h14):(1'h0)] wire112;
  input wire [(5'h14):(1'h0)] wire113;
  input wire signed [(5'h13):(1'h0)] wire114;
  wire signed [(3'h6):(1'h0)] wire165;
  wire signed [(4'hf):(1'h0)] wire164;
  wire signed [(5'h10):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire162;
  reg signed [(5'h12):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg167 = (1'h0);
  reg [(5'h11):(1'h0)] reg166 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire115,
                 wire162,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 (1'h0)};
  assign wire115 = $unsigned(wire113[(3'h4):(2'h2)]);
  module116 #() modinst163 (.y(wire162), .wire118(wire114), .wire119(wire115), .wire120(wire111), .wire121(wire112), .clk(clk), .wire117(wire113));
  assign wire164 = wire111[(1'h1):(1'h1)];
  assign wire165 = (wire112 ?
                       wire115 : ({((wire111 > (7'h44)) ?
                                   {(8'ha1)} : $signed((7'h42))),
                               $signed((wire111 <<< wire115))} ?
                           (((wire162 ? (8'ha6) : wire112) ?
                                   wire111[(1'h0):(1'h0)] : $signed((8'hac))) ?
                               wire112 : $unsigned(wire114)) : {wire111[(4'hf):(1'h1)],
                               wire111[(5'h13):(4'hb)]}));
  always
    @(posedge clk) begin
      reg166 <= wire113;
      reg167 <= (wire165[(1'h1):(1'h1)] * ((~^(~^wire111)) > $unsigned(wire111[(4'hc):(2'h3)])));
      reg168 <= wire162[(1'h1):(1'h1)];
      reg169 <= ((|$signed({wire162, (~wire111)})) - wire114);
    end
endmodule

module module30
#(parameter param101 = (((^((~(8'hb3)) && {(8'h9c), (8'ha2)})) ? (8'ha7) : {(~{(8'ha0)})}) ? (((((8'hbc) ^~ (8'ha2)) << (|(8'hac))) - (+((8'h9e) + (8'ha5)))) < ((^{(8'hb4)}) ? ((!(8'hb4)) ^ (^(7'h44))) : (8'hbe))) : ((8'h9d) ~^ (~|((+(8'ha4)) ? ((8'hac) ? (8'haf) : (8'hbc)) : (|(8'ha1)))))), 
parameter param102 = {{(8'ha4)}})
(y, clk, wire31, wire32, wire33, wire34);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire31;
  input wire signed [(4'hb):(1'h0)] wire32;
  input wire signed [(5'h13):(1'h0)] wire33;
  input wire [(5'h12):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire93;
  wire signed [(5'h12):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire54;
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire57,
                 wire56,
                 wire35,
                 wire36,
                 wire37,
                 wire54,
                 reg100,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire35 = $signed(($unsigned(((wire34 ?
                      wire34 : wire32) && $signed(wire31))) ~^ $signed($signed((-(8'ha0))))));
  assign wire36 = $unsigned(wire34[(1'h1):(1'h1)]);
  assign wire37 = (^~wire34[(3'h6):(3'h5)]);
  module38 #() modinst55 (wire54, clk, wire34, wire33, wire37, wire36, wire31);
  assign wire56 = $unsigned(({$signed((-wire33))} ?
                      wire34 : $unsigned($signed(wire32[(1'h1):(1'h1)]))));
  assign wire57 = (8'hbe);
  module58 #() modinst88 (.wire59(wire37), .wire62(wire56), .wire60(wire54), .clk(clk), .y(wire87), .wire61(wire32));
  assign wire89 = ($unsigned((+($unsigned(wire36) ?
                          (~&wire54) : (wire54 ^ wire56)))) ?
                      ($unsigned((8'ha9)) ?
                          (wire32 == wire37[(5'h10):(4'hd)]) : wire33) : wire87[(4'h8):(1'h1)]);
  assign wire90 = wire54;
  assign wire91 = $unsigned((+(~$unsigned($signed(wire31)))));
  assign wire92 = (-{(wire31 && (wire34 - $signed(wire37)))});
  assign wire93 = (^$signed({wire33[(4'hf):(4'h8)]}));
  assign wire94 = wire37;
  assign wire95 = (&(~&($unsigned((wire36 ? wire91 : wire32)) ?
                      wire32[(3'h5):(3'h5)] : wire34[(3'h7):(1'h1)])));
  assign wire96 = $unsigned(wire94);
  assign wire97 = ($signed(wire94) >= $unsigned(wire96));
  always
    @(posedge clk) begin
      reg98 <= wire33[(1'h1):(1'h1)];
      reg99 <= $unsigned($signed((+($unsigned(wire36) & (wire31 * wire57)))));
      reg100 <= {$unsigned(wire91[(1'h0):(1'h0)])};
    end
endmodule

module module6
#(parameter param22 = {(&((((8'h9e) ? (8'ha8) : (8'hb8)) || {(8'hae), (8'hbd)}) <<< ((^(8'hb9)) >> (~(7'h43)))))})
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire11;
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire12,
                 wire11,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = (wire8 && wire9[(4'hc):(2'h2)]);
  assign wire12 = wire7;
  always
    @(posedge clk) begin
      reg13 <= $signed((!$signed(wire9[(4'hb):(4'ha)])));
      reg14 <= reg13[(2'h3):(2'h3)];
      reg15 <= ($unsigned($signed($signed(wire9[(5'h11):(4'h9)]))) ?
          (wire8 ?
              wire7[(1'h0):(1'h0)] : wire10[(2'h3):(2'h3)]) : ((^~reg13[(1'h1):(1'h1)]) ?
              (|(-(^~reg13))) : wire12[(3'h7):(3'h4)]));
      reg16 <= (wire10 < wire12);
      reg17 <= reg13[(3'h6):(1'h1)];
    end
  assign wire18 = $signed($signed($signed(((wire10 >> reg15) != (reg17 ?
                      wire9 : reg13)))));
  assign wire19 = ((((!$unsigned(reg13)) * reg17) ?
                          reg17[(1'h1):(1'h0)] : reg14[(1'h1):(1'h1)]) ?
                      $signed($unsigned($unsigned({reg16}))) : (($signed((+wire18)) ?
                              (wire8 ?
                                  (~&reg13) : $signed(wire8)) : ({wire8} ^~ $signed(reg15))) ?
                          $signed((7'h44)) : (^$unsigned((reg17 ?
                              reg17 : wire12)))));
  assign wire20 = (~|$unsigned(((wire10 ?
                      wire19[(3'h6):(1'h1)] : (-reg15)) + ($unsigned(wire9) != $unsigned((8'hb7))))));
  assign wire21 = $signed($signed({{(8'hb6), (wire19 != wire9)}, wire19}));
endmodule

module module58
#(parameter param86 = ((|(-(((7'h40) ~^ (8'hb0)) ? ((8'hbc) ~^ (8'hb6)) : ((8'ha1) <<< (8'hb5))))) * (-(((^~(8'hba)) ? ((8'haa) & (7'h42)) : {(8'h9d)}) < (((8'haa) ? (8'hb7) : (8'hb8)) ? ((7'h41) || (8'hb4)) : ((8'ha4) ? (8'ha7) : (8'hba)))))))
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire62;
  input wire signed [(3'h4):(1'h0)] wire61;
  input wire [(4'ha):(1'h0)] wire60;
  input wire signed [(3'h4):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg69,
                 (1'h0)};
  assign wire63 = ((|wire62[(1'h0):(1'h0)]) ^ $signed((8'ha1)));
  assign wire64 = ((|wire60[(3'h6):(1'h1)]) ?
                      ((((+wire59) ? (+wire63) : $signed(wire59)) >> ({wire59,
                                  wire62} ?
                              $signed((8'hb8)) : (wire61 < wire63))) ?
                          (($signed(wire61) ? (~wire63) : wire62) ?
                              wire62[(3'h4):(1'h1)] : wire62) : (&($signed(wire62) & wire60))) : wire62[(3'h6):(2'h2)]);
  assign wire65 = (($signed(wire59) <= (8'hbd)) ?
                      ((wire64 * ($signed(wire64) ^ (~wire61))) ?
                          wire63 : $unsigned($signed($signed((8'hbb))))) : (!wire61[(2'h3):(2'h2)]));
  assign wire66 = (8'ha6);
  assign wire67 = {(wire66[(3'h6):(2'h3)] ?
                          ((wire61[(1'h0):(1'h0)] ?
                              wire63 : wire64) & (-wire59[(3'h4):(2'h3)])) : wire64),
                      ($unsigned({$signed(wire60),
                              (wire66 ? wire59 : wire62)}) ?
                          (-$unsigned((wire63 ?
                              wire59 : wire60))) : wire63[(4'h8):(3'h5)])};
  assign wire68 = $unsigned($signed($signed($signed((+wire67)))));
  always
    @(posedge clk) begin
      reg69 <= wire61[(1'h1):(1'h0)];
    end
  assign wire70 = (8'ha6);
  assign wire71 = ($unsigned(((((8'hb9) && wire62) >>> (wire61 ?
                          wire68 : wire66)) ?
                      ((wire63 != wire64) ?
                          $unsigned(wire62) : (8'hb1)) : reg69)) | (|((^~(wire65 ?
                      wire59 : wire61)) ^~ ($signed(wire70) ?
                      wire60 : $signed(wire64)))));
  assign wire72 = $signed(wire66);
  assign wire73 = ((7'h44) ?
                      (wire65[(3'h4):(2'h3)] | (~^$unsigned(wire71))) : wire65[(3'h4):(2'h2)]);
  assign wire74 = (~&wire63);
  assign wire75 = wire70[(1'h0):(1'h0)];
  assign wire76 = $unsigned(((((-wire74) ?
                          (wire73 || wire68) : wire62[(1'h1):(1'h1)]) < wire68[(3'h5):(1'h0)]) ?
                      ($signed({wire62,
                          wire66}) != ($unsigned(wire60) < $signed(reg69))) : (wire71[(4'h9):(4'h9)] <<< $signed((8'ha9)))));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(({(wire73 ? wire76 : wire68),
          (wire67 ? reg69 : wire64)} | ((wire60 ? wire70 : wire71) ?
          {wire59, wire73} : reg69)))))
        begin
          reg77 <= wire62[(1'h0):(1'h0)];
          reg78 <= ((wire73 || $signed((|$unsigned((7'h40))))) ?
              $signed($signed($unsigned(wire72[(3'h4):(3'h4)]))) : (&(reg69[(1'h1):(1'h0)] <<< wire62[(1'h0):(1'h0)])));
          if (wire70[(3'h4):(1'h1)])
            begin
              reg79 <= (~|reg78);
              reg80 <= wire76[(4'h9):(2'h2)];
              reg81 <= reg78;
            end
          else
            begin
              reg79 <= $signed(reg77[(4'hd):(4'hc)]);
            end
        end
      else
        begin
          reg77 <= ({wire68[(3'h4):(1'h1)]} ?
              wire76[(4'ha):(4'h8)] : $signed($unsigned({$signed(reg79),
                  $unsigned((8'hb1))})));
        end
    end
  assign wire82 = (|wire60);
  assign wire83 = reg78[(1'h0):(1'h0)];
  assign wire84 = wire63;
  assign wire85 = wire62[(3'h6):(2'h2)];
endmodule

module module38
#(parameter param53 = ((8'hb3) ? ((|(|((7'h40) <= (8'hb5)))) >= ((!((8'hbd) ^~ (8'hb6))) && ((|(8'ha8)) | ((8'ha3) ? (8'hbc) : (8'hb1))))) : (&(-(8'hba)))))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire43;
  input wire [(5'h10):(1'h0)] wire42;
  input wire signed [(5'h13):(1'h0)] wire41;
  input wire [(4'hb):(1'h0)] wire40;
  input wire [(4'he):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 (1'h0)};
  assign wire44 = wire42;
  assign wire45 = ($unsigned(($signed((wire44 ? wire41 : wire39)) ?
                      (8'hb1) : wire39)) + wire44[(1'h0):(1'h0)]);
  assign wire46 = $unsigned((~(~($unsigned(wire41) ?
                      (wire43 ? wire41 : wire41) : $unsigned(wire42)))));
  assign wire47 = (wire40 ^ {(~((~&wire45) > wire46[(3'h4):(3'h4)]))});
  assign wire48 = (wire43[(5'h11):(4'ha)] ~^ $unsigned({$signed($unsigned(wire43))}));
  assign wire49 = $unsigned((wire44[(1'h1):(1'h1)] ?
                      wire40 : ((+(^wire39)) ?
                          wire43[(1'h1):(1'h0)] : wire41[(2'h2):(1'h0)])));
  assign wire50 = $unsigned((+wire46[(3'h6):(3'h6)]));
  assign wire51 = wire50;
  assign wire52 = $unsigned((|$unsigned($signed($signed(wire41)))));
endmodule

module module116  (y, clk, wire121, wire120, wire119, wire118, wire117);
  output wire [(32'h1b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire121;
  input wire signed [(5'h13):(1'h0)] wire120;
  input wire signed [(4'he):(1'h0)] wire119;
  input wire [(5'h13):(1'h0)] wire118;
  input wire signed [(4'hb):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire161;
  wire [(4'h9):(1'h0)] wire158;
  wire [(5'h12):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire155;
  wire signed [(4'h8):(1'h0)] wire134;
  wire [(4'ha):(1'h0)] wire133;
  wire [(4'hb):(1'h0)] wire132;
  wire signed [(5'h14):(1'h0)] wire131;
  wire [(4'h8):(1'h0)] wire130;
  wire [(5'h14):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire127;
  wire [(2'h3):(1'h0)] wire126;
  wire signed [(5'h12):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire122;
  reg signed [(4'hd):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg159 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(2'h2):(1'h0)] reg153 = (1'h0);
  reg [(4'hc):(1'h0)] reg152 = (1'h0);
  reg [(4'hf):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg signed [(4'he):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  assign y = {wire161,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire123,
                 wire122,
                 reg160,
                 reg159,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
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
                 reg125,
                 reg124,
                 (1'h0)};
  assign wire122 = {$signed((~(|(-wire117))))};
  assign wire123 = $unsigned((8'h9f));
  always
    @(posedge clk) begin
      reg124 <= (wire117 && wire123);
      reg125 <= ((wire118 ?
              {$unsigned($signed(wire120))} : (((reg124 ~^ wire120) ?
                      $unsigned(wire121) : (&wire120)) ?
                  $signed((wire121 < wire122)) : ((wire117 == (8'hb5)) + $signed(wire122)))) ?
          (wire122 || wire122) : ($unsigned(wire119[(3'h5):(2'h3)]) ?
              wire118[(5'h12):(5'h12)] : wire117[(1'h1):(1'h1)]));
    end
  assign wire126 = ((8'ha9) - (wire121[(3'h5):(2'h3)] | (wire123[(2'h3):(2'h2)] ?
                       {$signed((8'hb9))} : $unsigned(reg125[(4'hb):(4'ha)]))));
  assign wire127 = (~(((8'hb8) ?
                           $signed($signed(wire117)) : reg124[(1'h0):(1'h0)]) ?
                       (wire123[(4'hf):(3'h7)] ?
                           wire126[(2'h2):(2'h2)] : ($signed(wire119) || (^reg124))) : (~$unsigned((wire122 >>> wire118)))));
  assign wire128 = $unsigned((wire120[(3'h5):(1'h1)] ?
                       wire119[(4'hd):(2'h2)] : $signed($unsigned((wire120 ?
                           wire123 : reg124)))));
  assign wire129 = {((+(reg125 || (8'hbe))) ?
                           {$unsigned((wire117 || wire119))} : wire121)};
  assign wire130 = $signed($unsigned(({$unsigned(wire128)} & reg125)));
  assign wire131 = $signed(wire123[(4'hf):(1'h0)]);
  assign wire132 = (~(~^(wire118[(5'h13):(4'h8)] ?
                       {(reg125 ^ wire126)} : wire130[(3'h6):(3'h6)])));
  assign wire133 = (~&$signed(wire122[(5'h14):(4'hf)]));
  assign wire134 = reg124;
  always
    @(posedge clk) begin
      if ((~&wire119[(4'ha):(4'h8)]))
        begin
          if ($signed((~^(|($unsigned(wire122) ?
              (wire127 ~^ wire130) : (wire127 ? wire121 : wire127))))))
            begin
              reg135 <= (|{$unsigned((((8'hbe) <= wire122) << $signed((7'h43)))),
                  ((|((8'haf) ?
                      wire122 : wire122)) >> wire131[(3'h7):(1'h1)])});
              reg136 <= wire118[(1'h1):(1'h1)];
              reg137 <= (wire129[(4'h9):(3'h5)] ?
                  $signed($signed(($unsigned(wire129) ?
                      {wire130} : (wire126 > (8'hac))))) : $signed((&((reg124 ~^ (8'ha3)) != {(8'hb8),
                      wire133}))));
              reg138 <= $unsigned($unsigned(($unsigned($unsigned(reg124)) ?
                  ((reg137 ? wire131 : wire123) ?
                      $unsigned(reg137) : {(8'h9e)}) : (((8'hbe) ?
                          wire117 : wire120) ?
                      ((8'ha9) ? wire117 : wire121) : reg136[(4'hc):(3'h6)]))));
              reg139 <= wire130;
            end
          else
            begin
              reg135 <= reg124[(1'h0):(1'h0)];
              reg136 <= ($unsigned({$signed(reg125)}) ?
                  reg138 : (wire123 << (wire120 ?
                      ((reg125 ? wire127 : wire128) ?
                          wire128 : $signed(wire120)) : ((reg137 * wire131) ?
                          ((8'hb0) ? wire119 : (8'h9e)) : (-wire132)))));
            end
          reg140 <= (wire130[(3'h4):(3'h4)] ^ $unsigned(($unsigned(wire123[(3'h6):(1'h1)]) >> (~&wire129[(2'h2):(2'h2)]))));
        end
      else
        begin
          reg135 <= (&$unsigned((wire119[(4'ha):(3'h4)] & $unsigned((~|(8'h9d))))));
          reg136 <= reg139;
        end
      reg141 <= (($unsigned((|{wire118, (8'ha5)})) ?
          $signed($unsigned((~^wire122))) : wire132[(1'h0):(1'h0)]) - $unsigned($signed(reg125)));
      reg142 <= wire119[(3'h4):(2'h3)];
      if (wire123[(1'h0):(1'h0)])
        begin
          if (($signed(wire121) ?
              (wire133 ?
                  (wire127[(3'h5):(2'h3)] ?
                      ((reg138 + reg136) ?
                          wire129[(2'h3):(1'h0)] : (8'hb9)) : (&{wire122})) : ($signed(wire130) ?
                      (reg135 ?
                          $unsigned(wire122) : wire117[(4'h8):(3'h5)]) : wire131[(1'h1):(1'h1)])) : (wire118 <<< $unsigned((~|$unsigned(wire133))))))
            begin
              reg143 <= ({wire120[(4'h9):(4'h8)]} && (({(^reg142),
                          reg135[(1'h0):(1'h0)]} ?
                      $unsigned((&wire129)) : (wire117 ^ reg137[(3'h4):(2'h3)])) ?
                  ($unsigned({reg138, wire127}) ?
                      $signed((reg135 >> wire119)) : $unsigned($signed(wire128))) : {((+wire118) != (8'h9f)),
                      wire120[(4'he):(3'h5)]}));
              reg144 <= (~((|$unsigned((^wire133))) ?
                  ({$unsigned((8'hb1)),
                      $unsigned(reg140)} ~^ $unsigned($signed(wire126))) : wire128));
              reg145 <= (&{(-$signed(wire119))});
            end
          else
            begin
              reg143 <= wire133;
              reg144 <= (((+(wire117[(3'h7):(3'h6)] ?
                      {reg143, wire119} : {reg125, reg142})) && (8'hb5)) ?
                  $signed($unsigned($signed((8'ha8)))) : wire119[(1'h1):(1'h1)]);
              reg145 <= wire132[(2'h2):(2'h2)];
              reg146 <= wire123;
            end
        end
      else
        begin
          if (((8'hb4) >= ($unsigned(($signed(reg139) << (wire129 == wire117))) + (((~(8'ha3)) ~^ $unsigned(wire132)) - (reg146 ?
              (wire128 > reg141) : $signed(reg146))))))
            begin
              reg143 <= ((!$signed((~&reg143[(1'h0):(1'h0)]))) || wire134);
              reg144 <= (8'hbf);
              reg145 <= wire134;
            end
          else
            begin
              reg143 <= reg125[(2'h3):(1'h0)];
              reg144 <= reg142[(4'h8):(4'h8)];
              reg145 <= wire121;
            end
          if (($unsigned($signed($unsigned((7'h44)))) >>> {(-($signed(reg144) ?
                  $unsigned(reg140) : reg142[(1'h0):(1'h0)]))}))
            begin
              reg146 <= reg125[(3'h7):(1'h0)];
              reg147 <= ($signed($unsigned($unsigned((8'h9d)))) ?
                  $signed((8'hb3)) : (reg144[(4'ha):(3'h5)] == ($signed(wire133) ?
                      ((reg124 | reg146) < $unsigned((8'ha4))) : ({wire134,
                              (8'hb4)} ?
                          reg146[(1'h0):(1'h0)] : reg143[(4'hb):(4'ha)]))));
            end
          else
            begin
              reg146 <= (wire133[(4'h8):(3'h6)] >= ($unsigned($signed(((8'hb8) * reg144))) ?
                  ((8'hbc) ^~ wire129[(4'hb):(3'h4)]) : ((reg140 <<< wire128) ~^ wire131)));
            end
          reg148 <= $unsigned((+wire117[(4'h9):(4'h9)]));
          reg149 <= ($unsigned($unsigned({wire130})) * {reg141});
          reg150 <= ({(wire130 == reg144[(4'hc):(3'h7)])} == reg147[(2'h2):(1'h1)]);
        end
      if (reg144)
        begin
          reg151 <= $unsigned({reg144[(1'h1):(1'h1)],
              $signed($signed({reg124, reg148}))});
          reg152 <= (8'hb0);
          reg153 <= ({($unsigned($unsigned(wire129)) ?
                      $signed((~|wire119)) : wire122[(1'h1):(1'h1)]),
                  $signed((((8'hb8) ^ reg140) ?
                      (&reg136) : reg152[(3'h6):(3'h4)]))} ?
              (8'hbc) : $unsigned((+((reg139 ? wire134 : wire118) ?
                  (+(8'hac)) : $signed(wire123)))));
          reg154 <= $unsigned((~&(|wire129[(3'h5):(3'h4)])));
        end
      else
        begin
          reg151 <= {reg146};
        end
    end
  assign wire155 = {(((|$unsigned(reg144)) ?
                               ((wire117 ? wire120 : wire130) ?
                                   reg151[(4'ha):(4'ha)] : $unsigned(reg124)) : (&(wire127 ~^ reg135))) ?
                           ((reg146 ?
                               $signed((7'h41)) : wire120) < ((~reg143) > (~^reg150))) : $signed(((reg147 ?
                                   reg146 : reg147) ?
                               (&reg153) : $signed(reg142)))),
                       ((8'hb7) ?
                           $unsigned(((reg139 ? wire117 : (8'hb6)) ?
                               $signed(reg150) : (reg141 ?
                                   reg151 : (8'hae)))) : $signed($signed($unsigned(reg150))))};
  assign wire156 = wire126;
  assign wire157 = ((!wire130[(2'h2):(2'h2)]) >> reg140);
  assign wire158 = ((~^$signed((reg150[(1'h1):(1'h1)] < wire157[(1'h0):(1'h0)]))) ?
                       (((wire123 < (wire131 ? (8'hac) : (8'hb8))) ?
                           $signed(wire131[(2'h3):(2'h2)]) : $unsigned($signed(wire122))) ^ {(wire132 > $unsigned(reg140)),
                           wire117}) : $unsigned((!$signed({wire130}))));
  always
    @(posedge clk) begin
      reg159 <= (~reg150[(1'h0):(1'h0)]);
      reg160 <= wire134;
    end
  assign wire161 = reg139[(5'h11):(4'h8)];
endmodule
