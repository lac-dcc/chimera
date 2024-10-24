module top #(parameter param168 = (7'h40)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire167;
  wire [(5'h15):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire118;
  wire [(3'h5):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire123;
  wire signed [(3'h4):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire165;
  reg [(5'h15):(1'h0)] reg4 = (1'h0);
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  assign y = {wire167,
                 wire111,
                 wire18,
                 wire17,
                 wire117,
                 wire118,
                 wire119,
                 wire120,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire165,
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
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire0[(2'h3):(2'h2)];
      reg5 <= (~|$unsigned(($signed($signed(wire2)) - $signed($unsigned(wire2)))));
      if (wire1[(1'h1):(1'h1)])
        begin
          reg6 <= (~{$signed(wire3)});
          reg7 <= reg4;
        end
      else
        begin
          if ((~|(+$unsigned((~reg4[(4'hc):(4'h8)])))))
            begin
              reg6 <= {(~{$unsigned(reg7[(2'h3):(1'h1)])}),
                  wire0[(3'h7):(2'h2)]};
              reg7 <= {((~&$unsigned((wire2 * reg5))) * $signed((+{wire1,
                      reg4})))};
            end
          else
            begin
              reg6 <= wire0;
              reg7 <= $unsigned({{{reg7, (wire3 <= reg5)}}});
              reg8 <= (8'ha0);
              reg9 <= reg6;
              reg10 <= $unsigned({($signed((wire2 ? wire2 : (7'h43))) ?
                      (~|wire0) : {reg7, wire0[(4'ha):(4'ha)]})});
            end
          reg11 <= reg5;
          reg12 <= (~|reg6);
          if ({((8'hb4) >= (!$signed((~|wire3))))})
            begin
              reg13 <= ((&($signed((wire0 >> reg11)) >> reg9)) ?
                  (reg10[(4'hc):(4'h8)] ^~ wire2[(2'h3):(1'h0)]) : $unsigned(reg10));
              reg14 <= (reg10[(3'h4):(3'h4)] ?
                  $signed(({reg12,
                      reg7[(4'h9):(3'h5)]} || reg7)) : reg7[(4'h8):(3'h4)]);
              reg15 <= $signed((wire3[(3'h6):(1'h1)] < reg9));
            end
          else
            begin
              reg13 <= (!$signed(reg11[(3'h5):(2'h2)]));
              reg14 <= $unsigned((+($signed(wire0[(4'ha):(4'h9)]) ?
                  ($unsigned(reg9) ?
                      (reg8 <= reg9) : (reg5 || (8'h9c))) : $signed($signed(reg4)))));
              reg15 <= ({wire2[(2'h3):(2'h2)]} ?
                  reg10 : {(|$signed($unsigned(reg7))),
                      ({(wire3 & reg8)} ?
                          ($unsigned(wire1) ?
                              $signed(reg11) : $signed(wire0)) : reg11)});
            end
          reg16 <= (!{(&$signed((reg11 && wire3)))});
        end
    end
  assign wire17 = ($unsigned(reg15[(1'h1):(1'h1)]) ~^ {$signed(reg6[(4'h9):(4'h9)])});
  assign wire18 = ($unsigned(wire2) > $signed((^$signed($signed((8'hb5))))));
  module19 #() modinst112 (.wire21(wire3), .y(wire111), .wire20(wire17), .wire24(reg11), .wire23(reg4), .wire22(wire2), .clk(clk));
  always
    @(posedge clk) begin
      reg113 <= (|reg15[(1'h0):(1'h0)]);
      reg114 <= $unsigned(wire17);
      reg115 <= ((8'hb2) ?
          wire3[(4'h8):(1'h1)] : $unsigned((|$signed((8'ha2)))));
      reg116 <= reg8;
    end
  assign wire117 = $unsigned(reg116[(3'h4):(3'h4)]);
  assign wire118 = $signed(wire2);
  assign wire119 = (8'haf);
  assign wire120 = {(($unsigned({wire111,
                           reg6}) != $unsigned($signed(reg8))) && ($signed((~reg13)) ?
                           wire0[(4'h9):(4'h9)] : reg11[(3'h7):(3'h7)])),
                       reg14};
  assign wire121 = reg15[(1'h0):(1'h0)];
  assign wire122 = (-reg12[(3'h6):(3'h4)]);
  assign wire123 = (reg11 ?
                       $unsigned(reg7[(5'h11):(4'hf)]) : (wire0[(3'h7):(1'h1)] != $signed((8'ha1))));
  assign wire124 = ($unsigned(wire118) ?
                       (^$signed(((reg116 > reg14) ?
                           (-reg6) : (~|reg13)))) : (8'hbe));
  module125 #() modinst166 (.clk(clk), .wire127(reg16), .y(wire165), .wire128(reg4), .wire126(wire121), .wire129(reg12));
  assign wire167 = {(reg113 ^ $unsigned((~^reg10[(1'h1):(1'h0)]))),
                       (reg10[(3'h7):(1'h0)] && wire2[(5'h10):(4'he)])};
endmodule

module module125  (y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire129;
  input wire [(4'hb):(1'h0)] wire128;
  input wire [(4'hf):(1'h0)] wire127;
  input wire [(5'h13):(1'h0)] wire126;
  wire [(5'h13):(1'h0)] wire164;
  wire signed [(5'h11):(1'h0)] wire162;
  wire [(3'h5):(1'h0)] wire135;
  wire signed [(5'h12):(1'h0)] wire134;
  wire [(4'hf):(1'h0)] wire133;
  wire signed [(4'hb):(1'h0)] wire132;
  wire signed [(2'h2):(1'h0)] wire131;
  wire [(4'h8):(1'h0)] wire130;
  assign y = {wire164,
                 wire162,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 (1'h0)};
  assign wire130 = $unsigned($unsigned((((&wire129) ?
                       (wire129 == wire127) : wire126[(2'h2):(1'h0)]) <<< $unsigned($unsigned((7'h44))))));
  assign wire131 = (~^$signed($signed((wire130[(3'h5):(1'h0)] ?
                       wire128 : (8'hbf)))));
  assign wire132 = $unsigned((|{$unsigned((wire130 || wire127))}));
  assign wire133 = (8'hba);
  assign wire134 = $unsigned((($signed((wire133 ?
                           wire132 : wire126)) ^ (+$signed(wire131))) ?
                       (&$signed((8'ha4))) : (wire129[(4'hb):(1'h0)] ?
                           (~&$signed(wire126)) : (wire131 ?
                               $unsigned(wire126) : ((8'haa) ?
                                   wire132 : wire130)))));
  assign wire135 = {(8'hb0)};
  module136 #() modinst163 (wire162, clk, wire132, wire134, wire126, wire130);
  assign wire164 = (~^{(|wire130[(2'h2):(1'h0)]),
                       ({$unsigned(wire128), wire126} + ($signed(wire131) ?
                           $signed(wire133) : ((8'hb5) ? wire131 : wire133)))});
endmodule

module module19
#(parameter param109 = ({((-{(8'hb9), (8'ha7)}) ? (8'hae) : {{(8'hb1)}, (&(8'hb3))})} ? (~|(~&((8'hb1) || ((8'ha0) ? (8'h9c) : (8'ha7))))) : (~^(({(8'ha5), (8'hbc)} << (8'hb2)) * {((8'ha2) ? (7'h40) : (8'h9f))}))), 
parameter param110 = ((!(+((param109 ? param109 : param109) && {(8'ha8)}))) | param109))
(y, clk, wire20, wire21, wire22, wire23, wire24);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire22;
  input wire signed [(5'h15):(1'h0)] wire23;
  input wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire108;
  wire [(5'h12):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire106;
  wire [(2'h3):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire101;
  wire [(3'h4):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire98;
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire102,
                 wire101,
                 wire100,
                 wire79,
                 wire81,
                 wire82,
                 wire98,
                 reg104,
                 reg103,
                 (1'h0)};
  module25 #() modinst80 (.clk(clk), .wire29(wire24), .wire28(wire21), .wire27(wire23), .y(wire79), .wire26(wire20));
  assign wire81 = ((~^$signed((!(-wire79)))) << wire79);
  assign wire82 = (~^$signed(((-$unsigned(wire22)) ?
                      (^~wire24[(4'hd):(4'hc)]) : (~&wire22[(4'ha):(3'h7)]))));
  module83 #() modinst99 (wire98, clk, wire82, wire79, wire22, wire23, wire81);
  assign wire100 = $unsigned($unsigned($signed($signed({wire81, wire79}))));
  assign wire101 = $signed(wire79);
  assign wire102 = $signed({(wire23[(4'hf):(2'h3)] << {$unsigned(wire82)}),
                       wire81});
  always
    @(posedge clk) begin
      reg103 <= $unsigned({(wire24 && $unsigned((wire20 ^~ wire24)))});
      reg104 <= {(8'hb4), {$signed(wire22)}};
    end
  assign wire105 = reg103;
  assign wire106 = $signed((wire20[(2'h2):(1'h0)] ?
                       wire23[(4'hf):(4'ha)] : $unsigned(wire101[(4'h9):(1'h0)])));
  assign wire107 = (~($signed(wire22) && ($unsigned($unsigned(reg103)) ~^ wire98)));
  assign wire108 = (^(~^($signed({wire106, wire82}) ?
                       $unsigned({(8'hb3)}) : wire82[(2'h3):(1'h1)])));
endmodule

module module83
#(parameter param96 = ((!(((-(8'hbb)) + ((8'hb2) - (8'hb9))) ~^ ({(8'hbd), (8'hb7)} != (8'hab)))) + (~&({((8'ha5) != (7'h42)), (^(7'h43))} * (((8'hb9) ? (8'h9d) : (8'haa)) & ((8'ha7) ? (8'ha2) : (8'h9c)))))), 
parameter param97 = ((((-(param96 ? param96 : param96)) == ((param96 ? param96 : param96) ? (~&param96) : (param96 <= param96))) || (8'ha4)) ? {(~(&param96)), {((param96 < param96) | (param96 ? param96 : param96)), param96}} : (7'h40)))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire88;
  input wire signed [(5'h13):(1'h0)] wire87;
  input wire [(3'h5):(1'h0)] wire86;
  input wire signed [(4'h9):(1'h0)] wire85;
  input wire signed [(5'h12):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire90;
  wire signed [(2'h2):(1'h0)] wire89;
  assign y = {wire95, wire94, wire93, wire92, wire91, wire90, wire89, (1'h0)};
  assign wire89 = $unsigned(wire86[(2'h3):(1'h1)]);
  assign wire90 = $unsigned(((wire84[(3'h6):(1'h0)] ? (~&(~&wire86)) : wire85) ?
                      ((8'hac) ?
                          $signed((~(7'h44))) : ($unsigned(wire89) != $unsigned(wire86))) : {$unsigned((wire89 > wire87)),
                          $unsigned(wire85)}));
  assign wire91 = (wire90 ?
                      {(($unsigned(wire84) > (wire89 || wire88)) == $signed($unsigned(wire87)))} : $signed(($unsigned($signed(wire85)) ?
                          (^$unsigned(wire87)) : wire89)));
  assign wire92 = ($signed(wire86[(1'h0):(1'h0)]) & $unsigned($signed(({wire89,
                      wire85} << (wire91 & wire85)))));
  assign wire93 = wire85[(3'h4):(2'h2)];
  assign wire94 = wire91;
  assign wire95 = (^~$signed(((8'hbf) ?
                      wire89 : $unsigned($unsigned(wire88)))));
endmodule

module module25
#(parameter param78 = (8'hb0))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire [(5'h12):(1'h0)] wire28;
  input wire [(5'h15):(1'h0)] wire27;
  input wire signed [(4'ha):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire51,
                 wire50,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg77,
                 reg74,
                 reg73,
                 reg72,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
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
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg30 <= wire29[(2'h2):(2'h2)];
    end
  assign wire31 = wire26;
  assign wire32 = (|(7'h42));
  assign wire33 = wire27[(3'h6):(2'h3)];
  assign wire34 = (~|($signed(($unsigned(wire28) & (wire27 ? wire29 : reg30))) ?
                      reg30 : $unsigned((8'hab))));
  assign wire35 = wire31[(2'h2):(1'h0)];
  assign wire36 = ($unsigned(((8'h9f) | (wire35[(2'h3):(2'h3)] ?
                          wire34 : wire33[(2'h3):(1'h0)]))) ?
                      ((((!wire35) <<< (&(8'hae))) ~^ ({wire32} > $signed(wire26))) ?
                          $signed($signed(wire33[(2'h3):(1'h0)])) : ((!(wire29 ?
                                  reg30 : wire31)) ?
                              $unsigned({wire32,
                                  reg30}) : wire34[(4'hc):(2'h3)])) : (-(8'hbf)));
  assign wire37 = (^({(wire29 << (wire26 ^ (8'hbd)))} ?
                      wire27 : ({(wire32 ? (8'hb4) : wire27), wire28} ?
                          wire35 : $unsigned((wire28 ^~ wire34)))));
  always
    @(posedge clk) begin
      if (($signed(($unsigned(wire31[(1'h1):(1'h0)]) - wire31)) ?
          ((((7'h40) ? wire34 : wire35[(1'h0):(1'h0)]) ?
                  $unsigned({(8'hac)}) : $signed((-(7'h42)))) ?
              (wire26[(2'h3):(1'h1)] >> $unsigned((wire36 ?
                  wire34 : wire35))) : (^($unsigned(wire31) >> {wire27,
                  wire33}))) : wire34[(4'hc):(1'h1)]))
        begin
          if (((~|(~$signed((|wire34)))) ?
              $unsigned(wire31[(1'h1):(1'h1)]) : {((8'hbe) ?
                      (~&(!wire34)) : (((8'had) ?
                          reg30 : wire26) >> (wire33 + (8'hb4)))),
                  wire29}))
            begin
              reg38 <= $signed((wire34[(4'hc):(4'h9)] ?
                  reg30[(1'h0):(1'h0)] : wire33[(2'h2):(2'h2)]));
              reg39 <= {$unsigned(wire35)};
              reg40 <= ((~^wire28) ? $unsigned((^(!(!wire33)))) : wire29);
              reg41 <= $signed(wire33[(1'h0):(1'h0)]);
              reg42 <= $unsigned(wire34);
            end
          else
            begin
              reg38 <= (reg30 >= reg42);
              reg39 <= (|(!(8'ha9)));
              reg40 <= (((wire36 == ((!wire28) - (&wire29))) ?
                      ((^$signed((8'h9f))) ?
                          $unsigned(wire29) : $unsigned($signed((8'hb2)))) : (((wire33 ?
                              wire37 : wire35) ?
                          (reg41 ?
                              (8'haa) : reg39) : (reg38 * reg38)) * (wire29 ?
                          ((8'hbe) ? wire34 : (8'hbf)) : {wire34}))) ?
                  $unsigned(({$unsigned(wire29)} <<< wire26)) : wire35);
              reg41 <= $signed($signed({$unsigned(wire31),
                  wire33[(1'h1):(1'h1)]}));
              reg42 <= wire27;
            end
          reg43 <= ((&reg39) - (~^(^((^reg38) & (wire27 ? reg41 : wire37)))));
          reg44 <= {(wire26[(3'h4):(3'h4)] & (&((wire34 | wire29) ?
                  $unsigned(reg42) : ((8'hb3) << wire29)))),
              (-{reg40[(1'h0):(1'h0)], $unsigned((&wire35))})};
          reg45 <= $signed($signed({reg44[(2'h3):(1'h0)], wire37}));
        end
      else
        begin
          reg38 <= (!{reg43});
        end
      reg46 <= (wire36[(3'h5):(2'h2)] <= $unsigned(((((8'hb5) ?
              wire28 : wire34) >> wire37[(4'h9):(3'h6)]) ?
          wire36 : $signed($unsigned(reg42)))));
    end
  always
    @(posedge clk) begin
      reg47 <= wire27;
      reg48 <= (((((8'ha4) ? (reg39 && wire27) : {reg44}) ?
                  (wire27 ?
                      (wire29 && reg43) : {(8'hac),
                          reg30}) : {reg47[(1'h0):(1'h0)]}) ?
              wire28 : $unsigned($unsigned($signed(wire26)))) ?
          (~^reg42) : ($unsigned($signed(wire27[(5'h12):(5'h10)])) ~^ (8'ha8)));
      reg49 <= $signed((^~(~^(|$signed(reg40)))));
    end
  assign wire50 = $unsigned((wire33[(2'h3):(2'h3)] + (((wire31 >= reg49) * (!wire33)) | $signed((~&(8'hb3))))));
  assign wire51 = {{{$signed(wire26)}}};
  always
    @(posedge clk) begin
      if ((|(reg45 ?
          (((wire32 ? reg40 : wire32) ?
                  $signed(wire33) : reg39[(1'h1):(1'h1)]) ?
              ((reg41 ? reg48 : reg47) ^~ (wire34 ?
                  wire28 : wire32)) : wire35) : $signed({reg39}))))
        begin
          reg52 <= reg30[(1'h1):(1'h1)];
          reg53 <= ((reg48[(4'hb):(4'ha)] ?
                  $signed(($signed(reg41) != $unsigned(reg41))) : wire35[(1'h0):(1'h0)]) ?
              $signed(wire27) : $unsigned((reg46 || $signed((wire31 >> reg30)))));
          if ({(wire31 << $unsigned(((^reg43) ?
                  $unsigned((8'h9f)) : wire26[(2'h3):(1'h1)]))),
              {(+wire26[(3'h6):(2'h2)])}})
            begin
              reg54 <= reg47[(3'h4):(3'h4)];
              reg55 <= reg45;
              reg56 <= (($unsigned(wire51[(1'h0):(1'h0)]) & (^($signed(reg42) ?
                      $unsigned(wire33) : (reg47 ? wire34 : (8'hb3))))) ?
                  wire32 : wire37);
            end
          else
            begin
              reg54 <= reg39[(1'h0):(1'h0)];
              reg55 <= $unsigned(wire27);
              reg56 <= (!(-(^(wire27 ? $signed(wire37) : (+wire36)))));
              reg57 <= reg56[(2'h2):(1'h1)];
              reg58 <= wire50;
            end
          reg59 <= ((+$signed(((^wire50) ? (^wire37) : (reg42 ^ reg54)))) ?
              $unsigned(reg41[(3'h5):(2'h2)]) : {((&$unsigned(wire50)) ^~ ((^wire50) ?
                      (reg38 ? wire26 : wire31) : $signed(reg45)))});
        end
      else
        begin
          reg52 <= reg45;
          reg53 <= (^{$unsigned(((-wire32) < wire33)),
              $signed($unsigned((!(8'haf))))});
          if (((~$unsigned($signed((reg55 & reg52)))) ?
              ($unsigned($signed((&wire37))) ^~ {({reg48, reg45} ?
                      $signed(wire31) : (reg57 ?
                          reg47 : wire34))}) : ($unsigned($signed((wire34 ?
                      reg48 : wire28))) ?
                  reg52[(3'h7):(3'h6)] : {$unsigned((wire28 ? reg56 : reg41)),
                      $signed((&wire34))})))
            begin
              reg54 <= reg47[(1'h0):(1'h0)];
              reg55 <= reg57[(3'h4):(2'h2)];
              reg56 <= reg56;
            end
          else
            begin
              reg54 <= $unsigned((8'ha1));
            end
          reg57 <= {($unsigned($signed($signed(wire35))) ?
                  ((8'hbb) ^ reg59[(4'hb):(3'h7)]) : (^(~|(+reg42))))};
        end
      reg60 <= reg40;
      reg61 <= (|$unsigned($unsigned(wire31[(2'h2):(2'h2)])));
      if (({$unsigned(reg41[(2'h3):(1'h0)])} ?
          (-wire31[(1'h0):(1'h0)]) : wire31[(1'h0):(1'h0)]))
        begin
          reg62 <= ($unsigned(reg42) == ((~^((wire31 ? wire34 : reg47) ?
              $unsigned(wire32) : ((8'hb2) < (8'h9e)))) ~^ ((+{wire35,
              wire50}) < (reg57 ? (-reg58) : (~|reg54)))));
          reg63 <= ({($unsigned($unsigned(wire26)) >>> $unsigned((~^reg45))),
              {wire29,
                  reg46}} + (reg55[(1'h0):(1'h0)] ~^ $unsigned(((^wire35) >>> $unsigned(reg53)))));
          reg64 <= reg44;
          reg65 <= $unsigned(wire29);
          if ((reg58 >= (reg56[(2'h2):(1'h1)] == reg40)))
            begin
              reg66 <= (({((^wire28) ? {(8'ha4)} : reg42)} ?
                      $signed(({wire36} ?
                          wire35 : ((8'ha3) ^~ reg39))) : reg39) ?
                  (wire31[(2'h3):(1'h0)] ?
                      reg30 : (reg53 >> wire32[(1'h0):(1'h0)])) : (&$signed((!wire33[(2'h3):(1'h0)]))));
              reg67 <= {(~|{(wire51 ^ $unsigned((8'h9e)))})};
            end
          else
            begin
              reg66 <= reg54;
            end
        end
      else
        begin
          reg62 <= ((7'h41) ?
              (+($unsigned($signed(wire35)) ?
                  {(reg65 ? reg39 : reg59),
                      (reg53 ~^ reg54)} : reg40)) : ((((wire33 == wire50) ?
                          {reg55, (8'hb2)} : $unsigned(reg54)) ?
                      (&$unsigned((8'hba))) : ((+reg60) ?
                          {reg46} : (&wire51))) ?
                  {(~^reg47),
                      ((reg41 ? wire32 : reg65) ?
                          wire29 : (!reg62))} : reg65[(2'h3):(1'h0)]));
          if ({reg45[(2'h2):(1'h1)],
              ((reg64[(2'h3):(2'h3)] ?
                      (^~$unsigned(reg41)) : ((reg58 & reg48) < (8'hb1))) ?
                  ({((8'hb7) ^~ reg55)} ?
                      reg39 : (|(reg60 ?
                          (8'ha8) : reg38))) : reg39[(2'h2):(1'h1)])})
            begin
              reg63 <= reg55[(3'h4):(2'h3)];
              reg64 <= (8'h9f);
              reg65 <= $unsigned($unsigned($signed((^~(wire28 ?
                  (8'hbd) : (8'hb1))))));
              reg66 <= $unsigned($signed(((8'haf) + $unsigned($unsigned((8'hb8))))));
            end
          else
            begin
              reg63 <= ({((+$unsigned(reg39)) + (|{(8'hae), reg42})),
                  {$unsigned(reg41[(4'hd):(2'h3)])}} ^ $signed(($unsigned(reg57) ?
                  (-(reg60 ? (8'h9d) : reg55)) : $signed((wire34 ?
                      reg49 : reg65)))));
              reg64 <= (7'h43);
            end
          reg67 <= {(($signed(reg30) ?
                      ((wire35 - reg52) ?
                          reg65[(3'h4):(1'h1)] : $signed(reg42)) : reg40) ?
                  reg42[(3'h4):(1'h1)] : ((~&wire31[(1'h0):(1'h0)]) ?
                      ($unsigned(reg57) && reg63) : wire34))};
          if ($signed(wire35[(1'h0):(1'h0)]))
            begin
              reg68 <= reg42[(4'hd):(1'h1)];
              reg69 <= (^$unsigned({wire32[(2'h2):(2'h2)]}));
            end
          else
            begin
              reg68 <= $signed((~^$signed(((~^reg48) ?
                  reg48 : (reg52 <<< (8'ha0))))));
              reg69 <= (($signed(((reg66 ? reg49 : reg65) | $unsigned(reg57))) ?
                  $unsigned(reg58[(2'h3):(2'h2)]) : (~wire33[(1'h0):(1'h0)])) ~^ ($unsigned((^~$signed(reg62))) ?
                  $unsigned($unsigned((reg62 || reg61))) : {((~|wire32) <= (reg62 ~^ wire33))}));
              reg70 <= (reg54[(1'h1):(1'h1)] < {reg48[(4'hd):(2'h2)]});
              reg71 <= reg70[(1'h0):(1'h0)];
              reg72 <= $signed($unsigned({(-((8'hb9) ? (8'ha5) : reg40)),
                  ($signed((8'hb5)) >= (reg64 && reg58))}));
            end
          reg73 <= reg48;
        end
      reg74 <= wire28[(4'h8):(2'h2)];
    end
  assign wire75 = (8'ha1);
  assign wire76 = reg73[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg77 <= (+reg46);
    end
endmodule

module module136  (y, clk, wire140, wire139, wire138, wire137);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire140;
  input wire signed [(5'h10):(1'h0)] wire139;
  input wire [(5'h13):(1'h0)] wire138;
  input wire signed [(3'h7):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire161;
  wire [(5'h10):(1'h0)] wire160;
  wire [(4'h8):(1'h0)] wire159;
  wire signed [(2'h3):(1'h0)] wire158;
  wire [(2'h2):(1'h0)] wire157;
  wire signed [(5'h12):(1'h0)] wire156;
  wire signed [(2'h3):(1'h0)] wire155;
  wire [(5'h10):(1'h0)] wire154;
  wire signed [(4'h9):(1'h0)] wire153;
  wire signed [(4'hf):(1'h0)] wire152;
  wire [(4'hf):(1'h0)] wire151;
  wire signed [(4'hc):(1'h0)] wire150;
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg141 <= (!wire140[(4'h8):(3'h5)]);
      reg142 <= wire138;
      reg143 <= $unsigned(wire137);
      reg144 <= $unsigned(wire137);
      if ((reg143 ?
          (~(^((reg143 >>> (8'ha8)) & wire137[(1'h0):(1'h0)]))) : reg144[(4'ha):(1'h1)]))
        begin
          reg145 <= (reg144 | $unsigned((reg141 ?
              $signed((~^reg142)) : reg144)));
          reg146 <= (((&(~&(~reg143))) ?
                  (+(8'ha8)) : {wire140[(1'h1):(1'h1)]}) ?
              wire139 : $signed(((~^$signed((8'hb5))) ?
                  ((reg143 ?
                      wire139 : (8'hb7)) <= $signed(wire137)) : {(reg141 ?
                          reg141 : reg142),
                      (wire137 > wire137)})));
          reg147 <= (wire139[(3'h7):(3'h5)] ^~ (~|($signed($signed(wire139)) ~^ reg146[(4'h9):(3'h6)])));
        end
      else
        begin
          reg145 <= (({reg147, $signed((wire140 < reg143))} ?
              ({$signed(reg146),
                  wire138} >> (reg147[(1'h0):(1'h0)] * (!reg143))) : (~^(+$signed(reg142)))) >> (({(~^reg145),
                  {(8'h9f)}} ?
              reg145[(3'h5):(2'h3)] : $signed($unsigned((8'ha3)))) <<< (8'hbb)));
          reg146 <= reg145[(3'h5):(2'h3)];
        end
    end
  always
    @(posedge clk) begin
      reg148 <= wire138;
      reg149 <= wire139;
    end
  assign wire150 = reg148;
  assign wire151 = reg141;
  assign wire152 = (!wire138[(3'h5):(2'h3)]);
  assign wire153 = (((^~$signed(reg143)) >>> (8'hb6)) != (~reg146));
  assign wire154 = $unsigned(($signed($unsigned({reg147, reg141})) ?
                       (~|$unsigned({(8'hac), reg141})) : reg148));
  assign wire155 = wire137[(3'h5):(3'h5)];
  assign wire156 = (wire152[(4'h9):(3'h7)] ?
                       (wire152[(4'hb):(4'ha)] ?
                           (!reg146) : reg148) : $unsigned((~wire150)));
  assign wire157 = $unsigned(((!reg148[(4'hf):(2'h3)]) ^ $signed((|reg149[(3'h4):(3'h4)]))));
  assign wire158 = (wire140[(3'h5):(1'h0)] <<< $unsigned(reg143[(1'h0):(1'h0)]));
  assign wire159 = wire150;
  assign wire160 = $unsigned((!wire150));
  assign wire161 = $unsigned({wire158[(1'h1):(1'h0)]});
endmodule
