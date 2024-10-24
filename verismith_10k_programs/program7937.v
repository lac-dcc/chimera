module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h20d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire184;
  wire [(5'h10):(1'h0)] wire183;
  wire [(4'h8):(1'h0)] wire181;
  wire signed [(4'ha):(1'h0)] wire180;
  wire [(3'h4):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire136;
  wire [(4'hb):(1'h0)] wire137;
  wire [(4'hc):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire139;
  wire signed [(5'h13):(1'h0)] wire178;
  reg [(5'h11):(1'h0)] reg182 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  assign y = {wire184,
                 wire183,
                 wire181,
                 wire180,
                 wire133,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire18,
                 wire6,
                 wire5,
                 wire4,
                 wire135,
                 wire136,
                 wire137,
                 wire138,
                 wire139,
                 wire178,
                 reg182,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 (1'h0)};
  assign wire4 = $unsigned(($signed(wire2[(3'h5):(2'h2)]) + $unsigned($unsigned(wire1))));
  assign wire5 = (^~(8'hb2));
  assign wire6 = wire4;
  always
    @(posedge clk) begin
      reg7 <= {(&wire0),
          (((|(7'h42)) == $signed($unsigned(wire6))) ?
              $signed($unsigned(wire3)) : (~|($signed(wire6) + wire4[(4'hd):(3'h5)])))};
      if ($unsigned($unsigned((-$unsigned($signed(reg7))))))
        begin
          if (wire6)
            begin
              reg8 <= (8'hb0);
              reg9 <= wire2;
              reg10 <= wire4;
              reg11 <= wire0;
            end
          else
            begin
              reg8 <= $unsigned(((!{$unsigned(wire2)}) + (&$signed(reg8))));
              reg9 <= (wire0 && (~^$signed($signed((wire1 ? wire3 : reg11)))));
            end
          if (((((|$unsigned(wire6)) << $signed($unsigned(wire1))) ?
                  (8'hb3) : reg9[(3'h4):(3'h4)]) ?
              $signed(reg8) : wire6))
            begin
              reg12 <= $signed(($unsigned(wire1) - ((~^$signed(wire4)) ?
                  wire2 : ($signed(reg10) ? ((8'hb8) && wire5) : reg9))));
              reg13 <= (reg11[(1'h0):(1'h0)] ?
                  $signed({$unsigned($unsigned(reg9)),
                      {{wire1}, wire6[(2'h3):(2'h3)]}}) : wire0[(3'h4):(1'h1)]);
              reg14 <= wire6[(1'h1):(1'h1)];
              reg15 <= $signed($unsigned({$unsigned($unsigned((8'h9d))),
                  ($signed(wire1) ? {wire0, reg14} : (reg8 ? reg12 : reg13))}));
              reg16 <= ((~|$unsigned(reg8)) ?
                  $unsigned((8'hb3)) : $unsigned($unsigned($signed((-reg14)))));
            end
          else
            begin
              reg12 <= wire5[(2'h2):(1'h0)];
              reg13 <= (((^$signed((wire1 ^ (8'hb7)))) >>> $unsigned({reg9,
                  $signed(reg14)})) <= {wire0[(2'h2):(2'h2)],
                  $unsigned(($signed(reg14) ?
                      $unsigned(reg12) : (reg15 ? wire0 : wire1)))});
            end
          reg17 <= {($signed((~^{wire1, wire6})) >>> reg16[(4'hc):(3'h6)]),
              wire0};
        end
      else
        begin
          reg8 <= $unsigned(reg13[(4'ha):(1'h0)]);
        end
    end
  assign wire18 = wire6;
  always
    @(posedge clk) begin
      if (reg14)
        begin
          reg19 <= (wire4 ? reg12[(3'h5):(3'h5)] : reg8[(4'hb):(1'h0)]);
        end
      else
        begin
          reg19 <= reg16;
          if ((!$unsigned($signed((+wire4)))))
            begin
              reg20 <= ({(wire3 ?
                          ($signed(reg14) ?
                              $unsigned(reg12) : $unsigned(reg9)) : (reg15 ?
                              reg10[(3'h7):(3'h5)] : wire18[(3'h7):(3'h4)])),
                      (((~^wire0) ? (&wire5) : (~^(8'ha8))) ?
                          reg9 : (wire3[(3'h5):(1'h0)] ?
                              ((7'h43) + wire5) : wire4[(4'h9):(3'h6)]))} ?
                  ($unsigned({wire0,
                      (reg10 ? reg15 : reg12)}) | reg11) : $unsigned(wire18));
              reg21 <= reg17[(2'h2):(2'h2)];
            end
          else
            begin
              reg20 <= $signed({$unsigned((8'haa)),
                  (($signed(wire6) << wire5[(1'h1):(1'h1)]) ?
                      (8'haf) : reg20[(1'h0):(1'h0)])});
              reg21 <= $signed({(reg15[(3'h6):(1'h1)] ?
                      (reg8 ? (&wire3) : $signed((8'hba))) : reg21)});
              reg22 <= (((~&((wire2 ?
                  reg11 : reg16) >> $unsigned(reg15))) >>> reg20) && ($signed(($signed(wire4) > (wire1 <= wire4))) || $signed($signed((reg13 >> (7'h43))))));
            end
          reg23 <= (((~&wire2[(3'h4):(2'h2)]) ?
                  $unsigned(($unsigned(wire18) ~^ {reg17, reg11})) : (8'hae)) ?
              (reg21[(1'h1):(1'h1)] ?
                  reg19 : $signed(wire6[(4'he):(4'h8)])) : $unsigned(reg15[(3'h6):(1'h1)]));
        end
      reg24 <= $unsigned($signed($unsigned({$unsigned((8'ha3)),
          (wire3 ? wire0 : reg21)})));
      if ($signed($unsigned(({wire3[(3'h5):(1'h0)], (!wire18)} == ((^(8'h9f)) ?
          $signed((8'hac)) : (wire6 ^ wire6))))))
        begin
          reg25 <= (^~$unsigned((((reg12 ^~ wire5) << reg7[(3'h6):(1'h0)]) ?
              (~&$signed(reg19)) : (~&$unsigned((8'hba))))));
          reg26 <= ((((wire2[(1'h0):(1'h0)] ?
                          $unsigned(reg21) : {reg21, reg21}) ?
                      (wire6[(4'he):(4'hd)] >> $signed(reg24)) : $signed((^~wire18))) ?
                  (wire5 ~^ $signed({reg17, reg21})) : {$signed((wire2 ?
                          reg8 : reg21))}) ?
              (reg10 <= (reg24 * wire3)) : (wire4[(3'h4):(2'h2)] ?
                  {(~^$signed(reg9))} : $signed(reg21[(2'h2):(1'h0)])));
          reg27 <= ($signed($unsigned(reg24)) >= reg19[(2'h3):(1'h0)]);
        end
      else
        begin
          if (((~^(((&reg15) ? (^~(7'h43)) : reg15[(3'h6):(1'h0)]) ?
              $unsigned((reg14 ?
                  wire5 : wire1)) : $signed($signed(reg10)))) || reg10))
            begin
              reg25 <= reg7;
              reg26 <= $signed((reg15[(1'h0):(1'h0)] ?
                  (^{$unsigned((8'hba))}) : $signed(reg27)));
              reg27 <= wire5;
              reg28 <= $unsigned({wire18[(4'h9):(4'h9)], {(8'hbb)}});
            end
          else
            begin
              reg25 <= reg27;
            end
        end
    end
  assign wire29 = (((reg27[(3'h6):(3'h5)] + reg26[(3'h5):(3'h4)]) ?
                      {$unsigned($signed(reg27))} : reg8) == (reg11 == wire2));
  assign wire30 = ((8'ha3) ?
                      (~|$unsigned((8'hae))) : $signed($unsigned($unsigned(reg8[(3'h5):(2'h3)]))));
  assign wire31 = (!wire18[(5'h15):(2'h3)]);
  assign wire32 = (~&reg12[(3'h6):(1'h1)]);
  assign wire33 = wire2[(4'ha):(2'h3)];
  module34 #() modinst134 (wire133, clk, wire6, wire5, wire3, reg20);
  assign wire135 = $unsigned({$unsigned({(reg23 <<< (7'h44)), (&wire32)})});
  assign wire136 = (reg9[(2'h3):(1'h0)] || $unsigned(reg19));
  assign wire137 = $unsigned(reg11);
  assign wire138 = wire32[(1'h0):(1'h0)];
  assign wire139 = reg11[(2'h2):(1'h0)];
  module140 #() modinst179 (.wire143(wire30), .wire144(reg16), .wire142(reg9), .clk(clk), .y(wire178), .wire141(reg21), .wire145(reg12));
  assign wire180 = $signed(wire138[(1'h1):(1'h1)]);
  assign wire181 = ($signed((^~(reg11[(1'h1):(1'h1)] >> (reg25 ?
                           wire30 : wire139)))) ?
                       ($unsigned(((wire2 ? wire3 : wire180) ?
                               wire30 : $unsigned(wire30))) ?
                           (8'h9c) : (|{$unsigned(wire4),
                               reg26[(3'h5):(2'h3)]})) : $unsigned($signed(((reg17 ^ (8'ha2)) ^ reg28))));
  always
    @(posedge clk) begin
      reg182 <= ((|$signed(reg10)) ?
          (~|({reg19, $signed(reg25)} ?
              $signed($signed(reg27)) : ((wire6 >= wire0) ?
                  (wire31 >> reg22) : $unsigned(wire181)))) : reg17[(3'h6):(3'h6)]);
    end
  assign wire183 = (|(8'haa));
  assign wire184 = (^~{$unsigned($signed(wire2[(3'h7):(3'h7)]))});
endmodule

module module140  (y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire145;
  input wire signed [(4'hc):(1'h0)] wire144;
  input wire signed [(2'h2):(1'h0)] wire143;
  input wire signed [(4'hc):(1'h0)] wire142;
  input wire [(5'h15):(1'h0)] wire141;
  wire signed [(4'h9):(1'h0)] wire177;
  wire signed [(4'h9):(1'h0)] wire176;
  wire [(4'hf):(1'h0)] wire162;
  wire [(5'h12):(1'h0)] wire146;
  reg signed [(4'he):(1'h0)] reg175 = (1'h0);
  reg [(4'hd):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg173 = (1'h0);
  reg [(5'h15):(1'h0)] reg172 = (1'h0);
  reg [(4'hb):(1'h0)] reg171 = (1'h0);
  reg [(5'h10):(1'h0)] reg170 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg169 = (1'h0);
  reg [(3'h7):(1'h0)] reg168 = (1'h0);
  reg [(5'h14):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg166 = (1'h0);
  reg [(4'hd):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg163 = (1'h0);
  reg [(5'h13):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg160 = (1'h0);
  reg [(4'hd):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg156 = (1'h0);
  reg [(2'h2):(1'h0)] reg155 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire162,
                 wire146,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
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
                 reg147,
                 (1'h0)};
  assign wire146 = $unsigned((8'ha4));
  always
    @(posedge clk) begin
      reg147 <= $signed($signed($unsigned($signed((wire142 & (8'hbf))))));
      reg148 <= ((!wire145) ?
          wire142[(3'h4):(2'h2)] : $signed((($signed(wire144) * $unsigned(wire146)) & ((~^wire146) != $unsigned(wire146)))));
      if ((-$signed($signed(($unsigned(reg147) ?
          (|(8'h9c)) : {reg147, reg147})))))
        begin
          reg149 <= ({(~|{$signed(wire146), $signed(wire144)})} ?
              (wire146[(3'h5):(3'h4)] && $unsigned(wire141[(3'h6):(2'h2)])) : $unsigned($signed(($unsigned((8'ha1)) ?
                  (7'h44) : $signed(wire146)))));
          if ({($unsigned({wire142[(2'h3):(2'h3)]}) ?
                  reg148[(2'h3):(1'h1)] : $unsigned($unsigned(wire142[(2'h3):(1'h1)]))),
              (({(8'h9c), wire142} ?
                  $unsigned($unsigned(wire146)) : $unsigned($signed(wire141))) != ($unsigned(wire142[(4'hb):(1'h0)]) ?
                  (^{wire142, wire146}) : (((8'ha4) ? (8'ha1) : wire141) ?
                      $signed(wire146) : wire142)))})
            begin
              reg150 <= $signed($unsigned({wire146[(1'h0):(1'h0)]}));
              reg151 <= $unsigned(($signed((!{reg147, (8'ha6)})) & wire146));
              reg152 <= wire146[(4'h8):(2'h3)];
              reg153 <= $unsigned((&((&reg152[(4'hb):(3'h5)]) <= {$signed(reg147),
                  wire144})));
            end
          else
            begin
              reg150 <= reg152;
              reg151 <= (($unsigned(((reg147 - reg151) ?
                      (^(8'hb9)) : (wire143 ? wire141 : reg149))) << (8'haa)) ?
                  (~|$unsigned($signed((&wire144)))) : (^~reg153[(2'h2):(1'h1)]));
              reg152 <= $signed($signed(reg151[(3'h4):(3'h4)]));
            end
          reg154 <= ((reg152 ?
                  (((reg153 ? wire142 : (8'h9c)) && (reg153 ?
                          wire142 : wire143)) ?
                      (wire141 ?
                          (~|reg147) : $unsigned(reg150)) : wire141) : reg149[(3'h4):(1'h0)]) ?
              {((-(wire142 || reg152)) <= $unsigned((reg153 || reg153))),
                  $unsigned((-(reg149 >>> reg150)))} : ($unsigned($signed($unsigned(wire146))) > (reg152 ?
                  $unsigned((wire145 < wire146)) : ($unsigned((8'hb4)) ?
                      ((8'hbb) ? wire143 : reg147) : $signed(reg151)))));
          reg155 <= wire146;
          reg156 <= {$signed({wire142})};
        end
      else
        begin
          reg149 <= (|reg148[(1'h1):(1'h0)]);
          reg150 <= $unsigned(reg152);
        end
      if ({reg152})
        begin
          reg157 <= $signed({reg152,
              {(+$unsigned(reg151)), $unsigned((~wire142))}});
          reg158 <= (8'h9f);
          reg159 <= $unsigned(wire142[(4'hc):(4'hc)]);
          reg160 <= (8'ha6);
          reg161 <= (8'h9c);
        end
      else
        begin
          reg157 <= wire145[(3'h6):(2'h3)];
          reg158 <= $signed((-($signed((reg149 >>> reg148)) ?
              $unsigned(wire145) : $unsigned((^reg156)))));
          reg159 <= $unsigned($unsigned(wire141[(1'h0):(1'h0)]));
          reg160 <= $unsigned(reg154);
        end
    end
  assign wire162 = $signed((~|$signed((^reg151[(3'h6):(1'h0)]))));
  always
    @(posedge clk) begin
      reg163 <= wire144[(4'hc):(1'h1)];
      reg164 <= wire144;
      reg165 <= (^({(8'hb4)} ?
          $signed(($unsigned((8'ha9)) ?
              $signed(reg155) : wire142)) : {reg155[(1'h0):(1'h0)]}));
      reg166 <= $unsigned((($signed((reg152 ? reg151 : (8'h9f))) ?
              reg160 : ($signed(reg148) <= $unsigned((8'hb5)))) ?
          wire146 : $signed(($signed(reg154) ?
              (wire143 >>> wire141) : ((8'ha4) <<< wire141)))));
    end
  always
    @(posedge clk) begin
      if (reg159)
        begin
          reg167 <= (~reg152[(3'h5):(1'h1)]);
          if ($signed((reg166[(5'h14):(4'hb)] && $signed($signed(reg155[(1'h1):(1'h0)])))))
            begin
              reg168 <= {{(~^reg163),
                      (((reg153 & reg152) || (8'hbf)) >> ((reg164 ?
                              reg149 : reg150) ?
                          (8'hbd) : (^reg156)))}};
              reg169 <= (({$signed(reg161[(1'h1):(1'h1)]),
                  (7'h40)} ^ reg155[(1'h1):(1'h0)]) >>> ($signed((~$unsigned(wire141))) * reg164[(1'h1):(1'h0)]));
              reg170 <= reg169[(2'h3):(2'h3)];
              reg171 <= (~&$signed((((~|wire162) ? reg165 : {reg148, reg151}) ?
                  (!(wire146 ?
                      wire142 : reg163)) : $signed($unsigned(wire162)))));
              reg172 <= reg147;
            end
          else
            begin
              reg168 <= {(((~$signed((8'hb0))) ?
                          reg158[(4'hc):(2'h2)] : (~&(!reg170))) ?
                      $signed((reg148[(3'h4):(3'h4)] == $signed(reg168))) : $signed(reg153[(3'h4):(1'h0)])),
                  $unsigned($signed(reg159))};
              reg169 <= $signed((^{(|(reg171 >= reg166)),
                  $unsigned(wire145[(3'h6):(3'h4)])}));
              reg170 <= (wire141[(3'h5):(3'h5)] ?
                  (reg147 ?
                      ($unsigned(reg166) ?
                          (|$signed(reg161)) : $unsigned((8'haa))) : $signed(((~reg170) * (reg167 ?
                          wire146 : reg154)))) : $unsigned((($signed(reg157) ?
                      (~reg165) : $unsigned((8'ha7))) ^ (-reg160))));
              reg171 <= $unsigned((|(8'hb3)));
            end
          reg173 <= $unsigned($signed($unsigned(((reg166 ?
              reg172 : reg170) ^~ (^~(8'ha4))))));
          reg174 <= ((reg166 == wire141) ?
              ((reg152[(5'h11):(1'h1)] ?
                      $unsigned($unsigned(wire162)) : (reg153[(2'h2):(1'h1)] ?
                          $signed(reg153) : {reg171, (7'h41)})) ?
                  (((reg164 <<< reg164) ?
                          (reg168 ? reg170 : reg163) : $signed((8'hb8))) ?
                      reg164[(2'h2):(1'h0)] : ((wire146 ? (8'ha2) : reg167) ?
                          {(8'hae)} : (8'h9e))) : reg156) : wire141[(5'h10):(3'h4)]);
          reg175 <= reg156;
        end
      else
        begin
          if (($unsigned({($signed((7'h43)) ?
                  (wire144 ? reg169 : (8'hbf)) : $signed(reg175)),
              (8'hb9)}) ^~ {reg166}))
            begin
              reg167 <= {$unsigned(((reg166[(5'h13):(2'h3)] - (reg170 >>> reg148)) ?
                      (~^wire142) : ($unsigned(reg153) >>> (reg153 + (7'h44))))),
                  reg149};
            end
          else
            begin
              reg167 <= reg174[(4'hb):(4'ha)];
            end
          reg168 <= (reg157 ?
              $unsigned(((!reg167[(4'h9):(1'h0)]) ?
                  ((|reg167) ? reg147 : $signed(reg160)) : $signed((reg175 ?
                      reg153 : reg153)))) : reg165);
          reg169 <= ({(wire143[(2'h2):(1'h1)] ?
                      $unsigned({reg165}) : (((7'h42) <= reg152) ?
                          $signed(reg159) : $signed(reg163))),
                  ($unsigned((+(8'ha8))) < {(wire142 ^~ reg172),
                      (wire146 <<< reg165)})} ?
              wire141 : ((~({(7'h42)} ?
                  $signed(reg173) : reg153)) ^~ ((+((8'hb2) ?
                  reg161 : (8'had))) <= $unsigned(reg161[(4'hd):(3'h4)]))));
          reg170 <= ((8'h9c) ? reg173[(2'h3):(2'h2)] : ((8'haa) | (8'hab)));
        end
    end
  assign wire176 = ($unsigned((({reg157} ?
                               (reg171 + (8'hbb)) : (reg168 < (8'ha8))) ?
                           ((wire145 ? reg171 : reg149) ?
                               reg156[(1'h0):(1'h0)] : $unsigned((8'ha5))) : $unsigned((+(8'hb9))))) ?
                       reg172[(2'h3):(2'h2)] : $unsigned((^~reg174)));
  assign wire177 = (~{({$signed(reg150),
                           reg164[(1'h1):(1'h1)]} & reg173[(4'hf):(4'hf)]),
                       {reg164}});
endmodule

module module34
#(parameter param131 = (+(((&((7'h41) ? (7'h40) : (8'ha3))) - ({(7'h43), (8'h9f)} ? ((8'hae) < (8'hbd)) : ((8'had) ? (8'hba) : (8'hbc)))) ? {(8'ha8)} : ({((8'ha9) ~^ (7'h44)), ((8'h9e) ? (8'hbd) : (8'ha3))} >>> ({(8'hbc)} ? ((8'hb9) - (8'hbf)) : ((8'hb0) < (8'hb9)))))), 
parameter param132 = (((8'ha4) ? (8'hbe) : (((-param131) ? (~param131) : param131) == (8'hb6))) ^~ {(({param131} ? (^(8'ha2)) : (~|param131)) ^~ (param131 ? {param131, (8'hbf)} : (!param131))), ((+(param131 ? param131 : param131)) ? param131 : {(param131 >>> param131)})}))
(y, clk, wire35, wire36, wire37, wire38);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire35;
  input wire signed [(5'h11):(1'h0)] wire36;
  input wire signed [(4'ha):(1'h0)] wire37;
  input wire signed [(3'h6):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire77;
  wire [(3'h6):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire128;
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  assign y = {wire130,
                 wire39,
                 wire60,
                 wire77,
                 wire79,
                 wire80,
                 wire81,
                 wire83,
                 wire84,
                 wire85,
                 wire128,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
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
                 reg58,
                 reg59,
                 reg82,
                 (1'h0)};
  assign wire39 = $signed($signed(wire37[(4'h8):(3'h5)]));
  always
    @(posedge clk) begin
      reg40 <= (!({(+{wire36, wire39}),
              (wire38 ? (^~(8'hac)) : wire39[(2'h3):(1'h0)])} ?
          $unsigned(wire37[(3'h7):(1'h0)]) : wire36[(5'h10):(4'hb)]));
      if ({($signed(($unsigned(wire35) ~^ (wire39 ?
              reg40 : wire39))) <= (reg40 != $unsigned((reg40 ?
              reg40 : wire39)))),
          $unsigned(({{wire36, reg40}, $signed((8'ha1))} ?
              $signed((^reg40)) : (((8'had) ?
                  wire35 : reg40) >> ((8'hb4) - wire36))))})
        begin
          reg41 <= (8'hb0);
          reg42 <= {({((reg41 ? wire35 : (7'h43)) ?
                      $unsigned(wire39) : wire36[(4'hd):(3'h6)])} << $signed(((+wire36) ?
                  (wire36 ? wire36 : wire36) : $unsigned(reg40))))};
          reg43 <= (-{reg40[(4'h8):(2'h2)], (8'ha1)});
          reg44 <= (^~$unsigned((^~$unsigned($unsigned((8'ha2))))));
          if ($signed((reg42 ?
              {($unsigned((8'ha4)) ?
                      (8'hb1) : reg43[(3'h5):(1'h1)])} : (8'hb0))))
            begin
              reg45 <= reg44[(5'h11):(3'h4)];
              reg46 <= $signed((((~^wire36[(3'h5):(3'h5)]) ?
                      reg41[(1'h1):(1'h1)] : (^~(reg41 < reg41))) ?
                  (((reg43 ?
                      reg41 : reg42) - (8'ha5)) * reg45) : $signed($signed((+wire36)))));
            end
          else
            begin
              reg45 <= wire38[(3'h5):(3'h4)];
              reg46 <= $unsigned($unsigned(((reg42 > {wire37}) != {$unsigned(wire36)})));
              reg47 <= $signed((~&$signed((~(wire37 ? reg41 : (8'hab))))));
              reg48 <= (8'ha9);
            end
        end
      else
        begin
          reg41 <= (&reg43[(3'h5):(1'h1)]);
          reg42 <= $unsigned(($unsigned(((reg44 ? reg45 : wire39) ?
                  (reg40 ? (7'h43) : reg40) : {reg41})) ?
              (~|wire38) : ({$unsigned(wire35)} || reg43[(1'h1):(1'h0)])));
          if (((({reg46, (reg46 ? (8'hae) : reg43)} ?
                  reg46[(4'hb):(3'h7)] : wire35[(4'hb):(1'h1)]) == (((reg47 ?
                          (8'ha5) : wire38) ?
                      (^~reg43) : (reg46 != reg46)) ?
                  (|(-(7'h43))) : {(wire36 > reg46)})) ?
              $unsigned(wire36) : $unsigned((reg41 ^ $signed({reg40})))))
            begin
              reg43 <= {wire36[(4'ha):(3'h4)],
                  $signed(({(reg40 && reg41), $unsigned(reg47)} ?
                      reg41 : wire36[(1'h0):(1'h0)]))};
            end
          else
            begin
              reg43 <= $signed(reg46[(3'h5):(1'h1)]);
            end
        end
    end
  always
    @(posedge clk) begin
      reg49 <= (~|({reg41,
              ((reg46 ? (8'hb6) : (8'hb0)) == (wire39 ? wire39 : (8'hba)))} ?
          (reg48[(4'hc):(3'h7)] <<< $signed(reg44)) : (!(8'hac))));
      reg50 <= (reg42 ?
          ($unsigned($signed((|(8'hb1)))) >= $unsigned($unsigned((reg43 | reg44)))) : {($unsigned((!(8'ha2))) > $signed(((8'hbb) ?
                  reg44 : reg44)))});
      reg51 <= (8'hac);
      if ((reg40[(5'h11):(4'he)] ?
          {(^~$signed({reg50, reg43}))} : (~|(+((reg47 ?
              reg42 : wire35) + (wire35 ? reg50 : reg47))))))
        begin
          reg52 <= reg49[(3'h4):(3'h4)];
          reg53 <= (~&((8'h9d) || ((reg49 ~^ $unsigned(reg40)) ^ $signed((+wire39)))));
          reg54 <= $signed($signed(wire36[(4'hb):(4'h8)]));
          reg55 <= reg46[(2'h2):(1'h1)];
          if ((wire35 ?
              reg41 : $unsigned($unsigned($signed((reg52 ? reg54 : reg47))))))
            begin
              reg56 <= $signed(reg45[(3'h4):(2'h2)]);
              reg57 <= {reg42[(1'h1):(1'h1)],
                  (~$signed({(-(8'h9c)), $signed(reg56)}))};
            end
          else
            begin
              reg56 <= (~^wire39);
              reg57 <= (($unsigned((~(&reg42))) ?
                      {((reg43 != reg43) == reg52[(3'h7):(2'h2)]),
                          wire39} : $unsigned((-(~&reg46)))) ?
                  $signed((~&$unsigned((reg45 ?
                      reg51 : reg57)))) : $signed($unsigned(((|reg56) ?
                      reg52 : reg49[(3'h6):(2'h3)]))));
              reg58 <= $unsigned((~&$signed(((reg50 ? wire36 : reg47) ^ (reg41 ?
                  reg48 : wire39)))));
              reg59 <= {reg45[(3'h5):(2'h3)]};
            end
        end
      else
        begin
          if (reg54)
            begin
              reg52 <= $signed((-((-$signed(reg53)) ?
                  wire39 : $unsigned((|(8'hb2))))));
            end
          else
            begin
              reg52 <= (~&$signed($signed((~$unsigned(reg59)))));
              reg53 <= (+reg51);
              reg54 <= ($signed((8'h9d)) ?
                  reg56[(1'h1):(1'h0)] : reg43[(3'h4):(1'h0)]);
              reg55 <= reg42;
              reg56 <= $unsigned($signed(reg41));
            end
          reg57 <= reg59[(4'hc):(3'h4)];
        end
    end
  assign wire60 = $signed($signed($unsigned(reg43[(3'h4):(2'h3)])));
  module61 #() modinst78 (wire77, clk, reg58, reg49, reg42, reg55);
  assign wire79 = reg54[(2'h3):(2'h3)];
  assign wire80 = (reg43 ? $signed((7'h41)) : wire38);
  assign wire81 = (^~((({wire37, (7'h41)} ? reg49 : (8'hb9)) ?
                      {(wire38 <= reg58), {reg57, (8'hb1)}} : ((wire35 ?
                              reg55 : reg46) ?
                          (^reg56) : (^reg46))) <<< reg46));
  always
    @(posedge clk) begin
      reg82 <= $unsigned((wire81 == reg58));
    end
  assign wire83 = ((reg44 ?
                          ({reg49[(3'h4):(1'h1)]} ?
                              $signed((reg57 ~^ wire38)) : (^~{reg46})) : {{{wire80}},
                              (reg42 ? (|(8'h9e)) : (8'h9e))}) ?
                      reg50 : $signed($signed({$signed(reg57)})));
  assign wire84 = $unsigned((($unsigned($unsigned(wire83)) ?
                      $unsigned(reg53) : (!$unsigned((8'hb1)))) >= wire36));
  assign wire85 = (~$signed($unsigned((~|reg47))));
  module86 #() modinst129 (wire128, clk, reg40, wire77, reg54, reg82);
  assign wire130 = ({((reg43[(3'h5):(2'h3)] ?
                               $unsigned(wire60) : wire39[(5'h11):(3'h6)]) || reg52)} ?
                       (+wire128) : reg42[(4'he):(1'h0)]);
endmodule

module module86
#(parameter param126 = ((({{(8'hb6), (8'hbe)}, {(7'h44)}} == (&(~&(8'hb6)))) ? (!((^~(8'hb8)) ? {(7'h44), (8'hb3)} : (&(8'hb0)))) : {((~&(8'hb7)) || {(8'hae), (8'hb3)}), {((8'h9c) <= (8'haf))}}) ? {((|((8'h9d) == (8'hba))) - (((8'h9d) <<< (7'h42)) ? ((8'had) ? (7'h42) : (8'hb5)) : {(8'ha8)})), ((((8'ha9) | (8'hb4)) || ((8'hbb) ? (8'hae) : (8'hb6))) ? ((~|(8'hae)) ? ((8'ha6) >> (8'hae)) : ((8'had) ? (8'hb5) : (7'h44))) : (((8'h9d) ? (7'h43) : (8'ha6)) ? ((8'ha0) ? (8'hb6) : (8'haa)) : (^~(8'hb4))))} : ((^~(((8'h9f) >= (7'h40)) < (~^(8'h9f)))) ^~ (&(~^(~&(8'hba)))))), 
parameter param127 = (param126 ? (param126 ? ((~^(^param126)) > param126) : {((8'haf) ? (param126 ? param126 : param126) : ((8'hbc) >> param126))}) : param126))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire90;
  input wire [(4'ha):(1'h0)] wire89;
  input wire [(2'h3):(1'h0)] wire88;
  input wire signed [(2'h3):(1'h0)] wire87;
  wire signed [(4'h9):(1'h0)] wire121;
  wire [(3'h4):(1'h0)] wire120;
  wire [(5'h14):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire97;
  wire [(3'h6):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire91;
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire116,
                 wire97,
                 wire96,
                 wire95,
                 wire92,
                 wire91,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg118,
                 reg117,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire91 = (+wire88);
  assign wire92 = (wire89[(3'h6):(3'h4)] >> {$signed({(~^wire89),
                          $signed(wire87)}),
                      $signed($signed((~|wire88)))});
  always
    @(posedge clk) begin
      reg93 <= $unsigned(($signed((^~(wire89 < wire88))) ?
          $unsigned((8'ha3)) : wire90[(2'h2):(1'h1)]));
      reg94 <= $unsigned($unsigned(wire92[(2'h2):(1'h0)]));
    end
  assign wire95 = reg93[(1'h0):(1'h0)];
  assign wire96 = $unsigned($signed((&(^reg94))));
  assign wire97 = $signed({((7'h43) ?
                          ((reg93 ? wire89 : (7'h44)) ?
                              {wire90, wire91} : wire89) : (((8'hbe) ?
                                  wire87 : wire92) ?
                              wire89 : (wire87 & reg94)))});
  always
    @(posedge clk) begin
      reg98 <= $unsigned((~&(reg93 ^~ wire95)));
      if ((~$unsigned((((!wire91) - (^~wire87)) ?
          $signed((wire89 ? wire95 : wire91)) : $signed($unsigned((8'hb6)))))))
        begin
          reg99 <= ((~&reg93[(2'h3):(1'h0)]) <<< {(~(wire91 ?
                  (~^reg94) : reg94[(1'h1):(1'h0)]))});
          reg100 <= $unsigned(wire95);
          reg101 <= $signed($unsigned(wire95));
          reg102 <= (reg99[(1'h1):(1'h0)] ?
              $unsigned($signed((wire87[(2'h2):(1'h0)] != $unsigned(reg98)))) : $unsigned(wire88[(2'h3):(1'h1)]));
          if ((wire89 ?
              $signed($signed((reg100[(1'h0):(1'h0)] ?
                  {reg101, reg101} : $signed((7'h40))))) : reg101))
            begin
              reg103 <= (~|wire90[(1'h0):(1'h0)]);
              reg104 <= wire96[(1'h1):(1'h1)];
              reg105 <= $unsigned(reg93);
              reg106 <= $signed((reg99 - wire96[(3'h6):(3'h5)]));
            end
          else
            begin
              reg103 <= ((+{{wire96[(3'h5):(3'h5)]}}) ?
                  (^~$signed($signed(reg98))) : (+reg94[(1'h1):(1'h0)]));
              reg104 <= $unsigned(($unsigned((~^(|reg100))) <<< $unsigned(((8'hbc) >= (wire95 && wire96)))));
              reg105 <= (&reg93);
              reg106 <= $signed({wire95[(3'h6):(3'h5)],
                  ($unsigned((reg101 + wire96)) << (&$signed(reg101)))});
              reg107 <= $unsigned({wire92[(2'h3):(2'h2)]});
            end
        end
      else
        begin
          reg99 <= ($unsigned($signed(((reg107 ? wire92 : (8'hbd)) ?
              (wire95 && (7'h41)) : $signed((8'haf))))) != (+($unsigned($signed(reg105)) >>> reg102)));
        end
      reg108 <= {$unsigned($signed(reg94[(3'h4):(1'h0)])),
          (wire88 >> (|$unsigned(wire90)))};
      if ((($unsigned($signed((wire97 ? wire96 : (8'haf)))) ?
          (((+reg104) | (wire88 * wire89)) + wire95) : wire89) >= (~^reg100[(2'h2):(1'h1)])))
        begin
          if (reg108[(3'h4):(2'h2)])
            begin
              reg109 <= wire97;
            end
          else
            begin
              reg109 <= $unsigned(reg101[(4'hb):(1'h0)]);
              reg110 <= $unsigned($signed(($unsigned((&wire90)) ?
                  $signed({reg101}) : $signed($signed(reg103)))));
              reg111 <= (&reg103[(4'h9):(3'h5)]);
              reg112 <= $signed($signed(reg98[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          if ($unsigned((^$unsigned(reg112[(5'h11):(2'h2)]))))
            begin
              reg109 <= $unsigned(((~&{$unsigned(wire91)}) ?
                  reg102 : reg103[(4'ha):(4'h9)]));
              reg110 <= (~((&$unsigned((wire91 >= wire88))) ?
                  {$unsigned((wire92 >> wire95))} : (-$unsigned((wire87 ?
                      reg94 : reg100)))));
              reg111 <= {{{((~&wire95) && {reg110, reg94})}},
                  $unsigned(reg109[(2'h2):(1'h0)])};
            end
          else
            begin
              reg109 <= reg100[(1'h0):(1'h0)];
              reg110 <= reg101[(3'h7):(3'h4)];
              reg111 <= (wire97 ?
                  reg103[(5'h11):(2'h2)] : reg103[(3'h4):(1'h0)]);
              reg112 <= $signed($unsigned(((|(wire95 >> reg102)) ?
                  ((~&(8'h9c)) | reg99[(3'h5):(1'h0)]) : (-{reg100,
                      (8'hbb)}))));
              reg113 <= {wire96};
            end
          reg114 <= (^~(((8'hbd) ? reg109 : reg103) ^ {reg93,
              reg102[(2'h3):(2'h3)]}));
        end
      reg115 <= reg99;
    end
  assign wire116 = $unsigned($unsigned(($unsigned((reg100 ^~ wire91)) >= (((8'ha7) ?
                       wire95 : (8'hbd)) ^~ $signed(reg110)))));
  always
    @(posedge clk) begin
      reg117 <= ({reg109[(1'h1):(1'h0)], $unsigned(reg100)} ^ (-reg112));
      reg118 <= ($signed(wire88[(2'h2):(1'h0)]) ?
          (|$signed($unsigned(wire88[(2'h2):(1'h0)]))) : ($signed((reg104 ?
              $signed((8'hba)) : reg104)) >= $unsigned(wire89)));
    end
  assign wire119 = reg118[(2'h2):(1'h1)];
  assign wire120 = reg117;
  assign wire121 = ($unsigned((reg115 ?
                       ($signed(wire116) <= (reg108 ?
                           reg107 : (7'h43))) : (reg98 >> wire88[(1'h0):(1'h0)]))) + (!((-(^~(8'ha8))) ?
                       (^~$unsigned(reg117)) : $unsigned((&reg98)))));
  always
    @(posedge clk) begin
      reg122 <= (|reg106[(4'hc):(1'h1)]);
      reg123 <= $unsigned((!(-((^~reg115) & (reg103 | wire91)))));
      reg124 <= (!wire91);
      reg125 <= ((reg124 ?
              $unsigned((((8'hb3) ?
                  wire90 : (8'ha1)) && (wire90 == wire97))) : wire91[(3'h4):(1'h0)]) ?
          (8'ha2) : $signed($signed(reg123[(3'h7):(3'h7)])));
    end
endmodule

module module61  (y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire65;
  input wire signed [(3'h6):(1'h0)] wire64;
  input wire signed [(2'h2):(1'h0)] wire63;
  input wire [(4'h8):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 (1'h0)};
  assign wire66 = ((&$unsigned((-$unsigned(wire64)))) || $signed($signed(wire63)));
  assign wire67 = $unsigned(($signed(wire62[(2'h3):(1'h0)]) ?
                      wire65 : (~&(~&(wire63 ? wire63 : wire66)))));
  assign wire68 = wire66;
  assign wire69 = wire66[(3'h4):(2'h3)];
  assign wire70 = (&wire68[(3'h4):(1'h1)]);
  assign wire71 = $signed((-(((8'ha4) > (wire68 ?
                      wire62 : wire64)) && wire67)));
  assign wire72 = {{$signed($unsigned({wire69, wire62}))}};
  assign wire73 = {$unsigned((-((wire62 ?
                          wire70 : wire69) & $unsigned(wire63))))};
  assign wire74 = (-$unsigned($signed({$signed(wire68)})));
  assign wire75 = {{(wire64 ?
                              (~(wire74 >>> wire69)) : {(wire71 ?
                                      wire71 : wire68),
                                  (8'hb3)})},
                      $signed((((wire66 ? wire63 : wire68) != {(7'h42),
                          wire69}) << wire65))};
  assign wire76 = (wire75 ? (8'hae) : wire67[(2'h3):(1'h0)]);
endmodule
