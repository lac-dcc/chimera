module top
#(parameter param14 = ((~|(8'h9f)) || (+({((8'hbe) ? (8'hbf) : (7'h41))} ? (8'hb0) : (((8'ha3) >= (8'ha2)) ? {(8'had), (8'hb6)} : ((8'ha8) ? (8'hbb) : (8'h9d)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed(wire3);
  assign wire6 = ((~(({wire3, wire5} ? (wire5 ^ wire3) : wire4) <= {wire4,
                         $unsigned(wire5)})) ?
                     (((8'hb8) ?
                             ($unsigned(wire1) ?
                                 {wire4, wire3} : (-(8'ha1))) : {wire3}) ?
                         (-((-wire4) ?
                             $unsigned(wire0) : wire0[(4'he):(4'h8)])) : (wire5 ?
                             wire5[(2'h2):(1'h1)] : (~wire5))) : (wire0[(2'h2):(2'h2)] << wire4[(1'h1):(1'h0)]));
  assign wire7 = (wire5[(2'h2):(1'h1)] ~^ $signed($unsigned(wire0)));
  assign wire8 = $signed(wire7);
  assign wire9 = $signed(({$unsigned($unsigned(wire0)),
                     ((-wire1) >>> wire6[(3'h5):(1'h0)])} == $unsigned($unsigned($unsigned((8'ha7))))));
  assign wire10 = ($signed($unsigned((wire3 <<< $unsigned(wire4)))) ?
                      wire8[(4'he):(2'h3)] : (^~$signed($unsigned((wire9 ?
                          wire5 : wire2)))));
  assign wire11 = {wire6, $unsigned($signed(wire8))};
  assign wire12 = $signed({((&$unsigned(wire7)) ^ {(wire5 ? wire6 : wire0),
                          (wire6 ? wire9 : wire5)}),
                      {$signed((!wire0))}});
  assign wire13 = (((($unsigned(wire11) ? {wire7, wire10} : wire7) ?
                              wire11[(2'h2):(1'h0)] : $signed((wire11 ?
                                  wire0 : wire2))) ?
                          (8'ha8) : wire11) ?
                      wire2 : $unsigned(wire5));
endmodule
