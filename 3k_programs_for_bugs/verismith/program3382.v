module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire91;
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire94,
                 wire93,
                 wire50,
                 wire6,
                 wire5,
                 wire4,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire91,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  assign wire4 = $signed((wire2 & (&(8'hba))));
  assign wire5 = (wire3[(1'h1):(1'h0)] ?
                     $unsigned(wire2[(3'h4):(2'h2)]) : wire1);
  assign wire6 = wire1;
  module7 #() modinst51 (wire50, clk, wire4, wire2, wire6, wire3, wire5);
  assign wire52 = {wire0};
  assign wire53 = wire5;
  assign wire54 = (({({(8'hb9)} || (wire53 >= wire5))} == (~|wire3[(2'h3):(2'h3)])) & (^(^~$signed($unsigned(wire50)))));
  assign wire55 = {(~&(wire5[(4'h8):(3'h5)] ?
                          $signed((wire1 ~^ (8'had))) : ($signed(wire3) || (~^(7'h44)))))};
  assign wire56 = wire54[(3'h7):(3'h4)];
  module57 #() modinst92 (wire91, clk, wire1, wire5, wire4, wire56, wire6);
  assign wire93 = ($unsigned($signed($unsigned(wire50))) ?
                      $signed(wire1) : wire3);
  assign wire94 = (^$unsigned(wire55[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg95 <= wire5[(1'h0):(1'h0)];
      reg96 <= wire5;
      reg97 <= (wire6[(4'hc):(4'h8)] ?
          $unsigned((^(wire1[(4'hb):(3'h5)] ?
              (|wire1) : $unsigned(wire94)))) : {{wire3[(3'h6):(2'h3)],
                  wire53[(1'h1):(1'h0)]},
              wire94});
    end
  assign wire98 = (reg96[(1'h1):(1'h0)] ? (8'ha4) : wire55[(1'h1):(1'h0)]);
  assign wire99 = {wire98[(4'h8):(2'h2)]};
endmodule

module module57
#(parameter param90 = (((^(^~(+(8'ha0)))) >>> ({(~(8'hba))} <= {((8'ha3) ^~ (8'hb2))})) < ({(~^((7'h44) > (8'hbd))), (((8'hb5) ? (7'h40) : (8'ha0)) <= ((8'ha0) != (8'ha1)))} ? {(|{(8'hbc), (8'hba)})} : (^~{((8'hb1) ? (8'hb4) : (8'ha1))}))))
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire62;
  input wire [(3'h7):(1'h0)] wire61;
  input wire [(3'h6):(1'h0)] wire60;
  input wire [(5'h13):(1'h0)] wire59;
  input wire signed [(4'hc):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire84,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg87,
                 reg86,
                 reg85,
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
                 reg71,
                 (1'h0)};
  assign wire63 = {$signed((($signed(wire62) - wire61[(1'h0):(1'h0)]) ?
                          (~^wire62[(3'h4):(3'h4)]) : wire58)),
                      ({$signed($signed((7'h41))),
                          $unsigned((+wire62))} > wire62)};
  assign wire64 = (wire62[(3'h7):(1'h1)] ?
                      ((8'haa) + (^{(wire58 ^ (8'hb6))})) : ((($signed(wire61) ^ (wire63 ?
                              wire62 : (8'hab))) ?
                          $signed((-wire59)) : wire60) > wire58[(1'h1):(1'h0)]));
  assign wire65 = (wire62 ?
                      $signed(wire59[(5'h10):(4'ha)]) : $unsigned((($unsigned(wire62) + (wire60 ?
                          wire58 : (8'h9f))) && $signed((wire64 ?
                          wire60 : wire64)))));
  assign wire66 = $signed(wire59);
  assign wire67 = {(wire63[(3'h4):(1'h0)] | wire63[(1'h1):(1'h1)]),
                      (wire62[(4'h9):(1'h1)] - wire58[(4'hb):(1'h1)])};
  assign wire68 = wire66[(1'h0):(1'h0)];
  assign wire69 = (~|wire58);
  assign wire70 = $signed($unsigned(wire61[(3'h6):(3'h6)]));
  always
    @(posedge clk) begin
      reg71 <= wire60;
      reg72 <= ($signed(wire58) ?
          $unsigned({{wire59[(1'h1):(1'h1)],
                  (~wire60)}}) : $unsigned($unsigned($signed(wire62))));
      if (((~^wire63) * $unsigned((~&(^{wire63})))))
        begin
          if ({wire64[(1'h1):(1'h0)],
              ((((^~wire62) && {wire67, wire65}) ?
                      (!wire63[(2'h3):(1'h0)]) : ((~&wire69) ?
                          (reg71 >>> wire69) : (~^wire58))) ?
                  wire66 : wire58[(2'h2):(1'h1)])})
            begin
              reg73 <= reg72[(3'h4):(3'h4)];
              reg74 <= wire67[(5'h11):(4'he)];
              reg75 <= ($unsigned(({$signed(wire58), (wire70 > reg71)} ?
                      wire66 : $unsigned((!wire63)))) ?
                  wire60[(3'h4):(2'h2)] : wire69);
              reg76 <= wire61[(2'h3):(1'h0)];
              reg77 <= wire61;
            end
          else
            begin
              reg73 <= $signed($signed(wire64[(1'h0):(1'h0)]));
            end
          reg78 <= {wire59[(4'hd):(3'h6)]};
          if (($signed($signed({(wire67 ? wire70 : (8'hb9))})) + (!wire59)))
            begin
              reg79 <= (+$signed(($unsigned(wire64[(2'h3):(1'h1)]) == ((|(8'hb6)) ?
                  ((7'h44) >= reg72) : (wire61 ^ wire62)))));
              reg80 <= $signed($unsigned($signed(($unsigned(wire59) ?
                  $unsigned(reg77) : $signed(wire62)))));
              reg81 <= reg75;
            end
          else
            begin
              reg79 <= (wire61[(1'h1):(1'h1)] ~^ (reg74[(2'h2):(1'h1)] <<< wire63[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          reg73 <= (((reg71 ?
                  wire66[(1'h0):(1'h0)] : (-(^(8'hb7)))) && ($unsigned((wire58 ?
                  (8'hba) : reg77)) <<< $unsigned($signed(wire58)))) ?
              $unsigned(((~((8'hba) ?
                  (8'hb8) : wire67)) ~^ (reg79[(3'h6):(1'h0)] || wire70))) : $unsigned($unsigned(reg75[(3'h6):(3'h6)])));
        end
      reg82 <= wire65;
      reg83 <= $unsigned($signed(reg81[(4'hf):(3'h7)]));
    end
  assign wire84 = (wire65 ?
                      wire63[(2'h3):(2'h3)] : (reg75[(3'h6):(3'h6)] > (~|$unsigned((8'ha4)))));
  always
    @(posedge clk) begin
      reg85 <= $unsigned($unsigned(wire61[(2'h3):(1'h1)]));
      reg86 <= wire61;
      reg87 <= wire58;
    end
  assign wire88 = $signed((+(wire64[(2'h2):(1'h1)] ?
                      $unsigned((reg79 ?
                          wire68 : reg73)) : reg72[(1'h0):(1'h0)])));
  assign wire89 = $signed($unsigned({((reg78 ?
                          reg86 : wire61) == $unsigned(wire69)),
                      $unsigned((wire68 ? wire63 : (8'hba)))}));
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(2'h2):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire15,
                 wire14,
                 wire13,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire13 = $signed(wire11[(1'h1):(1'h1)]);
  assign wire14 = (~|wire10[(1'h0):(1'h0)]);
  assign wire15 = $unsigned($signed((($signed(wire14) + $signed(wire9)) ?
                      $unsigned($unsigned(wire11)) : (!wire8[(3'h7):(3'h7)]))));
  always
    @(posedge clk) begin
      if ((&(8'ha7)))
        begin
          reg16 <= (~&$signed((~|wire15[(2'h3):(2'h2)])));
          reg17 <= ((~|$unsigned(((wire15 > wire10) >= $signed(wire13)))) ?
              wire8[(4'ha):(4'h9)] : ($signed($unsigned(reg16)) * (~|(wire12[(4'he):(3'h4)] && wire10))));
          reg18 <= reg16;
          if (wire10)
            begin
              reg19 <= wire12;
            end
          else
            begin
              reg19 <= (wire9[(2'h2):(1'h1)] ?
                  $signed($unsigned((reg19 ?
                      wire15 : (wire14 ^ (8'ha9))))) : $signed($unsigned($signed((&wire9)))));
              reg20 <= wire14;
            end
        end
      else
        begin
          reg16 <= ($signed((^~($unsigned(reg17) && (reg20 <= wire10)))) ?
              ((((wire11 || (8'haf)) ? {wire11, wire13} : {reg16, wire13}) ?
                  wire10 : wire8) <= reg16) : wire11);
        end
      if ($signed($signed((~&$signed((~&wire8))))))
        begin
          reg21 <= {$signed($unsigned($signed((reg16 ? reg17 : wire12))))};
          if ((~|$signed($signed($signed((reg17 ? wire13 : reg16))))))
            begin
              reg22 <= (^~(-$signed(reg21)));
            end
          else
            begin
              reg22 <= $signed(reg16[(1'h0):(1'h0)]);
              reg23 <= (~{(!(!$signed((8'hb5)))), wire9});
            end
          reg24 <= wire11;
          reg25 <= $signed($signed(wire15));
          reg26 <= ((&$signed(reg24)) ?
              $unsigned((^$unsigned((8'haf)))) : ($unsigned(wire9[(3'h7):(1'h1)]) < $unsigned($unsigned(reg18[(3'h6):(3'h4)]))));
        end
      else
        begin
          if ((^$unsigned($signed(reg18[(1'h1):(1'h1)]))))
            begin
              reg21 <= (^~(((wire11 ?
                      reg25[(4'h9):(1'h1)] : (reg18 << reg21)) ^~ $unsigned($unsigned(reg16))) ?
                  reg26 : $signed($signed({reg18}))));
            end
          else
            begin
              reg21 <= $unsigned(reg20[(3'h7):(2'h3)]);
              reg22 <= $unsigned($unsigned($signed({(~wire11),
                  wire13[(4'ha):(2'h3)]})));
            end
          reg23 <= reg24;
          if ((&(wire9[(3'h6):(1'h1)] << reg19)))
            begin
              reg24 <= $unsigned((((reg21[(3'h5):(1'h0)] ?
                          wire8 : $unsigned(reg23)) ?
                      reg22 : wire8) ?
                  wire9 : $signed($signed({wire9}))));
              reg25 <= (reg19 ? wire15 : reg17);
              reg26 <= ($unsigned(wire11) ?
                  reg26 : $signed($signed(((reg21 && reg16) && {reg19}))));
              reg27 <= {$signed($unsigned(($signed(reg20) ?
                      (reg20 && wire13) : (|reg22))))};
            end
          else
            begin
              reg24 <= $unsigned((&{$signed((-reg21))}));
            end
          reg28 <= ((reg27 ^~ reg27[(3'h4):(1'h0)]) ?
              $signed(((wire12 ? wire13 : ((8'hb0) ? (8'ha5) : wire11)) ?
                  (8'h9d) : ({reg25,
                      reg17} > (reg16 >> wire8)))) : ($unsigned(({(8'hbc)} * reg17[(4'h8):(3'h7)])) < (reg26 || {wire14})));
          if ((reg27 >>> {reg25[(4'h9):(2'h2)],
              ($unsigned((wire15 << reg24)) ?
                  ({reg24} == (reg20 << wire8)) : wire14[(1'h0):(1'h0)])}))
            begin
              reg29 <= (^reg28);
              reg30 <= $unsigned(reg22);
            end
          else
            begin
              reg29 <= wire15[(4'hf):(3'h6)];
              reg30 <= reg25[(3'h7):(2'h2)];
            end
        end
      reg31 <= $signed((-({(reg17 ^~ reg23)} ?
          $unsigned(reg26) : {$unsigned(wire9)})));
      if ((-reg27))
        begin
          reg32 <= reg22;
          reg33 <= (|(~^($signed($signed(reg24)) ?
              ($signed(wire13) ?
                  wire8 : ((8'hba) || (8'ha4))) : $signed((wire12 && reg29)))));
          reg34 <= reg28[(5'h10):(3'h6)];
          reg35 <= $unsigned((((+$signed(reg25)) ?
              wire15 : (|reg34[(1'h0):(1'h0)])) == $unsigned($unsigned((reg27 ?
              wire12 : wire11)))));
          reg36 <= reg25;
        end
      else
        begin
          reg32 <= (reg17[(3'h7):(3'h7)] >= $signed((((reg35 ?
              (8'hb5) : wire15) - $unsigned(reg20)) >>> ($signed(wire13) ?
              $unsigned(reg23) : ((8'hb0) ? reg27 : wire12)))));
          reg33 <= (~(($signed({wire8}) ?
                  wire13[(4'h8):(3'h5)] : {(&wire10), $signed(reg25)}) ?
              ({{(8'h9c)}, (reg30 ? reg19 : reg35)} ?
                  $unsigned(((8'ha6) ?
                      wire12 : wire13)) : $unsigned($unsigned(reg19))) : reg35[(4'h9):(1'h0)]));
          reg34 <= reg33;
          if (reg26)
            begin
              reg35 <= ($signed((reg19 ?
                      $signed(reg26[(5'h10):(3'h7)]) : (wire9 * (~^wire11)))) ?
                  reg36[(4'h8):(1'h0)] : ({$unsigned((~|(7'h44)))} * wire10[(4'h9):(1'h0)]));
            end
          else
            begin
              reg35 <= (~&(wire12[(5'h10):(4'h9)] ?
                  reg20[(1'h0):(1'h0)] : reg34[(2'h2):(2'h2)]));
            end
        end
      if ($signed(wire13))
        begin
          reg37 <= (|$signed(reg21[(4'hf):(4'hf)]));
          if ((($signed((reg28 ? wire15 : (wire14 * reg19))) ?
              reg37[(2'h3):(2'h3)] : {(~&reg26[(4'ha):(1'h1)])}) && (+$signed($signed((reg16 ?
              reg29 : reg27))))))
            begin
              reg38 <= $unsigned($unsigned((reg23 ?
                  ((reg17 ? (8'hb5) : reg35) | {(8'hbe),
                      reg23}) : wire14[(2'h2):(1'h0)])));
              reg39 <= reg31[(1'h1):(1'h0)];
            end
          else
            begin
              reg38 <= reg16;
              reg39 <= $signed((+$unsigned((reg35 ?
                  $signed(reg23) : $signed(reg27)))));
              reg40 <= $signed($unsigned($unsigned($unsigned($unsigned(reg22)))));
              reg41 <= (reg40[(1'h1):(1'h1)] >>> (!(8'hb5)));
            end
          reg42 <= (+reg36[(3'h4):(1'h1)]);
          if (((^wire15) ?
              $signed(reg16) : ($signed(reg28) * $signed((reg23 ?
                  (wire9 != reg37) : (reg26 > reg21))))))
            begin
              reg43 <= ({{(~^reg27), ((&(8'hb4)) << reg33[(3'h6):(2'h2)])},
                      (reg33[(3'h6):(2'h2)] ?
                          reg26 : (reg28[(3'h6):(1'h1)] ?
                              $signed(reg35) : reg20))} ?
                  (|(^reg25[(4'h9):(3'h7)])) : (|reg17));
              reg44 <= (&$signed($signed((~&$unsigned(reg25)))));
              reg45 <= (8'ha8);
              reg46 <= wire12;
            end
          else
            begin
              reg43 <= $signed($signed((~$unsigned((reg35 ? reg17 : reg32)))));
              reg44 <= $signed(wire8);
              reg45 <= $signed((~&$signed((~^(wire10 ? reg43 : (8'hbc))))));
            end
          reg47 <= $signed((^(^($signed((8'hb8)) != reg21))));
        end
      else
        begin
          reg37 <= $signed(reg34[(2'h2):(2'h2)]);
          reg38 <= wire8[(3'h7):(1'h0)];
          reg39 <= (^($unsigned($unsigned((reg33 | reg42))) ?
              $signed(reg40) : ($signed($signed(reg17)) ^~ reg47)));
        end
    end
  assign wire48 = reg41[(3'h5):(1'h0)];
  assign wire49 = reg39[(2'h2):(1'h1)];
endmodule
