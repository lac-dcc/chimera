module top
#(parameter param9 = {(((-((8'ha9) ? (8'haa) : (8'hb7))) ? (((8'hba) ? (8'ha2) : (8'hbf)) ? ((8'hb8) <<< (7'h42)) : (^~(8'hb0))) : {((8'had) ? (8'hb2) : (8'hb9))}) ? (((|(8'hb7)) ? (8'ha6) : (8'hb5)) ? {(~&(8'hb3))} : (&((8'ha4) ? (8'h9c) : (8'hb9)))) : ((~^{(8'ha2), (8'h9d)}) << {((7'h41) ? (8'ha6) : (8'hbe)), (-(7'h40))})), ((({(8'hb9), (8'h9d)} ? {(8'hae), (8'ha8)} : ((8'ha0) - (8'hb9))) ? (((8'hb2) ? (8'hb0) : (8'haf)) < (8'ha7)) : (~&(8'hae))) << ({((8'hb6) | (8'hba)), ((8'hb4) ^~ (8'hb6))} ? (~((8'hb3) ? (8'hba) : (8'ha3))) : (&(!(8'hab)))))}, 
parameter param10 = (8'hb3))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  assign y = {wire8, wire6, wire5, wire4, reg7, (1'h0)};
  assign wire4 = ($unsigned((wire0 < $signed(wire1))) * (wire2 & $unsigned(wire2[(2'h3):(2'h2)])));
  assign wire5 = wire2;
  assign wire6 = wire4[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= (wire1[(4'hb):(1'h1)] <<< ((~|(wire5[(2'h3):(1'h1)] ?
              $unsigned((8'ha9)) : (^wire4))) ?
          (((wire6 ?
              wire5 : wire4) << $unsigned((8'ha1))) <<< $unsigned((~&wire5))) : ((|(wire1 ?
                  wire5 : wire6)) ?
              (|(!wire2)) : $signed(((8'ha9) ? wire5 : wire4)))));
    end
  assign wire8 = (8'ha4);
endmodule
