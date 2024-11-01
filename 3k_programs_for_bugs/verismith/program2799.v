module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire154;
  wire [(4'hf):(1'h0)] wire152;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire156;
  wire [(5'h15):(1'h0)] wire157;
  wire signed [(5'h13):(1'h0)] wire158;
  wire signed [(4'ha):(1'h0)] wire159;
  wire [(3'h6):(1'h0)] wire160;
  wire signed [(3'h4):(1'h0)] wire161;
  wire signed [(4'hf):(1'h0)] wire162;
  wire [(2'h3):(1'h0)] wire164;
  wire [(3'h5):(1'h0)] wire165;
  wire signed [(3'h4):(1'h0)] wire166;
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire154,
                 wire152,
                 wire50,
                 wire49,
                 wire48,
                 wire37,
                 wire36,
                 wire34,
                 wire9,
                 wire4,
                 wire156,
                 wire157,
                 wire158,
                 wire159,
                 wire160,
                 wire161,
                 wire162,
                 wire164,
                 wire165,
                 wire166,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned($signed(wire1[(4'he):(4'hb)]));
  always
    @(posedge clk) begin
      if ($signed((&wire2)))
        begin
          reg5 <= $signed((wire1 - (&((|wire1) >> (^wire3)))));
          reg6 <= $signed(wire3[(3'h7):(1'h1)]);
          reg7 <= wire0[(4'ha):(4'h9)];
          reg8 <= ((({reg5} ? {((7'h42) | reg7), $unsigned((8'hbf))} : wire2) ?
              reg5 : {(8'hb1),
                  (reg6 ?
                      {(8'ha3), wire3} : (wire3 ?
                          wire0 : wire4))}) < wire0[(4'hd):(4'h8)]);
        end
      else
        begin
          reg5 <= wire1[(4'h9):(2'h3)];
          reg6 <= $signed($unsigned(($signed($unsigned((7'h43))) << {$signed(reg8)})));
          reg7 <= wire3;
        end
    end
  assign wire9 = $unsigned((~reg8));
  module10 #() modinst35 (wire34, clk, reg8, wire9, wire0, reg6);
  assign wire36 = wire2;
  assign wire37 = (wire36[(4'h8):(2'h3)] ?
                      ($unsigned($unsigned($signed((8'had)))) ?
                          $signed((~wire4)) : wire36[(5'h10):(3'h5)]) : (wire9[(3'h7):(3'h6)] * wire0[(4'h9):(1'h0)]));
  always
    @(posedge clk) begin
      if ((^~(&{(^{wire1})})))
        begin
          if (((8'hb9) <<< wire34))
            begin
              reg38 <= $signed(wire34);
              reg39 <= wire36[(2'h2):(1'h0)];
              reg40 <= wire34;
              reg41 <= reg5[(2'h2):(2'h2)];
              reg42 <= {wire34[(2'h2):(1'h0)],
                  (wire2[(4'h9):(3'h6)] >> $signed(wire36))};
            end
          else
            begin
              reg38 <= (~^{($unsigned((wire1 - reg39)) ?
                      reg7[(3'h5):(1'h1)] : reg8)});
              reg39 <= (wire2 < reg6);
              reg40 <= reg5;
            end
          reg43 <= {(!(({reg41} ? {wire2, wire9} : (reg7 ? wire34 : wire1)) ?
                  $signed($unsigned(wire1)) : wire2)),
              ((reg39 ?
                      ((reg40 ?
                          wire3 : wire4) - $signed((8'hbc))) : $unsigned(reg5)) ?
                  (!(|(~|wire2))) : $signed(((reg39 - wire37) ^~ wire9[(2'h2):(2'h2)])))};
        end
      else
        begin
          reg38 <= $unsigned(reg43[(3'h4):(2'h2)]);
          reg39 <= $signed(wire37);
          reg40 <= ($signed((((reg40 && (8'hb0)) * {(8'hb1)}) ?
                  wire9[(3'h4):(3'h4)] : reg6)) ?
              {({(wire36 < reg8), (+(7'h41))} ?
                      wire0[(3'h5):(2'h2)] : $unsigned(wire4[(1'h0):(1'h0)]))} : reg41[(3'h4):(1'h1)]);
          if (((((!reg41) ?
                  $unsigned($signed(wire2)) : $signed($unsigned(wire37))) | (wire0 ?
                  (~^wire37) : $signed((reg43 ? wire9 : reg7)))) ?
              $signed(wire4[(4'hd):(2'h2)]) : $unsigned((wire2[(3'h6):(1'h0)] + reg7[(4'hd):(1'h0)]))))
            begin
              reg41 <= (^~wire0[(4'hc):(3'h6)]);
              reg42 <= reg38[(2'h3):(1'h1)];
              reg43 <= reg40;
              reg44 <= ($signed((($unsigned((8'ha0)) > (+wire9)) || ((~^reg42) ?
                      (-reg5) : (wire4 ? reg42 : reg39)))) ?
                  $unsigned(wire0[(3'h4):(1'h0)]) : (8'hb4));
            end
          else
            begin
              reg41 <= wire36;
            end
          reg45 <= ((wire4[(4'h8):(3'h6)] ? reg40 : $unsigned({(!reg43)})) ?
              ({$signed(reg7)} ?
                  $unsigned((&$signed(reg6))) : $unsigned({$unsigned(wire36),
                      (wire0 ? reg43 : reg38)})) : reg40);
        end
      reg46 <= {reg42[(4'hb):(3'h6)], reg44[(5'h14):(4'hd)]};
      reg47 <= $unsigned(reg38[(1'h1):(1'h1)]);
    end
  assign wire48 = reg40[(3'h4):(2'h3)];
  assign wire49 = (!reg6);
  assign wire50 = (&{((reg38 ?
                          reg42[(3'h6):(2'h3)] : (8'had)) ~^ $signed((reg6 * (8'h9f))))});
  module51 #() modinst153 (wire152, clk, reg44, wire36, reg6, wire37, reg45);
  module62 #() modinst155 (wire154, clk, reg43, wire49, wire9, wire0, reg7);
  assign wire156 = reg44[(2'h3):(1'h0)];
  assign wire157 = reg40[(3'h6):(1'h1)];
  assign wire158 = ((~&(((~(8'hb4)) ?
                       ((8'haa) << (7'h42)) : $signed(reg46)) - ((wire157 || reg42) ?
                       reg6 : $unsigned(wire0)))) != $unsigned(((~&(8'hb6)) ?
                       $signed((reg5 - wire48)) : (~|(reg47 ?
                           (8'h9d) : reg7)))));
  assign wire159 = $signed(reg38[(1'h0):(1'h0)]);
  assign wire160 = (($unsigned(($unsigned(reg39) ~^ $signed(wire158))) ?
                       (wire49[(4'h8):(1'h0)] >= ($unsigned(wire154) && reg47[(3'h6):(1'h0)])) : ($unsigned($unsigned((8'ha1))) >> (reg47 - ((8'ha7) ?
                           wire49 : reg38)))) ^ ({$signed((wire48 ?
                               wire9 : reg6)),
                           ((wire4 <<< reg8) ?
                               (wire0 * wire9) : (reg5 != wire48))} ?
                       ({(~|reg6)} ~^ ((wire1 | reg39) ?
                           $signed((8'hb0)) : reg40[(3'h7):(2'h3)])) : ({$signed(wire3)} ?
                           ($signed(wire49) <= reg44[(4'hf):(4'hb)]) : wire34)));
  assign wire161 = $unsigned((^reg41[(2'h2):(1'h1)]));
  module62 #() modinst163 (wire162, clk, wire1, wire158, wire2, reg5, wire34);
  assign wire164 = wire9;
  assign wire165 = (reg7[(2'h3):(1'h0)] ~^ ((7'h40) ?
                       (wire34[(4'h8):(2'h2)] ?
                           wire159 : {$unsigned(reg5)}) : wire160[(3'h4):(2'h3)]));
  module17 #() modinst167 (wire166, clk, wire158, wire0, wire152, wire156, wire37);
endmodule

module module51
#(parameter param150 = ((((8'hbe) ? ((&(7'h43)) != ((7'h43) ? (8'haf) : (8'hb8))) : (~((8'hb2) + (8'h9e)))) > ((((8'hb0) ? (8'hbf) : (7'h42)) ? ((8'ha2) ? (8'ha3) : (8'ha9)) : (~(8'h9f))) ? (((7'h44) && (7'h43)) >>> ((8'hb6) ^~ (8'haa))) : (~&((8'hbb) + (8'hb2))))) ? ((((7'h43) ^ (^(8'hb5))) <<< {((8'ha6) ^ (7'h40)), (~|(8'ha8))}) <= ((((8'ha7) ? (8'ha8) : (8'hbc)) ? {(8'h9f), (7'h41)} : (&(8'hba))) < (((8'haa) ? (8'hbb) : (8'ha6)) - (~(7'h40))))) : (((7'h44) | (~&((8'hb3) ? (8'h9d) : (8'ha6)))) * ((|((8'hae) << (8'ha1))) > ({(8'haf), (8'ha2)} | {(8'hb6), (8'h9e)})))), 
parameter param151 = (^~({(8'hbc)} <<< ((^(param150 ? param150 : param150)) ^ {(-(8'hab)), (8'h9f)}))))
(y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire56;
  input wire [(4'hc):(1'h0)] wire55;
  input wire [(5'h13):(1'h0)] wire54;
  input wire [(5'h13):(1'h0)] wire53;
  input wire signed [(5'h12):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire149;
  wire signed [(3'h5):(1'h0)] wire148;
  wire [(5'h12):(1'h0)] wire147;
  wire signed [(2'h3):(1'h0)] wire145;
  wire [(4'hc):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire102;
  wire signed [(3'h6):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire57;
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire145,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire102,
                 wire101,
                 wire99,
                 wire57,
                 reg104,
                 reg103,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 (1'h0)};
  assign wire57 = ((wire54 >>> $signed(wire52)) ? wire52 : wire52);
  always
    @(posedge clk) begin
      reg58 <= wire55;
      reg59 <= ($unsigned(wire53) & $signed($signed(((wire52 ? reg58 : wire52) ?
          (!wire52) : $unsigned(wire56)))));
      reg60 <= (^wire52[(5'h10):(4'ha)]);
      reg61 <= {wire53[(3'h5):(2'h3)], wire52[(5'h11):(4'h8)]};
    end
  module62 #() modinst100 (.wire65(wire54), .wire63(wire55), .y(wire99), .wire67(wire57), .wire66(reg61), .wire64(wire53), .clk(clk));
  assign wire101 = wire57;
  assign wire102 = (|(&(!{((8'hb2) ? reg58 : wire54)})));
  always
    @(posedge clk) begin
      reg103 <= reg60;
    end
  always
    @(posedge clk) begin
      reg104 <= {$signed(reg58[(3'h6):(2'h3)])};
    end
  assign wire105 = (((($signed(wire56) ?
                           $signed(wire102) : (!wire102)) > (8'ha0)) < $unsigned(((wire57 != wire101) ?
                           $signed((8'hb1)) : reg103[(1'h1):(1'h1)]))) ?
                       $signed(wire99) : ($signed($unsigned((~wire52))) ^ $signed(wire54)));
  assign wire106 = wire56[(4'hc):(3'h4)];
  assign wire107 = wire106[(3'h4):(1'h0)];
  assign wire108 = (~^(^$signed(((wire102 >= reg60) ?
                       (reg61 ~^ wire52) : $signed(wire56)))));
  assign wire109 = ($unsigned(wire106[(1'h1):(1'h1)]) ?
                       $signed($signed({wire53[(4'h8):(3'h4)],
                           reg60[(4'hf):(1'h1)]})) : wire53);
  module110 #() modinst146 (wire145, clk, wire105, reg59, wire102, reg60);
  assign wire147 = wire57;
  assign wire148 = (($unsigned(wire109[(2'h3):(1'h1)]) || (+$unsigned(wire55))) + ($unsigned((reg60 + ((8'hb8) & reg104))) >>> wire106));
  assign wire149 = (((8'hb2) && $signed(($unsigned(reg104) ?
                           wire145[(1'h0):(1'h0)] : wire107))) ?
                       wire148[(3'h4):(1'h1)] : (wire105 | wire99[(3'h7):(3'h4)]));
endmodule

module module10
#(parameter param33 = ({(|{((7'h41) != (8'ha6))}), ((((8'ha9) ? (8'had) : (8'hae)) ? ((8'hb6) >>> (8'ha1)) : {(8'hba)}) ? (8'hb9) : (((7'h40) ? (8'ha0) : (8'hb0)) ? {(7'h41)} : ((8'hb8) ? (8'hb6) : (8'hb3))))} - {(~&((|(8'hba)) < ((8'haf) > (8'hb9))))}))
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(4'h8):(1'h0)] wire12;
  input wire [(3'h7):(1'h0)] wire13;
  input wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire28;
  assign y = {wire32, wire31, wire30, wire15, wire16, wire28, (1'h0)};
  assign wire15 = ((wire11[(4'he):(3'h4)] ?
                          wire13[(1'h1):(1'h1)] : ((wire11 ?
                                  wire14[(3'h4):(1'h1)] : $signed(wire13)) ?
                              $signed(wire12[(1'h0):(1'h0)]) : wire12)) ?
                      wire12[(1'h1):(1'h0)] : wire13);
  assign wire16 = ({wire14} - $unsigned((({wire12, (8'h9d)} ?
                      (wire14 ?
                          wire15 : wire13) : $unsigned(wire12)) ^ ({wire12,
                          wire14} ?
                      wire14 : ((8'hb1) ? (8'ha4) : wire12)))));
  module17 #() modinst29 (.wire21(wire16), .wire18(wire13), .wire19(wire11), .wire22(wire14), .y(wire28), .clk(clk), .wire20(wire12));
  assign wire30 = wire13;
  assign wire31 = wire16;
  assign wire32 = (&wire12[(2'h2):(1'h1)]);
endmodule

module module17
#(parameter param27 = ((+(^(&(8'ha0)))) + (~|(((8'hbf) ? (~^(8'haf)) : {(8'ha1)}) ? {(^~(8'ha4))} : ((~(8'hbd)) ? (+(8'ha4)) : (~(8'ha2)))))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire22;
  input wire signed [(2'h2):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire19;
  input wire [(3'h7):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  assign y = {wire26, wire25, wire24, wire23, (1'h0)};
  assign wire23 = $signed(({($signed(wire21) ? (~^wire20) : (wire22 <= wire22)),
                          (!(wire22 << (8'h9e)))} ?
                      $unsigned(($unsigned((8'ha3)) ?
                          (wire20 ~^ wire22) : (wire19 ?
                              wire18 : wire21))) : ({$unsigned(wire19),
                          (wire22 && wire19)} <= {(~^wire22)})));
  assign wire24 = wire21[(1'h0):(1'h0)];
  assign wire25 = (8'ha8);
  assign wire26 = $unsigned($unsigned((^~$unsigned(wire24[(4'hb):(1'h1)]))));
endmodule

module module110
#(parameter param143 = (&(((^~(~|(8'haf))) ? (!{(8'hb5), (7'h42)}) : ((-(8'haa)) ? ((8'hbb) ? (7'h42) : (8'hbd)) : ((8'hb8) ? (8'hbc) : (8'h9d)))) ? (!(~^((8'haf) | (8'h9d)))) : ((((8'h9c) ? (8'hb8) : (8'hb0)) ? ((8'hb1) ? (8'hb8) : (8'hb4)) : {(8'hba), (8'haf)}) == ((~|(8'ha1)) ? ((8'h9f) ? (8'hbc) : (7'h40)) : {(7'h44), (8'hab)})))), 
parameter param144 = {param143})
(y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire114;
  input wire signed [(4'h8):(1'h0)] wire113;
  input wire signed [(5'h15):(1'h0)] wire112;
  input wire signed [(2'h2):(1'h0)] wire111;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire141;
  wire [(4'hc):(1'h0)] wire140;
  wire [(2'h3):(1'h0)] wire139;
  wire signed [(4'he):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire [(3'h5):(1'h0)] wire136;
  wire [(5'h15):(1'h0)] wire115;
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(4'hc):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg122 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire115,
                 reg135,
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
                 (1'h0)};
  assign wire115 = wire114;
  always
    @(posedge clk) begin
      reg116 <= wire111[(1'h0):(1'h0)];
      if (({wire113[(4'h8):(3'h7)], reg116} ?
          ((((^reg116) ? wire112 : wire112) && $unsigned((+reg116))) ?
              (^$signed(reg116)) : $signed(wire112[(5'h11):(1'h1)])) : $signed(wire112[(3'h5):(2'h3)])))
        begin
          reg117 <= {(wire112[(4'ha):(3'h5)] ?
                  (8'ha5) : ({wire114[(4'hc):(4'h9)], wire111} ?
                      ((reg116 ?
                          wire115 : wire115) <= $unsigned(wire113)) : wire112[(2'h2):(1'h0)]))};
          if (wire113)
            begin
              reg118 <= $signed($unsigned(wire112[(1'h0):(1'h0)]));
              reg119 <= (8'ha4);
              reg120 <= (-$signed((-$signed((wire114 ~^ reg119)))));
              reg121 <= (^~$signed({$signed(wire115[(5'h11):(4'hf)])}));
            end
          else
            begin
              reg118 <= $unsigned(reg119);
              reg119 <= {(^$signed((~&(wire111 ? reg119 : reg116))))};
            end
          reg122 <= reg121[(2'h2):(2'h2)];
          reg123 <= ((8'hb3) ?
              (~|{(((8'hb8) >> reg118) != wire113),
                  ((wire112 + wire114) ?
                      {reg118} : (wire113 <= reg116))}) : reg120[(2'h3):(2'h3)]);
        end
      else
        begin
          reg117 <= $signed(reg119[(4'he):(2'h2)]);
          reg118 <= ((~&(reg121[(4'h9):(2'h2)] ?
                  ($signed(wire112) || wire115[(3'h6):(3'h6)]) : ((^reg117) ^~ wire111[(2'h2):(2'h2)]))) ?
              $signed(((reg117 ?
                  wire113[(3'h4):(2'h2)] : ((8'hb2) <= (7'h40))) * $signed(wire115))) : $unsigned(($signed(wire113) ?
                  $signed($unsigned((8'hb2))) : ((-reg123) ?
                      $signed(wire112) : (wire115 - wire112)))));
        end
      reg124 <= {{wire112[(3'h5):(3'h5)]}, $unsigned($signed(reg121))};
      if ($signed($signed((($signed(reg116) * (reg124 ?
          reg117 : reg117)) <<< reg118[(2'h2):(1'h0)]))))
        begin
          if ({(^$signed((((8'ha7) == (8'hba)) <= reg117[(1'h1):(1'h1)]))),
              $signed(({$signed(wire112)} || $signed({reg117})))})
            begin
              reg125 <= $unsigned(reg120);
              reg126 <= $unsigned($unsigned((~|($signed(reg124) ?
                  reg124[(5'h10):(5'h10)] : (reg117 ^~ reg125)))));
            end
          else
            begin
              reg125 <= (!$unsigned(reg117));
            end
        end
      else
        begin
          if ($signed((&$signed(((reg121 ^~ (8'hb0)) ?
              (~wire115) : (reg118 > wire112))))))
            begin
              reg125 <= $signed(((($unsigned(reg117) ?
                          $unsigned(reg124) : (~^reg125)) ?
                      {(~|reg118),
                          $signed(reg122)} : $unsigned($unsigned(reg120))) ?
                  $signed($signed(wire114)) : $signed(({wire113} & (8'hbe)))));
            end
          else
            begin
              reg125 <= {(wire114 || reg118[(1'h0):(1'h0)])};
              reg126 <= (&wire111);
            end
        end
    end
  always
    @(posedge clk) begin
      if ($signed((~wire114)))
        begin
          reg127 <= (&$unsigned(((^wire112[(4'h8):(2'h2)]) && ((wire111 ?
              (8'ha8) : reg122) & wire114[(4'hb):(4'hb)]))));
          if (wire111)
            begin
              reg128 <= reg125;
              reg129 <= $signed($signed(($signed((8'ha1)) && ((reg127 ?
                  (8'hb1) : (7'h43)) | (8'hb7)))));
              reg130 <= reg127;
              reg131 <= wire113;
            end
          else
            begin
              reg128 <= (reg118[(1'h1):(1'h1)] ?
                  $signed(reg118[(2'h3):(2'h3)]) : {reg118[(2'h2):(1'h1)]});
              reg129 <= (((({reg116} == (reg129 ?
                      reg124 : reg128)) || (8'ha8)) <<< $signed(reg129)) ?
                  wire113 : reg121);
              reg130 <= reg122;
            end
        end
      else
        begin
          reg127 <= ($signed({$signed($unsigned(reg116)),
                  (~^{wire112, reg126})}) ?
              $signed($unsigned(((reg117 <<< wire111) < reg123[(3'h4):(1'h0)]))) : reg120[(1'h0):(1'h0)]);
          reg128 <= (reg118[(4'h8):(3'h6)] << (reg119 ?
              reg127 : $signed((reg122[(2'h2):(1'h1)] == reg127))));
          reg129 <= (!$unsigned(reg127));
          reg130 <= (reg129[(1'h0):(1'h0)] ?
              $unsigned($unsigned((+(|reg116)))) : reg117[(3'h4):(1'h0)]);
          reg131 <= reg128;
        end
      reg132 <= $signed($unsigned((~|reg127[(3'h5):(3'h5)])));
      reg133 <= $unsigned((($unsigned(reg125[(3'h5):(3'h4)]) < $unsigned($signed(wire113))) ?
          wire113[(3'h7):(3'h5)] : (reg116 ?
              ({reg121, reg127} ?
                  $unsigned(reg131) : wire113[(4'h8):(1'h1)]) : $signed(reg117))));
      if (wire115)
        begin
          reg134 <= (((($unsigned(reg121) || reg128[(4'h9):(3'h4)]) ?
                      (((8'ha9) ? reg133 : reg116) >>> (~|wire111)) : wire111) ?
                  ($signed(reg125) >> $unsigned(reg131[(3'h6):(1'h1)])) : {reg119,
                      reg125[(3'h4):(1'h0)]}) ?
              $unsigned($unsigned($signed(reg117))) : (($signed((reg124 ?
                  reg125 : reg123)) >> ((reg126 > reg116) ?
                  (~|(8'hb1)) : $signed((8'hab)))) || (^($signed(wire115) + (wire114 ?
                  reg121 : reg130)))));
        end
      else
        begin
          reg134 <= $unsigned(($signed((!$signed(reg133))) ?
              {$signed($signed(reg117))} : wire115[(1'h0):(1'h0)]));
          reg135 <= {reg132[(4'hb):(3'h7)]};
        end
    end
  assign wire136 = (~|{reg125[(3'h4):(2'h3)]});
  assign wire137 = ({($unsigned({(7'h40), reg135}) ? (^~(-reg121)) : reg124),
                           (&$signed((reg129 ^ reg120)))} ?
                       reg131[(3'h7):(3'h7)] : reg117[(2'h3):(1'h1)]);
  assign wire138 = reg122[(3'h7):(2'h2)];
  assign wire139 = {{$unsigned($signed($unsigned(wire115)))},
                       reg126[(3'h7):(3'h5)]};
  assign wire140 = ((wire139[(1'h0):(1'h0)] <<< reg125[(2'h2):(1'h0)]) ?
                       {wire136[(1'h0):(1'h0)]} : ($signed((!reg119)) ~^ $unsigned(reg135)));
  assign wire141 = (8'hbd);
  assign wire142 = ($unsigned((wire111 ?
                           (~(wire113 ? wire139 : reg123)) : wire113)) ?
                       {wire114,
                           (reg125 | {reg129,
                               (reg126 ~^ reg134)})} : $unsigned((((reg118 ?
                           reg122 : wire140) ^ $signed(wire141)) - ((wire113 + reg124) + wire139[(2'h3):(2'h2)]))));
endmodule

module module62
#(parameter param97 = ((|{{(^~(8'ha9)), (^(8'ha0))}}) <<< (({{(8'hb7)}, ((8'ha0) >>> (8'hb9))} - (~((8'hbf) || (8'hbf)))) ? ((((8'haf) + (8'hb3)) ? ((8'hbe) < (8'hb0)) : ((8'h9f) <= (8'hb6))) ? ({(8'hac), (8'hab)} ? ((8'ha2) ? (8'hac) : (8'ha5)) : ((8'ha4) >>> (8'hb2))) : ({(7'h41)} | {(8'hbb), (8'h9f)})) : ((((8'hb4) ? (8'h9f) : (8'h9e)) ? ((8'hac) ? (8'hb6) : (8'ha8)) : (8'had)) ? (+((8'ha2) + (8'ha8))) : (((8'hb6) ? (8'ha0) : (7'h41)) >> (+(8'h9c)))))), 
parameter param98 = {((((param97 ~^ param97) ? (param97 ^ param97) : {(8'hac)}) ~^ ({param97, param97} >= param97)) << (({(8'hb5), param97} == (param97 > param97)) >> (param97 && (-param97))))})
(y, clk, wire67, wire66, wire65, wire64, wire63);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire67;
  input wire signed [(2'h2):(1'h0)] wire66;
  input wire [(5'h13):(1'h0)] wire65;
  input wire [(5'h13):(1'h0)] wire64;
  input wire [(4'h9):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire96;
  wire [(4'h8):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  assign y = {wire96,
                 wire70,
                 wire69,
                 wire68,
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
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire68 = (|{$signed($signed($signed((8'h9c))))});
  assign wire69 = {{$signed((wire68 ? $unsigned(wire67) : $signed(wire63)))},
                      ((&(wire66[(2'h2):(1'h0)] != ((8'hb2) & wire67))) ?
                          $signed(wire68) : $signed($signed(((8'hb4) ?
                              wire65 : wire63))))};
  assign wire70 = $signed(wire63[(3'h7):(3'h7)]);
  always
    @(posedge clk) begin
      reg71 <= $unsigned(wire63[(3'h4):(1'h0)]);
      reg72 <= ($signed((~|(wire67[(3'h5):(3'h5)] ?
              (wire63 | wire70) : {wire63, wire68}))) ?
          $unsigned($unsigned(((!wire66) >> {wire66}))) : $signed($unsigned($unsigned(wire67))));
      if ((8'haa))
        begin
          reg73 <= {{($signed((reg71 ?
                      wire67 : reg71)) >>> $unsigned(wire70[(3'h7):(2'h3)]))}};
          reg74 <= wire64[(4'hc):(3'h6)];
        end
      else
        begin
          if ($signed(reg74))
            begin
              reg73 <= reg72[(1'h1):(1'h0)];
            end
          else
            begin
              reg73 <= $signed((~|(^~(&(wire70 >= wire66)))));
              reg74 <= reg72[(4'h9):(3'h5)];
              reg75 <= wire68[(3'h5):(1'h0)];
              reg76 <= wire64[(3'h6):(3'h5)];
              reg77 <= (^wire66);
            end
          if ($unsigned($unsigned(reg71)))
            begin
              reg78 <= reg71;
              reg79 <= wire63[(1'h0):(1'h0)];
              reg80 <= $unsigned({(wire69[(5'h10):(2'h2)] ?
                      ((reg78 ? reg76 : reg78) ?
                          (reg76 ? reg76 : wire63) : {reg71,
                              reg71}) : reg79[(4'hc):(3'h7)])});
              reg81 <= reg79;
              reg82 <= ($signed(reg73) && (8'hbf));
            end
          else
            begin
              reg78 <= wire67;
            end
          reg83 <= ((~wire67) ?
              $signed((reg81 <= ($signed(wire64) || ((7'h44) ^ wire66)))) : wire67);
          if (reg82[(4'h8):(3'h5)])
            begin
              reg84 <= reg83[(4'he):(4'hb)];
              reg85 <= wire66;
              reg86 <= {$signed($unsigned($unsigned((reg73 ?
                      reg83 : wire67))))};
              reg87 <= (reg81[(3'h5):(2'h2)] ?
                  (^(+((~^wire69) >= (wire65 ? reg82 : reg80)))) : reg85);
              reg88 <= $signed((reg74[(3'h4):(2'h3)] + (reg84 ?
                  (wire70 ?
                      (wire70 <<< reg83) : reg79) : $signed((~&wire68)))));
            end
          else
            begin
              reg84 <= $unsigned(($unsigned($unsigned((+reg73))) ?
                  reg76[(4'hc):(4'hc)] : reg88));
            end
          if ($signed(((-(wire64[(4'h9):(3'h4)] ?
              (reg85 ?
                  reg84 : wire70) : reg79[(3'h7):(3'h7)])) <= (-{$signed(wire63),
              reg78}))))
            begin
              reg89 <= reg81[(3'h5):(2'h2)];
              reg90 <= $unsigned((|wire67[(3'h4):(1'h1)]));
              reg91 <= ((~&$signed(wire69[(4'ha):(1'h1)])) ?
                  reg89[(1'h1):(1'h1)] : reg71[(2'h3):(2'h3)]);
              reg92 <= $unsigned(reg83);
              reg93 <= reg79;
            end
          else
            begin
              reg89 <= $unsigned((8'hbc));
              reg90 <= (|((-{(8'hba), $signed(reg87)}) && reg91));
              reg91 <= ((!((((8'hb6) ? wire64 : wire69) ?
                      (reg77 <<< reg79) : $signed(wire64)) >= $unsigned({wire66,
                      reg76}))) ?
                  ($signed(($signed(reg75) >>> (reg93 && reg76))) ?
                      (8'ha4) : $signed(wire66)) : $signed($unsigned(reg76)));
            end
        end
      reg94 <= {($signed(({reg74, (8'hac)} - $signed(reg83))) | reg83),
          reg72[(2'h3):(2'h3)]};
      reg95 <= $unsigned({wire69});
    end
  assign wire96 = wire67[(1'h1):(1'h1)];
endmodule
