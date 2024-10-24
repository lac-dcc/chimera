module top
#(parameter param18 = ((8'hb8) ? ((~|(+(-(8'hbf)))) > ((|(8'h9c)) ? {((8'hbf) >>> (8'h9d))} : (((8'ha7) ? (8'hbc) : (8'h9d)) ? ((8'hb3) ? (8'hb8) : (8'hb6)) : (&(8'hac))))) : (~|{{((8'ha3) ? (8'ha4) : (8'hbf))}, {(+(8'hb0))}})), 
parameter param19 = param18)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg9,
                 (1'h0)};
  assign wire4 = $unsigned({$unsigned(({wire3, wire3} ?
                         $signed(wire0) : $signed(wire3))),
                     (-((wire2 ? wire2 : wire2) ?
                         $unsigned(wire0) : $signed(wire2)))});
  assign wire5 = (!(!(~&(wire0 <= (~wire0)))));
  assign wire6 = $unsigned(({(&$unsigned(wire1)),
                     ((wire3 ? wire1 : wire4) ?
                         (wire1 ? (8'ha3) : wire2) : wire2)} == ((!(wire0 ?
                         wire4 : (8'hb5))) ?
                     $signed(wire5[(1'h0):(1'h0)]) : wire0[(1'h0):(1'h0)])));
  assign wire7 = $signed((^~($signed($signed(wire2)) ?
                     $signed($signed(wire4)) : wire4[(3'h5):(1'h1)])));
  assign wire8 = ((wire4[(1'h1):(1'h1)] ?
                         wire0 : ({$unsigned(wire4), (wire2 ~^ wire5)} ?
                             $signed(wire3) : (7'h42))) ?
                     $unsigned(wire3) : wire3[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      reg9 <= $signed($signed($signed(wire6[(5'h15):(4'hf)])));
    end
  assign wire10 = ($unsigned(($unsigned((-reg9)) == reg9[(2'h3):(2'h2)])) != reg9[(1'h0):(1'h0)]);
  assign wire11 = (wire10 ?
                      $unsigned((8'hb7)) : $unsigned(({wire7[(1'h1):(1'h1)]} ?
                          (^~(wire8 ?
                              wire10 : wire3)) : $unsigned((wire5 + wire0)))));
  assign wire12 = ((~|wire3[(3'h5):(3'h5)]) ?
                      (({wire8[(2'h3):(1'h0)]} ^ ((wire11 <<< wire11) ?
                              $signed((8'haa)) : (8'ha5))) ?
                          ((wire8[(4'h8):(3'h4)] ?
                              (wire2 <<< wire4) : ((8'ha4) ?
                                  wire7 : wire1)) * $unsigned(wire5)) : (8'hb4)) : wire8);
  assign wire13 = ($unsigned($unsigned(wire11[(5'h14):(2'h3)])) ?
                      (wire7[(3'h7):(3'h5)] ?
                          wire4 : wire11[(5'h13):(5'h11)]) : (|$unsigned((wire3[(3'h5):(1'h0)] ?
                          wire4[(2'h3):(2'h2)] : $signed(wire7)))));
  assign wire14 = (^wire3[(1'h1):(1'h1)]);
  assign wire15 = $unsigned((^~wire11[(1'h0):(1'h0)]));
  assign wire16 = wire7;
  assign wire17 = {($unsigned(wire10) ?
                          wire15[(2'h3):(2'h3)] : $unsigned({(+(8'hbb))}))};
endmodule
