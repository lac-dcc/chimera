module top
#(parameter param20 = {{(8'hb4)}, ((!{((8'ha7) == (7'h43))}) ? (^{((8'ha9) | (8'ha9))}) : (8'hac))}, 
parameter param21 = {((|(param20 >= (^(8'hb6)))) ? ((~&(param20 ? param20 : (8'hb4))) ? ((^param20) ? ((7'h43) ? param20 : param20) : {param20}) : (param20 != (8'ha3))) : (~param20))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed({(wire0[(1'h0):(1'h0)] & {wire1})});
      reg5 <= {(reg4 != $signed((!wire0[(2'h2):(2'h2)]))),
          ((|$unsigned(reg4[(3'h5):(2'h2)])) ?
              (8'hb3) : ((~&(wire2 ?
                  wire2 : wire2)) == $unsigned($unsigned(wire1))))};
      if (reg4[(3'h5):(3'h4)])
        begin
          reg6 <= (~|(8'hb3));
          reg7 <= wire0[(2'h3):(2'h2)];
        end
      else
        begin
          reg6 <= {((8'hba) ?
                  $signed((wire0 ?
                      (reg5 ?
                          wire2 : reg6) : reg5[(4'hc):(2'h3)])) : $unsigned(reg7[(4'ha):(3'h4)]))};
          reg7 <= $unsigned((wire1 * $unsigned((8'ha0))));
        end
      reg8 <= (+$signed(reg6));
      reg9 <= (+$unsigned(($unsigned($signed(reg4)) ?
          ((~|reg6) * (8'hbc)) : (~^((8'ha6) ^~ reg7)))));
    end
  assign wire10 = (8'hb9);
  assign wire11 = (+((reg6[(1'h1):(1'h0)] && (reg6 ?
                      $unsigned(reg5) : (wire2 ?
                          (8'haa) : reg4))) ~^ reg9[(3'h4):(3'h4)]));
  assign wire12 = (wire2 ~^ wire3[(4'hd):(2'h2)]);
  assign wire13 = wire1[(4'h8):(4'h8)];
  assign wire14 = (!wire1);
  assign wire15 = $signed(wire2[(3'h6):(2'h2)]);
  assign wire16 = reg5[(3'h4):(2'h3)];
  assign wire17 = $signed(((wire16 ?
                          (!$unsigned(wire3)) : ($signed(reg6) ?
                              $signed(wire11) : (wire15 ? (8'hb2) : reg7))) ?
                      wire0[(2'h3):(1'h0)] : {((reg8 ~^ wire0) - {(8'hb6)})}));
  assign wire18 = (~reg8);
  assign wire19 = reg6;
endmodule
