module top
#(parameter param29 = (7'h41), 
parameter param30 = (~&(~|((!{param29}) ? ((param29 ? param29 : (8'hb0)) ? param29 : {(8'ha9)}) : (~param29)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
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
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = (-($unsigned((((8'hbc) ? (8'ha3) : wire0) >= (wire0 ?
                         wire3 : wire2))) ?
                     $signed($signed($unsigned(wire0))) : $unsigned($unsigned((wire0 ?
                         wire2 : wire1)))));
  assign wire5 = (~&(+wire1[(4'ha):(3'h6)]));
  assign wire6 = $unsigned((~|$signed({$unsigned(wire3)})));
  assign wire7 = (8'haf);
  assign wire8 = (+wire6[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg9 <= $signed(($unsigned($unsigned((wire8 ? wire0 : wire7))) ?
          wire1[(3'h7):(3'h6)] : $unsigned(((~^wire5) <= (^wire3)))));
      reg10 <= ((wire4[(5'h15):(3'h6)] ? wire5 : (~$signed($unsigned(wire3)))) ?
          $unsigned(($signed(wire0[(2'h2):(1'h0)]) && wire7[(2'h3):(2'h2)])) : (8'ha2));
      reg11 <= ($unsigned(((|(wire3 > wire1)) ~^ wire4)) << wire6[(3'h6):(1'h0)]);
      reg12 <= (+((8'ha7) < wire7));
    end
  always
    @(posedge clk) begin
      reg13 <= wire2;
      reg14 <= wire5;
      reg15 <= $signed((($signed(reg13[(5'h11):(3'h5)]) ^ ((reg13 ?
          (8'hb5) : reg11) + $unsigned(wire8))) > (^(~^(wire3 ~^ reg12)))));
    end
  assign wire16 = ($unsigned(reg13[(5'h10):(1'h0)]) && reg9);
  assign wire17 = (!(reg12[(1'h1):(1'h1)] ~^ (~|wire6)));
  assign wire18 = (wire3 <<< (~^reg11));
  assign wire19 = {$signed($unsigned($signed($unsigned(reg10)))), wire16};
  assign wire20 = ($signed($signed((8'hb4))) ?
                      wire3 : ((~^wire17) ?
                          $signed((wire16 ?
                              (~|wire19) : wire3[(2'h2):(2'h2)])) : (~wire1)));
  assign wire21 = wire2[(2'h2):(1'h1)];
  assign wire22 = ($signed(wire5[(4'h9):(1'h1)]) ?
                      (8'hb3) : (~&(reg10[(4'hd):(4'h8)] ?
                          (wire0 ?
                              wire5[(4'hd):(3'h6)] : wire1[(4'ha):(3'h7)]) : wire7[(3'h5):(3'h4)])));
  assign wire23 = ($unsigned((($unsigned(wire1) < $signed(wire19)) - $unsigned(reg14[(1'h0):(1'h0)]))) ~^ ($signed($signed($unsigned(wire5))) ?
                      $signed((~|$unsigned(wire21))) : $signed(wire18[(2'h2):(1'h1)])));
  assign wire24 = ((reg13 <= wire0[(2'h3):(1'h0)]) ?
                      ((wire16[(2'h3):(2'h2)] ?
                              $unsigned($signed(wire7)) : wire22[(1'h1):(1'h0)]) ?
                          ((^~reg11) ?
                              (^{reg11,
                                  reg12}) : $unsigned($unsigned(wire0))) : $signed($unsigned(reg11))) : reg15);
  assign wire25 = wire3;
  assign wire26 = $signed(({{(~|wire3),
                          (reg11 << (8'ha3))}} >> $signed(wire25)));
  assign wire27 = (^~($signed(wire1[(4'h8):(3'h4)]) ?
                      $unsigned(wire2[(2'h2):(1'h1)]) : $signed((~^$signed(wire8)))));
  assign wire28 = wire8;
endmodule
