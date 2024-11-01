module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire23;
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire37,
                 wire23,
                 reg48,
                 reg47,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  module4 #() modinst24 (wire23, clk, wire1, wire3, wire0, wire2);
  module25 #() modinst38 (wire37, clk, wire0, wire2, wire1, wire23);
  always
    @(posedge clk) begin
      reg39 <= (8'ha2);
      reg40 <= $unsigned(wire23[(3'h4):(3'h4)]);
      reg41 <= wire37;
    end
  assign wire42 = (-$signed(wire2));
  assign wire43 = (reg39 ?
                      $signed((^~$signed((wire0 ^ wire1)))) : $unsigned($signed((((8'h9f) >> wire2) ?
                          $unsigned(wire0) : (wire23 >>> (8'ha5))))));
  assign wire44 = ($unsigned(($unsigned((~^reg41)) <= $unsigned($signed(wire42)))) <<< $unsigned($unsigned($unsigned((reg39 - reg39)))));
  assign wire45 = $unsigned(((+wire0[(5'h10):(1'h0)]) ~^ wire42));
  assign wire46 = $unsigned(($unsigned(reg39[(3'h4):(2'h3)]) ?
                      {$unsigned((wire37 ? wire43 : reg41)),
                          (wire2 ?
                              $signed(wire45) : $signed(reg39))} : $unsigned(wire37)));
  always
    @(posedge clk) begin
      reg47 <= wire45;
      reg48 <= wire43;
    end
  assign wire49 = {($unsigned({(~wire45),
                          (wire0 ? wire37 : wire2)}) <<< $signed((8'hb9)))};
  assign wire50 = $unsigned($unsigned($signed($unsigned($signed(wire43)))));
  assign wire51 = {$unsigned(wire49[(3'h4):(1'h0)])};
endmodule

module module25
#(parameter param35 = ((!(((^(8'hb8)) ? ((8'had) >= (8'hb4)) : (^(8'haa))) - ((~(8'hbd)) ? {(8'hb0)} : {(8'ha1), (7'h40)}))) ? {(7'h44)} : ((8'hba) == (^(8'ha6)))), 
parameter param36 = (~((-param35) | ((+(param35 < param35)) >>> param35))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire29;
  input wire signed [(4'hb):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  assign y = {wire34, wire33, wire32, wire31, wire30, (1'h0)};
  assign wire30 = ({{((wire26 <<< wire28) ? {wire26} : (~wire28)),
                          ({wire26, wire27} << (wire26 << wire27))},
                      ($signed($unsigned(wire27)) ?
                          {(~^wire26)} : $signed({wire27,
                              wire28}))} >>> (wire28[(4'ha):(4'h9)] ?
                      wire28[(1'h1):(1'h0)] : (~&({wire27, wire28} ?
                          {wire28, wire28} : (!wire27)))));
  assign wire31 = ({wire26[(2'h3):(1'h1)]} ?
                      {(-$signed(wire26)),
                          wire27[(2'h3):(1'h0)]} : $unsigned($unsigned(wire27)));
  assign wire32 = $signed(wire27[(2'h2):(1'h1)]);
  assign wire33 = wire31;
  assign wire34 = $unsigned($unsigned({(wire32[(4'h9):(2'h2)] == wire31[(4'ha):(3'h6)])}));
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(2'h2):(1'h0)] wire7;
  input wire signed [(3'h5):(1'h0)] wire6;
  input wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire11,
                 wire10,
                 wire9,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg12,
                 (1'h0)};
  assign wire9 = wire8;
  assign wire10 = (wire7 ?
                      (&($signed((wire8 ? wire6 : wire8)) <<< (wire5 >= (wire7 ?
                          wire6 : wire9)))) : wire9[(5'h10):(4'hf)]);
  assign wire11 = wire5[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg12 <= (~&$unsigned((!{wire5[(3'h5):(1'h1)]})));
    end
  assign wire13 = $unsigned(wire11[(3'h4):(1'h0)]);
  assign wire14 = wire5[(2'h2):(1'h0)];
  assign wire15 = $unsigned((~&$signed(wire9)));
  assign wire16 = $unsigned(((wire7 ?
                          $unsigned({(8'hb7)}) : (!(wire13 ? wire9 : wire6))) ?
                      (wire14 - ((wire10 == (8'ha9)) ?
                          wire10[(3'h6):(1'h1)] : {wire14,
                              wire10})) : (!wire7[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg17 <= (~|wire7[(2'h2):(1'h0)]);
      reg18 <= ((+(^~wire10[(4'hc):(3'h6)])) == (^~(~|$unsigned($signed((8'hac))))));
      reg19 <= $unsigned(wire15);
      reg20 <= (((7'h43) ?
          {{$signed(wire9),
                  wire5[(1'h1):(1'h1)]}} : $unsigned(wire16)) == $signed(($signed({(8'ha0),
              (8'hab)}) ?
          $unsigned($unsigned((7'h44))) : reg19)));
    end
  assign wire21 = (~{(~$unsigned((8'hbc)))});
  assign wire22 = reg20[(1'h0):(1'h0)];
endmodule
