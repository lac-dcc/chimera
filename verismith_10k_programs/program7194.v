module top
#(parameter param68 = ((((~&(~(8'ha9))) >>> {(-(8'h9d))}) == (({(8'haa)} ~^ ((8'h9c) & (8'ha6))) == ((+(8'hbb)) || (^(8'h9f))))) ? (~{{{(8'hb5), (8'ha6)}}}) : (8'hb5)), 
parameter param69 = (((8'hbc) ? (~{((8'hbf) ? param68 : param68), param68}) : (((param68 ? param68 : param68) != (param68 ^~ param68)) ? (&(^param68)) : (param68 ^~ (param68 ? param68 : (8'h9e))))) ? ({(7'h42)} ? {(|param68), (param68 ? (param68 ^ param68) : (|param68))} : (({param68} >>> (param68 ^~ param68)) ? param68 : param68)) : ((~((-(8'hbe)) ? (param68 ? param68 : param68) : param68)) ? ((8'hb1) ? ((param68 + param68) | (param68 ~^ param68)) : {(param68 << param68)}) : param68)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire60;
  assign y = {wire67, wire66, wire65, wire64, wire63, wire62, wire60, (1'h0)};
  module5 #() modinst61 (wire60, clk, wire0, wire2, wire4, wire3, wire1);
  assign wire62 = $signed(($unsigned($signed({(8'ha8), wire60})) ?
                      $unsigned($signed(wire3[(2'h2):(1'h1)])) : {wire2[(2'h3):(1'h1)],
                          wire3[(5'h12):(2'h2)]}));
  assign wire63 = (|$unsigned((((wire4 ? wire60 : wire4) ?
                      (wire0 + (8'hb4)) : $signed(wire62)) << wire60[(4'h9):(1'h0)])));
  assign wire64 = (~|wire4[(4'hc):(4'hb)]);
  assign wire65 = (+({($unsigned(wire4) ? (~&(8'hb9)) : $signed(wire1))} ?
                      $signed(wire1) : $unsigned((wire63 * (wire62 >> wire63)))));
  assign wire66 = $signed(wire63);
  assign wire67 = $unsigned(wire3[(5'h12):(3'h5)]);
endmodule

module module5
#(parameter param59 = ((!((!((8'ha8) ? (8'h9e) : (8'hb1))) ? ((8'hb6) + ((8'ha3) ^~ (8'hb1))) : (((8'ha7) ? (8'ha5) : (8'hbc)) <<< {(8'ha4), (8'hb1)}))) > (!(((^~(8'had)) ? (&(8'ha1)) : ((8'h9c) * (8'h9d))) ? (((8'ha7) ? (8'h9e) : (8'haf)) ? (^(8'ha4)) : {(8'ha9)}) : (((8'haa) - (8'h9f)) - ((8'hbd) << (8'ha2)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire11;
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  assign y = {wire51,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire11,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire11 = (-((8'had) ?
                      ((!((8'ha8) ? wire6 : wire10)) & $signed({wire6,
                          wire10})) : (!wire10[(3'h4):(1'h0)])));
  module12 #() modinst28 (wire27, clk, wire10, wire9, wire6, wire11);
  assign wire29 = ((~^(8'had)) ? $unsigned(wire7) : wire7);
  assign wire30 = (~^wire27);
  assign wire31 = wire11;
  module32 #() modinst52 (.wire35(wire31), .y(wire51), .wire33(wire27), .wire36(wire9), .clk(clk), .wire34(wire29));
  always
    @(posedge clk) begin
      reg53 <= (^((wire8[(3'h4):(1'h1)] ?
          $unsigned($unsigned(wire8)) : (|(wire11 ?
              wire51 : wire30))) ~^ ($signed($signed(wire31)) ?
          wire51 : (|(|wire27)))));
      reg54 <= (~&(~&{{{wire30}, (wire27 ~^ wire27)}, wire9[(5'h10):(5'h10)]}));
      if (wire8)
        begin
          reg55 <= (8'hb9);
        end
      else
        begin
          if (wire27[(4'hd):(2'h3)])
            begin
              reg55 <= ({(^wire29[(4'h9):(3'h6)]), {{wire30[(2'h3):(1'h1)]}}} ?
                  $unsigned((~&{(8'haa), (wire7 ? reg55 : wire31)})) : wire30);
              reg56 <= ((({$unsigned(wire11),
                      (^~wire27)} == wire29[(3'h6):(1'h1)]) ^ wire11) ?
                  $signed(wire51) : {wire30});
              reg57 <= (((&reg54[(2'h3):(2'h3)]) >= ({$unsigned(wire7),
                      (!wire51)} ?
                  $unsigned(reg53[(5'h13):(5'h12)]) : ((wire7 ?
                          wire51 : wire51) ?
                      (8'haf) : (wire11 & wire11)))) & ($unsigned($signed(wire9)) == ($unsigned((reg54 >> wire27)) ?
                  (^(!reg53)) : (~reg53))));
            end
          else
            begin
              reg55 <= $unsigned($signed($signed({(wire29 ? wire27 : (8'ha2)),
                  wire8})));
              reg56 <= (&wire6);
              reg57 <= (~^{wire9,
                  (($signed(wire11) ? (~^reg54) : (!wire27)) ?
                      (wire9[(5'h11):(4'hf)] ?
                          $signed(reg55) : $signed((8'hb3))) : $signed($signed(wire6)))});
            end
          reg58 <= wire29[(3'h6):(2'h2)];
        end
    end
endmodule

module module32
#(parameter param50 = ((((~^(~^(8'ha8))) ? (-((8'hb3) ? (8'ha0) : (8'ha1))) : ((~^(8'ha5)) ? (!(8'hb4)) : ((8'ha3) <= (7'h43)))) ? (({(8'ha7), (7'h44)} ~^ (^(7'h43))) ? (|(8'ha6)) : {((8'ha1) > (8'hb4))}) : (((^(8'h9f)) * ((7'h42) ? (8'hbc) : (8'ha7))) >>> (+{(7'h42), (8'hb3)}))) ~^ (!((((8'hb5) ~^ (8'hb3)) <<< {(8'hbe)}) << ({(8'hb1)} ? (~(8'hb7)) : (~(8'hbc)))))))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire36;
  input wire signed [(2'h2):(1'h0)] wire35;
  input wire signed [(4'hb):(1'h0)] wire34;
  input wire [(4'hd):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire37;
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire37,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire37 = ((wire33[(4'hb):(3'h5)] ^ (^~wire35)) << (((^~wire35[(2'h2):(2'h2)]) ?
                          wire33 : $unsigned($unsigned(wire33))) ?
                      wire33 : wire34));
  always
    @(posedge clk) begin
      reg38 <= $unsigned(wire37[(4'ha):(1'h1)]);
      reg39 <= ((reg38 << (~|(wire33 ?
              (wire37 <<< wire33) : (wire35 >> wire36)))) ?
          $unsigned(wire34[(4'ha):(2'h3)]) : (~^wire35));
    end
  assign wire40 = (wire33 ?
                      reg38[(4'ha):(4'ha)] : {$signed(({wire33} >= (wire33 ?
                              wire37 : (8'ha0)))),
                          $signed($signed($signed(wire34)))});
  assign wire41 = (^wire37[(3'h6):(3'h6)]);
  assign wire42 = wire41[(2'h2):(2'h2)];
  assign wire43 = wire42;
  assign wire44 = ({wire35[(2'h2):(2'h2)], $signed((+(wire36 >= wire34)))} ?
                      $signed($signed($signed(reg39))) : {(-(|(wire43 ?
                              wire36 : wire40)))});
  assign wire45 = (~|(wire41 != (wire36[(5'h11):(5'h11)] <<< reg39)));
  assign wire46 = (+$unsigned(wire35));
  assign wire47 = $unsigned(wire44);
  assign wire48 = wire37[(3'h7):(3'h6)];
  assign wire49 = (!(~|(-(8'hb3))));
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire16;
  input wire [(2'h3):(1'h0)] wire15;
  input wire signed [(4'hd):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire17;
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire17 = ((^((~wire15) ?
                      wire14 : $signed($signed(wire15)))) >= (wire14 ?
                      ((8'hb4) <<< {wire13[(3'h7):(3'h5)],
                          (wire14 & wire16)}) : wire14[(4'hb):(2'h2)]));
  assign wire18 = wire15[(2'h3):(1'h1)];
  assign wire19 = (^~$unsigned((|wire17[(2'h2):(2'h2)])));
  assign wire20 = $unsigned($unsigned((({wire16} ?
                      (wire16 ? wire18 : wire15) : wire16) ~^ wire18)));
  assign wire21 = $signed($unsigned(((((8'hb7) ? wire13 : wire20) ?
                          {wire20} : $unsigned((7'h40))) ?
                      (~&(wire18 || wire15)) : $unsigned($unsigned(wire14)))));
  always
    @(posedge clk) begin
      reg22 <= {{$signed($unsigned($signed(wire20))),
              (~&(-$unsigned(wire16)))}};
      reg23 <= wire16[(1'h0):(1'h0)];
    end
  assign wire24 = wire21;
  assign wire25 = ($signed($unsigned(($unsigned(wire18) < (~&wire21)))) ?
                      wire18 : $unsigned($unsigned(((^~wire17) <<< reg22[(2'h3):(1'h0)]))));
  assign wire26 = (reg22[(1'h0):(1'h0)] ^~ $unsigned(wire16));
endmodule
