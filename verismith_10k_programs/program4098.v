module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1b3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire97;
  wire [(4'hd):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire63;
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire82,
                 wire81,
                 wire80,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire5,
                 wire63,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
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
  assign wire5 = wire1;
  module6 #() modinst64 (wire63, clk, wire2, wire5, wire4, wire1, wire3);
  assign wire65 = (~|wire3);
  assign wire66 = wire63[(3'h5):(3'h5)];
  assign wire67 = (8'hab);
  assign wire68 = {(wire5[(2'h3):(1'h1)] != ((&wire2) || {wire65})),
                      $unsigned(wire63[(2'h2):(1'h0)])};
  assign wire69 = ((wire65[(3'h4):(1'h0)] ?
                          $signed((|$signed((8'hb9)))) : (^~wire2[(5'h12):(3'h4)])) ?
                      wire63[(4'h9):(2'h3)] : $signed((wire4[(2'h2):(1'h1)] ?
                          wire66[(4'h8):(3'h7)] : $signed(wire65))));
  assign wire70 = $signed($signed((($unsigned(wire4) && (wire1 && wire65)) ?
                      wire2[(5'h14):(2'h3)] : $unsigned($signed((8'hac))))));
  always
    @(posedge clk) begin
      reg71 <= $unsigned((wire68[(3'h7):(1'h0)] ? $unsigned(wire4) : wire1));
      reg72 <= wire2[(5'h13):(3'h7)];
      if (wire70[(3'h4):(2'h3)])
        begin
          reg73 <= $signed(wire4[(3'h5):(1'h0)]);
          reg74 <= $signed(($unsigned({(wire66 ? wire4 : wire65)}) ?
              $signed((reg73 >>> (8'hb6))) : $signed($unsigned($signed(wire3)))));
          reg75 <= ((reg74[(2'h3):(2'h2)] ?
                  wire3 : (!(+(wire5 ? wire0 : wire67)))) ?
              reg73[(1'h0):(1'h0)] : (+$unsigned($signed(wire5))));
          reg76 <= ((wire67 <= $signed(((reg74 ? reg74 : wire1) ?
              reg74[(1'h0):(1'h0)] : (wire65 != wire4)))) || ((~&$unsigned($unsigned(wire4))) ?
              reg72[(3'h4):(1'h1)] : wire66));
        end
      else
        begin
          reg73 <= wire65[(4'h9):(3'h6)];
          reg74 <= wire67;
        end
    end
  always
    @(posedge clk) begin
      reg77 <= {{{{(wire1 * reg74)}},
              (($signed(wire67) ^ $unsigned(reg74)) ?
                  ($unsigned(wire2) == (wire2 ? (7'h44) : wire70)) : (8'ha3))}};
      reg78 <= wire67;
      reg79 <= wire69;
    end
  assign wire80 = ($unsigned($unsigned(((reg71 >>> wire4) ?
                          $unsigned((7'h42)) : wire68[(3'h5):(2'h3)]))) ?
                      wire69[(1'h0):(1'h0)] : (((^$unsigned(wire5)) - {$signed(wire67)}) <<< $unsigned({(wire67 ?
                              reg79 : reg74),
                          reg71[(4'h9):(3'h5)]})));
  assign wire81 = reg78;
  assign wire82 = {wire80[(2'h2):(1'h0)], wire3};
  always
    @(posedge clk) begin
      reg83 <= (wire69[(4'h8):(4'h8)] ?
          $unsigned(((+((8'haf) ? wire70 : wire4)) + (wire81[(4'hd):(4'hc)] ?
              wire5 : (~&reg74)))) : (^($signed((wire2 | reg72)) ?
              ($unsigned(wire0) ? (^~(8'hb3)) : $unsigned(wire0)) : reg79)));
      if (({(reg77 ? reg74[(2'h3):(1'h1)] : $unsigned($signed(wire3))),
              $signed(reg76)} ?
          (-reg73) : {wire3, $unsigned(reg71)}))
        begin
          reg84 <= (((~((wire67 ?
                  wire66 : wire63) | {reg72})) <= $signed((-{wire80}))) ?
              ($signed((8'ha2)) ?
                  wire4[(3'h4):(3'h4)] : (reg71 < (((8'hab) ?
                      wire0 : wire70) << $signed(reg76)))) : ({(|wire0),
                      $unsigned(reg78)} ?
                  (~^wire65) : (($unsigned(wire68) == (!wire1)) ?
                      $unsigned($signed(wire69)) : reg76)));
          if (((-(+wire0)) ?
              (~&reg84) : (($signed({wire82, reg77}) ?
                      ($unsigned(wire3) - wire81[(4'h8):(3'h4)]) : $signed(wire70)) ?
                  $unsigned((|reg71)) : (&$unsigned(((8'ha0) >>> wire0))))))
            begin
              reg85 <= {(8'hb6)};
            end
          else
            begin
              reg85 <= (!((^$unsigned(wire2)) ~^ (+(~|$signed(wire5)))));
              reg86 <= $unsigned($unsigned($unsigned($signed({wire67}))));
              reg87 <= (reg78[(1'h0):(1'h0)] ?
                  $unsigned((^~$unsigned((wire69 != reg71)))) : wire5);
              reg88 <= {$unsigned(wire3[(4'hd):(3'h6)])};
              reg89 <= (~|($unsigned((wire1 || (wire80 & wire67))) <<< ((+{wire68,
                  wire1}) >> (reg74[(2'h2):(1'h1)] || {(8'hb5), wire65}))));
            end
        end
      else
        begin
          reg84 <= $unsigned((wire2[(4'ha):(4'h9)] <<< $signed(({wire0} ?
              wire67[(1'h0):(1'h0)] : (8'h9f)))));
          reg85 <= $unsigned(reg84[(4'hb):(3'h7)]);
          reg86 <= $signed((((reg77[(4'hf):(3'h6)] ?
                  $unsigned(wire80) : wire69[(2'h3):(2'h2)]) ^~ $unsigned(wire2[(5'h14):(4'ha)])) ?
              (-((~&(8'ha0)) ?
                  (8'hbf) : $unsigned(wire66))) : $unsigned($signed($unsigned(reg73)))));
        end
      if (({(reg88[(4'ha):(1'h0)] != $signed(wire82))} - (reg86[(3'h5):(2'h3)] ?
          ((^~((8'hb2) ? wire70 : reg79)) ?
              ($signed(wire81) ~^ reg74) : {(reg87 ^~ wire3),
                  $signed(reg88)}) : (!((wire66 ?
              reg77 : (8'hbc)) & $signed((8'hae)))))))
        begin
          reg90 <= ({$unsigned($signed({reg83})),
              {(wire1 ? (~^reg85) : {wire1, reg77})}} * reg83);
        end
      else
        begin
          reg90 <= wire5;
          reg91 <= {(~^(~&($signed(reg83) >>> $signed(wire0)))), reg86};
          reg92 <= reg88;
          reg93 <= ((~&wire67) < ((((wire81 ? reg91 : reg83) ?
                  (~reg71) : (reg78 + reg87)) >= $signed(reg90[(1'h1):(1'h1)])) ?
              (~&{$unsigned((8'hb8))}) : wire5));
          reg94 <= {$signed(((~^$unsigned(wire66)) ^ ($signed(wire70) ?
                  reg77 : $unsigned(wire63)))),
              $signed($unsigned(reg78[(3'h4):(2'h3)]))};
        end
      reg95 <= $unsigned(reg74[(2'h3):(1'h0)]);
    end
  assign wire96 = (~&wire65);
  assign wire97 = reg83[(4'h8):(3'h5)];
endmodule

module module6
#(parameter param61 = ({(((^(8'ha9)) ? (~&(8'hbe)) : (~(8'ha1))) ? (~^((8'ha1) ? (8'h9c) : (8'hbc))) : (((8'ha7) >> (8'h9e)) - ((8'ha7) ? (8'hb3) : (8'hb4)))), (((+(8'ha2)) >> (~|(8'hbe))) ? (8'hbf) : ((8'ha1) >>> ((8'hb3) > (7'h44))))} ? (((~|(~|(8'haa))) ? (((8'hb1) >= (8'hbe)) < ((8'haf) ? (8'hb2) : (8'hb8))) : {(-(8'ha1)), (&(8'hbe))}) ? (|(8'ha9)) : (((|(8'hac)) >> ((8'ha9) ? (8'ha0) : (8'ha7))) ? ((&(8'hb5)) & ((7'h41) != (8'had))) : (((8'ha2) ? (8'hb3) : (8'ha6)) ^~ {(8'hac), (8'hb9)}))) : (((((8'hbb) ? (8'hab) : (8'h9f)) ? ((8'hab) != (8'had)) : ((8'h9c) >= (8'ha0))) ? {(8'hb3), ((7'h42) || (8'hbb))} : ((~^(8'ha7)) ? ((8'ha0) ? (8'hb9) : (8'hb8)) : {(8'h9d), (8'ha2)})) < ((^((7'h44) ? (8'hb7) : (8'haa))) != (((8'ha4) <= (8'hb9)) + (|(8'hb2)))))), 
parameter param62 = param61)
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h217):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  assign y = {wire60,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire24,
                 wire23,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
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
                 reg22,
                 reg21,
                 reg20,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= (~|{wire7});
      reg13 <= $signed((wire7 >>> $signed(((reg12 - reg12) >> $signed(wire7)))));
      reg14 <= (~|wire11[(3'h7):(3'h7)]);
      reg15 <= wire7;
    end
  assign wire16 = $unsigned($signed($signed(wire10[(1'h1):(1'h1)])));
  assign wire17 = wire9[(3'h7):(1'h1)];
  assign wire18 = (~&(reg15[(1'h0):(1'h0)] * ($signed((wire8 ~^ reg12)) ?
                      {wire17[(4'h8):(2'h3)], reg12} : (&$unsigned((8'h9e))))));
  assign wire19 = (+(8'ha4));
  always
    @(posedge clk) begin
      reg20 <= wire16;
      reg21 <= (~^(reg12[(1'h1):(1'h1)] ?
          $signed((^~$signed(reg12))) : $signed($unsigned((|wire19)))));
      reg22 <= (8'ha5);
    end
  assign wire23 = wire9;
  assign wire24 = ({(wire7 ?
                              reg14[(4'ha):(4'h8)] : $signed(wire10[(3'h4):(1'h1)]))} ?
                      reg13[(3'h6):(1'h0)] : $signed($signed((wire19[(4'hd):(3'h5)] ?
                          $unsigned(reg22) : (|(8'hbb))))));
  always
    @(posedge clk) begin
      reg25 <= (~(+$signed((reg12 <= wire17[(4'h9):(2'h3)]))));
      reg26 <= $unsigned($unsigned(((reg22 ?
          $signed(wire7) : wire11[(4'h9):(2'h2)]) <<< {$signed(wire16)})));
      if (((!($unsigned(wire11) ? {$unsigned(reg14)} : wire24[(2'h2):(1'h1)])) ?
          ((reg26[(1'h1):(1'h1)] <= (&$unsigned(reg21))) - (reg21[(4'hc):(2'h2)] ?
              (~(~^(8'hb5))) : reg21)) : (reg21 ?
              $unsigned((8'ha1)) : (~|$unsigned($signed((8'hb9)))))))
        begin
          if (wire8)
            begin
              reg27 <= $unsigned(wire18[(1'h0):(1'h0)]);
            end
          else
            begin
              reg27 <= (($signed(((wire8 ? (8'h9c) : (8'hb6)) * (wire19 ?
                      (8'ha8) : reg22))) <<< (wire16 <<< wire23)) ?
                  reg20 : ({{$unsigned(reg25),
                          ((8'hbb) ? reg25 : reg13)}} || reg22));
              reg28 <= $unsigned((~^($unsigned((wire19 ? wire24 : reg20)) ?
                  ({reg21} || (8'ha8)) : (~reg15))));
            end
        end
      else
        begin
          reg27 <= $unsigned(wire18);
          if ((wire19[(4'h8):(4'h8)] >= reg26[(1'h0):(1'h0)]))
            begin
              reg28 <= reg20;
            end
          else
            begin
              reg28 <= (~^(^$signed(wire9)));
              reg29 <= wire10[(4'h8):(3'h4)];
              reg30 <= wire17[(1'h0):(1'h0)];
              reg31 <= (^~$signed(wire7));
              reg32 <= reg13[(3'h6):(1'h0)];
            end
          reg33 <= (reg30[(1'h1):(1'h0)] ?
              $signed(reg14[(4'hc):(3'h7)]) : ($signed($unsigned(reg28)) ?
                  reg27[(4'h8):(2'h3)] : reg14));
          if ($unsigned($signed(wire18)))
            begin
              reg34 <= reg21[(2'h2):(2'h2)];
              reg35 <= (reg29[(2'h2):(1'h1)] ~^ reg21[(2'h3):(1'h1)]);
              reg36 <= {((~^reg21[(4'ha):(2'h3)]) >= (-reg32[(2'h3):(1'h0)]))};
            end
          else
            begin
              reg34 <= wire10[(3'h7):(1'h0)];
              reg35 <= ((reg25 - $signed($unsigned(reg15))) ?
                  {{((reg14 ? wire18 : (8'hb4)) ?
                              wire24[(3'h7):(1'h1)] : $unsigned(reg33)),
                          $signed(reg20)}} : reg22);
              reg36 <= ((($signed($signed(reg14)) ?
                      wire10[(3'h4):(2'h2)] : reg35) || $signed($unsigned($unsigned((8'hbf))))) ?
                  (+reg27[(4'hf):(1'h1)]) : $unsigned($unsigned($signed($signed(reg27)))));
            end
          if ($signed(reg29[(3'h5):(1'h0)]))
            begin
              reg37 <= ($unsigned((8'ha2)) ~^ reg35);
              reg38 <= ($unsigned((8'hb3)) ?
                  $unsigned(((+$signed(wire24)) + {((8'ha4) ? reg21 : reg35),
                      reg30[(2'h2):(2'h2)]})) : (^~(^~wire9[(3'h5):(1'h0)])));
            end
          else
            begin
              reg37 <= {$unsigned(reg20),
                  $signed($unsigned($signed(((8'ha7) >= reg28))))};
              reg38 <= $unsigned(((((wire24 ?
                  reg13 : reg14) > (&wire23)) >>> reg30[(2'h2):(2'h2)]) - ((~^(reg33 ?
                      reg21 : reg15)) ?
                  (reg25[(1'h0):(1'h0)] ?
                      $unsigned(reg25) : wire11[(4'h9):(3'h5)]) : reg31[(4'h8):(1'h0)])));
            end
        end
      reg39 <= $unsigned(reg13);
    end
  assign wire40 = ($unsigned((~^$signed($unsigned((8'ha0))))) - ($signed($signed(wire10)) ?
                      (~|$signed((reg22 ? (8'ha8) : (8'ha0)))) : reg36));
  assign wire41 = $unsigned({{$signed((reg30 ? reg37 : (8'hb3))),
                          $signed((wire16 ? wire16 : reg25))},
                      (8'hb7)});
  assign wire42 = ((-(((-reg38) || {(8'hb8)}) ~^ ($signed(reg25) | reg20[(3'h6):(1'h1)]))) ?
                      (~&wire17[(3'h6):(3'h5)]) : reg29);
  assign wire43 = ((($signed(reg27[(4'h9):(4'h8)]) ?
                          reg29[(4'h8):(4'h8)] : reg31) & ($unsigned($signed(reg33)) ?
                          {$signed(wire41), reg12[(1'h1):(1'h1)]} : reg22)) ?
                      (^($unsigned(wire7) < ($signed(wire16) ?
                          (reg26 ?
                              wire24 : (8'ha2)) : $signed(reg15)))) : ($unsigned($unsigned({reg31})) ^~ reg36[(4'hb):(1'h1)]));
  always
    @(posedge clk) begin
      if ((^~(~&$signed(({wire9, reg36} ? (^(8'h9f)) : {reg38, wire11})))))
        begin
          if (wire41[(4'ha):(4'h9)])
            begin
              reg44 <= $unsigned({wire42[(4'h9):(3'h7)]});
              reg45 <= (8'hb9);
            end
          else
            begin
              reg44 <= ($signed((~&reg15[(4'h9):(3'h4)])) ~^ reg28[(2'h3):(1'h0)]);
              reg45 <= reg35[(4'hc):(2'h2)];
            end
          reg46 <= wire17[(1'h1):(1'h0)];
          reg47 <= {(reg33 ? (!$unsigned(reg30)) : (^reg35[(1'h0):(1'h0)]))};
          if ((reg29[(3'h5):(2'h2)] ~^ (&reg37[(3'h7):(1'h1)])))
            begin
              reg48 <= reg26;
              reg49 <= ($signed((~&({(8'hb7)} ?
                      wire24[(4'ha):(3'h4)] : reg34[(1'h0):(1'h0)]))) ?
                  reg20 : (|reg30[(1'h1):(1'h0)]));
              reg50 <= reg31[(3'h5):(3'h4)];
            end
          else
            begin
              reg48 <= wire40;
              reg49 <= ((wire7 ?
                      {{$signed(wire16),
                              reg27[(2'h3):(2'h2)]}} : (^(|(~|reg27)))) ?
                  reg21[(3'h7):(2'h3)] : wire8[(4'hb):(3'h4)]);
              reg50 <= wire9[(2'h3):(1'h1)];
              reg51 <= ((+(-$signed((reg49 ? reg36 : reg35)))) ?
                  (!{((-reg29) ?
                          (wire19 ~^ wire11) : wire24[(1'h0):(1'h0)])}) : {$unsigned((((8'hbc) ?
                          reg49 : reg38) >= reg49[(4'h9):(1'h1)])),
                      (reg46[(4'hb):(3'h7)] - (^~reg46))});
              reg52 <= reg14[(4'hc):(4'h8)];
            end
        end
      else
        begin
          reg44 <= $signed((!{((~^reg31) ? (+reg47) : wire8),
              $signed(((8'haa) && wire7))}));
        end
      if ((&reg27[(4'hd):(2'h3)]))
        begin
          reg53 <= wire10;
          if ($signed((~&(~(^~(8'hbc))))))
            begin
              reg54 <= $unsigned(wire43);
            end
          else
            begin
              reg54 <= $unsigned({(reg22 == (&(reg22 ? wire42 : (8'hb6))))});
            end
          reg55 <= $unsigned((~|(~((&wire9) ? $signed(reg45) : (~&reg50)))));
          if ((reg21 ? $signed(wire9[(4'h8):(3'h4)]) : reg48))
            begin
              reg56 <= $signed($unsigned($unsigned(($signed(reg12) ?
                  {wire9, (8'ha1)} : (&wire19)))));
              reg57 <= wire23;
              reg58 <= wire10;
              reg59 <= ($signed($signed((^$unsigned((8'hb8))))) >>> $signed((~&$signed($unsigned(reg54)))));
            end
          else
            begin
              reg56 <= wire24[(1'h0):(1'h0)];
              reg57 <= $signed(reg39[(4'hc):(3'h7)]);
              reg58 <= ($signed($signed($unsigned({reg34}))) ?
                  (wire42 | ((8'hb4) ?
                      $signed($unsigned(reg31)) : {$signed(reg13),
                          reg12})) : reg58[(4'hb):(1'h0)]);
              reg59 <= reg37;
            end
        end
      else
        begin
          reg53 <= reg37;
          reg54 <= ((~^reg56[(3'h4):(1'h1)]) < reg15);
          reg55 <= $signed((~^(((reg14 ? wire24 : reg31) ?
              (wire10 ?
                  wire18 : reg52) : (~^(8'haf))) || reg52[(3'h4):(1'h1)])));
        end
    end
  assign wire60 = (~^wire7);
endmodule
