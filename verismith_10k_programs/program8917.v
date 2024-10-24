module top
#(parameter param153 = {(~|((-(~(8'hb0))) < (~|((8'hbb) == (8'haf))))), ({(((8'hba) ? (8'had) : (7'h40)) ? ((8'ha6) ? (7'h41) : (8'hb0)) : (7'h43))} ? (&(((8'hb6) && (8'ha5)) << ((8'hac) <= (8'hbe)))) : ((((8'hbc) ? (7'h44) : (8'ha7)) <<< ((8'ha8) ~^ (8'hab))) << (((8'hae) || (8'hbf)) ? ((8'h9e) ? (8'hba) : (8'ha5)) : ((8'ha6) ? (8'hb2) : (8'hb6)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire150;
  wire signed [(4'hb):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire134;
  wire [(3'h5):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg149 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg144 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg [(4'ha):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  assign y = {wire150,
                 wire136,
                 wire134,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire4,
                 reg152,
                 reg151,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
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
                 (1'h0)};
  assign wire4 = {$signed({{(8'ha8), (~|(7'h44))}}), wire0};
  always
    @(posedge clk) begin
      reg5 <= ({(($unsigned(wire0) || (wire2 ? wire1 : wire2)) ?
                  $signed($signed(wire3)) : (^(wire0 ? wire4 : wire0)))} ?
          wire1 : $signed({((wire1 ? wire1 : wire2) * ((8'hb2) ?
                  wire2 : wire0)),
              (wire2[(4'ha):(4'h8)] ? $signed(wire0) : {wire1, wire2})}));
      reg6 <= $unsigned((^(!{(~^wire3)})));
      if ({(wire0 | ((-(&(8'ha8))) * (!(~|(8'hb4))))),
          (($unsigned(reg5[(5'h13):(5'h11)]) ^~ $unsigned($signed(wire4))) * (($signed(wire3) ?
              $unsigned(wire2) : wire1) - ({wire0} ?
              ((7'h40) ? wire4 : wire2) : reg6)))})
        begin
          reg7 <= wire3[(1'h0):(1'h0)];
          reg8 <= ((wire2[(3'h7):(3'h4)] ^~ wire1[(5'h13):(4'ha)]) << (reg7 <= $unsigned(wire4)));
          reg9 <= ($unsigned($unsigned(((reg8 ?
                  (8'hbc) : (8'ha7)) >= ((8'hb8) ^~ wire3)))) ?
              $signed({((reg6 ? wire0 : (8'hb4)) ?
                      (wire3 != wire4) : (|(8'hb2))),
                  $signed((~reg8))}) : {reg7,
                  (wire2 | (+wire0[(2'h3):(2'h2)]))});
          reg10 <= ((-reg5) + wire1[(3'h6):(3'h6)]);
          reg11 <= wire2;
        end
      else
        begin
          reg7 <= (~|$unsigned((-$signed(reg11[(4'ha):(3'h4)]))));
          if (((+(+reg8)) ?
              $signed(($unsigned((reg9 || reg6)) ~^ $unsigned($unsigned(reg10)))) : $unsigned((((wire0 ?
                      reg6 : reg11) ?
                  (&reg5) : $signed(reg7)) >> reg8))))
            begin
              reg8 <= {($unsigned((~|$unsigned(reg5))) ?
                      ($signed(wire0[(1'h0):(1'h0)]) & reg8) : ((^~$unsigned(reg9)) ?
                          $signed($signed(wire0)) : (|reg8[(1'h1):(1'h0)])))};
              reg9 <= reg7;
            end
          else
            begin
              reg8 <= wire2;
              reg9 <= $signed($signed(reg10));
            end
          reg10 <= $signed((reg10[(1'h0):(1'h0)] < (reg7[(3'h7):(1'h0)] + (+(wire1 * (7'h43))))));
          reg11 <= $signed(reg8);
          reg12 <= $unsigned($unsigned(reg5));
        end
      reg13 <= (~$unsigned(({(reg8 ?
              reg5 : wire0)} >>> ((!reg7) & ((8'ha6) && (8'hb3))))));
      reg14 <= (reg9[(1'h1):(1'h1)] >>> reg10);
    end
  assign wire15 = ($unsigned($unsigned(wire1[(1'h0):(1'h0)])) + {(~^((wire0 ?
                              wire1 : reg8) ?
                          $unsigned(reg5) : $signed(reg12)))});
  assign wire16 = (|(-(($unsigned(wire4) >> wire2) > reg8)));
  assign wire17 = ((|(~&reg9)) == (|reg6[(2'h3):(1'h1)]));
  assign wire18 = wire0[(2'h2):(2'h2)];
  assign wire19 = ($signed(wire1[(5'h11):(4'hf)]) ^~ {(~^wire15[(2'h3):(1'h1)])});
  module20 #() modinst135 (.wire25(reg7), .wire22(wire16), .wire24(reg6), .wire21(reg10), .y(wire134), .wire23(wire1), .clk(clk));
  assign wire136 = (wire17[(4'hc):(1'h0)] == (^reg7));
  always
    @(posedge clk) begin
      reg137 <= reg9;
      reg138 <= (8'h9f);
      reg139 <= $unsigned(($unsigned(((reg137 && wire0) ?
              $unsigned(wire18) : (reg11 ? reg13 : wire16))) ?
          ((~wire0[(2'h2):(2'h2)]) ?
              $signed($signed(reg13)) : ((reg8 > reg10) && {reg12})) : ($unsigned({reg9}) == $unsigned(reg5[(3'h5):(3'h4)]))));
      if ((~($signed({reg138, {wire1, reg12}}) ?
          ($unsigned((reg7 ^ reg14)) & $signed(wire136[(4'hb):(4'h9)])) : {($signed(wire4) ?
                  (-reg14) : reg10[(3'h5):(3'h4)])})))
        begin
          if ((((~&$unsigned($unsigned(wire0))) ?
                  (!{$unsigned(reg11)}) : {(reg11 * wire3[(1'h0):(1'h0)]),
                      ({wire16} <<< (wire3 ? (8'hb7) : reg14))}) ?
              (((|(+wire16)) ?
                  wire2 : (!{wire1,
                      wire134})) >= $unsigned({{(8'hb6)}})) : ($signed(((reg138 ?
                          reg139 : reg139) ?
                      (+wire1) : (reg138 - wire136))) ?
                  $signed($unsigned(wire19[(3'h5):(2'h3)])) : $signed((8'hab)))))
            begin
              reg140 <= wire0[(2'h2):(1'h0)];
              reg141 <= wire4;
              reg142 <= {reg140,
                  (|($signed(wire134) ~^ (wire4 ?
                      (wire136 ? wire1 : wire0) : (8'ha4))))};
              reg143 <= wire4[(3'h4):(2'h3)];
            end
          else
            begin
              reg140 <= (+$signed({$unsigned(wire3[(1'h1):(1'h1)]),
                  ((~^reg10) << (8'ha0))}));
              reg141 <= $signed(($unsigned($unsigned((&(8'hae)))) ~^ $signed(($unsigned(wire0) * (reg143 && wire3)))));
              reg142 <= $signed($unsigned(($unsigned((reg9 ? wire2 : wire15)) ?
                  ((wire3 + wire17) ?
                      (reg7 ? (8'haf) : reg143) : (reg9 ?
                          reg9 : (8'had))) : (~|$signed(reg5)))));
              reg143 <= $signed(reg137[(4'h9):(4'h9)]);
              reg144 <= wire15;
            end
          reg145 <= {((reg10 ?
                      $signed({(8'ha0), (8'ha6)}) : ((|reg13) ?
                          (wire2 >> reg144) : {wire15})) ?
                  reg9 : (reg6[(2'h2):(1'h0)] ?
                      $signed(reg144) : (&$signed(reg10))))};
          reg146 <= (&(!reg142));
          reg147 <= $signed($signed(reg145));
          reg148 <= wire4;
        end
      else
        begin
          reg140 <= wire15[(2'h3):(2'h2)];
          if (($unsigned(wire4) | $signed($unsigned((7'h43)))))
            begin
              reg141 <= $unsigned(reg138);
              reg142 <= wire17[(1'h0):(1'h0)];
            end
          else
            begin
              reg141 <= wire17;
              reg142 <= {(~^reg145)};
              reg143 <= (+$unsigned(reg142));
            end
          reg144 <= ((~^{(~^(reg147 || reg146))}) ?
              wire16 : wire18[(3'h5):(2'h3)]);
        end
      reg149 <= $signed((-wire4));
    end
  assign wire150 = (reg11[(1'h0):(1'h0)] ?
                       $unsigned($signed(($signed(reg140) ?
                           $unsigned(wire1) : wire18))) : (wire0 | ((reg143[(4'h9):(3'h5)] ?
                               $signed(reg137) : reg8) ?
                           $unsigned($signed(reg141)) : {wire16})));
  always
    @(posedge clk) begin
      reg151 <= reg141;
      reg152 <= ($unsigned(wire150[(1'h0):(1'h0)]) << reg137[(4'hb):(4'h8)]);
    end
endmodule

module module20  (y, clk, wire21, wire22, wire23, wire24, wire25);
  output wire [(32'h1b1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire21;
  input wire signed [(2'h2):(1'h0)] wire22;
  input wire [(4'ha):(1'h0)] wire23;
  input wire [(4'hb):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire132;
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  assign y = {wire28,
                 wire29,
                 wire43,
                 wire44,
                 wire47,
                 wire53,
                 wire95,
                 wire98,
                 wire132,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg46,
                 reg45,
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
                 reg27,
                 reg26,
                 reg97,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg26 <= {$signed((wire24 ? {$signed(wire25)} : wire23[(4'ha):(3'h6)])),
          (7'h43)};
      reg27 <= $unsigned($signed(wire23));
    end
  assign wire28 = wire24[(3'h6):(1'h0)];
  assign wire29 = $signed((($signed(((8'hbb) ?
                          wire28 : (8'hb4))) | ((wire25 ^~ wire25) ?
                          (8'hbc) : reg26[(1'h1):(1'h1)])) ?
                      (((~|reg26) || ((8'ha6) ? (8'hab) : reg26)) <<< (~|{reg27,
                          reg26})) : (~^(~&$signed((8'ha0))))));
  always
    @(posedge clk) begin
      if (wire22[(1'h0):(1'h0)])
        begin
          reg30 <= reg26;
        end
      else
        begin
          reg30 <= reg26[(1'h0):(1'h0)];
        end
      if (wire22)
        begin
          reg31 <= {wire21};
        end
      else
        begin
          reg31 <= $unsigned($signed(reg30));
        end
      if (wire25)
        begin
          if ((wire24[(1'h1):(1'h0)] ?
              reg30[(1'h1):(1'h0)] : (^~reg31[(1'h1):(1'h0)])))
            begin
              reg32 <= $unsigned(wire24);
              reg33 <= (wire28[(5'h12):(5'h12)] | $unsigned((7'h40)));
              reg34 <= (wire24[(4'h8):(3'h7)] <<< {$signed($signed(reg31[(2'h2):(1'h0)])),
                  ((8'hbf) ?
                      (reg32[(4'hb):(4'h8)] ?
                          $signed(reg26) : (wire24 ?
                              wire28 : wire28)) : (7'h42))});
              reg35 <= $signed(reg30);
            end
          else
            begin
              reg32 <= wire24[(4'ha):(4'h8)];
            end
          if (reg33[(4'h8):(3'h4)])
            begin
              reg36 <= ({reg26,
                  $unsigned((8'haf))} ^ $unsigned($unsigned($signed((reg30 ^~ reg33)))));
              reg37 <= (($unsigned(reg26) > (-reg27[(4'ha):(4'ha)])) ?
                  {(~((~&reg27) >> wire22)),
                      (+(-reg32[(5'h13):(5'h12)]))} : (reg33 <<< $signed(reg30)));
              reg38 <= (reg27 > (wire23 ?
                  $signed((wire25[(2'h3):(2'h3)] ?
                      (wire25 | reg33) : {(8'h9c)})) : reg34[(4'he):(3'h7)]));
              reg39 <= wire22;
            end
          else
            begin
              reg36 <= $unsigned((((^~reg38[(1'h1):(1'h0)]) - $unsigned((reg26 < reg32))) ?
                  wire24 : $signed(((reg30 ? wire28 : reg34) ?
                      reg33 : (wire25 < (8'ha9))))));
              reg37 <= ((8'hbe) >= (reg35[(3'h7):(1'h1)] ~^ (~reg36[(1'h0):(1'h0)])));
              reg38 <= $unsigned(reg39[(4'h9):(3'h6)]);
              reg39 <= ((^reg36) - wire29);
              reg40 <= {(|($unsigned((8'h9d)) & $signed({reg38, reg34}))),
                  (^~{(~^$signed(reg34))})};
            end
        end
      else
        begin
          reg32 <= reg40;
          reg33 <= $unsigned($signed({{$unsigned(wire23), (~wire21)}}));
          reg34 <= (~&reg40[(2'h2):(1'h0)]);
        end
      reg41 <= $signed((~&wire29[(4'h9):(3'h4)]));
      reg42 <= $unsigned($signed(((^~{wire21, reg33}) ?
          ((~^wire29) ?
              (+reg30) : wire24[(4'ha):(1'h0)]) : ($unsigned((8'ha4)) ?
              ((8'ha4) <= reg31) : wire25))));
    end
  assign wire43 = $signed((wire28 == ($signed((^~reg41)) < (reg39 ?
                      {(8'hba), (8'ha2)} : (reg31 ? reg41 : reg37)))));
  assign wire44 = $unsigned((!{$unsigned((~|wire24))}));
  always
    @(posedge clk) begin
      reg45 <= ((^~(7'h41)) > $unsigned(reg35[(2'h3):(1'h0)]));
      reg46 <= $unsigned(reg31);
    end
  assign wire47 = reg26[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg48 <= (~&({($unsigned(wire29) ?
              (reg46 ^ wire25) : (-reg39))} | (+$signed($unsigned(wire29)))));
      reg49 <= $signed(reg26);
      reg50 <= reg48;
      reg51 <= (|reg39[(4'hb):(3'h6)]);
      reg52 <= wire22[(1'h1):(1'h1)];
    end
  assign wire53 = $signed(wire43);
  module54 #() modinst96 (wire95, clk, reg40, wire28, reg46, reg49, wire44);
  always
    @(posedge clk) begin
      reg97 <= reg27[(4'hf):(4'ha)];
    end
  assign wire98 = $signed($unsigned((($signed(reg32) ?
                          (!(8'ha1)) : (~^(8'ha1))) ?
                      reg40 : $signed($unsigned(reg26)))));
  module99 #() modinst133 (wire132, clk, reg34, reg42, reg46, wire44);
endmodule

module module99  (y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire103;
  input wire signed [(4'hc):(1'h0)] wire102;
  input wire signed [(4'h9):(1'h0)] wire101;
  input wire signed [(5'h11):(1'h0)] wire100;
  wire signed [(4'hb):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire126;
  wire [(5'h14):(1'h0)] wire125;
  wire signed [(5'h13):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire118;
  wire signed [(2'h3):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire116;
  wire [(4'hc):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire104;
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire105,
                 wire104,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
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
                 (1'h0)};
  assign wire104 = wire103[(1'h0):(1'h0)];
  assign wire105 = wire101[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire102)
        begin
          reg106 <= $signed(wire103);
          if ({(!$signed(wire103[(4'hb):(1'h0)]))})
            begin
              reg107 <= {(~|wire102)};
              reg108 <= wire100;
              reg109 <= (($signed({(wire101 ?
                      reg108 : wire104)}) <= (wire101 >= (~^(+reg106)))) != (wire100[(4'hf):(4'hc)] ?
                  ((wire103 ? ((8'ha0) ^~ reg108) : (^reg108)) ?
                      (8'ha4) : (reg108[(4'hb):(3'h5)] ?
                          $unsigned(reg107) : (wire103 <<< wire100))) : reg106[(3'h4):(1'h0)]));
              reg110 <= {(~&(8'hb7)), wire105[(3'h4):(2'h3)]};
            end
          else
            begin
              reg107 <= $unsigned((-wire105));
              reg108 <= $unsigned((({(wire101 > (8'ha3)),
                      ((7'h44) ? wire105 : wire103)} ?
                  $signed((wire104 ? wire100 : (8'hac))) : $signed({reg109,
                      wire102})) != (~&(reg107[(3'h6):(3'h4)] ?
                  reg110[(4'hc):(1'h0)] : $signed(reg110)))));
              reg109 <= reg106[(2'h2):(1'h0)];
              reg110 <= (^(($unsigned($unsigned(reg107)) ~^ wire105[(3'h6):(1'h1)]) != reg109));
              reg111 <= $unsigned((+$signed(wire105[(4'hb):(3'h7)])));
            end
          reg112 <= wire102[(4'hc):(2'h3)];
          reg113 <= $unsigned((^~(($signed(reg108) + (wire105 ?
              reg112 : (8'ha2))) & $signed(wire101))));
          reg114 <= $unsigned((!(reg106[(2'h3):(2'h2)] ?
              $unsigned((!wire103)) : (~(+reg106)))));
        end
      else
        begin
          reg106 <= $signed((|reg112[(4'h8):(2'h3)]));
          reg107 <= (((~(&(-wire100))) ?
              $unsigned(wire105) : {wire100[(5'h11):(4'hd)]}) <<< {wire103,
              wire104});
          reg108 <= ($unsigned(reg109[(2'h3):(1'h1)]) ?
              $signed((wire101[(2'h2):(1'h1)] >= $unsigned((^~reg108)))) : ({$signed($unsigned((8'haf))),
                  ((reg113 ? reg113 : reg108) ?
                      $unsigned((7'h40)) : (|wire105))} <= $unsigned($unsigned($signed((8'hab))))));
          reg109 <= $signed((~&(((wire101 ~^ (8'hae)) > $unsigned(wire100)) ?
              reg108 : reg107)));
          reg110 <= reg107;
        end
      reg115 <= $unsigned($unsigned((~^(wire100[(4'hb):(4'ha)] ?
          (wire103 ? reg107 : (8'ha8)) : wire104))));
    end
  assign wire116 = reg106;
  assign wire117 = (8'hab);
  assign wire118 = ($signed(reg114) ?
                       $signed($signed((((8'ha2) ? wire116 : wire101) ?
                           {reg113} : $signed(reg110)))) : $signed((reg111 <<< $unsigned((!wire104)))));
  assign wire119 = ((({(~^wire105)} * {wire104, (reg106 << reg115)}) ?
                           reg110 : (~wire103[(3'h4):(3'h4)])) ?
                       (((+(reg110 ? reg112 : reg108)) ^ {$signed(reg109),
                               wire104[(3'h6):(2'h2)]}) ?
                           (wire100[(4'hf):(2'h3)] ?
                               reg115 : $unsigned($unsigned((8'ha8)))) : $signed(((reg107 - (8'ha9)) ?
                               $signed(wire104) : $signed(wire118)))) : $unsigned((((8'ha8) && reg114[(2'h2):(2'h2)]) ?
                           reg113 : {(~&wire117)})));
  always
    @(posedge clk) begin
      if ($unsigned($signed(($signed(reg107) ?
          (-$signed(reg106)) : ({wire117, reg114} - $signed(wire116))))))
        begin
          if ({wire116[(4'ha):(2'h2)]})
            begin
              reg120 <= $signed(($signed($signed((~&wire104))) ~^ $signed(((reg113 ^ wire100) <<< wire104[(4'h8):(1'h1)]))));
              reg121 <= $signed(reg109);
              reg122 <= ((~&reg107[(2'h2):(1'h0)]) ?
                  wire103 : $signed($signed((~|{reg109}))));
              reg123 <= reg110[(3'h6):(1'h1)];
              reg124 <= wire102;
            end
          else
            begin
              reg120 <= $unsigned(({$unsigned(reg121),
                  reg106[(1'h1):(1'h1)]} <= $unsigned(wire119[(4'hd):(4'hb)])));
              reg121 <= wire105;
              reg122 <= $unsigned($signed(((~|(wire119 ?
                  reg107 : (8'hb6))) | (|(+reg123)))));
              reg123 <= reg115;
            end
        end
      else
        begin
          reg120 <= wire101;
          reg121 <= ($signed({wire119}) ?
              $signed((~&($unsigned(wire117) | $unsigned(reg108)))) : (8'ha1));
        end
    end
  assign wire125 = (~&wire100[(3'h4):(1'h1)]);
  assign wire126 = ($signed(($signed(wire119) ?
                           reg112[(4'h9):(3'h5)] : reg114)) ?
                       $unsigned($unsigned({{wire103}})) : ($signed({$signed(reg121),
                               $unsigned(wire100)}) ?
                           ((|$unsigned((8'h9e))) != $unsigned((reg112 ?
                               wire104 : reg123))) : (8'hb1)));
  assign wire127 = {(wire118[(5'h11):(3'h4)] ?
                           (7'h43) : ((+$signed(reg108)) ~^ reg112[(2'h2):(1'h0)]))};
  assign wire128 = (^$signed({(~^((8'ha8) >>> (8'ha7)))}));
  assign wire129 = $unsigned($unsigned((~^$unsigned($signed(wire116)))));
  assign wire130 = wire104[(2'h3):(2'h2)];
  assign wire131 = $unsigned((8'hb6));
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire59;
  input wire signed [(3'h7):(1'h0)] wire58;
  input wire signed [(4'hf):(1'h0)] wire57;
  input wire signed [(3'h4):(1'h0)] wire56;
  input wire [(4'he):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire signed [(2'h2):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire60;
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire69,
                 wire60,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg71,
                 reg70,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire60 = (wire58[(3'h5):(2'h2)] && ($signed((|{wire55, wire55})) ?
                      $unsigned(($unsigned((8'ha0)) ~^ wire58[(3'h4):(2'h2)])) : wire57));
  always
    @(posedge clk) begin
      reg61 <= wire55[(3'h5):(2'h2)];
      if ($signed(wire55))
        begin
          reg62 <= {$unsigned({$unsigned((!wire60)),
                  $unsigned($signed(wire56))})};
          reg63 <= $signed($unsigned($unsigned({(wire56 || wire60)})));
          reg64 <= ({wire55[(2'h3):(1'h0)],
              $unsigned((8'hae))} ^~ ($signed($unsigned((wire55 && wire60))) ^~ (~|({wire56} & $unsigned(wire60)))));
          reg65 <= {((({reg64,
                  wire58} <= reg62) != wire58) | $unsigned({wire57[(2'h2):(1'h0)]})),
              reg64};
        end
      else
        begin
          reg62 <= {reg61,
              $signed({{$unsigned(wire60), $unsigned(wire60)},
                  $signed($signed(reg64))})};
          reg63 <= $signed(reg65);
          reg64 <= (8'h9c);
          reg65 <= ((~&$signed($unsigned(wire60))) ?
              $unsigned($unsigned($unsigned((reg65 - reg62)))) : $unsigned(($unsigned(wire55[(1'h1):(1'h1)]) ?
                  $unsigned({(7'h43)}) : (8'had))));
          reg66 <= (+(8'ha3));
        end
      reg67 <= ((^~$signed(($signed(reg65) ?
              $unsigned((8'haa)) : (reg63 ? (8'haf) : reg61)))) ?
          (wire55[(4'he):(4'h9)] <= $signed({$unsigned((8'hbb))})) : (|$signed((~|((8'hb7) ?
              wire58 : wire59)))));
      reg68 <= (reg65 == (^((reg62 & $unsigned(reg61)) < $unsigned($unsigned(wire59)))));
    end
  assign wire69 = (&(reg62[(3'h4):(2'h3)] ?
                      ((wire59 ?
                          ((8'hbe) ~^ reg64) : $signed(reg66)) * $unsigned({reg65,
                          reg61})) : $signed((reg63[(1'h1):(1'h0)] ?
                          {wire56} : (-reg63)))));
  always
    @(posedge clk) begin
      reg70 <= ($unsigned(((^reg64) ?
          ({wire60, (8'haf)} ?
              reg62[(3'h4):(1'h0)] : (-wire60)) : reg61)) >>> ($signed($unsigned((wire56 <<< wire59))) <<< (($unsigned(reg66) - (wire56 ?
              reg64 : reg64)) ?
          reg65 : {$unsigned(reg66), (!reg67)})));
    end
  always
    @(posedge clk) begin
      reg71 <= (~|wire57[(3'h7):(1'h0)]);
    end
  assign wire72 = ($unsigned((^~wire57)) ~^ (({(reg66 <= wire59),
                          $signed(wire56)} ?
                      $signed((reg66 ?
                          wire56 : reg70)) : $signed($unsigned(wire59))) | $unsigned(wire59)));
  assign wire73 = ($unsigned({({reg68, reg66} >= reg64[(3'h5):(3'h4)]),
                          ($signed(wire58) ?
                              (wire56 ? wire59 : reg67) : ((8'hba) ?
                                  (8'h9d) : reg65))}) ?
                      $unsigned((8'hb8)) : ((~|$signed(wire60[(4'he):(3'h6)])) ?
                          wire59 : (!(wire55 ? reg64 : {reg70, reg66}))));
  assign wire74 = reg70;
  assign wire75 = $signed((~|(!reg62)));
  assign wire76 = ({wire58} && ($signed(((reg66 && wire56) ?
                          $signed(wire72) : (reg65 << reg62))) ?
                      reg61[(2'h2):(1'h1)] : {(8'hbc), {(wire74 | wire74)}}));
  assign wire77 = ($unsigned(wire57) && reg67);
  assign wire78 = (!$signed($unsigned(($signed(wire73) - reg62))));
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire75[(2'h3):(2'h3)])))
        begin
          reg79 <= (+reg63[(1'h1):(1'h1)]);
          reg80 <= (reg62 * ((reg71[(2'h2):(1'h0)] && wire73[(4'h8):(3'h6)]) ?
              (~|($signed(wire60) ?
                  {reg67,
                      wire78} : wire58[(1'h0):(1'h0)])) : $unsigned(wire58[(3'h6):(1'h0)])));
          reg81 <= $signed(reg62);
          if ({wire57})
            begin
              reg82 <= $signed(reg71);
              reg83 <= reg82[(3'h6):(2'h3)];
              reg84 <= reg61;
              reg85 <= ((8'h9f) ? $unsigned((&reg62[(3'h7):(1'h0)])) : reg80);
            end
          else
            begin
              reg82 <= $unsigned((reg65[(3'h5):(2'h2)] + (~&wire72[(3'h4):(2'h3)])));
              reg83 <= (((reg84 <<< wire74) && $signed((&$unsigned(reg62)))) ?
                  wire75 : reg62[(2'h2):(2'h2)]);
            end
          reg86 <= (!reg64);
        end
      else
        begin
          reg79 <= $unsigned((wire69 * $signed({$signed(reg68), wire60})));
          reg80 <= reg65[(3'h6):(2'h3)];
          reg81 <= $unsigned(($unsigned($unsigned((reg81 * reg85))) ~^ reg61));
          reg82 <= wire73[(3'h5):(2'h2)];
        end
      reg87 <= ({$signed($unsigned(reg80[(1'h1):(1'h0)]))} < $signed(reg83));
    end
  always
    @(posedge clk) begin
      reg88 <= (|$signed(((&(&(8'hb6))) - (~^(8'hb4)))));
    end
  assign wire89 = (reg65[(3'h4):(2'h2)] == (&wire73));
  assign wire90 = $signed(((($unsigned(wire59) <= $signed(reg85)) > (~^(reg87 & wire74))) | wire56));
  assign wire91 = (&($signed(wire77[(2'h2):(1'h1)]) ?
                      ((((7'h43) ^~ (7'h44)) << reg86) ?
                          {(-reg80), $unsigned(reg67)} : ((reg64 ?
                                  wire73 : reg81) ?
                              $unsigned(reg62) : $unsigned(reg83))) : wire73));
  assign wire92 = $unsigned({wire77[(3'h6):(1'h1)],
                      $unsigned(((|reg67) ? reg63 : $unsigned(wire78)))});
  assign wire93 = $unsigned((|reg84));
  assign wire94 = {$unsigned({wire56[(1'h0):(1'h0)],
                          $unsigned(wire91[(1'h1):(1'h1)])})};
endmodule
