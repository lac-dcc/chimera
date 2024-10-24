module top
#(parameter param36 = ((((((8'hb7) ? (8'ha2) : (8'ha8)) ? {(8'ha0), (8'haf)} : ((8'ha4) <<< (8'hb4))) ? {((8'hb9) ? (7'h42) : (7'h43))} : ((~^(8'h9f)) ? ((8'hb1) < (8'hb6)) : ((8'ha5) ? (8'ha1) : (8'haa)))) > (8'ha2)) <= ({{(8'ha2)}, (~&{(8'hbb)})} ? ((8'ha6) ? ((|(8'h9c)) >> (!(8'haf))) : (((8'ha5) ? (8'hb6) : (8'hb6)) && ((8'hbd) > (8'ha4)))) : (~(~&((8'ha5) ? (8'ha9) : (8'ha6)))))), 
parameter param37 = param36)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire32;
  assign y = {wire35, wire34, wire5, wire6, wire7, wire8, wire32, (1'h0)};
  assign wire5 = $unsigned({($unsigned($signed(wire1)) ?
                         $unsigned((wire0 ~^ wire4)) : (wire2 >> (~^wire0)))});
  assign wire6 = (&(($signed($signed((8'hbb))) ?
                     $unsigned((~|wire1)) : {wire0[(4'hf):(4'hc)]}) <= wire4[(3'h5):(1'h0)]));
  assign wire7 = $signed($unsigned($unsigned(wire2)));
  assign wire8 = wire1;
  module9 #() modinst33 (.clk(clk), .wire10(wire8), .wire11(wire1), .wire12(wire4), .wire13(wire7), .wire14(wire2), .y(wire32));
  assign wire34 = wire8[(3'h6):(3'h4)];
  assign wire35 = (~^$unsigned(wire4));
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
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
                 reg26,
                 (1'h0)};
  assign wire15 = wire12;
  assign wire16 = wire11[(3'h7):(3'h6)];
  assign wire17 = ((($unsigned(wire15[(4'hd):(1'h0)]) < wire16[(3'h5):(1'h1)]) ?
                      wire16 : {(wire10 - ((8'h9c) ?
                              wire16 : wire11))}) << wire16[(3'h6):(2'h3)]);
  assign wire18 = ({wire11} ^ $signed($signed({{wire11, wire15},
                      (wire16 ^~ (8'hb6))})));
  assign wire19 = (~&wire16);
  assign wire20 = (((~|($signed(wire10) ? (~^(8'hb9)) : $unsigned((7'h42)))) ?
                      $signed(wire16[(4'h8):(3'h6)]) : (-wire17)) > wire13);
  assign wire21 = $unsigned((-($signed(wire13[(4'he):(3'h4)]) ?
                      (&(wire18 == wire17)) : wire19)));
  assign wire22 = wire16;
  assign wire23 = {(wire11 - $unsigned($unsigned(wire13[(2'h2):(1'h0)])))};
  assign wire24 = (~&(~&(wire23 ?
                      wire13[(2'h2):(1'h0)] : $unsigned((~^wire22)))));
  assign wire25 = ($unsigned({((wire24 >> wire23) && wire22[(2'h2):(1'h1)]),
                      (8'ha3)}) ~^ $signed(($unsigned(wire15) << wire18)));
  always
    @(posedge clk) begin
      reg26 <= (($signed((wire25[(1'h1):(1'h1)] ?
              (|wire13) : wire15)) * $signed({wire16})) ?
          (&($signed({wire10, wire14}) ?
              ((wire22 ?
                  wire12 : wire10) <<< wire10[(2'h2):(1'h0)]) : {wire20[(3'h6):(1'h1)]})) : wire15[(4'hf):(3'h6)]);
    end
  assign wire27 = (((wire11[(3'h5):(3'h4)] >> $unsigned(((8'haf) ?
                          wire16 : (8'hb1)))) < {wire19,
                          wire12[(4'hc):(1'h0)]}) ?
                      {(~$signed((wire12 << wire10)))} : wire16[(3'h7):(3'h6)]);
  assign wire28 = ((wire24 ?
                          wire11 : $unsigned(($signed(wire10) ~^ ((8'ha3) ?
                              (8'h9f) : wire18)))) ?
                      {((&(wire12 ?
                              wire27 : wire16)) > (wire25[(2'h3):(2'h2)] && (+wire10)))} : {{(^wire27)}});
  assign wire29 = $signed(wire17);
  assign wire30 = $unsigned((^$signed($signed((wire27 >>> wire22)))));
  assign wire31 = wire18;
endmodule
