module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire125;
  wire [(4'h9):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire122;
  assign y = {wire125, wire124, wire4, wire5, wire122, (1'h0)};
  assign wire4 = ({(!{(wire0 ? wire0 : wire2)}), $unsigned((~{wire1, wire3}))} ?
                     wire0[(3'h4):(3'h4)] : (wire3 || {$unsigned($signed(wire2))}));
  assign wire5 = (wire2 >= (wire3[(1'h1):(1'h1)] ?
                     ($unsigned((~&wire2)) | (^~wire1)) : wire1[(2'h2):(1'h0)]));
  module6 #() modinst123 (.clk(clk), .wire8(wire2), .wire9(wire0), .y(wire122), .wire10(wire1), .wire11(wire3), .wire7(wire5));
  assign wire124 = ($unsigned(wire3) & (wire2 ?
                       $signed(({wire122} < (wire0 ?
                           wire5 : wire1))) : (~|wire122[(2'h3):(2'h2)])));
  assign wire125 = (wire124 | $unsigned(wire0));
endmodule

module module6
#(parameter param120 = (((&(((8'haa) | (8'ha6)) ? (^~(7'h44)) : {(8'ha2), (8'hb9)})) + (({(8'hab), (8'ha1)} ? (!(7'h40)) : {(8'hb7), (8'hb9)}) && (((7'h40) && (8'h9d)) * ((8'hb2) >> (8'ha3))))) ? {((|(~(8'hac))) ? (((8'ha3) ? (8'hba) : (8'ha3)) ^~ {(8'h9e)}) : (((8'hbe) ? (8'hb1) : (8'ha6)) < (7'h44)))} : {(-(((8'hb6) != (8'hac)) <<< (~(8'hbc))))}), 
parameter param121 = (param120 != (!(^param120))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(3'h5):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire103;
  wire [(5'h15):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire28;
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg110 = (1'h0);
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  assign y = {wire103,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire59,
                 wire58,
                 wire56,
                 wire32,
                 wire31,
                 wire30,
                 wire12,
                 wire28,
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
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 (1'h0)};
  assign wire12 = wire7;
  module13 #() modinst29 (wire28, clk, wire9, wire11, wire10, wire12, wire7);
  assign wire30 = $unsigned($unsigned(wire10[(3'h5):(1'h0)]));
  assign wire31 = wire11;
  assign wire32 = $unsigned((wire11[(3'h5):(2'h2)] ?
                      $signed($unsigned(wire30[(2'h3):(1'h1)])) : $signed(wire10[(3'h6):(1'h1)])));
  module33 #() modinst57 (wire56, clk, wire28, wire7, wire9, wire10);
  assign wire58 = wire11[(4'hc):(3'h5)];
  assign wire59 = wire30;
  always
    @(posedge clk) begin
      if ($unsigned($signed(((~&{wire32, wire56}) & wire56))))
        begin
          if ($signed(({$unsigned({wire28})} >>> $unsigned(($signed(wire8) ?
              (~&wire31) : $signed((8'h9f)))))))
            begin
              reg60 <= (($signed(($signed(wire31) < (wire30 << wire56))) ?
                  ({$signed(wire59)} ?
                      ((~wire12) == {wire8}) : $signed((-wire58))) : (~|{$unsigned(wire28)})) && ($unsigned(($unsigned(wire32) - $unsigned(wire58))) >>> $unsigned(((wire8 ~^ wire10) >> wire11[(4'hb):(4'hb)]))));
              reg61 <= (!wire32[(3'h7):(1'h1)]);
              reg62 <= wire32[(4'he):(4'hc)];
            end
          else
            begin
              reg60 <= ($signed(wire8[(1'h1):(1'h1)]) || {(8'h9f),
                  $unsigned(wire8[(1'h1):(1'h0)])});
              reg61 <= $unsigned($unsigned($unsigned(((^wire59) ?
                  wire30[(1'h0):(1'h0)] : $signed((8'ha4))))));
              reg62 <= {(($signed(wire59[(3'h5):(1'h0)]) ?
                      reg60[(3'h7):(1'h0)] : wire7[(3'h7):(2'h2)]) || $signed((wire11[(4'h8):(1'h0)] ?
                      wire11 : (wire10 >>> wire8)))),
                  $signed(wire11[(2'h2):(2'h2)])};
              reg63 <= $unsigned($signed((((wire58 ? wire7 : (8'hb6)) ?
                  $unsigned(reg61) : (~^(7'h41))) > wire32)));
            end
          reg64 <= $unsigned((($signed((wire58 << (8'hab))) ?
                  $unsigned($unsigned((8'h9d))) : wire56) ?
              $unsigned((wire32 ~^ ((8'hb6) ?
                  wire10 : (8'hb9)))) : (wire8 * reg61[(2'h2):(1'h1)])));
        end
      else
        begin
          reg60 <= (wire9[(2'h2):(1'h0)] || (wire32 <<< (-$signed(wire30[(1'h0):(1'h0)]))));
          reg61 <= wire8[(2'h3):(2'h2)];
        end
    end
  assign wire65 = wire30[(2'h2):(2'h2)];
  assign wire66 = ($signed(((^~$unsigned(wire10)) | (wire10 ?
                      $unsigned(wire31) : wire31))) <= (~&{$signed(wire58[(2'h2):(1'h1)])}));
  assign wire67 = ($signed($unsigned(($signed(reg64) ?
                          (wire65 ? wire12 : reg61) : $unsigned(wire66)))) ?
                      ((|{(wire30 ^ wire28)}) >= (|$signed(reg64[(4'he):(3'h6)]))) : $signed({$unsigned(((8'ha0) > reg61)),
                          wire7[(5'h10):(2'h3)]}));
  assign wire68 = $signed($unsigned($unsigned((8'hbc))));
  module69 #() modinst104 (.clk(clk), .wire72(wire10), .wire70(wire12), .wire71(wire30), .wire74(wire65), .y(wire103), .wire73(reg62));
  always
    @(posedge clk) begin
      if ((~((((wire66 ? wire58 : (8'hb0)) ?
              $unsigned(wire67) : $signed(wire66)) ?
          wire10 : ({reg64} != $signed((8'hba)))) * ((~$unsigned(wire8)) ?
          ((~reg63) ?
              $signed(wire59) : $signed(wire11)) : $signed($signed(reg64))))))
        begin
          reg105 <= (~^(($unsigned((wire68 < wire67)) || wire10) ?
              {wire31[(3'h7):(1'h0)]} : $signed($signed((reg63 ^~ reg64)))));
          reg106 <= ($unsigned($unsigned(((wire32 ? wire67 : wire9) <= (wire31 ?
                  wire28 : wire10)))) ?
              reg63[(1'h0):(1'h0)] : $signed((wire67 ^~ {$signed(wire11)})));
        end
      else
        begin
          reg105 <= wire66[(3'h7):(3'h6)];
          reg106 <= wire66;
          reg107 <= ((~|$signed((|$unsigned((8'h9f))))) ?
              ((wire66[(2'h3):(2'h2)] - ((~^reg63) ^~ wire68[(1'h0):(1'h0)])) ?
                  wire32[(4'hd):(4'h9)] : reg62) : wire67);
        end
      reg108 <= reg105[(3'h6):(3'h5)];
      reg109 <= (+$signed(wire8[(1'h1):(1'h1)]));
      if (reg109)
        begin
          reg110 <= reg105;
          reg111 <= ((8'h9f) ?
              $unsigned(wire103[(1'h1):(1'h0)]) : ($unsigned({(reg64 ?
                          wire12 : wire65)}) ?
                  ((|$signed(wire9)) ?
                      wire9 : (reg61[(3'h4):(3'h4)] ?
                          reg62[(3'h7):(3'h6)] : (reg63 ?
                              wire30 : reg61))) : wire11[(4'h8):(2'h3)]));
          if ($signed(reg63[(1'h1):(1'h1)]))
            begin
              reg112 <= (7'h42);
              reg113 <= $signed((wire9[(4'h9):(1'h0)] ?
                  $unsigned($unsigned(wire65[(2'h3):(1'h0)])) : reg107));
              reg114 <= wire66[(3'h6):(3'h4)];
            end
          else
            begin
              reg112 <= (($unsigned(wire67[(3'h4):(2'h2)]) ?
                      (((wire30 >>> wire9) != (wire31 ?
                          reg111 : reg109)) == reg60[(2'h3):(1'h1)]) : ({wire10[(4'hb):(2'h2)],
                              wire9[(1'h1):(1'h0)]} ?
                          $unsigned($signed((8'hab))) : {$unsigned(wire12)})) ?
                  (reg111 | reg60[(4'h9):(3'h4)]) : ((wire30[(5'h11):(5'h10)] ?
                          {(wire31 ? (8'hbd) : reg113),
                              $signed(wire31)} : $signed(wire56)) ?
                      reg111 : {$unsigned(wire8[(3'h4):(1'h0)])}));
            end
          reg115 <= {wire10[(4'hb):(3'h5)]};
        end
      else
        begin
          reg110 <= (~$signed($unsigned((8'h9f))));
        end
      if (reg63)
        begin
          reg116 <= (8'ha5);
          reg117 <= (($signed(((wire32 > reg111) <<< {(7'h42),
              wire103})) ^~ (({reg61} + $unsigned(reg110)) ?
              $unsigned(reg63) : ({reg115} ?
                  reg115[(2'h2):(1'h1)] : wire58))) | reg62[(3'h6):(3'h4)]);
          reg118 <= ($signed(wire31[(4'hf):(3'h7)]) >> (reg116 >= ($unsigned(wire31[(2'h2):(2'h2)]) ?
              reg114[(3'h5):(2'h2)] : $unsigned($unsigned(reg110)))));
          reg119 <= ((8'ha3) + $signed($unsigned($unsigned((wire30 ?
              (7'h40) : reg64)))));
        end
      else
        begin
          reg116 <= $signed($signed((reg119 >= reg113[(3'h7):(3'h7)])));
          if ((^~$unsigned(reg64)))
            begin
              reg117 <= $unsigned(((reg105 ? {(-wire30), wire11} : (+reg108)) ?
                  (-reg116[(2'h2):(1'h0)]) : $unsigned((reg107 ^~ $signed(wire10)))));
              reg118 <= $signed($unsigned($unsigned(({wire11} ?
                  wire12 : {reg111, reg114}))));
            end
          else
            begin
              reg117 <= $signed({(~^reg108), (~^(~|(reg111 != reg113)))});
            end
          reg119 <= $unsigned({(8'ha3)});
        end
    end
endmodule

module module69
#(parameter param101 = (8'hbe), 
parameter param102 = (!param101))
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire74;
  input wire [(4'h9):(1'h0)] wire73;
  input wire signed [(2'h2):(1'h0)] wire72;
  input wire [(5'h12):(1'h0)] wire71;
  input wire signed [(2'h2):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire75;
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  assign y = {wire100,
                 wire87,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
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
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire75 = (~wire72);
  assign wire76 = ({((wire72 ?
                          (&wire75) : {wire72,
                              wire72}) < (~|wire71))} << {wire71});
  assign wire77 = (wire73[(4'h8):(1'h1)] ?
                      (wire71[(5'h11):(4'ha)] ?
                          $unsigned($signed((wire73 ?
                              (8'hbb) : wire72))) : $unsigned(wire75)) : wire75[(3'h5):(3'h5)]);
  assign wire78 = (-wire72);
  assign wire79 = $unsigned(((-{wire73}) ~^ $unsigned(wire72[(1'h0):(1'h0)])));
  assign wire80 = (|wire78);
  assign wire81 = ({$signed((wire77[(3'h7):(3'h5)] ^~ (wire70 ?
                          wire73 : wire79)))} ~^ wire73[(2'h3):(1'h1)]);
  assign wire82 = ($signed({$signed({wire80, wire71}),
                      wire72[(1'h0):(1'h0)]}) >= wire80);
  assign wire83 = (wire82 ?
                      $signed($signed($signed({wire75,
                          (8'hac)}))) : $signed(($signed($unsigned(wire72)) >= wire80)));
  assign wire84 = {(!(wire70 << wire83[(3'h4):(3'h4)])),
                      (wire79[(4'he):(2'h3)] ?
                          wire75[(4'h8):(4'h8)] : $signed(wire81[(2'h3):(2'h2)]))};
  always
    @(posedge clk) begin
      reg85 <= wire77[(4'hc):(3'h5)];
      reg86 <= $signed((wire74[(2'h2):(2'h2)] ?
          (|$unsigned((wire79 ? wire74 : wire75))) : (~^$signed((+wire81)))));
    end
  assign wire87 = ((8'hb0) <<< reg86[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg88 <= $signed($unsigned((((~^wire75) | (wire72 + wire76)) ~^ wire73[(3'h4):(2'h2)])));
      reg89 <= ($unsigned({(wire79 >= wire75), $signed((8'hbe))}) <<< wire83);
      if ($unsigned($signed($signed(wire70[(1'h0):(1'h0)]))))
        begin
          if ($signed($unsigned($signed(wire82))))
            begin
              reg90 <= (^~(~^(((reg89 ? wire72 : wire70) ?
                  (wire84 ? wire72 : wire78) : {wire71}) > ((wire80 ?
                      reg86 : wire76) ?
                  (reg89 < wire77) : (wire74 <<< wire81)))));
              reg91 <= $unsigned($unsigned(wire84[(4'h8):(3'h5)]));
              reg92 <= wire82;
              reg93 <= $unsigned(wire77);
              reg94 <= (7'h41);
            end
          else
            begin
              reg90 <= reg94[(4'ha):(3'h7)];
              reg91 <= $unsigned({$signed($unsigned(reg94))});
              reg92 <= $signed({($signed($unsigned(reg91)) < wire75[(1'h1):(1'h1)]),
                  $unsigned((wire80 ? wire75 : reg85[(4'hc):(4'ha)]))});
              reg93 <= wire70[(1'h1):(1'h0)];
              reg94 <= wire80[(3'h5):(3'h5)];
            end
          reg95 <= ({({wire71[(4'he):(2'h3)]} >= $signed((wire76 ?
                      wire83 : reg89))),
                  ($unsigned((wire75 ? wire87 : wire79)) ?
                      $signed({reg90}) : ($unsigned(reg94) ?
                          wire75[(3'h6):(1'h0)] : (reg94 <<< reg92)))} ?
              reg86[(2'h2):(2'h2)] : (|{wire82, $signed($signed((8'ha2)))}));
          if (((wire76 > ({((8'ha1) ? wire77 : (8'hb6))} ?
              wire81[(1'h0):(1'h0)] : $signed((&(8'hba))))) < reg85))
            begin
              reg96 <= (~|{($signed((~(8'hae))) ?
                      wire78[(4'h8):(3'h4)] : $unsigned($signed(reg94)))});
              reg97 <= ({({{reg93, reg95}} <= wire81),
                  $unsigned(((reg94 ? wire80 : reg96) ?
                      wire82[(1'h1):(1'h1)] : $signed(wire80)))} < (^~{wire71,
                  wire74[(1'h0):(1'h0)]}));
              reg98 <= (~&reg86[(1'h0):(1'h0)]);
            end
          else
            begin
              reg96 <= wire72[(1'h0):(1'h0)];
              reg97 <= $signed($unsigned(((wire82 ?
                  (wire80 << reg90) : $signed(reg92)) == $unsigned($unsigned(wire84)))));
            end
        end
      else
        begin
          reg90 <= $signed(wire76[(1'h1):(1'h0)]);
        end
      reg99 <= (^~$unsigned((|reg96)));
    end
  assign wire100 = {wire74[(1'h1):(1'h0)],
                       $signed((({reg88} ?
                           (reg91 ?
                               reg90 : wire75) : (~&wire81)) ^ $signed($unsigned(wire71))))};
endmodule

module module33  (y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire37;
  input wire [(5'h13):(1'h0)] wire36;
  input wire signed [(3'h5):(1'h0)] wire35;
  input wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg51,
                 reg50,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire38 = (wire37 ^ {$unsigned($unsigned($unsigned(wire34)))});
  assign wire39 = wire34;
  assign wire40 = ((+$signed($signed({(8'ha9)}))) * wire34[(3'h6):(2'h3)]);
  assign wire41 = wire34;
  always
    @(posedge clk) begin
      reg42 <= wire41[(2'h3):(1'h1)];
      reg43 <= wire39;
    end
  assign wire44 = $signed((reg42 ?
                      (8'h9d) : ((wire39[(3'h6):(1'h0)] ?
                          (wire34 << wire39) : $unsigned(wire41)) ^ ($unsigned((8'ha3)) <<< wire39))));
  assign wire45 = (((reg43[(1'h1):(1'h0)] >> $unsigned((wire36 != wire44))) >= $signed(((wire41 && wire39) ?
                          (wire37 >> reg42) : (reg42 > wire44)))) ?
                      $unsigned((~{(8'ha2),
                          wire41[(1'h0):(1'h0)]})) : $unsigned($unsigned(((8'ha0) | reg42))));
  assign wire46 = ((8'h9f) ? wire44 : wire38);
  assign wire47 = (^~$signed(wire39[(3'h4):(3'h4)]));
  assign wire48 = ($signed(($signed((|wire36)) >> wire45)) || $signed(wire44[(1'h1):(1'h0)]));
  assign wire49 = {wire47[(4'h9):(3'h4)],
                      (wire41 ? {wire45, wire44[(2'h2):(2'h2)]} : (&wire37))};
  always
    @(posedge clk) begin
      reg50 <= wire48[(4'hc):(4'h9)];
      reg51 <= (|{(~&reg43[(4'he):(3'h5)])});
    end
  assign wire52 = wire45[(1'h1):(1'h0)];
  assign wire53 = {($signed(wire52[(4'h8):(3'h4)]) << $signed($signed((wire44 >= wire34))))};
  assign wire54 = $signed(wire47);
  assign wire55 = reg43[(4'h8):(3'h4)];
endmodule

module module13
#(parameter param27 = ({(~&(((8'hb8) > (8'hbe)) ? (8'hbb) : (8'ha2))), ((~^(+(8'hbd))) ? ((-(8'h9d)) ^~ ((7'h40) >>> (8'ha1))) : (8'hab))} && ((|((-(8'hb8)) ^ {(8'hb2), (7'h41)})) << (((~(8'ha5)) ? ((8'had) ? (8'ha7) : (8'hb2)) : (^(8'hb3))) ~^ (+(8'ha4))))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire [(4'hc):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire [(4'hd):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire19;
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire19,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire19 = {wire14};
  always
    @(posedge clk) begin
      reg20 <= (|((wire19[(1'h0):(1'h0)] + (~&(wire16 ?
          (7'h44) : wire15))) <= ((!(wire16 ~^ (8'haf))) ^~ wire17[(4'hb):(2'h2)])));
      reg21 <= wire17[(4'h9):(4'h9)];
      reg22 <= ({{(-(!reg21))}} ?
          (&wire17[(3'h5):(3'h5)]) : $signed(($signed((wire19 <<< wire16)) == wire17[(3'h7):(1'h1)])));
      reg23 <= (wire14[(3'h5):(2'h2)] > $signed($unsigned(($signed(wire18) != $signed(wire16)))));
      reg24 <= (~|(wire14[(2'h3):(2'h3)] || (reg23[(1'h1):(1'h0)] >>> $unsigned((wire19 < wire16)))));
    end
  assign wire25 = $unsigned(((|wire14[(2'h3):(2'h2)]) ^~ {$unsigned({wire19})}));
  assign wire26 = ((($unsigned(wire17) ?
                              {wire19, (reg20 ? (8'hb4) : wire17)} : ({reg20,
                                  reg21} == wire14)) ?
                          wire14[(4'h9):(2'h3)] : (!$signed((+wire18)))) ?
                      $signed(wire14[(2'h3):(1'h0)]) : ((($unsigned(wire16) ?
                          $signed(wire17) : wire14) * reg24[(1'h1):(1'h1)]) >= (^(8'ha6))));
endmodule
