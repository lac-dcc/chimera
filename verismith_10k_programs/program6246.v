module top
#(parameter param37 = (-(8'ha7)), 
parameter param38 = param37)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire6,
                 wire5,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
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
                 (1'h0)};
  assign wire5 = wire4[(3'h6):(1'h0)];
  assign wire6 = wire2[(4'hc):(4'hb)];
  always
    @(posedge clk) begin
      reg7 <= (wire3[(4'hd):(4'h9)] ?
          (wire6[(3'h5):(1'h0)] | (^~{$unsigned(wire0)})) : {$unsigned($unsigned((-wire5))),
              wire4[(3'h6):(2'h2)]});
      reg8 <= $signed((&((8'hb3) ?
          (wire2 ? (~&wire3) : (wire0 ? wire2 : wire1)) : {(wire0 ?
                  wire2 : wire6)})));
    end
  always
    @(posedge clk) begin
      reg9 <= $unsigned(wire5);
      reg10 <= $signed($unsigned(wire3[(4'h8):(3'h4)]));
      reg11 <= (reg9[(4'h8):(1'h0)] || (reg7[(3'h5):(3'h4)] ?
          (((reg8 ? wire3 : wire0) ? $signed(wire3) : wire4[(4'h8):(3'h4)]) ?
              wire3 : (((7'h40) || wire1) >>> $unsigned(reg10))) : $signed((~^{wire2}))));
      if ((wire1[(4'hd):(2'h2)] * wire4))
        begin
          if ((wire2 ? wire6[(4'hb):(1'h1)] : wire2[(2'h2):(1'h1)]))
            begin
              reg12 <= ({(($signed(reg8) ?
                          ((8'haa) || reg9) : wire4[(2'h3):(1'h1)]) ?
                      wire3[(3'h7):(3'h6)] : {(^wire2),
                          reg11[(2'h3):(2'h2)]})} <<< ((8'ha3) ?
                  (~^$unsigned((~^reg9))) : (8'hb9)));
              reg13 <= {$unsigned(({(wire0 <= wire4), $unsigned(wire5)} ?
                      ({wire5} ? {reg8} : reg9[(2'h3):(1'h1)]) : wire6)),
                  $unsigned($unsigned($signed((wire2 ? wire0 : reg11))))};
            end
          else
            begin
              reg12 <= (8'ha5);
              reg13 <= (8'hb1);
              reg14 <= $unsigned(wire4[(1'h1):(1'h1)]);
              reg15 <= reg10[(2'h3):(1'h0)];
              reg16 <= $unsigned($unsigned((^($unsigned((8'had)) ?
                  (wire6 ? (7'h44) : wire3) : (reg9 ? reg12 : reg7)))));
            end
          if ((reg8[(4'ha):(2'h2)] ?
              ({(wire4[(3'h4):(1'h1)] ~^ (wire6 ?
                      (7'h41) : reg10))} != wire5) : ($unsigned(wire2[(4'ha):(1'h1)]) ?
                  $signed($unsigned($signed((8'hb8)))) : wire0[(3'h5):(3'h4)])))
            begin
              reg17 <= (reg8[(4'ha):(3'h6)] ?
                  $signed($signed(reg10)) : ((wire5[(4'h9):(4'h8)] ?
                          (~&wire6[(1'h0):(1'h0)]) : ($signed(reg15) + (reg13 >>> (8'ha8)))) ?
                      wire4 : wire3[(4'ha):(2'h2)]));
              reg18 <= $signed(($unsigned(wire2[(4'h9):(3'h4)]) ?
                  $unsigned($signed((~|wire0))) : (8'hb1)));
            end
          else
            begin
              reg17 <= (-(7'h41));
              reg18 <= $unsigned($signed((~^$unsigned(wire5[(5'h12):(5'h10)]))));
              reg19 <= ((wire3[(3'h6):(2'h3)] ?
                      (reg9 ?
                          (~&(wire6 ?
                              (8'hba) : reg7)) : (-(reg7 << reg10))) : reg12[(3'h7):(3'h6)]) ?
                  {(($unsigned(reg7) <= $signed(reg16)) ?
                          {reg10[(2'h3):(1'h1)],
                              (wire0 ?
                                  wire1 : reg13)} : $unsigned($unsigned(reg13))),
                      $unsigned(($unsigned(wire4) ?
                          (7'h43) : (8'had)))} : $unsigned((^reg18)));
              reg20 <= (!{$signed($signed((reg13 != wire0))),
                  reg16[(3'h5):(2'h2)]});
            end
          reg21 <= reg9;
          reg22 <= $unsigned((((8'hbc) - $unsigned($signed(reg8))) ?
              {$signed((8'hb6)), $signed($unsigned(wire3))} : {reg9}));
          if ($unsigned($signed((reg14 ?
              reg17[(3'h6):(3'h4)] : ((reg14 ?
                  wire3 : wire6) <<< (reg7 && reg15))))))
            begin
              reg23 <= {reg22, (|reg13[(3'h4):(1'h0)])};
              reg24 <= (-reg22[(1'h0):(1'h0)]);
            end
          else
            begin
              reg23 <= $unsigned($unsigned($unsigned(wire2)));
            end
        end
      else
        begin
          reg12 <= {($signed(reg21) == (-$unsigned((^(8'hb7)))))};
          reg13 <= $signed(reg7);
          if ($unsigned((~$unsigned({(reg15 != reg18)}))))
            begin
              reg14 <= $signed((8'hb9));
              reg15 <= ((((reg15[(1'h1):(1'h1)] ?
                      (!(8'ha1)) : (wire0 ?
                          wire5 : wire3)) && (reg15 - reg19[(1'h1):(1'h0)])) ~^ wire1) ?
                  {(8'hb4)} : (reg9 ?
                      $signed(reg14) : $signed(($unsigned(wire6) ?
                          {wire3} : $signed((8'hb9))))));
            end
          else
            begin
              reg14 <= reg24;
              reg15 <= $signed($unsigned($unsigned(wire2[(4'hb):(1'h0)])));
              reg16 <= $signed($unsigned(($unsigned(reg19[(2'h3):(2'h2)]) != {wire1[(4'hf):(4'hf)],
                  (~^(8'hbe))})));
            end
        end
    end
  assign wire25 = {(-(reg24 ? (reg7 >>> (^~wire6)) : reg20[(1'h0):(1'h0)]))};
  assign wire26 = $signed(reg9);
  assign wire27 = $signed((+(&(!(wire5 ? wire26 : wire1)))));
  assign wire28 = (reg17 ?
                      {$signed($signed($signed(reg10)))} : (wire0 ?
                          ((reg8[(4'h8):(4'h8)] ?
                              $unsigned(wire6) : (reg13 ?
                                  reg24 : reg16)) & $signed(wire4)) : wire27[(3'h6):(1'h0)]));
  assign wire29 = ({($unsigned($unsigned(wire6)) ?
                              ((reg10 ~^ reg8) ?
                                  (~&reg12) : ((8'hb8) <= wire0)) : wire0)} ?
                      reg18 : reg23[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg30 <= reg9;
      reg31 <= (reg9 > (reg7 ?
          ($signed((wire25 ? (8'hb8) : (8'hbd))) ?
              (wire28 ?
                  reg10[(2'h3):(2'h2)] : $signed(wire5)) : $unsigned(wire26[(2'h3):(2'h3)])) : $signed($signed((7'h40)))));
      reg32 <= $signed((^~$unsigned(reg18[(3'h7):(3'h7)])));
      reg33 <= (~^wire4);
      reg34 <= reg32[(3'h6):(3'h5)];
    end
  assign wire35 = reg10;
  assign wire36 = wire35;
endmodule
