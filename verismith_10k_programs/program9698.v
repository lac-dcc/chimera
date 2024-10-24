module top
#(parameter param125 = (|{({((8'h9d) >= (8'ha9))} ? (~|(8'ha3)) : (((8'hbd) || (8'ha0)) + (+(8'ha3))))}), 
parameter param126 = (((|(!(param125 ? (8'hae) : param125))) >>> (~&((param125 || param125) | param125))) & (&(~&((!param125) ? (&param125) : (~|(8'ha8)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire109;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(5'h13):(1'h0)] reg115 = (1'h0);
  reg signed [(4'he):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  assign y = {wire111,
                 wire109,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $signed(((((wire3 ? wire4 : wire1) ?
                     (~wire0) : (wire3 ?
                         wire1 : wire1)) < (&$signed((8'ha4)))) >> $unsigned(wire0)));
  assign wire6 = (7'h41);
  assign wire7 = $unsigned((!((wire6 > (wire3 ?
                     wire3 : wire0)) != ($signed(wire1) ?
                     wire3 : (wire5 == wire3)))));
  assign wire8 = wire2;
  assign wire9 = $signed((+wire1[(1'h0):(1'h0)]));
  assign wire10 = ($signed($signed(wire1[(1'h1):(1'h0)])) ?
                      (7'h40) : ((~|(wire0[(4'ha):(2'h2)] * ((8'hae) <= wire0))) ?
                          $unsigned(wire9[(4'ha):(1'h0)]) : wire5));
  assign wire11 = $unsigned({$signed(({wire8} > (|wire3))),
                      ((wire8 != (wire3 ? (8'hb5) : wire5)) ?
                          wire4[(4'ha):(4'h8)] : (~|(wire10 << wire4)))});
  module12 #() modinst110 (.wire15(wire2), .y(wire109), .wire14(wire3), .wire13(wire4), .wire16(wire11), .clk(clk));
  assign wire111 = wire0[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg112 <= (wire6 ?
          (wire7 + (wire1[(1'h1):(1'h1)] && ($signed(wire2) ?
              wire0[(3'h6):(3'h6)] : {(8'hb2)}))) : ((!wire4) < $unsigned($unsigned(wire111))));
      reg113 <= (~$unsigned((($unsigned((8'ha1)) << (!(8'ha8))) ?
          (wire9[(3'h4):(2'h2)] ?
              $signed(wire109) : wire111) : {$signed(wire109), wire5})));
      reg114 <= (&((8'ha3) ?
          ((-$signed(wire109)) >= $signed($signed(wire7))) : wire109[(3'h4):(1'h0)]));
      reg115 <= (&(8'ha2));
      reg116 <= wire9[(4'ha):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg117 <= wire4;
      if (wire6[(3'h4):(2'h3)])
        begin
          reg118 <= (wire9[(1'h0):(1'h0)] ?
              ($unsigned(wire6) ?
                  $signed((~|(reg113 ? reg115 : wire7))) : ({wire8,
                          (wire3 ? wire8 : wire3)} ?
                      ((!wire8) ?
                          (reg114 ?
                              (8'ha9) : reg115) : (^~wire1)) : $unsigned(wire1[(1'h0):(1'h0)]))) : $signed({(-{wire9,
                      reg115})}));
          reg119 <= ($unsigned((|$unsigned((wire4 ?
              wire2 : reg116)))) > (^~wire10));
          if (wire111[(4'h9):(2'h2)])
            begin
              reg120 <= wire10;
              reg121 <= wire109;
              reg122 <= (^~(reg119 ?
                  wire111[(5'h12):(4'hf)] : ($signed($signed(reg118)) ?
                      ({wire111, reg114} ?
                          $signed(reg121) : reg118[(2'h3):(2'h3)]) : reg120)));
              reg123 <= wire109;
            end
          else
            begin
              reg120 <= reg119[(3'h4):(3'h4)];
            end
          reg124 <= $signed(wire7[(3'h5):(1'h0)]);
        end
      else
        begin
          reg118 <= reg119;
          if ($unsigned(reg123[(3'h6):(1'h0)]))
            begin
              reg119 <= $signed((7'h43));
              reg120 <= ((8'ha1) ?
                  (&{reg120, (^(~|reg120))}) : $signed($signed(reg122)));
              reg121 <= $unsigned((^~(($unsigned(wire11) ?
                      wire109[(3'h7):(3'h4)] : $signed(reg120)) ?
                  $unsigned(reg118) : {(~&reg114)})));
              reg122 <= $signed(reg118);
              reg123 <= reg116;
            end
          else
            begin
              reg119 <= reg114;
            end
          reg124 <= $signed($unsigned($unsigned($signed(reg116[(2'h3):(1'h1)]))));
        end
    end
endmodule

module module12
#(parameter param108 = (~&(&({((8'ha2) ? (8'ha5) : (8'ha4)), ((8'h9d) ? (8'ha1) : (8'hbe))} ? ((-(8'hb0)) <= ((8'hb8) <= (8'ha5))) : (8'hbc)))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire16;
  input wire [(2'h3):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire14;
  input wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire103;
  wire [(4'hb):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire17;
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire100,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire47,
                 wire45,
                 wire18,
                 wire17,
                 reg49,
                 (1'h0)};
  assign wire17 = ($signed($signed({{(8'hb6)}})) ?
                      ({((+wire14) ? (~^wire14) : {wire16}),
                              $signed(((8'haf) ? (8'hbf) : wire14))} ?
                          ((^~$unsigned((8'ha0))) & wire15[(2'h2):(2'h2)]) : ((^~$signed(wire13)) ^~ ((wire15 >= (8'hb7)) ?
                              (wire13 ?
                                  wire15 : (8'h9d)) : (wire14 >> wire14)))) : ($signed((-(~&wire13))) ?
                          ((wire14[(4'hf):(2'h3)] == wire14[(1'h1):(1'h0)]) && ({wire14} >> $signed(wire16))) : {($unsigned(wire14) ?
                                  (-(8'hab)) : (wire14 ? (7'h41) : wire15)),
                              $signed((wire14 ? wire16 : (8'hb0)))}));
  assign wire18 = $unsigned(wire14);
  module19 #() modinst46 (wire45, clk, wire18, wire14, wire17, wire13);
  assign wire47 = ($unsigned((^wire18)) ?
                      (|(+wire45[(4'hc):(4'hb)])) : {wire18});
  assign wire48 = (&$unsigned({wire16}));
  always
    @(posedge clk) begin
      reg49 <= ($signed((((&wire16) & $signed(wire47)) ?
              (~&((8'hac) ? wire15 : (8'hab))) : {(wire13 ?
                      wire47 : wire15)})) ?
          $unsigned((^(&(^wire15)))) : $unsigned((((wire15 >>> (8'hbf)) * wire17) ?
              ((~wire45) ?
                  (wire48 ? wire48 : wire16) : {wire14,
                      (8'ha0)}) : $signed(wire47))));
    end
  assign wire50 = $signed(($unsigned($unsigned(((8'h9c) ? wire18 : reg49))) ?
                      (wire13 ?
                          wire15 : (wire14 ?
                              wire17[(3'h5):(1'h0)] : (-wire14))) : wire13[(3'h5):(3'h5)]));
  assign wire51 = {$unsigned(wire15[(2'h2):(1'h1)])};
  assign wire52 = $unsigned(($signed(wire13) >>> wire18[(2'h3):(2'h3)]));
  module53 #() modinst101 (wire100, clk, wire47, wire45, wire48, wire51, reg49);
  assign wire102 = ({((|$signed(wire48)) || wire51[(2'h2):(1'h0)])} ?
                       wire45[(4'hb):(2'h2)] : ((~|wire14) ?
                           ({(|wire14),
                               {wire17, wire100}} << wire52) : wire45));
  assign wire103 = ({(8'ha0),
                       $unsigned({(~|wire100),
                           (+wire47)})} != {$signed((^~$unsigned(wire50))),
                       $signed(($unsigned(wire17) | wire52[(1'h0):(1'h0)]))});
  assign wire104 = $unsigned($signed((7'h44)));
  assign wire105 = (~|wire103);
  assign wire106 = $unsigned($unsigned((wire17[(4'h9):(4'h8)] ^~ (wire104 ?
                       {(8'hb8), (7'h41)} : $unsigned(wire103)))));
  assign wire107 = $signed(wire100[(4'hd):(2'h3)]);
endmodule

module module53  (y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire58;
  input wire signed [(4'hb):(1'h0)] wire57;
  input wire [(5'h11):(1'h0)] wire56;
  input wire [(3'h4):(1'h0)] wire55;
  input wire [(2'h3):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire99;
  wire [(4'hb):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire96;
  wire signed [(3'h6):(1'h0)] wire95;
  wire signed [(5'h15):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  reg signed [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
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
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire58)
        begin
          reg59 <= (&$unsigned({$unsigned($unsigned(wire56)),
              ((wire57 == (7'h42)) || wire57)}));
          reg60 <= reg59[(2'h3):(1'h1)];
        end
      else
        begin
          reg59 <= reg59[(1'h0):(1'h0)];
          if ({(wire58[(3'h5):(1'h1)] ?
                  (wire55 ?
                      wire58[(4'hc):(3'h4)] : $signed(((8'hb1) ?
                          wire54 : (8'ha9)))) : wire58)})
            begin
              reg60 <= wire57[(3'h7):(3'h5)];
              reg61 <= wire54;
              reg62 <= ((!$unsigned(reg60)) == (^wire56));
              reg63 <= (|$unsigned(reg59[(4'h8):(2'h3)]));
            end
          else
            begin
              reg60 <= wire55[(1'h0):(1'h0)];
              reg61 <= $signed(wire55[(2'h2):(2'h2)]);
            end
          reg64 <= $unsigned(((($unsigned(wire58) ?
              reg62[(1'h0):(1'h0)] : $unsigned(reg63)) << $unsigned(wire54)) >> ($unsigned($signed(reg62)) * reg59)));
          reg65 <= (8'hbd);
        end
      reg66 <= reg62[(1'h0):(1'h0)];
      reg67 <= $signed((~^({wire57[(2'h2):(1'h0)],
          $unsigned(wire58)} * {wire55[(2'h2):(1'h1)]})));
    end
  assign wire68 = reg62;
  assign wire69 = wire54[(2'h2):(1'h1)];
  assign wire70 = {$unsigned((8'hbd))};
  assign wire71 = wire56[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg72 <= $signed($signed((-((reg64 ? reg63 : reg67) ?
          (8'haa) : wire56))));
      reg73 <= $signed({$signed(reg64)});
      reg74 <= (wire57[(3'h5):(2'h3)] ?
          $signed($unsigned((wire69[(4'he):(1'h1)] ?
              $unsigned(reg61) : $unsigned((8'hbf))))) : ((+$unsigned($signed(wire58))) ?
              (~&(~|{wire54})) : $signed(reg65[(3'h4):(1'h0)])));
      if (reg61)
        begin
          reg75 <= ($unsigned((+reg64[(5'h10):(4'hc)])) >>> reg65[(3'h4):(3'h4)]);
          reg76 <= $signed((~^(((reg63 & (8'ha4)) ^ (reg62 >= reg62)) > $signed((reg64 == wire68)))));
          reg77 <= $unsigned((&{$unsigned(wire58[(5'h11):(4'h9)])}));
          reg78 <= ($signed($unsigned(reg75)) ?
              {(^wire56),
                  reg59[(2'h3):(1'h1)]} : {(((8'hba) >= (wire71 << wire68)) ?
                      (8'hac) : $unsigned((!reg76))),
                  {$unsigned($signed((8'hb3)))}});
          reg79 <= $unsigned((^~$signed((~reg65))));
        end
      else
        begin
          if (wire68)
            begin
              reg75 <= (8'hac);
              reg76 <= ({{(~&(!reg62)),
                      ($unsigned(reg79) ?
                          reg64 : $unsigned(reg63))}} < {$signed((((8'hb8) ^~ (8'ha1)) ?
                      $signed(reg72) : reg72)),
                  $signed($signed($signed((8'h9c))))});
              reg77 <= (~|((reg79[(1'h1):(1'h1)] >= (wire68 ?
                      wire54 : $unsigned(wire54))) ?
                  (^~$unsigned((^~reg77))) : reg75));
              reg78 <= $unsigned(reg62);
            end
          else
            begin
              reg75 <= (((+(~&{reg73, wire71})) ?
                      $unsigned({((8'hbd) ~^ reg64),
                          $signed(reg60)}) : (($unsigned((8'hb3)) >> (reg73 ?
                          reg66 : wire58)) == (wire71[(2'h3):(2'h3)] ?
                          reg64[(4'hc):(1'h0)] : (wire56 <<< reg72)))) ?
                  (reg79[(3'h5):(1'h1)] == $unsigned(($signed(reg65) ?
                      wire70[(4'ha):(3'h4)] : reg79[(4'h8):(3'h7)]))) : reg75);
            end
          if (($unsigned(reg76) ?
              wire69 : $unsigned($signed(reg61[(2'h2):(1'h1)]))))
            begin
              reg79 <= ($unsigned(reg79) >> (!($signed($unsigned(reg64)) ?
                  $signed((wire71 ?
                      (8'h9f) : reg75)) : ($signed(reg73) <<< (reg64 ^~ (8'ha3))))));
            end
          else
            begin
              reg79 <= wire58;
              reg80 <= $signed($unsigned((-(wire68[(1'h1):(1'h1)] ?
                  wire69[(4'hd):(4'hd)] : $signed(reg65)))));
              reg81 <= (~|$unsigned(reg79));
              reg82 <= reg61;
              reg83 <= reg80;
            end
          if ($signed((-reg74[(3'h4):(2'h2)])))
            begin
              reg84 <= {{($unsigned(wire69) & wire58[(4'hc):(3'h5)])}};
              reg85 <= reg66;
              reg86 <= wire54;
            end
          else
            begin
              reg84 <= $unsigned(reg72);
              reg85 <= reg63;
            end
          if ((((^reg74) != (($unsigned(reg82) ? (!reg73) : reg75) ?
                  ((^~wire57) ? reg63 : reg64) : {(wire68 + wire54)})) ?
              (&((-$signed(reg76)) & reg76[(4'hf):(2'h3)])) : reg66[(1'h1):(1'h0)]))
            begin
              reg87 <= reg59[(3'h4):(1'h0)];
              reg88 <= (reg80[(2'h3):(2'h2)] >>> (&(|$unsigned((reg76 << reg78)))));
              reg89 <= $signed((($signed(reg72[(4'hf):(4'hf)]) ?
                      reg63 : reg79) ?
                  (wire71[(3'h6):(2'h3)] ?
                      reg88 : (&(^wire70))) : ($signed((reg80 << reg84)) ~^ reg66[(1'h0):(1'h0)])));
              reg90 <= (!(~&(((^~reg64) ^~ (wire71 ? reg66 : wire68)) ?
                  $signed($unsigned(reg89)) : ({wire70} >= (wire55 ?
                      wire68 : reg86)))));
            end
          else
            begin
              reg87 <= reg83;
              reg88 <= (~|$unsigned(reg84[(3'h6):(1'h1)]));
              reg89 <= $signed(((~^reg88[(3'h5):(1'h0)]) ?
                  wire58 : (&((&(8'hb0)) ? (reg83 ? reg64 : reg79) : reg76))));
            end
          reg91 <= {(-$signed($unsigned((^~(8'ha5)))))};
        end
      reg92 <= reg79;
    end
  assign wire93 = $signed({((&$signed(reg85)) ?
                          ((wire58 >>> wire70) * (+wire70)) : (8'h9c))});
  assign wire94 = (^$unsigned($unsigned($unsigned($unsigned(reg67)))));
  assign wire95 = ($signed((reg76[(3'h7):(1'h1)] ?
                      (^~(reg91 ? reg87 : reg90)) : ((reg85 ?
                          wire94 : (8'hbb)) || $signed((8'hbb))))) >= $signed($signed(wire71[(5'h10):(4'hd)])));
  assign wire96 = reg86[(3'h4):(2'h2)];
  assign wire97 = (8'ha1);
  assign wire98 = ((+((~&$signed(reg63)) ?
                      (reg84[(3'h6):(2'h3)] ?
                          (wire96 + reg66) : $unsigned(wire58)) : $unsigned((^reg74)))) >>> ((^reg84[(4'hb):(3'h4)]) - (8'h9e)));
  assign wire99 = $signed((!wire97[(3'h7):(1'h1)]));
endmodule

module module19  (y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire [(4'hb):(1'h0)] wire22;
  input wire signed [(2'h3):(1'h0)] wire21;
  input wire signed [(4'h9):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire24 = ($unsigned(wire20) ? wire20 : wire20);
  assign wire25 = wire20;
  assign wire26 = wire22[(4'hb):(4'ha)];
  assign wire27 = (8'hb6);
  assign wire28 = wire24[(2'h2):(1'h1)];
  assign wire29 = (wire26 ? wire27[(3'h7):(1'h1)] : wire26[(4'hb):(4'hb)]);
  assign wire30 = (((~^(!(wire20 == wire20))) >> ((~^wire29[(3'h5):(3'h4)]) ?
                          $unsigned(wire20[(4'h9):(4'h8)]) : wire22[(3'h6):(2'h3)])) ?
                      wire25 : $signed((^wire22)));
  always
    @(posedge clk) begin
      if (wire21)
        begin
          reg31 <= wire25;
          if (wire21)
            begin
              reg32 <= $signed({wire30[(3'h4):(2'h2)],
                  $signed($unsigned((wire22 ? wire28 : wire25)))});
            end
          else
            begin
              reg32 <= (~^(~&$signed(wire25)));
              reg33 <= wire23;
              reg34 <= wire30[(3'h5):(1'h1)];
              reg35 <= (wire21 != ((^~$signed($signed(wire28))) ?
                  ({reg31, (wire30 + wire23)} ?
                      (reg33[(1'h0):(1'h0)] ?
                          $signed((8'h9d)) : $signed(wire30)) : {$signed(wire20),
                          (wire25 == wire27)}) : wire25));
              reg36 <= reg34;
            end
          reg37 <= (^~wire26[(4'h8):(2'h2)]);
          reg38 <= ({{$signed((&wire25)), $signed((wire29 > wire23))},
                  $signed($unsigned(wire28))} ?
              (^$unsigned(((^~wire21) != (reg35 >> reg34)))) : (-$unsigned((^(|reg33)))));
          reg39 <= ((reg38[(1'h1):(1'h0)] ?
                  $unsigned($unsigned(wire30)) : $unsigned($unsigned(reg31))) ?
              ((^$signed(wire20[(3'h4):(3'h4)])) ?
                  (8'hb3) : wire20[(3'h6):(1'h1)]) : ($signed(($signed(reg38) ~^ $signed(reg32))) ?
                  (($signed(reg37) ? reg34 : (^~wire27)) ?
                      $signed(wire30[(3'h4):(1'h0)]) : (!reg35)) : ($signed((reg32 ?
                          wire23 : reg35)) ?
                      (reg32 ?
                          wire21 : wire24) : $signed(wire29[(2'h3):(1'h0)]))));
        end
      else
        begin
          if (wire20)
            begin
              reg31 <= reg34[(2'h2):(1'h1)];
              reg32 <= ((!wire28[(1'h1):(1'h1)]) < {wire21[(2'h3):(1'h1)]});
              reg33 <= (wire23[(4'h8):(1'h0)] < reg34);
              reg34 <= (^($unsigned((+wire30[(2'h2):(2'h2)])) & (~|wire29)));
            end
          else
            begin
              reg31 <= (8'hb5);
              reg32 <= reg31;
              reg33 <= (~&(wire20[(2'h3):(2'h3)] ~^ {$unsigned((reg36 ?
                      wire22 : reg37)),
                  $signed(wire26[(2'h2):(2'h2)])}));
            end
          reg35 <= ((($signed($signed((7'h44))) <= ((reg35 ? wire25 : wire28) ?
                      wire27[(2'h2):(1'h1)] : $signed(reg35))) ?
                  $signed(wire30) : $signed($unsigned($signed(reg31)))) ?
              {reg32, (&reg39[(2'h3):(1'h1)])} : $signed(reg34[(2'h3):(1'h0)]));
          reg36 <= $unsigned((|{((reg34 ? reg31 : wire29) & (8'ha3)),
              (+(|reg36))}));
          if (reg31[(4'h8):(3'h6)])
            begin
              reg37 <= (!wire20[(3'h7):(3'h4)]);
              reg38 <= (wire23 ?
                  ($signed($unsigned($signed(wire30))) ?
                      (wire20 & reg32) : reg32) : reg34);
              reg39 <= (^~({wire22, (8'ha4)} <<< (~{wire23[(4'he):(4'he)],
                  $signed(wire25)})));
            end
          else
            begin
              reg37 <= (reg32[(1'h0):(1'h0)] ?
                  wire27 : (~($unsigned(wire29[(3'h7):(1'h0)]) ?
                      {$signed(wire20)} : {(wire24 & wire26), reg32})));
              reg38 <= (+wire26);
            end
          reg40 <= ($signed((reg33[(3'h6):(1'h0)] ^~ ((^(8'ha9)) ^ reg32[(2'h2):(1'h1)]))) ?
              $signed((8'ha6)) : $signed($unsigned($signed($unsigned(reg31)))));
        end
    end
  assign wire41 = wire28;
  assign wire42 = (^~((~$unsigned(wire23[(4'hb):(2'h3)])) ^~ $unsigned(wire26[(4'hb):(4'h9)])));
  assign wire43 = ((+$unsigned((~&$unsigned((8'ha5))))) ^~ ((~(~reg39)) >= (({wire23,
                      reg35} > wire28) ^~ wire26)));
  assign wire44 = (8'hbb);
endmodule
