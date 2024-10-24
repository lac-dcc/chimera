module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire6,
                 wire5,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
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
                 (1'h0)};
  assign wire5 = (~&{wire2});
  assign wire6 = (8'hbb);
  always
    @(posedge clk) begin
      if ((wire3 >> wire3[(1'h0):(1'h0)]))
        begin
          reg7 <= {(&(~|wire3[(1'h1):(1'h0)])), wire3};
          reg8 <= $signed(reg7);
          if ({wire5,
              (wire1 | (((reg8 > wire1) ? $unsigned((8'ha9)) : (|(8'hb0))) ?
                  (((8'ha9) ? (7'h42) : wire2) ?
                      (wire2 ? wire1 : wire3) : $unsigned((8'h9e))) : reg8))})
            begin
              reg9 <= wire1[(2'h3):(1'h1)];
            end
          else
            begin
              reg9 <= ($unsigned(({(wire6 ? wire6 : wire1),
                      (~^wire6)} * (7'h43))) ?
                  $signed($signed(($unsigned(wire2) ?
                      (8'hb5) : {wire0, wire2}))) : (8'ha9));
              reg10 <= reg8[(3'h7):(2'h3)];
              reg11 <= ((wire1[(3'h4):(2'h2)] ?
                  (~|reg10) : ($signed(reg10[(4'hd):(4'hb)]) ?
                      wire4[(2'h2):(1'h0)] : {(wire2 ? wire2 : reg10),
                          (^~wire6)})) <= (((wire3[(2'h2):(2'h2)] ?
                          $signed((8'ha6)) : wire3) ?
                      {$signed(reg8), (8'ha9)} : (~&wire6[(2'h3):(1'h1)])) ?
                  $unsigned(((reg7 ?
                      wire1 : wire2) && (^(8'ha5)))) : $unsigned(wire4)));
            end
          reg12 <= wire6[(3'h7):(3'h7)];
        end
      else
        begin
          reg7 <= reg10;
          reg8 <= ($unsigned($signed(reg10)) ?
              (~^($unsigned($signed(wire6)) ?
                  reg12 : (reg12 ?
                      wire3 : (reg7 ?
                          wire3 : reg11)))) : ({(!reg10[(4'he):(4'hb)])} ?
                  wire2[(4'hf):(4'hb)] : wire6));
          reg9 <= wire0;
          reg10 <= ((^~(~&($unsigned(wire0) < $signed(reg7)))) ?
              (8'hbf) : reg12[(2'h2):(1'h0)]);
        end
      if ({($signed($signed((reg9 ? wire5 : reg12))) ?
              (~&((wire3 ? reg9 : reg12) ?
                  (~^reg11) : $signed(reg8))) : reg8[(3'h5):(3'h4)])})
        begin
          reg13 <= reg7[(2'h3):(2'h2)];
          reg14 <= wire0[(1'h0):(1'h0)];
        end
      else
        begin
          reg13 <= reg14;
        end
      reg15 <= $signed($unsigned((($unsigned(reg10) ?
          {reg12} : $signed(reg8)) != (-$signed(reg14)))));
      reg16 <= (!$signed(wire3[(1'h1):(1'h1)]));
    end
  assign wire17 = ({$signed($unsigned((reg10 ? reg9 : (7'h44))))} ?
                      $signed((((reg11 == wire0) ?
                          (reg12 ~^ (8'hb6)) : (-reg7)) ^~ reg13[(1'h1):(1'h1)])) : $unsigned(reg7));
  assign wire18 = {((reg16[(4'h9):(3'h6)] >> (8'ha1)) ^~ (8'hbf))};
  assign wire19 = ($signed(reg11) ?
                      reg11 : (reg14[(4'hf):(4'hc)] ?
                          reg13 : ((wire6 ?
                              (reg15 ?
                                  wire18 : wire17) : (reg15 + (7'h43))) >>> $unsigned((!wire17)))));
  assign wire20 = ((8'hb7) >= $unsigned($signed((-reg7))));
  assign wire21 = wire0;
  assign wire22 = (wire5 ?
                      reg11[(1'h0):(1'h0)] : ($unsigned((-$signed(reg14))) ?
                          $unsigned((~wire4[(3'h7):(3'h4)])) : ({$signed(wire18)} ?
                              $unsigned((!reg8)) : reg10)));
  assign wire23 = {$signed(reg15), $unsigned($unsigned((-$signed(wire6))))};
  assign wire24 = wire17[(3'h4):(2'h3)];
  assign wire25 = wire23[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg26 <= (~^(wire22 > wire19[(1'h0):(1'h0)]));
      reg27 <= wire20;
      reg28 <= (((&$signed((wire3 ? reg16 : wire21))) ?
              (&$signed((wire17 ? (8'hae) : wire19))) : {reg16}) ?
          wire19 : (({(reg26 ^~ wire21)} >= {$unsigned(reg15)}) * {(!wire24[(4'h9):(1'h1)])}));
      reg29 <= reg26[(5'h11):(4'hd)];
    end
  assign wire30 = ((~|wire23[(2'h2):(2'h2)]) ?
                      $signed(reg26[(4'h9):(2'h2)]) : reg7);
  assign wire31 = wire0[(3'h5):(3'h4)];
  assign wire32 = ($signed(((reg27[(3'h6):(1'h0)] < (~^reg12)) <= $unsigned(wire25[(2'h2):(2'h2)]))) ?
                      $signed((({reg26} ?
                          (!wire22) : $signed(wire20)) && $signed((reg7 <<< reg13)))) : $signed(($signed($signed(wire4)) + $unsigned((~|reg11)))));
endmodule
