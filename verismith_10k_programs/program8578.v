module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h219):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  wire [(4'h9):(1'h0)] wire134;
  wire signed [(4'h8):(1'h0)] wire128;
  wire signed [(4'hf):(1'h0)] wire127;
  wire [(4'ha):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire117;
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire134,
                 wire128,
                 wire127,
                 wire119,
                 wire4,
                 wire5,
                 wire6,
                 wire117,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (~&wire1);
  assign wire5 = (!{$unsigned((wire4[(2'h3):(2'h2)] * wire0))});
  assign wire6 = $unsigned(wire3);
  always
    @(posedge clk) begin
      if ((-$signed($unsigned($signed((wire6 ? wire4 : wire2))))))
        begin
          reg7 <= (8'hb4);
          reg8 <= $signed(($signed(wire1) ~^ ({$signed((8'hb9))} && wire0)));
        end
      else
        begin
          if (wire6[(4'hd):(4'hc)])
            begin
              reg7 <= (-$unsigned((~|(wire2[(1'h0):(1'h0)] ?
                  (wire0 >= reg8) : $signed((8'hb8))))));
              reg8 <= (~^(reg7[(1'h1):(1'h0)] ?
                  $unsigned((8'hb4)) : (~&(8'hb1))));
              reg9 <= wire0[(2'h2):(2'h2)];
              reg10 <= (-(+$unsigned(($unsigned((8'hb4)) != (~(7'h44))))));
            end
          else
            begin
              reg7 <= wire5[(4'h8):(3'h6)];
              reg8 <= ((((+(wire6 ? wire1 : wire2)) ?
                          {{wire1, wire3}, wire1[(3'h7):(3'h6)]} : {(^wire1),
                              $signed(wire3)}) ?
                      reg9 : reg8) ?
                  wire2 : reg7[(2'h3):(2'h3)]);
            end
          if (reg9[(2'h2):(1'h1)])
            begin
              reg11 <= $signed($unsigned(wire1[(4'h8):(2'h2)]));
              reg12 <= wire1[(4'h9):(2'h2)];
              reg13 <= ((~&((~^$unsigned(wire2)) + ((reg7 ? wire1 : wire2) ?
                      reg8 : $unsigned((8'hb0))))) ?
                  {(8'h9d),
                      (wire5 ?
                          $signed((|wire4)) : $unsigned({reg10}))} : ((((reg7 ?
                                  wire6 : (7'h42)) ?
                              (wire6 <<< wire1) : wire1[(1'h0):(1'h0)]) ?
                          {wire2, $unsigned(reg8)} : reg10) ?
                      wire6[(3'h4):(2'h2)] : reg10));
              reg14 <= ((((|$unsigned(reg12)) ^~ ((+(8'ha6)) ?
                          (reg7 ? reg7 : reg8) : {(8'hbf)})) ?
                      $signed((~|(reg13 >> wire0))) : wire6[(1'h1):(1'h0)]) ?
                  (wire0[(1'h0):(1'h0)] | (~|$signed(reg7))) : $unsigned($unsigned((7'h42))));
              reg15 <= (wire1 ?
                  $unsigned((wire1 && $unsigned($unsigned(reg8)))) : (^{{$signed(reg14)}}));
            end
          else
            begin
              reg11 <= (|(8'hbc));
              reg12 <= reg13[(1'h1):(1'h0)];
              reg13 <= ($unsigned({(!reg14)}) <<< (wire0[(3'h4):(1'h0)] ?
                  reg12[(3'h6):(1'h0)] : reg8[(1'h0):(1'h0)]));
              reg14 <= ($unsigned($unsigned(((-reg14) ?
                  ((8'hbc) ?
                      wire4 : reg15) : (~reg14)))) ~^ reg15[(4'h8):(1'h1)]);
            end
          if (wire3)
            begin
              reg16 <= $unsigned(reg7);
              reg17 <= $unsigned((-wire2[(1'h0):(1'h0)]));
              reg18 <= reg15[(1'h0):(1'h0)];
              reg19 <= ((^wire0[(2'h2):(2'h2)]) < wire3[(1'h1):(1'h0)]);
              reg20 <= (|(&(reg10 * $unsigned($signed(wire6)))));
            end
          else
            begin
              reg16 <= $signed(reg9);
              reg17 <= $unsigned((($unsigned((+wire3)) << ((reg10 >= wire2) != (wire1 ?
                  reg17 : wire4))) || (((reg20 + reg17) >> ((8'ha5) ?
                      reg18 : reg7)) ?
                  $signed(reg19) : ((reg8 << reg20) ?
                      (reg16 ? reg14 : reg10) : (!(8'ha0))))));
            end
          reg21 <= ((!(reg16 || ((|reg7) & (reg8 >= wire1)))) ?
              wire2[(1'h1):(1'h1)] : (reg8[(2'h2):(1'h0)] ?
                  wire0[(2'h2):(1'h0)] : (!reg10[(1'h1):(1'h1)])));
        end
      if (({wire2} ? {(&$unsigned((reg18 < reg8)))} : wire6))
        begin
          reg22 <= $unsigned(wire6[(3'h7):(3'h4)]);
          reg23 <= ((({(reg13 << reg21)} ?
                  reg10 : {(8'ha0), reg16}) ^~ (!reg13[(3'h6):(3'h6)])) ?
              (&$unsigned(($signed(reg11) ?
                  reg15[(3'h4):(3'h4)] : (wire4 ^ reg16)))) : (wire5[(4'he):(1'h0)] ?
                  reg20 : wire2));
          reg24 <= {(7'h44)};
          reg25 <= ((reg22 ^ {wire4,
                  ((reg18 ^~ wire5) ?
                      $unsigned(reg8) : wire0[(3'h6):(3'h6)])}) ?
              $signed($signed((reg12 ?
                  $unsigned(wire2) : {reg17, (8'ha7)}))) : (&({reg11} ?
                  reg14 : (reg7 ? wire4[(3'h4):(2'h2)] : $signed(wire1)))));
        end
      else
        begin
          reg22 <= reg16[(3'h4):(1'h0)];
        end
      reg26 <= {$unsigned(reg20)};
      if (($signed(wire4[(4'ha):(4'ha)]) ?
          {($signed((|reg18)) >= wire6[(4'h8):(3'h7)]),
              $signed($signed((reg21 >>> (8'hb6))))} : ((-reg21) ?
              wire4 : (~^(((8'hab) ? wire1 : (7'h40)) ?
                  (~^reg25) : (wire1 - reg13))))))
        begin
          reg27 <= ({(reg13[(4'ha):(2'h2)] - $signed({reg10}))} ?
              $signed($signed(wire5[(4'hb):(3'h5)])) : (^~$signed($unsigned((~reg8)))));
          reg28 <= $unsigned($unsigned({{$unsigned(reg17), reg8[(2'h3):(1'h0)]},
              reg9}));
        end
      else
        begin
          reg27 <= reg10[(2'h3):(2'h3)];
          if (reg8[(4'h8):(3'h5)])
            begin
              reg28 <= ({reg17, wire1} ?
                  reg21 : $unsigned($unsigned(((reg11 >>> wire1) - $signed((8'ha7))))));
              reg29 <= ({(+{$signed(reg16)})} || wire0[(3'h6):(1'h1)]);
              reg30 <= {$unsigned((^~reg22)), reg9};
              reg31 <= reg30[(4'h8):(2'h2)];
            end
          else
            begin
              reg28 <= (reg21[(4'hb):(4'h8)] ?
                  (+reg11[(1'h0):(1'h0)]) : ((8'hb4) | reg26));
              reg29 <= (reg25 << (-$signed({(wire4 ? wire0 : (8'h9c)),
                  $signed((8'h9d))})));
              reg30 <= $unsigned((^~$signed((^~(reg13 >= reg16)))));
            end
          reg32 <= $signed((wire4 == reg21));
        end
      reg33 <= reg22[(2'h2):(2'h2)];
    end
  module34 #() modinst118 (wire117, clk, reg9, wire1, reg21, reg19, reg23);
  assign wire119 = {$signed($unsigned(reg26[(4'hc):(4'ha)])),
                       $signed($unsigned({(reg17 ? wire0 : reg18), reg7}))};
  always
    @(posedge clk) begin
      if (reg27[(5'h15):(4'h8)])
        begin
          if (wire2)
            begin
              reg120 <= $unsigned($signed(($unsigned(reg29[(3'h4):(1'h0)]) ?
                  (&reg8[(3'h5):(1'h0)]) : $signed(reg21))));
              reg121 <= {reg27, reg12[(3'h4):(2'h2)]};
              reg122 <= ({(^$signed({reg21})), reg26} ?
                  (7'h41) : (((+(|wire4)) >= (~|(reg23 & (8'hab)))) ?
                      (wire6 ?
                          $signed((reg17 < wire3)) : reg8) : ({(reg121 ^ reg12)} ?
                          ((reg8 ? wire4 : reg33) ?
                              {(8'hbb), reg19} : (reg121 ?
                                  reg9 : reg16)) : (reg33 == $unsigned(wire6)))));
              reg123 <= ((!(-reg17)) ?
                  $signed($unsigned(($signed(reg122) >= ((8'hb5) && reg120)))) : $unsigned($signed((!(wire1 || wire119)))));
            end
          else
            begin
              reg120 <= reg24;
              reg121 <= (|((^reg25) ?
                  ($unsigned((reg17 ? reg10 : wire2)) ?
                      ((reg123 ? wire117 : wire0) ?
                          (reg122 <= reg26) : (reg10 ?
                              reg32 : (7'h40))) : (wire3[(1'h1):(1'h1)] == (wire1 <= reg33))) : (~&{{reg10},
                      ((8'hb3) ? reg17 : reg15)})));
              reg122 <= $signed(reg10[(1'h1):(1'h1)]);
            end
          reg124 <= $signed($signed((|{$unsigned(wire6),
              (wire1 ? (8'ha5) : wire6)})));
        end
      else
        begin
          reg120 <= $signed(reg19[(5'h12):(4'he)]);
          reg121 <= (reg16[(4'h9):(3'h4)] | ($signed(reg19[(4'hb):(4'hb)]) ^ (~|$signed($signed(wire1)))));
        end
      reg125 <= (!$signed(reg9[(5'h13):(2'h2)]));
      reg126 <= reg13;
    end
  assign wire127 = wire2;
  assign wire128 = reg126[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((($signed(((reg18 << reg32) ?
              $unsigned((8'hb8)) : $signed((8'haa)))) ?
          reg18[(1'h0):(1'h0)] : wire4[(3'h6):(3'h4)]) == $unsigned((wire2 ?
          {(reg25 ? (8'ha4) : reg18)} : ((reg19 ?
              reg10 : reg123) || $unsigned(reg18))))))
        begin
          reg129 <= reg22[(2'h2):(2'h2)];
          reg130 <= (wire5[(3'h4):(1'h1)] ^ $unsigned($unsigned(reg12)));
          reg131 <= ({reg122} ?
              (-wire119[(1'h0):(1'h0)]) : $signed((^~{$unsigned(reg124),
                  reg29[(3'h4):(2'h3)]})));
          reg132 <= {reg19, $unsigned((reg13 << (~&{reg24})))};
        end
      else
        begin
          reg129 <= (wire6[(4'hb):(3'h4)] * reg125);
          reg130 <= (((-$unsigned(reg24[(1'h0):(1'h0)])) ?
                  $signed({((8'ha2) ^~ reg21), wire127}) : (8'haf)) ?
              (~&(+(!$signed(reg20)))) : {reg22,
                  ({(reg122 << reg24)} ?
                      ({wire127} ?
                          reg12 : (reg14 <= (8'ha9))) : (+(reg132 * reg22)))});
        end
      reg133 <= $signed({(~|$unsigned($signed(reg24)))});
    end
  assign wire134 = reg27;
endmodule

module module34
#(parameter param115 = {((~^((~|(8'ha2)) ? (8'hb6) : ((8'haf) * (8'ha1)))) >>> (8'hb7))}, 
parameter param116 = param115)
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire39;
  input wire signed [(5'h15):(1'h0)] wire38;
  input wire signed [(4'he):(1'h0)] wire37;
  input wire signed [(4'ha):(1'h0)] wire36;
  input wire signed [(2'h3):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire108;
  wire signed [(4'h9):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire104;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire102;
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  assign y = {wire114,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire76,
                 wire78,
                 wire79,
                 wire102,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  module40 #() modinst77 (wire76, clk, wire39, wire37, wire35, wire36, wire38);
  assign wire78 = (8'had);
  assign wire79 = ({(|((wire35 <<< (8'hb5)) ?
                          $unsigned(wire37) : (~|wire36)))} && (|{wire35}));
  module80 #() modinst103 (.clk(clk), .wire81(wire78), .y(wire102), .wire85(wire76), .wire84(wire79), .wire83(wire39), .wire82(wire38));
  assign wire104 = ((+wire39) ?
                       {({(|wire76)} ~^ $unsigned(wire38)),
                           (($unsigned((8'hb1)) ? wire36 : $signed(wire39)) ?
                               (wire36[(3'h4):(3'h4)] | (wire79 ?
                                   wire79 : wire102)) : ({wire76} == wire102))} : (~&wire38));
  assign wire105 = $signed((8'hbd));
  assign wire106 = wire37[(4'hb):(1'h1)];
  assign wire107 = (~&wire76);
  assign wire108 = ($signed(wire36[(1'h1):(1'h1)]) ?
                       $unsigned({((wire35 ~^ wire102) * wire104[(4'h9):(4'h8)]),
                           wire37[(4'hb):(3'h4)]}) : wire102[(1'h0):(1'h0)]);
  assign wire109 = ((wire39 ?
                           $unsigned($unsigned((8'hbe))) : (|$signed((-wire102)))) ?
                       wire37[(4'h9):(2'h2)] : ($signed((^wire39[(4'hf):(4'ha)])) ?
                           (!($signed(wire78) & wire37[(4'ha):(4'h8)])) : ($signed((~^wire39)) ~^ wire35)));
  always
    @(posedge clk) begin
      reg110 <= $unsigned(wire76);
      reg111 <= wire36[(1'h0):(1'h0)];
      reg112 <= (8'h9c);
      reg113 <= (~(^~({$unsigned(wire78)} ?
          reg112[(4'he):(4'hc)] : wire105[(1'h1):(1'h0)])));
    end
  assign wire114 = {(reg113 >>> (^~reg113))};
endmodule

module module80
#(parameter param100 = {(({((8'ha7) ? (8'hb1) : (8'ha8)), (~^(8'h9f))} ? ((8'hb6) ? {(8'hb8)} : (~(7'h44))) : (+((8'hba) ? (8'h9c) : (8'hb8)))) ? {(((8'ha1) ? (8'ha0) : (8'hab)) << ((8'h9e) - (8'ha9)))} : (((7'h41) <= {(8'ha5)}) ? (~|((8'ha7) ? (8'hb2) : (8'ha7))) : ({(8'hac)} > {(8'hbb), (8'ha3)})))}, 
parameter param101 = ((param100 ? param100 : (~param100)) ^ (((8'hab) ? param100 : param100) ? ((&(param100 ? param100 : param100)) ? param100 : ((~|param100) ? (param100 >= param100) : ((8'hab) ? param100 : param100))) : ((^(param100 <= param100)) ? param100 : {((8'hb5) ? param100 : param100)}))))
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire85;
  input wire signed [(4'ha):(1'h0)] wire84;
  input wire signed [(5'h14):(1'h0)] wire83;
  input wire signed [(5'h13):(1'h0)] wire82;
  input wire signed [(4'hc):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire99;
  wire signed [(3'h5):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire95;
  wire signed [(5'h15):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire86;
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire91,
                 wire86,
                 reg92,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire86 = (~|wire83);
  always
    @(posedge clk) begin
      reg87 <= $signed($unsigned(wire81));
      reg88 <= (|wire83[(5'h10):(3'h4)]);
      reg89 <= (&(+(^((wire83 ? wire81 : reg87) ?
          (wire83 ~^ wire84) : $unsigned(wire84)))));
      reg90 <= {wire86};
    end
  assign wire91 = (($signed((^~(reg89 - (7'h40)))) || (8'ha4)) - $unsigned($signed($signed((~^wire81)))));
  always
    @(posedge clk) begin
      reg92 <= (8'haf);
    end
  assign wire93 = wire84;
  assign wire94 = (reg87[(1'h1):(1'h1)] ?
                      reg87[(2'h2):(1'h0)] : $signed(({reg89,
                          $unsigned(wire82)} >> (wire86[(4'ha):(4'h8)] ?
                          (+(8'ha8)) : (wire91 ? (8'hb6) : reg89)))));
  assign wire95 = $unsigned((&(|{$signed(wire84),
                      (wire85 ? wire84 : (8'h9e))})));
  assign wire96 = wire91[(4'hb):(2'h2)];
  assign wire97 = (reg90 <<< ((~&($unsigned(reg90) & {wire93})) ?
                      $unsigned(wire91) : (~|$unsigned(((8'ha2) <<< reg87)))));
  assign wire98 = reg87[(3'h4):(1'h0)];
  assign wire99 = ((({wire91[(4'hd):(4'hb)]} & wire83[(5'h11):(3'h5)]) ^ $signed(wire97)) ?
                      $unsigned((wire94 - $unsigned((reg89 * wire82)))) : (|$unsigned((reg87[(1'h0):(1'h0)] && $signed(wire95)))));
endmodule

module module40
#(parameter param75 = (((-({(8'h9f)} ? (~&(8'hb7)) : (^(8'hb0)))) < ((((8'hac) ^~ (8'hbd)) >= (~^(8'ha4))) ? (((8'ha8) ~^ (8'h9f)) ? ((8'hba) ~^ (8'h9f)) : ((8'h9c) != (8'ha1))) : (8'had))) ? ((~(((8'hac) ? (8'hab) : (8'haa)) ? ((8'hbf) ? (8'hb5) : (8'had)) : ((8'hb0) ? (8'hbe) : (8'h9c)))) ? {(-(-(8'had)))} : (8'ha4)) : {(((~^(8'ha1)) | ((8'ha5) || (8'hb5))) ? (((8'h9d) ? (8'ha3) : (8'hb7)) ? ((7'h43) - (8'hbc)) : ((8'had) || (8'hb1))) : (((7'h41) ? (8'hbe) : (7'h44)) ? (~&(8'hb1)) : ((8'haa) ? (8'haa) : (8'hbc)))), (~((!(8'hbb)) ? (!(8'hbc)) : ((8'hb8) ~^ (8'ha2))))}))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire45;
  input wire signed [(4'he):(1'h0)] wire44;
  input wire [(2'h2):(1'h0)] wire43;
  input wire [(4'ha):(1'h0)] wire42;
  input wire [(5'h15):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire46;
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire55,
                 wire54,
                 wire53,
                 wire48,
                 wire47,
                 wire46,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg57,
                 reg56,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire46 = (!(~|{wire42, $signed(wire43)}));
  assign wire47 = $unsigned((wire41 ?
                      $signed($unsigned($signed(wire42))) : ($signed((~wire45)) ?
                          {$unsigned(wire43)} : wire45[(2'h3):(2'h2)])));
  assign wire48 = (($signed(($signed((8'h9f)) << (wire43 ?
                          wire45 : (8'ha6)))) ^~ $signed((~&(wire41 ?
                          wire43 : wire43)))) ?
                      (wire43[(1'h1):(1'h0)] > ($signed(wire42) || (!wire44[(4'hc):(4'hb)]))) : $unsigned(wire42));
  always
    @(posedge clk) begin
      reg49 <= wire47[(2'h2):(1'h1)];
      if ({($unsigned((~^$signed(wire42))) ?
              ((^(wire41 || wire46)) < (8'hac)) : $signed(wire47[(1'h1):(1'h0)]))})
        begin
          reg50 <= reg49;
        end
      else
        begin
          reg50 <= wire43[(2'h2):(1'h1)];
          reg51 <= (~wire46[(1'h1):(1'h0)]);
          reg52 <= $unsigned(wire43);
        end
    end
  assign wire53 = reg49[(4'h8):(3'h5)];
  assign wire54 = wire43;
  assign wire55 = $unsigned({$signed($signed($unsigned(wire54)))});
  always
    @(posedge clk) begin
      reg56 <= $unsigned(wire47);
      reg57 <= ($unsigned((((wire41 ?
          wire43 : wire47) <= (wire46 <<< wire42)) >>> $unsigned(wire55))) == ($signed(wire44) ^ reg51[(5'h10):(4'ha)]));
    end
  assign wire58 = ((~&wire47) * wire55[(1'h1):(1'h1)]);
  assign wire59 = wire55[(1'h0):(1'h0)];
  assign wire60 = (($unsigned({$unsigned(reg57), (~&reg50)}) ?
                          wire47[(2'h2):(2'h2)] : (wire41 <= ($unsigned(wire59) || (reg57 <<< wire41)))) ?
                      reg49 : wire55[(1'h0):(1'h0)]);
  assign wire61 = (reg50[(2'h2):(1'h0)] ?
                      (wire43 <= wire41[(5'h10):(4'hb)]) : (reg57[(1'h0):(1'h0)] ?
                          $signed($signed((reg57 >= (8'ha8)))) : (-{(wire42 | wire60),
                              (wire60 ? reg57 : wire42)})));
  assign wire62 = (8'hb0);
  assign wire63 = (!wire42);
  assign wire64 = $signed((+($unsigned(wire60[(3'h7):(1'h0)]) ?
                      {(-(8'hb0)), $unsigned(reg50)} : ((~^(8'haf)) ?
                          (wire54 == wire46) : $unsigned((8'ha2))))));
  assign wire65 = $unsigned(((~$unsigned(reg57[(1'h0):(1'h0)])) ?
                      $unsigned($unsigned(wire42)) : {$signed($unsigned(wire53))}));
  always
    @(posedge clk) begin
      reg66 <= wire55[(2'h2):(1'h0)];
      if ($unsigned(((8'ha7) ^~ wire44[(3'h5):(1'h0)])))
        begin
          if (((8'hba) >>> $signed($unsigned((!(wire53 || wire64))))))
            begin
              reg67 <= wire65;
              reg68 <= wire45;
              reg69 <= (reg66 == $signed((~&(8'hbb))));
              reg70 <= (wire43[(2'h2):(1'h0)] >> (~&$unsigned(wire45)));
            end
          else
            begin
              reg67 <= $unsigned($unsigned($signed($signed(reg69[(2'h2):(1'h1)]))));
              reg68 <= ((~(~reg66)) ?
                  (reg51 >> {reg50, $signed((&reg49))}) : {wire65,
                      $unsigned($unsigned((~^(8'hba))))});
            end
          reg71 <= (8'ha2);
          if ((wire58[(4'hd):(2'h3)] >> reg50[(2'h3):(1'h0)]))
            begin
              reg72 <= ((!$signed($unsigned((|reg71)))) ~^ (wire48 ?
                  reg57[(1'h0):(1'h0)] : wire42));
              reg73 <= {(&{{(reg67 ? reg51 : wire45), (reg51 - wire42)}}),
                  {reg52,
                      ($unsigned((wire65 ? (8'hac) : wire60)) ?
                          ((wire44 ?
                              wire46 : wire59) < (wire55 && reg71)) : wire41)}};
              reg74 <= reg49[(4'hb):(3'h4)];
            end
          else
            begin
              reg72 <= reg74[(1'h0):(1'h0)];
              reg73 <= wire60[(3'h4):(1'h0)];
            end
        end
      else
        begin
          reg67 <= $signed(reg57[(2'h3):(1'h1)]);
          if (wire47)
            begin
              reg68 <= wire58[(1'h0):(1'h0)];
            end
          else
            begin
              reg68 <= wire47[(2'h3):(1'h0)];
              reg69 <= wire41[(4'hc):(4'hb)];
            end
        end
    end
endmodule
