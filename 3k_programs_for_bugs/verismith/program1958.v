module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (wire2 < wire2[(3'h4):(3'h4)]);
      reg5 <= wire3[(1'h0):(1'h0)];
      if (({(reg5[(5'h11):(3'h4)] ?
              $signed({reg4, wire1}) : {(+wire1),
                  (reg5 ? wire0 : reg4)})} + (!(reg4[(2'h3):(1'h1)] ?
          ({wire2} ^ (|wire0)) : $unsigned(((8'h9e) * wire0))))))
        begin
          reg6 <= (wire2 + $signed((~|($signed(reg5) && (reg5 ?
              wire3 : (8'hbf))))));
          reg7 <= (~&wire2);
        end
      else
        begin
          reg6 <= $unsigned(reg7[(2'h2):(1'h0)]);
        end
      reg8 <= wire0[(4'ha):(1'h0)];
    end
  assign wire9 = $signed(((~&reg7[(1'h1):(1'h0)]) && $unsigned(wire1)));
  assign wire10 = wire9[(1'h1):(1'h1)];
  assign wire11 = $unsigned(wire1);
  assign wire12 = $signed((!(($signed(reg6) ?
                          ((8'ha9) ? wire3 : wire0) : $unsigned(reg6)) ?
                      $signed(wire1) : (8'ha4))));
  assign wire13 = {reg7[(1'h1):(1'h1)],
                      (reg7 ?
                          $unsigned((-(+reg5))) : {wire3[(4'h8):(2'h3)],
                              (8'h9c)})};
  assign wire14 = {$signed(($unsigned({wire3}) + {$signed(reg7), wire9}))};
  assign wire15 = wire11;
  assign wire16 = {wire9[(2'h2):(1'h0)]};
endmodule
