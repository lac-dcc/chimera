module top
#(parameter param12 = ((8'hb1) ? (((((7'h43) ? (8'h9d) : (8'hb2)) ? ((8'ha8) ^ (7'h41)) : {(8'haa)}) ? (|((8'hb1) ? (8'ha6) : (8'hbb))) : ((~(8'hb9)) <= ((7'h40) | (8'hb0)))) >> (({(8'h9c), (8'hbf)} <<< ((8'ha7) ? (8'hbe) : (8'h9f))) * {(~(8'haa))})) : ({(((8'hbf) ? (8'ha0) : (8'hab)) ? ((8'ha6) ? (8'hb1) : (8'had)) : ((8'h9e) ? (8'h9d) : (8'hb0))), ((7'h41) ? {(8'hb0), (8'hab)} : ((7'h43) && (8'hba)))} ? ((|(7'h40)) ? (((7'h41) ? (8'hb4) : (7'h43)) <= (~|(8'ha4))) : (8'had)) : (~{((8'hab) ? (8'h9c) : (8'hac)), ((8'ha6) ^ (8'hab))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire11, wire10, wire9, wire5, wire4, reg8, reg7, reg6, (1'h0)};
  assign wire4 = $unsigned(((^~((wire1 ^~ wire0) && {wire1, wire0})) ?
                     $unsigned(((wire3 ?
                         wire3 : wire0) * $unsigned(wire0))) : wire3[(3'h4):(2'h2)]));
  assign wire5 = (wire4 <<< wire4);
  always
    @(posedge clk) begin
      reg6 <= {$signed(wire1[(1'h1):(1'h1)])};
      reg7 <= (^(((~^(wire0 << wire0)) ?
              ($unsigned(wire1) ?
                  wire1 : $unsigned(wire0)) : wire5[(3'h5):(3'h5)]) ?
          ((~^(-wire4)) + (wire2 && wire4[(4'hd):(4'ha)])) : (wire5[(4'ha):(2'h3)] ?
              wire5[(4'h8):(4'h8)] : $unsigned($unsigned(wire0)))));
      reg8 <= (~^reg7);
    end
  assign wire9 = (wire2[(3'h5):(2'h2)] ?
                     $signed($unsigned(reg6[(2'h2):(1'h1)])) : (-reg7));
  assign wire10 = wire2[(3'h5):(2'h3)];
  assign wire11 = wire5[(4'hb):(3'h7)];
endmodule
