module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
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
      reg5 <= (+$unsigned(wire0));
      reg6 <= reg5;
      reg7 <= reg5[(2'h2):(2'h2)];
      if (reg6)
        begin
          reg8 <= wire1;
          if (wire0)
            begin
              reg9 <= wire4[(2'h3):(1'h1)];
            end
          else
            begin
              reg9 <= (~((wire3[(2'h2):(2'h2)] ?
                  $unsigned(wire1[(1'h0):(1'h0)]) : {$signed((8'hbd)),
                      reg6[(2'h3):(1'h1)]}) < ({wire3[(1'h1):(1'h1)],
                  (wire3 ? wire1 : wire4)} || reg7)));
              reg10 <= $unsigned((!wire0[(3'h7):(1'h0)]));
              reg11 <= $signed(((($unsigned(wire0) ?
                      $signed(wire4) : ((8'haa) ?
                          wire4 : reg10)) & wire4[(2'h2):(2'h2)]) ?
                  {(|$signed((8'ha5))),
                      $unsigned((reg5 ~^ wire4))} : (~^$unsigned((7'h40)))));
              reg12 <= reg9[(5'h11):(2'h3)];
            end
          reg13 <= reg9[(3'h6):(1'h0)];
        end
      else
        begin
          reg8 <= (8'hba);
          reg9 <= $unsigned($signed(wire2[(1'h0):(1'h0)]));
          reg10 <= wire3[(2'h3):(2'h3)];
          reg11 <= $signed({$unsigned((^wire0)), reg11[(5'h11):(2'h2)]});
        end
      reg14 <= ((reg12 || $signed((~(reg9 ? reg11 : reg13)))) != wire4);
    end
  assign wire15 = (($signed((^~(reg14 >> reg13))) ?
                      (^(~(&(8'haa)))) : ($signed({wire1}) >= (((8'hab) * reg11) ?
                          (7'h40) : (reg12 ?
                              reg14 : reg7)))) <= (((-$unsigned((8'hbf))) ?
                      reg5[(3'h4):(1'h0)] : $unsigned($unsigned(reg5))) ~^ (reg5[(2'h2):(2'h2)] <<< $signed((wire3 ?
                      wire4 : reg7)))));
  assign wire16 = ((8'hbc) >= $unsigned(reg12[(3'h5):(3'h5)]));
  assign wire17 = wire15;
endmodule
