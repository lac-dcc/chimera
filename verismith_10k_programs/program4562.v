module top
#(parameter param149 = (8'ha0), 
parameter param150 = param149)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire147;
  wire signed [(2'h2):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire147,
                 wire18,
                 wire4,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (((8'ha8) ?
                     wire3[(2'h2):(1'h0)] : ($unsigned((wire1 <<< wire2)) == {(!wire3),
                         $unsigned((8'hb3))})) <<< wire2);
  always
    @(posedge clk) begin
      if ({(wire1 ?
              $unsigned($unsigned({wire2,
                  (8'h9f)})) : (^~$signed($signed((8'had))))),
          {(^((~&wire4) ? (~&(8'hbc)) : (wire2 ? (8'ha6) : (8'hb8))))}})
        begin
          reg5 <= $unsigned(($unsigned(({wire1} ?
              $signed(wire4) : wire3)) > ((wire0 < (+wire4)) * (~&wire4[(3'h4):(2'h3)]))));
          reg6 <= $signed((wire4[(3'h4):(2'h2)] & {((wire2 >> (8'hbd)) + wire0)}));
          reg7 <= ((8'ha0) ^ $unsigned(($signed((wire1 << wire1)) != (!wire0[(2'h2):(1'h1)]))));
        end
      else
        begin
          reg5 <= wire0;
          if ((8'h9e))
            begin
              reg6 <= ($unsigned((~|((wire4 ? wire1 : wire4) ?
                      (reg6 ? wire1 : wire2) : (reg6 ? reg5 : wire4)))) ?
                  ((^~(reg7 ? wire3 : (wire2 ? wire2 : reg5))) ?
                      $unsigned(((~^reg7) && $signed(wire4))) : wire2[(4'hd):(2'h3)]) : $unsigned(wire3));
              reg7 <= {wire0[(3'h5):(2'h2)],
                  $unsigned((($signed(wire4) ?
                      $signed((8'hbe)) : $signed(wire3)) + $signed((^(8'ha4)))))};
              reg8 <= reg5[(1'h0):(1'h0)];
            end
          else
            begin
              reg6 <= $signed(wire4[(4'hf):(4'hb)]);
              reg7 <= {{reg5}, $unsigned($signed(reg5[(4'hf):(1'h0)]))};
            end
          reg9 <= (!(|$signed(($signed(wire2) > (wire4 < wire0)))));
          reg10 <= (^~reg6);
          if (reg7)
            begin
              reg11 <= ((^({(reg9 ^~ wire3),
                  $signed(reg8)} <= (reg6[(4'hb):(3'h7)] ?
                  (wire2 < wire1) : wire3[(1'h0):(1'h0)]))) + $signed(wire1));
              reg12 <= $unsigned(reg9[(4'hc):(4'hb)]);
              reg13 <= (~|reg9);
              reg14 <= $unsigned(reg6);
            end
          else
            begin
              reg11 <= $unsigned((|(((reg11 <<< reg14) ?
                      {(7'h44), reg8} : reg5[(4'h8):(2'h2)]) ?
                  ($signed(reg12) ? $signed(reg12) : (|reg14)) : reg8)));
              reg12 <= ($unsigned($unsigned(wire2)) || reg10[(2'h2):(1'h0)]);
            end
        end
      reg15 <= (&reg10[(4'hb):(2'h3)]);
      reg16 <= ({(|reg9), $signed(($unsigned(reg14) || $unsigned(reg12)))} ?
          reg8[(2'h3):(2'h2)] : (((^~$unsigned((8'hb2))) >= reg8[(3'h6):(3'h5)]) ?
              reg5[(3'h4):(3'h4)] : $signed(($signed(wire2) ?
                  $unsigned(reg9) : (reg15 ? reg12 : (7'h41))))));
      reg17 <= $signed((wire4 ?
          (reg8 ?
              (wire0[(1'h0):(1'h0)] >> (wire1 - (8'hbc))) : (wire3[(3'h5):(1'h1)] <= (8'ha5))) : (^~$signed((~reg12)))));
    end
  assign wire18 = ($unsigned($unsigned((+((8'hac) ? reg7 : reg7)))) ?
                      reg12 : reg8[(3'h4):(3'h4)]);
  module19 #() modinst148 (.clk(clk), .wire22(reg17), .wire20(wire3), .wire21(reg6), .wire23(wire4), .y(wire147));
endmodule

module module19
#(parameter param145 = (|((((~|(8'hb8)) ? ((7'h41) ^~ (8'ha4)) : ((8'ha2) - (8'hb0))) ? (((8'h9c) ? (8'hab) : (8'ha4)) ? ((8'hbd) ? (8'hb9) : (8'haa)) : (|(8'hab))) : (+((8'hbc) ? (8'hbe) : (7'h41)))) ? ((-((8'h9c) ? (8'hbd) : (8'hbb))) >>> (((8'hab) ? (8'h9c) : (8'hb2)) << ((8'hbf) ? (8'ha8) : (8'hbc)))) : {((|(8'ha1)) & ((8'hbd) << (7'h42)))})), 
parameter param146 = ({{{(param145 || param145)}, ((~&param145) >> (param145 >>> param145))}, ((8'ha5) ? param145 : (((8'hac) ? (8'hba) : param145) ? param145 : (param145 + param145)))} ? ((8'hb0) & {((param145 ^ param145) ? param145 : ((7'h42) ? param145 : param145)), {(param145 & param145)}}) : ((((param145 ? param145 : param145) <= param145) >= param145) ? param145 : (((param145 >> param145) ? ((8'haa) > param145) : (param145 <= param145)) ? (((7'h43) ? param145 : param145) ? param145 : (~^(8'hb0))) : ({param145, (8'hb1)} && (~param145))))))
(y, clk, wire20, wire21, wire22, wire23);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire21;
  input wire signed [(4'he):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire144;
  wire signed [(3'h6):(1'h0)] wire143;
  wire signed [(4'hc):(1'h0)] wire142;
  wire signed [(3'h4):(1'h0)] wire140;
  wire signed [(3'h6):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(5'h15):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire67;
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire140,
                 wire103,
                 wire101,
                 wire70,
                 wire69,
                 wire24,
                 wire25,
                 wire26,
                 wire67,
                 (1'h0)};
  assign wire24 = {(wire21[(4'h8):(3'h4)] == $signed({$unsigned(wire22),
                          (wire21 == wire23)}))};
  assign wire25 = $unsigned({((wire22[(3'h4):(2'h2)] & (wire20 && wire24)) ?
                          (|wire21[(4'h9):(4'h9)]) : {(8'hb1), (!wire22)}),
                      (wire20 <<< $unsigned($unsigned((8'hbf))))});
  assign wire26 = wire23[(1'h0):(1'h0)];
  module27 #() modinst68 (wire67, clk, wire22, wire21, wire20, wire26, wire23);
  assign wire69 = wire25;
  assign wire70 = wire21;
  module71 #() modinst102 (wire101, clk, wire21, wire20, wire70, wire26);
  assign wire103 = ((((|wire69[(2'h2):(2'h2)]) ~^ {$signed((8'hb7)),
                           $signed(wire26)}) + (($signed(wire26) << wire26[(2'h2):(1'h0)]) ?
                           $signed(wire20[(3'h5):(2'h3)]) : wire24[(1'h1):(1'h1)])) ?
                       (~|{wire22}) : (((+(8'h9e)) >>> $unsigned($unsigned(wire69))) ?
                           $signed((~$unsigned(wire67))) : ((^(wire24 ?
                               wire25 : wire67)) - $signed({wire21, wire25}))));
  module104 #() modinst141 (wire140, clk, wire26, wire67, wire24, wire22);
  assign wire142 = (+$unsigned(({(wire101 ^~ wire140), $signed(wire25)} ?
                       wire23[(3'h7):(1'h0)] : $signed(((8'hbc) ?
                           wire69 : wire103)))));
  assign wire143 = (!(wire67[(1'h1):(1'h1)] && $signed(wire21[(1'h1):(1'h0)])));
  assign wire144 = $signed({wire143});
endmodule

module module104
#(parameter param139 = ((~|(({(8'hb4), (8'hb0)} < ((8'hac) ^~ (8'hb9))) ? (8'ha6) : (((8'hb6) - (8'hab)) ? ((8'hab) ^~ (8'hab)) : (+(8'h9c))))) ? (~|((~|{(8'hbf), (7'h40)}) > {{(8'hbf)}})) : (!(((~&(7'h42)) * ((8'hbb) ? (8'hb8) : (7'h40))) ? {(&(8'hb8)), ((8'hb6) & (8'ha7))} : (((8'hae) ? (8'ha9) : (8'hbc)) - (~&(8'ha7)))))))
(y, clk, wire108, wire107, wire106, wire105);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire108;
  input wire signed [(2'h2):(1'h0)] wire107;
  input wire signed [(4'he):(1'h0)] wire106;
  input wire signed [(3'h7):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire134;
  wire signed [(5'h10):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire131;
  wire [(4'ha):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire128;
  wire [(5'h13):(1'h0)] wire123;
  wire signed [(3'h7):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire121;
  wire [(2'h3):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire114;
  wire [(4'hf):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire112;
  wire signed [(4'ha):(1'h0)] wire111;
  wire signed [(3'h4):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire109;
  reg signed [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(2'h2):(1'h0)] reg137 = (1'h0);
  reg [(2'h3):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire123,
                 wire122,
                 wire121,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire109 = (wire106 ?
                       $unsigned((~&{(wire105 ?
                               wire105 : (8'ha8))})) : $unsigned((wire107 && wire106[(4'h9):(1'h1)])));
  assign wire110 = wire109[(1'h1):(1'h0)];
  assign wire111 = {wire108};
  assign wire112 = wire106;
  assign wire113 = wire111[(3'h4):(3'h4)];
  assign wire114 = wire112;
  assign wire115 = (wire110 ^ $unsigned($signed({(^(8'ha9)),
                       {wire106, wire111}})));
  always
    @(posedge clk) begin
      if (wire112[(4'ha):(3'h6)])
        begin
          reg116 <= ((wire114 <<< $unsigned(wire109)) ?
              wire109[(2'h3):(1'h1)] : (~wire106));
          reg117 <= wire110;
        end
      else
        begin
          reg116 <= (^~wire108);
          reg117 <= $signed((~$unsigned({$signed(wire115)})));
          reg118 <= (wire113 || wire109);
          reg119 <= ((((^~reg117) ?
                      $unsigned(wire106) : $signed($unsigned(wire106))) ?
                  ((((7'h42) ? (8'hba) : (8'hbe)) ?
                      (wire105 > wire109) : (!wire108)) * $unsigned((~wire113))) : ((8'hb6) ?
                      $signed((wire115 ^~ reg117)) : ($signed(wire106) ^ $unsigned(wire108)))) ?
              (wire115[(1'h1):(1'h0)] ?
                  (wire107[(2'h2):(1'h0)] ?
                      wire113[(3'h7):(3'h6)] : $signed((wire115 ?
                          (7'h44) : wire109))) : ($signed($unsigned((8'ha2))) ?
                      (|wire110) : wire108)) : ($signed((|(wire113 ?
                      wire108 : wire107))) ?
                  {((wire112 | wire106) ?
                          (wire105 ? wire106 : wire107) : ((8'ha6) ?
                              (8'hb1) : wire106)),
                      wire108} : reg117));
        end
      reg120 <= {wire109, ((&$unsigned({wire114})) <<< $signed(wire108))};
    end
  assign wire121 = ({$unsigned((8'ha9)), wire114} ?
                       (^~wire112[(3'h4):(1'h0)]) : $signed((~reg118[(1'h1):(1'h0)])));
  assign wire122 = wire107;
  assign wire123 = (~|reg117);
  always
    @(posedge clk) begin
      reg124 <= $signed(({(~&$signed(wire106)), wire111[(3'h7):(2'h2)]} ?
          $unsigned((!wire106)) : {{(wire115 ? wire123 : wire123),
                  (wire114 ? wire109 : wire105)},
              wire121[(1'h1):(1'h1)]}));
      reg125 <= wire108[(4'hb):(4'h8)];
      reg126 <= ($unsigned($unsigned(wire110[(2'h2):(1'h0)])) ~^ ($signed(((wire122 ^ wire115) >> $unsigned(wire114))) ?
          (^$unsigned((reg118 ? reg117 : wire105))) : (wire115 ?
              $signed(wire109[(1'h0):(1'h0)]) : wire107)));
      reg127 <= ((+($signed(reg117) ?
          $signed(wire105) : ($unsigned((8'hb9)) ?
              {wire107} : (reg119 ?
                  reg120 : reg116)))) < $unsigned(wire112[(2'h3):(1'h0)]));
    end
  assign wire128 = (wire111 != (~|$signed((7'h40))));
  assign wire129 = $unsigned($unsigned($unsigned(reg116)));
  assign wire130 = $signed($unsigned(((((8'hb7) ?
                       wire105 : wire106) & reg119) ^ wire106[(3'h5):(2'h2)])));
  assign wire131 = wire123;
  assign wire132 = (^~(!$signed(reg116[(3'h4):(1'h1)])));
  assign wire133 = (8'ha5);
  assign wire134 = wire109;
  always
    @(posedge clk) begin
      reg135 <= $unsigned($unsigned($unsigned((~&reg125))));
      reg136 <= $signed($signed(wire114[(4'h8):(1'h1)]));
      reg137 <= ((!$unsigned((8'haa))) ?
          (^~$unsigned(wire113)) : ((reg116 ?
                  wire130[(4'h8):(2'h3)] : {$unsigned(reg126)}) ?
              {{reg136}} : (~$signed(reg119[(2'h3):(1'h1)]))));
      reg138 <= wire122[(3'h4):(1'h1)];
    end
endmodule

module module71
#(parameter param100 = {(((((8'ha0) != (8'hb1)) ? ((8'h9c) && (8'hb6)) : ((7'h41) ? (8'hb7) : (8'hbb))) == (((8'hb0) >> (8'hb3)) > (~|(8'hba)))) > ((^((8'hbe) ? (8'hae) : (8'ha4))) - (^(+(8'hab)))))})
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire75;
  input wire [(4'hb):(1'h0)] wire74;
  input wire [(5'h13):(1'h0)] wire73;
  input wire signed [(4'hc):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire76;
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire77,
                 wire76,
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
                 reg78,
                 (1'h0)};
  assign wire76 = $signed(wire72);
  assign wire77 = $signed(($signed((wire73 >>> $signed(wire75))) ?
                      $signed({(^wire75),
                          $unsigned(wire75)}) : wire75[(5'h12):(5'h11)]));
  always
    @(posedge clk) begin
      reg78 <= ((~|($unsigned(wire75) < wire75)) ?
          wire72[(4'h8):(1'h1)] : (8'hae));
      reg79 <= wire76[(2'h2):(1'h1)];
      reg80 <= (~|(~^wire73));
      reg81 <= (&(~&((|{wire76, reg78}) ?
          (^~wire73) : $signed((wire77 > reg79)))));
      reg82 <= ((^(^((wire77 ? wire76 : wire73) ?
              (~^wire74) : ((8'ha0) ? wire75 : wire72)))) ?
          ($unsigned($unsigned((wire74 ?
              reg81 : wire72))) || ($signed({reg80}) < {$signed(wire76)})) : ($signed((wire72 ?
              wire75[(5'h10):(4'hf)] : (~&wire77))) <<< ((~&$signed((8'ha3))) || $signed((+reg80)))));
    end
  always
    @(posedge clk) begin
      reg83 <= {reg80[(5'h13):(4'hc)]};
      if ((|{reg78[(3'h4):(3'h4)], ($signed(reg83[(4'hd):(4'hc)]) <= reg78)}))
        begin
          if ((($unsigned(wire76[(1'h1):(1'h0)]) ?
              (~$unsigned(wire73[(4'h8):(3'h5)])) : $unsigned((~^reg80[(3'h7):(3'h6)]))) && (&reg81[(4'h8):(1'h1)])))
            begin
              reg84 <= $unsigned(($unsigned(wire74) ?
                  $signed((8'ha9)) : $unsigned(((wire75 ? reg82 : (8'hab)) ?
                      $unsigned(wire76) : (wire75 ? wire75 : reg80)))));
              reg85 <= (!(reg83 ?
                  $signed(reg83[(3'h6):(2'h2)]) : $signed(wire77[(1'h0):(1'h0)])));
              reg86 <= (8'hb5);
            end
          else
            begin
              reg84 <= wire73[(2'h3):(2'h3)];
              reg85 <= (~$signed((~&$unsigned((wire73 + reg86)))));
              reg86 <= ((($unsigned((reg86 | wire77)) + ({reg83,
                  wire74} + $unsigned(wire76))) << reg82) <= reg86[(3'h7):(2'h2)]);
            end
          reg87 <= (reg81 ?
              reg78[(3'h4):(3'h4)] : ($signed(($unsigned(reg79) ?
                  wire73 : $unsigned(wire73))) > $signed($signed((&(8'had))))));
          reg88 <= (&$unsigned({{$signed(reg80), (^reg79)},
              ($signed(wire76) ? ((8'hb4) ~^ wire74) : ((8'hb2) <<< wire73))}));
          reg89 <= (~|($unsigned(((7'h41) ? {wire72} : $signed(reg87))) ?
              ($signed((wire73 >>> reg83)) != (~&wire74[(4'ha):(4'ha)])) : ({(reg79 ?
                      (8'hbf) : wire72)} && (^~$signed((7'h43))))));
        end
      else
        begin
          if ($unsigned((!$signed($unsigned($unsigned(reg81))))))
            begin
              reg84 <= $unsigned($unsigned(($signed((reg86 >>> wire76)) ?
                  (reg85 ? reg87[(4'hd):(3'h4)] : (^~reg89)) : reg80)));
            end
          else
            begin
              reg84 <= ((((+(reg82 ? reg80 : reg81)) && ($signed(reg83) ?
                      (wire72 ? wire75 : wire73) : (wire74 ?
                          reg85 : reg89))) > $unsigned((wire75[(5'h10):(3'h4)] ?
                      {wire74} : ((8'hb8) >= (8'h9c))))) ?
                  $unsigned($unsigned(wire76[(3'h4):(2'h2)])) : (8'ha1));
            end
          if (reg82)
            begin
              reg85 <= $unsigned($unsigned($unsigned(reg78[(1'h1):(1'h1)])));
              reg86 <= {$signed($unsigned(($signed(reg79) ?
                      (reg88 & wire75) : reg87))),
                  wire75};
              reg87 <= ($signed($unsigned(($signed(reg82) ?
                      wire76 : reg86[(4'h9):(1'h0)]))) ?
                  $signed(reg78) : (wire72 <<< reg81));
            end
          else
            begin
              reg85 <= (({wire76,
                  reg78} >> (~^$signed(wire74[(4'h9):(3'h6)]))) + $unsigned((($unsigned((8'ha0)) ?
                  reg88[(3'h7):(3'h6)] : reg83[(2'h2):(1'h0)]) <= $unsigned((reg79 ?
                  reg89 : wire74)))));
            end
          if ((+reg79))
            begin
              reg88 <= ($signed({($signed(wire77) < $unsigned(reg80))}) ^ (~|$signed(reg80[(1'h1):(1'h1)])));
              reg89 <= reg84;
              reg90 <= wire73;
              reg91 <= reg81;
              reg92 <= ((((~(~^reg87)) ?
                  {wire73} : $unsigned($signed(wire75))) > reg86[(3'h6):(3'h6)]) == (!{($signed(reg80) ?
                      {wire76, reg82} : reg91),
                  $unsigned((wire75 ? reg80 : wire75))}));
            end
          else
            begin
              reg88 <= (reg87[(3'h4):(1'h1)] < (((reg82 ? (8'ha5) : (~|reg86)) ?
                  ((8'ha4) <= $signed(reg85)) : reg79[(3'h6):(1'h0)]) ~^ reg83[(4'hd):(3'h6)]));
              reg89 <= (!reg89);
              reg90 <= reg87;
              reg91 <= reg86;
            end
          reg93 <= reg83;
        end
      reg94 <= reg89[(2'h3):(2'h2)];
    end
  assign wire95 = (|(reg79[(3'h6):(3'h5)] || $signed((wire76 - {wire74}))));
  assign wire96 = $signed(wire75);
  assign wire97 = $signed({(((&reg94) ? (wire95 ~^ reg86) : $signed(reg81)) ?
                          reg88 : (reg93 ?
                              wire95[(2'h2):(1'h0)] : (reg90 && reg86)))});
  assign wire98 = ($unsigned({reg93[(2'h2):(2'h2)]}) ?
                      ((^~wire77[(3'h6):(3'h6)]) != reg78[(3'h4):(1'h1)]) : reg82[(1'h0):(1'h0)]);
  assign wire99 = $unsigned(reg91[(2'h2):(1'h1)]);
endmodule

module module27
#(parameter param66 = (((+{(&(8'hae))}) ? (!(((7'h41) ? (8'hbe) : (8'ha3)) ? ((8'had) ? (8'hbe) : (8'hbd)) : ((8'hba) ? (8'hb4) : (8'ha5)))) : ((((8'hb7) ? (8'hb2) : (8'ha7)) ? (!(8'hbb)) : (-(8'hbb))) - (((8'hbb) < (8'haa)) + (|(8'hb2))))) >= (~({((8'h9d) & (8'ha8))} ? ((~&(8'haf)) ? {(8'ha5), (7'h41)} : (&(8'h9c))) : (~(^(8'ha9)))))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire32;
  input wire [(4'h8):(1'h0)] wire31;
  input wire [(5'h11):(1'h0)] wire30;
  input wire [(5'h15):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire43,
                 wire37,
                 wire36,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg33 <= ((~$unsigned((8'hb7))) || (wire31 * (-{$unsigned(wire30),
          (wire28 ? wire32 : wire30)})));
    end
  always
    @(posedge clk) begin
      reg34 <= (~&{(wire30 ?
              reg33 : ((wire28 ? reg33 : wire28) ?
                  $unsigned(wire32) : ((8'ha3) << wire28))),
          (wire31[(3'h7):(3'h5)] * (~wire29))});
      reg35 <= $unsigned($signed($signed((~^wire30))));
    end
  assign wire36 = (wire31[(2'h2):(1'h0)] ?
                      $unsigned((reg34[(4'hd):(1'h0)] >= (wire28 ^ wire31[(3'h7):(3'h6)]))) : (reg35[(3'h4):(1'h0)] ?
                          ($unsigned(wire28) < $unsigned((~|wire30))) : (($unsigned(wire28) << (!wire32)) - reg35)));
  assign wire37 = (&(^~$signed({wire29[(5'h14):(2'h2)]})));
  always
    @(posedge clk) begin
      reg38 <= $signed((~$unsigned($signed(wire31))));
      reg39 <= (+(&$unsigned(reg35[(3'h5):(1'h1)])));
      reg40 <= $unsigned((~&($unsigned((wire31 * reg39)) ?
          (~&$signed(wire32)) : wire31[(1'h1):(1'h1)])));
      reg41 <= wire32[(3'h7):(2'h2)];
      reg42 <= {(^(8'hb2)),
          (wire32 ?
              $unsigned(($signed(reg35) && reg33)) : $signed($signed($signed(wire37))))};
    end
  assign wire43 = wire32;
  always
    @(posedge clk) begin
      reg44 <= reg39[(1'h1):(1'h1)];
      reg45 <= wire37[(3'h6):(2'h3)];
      if ((reg44[(3'h6):(2'h3)] * $unsigned(($unsigned(wire31) > $unsigned({reg35,
          wire43})))))
        begin
          reg46 <= (^(^$signed(reg33)));
          reg47 <= (~|$unsigned(((~$unsigned(wire31)) ?
              wire37[(4'h9):(1'h1)] : reg38[(3'h4):(3'h4)])));
        end
      else
        begin
          reg46 <= reg33[(2'h3):(1'h0)];
        end
      reg48 <= $unsigned($unsigned($signed(($unsigned((7'h44)) ?
          {wire30, reg42} : $signed((8'hb1))))));
      if ($unsigned(wire28[(1'h0):(1'h0)]))
        begin
          reg49 <= $signed(wire31);
          reg50 <= {$signed(reg44[(3'h5):(2'h3)]),
              $unsigned(reg39[(2'h2):(1'h1)])};
          reg51 <= $signed($unsigned($unsigned(($unsigned(reg46) ?
              $unsigned(wire36) : (~reg41)))));
          reg52 <= ({((-$unsigned(reg38)) >> ((8'h9c) ^ $signed(reg42))),
              $unsigned((wire36 ? reg40 : reg49))} + $unsigned(reg48));
        end
      else
        begin
          reg49 <= (!(~^wire29[(4'h9):(1'h1)]));
        end
    end
  assign wire53 = $unsigned($signed((-(|(reg40 ? wire30 : wire43)))));
  assign wire54 = (~|{$unsigned((reg35 >> (reg35 ? reg47 : reg38))),
                      ($signed({reg39,
                          reg42}) - ($unsigned(reg52) || {wire28}))});
  assign wire55 = (reg39 < wire36[(4'hb):(4'h9)]);
  assign wire56 = $unsigned({{wire43[(1'h0):(1'h0)], (!reg40)},
                      ($signed((reg47 ? reg52 : (8'hb8))) ?
                          (&$unsigned((8'ha0))) : ($unsigned(reg48) && (reg48 ?
                              wire31 : wire36)))});
  always
    @(posedge clk) begin
      reg57 <= $signed($signed({((reg41 * reg39) || reg44[(2'h3):(2'h3)]),
          (!(reg50 + reg34))}));
      if (((reg44[(2'h2):(1'h0)] ?
          $unsigned($unsigned((reg34 >= reg42))) : $signed(reg33[(3'h4):(3'h4)])) ~^ {$signed({reg49})}))
        begin
          reg58 <= (^(|wire54));
          reg59 <= wire43;
          reg60 <= $signed($signed((($signed(reg41) <<< (reg39 & reg39)) ?
              wire55[(3'h4):(2'h2)] : $signed((reg49 != reg39)))));
          reg61 <= $signed(((({wire53, reg35} | ((8'ha4) ? (8'h9f) : reg41)) ?
              {reg38,
                  (8'ha7)} : {$unsigned(reg35)}) && $unsigned($signed($signed(reg39)))));
        end
      else
        begin
          reg58 <= $unsigned($unsigned(reg52[(4'h9):(1'h1)]));
          reg59 <= $signed(($unsigned(wire54[(3'h5):(3'h4)]) ?
              (^~reg39[(3'h4):(2'h2)]) : wire54));
          reg60 <= $unsigned(reg38[(3'h4):(2'h2)]);
          if (reg58[(4'hb):(4'h8)])
            begin
              reg61 <= (^~$signed((wire29 & (reg48[(4'h9):(3'h5)] > $unsigned(reg59)))));
              reg62 <= (-wire28);
              reg63 <= $signed(reg38);
              reg64 <= reg41;
              reg65 <= $signed(((wire43[(2'h3):(1'h0)] + {(8'hbb)}) ?
                  ({reg39[(3'h5):(3'h5)]} ?
                      ((wire36 <<< wire56) < (!reg45)) : (reg41 * reg49)) : (reg46[(2'h2):(2'h2)] * wire37)));
            end
          else
            begin
              reg61 <= ($unsigned(reg59) >> wire54);
            end
        end
    end
endmodule
