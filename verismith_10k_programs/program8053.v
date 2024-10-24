module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire [(4'hf):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire21;
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire82,
                 wire21,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  module4 #() modinst22 (wire21, clk, wire3, wire0, wire1, wire2, (8'hb5));
  module23 #() modinst83 (.y(wire82), .wire26(wire21), .wire25(wire1), .wire24(wire3), .clk(clk), .wire27(wire0));
  assign wire84 = $unsigned($signed((^$unsigned(wire82))));
  assign wire85 = ((~(8'hae)) ?
                      $unsigned(wire1) : $unsigned(wire21[(4'hc):(1'h0)]));
  assign wire86 = (8'hac);
  assign wire87 = (($unsigned(((wire86 ? wire0 : wire0) <<< $signed(wire84))) ?
                          wire84 : (-{wire0})) ?
                      (wire3[(5'h15):(5'h13)] <<< (~&wire86)) : wire86[(4'he):(2'h2)]);
  always
    @(posedge clk) begin
      reg88 <= wire87[(4'hf):(4'hf)];
      reg89 <= wire3[(4'hf):(4'h9)];
      if ($unsigned((wire86[(3'h6):(3'h5)] << wire3[(4'h8):(3'h4)])))
        begin
          reg90 <= wire3[(4'hf):(3'h6)];
        end
      else
        begin
          if ($unsigned((($signed((wire82 ?
              (8'had) : wire82)) - (-reg90[(4'h9):(4'h8)])) >= (reg88[(3'h4):(2'h3)] ?
              reg89 : (8'hb6)))))
            begin
              reg90 <= (wire0 <<< $signed($unsigned(wire3)));
              reg91 <= (reg88[(3'h4):(2'h2)] ?
                  $signed((~(wire82[(4'hb):(2'h2)] != {wire86}))) : (^~reg90[(4'ha):(3'h5)]));
              reg92 <= $signed($signed(wire21[(2'h2):(2'h2)]));
              reg93 <= $signed(wire3[(5'h12):(3'h5)]);
              reg94 <= {{($signed((~(8'had))) ?
                          reg88 : (((7'h42) > (8'hbe)) >> $unsigned((8'ha0))))},
                  reg90};
            end
          else
            begin
              reg90 <= (7'h41);
              reg91 <= wire82[(5'h14):(2'h2)];
              reg92 <= (((($unsigned(reg92) ?
                          (reg93 ~^ wire21) : {wire21,
                              reg90}) | wire1[(5'h12):(3'h6)]) ?
                      (wire0[(1'h0):(1'h0)] == $unsigned((!reg94))) : ((~$signed(reg94)) ?
                          $unsigned(reg91[(1'h1):(1'h0)]) : $unsigned((reg93 ?
                              wire0 : reg90)))) ?
                  wire85 : ($unsigned(reg89) >= (reg92 ?
                      (reg89[(5'h10):(4'h9)] ?
                          (reg94 ?
                              reg90 : wire2) : (8'hbd)) : ($signed(wire2) ^ wire86[(4'ha):(2'h3)]))));
            end
          reg95 <= (+{$unsigned((reg90[(4'hb):(1'h0)] ?
                  {(8'hac), (8'hbd)} : (+wire0))),
              wire2[(4'hd):(4'hc)]});
        end
    end
endmodule

module module23
#(parameter param81 = ((((((8'h9c) > (8'hb4)) ? (!(8'hb6)) : ((8'hb8) ? (7'h41) : (8'hbe))) ? (((8'h9f) ? (8'h9f) : (8'hbf)) ? {(8'h9f)} : ((8'h9f) ? (8'hb2) : (8'hb6))) : {{(8'ha4), (8'ha0)}}) && (({(7'h44), (7'h41)} ? (|(8'ha6)) : ((8'haf) >= (8'hab))) ? (&((8'ha9) ? (8'ha1) : (8'hb6))) : (8'h9e))) * (^~(~&(((8'hb0) ? (8'h9f) : (8'ha2)) <= (-(7'h44)))))))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire27;
  input wire signed [(5'h11):(1'h0)] wire26;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire [(4'hc):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire29;
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire29,
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
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= ({wire24,
          $unsigned(wire27[(3'h7):(2'h2)])} || (wire26[(2'h2):(1'h0)] >>> wire24));
    end
  assign wire29 = wire26[(4'hf):(4'hb)];
  module30 #() modinst64 (wire63, clk, wire26, wire29, wire27, wire24);
  assign wire65 = ($unsigned((|$unsigned($signed(wire26)))) ?
                      $signed((~&{(wire63 * (8'hb7))})) : {wire26[(4'hd):(3'h4)]});
  assign wire66 = wire27[(2'h2):(1'h1)];
  assign wire67 = wire65[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      if (($signed((((reg28 - wire24) * $unsigned(wire67)) ?
          $signed(wire26[(3'h6):(3'h4)]) : wire63)) * $unsigned(wire26[(4'ha):(4'h9)])))
        begin
          reg68 <= (+(reg28 ?
              (wire25 <= ($unsigned(wire24) + wire27[(3'h4):(1'h0)])) : ((~&(wire27 ?
                      wire24 : (8'hab))) ?
                  $unsigned(wire66[(2'h3):(2'h2)]) : (-wire67[(3'h7):(1'h0)]))));
          reg69 <= (~|$unsigned(($signed((!wire27)) && (^~(&wire66)))));
          reg70 <= ($unsigned(wire27) ? wire29[(1'h0):(1'h0)] : (~^{wire63}));
          reg71 <= $unsigned((~|$signed(reg28[(4'he):(3'h6)])));
          if ($signed((^~$signed($unsigned((-wire25))))))
            begin
              reg72 <= $unsigned(($signed(((reg71 ? wire29 : reg71) ?
                  $signed(reg71) : reg68[(4'h8):(2'h2)])) ~^ wire66[(2'h3):(2'h2)]));
            end
          else
            begin
              reg72 <= ($unsigned($signed($unsigned((&wire29)))) ?
                  reg71[(1'h1):(1'h0)] : $unsigned($signed($unsigned(wire29))));
              reg73 <= (+{((&(reg70 >>> reg69)) ^ {wire25})});
              reg74 <= wire26[(4'he):(1'h0)];
              reg75 <= wire66;
              reg76 <= (8'hba);
            end
        end
      else
        begin
          reg68 <= wire27;
          if (wire27[(2'h2):(2'h2)])
            begin
              reg69 <= reg75[(1'h1):(1'h0)];
              reg70 <= $signed({reg70, reg28});
              reg71 <= reg76[(5'h10):(3'h4)];
              reg72 <= ((&$unsigned((reg71 ?
                      $signed(reg69) : ((8'hb9) ^~ wire26)))) ?
                  (|{$signed($unsigned(reg68))}) : reg71[(3'h6):(2'h2)]);
            end
          else
            begin
              reg69 <= $signed(reg74[(3'h4):(1'h1)]);
              reg70 <= $unsigned(wire65[(4'hc):(3'h7)]);
              reg71 <= $signed($signed((reg68 > wire24[(3'h4):(3'h4)])));
            end
        end
      reg77 <= ($signed($unsigned(wire27[(1'h0):(1'h0)])) ?
          wire63[(3'h6):(3'h6)] : ($signed(reg74[(2'h3):(2'h3)]) ?
              ((+(~^wire63)) ?
                  wire67[(4'hf):(3'h5)] : ((~wire29) == (-reg72))) : {wire29[(2'h3):(1'h1)],
                  $signed({wire66})}));
      reg78 <= reg71[(4'h8):(2'h2)];
      if ((((8'ha3) > ($signed(wire66) ?
              (!reg75[(3'h6):(1'h0)]) : {$signed(reg69), $unsigned(wire65)})) ?
          $signed($signed({$signed(wire65),
              $signed(reg74)})) : {reg78[(1'h1):(1'h0)]}))
        begin
          reg79 <= reg68[(3'h4):(1'h1)];
        end
      else
        begin
          reg79 <= $unsigned(($unsigned($signed((~&(8'ha6)))) >>> ((&(reg28 - (7'h42))) || ((^~wire29) ?
              reg77[(4'h8):(4'h8)] : (reg76 ? reg75 : reg75)))));
          reg80 <= (($unsigned(wire24[(3'h7):(3'h5)]) ?
                  $signed(reg71[(1'h0):(1'h0)]) : reg77) ?
              $signed($unsigned((~^(wire65 > reg28)))) : ((($signed(wire26) ?
                      wire67[(4'hd):(4'hd)] : $signed(wire25)) > (wire25[(2'h2):(2'h2)] ?
                      (~reg68) : $unsigned(reg76))) ?
                  (reg75 ~^ $signed(wire67[(4'hc):(1'h1)])) : ($signed((~&reg76)) ?
                      ($unsigned((8'hab)) << $signed(reg71)) : {reg70[(4'hb):(4'ha)],
                          $signed((8'hbb))})));
        end
    end
endmodule

module module4
#(parameter param19 = ({({{(8'ha8)}, ((8'ha7) ? (8'ha8) : (8'hb1))} ? ({(8'ha3)} ^ (~|(8'hb4))) : (!((7'h44) & (8'hbb))))} ? (~^((((8'hb8) || (8'ha6)) ? ((8'h9d) ? (8'h9c) : (8'hb0)) : {(7'h44)}) + (~&((8'hba) ? (8'hb3) : (7'h44))))) : ((&{(~&(8'ha0)), (^(8'ha5))}) ? (&{(~^(8'ha4))}) : ((&(~|(8'hbd))) * (8'hac)))), 
parameter param20 = (^~(+(!param19))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire6;
  input wire [(4'he):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 (1'h0)};
  assign wire10 = (wire5 ?
                      ((((wire8 ? wire9 : wire6) ?
                              wire5 : $unsigned((8'ha0))) < $signed($signed(wire5))) ?
                          $signed((|(wire6 ? (8'ha8) : wire9))) : (-({wire6,
                                  wire6} ?
                              wire8 : (~^wire7)))) : wire7);
  assign wire11 = {$signed((&($signed(wire9) << wire7))), wire5[(3'h5):(3'h4)]};
  assign wire12 = ((($signed($unsigned(wire11)) ^~ (wire7[(1'h1):(1'h0)] ?
                          (wire11 ?
                              wire6 : wire9) : (&wire10))) < wire11[(1'h1):(1'h1)]) ?
                      (~^wire9) : ((8'haa) ?
                          wire9[(4'ha):(3'h5)] : {$unsigned($signed(wire6))}));
  assign wire13 = (~(8'ha4));
  assign wire14 = $signed((&{$unsigned((7'h44))}));
  assign wire15 = {($unsigned($signed((wire7 > wire9))) >= $signed((wire12 ?
                          (wire13 ? (8'ha6) : (7'h41)) : wire12))),
                      (8'ha3)};
  assign wire16 = wire15[(3'h5):(3'h4)];
  assign wire17 = wire5[(4'h8):(3'h5)];
  assign wire18 = $signed($unsigned($unsigned(wire16[(1'h0):(1'h0)])));
endmodule

module module30
#(parameter param62 = (^((({(8'hb2)} * ((8'hb2) <<< (8'hbf))) ? (((8'hbd) < (8'haa)) ? ((8'hbb) != (8'hb3)) : ((8'hbe) ? (8'ha7) : (7'h40))) : {(7'h41)}) ? (((~&(8'hba)) + ((8'hb9) >> (8'ha3))) ? (~&((8'hb6) != (8'hb8))) : {((8'hb5) ^~ (8'hb7)), (~(8'hb6))}) : ((((8'ha8) <<< (8'ha7)) ? ((8'ha8) - (7'h41)) : ((8'hb1) && (8'hbd))) ? (((8'hb9) - (8'hbc)) ? ((7'h40) ? (8'hb4) : (7'h40)) : {(8'ha5)}) : (7'h40)))))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire34;
  input wire [(2'h2):(1'h0)] wire33;
  input wire [(2'h2):(1'h0)] wire32;
  input wire [(2'h3):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire35;
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
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
                 wire38,
                 wire37,
                 wire36,
                 wire35,
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
                 (1'h0)};
  assign wire35 = wire32;
  assign wire36 = ($unsigned((8'hb0)) ?
                      $unsigned($unsigned(wire34[(1'h0):(1'h0)])) : (&wire31[(2'h3):(2'h2)]));
  assign wire37 = ((~|(^wire36[(2'h3):(2'h2)])) ?
                      (&$signed(((wire32 - wire33) ?
                          (^~wire36) : wire36))) : wire36[(1'h0):(1'h0)]);
  assign wire38 = wire34;
  assign wire39 = (({wire35} ?
                      (!$unsigned($signed(wire38))) : wire34) < wire37);
  assign wire40 = wire37;
  assign wire41 = (&wire32);
  assign wire42 = wire41;
  assign wire43 = $unsigned(($signed($unsigned((~^wire33))) ?
                      (($unsigned(wire34) & $signed(wire34)) ?
                          (&(wire41 ?
                              (8'ha9) : (8'hbe))) : ((wire38 << (8'h9f)) << $signed(wire41))) : wire35));
  assign wire44 = wire42;
  assign wire45 = wire36[(2'h2):(2'h2)];
  assign wire46 = $unsigned(wire40);
  assign wire47 = (~($unsigned($unsigned((+wire38))) >> (+({wire35, (8'had)} ?
                      (wire33 > wire32) : wire33))));
  assign wire48 = wire38[(4'hb):(4'hb)];
  always
    @(posedge clk) begin
      reg49 <= (!wire45);
      reg50 <= (^~$signed({$signed(wire44[(2'h2):(1'h0)])}));
      if ((^$signed(wire41[(2'h2):(2'h2)])))
        begin
          if (wire38[(3'h6):(1'h1)])
            begin
              reg51 <= (~|(~^($unsigned((~&wire31)) ?
                  (8'ha7) : (~&(~&wire40)))));
              reg52 <= (wire35[(3'h5):(1'h1)] <= (+(&({wire39} & wire34[(3'h4):(3'h4)]))));
              reg53 <= $signed({(^~wire42[(2'h2):(1'h0)]), reg49});
              reg54 <= $unsigned((~&wire33));
            end
          else
            begin
              reg51 <= $unsigned((8'hb5));
              reg52 <= $signed((wire41[(2'h3):(1'h1)] ~^ $signed($unsigned($unsigned(reg52)))));
              reg53 <= {{$signed($unsigned((reg53 | wire39))), (7'h44)},
                  $unsigned(($signed((~(8'had))) ^~ ($unsigned(wire31) ^ wire35[(1'h0):(1'h0)])))};
            end
        end
      else
        begin
          reg51 <= ((((^(!reg49)) ?
                      ((~&wire43) == (^wire41)) : ({(8'h9d), wire36} ?
                          (wire32 << wire44) : wire46[(4'h8):(3'h5)])) ?
                  (~wire36) : {(~&(wire41 ? wire33 : wire33)),
                      wire31[(2'h2):(2'h2)]}) ?
              (((~&reg53[(4'he):(4'hb)]) || (~&(+wire46))) | reg49[(1'h1):(1'h0)]) : $unsigned(wire37));
          reg52 <= (wire36 ? wire46[(2'h3):(1'h0)] : wire46);
          reg53 <= $signed(reg51[(2'h2):(1'h1)]);
          if ($signed(wire32))
            begin
              reg54 <= (+$unsigned(wire48[(4'hf):(2'h3)]));
              reg55 <= ($signed({(|$signed((8'hb6)))}) ?
                  $signed(($signed(reg49[(4'h9):(4'h8)]) ?
                      $unsigned($unsigned(wire40)) : $signed($unsigned(wire37)))) : (&(+wire41)));
              reg56 <= $signed((+(wire46[(1'h1):(1'h0)] && $unsigned({wire40,
                  wire42}))));
            end
          else
            begin
              reg54 <= wire41;
              reg55 <= reg55;
              reg56 <= $signed((reg49 ^ wire38[(5'h13):(3'h5)]));
              reg57 <= wire41;
              reg58 <= reg51[(1'h0):(1'h0)];
            end
        end
    end
  assign wire59 = $signed($unsigned((^$signed((wire34 & wire41)))));
  assign wire60 = ((($signed((!(7'h41))) ? reg50 : (-wire42)) ?
                      ((~^(wire41 ~^ (8'ha2))) == {reg53[(4'hd):(1'h1)]}) : (~|reg56)) >>> ((reg52 > wire43[(4'hb):(3'h5)]) > (-(reg52 ?
                      $signed(reg49) : ((7'h40) + (8'ha8))))));
  assign wire61 = wire43[(3'h5):(1'h0)];
endmodule
