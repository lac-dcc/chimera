module top
#(parameter param117 = ((^~(~^(((8'hb9) ? (8'hb0) : (8'ha8)) * (-(8'hb3))))) & ((&(-((8'ha3) >> (8'h9c)))) ? ((~|((8'h9f) <<< (8'haf))) ^ (((8'h9d) <<< (8'hb9)) >>> ((8'hb1) ? (8'hb5) : (7'h43)))) : (7'h42))), 
parameter param118 = (((-(param117 ? (&(7'h44)) : (!param117))) ? ((~&param117) ? ((param117 >>> param117) >>> param117) : ((|param117) ? (&(8'hbd)) : {param117})) : ({param117, (param117 << param117)} ? (~^(^~param117)) : (((8'haf) + param117) < {param117}))) ? (|param117) : (&((-param117) ? ((-param117) & (+param117)) : (-(param117 ^~ param117))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  wire [(3'h4):(1'h0)] wire103;
  wire [(5'h15):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire [(4'h8):(1'h0)] wire96;
  reg signed [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  module5 #() modinst97 (.wire6(wire4), .wire7(wire3), .wire8(wire2), .clk(clk), .y(wire96), .wire9(wire0), .wire10(wire1));
  assign wire98 = (!wire4[(5'h15):(5'h12)]);
  assign wire99 = (^{(((wire1 ? wire2 : wire96) != wire2[(4'hc):(2'h2)]) ?
                          ((-(8'hae)) ^~ (7'h42)) : $unsigned($unsigned(wire96)))});
  assign wire100 = wire0[(4'h9):(4'h9)];
  assign wire101 = wire4;
  assign wire102 = {{($unsigned($unsigned(wire100)) << $unsigned($unsigned(wire101)))},
                       (-wire2[(4'hf):(2'h3)])};
  assign wire103 = (((((wire3 ? (8'hba) : wire100) ? (&wire2) : wire98) ?
                           $signed(wire4) : wire1) ?
                       (^(8'hbc)) : (8'hba)) ^ $signed((-(+$signed(wire101)))));
  assign wire104 = ({$signed($signed(wire96[(1'h0):(1'h0)])),
                       $signed($signed(wire100[(4'he):(2'h3)]))} - $unsigned($unsigned((((8'ha4) ^ wire103) ?
                       (wire98 ? wire1 : wire4) : ((8'hbf) << wire98)))));
  assign wire105 = (wire100 ? (|wire4) : wire1);
  assign wire106 = (|wire1);
  always
    @(posedge clk) begin
      reg107 <= wire99;
      reg108 <= ($signed($unsigned((-(&(8'ha0))))) && $signed($unsigned({(wire104 >>> wire0)})));
      if (reg107)
        begin
          reg109 <= {((&(wire2[(1'h0):(1'h0)] ?
                  (wire102 ?
                      wire4 : (8'hbd)) : $signed(wire3))) & ($unsigned((-wire101)) <<< wire2)),
              wire1};
          reg110 <= (8'hb8);
          reg111 <= (8'hb5);
          reg112 <= (wire96[(4'h8):(3'h5)] == (~&(wire99[(3'h6):(3'h5)] <= ({(8'hb6),
              reg107} >>> (wire104 ? (8'hb5) : (8'haf))))));
          reg113 <= (reg107 && $signed($signed(wire2)));
        end
      else
        begin
          reg109 <= $unsigned(wire2[(5'h12):(4'ha)]);
          if (reg109[(5'h12):(4'h9)])
            begin
              reg110 <= ((^~$unsigned((reg112 ?
                      (wire4 <<< reg107) : (wire96 && wire99)))) ?
                  ({$signed(((8'ha3) ? wire0 : reg109)),
                      {{reg113,
                              wire101}}} >= reg113) : (((wire101[(3'h6):(1'h0)] == $signed(wire0)) && ({wire102} ?
                          (8'haf) : (reg113 >= reg112))) ?
                      wire102[(5'h10):(4'hc)] : $signed(($unsigned(reg107) ?
                          {wire106} : $unsigned(reg111)))));
              reg111 <= reg112;
            end
          else
            begin
              reg110 <= wire99[(4'ha):(3'h4)];
              reg111 <= $unsigned($signed((-{$unsigned(reg108),
                  $unsigned(wire103)})));
              reg112 <= wire104[(3'h4):(2'h3)];
              reg113 <= wire99[(4'hb):(4'h8)];
            end
        end
    end
  assign wire114 = {((8'h9c) ? $signed(reg111) : wire100[(4'hb):(3'h6)]),
                       (wire104[(3'h7):(2'h2)] | (reg111 ?
                           (~&$signed(wire105)) : wire2))};
  assign wire115 = reg112[(5'h10):(3'h7)];
  assign wire116 = (({($unsigned(reg108) ? wire100 : wire106[(1'h0):(1'h0)])} ?
                           $unsigned((reg112[(1'h0):(1'h0)] >>> (reg109 + reg107))) : (wire0 - wire98[(1'h0):(1'h0)])) ?
                       ($unsigned((~^$signed(wire105))) ?
                           {(-(wire4 ?
                                   wire99 : wire1))} : $unsigned($signed({wire3,
                               reg111}))) : wire115[(1'h1):(1'h1)]);
endmodule

module module5
#(parameter param94 = (((((~^(8'haf)) + (~(8'h9f))) ^~ (((8'hae) ? (8'hb3) : (8'haf)) != (^(8'ha7)))) ? ((((8'hbd) <<< (8'hac)) == ((8'hb4) >>> (8'ha7))) ? ((~|(8'hb3)) <= ((8'ha3) ? (8'ha8) : (8'ha7))) : (((8'hae) & (8'hb9)) ? ((8'hae) ? (8'haf) : (7'h41)) : {(8'ha5)})) : (({(8'hbc)} + (+(8'h9d))) >> (((8'hbe) ? (8'ha9) : (8'hb1)) | (~&(8'hbc))))) ? ((({(8'h9c)} >= (~&(8'ha4))) ? (-((8'hbd) ? (8'haa) : (8'ha8))) : (((8'hae) - (8'hbe)) ? (^~(8'ha2)) : ((8'hb0) || (8'ha4)))) - ({((8'hac) ? (8'haf) : (8'hb8)), (|(8'ha4))} ^~ (((8'hb3) ? (8'ha6) : (8'hb9)) ? (~|(8'hb7)) : (8'haf)))) : {(({(8'ha9), (8'ha3)} >>> (8'hab)) & (((8'hb5) ? (8'hb5) : (8'ha6)) ? ((8'ha7) & (8'hb0)) : ((7'h40) ? (8'ha7) : (8'ha6)))), ((~^(8'hb5)) ~^ (8'hb5))}), 
parameter param95 = param94)
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire6;
  input wire [(3'h7):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire91;
  assign y = {wire93,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire52,
                 wire91,
                 (1'h0)};
  assign wire11 = {(wire9[(3'h5):(3'h5)] ?
                          $unsigned(wire7[(2'h2):(1'h0)]) : {(^wire8[(5'h11):(4'h9)]),
                              (8'h9e)}),
                      (({$unsigned(wire7)} || wire8[(4'ha):(2'h2)]) || (wire6[(3'h5):(3'h4)] ~^ ((~|(8'hbb)) << wire7[(1'h0):(1'h0)])))};
  assign wire12 = wire11[(3'h6):(1'h1)];
  assign wire13 = (&(~wire12));
  assign wire14 = ({($unsigned((&wire6)) ?
                          $signed($signed((8'ha5))) : $signed($unsigned(wire6))),
                      ({wire8} ?
                          (~^(wire6 || wire6)) : wire13)} >> (^~wire7[(1'h1):(1'h1)]));
  assign wire15 = (wire13[(3'h5):(2'h2)] ?
                      (wire11[(3'h6):(2'h2)] ?
                          wire11[(1'h1):(1'h1)] : wire13[(3'h7):(1'h0)]) : $unsigned($signed($unsigned(wire9[(3'h5):(2'h2)]))));
  assign wire16 = $signed((wire13 ?
                      $signed($signed($unsigned(wire9))) : wire12[(1'h1):(1'h1)]));
  assign wire17 = (^~wire15);
  assign wire18 = $signed(wire9);
  assign wire19 = (($signed(wire10) >> (wire6 ?
                          wire16[(4'h8):(3'h5)] : wire16)) ?
                      (8'ha8) : ($signed(wire10) ^ $signed((8'hb9))));
  module20 #() modinst53 (wire52, clk, wire6, wire12, wire18, wire7);
  module54 #() modinst92 (wire91, clk, wire7, wire14, wire8, wire9, wire17);
  assign wire93 = $signed(wire6);
endmodule

module module54
#(parameter param89 = (&((^~(~&(8'hb4))) < ((+((8'hb3) ? (8'hba) : (8'ha0))) ? {((8'h9c) <<< (8'ha8)), ((8'hab) >= (8'hb8))} : ((~(8'hae)) ? ((8'had) ? (8'hae) : (8'had)) : (^~(8'hba)))))), 
parameter param90 = ((|param89) > ((((!param89) + (param89 + param89)) ~^ param89) ? ({((8'ha0) ? param89 : param89), param89} ? {(|(8'hb0))} : (param89 ? ((8'ha0) ? param89 : param89) : param89)) : param89)))
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire59;
  input wire signed [(4'hb):(1'h0)] wire58;
  input wire signed [(4'hc):(1'h0)] wire57;
  input wire signed [(4'hb):(1'h0)] wire56;
  input wire signed [(5'h11):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire [(4'hf):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
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
                 reg71,
                 (1'h0)};
  assign wire60 = ((wire56 ?
                      wire59[(1'h0):(1'h0)] : wire56) < $signed((wire58[(1'h1):(1'h0)] ?
                      wire58[(2'h3):(2'h3)] : $unsigned((~^wire57)))));
  assign wire61 = $signed(wire56[(2'h3):(2'h2)]);
  assign wire62 = (wire57 >>> wire57);
  assign wire63 = (wire62 ? (~&wire55[(3'h6):(3'h6)]) : wire61);
  assign wire64 = $unsigned($unsigned((~(wire62[(4'he):(4'hc)] - $unsigned(wire63)))));
  assign wire65 = ((^(($signed(wire60) ?
                          (wire60 ?
                              wire59 : (7'h44)) : (-wire57)) | $signed($unsigned(wire55)))) ?
                      (((|(wire57 ~^ wire57)) - (8'ha5)) ?
                          wire59[(1'h1):(1'h1)] : $signed((^~$signed(wire58)))) : {(((~&wire60) <<< $unsigned(wire55)) <<< (~^$signed((8'hb6)))),
                          (($unsigned(wire56) | $signed(wire55)) ?
                              wire59[(1'h0):(1'h0)] : $signed((wire60 ?
                                  wire63 : wire59)))});
  assign wire66 = ({wire59,
                      $unsigned($signed($unsigned(wire59)))} & ($unsigned($signed((wire55 ?
                          wire62 : wire64))) ?
                      {((wire55 ? wire64 : wire65) ?
                              $unsigned(wire59) : wire60[(2'h3):(1'h1)])} : ({$signed(wire55),
                              (wire57 & wire60)} ?
                          $unsigned((wire61 ?
                              wire56 : wire55)) : $signed(wire62[(5'h10):(3'h5)]))));
  assign wire67 = (~&(~|{$signed((wire60 ? (8'hb7) : wire58))}));
  assign wire68 = (|$unsigned(($unsigned(wire64[(4'h9):(3'h5)]) << $signed((wire58 || wire57)))));
  assign wire69 = wire63[(3'h7):(1'h1)];
  assign wire70 = wire56[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg71 <= (&(($signed($signed(wire64)) ?
          ({wire67,
              wire59} > $signed(wire63)) : (^~(+wire57))) > (~wire64[(3'h5):(3'h5)])));
      if ($unsigned($signed(wire60[(2'h3):(1'h0)])))
        begin
          if ($unsigned($unsigned((8'ha1))))
            begin
              reg72 <= $unsigned($unsigned($signed($signed((8'ha7)))));
            end
          else
            begin
              reg72 <= (!$unsigned($unsigned(((wire56 != wire61) ?
                  $unsigned(wire59) : (&wire66)))));
            end
          reg73 <= ($unsigned({{(wire62 ? reg72 : wire55), wire70}}) ?
              {reg72[(3'h4):(1'h1)],
                  {$signed($signed(wire58))}} : $signed($signed(wire60)));
          reg74 <= wire57;
          reg75 <= $signed($unsigned($unsigned($signed((8'hb5)))));
          reg76 <= ($unsigned(wire66) ?
              ($signed($signed({wire59, wire61})) ?
                  ({wire66[(2'h2):(2'h2)], (~wire67)} ^ (reg72[(1'h1):(1'h0)] ?
                      wire68[(4'h8):(2'h3)] : (wire58 << wire68))) : $unsigned(($signed(wire66) ?
                      $signed(reg74) : $signed(reg75)))) : $unsigned($signed({$signed(wire64),
                  {reg72, (8'hbf)}})));
        end
      else
        begin
          if ($signed(({{(8'ha9), reg76},
              ($unsigned(wire65) ?
                  reg74[(1'h0):(1'h0)] : $unsigned(reg73))} < $signed(reg71[(3'h5):(2'h2)]))))
            begin
              reg72 <= $signed($signed((({reg74, reg76} <<< (reg71 ?
                  wire56 : wire56)) < wire66)));
              reg73 <= (^(wire56 ?
                  (wire69[(2'h2):(1'h1)] > {wire59[(3'h4):(1'h0)],
                      $signed(wire62)}) : ((^{reg75,
                      reg73}) >= (wire61 < {wire70}))));
              reg74 <= $signed($signed(((reg75[(3'h5):(2'h3)] ?
                      ((8'hab) <= wire66) : wire67[(2'h2):(1'h1)]) ?
                  ((wire67 ^~ (8'ha9)) ?
                      (wire70 + wire62) : (~reg76)) : (&(~reg75)))));
            end
          else
            begin
              reg72 <= {{{{(wire63 ? wire56 : wire55), wire68[(4'hf):(1'h0)]},
                          (!(wire69 ? wire64 : (8'hb6)))}}};
              reg73 <= wire65;
              reg74 <= wire62;
              reg75 <= {$unsigned(($signed((wire55 ? wire65 : reg73)) + reg73)),
                  $signed($unsigned($signed(wire64)))};
            end
          if ((-{wire63, (~|$signed(wire60[(2'h3):(2'h2)]))}))
            begin
              reg76 <= ((wire55[(1'h1):(1'h0)] ?
                  wire59[(2'h3):(2'h2)] : $unsigned(reg75[(5'h14):(1'h0)])) << $signed(wire60[(4'h9):(3'h7)]));
            end
          else
            begin
              reg76 <= wire70[(1'h0):(1'h0)];
              reg77 <= (({($signed(reg76) ?
                              wire60 : (wire62 ? wire69 : wire61)),
                          $unsigned($signed(reg71))} ?
                      $unsigned(wire56[(3'h7):(1'h1)]) : wire69) ?
                  $unsigned((7'h44)) : $signed($signed(({reg71, (8'h9e)} ?
                      wire69 : $signed(wire58)))));
              reg78 <= $signed((($signed($signed(wire67)) ?
                      (^wire69[(2'h2):(1'h1)]) : (wire70[(2'h2):(2'h2)] <= {wire59,
                          wire55})) ?
                  $signed((8'h9c)) : reg72));
            end
          reg79 <= $unsigned(wire63);
          if ((wire69 <= ($unsigned(reg79) <= wire59[(1'h0):(1'h0)])))
            begin
              reg80 <= ((!(^$unsigned((8'hba)))) ?
                  {($unsigned($signed(reg78)) && wire57)} : $signed((wire58 ^ $signed($signed(wire64)))));
            end
          else
            begin
              reg80 <= (($signed((8'hbe)) << (~((reg75 ~^ wire55) ?
                      ((8'hbc) ? (8'hb5) : wire70) : (wire68 ^~ wire70)))) ?
                  (((wire61[(4'hb):(3'h6)] < wire64[(4'h9):(3'h5)]) ~^ reg80[(4'h9):(1'h0)]) && $signed({(&wire68),
                      (reg74 & reg74)})) : $unsigned(reg77));
              reg81 <= ($signed({wire67[(3'h6):(2'h2)],
                      $signed($unsigned((8'hb0)))}) ?
                  $unsigned(({(^wire68)} ?
                      $unsigned((wire61 >= reg79)) : reg78[(2'h3):(2'h3)])) : (~&{$unsigned(((8'hb4) ?
                          (8'ha7) : reg73)),
                      (reg71 >= wire59)}));
              reg82 <= ((wire55[(3'h5):(1'h1)] ^ $unsigned($signed(reg71[(5'h11):(3'h5)]))) ?
                  (reg79 != (wire62[(1'h0):(1'h0)] ?
                      $signed($signed((8'hae))) : (+wire59[(1'h1):(1'h0)]))) : $unsigned($signed((|(~^(8'hb0))))));
              reg83 <= wire58[(2'h2):(1'h1)];
            end
        end
    end
  assign wire84 = (((8'hac) ?
                          (((-wire65) < wire63[(2'h3):(2'h3)]) < reg79[(4'h9):(1'h1)]) : (&reg76)) ?
                      $unsigned(wire61) : wire56[(4'h9):(3'h4)]);
  assign wire85 = {wire55};
  assign wire86 = wire60[(3'h6):(2'h3)];
  assign wire87 = ($signed($unsigned($signed($signed(wire62)))) > (-($unsigned({wire57}) <<< {reg72[(1'h1):(1'h0)]})));
  assign wire88 = ($unsigned(((+$signed(wire64)) - {{reg75, reg81},
                          (wire67 ^~ wire86)})) ?
                      $signed({(~^(8'hab)),
                          (+$unsigned((7'h43)))}) : {(wire68[(2'h2):(1'h1)] != (wire60 ?
                              wire68 : reg82)),
                          (reg77 >> ((wire86 ^ (8'ha7)) ?
                              (reg73 ? wire60 : wire64) : ((8'ha3) ?
                                  reg80 : (8'hba))))});
endmodule

module module20
#(parameter param50 = (({{(!(7'h42))}, (((8'hb5) >> (8'hb4)) && ((8'hb3) <= (8'hb3)))} <= {{(~(7'h41)), (~|(8'hb4))}}) ? (((&(~&(8'hae))) >= (-(~(7'h41)))) ? ((~|(^(8'hb8))) < (&(&(8'hae)))) : (((-(8'ha1)) & ((8'ha2) && (8'hab))) > {((8'ha8) || (8'hbb)), (7'h43)})) : (((((8'haa) << (8'hbd)) ? {(7'h42)} : (!(8'h9c))) != (((8'haa) ? (7'h41) : (7'h40)) ? ((8'hb8) ? (8'hba) : (8'hbb)) : {(8'hba)})) >>> (+(((7'h41) ? (7'h44) : (8'hb8)) ? {(7'h44)} : ((8'hb7) & (8'hab)))))), 
parameter param51 = (8'hb8))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire24;
  input wire [(5'h15):(1'h0)] wire23;
  input wire [(2'h3):(1'h0)] wire22;
  input wire [(2'h2):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire25;
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire36,
                 wire25,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
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
                 (1'h0)};
  assign wire25 = {(wire23[(5'h14):(2'h2)] ?
                          $unsigned({{wire24}}) : (^~(!$unsigned(wire22)))),
                      ($signed(((~^wire23) ? (+wire21) : (wire22 ^~ wire21))) ?
                          (($signed(wire22) ~^ {wire21}) ?
                              $signed((8'hb6)) : (8'ha4)) : $unsigned(((wire24 ?
                                  wire22 : wire24) ?
                              wire21[(2'h2):(2'h2)] : $signed(wire23))))};
  always
    @(posedge clk) begin
      reg26 <= (~|wire24[(3'h5):(3'h5)]);
      if ($signed((wire25[(3'h4):(2'h3)] ?
          (+$unsigned(wire25[(3'h4):(2'h3)])) : ((&$signed(wire25)) ?
              wire24[(3'h6):(2'h3)] : $unsigned((8'hbe))))))
        begin
          reg27 <= wire21[(2'h2):(1'h0)];
          reg28 <= wire24;
          if ($unsigned(reg26[(2'h2):(2'h2)]))
            begin
              reg29 <= reg28;
            end
          else
            begin
              reg29 <= wire24;
            end
          reg30 <= ($signed(($signed((~&reg27)) ?
              $signed($unsigned(reg27)) : {(wire21 ? reg26 : reg26),
                  wire23[(3'h4):(3'h4)]})) > reg27[(2'h2):(1'h0)]);
          reg31 <= wire23;
        end
      else
        begin
          if (({(8'hb0), wire25} << (($signed((~^reg28)) ?
                  ((wire21 ^~ wire25) << $unsigned(reg28)) : {$unsigned(wire23)}) ?
              {$signed((wire21 ?
                      wire23 : wire23))} : $unsigned(wire23[(4'hf):(4'hf)]))))
            begin
              reg27 <= ((!(&wire22)) >> $unsigned({reg31[(1'h0):(1'h0)]}));
              reg28 <= ((reg29 >= (|wire21[(1'h1):(1'h0)])) && wire24[(2'h2):(1'h1)]);
              reg29 <= $unsigned($signed({$unsigned(((8'hb2) ?
                      reg28 : (8'hb1))),
                  reg28}));
              reg30 <= wire21;
              reg31 <= (-(8'ha9));
            end
          else
            begin
              reg27 <= $unsigned($unsigned(wire22));
              reg28 <= wire22;
              reg29 <= $signed({(!{wire24})});
              reg30 <= {(|(8'hbd)), $unsigned((8'hae))};
            end
          reg32 <= $signed(($unsigned((~wire24[(4'h9):(3'h6)])) ?
              {($unsigned((8'h9d)) ?
                      $signed(reg27) : ((8'haf) ~^ reg28))} : (wire24[(4'ha):(3'h6)] > ((~wire25) ?
                  (^wire22) : (8'ha0)))));
        end
      reg33 <= ($signed(reg32) ^ reg31[(1'h1):(1'h0)]);
      reg34 <= ({wire22[(1'h0):(1'h0)]} ?
          wire25[(4'h8):(3'h4)] : $unsigned(wire21[(1'h1):(1'h0)]));
      reg35 <= reg31[(2'h2):(1'h0)];
    end
  assign wire36 = wire22;
  always
    @(posedge clk) begin
      reg37 <= (!wire21[(1'h1):(1'h1)]);
      if (((!reg28) - wire21[(1'h1):(1'h1)]))
        begin
          if ({{reg34}, $signed((8'hb3))})
            begin
              reg38 <= (((&$unsigned(reg29)) && reg32) ^ (((|wire22) ?
                  (reg32[(4'hb):(4'h8)] ?
                      (reg26 ? reg33 : wire22) : ((7'h43) ?
                          (8'ha1) : wire25)) : $signed(wire23[(5'h10):(3'h5)])) - $signed($signed((reg34 ?
                  reg35 : wire23)))));
            end
          else
            begin
              reg38 <= (wire22 ? {reg35[(4'ha):(2'h2)]} : {reg28});
              reg39 <= reg27[(2'h2):(2'h2)];
              reg40 <= {$unsigned(((8'h9c) - $signed(reg30))),
                  ((&($signed(reg28) ^~ (~&reg30))) ?
                      ((~^(&reg28)) ?
                          (+$signed(reg34)) : reg28[(2'h2):(2'h2)]) : ((&reg35) | reg39[(4'ha):(3'h6)]))};
              reg41 <= ((wire21[(2'h2):(1'h1)] == wire21) ?
                  $signed(reg28) : (($unsigned(reg39) ?
                          ($signed(wire36) == ((7'h42) ?
                              reg27 : reg33)) : ((wire22 ?
                              reg31 : reg37) ^ (-reg37))) ?
                      (reg29 * (reg30[(3'h7):(3'h5)] ?
                          $signed(reg31) : $unsigned((8'hbe)))) : (reg34[(4'he):(4'hd)] * $unsigned($signed(reg35)))));
            end
          reg42 <= reg38[(3'h4):(1'h0)];
        end
      else
        begin
          reg38 <= ((({$signed(reg35)} >= $signed((reg41 ? reg39 : wire24))) ?
                  reg30[(4'h9):(2'h3)] : ($unsigned((reg27 - reg32)) ?
                      reg40 : (~&(|wire25)))) ?
              reg34[(4'he):(4'he)] : {$unsigned(((reg27 > reg42) ?
                      (reg35 ? reg33 : reg41) : (reg28 ? reg33 : reg27)))});
          reg39 <= reg37;
          reg40 <= ($unsigned(reg29) > ((((-reg37) >> reg41[(4'hb):(2'h3)]) ?
              reg38[(3'h7):(3'h4)] : reg26) ^~ reg32[(2'h2):(2'h2)]));
        end
      reg43 <= reg29[(4'he):(3'h4)];
      reg44 <= wire22;
      reg45 <= {$unsigned(reg41[(2'h2):(1'h1)])};
    end
  assign wire46 = ((8'hb9) ?
                      ((({reg32} ?
                              reg39 : $unsigned(reg30)) << reg34[(4'h9):(3'h5)]) ?
                          $signed({reg32[(4'ha):(1'h1)],
                              $unsigned(reg40)}) : $signed($signed(((8'hb9) || reg35)))) : $signed(reg38[(4'hb):(4'ha)]));
  assign wire47 = reg28[(3'h4):(1'h1)];
  assign wire48 = $unsigned($unsigned({$signed((+reg44)),
                      {(reg30 ? reg27 : reg30), $signed(reg27)}}));
  assign wire49 = wire48[(2'h2):(1'h1)];
endmodule
