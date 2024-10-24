module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire4,
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
  assign wire4 = ($signed(wire0[(4'h8):(3'h7)]) ?
                     $unsigned($signed(wire2)) : $unsigned(wire1[(3'h4):(1'h0)]));
  always
    @(posedge clk) begin
      reg5 <= $unsigned((wire0 ~^ (($unsigned(wire4) ~^ $signed(wire4)) ?
          wire0 : wire4[(3'h7):(3'h4)])));
      if ((8'hbd))
        begin
          if ($signed((reg5 * (8'ha0))))
            begin
              reg6 <= wire2[(2'h3):(1'h0)];
              reg7 <= (8'h9c);
              reg8 <= {reg5[(4'ha):(4'ha)],
                  $unsigned(((8'hba) ? $signed((reg6 ? reg7 : reg6)) : wire4))};
              reg9 <= $signed($signed((reg7 ?
                  wire3[(3'h5):(1'h1)] : $unsigned($signed((7'h44))))));
              reg10 <= wire3[(3'h4):(3'h4)];
            end
          else
            begin
              reg6 <= reg10;
              reg7 <= ((~((~reg8) & reg10[(3'h7):(1'h1)])) ?
                  $unsigned(wire2[(3'h6):(2'h3)]) : $signed((~wire0)));
              reg8 <= reg8;
            end
          reg11 <= (reg8 > (($signed((reg9 ? wire1 : reg9)) ?
              $signed((~|wire2)) : reg8) == (wire2[(3'h7):(1'h1)] ?
              (|{(8'hbf), (8'hb2)}) : (|reg6))));
        end
      else
        begin
          reg6 <= (reg9 ? (8'ha6) : (!$unsigned($unsigned((!wire1)))));
        end
      reg12 <= reg5[(3'h4):(2'h2)];
      reg13 <= (!(!(^((wire2 ? (8'ha6) : wire2) ?
          reg5[(4'hc):(3'h6)] : $unsigned(wire3)))));
      reg14 <= ($signed(reg5) && wire1);
    end
  assign wire15 = {reg11[(3'h5):(3'h5)],
                      $signed($unsigned($unsigned((&wire4))))};
  assign wire16 = reg8;
endmodule
