module top
#(parameter param84 = (~(((((8'hbf) ? (8'ha4) : (8'ha1)) <= ((8'haf) || (8'ha4))) == (8'ha3)) ? {(((8'hbf) ? (8'ha9) : (8'ha5)) ~^ ((8'ha0) ? (8'ha5) : (8'ha8)))} : ((8'hb1) >= (^~((8'hb8) && (8'hb0)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire65,
                 wire63,
                 wire5,
                 wire4,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg77,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire4 = wire1[(2'h3):(2'h3)];
  assign wire5 = ((((~|$signed(wire4)) & ((~|wire2) ?
                     (-wire3) : wire2)) ~^ (-wire4[(2'h2):(1'h0)])) ^ wire2[(1'h0):(1'h0)]);
  module6 #() modinst64 (wire63, clk, wire2, wire3, wire0, wire4);
  assign wire65 = wire63[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg66 <= (($unsigned(((wire3 - wire5) ?
              (wire0 | wire5) : (+wire4))) <= {wire63[(1'h1):(1'h1)]}) ?
          $unsigned({$signed((wire2 ? wire5 : wire3)),
              wire5[(3'h7):(1'h1)]}) : {wire5[(3'h5):(2'h2)],
              wire5[(2'h2):(2'h2)]});
      reg67 <= ((8'hb4) ? wire1 : {(7'h44), $unsigned((^~(&wire1)))});
      reg68 <= $signed((+$unsigned((~^((8'ha2) + wire63)))));
    end
  assign wire69 = (~|(($unsigned($unsigned((8'hb4))) & $signed((wire5 ?
                          wire5 : wire0))) ?
                      wire65[(1'h1):(1'h0)] : (+(&wire65))));
  assign wire70 = {(wire2 ?
                          {wire4,
                              ((reg66 >>> wire1) <= (wire69 ?
                                  wire1 : wire0))} : ({reg67[(2'h3):(1'h0)],
                                  wire65} ?
                              $unsigned($unsigned((8'hb0))) : (8'hba)))};
  assign wire71 = $signed(wire2);
  assign wire72 = wire3;
  assign wire73 = (~^$unsigned((~&wire1[(1'h1):(1'h0)])));
  assign wire74 = reg68[(4'ha):(1'h0)];
  assign wire75 = ((7'h42) != ($signed(((reg66 > wire3) ?
                          (~^wire65) : {wire71})) ?
                      $signed($unsigned(reg66[(5'h13):(4'h8)])) : (wire71 ?
                          (~(wire0 ?
                              (8'hab) : wire2)) : $unsigned({(8'haa)}))));
  assign wire76 = (^($unsigned($signed((8'hb2))) * $unsigned($signed((^~(7'h44))))));
  always
    @(posedge clk) begin
      reg77 <= $signed($unsigned($unsigned(wire65)));
    end
  assign wire78 = {(reg66[(5'h13):(3'h4)] ?
                          $unsigned((8'hbc)) : ({((8'had) != wire4)} ?
                              $signed($signed(wire69)) : $signed(((8'hae) ?
                                  wire74 : wire69))))};
  assign wire79 = ((wire65[(2'h3):(2'h3)] ?
                          $signed(reg66[(3'h6):(3'h4)]) : (~(!(8'hac)))) ?
                      wire75[(4'hc):(2'h3)] : ({(~&$signed((8'hbd))),
                              (wire69 <= $unsigned(wire5))} ?
                          (~{(wire70 ? wire1 : (8'hb9))}) : ({(&wire0),
                              (+wire78)} > $signed($signed(wire63)))));
  always
    @(posedge clk) begin
      reg80 <= (~|(((wire65[(3'h6):(3'h6)] ? {wire78, wire3} : (+wire63)) ?
              (~wire73[(3'h4):(1'h0)]) : $unsigned($unsigned(wire70))) ?
          ((|(^~reg66)) ?
              wire70 : wire69) : (wire73 <<< wire5[(3'h7):(2'h2)])));
      reg81 <= {$signed($unsigned(({(8'hab), wire69} ?
              (wire72 ? (8'hb7) : (8'ha7)) : (wire78 ? reg80 : reg68))))};
      reg82 <= (reg81[(1'h0):(1'h0)] ?
          wire71 : ($signed((!(|(8'hb3)))) ?
              (reg80 ?
                  wire65 : ($unsigned(wire63) ?
                      (~|wire70) : (wire79 ?
                          (8'hab) : wire0))) : $signed(wire72[(4'h9):(3'h6)])));
      reg83 <= $unsigned((|(wire4[(2'h3):(1'h1)] ?
          wire78 : $signed((reg80 ? wire0 : (8'hbc))))));
    end
endmodule

module module6
#(parameter param62 = ({{{(~^(8'hb7))}, ((&(8'hb1)) * ((8'hb6) || (7'h40)))}} ? (((((8'hb9) ? (8'hbc) : (8'hb3)) ? ((8'hbb) + (8'hbc)) : ((7'h43) ? (8'hbb) : (8'ha8))) << (((8'had) <<< (8'hbd)) >= ((8'hb5) && (8'hbf)))) ? (8'h9e) : (~|(((8'ha4) & (8'ha4)) ? ((8'hb2) ~^ (8'hbf)) : ((8'ha6) ? (8'hba) : (7'h42))))) : ({(|(~^(8'hb7)))} ? ({((8'ha7) ? (8'hab) : (8'ha0)), ((7'h41) ^ (8'hbc))} - {(!(8'ha7))}) : (((8'hbe) ? {(8'ha0), (7'h41)} : {(8'ha4), (8'h9d)}) ? ((|(8'hbf)) ? (~|(8'ha2)) : ((8'hbd) >= (8'h9c))) : (^~(|(8'hab)))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h241):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(2'h3):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire [(3'h4):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
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
                 (1'h0)};
  assign wire11 = (~(^~(8'ha8)));
  assign wire12 = ($unsigned(wire10) >>> $signed((-wire7[(2'h2):(2'h2)])));
  assign wire13 = (+($signed(($signed(wire8) ?
                          (wire10 < wire10) : $unsigned(wire10))) ?
                      (wire10 - (~|$signed(wire8))) : wire8));
  assign wire14 = wire8[(1'h0):(1'h0)];
  assign wire15 = wire9[(4'h9):(3'h7)];
  assign wire16 = ($unsigned(wire15[(5'h14):(2'h3)]) | ((wire8 || ((^~wire14) >>> $signed(wire14))) ?
                      ($signed(wire8) <= (^wire11[(3'h4):(3'h4)])) : (($unsigned(wire13) - $signed(wire8)) ?
                          wire14[(4'h9):(3'h6)] : wire14[(3'h6):(3'h5)])));
  assign wire17 = wire11;
  assign wire18 = $signed((~&wire9[(4'he):(2'h2)]));
  assign wire19 = (8'haf);
  always
    @(posedge clk) begin
      reg20 <= wire19;
      reg21 <= wire14[(3'h5):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg22 <= $signed(wire17);
      reg23 <= wire7[(4'h9):(1'h1)];
      reg24 <= (8'h9f);
      reg25 <= $unsigned($unsigned(reg20[(2'h3):(2'h2)]));
    end
  always
    @(posedge clk) begin
      if ({(&(|wire16)), {$signed(wire8[(1'h0):(1'h0)])}})
        begin
          reg26 <= wire16[(4'hb):(4'h8)];
          reg27 <= reg25;
          reg28 <= $signed((~|wire8[(1'h0):(1'h0)]));
          if (($unsigned((reg26[(3'h4):(2'h3)] ?
                  wire10[(3'h6):(2'h3)] : wire10[(4'hc):(3'h7)])) ?
              $signed($unsigned($signed((wire12 ?
                  wire15 : reg24)))) : $signed(wire7)))
            begin
              reg29 <= ((7'h44) >= (~^((reg26[(3'h4):(1'h1)] ?
                  (~|wire8) : reg22) >>> $signed((wire8 ? (8'hac) : wire14)))));
              reg30 <= reg25;
              reg31 <= (reg29[(4'hf):(4'hb)] == $signed((+$unsigned(reg23[(4'hc):(3'h6)]))));
              reg32 <= ($signed(({(wire14 >= reg25)} ?
                  reg23 : ($signed(reg21) ?
                      $signed((8'hb4)) : (~wire14)))) ^ (+reg25));
              reg33 <= wire7;
            end
          else
            begin
              reg29 <= (reg30[(3'h6):(3'h4)] ^ reg23);
            end
          if ({wire9[(4'h9):(2'h3)]})
            begin
              reg34 <= (^({wire17[(1'h0):(1'h0)]} ?
                  $unsigned((|(+reg23))) : ({reg25[(5'h10):(4'hb)]} | reg29[(3'h5):(1'h0)])));
              reg35 <= (($signed(($unsigned(wire16) <= (wire13 ?
                  wire14 : reg26))) >= $signed($unsigned($unsigned(reg30)))) | $signed(reg22));
              reg36 <= $signed(reg32[(2'h3):(2'h2)]);
              reg37 <= reg20;
              reg38 <= $unsigned($unsigned(reg36));
            end
          else
            begin
              reg34 <= $signed($unsigned(reg38));
            end
        end
      else
        begin
          reg26 <= reg34[(2'h3):(1'h0)];
        end
      reg39 <= $signed($unsigned((wire19 ? (8'ha9) : (7'h41))));
      if (reg39)
        begin
          if (wire9)
            begin
              reg40 <= (((~(8'hba)) ?
                      ($unsigned((reg37 ? wire10 : (7'h44))) && (|(wire17 ?
                          wire7 : wire8))) : (+{$unsigned(reg21)})) ?
                  (+wire7[(4'h8):(4'h8)]) : wire14[(4'h8):(4'h8)]);
              reg41 <= wire17[(2'h2):(1'h0)];
            end
          else
            begin
              reg40 <= ((8'hb7) ?
                  $unsigned((reg32 ?
                      (reg40 ?
                          $signed(wire12) : $unsigned(reg37)) : {wire11})) : (-($signed(reg23) ?
                      ((&wire18) ?
                          (wire14 ?
                              reg37 : (7'h42)) : (reg37 * wire14)) : $unsigned(((8'hb8) >>> reg27)))));
              reg41 <= $unsigned($unsigned(($signed($signed(reg32)) | ({wire16} >= (reg28 == reg24)))));
              reg42 <= ((reg21[(2'h3):(2'h3)] ?
                      ($unsigned($signed(reg28)) ^ (-reg35[(1'h0):(1'h0)])) : $unsigned(wire16)) ?
                  (reg30[(3'h7):(2'h3)] & ({reg39} ?
                      ($signed((8'h9d)) > (&reg37)) : reg21)) : $unsigned((reg39[(4'hf):(4'hd)] ?
                      reg29[(4'hb):(1'h1)] : wire18[(2'h2):(2'h2)])));
              reg43 <= {(wire7 - reg33[(3'h5):(1'h0)]), $unsigned(wire9)};
              reg44 <= ($signed(({$signed((8'hb4))} || (^(reg26 >>> reg24)))) ^ {reg21[(1'h1):(1'h0)]});
            end
          if (((~|(~^wire17)) ?
              $unsigned(wire19[(2'h2):(1'h1)]) : (wire19 + reg23)))
            begin
              reg45 <= $unsigned($unsigned(($signed((wire12 ^~ reg20)) ?
                  (~(wire11 ? reg21 : reg28)) : ((wire10 < wire7) ?
                      reg41[(4'h8):(1'h0)] : (^~reg20)))));
              reg46 <= (^{$signed($unsigned((^~(8'hb7))))});
            end
          else
            begin
              reg45 <= wire13;
            end
          if (reg36[(1'h1):(1'h0)])
            begin
              reg47 <= reg34[(2'h2):(1'h1)];
              reg48 <= wire12;
              reg49 <= (-$unsigned((-$signed(reg43[(3'h5):(2'h2)]))));
            end
          else
            begin
              reg47 <= reg46[(3'h5):(2'h3)];
              reg48 <= $unsigned((reg35 ~^ wire17));
              reg49 <= $unsigned(reg34[(3'h4):(3'h4)]);
              reg50 <= (8'h9c);
            end
          reg51 <= (~$signed((reg29 * $unsigned(reg35[(4'hb):(3'h5)]))));
          reg52 <= (($unsigned((~&(wire15 ? reg30 : reg45))) ?
                  ($unsigned((wire11 | reg36)) - (8'ha4)) : {reg43[(3'h5):(1'h1)]}) ?
              $signed(wire16[(4'hf):(3'h4)]) : $signed((reg34[(1'h1):(1'h0)] ?
                  wire11[(2'h2):(1'h1)] : wire16[(3'h4):(3'h4)])));
        end
      else
        begin
          reg40 <= $unsigned((reg28[(4'he):(4'hd)] ^~ (~^$unsigned({reg25}))));
          reg41 <= $unsigned(reg26[(1'h1):(1'h0)]);
          if ((reg47[(5'h13):(4'hd)] ? reg29 : wire8))
            begin
              reg42 <= (~&({(((8'ha9) ? reg52 : wire15) ?
                      (~reg31) : $unsigned(reg26))} ^~ wire12));
              reg43 <= {reg23[(5'h10):(2'h2)]};
              reg44 <= $unsigned($signed((($unsigned((8'hbb)) <<< wire16[(4'hd):(3'h5)]) ?
                  (wire17[(2'h2):(1'h1)] - $unsigned(reg21)) : {$unsigned(reg35),
                      (~|wire11)})));
            end
          else
            begin
              reg42 <= {(~&reg28[(4'hb):(3'h6)]),
                  $unsigned({reg25[(4'hc):(4'h8)], $unsigned(reg40)})};
              reg43 <= (^(((((8'hb6) ? reg35 : (8'hb4)) ?
                      $unsigned(reg32) : (wire10 << reg30)) ?
                  (|reg36) : {(reg50 + (7'h44)),
                      $unsigned(wire9)}) * $signed(reg21[(4'ha):(1'h1)])));
              reg44 <= ({$unsigned(wire17[(3'h4):(2'h3)]), reg43} ?
                  $unsigned(reg30[(1'h0):(1'h0)]) : $unsigned((-(reg32 ?
                      (wire19 <= reg42) : wire10[(4'hd):(4'hb)]))));
              reg45 <= $unsigned($signed((($unsigned((8'ha9)) <<< (~^wire11)) <<< {(|wire13),
                  wire18[(1'h1):(1'h1)]})));
              reg46 <= reg22[(4'ha):(1'h0)];
            end
          reg47 <= reg20[(3'h4):(2'h2)];
        end
    end
  assign wire53 = reg44[(2'h2):(2'h2)];
  assign wire54 = reg22;
  assign wire55 = reg31[(1'h1):(1'h0)];
  assign wire56 = ((((^~{wire10}) ?
                          (&$unsigned(reg41)) : reg39[(4'hc):(3'h7)]) == reg25[(4'h8):(4'h8)]) ?
                      ($unsigned({(reg51 ?
                              reg36 : reg40)}) < (8'hb0)) : $unsigned($signed(((reg47 >>> wire12) ?
                          (8'haa) : wire14[(4'h8):(4'h8)]))));
  assign wire57 = reg24[(5'h11):(4'hf)];
  assign wire58 = {(~^(reg41[(2'h3):(1'h0)] && (~|reg26[(1'h0):(1'h0)]))),
                      $signed(reg32)};
  assign wire59 = $unsigned(($signed((reg41 ?
                      (reg50 || wire9) : (reg46 >> reg39))) || ($unsigned($signed(reg50)) ?
                      reg43 : $signed($unsigned(reg25)))));
  assign wire60 = ((~&reg26) | reg51);
  assign wire61 = (!$signed($unsigned($signed({reg31, reg39}))));
endmodule
