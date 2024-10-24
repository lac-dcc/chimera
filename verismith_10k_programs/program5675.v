module top
#(parameter param186 = (^(-(({(8'hbe), (8'had)} & ((8'hb6) ^ (8'hb4))) ? (((8'hb6) <<< (8'hbe)) << {(8'haa)}) : ((7'h44) ? (~(8'hb8)) : ((7'h44) ? (8'ha5) : (8'hbd)))))), 
parameter param187 = param186)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire185;
  wire [(5'h12):(1'h0)] wire184;
  wire signed [(4'he):(1'h0)] wire178;
  wire [(4'hc):(1'h0)] wire176;
  wire [(5'h13):(1'h0)] wire175;
  wire [(4'hd):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire173;
  wire [(5'h14):(1'h0)] wire171;
  wire [(4'hd):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg [(4'hd):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg181 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg180 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire178,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire171,
                 wire5,
                 wire4,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg177,
                 reg6,
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
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = ({$unsigned(((^~wire4) ~^ $signed(wire0)))} > wire4);
  always
    @(posedge clk) begin
      if ($unsigned({$unsigned(($signed(wire0) ?
              $unsigned(wire5) : $unsigned(wire3))),
          $unsigned($unsigned((wire4 ? wire2 : (8'ha4))))}))
        begin
          if ((~&wire5[(4'ha):(2'h3)]))
            begin
              reg6 <= $unsigned($signed((wire2[(4'h8):(3'h6)] ^~ {wire1,
                  (~|(8'hb1))})));
              reg7 <= (({wire3[(3'h4):(1'h1)]} - $signed(wire1)) ?
                  (reg6[(4'hb):(4'hb)] ?
                      ((((8'ha0) ~^ wire2) * {(8'hb1)}) < $unsigned((+wire4))) : {($unsigned(reg6) <<< {(8'hb5),
                              wire3}),
                          wire0[(4'hb):(3'h6)]}) : ($signed(($signed((8'ha6)) != wire3[(2'h2):(1'h1)])) <<< wire3));
              reg8 <= $signed((7'h44));
              reg9 <= wire4;
            end
          else
            begin
              reg6 <= ((~^$unsigned($unsigned((reg6 ?
                  (7'h40) : wire1)))) >= $unsigned({$unsigned((wire5 ?
                      (8'h9c) : wire1)),
                  (reg8[(2'h3):(1'h1)] ? (wire5 + reg7) : (&reg8))}));
              reg7 <= ({wire4, wire1} || reg6);
            end
          reg10 <= (($unsigned(reg7[(5'h15):(1'h1)]) >>> reg9[(4'h8):(1'h0)]) << wire4[(2'h2):(2'h2)]);
          if ({{(~^(~^(wire2 ? reg7 : wire3)))},
              ((|reg8) ?
                  (reg6[(4'hf):(4'he)] && ($unsigned(wire5) ?
                      (wire1 * wire3) : {(8'hb7),
                          reg8})) : $unsigned({wire4}))})
            begin
              reg11 <= $signed(reg10);
            end
          else
            begin
              reg11 <= wire5;
              reg12 <= $signed(reg10);
              reg13 <= (~&((-$unsigned($unsigned(reg8))) >= ($signed(wire3) >>> reg7[(5'h13):(2'h2)])));
              reg14 <= $unsigned((($unsigned($signed(wire5)) | (~&(wire2 > (8'ha3)))) ?
                  ((|$signed(wire3)) ?
                      $signed({(8'hb6)}) : {wire1[(2'h2):(1'h0)]}) : ($signed(reg9[(4'h8):(2'h2)]) <= wire1[(1'h0):(1'h0)])));
              reg15 <= {(wire3[(1'h0):(1'h0)] || {(~^wire1[(4'he):(2'h3)])}),
                  (^$unsigned($unsigned((-(7'h40)))))};
            end
          reg16 <= $unsigned($unsigned(wire3[(3'h4):(1'h1)]));
          reg17 <= {$unsigned(reg8[(2'h2):(1'h1)])};
        end
      else
        begin
          reg6 <= (|(^(($signed((8'ha0)) & reg14) ?
              wire4[(3'h4):(1'h0)] : $unsigned(((8'ha3) * (8'hb7))))));
          reg7 <= $signed((^$signed((reg7 ?
              {reg12, wire5} : (reg12 ? reg13 : (8'hb3))))));
          reg8 <= wire1;
          reg9 <= ({(($signed(reg6) ? $signed((8'hb7)) : wire1) ?
                  ($unsigned(reg11) ^ reg9[(3'h7):(3'h5)]) : wire5[(4'h8):(3'h5)])} + reg11[(5'h13):(4'h8)]);
          reg10 <= $unsigned(reg15);
        end
      reg18 <= $signed(reg10);
      if (((^(reg14 ?
          (~^$unsigned(reg9)) : reg6[(4'ha):(1'h1)])) <= $unsigned($signed({(-wire5),
          (wire5 && reg13)}))))
        begin
          reg19 <= reg15[(5'h14):(4'h8)];
          reg20 <= (((~$signed($unsigned(reg9))) < wire1[(1'h0):(1'h0)]) * $unsigned((|(^~((8'hbc) >> (8'hbf))))));
          if (reg13[(3'h4):(2'h2)])
            begin
              reg21 <= {reg11};
              reg22 <= (wire2 ^~ {{{{(8'h9c)}}, reg21}, {reg14}});
              reg23 <= (+{(($unsigned(wire0) ? reg21 : $signed(reg21)) ?
                      ($signed(wire4) ?
                          {reg17, (8'h9d)} : {reg20, reg15}) : reg13)});
            end
          else
            begin
              reg21 <= ($signed({(~^$signed(reg19))}) ?
                  $signed(((reg23[(1'h0):(1'h0)] & $signed(reg8)) & reg15[(2'h2):(2'h2)])) : reg14[(2'h3):(1'h1)]);
            end
          reg24 <= $signed($unsigned($signed((8'hba))));
          reg25 <= $unsigned((&reg19[(1'h0):(1'h0)]));
        end
      else
        begin
          if (wire0[(4'hc):(4'hb)])
            begin
              reg19 <= reg14[(1'h1):(1'h0)];
              reg20 <= (~^(&$unsigned({reg23})));
              reg21 <= ($signed((^{$signed(reg25)})) ?
                  (((7'h42) ? (reg25 ~^ (reg14 >>> wire4)) : $signed(reg11)) ?
                      reg24[(3'h6):(1'h0)] : ($signed((wire5 == reg12)) << reg25[(1'h0):(1'h0)])) : {reg10[(3'h4):(2'h2)],
                      reg22});
              reg22 <= wire1[(3'h6):(3'h6)];
            end
          else
            begin
              reg19 <= reg23;
              reg20 <= reg16;
            end
          reg23 <= (((8'hb8) & ($signed(((7'h43) && (7'h40))) < $signed(wire5[(4'h9):(2'h3)]))) >> (-((^$unsigned(wire3)) ?
              (~^wire0) : wire4)));
          reg24 <= ({(((7'h44) <<< (reg8 ? reg24 : reg12)) ?
                  $signed((wire1 ? reg11 : reg12)) : (+(-reg24))),
              ($unsigned({reg19}) > (^reg17))} <= reg6);
          reg25 <= ((reg20[(1'h1):(1'h1)] ?
                  ($unsigned(((8'hb1) && wire5)) ?
                      ((!reg14) >= (8'had)) : ({reg20} >= (wire4 ?
                          reg21 : wire1))) : {wire5[(4'hd):(4'h9)],
                      (^~reg13[(1'h0):(1'h0)])}) ?
              {(reg12 != (~$unsigned(wire1))),
                  reg12[(2'h3):(2'h3)]} : $unsigned((((reg15 ?
                      reg19 : (8'hac)) ?
                  reg9 : (8'had)) & ((reg8 ? reg10 : reg16) ?
                  $unsigned(reg14) : reg18[(2'h2):(1'h0)]))));
          reg26 <= (+reg10);
        end
      reg27 <= $unsigned((~^(~reg10[(2'h2):(2'h2)])));
    end
  module28 #() modinst172 (.wire30(reg16), .wire32(reg18), .y(wire171), .wire29(reg20), .wire33(reg7), .wire31(reg13), .clk(clk));
  assign wire173 = (+$unsigned({wire0}));
  assign wire174 = ((reg19[(4'hc):(1'h1)] >>> $signed(reg6)) & ($unsigned(reg10) ?
                       {reg14} : (|$signed((|(8'hae))))));
  assign wire175 = ((wire1[(3'h7):(3'h5)] == {{(-reg19), $unsigned((8'ha1))},
                       reg16}) <= reg24);
  assign wire176 = reg11;
  always
    @(posedge clk) begin
      reg177 <= $unsigned(reg14);
    end
  assign wire178 = reg10[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      reg179 <= $signed((!$signed((-(reg24 == wire1)))));
      if ($unsigned(reg10))
        begin
          reg180 <= (($unsigned(reg15) | $signed($signed((~|reg23)))) ?
              $unsigned((($unsigned(wire0) ^~ {wire1,
                  wire178}) || (^~reg20))) : reg10[(4'h8):(1'h1)]);
          reg181 <= $unsigned((reg26[(1'h0):(1'h0)] << {((-reg9) != wire178[(4'h9):(3'h5)]),
              ((-(8'hbf)) ? (&reg21) : (~|reg7))}));
        end
      else
        begin
          reg180 <= reg13;
          reg181 <= (+((+($unsigned(wire3) >= $signed(wire0))) ?
              {((reg26 >>> reg17) > {reg181})} : $unsigned(($unsigned((8'hbb)) ^~ (reg18 - wire3)))));
          reg182 <= wire175[(3'h7):(3'h7)];
          reg183 <= $signed(({reg10,
              reg12} >>> (|(reg181[(1'h0):(1'h0)] && $signed(reg18)))));
        end
    end
  assign wire184 = (!reg16[(3'h4):(2'h3)]);
  assign wire185 = $unsigned(wire178[(4'hc):(3'h6)]);
endmodule

module module28
#(parameter param170 = {{((~((8'ha7) - (7'h42))) ? {((8'hbb) >>> (8'hb1))} : ((8'hbd) && (&(8'hbf)))), ({((7'h42) ? (7'h42) : (7'h43))} & ((~^(8'hbe)) ? ((8'h9d) << (8'ha3)) : (8'haf)))}, (^~(8'ha2))})
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire33;
  input wire [(5'h15):(1'h0)] wire32;
  input wire signed [(4'hd):(1'h0)] wire31;
  input wire [(4'h9):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire155;
  wire [(4'hb):(1'h0)] wire153;
  wire signed [(4'h8):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire signed [(5'h11):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire134;
  wire [(4'hc):(1'h0)] wire83;
  reg [(4'hb):(1'h0)] reg169 = (1'h0);
  reg [(3'h5):(1'h0)] reg168 = (1'h0);
  reg [(4'ha):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg166 = (1'h0);
  reg [(5'h15):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg164 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(2'h2):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg160 = (1'h0);
  reg [(4'hc):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg156 = (1'h0);
  assign y = {wire155,
                 wire153,
                 wire138,
                 wire137,
                 wire136,
                 wire134,
                 wire83,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 (1'h0)};
  module34 #() modinst84 (.y(wire83), .wire36(wire33), .wire37(wire31), .clk(clk), .wire35(wire32), .wire38(wire29));
  module85 #() modinst135 (.clk(clk), .wire87(wire32), .y(wire134), .wire86(wire31), .wire88(wire33), .wire89(wire30));
  assign wire136 = wire83[(4'hc):(4'h8)];
  assign wire137 = wire136[(2'h2):(1'h0)];
  assign wire138 = (wire30[(3'h5):(1'h1)] ~^ {($signed((~wire31)) ?
                           wire29 : $signed((+wire33))),
                       $signed(wire33)});
  module139 #() modinst154 (.wire140(wire136), .wire142(wire33), .wire141(wire31), .clk(clk), .wire143(wire29), .y(wire153));
  assign wire155 = ($unsigned($unsigned((~|$signed((8'h9d))))) ?
                       $unsigned(wire30[(3'h7):(3'h7)]) : ((8'h9e) ?
                           (8'ha7) : $signed((wire33 << $signed(wire29)))));
  always
    @(posedge clk) begin
      reg156 <= {wire31[(3'h7):(3'h6)]};
      reg157 <= $unsigned($signed($unsigned(wire137)));
      reg158 <= (8'h9d);
      if ($unsigned(reg157))
        begin
          reg159 <= wire138;
        end
      else
        begin
          reg159 <= (-$signed((&($signed(wire83) ?
              $signed((8'ha8)) : $unsigned(wire136)))));
          reg160 <= $signed((!((((8'ha5) <= reg159) ^ $unsigned(wire134)) ~^ ((wire30 ?
              wire32 : wire137) <= (wire155 <= wire30)))));
        end
      reg161 <= (~|{wire134[(1'h1):(1'h0)]});
    end
  always
    @(posedge clk) begin
      if ($unsigned(($signed($unsigned({reg156, reg159})) ?
          $unsigned(wire138[(1'h0):(1'h0)]) : wire29)))
        begin
          if (wire136[(3'h4):(2'h3)])
            begin
              reg162 <= (8'hba);
            end
          else
            begin
              reg162 <= {(({$signed(wire155), $signed(wire155)} ?
                      $unsigned(reg156) : (^reg157)) >> {reg160,
                      reg158[(4'h8):(1'h0)]})};
              reg163 <= (8'hbd);
              reg164 <= wire155[(1'h0):(1'h0)];
              reg165 <= (8'hb8);
              reg166 <= ($unsigned((&(wire32 ^~ (reg164 >> reg163)))) ?
                  (~&$unsigned(reg161[(1'h1):(1'h1)])) : ($signed(reg165[(1'h1):(1'h0)]) ?
                      wire83 : $signed(wire138[(2'h3):(2'h3)])));
            end
          reg167 <= (~wire31[(1'h0):(1'h0)]);
          reg168 <= $unsigned(((|{(&reg159),
              reg167[(1'h0):(1'h0)]}) && reg165));
          reg169 <= (&(^($unsigned($signed(wire153)) ?
              ($unsigned(reg156) ?
                  reg156[(2'h3):(2'h3)] : (reg162 - reg167)) : (~|wire136[(1'h1):(1'h1)]))));
        end
      else
        begin
          reg162 <= $unsigned(({$signed((reg164 ?
                  wire30 : wire138))} >>> wire31));
        end
    end
endmodule

module module139  (y, clk, wire143, wire142, wire141, wire140);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire143;
  input wire [(5'h11):(1'h0)] wire142;
  input wire [(3'h7):(1'h0)] wire141;
  input wire signed [(3'h4):(1'h0)] wire140;
  wire [(4'h9):(1'h0)] wire152;
  wire signed [(4'h8):(1'h0)] wire151;
  wire [(5'h11):(1'h0)] wire150;
  wire signed [(4'ha):(1'h0)] wire149;
  wire signed [(3'h6):(1'h0)] wire148;
  wire signed [(4'h8):(1'h0)] wire147;
  wire [(2'h3):(1'h0)] wire146;
  wire [(3'h7):(1'h0)] wire145;
  wire [(3'h4):(1'h0)] wire144;
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 (1'h0)};
  assign wire144 = ((($signed($unsigned(wire142)) ?
                           ((wire143 >= wire141) ?
                               (wire140 ?
                                   wire140 : wire143) : $unsigned(wire142)) : wire143) ?
                       (8'ha4) : (((wire141 & (8'hb2)) ^~ wire143[(3'h6):(2'h2)]) ?
                           wire140[(3'h4):(2'h3)] : $signed(wire143))) - (((wire140[(2'h3):(1'h1)] + $unsigned(wire142)) < $signed((^~wire143))) ?
                       (wire141[(3'h6):(1'h0)] ?
                           (!wire142) : {{wire142, wire143},
                               wire140}) : (~^$unsigned((wire142 ?
                           wire143 : wire142)))));
  assign wire145 = ((8'ha8) <<< ((^$signed((wire142 >> (7'h40)))) ?
                       $unsigned((~|(wire144 - wire142))) : wire143));
  assign wire146 = $signed(((wire144 ?
                       wire143[(1'h0):(1'h0)] : $signed((wire141 > wire143))) ^ $unsigned(((~&wire141) != {wire143}))));
  assign wire147 = wire141[(1'h1):(1'h1)];
  assign wire148 = (wire143[(1'h0):(1'h0)] <<< (~&{((wire146 >> wire143) || (wire146 + wire145)),
                       ((wire146 ? wire147 : wire142) <<< (wire144 ?
                           wire145 : wire145))}));
  assign wire149 = $unsigned($signed((($signed(wire146) ?
                           {wire140, wire148} : (&wire144)) ?
                       wire142 : (wire143[(4'h9):(1'h0)] <<< (wire140 ?
                           (8'hba) : wire148)))));
  assign wire150 = (~&$unsigned((~wire147[(3'h4):(2'h2)])));
  assign wire151 = {wire145[(3'h4):(1'h1)], wire143};
  assign wire152 = wire150;
endmodule

module module85
#(parameter param132 = (^(((8'hb0) ? (~|((8'ha8) ? (8'hba) : (8'hb6))) : ({(8'hae), (8'ha4)} ? ((8'hae) ? (8'hae) : (8'hbb)) : (-(8'hb9)))) ? {(&(~&(7'h42))), (^((8'ha2) || (8'ha0)))} : ((((8'hac) < (8'ha8)) ? {(8'ha5)} : ((8'hb2) ? (8'hb5) : (7'h41))) ? (((8'hba) ? (8'ha2) : (7'h41)) + {(8'had), (8'hb1)}) : (((7'h44) >> (8'ha5)) ^~ (^(8'hb6)))))), 
parameter param133 = (((~^(^((8'haf) <= param132))) + (+(~param132))) | (~(((param132 <<< param132) == (param132 * param132)) ^~ (param132 <<< {param132, (8'ha3)})))))
(y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h206):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire89;
  input wire signed [(2'h3):(1'h0)] wire88;
  input wire signed [(4'h8):(1'h0)] wire87;
  input wire signed [(3'h7):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire117;
  wire signed [(4'hb):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire115;
  wire [(2'h3):(1'h0)] wire110;
  wire [(2'h3):(1'h0)] wire109;
  wire signed [(3'h6):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire104;
  wire signed [(4'hf):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  reg [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  assign y = {wire131,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire110,
                 wire109,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
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
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg108,
                 reg107,
                 reg106,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire90 = wire87;
  assign wire91 = wire90;
  assign wire92 = {$signed(($unsigned($unsigned(wire86)) && ((8'hb6) ?
                          $unsigned(wire90) : {wire91})))};
  assign wire93 = (8'hb2);
  always
    @(posedge clk) begin
      reg94 <= wire87[(3'h6):(1'h0)];
      if (($signed(((~^(|wire87)) ?
          (~^{(8'hb9)}) : $signed((^~wire92)))) ^~ (wire92[(2'h3):(2'h3)] ?
          $signed(($unsigned(wire93) ?
              $signed(wire86) : (-wire86))) : $signed($signed((wire90 ?
              wire91 : wire89))))))
        begin
          reg95 <= ((8'hb8) == (|({((7'h44) ?
                  reg94 : wire87)} + wire93[(2'h2):(1'h1)])));
          reg96 <= $signed((reg95[(2'h3):(1'h0)] <= wire86));
          if ($signed((~&{$signed($signed(wire93)), reg96[(4'hd):(4'hd)]})))
            begin
              reg97 <= (|($unsigned($unsigned(((8'h9f) ? reg96 : (8'h9d)))) ?
                  $unsigned($unsigned($signed((8'hb2)))) : $unsigned($signed($unsigned(wire88)))));
            end
          else
            begin
              reg97 <= (^((^$signed((~&wire93))) ?
                  $signed(((wire89 || wire91) ?
                      (wire87 * wire89) : (reg94 && (8'h9c)))) : wire92));
            end
        end
      else
        begin
          reg95 <= ({wire87[(1'h1):(1'h0)],
              $signed(wire87)} ~^ wire93[(1'h0):(1'h0)]);
          reg96 <= $unsigned(wire92[(4'hf):(3'h4)]);
          reg97 <= (((((wire90 ? wire93 : wire91) ?
                          wire89 : $unsigned((8'ha7))) ?
                      wire87 : wire88) ?
                  reg94 : reg95) ?
              wire93 : wire88);
        end
      reg98 <= $unsigned(($unsigned(wire86[(3'h6):(1'h0)]) ?
          {wire91[(2'h3):(1'h0)], $unsigned((~wire87))} : (8'hbe)));
      reg99 <= $signed(($signed({{wire89}}) ?
          (wire90[(5'h14):(5'h12)] & $signed((wire91 != wire86))) : (wire93[(1'h1):(1'h0)] ?
              {(&wire86)} : wire89)));
    end
  assign wire100 = $unsigned(($signed(wire90[(2'h3):(1'h1)]) < wire88));
  assign wire101 = (wire92 || ({(8'ha8), wire89[(3'h4):(1'h1)]} ?
                       (wire89 ?
                           ((wire92 ? wire89 : wire87) ?
                               $signed(reg96) : wire92[(3'h6):(1'h1)]) : (reg99 ?
                               ((8'haa) ?
                                   wire89 : reg96) : (wire86 != wire90))) : wire91[(1'h1):(1'h0)]));
  assign wire102 = ($signed(wire92[(2'h3):(1'h1)]) < wire87[(1'h1):(1'h1)]);
  assign wire103 = {reg99[(4'hc):(2'h3)]};
  assign wire104 = wire87[(4'h8):(1'h0)];
  assign wire105 = ($signed($unsigned(wire87[(3'h5):(1'h1)])) ?
                       {(wire89 ? $signed(wire103) : (&$unsigned(wire86))),
                           (((reg97 ? wire87 : wire91) >> (wire87 ?
                               wire92 : wire87)) >> wire100[(2'h2):(1'h1)])} : (($signed({wire103}) ?
                               $unsigned({reg97}) : ($unsigned(reg94) && wire90[(5'h10):(3'h5)])) ?
                           wire91 : wire100));
  always
    @(posedge clk) begin
      reg106 <= $signed(wire87);
      reg107 <= $unsigned($signed({(wire90 ? (wire91 & wire105) : (&reg99))}));
      reg108 <= wire102[(1'h1):(1'h0)];
    end
  assign wire109 = wire88[(1'h1):(1'h1)];
  assign wire110 = (~($unsigned(wire87[(1'h1):(1'h0)]) ^~ wire103[(3'h6):(3'h5)]));
  always
    @(posedge clk) begin
      reg111 <= (~|{{$unsigned((reg96 + reg95)), wire105[(1'h0):(1'h0)]},
          ($unsigned(wire100) ?
              wire102[(2'h3):(2'h2)] : $unsigned((~wire86)))});
      reg112 <= wire110[(2'h2):(1'h1)];
      reg113 <= {reg99};
      reg114 <= ((wire91[(3'h5):(1'h1)] ?
          (|$signed(wire101)) : reg107[(2'h3):(2'h3)]) == {wire93[(2'h3):(2'h3)],
          $signed($signed((reg98 * wire90)))});
    end
  assign wire115 = (+$unsigned(wire86));
  assign wire116 = (reg106 <= (~$signed(((wire110 == wire110) >>> {reg113,
                       reg111}))));
  assign wire117 = {((wire87[(2'h3):(1'h1)] <<< $unsigned((wire93 ?
                               wire86 : reg112))) ?
                           $unsigned((7'h40)) : $unsigned(wire110)),
                       wire101[(2'h2):(1'h0)]};
  assign wire118 = wire115;
  assign wire119 = wire115;
  always
    @(posedge clk) begin
      reg120 <= (|((~{wire93[(1'h0):(1'h0)]}) >> $unsigned($signed($unsigned(reg96)))));
      reg121 <= ((((-wire104) > wire104) & wire105[(3'h4):(2'h2)]) ?
          $signed(wire100[(2'h2):(1'h1)]) : {($unsigned((~&wire110)) > $signed($unsigned(wire119)))});
      reg122 <= {$signed(({(reg113 == reg95)} * (wire110 ?
              $unsigned(reg121) : $signed(wire90)))),
          (wire101[(4'hd):(3'h6)] != (((reg99 ? reg98 : wire90) ?
              {reg108, wire105} : {reg97, reg106}) << reg120))};
      if ((8'h9c))
        begin
          if ((($signed(wire118[(1'h1):(1'h1)]) == $signed((~^$unsigned(wire93)))) * (~(^~wire119))))
            begin
              reg123 <= wire102;
              reg124 <= $unsigned($signed(wire119));
              reg125 <= $signed($unsigned($unsigned(wire115)));
              reg126 <= $signed($unsigned((wire88 == reg107[(2'h3):(2'h3)])));
            end
          else
            begin
              reg123 <= wire91;
              reg124 <= (reg114 ^~ {wire89[(3'h4):(2'h3)]});
              reg125 <= $signed($signed($signed(reg107[(2'h2):(1'h0)])));
              reg126 <= (~(wire118 ?
                  {$signed(reg126), reg114} : ((!(reg125 ?
                      reg125 : reg124)) == (~|reg126))));
            end
        end
      else
        begin
          reg123 <= $unsigned($signed($signed($signed((wire119 < wire90)))));
          if ((^~wire104[(3'h5):(2'h3)]))
            begin
              reg124 <= reg108[(1'h0):(1'h0)];
              reg125 <= wire89;
              reg126 <= ((~|((wire87[(2'h3):(2'h2)] ?
                          $unsigned(wire104) : (8'hb1)) ?
                      wire103 : wire87)) ?
                  (!wire117[(2'h2):(2'h2)]) : $signed($unsigned(reg106[(4'h8):(2'h2)])));
              reg127 <= (wire104 - (8'hac));
            end
          else
            begin
              reg124 <= reg121;
              reg125 <= $unsigned(wire109);
            end
          reg128 <= ($signed(reg123[(3'h5):(2'h3)]) + $unsigned((($unsigned(wire116) ?
                  reg127 : $unsigned(reg107)) ?
              $signed((|(8'had))) : wire109)));
          reg129 <= {($unsigned(($signed(wire90) | wire88[(2'h3):(2'h3)])) < $signed(((reg127 ^ reg128) ?
                  {wire105} : $unsigned(reg122)))),
              (~&wire92[(2'h2):(1'h0)])};
          reg130 <= ((&(((8'had) || (8'ha6)) ~^ (!$unsigned((8'ha8))))) ?
              ($unsigned(({reg97} ? (8'ha4) : (reg129 > reg106))) ?
                  $unsigned((8'ha8)) : $signed((reg108 - $unsigned(reg112)))) : $unsigned({(8'hbe)}));
        end
    end
  assign wire131 = (($unsigned(((wire88 ?
                               reg98 : wire119) + wire102[(3'h5):(3'h4)])) ?
                           $unsigned(wire93) : $signed($signed((reg124 ^~ reg127)))) ?
                       reg94 : (!(8'ha1)));
endmodule

module module34  (y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h1d6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire38;
  input wire [(4'hd):(1'h0)] wire37;
  input wire [(5'h10):(1'h0)] wire36;
  input wire [(5'h15):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  assign y = {wire82,
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
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg52,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((wire35[(4'h9):(3'h6)] ?
          {(wire37[(4'ha):(3'h6)] & (+wire38))} : (8'ha1))))
        begin
          reg39 <= $signed(((~|(wire36 <= $signed(wire35))) ~^ (({wire37,
                      wire37} ?
                  $unsigned(wire37) : (wire35 > wire38)) ?
              ((wire38 ? (8'hba) : wire38) & (wire38 ?
                  wire37 : wire38)) : (~^(~&wire35)))));
          reg40 <= $unsigned($signed(wire38[(1'h1):(1'h1)]));
          reg41 <= wire35[(4'he):(3'h7)];
          if ({$unsigned(reg39), (~^$signed(wire37[(3'h7):(3'h4)]))})
            begin
              reg42 <= {$signed($signed((reg41 >> $signed((8'hbb)))))};
              reg43 <= $signed(reg39[(4'he):(3'h6)]);
              reg44 <= ($signed(((-$signed(reg41)) | ((wire36 << reg39) << reg43[(4'hb):(3'h6)]))) ?
                  reg39 : wire38);
              reg45 <= wire37[(4'hc):(4'hc)];
            end
          else
            begin
              reg42 <= {reg42};
              reg43 <= {$unsigned((reg44[(3'h7):(3'h5)] ?
                      ((wire38 + reg45) <<< (wire36 ?
                          wire37 : reg39)) : reg42[(1'h1):(1'h1)])),
                  wire35};
            end
          reg46 <= ((&$unsigned((+((7'h42) ? reg45 : wire38)))) + (!reg41));
        end
      else
        begin
          reg39 <= (^~(8'hb7));
          reg40 <= reg44[(3'h6):(2'h2)];
        end
      if ((reg42[(4'h8):(2'h3)] * (~^{reg44[(4'h9):(4'h9)]})))
        begin
          reg47 <= ((8'ha1) ?
              {$signed((8'hb0)), {{wire35}}} : reg45[(4'he):(4'ha)]);
          reg48 <= $unsigned(wire37[(3'h4):(2'h3)]);
          if ($unsigned($unsigned(wire37[(2'h3):(2'h2)])))
            begin
              reg49 <= $signed(reg44[(3'h7):(1'h1)]);
              reg50 <= $unsigned({((reg44 ?
                      (reg46 <= reg42) : reg47[(1'h1):(1'h1)]) <<< $signed({wire35,
                      wire38})),
                  reg47});
            end
          else
            begin
              reg49 <= $signed($unsigned(wire36[(4'hb):(1'h1)]));
              reg50 <= wire35;
              reg51 <= {reg41[(4'hc):(3'h6)], reg47[(4'h8):(3'h7)]};
            end
          reg52 <= ((~^$signed((~&(wire37 ? (8'hb9) : (8'hac))))) ?
              ($unsigned(($signed(reg44) ?
                  $signed(wire38) : (reg44 || reg42))) ^~ {(~|(reg39 ?
                      reg39 : wire38)),
                  reg45}) : (~|$unsigned(reg45[(2'h2):(1'h1)])));
        end
      else
        begin
          reg47 <= $signed($unsigned(wire38[(4'h8):(3'h4)]));
        end
    end
  assign wire53 = reg41;
  assign wire54 = wire53[(2'h3):(2'h3)];
  assign wire55 = ($signed((((wire35 && wire53) ?
                              {(8'h9d)} : $unsigned(reg47)) ?
                          ((reg49 ? reg44 : (8'hb1)) << wire36) : wire35)) ?
                      reg45[(5'h11):(5'h11)] : $signed((8'hb5)));
  assign wire56 = (reg46[(3'h6):(3'h6)] == reg39[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg57 <= ({(($unsigned(wire56) || ((7'h42) ? reg49 : wire38)) ?
                  reg45 : wire37),
              ($unsigned(reg50) ^~ ((|reg52) ?
                  (reg43 & reg47) : wire53[(2'h2):(1'h0)]))} ?
          $signed(reg43[(1'h0):(1'h0)]) : $unsigned({($unsigned(reg44) <<< reg49),
              {$unsigned(wire36), $signed(wire54)}}));
      if (wire38)
        begin
          if (reg49)
            begin
              reg58 <= ((8'hb8) ?
                  reg42 : $signed(($unsigned($unsigned(reg51)) ?
                      (8'hb5) : reg40[(3'h4):(3'h4)])));
            end
          else
            begin
              reg58 <= ({($unsigned({reg42,
                      reg52}) << $signed(reg43))} > ($signed(reg43) ^~ $signed((reg43[(1'h1):(1'h0)] && (~^reg43)))));
              reg59 <= {(&(~|(&reg48))), $signed({(^(~reg47))})};
              reg60 <= {$signed(({reg40, (wire55 ? wire55 : reg58)} ?
                      $unsigned($unsigned((8'h9e))) : reg50[(5'h10):(4'he)]))};
            end
          reg61 <= wire56[(2'h2):(2'h2)];
          reg62 <= $unsigned((~&$unsigned($unsigned(wire36))));
          reg63 <= $unsigned($signed($signed(((reg41 ? reg40 : wire38) ?
              (wire53 ? wire54 : (8'ha0)) : (reg49 - reg57)))));
          reg64 <= wire53[(3'h6):(2'h3)];
        end
      else
        begin
          reg58 <= (7'h43);
          if (((8'hb4) ?
              (&(($unsigned(reg40) ?
                  $signed(reg64) : (~|wire56)) && wire36)) : (+(reg63 > (&(reg62 != reg46))))))
            begin
              reg59 <= ({{reg42, ((&reg42) > (reg41 ? wire35 : reg50))},
                  ((wire35 < (wire56 ? reg42 : reg57)) ?
                      reg51[(4'h9):(2'h3)] : reg45[(5'h11):(3'h6)])} <<< reg63);
              reg60 <= wire38;
              reg61 <= {reg63[(1'h0):(1'h0)]};
            end
          else
            begin
              reg59 <= {(wire56[(1'h1):(1'h1)] ?
                      $unsigned(((reg57 < wire36) * (wire55 != reg64))) : (|{(~wire53)}))};
              reg60 <= (8'hae);
            end
          reg62 <= ((-$signed($signed(reg47[(3'h5):(3'h4)]))) ~^ (($signed((wire38 ^~ reg63)) & ((wire55 & reg49) >>> reg46)) >= reg44));
          if ($signed($signed($unsigned(reg49[(4'hd):(2'h2)]))))
            begin
              reg63 <= (({reg42} ?
                      $unsigned($unsigned($signed(reg52))) : $unsigned($unsigned(wire53[(3'h4):(1'h0)]))) ?
                  $signed(($signed((8'hb9)) >>> ((reg43 ?
                      reg47 : reg58) * reg64))) : $unsigned((reg61[(1'h1):(1'h1)] + (reg61 && $unsigned(reg39)))));
            end
          else
            begin
              reg63 <= (&(~^reg52[(1'h0):(1'h0)]));
              reg64 <= (reg60[(1'h0):(1'h0)] ^~ $signed((reg48 == {reg61[(2'h2):(2'h2)]})));
            end
          reg65 <= {((|reg48) == (wire35 ? (~$signed(reg46)) : {(-reg40)})),
              $signed((wire55[(1'h0):(1'h0)] ?
                  (^~reg63) : $signed((reg51 == reg47))))};
        end
      reg66 <= (((wire35[(5'h10):(4'hb)] ? $signed((!reg40)) : reg39) ?
              wire35 : $signed(($unsigned(reg47) * (wire36 + reg62)))) ?
          reg51 : (wire54 ?
              reg43 : $unsigned(($signed(reg51) > (reg60 ? reg42 : reg50)))));
      reg67 <= ($signed($unsigned(reg66[(4'hc):(2'h2)])) & reg65);
    end
  assign wire68 = $signed({{((~|reg58) > reg43[(4'ha):(4'ha)]), reg63},
                      $signed(wire37)});
  assign wire69 = ({$unsigned((8'hba)),
                      (wire68[(1'h0):(1'h0)] ?
                          ((reg41 ~^ reg52) || (wire36 >> reg42)) : $signed((reg42 ?
                              reg39 : reg39)))} || (8'ha2));
  assign wire70 = {(wire68[(2'h3):(1'h0)] ?
                          (reg57 ?
                              (!(wire37 ? reg39 : wire35)) : (reg46 ^ {(8'hb4),
                                  wire35})) : wire56[(1'h0):(1'h0)])};
  assign wire71 = (8'hac);
  assign wire72 = (((reg58 | $unsigned($signed(reg46))) ?
                          (~&{{wire36, reg47},
                              (wire37 >> (8'hb4))}) : $unsigned($unsigned({reg47,
                              reg48}))) ?
                      (8'hb7) : $unsigned((((&reg67) & (^reg40)) - {(~&reg51)})));
  assign wire73 = $signed((($signed($unsigned(reg45)) ?
                          reg43[(3'h4):(1'h1)] : $unsigned(reg41)) ?
                      $signed(((!wire38) ?
                          reg39[(3'h4):(2'h3)] : (wire68 >>> reg59))) : reg57[(2'h3):(2'h3)]));
  assign wire74 = reg66[(4'h9):(4'h8)];
  assign wire75 = (~^($signed(reg50) > ((8'haf) ?
                      $signed((~|reg59)) : reg47[(4'h9):(1'h1)])));
  assign wire76 = ($unsigned((~^reg60[(2'h2):(1'h1)])) ^~ reg60[(1'h0):(1'h0)]);
  assign wire77 = (reg59[(1'h0):(1'h0)] ?
                      {$signed(reg67)} : wire76[(3'h4):(1'h0)]);
  assign wire78 = wire54[(1'h1):(1'h0)];
  assign wire79 = (~&reg40);
  assign wire80 = $signed((reg61[(1'h0):(1'h0)] ? (~|wire56) : reg48));
  assign wire81 = {((wire78 <<< (&(8'ha4))) ?
                          (!$unsigned($signed(reg65))) : $unsigned(((wire77 ?
                                  wire73 : wire73) ?
                              $unsigned(wire55) : (wire56 ? wire72 : wire56)))),
                      reg47};
  assign wire82 = {(reg51[(3'h7):(2'h3)] - $signed((+wire77)))};
endmodule
