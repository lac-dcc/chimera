module top
#(parameter param8 = {(({((8'hbc) ? (7'h44) : (8'ha9)), ((8'hb3) >>> (8'had))} ? (|((8'hbd) << (8'hb1))) : ({(7'h40)} ? {(8'haf), (8'hbf)} : (~|(8'h9f)))) || ((((8'hb2) ? (8'hb1) : (8'h9e)) || {(8'h9f)}) ~^ (!((8'ha0) != (8'hb8))))), ({((~&(7'h43)) ? ((8'hb8) ? (8'had) : (8'ha7)) : {(8'hb4)})} ? ((~((8'ha1) ? (7'h43) : (7'h40))) ? ((!(8'haa)) >>> (8'had)) : (-((8'hab) ? (8'h9d) : (8'ha6)))) : (+({(8'hbd), (8'hb6)} ? {(8'hb0)} : (~(8'haa)))))}, 
parameter param9 = param8)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (&($unsigned(wire3) ?
                     $unsigned($signed({(8'hac),
                         (8'ha6)})) : $signed(wire0[(1'h0):(1'h0)])));
  assign wire5 = $signed((wire2 ?
                     $unsigned($unsigned($unsigned((8'hb1)))) : wire3));
  assign wire6 = $unsigned(((+((wire2 ?
                     wire2 : wire3) >= $signed(wire1))) >> wire2[(1'h0):(1'h0)]));
  assign wire7 = (~^((wire0[(1'h0):(1'h0)] <<< {$signed(wire6),
                         $signed(wire5)}) ?
                     (wire2[(3'h4):(1'h1)] + (8'hb4)) : wire1));
endmodule
