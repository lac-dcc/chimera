module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2f8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire194;
  wire signed [(4'hc):(1'h0)] wire182;
  wire [(4'he):(1'h0)] wire180;
  wire signed [(5'h14):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire184;
  wire [(5'h12):(1'h0)] wire185;
  wire [(2'h2):(1'h0)] wire187;
  wire signed [(4'he):(1'h0)] wire188;
  wire signed [(3'h5):(1'h0)] wire189;
  wire [(4'ha):(1'h0)] wire190;
  wire [(4'h8):(1'h0)] wire191;
  wire signed [(4'hd):(1'h0)] wire192;
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire194,
                 wire182,
                 wire180,
                 wire95,
                 wire14,
                 wire18,
                 wire19,
                 wire93,
                 wire184,
                 wire185,
                 wire187,
                 wire188,
                 wire189,
                 wire190,
                 wire191,
                 wire192,
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
                 reg37,
                 reg36,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 reg15,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~|wire0))
        begin
          reg5 <= $unsigned(({(wire4[(4'ha):(4'h8)] ?
                      wire2[(4'he):(4'he)] : (wire2 < wire3)),
                  {$unsigned(wire4)}} ?
              (8'hbe) : $signed($signed((wire0 ? wire1 : wire1)))));
          reg6 <= $unsigned((!$unsigned((reg5 || (reg5 ? wire1 : wire4)))));
        end
      else
        begin
          reg5 <= ((($signed($unsigned(wire2)) ?
                  $unsigned((wire1 ? wire2 : wire2)) : {reg5,
                      (&wire4)}) > $unsigned($unsigned({reg6}))) ?
              reg5[(4'hd):(4'hb)] : (((+(reg5 + (8'hb5))) <<< (~|$signed(wire2))) ?
                  (~wire2) : wire0[(5'h10):(4'hd)]));
          if ($unsigned(wire1[(3'h5):(1'h0)]))
            begin
              reg6 <= (reg5[(4'hd):(4'h9)] ? wire3[(5'h10):(4'he)] : (8'ha4));
              reg7 <= wire4;
              reg8 <= $signed(wire1);
              reg9 <= wire2[(3'h5):(3'h4)];
              reg10 <= ($unsigned({$unsigned(wire4),
                      $unsigned($unsigned(reg9))}) ?
                  (reg7 * (($signed(reg7) == (~&wire2)) ?
                      ((~^reg8) << ((7'h44) ?
                          (8'ha6) : (8'hb0))) : ($signed(reg5) ?
                          (reg8 ?
                              reg6 : wire3) : (reg6 <<< reg6)))) : $unsigned($unsigned(reg9[(3'h4):(1'h0)])));
            end
          else
            begin
              reg6 <= (wire2[(5'h10):(2'h3)] ?
                  (&$signed((~|(reg10 ?
                      (8'hb9) : wire3)))) : $signed($unsigned(reg9[(3'h7):(3'h7)])));
              reg7 <= ($signed((({(7'h41)} - (reg7 ? (8'hb1) : (8'ha6))) ?
                      wire2[(1'h1):(1'h0)] : $signed((wire0 <= reg10)))) ?
                  (~^reg8) : wire3[(4'hf):(3'h5)]);
              reg8 <= (wire1 + wire1);
            end
          reg11 <= (($signed(reg6[(4'h8):(2'h3)]) | wire0[(5'h10):(3'h7)]) ?
              $signed((~(((8'ha6) << reg7) ~^ $unsigned(wire0)))) : (^~(!wire3[(4'h8):(2'h3)])));
        end
      reg12 <= $unsigned($signed(($signed($signed(reg8)) == ((~reg6) <<< $signed((8'hb2))))));
      reg13 <= (!wire4);
    end
  assign wire14 = $signed({{(+$unsigned(reg11))}});
  always
    @(posedge clk) begin
      reg15 <= (~{((wire14 ? reg6[(4'h8):(3'h7)] : reg10) ?
              $unsigned((wire0 >>> wire4)) : $unsigned($signed((8'hb7))))});
      reg16 <= wire14;
      reg17 <= $signed(($signed(((reg6 | reg16) > $signed(reg13))) ?
          ($signed($unsigned(wire3)) + wire3[(5'h11):(1'h0)]) : $unsigned(((~reg9) >> reg9[(5'h10):(1'h1)]))));
    end
  assign wire18 = $unsigned($signed(reg8[(2'h3):(2'h2)]));
  assign wire19 = reg15;
  always
    @(posedge clk) begin
      reg20 <= wire4;
      if ($signed($unsigned(reg17[(3'h4):(1'h1)])))
        begin
          reg21 <= $unsigned($signed(($unsigned($signed((8'hb5))) ^ (+reg6))));
          if ($unsigned(reg7[(1'h1):(1'h1)]))
            begin
              reg22 <= $unsigned(reg6);
              reg23 <= ({(reg7 & (~^wire4))} ?
                  reg5 : ((^(+reg22)) >> (^~(+(wire2 & reg12)))));
              reg24 <= $signed(reg10);
              reg25 <= $signed($signed((&$signed(reg24[(5'h12):(4'hd)]))));
            end
          else
            begin
              reg22 <= $unsigned((((|reg7) <= {(!reg20), (8'ha8)}) ?
                  ((~&(8'hb2)) <<< {reg7,
                      (reg11 || wire14)}) : (^~reg11[(3'h7):(3'h7)])));
              reg23 <= $unsigned((reg20[(3'h4):(1'h0)] ?
                  ((reg9[(4'hd):(3'h6)] ?
                      reg7[(3'h6):(3'h4)] : (|reg11)) || (8'hab)) : (^~$unsigned(wire18))));
              reg24 <= $unsigned($signed(((8'hbd) ? reg15 : (&{reg11, reg5}))));
              reg25 <= ($unsigned((reg5 ?
                  wire18 : (~^(reg22 ?
                      reg17 : reg15)))) >= $unsigned((+($signed(reg11) ?
                  (wire3 ? reg5 : reg13) : (8'ha1)))));
              reg26 <= ($unsigned((((&reg15) ?
                      (~reg22) : reg16) == wire14[(2'h3):(2'h2)])) ?
                  (8'hb8) : (((+(~^reg7)) ?
                      ($unsigned(reg8) ?
                          (wire4 >= reg10) : (reg24 ^ wire0)) : (^(reg24 ?
                          wire18 : reg9))) >= ($signed($unsigned(reg6)) ?
                      {(wire19 < reg22)} : wire18[(3'h6):(3'h4)])));
            end
          reg27 <= $unsigned((((reg17[(1'h0):(1'h0)] ?
                      $unsigned(reg8) : (reg8 ? reg20 : reg17)) ?
                  ((^~(8'ha2)) ? $signed((7'h42)) : $signed(reg13)) : (reg22 ?
                      $signed(reg24) : (&wire1))) ?
              ((^~reg17[(4'ha):(4'h9)]) ?
                  (^reg25[(1'h0):(1'h0)]) : reg5) : reg13));
          if ((&wire2[(2'h2):(1'h0)]))
            begin
              reg28 <= (+$signed(reg27[(3'h4):(3'h4)]));
              reg29 <= $unsigned(({{$unsigned((8'hb6))}, (8'hb8)} ?
                  (reg24[(5'h12):(4'h8)] ?
                      (reg23 >> (reg28 ?
                          reg9 : reg24)) : reg28[(4'hd):(4'ha)]) : reg21));
              reg30 <= ((^($unsigned((reg8 ? reg13 : reg25)) ?
                  $signed((reg6 ?
                      reg9 : reg22)) : reg7[(2'h2):(1'h1)])) ^ $unsigned(($unsigned((reg26 ?
                  wire4 : reg17)) ^ $signed(wire2))));
              reg31 <= reg7[(3'h4):(2'h2)];
            end
          else
            begin
              reg28 <= reg28;
              reg29 <= ((8'ha1) == (reg6 < (((~|wire2) && ((8'ha1) ?
                  reg26 : reg27)) ^~ reg9)));
              reg30 <= reg11[(3'h5):(2'h2)];
              reg31 <= (^~(7'h42));
            end
        end
      else
        begin
          reg21 <= {wire2[(5'h10):(4'ha)], (8'had)};
        end
      if (reg31[(5'h10):(4'hf)])
        begin
          reg32 <= ({($signed(wire4) ?
                  $signed((!reg28)) : ((reg13 ? reg23 : reg16) ?
                      (wire4 ? reg13 : reg6) : reg11)),
              (~^(~|$unsigned(reg13)))} <<< $unsigned((reg13[(1'h1):(1'h1)] << reg26)));
        end
      else
        begin
          reg32 <= wire1[(3'h6):(2'h3)];
          reg33 <= reg20[(3'h4):(1'h1)];
        end
      if ({(~&$signed(($signed((8'hae)) && wire2))),
          $signed($unsigned((^$signed(reg24))))})
        begin
          if (reg15)
            begin
              reg34 <= $signed((~^$signed(($unsigned(reg6) && (reg12 - reg15)))));
              reg35 <= $unsigned(((($signed((8'had)) * {reg29}) ?
                  (+{reg20}) : reg30[(3'h5):(1'h1)]) && {$signed((~&wire0)),
                  $signed($signed((8'ha1)))}));
            end
          else
            begin
              reg34 <= (^~reg24);
              reg35 <= wire3[(3'h7):(2'h3)];
            end
          reg36 <= ($signed(($signed(reg29[(3'h5):(2'h3)]) ?
                  $unsigned((~wire0)) : (((8'hba) || reg13) ?
                      $signed(reg5) : (~^reg23)))) ?
              {(reg25 ?
                      ((+wire14) ?
                          {reg24,
                              (8'hab)} : $signed(reg30)) : (~|$unsigned((8'ha6))))} : {wire0});
          reg37 <= reg25[(4'hd):(3'h5)];
        end
      else
        begin
          reg34 <= $unsigned(reg37[(3'h7):(3'h4)]);
          reg35 <= $signed($signed(wire18));
          if ({reg33[(4'ha):(1'h1)]})
            begin
              reg36 <= (~^($unsigned(({reg7, reg22} ~^ reg29[(3'h6):(1'h0)])) ?
                  ((~^(8'ha6)) ?
                      $unsigned(reg26) : (~&((8'hba) >> (7'h42)))) : (-{reg20[(1'h0):(1'h0)]})));
              reg37 <= ($unsigned((^~($unsigned(reg27) ?
                  $signed((8'hac)) : $unsigned(wire19)))) << ({(-wire1)} - $unsigned(reg28[(4'hd):(4'hd)])));
              reg38 <= (^~{$unsigned(wire3)});
              reg39 <= ((|($signed(reg20[(1'h1):(1'h1)]) ^~ $signed({reg17}))) ^ $unsigned($unsigned(((reg27 ?
                      reg33 : wire3) ?
                  (+wire3) : $signed((8'hb2))))));
              reg40 <= (((^~($unsigned(wire4) ~^ (reg26 + reg30))) ?
                      reg28[(2'h2):(2'h2)] : {((8'ha8) != reg25[(3'h4):(2'h3)]),
                          (^wire1)}) ?
                  $unsigned(((reg28 ?
                      {reg33,
                          reg12} : $signed(reg22)) - $unsigned((reg13 || reg34)))) : (reg16[(4'h8):(3'h7)] - {(~(reg15 ?
                          reg33 : reg11))}));
            end
          else
            begin
              reg36 <= ((^reg25[(4'ha):(1'h1)]) ?
                  {($unsigned((reg15 ?
                          (8'ha5) : reg40)) ^ (8'haa))} : ((reg32[(3'h7):(1'h0)] > ($signed(reg36) ?
                          reg26 : (reg40 - wire2))) ?
                      $unsigned(((reg8 ? reg38 : reg33) != {wire14})) : wire4));
              reg37 <= ((((!(reg10 << reg16)) ?
                      reg22 : ($unsigned(reg38) ? (8'hbf) : $unsigned(reg29))) ?
                  reg32[(4'hb):(2'h3)] : (~|reg9[(4'ha):(3'h7)])) - $signed({($unsigned((8'had)) ?
                      ((8'ha6) * wire19) : ((8'haf) + reg28)),
                  $unsigned($signed(reg26))}));
            end
          if (reg30[(2'h2):(1'h0)])
            begin
              reg41 <= reg21[(4'h8):(2'h3)];
              reg42 <= {($unsigned((^~(reg30 ?
                      reg31 : reg27))) && {{$unsigned(reg8), $unsigned(reg33)},
                      ($signed(reg30) ?
                          $signed((7'h41)) : $unsigned((8'ha6)))})};
              reg43 <= ((($signed($signed(reg28)) >>> wire14) ?
                      wire18 : (reg34[(2'h2):(1'h1)] ?
                          {((8'hab) ? reg22 : (8'hbc)),
                              reg15[(3'h5):(2'h2)]} : $unsigned((^reg5)))) ?
                  $signed($signed(reg37)) : (~(^~wire4[(4'h8):(3'h4)])));
              reg44 <= $signed(reg10[(2'h2):(1'h1)]);
            end
          else
            begin
              reg41 <= (($unsigned((reg21 != $signed((8'hbb)))) ?
                  reg35[(5'h10):(4'hf)] : (~^$unsigned(reg23))) == ((((-reg16) ?
                          $unsigned(wire2) : (wire1 ? reg27 : wire4)) ?
                      reg15 : (reg33 >= reg21)) ?
                  ((~^$unsigned(reg9)) <= ($unsigned(reg33) ?
                      (+reg32) : (reg16 >> reg13))) : reg16));
            end
          if (((-((!(8'hb7)) ? reg10[(2'h2):(1'h1)] : $signed((~|reg35)))) ?
              ((|({reg44} ? (wire18 ? reg29 : reg17) : (~reg33))) ?
                  reg36 : reg17) : $signed((8'hb8))))
            begin
              reg45 <= $unsigned(((~$unsigned(wire19)) >>> $unsigned((reg23[(4'h9):(3'h6)] ?
                  reg24[(4'ha):(1'h1)] : $unsigned((8'h9f))))));
              reg46 <= reg31[(1'h0):(1'h0)];
              reg47 <= $unsigned($signed((reg16[(4'h9):(3'h4)] || ($signed(wire19) ?
                  $unsigned(reg42) : $unsigned(reg36)))));
            end
          else
            begin
              reg45 <= ($unsigned(reg32) - ($unsigned((reg27[(1'h1):(1'h1)] ?
                      $signed(reg44) : (reg21 ~^ reg6))) ?
                  reg23[(4'h8):(3'h5)] : $signed((reg11[(2'h3):(1'h0)] ?
                      (-reg13) : (reg37 ? reg34 : reg37)))));
            end
        end
      reg48 <= ({(reg24 ?
              $signed($signed(reg44)) : {(reg37 ? (8'h9e) : reg43),
                  reg41[(2'h3):(2'h2)]}),
          {(wire19[(1'h0):(1'h0)] ? reg24 : wire3[(3'h4):(3'h4)]),
              $unsigned($signed(reg34))}} >>> ((reg25 <<< reg32) ?
          (reg34[(2'h3):(2'h3)] != ({reg23,
              reg47} >> $signed(reg20))) : (reg44[(5'h11):(3'h4)] ^~ ((-reg41) ?
              ((8'hb3) ? reg26 : reg21) : (^(7'h44))))));
    end
  module49 #() modinst94 (wire93, clk, reg25, wire14, reg32, reg16);
  assign wire95 = reg11;
  module96 #() modinst181 (.wire97(reg29), .wire100(reg38), .clk(clk), .wire98(reg12), .wire99(reg16), .y(wire180), .wire101(reg30));
  module136 #() modinst183 (wire182, clk, reg22, reg20, reg5, wire180);
  assign wire184 = (~(8'hab));
  module136 #() modinst186 (wire185, clk, reg39, reg7, reg37, reg12);
  assign wire187 = ((7'h42) + ((~|(reg22[(1'h0):(1'h0)] != (reg36 ?
                           wire0 : reg28))) ?
                       $signed(reg32) : $unsigned(reg12[(3'h5):(2'h2)])));
  assign wire188 = ($unsigned((wire19[(1'h0):(1'h0)] >>> reg5)) == ($signed((reg27[(3'h4):(2'h2)] >= reg15[(3'h4):(2'h3)])) - (^~$signed((&reg31)))));
  assign wire189 = wire93;
  assign wire190 = $unsigned(($signed(((reg38 >= wire180) || reg9)) | wire95[(1'h0):(1'h0)]));
  assign wire191 = $signed((8'ha1));
  module58 #() modinst193 (.wire59(wire2), .clk(clk), .wire61(reg44), .y(wire192), .wire62(reg36), .wire60(reg32));
  assign wire194 = reg47;
endmodule

module module96
#(parameter param178 = ({(~{((8'ha8) | (8'ha5)), (~(8'ha6))})} > ((7'h40) ? (~&((+(8'haf)) ? ((7'h44) > (8'hbc)) : (+(7'h44)))) : {((8'hb3) ^ ((8'hbb) > (8'ha3)))})), 
parameter param179 = (((((~^param178) < (8'hbb)) ? (~|(param178 >= param178)) : {(^~param178)}) ? (^((+param178) ? (param178 ? param178 : param178) : (param178 & param178))) : ((~^(param178 << param178)) ? (+(param178 ? param178 : (8'hae))) : {{param178, param178}, {param178, param178}})) ? (&({((8'hb3) ? param178 : param178)} ? (8'hb8) : {(param178 ? param178 : param178), (^~param178)})) : (((~|{param178, param178}) + ((-param178) < (param178 ? param178 : param178))) ? (~^(-{param178})) : param178)))
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire101;
  input wire signed [(2'h3):(1'h0)] wire100;
  input wire [(5'h10):(1'h0)] wire99;
  input wire [(5'h14):(1'h0)] wire98;
  input wire [(3'h4):(1'h0)] wire97;
  wire signed [(5'h12):(1'h0)] wire177;
  wire signed [(4'ha):(1'h0)] wire176;
  wire signed [(2'h3):(1'h0)] wire175;
  wire signed [(5'h10):(1'h0)] wire174;
  wire signed [(3'h4):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire172;
  wire signed [(3'h7):(1'h0)] wire171;
  wire [(4'he):(1'h0)] wire170;
  wire signed [(4'h8):(1'h0)] wire168;
  wire signed [(3'h4):(1'h0)] wire167;
  wire [(3'h7):(1'h0)] wire166;
  wire [(5'h11):(1'h0)] wire165;
  wire signed [(3'h5):(1'h0)] wire164;
  wire [(3'h7):(1'h0)] wire163;
  wire signed [(4'he):(1'h0)] wire162;
  wire [(4'ha):(1'h0)] wire134;
  wire [(3'h7):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire103;
  wire [(5'h15):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire160;
  reg [(4'h9):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire134,
                 wire109,
                 wire103,
                 wire102,
                 wire160,
                 reg169,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire102 = wire99[(5'h10):(4'ha)];
  assign wire103 = ((wire102 - $signed(((wire101 ? wire101 : wire98) ?
                       (wire102 && wire102) : (wire101 ?
                           wire102 : wire98)))) > (((wire102[(4'hb):(4'h9)] >> wire100[(2'h2):(1'h0)]) * (wire98 ?
                       (wire97 ?
                           (8'haf) : wire101) : (wire101 || (8'h9d)))) ^ (-((wire102 ?
                       (7'h40) : wire99) | $signed(wire100)))));
  always
    @(posedge clk) begin
      reg104 <= $signed((wire101 ^~ $signed(($unsigned(wire100) > (wire101 != wire99)))));
      reg105 <= ((~|(&((wire99 != wire99) ?
          (wire102 < wire101) : (!wire97)))) * $unsigned(wire102));
      reg106 <= ((+(~^$signed({wire97}))) <= $unsigned($signed($signed({reg104}))));
      reg107 <= $unsigned($unsigned($signed($unsigned(reg106[(2'h2):(2'h2)]))));
      reg108 <= (($signed((~(wire102 ? wire98 : wire98))) ?
          (~|($signed(reg106) ?
              (wire102 ^~ wire103) : $unsigned(wire100))) : $unsigned(($signed(reg106) && (~&wire99)))) <<< $signed($unsigned($unsigned($unsigned((8'hb7))))));
    end
  assign wire109 = wire98;
  module110 #() modinst135 (wire134, clk, wire103, wire102, wire98, reg104);
  module136 #() modinst161 (wire160, clk, wire102, reg105, wire103, wire134);
  assign wire162 = ({(~^(~&(wire98 ? reg106 : wire99))),
                       wire109[(2'h2):(2'h2)]} + $unsigned($unsigned(($unsigned(reg108) ?
                       (~&wire100) : $unsigned((7'h40))))));
  assign wire163 = (!$signed({wire100, reg104[(4'hb):(1'h1)]}));
  assign wire164 = wire99;
  assign wire165 = ($unsigned((reg106 && wire162[(3'h5):(2'h3)])) ?
                       (+$signed($signed(wire103))) : $unsigned($signed($signed((wire164 > wire97)))));
  assign wire166 = (($signed($signed(wire100)) <<< {$signed({wire97, reg108}),
                           wire162[(4'h8):(1'h0)]}) ?
                       $unsigned((+(wire134[(3'h5):(3'h4)] * wire134[(1'h0):(1'h0)]))) : $unsigned((-(^$signed(wire99)))));
  assign wire167 = $unsigned((~^((-(-reg108)) == wire102[(5'h12):(3'h5)])));
  assign wire168 = wire100;
  always
    @(posedge clk) begin
      reg169 <= ($unsigned($unsigned((+(wire164 ?
          wire101 : wire98)))) ^ $signed($unsigned((+$signed((8'h9d))))));
    end
  assign wire170 = wire167[(2'h2):(2'h2)];
  assign wire171 = wire170;
  assign wire172 = $signed(($unsigned((!wire164[(2'h2):(1'h1)])) | {{wire160,
                           {wire160}},
                       ((wire163 >> reg108) > (8'ha9))}));
  assign wire173 = (wire172 ? $unsigned(wire101[(4'ha):(2'h3)]) : wire165);
  assign wire174 = wire173[(2'h2):(1'h1)];
  assign wire175 = $unsigned($unsigned(wire102[(5'h14):(5'h14)]));
  assign wire176 = ((!wire103[(1'h0):(1'h0)]) ?
                       $signed($signed($unsigned(wire167[(2'h3):(1'h1)]))) : wire160);
  assign wire177 = $unsigned((~|reg104));
endmodule

module module49
#(parameter param91 = (((~(-((8'hb3) ? (7'h40) : (8'haf)))) ? ((|{(8'hb6), (8'ha7)}) >> (~((8'h9e) == (8'hb0)))) : (|(^~(-(8'ha7))))) ? (({(+(8'hb1))} ? (((8'ha5) << (8'hbc)) ? ((8'haa) != (8'hae)) : ((8'hb1) ? (8'hb7) : (8'h9c))) : (((8'h9d) == (8'hb1)) <= ((8'hab) == (8'hae)))) * (((&(8'haf)) > ((8'hb3) ^~ (8'h9d))) & (7'h43))) : (~^((!(~(8'ha6))) ? {{(8'haf)}} : (^~((8'h9f) ? (7'h44) : (8'ha3)))))), 
parameter param92 = ((((!{(8'ha5), param91}) <<< ((param91 >= param91) ? (param91 ? param91 : param91) : (param91 ? param91 : param91))) ? param91 : ((+(param91 >> param91)) <= (param91 ? {param91, param91} : (param91 ? (8'hb7) : param91)))) ? (~^((^param91) >= param91)) : (~(^~(((8'ha2) ? (8'hb9) : param91) - (param91 & (8'ha4)))))))
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire53;
  input wire signed [(4'hf):(1'h0)] wire52;
  input wire [(5'h11):(1'h0)] wire51;
  input wire signed [(4'hd):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire54;
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  assign y = {wire89, wire57, wire56, wire54, reg55, (1'h0)};
  assign wire54 = (8'hb5);
  always
    @(posedge clk) begin
      reg55 <= (wire53 ?
          wire54 : $unsigned((|($unsigned(wire51) ?
              wire50[(1'h0):(1'h0)] : {(8'ha8), wire50}))));
    end
  assign wire56 = wire50[(1'h0):(1'h0)];
  assign wire57 = (|(wire56 ^ {{(~&(8'hb2)), (^wire50)}}));
  module58 #() modinst90 (.wire62(wire51), .wire61(wire50), .wire60(wire56), .wire59(wire52), .clk(clk), .y(wire89));
endmodule

module module58
#(parameter param87 = (|(^{((-(8'had)) == ((8'hb4) ? (8'h9c) : (8'hb5)))})), 
parameter param88 = param87)
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire62;
  input wire signed [(4'h9):(1'h0)] wire61;
  input wire signed [(5'h13):(1'h0)] wire60;
  input wire [(4'hf):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire signed [(5'h13):(1'h0)] wire63;
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg83,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire63 = (~|(((wire59 || (wire62 ? wire60 : wire59)) ?
                          $unsigned($unsigned(wire61)) : wire62) ?
                      wire60[(5'h13):(1'h0)] : ($unsigned(wire60[(1'h0):(1'h0)]) ?
                          $signed($unsigned(wire60)) : $signed($signed(wire61)))));
  assign wire64 = wire59[(3'h6):(3'h5)];
  assign wire65 = wire62;
  assign wire66 = ((wire63[(4'h8):(2'h3)] ?
                      $unsigned($unsigned((wire60 || wire65))) : $signed(wire60[(4'h9):(3'h5)])) == ($signed(((-(8'hbf)) == wire64[(4'h8):(3'h6)])) ?
                      (7'h44) : wire63[(4'h8):(1'h1)]));
  assign wire67 = (^(wire62 ?
                      (~^$unsigned($signed(wire61))) : $signed((8'hb6))));
  assign wire68 = wire60;
  assign wire69 = {wire59[(4'he):(4'hc)],
                      (^($unsigned($signed(wire61)) ?
                          (&$unsigned(wire63)) : (|(wire63 ?
                              wire60 : wire59))))};
  always
    @(posedge clk) begin
      reg70 <= ({(~^$unsigned($signed((8'ha1))))} ? wire60 : wire60);
      reg71 <= {($signed((&$signed(wire66))) < (8'ha4))};
      reg72 <= $unsigned($signed(wire59));
      if (reg70)
        begin
          reg73 <= wire69[(2'h2):(1'h1)];
          reg74 <= ((reg73[(4'hd):(4'h9)] ?
                  $signed(wire60) : (wire59 ?
                      ($unsigned(reg72) ?
                          wire66 : (wire60 * reg73)) : (~(wire69 ~^ reg72)))) ?
              $signed({{$unsigned((8'hb2)), (wire63 ? wire63 : (8'h9f))},
                  reg70}) : $signed((+((~&wire69) | (reg71 < reg70)))));
          reg75 <= (~&wire63);
          if (wire59)
            begin
              reg76 <= reg73;
              reg77 <= $unsigned({$unsigned($signed((reg74 + (8'hb0)))),
                  ({(|reg70)} ? wire67[(2'h3):(1'h0)] : $signed((-wire60)))});
            end
          else
            begin
              reg76 <= ({(wire63[(3'h7):(3'h6)] ? wire63 : reg74)} ?
                  ((wire64[(1'h0):(1'h0)] >>> ($unsigned(reg74) >>> wire65)) ?
                      (+reg74) : (wire59[(3'h6):(2'h3)] || $signed((reg76 >>> wire66)))) : {$unsigned((+(reg73 ?
                          reg70 : (7'h42))))});
              reg77 <= $unsigned((+(($unsigned(reg73) ?
                      (~|reg70) : $signed((8'hb5))) ?
                  $unsigned(reg76[(2'h2):(1'h1)]) : (((8'hbb) ?
                          wire61 : wire66) ?
                      {(8'hb7)} : $unsigned(wire63)))));
              reg78 <= (wire65[(1'h0):(1'h0)] - {wire67[(2'h2):(1'h0)],
                  $signed((7'h42))});
            end
        end
      else
        begin
          reg73 <= ((~|((((8'hba) ? wire63 : reg74) ?
              $signed(wire61) : $unsigned(reg75)) + ((wire65 + wire63) || wire61))) || (wire63 << $unsigned(($unsigned(wire68) ?
              (!wire59) : (reg78 | wire66)))));
        end
    end
  assign wire79 = (wire68 < {{wire60, $signed($signed(wire62))}});
  assign wire80 = reg71;
  assign wire81 = $signed((8'ha3));
  assign wire82 = $unsigned((&(((-reg70) ?
                      wire66 : $unsigned(wire67)) > ((~|reg73) <= (wire60 <= wire67)))));
  always
    @(posedge clk) begin
      reg83 <= $unsigned($unsigned(($unsigned($unsigned(wire63)) || (&wire79))));
    end
  assign wire84 = (|($unsigned(((reg72 == reg71) & (-wire65))) ?
                      $unsigned((-(+wire80))) : $unsigned($unsigned((7'h43)))));
  assign wire85 = $unsigned($unsigned($unsigned(((wire64 ? wire84 : (8'h9c)) ?
                      $signed((8'ha5)) : (wire64 ? reg77 : reg78)))));
  assign wire86 = reg72;
endmodule

module module136  (y, clk, wire140, wire139, wire138, wire137);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire140;
  input wire [(5'h11):(1'h0)] wire139;
  input wire signed [(2'h3):(1'h0)] wire138;
  input wire signed [(2'h2):(1'h0)] wire137;
  wire signed [(4'hb):(1'h0)] wire159;
  wire signed [(5'h14):(1'h0)] wire158;
  wire signed [(3'h7):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire144;
  wire [(5'h14):(1'h0)] wire143;
  wire [(4'hb):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire141;
  reg signed [(5'h14):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
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
                 (1'h0)};
  assign wire141 = ($unsigned(($unsigned((wire138 ? wire139 : wire140)) ?
                       ($signed(wire137) ?
                           wire140[(1'h1):(1'h0)] : (wire139 ?
                               wire139 : wire138)) : ($signed(wire138) ?
                           $unsigned(wire137) : wire140))) == $unsigned(wire138[(2'h2):(1'h0)]));
  assign wire142 = $signed($unsigned((($signed(wire140) > (wire139 ?
                           wire139 : wire139)) ?
                       $unsigned($unsigned(wire138)) : (~(wire138 | wire138)))));
  assign wire143 = wire138[(2'h3):(1'h0)];
  assign wire144 = (wire140[(3'h6):(1'h1)] >= $signed(wire143));
  always
    @(posedge clk) begin
      if (($signed((((wire143 ? (8'haf) : wire140) ?
          $signed(wire140) : $unsigned(wire139)) < wire139)) >> {wire139[(4'he):(1'h0)],
          $unsigned(((8'ha5) != {wire137, wire137}))}))
        begin
          if (wire144)
            begin
              reg145 <= (({$signed((~|(8'ha2)))} | $unsigned(($unsigned(wire142) ?
                      $unsigned(wire143) : $unsigned(wire143)))) ?
                  (!wire144) : (7'h41));
            end
          else
            begin
              reg145 <= wire142[(1'h0):(1'h0)];
              reg146 <= wire139;
              reg147 <= wire137;
            end
          if (wire142)
            begin
              reg148 <= ($unsigned((({wire143} - (wire138 ?
                  wire140 : wire137)) >= {$unsigned(wire144)})) < $signed(wire140));
              reg149 <= wire137[(1'h0):(1'h0)];
              reg150 <= wire141;
            end
          else
            begin
              reg148 <= ($unsigned({(reg149 + reg145[(3'h6):(2'h3)])}) ?
                  (reg147[(3'h6):(1'h0)] < $signed(((~|reg149) ?
                      $unsigned(wire137) : wire140[(5'h10):(1'h0)]))) : ($signed($unsigned($signed(wire138))) ?
                      reg149 : $signed($unsigned(((8'hb9) | reg145)))));
              reg149 <= reg147;
              reg150 <= {(reg149 <<< (($signed(wire144) != wire144) | $unsigned(reg148))),
                  (~^$unsigned(reg150))};
            end
          reg151 <= (wire143[(1'h0):(1'h0)] && wire138);
          reg152 <= wire141;
        end
      else
        begin
          reg145 <= $unsigned(((~|(wire141 <<< (~|wire140))) ?
              (reg151[(4'h9):(4'h8)] ?
                  ($unsigned(reg145) ?
                      (reg147 - reg147) : wire143[(1'h1):(1'h1)]) : $signed($unsigned(reg150))) : reg152));
          reg146 <= reg145[(4'hf):(2'h2)];
          reg147 <= ((reg145 <<< $unsigned(reg152)) ^ wire137);
        end
      if ({reg148,
          (&(((reg145 | wire140) < $signed(wire139)) < (wire139 ?
              wire140 : ((7'h42) ? wire141 : (8'hbb)))))})
        begin
          reg153 <= wire140;
          reg154 <= reg150[(1'h0):(1'h0)];
          reg155 <= ($signed((~&reg153)) << $unsigned((wire141[(4'hc):(3'h4)] ^ (|(wire142 & wire141)))));
          reg156 <= (wire140[(4'hc):(3'h5)] <<< wire140);
        end
      else
        begin
          reg153 <= wire138[(1'h1):(1'h0)];
          reg154 <= $signed((reg146[(4'hf):(3'h6)] || ($unsigned($unsigned(reg151)) != ((reg152 ^~ reg153) ?
              (reg154 ? (8'hbb) : reg150) : (reg150 - wire140)))));
          reg155 <= {wire140, $signed({wire144})};
          reg156 <= (~^(({wire139, {wire144}} ?
              $unsigned((reg149 ?
                  reg145 : wire141)) : wire142) != (&wire141[(5'h12):(1'h0)])));
        end
    end
  assign wire157 = $signed((reg150 ?
                       ((((8'h9d) ? wire143 : reg152) >= (reg150 ?
                               reg147 : wire139)) ?
                           (reg153[(2'h2):(2'h2)] ?
                               reg147[(4'hf):(4'hd)] : reg146) : $signed(((8'hab) ?
                               reg156 : (7'h44)))) : reg154));
  assign wire158 = ((7'h43) ?
                       $unsigned(($unsigned((^~wire137)) ^~ (reg148 - (8'h9c)))) : reg154);
  assign wire159 = wire158[(1'h1):(1'h0)];
endmodule

module module110
#(parameter param133 = (^~{({((8'hbf) ? (8'hab) : (8'ha6)), ((8'h9f) ? (8'ha4) : (7'h42))} ~^ (((8'hbe) ? (8'hac) : (8'hb4)) ? ((8'ha7) ? (8'ha6) : (8'hbe)) : {(8'ha9)})), ({(!(8'hb5)), (!(8'hbc))} >>> (^(^~(7'h44))))}))
(y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire114;
  input wire [(4'hc):(1'h0)] wire113;
  input wire [(5'h10):(1'h0)] wire112;
  input wire signed [(4'h8):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire129;
  wire signed [(2'h2):(1'h0)] wire118;
  wire [(4'hf):(1'h0)] wire117;
  wire [(4'he):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire115;
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
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
                 (1'h0)};
  assign wire115 = (&$signed((|wire113[(2'h3):(1'h0)])));
  assign wire116 = wire111[(2'h2):(2'h2)];
  assign wire117 = $unsigned($signed($signed(wire114)));
  assign wire118 = wire116;
  always
    @(posedge clk) begin
      if ($signed((8'hb2)))
        begin
          reg119 <= ($signed($signed(wire117[(4'h8):(3'h6)])) <= ((wire115[(4'h8):(3'h4)] > ((!(8'ha9)) ?
              wire115[(3'h6):(1'h1)] : $unsigned(wire115))) - wire113));
        end
      else
        begin
          reg119 <= (wire115[(4'he):(2'h3)] ? reg119[(1'h0):(1'h0)] : wire114);
          if (wire113)
            begin
              reg120 <= $signed(wire112[(1'h0):(1'h0)]);
              reg121 <= $unsigned((^~{$signed(wire113)}));
              reg122 <= ({$unsigned(wire118), reg119[(1'h1):(1'h1)]} ?
                  (~&$unsigned(((wire117 ? reg121 : (8'hbd)) < (reg120 ?
                      wire118 : wire113)))) : (wire111 >= $unsigned(reg120)));
              reg123 <= ($unsigned(wire113) >= (-wire113));
            end
          else
            begin
              reg120 <= (reg122[(1'h0):(1'h0)] - $signed($signed($signed($signed(wire117)))));
              reg121 <= {{wire112, $signed((|{reg122, wire117}))}};
            end
          reg124 <= (^~($signed(((wire114 - wire116) <<< $signed(wire112))) || $signed(($unsigned((8'hb5)) ?
              $signed((8'hb3)) : (reg123 ? wire111 : reg121)))));
          reg125 <= wire111;
          reg126 <= wire113[(4'h9):(2'h3)];
        end
      reg127 <= $unsigned($signed($signed(wire113)));
      reg128 <= $unsigned((~^$unsigned(reg126[(1'h1):(1'h1)])));
    end
  assign wire129 = {$unsigned(((reg124 - (reg120 ? reg125 : reg123)) ?
                           $unsigned({reg123, reg127}) : {{(8'hbf), wire111},
                               wire116[(3'h6):(3'h6)]}))};
  assign wire130 = $unsigned(($unsigned((~&(~^reg123))) << (reg128 ?
                       (wire118 ? wire118 : reg121) : reg128)));
  assign wire131 = (+wire115[(3'h4):(2'h3)]);
  assign wire132 = (8'had);
endmodule
