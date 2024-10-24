module top
#(parameter param9 = (({(((8'h9e) != (8'had)) ~^ ((8'ha9) ? (8'hb2) : (8'ha2))), (((8'hbe) ? (8'ha7) : (8'hbf)) ? ((8'h9e) ? (8'h9e) : (7'h41)) : ((8'ha4) ? (8'h9e) : (8'ha6)))} ? (^({(7'h42), (7'h41)} ? (+(8'hb8)) : (~&(8'h9e)))) : {(+(~(7'h41))), (~&((8'haa) >> (7'h41)))}) ? (((((7'h44) ? (8'hb0) : (8'ha8)) ? ((8'hb4) & (8'ha5)) : {(8'ha8), (8'h9e)}) ? ({(8'h9c), (8'hbc)} ? {(8'h9d), (8'hb9)} : {(8'hb2), (8'ha0)}) : (~((8'h9e) * (8'hbc)))) ? {(((8'hb0) && (8'hac)) << (7'h44))} : {(((8'hbd) ^~ (8'hb5)) <= ((7'h42) ? (8'hbc) : (8'hb9))), (-{(8'ha5)})}) : (!(({(8'hba)} ? (+(8'hbd)) : (^(8'ha1))) + ((|(8'ha9)) ? ((8'hbb) << (8'hae)) : (~^(8'hb1)))))), 
parameter param10 = (param9 * ((8'h9f) >= ((((8'hb4) ? param9 : param9) | (~^param9)) ? param9 : param9))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire8, wire7, wire6, wire4, reg5, (1'h0)};
  assign wire4 = ($unsigned($signed($unsigned(wire2[(2'h3):(2'h3)]))) ?
                     ($unsigned(((wire2 ? wire2 : wire3) ?
                             $signed(wire2) : (wire0 + (7'h40)))) ?
                         {wire1[(2'h2):(1'h0)]} : $signed((+$signed(wire2)))) : wire3[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg5 <= (+$unsigned((wire0 ?
          ((wire4 ? wire3 : wire1) || {wire1,
              (8'hb7)}) : wire1[(3'h4):(1'h1)])));
    end
  assign wire6 = $signed(wire4[(3'h7):(3'h5)]);
  assign wire7 = reg5[(1'h1):(1'h0)];
  assign wire8 = wire1;
endmodule
