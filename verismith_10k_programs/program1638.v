module top
#(parameter param13 = ((~{((~^(8'h9c)) ? (8'h9f) : (^~(8'hb8)))}) ~^ ({{(~&(7'h43)), ((8'h9e) - (8'hbb))}, (^~(8'hac))} << (((|(8'hbb)) > (&(7'h41))) ? (((8'hb0) ? (7'h40) : (8'ha6)) ? ((8'had) ? (7'h40) : (8'h9f)) : {(8'had), (8'hb0)}) : (((7'h41) ? (8'hb9) : (8'h9f)) != ((8'hb3) == (8'ha4)))))), 
parameter param14 = (^~(8'ha5)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = $signed($unsigned($unsigned($unsigned($signed(wire0)))));
  assign wire5 = $unsigned($signed($unsigned(wire2[(3'h5):(3'h4)])));
  assign wire6 = ((+wire2[(4'h9):(2'h2)]) ?
                     wire1[(1'h0):(1'h0)] : wire0[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg7 <= $signed($unsigned(wire5[(2'h3):(2'h2)]));
      reg8 <= ($signed(($unsigned((wire0 && wire2)) >= ($unsigned(wire1) < (reg7 && wire0)))) ?
          ((~((^(8'ha7)) ?
              (wire2 | wire4) : (wire4 ^~ wire0))) | $signed(wire3[(2'h3):(2'h2)])) : wire1[(4'h9):(3'h5)]);
    end
  assign wire9 = wire6[(3'h4):(2'h3)];
  assign wire10 = ($signed(wire5[(3'h7):(3'h7)]) > $signed(wire3[(2'h2):(1'h1)]));
  assign wire11 = wire5;
  assign wire12 = (-wire5);
endmodule
