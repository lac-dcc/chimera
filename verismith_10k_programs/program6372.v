module top
#(parameter param166 = ((((((8'haa) == (8'h9c)) ? {(8'hb9)} : (-(8'hac))) ? (~((8'hb4) ? (8'ha7) : (8'hb3))) : {((7'h41) ? (8'haa) : (8'hb5))}) ^ (((~^(8'h9d)) >= ((7'h44) ? (7'h43) : (8'hb5))) ? (((8'ha8) ? (8'hb4) : (8'hbf)) ? {(8'hb9)} : {(8'ha2)}) : ((~(8'ha9)) != ((8'ha6) ^ (7'h41))))) ? (!(8'hac)) : (((-((8'ha3) ? (8'hb3) : (8'hb4))) ? ((~|(8'hab)) ? ((8'hae) ? (8'ha6) : (8'ha4)) : (8'ha4)) : ((~^(8'ha9)) && ((8'ha7) & (8'ha8)))) ? ((((8'hbd) + (8'hb1)) - ((8'hb4) < (8'hb8))) ? (~|((8'hab) ^~ (8'had))) : ({(8'hb1), (7'h42)} >= ((8'hb4) && (8'hbe)))) : ((((7'h41) ? (7'h43) : (8'h9d)) ? (~&(8'hba)) : ((8'hb2) ? (7'h40) : (8'hbc))) ? (&(~(8'ha8))) : (((8'ha2) ? (8'h9f) : (8'ha6)) ? ((8'ha8) * (8'hac)) : ((7'h40) ? (7'h43) : (8'hb9)))))), 
parameter param167 = param166)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire164;
  wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire160;
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  assign y = {wire164,
                 wire75,
                 wire32,
                 wire5,
                 wire6,
                 wire30,
                 wire77,
                 wire160,
                 reg162,
                 reg163,
                 (1'h0)};
  assign wire5 = ($signed({(^wire2[(3'h5):(1'h1)]),
                         $signed($unsigned(wire1))}) ?
                     $signed($signed($signed((wire2 < (8'hba))))) : $unsigned((^$signed((wire3 ?
                         wire2 : wire1)))));
  assign wire6 = ($signed($unsigned(($signed(wire5) != $unsigned(wire3)))) ?
                     (wire4[(3'h7):(3'h6)] ?
                         (+(7'h40)) : $unsigned(wire1[(1'h0):(1'h0)])) : wire2[(4'h9):(3'h7)]);
  module7 #() modinst31 (.wire10(wire0), .wire12(wire6), .wire9(wire3), .wire8(wire4), .clk(clk), .y(wire30), .wire11(wire2));
  assign wire32 = $unsigned($unsigned((($signed((8'ha2)) && wire0[(2'h3):(2'h3)]) | $unsigned(wire6))));
  module33 #() modinst76 (.wire38(wire1), .y(wire75), .wire36(wire30), .wire34(wire6), .wire37(wire5), .clk(clk), .wire35(wire32));
  assign wire77 = (~|(-(8'hac)));
  module78 #() modinst161 (wire160, clk, wire0, wire3, wire6, wire32, wire5);
  always
    @(posedge clk) begin
      reg162 <= wire4;
      reg163 <= (wire4 ?
          {wire6[(5'h12):(4'h8)],
              $unsigned((~wire160[(5'h10):(5'h10)]))} : (wire0[(3'h6):(2'h3)] != reg162));
    end
  module33 #() modinst165 (wire164, clk, wire1, wire75, wire77, reg163, wire3);
endmodule

module module78  (y, clk, wire79, wire80, wire81, wire82, wire83);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire79;
  input wire [(5'h13):(1'h0)] wire80;
  input wire signed [(5'h13):(1'h0)] wire81;
  input wire signed [(5'h12):(1'h0)] wire82;
  input wire [(3'h7):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire159;
  wire [(4'hd):(1'h0)] wire158;
  wire signed [(4'hd):(1'h0)] wire157;
  wire [(4'he):(1'h0)] wire156;
  wire [(4'he):(1'h0)] wire155;
  wire signed [(4'hd):(1'h0)] wire154;
  wire signed [(4'h9):(1'h0)] wire153;
  wire signed [(4'hf):(1'h0)] wire152;
  wire signed [(4'h8):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire89;
  wire signed [(4'ha):(1'h0)] wire90;
  wire signed [(4'hc):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire149;
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire97,
                 wire98,
                 wire149,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire84 = $signed((8'hbf));
  assign wire85 = wire82;
  assign wire86 = wire84;
  assign wire87 = $signed(($unsigned(($unsigned(wire79) <<< $unsigned(wire86))) <<< wire82));
  assign wire88 = $unsigned($signed($signed((+$signed(wire82)))));
  assign wire89 = wire83[(2'h3):(1'h1)];
  assign wire90 = {wire86[(1'h1):(1'h1)],
                      (wire87 ? $signed(wire79) : wire80[(1'h0):(1'h0)])};
  assign wire91 = ($signed(wire79[(3'h5):(1'h0)]) ^~ $unsigned($unsigned((~&(wire86 ?
                      wire89 : wire87)))));
  always
    @(posedge clk) begin
      if ($unsigned((~^$signed(wire91[(1'h0):(1'h0)]))))
        begin
          reg92 <= $unsigned((wire86[(4'hf):(1'h1)] << $signed($signed(wire85))));
          reg93 <= wire79[(4'h8):(3'h6)];
          reg94 <= (wire87[(1'h0):(1'h0)] ? wire81 : wire83[(3'h4):(2'h2)]);
        end
      else
        begin
          reg92 <= {wire80[(3'h4):(2'h2)], reg94};
        end
      reg95 <= wire80[(3'h7):(2'h3)];
      reg96 <= $signed(wire88[(1'h1):(1'h1)]);
    end
  assign wire97 = ((7'h42) ?
                      (+$unsigned(($unsigned(reg93) ?
                          (~&wire90) : wire83[(3'h6):(3'h6)]))) : reg92[(1'h1):(1'h0)]);
  assign wire98 = ($signed($unsigned(wire79[(2'h2):(1'h1)])) ?
                      wire89 : (~($unsigned({wire97, reg94}) ?
                          wire86[(4'ha):(4'ha)] : ($unsigned(wire85) ^ (wire81 ?
                              reg92 : (8'hb5))))));
  module99 #() modinst150 (.y(wire149), .wire101(reg93), .wire102(wire82), .wire103(wire80), .clk(clk), .wire100(reg94), .wire104(wire98));
  assign wire151 = {(8'hbe), wire81[(3'h5):(1'h1)]};
  assign wire152 = (^$unsigned(reg96));
  assign wire153 = ((^~(wire84 ^~ (8'haa))) ?
                       {$unsigned((|$signed((8'hbd))))} : wire86[(4'h9):(2'h3)]);
  assign wire154 = $signed(wire81[(4'h9):(2'h3)]);
  assign wire155 = (8'hb8);
  assign wire156 = (8'hbb);
  assign wire157 = $unsigned((~((~^(reg92 - wire97)) ?
                       ({wire82} | wire85[(2'h3):(2'h3)]) : (wire149 && (reg93 ^~ wire85)))));
  assign wire158 = ({wire79, ((~^wire87) | wire84[(5'h11):(5'h10)])} ?
                       wire88 : (~wire152));
  assign wire159 = $unsigned($signed(((-$unsigned(wire82)) ~^ (!(wire86 ?
                       wire155 : (8'hb4))))));
endmodule

module module33  (y, clk, wire34, wire35, wire36, wire37, wire38);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire34;
  input wire [(2'h3):(1'h0)] wire35;
  input wire [(3'h7):(1'h0)] wire36;
  input wire signed [(5'h14):(1'h0)] wire37;
  input wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(3'h6):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire69;
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire39,
                 wire69,
                 reg40,
                 reg41,
                 (1'h0)};
  assign wire39 = $unsigned($signed((&(wire37 ?
                      wire37 : (wire35 ? wire34 : wire34)))));
  always
    @(posedge clk) begin
      reg40 <= $signed((wire38 != ($unsigned($signed(wire37)) ?
          {(wire38 >= wire39)} : ((wire39 ? wire34 : wire39) << {(8'hb2)}))));
      reg41 <= wire35;
    end
  module42 #() modinst70 (.y(wire69), .wire46(reg40), .clk(clk), .wire44(wire34), .wire45(wire37), .wire43(wire39));
  assign wire71 = wire39[(4'he):(3'h5)];
  assign wire72 = $unsigned($signed(($signed($signed(wire34)) && (+$unsigned(wire38)))));
  assign wire73 = {wire71};
  assign wire74 = ((~&(({wire36, reg41} ?
                      reg41[(4'h8):(2'h2)] : $signed(reg41)) << {(wire39 != wire37)})) && $signed($unsigned(reg41)));
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire11;
  input wire [(4'h8):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire14,
                 wire13,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire13 = $signed(wire11[(4'hb):(1'h1)]);
  assign wire14 = {$unsigned($signed((8'ha7)))};
  always
    @(posedge clk) begin
      reg15 <= $signed((!{($signed((8'ha5)) ? $unsigned(wire8) : wire13),
          (^~(wire12 ? wire12 : wire12))}));
      reg16 <= wire14[(4'h8):(3'h5)];
      reg17 <= $signed($signed($unsigned($unsigned((wire8 != reg16)))));
      if (wire13[(4'hd):(2'h3)])
        begin
          reg18 <= $unsigned($signed(wire13));
          reg19 <= $unsigned((reg18[(2'h3):(1'h0)] >= {wire8[(1'h0):(1'h0)]}));
          reg20 <= $unsigned($signed(((-$unsigned(wire14)) ?
              $unsigned({(8'ha7), (8'h9c)}) : wire14[(4'hf):(4'ha)])));
          reg21 <= wire11[(3'h6):(1'h0)];
          reg22 <= (&reg19[(3'h4):(2'h3)]);
        end
      else
        begin
          reg18 <= wire12[(1'h0):(1'h0)];
          if (($signed({((8'hab) ? (+wire9) : (wire13 >> (8'had))),
                  ($unsigned(reg20) && $unsigned(reg15))}) ?
              reg21[(4'h8):(3'h6)] : (-((~|(reg19 < wire10)) ~^ wire8))))
            begin
              reg19 <= $unsigned((!$unsigned((~^reg15))));
            end
          else
            begin
              reg19 <= $unsigned(((((reg15 ^ wire9) ?
                  (~wire9) : (reg16 == reg21)) << $unsigned((reg21 << wire10))) == $unsigned($signed({reg18,
                  reg15}))));
              reg20 <= reg21[(4'h8):(3'h4)];
            end
          reg21 <= {(($unsigned((reg21 ? wire13 : reg17)) & $signed({wire12})) ?
                  ({wire14[(1'h1):(1'h1)], (reg18 || wire14)} >>> (~{wire10,
                      reg18})) : (-$signed((!wire10))))};
          if ($signed(wire13[(4'hb):(3'h5)]))
            begin
              reg22 <= $unsigned(((($unsigned(reg20) - wire12) > (~&$signed(wire8))) ?
                  $unsigned((wire14[(3'h7):(1'h1)] & (-wire10))) : wire14));
            end
          else
            begin
              reg22 <= reg22;
              reg23 <= $signed($unsigned(((wire8 == reg17) ?
                  (^$signed(wire14)) : $unsigned((reg19 & (8'haf))))));
              reg24 <= ($unsigned(((~^wire11) >> $unsigned($unsigned(reg18)))) < wire12[(1'h0):(1'h0)]);
            end
          reg25 <= reg15[(4'ha):(1'h1)];
        end
      reg26 <= ($signed(reg20[(4'h8):(1'h1)]) ?
          ($signed(($unsigned(reg24) ?
              (reg19 << reg15) : {reg17})) ^ $unsigned(reg25)) : $unsigned((reg20[(2'h3):(2'h3)] ?
              (reg22 <= (reg19 && wire8)) : reg19)));
    end
  assign wire27 = $signed({$unsigned(wire14[(1'h0):(1'h0)]), reg21});
  assign wire28 = reg26;
  assign wire29 = ((((reg18[(1'h1):(1'h1)] ^ wire9[(1'h0):(1'h0)]) != wire11) >> ((7'h41) <= (-$signed((8'had))))) > wire10);
endmodule

module module42
#(parameter param67 = (~&({((~^(7'h44)) ? (!(8'hb0)) : ((8'ha1) ? (8'hac) : (8'ha0)))} ? ((8'hb0) << ({(7'h42)} ^ (&(8'hbc)))) : (~|(((8'ha5) ? (8'ha0) : (8'hb1)) ? (~|(8'ha8)) : {(8'hba), (8'hbc)})))), 
parameter param68 = (+((-({param67, param67} ? param67 : (param67 ? param67 : param67))) ? param67 : ({param67, param67} <= (|{(8'h9d)})))))
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire46;
  input wire [(4'ha):(1'h0)] wire45;
  input wire [(4'he):(1'h0)] wire44;
  input wire [(4'he):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire49,
                 wire48,
                 wire47,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire47 = (wire43[(4'hc):(2'h2)] >= (~|(wire44[(2'h2):(2'h2)] ?
                      $unsigned(wire45[(1'h0):(1'h0)]) : $unsigned((8'ha7)))));
  assign wire48 = {wire46};
  assign wire49 = wire43;
  always
    @(posedge clk) begin
      if (wire44[(3'h5):(2'h3)])
        begin
          reg50 <= ($unsigned(($unsigned(((8'hb9) ?
                  wire48 : wire43)) ~^ (8'ha7))) ?
              (&(8'hb2)) : $signed(wire46[(1'h1):(1'h1)]));
          if ($signed((wire47[(3'h4):(2'h3)] ?
              (8'h9c) : wire44[(4'hc):(3'h6)])))
            begin
              reg51 <= (wire49[(1'h1):(1'h1)] ?
                  $unsigned(wire45[(4'ha):(2'h2)]) : wire48);
              reg52 <= wire45[(1'h1):(1'h1)];
            end
          else
            begin
              reg51 <= ({(-wire43[(3'h5):(1'h0)]), reg51[(3'h5):(2'h3)]} ?
                  wire49[(4'ha):(3'h5)] : $unsigned((^{wire47})));
              reg52 <= wire49[(3'h5):(1'h1)];
              reg53 <= $unsigned(((wire43 << (wire47[(5'h11):(4'hd)] <= wire46[(4'h9):(3'h4)])) * wire47[(4'h8):(3'h6)]));
              reg54 <= (!((reg50[(5'h10):(4'ha)] ?
                      wire45[(3'h4):(2'h2)] : $signed((wire45 ?
                          wire44 : reg51))) ?
                  (wire43 ?
                      $signed($signed((7'h44))) : $signed(((8'hb3) >>> (8'hb5)))) : $signed(reg50)));
              reg55 <= reg54[(3'h7):(2'h2)];
            end
          reg56 <= (8'ha8);
          reg57 <= (($signed(wire49[(4'hc):(1'h1)]) >= (wire45[(1'h0):(1'h0)] ?
              (&reg51) : ({reg55, reg52} ?
                  (&reg52) : {reg51, reg51}))) * (wire48[(4'hc):(3'h5)] ?
              wire44 : ((~^(8'h9e)) ?
                  {((8'h9d) ? wire47 : reg52)} : $signed(wire43))));
          reg58 <= (wire43[(1'h1):(1'h1)] ?
              $signed((-wire47)) : $unsigned(((wire47 ^ (^~reg53)) > (-$unsigned(wire47)))));
        end
      else
        begin
          if ($unsigned((8'ha8)))
            begin
              reg50 <= (!{wire48, (8'hb3)});
              reg51 <= reg57[(2'h2):(1'h0)];
            end
          else
            begin
              reg50 <= (wire43 ?
                  {{(^~$signed(wire45)),
                          wire46[(4'ha):(2'h3)]}} : (wire49 || wire44));
              reg51 <= (8'h9c);
              reg52 <= reg54[(1'h0):(1'h0)];
              reg53 <= ((|wire43[(1'h1):(1'h0)]) > (+wire46));
              reg54 <= $signed({($unsigned((reg55 != wire44)) ?
                      reg58 : $signed({reg51}))});
            end
          if ($signed($signed(reg55)))
            begin
              reg55 <= $signed((reg58[(1'h1):(1'h0)] ?
                  (((reg53 + reg57) ? (~reg55) : $unsigned(reg50)) ?
                      $unsigned(wire45) : reg56) : $unsigned(reg57)));
              reg56 <= (^((~|(reg55[(1'h1):(1'h1)] ?
                  $unsigned(reg58) : (|wire49))) - $unsigned((((8'h9f) ^~ (8'h9c)) << reg58))));
              reg57 <= $unsigned(wire45);
            end
          else
            begin
              reg55 <= $signed($signed(($unsigned((wire48 ? reg58 : wire48)) ?
                  {$signed(wire47)} : $signed((wire47 != reg50)))));
              reg56 <= $unsigned((~&$signed(reg51[(4'hd):(4'hb)])));
            end
          reg58 <= (+$unsigned((+reg52)));
          reg59 <= ($unsigned($unsigned($unsigned({wire48, reg54}))) ?
              (8'hbb) : (|(^~wire45[(1'h1):(1'h0)])));
          reg60 <= reg52;
        end
      reg61 <= (7'h44);
    end
  assign wire62 = (-reg58);
  assign wire63 = {((8'ha1) ?
                          wire46 : (reg61[(3'h5):(3'h4)] && reg52[(3'h4):(2'h3)]))};
  assign wire64 = $signed((~$unsigned(reg56)));
  assign wire65 = (wire45 == reg59[(1'h0):(1'h0)]);
  assign wire66 = (reg61[(3'h5):(2'h2)] ~^ ((~((reg61 ?
                      (8'h9c) : wire47) >>> {wire45})) | $unsigned((~|(wire44 < wire43)))));
endmodule

module module99  (y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'h21b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire104;
  input wire signed [(5'h13):(1'h0)] wire103;
  input wire [(4'hb):(1'h0)] wire102;
  input wire signed [(4'ha):(1'h0)] wire101;
  input wire [(5'h15):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire148;
  wire signed [(2'h3):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire125;
  wire [(5'h12):(1'h0)] wire124;
  wire [(5'h10):(1'h0)] wire123;
  wire [(3'h4):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire121;
  wire signed [(5'h14):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire105;
  reg signed [(4'ha):(1'h0)] reg147 = (1'h0);
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg [(3'h6):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg133 = (1'h0);
  reg [(4'h9):(1'h0)] reg132 = (1'h0);
  reg [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg107 = (1'h0);
  assign y = {wire148,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire106,
                 wire105,
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
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
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
  assign wire105 = $signed((8'hab));
  assign wire106 = $signed(({(~|(wire100 ? wire105 : wire104)),
                       (8'ha1)} * (8'haf)));
  always
    @(posedge clk) begin
      reg107 <= wire104;
      reg108 <= {$unsigned(wire103)};
      reg109 <= (^($unsigned($unsigned((8'hb4))) > reg108));
      if ((~((wire104 ?
              $signed(reg107) : ((+wire106) ?
                  wire100 : reg108[(3'h4):(3'h4)])) ?
          ((!(reg107 + reg109)) == (reg108 - wire104)) : wire106)))
        begin
          reg110 <= $signed($unsigned(($signed($unsigned(wire103)) ?
              (^wire106) : (reg109[(4'ha):(3'h5)] + reg108[(4'hd):(4'h8)]))));
          if (reg109[(2'h2):(2'h2)])
            begin
              reg111 <= ($unsigned($unsigned((^~$unsigned((8'ha2))))) * wire100[(5'h11):(2'h2)]);
              reg112 <= {{(wire101[(1'h0):(1'h0)] || {(wire101 && wire103)}),
                      wire100[(5'h14):(3'h4)]}};
              reg113 <= reg109;
              reg114 <= reg107;
            end
          else
            begin
              reg111 <= $unsigned(reg113);
              reg112 <= {reg112[(4'h9):(4'h8)]};
              reg113 <= ($signed(($unsigned({wire103}) || ((~|reg114) ?
                      wire102[(3'h6):(2'h2)] : wire100[(2'h3):(2'h3)]))) ?
                  (($signed($unsigned(reg108)) <= $unsigned((wire106 == reg110))) << ((-reg111) >= $unsigned(wire104))) : (reg112[(4'he):(3'h5)] ?
                      $unsigned(reg108[(5'h13):(4'hc)]) : ($unsigned((wire100 + reg112)) ?
                          (!wire103[(2'h2):(1'h0)]) : $signed(reg112[(3'h5):(1'h0)]))));
              reg114 <= wire106;
            end
          reg115 <= $signed(reg113[(3'h7):(3'h6)]);
          reg116 <= wire104;
          reg117 <= $unsigned((|($unsigned($unsigned(wire102)) <= $unsigned(((8'hb5) ?
              reg112 : (8'hae))))));
        end
      else
        begin
          reg110 <= {(wire106[(5'h10):(4'ha)] ?
                  $signed({reg111[(4'ha):(3'h4)], $signed(wire102)}) : reg117),
              wire104};
          reg111 <= $signed((|(wire102[(4'h8):(1'h1)] ^~ ({wire104, reg114} ?
              (8'hbc) : wire104))));
          reg112 <= $signed((reg116[(4'h8):(3'h4)] ? reg110 : {(^~reg112)}));
        end
      reg118 <= (($signed(reg110[(2'h2):(2'h2)]) ~^ {(!(wire105 <<< wire106))}) == ((+(|(wire100 ?
          reg115 : reg110))) != {{wire105}}));
    end
  assign wire119 = ($signed((((~&reg117) ? reg109 : reg116[(4'h8):(3'h6)]) ?
                       (-wire104[(1'h0):(1'h0)]) : (reg107[(4'h9):(4'h8)] ?
                           $unsigned(reg109) : wire100[(4'ha):(4'ha)]))) != wire103);
  assign wire120 = ((-(wire106[(3'h7):(2'h3)] ^~ wire103[(3'h4):(1'h0)])) ?
                       wire103[(4'hb):(2'h3)] : (wire105 || $unsigned((^$signed(wire100)))));
  assign wire121 = (~^reg118[(4'hd):(4'hc)]);
  assign wire122 = (reg107[(4'h9):(3'h7)] || reg107);
  assign wire123 = reg110;
  assign wire124 = $unsigned(wire104[(3'h4):(3'h4)]);
  assign wire125 = $signed(((~&{wire100, {reg110}}) ?
                       ((|(8'ha2)) - wire103[(2'h3):(2'h2)]) : $unsigned(wire104)));
  assign wire126 = (^~(reg111 >= ((((8'ha9) <= reg114) ^~ wire122) ?
                       ($unsigned(wire121) ?
                           (&reg109) : $unsigned(reg110)) : wire125[(2'h3):(1'h0)])));
  assign wire127 = reg110;
  assign wire128 = (8'ha9);
  assign wire129 = wire104[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if (reg115[(1'h1):(1'h0)])
        begin
          if ((reg109 >= {wire106[(5'h10):(1'h1)], reg118}))
            begin
              reg130 <= reg116;
            end
          else
            begin
              reg130 <= reg107[(2'h2):(2'h2)];
              reg131 <= (|$signed((-wire124[(2'h3):(2'h2)])));
              reg132 <= reg131;
            end
          reg133 <= (-(~|$unsigned(reg114)));
          if (((wire129[(2'h2):(1'h1)] ^ (+(wire121[(2'h2):(1'h1)] ?
              (&wire125) : wire120[(4'h9):(2'h3)]))) <<< (wire100[(1'h1):(1'h1)] ^~ (($unsigned(reg115) && (wire103 ?
                  reg110 : reg114)) ?
              ((reg107 != wire120) ? (^wire127) : {wire102}) : {wire105,
                  $signed(wire123)}))))
            begin
              reg134 <= $signed((wire124 ?
                  $unsigned(((wire103 << (8'haf)) < reg110[(4'hd):(3'h4)])) : $unsigned($unsigned((reg111 && wire119)))));
            end
          else
            begin
              reg134 <= {$unsigned($signed(((&wire102) <= (wire124 ?
                      wire125 : wire121))))};
              reg135 <= reg130[(1'h1):(1'h0)];
              reg136 <= reg132;
              reg137 <= wire105[(4'ha):(1'h1)];
            end
          if (((^~($unsigned((~&wire126)) - (|(reg117 ? reg136 : (8'hba))))) ?
              (wire123 ?
                  reg131 : ($signed(((8'hb0) ?
                      reg107 : wire102)) >> wire104)) : {$signed($unsigned((reg131 >> wire129))),
                  reg113}))
            begin
              reg138 <= (-(~^$unsigned($signed($signed(reg107)))));
              reg139 <= reg134;
              reg140 <= reg116[(4'hd):(1'h1)];
              reg141 <= {((&((wire129 ? reg134 : reg114) - $signed(reg108))) ?
                      {$signed((&wire101)),
                          {wire102[(1'h0):(1'h0)]}} : $signed({{wire129,
                              wire121}})),
                  ((+reg118[(3'h7):(3'h4)]) * {reg108[(1'h1):(1'h1)],
                      ((&reg107) < (&wire124))})};
            end
          else
            begin
              reg138 <= (-reg141);
              reg139 <= $signed(reg138[(2'h3):(1'h1)]);
              reg140 <= (!$unsigned((reg134[(2'h3):(1'h1)] ?
                  $unsigned((reg109 < (8'hac))) : reg116[(5'h14):(4'hf)])));
              reg141 <= ((~&(($unsigned(wire101) + (-wire124)) != {(|wire127)})) ?
                  ($unsigned($unsigned((reg111 ? reg111 : reg137))) ?
                      ($signed((reg113 << wire125)) >= ((wire129 ?
                              wire125 : reg133) ?
                          wire100 : wire123[(4'he):(3'h5)])) : wire101) : reg137[(4'h8):(3'h4)]);
            end
          if ($signed(($signed(wire125) ?
              $unsigned($signed((reg115 - (8'hbb)))) : (-$unsigned(reg113)))))
            begin
              reg142 <= $unsigned((reg115 && $signed($signed(reg112[(3'h7):(3'h6)]))));
              reg143 <= (+((($unsigned(wire122) ~^ (reg138 ?
                      (8'had) : (8'hba))) ?
                  ({(8'hb8)} != reg112) : (reg113[(4'h8):(1'h0)] - $signed(reg112))) << wire104));
            end
          else
            begin
              reg142 <= reg113[(2'h2):(1'h0)];
              reg143 <= ((reg134 ?
                  ($unsigned(wire106) <<< (((8'hab) ?
                      wire120 : (8'ha9)) - $signed(wire127))) : $signed((^~(reg109 ?
                      reg116 : reg139)))) ^ reg132[(3'h4):(2'h3)]);
              reg144 <= (wire120 >>> (reg139 || wire121[(4'h9):(3'h7)]));
              reg145 <= reg134;
              reg146 <= $signed((8'hbb));
            end
        end
      else
        begin
          reg130 <= (($signed((~^wire122)) ~^ (reg146[(1'h0):(1'h0)] ?
              (~|$signed(wire104)) : (~(&reg111)))) && wire106);
          if ($signed((~($signed($unsigned(reg112)) << wire124[(4'hc):(4'hb)]))))
            begin
              reg131 <= $signed(({reg135} ?
                  $unsigned((!reg143)) : wire128[(1'h0):(1'h0)]));
              reg132 <= (-reg140);
            end
          else
            begin
              reg131 <= $signed(($signed((8'hbc)) ~^ (wire125[(4'ha):(4'h8)] <= reg108[(4'hd):(4'hb)])));
              reg132 <= $unsigned(reg130[(2'h3):(1'h0)]);
            end
          if ((~$unsigned((~&(^{reg136})))))
            begin
              reg133 <= $signed(((~&($unsigned(reg133) ?
                  (reg143 | reg139) : reg113)) <= $unsigned((&reg117[(2'h2):(1'h1)]))));
              reg134 <= (|$unsigned(reg107));
            end
          else
            begin
              reg133 <= reg140;
              reg134 <= reg144[(4'ha):(4'h9)];
              reg135 <= wire127[(4'ha):(3'h4)];
              reg136 <= wire121;
            end
          if (wire126)
            begin
              reg137 <= {$unsigned($signed(wire106[(4'he):(4'hd)])),
                  (!$signed(reg138[(3'h5):(1'h0)]))};
              reg138 <= $signed(reg143);
            end
          else
            begin
              reg137 <= reg145;
              reg138 <= (~reg138[(5'h11):(5'h11)]);
              reg139 <= $unsigned((^~(($signed(reg139) >>> reg112[(4'hc):(3'h6)]) ?
                  reg115[(1'h0):(1'h0)] : {$unsigned((8'hb5)),
                      $signed(reg139)})));
            end
        end
      reg147 <= reg140[(1'h1):(1'h1)];
    end
  assign wire148 = wire124;
endmodule
