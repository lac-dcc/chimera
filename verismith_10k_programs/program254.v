module top
#(parameter param13 = (({(((8'hbc) ? (8'hb9) : (8'hae)) != (~^(8'hb9)))} != (((~&(8'hae)) && ((8'h9c) == (8'hb0))) + {((8'hb2) ? (8'ha1) : (8'h9f)), ((8'ha5) | (8'hbd))})) ? (|{{(^(8'ha1)), ((8'ha1) + (8'h9c))}}) : (((((8'haf) ? (8'hbb) : (8'ha3)) & (~|(7'h40))) ? {(+(8'ha3))} : (^~{(8'hac)})) ? (~|(|{(8'hb4)})) : ((((8'hbd) - (8'hb4)) ? ((8'hba) ? (7'h40) : (8'hbe)) : ((8'hb5) ? (8'ha4) : (8'ha3))) != ((-(8'hb8)) ? (~|(8'hb9)) : (~^(7'h42)))))), 
parameter param14 = param13)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = (((~^(wire1 ? (|wire1) : {wire0})) ?
                         wire0[(5'h12):(4'hd)] : (|wire0[(5'h12):(5'h11)])) ?
                     wire3[(2'h2):(2'h2)] : (~&$unsigned((7'h43))));
  assign wire5 = $unsigned(((8'ha4) ? {wire4} : wire3[(4'he):(4'hc)]));
  assign wire6 = ($unsigned($unsigned(((wire2 ^~ wire3) ?
                         $unsigned(wire4) : wire1))) ?
                     (wire3[(1'h0):(1'h0)] >>> (~^(-((7'h40) ?
                         wire2 : wire1)))) : wire1);
  assign wire7 = {((($signed(wire4) ? $signed(wire1) : wire5[(2'h3):(1'h1)]) ?
                         ($signed((8'h9d)) ?
                             $signed(wire4) : {wire1,
                                 wire5}) : ($signed(wire4) ?
                             wire3 : ((8'hb3) ? wire6 : wire6))) | wire2)};
  assign wire8 = $unsigned((({((7'h44) >>> (8'hb6)), wire2} ?
                     $unsigned($unsigned(wire3)) : (8'hb8)) == ({$unsigned(wire7)} ?
                     wire4 : wire3[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg9 <= wire5;
      reg10 <= $signed($unsigned($signed(($signed((8'ha2)) ?
          (wire5 * wire6) : $signed((8'hab))))));
    end
  assign wire11 = reg10[(1'h1):(1'h0)];
  assign wire12 = {(&($signed($unsigned(reg9)) ?
                          $unsigned((wire2 ?
                              wire8 : wire0)) : (reg9[(3'h5):(2'h3)] ?
                              (wire5 * wire5) : {wire2, wire4})))};
endmodule
