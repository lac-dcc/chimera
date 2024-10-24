module top
#(parameter param14 = {(((~((7'h44) ? (8'hb0) : (8'hac))) >> (((8'hb2) ? (8'h9f) : (8'ha6)) == {(8'hbc), (8'hb9)})) ? (((&(8'hbd)) ? ((7'h40) ? (8'ha5) : (8'hb9)) : ((7'h41) <= (8'hb2))) ? {((8'hae) ^~ (8'hb5)), ((8'ha3) ? (8'hbd) : (8'ha3))} : (8'hbf)) : (!{{(7'h42), (8'h9c)}, (~&(7'h40))}))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire9;
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(wire1))
        begin
          reg5 <= wire1[(4'hb):(2'h3)];
          reg6 <= {$signed(wire4)};
        end
      else
        begin
          reg5 <= (~^wire3);
        end
      reg7 <= $unsigned($signed($signed(wire4[(4'hd):(4'hb)])));
      reg8 <= (~&(reg5[(4'hc):(4'h9)] ?
          ({reg5, {(8'ha4)}} <<< reg5[(4'he):(4'h9)]) : {$unsigned(wire4)}));
    end
  assign wire9 = ($unsigned(wire0) == ($signed((~|$unsigned(wire4))) >= $signed((&((8'hb4) != reg7)))));
  assign wire10 = wire2[(1'h0):(1'h0)];
  assign wire11 = ((&(wire2[(1'h0):(1'h0)] ?
                      (wire10[(3'h4):(1'h0)] ?
                          $signed(wire4) : wire3) : $unsigned((wire10 ?
                          wire1 : wire2)))) >>> wire2[(2'h2):(1'h1)]);
  assign wire12 = ((reg6 ? (reg7 || wire1[(2'h2):(2'h2)]) : $unsigned(wire2)) ?
                      $signed(($unsigned(reg8) - (|(wire0 ?
                          (8'ha3) : wire3)))) : {$unsigned((!wire0[(4'h9):(2'h2)]))});
  assign wire13 = ((-(wire11 ?
                          (&(wire4 || reg6)) : {(^~wire3),
                              (wire2 >>> (8'ha8))})) ?
                      (($unsigned(((8'hac) ?
                          wire4 : (8'ha0))) >>> $signed(wire1)) != (&wire2)) : {wire1});
endmodule
