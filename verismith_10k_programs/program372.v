module top
#(parameter param14 = (~{((((8'ha7) ? (8'haa) : (8'hba)) ? (-(8'had)) : ((8'hb2) ? (8'haa) : (8'hba))) & (+{(8'hb5)})), {(((8'hb9) < (8'haf)) ~^ (^(8'ha5)))}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire13;
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire13,
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
      reg5 <= {(wire2[(1'h1):(1'h0)] < $unsigned(wire1[(2'h3):(1'h1)])),
          (((-$unsigned(wire4)) ?
                  (wire0[(3'h6):(1'h0)] ? {wire2, wire4} : wire2) : wire0) ?
              ($unsigned(wire3[(4'h8):(2'h2)]) ?
                  wire4[(4'h8):(1'h0)] : (wire3 ?
                      (wire0 >>> wire0) : $signed(wire0))) : $signed($unsigned((wire0 ?
                  wire3 : wire0))))};
      reg6 <= wire3[(5'h11):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg7 <= $unsigned((~{wire1[(3'h5):(1'h0)], reg6[(4'h8):(1'h0)]}));
      reg8 <= $signed(({wire0[(2'h2):(2'h2)]} ?
          (((8'hbb) ? reg7 : {wire0}) ?
              ({wire2, (8'ha4)} ?
                  $signed(reg5) : (wire0 | reg6)) : wire2) : (({wire0} + reg6[(4'hc):(3'h7)]) || (~|$unsigned(reg5)))));
      reg9 <= (!(~&({reg6[(4'h8):(4'h8)], $unsigned((8'hbb))} >= (!reg7))));
      reg10 <= reg8[(3'h6):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg11 <= ((7'h42) <<< $signed({(|(wire4 ? reg8 : wire4)),
          ((8'hbf) ? $signed(wire4) : wire0[(3'h6):(3'h5)])}));
      reg12 <= $signed(reg7);
    end
  assign wire13 = reg10[(4'h8):(4'h8)];
endmodule
