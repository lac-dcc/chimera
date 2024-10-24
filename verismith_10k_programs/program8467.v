module top
#(parameter param16 = (((((8'hb3) ? (^~(8'hbe)) : {(8'hbc)}) <= (((8'hac) ? (8'ha7) : (8'hbc)) ? ((8'hba) ? (8'hbe) : (8'hbb)) : ((7'h40) ? (8'hac) : (8'h9d)))) ? ({((8'hb3) ? (8'haa) : (8'hac)), (|(8'hae))} ? (((8'hb5) ? (8'hbd) : (8'ha4)) >> {(8'hae)}) : (8'hb3)) : (^~(!(+(8'ha8))))) << {((((7'h41) >> (7'h41)) ^ ((8'h9c) >= (8'hbc))) != {{(8'hb2)}, ((8'hb5) ? (8'had) : (8'h9c))})}), 
parameter param17 = ((((^~(param16 ? param16 : param16)) ? (~&param16) : param16) & (+(!(param16 ? param16 : (8'hab))))) - param16))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire7,
                 wire6,
                 wire5,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = {wire3};
  assign wire6 = (~(8'hbe));
  assign wire7 = $unsigned((wire1 ?
                     wire1 : $unsigned((wire6 ?
                         wire6[(3'h4):(2'h2)] : (wire1 ? wire3 : wire6)))));
  always
    @(posedge clk) begin
      reg8 <= (&{(!wire3[(4'h8):(3'h7)]), wire7[(1'h1):(1'h1)]});
      reg9 <= ($signed(wire5) >= ($unsigned((wire2[(1'h0):(1'h0)] - (wire2 ?
          wire6 : wire4))) ^ (wire1[(5'h12):(1'h1)] > $unsigned(wire1))));
      reg10 <= (wire5[(2'h2):(1'h1)] ?
          (wire2[(3'h6):(1'h1)] ?
              wire0[(3'h4):(3'h4)] : ($unsigned(wire4) && $unsigned(wire3))) : $signed({wire7[(1'h0):(1'h0)],
              $unsigned(wire4[(4'ha):(2'h2)])}));
      reg11 <= $unsigned(((((wire3 ? (8'hb2) : (8'hac)) && $signed(reg10)) ?
          wire7[(1'h1):(1'h0)] : (wire3 ?
              (reg10 > reg10) : $signed((7'h42)))) | reg8[(4'hc):(4'ha)]));
      reg12 <= wire7[(1'h0):(1'h0)];
    end
  assign wire13 = (wire4[(4'he):(4'hd)] ?
                      {(~|(^~$unsigned(wire7)))} : ($signed(reg8) >>> $signed(wire2[(4'hd):(4'hd)])));
  assign wire14 = {wire6[(3'h5):(2'h2)], reg9[(3'h6):(2'h2)]};
  assign wire15 = ($signed((|reg8[(4'hb):(1'h1)])) < {$unsigned(($signed(wire14) ?
                          (^~wire2) : $signed(reg8))),
                      $unsigned($unsigned(reg10[(5'h11):(3'h4)]))});
endmodule
