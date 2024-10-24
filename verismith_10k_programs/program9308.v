module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire170;
  wire signed [(5'h13):(1'h0)] wire165;
  wire [(4'hd):(1'h0)] wire139;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire147;
  wire signed [(3'h5):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire149;
  wire [(4'hd):(1'h0)] wire151;
  wire [(3'h5):(1'h0)] wire152;
  wire [(5'h13):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire156;
  wire [(3'h4):(1'h0)] wire157;
  wire [(5'h12):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire159;
  wire [(3'h7):(1'h0)] wire160;
  wire [(4'he):(1'h0)] wire161;
  wire [(4'hc):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire163;
  reg [(4'h9):(1'h0)] reg169 = (1'h0);
  reg [(5'h12):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg166 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg142 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(4'hf):(1'h0)] reg144 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(4'hb):(1'h0)] reg154 = (1'h0);
  assign y = {wire170,
                 wire165,
                 wire139,
                 wire5,
                 wire147,
                 wire148,
                 wire149,
                 wire151,
                 wire152,
                 wire153,
                 wire155,
                 wire156,
                 wire157,
                 wire158,
                 wire159,
                 wire160,
                 wire161,
                 wire162,
                 wire163,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg150,
                 reg154,
                 (1'h0)};
  assign wire5 = wire0;
  module6 #() modinst140 (wire139, clk, wire3, wire2, wire0, wire4, wire5);
  always
    @(posedge clk) begin
      if (($unsigned($unsigned($signed((8'hb7)))) | wire4))
        begin
          reg141 <= wire139[(4'hb):(4'ha)];
          reg142 <= wire2[(1'h1):(1'h1)];
          reg143 <= (^wire139);
          reg144 <= $unsigned((($unsigned({reg141}) ?
              {(^wire3),
                  (wire0 ? reg141 : wire4)} : $unsigned(wire4)) ~^ {{(8'hb8),
                  (wire5 - reg143)},
              $signed(reg142)}));
          reg145 <= $unsigned(reg144);
        end
      else
        begin
          if (wire1[(2'h3):(1'h0)])
            begin
              reg141 <= (+(7'h41));
              reg142 <= wire3[(1'h0):(1'h0)];
              reg143 <= wire139;
              reg144 <= {(8'ha4)};
            end
          else
            begin
              reg141 <= $unsigned($unsigned(reg141));
              reg142 <= ((~^(wire1 ?
                      wire0 : (wire0[(3'h6):(3'h6)] ?
                          $signed(wire139) : wire5))) ?
                  ((~((~|wire5) << {reg144})) || {$unsigned(wire139),
                      reg144}) : reg145[(2'h3):(2'h2)]);
              reg143 <= (reg141 >= (((wire3 || ((8'hbd) ^ wire5)) ?
                      $signed($signed(wire2)) : {$unsigned(wire5)}) ?
                  (wire0 != (reg145 ?
                      wire0 : (~^reg143))) : wire4[(3'h7):(3'h4)]));
              reg144 <= $signed($unsigned($unsigned($signed((^~(8'hab))))));
              reg145 <= ($unsigned((~^((wire0 ?
                  reg143 : wire5) << $unsigned(reg141)))) >>> reg143);
            end
          reg146 <= (!$signed(reg143));
        end
    end
  assign wire147 = $unsigned(wire4);
  assign wire148 = $signed(($signed(wire5) ?
                       (8'hbb) : (!$unsigned(((8'hab) ? wire2 : reg143)))));
  assign wire149 = $unsigned(wire148);
  always
    @(posedge clk) begin
      reg150 <= {(^~(reg142[(3'h4):(1'h1)] ?
              reg143[(1'h1):(1'h0)] : {$unsigned(wire149),
                  wire1[(2'h2):(1'h1)]}))};
    end
  assign wire151 = (^reg146[(3'h4):(1'h1)]);
  assign wire152 = (|(~$signed($signed({wire5}))));
  assign wire153 = (($signed((~&reg142)) ?
                           $unsigned(reg143[(2'h3):(2'h2)]) : (($unsigned((7'h42)) && (reg144 ?
                                   wire147 : wire4)) ?
                               $unsigned((!reg145)) : (~|wire4))) ?
                       wire147[(2'h2):(2'h2)] : $unsigned({(wire139 ?
                               wire3 : (wire4 ? wire147 : wire1)),
                           ((wire4 >= wire4) >> (wire1 ? (8'h9d) : (8'hb5)))}));
  always
    @(posedge clk) begin
      reg154 <= $unsigned(($unsigned((((8'ha3) < wire152) ?
          (~&wire149) : wire152)) - wire153));
    end
  assign wire155 = ((($signed(wire1) ?
                       wire3[(1'h1):(1'h0)] : ((wire3 >= wire149) ^ $unsigned(reg146))) <<< ($unsigned(wire153) ?
                       $unsigned((reg154 ?
                           reg141 : (8'hb2))) : wire4[(2'h2):(1'h1)])) + wire148);
  assign wire156 = {{$signed(((wire155 ? reg150 : wire2) <<< (reg154 ?
                               reg142 : reg141))),
                           (!wire147[(4'hc):(1'h1)])},
                       reg154[(4'hb):(4'ha)]};
  assign wire157 = wire0[(5'h12):(4'hc)];
  assign wire158 = ((&wire5[(5'h12):(4'hf)]) ~^ ($signed((~(wire5 ?
                           wire5 : (8'hb6)))) ?
                       $signed((~|(wire148 ?
                           wire153 : wire3))) : ($signed(wire1) ^~ (wire5[(3'h5):(2'h3)] + $signed(reg144)))));
  assign wire159 = (($signed((~(wire2 ? wire147 : wire0))) ?
                       $unsigned((-((8'ha1) >>> wire0))) : $unsigned(({wire0,
                           reg145} + reg150))) ~^ $signed(wire147[(4'hb):(1'h0)]));
  assign wire160 = reg150;
  assign wire161 = wire151[(1'h1):(1'h1)];
  assign wire162 = $unsigned(((|wire148) ?
                       (^reg141) : ((|((8'ha2) ? wire158 : wire149)) ?
                           (^(reg146 ? wire152 : wire0)) : ((wire160 ?
                               wire0 : reg142) != wire4))));
  module51 #() modinst164 (.wire54(wire4), .y(wire163), .clk(clk), .wire53(wire0), .wire55(wire156), .wire52(reg141));
  assign wire165 = ((((-reg141) - (-$signed(wire155))) * $signed($signed((wire156 ?
                       (8'ha7) : (8'h9c))))) <<< $signed(($signed((wire139 ~^ (8'hbf))) - wire147)));
  always
    @(posedge clk) begin
      reg166 <= {wire3[(1'h1):(1'h0)]};
      reg167 <= (8'hb0);
      reg168 <= {(8'ha4)};
      reg169 <= $unsigned($signed($unsigned(($signed(reg167) ?
          reg144 : {wire148, wire153}))));
    end
  assign wire170 = wire139;
endmodule

module module6
#(parameter param137 = (&(^~(&(((8'hb0) ? (8'haf) : (7'h41)) ? ((8'ha8) + (7'h42)) : (~^(8'hb2)))))), 
parameter param138 = (&((^((|param137) | (~param137))) ~^ (((^~param137) ? (param137 ? (8'hb9) : (8'hb1)) : (+param137)) ? {(^param137)} : param137))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire100;
  wire signed [(4'hf):(1'h0)] wire101;
  wire [(3'h4):(1'h0)] wire123;
  wire [(5'h11):(1'h0)] wire135;
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  assign y = {wire86,
                 wire12,
                 wire13,
                 wire16,
                 wire49,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire95,
                 wire96,
                 wire97,
                 wire98,
                 wire99,
                 wire100,
                 wire101,
                 wire123,
                 wire135,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire12 = (8'hba);
  assign wire13 = wire9[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg14 <= wire10;
      reg15 <= {(wire10 >= wire7)};
    end
  assign wire16 = $unsigned({(wire7 ?
                          $unsigned($signed(wire10)) : (&$unsigned((8'hae)))),
                      {wire8, $unsigned((wire7 ~^ wire12))}});
  module17 #() modinst50 (.wire18(wire7), .wire21(wire9), .clk(clk), .wire22(wire11), .wire19(wire10), .wire20(wire16), .y(wire49));
  module51 #() modinst87 (wire86, clk, wire49, wire10, reg14, wire12);
  assign wire88 = (~&wire9[(5'h11):(2'h3)]);
  assign wire89 = (((($unsigned(wire86) || $signed((8'h9c))) == (~^$signed(wire86))) + wire16[(4'ha):(4'ha)]) ?
                      $signed(wire86) : $signed({(~(wire86 < wire8)),
                          ((wire9 >> wire88) ?
                              (wire9 - (8'ha3)) : $signed(reg15))}));
  assign wire90 = {$unsigned(reg15[(4'h8):(3'h7)])};
  assign wire91 = $unsigned($signed(wire90[(1'h1):(1'h1)]));
  assign wire92 = wire9[(4'h9):(3'h4)];
  assign wire93 = wire12[(3'h7):(3'h7)];
  assign wire94 = $unsigned({$signed(wire86), $unsigned(wire90)});
  assign wire95 = $signed((wire49 ?
                      $unsigned(((wire12 - wire88) ?
                          ((8'hb8) - wire9) : (~^reg14))) : (((~^wire93) >= (~|(7'h44))) >>> wire94[(3'h5):(3'h4)])));
  assign wire96 = (wire88[(5'h13):(5'h10)] ^~ wire92[(2'h3):(2'h3)]);
  assign wire97 = (reg15[(3'h4):(2'h3)] ?
                      wire96[(4'hb):(1'h1)] : $unsigned(reg14[(2'h3):(2'h3)]));
  assign wire98 = ($unsigned(((wire9 == $signed(wire95)) <= wire16)) ?
                      ((~|wire92) - ($unsigned((wire12 << wire86)) || ($unsigned(wire16) >> $signed(wire9)))) : wire95[(1'h0):(1'h0)]);
  assign wire99 = ({((8'hb8) && (~&$unsigned(wire95))),
                          (reg15[(4'h9):(4'h9)] <<< $unsigned((wire92 ?
                              (8'ha7) : (8'ha0))))} ?
                      (~^($unsigned($signed((8'hab))) > ((!wire13) ?
                          (wire10 && wire94) : $unsigned((8'hb7))))) : $signed($unsigned((8'hba))));
  assign wire100 = (^wire88);
  assign wire101 = (wire16 || wire7);
  module102 #() modinst124 (.wire105(wire99), .wire104(wire101), .wire106(wire86), .wire103(wire7), .y(wire123), .clk(clk));
  module125 #() modinst136 (wire135, clk, wire100, wire12, wire91, wire96, wire90);
endmodule

module module125  (y, clk, wire130, wire129, wire128, wire127, wire126);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire130;
  input wire [(5'h10):(1'h0)] wire129;
  input wire signed [(5'h11):(1'h0)] wire128;
  input wire [(5'h12):(1'h0)] wire127;
  input wire [(4'h8):(1'h0)] wire126;
  wire signed [(2'h3):(1'h0)] wire134;
  wire signed [(3'h4):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire132;
  wire signed [(4'hd):(1'h0)] wire131;
  assign y = {wire134, wire133, wire132, wire131, (1'h0)};
  assign wire131 = ($signed(wire126[(2'h2):(1'h0)]) ?
                       (($signed((8'ha9)) > wire126) == wire126) : (&(wire127 ?
                           (wire126 - $unsigned((8'ha0))) : ((~^wire130) <= wire129[(4'hd):(3'h5)]))));
  assign wire132 = (8'hab);
  assign wire133 = (wire129[(5'h10):(3'h7)] ?
                       wire132 : $unsigned({$signed($unsigned(wire129))}));
  assign wire134 = $signed($signed(($signed(((8'ha8) >> wire127)) ?
                       $unsigned((^~wire130)) : wire131)));
endmodule

module module102
#(parameter param121 = ((8'ha8) ? ((((~(8'ha8)) <<< ((8'h9c) & (8'hbd))) ? ({(8'ha1)} > {(8'had)}) : (^~((8'h9f) ? (8'ha5) : (8'hb5)))) ? (|({(8'hbf)} + ((8'ha3) ? (8'haa) : (8'hba)))) : (8'haa)) : ((8'ha4) << (8'h9d))), 
parameter param122 = (~&((({param121, param121} ? ((8'hab) ? param121 : param121) : (param121 ? param121 : param121)) ? ((param121 ? param121 : param121) ^ (param121 ? param121 : param121)) : (-(param121 != param121))) ? (param121 ? param121 : {(param121 ^ param121)}) : (~&((param121 ? param121 : param121) == param121)))))
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire106;
  input wire signed [(3'h6):(1'h0)] wire105;
  input wire signed [(4'hc):(1'h0)] wire104;
  input wire [(5'h12):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire107;
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire107 = wire103;
  assign wire108 = (+(wire104[(2'h3):(1'h1)] ?
                       ({{wire104, wire107}} ?
                           $signed(wire103) : $unsigned((~wire105))) : $unsigned($signed((|wire104)))));
  assign wire109 = (^~$unsigned($signed(wire105)));
  assign wire110 = wire109;
  assign wire111 = {wire108, wire106[(5'h12):(2'h2)]};
  assign wire112 = (~|$signed(wire108[(4'ha):(4'h8)]));
  always
    @(posedge clk) begin
      reg113 <= (!(^wire106));
      reg114 <= wire106[(5'h11):(4'hd)];
      reg115 <= $unsigned(wire105[(3'h6):(3'h4)]);
      reg116 <= (|(|$unsigned($signed(((8'haf) ^~ wire103)))));
      if ((&(wire106 ~^ {$unsigned($unsigned(wire109))})))
        begin
          reg117 <= ({wire109[(4'h9):(4'h9)],
                  ($signed((&(8'hb9))) || {reg114,
                      (wire107 ? (8'hb2) : wire103)})} ?
              (^~((+wire104) ?
                  $signed($unsigned(wire105)) : (~^reg116[(1'h1):(1'h0)]))) : $unsigned((~|($unsigned(reg115) <<< wire108[(3'h5):(1'h0)]))));
          reg118 <= (wire109[(4'h9):(4'h9)] ?
              (~^reg115[(3'h7):(3'h5)]) : wire105);
          reg119 <= $unsigned(wire106);
          reg120 <= reg116[(3'h6):(3'h6)];
        end
      else
        begin
          reg117 <= wire106[(4'h9):(1'h0)];
        end
    end
endmodule

module module51
#(parameter param84 = (!(~((~((8'hab) <<< (8'hb8))) - (!((8'h9c) + (8'haa)))))), 
parameter param85 = ((|(7'h43)) ? (((~^(param84 ? (8'hb9) : param84)) <= {{param84}}) >= (+param84)) : param84))
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire55;
  input wire signed [(4'hb):(1'h0)] wire54;
  input wire signed [(4'he):(1'h0)] wire53;
  input wire signed [(3'h4):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire83;
  wire [(5'h12):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
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
                 (1'h0)};
  assign wire56 = $unsigned($signed($signed($unsigned((|wire54)))));
  assign wire57 = (((wire52 + $unsigned($unsigned(wire55))) << $unsigned(($unsigned(wire55) ?
                      $signed(wire52) : {wire54,
                          (8'haa)}))) ^ wire54[(1'h0):(1'h0)]);
  assign wire58 = (8'ha6);
  assign wire59 = (~^wire52);
  assign wire60 = (wire55[(2'h3):(1'h0)] >= (wire59 ?
                      (!({wire52} ?
                          (wire57 ?
                              wire57 : wire54) : $unsigned(wire59))) : {((~|wire53) ?
                              ((8'ha3) ? (8'hbf) : wire55) : wire53)}));
  always
    @(posedge clk) begin
      if ((~|$signed({$signed($unsigned(wire55)), $signed({wire55, wire60})})))
        begin
          reg61 <= (~|{(((wire59 ?
                  wire55 : wire58) >> ((8'hbb) < wire54)) >>> wire58[(3'h6):(3'h5)])});
          reg62 <= wire56;
        end
      else
        begin
          if (((~^$signed((~&(~&reg62)))) ?
              (($unsigned($unsigned(wire56)) >>> ((wire57 < wire56) >> (^(8'hac)))) * $unsigned(wire56[(1'h1):(1'h1)])) : (~$unsigned($signed(wire53)))))
            begin
              reg61 <= ($signed((^wire60)) ?
                  (~^wire59) : $signed($unsigned(wire57)));
              reg62 <= {wire54[(1'h1):(1'h0)]};
            end
          else
            begin
              reg61 <= (((-$unsigned($unsigned(wire56))) ?
                      $unsigned(wire53) : (8'hbf)) ?
                  wire60 : wire60[(1'h0):(1'h0)]);
              reg62 <= (~|reg61);
              reg63 <= (((8'hbf) ?
                  $unsigned(reg61) : (wire60 ?
                      reg62 : $unsigned($signed(reg61)))) < ((wire59 ?
                  wire57[(4'hc):(3'h7)] : {$unsigned(wire60)}) && $unsigned((+{wire56,
                  wire55}))));
            end
          reg64 <= (reg62 ?
              $unsigned({$unsigned(reg61[(4'hd):(4'hd)])}) : reg63);
          reg65 <= $signed(((^~(^reg63)) < $signed((-$unsigned(wire57)))));
          if ($unsigned($unsigned((8'hb5))))
            begin
              reg66 <= ((~&((|(~wire55)) ?
                      (((8'hbf) ?
                          reg64 : wire58) >= reg62) : (wire52[(2'h3):(1'h1)] ?
                          (wire56 ? wire60 : wire54) : ((8'ha0) + wire54)))) ?
                  wire60 : $unsigned($unsigned($signed((~&wire52)))));
              reg67 <= (!$unsigned($signed($unsigned((wire53 * reg65)))));
            end
          else
            begin
              reg66 <= reg63[(1'h0):(1'h0)];
              reg67 <= ($signed($unsigned($unsigned(reg61))) ?
                  ($unsigned($unsigned((reg66 ? wire59 : reg64))) ?
                      $signed(($signed(wire59) ?
                          $unsigned(wire56) : (-wire56))) : (wire53[(4'hb):(3'h4)] ?
                          {wire58[(2'h2):(1'h1)], (8'ha4)} : ((reg61 ?
                                  wire53 : reg67) ?
                              (wire58 ?
                                  wire57 : wire54) : (+reg64)))) : wire59);
            end
        end
      reg68 <= wire58[(4'ha):(3'h7)];
      reg69 <= ((~|wire59[(1'h1):(1'h1)]) && $signed(wire57));
      reg70 <= reg64;
      reg71 <= (!((({reg68} ? (wire60 >= wire54) : reg70[(2'h2):(1'h0)]) ?
          wire56[(4'hd):(4'h8)] : $unsigned((reg70 + (8'ha9)))) && $unsigned(wire56)));
    end
  assign wire72 = (^(reg62 ? (~|(~^wire58)) : $signed((-(wire59 | reg71)))));
  assign wire73 = $unsigned((reg63 << (wire72 > wire58)));
  assign wire74 = (reg63[(2'h3):(2'h3)] ?
                      ($signed({(reg69 ? wire72 : reg65)}) ?
                          (wire57 - $signed((~|reg64))) : ($unsigned(wire58[(3'h6):(2'h3)]) << ($signed(reg66) ?
                              reg67 : (reg64 ?
                                  wire52 : wire56)))) : wire59[(1'h1):(1'h0)]);
  assign wire75 = reg62[(3'h6):(3'h4)];
  assign wire76 = ((~|reg70[(3'h6):(3'h6)]) | $signed((7'h42)));
  assign wire77 = reg69[(3'h5):(1'h1)];
  assign wire78 = $signed((^$signed({(wire75 * wire74),
                      reg69[(3'h5):(1'h0)]})));
  assign wire79 = $signed($unsigned(($signed({wire58}) || $unsigned(wire56[(3'h5):(1'h0)]))));
  assign wire80 = (reg67[(3'h4):(2'h3)] >= (~|$unsigned($unsigned((reg66 * reg71)))));
  assign wire81 = $unsigned(reg65[(4'ha):(2'h3)]);
  assign wire82 = wire56;
  assign wire83 = $signed($signed((8'hb9)));
endmodule

module module17
#(parameter param47 = (&((((|(8'ha9)) ? {(8'hb2)} : ((8'hb8) ^~ (8'hba))) < (-(^~(8'hab)))) ? (~|(^((8'had) == (8'hb3)))) : (^~(+(&(8'had)))))), 
parameter param48 = ((~&param47) <<< param47))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire22;
  input wire [(5'h15):(1'h0)] wire21;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire signed [(3'h7):(1'h0)] wire19;
  input wire [(3'h5):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire23;
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire28,
                 wire27,
                 wire23,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = (8'ha4);
  always
    @(posedge clk) begin
      reg24 <= (&wire20);
      reg25 <= (wire23[(1'h1):(1'h1)] ?
          (~(&wire20[(4'h8):(1'h1)])) : wire23[(4'h8):(2'h3)]);
      reg26 <= reg25;
    end
  assign wire27 = (~(&wire18));
  assign wire28 = {wire21, wire20};
  always
    @(posedge clk) begin
      if ($unsigned({wire22, ((8'ha9) << wire23)}))
        begin
          reg29 <= $unsigned((&($signed(wire28[(2'h3):(2'h2)]) ?
              {(wire22 >> wire23)} : (8'hbb))));
          reg30 <= (^~$signed((wire28 == $signed((wire21 < wire19)))));
          reg31 <= wire27[(4'hc):(4'hc)];
          reg32 <= (^~wire20[(4'he):(3'h4)]);
        end
      else
        begin
          if ((&($unsigned(reg30) | (wire21 ?
              reg31[(2'h3):(1'h1)] : $signed((reg30 != reg32))))))
            begin
              reg29 <= (~|(|$signed($unsigned($signed(reg31)))));
              reg30 <= wire22;
            end
          else
            begin
              reg29 <= reg32[(2'h2):(1'h0)];
              reg30 <= $signed(wire19);
              reg31 <= $signed(wire23);
              reg32 <= (^wire22);
            end
          reg33 <= (wire20 >= $unsigned($signed((wire22 ?
              $unsigned(wire18) : wire22))));
          reg34 <= $signed({$unsigned(reg29[(4'hd):(4'hb)])});
          reg35 <= $unsigned(reg32[(5'h14):(4'h8)]);
          reg36 <= $signed(wire27);
        end
      reg37 <= $signed($signed(wire19));
      reg38 <= {(&wire21[(5'h15):(4'h8)])};
      reg39 <= (-(8'ha5));
      reg40 <= (~$unsigned((~^reg39)));
    end
  assign wire41 = wire28;
  assign wire42 = {(+reg32[(4'hb):(4'h8)])};
  assign wire43 = (!wire27);
  assign wire44 = $unsigned(((reg40[(1'h0):(1'h0)] ?
                          (reg33[(1'h0):(1'h0)] * wire22) : wire19) ?
                      ({wire20,
                          {(8'ha0)}} & $unsigned($unsigned(reg40))) : $signed((((8'hbd) ?
                              reg29 : wire18) ?
                          reg39[(3'h5):(3'h4)] : ((8'hb8) ? wire20 : reg31)))));
  assign wire45 = reg24[(3'h5):(3'h4)];
  assign wire46 = (({reg37} > $unsigned(($unsigned(reg31) - wire21))) <= {(&(+wire19[(3'h5):(3'h5)]))});
endmodule
