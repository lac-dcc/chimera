module top
#(parameter param26 = (^({({(8'hbf)} < ((8'h9c) ? (8'hb7) : (8'hbd))), (((8'ha6) ? (8'hae) : (7'h42)) - ((8'ha0) >> (8'hbb)))} ? (!({(8'hb8)} * {(8'hb2)})) : ((((7'h43) | (8'hb1)) >= ((8'hb1) ? (8'ha1) : (8'hae))) << (((8'hae) + (8'h9c)) ^~ ((8'h9e) < (8'hb8)))))), 
parameter param27 = {((8'ha9) << ({(param26 <<< param26)} ? {(^~param26), (param26 > param26)} : (&(param26 ? param26 : param26)))), (({param26} > (+{param26})) ? param26 : (&((&param26) == ((8'haa) ? param26 : param26))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire [(2'h2):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire19;
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire4,
                 wire19,
                 reg5,
                 (1'h0)};
  assign wire4 = wire0[(4'he):(4'hc)];
  always
    @(posedge clk) begin
      reg5 <= wire0[(1'h1):(1'h0)];
    end
  module6 #() modinst20 (.clk(clk), .wire10(wire1), .y(wire19), .wire7(wire2), .wire9(reg5), .wire8(wire4));
  assign wire21 = ((($unsigned(((8'hb6) ? wire2 : (8'hba))) ?
                          $unsigned($signed(wire2)) : $unsigned($unsigned(wire0))) == wire19[(2'h3):(2'h2)]) ?
                      $signed((~&($unsigned((8'hb6)) ?
                          (wire1 ^~ wire1) : (wire0 ^~ wire4)))) : (((~^(wire19 ?
                          reg5 : wire4)) != {wire1,
                          wire4}) >>> (!($signed((8'ha4)) ?
                          $unsigned(reg5) : (wire4 < wire19)))));
  assign wire22 = wire21;
  assign wire23 = (wire22[(3'h6):(1'h0)] >= $unsigned((($signed(wire3) & wire22) ?
                      (~(wire1 == wire2)) : $unsigned($unsigned(wire21)))));
  assign wire24 = $unsigned({$signed(wire22[(5'h10):(3'h7)]),
                      $signed((~|((8'hbd) ? (8'hb1) : wire19)))});
  assign wire25 = reg5;
endmodule

module module6
#(parameter param17 = (8'h9d), 
parameter param18 = (^~((|{param17, (^~(8'hb8))}) >>> (~|{{param17}, ((8'h9c) || param17)}))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire11;
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire16, wire15, wire14, wire11, reg13, reg12, (1'h0)};
  assign wire11 = wire8;
  always
    @(posedge clk) begin
      reg12 <= $signed(($signed((wire9[(3'h4):(1'h1)] ? (~^wire7) : {wire9})) ?
          (wire11[(4'hf):(2'h2)] ?
              (wire11 ? $signed(wire8) : $unsigned(wire10)) : ((|wire8) ?
                  $signed(wire8) : (-wire10))) : (^(wire9[(3'h5):(2'h2)] ?
              (+wire11) : ((8'h9f) ? (8'ha2) : wire7)))));
      reg13 <= $unsigned((~&((&{wire9, wire11}) ?
          $signed({wire8, wire11}) : {$signed(wire11), (^wire9)})));
    end
  assign wire14 = (&(^(!(~|wire11[(3'h5):(3'h4)]))));
  assign wire15 = {reg13, reg12};
  assign wire16 = (~(wire15[(3'h5):(1'h0)] ? wire10 : wire9));
endmodule
