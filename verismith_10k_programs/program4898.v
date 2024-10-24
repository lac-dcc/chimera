module top
#(parameter param86 = (&(8'hb9)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  assign y = {wire85, wire84, wire82, wire6, wire5, (1'h0)};
  assign wire5 = (wire1 ?
                     wire0 : (wire0 >= $unsigned($signed(((7'h44) ?
                         (8'ha9) : wire2)))));
  assign wire6 = (|{(8'hb7), $signed({wire5})});
  module7 #() modinst83 (wire82, clk, wire4, wire6, wire5, wire1);
  assign wire84 = wire3;
  assign wire85 = $signed(($signed((8'hb1)) ?
                      $unsigned($unsigned(wire0)) : $unsigned($signed((wire2 || wire2)))));
endmodule

module module7
#(parameter param81 = (((((~(8'hb0)) ? (|(8'h9d)) : (!(8'h9c))) == ((~|(8'ha2)) && ((8'hae) == (8'hba)))) < ((&(!(8'ha9))) ? (~{(8'hac)}) : (~|(^(8'hb0))))) >>> {((~((8'hbb) ? (8'had) : (8'ha3))) | (8'hae)), (8'ha3)}))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 (1'h0)};
  assign wire12 = (wire10[(3'h7):(2'h2)] | wire9);
  assign wire13 = $signed(({{(!wire10), (!(8'hb8))}} | wire9));
  assign wire14 = wire10;
  assign wire15 = $signed((wire12 ^~ (8'hbd)));
  module16 #() modinst75 (.clk(clk), .wire18(wire12), .wire20(wire13), .wire19(wire15), .y(wire74), .wire17(wire8));
  assign wire76 = (wire10 > (($unsigned(wire14[(1'h1):(1'h0)]) ~^ $signed(wire13)) ^ wire13));
  assign wire77 = ($unsigned($signed((7'h40))) ?
                      (wire14 + wire76) : wire15[(2'h3):(2'h3)]);
  assign wire78 = {(8'hb7)};
  assign wire79 = wire78;
  assign wire80 = wire14;
endmodule

module module16
#(parameter param73 = (8'hb6))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h26c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire20;
  input wire [(2'h3):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire21;
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  assign y = {wire72,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire21,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
                 (1'h0)};
  assign wire21 = ($signed(((^wire20[(4'hf):(3'h6)]) ?
                      ($signed(wire18) | (wire17 ?
                          wire19 : wire17)) : wire17)) <= wire18);
  always
    @(posedge clk) begin
      reg22 <= {($unsigned($signed($unsigned(wire20))) != wire17),
          wire19[(1'h0):(1'h0)]};
      if ((!((8'h9c) ? (^~wire19[(1'h1):(1'h1)]) : (^~wire20[(1'h0):(1'h0)]))))
        begin
          reg23 <= $unsigned(wire17);
        end
      else
        begin
          reg23 <= (reg22[(4'h9):(1'h1)] <<< (($unsigned($signed((8'ha8))) > $unsigned((-wire21))) ?
              wire21[(3'h7):(1'h1)] : wire21[(4'hd):(2'h3)]));
          reg24 <= reg23;
        end
      reg25 <= wire21;
      reg26 <= $unsigned({(reg23 & reg24[(2'h3):(1'h0)]), (~&wire21)});
      if ($unsigned(({(8'hb1)} ?
          (reg26 ?
              (reg24[(1'h1):(1'h1)] ?
                  reg23[(2'h3):(2'h2)] : $signed(reg26)) : reg24) : (wire19[(2'h3):(2'h3)] ~^ (~&$signed(reg25))))))
        begin
          reg27 <= ((reg23 <<< reg26) >> reg22[(4'he):(3'h6)]);
          reg28 <= $unsigned(wire17[(1'h1):(1'h1)]);
          reg29 <= wire17;
          if ((((+((reg29 ?
                  (8'ha0) : reg24) - (wire20 * (8'hae)))) >= (^{(|(7'h40))})) ?
              wire19[(2'h2):(1'h0)] : $unsigned((wire20 ?
                  ((reg23 >>> reg25) ?
                      (reg24 << wire20) : {reg23,
                          (7'h44)}) : $unsigned(wire17)))))
            begin
              reg30 <= {$unsigned(({reg25, $signed(reg23)} ?
                      wire19 : (wire20[(5'h13):(4'hd)] >> $signed(reg27))))};
              reg31 <= $unsigned((($signed($unsigned(reg27)) ?
                  ((|wire19) & $signed(wire21)) : reg27) >= (!reg26[(2'h2):(2'h2)])));
            end
          else
            begin
              reg30 <= $signed(($unsigned(($unsigned(wire21) ?
                  $unsigned(reg29) : $signed(reg31))) << (+({reg23, reg23} ?
                  wire18[(3'h6):(2'h2)] : $unsigned((8'hb7))))));
              reg31 <= $unsigned((^~$signed($signed((wire20 ?
                  reg25 : wire21)))));
              reg32 <= ((reg27 ? reg26[(1'h0):(1'h0)] : wire17) ?
                  reg28 : reg31[(4'he):(3'h6)]);
              reg33 <= wire18;
              reg34 <= ($unsigned(($signed($unsigned((8'hb0))) ?
                  reg33 : reg32[(2'h2):(1'h0)])) >= $unsigned((!reg24[(4'h8):(3'h5)])));
            end
        end
      else
        begin
          reg27 <= reg31[(4'hb):(4'hb)];
          reg28 <= wire19;
          if (wire21)
            begin
              reg29 <= reg29[(2'h2):(1'h0)];
            end
          else
            begin
              reg29 <= wire19[(2'h2):(1'h1)];
              reg30 <= $unsigned(wire20);
              reg31 <= ($signed((~&reg31[(2'h3):(1'h1)])) == $signed($signed($unsigned(wire19))));
            end
          if ($unsigned($signed({$unsigned((wire17 >= reg26)),
              $signed(wire20)})))
            begin
              reg32 <= (&$unsigned(reg32));
              reg33 <= (($signed(reg23[(4'h8):(1'h1)]) ?
                      {{wire17[(1'h0):(1'h0)]}} : reg29) ?
                  ((wire21 >>> ($signed(wire18) ?
                      (~&wire17) : (^wire17))) & (~^((reg23 <= reg26) ?
                      $signed(wire20) : reg31))) : (reg29 ?
                      (($unsigned(wire20) ? reg24[(1'h1):(1'h0)] : reg27) ?
                          ($unsigned(reg34) ?
                              wire17[(2'h2):(1'h0)] : (reg24 > reg30)) : (~((8'ha6) | wire20))) : ($unsigned($unsigned(wire17)) ?
                          {(wire18 - wire18),
                              ((8'ha4) || reg29)} : reg33[(1'h1):(1'h0)])));
              reg34 <= reg31;
              reg35 <= reg30[(1'h0):(1'h0)];
              reg36 <= $unsigned(reg24);
            end
          else
            begin
              reg32 <= ((~&{(reg27[(1'h0):(1'h0)] ?
                          $unsigned(reg24) : reg25[(3'h6):(3'h4)]),
                      wire18}) ?
                  (&(|reg22)) : reg24);
              reg33 <= $unsigned((+($unsigned((~&reg36)) ?
                  (wire21 ? (8'ha4) : (reg31 ? wire20 : reg33)) : reg30)));
            end
          reg37 <= reg27[(3'h4):(1'h1)];
        end
    end
  assign wire38 = (~|((wire18[(4'h9):(1'h0)] < (reg25[(4'h8):(2'h2)] ?
                      $unsigned(reg25) : {wire20})) ^ $signed(((!reg30) ?
                      (reg31 ^~ (8'hbc)) : reg37[(4'h8):(3'h6)]))));
  assign wire39 = reg31;
  assign wire40 = {({$unsigned((^~(8'hb6)))} ?
                          $signed(({reg22,
                              reg31} != (-reg27))) : (((~&wire20) >>> (reg27 - wire39)) > ((~|wire21) ?
                              $unsigned((8'h9e)) : wire21[(3'h6):(2'h3)]))),
                      $unsigned($signed(wire38))};
  assign wire41 = (($unsigned(($signed(reg32) ?
                      wire18[(3'h6):(3'h6)] : $unsigned(reg27))) | ($signed($signed(wire20)) >= (~(-wire19)))) < ({reg24[(3'h7):(3'h6)],
                          reg36} ?
                      $signed(($unsigned(reg25) & $unsigned(reg22))) : ($signed($signed(reg22)) ?
                          ((8'hae) * ((8'hb7) ?
                              wire20 : reg32)) : reg25[(4'h8):(3'h5)])));
  always
    @(posedge clk) begin
      if ((reg26[(2'h3):(2'h3)] ?
          $unsigned(($signed($unsigned(reg37)) == ($signed((8'ha4)) ^ {reg35}))) : (((((8'hbc) ?
                          reg30 : (8'hb0)) ?
                      $signed((8'hb0)) : $signed(reg22)) ?
                  reg23 : reg28) ?
              wire18[(4'hc):(1'h1)] : (reg24 * $unsigned((!wire17))))))
        begin
          reg42 <= ((8'ha0) < ($unsigned((8'hbb)) ?
              ($signed({wire19}) ?
                  reg37[(3'h4):(2'h2)] : reg35[(3'h7):(2'h2)]) : ((reg26 ?
                  (reg34 ?
                      reg34 : reg30) : reg36) <<< $signed($unsigned(wire19)))));
          if ($signed($signed((wire20 ?
              $signed(reg29[(2'h2):(1'h0)]) : $signed((+reg35))))))
            begin
              reg43 <= (^wire18);
              reg44 <= (|($unsigned(reg29) != ((reg24 <<< (-wire17)) ^ ($signed(reg30) - (reg27 != (8'hb5))))));
              reg45 <= $unsigned(reg32);
            end
          else
            begin
              reg43 <= reg22;
              reg44 <= {$signed((-($unsigned(wire21) & $unsigned(reg34))))};
              reg45 <= reg34;
            end
          if (($signed(wire17) - $unsigned(($signed(reg22[(4'hb):(4'hb)]) ?
              (7'h44) : wire39))))
            begin
              reg46 <= ($unsigned(wire39) ~^ (^$unsigned($signed((wire39 ?
                  wire40 : (8'ha6))))));
              reg47 <= reg27;
            end
          else
            begin
              reg46 <= $signed(((&$unsigned($signed(reg36))) ?
                  (8'h9f) : $unsigned(reg26)));
              reg47 <= $unsigned(wire38[(4'ha):(3'h7)]);
              reg48 <= (($signed((((7'h40) ?
                  reg36 : wire19) || (reg29 >= wire41))) > (reg23[(4'ha):(4'ha)] ?
                  (!reg31) : $unsigned((reg44 - reg45)))) >= $signed(((((8'hbe) | reg31) ?
                      $signed(reg32) : (reg43 != wire21)) ?
                  $unsigned({wire21, reg43}) : $signed((reg32 | reg32)))));
            end
          reg49 <= (|$unsigned($unsigned((~&(~|wire17)))));
          reg50 <= (wire20 ?
              {{($signed(reg23) != wire41[(1'h0):(1'h0)]),
                      {reg45, $unsigned(reg49)}}} : ((($unsigned(reg27) ?
                  reg46 : $signed(reg42)) >>> (&(reg23 == reg35))) | $signed({(~^reg37),
                  wire38[(4'h9):(2'h3)]})));
        end
      else
        begin
          reg42 <= (-reg48);
        end
    end
  always
    @(posedge clk) begin
      reg51 <= $signed((($signed({reg48, (8'ha5)}) ?
          (wire20 + $unsigned((7'h40))) : (^$unsigned(reg44))) != $unsigned($signed($unsigned(reg50)))));
      if ((reg45 > ((((wire41 || reg24) >= $signed(reg23)) ?
          (|(|reg28)) : reg28) & (8'h9c))))
        begin
          reg52 <= ((~|$signed($signed({reg51, reg43}))) ?
              reg31 : $signed((reg36 != ({reg51, wire19} ?
                  reg34[(1'h1):(1'h1)] : (reg42 ? reg24 : reg48)))));
          reg53 <= (reg30 ? (8'h9d) : reg48[(5'h10):(4'hc)]);
        end
      else
        begin
          reg52 <= (-reg47[(3'h6):(3'h5)]);
          reg53 <= $unsigned((~&reg23[(3'h5):(2'h3)]));
          reg54 <= $signed($unsigned(reg35[(4'ha):(3'h4)]));
          reg55 <= ((reg37[(3'h4):(2'h2)] >= $signed($signed($unsigned((8'hbc))))) ?
              (!wire40[(4'hc):(3'h5)]) : (+$signed(wire19[(2'h3):(1'h0)])));
        end
      if (($unsigned((8'hbb)) ? $signed(reg25) : {$signed({reg54})}))
        begin
          reg56 <= ({reg27[(1'h1):(1'h0)]} ?
              $unsigned(($unsigned((~|reg49)) ?
                  $unsigned((reg52 ?
                      (8'had) : wire17)) : $signed((8'ha7)))) : $unsigned(((!(reg24 <<< reg46)) ?
                  reg26 : $signed($unsigned((8'hb0))))));
          reg57 <= {(reg48 ?
                  $unsigned(reg46[(2'h2):(1'h0)]) : (~^{{(8'hbe)},
                      $signed(reg24)}))};
        end
      else
        begin
          if (reg49[(3'h5):(2'h2)])
            begin
              reg56 <= reg53;
              reg57 <= (($signed((8'hb2)) >>> reg29) ?
                  wire17 : $unsigned((((^~wire20) ^ wire40) == (~|$signed((8'hbd))))));
              reg58 <= $signed({$unsigned((reg33 ? {wire20} : $signed(reg36))),
                  $signed(((reg37 ? reg32 : wire19) >= (reg30 ?
                      reg47 : (8'haa))))});
            end
          else
            begin
              reg56 <= ((~|({$unsigned(reg22), reg49} ?
                      $signed((reg37 ?
                          wire40 : reg51)) : (!reg50[(3'h6):(1'h1)]))) ?
                  $signed(reg56[(5'h13):(4'hd)]) : $unsigned(({$unsigned(wire39)} ?
                      (&$unsigned(reg24)) : reg22)));
              reg57 <= (|$signed($signed((8'hb6))));
              reg58 <= $signed($unsigned((!($unsigned(reg30) ~^ $unsigned(reg33)))));
              reg59 <= $unsigned($unsigned((^$unsigned(reg22))));
            end
          reg60 <= reg55;
        end
      if (reg49)
        begin
          reg61 <= {$signed(reg22[(3'h6):(1'h0)])};
          reg62 <= (^(~^(($unsigned(reg27) + reg59[(3'h6):(2'h2)]) <= (8'h9f))));
        end
      else
        begin
          if ((reg37 ? $unsigned(reg51) : reg52[(5'h10):(4'hb)]))
            begin
              reg61 <= (($signed($signed(reg51[(1'h0):(1'h0)])) < ($unsigned(((8'h9e) + reg23)) ?
                  (reg23 ? $signed(reg29) : (^~reg43)) : $unsigned(((8'h9e) ?
                      reg61 : reg58)))) <= {$unsigned({$signed((8'hab))}),
                  (((8'hbd) ?
                      $unsigned(reg51) : $unsigned(reg54)) <= reg50[(3'h6):(1'h0)])});
              reg62 <= reg36;
              reg63 <= {reg59};
              reg64 <= $unsigned($unsigned(({reg51, (reg29 + wire21)} ?
                  $unsigned((8'hb1)) : (8'hb4))));
            end
          else
            begin
              reg61 <= reg43[(4'h8):(3'h6)];
            end
          if (reg54[(2'h2):(2'h2)])
            begin
              reg65 <= (+(+$unsigned($unsigned($unsigned(reg43)))));
              reg66 <= $signed($signed(reg26));
            end
          else
            begin
              reg65 <= reg28;
              reg66 <= $unsigned({$signed(reg36), wire41[(1'h0):(1'h0)]});
            end
        end
      if (((^reg29) << wire41))
        begin
          if (($signed((reg46[(1'h1):(1'h0)] ?
              $unsigned((|(8'h9c))) : reg44[(1'h1):(1'h0)])) >>> reg58[(3'h4):(3'h4)]))
            begin
              reg67 <= $signed(({{reg57}} ?
                  (wire21 | $signed({reg31})) : reg64[(3'h5):(2'h3)]));
              reg68 <= (+reg30);
              reg69 <= $unsigned($signed(((8'had) ? reg44 : (^reg47))));
            end
          else
            begin
              reg67 <= ((reg47 ?
                  $signed(wire40) : ((reg50 ? (&reg52) : reg29) && ({reg28,
                          reg36} ?
                      (reg66 ? reg67 : reg34) : $signed((8'h9d))))) & reg56);
            end
          reg70 <= reg50[(1'h1):(1'h1)];
          reg71 <= reg28[(3'h7):(3'h5)];
        end
      else
        begin
          reg67 <= $signed((reg62[(2'h3):(1'h1)] | reg43[(1'h0):(1'h0)]));
          reg68 <= {$signed(reg51[(3'h7):(3'h7)]), reg68[(3'h4):(1'h1)]};
          reg69 <= reg34[(5'h11):(1'h1)];
          reg70 <= ($signed((-{$signed(reg29)})) ?
              $signed(reg42) : $signed(reg67[(4'ha):(4'h9)]));
          reg71 <= reg31[(4'ha):(3'h5)];
        end
    end
  assign wire72 = $signed($unsigned((reg51 >= ($unsigned(reg44) ~^ reg66[(4'hd):(4'h9)]))));
endmodule
