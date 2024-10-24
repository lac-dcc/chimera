module top
#(parameter param122 = {(7'h44), {(((~&(7'h41)) ? ((7'h40) ? (8'hbf) : (8'ha7)) : ((8'ha3) ? (8'h9f) : (8'hb9))) ? (8'hb2) : ((!(8'hb3)) <= ((8'hb5) <<< (8'hb9)))), (~^(((8'had) ? (8'hb6) : (8'hb7)) < (~^(8'ha7))))}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire118;
  wire [(3'h4):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire103;
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  assign y = {wire121,
                 wire118,
                 wire117,
                 wire103,
                 reg120,
                 reg119,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  module4 #() modinst104 (wire103, clk, wire0, wire1, wire2, wire3);
  always
    @(posedge clk) begin
      if ((((wire103 ?
              ((wire3 + (8'ha2)) + ((8'haf) >= wire103)) : (wire103[(4'he):(4'hb)] ?
                  wire103 : {wire2,
                      wire2})) == ($signed($unsigned(wire3)) ^ wire3)) ?
          $unsigned(wire2) : $unsigned(({wire103, $signed(wire103)} ?
              (8'ha4) : {(wire3 ^~ (8'hb4)), (wire2 ? wire0 : (8'hb4))}))))
        begin
          reg105 <= wire0[(1'h1):(1'h1)];
          reg106 <= ({(wire0 - wire3)} == wire0);
        end
      else
        begin
          if (wire1)
            begin
              reg105 <= ((|(((8'ha3) <= (wire1 <= (8'hb6))) ?
                      $unsigned(wire0[(4'h8):(3'h5)]) : (~^{(8'hb4)}))) ?
                  reg106 : ($signed(((wire0 != wire2) << wire0[(4'h8):(2'h3)])) ?
                      wire3 : (~^wire1)));
            end
          else
            begin
              reg105 <= (($unsigned((((8'hb9) >>> reg106) <= (wire2 >>> (8'hbc)))) + wire1) ?
                  reg105 : ($unsigned(wire103[(4'hd):(3'h6)]) == wire1));
              reg106 <= {$signed((reg106[(4'hc):(4'hc)] ~^ ($unsigned(reg105) + reg106[(2'h2):(2'h2)]))),
                  (wire2 != ($signed($signed(wire2)) ?
                      $signed($signed(wire0)) : (wire0[(4'h9):(2'h3)] ?
                          wire0[(4'h9):(1'h0)] : $unsigned(wire3))))};
              reg107 <= wire3[(5'h10):(1'h1)];
              reg108 <= ($signed($signed({(reg106 || wire103)})) ?
                  ((((wire1 ? wire0 : wire103) ?
                              (~^wire0) : (wire103 ? wire0 : (8'hbf))) ?
                          $unsigned({wire2, wire2}) : {(wire103 > reg107)}) ?
                      $unsigned((^wire2)) : $unsigned((~&{(8'hac)}))) : ($unsigned(wire0) * $signed((~&(wire2 ?
                      reg105 : reg106)))));
            end
        end
      if ($unsigned((reg107 ~^ {reg107, reg107[(5'h10):(4'h8)]})))
        begin
          reg109 <= wire0;
          reg110 <= reg109[(3'h4):(2'h3)];
          reg111 <= ((((8'ha0) >> $unsigned(((8'h9c) | reg105))) <= $unsigned($signed($unsigned(reg106)))) ?
              ($signed((((8'hb4) | reg107) ?
                  reg106[(4'h8):(3'h5)] : (reg108 ?
                      (8'hba) : wire0))) ^ reg105) : $signed($signed(wire103[(1'h1):(1'h0)])));
          reg112 <= (^$unsigned((reg106[(3'h6):(3'h5)] ^ wire0)));
        end
      else
        begin
          if ((-reg108[(2'h2):(1'h0)]))
            begin
              reg109 <= (~|$unsigned((-((-wire1) != (~^(8'ha7))))));
            end
          else
            begin
              reg109 <= $unsigned((^{($unsigned(wire2) ~^ $signed(reg105)),
                  {(wire0 <<< wire0), (reg107 ? (8'hac) : reg107)}}));
              reg110 <= (^~(!$signed($signed(reg109))));
              reg111 <= ({{$unsigned((reg112 && reg111))},
                  {$signed((wire3 ? (8'hb6) : reg107)),
                      $signed((|reg107))}} && reg105);
              reg112 <= (~reg105[(1'h1):(1'h0)]);
              reg113 <= (~$signed($signed(($unsigned(wire3) != $unsigned(reg109)))));
            end
          reg114 <= (&(~^$unsigned({((8'hb6) == reg106), $signed(wire3)})));
        end
      reg115 <= wire1;
      reg116 <= (reg110[(3'h5):(2'h2)] ?
          (~(+$unsigned(reg113[(2'h2):(1'h0)]))) : (-(~|(|((8'ha5) ?
              reg108 : reg112)))));
    end
  assign wire117 = (reg115 ?
                       (&reg110) : ($signed({reg113}) <<< ($unsigned(reg105) ?
                           ((reg112 > (8'hb0)) ?
                               $signed((8'hb0)) : $signed(wire3)) : ((wire0 ?
                                   (8'ha4) : wire3) ?
                               {reg116, wire1} : $unsigned(reg107)))));
  assign wire118 = $unsigned(($signed(($signed(reg111) <= wire103)) ?
                       ($signed((reg109 ?
                           (8'haf) : reg115)) >> {$unsigned(reg111),
                           (&(8'h9e))}) : $signed(((+reg115) ^~ reg116))));
  always
    @(posedge clk) begin
      reg119 <= wire103[(4'ha):(3'h5)];
      reg120 <= {$signed(({{reg114}} ?
              reg111[(4'ha):(3'h4)] : $signed(((8'h9c) <<< wire117))))};
    end
  assign wire121 = $unsigned($unsigned((($signed(wire103) * $unsigned(reg107)) ?
                       $signed(reg120[(2'h2):(2'h2)]) : {((8'hab) <<< (8'hb7)),
                           (|reg116)})));
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire6;
  input wire signed [(4'ha):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire102;
  wire [(3'h6):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire75;
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  assign y = {wire102,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire45,
                 wire10,
                 wire9,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire75,
                 reg101,
                 reg100,
                 reg99,
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
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire9 = $unsigned($signed((((~^wire6) ~^ (-(7'h43))) ?
                     (wire6 == wire7) : $signed($signed(wire6)))));
  assign wire10 = (+(+(^wire5)));
  module11 #() modinst46 (wire45, clk, wire9, wire7, wire6, wire5, wire10);
  assign wire47 = (wire10[(4'h9):(2'h2)] ?
                      ($signed($unsigned({wire5,
                          wire7})) <= (~&($signed(wire9) >> (!wire10)))) : wire7[(4'he):(1'h1)]);
  assign wire48 = ($unsigned((^~$signed((8'h9f)))) ?
                      {$unsigned({(wire7 < (7'h43))}),
                          ($unsigned(((8'h9c) ? wire10 : wire8)) ?
                              wire8[(1'h0):(1'h0)] : $unsigned((wire10 == wire7)))} : wire45);
  assign wire49 = $unsigned(($unsigned($signed(wire5[(1'h1):(1'h1)])) ?
                      (($unsigned(wire6) ?
                          (&wire9) : (wire6 != wire10)) && wire45[(4'he):(4'hb)]) : ({(-wire47),
                          wire6[(4'ha):(3'h5)]} || ((7'h44) << (wire6 != wire7)))));
  assign wire50 = $unsigned((-(8'hac)));
  assign wire51 = {$signed($unsigned({((8'ha4) ? wire7 : wire6)}))};
  assign wire52 = (wire10[(4'h8):(2'h3)] != ($signed((-(wire10 * wire48))) ?
                      (8'hb9) : ($signed($signed(wire48)) < wire10[(3'h6):(1'h0)])));
  module53 #() modinst76 (wire75, clk, wire52, wire7, wire49, wire45, wire8);
  assign wire77 = $unsigned(wire48[(1'h1):(1'h1)]);
  assign wire78 = {wire47, (7'h42)};
  assign wire79 = wire10[(3'h5):(2'h3)];
  assign wire80 = wire45;
  assign wire81 = (^~$signed($unsigned((|wire49))));
  assign wire82 = wire48;
  assign wire83 = (($unsigned($signed((wire10 != wire78))) ?
                      ({(wire9 ~^ wire80),
                          (~^wire48)} <= wire9) : ($unsigned((wire80 ?
                              wire48 : wire77)) ?
                          (~$signed(wire47)) : wire9[(4'h9):(2'h3)])) < $signed($unsigned(wire9)));
  assign wire84 = (^$signed((~&(-wire47))));
  assign wire85 = wire9;
  always
    @(posedge clk) begin
      reg86 <= (~^$signed(wire47));
      if ((~^wire82[(4'hc):(3'h4)]))
        begin
          if (($signed($signed($unsigned((wire51 ? wire82 : wire45)))) ?
              ($signed(((^~wire78) ?
                  ((8'ha5) != (8'h9c)) : (8'ha3))) <<< $signed(((|wire6) ?
                  (~^wire47) : $unsigned(wire45)))) : $signed($unsigned($unsigned(wire85)))))
            begin
              reg87 <= ((-wire7[(5'h12):(4'ha)]) > wire50[(3'h6):(3'h6)]);
              reg88 <= wire50;
              reg89 <= wire50;
              reg90 <= (wire78[(1'h1):(1'h1)] > (((!(wire45 ?
                      (7'h42) : wire79)) != {wire79, (|wire51)}) ?
                  {(^$signed(reg89))} : ((!wire8[(4'hf):(3'h5)]) < ((wire78 << wire8) ?
                      $unsigned((8'ha5)) : (|wire6)))));
            end
          else
            begin
              reg87 <= $signed(wire83[(3'h5):(3'h5)]);
              reg88 <= {$unsigned((~(^~{wire52}))),
                  ((reg88[(4'he):(4'hb)] || $signed(reg90[(4'hd):(1'h1)])) != $signed(($signed((8'hb0)) ?
                      {wire85} : $signed(wire80))))};
              reg89 <= wire45;
              reg90 <= (&$signed($signed(wire84)));
              reg91 <= $unsigned(wire79[(2'h3):(1'h1)]);
            end
          reg92 <= $unsigned((8'ha9));
          if (wire7)
            begin
              reg93 <= $signed(wire6);
              reg94 <= ($unsigned($signed(wire84)) & $signed($signed(wire85)));
              reg95 <= $signed($signed(wire83[(4'hc):(4'ha)]));
              reg96 <= {$unsigned($unsigned((&$unsigned(wire50))))};
            end
          else
            begin
              reg93 <= (^(^~wire8));
              reg94 <= ($signed($unsigned($unsigned(((8'ha8) ?
                      wire49 : wire47)))) ?
                  {$unsigned((wire9 ? (^~wire77) : wire51)),
                      wire75[(5'h14):(2'h3)]} : ({wire52[(4'hd):(4'hc)],
                          wire52} ?
                      wire85[(2'h2):(2'h2)] : ($unsigned(((8'ha4) != wire83)) & wire82)));
              reg95 <= reg87[(3'h6):(2'h2)];
              reg96 <= (wire47 >>> (wire8 < ($unsigned($unsigned((7'h43))) >>> reg90)));
            end
          if ((wire82[(2'h3):(1'h1)] ^ $signed(({(!wire47),
              (wire6 ? wire47 : wire51)} <= wire52))))
            begin
              reg97 <= $unsigned($signed(wire9));
              reg98 <= $unsigned($unsigned($unsigned($signed({reg92, reg86}))));
              reg99 <= $unsigned($signed(($unsigned({wire47, wire5}) ?
                  wire85 : (reg90[(4'h8):(1'h1)] >>> (~wire9)))));
              reg100 <= ((8'ha1) + $unsigned((~|reg87[(4'hd):(4'h9)])));
            end
          else
            begin
              reg97 <= (($unsigned({(^~wire8)}) | $signed((wire75[(5'h14):(5'h12)] ?
                  ((8'ha0) ^ reg92) : {reg95, reg86}))) <= ($signed(((+reg86) ?
                      $signed(reg96) : (wire75 ^ wire75))) ?
                  {$signed((^~wire51))} : reg95[(3'h5):(1'h0)]));
              reg98 <= (8'haf);
              reg99 <= {(+(|wire81[(1'h1):(1'h1)])), reg94[(2'h3):(2'h2)]};
              reg100 <= (8'hba);
            end
          reg101 <= ($signed(wire8[(1'h1):(1'h0)]) != wire80);
        end
      else
        begin
          if ((((8'had) ?
                  {($unsigned(wire6) ? (reg88 ? reg93 : reg100) : reg94),
                      reg87[(4'h9):(3'h4)]} : $unsigned(($unsigned(wire45) << {reg97}))) ?
              $signed($signed($unsigned(reg95))) : (8'ha8)))
            begin
              reg87 <= wire82;
            end
          else
            begin
              reg87 <= $signed(((($signed(reg93) >= reg101) != wire10[(1'h0):(1'h0)]) <<< {(wire79 ?
                      (~|wire7) : (~^wire82)),
                  (+(^reg87))}));
              reg88 <= reg96;
              reg89 <= ($signed($signed((8'haa))) ?
                  $signed((~({reg88, reg89} ?
                      (reg94 <= reg101) : (wire50 >= reg101)))) : $unsigned({({(8'h9e),
                              (8'ha3)} ?
                          $unsigned(wire77) : (-wire79))}));
              reg90 <= (((-(-(reg97 - reg89))) ?
                      $unsigned({$signed((8'h9c))}) : ((7'h43) ?
                          (^((7'h43) >> wire9)) : $unsigned((8'hab)))) ?
                  ($unsigned(wire52[(3'h7):(1'h1)]) ?
                      wire79 : ($unsigned(wire10[(3'h4):(1'h0)]) + (^$signed(wire84)))) : (8'hbe));
            end
          if ((((reg101[(3'h7):(3'h4)] ^ ((~^reg87) ?
              wire8[(4'hf):(4'hb)] : reg96[(4'ha):(4'h9)])) ~^ reg98[(4'hf):(1'h1)]) + (|$unsigned((~|$unsigned(wire7))))))
            begin
              reg91 <= (wire50 ^~ ($signed((-(8'hb6))) <= (wire51 != $unsigned($signed(reg91)))));
            end
          else
            begin
              reg91 <= (wire77[(3'h6):(2'h3)] ?
                  ({wire48[(2'h3):(1'h1)], $signed((~|wire49))} ?
                      reg92 : ($unsigned(wire80[(3'h5):(2'h2)]) - (reg87[(4'h9):(3'h4)] ?
                          ((7'h40) - reg87) : $unsigned((8'hb4))))) : $unsigned((-wire47)));
            end
          reg92 <= ($unsigned($unsigned((~|$unsigned((8'hbd))))) ?
              wire77[(4'ha):(1'h0)] : $unsigned(wire84[(3'h4):(3'h4)]));
        end
    end
  assign wire102 = reg94;
endmodule

module module53
#(parameter param74 = (~(~^(({(8'hab)} ? ((8'had) ? (8'ha4) : (8'ha8)) : ((8'ha6) | (8'hbd))) <= (((8'ha2) & (8'ha1)) ? (!(8'hbd)) : ((8'hb3) ? (7'h40) : (8'h9e)))))))
(y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire58;
  input wire signed [(5'h13):(1'h0)] wire57;
  input wire signed [(4'ha):(1'h0)] wire56;
  input wire [(3'h6):(1'h0)] wire55;
  input wire [(2'h3):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire61,
                 wire60,
                 wire59,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire59 = $unsigned($unsigned({(-(-wire54)),
                      {(wire56 ? (8'hac) : wire55)}}));
  assign wire60 = wire55[(1'h1):(1'h1)];
  assign wire61 = wire59[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg62 <= {$unsigned($unsigned({$signed((8'hbd)), $unsigned((8'hb9))}))};
      reg63 <= (wire55 == wire58[(1'h1):(1'h0)]);
    end
  assign wire64 = wire54[(1'h0):(1'h0)];
  assign wire65 = ((($unsigned((|wire61)) ?
                          ((wire54 + reg62) ?
                              wire64 : ((8'hbd) ~^ wire56)) : ((wire60 >>> (8'hb4)) ?
                              $unsigned(wire55) : wire60[(2'h3):(2'h2)])) <<< {wire54}) ?
                      wire58[(1'h0):(1'h0)] : (reg63[(3'h7):(3'h7)] ?
                          reg63 : (wire61[(3'h6):(2'h3)] ?
                              (!wire64[(3'h4):(3'h4)]) : ((^~wire57) ?
                                  $unsigned(wire59) : {(8'h9e)}))));
  assign wire66 = wire65[(1'h0):(1'h0)];
  assign wire67 = $signed({$signed(wire66[(2'h3):(1'h1)])});
  assign wire68 = ((&wire65) || ((~&(^reg62)) ?
                      (wire66[(2'h3):(1'h1)] + (wire67[(1'h0):(1'h0)] >= $unsigned(wire67))) : (reg62 ^~ {wire58,
                          {wire58, wire57}})));
  assign wire69 = $signed($signed(({(wire57 >>> reg63),
                      wire55[(3'h5):(2'h3)]} << $unsigned(wire55[(3'h6):(3'h4)]))));
  assign wire70 = {$unsigned({(wire60 ?
                              (wire58 != wire54) : $unsigned(wire56))})};
  assign wire71 = $signed($unsigned(wire57[(4'ha):(1'h0)]));
  assign wire72 = $unsigned(wire70[(4'h8):(1'h1)]);
  assign wire73 = (~&$unsigned(wire54));
endmodule

module module11
#(parameter param44 = (((8'ha4) == (^~(((7'h43) ? (8'hb0) : (8'ha9)) ^ {(8'hb3), (8'hbd)}))) ? {(+(((8'hb6) ? (8'hbe) : (8'hb8)) ? ((8'hb2) ? (8'hbb) : (8'hba)) : ((8'hb0) ? (8'hb6) : (7'h44))))} : {((-{(8'ha1), (8'had)}) >> ((&(8'h9e)) || ((8'hb5) ^~ (8'ha3)))), ((((8'ha9) || (8'hae)) ? ((8'hae) ? (8'hb3) : (8'hab)) : ((8'hb2) ? (7'h44) : (8'hb7))) ? (~|(^~(8'hab))) : (8'hb8))}))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire16;
  input wire [(4'hb):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire13;
  input wire signed [(4'h9):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire17;
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  assign y = {wire43,
                 wire35,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire17 = wire15;
  assign wire18 = wire15;
  assign wire19 = $signed(wire18);
  assign wire20 = {(7'h43)};
  assign wire21 = ($signed($unsigned($unsigned($unsigned((7'h41))))) ?
                      ($unsigned(((~wire20) ?
                              $unsigned(wire17) : (wire19 != wire16))) ?
                          wire20 : wire15) : (wire18 ?
                          wire18 : (wire12[(1'h0):(1'h0)] ?
                              wire12[(1'h1):(1'h0)] : ((wire12 | wire18) || {wire18,
                                  wire15}))));
  assign wire22 = wire18[(3'h5):(3'h4)];
  assign wire23 = (({(&$unsigned((8'ha2))), wire19} ?
                      ($unsigned((wire20 < wire16)) ?
                          wire13 : (~{wire20})) : (-$signed((wire17 || wire22)))) < (wire21[(2'h2):(1'h0)] + $signed($signed($signed(wire22)))));
  assign wire24 = $signed(wire19[(2'h3):(2'h3)]);
  assign wire25 = wire13;
  assign wire26 = ({(^~$signed($signed(wire22)))} + ($signed($signed((wire16 ?
                      wire21 : wire13))) < (^~wire14[(1'h0):(1'h0)])));
  assign wire27 = {($unsigned($signed((~|wire19))) ?
                          wire21[(1'h0):(1'h0)] : wire19[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      if (wire18)
        begin
          reg28 <= (wire16[(2'h2):(1'h1)] * (+wire17[(1'h0):(1'h0)]));
          reg29 <= (~&(8'hb4));
        end
      else
        begin
          reg28 <= $signed({{reg28}});
          reg29 <= $unsigned((wire14[(2'h3):(1'h1)] != wire21[(3'h7):(3'h6)]));
          if ((((wire14 ?
                  ((wire19 >>> wire12) ?
                      (~wire19) : (!wire12)) : wire19[(1'h1):(1'h0)]) ?
              (~^(wire20[(2'h3):(1'h0)] >>> $signed(wire21))) : $unsigned(wire13)) || ({$signed((wire14 << reg28))} ?
              $unsigned(((reg29 ?
                  (8'hb4) : wire23) <= (~wire14))) : $signed((-(wire19 ?
                  wire17 : wire15))))))
            begin
              reg30 <= $unsigned(wire17);
              reg31 <= {wire17[(1'h0):(1'h0)]};
              reg32 <= {($unsigned((+$unsigned(reg28))) ?
                      ($signed((~^(8'hb0))) ^~ $signed((~|(8'h9e)))) : $signed($signed(((8'hab) <= wire20)))),
                  $unsigned((((^wire21) ^ (reg31 ? wire16 : wire24)) ?
                      wire24[(2'h3):(1'h0)] : reg29[(2'h3):(2'h3)]))};
            end
          else
            begin
              reg30 <= ($unsigned(reg30) ?
                  (reg29[(5'h14):(4'ha)] ?
                      wire16[(2'h2):(2'h2)] : (^(((8'ha1) ? wire19 : wire24) ?
                          (wire22 ?
                              (8'hb0) : wire12) : {wire22}))) : $signed((8'hbc)));
              reg31 <= wire26;
              reg32 <= wire17;
            end
        end
      reg33 <= wire22;
      reg34 <= $signed(wire14);
    end
  assign wire35 = (-{wire14[(1'h1):(1'h1)]});
  always
    @(posedge clk) begin
      reg36 <= ((-$signed(($signed(wire14) <<< {wire17, wire24}))) ?
          (~&(^~$unsigned($unsigned(wire17)))) : reg31);
      if (((($signed($signed(wire12)) != {$signed(wire22)}) == wire24[(1'h1):(1'h1)]) ?
          {(+wire27[(4'hb):(1'h1)])} : wire20[(2'h3):(2'h3)]))
        begin
          reg37 <= wire19[(1'h0):(1'h0)];
          reg38 <= (wire15[(3'h7):(2'h3)] ?
              wire17 : {(^(8'hb9)),
                  (wire26 ?
                      $signed(wire21[(3'h4):(3'h4)]) : $signed(wire21[(3'h5):(1'h1)]))});
          reg39 <= {(8'hb7)};
        end
      else
        begin
          if (reg29[(5'h13):(4'h9)])
            begin
              reg37 <= (wire21[(2'h3):(1'h0)] ?
                  {$unsigned(((reg36 ^~ reg38) & (reg32 ?
                          wire24 : wire18)))} : ((^{(wire27 ?
                          reg36 : (8'hb6))}) >= (~&(~$unsigned(reg38)))));
              reg38 <= $unsigned(reg36[(4'hc):(4'h8)]);
              reg39 <= {$signed((wire24 & (reg36 ?
                      $unsigned((8'h9f)) : $signed((8'hac)))))};
              reg40 <= $signed($unsigned($signed(wire19[(1'h1):(1'h1)])));
            end
          else
            begin
              reg37 <= $signed(($unsigned($unsigned(reg40)) ?
                  wire26[(1'h1):(1'h1)] : $signed(reg31)));
              reg38 <= wire22[(3'h6):(3'h6)];
              reg39 <= $unsigned(wire15[(2'h2):(1'h0)]);
              reg40 <= wire14[(3'h4):(1'h0)];
            end
        end
      if ((((&reg29) & (+($unsigned(wire23) >= wire24[(2'h2):(2'h2)]))) != (reg40[(2'h2):(2'h2)] < ($unsigned($signed(wire17)) ?
          ($unsigned(wire12) ? $signed(reg38) : (wire23 < wire13)) : wire16))))
        begin
          reg41 <= {{(8'ha6)}};
        end
      else
        begin
          reg41 <= {(wire24[(5'h14):(5'h12)] ?
                  ($signed(wire22) ^ ((8'hbb) * reg41[(2'h2):(2'h2)])) : $unsigned({wire26,
                      {wire27, wire22}}))};
        end
      reg42 <= wire26;
    end
  assign wire43 = ($signed((^{$unsigned(reg36)})) ^ (^wire12[(2'h2):(2'h2)]));
endmodule
