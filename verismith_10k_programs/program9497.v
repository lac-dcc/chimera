module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire80;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire83,
                 wire82,
                 wire80,
                 wire7,
                 wire6,
                 wire5,
                 reg84,
                 reg8,
                 reg9,
                 reg10,
                 (1'h0)};
  assign wire5 = (~|((({wire1, wire2} ?
                     (-wire1) : ((8'hb0) ? wire4 : wire0)) && ($signed(wire2) ?
                     $unsigned(wire2) : $unsigned(wire0))) >>> wire3));
  assign wire6 = (~&{(&$unsigned((wire0 & wire1)))});
  assign wire7 = (~$signed($unsigned(((~|wire4) > wire3[(4'h9):(2'h3)]))));
  always
    @(posedge clk) begin
      reg8 <= ((+{wire3[(3'h6):(3'h5)]}) <= wire6);
      reg9 <= (!((|wire2[(4'h9):(3'h5)]) <<< (~reg8[(1'h1):(1'h1)])));
      reg10 <= {$unsigned($signed((~$signed(reg8)))),
          ((!{reg8}) >> (wire2[(3'h5):(1'h0)] < ($signed(reg9) ?
              (&wire4) : wire4)))};
    end
  module11 #() modinst81 (.wire14(wire0), .wire15(wire6), .wire13(reg10), .wire16(wire1), .wire12(wire3), .y(wire80), .clk(clk));
  assign wire82 = ($unsigned({wire4[(1'h0):(1'h0)], wire1}) ?
                      {(wire1[(5'h10):(1'h1)] ?
                              wire4 : (+(wire1 ?
                                  reg10 : wire80)))} : $signed(wire3));
  assign wire83 = wire4[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg84 <= $signed(wire2);
    end
  assign wire85 = $signed(($unsigned(wire0[(4'hb):(4'hb)]) ?
                      $signed($signed({wire1, reg8})) : wire0[(3'h7):(3'h4)]));
  assign wire86 = (8'ha9);
endmodule

module module11
#(parameter param79 = {({(8'h9d), (((8'h9f) + (8'had)) && ((7'h43) ^ (8'hbe)))} ^ ((((8'hbb) >>> (8'h9c)) ? (&(8'hb2)) : (^(8'ha6))) ? ({(8'hb5)} == ((8'ha1) << (8'hbe))) : (((8'ha7) ? (8'ha8) : (8'hbb)) ? ((8'hbf) << (8'hb6)) : {(8'haa), (8'h9c)})))})
(y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire15;
  input wire signed [(4'ha):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire75;
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire17,
                 wire18,
                 wire19,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire75,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire17 = $signed($signed($unsigned(wire16)));
  assign wire18 = $signed((($signed($unsigned(wire16)) >> {wire17,
                      (7'h43)}) >= $signed(((~(8'ha6)) >>> (wire13 ?
                      wire12 : wire16)))));
  assign wire19 = $unsigned((wire15[(1'h1):(1'h1)] != $signed($unsigned(wire13[(4'hf):(4'hd)]))));
  always
    @(posedge clk) begin
      reg20 <= wire19[(1'h0):(1'h0)];
      if ($signed($unsigned(($unsigned($signed(wire19)) ?
          {wire14[(4'hc):(1'h1)]} : wire19))))
        begin
          reg21 <= $signed(((&(wire16 & $signed(reg20))) ?
              wire18 : ($signed(wire16[(1'h1):(1'h1)]) >> $signed(wire15))));
          reg22 <= $unsigned(($unsigned(($signed(reg21) || wire16)) ?
              $signed($unsigned($unsigned(wire13))) : wire16[(3'h5):(2'h3)]));
        end
      else
        begin
          reg21 <= $signed($signed({reg22,
              $unsigned((wire13 ? wire17 : wire19))}));
          reg22 <= ($unsigned(reg22[(1'h1):(1'h0)]) || $unsigned(reg22[(1'h1):(1'h0)]));
          reg23 <= $signed($signed((~|reg20[(4'h9):(2'h2)])));
        end
      reg24 <= (((~&reg20) ~^ (($unsigned(wire16) ?
              wire18 : (wire16 ? wire19 : wire14)) ?
          wire15 : (wire13 > reg23[(4'he):(4'he)]))) > ((($signed(wire17) <= $signed(wire14)) ?
          (^~$unsigned(reg20)) : (((8'ha4) ~^ reg20) ?
              $signed(wire12) : $signed(wire17))) << reg21));
      reg25 <= ($signed($signed(wire18)) ?
          {wire19[(2'h3):(1'h1)]} : $signed({wire15}));
      reg26 <= (~((($signed(wire15) & wire17) + reg22[(2'h2):(2'h2)]) && (-((8'ha4) ?
          $signed(reg25) : {wire12, wire12}))));
    end
  assign wire27 = $signed(wire19[(1'h0):(1'h0)]);
  assign wire28 = {($unsigned(wire17) == reg22[(1'h1):(1'h1)]),
                      $unsigned(((+$unsigned(reg24)) ? reg26 : reg26))};
  assign wire29 = ((($unsigned(((8'hac) & wire19)) - reg25) ?
                      wire17[(3'h5):(3'h4)] : $signed(reg20)) >>> ((~&($signed(wire13) <= wire27)) >= $unsigned($unsigned($unsigned((8'hb7))))));
  assign wire30 = wire15;
  module31 #() modinst76 (.clk(clk), .wire33(wire16), .wire34(wire19), .y(wire75), .wire32(reg22), .wire35(wire27), .wire36(reg26));
  assign wire77 = reg23[(4'hd):(3'h7)];
  assign wire78 = (~&({$signed((wire13 > wire15)),
                      (((8'hbf) ?
                          wire28 : reg24) << ((8'ha3) != wire13))} * ($unsigned((~&wire75)) >>> {(8'hb9)})));
endmodule

module module31
#(parameter param73 = ((!{((&(8'ha1)) && {(8'hbf), (8'ha5)}), ({(8'ha8)} ? ((8'hb1) ? (8'hb3) : (8'hb1)) : {(7'h40)})}) == (^~{(((8'hba) ? (8'hb7) : (8'hab)) ~^ (8'hac)), (((8'h9f) << (8'ha6)) ? {(8'hb2)} : {(8'h9d), (7'h41)})})), 
parameter param74 = param73)
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire36;
  input wire [(4'hf):(1'h0)] wire35;
  input wire [(4'h8):(1'h0)] wire34;
  input wire [(2'h2):(1'h0)] wire33;
  input wire signed [(5'h14):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire37 = $unsigned(($signed(($unsigned(wire36) ?
                          $unsigned(wire35) : wire36[(2'h3):(2'h3)])) ?
                      (8'h9c) : wire35[(3'h7):(1'h1)]));
  assign wire38 = wire35[(1'h1):(1'h0)];
  assign wire39 = wire34;
  assign wire40 = {(!((wire36 ? wire37 : $signed(wire35)) >= {(+wire35)}))};
  assign wire41 = $unsigned($signed({wire34, $unsigned((wire33 ~^ wire37))}));
  assign wire42 = $unsigned({$unsigned($signed({wire38}))});
  assign wire43 = (wire36 - $unsigned({wire34}));
  assign wire44 = $signed(wire39);
  assign wire45 = $signed($signed($signed(((wire34 ? wire35 : wire33) - {wire33,
                      wire42}))));
  assign wire46 = {$signed($signed($unsigned($signed(wire43))))};
  assign wire47 = (!((((wire46 >> wire43) || (wire40 * wire32)) ?
                      $unsigned((+wire46)) : $unsigned((wire32 ?
                          wire42 : wire43))) | (~{wire35[(2'h3):(2'h2)]})));
  assign wire48 = $signed(({wire42[(3'h5):(3'h5)]} ?
                      (((+wire44) << (wire37 ?
                          wire37 : wire35)) <<< $unsigned((wire47 * wire38))) : {wire37[(3'h6):(1'h0)]}));
  assign wire49 = $signed((wire35[(4'hb):(1'h1)] & $unsigned($unsigned((wire44 & wire42)))));
  assign wire50 = wire47;
  assign wire51 = wire34;
  assign wire52 = {{($unsigned($signed(wire39)) ?
                              (8'hb0) : ((~|wire40) ?
                                  wire38 : wire51[(1'h0):(1'h0)]))},
                      wire50[(4'ha):(4'h8)]};
  assign wire53 = wire38;
  always
    @(posedge clk) begin
      reg54 <= (wire34 || ((!(wire45 ?
          ((8'haf) ? wire38 : wire33) : {wire37,
              wire46})) <<< $signed($signed(wire40))));
      reg55 <= ((wire39[(1'h0):(1'h0)] >= wire38[(5'h10):(3'h6)]) | ((^wire47) ?
          ({(wire35 + wire47), (+wire53)} >= {(wire34 ?
                  wire42 : wire49)}) : $signed(reg54[(4'hb):(3'h5)])));
      if ($signed(wire36))
        begin
          if (wire47[(5'h10):(2'h3)])
            begin
              reg56 <= (wire41[(2'h2):(2'h2)] ?
                  (wire32[(2'h2):(1'h0)] ^ wire32) : (8'ha5));
              reg57 <= (8'hb0);
            end
          else
            begin
              reg56 <= $unsigned(reg55[(1'h0):(1'h0)]);
              reg57 <= ((($unsigned(((8'ha0) >> wire36)) >> wire53) ?
                      {$unsigned((wire49 ^ wire37))} : (~($signed(wire38) - wire32))) ?
                  (wire36[(1'h1):(1'h1)] * $unsigned(($unsigned(wire44) && reg57))) : ({$unsigned({wire46})} >= ($signed(((7'h41) && wire42)) ?
                      wire49[(2'h2):(1'h0)] : reg54)));
              reg58 <= wire46;
              reg59 <= ((+wire44) ^~ (($unsigned(reg54) ?
                      ((wire51 ?
                          wire37 : (8'ha3)) ~^ (wire53 > wire41)) : wire36[(3'h4):(2'h2)]) ?
                  (wire47 > ((reg56 > wire52) ?
                      wire36[(1'h1):(1'h0)] : (wire50 * wire42))) : ($signed((!reg56)) ?
                      wire46 : {(wire32 >>> wire33)})));
              reg60 <= (wire53[(5'h11):(1'h1)] ?
                  (8'ha3) : ($unsigned(wire39) || wire37));
            end
          if (wire34)
            begin
              reg61 <= wire52;
            end
          else
            begin
              reg61 <= $unsigned((~|wire33[(2'h2):(1'h1)]));
              reg62 <= $signed(wire34[(3'h4):(2'h3)]);
              reg63 <= (~|wire45[(1'h1):(1'h1)]);
              reg64 <= {(($unsigned((wire52 & reg59)) ?
                          (wire46[(3'h6):(2'h2)] ?
                              (7'h42) : (wire32 ?
                                  reg54 : reg58)) : ((^~reg54) | (wire32 * reg61))) ?
                      $unsigned(({wire34} >>> $unsigned(reg59))) : wire43[(1'h1):(1'h1)])};
              reg65 <= reg62;
            end
        end
      else
        begin
          reg56 <= wire35[(4'h8):(2'h3)];
          reg57 <= ($unsigned(($unsigned($unsigned(reg57)) ?
                  {(|wire50), (-wire43)} : (8'hb4))) ?
              $signed((8'hbe)) : (($signed(reg60) ~^ ($signed(wire45) == wire36)) ?
                  $signed($unsigned(wire50)) : (reg62[(3'h6):(3'h5)] ?
                      ((~&wire39) <= wire42) : ((reg59 * wire34) && wire45[(2'h2):(1'h1)]))));
          reg58 <= (^~wire50[(5'h13):(5'h12)]);
        end
      reg66 <= $unsigned((wire45[(2'h2):(1'h1)] ?
          reg58 : $unsigned(((~&(8'hab)) == {reg54, wire40}))));
      reg67 <= $signed(reg58);
    end
  assign wire68 = $unsigned({(wire51[(2'h2):(1'h1)] * (wire33 ?
                          (wire32 ? wire52 : reg56) : {(7'h44)}))});
  assign wire69 = (~^(~|{wire45[(1'h1):(1'h1)]}));
  assign wire70 = (7'h42);
  assign wire71 = (wire50[(4'ha):(2'h3)] & $signed(($unsigned(wire51[(3'h5):(3'h5)]) ?
                      (wire68[(1'h1):(1'h1)] << (~|reg62)) : {(~&wire43),
                          (|(8'hb6))})));
  assign wire72 = (8'ha8);
endmodule
