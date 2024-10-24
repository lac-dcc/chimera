module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  assign y = {wire114,
                 wire95,
                 wire93,
                 wire91,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg94,
                 (1'h0)};
  assign wire4 = ($signed({(!$unsigned(wire0)), wire1[(1'h1):(1'h1)]}) ?
                     (($unsigned(wire3) && $signed((8'hb4))) ?
                         {(~|wire0[(3'h5):(3'h5)])} : ($signed((8'hbe)) ?
                             wire1 : (((8'h9c) ^~ (7'h44)) ?
                                 ((8'hbc) != (8'hb1)) : ((8'hba) ?
                                     wire0 : wire2)))) : wire0[(3'h6):(2'h3)]);
  assign wire5 = $unsigned($unsigned($unsigned(wire3[(2'h3):(2'h2)])));
  assign wire6 = (~&wire2[(4'hf):(4'ha)]);
  assign wire7 = (+((wire4 ?
                     (wire1 ?
                         (wire4 << (7'h44)) : {(8'h9c),
                             wire5}) : wire3[(2'h3):(1'h1)]) < $unsigned((wire3 | wire1))));
  assign wire8 = {((~({wire5, wire0} >> (~^wire2))) >> $unsigned((wire1 ?
                         $signed((8'hae)) : (wire7 ? (8'hbe) : wire2))))};
  assign wire9 = wire0;
  assign wire10 = $unsigned(({(&(wire8 && wire0)), (^wire2)} ?
                      $signed(($signed((7'h42)) ^ wire7)) : (((|wire8) >>> (wire1 != wire5)) << (~^{wire2,
                          wire4}))));
  assign wire11 = wire0[(1'h0):(1'h0)];
  assign wire12 = {$unsigned(wire7)};
  assign wire13 = $unsigned((^wire0));
  assign wire14 = ((^$unsigned(($unsigned(wire6) ^ (wire4 ? wire3 : wire11)))) ?
                      {{wire0, wire9[(1'h1):(1'h0)]}} : wire2);
  assign wire15 = (($unsigned($unsigned($unsigned((8'hb0)))) ?
                      (((wire9 ? wire2 : wire5) ?
                              {(7'h42), wire8} : $signed(wire0)) ?
                          (wire14[(3'h5):(2'h2)] ^ (wire7 & wire3)) : ((&wire7) ?
                              wire6 : wire5[(2'h3):(2'h3)])) : {$unsigned(wire2[(3'h7):(3'h6)])}) ~^ {wire10});
  assign wire16 = $unsigned(wire7[(2'h2):(2'h2)]);
  module17 #() modinst92 (wire91, clk, wire11, wire12, wire10, wire8);
  assign wire93 = ((wire8[(2'h3):(1'h0)] ? wire11 : $unsigned(wire15)) ?
                      (8'hae) : wire6);
  always
    @(posedge clk) begin
      reg94 <= wire0[(2'h3):(2'h3)];
    end
  assign wire95 = $unsigned((~&($unsigned(((8'ha6) <= wire14)) <<< $signed((wire0 ?
                      wire2 : wire0)))));
  always
    @(posedge clk) begin
      reg96 <= $signed(((($unsigned(wire4) | $unsigned(wire93)) ?
              $signed((wire1 ? wire9 : wire6)) : $unsigned({(8'ha6), wire3})) ?
          wire7 : wire95));
      reg97 <= wire16;
    end
  always
    @(posedge clk) begin
      reg98 <= {wire10};
      reg99 <= $unsigned(((^~(reg97 >>> wire95)) && ((8'ha1) ?
          (^~$signed(wire12)) : $unsigned({(8'ha2), (8'hbb)}))));
      if (($signed(reg96[(2'h2):(1'h0)]) ?
          $signed((&(wire6 << reg94))) : $signed((~(+(~wire6))))))
        begin
          reg100 <= $unsigned({$signed(wire3),
              (~&(wire91 > $signed((8'h9e))))});
          reg101 <= $signed((~wire9));
          if (((~^$unsigned(wire13)) ~^ reg97))
            begin
              reg102 <= ($unsigned({reg99, {(~|wire12)}}) ?
                  (^((wire93[(2'h3):(1'h0)] ?
                      (reg99 ?
                          (8'hbb) : wire91) : wire91[(3'h6):(3'h5)]) <<< {$unsigned(wire8),
                      (reg99 < wire9)})) : (wire15[(1'h1):(1'h0)] ?
                      {wire15[(1'h0):(1'h0)]} : {({wire93} ?
                              ((8'ha3) ?
                                  wire0 : wire14) : reg97[(2'h3):(1'h1)])}));
              reg103 <= $unsigned((+$unsigned({(wire8 & wire0)})));
              reg104 <= $signed((-wire93[(1'h1):(1'h1)]));
              reg105 <= (wire91[(3'h7):(2'h3)] ?
                  wire13 : $unsigned(($signed($signed(wire9)) ?
                      $signed(((7'h40) ? wire2 : reg94)) : ((wire14 ?
                          wire7 : reg99) & $signed((8'had))))));
              reg106 <= ((wire15[(4'h9):(2'h2)] ?
                      wire93 : (wire0 * (|(reg102 || wire11)))) ?
                  reg94 : $unsigned({(^reg96), $signed((&wire16))}));
            end
          else
            begin
              reg102 <= ((&(~(wire95[(3'h5):(1'h0)] != (+wire4)))) ?
                  reg96 : $unsigned(((wire91[(4'h8):(2'h2)] <= (wire12 <<< wire12)) + (~wire15[(4'hb):(3'h6)]))));
              reg103 <= reg105[(1'h1):(1'h1)];
            end
          reg107 <= ($unsigned((+$unsigned(reg106))) + wire0);
          if (($unsigned((reg94[(2'h3):(2'h2)] ?
                  ({wire7} ?
                      $signed(wire9) : $unsigned(reg107)) : (reg94[(1'h0):(1'h0)] >>> (reg104 ?
                      (8'ha4) : (8'had))))) ?
              reg98 : ($signed((|(reg99 ? (8'hbd) : reg107))) != (~|{(8'hb4),
                  (!reg107)}))))
            begin
              reg108 <= {wire2[(4'ha):(3'h4)]};
              reg109 <= (reg96 << wire14[(5'h11):(4'h8)]);
              reg110 <= reg104;
              reg111 <= reg106;
            end
          else
            begin
              reg108 <= (wire10 ? wire7 : $unsigned(reg110[(4'h9):(3'h6)]));
            end
        end
      else
        begin
          if (((wire3[(2'h3):(2'h2)] ?
                  wire93[(3'h6):(3'h6)] : $signed((+$signed(wire5)))) ?
              (wire11[(4'h8):(3'h4)] ?
                  $unsigned((+((8'hbb) & wire5))) : reg108) : ($unsigned((((8'ha4) ?
                          reg98 : reg98) ?
                      (wire14 ? (8'hbc) : wire91) : $unsigned(wire9))) ?
                  (&$signed((^(8'hbc)))) : (^$unsigned(reg99)))))
            begin
              reg100 <= wire9;
            end
          else
            begin
              reg100 <= $signed((^$unsigned(((wire95 * wire4) <= {(8'ha8),
                  wire5}))));
              reg101 <= $unsigned({(wire0[(3'h5):(3'h4)] ?
                      (((8'ha1) ? wire91 : wire15) ?
                          (~&reg96) : reg109) : wire11),
                  {$signed($signed(reg102)),
                      (reg108[(3'h5):(1'h1)] ?
                          $signed(wire9) : $signed(wire5))}});
            end
          reg102 <= reg109;
        end
      reg112 <= wire13;
      if (wire95)
        begin
          reg113 <= {wire93[(3'h5):(3'h5)], $signed($unsigned(reg98))};
        end
      else
        begin
          reg113 <= (|(reg99 ? wire14[(4'h9):(1'h0)] : reg100[(4'hd):(4'h8)]));
        end
    end
  assign wire114 = $unsigned($unsigned(reg94));
endmodule

module module17
#(parameter param89 = (~&((~({(8'hb9), (8'h9c)} ? ((8'hbb) ? (8'hb5) : (8'hb1)) : (|(8'hb4)))) ? ((((8'ha8) < (8'ha6)) ? (^~(7'h42)) : ((8'ha6) ^~ (8'haf))) <<< (&((7'h42) < (7'h44)))) : (({(8'ha1), (8'ha3)} * ((8'ha6) ? (8'hb7) : (8'h9c))) >> (~^((8'hb0) >= (8'hbc)))))), 
parameter param90 = param89)
(y, clk, wire18, wire19, wire20, wire21);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire42;
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire76,
                 wire45,
                 wire44,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire28,
                 wire42,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg27,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 (1'h0)};
  assign wire22 = $unsigned(wire20[(1'h0):(1'h0)]);
  assign wire23 = (~|{wire21[(3'h5):(2'h3)],
                      ((wire22 ? (~&(8'hb3)) : (~^wire21)) ?
                          wire18 : {wire21[(4'h8):(2'h2)]})});
  assign wire24 = wire18;
  assign wire25 = wire19[(4'hf):(4'hb)];
  assign wire26 = ($unsigned({{{(8'ha4), wire20}}}) >= wire20[(5'h11):(5'h11)]);
  always
    @(posedge clk) begin
      reg27 <= $unsigned(wire24);
    end
  assign wire28 = $unsigned((&wire18));
  module29 #() modinst43 (wire42, clk, wire20, reg27, wire23, wire25);
  assign wire44 = (($unsigned((8'ha1)) <<< (&(^wire22))) ?
                      $unsigned(wire23) : (($signed(reg27[(4'h9):(3'h6)]) != {(wire26 + wire42)}) <<< wire19[(5'h12):(1'h1)]));
  assign wire45 = ((|wire24) ?
                      (~&$unsigned(($signed(wire18) << reg27))) : $unsigned($signed(wire42)));
  always
    @(posedge clk) begin
      reg46 <= (|($unsigned($signed($signed(wire26))) ? (8'ha4) : wire22));
      reg47 <= ($signed($unsigned(wire45[(2'h2):(1'h0)])) << $signed({{(wire44 >= wire42)}}));
      reg48 <= ($signed(wire28[(2'h3):(2'h3)]) ? wire25 : wire20);
      if (wire19[(1'h1):(1'h0)])
        begin
          reg49 <= (~^($unsigned(wire22[(1'h0):(1'h0)]) || (((wire18 ?
                  wire26 : wire23) ?
              wire24 : ((8'hbc) < wire28)) * $signed($unsigned(wire24)))));
          reg50 <= (($unsigned(((wire18 ~^ wire18) ?
                  reg47[(2'h3):(1'h0)] : (~|wire22))) || (^~({wire23} ?
                  (7'h40) : (wire18 >>> wire26)))) ?
              {{wire19[(4'he):(4'h8)]}} : reg49[(3'h7):(1'h1)]);
          reg51 <= (wire42[(3'h4):(2'h3)] >> (-(~|(reg50[(1'h1):(1'h1)] <= $unsigned(reg27)))));
          reg52 <= (($unsigned((~&(&(7'h42)))) ^~ $unsigned(((^~wire23) ?
              $unsigned(wire23) : ((8'hb5) ^~ reg27)))) ^~ wire28[(2'h3):(1'h1)]);
          reg53 <= (($signed((reg52 ?
                  (!(8'hb4)) : (wire18 ? (8'hb3) : wire25))) && reg49) ?
              (wire26[(2'h2):(2'h2)] || (~((wire19 & wire19) ?
                  wire23 : wire20[(3'h7):(1'h1)]))) : $unsigned(({(8'hb5),
                  {wire45, wire26}} | (~|(wire44 + (7'h43))))));
        end
      else
        begin
          if ($signed({$unsigned({reg48[(4'ha):(3'h4)]})}))
            begin
              reg49 <= {(&{reg46[(4'hf):(4'ha)], wire24[(3'h7):(3'h4)]}),
                  wire23[(4'hc):(3'h7)]};
            end
          else
            begin
              reg49 <= $signed(wire42[(4'h9):(1'h0)]);
              reg50 <= $signed({(~$unsigned($unsigned(wire22)))});
              reg51 <= wire22;
              reg52 <= (!(wire45 & $unsigned($signed($unsigned(reg49)))));
            end
          reg53 <= ((~^(((reg47 && wire21) || $signed((8'haa))) | $signed({reg27}))) ?
              ((wire21[(1'h1):(1'h0)] != (wire18[(5'h11):(4'hd)] >>> (8'hb5))) >>> ({$unsigned(reg48),
                  wire26} && (~&$unsigned(wire18)))) : wire45);
        end
    end
  always
    @(posedge clk) begin
      reg54 <= $signed((wire22[(4'hd):(2'h2)] == (wire44 ?
          ((reg50 || wire19) >= reg51) : $unsigned((reg51 << wire21)))));
      reg55 <= reg46;
    end
  module56 #() modinst77 (wire76, clk, reg27, wire19, wire28, reg47, reg49);
  always
    @(posedge clk) begin
      reg78 <= wire19[(4'ha):(1'h1)];
      reg79 <= $unsigned($unsigned(reg54));
      reg80 <= reg53[(1'h1):(1'h1)];
      reg81 <= (~^reg47);
      reg82 <= $unsigned((8'hb7));
    end
  assign wire83 = (~|reg51[(2'h3):(1'h1)]);
  assign wire84 = {((^~(|(reg79 ? wire76 : wire28))) ?
                          wire22 : wire83[(4'hb):(1'h1)]),
                      reg49[(4'h9):(4'h9)]};
  assign wire85 = wire84[(4'h8):(1'h0)];
  assign wire86 = $signed(reg78[(2'h2):(1'h0)]);
  assign wire87 = ($unsigned($unsigned(wire76[(3'h4):(1'h0)])) >> (~|((^(wire42 ?
                          reg46 : wire25)) ?
                      $signed((reg49 ~^ wire84)) : wire45[(3'h6):(1'h0)])));
  assign wire88 = ($signed(reg47[(4'hc):(3'h4)]) + (wire22[(3'h5):(1'h1)] ?
                      (reg47[(4'hb):(4'h9)] ~^ reg50) : reg53));
endmodule

module module56
#(parameter param75 = ((({(-(8'h9e))} && (~|{(8'ha7)})) <= {(((8'hb1) >>> (8'hb4)) ? (^~(8'ha4)) : ((8'ha5) ? (8'hb8) : (7'h40))), ({(8'h9c)} ? ((8'hab) == (8'ha2)) : (8'hbc))}) ? (((!(~^(8'hb1))) && ((8'ha8) ? ((8'ha9) != (8'h9f)) : {(8'h9f), (7'h41)})) ? (((|(8'h9e)) > ((8'hbe) ? (8'had) : (7'h44))) ? ((^~(8'hb2)) && ((8'ha1) ? (8'ha9) : (8'hbb))) : ((^~(8'ha4)) ? {(8'haf)} : ((8'hbb) ^ (7'h44)))) : ((+((7'h44) ? (7'h44) : (8'haa))) ? ({(8'hb6)} ? (+(8'ha6)) : ((8'hab) ? (7'h42) : (8'hba))) : (((8'ha5) ? (8'hb3) : (8'hb3)) && ((8'hae) ? (7'h43) : (8'ha6))))) : (+(8'hb9))))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire61;
  input wire signed [(2'h3):(1'h0)] wire60;
  input wire [(4'h8):(1'h0)] wire59;
  input wire signed [(4'he):(1'h0)] wire58;
  input wire [(4'h9):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire63,
                 wire62,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire62 = ((8'h9c) || (|($unsigned(((8'haa) + wire60)) ?
                      ((wire60 ? wire60 : wire58) ?
                          (wire60 >>> wire61) : (!wire57)) : (wire59 <<< $unsigned(wire60)))));
  assign wire63 = (wire59[(3'h4):(3'h4)] ?
                      $signed(((((8'hab) ? wire59 : wire61) ?
                          $signed(wire62) : $unsigned(wire60)) >> ($unsigned((8'ha0)) & $unsigned(wire59)))) : (~|wire60));
  always
    @(posedge clk) begin
      if (wire59[(3'h5):(2'h3)])
        begin
          reg64 <= {$unsigned((8'h9d)),
              (|((wire57 + (wire60 ? (8'ha0) : wire63)) ?
                  (|((8'hba) ? wire60 : wire57)) : ($unsigned(wire61) ?
                      $unsigned(wire60) : {wire62})))};
          reg65 <= wire63;
          reg66 <= $unsigned($unsigned(wire63[(3'h4):(1'h0)]));
          reg67 <= wire63[(4'h9):(1'h1)];
          reg68 <= {wire57[(4'h8):(3'h5)],
              (~&$unsigned((wire60 <= ((8'hbe) >> (8'hbb)))))};
        end
      else
        begin
          reg64 <= (~^(^$unsigned((wire60[(2'h2):(1'h1)] ?
              (reg64 ? wire60 : reg68) : ((8'hb0) ? wire58 : reg67)))));
          reg65 <= reg65[(1'h0):(1'h0)];
          if (reg65)
            begin
              reg66 <= (wire62[(3'h6):(2'h2)] ?
                  (wire60[(2'h3):(1'h0)] && (~&(8'haa))) : wire63);
              reg67 <= $unsigned($signed($signed(reg66[(4'h9):(3'h4)])));
            end
          else
            begin
              reg66 <= (~|reg64);
            end
        end
      reg69 <= (wire61 || reg64[(3'h6):(2'h3)]);
    end
  assign wire70 = ((wire58[(1'h0):(1'h0)] ?
                      wire62[(2'h2):(1'h1)] : wire58) > (+{($unsigned(wire62) ?
                          $unsigned(wire60) : wire58),
                      wire62[(4'he):(4'hc)]}));
  assign wire71 = reg67[(4'ha):(3'h7)];
  assign wire72 = ({(~$unsigned($signed(reg66))),
                          ((reg68 ? (8'hab) : wire61) | $signed((8'hb7)))} ?
                      {$unsigned({$signed(wire62),
                              (reg69 >= reg64)})} : wire70[(5'h12):(2'h2)]);
  assign wire73 = ($unsigned(wire57) ?
                      $unsigned(({wire57[(2'h2):(1'h1)], {wire63, (8'ha9)}} ?
                          $signed($unsigned(wire58)) : (~&wire72))) : (((!reg69[(3'h4):(2'h2)]) == ((|reg66) ?
                          wire57[(4'h9):(4'h9)] : wire58)) <<< (~(reg65[(2'h3):(2'h2)] < (reg66 ?
                          reg67 : reg66)))));
  assign wire74 = reg64[(3'h4):(2'h3)];
endmodule

module module29
#(parameter param41 = ((~^{({(8'ha1), (8'hb9)} << {(7'h41)})}) ^ ({({(8'haf)} ? (8'had) : {(8'had), (8'hbb)})} & ((&(&(8'hb0))) ? ({(8'hae), (8'h9f)} ? (+(8'hb7)) : (~(8'had))) : ((|(8'hbd)) ? ((8'hb7) * (7'h43)) : ((8'hb2) ? (8'hbe) : (8'hbf)))))))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire33;
  input wire signed [(3'h6):(1'h0)] wire32;
  input wire signed [(4'h9):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire34;
  assign y = {wire40, wire39, wire38, wire37, wire36, wire35, wire34, (1'h0)};
  assign wire34 = wire32;
  assign wire35 = ($unsigned($unsigned({wire33[(3'h7):(3'h4)]})) <= (($signed((wire33 + (8'hb8))) ?
                          $unsigned(wire34[(2'h2):(1'h1)]) : (8'ha0)) ?
                      $signed(wire34) : wire33));
  assign wire36 = $signed(($signed($signed((~^wire35))) ?
                      ((8'h9e) <<< $unsigned((wire30 && wire32))) : wire31[(3'h5):(1'h0)]));
  assign wire37 = (^~(&({(wire34 ? wire35 : wire31),
                      ((8'hb1) < wire33)} ^ (~&(wire35 > wire32)))));
  assign wire38 = $signed(wire37);
  assign wire39 = {($unsigned((!$unsigned(wire34))) ?
                          wire36[(4'h9):(1'h0)] : ($unsigned(wire37[(5'h10):(4'he)]) ?
                              ((~^wire30) ^~ (wire38 || wire32)) : ($unsigned((8'hb6)) ?
                                  $signed((8'ha1)) : (wire30 ^~ wire30)))),
                      ($signed((wire32[(1'h0):(1'h0)] ^ $unsigned(wire34))) * $signed(({wire30,
                              wire30} ?
                          wire35[(3'h5):(2'h3)] : $signed(wire34))))};
  assign wire40 = wire37[(4'hc):(4'h8)];
endmodule
