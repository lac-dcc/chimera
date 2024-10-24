module top
#(parameter param83 = (~&((|((~(7'h41)) >> ((7'h43) < (8'hb7)))) >>> {{(!(8'ha0))}, (((7'h41) && (8'hab)) + {(8'hbb), (7'h41)})})), 
parameter param84 = (~^(param83 >>> ((param83 + (param83 ? param83 : param83)) && ((param83 >= (8'ha9)) | param83)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire76,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire3[(2'h3):(2'h2)] + ((&wire3) ?
          (|$signed(wire3[(3'h6):(3'h5)])) : $unsigned(wire2[(3'h5):(3'h4)]))))
        begin
          reg5 <= $unsigned(wire0[(4'h9):(1'h1)]);
        end
      else
        begin
          if ({$unsigned((~&({reg5} ? $unsigned(wire1) : wire2)))})
            begin
              reg5 <= (~^$signed(((wire2 ? (wire1 ? wire1 : reg5) : wire4) ?
                  wire4[(1'h1):(1'h1)] : wire3)));
              reg6 <= (8'h9d);
            end
          else
            begin
              reg5 <= (8'hb2);
              reg6 <= $signed((-(~|$unsigned(wire2[(2'h3):(2'h3)]))));
              reg7 <= wire3[(3'h7):(3'h6)];
              reg8 <= (^{wire0[(3'h6):(3'h6)]});
              reg9 <= ((&$unsigned(wire2[(3'h4):(2'h2)])) ?
                  {{wire2[(2'h3):(2'h3)],
                          reg7}} : $unsigned((wire4[(2'h3):(2'h2)] ?
                      (reg5 ? (8'hbf) : (wire0 ? wire0 : reg7)) : reg5)));
            end
          reg10 <= {($signed((reg7[(1'h0):(1'h0)] + wire1[(1'h1):(1'h1)])) ?
                  (((reg5 << reg8) ?
                      $signed((7'h44)) : $unsigned(wire3)) || reg6[(3'h4):(1'h0)]) : ($signed((reg9 ?
                      wire2 : wire1)) + $signed((8'hbd)))),
              {$signed((8'ha0))}};
        end
      if ((+(^~$signed(wire1[(1'h0):(1'h0)]))))
        begin
          reg11 <= $unsigned({$unsigned((~|(wire3 == wire2))), (8'hb6)});
        end
      else
        begin
          reg11 <= (8'h9f);
          if (wire4)
            begin
              reg12 <= wire3[(3'h7):(2'h3)];
              reg13 <= wire1[(2'h2):(2'h2)];
              reg14 <= reg11[(2'h2):(1'h0)];
            end
          else
            begin
              reg12 <= (~|{($unsigned(wire1[(2'h2):(2'h2)]) ?
                      ((reg6 ? reg11 : (8'hae)) & (reg14 != reg13)) : reg8)});
            end
          if (reg6[(4'h9):(4'h8)])
            begin
              reg15 <= $signed(reg8[(3'h5):(3'h4)]);
              reg16 <= $unsigned(wire1);
              reg17 <= (((8'hb2) != (reg9[(2'h3):(1'h0)] <= (reg11 ?
                      reg14[(3'h4):(2'h3)] : (wire2 & wire0)))) ?
                  $unsigned(((!$signed(reg7)) + {$signed((8'ha1)),
                      $signed((8'ha1))})) : (~&$unsigned($unsigned($unsigned(reg15)))));
              reg18 <= (~|reg5[(5'h11):(5'h11)]);
              reg19 <= $signed(wire0);
            end
          else
            begin
              reg15 <= $unsigned((~^(|{(wire2 >> reg8), (reg16 <<< wire3)})));
            end
          reg20 <= (|wire3[(3'h4):(3'h4)]);
          reg21 <= (reg18 == $unsigned($unsigned($signed($signed(reg18)))));
        end
      reg22 <= reg10[(4'hc):(3'h6)];
    end
  assign wire23 = $signed(reg16[(1'h0):(1'h0)]);
  assign wire24 = (($signed($signed((|reg18))) ?
                          (!$unsigned({(8'ha4)})) : reg12) ?
                      reg5[(4'h9):(2'h2)] : (~|$signed(reg17[(1'h0):(1'h0)])));
  assign wire25 = ({$unsigned($unsigned(reg12)), reg16} ?
                      ($signed($unsigned(((8'had) >> reg19))) <= ($signed((reg11 ?
                          wire2 : reg19)) == reg9[(3'h5):(2'h2)])) : $signed(((((8'ha1) && reg10) ~^ wire24[(4'h9):(3'h6)]) ?
                          (reg17[(1'h0):(1'h0)] >>> (8'h9f)) : reg13[(1'h1):(1'h0)])));
  assign wire26 = $unsigned((^reg16));
  module27 #() modinst77 (.wire30(reg10), .wire29(reg11), .clk(clk), .y(wire76), .wire32(reg6), .wire28(reg8), .wire31(reg17));
  assign wire78 = (reg5[(3'h5):(2'h3)] ?
                      $signed(($signed((reg12 ?
                          reg15 : reg9)) >>> (-reg16[(4'hc):(4'hb)]))) : (&$unsigned((&(reg12 >= (8'h9d))))));
  assign wire79 = {reg8, wire23[(1'h1):(1'h1)]};
  assign wire80 = ($unsigned(wire23) < reg20);
  assign wire81 = reg6[(3'h7):(2'h2)];
  assign wire82 = ($unsigned((wire2[(1'h0):(1'h0)] ?
                      $signed(((7'h41) ?
                          reg7 : (8'h9f))) : (~&reg12))) != $signed(reg5));
endmodule

module module27  (y, clk, wire28, wire29, wire30, wire31, wire32);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(2'h2):(1'h0)] wire30;
  input wire signed [(4'hc):(1'h0)] wire31;
  input wire [(5'h14):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire72;
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  assign y = {wire75,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire72,
                 reg74,
                 (1'h0)};
  assign wire33 = ($unsigned($unsigned((!((7'h41) ?
                      wire30 : (8'hb4))))) >= wire32);
  assign wire34 = (wire30[(1'h0):(1'h0)] ?
                      $unsigned($signed(wire31)) : (8'ha7));
  assign wire35 = ((({$signed(wire30)} ? wire33[(5'h10):(4'h9)] : wire33) ?
                          wire28 : (!(~^$signed((8'ha3))))) ?
                      $unsigned(((-$unsigned(wire31)) && $signed($unsigned(wire34)))) : {wire33,
                          {(~|(!wire33))}});
  assign wire36 = wire35;
  assign wire37 = (wire36[(4'hb):(3'h5)] ?
                      $unsigned($signed((((8'hb4) ? wire32 : wire28) ?
                          $signed(wire33) : (wire28 + wire35)))) : wire30[(1'h0):(1'h0)]);
  assign wire38 = wire31;
  assign wire39 = (($signed(((wire31 ? wire35 : wire32) ?
                          $signed(wire28) : {(8'hb5)})) ?
                      {$unsigned(((8'h9c) && wire28)),
                          wire37[(3'h7):(2'h2)]} : (wire31 ?
                          ($unsigned(wire34) && (wire36 <<< (8'hb1))) : $signed({wire34}))) >>> wire33);
  assign wire40 = ((8'ha6) ?
                      ($signed((wire32[(3'h5):(3'h4)] >> (wire29 ?
                              wire30 : wire36))) ?
                          (7'h43) : wire33) : (((^~(wire33 && (8'hab))) != $signed((|wire30))) >= wire34[(1'h0):(1'h0)]));
  module41 #() modinst73 (wire72, clk, wire33, wire38, wire36, wire31, wire40);
  always
    @(posedge clk) begin
      reg74 <= {({({wire39, wire40} ^~ ((8'hb1) < wire32))} ?
              (wire31 ? $signed((~|wire28)) : (8'h9d)) : wire34),
          {$unsigned((^wire38)), wire37}};
    end
  assign wire75 = ($signed((($unsigned(wire38) <= $unsigned(wire30)) ?
                      $signed(wire72[(3'h5):(2'h2)]) : $signed((reg74 || (7'h42))))) == wire33[(4'hf):(1'h1)]);
endmodule

module module41
#(parameter param71 = (({{(~^(8'haf))}} ^ (~^(8'ha7))) ^~ ((-(!(8'ha2))) && (~|({(8'hab)} ? ((7'h44) ~^ (8'h9e)) : (~&(8'hbf)))))))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire46;
  input wire signed [(5'h10):(1'h0)] wire45;
  input wire signed [(2'h3):(1'h0)] wire44;
  input wire signed [(4'hc):(1'h0)] wire43;
  input wire [(4'hf):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire47 = $signed((((wire42[(2'h3):(1'h1)] <= {(8'hba),
                      wire42}) || $signed(wire42)) ~^ (^~$unsigned(wire46))));
  assign wire48 = wire45;
  assign wire49 = $signed($unsigned(((~^{(8'hb8), wire46}) ?
                      wire42[(2'h3):(1'h0)] : wire47[(2'h2):(1'h1)])));
  assign wire50 = $unsigned(((7'h42) ? wire42 : $signed(wire42)));
  assign wire51 = {{({((8'ha9) & wire48)} & wire42[(3'h7):(1'h1)])},
                      $signed((~^(|((8'hb0) * wire47))))};
  assign wire52 = {($signed(wire49) ?
                          $signed(($signed(wire44) ?
                              (wire49 ?
                                  wire49 : wire43) : $signed((8'hb2)))) : $unsigned($unsigned(wire47))),
                      wire49};
  assign wire53 = (-(~|(+(7'h41))));
  assign wire54 = ((~|((wire46[(4'h9):(2'h3)] ? (wire47 != wire42) : wire42) ?
                          (((8'hbc) ? wire46 : wire45) ?
                              (wire53 >>> (8'had)) : (wire50 ?
                                  wire42 : wire46)) : $signed({wire51,
                              wire44}))) ?
                      wire47 : {(wire43 > $signed((wire46 || wire43))),
                          wire45[(2'h3):(2'h2)]});
  always
    @(posedge clk) begin
      reg55 <= $unsigned($signed(wire48[(4'h8):(1'h0)]));
      reg56 <= ($unsigned($signed((~|(wire43 ? wire42 : wire52)))) << wire49);
    end
  assign wire57 = $signed(wire54);
  assign wire58 = wire44[(1'h0):(1'h0)];
  assign wire59 = wire54;
  assign wire60 = (({((wire48 | wire45) >>> $unsigned(wire58))} != wire49[(1'h0):(1'h0)]) ?
                      $signed($signed($signed((^~wire49)))) : {wire45[(3'h5):(2'h2)],
                          (^(((7'h41) ? (8'hb0) : wire46) ?
                              (~^wire46) : reg55[(4'hd):(3'h5)]))});
  assign wire61 = {($unsigned((!wire51)) ?
                          (reg56[(3'h5):(2'h3)] - wire46) : (-wire54[(4'h8):(4'h8)]))};
  assign wire62 = $unsigned(($unsigned($unsigned((wire61 ?
                      wire51 : wire61))) > $signed(wire58[(3'h7):(1'h0)])));
  assign wire63 = (+($unsigned({wire42}) ?
                      wire50 : (^(wire57 ? (wire62 >= wire48) : (~&(8'hbf))))));
  assign wire64 = (~&wire45[(3'h4):(3'h4)]);
  assign wire65 = ((($signed($unsigned((8'ha9))) & ($signed(wire54) ?
                          (wire42 ^ wire60) : $signed(wire58))) | reg56) ?
                      wire58[(3'h6):(1'h0)] : wire48);
  assign wire66 = {(8'hbb)};
  assign wire67 = $signed(wire50);
  assign wire68 = ($unsigned(({wire48} + (^~(wire42 ? wire59 : wire54)))) ?
                      (wire45 ?
                          {(+(wire57 ? wire63 : wire54)),
                              $signed(wire62)} : ($signed((8'hb5)) ?
                              $unsigned((wire47 ?
                                  reg55 : wire45)) : ($signed((8'ha7)) ^~ $unsigned(wire45)))) : wire63[(3'h4):(1'h1)]);
  assign wire69 = $unsigned(wire58);
  assign wire70 = $unsigned((~&$unsigned((|(wire46 <= (8'hbb))))));
endmodule
