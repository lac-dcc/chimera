module top
#(parameter param36 = ((({(-(8'hac)), (&(8'hbc))} + ((8'ha0) || ((8'h9c) & (7'h40)))) + ({((8'h9d) >= (8'hbb))} ^~ ((|(8'ha3)) * {(7'h44)}))) | (((^~((7'h41) ? (7'h41) : (8'hb6))) < (~&((8'ha1) ? (8'hb8) : (8'hbf)))) < (((8'hb7) ~^ (~&(7'h41))) ? (((8'hb4) ~^ (8'h9e)) ? ((7'h41) >= (8'h9e)) : (!(8'hbf))) : ((~|(8'h9c)) ? {(8'hac)} : (^(8'hbe)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire17,
                 wire16,
                 wire6,
                 wire5,
                 reg32,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = ((!$unsigned(wire2[(2'h3):(1'h1)])) << (~^{$unsigned((wire4 ?
                         wire0 : wire1)),
                     wire0}));
  assign wire6 = {((wire0 ?
                         wire5 : wire0[(4'ha):(4'h8)]) != (!($unsigned(wire0) >= wire5))),
                     $signed(wire3)};
  always
    @(posedge clk) begin
      reg7 <= (8'haa);
      reg8 <= (-($signed(wire4) >>> $signed($unsigned(wire0))));
      reg9 <= wire1;
      reg10 <= (((!wire2) ?
              {$signed({wire0, wire0}),
                  (reg9 ?
                      wire6[(5'h10):(4'hc)] : ((8'hbd) ?
                          wire3 : reg9))} : ((((8'ha5) ? wire1 : wire3) ?
                      wire1 : (wire2 >>> wire1)) ?
                  wire2 : $unsigned($signed(wire3)))) ?
          {wire3[(4'hf):(3'h4)],
              (|(wire5 && (!wire2)))} : (reg8[(3'h4):(3'h4)] ?
              $unsigned($unsigned(wire4[(1'h0):(1'h0)])) : (&$unsigned(wire5[(2'h3):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      reg11 <= (reg9 < reg8);
      reg12 <= ((wire2 ?
              $signed($unsigned(((8'ha4) ?
                  wire5 : reg10))) : wire0[(4'hb):(3'h5)]) ?
          $unsigned($unsigned(reg11)) : ((($signed(wire3) | (wire0 >= wire4)) ^ $signed(wire5[(4'h9):(4'h8)])) ?
              (~&({wire3, reg10} * (reg10 ?
                  reg7 : wire2))) : {$unsigned((wire2 >>> wire6))}));
      reg13 <= (-reg9);
      reg14 <= ((($signed($unsigned(reg8)) < (~(!wire4))) ?
          ((wire5 != (reg12 ? reg12 : wire5)) ?
              wire2 : $signed(reg7[(4'h9):(3'h4)])) : $signed(wire1)) >>> $signed($signed($signed(reg9[(1'h1):(1'h1)]))));
      reg15 <= $signed(reg7);
    end
  assign wire16 = (~^wire6[(3'h4):(2'h3)]);
  assign wire17 = reg8[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg18 <= $signed(reg14);
          reg19 <= (({$unsigned(((8'hbe) ? wire2 : reg8))} ?
              ($unsigned(reg10[(3'h4):(1'h1)]) >>> reg12[(3'h4):(1'h1)]) : {$unsigned((reg13 + wire16))}) | wire16[(4'hc):(1'h1)]);
          reg20 <= ((~&{$unsigned(wire0[(4'he):(4'hb)])}) < $unsigned(reg18[(4'he):(3'h7)]));
          reg21 <= reg12;
          reg22 <= {reg9};
        end
      else
        begin
          reg18 <= $signed($signed((reg20 * {(reg20 <<< reg18),
              $signed(reg18)})));
          reg19 <= reg22;
          reg20 <= (!$signed($unsigned(($unsigned(wire5) || {reg21}))));
          reg21 <= (!$unsigned(reg21));
        end
      if (reg13[(4'ha):(4'h9)])
        begin
          reg23 <= (wire5 & ($signed($unsigned({wire17})) | (8'hac)));
          reg24 <= $signed($signed((({wire16, (7'h43)} ^ $unsigned(reg23)) ?
              (|(!reg20)) : $unsigned({reg11}))));
          reg25 <= (+({($signed(reg12) ? {wire0} : reg19)} >= {((8'hb2) ?
                  reg7[(3'h5):(2'h3)] : reg8),
              ((|(8'hb1)) ? (8'hb2) : (!reg22))}));
          reg26 <= wire6[(3'h5):(2'h3)];
        end
      else
        begin
          reg23 <= $signed($unsigned(((-wire5[(3'h6):(1'h0)]) ?
              ((reg14 || wire2) ?
                  $signed(reg26) : (8'hb7)) : $signed($unsigned(reg25)))));
          reg24 <= {((~(^wire6[(2'h3):(1'h0)])) ?
                  $signed(((reg22 ? wire2 : (8'hb6)) ?
                      (reg15 == reg10) : $signed(wire6))) : reg9)};
          reg25 <= reg20;
          if (($signed(({{reg20},
              (wire0 ?
                  wire2 : wire2)} || wire1)) >= {($unsigned((wire2 ~^ reg10)) ?
                  $unsigned((~&wire0)) : $unsigned((reg22 ? reg19 : reg25)))}))
            begin
              reg26 <= wire4[(2'h2):(1'h1)];
              reg27 <= (wire0[(4'hc):(2'h3)] ?
                  $unsigned(((^(!wire1)) >= reg13[(2'h3):(1'h1)])) : reg24[(2'h2):(2'h2)]);
            end
          else
            begin
              reg26 <= (wire5 ?
                  ((wire2 ?
                      ($signed((8'h9d)) >= $signed(reg10)) : ($unsigned(reg13) ?
                          (reg8 >= reg25) : $unsigned(wire4))) >= $unsigned(((wire2 ?
                          wire6 : reg7) ?
                      {reg20, wire4} : (wire3 ?
                          (7'h41) : reg23)))) : $signed(reg12[(3'h5):(3'h4)]));
              reg27 <= $unsigned(reg9);
              reg28 <= $signed($signed(reg27));
              reg29 <= ((!(((wire6 == reg9) <= (reg20 ?
                      reg26 : reg9)) != (^(reg20 ? reg7 : (8'hb1))))) ?
                  ((~^(reg10[(4'h8):(3'h4)] ?
                      wire4 : reg21)) * ($signed((reg28 ~^ wire3)) >> ((reg10 > reg27) ?
                      (!reg19) : wire4))) : reg25);
              reg30 <= $signed((~$signed({(&reg19), reg28[(3'h7):(3'h7)]})));
            end
        end
      reg31 <= ((!$unsigned(((reg13 + reg15) ?
          reg25[(2'h3):(2'h2)] : ((8'ha3) ?
              reg8 : reg27)))) == (((!(wire0 & reg30)) || wire6[(5'h12):(4'hf)]) ?
          ((reg20 != {reg7, reg25}) & $signed(((8'hac) ?
              reg8 : reg20))) : (($unsigned(wire6) ?
              $signed(reg25) : {reg24, (8'ha6)}) == ((reg23 <= reg12) ?
              $unsigned(reg21) : reg24[(3'h5):(2'h3)]))));
      reg32 <= reg27[(5'h13):(4'ha)];
    end
  assign wire33 = {(!({$unsigned(wire0), $signed((8'hbd))} ?
                          wire4 : $signed($unsigned(reg29))))};
  assign wire34 = $unsigned(reg7);
  assign wire35 = {(8'ha2), {$signed(wire16), ({reg7} < (8'haf))}};
endmodule
