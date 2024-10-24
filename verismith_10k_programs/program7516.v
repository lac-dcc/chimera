module top
#(parameter param175 = (({((-(8'hbf)) ? (|(8'h9d)) : ((8'hab) || (7'h42))), ((~|(8'hb2)) ^~ ((8'hb0) ? (8'ha9) : (7'h44)))} >> {{(-(8'hbd))}, (|((8'hb6) ? (8'haf) : (8'hb9)))}) - (+((((8'hab) << (8'hb1)) ? ((8'hb0) ? (8'hb4) : (8'hbc)) : (^(7'h42))) ? (((8'hb2) ^~ (8'had)) ? ((8'haf) ? (8'hb9) : (8'hbc)) : ((8'ha2) ^~ (8'hb1))) : ((^(8'hac)) | (8'hac))))), 
parameter param176 = (param175 ? (param175 ? (+(param175 - {param175})) : (+((param175 ? param175 : (7'h40)) ? (|param175) : (&(8'had))))) : ((((param175 ? (8'hb0) : param175) && (param175 ^~ param175)) ? (~|param175) : {(param175 ? param175 : param175), {(7'h44)}}) > param175)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  wire [(4'h8):(1'h0)] wire174;
  wire [(4'h9):(1'h0)] wire172;
  wire signed [(5'h15):(1'h0)] wire171;
  wire signed [(4'h8):(1'h0)] wire163;
  wire [(5'h11):(1'h0)] wire161;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire152;
  wire signed [(5'h11):(1'h0)] wire154;
  wire [(5'h13):(1'h0)] wire156;
  wire signed [(5'h13):(1'h0)] wire157;
  wire [(4'hc):(1'h0)] wire159;
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg [(4'h9):(1'h0)] reg170 = (1'h0);
  reg [(3'h6):(1'h0)] reg169 = (1'h0);
  reg [(4'h9):(1'h0)] reg168 = (1'h0);
  reg [(4'hf):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  reg [(4'he):(1'h0)] reg165 = (1'h0);
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  assign y = {wire174,
                 wire172,
                 wire171,
                 wire163,
                 wire161,
                 wire4,
                 wire51,
                 wire53,
                 wire54,
                 wire55,
                 wire152,
                 wire154,
                 wire156,
                 wire157,
                 wire159,
                 reg173,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 (1'h0)};
  assign wire4 = wire3[(1'h1):(1'h1)];
  module5 #() modinst52 (wire51, clk, wire0, wire4, wire2, wire1);
  assign wire53 = $unsigned((~&((!(^~wire2)) ? wire0[(4'hd):(4'hb)] : wire2)));
  assign wire54 = (|((-$unsigned(wire53)) ? wire1[(2'h3):(2'h3)] : wire53));
  assign wire55 = wire51;
  module56 #() modinst153 (.clk(clk), .wire57(wire0), .wire59(wire4), .y(wire152), .wire58(wire2), .wire60(wire53));
  module56 #() modinst155 (wire154, clk, wire53, wire0, wire54, wire51);
  assign wire156 = wire0;
  module61 #() modinst158 (.wire63(wire4), .wire64(wire2), .wire62(wire1), .y(wire157), .clk(clk), .wire65(wire152));
  module103 #() modinst160 (wire159, clk, wire154, wire51, wire0, wire55, wire54);
  module56 #() modinst162 (wire161, clk, wire55, wire2, wire0, wire156);
  assign wire163 = $signed(((^~wire159[(2'h3):(2'h3)]) ?
                       wire159 : (+(wire161[(4'hd):(4'h8)] ?
                           $signed(wire2) : wire0))));
  always
    @(posedge clk) begin
      if (wire4[(3'h4):(2'h2)])
        begin
          reg164 <= $unsigned({$unsigned($signed({(8'hba)})),
              (wire4[(5'h15):(5'h10)] ?
                  wire156 : $unsigned($unsigned(wire55)))});
          reg165 <= wire1[(4'h9):(4'h9)];
          reg166 <= (-$signed((~^{wire154[(4'h9):(2'h3)]})));
          reg167 <= $unsigned(wire4[(4'hb):(1'h1)]);
          reg168 <= (^wire4[(5'h11):(2'h3)]);
        end
      else
        begin
          reg164 <= (~^($signed(((|wire51) + (wire54 ?
              wire55 : wire4))) != wire152[(3'h4):(2'h2)]));
          reg165 <= ($signed((wire154[(4'he):(2'h2)] <<< $unsigned(((8'ha0) ?
                  (8'ha1) : wire2)))) ?
              wire51[(5'h10):(4'h9)] : reg168[(4'h9):(2'h2)]);
        end
      reg169 <= {$signed(($unsigned((-(8'hac))) || (wire156 ?
              wire51[(4'hb):(1'h0)] : (wire0 ? (7'h40) : wire4))))};
      reg170 <= (wire154[(4'hc):(1'h0)] ?
          (($signed($signed(wire152)) ?
                  ((8'hbd) ? {reg167, wire154} : $signed(reg166)) : ((wire154 ?
                          wire161 : wire154) ?
                      $signed(wire152) : (wire154 != (8'ha0)))) ?
              ($unsigned((wire51 * (7'h42))) ?
                  (wire161[(3'h7):(1'h0)] <<< $signed((8'h9c))) : wire55) : wire55[(4'ha):(3'h4)]) : $unsigned(({wire0[(2'h3):(2'h2)],
                  (wire161 < wire152)} ?
              $signed(wire154) : $signed($unsigned(wire53)))));
    end
  assign wire171 = reg170[(1'h0):(1'h0)];
  assign wire172 = (($signed(($signed(wire159) >>> (wire159 ?
                           (8'haa) : (8'ha5)))) ?
                       reg166[(4'hb):(2'h2)] : wire156[(2'h2):(2'h2)]) + wire152);
  always
    @(posedge clk) begin
      reg173 <= (8'hb8);
    end
  assign wire174 = wire157[(2'h2):(1'h0)];
endmodule

module module56
#(parameter param150 = ((((((8'hbb) + (8'hb4)) || {(8'hba), (8'ha7)}) << (((8'hab) - (8'haa)) ? ((8'ha7) ? (8'hb1) : (8'hb4)) : ((8'haa) ? (8'had) : (8'hbc)))) <<< (~|(~|(8'ha9)))) ? {{(~(^~(8'ha4)))}, (({(8'haa)} == (~|(8'ha4))) * (((8'hac) ? (7'h40) : (8'hbe)) ? ((8'hb8) - (8'hae)) : (^~(8'ha4))))} : (8'hb8)), 
parameter param151 = (^~(param150 ? ({(~&param150), (param150 <<< param150)} ? param150 : (^(param150 || param150))) : (^param150))))
(y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire60;
  input wire [(5'h15):(1'h0)] wire59;
  input wire [(4'hd):(1'h0)] wire58;
  input wire [(5'h10):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire149;
  wire [(4'hf):(1'h0)] wire148;
  wire [(4'hd):(1'h0)] wire146;
  wire [(5'h12):(1'h0)] wire102;
  wire [(5'h11):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire79;
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire146,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire86,
                 wire85,
                 wire84,
                 wire81,
                 wire79,
                 reg82,
                 reg83,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 (1'h0)};
  module61 #() modinst80 (wire79, clk, wire59, wire60, wire58, wire57);
  assign wire81 = ($unsigned(wire60) ?
                      $unsigned($signed(wire79)) : $signed((wire60 != wire79)));
  always
    @(posedge clk) begin
      reg82 <= (8'hbc);
      reg83 <= wire60;
    end
  assign wire84 = (8'h9f);
  assign wire85 = wire58[(3'h4):(1'h1)];
  assign wire86 = wire57;
  always
    @(posedge clk) begin
      if (reg83[(4'ha):(1'h0)])
        begin
          reg87 <= (8'hba);
        end
      else
        begin
          reg87 <= $signed($unsigned($signed(reg87[(4'h8):(4'h8)])));
          reg88 <= ($signed($unsigned($unsigned(wire86[(3'h5):(2'h3)]))) ?
              wire60 : wire79);
        end
      if (((wire81[(3'h6):(3'h5)] != (((wire81 ~^ wire58) >>> (~wire59)) ?
          reg82 : wire79)) > wire85[(3'h5):(2'h2)]))
        begin
          reg89 <= {$unsigned(wire81[(3'h5):(3'h5)]),
              $unsigned({((reg88 ^~ reg87) ?
                      (wire81 ^ reg88) : (wire85 ? wire86 : wire85)),
                  $unsigned(wire58[(3'h5):(1'h1)])})};
          reg90 <= (wire58 ?
              {reg89,
                  (((reg89 ? wire59 : (8'hbf)) ?
                      $signed((8'hbe)) : {wire59,
                          (7'h44)}) ~^ $signed((~&reg88)))} : wire84);
          reg91 <= $signed(wire85[(4'hc):(2'h2)]);
        end
      else
        begin
          if ($unsigned((!wire81)))
            begin
              reg89 <= (^~$signed(reg87[(1'h0):(1'h0)]));
              reg90 <= $unsigned((+($unsigned({(8'hb5)}) >= (^$unsigned(wire79)))));
              reg91 <= (|$signed({wire57[(3'h6):(1'h1)]}));
              reg92 <= (wire59 >>> ({(~(wire58 * wire85))} >>> reg89[(2'h3):(1'h1)]));
              reg93 <= $unsigned(reg82);
            end
          else
            begin
              reg89 <= (8'ha8);
            end
          reg94 <= (($unsigned(wire86[(3'h7):(3'h7)]) >> $signed(wire86[(3'h4):(2'h2)])) * (wire81[(3'h7):(3'h5)] ?
              ((reg90 ?
                  ((7'h44) ?
                      reg82 : wire85) : (8'hb0)) - reg82[(1'h0):(1'h0)]) : wire84[(4'hf):(3'h5)]));
        end
      reg95 <= $unsigned(reg89);
      reg96 <= (reg92 ? reg92 : (reg87[(3'h4):(2'h3)] > (8'hb1)));
      reg97 <= ((!reg91) * (^$signed($signed(((8'hb7) ? reg82 : wire60)))));
    end
  assign wire98 = ({({(reg89 >> reg88)} * {$signed((7'h44)),
                          (reg87 ? wire79 : reg89)})} | ((((-wire79) ?
                              (|reg95) : (&wire81)) ?
                          (^~$signed(reg97)) : ((reg88 > reg82) <<< {reg87})) ?
                      reg96[(4'ha):(1'h0)] : (reg89 <= $signed(reg90))));
  assign wire99 = reg91[(1'h1):(1'h0)];
  assign wire100 = (((^~$unsigned(((7'h42) < (8'haf)))) ?
                       (~|$signed(reg94)) : reg94[(3'h4):(2'h2)]) < $unsigned((^~reg90)));
  assign wire101 = (~&wire58);
  assign wire102 = $signed($unsigned(wire79));
  module103 #() modinst147 (.wire108(reg92), .wire106(reg90), .wire104(wire101), .clk(clk), .wire107(wire81), .wire105(reg96), .y(wire146));
  assign wire148 = wire98[(4'ha):(1'h1)];
  assign wire149 = ($signed($signed($unsigned(reg95))) ^~ reg88[(4'h9):(3'h4)]);
endmodule

module module5
#(parameter param50 = (({((~|(8'h9c)) ? {(8'ha8), (8'hba)} : ((8'hbc) <= (8'hab)))} ~^ {((~&(8'ha7)) ? {(8'hb0), (8'ha5)} : (^(8'ha0)))}) ? ((&(((8'hab) ~^ (8'hb3)) ? ((8'hbf) ? (8'hb7) : (8'hae)) : ((8'ha5) > (8'hbb)))) >>> ((((8'hb8) << (8'ha5)) ? ((8'hbb) ? (8'hb2) : (8'hbc)) : ((7'h42) >>> (8'hb5))) ? ((|(7'h43)) > (^~(8'haa))) : ((^(8'ha3)) | {(7'h43)}))) : (~&({((8'hbc) & (8'ha4)), (~&(8'hb0))} ^~ (&(|(8'ha1)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  assign y = {wire48, wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = $signed($signed($unsigned(wire6[(3'h7):(2'h2)])));
  assign wire11 = (((^wire8) >> $unsigned({(wire10 & wire6),
                      $signed((8'hb2))})) >>> ($signed($signed((wire9 ?
                          wire6 : wire8))) ?
                      wire8[(2'h2):(1'h1)] : wire10));
  assign wire12 = $signed(($signed(wire7) >= wire6));
  assign wire13 = $signed(wire12[(1'h1):(1'h0)]);
  assign wire14 = wire7[(1'h0):(1'h0)];
  module15 #() modinst49 (.wire16(wire11), .clk(clk), .wire19(wire7), .wire17(wire14), .y(wire48), .wire18(wire9));
endmodule

module module15
#(parameter param47 = (-(^~((~|((8'hb7) ? (8'hb9) : (7'h41))) ~^ (8'ha8)))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire19;
  input wire [(4'hd):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  input wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire20;
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  assign y = {wire46,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire20,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg38,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire20 = (~$unsigned(($unsigned($signed((8'ha0))) & ($signed(wire19) ?
                      $signed(wire19) : (wire17 ? wire18 : wire18)))));
  always
    @(posedge clk) begin
      reg21 <= wire18;
      if ($unsigned($signed(wire18)))
        begin
          reg22 <= wire20;
          reg23 <= $signed(wire18[(4'hc):(4'ha)]);
        end
      else
        begin
          reg22 <= $unsigned(wire20);
        end
    end
  assign wire24 = ({$signed((^~((7'h43) ? wire16 : reg21)))} ?
                      reg23[(1'h0):(1'h0)] : (~^$unsigned({wire19})));
  assign wire25 = $unsigned({({(wire20 > wire19), $signed((8'hb1))} ?
                          ($unsigned(wire20) * ((8'hb6) << reg23)) : $unsigned($unsigned(wire19)))});
  assign wire26 = (((((wire24 ?
                      wire18 : wire24) << $unsigned(reg22)) - $signed({reg22,
                      (8'hbe)})) && wire24[(4'hb):(3'h7)]) * (8'hbc));
  assign wire27 = ($unsigned($unsigned((~^(reg22 ? wire17 : reg22)))) ?
                      $unsigned(wire18) : wire20[(4'he):(3'h4)]);
  assign wire28 = ({$unsigned($unsigned($signed(reg21)))} ?
                      (($unsigned(reg23) ?
                              $signed(wire26[(3'h5):(2'h2)]) : wire20) ?
                          $unsigned({$signed(wire26)}) : ((wire26 >> $signed(wire19)) ?
                              $unsigned(((8'ha9) <= wire19)) : (8'had))) : $signed($unsigned((reg22[(3'h4):(1'h1)] ?
                          (reg21 * wire26) : wire17[(4'h9):(1'h0)]))));
  assign wire29 = wire28;
  assign wire30 = (wire19[(2'h3):(2'h2)] ?
                      $unsigned(wire29) : (^~$unsigned(((wire25 <<< (7'h42)) ?
                          $unsigned(wire25) : reg23))));
  assign wire31 = ($unsigned($unsigned(($signed(wire16) * $signed(wire26)))) ~^ wire20[(1'h1):(1'h1)]);
  assign wire32 = ({$signed(wire31)} | (wire30 * (wire19 & wire18[(2'h2):(2'h2)])));
  assign wire33 = $unsigned((reg22 ?
                      reg23 : $signed($signed($signed(wire24)))));
  assign wire34 = (~|$unsigned((({(8'ha3), reg22} ?
                          (reg23 ^~ (8'ha2)) : (~|wire27)) ?
                      $signed(reg23) : {wire30[(1'h0):(1'h0)],
                          $unsigned(wire17)})));
  assign wire35 = $signed($unsigned($unsigned((-(reg22 ? wire33 : (8'hb8))))));
  assign wire36 = wire17;
  assign wire37 = ((|{wire30}) <= (&wire25[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg38 <= (^~wire29);
    end
  assign wire39 = wire36[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if (((+$signed(wire26)) >> ($signed(((wire35 + wire16) | (wire18 || (8'hb7)))) > $unsigned((reg23 ?
          (wire27 ? (8'h9d) : wire30) : $signed(wire36))))))
        begin
          reg40 <= $signed($unsigned($unsigned(reg22[(3'h7):(2'h2)])));
        end
      else
        begin
          reg40 <= $signed((($unsigned(wire32) ?
              $signed((8'ha8)) : $unsigned((wire16 ?
                  wire37 : (7'h42)))) <<< (~^((|wire24) ~^ (+wire34)))));
          reg41 <= {reg40[(2'h2):(1'h1)]};
          reg42 <= wire16[(3'h4):(1'h1)];
          reg43 <= {(wire31 <<< wire18), wire32};
        end
      reg44 <= $signed(($unsigned(($signed(wire19) ?
          $unsigned((8'hb5)) : (wire30 ? wire18 : (8'haf)))) != ((wire33 ?
          $signed((8'hb5)) : $signed(reg43)) - reg21)));
      reg45 <= {($signed($signed(wire35)) ? (+wire26) : reg42[(1'h0):(1'h0)])};
    end
  assign wire46 = $unsigned($signed(((~&{wire32}) ?
                      wire29[(3'h5):(2'h3)] : ((wire29 >>> wire30) ?
                          wire37 : (wire34 & reg23)))));
endmodule

module module103  (y, clk, wire108, wire107, wire106, wire105, wire104);
  output wire [(32'h1a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire108;
  input wire [(3'h5):(1'h0)] wire107;
  input wire [(3'h7):(1'h0)] wire106;
  input wire [(5'h14):(1'h0)] wire105;
  input wire [(2'h3):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire145;
  wire signed [(4'he):(1'h0)] wire141;
  wire [(3'h5):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire signed [(5'h11):(1'h0)] wire109;
  reg [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(5'h11):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  assign y = {wire145,
                 wire141,
                 wire140,
                 wire132,
                 wire131,
                 wire116,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 reg144,
                 reg143,
                 reg142,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
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
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire109 = ((($signed({wire105,
                               wire108}) & $unsigned(wire104[(2'h3):(1'h0)])) ?
                           ((wire107[(3'h5):(1'h1)] ?
                                   wire107 : (wire104 ? wire104 : wire104)) ?
                               wire106[(1'h1):(1'h0)] : wire108[(4'h9):(4'h9)]) : (((wire105 ?
                               (8'hb0) : wire108) * (^wire108)) ^~ wire107)) ?
                       wire106 : (!(($signed(wire106) ?
                           wire105[(4'hb):(1'h1)] : $unsigned(wire104)) >= wire104)));
  assign wire110 = (wire108 + wire104);
  assign wire111 = {(&$unsigned({(wire105 ? wire107 : wire109),
                           $unsigned(wire104)})),
                       ($unsigned(wire109[(5'h11):(4'hd)]) & {{$signed(wire106)},
                           $unsigned($unsigned(wire105))})};
  assign wire112 = $signed($unsigned(wire108[(4'hb):(4'ha)]));
  assign wire113 = wire111[(4'hb):(1'h1)];
  always
    @(posedge clk) begin
      reg114 <= {($unsigned(wire104[(1'h1):(1'h0)]) ?
              wire109 : wire111[(1'h0):(1'h0)]),
          wire108};
      reg115 <= (((~|wire112) > wire106) ?
          wire104[(2'h3):(1'h1)] : {$unsigned(wire106)});
    end
  assign wire116 = (^(^~wire107[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg117 <= wire111[(3'h4):(1'h0)];
      reg118 <= wire113;
      reg119 <= wire107[(2'h2):(1'h0)];
      if (wire107)
        begin
          reg120 <= $unsigned(($unsigned((^$unsigned(wire107))) - (!(wire113[(1'h1):(1'h1)] || reg114[(4'h8):(3'h4)]))));
          reg121 <= wire111;
          if ((({$unsigned(wire110),
              (-((8'hbd) ? reg117 : reg115))} != reg121) <= wire105))
            begin
              reg122 <= wire111[(3'h7):(1'h0)];
              reg123 <= $unsigned($unsigned(wire108[(4'hb):(2'h3)]));
            end
          else
            begin
              reg122 <= reg117[(4'hd):(3'h7)];
            end
        end
      else
        begin
          if ($signed($signed(wire105)))
            begin
              reg120 <= wire105;
              reg121 <= {wire111,
                  (reg119 != ((((7'h44) ^~ reg122) ?
                      ((8'ha1) != reg123) : $signed(reg119)) != ($signed(reg114) != ((8'ha1) ?
                      wire112 : wire110))))};
            end
          else
            begin
              reg120 <= (~|($unsigned(reg121[(4'hc):(4'hb)]) ?
                  (^~wire112) : $unsigned((reg118[(3'h4):(1'h1)] ?
                      ((8'hb0) ^~ wire106) : (reg118 <= wire107)))));
            end
          if ($signed({$unsigned(reg122)}))
            begin
              reg122 <= {$unsigned((8'ha7)),
                  {wire109[(1'h1):(1'h0)], $signed(reg114[(2'h2):(2'h2)])}};
            end
          else
            begin
              reg122 <= reg122[(3'h5):(2'h3)];
              reg123 <= wire113[(4'h8):(3'h6)];
              reg124 <= (+($unsigned((((7'h44) ~^ reg114) ?
                      wire113[(3'h5):(1'h1)] : (~&reg122))) ?
                  ($signed((~^reg123)) ?
                      {((8'ha6) ?
                              reg121 : wire104)} : (!$unsigned(wire104))) : $signed({$signed(wire113)})));
              reg125 <= ($unsigned($signed($unsigned((~^reg117)))) ?
                  $unsigned($signed($unsigned($signed(reg117)))) : reg123);
            end
          if ((~($signed(((reg125 * (8'hbd)) | $signed((8'hb8)))) < reg120)))
            begin
              reg126 <= wire107[(3'h5):(2'h2)];
              reg127 <= (((wire116[(3'h7):(3'h4)] != (&(!wire107))) | (^reg119)) ?
                  ({($unsigned(reg118) ?
                              (wire113 ? wire104 : wire106) : (reg122 ?
                                  reg125 : reg119)),
                          $unsigned($unsigned((8'ha7)))} ?
                      wire111 : reg122[(3'h7):(2'h2)]) : wire110[(4'hf):(3'h7)]);
            end
          else
            begin
              reg126 <= ({$signed((+reg123)), reg118[(4'hc):(2'h3)]} ?
                  reg127 : $unsigned(($signed({(8'ha1), reg121}) & (reg120 ?
                      $signed(reg122) : reg124))));
            end
          reg128 <= (($unsigned((reg123[(1'h1):(1'h1)] ?
                  reg127[(4'he):(4'hd)] : wire108)) ?
              $unsigned($unsigned({wire112})) : (~&wire109[(4'h8):(3'h5)])) * (~|$signed($signed($unsigned(reg121)))));
          reg129 <= (-(reg122 ?
              wire113 : (+{{reg119}, (wire106 ? reg120 : reg125)})));
        end
      reg130 <= $unsigned($unsigned({reg123, (^~$signed(wire113))}));
    end
  assign wire131 = (8'hbd);
  assign wire132 = (($signed({(wire108 ?
                           wire105 : reg127)}) <<< wire111) | $signed($signed(reg121[(5'h10):(4'hd)])));
  always
    @(posedge clk) begin
      if (reg118[(3'h5):(2'h2)])
        begin
          reg133 <= (reg128[(3'h4):(1'h1)] ?
              reg115 : $unsigned(($unsigned((~wire112)) != ($signed(reg120) ?
                  (&wire113) : $unsigned(wire113)))));
          reg134 <= wire104;
          if ($signed((wire111[(4'h9):(4'h8)] >>> (+reg129[(2'h3):(2'h2)]))))
            begin
              reg135 <= ($signed($signed((^((8'hb4) || (8'hbc))))) ?
                  {($signed($signed(reg123)) ?
                          reg119[(4'hc):(3'h7)] : $unsigned($signed(reg133)))} : reg129[(1'h1):(1'h1)]);
              reg136 <= (+(|($signed((reg124 <= reg117)) ?
                  (reg118[(1'h1):(1'h1)] == (~&(7'h42))) : (7'h44))));
              reg137 <= {(~&$signed(((reg118 ? reg119 : (8'h9d)) ?
                      wire105[(5'h11):(4'ha)] : (8'h9f)))),
                  reg123};
            end
          else
            begin
              reg135 <= (($unsigned($signed((wire107 ?
                      (8'h9d) : wire107))) <<< ($unsigned((-wire113)) | reg117[(4'h9):(4'h8)])) ?
                  ($unsigned((wire131 - (reg135 ? reg126 : (8'hba)))) ?
                      (reg125 >>> $unsigned($unsigned(reg125))) : wire107) : reg128);
              reg136 <= ((~|$unsigned((~|$signed(reg118)))) >= ((&reg119) ?
                  {{(+reg127), (reg134 ? (8'ha2) : reg117)},
                      {$unsigned((8'hb2))}} : wire112[(3'h6):(2'h2)]));
              reg137 <= $unsigned(reg129);
              reg138 <= ((reg122[(4'h9):(4'h9)] | (~^($signed(reg128) ?
                      (8'ha6) : ((8'ha8) ? reg120 : (8'hbf))))) ?
                  ({(~|$unsigned(wire107))} ?
                      wire106 : $unsigned(wire131[(4'hd):(4'ha)])) : (7'h43));
            end
          reg139 <= reg130[(4'ha):(3'h4)];
        end
      else
        begin
          reg133 <= reg120;
          reg134 <= (wire112[(3'h7):(1'h1)] == reg137);
          reg135 <= $unsigned(wire109);
          if (reg122)
            begin
              reg136 <= reg130[(1'h0):(1'h0)];
              reg137 <= {(~&$signed((&{reg125, reg130})))};
              reg138 <= $signed($signed($signed((reg134 ?
                  (8'ha3) : {(7'h40), wire108}))));
            end
          else
            begin
              reg136 <= wire104[(1'h0):(1'h0)];
              reg137 <= (((reg130[(3'h4):(1'h1)] ^ reg121) ?
                      (-({wire106} << $signed(wire111))) : $signed($unsigned(reg130[(4'hb):(4'ha)]))) ?
                  (^{reg120[(2'h3):(1'h1)]}) : wire107);
            end
        end
    end
  assign wire140 = reg135[(4'hb):(2'h2)];
  assign wire141 = $signed(wire108);
  always
    @(posedge clk) begin
      reg142 <= reg136;
      reg143 <= ($signed($signed((((8'hb0) ^~ wire140) ?
              wire141[(2'h2):(1'h0)] : wire131[(5'h11):(2'h3)]))) ?
          (~|{$unsigned(wire106[(3'h7):(3'h4)])}) : reg117);
      reg144 <= $signed(((wire111[(3'h4):(1'h0)] ?
              ($signed(reg118) ?
                  $unsigned(reg128) : (^reg123)) : $signed((wire108 > wire108))) ?
          (!((reg125 ?
              reg124 : (8'ha8)) == $unsigned((8'had)))) : (reg136[(3'h5):(2'h2)] - ((+reg115) ?
              $signed(reg139) : $unsigned(wire140)))));
    end
  assign wire145 = (((~|$signed($unsigned(reg126))) & wire111[(3'h5):(1'h0)]) ?
                       $unsigned(((^wire116[(3'h6):(2'h3)]) ?
                           ((reg142 ? reg119 : wire113) ?
                               reg139[(3'h7):(2'h3)] : (^~reg127)) : wire140)) : (($signed((-wire108)) - ((&reg124) != (wire105 != reg126))) ?
                           wire140[(1'h1):(1'h1)] : {$signed($signed(wire141)),
                               $unsigned((^~(8'hb8)))}));
endmodule

module module61
#(parameter param77 = (~|{{(((8'hb1) ? (8'hb5) : (8'ha3)) - (~^(8'hbb))), ((!(8'ha6)) != {(8'h9d), (8'hb5)})}, ((((8'h9f) ? (8'hb1) : (7'h44)) ? ((8'haa) + (8'hb4)) : ((8'ha9) < (8'hb0))) ^~ (((8'hb7) ? (8'haf) : (8'h9f)) != ((8'hba) ? (8'hb3) : (8'hbb))))}), 
parameter param78 = {(+param77)})
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire65;
  input wire [(5'h13):(1'h0)] wire64;
  input wire [(4'hd):(1'h0)] wire63;
  input wire signed [(4'ha):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire68,
                 wire67,
                 wire66,
                 reg69,
                 (1'h0)};
  assign wire66 = wire64;
  assign wire67 = $signed($unsigned(((^~wire62) ?
                      $signed($signed(wire62)) : (^(wire65 ?
                          wire65 : wire63)))));
  assign wire68 = $signed(((($signed(wire67) >> (wire65 + wire65)) <<< $unsigned((!wire67))) ?
                      wire65 : $signed(($unsigned(wire64) >= (~&wire63)))));
  always
    @(posedge clk) begin
      reg69 <= (~|$unsigned($unsigned($signed((wire62 ? wire62 : wire67)))));
    end
  assign wire70 = wire68;
  assign wire71 = $signed(wire70);
  assign wire72 = wire67;
  assign wire73 = ($unsigned($signed(((wire68 >= wire63) ?
                          $signed(wire62) : reg69))) ?
                      (~^$unsigned($unsigned($unsigned(wire62)))) : wire66[(2'h3):(2'h3)]);
  assign wire74 = wire73;
  assign wire75 = $unsigned((wire70[(4'hb):(1'h0)] ?
                      ({(wire71 <= wire67),
                          $unsigned(wire73)} | ($signed(wire64) ^~ (wire65 ?
                          reg69 : wire67))) : wire72));
  assign wire76 = $unsigned((-(~^((wire70 ? (8'h9d) : wire68) || wire66))));
endmodule
