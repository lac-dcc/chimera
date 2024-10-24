module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire5,
                 wire4,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg29,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
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
  assign wire4 = $unsigned(wire2[(1'h1):(1'h1)]);
  assign wire5 = $signed(wire1[(4'ha):(3'h4)]);
  always
    @(posedge clk) begin
      reg6 <= wire0[(4'hd):(4'h8)];
      if ($signed(wire0[(4'he):(4'hc)]))
        begin
          reg7 <= reg6;
          reg8 <= ($signed(reg7) ?
              $signed(reg7) : (reg7 ?
                  (((wire5 ? wire0 : (8'hae)) ?
                      $signed((8'hac)) : reg6[(4'h8):(3'h4)]) != $signed((reg7 != wire4))) : wire1[(3'h6):(1'h0)]));
          reg9 <= wire3;
        end
      else
        begin
          if (wire0[(3'h5):(1'h1)])
            begin
              reg7 <= (|(~|$unsigned(wire5)));
            end
          else
            begin
              reg7 <= ($unsigned(wire3) ?
                  $unsigned($signed(((wire1 || wire1) != (~&reg7)))) : ($unsigned(({reg9} != wire5)) <= reg6));
              reg8 <= reg8[(3'h5):(3'h5)];
              reg9 <= ((-((wire3 ?
                  (wire2 ? wire5 : reg6) : ((8'hb1) ?
                      (8'hb0) : wire2)) > ((reg8 ^ reg6) ?
                  ((8'ha5) != wire2) : (^~wire1)))) != $unsigned(reg9));
              reg10 <= {{{(reg7 ? (wire2 ? wire5 : (8'ha9)) : wire3),
                          (wire1[(4'hd):(4'hd)] ? (~wire3) : (^~reg7))},
                      ($unsigned($unsigned(wire3)) ?
                          wire4 : ($unsigned(wire5) ?
                              (!reg8) : $unsigned(wire1)))}};
              reg11 <= wire2;
            end
        end
      if ((((+$unsigned((wire5 ? wire1 : reg8))) > wire5) ?
          wire5 : ($signed($signed(reg9[(2'h3):(2'h3)])) ?
              wire0[(3'h4):(1'h1)] : reg8[(2'h2):(1'h1)])))
        begin
          reg12 <= reg10;
          reg13 <= wire1;
          if (wire4)
            begin
              reg14 <= reg7[(3'h4):(2'h2)];
              reg15 <= {reg12[(1'h1):(1'h1)]};
            end
          else
            begin
              reg14 <= $unsigned({(8'ha3)});
              reg15 <= ((-(reg7 < wire0[(2'h2):(2'h2)])) <= $unsigned($signed(reg7[(3'h6):(3'h4)])));
              reg16 <= (~^reg14);
            end
          reg17 <= $signed(reg14[(5'h12):(2'h2)]);
        end
      else
        begin
          reg12 <= ($signed(reg7[(3'h5):(2'h2)]) > $signed(wire4));
          reg13 <= $signed($signed((~$unsigned(reg15))));
          reg14 <= reg14;
        end
    end
  assign wire18 = (^~(~^(^~$unsigned((+reg14)))));
  assign wire19 = reg14;
  assign wire20 = ($unsigned(reg8[(3'h6):(3'h6)]) ?
                      ({$signed(reg17)} ~^ (~|$signed((reg6 ?
                          reg12 : reg14)))) : wire2);
  assign wire21 = reg6;
  assign wire22 = (8'hb6);
  assign wire23 = (wire3[(4'h8):(3'h7)] >> (+reg17));
  always
    @(posedge clk) begin
      reg24 <= reg14;
      reg25 <= (wire23 ?
          ({$signed($unsigned(wire18)), ($signed(wire3) >>> $unsigned(wire2))} ?
              reg12 : $unsigned(reg15[(1'h1):(1'h1)])) : reg11);
      reg26 <= reg16;
      reg27 <= {(reg16 ?
              (^~$signed({(8'hbb)})) : (wire21[(4'h9):(2'h3)] | reg8[(1'h0):(1'h0)])),
          wire1};
    end
  assign wire28 = {reg12,
                      ((~&(wire1 <<< $unsigned(reg7))) ?
                          wire20[(3'h4):(3'h4)] : ({wire2,
                              reg16} & (wire4 | (reg25 ? wire18 : reg26))))};
  always
    @(posedge clk) begin
      reg29 <= $signed(reg26);
    end
  assign wire30 = {((-{wire22[(2'h2):(1'h1)]}) <= {(reg6[(4'ha):(1'h1)] ?
                              $unsigned(wire18) : (wire18 ? reg9 : (8'h9c))),
                          reg8[(2'h2):(1'h1)]}),
                      reg25[(1'h1):(1'h1)]};
  assign wire31 = (~((((~&reg17) ?
                      (wire21 ? reg6 : wire5) : $unsigned(reg6)) + (wire22 ?
                      $signed(reg15) : $unsigned(reg16))) > (reg12 ?
                      $unsigned(wire20[(1'h1):(1'h0)]) : $signed($signed(reg6)))));
  assign wire32 = $signed((8'hbd));
  assign wire33 = wire19;
  always
    @(posedge clk) begin
      if ({reg29,
          $signed(($unsigned(reg12[(1'h1):(1'h0)]) | ((reg13 >= (8'ha5)) ^ ((8'haa) ?
              wire21 : (8'hbb)))))})
        begin
          reg34 <= $signed($unsigned(wire21));
        end
      else
        begin
          reg34 <= (reg14 & {{{{wire0}, (!reg25)}},
              (wire5[(1'h0):(1'h0)] ^~ $unsigned((reg15 ? wire23 : reg12)))});
          reg35 <= (reg34[(4'hd):(3'h6)] - (($signed($unsigned(wire1)) ?
              $unsigned((reg6 ? reg13 : reg29)) : (8'haf)) * (^~$signed({reg17,
              reg17}))));
          reg36 <= {(8'hba), (7'h40)};
          reg37 <= (8'hbd);
        end
    end
endmodule
