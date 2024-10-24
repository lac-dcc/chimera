module top
#(parameter param14 = (((~^(~|((8'ha4) ? (8'hb0) : (8'hb9)))) ? (^(((8'hac) ? (8'ha1) : (8'ha0)) ? ((8'hae) ^ (8'had)) : (-(8'ha5)))) : (8'hbb)) ? (~((((8'hb9) * (8'hbb)) >= ((8'ha3) ^ (8'ha9))) | {(^~(8'haf))})) : ((((^~(8'h9e)) ? ((8'hb2) ? (8'hbe) : (8'ha6)) : (+(8'ha9))) ? (((8'hab) ? (8'hb1) : (8'ha9)) ? {(8'hbc), (8'hb9)} : ((8'ha3) ? (8'hb8) : (8'ha0))) : ((7'h40) ^ ((8'hbd) && (8'hb8)))) < ((((8'hb9) < (8'hb8)) ^~ {(7'h42)}) ? ({(8'hb1), (8'hac)} ? ((8'hb9) ? (8'ha9) : (8'ha3)) : (~^(8'haa))) : {(8'hb7)}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = wire3[(3'h4):(1'h1)];
  assign wire7 = $unsigned(((((wire1 - (8'hab)) ?
                         (wire2 ^~ wire6) : (wire5 - (7'h41))) * wire1) ?
                     (-$signed(((8'hb1) ?
                         wire4 : wire5))) : $unsigned($signed($signed(wire4)))));
  assign wire8 = (8'hbc);
  assign wire9 = ((wire3[(2'h2):(1'h0)] ?
                     {(+wire2[(4'h8):(1'h1)]),
                         {{wire1}}} : {wire2}) < wire1[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg10 <= $signed((wire1[(1'h1):(1'h0)] ?
          wire9 : $signed($unsigned((~(7'h40))))));
      reg11 <= (wire0[(4'h9):(4'h9)] != $unsigned($unsigned($signed($unsigned((8'ha2))))));
    end
  assign wire12 = $unsigned((~^(wire1 ?
                      wire3[(3'h4):(2'h2)] : $unsigned(wire9))));
  assign wire13 = (~&(({(reg10 ? wire1 : wire5), wire7} ?
                      ($unsigned((8'hbd)) ~^ (reg10 > wire12)) : ((wire8 >> wire1) ?
                          {wire5} : {wire2})) - wire4));
endmodule
