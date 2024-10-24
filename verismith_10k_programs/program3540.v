module top
#(parameter param18 = ((^~{(((8'hab) == (8'ha7)) | {(8'ha7), (7'h40)}), (((8'ha7) & (8'hb6)) ? ((8'hb4) <= (8'ha8)) : ((8'hb3) ? (8'ha4) : (8'hb5)))}) ? {(-{(^~(8'ha8)), ((8'ha4) ? (8'ha4) : (8'hb1))})} : (-{(((8'hae) ^ (8'ha6)) ? ((8'ha6) ? (8'ha4) : (8'hb3)) : ((8'ha1) << (8'haf)))})), 
parameter param19 = ((|{(param18 << param18)}) < param18))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = ((&$signed($unsigned($unsigned((8'hb8))))) ?
                     $unsigned(wire4[(4'hd):(2'h3)]) : (!($signed((~&wire2)) <= (((8'ha7) ~^ wire4) ?
                         (wire3 ? wire0 : wire2) : {(8'h9d), wire0}))));
  assign wire6 = ($unsigned($unsigned((!$signed(wire4)))) ?
                     (wire4 ?
                         wire2[(4'ha):(1'h0)] : (wire4[(4'he):(4'he)] < wire0[(3'h6):(3'h5)])) : $signed(wire5));
  assign wire7 = $unsigned($unsigned(wire5[(3'h5):(2'h3)]));
  assign wire8 = ($signed(({wire4} <<< (wire7 == (|wire1)))) >= wire4);
  assign wire9 = (wire5 ?
                     $signed($signed($signed((wire0 ?
                         wire6 : wire0)))) : ((((wire1 ? (8'had) : wire3) ?
                             $signed(wire4) : $signed(wire4)) ?
                         ((8'h9f) | (wire0 ? wire4 : wire8)) : ($signed(wire0) ?
                             {wire8,
                                 wire7} : (wire1 >= wire6))) ~^ $unsigned((7'h43))));
  assign wire10 = ((!{(!$signed(wire1)), wire4[(3'h4):(1'h1)]}) ?
                      ((^~{$unsigned((8'hbd)),
                          $signed(wire2)}) ^~ wire1[(2'h2):(1'h0)]) : (&wire3));
  assign wire11 = ($signed((~^$unsigned($signed(wire3)))) ?
                      $signed(wire1) : (($unsigned((!wire5)) ^ (((8'hae) ?
                                  wire5 : wire9) ?
                              (^~wire6) : (wire10 * wire6))) ?
                          wire5[(4'he):(4'ha)] : wire5));
  assign wire12 = wire6[(5'h12):(4'h9)];
  assign wire13 = $signed(wire12[(3'h4):(2'h3)]);
  assign wire14 = (~^({({wire1, wire2} ? wire6 : $signed(wire6)),
                      ((wire12 ^~ wire0) & (~^(8'hae)))} | {$unsigned($unsigned(wire0)),
                      ({wire0} ? (wire11 ? wire13 : (7'h42)) : (~&wire4))}));
  assign wire15 = (wire12[(3'h4):(1'h1)] + (wire7 ?
                      (^~wire14[(1'h0):(1'h0)]) : (~|wire6[(3'h7):(1'h0)])));
  assign wire16 = wire2;
  assign wire17 = {wire9[(2'h3):(1'h0)],
                      ((wire4[(4'hc):(1'h0)] | $unsigned(wire2[(2'h2):(1'h0)])) >= (!$unsigned({wire8,
                          wire11})))};
endmodule
