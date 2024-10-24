module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire96;
  wire [(3'h4):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire94;
  wire [(2'h3):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire89;
  reg [(3'h4):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire55,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire89,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire4 = wire0[(3'h7):(3'h5)];
  assign wire5 = (!wire4);
  assign wire6 = $unsigned((~^(wire2[(3'h6):(3'h5)] <<< $signed(wire2[(2'h3):(1'h0)]))));
  assign wire7 = {$unsigned(wire0)};
  module8 #() modinst56 (wire55, clk, wire0, wire6, wire5, wire4, wire7);
  assign wire57 = {wire55,
                      ($signed((-$unsigned((7'h44)))) ?
                          (wire4[(4'hc):(4'h9)] ^ ((wire4 ? wire1 : wire7) ?
                              $unsigned(wire1) : $unsigned((8'h9e)))) : wire2)};
  assign wire58 = (-$unsigned(wire4));
  assign wire59 = wire55[(1'h0):(1'h0)];
  assign wire60 = $unsigned((wire58[(4'h8):(1'h0)] ?
                      $unsigned($signed(wire59[(1'h0):(1'h0)])) : $unsigned(wire4)));
  assign wire61 = wire6;
  assign wire62 = ((wire4 ?
                          ((8'h9e) & $signed(wire58[(3'h5):(3'h5)])) : ({$signed(wire57),
                              $unsigned(wire4)} <= ((wire1 != wire61) >> (-wire6)))) ?
                      $signed($unsigned($unsigned((wire57 || wire1)))) : ((8'hba) ?
                          ((~|wire2) ?
                              ((8'h9d) & wire0[(2'h3):(1'h1)]) : (8'ha4)) : $signed($unsigned((-wire3)))));
  assign wire63 = {$signed($unsigned($signed(wire62[(3'h5):(3'h4)]))),
                      wire5[(5'h13):(3'h5)]};
  module64 #() modinst90 (wire89, clk, wire0, wire5, wire55, wire58, wire57);
  always
    @(posedge clk) begin
      reg91 <= wire6[(1'h0):(1'h0)];
      reg92 <= wire5[(3'h7):(1'h0)];
    end
  assign wire93 = $signed(({({wire62, (8'hb4)} ?
                          (wire1 ?
                              wire4 : reg92) : (-(8'hb2)))} * (+wire61[(2'h3):(2'h2)])));
  assign wire94 = $unsigned($unsigned($unsigned({(wire63 ~^ wire61)})));
  assign wire95 = wire0[(3'h5):(2'h3)];
  assign wire96 = wire2[(3'h4):(2'h3)];
  assign wire97 = (^(+wire94[(4'h8):(3'h4)]));
endmodule

module module64
#(parameter param88 = (~&(~(8'hbe))))
(y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire69;
  input wire [(3'h6):(1'h0)] wire68;
  input wire signed [(3'h7):(1'h0)] wire67;
  input wire signed [(4'hf):(1'h0)] wire66;
  input wire signed [(4'h9):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire70;
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire70 = (wire67 ?
                      wire65[(4'h8):(2'h3)] : $unsigned(wire66[(4'h9):(2'h3)]));
  assign wire71 = (^~wire65[(3'h6):(3'h5)]);
  assign wire72 = $signed(wire67);
  assign wire73 = (^~wire71[(1'h0):(1'h0)]);
  assign wire74 = $signed((wire73[(3'h7):(3'h6)] ?
                      wire72 : $unsigned((8'ha5))));
  assign wire75 = ((wire65 < wire71) ?
                      (wire74[(5'h12):(4'hb)] <= wire71[(1'h0):(1'h0)]) : (8'ha7));
  always
    @(posedge clk) begin
      reg76 <= (!($signed((wire71[(2'h2):(1'h0)] ?
              $unsigned(wire73) : $unsigned(wire71))) ?
          wire66[(3'h4):(2'h2)] : {((wire66 << wire75) & wire75)}));
    end
  always
    @(posedge clk) begin
      reg77 <= $unsigned($unsigned(wire66));
      reg78 <= (~$unsigned((&$signed({wire69}))));
      if ((^(wire68[(1'h0):(1'h0)] ?
          {$signed((^reg78))} : $signed($unsigned(wire73)))))
        begin
          reg79 <= ($signed($signed(((wire71 <= wire70) != (wire72 >>> wire66)))) ?
              ($signed((~^$signed(wire73))) ?
                  ((((8'ha8) ?
                      wire71 : reg78) >> $unsigned(wire74)) ^ $unsigned(wire65[(4'h9):(4'h9)])) : $unsigned(((wire75 ?
                          wire69 : (8'hbb)) ?
                      reg77[(3'h7):(1'h1)] : $signed(reg77)))) : $unsigned($signed($signed(reg77[(1'h0):(1'h0)]))));
          reg80 <= $signed(wire65[(4'h9):(3'h6)]);
          reg81 <= wire67;
          if ($unsigned($signed(reg80[(5'h11):(4'hf)])))
            begin
              reg82 <= (reg79 || (|wire72[(4'hf):(4'h8)]));
              reg83 <= ((~^$signed(($unsigned(wire65) ?
                      $unsigned(wire65) : $signed(reg80)))) ?
                  reg79 : reg79);
              reg84 <= ($unsigned({wire69[(3'h5):(2'h3)],
                  ($unsigned(wire65) ^ (reg80 ?
                      (8'hbb) : wire67))}) ^ $signed((reg80 ?
                  ((wire73 ? wire73 : wire74) ^~ wire71) : reg78)));
              reg85 <= $unsigned($unsigned(reg76[(3'h4):(3'h4)]));
              reg86 <= (wire74 <<< wire72);
            end
          else
            begin
              reg82 <= {(|(~$unsigned((wire74 && reg85))))};
              reg83 <= {({$unsigned((wire75 & reg78)),
                      (wire72[(4'hb):(3'h6)] ?
                          (wire72 ?
                              wire75 : (8'hb6)) : $unsigned(reg76))} && reg82)};
              reg84 <= $signed($signed($unsigned((reg82[(4'hf):(3'h6)] ?
                  wire72 : $signed(wire73)))));
              reg85 <= (($unsigned((+$unsigned(reg86))) || (7'h40)) << wire75);
            end
        end
      else
        begin
          if ({((-(|reg77[(4'hb):(3'h4)])) ?
                  {$unsigned($signed(wire69))} : (($signed(reg77) ?
                      (wire65 ~^ wire67) : (^reg84)) <= reg77[(3'h5):(2'h3)])),
              ($signed(wire70[(3'h6):(2'h3)]) && $signed((|$unsigned(wire68))))})
            begin
              reg79 <= $signed((~&(wire67 || $signed(reg82))));
              reg80 <= {reg76};
              reg81 <= $signed((($unsigned(((8'hbc) ? (8'h9f) : (8'hb8))) ?
                      reg79[(1'h1):(1'h0)] : $signed($unsigned((8'h9f)))) ?
                  (((reg76 == reg83) ?
                      {reg80,
                          wire68} : (reg84 && reg82)) >>> (8'hac)) : ($unsigned(reg80) > ((wire70 <= wire71) ?
                      $signed(reg76) : $signed(wire73)))));
            end
          else
            begin
              reg79 <= reg76;
              reg80 <= $unsigned((8'h9f));
              reg81 <= ($unsigned(wire69) ? reg78 : wire72);
              reg82 <= wire65[(1'h1):(1'h0)];
              reg83 <= $signed(((wire73 ^~ (wire73 > $unsigned((8'hbd)))) <<< ((reg79 | (^~wire72)) ^ ((^~wire74) ?
                  {wire73} : wire73[(1'h1):(1'h1)]))));
            end
          reg84 <= $signed({(($unsigned(reg83) == (+reg82)) ? wire67 : reg82),
              reg83});
          reg85 <= (~wire66[(4'hb):(2'h3)]);
        end
      reg87 <= {$unsigned($signed(((reg83 ? (8'hba) : reg81) ?
              {reg84, wire66} : wire72))),
          $unsigned({$unsigned($signed(reg81)), reg81[(3'h6):(3'h6)]})};
    end
endmodule

module module8
#(parameter param54 = (((~{((8'ha7) == (8'h9e))}) ? ({((8'ha9) ? (8'hb9) : (8'ha2)), ((8'hb9) ? (8'hbc) : (8'hbf))} < ((&(7'h42)) <<< ((7'h44) ? (8'h9f) : (8'hbc)))) : (7'h42)) ? {((^{(7'h42), (7'h44)}) ? ((+(8'h9d)) ^ (!(8'hab))) : {{(8'hba)}, {(8'h9c)}}), (~|(-((8'hb3) && (7'h42))))} : (8'hb3)))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire13;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire37;
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  assign y = {wire53,
                 wire40,
                 wire39,
                 wire37,
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
                 (1'h0)};
  module14 #() modinst38 (.y(wire37), .wire15(wire10), .wire18(wire12), .wire16(wire11), .clk(clk), .wire17(wire13));
  assign wire39 = ({wire11[(2'h2):(2'h2)]} ?
                      (~(wire11[(5'h14):(4'he)] ?
                          wire37 : ((~&(8'ha0)) <<< wire11))) : (($signed((wire10 - wire12)) ?
                              wire37[(2'h3):(1'h0)] : ($unsigned(wire10) ?
                                  $signed(wire10) : $unsigned(wire37))) ?
                          wire37[(1'h0):(1'h0)] : ((wire10[(4'he):(4'hd)] ~^ wire12[(3'h6):(3'h4)]) && ({(7'h42)} ?
                              $signed(wire12) : wire13))));
  assign wire40 = (wire12 <<< (^wire9));
  always
    @(posedge clk) begin
      if ((8'haa))
        begin
          if ({wire37, (!$unsigned((&wire10)))})
            begin
              reg41 <= ({$unsigned($signed(wire40))} && (&$unsigned($signed((8'hb4)))));
              reg42 <= $signed(wire10[(5'h12):(1'h1)]);
              reg43 <= (8'ha7);
              reg44 <= $signed({$signed(((wire39 ?
                      wire12 : reg41) ~^ (~^reg41))),
                  ((~$unsigned(wire13)) ?
                      $unsigned(wire39) : wire9[(2'h2):(2'h2)])});
            end
          else
            begin
              reg41 <= (reg42 ^~ ((wire39 - {(wire12 <<< reg42)}) ?
                  (wire13 >> wire13[(3'h5):(2'h3)]) : $unsigned(wire9)));
              reg42 <= {(|wire11[(4'hf):(4'hb)])};
              reg43 <= $unsigned(((wire39 && (|(|wire39))) ?
                  ((wire11[(5'h10):(3'h7)] && (&reg41)) ^~ wire11[(2'h3):(2'h2)]) : $signed((reg42 ?
                      (7'h41) : $unsigned(wire13)))));
              reg44 <= (wire13 ?
                  (wire40[(2'h2):(2'h2)] + ({wire9[(5'h12):(4'hd)]} + wire9[(4'hb):(1'h0)])) : wire39[(2'h2):(1'h0)]);
              reg45 <= {wire39};
            end
          reg46 <= {($unsigned((((8'ha3) ~^ wire13) ?
                  reg45 : $unsigned(wire9))) != wire37),
              reg42[(2'h3):(1'h1)]};
          reg47 <= (~^wire40[(4'h9):(2'h2)]);
          if ((~&($signed(wire12[(3'h7):(1'h0)]) ~^ ($signed($signed(wire10)) ?
              reg47[(2'h2):(1'h0)] : (reg46[(3'h4):(1'h1)] ?
                  wire37[(3'h5):(2'h2)] : (!(7'h40)))))))
            begin
              reg48 <= wire12[(4'h9):(2'h2)];
              reg49 <= {$unsigned(wire39[(1'h1):(1'h1)])};
            end
          else
            begin
              reg48 <= {((((+(8'hbc)) | (-(8'hb9))) - ((reg44 ?
                              reg41 : wire12) ?
                          $signed(reg44) : (~|reg42))) ?
                      (reg45[(2'h2):(1'h1)] != ((reg45 ^~ wire11) ?
                          (reg44 ?
                              wire37 : reg45) : reg47[(1'h0):(1'h0)])) : (+(8'hb3))),
                  (+(8'hb9))};
              reg49 <= reg42[(3'h5):(2'h2)];
            end
          reg50 <= ($unsigned($signed(($unsigned(reg44) ?
              wire10[(2'h3):(1'h0)] : $signed(reg41)))) <= wire10[(4'he):(4'hb)]);
        end
      else
        begin
          reg41 <= reg48[(4'h9):(4'h9)];
          reg42 <= $unsigned(reg49[(3'h4):(2'h3)]);
          if ($signed($unsigned(reg44[(2'h2):(1'h1)])))
            begin
              reg43 <= reg49;
            end
          else
            begin
              reg43 <= reg45[(3'h5):(1'h0)];
              reg44 <= reg49;
              reg45 <= ((wire10[(4'hc):(3'h7)] ?
                      $signed(wire9[(4'hb):(3'h5)]) : {$unsigned(reg48)}) ?
                  ((wire40[(4'h9):(4'h9)] ?
                          reg42 : (^((8'had) ? reg49 : wire11))) ?
                      (($signed(wire13) | reg50[(4'he):(1'h1)]) ^ $unsigned($signed(reg46))) : ($unsigned($unsigned((8'hba))) ?
                          wire10 : (~&$unsigned((8'h9e))))) : ((($signed(reg49) - $signed(wire10)) ?
                      (reg42[(3'h5):(2'h3)] ?
                          wire13[(4'h8):(2'h3)] : $unsigned(wire10)) : ((~^reg49) + reg49)) ~^ reg43[(4'h9):(3'h7)]));
            end
        end
      reg51 <= (~^(reg48 - ($signed((wire37 && wire13)) ?
          $signed((reg41 ? wire39 : (8'hb6))) : ($signed(reg43) ?
              $signed(reg42) : (~^reg43)))));
      reg52 <= {(&(~^$signed((8'ha7))))};
    end
  assign wire53 = ({({(-(8'ha0))} ?
                          reg43[(4'h8):(3'h4)] : (~^reg51))} == $signed(wire10));
endmodule

module module14
#(parameter param36 = (8'hb9))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire18;
  input wire signed [(4'hd):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  input wire [(5'h14):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire19;
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  assign y = {wire35,
                 wire20,
                 wire19,
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
                 (1'h0)};
  assign wire19 = (-(((7'h40) <= ((wire17 ? (8'h9e) : wire16) ?
                          wire15 : $unsigned((8'h9d)))) ?
                      ($signed(wire15) > (8'ha9)) : ($signed(wire18) > $signed($signed(wire17)))));
  assign wire20 = {wire19[(4'hd):(2'h3)],
                      ((($unsigned(wire15) ?
                                  $unsigned(wire19) : wire18[(1'h1):(1'h0)]) ?
                              wire17[(2'h3):(2'h2)] : (-{wire15})) ?
                          $signed(wire18[(2'h2):(1'h0)]) : wire18)};
  always
    @(posedge clk) begin
      if (($unsigned(($signed((wire17 <<< wire15)) ^~ $signed(((8'hba) < wire15)))) ?
          (($signed((!wire17)) << (~|(wire17 ?
              wire18 : wire16))) ^ $signed((wire18[(3'h5):(2'h3)] ?
              ((8'hb1) & wire19) : {wire18, wire19}))) : wire20))
        begin
          reg21 <= (~(+$unsigned($signed((wire17 | wire20)))));
        end
      else
        begin
          reg21 <= $signed(wire17);
          if (((~reg21) * wire19))
            begin
              reg22 <= (($signed($signed($unsigned(wire15))) ?
                      reg21[(2'h2):(1'h1)] : $signed((~^$signed(wire16)))) ?
                  wire18[(2'h2):(1'h0)] : {(~&wire17[(1'h1):(1'h0)]),
                      {wire18}});
              reg23 <= $unsigned(($unsigned($unsigned((^~wire15))) ?
                  (-$unsigned((wire20 != wire16))) : reg21[(1'h0):(1'h0)]));
              reg24 <= $unsigned({$signed(wire17[(1'h0):(1'h0)]),
                  wire20[(2'h3):(1'h0)]});
              reg25 <= ((8'hab) ? reg21 : (8'hbb));
              reg26 <= $unsigned($signed(wire19));
            end
          else
            begin
              reg22 <= reg26[(5'h14):(1'h1)];
            end
          reg27 <= (wire18 <<< (~$unsigned({reg23, $unsigned(wire18)})));
        end
      reg28 <= $unsigned({$signed((!(reg26 ? wire15 : (8'had)))),
          (((~|reg25) ~^ $signed((8'ha9))) ?
              reg25[(1'h0):(1'h0)] : ((reg22 ?
                  (8'hb6) : reg23) - (reg22 ^ reg23)))});
      reg29 <= (~|$unsigned(reg26));
      reg30 <= {reg25, (-reg28)};
      if ($unsigned((~&((reg26[(4'hf):(4'ha)] ?
          wire16 : (wire16 <= reg30)) < (^~reg30)))))
        begin
          reg31 <= (~reg26);
          reg32 <= ($signed(reg22[(3'h5):(2'h2)]) ?
              {wire15[(4'hd):(1'h0)],
                  ((reg25 && reg31[(1'h0):(1'h0)]) != $signed(wire20[(3'h4):(2'h3)]))} : $unsigned(reg21[(2'h3):(2'h2)]));
          reg33 <= $unsigned((wire19 + {$unsigned(wire19[(2'h3):(1'h0)]),
              (reg24[(2'h2):(1'h0)] ? $unsigned(wire20) : $signed((8'hbc)))}));
          reg34 <= reg22[(2'h3):(2'h2)];
        end
      else
        begin
          reg31 <= ({($unsigned(reg32) ?
                  (reg32[(4'ha):(4'ha)] ?
                      reg24 : {reg21, reg33}) : {reg24[(3'h6):(2'h3)],
                      ((8'hb1) != reg22)})} ^~ reg29);
          reg32 <= wire20;
          reg33 <= reg30;
        end
    end
  assign wire35 = $signed(($unsigned(((wire20 ? wire20 : reg22) ^ reg23)) ?
                      (((reg31 ?
                          reg22 : reg28) || reg27) | (~^(-reg31))) : (+reg30[(4'ha):(3'h5)])));
endmodule
