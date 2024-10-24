module top
#(parameter param22 = (8'ha4), 
parameter param23 = (&(8'ha9)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg21,
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
  always
    @(posedge clk) begin
      if (wire3[(1'h0):(1'h0)])
        begin
          if ($unsigned((!wire1[(1'h1):(1'h0)])))
            begin
              reg5 <= ((~&wire3[(5'h14):(4'ha)]) ? (&wire1) : wire2);
            end
          else
            begin
              reg5 <= {wire0};
              reg6 <= $unsigned(($unsigned((8'hbb)) >> (~^(7'h41))));
              reg7 <= wire0;
              reg8 <= reg6;
            end
          if ($unsigned(reg6))
            begin
              reg9 <= (8'h9c);
              reg10 <= ((^wire4[(1'h0):(1'h0)]) ?
                  (wire2[(2'h2):(1'h1)] ?
                      (reg6 >> (+(~^reg9))) : ((^wire3) != ((reg6 ?
                          (8'had) : reg7) & $signed((8'ha9))))) : reg9);
              reg11 <= $unsigned({((~|$signed(wire4)) && wire3[(1'h0):(1'h0)]),
                  wire1});
            end
          else
            begin
              reg9 <= $signed($signed((((!(8'hb9)) ?
                  {(8'hac), (8'hb5)} : $unsigned(wire4)) >= reg7)));
              reg10 <= reg11[(4'ha):(3'h7)];
            end
          reg12 <= {wire0[(4'hd):(1'h0)]};
        end
      else
        begin
          reg5 <= $signed($signed($unsigned($signed(((8'h9f) * (8'hbe))))));
          reg6 <= {reg7[(1'h0):(1'h0)]};
          reg7 <= reg8[(3'h5):(3'h5)];
          if ((reg8 ?
              ((reg7 ?
                  ({reg9, (8'ha3)} < (wire1 ?
                      reg6 : wire4)) : (-wire3[(1'h0):(1'h0)])) != wire0) : ($unsigned({$signed(reg12)}) ?
                  {reg6} : reg7)))
            begin
              reg8 <= reg5[(4'h9):(3'h5)];
            end
          else
            begin
              reg8 <= $signed($unsigned(reg12));
              reg9 <= (~($unsigned({(^wire4), (~^reg12)}) ?
                  $signed(((wire3 <<< reg7) ?
                      (wire1 ?
                          reg10 : reg10) : reg10[(1'h1):(1'h1)])) : {(8'h9e),
                      $unsigned((!wire0))}));
              reg10 <= $signed(reg10[(1'h0):(1'h0)]);
              reg11 <= (reg10[(1'h0):(1'h0)] ?
                  wire3 : (((+reg8[(5'h11):(3'h6)]) ^ (((8'ha8) ?
                              (8'h9c) : wire0) ?
                          (wire4 ? reg7 : reg9) : $unsigned(reg7))) ?
                      wire0[(4'hc):(4'hb)] : ((8'ha1) <= (~&$unsigned(reg5)))));
              reg12 <= wire1[(1'h0):(1'h0)];
            end
        end
      reg13 <= (reg7 ?
          wire0[(1'h0):(1'h0)] : (-(reg10[(2'h2):(1'h1)] >> wire0)));
      reg14 <= wire3;
      reg15 <= {$unsigned((reg10[(1'h1):(1'h0)] <<< ((&reg14) ?
              wire0 : (wire2 + (8'h9c)))))};
      reg16 <= reg10[(1'h0):(1'h0)];
    end
  assign wire17 = $unsigned(reg12[(4'ha):(4'h9)]);
  assign wire18 = (|(wire17 ?
                      (((~^reg6) ? (^~(8'h9d)) : (wire4 ? reg5 : reg15)) ?
                          ((reg9 ? reg8 : reg10) ?
                              (|reg16) : $unsigned(reg12)) : (~$unsigned(reg16))) : $unsigned(($unsigned(reg15) ^ $signed((8'h9e))))));
  assign wire19 = wire18;
  assign wire20 = $signed(wire18);
  always
    @(posedge clk) begin
      reg21 <= {$unsigned(((-(wire4 ? (8'hb3) : reg7)) ?
              $signed((wire2 ? reg11 : wire19)) : reg12)),
          wire18[(3'h4):(1'h1)]};
    end
endmodule
