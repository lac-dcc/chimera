module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
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
      reg5 <= {wire1[(5'h10):(1'h0)]};
      reg6 <= ((~(((wire0 ~^ wire2) ? (wire4 < wire2) : (wire3 ? reg5 : reg5)) ?
          wire2[(4'h9):(4'h8)] : {$signed(wire4)})) <<< (8'hbd));
      reg7 <= $unsigned(((^(~&$unsigned(wire0))) >= (({wire2, reg5} ?
          (~reg6) : wire2[(3'h4):(1'h0)]) == $signed(wire0))));
      reg8 <= $unsigned((~(~|($unsigned(reg7) >> {reg7}))));
      if ($signed(((&$unsigned(wire4[(1'h0):(1'h0)])) >= $signed($unsigned((reg5 >>> reg7))))))
        begin
          reg9 <= ($signed(wire3) ?
              (!{(+(+(8'hba))), {(~^reg7), wire4}}) : wire2);
          reg10 <= (wire3[(5'h11):(3'h5)] ?
              wire4[(4'h8):(4'h8)] : (reg9 ?
                  $unsigned($unsigned($signed(reg9))) : (~^(^(reg9 < wire3)))));
        end
      else
        begin
          reg9 <= $signed({$unsigned($unsigned(wire2))});
          reg10 <= (7'h43);
          reg11 <= wire2;
        end
    end
  assign wire12 = wire2;
  assign wire13 = (!$unsigned(reg7[(3'h4):(1'h0)]));
  assign wire14 = $unsigned(($signed(wire4[(4'h9):(1'h1)]) * $unsigned($signed($signed(wire4)))));
endmodule
