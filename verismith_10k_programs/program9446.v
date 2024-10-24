module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  wire [(4'h8):(1'h0)] wire110;
  wire [(4'h9):(1'h0)] wire109;
  wire signed [(3'h6):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire100;
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  reg [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire100,
                 reg15,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned({{(wire3 - (wire1 ? wire3 : wire0)),
              wire2[(3'h5):(1'h1)]}});
      reg5 <= wire3[(1'h0):(1'h0)];
      reg6 <= (!$unsigned($signed((wire0[(4'hb):(4'h8)] >= wire2))));
    end
  assign wire7 = $unsigned(reg6);
  assign wire8 = wire2;
  assign wire9 = (wire3 ?
                     ($signed({((8'h9d) && wire2)}) - $unsigned({reg6[(2'h2):(1'h1)],
                         $unsigned((8'hb5))})) : reg5);
  assign wire10 = $signed({($signed({wire8, wire2}) >> wire0[(4'hb):(4'h8)])});
  assign wire11 = (-reg6[(3'h4):(2'h2)]);
  assign wire12 = $unsigned(($unsigned(wire7) >>> $signed((8'hb3))));
  assign wire13 = ((&((^(wire7 ? reg6 : wire3)) ?
                      (+(wire9 & wire7)) : $signed(wire1[(4'h9):(3'h6)]))) == $signed((+$unsigned(((8'ha1) <= reg4)))));
  assign wire14 = ($unsigned(($unsigned((wire3 ?
                      wire8 : reg4)) >>> $signed(((8'hbf) != (8'h9f))))) & {{wire2[(3'h6):(3'h6)]}});
  always
    @(posedge clk) begin
      reg15 <= $signed((wire1[(4'hb):(3'h5)] - (($signed(wire14) ?
              (^~(7'h44)) : $unsigned(wire8)) ?
          wire11 : wire7)));
    end
  module16 #() modinst101 (wire100, clk, wire10, reg15, wire7, reg6, wire1);
  assign wire102 = (!(wire1[(2'h2):(1'h1)] ?
                       wire1[(3'h6):(3'h5)] : wire1[(1'h0):(1'h0)]));
  assign wire103 = $unsigned($signed(wire11[(3'h7):(3'h5)]));
  assign wire104 = ((wire103 ? wire103 : wire7) ?
                       ((&wire3) ?
                           (|$unsigned(wire102[(5'h10):(5'h10)])) : (&$unsigned(reg15[(4'h9):(1'h1)]))) : reg5);
  assign wire105 = ((~^(({wire103} ^ wire102) != (~|((7'h40) ?
                           wire3 : reg5)))) ?
                       (wire100 << $signed((wire14[(4'hd):(4'hd)] <= wire14[(4'hc):(4'h9)]))) : {(($unsigned(wire14) ?
                               wire14[(5'h12):(3'h5)] : $signed((8'h9d))) << wire0[(2'h2):(1'h0)]),
                           (^(wire11[(4'h9):(2'h3)] & wire2[(4'h9):(4'h9)]))});
  assign wire106 = $signed($signed((wire1[(3'h7):(1'h1)] ^~ (7'h41))));
  assign wire107 = wire106;
  assign wire108 = $signed({((8'haf) ? wire7 : reg5[(3'h5):(2'h2)]),
                       (({wire11, wire11} && $signed(wire103)) ?
                           {wire105[(1'h1):(1'h0)],
                               (wire9 ?
                                   wire103 : reg4)} : $unsigned((wire10 && wire105)))});
  assign wire109 = $unsigned({($signed($signed(reg6)) + $unsigned((8'hb0))),
                       (8'hba)});
  assign wire110 = reg5;
endmodule

module module16  (y, clk, wire17, wire18, wire19, wire20, wire21);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire20;
  input wire signed [(4'he):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire82;
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  assign y = {wire99,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire63,
                 wire65,
                 wire66,
                 wire67,
                 wire82,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire22 = $unsigned(wire19);
  assign wire23 = (^~wire20);
  assign wire24 = $unsigned(((($unsigned(wire23) ? (+wire17) : wire21) ?
                          $signed($unsigned(wire18)) : {{wire21, (8'hae)},
                              (wire21 <= wire21)}) ?
                      (wire17[(1'h0):(1'h0)] != $unsigned($signed(wire17))) : $unsigned(wire19)));
  assign wire25 = $unsigned(((wire21[(2'h2):(1'h1)] != $signed($signed((8'ha6)))) ^~ (wire19[(1'h1):(1'h0)] || ((wire24 < wire19) ?
                      wire17[(3'h6):(3'h6)] : (wire22 ? wire17 : wire19)))));
  module26 #() modinst64 (.wire27(wire19), .wire28(wire18), .clk(clk), .wire29(wire22), .wire30(wire17), .y(wire63));
  assign wire65 = (wire20 ~^ {{$signed(wire63[(3'h4):(2'h3)]),
                          $signed((wire18 ? (8'hb1) : wire23))}});
  assign wire66 = wire25;
  assign wire67 = ({($signed($signed(wire22)) == $unsigned(wire63[(5'h11):(4'h9)]))} <<< {($unsigned($unsigned(wire63)) ?
                          $unsigned((wire17 ?
                              wire20 : wire18)) : (-$unsigned((8'hb0)))),
                      $unsigned(wire25[(3'h6):(3'h4)])});
  module68 #() modinst83 (wire82, clk, wire22, wire67, wire24, wire23, wire18);
  assign wire84 = (!wire63[(4'h9):(3'h7)]);
  assign wire85 = wire18;
  assign wire86 = wire22[(4'ha):(3'h5)];
  assign wire87 = $unsigned(wire17);
  always
    @(posedge clk) begin
      reg88 <= $unsigned(($signed((!wire21[(4'hd):(3'h5)])) ?
          (+($unsigned(wire84) ?
              (wire18 ?
                  wire20 : wire23) : wire23[(3'h5):(2'h2)])) : {(~{wire66}),
              (((8'h9f) ? wire24 : wire65) > (wire87 ? wire23 : wire17))}));
      if ({$signed(($unsigned($unsigned(wire17)) ?
              $signed((wire23 ? wire66 : wire85)) : (^(wire22 ?
                  wire86 : wire19)))),
          (({$unsigned(wire25)} ?
                  $unsigned((wire21 ? wire21 : wire25)) : ((wire86 ~^ wire87) ?
                      wire86 : (wire18 + wire65))) ?
              ($signed($unsigned((8'hb4))) ?
                  (wire18[(2'h2):(2'h2)] << (+wire17)) : {(&wire25)}) : {((wire23 & wire63) == wire20[(2'h3):(2'h3)])})})
        begin
          reg89 <= (~&(wire65[(3'h4):(3'h4)] ?
              (~wire24[(3'h5):(1'h1)]) : $signed((^(wire18 | wire63)))));
        end
      else
        begin
          reg89 <= $signed(((~|wire25) ^ $signed(wire63)));
          reg90 <= ($signed(wire22) - (+$signed((-(wire65 < wire19)))));
          reg91 <= {wire19[(4'h9):(1'h1)]};
          if ((wire85 == (^~(8'hb9))))
            begin
              reg92 <= $unsigned(($signed({(^~(8'h9d))}) + (~wire82[(1'h0):(1'h0)])));
              reg93 <= (reg91 ?
                  wire17[(3'h5):(2'h2)] : $signed($unsigned($unsigned($signed(reg92)))));
              reg94 <= (-(7'h43));
              reg95 <= wire24;
            end
          else
            begin
              reg92 <= $signed($unsigned($signed(wire20[(4'he):(1'h0)])));
              reg93 <= reg94;
              reg94 <= {$signed((8'ha8)), $signed(reg89)};
              reg95 <= (|wire66);
              reg96 <= $unsigned($unsigned(reg94[(2'h3):(1'h1)]));
            end
        end
      reg97 <= ($signed(wire67) ?
          (((|$unsigned(reg94)) != $unsigned(reg96)) ?
              reg96 : (|wire84)) : wire19[(4'h8):(3'h5)]);
      reg98 <= (7'h41);
    end
  assign wire99 = $unsigned({$signed((((8'h9d) == wire63) - ((8'hb5) ?
                          reg95 : wire65))),
                      $unsigned((~(wire86 >= wire21)))});
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire73;
  input wire [(4'h8):(1'h0)] wire72;
  input wire signed [(5'h10):(1'h0)] wire71;
  input wire signed [(4'hd):(1'h0)] wire70;
  input wire [(4'hf):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire79;
  wire [(4'hc):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 (1'h0)};
  assign wire74 = (wire72[(2'h3):(2'h2)] ?
                      wire73[(1'h1):(1'h1)] : (((((8'h9e) ?
                              wire72 : wire70) ^ $signed(wire71)) ^~ $signed($unsigned(wire69))) ?
                          (~(^~$unsigned(wire70))) : $signed(wire72)));
  assign wire75 = {wire71, (wire71 <= $unsigned(wire74))};
  assign wire76 = ($signed((~|$unsigned(wire71[(4'he):(2'h3)]))) * wire69);
  assign wire77 = (-wire74);
  assign wire78 = (8'hb0);
  assign wire79 = $unsigned($unsigned($signed((&$unsigned(wire74)))));
  assign wire80 = (+(~&wire70));
  assign wire81 = wire71;
endmodule

module module26
#(parameter param61 = (({(&((8'haa) ? (8'ha0) : (8'ha9)))} ? ((+(^~(7'h43))) ? (((8'hbf) * (8'h9e)) ? {(8'h9e)} : ((8'ha4) ? (8'hba) : (8'ha9))) : ((!(8'h9f)) ^ {(8'hb6)})) : (-(((8'ha3) ? (8'hb3) : (8'ha1)) ? {(8'haf)} : {(8'hbe), (8'hbf)}))) ? ({(8'hbd), (8'ha4)} ? ((!((8'hb8) | (8'h9f))) > ((|(8'hba)) ? (&(8'h9f)) : ((8'ha6) ? (8'hbf) : (8'ha2)))) : ((~{(8'h9e)}) || (8'ha1))) : {(^~(((8'ha1) >= (8'h9f)) == ((8'ha3) ? (8'hb7) : (8'hab)))), (~&(((8'ha7) ? (7'h40) : (8'ha6)) == ((7'h40) ~^ (7'h42))))}), 
parameter param62 = (~|param61))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(4'ha):(1'h0)] wire28;
  input wire [(4'hd):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire31 = (^~$unsigned(wire29));
  assign wire32 = ((^(wire30[(1'h0):(1'h0)] ? {((8'hb3) || wire30)} : wire30)) ?
                      ((!(~|wire31[(3'h4):(1'h0)])) <<< (~^wire29[(4'he):(1'h1)])) : $unsigned((|(~^wire27))));
  assign wire33 = wire29;
  assign wire34 = wire33;
  assign wire35 = (wire29 ?
                      (wire32 >>> $unsigned(wire34[(1'h0):(1'h0)])) : (~&{wire34[(2'h2):(1'h1)]}));
  assign wire36 = wire35;
  always
    @(posedge clk) begin
      reg37 <= ((wire36[(2'h2):(1'h0)] ?
              wire29[(4'hd):(1'h1)] : $unsigned((wire29 >> $unsigned(wire32)))) ?
          (^({wire32} ?
              $signed({wire30}) : {{wire35, wire27}})) : wire32[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg38 <= wire36;
      reg39 <= {(+(&wire27)), wire30};
      reg40 <= wire32;
    end
  always
    @(posedge clk) begin
      reg41 <= reg38;
      if (wire29[(4'hb):(4'hb)])
        begin
          if (((~$unsigned($unsigned((wire28 < reg38)))) >= $signed((-wire33))))
            begin
              reg42 <= wire29[(4'he):(4'he)];
              reg43 <= $signed($signed($signed($unsigned((wire35 <<< reg40)))));
              reg44 <= $unsigned({$unsigned((reg39[(2'h2):(1'h1)] && $signed((8'ha8)))),
                  (+((reg37 ? (8'hba) : wire29) ?
                      $unsigned(reg43) : (reg37 ? reg37 : wire34)))});
              reg45 <= (^wire27);
              reg46 <= reg39[(3'h7):(1'h0)];
            end
          else
            begin
              reg42 <= $unsigned(reg45);
              reg43 <= wire30;
              reg44 <= (((~&((reg45 - reg43) || $unsigned(reg41))) <= {$signed(reg43)}) || (((8'hb3) ?
                      $unsigned((wire27 || reg37)) : reg43) ?
                  wire29 : (8'h9d)));
            end
          reg47 <= wire27;
        end
      else
        begin
          reg42 <= $signed(($unsigned({wire28}) > (7'h41)));
          reg43 <= $unsigned(wire28);
        end
      reg48 <= $unsigned(((({wire29, reg42} == reg41) ?
              reg39[(3'h5):(3'h5)] : wire28) ?
          wire30[(2'h3):(1'h1)] : {$signed((wire36 && wire34))}));
      if ((reg47[(1'h0):(1'h0)] ?
          ((!$signed((+wire33))) << reg46[(4'h8):(4'h8)]) : (reg37 | reg42[(4'hd):(1'h1)])))
        begin
          if (wire31)
            begin
              reg49 <= reg38;
              reg50 <= $signed($unsigned(reg44));
              reg51 <= (&((|$unsigned((wire28 ?
                  wire27 : wire29))) < $unsigned($unsigned(reg45))));
              reg52 <= (wire30 ?
                  reg49 : ({($unsigned(wire31) ~^ reg42[(1'h1):(1'h1)]),
                          wire31[(2'h3):(2'h2)]} ?
                      $unsigned(reg50) : reg45));
              reg53 <= (((reg46 != ($signed(reg46) ^ $signed(reg51))) & (~^$unsigned((&reg48)))) && reg43[(2'h2):(1'h0)]);
            end
          else
            begin
              reg49 <= (reg41[(4'ha):(1'h1)] & $signed($signed(wire29[(2'h2):(1'h1)])));
              reg50 <= ($signed($signed(wire33)) ?
                  {$unsigned(({wire27,
                          wire31} && reg52))} : $unsigned(reg39[(2'h2):(2'h2)]));
            end
          reg54 <= $unsigned(((wire32 != wire33[(4'ha):(4'h8)]) >> $signed($unsigned($unsigned((7'h44))))));
          reg55 <= ($unsigned(reg54) < ((wire36 ?
                  $signed((reg47 ? reg50 : reg40)) : reg46[(4'hd):(4'hb)]) ?
              $unsigned($signed((~wire36))) : reg46[(2'h2):(2'h2)]));
        end
      else
        begin
          if ($signed({{(~^(^~reg47)),
                  ($unsigned((8'ha9)) || reg49[(3'h4):(1'h1)])}}))
            begin
              reg49 <= $unsigned(((^~reg37) >= (^$unsigned($unsigned(wire32)))));
            end
          else
            begin
              reg49 <= $signed($signed($signed($unsigned(reg39))));
              reg50 <= $signed($signed(($unsigned($unsigned(wire28)) ?
                  ((reg45 ? (8'haa) : wire31) ? reg53 : wire28) : (+reg49))));
              reg51 <= wire29;
              reg52 <= ((((reg50 ?
                      reg38 : reg53) && $signed((reg43 >>> reg40))) - wire27[(4'h8):(3'h6)]) ?
                  (($unsigned((^~reg52)) << wire33[(1'h1):(1'h1)]) >> (~&$unsigned((reg51 ?
                      reg41 : reg53)))) : {wire28[(3'h4):(2'h2)],
                      ($unsigned((wire31 ?
                          reg39 : wire35)) && $signed($signed(wire35)))});
            end
          reg53 <= (wire34[(1'h0):(1'h0)] == reg42[(4'ha):(2'h2)]);
          reg54 <= (((reg54 ?
                  {(-wire32), (reg48 ? reg37 : reg50)} : {$unsigned((8'hbc)),
                      reg39[(1'h0):(1'h0)]}) ?
              (((8'ha0) <= $signed(wire28)) * reg38[(4'ha):(4'ha)]) : reg55[(1'h1):(1'h1)]) << (~|reg48));
        end
    end
  assign wire56 = (8'hbc);
  assign wire57 = {($unsigned(((wire32 * reg45) >> $signed(reg54))) >> wire30[(3'h5):(3'h4)])};
  assign wire58 = ((wire29[(2'h2):(1'h1)] ?
                      $unsigned($unsigned((reg44 && reg44))) : (8'haf)) ^ reg54);
  assign wire59 = $unsigned((!(^~$signed((+reg51)))));
  assign wire60 = (reg41[(3'h7):(3'h4)] ?
                      ((reg55[(3'h7):(1'h1)] ?
                              $unsigned((&wire28)) : ($unsigned(reg37) > $unsigned((8'hb1)))) ?
                          wire56 : reg53[(1'h0):(1'h0)]) : ({(reg43[(2'h3):(1'h1)] ^~ $unsigned(wire57)),
                          wire31} | {reg37}));
endmodule
