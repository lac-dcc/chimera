module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire6,
                 wire4,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg5,
                 (1'h0)};
  assign wire4 = wire0[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg5 <= $unsigned($signed(wire2[(1'h0):(1'h0)]));
    end
  assign wire6 = $signed((wire1[(4'hd):(3'h4)] >= $unsigned((&wire0))));
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire3)))
        begin
          reg7 <= wire0;
          if (((^(8'hb7)) ?
              ((~(&((8'hac) << reg7))) ?
                  (+wire1) : (-$unsigned((|(8'ha6))))) : wire0))
            begin
              reg8 <= (((wire0[(2'h2):(2'h2)] ?
                          (~(-wire1)) : $signed(((8'ha8) >= (8'ha9)))) ?
                      $unsigned((wire2 || (wire4 ?
                          wire2 : wire3))) : (($unsigned(reg7) ?
                          (^~wire4) : $signed(wire0)) - $unsigned($unsigned(wire6)))) ?
                  $signed(reg7[(3'h5):(2'h3)]) : $signed({$signed((reg5 ?
                          wire0 : wire6)),
                      wire3[(3'h6):(3'h4)]}));
              reg9 <= wire0[(1'h1):(1'h0)];
              reg10 <= (((^$signed($signed(wire3))) ?
                      (&$signed((wire0 ?
                          wire1 : wire2))) : $signed(((wire6 <= reg8) ?
                          $signed(reg5) : $unsigned((8'hb6))))) ?
                  (-(!({reg9, (8'ha4)} ^ $unsigned((8'ha1))))) : wire0);
            end
          else
            begin
              reg8 <= $unsigned(($unsigned({(reg8 >= reg8)}) ~^ wire1));
              reg9 <= wire4;
              reg10 <= wire1;
            end
          reg11 <= ((+$signed($unsigned($signed(wire6)))) ?
              wire2[(3'h5):(3'h5)] : wire2);
        end
      else
        begin
          reg7 <= (+{((^(wire6 << wire4)) && {(reg11 ^ wire3)})});
          reg8 <= (^~(~^$unsigned(wire0[(1'h0):(1'h0)])));
          reg9 <= $unsigned(($signed(($signed(reg9) ?
                  (reg9 ? reg9 : wire3) : wire6)) ?
              reg8 : ($signed($signed(reg10)) ?
                  ((8'ha5) <= reg7) : $unsigned((wire4 << wire6)))));
        end
    end
  assign wire12 = (wire6 ? reg11 : $signed($signed((^(8'ha6)))));
  assign wire13 = (+(reg5[(1'h0):(1'h0)] ?
                      wire0[(2'h2):(2'h2)] : $signed(wire4[(4'he):(3'h4)])));
endmodule
