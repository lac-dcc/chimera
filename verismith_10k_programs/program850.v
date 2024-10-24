module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire6,
                 wire5,
                 wire4,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire2[(4'hb):(3'h7)];
  assign wire5 = (~(!((!wire1[(1'h0):(1'h0)]) <= wire2[(4'hd):(1'h1)])));
  assign wire6 = (wire4 ?
                     $signed({(wire5 <= (wire1 >= wire3)),
                         $signed(wire5[(3'h4):(1'h1)])}) : wire3);
  always
    @(posedge clk) begin
      reg7 <= $unsigned(({wire3, wire5} ?
          (8'hab) : $signed($unsigned($signed(wire1)))));
      reg8 <= (~|(~&(((~^(8'ha1)) ^~ (reg7 ? (8'hbc) : wire1)) ?
          wire4 : $unsigned($unsigned(reg7)))));
      reg9 <= ((^~$signed((~|(^~wire4)))) ?
          {((~^wire6[(4'h8):(2'h3)]) >>> wire4[(1'h0):(1'h0)]),
              $signed($signed(((8'haf) ?
                  reg8 : wire4)))} : {$unsigned({(!wire5),
                  $unsigned((8'hb1))})});
    end
  assign wire10 = $unsigned($unsigned(wire2[(4'hf):(4'h8)]));
  assign wire11 = $unsigned($signed($signed(wire0)));
  assign wire12 = ((!(reg7[(4'h9):(3'h6)] ?
                      reg7 : wire4)) < (-(|$signed(wire6[(4'hf):(3'h4)]))));
endmodule
