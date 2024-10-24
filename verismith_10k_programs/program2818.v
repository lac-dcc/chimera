module top
#(parameter param26 = {(((((8'h9e) ? (8'ha8) : (8'hbd)) & {(8'ha6)}) ? ((|(8'hb9)) ? ((7'h43) ? (8'hbd) : (8'hb8)) : {(8'ha5), (8'h9f)}) : ((&(8'hb2)) ? {(8'hab), (8'ha6)} : ((8'ha3) ? (8'hb2) : (8'h9e)))) > ((((8'hb3) > (8'had)) || (~(8'haa))) ? (((8'hb1) >= (7'h42)) != ((8'h9c) ~^ (8'hbf))) : (((8'ha8) * (8'haf)) * ((8'ha9) ? (8'h9f) : (8'had)))))}, 
parameter param27 = param26)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
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
                 wire5,
                 wire4,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire0[(3'h4):(2'h2)];
  assign wire5 = $signed({{$unsigned((|wire1)), $signed({wire1, (8'hbf)})},
                     (wire1[(4'ha):(1'h1)] ^ (((8'h9d) * (8'ha9)) == (wire2 && wire3)))});
  always
    @(posedge clk) begin
      reg6 <= ({(&wire5[(4'h8):(1'h0)])} ?
          (!$unsigned($unsigned((wire0 > wire2)))) : wire0[(2'h3):(2'h2)]);
      reg7 <= $signed((({wire1[(3'h4):(1'h0)], (reg6 >>> wire5)} ?
              (wire1 >>> $signed(wire5)) : $signed((reg6 >= wire3))) ?
          ((^$unsigned(wire4)) ?
              ((wire2 << wire1) && (wire1 ? wire2 : wire5)) : ({(7'h41)} ?
                  $signed(wire1) : (reg6 && (8'hb8)))) : (wire3[(3'h5):(2'h3)] ?
              wire2[(4'hd):(3'h5)] : wire5)));
    end
  assign wire8 = (8'ha7);
  assign wire9 = $unsigned(wire8[(2'h3):(1'h1)]);
  assign wire10 = ($unsigned(wire4) ?
                      (($unsigned({(8'hb3)}) < ($signed((8'hbb)) ?
                          $signed(wire1) : ((8'hb3) ?
                              wire5 : reg6))) * reg7[(1'h0):(1'h0)]) : ($unsigned($signed((wire1 ?
                          reg6 : wire8))) == $signed(((wire3 | wire5) ?
                          (reg7 ? wire2 : wire3) : (wire9 << wire1)))));
  assign wire11 = $unsigned(({((~^wire1) ?
                          $signed(wire3) : $unsigned(wire10))} * wire0));
  assign wire12 = ((!(~|($unsigned(reg7) >= (wire2 ? wire3 : wire4)))) ?
                      (reg7[(2'h2):(1'h0)] >>> reg7) : {(~(wire4[(5'h12):(3'h5)] == $unsigned(wire11)))});
  assign wire13 = {$unsigned((wire1[(5'h10):(1'h0)] >>> {wire1[(5'h10):(5'h10)],
                          wire5}))};
  assign wire14 = (8'ha7);
  assign wire15 = reg6[(2'h3):(1'h1)];
  assign wire16 = ((reg6[(1'h1):(1'h0)] & (^~(~^$signed(reg7)))) <<< wire14);
  assign wire17 = ((wire16[(1'h1):(1'h1)] >= $signed(wire10)) ?
                      (wire13 ?
                          $unsigned((wire3[(3'h4):(1'h0)] ?
                              (|wire15) : (+wire10))) : {($unsigned((8'hb2)) ?
                                  wire13 : $unsigned(wire10)),
                              wire16}) : (&$signed(wire15)));
  assign wire18 = wire14[(1'h0):(1'h0)];
  assign wire19 = ((&(8'haa)) ?
                      wire5 : {$unsigned($signed((wire18 & wire11))),
                          (~^({wire15} >> {wire13}))});
  assign wire20 = (((wire8 ? {(wire5 | wire1)} : wire15) ?
                          $unsigned((wire17 ^~ $signed(wire0))) : (&wire15)) ?
                      wire4 : (^({{wire14}, (wire10 ? wire8 : wire13)} ?
                          wire8[(1'h1):(1'h1)] : wire0)));
  assign wire21 = {$signed((wire13 >= ($unsigned((8'h9f)) || wire16[(3'h6):(2'h2)]))),
                      wire20};
  assign wire22 = wire5[(1'h0):(1'h0)];
  assign wire23 = wire16;
  assign wire24 = (($unsigned(wire10) ^~ (|wire10[(3'h6):(2'h2)])) >= (&$signed($unsigned($signed(wire22)))));
  assign wire25 = $signed(wire2);
endmodule
