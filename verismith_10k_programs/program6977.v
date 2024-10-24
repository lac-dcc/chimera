module top
#(parameter param204 = ({{((!(8'hbe)) ? ((7'h42) ^ (8'hab)) : (^~(8'hba))), {(&(8'hbc))}}} >> {({(-(8'hb3)), ((8'ha0) > (8'hb6))} >>> (^((8'ha3) ? (8'h9d) : (8'hbd))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire203;
  wire signed [(3'h4):(1'h0)] wire197;
  wire [(4'ha):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg201 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  assign y = {wire203,
                 wire197,
                 wire131,
                 wire33,
                 wire32,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
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
                 (1'h0)};
  assign wire5 = {$unsigned(((wire2[(1'h0):(1'h0)] < $signed(wire3)) ~^ ((8'hbc) + wire3))),
                     {(wire2[(4'h8):(1'h0)] ~^ {wire4})}};
  assign wire6 = (-$unsigned($unsigned($signed($signed(wire1)))));
  assign wire7 = ($signed((^$unsigned((wire1 ? wire3 : wire3)))) ?
                     wire6[(3'h7):(3'h5)] : (~&{wire2[(4'hb):(4'h9)]}));
  assign wire8 = $signed((+((+wire7) + wire2)));
  assign wire9 = (+$signed($signed(($signed(wire3) ? wire3 : {wire8}))));
  always
    @(posedge clk) begin
      reg10 <= $unsigned(wire4);
      if (wire6[(3'h4):(1'h0)])
        begin
          if ($signed($signed(wire6[(1'h1):(1'h1)])))
            begin
              reg11 <= $unsigned($unsigned((-wire7[(3'h4):(1'h0)])));
              reg12 <= ($signed(($signed((wire4 << wire6)) != ($unsigned(wire1) >>> $signed((7'h44))))) ~^ $unsigned($signed($unsigned({wire5,
                  wire8}))));
            end
          else
            begin
              reg11 <= $unsigned(($signed($signed(((8'hb8) ?
                  wire3 : wire7))) >= ({wire2[(1'h1):(1'h0)], wire9} ?
                  {wire5} : $unsigned($signed(wire6)))));
              reg12 <= (wire3 ?
                  (^{(!wire3)}) : $signed(({$unsigned(wire3),
                          wire0[(2'h3):(2'h3)]} ?
                      $signed((wire9 ? wire4 : reg12)) : reg11)));
              reg13 <= wire1;
              reg14 <= ($unsigned($signed(wire6)) & {(($signed(reg13) ?
                          $signed(reg10) : $signed(reg10)) ?
                      $signed(wire7[(2'h3):(1'h0)]) : (~^wire2)),
                  (~$signed($unsigned(wire7)))});
            end
          reg15 <= $signed(wire6[(2'h2):(1'h0)]);
          if (wire2[(5'h10):(4'hf)])
            begin
              reg16 <= {$unsigned((~wire2[(2'h3):(1'h1)])), wire3};
              reg17 <= ($signed(((reg13 + reg12) & ($unsigned(wire1) ?
                      {wire4} : reg13[(4'ha):(3'h4)]))) ?
                  {((!{(8'hbb)}) ^ $unsigned(wire6)),
                      (wire9 ?
                          (^~wire3) : ({wire3, reg13} ?
                              $signed(reg11) : (reg14 ^~ reg15)))} : wire4);
              reg18 <= {wire7[(4'hd):(2'h2)],
                  (($unsigned((wire7 ^~ reg13)) | (!$signed(reg13))) != ((^$signed(wire6)) ?
                      reg15[(1'h1):(1'h1)] : $signed({wire9, reg16})))};
              reg19 <= wire2[(3'h7):(1'h1)];
            end
          else
            begin
              reg16 <= ($signed({((wire9 << reg15) & wire8[(1'h1):(1'h1)])}) >>> $unsigned((!reg16[(2'h3):(2'h2)])));
              reg17 <= $unsigned(reg16[(4'hc):(2'h3)]);
              reg18 <= wire7[(1'h1):(1'h1)];
              reg19 <= reg14[(3'h4):(1'h1)];
              reg20 <= ((reg18[(3'h5):(1'h1)] ?
                  ($signed($signed(reg16)) << (|wire7[(1'h1):(1'h0)])) : reg12[(1'h1):(1'h0)]) <= wire4[(1'h0):(1'h0)]);
            end
          reg21 <= (~&$unsigned((&$unsigned(wire8[(1'h1):(1'h1)]))));
        end
      else
        begin
          reg11 <= ($signed($unsigned(($signed(reg13) ?
                  (~&reg11) : $unsigned(reg21)))) ?
              ($signed($unsigned($signed(reg15))) ^ (((wire1 * wire6) ?
                      $unsigned(wire7) : $unsigned((7'h43))) ?
                  reg15[(4'h9):(3'h7)] : (^((8'ha5) && reg15)))) : ((-$signed($signed(wire0))) ?
                  (((reg19 | reg19) ^~ wire4) ?
                      $signed(((8'hac) ?
                          reg10 : reg17)) : (~^$signed((7'h40)))) : $unsigned({wire6[(3'h7):(2'h3)],
                      (~reg17)})));
          reg12 <= (^wire2[(4'he):(1'h0)]);
          reg13 <= (|($unsigned(reg20[(3'h4):(2'h2)]) ?
              (&wire3) : ($signed($signed(wire3)) ?
                  ($signed(wire5) ?
                      wire1[(1'h1):(1'h0)] : wire8) : $unsigned({reg19}))));
        end
      reg22 <= reg11;
      if (reg12)
        begin
          reg23 <= (wire7 | wire1[(1'h1):(1'h0)]);
          reg24 <= $unsigned(({$unsigned(reg21[(1'h1):(1'h1)])} < ($signed((reg10 ?
              reg14 : (8'hbd))) <= (~^$signed(reg10)))));
          reg25 <= reg12[(4'ha):(3'h5)];
          reg26 <= (($signed(reg18) ? reg14 : wire1) <<< (8'haa));
          reg27 <= reg10;
        end
      else
        begin
          if ((wire0 ?
              $unsigned((~|($signed(wire1) ?
                  reg13 : $unsigned(wire2)))) : reg11[(4'h9):(3'h4)]))
            begin
              reg23 <= (reg10 ?
                  (&((reg14 == reg12) >= $unsigned($signed(wire2)))) : reg21);
              reg24 <= (&((&(!wire2[(3'h5):(1'h0)])) ?
                  reg11 : (~&(+(wire8 ? wire2 : (8'hbc))))));
              reg25 <= $unsigned(reg23);
              reg26 <= reg12[(2'h2):(1'h0)];
            end
          else
            begin
              reg23 <= reg15[(4'h9):(3'h6)];
              reg24 <= $unsigned((($signed(reg12[(2'h3):(2'h3)]) == (((8'hbb) && reg12) ?
                      ((8'h9d) ? wire8 : (8'hbd)) : $unsigned((8'ha1)))) ?
                  ($signed((!reg16)) ?
                      reg14[(1'h1):(1'h0)] : (reg15[(4'hb):(4'hb)] < reg15[(1'h1):(1'h1)])) : $signed({{wire4,
                          reg14}})));
              reg25 <= (|$unsigned((wire9 ?
                  $unsigned((reg19 ? reg20 : reg25)) : (reg17 ?
                      $unsigned(reg12) : $unsigned(wire2)))));
              reg26 <= $signed((^~$unsigned(wire2[(4'ha):(4'ha)])));
            end
          reg27 <= (&($unsigned(((~^reg26) ^ $signed(reg27))) >= (~&{reg26,
              reg19})));
        end
      if ($unsigned(reg24))
        begin
          reg28 <= reg24;
          if (reg11)
            begin
              reg29 <= (~&wire4);
              reg30 <= wire7;
            end
          else
            begin
              reg29 <= (!(^({{reg30}} & $signed({wire6, (8'hb5)}))));
              reg30 <= reg16;
              reg31 <= {$signed((reg21[(3'h6):(2'h3)] > $signed(reg28)))};
            end
        end
      else
        begin
          reg28 <= $unsigned(({(reg13 ? (^~reg20) : $signed(wire0))} ?
              (((reg21 << (8'had)) ?
                  reg27[(4'hc):(1'h1)] : {reg22,
                      reg30}) && ((^~reg14) > wire6[(3'h7):(3'h6)])) : ($unsigned($unsigned(wire8)) | {(reg19 ?
                      wire0 : reg13)})));
        end
    end
  assign wire32 = ((reg14[(1'h0):(1'h0)] ?
                      (({reg17, wire5} != {reg22, reg24}) ?
                          ((reg24 * reg21) ?
                              (wire6 ?
                                  reg12 : wire3) : reg19[(2'h2):(2'h2)]) : wire8) : ((|$unsigned(wire6)) ?
                          (~|(reg25 >= (8'ha4))) : $signed($unsigned(reg23)))) >= ($unsigned(((wire8 ?
                      (8'ha1) : wire9) + reg21[(4'h8):(4'h8)])) <= (~|(8'hb6))));
  assign wire33 = (8'hb0);
  module34 #() modinst132 (.wire35(reg26), .y(wire131), .wire36(reg20), .wire37(reg19), .wire38(wire7), .clk(clk), .wire39(wire8));
  module133 #() modinst198 (.wire137(reg10), .wire138(reg27), .clk(clk), .y(wire197), .wire136(reg29), .wire134(reg14), .wire135(reg15));
  always
    @(posedge clk) begin
      reg199 <= $signed((({((8'ha6) ^ reg11), (reg18 ^~ reg18)} ?
              {(^wire32)} : ({wire197, reg16} * ((8'hb8) << wire1))) ?
          $unsigned(reg25[(3'h7):(1'h1)]) : reg22[(5'h13):(4'hc)]));
      reg200 <= $unsigned(reg11[(4'h9):(1'h1)]);
      reg201 <= $unsigned(((^$signed(wire33)) >> $signed($signed(wire6[(4'ha):(2'h3)]))));
      reg202 <= reg29;
    end
  assign wire203 = (~|$signed($signed(wire1)));
endmodule

module module133
#(parameter param196 = (~&((|(((8'h9f) ? (8'h9d) : (8'hae)) & ((8'hbb) ^~ (8'hae)))) * ((+(+(8'hbc))) ? (((8'ha5) < (8'hbd)) ? ((8'hb1) ? (8'ha0) : (8'hb4)) : {(8'hab)}) : ({(8'h9e)} ? (-(8'ha1)) : ((8'ha1) ? (8'ha7) : (8'ha5)))))))
(y, clk, wire134, wire135, wire136, wire137, wire138);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire134;
  input wire signed [(5'h10):(1'h0)] wire135;
  input wire [(4'ha):(1'h0)] wire136;
  input wire [(4'hd):(1'h0)] wire137;
  input wire [(5'h12):(1'h0)] wire138;
  wire signed [(4'hb):(1'h0)] wire195;
  wire [(5'h13):(1'h0)] wire194;
  wire signed [(3'h7):(1'h0)] wire193;
  wire signed [(4'ha):(1'h0)] wire192;
  wire signed [(5'h10):(1'h0)] wire191;
  wire signed [(4'hd):(1'h0)] wire140;
  wire signed [(4'hf):(1'h0)] wire141;
  wire [(4'hf):(1'h0)] wire142;
  wire signed [(2'h3):(1'h0)] wire160;
  wire [(4'h8):(1'h0)] wire161;
  wire [(4'ha):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire163;
  wire [(5'h11):(1'h0)] wire189;
  reg signed [(5'h11):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg147 = (1'h0);
  reg [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg153 = (1'h0);
  reg [(4'ha):(1'h0)] reg154 = (1'h0);
  reg [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(2'h2):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(5'h13):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg159 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire140,
                 wire141,
                 wire142,
                 wire160,
                 wire161,
                 wire162,
                 wire163,
                 wire189,
                 reg139,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg139 <= {wire135[(3'h6):(2'h3)]};
    end
  assign wire140 = wire138;
  assign wire141 = ((~wire137) ?
                       ((((~^(7'h42)) != (wire138 > reg139)) ?
                           $signed((wire135 ?
                               wire137 : wire138)) : {wire137[(2'h3):(1'h0)]}) < $signed(wire137[(4'ha):(4'h8)])) : $signed((~(wire138 <= (~&(8'hb0))))));
  assign wire142 = wire140;
  always
    @(posedge clk) begin
      reg143 <= (~wire140[(3'h5):(2'h3)]);
      reg144 <= $unsigned(reg139);
    end
  always
    @(posedge clk) begin
      if (wire138)
        begin
          if ((8'hbf))
            begin
              reg145 <= (~&(+wire141));
              reg146 <= (wire141[(1'h0):(1'h0)] ?
                  wire141 : (^$signed($signed(wire135))));
              reg147 <= wire140[(4'hc):(2'h2)];
              reg148 <= (reg143[(3'h5):(3'h5)] ?
                  (|(~$signed((wire141 ?
                      wire142 : wire142)))) : (^$signed(((~|wire142) ?
                      $signed(wire137) : $signed(wire141)))));
              reg149 <= {reg144};
            end
          else
            begin
              reg145 <= (+(-{$unsigned($unsigned(wire137)),
                  $signed((!wire134))}));
              reg146 <= $signed((&$signed((wire138 | $unsigned((8'ha2))))));
            end
          reg150 <= reg145[(1'h1):(1'h0)];
          reg151 <= (((^(reg146 ^ wire136[(2'h3):(2'h3)])) ^ wire138) ?
              reg147 : ((reg145[(2'h3):(1'h0)] | reg147) ?
                  ((|reg147) << $unsigned(wire134)) : {((^reg149) << $unsigned(wire141))}));
        end
      else
        begin
          reg145 <= $unsigned(wire134[(4'h8):(1'h0)]);
          if (reg150)
            begin
              reg146 <= $unsigned(((~^(~|((8'hb0) ?
                  wire142 : reg139))) <= reg150[(4'h9):(3'h5)]));
              reg147 <= reg145;
            end
          else
            begin
              reg146 <= (^$signed(reg147));
            end
          reg148 <= wire136;
          reg149 <= (({(wire141[(1'h1):(1'h1)] ~^ {reg147}), reg151} ?
              ({(8'hb1), {wire142}} >> {(reg149 ?
                      wire137 : reg144)}) : {((^~(8'ha3)) ?
                      ((8'h9f) ? reg144 : reg145) : $signed(wire138)),
                  wire136}) >> $unsigned($signed(wire141)));
          reg150 <= {$signed((~^(^{wire140, reg151})))};
        end
      reg152 <= (((wire138 ?
              $unsigned(reg147[(2'h3):(2'h2)]) : ((!wire135) ?
                  $signed(wire137) : reg143)) ?
          reg139[(4'h8):(3'h7)] : $signed($unsigned(reg139))) * $signed((&$signed($signed(reg139)))));
      reg153 <= ((^~$unsigned(reg149[(3'h4):(1'h0)])) ?
          (^~wire135[(1'h1):(1'h0)]) : wire135);
      if ((~|{(((wire138 & reg152) < (reg139 ? wire138 : wire135)) - reg139),
          (-((wire135 + reg144) >= reg143))}))
        begin
          if (reg147[(3'h4):(2'h3)])
            begin
              reg154 <= $unsigned($unsigned(reg148[(1'h1):(1'h1)]));
              reg155 <= {{(~|wire142)}};
              reg156 <= (((~&reg147[(1'h1):(1'h0)]) ?
                  $unsigned($unsigned($signed(reg150))) : {$signed(wire141)}) && (~(reg150[(2'h3):(1'h1)] <<< wire142)));
            end
          else
            begin
              reg154 <= (+{$signed((8'hbf))});
              reg155 <= ((wire140[(2'h2):(2'h2)] ?
                      $unsigned({reg152, ((8'hbe) & wire142)}) : ({{wire141,
                                  (7'h41)}} ?
                          $unsigned($signed((7'h43))) : (!reg144[(1'h0):(1'h0)]))) ?
                  reg154[(1'h0):(1'h0)] : ((((&reg146) >>> (reg150 ?
                              wire137 : (8'hb3))) ?
                          $signed((reg151 == wire136)) : $unsigned((8'ha3))) ?
                      $signed($unsigned((reg146 ?
                          reg143 : reg150))) : (8'ha1)));
            end
          reg157 <= reg147[(2'h3):(1'h0)];
          reg158 <= $signed((+((~reg149) - (~|$unsigned((8'hb7))))));
          reg159 <= ($signed($signed({wire141, reg154})) ~^ reg151);
        end
      else
        begin
          reg154 <= ($signed((+wire140)) ^ (+reg149));
          reg155 <= (^~$unsigned((((8'hb9) ? (^(8'ha7)) : (wire141 | reg148)) ?
              {(-reg151), $signed(reg158)} : $signed($signed(reg143)))));
          reg156 <= ($unsigned((((reg155 || reg143) * reg150[(4'h9):(3'h4)]) ^~ (8'h9d))) ?
              (reg148 ?
                  reg159 : $signed((~$signed(wire134)))) : $unsigned((8'hbf)));
          reg157 <= reg144[(3'h5):(2'h2)];
        end
    end
  assign wire160 = reg144;
  assign wire161 = (({((&(8'hb6)) ?
                               {reg139,
                                   wire140} : (8'hac))} && {($signed(reg159) ?
                               (reg144 ^~ wire136) : wire135[(3'h6):(1'h1)]),
                           (wire136 && reg159[(4'h9):(4'h9)])}) ?
                       ((~|({reg154} & $signed(reg153))) ?
                           (~^(reg151 <= reg151)) : wire141[(2'h2):(1'h1)]) : ($signed({wire135}) ^ (~((reg139 ?
                           reg144 : wire137) ^ $unsigned(reg148)))));
  assign wire162 = $signed(wire161[(4'h8):(4'h8)]);
  assign wire163 = (((8'haf) >= $unsigned({wire137[(4'hb):(4'ha)], wire160})) ?
                       reg152[(3'h6):(2'h3)] : (reg159 ?
                           $signed(reg145[(3'h4):(2'h2)]) : (wire160[(2'h3):(1'h1)] ?
                               ((reg146 ?
                                   reg151 : (8'h9f)) << $signed(reg144)) : (8'hb2))));
  module164 #() modinst190 (.wire167(wire135), .wire165(reg152), .clk(clk), .wire168(wire136), .wire166(wire141), .y(wire189));
  assign wire191 = $signed($unsigned(wire134));
  assign wire192 = ($signed($signed(reg154)) * $unsigned(wire162[(4'h8):(4'h8)]));
  assign wire193 = $signed($signed(reg148));
  assign wire194 = ((~|wire160) ? wire142 : reg153[(2'h2):(2'h2)]);
  assign wire195 = (8'h9d);
endmodule

module module34  (y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire39;
  input wire [(5'h14):(1'h0)] wire38;
  input wire signed [(4'hf):(1'h0)] wire37;
  input wire signed [(3'h7):(1'h0)] wire36;
  input wire [(4'h9):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire129;
  wire [(3'h5):(1'h0)] wire128;
  wire signed [(2'h2):(1'h0)] wire127;
  wire signed [(4'h8):(1'h0)] wire126;
  wire [(3'h4):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire124;
  wire signed [(3'h6):(1'h0)] wire123;
  wire [(4'hd):(1'h0)] wire122;
  wire [(2'h2):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire110;
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire113,
                 wire112,
                 wire76,
                 wire58,
                 wire44,
                 wire40,
                 wire78,
                 wire79,
                 wire80,
                 wire110,
                 reg130,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg41,
                 reg42,
                 reg43,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 (1'h0)};
  assign wire40 = wire39;
  always
    @(posedge clk) begin
      reg41 <= ($unsigned((~^(!$unsigned(wire35)))) ?
          (($unsigned((|(8'hb4))) > {wire40,
              (wire37 ? wire40 : (8'hbe))}) >>> (wire37[(1'h0):(1'h0)] ?
              (8'haa) : wire35)) : ((&(+$unsigned(wire38))) <<< $unsigned((wire38 ~^ $signed(wire40)))));
      reg42 <= (($unsigned($unsigned($unsigned(wire40))) ?
              ($signed((!(8'hbc))) ?
                  $unsigned($unsigned(wire37)) : wire36) : ($signed((+wire36)) ?
                  wire36[(3'h4):(1'h0)] : {wire35[(2'h2):(2'h2)]})) ?
          $unsigned(wire40) : $signed(((&$unsigned(wire36)) ?
              (~&(wire39 ? wire39 : wire35)) : (~^((8'hb1) & wire37)))));
      reg43 <= wire39;
    end
  assign wire44 = ((~^$unsigned($unsigned($signed(wire35)))) - (~^$signed($unsigned((reg43 ?
                      wire40 : reg41)))));
  always
    @(posedge clk) begin
      reg45 <= (8'hb9);
      if ({reg41, reg45[(3'h6):(2'h3)]})
        begin
          reg46 <= reg41;
          reg47 <= ({reg46} ?
              ((reg43 ? wire37 : $unsigned(reg41[(4'h8):(2'h3)])) ?
                  (($unsigned(wire40) | wire44) ?
                      (!wire38) : $unsigned($unsigned((8'haa)))) : $signed(((reg46 ^~ wire36) ^~ (~^wire35)))) : ((((wire35 && reg41) != (8'hb3)) ^~ $unsigned($unsigned(wire38))) ?
                  wire36[(3'h5):(3'h5)] : ($unsigned(((8'ha8) || reg42)) ?
                      {$signed((8'ha7)), (&wire38)} : reg46)));
          reg48 <= ((-$unsigned($unsigned((wire36 >= (8'hb9))))) >= $unsigned((({reg47} ^ reg45[(4'hc):(1'h0)]) == wire39[(3'h4):(1'h1)])));
          reg49 <= $unsigned((~{((reg45 + wire38) ?
                  $unsigned(wire39) : wire35)}));
          reg50 <= reg45;
        end
      else
        begin
          if ((wire38[(4'hf):(4'he)] << $signed($unsigned(($signed(reg50) ?
              $signed((7'h43)) : reg45[(4'ha):(2'h2)])))))
            begin
              reg46 <= (reg49[(1'h1):(1'h1)] || $unsigned(wire35));
              reg47 <= reg50[(1'h0):(1'h0)];
              reg48 <= ((~&$signed({wire40, (reg43 == reg42)})) ?
                  ((reg49[(2'h2):(1'h0)] && {(8'hb3),
                      reg45[(4'hb):(1'h1)]}) & wire38[(4'he):(1'h1)]) : ((wire38 ^~ $signed(((8'hb5) ?
                          wire37 : (8'h9e)))) ?
                      $unsigned(reg41) : (reg48 == $unsigned($signed(wire35)))));
              reg49 <= $unsigned(reg46);
            end
          else
            begin
              reg46 <= reg46[(3'h7):(3'h5)];
            end
        end
      if ($unsigned((~^(~|(~|{reg49})))))
        begin
          if (wire39[(2'h3):(2'h3)])
            begin
              reg51 <= (!$signed(reg45));
              reg52 <= (&(((8'hb8) ?
                      (!(wire35 ? reg46 : reg41)) : $signed($signed((8'hbc)))) ?
                  $unsigned(wire44) : $unsigned(reg46)));
              reg53 <= $unsigned($signed($unsigned(wire38)));
              reg54 <= (-{$unsigned($unsigned(reg46))});
            end
          else
            begin
              reg51 <= $signed(reg46[(4'he):(3'h7)]);
              reg52 <= $unsigned($unsigned(wire38));
              reg53 <= reg41;
              reg54 <= $unsigned((~^$signed($signed((reg52 ?
                  wire36 : wire36)))));
              reg55 <= (reg50[(2'h2):(2'h2)] ?
                  {reg41[(4'h9):(3'h6)]} : ((wire36[(1'h1):(1'h1)] ?
                      $unsigned($unsigned(wire40)) : ($signed(reg51) ?
                          (reg43 ? wire35 : reg42) : (reg42 ?
                              wire38 : reg42))) + reg53));
            end
          reg56 <= {({wire35,
                      ((reg46 & wire36) ? reg50[(1'h0):(1'h0)] : reg47)} ?
                  $unsigned({reg50,
                      wire36[(3'h7):(3'h5)]}) : (wire38[(5'h12):(5'h11)] ?
                      (+reg46[(3'h4):(3'h4)]) : ((reg51 ?
                          reg54 : reg54) > ((7'h43) ? reg41 : wire40)))),
              ($unsigned((reg49 ?
                  (reg42 ? wire40 : reg42) : (8'h9f))) | (((~|reg51) ?
                      (reg43 ? reg45 : wire40) : {wire40, wire38}) ?
                  (wire35 ?
                      wire37[(1'h1):(1'h0)] : reg42[(3'h7):(3'h7)]) : reg51))};
          reg57 <= (~|(($signed((reg41 >> reg50)) >= (^~((8'hac) <= (8'ha0)))) ?
              wire40 : $unsigned($unsigned(reg41[(3'h7):(3'h6)]))));
        end
      else
        begin
          reg51 <= (8'ha4);
          reg52 <= $unsigned(($unsigned((~&(reg55 >>> reg50))) ~^ reg53[(3'h7):(2'h2)]));
        end
    end
  assign wire58 = reg55;
  module59 #() modinst77 (wire76, clk, wire38, wire36, wire37, reg50, reg46);
  assign wire78 = wire40;
  assign wire79 = wire36[(1'h0):(1'h0)];
  assign wire80 = (((^~wire37[(4'he):(4'he)]) ?
                          $signed($signed($unsigned(wire58))) : $signed((!$signed(wire58)))) ?
                      wire35 : (&($signed(reg51[(3'h5):(1'h1)]) ?
                          ((reg42 + reg57) < (reg52 - reg45)) : reg41[(2'h3):(2'h3)])));
  module81 #() modinst111 (.wire82(reg53), .wire84(reg50), .wire85(reg56), .clk(clk), .y(wire110), .wire83(wire38));
  assign wire112 = ($unsigned(((~(|wire110)) ^ ((~|wire110) != reg42[(1'h0):(1'h0)]))) ?
                       wire80[(2'h2):(1'h1)] : $unsigned(($unsigned(wire37) * {wire38})));
  assign wire113 = $signed((8'hb4));
  always
    @(posedge clk) begin
      if ($signed((!$signed((wire79[(4'h9):(3'h6)] ?
          (8'h9f) : ((8'ha2) ? (8'h9f) : reg56))))))
        begin
          reg114 <= $unsigned({reg43[(3'h5):(3'h5)]});
        end
      else
        begin
          reg114 <= wire37;
          reg115 <= (((~|(8'ha3)) ?
                  ($signed((wire39 <<< (8'hbd))) ?
                      (&(8'hb2)) : (!reg47)) : ($signed((reg56 ?
                          reg52 : reg114)) ?
                      reg55 : $signed($signed(reg46)))) ?
              ((~|(~|(8'hb6))) ?
                  ($signed($unsigned(reg48)) ?
                      reg47[(1'h1):(1'h1)] : reg57) : (($unsigned((8'h9e)) ?
                      $unsigned(wire80) : {wire112,
                          (7'h41)}) ^~ (~^$unsigned(reg57)))) : (|$signed(wire40[(3'h7):(3'h6)])));
          reg116 <= {$unsigned((!((wire76 <= reg48) ?
                  {wire112, wire44} : (~^(8'hb9))))),
              (wire78[(1'h1):(1'h1)] ?
                  reg114[(5'h11):(4'hf)] : $unsigned((^$unsigned(reg114))))};
          reg117 <= {(~^$signed($unsigned($signed(reg51)))),
              $signed($unsigned(reg48))};
          if (reg54)
            begin
              reg118 <= (((reg56 ?
                      (reg54 ? reg56 : wire37) : {{reg51},
                          wire35[(3'h6):(1'h1)]}) >> $signed(($signed(wire39) && (reg49 <<< wire79)))) ?
                  $signed(reg45) : reg46);
            end
          else
            begin
              reg118 <= (~&(8'haf));
            end
        end
      reg119 <= $signed((^~{wire44}));
      reg120 <= (~^{$unsigned($unsigned($signed(reg116)))});
      reg121 <= (({($unsigned((8'hbb)) ~^ (!wire76))} ? reg49 : reg46) ?
          reg51 : {(|$unsigned((|reg120)))});
    end
  assign wire122 = (~^$unsigned(($signed(reg118[(1'h1):(1'h1)]) | $unsigned($signed(reg50)))));
  assign wire123 = (&(~(~&$unsigned($signed(reg120)))));
  assign wire124 = $unsigned(reg45);
  assign wire125 = $unsigned((reg57[(2'h3):(1'h0)] ?
                       reg56[(4'h9):(4'h9)] : {$signed($signed((8'hb6))),
                           reg41}));
  assign wire126 = {(~$signed($signed((-wire40)))), reg116};
  assign wire127 = (~$unsigned($signed($signed((+wire124)))));
  assign wire128 = (~|$signed((|$signed({(7'h43)}))));
  assign wire129 = $unsigned((~(wire112[(3'h4):(1'h0)] > ((~|reg48) ?
                       (wire39 || reg114) : (+(8'ha7))))));
  always
    @(posedge clk) begin
      reg130 <= ($signed($signed({{reg41, reg115},
              (wire126 ? wire76 : wire110)})) ?
          $unsigned(((!wire44[(2'h2):(1'h0)]) << ($unsigned(wire36) ?
              reg42 : $unsigned(wire112)))) : ({$unsigned((&wire110)),
              {{reg42}}} != $unsigned(wire125)));
    end
endmodule

module module81  (y, clk, wire85, wire84, wire83, wire82);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire85;
  input wire signed [(4'hd):(1'h0)] wire84;
  input wire signed [(3'h7):(1'h0)] wire83;
  input wire signed [(4'hb):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire109;
  wire signed [(3'h4):(1'h0)] wire108;
  wire signed [(4'hd):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire86;
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire103,
                 wire94,
                 wire93,
                 wire86,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire86 = ($unsigned($signed(wire85[(1'h1):(1'h1)])) >= wire82[(3'h6):(1'h0)]);
  always
    @(posedge clk) begin
      reg87 <= (8'hac);
      reg88 <= wire82[(3'h4):(3'h4)];
      reg89 <= wire84;
    end
  always
    @(posedge clk) begin
      reg90 <= wire83[(2'h3):(2'h2)];
      reg91 <= $unsigned({((reg87 ?
              $unsigned(reg87) : $signed(reg90)) << $signed((wire83 ?
              reg87 : wire86)))});
      reg92 <= wire86;
    end
  assign wire93 = reg89;
  assign wire94 = wire82[(4'ha):(4'h9)];
  always
    @(posedge clk) begin
      if ((($signed($unsigned(reg92)) ^ $unsigned((-(wire86 ?
          wire85 : wire84)))) << ((&$signed($signed(wire93))) * $unsigned(((^~reg90) ?
          {reg91, wire93} : $signed((8'ha7)))))))
        begin
          reg95 <= ($signed(($signed({reg87, reg87}) ?
              (^~(wire86 ?
                  (8'hb7) : reg91)) : $unsigned($unsigned((8'haf))))) ^~ (+reg89[(1'h1):(1'h1)]));
          reg96 <= {(($unsigned(wire85) ^~ $unsigned(reg95[(1'h1):(1'h1)])) * $signed(((~^wire82) >= {wire93})))};
        end
      else
        begin
          reg95 <= wire94[(5'h10):(2'h2)];
          reg96 <= (8'hb9);
          reg97 <= wire86[(5'h11):(5'h10)];
          reg98 <= reg88[(1'h1):(1'h1)];
          reg99 <= (~&reg95);
        end
      reg100 <= reg99;
      reg101 <= (~|(!$signed({(~&reg97)})));
      reg102 <= ((~&(wire82 & reg101[(3'h5):(1'h0)])) == (~|$unsigned($unsigned(wire83[(1'h0):(1'h0)]))));
    end
  assign wire103 = $signed(reg95);
  always
    @(posedge clk) begin
      reg104 <= $unsigned(wire82[(2'h3):(2'h2)]);
      reg105 <= $signed(($unsigned(reg91[(1'h0):(1'h0)]) ? reg88 : wire93));
      reg106 <= $signed(wire83);
      reg107 <= (wire84[(1'h1):(1'h1)] >>> $signed(wire86));
    end
  assign wire108 = ((-reg98[(1'h1):(1'h1)]) ^~ $unsigned(($unsigned($signed(wire83)) <= {reg87,
                       (reg107 ? (8'hb7) : reg106)})));
  assign wire109 = ((|$unsigned((^~$signed(reg106)))) ?
                       (reg100 ?
                           $signed((reg102[(3'h5):(2'h2)] ^ (reg106 ?
                               reg91 : reg99))) : ({((8'ha8) >= (8'ha9))} & reg101)) : reg107[(4'ha):(4'h9)]);
endmodule

module module59
#(parameter param75 = ((&((((8'hb1) & (8'hb7)) ? ((7'h41) ? (8'haa) : (7'h40)) : (+(8'hae))) >> {((8'hbc) < (8'ha4))})) <<< (-(&({(7'h43)} ? (^~(8'ha3)) : ((8'h9f) ? (8'had) : (8'haa)))))))
(y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire64;
  input wire signed [(3'h5):(1'h0)] wire63;
  input wire signed [(4'hf):(1'h0)] wire62;
  input wire [(3'h5):(1'h0)] wire61;
  input wire signed [(4'hc):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire74;
  wire [(2'h2):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire65;
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 (1'h0)};
  assign wire65 = $unsigned($unsigned(wire64));
  assign wire66 = (&$unsigned($unsigned(((wire63 && wire62) ?
                      $signed(wire63) : $signed(wire65)))));
  assign wire67 = $signed((wire65[(2'h2):(1'h0)] ?
                      (wire61 ^ (wire64[(3'h7):(1'h1)] & (7'h41))) : {((wire64 < wire64) ?
                              wire61 : $unsigned(wire66)),
                          wire65}));
  assign wire68 = $signed(wire62);
  assign wire69 = $unsigned((wire60[(4'h9):(3'h7)] ?
                      $unsigned((~(wire64 ?
                          wire65 : (8'ha1)))) : (($unsigned(wire65) == (wire61 >= wire62)) <<< $unsigned($unsigned(wire65)))));
  assign wire70 = (wire62[(4'he):(2'h2)] ^~ ($signed(wire62) ?
                      {$unsigned((wire61 ? wire65 : (8'ha0))),
                          $unsigned($unsigned(wire63))} : ($signed(wire68) ?
                          wire67[(3'h6):(1'h0)] : ((wire61 << (8'ha3)) ?
                              {wire62} : $signed(wire62)))));
  assign wire71 = wire69;
  assign wire72 = $signed((^wire68[(1'h1):(1'h1)]));
  assign wire73 = {$unsigned((wire61 ^ $signed((wire68 ? wire60 : wire65))))};
  assign wire74 = wire66;
endmodule

module module164
#(parameter param187 = ((&{((~|(7'h44)) * ((8'h9c) || (7'h44))), (((8'hbb) ? (8'h9e) : (8'hbd)) != (|(8'h9d)))}) ? (~(!{(~(8'hb7)), ((8'had) | (8'ha2))})) : (!(!((8'hb8) ~^ {(8'hb5), (8'ha1)})))), 
parameter param188 = (param187 >>> (~&param187)))
(y, clk, wire168, wire167, wire166, wire165);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire168;
  input wire signed [(5'h10):(1'h0)] wire167;
  input wire signed [(4'hf):(1'h0)] wire166;
  input wire signed [(5'h15):(1'h0)] wire165;
  wire signed [(2'h2):(1'h0)] wire186;
  wire [(5'h15):(1'h0)] wire185;
  wire signed [(4'he):(1'h0)] wire184;
  wire [(4'h8):(1'h0)] wire178;
  wire signed [(5'h10):(1'h0)] wire177;
  wire [(4'hb):(1'h0)] wire176;
  wire signed [(5'h14):(1'h0)] wire175;
  wire signed [(5'h13):(1'h0)] wire174;
  wire signed [(3'h5):(1'h0)] wire173;
  wire [(2'h2):(1'h0)] wire172;
  wire [(2'h3):(1'h0)] wire171;
  wire signed [(5'h12):(1'h0)] wire170;
  wire signed [(5'h15):(1'h0)] wire169;
  reg signed [(5'h14):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg181 = (1'h0);
  reg [(2'h2):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg179 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 (1'h0)};
  assign wire169 = $unsigned(wire167[(2'h3):(1'h1)]);
  assign wire170 = ((~&({wire169[(3'h5):(3'h5)], (wire167 * wire167)} ?
                           (wire165 ?
                               (7'h42) : (wire165 ?
                                   wire167 : wire167)) : wire168)) ?
                       ((~&$unsigned(wire168[(3'h6):(3'h4)])) ?
                           $signed(wire166[(3'h5):(1'h1)]) : wire169[(2'h2):(1'h1)]) : wire169[(3'h6):(3'h4)]);
  assign wire171 = ({wire165[(4'ha):(3'h4)]} && ({wire165[(1'h1):(1'h1)]} < ({(wire165 ^ wire167)} == (^(wire165 ?
                       wire170 : wire169)))));
  assign wire172 = (~$signed($signed(((&wire171) ?
                       $unsigned(wire171) : wire166))));
  assign wire173 = $signed($unsigned(((~wire171) ?
                       (~wire169[(5'h11):(3'h6)]) : $unsigned($signed(wire172)))));
  assign wire174 = (($signed((wire167[(4'hd):(4'h8)] ?
                               wire166[(2'h3):(1'h1)] : (wire171 ?
                                   (8'hbc) : (7'h41)))) ?
                           wire170[(4'h8):(3'h7)] : wire168) ?
                       (($signed(wire168[(3'h5):(3'h4)]) * (~&wire168)) ?
                           wire169 : (+((wire167 ?
                               wire169 : wire167) & (wire165 ?
                               (8'hab) : wire165)))) : $unsigned(wire168));
  assign wire175 = (8'hac);
  assign wire176 = (wire167[(4'hf):(1'h0)] ?
                       (!{((wire169 ? wire166 : wire168) ~^ $signed(wire167)),
                           $unsigned((8'h9f))}) : $unsigned({wire174}));
  assign wire177 = ((+(((wire169 >= wire166) ? wire168 : $unsigned(wire176)) ?
                       $unsigned(wire173) : $unsigned((wire172 || wire165)))) ~^ $signed(wire168));
  assign wire178 = (wire169[(5'h12):(4'hd)] ?
                       $unsigned($unsigned(({wire165,
                           wire173} <= wire168[(3'h6):(2'h3)]))) : (~^(8'ha5)));
  always
    @(posedge clk) begin
      reg179 <= (wire173[(3'h4):(1'h1)] ?
          ({$signed($signed((8'ha2)))} >= wire173[(2'h3):(1'h0)]) : $signed((wire168 ?
              (wire172 ^ $unsigned(wire171)) : {wire178[(1'h0):(1'h0)]})));
      reg180 <= $signed(wire177);
      reg181 <= $unsigned($unsigned((~|((wire174 << wire175) ?
          (^~wire170) : $signed(wire178)))));
      reg182 <= $unsigned($signed(wire178[(2'h2):(2'h2)]));
      reg183 <= {wire178[(4'h8):(2'h2)]};
    end
  assign wire184 = (8'haf);
  assign wire185 = ($unsigned((((|wire172) & (reg181 ?
                           (8'hbc) : wire165)) >>> ((~&wire170) * wire176))) ?
                       wire172 : ($unsigned($unsigned(wire165[(4'hb):(3'h5)])) ?
                           wire165[(4'he):(4'hd)] : (wire176[(1'h1):(1'h1)] * (-wire166))));
  assign wire186 = ({wire176, (wire172 ^ (~|(^~wire175)))} ?
                       {($unsigned($signed(wire178)) ? reg179 : wire185),
                           $signed((8'ha7))} : reg183[(4'hc):(4'hc)]);
endmodule
