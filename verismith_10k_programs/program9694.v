module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire18;
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire18,
                 reg21,
                 reg20,
                 (1'h0)};
  module4 #() modinst19 (.wire5((8'hbd)), .y(wire18), .wire6(wire0), .wire7(wire1), .wire8(wire2), .wire9(wire3), .clk(clk));
  always
    @(posedge clk) begin
      reg20 <= $signed($signed(wire0));
    end
  always
    @(posedge clk) begin
      reg21 <= $unsigned((-$signed(((&reg20) ?
          (wire3 <<< wire1) : $unsigned(wire18)))));
    end
  assign wire22 = (~^wire2);
  assign wire23 = (wire1[(3'h6):(3'h6)] ?
                      ($unsigned(reg20) >>> wire1[(3'h5):(1'h1)]) : wire3[(4'ha):(2'h3)]);
  assign wire24 = (wire18[(3'h4):(1'h1)] ?
                      {{((^~reg20) != (wire0 ? wire1 : reg21)),
                              ((^~reg20) & $unsigned(wire2))}} : $unsigned((((-(8'hab)) >> $unsigned(wire18)) ~^ $unsigned({wire1}))));
  assign wire25 = $unsigned($unsigned((~|({(8'ha5)} ?
                      (wire23 <= reg21) : (~(8'hac))))));
  assign wire26 = ({wire3[(1'h0):(1'h0)]} >= (wire1 > (^((~|(8'ha7)) ?
                      (-(8'h9e)) : wire22))));
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 (1'h0)};
  assign wire10 = (wire5[(4'ha):(2'h2)] ? wire5 : wire7);
  assign wire11 = (wire10[(1'h0):(1'h0)] ?
                      {wire8[(3'h6):(3'h5)],
                          (((wire9 >= wire7) || $signed(wire6)) ?
                              $unsigned({(7'h44)}) : $unsigned(wire9))} : (7'h42));
  assign wire12 = $unsigned({($signed($unsigned(wire6)) ?
                          $unsigned((wire9 ?
                              wire10 : wire9)) : $signed($unsigned(wire6))),
                      $signed({(wire9 ? wire10 : wire8),
                          wire6[(3'h4):(2'h3)]})});
  assign wire13 = $unsigned({$signed(wire8),
                      ({wire5[(4'he):(3'h5)]} ?
                          $unsigned({wire9}) : (-(wire8 ? wire6 : wire9)))});
  assign wire14 = ($signed({(wire7 < (wire12 ?
                          wire11 : wire12))}) ^ ($signed({(!wire11),
                          (+wire9)}) ?
                      wire9 : (((wire8 ? wire13 : wire11) ?
                          {wire13, wire11} : wire6) == (((7'h43) != wire6) ?
                          (~|wire8) : wire8))));
  assign wire15 = (-(~^$unsigned(((^~wire7) ^~ $unsigned(wire7)))));
  assign wire16 = $signed({wire11});
  assign wire17 = wire16[(2'h2):(1'h1)];
endmodule
