module top
#(parameter param259 = (((~|((-(8'hb9)) ? ((8'hb4) != (8'ha6)) : ((7'h44) ? (8'hb0) : (8'h9f)))) ? (+(((8'ha8) <<< (8'hb8)) ? (&(8'ha7)) : ((8'haa) ~^ (8'hb4)))) : ({{(8'hae), (7'h40)}} ^ {(~&(8'h9f)), {(8'hb4), (8'ha3)}})) << ((((~&(8'ha7)) == {(7'h42)}) ^ (((8'hab) ? (8'hbd) : (8'hb5)) ^~ ((8'h9d) ^ (8'h9f)))) ? {(((8'haf) ? (8'hb4) : (8'had)) ? ((8'ha5) ? (8'hb7) : (8'hbb)) : ((8'h9f) ~^ (8'hbe)))} : {(((8'hbd) ? (8'hae) : (7'h43)) ? ((8'hbd) ? (8'hbd) : (8'had)) : (-(8'hac))), (8'hb6)})), 
parameter param260 = (~|param259))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire [(4'ha):(1'h0)] wire258;
  wire [(2'h3):(1'h0)] wire255;
  wire signed [(5'h14):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire82;
  reg [(4'hc):(1'h0)] reg257 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  assign y = {wire258,
                 wire255,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire46,
                 wire48,
                 wire49,
                 wire50,
                 wire82,
                 reg257,
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
                 (1'h0)};
  module4 #() modinst47 (.wire6(wire2), .wire9(wire1), .y(wire46), .wire7(wire3), .clk(clk), .wire5((8'ha2)), .wire8(wire0));
  assign wire48 = $unsigned($unsigned((wire1[(1'h1):(1'h0)] ?
                      $unsigned($unsigned(wire3)) : (~$unsigned(wire0)))));
  assign wire49 = $signed((((8'hb0) ?
                          $signed((wire48 ? wire48 : wire2)) : (^(8'ha2))) ?
                      $unsigned(wire1) : $signed($unsigned((wire46 ?
                          wire46 : wire1)))));
  assign wire50 = ($signed(wire2[(1'h1):(1'h0)]) ?
                      ((wire48 ?
                          wire0 : wire46) & (!$signed($signed(wire1)))) : wire48[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg51 <= $unsigned({wire2, (7'h43)});
      reg52 <= (~^($unsigned(($signed(wire46) ?
          $unsigned(wire48) : (wire3 ?
              wire0 : wire1))) <= $unsigned(wire49[(3'h4):(3'h4)])));
      reg53 <= $signed($unsigned($signed((^wire2[(3'h7):(2'h2)]))));
      if ($unsigned((~^$unsigned({wire1}))))
        begin
          reg54 <= ((wire3 ?
                  ($signed(wire48[(1'h1):(1'h0)]) ?
                      $unsigned($unsigned((8'ha8))) : ({wire50,
                          wire48} > (^~wire2))) : $signed(($unsigned((8'hb6)) ?
                      $signed(wire3) : wire49))) ?
              (-(!{$unsigned(reg52),
                  reg53[(1'h1):(1'h1)]})) : {$unsigned(wire50)});
          if ($signed(((+$signed((~&(8'ha7)))) == (^~wire2[(1'h0):(1'h0)]))))
            begin
              reg55 <= reg52;
              reg56 <= $unsigned(reg52);
            end
          else
            begin
              reg55 <= (($signed($unsigned($signed((8'ha7)))) ?
                  (wire0[(4'h9):(4'h9)] ?
                      {wire0, (~reg56)} : ((!wire2) ?
                          $unsigned(wire50) : (wire48 + wire3))) : $signed(((|reg54) & reg55[(3'h6):(2'h3)]))) >>> wire2[(3'h4):(1'h1)]);
            end
          reg57 <= (~&(reg55[(3'h6):(3'h6)] ?
              wire3 : (+$signed(wire2[(3'h5):(2'h2)]))));
          reg58 <= (^{(reg55 ?
                  $unsigned(wire48) : (wire2 ?
                      reg57[(3'h5):(2'h2)] : $signed(wire48)))});
        end
      else
        begin
          reg54 <= reg54[(4'hf):(4'h8)];
          if ((-(($unsigned(((8'hbb) - wire49)) ?
              (-reg56[(3'h6):(2'h2)]) : wire50) >= $signed(((^(8'ha4)) ?
              (reg57 - (8'h9e)) : wire49[(2'h3):(2'h3)])))))
            begin
              reg55 <= reg54;
              reg56 <= (($unsigned($unsigned($signed(wire2))) == $unsigned((|(!wire0)))) + $unsigned($signed({wire3,
                  reg54[(4'he):(4'hc)]})));
            end
          else
            begin
              reg55 <= $signed((+(wire46 ? $unsigned({reg52}) : reg58)));
              reg56 <= $unsigned((8'hb3));
              reg57 <= wire3;
            end
          if ($unsigned(($signed((+(+wire1))) ?
              wire1[(4'ha):(2'h2)] : $unsigned(wire48[(1'h1):(1'h0)]))))
            begin
              reg58 <= (8'had);
              reg59 <= $unsigned($unsigned((wire46 ?
                  wire50 : (reg57[(1'h1):(1'h0)] ?
                      wire2[(4'ha):(3'h6)] : $signed(wire49)))));
              reg60 <= (wire1[(2'h2):(2'h2)] ?
                  ((wire46 ?
                      reg57[(2'h3):(2'h2)] : ((wire50 && reg51) ?
                          (~reg57) : (~|(8'ha1)))) + $signed($signed((reg52 ?
                      wire1 : reg55)))) : reg55[(4'h8):(3'h5)]);
              reg61 <= ((+$signed(reg53)) ?
                  (|wire49[(3'h4):(1'h1)]) : (|$unsigned((~|(wire2 ?
                      wire50 : reg53)))));
            end
          else
            begin
              reg58 <= {({$unsigned($signed(reg56)), {$signed(wire50)}} ?
                      $unsigned(($unsigned((8'hbe)) ?
                          $signed(reg54) : reg58)) : (wire46 >>> (wire1 ^~ wire48[(1'h0):(1'h0)])))};
              reg59 <= reg53[(4'hd):(4'h9)];
              reg60 <= ($unsigned($unsigned($signed(reg53[(4'he):(4'he)]))) ?
                  $unsigned((~$unsigned({wire0,
                      reg56}))) : ((($unsigned(wire49) ?
                          (reg53 >>> (8'hbd)) : $signed(reg55)) != wire50) ?
                      reg60 : (^$unsigned({wire49}))));
            end
          reg62 <= ((wire50[(5'h10):(4'hb)] ?
              (~^((wire46 ?
                  wire1 : wire2) * $signed(wire46))) : $signed($signed(((8'h9f) ?
                  reg54 : wire1)))) >> wire49);
          reg63 <= $signed((reg59 ^ (reg54[(4'hd):(4'hc)] > (~{wire1,
              reg51}))));
        end
      reg64 <= ((8'ha6) ^ ($unsigned((reg60[(3'h6):(1'h0)] <<< (8'hbe))) >> ((wire2[(4'h8):(3'h4)] ^ $unsigned(reg55)) * reg61[(2'h2):(2'h2)])));
    end
  module65 #() modinst83 (wire82, clk, reg61, reg52, reg55, wire48);
  assign wire84 = $unsigned(wire50);
  assign wire85 = {$signed($signed($signed(reg62[(4'h9):(3'h6)]))),
                      {(wire2 ^ (+{wire1, wire0})), $unsigned($signed(reg52))}};
  assign wire86 = wire48;
  assign wire87 = $signed(({((reg51 ? wire3 : reg63) == (wire82 ?
                              (8'ha6) : reg60))} ?
                      wire86[(4'ha):(2'h3)] : wire2[(4'ha):(3'h5)]));
  assign wire88 = ((((~|$unsigned(reg62)) < wire49[(3'h6):(2'h3)]) ?
                      reg64[(2'h3):(2'h2)] : ($unsigned($unsigned(reg61)) ?
                          ((!wire2) & wire48[(5'h13):(1'h0)]) : ($signed((7'h40)) ?
                              (8'haa) : (reg52 < wire2)))) > ($unsigned($signed(reg52[(3'h7):(2'h3)])) & wire0));
  assign wire89 = $unsigned(($signed(wire86) >> (8'hb6)));
  assign wire90 = (^~(reg64 ~^ ((~reg55) ?
                      $signed(reg60[(2'h2):(1'h0)]) : ({wire82,
                          reg64} + {wire2}))));
  module91 #() modinst256 (wire255, clk, reg56, wire89, wire85, reg53, reg54);
  always
    @(posedge clk) begin
      reg257 <= $signed(wire87[(4'he):(4'hc)]);
    end
  assign wire258 = $signed(reg61);
endmodule

module module91  (y, clk, wire92, wire93, wire94, wire95, wire96);
  output wire [(32'h1d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire92;
  input wire signed [(4'ha):(1'h0)] wire93;
  input wire [(5'h12):(1'h0)] wire94;
  input wire signed [(5'h15):(1'h0)] wire95;
  input wire signed [(5'h13):(1'h0)] wire96;
  wire [(4'hd):(1'h0)] wire254;
  wire [(4'hc):(1'h0)] wire251;
  wire signed [(4'h8):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire101;
  wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire169;
  wire [(4'he):(1'h0)] wire171;
  wire signed [(5'h12):(1'h0)] wire207;
  wire [(5'h12):(1'h0)] wire222;
  wire [(3'h5):(1'h0)] wire249;
  reg [(5'h12):(1'h0)] reg253 = (1'h0);
  reg [(3'h7):(1'h0)] reg252 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg225 = (1'h0);
  reg [(4'hc):(1'h0)] reg224 = (1'h0);
  reg [(4'ha):(1'h0)] reg223 = (1'h0);
  reg [(5'h13):(1'h0)] reg221 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg220 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg219 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg217 = (1'h0);
  reg [(5'h12):(1'h0)] reg216 = (1'h0);
  reg [(5'h15):(1'h0)] reg215 = (1'h0);
  reg [(2'h3):(1'h0)] reg214 = (1'h0);
  reg [(2'h3):(1'h0)] reg213 = (1'h0);
  reg [(4'he):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg211 = (1'h0);
  reg [(5'h12):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg209 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  assign y = {wire254,
                 wire251,
                 wire97,
                 wire98,
                 wire99,
                 wire100,
                 wire101,
                 wire102,
                 wire131,
                 wire137,
                 wire138,
                 wire169,
                 wire171,
                 wire207,
                 wire222,
                 wire249,
                 reg253,
                 reg252,
                 reg225,
                 reg224,
                 reg223,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire97 = wire94[(4'hd):(4'ha)];
  assign wire98 = wire97;
  assign wire99 = $signed(wire95);
  assign wire100 = wire98[(3'h5):(2'h3)];
  assign wire101 = (|$signed(wire100[(4'hb):(1'h0)]));
  assign wire102 = {$signed($signed(wire94)), wire93};
  module103 #() modinst132 (.wire105(wire95), .y(wire131), .wire106(wire97), .clk(clk), .wire107(wire94), .wire104(wire99));
  always
    @(posedge clk) begin
      reg133 <= $unsigned((!((^~(-wire101)) ~^ (7'h44))));
      reg134 <= {((((wire97 ? wire95 : wire98) ? {reg133} : wire101) ?
              wire93[(1'h0):(1'h0)] : $unsigned((^~wire93))) >> wire93[(4'h9):(4'h8)])};
      reg135 <= ($signed(wire100) ?
          $signed((~&(((8'hbc) ?
              wire101 : wire102) & wire96[(2'h3):(1'h1)]))) : {(wire97 >>> $signed((wire97 || wire102))),
              $unsigned((wire101 ? $unsigned(reg133) : (reg133 == wire99)))});
      reg136 <= ({(^((reg133 ? wire99 : wire102) ?
              wire92 : (-reg135)))} + wire98[(3'h6):(3'h4)]);
    end
  assign wire137 = ($unsigned($unsigned($unsigned($unsigned(wire101)))) ^ {((~|wire97[(3'h7):(3'h5)]) ?
                           (|$signed(wire101)) : (8'haf)),
                       (!(wire93[(3'h5):(1'h0)] - wire99[(4'he):(2'h2)]))});
  assign wire138 = (~$signed(((~|$signed(wire96)) - ((!(8'ha5)) == reg136[(1'h1):(1'h1)]))));
  module139 #() modinst170 (.wire140(wire137), .clk(clk), .y(wire169), .wire143(reg135), .wire142(wire94), .wire141(reg134));
  assign wire171 = $unsigned($unsigned(((~|(wire92 ?
                       wire99 : reg135)) >>> (-wire99))));
  module172 #() modinst208 (.wire173(wire98), .wire175(wire93), .y(wire207), .wire174(wire100), .wire176(wire102), .clk(clk));
  always
    @(posedge clk) begin
      reg209 <= wire95;
      reg210 <= $unsigned(wire99);
      reg211 <= ({{wire100[(4'hc):(1'h1)]}} ^ reg133);
      reg212 <= (&$unsigned(({{(8'hb9)}, (wire92 ? reg134 : wire171)} ?
          (8'hac) : (|{reg133}))));
      reg213 <= (|(~^((!(~|reg209)) == (wire137 ?
          (+wire93) : $unsigned(wire92)))));
    end
  always
    @(posedge clk) begin
      if ($signed(((~^wire101) ?
          wire99 : ((-$unsigned(wire96)) == $signed(wire169)))))
        begin
          if ($unsigned({((~&(reg209 ? wire93 : reg213)) ?
                  (wire171[(2'h2):(2'h2)] ?
                      (-wire171) : (reg134 ?
                          wire96 : wire96)) : ($unsigned(wire169) ^ ((8'hb3) + wire99))),
              {{(+wire137)}}}))
            begin
              reg214 <= (~&$signed(wire98[(1'h0):(1'h0)]));
              reg215 <= wire100[(2'h2):(2'h2)];
              reg216 <= $unsigned($unsigned((^reg133[(2'h2):(1'h1)])));
            end
          else
            begin
              reg214 <= $unsigned((-$signed((!wire99))));
              reg215 <= (($unsigned($unsigned($unsigned(wire138))) ~^ $signed(wire171[(4'h8):(1'h0)])) ?
                  reg214 : ((($signed(wire95) ?
                              ((7'h40) * reg210) : $unsigned(wire138)) ?
                          wire138 : $signed((8'hb1))) ?
                      wire207[(4'h9):(3'h6)] : reg209[(4'hc):(4'hc)]));
            end
          reg217 <= reg134;
          reg218 <= wire207;
        end
      else
        begin
          if (((reg211[(3'h5):(2'h3)] ?
                  $signed(reg217) : $unsigned(((~^wire207) - (!reg217)))) ?
              $unsigned($signed($signed((reg214 ?
                  reg136 : wire138)))) : $unsigned(({reg215[(5'h11):(5'h10)],
                      (!wire207)} ?
                  reg212[(4'hd):(3'h4)] : $signed((|wire99))))))
            begin
              reg214 <= wire102[(3'h5):(2'h3)];
              reg215 <= (($signed($signed({reg215, reg134})) ?
                      (7'h41) : (reg134 < wire131)) ?
                  wire92[(4'hc):(4'hc)] : $unsigned(((8'haf) ?
                      (~|{wire96}) : reg210)));
              reg216 <= $signed($unsigned((($signed((8'hb0)) <<< (~wire171)) ^~ ((^~reg217) ?
                  reg134 : $unsigned(wire171)))));
              reg217 <= (8'h9e);
            end
          else
            begin
              reg214 <= $unsigned(({$signed(reg210[(3'h5):(2'h3)])} ?
                  ($unsigned((^~(8'haf))) << (reg216[(4'hd):(4'h9)] ?
                      (!wire95) : {wire97})) : (8'hb4)));
            end
          reg218 <= ((~&$unsigned($signed(((8'hb6) ? reg209 : reg218)))) ?
              (^~(((+wire93) ? reg212[(2'h3):(1'h1)] : (~|reg213)) ?
                  $unsigned((8'hb2)) : ({reg135, wire138} ?
                      (+wire138) : (&(7'h41))))) : wire138);
          reg219 <= {(($unsigned((^~wire171)) << (|$unsigned(reg212))) ?
                  (reg215 ?
                      ((reg133 & wire207) ?
                          ((7'h44) ?
                              wire93 : (8'haa)) : wire93) : wire100) : wire131),
              $unsigned({wire169, (~{reg136, wire169})})};
          reg220 <= (8'ha3);
        end
      reg221 <= (($unsigned(({(8'hb7),
          reg218} & $signed(wire138))) && wire96[(3'h6):(3'h6)]) - wire98[(4'h8):(3'h4)]);
    end
  assign wire222 = ((|reg215) >> ((($unsigned(reg133) ^ reg210[(1'h1):(1'h0)]) ?
                       wire138[(4'h9):(3'h5)] : ($signed(reg217) & (~&wire138))) >= $signed((~&$signed(reg219)))));
  always
    @(posedge clk) begin
      reg223 <= reg210;
      reg224 <= $unsigned((($unsigned((^~reg218)) << $unsigned((~^wire92))) - $unsigned((!reg133))));
      reg225 <= ($signed($signed($signed((wire131 ? wire92 : wire207)))) ?
          (wire96 ?
              (~^$signed((wire100 ?
                  reg215 : reg224))) : (wire138 >= $signed($unsigned((8'ha9))))) : $signed(wire131[(2'h2):(1'h0)]));
    end
  module226 #() modinst250 (wire249, clk, wire96, wire222, reg211, reg223, wire93);
  assign wire251 = reg211;
  always
    @(posedge clk) begin
      reg252 <= wire97;
      reg253 <= $unsigned((reg133 ?
          wire249[(3'h4):(2'h3)] : $signed($unsigned($unsigned(wire100)))));
    end
  assign wire254 = wire131[(2'h2):(1'h1)];
endmodule

module module65  (y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire69;
  input wire signed [(4'hf):(1'h0)] wire68;
  input wire [(4'hc):(1'h0)] wire67;
  input wire signed [(5'h15):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire70;
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire74,
                 wire72,
                 wire71,
                 wire70,
                 reg77,
                 reg76,
                 reg75,
                 reg73,
                 (1'h0)};
  assign wire70 = $unsigned(wire69[(3'h5):(2'h3)]);
  assign wire71 = (~(wire66 == {(wire66 ?
                          wire66 : ((8'ha2) ? wire67 : (8'hbd))),
                      {wire66[(4'hf):(2'h3)]}}));
  assign wire72 = {wire70[(3'h7):(3'h7)], (&wire68)};
  always
    @(posedge clk) begin
      reg73 <= (!wire71);
    end
  assign wire74 = ($signed(((!((8'ha5) ^ reg73)) >>> ((reg73 ~^ wire72) ~^ wire66))) ?
                      {$unsigned($unsigned($unsigned(wire67)))} : {wire66,
                          (-$signed(wire69))});
  always
    @(posedge clk) begin
      reg75 <= ((8'hbd) && $unsigned(wire72[(4'ha):(4'ha)]));
      reg76 <= ($unsigned(reg73) ? reg75[(3'h5):(3'h5)] : wire68);
      reg77 <= (~^($unsigned((wire67 > (reg75 >= wire70))) > (((wire72 - wire70) ?
          (^~wire69) : (wire68 * wire67)) >= wire68)));
    end
  assign wire78 = (wire70[(4'hf):(4'hc)] | ($signed(reg75[(5'h10):(3'h5)]) <<< ((-$signed(reg77)) ?
                      wire67[(1'h0):(1'h0)] : $signed((&wire71)))));
  assign wire79 = $signed((~^(7'h43)));
  assign wire80 = wire78;
  assign wire81 = (((((^~wire80) ^~ (wire66 ?
                          wire74 : (8'hbe))) < (~&wire68)) && ((~&wire72[(4'h9):(2'h3)]) ?
                          wire67[(3'h4):(1'h1)] : (((8'h9d) != reg77) ?
                              wire80[(4'hd):(1'h1)] : (^~wire66)))) ?
                      (wire70[(3'h7):(3'h5)] ?
                          wire67 : $signed(wire69[(4'ha):(3'h4)])) : $unsigned((-wire66[(3'h7):(2'h2)])));
endmodule

module module4
#(parameter param44 = (8'ha2), 
parameter param45 = (~&(~^(((param44 ? (8'ha1) : (8'ha2)) ? (^~(8'ha6)) : (8'hb0)) ? param44 : ((|(8'hb0)) ~^ (!param44))))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire6;
  input wire signed [(4'hc):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire10;
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  assign y = {wire42,
                 wire16,
                 wire10,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = (^{$unsigned(wire9)});
  always
    @(posedge clk) begin
      reg11 <= (($signed((8'had)) ?
          ($unsigned(wire8[(1'h0):(1'h0)]) & $signed({wire5})) : wire9) * (({wire6} - ((wire6 >>> wire5) ?
              (^wire9) : (wire5 ? wire8 : wire6))) ?
          $unsigned($unsigned(wire10)) : (($signed(wire9) <= $signed(wire6)) >= (&wire8[(1'h0):(1'h0)]))));
      reg12 <= $unsigned($signed((+wire5[(4'h9):(2'h3)])));
      reg13 <= (~{$unsigned(wire8), reg11});
      reg14 <= reg12[(1'h1):(1'h0)];
      reg15 <= reg14[(1'h0):(1'h0)];
    end
  assign wire16 = (~wire8);
  module17 #() modinst43 (wire42, clk, reg15, wire9, wire5, reg14);
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire21;
  input wire [(3'h4):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
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
                 reg32,
                 (1'h0)};
  assign wire22 = wire18[(1'h1):(1'h1)];
  assign wire23 = (|wire18[(2'h3):(1'h1)]);
  assign wire24 = {($signed($signed(wire21[(4'h9):(2'h3)])) >= (7'h42))};
  assign wire25 = (!($unsigned(((wire22 ^~ (8'hbf)) >>> (-wire21))) ?
                      (^~(wire18 < (&wire24))) : wire22[(1'h1):(1'h1)]));
  assign wire26 = (+wire18[(3'h6):(1'h1)]);
  assign wire27 = $signed((&(7'h43)));
  assign wire28 = $unsigned((~|wire18[(3'h4):(1'h0)]));
  assign wire29 = wire20;
  assign wire30 = $signed($unsigned($signed({{wire27, wire28}})));
  assign wire31 = (wire28[(4'h8):(3'h6)] - wire19);
  always
    @(posedge clk) begin
      reg32 <= (!($signed((wire31[(3'h7):(3'h6)] || $unsigned(wire28))) ?
          wire29 : (wire26[(1'h1):(1'h0)] || (~|{wire25, wire30}))));
    end
  assign wire33 = (($signed(wire23[(2'h2):(1'h1)]) ?
                      (~(&{wire27, wire30})) : wire28) ~^ (($unsigned((wire19 ?
                          wire19 : (8'hbc))) ?
                      $unsigned(wire20[(2'h3):(1'h1)]) : (wire21[(1'h1):(1'h0)] ~^ (8'hb1))) + (wire25[(4'h8):(2'h3)] ?
                      $signed((wire29 || (8'hb4))) : wire28[(4'hb):(4'h8)])));
  assign wire34 = {$signed(($unsigned(wire25[(4'h9):(3'h5)]) >> ({wire33,
                          wire25} >= {wire20}))),
                      reg32};
  assign wire35 = (+wire31[(4'h8):(3'h7)]);
  assign wire36 = wire26;
  assign wire37 = $unsigned(($signed(wire33) + $unsigned(wire21)));
  assign wire38 = wire27;
  assign wire39 = wire21[(1'h1):(1'h0)];
  assign wire40 = $unsigned((~|$signed(reg32)));
  assign wire41 = wire29;
endmodule

module module226  (y, clk, wire231, wire230, wire229, wire228, wire227);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire231;
  input wire [(5'h12):(1'h0)] wire230;
  input wire signed [(5'h14):(1'h0)] wire229;
  input wire signed [(4'ha):(1'h0)] wire228;
  input wire signed [(4'h9):(1'h0)] wire227;
  wire [(4'ha):(1'h0)] wire248;
  wire signed [(2'h2):(1'h0)] wire247;
  wire [(3'h6):(1'h0)] wire246;
  wire [(5'h12):(1'h0)] wire245;
  wire [(5'h10):(1'h0)] wire244;
  reg signed [(4'hf):(1'h0)] reg243 = (1'h0);
  reg [(5'h15):(1'h0)] reg242 = (1'h0);
  reg [(2'h3):(1'h0)] reg241 = (1'h0);
  reg [(4'hb):(1'h0)] reg240 = (1'h0);
  reg [(5'h11):(1'h0)] reg239 = (1'h0);
  reg [(5'h15):(1'h0)] reg238 = (1'h0);
  reg [(3'h5):(1'h0)] reg237 = (1'h0);
  reg [(5'h11):(1'h0)] reg236 = (1'h0);
  reg [(4'ha):(1'h0)] reg235 = (1'h0);
  reg [(2'h2):(1'h0)] reg234 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg233 = (1'h0);
  reg [(3'h4):(1'h0)] reg232 = (1'h0);
  assign y = {wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed($signed(({wire230, wire231} ?
          $signed(wire231) : $signed(wire228)))) <<< $unsigned($signed($unsigned(wire227)))))
        begin
          reg232 <= $unsigned(($signed($unsigned((^wire230))) ?
              wire228 : wire230[(4'hc):(3'h6)]));
        end
      else
        begin
          reg232 <= ($unsigned(({(|reg232)} ? wire227 : wire228)) ?
              {wire227[(3'h5):(2'h2)],
                  (!$unsigned(wire227[(2'h2):(1'h0)]))} : ($unsigned(wire227) ^ $unsigned(reg232)));
          reg233 <= ((wire227 >= $signed(($signed(wire229) ^ {reg232}))) ?
              (wire230 ?
                  (reg232 & (^~wire227)) : {{$unsigned(wire231)}}) : wire228);
          reg234 <= ($unsigned((|reg232)) < $unsigned(wire229));
          reg235 <= ({$signed($unsigned(wire229)), reg232} ?
              reg232 : (+wire228));
          reg236 <= (((((reg235 ? reg235 : (8'hb0)) ^ (wire227 ?
                          reg235 : wire227)) ?
                      $unsigned({reg233}) : $signed((wire230 - (8'ha8)))) ?
                  (+reg235[(2'h3):(1'h0)]) : (~($signed(reg232) ?
                      $signed(wire228) : ((8'hb8) >= wire230)))) ?
              (-$signed(reg232)) : (!reg233));
        end
      reg237 <= $unsigned(((wire230 ?
              ((~&wire230) ~^ (8'ha7)) : $unsigned((~&wire227))) ?
          reg232 : ($unsigned((wire228 ?
              wire231 : reg234)) != wire231[(5'h10):(4'hf)])));
      if ((~|(wire227 << (wire230[(2'h2):(2'h2)] ?
          {(reg237 < wire228)} : $signed($signed(wire231))))))
        begin
          reg238 <= (wire227 ^ $signed((^~(((8'hae) ?
              wire227 : reg233) <<< (~^wire228)))));
          reg239 <= {($unsigned({(reg235 && (8'ha1)),
                  wire230[(5'h10):(4'hf)]}) < $signed((~&(&wire230))))};
          if (reg239[(2'h3):(2'h2)])
            begin
              reg240 <= wire228;
              reg241 <= reg240;
            end
          else
            begin
              reg240 <= ($signed($unsigned(wire230)) >= (!reg233[(2'h2):(1'h1)]));
              reg241 <= $signed((!$signed(reg233[(3'h4):(1'h1)])));
            end
          reg242 <= (&(8'ha9));
          reg243 <= (reg242[(4'hf):(3'h4)] ?
              wire227 : $signed((~^$signed(reg233))));
        end
      else
        begin
          if ($signed(((($unsigned(reg240) >>> wire231[(3'h4):(2'h3)]) ?
                  ((reg240 == reg234) ?
                      reg239[(1'h1):(1'h1)] : reg240) : {(reg234 ?
                          reg233 : reg235),
                      $unsigned(reg241)}) ?
              $signed(((wire228 ?
                  wire227 : reg238) > wire228)) : $unsigned(wire228))))
            begin
              reg238 <= reg239[(4'h8):(2'h2)];
              reg239 <= (^~reg241);
              reg240 <= reg233;
              reg241 <= ({(8'ha0)} ?
                  $signed(($unsigned((~|(8'ha1))) ?
                      ((^~reg238) && reg233[(3'h5):(1'h1)]) : reg239[(4'hc):(1'h1)])) : reg243);
              reg242 <= $signed(((7'h41) ? reg243[(4'h9):(2'h2)] : reg236));
            end
          else
            begin
              reg238 <= ($unsigned($unsigned($unsigned(wire231[(5'h11):(1'h1)]))) ?
                  (8'h9f) : $unsigned(wire227[(1'h1):(1'h0)]));
              reg239 <= $unsigned(({(|reg234)} ?
                  reg236[(3'h6):(2'h2)] : (8'hb1)));
              reg240 <= reg243[(3'h7):(2'h3)];
              reg241 <= $unsigned((|$unsigned($signed(reg242))));
            end
        end
    end
  assign wire244 = reg243;
  assign wire245 = wire227;
  assign wire246 = (~((reg241 - (reg237 ?
                       reg239[(3'h5):(1'h0)] : $unsigned(wire228))) >>> wire228[(2'h2):(1'h0)]));
  assign wire247 = wire246;
  assign wire248 = $signed((+reg233[(2'h3):(1'h1)]));
endmodule

module module172
#(parameter param206 = (((((~|(8'hb1)) ? ((8'ha3) == (8'ha3)) : ((8'haa) ~^ (8'hbc))) >> (|((8'hb7) ^~ (8'hb7)))) | (((8'ha1) ? ((8'hb9) ? (8'hb8) : (7'h40)) : {(8'hba), (8'had)}) << (((8'ha8) << (8'ha9)) ? ((7'h43) ? (8'hac) : (8'hbd)) : (-(8'hac))))) - (((^~(~|(8'hbe))) || ((+(7'h41)) || ((8'hba) ? (8'hb5) : (8'haa)))) ? {{((8'h9c) && (8'hae))}, (+(-(8'ha4)))} : (~&(8'ha3)))))
(y, clk, wire176, wire175, wire174, wire173);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire176;
  input wire signed [(4'ha):(1'h0)] wire175;
  input wire [(4'he):(1'h0)] wire174;
  input wire signed [(4'hd):(1'h0)] wire173;
  wire [(5'h11):(1'h0)] wire204;
  wire signed [(2'h3):(1'h0)] wire203;
  wire signed [(4'ha):(1'h0)] wire187;
  wire signed [(5'h15):(1'h0)] wire179;
  wire [(5'h14):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire177;
  reg signed [(4'h8):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg202 = (1'h0);
  reg [(5'h14):(1'h0)] reg201 = (1'h0);
  reg [(5'h11):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg199 = (1'h0);
  reg [(3'h6):(1'h0)] reg198 = (1'h0);
  reg [(5'h11):(1'h0)] reg197 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg196 = (1'h0);
  reg [(5'h15):(1'h0)] reg195 = (1'h0);
  reg [(3'h4):(1'h0)] reg194 = (1'h0);
  reg [(5'h15):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg191 = (1'h0);
  reg [(4'hc):(1'h0)] reg190 = (1'h0);
  reg [(5'h10):(1'h0)] reg189 = (1'h0);
  reg [(4'ha):(1'h0)] reg188 = (1'h0);
  reg [(4'hc):(1'h0)] reg186 = (1'h0);
  reg [(4'hf):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg184 = (1'h0);
  reg [(4'h8):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg182 = (1'h0);
  reg [(5'h13):(1'h0)] reg181 = (1'h0);
  reg [(4'hb):(1'h0)] reg180 = (1'h0);
  assign y = {wire204,
                 wire203,
                 wire187,
                 wire179,
                 wire178,
                 wire177,
                 reg205,
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
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 (1'h0)};
  assign wire177 = wire175;
  assign wire178 = $unsigned(wire173);
  assign wire179 = wire175;
  always
    @(posedge clk) begin
      if (wire175)
        begin
          if (wire178[(5'h13):(2'h3)])
            begin
              reg180 <= wire175[(3'h4):(2'h2)];
              reg181 <= (((wire174 + ((wire177 & wire174) ?
                  reg180[(3'h6):(3'h6)] : $signed(wire175))) <= ($signed((reg180 ~^ wire176)) & ($unsigned(wire178) ?
                  $signed((8'ha0)) : (&wire177)))) && (wire176 ?
                  ($signed($signed(wire179)) | wire175) : wire174));
              reg182 <= {$unsigned((wire173[(4'hc):(3'h7)] ?
                      (wire173[(4'ha):(3'h7)] ?
                          $signed(wire175) : (7'h42)) : $signed((wire176 << wire173))))};
            end
          else
            begin
              reg180 <= $unsigned(((~|$signed((8'hbb))) ?
                  reg182 : (wire173 ^ wire176)));
            end
          reg183 <= $signed(reg180);
          reg184 <= $unsigned($signed(reg181[(5'h11):(5'h10)]));
        end
      else
        begin
          reg180 <= {$signed(reg184[(4'he):(3'h6)]),
              {$unsigned(($signed(reg181) ^~ (~^wire179))),
                  $unsigned((~&(!reg184)))}};
          if (reg181[(3'h4):(1'h0)])
            begin
              reg181 <= ($signed(reg180) ?
                  $signed((~^$signed((wire175 < reg182)))) : ((((reg180 ?
                              reg182 : wire174) || (wire173 ?
                              (8'h9d) : reg181)) ?
                          (wire176 ?
                              {reg180,
                                  wire175} : wire174[(2'h3):(2'h2)]) : $unsigned((reg180 & reg182))) ?
                      $unsigned(wire173[(3'h5):(1'h1)]) : ((|reg181[(1'h0):(1'h0)]) ?
                          reg180[(4'ha):(3'h4)] : (~|(wire179 + wire174)))));
              reg182 <= wire174;
              reg183 <= $unsigned($signed((8'hb9)));
              reg184 <= ((^$unsigned(reg181[(3'h6):(2'h2)])) ?
                  reg184[(3'h4):(1'h0)] : ((wire176 >> $unsigned((!wire174))) ?
                      $signed(((wire173 + (8'ha7)) | wire174)) : $unsigned((8'hab))));
            end
          else
            begin
              reg181 <= ((wire173 ?
                  (wire176[(3'h4):(1'h0)] <= (wire173[(1'h0):(1'h0)] ?
                      wire174[(4'h9):(3'h6)] : (reg181 ?
                          wire173 : (8'hb4)))) : $unsigned($signed((wire179 || (8'ha6))))) <= wire176[(2'h3):(1'h0)]);
            end
          reg185 <= wire177;
        end
      reg186 <= (8'ha7);
    end
  assign wire187 = wire179[(4'hf):(2'h2)];
  always
    @(posedge clk) begin
      reg188 <= $unsigned($unsigned($unsigned(($signed(reg183) ?
          (~&reg181) : $unsigned(wire176)))));
      if (reg181[(2'h3):(2'h2)])
        begin
          reg189 <= ({{$signed((wire173 ? reg188 : reg185)),
                      (wire179 ^~ (!wire175))},
                  wire174[(3'h4):(2'h2)]} ?
              ({{$signed(wire177), reg180[(2'h3):(1'h1)]}} ?
                  reg180[(3'h5):(1'h1)] : (wire176 ?
                      reg186[(2'h2):(2'h2)] : wire173)) : (reg180[(1'h1):(1'h1)] - wire177));
          if ({$unsigned($unsigned($unsigned((^~(8'hb5)))))})
            begin
              reg190 <= wire179[(4'hf):(4'hd)];
              reg191 <= reg182[(4'hb):(3'h5)];
            end
          else
            begin
              reg190 <= ($signed(reg185[(4'ha):(4'ha)]) ?
                  $signed($unsigned($unsigned(wire173))) : reg185);
              reg191 <= (~^reg182[(1'h1):(1'h0)]);
              reg192 <= reg183;
            end
          reg193 <= $unsigned($unsigned($unsigned(wire174[(3'h5):(1'h1)])));
          reg194 <= ((($unsigned(wire178[(3'h6):(3'h5)]) ?
                      $signed(((7'h43) ^ reg181)) : reg189) ?
                  $unsigned(($unsigned(wire179) > reg184[(2'h3):(2'h3)])) : $signed({(~&wire175)})) ?
              (reg193 ?
                  reg185 : reg182) : (~|((((8'hba) + wire179) * (+reg186)) ?
                  wire187[(2'h2):(2'h2)] : $signed($unsigned(wire175)))));
          if (reg194[(1'h1):(1'h1)])
            begin
              reg195 <= ((reg193 ? (|wire187) : reg186[(4'h9):(1'h1)]) ?
                  ((~^(8'hb9)) - reg188) : ({reg193[(3'h5):(3'h4)]} ?
                      (~wire177[(4'h8):(3'h4)]) : $signed($unsigned($unsigned(reg194)))));
              reg196 <= ($signed((^~{(reg183 << wire176), {wire174}})) ?
                  ({(|reg182)} ?
                      (($signed(wire179) ?
                              ((8'ha1) & reg182) : (wire173 ?
                                  reg193 : reg190)) ?
                          ($unsigned(reg182) > {wire177}) : (8'h9c)) : $signed((wire177[(4'h9):(2'h2)] ?
                          $signed(reg189) : (reg180 ?
                              (8'ha7) : reg189)))) : (&$unsigned(((reg191 ?
                          (8'h9c) : wire177) ?
                      {reg188, reg190} : wire178[(5'h13):(3'h4)]))));
            end
          else
            begin
              reg195 <= {{(~((reg189 ? (7'h43) : wire177) ?
                          $unsigned(reg189) : (reg185 < reg192))),
                      (+((wire173 ? wire179 : wire176) ~^ (wire177 ?
                          (8'h9c) : wire179)))},
                  reg191[(2'h2):(1'h0)]};
              reg196 <= wire173;
              reg197 <= $unsigned($unsigned($signed(((wire176 != reg190) ^~ (reg183 + (8'hb0))))));
              reg198 <= reg182[(5'h10):(4'h8)];
              reg199 <= (-reg182[(4'hc):(4'h8)]);
            end
        end
      else
        begin
          reg189 <= reg188;
        end
      reg200 <= reg194[(1'h1):(1'h1)];
      reg201 <= ({(reg195[(4'hc):(4'h8)] ?
                  ((reg192 ^~ reg188) ?
                      (|(8'hb2)) : {reg200,
                          reg180}) : $signed(reg180[(3'h4):(2'h3)]))} ?
          ({(8'h9f)} ?
              (-reg199) : reg186) : $unsigned((reg194[(1'h1):(1'h0)] == wire175[(3'h6):(3'h5)])));
      reg202 <= $unsigned((~(^reg184)));
    end
  assign wire203 = $unsigned(($unsigned((^~((7'h40) ?
                       reg190 : reg195))) - (reg184[(3'h6):(3'h6)] ?
                       reg200[(1'h1):(1'h0)] : (~((8'h9f) & reg189)))));
  assign wire204 = (&(reg191 ?
                       $signed($signed((~^(8'ha2)))) : $signed(($unsigned(reg195) ?
                           wire173[(4'hd):(1'h1)] : {wire179, wire173}))));
  always
    @(posedge clk) begin
      reg205 <= $signed(wire203);
    end
endmodule

module module139
#(parameter param167 = ((!((~^((8'hb9) ? (8'ha6) : (8'hbd))) && (((8'ha5) >= (7'h41)) ? ((7'h41) + (8'hb1)) : ((7'h40) | (8'hbe))))) ? (8'hba) : ((8'hac) || (~&{((8'hb7) * (8'ha1))}))), 
parameter param168 = param167)
(y, clk, wire143, wire142, wire141, wire140);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire143;
  input wire signed [(4'hc):(1'h0)] wire142;
  input wire [(4'hf):(1'h0)] wire141;
  input wire [(4'h9):(1'h0)] wire140;
  wire [(3'h5):(1'h0)] wire166;
  wire [(3'h6):(1'h0)] wire165;
  wire [(5'h14):(1'h0)] wire164;
  wire signed [(4'he):(1'h0)] wire163;
  wire signed [(4'hf):(1'h0)] wire159;
  wire signed [(2'h3):(1'h0)] wire158;
  wire signed [(3'h4):(1'h0)] wire157;
  wire [(3'h5):(1'h0)] wire154;
  wire signed [(4'he):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire151;
  wire [(3'h4):(1'h0)] wire144;
  reg [(2'h3):(1'h0)] reg162 = (1'h0);
  reg [(2'h3):(1'h0)] reg161 = (1'h0);
  reg [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg [(4'h9):(1'h0)] reg148 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire159,
                 wire158,
                 wire157,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire144,
                 reg162,
                 reg161,
                 reg160,
                 reg156,
                 reg155,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire144 = {$signed(((8'ha8) | wire140))};
  always
    @(posedge clk) begin
      reg145 <= ((|$unsigned($unsigned((8'ha6)))) * wire143);
    end
  always
    @(posedge clk) begin
      reg146 <= (8'ha6);
      if (((wire140 ?
          (((~reg145) ?
              $unsigned(reg145) : $unsigned((8'hb4))) ~^ wire140[(1'h0):(1'h0)]) : {({wire143,
                      reg145} ?
                  (~^wire143) : (+wire143)),
              $unsigned((^~wire140))}) >> $signed((((wire142 ?
          wire143 : wire140) ~^ wire141[(4'ha):(1'h1)]) ~^ ($signed((7'h40)) << $signed(wire143))))))
        begin
          reg147 <= ((wire141 ?
                  (wire141[(4'h8):(2'h3)] & reg145) : {$unsigned(wire142[(2'h2):(1'h1)])}) ?
              (wire142[(1'h0):(1'h0)] + $signed((|$unsigned(wire141)))) : (^$signed((&(~^wire140)))));
          reg148 <= reg147[(2'h2):(2'h2)];
        end
      else
        begin
          reg147 <= reg148;
        end
      reg149 <= {wire143[(1'h0):(1'h0)],
          $signed($unsigned($unsigned($unsigned(wire143))))};
      reg150 <= $signed($unsigned((^(+reg147[(3'h6):(2'h2)]))));
    end
  assign wire151 = $signed(wire141);
  assign wire152 = ((|((8'hb7) << ((reg150 ? wire141 : reg146) ?
                       (wire144 ?
                           (8'ha4) : reg147) : wire151[(3'h7):(1'h0)]))) >>> $signed($signed(($signed(reg146) & $signed(wire144)))));
  assign wire153 = (!reg148[(2'h3):(1'h1)]);
  assign wire154 = ($signed((reg149[(2'h3):(1'h0)] * $unsigned((8'hb1)))) ?
                       ({wire140[(1'h0):(1'h0)]} ?
                           wire141[(4'ha):(4'h8)] : $unsigned((-$unsigned(wire153)))) : $unsigned(wire151));
  always
    @(posedge clk) begin
      reg155 <= {(~|$unsigned(wire140))};
      reg156 <= $signed((~reg150[(2'h3):(2'h2)]));
    end
  assign wire157 = reg147[(3'h6):(1'h0)];
  assign wire158 = $unsigned((((|$signed(wire143)) <<< reg145[(3'h4):(1'h0)]) ?
                       wire153[(4'he):(3'h4)] : {wire152[(3'h6):(1'h0)],
                           $unsigned($unsigned((8'haa)))}));
  assign wire159 = reg145;
  always
    @(posedge clk) begin
      reg160 <= {$unsigned($signed((wire143[(2'h2):(1'h0)] ^~ {(8'ha6)})))};
      reg161 <= $signed((~^$signed({reg145, (reg148 || reg149)})));
      reg162 <= (~^$signed(reg150));
    end
  assign wire163 = reg145[(2'h2):(1'h0)];
  assign wire164 = wire159[(3'h4):(3'h4)];
  assign wire165 = (wire143[(3'h5):(3'h4)] + {$signed($unsigned((^wire140))),
                       ((^(wire154 > wire153)) | ($signed((8'hb7)) == (wire152 >= wire163)))});
  assign wire166 = (~|$unsigned(reg145[(2'h2):(2'h2)]));
endmodule

module module103  (y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire107;
  input wire signed [(4'h8):(1'h0)] wire106;
  input wire [(2'h3):(1'h0)] wire105;
  input wire [(5'h13):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire130;
  wire [(5'h10):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire128;
  wire signed [(2'h2):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire108;
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(4'hc):(1'h0)] reg112 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire108,
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
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire108 = wire106[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg109 <= wire105;
      reg110 <= reg109;
      reg111 <= ($signed((^$signed($signed(wire106)))) ?
          ((~^reg109[(1'h1):(1'h1)]) != {$unsigned((reg110 ?
                  wire104 : wire104)),
              (~^reg109[(3'h4):(2'h3)])}) : $unsigned(reg109));
      reg112 <= (reg111[(1'h1):(1'h0)] * {(~&$unsigned(((8'hae) | wire104)))});
    end
  always
    @(posedge clk) begin
      reg113 <= ((+$signed(reg110)) ?
          $signed(((~^reg111) ?
              $signed(wire107) : wire106[(2'h2):(1'h0)])) : $unsigned(($signed(reg109) ?
              (~|(wire104 ? reg112 : wire107)) : $signed((8'hb0)))));
      if ((|$signed(reg111[(2'h2):(2'h2)])))
        begin
          if ((+(wire108 >= $unsigned($unsigned($signed(reg109))))))
            begin
              reg114 <= (+wire104[(4'hb):(4'ha)]);
              reg115 <= {$unsigned($signed({$signed((8'had)),
                      (wire107 << reg114)})),
                  reg111};
              reg116 <= {$unsigned(wire104), wire106[(3'h4):(3'h4)]};
              reg117 <= $unsigned(wire104[(4'h8):(3'h6)]);
              reg118 <= wire107[(3'h5):(3'h4)];
            end
          else
            begin
              reg114 <= wire107;
              reg115 <= $signed(($signed($unsigned($unsigned((8'hab)))) ?
                  {$unsigned($signed(wire106)),
                      reg110} : ($signed(reg118) >= $unsigned(reg109))));
            end
          if ($unsigned({$unsigned($signed((wire105 != reg110)))}))
            begin
              reg119 <= {(wire106 ?
                      (^~$signed((8'haa))) : reg109[(3'h4):(1'h1)]),
                  reg110};
              reg120 <= reg110[(1'h0):(1'h0)];
            end
          else
            begin
              reg119 <= ($signed((reg114[(4'hf):(4'he)] ?
                  (reg116 ?
                      $signed(reg111) : reg115[(2'h3):(2'h2)]) : ($unsigned(reg117) ?
                      $signed(reg111) : $unsigned(wire108)))) == {{$unsigned((reg113 ?
                          wire107 : (8'h9f)))}});
              reg120 <= ((reg117 ?
                      $signed(($unsigned(reg117) <= reg114)) : ($signed(reg112[(2'h3):(1'h1)]) || $unsigned({wire107,
                          (8'hb2)}))) ?
                  $unsigned($unsigned((~$signed(reg111)))) : $unsigned(wire107[(2'h2):(2'h2)]));
              reg121 <= (reg120 ?
                  (reg120[(4'ha):(2'h3)] ?
                      ({{(8'ha6)}} <= $unsigned($unsigned((8'hb8)))) : $signed((8'ha7))) : ({$unsigned((8'ha7)),
                      (^$unsigned(reg116))} || (8'hbe)));
              reg122 <= reg114[(4'hd):(4'hc)];
              reg123 <= $signed(reg115);
            end
          reg124 <= wire104;
          reg125 <= $unsigned($unsigned($signed(((+reg114) + (reg116 ?
              reg122 : reg117)))));
        end
      else
        begin
          reg114 <= reg113;
          if (wire106)
            begin
              reg115 <= $unsigned(reg119);
              reg116 <= ((|(((reg110 ?
                      (8'hbf) : reg118) >= reg111[(3'h4):(1'h1)]) * reg115)) ?
                  $unsigned($signed(reg111[(1'h0):(1'h0)])) : (~&((~^(reg110 ?
                      reg112 : reg118)) ^ $signed({reg111, reg109}))));
              reg117 <= (~&{$unsigned($unsigned($unsigned(reg123)))});
              reg118 <= $unsigned(reg109);
              reg119 <= reg119[(1'h1):(1'h0)];
            end
          else
            begin
              reg115 <= $unsigned(((wire107 != (~&(reg112 ^~ wire108))) | reg119[(1'h1):(1'h1)]));
              reg116 <= $unsigned((wire107[(3'h5):(3'h4)] || ((!(reg119 ?
                  reg109 : (8'hb0))) ^ reg116)));
            end
          reg120 <= {(wire106 && (reg120 ?
                  ((-reg109) || (reg119 ^ reg125)) : ((7'h41) ?
                      ((8'ha3) ? reg122 : (8'hb4)) : (wire104 == reg113))))};
        end
      reg126 <= (reg121[(2'h2):(1'h1)] ?
          ((reg125[(2'h3):(2'h3)] | (7'h44)) | (-$signed(reg112[(3'h4):(1'h1)]))) : (~&(reg115 ?
              reg114[(1'h1):(1'h1)] : (&$unsigned((8'hb4))))));
    end
  assign wire127 = $unsigned(($unsigned($signed((^~reg117))) ?
                       $unsigned($signed($unsigned(reg125))) : (8'hae)));
  assign wire128 = $unsigned(($signed(($unsigned(wire105) ?
                       (8'hab) : $unsigned((8'hb6)))) >>> reg124));
  assign wire129 = {$signed(reg126[(1'h1):(1'h1)])};
  assign wire130 = wire129;
endmodule
