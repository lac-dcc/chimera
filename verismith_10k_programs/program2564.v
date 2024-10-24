module top #(parameter param263 = (8'h9e)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h30d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire262;
  wire [(4'hf):(1'h0)] wire261;
  wire [(4'he):(1'h0)] wire260;
  wire signed [(5'h13):(1'h0)] wire258;
  wire signed [(5'h14):(1'h0)] wire257;
  wire [(3'h4):(1'h0)] wire256;
  wire signed [(4'h9):(1'h0)] wire255;
  wire signed [(4'h8):(1'h0)] wire249;
  wire signed [(4'hb):(1'h0)] wire248;
  wire [(4'hb):(1'h0)] wire247;
  wire [(4'h8):(1'h0)] wire246;
  wire signed [(5'h13):(1'h0)] wire245;
  wire signed [(4'hd):(1'h0)] wire244;
  wire [(5'h12):(1'h0)] wire242;
  wire signed [(5'h15):(1'h0)] wire137;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire139;
  wire signed [(5'h11):(1'h0)] wire240;
  reg signed [(5'h12):(1'h0)] reg254 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg253 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg252 = (1'h0);
  reg [(5'h15):(1'h0)] reg251 = (1'h0);
  reg [(5'h10):(1'h0)] reg250 = (1'h0);
  reg [(4'h8):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  assign y = {wire262,
                 wire261,
                 wire260,
                 wire258,
                 wire257,
                 wire256,
                 wire255,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire242,
                 wire137,
                 wire56,
                 wire139,
                 wire240,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg4,
                 reg5,
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
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($signed(wire3)))
        begin
          reg4 <= ($unsigned(($signed((wire0 || wire2)) ?
              wire0 : ($signed(wire1) && (~|(8'ha8))))) <<< ($signed($signed((^~wire3))) ?
              (|(wire1[(1'h1):(1'h1)] + (!wire2))) : $signed(wire1)));
          if (((|(((reg4 ?
              (8'ha7) : wire0) & $unsigned(wire3)) <<< (!$unsigned(wire3)))) >= $signed($unsigned(wire0))))
            begin
              reg5 <= (|(~&($unsigned(reg4) << (8'hbb))));
              reg6 <= ((wire0[(4'he):(1'h0)] ?
                  wire1[(4'h8):(2'h2)] : (reg4[(1'h0):(1'h0)] <= (&$unsigned(reg5)))) | $unsigned((wire1 ?
                  reg4 : $unsigned({reg5}))));
              reg7 <= ($unsigned(wire2[(4'ha):(2'h3)]) && reg5[(5'h13):(5'h11)]);
              reg8 <= wire0;
              reg9 <= (~{(8'h9e)});
            end
          else
            begin
              reg5 <= $unsigned($unsigned($unsigned(wire3[(4'hc):(4'hc)])));
              reg6 <= ({($unsigned((|wire1)) - wire3[(1'h1):(1'h0)]),
                      $unsigned($unsigned($signed(reg7)))} ?
                  (~reg7[(2'h2):(1'h0)]) : wire3[(2'h2):(2'h2)]);
              reg7 <= {reg8, wire1[(2'h3):(1'h0)]};
              reg8 <= wire2[(2'h3):(1'h1)];
              reg9 <= ((~^(8'hbc)) ? wire1[(3'h5):(3'h4)] : {reg7});
            end
          reg10 <= $unsigned(reg7[(2'h3):(1'h1)]);
          reg11 <= (-reg7);
          reg12 <= ((+($signed(reg4) ?
                  ($unsigned(reg5) - (reg9 ? wire1 : reg7)) : reg8)) ?
              reg11 : reg5[(4'hb):(4'ha)]);
        end
      else
        begin
          if ($unsigned({(^{(^(8'hbd)), (~(8'ha7))}), $signed($signed(reg5))}))
            begin
              reg4 <= reg5[(5'h12):(3'h6)];
              reg5 <= $unsigned((reg5[(1'h0):(1'h0)] == (((+(8'ha2)) ?
                      wire0[(4'hf):(4'hc)] : reg9[(3'h5):(1'h1)]) ?
                  (wire1[(2'h3):(2'h3)] & ((8'hb1) ^~ reg12)) : $signed((reg8 >= wire3)))));
              reg6 <= ($signed({((wire1 ^ (8'hb8)) == reg9)}) ?
                  wire3[(2'h3):(1'h1)] : $unsigned($unsigned((wire2 ~^ (reg10 ?
                      reg5 : reg10)))));
            end
          else
            begin
              reg4 <= $unsigned(reg8);
              reg5 <= $signed(reg10[(4'h9):(1'h1)]);
              reg6 <= reg4;
              reg7 <= {reg5[(2'h2):(1'h0)], reg4[(1'h0):(1'h0)]};
            end
          reg8 <= {(~&($unsigned((reg12 & reg12)) ?
                  $unsigned({reg10, (8'ha9)}) : $signed((wire0 ?
                      wire3 : reg8))))};
          reg9 <= ((reg4[(3'h5):(3'h4)] != {$unsigned(((8'hb2) > wire2)),
                  (wire1[(3'h5):(2'h2)] >= {(7'h44), wire1})}) ?
              (&$unsigned(reg8)) : (reg5[(4'hc):(1'h1)] ^ (($signed(reg7) || (reg7 ?
                      wire0 : reg8)) ?
                  (~&(~|reg5)) : reg5[(4'h8):(3'h7)])));
          reg10 <= wire2[(5'h11):(4'ha)];
          reg11 <= $signed((8'ha8));
        end
      reg13 <= ($signed(wire1[(2'h2):(2'h2)]) <<< $signed($signed(reg9[(1'h1):(1'h1)])));
      reg14 <= ($signed($unsigned($unsigned({reg13}))) - (reg10[(4'h9):(3'h7)] ?
          (~^reg10) : $unsigned($unsigned(reg4[(3'h6):(1'h0)]))));
      reg15 <= {(|($unsigned(wire0[(5'h10):(4'h9)]) ?
              (&(~^reg11)) : reg9[(3'h5):(2'h3)]))};
      reg16 <= (^$signed($signed(($unsigned((8'ha0)) != {reg11, reg15}))));
    end
  always
    @(posedge clk) begin
      if (((reg6[(3'h7):(3'h7)] >> ((reg15 ?
              $unsigned(wire3) : (reg8 & reg12)) ?
          $unsigned({reg4,
              reg11}) : reg14[(2'h3):(2'h2)])) ^~ ((reg4[(3'h6):(2'h2)] ?
              wire3[(1'h1):(1'h0)] : (8'hb4)) ?
          (^reg4) : $signed(reg12[(4'he):(4'h8)]))))
        begin
          reg17 <= $signed(wire3);
          if ($unsigned($signed((-reg5[(4'h9):(4'h8)]))))
            begin
              reg18 <= {reg15};
              reg19 <= wire3;
              reg20 <= (reg7[(4'h9):(3'h7)] != {$signed(($unsigned(reg13) <= (^~reg14))),
                  (reg9 < ((~|wire2) > (wire2 >= wire0)))});
            end
          else
            begin
              reg18 <= $signed(((&(^(reg19 ? reg19 : reg20))) ?
                  {($unsigned(reg5) ? reg11[(2'h2):(1'h1)] : {reg7})} : reg9));
              reg19 <= reg18;
              reg20 <= wire2[(4'h9):(3'h6)];
              reg21 <= reg20;
              reg22 <= $unsigned(reg21[(4'h8):(1'h1)]);
            end
          reg23 <= $signed($unsigned(reg4));
        end
      else
        begin
          if (reg22[(4'hb):(4'h8)])
            begin
              reg17 <= reg20[(2'h3):(2'h2)];
            end
          else
            begin
              reg17 <= (~&$unsigned(reg15));
            end
          reg18 <= $unsigned({$signed((8'ha0)), (^~reg11)});
          if (reg20)
            begin
              reg19 <= reg8;
              reg20 <= ((8'had) ?
                  $unsigned(reg7[(4'ha):(1'h0)]) : reg20[(3'h4):(2'h2)]);
              reg21 <= ((&(&reg12)) ^ ((reg16[(1'h0):(1'h0)] || ($signed(reg21) >>> $unsigned((8'ha9)))) ?
                  reg10[(3'h4):(1'h1)] : reg12[(5'h12):(4'h9)]));
              reg22 <= $unsigned(((-((reg17 ^~ reg12) & reg7[(3'h5):(3'h4)])) << (reg10[(4'hc):(2'h3)] < $signed($signed(reg17)))));
              reg23 <= $unsigned(reg16[(3'h5):(3'h4)]);
            end
          else
            begin
              reg19 <= ((reg13[(4'hc):(4'ha)] ~^ reg20[(3'h7):(3'h7)]) ^~ (+(^~(&$unsigned(reg19)))));
            end
          reg24 <= reg5;
          reg25 <= reg13[(5'h10):(4'h9)];
        end
      reg26 <= (($signed((8'h9c)) ?
              $unsigned(((reg18 ?
                  reg25 : (8'hb2)) == $signed((8'hb6)))) : $signed((|{reg21,
                  reg24}))) ?
          $signed(({{reg14},
              $signed(reg4)} >>> ($signed(reg15) - $unsigned(reg9)))) : reg15[(1'h0):(1'h0)]);
      reg27 <= $signed((~(&$unsigned(reg15))));
    end
  module28 #() modinst57 (.wire29(reg22), .wire31(reg10), .y(wire56), .wire30(reg24), .clk(clk), .wire32(reg4));
  always
    @(posedge clk) begin
      reg58 <= wire3;
      if ((8'hbf))
        begin
          reg59 <= $unsigned((((8'haa) && wire3[(3'h4):(3'h4)]) ?
              reg4[(4'h8):(2'h3)] : reg11[(1'h0):(1'h0)]));
          if ((wire56 ?
              $signed(reg4) : (($unsigned((wire56 != reg23)) ?
                  ({reg14, reg4} ?
                      (~^reg13) : (^reg21)) : $signed($unsigned((8'hac)))) <= (!reg59))))
            begin
              reg60 <= {{($unsigned(reg10[(3'h7):(3'h5)]) + (wire0[(3'h6):(3'h5)] && $unsigned(reg58))),
                      $unsigned(reg20)}};
            end
          else
            begin
              reg60 <= $signed(($unsigned($signed({wire0})) ?
                  $unsigned($unsigned({reg21})) : reg23[(2'h3):(1'h1)]));
            end
          reg61 <= reg7;
          reg62 <= {(reg20 > (((reg58 >> wire0) ^ (^~(8'hbe))) - {(reg14 >= reg13)})),
              reg4[(1'h1):(1'h1)]};
        end
      else
        begin
          reg59 <= reg12;
          reg60 <= (((^~reg5[(2'h3):(2'h2)]) ?
                  (^(~(|(8'hbd)))) : $signed(($unsigned(reg22) ?
                      reg22[(1'h0):(1'h0)] : $signed(reg8)))) ?
              (~&reg8[(1'h0):(1'h0)]) : $signed((($signed(wire1) * (wire1 | reg20)) < ($unsigned((8'hb2)) <<< $unsigned((8'hb9))))));
          reg61 <= (reg5[(4'h9):(1'h0)] ?
              ($unsigned(($signed(reg12) > {(8'hb1)})) <<< $signed(reg15[(3'h7):(2'h2)])) : (8'hb6));
          if ($unsigned($signed({(reg26 ? $unsigned(reg11) : (8'hb7))})))
            begin
              reg62 <= ($unsigned($signed((reg60 > (wire1 && reg6)))) && (reg13[(3'h6):(3'h4)] && (+wire1[(1'h1):(1'h1)])));
              reg63 <= reg17;
              reg64 <= ($unsigned({((&reg17) * reg6[(1'h0):(1'h0)]),
                  wire0[(4'ha):(2'h2)]}) & $signed($unsigned((8'hbe))));
            end
          else
            begin
              reg62 <= (reg22[(5'h12):(5'h12)] ?
                  wire56 : $unsigned((reg26 ?
                      ($unsigned(reg17) ?
                          {(8'had),
                              reg23} : $unsigned(reg11)) : $signed((!reg9)))));
              reg63 <= reg18;
            end
          if ((reg14 ?
              (reg58 ? (8'hbd) : $signed((+reg22))) : ({reg64[(1'h0):(1'h0)],
                  ((reg8 ? reg12 : wire3) ? reg15 : (~^reg13))} ~^ (8'hbc))))
            begin
              reg65 <= reg63[(2'h3):(2'h2)];
              reg66 <= (reg63 ^ (reg59 > (((~&reg12) >= (^(8'hb4))) ?
                  $signed(reg18[(3'h5):(2'h2)]) : (!(&reg25)))));
            end
          else
            begin
              reg65 <= ((^~$signed(reg21)) ?
                  reg15 : ($signed({wire1, reg22[(4'hd):(3'h4)]}) ?
                      $unsigned(reg27[(1'h0):(1'h0)]) : $signed(((reg61 ?
                              wire56 : reg62) ?
                          (8'hae) : $unsigned((8'hb7))))));
            end
        end
      if ($signed($signed(($unsigned(reg19[(4'h8):(3'h6)]) > ((~(8'h9d)) ?
          (reg26 <= (8'hbb)) : $unsigned(reg59))))))
        begin
          reg67 <= $signed((^~((~|(reg61 < wire56)) >> $signed(((8'h9c) ?
              reg23 : reg64)))));
          reg68 <= ({(8'ha6)} > reg14);
        end
      else
        begin
          reg67 <= ((reg14 > reg9) >= reg19);
        end
    end
  module69 #() modinst138 (wire137, clk, reg23, reg66, wire3, reg27);
  assign wire139 = $signed((8'hac));
  module140 #() modinst241 (wire240, clk, wire137, reg14, reg5, reg22, reg16);
  module176 #() modinst243 (.wire180(reg12), .wire177(reg15), .y(wire242), .wire179(reg5), .wire178(reg21), .clk(clk));
  assign wire244 = $signed(reg25[(2'h3):(1'h1)]);
  assign wire245 = ($signed((~^(~|reg16))) ^~ {$signed(((reg16 << (8'had)) ?
                           $unsigned((8'ha9)) : (reg17 ? reg16 : reg25))),
                       (~^{(-reg62), {reg60, reg17}})});
  assign wire246 = $unsigned($unsigned($unsigned({(wire244 ? reg24 : reg59),
                       $signed(reg20)})));
  assign wire247 = ($unsigned(wire137[(3'h6):(3'h5)]) ?
                       (-reg10[(4'hd):(4'hd)]) : $unsigned($signed($unsigned(reg14[(3'h7):(3'h5)]))));
  assign wire248 = {((8'hb6) ?
                           $signed({reg61[(1'h0):(1'h0)],
                               $unsigned(reg20)}) : ($unsigned($signed((8'ha9))) * $signed((8'hb8)))),
                       (~^wire139[(1'h1):(1'h0)])};
  assign wire249 = $signed(wire245);
  always
    @(posedge clk) begin
      reg250 <= (({$signed($unsigned(reg17)), (^~reg8[(2'h2):(2'h2)])} ?
          reg20[(3'h4):(1'h1)] : $signed($signed((reg18 ?
              reg16 : reg24)))) >= (8'ha0));
      reg251 <= (-($signed(wire137[(4'hc):(4'h9)]) ?
          (~|reg17) : ($unsigned((reg21 ? reg11 : wire0)) ?
              $signed((reg7 ~^ reg20)) : ((reg5 ? wire242 : reg13) ?
                  $unsigned(reg14) : {wire244}))));
      reg252 <= $unsigned(reg61);
      reg253 <= reg251[(4'ha):(3'h7)];
      reg254 <= ({(((reg23 && (8'ha9)) ^~ reg19[(1'h0):(1'h0)]) >>> $signed((reg23 ?
              wire139 : wire1))),
          $unsigned($signed($unsigned(reg24)))} <<< (^~$unsigned(({wire249,
              reg58} ?
          $signed(reg17) : (reg26 ? wire247 : reg67)))));
    end
  assign wire255 = $unsigned(reg254[(1'h1):(1'h0)]);
  assign wire256 = (reg14[(4'hc):(2'h2)] ?
                       (((+(!wire244)) ?
                               wire3[(4'h8):(3'h7)] : (!reg253[(4'hc):(4'ha)])) ?
                           $unsigned(reg8) : reg21) : $unsigned({$signed(reg19[(2'h3):(2'h3)]),
                           ((^wire137) ?
                               (reg12 ^~ wire248) : ((8'hba) && wire249))}));
  assign wire257 = reg252[(4'hb):(3'h4)];
  module176 #() modinst259 (.clk(clk), .y(wire258), .wire177(reg65), .wire179(reg6), .wire178(reg26), .wire180(reg12));
  assign wire260 = (~(reg60[(2'h2):(1'h0)] ? reg252 : reg59[(1'h0):(1'h0)]));
  assign wire261 = (($unsigned(reg64) ?
                       $signed(({wire255, reg16} ?
                           ((8'ha6) >= (8'haa)) : {wire1,
                               reg20})) : $unsigned($unsigned($unsigned(reg252)))) < ((8'hbb) * $signed(((wire1 ?
                       reg17 : (8'ha0)) ^~ (8'hb3)))));
  assign wire262 = wire245;
endmodule

module module140
#(parameter param239 = (&{(^~(((8'ha7) ? (8'ha0) : (8'hbb)) >> (-(8'hb6))))}))
(y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire145;
  input wire signed [(5'h11):(1'h0)] wire144;
  input wire [(4'he):(1'h0)] wire143;
  input wire signed [(4'hb):(1'h0)] wire142;
  input wire signed [(5'h11):(1'h0)] wire141;
  wire signed [(5'h11):(1'h0)] wire238;
  wire signed [(4'h8):(1'h0)] wire237;
  wire signed [(4'h9):(1'h0)] wire233;
  wire signed [(5'h10):(1'h0)] wire175;
  wire signed [(4'hf):(1'h0)] wire174;
  wire signed [(5'h12):(1'h0)] wire173;
  wire signed [(4'h9):(1'h0)] wire172;
  wire signed [(5'h14):(1'h0)] wire171;
  wire [(4'he):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire169;
  wire signed [(3'h7):(1'h0)] wire168;
  wire [(2'h2):(1'h0)] wire166;
  wire signed [(5'h14):(1'h0)] wire146;
  reg [(3'h7):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg235 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire233,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire166,
                 wire146,
                 reg236,
                 reg235,
                 (1'h0)};
  assign wire146 = wire143;
  module147 #() modinst167 (wire166, clk, wire143, wire145, wire142, wire146);
  assign wire168 = wire166;
  assign wire169 = ((&{($unsigned(wire146) ? $unsigned(wire146) : wire168),
                       wire144[(2'h3):(2'h2)]}) ^ ((((wire146 * wire141) ^~ $unsigned(wire145)) ?
                       {(~|wire166)} : $unsigned(wire168[(3'h5):(3'h4)])) & (($signed(wire166) <<< (+wire146)) ?
                       (~^(&wire141)) : ($signed(wire145) || (+wire144)))));
  assign wire170 = (((~&(wire146 * (wire169 == wire166))) - $unsigned(wire144)) && ($signed(($signed((8'h9e)) ?
                           wire168 : {wire142, (8'hac)})) ?
                       (!$unsigned((wire166 || wire143))) : (~|wire168[(1'h1):(1'h1)])));
  assign wire171 = $unsigned(wire170);
  assign wire172 = ((^wire166[(2'h2):(2'h2)]) ?
                       (+($signed((wire145 && wire146)) ?
                           ((^~wire170) <<< (wire143 - wire144)) : wire169[(4'hd):(4'h8)])) : $unsigned(wire170));
  assign wire173 = $signed({wire171});
  assign wire174 = (^~wire145[(1'h1):(1'h0)]);
  assign wire175 = (((wire145[(4'hf):(1'h0)] ?
                       (wire168[(3'h5):(1'h1)] > $signed(wire170)) : ($unsigned(wire144) >= $unsigned(wire166))) * $unsigned((~wire168[(2'h3):(2'h2)]))) | wire166);
  module176 #() modinst234 (wire233, clk, wire143, wire145, wire141, wire169);
  always
    @(posedge clk) begin
      reg235 <= (!wire145);
      reg236 <= ($signed((&(&$signed((8'hba))))) ?
          $signed({wire175}) : wire142[(3'h5):(3'h5)]);
    end
  assign wire237 = (8'ha4);
  assign wire238 = wire145[(2'h3):(2'h3)];
endmodule

module module69
#(parameter param135 = ((-(!(&(|(8'hb1))))) ? ((^~({(8'ha3)} + ((8'h9e) | (8'hb8)))) ? {(((8'hb9) ? (8'hbc) : (7'h44)) >>> {(8'hbb), (7'h43)}), (-((8'hb7) ^~ (8'ha3)))} : (^~((-(8'ha0)) + (8'ha4)))) : (-{(~(^~(8'h9e))), {((8'hb0) ? (8'had) : (8'hb3))}})), 
parameter param136 = param135)
(y, clk, wire70, wire71, wire72, wire73);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire70;
  input wire [(4'hc):(1'h0)] wire71;
  input wire signed [(5'h10):(1'h0)] wire72;
  input wire signed [(5'h15):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire signed [(5'h10):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire130;
  wire [(5'h11):(1'h0)] wire129;
  wire signed [(5'h11):(1'h0)] wire127;
  wire [(5'h11):(1'h0)] wire115;
  wire signed [(5'h15):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire113;
  wire [(4'h9):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire111;
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire115,
                 wire114,
                 wire113,
                 wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire111,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 (1'h0)};
  assign wire74 = $unsigned($unsigned($signed({wire72, (~wire72)})));
  assign wire75 = $unsigned(wire74);
  assign wire76 = $unsigned(wire71[(1'h1):(1'h0)]);
  assign wire77 = ((&({$unsigned(wire72)} ?
                          $unsigned((!wire76)) : (!$unsigned(wire76)))) ?
                      (^({wire73[(3'h6):(1'h1)]} <= ($unsigned(wire71) | (!wire76)))) : wire74[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg78 <= wire75;
      if (wire72)
        begin
          if ($unsigned((wire74[(3'h4):(2'h3)] ?
              (~^(((8'ha4) + wire75) ^~ $signed(wire70))) : (((^~wire72) | ((8'had) ?
                  wire70 : wire71)) | $signed(wire73)))))
            begin
              reg79 <= ($signed($signed({(reg78 ~^ wire72),
                  $unsigned(wire76)})) && wire71);
              reg80 <= reg79[(1'h1):(1'h0)];
              reg81 <= $unsigned(wire77[(1'h1):(1'h1)]);
              reg82 <= $unsigned((wire72 ?
                  (reg79[(2'h2):(2'h2)] * $signed((8'ha1))) : $unsigned(wire77[(1'h0):(1'h0)])));
            end
          else
            begin
              reg79 <= (&(wire77[(1'h0):(1'h0)] ?
                  $unsigned((((8'hb5) > reg81) ?
                      wire76[(3'h4):(3'h4)] : reg80)) : $unsigned(wire77[(2'h2):(1'h1)])));
              reg80 <= $signed($signed($signed(wire76[(3'h4):(3'h4)])));
              reg81 <= (^~$unsigned((($signed((8'hba)) <<< wire74[(3'h4):(1'h0)]) ?
                  wire75[(3'h5):(3'h5)] : ($unsigned(wire73) ?
                      (^~(8'haa)) : $signed(reg78)))));
            end
          reg83 <= {($signed($unsigned(((7'h40) ?
                  (8'hb8) : wire75))) <<< $unsigned($unsigned((wire77 > reg82))))};
          reg84 <= ((&wire71[(3'h6):(1'h1)]) ?
              wire71 : ($signed($signed(wire73[(5'h11):(3'h4)])) & $signed($unsigned((wire74 != wire74)))));
          if (wire70[(2'h3):(1'h0)])
            begin
              reg85 <= $signed($unsigned((((|reg79) || reg79[(2'h3):(2'h2)]) ?
                  reg82[(3'h6):(3'h6)] : (wire74[(2'h2):(2'h2)] ?
                      $unsigned((8'hab)) : (|reg79)))));
              reg86 <= ($signed((^~(+(reg82 < reg85)))) ?
                  ({(wire76 + (reg78 <= (8'hbb))),
                      $unsigned((|(8'hbd)))} - wire74[(4'h9):(1'h0)]) : $signed($unsigned((wire70 ?
                      ((8'hbb) + reg80) : ((8'ha0) ? reg83 : wire72)))));
              reg87 <= reg79;
            end
          else
            begin
              reg85 <= $signed(($unsigned(reg83) ^~ $signed({((8'hbd) ?
                      (8'ha1) : reg79),
                  $unsigned((8'hb9))})));
              reg86 <= wire70;
              reg87 <= (($signed({(reg86 ? wire75 : wire70),
                  $signed(wire70)}) ~^ ((~^(~wire73)) <= $signed((^~reg81)))) && wire74);
              reg88 <= reg86[(4'hf):(3'h7)];
            end
        end
      else
        begin
          if (reg85[(3'h4):(3'h4)])
            begin
              reg79 <= (reg82[(2'h3):(2'h3)] > wire74);
            end
          else
            begin
              reg79 <= wire70[(1'h1):(1'h1)];
              reg80 <= $signed((~^(reg79 < (~^wire73))));
              reg81 <= (reg88 || $unsigned($unsigned(((wire72 >= reg79) ?
                  wire74[(2'h3):(2'h3)] : $signed((7'h40))))));
            end
          reg82 <= {reg78};
        end
    end
  module89 #() modinst112 (wire111, clk, reg84, reg86, wire75, reg83);
  assign wire113 = ((|wire111) ?
                       $signed(reg80[(5'h12):(1'h0)]) : ((((wire74 ?
                               reg81 : reg83) ?
                           (wire77 | wire71) : $signed(wire111)) >> reg87[(1'h1):(1'h0)]) >>> ((~|(wire72 ?
                               (8'ha9) : reg87)) ?
                           (8'hb5) : (^~$unsigned(wire72)))));
  assign wire114 = ($unsigned((8'ha7)) * ($unsigned((~wire73)) ?
                       reg82[(3'h4):(2'h2)] : ((~|((7'h42) <= reg83)) ?
                           ($signed(reg83) ?
                               $signed((8'ha6)) : wire77) : $unsigned(reg79))));
  assign wire115 = (|$unsigned(($unsigned(wire74) ?
                       $unsigned($unsigned(wire76)) : $unsigned((^reg88)))));
  module116 #() modinst128 (wire127, clk, wire72, reg84, wire115, reg82);
  assign wire129 = $unsigned((|((reg79[(4'h9):(3'h7)] - $signed(wire76)) ?
                       wire73 : ((reg85 ? reg81 : reg85) <<< (~^wire75)))));
  assign wire130 = ($signed($signed(wire73[(4'hc):(3'h5)])) ?
                       ((((&wire74) ? wire111 : (~|(7'h41))) ?
                               wire113 : (8'hbc)) ?
                           $unsigned(reg83) : (reg87 ?
                               $signed(wire115[(4'hc):(3'h6)]) : (wire76[(1'h1):(1'h1)] > (~^reg83)))) : ($unsigned($signed((reg81 ?
                           wire76 : wire76))) <<< ($unsigned({wire73}) < ((wire77 || reg81) + reg84[(1'h0):(1'h0)]))));
  assign wire131 = (reg86[(4'hf):(3'h7)] ?
                       (~&wire73[(1'h1):(1'h0)]) : (!$unsigned(wire70)));
  assign wire132 = $signed((+wire77));
  assign wire133 = ($signed($signed($unsigned({reg84,
                       reg83}))) & ({$signed((reg84 ^~ reg80))} ^ reg84[(4'hb):(4'hb)]));
  assign wire134 = (reg88 ?
                       (reg82 ? (~&wire70) : reg88[(4'h9):(4'h8)]) : ({wire72} ?
                           wire70 : (wire72 ?
                               {reg81,
                                   (|reg84)} : (((8'h9c) * wire130) * (wire115 ?
                                   (8'haa) : wire131)))));
endmodule

module module28
#(parameter param54 = {((8'hab) ? ((((8'ha4) ? (7'h44) : (8'hb3)) - ((8'h9f) >>> (8'hb3))) >= {((8'hb9) | (8'ha6))}) : ((!((8'hbe) ? (7'h43) : (8'h9e))) >> (((8'h9f) == (7'h44)) & {(8'hbb)}))), ((({(7'h42)} ? ((8'h9e) ? (8'h9e) : (8'hbd)) : {(7'h41)}) << {((8'h9d) ? (8'ha8) : (8'hab))}) ? ((~|((8'hb7) ^ (8'ha5))) <= (+(|(8'hb2)))) : (8'hb6))}, 
parameter param55 = (((~&((param54 ? param54 : param54) ? (^param54) : (param54 != param54))) ? param54 : ((param54 << (!param54)) ? (|(param54 <<< param54)) : ({param54, (8'hb9)} << (~param54)))) | (^~param54)))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire32;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire signed [(5'h10):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
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
                 reg37,
                 (1'h0)};
  assign wire33 = $unsigned($unsigned(wire31));
  assign wire34 = wire32;
  assign wire35 = $signed((wire31[(4'hf):(3'h5)] ?
                      {((^wire31) ? wire34 : wire34)} : (wire34[(3'h5):(1'h0)] ?
                          wire33 : (-(wire34 ? wire29 : wire33)))));
  assign wire36 = (^~$signed(($signed((wire29 == (8'hb6))) ?
                      $signed(((8'hb2) ? wire29 : wire34)) : ((8'hb5) ?
                          (~^wire29) : (wire32 << wire30)))));
  always
    @(posedge clk) begin
      reg37 <= {((($signed(wire36) != wire32[(3'h5):(3'h5)]) && {{wire33,
                      wire36},
                  wire34}) ?
              (wire32 < (!{(8'hb2), (8'hbb)})) : ((^(-wire29)) ?
                  wire36[(2'h3):(1'h0)] : (wire36 ?
                      {wire30} : (wire31 | wire36)))),
          wire31};
      reg38 <= $unsigned(((!(+wire33)) >> $unsigned($unsigned($signed(wire31)))));
      if ((-wire32))
        begin
          reg39 <= wire29;
        end
      else
        begin
          reg39 <= $signed(((8'hb1) > reg38[(4'h8):(3'h5)]));
          if ((((~&(((8'hb3) ~^ wire31) ?
                      $signed(wire29) : (wire35 ? wire34 : reg37))) ?
                  (reg39 ?
                      $signed($signed(wire30)) : wire31[(5'h12):(2'h2)]) : ((|wire34[(1'h0):(1'h0)]) ?
                      wire32 : $signed((7'h40)))) ?
              (wire34 ?
                  (~((reg39 == wire36) ?
                      wire34 : (8'hab))) : (wire30[(4'hc):(1'h0)] < wire33[(3'h4):(2'h3)])) : wire32[(2'h2):(2'h2)]))
            begin
              reg40 <= $unsigned(((8'ha6) ?
                  {reg39, wire34[(3'h4):(1'h0)]} : wire32[(2'h2):(1'h1)]));
              reg41 <= (^(&$signed(wire29[(5'h13):(3'h4)])));
            end
          else
            begin
              reg40 <= $signed((~|reg41[(5'h14):(4'hd)]));
            end
          if ((&(reg37[(4'hd):(2'h3)] ?
              (^~$unsigned((!wire30))) : $signed(({(7'h42),
                  (8'hbf)} || $unsigned((8'ha6)))))))
            begin
              reg42 <= {($signed((~&{reg40})) ?
                      (~&wire32[(2'h3):(1'h0)]) : (wire30[(2'h3):(2'h3)] >>> (+(wire35 | reg39)))),
                  $signed(wire34)};
              reg43 <= (((($unsigned(wire30) <<< {wire35}) << wire30) ?
                  reg40[(5'h11):(4'hf)] : $unsigned((!(+wire36)))) < reg37[(2'h3):(2'h3)]);
              reg44 <= ($unsigned((((wire33 - (8'ha3)) ?
                          reg42[(5'h12):(1'h1)] : (reg43 ? wire32 : reg39)) ?
                      (^~wire36[(2'h2):(1'h1)]) : (((8'hbb) < wire30) ?
                          {reg42, (8'hbd)} : $unsigned(wire33)))) ?
                  (wire32 ?
                      (((wire32 ?
                          wire29 : reg37) ^~ wire29) ^~ reg38[(3'h5):(1'h1)]) : reg42[(5'h10):(3'h7)]) : $unsigned((~|wire31[(4'he):(4'h9)])));
              reg45 <= $unsigned(((|$unsigned((reg43 ^~ wire35))) | ({wire31} ?
                  reg38[(4'h8):(1'h0)] : $signed((wire32 ? wire36 : reg38)))));
              reg46 <= $signed(($signed(({wire34, reg43} ?
                  wire33[(2'h2):(1'h1)] : reg40[(1'h0):(1'h0)])) + $unsigned((~(^~(8'haf))))));
            end
          else
            begin
              reg42 <= reg40[(2'h2):(1'h0)];
              reg43 <= (8'ha9);
              reg44 <= $signed(reg44[(1'h1):(1'h1)]);
              reg45 <= $signed(((reg37 + wire35[(3'h7):(3'h5)]) != wire30));
              reg46 <= reg37;
            end
          if (($signed((|(~|reg44[(2'h3):(1'h0)]))) ?
              $signed($signed((-$unsigned(wire31)))) : (8'hab)))
            begin
              reg47 <= ((^~$unsigned(($unsigned(reg42) == reg46[(5'h12):(4'h9)]))) & $signed((wire29 ?
                  reg42[(2'h3):(2'h3)] : ((^reg40) ?
                      (wire31 ? wire36 : wire34) : reg45[(2'h2):(1'h1)]))));
              reg48 <= $unsigned(reg41[(5'h11):(4'hf)]);
              reg49 <= {($signed(reg46) ?
                      reg42[(1'h1):(1'h0)] : $unsigned($signed(wire31)))};
            end
          else
            begin
              reg47 <= ($unsigned(wire34[(1'h1):(1'h0)]) + (reg38[(5'h11):(3'h6)] ?
                  (~{$signed(reg37)}) : (^~reg38)));
              reg48 <= $signed(wire31[(3'h5):(3'h5)]);
            end
          reg50 <= $signed((($unsigned($unsigned(reg47)) ?
              ($signed(reg49) ?
                  $signed(wire31) : $signed(reg40)) : reg48[(4'hb):(3'h5)]) & ($signed(reg46[(4'hc):(2'h2)]) ?
              reg43 : ((reg40 ~^ wire34) || $unsigned(reg42)))));
        end
      reg51 <= (8'hb1);
    end
  assign wire52 = (~|wire34[(2'h3):(1'h0)]);
  assign wire53 = $unsigned(reg39[(1'h1):(1'h0)]);
endmodule

module module116
#(parameter param125 = ((~|(((&(8'ha6)) >> ((8'ha5) << (8'ha8))) * (((8'ha2) ? (8'ha0) : (8'hb6)) < {(8'hb6)}))) - (~|(~((|(8'had)) ? {(8'h9e)} : ((8'ha1) ? (7'h42) : (7'h44)))))), 
parameter param126 = ((((-(param125 ? (8'ha5) : param125)) ? param125 : param125) || ((&((8'ha5) - param125)) * param125)) > ((param125 <<< ((~|(8'hbf)) ? param125 : {param125})) ~^ (-(+(param125 ? param125 : param125))))))
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire120;
  input wire [(2'h3):(1'h0)] wire119;
  input wire [(4'he):(1'h0)] wire118;
  input wire signed [(5'h10):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire121;
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  assign y = {wire124, wire123, wire121, reg122, (1'h0)};
  assign wire121 = $unsigned(((8'ha6) ?
                       ($unsigned($unsigned(wire117)) ?
                           wire120 : (wire120 ?
                               wire119 : wire119[(2'h2):(1'h0)])) : {(|$unsigned(wire120)),
                           $signed(((8'hb9) <= wire118))}));
  always
    @(posedge clk) begin
      reg122 <= (8'hba);
    end
  assign wire123 = (+($signed((wire121[(4'ha):(3'h7)] ?
                       wire117[(4'ha):(2'h2)] : ((8'hb3) ?
                           wire118 : (8'ha5)))) || (wire118[(3'h7):(1'h0)] ?
                       (^(wire120 ? reg122 : wire118)) : (reg122 ?
                           $unsigned((8'hb6)) : (~reg122)))));
  assign wire124 = (reg122 << ($signed((~&wire121)) ?
                       (~|(^~(~&wire118))) : ($unsigned((wire118 ?
                           wire117 : wire120)) ~^ wire123[(3'h7):(3'h7)])));
endmodule

module module89
#(parameter param109 = {({(8'ha4), {{(8'ha4)}}} ? {(~&((8'haa) ~^ (8'hbf))), (((8'ha1) ? (8'hac) : (8'hb8)) ? {(8'ha3), (8'ha9)} : (+(8'hac)))} : ((((8'ha5) > (8'h9e)) ^ ((8'ha7) >>> (8'hbf))) ? ((~^(8'hb3)) ? ((8'hbe) ? (8'hae) : (7'h41)) : (~(8'ha7))) : (~((8'hac) + (8'hb0)))))}, 
parameter param110 = (((!(~&(&param109))) * param109) <= ((!((|param109) ? param109 : param109)) << (~(((8'hba) ~^ param109) ^ param109)))))
(y, clk, wire93, wire92, wire91, wire90);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire93;
  input wire [(4'h8):(1'h0)] wire92;
  input wire signed [(3'h5):(1'h0)] wire91;
  input wire signed [(4'hd):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire99;
  wire [(2'h2):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire94;
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg108,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire94 = (wire93 ^~ $unsigned(((wire90 ?
                          wire91 : wire93[(4'h8):(2'h2)]) ?
                      (~&((8'hbd) - wire92)) : (8'ha6))));
  assign wire95 = wire90;
  assign wire96 = $signed((~|$signed((~&(wire95 || wire92)))));
  assign wire97 = wire94;
  assign wire98 = ((~^($signed($unsigned(wire93)) + ((wire97 ?
                          wire91 : wire91) ?
                      {wire93,
                          wire92} : wire96[(3'h5):(2'h2)]))) + wire97[(4'he):(4'he)]);
  assign wire99 = wire93[(4'h8):(2'h3)];
  always
    @(posedge clk) begin
      reg100 <= ($signed($unsigned((~^(wire91 <<< wire97)))) ~^ $unsigned(((wire90[(4'hd):(3'h6)] ?
          wire97[(1'h1):(1'h1)] : wire93) <<< $unsigned($unsigned(wire98)))));
      reg101 <= {(+($signed((8'h9e)) ?
              (wire99[(4'hf):(4'h8)] & wire98) : (8'h9e)))};
    end
  assign wire102 = (-($unsigned($signed(wire98)) ?
                       wire91[(1'h1):(1'h0)] : (((~&reg100) ?
                           $signed(reg101) : $signed((8'hbb))) < $unsigned((reg101 || (8'ha0))))));
  assign wire103 = $signed((reg100 ?
                       reg100[(5'h14):(4'hc)] : ({wire94[(4'h9):(4'h9)]} ?
                           (~&$unsigned((8'hb9))) : {wire96[(4'he):(3'h5)],
                               $unsigned(wire93)})));
  assign wire104 = $unsigned({$signed((^~(wire97 > (8'h9e))))});
  assign wire105 = wire95[(3'h4):(2'h2)];
  assign wire106 = ({wire98[(1'h1):(1'h0)]} << (^~(8'had)));
  assign wire107 = $unsigned((wire93 ?
                       $unsigned(($signed(wire93) < (wire94 ?
                           wire102 : wire98))) : wire99));
  always
    @(posedge clk) begin
      reg108 <= (wire94 * wire103[(3'h4):(1'h0)]);
    end
endmodule

module module176
#(parameter param231 = (8'hbc), 
parameter param232 = (({((~^param231) ? (param231 < (8'ha7)) : param231), {(param231 && param231)}} ? (((8'hb6) == param231) ? (8'ha8) : param231) : (({param231} ? (param231 != param231) : (param231 != (8'ha7))) ? param231 : (param231 * (param231 ? param231 : (8'ha1))))) >> param231))
(y, clk, wire180, wire179, wire178, wire177);
  output wire [(32'h293):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire180;
  input wire [(5'h13):(1'h0)] wire179;
  input wire signed [(5'h11):(1'h0)] wire178;
  input wire [(5'h14):(1'h0)] wire177;
  wire [(5'h12):(1'h0)] wire230;
  wire signed [(4'hb):(1'h0)] wire229;
  wire [(4'hb):(1'h0)] wire228;
  wire [(5'h15):(1'h0)] wire227;
  wire [(5'h14):(1'h0)] wire226;
  wire [(5'h15):(1'h0)] wire225;
  wire signed [(5'h10):(1'h0)] wire191;
  wire [(5'h12):(1'h0)] wire190;
  wire signed [(2'h3):(1'h0)] wire189;
  wire [(5'h15):(1'h0)] wire188;
  wire signed [(4'h8):(1'h0)] wire187;
  wire [(4'hf):(1'h0)] wire186;
  wire signed [(4'hf):(1'h0)] wire184;
  wire [(2'h3):(1'h0)] wire183;
  wire [(4'hd):(1'h0)] wire182;
  wire signed [(5'h13):(1'h0)] wire181;
  reg [(4'hc):(1'h0)] reg224 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg223 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg222 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg221 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg220 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg219 = (1'h0);
  reg [(4'hf):(1'h0)] reg218 = (1'h0);
  reg [(4'hd):(1'h0)] reg217 = (1'h0);
  reg [(4'h9):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg213 = (1'h0);
  reg [(4'hd):(1'h0)] reg212 = (1'h0);
  reg [(2'h2):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg210 = (1'h0);
  reg [(4'hb):(1'h0)] reg209 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg206 = (1'h0);
  reg [(5'h11):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg202 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg201 = (1'h0);
  reg [(4'hd):(1'h0)] reg200 = (1'h0);
  reg [(5'h14):(1'h0)] reg199 = (1'h0);
  reg [(3'h7):(1'h0)] reg198 = (1'h0);
  reg [(4'h9):(1'h0)] reg197 = (1'h0);
  reg [(3'h4):(1'h0)] reg196 = (1'h0);
  reg [(4'he):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg194 = (1'h0);
  reg [(5'h15):(1'h0)] reg193 = (1'h0);
  reg [(4'he):(1'h0)] reg192 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg185 = (1'h0);
  assign y = {wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg185,
                 (1'h0)};
  assign wire181 = ($unsigned(wire180[(3'h7):(2'h3)]) ^~ wire179);
  assign wire182 = wire180[(4'h9):(1'h0)];
  assign wire183 = wire177;
  assign wire184 = (($signed(((wire179 >= wire178) ~^ $unsigned(wire182))) ?
                           $signed(wire180) : wire179) ?
                       $signed($unsigned(((~^wire181) ~^ wire180[(3'h5):(2'h3)]))) : $signed({(~$signed((8'hac)))}));
  always
    @(posedge clk) begin
      reg185 <= ((wire181 ?
              $unsigned($signed($unsigned(wire183))) : (wire181[(1'h0):(1'h0)] ?
                  {wire181[(4'hb):(4'ha)],
                      {wire182, (8'hb8)}} : $unsigned(((8'ha6) ?
                      wire182 : wire183)))) ?
          ({((~&wire180) ?
                      (wire181 ?
                          wire181 : (8'hb9)) : wire178[(5'h11):(4'hc)])} ?
              $signed((+(wire183 <= wire181))) : ($signed(wire182[(4'hb):(4'ha)]) ^~ wire184[(2'h2):(1'h1)])) : {{wire177[(5'h13):(3'h7)],
                  wire177},
              (~^{(8'ha1), ((8'hae) ? wire179 : wire178)})});
    end
  assign wire186 = reg185;
  assign wire187 = ((8'hb8) ?
                       {(((^~wire182) ?
                                   ((8'ha5) ?
                                       reg185 : wire182) : wire184[(1'h0):(1'h0)]) ?
                               wire178[(2'h2):(2'h2)] : $unsigned($signed(wire183))),
                           (8'ha5)} : $signed((($signed(wire182) ?
                           ((8'hb3) == wire179) : wire184) >= $signed((^wire180)))));
  assign wire188 = (+{reg185[(1'h0):(1'h0)],
                       (^(((7'h43) ^~ wire177) ?
                           $signed(wire180) : $unsigned(wire182)))});
  assign wire189 = wire182;
  assign wire190 = wire182[(4'hb):(2'h3)];
  assign wire191 = ($signed(($unsigned($signed(wire178)) >= wire178[(3'h6):(2'h2)])) != wire178[(4'h9):(1'h1)]);
  always
    @(posedge clk) begin
      if ((wire184[(1'h1):(1'h1)] ?
          $signed(wire189[(1'h0):(1'h0)]) : {$signed(wire187[(3'h5):(3'h5)])}))
        begin
          reg192 <= (({(~^(|wire182)), (8'hb5)} ?
              $signed(($signed((8'hb3)) || $signed(wire180))) : wire189[(2'h3):(1'h1)]) < ({$signed((-wire182)),
                  wire190} ?
              wire188[(2'h2):(2'h2)] : (^(~^{wire179}))));
          if ($signed((~&{($signed(wire187) << wire187),
              (((8'hbe) >>> (7'h44)) * (8'hb2))})))
            begin
              reg193 <= (-reg192);
              reg194 <= {(~|$unsigned($unsigned($signed((8'ha3))))),
                  $signed(((~(wire178 >> (8'ha0))) ?
                      $signed(reg185[(1'h1):(1'h1)]) : (~^(&wire191))))};
            end
          else
            begin
              reg193 <= wire181[(3'h5):(3'h5)];
              reg194 <= ((($unsigned((-(8'ha2))) && wire177) ?
                      reg192 : (({wire177, wire177} || wire187) ?
                          wire186 : ((+wire178) == (!reg193)))) ?
                  wire183 : $signed($signed((&(wire182 > wire188)))));
              reg195 <= wire190;
              reg196 <= (~^wire177[(4'he):(4'hc)]);
              reg197 <= ((reg192[(1'h0):(1'h0)] ^~ $signed(((wire191 ?
                      (8'haa) : wire188) > $unsigned(reg193)))) ?
                  (~|$signed((~|wire181[(1'h0):(1'h0)]))) : {(^(8'hb7))});
            end
          if ((-(^~wire182)))
            begin
              reg198 <= ((~^(wire183[(2'h2):(1'h0)] != ($unsigned(wire191) ?
                      (wire188 ? wire179 : (8'hb3)) : (wire191 ?
                          wire182 : wire178)))) ?
                  ($unsigned(reg185) ?
                      $signed((wire178[(4'h8):(2'h2)] ?
                          (wire187 ?
                              wire183 : (8'hbb)) : reg192[(3'h7):(1'h0)])) : ((8'h9c) <= (wire183 ?
                          $unsigned((8'hba)) : wire189))) : wire189[(1'h0):(1'h0)]);
            end
          else
            begin
              reg198 <= ((wire181[(2'h3):(2'h3)] * ((reg185 ?
                          $signed(reg198) : reg194) ?
                      $signed(wire189[(2'h3):(2'h2)]) : reg192)) ?
                  $signed(((^(wire189 <= wire181)) * (+reg196[(2'h3):(1'h1)]))) : reg195);
              reg199 <= reg193;
              reg200 <= ({((~&(wire182 | (8'hae))) == wire178[(4'ha):(2'h3)]),
                  $signed(wire182[(2'h2):(2'h2)])} - wire187[(2'h3):(2'h2)]);
              reg201 <= (|(8'h9c));
              reg202 <= reg196[(2'h2):(1'h0)];
            end
          reg203 <= (($unsigned((8'hb8)) & ($unsigned((~&(8'hb0))) ?
              (-(~wire180)) : $signed((|reg197)))) >= $unsigned((|{$signed(reg192),
              (reg197 ? wire184 : (8'h9f))})));
          reg204 <= (($signed($signed(wire181)) ?
                  ((wire190 ? $signed(reg195) : reg197) ?
                      (wire182[(4'hc):(4'h8)] <<< (~|reg203)) : ((&wire178) ?
                          $signed((8'haa)) : wire190)) : $signed((|{wire190}))) ?
              $unsigned(((^~(^~reg192)) ?
                  wire181 : {wire179[(4'h8):(1'h1)]})) : ($signed($unsigned($unsigned(reg185))) == (wire180 ^~ wire181)));
        end
      else
        begin
          reg192 <= ({reg202} ? reg193 : reg204);
        end
      if ($unsigned((wire182[(4'hb):(1'h0)] + ((wire187 ?
              reg185[(1'h1):(1'h1)] : $signed(reg194)) ?
          ((reg198 ? reg193 : (8'hb7)) ^~ {reg199,
              (8'h9c)}) : (reg203[(4'hd):(2'h2)] & reg203[(4'hf):(4'ha)])))))
        begin
          reg205 <= (reg193[(4'h9):(3'h4)] ?
              ((wire188[(4'hf):(4'h8)] == ((reg200 ?
                      wire188 : (8'hbc)) != wire178)) ?
                  $signed((~(reg193 ? reg199 : (8'h9f)))) : (reg185 ?
                      reg200 : reg195)) : ((&reg193[(2'h3):(2'h2)]) > ((reg203[(4'h9):(3'h7)] & (reg200 * reg198)) ?
                  (~(reg201 || wire189)) : wire182[(4'ha):(4'h9)])));
          reg206 <= reg204[(3'h6):(1'h1)];
          reg207 <= $unsigned((($unsigned($signed(wire179)) ?
                  {(!reg197)} : ($signed((8'ha2)) ^~ $signed(reg206))) ?
              $unsigned(wire186) : wire179[(5'h12):(4'hc)]));
          if (({(reg205[(5'h11):(3'h7)] ?
                  $signed($unsigned(wire177)) : {$unsigned((8'haf))})} >= (~|wire191)))
            begin
              reg208 <= ($signed((reg205[(4'hb):(4'hb)] ^ {(reg203 | wire183)})) || $unsigned(wire179));
              reg209 <= reg185;
              reg210 <= $unsigned($signed({reg199}));
              reg211 <= wire180[(3'h4):(3'h4)];
            end
          else
            begin
              reg208 <= (8'hbd);
              reg209 <= {$unsigned(reg193)};
              reg210 <= $signed(wire183);
            end
        end
      else
        begin
          reg205 <= ($signed((($unsigned(wire187) ?
                      wire180[(3'h5):(2'h3)] : (wire191 | (8'had))) ?
                  reg207[(4'hd):(4'hb)] : (~^$signed(wire180)))) ?
              $unsigned(reg192[(1'h1):(1'h1)]) : (^wire177));
          reg206 <= (reg201 ?
              reg208[(4'h8):(2'h2)] : (($signed(((8'ha0) ? reg208 : reg196)) ?
                  ({wire179} ?
                      $unsigned(wire182) : (wire177 >> reg192)) : $signed(wire181[(3'h5):(1'h0)])) ^ (^~$signed($unsigned(reg199)))));
        end
      reg212 <= (~&reg201[(1'h1):(1'h1)]);
      reg213 <= wire184;
      if ({(~^reg199),
          $signed($signed(($unsigned(reg213) ?
              (reg192 ^ wire179) : (wire181 >= (8'h9f)))))})
        begin
          if (wire182)
            begin
              reg214 <= wire180[(1'h0):(1'h0)];
              reg215 <= reg206[(4'ha):(1'h1)];
              reg216 <= reg194[(3'h7):(1'h0)];
              reg217 <= ((~^$unsigned($signed((reg195 ?
                  (8'hab) : reg207)))) << $signed($unsigned($signed(wire184))));
            end
          else
            begin
              reg214 <= reg205;
            end
          reg218 <= (~|wire178[(1'h1):(1'h0)]);
          if (($unsigned((reg194[(5'h10):(4'h8)] ~^ reg196)) ?
              (reg185 < reg205) : (~$unsigned((^(reg211 ^~ (8'ha0)))))))
            begin
              reg219 <= (~|reg216[(4'h8):(3'h6)]);
              reg220 <= $unsigned(reg216[(3'h6):(1'h0)]);
              reg221 <= (reg185 ? $signed({(&$signed(reg192))}) : reg203);
              reg222 <= reg217;
            end
          else
            begin
              reg219 <= reg202[(3'h4):(3'h4)];
            end
          reg223 <= {wire180[(3'h4):(1'h0)],
              {(($signed((8'had)) ?
                      wire181[(4'he):(3'h4)] : $unsigned((8'ha5))) <= reg185[(1'h0):(1'h0)]),
                  $unsigned({reg202[(2'h3):(2'h2)], $unsigned(wire190)})}};
          reg224 <= (~^wire180[(3'h5):(2'h3)]);
        end
      else
        begin
          reg214 <= (!($signed((&(~&reg217))) <<< (~&(~&(~wire190)))));
        end
    end
  assign wire225 = reg213[(5'h10):(4'hc)];
  assign wire226 = ($unsigned($signed((8'hb7))) - {(((~&reg213) >>> $unsigned(wire177)) != ($signed((8'hae)) >> (wire190 ^~ (8'hbe)))),
                       {$unsigned((&reg201)),
                           (~^((8'had) ? reg215 : (8'had)))}});
  assign wire227 = $signed(((wire190 ?
                       (reg203 > (~^wire188)) : (reg185 ?
                           $unsigned(wire181) : $signed(reg195))) != reg203[(4'ha):(4'h9)]));
  assign wire228 = ((+(($unsigned(wire180) ?
                           (reg220 ?
                               (8'hb4) : wire227) : (|wire225)) ~^ reg208[(1'h0):(1'h0)])) ?
                       {($unsigned($unsigned(reg205)) ?
                               wire181[(4'he):(4'hc)] : ($signed(reg206) != $unsigned(reg206))),
                           (~$unsigned({wire226}))} : (+(^reg206)));
  assign wire229 = reg198;
  assign wire230 = $signed(((!$unsigned((wire178 ?
                       reg212 : reg220))) || wire228));
endmodule

module module147
#(parameter param164 = (((!{((8'hbb) * (8'had))}) ~^ ({(~^(8'hab))} >= (~|{(8'h9e)}))) >> (+({((8'ha2) ? (8'hb9) : (8'ha4)), {(8'ha5)}} ? {{(8'hba)}, {(8'hb3)}} : {(+(8'hb0))}))), 
parameter param165 = param164)
(y, clk, wire151, wire150, wire149, wire148);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire151;
  input wire [(4'hf):(1'h0)] wire150;
  input wire [(4'hb):(1'h0)] wire149;
  input wire signed [(5'h14):(1'h0)] wire148;
  wire signed [(3'h5):(1'h0)] wire163;
  wire signed [(4'hb):(1'h0)] wire161;
  wire signed [(3'h4):(1'h0)] wire160;
  wire signed [(5'h12):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire158;
  wire [(4'hb):(1'h0)] wire154;
  wire [(5'h13):(1'h0)] wire153;
  wire [(3'h4):(1'h0)] wire152;
  reg signed [(5'h14):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg157 = (1'h0);
  reg [(5'h12):(1'h0)] reg156 = (1'h0);
  reg [(4'hc):(1'h0)] reg155 = (1'h0);
  assign y = {wire163,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire154,
                 wire153,
                 wire152,
                 reg162,
                 reg157,
                 reg156,
                 reg155,
                 (1'h0)};
  assign wire152 = wire148[(3'h4):(3'h4)];
  assign wire153 = wire152;
  assign wire154 = wire151;
  always
    @(posedge clk) begin
      reg155 <= wire149;
      reg156 <= ($unsigned((8'hb6)) < $signed(((~|$signed(wire153)) ?
          wire151[(1'h0):(1'h0)] : wire152)));
      reg157 <= $signed(((7'h44) ?
          $signed($unsigned(wire148)) : ((8'hb6) != (~|wire150[(4'hd):(2'h2)]))));
    end
  assign wire158 = wire152;
  assign wire159 = (^~((!(~^(~&wire154))) <<< {(!(wire152 <<< wire149)),
                       (wire151 ?
                           ((8'hb4) ? wire152 : wire158) : $signed(wire149))}));
  assign wire160 = reg155[(4'h8):(4'h8)];
  assign wire161 = {reg155[(1'h1):(1'h1)], $unsigned(wire153)};
  always
    @(posedge clk) begin
      reg162 <= $signed($signed(wire151[(3'h5):(3'h4)]));
    end
  assign wire163 = (($signed(($signed(wire148) ?
                           $signed(wire159) : wire153[(1'h1):(1'h0)])) ^ reg156) ?
                       ($unsigned($unsigned((reg157 ?
                           wire152 : wire158))) >= (|$unsigned((&wire150)))) : ({((+(8'hb5)) ?
                                   (8'hbf) : $unsigned(wire150))} ?
                           reg155 : wire161[(4'ha):(2'h3)]));
endmodule
