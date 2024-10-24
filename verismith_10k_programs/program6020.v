module top
#(parameter param79 = ((&((((8'hb4) < (8'hbe)) != ((8'hbc) ? (8'hac) : (8'ha1))) ? (((8'haa) ? (8'hb3) : (8'ha0)) > ((8'ha0) ? (8'hb3) : (7'h44))) : (((7'h41) ? (8'hac) : (8'ha8)) < (~&(8'hb9))))) < {((((8'ha0) ? (8'ha2) : (8'haf)) <<< ((8'hb8) >> (8'hb3))) ? (+((8'hbe) ? (8'hbf) : (8'haf))) : ((8'hb3) | (~^(8'hba)))), ((-(7'h44)) ^~ (~&((7'h44) ~^ (8'ha3))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  assign y = {wire77,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2[(3'h6):(3'h5)];
      if ($unsigned($signed($signed(wire2[(4'hb):(3'h4)]))))
        begin
          if ((reg5[(1'h1):(1'h0)] >= wire3))
            begin
              reg6 <= (($signed(reg5) - (~(wire3 & $signed(wire0)))) ^~ $signed(wire2));
            end
          else
            begin
              reg6 <= ((+((8'hba) | (wire4 + (reg6 ? wire3 : wire2)))) ?
                  ((wire0[(2'h3):(1'h1)] ? (!(wire3 < wire1)) : reg6) ?
                      ({$unsigned((8'ha6)), $signed(wire0)} ?
                          ({wire4} ?
                              (wire3 ? wire4 : wire1) : (~^wire2)) : (|(wire0 ?
                              wire2 : wire1))) : wire4[(4'hd):(1'h1)]) : (reg6[(2'h3):(2'h2)] & wire2[(3'h6):(1'h1)]));
              reg7 <= wire0[(2'h2):(1'h1)];
              reg8 <= (+(~^($unsigned((wire4 ?
                  reg6 : wire3)) < wire4[(4'hf):(2'h3)])));
              reg9 <= ((reg6 >> (((wire2 - (8'hb5)) >> $unsigned(reg7)) - ($unsigned((8'ha8)) <<< $signed(wire2)))) ^~ (wire4[(4'hb):(3'h4)] >= (((-wire3) ?
                  $unsigned((8'ha1)) : (reg5 ? wire2 : reg6)) != (|wire3))));
              reg10 <= (reg9[(1'h1):(1'h0)] != ((~|reg7[(3'h6):(3'h4)]) ~^ (^wire2[(4'h9):(4'h8)])));
            end
          reg11 <= reg6;
          reg12 <= $unsigned($signed(wire1[(3'h7):(3'h5)]));
          if (wire3[(2'h2):(1'h0)])
            begin
              reg13 <= $unsigned(($unsigned(reg12) <<< (reg7 ?
                  ($unsigned(wire0) ^ $unsigned(reg12)) : (~(~^reg8)))));
              reg14 <= (8'ha3);
              reg15 <= (&$unsigned((&(((8'h9d) == (8'hb7)) <<< $unsigned(reg8)))));
            end
          else
            begin
              reg13 <= reg15[(3'h5):(1'h0)];
            end
        end
      else
        begin
          reg6 <= (~&(wire1 & (((reg10 + reg14) > $unsigned(reg11)) ?
              (8'hb5) : $signed($unsigned((8'ha8))))));
          if (wire2[(1'h0):(1'h0)])
            begin
              reg7 <= (8'hbb);
              reg8 <= ($signed(((reg9[(1'h0):(1'h0)] ?
                      {reg10} : (wire3 == reg13)) || reg13[(4'hd):(4'hc)])) ?
                  (reg11[(1'h1):(1'h0)] ?
                      reg10 : (($unsigned((8'hba)) ?
                              (!reg15) : $signed((8'ha9))) ?
                          $unsigned((wire1 ? wire0 : reg7)) : ($signed(wire0) ?
                              $unsigned((8'hb0)) : ((8'hbd) >= reg10)))) : ((&((reg6 ?
                      wire0 : reg15) || (^~reg11))) > ($signed((reg7 + reg10)) < ((|wire2) != $unsigned(reg12)))));
            end
          else
            begin
              reg7 <= $unsigned($signed((^~reg10[(3'h5):(2'h2)])));
              reg8 <= {((^~$signed((|(8'ha2)))) ?
                      ((^$unsigned((8'hbe))) || $signed((reg10 ?
                          reg15 : wire0))) : wire3),
                  ((reg7 ?
                          ((wire4 ? reg7 : wire1) > $unsigned(reg15)) : (wire2 ?
                              reg9 : $unsigned(wire2))) ?
                      $signed((wire1[(5'h12):(4'h9)] != $signed(reg6))) : $unsigned(reg13[(2'h3):(1'h1)]))};
            end
          reg9 <= reg13;
          reg10 <= $signed(reg10[(3'h4):(2'h2)]);
          reg11 <= (~|($unsigned($unsigned(wire3[(3'h4):(2'h3)])) - $signed(reg11)));
        end
      reg16 <= $unsigned((reg8 ?
          (+(+$signed(reg14))) : $signed($signed((~|(8'hb9))))));
      reg17 <= (reg13 <<< reg5[(3'h6):(1'h0)]);
      reg18 <= ((|(($unsigned(wire3) << $signed((8'h9f))) == $unsigned((reg14 != reg6)))) ?
          (reg11[(1'h1):(1'h1)] ?
              (^reg9) : {wire2}) : (~^$signed(reg15[(4'hc):(4'ha)])));
    end
  assign wire19 = (~^(~^reg18));
  assign wire20 = (~|(^~wire4[(4'hb):(4'h9)]));
  assign wire21 = ($signed({$unsigned(reg18)}) ^ (wire1[(4'hb):(3'h7)] ?
                      (~&reg12[(3'h4):(2'h3)]) : (8'ha6)));
  assign wire22 = $signed((|({((8'h9f) <<< wire20)} * reg17[(2'h3):(1'h1)])));
  assign wire23 = {reg6[(1'h0):(1'h0)]};
  module24 #() modinst78 (.clk(clk), .wire25(reg12), .wire27(wire2), .wire28(wire22), .y(wire77), .wire26(reg8), .wire29(reg17));
endmodule

module module24  (y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire25;
  input wire [(5'h11):(1'h0)] wire26;
  input wire [(5'h13):(1'h0)] wire27;
  input wire signed [(5'h10):(1'h0)] wire28;
  input wire [(3'h5):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire68;
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire30,
                 wire31,
                 wire32,
                 wire68,
                 (1'h0)};
  assign wire30 = $signed((wire27 ^ wire26));
  assign wire31 = wire30[(3'h4):(3'h4)];
  assign wire32 = $signed(wire31[(4'h9):(4'h9)]);
  module33 #() modinst69 (.wire35(wire30), .wire37(wire26), .clk(clk), .y(wire68), .wire36(wire29), .wire38(wire28), .wire34(wire32));
  assign wire70 = $signed(wire28[(2'h3):(1'h0)]);
  assign wire71 = ((wire29 ? $signed(wire68[(4'h8):(3'h7)]) : wire26) ?
                      wire26[(4'h8):(1'h1)] : $unsigned(((wire28 <= $unsigned((8'ha6))) < $signed({wire28}))));
  assign wire72 = $unsigned($signed((($signed(wire70) ~^ {wire26,
                      wire27}) || {wire27[(3'h7):(3'h7)]})));
  assign wire73 = ((((~&{wire68}) == wire29[(3'h5):(2'h2)]) == (8'ha8)) ?
                      $signed(wire30) : $unsigned($unsigned(((wire28 ?
                              wire68 : wire30) ?
                          wire68[(3'h6):(2'h2)] : (8'hb8)))));
  assign wire74 = wire27;
  assign wire75 = wire26;
  assign wire76 = wire70[(1'h1):(1'h1)];
endmodule

module module33
#(parameter param66 = ({{(((8'hbf) ^~ (8'ha7)) ? ((8'hbf) | (8'h9c)) : (|(8'ha4))), {((8'ha4) ? (8'hab) : (8'haf)), {(8'haf), (8'ha6)}}}, ((((8'ha4) > (8'hbb)) ~^ ((8'hba) ~^ (8'hac))) <<< (((8'hb7) == (8'ha3)) ? ((8'hb5) || (8'h9d)) : (8'haf)))} << {{((~&(8'ha7)) ? (8'hba) : {(8'ha8)}), ((-(8'hb1)) ~^ {(8'h9e)})}}), 
parameter param67 = (((&(^param66)) <= ((8'ha2) | ((param66 <= param66) ? (param66 ? param66 : param66) : {param66, param66}))) ? (&(^~(-param66))) : {((((8'ha0) ? param66 : param66) < (7'h43)) ? (^~(param66 >= param66)) : ((param66 ? (8'hb9) : param66) ? (param66 ? param66 : param66) : (~&param66)))}))
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire38;
  input wire [(5'h11):(1'h0)] wire37;
  input wire [(3'h5):(1'h0)] wire36;
  input wire [(4'ha):(1'h0)] wire35;
  input wire signed [(4'ha):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
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
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire39 = $signed(((!$signed(wire36[(2'h3):(1'h0)])) ?
                      (((wire37 != wire37) == {wire35}) | wire37) : (|$unsigned((wire36 ?
                          (7'h44) : wire34)))));
  assign wire40 = wire36[(3'h4):(1'h0)];
  assign wire41 = (($unsigned($unsigned($unsigned(wire40))) > {($unsigned((8'ha2)) <= $signed(wire36))}) * $unsigned($unsigned(($unsigned(wire36) ?
                      wire38[(2'h2):(2'h2)] : wire39[(4'hc):(3'h6)]))));
  assign wire42 = ((^$unsigned((8'hb2))) ?
                      ((((wire36 ? wire38 : wire37) ?
                          $unsigned((8'haf)) : wire40) != (wire41 ?
                          wire38 : $signed(wire41))) < wire36) : (8'ha1));
  assign wire43 = {wire39};
  assign wire44 = $unsigned((|wire40));
  assign wire45 = wire35[(1'h0):(1'h0)];
  assign wire46 = (wire44[(1'h0):(1'h0)] ? $unsigned(wire40) : wire44);
  assign wire47 = $unsigned(((wire35[(3'h6):(1'h1)] >>> wire45) ~^ {{(&wire40),
                          (~^wire38)}}));
  assign wire48 = wire41[(4'hb):(4'h8)];
  assign wire49 = ($unsigned(($signed((|wire35)) ?
                      ((wire45 + wire35) && wire46[(2'h2):(1'h1)]) : (wire34[(3'h6):(2'h3)] | $signed((8'haf))))) << (wire37 ?
                      ((wire48[(1'h1):(1'h0)] && (~wire45)) * ((wire45 ?
                              wire48 : wire45) ?
                          $signed(wire41) : ((8'hbf) ?
                              wire45 : wire43))) : wire37));
  always
    @(posedge clk) begin
      reg50 <= $signed(($unsigned(wire41[(4'ha):(4'h8)]) - {(wire45 ~^ $signed(wire40)),
          wire47}));
      if (wire43)
        begin
          reg51 <= (^~(!wire34[(1'h0):(1'h0)]));
          reg52 <= $unsigned((+$unsigned(wire45)));
          reg53 <= wire45[(5'h13):(5'h10)];
          if ((({((reg53 ? (8'hbe) : (8'hb2)) <= $signed(wire34)), wire39} ?
                  $unsigned({(8'hab)}) : wire47) ?
              (~|($unsigned(((8'hb0) ^ reg52)) ?
                  $unsigned($unsigned(reg53)) : wire42)) : wire37[(3'h7):(1'h1)]))
            begin
              reg54 <= ({$signed({(reg52 == wire40), (&(8'hae))}),
                      $signed(($unsigned(wire47) ?
                          $unsigned(reg53) : wire42))} ?
                  (!({$unsigned(wire40)} >> reg50)) : ($signed({$signed(wire34)}) ?
                      $unsigned((7'h42)) : (((wire41 ^~ wire38) * $signed((8'hb5))) ?
                          reg51[(4'h8):(3'h4)] : $unsigned(reg52))));
              reg55 <= wire35[(3'h4):(2'h3)];
              reg56 <= (^wire49);
              reg57 <= $unsigned((reg52[(3'h4):(2'h3)] != (reg50[(2'h2):(1'h1)] ?
                  (reg52[(4'h8):(1'h1)] || {reg50}) : (^~(~|wire38)))));
            end
          else
            begin
              reg54 <= $unsigned(wire34);
            end
          if ($signed((((!(^~wire47)) & {$unsigned(reg56), wire39}) ?
              ((8'hb6) == (&(~|(8'hb6)))) : $signed((((8'ha8) >> reg51) ?
                  (wire35 ? (8'hb6) : (8'hb3)) : $signed(reg53))))))
            begin
              reg58 <= ({reg53} <<< ($unsigned($signed((reg53 ?
                  reg52 : wire38))) == (((8'hb4) ?
                  (~^wire45) : (reg50 | wire36)) - (wire41 ?
                  $signed(wire42) : {wire38, wire39}))));
              reg59 <= wire42;
            end
          else
            begin
              reg58 <= (8'hb9);
              reg59 <= (+(|wire36[(2'h2):(1'h0)]));
              reg60 <= $signed(({((8'ha6) ? (8'hb2) : wire41),
                  ($unsigned(reg51) <= (^reg59))} >= $signed(((reg59 ?
                      reg50 : wire44) ?
                  $unsigned(reg53) : wire34[(4'h8):(2'h3)]))));
              reg61 <= reg57[(4'he):(4'hd)];
            end
        end
      else
        begin
          reg51 <= $unsigned($signed(wire38[(3'h4):(1'h1)]));
        end
      reg62 <= $signed(wire42);
    end
  assign wire63 = wire45[(3'h5):(3'h5)];
  assign wire64 = ($signed(($unsigned($unsigned(reg61)) | (wire39 == $signed(wire49)))) && {(-($signed((8'hb1)) ?
                          wire34[(2'h2):(1'h0)] : reg61[(4'h9):(3'h6)]))});
  assign wire65 = wire37;
endmodule
