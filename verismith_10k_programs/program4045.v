module top
#(parameter param102 = (|{((-((8'hbf) - (7'h44))) ? ((&(8'hb5)) - ((8'h9d) >> (8'ha8))) : (((8'ha5) ? (8'hb6) : (8'haa)) ? ((8'hb0) ? (7'h43) : (8'h9d)) : (8'ha7)))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire101;
  wire signed [(5'h13):(1'h0)] wire100;
  wire [(4'hf):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire98;
  wire signed [(4'h8):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire96;
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire4,
                 wire75,
                 wire96,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire4 = ($signed((8'ha6)) - wire2);
  module5 #() modinst76 (wire75, clk, wire2, wire1, wire3, wire0);
  always
    @(posedge clk) begin
      reg77 <= (^~wire2);
      reg78 <= $unsigned((8'hb9));
      reg79 <= (($unsigned($unsigned($signed(reg77))) ^~ $signed(wire4[(3'h7):(3'h6)])) ?
          (8'h9e) : $unsigned((wire3 ?
              reg78[(1'h0):(1'h0)] : $unsigned((wire2 ? wire2 : wire3)))));
    end
  module80 #() modinst97 (wire96, clk, reg79, reg77, wire75, wire0, wire3);
  assign wire98 = ((~reg79[(4'hb):(4'ha)]) ?
                      $unsigned({$signed(((8'hb4) ? wire4 : wire2)),
                          (^wire96)}) : (8'haa));
  assign wire99 = $signed((-$signed(wire3)));
  assign wire100 = ((({$unsigned(wire3),
                           $signed((7'h40))} * reg78[(3'h5):(1'h1)]) ?
                       $signed({$signed(wire96),
                           {wire1}}) : $signed((~wire75))) | (wire1[(2'h3):(1'h0)] >= wire4[(3'h6):(1'h1)]));
  assign wire101 = (wire75[(4'h9):(2'h2)] ?
                       ({$signed((-wire98))} ?
                           $unsigned(reg78) : (wire100[(4'hf):(3'h6)] & wire1[(1'h1):(1'h0)])) : (((wire3[(5'h12):(3'h4)] ?
                               ((8'h9c) | wire2) : (reg78 >>> wire2)) <<< ((wire1 ?
                               wire96 : wire3) && (reg77 ? reg79 : wire75))) ?
                           {$signed($signed(wire0))} : wire2[(4'hd):(4'hb)]));
endmodule

module module80
#(parameter param94 = (((((~|(8'hb1)) - (8'ha8)) ? ((8'hb9) ^~ {(8'ha0), (8'hbc)}) : ((-(7'h40)) < {(8'ha4), (8'ha8)})) ? ((~((8'had) ? (8'hb2) : (8'hb5))) * (((8'ha6) | (7'h42)) >= ((8'hb0) ? (8'hba) : (8'haa)))) : (!(((8'hb4) - (8'h9e)) - ((7'h44) ? (8'hae) : (8'hbe))))) ? ({(((8'ha1) ? (8'ha0) : (8'hb5)) > (+(8'hba))), (+((8'hb7) ? (8'ha8) : (8'ha4)))} & (|(8'h9c))) : ({({(8'hba), (8'ha4)} >>> ((8'haf) ? (8'ha8) : (7'h40)))} ? (-((~^(7'h43)) ? ((8'ha7) ^~ (8'h9e)) : {(8'hbb), (8'hbc)})) : ((~((8'ha0) <<< (8'h9d))) <= ((~&(8'ha2)) ? (8'hb2) : ((8'ha0) ? (8'hbd) : (8'ha9)))))), 
parameter param95 = (8'haa))
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire85;
  input wire [(4'h8):(1'h0)] wire84;
  input wire [(3'h5):(1'h0)] wire83;
  input wire [(4'hb):(1'h0)] wire82;
  input wire [(3'h4):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire86;
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire86,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire86 = ((|wire84) & (wire84[(2'h3):(1'h1)] ?
                      $signed({{wire84},
                          wire83[(1'h1):(1'h0)]}) : wire83[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      reg87 <= $unsigned(wire84);
      if (reg87)
        begin
          reg88 <= wire86;
          reg89 <= wire85;
        end
      else
        begin
          reg88 <= ({(wire82 ?
                      $unsigned($signed(wire86)) : $signed(wire83[(1'h0):(1'h0)])),
                  $signed(($signed((7'h44)) - wire84))} ?
              wire83[(1'h0):(1'h0)] : $signed((+((wire83 ?
                  wire86 : wire83) < (8'ha7)))));
          reg89 <= wire86[(3'h4):(1'h0)];
          reg90 <= (~^$signed((($signed(wire83) <= (wire84 ^~ reg89)) & (+(^wire86)))));
          reg91 <= (~wire83);
        end
    end
  assign wire92 = reg87;
  assign wire93 = (~^$unsigned(($signed(wire83[(2'h3):(2'h3)]) + wire82)));
endmodule

module module5
#(parameter param73 = (~|(({((8'hbe) ? (8'ha0) : (8'hb6))} >>> {{(8'h9e)}, ((8'had) ? (7'h41) : (8'ha6))}) & {(-((8'h9c) && (8'hb5))), (8'ha0)})), 
parameter param74 = param73)
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire52;
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire54,
                 wire10,
                 wire11,
                 wire12,
                 wire52,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg56,
                 (1'h0)};
  assign wire10 = wire6[(2'h2):(2'h2)];
  assign wire11 = wire6;
  assign wire12 = $unsigned(wire11[(2'h3):(1'h0)]);
  module13 #() modinst53 (wire52, clk, wire10, wire8, wire12, wire9, wire11);
  assign wire54 = wire12[(3'h7):(3'h5)];
  assign wire55 = wire8;
  always
    @(posedge clk) begin
      reg56 <= (wire55 ?
          wire12[(4'hb):(4'hb)] : $unsigned($signed(({wire7,
              wire55} > (wire8 | wire6)))));
    end
  assign wire57 = $unsigned({((wire54[(3'h4):(3'h4)] >= ((8'hb0) ?
                              wire8 : wire6)) ?
                          $signed((wire7 > wire9)) : (+(wire8 ?
                              wire8 : wire52)))});
  assign wire58 = (~&($unsigned((wire12[(5'h10):(1'h1)] - {wire12, wire7})) ?
                      ($signed($signed((8'hbe))) ?
                          ({wire54, wire12} <<< $unsigned(wire7)) : (wire9 ?
                              wire52 : (wire11 | wire55))) : {((~&wire11) ?
                              wire54[(4'he):(3'h7)] : wire54)}));
  assign wire59 = $signed($signed({(~&(-wire10)), wire52}));
  always
    @(posedge clk) begin
      reg60 <= (~(wire55 >> ((wire10 ? (!wire59) : (^(8'hbd))) ?
          (((8'hb2) && reg56) * (~&wire59)) : $signed($unsigned((8'haa))))));
      if (wire11)
        begin
          if ($unsigned({(((wire57 << reg60) >= $signed(wire9)) <= ($signed(wire7) & (^~(8'hb9)))),
              {wire10,
                  ((reg60 ? (8'hb2) : wire54) ?
                      $unsigned(wire7) : $signed((8'ha2)))}}))
            begin
              reg61 <= ($signed((wire12 ?
                      reg60[(4'h9):(2'h3)] : wire10[(2'h2):(2'h2)])) ?
                  reg56 : {(~&$signed((&wire7))), wire8});
              reg62 <= (wire9[(3'h6):(1'h0)] ?
                  (~(&$unsigned((wire11 ?
                      reg60 : wire59)))) : (((wire55[(3'h4):(2'h2)] ?
                              $signed(wire9) : (wire55 >> wire12)) ?
                          wire55 : ($signed(reg61) ?
                              (reg61 ?
                                  wire11 : wire7) : wire11[(3'h5):(1'h0)])) ?
                      {({wire54, wire59} ?
                              (wire55 ? wire59 : wire7) : $signed(wire12)),
                          wire6[(1'h1):(1'h1)]} : wire52[(2'h3):(2'h3)]));
              reg63 <= $unsigned(wire55[(4'hc):(4'h8)]);
            end
          else
            begin
              reg61 <= $signed(wire12);
              reg62 <= $signed($signed(reg60));
              reg63 <= $unsigned(reg60);
            end
          reg64 <= $signed(wire10[(5'h13):(5'h12)]);
          reg65 <= ((({(wire6 >> (8'ha5))} ?
                  (&wire52[(1'h0):(1'h0)]) : $signed({(8'hbc),
                      (8'hb0)})) + wire10[(3'h7):(1'h0)]) ?
              reg62 : (+(reg62[(4'h8):(3'h5)] & ({wire6,
                  wire57} < $unsigned(wire11)))));
          reg66 <= $signed((wire7[(4'h9):(3'h6)] > ($unsigned($signed((8'h9e))) ?
              ((8'hb9) ?
                  $signed(wire58) : $signed(wire9)) : $signed((reg63 * wire10)))));
        end
      else
        begin
          reg61 <= ((^((wire58 ? {wire11, (8'hbb)} : wire59) ?
              $signed($signed(reg66)) : (~&$unsigned(wire59)))) <= $unsigned((^~$signed((wire52 ?
              wire7 : (8'hb5))))));
          reg62 <= wire6[(2'h3):(2'h2)];
        end
      reg67 <= (~$signed($signed((7'h42))));
    end
  assign wire68 = (!$unsigned(((reg62 ?
                      $signed(wire8) : (wire11 ?
                          wire11 : wire52)) * ((reg64 <= wire58) & (reg67 ?
                      reg66 : reg66)))));
  assign wire69 = (reg67 ?
                      wire7[(3'h4):(2'h2)] : $signed({($unsigned(wire55) ^ wire7),
                          {(reg60 ? wire59 : wire10), $unsigned((7'h40))}}));
  assign wire70 = (8'hac);
  assign wire71 = (~|$unsigned($unsigned(((~&wire12) ?
                      (reg67 ? wire57 : wire69) : {wire6, wire7}))));
  assign wire72 = $unsigned($signed(wire12[(2'h2):(1'h1)]));
endmodule

module module13
#(parameter param51 = {(+(((8'hb3) ? {(8'ha0), (8'ha8)} : (~&(8'hac))) ? (((8'hb8) == (7'h41)) == {(8'hac), (7'h43)}) : ({(8'hb8), (8'hac)} == (~|(8'hac)))))})
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  input wire [(4'hb):(1'h0)] wire15;
  input wire [(3'h5):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
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
                 reg38,
                 (1'h0)};
  assign wire19 = (8'hb5);
  assign wire20 = wire17;
  assign wire21 = $unsigned((wire17[(2'h3):(1'h0)] >>> wire14[(2'h2):(1'h0)]));
  assign wire22 = (8'hab);
  assign wire23 = (^~{wire14[(2'h2):(1'h1)]});
  assign wire24 = $unsigned(((wire21 ?
                          wire15 : (((8'h9f) ?
                              wire22 : wire22) >= $signed(wire17))) ?
                      $unsigned((((8'ha3) ?
                          (8'ha5) : wire21) * $unsigned(wire22))) : ({wire14} ?
                          $signed((wire16 ?
                              wire16 : (8'had))) : wire15[(2'h2):(1'h1)])));
  assign wire25 = (8'ha2);
  assign wire26 = {$signed($signed(wire23)), wire21};
  assign wire27 = (wire17 - wire26);
  assign wire28 = wire14;
  assign wire29 = wire19[(3'h5):(1'h1)];
  assign wire30 = $unsigned($unsigned(wire24));
  assign wire31 = (~$signed(wire17));
  assign wire32 = {$unsigned((~^(wire28 <= $signed(wire21))))};
  assign wire33 = ((($unsigned((~&(8'ha8))) ?
                              {{wire23, wire26}} : $unsigned((+(8'hb8)))) ?
                          ($unsigned((~|wire23)) ?
                              wire15[(2'h3):(2'h3)] : wire29) : ({{(8'h9c),
                                      wire30},
                                  {wire19, wire15}} ?
                              $signed(wire21) : $signed($signed(wire24)))) ?
                      wire32 : $signed($unsigned({wire23})));
  assign wire34 = ((~^(wire18[(2'h3):(2'h3)] ?
                      $signed((~wire32)) : (8'hb3))) || ($unsigned($unsigned(wire28)) ?
                      wire24[(2'h2):(2'h2)] : $unsigned(wire19[(3'h6):(1'h1)])));
  assign wire35 = $signed((~|$unsigned(wire31)));
  assign wire36 = wire28[(4'ha):(3'h6)];
  assign wire37 = wire16[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      reg38 <= wire33;
    end
  assign wire39 = ((wire28 ?
                          ((^$unsigned(wire20)) ?
                              (^~{wire37}) : $unsigned(((8'ha6) >> (8'ha5)))) : (wire18 ?
                              ((wire16 ?
                                  wire26 : wire37) || (wire35 && wire17)) : {wire29[(1'h1):(1'h1)]})) ?
                      ($signed((&wire35)) >= $unsigned({(&wire33),
                          (reg38 ? wire36 : wire21)})) : wire29[(4'h8):(3'h4)]);
  assign wire40 = wire36;
  always
    @(posedge clk) begin
      if ((({$signed((wire19 ? wire15 : wire30)),
              ($signed((8'h9f)) | (wire34 ?
                  wire40 : wire25))} <<< {wire33[(3'h4):(1'h0)]}) ?
          (($signed(wire31[(2'h3):(1'h1)]) | wire39[(3'h6):(2'h3)]) ?
              $signed($unsigned((wire32 ?
                  wire28 : wire30))) : ({(wire28 & wire28)} >> wire26[(1'h0):(1'h0)])) : (+wire27[(1'h1):(1'h1)])))
        begin
          if ((+reg38))
            begin
              reg41 <= wire17[(4'h9):(1'h1)];
              reg42 <= $signed(($signed(wire20[(4'h8):(3'h5)]) && ((+(^wire17)) ?
                  {(wire16 ? (8'hb6) : (7'h44)),
                      (wire16 ? wire24 : wire36)} : (7'h43))));
              reg43 <= (+(wire35 ?
                  $unsigned(wire16) : $unsigned(reg41[(2'h2):(1'h0)])));
            end
          else
            begin
              reg41 <= ((8'hac) ?
                  {($unsigned((-wire25)) ?
                          $signed((wire22 ? (8'hb3) : wire32)) : (^~{wire33,
                              wire23})),
                      (8'hac)} : (!wire29[(3'h6):(1'h1)]));
            end
          reg44 <= $unsigned(wire20);
          if ((({$signed($unsigned(reg41)),
                      $unsigned((reg43 ? wire37 : wire23))} ?
                  $signed((~wire16[(4'h8):(1'h1)])) : ($unsigned((wire22 & wire15)) | $unsigned((wire20 >> (7'h44))))) ?
              wire34 : ($unsigned((~|{wire37})) ?
                  (wire29 && (&(wire21 && wire15))) : wire25)))
            begin
              reg45 <= wire23[(1'h0):(1'h0)];
            end
          else
            begin
              reg45 <= ((((wire34[(3'h4):(2'h3)] >>> wire24) - reg45) ?
                  wire35[(2'h3):(1'h1)] : reg41) + $unsigned({wire18[(5'h11):(4'he)]}));
              reg46 <= (($signed(((wire35 ^~ wire27) ?
                  reg43 : $unsigned((7'h44)))) ~^ wire40[(3'h7):(2'h2)]) + $unsigned(wire24));
              reg47 <= ({$unsigned($signed({reg41})),
                  (!(~^{wire15}))} & wire24);
              reg48 <= $signed((wire33[(4'h8):(3'h4)] != wire37));
              reg49 <= {(~|$unsigned((((8'hb2) < (8'h9d)) ?
                      wire32[(3'h6):(1'h0)] : (-wire23))))};
            end
          reg50 <= wire27[(3'h4):(3'h4)];
        end
      else
        begin
          if (wire23)
            begin
              reg41 <= $unsigned(({({wire39, reg48} ?
                      {reg45, wire39} : (8'ha3)),
                  ((wire15 ? reg46 : (8'ha4)) ?
                      (wire36 ? wire37 : wire20) : (reg41 ?
                          wire26 : wire19))} > (wire36[(1'h0):(1'h0)] >>> wire34)));
            end
          else
            begin
              reg41 <= (~(8'h9e));
              reg42 <= (~^wire16[(4'hf):(1'h0)]);
              reg43 <= $unsigned((wire17 << $unsigned(wire34[(4'ha):(3'h6)])));
            end
          reg44 <= $unsigned($unsigned($unsigned((+(wire40 + wire18)))));
          reg45 <= (|((-$signed($unsigned(reg48))) == $unsigned(((reg42 >= reg41) <<< (^~wire30)))));
        end
    end
endmodule
