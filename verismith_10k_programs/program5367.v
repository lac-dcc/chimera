module top
#(parameter param86 = {((+(-((8'ha1) ? (8'h9f) : (8'ha6)))) >> {{((8'hab) ? (8'h9e) : (8'hbc))}, {{(8'hb4), (8'hbf)}}}), (~|((^((8'ha6) ? (8'hab) : (8'h9c))) | ((~(8'haa)) ? (8'hbd) : ((8'hb0) >>> (8'hac)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire85;
  wire [(3'h4):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire signed [(5'h10):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire45;
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire66,
                 wire47,
                 wire45,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  module4 #() modinst46 (.wire6(wire2), .wire8(wire0), .wire7(wire1), .wire9(wire3), .wire5((8'hb5)), .y(wire45), .clk(clk));
  assign wire47 = $signed($signed(wire3[(2'h3):(1'h0)]));
  module48 #() modinst67 (.wire49(wire0), .wire51(wire2), .y(wire66), .clk(clk), .wire52(wire47), .wire50(wire3));
  always
    @(posedge clk) begin
      reg68 <= ($unsigned((|$unsigned((-wire47)))) >= {wire0,
          (((wire47 ? wire2 : wire47) <= $signed((8'hbd))) < ($unsigned(wire2) ?
              $unsigned(wire45) : $signed(wire0)))});
      reg69 <= $unsigned((~((^$unsigned(wire66)) ?
          reg68 : wire3[(4'hc):(1'h1)])));
      reg70 <= wire2[(4'h8):(2'h3)];
      reg71 <= $signed($unsigned(wire2[(1'h0):(1'h0)]));
    end
  always
    @(posedge clk) begin
      if ({wire66[(4'h8):(1'h1)]})
        begin
          reg72 <= reg70;
          if (wire2[(3'h7):(3'h4)])
            begin
              reg73 <= (~^wire66);
              reg74 <= ($unsigned((&(-$signed(reg72)))) ?
                  $signed((+(8'ha7))) : ({$signed(wire66)} ?
                      ($signed((wire45 ? wire66 : wire47)) ?
                          $signed((|reg70)) : wire66[(1'h1):(1'h1)]) : $signed((((7'h44) >> reg70) & (-wire47)))));
              reg75 <= reg74;
            end
          else
            begin
              reg73 <= $signed({$signed((~^((8'h9d) ? reg71 : reg75))),
                  reg74[(2'h3):(2'h2)]});
              reg74 <= ((^wire0[(2'h2):(2'h2)]) & wire1);
              reg75 <= $signed(($signed(($signed(reg69) >= reg69)) ?
                  $signed(wire66) : $unsigned(($unsigned((7'h40)) ?
                      reg68 : (reg69 ~^ wire3)))));
            end
          reg76 <= reg71[(3'h4):(2'h2)];
          reg77 <= ((|(reg73[(3'h5):(3'h4)] << $signed(((8'hae) == wire45)))) && wire3);
        end
      else
        begin
          if ((8'haa))
            begin
              reg72 <= (reg77 ? (|$unsigned(reg76)) : wire1[(4'hb):(3'h5)]);
              reg73 <= wire45;
              reg74 <= (($unsigned($signed(reg69[(3'h5):(3'h5)])) || {(+$signed(wire45))}) ?
                  {reg73[(4'hd):(2'h3)],
                      ({(wire47 ? reg76 : reg71), $signed(wire66)} ?
                          $unsigned($signed(wire2)) : $signed(wire2[(3'h5):(2'h2)]))} : reg73[(4'h8):(4'h8)]);
              reg75 <= reg75;
              reg76 <= ((reg68 < $signed(wire45)) || ((~&(~&(reg73 ?
                  wire66 : wire66))) | reg73[(4'hb):(3'h5)]));
            end
          else
            begin
              reg72 <= $unsigned($signed((^~(((7'h44) ?
                  wire47 : wire0) >= (wire2 ? (8'hbf) : wire3)))));
              reg73 <= $signed($unsigned({$unsigned((reg68 >> (8'haf))),
                  $unsigned((reg74 < (8'hb1)))}));
              reg74 <= ((reg72[(2'h2):(2'h2)] ?
                  {(|(wire3 >= reg76)),
                      (+(reg70 == wire47))} : {$signed($signed(reg74)),
                      (^~reg75[(2'h3):(2'h3)])}) >>> $unsigned((reg69 <<< $unsigned($signed(wire66)))));
            end
          reg77 <= $unsigned(reg77);
          reg78 <= (~|($unsigned((~|$signed((8'hb8)))) ?
              ({reg72[(3'h7):(1'h0)],
                  $signed(wire66)} < (&(reg70 >> reg72))) : {reg68,
                  $unsigned(wire45[(2'h2):(1'h1)])}));
        end
      reg79 <= $signed({((~&reg76) ?
              (-reg76[(1'h0):(1'h0)]) : ((-wire66) | wire3[(3'h5):(3'h4)])),
          (wire66 ?
              (((8'h9e) + (8'ha0)) ?
                  $unsigned(wire3) : (~|(8'h9d))) : $unsigned((~|reg68)))});
      reg80 <= $signed($signed(wire1[(3'h6):(2'h2)]));
    end
  assign wire81 = (wire47[(5'h11):(4'hc)] ?
                      (reg71 | (+(&(reg78 >>> reg80)))) : $signed(wire1));
  assign wire82 = $unsigned((+{{(+wire2)}}));
  assign wire83 = reg73[(5'h11):(4'he)];
  assign wire84 = (({{$signed((8'ha7)), (-wire1)}, wire0} ?
                      reg72[(3'h4):(2'h3)] : wire47) * ((&{{reg76}, reg71}) ?
                      wire2 : ((8'haa) ?
                          $unsigned((wire66 ?
                              wire45 : (8'hb6))) : wire1[(4'h8):(3'h4)])));
  assign wire85 = (+$signed(reg78[(2'h3):(2'h3)]));
endmodule

module module48
#(parameter param65 = ((({((8'ha4) ? (8'ha2) : (8'hbf)), ((8'hb7) ? (8'hb8) : (8'hbe))} ? (((8'ha2) ? (8'h9d) : (8'hb0)) ? {(8'hb5), (8'hbb)} : {(8'hb2)}) : ({(8'hbb)} ? ((7'h43) || (7'h43)) : (|(8'ha9)))) ? (({(8'hb7)} ? ((8'hb7) < (7'h43)) : ((8'hba) != (8'hae))) <<< (((7'h42) ? (8'hb7) : (8'hae)) ? (!(8'hab)) : (!(7'h44)))) : (((~(7'h42)) >> (~&(8'haa))) ? (~|((7'h42) ? (8'haf) : (8'hb8))) : (|(~&(8'ha8))))) ? ({(+(~|(8'hbb)))} ? {(8'ha6), ((^(8'ha5)) ? (~|(8'had)) : ((8'hb4) ? (8'hbb) : (8'hb2)))} : (+((8'hb3) ~^ ((8'h9e) & (7'h40))))) : (((((8'hbf) ^ (8'hb8)) && (~(8'ha2))) - (((8'ha0) ? (7'h41) : (7'h42)) ? ((8'ha8) ? (8'hbf) : (8'hba)) : (-(8'ha1)))) >>> ({((8'hbd) ? (7'h40) : (8'hbc))} <<< (~^((7'h44) <<< (8'haf)))))))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire52;
  input wire signed [(3'h4):(1'h0)] wire51;
  input wire [(4'hf):(1'h0)] wire50;
  input wire [(3'h7):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire53 = $unsigned(((~|$signed((wire49 || wire49))) << ({((8'h9c) ?
                              wire51 : wire50),
                          $unsigned(wire49)} ?
                      (~&{wire49}) : (^~(wire49 <<< wire51)))));
  assign wire54 = (~$signed($unsigned($unsigned($signed(wire52)))));
  assign wire55 = $signed(($signed(wire53) || wire53[(2'h3):(1'h1)]));
  assign wire56 = {wire53};
  always
    @(posedge clk) begin
      if ($signed(wire51[(1'h0):(1'h0)]))
        begin
          reg57 <= $unsigned({(~$unsigned((&wire55))),
              (wire55 == {$unsigned(wire50)})});
          reg58 <= (7'h44);
          reg59 <= wire50;
        end
      else
        begin
          reg57 <= (8'hb9);
          if ($signed($unsigned((~^$signed({reg59, (8'ha2)})))))
            begin
              reg58 <= wire52[(5'h12):(4'he)];
            end
          else
            begin
              reg58 <= (~wire55[(3'h6):(1'h1)]);
              reg59 <= ($unsigned(wire49) << {(~^((!reg57) ?
                      wire50[(4'hb):(3'h6)] : $unsigned(reg58)))});
              reg60 <= (wire49[(3'h5):(1'h0)] || wire49);
            end
        end
      reg61 <= wire50;
      reg62 <= (({$signed(wire49),
          $signed((&reg61))} ^~ {($signed(reg59) < $signed(reg58))}) == (^~wire52[(4'hd):(2'h2)]));
      reg63 <= (&(((reg60 + $unsigned(wire56)) < $signed(reg62[(3'h4):(3'h4)])) ^~ $unsigned(wire50[(4'hd):(1'h0)])));
      reg64 <= {$signed($signed(reg59[(4'hc):(1'h0)]))};
    end
endmodule

module module4
#(parameter param43 = ({((((8'hb6) > (7'h43)) ? ((8'ha5) == (7'h43)) : ((8'ha2) ? (8'ha9) : (8'hb5))) <<< (((8'hbe) ? (8'hba) : (8'ha4)) ? (8'hba) : ((8'h9c) - (8'hab))))} ? ({(((8'hb5) ? (8'hb2) : (7'h41)) <= ((8'haf) ? (8'h9c) : (8'hab))), (~|(~(7'h44)))} & (^~{(&(8'hb5))})) : {{((~|(8'ha7)) || ((8'h9d) ? (7'h42) : (8'hb5))), (((8'hbb) ? (7'h41) : (8'hbd)) ? (~&(8'hb2)) : ((8'hac) ? (8'had) : (7'h41)))}}), 
parameter param44 = (((param43 - param43) >= {param43, ((param43 | (7'h41)) >= param43)}) > param43))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  assign y = {reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= (wire8 << {wire9});
      reg11 <= wire9[(1'h1):(1'h0)];
      if (wire6[(2'h3):(2'h3)])
        begin
          reg12 <= (wire6[(3'h5):(1'h0)] ?
              ({(~^reg10[(1'h0):(1'h0)]),
                  $unsigned((!wire5))} || $unsigned(reg11[(4'hf):(1'h0)])) : wire8);
          reg13 <= wire6[(1'h1):(1'h1)];
          if (((^((~&(8'ha0)) ?
                  (&(wire7 * wire8)) : ((wire5 <<< (8'haf)) ?
                      (wire7 && wire6) : (^~(8'hb1))))) ?
              (~&(({wire9,
                  wire6} + $signed(wire9)) == reg11[(5'h10):(1'h1)])) : ((&(8'hba)) ?
                  wire8 : $unsigned((-{reg12, reg13})))))
            begin
              reg14 <= (~^((!reg10[(2'h2):(1'h1)]) << (8'ha6)));
              reg15 <= {((wire8[(4'ha):(4'h9)] > (reg11 != ((8'hb8) | wire8))) | (({reg12} ?
                          wire7 : wire6) ?
                      ($unsigned(wire9) ?
                          (reg14 ? wire8 : wire5) : {wire6, wire6}) : reg13)),
                  wire6[(1'h1):(1'h1)]};
              reg16 <= ({($signed(reg15[(3'h5):(1'h1)]) - {(reg11 | (8'hb8)),
                      $unsigned(reg14)})} | $unsigned(wire7));
              reg17 <= reg11[(4'h8):(4'h8)];
              reg18 <= (~^reg12);
            end
          else
            begin
              reg14 <= reg17[(3'h6):(2'h2)];
            end
          reg19 <= (wire7 >= $unsigned(wire7[(2'h2):(2'h2)]));
          reg20 <= $signed(reg12);
        end
      else
        begin
          reg12 <= $signed(wire9);
          reg13 <= ($unsigned(reg12[(4'hc):(3'h4)]) ?
              wire5[(3'h5):(3'h5)] : $signed(wire6[(3'h4):(2'h2)]));
          reg14 <= $unsigned(reg12);
          reg15 <= ((wire8 ?
              wire9[(1'h0):(1'h0)] : reg16[(4'ha):(3'h4)]) < (+$unsigned((~^((8'ha1) ?
              wire6 : reg19)))));
        end
      reg21 <= $signed(({(^wire7)} ?
          $signed(wire7[(3'h7):(3'h5)]) : $unsigned(reg20[(2'h3):(2'h3)])));
      reg22 <= $signed($unsigned((~((reg13 || (8'h9d)) ^ reg18))));
    end
  always
    @(posedge clk) begin
      reg23 <= (^~wire8[(1'h1):(1'h1)]);
      reg24 <= (8'ha0);
      reg25 <= (^~$signed($signed($unsigned((reg17 ? reg20 : reg21)))));
      if ($unsigned(({$signed((-wire7))} ?
          $signed({wire8}) : {reg12[(5'h12):(5'h11)],
              $signed($signed(reg11))})))
        begin
          if ($signed($unsigned($unsigned(reg10))))
            begin
              reg26 <= wire8;
              reg27 <= (8'hbe);
            end
          else
            begin
              reg26 <= reg12[(5'h12):(2'h3)];
              reg27 <= $unsigned((reg26[(5'h11):(4'he)] ?
                  (wire7 >= $signed($signed(reg17))) : ($signed((8'ha5)) != (reg22[(3'h5):(1'h0)] <<< (reg25 ?
                      reg18 : reg19)))));
              reg28 <= reg19[(3'h4):(2'h2)];
              reg29 <= $unsigned(wire6);
            end
          reg30 <= $signed((8'hb6));
          reg31 <= (^~(~^(&$signed($unsigned(reg18)))));
          reg32 <= reg23[(1'h0):(1'h0)];
          if (reg23)
            begin
              reg33 <= $unsigned(((^~$signed($signed(reg14))) ?
                  $unsigned(reg12) : (+wire7)));
              reg34 <= $unsigned({{reg13, $unsigned(wire7)}});
              reg35 <= ({(((+(8'hb2)) ? $signed(reg14) : (~reg23)) >> (!(reg17 ?
                      reg10 : reg14)))} + (~reg31));
              reg36 <= ({$signed(reg32[(4'hb):(4'hb)])} ?
                  ((^reg32[(4'h8):(4'h8)]) ?
                      reg27[(1'h0):(1'h0)] : reg16[(4'h9):(2'h2)]) : ((($unsigned((8'hbd)) ?
                          (~reg20) : reg20[(2'h2):(1'h0)]) ?
                      ((&reg21) ?
                          (-reg11) : $unsigned(reg27)) : (-$unsigned((8'h9e)))) >= $signed((|reg22))));
              reg37 <= ((reg32 != reg13[(1'h1):(1'h0)]) + $signed((!$signed({reg16,
                  (8'hb4)}))));
            end
          else
            begin
              reg33 <= reg23;
              reg34 <= ($unsigned(reg37) ?
                  (reg10[(3'h6):(1'h1)] <<< ($unsigned($unsigned((8'h9f))) + $unsigned({reg30}))) : (^~(!(+(wire5 ?
                      reg15 : (8'hb6))))));
            end
        end
      else
        begin
          if (($unsigned(reg14[(1'h1):(1'h1)]) ?
              (-reg37) : {(reg25[(2'h2):(1'h0)] > reg12[(4'hd):(1'h0)]),
                  $unsigned($signed($unsigned(reg16)))}))
            begin
              reg26 <= {reg35[(4'hb):(4'hb)],
                  $signed((reg15 ? wire9 : ((!reg27) - reg33)))};
              reg27 <= (8'ha0);
              reg28 <= $signed(reg32);
              reg29 <= ((~^wire8) != $signed({{(~^reg22)}}));
            end
          else
            begin
              reg26 <= (wire6[(2'h2):(1'h1)] ?
                  ((+((-(8'hb0)) ?
                      (-reg34) : $signed(reg14))) < reg14[(2'h3):(1'h0)]) : ($unsigned((((8'ha2) ?
                      reg34 : reg29) * reg13)) >> (reg21[(1'h1):(1'h0)] + {{(8'ha4)}})));
              reg27 <= ($signed((|reg11)) ? (~^reg20[(3'h6):(2'h2)]) : reg34);
              reg28 <= reg26;
              reg29 <= $signed($signed(reg34));
              reg30 <= reg21;
            end
        end
    end
  always
    @(posedge clk) begin
      reg38 <= (~|((~^wire9) ?
          (((~reg19) >>> reg23[(4'hc):(2'h2)]) ^ $unsigned(reg19[(1'h0):(1'h0)])) : wire5[(4'h9):(2'h2)]));
    end
  always
    @(posedge clk) begin
      if (({(|($unsigned(reg30) ?
              $unsigned(reg34) : {reg23}))} << $signed($unsigned((^~$signed(reg36))))))
        begin
          reg39 <= reg29;
          reg40 <= ({reg25[(2'h3):(2'h3)]} == (~|(^~reg15[(3'h7):(3'h7)])));
          reg41 <= ((&(reg34 ?
              $unsigned($unsigned(reg29)) : $signed((~&reg34)))) && ($signed(reg22[(4'hf):(3'h5)]) ?
              $signed($signed((^reg34))) : $unsigned(reg37)));
          reg42 <= reg35;
        end
      else
        begin
          reg39 <= (^reg28[(1'h1):(1'h0)]);
          reg40 <= $signed(((wire8[(2'h3):(1'h0)] ?
              $signed(reg14[(2'h3):(2'h3)]) : $unsigned(reg10)) << (^$unsigned((8'haf)))));
        end
    end
endmodule
