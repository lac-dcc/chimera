module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire126;
  wire signed [(4'hf):(1'h0)] wire125;
  wire [(5'h13):(1'h0)] wire124;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire112;
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg115 = (1'h0);
  reg signed [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire5,
                 wire11,
                 wire112,
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
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 (1'h0)};
  assign wire5 = wire1[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg6 <= wire0[(1'h1):(1'h0)];
      reg7 <= $unsigned($unsigned($signed(wire2)));
      reg8 <= {{$unsigned({(!wire1)})}, (|(8'ha3))};
      reg9 <= ((wire1 || wire5[(1'h0):(1'h0)]) > (~$unsigned($signed(wire3))));
      reg10 <= wire0;
    end
  assign wire11 = ((~^reg8[(2'h3):(1'h1)]) ^ reg7);
  module12 #() modinst113 (wire112, clk, wire2, wire0, reg10, wire11);
  always
    @(posedge clk) begin
      if (((~(^~{{reg7}, wire11[(2'h2):(1'h1)]})) ?
          (~&(wire2 == wire11[(3'h6):(1'h0)])) : (~^wire1[(3'h7):(3'h5)])))
        begin
          reg114 <= ((reg10 ?
                  ({wire4[(1'h1):(1'h1)], (+reg10)} - {(wire1 ? wire2 : wire11),
                      $unsigned((8'hbb))}) : {wire2,
                      (reg6 ? wire2 : reg10[(1'h0):(1'h0)])}) ?
              $signed(($unsigned((wire11 ?
                  (8'hb8) : wire5)) & wire3[(2'h2):(1'h1)])) : wire112);
        end
      else
        begin
          if ($unsigned(wire112[(3'h5):(1'h1)]))
            begin
              reg114 <= $unsigned(({($unsigned(wire5) * $signed(reg10)),
                      ($unsigned(reg10) ? wire3 : (reg114 ^~ wire1))} ?
                  ($signed((reg6 ?
                      reg6 : reg10)) ~^ wire3[(4'hd):(4'h8)]) : (wire0[(4'h8):(4'h8)] ^ $unsigned($unsigned(reg6)))));
              reg115 <= wire1[(4'ha):(3'h4)];
              reg116 <= (~^reg9[(3'h4):(3'h4)]);
            end
          else
            begin
              reg114 <= (~&((((reg10 & wire2) ? (reg116 != reg6) : reg6) ?
                      ((wire2 * reg7) ?
                          (~^wire112) : $signed(wire11)) : $unsigned((reg116 ?
                          (8'haf) : wire5))) ?
                  (~^reg7) : reg10[(1'h1):(1'h0)]));
            end
          reg117 <= wire4[(1'h0):(1'h0)];
          reg118 <= (+(reg9[(2'h2):(1'h1)] >= (((8'hbf) ?
                  $signed(wire3) : wire0) ?
              {(wire112 < reg116), (~^wire4)} : wire4[(1'h1):(1'h1)])));
          reg119 <= {{($unsigned(wire112[(3'h6):(2'h3)]) ?
                      reg115[(1'h0):(1'h0)] : $unsigned((wire2 ?
                          reg116 : reg116)))},
              reg117};
        end
      reg120 <= {$unsigned((^~$unsigned((~wire2)))), reg6[(2'h3):(1'h1)]};
      reg121 <= (!(((7'h43) && ((~wire5) ?
              (reg7 ? reg118 : reg114) : (~reg9))) ?
          $signed(wire4) : ($unsigned(((8'ha6) ? (8'hbc) : reg8)) ?
              $unsigned({wire11, wire1}) : reg118[(4'ha):(4'h9)])));
      reg122 <= ($unsigned(wire2) ?
          $unsigned(reg120) : (~&(-reg117[(4'h9):(4'h8)])));
      reg123 <= wire5[(1'h1):(1'h1)];
    end
  assign wire124 = wire11;
  assign wire125 = $unsigned(((^reg115) != (reg116[(1'h1):(1'h0)] >> $signed(wire3[(4'hb):(4'h9)]))));
  assign wire126 = reg10[(1'h1):(1'h1)];
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire16;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire signed [(2'h3):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire98;
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire47,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire49,
                 wire98,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= ($unsigned((7'h44)) < wire14[(1'h0):(1'h0)]);
      if ($signed($unsigned($signed(($unsigned(wire13) >= reg17[(4'he):(4'ha)])))))
        begin
          reg18 <= wire16;
        end
      else
        begin
          reg18 <= (wire13[(2'h3):(1'h1)] * (wire14[(1'h0):(1'h0)] << (($signed(wire16) ?
                  (^~wire14) : (wire14 && wire14)) ?
              ((reg18 ? reg17 : wire16) ?
                  $unsigned(reg17) : {wire15, wire15}) : wire16)));
          if ($unsigned(((~&(8'hb4)) || ((reg17[(5'h11):(4'h8)] != (+wire16)) && $unsigned({wire16})))))
            begin
              reg19 <= wire16[(4'hb):(4'h9)];
              reg20 <= reg17[(3'h5):(1'h0)];
            end
          else
            begin
              reg19 <= (!$signed(wire14[(1'h0):(1'h0)]));
              reg20 <= ((((~&$signed((8'ha1))) != reg18[(3'h7):(3'h7)]) + {(reg17[(2'h3):(2'h3)] ?
                      $signed(reg17) : $unsigned((8'hb3))),
                  (-(reg20 ? reg18 : reg18))}) ~^ reg17[(3'h7):(2'h2)]);
            end
        end
    end
  assign wire21 = {$signed($unsigned($signed(wire13[(1'h0):(1'h0)]))),
                      ((reg18[(5'h15):(3'h5)] >> ((reg17 <= reg18) ?
                          wire14 : (~&wire15))) + $unsigned({wire15[(4'h8):(2'h2)]}))};
  assign wire22 = (~(~&$unsigned((wire16[(2'h2):(1'h0)] ?
                      (reg18 ? (8'hbf) : wire13) : (wire15 ?
                          reg20 : wire16)))));
  assign wire23 = $signed(($unsigned({(!wire15), $signed(reg18)}) ?
                      wire15[(1'h0):(1'h0)] : {$unsigned({reg17}),
                          ($signed(wire21) ? reg20[(1'h0):(1'h0)] : reg18)}));
  assign wire24 = (~^reg20[(1'h0):(1'h0)]);
  assign wire25 = $unsigned($unsigned((7'h40)));
  assign wire26 = (reg17 ?
                      {$unsigned($unsigned({wire25}))} : (((^~wire22) ?
                              (+(|wire25)) : (wire25 ?
                                  wire13[(1'h0):(1'h0)] : (&wire23))) ?
                          $unsigned(reg17) : reg19));
  assign wire27 = (wire22 ?
                      reg18 : ((+reg18[(4'hd):(4'ha)]) ?
                          reg18[(5'h14):(5'h13)] : $signed($unsigned($unsigned((8'hbd))))));
  assign wire28 = (($unsigned($unsigned(reg17)) ?
                      ($signed($unsigned(wire15)) >= {$unsigned(wire16),
                          reg19}) : ({(!wire23)} | ($unsigned(wire15) ?
                          {wire26} : $signed(wire22)))) - $signed((!$signed({wire24}))));
  module29 #() modinst48 (wire47, clk, wire15, reg17, wire24, wire16);
  assign wire49 = ($signed(wire13[(4'h8):(4'h8)]) ?
                      (reg19[(1'h0):(1'h0)] ?
                          wire25[(1'h0):(1'h0)] : $signed($signed($signed((8'h9d))))) : {(+wire22),
                          (~^wire14[(2'h2):(2'h2)])});
  module50 #() modinst99 (wire98, clk, wire21, wire49, wire25, reg18);
  assign wire100 = $unsigned(wire15[(1'h1):(1'h0)]);
  assign wire101 = ($unsigned((&reg17)) * (wire24[(3'h6):(3'h6)] ^~ $signed($signed($signed(reg17)))));
  assign wire102 = ({(($signed(wire47) ? wire23 : $signed(wire21)) ~^ (8'hb0)),
                           wire15} ?
                       wire24 : (~^(((~|wire25) ?
                           (-(8'hb9)) : wire101) ~^ $signed((8'hb0)))));
  always
    @(posedge clk) begin
      reg103 <= (reg19 != ((^~wire16[(4'hd):(3'h4)]) - (-wire21)));
      if (wire98[(1'h0):(1'h0)])
        begin
          reg104 <= ((&$signed((wire23 ^~ wire102))) ?
              wire100 : ((&($signed((8'hb6)) ?
                      {wire26, wire21} : $signed(wire16))) ?
                  wire26[(3'h6):(3'h6)] : (((8'hb8) ?
                      wire13[(2'h3):(2'h2)] : (~^wire24)) <= ($signed((8'hbc)) ?
                      $unsigned(wire102) : (reg17 ? wire23 : wire102)))));
        end
      else
        begin
          reg104 <= wire26[(1'h1):(1'h0)];
          reg105 <= (($unsigned(wire49) ~^ $unsigned(reg18[(4'hf):(3'h6)])) == {(((wire15 > wire28) ?
                  $signed(reg103) : wire16[(4'h9):(3'h6)]) << ({wire100} ~^ (wire98 == wire100)))});
          reg106 <= (~^($unsigned((~&((8'had) <= wire21))) > $unsigned(wire101)));
        end
      reg107 <= $signed((wire25[(1'h0):(1'h0)] ?
          (~|{(wire26 ? reg105 : wire98)}) : $unsigned($signed((+wire15)))));
      if (wire28[(4'hd):(3'h6)])
        begin
          reg108 <= reg107[(4'ha):(2'h3)];
          reg109 <= reg108;
        end
      else
        begin
          reg108 <= wire14;
          reg109 <= {((^reg19[(4'h9):(1'h0)]) ?
                  reg107[(4'hf):(4'hc)] : wire26)};
          reg110 <= wire47[(1'h0):(1'h0)];
          reg111 <= {reg110};
        end
    end
endmodule

module module50  (y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h1a9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire54;
  input wire signed [(5'h12):(1'h0)] wire53;
  input wire signed [(2'h2):(1'h0)] wire52;
  input wire [(4'hf):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire signed [(2'h3):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire85;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire75;
  wire signed [(3'h5):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire55;
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire87,
                 wire86,
                 wire85,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire68,
                 wire55,
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
                 reg70,
                 reg69,
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
                 (1'h0)};
  assign wire55 = ((~&wire52[(1'h1):(1'h0)]) * (^wire51));
  always
    @(posedge clk) begin
      reg56 <= wire54[(2'h3):(1'h1)];
      reg57 <= wire51[(4'hc):(1'h0)];
      reg58 <= {(wire55 ^ $signed($unsigned(wire55[(3'h6):(2'h2)]))),
          reg56[(2'h2):(1'h0)]};
      if ($signed((({(wire54 == reg57), (|reg57)} ?
              (8'hbc) : $signed(((7'h42) ? wire55 : reg56))) ?
          (+{wire55[(3'h6):(2'h2)]}) : (|wire54))))
        begin
          reg59 <= reg58[(2'h2):(1'h1)];
          reg60 <= wire52[(2'h2):(2'h2)];
          reg61 <= ((|$signed((~((8'hb7) + reg59)))) ?
              reg58 : $signed($unsigned((~$signed((8'ha9))))));
          reg62 <= reg61;
          reg63 <= reg60[(5'h12):(3'h5)];
        end
      else
        begin
          reg59 <= (&{reg58[(3'h7):(1'h0)], (!(8'hae))});
          if ((8'h9e))
            begin
              reg60 <= wire53[(4'ha):(3'h4)];
              reg61 <= {reg61[(2'h3):(1'h1)]};
              reg62 <= $signed({($unsigned(wire51[(1'h1):(1'h0)]) - $signed((wire55 ?
                      (8'hbf) : (8'hbf)))),
                  $signed($unsigned($unsigned(reg56)))});
              reg63 <= {({reg60} ?
                      (|{(reg59 | reg60)}) : ((wire54 ?
                              $signed(reg56) : (reg57 ~^ reg60)) ?
                          ($unsigned(reg56) ^ {(7'h44)}) : (((7'h42) ?
                              wire51 : reg61) && (^~reg59))))};
              reg64 <= ((~{$unsigned($signed(wire55)),
                  (^~reg58[(4'h8):(3'h4)])}) <<< (-$unsigned($signed(reg60))));
            end
          else
            begin
              reg60 <= $signed((reg59 ?
                  wire52[(2'h2):(2'h2)] : $unsigned(({wire55,
                      reg63} <<< $signed(reg59)))));
            end
          reg65 <= $unsigned(wire51);
          reg66 <= (reg60 >= $signed($signed(($unsigned(wire53) ^ ((8'hb2) ?
              wire51 : reg57)))));
          reg67 <= ({(^~(wire55[(1'h0):(1'h0)] ? $signed(reg58) : wire52))} ?
              $signed(wire51[(4'hb):(3'h6)]) : {($unsigned($unsigned(reg63)) >= $unsigned(wire53)),
                  reg65});
        end
    end
  assign wire68 = (reg61 ?
                      (|$signed(reg57)) : $signed(($signed((|reg60)) ?
                          reg63[(3'h7):(3'h5)] : ($unsigned(reg63) ?
                              $unsigned(reg57) : $signed(wire53)))));
  always
    @(posedge clk) begin
      reg69 <= wire55[(1'h1):(1'h1)];
      reg70 <= (reg64[(4'h8):(3'h4)] ? reg66 : reg63);
    end
  assign wire71 = reg60;
  assign wire72 = reg64[(3'h6):(3'h6)];
  assign wire73 = wire71[(3'h6):(1'h1)];
  assign wire74 = ($unsigned(wire73[(2'h3):(2'h3)]) ?
                      reg59 : (+(($unsigned(wire72) ?
                          (reg61 <= reg62) : reg66[(5'h13):(4'h8)]) - wire68)));
  assign wire75 = reg70[(2'h3):(2'h2)];
  assign wire76 = (reg66 | (8'h9d));
  assign wire77 = (((((reg59 != reg67) ?
                              (reg64 ? reg56 : reg62) : ((8'hbb) == (8'hb9))) ?
                          {(wire53 ? wire74 : reg64)} : (wire71 ?
                              reg64[(2'h2):(1'h0)] : ((8'hae) || reg56))) ?
                      $unsigned((^~(|reg66))) : $signed(wire51)) <<< (reg63 ?
                      $unsigned(({reg61} << $unsigned(reg64))) : {$unsigned((|wire74))}));
  assign wire78 = {(((!$unsigned(reg64)) == $unsigned((reg63 ?
                          reg56 : reg60))) == ($unsigned(reg62) & reg63[(2'h3):(1'h0)])),
                      $signed($unsigned($unsigned($unsigned(reg65))))};
  always
    @(posedge clk) begin
      if ({(~&wire75)})
        begin
          reg79 <= reg62[(2'h3):(1'h1)];
          reg80 <= reg61;
        end
      else
        begin
          reg79 <= (((reg79[(3'h4):(1'h1)] ?
                  $signed(wire71[(3'h7):(1'h0)]) : ($signed(reg58) ?
                      (^wire72) : (^~reg69))) - {$signed(((8'ha6) ~^ reg59)),
                  ((^wire71) < $signed(wire73))}) ?
              reg61[(3'h7):(3'h7)] : $unsigned((-$signed((^reg60)))));
        end
    end
  always
    @(posedge clk) begin
      reg81 <= (reg80 ?
          ((({reg56, reg62} ? (~^reg70) : {wire74, wire68}) - wire77) ?
              reg57 : (reg65 | {$signed((8'hb8))})) : reg65);
      reg82 <= wire77;
      reg83 <= $signed(reg67[(4'hb):(1'h0)]);
      reg84 <= reg81;
    end
  assign wire85 = (8'h9d);
  assign wire86 = ((reg81[(3'h5):(3'h4)] ?
                      {wire53[(2'h3):(2'h2)]} : (+wire74)) + reg64[(1'h0):(1'h0)]);
  assign wire87 = ($signed({($unsigned(wire51) ?
                          {reg63, wire74} : $signed((8'h9e))),
                      (wire74 ?
                          (wire75 ?
                              wire52 : reg60) : $signed(reg66))}) || wire53[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      if ($signed($signed($signed($unsigned($unsigned(reg70))))))
        begin
          reg88 <= (wire76 >> wire68[(2'h3):(2'h3)]);
          reg89 <= $signed(wire86[(1'h0):(1'h0)]);
          reg90 <= reg67[(1'h1):(1'h0)];
        end
      else
        begin
          reg88 <= $signed((((~^$signed(wire78)) ?
                  ((reg80 ? reg81 : (8'hb6)) ?
                      $unsigned(reg60) : $signed(wire74)) : (wire85 < (~^reg59))) ?
              $signed($unsigned((&wire72))) : $unsigned((~^{wire73, reg57}))));
          reg89 <= wire55;
          reg90 <= (($signed(((reg90 - reg88) ? wire76 : (wire51 ~^ reg69))) ?
                  (^~(-(wire85 > wire85))) : $unsigned(((wire74 <<< reg89) ?
                      ((8'hae) != wire53) : $signed(reg89)))) ?
              (+({$signed(wire75)} == reg61)) : reg64[(3'h6):(1'h1)]);
        end
      reg91 <= $unsigned((~|wire75[(3'h6):(2'h2)]));
      reg92 <= ($signed((~((^reg65) << $signed(wire74)))) ?
          wire86[(2'h3):(1'h1)] : $signed($signed(((reg70 ?
              reg79 : (7'h43)) ^~ $signed(wire71)))));
      reg93 <= {((8'ha3) ~^ ((reg65[(4'h8):(4'h8)] ?
                  (+wire51) : $unsigned(wire77)) ?
              $unsigned((reg62 > (8'hab))) : wire78)),
          {((^(-reg83)) - reg60[(1'h0):(1'h0)]),
              ((wire53[(4'hb):(3'h6)] | (8'hbd)) ^ (~^(+wire76)))}};
    end
  always
    @(posedge clk) begin
      reg94 <= (8'ha7);
    end
  assign wire95 = $unsigned((~(((reg88 ?
                      reg67 : reg70) != (reg89 >> reg80)) + (reg70[(1'h1):(1'h1)] ?
                      {reg81, reg91} : $unsigned(reg67)))));
  assign wire96 = ($signed((((reg80 ? reg91 : (8'ha5)) << (wire87 ?
                          reg90 : wire73)) + $unsigned($signed(wire53)))) ?
                      {(reg58 < wire85),
                          (8'hae)} : $signed(wire74[(2'h3):(1'h1)]));
  assign wire97 = reg90[(2'h3):(2'h2)];
endmodule

module module29
#(parameter param45 = ((8'hb3) ? (((-(&(8'h9e))) && (&((8'hab) < (8'hb5)))) ? (^{((8'hba) ~^ (8'ha6)), {(8'hab), (8'hac)}}) : (~(((8'h9f) ? (8'hb1) : (8'h9c)) ? {(8'hbd)} : {(8'h9c)}))) : (((^{(8'ha2)}) ? (((8'ha9) >= (8'h9f)) <= (8'ha6)) : (((8'ha4) ? (8'ha2) : (8'hb3)) >>> (^~(8'ha9)))) << {{(~^(7'h40))}, ((-(8'hb7)) >>> (|(8'hbc)))})), 
parameter param46 = ((param45 ? (param45 ? param45 : (!(param45 ? param45 : (8'ha0)))) : param45) ? param45 : (param45 ? (~|({(8'ha3), param45} > (param45 ? (8'hbf) : param45))) : param45)))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire33;
  input wire signed [(2'h2):(1'h0)] wire32;
  input wire signed [(5'h11):(1'h0)] wire31;
  input wire signed [(4'h9):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire34 = (($unsigned($unsigned(wire32[(1'h0):(1'h0)])) >= {$signed(wire30[(1'h0):(1'h0)])}) == wire30[(3'h5):(1'h0)]);
  assign wire35 = wire34[(2'h2):(1'h0)];
  assign wire36 = $unsigned($unsigned(wire35));
  assign wire37 = (&wire36[(2'h2):(1'h0)]);
  assign wire38 = wire30[(2'h2):(1'h0)];
  assign wire39 = ((((^(wire33 ? wire38 : wire37)) * wire30) * wire31) ?
                      $signed(wire30[(3'h5):(3'h5)]) : (($unsigned(((8'hbf) >> wire37)) | ((wire36 ^ (8'hae)) ?
                              wire38[(1'h0):(1'h0)] : $unsigned(wire34))) ?
                          $unsigned(($unsigned(wire31) <<< wire37)) : {((!wire34) ?
                                  $signed(wire35) : {wire36}),
                              $signed($signed(wire30))}));
  assign wire40 = (~&wire38);
  always
    @(posedge clk) begin
      reg41 <= ($signed(wire30) > wire37[(4'hf):(4'h8)]);
      reg42 <= $signed((8'ha4));
    end
  assign wire43 = {$unsigned(({{(8'ha5)}} & ((wire37 ? (8'hb8) : wire37) ?
                          (8'ha9) : (wire30 || wire31)))),
                      wire39};
  assign wire44 = $signed($signed({$unsigned(wire39[(4'he):(1'h1)])}));
endmodule
