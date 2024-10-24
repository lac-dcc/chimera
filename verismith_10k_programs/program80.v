module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire55;
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire19,
                 wire23,
                 wire26,
                 wire55,
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
                 reg20,
                 reg21,
                 reg22,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = wire1;
  always
    @(posedge clk) begin
      reg7 <= $unsigned(wire0[(1'h0):(1'h0)]);
      if ($unsigned(((^~wire2) << wire4[(3'h4):(1'h0)])))
        begin
          if ($signed(({wire0[(4'hb):(1'h0)],
                  ($signed(wire3) || ((8'ha3) & wire6))} ?
              $signed(wire1[(1'h0):(1'h0)]) : wire4)))
            begin
              reg8 <= (~^{reg7,
                  (($signed(wire0) == (~^reg7)) != (^$unsigned(wire4)))});
              reg9 <= wire5;
              reg10 <= (8'hbd);
            end
          else
            begin
              reg8 <= (+(~wire6[(2'h2):(1'h1)]));
              reg9 <= ({wire1[(1'h1):(1'h0)]} * (~&$signed(wire3[(4'ha):(2'h3)])));
              reg10 <= wire2;
            end
          reg11 <= wire3;
          reg12 <= $signed(reg8);
          if (({$signed($unsigned((wire0 * wire2))),
              $unsigned($unsigned(wire6[(2'h2):(1'h1)]))} < (wire3[(3'h6):(1'h0)] ?
              (($signed((8'hb9)) <<< $unsigned((8'ha2))) ?
                  ((wire4 * wire1) - wire2[(1'h0):(1'h0)]) : $unsigned((+wire3))) : $signed((reg7[(2'h3):(2'h2)] > {(7'h42),
                  wire5})))))
            begin
              reg13 <= wire0[(4'ha):(1'h0)];
              reg14 <= wire5;
              reg15 <= $signed((&{{{reg9, wire2}, reg13[(2'h2):(1'h1)]}}));
              reg16 <= (((^$unsigned($unsigned((8'hb3)))) ?
                  (^(|reg13[(1'h1):(1'h1)])) : $unsigned($signed((~reg15)))) || (({reg7,
                      $unsigned(wire1)} != reg8[(3'h4):(1'h0)]) ?
                  (|((wire4 ? wire6 : (8'hb1)) ?
                      ((7'h43) ?
                          reg12 : wire2) : wire1[(2'h2):(2'h2)])) : $signed((!$signed(reg13)))));
              reg17 <= wire1[(1'h0):(1'h0)];
            end
          else
            begin
              reg13 <= {($signed($unsigned((wire4 ?
                      reg10 : (8'h9c)))) <<< $unsigned(reg17[(1'h1):(1'h1)]))};
            end
          reg18 <= $unsigned(wire5);
        end
      else
        begin
          reg8 <= $unsigned($signed(($unsigned(((8'ha1) & wire0)) ?
              {$signed(reg18)} : $signed((~reg11)))));
          reg9 <= $signed($signed(wire4[(3'h6):(3'h4)]));
        end
    end
  assign wire19 = $signed((wire6[(2'h3):(2'h3)] ^~ reg12));
  always
    @(posedge clk) begin
      reg20 <= {$signed(reg8[(1'h1):(1'h0)]),
          {($unsigned(((7'h43) * reg7)) ?
                  (wire2 <<< (8'hbc)) : (!(wire4 & reg10)))}};
      reg21 <= wire19[(4'hb):(4'hb)];
      reg22 <= {((-$signed((reg14 | reg11))) | reg11)};
    end
  assign wire23 = wire19[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg24 <= ($unsigned(reg14[(4'h8):(3'h4)]) > (wire19 ?
          ((((8'ha7) ? reg9 : reg11) ? (8'h9f) : (wire0 ? wire1 : wire6)) ?
              ({(8'hb0)} && (&(8'ha4))) : (reg20 != (wire0 >> reg20))) : (reg7[(4'h8):(3'h4)] * wire2[(1'h1):(1'h0)])));
      reg25 <= $unsigned($signed((^{$unsigned(reg14), reg11[(4'h9):(4'h8)]})));
    end
  assign wire26 = $unsigned((^($signed((reg18 ? wire5 : reg13)) ?
                      wire1 : $unsigned((|reg16)))));
  module27 #() modinst56 (.y(wire55), .wire30(wire6), .wire28(wire3), .wire29(wire0), .clk(clk), .wire31(reg15));
endmodule

module module27
#(parameter param53 = (~|(^{((~(8'ha2)) && (-(7'h42)))})), 
parameter param54 = (-((-({param53} >= ((8'hb2) | (8'hb8)))) ? (~^({param53} + ((8'ha8) ? param53 : (8'had)))) : (8'hb4))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire31;
  input wire [(5'h13):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire signed [(4'hc):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  assign y = {wire52,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire33,
                 wire32,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire32 = {wire28};
  assign wire33 = wire28;
  always
    @(posedge clk) begin
      reg34 <= $signed({(-($unsigned(wire29) ? $unsigned(wire31) : {wire31}))});
      reg35 <= {$unsigned(reg34)};
    end
  assign wire36 = (~$signed($signed(wire29)));
  assign wire37 = reg35;
  assign wire38 = (~^(^(-$signed($signed(wire32)))));
  assign wire39 = (wire37 ? $signed($signed(reg35)) : {{{(~wire29)}, wire37}});
  assign wire40 = reg35;
  assign wire41 = ((~^(({reg35} ?
                      $signed(reg34) : (wire40 >>> wire28)) ^ reg34)) <= wire33[(2'h2):(2'h2)]);
  assign wire42 = (reg35[(1'h1):(1'h1)] ?
                      (-$unsigned(wire39[(3'h7):(1'h0)])) : ((($signed(wire39) ?
                              wire32[(1'h1):(1'h0)] : (wire37 ?
                                  wire29 : reg34)) ?
                          $signed(((8'hb7) ?
                              wire33 : wire37)) : $signed($signed(wire38))) > wire33));
  assign wire43 = ($signed((8'hb0)) ?
                      reg34 : ((((!wire41) ?
                              wire33[(4'hd):(4'hd)] : {wire28,
                                  wire29}) >>> $unsigned(wire41)) ?
                          $signed(((wire39 >> wire39) >>> $unsigned(wire28))) : wire30));
  assign wire44 = $signed((-(~&$signed(wire29[(4'hd):(2'h3)]))));
  assign wire45 = (((|$unsigned($unsigned(wire40))) ?
                      $signed(($signed(wire36) ?
                          (|reg34) : wire44[(1'h1):(1'h0)])) : {wire41[(4'hc):(3'h7)]}) << wire31[(4'hd):(4'h8)]);
  always
    @(posedge clk) begin
      reg46 <= $signed(wire40);
      reg47 <= $unsigned((wire43 || (wire32 ?
          ((|reg34) | (|(8'h9d))) : $unsigned((|wire44)))));
      reg48 <= $unsigned(reg47[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg49 <= {(~|$unsigned(reg34[(2'h3):(2'h2)])),
          $unsigned($signed($unsigned((wire44 && wire42))))};
      reg50 <= reg35;
      reg51 <= wire28[(4'hc):(1'h1)];
    end
  assign wire52 = wire40[(5'h13):(5'h11)];
endmodule
