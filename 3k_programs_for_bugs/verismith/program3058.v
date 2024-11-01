module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
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
  assign wire5 = wire3[(3'h5):(3'h5)];
  assign wire6 = ($signed((({(8'h9e)} ?
                         wire0 : wire4[(3'h6):(2'h3)]) == wire0)) ?
                     (wire4 ?
                         (wire2 && wire1[(1'h1):(1'h0)]) : $unsigned(wire3[(3'h4):(1'h1)])) : (((!$unsigned((8'hb3))) << {(-wire4)}) * ((~|wire1) ?
                         $signed((^wire4)) : ($unsigned(wire2) >>> ((8'hba) * wire0)))));
  assign wire7 = $signed(((wire1[(2'h3):(1'h1)] ?
                         (wire3 || wire3[(2'h2):(1'h1)]) : ((wire1 ?
                             wire2 : wire6) || $unsigned(wire6))) ?
                     (wire0 ?
                         wire2[(1'h0):(1'h0)] : wire2[(2'h2):(1'h0)]) : $signed(((wire2 <<< wire6) ^ (wire2 << wire0)))));
  assign wire8 = (-(8'hbe));
  assign wire9 = {$unsigned((({wire0, (8'ha4)} ? wire4 : wire4) ?
                         ($signed(wire2) << (wire4 >> (8'h9f))) : $signed($signed(wire7))))};
  assign wire10 = $signed($unsigned((wire0 ?
                      wire1[(1'h0):(1'h0)] : $unsigned(((8'h9d) > wire9)))));
  assign wire11 = $signed((&wire7));
  assign wire12 = wire0[(3'h5):(2'h3)];
  assign wire13 = wire0;
  assign wire14 = {(wire1 & (-(&$unsigned(wire8))))};
  assign wire15 = ($signed($signed($signed($signed(wire1)))) ?
                      (($signed((wire10 >> wire6)) ^~ wire6[(1'h0):(1'h0)]) <= wire12[(3'h5):(3'h5)]) : (((wire11 ?
                                  wire4 : (wire10 >> wire14)) ?
                              wire12[(1'h1):(1'h1)] : $unsigned(wire12[(3'h4):(3'h4)])) ?
                          ((wire9 ^ wire11[(4'h9):(3'h4)]) <= (|(8'ha4))) : {(8'hb7),
                              wire14[(1'h1):(1'h0)]}));
  assign wire16 = ({$unsigned(wire14)} - $signed($signed($signed($signed(wire1)))));
  assign wire17 = (wire12[(2'h3):(2'h2)] & $unsigned($unsigned($unsigned(wire0))));
  assign wire18 = ({(^(^~$signed((8'hab))))} ?
                      (wire13[(1'h1):(1'h0)] == wire15) : wire5[(2'h3):(2'h2)]);
  assign wire19 = wire3;
  assign wire20 = $signed($signed(((&(~wire16)) <= $signed(wire3))));
  assign wire21 = wire16[(3'h6):(2'h3)];
  assign wire22 = {{(~&(~$unsigned(wire2)))}};
  assign wire23 = (wire20[(3'h4):(2'h3)] ?
                      ($unsigned($signed(wire17[(1'h0):(1'h0)])) ?
                          {$unsigned(wire3[(2'h3):(2'h2)])} : (8'hbf)) : ({$unsigned((wire21 ?
                                  wire1 : wire0)),
                              (~^wire4)} ?
                          wire2 : {wire12[(3'h5):(1'h1)]}));
  assign wire24 = (($signed(((|(8'ha2)) ? wire11 : wire8)) ?
                      $unsigned($signed((wire14 - wire15))) : (((wire10 ~^ wire9) ?
                              (wire23 << wire23) : $unsigned(wire22)) ?
                          ((wire23 ?
                              (8'ha6) : wire6) < (&wire20)) : {wire0[(2'h2):(2'h2)],
                              wire14})) > (wire7[(2'h3):(1'h0)] ?
                      (((wire17 || wire12) ?
                          (wire1 - wire5) : wire19[(3'h7):(3'h4)]) >= wire2[(1'h1):(1'h0)]) : (((wire17 >> (8'hb1)) ?
                              {wire16} : (wire1 > (7'h43))) ?
                          (&{wire6, wire23}) : (|{wire18}))));
  assign wire25 = wire7[(2'h2):(2'h2)];
endmodule
