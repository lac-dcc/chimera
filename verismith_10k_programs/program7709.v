module top
#(parameter param84 = ({(({(8'h9c), (8'ha8)} < {(8'hbd)}) ^ {((8'ha4) ? (8'ha7) : (8'ha3))}), (^{{(8'ha7)}})} >> (((-(&(8'ha1))) ? ((8'hbf) ~^ ((8'ha6) > (8'hb8))) : (~&((8'ha3) != (8'h9d)))) ? (((^~(8'ha5)) && ((8'ha1) || (8'ha1))) ^~ (((8'h9f) ? (8'hb0) : (8'had)) >> ((8'hbd) | (8'hbd)))) : ((~&((8'hbc) ? (8'ha9) : (7'h42))) <= (8'h9f)))), 
parameter param85 = (({{(param84 || param84)}, ((+param84) ? (param84 && (8'hb0)) : (param84 & (8'hb1)))} ? (^~param84) : (((+param84) != {param84}) ? param84 : (~(param84 ^ param84)))) ? ((~^param84) ? {{{param84}, (8'hb3)}} : param84) : {param84}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire83;
  wire [(5'h12):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire79;
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  assign y = {wire83, wire82, wire79, reg81, (1'h0)};
  module4 #() modinst80 (.y(wire79), .clk(clk), .wire6(wire0), .wire5(wire3), .wire7(wire1), .wire8(wire2));
  always
    @(posedge clk) begin
      reg81 <= wire1;
    end
  assign wire82 = ($signed(((wire2[(4'hf):(3'h4)] ?
                      wire1 : $unsigned(reg81)) <<< (~{wire0,
                      wire3}))) & ((wire3[(4'h9):(3'h4)] & {wire2}) ?
                      wire3 : wire3[(1'h0):(1'h0)]));
  assign wire83 = (~&(~$unsigned($unsigned((wire3 ~^ wire2)))));
endmodule

module module4
#(parameter param78 = (~((8'ha8) ? (!(~^(~^(8'ha5)))) : {(8'hac), (((8'ha9) ? (8'ha7) : (8'hac)) ? (&(8'had)) : (&(8'ha7)))})))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire5;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire27;
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire74,
                 wire36,
                 wire35,
                 wire32,
                 wire31,
                 wire9,
                 wire27,
                 reg34,
                 reg33,
                 reg30,
                 reg29,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire9 = $signed(({$signed((wire5 >> wire5)), wire8} ?
                     wire8 : (^~{wire8})));
  always
    @(posedge clk) begin
      reg10 <= $unsigned(wire6[(3'h5):(3'h5)]);
      reg11 <= (((-$unsigned($unsigned(wire7))) + $unsigned((8'hba))) && (8'h9d));
    end
  module12 #() modinst28 (wire27, clk, wire7, wire6, wire8, wire9, wire5);
  always
    @(posedge clk) begin
      reg29 <= (reg11 ^ wire27[(5'h11):(3'h4)]);
      reg30 <= (!(^~(reg11[(3'h6):(3'h5)] ?
          (~{wire8}) : ($unsigned(reg10) | (~&reg10)))));
    end
  assign wire31 = {(wire27[(5'h14):(4'hf)] >> {((~|reg30) | (reg30 + wire9)),
                          reg30}),
                      (7'h40)};
  assign wire32 = ((((reg10 ? (~^reg10) : reg29) ?
                          {(&reg30), $unsigned(wire8)} : $signed((8'hbe))) ?
                      {$unsigned(wire31[(3'h4):(2'h2)]),
                          (+(wire5 ? wire31 : wire6))} : ({(reg29 & reg11)} ?
                          ((reg11 >>> reg11) >>> $signed(wire9)) : $signed($unsigned((8'ha9))))) + reg11[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg33 <= $signed(wire5[(3'h5):(2'h2)]);
      reg34 <= $signed(reg33[(3'h4):(3'h4)]);
    end
  assign wire35 = $signed((wire32[(1'h0):(1'h0)] <= wire7));
  assign wire36 = $signed((-((+(wire31 ?
                      wire35 : reg10)) & wire27[(3'h7):(2'h3)])));
  module37 #() modinst75 (wire74, clk, reg34, reg11, wire32, wire36);
  assign wire76 = {$unsigned($unsigned($signed($unsigned(wire74)))), wire27};
  assign wire77 = reg33;
endmodule

module module37
#(parameter param73 = {({(8'haa)} <<< ({((8'haf) ? (8'hbe) : (8'hb9))} ? ((7'h42) ? ((8'ha3) ? (8'hb7) : (8'ha2)) : (~|(8'hae))) : (^(~&(8'hb0)))))})
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire41;
  input wire [(4'he):(1'h0)] wire40;
  input wire signed [(4'h9):(1'h0)] wire39;
  input wire signed [(4'he):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(3'h5):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  assign y = {wire72,
                 wire66,
                 wire65,
                 wire64,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire51,
                 wire50,
                 wire49,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg63,
                 reg62,
                 reg61,
                 reg53,
                 reg52,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire42 = $signed($signed({(((8'ha7) == wire40) ^~ (wire41 ?
                          wire39 : wire38)),
                      $signed(wire40)}));
  assign wire43 = $signed($signed(($unsigned((!wire39)) ?
                      $signed(wire39) : $unsigned($unsigned(wire38)))));
  assign wire44 = wire39[(3'h4):(2'h2)];
  assign wire45 = wire42[(4'hd):(2'h2)];
  assign wire46 = $signed(($signed(($signed(wire45) >> wire43[(2'h3):(1'h0)])) ?
                      (^(~&(wire40 ?
                          wire42 : (8'hb8)))) : (wire45[(4'ha):(2'h3)] >> wire39[(4'h9):(2'h3)])));
  always
    @(posedge clk) begin
      reg47 <= $unsigned(wire42);
      reg48 <= wire40[(2'h3):(1'h1)];
    end
  assign wire49 = wire38[(2'h2):(1'h0)];
  assign wire50 = ((^~(-wire42)) <<< (wire43 != reg47));
  assign wire51 = (~wire45[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      reg52 <= wire41;
      reg53 <= $signed($signed($signed($signed((~|wire45)))));
    end
  assign wire54 = ((wire45[(1'h1):(1'h1)] ?
                          (~|$unsigned(((8'h9e) ^ reg48))) : (^reg53)) ?
                      (wire46[(1'h0):(1'h0)] ?
                          ({(^~reg53), wire51[(4'hc):(3'h5)]} - ((wire40 ?
                              (8'hb2) : wire40) != ((8'hb1) >= (8'hb5)))) : $unsigned($signed($signed(wire44)))) : $unsigned((-(~&(wire38 || reg52)))));
  assign wire55 = wire45[(4'ha):(3'h7)];
  assign wire56 = wire45[(3'h4):(2'h2)];
  assign wire57 = reg47;
  assign wire58 = {wire56};
  assign wire59 = ((((reg52 || (reg48 ?
                          wire39 : (8'ha0))) - $unsigned((8'ha7))) - ($signed($unsigned(reg47)) << (~&{wire40}))) ?
                      wire56[(2'h2):(1'h1)] : wire45);
  assign wire60 = wire42;
  always
    @(posedge clk) begin
      reg61 <= $signed($unsigned(wire60[(4'hd):(3'h5)]));
      reg62 <= ($unsigned(reg52) ?
          wire39 : $unsigned((wire49 ?
              $unsigned((~&wire43)) : $signed($unsigned(wire59)))));
      reg63 <= $signed(wire43);
    end
  assign wire64 = wire41;
  assign wire65 = $unsigned(($signed({$unsigned(wire42),
                      ((7'h41) >> wire57)}) << {$signed(wire56[(3'h7):(2'h3)])}));
  assign wire66 = (($signed((8'hb5)) ?
                      $signed(wire46) : (8'hbe)) | (-$unsigned($unsigned({wire60,
                      wire56}))));
  always
    @(posedge clk) begin
      reg67 <= wire49[(4'h9):(3'h4)];
      reg68 <= ((((+(wire56 ? reg47 : wire60)) ?
              ((wire60 ?
                  wire40 : wire56) ^~ wire43[(3'h7):(2'h3)]) : $unsigned((wire50 ~^ wire46))) || wire65[(3'h6):(3'h4)]) ?
          wire39[(3'h6):(2'h3)] : (reg61 ?
              wire51[(4'hf):(3'h7)] : ($unsigned(((8'hac) != reg52)) ?
                  wire39 : (&$unsigned(wire65)))));
      reg69 <= (&{wire50, ({(~^wire43)} >> {wire38, wire51[(1'h0):(1'h0)]})});
      reg70 <= (^~$signed(wire66[(4'h8):(1'h1)]));
      reg71 <= $unsigned($unsigned($unsigned((wire42 ? (!wire64) : (!reg69)))));
    end
  assign wire72 = wire39[(3'h5):(3'h5)];
endmodule

module module12
#(parameter param26 = {{(-(^((8'hbd) ? (8'hbc) : (8'hb7))))}, (((((8'h9e) ? (8'ha6) : (8'hb5)) && ((8'h9f) + (8'hb9))) ? ({(8'hbd)} ? (~(8'hba)) : (^(7'h42))) : (~{(8'hac), (8'hb7)})) ? {((~|(7'h43)) >= (^(8'hae))), (((8'hb4) ? (8'ha7) : (8'hb0)) - ((7'h44) ? (8'h9c) : (8'hb4)))} : (7'h44))})
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire [(4'ha):(1'h0)] wire15;
  input wire signed [(4'hc):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 (1'h0)};
  assign wire18 = wire16[(3'h7):(3'h5)];
  assign wire19 = wire17[(4'hb):(1'h1)];
  assign wire20 = ((8'ha7) * wire17);
  assign wire21 = $signed($signed((wire17 || $signed((wire18 != wire16)))));
  assign wire22 = (((wire20[(1'h0):(1'h0)] ^~ $unsigned((^wire17))) ?
                      $signed(((wire20 + (7'h43)) ?
                          (wire19 < wire14) : $signed(wire13))) : wire15[(1'h0):(1'h0)]) == (wire16[(3'h6):(2'h2)] ?
                      (^$signed($signed(wire13))) : (wire15 != (~&(wire16 ?
                          wire16 : wire15)))));
  assign wire23 = ($unsigned((wire18[(4'hc):(1'h0)] ?
                      wire22[(2'h2):(2'h2)] : (wire20[(2'h2):(2'h2)] ?
                          (wire22 ?
                              wire21 : wire16) : wire21))) == (($unsigned(wire21[(2'h2):(2'h2)]) ?
                          wire13 : $unsigned({wire18})) ?
                      wire15 : (+$signed($signed(wire18)))));
  assign wire24 = $signed($unsigned((8'h9e)));
  assign wire25 = wire22[(1'h0):(1'h0)];
endmodule
