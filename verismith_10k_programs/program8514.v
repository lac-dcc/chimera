module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire118;
  wire [(3'h6):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire104;
  wire signed [(4'hc):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire99;
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire19,
                 wire21,
                 wire22,
                 wire99,
                 reg117,
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
                 (1'h0)};
  module5 #() modinst20 (wire19, clk, wire4, wire1, wire0, wire3, wire2);
  assign wire21 = wire2;
  assign wire22 = wire2;
  module23 #() modinst100 (.wire25(wire2), .wire24(wire19), .wire28(wire3), .y(wire99), .wire27(wire22), .clk(clk), .wire26(wire0));
  assign wire101 = ({$unsigned($signed((^~wire2)))} ?
                       ((($unsigned((8'hb1)) ~^ $unsigned((8'haf))) | (+(~&wire0))) == $unsigned((^~(wire22 ?
                           wire0 : wire2)))) : (|(^~((8'ha6) >> wire4[(4'h8):(3'h4)]))));
  assign wire102 = $signed((!(+(^{wire21}))));
  assign wire103 = wire19[(4'he):(4'hc)];
  assign wire104 = (({((8'ha4) ?
                               ((8'hb0) ~^ wire4) : (wire3 ?
                                   (8'haa) : (8'h9f)))} ?
                       ((|wire19) ?
                           wire21 : ($unsigned(wire21) ~^ (wire19 ?
                               wire2 : wire3))) : wire0) ^ wire3[(3'h4):(3'h4)]);
  assign wire105 = wire3[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg106 <= (($signed($signed($signed(wire101))) >> $unsigned($signed($signed(wire1)))) + wire22);
      reg107 <= $unsigned(($unsigned((wire3[(3'h7):(1'h0)] ?
              wire105 : (wire19 && wire19))) ?
          $unsigned(wire0[(4'he):(3'h7)]) : wire21));
      if ({($unsigned($unsigned({wire21, wire21})) ?
              (reg106 != wire22[(3'h5):(1'h1)]) : wire21[(3'h7):(2'h2)]),
          (~|($unsigned($unsigned(wire21)) >>> {reg106, wire22}))})
        begin
          reg108 <= $unsigned((+$signed(($signed(wire1) & reg107[(4'hd):(2'h3)]))));
          if ($unsigned(((((wire22 ? wire99 : wire3) == {wire0,
                  wire99}) >= $unsigned(wire3)) ?
              wire21 : $signed(wire2))))
            begin
              reg109 <= (($unsigned(wire105[(3'h6):(1'h1)]) ?
                      ($unsigned(wire103) >>> ($signed(wire4) ?
                          (wire2 ?
                              wire103 : wire99) : $unsigned((8'ha6)))) : ($unsigned($signed(wire104)) & $signed((reg106 >>> wire19)))) ?
                  $unsigned(wire104) : ($signed(($unsigned((8'hbe)) ^~ (wire4 ?
                      wire103 : wire19))) || $signed((8'hb1))));
              reg110 <= $unsigned((wire104[(1'h0):(1'h0)] ?
                  (8'h9e) : $signed($signed((8'ha7)))));
            end
          else
            begin
              reg109 <= ((((wire104[(3'h5):(1'h1)] ?
                          $unsigned(wire3) : $unsigned(wire19)) ?
                      ({wire3} ?
                          $unsigned(wire19) : ((8'ha0) ?
                              wire2 : wire102)) : wire102) ?
                  ($unsigned({reg108}) - (wire3[(5'h10):(4'hc)] ^~ (+wire103))) : (!$unsigned(wire105))) ^ $signed((~&(^(wire103 >> wire0)))));
              reg110 <= reg110;
              reg111 <= ((~&wire105) >>> $unsigned($unsigned(($signed(wire99) ?
                  ((8'hbb) ^~ wire19) : $unsigned(wire103)))));
            end
          reg112 <= ($signed(wire2[(2'h3):(1'h1)]) & {reg108[(1'h1):(1'h0)],
              ({wire103} | ((reg111 >> wire21) <<< (-wire21)))});
          if ((-({(~^(!(8'hac)))} & {$signed(wire101[(3'h4):(1'h0)]),
              wire21[(4'ha):(4'ha)]})))
            begin
              reg113 <= (|(($signed((-(8'ha8))) < (-wire4)) >= $unsigned(wire104[(3'h4):(2'h2)])));
              reg114 <= ((+wire4[(4'hf):(3'h4)]) ?
                  reg111 : wire4[(4'hc):(4'hc)]);
              reg115 <= $signed(wire103[(2'h2):(2'h2)]);
              reg116 <= wire102[(3'h5):(2'h2)];
            end
          else
            begin
              reg113 <= $signed((~({$unsigned(wire102)} ?
                  $unsigned(reg116) : $unsigned((wire103 ? wire2 : wire105)))));
              reg114 <= $unsigned(($unsigned(wire21[(4'h9):(3'h7)]) ?
                  (((wire19 & wire99) < $unsigned(reg115)) ?
                      wire2 : ({(8'haf)} ?
                          $signed(reg115) : $unsigned(reg108))) : (+reg109[(4'hf):(4'he)])));
            end
          reg117 <= ((wire1[(4'hb):(2'h3)] >> reg111[(1'h0):(1'h0)]) < reg111);
        end
      else
        begin
          reg108 <= ((^wire102[(2'h3):(1'h1)]) & (($signed({wire101, reg106}) ?
                  ({wire21} >= (+wire21)) : $signed($signed(wire19))) ?
              ((+{(7'h43), wire101}) ?
                  reg106 : $unsigned(wire3)) : reg114[(4'ha):(4'h8)]));
        end
    end
  assign wire118 = wire105[(2'h2):(1'h0)];
  assign wire119 = ($unsigned(wire103[(4'ha):(1'h0)]) << (reg117[(1'h0):(1'h0)] & ($signed((7'h42)) != ((wire104 >= (8'hb0)) ?
                       (~|wire3) : $unsigned(wire118)))));
endmodule

module module23
#(parameter param97 = (~^{{(((7'h44) > (8'hba)) ? {(8'ha3)} : ((8'ha6) ? (8'h9f) : (7'h41)))}}), 
parameter param98 = (param97 < ((param97 * (-(param97 ? param97 : param97))) ? (^~(param97 < (param97 ? param97 : param97))) : (((^~param97) ? ((8'h9e) * param97) : (&(8'h9f))) ~^ {(param97 ? param97 : param97)}))))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire28;
  input wire [(5'h12):(1'h0)] wire27;
  input wire [(2'h3):(1'h0)] wire26;
  input wire [(2'h3):(1'h0)] wire25;
  input wire [(2'h2):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  assign y = {wire96,
                 wire87,
                 wire86,
                 wire85,
                 wire75,
                 wire74,
                 wire67,
                 wire66,
                 wire64,
                 wire30,
                 wire29,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire29 = ($signed((^($signed(wire26) ?
                      wire24 : (wire26 * (8'hbb))))) ~^ ((wire27[(2'h2):(1'h1)] ?
                          (~^{(8'ha7), wire24}) : ((^~wire24) ?
                              (wire27 ? (8'hbc) : wire28) : ((8'hb4) ?
                                  wire24 : (8'hb0)))) ?
                      $signed(($signed((8'hbc)) * $unsigned(wire26))) : (wire28 <= (^~$signed(wire26)))));
  assign wire30 = {({(~&wire29[(3'h4):(2'h3)])} ^ ($signed((wire24 ?
                              wire26 : wire26)) ?
                          wire26 : (~^(wire26 <<< wire28))))};
  module31 #() modinst65 (wire64, clk, wire25, wire28, wire29, wire27);
  assign wire66 = (^((-(~^(wire30 & wire25))) >>> ($signed(wire30) ?
                      ((wire64 ?
                          (8'h9d) : wire64) && $signed(wire24)) : $signed(wire24))));
  assign wire67 = (&(($signed(wire29[(2'h2):(1'h0)]) ?
                          ($signed(wire28) <= wire64) : {wire30, (~wire27)}) ?
                      wire28 : ($signed($signed((8'ha1))) << (^~$signed(wire24)))));
  always
    @(posedge clk) begin
      reg68 <= wire26;
      if ((+wire26))
        begin
          reg69 <= ((~&$unsigned((+$signed(wire29)))) + wire27);
        end
      else
        begin
          reg69 <= $unsigned(wire66);
          if ($unsigned(wire67[(1'h1):(1'h0)]))
            begin
              reg70 <= (&$unsigned($signed(($signed(wire28) & reg68))));
              reg71 <= ($signed(wire26) <<< $signed((($signed((8'h9d)) ?
                      (-wire26) : {wire25}) ?
                  {wire30[(1'h0):(1'h0)],
                      (wire30 <= wire26)} : (~|((8'hbd) ~^ wire25)))));
              reg72 <= (-(^~(((wire24 ? wire24 : (8'hb3)) ? wire67 : (|reg69)) ?
                  ($signed(reg70) | reg70) : wire64[(1'h0):(1'h0)])));
            end
          else
            begin
              reg70 <= wire26;
              reg71 <= $unsigned(((+(~&$unsigned((8'ha2)))) ?
                  {$signed((wire27 >> reg68)), reg70[(4'hd):(4'hc)]} : {{wire30,
                          ((8'hbc) ? wire29 : (8'hbf))}}));
              reg72 <= $signed($signed((wire24 ?
                  (~(+wire29)) : $unsigned(wire67))));
              reg73 <= reg68[(3'h5):(2'h2)];
            end
        end
    end
  assign wire74 = (({$signed(reg70[(4'hc):(1'h1)]),
                      wire64} & (&(+$signed(wire64)))) != ($signed($signed((~^reg73))) ?
                      $unsigned(((reg68 * (8'h9f)) * ((8'hb6) ?
                          reg71 : (8'hb4)))) : {(~^reg70[(3'h5):(3'h5)])}));
  assign wire75 = reg72;
  always
    @(posedge clk) begin
      if ((!{(~^wire66[(4'hf):(3'h7)]), {(|$signed(wire25))}}))
        begin
          if (reg68)
            begin
              reg76 <= $signed((~(~|($signed((8'hac)) == wire67))));
              reg77 <= wire27;
              reg78 <= ((wire66[(4'he):(2'h3)] || {($unsigned((8'ha7)) ?
                          reg72 : (&wire26)),
                      $unsigned(wire67)}) ?
                  reg72 : $unsigned(wire29[(4'hd):(3'h4)]));
              reg79 <= wire28[(4'hb):(2'h3)];
              reg80 <= (^~(wire24 ^ reg79));
            end
          else
            begin
              reg76 <= {wire29};
              reg77 <= {$unsigned({$signed(reg76)})};
              reg78 <= $unsigned(($unsigned(($unsigned(reg77) ?
                  (reg80 ? wire27 : wire67) : (|wire29))) >>> (8'hb2)));
              reg79 <= $unsigned(reg77);
              reg80 <= $signed($signed(({$unsigned(reg79)} ?
                  $unsigned(wire30[(2'h2):(1'h0)]) : reg80)));
            end
          reg81 <= $signed(reg76[(2'h2):(1'h0)]);
          reg82 <= wire74;
          reg83 <= ((((~(wire25 ?
                  (8'ha2) : wire27)) - {$unsigned(wire74)}) ^ reg69) ?
              $signed((reg81 ?
                  $unsigned((wire27 || wire28)) : ({wire25, wire25} ?
                      reg77 : (reg69 ?
                          wire75 : (8'hbb))))) : ($unsigned((^~(reg77 ?
                  reg72 : reg71))) || (((^wire25) <<< (wire64 >> reg72)) >>> (((8'hb7) ?
                  wire30 : reg70) << (+wire75)))));
        end
      else
        begin
          reg76 <= (-(!((!(reg82 ? reg81 : wire74)) <<< (&((8'ha8) & reg81)))));
          if ($unsigned(((-$signed($signed(reg73))) ?
              reg68 : ((^$signed(wire28)) >> ($signed(reg69) ?
                  (8'hb8) : $unsigned(reg78))))))
            begin
              reg77 <= $unsigned(((~&reg81) && $signed($unsigned($signed(reg83)))));
              reg78 <= $signed(reg77[(3'h6):(2'h2)]);
              reg79 <= ({{(wire25 || (|reg78))}} ?
                  $unsigned(wire29[(3'h5):(3'h4)]) : (reg81[(5'h13):(4'ha)] ?
                      $signed((reg73[(3'h6):(2'h3)] <= {(8'h9c),
                          reg71})) : reg78[(3'h4):(3'h4)]));
              reg80 <= $signed((7'h44));
              reg81 <= $unsigned(((!(^wire28[(4'hb):(2'h2)])) <= $signed(wire26)));
            end
          else
            begin
              reg77 <= ({{{(wire67 != reg69), $signed(reg79)}},
                  reg72} == {reg70[(3'h7):(3'h4)], wire26});
              reg78 <= (reg69[(4'h9):(3'h4)] ?
                  ($unsigned($signed(wire26[(2'h3):(2'h2)])) <= reg78[(4'hf):(4'hd)]) : (($unsigned($unsigned(reg77)) ?
                      {reg81[(4'hb):(4'h8)], {wire75}} : ($signed(reg82) ?
                          reg73 : (wire24 - wire25))) << (~|$signed($unsigned(reg80)))));
              reg79 <= reg80[(1'h1):(1'h1)];
              reg80 <= wire26;
              reg81 <= reg69[(3'h6):(1'h0)];
            end
        end
      reg84 <= reg80;
    end
  assign wire85 = {{(~(~&wire64[(3'h5):(1'h1)]))}};
  assign wire86 = ((wire24[(1'h1):(1'h1)] ?
                      (({wire29, wire66} ? reg70 : wire75) ?
                          $unsigned((+wire64)) : (wire27 ?
                              $signed(wire64) : {reg81,
                                  wire64})) : (-$unsigned((wire85 ?
                          reg80 : (8'ha1))))) + ($unsigned(((8'ha6) ?
                      ((8'ha7) ?
                          (8'ha3) : reg69) : $unsigned(wire24))) << $signed((reg73 ?
                      $unsigned(wire24) : (^~reg69)))));
  assign wire87 = wire27;
  always
    @(posedge clk) begin
      reg88 <= (+((wire67[(3'h5):(3'h4)] ?
          (wire74 == $unsigned(reg73)) : wire24[(2'h2):(1'h0)]) | (~|reg76[(1'h0):(1'h0)])));
      if (wire74)
        begin
          reg89 <= (wire29[(4'he):(4'hc)] && (&(8'haa)));
          reg90 <= $unsigned($signed($signed(wire86)));
        end
      else
        begin
          reg89 <= wire64;
          reg90 <= ({({{wire29}} ?
                  reg79[(1'h0):(1'h0)] : (^(reg73 ^ wire24)))} < wire66[(4'hd):(4'h9)]);
          if ($unsigned($signed(wire67[(2'h3):(2'h3)])))
            begin
              reg91 <= $signed(($signed((((7'h43) << wire30) ?
                      (wire75 > (8'h9e)) : (-reg83))) ?
                  ($signed($signed(reg79)) ?
                      {(reg78 ?
                              wire24 : (7'h43))} : reg73[(2'h3):(2'h3)]) : reg88));
              reg92 <= (8'h9c);
            end
          else
            begin
              reg91 <= wire29;
              reg92 <= $unsigned(wire26[(1'h1):(1'h1)]);
              reg93 <= (^{$signed({reg73[(4'h8):(3'h5)]})});
              reg94 <= $unsigned((wire67[(3'h5):(2'h2)] ?
                  {(wire30[(1'h0):(1'h0)] ?
                          (8'ha3) : (reg78 ?
                              reg77 : reg91))} : ((8'had) << ((^~reg92) ?
                      $signed(reg93) : $unsigned(reg80)))));
              reg95 <= (~|(&($signed((reg70 ? wire74 : wire66)) ?
                  ((~(8'hac)) || (reg82 + reg68)) : reg73[(4'h8):(1'h0)])));
            end
        end
    end
  assign wire96 = ($unsigned(({(wire27 ? wire67 : reg79), $unsigned(wire85)} ?
                          (|$unsigned(reg69)) : $signed($unsigned((8'hae))))) ?
                      wire26 : $signed(wire75));
endmodule

module module5
#(parameter param18 = ((((^{(8'ha1)}) >> (-((8'hbf) ? (7'h44) : (8'hb6)))) ? ({((8'h9f) ? (8'hae) : (8'haf))} ? (-(~|(8'h9f))) : ((~^(8'ha6)) ? ((8'hbf) ? (8'ha5) : (8'hbd)) : ((7'h43) ? (8'ha1) : (7'h44)))) : ((((8'hb1) ~^ (7'h44)) > {(8'hb4), (8'hab)}) ? ({(8'h9d), (8'ha8)} ? ((7'h41) > (7'h42)) : {(8'hbf), (8'h9e)}) : {((8'hba) <<< (8'h9c))})) ? (8'h9e) : (((^~((7'h43) ^ (8'ha5))) ^~ (((8'hae) & (8'hbf)) ? ((8'hb1) ? (8'ha2) : (8'hba)) : ((8'ha5) >>> (8'ha2)))) ? ((~^{(8'h9c)}) ? (~|(|(8'hbc))) : (((8'hbd) ~^ (7'h40)) ? {(7'h42), (7'h44)} : ((8'ha5) ? (8'ha2) : (8'hbc)))) : (({(8'h9c), (8'ha3)} >> ((7'h40) ? (8'hb5) : (8'hae))) ~^ (!((8'hb6) ~^ (7'h43)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire7;
  input wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  assign y = {wire17, wire16, wire15, wire13, wire12, wire11, reg14, (1'h0)};
  assign wire11 = ($signed($signed($unsigned((wire8 ?
                      wire7 : wire7)))) ^ (wire10[(3'h4):(2'h3)] + $signed(((wire8 > wire6) >= (+wire8)))));
  assign wire12 = ((+(wire6[(1'h0):(1'h0)] ?
                          wire7 : (wire11[(3'h7):(1'h0)] ?
                              (wire7 >> wire7) : wire11[(3'h7):(1'h0)]))) ?
                      (~$signed($unsigned($unsigned(wire6)))) : wire8[(1'h0):(1'h0)]);
  assign wire13 = (8'hb2);
  always
    @(posedge clk) begin
      reg14 <= ((&wire11[(2'h2):(1'h0)]) & wire11[(4'hb):(4'ha)]);
    end
  assign wire15 = $signed(((wire10[(1'h1):(1'h0)] + ($signed(wire11) ?
                          (wire7 ? (8'h9f) : wire13) : wire12)) ?
                      $unsigned({$signed((8'hba)),
                          $signed((7'h42))}) : ($unsigned(reg14) ?
                          wire8 : $signed(wire9[(3'h7):(3'h6)]))));
  assign wire16 = wire12[(1'h0):(1'h0)];
  assign wire17 = $signed($signed((wire7[(1'h0):(1'h0)] ?
                      (((7'h40) + reg14) > (wire9 ?
                          wire7 : wire9)) : $unsigned(wire12[(1'h1):(1'h0)]))));
endmodule

module module31  (y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire35;
  input wire [(4'hf):(1'h0)] wire34;
  input wire signed [(5'h10):(1'h0)] wire33;
  input wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  assign y = {wire63,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire37,
                 wire36,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg49,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire36 = (+(~&wire35[(1'h0):(1'h0)]));
  assign wire37 = ((7'h42) ?
                      (~&$unsigned(wire36)) : (~|(($unsigned(wire32) ?
                          wire33[(3'h4):(1'h1)] : wire32) >= $unsigned(wire34[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg38 <= (((-wire34[(1'h1):(1'h0)]) ?
          ($signed(wire34[(4'ha):(4'h9)]) != wire35) : ($unsigned($unsigned((8'had))) ?
              wire35 : wire32[(2'h2):(1'h1)])) + $signed($unsigned($unsigned(wire33[(4'hc):(4'h8)]))));
      reg39 <= wire37;
      reg40 <= wire35[(2'h2):(2'h2)];
    end
  assign wire41 = reg40;
  assign wire42 = (~|((^~{(wire37 >> wire37)}) ?
                      ((wire33[(4'hf):(2'h2)] ? wire34[(2'h2):(2'h2)] : reg39) ?
                          reg38 : ($unsigned(wire35) ?
                              wire37 : $signed(reg40))) : ((~$unsigned(reg38)) >> (^wire36[(1'h1):(1'h0)]))));
  assign wire43 = (8'ha5);
  assign wire44 = wire37[(4'ha):(4'h9)];
  assign wire45 = (reg38 ?
                      (^~((^(~^wire35)) || wire43[(3'h4):(1'h1)])) : {((!wire36[(3'h5):(3'h4)]) ?
                              (^wire36) : $signed($signed(wire44))),
                          (~|wire43[(3'h4):(2'h2)])});
  assign wire46 = {$signed(reg39)};
  assign wire47 = $unsigned({(&{(8'hb9), (-wire44)}), wire35[(1'h0):(1'h0)]});
  assign wire48 = $signed((wire43[(1'h1):(1'h1)] || reg39));
  always
    @(posedge clk) begin
      reg49 <= wire35[(1'h1):(1'h1)];
    end
  assign wire50 = wire33;
  assign wire51 = wire35[(1'h1):(1'h0)];
  assign wire52 = (wire36[(3'h6):(3'h5)] <<< ($unsigned((&(wire34 ?
                      wire50 : wire44))) ~^ wire50));
  assign wire53 = (8'h9f);
  assign wire54 = wire44;
  assign wire55 = $signed(wire44[(4'h9):(3'h5)]);
  assign wire56 = wire50[(4'h9):(1'h1)];
  always
    @(posedge clk) begin
      reg57 <= (wire32[(2'h3):(1'h0)] ?
          $signed((((wire48 ^ (8'hb9)) ? wire50 : (~&wire41)) ?
              $signed({wire50,
                  wire53}) : $signed(wire41[(3'h5):(2'h2)]))) : (&wire37));
      if (wire42[(1'h0):(1'h0)])
        begin
          reg58 <= (-($signed(wire42[(2'h2):(1'h0)]) || {($signed(wire47) ?
                  $signed((8'haf)) : $unsigned(wire34))}));
          if ($signed((((|(wire33 > wire54)) ?
                  (reg58[(3'h7):(3'h4)] ^~ reg38[(5'h10):(4'hc)]) : $unsigned(wire51)) ?
              $unsigned(((wire47 ~^ reg38) ?
                  $unsigned(wire53) : (|wire51))) : $signed($signed((~^wire55))))))
            begin
              reg59 <= wire45;
            end
          else
            begin
              reg59 <= (!({wire53[(3'h6):(2'h3)]} < {$unsigned({wire44,
                      wire51}),
                  (|$signed(reg38))}));
              reg60 <= $unsigned((wire45[(4'hc):(4'hc)] == (-{(wire37 ?
                      wire35 : wire33)})));
              reg61 <= wire51[(4'h9):(3'h5)];
            end
        end
      else
        begin
          reg58 <= (^(^~(8'h9e)));
          reg59 <= ($signed($unsigned({(&wire41)})) >> wire32[(1'h0):(1'h0)]);
          reg60 <= wire44[(4'hc):(3'h4)];
          reg61 <= (7'h42);
        end
      reg62 <= wire54[(3'h5):(3'h5)];
    end
  assign wire63 = reg61;
endmodule
