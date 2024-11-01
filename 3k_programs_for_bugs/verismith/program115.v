module top
#(parameter param14 = {(^~{{((8'h9e) ? (8'ha3) : (8'hb0)), (~(8'hae))}})})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire6,
                 wire5,
                 wire4,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = $unsigned($signed($unsigned((8'ha8))));
  assign wire5 = (~|({((wire2 ^ wire4) ?
                             wire0[(1'h1):(1'h1)] : (wire1 >= (8'hb5)))} ?
                     (8'ha9) : {($unsigned((8'hb3)) ?
                             wire2[(1'h1):(1'h0)] : {wire1})}));
  assign wire6 = $signed(wire4);
  always
    @(posedge clk) begin
      reg7 <= $unsigned($signed(((((8'hbd) >>> wire1) ?
          $unsigned(wire5) : $unsigned(wire5)) - wire1)));
      if (wire0[(1'h0):(1'h0)])
        begin
          reg8 <= (~&(!$unsigned($unsigned(wire1))));
        end
      else
        begin
          reg8 <= (+$signed(({wire4, $signed(wire5)} >= {$unsigned((8'hb1))})));
        end
      reg9 <= ((8'haa) ?
          ((({reg8, wire6} ?
                  wire6 : (wire3 ? reg8 : wire0)) >> $signed($unsigned(reg7))) ?
              (~^(~|$signed(wire1))) : ($signed($unsigned((8'h9c))) >= (+wire4))) : $signed(wire6));
    end
  assign wire10 = reg9;
  assign wire11 = $signed(reg7[(2'h3):(1'h1)]);
  assign wire12 = (-$signed($unsigned(reg7[(3'h5):(1'h1)])));
  assign wire13 = (8'ha4);
endmodule
