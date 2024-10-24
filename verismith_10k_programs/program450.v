module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire225;
  wire signed [(5'h13):(1'h0)] wire224;
  wire signed [(5'h11):(1'h0)] wire223;
  wire [(5'h14):(1'h0)] wire222;
  wire [(2'h2):(1'h0)] wire221;
  wire signed [(5'h14):(1'h0)] wire220;
  wire [(4'hb):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire127;
  wire [(4'hf):(1'h0)] wire213;
  wire signed [(5'h12):(1'h0)] wire217;
  wire [(5'h13):(1'h0)] wire218;
  reg [(4'h9):(1'h0)] reg216 = (1'h0);
  reg [(3'h4):(1'h0)] reg215 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  assign y = {wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire120,
                 wire40,
                 wire124,
                 wire127,
                 wire213,
                 wire217,
                 wire218,
                 reg216,
                 reg215,
                 reg122,
                 reg123,
                 reg125,
                 reg126,
                 (1'h0)};
  module4 #() modinst41 (wire40, clk, wire3, wire2, wire0, wire1, (8'ha5));
  module42 #() modinst121 (.clk(clk), .y(wire120), .wire45(wire0), .wire44(wire2), .wire47(wire3), .wire46(wire40), .wire43(wire1));
  always
    @(posedge clk) begin
      reg122 <= $unsigned(wire40);
      reg123 <= $unsigned($unsigned((wire1 ?
          wire3 : ($signed(wire2) ? $unsigned(reg122) : $unsigned(wire2)))));
    end
  assign wire124 = (($unsigned((~|$unsigned(wire40))) ?
                           (+{$signed(wire120)}) : $signed(($signed((8'h9e)) || (~^wire0)))) ?
                       (~&$unsigned(((wire0 != wire120) ?
                           wire40[(4'hb):(4'hb)] : $signed(wire0)))) : (~|(wire120[(3'h7):(1'h1)] & reg123[(3'h6):(3'h6)])));
  always
    @(posedge clk) begin
      reg125 <= (|(wire40 >> $signed((~^$signed(reg123)))));
      reg126 <= wire120[(3'h6):(3'h4)];
    end
  assign wire127 = (&($signed(wire2) ?
                       ((wire3 < ((8'hbf) ? (8'hb0) : reg123)) ?
                           reg123[(1'h0):(1'h0)] : (8'hbd)) : (8'hb5)));
  module128 #() modinst214 (.wire130(reg123), .clk(clk), .wire129(wire120), .wire133(reg122), .y(wire213), .wire132(reg126), .wire131(wire1));
  always
    @(posedge clk) begin
      reg215 <= $signed({((&wire40) ?
              (reg126[(2'h2):(2'h2)] >> $unsigned((8'hab))) : reg122)});
      reg216 <= $signed($unsigned(reg122));
    end
  assign wire217 = reg122;
  module173 #() modinst219 (wire218, clk, reg216, reg123, reg126, wire3, reg125);
  assign wire220 = wire3[(5'h10):(2'h3)];
  assign wire221 = (wire124[(1'h0):(1'h0)] >>> {$signed((reg123 & (wire1 >= wire3)))});
  assign wire222 = (|$signed(($unsigned((wire1 ? wire127 : wire127)) ?
                       $signed((~^wire1)) : wire127)));
  assign wire223 = $signed(wire213[(3'h7):(3'h7)]);
  assign wire224 = $signed($signed((reg216[(3'h4):(1'h0)] ?
                       wire221 : ((wire221 ?
                           wire127 : reg125) || (wire217 + wire223)))));
  assign wire225 = $signed(wire3);
endmodule

module module128
#(parameter param211 = (8'ha1), 
parameter param212 = ({((!(param211 >= param211)) ? (7'h44) : (param211 ? (!param211) : (~&param211))), ((+{(8'hb4)}) || (-param211))} || param211))
(y, clk, wire129, wire130, wire131, wire132, wire133);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire129;
  input wire [(5'h14):(1'h0)] wire130;
  input wire [(5'h10):(1'h0)] wire131;
  input wire signed [(4'ha):(1'h0)] wire132;
  input wire [(5'h11):(1'h0)] wire133;
  wire signed [(5'h14):(1'h0)] wire210;
  wire signed [(5'h12):(1'h0)] wire170;
  wire signed [(5'h15):(1'h0)] wire172;
  wire [(4'hb):(1'h0)] wire208;
  assign y = {wire210, wire170, wire172, wire208, (1'h0)};
  module134 #() modinst171 (.wire136(wire131), .wire135(wire132), .wire138(wire133), .y(wire170), .wire137(wire130), .clk(clk));
  assign wire172 = {$signed($unsigned((|(|wire133))))};
  module173 #() modinst209 (.wire176(wire172), .wire177(wire133), .wire174(wire131), .wire175(wire170), .clk(clk), .y(wire208), .wire178(wire130));
  assign wire210 = (($unsigned({$unsigned((8'haf)), wire172}) ?
                       (($signed((8'h9c)) << $unsigned(wire131)) ?
                           $signed((wire170 ^~ wire132)) : $unsigned((wire208 != wire132))) : $signed((((8'hbb) != wire129) ?
                           {wire208, wire170} : ((8'haf) ?
                               (8'hb3) : wire132)))) <<< ((((^~wire170) | $unsigned(wire129)) < wire170) ?
                       ((!$signed(wire170)) ?
                           (|((8'haa) ?
                               wire133 : wire172)) : wire133[(4'ha):(3'h7)]) : (^{$unsigned(wire129),
                           (+wire131)})));
endmodule

module module42
#(parameter param118 = (-((((-(8'hb8)) ? ((8'ha4) && (8'hb9)) : ((8'ha7) == (8'h9e))) >>> ((^~(8'ha1)) <<< (~(8'had)))) ? (~(&{(8'ha6)})) : ((8'h9c) ? ({(8'hb3)} ? (!(8'ha1)) : (8'hb7)) : {(+(8'h9d))}))), 
parameter param119 = param118)
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire47;
  input wire [(4'hb):(1'h0)] wire46;
  input wire [(4'hd):(1'h0)] wire45;
  input wire [(4'hf):(1'h0)] wire44;
  input wire signed [(5'h13):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  assign y = {wire117,
                 wire115,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 (1'h0)};
  assign wire48 = $signed(wire44);
  assign wire49 = (wire48 ? wire43 : (8'hba));
  assign wire50 = $unsigned(((!wire43[(5'h10):(4'h9)]) ~^ (wire48 >> (^~$signed(wire45)))));
  assign wire51 = wire50[(2'h2):(1'h0)];
  assign wire52 = $unsigned(($unsigned({(wire45 * wire45), (^~wire48)}) ?
                      (~^$signed(wire46[(2'h3):(1'h1)])) : wire43));
  assign wire53 = ((wire48 & wire43) ? (-wire44[(3'h4):(1'h0)]) : wire52);
  assign wire54 = wire47;
  module55 #() modinst96 (wire95, clk, wire47, wire54, wire51, wire52);
  assign wire97 = $unsigned($signed(wire48));
  assign wire98 = (-((wire54 ? wire97[(2'h3):(1'h1)] : (~wire52)) ?
                      ({wire51, wire44[(3'h7):(2'h3)]} ^~ ((wire44 < wire44) ?
                          (wire95 != wire45) : (~^wire54))) : wire44[(2'h3):(1'h1)]));
  assign wire99 = wire97;
  assign wire100 = $signed((($unsigned(((7'h43) ?
                       wire51 : (8'h9d))) >> wire54) && ($unsigned($unsigned(wire53)) ?
                       wire43[(1'h0):(1'h0)] : wire95)));
  assign wire101 = wire48[(2'h2):(1'h0)];
  module102 #() modinst116 (.wire103(wire50), .wire106(wire46), .y(wire115), .wire105(wire48), .clk(clk), .wire104(wire43));
  assign wire117 = wire51;
endmodule

module module4
#(parameter param38 = (^(({((8'ha7) ? (8'hbf) : (8'hbb)), ((8'ha7) ? (8'hb1) : (8'hb0))} + (^~((8'hb9) ? (8'had) : (8'hbb)))) >= (8'hb2))), 
parameter param39 = param38)
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(3'h4):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire19,
                 wire16,
                 wire15,
                 wire11,
                 wire10,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg18,
                 reg17,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = ({((&wire8) <= $unsigned((wire8 ? (8'ha7) : wire7))),
                          wire7[(4'h9):(4'h9)]} ?
                      $signed($signed(wire9[(3'h5):(3'h5)])) : {$unsigned({wire7[(4'hf):(4'h8)]})});
  assign wire11 = (wire8 ^~ $unsigned(wire9[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      reg12 <= wire7;
      reg13 <= $signed((+($signed(wire8) ?
          ((wire5 ? reg12 : wire6) & (~|wire5)) : $unsigned(wire10))));
      reg14 <= ((({$signed(wire6), (wire6 == wire11)} ?
              wire9[(1'h0):(1'h0)] : (reg12[(3'h6):(3'h5)] != $signed(reg12))) ?
          wire10 : (8'ha7)) ^ $unsigned($signed((+(reg12 ? wire10 : wire6)))));
    end
  assign wire15 = ((|$signed(((wire10 ?
                      wire10 : wire6) != $unsigned((8'hbd))))) | (8'ha4));
  assign wire16 = $signed((~&wire5[(4'hc):(3'h4)]));
  always
    @(posedge clk) begin
      reg17 <= {reg12[(2'h2):(1'h0)], (~$unsigned(reg12[(4'hb):(4'ha)]))};
      reg18 <= $signed((~&$signed(reg13[(3'h7):(1'h1)])));
    end
  assign wire19 = (!wire10);
  always
    @(posedge clk) begin
      reg20 <= wire5;
      if (reg20[(2'h3):(2'h3)])
        begin
          reg21 <= reg13[(4'ha):(2'h2)];
        end
      else
        begin
          reg21 <= reg14;
          if (((&(^$unsigned((wire6 == wire9)))) & wire8))
            begin
              reg22 <= $unsigned((({$unsigned(wire9)} > (^wire6[(1'h0):(1'h0)])) ?
                  wire5[(4'hf):(4'he)] : ((-{(8'ha1)}) ?
                      {$signed((8'ha2))} : reg13[(3'h6):(2'h3)])));
            end
          else
            begin
              reg22 <= ((!({wire8} ?
                  (+(wire7 ?
                      wire7 : wire15)) : ((~^wire9) >>> reg18))) ^~ ({$signed((reg17 ?
                          wire19 : wire19))} ?
                  (8'h9c) : (({reg21, reg14} ?
                      (reg18 > reg20) : (-reg20)) >> $unsigned($unsigned(wire6)))));
            end
          if (reg22)
            begin
              reg23 <= $unsigned(((wire6[(2'h2):(1'h0)] ?
                  ((reg20 <= wire6) ^ wire10) : (reg18[(4'he):(4'h9)] << reg22)) >>> (wire8[(1'h0):(1'h0)] == $signed(wire16))));
            end
          else
            begin
              reg23 <= ($signed(wire11[(1'h1):(1'h0)]) <= $unsigned({(~^wire16[(1'h0):(1'h0)])}));
              reg24 <= wire15;
              reg25 <= (reg22[(2'h3):(1'h1)] ?
                  {(&(+(+reg22))),
                      (($unsigned(wire5) ?
                              $unsigned((8'ha3)) : $signed(reg24)) ?
                          ($signed(wire19) ?
                              wire10[(3'h4):(2'h3)] : (reg18 ?
                                  wire7 : (8'ha7))) : ($signed((8'ha1)) ?
                              (wire6 < reg24) : (wire19 == (8'ha1))))} : {$unsigned(wire10[(2'h3):(1'h0)]),
                      reg12[(2'h2):(1'h0)]});
            end
          reg26 <= reg17[(5'h14):(4'hb)];
        end
      if (wire7[(5'h10):(3'h6)])
        begin
          reg27 <= (({(^~wire19), wire11[(4'hb):(4'ha)]} * ((8'hae) ?
              $signed($signed(wire10)) : $signed($signed(reg23)))) <= (-$signed((!$signed(wire19)))));
          if ((|wire15))
            begin
              reg28 <= ($signed($signed(($signed(reg12) >>> $unsigned((8'hb8))))) ?
                  ((^reg27) < reg21) : $unsigned($signed((reg13 ?
                      wire5 : $unsigned(wire9)))));
            end
          else
            begin
              reg28 <= ((($signed($unsigned(reg28)) ?
                          {(reg17 || wire5)} : ((reg22 > reg12) ?
                              reg25[(2'h2):(1'h1)] : reg12[(2'h2):(2'h2)])) ?
                      (~|reg24[(4'h9):(4'h9)]) : (reg27[(3'h5):(1'h0)] ?
                          reg20[(2'h3):(1'h1)] : $unsigned({wire19}))) ?
                  reg28[(1'h0):(1'h0)] : ($unsigned(wire9[(2'h2):(1'h1)]) + wire8[(1'h1):(1'h0)]));
            end
          reg29 <= (reg14 ?
              reg22[(3'h5):(1'h1)] : ((~^(~reg26)) <= (^$signed((~reg12)))));
          reg30 <= (wire16 > $unsigned(wire15[(1'h0):(1'h0)]));
          reg31 <= ((8'hb5) ?
              ($unsigned(reg24) ?
                  (|reg20) : (($signed(reg28) == (reg18 ? reg23 : reg18)) ?
                      (^~$signed(reg17)) : ((+reg25) << wire16))) : reg30[(5'h15):(4'h9)]);
        end
      else
        begin
          reg27 <= $unsigned($unsigned((!(reg21 & (+reg27)))));
          reg28 <= reg26[(4'h9):(3'h5)];
          reg29 <= $unsigned($unsigned($signed($unsigned($unsigned(reg23)))));
          reg30 <= $signed(wire10);
          if (reg27[(3'h4):(2'h2)])
            begin
              reg31 <= reg26[(1'h0):(1'h0)];
              reg32 <= ((8'hbd) ?
                  ($unsigned(wire10[(4'h9):(1'h1)]) ?
                      reg30 : $unsigned($unsigned($signed(reg21)))) : wire9[(1'h0):(1'h0)]);
            end
          else
            begin
              reg31 <= $unsigned(($signed($signed($signed(reg22))) <= ($unsigned((~(8'hb1))) ?
                  {(reg21 ? wire16 : wire5), wire9} : reg14)));
            end
        end
      reg33 <= (+$unsigned($signed({$signed(reg29)})));
      reg34 <= wire11;
    end
  assign wire35 = reg29;
  assign wire36 = $unsigned(wire35);
  assign wire37 = {$signed(reg26), $signed(wire9[(3'h4):(1'h0)])};
endmodule

module module102
#(parameter param113 = (({(|((8'h9f) ? (8'hb4) : (8'ha4))), (((8'hbb) ? (8'hbf) : (8'hbb)) ? ((8'hbd) >>> (8'hb2)) : (+(8'haf)))} <<< ((~^((8'ha0) > (8'hb1))) && {((8'ha0) >> (8'hbb))})) ? ((-(+(8'hb2))) * ((((8'ha2) < (8'haa)) ? (|(8'hb1)) : ((8'ha3) ? (8'ha5) : (8'ha3))) * ({(8'hb4)} ? {(7'h40), (8'hae)} : ((8'h9d) & (7'h44))))) : {((((8'hba) ? (8'hb0) : (8'hb9)) ? ((8'hb8) ? (8'hbe) : (8'hb3)) : ((8'hb1) ? (8'hb7) : (8'hbb))) && {((8'hb8) > (8'ha0))}), (~|((8'hbd) ? (~(8'ha8)) : {(7'h43), (7'h42)}))}), 
parameter param114 = param113)
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire106;
  input wire [(3'h4):(1'h0)] wire105;
  input wire [(5'h11):(1'h0)] wire104;
  input wire signed [(4'ha):(1'h0)] wire103;
  wire [(5'h14):(1'h0)] wire112;
  wire signed [(3'h5):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire107;
  assign y = {wire112, wire111, wire110, wire109, wire108, wire107, (1'h0)};
  assign wire107 = (wire103[(1'h0):(1'h0)] ? wire105 : wire104[(5'h10):(4'hb)]);
  assign wire108 = (wire106[(4'h9):(1'h0)] >= wire107[(3'h7):(3'h4)]);
  assign wire109 = (&(wire106[(4'ha):(4'h9)] ~^ ($signed($unsigned(wire103)) < wire105[(2'h3):(1'h1)])));
  assign wire110 = (wire109 ~^ $signed((~((wire106 ? wire106 : wire105) ?
                       wire104 : {wire109}))));
  assign wire111 = ((~&($unsigned(wire109) == ((|(8'hbe)) ?
                           $signed(wire107) : $signed(wire106)))) ?
                       ($signed($unsigned((~wire104))) ?
                           (wire109 < $signed(wire110[(5'h11):(4'hd)])) : $signed(wire110[(3'h6):(2'h2)])) : wire104[(1'h0):(1'h0)]);
  assign wire112 = $unsigned({wire110});
endmodule

module module55  (y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire59;
  input wire signed [(3'h4):(1'h0)] wire58;
  input wire signed [(4'h9):(1'h0)] wire57;
  input wire [(5'h13):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(2'h2):(1'h0)] wire91;
  wire [(5'h12):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  assign y = {wire94,
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
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg82,
                 reg81,
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
                 (1'h0)};
  assign wire60 = ((8'hb5) << $signed(wire59[(1'h0):(1'h0)]));
  assign wire61 = ((~&$signed(wire60)) ?
                      wire58[(2'h3):(1'h1)] : wire58[(1'h0):(1'h0)]);
  assign wire62 = wire59[(2'h2):(2'h2)];
  assign wire63 = $signed(($unsigned(($unsigned(wire62) ?
                          (wire56 ? wire58 : wire58) : (^wire57))) ?
                      ($unsigned((^wire59)) ?
                          {$signed(wire56)} : (-wire57)) : ($signed((+(8'h9e))) <<< $unsigned((^~wire57)))));
  assign wire64 = (&($signed($signed(wire63)) >> $unsigned((!$signed(wire61)))));
  assign wire65 = $signed(wire60);
  assign wire66 = (!(^{(8'ha5), {{wire60}}}));
  assign wire67 = (~&{(wire59 != wire58),
                      $signed(((wire66 >> wire62) ?
                          wire58[(3'h4):(2'h2)] : $signed(wire62)))});
  always
    @(posedge clk) begin
      if ((8'hac))
        begin
          if ((!(!$unsigned($signed((wire66 ? wire65 : wire64))))))
            begin
              reg68 <= wire63;
            end
          else
            begin
              reg68 <= (wire60[(4'h8):(2'h2)] || wire57[(2'h3):(1'h1)]);
              reg69 <= $signed(wire64);
            end
          if (wire64)
            begin
              reg70 <= wire59;
              reg71 <= ((((8'hb4) ^ ($unsigned((8'ha0)) ?
                  (8'h9e) : {reg68, reg69})) | $unsigned(({wire67, wire57} ?
                  $signed(wire59) : wire60))) + (wire61[(1'h0):(1'h0)] < (!$unsigned(wire56[(4'h9):(4'h8)]))));
              reg72 <= (~&{$unsigned(($unsigned(wire62) ^ wire58[(3'h4):(3'h4)])),
                  $unsigned(($unsigned(reg70) | $signed(wire60)))});
              reg73 <= $unsigned((+((^$unsigned(wire65)) ?
                  $unsigned((wire64 ?
                      wire58 : wire59)) : (wire57[(3'h7):(3'h6)] || (^~wire66)))));
              reg74 <= reg70;
            end
          else
            begin
              reg70 <= (^(wire61 ?
                  (^~{$unsigned(wire58)}) : wire57[(1'h1):(1'h0)]));
              reg71 <= $signed(wire57[(2'h2):(1'h0)]);
              reg72 <= wire60;
              reg73 <= $signed($signed(reg73[(1'h1):(1'h0)]));
            end
          reg75 <= wire63[(2'h3):(2'h2)];
        end
      else
        begin
          if ($signed($unsigned(reg73[(3'h4):(1'h1)])))
            begin
              reg68 <= (8'ha4);
              reg69 <= $signed((wire63[(2'h3):(1'h0)] ?
                  reg75 : (($unsigned(reg72) << wire58[(3'h4):(2'h2)]) ?
                      reg68[(2'h2):(1'h1)] : $signed((reg71 - wire61)))));
              reg70 <= ((reg68[(1'h0):(1'h0)] ~^ reg69[(1'h1):(1'h0)]) ?
                  $signed({wire56[(2'h2):(2'h2)]}) : $signed(wire62[(1'h0):(1'h0)]));
              reg71 <= reg73;
              reg72 <= (((((~^(8'ha5)) ?
                      (reg73 ? (8'h9c) : reg68) : reg70) | (^$signed(reg73))) ?
                  (~|((wire65 == reg70) ?
                      wire56 : ((8'hae) >> wire58))) : ({wire56[(3'h7):(2'h2)],
                          $unsigned((8'hbc))} ?
                      $unsigned((reg68 & wire65)) : $unsigned(wire58[(1'h1):(1'h0)]))) ^~ $signed({(~&{wire67})}));
            end
          else
            begin
              reg68 <= ($signed($unsigned(wire67)) ^ $signed({wire57[(1'h0):(1'h0)],
                  reg72[(3'h4):(2'h3)]}));
              reg69 <= (+(~wire58[(2'h2):(1'h0)]));
              reg70 <= ($signed(($unsigned((reg72 ? wire60 : wire63)) ?
                      {(wire67 >= wire67)} : wire67[(2'h2):(2'h2)])) ?
                  (^$unsigned($signed((wire66 || reg74)))) : $signed((&($signed(wire61) ?
                      reg74 : (wire61 ? (8'hab) : (8'hb4))))));
              reg71 <= $signed(((((reg70 <= wire58) ?
                  reg74 : wire66) < (wire59 ?
                  (wire63 < reg75) : (!wire63))) != {reg71,
                  $unsigned((wire66 ? wire61 : reg74))}));
            end
          if ({(!$signed($signed((8'ha3)))), reg69[(2'h2):(1'h0)]})
            begin
              reg73 <= $unsigned(({$signed(wire60),
                  (wire66 <<< wire66)} ^~ $unsigned(((8'hb3) >> {reg72,
                  (8'hbd)}))));
              reg74 <= $unsigned((wire61[(5'h11):(2'h3)] ?
                  (reg68[(1'h0):(1'h0)] ? reg70 : (&(8'hab))) : (^wire66)));
            end
          else
            begin
              reg73 <= {(~&{({reg75} <= $unsigned(wire62)),
                      reg75[(2'h3):(2'h2)]})};
              reg74 <= reg70;
              reg75 <= (~^$signed($unsigned($signed((&wire65)))));
              reg76 <= reg72;
            end
          reg77 <= (($signed({wire64}) ?
              $signed(((-wire66) ?
                  wire67 : (+wire64))) : $unsigned(reg74[(4'hd):(4'h8)])) >> {(reg75[(3'h5):(1'h1)] ^ reg75[(1'h1):(1'h0)])});
        end
      if ($unsigned($signed((|$signed((reg72 ? (8'hae) : (8'ha5)))))))
        begin
          if (wire58[(2'h3):(2'h2)])
            begin
              reg78 <= (wire60 >>> (8'hbf));
            end
          else
            begin
              reg78 <= $signed($unsigned(wire64[(2'h2):(1'h1)]));
              reg79 <= $signed(((reg68 && (-reg78)) ?
                  wire57 : ($unsigned({reg70}) >>> ((~reg75) & (wire63 != reg71)))));
            end
          reg80 <= (~^(~&($unsigned($signed(reg70)) ?
              reg75[(3'h4):(2'h3)] : (~^reg72))));
          reg81 <= {$unsigned({reg77[(3'h4):(2'h2)], wire58}), reg71};
          reg82 <= (((&((reg68 ? reg81 : reg68) <= (reg74 ?
              reg79 : reg79))) != {$signed(wire56)}) >>> (~^$signed($signed($unsigned(reg80)))));
        end
      else
        begin
          if (wire66[(1'h0):(1'h0)])
            begin
              reg78 <= $signed((($signed($signed(wire56)) ~^ (reg75 != reg71)) < wire64[(4'hd):(1'h1)]));
              reg79 <= $unsigned($signed(wire57));
              reg80 <= ((7'h44) ?
                  ({$unsigned((!wire60)), (^(wire58 ? reg78 : reg69))} ?
                      reg76 : (((8'hb6) >= $unsigned(reg69)) ?
                          (((8'hbf) ?
                              wire64 : wire59) * $signed((7'h41))) : reg78[(4'he):(3'h6)])) : wire60[(3'h5):(1'h1)]);
            end
          else
            begin
              reg78 <= ($unsigned((reg70[(2'h3):(1'h1)] ?
                      $signed((reg80 == reg78)) : (wire61[(4'hf):(4'h8)] == $unsigned((8'h9d))))) ?
                  ((8'ha7) - {{reg69}}) : reg70[(1'h1):(1'h0)]);
              reg79 <= {{wire56[(1'h1):(1'h1)]},
                  (reg70[(4'hb):(4'h9)] <= ($unsigned((reg73 ? reg77 : reg72)) ?
                      $signed(((8'hba) ^~ reg74)) : ($signed(wire62) >>> (reg71 ?
                          reg72 : reg81))))};
              reg80 <= $unsigned({wire67});
            end
        end
    end
  assign wire83 = (wire57[(4'h8):(4'h8)] || (^~{$unsigned((reg75 ?
                          (8'haa) : reg81)),
                      ((wire60 >> wire61) ? $signed(reg81) : $signed(reg77))}));
  assign wire84 = ((+wire61) ?
                      {reg69,
                          $unsigned($signed({(8'h9c),
                              reg68}))} : $signed(reg81[(3'h6):(3'h5)]));
  assign wire85 = {(-$unsigned($signed({wire63})))};
  assign wire86 = $unsigned(wire64);
  assign wire87 = wire61[(5'h14):(1'h0)];
  assign wire88 = $signed($signed((^~($unsigned(reg69) ~^ $signed(wire66)))));
  assign wire89 = ((+{reg73[(5'h10):(4'he)],
                      (+reg71)}) ~^ (reg80[(3'h4):(3'h4)] ?
                      $unsigned((8'hb7)) : wire62));
  assign wire90 = (8'ha3);
  assign wire91 = (|(($unsigned((~&(8'hbc))) << {$signed(reg76)}) ?
                      ((-(reg79 ? reg77 : wire56)) ?
                          $signed(((8'ha7) != (8'hb6))) : (((8'hbe) + reg71) < (8'hbb))) : (!$unsigned((wire87 ?
                          wire88 : wire86)))));
  assign wire92 = (~&wire87);
  assign wire93 = wire92;
  assign wire94 = (wire56 ?
                      (~reg73) : ({wire67[(1'h0):(1'h0)], wire64} ?
                          (wire83[(3'h5):(1'h1)] ?
                              (&{reg82}) : (~^wire92)) : (!((reg74 == reg79) ^~ {wire57,
                              wire64}))));
endmodule

module module173
#(parameter param207 = {{(-(!(~(8'hb7))))}})
(y, clk, wire178, wire177, wire176, wire175, wire174);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire178;
  input wire [(3'h7):(1'h0)] wire177;
  input wire signed [(5'h15):(1'h0)] wire176;
  input wire signed [(4'h9):(1'h0)] wire175;
  input wire [(4'h8):(1'h0)] wire174;
  wire signed [(4'h9):(1'h0)] wire206;
  wire [(5'h14):(1'h0)] wire205;
  wire [(3'h7):(1'h0)] wire204;
  wire signed [(4'hb):(1'h0)] wire203;
  wire [(5'h11):(1'h0)] wire202;
  wire signed [(2'h3):(1'h0)] wire201;
  wire signed [(5'h11):(1'h0)] wire185;
  wire [(4'hc):(1'h0)] wire184;
  wire [(4'hc):(1'h0)] wire183;
  wire [(3'h6):(1'h0)] wire182;
  wire [(4'hc):(1'h0)] wire181;
  wire [(4'hd):(1'h0)] wire180;
  wire signed [(5'h11):(1'h0)] wire179;
  reg [(2'h2):(1'h0)] reg200 = (1'h0);
  reg [(5'h10):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg198 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg197 = (1'h0);
  reg [(4'h8):(1'h0)] reg196 = (1'h0);
  reg [(5'h15):(1'h0)] reg195 = (1'h0);
  reg [(5'h15):(1'h0)] reg194 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg193 = (1'h0);
  reg [(5'h10):(1'h0)] reg192 = (1'h0);
  reg [(3'h7):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg190 = (1'h0);
  reg [(4'ha):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg188 = (1'h0);
  reg [(4'ha):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg186 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 (1'h0)};
  assign wire179 = wire178[(1'h0):(1'h0)];
  assign wire180 = $signed(wire176[(3'h7):(3'h7)]);
  assign wire181 = $unsigned($unsigned({$unsigned((^~wire180)), (7'h44)}));
  assign wire182 = wire181;
  assign wire183 = wire178[(3'h4):(2'h2)];
  assign wire184 = (wire183 ?
                       wire183[(1'h0):(1'h0)] : (~|(wire177[(1'h0):(1'h0)] ?
                           (wire180 * wire183[(2'h2):(2'h2)]) : $unsigned(wire180))));
  assign wire185 = wire176[(4'hc):(3'h7)];
  always
    @(posedge clk) begin
      reg186 <= ($unsigned({wire177,
          (!((8'hb0) ?
              wire185 : wire178))}) != (&$unsigned((~|$signed(wire176)))));
      reg187 <= $signed(wire175);
    end
  always
    @(posedge clk) begin
      reg188 <= {($signed((wire184 <= $signed(wire177))) ?
              $unsigned($signed((reg187 ^~ (8'hab)))) : (-((~^wire181) ?
                  (reg187 ? reg187 : wire180) : $signed(reg187))))};
      reg189 <= $unsigned((~|$signed({(wire180 ? wire178 : wire179),
          wire174[(3'h7):(1'h1)]})));
      if (wire179)
        begin
          reg190 <= (wire185 ?
              $signed(wire181[(4'hb):(4'h9)]) : $unsigned($signed($signed($unsigned(wire174)))));
          reg191 <= $unsigned(($unsigned(wire174) != $signed(((|wire176) ?
              (wire178 != wire179) : (-wire177)))));
          reg192 <= ($unsigned(((+reg189) ?
                  wire176[(3'h5):(2'h3)] : $unsigned($unsigned(wire184)))) ?
              ((~(((8'h9f) & reg187) + $signed(wire176))) ?
                  wire183[(3'h6):(3'h4)] : wire180[(4'h9):(3'h4)]) : $unsigned(reg187[(3'h6):(3'h4)]));
          if ($unsigned((~&($signed((wire181 ? wire184 : (8'hab))) ?
              {$signed((8'h9c)), (&wire185)} : $unsigned((wire185 | reg192))))))
            begin
              reg193 <= wire179;
              reg194 <= $signed(wire174[(2'h3):(1'h0)]);
              reg195 <= (!$signed($unsigned(reg187[(4'h9):(1'h1)])));
              reg196 <= $unsigned(({(wire182[(3'h4):(1'h1)] ?
                          (reg190 ? (8'had) : wire175) : wire175)} ?
                  $signed($signed(wire182[(1'h1):(1'h0)])) : {($signed(wire175) ?
                          reg194[(5'h11):(4'hf)] : wire174)}));
            end
          else
            begin
              reg193 <= wire181;
              reg194 <= $unsigned((|(7'h42)));
              reg195 <= (+(8'ha3));
            end
          if ((wire183[(3'h5):(2'h2)] * $signed({(+(reg189 < reg186)),
              ((8'hbd) - $signed(reg186))})))
            begin
              reg197 <= reg188[(3'h7):(2'h3)];
            end
          else
            begin
              reg197 <= (($unsigned($signed((^wire175))) ? wire179 : reg187) ?
                  wire179 : (((~^(|reg188)) ?
                      (~&(wire179 ?
                          (8'hba) : reg197)) : $signed((^~(8'hbb)))) || $signed((7'h43))));
              reg198 <= (~^($signed(((wire184 ? reg197 : wire180) <<< (reg190 ?
                  wire178 : reg188))) >= $unsigned(wire178[(3'h5):(1'h1)])));
              reg199 <= $signed(wire177);
              reg200 <= (-wire180);
            end
        end
      else
        begin
          reg190 <= (^~(((wire175 ^ $signed(reg199)) ?
              (~&(reg192 & wire180)) : wire183) | reg192[(2'h3):(2'h2)]));
          reg191 <= (^{($unsigned(wire183) == wire180)});
          reg192 <= $signed(((reg186 ? $unsigned(reg192) : reg195) ?
              (({reg197} ? (~wire182) : $signed(wire179)) ?
                  ({reg187} ? wire177 : (&reg187)) : (((8'hb2) ^ reg188) ?
                      $signed((8'hb1)) : $signed(reg186))) : (~&wire184)));
          reg193 <= ((wire176[(5'h14):(4'ha)] ?
                  {$unsigned($unsigned(reg200))} : $unsigned($signed(wire185))) ?
              $unsigned(reg187[(4'h9):(3'h4)]) : ($signed(wire184) ?
                  $signed(({reg198, (8'ha8)} ?
                      $unsigned(reg187) : reg197[(2'h2):(1'h1)])) : wire179[(3'h4):(1'h0)]));
        end
    end
  assign wire201 = (7'h44);
  assign wire202 = ({wire185, $unsigned($signed((wire175 >> wire182)))} ?
                       wire178[(3'h4):(2'h3)] : wire185[(2'h2):(1'h0)]);
  assign wire203 = ($signed($unsigned($signed((reg200 ? (8'hb6) : wire174)))) ?
                       wire180[(2'h2):(2'h2)] : $unsigned($unsigned(wire174)));
  assign wire204 = ($signed(({wire183, (^~wire182)} ?
                           $unsigned(wire176) : (|(wire184 ?
                               reg195 : wire184)))) ?
                       $unsigned((~|reg196)) : reg186);
  assign wire205 = wire180;
  assign wire206 = $signed($unsigned(wire182));
endmodule

module module134
#(parameter param168 = (+{(~|(~|((8'h9e) ^~ (8'ha3)))), (8'hbb)}), 
parameter param169 = (!(param168 ? (({(8'hb4), param168} * (param168 || param168)) ? {(~param168)} : {(8'hb9), (param168 ? param168 : param168)}) : (param168 ^~ param168))))
(y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire138;
  input wire [(4'h8):(1'h0)] wire137;
  input wire signed [(5'h10):(1'h0)] wire136;
  input wire signed [(3'h7):(1'h0)] wire135;
  wire [(5'h10):(1'h0)] wire167;
  wire signed [(4'hd):(1'h0)] wire166;
  wire [(2'h2):(1'h0)] wire165;
  wire signed [(5'h13):(1'h0)] wire147;
  wire signed [(5'h13):(1'h0)] wire146;
  wire signed [(4'hc):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire144;
  wire signed [(3'h6):(1'h0)] wire143;
  wire signed [(4'hd):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire141;
  wire signed [(3'h5):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire139;
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg163 = (1'h0);
  reg [(5'h15):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg158 = (1'h0);
  reg [(2'h2):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(5'h11):(1'h0)] reg154 = (1'h0);
  reg signed [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg150 = (1'h0);
  reg [(5'h11):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg148 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
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
                 (1'h0)};
  assign wire139 = (8'ha0);
  assign wire140 = {$signed((8'hb4))};
  assign wire141 = $unsigned(((&(^(wire136 <<< (7'h44)))) > {({wire140,
                           wire137} >= $signed(wire139)),
                       wire136}));
  assign wire142 = (^~((wire135 ^ wire138[(2'h2):(1'h0)]) == ($unsigned(wire135) << wire140)));
  assign wire143 = $signed($unsigned($unsigned($unsigned(wire138[(4'hd):(4'hb)]))));
  assign wire144 = wire137[(3'h7):(1'h1)];
  assign wire145 = ((((~|(-(8'hb9))) ^~ ($signed(wire144) ?
                               (~wire143) : {wire143, wire139})) ?
                           wire141[(4'h8):(3'h7)] : wire136[(2'h2):(2'h2)]) ?
                       wire142 : wire144);
  assign wire146 = ($unsigned(wire137[(3'h7):(2'h3)]) ?
                       $signed(wire143[(2'h3):(1'h0)]) : wire136[(1'h1):(1'h1)]);
  assign wire147 = (8'hae);
  always
    @(posedge clk) begin
      reg148 <= {($signed($unsigned((wire147 ? wire145 : wire142))) ?
              (wire138 ?
                  (wire141 >> $signed(wire143)) : $signed((wire146 ?
                      wire144 : (7'h43)))) : wire144[(5'h10):(4'hc)]),
          $unsigned(($unsigned((wire141 >> wire136)) ?
              ($signed(wire144) | (|wire144)) : (wire136 ~^ {wire143})))};
      if ($signed(wire144))
        begin
          reg149 <= (~|(wire147 ^~ ($unsigned($unsigned(wire142)) ?
              $signed(wire137) : ({wire138, wire141} == {wire135, wire144}))));
          if (reg149)
            begin
              reg150 <= {reg148};
              reg151 <= ($signed((^({(8'hb1)} ?
                  $signed((8'h9c)) : $unsigned(reg150)))) ^ (~&wire139[(1'h0):(1'h0)]));
              reg152 <= reg149;
              reg153 <= $unsigned(($unsigned(((!reg151) ?
                      $unsigned(wire137) : (reg150 ? reg151 : (8'ha2)))) ?
                  $signed($signed((8'ha6))) : (wire140[(1'h0):(1'h0)] ?
                      $signed($unsigned((8'hb3))) : $signed((&wire139)))));
              reg154 <= $unsigned($signed($signed($signed($signed(wire138)))));
            end
          else
            begin
              reg150 <= $signed(wire136[(4'hf):(4'hb)]);
              reg151 <= $signed(((-wire147[(4'h9):(3'h4)]) ?
                  reg151[(1'h0):(1'h0)] : (~|(8'hab))));
              reg152 <= ((^wire144) < {wire141});
            end
          if ({$unsigned($signed($unsigned({wire145, (8'hb3)}))),
              $unsigned(wire143[(3'h4):(2'h3)])})
            begin
              reg155 <= ($signed(wire142) ?
                  $unsigned(($unsigned($unsigned(wire139)) ~^ ((~^(7'h43)) ?
                      reg154[(4'hd):(1'h1)] : wire147[(4'hb):(1'h1)]))) : wire135);
              reg156 <= (($signed($unsigned($unsigned(reg150))) ?
                      $signed(({wire144, (8'ha3)} ?
                          (wire135 << (8'hba)) : reg155)) : $unsigned(({(7'h43)} ?
                          (reg153 ~^ reg154) : (wire143 ? wire141 : reg153)))) ?
                  {(&(8'hb7)),
                      reg153} : $signed(((8'hb4) == $unsigned(reg148[(2'h2):(2'h2)]))));
              reg157 <= (~$unsigned({{$unsigned(reg151)}}));
            end
          else
            begin
              reg155 <= $unsigned((reg154[(4'hf):(4'hf)] || {(wire143[(1'h0):(1'h0)] > {wire144})}));
              reg156 <= wire145;
              reg157 <= (8'ha6);
            end
          if ($unsigned(((($signed(reg149) == (|reg148)) >> (^$signed((8'hb9)))) ^~ (~$unsigned($signed(wire145))))))
            begin
              reg158 <= $unsigned($signed((8'hb2)));
              reg159 <= {$signed(($signed($unsigned((8'ha0))) ~^ (wire139[(2'h3):(2'h3)] ?
                      $unsigned(wire139) : ((7'h41) ? reg151 : reg150))))};
              reg160 <= $signed(wire138[(2'h2):(1'h0)]);
              reg161 <= wire145;
              reg162 <= $unsigned(((&wire139[(1'h0):(1'h0)]) >>> wire145));
            end
          else
            begin
              reg158 <= $unsigned((8'ha7));
            end
        end
      else
        begin
          reg149 <= ((!$signed($unsigned((~&reg151)))) ?
              wire146[(3'h5):(2'h3)] : reg162[(5'h14):(4'hb)]);
          reg150 <= $unsigned((~&reg148[(1'h1):(1'h0)]));
          reg151 <= ((7'h40) ?
              (~^$unsigned(reg157)) : $signed($signed($signed(wire135))));
          if (($signed({$unsigned(reg150), (~^wire135)}) >>> reg162))
            begin
              reg152 <= reg159[(1'h0):(1'h0)];
            end
          else
            begin
              reg152 <= wire141;
            end
        end
      reg163 <= reg159[(2'h2):(1'h1)];
      reg164 <= $signed($signed($unsigned($unsigned((reg153 ?
          wire143 : (8'hb7))))));
    end
  assign wire165 = ($unsigned((+$signed((~^(8'h9c))))) ?
                       $unsigned(($signed($signed(reg159)) > $signed($unsigned(reg156)))) : $signed((~^$signed($signed((8'haa))))));
  assign wire166 = (~&$unsigned(($unsigned((reg152 ? reg161 : wire139)) ?
                       $signed(reg155[(1'h1):(1'h1)]) : ($unsigned(reg150) & ((8'hbd) != (8'ha4))))));
  assign wire167 = wire141[(1'h1):(1'h1)];
endmodule
