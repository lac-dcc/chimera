module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire14;
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire19,
                 wire14,
                 reg42,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
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
  always
    @(posedge clk) begin
      reg5 <= $unsigned((&wire1[(4'h8):(1'h1)]));
      if ((({(~$signed(reg5))} + {$signed((wire2 ? wire4 : (8'hac))),
          wire4[(4'h9):(1'h1)]}) != {wire0[(1'h1):(1'h1)]}))
        begin
          if ($unsigned(((~|((wire0 && wire4) ?
              wire2 : (^wire4))) == $signed((-((8'hb1) ? wire3 : wire3))))))
            begin
              reg6 <= ({wire1[(3'h7):(1'h0)],
                  $unsigned($unsigned($unsigned(wire1)))} < wire2);
              reg7 <= wire3[(2'h3):(2'h3)];
            end
          else
            begin
              reg6 <= ($unsigned(({reg6} ~^ (8'ha6))) ?
                  ($unsigned(reg6[(2'h2):(1'h1)]) ?
                      (((8'hae) ?
                          reg7 : (reg6 ? wire0 : wire3)) < (((8'ha0) >= reg7) ?
                          (reg5 | wire4) : wire0)) : $signed(wire0)) : reg5);
              reg7 <= reg5[(1'h1):(1'h0)];
              reg8 <= (8'hb4);
              reg9 <= $unsigned($unsigned($signed(wire4[(1'h1):(1'h1)])));
            end
          reg10 <= $signed({wire0, wire2});
          reg11 <= reg8[(4'hb):(4'ha)];
        end
      else
        begin
          reg6 <= (reg7[(4'hb):(4'h8)] >>> $unsigned($signed(wire3)));
          reg7 <= (!reg6[(4'h9):(3'h7)]);
          reg8 <= (8'haa);
          reg9 <= {$signed(wire3), reg5[(3'h6):(3'h4)]};
        end
      reg12 <= ($unsigned(($signed($signed(reg6)) ?
              $signed($signed(wire4)) : ($signed(wire3) ?
                  $unsigned(reg11) : {wire3, reg7}))) ?
          reg10 : (reg7[(4'h8):(3'h6)] || wire1));
      reg13 <= (($signed(reg5) == reg10) && (~$unsigned({$signed(wire3)})));
    end
  assign wire14 = $unsigned($unsigned(reg9));
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg15 <= $signed((((&(reg13 >= (8'ha6))) || $unsigned($unsigned(wire2))) || $unsigned((~(reg10 ?
              wire0 : reg11)))));
          reg16 <= (!((wire0[(1'h1):(1'h0)] ?
              reg6[(1'h1):(1'h0)] : $unsigned((reg9 ?
                  reg13 : (7'h42)))) << $unsigned(reg7)));
          reg17 <= reg12[(3'h6):(1'h1)];
        end
      else
        begin
          reg15 <= wire3[(2'h2):(2'h2)];
          reg16 <= (~|$unsigned(reg9[(4'hb):(3'h6)]));
          reg17 <= (!((reg9[(2'h2):(2'h2)] ?
              ((8'ha4) ?
                  $signed(reg10) : (reg16 != reg12)) : (reg15[(3'h5):(1'h1)] && reg10)) ^~ (~|wire3[(2'h3):(1'h1)])));
          reg18 <= (((reg9[(2'h3):(1'h1)] ?
                      wire1[(4'h9):(2'h2)] : $unsigned({wire3})) ?
                  (^~$unsigned((wire2 ? reg13 : reg7))) : (($unsigned(reg8) ?
                      $signed(reg15) : {wire3, reg8}) >>> $unsigned({reg11,
                      reg12}))) ?
              $signed($unsigned(reg13)) : ($unsigned((~^(wire4 * reg11))) ?
                  (8'ha0) : $unsigned((wire4[(4'h9):(4'h9)] ?
                      $unsigned(wire1) : (~|reg11)))));
        end
    end
  assign wire19 = $unsigned((reg13[(4'h9):(1'h0)] ?
                      reg7 : $signed({(reg17 << reg16), reg9})));
  always
    @(posedge clk) begin
      reg20 <= (((^$unsigned((-reg8))) >>> reg16) && wire3);
      reg21 <= wire1[(4'h9):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg22 <= reg20;
      if (((&(~|$signed($signed(reg18)))) || (~^reg20[(2'h3):(2'h2)])))
        begin
          if (((~^(((^wire3) ? reg20 : (8'hae)) ^~ reg5[(2'h2):(1'h0)])) ?
              reg8[(4'he):(4'h8)] : (&$unsigned((reg20[(1'h0):(1'h0)] ?
                  (wire1 ? reg7 : reg12) : (reg12 <= reg17))))))
            begin
              reg23 <= ((&($unsigned({reg11, reg10}) ?
                      ((!reg21) - $signed(reg22)) : reg6[(4'h8):(1'h0)])) ?
                  reg21 : (^$unsigned(((reg6 < wire14) + ((7'h40) <= wire14)))));
              reg24 <= ($unsigned(({$unsigned((8'hac)), {reg18}} ?
                      $unsigned((^wire0)) : (reg22 ?
                          reg13[(4'hd):(4'hd)] : reg10))) ?
                  (+$unsigned(reg23)) : reg22);
            end
          else
            begin
              reg23 <= ({(8'had),
                  (((reg12 & reg17) && (reg10 * wire2)) ?
                      $unsigned(reg16[(4'hc):(1'h0)]) : (~$signed(reg21)))} < ($unsigned({reg16,
                  ((7'h42) ?
                      reg11 : reg21)}) >>> (($signed((8'hb6)) ^~ (wire14 ?
                      reg22 : reg5)) ?
                  $unsigned($unsigned((8'hb9))) : reg13)));
            end
          reg25 <= wire4[(1'h1):(1'h0)];
        end
      else
        begin
          if (reg6[(4'h9):(4'h9)])
            begin
              reg23 <= (7'h41);
            end
          else
            begin
              reg23 <= reg5[(3'h5):(2'h3)];
              reg24 <= reg7;
              reg25 <= wire0;
              reg26 <= ($signed((reg11 ?
                      (&$unsigned(wire1)) : reg23[(3'h5):(1'h1)])) ?
                  $signed(({wire1[(2'h3):(1'h0)],
                      (7'h44)} >>> $signed(reg16))) : (($unsigned($signed((8'hb7))) ?
                          ({reg5, reg20} >>> $unsigned(wire14)) : ((reg9 ?
                              wire14 : wire4) ^~ reg11)) ?
                      (($unsigned(wire2) ?
                          $signed(reg16) : $signed(wire2)) * {(^~reg15)}) : reg16[(4'h8):(3'h5)]));
            end
        end
      reg27 <= $signed(reg16[(3'h5):(3'h5)]);
      if ($unsigned($signed(reg8[(3'h5):(2'h3)])))
        begin
          reg28 <= $unsigned(reg26[(5'h13):(4'hc)]);
          reg29 <= $unsigned(reg11[(2'h3):(2'h3)]);
          reg30 <= reg6;
          reg31 <= reg5;
          if (reg24[(4'hf):(4'h9)])
            begin
              reg32 <= reg7;
              reg33 <= {$signed((-((wire2 ? (8'h9d) : reg8) ?
                      $signed(wire4) : {wire1, wire4})))};
              reg34 <= $unsigned($unsigned((wire1[(3'h7):(3'h4)] ?
                  ((&(8'ha4)) | $unsigned(reg15)) : ((wire19 ?
                      wire1 : reg9) > reg22[(5'h11):(3'h5)]))));
              reg35 <= (reg9 ^ {wire3});
              reg36 <= (-(|(reg20[(3'h6):(2'h2)] - reg28)));
            end
          else
            begin
              reg32 <= $signed(((+{(&reg16)}) ?
                  $unsigned(reg5) : (~|$unsigned({wire1, reg5}))));
              reg33 <= (8'ha5);
              reg34 <= ((($unsigned({wire19,
                  (8'ha1)}) ^ (-reg24[(1'h1):(1'h1)])) <<< reg9[(4'h9):(4'h9)]) == reg28[(4'hb):(4'hb)]);
              reg35 <= wire1;
              reg36 <= (~&reg34[(3'h7):(2'h3)]);
            end
        end
      else
        begin
          reg28 <= (reg24 < reg11[(1'h0):(1'h0)]);
          reg29 <= $signed((({(reg21 + reg31),
                  (wire4 ? (8'ha8) : wire14)} << wire2) ?
              $signed((&$signed(wire4))) : ((reg30[(5'h10):(4'h8)] ?
                      wire1 : (^~reg30)) ?
                  ({reg34} >> reg34[(4'hf):(3'h4)]) : ($unsigned(wire19) ?
                      $unsigned((8'ha7)) : {reg16}))));
          reg30 <= reg27[(1'h1):(1'h0)];
          reg31 <= (^reg26);
        end
    end
  assign wire37 = (reg31[(3'h5):(2'h2)] ? wire0 : $signed(reg26));
  assign wire38 = (((8'ha2) ?
                          $signed((!reg28[(3'h7):(1'h0)])) : $signed(reg13)) ?
                      ($signed((!$signed(wire3))) ?
                          reg33[(3'h4):(2'h2)] : reg23) : wire14[(2'h3):(2'h3)]);
  assign wire39 = (!(+(7'h41)));
  assign wire40 = ((^~wire37) + ($signed(reg24) ?
                      ((^~(8'hba)) ?
                          ({reg30, reg12} ^~ (~|(8'hb3))) : (~|(reg9 ?
                              reg5 : reg16))) : {$signed((reg9 ~^ reg23))}));
  assign wire41 = (7'h40);
  always
    @(posedge clk) begin
      reg42 <= $unsigned($unsigned($unsigned((8'hb2))));
    end
endmodule
