module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h3b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire154;
  wire signed [(5'h14):(1'h0)] wire139;
  wire signed [(4'h9):(1'h0)] wire138;
  wire [(5'h12):(1'h0)] wire137;
  wire [(3'h7):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire135;
  wire signed [(4'hc):(1'h0)] wire133;
  wire signed [(4'ha):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire119;
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(4'hd):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg145 = (1'h0);
  reg [(4'he):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  reg [(4'ha):(1'h0)] reg140 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(5'h15):(1'h0)] reg4 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  assign y = {wire154,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire133,
                 wire132,
                 wire17,
                 wire18,
                 wire19,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire119,
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
                 reg141,
                 reg140,
                 reg134,
                 reg131,
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
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire1[(1'h0):(1'h0)])
        begin
          reg4 <= {$unsigned((~wire3[(4'h9):(2'h2)])),
              $unsigned(((((8'hb1) ? wire2 : wire0) ?
                      (wire1 ? (8'hba) : wire0) : (wire2 && wire2)) ?
                  {$unsigned(wire0)} : $unsigned((wire2 ? (8'hbf) : wire2))))};
          reg5 <= ({wire3[(4'he):(2'h2)]} ~^ $unsigned(($unsigned($unsigned(wire0)) ?
              (((8'h9e) * reg4) <<< $unsigned(wire1)) : (&$signed(wire0)))));
          reg6 <= $signed(reg4);
          reg7 <= (~{(reg6 != (wire1 << reg5[(1'h1):(1'h0)])),
              (((wire3 ^ reg4) * wire3[(4'hd):(3'h7)]) << (^{wire0}))});
          reg8 <= $unsigned((($unsigned(((8'h9c) <<< reg6)) ?
                  {$unsigned(wire3)} : $unsigned((8'ha8))) ?
              {$signed($signed((8'hb5))), $unsigned((^~reg4))} : {(~|wire3)}));
        end
      else
        begin
          reg4 <= (~(+wire1));
          reg5 <= reg8[(1'h1):(1'h1)];
          reg6 <= ($unsigned((7'h41)) ?
              wire0 : ({($signed(wire1) ?
                          ((8'hbe) ? wire2 : reg4) : (~(8'hab)))} ?
                  $unsigned({reg5[(2'h3):(2'h3)]}) : ($unsigned((^~(8'hac))) - ((~&reg5) ?
                      wire1[(1'h1):(1'h1)] : wire0))));
          if ($unsigned((($unsigned((reg8 ?
              reg7 : reg4)) != reg4) < $unsigned(wire0[(4'hc):(4'h9)]))))
            begin
              reg7 <= reg4[(4'hc):(2'h3)];
            end
          else
            begin
              reg7 <= wire1;
              reg8 <= $unsigned((reg5 ?
                  {(wire1 & $unsigned(wire2))} : (^~($unsigned(wire2) ?
                      (reg8 - reg7) : $signed(wire1)))));
              reg9 <= (~^$signed((wire3 * (~(wire0 ? (8'ha8) : wire3)))));
            end
        end
      if ((&$signed(wire2)))
        begin
          reg10 <= $signed(($signed(reg6) != ($signed({wire2,
              wire0}) * wire0)));
          reg11 <= $unsigned(reg4[(5'h13):(3'h4)]);
          if ((reg10 <<< wire3))
            begin
              reg12 <= reg8[(3'h6):(3'h4)];
              reg13 <= {$signed(reg5)};
              reg14 <= (($unsigned(reg13[(4'he):(4'hd)]) ?
                  reg4 : (&$signed($signed(reg4)))) <<< wire2);
              reg15 <= {reg4[(2'h2):(1'h0)]};
            end
          else
            begin
              reg12 <= $unsigned(reg14[(3'h7):(3'h5)]);
            end
          reg16 <= reg4;
        end
      else
        begin
          reg10 <= (~(^~wire1));
          reg11 <= $unsigned(reg4);
          reg12 <= (reg10 ?
              {((~^(reg12 - reg5)) >= (~(!reg11))),
                  (+reg15)} : $unsigned(((~^(reg14 >> reg15)) ^ wire1[(3'h5):(2'h2)])));
        end
    end
  assign wire17 = (($signed(wire0[(3'h4):(1'h1)]) ?
                          $unsigned($signed($unsigned(reg13))) : wire2[(2'h2):(2'h2)]) ?
                      (($unsigned((reg14 ?
                          reg7 : reg15)) >>> (+$signed(reg4))) ^ $unsigned($unsigned((reg14 ?
                          wire3 : reg9)))) : (reg8[(4'hc):(4'h9)] ?
                          (($signed(wire1) ? (|reg7) : {reg16, (8'hb5)}) ?
                              (!(!reg10)) : $unsigned((8'haa))) : $signed((|reg16[(3'h6):(1'h0)]))));
  assign wire18 = $unsigned($unsigned((wire17[(5'h13):(4'h8)] & $signed((reg10 ^ reg9)))));
  assign wire19 = (+reg7);
  always
    @(posedge clk) begin
      reg20 <= (+(wire17[(4'hc):(4'hb)] ?
          $signed((reg15[(1'h1):(1'h0)] <<< (reg9 && (8'haf)))) : ((+reg4[(4'hb):(3'h6)]) ^~ (!reg11))));
      reg21 <= (8'hbf);
      reg22 <= reg21[(2'h2):(2'h2)];
      reg23 <= wire0;
      if ((+$unsigned(reg13[(4'hc):(4'hb)])))
        begin
          if (({(-((reg12 << reg6) ? reg12[(5'h11):(4'ha)] : (wire1 * reg14))),
                  (reg4 * ((wire2 ? (8'h9f) : reg9) - reg14[(4'h8):(2'h3)]))} ?
              reg20[(4'ha):(3'h7)] : $unsigned(reg22)))
            begin
              reg24 <= reg21;
            end
          else
            begin
              reg24 <= {reg7[(1'h1):(1'h1)]};
              reg25 <= reg7[(3'h6):(3'h4)];
              reg26 <= {$signed($signed($unsigned(reg21)))};
              reg27 <= reg9[(1'h0):(1'h0)];
              reg28 <= wire1[(3'h4):(3'h4)];
            end
          if ($signed(({($signed(wire18) <= (wire0 < reg14)),
                  reg8[(4'hc):(1'h0)]} ?
              (($signed((8'hb1)) + $signed(reg11)) ?
                  (wire3 ?
                      ((8'ha2) ~^ wire1) : reg25[(4'hf):(4'h9)]) : (^~(~^wire17))) : ((+(^reg8)) ?
                  $signed((reg7 ?
                      reg4 : (8'ha7))) : $unsigned(reg5[(2'h2):(1'h0)])))))
            begin
              reg29 <= {(reg25[(4'hc):(4'hb)] <<< $unsigned($signed({reg14})))};
              reg30 <= reg21;
              reg31 <= (wire3 <= ($signed(({reg15} && (+reg30))) ?
                  reg21[(4'hf):(4'he)] : (~$unsigned(((8'h9f) ?
                      reg27 : (7'h41))))));
              reg32 <= (~^$signed(((!(reg8 ?
                  wire2 : (8'ha1))) < {$signed(reg5)})));
            end
          else
            begin
              reg29 <= reg20;
              reg30 <= (({((~^wire0) + (~^wire2))} ~^ (|{reg20})) ?
                  (reg10 ~^ reg23[(4'h8):(3'h6)]) : $signed(($unsigned(reg13) >= (reg13[(4'hf):(4'h8)] ?
                      wire18[(4'h8):(3'h4)] : $unsigned(wire1)))));
              reg31 <= reg9[(2'h2):(2'h2)];
            end
          if ($signed((({(~|reg9), (reg27 ? (7'h44) : reg10)} - ((reg23 ?
              (8'h9c) : (8'hb9)) <<< $unsigned(reg8))) != (+((reg32 + reg16) ?
              $unsigned(reg8) : $unsigned(reg21))))))
            begin
              reg33 <= reg13[(3'h6):(2'h2)];
              reg34 <= (^~(~reg5));
              reg35 <= {$unsigned((8'h9d)),
                  ((+$unsigned((reg26 ? (8'ha8) : (8'hac)))) ?
                      reg12[(2'h3):(2'h3)] : $signed((8'hac)))};
              reg36 <= wire3[(3'h5):(3'h4)];
              reg37 <= (+$signed((8'hbd)));
            end
          else
            begin
              reg33 <= reg24[(3'h4):(1'h1)];
              reg34 <= reg15[(1'h0):(1'h0)];
              reg35 <= reg12[(5'h10):(2'h2)];
            end
          reg38 <= (|wire17[(4'hb):(4'h8)]);
        end
      else
        begin
          if ({((8'had) + reg20)})
            begin
              reg24 <= $signed($unsigned(({wire17, (reg30 ? reg12 : reg11)} ?
                  $signed({reg29, reg33}) : ($signed(reg20) ?
                      $signed(wire2) : $unsigned(reg28)))));
              reg25 <= (reg36 >= reg8);
            end
          else
            begin
              reg24 <= ((wire19 ?
                  reg15 : reg35[(1'h1):(1'h0)]) != $unsigned(wire2[(4'hd):(4'ha)]));
              reg25 <= $signed($signed($unsigned((reg9 < ((8'ha0) <= reg34)))));
              reg26 <= reg15[(1'h1):(1'h1)];
            end
          reg27 <= reg9[(1'h0):(1'h0)];
          reg28 <= (^((((wire3 - reg37) ?
                  $unsigned(reg11) : $signed(reg23)) <= $unsigned(wire17[(5'h12):(4'h8)])) ?
              reg4[(3'h6):(3'h4)] : $unsigned(($unsigned((8'h9f)) < (reg25 ?
                  wire2 : reg28)))));
          reg29 <= (|$signed((wire1 ? {$signed(wire18), (&reg31)} : wire3)));
        end
    end
  always
    @(posedge clk) begin
      reg39 <= $unsigned(reg13[(1'h0):(1'h0)]);
    end
  assign wire40 = wire1;
  assign wire41 = {$unsigned({reg37[(1'h0):(1'h0)]})};
  assign wire42 = $unsigned($signed($signed(reg11)));
  assign wire43 = (reg7[(3'h6):(3'h6)] ?
                      (^~{(wire2 ? (!reg7) : reg22[(4'h9):(3'h5)]),
                          $signed($unsigned(wire3))}) : {(8'ha9)});
  module44 #() modinst120 (.wire46(wire40), .wire47(reg38), .y(wire119), .clk(clk), .wire48(reg4), .wire45(reg11));
  always
    @(posedge clk) begin
      reg121 <= reg27[(4'hc):(3'h5)];
      reg122 <= $signed(reg6);
      if (wire40[(3'h4):(3'h4)])
        begin
          reg123 <= $unsigned((!$unsigned(((~|wire119) ?
              {reg25} : (wire42 ~^ reg39)))));
          if ((~(({(reg10 ? (7'h43) : (8'hb6))} ?
                  reg15[(1'h0):(1'h0)] : ($unsigned(reg16) ?
                      (reg6 ? wire40 : reg15) : (wire119 ? (8'ha5) : reg31))) ?
              reg29 : (($signed(wire43) ?
                      (reg35 ? wire40 : reg30) : (wire40 ? reg23 : wire19)) ?
                  reg24[(2'h3):(2'h2)] : ({(8'hb7)} ?
                      reg23 : (reg16 + (7'h40)))))))
            begin
              reg124 <= ($unsigned((reg7 ?
                  (8'hbb) : $unsigned({reg21,
                      reg35}))) | $signed(reg9[(3'h5):(2'h2)]));
              reg125 <= reg33[(4'hb):(2'h3)];
            end
          else
            begin
              reg124 <= $unsigned(reg37[(1'h1):(1'h0)]);
              reg125 <= reg37[(4'h9):(4'h8)];
              reg126 <= {(|reg33)};
              reg127 <= (((reg21 && {$signed(reg14), reg121[(5'h11):(3'h7)]}) ?
                  reg9[(1'h1):(1'h0)] : $unsigned(wire0)) && $signed($unsigned($unsigned((reg9 ?
                  (7'h42) : reg13)))));
              reg128 <= reg24;
            end
          reg129 <= {wire119[(2'h3):(2'h2)]};
          reg130 <= {(~&(8'ha7)), reg14[(3'h4):(1'h0)]};
        end
      else
        begin
          reg123 <= $signed(reg121[(5'h12):(4'hf)]);
          reg124 <= ($signed((^reg21[(3'h5):(2'h2)])) ?
              wire41[(4'ha):(3'h7)] : $signed({wire2,
                  {((8'hb8) ? (8'ha9) : reg5)}}));
        end
      reg131 <= $signed((~&reg8));
    end
  assign wire132 = ((reg7 && reg125[(2'h3):(2'h2)]) > reg23);
  assign wire133 = reg21;
  always
    @(posedge clk) begin
      reg134 <= (~(reg25 << $signed($unsigned($unsigned(reg13)))));
    end
  assign wire135 = (wire1[(1'h1):(1'h1)] ?
                       $unsigned((reg33 ?
                           (~&(reg7 ?
                               reg36 : reg134)) : $unsigned($signed(reg124)))) : ($signed((7'h43)) <<< (~|wire43)));
  assign wire136 = (reg128[(4'ha):(1'h0)] + (~|reg14[(3'h4):(1'h0)]));
  assign wire137 = {reg39};
  assign wire138 = reg7;
  assign wire139 = ((^($signed((~reg123)) >= (reg23 << $unsigned((8'ha6))))) >= wire0[(4'ha):(4'h8)]);
  always
    @(posedge clk) begin
      if ((reg39 ?
          (~(!$signed((reg10 ? wire138 : (8'haa))))) : (($unsigned(wire41) ?
                  reg25 : reg9[(2'h2):(1'h0)]) ?
              reg5 : wire119)))
        begin
          reg140 <= wire43[(3'h5):(1'h0)];
        end
      else
        begin
          reg140 <= (^~wire43);
          if (reg25)
            begin
              reg141 <= $unsigned((~|(reg125[(3'h5):(2'h2)] ?
                  (^~reg6) : (&reg122[(1'h0):(1'h0)]))));
              reg142 <= (({wire17[(4'he):(2'h2)], $signed($signed((8'ha4)))} ?
                      (wire2[(2'h3):(1'h1)] * $signed($unsigned((8'h9e)))) : (8'hb3)) ?
                  reg22[(2'h2):(1'h1)] : reg140[(3'h6):(1'h1)]);
            end
          else
            begin
              reg141 <= ($signed((wire42 ?
                  ($signed(reg15) ?
                      reg29 : (~|reg35)) : wire133[(3'h4):(1'h0)])) & (reg121 <= ((|(reg126 | reg125)) + {reg127[(2'h3):(1'h0)],
                  reg6[(4'hd):(1'h1)]})));
              reg142 <= reg122;
              reg143 <= (|reg123);
              reg144 <= $unsigned(reg37[(2'h3):(1'h0)]);
            end
        end
      if (reg121[(4'h8):(3'h5)])
        begin
          reg145 <= ($unsigned($signed(reg29[(3'h7):(3'h5)])) + {(~^$unsigned(wire139)),
              ($signed((wire138 ? reg134 : reg32)) ?
                  reg142 : ($signed(wire138) ? (wire0 - reg6) : reg22))});
          reg146 <= (~|$unsigned((((reg7 ^ reg129) ~^ (+reg123)) ?
              ((!reg21) || {(8'had), reg125}) : (^(reg127 >> reg121)))));
          if ((8'hb2))
            begin
              reg147 <= $signed({{$signed(reg37[(4'hb):(3'h5)]),
                      $signed($unsigned(reg34))},
                  $signed((~|{wire3, wire43}))});
              reg148 <= $signed(((reg25[(3'h6):(1'h1)] >> (reg145[(3'h5):(3'h4)] ?
                  $unsigned(wire136) : $signed(reg25))) ^ (~&(reg38 <= $signed(reg37)))));
            end
          else
            begin
              reg147 <= (8'hbb);
            end
          reg149 <= $unsigned($unsigned($unsigned(($signed(reg128) ?
              $unsigned(reg35) : reg123[(5'h10):(4'hf)]))));
        end
      else
        begin
          if ($signed(reg122[(4'h8):(3'h6)]))
            begin
              reg145 <= $unsigned($signed(wire19));
            end
          else
            begin
              reg145 <= $signed(wire17);
              reg146 <= wire2;
              reg147 <= $unsigned(wire3[(3'h7):(3'h4)]);
              reg148 <= (~$unsigned({reg32[(4'h8):(2'h3)]}));
            end
        end
      if (reg146[(1'h1):(1'h1)])
        begin
          reg150 <= $signed(({reg5[(2'h3):(2'h2)],
              (~^{reg145, reg16})} - {{(!reg35)}, (8'h9c)}));
          reg151 <= $signed((~^wire2));
        end
      else
        begin
          reg150 <= wire40[(4'he):(4'hd)];
        end
      reg152 <= reg145[(3'h5):(2'h2)];
      reg153 <= reg7;
    end
  assign wire154 = (8'hb2);
endmodule

module module44
#(parameter param118 = ((((((8'hb5) << (7'h44)) <= (8'h9c)) <<< ({(8'ha3)} ? ((8'hb5) - (8'hb7)) : (&(7'h44)))) - (((7'h42) ? ((8'haa) ? (7'h41) : (8'ha9)) : ((8'hb0) ? (8'h9c) : (8'hb1))) - (((8'hb3) ? (7'h41) : (8'hbf)) ? ((8'ha7) * (8'hae)) : ((8'ha4) | (8'had))))) < {(+(((8'ha9) >> (7'h43)) > {(8'hba)}))}))
(y, clk, wire45, wire46, wire47, wire48);
  output wire [(32'h22b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire45;
  input wire signed [(5'h11):(1'h0)] wire46;
  input wire signed [(5'h10):(1'h0)] wire47;
  input wire [(4'he):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire116;
  wire [(4'hd):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire87;
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg [(5'h10):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire113,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 reg115,
                 reg114,
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
                 reg93,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg49 <= (~|(^wire47));
      if ((wire45[(2'h3):(2'h3)] ?
          wire46 : ((wire48[(4'hd):(3'h4)] ?
                  $signed(wire46[(4'h9):(4'h9)]) : {(!reg49), wire47}) ?
              ({$unsigned(wire47)} ?
                  (wire47 ?
                      reg49[(4'ha):(4'h8)] : wire45[(1'h0):(1'h0)]) : wire46[(1'h0):(1'h0)]) : ($signed($unsigned(wire45)) & {(wire48 >> wire46),
                  (reg49 & (8'h9e))}))))
        begin
          if ((~|(($signed($signed(wire45)) ?
                  ((wire47 ~^ wire45) ?
                      (wire45 >= wire46) : (wire48 ?
                          wire47 : wire48)) : wire46[(4'he):(3'h6)]) ?
              $unsigned((wire45 && reg49[(4'hf):(2'h2)])) : $unsigned(((wire48 > wire46) ?
                  (&reg49) : (reg49 - wire45))))))
            begin
              reg50 <= (reg49[(4'h9):(3'h4)] ?
                  ({$signed((|reg49))} ?
                      {{wire48},
                          (&(8'hb2))} : wire45) : (+wire48[(4'he):(2'h2)]));
            end
          else
            begin
              reg50 <= {wire48,
                  (((|wire45) ?
                      (~|$unsigned((8'hb3))) : ($signed(wire46) ?
                          wire48[(1'h0):(1'h0)] : (reg49 >>> wire45))) ^ (+($unsigned(wire46) << wire46[(1'h1):(1'h0)])))};
              reg51 <= wire48;
            end
          reg52 <= {$unsigned($signed(wire47)),
              $unsigned(((((8'ha0) & (8'hbd)) ?
                      $signed(wire46) : $signed(wire46)) ?
                  wire48[(1'h1):(1'h1)] : (((8'ha0) | wire45) ?
                      (wire46 ? wire47 : wire46) : (!wire46))))};
          reg53 <= $signed($signed(wire46));
          reg54 <= reg50[(4'hd):(4'ha)];
          reg55 <= (($signed($unsigned((~&wire47))) ?
              wire47 : (reg50 ?
                  reg51[(4'hb):(4'ha)] : (reg49 ?
                      (&wire47) : $unsigned(wire45)))) << reg49[(3'h6):(3'h6)]);
        end
      else
        begin
          reg50 <= wire45[(2'h2):(1'h0)];
          reg51 <= ($signed(wire48) ?
              $signed(($signed(wire48) ?
                  (|$unsigned(wire46)) : ({reg54} ?
                      (reg52 ? reg55 : reg54) : (^~reg49)))) : reg54);
          reg52 <= ((wire46 ~^ {wire48}) == {((reg51 || (wire45 ?
                  (8'hac) : wire45)) <<< (~|(reg52 ~^ reg53))),
              {$unsigned($unsigned(wire48)), reg53}});
          if ($unsigned(((~($unsigned((7'h41)) >>> {reg55})) ?
              $unsigned($signed((reg51 ?
                  (8'hbc) : reg54))) : $unsigned(((8'hb0) | reg49)))))
            begin
              reg53 <= (wire48 - $signed(reg52));
              reg54 <= ((~^reg55[(4'hc):(2'h2)]) + {$unsigned(({reg53} && $signed(reg55))),
                  $unsigned((~|{reg54}))});
              reg55 <= $signed($signed(wire48));
              reg56 <= reg50;
            end
          else
            begin
              reg53 <= ({(+($signed(reg54) ? $signed(wire48) : (-reg51))),
                      $signed((+(reg51 >= reg53)))} ?
                  reg54 : (~|reg54));
              reg54 <= $signed(reg50);
              reg55 <= wire45[(3'h6):(3'h6)];
              reg56 <= wire48;
              reg57 <= reg56;
            end
          reg58 <= ({{((wire48 >= (8'ha6)) < (reg55 >>> reg56)), (8'haa)}} ?
              (+($signed(reg54) > ($unsigned(wire46) ?
                  (reg54 - reg53) : (!reg55)))) : ($signed(wire46[(4'hf):(3'h7)]) ?
                  (((wire47 ? reg56 : wire46) >> $signed(reg52)) ?
                      (~|(reg49 ~^ wire48)) : $unsigned((reg49 >>> reg50))) : (reg53 + reg57)));
        end
    end
  module59 #() modinst88 (wire87, clk, wire48, reg53, reg57, reg56, reg51);
  assign wire89 = (((wire48 && $signed(reg58)) ?
                      wire87[(4'hb):(3'h4)] : $unsigned($signed((wire47 ?
                          wire87 : wire48)))) <= $unsigned(((reg52 ?
                      reg54[(2'h2):(1'h1)] : reg58) ~^ ((|reg52) ?
                      (wire87 <= wire46) : $signed(reg53)))));
  assign wire90 = ((~|wire89) ^ (reg54 <= reg50[(1'h0):(1'h0)]));
  assign wire91 = {(!({(reg53 ? reg53 : wire47)} ?
                          $unsigned(((8'hb5) >>> reg54)) : reg49[(3'h7):(3'h4)])),
                      ($unsigned(((wire45 ?
                          (8'hae) : (8'hb7)) ^~ (reg54 >= reg52))) & (reg50[(1'h0):(1'h0)] != (&(~&reg58))))};
  assign wire92 = {$unsigned(reg51),
                      ($unsigned(wire47) >= (reg52 && {(~wire45)}))};
  always
    @(posedge clk) begin
      reg93 <= $signed($signed(wire47));
      if (wire47[(5'h10):(4'h8)])
        begin
          reg94 <= (~|reg56[(2'h3):(1'h1)]);
          reg95 <= wire45;
          reg96 <= $unsigned($signed((&$unsigned(((8'ha8) ?
              (8'hae) : wire92)))));
          reg97 <= reg94[(2'h3):(1'h0)];
          reg98 <= (reg57 ?
              $signed((&(((8'ha0) >>> wire92) <= $signed(reg93)))) : reg49[(4'h8):(3'h5)]);
        end
      else
        begin
          if ((wire46 & $unsigned($unsigned((~|(reg58 ? reg98 : wire90))))))
            begin
              reg94 <= $signed(wire89);
              reg95 <= reg57;
            end
          else
            begin
              reg94 <= (^~reg51[(5'h13):(4'h9)]);
              reg95 <= $signed((-(^((+reg54) ^ (reg55 <<< wire46)))));
            end
          reg96 <= $unsigned($unsigned($signed((~&(wire45 >= reg97)))));
          if ($unsigned((~^((wire89[(2'h3):(2'h3)] <= (reg93 ?
              reg57 : reg51)) != ((reg50 ? (8'hb4) : wire47) ?
              $signed(wire87) : (reg96 < reg97))))))
            begin
              reg97 <= (reg95 ^ reg49);
              reg98 <= $unsigned(((((~^reg51) ?
                  $signed(wire48) : (~wire90)) | (^(+reg54))) && ((~(reg58 ?
                      (8'hb8) : reg57)) ?
                  {$unsigned(wire90), $unsigned(reg50)} : (reg93 ?
                      (-reg55) : (~|(8'hb7))))));
              reg99 <= (^reg97);
              reg100 <= (reg58 <<< (^~reg51));
            end
          else
            begin
              reg97 <= ((^(~|wire87)) ?
                  $signed((-wire87[(3'h5):(2'h2)])) : $signed((^reg93)));
              reg98 <= ($unsigned($signed((~(reg95 ? reg97 : wire48)))) ?
                  reg100 : wire90);
              reg99 <= $unsigned((wire45[(3'h7):(1'h1)] * reg58[(1'h0):(1'h0)]));
              reg100 <= (8'hb0);
            end
        end
      if (reg56)
        begin
          reg101 <= ($signed($unsigned((^(~&reg49)))) ^~ (~|$signed(((wire92 ?
              wire48 : wire92) || $unsigned(reg56)))));
          reg102 <= reg93;
          reg103 <= reg57;
          if (reg98)
            begin
              reg104 <= ((~|{(reg58[(5'h11):(4'ha)] < wire89)}) ?
                  (~reg94) : (~|(reg58[(1'h1):(1'h0)] | wire87)));
              reg105 <= wire46;
              reg106 <= reg51;
              reg107 <= (~((wire48 ?
                  (~&(wire90 ?
                      reg106 : (8'hb8))) : $unsigned($signed(wire46))) != (&($signed(reg56) ?
                  $unsigned(wire89) : (8'hb8)))));
            end
          else
            begin
              reg104 <= (reg52[(4'ha):(3'h5)] ?
                  (reg54 ?
                      (wire92 ?
                          ((wire46 & reg106) && (wire45 ?
                              reg50 : reg97)) : reg100[(5'h12):(5'h12)]) : {$unsigned(((8'hbb) ?
                              reg97 : (8'ha7))),
                          (|((8'hb7) > reg101))}) : reg97);
              reg105 <= $signed($unsigned(reg100));
              reg106 <= (reg51 ?
                  ((($signed((8'h9d)) ^~ (~^reg99)) || {reg96}) <= $signed($unsigned($unsigned(reg106)))) : reg100[(1'h0):(1'h0)]);
              reg107 <= {((^~wire45) ?
                      $signed((8'hbc)) : $unsigned($signed(reg95)))};
            end
          if ($signed($unsigned(((~{reg96,
              wire87}) << $signed($signed(wire92))))))
            begin
              reg108 <= reg51[(4'hc):(1'h0)];
            end
          else
            begin
              reg108 <= (8'ha3);
            end
        end
      else
        begin
          reg101 <= reg99;
          reg102 <= (+reg105[(2'h2):(2'h2)]);
          reg103 <= ((~reg98[(4'ha):(2'h2)]) ?
              reg56[(4'h8):(2'h3)] : (($unsigned(reg99[(5'h11):(3'h6)]) >> (7'h44)) ?
                  reg52[(4'hd):(4'hc)] : (+(+(reg98 < wire92)))));
          if ({(($signed(reg95[(1'h0):(1'h0)]) - reg54[(5'h14):(5'h13)]) ?
                  $signed($unsigned({wire45})) : (~{{reg95, wire90}, reg96})),
              ((-((&reg49) ? {reg50, reg106} : wire45)) ?
                  (~|$signed($signed(reg57))) : reg108[(3'h7):(3'h6)])})
            begin
              reg104 <= reg49[(5'h11):(4'hc)];
              reg105 <= wire92[(2'h2):(2'h2)];
            end
          else
            begin
              reg104 <= reg52[(4'hd):(4'h9)];
              reg105 <= reg99;
            end
          if (reg53)
            begin
              reg106 <= ((((reg107[(1'h1):(1'h0)] ?
                              $unsigned((7'h41)) : {(8'h9d)}) ?
                          wire91 : reg101[(5'h11):(4'h8)]) ?
                      $signed($signed((+(8'hac)))) : wire90[(1'h0):(1'h0)]) ?
                  wire87[(5'h12):(5'h10)] : $signed($unsigned({wire91,
                      {reg107}})));
              reg107 <= wire46;
            end
          else
            begin
              reg106 <= $signed($signed({(((8'ha7) ? reg57 : reg93) ?
                      (reg96 && reg97) : $signed(reg98)),
                  $unsigned(((8'hb1) ? wire46 : (8'hb4)))}));
              reg107 <= reg108;
              reg108 <= reg105[(3'h4):(2'h3)];
              reg109 <= (wire91 && (reg104[(2'h3):(2'h2)] + ($unsigned((-reg53)) == ((reg50 ~^ wire89) ?
                  reg53[(3'h4):(1'h1)] : (8'hbe)))));
              reg110 <= $signed({(reg99[(3'h5):(1'h1)] ?
                      wire87 : $signed($signed(reg96))),
                  $signed($signed((wire87 ? reg98 : reg57)))});
            end
        end
      reg111 <= $signed($signed($signed(($unsigned(reg101) & wire47))));
      reg112 <= ((+wire87[(1'h1):(1'h1)]) ~^ $signed((^~$unsigned((7'h41)))));
    end
  assign wire113 = $signed($signed(($unsigned($unsigned(reg97)) ?
                       ($unsigned(reg104) - (reg97 ?
                           (7'h40) : reg51)) : reg110[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      reg114 <= (|wire92);
      reg115 <= $signed((reg111 < reg103[(1'h0):(1'h0)]));
    end
  assign wire116 = ($signed($unsigned(wire48[(4'h9):(1'h1)])) ?
                       ($signed((~(reg105 ^ wire47))) ?
                           ($signed((reg111 && (8'h9c))) | ((reg105 & reg94) ?
                               (wire48 | reg50) : reg102[(1'h0):(1'h0)])) : (reg111[(4'hb):(4'h9)] >= {reg50[(4'hc):(3'h6)],
                               wire90})) : (+$signed((reg56 ^~ (!reg114)))));
  assign wire117 = {($signed(reg100[(4'h9):(3'h7)]) ?
                           $unsigned((~^(wire47 > reg103))) : wire91[(3'h4):(1'h1)])};
endmodule

module module59
#(parameter param85 = {(((((8'h9c) + (8'hbd)) ? ((8'ha3) || (8'ha8)) : ((8'h9d) << (7'h42))) & (+((8'had) >= (8'ha2)))) ? ((((7'h41) >= (7'h40)) - {(8'hb1)}) * (-(!(8'ha1)))) : {(~^((7'h42) * (8'hb9)))})}, 
parameter param86 = {((+(param85 ? ((8'hbe) ? param85 : param85) : (param85 == param85))) ? param85 : (param85 >= ((~param85) * {(7'h40)})))})
(y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire64;
  input wire [(4'hc):(1'h0)] wire63;
  input wire signed [(4'h9):(1'h0)] wire62;
  input wire signed [(5'h11):(1'h0)] wire61;
  input wire signed [(5'h15):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire signed [(4'hf):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire70,
                 wire66,
                 wire65,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire65 = wire63;
  assign wire66 = wire65[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      if ($signed(wire63))
        begin
          reg67 <= {(~&(wire65 < (8'hb7)))};
        end
      else
        begin
          reg67 <= (8'ha5);
          reg68 <= ($unsigned({((~|wire63) ~^ wire66), (!$unsigned(wire66))}) ?
              wire63 : wire65);
        end
      reg69 <= ($signed((wire64 ?
              reg67[(1'h0):(1'h0)] : ($signed((8'ha6)) - (~^wire64)))) ?
          {wire64} : (~(^~($unsigned(wire65) != (wire66 <<< wire60)))));
    end
  assign wire70 = {$unsigned($signed({(~&wire64)}))};
  always
    @(posedge clk) begin
      reg71 <= $unsigned(($signed((^((8'hab) != wire62))) ?
          wire63[(4'h9):(1'h1)] : $unsigned((8'ha8))));
      if (wire70)
        begin
          reg72 <= (((wire64[(2'h2):(2'h2)] ?
              (reg67 && (-wire63)) : reg69[(3'h7):(2'h3)]) >= {($unsigned(reg68) | (&wire63))}) ^~ ((-wire64[(3'h6):(3'h6)]) ?
              ((wire60[(2'h2):(2'h2)] ? (7'h44) : $signed(reg71)) ?
                  {reg69} : {$signed((8'hb5))}) : $signed((8'hae))));
          reg73 <= $unsigned(reg68);
          reg74 <= $signed(reg68[(5'h11):(2'h3)]);
          reg75 <= {(+($signed(wire64[(1'h0):(1'h0)]) + (((8'hb3) ?
                  reg72 : reg72) * $signed((8'ha4))))),
              $signed(wire70[(1'h1):(1'h1)])};
        end
      else
        begin
          reg72 <= ($unsigned(wire70) > $signed($signed((wire62 ?
              (+wire66) : (-reg75)))));
          if (reg67)
            begin
              reg73 <= $signed((wire62[(4'h8):(3'h4)] ?
                  $unsigned({{reg67, (8'hb9)},
                      $unsigned((8'hb4))}) : $unsigned(wire66)));
              reg74 <= (({$signed(wire66[(1'h0):(1'h0)])} ?
                  (|wire63[(2'h2):(1'h1)]) : $signed(wire60[(4'hc):(4'hb)])) > {(wire70[(3'h7):(3'h4)] ?
                      $signed((wire65 <<< (8'h9c))) : $signed(wire61[(1'h0):(1'h0)]))});
              reg75 <= $signed(reg73);
            end
          else
            begin
              reg73 <= (((wire60[(1'h0):(1'h0)] ?
                          ((~^(8'hbe)) ?
                              $unsigned(reg69) : wire61) : (~|wire61)) ?
                      $signed(reg75[(1'h1):(1'h1)]) : reg67) ?
                  (reg68 ?
                      (wire66[(1'h0):(1'h0)] ?
                          (~(wire62 ?
                              reg72 : wire60)) : (-(^~wire61))) : $signed((&(reg69 ?
                          wire63 : reg75)))) : {reg71[(1'h0):(1'h0)]});
              reg74 <= $unsigned((8'ha6));
            end
        end
      reg76 <= reg74[(5'h12):(4'he)];
    end
  assign wire77 = {wire65};
  assign wire78 = $unsigned(((reg68 + ($unsigned(reg69) != (~reg67))) ?
                      $unsigned((^reg71[(1'h1):(1'h0)])) : wire66[(2'h2):(1'h1)]));
  assign wire79 = $unsigned($signed(reg73));
  assign wire80 = ($unsigned($unsigned({(wire66 >= wire60),
                      $signed(wire62)})) || {((8'ha5) ?
                          (~|(!reg68)) : (&(wire60 != wire62)))});
  assign wire81 = (~|$signed((^$unsigned(reg73))));
  assign wire82 = ($signed($signed(((wire77 >= reg67) & (!reg69)))) >= reg71);
  assign wire83 = (~($unsigned(wire60[(4'ha):(2'h3)]) ?
                      ((reg73 ? reg71 : reg76[(1'h1):(1'h0)]) ?
                          (|reg71) : reg69[(1'h1):(1'h1)]) : reg73[(1'h0):(1'h0)]));
  assign wire84 = reg67[(3'h5):(2'h2)];
endmodule
