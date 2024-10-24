module top
#(parameter param21 = (({(((8'ha0) && (8'ha5)) ? ((8'h9e) ? (8'hb4) : (8'ha3)) : ((8'hab) ? (8'hbc) : (8'hba)))} ? ((((8'hbb) ? (8'h9c) : (8'hb2)) > ((8'h9e) * (8'ha4))) >= ((~|(8'h9c)) & ((8'hb3) | (8'hb0)))) : (((-(7'h43)) == {(7'h43)}) != ((&(7'h41)) ? ((8'ha7) >>> (8'ha2)) : {(8'hab), (7'h40)}))) ? ((~&(((7'h44) ? (8'h9f) : (8'ha3)) ? ((8'hbf) ? (8'hb4) : (8'h9f)) : ((8'hbb) >= (8'hbe)))) ? (&((~^(8'hb1)) == ((8'h9d) > (8'hb6)))) : {{{(8'hb3), (8'haa)}, (~^(8'h9d))}, ((|(8'hbd)) != ((7'h42) * (7'h44)))}) : ((~|(((8'h9d) - (7'h40)) != {(7'h44)})) ? (|(!(~^(8'ha2)))) : ((&{(8'ha8)}) ? ((^~(7'h42)) + (~&(8'haf))) : (((8'ha6) >> (8'hb6)) ? ((8'hbf) && (8'hb6)) : ((8'ha1) << (8'ha8)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire8;
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire8,
                 reg18,
                 reg9,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (8'hb0);
      reg5 <= $signed($signed($unsigned(($unsigned(wire0) ?
          wire1 : (wire1 >= wire1)))));
      reg6 <= ({($unsigned(wire1[(3'h7):(1'h1)]) ?
              reg4[(5'h11):(5'h10)] : (wire3 <= $signed(reg5)))} - (^~$unsigned((wire2[(2'h3):(2'h3)] ?
          reg5 : {wire1, reg5}))));
      reg7 <= $signed($unsigned(($signed((reg6 ? (8'had) : (8'hac))) && reg4)));
    end
  assign wire8 = (wire2 ?
                     $unsigned((!(~&(reg7 ?
                         wire0 : reg6)))) : $signed((!($unsigned(reg7) >>> (reg5 <<< wire1)))));
  always
    @(posedge clk) begin
      reg9 <= wire0[(5'h11):(3'h5)];
    end
  assign wire10 = reg4[(3'h4):(3'h4)];
  assign wire11 = ((wire2 || ($signed(reg5) ~^ ($signed(wire3) | reg9[(2'h3):(1'h0)]))) ?
                      (($signed({wire3}) * wire0[(3'h5):(2'h3)]) ?
                          {(wire3 ^~ {(8'h9f)}),
                              (((8'ha2) ? (8'hab) : (8'hb8)) ?
                                  (|reg6) : (7'h42))} : $unsigned(reg5[(4'h9):(3'h6)])) : (((~|wire8[(1'h0):(1'h0)]) == wire2) ?
                          $signed((reg9 ?
                              $unsigned((8'hb5)) : (wire2 << wire0))) : wire3));
  assign wire12 = (reg9[(1'h1):(1'h1)] << ($unsigned({(+reg6),
                      $signed(reg4)}) | (wire2 ?
                      (reg4[(2'h3):(2'h3)] - ((8'h9c) | reg6)) : ((wire3 ?
                              reg7 : wire10) ?
                          (&wire1) : reg4[(3'h5):(1'h1)]))));
  assign wire13 = wire1[(4'h9):(4'h8)];
  assign wire14 = ((~^$unsigned((-(8'ha7)))) ?
                      (&$unsigned(wire13[(3'h5):(2'h3)])) : (((~^$signed(reg4)) & ((wire0 + wire11) != reg7[(3'h4):(2'h2)])) ?
                          ((wire13[(1'h1):(1'h0)] == $unsigned(wire12)) ?
                              (wire12 ?
                                  {(8'ha1)} : $unsigned((8'hb0))) : ({wire13,
                                      reg9} ?
                                  $signed(wire10) : reg5)) : (wire11[(4'he):(4'ha)] ?
                              wire11 : reg5[(3'h4):(3'h4)])));
  assign wire15 = $unsigned((+((wire3[(4'ha):(3'h4)] ?
                          $unsigned(wire14) : {wire1, wire1}) ?
                      reg7 : $signed((^~wire8)))));
  assign wire16 = $unsigned($signed($signed(wire13)));
  assign wire17 = $unsigned((wire10[(4'hc):(4'h8)] ?
                      $signed((wire8[(1'h0):(1'h0)] ?
                          {(8'hb5), wire2} : wire3)) : ({reg5[(4'hb):(2'h2)],
                          ((8'hb7) != wire11)} ^ $signed(reg9[(2'h3):(2'h3)]))));
  always
    @(posedge clk) begin
      reg18 <= $signed(wire3);
    end
  assign wire19 = $unsigned($signed(($signed((8'ha2)) == wire13[(3'h6):(2'h3)])));
  assign wire20 = $signed((~|wire3[(3'h4):(1'h0)]));
endmodule
