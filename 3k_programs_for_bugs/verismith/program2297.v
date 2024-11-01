module top
#(parameter param18 = ((((^~{(8'hb9), (8'haf)}) + (~(~|(8'hbc)))) > (^~(&((8'had) ? (8'hab) : (8'hb2))))) <= ((~((+(8'hb9)) ? (~(8'hb3)) : {(8'hae), (8'hb2)})) ? ((8'h9d) ? (((8'h9d) == (8'ha3)) ? (&(8'hb0)) : (~&(8'hab))) : (8'hb4)) : ((((8'hb0) ? (8'h9d) : (8'ha1)) ? {(8'hbe)} : ((8'ha7) ? (8'hb4) : (8'hb1))) - ((8'hba) >> ((8'hbe) ~^ (8'hb6)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire5,
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
  assign wire5 = (!{wire2[(1'h1):(1'h0)], ((~wire2) < wire3)});
  always
    @(posedge clk) begin
      reg6 <= wire5;
      if ((~(~|wire1[(2'h2):(2'h2)])))
        begin
          reg7 <= $unsigned(((($signed(wire2) >= wire5) ?
              {(wire2 ? wire0 : reg6)} : wire0) >> reg6));
          reg8 <= (wire1 ?
              wire4[(1'h1):(1'h0)] : (^(((reg6 ? (8'hb7) : wire0) ~^ (~wire0)) ?
                  $unsigned((^wire3)) : $signed($signed(reg7)))));
          reg9 <= (wire3[(4'h9):(3'h4)] ? $signed(wire1) : (8'haa));
          if ((wire0 * ($signed(((reg7 ? reg7 : reg9) ?
                  $unsigned(wire1) : $unsigned(wire3))) ?
              (((&wire4) + wire5) ?
                  (8'h9c) : ((&reg9) ?
                      $signed((8'ha1)) : (^~wire2))) : (reg8[(3'h5):(2'h2)] ?
                  (wire5[(1'h0):(1'h0)] > (reg7 ?
                      reg8 : (8'ha3))) : $signed($unsigned(reg6))))))
            begin
              reg10 <= $unsigned(($unsigned($unsigned((wire3 ?
                      (8'hb7) : reg8))) ?
                  (-(reg6 ?
                      wire4[(3'h7):(3'h5)] : (wire2 >= reg6))) : $signed(($signed(wire1) != {wire0}))));
            end
          else
            begin
              reg10 <= $unsigned(((wire2 >>> (~&(~wire2))) ?
                  ($signed((reg9 <<< reg7)) * $signed($unsigned((8'hbe)))) : (~&reg9)));
              reg11 <= (+reg6);
              reg12 <= reg9;
            end
          if (((~(~|wire1[(2'h3):(1'h0)])) ?
              (^wire2[(4'hb):(4'h9)]) : (($unsigned($unsigned(reg11)) * reg8) ?
                  wire3[(3'h4):(1'h0)] : {(wire4 ? (~&reg6) : (wire4 < reg8)),
                      $unsigned($unsigned(reg6))})))
            begin
              reg13 <= (+(+(((wire5 ? wire2 : (8'ha5)) * (reg6 ?
                  wire5 : reg12)) & reg10)));
              reg14 <= reg11;
            end
          else
            begin
              reg13 <= $unsigned(wire3);
              reg14 <= $signed((~|($signed((wire0 ? wire1 : wire4)) ?
                  {reg8} : $unsigned($unsigned(reg14)))));
              reg15 <= reg14[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg7 <= reg15[(1'h0):(1'h0)];
        end
    end
  assign wire16 = $unsigned((reg9[(4'hf):(3'h5)] && (({reg10} != (wire2 ?
                          reg11 : (8'ha7))) ?
                      reg12 : reg13)));
  assign wire17 = $unsigned($unsigned($signed((8'hb6))));
endmodule
