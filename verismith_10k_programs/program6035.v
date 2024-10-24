module top
#(parameter param82 = {((((^(8'had)) ? (&(7'h42)) : (~^(8'h9f))) ? (((8'ha4) ~^ (8'hbc)) == ((8'h9f) >> (8'hbc))) : (((8'ha7) <<< (7'h42)) >>> ((8'hb8) == (8'ha5)))) ? ((+((8'ha9) - (8'hb8))) ~^ (((8'hb1) * (8'hbb)) ? ((8'hab) ? (8'hba) : (8'hb4)) : ((8'hbd) & (8'hbf)))) : (8'haa)), {{({(8'hb7)} < {(8'ha4)})}, (|{(|(8'h9e)), ((7'h43) ? (8'hb0) : (8'had))})}})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire56;
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire5,
                 wire6,
                 wire7,
                 wire56,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
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
                 (1'h0)};
  assign wire5 = (($signed($signed({wire1,
                     wire1})) <= wire4[(2'h2):(1'h1)]) >>> wire3[(5'h14):(5'h12)]);
  assign wire6 = wire3[(4'hd):(4'hc)];
  assign wire7 = wire0;
  module8 #() modinst57 (wire56, clk, wire6, wire3, wire1, wire4, wire2);
  always
    @(posedge clk) begin
      if ($unsigned((~|wire0[(5'h15):(4'h9)])))
        begin
          if (($signed(({((7'h41) <<< wire6), (wire3 >> wire0)} ?
              ((wire5 ? wire5 : wire4) <<< (&wire1)) : ($signed(wire6) ?
                  ((8'hb1) ? (8'ha3) : wire4) : $signed(wire0)))) >> ((8'hb7) ?
              (-{{(8'hbc), wire6}, $signed((8'hbc))}) : wire0)))
            begin
              reg58 <= ($unsigned(({(&(8'hbf))} ?
                      $signed((^wire1)) : {$signed(wire3)})) ?
                  $unsigned((wire56[(1'h1):(1'h0)] ?
                      ($unsigned(wire6) | ((8'h9d) ?
                          (8'haf) : wire5)) : (~&{wire2,
                          (8'hb1)}))) : (((8'hbe) ?
                          $unsigned(wire1) : $signed((wire7 & wire3))) ?
                      wire4 : {wire2[(4'ha):(4'ha)]}));
            end
          else
            begin
              reg58 <= (+wire5);
              reg59 <= wire0[(4'hf):(1'h1)];
              reg60 <= wire4;
              reg61 <= $signed($signed($signed((|((8'ha7) | wire56)))));
              reg62 <= $unsigned($unsigned($signed($unsigned($signed((8'hbf))))));
            end
          if ({$signed({(reg59 * (wire4 * (8'hbb))), (8'h9c)}),
              reg62[(3'h4):(2'h3)]})
            begin
              reg63 <= $unsigned($signed(reg58));
              reg64 <= $unsigned($signed(wire3));
            end
          else
            begin
              reg63 <= $signed($signed((8'h9f)));
              reg64 <= reg64;
              reg65 <= ((!$unsigned(wire2[(4'ha):(3'h6)])) && (^~$unsigned((~^(8'hbe)))));
              reg66 <= (wire5 >>> (~(wire2 < ($signed(wire5) ?
                  (~&reg65) : (reg61 ? (8'ha4) : (8'hb0))))));
            end
        end
      else
        begin
          reg58 <= (8'hac);
        end
      reg67 <= $unsigned($signed($signed($unsigned($signed((8'hbf))))));
      reg68 <= $unsigned(reg65);
      reg69 <= ((^~reg58) == (wire0 ? (8'ha6) : (7'h43)));
      reg70 <= wire4[(3'h4):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg71 <= $unsigned(reg61);
      if ($unsigned((((&$signed(reg63)) ?
              $signed($unsigned(wire0)) : (reg70[(1'h1):(1'h0)] && $unsigned(wire2))) ?
          (wire2 <<< reg59) : reg60)))
        begin
          reg72 <= wire3;
          reg73 <= (reg70 << (~|((~(reg61 ? reg67 : wire5)) ?
              wire0 : $signed($signed(reg59)))));
        end
      else
        begin
          reg72 <= reg60[(2'h3):(2'h2)];
          reg73 <= $signed(wire3[(4'h9):(2'h3)]);
          reg74 <= reg60;
        end
      reg75 <= {reg60[(3'h4):(1'h0)],
          ($unsigned($unsigned((reg73 ? reg67 : reg60))) ?
              reg69 : (~|$signed($signed(reg59))))};
    end
  assign wire76 = $signed(reg61);
  assign wire77 = reg66[(5'h10):(4'h8)];
  assign wire78 = (-($signed($signed((8'hb1))) >> (~|((reg67 ?
                      wire7 : wire1) ^ $signed(wire76)))));
  assign wire79 = ($unsigned($signed($signed(reg72[(3'h7):(3'h5)]))) == ((8'ha9) << ((reg58[(2'h3):(1'h1)] ?
                      reg72[(2'h2):(1'h1)] : (reg72 && reg66)) ~^ (8'ha0))));
  assign wire80 = reg66[(4'he):(2'h2)];
  assign wire81 = wire2[(3'h4):(3'h4)];
endmodule

module module8
#(parameter param55 = (^((8'ha2) ^~ {((~(8'hab)) ? ((8'h9c) ? (8'hb7) : (8'ha1)) : (&(8'hbd)))})))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire28;
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire50,
                 wire30,
                 wire14,
                 wire15,
                 wire28,
                 (1'h0)};
  assign wire14 = (~|wire11[(4'hc):(4'ha)]);
  assign wire15 = wire14;
  module16 #() modinst29 (.wire17(wire9), .y(wire28), .clk(clk), .wire20(wire12), .wire18(wire13), .wire19(wire14), .wire21(wire11));
  assign wire30 = {wire14};
  module31 #() modinst51 (.clk(clk), .wire32(wire10), .wire35(wire15), .y(wire50), .wire34(wire30), .wire33(wire12));
  assign wire52 = ((8'hb5) || $signed($unsigned($signed($unsigned(wire10)))));
  assign wire53 = (wire11[(5'h10):(4'hd)] | (-wire12));
  assign wire54 = $signed((wire28 && wire10[(1'h1):(1'h1)]));
endmodule

module module31
#(parameter param49 = (((~|(8'ha3)) ? (({(8'ha4), (7'h42)} == {(8'hb8), (8'hbf)}) ^~ {(7'h44), ((8'hbb) <<< (8'ha3))}) : (+(((8'hbd) ? (8'hbc) : (8'hb2)) ? ((8'hb6) - (8'h9d)) : (8'ha5)))) < (^{(((8'hb9) ? (8'h9c) : (7'h41)) ? (-(8'ha3)) : (^~(8'haf)))})))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire35;
  input wire signed [(5'h13):(1'h0)] wire34;
  input wire signed [(4'h9):(1'h0)] wire33;
  input wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire36;
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire36,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire36 = wire34;
  always
    @(posedge clk) begin
      reg37 <= {($unsigned((wire34 ? (8'hba) : $unsigned(wire36))) ?
              $signed(wire36[(5'h11):(2'h3)]) : wire33)};
      if (($unsigned(wire35[(3'h7):(3'h5)]) != wire35[(4'hc):(4'h9)]))
        begin
          if ((($unsigned(wire33[(2'h3):(2'h2)]) >> $unsigned((+(wire34 * (8'hb6))))) ?
              wire36[(4'ha):(4'ha)] : (~&$signed(($signed((8'ha5)) ?
                  wire36 : {reg37})))))
            begin
              reg38 <= ({$signed(((^wire34) ^ $signed((8'ha1)))),
                  (|$signed(wire36))} || reg37[(4'ha):(2'h2)]);
              reg39 <= wire33[(2'h2):(1'h0)];
              reg40 <= {(~&(&(reg38 + $unsigned(reg39))))};
            end
          else
            begin
              reg38 <= (!wire33[(1'h0):(1'h0)]);
              reg39 <= (wire32 == reg38[(4'h9):(3'h7)]);
            end
          reg41 <= (wire35[(2'h3):(2'h3)] ?
              $signed(reg40[(4'hb):(4'ha)]) : (^reg38[(4'ha):(1'h1)]));
          reg42 <= reg38;
        end
      else
        begin
          reg38 <= ($signed($unsigned((~|wire35))) ?
              ($signed(wire34[(2'h2):(1'h0)]) ?
                  $unsigned($unsigned((wire33 ~^ wire34))) : (((wire34 ^ wire34) | {(7'h44)}) > {wire33})) : wire33);
        end
      reg43 <= $signed(((|(^$unsigned((8'hbc)))) ?
          $signed($signed(reg37[(4'h8):(2'h3)])) : ($signed((-reg40)) ?
              reg38[(1'h0):(1'h0)] : (wire32[(1'h1):(1'h0)] ?
                  (reg41 * wire34) : reg41))));
      reg44 <= ((($unsigned({reg42, (8'h9d)}) & ((wire36 ? wire36 : reg37) ?
                  $signed(wire35) : (reg42 > wire32))) ?
              (&(~&(~(8'hae)))) : ((reg40[(4'h9):(2'h3)] ?
                      (~^reg39) : wire33[(2'h2):(1'h1)]) ?
                  $signed($signed(reg41)) : ((-reg41) >>> reg39))) ?
          $unsigned((8'hb7)) : $signed($signed(reg38[(4'h9):(3'h6)])));
      reg45 <= $signed($signed((&(8'hbf))));
    end
  assign wire46 = (wire35 ?
                      (^~(-$unsigned(wire34[(4'hd):(2'h2)]))) : (|(~&(~&reg37[(2'h2):(2'h2)]))));
  assign wire47 = ($unsigned(((!(wire34 != wire33)) >= ($unsigned(reg41) * {wire34}))) ?
                      (&((reg43[(3'h7):(2'h2)] ?
                          {reg39} : (reg44 ?
                              wire33 : wire46)) >= $unsigned($signed(reg37)))) : $signed(($unsigned(((8'hb5) < (8'hb1))) ?
                          {(reg38 - reg40)} : reg37[(3'h5):(3'h5)])));
  assign wire48 = ({{wire34[(3'h6):(1'h0)],
                              (wire47 ?
                                  (reg38 >> reg41) : (reg38 ? reg38 : wire32))},
                          ((!wire33[(4'h9):(4'h8)]) ^~ reg40[(1'h0):(1'h0)])} ?
                      ($signed($unsigned({(8'ha7)})) ?
                          reg44 : {reg45}) : {(wire33[(4'h8):(2'h3)] * (wire32[(3'h7):(2'h2)] ?
                              $signed(reg42) : (wire34 ? reg45 : reg41))),
                          reg38[(3'h6):(3'h5)]});
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire21;
  input wire signed [(3'h6):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire [(5'h12):(1'h0)] wire18;
  input wire [(3'h6):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire25;
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  assign y = {wire27, wire26, wire25, reg24, reg23, reg22, (1'h0)};
  always
    @(posedge clk) begin
      reg22 <= $signed($unsigned((wire20[(1'h0):(1'h0)] + $signed(wire19[(3'h5):(2'h3)]))));
      reg23 <= {$unsigned(wire17[(3'h5):(1'h0)])};
      reg24 <= (!((((wire20 && wire17) && wire18[(4'h8):(2'h3)]) && $signed($unsigned(wire21))) ?
          $unsigned($unsigned($unsigned(wire19))) : wire18[(1'h0):(1'h0)]));
    end
  assign wire25 = {{($unsigned((wire18 ? wire19 : wire21)) ?
                              (~$signed(reg22)) : (-(7'h42))),
                          wire17},
                      (!reg22)};
  assign wire26 = wire19;
  assign wire27 = {($unsigned($signed((^~wire21))) ?
                          ($unsigned((8'hb4)) ?
                              ($unsigned(reg24) >= wire25[(2'h3):(1'h0)]) : (-(-wire18))) : ($unsigned((reg24 ?
                                  wire21 : (8'hba))) ?
                              ({wire19,
                                  reg24} <= (wire18 < wire26)) : (8'ha7))),
                      $unsigned(((8'h9f) < ($signed((8'haf)) ?
                          wire21[(3'h7):(1'h0)] : wire26)))};
endmodule
