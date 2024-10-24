module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire95,
                 wire93,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire4 = (~&wire3[(3'h5):(1'h0)]);
  assign wire5 = $signed($signed(((~^(~^wire0)) << ($signed(wire0) ?
                     $signed(wire2) : (wire1 ? (8'hae) : wire1)))));
  assign wire6 = $signed({$unsigned(($signed(wire5) ?
                         $unsigned(wire2) : wire4[(1'h0):(1'h0)])),
                     $unsigned($unsigned($signed(wire5)))});
  assign wire7 = (8'ha5);
  module8 #() modinst94 (.wire11(wire0), .wire9(wire3), .wire10(wire4), .clk(clk), .y(wire93), .wire12(wire7));
  assign wire95 = wire2[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg96 <= wire3[(3'h4):(2'h2)];
      reg97 <= wire0;
      if ($unsigned(wire7))
        begin
          reg98 <= wire5[(2'h2):(2'h2)];
          reg99 <= wire1[(3'h7):(2'h2)];
        end
      else
        begin
          reg98 <= $unsigned(wire4);
          reg99 <= ({(((wire93 ? wire1 : wire1) ?
                      (wire3 ? wire3 : wire1) : $signed(wire7)) & wire1)} ?
              (8'h9f) : {$signed((wire0 ?
                      (wire5 & wire2) : (reg99 ? (8'hae) : reg97))),
                  $signed(((wire4 ? (8'haf) : wire4) ?
                      (wire3 ^ wire2) : $unsigned(wire3)))});
          reg100 <= wire0;
        end
    end
  assign wire101 = (^$unsigned(((((8'hb3) << reg98) > $unsigned(reg98)) ?
                       ({wire6} ? ((8'h9c) ? wire0 : reg96) : wire5) : {{wire93,
                               reg99}})));
  assign wire102 = $signed(wire7);
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h1d0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  input wire [(4'h8):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire44;
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  assign y = {wire92,
                 wire90,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire12[(4'hb):(2'h2)] >>> wire10[(3'h5):(3'h5)]))
        begin
          reg13 <= $signed((wire11 ^~ wire12));
        end
      else
        begin
          reg13 <= wire12;
        end
      reg14 <= {$unsigned({(^(8'ha0))}), $signed(wire9)};
      reg15 <= ($unsigned((7'h44)) ?
          (^~(&(8'hbb))) : (-{(wire9[(2'h2):(2'h2)] ?
                  (wire12 ? reg13 : (8'hb2)) : $unsigned(wire9)),
              $unsigned($signed((8'hb0)))}));
      reg16 <= wire10[(1'h0):(1'h0)];
      if ($signed($unsigned($unsigned(wire11[(3'h5):(1'h0)]))))
        begin
          reg17 <= (|wire9);
          reg18 <= wire12[(2'h3):(1'h0)];
          reg19 <= wire12;
          reg20 <= wire11;
        end
      else
        begin
          reg17 <= $unsigned($signed(((reg14 ?
                  (wire12 ? wire11 : reg16) : ((8'hb1) ? reg14 : reg18)) ?
              (&$signed(reg14)) : ($signed(wire11) ?
                  ((8'ha8) >= (8'hae)) : (^reg19)))));
          reg18 <= $unsigned({reg16, (7'h40)});
          reg19 <= reg19[(3'h5):(2'h3)];
        end
    end
  always
    @(posedge clk) begin
      if (((($unsigned((reg13 ? (8'ha7) : (8'ha8))) ?
              (reg16 >> $unsigned(reg17)) : ($unsigned(wire11) * (wire9 ^~ (8'hac)))) ~^ $unsigned($unsigned($signed(wire11)))) ?
          ({((&(8'hbc)) ? (~^wire9) : reg20), $signed((~|reg19))} ?
              (-(^~$signed(reg17))) : $unsigned(($signed(reg13) ?
                  (8'h9d) : $unsigned(wire10)))) : ((|(+{reg18})) <<< reg20)))
        begin
          reg21 <= reg17[(3'h4):(1'h1)];
          reg22 <= reg16;
          if (reg20[(4'ha):(2'h2)])
            begin
              reg23 <= (-reg21[(4'hc):(3'h4)]);
            end
          else
            begin
              reg23 <= reg21[(2'h2):(1'h0)];
              reg24 <= reg21[(4'h8):(1'h0)];
              reg25 <= $unsigned($unsigned((reg18[(4'hd):(4'hc)] ?
                  $signed($signed(reg21)) : ((&(7'h44)) ?
                      (wire9 <<< reg17) : $unsigned((8'ha1))))));
              reg26 <= wire10[(2'h3):(2'h3)];
            end
          reg27 <= (wire12 ^ reg22);
          reg28 <= reg20;
        end
      else
        begin
          reg21 <= $signed($signed(reg14));
          reg22 <= reg27[(1'h1):(1'h1)];
        end
      reg29 <= (reg17[(1'h0):(1'h0)] >>> ($unsigned($unsigned(reg22)) ?
          (($unsigned(reg28) ?
              (reg15 ^ reg26) : reg13[(3'h6):(3'h4)]) + ((reg26 ?
                  reg20 : reg16) ?
              (reg18 + reg17) : (wire11 ?
                  reg16 : wire9))) : reg28[(1'h0):(1'h0)]));
      reg30 <= $signed((-$signed((wire11[(2'h3):(2'h3)] ^~ $signed((8'ha5))))));
    end
  module31 #() modinst45 (.wire33(reg18), .wire35(reg17), .y(wire44), .wire32(reg24), .clk(clk), .wire34(reg13));
  assign wire46 = (+$signed($unsigned(($unsigned(reg29) ? wire9 : reg18))));
  assign wire47 = reg20[(4'h9):(4'h9)];
  assign wire48 = wire9;
  assign wire49 = ($unsigned((^~reg16)) == (wire46 ~^ reg29[(3'h7):(1'h1)]));
  assign wire50 = $signed((-reg20[(3'h5):(2'h2)]));
  assign wire51 = $signed((reg18[(5'h10):(4'hc)] ?
                      (({reg18, reg27} <<< $signed(reg13)) ?
                          reg17 : reg27) : (($signed(reg19) ?
                          (^~reg29) : $signed(wire44)) || $unsigned($unsigned((7'h40))))));
  assign wire52 = ($unsigned((wire50 ?
                          $signed((reg15 ?
                              (8'hb9) : wire49)) : {reg22[(4'hd):(2'h2)],
                              reg17[(3'h7):(3'h5)]})) ?
                      reg25 : (({(wire49 >> wire44),
                              (reg18 ? reg30 : (8'ha6))} ?
                          wire10 : reg28[(1'h0):(1'h0)]) < $unsigned((wire46 >= (wire49 >> reg27)))));
  assign wire53 = ((!{({reg26} ? (reg16 + wire47) : $signed(reg16))}) ?
                      reg15 : {((~|$unsigned((8'hb1))) ^~ ($unsigned((8'hba)) | wire10)),
                          reg16});
  assign wire54 = reg28;
  assign wire55 = ((((^(+wire48)) == (-(&reg19))) <<< (|$unsigned($signed((7'h43))))) ?
                      $signed(wire47) : (+((wire52 ?
                          (wire9 < reg16) : (reg25 >= (8'ha1))) > $unsigned((reg21 ~^ reg14)))));
  assign wire56 = $signed(reg15[(1'h1):(1'h0)]);
  assign wire57 = (8'ha6);
  assign wire58 = $signed(($unsigned($signed($signed(wire49))) * $signed($signed(reg22[(4'hc):(4'h9)]))));
  assign wire59 = $signed($unsigned({(~$unsigned((8'hbe)))}));
  assign wire60 = ($unsigned(reg17) >> $unsigned($unsigned($unsigned({reg15,
                      wire57}))));
  assign wire61 = {reg24,
                      $unsigned(({((8'hbf) || reg21)} - reg25[(4'hf):(2'h2)]))};
  assign wire62 = ($unsigned(wire61[(4'h8):(3'h7)]) <<< ((((wire55 | reg17) ?
                          $unsigned(wire55) : wire51) - (~&$signed(wire59))) ?
                      $unsigned(reg19[(3'h4):(1'h1)]) : reg25));
  assign wire63 = (+$signed($signed((reg18 ?
                      $signed(wire12) : (wire11 ? reg29 : reg27)))));
  module64 #() modinst91 (wire90, clk, reg16, wire57, reg20, wire48);
  assign wire92 = (((wire47 >> wire10[(3'h5):(2'h2)]) >> wire11[(3'h4):(1'h1)]) >>> (~&(reg16[(1'h1):(1'h1)] <<< $unsigned((8'hae)))));
endmodule

module module64
#(parameter param88 = ({{(((8'hae) | (8'h9c)) <<< (~(8'haf))), {(|(8'hbc)), (^~(8'ha7))}}, ({{(7'h42), (8'hb1)}} <<< (^((7'h43) ~^ (8'h9d))))} ? ((^(((8'ha7) ? (8'ha9) : (8'hbb)) <<< ((8'haf) == (8'haf)))) ^ ((((8'haf) ^ (8'hbe)) ? ((8'had) ? (8'ha3) : (8'ha2)) : ((8'haa) * (8'ha0))) && (^~((8'hba) ? (8'hb6) : (8'had))))) : (~&((~|{(8'haa)}) ? (((8'hb3) < (8'ha4)) > (+(8'hb8))) : ((^(8'hb0)) <<< (~|(8'h9c)))))), 
parameter param89 = (8'hb7))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire68;
  input wire [(5'h10):(1'h0)] wire67;
  input wire signed [(3'h6):(1'h0)] wire66;
  input wire signed [(3'h4):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
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
  assign wire69 = {(~^$signed(($unsigned(wire68) < (wire65 ?
                          wire68 : wire66))))};
  assign wire70 = ((~^(~wire65)) ^~ $signed(($signed(wire68) ?
                      ((wire68 && wire66) <= ((7'h43) <= (7'h41))) : ((wire68 + wire65) <= (wire65 ?
                          wire66 : (7'h40))))));
  assign wire71 = $signed($unsigned((~&(~^(wire67 ? wire67 : wire67)))));
  always
    @(posedge clk) begin
      reg72 <= ((~|(^~wire69[(2'h2):(2'h2)])) ?
          ($signed(wire68) != $unsigned((wire67[(4'hd):(3'h7)] == $signed((8'hbf))))) : (wire70 + $unsigned(((+wire68) != (wire67 << (8'hbf))))));
      if ({{($unsigned(wire69) ? {(!wire67)} : wire70)}})
        begin
          if (((wire70 ? (^~$signed({wire68})) : wire65) ?
              (wire70 ?
                  wire68 : $signed(wire69[(1'h1):(1'h1)])) : ((wire67[(4'hb):(2'h3)] >= $signed(wire68)) ?
                  {wire68, $unsigned($unsigned(wire66))} : ((-wire68) ?
                      {(wire69 ? (8'h9f) : wire66)} : $signed(wire71)))))
            begin
              reg73 <= wire66[(3'h5):(1'h1)];
            end
          else
            begin
              reg73 <= {$unsigned(wire65[(3'h4):(2'h2)]), reg73};
              reg74 <= wire70[(1'h1):(1'h0)];
              reg75 <= ($signed((|$unsigned(wire66[(3'h4):(2'h2)]))) ^~ (wire69 ?
                  wire71 : (wire65 ?
                      $unsigned((^wire66)) : reg74[(4'hf):(2'h3)])));
              reg76 <= ((-((reg74[(1'h0):(1'h0)] ? $unsigned(wire70) : reg74) ?
                  $unsigned(reg74) : (~|((8'ha8) | reg72)))) ^ reg74);
              reg77 <= (wire71 ? reg72[(1'h0):(1'h0)] : reg72);
            end
        end
      else
        begin
          if (wire65[(2'h2):(1'h0)])
            begin
              reg73 <= reg76;
              reg74 <= wire67[(5'h10):(4'hf)];
            end
          else
            begin
              reg73 <= wire71[(3'h6):(3'h5)];
              reg74 <= ({(reg75 ?
                      ((wire67 ? reg76 : wire68) <= reg75) : ((~^reg72) ?
                          reg77 : (reg74 < reg72))),
                  reg77} >> (!wire65));
              reg75 <= (-(reg77 ^ reg75[(3'h4):(1'h1)]));
              reg76 <= ((((wire70[(3'h7):(3'h7)] > (+wire71)) ?
                      ((!reg76) == reg75[(3'h5):(3'h5)]) : $signed(wire68)) ?
                  (reg72 ?
                      reg75[(3'h5):(1'h0)] : $unsigned((reg72 > (8'hb1)))) : (^{reg74,
                      {reg77, (8'hb3)}})) < ({$unsigned(reg73)} ?
                  $unsigned(($unsigned(wire70) * (wire67 ^~ reg72))) : ($signed($signed(wire65)) | ((|wire69) & (reg72 ?
                      wire67 : reg74)))));
              reg77 <= (7'h40);
            end
          reg78 <= (^~{$signed(wire71[(3'h5):(1'h1)])});
        end
    end
  always
    @(posedge clk) begin
      reg79 <= $unsigned($unsigned($unsigned((&$signed((8'ha4))))));
      reg80 <= {(|$unsigned(wire66)),
          ((-(^~wire68[(4'h8):(2'h2)])) ?
              ((&(wire67 ? reg77 : wire69)) < (^(~^reg75))) : wire69)};
      if ($signed((reg74[(3'h5):(3'h4)] ?
          $unsigned($unsigned((reg73 ?
              reg79 : wire68))) : ((wire71 ^ (reg79 <= (8'h9d))) >= ($unsigned(reg76) ?
              reg77 : $unsigned((8'hb5)))))))
        begin
          reg81 <= $signed(($unsigned(wire66) ?
              $unsigned(reg76) : (((reg76 ? wire67 : wire66) ?
                      $unsigned(wire70) : (~wire66)) ?
                  (!$unsigned(wire66)) : ((reg76 ? wire67 : reg79) ?
                      reg74 : wire68))));
          reg82 <= $unsigned(($signed($unsigned((~&wire70))) + reg72));
          reg83 <= $signed(((^~reg80[(4'hb):(3'h5)]) ?
              (-$signed(reg73[(1'h0):(1'h0)])) : (+$signed((~&reg72)))));
          reg84 <= $unsigned((((~^((8'hbe) ?
              reg73 : reg72)) ^~ {$signed(reg74)}) < reg73[(1'h0):(1'h0)]));
        end
      else
        begin
          reg81 <= $unsigned($unsigned((reg72 ?
              ($signed(wire70) ?
                  {wire68, reg78} : {(8'hae),
                      wire67}) : reg72[(3'h6):(2'h3)])));
          if ($signed((|(~reg81))))
            begin
              reg82 <= (8'hb7);
              reg83 <= (8'hab);
              reg84 <= (reg78[(3'h5):(1'h1)] ?
                  (8'hb5) : (((wire66[(3'h6):(3'h6)] <= $signed(reg74)) * {(wire71 ?
                          reg80 : wire65)}) > (8'h9e)));
              reg85 <= {((({reg76} ?
                          (wire66 != reg75) : reg76) >>> (^~$signed(reg82))) ?
                      $unsigned(wire70) : ($unsigned((reg82 >> wire69)) ?
                          reg73 : {$unsigned(reg82), $signed((8'hb2))})),
                  (reg78[(1'h0):(1'h0)] ?
                      (($unsigned(reg77) ? reg83[(4'hc):(1'h0)] : {reg76}) ?
                          {reg75,
                              ((7'h40) >>> reg79)} : $unsigned($signed(reg77))) : $signed({reg84}))};
            end
          else
            begin
              reg82 <= $unsigned(({(reg73[(4'hb):(3'h5)] != reg82)} ?
                  reg72[(3'h5):(3'h5)] : (((wire69 ? wire68 : wire67) ?
                      {(7'h41),
                          reg76} : reg85[(1'h0):(1'h0)]) + reg80[(2'h2):(1'h0)])));
            end
          reg86 <= wire70[(4'h9):(4'h8)];
        end
      reg87 <= reg80;
    end
endmodule

module module31  (y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire35;
  input wire signed [(5'h11):(1'h0)] wire34;
  input wire [(3'h6):(1'h0)] wire33;
  input wire signed [(4'h9):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 (1'h0)};
  assign wire36 = $unsigned($unsigned(((wire34[(4'ha):(3'h5)] >>> (~^wire35)) ?
                      (8'ha8) : (-wire33))));
  assign wire37 = (^~($signed(wire33[(1'h0):(1'h0)]) || $signed((~&wire34))));
  assign wire38 = ((~wire37) ?
                      $signed((~(~|$signed((8'ha9))))) : (wire34[(1'h1):(1'h1)] ?
                          $signed(((wire33 | wire36) ?
                              wire35 : (&wire37))) : $unsigned((^$unsigned(wire32)))));
  assign wire39 = ($signed(($unsigned((^~wire33)) <= ((|wire33) | $unsigned((8'had))))) ?
                      $unsigned((~wire33)) : $unsigned({{wire36,
                              $signed(wire32)}}));
  assign wire40 = ((!wire36[(2'h3):(1'h0)]) >= wire39[(3'h6):(1'h1)]);
  assign wire41 = wire32;
  assign wire42 = wire35;
  assign wire43 = {($unsigned((wire36 < (!wire40))) ?
                          $signed((8'hb1)) : wire36)};
endmodule
