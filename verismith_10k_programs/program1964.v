module top
#(parameter param163 = {(+(((^(8'ha7)) ? {(8'ha7), (7'h44)} : {(8'hac), (8'h9e)}) ? ({(7'h40), (8'hb9)} ? ((8'hba) ? (8'haa) : (8'ha1)) : ((8'hb5) + (8'h9c))) : (|(~(8'hb3))))), (((8'hac) ? (((8'hb0) & (8'haa)) ? {(8'ha3)} : {(8'hb6)}) : {((8'ha3) ? (7'h41) : (8'ha7))}) ? ((|((8'h9d) >= (8'h9f))) ? (|{(8'hab)}) : (~^(&(7'h42)))) : ((8'ha8) ? (((8'haf) <= (8'hb3)) ^~ ((8'hba) ^ (8'hae))) : (((8'hb9) <= (8'hbb)) >> ((8'hb3) | (8'hb3)))))}, 
parameter param164 = (8'hbb))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire162;
  wire [(3'h7):(1'h0)] wire161;
  wire signed [(4'h9):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire159;
  assign y = {wire162, wire161, wire157, wire159, (1'h0)};
  module4 #() modinst158 (.wire5(wire1), .clk(clk), .y(wire157), .wire8(wire0), .wire6(wire3), .wire7(wire2));
  module61 #() modinst160 (.wire66(wire2), .wire62(wire157), .clk(clk), .wire64(wire1), .wire63(wire3), .y(wire159), .wire65(wire0));
  assign wire161 = (!(~|$unsigned(wire0[(5'h11):(3'h6)])));
  assign wire162 = wire1[(4'h9):(3'h6)];
endmodule

module module4
#(parameter param156 = ((+(((^(8'hbe)) ? (~^(8'h9d)) : ((8'ha7) ? (8'ha2) : (8'hb6))) ? (8'ha0) : (((8'hbc) ? (8'hb6) : (8'ha6)) <<< {(8'hab), (8'hbd)}))) ^~ ((8'ha3) ? ((((8'ha3) ? (8'ha3) : (8'haf)) >>> ((8'hb1) ? (8'hbb) : (8'h9e))) ? ((^~(8'hbe)) == ((8'ha2) ^~ (8'ha2))) : ((~^(8'had)) < ((7'h43) ^ (7'h44)))) : (&(~(~^(8'ha0)))))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire5;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire signed [(3'h6):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire154;
  wire [(3'h6):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire54;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire132;
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  assign y = {wire154,
                 wire52,
                 wire18,
                 wire19,
                 wire36,
                 wire54,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire96,
                 wire98,
                 wire99,
                 wire100,
                 wire101,
                 wire132,
                 reg56,
                 reg55,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= (~&($unsigned($unsigned(wire5)) + $signed(($unsigned((7'h44)) ?
          (wire8 || wire5) : $unsigned(wire5)))));
      if ((((wire8[(3'h7):(2'h2)] == $unsigned((wire7 ? wire7 : (8'hbf)))) ?
              (~^(8'hac)) : $signed(($signed(reg9) + wire7))) ?
          ((reg9[(1'h0):(1'h0)] ?
                  $signed(wire6[(5'h13):(4'ha)]) : ((wire6 == wire6) > (wire7 ?
                      wire7 : wire7))) ?
              $unsigned((&(8'had))) : (reg9[(1'h0):(1'h0)] ?
                  wire8[(1'h1):(1'h1)] : wire7)) : {(wire6 ?
                  $unsigned(wire5) : ((|(8'hb0)) ?
                      wire5[(5'h11):(5'h10)] : (wire7 ? wire7 : reg9)))}))
        begin
          reg10 <= wire7;
          reg11 <= (wire8[(3'h5):(1'h1)] ^~ wire7[(2'h2):(2'h2)]);
        end
      else
        begin
          if ((($signed(($signed(wire5) >>> wire6[(1'h1):(1'h0)])) ?
              $unsigned(wire6[(2'h2):(1'h1)]) : (!reg9)) * (~^(((reg10 && reg9) | (&wire6)) > $unsigned(wire8[(4'hf):(2'h3)])))))
            begin
              reg10 <= reg11[(2'h3):(1'h0)];
              reg11 <= (~&reg10);
              reg12 <= ($unsigned($signed(wire5)) ?
                  reg11 : (((reg11 == $signed(wire5)) ?
                      (wire7 ? reg10 : (~^wire5)) : ((wire7 ?
                          wire6 : wire7) == (wire6 && wire5))) ~^ wire8[(1'h0):(1'h0)]));
              reg13 <= (~$signed(wire5));
              reg14 <= (-reg12[(3'h7):(1'h0)]);
            end
          else
            begin
              reg10 <= $signed(reg13[(2'h3):(1'h1)]);
              reg11 <= wire7;
              reg12 <= $unsigned($unsigned(reg11[(2'h3):(1'h0)]));
            end
          reg15 <= wire6;
        end
      reg16 <= reg9[(1'h1):(1'h1)];
      reg17 <= (|$signed(reg12));
    end
  assign wire18 = reg12;
  assign wire19 = {((8'hae) ^~ (~&wire6[(4'hb):(3'h5)]))};
  module20 #() modinst37 (.wire22(reg11), .clk(clk), .wire24(wire5), .wire21(wire19), .wire23(wire8), .y(wire36));
  module38 #() modinst53 (wire52, clk, wire19, reg16, wire18, wire6, reg15);
  assign wire54 = $unsigned(wire5);
  always
    @(posedge clk) begin
      reg55 <= wire8[(5'h11):(3'h7)];
      reg56 <= $unsigned(($unsigned({wire36, reg9[(1'h0):(1'h0)]}) ?
          ($signed($unsigned(reg16)) != reg14[(3'h6):(3'h6)]) : $signed(wire7)));
    end
  assign wire57 = wire52[(1'h0):(1'h0)];
  assign wire58 = $signed({reg11[(3'h6):(3'h5)],
                      (wire54 ? reg11[(1'h0):(1'h0)] : reg11)});
  assign wire59 = (wire8 ^~ ($signed((8'ha9)) & (8'h9e)));
  assign wire60 = (&$unsigned((&reg15[(2'h3):(1'h1)])));
  module61 #() modinst97 (wire96, clk, wire52, reg17, reg14, reg16, wire54);
  assign wire98 = ((((~|{reg56, wire7}) ~^ (8'had)) ?
                      wire5[(2'h3):(2'h3)] : $signed(reg9[(1'h0):(1'h0)])) < $signed($signed({(|(8'haf)),
                      {(8'hae)}})));
  assign wire99 = ($signed((~^(wire18 <<< reg10[(1'h0):(1'h0)]))) ?
                      $signed($signed(($signed(wire54) ?
                          reg16 : $unsigned(reg12)))) : (~&wire98));
  assign wire100 = ({wire54[(3'h5):(3'h5)],
                           (((^~reg9) ?
                               $unsigned(wire52) : $unsigned(reg14)) >>> wire18)} ?
                       {$signed($unsigned((wire36 << wire54)))} : ({$unsigned((~^reg11))} < {(~|(^wire6)),
                           wire18}));
  assign wire101 = reg55[(4'h9):(3'h4)];
  module102 #() modinst133 (wire132, clk, wire36, wire8, reg11, wire58, reg56);
  module134 #() modinst155 (wire154, clk, reg10, wire7, reg56, reg15, wire58);
endmodule

module module134  (y, clk, wire139, wire138, wire137, wire136, wire135);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire139;
  input wire [(3'h6):(1'h0)] wire138;
  input wire [(5'h14):(1'h0)] wire137;
  input wire [(5'h10):(1'h0)] wire136;
  input wire signed [(2'h3):(1'h0)] wire135;
  wire [(3'h6):(1'h0)] wire141;
  wire signed [(4'hb):(1'h0)] wire140;
  reg [(4'hc):(1'h0)] reg153 = (1'h0);
  reg [(4'he):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(5'h10):(1'h0)] reg148 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(4'hb):(1'h0)] reg142 = (1'h0);
  assign y = {wire141,
                 wire140,
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
                 (1'h0)};
  assign wire140 = wire139[(4'h8):(4'h8)];
  assign wire141 = $unsigned($signed((wire139 ?
                       $unsigned(wire138[(3'h5):(3'h4)]) : {$signed(wire137)})));
  always
    @(posedge clk) begin
      reg142 <= (((~&$signed($signed(wire138))) ?
          ((8'hbf) >= (8'hb2)) : $signed($unsigned(wire135))) ~^ $signed(((wire139[(1'h1):(1'h0)] ?
              (~(8'ha7)) : wire135[(2'h3):(2'h3)]) ?
          $signed(wire135) : (8'hb9))));
      if ({((-wire140) == $signed(wire137[(1'h1):(1'h1)])),
          wire138[(3'h6):(2'h2)]})
        begin
          if ((~reg142[(1'h1):(1'h0)]))
            begin
              reg143 <= (({reg142[(2'h2):(1'h0)]} != ($signed($unsigned((8'ha0))) ?
                      wire138 : $signed((wire135 ^ wire139)))) ?
                  (~((|((8'ha0) ? wire137 : wire138)) ?
                      wire135 : $signed($signed(wire137)))) : {{((wire141 * wire139) ?
                              ((8'ha8) + (8'hb7)) : (^wire138))},
                      (~^((wire136 ? wire139 : (8'ha7)) & $signed(wire139)))});
              reg144 <= {$unsigned(wire138), $unsigned(wire135)};
              reg145 <= ({(^~$unsigned((8'ha2)))} | $signed({wire140[(1'h1):(1'h1)],
                  ((reg143 ? (8'h9c) : wire139) >= reg142[(1'h0):(1'h0)])}));
              reg146 <= $unsigned($signed((+(~^$signed(wire135)))));
              reg147 <= reg143;
            end
          else
            begin
              reg143 <= (+((^~((8'hbe) + reg146)) ?
                  (wire135 ?
                      $unsigned($unsigned(reg142)) : (|$signed((8'hba)))) : (+(reg142[(2'h3):(2'h2)] * reg146))));
            end
          reg148 <= (wire138 ?
              (~&(reg143 ?
                  (|(wire139 ~^ wire136)) : (^$signed((8'hbd))))) : wire139[(3'h4):(2'h3)]);
        end
      else
        begin
          if (reg145[(2'h2):(1'h0)])
            begin
              reg143 <= (!(($signed({(8'hb3), reg145}) ?
                      wire138[(3'h6):(1'h1)] : $unsigned(reg146[(2'h3):(2'h3)])) ?
                  (+($signed((8'ha4)) >>> $signed(reg143))) : $unsigned((|wire138))));
              reg144 <= ((wire137 ?
                  $unsigned(($unsigned(wire135) ?
                      ((8'ha0) ?
                          reg142 : wire139) : $unsigned(wire139))) : (8'hbd)) & $signed((wire138 ?
                  $signed($signed((8'hbd))) : ((!reg142) <= wire136[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg143 <= (reg146 != {wire137, wire135});
              reg144 <= $unsigned((~$signed(((reg144 << wire138) ~^ {wire136}))));
              reg145 <= reg143[(1'h0):(1'h0)];
              reg146 <= $signed((~^$signed(($signed(wire139) ?
                  {reg143} : (reg145 >>> reg146)))));
              reg147 <= {(-(-((wire135 ~^ wire135) >>> (wire137 >> reg146)))),
                  wire136[(2'h3):(2'h3)]};
            end
        end
      reg149 <= $unsigned({$signed(wire136[(5'h10):(3'h5)]),
          (((reg148 >> wire138) ? $signed(reg144) : $unsigned(wire136)) ?
              (~|$signed(reg144)) : (+$unsigned(reg148)))});
    end
  always
    @(posedge clk) begin
      reg150 <= $signed(reg142);
      reg151 <= ({({(|wire137)} ?
              $signed(((8'hbd) ? wire138 : wire140)) : $signed((~&(8'hbb)))),
          ($signed((reg142 ? (8'ha6) : reg148)) ?
              ({wire139,
                  wire135} * $unsigned((8'h9e))) : $signed(reg143[(3'h6):(3'h6)]))} > {{($signed(wire140) ?
                  reg150[(3'h4):(1'h0)] : $signed(reg146)),
              ((wire137 == reg149) >>> ((8'hb9) ? (8'haa) : (8'hb3)))}});
      reg152 <= wire135[(1'h1):(1'h0)];
      reg153 <= $signed($unsigned(((reg152 ? (&reg146) : (~&reg152)) ?
          reg143[(1'h1):(1'h1)] : {$signed(reg145), {wire139, wire137}})));
    end
endmodule

module module102
#(parameter param131 = ({({(|(8'had)), ((8'hba) >= (7'h40))} ? (((8'hbc) ? (8'ha4) : (8'hb6)) ? (-(8'hb2)) : ((8'hb5) ? (8'hb3) : (8'h9f))) : ({(8'hac), (8'hba)} ? ((8'hae) >= (7'h44)) : {(8'ha9)})), (({(8'ha8)} ? ((8'ha8) ? (8'h9d) : (8'hb5)) : ((8'hb0) ? (8'hb0) : (7'h44))) ? (~^((8'ha5) ? (8'ha8) : (8'ha9))) : {(~|(8'hbf))})} ? ((~|(((8'hb1) > (8'ha1)) | (!(7'h42)))) ^~ ({((8'hb6) ? (8'h9d) : (8'ha6)), (~(8'hb9))} <= (((8'hae) * (8'hb3)) ? ((8'h9d) ? (8'ha1) : (8'ha8)) : (&(8'ha8))))) : ((((+(8'hb2)) == (&(8'h9c))) ? (|(~|(8'ha2))) : ({(8'hbf)} ? ((8'hbc) >= (8'ha7)) : (^(7'h42)))) ? (7'h40) : ((((8'ha0) || (8'hb4)) >= {(7'h40)}) ? (((8'h9e) ? (8'haf) : (7'h42)) ? (~^(8'hb3)) : ((8'ha7) ? (8'hb3) : (7'h42))) : {(~(8'had)), {(8'haa)}}))))
(y, clk, wire107, wire106, wire105, wire104, wire103);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire107;
  input wire [(3'h6):(1'h0)] wire106;
  input wire signed [(3'h7):(1'h0)] wire105;
  input wire signed [(4'he):(1'h0)] wire104;
  input wire signed [(4'h9):(1'h0)] wire103;
  wire [(5'h14):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire [(2'h2):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire [(3'h4):(1'h0)] wire108;
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg114 = (1'h0);
  assign y = {wire130,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
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
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire108 = {((((wire104 & wire104) ? {(8'hae), wire106} : (~wire103)) ?
                           ((wire103 | wire105) ?
                               wire107 : wire107) : $unsigned($unsigned(wire104))) + $signed($unsigned(wire104[(3'h7):(1'h0)]))),
                       (-(8'h9d))};
  assign wire109 = (wire106 * {$unsigned(({wire106} ? (|(7'h43)) : (8'hb6)))});
  assign wire110 = (~|wire103[(3'h7):(2'h2)]);
  assign wire111 = (((~&wire105[(1'h1):(1'h1)]) | ($unsigned({wire107}) << $unsigned($unsigned(wire110)))) ~^ ($signed(((|wire106) ~^ (wire103 ?
                           wire109 : (8'hb5)))) ?
                       {(~{wire108})} : $unsigned(wire104[(3'h7):(3'h5)])));
  assign wire112 = wire106;
  assign wire113 = (~&wire111);
  always
    @(posedge clk) begin
      reg114 <= wire104;
      reg115 <= wire108[(3'h4):(1'h0)];
    end
  assign wire116 = $signed(reg114[(2'h3):(2'h2)]);
  assign wire117 = reg115;
  assign wire118 = (^reg115);
  assign wire119 = ($unsigned((($signed(reg115) ?
                       wire117 : (+reg114)) >> $unsigned($signed(wire112)))) < reg115);
  always
    @(posedge clk) begin
      reg120 <= wire113;
      if ((~^(|reg115[(4'ha):(1'h0)])))
        begin
          reg121 <= $unsigned(((reg115 | (((7'h42) >> wire110) > (-wire112))) <<< wire119[(5'h12):(5'h10)]));
          if ({wire110,
              (~|(($unsigned(wire113) ? wire109 : {reg120, wire108}) ?
                  (&$unsigned(wire117)) : $unsigned({reg120})))})
            begin
              reg122 <= reg115[(4'hc):(4'hb)];
              reg123 <= (wire118[(3'h5):(1'h0)] ?
                  (8'had) : reg120[(4'hc):(4'hc)]);
              reg124 <= wire109;
              reg125 <= (^wire113[(1'h0):(1'h0)]);
            end
          else
            begin
              reg122 <= (~^$signed(wire105));
              reg123 <= ((~&(({(8'hba)} <= wire116) ?
                  wire113 : $signed($signed(wire104)))) <= $signed($unsigned((!(wire111 ?
                  wire110 : wire113)))));
              reg124 <= (((^(~&$unsigned(reg122))) ?
                      {((~|reg115) ?
                              $unsigned(wire104) : {wire117})} : (((~^(8'hbe)) ?
                              {(8'hb0)} : (^wire105)) ?
                          ((wire116 - reg114) ?
                              {reg115, reg114} : $signed(wire109)) : wire109)) ?
                  (8'h9f) : wire113[(1'h0):(1'h0)]);
            end
          reg126 <= (($unsigned(wire116[(1'h1):(1'h1)]) ?
                  ({(~|reg125)} ? reg125 : (+wire110)) : ((^$signed((8'h9c))) ?
                      ($unsigned(wire113) ?
                          (wire104 ?
                              reg124 : (8'ha3)) : wire106[(2'h3):(2'h2)]) : (((8'hba) >>> wire118) ?
                          (wire113 ?
                              wire103 : (8'ha4)) : ((8'hae) * wire109)))) ?
              (wire106[(3'h4):(1'h1)] ?
                  (wire103 <= (8'h9f)) : $signed(((^reg114) ?
                      wire107 : (^~(8'hbb))))) : $unsigned((&{$signed(reg123),
                  $unsigned(wire109)})));
          reg127 <= (|wire111[(3'h7):(3'h4)]);
          reg128 <= (+(8'hbf));
        end
      else
        begin
          reg121 <= {$unsigned(($signed($unsigned(wire113)) >> reg126))};
          reg122 <= $unsigned(wire110[(2'h2):(1'h0)]);
          reg123 <= wire113[(2'h2):(1'h0)];
          if ((reg126[(5'h10):(4'h8)] >>> $signed(reg122)))
            begin
              reg124 <= (wire109[(2'h2):(1'h0)] ?
                  (&wire111[(4'h9):(3'h5)]) : {(|wire111)});
              reg125 <= (wire109 ?
                  (^((reg127[(4'h9):(3'h7)] ?
                          $unsigned((8'hbc)) : $unsigned(reg120)) ?
                      ($unsigned(wire107) ^~ reg124) : $unsigned((wire106 & reg125)))) : {((((7'h41) <= wire109) ?
                          (wire103 || wire110) : (reg128 ?
                              wire119 : (8'hac))) <<< wire113),
                      wire116});
            end
          else
            begin
              reg124 <= (&$unsigned(($unsigned($signed(reg127)) ?
                  ((reg120 ?
                      reg123 : wire117) || (reg121 - (8'hb7))) : reg127[(3'h4):(1'h1)])));
              reg125 <= wire118[(3'h6):(2'h3)];
              reg126 <= $signed((((^(reg121 ?
                  reg121 : reg121)) || (8'h9d)) < (|(wire104 ?
                  (reg124 * reg115) : (wire108 > reg127)))));
            end
        end
      reg129 <= reg127;
    end
  assign wire130 = $signed($signed(({((8'hb5) ? (8'hbe) : reg126), reg114} ?
                       {wire118} : ((wire106 ? reg127 : wire118) << (reg126 ?
                           reg126 : reg127)))));
endmodule

module module61  (y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire66;
  input wire signed [(5'h11):(1'h0)] wire65;
  input wire [(2'h2):(1'h0)] wire64;
  input wire signed [(3'h5):(1'h0)] wire63;
  input wire signed [(2'h2):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire95;
  wire [(3'h5):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire92;
  wire signed [(3'h4):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire [(5'h12):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire68;
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire68,
                 reg90,
                 reg89,
                 reg82,
                 reg81,
                 reg80,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg67,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg67 <= $unsigned($unsigned((($signed(wire64) ?
          wire64 : (wire65 && (8'ha3))) != $unsigned((-wire65)))));
    end
  assign wire68 = ($signed({(|wire65[(3'h5):(2'h2)])}) <<< (+$unsigned($unsigned(((8'hbb) >> reg67)))));
  always
    @(posedge clk) begin
      if (wire65)
        begin
          if ({(wire65[(4'hf):(3'h7)] < (((reg67 ? (8'hbd) : reg67) ?
                  $signed(wire65) : {wire64}) <= $unsigned((wire66 ?
                  wire62 : (8'hbe)))))})
            begin
              reg69 <= $unsigned((+$unsigned((~wire68[(5'h11):(1'h1)]))));
            end
          else
            begin
              reg69 <= $signed(wire62);
              reg70 <= ((8'ha1) ~^ {$unsigned(((wire62 > wire63) ?
                      (reg67 <= reg69) : {wire68, wire65}))});
              reg71 <= $signed((|((|wire65) + $unsigned(wire66))));
              reg72 <= wire62[(2'h2):(1'h1)];
              reg73 <= (^wire68);
            end
        end
      else
        begin
          reg69 <= $unsigned(((&wire63) ?
              $unsigned(wire66[(3'h5):(1'h1)]) : $signed($signed($unsigned((8'hbb))))));
          reg70 <= (8'hb3);
        end
      reg74 <= $unsigned((8'hb6));
    end
  assign wire75 = ({$signed((&$unsigned(wire63)))} ?
                      wire64 : ((($unsigned(reg70) ?
                                  (!wire62) : wire63[(3'h4):(1'h0)]) ?
                              ((wire62 ?
                                  (7'h40) : (8'hb3)) && wire62) : reg73[(1'h0):(1'h0)]) ?
                          reg67[(2'h3):(2'h3)] : ({reg72[(3'h6):(3'h4)],
                                  (~|reg69)} ?
                              {{reg67}} : (~&(reg70 ? reg72 : wire63)))));
  assign wire76 = (-$unsigned($unsigned(wire62[(1'h0):(1'h0)])));
  assign wire77 = reg72[(4'h9):(3'h7)];
  assign wire78 = ($signed(reg73[(4'h9):(1'h0)]) ?
                      (^~$signed($unsigned(((8'hae) != reg71)))) : $unsigned(reg67[(1'h0):(1'h0)]));
  assign wire79 = $signed(((~(~&$unsigned(wire63))) ? reg69 : reg67));
  always
    @(posedge clk) begin
      reg80 <= {$unsigned(wire78)};
      reg81 <= reg69[(3'h5):(2'h3)];
      reg82 <= $signed(reg73);
    end
  assign wire83 = {$unsigned(wire78[(4'hd):(3'h7)])};
  assign wire84 = reg82[(3'h5):(2'h2)];
  assign wire85 = {($unsigned((!(reg72 <= reg82))) ?
                          ((wire63 ?
                              $signed((8'ha5)) : $signed(wire75)) - wire63[(2'h3):(1'h0)]) : reg81[(4'he):(3'h7)])};
  assign wire86 = (|(&wire75[(3'h6):(1'h0)]));
  assign wire87 = ($unsigned(($signed($unsigned(reg74)) ?
                          $signed($unsigned(reg80)) : $signed($signed(wire75)))) ?
                      wire79 : (~^$signed({(reg81 ? reg72 : reg71)})));
  assign wire88 = (~^{wire77, $unsigned(wire68)});
  always
    @(posedge clk) begin
      reg89 <= $unsigned({($signed((wire63 ? wire84 : wire85)) ?
              {reg67[(2'h2):(1'h1)], (!reg67)} : (~^wire84)),
          (((~reg74) ? $unsigned(wire64) : wire79) ?
              $signed($signed(wire66)) : ((wire77 ? wire64 : reg70) ?
                  (wire88 ? wire87 : wire64) : (wire84 ? wire63 : reg81)))});
      reg90 <= (~^$signed(((wire66 ?
          $unsigned((8'hb0)) : {wire62, wire85}) <= {$unsigned(wire76),
          (reg71 ? (8'hb5) : (8'hb2))})));
    end
  assign wire91 = (|(($signed((wire63 ? reg73 : reg80)) == {$signed(reg89)}) ?
                      ((8'ha5) < ((wire87 ? (7'h40) : (8'hbb)) ?
                          reg80 : (^~wire87))) : wire65[(1'h0):(1'h0)]));
  assign wire92 = (+reg69);
  assign wire93 = {$signed($unsigned($unsigned((~&reg72))))};
  assign wire94 = (+(((|wire76[(1'h0):(1'h0)]) >= ($unsigned(reg74) <<< (~|wire68))) ?
                      $unsigned($signed((wire66 <= reg81))) : $signed(wire63)));
  assign wire95 = ((7'h40) ? reg89[(3'h6):(3'h4)] : wire86);
endmodule

module module38  (y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire43;
  input wire signed [(4'h9):(1'h0)] wire42;
  input wire [(4'hf):(1'h0)] wire41;
  input wire [(3'h6):(1'h0)] wire40;
  input wire [(4'h9):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire44;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 (1'h0)};
  assign wire44 = (wire41 ?
                      $unsigned(($signed(((8'haa) ^~ wire42)) ?
                          $signed(wire43[(1'h1):(1'h1)]) : wire41)) : wire43);
  assign wire45 = (~|$signed(wire44[(2'h3):(1'h0)]));
  assign wire46 = wire43[(4'h8):(1'h0)];
  assign wire47 = wire40;
  assign wire48 = $signed($signed((wire43 ?
                      $unsigned(((8'hab) > wire43)) : $signed({wire40}))));
  assign wire49 = (-$unsigned($signed($unsigned((wire39 >= wire45)))));
  assign wire50 = wire40;
  assign wire51 = (8'hbb);
endmodule

module module20  (y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire24;
  input wire signed [(4'h9):(1'h0)] wire23;
  input wire signed [(3'h6):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  assign y = {wire35,
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
                 (1'h0)};
  assign wire25 = {(wire22[(1'h1):(1'h0)] && wire23),
                      (&(|$unsigned(wire22[(3'h5):(3'h4)])))};
  assign wire26 = wire21;
  assign wire27 = (wire25 ?
                      ($unsigned(((wire22 > wire26) ?
                              (wire21 && wire26) : {wire26})) ?
                          wire26[(2'h3):(1'h0)] : (($unsigned(wire26) <<< (wire21 ~^ wire22)) ?
                              wire23[(2'h2):(2'h2)] : wire25[(4'h9):(3'h6)])) : $signed(((((8'ha7) ?
                          (8'hb3) : wire24) <<< (wire23 ?
                          wire24 : wire24)) >= (~(~wire21)))));
  assign wire28 = wire26;
  assign wire29 = wire21[(4'h8):(3'h7)];
  assign wire30 = $signed((8'hbe));
  assign wire31 = {$signed($unsigned((wire26[(2'h3):(2'h3)] ?
                          $signed((8'hb1)) : $unsigned(wire24)))),
                      (~^$signed({(~wire22)}))};
  assign wire32 = (((($unsigned(wire22) ? wire31 : wire26[(3'h7):(1'h0)]) ?
                              wire28[(4'hf):(3'h5)] : (((8'h9f) ?
                                  wire26 : wire27) * {(7'h44)})) ?
                          (($unsigned(wire21) - (wire22 == (8'ha1))) ?
                              wire23[(1'h1):(1'h1)] : $unsigned((wire26 * (7'h44)))) : wire23) ?
                      (wire21[(3'h5):(3'h4)] ?
                          (&wire31[(2'h2):(1'h0)]) : wire28) : {wire29,
                          $signed(((wire31 && (8'hb5)) ?
                              wire30 : (^~wire23)))});
  assign wire33 = $unsigned((wire27[(4'hc):(4'h8)] ?
                      (7'h40) : $unsigned((~^wire27))));
  assign wire34 = wire27;
  assign wire35 = $signed($signed($unsigned(($signed(wire27) | (wire31 ?
                      wire30 : wire24)))));
endmodule
