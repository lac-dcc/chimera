module top
#(parameter param116 = {(({((8'ha0) ? (8'h9f) : (8'h9d)), ((7'h41) ? (8'ha7) : (8'ha4))} > {((8'haf) <= (8'ha8))}) ^~ ((((8'h9e) ? (8'had) : (8'hba)) ? ((8'ha5) ? (8'hb5) : (7'h42)) : ((8'ha4) ^~ (8'hb0))) ? (~|((8'hbd) >>> (8'ha1))) : (+(~&(8'ha9))))), (~&(((&(8'haf)) + (&(8'h9c))) ? (((8'hac) ^ (8'hb3)) - ((8'hb8) ? (8'h9c) : (8'ha2))) : {{(8'hbd), (7'h44)}, ((8'haf) ^~ (8'hae))}))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire96;
  wire signed [(2'h3):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire75;
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  assign y = {wire115,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire4,
                 wire75,
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
                 reg104,
                 reg103,
                 reg102,
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
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire4 = $signed($signed(wire3));
  module5 #() modinst76 (wire75, clk, wire0, wire2, wire4, wire1, wire3);
  always
    @(posedge clk) begin
      if ((wire4 ?
          wire3 : ((&(wire75 <<< $unsigned(wire1))) ?
              (+$unsigned($unsigned((7'h44)))) : $signed($signed((wire0 ^~ wire1))))))
        begin
          reg77 <= (({wire75[(3'h4):(2'h3)]} ? $signed((-wire4)) : (8'ha1)) ?
              wire75 : ((8'haa) ? $signed((+wire0[(4'h8):(3'h6)])) : (!wire3)));
          reg78 <= ($unsigned(($signed($signed(wire4)) >> $signed((+wire75)))) ?
              $signed($signed(wire1[(5'h13):(1'h1)])) : $unsigned(wire4));
        end
      else
        begin
          reg77 <= $unsigned({({$unsigned(wire0)} ?
                  (wire3 ? $signed(wire2) : wire2) : reg77),
              (~|wire0)});
          reg78 <= wire3;
          reg79 <= (($signed($unsigned(wire1)) ?
                  wire1 : $unsigned(wire1[(4'he):(2'h3)])) ?
              $signed((8'ha2)) : $unsigned({(8'ha3), (|{(8'hbe), (8'ha5)})}));
          reg80 <= (reg77 >> (-reg79));
          reg81 <= (reg77[(1'h0):(1'h0)] ^ (~^(reg77[(1'h1):(1'h0)] ?
              ($signed(wire3) * reg78[(2'h2):(2'h2)]) : ((wire75 ?
                      reg80 : wire2) ?
                  (wire0 >> reg79) : $unsigned(reg80)))));
        end
      reg82 <= $signed($unsigned(($signed((wire75 ? reg78 : wire3)) ?
          $unsigned((8'had)) : reg80)));
      if ((|(8'hbc)))
        begin
          reg83 <= ($unsigned({{wire3}}) ?
              {({(wire4 >> reg79), (wire3 ? reg77 : reg81)} ?
                      $unsigned($signed(wire3)) : ({(8'hbb), reg78} ?
                          (^wire1) : (reg79 >>> wire3))),
                  $unsigned(reg82[(3'h6):(1'h1)])} : $unsigned(reg80));
          reg84 <= $signed($signed((wire3[(2'h2):(2'h2)] << (^~wire3))));
          reg85 <= {($signed(wire1) * $unsigned(reg82[(4'ha):(2'h3)])),
              (~|reg79)};
          if ($unsigned((^~reg80)))
            begin
              reg86 <= (reg82[(5'h10):(2'h3)] >= ((~|((+wire2) >= {reg78,
                  wire1})) * $unsigned((reg80 ?
                  (wire1 ? reg80 : reg85) : (!reg78)))));
              reg87 <= reg83;
              reg88 <= {$unsigned($unsigned({(reg79 | wire2)})),
                  reg87[(4'hb):(2'h3)]};
            end
          else
            begin
              reg86 <= reg79[(4'h8):(2'h3)];
              reg87 <= ((($unsigned((reg79 ~^ reg82)) ?
                          ((wire75 <<< reg85) >= {reg87}) : reg84) ?
                      (((^~reg79) ^ (~^reg83)) + $unsigned((^~wire0))) : $signed($unsigned((reg87 * wire2)))) ?
                  reg86[(2'h2):(2'h2)] : (&((wire1 << (8'hb3)) ?
                      $unsigned(wire4[(3'h6):(3'h4)]) : ($unsigned((7'h40)) > (~^reg77)))));
              reg88 <= wire2[(3'h6):(2'h2)];
              reg89 <= $unsigned(((((~&reg84) <<< (~&(8'hac))) >= wire4) ?
                  $signed((wire2[(4'hd):(4'hc)] << $signed(wire4))) : $unsigned(reg77[(1'h0):(1'h0)])));
            end
          reg90 <= {((8'hba) ?
                  $signed(reg79) : (reg86[(1'h1):(1'h0)] - ($signed(wire75) ?
                      $unsigned(reg88) : $signed(reg80)))),
              ($unsigned((|(wire75 ? (8'ha4) : (8'h9c)))) ?
                  reg79 : ({(wire75 << reg80)} ^~ ((reg89 ?
                      wire3 : (8'ha2)) == $unsigned((8'ha5)))))};
        end
      else
        begin
          reg83 <= (|$unsigned(($unsigned(reg89) ?
              (reg82 ?
                  $signed(wire4) : (reg78 & (8'hb6))) : $signed($signed(wire2)))));
          if (((!$unsigned($signed($signed(reg87)))) ?
              ((reg87[(5'h10):(1'h0)] ?
                      $signed((reg87 >> wire2)) : $signed($signed((8'h9e)))) ?
                  reg82 : $unsigned($unsigned((reg77 && reg82)))) : $signed(reg87)))
            begin
              reg84 <= (wire75[(3'h4):(1'h1)] >>> reg79);
              reg85 <= {(reg81[(1'h1):(1'h0)] ?
                      (reg78 ~^ (reg89[(4'ha):(1'h1)] ?
                          (~&wire4) : $unsigned(wire2))) : reg84),
                  $unsigned((~|$unsigned({reg80})))};
              reg86 <= $unsigned(reg77[(2'h2):(2'h2)]);
              reg87 <= reg89[(4'h8):(3'h4)];
            end
          else
            begin
              reg84 <= ($signed($signed($unsigned((reg86 ? reg86 : reg88)))) ?
                  wire0[(2'h3):(2'h2)] : {$signed(reg84), (+$signed(wire0))});
            end
        end
      reg91 <= (|$signed((8'hb6)));
      reg92 <= ({(wire0 ^~ $signed($unsigned(reg82)))} >= $signed({(!(wire2 == wire2)),
          {(wire75 ^ reg78)}}));
    end
  assign wire93 = (reg83[(2'h3):(1'h1)] & wire0[(1'h1):(1'h1)]);
  assign wire94 = $signed(((($signed(wire4) <= reg79[(1'h1):(1'h1)]) + reg90[(1'h0):(1'h0)]) ?
                      $unsigned($signed((~reg82))) : wire1[(4'hf):(4'hc)]));
  assign wire95 = $signed(((~|reg79) ? reg83[(1'h1):(1'h1)] : reg83));
  assign wire96 = (wire4[(2'h3):(1'h1)] ? reg88[(1'h1):(1'h1)] : wire75);
  assign wire97 = {$unsigned(reg84)};
  assign wire98 = (wire75 >> reg84);
  assign wire99 = $signed((|$unsigned(wire4)));
  assign wire100 = (~|(!(((^reg89) ? (reg88 == reg91) : $unsigned(wire1)) ?
                       ({wire94} ?
                           (reg83 > wire1) : (reg83 <<< reg84)) : wire96)));
  assign wire101 = wire98[(4'hb):(4'hb)];
  always
    @(posedge clk) begin
      reg102 <= ($unsigned((~|({reg80, wire2} ?
          (reg88 ?
              wire101 : (8'hbf)) : $unsigned(wire0)))) << $signed($unsigned(reg86)));
      if ($unsigned(($unsigned(reg80) ? reg87 : reg86)))
        begin
          if (({reg90[(3'h6):(1'h1)],
              reg102[(3'h5):(1'h1)]} ^~ $unsigned($signed($unsigned((wire96 ?
              wire3 : reg82))))))
            begin
              reg103 <= reg86;
              reg104 <= {wire2[(1'h0):(1'h0)],
                  $unsigned((($signed(reg83) + {wire93,
                      reg83}) | (reg89[(2'h3):(1'h1)] ?
                      ((8'hbc) <<< wire1) : (-wire1))))};
              reg105 <= reg83;
              reg106 <= reg104;
            end
          else
            begin
              reg103 <= {$signed($unsigned($unsigned(wire99[(4'hc):(3'h7)])))};
              reg104 <= {(wire97 << {reg105})};
            end
          reg107 <= reg81;
          if ({$unsigned((8'haf))})
            begin
              reg108 <= reg88;
              reg109 <= $unsigned({($unsigned((reg78 ?
                      wire99 : wire99)) && {$unsigned(reg90), wire95})});
              reg110 <= ($unsigned((($signed(reg84) << $unsigned(reg86)) ?
                      $unsigned((!reg82)) : (-(reg105 || (8'hac))))) ?
                  $unsigned(wire75[(3'h4):(1'h0)]) : ($unsigned(((^(8'ha6)) | (-(7'h41)))) * $unsigned($unsigned((reg107 <<< reg108)))));
            end
          else
            begin
              reg108 <= wire100;
              reg109 <= (|wire2[(2'h3):(1'h0)]);
              reg110 <= ($signed(reg87) || $signed($signed(({(8'h9f)} ~^ reg81))));
            end
          reg111 <= (!reg81[(4'h8):(3'h6)]);
        end
      else
        begin
          reg103 <= ($signed({$unsigned($unsigned(reg81)),
              ($unsigned(reg110) ^~ ((8'hb4) ?
                  reg86 : (8'ha6)))}) ^ $signed($signed($unsigned({(8'h9e),
              wire3}))));
          reg104 <= $unsigned(((({reg80, reg104} ?
                  (!reg90) : (reg80 ? reg105 : reg79)) != (-(^(8'hab)))) ?
              (~^$signed({reg106})) : ((reg111 | (reg107 | reg103)) - {(&(8'hbb))})));
          if ($signed($signed($signed(((~reg92) ^~ (!wire95))))))
            begin
              reg105 <= {{wire93[(3'h4):(1'h0)],
                      $unsigned(((wire100 >>> reg87) && wire97))},
                  $unsigned((reg107 + ($signed(reg88) ?
                      (reg88 >> reg82) : (reg85 ^ (7'h40)))))};
            end
          else
            begin
              reg105 <= $signed({$signed($signed((reg107 ? reg81 : reg88)))});
              reg106 <= reg89[(3'h5):(2'h3)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg112 <= $signed(reg103);
      reg113 <= ($unsigned($unsigned(reg108)) || (reg109[(3'h6):(1'h1)] ?
          ($signed({(7'h41)}) ?
              (~^$unsigned(wire3)) : (+(reg108 ^~ wire100))) : wire0));
      reg114 <= $signed(reg107[(1'h1):(1'h0)]);
    end
  assign wire115 = ((($unsigned(((8'hb6) ? reg105 : reg106)) && {$signed(reg77),
                           (reg87 ?
                               reg106 : reg114)}) ^~ wire98[(1'h0):(1'h0)]) ?
                       $signed((+wire2[(4'hd):(4'h9)])) : reg103);
endmodule

module module5
#(parameter param74 = ((+(((8'h9f) | ((8'h9f) ? (8'ha1) : (8'hb7))) < (((8'hb3) ? (8'hb0) : (8'ha2)) || {(7'h40), (8'hbc)}))) ? (((+((8'haf) ? (7'h43) : (8'hae))) ? (((8'hbd) >= (8'hac)) ? {(8'hb3)} : (^(7'h41))) : ((&(8'ha6)) ? (~|(8'had)) : (~^(8'hb5)))) ? (|({(8'hb0), (7'h42)} ? ((8'ha0) ? (7'h41) : (8'hb3)) : {(8'had), (8'ha2)})) : ({(^(7'h44))} ? (^((8'hab) ^~ (8'ha0))) : ((~|(8'ha0)) ? ((7'h42) ~^ (8'hb3)) : (^(8'ha9))))) : (((^((8'haa) >= (7'h44))) ? ((-(8'haa)) ? ((8'hb9) >>> (8'ha4)) : ((8'hb8) ? (8'ha0) : (7'h43))) : {((8'ha8) | (7'h44)), ((8'hab) & (8'ha9))}) ^ ((((8'ha2) ? (8'h9e) : (8'hbc)) ? ((8'hbe) <= (8'hb8)) : ((8'h9c) ? (8'hb2) : (8'hbe))) != ({(8'h9d), (8'hb3)} | ((8'hb8) ? (8'ha5) : (8'ha9)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h1b9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire7;
  input wire signed [(3'h5):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire70,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 (1'h0)};
  assign wire11 = (|(|wire8));
  assign wire12 = {$signed(wire11)};
  assign wire13 = $signed((($signed(wire12) ?
                          ($unsigned(wire11) + {(8'hb3)}) : (|((7'h42) ?
                              wire7 : wire9))) ?
                      (~&$unsigned($signed(wire11))) : ($unsigned(wire11[(3'h6):(1'h1)]) ?
                          (wire11[(3'h6):(1'h0)] ?
                              $unsigned((8'hbd)) : $signed((8'hb9))) : (~|wire9[(3'h7):(1'h0)]))));
  assign wire14 = (8'hac);
  assign wire15 = wire7;
  assign wire16 = $unsigned((8'ha3));
  assign wire17 = $unsigned(wire16);
  assign wire18 = wire14;
  assign wire19 = wire14;
  assign wire20 = $unsigned(((((^~wire13) && (wire11 ?
                          wire15 : wire7)) || $unsigned({wire17})) ?
                      {$unsigned(wire11)} : (wire14 ?
                          ((8'ha3) ?
                              (wire10 > wire10) : ((8'h9d) >> wire10)) : (wire7 ?
                              (8'hb5) : wire14[(4'hb):(4'hb)]))));
  assign wire21 = ({(~&((|wire11) >= $unsigned(wire18))),
                      ($signed(wire7[(1'h1):(1'h0)]) == $unsigned((!(8'haa))))} == {($signed((&wire18)) ?
                          $signed((!wire13)) : wire20[(1'h0):(1'h0)]),
                      ($unsigned($unsigned(wire18)) ?
                          wire18[(4'hc):(4'h8)] : wire10[(3'h4):(1'h1)])});
  always
    @(posedge clk) begin
      reg22 <= $unsigned({((&$unsigned(wire13)) ?
              (wire21[(4'h9):(1'h0)] & {wire19, wire6}) : (wire8 ?
                  (wire17 & wire7) : wire14)),
          (8'hbd)});
      reg23 <= $unsigned({(-({wire10, wire18} ?
              $unsigned(wire20) : $signed((8'ha8)))),
          $unsigned((^~wire14))});
    end
  always
    @(posedge clk) begin
      reg24 <= wire17;
    end
  always
    @(posedge clk) begin
      reg25 <= wire10[(3'h6):(1'h0)];
      if ({(wire6[(3'h4):(2'h3)] | wire10)})
        begin
          reg26 <= (7'h42);
          reg27 <= (wire13[(4'hc):(3'h7)] < (!$signed(reg24[(3'h5):(1'h0)])));
          reg28 <= ((wire14[(3'h6):(1'h1)] ~^ wire13[(1'h1):(1'h1)]) ?
              wire21 : $unsigned((8'h9c)));
        end
      else
        begin
          reg26 <= (|(reg27[(4'hd):(2'h3)] ?
              (&{wire9[(3'h5):(1'h0)]}) : (-(wire17[(1'h0):(1'h0)] ?
                  (wire14 ? reg25 : wire21) : $unsigned((8'hb0))))));
          reg27 <= {wire12};
          if (wire14)
            begin
              reg28 <= (wire11 ?
                  ({$unsigned((+wire11)), wire20[(4'h9):(3'h4)]} ?
                      (-$signed(wire15)) : (((reg27 != reg28) | $unsigned(wire7)) ?
                          $unsigned(reg24[(3'h6):(3'h5)]) : reg26[(1'h0):(1'h0)])) : wire16);
              reg29 <= {$unsigned({$signed({wire20, reg24}),
                      (wire16[(3'h4):(2'h2)] != {wire8})})};
              reg30 <= {$signed($signed($signed($signed((8'h9f))))),
                  wire7[(1'h0):(1'h0)]};
              reg31 <= $unsigned({(+$signed((wire12 * reg30))),
                  (wire21[(4'h9):(3'h7)] < $signed($unsigned(wire21)))});
            end
          else
            begin
              reg28 <= (~&(wire11 ?
                  ($unsigned((^~reg27)) ^~ $signed((+wire10))) : wire13[(4'ha):(3'h7)]));
              reg29 <= wire11[(1'h1):(1'h1)];
              reg30 <= (reg26 ? $unsigned((8'hae)) : $unsigned(wire9));
            end
        end
      reg32 <= (((^~wire13) <<< ($signed(wire12[(3'h7):(3'h6)]) ?
          $unsigned($unsigned(wire15)) : $signed($unsigned(wire10)))) >= $signed((wire7 ?
          (8'hbc) : ((reg31 >= (8'h9e)) > (wire14 ? reg25 : wire21)))));
      reg33 <= wire9;
      if ((-({(&((8'h9d) >> wire19)),
              ((wire18 >>> reg26) ? (wire17 & reg22) : $unsigned(reg30))} ?
          $signed(wire8[(1'h0):(1'h0)]) : $unsigned($signed($unsigned(reg25))))))
        begin
          reg34 <= (~&{((wire18 & wire12) ^ $unsigned((reg27 > (8'ha8))))});
          if (wire7)
            begin
              reg35 <= wire11;
              reg36 <= wire10[(3'h6):(3'h6)];
            end
          else
            begin
              reg35 <= $signed((reg33[(1'h0):(1'h0)] && $unsigned(($unsigned(wire11) ?
                  $unsigned(wire6) : (!wire8)))));
            end
          reg37 <= ($signed(({{(8'ha6)}, (wire10 ? wire15 : (8'hbe))} ?
                  (~^{reg28}) : {$unsigned(wire20), $unsigned(wire18)})) ?
              (~^$signed(((wire12 ? wire10 : wire11) ?
                  (reg25 ?
                      wire16 : reg28) : $unsigned(wire11)))) : $signed(((reg33[(1'h1):(1'h0)] ?
                  (-wire8) : $unsigned(reg34)) ^~ wire19)));
          if ($unsigned($signed(($signed(wire18) ~^ ((!wire13) ?
              $signed(wire9) : $unsigned(reg31))))))
            begin
              reg38 <= {$signed(reg34)};
              reg39 <= (8'hba);
              reg40 <= (~&(~|(($unsigned(reg39) ?
                  reg38 : reg22) == (-$unsigned(wire20)))));
              reg41 <= {reg31[(2'h3):(1'h1)],
                  (wire14[(4'ha):(4'h8)] <<< $unsigned($unsigned((reg37 ~^ wire15))))};
              reg42 <= ($signed({{((8'had) ? wire21 : reg41)}}) ?
                  {(($unsigned(wire12) > (8'ha3)) ?
                          (|(reg22 || reg24)) : ((^~reg35) || $unsigned(wire13)))} : $unsigned($signed($unsigned((reg23 ?
                      (8'h9d) : reg38)))));
            end
          else
            begin
              reg38 <= reg24[(1'h1):(1'h1)];
              reg39 <= $unsigned(($unsigned(reg26[(4'h8):(3'h7)]) ~^ reg30));
              reg40 <= ($signed($unsigned({(8'ha9)})) ?
                  (!$signed(reg37[(1'h1):(1'h1)])) : $signed(reg33[(2'h3):(2'h2)]));
              reg41 <= (|{reg41, (~&wire11)});
            end
        end
      else
        begin
          reg34 <= (~$signed($signed(($unsigned(reg40) >>> $signed((8'hac))))));
          reg35 <= $signed(($signed(((wire13 ?
                  wire9 : (8'hb6)) >>> $signed(reg36))) ?
              ((&$unsigned(reg23)) < (((8'hb9) ^ reg39) & (wire10 << reg32))) : wire9));
          reg36 <= {$unsigned(wire15[(1'h0):(1'h0)]),
              (reg22[(4'hc):(3'h4)] ?
                  ((wire15[(1'h0):(1'h0)] | reg22[(4'h8):(4'h8)]) ~^ (~{wire10})) : reg34)};
          reg37 <= wire11[(1'h0):(1'h0)];
        end
    end
  module43 #() modinst71 (.y(wire70), .wire48(reg30), .wire46(reg41), .wire45(reg26), .wire47(reg31), .clk(clk), .wire44(reg25));
  assign wire72 = wire14;
  assign wire73 = (wire6 ?
                      $unsigned($signed(reg38)) : ($unsigned($signed((reg42 ?
                              wire19 : (8'hac)))) ?
                          reg42 : $signed(reg30[(4'hb):(4'hb)])));
endmodule

module module43  (y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire48;
  input wire signed [(4'ha):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  input wire [(4'hd):(1'h0)] wire45;
  input wire [(5'h14):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire49;
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  assign y = {wire69,
                 wire49,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
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
                 (1'h0)};
  assign wire49 = (+(^wire46[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg50 <= $signed(wire44[(3'h4):(1'h1)]);
      reg51 <= (wire47[(3'h5):(2'h2)] ?
          wire45 : $signed(($signed(wire46) != wire46)));
      if (reg50[(2'h2):(2'h2)])
        begin
          reg52 <= (wire45 || wire48);
          if (wire44[(3'h4):(1'h0)])
            begin
              reg53 <= (wire48 ?
                  ((-wire47[(3'h5):(1'h1)]) ?
                      (!reg52[(2'h2):(1'h0)]) : $signed($signed($signed(wire49)))) : (~|(((|wire47) ?
                      wire44 : wire45) - (~&(+wire46)))));
              reg54 <= (($signed(({reg53, wire47} ?
                      (|(8'ha3)) : wire48)) && $signed((-wire44))) ?
                  $signed(((((8'hb3) | wire46) ^~ {(8'ha3), (8'hb7)}) ?
                      ((reg50 >= wire48) ^ (wire45 | wire45)) : wire48[(4'h8):(3'h7)])) : (reg52 > {(~&{wire46})}));
              reg55 <= ({((~|$unsigned(wire47)) ?
                          ((reg50 <= reg51) >>> (reg54 & reg52)) : (reg54[(2'h3):(1'h1)] ?
                              reg52 : (reg53 == wire47))),
                      ((&(reg54 >>> (7'h42))) - (^~reg52[(1'h0):(1'h0)]))} ?
                  $unsigned((8'hb0)) : (~&$signed((((8'ha2) ?
                      wire44 : (8'ha8)) <= $signed(wire44)))));
              reg56 <= (wire49[(2'h3):(1'h1)] | $signed(((|$signed(wire49)) ?
                  ((wire45 ? reg55 : (8'hb8)) ?
                      wire47[(4'h9):(3'h5)] : (wire46 ?
                          wire46 : reg51)) : wire45)));
              reg57 <= (($unsigned(reg56) ?
                  {({(8'ha2),
                          wire48} | reg54[(3'h5):(1'h0)])} : reg51) ~^ reg51[(1'h1):(1'h0)]);
            end
          else
            begin
              reg53 <= (8'ha3);
              reg54 <= wire49[(1'h0):(1'h0)];
              reg55 <= $signed($unsigned($unsigned((((8'hb8) < wire45) ?
                  reg51[(4'ha):(4'ha)] : (wire44 ? reg51 : reg50)))));
            end
          reg58 <= $signed((&$unsigned((reg57[(4'hb):(2'h2)] & $signed(reg54)))));
          reg59 <= $signed($unsigned($signed($unsigned((+(8'h9f))))));
        end
      else
        begin
          reg52 <= $signed($signed((~|wire44)));
          reg53 <= $unsigned((8'ha6));
          if (((!(wire46 ?
                  $unsigned($unsigned((8'ha4))) : $unsigned($signed(wire47)))) ?
              ($signed((^~$unsigned(reg51))) || reg56[(3'h6):(3'h5)]) : (($signed(wire47) >= $signed($unsigned(reg53))) ?
                  $unsigned((((8'hb3) || reg50) ?
                      ((8'ha4) ?
                          wire46 : wire48) : {reg54})) : $signed($unsigned(wire48)))))
            begin
              reg54 <= {$unsigned(({wire46[(3'h4):(2'h3)], ((8'ha8) * wire45)} ?
                      $unsigned((wire49 ? wire47 : reg57)) : (8'hbe))),
                  ((^($signed(wire45) & (~&reg59))) ?
                      reg59 : $unsigned(((~^reg59) >>> reg56)))};
              reg55 <= (~&(8'had));
            end
          else
            begin
              reg54 <= (^~$signed((&$unsigned((8'ha9)))));
            end
          reg56 <= $signed($signed({reg52[(3'h6):(2'h2)],
              $signed((reg54 ^ reg54))}));
          reg57 <= reg52;
        end
      if (((~&$signed(wire45[(4'hb):(4'ha)])) <= reg55[(2'h2):(2'h2)]))
        begin
          reg60 <= wire45;
          reg61 <= $signed(reg53);
        end
      else
        begin
          if (reg55[(1'h1):(1'h0)])
            begin
              reg60 <= $signed(reg53[(4'he):(4'h9)]);
            end
          else
            begin
              reg60 <= reg58;
              reg61 <= $signed($unsigned((wire46[(1'h0):(1'h0)] ?
                  $signed(reg61) : wire44[(5'h12):(1'h0)])));
              reg62 <= wire49;
              reg63 <= $unsigned(reg56[(1'h0):(1'h0)]);
            end
          reg64 <= $signed(reg57[(3'h4):(2'h3)]);
          reg65 <= reg51[(4'hb):(3'h7)];
        end
      reg66 <= $signed($unsigned((+wire48[(3'h7):(3'h4)])));
    end
  always
    @(posedge clk) begin
      reg67 <= (((!(wire49 ~^ (reg64 ?
          wire47 : wire46))) == reg58[(2'h2):(1'h0)]) ~^ reg51[(2'h3):(2'h3)]);
      reg68 <= (wire47[(1'h1):(1'h0)] & $unsigned((((reg65 ?
          reg52 : reg56) < wire49) != ((reg66 + reg56) ~^ wire48[(3'h7):(3'h5)]))));
    end
  assign wire69 = $signed({(8'h9e), $signed(wire48[(3'h5):(3'h4)])});
endmodule
