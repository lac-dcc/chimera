module top
#(parameter param243 = (!(((((8'hab) ? (8'hb9) : (8'ha2)) ? (^(8'ha8)) : ((8'hae) < (8'haa))) ? (~&(^~(8'ha4))) : (((8'hb2) ? (8'ha1) : (8'hbd)) >> (~|(8'hbe)))) ? (((8'ha3) != (~^(8'hb7))) ? (((8'h9d) ? (7'h43) : (8'hae)) != (&(8'ha4))) : (^((8'haf) ? (8'h9d) : (8'hac)))) : (&(((8'hbb) ^ (8'hb3)) ? (^(8'ha6)) : ((8'haa) > (7'h43)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire241;
  wire [(5'h13):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  assign y = {wire241,
                 wire91,
                 wire90,
                 wire89,
                 wire85,
                 wire84,
                 wire83,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire67,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg86,
                 reg87,
                 reg88,
                 (1'h0)};
  assign wire5 = $unsigned(wire4[(2'h2):(2'h2)]);
  assign wire6 = (8'hb3);
  assign wire7 = wire2[(1'h1):(1'h1)];
  assign wire8 = (~wire1[(4'h9):(3'h4)]);
  assign wire9 = {(8'ha0), wire5[(3'h4):(2'h3)]};
  module10 #() modinst68 (.wire14(wire0), .y(wire67), .wire11(wire8), .clk(clk), .wire13(wire6), .wire12(wire7));
  assign wire69 = $signed((~|wire0));
  assign wire70 = (wire6 ? wire8[(4'hd):(2'h3)] : wire9[(2'h2):(2'h2)]);
  assign wire71 = $unsigned(({wire8,
                      (~&(wire1 ~^ wire70))} * $unsigned((wire4[(2'h2):(1'h1)] <<< {(8'hb3)}))));
  assign wire72 = {(-$unsigned($unsigned((wire69 ? wire70 : wire3)))),
                      $unsigned(((-wire4) ?
                          (&{wire1}) : $signed(wire6[(3'h5):(2'h2)])))};
  assign wire73 = $unsigned(wire70);
  assign wire74 = ($unsigned((8'ha4)) <<< {wire73[(3'h4):(1'h0)]});
  always
    @(posedge clk) begin
      reg75 <= wire67[(4'h8):(2'h2)];
      if (wire2[(3'h6):(1'h1)])
        begin
          reg76 <= $signed(reg75);
          if ((~&$signed((^~((wire6 ^ wire9) ?
              (wire72 <<< wire73) : (-wire73))))))
            begin
              reg77 <= (~|$unsigned(wire69[(3'h5):(2'h2)]));
              reg78 <= $signed(($signed(wire3[(4'h8):(3'h7)]) ? wire7 : reg75));
              reg79 <= reg77;
              reg80 <= ($unsigned({$signed($unsigned(wire69)),
                  $unsigned((-wire71))}) ^~ $signed($unsigned($signed($signed(wire67)))));
            end
          else
            begin
              reg77 <= $signed($unsigned((~|reg78)));
              reg78 <= $signed($unsigned($unsigned(wire72)));
            end
        end
      else
        begin
          if ($signed((({wire70, ((8'hae) ? wire72 : wire5)} | reg80) ?
              wire74 : wire74[(4'ha):(3'h4)])))
            begin
              reg76 <= wire74;
            end
          else
            begin
              reg76 <= ((~^({$signed(wire8),
                  $unsigned(wire0)} || $signed((wire0 ?
                  (8'haa) : (8'hae))))) | wire71);
              reg77 <= {$signed(((!(wire5 <<< wire4)) ?
                      {reg80} : wire9[(3'h6):(2'h3)]))};
              reg78 <= (~^$unsigned(((^$signed(wire5)) - wire9[(4'hc):(3'h5)])));
              reg79 <= $signed(wire74);
            end
          reg80 <= {(~|(wire72 ^~ reg75)), $signed(wire69)};
        end
      reg81 <= {(|(((wire2 ? wire74 : wire5) ?
              (wire7 ^ wire70) : wire72[(3'h5):(2'h2)]) >> ({wire3} | (~^wire4)))),
          ((~|$unsigned($signed(wire3))) ~^ $signed(wire5[(2'h2):(2'h2)]))};
      reg82 <= ($signed(wire9[(4'h9):(3'h5)]) & $signed(wire71[(3'h4):(1'h1)]));
    end
  assign wire83 = (~^reg76[(2'h2):(2'h2)]);
  assign wire84 = (^reg79[(4'ha):(1'h0)]);
  assign wire85 = wire67[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      reg86 <= wire71[(2'h3):(2'h2)];
      reg87 <= $signed(((reg75[(4'ha):(3'h7)] ?
          ((wire71 ? reg80 : wire6) ? $signed(wire83) : (!(8'hb5))) : ({wire8} ?
              (&reg86) : $signed(reg80))) - wire84));
      reg88 <= wire2;
    end
  assign wire89 = (($unsigned($signed((wire6 - reg82))) ^~ (|((reg76 ?
                          wire5 : reg87) ?
                      (wire0 ?
                          wire8 : wire3) : (~|reg87)))) | reg75[(4'hb):(1'h1)]);
  assign wire90 = (-(reg76 << (($unsigned(wire67) ? wire6 : $signed(reg82)) ?
                      (~|$unsigned(wire89)) : (^~$unsigned(wire8)))));
  assign wire91 = reg79;
  module92 #() modinst242 (.wire94(wire7), .wire93(wire74), .y(wire241), .clk(clk), .wire95(wire9), .wire97(wire73), .wire96(reg88));
endmodule

module module92  (y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'h2bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire97;
  input wire signed [(4'he):(1'h0)] wire96;
  input wire [(4'hd):(1'h0)] wire95;
  input wire [(5'h11):(1'h0)] wire94;
  input wire [(5'h10):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire240;
  wire signed [(5'h11):(1'h0)] wire239;
  wire signed [(5'h11):(1'h0)] wire227;
  wire signed [(5'h13):(1'h0)] wire226;
  wire signed [(5'h14):(1'h0)] wire225;
  wire [(5'h12):(1'h0)] wire164;
  wire [(5'h12):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire166;
  wire [(4'ha):(1'h0)] wire222;
  reg [(5'h14):(1'h0)] reg238 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg237 = (1'h0);
  reg [(5'h15):(1'h0)] reg236 = (1'h0);
  reg [(4'hc):(1'h0)] reg235 = (1'h0);
  reg [(4'h8):(1'h0)] reg234 = (1'h0);
  reg [(5'h13):(1'h0)] reg233 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg232 = (1'h0);
  reg [(4'hc):(1'h0)] reg231 = (1'h0);
  reg [(5'h12):(1'h0)] reg230 = (1'h0);
  reg [(5'h14):(1'h0)] reg229 = (1'h0);
  reg signed [(4'he):(1'h0)] reg228 = (1'h0);
  reg [(5'h14):(1'h0)] reg224 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  assign y = {wire240,
                 wire239,
                 wire227,
                 wire226,
                 wire225,
                 wire164,
                 wire112,
                 wire102,
                 wire98,
                 wire166,
                 wire222,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg224,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire98 = ($signed(wire95[(4'hb):(4'h9)]) ^ {wire93});
  always
    @(posedge clk) begin
      if (wire93[(3'h7):(3'h7)])
        begin
          reg99 <= ($signed(((~^(wire95 ? (8'hbb) : wire93)) ?
                  $signed((wire94 ?
                      wire93 : wire98)) : wire96[(3'h7):(1'h1)])) ?
              wire95 : $unsigned(wire94));
          reg100 <= reg99;
        end
      else
        begin
          reg99 <= (reg100[(3'h5):(3'h5)] ^ {{$signed((wire93 ?
                      wire97 : (8'ha4))),
                  wire96[(3'h4):(2'h3)]}});
        end
      reg101 <= (~{{$unsigned($unsigned(wire95)),
              $unsigned((wire96 ? wire98 : wire95))},
          ((^~wire93) ? (!(+wire97)) : wire98[(1'h1):(1'h0)])});
    end
  assign wire102 = ((!(((wire97 ~^ reg101) ?
                               $unsigned((8'h9e)) : (wire98 ^~ reg101)) ?
                           $unsigned((wire93 ?
                               reg99 : wire94)) : $unsigned({wire98}))) ?
                       reg100[(4'hf):(4'he)] : (+$signed(wire97[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg103 <= {wire98[(3'h4):(2'h3)]};
      if ((reg99 ? reg99[(1'h0):(1'h0)] : wire94))
        begin
          reg104 <= wire96;
          reg105 <= wire94[(3'h6):(1'h0)];
          reg106 <= {(((|{(7'h40)}) ?
                  reg101[(1'h0):(1'h0)] : reg99) + (|{$signed(wire96)}))};
        end
      else
        begin
          reg104 <= wire93;
          reg105 <= {(+(((wire95 ~^ wire96) ?
                  $unsigned(reg99) : $unsigned(reg101)) >= $unsigned($unsigned(wire96)))),
              wire96[(4'h8):(2'h3)]};
          if ({{reg106}, (reg99[(2'h3):(1'h0)] ^~ (~^(^~(+reg103))))})
            begin
              reg106 <= (8'ha0);
              reg107 <= $signed(wire97[(2'h2):(1'h0)]);
              reg108 <= wire96;
            end
          else
            begin
              reg106 <= wire102[(1'h1):(1'h0)];
            end
          reg109 <= wire96[(4'h8):(1'h1)];
        end
      reg110 <= {$unsigned($signed({wire98, reg103}))};
      reg111 <= $signed({(({reg107} ? (wire96 ? (7'h40) : wire102) : reg104) ?
              reg105 : ((reg103 ? wire94 : (8'hb7)) ^~ (reg108 && reg101)))});
    end
  assign wire112 = (wire98 ?
                       reg106 : (reg104 <<< (((reg109 | (8'hbd)) + (wire102 ?
                           reg99 : reg101)) && reg111[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg113 <= (+reg107);
      if ($unsigned(($unsigned(wire98[(2'h3):(2'h2)]) >>> ((reg106 || $unsigned(reg107)) ?
          $unsigned(((8'hb3) * reg107)) : reg110))))
        begin
          reg114 <= (+(~(reg107 ? {$unsigned(wire112)} : (~&$signed(wire96)))));
          reg115 <= $unsigned($unsigned((~&$signed((~&reg113)))));
          if ($unsigned((($unsigned($unsigned(reg108)) >>> reg100) <= $unsigned($unsigned(reg114)))))
            begin
              reg116 <= ($signed(reg104) ?
                  reg113[(2'h2):(2'h2)] : $signed((wire98[(1'h0):(1'h0)] && $unsigned({reg104}))));
            end
          else
            begin
              reg116 <= reg103[(1'h0):(1'h0)];
              reg117 <= {$signed($signed((^(wire93 | wire96)))),
                  $unsigned($unsigned(wire112))};
              reg118 <= {(wire97 < $signed(reg99[(1'h1):(1'h1)])),
                  $signed({(reg101[(1'h0):(1'h0)] && wire112[(1'h1):(1'h1)])})};
              reg119 <= (~|{({(reg108 ^~ wire94)} ?
                      $unsigned($signed(wire102)) : (((8'ha8) ?
                          (7'h42) : reg113) || wire95[(3'h7):(3'h5)]))});
            end
          if (reg107)
            begin
              reg120 <= $signed({(!({wire98, reg118} ? (~|wire102) : {wire96})),
                  reg105});
              reg121 <= ($signed((^{reg109,
                  wire98[(1'h1):(1'h0)]})) && reg103[(1'h1):(1'h0)]);
              reg122 <= reg120;
              reg123 <= ({((&$unsigned(reg110)) ?
                          (~^((8'haf) ?
                              reg104 : (8'hb8))) : (((7'h40) || wire98) - (reg121 ?
                              reg109 : wire97))),
                      $signed(reg106)} ?
                  $signed(((reg106[(3'h5):(3'h5)] ?
                      (~wire97) : $unsigned(reg119)) - wire94)) : (reg115[(2'h2):(1'h1)] ?
                      $signed($unsigned($signed(reg121))) : reg107[(3'h6):(3'h4)]));
              reg124 <= ((((|(reg100 ? reg99 : reg109)) ?
                          $signed($unsigned(reg100)) : (|$signed(wire112))) ?
                      (!reg123) : reg101) ?
                  reg105 : $signed({wire96}));
            end
          else
            begin
              reg120 <= $signed((reg118 <<< wire97[(3'h5):(3'h5)]));
            end
          reg125 <= reg123;
        end
      else
        begin
          reg114 <= reg104;
          reg115 <= $signed(wire112);
          reg116 <= (!reg100);
          if ($unsigned((^~$unsigned(reg116[(2'h2):(1'h1)]))))
            begin
              reg117 <= (~&$signed((~|$signed({reg125, (8'hb5)}))));
              reg118 <= ($signed((wire95 < (&reg100))) >>> ($signed(reg121[(1'h1):(1'h1)]) ?
                  ($signed((~reg105)) < (reg119[(1'h0):(1'h0)] >>> (reg109 ?
                      (7'h40) : reg103))) : (~&$unsigned(((8'hbc) - (8'hb8))))));
              reg119 <= {((~|wire102[(1'h1):(1'h0)]) + $signed((~|(reg117 ?
                      wire97 : reg116))))};
              reg120 <= ((&reg107[(4'h9):(4'h9)]) ?
                  reg109 : $unsigned(($signed((-wire98)) ?
                      (+$signed(reg106)) : (-{reg120}))));
              reg121 <= $signed(wire98[(3'h7):(3'h6)]);
            end
          else
            begin
              reg117 <= (wire93 ?
                  ({(8'hb9), {{reg115}}} <<< (&(^$unsigned(wire97)))) : reg104);
              reg118 <= ((8'ha9) ?
                  (reg100 ?
                      wire102 : {$signed($signed(reg99))}) : $signed(($signed(wire98[(3'h4):(1'h1)]) & $signed({(8'ha2)}))));
            end
        end
      reg126 <= $signed((~|(~^reg116[(2'h2):(1'h0)])));
    end
  module127 #() modinst165 (.wire130(wire96), .wire128(reg120), .y(wire164), .wire131(reg110), .wire132(reg118), .wire129(reg125), .clk(clk));
  assign wire166 = reg101;
  module167 #() modinst223 (wire222, clk, reg110, reg100, reg125, wire95, reg109);
  always
    @(posedge clk) begin
      reg224 <= $unsigned((wire98[(1'h0):(1'h0)] >> wire166));
    end
  assign wire225 = $signed($unsigned(wire98[(2'h2):(2'h2)]));
  assign wire226 = $unsigned((|((-(|reg122)) - {(!wire166),
                       $unsigned((8'ha9))})));
  assign wire227 = {$signed($unsigned({reg110}))};
  always
    @(posedge clk) begin
      reg228 <= reg124[(3'h7):(2'h3)];
      reg229 <= reg99;
      if ((($unsigned({reg113[(3'h4):(2'h3)], wire227[(1'h0):(1'h0)]}) ?
          (-$unsigned((reg113 ?
              reg224 : (8'ha0)))) : $unsigned(($unsigned(reg99) <<< (reg126 + reg105)))) + (((wire97[(2'h3):(2'h3)] ?
              ((8'ha0) ? reg101 : wire164) : wire96[(4'hc):(1'h0)]) ?
          ((wire112 ?
              reg229 : (8'hb3)) < $unsigned(wire226)) : $unsigned((reg118 >= reg229))) & wire97[(2'h2):(1'h0)])))
        begin
          if ({$unsigned(reg110[(4'hb):(1'h1)]),
              (!$signed($unsigned((wire94 && (8'h9e)))))})
            begin
              reg230 <= ((reg99[(1'h0):(1'h0)] ?
                      {({reg110, wire94} ?
                              (reg117 ?
                                  reg126 : (8'hbc)) : (wire112 >= wire225))} : $signed(wire93)) ?
                  wire226[(3'h5):(2'h2)] : $unsigned((~$signed((~^wire102)))));
              reg231 <= ($signed($unsigned((reg123 << $unsigned(reg101)))) ?
                  wire98[(3'h4):(2'h3)] : (+(-{reg123[(3'h5):(3'h4)]})));
              reg232 <= $unsigned((~{((^reg230) ?
                      reg111[(4'he):(2'h3)] : $unsigned(wire226)),
                  ($signed(wire94) ^~ (reg122 ? reg105 : wire227))}));
              reg233 <= {(+$unsigned(reg101)),
                  ({{$unsigned(reg99),
                          $unsigned(wire225)}} >> ($signed($signed((8'ha0))) ?
                      ((~reg231) ^ (8'ha2)) : $unsigned(reg126)))};
            end
          else
            begin
              reg230 <= (reg117 ^~ (-reg104));
              reg231 <= $unsigned((reg103 ?
                  $signed((~(wire95 ?
                      reg103 : reg121))) : (wire95[(2'h2):(2'h2)] >>> (((8'hb8) << reg117) ^ (+reg103)))));
              reg232 <= reg111[(4'h9):(4'h8)];
            end
          if (reg99[(2'h2):(1'h0)])
            begin
              reg234 <= $signed(reg229);
            end
          else
            begin
              reg234 <= (^(reg106 >= wire94));
              reg235 <= {reg111[(3'h4):(3'h4)],
                  ((reg114 ?
                      (((8'hab) ? wire93 : wire112) ?
                          $signed((8'hab)) : reg109[(5'h13):(5'h11)]) : reg108) && wire98)};
            end
          reg236 <= (8'ha6);
        end
      else
        begin
          if ($unsigned(($signed($unsigned((~&(8'hbe)))) ?
              (!(|$unsigned(reg228))) : reg113[(1'h0):(1'h0)])))
            begin
              reg230 <= (reg233 * ((reg234[(1'h0):(1'h0)] * ($unsigned(reg122) ?
                      $unsigned(reg101) : reg233)) ?
                  wire102 : $signed(wire102[(2'h2):(1'h1)])));
              reg231 <= $signed(reg118);
              reg232 <= reg124;
              reg233 <= $unsigned((&((reg231[(2'h3):(1'h0)] >> reg103) >= ($unsigned(reg101) + (reg107 & reg101)))));
            end
          else
            begin
              reg230 <= {wire96};
              reg231 <= $signed({reg100});
              reg232 <= reg116[(2'h2):(1'h0)];
              reg233 <= (reg231[(3'h6):(2'h3)] <= (!$unsigned(reg120)));
            end
          reg234 <= $signed($signed(reg100[(4'hc):(4'h9)]));
        end
      reg237 <= reg119;
      reg238 <= $signed((((8'ha3) ~^ (|((8'ha0) ?
          (8'h9f) : (8'ha8)))) <<< $signed((+$signed(wire97)))));
    end
  assign wire239 = $signed((~^(reg118 ?
                       (+(+(8'ha1))) : $unsigned(wire166[(3'h7):(3'h7)]))));
  assign wire240 = (&(&wire222));
endmodule

module module10
#(parameter param65 = ((((((8'hab) ? (8'haf) : (8'hb9)) ^~ ((8'hb5) < (8'hac))) >>> (&(^(8'hbd)))) <<< {((+(7'h42)) || (+(8'hbb))), {((8'hbf) <= (8'hb4)), {(8'hb2), (8'h9f)}}}) ~^ ({(((8'hbb) >= (8'ha2)) << (+(8'h9f)))} <= {(((8'h9f) <<< (8'ha3)) && (^(8'hb8))), (8'ha4)})), 
parameter param66 = (~^(~|(((~&param65) ? (~^param65) : (param65 << param65)) << {((7'h42) << param65), (param65 + param65)}))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire27;
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  assign y = {wire64,
                 wire50,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
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
                 (1'h0)};
  module15 #() modinst28 (.wire18(wire14), .wire19(wire11), .wire17(wire12), .y(wire27), .wire16(wire13), .clk(clk));
  assign wire29 = wire14;
  assign wire30 = ({(|wire29[(4'h9):(2'h2)]),
                      (((wire11 ? wire11 : wire27) ?
                          wire12[(3'h5):(3'h5)] : $unsigned(wire29)) << $unsigned(((8'hb6) * wire13)))} ^~ (wire27 - wire11[(1'h0):(1'h0)]));
  assign wire31 = (|((~|$signed((+wire29))) ?
                      wire13 : (~^$unsigned($unsigned((8'h9e))))));
  module32 #() modinst51 (wire50, clk, wire31, wire27, wire12, wire30);
  always
    @(posedge clk) begin
      reg52 <= wire27;
      if ($signed($signed(wire29[(3'h5):(3'h5)])))
        begin
          if ((($unsigned(wire29) ?
                  (wire11 != wire27) : (wire30[(5'h11):(4'ha)] ?
                      $unsigned((^wire14)) : (wire14[(2'h2):(1'h1)] >> wire13))) ?
              $signed(((wire13 ? (|reg52) : (reg52 ? wire14 : wire12)) ?
                  ($signed(reg52) ?
                      $unsigned((8'hb5)) : $signed(wire31)) : {(8'ha9)})) : (~^(wire29 ^ wire29[(4'hc):(1'h1)]))))
            begin
              reg53 <= wire30[(1'h1):(1'h0)];
              reg54 <= $signed(($signed(wire31[(2'h2):(2'h2)]) ?
                  wire27 : $unsigned($unsigned($signed(reg53)))));
              reg55 <= (wire12[(5'h10):(4'hc)] < wire27[(1'h0):(1'h0)]);
            end
          else
            begin
              reg53 <= $unsigned((7'h42));
              reg54 <= (wire30[(4'he):(1'h0)] ?
                  ((wire50 >>> wire14) ^ ((!(8'hba)) - reg54[(3'h4):(1'h1)])) : reg52[(2'h3):(2'h3)]);
              reg55 <= (|(((wire12 ?
                      reg55 : $unsigned(wire13)) < ((wire50 | wire14) ?
                      (~wire31) : wire31[(3'h4):(2'h2)])) ?
                  (reg55[(1'h1):(1'h0)] >> $signed($signed((8'ha7)))) : $signed($unsigned({wire30,
                      wire30}))));
            end
          if ((wire11[(2'h3):(1'h1)] <= $unsigned(wire27)))
            begin
              reg56 <= (^~{reg53[(5'h10):(3'h6)]});
              reg57 <= $signed(($unsigned((8'hb2)) * reg52[(3'h4):(3'h4)]));
              reg58 <= (|(!wire30));
              reg59 <= {wire31[(5'h11):(5'h10)]};
              reg60 <= (wire11 ?
                  $unsigned({$unsigned(reg55[(1'h0):(1'h0)])}) : ($unsigned({$signed((8'hb3))}) ?
                      (8'hbc) : {$signed((reg54 || wire27)),
                          reg52[(2'h2):(1'h1)]}));
            end
          else
            begin
              reg56 <= {((^~((-reg60) <<< (!wire11))) ?
                      reg56 : (~^$unsigned(wire27[(1'h1):(1'h0)]))),
                  (-(^$unsigned($signed(reg60))))};
              reg57 <= wire14;
              reg58 <= wire12[(5'h15):(4'hb)];
            end
        end
      else
        begin
          reg53 <= ((^(!reg55[(1'h1):(1'h1)])) ?
              wire11[(1'h0):(1'h0)] : ({$signed({reg55}),
                      {wire13[(4'hc):(1'h1)]}} ?
                  {reg52[(3'h4):(1'h0)]} : $unsigned($signed($unsigned((8'ha1))))));
          reg54 <= ($signed($unsigned({{wire12, wire30}})) ?
              reg58[(4'h8):(3'h5)] : (&$unsigned((8'haa))));
        end
      reg61 <= reg55;
      reg62 <= $signed((({(wire27 ?
              wire11 : reg60)} | reg56[(4'hc):(3'h7)]) <= (reg57 + reg52)));
      reg63 <= (reg59[(3'h6):(3'h6)] ~^ {$unsigned((!$unsigned(reg54))),
          reg52});
    end
  assign wire64 = $unsigned(wire50);
endmodule

module module32
#(parameter param48 = (({(((8'ha4) < (8'haa)) | (8'hb3)), (~|((8'hbe) ? (8'hbe) : (8'hab)))} ? {(8'ha3), {(^~(8'h9d)), ((8'hbe) ? (8'hae) : (8'hbe))}} : (((^(8'ha8)) >= (~^(8'ha3))) ? (8'hb9) : (((8'hbf) && (8'ha5)) >>> {(8'hb3), (8'hb3)}))) ? ({((&(8'hae)) ? (8'ha4) : ((8'hbc) ? (8'had) : (7'h41)))} == (8'hb7)) : {(8'ha8)}), 
parameter param49 = (8'hb1))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire36;
  input wire [(3'h5):(1'h0)] wire35;
  input wire [(5'h15):(1'h0)] wire34;
  input wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire37 = (^~(+(&wire33)));
  assign wire38 = $signed((&wire37[(4'ha):(4'h8)]));
  assign wire39 = $unsigned(wire37);
  assign wire40 = $unsigned(wire34[(4'hb):(3'h5)]);
  assign wire41 = (~^$unsigned({((^~wire38) < ((8'ha1) ? (7'h42) : wire34)),
                      ((wire36 ? wire34 : wire35) * (wire34 | wire38))}));
  always
    @(posedge clk) begin
      reg42 <= (|((~&((+wire33) ?
          wire39[(4'h8):(2'h2)] : wire37[(4'ha):(3'h7)])) > {{(~&wire38)}}));
      reg43 <= (|reg42);
      reg44 <= (~^($signed(({wire33} && $unsigned(wire41))) ?
          (~^wire33[(1'h0):(1'h0)]) : ($unsigned((wire39 ?
              wire39 : wire41)) - ({wire38, reg43} ?
              {(8'h9d)} : (wire35 ? wire33 : (8'h9c))))));
    end
  assign wire45 = $signed(((|($unsigned(wire38) ?
                          wire40 : wire41[(2'h3):(1'h0)])) ?
                      $signed((((8'h9d) ? wire34 : (8'hb4)) ?
                          reg43[(4'he):(3'h5)] : wire33[(1'h1):(1'h1)])) : (&wire35)));
  assign wire46 = {wire41[(2'h2):(1'h0)], $unsigned({$unsigned({wire39})})};
  assign wire47 = ((^~wire40) & (reg43 ?
                      $signed({(reg43 >>> wire34),
                          $unsigned(reg43)}) : wire37[(4'h8):(4'h8)]));
endmodule

module module15
#(parameter param26 = (~(^{{((8'hb3) & (8'haa)), ((8'ha3) ? (8'hab) : (8'h9f))}})))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire20;
  assign y = {wire25, wire24, wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = (-(^(^~wire17[(1'h0):(1'h0)])));
  assign wire21 = wire16;
  assign wire22 = {$signed(((wire17[(5'h12):(4'ha)] ? (+wire17) : wire19) ?
                          $unsigned((wire19 << wire21)) : $unsigned((wire21 ?
                              wire18 : (8'h9e)))))};
  assign wire23 = ((8'ha7) ?
                      (($signed($signed(wire22)) > ((~|wire22) ?
                              (wire17 == wire17) : (+(8'hb8)))) ?
                          ((|(~|wire18)) ?
                              ((wire20 ?
                                  wire18 : wire18) * wire20) : wire19) : wire20[(5'h11):(3'h6)]) : {wire19});
  assign wire24 = (~wire21[(2'h3):(2'h3)]);
  assign wire25 = wire20;
endmodule

module module167  (y, clk, wire172, wire171, wire170, wire169, wire168);
  output wire [(32'h277):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire172;
  input wire [(2'h3):(1'h0)] wire171;
  input wire [(4'hf):(1'h0)] wire170;
  input wire [(4'h9):(1'h0)] wire169;
  input wire [(5'h10):(1'h0)] wire168;
  wire [(4'hd):(1'h0)] wire221;
  wire [(4'he):(1'h0)] wire220;
  wire [(5'h10):(1'h0)] wire219;
  wire [(4'ha):(1'h0)] wire214;
  wire [(5'h13):(1'h0)] wire213;
  wire signed [(4'hd):(1'h0)] wire212;
  wire [(5'h10):(1'h0)] wire211;
  wire signed [(4'hd):(1'h0)] wire210;
  wire signed [(5'h14):(1'h0)] wire209;
  wire signed [(3'h6):(1'h0)] wire208;
  wire signed [(5'h11):(1'h0)] wire179;
  wire [(3'h7):(1'h0)] wire178;
  wire [(3'h6):(1'h0)] wire177;
  wire signed [(5'h10):(1'h0)] wire176;
  wire signed [(5'h11):(1'h0)] wire175;
  wire [(5'h10):(1'h0)] wire174;
  wire [(3'h6):(1'h0)] wire173;
  reg [(3'h6):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg217 = (1'h0);
  reg [(5'h13):(1'h0)] reg216 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg215 = (1'h0);
  reg [(3'h7):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg205 = (1'h0);
  reg [(3'h6):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg203 = (1'h0);
  reg [(2'h2):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg201 = (1'h0);
  reg [(5'h12):(1'h0)] reg200 = (1'h0);
  reg [(4'hc):(1'h0)] reg199 = (1'h0);
  reg [(2'h3):(1'h0)] reg198 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg197 = (1'h0);
  reg [(5'h11):(1'h0)] reg196 = (1'h0);
  reg [(4'he):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg193 = (1'h0);
  reg [(5'h12):(1'h0)] reg192 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg191 = (1'h0);
  reg [(4'ha):(1'h0)] reg190 = (1'h0);
  reg [(5'h12):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg187 = (1'h0);
  reg [(3'h7):(1'h0)] reg186 = (1'h0);
  reg [(2'h2):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg184 = (1'h0);
  reg [(5'h13):(1'h0)] reg183 = (1'h0);
  reg [(5'h15):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg180 = (1'h0);
  assign y = {wire221,
                 wire220,
                 wire219,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 (1'h0)};
  assign wire173 = (~|wire171[(1'h0):(1'h0)]);
  assign wire174 = wire170[(4'ha):(1'h1)];
  assign wire175 = ((~{(wire173[(2'h2):(2'h2)] == wire172),
                       (~|$signed((8'ha5)))}) != $unsigned(wire168[(4'h8):(4'h8)]));
  assign wire176 = $signed((~(~^wire169[(1'h0):(1'h0)])));
  assign wire177 = (~|wire169);
  assign wire178 = $unsigned((wire174[(4'h9):(3'h4)] ?
                       {($signed(wire169) & wire169)} : wire176[(3'h4):(3'h4)]));
  assign wire179 = wire177;
  always
    @(posedge clk) begin
      if ((+((8'hbd) < $signed((~$unsigned(wire169))))))
        begin
          reg180 <= (&$unsigned((8'h9f)));
          reg181 <= ((wire173 != wire173[(2'h3):(2'h3)]) >> {$unsigned((wire179 != $signed(wire175))),
              ({{wire174, reg180}} ?
                  (wire175[(3'h7):(3'h6)] ?
                      {(8'h9d), wire178} : ((8'hab) ?
                          (8'hb0) : (7'h40))) : wire169)});
          reg182 <= $unsigned(wire179[(4'hf):(4'ha)]);
          reg183 <= (8'hae);
        end
      else
        begin
          reg180 <= $signed($unsigned((reg182 >> wire174)));
          reg181 <= ($signed(reg182) || (8'hbc));
          reg182 <= $signed($unsigned((^~$unsigned($signed(wire172)))));
        end
      reg184 <= (wire169 * $unsigned(wire179[(4'h9):(2'h3)]));
      if (((((wire176 ? (wire176 ? wire169 : wire172) : $unsigned((8'ha2))) ?
              $signed(((8'ha8) ? reg181 : reg182)) : (^(wire169 ?
                  (7'h44) : wire176))) ?
          {$signed(wire171), reg183} : wire168) + wire170[(3'h4):(3'h4)]))
        begin
          reg185 <= reg184;
          reg186 <= wire176;
          reg187 <= wire176;
          if (wire171)
            begin
              reg188 <= {$unsigned(reg184[(3'h5):(3'h4)]),
                  ({wire171} >= $signed((((8'hb6) ? reg185 : wire178) ?
                      wire169[(2'h3):(2'h3)] : (+wire178))))};
              reg189 <= ({$signed((+wire178))} ?
                  wire171 : {$unsigned($signed($signed(wire171)))});
              reg190 <= (^reg186);
              reg191 <= ((&(~&wire171)) ^~ $signed(($signed(reg183) ?
                  {(wire173 >> wire176),
                      (reg183 - reg183)} : reg185[(2'h2):(2'h2)])));
              reg192 <= wire168;
            end
          else
            begin
              reg188 <= ((reg187 || ((!$unsigned(wire175)) < (~^$signed(reg187)))) != (&(wire175 ?
                  reg189[(5'h10):(4'hb)] : reg188[(3'h7):(1'h1)])));
            end
          reg193 <= (^wire175);
        end
      else
        begin
          reg185 <= {(+wire171)};
        end
      if (reg183[(3'h6):(3'h4)])
        begin
          reg194 <= {(^reg183)};
          reg195 <= {(reg193 ?
                  wire174 : $unsigned($signed($unsigned(reg186))))};
          if ($signed($unsigned(((reg189[(5'h10):(4'h9)] ?
              wire176 : (~wire176)) ^ ((wire172 << (8'ha0)) <= (wire169 + wire176))))))
            begin
              reg196 <= reg186;
              reg197 <= {wire175};
              reg198 <= $unsigned({(((reg181 ? reg187 : reg189) ?
                      $unsigned(wire175) : (~reg192)) && (reg196[(5'h10):(5'h10)] + (-wire171))),
                  reg185[(1'h0):(1'h0)]});
              reg199 <= ($signed($unsigned(reg183)) ?
                  ($signed(((8'hb0) ?
                      (|reg185) : wire176)) + (^(8'hae))) : (reg197 ?
                      (~|($unsigned(reg195) >> $signed(wire178))) : {((wire177 ?
                                  wire172 : (8'hb4)) ?
                              $signed(reg185) : wire174),
                          reg187}));
              reg200 <= (~^reg192[(4'he):(3'h6)]);
            end
          else
            begin
              reg196 <= reg186;
              reg197 <= (~^((~|((+reg196) ?
                  (!(8'ha0)) : ((8'hbd) ?
                      wire169 : (7'h44)))) + ($unsigned((&reg181)) ?
                  (8'hae) : ((reg191 << reg180) ? (^~reg198) : reg187))));
            end
          reg201 <= (&(((~^(wire174 ? reg195 : reg191)) ?
              ((reg186 >>> reg193) || reg186[(1'h1):(1'h0)]) : ((wire179 ?
                      reg187 : reg195) ?
                  ((8'hac) ?
                      reg184 : reg185) : (reg193 != (8'hb6)))) ~^ (wire177[(1'h0):(1'h0)] - $unsigned((&(8'ha6))))));
        end
      else
        begin
          if ((-(8'h9d)))
            begin
              reg194 <= (^~wire168);
              reg195 <= reg182;
              reg196 <= wire174[(4'ha):(3'h6)];
              reg197 <= (reg183 ? wire170[(4'h9):(3'h6)] : reg181);
            end
          else
            begin
              reg194 <= (reg180 != $unsigned({reg180[(4'ha):(3'h6)],
                  $unsigned((wire169 && reg199))}));
              reg195 <= (($unsigned(reg196) + $signed(reg182[(4'h8):(2'h2)])) ^~ wire171);
              reg196 <= reg181;
              reg197 <= $unsigned(((((wire179 >= reg180) ?
                  (+reg198) : (~&(8'hb3))) <<< ((reg199 <<< reg200) ?
                  $unsigned(wire178) : $unsigned(wire172))) + ({reg199[(3'h4):(1'h1)],
                  $unsigned((8'ha0))} >= (&((8'hba) + wire171)))));
              reg198 <= ((&$signed(wire178[(3'h5):(2'h2)])) ~^ (8'hb9));
            end
          reg199 <= ((~|($signed(wire177[(1'h0):(1'h0)]) ? wire179 : wire178)) ?
              $signed($unsigned(reg192)) : ($unsigned((^{reg200,
                  reg195})) != $unsigned({$signed(wire172)})));
          reg200 <= $unsigned((reg195 ?
              (7'h44) : (wire172[(3'h5):(1'h1)] ?
                  (&((7'h41) ? wire177 : (8'hbd))) : reg198)));
          reg201 <= reg196;
        end
      if (($signed($signed(reg199[(1'h0):(1'h0)])) && reg187))
        begin
          reg202 <= $unsigned({(8'hab), reg192});
          reg203 <= $unsigned(((~$signed({reg188, (8'ha7)})) ?
              {wire168} : wire172));
          reg204 <= $unsigned(($signed(((wire171 <= reg185) == (reg196 < reg190))) ?
              reg193[(2'h2):(2'h2)] : $unsigned($unsigned($signed(wire179)))));
          reg205 <= ((^~(~&$signed({wire177}))) ?
              (-$signed(($unsigned(wire179) << $signed(wire175)))) : reg192[(2'h2):(1'h1)]);
          reg206 <= reg180;
        end
      else
        begin
          if (((~|$signed($signed(reg201))) ?
              wire168[(4'he):(4'hc)] : ($signed($signed({reg181,
                  reg184})) ^~ $unsigned(($unsigned((8'hb8)) >>> (^~wire175))))))
            begin
              reg202 <= (((-wire176[(4'h8):(4'h8)]) ?
                  wire168[(1'h1):(1'h0)] : reg186) != (~^$unsigned(((wire174 ?
                      reg198 : (8'ha2)) ?
                  {(8'had)} : reg197))));
              reg203 <= reg202;
              reg204 <= (^~$unsigned($signed($unsigned((~&wire176)))));
              reg205 <= $signed({(reg195 - wire179),
                  ((reg190[(4'h9):(1'h1)] + $signed(reg197)) | ((reg182 ?
                          reg185 : (8'hbb)) ?
                      reg199 : wire170))});
              reg206 <= (8'ha7);
            end
          else
            begin
              reg202 <= reg206[(5'h11):(3'h4)];
              reg203 <= $unsigned((reg193[(3'h5):(1'h0)] ?
                  $unsigned({((7'h44) - reg191),
                      (wire168 ?
                          (8'hbe) : wire174)}) : $unsigned($unsigned((-reg191)))));
            end
          if ((reg196 >= ((($signed(reg197) && $unsigned(reg201)) >= $signed($unsigned(reg182))) >> $unsigned($unsigned($signed((8'hbc)))))))
            begin
              reg207 <= (8'ha5);
            end
          else
            begin
              reg207 <= (reg191[(2'h2):(2'h2)] ?
                  (($signed(reg197) * $unsigned(((8'h9f) ?
                      reg194 : reg199))) ^ {reg180}) : (reg181[(1'h0):(1'h0)] ?
                      (8'ha5) : (~^$unsigned($unsigned(wire175)))));
            end
        end
    end
  assign wire208 = wire179;
  assign wire209 = ($signed($unsigned($unsigned({(8'ha7)}))) - {{($unsigned((8'ha5)) || $signed((8'hb2))),
                           $unsigned(reg200)}});
  assign wire210 = $unsigned(((!$signed(reg204)) ?
                       $signed(wire176[(3'h7):(1'h1)]) : (~&$unsigned(reg194[(4'hd):(4'ha)]))));
  assign wire211 = $signed((($signed($signed(reg187)) ?
                       $signed($signed(reg203)) : {((8'ha4) ? reg195 : (8'hae)),
                           $signed(wire177)}) ^~ $signed(($unsigned(wire210) ?
                       reg203 : reg180))));
  assign wire212 = reg193;
  assign wire213 = reg184[(4'hf):(1'h1)];
  assign wire214 = $unsigned(($signed(reg199) & (|reg200[(4'hf):(1'h1)])));
  always
    @(posedge clk) begin
      reg215 <= $unsigned((~&(+reg181)));
      reg216 <= reg186;
      reg217 <= reg180;
      reg218 <= ((~^(^((8'ha8) <<< (reg189 ?
          reg199 : reg216)))) ^~ (!(wire169 <<< wire214)));
    end
  assign wire219 = (!$unsigned(reg217));
  assign wire220 = ((($signed((^~wire172)) * reg193) ^~ {reg187[(1'h1):(1'h0)]}) << ({(((8'hba) <<< reg190) ?
                           $signed(reg187) : (wire208 ?
                               reg180 : reg181))} > ($signed((~&reg189)) < ($signed(reg183) ^ (reg218 && wire214)))));
  assign wire221 = wire214[(3'h7):(3'h4)];
endmodule

module module127
#(parameter param163 = (({{((8'hb4) ? (8'hb3) : (8'h9d)), ((8'hb7) * (8'ha4))}, (~{(7'h40)})} ? (-{((8'hb4) ? (8'hbf) : (8'ha6)), ((7'h42) < (8'hb0))}) : ({((8'hb0) ? (8'hae) : (8'ha1)), ((8'hbb) ? (8'ha3) : (8'ha6))} ^ {((8'h9e) ? (7'h42) : (8'ha3)), (&(8'ha0))})) ? (~&(((-(7'h42)) ? (^(8'ha6)) : (!(8'hb4))) - (8'hb7))) : {(-((~^(8'h9d)) ? ((8'h9c) ? (8'ha9) : (8'ha7)) : ((7'h41) || (8'ha0)))), (~^((^~(8'ha2)) - (|(8'ha7))))}))
(y, clk, wire132, wire131, wire130, wire129, wire128);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire132;
  input wire [(4'hb):(1'h0)] wire131;
  input wire signed [(3'h7):(1'h0)] wire130;
  input wire signed [(5'h10):(1'h0)] wire129;
  input wire signed [(4'h9):(1'h0)] wire128;
  wire [(5'h10):(1'h0)] wire162;
  wire signed [(4'hf):(1'h0)] wire161;
  wire [(3'h4):(1'h0)] wire160;
  wire signed [(5'h12):(1'h0)] wire159;
  wire signed [(3'h5):(1'h0)] wire158;
  wire signed [(3'h7):(1'h0)] wire157;
  wire signed [(4'he):(1'h0)] wire139;
  wire signed [(4'hc):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire signed [(4'h8):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire134;
  wire signed [(4'h9):(1'h0)] wire133;
  reg signed [(3'h7):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg155 = (1'h0);
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(2'h2):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg147 = (1'h0);
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  reg [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(2'h3):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 (1'h0)};
  assign wire133 = wire130[(3'h6):(3'h4)];
  assign wire134 = ($signed(wire130) > (~|(-wire131[(3'h6):(2'h3)])));
  assign wire135 = $signed(wire134[(3'h4):(2'h2)]);
  assign wire136 = ($unsigned(wire130[(3'h4):(2'h2)]) >>> $unsigned((wire135 ?
                       wire132[(1'h0):(1'h0)] : wire129[(4'he):(2'h2)])));
  assign wire137 = ($signed({$unsigned((+wire130)),
                       wire133}) != ($signed(wire133[(4'h9):(4'h9)]) ?
                       $unsigned(wire133[(4'h9):(3'h7)]) : (!wire134[(3'h4):(1'h1)])));
  assign wire138 = ($signed((-(-wire135[(4'h9):(2'h2)]))) | $unsigned(wire130));
  assign wire139 = (^~(|wire128));
  always
    @(posedge clk) begin
      reg140 <= ((wire131 <<< ({(&wire138)} ?
          (~wire133[(1'h1):(1'h1)]) : wire132[(2'h2):(1'h1)])) == ((^~(((8'hb0) & (8'had)) ?
              wire138[(4'h9):(4'h9)] : {wire138, wire138})) ?
          (($unsigned(wire136) ? (^wire133) : $signed(wire137)) >>> (((8'hb2) ?
                  wire132 : wire139) ?
              wire129 : ((8'hbc) > wire137))) : {$signed(wire136[(4'h8):(1'h1)]),
              ((~|wire130) || wire133[(2'h2):(2'h2)])}));
      reg141 <= wire135[(3'h5):(2'h3)];
      if ((wire139 >>> $signed($unsigned((wire129 >>> (wire135 ?
          wire131 : wire129))))))
        begin
          reg142 <= ((|$unsigned({((8'hb1) ^~ wire139),
                  wire128[(1'h0):(1'h0)]})) ?
              wire134[(2'h3):(2'h2)] : (wire137 < (wire135 & $signed(wire138))));
          reg143 <= ($unsigned((reg140 ?
                  $signed(reg141[(1'h1):(1'h1)]) : ((wire134 ?
                          (8'hba) : (8'hbb)) ?
                      (-(8'ha5)) : wire131[(1'h0):(1'h0)]))) ?
              reg141 : $signed($unsigned((+(8'ha8)))));
          reg144 <= (wire136 ?
              (((reg141[(1'h0):(1'h0)] < (wire132 ? wire139 : wire135)) ?
                  $unsigned($signed(wire133)) : (7'h42)) || ($unsigned((wire133 ?
                  wire131 : wire136)) && $signed(wire129[(5'h10):(4'he)]))) : (~wire138[(3'h4):(1'h1)]));
          reg145 <= (((~|reg143[(4'h8):(1'h1)]) ?
                  (reg141[(3'h5):(3'h4)] ?
                      ((~(8'hac)) ? {(8'h9d)} : wire130) : $unsigned((wire136 ?
                          wire137 : reg143))) : (($signed(reg141) ^ (~|wire128)) >> $unsigned((reg144 <<< reg140)))) ?
              $unsigned($signed((~|wire132[(1'h0):(1'h0)]))) : (~^{({wire130,
                      reg142} - {wire136, (8'hbd)}),
                  reg143}));
          reg146 <= (8'ha9);
        end
      else
        begin
          reg142 <= reg141;
          reg143 <= wire135[(4'hf):(2'h2)];
          reg144 <= (~^($signed(reg145) - (({reg144} ?
              (~wire138) : $unsigned(wire132)) * (wire135[(4'hf):(3'h7)] ?
              (~^wire128) : (reg140 < reg142)))));
          if (($unsigned(wire129) ?
              wire136 : (($signed({(8'hb2),
                  wire130}) <<< {$unsigned(wire136)}) + (((8'hbb) ?
                  $unsigned(wire137) : wire133) + $signed(reg143[(4'hf):(3'h6)])))))
            begin
              reg145 <= ($signed((reg140[(4'h9):(3'h6)] ?
                      (((8'haa) != reg145) && {reg144}) : $signed(reg141[(2'h2):(1'h1)]))) ?
                  ($unsigned(((reg141 ? reg146 : reg144) ?
                      (wire131 >>> wire137) : (wire134 ?
                          wire136 : wire128))) | (&{wire133[(3'h5):(1'h1)],
                      reg143[(3'h5):(3'h5)]})) : $unsigned({wire130[(2'h2):(1'h1)],
                      wire134}));
            end
          else
            begin
              reg145 <= $unsigned(reg140);
            end
        end
      if (reg143[(4'hd):(4'ha)])
        begin
          reg147 <= (($unsigned((^~wire139[(2'h2):(1'h1)])) <= wire128) ?
              wire129 : reg143);
          reg148 <= reg146;
          reg149 <= {reg144[(1'h1):(1'h0)]};
          reg150 <= (!(&((wire131[(2'h3):(1'h1)] ?
              {wire132} : wire139) || {$unsigned(wire135),
              reg146[(3'h4):(3'h4)]})));
          if ((wire131 ?
              (|wire133[(3'h4):(1'h1)]) : (reg140 ?
                  ($unsigned($signed(wire138)) * ($signed(wire137) >>> {wire131,
                      reg146})) : reg149[(1'h1):(1'h1)])))
            begin
              reg151 <= ((~&$signed(wire130[(2'h3):(1'h0)])) >= reg141);
              reg152 <= $unsigned(wire138[(2'h3):(2'h2)]);
              reg153 <= $signed($signed(reg150[(4'hc):(3'h4)]));
              reg154 <= (((~^wire130) ?
                      $signed($unsigned(reg147[(1'h0):(1'h0)])) : reg151[(3'h4):(3'h4)]) ?
                  (($signed(wire131) >>> reg153[(2'h2):(1'h0)]) ?
                      (8'ha3) : $unsigned(((reg147 ? reg153 : reg150) ?
                          (reg143 ? (8'h9f) : (8'hbe)) : reg148))) : {reg145});
              reg155 <= ({reg149[(1'h0):(1'h0)],
                      (reg143[(2'h3):(2'h2)] - ($unsigned(wire138) < reg142))} ?
                  reg147 : reg147);
            end
          else
            begin
              reg151 <= ((!wire130) ?
                  (({reg150, {reg149}} ?
                          ((&reg151) ?
                              reg154[(4'h8):(4'h8)] : $unsigned(reg145)) : wire131[(3'h5):(1'h1)]) ?
                      {((^~reg150) ?
                              (wire139 + wire129) : $unsigned(wire131))} : reg154[(1'h0):(1'h0)]) : (($signed(wire136) ?
                      (^(wire132 ~^ reg147)) : $unsigned(((8'hb6) == reg149))) > {$unsigned(reg143),
                      reg150}));
              reg152 <= ((|$signed((-(~|wire135)))) ?
                  (!(reg140 != ((&wire137) ?
                      (wire132 >> reg141) : (reg142 && reg141)))) : $signed($signed((|(~&wire135)))));
              reg153 <= (reg142[(3'h6):(3'h6)] <= ((($unsigned(wire136) ?
                  (!wire128) : (reg150 && wire129)) << $signed((reg154 ?
                  wire132 : reg150))) & $signed(reg153[(2'h2):(2'h2)])));
              reg154 <= wire135;
              reg155 <= $unsigned($unsigned((($unsigned(reg148) ~^ (&wire135)) ?
                  reg141 : ($signed((8'h9d)) || $signed(wire138)))));
            end
        end
      else
        begin
          reg147 <= {{(wire131 ?
                      (reg153 ^~ {wire137}) : ((-wire136) > {reg143})),
                  (+$unsigned(reg147[(2'h2):(1'h0)]))}};
          if ({$unsigned($signed({wire136, wire130[(3'h6):(2'h2)]})),
              $unsigned((|(wire132[(2'h3):(2'h2)] * (reg153 != (8'h9e)))))})
            begin
              reg148 <= reg142;
              reg149 <= {wire132};
              reg150 <= (^(~$unsigned($unsigned((reg144 <= reg143)))));
              reg151 <= $signed(wire128[(3'h5):(2'h2)]);
            end
          else
            begin
              reg148 <= wire138[(1'h0):(1'h0)];
              reg149 <= reg147[(1'h0):(1'h0)];
              reg150 <= $signed((!(wire134 >> $unsigned($signed(reg141)))));
              reg151 <= reg155[(3'h5):(1'h0)];
              reg152 <= $unsigned((wire136 ^~ (|((reg148 | reg150) > $signed((8'hba))))));
            end
          reg153 <= {((8'hbf) > (|$unsigned($signed(reg155))))};
          reg154 <= $signed($unsigned({((wire133 ?
                  (8'hb6) : wire136) ^ $signed(wire129))}));
          reg155 <= (|$signed({(reg153[(2'h2):(1'h0)] >= $signed((8'hb1)))}));
        end
      reg156 <= ((reg140[(3'h6):(1'h0)] ?
          $signed($signed((reg147 + wire136))) : ($unsigned(reg155[(2'h2):(2'h2)]) != ($signed(reg142) ?
              wire139[(4'h9):(3'h4)] : {reg153, reg146}))) || $signed(reg148));
    end
  assign wire157 = reg148[(4'hb):(1'h0)];
  assign wire158 = (^wire157);
  assign wire159 = (&wire137[(1'h1):(1'h1)]);
  assign wire160 = (^~reg143);
  assign wire161 = (8'ha9);
  assign wire162 = ((wire157[(1'h0):(1'h0)] + ((~^reg154) ?
                           $unsigned((reg149 >>> reg144)) : (+wire130))) ?
                       ($signed(reg152) ?
                           reg153 : $signed($signed(reg146))) : $signed(wire131[(2'h2):(1'h1)]));
endmodule
