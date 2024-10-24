module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire4,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed($unsigned(wire2));
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg5 <= {$unsigned((wire0[(4'hd):(4'ha)] ?
                  (~^((8'ha8) ?
                      wire0 : wire2)) : $unsigned(wire1[(2'h3):(1'h1)]))),
              wire2};
          if (wire4)
            begin
              reg6 <= (^((wire2 ?
                  $signed(wire2[(1'h1):(1'h1)]) : $signed({wire2})) ~^ $unsigned($signed({(8'ha8),
                  wire4}))));
              reg7 <= (+$unsigned(wire0[(3'h7):(1'h0)]));
              reg8 <= $signed($unsigned(reg7));
              reg9 <= wire1[(4'hf):(1'h0)];
            end
          else
            begin
              reg6 <= (8'h9f);
              reg7 <= reg9[(4'h9):(3'h4)];
            end
          reg10 <= (~&($unsigned(wire3[(1'h1):(1'h1)]) ?
              $unsigned($unsigned(reg9)) : (wire3[(1'h0):(1'h0)] <= wire1[(2'h3):(1'h1)])));
          reg11 <= wire0[(2'h3):(1'h1)];
        end
      else
        begin
          reg5 <= $unsigned(((8'ha3) ?
              {reg5[(3'h4):(2'h2)]} : $signed({wire3})));
          reg6 <= reg11[(3'h6):(3'h4)];
        end
    end
  assign wire12 = (+(~|wire2[(5'h12):(1'h0)]));
  assign wire13 = wire12;
  assign wire14 = reg10;
endmodule
