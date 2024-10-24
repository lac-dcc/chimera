module top
#(parameter param8 = (((7'h43) < ((-{(8'ha6), (8'hb1)}) <<< ((~&(8'ha4)) ? ((8'had) ? (8'haf) : (8'ha6)) : {(8'haa), (8'hba)}))) ? ({(((8'hab) ? (8'hb6) : (8'hb1)) == (+(8'hb4))), ({(8'ha8)} || (-(7'h40)))} ? ((-(^(8'haa))) ? (((8'hac) + (8'ha0)) ? ((8'had) << (8'ha0)) : (8'h9e)) : (((8'haf) ? (7'h42) : (8'hb6)) ? (~^(8'hb7)) : (8'hbb))) : (~^(~&(^~(8'hb8))))) : (~|{(((8'hba) ? (8'hb5) : (8'hae)) ? ((8'ha1) ? (8'ha1) : (8'ha4)) : ((8'hbe) >= (8'hb4)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed($signed($unsigned($unsigned((^~wire0)))));
  assign wire5 = {$signed($unsigned($unsigned(wire1[(2'h3):(2'h2)])))};
  assign wire6 = $signed($signed(((wire0[(2'h2):(1'h1)] == ((8'ha5) >> wire0)) ?
                     wire5[(3'h4):(2'h3)] : {(wire2 + wire1)})));
  assign wire7 = wire0;
endmodule
