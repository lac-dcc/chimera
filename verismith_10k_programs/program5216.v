module top
#(parameter param37 = (|(|(-{{(8'h9c), (7'h40)}, ((8'h9f) ? (7'h42) : (8'ha7))}))), 
parameter param38 = (((((~param37) ? (param37 ? param37 : param37) : (param37 ? param37 : (8'hb7))) ? {(param37 ? (8'hb6) : (8'hbe))} : param37) ? param37 : param37) | param37))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire24,
                 wire23,
                 wire19,
                 wire18,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg25,
                 reg22,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = ($signed((((wire3 ? wire2 : wire0) ?
                         (wire0 ?
                             wire3 : wire0) : wire1) | wire0[(1'h0):(1'h0)])) ?
                     $unsigned((~^$unsigned((wire1 & wire3)))) : wire1);
  assign wire5 = (-({(8'hb0)} ?
                     $signed(({wire4, (8'ha5)} ?
                         wire0[(1'h1):(1'h1)] : wire1)) : ($signed(wire2[(2'h2):(1'h0)]) ?
                         {$signed((8'hb5))} : (~|(wire0 ? wire2 : wire4)))));
  assign wire6 = wire5[(4'hb):(3'h7)];
  assign wire7 = wire5[(4'hd):(3'h7)];
  assign wire8 = $unsigned((^~$signed(wire4[(5'h10):(3'h4)])));
  always
    @(posedge clk) begin
      if ($unsigned(wire5))
        begin
          reg9 <= (~$signed($unsigned(((wire8 ? wire8 : wire7) ?
              wire0[(2'h2):(2'h2)] : (wire1 <= (8'hb3))))));
          if (($signed(wire0[(3'h6):(3'h6)]) ?
              $unsigned($signed(wire7[(3'h5):(3'h4)])) : (8'hb0)))
            begin
              reg10 <= (|$unsigned(($unsigned(wire8[(1'h1):(1'h0)]) ?
                  reg9[(1'h0):(1'h0)] : {(^~wire8)})));
            end
          else
            begin
              reg10 <= (|(wire1 == (wire6 >> $signed((wire8 ?
                  reg10 : wire1)))));
              reg11 <= wire3[(2'h3):(1'h1)];
            end
          reg12 <= $unsigned(((~|reg10[(4'ha):(1'h0)]) ~^ $signed(wire3[(3'h5):(3'h4)])));
          reg13 <= $signed(wire4[(4'h9):(4'h9)]);
          reg14 <= $signed(wire7[(3'h6):(2'h2)]);
        end
      else
        begin
          reg9 <= (wire6 >> (~|$unsigned(reg12)));
          if (($unsigned($unsigned(({wire4} - (~^reg10)))) + $unsigned((reg11 < $signed($signed(wire0))))))
            begin
              reg10 <= $signed(wire8);
              reg11 <= {(reg14 ? $signed($signed(reg9)) : wire6), (~^(8'hb3))};
              reg12 <= {$signed(wire1[(3'h6):(3'h6)])};
            end
          else
            begin
              reg10 <= (+wire4);
            end
          if (wire2[(1'h0):(1'h0)])
            begin
              reg13 <= $unsigned($unsigned((7'h42)));
            end
          else
            begin
              reg13 <= ((reg11[(4'hb):(1'h0)] ?
                      (~|(wire4[(2'h2):(1'h0)] <= (~|reg10))) : ($unsigned((wire2 ?
                              wire1 : (8'ha3))) ?
                          (~|(reg9 ?
                              wire8 : wire1)) : $unsigned($unsigned(reg12)))) ?
                  (reg11 + wire0) : (7'h42));
              reg14 <= $unsigned(wire8[(3'h4):(1'h1)]);
              reg15 <= wire6[(1'h0):(1'h0)];
              reg16 <= wire8;
              reg17 <= $signed(wire7[(4'h9):(1'h1)]);
            end
        end
    end
  assign wire18 = $unsigned($signed((~(wire5[(3'h4):(2'h2)] ?
                      $unsigned(reg10) : ((8'hb3) ? (8'hac) : (8'ha1))))));
  assign wire19 = $signed($signed((reg17 ?
                      (wire2 ?
                          {reg15, wire18} : reg9) : reg13[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg20 <= ($unsigned($signed(($unsigned(reg10) - (wire2 || wire8)))) ?
          reg10 : (~|(|reg10)));
      reg21 <= reg20[(4'ha):(1'h0)];
      reg22 <= (^$unsigned((wire0 << (&(reg15 ? reg10 : reg11)))));
    end
  assign wire23 = $signed($signed($unsigned($unsigned(wire4))));
  assign wire24 = reg10[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg25 <= $signed((8'ha5));
    end
  assign wire26 = (~|($signed((wire4[(5'h10):(4'he)] ?
                      $unsigned(reg22) : {wire6})) >= reg12));
  assign wire27 = (^~(reg20[(3'h4):(2'h3)] & ((~|$unsigned(wire5)) & $unsigned($unsigned(wire0)))));
  assign wire28 = $unsigned(reg16[(3'h4):(3'h4)]);
  assign wire29 = {$signed($signed($signed(reg9))),
                      $unsigned(wire1[(1'h1):(1'h1)])};
  assign wire30 = wire7;
  assign wire31 = wire29[(2'h2):(2'h2)];
  assign wire32 = wire19[(3'h4):(2'h3)];
  assign wire33 = wire6[(5'h11):(4'hd)];
  assign wire34 = ($signed(reg16[(5'h14):(4'hd)]) ?
                      $unsigned(reg20) : ($unsigned(($signed(wire31) << reg25)) ?
                          wire8[(3'h7):(1'h0)] : {$unsigned((reg22 && reg15)),
                              $signed({reg25, reg12})}));
  assign wire35 = reg16[(4'hb):(3'h7)];
  assign wire36 = (($unsigned($unsigned((wire3 ?
                      wire28 : wire18))) || wire19) << reg9);
endmodule
