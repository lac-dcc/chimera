module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire132;
  wire signed [(4'hb):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire135;
  wire signed [(4'hf):(1'h0)] wire136;
  wire [(4'he):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire139;
  wire signed [(5'h12):(1'h0)] wire140;
  wire signed [(5'h15):(1'h0)] wire207;
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire4,
                 wire17,
                 wire18,
                 wire19,
                 wire132,
                 wire134,
                 wire135,
                 wire136,
                 wire137,
                 wire138,
                 wire139,
                 wire140,
                 wire207,
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
                 reg5,
                 (1'h0)};
  assign wire4 = (-wire0);
  always
    @(posedge clk) begin
      reg5 <= ($unsigned((((wire3 ? wire3 : wire4) ?
              wire3[(1'h1):(1'h0)] : $unsigned(wire2)) >= wire2[(3'h5):(1'h1)])) ?
          wire2[(3'h5):(1'h0)] : ($unsigned(wire3) ?
              {(wire4 ? $unsigned(wire1) : wire4)} : $signed(wire0)));
      if (($unsigned((reg5 * ((~&wire0) | (reg5 ? wire4 : (8'ha1))))) ?
          (wire0 ?
              wire4 : wire0[(2'h3):(2'h2)]) : $signed(($unsigned($unsigned(wire0)) <= (wire3 ?
              $unsigned(wire3) : $unsigned(wire1))))))
        begin
          if (wire2[(4'hf):(3'h5)])
            begin
              reg6 <= wire0;
              reg7 <= ({wire0[(4'hc):(2'h2)]} ?
                  $signed(({$signed(wire3),
                      reg5[(4'h9):(1'h0)]} << (~^reg6))) : ((~^((reg5 ?
                              wire1 : (8'hb2)) ?
                          (wire0 || wire1) : (~|wire4))) ?
                      ($signed($unsigned((8'ha5))) ?
                          {(^wire1),
                              $signed((7'h40))} : (8'ha7)) : (~|($unsigned(reg6) >>> (wire1 ?
                          reg6 : (8'h9d))))));
              reg8 <= wire3;
              reg9 <= $unsigned($signed((!reg5)));
            end
          else
            begin
              reg6 <= {wire1, reg9};
              reg7 <= (($signed((~^(wire2 ? wire2 : wire2))) ?
                  (^$unsigned((reg5 ?
                      wire3 : wire2))) : reg7[(4'h8):(4'h8)]) <= $unsigned(wire4[(3'h5):(2'h3)]));
            end
          reg10 <= wire0;
        end
      else
        begin
          reg6 <= ($signed(wire2) ?
              (($unsigned((reg8 * (8'h9e))) ?
                      ($signed(reg9) ?
                          $unsigned(reg9) : (wire4 + (8'ha8))) : (~wire0)) ?
                  ($unsigned(wire0[(5'h10):(3'h4)]) - reg6[(3'h5):(2'h3)]) : ($signed($signed(reg9)) ?
                      $unsigned(((8'ha1) ?
                          reg7 : reg7)) : $unsigned((&reg5)))) : {$unsigned((7'h44))});
        end
      if ((wire1[(2'h3):(1'h1)] >>> {reg5[(4'h8):(3'h6)]}))
        begin
          reg11 <= wire0[(4'ha):(1'h1)];
          reg12 <= ($unsigned({(^(8'hb9)), reg7[(2'h2):(1'h1)]}) ?
              wire1[(3'h4):(1'h1)] : wire2);
          reg13 <= (($unsigned((~^(reg12 ? reg6 : wire0))) >> ((reg10 ?
              (~|wire0) : (wire3 ?
                  reg11 : (8'h9f))) >> reg5[(3'h7):(3'h6)])) & ({reg6[(1'h0):(1'h0)],
              {$signed(wire3), reg8}} && (8'ha9)));
          reg14 <= $signed((wire4 >> (|wire1[(1'h0):(1'h0)])));
          reg15 <= $unsigned(wire4);
        end
      else
        begin
          reg11 <= {$signed({$signed($signed(reg15))})};
          reg12 <= wire0[(4'he):(4'hb)];
        end
      reg16 <= wire1[(3'h5):(3'h5)];
    end
  assign wire17 = (~|({reg10[(3'h4):(1'h0)], $unsigned($signed(reg5))} ?
                      $signed((wire0[(4'h8):(4'h8)] ~^ (reg12 ?
                          reg11 : (7'h42)))) : ($unsigned($unsigned(reg13)) ?
                          {reg15} : (reg16 <<< wire1[(3'h4):(3'h4)]))));
  assign wire18 = {wire0};
  assign wire19 = $unsigned((wire1 ?
                      (((&(8'had)) <<< (~&reg7)) >= $unsigned(reg11[(4'ha):(1'h0)])) : wire4[(1'h0):(1'h0)]));
  module20 #() modinst133 (.wire24(wire4), .y(wire132), .wire22(wire19), .wire21(reg16), .wire23(reg5), .clk(clk));
  assign wire134 = ($unsigned($signed((wire132[(2'h2):(2'h2)] ?
                       (~wire17) : reg12))) & $signed((reg16[(4'hb):(4'h9)] | (~$unsigned(wire3)))));
  assign wire135 = reg13;
  assign wire136 = ($signed(reg14) ?
                       ((|($unsigned(reg12) ?
                               (+wire1) : (wire135 >>> wire17))) ?
                           $unsigned(({wire2} >= (^reg5))) : $signed($unsigned((-reg15)))) : (((&(!wire18)) - wire19) ?
                           (+(reg11[(1'h0):(1'h0)] < (wire3 ?
                               wire4 : wire4))) : (~|wire4)));
  assign wire137 = $signed(($unsigned((reg14[(1'h0):(1'h0)] >= wire135)) ?
                       (wire17 ^ (~(reg7 & (8'ha2)))) : $unsigned({(^~wire132)})));
  assign wire138 = (reg15 > (&wire18[(4'hc):(1'h0)]));
  assign wire139 = {($unsigned(($unsigned(reg12) ?
                               $signed(wire2) : (&(8'ha0)))) ?
                           (({(8'hb5), wire17} ?
                               {(8'h9c), wire138} : {reg13,
                                   reg14}) <= $unsigned((+reg13))) : wire135),
                       reg16[(5'h13):(4'hf)]};
  assign wire140 = $unsigned($unsigned(wire1[(1'h0):(1'h0)]));
  module141 #() modinst208 (.wire145(reg13), .wire142(wire18), .y(wire207), .wire146(wire19), .wire144(reg5), .clk(clk), .wire143(wire1));
endmodule

module module141  (y, clk, wire142, wire143, wire144, wire145, wire146);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire142;
  input wire [(5'h12):(1'h0)] wire143;
  input wire signed [(5'h12):(1'h0)] wire144;
  input wire signed [(5'h13):(1'h0)] wire145;
  input wire [(5'h14):(1'h0)] wire146;
  wire signed [(4'hf):(1'h0)] wire206;
  wire [(5'h12):(1'h0)] wire205;
  wire signed [(3'h7):(1'h0)] wire201;
  wire signed [(5'h11):(1'h0)] wire147;
  wire [(3'h7):(1'h0)] wire148;
  wire signed [(5'h10):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire162;
  reg [(4'hd):(1'h0)] reg204 = (1'h0);
  reg signed [(4'he):(1'h0)] reg203 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire201,
                 wire147,
                 wire148,
                 wire149,
                 wire162,
                 reg204,
                 reg203,
                 (1'h0)};
  assign wire147 = (({(8'hb1)} || (~(~(|wire145)))) ?
                       wire142[(1'h1):(1'h1)] : (wire143[(3'h6):(2'h3)] ?
                           $signed(wire142[(1'h1):(1'h0)]) : (-(+(wire144 <<< (8'ha7))))));
  assign wire148 = (8'h9c);
  assign wire149 = wire147[(2'h2):(2'h2)];
  module150 #() modinst163 (.y(wire162), .wire153(wire145), .wire154(wire149), .wire155(wire143), .clk(clk), .wire152(wire142), .wire151(wire146));
  module164 #() modinst202 (wire201, clk, wire146, wire143, wire149, wire162);
  always
    @(posedge clk) begin
      reg203 <= (wire142 ?
          ($signed(wire162[(3'h5):(2'h3)]) - $unsigned($signed($unsigned((8'ha8))))) : (|$unsigned($signed((wire144 ~^ (8'hb3))))));
      reg204 <= $signed(wire148);
    end
  assign wire205 = ($unsigned((wire149 == wire148)) ?
                       reg204[(3'h6):(2'h3)] : wire144[(4'hc):(4'h9)]);
  assign wire206 = wire205;
endmodule

module module20
#(parameter param130 = (((({(7'h44)} ? (^(8'hb4)) : ((8'hba) ? (8'hbc) : (8'ha1))) ? (+(^~(8'hb8))) : {((8'hbb) ? (8'ha9) : (8'hbb)), ((8'hbf) ? (8'hbb) : (8'hbf))}) * (!(((8'hb6) ? (8'ha8) : (8'ha8)) ? ((8'hab) ? (8'hb8) : (8'hbd)) : ((8'hb4) ? (8'hbe) : (8'hb9))))) ? ({({(8'h9d), (8'hbe)} >= ((8'hb1) >= (8'ha1))), {(^(8'ha1)), (^~(8'h9f))}} < (!(((8'hb3) ? (8'hab) : (7'h41)) ? {(8'ha6), (8'hb6)} : {(7'h42), (8'hbd)}))) : ((!{((8'hb8) ? (8'ha0) : (8'hb4))}) ? {{((8'ha3) + (8'ha4)), ((8'hb6) ? (8'hb8) : (7'h43))}} : {(^~{(8'hb6)}), (((8'hb1) >> (7'h41)) >> ((8'hbd) + (8'h9f)))})), 
parameter param131 = {((((8'haf) >>> (param130 < param130)) + (^(8'h9e))) == (8'hb6)), ((((param130 ? param130 : (8'ha6)) ? ((7'h41) ? param130 : param130) : (-(8'hb8))) ? param130 : {{param130}, {param130}}) || (8'ha6))})
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire24;
  input wire [(4'hb):(1'h0)] wire23;
  input wire signed [(5'h12):(1'h0)] wire22;
  input wire [(5'h15):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire129;
  wire signed [(3'h5):(1'h0)] wire128;
  wire [(4'h9):(1'h0)] wire127;
  wire signed [(4'hb):(1'h0)] wire126;
  wire [(4'hf):(1'h0)] wire125;
  wire signed [(5'h10):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire121;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire121,
                 wire35,
                 wire27,
                 wire26,
                 wire25,
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
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire25 = ((~^$signed($unsigned((-wire23)))) + {$signed($unsigned({wire24,
                          wire24}))});
  assign wire26 = $signed((+$unsigned($unsigned(((8'hbd) & wire21)))));
  assign wire27 = (~&{wire25[(4'he):(3'h5)],
                      ($unsigned(wire21[(4'ha):(2'h2)]) <= (wire25 >= (wire26 + wire23)))});
  always
    @(posedge clk) begin
      if (({$unsigned(wire21[(5'h10):(1'h1)])} && $signed($signed({(8'h9f)}))))
        begin
          reg28 <= $unsigned(wire27);
          reg29 <= wire25;
          reg30 <= wire23[(1'h0):(1'h0)];
          reg31 <= $unsigned(({$signed((reg29 + wire26)),
                  ($signed(wire25) ? wire25 : (reg29 ? wire23 : wire25))} ?
              $signed(wire23) : (~^wire24)));
          reg32 <= wire21;
        end
      else
        begin
          reg28 <= wire23[(3'h4):(3'h4)];
          reg29 <= (|(!$signed(wire23[(3'h7):(1'h0)])));
          if (reg30)
            begin
              reg30 <= wire22[(3'h4):(3'h4)];
              reg31 <= $unsigned((&(&(((8'haf) ?
                  wire22 : wire22) <<< (^~wire22)))));
              reg32 <= (~&$unsigned((reg32[(1'h0):(1'h0)] || reg29)));
              reg33 <= $unsigned($unsigned(wire26[(2'h3):(2'h3)]));
            end
          else
            begin
              reg30 <= reg31;
            end
          reg34 <= ($unsigned($unsigned((wire26 ?
              (wire22 ?
                  wire26 : wire22) : reg30))) != (~&((^~$signed(wire25)) * reg30)));
        end
    end
  assign wire35 = {({($signed(reg32) != reg33)} ?
                          ((~|reg28) ^~ ($unsigned((8'h9e)) <= $signed(reg29))) : ($unsigned((wire24 ?
                                  wire21 : reg32)) ?
                              (!$signed(wire23)) : (7'h42))),
                      wire25};
  always
    @(posedge clk) begin
      reg36 <= ($unsigned(((~^reg28[(2'h2):(1'h1)]) | (8'hb1))) != $unsigned((!{reg31})));
      reg37 <= $signed(reg28);
      if ($signed((wire26 ?
          wire21 : (reg30 ? $signed((^reg30)) : $signed($signed(wire22))))))
        begin
          reg38 <= reg30;
          reg39 <= {reg28[(2'h2):(1'h0)],
              $signed(($signed($unsigned((8'hb3))) ?
                  reg32 : ($unsigned(reg34) ?
                      (reg29 ~^ reg30) : ((7'h40) ? wire26 : wire26))))};
          reg40 <= reg32[(4'h8):(3'h4)];
        end
      else
        begin
          reg38 <= (wire27 * ((wire22 && (wire24[(1'h1):(1'h0)] & (!wire25))) ?
              (reg30 >> reg39) : (|$signed($unsigned((8'ha5))))));
          reg39 <= (({{(wire22 ? reg36 : (8'ha4)), $signed(wire23)}} ?
                  $signed($unsigned($signed(reg37))) : ($signed(reg39) < (^~(wire27 ?
                      reg38 : wire21)))) ?
              $unsigned((|$unsigned((wire22 <<< wire22)))) : $unsigned((|((wire22 ?
                  (8'hbd) : wire21) - ((8'haf) <= wire23)))));
          reg40 <= (+wire25[(2'h2):(2'h2)]);
        end
      reg41 <= (wire23 ?
          $signed(wire22) : $unsigned((&($signed(wire22) | wire26))));
      reg42 <= $signed(($signed($unsigned(wire25)) ^~ (^wire27)));
    end
  always
    @(posedge clk) begin
      reg43 <= (~|$signed(reg38));
      if (reg32[(3'h5):(1'h0)])
        begin
          reg44 <= reg30;
          reg45 <= ($signed($unsigned(reg36)) - (reg28 >> wire26[(3'h7):(3'h6)]));
          reg46 <= $unsigned(((reg36 * {{wire26}}) <= (7'h40)));
          reg47 <= $unsigned(reg30);
        end
      else
        begin
          reg44 <= $unsigned($signed(reg44[(4'h8):(4'h8)]));
          reg45 <= (&$signed(reg44[(1'h0):(1'h0)]));
          reg46 <= $unsigned($signed((~{reg37[(4'hb):(4'h8)]})));
        end
    end
  module48 #() modinst122 (.wire51(wire35), .y(wire121), .wire50(reg29), .wire49(wire27), .clk(clk), .wire52(reg32));
  assign wire123 = {$signed({({(8'hb2), wire27} && (!reg39))})};
  assign wire124 = $signed({$signed($unsigned($signed(wire25)))});
  assign wire125 = reg39[(2'h2):(1'h0)];
  assign wire126 = {$signed(reg36)};
  assign wire127 = {wire22[(4'hd):(4'hc)],
                       (reg30[(1'h1):(1'h1)] ?
                           ((~|(^wire21)) == $unsigned(reg39)) : $unsigned({(reg33 & wire24)}))};
  assign wire128 = ((-$signed($unsigned(reg32))) > {{{wire27}}});
  assign wire129 = ($unsigned($signed(wire25[(4'ha):(2'h2)])) ?
                       ((8'hb6) | $unsigned((!reg32[(4'hd):(2'h3)]))) : (~^($signed((^~wire27)) ?
                           {(wire25 ? wire121 : reg41)} : wire23)));
endmodule

module module48  (y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h362):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire52;
  input wire signed [(4'hd):(1'h0)] wire51;
  input wire [(4'h8):(1'h0)] wire50;
  input wire [(5'h15):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire signed [(4'hc):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire53;
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg112 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire53,
                 reg117,
                 reg116,
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
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg89,
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
                 reg78,
                 reg77,
                 reg76,
                 reg75,
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
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire53 = (|wire49);
  always
    @(posedge clk) begin
      reg54 <= wire53[(1'h1):(1'h1)];
      reg55 <= $unsigned(wire50[(1'h1):(1'h0)]);
      reg56 <= wire50[(4'h8):(3'h5)];
    end
  assign wire57 = ((|reg56) ~^ wire53[(1'h1):(1'h1)]);
  assign wire58 = (wire57[(4'h9):(2'h3)] ?
                      ({{wire53, (wire50 ? reg54 : reg56)}} ^ (~|(&(reg56 ?
                          wire57 : (8'hb8))))) : $signed((($unsigned(wire51) < reg55) >> $signed(((7'h44) == wire49)))));
  assign wire59 = wire58;
  assign wire60 = reg56[(3'h4):(2'h2)];
  assign wire61 = {(~^wire50)};
  always
    @(posedge clk) begin
      if ({(wire51[(3'h7):(2'h2)] <<< ((-(reg56 ?
              wire58 : wire58)) > ($signed(wire60) >> $unsigned(reg54))))})
        begin
          reg62 <= {($signed(((reg56 << wire50) | (reg55 | reg54))) == $unsigned(wire51[(3'h6):(3'h4)]))};
          if ($signed((&$unsigned($signed(wire52)))))
            begin
              reg63 <= $signed($signed($signed(((wire60 ?
                  reg56 : (8'ha1)) ^ {(8'h9e), (8'h9d)}))));
              reg64 <= $signed((((wire51[(1'h1):(1'h1)] >> $signed((8'hab))) >>> $signed($unsigned(wire51))) ?
                  {(wire53 ? wire59 : reg63)} : wire61));
              reg65 <= (-$signed($signed({wire53[(4'he):(3'h7)]})));
            end
          else
            begin
              reg63 <= ($unsigned($unsigned(wire51[(4'ha):(3'h5)])) < reg56);
              reg64 <= (8'hb8);
              reg65 <= ($unsigned((reg56 ?
                      $signed((wire61 >> wire57)) : $unsigned(wire50[(3'h5):(2'h3)]))) ?
                  $signed(wire58[(4'h8):(3'h5)]) : ((($unsigned(reg63) ?
                              $signed((7'h41)) : $signed(reg54)) ?
                          ((wire52 || wire61) <<< $signed(reg56)) : (|$unsigned((8'hb3)))) ?
                      ((wire59[(5'h11):(4'hf)] ^~ reg65) <<< ($unsigned((8'ha7)) || (&(8'h9e)))) : (8'hba)));
            end
          if ({$unsigned((~((reg54 & wire52) - {reg56}))),
              (&(~&$signed(reg56)))})
            begin
              reg66 <= (reg65[(4'hb):(1'h0)] - {{(^{reg55, wire51})}});
              reg67 <= (reg66 << reg54);
            end
          else
            begin
              reg66 <= (-reg55);
              reg67 <= ($unsigned($unsigned(wire57)) ?
                  ($unsigned($signed((wire52 ?
                      reg56 : wire58))) + wire57) : (wire61 ^ $signed((8'hb7))));
              reg68 <= (wire60 ?
                  (reg56[(5'h10):(3'h5)] ?
                      reg66 : reg62[(3'h4):(2'h3)]) : (~|wire50[(3'h4):(1'h0)]));
            end
        end
      else
        begin
          reg62 <= $unsigned($signed($signed(wire59[(2'h2):(2'h2)])));
          reg63 <= $unsigned(reg65);
          reg64 <= $unsigned(reg54);
        end
      reg69 <= $unsigned((~^reg56));
      reg70 <= {reg69[(2'h2):(1'h0)], {(&reg62[(2'h3):(1'h1)])}};
      if ((reg67 ?
          wire58 : ($signed($signed($unsigned(reg66))) ?
              ((8'ha2) << (8'h9c)) : (({reg63, reg64} << (wire50 && reg69)) ?
                  {((8'h9c) ? reg64 : (8'ha7)),
                      reg66[(4'hc):(1'h0)]} : (-{wire52, wire57})))))
        begin
          reg71 <= $signed($unsigned((7'h40)));
          reg72 <= ($unsigned($signed(reg56[(5'h13):(4'hc)])) ?
              wire50 : (((reg70[(4'h8):(4'h8)] ~^ wire60) ?
                      wire61[(2'h3):(2'h3)] : $signed({reg63, wire50})) ?
                  {{$signed((8'hbf)), (~|reg56)},
                      wire58[(3'h5):(1'h1)]} : $unsigned($signed(wire57[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg71 <= (^~(wire50[(4'h8):(1'h1)] ?
              {reg55,
                  ($unsigned(reg63) ? (&wire50) : $unsigned(reg68))} : wire52));
          reg72 <= (((-((reg72 || reg67) ? (!reg64) : wire61)) ?
                  (reg63 ?
                      (~&reg70[(4'hb):(2'h2)]) : $unsigned(wire49)) : $unsigned($unsigned((-reg66)))) ?
              {((-$signed(wire53)) <<< ($unsigned(reg55) ?
                      (~|reg55) : $unsigned(reg70))),
                  $unsigned($signed(wire57[(4'h9):(4'h9)]))} : reg66);
          reg73 <= $signed($unsigned($unsigned((|(wire53 ? (8'hab) : reg69)))));
        end
      reg74 <= reg73[(2'h3):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg75 <= ((~&($signed((wire53 ^ wire52)) >> $unsigned((reg65 > (8'ha7))))) >> (!reg67));
      if ((-$signed(wire51)))
        begin
          reg76 <= reg65;
        end
      else
        begin
          reg76 <= ((($unsigned({reg63}) - reg70) ^~ (-(reg64[(2'h2):(1'h0)] && (wire60 * (8'hb7))))) ?
              $signed((~((reg65 >= wire60) <<< wire58[(4'hf):(4'h8)]))) : $signed((~$signed($signed(reg63)))));
          reg77 <= wire58;
        end
      reg78 <= $signed(reg76);
      reg79 <= wire49;
      if ((((7'h40) ?
              (~|($signed(wire59) ~^ wire58)) : $signed(($unsigned(reg72) != (+(8'haf))))) ?
          (8'h9c) : reg63[(3'h4):(2'h3)]))
        begin
          if ((~&(~reg63)))
            begin
              reg80 <= reg63;
              reg81 <= (wire52[(3'h5):(1'h0)] << reg65[(5'h13):(5'h11)]);
              reg82 <= (^reg66);
              reg83 <= (8'hb4);
              reg84 <= reg65[(4'h9):(1'h1)];
            end
          else
            begin
              reg80 <= (^~$signed(reg72[(3'h4):(2'h2)]));
              reg81 <= $unsigned((($unsigned(((8'hb6) ^~ reg77)) ?
                  ($signed(wire52) ?
                      reg71[(3'h4):(1'h1)] : $signed(reg64)) : ((|reg80) ?
                      $signed((7'h43)) : (!reg76))) * $signed((wire49[(5'h12):(2'h2)] ?
                  (reg84 ~^ reg67) : (reg55 || (8'hbc))))));
              reg82 <= {$signed($signed((~|(wire52 ? wire61 : (8'hb7))))),
                  $unsigned(reg84[(2'h3):(1'h0)])};
              reg83 <= ((reg84 ?
                  (+$unsigned($signed((8'hbd)))) : {$unsigned($signed(reg73))}) <= (reg72 ?
                  ($unsigned({wire60, reg81}) <= ((wire51 ? (8'h9e) : reg75) ?
                      reg68 : reg84)) : $signed(reg62)));
            end
          reg85 <= $signed((reg79[(2'h2):(1'h0)] == $signed($unsigned(wire60[(4'he):(4'he)]))));
          if (reg56)
            begin
              reg86 <= $unsigned((~^(+((reg68 >= reg72) ?
                  reg75[(2'h2):(2'h2)] : $signed(wire50)))));
            end
          else
            begin
              reg86 <= ($signed(reg84[(2'h2):(1'h0)]) < {(+reg64[(5'h12):(2'h2)])});
              reg87 <= reg77[(4'hb):(3'h5)];
              reg88 <= reg69;
              reg89 <= reg85[(3'h6):(1'h1)];
            end
        end
      else
        begin
          reg80 <= $unsigned((((reg72[(2'h3):(2'h2)] < (wire57 ?
                      wire61 : reg72)) ?
                  wire49 : $signed(((8'ha3) ? reg88 : reg65))) ?
              (^~wire51[(1'h0):(1'h0)]) : ((~^(wire53 ? reg64 : reg79)) ?
                  reg85 : (~(~&wire50)))));
        end
    end
  assign wire90 = {reg67[(2'h2):(1'h0)]};
  assign wire91 = ($signed(reg78) ^ {(($signed(wire59) ?
                          (reg63 - reg66) : reg81[(4'hd):(4'hd)]) - ((!reg68) > (~|reg78)))});
  assign wire92 = (+$unsigned(((~|{reg85, reg76}) - $unsigned((reg65 ?
                      reg77 : reg79)))));
  assign wire93 = {{reg84[(1'h1):(1'h0)]}, (~^$unsigned($signed(wire92)))};
  always
    @(posedge clk) begin
      reg94 <= (-(reg72[(3'h7):(1'h1)] ?
          wire92 : {reg64[(5'h10):(4'ha)], reg80}));
      if (reg86[(1'h0):(1'h0)])
        begin
          reg95 <= (8'hbe);
          if (reg75[(2'h3):(1'h1)])
            begin
              reg96 <= (reg81[(1'h1):(1'h1)] ?
                  (^({reg78, (reg87 ? reg71 : reg81)} + (((8'hb6) ?
                      reg95 : reg81) - (8'hbe)))) : reg67);
            end
          else
            begin
              reg96 <= $unsigned($unsigned((|{reg80[(5'h14):(5'h12)],
                  $unsigned(reg87)})));
              reg97 <= ((reg86 ?
                      $unsigned(((^~reg65) || (8'hbd))) : reg78[(1'h1):(1'h0)]) ?
                  $unsigned(reg72[(4'h8):(2'h3)]) : ((reg70[(1'h0):(1'h0)] ?
                          (~^wire93[(1'h1):(1'h1)]) : (^~(^~reg78))) ?
                      ({$signed(reg65)} ?
                          $unsigned($unsigned(wire61)) : reg56[(3'h5):(2'h2)]) : reg69[(1'h0):(1'h0)]));
              reg98 <= (wire59[(4'h9):(2'h3)] > reg76);
              reg99 <= (~|($unsigned(($signed(wire52) >>> wire60)) != {($signed(reg96) ?
                      reg74[(3'h4):(2'h3)] : reg73)}));
            end
          reg100 <= $signed((reg83 >= $unsigned(reg70[(3'h6):(3'h4)])));
          reg101 <= (8'hb4);
          if (wire53[(4'hc):(4'h9)])
            begin
              reg102 <= ({$unsigned({(reg69 + reg72), (reg62 ~^ wire58)}),
                      {$signed(reg70)}} ?
                  $signed(reg79) : ((~|{(~^wire90)}) ?
                      $signed((~(reg101 ^~ wire51))) : ($signed((reg96 <<< reg94)) >> (&(~|wire58)))));
              reg103 <= reg71;
              reg104 <= $signed($signed(wire52));
              reg105 <= $signed(($unsigned($unsigned(wire60)) | (reg54[(1'h1):(1'h0)] ?
                  (|(reg96 <= reg56)) : $signed($signed(reg56)))));
            end
          else
            begin
              reg102 <= $signed($signed((+reg82[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          reg95 <= {wire50,
              (wire51[(1'h1):(1'h0)] ?
                  ({reg75} ?
                      reg78 : ($unsigned(reg83) ?
                          (reg86 + reg80) : (8'hb7))) : reg79)};
        end
      reg106 <= {($signed((8'hbe)) ^~ (~&reg62))};
      if ($signed((8'hbc)))
        begin
          if (((8'h9f) ?
              $unsigned($signed((~&reg75[(2'h2):(1'h1)]))) : wire91[(3'h5):(3'h4)]))
            begin
              reg107 <= ((~&{{{wire52},
                      (reg75 - (8'h9d))}}) || reg106[(4'hd):(1'h1)]);
              reg108 <= $unsigned((reg83 <= ($unsigned((reg106 ^ reg79)) ?
                  reg66 : $unsigned((reg107 >>> wire58)))));
            end
          else
            begin
              reg107 <= wire90[(1'h0):(1'h0)];
              reg108 <= (reg95 && (!$unsigned(($unsigned(reg108) < $unsigned(reg87)))));
            end
          if ($signed(((^~(|$signed((7'h43)))) - ((~^(&reg107)) ?
              wire53[(4'h8):(3'h4)] : $unsigned($unsigned((8'hbb)))))))
            begin
              reg109 <= $signed({$unsigned(wire57),
                  $signed({$signed((8'h9c))})});
              reg110 <= reg104[(4'ha):(1'h0)];
              reg111 <= {$signed(((8'hb2) < ((wire91 ?
                      (8'ha8) : reg94) ^~ reg66[(2'h3):(1'h1)]))),
                  ($signed(((-reg88) * ((8'hbb) ? reg71 : reg89))) ?
                      ((-$unsigned(reg96)) ?
                          reg82 : (~reg97[(2'h2):(1'h0)])) : $unsigned($signed($unsigned(reg87))))};
            end
          else
            begin
              reg109 <= (reg69 ?
                  $unsigned($unsigned(((~^reg111) << (wire92 ?
                      (7'h40) : reg77)))) : $signed(($signed(reg76[(4'h8):(3'h5)]) ?
                      $signed((reg107 ?
                          (8'hb0) : reg54)) : reg101[(3'h5):(1'h1)])));
              reg110 <= $signed((8'hbe));
              reg111 <= reg77[(4'ha):(4'h9)];
              reg112 <= ({(~|(|reg82)),
                      $signed((reg66 ? wire58[(5'h10):(4'hf)] : reg80))} ?
                  {((^(wire53 == reg94)) ?
                          ($signed(reg80) >= {reg72}) : $signed(reg95)),
                      $unsigned(wire60)} : ((($unsigned(reg101) ?
                          $signed(wire61) : reg80) | (+{(8'haf), reg85})) ?
                      (reg70[(3'h4):(3'h4)] << ($signed(reg75) <= wire93[(3'h6):(3'h6)])) : (reg78[(1'h1):(1'h0)] ?
                          reg98[(4'hf):(3'h7)] : $unsigned($signed(reg80)))));
            end
          if ((~&$unsigned((8'hb4))))
            begin
              reg113 <= $signed($unsigned((~^(reg103 < ((8'hbe) ?
                  reg81 : reg68)))));
            end
          else
            begin
              reg113 <= ((~&$unsigned($unsigned($unsigned(reg103)))) <= {reg98,
                  reg80[(4'ha):(3'h4)]});
              reg114 <= reg100;
              reg115 <= (($signed((~^(-reg112))) > wire93) ?
                  (reg73[(1'h1):(1'h1)] || reg98) : wire57[(3'h5):(3'h5)]);
              reg116 <= reg80[(5'h12):(1'h0)];
              reg117 <= {$signed($unsigned(reg55))};
            end
        end
      else
        begin
          reg107 <= reg116;
          reg108 <= wire57[(3'h7):(2'h3)];
          reg109 <= ($unsigned(reg103[(1'h1):(1'h1)]) ?
              (~^{{(8'had), (~|reg97)}}) : {wire51});
        end
    end
  assign wire118 = (reg71 + (^~(wire50 >> (wire51 ?
                       $unsigned(reg81) : wire60[(3'h4):(2'h3)]))));
  assign wire119 = (8'hb9);
  assign wire120 = ((&reg88[(3'h4):(1'h1)]) ?
                       wire49[(4'hd):(4'h8)] : ($signed(wire118[(3'h7):(3'h7)]) ?
                           $signed((^(^~reg104))) : ((reg96 ?
                                   wire57 : $signed((8'hba))) ?
                               $signed((reg66 & (7'h44))) : (7'h40))));
endmodule

module module164
#(parameter param199 = ({((8'hbf) - (~(~&(8'ha9))))} > ((|({(8'had)} + {(8'hb6), (7'h41)})) ? ({((8'hb2) > (8'ha5)), ((8'hb6) ? (8'ha0) : (8'hac))} ? {((8'h9f) >> (7'h41)), ((8'hab) == (8'hac))} : (^((8'ha1) ? (8'ha2) : (8'hb9)))) : ({{(8'ha0), (8'hab)}, ((8'ha7) ? (7'h44) : (8'ha0))} ^ (~&(|(7'h44)))))), 
parameter param200 = (~&param199))
(y, clk, wire168, wire167, wire166, wire165);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire168;
  input wire [(4'hf):(1'h0)] wire167;
  input wire signed [(5'h10):(1'h0)] wire166;
  input wire [(5'h12):(1'h0)] wire165;
  wire signed [(4'h9):(1'h0)] wire198;
  wire [(5'h14):(1'h0)] wire197;
  wire [(5'h13):(1'h0)] wire191;
  wire [(5'h10):(1'h0)] wire190;
  wire signed [(4'hf):(1'h0)] wire189;
  wire [(5'h12):(1'h0)] wire188;
  wire signed [(3'h7):(1'h0)] wire187;
  wire signed [(3'h6):(1'h0)] wire186;
  reg signed [(5'h12):(1'h0)] reg196 = (1'h0);
  reg [(3'h7):(1'h0)] reg195 = (1'h0);
  reg [(2'h3):(1'h0)] reg194 = (1'h0);
  reg [(3'h6):(1'h0)] reg193 = (1'h0);
  reg [(5'h15):(1'h0)] reg192 = (1'h0);
  reg [(2'h2):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg181 = (1'h0);
  reg [(5'h10):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg179 = (1'h0);
  reg [(4'hf):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg177 = (1'h0);
  reg [(4'hd):(1'h0)] reg176 = (1'h0);
  reg [(2'h3):(1'h0)] reg175 = (1'h0);
  reg [(3'h5):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg173 = (1'h0);
  reg [(5'h12):(1'h0)] reg172 = (1'h0);
  reg signed [(4'he):(1'h0)] reg171 = (1'h0);
  reg [(4'h8):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg169 = (1'h0);
  assign y = {wire198,
                 wire197,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg169 <= (~|({wire165} - (wire166[(4'hc):(4'h8)] <<< ($unsigned(wire168) < (wire167 ?
          (8'h9e) : wire168)))));
      if ($unsigned($signed($signed(wire166))))
        begin
          reg170 <= (~^(8'hbb));
          if (wire168)
            begin
              reg171 <= $signed(wire165);
            end
          else
            begin
              reg171 <= wire168;
              reg172 <= (~^{$unsigned($unsigned((&wire167))), (&(8'hb4))});
              reg173 <= ((&wire168) ?
                  (+(8'hbe)) : ($unsigned($unsigned((reg171 >= reg171))) <<< ((8'h9d) ?
                      wire168 : {{wire166}, reg169})));
              reg174 <= reg170;
            end
          reg175 <= reg174;
          reg176 <= (($unsigned(wire165[(3'h6):(3'h6)]) == reg169) == (!wire168));
          reg177 <= ($signed(((^~$signed(wire168)) ?
                  $unsigned($signed(reg174)) : reg173)) ?
              reg173[(4'hd):(3'h4)] : (reg175[(1'h1):(1'h1)] ?
                  reg170[(3'h4):(2'h2)] : $signed({(wire166 ?
                          reg173 : reg173)})));
        end
      else
        begin
          reg170 <= (|(wire166 ?
              reg177 : $unsigned({(reg170 ? reg172 : wire168),
                  $unsigned(reg171)})));
          reg171 <= (~|{($signed((reg173 ? reg170 : (8'ha8))) ?
                  (^reg172[(3'h6):(1'h1)]) : (reg172[(3'h5):(2'h2)] ~^ (wire165 ?
                      reg171 : reg173))),
              $unsigned((!{reg171}))});
          reg172 <= $signed((!(((wire167 >>> reg174) + $signed(wire168)) ~^ ($unsigned(reg170) ?
              (reg173 || reg177) : (reg173 >= reg170)))));
          reg173 <= ($signed($signed((8'ha2))) >= (~^$unsigned({(reg170 ?
                  (7'h41) : reg171)})));
        end
      if (reg171[(3'h7):(1'h1)])
        begin
          reg178 <= reg174[(2'h2):(1'h1)];
        end
      else
        begin
          reg178 <= reg173[(4'h8):(3'h6)];
          reg179 <= (!(-reg174));
          if ((^({wire168[(3'h4):(1'h0)],
              (~&{reg171})} * reg179[(4'h8):(2'h2)])))
            begin
              reg180 <= ($unsigned({{reg170}}) ^ $unsigned(($unsigned($signed(reg177)) ?
                  (&$unsigned(reg177)) : $unsigned((reg176 * (7'h44))))));
              reg181 <= $signed($unsigned($signed((^{reg173}))));
              reg182 <= (8'hb4);
              reg183 <= $signed(wire168[(4'hc):(2'h3)]);
              reg184 <= (+($signed(({reg180} > (reg173 ? wire165 : reg175))) ?
                  $unsigned($unsigned(reg171)) : reg174[(1'h1):(1'h0)]));
            end
          else
            begin
              reg180 <= $unsigned($unsigned(($unsigned({reg179}) & $unsigned((~|reg169)))));
              reg181 <= (-$unsigned({reg174[(1'h1):(1'h1)]}));
              reg182 <= (+reg182[(1'h1):(1'h1)]);
              reg183 <= $signed($signed(($unsigned(reg177[(3'h6):(2'h2)]) ?
                  reg173 : (~^(^~reg170)))));
              reg184 <= ((reg180 >> (reg169[(2'h2):(1'h1)] ?
                  ($unsigned(reg173) * $unsigned(reg175)) : reg172[(4'he):(4'hb)])) || (reg180[(4'h8):(2'h2)] == (~$unsigned($signed(reg172)))));
            end
        end
      reg185 <= wire168;
    end
  assign wire186 = wire167;
  assign wire187 = wire186[(1'h1):(1'h0)];
  assign wire188 = {$signed($unsigned(reg172)), ((^reg171) >>> reg182)};
  assign wire189 = reg178;
  assign wire190 = {(-(^reg169[(3'h5):(2'h2)]))};
  assign wire191 = reg183;
  always
    @(posedge clk) begin
      reg192 <= (8'ha8);
      reg193 <= $unsigned((wire168 ?
          ((reg182 ? $signed(reg181) : $signed(wire191)) ?
              $unsigned((~(8'h9e))) : $signed((~&reg192))) : $unsigned(wire188[(2'h3):(1'h1)])));
      reg194 <= $unsigned(wire167[(4'ha):(4'h8)]);
      reg195 <= $signed($signed($unsigned(wire165[(2'h3):(2'h3)])));
      reg196 <= {(($unsigned(wire165[(4'hc):(3'h7)]) || ($signed(reg183) <= wire191[(3'h7):(2'h3)])) * (8'hae)),
          $unsigned($unsigned($unsigned($signed(wire168))))};
    end
  assign wire197 = ({wire189[(3'h4):(1'h1)], $unsigned(reg169[(1'h1):(1'h0)])} ?
                       $unsigned($unsigned((+$unsigned(reg184)))) : (^(reg185[(1'h0):(1'h0)] ^ $unsigned(((7'h41) >>> reg182)))));
  assign wire198 = ((~|$unsigned({wire167[(4'ha):(2'h2)],
                           $unsigned(wire165)})) ?
                       {{reg181[(3'h5):(2'h2)]}} : $unsigned($signed($signed($signed(reg175)))));
endmodule

module module150  (y, clk, wire155, wire154, wire153, wire152, wire151);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire155;
  input wire [(4'hb):(1'h0)] wire154;
  input wire signed [(2'h3):(1'h0)] wire153;
  input wire signed [(5'h13):(1'h0)] wire152;
  input wire signed [(5'h14):(1'h0)] wire151;
  wire [(3'h4):(1'h0)] wire161;
  wire [(4'h8):(1'h0)] wire160;
  wire signed [(2'h2):(1'h0)] wire159;
  wire signed [(3'h4):(1'h0)] wire158;
  wire signed [(5'h13):(1'h0)] wire157;
  wire [(5'h11):(1'h0)] wire156;
  assign y = {wire161, wire160, wire159, wire158, wire157, wire156, (1'h0)};
  assign wire156 = wire152;
  assign wire157 = wire152[(4'hc):(2'h2)];
  assign wire158 = (($signed(wire153) >> ((8'ha2) || (wire157[(5'h11):(3'h5)] ^~ (wire153 ?
                           wire151 : wire154)))) ?
                       ($signed(wire154[(4'ha):(3'h4)]) >>> $signed((~wire157[(5'h10):(4'he)]))) : (+$signed(((!(8'ha5)) ?
                           (wire154 ^~ wire155) : (~^(7'h43))))));
  assign wire159 = (wire156 <<< (wire153[(2'h3):(1'h0)] - $signed(wire156[(1'h0):(1'h0)])));
  assign wire160 = wire158[(1'h0):(1'h0)];
  assign wire161 = wire157;
endmodule
