module top
#(parameter param25 = ((((((8'haf) >> (7'h44)) ? {(8'hbf)} : ((8'hb1) * (8'hb7))) ? (((8'hae) * (8'hb7)) ? {(8'ha6)} : {(7'h43)}) : (((8'h9c) ? (7'h42) : (7'h43)) ? (-(8'hae)) : ((8'hae) ? (7'h43) : (8'hae)))) == {{(~|(8'ha5))}}) ? (~&{((^~(8'ha4)) && (8'hb2)), ((8'hab) ? ((8'haa) * (7'h43)) : (~|(8'ha9)))}) : (-(((~&(8'hbd)) * (&(8'hae))) ? ((^~(8'hae)) ? ((8'haf) ? (8'ha0) : (8'ha5)) : {(7'h40)}) : (+(^~(8'hae)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  assign y = {wire24,
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
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = (8'haf);
  assign wire5 = (+$unsigned(wire0));
  assign wire6 = $unsigned(wire0[(1'h1):(1'h1)]);
  assign wire7 = wire1[(3'h6):(3'h6)];
  assign wire8 = $unsigned((+(8'h9f)));
  assign wire9 = {$unsigned(wire6)};
  always
    @(posedge clk) begin
      reg10 <= ($unsigned(((8'haa) ? {$signed((8'hae))} : wire6)) ?
          wire7[(1'h0):(1'h0)] : wire7);
      reg11 <= {wire4,
          $signed((~|($unsigned(wire5) ? {wire4} : $signed(reg10))))};
      reg12 <= $unsigned((~wire8));
      reg13 <= reg11[(5'h13):(5'h12)];
    end
  assign wire14 = wire7[(2'h3):(2'h2)];
  assign wire15 = $unsigned($unsigned(wire5));
  assign wire16 = $signed(wire7);
  assign wire17 = reg10;
  assign wire18 = (((|wire9) ?
                      ($unsigned({wire1, reg12}) ?
                          {(wire15 ^ (8'hac))} : wire6[(4'hf):(4'h9)]) : $signed($unsigned($unsigned(wire16)))) >> (|{(8'ha1)}));
  assign wire19 = $unsigned(wire15);
  assign wire20 = $signed((wire2[(1'h1):(1'h1)] ?
                      ({wire3[(1'h1):(1'h1)], wire2[(2'h2):(1'h0)]} ?
                          (reg12 ?
                              $signed(wire17) : $unsigned(reg10)) : $unsigned((~^wire4))) : $unsigned({((8'hbc) ?
                              wire3 : (8'hb4)),
                          (|wire1)})));
  assign wire21 = ((wire16 < (|{wire20,
                      ((8'hb1) == wire6)})) < ($unsigned(wire17[(2'h2):(2'h2)]) >>> $signed(wire20[(3'h4):(2'h2)])));
  assign wire22 = ((wire18[(4'he):(1'h1)] | (+wire3[(3'h5):(1'h0)])) ?
                      ({$signed((~^wire7))} ?
                          (~^(wire2 >= $unsigned(wire15))) : (((-wire20) ?
                              wire5[(3'h4):(1'h0)] : $signed(wire8)) & wire7)) : (($unsigned($unsigned(wire9)) ?
                              $signed((wire1 ?
                                  wire0 : wire9)) : $signed(reg13[(4'h9):(1'h1)])) ?
                          wire14[(2'h3):(1'h0)] : $signed(($unsigned(wire8) >> $unsigned(wire1)))));
  assign wire23 = wire17[(1'h0):(1'h0)];
  assign wire24 = $signed(($signed({wire18[(4'hb):(3'h7)]}) - {(&$signed(wire19)),
                      (!(wire3 ? (8'hbd) : wire20))}));
endmodule
