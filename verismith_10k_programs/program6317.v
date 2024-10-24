module top
#(parameter param106 = (~(((((7'h42) << (8'hbe)) - ((8'hb1) << (7'h44))) ? ((^~(8'ha8)) ? ((8'haf) | (8'hab)) : ((8'hae) ? (7'h40) : (8'ha9))) : (((8'hb1) <= (8'hb1)) && (^(8'hb2)))) ? ({((8'h9d) ? (8'ha2) : (8'hba)), ((8'hbf) < (8'hb9))} - ((+(8'hbb)) ? ((8'ha8) ? (8'hb0) : (8'hb1)) : (8'hbb))) : (&(((8'hb8) * (8'ha1)) ? ((8'ha6) ? (8'h9c) : (8'ha7)) : {(8'ha1)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire94;
  wire signed [(4'ha):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(3'h7):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  assign y = {wire105,
                 wire96,
                 wire95,
                 wire94,
                 wire92,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = {((!{(wire0 ? wire3 : wire1)}) < (~^wire3[(1'h0):(1'h0)])),
                     ((wire3 ?
                             (~|((8'had) <<< (8'h9f))) : $unsigned(wire2[(4'he):(2'h3)])) ?
                         wire0 : wire2)};
  assign wire6 = wire3[(4'ha):(4'ha)];
  assign wire7 = wire4[(1'h0):(1'h0)];
  assign wire8 = $unsigned($signed($signed({wire1[(2'h2):(2'h2)],
                     wire1[(4'h9):(3'h6)]})));
  always
    @(posedge clk) begin
      reg9 <= ($signed((8'hb2)) && wire2[(4'h9):(4'h8)]);
      reg10 <= $unsigned(wire5);
    end
  assign wire11 = {wire5[(4'h9):(3'h5)]};
  assign wire12 = (wire5 ? wire7[(4'hb):(3'h7)] : {wire7[(4'h9):(1'h1)]});
  assign wire13 = $unsigned((~|$signed(wire1[(2'h3):(1'h1)])));
  assign wire14 = $signed($signed({(wire11[(2'h2):(1'h1)] | wire3)}));
  assign wire15 = ((+$unsigned(wire13[(2'h2):(2'h2)])) ?
                      ((wire3 & wire3[(2'h2):(2'h2)]) | wire11) : (reg10 | $signed({$unsigned(wire11),
                          reg9})));
  module16 #() modinst93 (wire92, clk, wire14, wire6, wire4, wire7);
  assign wire94 = (&wire4[(4'ha):(2'h2)]);
  assign wire95 = (~^((wire0 - $unsigned($unsigned(wire2))) ?
                      $signed({(wire11 ?
                              wire5 : wire11)}) : ((|$unsigned(wire12)) << ((wire0 ?
                          wire13 : wire0) != wire5))));
  assign wire96 = ($unsigned($unsigned((~^wire1[(3'h7):(1'h0)]))) ?
                      wire8[(2'h3):(2'h2)] : $signed($signed($signed((wire14 ?
                          wire7 : wire0)))));
  always
    @(posedge clk) begin
      if (wire6)
        begin
          if ({($signed((reg9[(4'ha):(3'h5)] > $unsigned(wire92))) ?
                  $unsigned($signed($unsigned(wire6))) : {wire3[(1'h1):(1'h0)],
                      wire95}),
              $signed(((~(-wire4)) ^~ wire11))})
            begin
              reg97 <= {($unsigned(wire12[(4'hd):(3'h4)]) > (~^wire5)),
                  (+$signed($signed((~&wire2))))};
            end
          else
            begin
              reg97 <= $signed((((-(wire13 ?
                      wire7 : wire12)) + $unsigned((!wire15))) ?
                  (^~((wire5 ?
                      wire12 : wire14) != wire2)) : ($unsigned($unsigned(wire12)) == {$unsigned((8'hb2))})));
              reg98 <= $signed(wire12[(5'h12):(4'hf)]);
              reg99 <= ($signed((~&($signed(wire12) ?
                      (~&wire6) : wire8[(4'ha):(4'h8)]))) ?
                  (wire11 ?
                      (-$unsigned((wire92 ^~ wire94))) : wire8) : $signed($signed(wire8)));
            end
          reg100 <= $unsigned((wire15 ?
              ($signed((^~wire8)) ?
                  $unsigned((wire7 || wire6)) : $unsigned(((8'hbf) ?
                      (8'ha3) : wire95))) : (wire13 ?
                  wire92[(3'h4):(2'h2)] : ({wire8} ?
                      $signed(wire15) : (-(8'hbe))))));
          reg101 <= $unsigned((~&$unsigned((wire8 ?
              $signed(wire4) : (~|wire4)))));
          reg102 <= wire92;
        end
      else
        begin
          reg97 <= wire14[(1'h1):(1'h1)];
          reg98 <= (~|($signed((wire14[(2'h2):(1'h0)] == wire12)) ?
              $signed(wire15) : $unsigned(((wire15 && wire15) ?
                  (!reg99) : (wire94 ? wire14 : reg102)))));
          reg99 <= ($signed((((~^wire2) ?
                      (wire1 ? reg100 : (8'ha3)) : $signed((8'h9f))) ?
                  (!reg100[(1'h1):(1'h1)]) : $unsigned({(8'hb1)}))) ?
              wire3[(3'h6):(3'h4)] : $unsigned((reg102[(4'hd):(4'h8)] & wire92)));
        end
      reg103 <= (&(($unsigned($unsigned(wire5)) && $unsigned(wire0[(1'h1):(1'h1)])) != ({$unsigned(wire1)} ?
          wire13 : $unsigned(reg99))));
      reg104 <= reg100;
    end
  assign wire105 = reg102;
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire20;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  input wire [(4'hf):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  assign y = {wire91, wire90, wire88, wire65, wire63, wire22, wire21, (1'h0)};
  assign wire21 = $unsigned(($unsigned({$signed(wire17),
                      wire18}) * ((~|(^wire18)) + (wire18[(3'h5):(3'h5)] ?
                      wire18 : wire20))));
  assign wire22 = $unsigned(wire19);
  module23 #() modinst64 (wire63, clk, wire19, wire18, wire21, wire22);
  assign wire65 = (~(wire18[(2'h3):(2'h2)] && (((wire19 >>> wire19) | (wire19 > wire21)) >= wire20[(3'h5):(2'h2)])));
  module66 #() modinst89 (wire88, clk, wire22, wire65, wire17, wire18);
  assign wire90 = $signed((^~wire19));
  assign wire91 = wire20;
endmodule

module module66
#(parameter param87 = (({{((8'hb7) ? (8'hab) : (8'ha3)), ((7'h41) >= (8'hb9))}} ? ((~|((8'ha0) ? (8'ha0) : (8'h9c))) >= ((8'h9d) ? (!(8'hb4)) : ((8'hae) || (8'ha8)))) : ({((8'haa) ? (7'h44) : (8'haf))} >>> (^~{(7'h40), (7'h42)}))) >= {(-(((8'hb4) - (7'h42)) ? ((8'ha0) ? (8'hbf) : (8'hbc)) : (8'ha5)))}))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire70;
  input wire signed [(4'ha):(1'h0)] wire69;
  input wire [(2'h2):(1'h0)] wire68;
  input wire signed [(4'hf):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire [(5'h13):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire71;
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire78,
                 wire77,
                 wire74,
                 wire73,
                 wire71,
                 reg80,
                 reg76,
                 reg75,
                 reg72,
                 (1'h0)};
  assign wire71 = ((~&{(~(7'h41)), (!wire70)}) + wire69[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg72 <= $signed((!wire68[(1'h0):(1'h0)]));
    end
  assign wire73 = wire70[(1'h1):(1'h1)];
  assign wire74 = wire70;
  always
    @(posedge clk) begin
      reg75 <= (~{(-(^~(wire67 << (8'hbf))))});
      reg76 <= $signed(wire71);
    end
  assign wire77 = {(reg75[(3'h4):(3'h4)] > ((~&reg76[(1'h0):(1'h0)]) ?
                          wire67 : $unsigned((reg72 >>> wire73)))),
                      {(~|(~|wire67[(4'h8):(2'h2)])),
                          (&wire69[(3'h5):(1'h1)])}};
  assign wire78 = (($signed(((wire73 == reg75) << (reg76 ? wire70 : wire70))) ?
                      (8'ha9) : (8'ha3)) == $signed($unsigned($signed($signed((7'h42))))));
  assign wire79 = $unsigned((wire74 ?
                      ($signed($unsigned((8'hbd))) ?
                          (!$signed(wire71)) : wire67) : (|{(wire74 ?
                              wire74 : wire77),
                          (8'haf)})));
  always
    @(posedge clk) begin
      reg80 <= $unsigned((($unsigned(wire79[(2'h2):(1'h0)]) < $signed({wire70})) ?
          ((wire77[(1'h0):(1'h0)] == (^reg75)) && wire77) : (wire69[(2'h3):(2'h3)] >>> $unsigned({reg76,
              wire69}))));
    end
  assign wire81 = (reg76[(2'h2):(1'h0)] ?
                      wire71 : ($signed(({(8'hac), wire71} ?
                              $signed((8'hb4)) : (reg76 ? reg76 : wire74))) ?
                          wire77[(2'h3):(2'h2)] : $unsigned($signed(reg80[(3'h7):(3'h6)]))));
  assign wire82 = ($unsigned((((&wire81) && $unsigned(reg76)) & (&((8'hb5) * reg76)))) ?
                      wire78[(4'hb):(3'h7)] : wire73[(1'h1):(1'h0)]);
  assign wire83 = ($signed($unsigned($signed($signed(wire69)))) < ($unsigned((^~$unsigned(reg75))) * (wire71[(2'h3):(2'h3)] | (((8'ha8) ?
                          wire71 : (8'hbb)) ?
                      reg80 : wire68[(2'h2):(1'h0)]))));
  assign wire84 = $signed(($signed((!(wire70 - wire70))) ^~ ((^wire78) >> (7'h44))));
  assign wire85 = ({wire82[(3'h5):(1'h1)]} - wire73);
  assign wire86 = $unsigned(wire85);
endmodule

module module23  (y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire [(4'hd):(1'h0)] wire26;
  input wire signed [(4'he):(1'h0)] wire25;
  input wire signed [(4'hf):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire28;
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  assign y = {wire62,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire37,
                 wire28,
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
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire28 = (((|{wire25[(3'h7):(2'h3)]}) ?
                          $signed(wire26) : $unsigned(wire27)) ?
                      ($signed(wire25) ?
                          $unsigned($signed($unsigned(wire25))) : wire26[(4'hc):(4'hc)]) : wire27);
  always
    @(posedge clk) begin
      if ((wire25 && $signed((^(wire25 ?
          {wire25, (8'had)} : (wire25 ? (8'ha4) : wire25))))))
        begin
          reg29 <= $unsigned({wire26, wire28[(1'h0):(1'h0)]});
        end
      else
        begin
          reg29 <= wire28;
          reg30 <= $signed(reg29);
          reg31 <= $unsigned(wire26[(2'h3):(2'h2)]);
          if ($unsigned((-(wire25 ?
              wire27[(2'h2):(1'h1)] : (~^(wire28 | wire26))))))
            begin
              reg32 <= ({reg29} >> ((&reg31[(3'h4):(2'h2)]) >> ($signed(reg29) ?
                  (wire26[(3'h5):(3'h4)] ^~ $unsigned(wire28)) : wire28[(2'h2):(1'h1)])));
              reg33 <= (7'h41);
            end
          else
            begin
              reg32 <= (^~(wire26 < {$unsigned((&(8'hb2))),
                  (reg32[(3'h5):(1'h0)] && (reg33 ? reg33 : reg31))}));
              reg33 <= ($unsigned((wire24[(3'h6):(1'h1)] ?
                      wire24 : $unsigned(wire27))) ?
                  (^(~|$signed(wire24))) : wire27);
            end
          reg34 <= $signed(wire26[(2'h3):(2'h3)]);
        end
      reg35 <= (reg32 >= (($unsigned((8'hb5)) ?
          (~|(wire27 + wire27)) : (~&reg32)) ^~ {(reg33 || (8'hb2))}));
      reg36 <= wire26[(1'h1):(1'h0)];
    end
  assign wire37 = wire25[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      if (($unsigned(reg31) < ($signed(($signed((7'h41)) << (reg34 ?
          wire25 : reg35))) & {(^~(reg34 ? (8'ha0) : wire25)), (~|{(7'h41)})})))
        begin
          reg38 <= $signed(wire27);
          reg39 <= $unsigned({(|reg31[(3'h7):(3'h5)]),
              ((&$unsigned(reg38)) >= $signed($unsigned(reg38)))});
          if ((^~reg30))
            begin
              reg40 <= {reg38};
              reg41 <= wire27;
              reg42 <= reg31;
              reg43 <= {{$signed(($unsigned(reg40) >>> $unsigned(reg30))),
                      (^~(~|$signed(reg29)))}};
            end
          else
            begin
              reg40 <= reg33[(4'ha):(2'h2)];
              reg41 <= $unsigned(($unsigned({$unsigned(reg42),
                      (reg39 ~^ reg42)}) ?
                  ($signed(wire24[(3'h7):(3'h5)]) ?
                      $unsigned($unsigned(wire26)) : {(reg35 ? wire26 : wire37),
                          reg36[(4'hb):(1'h1)]}) : ($unsigned({wire26}) ?
                      $unsigned((~&reg42)) : ($unsigned(reg33) ?
                          (reg42 ? wire25 : reg41) : {wire24}))));
              reg42 <= wire26[(3'h6):(2'h2)];
              reg43 <= reg36[(4'hd):(4'hb)];
              reg44 <= $signed($unsigned(reg43[(2'h2):(1'h1)]));
            end
          reg45 <= $unsigned($unsigned((reg33[(4'hb):(4'ha)] ?
              wire24 : $signed($unsigned(reg36)))));
        end
      else
        begin
          reg38 <= (reg41 ? wire24[(3'h4):(2'h2)] : reg35);
          reg39 <= ($signed(((~|((7'h44) ? wire26 : reg44)) > wire24)) ?
              $signed(reg38) : {$unsigned(reg43)});
        end
      reg46 <= reg29[(3'h4):(2'h3)];
    end
  assign wire47 = $signed((reg43 != reg30[(1'h1):(1'h1)]));
  assign wire48 = reg45;
  assign wire49 = reg31[(2'h3):(2'h2)];
  assign wire50 = reg41;
  assign wire51 = reg38;
  always
    @(posedge clk) begin
      if (wire49)
        begin
          reg52 <= (~|$unsigned(reg40[(2'h3):(2'h2)]));
          reg53 <= (~&((wire37[(2'h2):(2'h2)] && $unsigned((reg40 != reg40))) ?
              ($unsigned((reg41 ?
                  wire51 : (8'hb7))) || (wire25[(1'h0):(1'h0)] ^~ (reg45 * reg42))) : (~|wire50[(3'h5):(3'h5)])));
          reg54 <= wire27;
          reg55 <= reg54;
        end
      else
        begin
          reg52 <= reg44;
          reg53 <= reg29;
          reg54 <= wire48[(5'h13):(5'h13)];
        end
      if (wire37)
        begin
          reg56 <= wire47[(3'h5):(3'h4)];
          if (reg30)
            begin
              reg57 <= ({$signed($unsigned((~^(7'h43)))), $signed((+wire26))} ?
                  $signed((|reg33[(5'h13):(5'h11)])) : {$unsigned((~&(wire48 ?
                          reg34 : reg29))),
                      (((reg43 ? wire24 : (8'hae)) ?
                              (wire27 ? reg35 : reg29) : reg40) ?
                          reg39 : wire25[(1'h0):(1'h0)])});
              reg58 <= ({reg44} <= $signed(wire27[(2'h2):(2'h2)]));
              reg59 <= (reg40 * $unsigned(wire49));
              reg60 <= (reg38[(3'h5):(3'h4)] ^ ($unsigned(((wire26 >> reg45) ?
                      $unsigned(reg57) : reg53)) ?
                  (((reg43 ? wire48 : reg56) ?
                      wire24[(4'hd):(3'h6)] : $signed(reg34)) ~^ (8'hb9)) : (8'ha0)));
            end
          else
            begin
              reg57 <= reg46;
            end
          reg61 <= ((-(wire49[(4'ha):(4'h8)] - $signed(reg52[(4'ha):(2'h2)]))) ?
              $unsigned(wire47) : $signed(reg58));
        end
      else
        begin
          reg56 <= $unsigned($signed(($unsigned(reg33) + $unsigned((~(8'hb8))))));
          reg57 <= (((+$signed($unsigned(wire47))) - wire50) >> reg32);
          reg58 <= $signed(((reg52[(4'h9):(2'h3)] & $signed($signed((8'hbd)))) >= (|(~|$signed(reg33)))));
          reg59 <= (wire27 - reg46[(3'h5):(1'h0)]);
        end
    end
  assign wire62 = reg60[(4'h8):(3'h6)];
endmodule
