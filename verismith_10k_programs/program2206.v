module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire12,
                 wire7,
                 wire5,
                 reg13,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed((!$unsigned((|{wire4}))));
  always
    @(posedge clk) begin
      reg6 <= (wire3[(3'h7):(1'h1)] >= {$signed((+wire3))});
    end
  assign wire7 = $unsigned($unsigned({$unsigned({wire0}), $signed(reg6)}));
  always
    @(posedge clk) begin
      reg8 <= reg6;
      reg9 <= $unsigned(wire2[(2'h3):(2'h3)]);
      reg10 <= $signed($unsigned($unsigned(wire3[(3'h7):(3'h7)])));
      reg11 <= $unsigned(((~|(^~{wire5, wire2})) + ($signed({(7'h42), wire3}) ?
          {{wire5, (8'h9e)}, $signed(reg6)} : $signed((~wire5)))));
    end
  assign wire12 = (wire1 ?
                      $signed($unsigned(($signed(reg6) ?
                          wire1[(3'h5):(2'h3)] : $signed((8'ha5))))) : ($signed($unsigned(wire3[(4'hd):(3'h7)])) ?
                          $unsigned(wire7) : reg6[(3'h4):(1'h0)]));
  always
    @(posedge clk) begin
      reg13 <= {($unsigned($signed(reg8)) + wire2[(2'h3):(1'h1)]),
          ({(+reg6[(4'ha):(1'h1)]), $unsigned((wire5 ? reg6 : wire1))} ?
              (wire5 ?
                  (~^$unsigned(wire1)) : (&wire12[(2'h2):(2'h2)])) : (-($signed(reg9) >= $unsigned(wire5))))};
    end
endmodule
