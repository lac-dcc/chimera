module top
#(parameter param92 = {((&(~(~|(8'haa)))) ? (~&({(7'h43), (8'ha3)} >>> (~|(8'hb0)))) : ((^{(8'hb0), (8'hbb)}) ^~ ({(7'h40)} ? (^~(8'ha9)) : (|(7'h41))))), ((8'hbb) == (|(((7'h41) >>> (8'ha4)) ? (&(8'ha4)) : ((8'hb9) >>> (8'ha5)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  assign y = {wire90,
                 wire21,
                 wire7,
                 wire6,
                 wire5,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = {(~&$unsigned(($unsigned(wire1) ? wire4 : (+wire3)))),
                     (&((wire1[(3'h5):(1'h1)] || $unsigned(wire3)) ?
                         (wire0 + $unsigned(wire3)) : (((7'h41) ?
                                 wire0 : wire1) ?
                             (wire3 ? wire4 : wire1) : wire3[(4'hb):(4'hb)])))};
  assign wire6 = wire4[(3'h5):(3'h4)];
  assign wire7 = wire6;
  always
    @(posedge clk) begin
      reg8 <= (((($signed(wire2) ^~ (wire7 ^~ wire4)) ?
                  $unsigned($unsigned(wire0)) : $signed((~wire7))) ?
              ((wire1 ?
                  $signed((8'hb7)) : (wire2 ?
                      wire7 : wire0)) > $signed(wire6[(2'h2):(1'h1)])) : (!(-wire1[(1'h1):(1'h0)]))) ?
          $unsigned(wire2) : wire3);
      if (wire4)
        begin
          if ((~^wire3))
            begin
              reg9 <= wire5;
              reg10 <= wire2;
              reg11 <= (8'hb2);
              reg12 <= (~(reg10 ?
                  (~(^~{wire6,
                      reg11})) : $signed($unsigned((wire0 && wire3)))));
            end
          else
            begin
              reg9 <= $unsigned({$signed($signed(wire6[(3'h6):(2'h2)])),
                  (~&wire5[(1'h0):(1'h0)])});
              reg10 <= $signed($signed($unsigned(((wire2 ? wire5 : wire4) ?
                  $signed(reg12) : (8'hb3)))));
              reg11 <= (-reg9[(4'h9):(3'h6)]);
            end
          reg13 <= $unsigned((-({$signed(reg10),
              ((7'h41) | wire6)} <<< $unsigned($unsigned(reg11)))));
          reg14 <= $unsigned(reg9);
          reg15 <= $unsigned(reg11);
        end
      else
        begin
          if (wire5[(3'h5):(2'h3)])
            begin
              reg9 <= (reg14 ?
                  {$signed((reg15 ? (reg14 ? wire7 : wire6) : reg11)),
                      wire4} : $signed(($signed((|reg15)) ?
                      reg12 : $signed((wire1 ? (8'hb6) : wire0)))));
              reg10 <= ({$unsigned((~^(~wire2))),
                  (~^wire5[(3'h7):(1'h1)])} - reg11[(2'h3):(2'h3)]);
              reg11 <= wire0[(4'h8):(1'h1)];
              reg12 <= reg8[(3'h4):(1'h1)];
              reg13 <= ($signed($unsigned(((|reg9) ? (~|wire7) : {wire3}))) ?
                  ({(~&$signed(reg9))} || wire1[(3'h4):(1'h0)]) : ((wire3[(5'h12):(3'h4)] + wire1) ?
                      wire0 : $unsigned({(~|wire3), (wire5 ^~ wire6)})));
            end
          else
            begin
              reg9 <= wire5;
              reg10 <= (+($signed((reg12[(1'h0):(1'h0)] * wire0[(4'h9):(4'h9)])) ?
                  (^$signed(wire7)) : reg15));
              reg11 <= $signed(({wire7,
                  (+wire4)} << (($signed(reg10) << (8'hb7)) ?
                  reg11[(4'hb):(4'hb)] : ($unsigned(wire0) ~^ $signed(wire0)))));
              reg12 <= $signed((reg8 ?
                  $signed(((7'h40) ?
                      reg14 : (wire6 ? wire6 : wire4))) : {($unsigned(wire5) ?
                          $signed(wire1) : wire0),
                      {reg13[(1'h0):(1'h0)]}}));
            end
          reg14 <= (wire2[(3'h5):(2'h2)] ~^ reg13);
          if (wire5[(3'h7):(3'h4)])
            begin
              reg15 <= $unsigned(reg11[(4'hc):(3'h4)]);
              reg16 <= reg15[(3'h4):(1'h0)];
            end
          else
            begin
              reg15 <= ((wire5[(3'h7):(3'h6)] * (($signed((8'ha9)) ?
                          (wire1 ? wire3 : (8'hab)) : $unsigned(wire6)) ?
                      $signed((reg13 ? wire4 : wire7)) : (wire3[(2'h3):(2'h3)] ?
                          reg13 : $unsigned(wire0)))) ?
                  $signed(reg10) : $unsigned(($signed(reg10[(4'hc):(2'h3)]) ^ wire7[(3'h4):(2'h2)])));
              reg16 <= ((7'h44) ?
                  (+(wire3 ?
                      (-(reg10 || reg12)) : $signed((-reg12)))) : $signed((~|(-(!reg11)))));
              reg17 <= $unsigned(((+(&(wire6 ?
                  (8'hb8) : wire4))) + ($signed($unsigned(reg13)) ?
                  ($signed((8'hb1)) ?
                      (|reg14) : wire3) : reg16[(5'h12):(3'h4)])));
              reg18 <= (((^(((8'hba) ^ reg8) * (reg12 << reg15))) && wire5) ?
                  {(+$unsigned({reg8})),
                      (reg14[(4'hb):(1'h0)] <<< $signed(wire0))} : ({(^~{reg16,
                          wire7}),
                      reg8[(3'h7):(1'h0)]} >= wire7[(2'h3):(2'h2)]));
              reg19 <= reg14;
            end
          reg20 <= (~reg16);
        end
    end
  assign wire21 = reg16;
  module22 #() modinst91 (.wire23(reg8), .wire25(reg10), .wire24(wire0), .wire26(wire2), .y(wire90), .clk(clk));
endmodule

module module22
#(parameter param88 = (!(~|((|((8'hbc) && (8'hb1))) << (8'hbf)))), 
parameter param89 = (~|(7'h42)))
(y, clk, wire23, wire24, wire25, wire26);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire24;
  input wire signed [(5'h12):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire65;
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire68,
                 wire67,
                 wire40,
                 wire65,
                 (1'h0)};
  module27 #() modinst41 (wire40, clk, wire23, wire26, wire25, wire24);
  module42 #() modinst66 (.wire43(wire25), .wire47(wire40), .y(wire65), .wire45(wire24), .wire44(wire23), .clk(clk), .wire46(wire26));
  assign wire67 = $signed(($signed(wire65) ?
                      {wire40[(4'hf):(3'h5)]} : wire26[(3'h5):(2'h2)]));
  assign wire68 = ($unsigned(((8'hba) >= (~&$unsigned(wire24)))) ?
                      $unsigned(wire26[(5'h15):(5'h13)]) : $unsigned({wire65}));
  module69 #() modinst84 (.wire70(wire67), .wire73(wire25), .wire72(wire68), .y(wire83), .wire71(wire65), .clk(clk));
  assign wire85 = $signed(wire83[(2'h2):(1'h1)]);
  assign wire86 = $unsigned($signed((wire67 ?
                      wire85 : $unsigned((wire23 ~^ wire40)))));
  assign wire87 = wire23;
endmodule

module module69  (y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire73;
  input wire [(4'hf):(1'h0)] wire72;
  input wire [(3'h4):(1'h0)] wire71;
  input wire [(4'hc):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire74;
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 (1'h0)};
  assign wire74 = $signed({$unsigned($unsigned(wire72[(4'hf):(4'h9)]))});
  assign wire75 = wire72[(4'hc):(3'h7)];
  assign wire76 = ((!wire74[(5'h11):(5'h10)]) ?
                      $signed($unsigned($signed((wire73 ?
                          wire74 : (8'hb4))))) : (-wire74));
  assign wire77 = (|({((wire76 >= (8'haf)) ?
                          $unsigned((8'h9d)) : wire71[(2'h2):(1'h1)]),
                      $unsigned({wire75,
                          wire75})} ^ $unsigned($unsigned({wire75, wire71}))));
  assign wire78 = $unsigned($unsigned((wire70[(3'h7):(1'h0)] >>> wire73)));
  assign wire79 = $unsigned((wire72 | {((wire76 * wire73) ?
                          wire77[(4'h9):(3'h4)] : (+wire70)),
                      $signed((wire70 * wire77))}));
  assign wire80 = $unsigned({($signed(((8'hb3) ? wire72 : wire79)) * wire73)});
  assign wire81 = $unsigned((wire79 ?
                      (wire70 ?
                          ((wire73 | wire78) ?
                              wire76 : (wire71 == (8'h9c))) : (|wire73)) : $signed(wire78[(3'h4):(2'h3)])));
  assign wire82 = $signed((&{{(wire76 ? wire78 : wire79), $signed(wire72)},
                      (wire73 ? $unsigned(wire73) : wire71[(1'h0):(1'h0)])}));
endmodule

module module42
#(parameter param64 = (~|(-{((8'ha3) >> ((8'hac) | (7'h41)))})))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire47;
  input wire signed [(3'h6):(1'h0)] wire46;
  input wire [(5'h11):(1'h0)] wire45;
  input wire signed [(3'h7):(1'h0)] wire44;
  input wire [(3'h4):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire48 = $unsigned(wire46[(1'h0):(1'h0)]);
  assign wire49 = $signed(wire46[(3'h6):(2'h2)]);
  assign wire50 = wire48[(3'h4):(1'h1)];
  assign wire51 = $unsigned((~$signed(wire44[(3'h5):(3'h5)])));
  assign wire52 = ($signed($unsigned(wire49)) ?
                      wire45[(4'he):(2'h3)] : ($signed((((8'h9f) && wire44) >= wire49[(3'h4):(2'h2)])) || wire45[(2'h3):(2'h3)]));
  assign wire53 = wire49;
  always
    @(posedge clk) begin
      reg54 <= (~^$unsigned($unsigned(wire49[(3'h7):(3'h6)])));
      reg55 <= $signed((((^~(~|wire52)) ? wire52 : wire52) ?
          $signed(wire53[(3'h4):(3'h4)]) : wire50[(1'h0):(1'h0)]));
      reg56 <= ({($unsigned((8'ha2)) ?
                  $unsigned((~^wire46)) : $unsigned($unsigned(wire46)))} ?
          wire52[(1'h1):(1'h0)] : {$signed((+((7'h42) ? wire43 : wire43)))});
    end
  assign wire57 = ((wire51 != {$unsigned($signed(wire45)), wire52}) ?
                      ((~^wire51) ?
                          (wire48 ?
                              ($signed(wire52) - ((8'hbb) ?
                                  wire49 : wire43)) : (reg56[(4'hc):(4'h8)] ?
                                  wire46[(3'h5):(2'h3)] : (|wire45))) : wire53[(1'h0):(1'h0)]) : ((8'had) ?
                          $unsigned((wire47[(2'h3):(2'h3)] ?
                              $unsigned(wire44) : (reg56 != wire48))) : (({(8'hb9)} >>> {(8'hbd),
                              wire43}) ^~ (wire52 ?
                              (&wire44) : $unsigned(wire48)))));
  assign wire58 = (~^wire49[(4'h8):(3'h5)]);
  assign wire59 = wire51[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg60 <= (&$unsigned(wire48[(2'h2):(1'h0)]));
      reg61 <= $signed($signed((wire45[(2'h3):(1'h0)] != $unsigned((wire48 & (7'h44))))));
      reg62 <= (8'h9d);
      reg63 <= wire52[(4'ha):(4'h8)];
    end
endmodule

module module27
#(parameter param38 = (~(((&(~&(8'ha5))) ? (((7'h43) + (8'h9d)) ? {(8'ha8), (8'hb6)} : (8'hb2)) : (((8'h9e) ? (8'hb8) : (8'hb7)) >>> {(8'ha6)})) ? (~((~^(8'ha4)) < ((8'h9c) ? (8'hbf) : (8'hb9)))) : ((((8'hbc) ? (8'hb5) : (7'h40)) ? {(8'hbc), (8'ha2)} : (+(8'ha7))) * (+(-(8'hbd)))))), 
parameter param39 = {({(param38 ? (param38 <= param38) : (^~param38)), param38} ? (param38 && (~&param38)) : ((^~{param38, (8'ha0)}) ? ({param38} >= param38) : {((8'hbc) & param38)})), (((param38 <<< (param38 ? param38 : param38)) ? (~|param38) : ((^~param38) ? (&(8'ha8)) : ((8'ha6) ^~ param38))) > (~param38))})
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire [(4'hf):(1'h0)] wire29;
  input wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  assign y = {wire37, wire36, wire35, wire34, wire33, wire32, (1'h0)};
  assign wire32 = (wire29 < $signed(wire30[(5'h12):(3'h5)]));
  assign wire33 = (|wire30);
  assign wire34 = ($signed(($unsigned((wire29 ?
                          (8'hae) : wire29)) + $signed($signed((8'h9d))))) ?
                      wire33 : wire28);
  assign wire35 = wire34;
  assign wire36 = $signed((~|{(&$unsigned(wire35))}));
  assign wire37 = wire28[(2'h2):(1'h1)];
endmodule
