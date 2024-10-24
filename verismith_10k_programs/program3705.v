module top
#(parameter param133 = ((|((^((7'h41) | (8'haa))) ? ((|(8'hb2)) ? ((8'hae) * (8'ha2)) : {(8'hab), (8'hbb)}) : ((~|(8'hb0)) ? (&(7'h41)) : {(8'ha0)}))) ^~ {(|(8'hb5)), ((((8'hb0) ? (7'h43) : (7'h40)) * ((8'h9e) ? (8'hb8) : (8'hb1))) ? (+(|(8'hae))) : (|((8'ha6) << (8'hb9))))}), 
parameter param134 = (~({{{param133}}, ((-param133) ? (~&(8'ha8)) : (~param133))} + ((8'hb8) & (+(param133 ? param133 : param133))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire132;
  wire [(5'h15):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire130;
  wire signed [(4'he):(1'h0)] wire129;
  wire signed [(3'h6):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire127;
  wire signed [(3'h7):(1'h0)] wire126;
  wire signed [(4'he):(1'h0)] wire125;
  wire [(5'h12):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire123;
  wire [(5'h11):(1'h0)] wire122;
  wire [(5'h13):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire120;
  wire [(4'hc):(1'h0)] wire119;
  wire [(3'h5):(1'h0)] wire118;
  wire [(4'hc):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire116;
  wire [(4'ha):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire112;
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire5,
                 wire6,
                 wire7,
                 wire112,
                 (1'h0)};
  assign wire5 = (wire0[(4'hf):(3'h5)] ?
                     (wire1[(4'h9):(2'h3)] ?
                         (^wire1[(4'hf):(4'hc)]) : wire3[(4'h9):(3'h5)]) : {wire4});
  assign wire6 = wire0[(1'h0):(1'h0)];
  assign wire7 = ((+wire4[(1'h1):(1'h0)]) ? (|wire1[(4'hd):(2'h3)]) : wire1);
  module8 #() modinst113 (.clk(clk), .y(wire112), .wire11(wire6), .wire12(wire5), .wire9(wire7), .wire13(wire1), .wire10(wire3));
  assign wire114 = (wire0[(1'h1):(1'h1)] ?
                       wire7 : $unsigned($signed($signed((wire6 ?
                           wire0 : wire3)))));
  assign wire115 = (^~$signed((-({wire5, wire112} * (wire114 ?
                       wire2 : (7'h44))))));
  assign wire116 = wire115;
  assign wire117 = $unsigned({(&((wire116 * wire7) - wire1))});
  assign wire118 = wire7;
  assign wire119 = $signed(wire114[(3'h6):(2'h3)]);
  assign wire120 = (wire116[(2'h3):(2'h2)] ~^ $signed($unsigned($unsigned(wire3))));
  assign wire121 = $unsigned($signed(wire117));
  assign wire122 = ($signed((wire112[(1'h1):(1'h1)] ?
                           (^~$signed(wire6)) : $unsigned($unsigned((8'ha3))))) ?
                       ($unsigned(($signed(wire7) | $unsigned(wire6))) | (-(8'ha1))) : (|((~|(8'ha3)) == ((wire118 - wire115) ?
                           $unsigned(wire114) : (wire118 ? wire6 : wire114)))));
  assign wire123 = (~((^~wire5[(4'hf):(4'h8)]) ?
                       wire4 : $unsigned(wire3[(3'h7):(2'h3)])));
  assign wire124 = (^~wire3[(4'h8):(1'h0)]);
  assign wire125 = wire4;
  assign wire126 = wire122;
  assign wire127 = (wire120 ?
                       ((8'h9c) | (((wire3 >>> wire0) ?
                           ((8'hb4) ? wire115 : wire122) : (wire118 ?
                               wire116 : wire7)) == $signed($unsigned((8'hb9))))) : $unsigned($signed((+wire124))));
  assign wire128 = wire5;
  assign wire129 = (|wire0);
  assign wire130 = wire128;
  assign wire131 = $signed(wire118[(3'h4):(2'h3)]);
  assign wire132 = wire120;
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire111;
  wire signed [(2'h2):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire108;
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire14,
                 wire15,
                 wire49,
                 wire51,
                 wire108,
                 reg16,
                 (1'h0)};
  assign wire14 = wire12;
  assign wire15 = ({(wire11 <= $unsigned((~wire14))),
                      {((wire12 ?
                              (8'h9d) : wire11) + $signed(wire14))}} != (8'ha4));
  always
    @(posedge clk) begin
      reg16 <= wire15;
    end
  module17 #() modinst50 (wire49, clk, wire15, wire11, wire9, wire10);
  assign wire51 = ({$signed((wire49[(2'h2):(1'h0)] ?
                          (wire13 ? wire13 : wire11) : ((8'hab) ?
                              wire14 : wire10)))} | (8'hbc));
  module52 #() modinst109 (wire108, clk, wire9, wire49, wire13, wire15, wire11);
  assign wire110 = (wire51 * $signed(wire12));
  assign wire111 = $unsigned(wire9[(4'hb):(1'h0)]);
endmodule

module module52
#(parameter param107 = {(&{(((8'hae) == (8'h9c)) ? (!(8'ha0)) : (^~(8'hbf)))})})
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h22c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire57;
  input wire signed [(5'h15):(1'h0)] wire56;
  input wire signed [(5'h10):(1'h0)] wire55;
  input wire [(2'h3):(1'h0)] wire54;
  input wire [(4'he):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire95;
  wire [(2'h2):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire70;
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire95,
                 wire94,
                 wire77,
                 wire76,
                 wire70,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg93,
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
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg69,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg58 <= (wire56 << ((~^(8'hb9)) ?
          (({wire53} ?
              {wire57} : (^~wire54)) * wire56) : $unsigned(wire56[(4'hc):(2'h2)])));
      if (reg58[(4'hd):(3'h5)])
        begin
          reg59 <= $signed((($unsigned((~reg58)) == (|wire56)) && (^~(reg58[(5'h11):(3'h7)] ^ (wire54 ?
              wire54 : wire56)))));
          if (((~&$unsigned(($unsigned(reg58) > {wire54,
              reg58}))) ^~ (^~($unsigned($unsigned((8'hab))) ?
              wire53 : (wire54 & (^~reg58))))))
            begin
              reg60 <= (wire54[(1'h0):(1'h0)] != (7'h41));
              reg61 <= ($signed((~|(wire53 ?
                  (reg59 ? reg58 : reg59) : (^reg58)))) >= (|wire54));
            end
          else
            begin
              reg60 <= (&(($signed((wire56 ? reg59 : wire55)) ?
                      wire56 : (+$unsigned(wire55))) ?
                  reg59 : $unsigned($signed((wire57 ? wire54 : wire53)))));
              reg61 <= wire55[(1'h0):(1'h0)];
            end
          reg62 <= ($signed($unsigned(wire56)) ^ (reg61[(2'h3):(2'h2)] ?
              $unsigned($signed(wire57[(3'h5):(3'h5)])) : (!($signed(reg58) - (wire57 ?
                  wire56 : wire56)))));
          reg63 <= reg61[(1'h1):(1'h0)];
        end
      else
        begin
          reg59 <= wire57;
          if (wire54[(1'h0):(1'h0)])
            begin
              reg60 <= $signed(((&($signed(reg59) ?
                  wire53 : $signed((8'h9e)))) << (&(~(reg63 ^~ (8'ha3))))));
            end
          else
            begin
              reg60 <= (($signed(reg60[(2'h3):(2'h3)]) - $unsigned($unsigned((wire57 ~^ reg60)))) ?
                  $unsigned((!$signed((reg59 ?
                      reg59 : (8'hae))))) : ($unsigned((reg63[(3'h7):(2'h2)] ?
                          (^~reg63) : {wire53})) ?
                      ((reg60 != wire56) & ((&reg59) ?
                          reg60 : $unsigned(reg62))) : $signed({{wire54,
                              reg60}})));
              reg61 <= $unsigned($unsigned((((reg58 ? wire53 : wire55) ?
                      (~|wire56) : reg61) ?
                  (reg63 >= reg62[(3'h5):(1'h1)]) : (^~(reg60 ~^ wire57)))));
              reg62 <= $signed($unsigned((|$signed({wire55, (8'had)}))));
              reg63 <= reg62;
              reg64 <= {($unsigned((reg60[(4'h9):(2'h3)] ?
                      (wire54 && reg58) : $signed(reg58))) <<< ((reg58[(4'hb):(3'h4)] >= $signed((8'hbf))) ?
                      $unsigned($signed((8'hbd))) : (7'h44))),
                  reg58};
            end
        end
      reg65 <= $signed(wire55);
      reg66 <= {$unsigned(reg63)};
    end
  always
    @(posedge clk) begin
      reg67 <= reg66;
      reg68 <= ({(reg60 ?
                  ((wire57 || wire55) ?
                      (reg67 ^~ reg59) : (~|wire55)) : ((reg65 < reg65) ^~ $signed((8'hb8))))} ?
          ((8'hbb) ?
              reg67 : $unsigned((!reg59))) : $unsigned($unsigned(reg65[(2'h2):(1'h1)])));
      reg69 <= ((-$signed({(reg58 == wire57)})) <= wire54[(2'h3):(1'h1)]);
    end
  assign wire70 = (~|$unsigned(($signed((wire54 ? reg59 : reg65)) ?
                      reg65[(2'h2):(1'h0)] : ((|reg62) || (8'hb6)))));
  always
    @(posedge clk) begin
      reg71 <= ($unsigned($unsigned((~|{wire53, reg66}))) ?
          (reg65[(1'h1):(1'h0)] >> $signed((~&$unsigned((8'hb4))))) : {$signed({(reg62 > wire57)}),
              (reg62[(2'h3):(1'h1)] ?
                  $unsigned($unsigned(reg68)) : ((^reg65) ?
                      $unsigned((8'hbd)) : wire70))});
      reg72 <= reg71[(3'h5):(3'h5)];
      reg73 <= reg59[(3'h6):(3'h4)];
      reg74 <= (!wire70);
      reg75 <= ($unsigned(($signed($signed(reg62)) ?
              reg62[(2'h3):(1'h1)] : reg61[(1'h1):(1'h0)])) ?
          $signed(wire54[(1'h1):(1'h1)]) : $unsigned(((!$unsigned(wire53)) ?
              (reg58 && (reg73 ? wire54 : reg61)) : (^~{wire70}))));
    end
  assign wire76 = wire70[(4'h9):(3'h7)];
  assign wire77 = (~|$signed((8'hbf)));
  always
    @(posedge clk) begin
      reg78 <= $signed(((reg62[(2'h3):(2'h3)] ?
          (^~$signed(reg58)) : (reg60 ?
              (reg58 ~^ (8'hbc)) : (reg68 >> reg64))) != reg58));
      if (reg69[(3'h7):(3'h5)])
        begin
          reg79 <= reg59;
          reg80 <= reg73;
          reg81 <= (wire76[(2'h2):(1'h1)] || $unsigned((($unsigned(reg59) ?
                  (reg63 >> wire57) : (!reg63)) ?
              $unsigned((reg60 && reg64)) : ((wire55 ?
                  reg61 : reg78) + $signed(wire53)))));
          if (reg73[(3'h5):(3'h5)])
            begin
              reg82 <= wire70;
              reg83 <= (~(((reg69[(4'h8):(1'h0)] ?
                      $unsigned((8'hbe)) : $signed(reg73)) ?
                  reg61[(3'h4):(2'h2)] : {reg78}) >= $signed($signed(wire54[(2'h3):(1'h0)]))));
              reg84 <= reg60;
              reg85 <= (wire76[(5'h14):(4'ha)] <= $unsigned(reg74[(3'h4):(3'h4)]));
            end
          else
            begin
              reg82 <= (reg68 ?
                  $unsigned((8'hb7)) : $signed((^($unsigned(reg59) ?
                      (reg61 + wire70) : (reg83 ? reg82 : wire57)))));
            end
          reg86 <= ((($signed(reg58) ?
                      ((~^reg66) ? (^reg75) : $unsigned(reg60)) : ((reg68 ?
                          reg63 : reg62) > reg72[(4'h8):(3'h7)])) ?
                  (($unsigned(wire55) ? wire76[(3'h5):(1'h0)] : wire57) ?
                      (~^(wire56 >> (8'hbb))) : $signed($unsigned(reg61))) : reg68[(4'h8):(1'h1)]) ?
              $signed((reg69[(3'h7):(3'h5)] >= wire57)) : (((8'hbd) ?
                      ($unsigned(reg62) ? (reg58 + reg85) : {wire57}) : reg78) ?
                  reg74[(1'h1):(1'h1)] : (((reg62 ?
                      reg59 : wire57) == (^reg84)) > {(^reg61),
                      $unsigned(reg75)})));
        end
      else
        begin
          reg79 <= reg63[(1'h1):(1'h0)];
          reg80 <= ($unsigned((reg63 ?
              ((~reg73) ? reg71 : (~^wire53)) : ({reg59, reg83} ?
                  $signed(wire70) : reg62[(2'h2):(2'h2)]))) << reg84[(4'hf):(4'h9)]);
          reg81 <= $unsigned({(~|reg81)});
        end
      if ($signed(($unsigned((!$signed((8'hbb)))) ? reg60 : wire55)))
        begin
          reg87 <= reg63[(2'h3):(2'h3)];
          reg88 <= ($signed($unsigned(wire54[(2'h3):(1'h0)])) ?
              $unsigned(((7'h44) ?
                  reg81 : $signed($signed(reg87)))) : ((~$signed((~&(8'hb0)))) != $unsigned(((reg67 ?
                  wire56 : reg85) * (reg86 << (8'hbe))))));
          reg89 <= $signed(reg68);
          reg90 <= $unsigned((wire57[(3'h6):(1'h1)] && ({$unsigned(reg75)} - $signed((!reg61)))));
          reg91 <= reg64;
        end
      else
        begin
          reg87 <= (reg68[(3'h7):(1'h1)] < ({$signed((~&reg68)),
                  $signed(reg63[(3'h4):(1'h0)])} ?
              $signed($signed($unsigned(reg82))) : ({(reg80 - reg69)} ~^ ((reg64 ?
                      reg63 : wire55) ?
                  reg90 : $unsigned(reg74)))));
          if ((8'hbc))
            begin
              reg88 <= ($signed(((^~reg67[(1'h0):(1'h0)]) < (-wire55[(1'h0):(1'h0)]))) ?
                  $unsigned((!(~(reg89 ? reg60 : (8'hae))))) : (~^(8'hbe)));
              reg89 <= wire57;
              reg90 <= ((8'hb9) > $unsigned(wire70));
              reg91 <= reg86[(3'h4):(3'h4)];
            end
          else
            begin
              reg88 <= $signed({(($unsigned(wire53) ~^ (reg59 ?
                          wire77 : (8'hb5))) ?
                      {$signed((8'hb6)), wire57} : ({(8'hb8)} >>> (8'haa))),
                  $unsigned(((&reg90) ?
                      (reg81 ? reg71 : reg78) : $signed(reg74)))});
            end
        end
      reg92 <= $unsigned(($unsigned(($unsigned(reg79) != (8'ha6))) ?
          ($unsigned((^~reg72)) ? reg88 : (-reg83)) : $unsigned(((reg73 ?
                  reg61 : reg60) ?
              $signed(reg83) : {reg82}))));
    end
  always
    @(posedge clk) begin
      reg93 <= (8'ha7);
    end
  assign wire94 = (8'ha8);
  assign wire95 = (reg84 ?
                      $signed($unsigned((~$unsigned(reg82)))) : $unsigned($signed(((reg82 & reg64) && {reg83,
                          reg93}))));
  always
    @(posedge clk) begin
      reg96 <= reg88[(5'h10):(4'hf)];
      reg97 <= reg91[(3'h6):(3'h6)];
      if ($signed(reg81[(4'ha):(4'h9)]))
        begin
          reg98 <= $signed((^~(((8'h9c) ? $unsigned((8'h9c)) : (^~(8'hb6))) ?
              reg93[(3'h7):(3'h7)] : ({(8'hb8)} ?
                  reg83[(2'h2):(2'h2)] : reg81))));
          reg99 <= $signed(reg97);
          if ({$signed(($signed((reg79 ^ reg79)) ?
                  (&(+reg97)) : reg98[(2'h2):(1'h1)])),
              (reg91[(3'h4):(1'h0)] ?
                  (reg83 > wire55) : {reg78,
                      $unsigned(((8'hb9) ? reg59 : wire54))})})
            begin
              reg100 <= $unsigned({wire55});
              reg101 <= (^~$unsigned(reg83));
              reg102 <= wire54;
              reg103 <= reg62;
              reg104 <= (reg83 <<< ({($signed((8'hbf)) ?
                      {(8'hb4)} : {reg99, reg71}),
                  $signed({wire57, wire55})} ^ $signed((reg68 ?
                  $unsigned(reg88) : $signed((8'hb1))))));
            end
          else
            begin
              reg100 <= $signed($signed((8'hab)));
              reg101 <= (7'h43);
              reg102 <= wire55[(3'h7):(1'h1)];
              reg103 <= (&{reg92[(4'h8):(3'h6)]});
              reg104 <= reg104[(5'h10):(3'h4)];
            end
        end
      else
        begin
          reg98 <= (-(^~{$signed(wire76[(1'h1):(1'h1)]),
              wire56[(4'hf):(1'h1)]}));
          if (($unsigned(reg93) ?
              reg67 : $unsigned($signed(($unsigned(reg78) ?
                  $signed(reg72) : ((8'hb0) ~^ reg80))))))
            begin
              reg99 <= wire94;
              reg100 <= wire53[(4'ha):(2'h3)];
              reg101 <= $unsigned({$unsigned(reg99)});
              reg102 <= (~&$signed($signed(($signed(reg97) ?
                  {(8'hb7)} : (reg90 ? (8'hbc) : reg66)))));
              reg103 <= (^(8'hb3));
            end
          else
            begin
              reg99 <= wire56;
              reg100 <= $unsigned({reg85[(2'h3):(2'h2)],
                  $signed(wire77[(4'h8):(3'h5)])});
              reg101 <= $unsigned($signed($signed((reg72 ?
                  {reg97, reg102} : reg93[(1'h0):(1'h0)]))));
              reg102 <= $signed($signed(reg84[(4'hb):(1'h0)]));
              reg103 <= ($signed($signed($signed(wire70[(3'h5):(2'h3)]))) ?
                  $unsigned($unsigned({reg66[(1'h1):(1'h1)]})) : reg82[(3'h4):(2'h3)]);
            end
        end
    end
  assign wire105 = reg103[(2'h3):(2'h3)];
  assign wire106 = (reg83[(5'h13):(5'h10)] ?
                       (+$unsigned($unsigned($signed(reg59)))) : reg84);
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire21;
  input wire signed [(4'hc):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire29,
                 wire28,
                 wire23,
                 wire22,
                 reg43,
                 reg42,
                 reg41,
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
                 reg30,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire22 = (8'ha8);
  assign wire23 = wire18[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg24 <= {(^~{(+$unsigned(wire22)),
              (wire21[(1'h0):(1'h0)] ?
                  (wire20 & wire19) : (wire19 ? wire19 : wire19))}),
          $signed(($unsigned($signed(wire18)) ?
              $unsigned((~|wire20)) : {((8'haa) ? wire20 : wire20)}))};
      reg25 <= $signed(wire23);
      reg26 <= $signed((~&wire20[(2'h3):(2'h2)]));
      reg27 <= $unsigned(wire22[(4'hb):(2'h2)]);
    end
  assign wire28 = (wire21 ? wire20 : {wire19, wire20});
  assign wire29 = (-((~&$unsigned(reg24)) || (($signed(wire21) != $unsigned(wire18)) < ((reg24 > wire19) ?
                      $unsigned(reg24) : reg25[(2'h3):(2'h3)]))));
  always
    @(posedge clk) begin
      reg30 <= wire20[(4'h8):(3'h7)];
      if ($unsigned(wire21))
        begin
          reg31 <= ((8'ha7) ?
              ($signed(((wire28 ^~ wire29) < (7'h43))) <= (-{wire28[(4'h8):(1'h0)]})) : {wire23});
          if ({reg25[(1'h1):(1'h0)]})
            begin
              reg32 <= $signed((~|(^~wire23)));
              reg33 <= ($unsigned(reg31) ?
                  ({((reg32 ?
                          wire18 : (8'ha6)) != $signed(wire19))} + $unsigned((8'haf))) : (({(wire18 * wire21)} != (&(wire28 ?
                      (8'hb4) : reg25))) <<< {$signed($signed(reg25)),
                      ((reg27 ? reg31 : wire21) ? reg24 : {wire23})}));
              reg34 <= (|wire18);
              reg35 <= wire28[(3'h5):(3'h4)];
            end
          else
            begin
              reg32 <= {$unsigned((~|$unsigned(wire29[(4'h8):(3'h4)]))),
                  (reg24 ?
                      $unsigned((~(~wire21))) : {$unsigned($signed(reg34))})};
              reg33 <= (~reg34);
              reg34 <= $signed($signed((!(wire22 << $signed(reg32)))));
              reg35 <= wire23;
              reg36 <= $signed({reg25[(3'h4):(2'h2)]});
            end
          reg37 <= reg32[(3'h4):(2'h3)];
          reg38 <= {$unsigned(reg24)};
        end
      else
        begin
          reg31 <= (!reg26);
        end
      if (wire28[(3'h5):(2'h3)])
        begin
          reg39 <= ((|(~((reg27 ? wire21 : reg30) + {(8'h9f)}))) ?
              reg26[(1'h1):(1'h0)] : $signed({($signed((8'hbe)) ?
                      (reg36 ? reg33 : reg36) : {reg34, (8'h9c)})}));
        end
      else
        begin
          reg39 <= (reg32 ?
              reg27[(4'hf):(1'h1)] : ((($unsigned(reg33) ?
                  (+reg24) : $unsigned(reg38)) == (reg26[(1'h1):(1'h1)] ?
                  (wire19 <<< reg27) : (wire23 <<< reg36))) < (&{reg32[(1'h0):(1'h0)],
                  $signed(wire29)})));
          if (reg33)
            begin
              reg40 <= reg32;
              reg41 <= {$unsigned((($signed(reg33) ?
                          (wire28 ? reg25 : wire19) : $signed(reg34)) ?
                      (|(reg40 != reg37)) : (reg38[(3'h4):(3'h4)] >= (wire23 ?
                          wire29 : wire18))))};
              reg42 <= ($unsigned((($unsigned(reg36) ?
                  wire18[(3'h4):(2'h3)] : (8'h9f)) >> $unsigned(reg35))) != ({wire28} ?
                  (8'ha7) : $signed((reg41[(4'hc):(1'h1)] ?
                      (&wire20) : wire19))));
            end
          else
            begin
              reg40 <= {wire21[(1'h1):(1'h1)],
                  ($unsigned($unsigned($signed(reg37))) >>> reg40[(3'h5):(2'h2)])};
            end
        end
      reg43 <= (reg24 ? reg24 : $unsigned(wire19[(1'h0):(1'h0)]));
    end
  assign wire44 = wire28[(4'hd):(3'h4)];
  assign wire45 = (7'h42);
  assign wire46 = $signed((|$signed($signed((reg41 ? wire23 : wire23)))));
  assign wire47 = reg41;
  assign wire48 = (7'h42);
endmodule
