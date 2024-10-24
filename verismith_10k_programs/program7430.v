module top
#(parameter param28 = (~^((((8'hba) != {(8'hb9), (8'hac)}) ? (~&((8'hb2) + (8'ha5))) : (^((8'ha5) >= (8'hb2)))) > (&(|(8'h9e))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg21,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (wire0[(3'h7):(2'h3)] < (~^({$signed(wire2)} ?
                     $unsigned((|wire0)) : $signed((wire2 == wire0)))));
  assign wire6 = (-(((&(wire1 ? wire2 : wire4)) ^ (^$unsigned(wire3))) ?
                     (wire5 || wire0[(3'h7):(2'h3)]) : wire4[(1'h1):(1'h1)]));
  assign wire7 = (wire3[(1'h0):(1'h0)] ? wire5 : wire6[(4'ha):(3'h5)]);
  assign wire8 = wire1[(4'h8):(4'h8)];
  assign wire9 = wire3;
  assign wire10 = $signed(wire5[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg11 <= (&$signed((!wire5[(3'h5):(2'h2)])));
      reg12 <= (+((((wire8 ? wire3 : wire5) >>> wire1) ?
          (wire6 ? wire6 : wire4) : ((wire5 ?
              (8'hb2) : wire0) && $signed((8'hab)))) + wire6[(5'h12):(4'hf)]));
      reg13 <= (7'h44);
      reg14 <= (wire1 <= wire1);
      reg15 <= ({(reg14 ?
              (~^$signed(wire1)) : (^(reg11 ?
                  reg13 : wire9)))} >> (&wire5[(3'h5):(3'h5)]));
    end
  assign wire16 = reg15[(1'h1):(1'h0)];
  assign wire17 = wire9[(3'h4):(3'h4)];
  assign wire18 = wire0;
  assign wire19 = {(wire3 ? wire17[(5'h10):(4'hd)] : wire16[(4'hd):(3'h6)])};
  assign wire20 = (~&$signed(wire3[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg21 <= $signed(({((+reg11) - $unsigned((8'h9d)))} ?
          $unsigned((~^wire7)) : {reg13,
              ($unsigned(wire8) ? $unsigned(wire2) : $unsigned((8'hb4)))}));
    end
  assign wire22 = wire10;
  assign wire23 = wire2[(3'h5):(1'h1)];
  assign wire24 = $unsigned($unsigned((~^wire10[(2'h2):(2'h2)])));
  assign wire25 = $unsigned($unsigned(({$unsigned(wire23)} != $unsigned((wire19 ?
                      wire20 : wire23)))));
  assign wire26 = ($signed(wire17) <= ((($unsigned(wire10) ?
                              $signed((8'hb5)) : {wire22}) ?
                          ($signed((8'hbc)) == (wire8 ^ wire20)) : $unsigned($signed(wire7))) ?
                      wire9[(2'h3):(1'h1)] : ((~&(~&wire7)) ?
                          (wire19 && wire17[(5'h13):(3'h5)]) : $unsigned(wire5[(3'h6):(2'h2)]))));
  assign wire27 = reg11;
endmodule
