module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire96;
  wire [(3'h4):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire96, wire95, wire93, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire3[(1'h0):(1'h0)] ?
                     wire2 : $signed((wire0[(2'h2):(1'h0)] ?
                         wire2 : $signed(((8'ha9) ? wire3 : (8'ha7))))));
  assign wire5 = $signed(($unsigned($signed({wire4, wire1})) ?
                     $unsigned($unsigned($unsigned((7'h43)))) : $unsigned((wire2 ?
                         $unsigned(wire1) : wire4[(1'h0):(1'h0)]))));
  assign wire6 = $unsigned($signed((((~^wire0) + $unsigned(wire2)) <<< $signed($unsigned(wire2)))));
  module7 #() modinst94 (.y(wire93), .wire10(wire3), .wire11(wire6), .wire9(wire1), .wire8(wire4), .clk(clk));
  assign wire95 = $signed({wire5,
                      (|($unsigned(wire2) ?
                          $unsigned(wire1) : ((8'hae) ? wire2 : wire93)))});
  assign wire96 = $signed($signed(($signed(wire6) ?
                      $signed((wire4 ~^ wire0)) : (-$unsigned((8'had))))));
endmodule

module module7
#(parameter param92 = (8'hb2))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire70;
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  assign y = {wire91,
                 wire12,
                 wire13,
                 wire70,
                 reg90,
                 reg89,
                 reg88,
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
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire12 = {wire8[(5'h12):(4'hf)]};
  assign wire13 = (^~$unsigned({(^$unsigned(wire9)), $unsigned((~wire10))}));
  module14 #() modinst71 (wire70, clk, wire11, wire12, wire10, wire8, wire13);
  always
    @(posedge clk) begin
      reg72 <= $unsigned((((&(wire12 == wire13)) << wire11) | $signed((~^wire10[(4'h8):(3'h5)]))));
    end
  always
    @(posedge clk) begin
      reg73 <= $signed(wire10);
      if ((~|($signed($signed((~wire9))) || {(8'ha8),
          (wire8 ? (wire11 ? reg73 : (8'ha1)) : wire9)})))
        begin
          reg74 <= ($unsigned(reg73) ?
              (+{($unsigned((7'h44)) < (wire13 * wire8))}) : wire10[(1'h1):(1'h0)]);
        end
      else
        begin
          if ((~|$unsigned($signed((wire70[(3'h4):(2'h2)] * reg73[(1'h1):(1'h0)])))))
            begin
              reg74 <= $unsigned(((wire12[(3'h7):(3'h7)] ?
                      wire11[(4'he):(1'h1)] : $signed((^(8'hbf)))) ?
                  (^~wire11) : (~|wire70)));
              reg75 <= reg74;
              reg76 <= wire10;
              reg77 <= $signed(wire8);
            end
          else
            begin
              reg74 <= (reg76 ?
                  $unsigned($unsigned(wire70[(4'h8):(1'h1)])) : (7'h41));
              reg75 <= (~&(({(wire70 ? reg76 : wire9),
                      (wire70 ? wire8 : reg76)} < $unsigned($unsigned(wire8))) ?
                  (reg75[(3'h6):(1'h0)] ?
                      reg75 : (~^wire8[(3'h6):(3'h6)])) : wire70));
              reg76 <= $unsigned((+$unsigned((wire12 ?
                  $signed((8'hb8)) : (^wire13)))));
              reg77 <= reg75;
              reg78 <= reg75;
            end
          if (reg77[(4'hc):(3'h6)])
            begin
              reg79 <= {(|reg74[(4'hd):(1'h0)]),
                  (+(((wire8 < wire10) ? (reg77 ? reg75 : reg75) : (~(8'h9f))) ?
                      $unsigned($unsigned((8'haa))) : ($unsigned(wire9) ?
                          $unsigned(wire13) : (reg76 ? reg77 : reg76))))};
              reg80 <= $unsigned($signed((~&(-(!reg79)))));
              reg81 <= reg76;
            end
          else
            begin
              reg79 <= wire8[(4'hd):(4'ha)];
              reg80 <= $unsigned($signed(wire11));
              reg81 <= (reg75[(3'h5):(2'h3)] & wire9[(3'h4):(1'h1)]);
            end
          reg82 <= wire10[(3'h4):(1'h1)];
          reg83 <= (^~(wire12 >> $signed(reg73[(4'ha):(1'h1)])));
          reg84 <= wire12[(3'h7):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      if (wire10[(2'h3):(1'h0)])
        begin
          reg85 <= ($unsigned((((reg81 ?
              reg77 : reg83) || $signed(reg77)) > reg80)) * $unsigned(wire8[(4'ha):(3'h5)]));
          reg86 <= ($signed($signed((reg85[(2'h3):(2'h3)] ?
                  (-reg73) : $unsigned(reg78)))) ?
              wire13 : reg83);
        end
      else
        begin
          reg85 <= $signed((reg80[(3'h7):(2'h2)] * $unsigned(reg77[(5'h11):(1'h1)])));
        end
      reg87 <= (wire8[(5'h12):(4'h9)] != {(8'hb1)});
      reg88 <= reg82[(3'h4):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg89 <= reg87[(4'h8):(4'h8)];
      reg90 <= $unsigned({($unsigned((8'hbd)) & ((reg74 ?
              wire8 : (8'hb0)) >= (&wire9)))});
    end
  assign wire91 = (reg86[(4'he):(4'hb)] ?
                      (!$unsigned((reg80 ?
                          {reg83, reg73} : {reg87}))) : wire13);
endmodule

module module14
#(parameter param69 = ((({(|(7'h40))} < ({(8'hb8), (8'ha0)} != ((8'hae) ^~ (8'ha1)))) < ((8'ha1) ? ((-(8'hb6)) ? ((8'ha6) ? (8'hb5) : (8'ha3)) : (|(8'hbd))) : (^~((8'ha3) ? (8'hbc) : (8'hba))))) ? ({((&(8'hb1)) ? ((8'ha6) ? (8'hbd) : (7'h41)) : (8'ha2))} != ((&(|(8'hbe))) >>> (((7'h41) == (8'ha8)) ? ((8'haf) != (8'hb3)) : ((8'hbb) ? (8'hbb) : (7'h42))))) : (((&(+(8'hbf))) <= ((~^(8'hb7)) ? ((7'h40) & (8'hbf)) : ((7'h44) << (8'hb5)))) ? ({((8'h9d) ? (8'hb4) : (8'ha4)), (~&(8'hbe))} ? (|((8'h9f) == (7'h42))) : (((8'hb7) | (8'ha3)) >> {(8'h9f), (8'h9f)})) : ((~&((7'h44) << (7'h43))) ? (((8'hb4) <<< (8'ha7)) ? ((8'ha0) ? (8'hb7) : (8'ha0)) : (^(7'h43))) : (8'h9e)))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h259):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire signed [(4'he):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
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
                 (1'h0)};
  assign wire20 = wire19[(3'h6):(2'h3)];
  assign wire21 = {$signed(wire20)};
  assign wire22 = (-wire17[(1'h1):(1'h1)]);
  assign wire23 = ($signed((!(wire20[(4'hb):(4'h9)] ?
                          (wire17 > wire19) : (wire15 ? (7'h44) : wire16)))) ?
                      ((wire17[(1'h0):(1'h0)] <= wire20) >= (wire22 <= wire22[(4'h9):(3'h7)])) : {$signed(({wire22} ?
                              (wire19 + (8'haf)) : wire20[(4'h8):(4'h8)])),
                          wire21[(1'h1):(1'h0)]});
  assign wire24 = ((wire22 ?
                      wire15[(1'h1):(1'h0)] : ((8'hbc) ?
                          $unsigned((wire21 + wire22)) : ((wire16 ?
                              wire15 : (8'hb9)) * $unsigned(wire23)))) ^ ($signed($unsigned((wire18 ~^ wire22))) ?
                      $unsigned($signed((8'hac))) : wire18));
  assign wire25 = (wire22[(1'h1):(1'h0)] ^ $unsigned(wire16[(2'h3):(2'h3)]));
  assign wire26 = ((((~&((8'hbf) ?
                      (8'ha5) : (8'hb8))) >> wire21) ^ $signed((^(+wire22)))) != wire15);
  always
    @(posedge clk) begin
      if (((8'hbf) ?
          (wire23[(4'h9):(1'h0)] ?
              (^~{wire22, wire22}) : ($unsigned(wire25) ?
                  {$signed(wire15),
                      (~|wire23)} : wire18[(4'h9):(1'h0)])) : wire21))
        begin
          if ({wire26[(4'ha):(3'h4)],
              (!(($unsigned((8'hb2)) * (!wire24)) >= (^$signed(wire23))))})
            begin
              reg27 <= $unsigned({({wire22} != {$signed(wire17),
                      $unsigned(wire16)}),
                  (8'h9f)});
              reg28 <= (!$unsigned($unsigned((wire18 || wire17))));
              reg29 <= wire19[(5'h15):(5'h14)];
              reg30 <= (wire15[(4'h8):(1'h0)] == {{$unsigned($signed(wire21))},
                  wire17});
              reg31 <= $signed(reg30);
            end
          else
            begin
              reg27 <= (~wire17[(2'h2):(2'h2)]);
              reg28 <= (($signed((^(wire17 <<< (8'ha3)))) ?
                  $unsigned($signed(reg28[(3'h6):(3'h5)])) : $unsigned($signed($unsigned((8'ha1))))) & ($unsigned(wire21[(2'h2):(1'h1)]) != wire26));
            end
          reg32 <= (wire18[(2'h2):(1'h0)] ^ (-{(wire16[(4'h8):(3'h7)] <= reg31)}));
          reg33 <= (^wire26);
          if ((8'h9c))
            begin
              reg34 <= $unsigned((^((-(|wire25)) ?
                  {(wire24 ? (8'ha1) : reg29),
                      (reg31 ? wire23 : reg29)} : $signed((wire26 ?
                      wire15 : wire18)))));
              reg35 <= {{$unsigned((reg34 <= wire19))}, {$unsigned(reg29)}};
              reg36 <= reg35;
              reg37 <= (+((((wire20 | reg36) ?
                          $unsigned(reg31) : $unsigned(wire21)) ?
                      (~|(wire26 & reg30)) : reg35[(1'h1):(1'h0)]) ?
                  ((reg32 <= $signed(wire21)) ?
                      (&(wire22 ?
                          reg28 : wire21)) : (wire22[(4'h9):(3'h7)] ~^ (reg29 ?
                          (8'ha4) : reg33))) : {$signed((wire26 ?
                          reg30 : wire22))}));
              reg38 <= ($signed(wire17[(1'h0):(1'h0)]) ?
                  wire23 : ((|$signed((+wire26))) >= (^($unsigned(wire16) ?
                      {reg27, wire26} : (wire25 <<< wire18)))));
            end
          else
            begin
              reg34 <= $unsigned(((8'hb2) ?
                  reg35[(5'h10):(4'ha)] : (wire20[(4'h9):(2'h2)] ?
                      $signed((~&reg37)) : ((reg30 ? wire26 : wire22) ?
                          ((8'hb3) ? (8'h9c) : reg37) : $unsigned(reg31)))));
            end
        end
      else
        begin
          reg27 <= wire26[(3'h5):(1'h1)];
          if ((-$signed($signed(wire25))))
            begin
              reg28 <= (~|$signed((~&wire25)));
              reg29 <= $signed({(wire18 | (&(wire26 | reg35)))});
              reg30 <= $unsigned($signed(wire25[(1'h0):(1'h0)]));
              reg31 <= (7'h42);
              reg32 <= wire15[(4'ha):(2'h2)];
            end
          else
            begin
              reg28 <= ($signed($signed($signed(((8'hb2) && reg28)))) && $unsigned({({(8'ha3)} ~^ $unsigned(reg33))}));
            end
          if ($signed(((($unsigned(wire16) ? (^reg28) : $signed(wire15)) ?
              wire15[(1'h0):(1'h0)] : (reg35 ?
                  {reg37} : $signed(wire19))) || ($signed((8'hae)) ?
              (reg33[(4'h9):(2'h2)] ?
                  (wire16 ? reg36 : reg36) : (+reg33)) : $signed((^~reg28))))))
            begin
              reg33 <= ($unsigned((|(|(wire17 && (7'h40))))) ?
                  (($signed($signed(reg35)) ?
                          $unsigned((reg37 ? reg30 : reg38)) : reg29) ?
                      ((&reg38) ?
                          {$unsigned(wire25),
                              {(8'hb9), reg34}} : $unsigned((wire23 ?
                              wire20 : wire18))) : $signed(reg30[(4'he):(4'hd)])) : reg29);
              reg34 <= $signed($unsigned({wire19[(4'hc):(3'h6)],
                  $signed($signed(wire20))}));
              reg35 <= (($unsigned(((|reg29) ?
                      ((8'ha9) ?
                          wire25 : reg35) : (wire17 && wire22))) ~^ {wire16[(4'hf):(1'h0)]}) ?
                  $signed((^~reg32)) : reg37);
            end
          else
            begin
              reg33 <= (($signed(($unsigned(reg38) ?
                      $unsigned(reg27) : reg33)) <<< $signed(reg33[(4'he):(4'ha)])) ?
                  reg30 : (~|$signed((reg32[(3'h6):(3'h4)] ?
                      (8'hbd) : (wire19 ? reg28 : wire26)))));
            end
          reg36 <= (~&wire15[(1'h0):(1'h0)]);
          reg37 <= $unsigned((~&wire15[(4'hb):(1'h1)]));
        end
      reg39 <= $signed((-(~&{(8'h9d)})));
      reg40 <= reg33[(4'h8):(4'h8)];
    end
  assign wire41 = ({{$signed($unsigned(reg30))}} ~^ wire20[(3'h4):(1'h0)]);
  assign wire42 = (!{wire23[(4'h8):(2'h2)]});
  assign wire43 = (reg32 || ($signed(reg35) | wire21[(2'h2):(2'h2)]));
  assign wire44 = reg28[(3'h6):(1'h0)];
  assign wire45 = ($unsigned($unsigned({(8'hb2), $signed(wire42)})) ?
                      reg36 : (+wire44[(4'h8):(3'h6)]));
  assign wire46 = reg27[(3'h4):(3'h4)];
  assign wire47 = reg39;
  always
    @(posedge clk) begin
      if ((wire19 ?
          {wire45[(4'hb):(2'h3)],
              (reg32 ?
                  ((-(8'ha3)) ?
                      reg35[(4'hf):(2'h2)] : wire19) : $signed(wire16))} : (reg36[(1'h1):(1'h1)] + (|reg37[(2'h2):(1'h1)]))))
        begin
          if (((reg38 ? wire16[(4'ha):(4'h9)] : wire43[(3'h4):(2'h3)]) ?
              reg27 : $unsigned({((reg33 ?
                      wire46 : reg28) > $unsigned(reg30))})))
            begin
              reg48 <= ((8'hba) && {($signed($unsigned((8'haa))) ?
                      ((+wire45) - ((8'had) ?
                          reg34 : (8'ha0))) : ((reg29 ^~ wire44) - (reg37 - wire24))),
                  (wire41 ?
                      ((reg30 ?
                          wire19 : reg36) ^ (!wire17)) : (~|$signed(wire15)))});
              reg49 <= $signed($unsigned((~(reg39 <<< $signed(reg36)))));
            end
          else
            begin
              reg48 <= wire26;
              reg49 <= (^~(wire19[(3'h4):(2'h2)] ~^ {(reg49 ?
                      (7'h42) : $signed(reg38)),
                  $signed((wire46 ? reg40 : (8'hbe)))}));
              reg50 <= (8'h9d);
              reg51 <= wire16;
            end
        end
      else
        begin
          reg48 <= (8'had);
          reg49 <= (~|$unsigned(wire26));
        end
      reg52 <= (8'hae);
      reg53 <= ($signed($signed(reg31)) >>> $unsigned($unsigned(wire19[(1'h1):(1'h0)])));
      if ($signed(wire23))
        begin
          reg54 <= ($signed(((reg30[(5'h12):(2'h2)] >>> (wire42 == reg39)) ?
              $signed((reg40 ?
                  reg51 : wire21)) : (reg37[(3'h5):(3'h5)] ^ reg37[(2'h3):(2'h2)]))) * reg34[(3'h4):(1'h1)]);
          if ((8'hbe))
            begin
              reg55 <= $unsigned((^$unsigned(reg37[(1'h0):(1'h0)])));
              reg56 <= wire26[(4'hc):(3'h6)];
              reg57 <= ((8'hb6) & $signed((((&reg36) || (!reg32)) ?
                  (wire23 ? (~|wire46) : {wire24}) : wire41)));
            end
          else
            begin
              reg55 <= $unsigned((~(~(&reg27))));
            end
        end
      else
        begin
          reg54 <= (reg34 & $signed(reg54));
          reg55 <= (wire17 ?
              (^$unsigned(wire16)) : (reg28[(3'h7):(3'h7)] == {$unsigned(((8'hb3) ^~ wire42)),
                  (~|$unsigned(wire43))}));
          if (((~&$unsigned(($unsigned(reg52) < (^reg33)))) ?
              (reg32[(1'h1):(1'h1)] ?
                  $unsigned(reg35) : (+($unsigned(reg38) >> (~&reg56)))) : (-((~^reg35) ^ $signed($signed((8'hbe)))))))
            begin
              reg56 <= $signed($signed(reg38));
              reg57 <= $signed($signed($unsigned((((8'h9d) ? reg38 : reg52) ?
                  $unsigned(reg57) : (wire17 ? reg29 : (7'h41))))));
              reg58 <= (8'hb1);
              reg59 <= reg28[(2'h2):(2'h2)];
              reg60 <= $signed(wire47[(4'ha):(1'h0)]);
            end
          else
            begin
              reg56 <= {reg51};
              reg57 <= reg40;
              reg58 <= wire46[(4'hc):(4'hc)];
              reg59 <= ((~&{$unsigned(reg29[(1'h1):(1'h1)])}) & (reg39 ?
                  ($unsigned(((8'hb7) ?
                      reg28 : reg51)) && reg39[(4'hd):(1'h1)]) : $signed(($unsigned(wire25) <= $signed(wire21)))));
            end
          reg61 <= $signed($unsigned(wire19));
          reg62 <= (($signed(reg53) && ((reg27 + reg27[(2'h3):(1'h1)]) ?
              reg32[(3'h7):(1'h1)] : reg36)) || {reg61, (~(^(+wire25)))});
        end
      reg63 <= $unsigned(wire45);
    end
  assign wire64 = {((((^~wire17) >>> (&wire43)) ?
                          $signed((reg53 || reg59)) : (8'hb4)) ^~ ($unsigned($unsigned(reg54)) ?
                          $signed((^~wire24)) : reg57)),
                      reg50};
  assign wire65 = reg28[(3'h6):(2'h2)];
  assign wire66 = wire64[(2'h2):(1'h1)];
  assign wire67 = $unsigned((~(reg37 >> {$unsigned(wire25)})));
  assign wire68 = ((^reg59[(3'h7):(3'h4)]) ?
                      $unsigned($signed(((reg55 ^~ wire26) || $unsigned(reg29)))) : ((wire18[(1'h1):(1'h0)] < (~|(wire16 ?
                          reg56 : (7'h42)))) == (($signed(reg61) ?
                              (wire22 ? (8'hb5) : (8'ha7)) : (wire20 ?
                                  wire67 : reg38)) ?
                          wire43 : (^(reg39 << reg31)))));
endmodule
