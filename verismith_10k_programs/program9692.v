module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire33;
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire17,
                 wire18,
                 wire19,
                 wire33,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned((wire0 ?
          ((-$unsigned(wire0)) | ((wire1 ? (8'h9c) : wire2) ?
              {wire2, wire1} : {wire1})) : (8'ha2)));
      reg5 <= ($unsigned($unsigned(wire1)) ~^ ((8'hb5) + {(wire1 ?
              (+wire2) : wire1),
          (~|(~wire0))}));
      if ($unsigned((&($unsigned((8'ha6)) >> ((wire0 ?
          reg4 : reg5) < $signed(wire3))))))
        begin
          reg6 <= $signed(reg5);
          reg7 <= $signed(($unsigned($unsigned({wire0})) >> (|{(~|wire0),
              {wire3}})));
          reg8 <= (^~$signed((((8'ha0) ^ reg5[(3'h5):(2'h3)]) <<< ($signed(wire2) * $unsigned(wire1)))));
          reg9 <= (|(~$unsigned(($unsigned(wire0) | (reg5 ^ reg7)))));
          reg10 <= $signed(($signed(((reg5 < reg4) ?
                  (wire1 <<< reg7) : (reg5 ? (8'had) : (8'hb3)))) ?
              ($signed($signed(reg8)) ?
                  ((8'hb2) ?
                      $signed(reg7) : reg8) : ($signed((8'ha8)) | reg7[(1'h0):(1'h0)])) : reg8[(3'h5):(3'h4)]));
        end
      else
        begin
          reg6 <= (~^(~({(reg7 ? reg5 : (8'hb4))} > ((~^wire2) ?
              reg5[(3'h7):(3'h6)] : ((8'hb2) ? reg4 : wire0)))));
          reg7 <= (~|$unsigned((|reg4[(3'h5):(3'h4)])));
          if (reg7)
            begin
              reg8 <= $unsigned(reg9[(4'hd):(4'h9)]);
              reg9 <= $unsigned(reg4);
              reg10 <= ((reg10 && {reg7[(1'h0):(1'h0)],
                      ((|reg8) ^~ (reg5 && (8'ha7)))}) ?
                  reg10 : $unsigned((~^({reg7, wire3} | ((8'ha9) | wire0)))));
              reg11 <= $signed((~^({reg6[(3'h5):(3'h4)]} ?
                  {(!reg4), (wire0 ? reg4 : (8'ha3))} : (+(wire0 ?
                      (8'ha4) : wire1)))));
            end
          else
            begin
              reg8 <= (-(!(&wire0[(1'h0):(1'h0)])));
              reg9 <= {($signed($unsigned(reg10)) ?
                      (($signed((8'h9d)) ?
                          $signed((8'hb8)) : (reg8 ?
                              wire1 : reg7)) >> ((+wire2) ?
                          $unsigned(reg9) : (~reg4))) : (^reg8[(3'h7):(3'h4)]))};
              reg10 <= (wire2[(3'h4):(3'h4)] | reg11);
              reg11 <= reg4[(1'h1):(1'h1)];
              reg12 <= (reg9 <<< {reg5[(2'h2):(1'h0)],
                  (reg10[(2'h2):(2'h2)] ?
                      (!$signed((8'ha3))) : ((wire2 == reg9) == reg8))});
            end
        end
      reg13 <= reg7;
      if (((({reg9} ?
                  (reg7 ?
                      {(8'h9f), reg7} : $signed(reg10)) : (-$signed(reg7))) ?
              $unsigned((|(reg7 && (8'hac)))) : (reg12[(1'h1):(1'h1)] ^~ reg4)) ?
          wire2[(1'h1):(1'h0)] : {reg5[(4'h9):(4'h8)]}))
        begin
          reg14 <= $unsigned($unsigned(reg9[(2'h3):(2'h2)]));
        end
      else
        begin
          reg14 <= (((8'hb6) ?
              ((~(wire0 <<< wire3)) * reg7) : (&$signed((wire2 ?
                  reg8 : wire0)))) < (&(((reg13 ? reg13 : (8'hbe)) * (wire1 ?
              reg11 : reg5)) <<< (+wire1[(3'h7):(2'h2)]))));
          reg15 <= (~&(~$signed((reg4 ? ((8'ha7) << reg9) : $signed(reg9)))));
          reg16 <= reg13[(1'h0):(1'h0)];
        end
    end
  assign wire17 = {($signed($unsigned((~|reg6))) <= (~|reg15[(3'h6):(2'h3)])),
                      reg14[(3'h5):(1'h0)]};
  assign wire18 = reg10;
  assign wire19 = (reg15[(2'h3):(1'h0)] ?
                      (reg5 ?
                          reg9[(3'h5):(1'h1)] : (((reg16 * reg13) ?
                                  wire1[(2'h3):(2'h2)] : reg4) ?
                              (reg14[(3'h4):(1'h1)] > reg6[(3'h5):(2'h2)]) : $signed({(8'hba),
                                  (8'hb0)}))) : (~^$signed(wire3[(4'hb):(4'h9)])));
  module20 #() modinst34 (wire33, clk, reg8, reg11, wire19, reg12, reg9);
  assign wire35 = ($signed((~$unsigned(reg11))) ?
                      {$unsigned($signed($unsigned((8'h9e))))} : $unsigned(($signed(reg5) | (~^(reg9 ?
                          wire1 : wire1)))));
  assign wire36 = wire33;
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire25;
  input wire signed [(5'h13):(1'h0)] wire24;
  input wire [(4'hf):(1'h0)] wire23;
  input wire signed [(4'h8):(1'h0)] wire22;
  input wire [(3'h4):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  assign y = {wire32, wire31, wire30, wire29, wire28, wire27, wire26, (1'h0)};
  assign wire26 = wire25;
  assign wire27 = $signed((&(|wire26)));
  assign wire28 = $unsigned(wire22[(1'h0):(1'h0)]);
  assign wire29 = $unsigned((wire28 + ({((8'hbd) ?
                          wire23 : wire27)} <= (|(~wire24)))));
  assign wire30 = $unsigned({$unsigned((wire28[(4'hc):(4'h9)] == (wire24 ?
                          wire29 : (8'ha1))))});
  assign wire31 = (&(!(^(wire25 ? $unsigned(wire23) : (!wire24)))));
  assign wire32 = $unsigned(wire31);
endmodule
