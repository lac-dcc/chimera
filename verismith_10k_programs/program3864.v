module top
#(parameter param18 = (((((+(8'hab)) ^ ((8'hb3) + (7'h41))) ? (((8'h9e) - (8'h9c)) * ((8'hac) ? (8'hb0) : (7'h43))) : (~^{(8'hbb), (8'h9f)})) ? ({((8'hb3) <= (8'hbc)), ((8'haf) & (8'hae))} ? (((8'hb5) * (8'hb7)) || (~^(8'haa))) : (((8'ha2) ? (8'hb1) : (8'hb7)) ? (&(8'had)) : ((8'ha9) ? (7'h43) : (8'ha2)))) : ((((8'hac) ^ (8'haf)) ^~ ((8'hb6) ? (8'hac) : (8'hb2))) ? ((~(7'h42)) | {(8'hb7), (8'hbd)}) : ((~^(8'ha8)) ? ((8'ha7) ? (8'hb7) : (8'hb1)) : ((8'haf) >> (8'hbd))))) ~^ ({((^~(7'h40)) & ((8'ha4) << (8'h9f)))} ? (({(8'ha7), (8'h9c)} ~^ (+(8'h9d))) ? (~|((8'ha8) | (8'hbb))) : (|(~(8'h9e)))) : (((&(7'h43)) ? (-(8'h9e)) : (&(8'hac))) * (7'h44)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (~&((($signed((8'had)) ^ wire0) ?
                     $unsigned((|wire2)) : wire1) == $unsigned(((wire4 && wire4) ^ (8'hbc)))));
  assign wire6 = $signed(($unsigned({(|wire0), $unsigned(wire5)}) ?
                     $signed(wire2) : ((7'h42) != {(wire5 ? wire5 : wire4),
                         (wire5 || wire2)})));
  always
    @(posedge clk) begin
      if ($unsigned(wire4[(3'h4):(1'h1)]))
        begin
          reg7 <= $signed($signed($unsigned(({wire0, wire4} ?
              (~|wire6) : wire2[(1'h1):(1'h1)]))));
          reg8 <= ((~^(~|$signed((~|wire2)))) * wire5[(4'hd):(1'h0)]);
          reg9 <= ($unsigned((~$unsigned((&wire1)))) ?
              $unsigned((8'hb3)) : reg7[(3'h7):(3'h6)]);
          reg10 <= wire0[(2'h3):(1'h1)];
          reg11 <= wire4;
        end
      else
        begin
          reg7 <= reg11;
          reg8 <= (~$signed((wire2 >>> $signed(reg9))));
        end
      reg12 <= ($signed((((wire2 && wire3) ?
              {(8'hbc), (8'haf)} : ((7'h44) ?
                  wire6 : wire4)) | $signed($signed(wire2)))) ?
          (reg8 ?
              (~{$signed(wire1)}) : $unsigned(($signed(reg9) <<< ((8'hb5) - (7'h42))))) : ($signed((wire1[(1'h0):(1'h0)] ?
              $signed(reg7) : $signed(wire6))) > wire4[(2'h2):(2'h2)]));
      reg13 <= ((&(^~($signed(reg9) ?
          {reg11} : reg11))) ^~ $unsigned(wire6[(1'h1):(1'h1)]));
    end
  assign wire14 = reg7;
  assign wire15 = reg7;
  assign wire16 = (~&$unsigned({$unsigned(reg10[(4'hc):(4'hc)])}));
  assign wire17 = wire16;
endmodule
