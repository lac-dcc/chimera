module top
#(parameter param152 = (+(({(~|(8'hb6)), ((8'haf) ? (8'ha9) : (8'hb1))} ? (((8'ha4) + (8'hae)) ? ((8'hb5) & (8'ha3)) : {(8'h9c)}) : (((8'hb5) ? (8'h9c) : (7'h42)) ? {(8'ha7)} : (+(8'hb7)))) ? (8'hb9) : (({(8'hab)} == ((8'hb9) ^~ (8'ha1))) > (((7'h44) >> (7'h41)) ? {(8'hbf)} : ((8'hb2) ^ (8'hbc)))))), 
parameter param153 = (((8'h9f) * (&(((8'ha1) ~^ param152) ? (~param152) : (param152 ~^ param152)))) ? ((7'h40) & (((param152 - param152) - param152) ? (param152 * {param152}) : (&param152))) : param152))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire151;
  wire signed [(4'ha):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire149;
  wire signed [(5'h15):(1'h0)] wire148;
  wire signed [(2'h2):(1'h0)] wire147;
  wire [(3'h5):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire144,
                 wire10,
                 wire9,
                 wire4,
                 reg146,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed(($signed($signed(((8'hbe) ?
                     wire1 : wire0))) ~^ wire3));
  always
    @(posedge clk) begin
      reg5 <= ($signed({((~|wire4) ^ $signed((8'ha5)))}) ?
          $signed($signed({((8'hac) ? wire4 : wire0)})) : wire4[(4'h8):(3'h7)]);
      reg6 <= reg5;
      reg7 <= (reg6[(4'h8):(1'h1)] ? wire0[(5'h11):(5'h11)] : wire4);
      reg8 <= ((7'h41) ^ wire0[(4'hb):(3'h4)]);
    end
  assign wire9 = wire0[(4'h9):(1'h0)];
  assign wire10 = (8'ha6);
  module11 #() modinst145 (.wire15(reg7), .clk(clk), .wire12(wire1), .y(wire144), .wire14(reg5), .wire13(wire3));
  always
    @(posedge clk) begin
      reg146 <= wire3;
    end
  assign wire147 = (reg6[(3'h7):(1'h0)] ?
                       (~&{{(wire9 ? reg7 : wire1), (^(8'ha1))}}) : reg7);
  assign wire148 = $signed((wire10 ? wire147 : $signed(wire4[(4'hf):(4'ha)])));
  assign wire149 = (&(&$signed(wire3)));
  assign wire150 = $signed($unsigned(($signed({wire3, reg146}) ?
                       $signed(wire10) : ($unsigned((8'ha8)) != wire4))));
  assign wire151 = {(&wire4[(4'hf):(2'h2)])};
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire15;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(5'h14):(1'h0)] wire140;
  wire signed [(4'ha):(1'h0)] wire139;
  wire signed [(4'h8):(1'h0)] wire138;
  wire [(5'h11):(1'h0)] wire133;
  wire signed [(4'h9):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire131;
  reg signed [(4'he):(1'h0)] reg137 = (1'h0);
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(4'hb):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg134 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire133,
                 wire96,
                 wire40,
                 wire131,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  module16 #() modinst41 (.wire20(wire14), .wire21(wire13), .wire18(wire12), .clk(clk), .wire17((8'had)), .wire19(wire15), .y(wire40));
  module42 #() modinst97 (wire96, clk, wire40, wire12, wire14, wire15, wire13);
  module98 #() modinst132 (.wire103(wire96), .y(wire131), .wire101(wire15), .wire99(wire14), .clk(clk), .wire100(wire40), .wire102(wire12));
  assign wire133 = wire14[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      if (wire14)
        begin
          reg134 <= wire133[(5'h10):(4'he)];
          reg135 <= wire131;
        end
      else
        begin
          reg134 <= {wire15};
          reg135 <= (((^~(!(+reg134))) & ($unsigned(wire133) ?
                  (wire40[(5'h10):(4'h8)] != ((8'h9e) ?
                      (8'hb9) : wire13)) : (|(wire133 != wire131)))) ?
              (reg135 ^~ $signed(($signed(reg135) ^~ wire96[(3'h6):(2'h3)]))) : $unsigned((wire40 ?
                  $unsigned(wire14[(4'hd):(4'h9)]) : (~wire40))));
          reg136 <= (~wire131);
        end
      reg137 <= (-(($unsigned({reg134, wire13}) ?
              wire14[(5'h13):(1'h1)] : $unsigned(((8'hb0) >> wire96))) ?
          {(7'h41), (~^$unsigned(reg135))} : wire15));
    end
  assign wire138 = wire15[(2'h2):(1'h1)];
  assign wire139 = {$signed($unsigned((wire15 ?
                           wire15[(2'h3):(2'h3)] : $signed(wire12)))),
                       wire14};
  assign wire140 = {{(!(+(wire139 > wire131)))}, $unsigned((!wire138))};
  assign wire141 = (+$signed($unsigned($unsigned($unsigned(wire12)))));
  assign wire142 = ((~|{{(wire15 ? wire138 : reg135), wire131},
                       wire40[(3'h7):(2'h2)]}) ^~ {wire139[(1'h0):(1'h0)],
                       (|$unsigned((wire138 && (8'hb8))))});
  assign wire143 = wire12;
endmodule

module module98
#(parameter param130 = ((8'ha6) >> (!((|((8'hae) ? (7'h41) : (8'haa))) + {(~^(8'hac)), ((8'hb1) ? (8'ha8) : (8'hb1))}))))
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire103;
  input wire [(3'h5):(1'h0)] wire102;
  input wire signed [(3'h4):(1'h0)] wire101;
  input wire signed [(5'h10):(1'h0)] wire100;
  input wire [(4'hb):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire128;
  wire [(4'hb):(1'h0)] wire127;
  wire [(4'he):(1'h0)] wire125;
  wire [(5'h15):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(4'h8):(1'h0)] wire122;
  wire [(3'h7):(1'h0)] wire121;
  wire signed [(2'h3):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire119;
  wire [(2'h2):(1'h0)] wire118;
  wire [(3'h6):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire112;
  wire [(4'hf):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire104;
  reg [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
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
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire105,
                 wire104,
                 reg126,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire104 = wire102;
  assign wire105 = (({($unsigned(wire100) ?
                           $unsigned(wire103) : {wire101, wire103}),
                       $signed((-wire99))} && (|wire102)) >= ($unsigned((+(wire103 ?
                       wire99 : (8'hb7)))) != {$unsigned((~&wire103))}));
  always
    @(posedge clk) begin
      if ((~^$signed((-$signed((wire104 ? wire105 : wire101))))))
        begin
          reg106 <= ({wire104[(3'h4):(1'h0)], (^wire101[(1'h0):(1'h0)])} ?
              $signed((~^((~^wire102) ?
                  wire104[(3'h5):(1'h1)] : (~^wire102)))) : ((((!wire105) - wire101[(3'h4):(2'h3)]) ?
                  {wire104,
                      (wire102 ?
                          wire104 : wire105)} : wire99) & {$signed($signed(wire101)),
                  $signed((wire103 != wire104))}));
          reg107 <= (-$unsigned((wire104 * ((-wire102) | (wire105 ?
              reg106 : wire101)))));
          reg108 <= $signed(($signed((~^wire105)) ?
              ($signed((wire101 ? wire99 : wire104)) ?
                  (-$unsigned(wire100)) : (^~$signed((8'had)))) : (~((wire99 * wire101) ?
                  $signed((8'h9d)) : wire100[(4'h9):(3'h7)]))));
          reg109 <= (reg107 ?
              $signed(((wire102[(1'h1):(1'h0)] ?
                      wire103[(1'h1):(1'h1)] : $signed(wire101)) ?
                  {(|wire102)} : $unsigned((wire101 || wire99)))) : $signed((~&$signed((&(8'hb5))))));
        end
      else
        begin
          reg106 <= reg106[(3'h5):(3'h4)];
          reg107 <= reg109[(5'h12):(4'hc)];
          reg108 <= (((8'ha7) ?
                  $unsigned({wire101, (wire104 && wire104)}) : (~((|reg109) ?
                      wire102[(2'h2):(2'h2)] : {reg108}))) ?
              $unsigned((((^~wire102) >> (&reg107)) < {(+(7'h40)),
                  reg107[(3'h4):(1'h1)]})) : wire103);
        end
    end
  assign wire110 = {(((-(8'hb6)) ?
                           $unsigned((~wire100)) : wire103[(2'h2):(2'h2)]) + $signed($signed(wire105[(2'h2):(1'h1)])))};
  assign wire111 = wire100;
  assign wire112 = ((&$unsigned(($signed((8'hba)) & wire105))) ^ ($unsigned((^~(wire104 ?
                           reg107 : (8'ha1)))) ?
                       reg106 : ($unsigned((wire103 ? wire110 : (8'ha8))) ?
                           (8'ha3) : $unsigned((wire105 ?
                               wire110 : (8'hb2))))));
  assign wire113 = ((8'h9c) ?
                       ((wire99[(2'h3):(1'h0)] ?
                           (8'hab) : $unsigned(wire99)) ^~ (!reg106[(2'h3):(2'h2)])) : wire100[(4'h9):(1'h1)]);
  assign wire114 = wire113;
  assign wire115 = ($unsigned((+($unsigned((7'h44)) << (wire102 > wire105)))) ?
                       (($signed($signed(wire103)) ?
                           $unsigned($signed(wire105)) : wire110[(4'he):(1'h0)]) ^~ ({$signed((8'hbf)),
                               $signed(wire113)} ?
                           $unsigned((reg107 >>> wire113)) : ($signed(wire111) ?
                               reg108[(5'h10):(1'h0)] : $signed(wire104)))) : (+$signed(reg109)));
  assign wire116 = ($signed((^{(~^wire100), (wire103 ? wire112 : wire99)})) ?
                       ($signed({(wire115 ?
                               wire99 : reg106)}) * ((~^wire110[(4'hc):(2'h2)]) ?
                           (~|((8'hb3) >>> wire99)) : $signed($unsigned(reg108)))) : ($unsigned((-$unsigned(wire102))) ?
                           (8'hb8) : wire115[(4'hb):(1'h0)]));
  assign wire117 = (+$signed(wire116[(3'h5):(3'h5)]));
  assign wire118 = (~$unsigned(wire111));
  assign wire119 = wire99[(3'h4):(1'h1)];
  assign wire120 = $unsigned({wire116});
  assign wire121 = wire119[(3'h6):(1'h0)];
  assign wire122 = (^(&$signed($unsigned((wire111 ? wire117 : wire99)))));
  assign wire123 = (7'h42);
  assign wire124 = (wire122[(3'h6):(2'h2)] ?
                       $unsigned(($unsigned(wire120[(1'h1):(1'h1)]) ?
                           $unsigned($signed(wire123)) : $signed((-wire101)))) : (^~$signed($unsigned({wire110,
                           wire119}))));
  assign wire125 = (7'h40);
  always
    @(posedge clk) begin
      reg126 <= wire123;
    end
  assign wire127 = $signed($unsigned($unsigned($unsigned((wire99 ?
                       wire125 : wire123)))));
  assign wire128 = (^~wire115[(1'h0):(1'h0)]);
  assign wire129 = {($unsigned({$signed(wire120),
                           $unsigned(reg107)}) < ({(wire116 != wire125),
                               $unsigned(wire124)} ?
                           (&(+wire118)) : ({wire121} ?
                               $unsigned(wire102) : {wire113, (8'hba)})))};
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h24a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire47;
  input wire signed [(5'h10):(1'h0)] wire46;
  input wire [(5'h13):(1'h0)] wire45;
  input wire [(4'ha):(1'h0)] wire44;
  input wire [(3'h6):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire48;
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  assign y = {wire95,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire48,
                 reg94,
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
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire48 = {(wire43 ? wire45[(2'h3):(2'h2)] : wire47)};
  always
    @(posedge clk) begin
      reg49 <= $signed((((&(wire48 ?
              wire47 : wire44)) + wire47[(4'h8):(1'h0)]) ?
          (wire45 >> wire48[(2'h2):(1'h1)]) : wire43));
      reg50 <= $unsigned($signed($signed($unsigned(wire45))));
      reg51 <= ({$signed(wire47[(5'h11):(4'h8)]),
              (reg49[(1'h0):(1'h0)] ?
                  ({(8'hb3)} ~^ $signed((8'hba))) : $signed($signed(wire47)))} ?
          ((~^$signed((wire44 != reg50))) ?
              (8'hb4) : wire45) : wire46[(1'h1):(1'h1)]);
      reg52 <= (wire46 | (-(wire48[(2'h3):(1'h1)] ?
          (wire43[(2'h3):(1'h0)] ?
              $signed(wire46) : (wire46 + wire44)) : wire43[(3'h6):(2'h3)])));
      reg53 <= wire44[(4'h9):(1'h1)];
    end
  assign wire54 = wire45[(4'ha):(1'h1)];
  assign wire55 = wire45;
  assign wire56 = (({(8'hb0)} ?
                      ({wire44} < ($unsigned(wire47) == (wire54 < (7'h44)))) : {wire46[(1'h1):(1'h1)]}) && reg50[(2'h3):(2'h3)]);
  assign wire57 = (~((8'ha7) > reg51));
  assign wire58 = $signed(wire55);
  assign wire59 = ({$signed($unsigned({reg49})),
                      ({$unsigned(reg49)} || (~^(wire57 ?
                          reg51 : reg51)))} ^ $unsigned((reg49 * $unsigned($unsigned(wire56)))));
  assign wire60 = $signed((($unsigned($signed(wire43)) && wire44) == ($signed(reg49[(3'h5):(1'h0)]) ?
                      $signed((wire46 * wire47)) : $unsigned(((7'h40) ?
                          wire57 : wire55)))));
  assign wire61 = {($unsigned($unsigned(reg51)) >> $signed((reg51[(4'hc):(2'h3)] ?
                          (wire45 ? wire57 : reg53) : ((8'ha5) <= (8'hbb)))))};
  assign wire62 = $unsigned($unsigned(((+{reg52}) | ($signed(wire45) > (~&wire46)))));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(((~^wire57) ? wire46 : {$signed(wire46)}))))
        begin
          if (($unsigned((+((^~reg52) ?
              ((8'ha4) + reg53) : $unsigned(wire57)))) | $signed(wire44[(2'h2):(1'h1)])))
            begin
              reg63 <= ((8'haa) > reg49);
            end
          else
            begin
              reg63 <= ($signed({{reg52[(3'h5):(3'h4)]}, (~^$signed(reg51))}) ?
                  $signed(reg53[(3'h6):(3'h5)]) : $signed($unsigned($unsigned($unsigned(wire60)))));
              reg64 <= wire59[(2'h2):(1'h1)];
            end
        end
      else
        begin
          reg63 <= wire56;
          reg64 <= $signed(wire62);
          if (wire56[(4'he):(4'h8)])
            begin
              reg65 <= (-$unsigned(wire60[(3'h7):(3'h4)]));
              reg66 <= $unsigned($signed(($signed((wire61 ?
                  wire45 : wire57)) <= wire44[(4'ha):(4'h9)])));
              reg67 <= $unsigned((~&wire45[(4'he):(4'h8)]));
            end
          else
            begin
              reg65 <= ((reg66[(2'h3):(1'h1)] ?
                  (-(reg51 * {wire62,
                      reg50})) : ($unsigned($unsigned((8'h9c))) ?
                      ($unsigned(wire60) > $signed(wire45)) : (~|(wire44 ?
                          wire43 : wire59)))) ~^ (wire46 - wire57[(4'hc):(3'h5)]));
              reg66 <= $signed(reg64);
            end
          reg68 <= (~(reg66 * $unsigned($unsigned((reg66 && (8'hb0))))));
          if ((wire43[(3'h4):(2'h2)] * reg49))
            begin
              reg69 <= (~$signed({$unsigned((reg66 << reg52))}));
              reg70 <= $signed((|reg68));
            end
          else
            begin
              reg69 <= {(+reg66), (^reg51)};
              reg70 <= (($signed(reg49) == reg53) ?
                  $signed((8'hb7)) : $signed(($unsigned((reg52 != reg51)) <= $unsigned($signed(reg64)))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg71 <= ((+$unsigned({(reg63 >= wire61), $unsigned(reg49)})) ?
          ($unsigned(((^(8'hb7)) ? reg52 : (^~reg64))) ?
              ((reg70 < (^~reg67)) >= reg65) : reg70) : $unsigned(wire56[(1'h1):(1'h0)]));
    end
  assign wire72 = $signed($unsigned($signed(($unsigned(wire47) < $signed(wire45)))));
  assign wire73 = (^(8'ha9));
  assign wire74 = reg69[(4'hb):(4'h8)];
  assign wire75 = (reg52 ?
                      (~^(-({(8'ha4), reg49} ?
                          (-wire56) : $unsigned(wire62)))) : $signed($unsigned((~^wire60[(4'hb):(2'h3)]))));
  assign wire76 = ($unsigned(reg70) ?
                      $signed(wire75[(5'h11):(5'h11)]) : reg53[(2'h3):(1'h0)]);
  assign wire77 = $signed(reg66);
  assign wire78 = wire60;
  always
    @(posedge clk) begin
      if ($signed($signed(reg68)))
        begin
          reg79 <= wire73[(2'h3):(1'h0)];
          if ($unsigned(({wire61} ?
              reg64[(2'h3):(2'h3)] : wire73[(1'h0):(1'h0)])))
            begin
              reg80 <= (((-reg71[(2'h3):(1'h1)]) ?
                  $signed((!(!wire73))) : ((((8'hb7) | wire58) ?
                          $signed(wire54) : {wire44}) ?
                      $unsigned((&wire46)) : wire54)) ^ ($signed({(reg69 ?
                          wire56 : reg69)}) ?
                  wire78 : reg52));
              reg81 <= ($unsigned((^(reg71[(2'h3):(1'h0)] == $signed(reg66)))) ?
                  ($unsigned(($signed(reg63) ?
                      reg49 : $unsigned(wire46))) <= (-$unsigned($signed((8'hb4))))) : ($unsigned(((wire54 ?
                      (8'hba) : reg53) >>> {wire45})) << $signed(((reg79 ^ wire54) ~^ $signed((8'hae))))));
              reg82 <= reg50;
              reg83 <= $signed({{wire72},
                  ($signed(wire60) ~^ $signed($unsigned(wire45)))});
              reg84 <= wire45[(4'h9):(3'h5)];
            end
          else
            begin
              reg80 <= (+wire45[(2'h2):(1'h0)]);
              reg81 <= (($unsigned({(~|reg71), reg83}) ?
                      (((reg65 ? (8'hae) : wire72) >= $unsigned(reg84)) ?
                          reg69 : (^~reg68)) : $unsigned(reg63[(4'he):(4'hb)])) ?
                  (~(wire72 ?
                      ((reg81 ? wire74 : reg82) ?
                          (reg66 != reg63) : {reg79}) : $signed({wire61}))) : $unsigned($unsigned((!(reg70 * reg51)))));
            end
          reg85 <= reg66[(2'h3):(1'h1)];
          if (reg70[(3'h4):(1'h1)])
            begin
              reg86 <= (~|(|reg83[(4'ha):(2'h2)]));
            end
          else
            begin
              reg86 <= (reg64[(3'h7):(1'h1)] ?
                  $signed(reg50) : (wire60[(4'h9):(3'h7)] != (8'hb7)));
              reg87 <= wire59;
              reg88 <= reg66;
              reg89 <= $signed((&$unsigned(((wire57 ?
                  (8'hb1) : reg50) != {wire74}))));
            end
        end
      else
        begin
          reg79 <= (~&wire46);
          reg80 <= reg70[(4'hb):(3'h7)];
          reg81 <= ((+(wire76 ^ (~&(&(8'hba))))) * ({$signed((+wire57))} ?
              reg67[(2'h2):(1'h1)] : $signed(({reg87,
                  wire57} << $unsigned((8'hb6))))));
          if (reg71[(2'h3):(1'h1)])
            begin
              reg82 <= $signed(reg53[(3'h5):(1'h0)]);
              reg83 <= {{(!({wire59, (8'hba)} ?
                          (reg69 ? wire78 : (7'h42)) : (wire60 & wire45))),
                      reg50[(1'h1):(1'h0)]},
                  $unsigned(wire57[(4'h8):(3'h7)])};
              reg84 <= (reg80 < $signed((&((reg89 ? reg89 : wire54) ?
                  (8'hba) : (reg79 ? reg89 : reg84)))));
              reg85 <= $signed((((wire56 ? reg71 : (+wire56)) ?
                      wire46 : (wire73[(4'hb):(3'h5)] ?
                          (reg83 ? (8'h9c) : (8'haa)) : $signed(reg68))) ?
                  ({(wire54 ? reg64 : reg71), $signed(wire46)} ?
                      wire47[(4'hb):(3'h6)] : $signed((|(8'h9e)))) : ($signed(reg64) ?
                      (!$unsigned(wire76)) : (wire58[(4'h8):(2'h3)] ?
                          {reg51, reg81} : wire62))));
            end
          else
            begin
              reg82 <= {((!(wire55 ?
                      (^wire55) : wire43[(3'h4):(3'h4)])) * {(&(reg53 << reg69))})};
            end
          reg86 <= $signed((~|wire43[(2'h3):(1'h0)]));
        end
      reg90 <= $unsigned(reg67[(2'h3):(2'h2)]);
      if (reg80)
        begin
          reg91 <= $signed($unsigned($unsigned((!$unsigned(reg51)))));
        end
      else
        begin
          reg91 <= ($signed($signed($signed(wire48))) <= (reg85[(5'h15):(5'h14)] - ($signed((8'hb2)) ?
              $unsigned($signed(reg53)) : $signed(reg81))));
          reg92 <= $unsigned((~&$signed(wire74[(4'ha):(4'h8)])));
          reg93 <= ($unsigned(($signed((~^wire72)) ?
                  (wire48[(4'h8):(2'h2)] * {reg83}) : reg90)) ?
              $signed($unsigned($unsigned(wire74[(4'hd):(3'h6)]))) : (+$unsigned((~|$unsigned((8'h9f))))));
        end
      reg94 <= wire61;
    end
  assign wire95 = $unsigned(reg63);
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire21;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire signed [(3'h4):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire [(3'h7):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire24,
                 wire23,
                 wire22,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire22 = (wire19 <= $unsigned($unsigned(($unsigned(wire19) ?
                      $signed(wire17) : ((8'h9f) > wire18)))));
  assign wire23 = wire22;
  assign wire24 = wire18[(4'hc):(4'ha)];
  always
    @(posedge clk) begin
      reg25 <= wire20;
      if (((({(~(8'h9c)),
          (wire24 | wire23)} <= ((reg25 << wire20) || $signed(wire18))) > wire20) + $unsigned($signed(wire18))))
        begin
          reg26 <= $unsigned($signed(wire19[(2'h3):(1'h0)]));
          reg27 <= ($unsigned({$unsigned($unsigned(wire22))}) > $signed(($unsigned($unsigned(wire23)) == (^~(wire19 ?
              wire22 : wire23)))));
          reg28 <= wire22;
          reg29 <= ((~^(8'hb8)) ?
              $signed(($unsigned({wire23}) & {wire23[(1'h0):(1'h0)]})) : $signed($unsigned(((wire24 >>> reg25) ?
                  reg26 : (8'ha7)))));
          reg30 <= ({(~|(reg25 ? $signed(wire18) : $unsigned(reg29))),
                  (!(|(8'hb7)))} ?
              wire24[(2'h3):(1'h1)] : $unsigned((wire20 <= ($signed(reg28) ^ reg28))));
        end
      else
        begin
          reg26 <= $unsigned(wire20);
        end
      reg31 <= $unsigned(((~{(reg27 ? wire24 : wire22), $signed((8'hae))}) ?
          reg27[(2'h2):(2'h2)] : wire23));
    end
  assign wire32 = (~^({wire20[(3'h4):(2'h3)],
                      (reg31[(2'h2):(2'h2)] ?
                          (wire23 + reg28) : $signed((8'hae)))} < wire23));
  assign wire33 = {(wire18[(4'ha):(3'h6)] * (wire22 <= {(~|(8'ha1)),
                          wire22[(2'h3):(1'h1)]})),
                      ((|wire32) != (&($signed(wire19) | $unsigned(reg28))))};
  assign wire34 = reg31;
  assign wire35 = $unsigned(reg26[(4'hd):(4'hd)]);
  assign wire36 = wire35[(2'h2):(1'h1)];
  assign wire37 = wire35[(3'h5):(2'h3)];
  assign wire38 = (+wire37);
  assign wire39 = (8'hbc);
endmodule
