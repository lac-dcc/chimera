module top
#(parameter param15 = {({(~|((8'hb6) < (8'hac)))} < ((((8'hbb) ? (8'had) : (7'h42)) < (!(7'h44))) ? (~^(~&(7'h43))) : (((8'haf) ^ (8'ha4)) >= ((8'h9c) ? (8'ha8) : (8'hbc))))), {((((8'hb8) ^ (8'ha3)) - ((8'hb2) ? (8'h9e) : (8'ha5))) >>> {{(8'hb3)}}), ((~^((8'hb6) + (8'ha5))) - {(+(8'h9e))})}}, 
parameter param16 = {((((param15 == param15) ? {param15} : (+param15)) <= (^(!param15))) ? (param15 < (param15 ? ((7'h41) >>> (8'ha9)) : (param15 ? param15 : (8'h9f)))) : ((&(~&param15)) ? ((param15 ? param15 : (8'hb4)) <= {param15, param15}) : (((8'had) ? param15 : (8'hbf)) >> (param15 ? param15 : param15))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  assign y = {wire14,
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
  assign wire5 = wire2;
  assign wire6 = {$unsigned((|(&wire5)))};
  assign wire7 = (wire4 ?
                     {$signed({{wire1}, (wire5 ? wire2 : wire2)}),
                         wire2[(5'h10):(4'he)]} : wire2[(5'h12):(5'h10)]);
  assign wire8 = wire4;
  assign wire9 = (wire1[(3'h4):(3'h4)] << {wire3});
  assign wire10 = ((~^({wire9, (~&(8'h9f))} && $signed((wire8 ?
                      wire2 : wire7)))) ^~ {wire8,
                      (wire8 ?
                          $unsigned({wire6, wire1}) : ((~&wire2) ?
                              ((7'h42) && wire9) : (|wire1)))});
  assign wire11 = (~&$signed({((wire3 ? (7'h44) : wire3) > {wire3, wire2}),
                      $signed($signed((8'hb2)))}));
  assign wire12 = $unsigned((+wire11));
  assign wire13 = (wire3[(2'h2):(1'h1)] <<< (((wire8[(4'hb):(3'h6)] ^~ $unsigned(wire8)) ?
                      ({wire4, wire2} - {wire4,
                          (8'hb9)}) : wire8[(1'h1):(1'h1)]) ^ {((8'ha9) ^~ $signed(wire4))}));
  assign wire14 = ($unsigned(((~&(|wire13)) && $unsigned({(8'haa),
                      wire4}))) <<< (8'hb0));
endmodule
