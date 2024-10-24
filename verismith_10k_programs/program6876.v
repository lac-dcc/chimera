module top
#(parameter param129 = (~((({(8'had), (8'ha2)} ? {(7'h44), (8'hbc)} : ((8'haa) ? (8'hbb) : (8'hbd))) ? (~|((8'hb9) ^ (8'h9c))) : ((~|(8'hb5)) >>> (8'hb6))) > (((~&(8'hba)) ? (~^(8'had)) : (~|(8'ha6))) ? (~((8'haf) ? (8'hbd) : (8'hae))) : (&{(8'had)})))), 
parameter param130 = (^~(|({param129} < param129))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h213):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(3'h5):(1'h0)] wire128;
  wire signed [(4'h9):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire [(3'h4):(1'h0)] wire125;
  wire [(5'h12):(1'h0)] wire124;
  wire [(4'ha):(1'h0)] wire123;
  wire [(3'h6):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire90;
  reg signed [(4'he):(1'h0)] reg122 = (1'h0);
  reg [(3'h7):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire112,
                 wire4,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire90,
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
                 reg102,
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
                 reg5,
                 reg6,
                 (1'h0)};
  assign wire4 = (wire0[(1'h1):(1'h1)] >= wire0[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg5 <= $unsigned($signed($signed($unsigned($signed(wire3)))));
      reg6 <= {$signed($signed((~|(|wire2))))};
    end
  assign wire7 = (^{wire4[(1'h0):(1'h0)], (~(~$signed(reg5)))});
  assign wire8 = wire4[(3'h6):(1'h1)];
  assign wire9 = (~|$signed((~wire8)));
  assign wire10 = wire8;
  assign wire11 = wire3[(3'h5):(3'h5)];
  module12 #() modinst91 (wire90, clk, wire4, reg6, wire10, wire3);
  always
    @(posedge clk) begin
      reg92 <= (wire11[(1'h0):(1'h0)] == $unsigned((~&(wire2 - $signed(wire10)))));
      if ((wire7 ?
          wire8[(3'h4):(3'h4)] : $signed($signed((reg5[(2'h2):(1'h1)] ?
              (wire0 << wire3) : (8'ha9))))))
        begin
          if (((~&$signed((^~wire8))) ?
              (reg5[(2'h2):(2'h2)] ?
                  $unsigned($signed({(8'hbd)})) : {wire1,
                      (wire10 >>> wire1[(1'h1):(1'h1)])}) : (reg92 != wire7[(1'h1):(1'h0)])))
            begin
              reg93 <= $signed(wire9);
            end
          else
            begin
              reg93 <= wire7[(2'h2):(2'h2)];
            end
          reg94 <= ($unsigned($unsigned(((wire3 ?
              wire0 : wire8) == $unsigned(wire10)))) ^ wire7);
          reg95 <= {wire11[(2'h3):(2'h3)],
              $signed($unsigned($signed((~^wire2))))};
          reg96 <= ($unsigned(($unsigned(wire7[(1'h0):(1'h0)]) ?
                  ($signed(wire7) ~^ $unsigned(reg95)) : (!((8'hb1) ?
                      wire3 : wire0)))) ?
              $signed((($signed(wire0) >> (^~wire0)) ?
                  wire10[(1'h1):(1'h1)] : (wire1[(2'h2):(2'h2)] ?
                      wire10[(3'h5):(2'h3)] : wire8))) : $unsigned(wire9[(4'h8):(3'h7)]));
        end
      else
        begin
          reg93 <= $unsigned(wire1);
          reg94 <= reg93;
          reg95 <= reg94[(3'h4):(3'h4)];
          if (($signed(wire4) < reg94[(3'h4):(2'h2)]))
            begin
              reg96 <= wire0;
              reg97 <= {(~|wire90)};
              reg98 <= wire10[(3'h7):(3'h6)];
              reg99 <= (reg97[(2'h3):(1'h1)] * $signed(wire3));
            end
          else
            begin
              reg96 <= ((($unsigned({(8'h9c)}) ?
                      wire7[(2'h2):(1'h0)] : {reg5[(1'h1):(1'h1)]}) ?
                  (reg6 != {$unsigned(wire9)}) : ($signed({(8'hbd)}) ?
                      $signed(reg92) : wire10)) >> wire7[(1'h0):(1'h0)]);
            end
        end
      if ($unsigned(wire7))
        begin
          reg100 <= (((!$signed((!wire9))) ?
                  reg96[(3'h5):(3'h4)] : (&{{wire1}})) ?
              $unsigned($signed((^~wire10))) : ((reg92[(4'hc):(4'hc)] ?
                      (reg93 ? (~&(8'ha0)) : (reg94 >= wire1)) : (|(~|wire0))) ?
                  $signed((wire10[(3'h4):(2'h2)] ?
                      $unsigned(reg98) : $unsigned(wire2))) : ({$unsigned(wire2),
                          $unsigned(reg93)} ?
                      $unsigned($signed(wire7)) : {$signed(wire11), {reg92}})));
          reg101 <= (|reg92[(4'hb):(1'h1)]);
          if ($unsigned((^(({wire4, reg96} * reg5[(1'h1):(1'h0)]) ?
              ($unsigned((8'hb6)) + ((8'hab) ? (8'hb0) : (8'h9f))) : (8'h9d)))))
            begin
              reg102 <= ({reg96[(4'hd):(3'h4)]} << $unsigned((~(-$unsigned(reg92)))));
              reg103 <= (~&(8'ha9));
            end
          else
            begin
              reg102 <= $signed($signed(($signed((reg95 ? wire90 : wire1)) ?
                  $unsigned((reg93 | reg99)) : $unsigned(reg102))));
              reg103 <= wire10[(4'hc):(2'h2)];
              reg104 <= (8'hbe);
              reg105 <= ((^~((8'h9c) ?
                      {(&reg92)} : {$signed(reg94), (wire0 >= wire8)})) ?
                  $signed((8'hb6)) : ($signed(((~^wire10) ?
                          reg104[(4'ha):(3'h4)] : ((8'haf) && wire1))) ?
                      reg5 : ($unsigned($unsigned(reg6)) ?
                          (8'ha8) : reg93[(4'h8):(1'h0)])));
            end
          if (({reg101[(2'h2):(1'h0)],
              $signed(((reg93 & reg5) ?
                  (~^wire0) : $signed(reg6)))} | (wire7[(2'h2):(1'h1)] != $unsigned(((reg96 ?
              reg92 : reg104) + wire10)))))
            begin
              reg106 <= (((((reg5 | reg5) ?
                  (reg94 ^~ reg98) : $signed(reg100)) >> (^(wire3 & reg93))) && $unsigned(((^reg97) ?
                  $unsigned(reg99) : (wire1 ?
                      reg101 : wire9)))) > $unsigned(reg98[(2'h2):(1'h0)]));
              reg107 <= ($signed(wire11) ?
                  ($unsigned((8'hb0)) || ($unsigned((reg93 > wire0)) ^ $unsigned((reg104 < wire4)))) : ((&reg94) ?
                      reg97[(1'h0):(1'h0)] : (((reg104 >= reg96) ?
                              {wire9, reg101} : (+wire90)) ?
                          $unsigned({reg100, reg95}) : wire11[(2'h2):(1'h0)])));
            end
          else
            begin
              reg106 <= {$signed(reg106[(2'h3):(2'h3)]),
                  $signed($unsigned($signed($unsigned((8'hac)))))};
              reg107 <= ((({$unsigned(wire0),
                      reg102[(4'h8):(3'h5)]} - $unsigned((!reg98))) + (|{$signed(wire8)})) ?
                  $unsigned(reg96) : {($unsigned(wire8) > wire11[(1'h1):(1'h0)])});
              reg108 <= {($unsigned(reg106[(2'h2):(1'h0)]) ?
                      $signed($unsigned((~&wire3))) : {wire90,
                          $unsigned(reg97[(1'h0):(1'h0)])})};
              reg109 <= reg92[(4'h9):(3'h6)];
              reg110 <= ($signed({reg101, wire11[(2'h3):(1'h0)]}) ?
                  reg97[(2'h2):(1'h0)] : wire11[(2'h2):(1'h1)]);
            end
          reg111 <= ((&reg102[(4'ha):(4'h9)]) ?
              reg98[(1'h0):(1'h0)] : $signed({$signed((wire8 ?
                      reg6 : (8'hbc)))}));
        end
      else
        begin
          reg100 <= (~$unsigned($unsigned(((^wire3) ?
              reg99[(2'h3):(1'h1)] : reg111[(3'h5):(2'h2)]))));
        end
    end
  assign wire112 = $unsigned(($signed(((-wire2) ?
                       reg104 : (~^reg105))) >> {($signed(wire8) ?
                           reg103[(4'he):(3'h7)] : (reg105 << reg101))}));
  always
    @(posedge clk) begin
      if (reg109[(1'h0):(1'h0)])
        begin
          reg113 <= (reg105 < (&$unsigned(reg94)));
        end
      else
        begin
          reg113 <= (-(|(&$unsigned((-wire4)))));
          reg114 <= wire11;
          if (wire112)
            begin
              reg115 <= $unsigned({reg108[(4'he):(3'h4)],
                  reg99[(1'h0):(1'h0)]});
              reg116 <= reg6[(3'h7):(3'h4)];
              reg117 <= {$signed($unsigned(wire7))};
            end
          else
            begin
              reg115 <= ({$unsigned($unsigned((reg104 && wire1))),
                      ((+(-wire2)) ?
                          reg113[(3'h5):(2'h3)] : ($unsigned((8'ha6)) - (8'hbf)))} ?
                  ($unsigned($signed((+(8'hb0)))) ?
                      (reg115[(5'h11):(2'h2)] ?
                          reg116 : {$unsigned(reg106)}) : wire4[(4'h8):(3'h5)]) : $unsigned(wire2));
              reg116 <= ((!(^~((reg107 && reg109) >> (~^wire9)))) - $unsigned(wire90));
              reg117 <= $unsigned((8'hb3));
              reg118 <= $unsigned((~(reg6 ^ {(reg92 > wire10)})));
              reg119 <= reg106[(1'h0):(1'h0)];
            end
          reg120 <= {wire4, reg103};
          reg121 <= (reg118 << reg104);
        end
      reg122 <= (|reg100);
    end
  assign wire123 = wire7[(1'h0):(1'h0)];
  assign wire124 = (wire2[(4'h8):(2'h3)] ?
                       (|(reg121[(1'h1):(1'h1)] >>> $unsigned((wire8 < wire4)))) : (~|(reg117 ?
                           $signed($signed((8'hac))) : reg121[(2'h3):(2'h2)])));
  assign wire125 = $unsigned((($unsigned((reg120 <= reg108)) ?
                           wire9[(1'h0):(1'h0)] : $signed(reg108)) ?
                       $signed((8'hb9)) : wire123));
  assign wire126 = (((7'h42) * (8'hb3)) ?
                       ((|((wire3 ?
                           reg100 : reg103) * (reg5 == (8'hb2)))) ^~ reg122[(4'hb):(4'hb)]) : $unsigned(reg122[(4'h8):(3'h5)]));
  assign wire127 = (wire2[(3'h6):(3'h4)] >= (~|($signed((wire90 == (7'h41))) ?
                       (wire112[(2'h3):(2'h2)] ?
                           $unsigned(wire125) : (reg100 ?
                               (7'h42) : reg98)) : reg104[(3'h4):(2'h2)])));
  assign wire128 = $signed((~{$unsigned(reg6[(4'hc):(1'h1)]),
                       $signed(((8'had) ? reg113 : reg115))}));
endmodule

module module12  (y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(4'ha):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire86;
  wire [(4'he):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire59;
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire82,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire17,
                 wire30,
                 wire59,
                 reg84,
                 reg81,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire17 = (~^$unsigned($signed($signed($unsigned((8'hbd))))));
  module18 #() modinst31 (wire30, clk, wire15, wire13, wire16, wire17);
  module32 #() modinst60 (wire59, clk, wire16, wire14, wire30, wire13, wire17);
  assign wire61 = $unsigned({$signed($unsigned((wire30 ? (8'haa) : wire17)))});
  assign wire62 = ({$unsigned($signed(((8'hb5) ? wire14 : (8'haf))))} ?
                      $unsigned((^$signed(wire61))) : ($signed((~&wire17)) ?
                          $unsigned($unsigned((wire59 ^ wire13))) : $signed($unsigned(wire13))));
  assign wire63 = $signed($signed($unsigned((+(-wire15)))));
  assign wire64 = ((8'haa) ?
                      ($signed((~&(8'had))) ?
                          (-(wire30[(1'h1):(1'h0)] << wire13)) : (((wire14 > wire61) ?
                              (wire63 - wire30) : wire13[(3'h4):(2'h3)]) > $signed((wire13 ?
                              wire59 : wire16)))) : $unsigned(wire63[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      if ((&$unsigned(wire64)))
        begin
          reg65 <= {wire61[(3'h6):(2'h3)]};
          reg66 <= (wire16 && wire15[(4'h8):(1'h0)]);
          reg67 <= {{wire62}};
          reg68 <= reg65[(1'h0):(1'h0)];
        end
      else
        begin
          reg65 <= (+$signed($unsigned(wire30[(3'h5):(2'h2)])));
          reg66 <= $signed(wire16);
          if ($unsigned(($unsigned($unsigned(((8'hbd) > wire16))) ^ ((|$signed(reg68)) ?
              (wire64 ? {reg65} : reg66) : (wire15 ?
                  wire61 : reg67[(2'h2):(1'h1)])))))
            begin
              reg67 <= $unsigned(wire13[(4'hb):(1'h1)]);
              reg68 <= (wire63[(3'h7):(3'h6)] ? reg66 : wire15[(4'h9):(4'h9)]);
            end
          else
            begin
              reg67 <= $unsigned((($signed($unsigned(reg68)) << (~|wire64[(5'h11):(3'h7)])) ?
                  (-wire64[(4'ha):(3'h4)]) : wire62[(2'h2):(2'h2)]));
              reg68 <= ($unsigned({(^wire64[(4'hf):(1'h0)])}) ?
                  (8'ha7) : ($signed($signed($unsigned((8'hb7)))) ?
                      ($unsigned(wire14[(1'h0):(1'h0)]) ?
                          $unsigned(wire61) : reg68[(1'h0):(1'h0)]) : $signed(wire30)));
              reg69 <= ((($signed($unsigned(wire17)) ?
                          wire64[(4'hd):(2'h2)] : (^~(!(7'h44)))) ?
                      reg68[(2'h2):(1'h1)] : ($signed((7'h42)) | ({reg66,
                          wire15} ~^ $unsigned(wire59)))) ?
                  wire17 : wire63);
              reg70 <= (^~{((~^(8'ha3)) < (~&(wire63 ? reg65 : wire30))),
                  (reg65 >= wire30)});
            end
          reg71 <= $signed(((wire16[(5'h13):(1'h1)] + reg68) > (^$signed((reg66 ?
              wire61 : (8'ha9))))));
          reg72 <= $unsigned(reg68[(2'h2):(1'h0)]);
        end
      reg73 <= (~|wire30[(4'hc):(3'h6)]);
      if ($unsigned($unsigned({{$unsigned(reg70)}})))
        begin
          reg74 <= wire16;
          reg75 <= (-($signed({$signed(wire14)}) ^~ $signed(($unsigned(reg73) * (wire62 ?
              wire13 : wire15)))));
        end
      else
        begin
          reg74 <= $signed($unsigned({$unsigned($unsigned(reg75)), reg69}));
        end
    end
  assign wire76 = reg72[(4'hc):(3'h7)];
  assign wire77 = (reg67[(4'hc):(2'h2)] && $unsigned(reg67[(4'he):(3'h4)]));
  assign wire78 = (((wire13[(4'hc):(4'h9)] ?
                      $signed(wire16[(4'h8):(1'h0)]) : $signed((reg71 > reg71))) >= $unsigned(wire59[(3'h4):(1'h1)])) || ($signed(reg75) ?
                      reg72 : wire76[(4'hb):(3'h7)]));
  assign wire79 = $signed($signed((8'hba)));
  assign wire80 = (~(($signed({wire16, reg65}) <= $unsigned((~|reg74))) ?
                      (8'hb6) : wire59[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg81 <= (((~&$unsigned(wire61[(3'h6):(1'h0)])) ^ wire80) ?
          reg69 : $unsigned(wire13[(1'h0):(1'h0)]));
    end
  assign wire82 = $signed($unsigned(($signed($unsigned(wire61)) ?
                      ((&reg74) ?
                          (wire30 && (8'hb9)) : reg67[(4'he):(3'h4)]) : wire16)));
  assign wire83 = $unsigned((wire14 * $unsigned(wire64[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg84 <= (($signed($signed($signed((8'ha9)))) ?
          {{(+reg69)}} : wire13[(1'h0):(1'h0)]) && reg72[(3'h4):(2'h3)]);
    end
  assign wire85 = (^~(wire77 ?
                      reg84[(2'h2):(2'h2)] : $signed(wire76[(1'h0):(1'h0)])));
  assign wire86 = (({wire63[(1'h0):(1'h0)]} * (($signed(reg66) ?
                      (reg73 != reg71) : (wire61 ?
                          (8'hb3) : wire62)) > $signed((wire13 << reg70)))) >> (reg81[(2'h2):(1'h0)] ?
                      reg65 : $signed(wire64)));
  assign wire87 = wire14;
  assign wire88 = wire76;
  assign wire89 = ((-wire79[(2'h2):(1'h1)]) | reg81[(1'h1):(1'h0)]);
endmodule

module module32  (y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire37;
  input wire [(5'h15):(1'h0)] wire36;
  input wire [(5'h13):(1'h0)] wire35;
  input wire signed [(4'hf):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 (1'h0)};
  assign wire38 = $unsigned(((8'hb8) ?
                      ((wire37 ? wire34 : $unsigned(wire35)) ?
                          (wire37 == {wire35,
                              wire33}) : $unsigned($signed(wire35))) : (~|$unsigned((wire33 ~^ wire35)))));
  assign wire39 = (!((((&wire34) ? wire34 : wire33) ?
                          wire35[(5'h12):(2'h3)] : {(wire37 >= wire38)}) ?
                      wire38 : $unsigned($signed((wire37 == (8'hb7))))));
  assign wire40 = wire37[(4'h8):(2'h3)];
  assign wire41 = $signed((~|({wire37[(3'h6):(3'h4)],
                          (wire38 ? wire36 : wire37)} ?
                      {$unsigned(wire40), wire33[(5'h14):(5'h10)]} : wire39)));
  assign wire42 = wire37[(4'h9):(3'h6)];
  assign wire43 = wire33[(2'h2):(2'h2)];
  assign wire44 = {(($unsigned((8'hb7)) ^ wire40[(1'h0):(1'h0)]) ^~ $signed(wire41))};
  assign wire45 = wire44;
  assign wire46 = $unsigned(wire45[(2'h2):(2'h2)]);
  assign wire47 = wire37[(3'h7):(3'h5)];
  assign wire48 = {$signed({(~^$unsigned(wire46))})};
  assign wire49 = ((((+(wire36 ^ wire48)) ?
                          (wire36[(1'h1):(1'h1)] | $unsigned((8'hb1))) : wire44) ?
                      $unsigned($unsigned((|wire39))) : wire35[(4'hb):(1'h0)]) != {$unsigned($signed((wire47 > (8'hab)))),
                      wire46});
  assign wire50 = $signed((^~{{$signed((8'hb0)), $unsigned(wire45)}}));
  assign wire51 = wire42;
  assign wire52 = $unsigned(($unsigned($unsigned($unsigned((8'hb1)))) ?
                      wire47 : $unsigned(wire35[(5'h10):(1'h1)])));
  assign wire53 = (-$signed(({$signed((8'had)),
                      $unsigned(wire44)} <= $signed((&wire41)))));
  assign wire54 = wire33;
  assign wire55 = (^wire38[(3'h4):(1'h1)]);
  assign wire56 = (wire45[(2'h2):(1'h1)] ^~ $unsigned(((wire35 ?
                          (wire42 & wire46) : {wire48, wire41}) ?
                      $unsigned(((7'h42) ^ wire45)) : (!$unsigned(wire51)))));
  assign wire57 = (!$signed((((&(8'h9c)) + (~wire43)) <<< (wire33 == $signed(wire44)))));
  assign wire58 = (+($unsigned(wire55[(1'h1):(1'h1)]) ?
                      (wire57 ?
                          (|$unsigned((8'haa))) : {(-wire50)}) : wire53[(1'h1):(1'h0)]));
endmodule

module module18
#(parameter param29 = {((~|((~^(8'ha3)) || {(8'hac)})) & (|(~(~|(8'hbd))))), (~|(({(8'hb2)} * ((8'hbc) >>> (8'h9e))) ? {{(8'hba), (8'hb6)}} : (((8'hbc) >> (8'h9c)) ~^ (~&(8'hac)))))})
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire22;
  input wire [(4'hb):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  assign y = {wire28, wire27, wire26, wire25, wire24, wire23, (1'h0)};
  assign wire23 = $unsigned($unsigned(wire22));
  assign wire24 = {$signed((((wire20 ?
                          (8'ha9) : (8'haf)) || (wire19 && (7'h40))) != wire20[(5'h10):(1'h1)]))};
  assign wire25 = ((wire21[(2'h3):(2'h3)] ?
                      wire20 : (|((8'hb4) > (wire19 || wire20)))) ^~ ({wire24[(3'h5):(1'h0)],
                          wire21} ?
                      (^~((wire19 <= wire21) == {wire20,
                          wire21})) : $unsigned((+(wire19 <<< wire24)))));
  assign wire26 = (wire21[(1'h0):(1'h0)] ?
                      ({wire25, wire21} ?
                          wire22[(3'h6):(2'h3)] : (~|({wire22,
                              wire25} >> (|(8'hab))))) : ((wire22 ?
                          (^(wire25 ^~ wire21)) : $signed((|wire21))) * wire24[(3'h5):(1'h1)]));
  assign wire27 = $unsigned((wire24[(1'h1):(1'h0)] < $unsigned((|wire20[(5'h10):(2'h3)]))));
  assign wire28 = $unsigned((^$unsigned((&$unsigned(wire24)))));
endmodule
