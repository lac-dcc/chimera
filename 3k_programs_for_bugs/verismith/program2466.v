module top
#(parameter param116 = (((^~{(~&(8'hb3))}) ? ((~&((8'ha8) || (8'h9e))) ? ((-(8'ha2)) ? ((8'ha6) ? (8'ha0) : (7'h43)) : (+(8'hb5))) : {{(8'h9e)}, (-(7'h42))}) : ((~&((8'hb4) - (7'h43))) ? (+{(8'ha9)}) : (~^(^~(8'hb2))))) & ({((~^(8'hbb)) ^ {(7'h41), (8'hb1)}), (((8'hbc) & (8'hb8)) + ((8'hb1) || (8'h9e)))} ? (({(8'hbf), (8'h9f)} < ((7'h41) >>> (8'h9f))) ? (~&{(8'ha3), (8'hbd)}) : ({(8'had)} ? ((8'hb7) ? (8'hb9) : (8'hae)) : (+(8'ha7)))) : {(~|((7'h40) << (8'ha8)))})), 
parameter param117 = (((param116 ? (~(param116 < param116)) : ((~^param116) ? param116 : param116)) ~^ param116) >= ((param116 > {param116}) ? param116 : (((param116 ? param116 : param116) ^ param116) ? (((8'hbf) ? param116 : param116) >= (param116 ? param116 : param116)) : (!param116)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire signed [(3'h7):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  wire signed [(5'h14):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire106,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire5,
                 wire4,
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
                 reg6,
                 (1'h0)};
  assign wire4 = (wire0 ?
                     (($signed(wire1) - ($signed(wire3) & (&(8'h9d)))) ?
                         (&($unsigned(wire0) ?
                             wire3[(1'h0):(1'h0)] : wire3[(1'h0):(1'h0)])) : wire2) : {$signed($unsigned((7'h41))),
                         ($signed(wire1[(2'h2):(2'h2)]) ?
                             (8'ha4) : ($signed(wire0) ?
                                 wire3 : (wire1 ? wire2 : wire3)))});
  assign wire5 = $unsigned(((wire4[(3'h6):(1'h0)] != $signed(wire2)) >> $signed($unsigned(wire4[(3'h6):(3'h5)]))));
  always
    @(posedge clk) begin
      reg6 <= (8'hbb);
      reg7 <= wire0;
      reg8 <= {wire0};
      reg9 <= (+(reg7[(1'h0):(1'h0)] ?
          (wire2[(3'h5):(3'h5)] ^ (&((8'ha6) ? reg6 : wire5))) : (wire1 ?
              ({wire0, wire4} ? wire1 : wire1) : $signed($unsigned(reg8)))));
    end
  always
    @(posedge clk) begin
      if ((^~wire2[(3'h4):(2'h3)]))
        begin
          if (wire4)
            begin
              reg10 <= ($signed(reg9[(3'h7):(3'h4)]) <= ((wire5[(1'h0):(1'h0)] ?
                      {((7'h44) ? wire0 : wire0)} : (^(reg6 * wire5))) ?
                  $unsigned((8'hbf)) : (wire0[(1'h0):(1'h0)] | ($unsigned(reg6) < wire0[(2'h3):(1'h0)]))));
              reg11 <= $signed(reg7[(1'h1):(1'h1)]);
              reg12 <= $unsigned((!(&($unsigned(wire5) ?
                  $unsigned(reg7) : {wire0, wire4}))));
            end
          else
            begin
              reg10 <= reg11[(2'h2):(2'h2)];
            end
          if ($unsigned(reg11[(1'h1):(1'h0)]))
            begin
              reg13 <= ({wire3,
                  ($signed({reg7,
                      wire2}) < $signed($signed(reg11)))} - wire0[(1'h1):(1'h0)]);
              reg14 <= (wire2 ? wire4 : (8'hab));
            end
          else
            begin
              reg13 <= {reg10[(3'h7):(3'h4)]};
            end
        end
      else
        begin
          if ($signed($unsigned(reg10)))
            begin
              reg10 <= (~^{(~($unsigned(wire4) || (wire3 ? wire1 : reg11))),
                  wire3});
              reg11 <= $unsigned(wire2[(2'h3):(1'h1)]);
              reg12 <= wire3;
              reg13 <= ($unsigned({((wire3 ?
                      reg13 : reg8) <= (reg11 <<< reg10)),
                  {{reg6}, (reg11 >= reg10)}}) | reg14);
            end
          else
            begin
              reg10 <= ($signed(wire0) || reg11);
            end
          reg14 <= reg7[(2'h3):(1'h1)];
          reg15 <= $unsigned(wire4);
        end
      reg16 <= wire2;
      reg17 <= $signed(reg8[(3'h4):(1'h1)]);
      reg18 <= wire1[(1'h0):(1'h0)];
      if ($unsigned(reg16[(2'h2):(2'h2)]))
        begin
          if ({$unsigned(reg10[(3'h7):(3'h7)])})
            begin
              reg19 <= reg6;
              reg20 <= ({$unsigned({((8'hb6) || wire0)})} ?
                  $signed($unsigned((|$signed((8'hb6))))) : ($signed(reg8) ?
                      (+(reg9 | reg9[(2'h2):(1'h1)])) : reg13));
              reg21 <= (~|reg17);
              reg22 <= $signed($unsigned(((+(reg11 >> reg20)) ?
                  (~|(reg12 ? reg16 : (8'hb2))) : $signed($signed(wire5)))));
              reg23 <= {$signed({({wire4} ?
                          $signed(reg17) : (reg7 ? (8'hb7) : wire3)),
                      reg17[(3'h6):(2'h3)]}),
                  reg21};
            end
          else
            begin
              reg19 <= reg10[(2'h3):(1'h1)];
              reg20 <= $signed(reg19);
              reg21 <= ($unsigned($signed($unsigned({wire5}))) ?
                  $signed(reg16) : wire2[(4'h9):(2'h2)]);
            end
        end
      else
        begin
          reg19 <= $signed(reg18[(4'ha):(3'h5)]);
          reg20 <= (wire3 ?
              $unsigned($signed((~$unsigned(wire0)))) : (&((8'hb5) <<< ({wire3,
                      wire1} ?
                  reg21 : $unsigned(wire4)))));
        end
    end
  assign wire24 = wire2;
  assign wire25 = $unsigned(reg7);
  assign wire26 = $signed({reg21[(4'h8):(3'h4)]});
  assign wire27 = $signed(($unsigned(((^~reg11) && $signed(reg21))) ?
                      reg22 : $unsigned($signed($unsigned(wire26)))));
  module28 #() modinst107 (.wire31(reg19), .wire29(reg10), .wire32(reg17), .wire30(reg8), .y(wire106), .clk(clk));
  assign wire108 = ($unsigned((reg19 + wire106)) >= ((~|$unsigned({wire25})) ?
                       ($signed(reg12) ?
                           ((reg15 ?
                               reg11 : reg22) >> (reg15 >>> reg14)) : wire1[(1'h0):(1'h0)]) : $unsigned($signed(wire25))));
  assign wire109 = reg10;
  assign wire110 = reg14[(1'h1):(1'h0)];
  assign wire111 = (!reg8[(3'h6):(3'h6)]);
  assign wire112 = $signed(reg18[(4'he):(3'h4)]);
  assign wire113 = $unsigned((|(((wire24 ? wire108 : wire110) ?
                           $unsigned(reg21) : (reg10 ? wire109 : reg23)) ?
                       (reg11[(1'h0):(1'h0)] ?
                           reg17[(3'h6):(3'h5)] : $unsigned(wire26)) : (-$signed(reg16)))));
  assign wire114 = wire26[(4'he):(3'h4)];
  assign wire115 = $signed($signed({$unsigned((wire110 >= reg10)),
                       (reg16 <<< (wire2 ? wire106 : wire1))}));
endmodule

module module28  (y, clk, wire29, wire30, wire31, wire32);
  output wire [(32'h201):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire29;
  input wire signed [(4'ha):(1'h0)] wire30;
  input wire [(2'h3):(1'h0)] wire31;
  input wire signed [(3'h5):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  wire [(4'hf):(1'h0)] wire103;
  wire signed [(4'hc):(1'h0)] wire102;
  wire [(4'h9):(1'h0)] wire101;
  wire signed [(5'h12):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire98;
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire35,
                 wire36,
                 wire51,
                 wire52,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire98,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg55,
                 reg54,
                 reg53,
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
                 reg34,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg33 <= wire32[(2'h3):(1'h1)];
      reg34 <= (8'hba);
    end
  assign wire35 = (wire30 >>> wire30[(3'h5):(1'h1)]);
  assign wire36 = (!($signed($signed($signed(reg33))) ?
                      {reg34[(1'h1):(1'h0)]} : ($unsigned({wire32,
                          wire29}) >> (~^wire35[(4'hd):(3'h6)]))));
  always
    @(posedge clk) begin
      if ((^~((($unsigned(reg34) ?
              (reg33 ? (8'ha0) : reg33) : $signed(wire36)) | (!(8'hbb))) ?
          wire36 : (~&(8'ha6)))))
        begin
          reg37 <= (~|(wire31 ^ {reg34, wire31[(1'h1):(1'h0)]}));
          reg38 <= ((8'had) >= ((($unsigned(wire31) <= wire35[(4'he):(4'hc)]) + wire29[(4'hb):(3'h6)]) ?
              wire29[(3'h5):(1'h0)] : ((!(^~reg34)) || (reg33 || ((8'had) << wire30)))));
          reg39 <= $signed({{{(reg38 << (8'ha5))}}});
          reg40 <= (+reg33[(1'h1):(1'h0)]);
          reg41 <= wire31[(1'h1):(1'h0)];
        end
      else
        begin
          reg37 <= $unsigned($signed({{$unsigned(wire32),
                  wire29[(4'h8):(4'h8)]}}));
        end
      if (((((wire36 ? reg37 : $signed(reg38)) ?
              {reg40} : wire36[(3'h4):(1'h0)]) ?
          ((reg39[(2'h2):(1'h0)] * $signed((8'hbc))) ?
              (8'hb3) : {reg34}) : reg38) + (reg34[(4'hd):(1'h1)] + wire30[(2'h2):(1'h1)])))
        begin
          reg42 <= wire32;
          reg43 <= $signed($signed(wire36[(1'h1):(1'h1)]));
        end
      else
        begin
          if ((-reg33[(1'h0):(1'h0)]))
            begin
              reg42 <= (8'haf);
              reg43 <= ({{reg42}} ?
                  (wire30 ?
                      (reg37[(1'h1):(1'h1)] ?
                          $unsigned({reg38,
                              wire32}) : wire32[(2'h2):(1'h1)]) : (~|($signed((8'h9f)) >>> {reg37}))) : reg34[(3'h6):(3'h6)]);
            end
          else
            begin
              reg42 <= ({$signed(($unsigned(wire36) >> $signed((8'hb9))))} ?
                  wire30 : (($signed((~reg38)) > ((wire30 == reg43) != (^(8'hba)))) ?
                      (((wire30 ^ reg43) ?
                              (reg41 + reg39) : wire36[(2'h3):(2'h2)]) ?
                          wire31[(2'h2):(2'h2)] : $signed((reg33 ?
                              wire31 : (8'ha8)))) : ($signed(wire29[(3'h6):(3'h6)]) ?
                          (+wire29) : reg43)));
              reg43 <= reg33[(1'h0):(1'h0)];
              reg44 <= (~(($signed((~&(8'hb0))) ?
                  $signed($signed(wire31)) : ($unsigned(reg33) ?
                      (~&wire32) : wire35)) != ({$unsigned((7'h41)),
                  $unsigned((8'hb2))} <= ((reg39 >= wire32) ?
                  reg40 : (!(8'ha5))))));
            end
          reg45 <= ((~|$unsigned(wire31)) ?
              $signed($signed({((7'h42) ? reg42 : reg43),
                  (reg41 ?
                      reg43 : reg33)})) : ((reg40 - (~^$unsigned(reg33))) <= (8'h9f)));
        end
      reg46 <= {{reg39[(4'hb):(1'h0)]}};
      reg47 <= (reg42 != reg39);
      reg48 <= $unsigned(((&(+wire36)) ?
          wire36 : (&{reg45[(4'h8):(2'h3)], $unsigned(reg43)})));
    end
  always
    @(posedge clk) begin
      reg49 <= (($unsigned({(-reg41), (8'hae)}) ?
              wire29 : (&(reg40 && wire31))) ?
          ((wire35 & ($unsigned(reg38) ?
                  $unsigned(reg39) : (wire36 + (8'hba)))) ?
              (reg34 ?
                  (~|(reg47 | reg41)) : reg47) : $signed(((|reg37) >>> $signed(reg47)))) : ((~&((8'hb0) != $signed(reg33))) ?
              wire32[(2'h2):(1'h0)] : reg48));
      reg50 <= $signed(reg45);
    end
  assign wire51 = {reg49[(3'h5):(2'h2)], reg38[(4'hb):(4'h9)]};
  assign wire52 = {(8'hb7),
                      ($unsigned(reg34[(4'ha):(2'h2)]) || $signed($unsigned($unsigned(wire32))))};
  always
    @(posedge clk) begin
      reg53 <= (^(~&reg49[(4'hf):(4'hd)]));
      reg54 <= $unsigned(reg41);
      reg55 <= $unsigned((reg37 * $unsigned(reg53)));
    end
  assign wire56 = {reg54, (&{(~$unsigned((7'h43))), $signed(reg41)})};
  assign wire57 = wire52[(4'he):(4'he)];
  assign wire58 = reg33;
  assign wire59 = {((7'h44) ?
                          $unsigned(reg34[(3'h5):(2'h3)]) : ($signed((wire57 >> reg37)) & $signed((reg33 ?
                              reg38 : wire51)))),
                      (reg48 <<< ($unsigned($unsigned((8'had))) != $unsigned((reg54 && wire35))))};
  assign wire60 = ($signed(($signed($signed(reg42)) ?
                      (|wire31) : (reg37 != $signed((8'hbd))))) & (($unsigned((reg37 - reg43)) ?
                      ((~&reg37) >> $signed(wire32)) : ($unsigned(wire31) ?
                          reg41 : $signed(wire29))) < $signed((~&(wire52 ?
                      reg44 : wire36)))));
  assign wire61 = {wire35};
  always
    @(posedge clk) begin
      reg62 <= (~^$unsigned(wire35));
      reg63 <= {((((+reg54) <<< (~^wire36)) | $signed((-reg38))) > (reg43[(2'h3):(2'h3)] || (~|(wire58 * (8'ha8)))))};
      reg64 <= (({($signed(wire52) < $signed(reg40))} ?
              ($signed($signed(reg40)) ?
                  ($unsigned(reg50) ?
                      wire59 : $signed(wire56)) : ($signed(reg33) <= (reg41 ?
                      wire61 : reg34))) : reg54[(4'hc):(1'h1)]) ?
          $signed($signed(wire56)) : $unsigned(wire51[(2'h2):(2'h2)]));
      reg65 <= $signed((reg46 || $unsigned((~$signed(wire60)))));
    end
  module66 #() modinst99 (wire98, clk, wire52, wire36, reg63, reg53, wire35);
  assign wire100 = $unsigned((&$signed($signed((reg42 ? wire57 : wire61)))));
  assign wire101 = {(reg53 ?
                           {reg41[(4'ha):(3'h7)]} : (~&({wire100} ?
                               $unsigned(wire31) : (~^reg42))))};
  assign wire102 = $signed((8'hbe));
  assign wire103 = {(~|(reg39[(5'h13):(4'hb)] ?
                           wire61[(4'hf):(4'hc)] : $signed($unsigned(reg50))))};
  assign wire104 = $unsigned($signed($unsigned({reg34})));
  assign wire105 = ((reg49 ?
                           (reg39[(5'h12):(1'h1)] ?
                               reg42[(1'h0):(1'h0)] : (reg42[(2'h2):(1'h0)] ?
                                   wire52[(3'h4):(1'h0)] : (wire30 ?
                                       (8'hb6) : wire31))) : $unsigned($signed((reg65 >> reg48)))) ?
                       $signed({(wire29[(4'h9):(3'h5)] - (reg37 ?
                               reg49 : wire101)),
                           wire30}) : reg55);
endmodule

module module66
#(parameter param96 = ({{((~|(8'hac)) + (^~(8'ha7)))}} ? ({(^((8'hbf) + (8'hac))), (((8'hb8) ? (8'hb4) : (8'ha8)) || (8'hb3))} ? {{((7'h41) ? (8'hbe) : (7'h43)), (&(8'ha8))}} : (&((-(7'h40)) ? ((8'ha4) << (8'h9d)) : ((8'ha2) ? (8'hb5) : (8'h9e))))) : (~^(^(^~(~&(8'hbc)))))), 
parameter param97 = (((^(|param96)) ? {((!param96) * (param96 == param96)), {param96}} : param96) ? param96 : (((~(param96 ? param96 : param96)) >> param96) ? param96 : ((~&{param96, param96}) ? ((param96 >>> (8'h9f)) ~^ (!param96)) : (~|(param96 && param96))))))
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire71;
  input wire [(3'h4):(1'h0)] wire70;
  input wire [(4'hc):(1'h0)] wire69;
  input wire [(4'h9):(1'h0)] wire68;
  input wire [(4'hc):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire [(2'h2):(1'h0)] wire73;
  wire signed [(4'ha):(1'h0)] wire72;
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire72 = wire68[(3'h5):(1'h1)];
  assign wire73 = {((((wire68 ? wire67 : wire71) ?
                              (wire68 <<< wire68) : $unsigned(wire71)) ?
                          (wire68[(2'h2):(1'h0)] ?
                              wire67[(3'h7):(3'h5)] : (wire69 ?
                                  (8'hb4) : (8'ha4))) : (((8'haf) > (8'h9d)) || wire71[(4'h9):(1'h0)])) <= (~|wire67))};
  assign wire74 = wire71[(1'h0):(1'h0)];
  assign wire75 = (8'hab);
  assign wire76 = $signed((+(wire72 | wire71)));
  assign wire77 = ((wire71[(3'h7):(3'h7)] <= ($unsigned(wire69) < (~$signed(wire71)))) ?
                      (wire67[(2'h3):(2'h3)] ?
                          $signed(wire67[(4'h8):(4'h8)]) : wire67[(4'hb):(4'hb)]) : $unsigned($unsigned(wire73[(1'h1):(1'h0)])));
  assign wire78 = {wire69};
  always
    @(posedge clk) begin
      reg79 <= $unsigned((8'hb5));
      reg80 <= (~^(~|wire74[(1'h1):(1'h0)]));
    end
  assign wire81 = ($signed(((~^wire67[(4'hc):(4'h9)]) & ((+wire68) == (wire73 ?
                      wire68 : wire73)))) * ((($unsigned((8'h9c)) ?
                          wire67 : (wire67 >> wire67)) ?
                      (-wire75[(2'h3):(1'h1)]) : wire68[(2'h3):(1'h0)]) ~^ ((~&wire68) ?
                      ((wire75 ^ wire69) < (wire73 ?
                          wire68 : wire73)) : (|{wire75, wire73}))));
  assign wire82 = (wire68 << wire72);
  assign wire83 = $signed(wire82);
  assign wire84 = wire68;
  assign wire85 = wire68[(3'h4):(3'h4)];
  assign wire86 = wire78;
  always
    @(posedge clk) begin
      reg87 <= (8'ha0);
      if (wire71)
        begin
          reg88 <= ($unsigned(wire86[(2'h3):(2'h2)]) ?
              wire77[(1'h0):(1'h0)] : ({(~reg80)} <= $unsigned(reg87[(3'h4):(1'h1)])));
          reg89 <= $unsigned((&$unsigned(reg88[(3'h4):(1'h1)])));
          reg90 <= {$unsigned((~|$signed(reg88[(4'he):(4'hb)])))};
          reg91 <= ($signed($signed((reg87[(2'h2):(1'h1)] >> (reg79 ?
                  wire82 : (8'h9e))))) ?
              wire83 : $unsigned((~|wire85)));
          reg92 <= wire73[(2'h2):(2'h2)];
        end
      else
        begin
          reg88 <= reg91[(3'h4):(2'h2)];
          reg89 <= $unsigned((reg88 >= $unsigned(({reg79, wire73} - {wire74,
              (8'hba)}))));
        end
      reg93 <= {((($signed(reg88) ? $signed(reg89) : $unsigned((7'h42))) ?
              (^~{reg91}) : $unsigned($unsigned(reg91))) & (!wire84[(1'h0):(1'h0)]))};
    end
  assign wire94 = wire69[(2'h3):(2'h2)];
  assign wire95 = (&$unsigned(($signed((-reg79)) ?
                      $signed($signed((8'hb9))) : ((~wire82) ?
                          (wire70 & wire68) : (reg92 >>> wire85)))));
endmodule
