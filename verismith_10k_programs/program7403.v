module top
#(parameter param14 = (!(((((8'ha9) ? (8'ha6) : (8'hb1)) ? ((8'ha8) ? (8'hb1) : (8'ha5)) : ((8'h9f) ? (8'hb9) : (8'hbb))) - ({(8'hac)} ? ((8'haa) != (8'ha5)) : ((8'haf) ? (8'hbc) : (7'h40)))) >> (&{(+(8'hab)), ((8'had) ? (7'h42) : (8'haf))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (($unsigned($unsigned((8'ha5))) == $signed(($unsigned(wire3) ?
                         wire1 : wire4))) ?
                     wire4[(3'h5):(3'h4)] : wire4[(1'h0):(1'h0)]);
  assign wire6 = wire1[(3'h7):(3'h4)];
  assign wire7 = ($signed($unsigned((^(|(8'hbf))))) ?
                     ($signed(($signed(wire3) ?
                             wire0[(2'h2):(2'h2)] : $signed(wire5))) ?
                         $unsigned(wire5) : ((~|wire6) ^ wire3)) : $signed((wire3[(3'h7):(3'h5)] - $unsigned((wire2 ^~ wire1)))));
  always
    @(posedge clk) begin
      reg8 <= (($signed(($unsigned(wire1) > (wire4 ?
          wire5 : wire6))) && {$unsigned((8'hb5)),
          wire6[(2'h2):(2'h2)]}) ^~ (((8'ha5) ^~ wire0) != (~&(8'ha8))));
      reg9 <= (wire6 ?
          (({((8'hbb) && wire4), wire7} != ((wire4 || (8'ha3)) * (~|wire0))) ?
              (~|wire6) : (!(^wire2))) : {wire5[(4'h8):(3'h5)],
              ((7'h42) ?
                  ($unsigned(wire0) ?
                      {wire2,
                          wire4} : $unsigned(wire0)) : $signed($signed(wire2)))});
    end
  assign wire10 = (^~wire6[(2'h2):(1'h0)]);
  assign wire11 = reg9[(2'h3):(2'h2)];
  assign wire12 = wire7[(3'h6):(2'h2)];
  assign wire13 = reg8[(3'h4):(1'h1)];
endmodule
