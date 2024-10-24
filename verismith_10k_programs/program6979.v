module top
#(parameter param216 = (&(!(((|(8'ha5)) & (^(8'haf))) | (~(-(8'h9e)))))), 
parameter param217 = (({((param216 ^ param216) * (-param216))} ? (-(~&(param216 ? (8'h9c) : param216))) : (((-param216) << (param216 ? param216 : param216)) && ((param216 ? param216 : param216) != (^param216)))) + ((~^(^param216)) ~^ (~^(param216 ? param216 : {param216})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire215;
  wire [(5'h15):(1'h0)] wire211;
  wire [(4'hd):(1'h0)] wire128;
  wire signed [(5'h14):(1'h0)] wire124;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire213;
  reg signed [(4'hb):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  assign y = {wire215,
                 wire211,
                 wire128,
                 wire124,
                 wire5,
                 wire213,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire5 = (~(^~{wire3}));
  module6 #() modinst125 (.clk(clk), .wire8(wire2), .wire9(wire4), .wire10(wire5), .wire7(wire0), .y(wire124));
  always
    @(posedge clk) begin
      reg126 <= $unsigned((($signed({wire2}) ?
          wire4[(5'h11):(3'h7)] : $unsigned($signed(wire2))) | (wire5[(4'he):(4'hb)] ?
          ((wire1 ^~ wire4) <<< (wire4 || wire124)) : ((|wire5) ?
              ((8'ha9) ? wire1 : wire0) : wire124))));
      reg127 <= wire5[(2'h2):(1'h0)];
    end
  assign wire128 = $unsigned((7'h44));
  module129 #() modinst212 (.wire132(wire0), .wire134(wire4), .y(wire211), .wire133(wire3), .wire131(wire5), .wire130(wire124), .clk(clk));
  module135 #() modinst214 (wire213, clk, wire128, wire2, wire0, wire3, wire1);
  assign wire215 = {wire5[(4'hc):(1'h0)]};
endmodule

module module129
#(parameter param209 = (~^(((~(~^(8'hb8))) ? ((+(8'h9f)) != ((8'hb9) == (8'h9c))) : (~^((8'hb4) ? (8'hbd) : (8'hbc)))) ^~ ((((8'h9f) ? (8'hb4) : (8'had)) <= (^~(8'hab))) ? (((7'h40) ^~ (8'ha0)) ? ((8'hb5) != (8'hb0)) : ((8'ha0) ? (8'hb1) : (8'ha7))) : ({(8'had)} >>> ((8'ha6) ? (8'hb2) : (8'h9f)))))), 
parameter param210 = ({(^~{(param209 ? param209 : param209)})} ? (param209 ? ((param209 ^~ (!param209)) ? ((8'hbd) && (~|param209)) : param209) : param209) : (+(((param209 ? param209 : param209) * (param209 >>> param209)) ~^ (~^((8'hbe) | param209))))))
(y, clk, wire134, wire133, wire132, wire131, wire130);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire134;
  input wire [(5'h15):(1'h0)] wire133;
  input wire [(5'h11):(1'h0)] wire132;
  input wire signed [(5'h13):(1'h0)] wire131;
  input wire [(5'h14):(1'h0)] wire130;
  wire [(3'h7):(1'h0)] wire208;
  wire [(4'he):(1'h0)] wire163;
  wire [(3'h5):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire166;
  wire [(4'hd):(1'h0)] wire206;
  reg signed [(4'hc):(1'h0)] reg168 = (1'h0);
  reg [(5'h15):(1'h0)] reg167 = (1'h0);
  assign y = {wire208,
                 wire163,
                 wire165,
                 wire166,
                 wire206,
                 reg168,
                 reg167,
                 (1'h0)};
  module135 #() modinst164 (wire163, clk, wire131, wire134, wire132, wire130, wire133);
  assign wire165 = wire132[(4'hd):(4'h8)];
  assign wire166 = ({(!wire163)} ?
                       {$signed(wire130[(5'h13):(4'h9)]),
                           $signed($unsigned((~|wire131)))} : wire132);
  always
    @(posedge clk) begin
      reg167 <= wire166[(2'h3):(2'h3)];
      reg168 <= (wire166 * $unsigned($unsigned($signed(wire131[(3'h5):(3'h5)]))));
    end
  module169 #() modinst207 (.wire170(wire131), .wire171(wire130), .wire172(wire163), .wire173(reg168), .wire174(reg167), .clk(clk), .y(wire206));
  assign wire208 = ($signed((wire132[(4'h8):(3'h4)] ~^ ($unsigned(wire165) ?
                       (&(8'hbf)) : (wire134 ?
                           reg168 : wire163)))) + (+(wire132[(2'h3):(2'h3)] ?
                       $unsigned(wire133) : wire130[(2'h2):(1'h0)])));
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h2dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire123;
  wire signed [(4'ha):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  wire [(4'hc):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg signed [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire110,
                 wire109,
                 wire108,
                 wire106,
                 wire37,
                 wire36,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $unsigned($signed(wire9[(1'h0):(1'h0)]));
      reg12 <= ((&$signed(wire8)) ?
          (+$unsigned(((8'ha6) ~^ (wire8 ?
              (8'ha1) : wire9)))) : {($unsigned($unsigned(wire10)) <<< $signed(wire8))});
      reg13 <= $signed($unsigned((-{$signed(wire10)})));
      reg14 <= $signed({$unsigned(((wire8 ?
              wire8 : wire8) | $unsigned(wire10)))});
      if (wire7[(4'h9):(2'h2)])
        begin
          reg15 <= $signed((!reg11[(1'h0):(1'h0)]));
          reg16 <= wire8[(3'h4):(2'h2)];
          reg17 <= (!(reg11[(4'h9):(2'h3)] ?
              $signed((!(wire7 > wire7))) : reg11[(5'h10):(4'ha)]));
          reg18 <= wire9[(1'h0):(1'h0)];
        end
      else
        begin
          reg15 <= (|(8'hb5));
          reg16 <= (reg14[(2'h2):(1'h0)] ^~ (8'hbd));
          reg17 <= ($signed($unsigned(((reg11 ? reg14 : (8'hb0)) ?
                  (|reg17) : wire10))) ?
              (8'hbd) : ($signed($signed(((8'ha8) ?
                  reg14 : reg17))) | wire7[(4'ha):(3'h7)]));
        end
    end
  assign wire19 = ((reg13[(4'hc):(1'h1)] ?
                      $unsigned(((wire8 ?
                          reg11 : (8'hb4)) << reg15[(2'h2):(1'h1)])) : (&reg14[(3'h4):(1'h1)])) == (8'h9d));
  assign wire20 = reg16[(3'h4):(2'h3)];
  assign wire21 = ($unsigned(reg15[(2'h2):(2'h2)]) ?
                      reg11[(2'h3):(1'h1)] : $unsigned($unsigned({(wire20 ?
                              reg18 : reg17),
                          (8'hb4)})));
  assign wire22 = $unsigned((~&({reg13[(5'h11):(2'h3)],
                      (wire20 == reg12)} + $signed(reg13[(4'h9):(3'h6)]))));
  assign wire23 = reg18;
  always
    @(posedge clk) begin
      reg24 <= $signed($signed(wire20[(1'h0):(1'h0)]));
      if (((~^$signed($signed(reg16[(4'hb):(4'ha)]))) ?
          reg17 : $signed(reg24[(3'h7):(3'h5)])))
        begin
          reg25 <= (($unsigned(reg17) < $unsigned(($unsigned(wire22) == (wire21 ?
                  reg14 : reg16)))) ?
              reg13[(1'h1):(1'h0)] : reg24);
        end
      else
        begin
          reg25 <= reg18[(1'h1):(1'h0)];
          reg26 <= (~|$unsigned($signed((reg18 && (^wire10)))));
          reg27 <= ((-(wire23[(4'hf):(4'hb)] - {reg26,
              (wire9 ? wire19 : wire9)})) >= (reg12 ?
              (|((8'ha1) ? wire10[(3'h6):(3'h6)] : reg18)) : reg18));
        end
      reg28 <= ($signed(wire19[(3'h5):(2'h2)]) ?
          (~$signed(reg12[(4'h8):(2'h3)])) : wire23);
      if ($signed(reg25))
        begin
          if ({$signed($signed(reg27))})
            begin
              reg29 <= (reg11 ?
                  {reg18} : $unsigned($unsigned($signed({(7'h40)}))));
              reg30 <= {{((wire7[(4'hb):(4'h9)] ?
                              (reg28 ~^ reg27) : (wire19 <= (8'had))) ?
                          $unsigned($signed(wire22)) : wire23),
                      $unsigned((-reg18))},
                  (+{reg24[(4'he):(1'h0)]})};
              reg31 <= (+wire7);
              reg32 <= $unsigned(reg28);
            end
          else
            begin
              reg29 <= (|$signed((((reg15 ? wire19 : reg25) ?
                      (|wire23) : (~|(8'hae))) ?
                  ((reg25 >>> wire8) ?
                      ((8'hb6) ^ reg25) : $unsigned(reg11)) : {((8'hba) ?
                          reg17 : reg31)})));
              reg30 <= reg15;
            end
          reg33 <= (^$unsigned((8'hb5)));
          reg34 <= (~|wire7[(3'h4):(1'h0)]);
        end
      else
        begin
          reg29 <= $unsigned($unsigned($signed((((8'h9f) ?
              wire21 : reg26) <<< (reg25 <<< reg25)))));
          reg30 <= $signed((+reg31[(3'h5):(3'h5)]));
          reg31 <= $signed($signed((8'ha1)));
        end
      reg35 <= (~^(~&$signed($signed(reg14[(2'h3):(2'h3)]))));
    end
  assign wire36 = ({({reg30, $unsigned(reg17)} ? wire19 : $signed((+wire20))),
                          {({reg32} ? (reg17 ? wire22 : reg14) : (~^reg26)),
                              reg16}} ?
                      $signed((7'h40)) : (($signed(wire7[(2'h2):(2'h2)]) - $signed((wire22 ?
                              reg13 : (8'ha6)))) ?
                          wire23 : ($signed($signed(reg17)) ^ $signed((~^wire21)))));
  assign wire37 = $unsigned({(($signed(reg17) != {reg14, (8'haa)}) ?
                          (~^reg15) : (reg12 & $unsigned(reg28)))});
  always
    @(posedge clk) begin
      reg38 <= reg26[(4'h8):(4'h8)];
      reg39 <= $unsigned($unsigned($unsigned($unsigned((^~wire8)))));
      reg40 <= $signed(reg35);
      if (reg32[(4'hf):(4'hf)])
        begin
          if (reg11)
            begin
              reg41 <= reg29[(4'hd):(3'h4)];
            end
          else
            begin
              reg41 <= ((wire22 ? reg27 : $unsigned((^$signed((8'hac))))) ?
                  reg35 : $unsigned((!reg35[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          reg41 <= $unsigned($signed((reg18[(3'h7):(1'h1)] ?
              reg26[(5'h11):(5'h11)] : {wire23[(4'h8):(2'h2)]})));
          reg42 <= (($signed(($unsigned((8'ha5)) ?
              (wire23 ?
                  wire20 : reg11) : $unsigned(reg13))) >> (&{$signed(wire8)})) & reg31);
          if ((8'haf))
            begin
              reg43 <= reg27;
              reg44 <= {(&$unsigned({$unsigned((8'hba)), (~&reg26)})),
                  $signed((^~($signed(reg18) ? reg33 : {reg43})))};
              reg45 <= {reg13[(3'h5):(1'h1)], (^reg38[(3'h5):(3'h4)])};
              reg46 <= $unsigned(reg35[(1'h0):(1'h0)]);
            end
          else
            begin
              reg43 <= ($unsigned({reg18}) != $unsigned((8'ha9)));
            end
          if (((reg13[(2'h3):(1'h0)] ^ reg14) & $signed(($signed(reg14) ?
              reg43 : ((wire23 >> reg28) ?
                  (reg39 ? reg26 : (8'hab)) : (reg43 ? reg27 : (8'ha9)))))))
            begin
              reg47 <= wire37[(2'h3):(2'h3)];
              reg48 <= $unsigned(($unsigned(reg13) ^ (8'hbf)));
              reg49 <= reg14[(2'h3):(2'h3)];
            end
          else
            begin
              reg47 <= $unsigned(($signed(reg25[(1'h1):(1'h1)]) != reg40[(2'h3):(2'h3)]));
            end
          reg50 <= $unsigned((reg28[(4'hf):(2'h2)] ^ (~^$signed($unsigned(reg28)))));
        end
      reg51 <= $unsigned((($unsigned((reg44 ? (7'h42) : (7'h40))) >= reg39) ?
          $unsigned({(&wire19), (8'hbe)}) : wire22));
    end
  module52 #() modinst107 (wire106, clk, wire36, wire37, reg18, reg30);
  assign wire108 = $signed($unsigned(reg50));
  assign wire109 = wire7[(1'h0):(1'h0)];
  assign wire110 = wire8;
  always
    @(posedge clk) begin
      if ($signed(reg25))
        begin
          reg111 <= (wire7 ?
              reg51[(4'h8):(2'h3)] : $unsigned($unsigned((~^(wire10 ?
                  wire22 : reg51)))));
          reg112 <= reg49[(3'h6):(2'h2)];
        end
      else
        begin
          reg111 <= reg48[(3'h6):(1'h1)];
          reg112 <= reg42;
          reg113 <= ($signed(wire36) ?
              (~|$unsigned((~^$unsigned(wire23)))) : ($signed(((reg11 * reg35) ?
                      (reg44 >>> reg32) : $unsigned(wire8))) ?
                  wire22 : {wire22[(4'ha):(2'h2)],
                      ($signed(wire36) && reg27[(3'h6):(2'h2)])}));
          reg114 <= reg41;
          reg115 <= ((^~(-(reg17 ?
              (+wire22) : (reg46 ? reg41 : reg113)))) - reg43[(2'h2):(2'h2)]);
        end
      reg116 <= $signed($unsigned((wire19[(2'h3):(1'h1)] ?
          reg114[(4'hd):(3'h5)] : $signed({reg41, reg45}))));
      reg117 <= ($unsigned(wire36[(5'h12):(4'hb)]) ?
          (($signed(((7'h40) ? reg13 : reg18)) ?
                  $signed((reg45 ? (8'h9e) : reg17)) : (|(-reg24))) ?
              (+(8'h9f)) : $unsigned(reg46[(4'he):(3'h4)])) : {reg51,
              {($unsigned((8'haa)) ?
                      (reg27 ? reg115 : wire109) : (reg43 * wire20)),
                  wire108[(4'hf):(3'h6)]}});
      reg118 <= ($signed((reg47 ?
              (-(reg17 ? wire23 : reg27)) : $unsigned((wire7 ?
                  wire108 : (8'hae))))) ?
          wire37 : (|($unsigned($unsigned((8'h9d))) ?
              (|((8'had) | reg46)) : $signed({reg38}))));
    end
  assign wire119 = $signed(reg40);
  assign wire120 = ((^~reg26[(4'hf):(3'h4)]) != $unsigned({reg34,
                       (reg44[(4'h9):(3'h7)] >= reg117[(1'h0):(1'h0)])}));
  assign wire121 = (reg27[(3'h7):(3'h7)] + (!reg15[(1'h0):(1'h0)]));
  assign wire122 = (!$signed($unsigned($signed((reg118 >>> (8'ha5))))));
  assign wire123 = (~|reg13);
endmodule

module module52
#(parameter param105 = ((8'hab) || ((!((+(8'ha3)) < ((7'h43) <= (8'ha3)))) & ({(+(7'h43)), (|(8'ha7))} ? ({(8'h9c)} != ((7'h42) ? (8'hac) : (8'hac))) : (8'h9c)))))
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h237):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire56;
  input wire [(5'h12):(1'h0)] wire55;
  input wire signed [(4'ha):(1'h0)] wire54;
  input wire [(4'hd):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire103;
  wire [(4'hc):(1'h0)] wire102;
  wire [(4'h9):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire100;
  wire signed [(5'h14):(1'h0)] wire99;
  wire [(3'h6):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(5'h12):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire57;
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire83,
                 wire82,
                 wire81,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
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
                 (1'h0)};
  assign wire57 = $signed({(~|(wire53 ? wire54 : wire54[(4'h9):(4'h8)]))});
  assign wire58 = {(($signed($signed(wire55)) ?
                              (8'h9f) : (+$unsigned(wire54))) ?
                          $signed(wire54) : ($unsigned((~&wire55)) ?
                              ((^wire55) << $signed(wire56)) : $signed((~&wire56))))};
  assign wire59 = wire58;
  assign wire60 = (~&$signed((wire53 ?
                      (~^wire54[(2'h2):(1'h1)]) : ((wire58 >> wire56) < (8'hb2)))));
  assign wire61 = (&{((wire55[(4'h9):(1'h0)] ?
                          (wire55 ?
                              wire54 : wire57) : wire56) - ((wire60 > (8'hb0)) ?
                          (wire59 ? (8'hba) : (8'ha7)) : {(8'hbe), wire53})),
                      (wire56[(4'h8):(4'h8)] ?
                          wire53 : (^wire53[(3'h7):(3'h4)]))});
  always
    @(posedge clk) begin
      reg62 <= (wire59 | (wire61[(2'h3):(2'h3)] + ($signed($signed(wire58)) ?
          ($signed(wire54) ?
              (wire55 & wire54) : (wire61 > wire61)) : (~^$signed(wire57)))));
      reg63 <= wire54[(3'h7):(3'h6)];
      if ((wire58 ? wire60 : wire55))
        begin
          reg64 <= {(~&{wire59[(1'h0):(1'h0)], reg63[(4'hd):(2'h2)]})};
          reg65 <= (((wire55 * (~$signed(wire61))) ^~ ((^~$signed(wire59)) - $unsigned(reg63))) >= (|wire55[(4'hc):(1'h0)]));
          if ((($unsigned(wire56[(1'h1):(1'h1)]) ?
                  (reg63[(3'h6):(2'h3)] ?
                      $unsigned($signed((8'hac))) : wire56[(4'he):(3'h4)]) : $signed(((wire55 && wire56) != $signed(reg63)))) ?
              (wire56[(4'h8):(2'h3)] ~^ {wire54,
                  wire58[(4'hd):(4'ha)]}) : reg65))
            begin
              reg66 <= $signed((({wire54[(3'h5):(1'h0)]} ?
                      wire57[(5'h11):(5'h11)] : (^~((8'hb6) ?
                          wire55 : (8'hb5)))) ?
                  $signed({$signed(reg63), wire56[(4'hd):(1'h1)]}) : reg62));
              reg67 <= $unsigned((wire61[(2'h2):(2'h2)] ?
                  (((wire53 ?
                      wire61 : wire55) <<< {reg65}) ^~ $unsigned(wire53)) : wire55));
              reg68 <= $unsigned((wire56 == ($unsigned($signed(wire58)) ?
                  wire59 : {((8'ha0) > wire60), reg63[(4'h8):(2'h2)]})));
            end
          else
            begin
              reg66 <= $signed(((&$signed($signed(reg65))) ~^ wire55[(1'h1):(1'h0)]));
              reg67 <= (wire54[(3'h5):(2'h3)] << {$signed(wire60[(1'h1):(1'h0)])});
              reg68 <= reg64[(3'h4):(1'h0)];
              reg69 <= reg66;
            end
          reg70 <= $signed(reg67[(3'h7):(3'h6)]);
        end
      else
        begin
          if ((|reg64[(4'h9):(3'h6)]))
            begin
              reg64 <= {(($signed($signed(reg65)) ?
                      (&$signed(reg67)) : wire55[(3'h6):(1'h0)]) * $signed($signed({(7'h42),
                      reg66}))),
                  $unsigned((((reg62 ? wire59 : reg63) ?
                      $signed(wire60) : $signed(reg62)) > $signed(wire59[(3'h5):(3'h5)])))};
            end
          else
            begin
              reg64 <= $signed(wire56[(3'h5):(1'h1)]);
              reg65 <= (($unsigned((&$unsigned(reg67))) ?
                  $unsigned({$signed((8'hbb))}) : {$signed((wire54 && reg64))}) && $unsigned($signed(((^reg68) < (wire58 ^ reg68)))));
              reg66 <= reg64[(4'h9):(4'h8)];
              reg67 <= ({wire56[(4'hb):(3'h7)], wire61[(1'h1):(1'h1)]} ?
                  (((8'haa) ? (8'hb5) : $unsigned((wire57 >> wire53))) ?
                      (^~wire55) : wire58[(1'h1):(1'h1)]) : wire56[(4'hd):(2'h2)]);
              reg68 <= $unsigned(({wire56, wire59[(1'h0):(1'h0)]} ?
                  (({reg64} ^~ {reg70}) ~^ (+(^wire61))) : (+wire54)));
            end
          reg69 <= reg70;
          if ($signed(reg63))
            begin
              reg70 <= $unsigned(reg68[(3'h6):(1'h1)]);
              reg71 <= $unsigned((+(((~reg66) ?
                  wire54[(2'h3):(1'h1)] : {reg69}) >> $unsigned(reg68[(3'h7):(2'h3)]))));
            end
          else
            begin
              reg70 <= wire56[(3'h7):(3'h4)];
              reg71 <= $unsigned($signed((!$unsigned((reg67 ?
                  wire57 : wire61)))));
              reg72 <= (^~(~$signed($signed(wire55[(4'hb):(2'h2)]))));
              reg73 <= ((|(~^(+$unsigned((8'ha2))))) >>> {($unsigned(reg70[(2'h2):(1'h0)]) & $unsigned((wire56 >> wire53)))});
              reg74 <= reg64[(4'hc):(4'hb)];
            end
          if ((&(reg68 ^ ((~|{reg67}) - (reg67 == reg69)))))
            begin
              reg75 <= $signed(($signed($signed((reg65 | wire59))) ?
                  $unsigned(reg63) : reg69[(3'h5):(3'h4)]));
              reg76 <= (reg62 < (8'hac));
            end
          else
            begin
              reg75 <= $signed($signed(wire53));
              reg76 <= {reg73[(3'h6):(1'h1)]};
              reg77 <= (8'hbf);
              reg78 <= $signed((wire57 ?
                  ((~^(reg64 ? (8'hb0) : wire59)) ?
                      (^(reg76 ? wire53 : reg72)) : ($signed(reg71) ?
                          wire59[(3'h7):(3'h6)] : (reg66 ?
                              (8'ha7) : wire56))) : ((~^(reg63 == reg72)) >>> (!((8'hb9) ^~ reg68)))));
            end
          reg79 <= (((^((-reg66) ? reg68[(3'h7):(3'h6)] : reg73)) ?
                  $signed(reg77[(4'h8):(3'h4)]) : ((8'hab) ?
                      (~reg78[(4'he):(2'h3)]) : $signed(reg77[(4'hc):(4'hb)]))) ?
              $unsigned(reg73[(1'h1):(1'h1)]) : reg71[(5'h10):(4'hd)]);
        end
      reg80 <= ((^{wire60[(2'h2):(2'h2)]}) || $unsigned(wire54[(3'h6):(1'h1)]));
    end
  assign wire81 = ($unsigned(($signed((reg64 == reg71)) ?
                          $signed(((8'hb1) ? reg77 : reg73)) : ({reg77} ?
                              $unsigned(reg68) : reg76))) ?
                      $signed($unsigned($signed(wire60))) : wire61);
  assign wire82 = reg62[(4'he):(2'h3)];
  assign wire83 = $signed((~&$signed(((|reg62) <<< (8'hba)))));
  always
    @(posedge clk) begin
      reg84 <= ($unsigned((reg79[(4'h8):(3'h6)] ?
          wire82 : {{wire53}, (8'hb2)})) <<< $unsigned(reg72));
      reg85 <= $unsigned((^$signed(((wire57 * wire56) ?
          {reg75, wire53} : (!wire56)))));
      reg86 <= $unsigned(((~^{(~^(8'hb9))}) - $signed(((reg63 & (8'hbb)) > reg64[(4'ha):(3'h6)]))));
      reg87 <= $unsigned((^reg77[(1'h1):(1'h0)]));
      if (reg67)
        begin
          if (reg65)
            begin
              reg88 <= (reg64 | reg87);
              reg89 <= (!({$signed(reg69),
                  ((~^wire57) >= reg79[(4'hc):(1'h1)])} & ((&(~reg87)) && ($signed(reg85) ?
                  reg75[(3'h7):(1'h1)] : (8'hae)))));
              reg90 <= reg87[(2'h2):(1'h0)];
              reg91 <= ((~wire83[(2'h2):(1'h1)]) ?
                  ((!((reg65 & reg75) ?
                      $signed(reg65) : (wire81 != (8'hac)))) ~^ (^~$unsigned(reg64))) : reg80[(2'h3):(1'h1)]);
            end
          else
            begin
              reg88 <= reg66;
              reg89 <= reg77[(3'h5):(2'h2)];
              reg90 <= ($signed(((|{wire53, wire59}) ?
                      reg65 : ($signed(wire59) ?
                          reg78[(2'h2):(2'h2)] : $unsigned(reg90)))) ?
                  ($signed($signed((&wire83))) ?
                      reg63 : reg64[(3'h6):(3'h5)]) : $signed(((8'ha7) + $unsigned({reg90,
                      reg65}))));
            end
        end
      else
        begin
          reg88 <= {(^$signed(((reg74 == reg85) == $unsigned(reg68)))),
              ((^reg66[(1'h0):(1'h0)]) ?
                  {wire57} : $unsigned(reg70[(1'h1):(1'h0)]))};
          reg89 <= (-$signed(($unsigned((wire83 ~^ reg71)) ?
              (~&reg73[(1'h0):(1'h0)]) : reg72[(4'hc):(2'h3)])));
          reg90 <= reg88[(1'h1):(1'h0)];
          if ((reg63[(3'h7):(3'h4)] << (wire53[(3'h7):(3'h6)] ?
              $signed($signed($unsigned(reg86))) : reg65)))
            begin
              reg91 <= {((^($unsigned(wire60) ?
                      (~&reg78) : $signed(wire57))) > ($signed((reg65 ?
                          reg63 : reg66)) ?
                      {$unsigned(reg88)} : (reg68[(3'h5):(1'h0)] ?
                          (~^reg91) : ((8'ha1) ? reg74 : reg85)))),
                  reg85[(3'h4):(2'h2)]};
            end
          else
            begin
              reg91 <= wire58;
              reg92 <= wire81;
              reg93 <= ((~|$unsigned((|reg89))) == (&(^~$signed(reg79[(1'h0):(1'h0)]))));
            end
        end
    end
  assign wire94 = (((reg90[(1'h1):(1'h0)] ?
                              ($unsigned(wire82) ?
                                  reg84 : reg62[(4'h9):(3'h6)]) : ($signed(reg90) << (-reg67))) ?
                          (reg86[(3'h6):(1'h0)] ?
                              reg92[(1'h1):(1'h0)] : (^reg65)) : (~&reg80[(1'h0):(1'h0)])) ?
                      $signed(($signed(((8'ha1) <= reg87)) && (wire61 < (!reg70)))) : (|(~^(!reg75[(4'h9):(1'h1)]))));
  assign wire95 = $unsigned($unsigned({($signed((8'h9e)) ^~ ((8'hb1) ?
                          reg70 : reg67)),
                      reg63[(4'h9):(1'h0)]}));
  assign wire96 = (~&(+($unsigned($signed(reg91)) ?
                      $signed((!(8'h9c))) : ((&reg84) ~^ $signed(reg79)))));
  assign wire97 = $signed({reg90, wire60});
  assign wire98 = (reg76[(4'hb):(2'h3)] >> wire59);
  assign wire99 = reg75[(1'h0):(1'h0)];
  assign wire100 = {(~&$unsigned((8'hbe))),
                       $signed((((reg62 > wire81) < $signed((8'hb4))) + reg69))};
  assign wire101 = (&($signed($signed((wire95 ? reg85 : reg71))) ?
                       ((8'hb1) >> ($signed((8'h9d)) ?
                           $unsigned(wire95) : (~(8'hb6)))) : reg67[(4'hd):(4'h8)]));
  assign wire102 = ($unsigned($signed($unsigned($unsigned((8'h9c))))) ?
                       wire97[(4'h8):(1'h1)] : $signed($signed(wire56[(2'h3):(2'h3)])));
  assign wire103 = $unsigned($unsigned(wire53[(3'h5):(1'h1)]));
  assign wire104 = $signed((wire98 <= wire101));
endmodule

module module169
#(parameter param205 = (({(((7'h43) >> (8'hae)) ? {(8'haa)} : ((8'hb3) ? (8'hbc) : (8'hb8)))} - ((~&((7'h41) ? (8'haa) : (8'hbb))) ? ({(8'hae), (8'hb2)} ? (-(8'hb6)) : ((8'hbf) ? (8'hb6) : (7'h42))) : (((8'hb4) ? (8'ha0) : (8'h9c)) ? (-(8'ha1)) : (&(8'haa))))) * {((((8'hb8) <<< (8'haf)) >= (7'h43)) ? (~((8'ha4) ? (7'h44) : (8'haf))) : ((~&(8'hac)) ~^ ((8'hba) ^ (7'h40))))}))
(y, clk, wire174, wire173, wire172, wire171, wire170);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire174;
  input wire signed [(4'hc):(1'h0)] wire173;
  input wire [(4'hd):(1'h0)] wire172;
  input wire signed [(2'h2):(1'h0)] wire171;
  input wire signed [(5'h13):(1'h0)] wire170;
  wire [(5'h10):(1'h0)] wire204;
  wire signed [(3'h7):(1'h0)] wire198;
  wire [(4'h9):(1'h0)] wire197;
  wire [(3'h4):(1'h0)] wire196;
  wire [(5'h11):(1'h0)] wire195;
  wire [(5'h11):(1'h0)] wire194;
  wire signed [(5'h14):(1'h0)] wire193;
  wire [(5'h15):(1'h0)] wire175;
  reg [(4'hb):(1'h0)] reg203 = (1'h0);
  reg [(4'he):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg201 = (1'h0);
  reg [(2'h3):(1'h0)] reg200 = (1'h0);
  reg [(5'h12):(1'h0)] reg199 = (1'h0);
  reg [(5'h14):(1'h0)] reg192 = (1'h0);
  reg [(4'ha):(1'h0)] reg191 = (1'h0);
  reg [(4'ha):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(5'h14):(1'h0)] reg183 = (1'h0);
  reg [(3'h7):(1'h0)] reg182 = (1'h0);
  reg [(3'h6):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg180 = (1'h0);
  reg [(4'hc):(1'h0)] reg179 = (1'h0);
  reg [(3'h4):(1'h0)] reg178 = (1'h0);
  reg [(5'h14):(1'h0)] reg177 = (1'h0);
  reg [(3'h6):(1'h0)] reg176 = (1'h0);
  assign y = {wire204,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire175,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 (1'h0)};
  assign wire175 = ({wire170, (+wire174[(3'h4):(2'h2)])} ?
                       $unsigned(wire171) : ($unsigned(wire171) + wire172));
  always
    @(posedge clk) begin
      if ($signed((wire171[(2'h2):(1'h1)] >> {(wire172[(1'h1):(1'h1)] >> wire174[(4'hc):(3'h7)])})))
        begin
          if ($signed($unsigned(wire170)))
            begin
              reg176 <= ((~&(~|wire175[(4'ha):(4'h8)])) ?
                  (~|$unsigned((8'hbf))) : ((~^wire170) ?
                      (wire172[(1'h1):(1'h0)] > (^wire172[(1'h1):(1'h0)])) : wire175));
              reg177 <= $signed(wire170);
            end
          else
            begin
              reg176 <= ((wire173[(4'ha):(1'h1)] <<< $unsigned((+reg177[(1'h0):(1'h0)]))) * ((-($signed(reg176) >> (~^(8'hb3)))) ?
                  ((7'h40) && wire175) : ($unsigned(wire172) ?
                      {wire174[(5'h12):(2'h2)],
                          $unsigned(wire175)} : $unsigned(wire173[(2'h2):(1'h1)]))));
              reg177 <= $unsigned(wire170[(2'h2):(2'h2)]);
              reg178 <= reg176;
              reg179 <= wire174[(4'hc):(3'h7)];
            end
          reg180 <= {$signed({reg177[(4'h9):(1'h1)],
                  ($signed((8'hbc)) != wire171)}),
              (8'hb8)};
          reg181 <= $signed((^~((!((8'hae) != wire174)) ?
              {(wire171 ? (8'hb3) : reg176),
                  (8'haa)} : (wire173[(1'h1):(1'h1)] == $unsigned(wire172)))));
          reg182 <= reg178;
          reg183 <= (reg177[(3'h4):(1'h1)] != (8'haa));
        end
      else
        begin
          reg176 <= reg182;
          reg177 <= wire175[(5'h14):(4'he)];
          reg178 <= ((8'h9c) || $unsigned(reg182[(3'h4):(3'h4)]));
        end
      reg184 <= ($signed(wire171) ^ ($unsigned((((8'ha8) >= reg179) >>> {reg180})) ?
          wire174[(3'h5):(1'h1)] : {reg179[(4'ha):(1'h0)], reg181}));
      if (wire170[(4'hc):(2'h2)])
        begin
          reg185 <= (reg176 ^~ reg181[(3'h4):(2'h3)]);
          reg186 <= (($signed((~^(~|(8'had)))) || ((+$unsigned(wire170)) >>> {(~^reg176)})) + $signed((($signed(reg179) ^~ $unsigned(wire174)) & (reg178[(2'h3):(1'h0)] + wire170))));
          reg187 <= reg184;
        end
      else
        begin
          if (($unsigned(reg187) <<< (~|$signed(($signed((8'ha4)) >= $signed(wire174))))))
            begin
              reg185 <= {$signed({reg178})};
              reg186 <= ($unsigned(reg185[(4'ha):(3'h7)]) ?
                  reg187 : (|((~&reg184) ?
                      ((reg187 ?
                          wire173 : reg177) && $signed(wire175)) : $unsigned(((8'ha8) ^~ wire170)))));
              reg187 <= ($signed(reg176) ?
                  wire172 : $signed(wire171[(1'h0):(1'h0)]));
              reg188 <= (&(&wire171[(2'h2):(1'h1)]));
            end
          else
            begin
              reg185 <= reg185[(4'hb):(4'h8)];
              reg186 <= wire174;
              reg187 <= reg183;
            end
          reg189 <= (!(^~($signed(reg182[(3'h6):(1'h1)]) ?
              {(~|reg179)} : {reg180})));
          reg190 <= ($signed(reg183) || $unsigned({(^(&reg182))}));
          reg191 <= (reg185[(4'h9):(3'h7)] ?
              reg182 : $unsigned($unsigned((~(8'hbc)))));
          reg192 <= (reg181 ?
              $signed($signed($unsigned($unsigned(reg186)))) : (~|$signed(reg178)));
        end
    end
  assign wire193 = reg180;
  assign wire194 = (($unsigned(reg187[(3'h6):(1'h0)]) | reg187) < wire193[(4'ha):(1'h0)]);
  assign wire195 = ((~^$unsigned($signed($signed(reg182)))) ? wire171 : reg182);
  assign wire196 = (~$unsigned(reg191[(4'h9):(3'h6)]));
  assign wire197 = $unsigned(wire174);
  assign wire198 = {{((!reg189[(4'he):(3'h4)]) ?
                               $signed(reg189) : $signed(reg179))},
                       ({$unsigned($signed(reg179))} >= (~$unsigned(reg189[(3'h4):(1'h0)])))};
  always
    @(posedge clk) begin
      reg199 <= (~&reg192);
      if ({{reg185[(5'h13):(4'hc)], $signed(reg184[(5'h11):(4'he)])},
          {{{(^~reg179), ((8'hb4) != wire198)},
                  (wire170[(4'h9):(3'h5)] ?
                      (reg176 != reg176) : (wire175 ? reg180 : reg190))},
              $signed((!reg191))}})
        begin
          reg200 <= $signed(reg177);
          reg201 <= $signed(wire194);
        end
      else
        begin
          reg200 <= (~^reg186);
          reg201 <= wire172[(4'h8):(2'h2)];
          reg202 <= ({(wire196[(2'h2):(1'h1)] ?
                      reg177[(4'hf):(1'h0)] : {(wire172 ? reg177 : wire195),
                          (+(8'ha0))})} ?
              ({((8'hba) && (~^(8'ha9))), {(reg189 || reg178)}} ?
                  (((wire170 || reg176) ?
                      (wire174 ?
                          reg179 : wire174) : reg184) ~^ $signed((reg176 ?
                      reg185 : reg200))) : $signed(((reg200 ?
                          wire173 : reg186) ?
                      (&wire193) : (7'h42)))) : {$unsigned((^~reg183[(5'h14):(4'hc)]))});
          reg203 <= wire173;
        end
    end
  assign wire204 = $signed((($signed({reg183, wire194}) ?
                       ($signed(reg180) ?
                           (reg199 > reg185) : (wire172 || wire195)) : $signed($unsigned(reg203))) & $unsigned(reg189)));
endmodule

module module135  (y, clk, wire140, wire139, wire138, wire137, wire136);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire140;
  input wire [(5'h11):(1'h0)] wire139;
  input wire signed [(5'h11):(1'h0)] wire138;
  input wire signed [(3'h6):(1'h0)] wire137;
  input wire signed [(5'h15):(1'h0)] wire136;
  wire [(5'h12):(1'h0)] wire162;
  wire [(5'h10):(1'h0)] wire161;
  wire [(5'h13):(1'h0)] wire143;
  wire signed [(4'h8):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire141;
  reg [(3'h6):(1'h0)] reg160 = (1'h0);
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(3'h5):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(5'h15):(1'h0)] reg146 = (1'h0);
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire143,
                 wire142,
                 wire141,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
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
                 (1'h0)};
  assign wire141 = $signed((wire139[(4'h9):(4'h9)] >>> ((|(|(7'h43))) * ($signed(wire137) ?
                       wire140 : ((8'hb8) ? wire139 : wire137)))));
  assign wire142 = wire138;
  assign wire143 = $signed((~^{(+(~wire136))}));
  always
    @(posedge clk) begin
      if ((~|$signed($signed(wire136[(5'h13):(5'h12)]))))
        begin
          reg144 <= {$signed($signed((-$signed(wire136))))};
        end
      else
        begin
          if (wire140[(3'h4):(2'h3)])
            begin
              reg144 <= wire138;
              reg145 <= (^({wire136[(2'h2):(2'h2)]} ^~ ((7'h42) ?
                  wire142 : (~(reg144 ? reg144 : (8'hb1))))));
            end
          else
            begin
              reg144 <= {(wire137 ? (~&$unsigned((~&(8'had)))) : wire143)};
            end
          if ({({reg144[(1'h1):(1'h0)], reg145} ?
                  (wire137[(1'h1):(1'h1)] >>> reg144) : ({(^~wire137)} <= wire141[(2'h2):(1'h0)]))})
            begin
              reg146 <= {$signed(wire138[(2'h3):(1'h1)]),
                  ({(^(wire143 - wire138))} ?
                      ($unsigned(wire142) << (+wire143)) : wire142[(1'h1):(1'h0)])};
              reg147 <= ((~|((((8'ha8) ? wire143 : wire138) ?
                      wire141 : $signed(wire142)) <<< wire142)) ?
                  ((+reg145[(4'hb):(4'hb)]) - $unsigned(reg145)) : $signed({(!$signed(wire142))}));
              reg148 <= ($signed($signed(wire136[(1'h1):(1'h0)])) ?
                  ($signed(reg145) <= {((reg147 ?
                          reg146 : (8'hb6)) != (^~(8'ha5))),
                      wire136}) : (~|(8'ha8)));
              reg149 <= (wire143 > $unsigned(((~^(wire137 ?
                  reg145 : wire137)) << $signed((+(8'hac))))));
            end
          else
            begin
              reg146 <= wire140;
              reg147 <= $unsigned(((^((|reg146) ~^ reg146)) >> (^$unsigned(reg147))));
            end
        end
      if (wire137[(2'h2):(2'h2)])
        begin
          if ($signed((reg144 ? wire139 : wire136[(4'h9):(1'h1)])))
            begin
              reg150 <= $unsigned((wire140[(1'h0):(1'h0)] ?
                  (({wire138} ?
                      reg149 : (|wire140)) < $unsigned(wire136[(3'h4):(1'h1)])) : (8'hac)));
              reg151 <= $signed({(~$signed($unsigned(reg146))),
                  (|((~&wire139) ?
                      reg150[(2'h3):(1'h1)] : (wire136 <<< wire141)))});
              reg152 <= $signed((~|($signed(wire142[(4'h8):(3'h4)]) ?
                  ($unsigned(wire138) > $unsigned(reg147)) : ($unsigned(reg150) | $signed((8'hbe))))));
            end
          else
            begin
              reg150 <= (&(~(~&wire139[(1'h0):(1'h0)])));
              reg151 <= $signed($unsigned(((reg144[(3'h4):(1'h1)] ?
                  ((8'hbf) ^~ reg144) : (-wire143)) <<< $unsigned((~wire138)))));
              reg152 <= reg151;
              reg153 <= ({reg152} << (wire142[(4'h8):(2'h2)] ?
                  (~^wire136[(3'h4):(3'h4)]) : reg150[(4'he):(4'he)]));
            end
          reg154 <= $signed(reg147[(1'h0):(1'h0)]);
          reg155 <= (~^(reg149[(3'h4):(3'h4)] ?
              ($unsigned((^~reg154)) ^ reg147) : ((~(wire137 ?
                      wire141 : reg151)) ?
                  wire142 : {(reg153 & reg151),
                      ((8'ha9) ? reg151 : wire141)})));
          reg156 <= (!(-(+((wire136 ? wire138 : wire141) ?
              wire140 : (wire142 + wire136)))));
          reg157 <= ($signed($unsigned(reg153[(1'h0):(1'h0)])) ?
              $signed(wire138[(4'hb):(1'h0)]) : (^$unsigned((8'ha6))));
        end
      else
        begin
          reg150 <= (^~($signed($signed($unsigned((7'h42)))) <= (|((&wire136) ?
              {reg156} : reg156[(2'h2):(2'h2)]))));
        end
      reg158 <= ({($unsigned($unsigned(wire142)) ?
                  $signed((&reg152)) : $unsigned((reg144 >>> reg150)))} ?
          (^$unsigned($unsigned((reg149 >>> (7'h40))))) : (reg155 ?
              reg152[(3'h5):(2'h3)] : $unsigned(({(8'haa)} ?
                  $signed(reg148) : $signed(wire139)))));
      reg159 <= $signed($unsigned((8'hb1)));
      reg160 <= $signed({$unsigned(($signed((8'ha3)) ?
              $unsigned((8'hbd)) : $signed(reg153))),
          ({(+(8'ha4))} - reg156)});
    end
  assign wire161 = $unsigned(reg147);
  assign wire162 = ($signed(reg151[(3'h5):(1'h1)]) ^ $unsigned($signed({(~&wire138),
                       (reg155 + wire139)})));
endmodule
