module top
#(parameter param36 = ((|(((!(8'hb2)) ? ((8'ha8) ? (8'ha5) : (8'ha8)) : ((8'ha5) >= (8'hb0))) << ((~|(8'had)) >= (+(8'ha8))))) << ((|(((8'hbb) < (7'h41)) ~^ ((8'had) ^ (8'ha6)))) ? (-({(8'hb8)} - ((8'hb9) ? (8'h9d) : (8'haa)))) : ((8'ha9) || (~|((8'ha5) <= (8'ha7)))))), 
parameter param37 = param36)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $signed((wire1 ?
                     $signed($signed(wire0)) : $signed(((wire2 == wire0) ?
                         (~|wire2) : $unsigned(wire0)))));
  assign wire5 = (((8'ha2) - $signed(($unsigned((8'hb3)) > $unsigned(wire3)))) ?
                     (-(wire4[(1'h0):(1'h0)] < {wire3})) : (&(wire3[(2'h3):(1'h1)] <<< {(8'hb0),
                         (~&wire3)})));
  assign wire6 = {$unsigned(wire2)};
  assign wire7 = {$signed((+$unsigned(wire2)))};
  assign wire8 = $unsigned({{wire2[(1'h0):(1'h0)]}});
  module9 #() modinst30 (.wire10(wire6), .wire11(wire4), .y(wire29), .clk(clk), .wire12(wire2), .wire13(wire1));
  assign wire31 = ((~({(~wire8)} ?
                      {$signed(wire5)} : wire2)) & ((~^$unsigned((+wire2))) ?
                      (+wire2[(4'ha):(2'h3)]) : $signed($signed(wire6[(3'h5):(1'h1)]))));
  assign wire32 = ($unsigned((wire6[(4'hb):(4'h8)] ?
                          ((wire8 <<< wire31) < wire2[(4'ha):(1'h0)]) : $signed((wire31 > wire2)))) ?
                      (^~wire29) : (wire4[(5'h10):(1'h1)] ?
                          wire6 : (((8'hbe) ?
                              wire31 : (wire31 ?
                                  (8'ha4) : wire3)) >>> ((wire8 - (8'h9d)) ^ wire1))));
  assign wire33 = ((~$signed($unsigned({wire3}))) ~^ wire1[(5'h14):(5'h12)]);
  assign wire34 = (wire7 < (!((&(|wire7)) ?
                      ((wire3 || (8'hbd)) <= (wire7 < wire32)) : ($unsigned(wire8) ?
                          (8'h9f) : (^~(8'hbd))))));
  assign wire35 = ((wire32 >>> wire8[(1'h0):(1'h0)]) ?
                      (wire5 <<< wire5[(3'h4):(1'h1)]) : {(~|wire33[(2'h2):(2'h2)]),
                          $unsigned(((wire31 ?
                              wire5 : wire3) || ((8'hb0) <= wire8)))});
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  assign y = {wire28,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire15,
                 wire14,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire14 = $unsigned({{($unsigned(wire11) && (-wire10)), wire13}});
  assign wire15 = wire14;
  always
    @(posedge clk) begin
      reg16 <= (wire12 ?
          (!wire11[(5'h10):(4'hb)]) : {(~&(&wire12[(3'h6):(3'h6)]))});
      reg17 <= {wire10, reg16[(4'he):(1'h1)]};
    end
  assign wire18 = wire10[(2'h3):(2'h3)];
  assign wire19 = reg16;
  assign wire20 = wire13;
  assign wire21 = $signed($unsigned($unsigned(((wire14 & (8'hae)) ?
                      (wire18 ? wire14 : wire13) : (wire20 ?
                          (8'ha0) : wire19)))));
  assign wire22 = wire10;
  always
    @(posedge clk) begin
      reg23 <= reg17[(3'h4):(2'h3)];
      reg24 <= wire20;
      reg25 <= ($unsigned($unsigned(((8'ha0) < $unsigned(wire14)))) != ((((^~wire12) <<< wire13[(1'h1):(1'h1)]) ?
              (7'h44) : ({wire19} ?
                  $unsigned((8'ha0)) : wire21[(4'ha):(2'h3)])) ?
          (wire18[(1'h1):(1'h0)] >> ($signed(reg17) < $unsigned(reg16))) : wire11[(3'h6):(3'h6)]));
      reg26 <= $unsigned($unsigned((~|$signed((^reg16)))));
      reg27 <= {{(-reg26)},
          ($unsigned(((wire22 + wire22) >> wire19[(4'ha):(3'h5)])) ?
              wire11 : wire13[(4'h8):(2'h2)])};
    end
  assign wire28 = wire18;
endmodule
