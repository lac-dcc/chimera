module top
#(parameter param13 = ((8'h9c) ^~ (({((8'hb5) ? (8'hba) : (8'hb8))} | {((8'ha4) ? (8'hb6) : (8'hac)), ((8'hbd) >> (8'hb4))}) ? ((8'ha4) ? (((8'h9f) || (8'hac)) <= {(8'hb6)}) : (8'hb5)) : ((~((8'ha6) ^ (7'h40))) ? (|{(7'h40)}) : (((8'ha3) ? (8'hb9) : (8'ha8)) ? ((8'ha3) >= (8'hb6)) : (8'hb9))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (({wire3[(5'h10):(4'he)]} || (~^wire0)) ?
                     $signed($signed(((8'ha3) >= $signed((8'ha4))))) : wire0[(4'h8):(3'h6)]);
  assign wire6 = wire0[(4'hc):(3'h7)];
  assign wire7 = wire2;
  assign wire8 = (^~$signed($unsigned($signed((&wire0)))));
  assign wire9 = ((wire4 + (|(wire7 <<< {wire5}))) ? {wire6} : wire1);
  assign wire10 = ((~(~|$signed((+wire9)))) ^~ wire5[(1'h1):(1'h1)]);
  assign wire11 = wire8;
  assign wire12 = $unsigned($unsigned($unsigned($unsigned($unsigned(wire10)))));
endmodule
