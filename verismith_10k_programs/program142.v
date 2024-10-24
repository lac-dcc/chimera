module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire163;
  wire [(4'hd):(1'h0)] wire162;
  wire [(3'h7):(1'h0)] wire161;
  wire [(3'h5):(1'h0)] wire160;
  wire [(4'hf):(1'h0)] wire158;
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire158,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((+(|(wire2 ~^ {wire1}))) && $signed($signed(wire2)));
      reg5 <= (!wire1[(2'h3):(2'h2)]);
      if ($unsigned((-(wire2[(2'h2):(2'h2)] ? wire0 : wire1))))
        begin
          if (wire1[(2'h3):(2'h3)])
            begin
              reg6 <= (({{$signed(wire2)}} ?
                  ((-$signed(wire3)) ?
                      $signed(reg5[(2'h3):(2'h2)]) : (8'hbb)) : ({((8'hbe) + reg5),
                          $unsigned(wire2)} ?
                      $signed($unsigned((8'hb7))) : $unsigned(reg4[(4'hf):(1'h1)]))) || reg5[(1'h0):(1'h0)]);
            end
          else
            begin
              reg6 <= ($signed(reg4[(4'h9):(3'h4)]) >= ((&reg5) - $signed((^~reg4))));
              reg7 <= (-(!($signed(reg4[(3'h7):(3'h6)]) ?
                  $signed(reg4[(2'h2):(1'h0)]) : ($signed((8'ha5)) ?
                      reg6 : $unsigned(wire1)))));
              reg8 <= ($unsigned(((wire2 ? {reg4, reg5} : $unsigned(reg7)) ?
                      $unsigned(wire3[(3'h5):(2'h2)]) : $unsigned($signed(wire1)))) ?
                  $signed(reg5) : $signed((wire2 && $unsigned(reg7[(3'h4):(1'h0)]))));
              reg9 <= (8'hb9);
              reg10 <= ($signed({{(wire1 ^ (8'ha5)), (|(8'ha7))},
                  reg8}) << (($signed((reg6 ? reg9 : reg4)) ?
                      $unsigned((~wire3)) : $unsigned({reg9})) ?
                  (-wire2[(4'h8):(3'h7)]) : reg4));
            end
          reg11 <= (&((((reg7 >= wire1) ?
              $unsigned((8'hbd)) : $signed(wire3)) ~^ (reg6[(1'h0):(1'h0)] ?
              $signed(reg7) : (reg4 ?
                  reg6 : (8'hba)))) == (^~reg10[(2'h2):(1'h1)])));
          reg12 <= $signed((reg9 ? reg10 : reg8[(1'h0):(1'h0)]));
          reg13 <= ((&$unsigned((reg11 || $unsigned((8'hbf))))) ~^ ((($signed(reg4) > (~^reg8)) ?
              wire0[(4'h9):(3'h7)] : reg12) <= $signed(wire0)));
        end
      else
        begin
          if ($signed($signed({(!{(7'h40)})})))
            begin
              reg6 <= $unsigned(((8'ha0) << (!$unsigned((reg5 == reg11)))));
              reg7 <= reg10;
            end
          else
            begin
              reg6 <= reg6[(1'h0):(1'h0)];
              reg7 <= (~&reg8[(1'h1):(1'h1)]);
              reg8 <= {$unsigned(wire0)};
            end
          reg9 <= $unsigned(reg5);
          if (reg8[(4'h8):(1'h1)])
            begin
              reg10 <= {(((reg6[(1'h1):(1'h1)] ? (~^wire0) : $unsigned(reg11)) ?
                      $signed(reg4[(2'h2):(1'h1)]) : ($unsigned(wire0) ?
                          (wire0 ?
                              (8'ha9) : reg13) : $unsigned((7'h43)))) * (^~$signed({reg11}))),
                  (reg13 ?
                      (((reg5 || reg10) ?
                              (reg6 & wire2) : (reg4 ? reg13 : reg5)) ?
                          (^~$signed(reg11)) : reg8) : $signed((8'ha0)))};
              reg11 <= $signed(((^$unsigned((~&wire3))) > (^reg12[(1'h0):(1'h0)])));
              reg12 <= reg8[(3'h6):(3'h6)];
              reg13 <= (^~{({{wire0, (8'hbf)}} ?
                      (^(~&reg13)) : (reg11 >> (wire0 ? wire3 : (8'ha5))))});
              reg14 <= (8'h9c);
            end
          else
            begin
              reg10 <= reg11[(2'h3):(1'h0)];
              reg11 <= ($signed(($signed((reg5 ? (8'ha4) : reg6)) ?
                  (reg11[(4'hb):(1'h1)] ?
                      (&reg4) : reg7[(3'h6):(2'h2)]) : (~^$unsigned(reg12)))) | reg12);
            end
          reg15 <= $signed((8'hba));
        end
      reg16 <= {{$unsigned(((reg13 >>> reg8) >>> $unsigned(reg11))),
              $signed({reg5[(2'h2):(1'h1)]})}};
    end
  module17 #() modinst159 (.wire18(wire1), .wire21(reg10), .wire20(wire2), .y(wire158), .clk(clk), .wire19(reg12));
  assign wire160 = reg7[(2'h2):(2'h2)];
  assign wire161 = (|(~|$signed({(reg12 << reg8)})));
  assign wire162 = reg4[(4'ha):(2'h3)];
  assign wire163 = (reg16 ? (-({(^~reg4), $signed((8'ha0))} > reg9)) : reg12);
endmodule

module module17
#(parameter param156 = (((((8'ha7) >> {(8'hb2)}) ? (&((7'h40) <<< (8'hb6))) : ((^~(8'h9f)) != ((8'haf) ? (7'h43) : (8'had)))) ? ({((8'ha3) << (8'h9f)), ((8'hac) ? (8'hac) : (8'hbc))} + (~&((8'haa) ? (8'hb1) : (7'h41)))) : (8'ha5)) ? ((^((|(8'hbd)) <<< ((8'ha6) < (8'hbd)))) != (^({(8'hae)} <= {(8'hb5)}))) : ((({(8'ha5), (8'hb6)} * (|(8'h9f))) ? (~|((8'haa) + (8'hb1))) : ((^(8'hb7)) ? {(8'hb2)} : (-(8'hb8)))) != ((((8'haf) ? (8'h9c) : (8'haa)) | {(7'h44)}) ? (((8'hae) ? (8'h9f) : (7'h44)) ~^ {(8'ha7)}) : (((7'h40) != (8'hac)) ? ((8'ha3) >= (8'h9f)) : ((8'hb6) ? (8'hb5) : (8'haf)))))), 
parameter param157 = ((~&(((param156 >>> param156) <= (param156 != param156)) ? {(param156 ? param156 : param156)} : param156)) >>> {(((param156 ? (8'ha8) : param156) > {param156}) < {(param156 ^~ (8'hb9))}), {(7'h44), param156}}))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire155;
  wire [(4'hf):(1'h0)] wire154;
  wire signed [(4'hc):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire116;
  wire signed [(5'h13):(1'h0)] wire115;
  wire [(5'h13):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire38;
  assign y = {wire155,
                 wire154,
                 wire152,
                 wire116,
                 wire115,
                 wire113,
                 wire38,
                 (1'h0)};
  module22 #() modinst39 (wire38, clk, wire20, wire21, wire18, wire19);
  module40 #() modinst114 (wire113, clk, wire38, wire19, wire21, wire20);
  assign wire115 = $signed(wire18);
  assign wire116 = wire19[(4'hc):(3'h6)];
  module117 #() modinst153 (.clk(clk), .wire121(wire116), .wire119(wire21), .y(wire152), .wire120(wire115), .wire118(wire20));
  assign wire154 = (|$unsigned(($unsigned({wire113, wire115}) ?
                       (7'h40) : ((wire19 ? wire152 : wire115) ?
                           wire18 : wire20[(5'h12):(5'h11)]))));
  assign wire155 = (^~$signed((wire113 * wire18)));
endmodule

module module117
#(parameter param150 = (((~(~(8'hbc))) << ((-((8'ha6) < (8'ha7))) ? {((8'ha9) ? (8'ha3) : (8'ha7)), ((8'hbb) <<< (8'hb6))} : (8'hb7))) ? ((((|(8'ha8)) <= (8'ha9)) * (!((8'ha5) >> (8'hbf)))) != ({{(8'hbb)}, (~|(8'haa))} < (!{(7'h43)}))) : ((((~&(8'hab)) ? (~(8'hb4)) : ((8'ha8) ? (8'ha1) : (7'h41))) ? (~^((8'hb5) ? (8'hb5) : (8'hb4))) : ((~(7'h41)) ? {(8'hbb), (7'h42)} : {(8'hb1), (8'hbc)})) ? (({(8'hb8)} ? ((8'ha6) ? (8'ha6) : (8'hba)) : {(7'h43)}) ? (((8'ha1) * (8'ha8)) ? (~(8'hbe)) : (~^(8'ha6))) : (((7'h43) <<< (8'h9f)) ? ((8'h9e) - (8'haa)) : {(7'h41)})) : ({((8'h9e) - (8'hb3))} ? (+((8'haf) + (8'hb0))) : (~((8'hbd) ? (8'hbf) : (8'hb6)))))), 
parameter param151 = ((&(~^(param150 ^ (param150 ^~ param150)))) ? ((!(^(param150 >>> (8'haa)))) ? (&{(param150 - param150)}) : ((8'hb4) <= param150)) : ((param150 == (~|(+param150))) ? ({(param150 ? param150 : (8'hbd)), (~|param150)} ? (param150 ? (|param150) : param150) : ({(8'hb8), param150} | (param150 ? param150 : param150))) : ((~|(+param150)) ? (param150 >= (-param150)) : {param150}))))
(y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire121;
  input wire signed [(5'h11):(1'h0)] wire120;
  input wire [(4'h8):(1'h0)] wire119;
  input wire [(5'h15):(1'h0)] wire118;
  wire signed [(4'hb):(1'h0)] wire149;
  wire [(5'h15):(1'h0)] wire148;
  wire signed [(4'hd):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire [(5'h11):(1'h0)] wire129;
  wire signed [(3'h4):(1'h0)] wire128;
  wire signed [(2'h3):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire126;
  wire signed [(3'h6):(1'h0)] wire125;
  wire [(3'h4):(1'h0)] wire124;
  wire signed [(2'h2):(1'h0)] wire123;
  wire [(4'h8):(1'h0)] wire122;
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(4'hf):(1'h0)] reg144 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg142 = (1'h0);
  reg [(4'hb):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg130 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire138,
                 wire137,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire122 = {(8'hba), (&$unsigned(wire118))};
  assign wire123 = ($signed({(((8'h9d) >> (8'hb3)) + (8'hac)),
                       (wire122 >= wire119)}) + (((wire118 ?
                           (8'hbb) : (wire120 ? (7'h40) : wire122)) ?
                       (~wire118) : $unsigned($signed(wire120))) & wire119));
  assign wire124 = $signed(((wire120[(5'h10):(4'h9)] ?
                           $signed((wire120 ^ wire121)) : $signed((~wire122))) ?
                       wire120 : (~&$unsigned({wire119, wire118}))));
  assign wire125 = $signed(($unsigned(wire122) ?
                       wire121[(2'h2):(1'h1)] : {wire120}));
  assign wire126 = (~&wire124);
  assign wire127 = $unsigned(wire125);
  assign wire128 = {(~($unsigned({wire126}) ?
                           ((wire118 || (8'ha7)) >>> ((8'hae) <= wire120)) : (|(wire123 ?
                               wire119 : wire122)))),
                       $signed($signed($unsigned(wire122[(4'h8):(4'h8)])))};
  assign wire129 = (~&wire127[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if (((8'hbe) >= $unsigned(wire126)))
        begin
          reg130 <= {wire119[(1'h0):(1'h0)]};
        end
      else
        begin
          reg130 <= wire118[(1'h0):(1'h0)];
        end
      reg131 <= $unsigned(((^$signed($unsigned(wire129))) < (wire122 > $signed({(8'hbb)}))));
    end
  always
    @(posedge clk) begin
      reg132 <= (!wire125);
      reg133 <= $unsigned({reg132[(2'h2):(2'h2)]});
      reg134 <= (^~$signed($signed((~&(wire128 >>> wire123)))));
      reg135 <= $unsigned(reg132[(3'h5):(2'h2)]);
      reg136 <= $signed((^~$unsigned((wire123[(2'h2):(2'h2)] < wire126[(4'h9):(4'h9)]))));
    end
  assign wire137 = wire129;
  assign wire138 = (reg135[(2'h2):(1'h1)] + $unsigned($unsigned($unsigned((7'h43)))));
  always
    @(posedge clk) begin
      reg139 <= (wire127 ?
          (^($signed((wire118 ? (8'hba) : wire126)) ?
              $signed($signed(wire122)) : $unsigned($signed(reg134)))) : {$signed((7'h41)),
              (^~(reg134[(3'h6):(3'h5)] - wire121[(1'h0):(1'h0)]))});
      reg140 <= (^~$signed((wire137[(2'h3):(2'h2)] >> wire119[(1'h0):(1'h0)])));
      if ((^(reg130 ?
          (~|((reg139 != (8'h9c)) && (reg132 ?
              wire121 : (8'haa)))) : $unsigned((^~{reg136})))))
        begin
          reg141 <= ((wire118[(5'h15):(3'h4)] << {$signed(reg135[(2'h3):(1'h0)])}) ?
              $unsigned(($unsigned($signed(wire121)) - $unsigned($unsigned(reg130)))) : (~&wire128[(2'h3):(1'h0)]));
          reg142 <= (wire124[(2'h3):(2'h2)] << $unsigned(reg140));
        end
      else
        begin
          if ((^(8'ha1)))
            begin
              reg141 <= reg133[(1'h0):(1'h0)];
              reg142 <= (reg141 ? wire118 : reg139);
              reg143 <= (~(~{($signed((7'h40)) <<< reg134)}));
            end
          else
            begin
              reg141 <= $signed((!($unsigned($signed((8'hb8))) ?
                  ((reg143 + wire128) ?
                      $signed(wire122) : (reg132 > reg136)) : {wire123})));
              reg142 <= (~^($unsigned(((wire124 ? wire124 : reg135) ?
                      wire129 : $signed(reg134))) ?
                  wire137[(3'h4):(1'h1)] : (^~(~|(reg133 ?
                      reg143 : wire128)))));
              reg143 <= wire124[(1'h0):(1'h0)];
            end
          if ($unsigned($unsigned($signed(((wire118 >= wire128) ?
              reg135 : ((8'hb0) != wire138))))))
            begin
              reg144 <= $unsigned((reg139 ?
                  $signed((wire120 == $signed(reg143))) : ($unsigned({wire118}) ?
                      ((8'h9e) ~^ ((8'hba) ~^ reg132)) : ((wire119 ?
                              wire126 : wire126) ?
                          (wire119 > (8'hae)) : $unsigned(wire137)))));
              reg145 <= ((8'ha6) << (^~($unsigned($unsigned(reg141)) && wire128)));
              reg146 <= {wire121,
                  (wire127[(2'h2):(1'h1)] <= {$signed(reg130[(1'h0):(1'h0)])})};
              reg147 <= ((~^{$signed(wire123)}) * $signed($signed(wire126)));
            end
          else
            begin
              reg144 <= ($unsigned(reg146[(4'hb):(3'h7)]) || wire126[(2'h3):(1'h0)]);
              reg145 <= reg140[(3'h6):(3'h4)];
              reg146 <= (~(&reg146));
              reg147 <= reg143[(4'ha):(3'h7)];
            end
        end
    end
  assign wire148 = reg145[(3'h7):(1'h0)];
  assign wire149 = (&(wire137 ?
                       ($unsigned({wire120,
                           (7'h44)}) < $signed((!reg141))) : (!(((8'hb6) ?
                               (8'ha0) : (8'ha3)) ?
                           $unsigned(reg146) : wire137[(2'h2):(1'h0)]))));
endmodule

module module40
#(parameter param111 = (((!(((8'hb3) || (8'h9d)) ? ((8'hb5) ? (8'hb1) : (8'hb9)) : ((8'h9f) > (8'h9d)))) ? ((8'hab) ? (~|(~(8'hb6))) : (((8'hbd) ? (7'h43) : (7'h41)) ? (+(8'ha7)) : ((8'ha2) ? (8'hb9) : (8'ha4)))) : (^~((+(8'ha6)) - ((8'hb8) ? (8'hb4) : (8'hb0))))) <<< (((((7'h42) - (8'h9e)) ? ((8'ha4) != (8'hbd)) : ((8'hab) & (7'h42))) && (8'hbf)) < ({{(8'haf), (8'ha6)}, (8'hba)} ? (&(-(8'ha7))) : (^~((8'ha0) <<< (8'hac)))))), 
parameter param112 = (((~({param111, param111} ? (~&param111) : param111)) >= ((param111 >> param111) ? param111 : param111)) ^~ (param111 ? {((8'ha1) ? (param111 ? param111 : param111) : param111)} : param111)))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h2be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire44;
  input wire [(2'h3):(1'h0)] wire43;
  input wire signed [(4'hd):(1'h0)] wire42;
  input wire [(5'h14):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire109;
  wire signed [(4'h8):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire93,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire45 = wire44[(2'h2):(2'h2)];
  assign wire46 = ({wire43[(2'h3):(2'h2)],
                      {$signed(wire44[(2'h2):(1'h0)])}} < wire43);
  assign wire47 = wire42[(1'h1):(1'h1)];
  assign wire48 = ((+wire41) << wire47[(4'ha):(1'h1)]);
  assign wire49 = $unsigned($signed((!(8'ha5))));
  always
    @(posedge clk) begin
      reg50 <= wire42[(4'hd):(4'hd)];
      reg51 <= wire45[(5'h12):(3'h5)];
      reg52 <= (wire47[(3'h6):(2'h2)] != wire45);
      if ($signed((~(($signed(wire48) ?
          (~^wire47) : (wire45 ?
              wire49 : reg52)) ^ ((~|(8'hbe)) || $unsigned(wire46))))))
        begin
          if ($unsigned((wire44[(1'h0):(1'h0)] - wire41[(3'h7):(1'h1)])))
            begin
              reg53 <= wire46[(3'h4):(3'h4)];
              reg54 <= $signed($signed({reg50[(3'h4):(3'h4)],
                  wire46[(5'h13):(4'hd)]}));
              reg55 <= wire42;
            end
          else
            begin
              reg53 <= reg51[(3'h7):(1'h1)];
              reg54 <= (wire41[(5'h13):(5'h11)] ?
                  {$unsigned($unsigned(wire49[(2'h2):(1'h0)]))} : $signed((~$unsigned(reg51[(1'h0):(1'h0)]))));
              reg55 <= (((^reg50[(3'h7):(3'h7)]) >= ($signed({reg50}) && (reg51[(3'h6):(1'h0)] ?
                  reg54[(3'h6):(1'h1)] : (!wire45)))) > wire42);
              reg56 <= ((^(8'hab)) < reg55[(1'h1):(1'h1)]);
            end
          reg57 <= $signed($signed($signed(((!wire45) << (wire46 ?
              wire45 : reg51)))));
          reg58 <= ({{($signed(wire49) ~^ (wire41 ? reg51 : reg52))}} ?
              $signed({$unsigned((~reg51))}) : wire46[(3'h5):(3'h5)]);
        end
      else
        begin
          if ($signed($signed((8'hb5))))
            begin
              reg53 <= $signed(wire41[(4'h9):(1'h1)]);
            end
          else
            begin
              reg53 <= reg55[(4'hb):(2'h2)];
              reg54 <= (reg52[(1'h1):(1'h0)] >>> $unsigned((reg50 & ({wire42,
                  (8'hb6)} > (~wire48)))));
              reg55 <= $unsigned((+$signed(wire46)));
            end
          reg56 <= reg52;
          reg57 <= (|$unsigned(({$signed(reg52)} ?
              $unsigned({reg58}) : ((-wire48) ? wire47 : $signed((7'h44))))));
          reg58 <= (&(~&(wire48[(2'h3):(2'h3)] <<< reg51[(3'h5):(3'h4)])));
        end
      if (wire47)
        begin
          if ($signed((7'h42)))
            begin
              reg59 <= (reg50 ? $signed((wire49 ? wire48 : reg55)) : reg53);
              reg60 <= {wire49};
            end
          else
            begin
              reg59 <= $signed((|wire46[(5'h13):(3'h5)]));
              reg60 <= (!wire48[(2'h3):(1'h1)]);
              reg61 <= reg59[(2'h3):(2'h2)];
              reg62 <= wire47[(3'h7):(2'h2)];
              reg63 <= reg62;
            end
          reg64 <= (~|($signed((&{wire44, (8'ha5)})) ?
              reg51[(2'h2):(1'h0)] : (((^reg59) ?
                      $unsigned(wire48) : (^wire49)) ?
                  reg52[(2'h3):(1'h1)] : reg58)));
          reg65 <= (-{reg55[(4'ha):(1'h0)],
              (((reg63 ? wire47 : wire46) && wire43[(2'h2):(1'h0)]) ?
                  {$signed(reg55), (wire46 ~^ reg54)} : (~|{(8'h9d),
                      wire41}))});
        end
      else
        begin
          if ($unsigned($signed(($unsigned($unsigned(reg63)) ?
              $unsigned(reg64[(4'hf):(4'hd)]) : wire46))))
            begin
              reg59 <= wire41[(4'h9):(1'h1)];
              reg60 <= (wire45[(4'ha):(4'ha)] <<< $unsigned(($unsigned($signed(reg54)) ?
                  ($unsigned(wire46) || $signed(reg59)) : (reg54 ?
                      reg52 : (!wire48)))));
              reg61 <= wire41[(5'h14):(1'h0)];
              reg62 <= $signed(reg51);
            end
          else
            begin
              reg59 <= $unsigned($unsigned((8'haf)));
            end
          reg63 <= ((!(reg57[(3'h6):(1'h1)] * $signed((wire41 ?
              wire49 : reg50)))) ~^ reg65[(2'h2):(1'h1)]);
          reg64 <= $signed((reg59[(4'hc):(4'h9)] ?
              $signed((|wire45[(4'hb):(4'h8)])) : (7'h43)));
          reg65 <= {(~^(&((reg60 <<< reg56) <<< {(8'hbe), reg56}))),
              reg64[(4'hc):(2'h3)]};
          reg66 <= reg55[(3'h6):(1'h1)];
        end
    end
  assign wire67 = $signed(wire41);
  assign wire68 = $unsigned($signed(wire67));
  assign wire69 = $unsigned(wire42[(4'hd):(4'hd)]);
  assign wire70 = wire68[(4'hc):(4'h9)];
  assign wire71 = (8'hba);
  assign wire72 = (reg65[(3'h6):(2'h3)] ?
                      {$signed($unsigned((reg60 ~^ reg64))),
                          ((7'h42) >>> {wire49,
                              {reg51, reg61}})} : $signed(reg54));
  assign wire73 = wire49;
  assign wire74 = $unsigned((-$signed(($unsigned((8'had)) == reg62[(4'hd):(4'hb)]))));
  always
    @(posedge clk) begin
      reg75 <= (^~reg57[(2'h3):(1'h0)]);
      if ($unsigned(($unsigned(reg75) & ({(wire69 ? wire41 : reg52)} ?
          (wire42 >> (reg51 ~^ reg57)) : reg75[(2'h3):(1'h1)]))))
        begin
          reg76 <= ((+(^(&(reg58 < reg64)))) ?
              ({$signed($signed(reg61))} | (8'ha6)) : {($unsigned(reg60) ?
                      (-reg61) : {wire69})});
          if (wire42[(4'h9):(4'h8)])
            begin
              reg77 <= (reg52[(1'h0):(1'h0)] ?
                  reg54[(3'h5):(1'h1)] : $signed((wire45 ?
                      $signed($signed(wire74)) : $unsigned($unsigned(wire43)))));
              reg78 <= (((&(~(~wire73))) ? (8'hbc) : reg55[(3'h7):(3'h6)]) ?
                  reg62 : $unsigned($unsigned(($unsigned((8'hae)) != reg62))));
            end
          else
            begin
              reg77 <= wire72[(1'h0):(1'h0)];
              reg78 <= $signed(($unsigned(reg62) ?
                  $unsigned(wire44) : (^{wire73, $signed(wire41)})));
              reg79 <= reg53;
              reg80 <= reg55[(3'h7):(3'h7)];
              reg81 <= {(($signed(wire70) * wire69[(3'h6):(3'h6)]) ?
                      wire46[(4'hc):(2'h3)] : wire67[(4'hc):(3'h5)])};
            end
          reg82 <= wire71[(1'h0):(1'h0)];
          reg83 <= {($unsigned($signed(wire73)) ~^ reg82)};
          reg84 <= ((reg54[(4'ha):(1'h0)] ?
                  ($unsigned(wire41[(2'h3):(1'h0)]) ?
                      wire45[(5'h12):(4'ha)] : {(reg63 ?
                              reg60 : reg50)}) : $unsigned({(reg60 ?
                          reg63 : reg76)})) ?
              $unsigned((~&((wire47 ?
                  (8'hb4) : (8'h9f)) - $signed(reg59)))) : $unsigned($signed($signed(wire71))));
        end
      else
        begin
          if (wire46[(1'h1):(1'h1)])
            begin
              reg76 <= (|$signed($signed((reg63 ?
                  $unsigned(wire42) : (~|reg75)))));
              reg77 <= (-({reg60} ?
                  (~|wire42) : (wire47 | reg65[(3'h5):(1'h1)])));
              reg78 <= (~|(~{((^wire71) ^ $unsigned((8'hb2)))}));
              reg79 <= reg63[(3'h7):(3'h5)];
              reg80 <= $signed($unsigned($signed(((reg76 ?
                  (8'haa) : (8'hb8)) ^~ (8'hb6)))));
            end
          else
            begin
              reg76 <= wire70;
              reg77 <= reg51;
              reg78 <= $unsigned({reg83[(3'h6):(3'h6)], (!(~(~|(8'ha6))))});
            end
          reg81 <= $signed($signed((!wire67[(4'he):(3'h5)])));
          reg82 <= (-{$unsigned(wire70[(3'h6):(3'h4)])});
          reg83 <= reg76;
          if ((reg61 ?
              $unsigned(wire72[(2'h2):(1'h0)]) : wire74[(2'h2):(1'h0)]))
            begin
              reg84 <= reg59[(2'h2):(1'h0)];
              reg85 <= $unsigned(reg53);
              reg86 <= ((~&$signed(((wire74 ?
                      wire44 : (8'hbe)) <<< reg64[(4'h8):(4'h8)]))) ?
                  reg54[(1'h0):(1'h0)] : $unsigned(wire72[(1'h0):(1'h0)]));
              reg87 <= (|reg85);
            end
          else
            begin
              reg84 <= wire72[(1'h0):(1'h0)];
            end
        end
      if ((+$signed(reg57[(4'hc):(3'h7)])))
        begin
          reg88 <= reg63[(3'h5):(1'h1)];
          if ($unsigned((^$signed((~(wire73 <<< (8'had)))))))
            begin
              reg89 <= reg63[(3'h6):(1'h1)];
            end
          else
            begin
              reg89 <= $signed(wire48[(2'h3):(2'h2)]);
            end
          reg90 <= reg61[(2'h2):(2'h2)];
          reg91 <= wire72;
          reg92 <= {$signed(($signed($unsigned(reg78)) >>> (~^reg82[(1'h1):(1'h1)]))),
              (7'h40)};
        end
      else
        begin
          reg88 <= wire49[(2'h3):(1'h1)];
          reg89 <= reg57;
          reg90 <= wire70[(3'h6):(3'h4)];
        end
    end
  assign wire93 = reg90;
  always
    @(posedge clk) begin
      reg94 <= ($unsigned($signed({$signed(reg78)})) ?
          (8'ha7) : {(~wire69[(3'h4):(2'h3)])});
      if ((^~reg78[(1'h0):(1'h0)]))
        begin
          reg95 <= reg60[(1'h0):(1'h0)];
          reg96 <= $signed((reg86 ?
              (~$signed(((8'hbd) ? wire46 : wire93))) : $signed($signed((reg80 ?
                  wire69 : reg83)))));
          reg97 <= $signed($unsigned($unsigned(reg52)));
        end
      else
        begin
          reg95 <= ({{($signed(reg92) > wire67),
                      $unsigned(reg54[(2'h3):(2'h3)])},
                  ($signed((|(8'ha8))) | (reg57 ?
                      (reg51 ^ reg57) : reg63[(4'h8):(3'h5)]))} ?
              (((~|reg92) ?
                      ((&reg76) ?
                          $unsigned(wire73) : $signed(reg78)) : $unsigned(reg94[(5'h14):(3'h6)])) ?
                  wire68 : $unsigned(wire49)) : (-$signed(reg66)));
          if ($unsigned((reg80[(4'h8):(1'h1)] < (wire73[(3'h5):(2'h2)] ?
              reg63 : reg94[(4'ha):(2'h3)]))))
            begin
              reg96 <= {$signed($unsigned((-(~|reg82)))),
                  (|((reg90 ?
                      (~^reg59) : $signed(reg80)) + $unsigned((-(8'h9c)))))};
              reg97 <= reg84;
              reg98 <= (((({reg85, wire43} ?
                          ((8'hab) ^~ reg90) : wire69[(3'h5):(3'h4)]) ?
                      ((|reg52) && (reg78 >>> reg66)) : reg52) ?
                  {reg65} : $signed(wire44)) <<< reg75);
              reg99 <= ($unsigned($signed(((8'haf) ^ reg50))) ?
                  $unsigned(reg58[(1'h1):(1'h0)]) : $signed(reg87[(3'h4):(2'h3)]));
            end
          else
            begin
              reg96 <= (!wire49[(1'h0):(1'h0)]);
              reg97 <= ($unsigned($unsigned($unsigned((reg94 - wire46)))) != {(|reg54)});
              reg98 <= reg97;
              reg99 <= reg50[(2'h3):(1'h0)];
              reg100 <= $unsigned(reg75);
            end
        end
      if (reg66[(3'h4):(3'h4)])
        begin
          reg101 <= (~^((|((~&wire69) < (reg53 ? reg87 : reg99))) ?
              reg100 : $signed((((8'hbc) << reg56) != (reg51 > (8'hae))))));
          reg102 <= reg96[(1'h0):(1'h0)];
          reg103 <= $unsigned($unsigned(($unsigned($signed(reg85)) ?
              (wire42[(4'h8):(4'h8)] || (reg54 ? reg92 : reg101)) : {reg98})));
          reg104 <= wire74;
        end
      else
        begin
          reg101 <= (wire74 ?
              $signed($signed((&wire72))) : $signed((+(wire68 >> {(8'h9e),
                  reg55}))));
          reg102 <= (wire43 >>> wire49);
          if (wire71)
            begin
              reg103 <= $unsigned(reg64[(5'h13):(4'hf)]);
              reg104 <= $signed($signed($unsigned($signed($signed((8'ha1))))));
              reg105 <= (~&($unsigned({(wire69 <= reg104), (reg75 < reg58)}) ?
                  (8'hb3) : ((!(reg60 <<< wire46)) ?
                      $signed((reg64 ? reg86 : reg63)) : (reg80[(4'hb):(1'h0)] ?
                          (reg77 ~^ reg88) : (reg80 ? wire73 : wire68)))));
              reg106 <= (({wire47,
                          {$unsigned((8'ha5)), ((8'ha1) ? reg89 : reg77)}} ?
                      reg75[(1'h1):(1'h1)] : (~&reg52[(2'h2):(1'h0)])) ?
                  $unsigned((^~((^reg85) * $signed(reg90)))) : reg105[(3'h7):(2'h3)]);
              reg107 <= (wire49 ?
                  ((~&$signed((reg63 > reg101))) || ((wire41 * (reg58 ?
                          reg75 : reg76)) ?
                      ((~reg90) >> reg87[(4'hb):(3'h6)]) : (+(&wire72)))) : (8'hb2));
            end
          else
            begin
              reg103 <= ($unsigned($signed($signed((reg91 || wire70)))) + {reg107});
            end
          reg108 <= (^~$unsigned($signed($signed((~^(8'ha5))))));
        end
    end
  assign wire109 = reg96[(3'h4):(3'h4)];
  assign wire110 = ($unsigned(((wire44[(1'h0):(1'h0)] <= $unsigned(reg108)) ?
                       (+$signed((8'hac))) : reg103[(4'hb):(4'ha)])) != (~|({(reg65 ?
                               reg107 : reg100)} ?
                       reg79[(2'h2):(1'h1)] : (~|(reg94 | reg99)))));
endmodule

module module22
#(parameter param36 = ((^~((^(8'ha9)) ? ((|(8'haa)) != ((8'ha9) ? (8'hb0) : (8'hba))) : ({(7'h42)} < ((8'hb0) ? (8'haf) : (8'h9e))))) ? (7'h42) : ((8'hbf) | ({((8'ha7) ? (8'h9c) : (7'h44)), (~^(8'hb0))} < {((8'hb9) ^~ (8'ha3))}))), 
parameter param37 = param36)
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire26;
  input wire signed [(5'h12):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire24;
  input wire [(3'h4):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire27;
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire28,
                 wire27,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg29,
                 (1'h0)};
  assign wire27 = wire25;
  assign wire28 = wire23[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg29 <= (|(~|{(8'ha6)}));
    end
  assign wire30 = wire24[(4'ha):(3'h4)];
  assign wire31 = {$signed($unsigned((wire25 ?
                          wire30[(1'h1):(1'h0)] : (-wire26)))),
                      $signed(($signed($unsigned(reg29)) ?
                          $signed(((8'ha5) ? wire27 : (8'hbb))) : (reg29 ?
                              $signed((8'hb8)) : (wire30 ~^ wire25))))};
  always
    @(posedge clk) begin
      reg32 <= wire28;
      reg33 <= {wire28[(2'h3):(1'h0)]};
      reg34 <= $unsigned((~reg33));
      reg35 <= ($signed($signed(((+(8'ha3)) ?
          (~|wire26) : (+wire26)))) >= (reg34 | (+($signed(wire30) ?
          $unsigned(reg32) : (&wire31)))));
    end
endmodule
