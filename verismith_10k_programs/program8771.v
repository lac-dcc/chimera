module top
#(parameter param182 = (|(8'hae)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire181;
  wire signed [(5'h11):(1'h0)] wire179;
  wire [(3'h6):(1'h0)] wire178;
  wire signed [(4'h9):(1'h0)] wire177;
  wire [(4'hb):(1'h0)] wire176;
  wire signed [(4'ha):(1'h0)] wire175;
  wire signed [(4'hd):(1'h0)] wire174;
  wire signed [(3'h7):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire171;
  wire [(5'h12):(1'h0)] wire170;
  wire signed [(4'hc):(1'h0)] wire168;
  wire [(5'h14):(1'h0)] wire167;
  wire [(5'h14):(1'h0)] wire166;
  wire signed [(3'h5):(1'h0)] wire165;
  wire signed [(5'h14):(1'h0)] wire164;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire162;
  assign y = {wire181,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire171,
                 wire170,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire41,
                 wire6,
                 wire5,
                 wire43,
                 wire162,
                 (1'h0)};
  assign wire5 = $unsigned((^((&wire4) ?
                     $unsigned((~&wire4)) : $unsigned(wire4))));
  assign wire6 = wire1[(1'h1):(1'h1)];
  module7 #() modinst42 (wire41, clk, wire6, wire0, wire5, wire4, wire3);
  assign wire43 = $unsigned({(^((wire2 < wire6) ?
                          (~|wire5) : (wire0 || wire3))),
                      (~wire6)});
  module44 #() modinst163 (wire162, clk, wire2, wire43, wire1, wire41, wire0);
  assign wire164 = wire1[(2'h2):(2'h2)];
  assign wire165 = (^((|wire3) ^ $signed(wire6[(4'h9):(3'h4)])));
  assign wire166 = wire164;
  assign wire167 = ($signed((wire43[(4'he):(3'h5)] ?
                           wire164 : $signed(wire1))) ?
                       $signed($signed(wire6)) : wire1);
  module147 #() modinst169 (wire168, clk, wire41, wire43, wire5, wire167);
  assign wire170 = wire41;
  module147 #() modinst172 (.wire148(wire164), .wire149(wire3), .y(wire171), .wire151(wire166), .clk(clk), .wire150(wire170));
  assign wire173 = (^~($signed((8'had)) ?
                       wire4[(2'h3):(1'h1)] : (({(8'hbb)} * (+(8'ha6))) && ((wire166 ?
                               wire168 : wire162) ?
                           $signed((8'haf)) : (wire0 ? wire5 : wire165)))));
  assign wire174 = wire162[(2'h2):(1'h1)];
  assign wire175 = $unsigned(((((-wire171) <<< (wire43 <<< wire3)) ?
                           (wire171 ^~ {wire164}) : wire4) ?
                       (($unsigned(wire5) < (8'hac)) ?
                           {$signed(wire174), (wire3 ^ wire167)} : (wire171 ?
                               $unsigned(wire43) : (wire166 ?
                                   wire4 : wire168))) : (^~{(-wire168),
                           wire2})));
  assign wire176 = $unsigned(wire0);
  assign wire177 = {$unsigned($unsigned($unsigned((~&wire41))))};
  assign wire178 = wire6[(1'h0):(1'h0)];
  module54 #() modinst180 (.y(wire179), .wire57(wire178), .wire55(wire2), .wire58(wire171), .wire56(wire0), .clk(clk));
  assign wire181 = $signed((^~$signed((wire3[(5'h12):(3'h5)] - (wire164 ?
                       wire41 : wire171)))));
endmodule

module module44
#(parameter param161 = ((&((((8'hb7) ? (8'hbd) : (8'hb7)) ^ (8'hbc)) ? ((~^(8'hac)) * ((8'ha6) + (8'hbf))) : ({(8'hbf), (8'h9f)} ? ((8'ha0) ? (8'hb9) : (7'h40)) : {(8'hb7)}))) < ((((~|(8'haa)) && ((8'hbd) - (7'h44))) ? {(~(8'hbe)), ((8'hbd) ? (8'haf) : (8'ha0))} : ((~^(8'hb9)) ? {(8'ha6), (8'ha5)} : (8'hb7))) ? ((^(7'h41)) <= (-((8'hb8) ? (8'ha5) : (8'ha3)))) : (~&(!{(8'haa)})))))
(y, clk, wire45, wire46, wire47, wire48, wire49);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire45;
  input wire [(5'h14):(1'h0)] wire46;
  input wire signed [(3'h5):(1'h0)] wire47;
  input wire [(5'h10):(1'h0)] wire48;
  input wire [(4'he):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire159;
  wire [(4'hc):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire123;
  wire [(5'h12):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire120;
  assign y = {wire159,
                 wire145,
                 wire123,
                 wire122,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire85,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire120,
                 (1'h0)};
  assign wire50 = $signed((wire48 ?
                      (~|((wire49 ? wire49 : wire46) ?
                          (wire45 ?
                              wire46 : wire49) : wire45[(3'h6):(3'h5)])) : $signed(({wire49,
                          wire46} * $signed(wire47)))));
  assign wire51 = $unsigned((|$signed(((~&wire49) ?
                      (wire50 != (8'ha9)) : (+wire46)))));
  assign wire52 = (^wire46);
  assign wire53 = (~&(wire50[(3'h6):(3'h4)] ?
                      ($signed(((8'ha5) ? wire49 : wire48)) ?
                          (8'h9f) : $unsigned((!wire47))) : wire47[(1'h1):(1'h0)]));
  module54 #() modinst86 (.wire57(wire51), .clk(clk), .wire56(wire48), .wire55(wire53), .wire58(wire47), .y(wire85));
  assign wire87 = $unsigned(($signed((^~(wire85 ? wire47 : wire45))) ?
                      $signed((~|$signed(wire51))) : ((wire53[(3'h4):(1'h0)] ?
                          wire49 : ((8'hb2) ?
                              wire46 : wire50)) * (^~(wire45 + wire52)))));
  assign wire88 = {(^({{wire87}} << $signed($signed(wire45)))),
                      (wire49 ^ (+((&wire87) || (!wire45))))};
  assign wire89 = {{{$unsigned(wire51)}},
                      ((~^(~&wire48[(1'h1):(1'h0)])) ?
                          (wire48 ?
                              wire87[(3'h5):(3'h5)] : $signed((wire47 != wire47))) : wire87)};
  assign wire90 = {((~&$unsigned($unsigned(wire89))) ?
                          wire53[(4'he):(1'h1)] : wire49[(3'h4):(1'h0)])};
  assign wire91 = (($unsigned(((wire45 <= wire49) && $signed(wire87))) + (7'h43)) > $signed(((wire85 ?
                          $signed(wire87) : (wire90 ? wire53 : wire89)) ?
                      (8'hac) : (|$signed(wire90)))));
  module92 #() modinst121 (wire120, clk, wire49, wire52, wire48, wire91, wire47);
  assign wire122 = $signed(((~({wire90} + (wire53 + wire49))) ?
                       (&$unsigned(wire46[(3'h6):(3'h6)])) : ({(wire120 ^~ (8'hb6))} ?
                           $signed({wire52}) : ((wire90 ?
                               wire50 : (8'ha0)) ^~ wire87[(3'h4):(1'h1)]))));
  assign wire123 = wire53[(1'h1):(1'h1)];
  module124 #() modinst146 (.wire128(wire122), .wire127(wire123), .wire125(wire88), .wire126(wire51), .y(wire145), .clk(clk));
  module147 #() modinst160 (.clk(clk), .wire150(wire48), .y(wire159), .wire151(wire122), .wire148(wire46), .wire149(wire89));
endmodule

module module7
#(parameter param40 = {(({((8'hab) ? (7'h43) : (8'hb8)), ((8'hac) ? (7'h44) : (8'ha1))} + {{(8'hb2)}}) | (^(!((8'h9c) <<< (8'hb7))))), ({((~|(8'hb7)) ? ((7'h41) ? (8'hbe) : (8'haa)) : {(8'ha1)})} ? (((8'h9f) ? (&(8'h9c)) : (^(8'ha9))) && {{(8'hb4)}}) : ({{(8'hbb), (8'ha0)}} >> {(+(8'hb8)), (8'h9c)}))})
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire31;
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire13,
                 wire14,
                 wire15,
                 wire31,
                 (1'h0)};
  assign wire13 = ((8'ha9) ^~ (wire10[(3'h6):(2'h2)] ?
                      ((wire10[(4'h9):(3'h7)] < (+wire12)) >= wire10) : (+((wire12 ?
                          wire12 : (8'ha1)) + (wire11 ? wire12 : wire11)))));
  assign wire14 = {((wire9[(3'h7):(3'h4)] ?
                          $signed((8'hb0)) : ($signed(wire11) ?
                              (wire13 ?
                                  wire11 : wire10) : (wire12 >> wire10))) << $unsigned((wire9 > (wire9 && wire11)))),
                      {wire8[(4'he):(4'hd)]}};
  assign wire15 = wire9[(3'h5):(2'h3)];
  module16 #() modinst32 (.wire19(wire13), .y(wire31), .clk(clk), .wire21(wire8), .wire18(wire14), .wire20(wire11), .wire17(wire9));
  assign wire33 = $signed((|wire15));
  assign wire34 = {{$signed(wire12[(5'h12):(4'hc)]), $signed($signed(wire13))},
                      $signed(wire8)};
  assign wire35 = (((!wire11) ?
                      (({wire15, wire11} ? wire33 : $signed(wire31)) ?
                          wire8[(2'h2):(2'h2)] : wire31[(2'h3):(2'h2)]) : ($unsigned($unsigned(wire12)) ?
                          ((!wire31) ?
                              wire15 : $signed((8'h9c))) : ($unsigned(wire15) ^ (wire33 ?
                              wire14 : wire31)))) << ((~^$unsigned(wire14[(3'h7):(1'h1)])) <<< ((8'hbb) && wire14[(4'hb):(3'h5)])));
  assign wire36 = (wire33 ~^ {(+(|(wire14 ? wire14 : wire14)))});
  assign wire37 = wire31;
  assign wire38 = $signed(wire34);
  assign wire39 = (((8'hbd) ? wire10 : wire15) * wire14);
endmodule

module module16
#(parameter param29 = ((+((((8'hb1) ? (8'hb4) : (8'h9c)) ? {(8'hac)} : ((8'hb5) ? (8'hb2) : (8'hab))) << (|{(8'hab), (8'hbd)}))) ? ((~^(~^((7'h42) - (8'ha2)))) <= (~{{(8'hb2), (8'h9d)}})) : (((^{(8'ha6)}) >= ({(8'hb3)} ? ((8'hbf) - (8'ha6)) : ((8'had) ? (8'ha5) : (7'h43)))) << (|(~^(~^(7'h44)))))), 
parameter param30 = (param29 << (!(((~&param29) >= {param29, (8'hbd)}) ? ((param29 ? param29 : param29) - (param29 ? param29 : param29)) : (!(~&param29))))))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire [(3'h4):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire22;
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  assign y = {wire28, wire27, wire26, wire25, wire24, wire22, reg23, (1'h0)};
  assign wire22 = (+(~&(((8'hab) ? {wire18} : (wire17 != wire21)) ?
                      $signed((~wire20)) : wire19)));
  always
    @(posedge clk) begin
      reg23 <= wire18;
    end
  assign wire24 = ($signed($signed(reg23)) ?
                      (~&wire18) : (~({(reg23 ? wire20 : (8'hb5))} & ((wire22 ?
                          reg23 : wire22) <<< wire22[(3'h6):(3'h6)]))));
  assign wire25 = (^((-$signed((~^wire21))) ?
                      {$signed(reg23[(3'h4):(1'h0)]),
                          wire19} : $unsigned({$unsigned(wire18)})));
  assign wire26 = (+((((wire20 >> wire20) ^ (reg23 ?
                      reg23 : wire24)) | $unsigned(wire24)) - (wire19 & ($signed((7'h41)) ?
                      $signed(wire24) : {wire21, reg23}))));
  assign wire27 = (wire22[(2'h2):(2'h2)] ?
                      ($unsigned((8'hb2)) ?
                          (!{(wire22 ?
                                  wire24 : wire24)}) : (~&wire21[(5'h13):(5'h13)])) : $unsigned((-$signed((^~(8'ha0))))));
  assign wire28 = {((!({wire17, wire21} ?
                          $signed((8'hab)) : $signed(wire26))) ^~ wire25)};
endmodule

module module147
#(parameter param158 = ((((&(~|(8'hb3))) & (^(|(7'h40)))) ? ((&{(8'hbd)}) - (~^{(8'hac)})) : {(((8'hbf) & (8'hba)) | ((8'h9d) <<< (8'ha9))), {((8'hba) ^ (8'hab)), ((8'h9d) ? (7'h40) : (8'hb1))}}) ? (^(~(!{(8'hac), (8'hbe)}))) : (~&{((|(8'h9f)) ? (~(8'ha6)) : {(8'hb2)}), {((8'haf) <<< (8'hb1))}})))
(y, clk, wire151, wire150, wire149, wire148);
  output wire [(32'h1f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire151;
  input wire signed [(2'h3):(1'h0)] wire150;
  input wire [(5'h12):(1'h0)] wire149;
  input wire signed [(5'h14):(1'h0)] wire148;
  wire signed [(4'ha):(1'h0)] wire157;
  wire [(2'h3):(1'h0)] wire156;
  wire [(4'h8):(1'h0)] wire155;
  wire [(2'h3):(1'h0)] wire154;
  wire [(2'h2):(1'h0)] wire153;
  wire signed [(3'h4):(1'h0)] wire152;
  assign y = {wire157, wire156, wire155, wire154, wire153, wire152, (1'h0)};
  assign wire152 = wire149;
  assign wire153 = wire148[(2'h3):(2'h3)];
  assign wire154 = wire152[(2'h2):(1'h1)];
  assign wire155 = $unsigned(wire152[(3'h4):(2'h3)]);
  assign wire156 = wire155;
  assign wire157 = (wire153[(2'h2):(1'h1)] <= wire156[(2'h3):(1'h0)]);
endmodule

module module124
#(parameter param143 = ({(8'ha5), ({(~^(8'hb4)), ((8'h9c) & (8'hb0))} ? ({(7'h41), (8'hbb)} * ((8'hbf) <= (8'hb4))) : (+((8'hb9) ? (8'hb8) : (8'ha7))))} != (8'hbb)), 
parameter param144 = (param143 + (8'h9c)))
(y, clk, wire128, wire127, wire126, wire125);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire128;
  input wire [(3'h6):(1'h0)] wire127;
  input wire [(4'he):(1'h0)] wire126;
  input wire [(4'he):(1'h0)] wire125;
  wire signed [(3'h4):(1'h0)] wire142;
  wire signed [(4'hc):(1'h0)] wire141;
  wire [(4'hf):(1'h0)] wire140;
  wire signed [(3'h5):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire138;
  wire signed [(5'h13):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire136;
  wire signed [(2'h2):(1'h0)] wire135;
  wire [(4'he):(1'h0)] wire134;
  wire signed [(4'h8):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire132;
  wire signed [(4'hb):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire130;
  wire [(2'h3):(1'h0)] wire129;
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 (1'h0)};
  assign wire129 = $signed((7'h44));
  assign wire130 = $unsigned(((wire126 ^~ ($signed(wire129) ^ (~wire127))) ?
                       wire129 : (!wire127[(1'h1):(1'h0)])));
  assign wire131 = wire130;
  assign wire132 = $unsigned((8'hb4));
  assign wire133 = (+$unsigned($signed((~&$unsigned(wire125)))));
  assign wire134 = wire132[(4'hc):(1'h0)];
  assign wire135 = wire127;
  assign wire136 = ($unsigned({$signed((8'hb4))}) >> (wire129[(2'h3):(2'h2)] ?
                       (wire128 || wire127) : {wire132[(1'h0):(1'h0)]}));
  assign wire137 = wire134[(3'h4):(3'h4)];
  assign wire138 = (&(|(wire131 * wire127[(2'h2):(1'h1)])));
  assign wire139 = ((&{((wire127 >= wire138) >> $unsigned((8'hbc)))}) <= (wire127[(3'h5):(3'h5)] ?
                       $signed((wire136[(3'h6):(1'h0)] < (wire125 >>> wire137))) : $unsigned($unsigned(wire129))));
  assign wire140 = wire132;
  assign wire141 = {wire132[(4'hc):(3'h6)],
                       {wire128[(2'h3):(1'h0)], wire134[(3'h5):(1'h0)]}};
  assign wire142 = wire140;
endmodule

module module92
#(parameter param119 = (~|(&(^~(|(~^(8'hbb)))))))
(y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire97;
  input wire [(4'h9):(1'h0)] wire96;
  input wire signed [(4'hd):(1'h0)] wire95;
  input wire [(3'h6):(1'h0)] wire94;
  input wire [(3'h4):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire118;
  wire signed [(3'h5):(1'h0)] wire117;
  wire signed [(4'hc):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire108;
  wire [(4'hc):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  reg signed [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg102 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 reg113,
                 reg112,
                 reg111,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire98 = $signed(wire97);
  assign wire99 = (wire98[(4'hd):(3'h6)] ?
                      $unsigned($signed(((~^wire94) ?
                          $signed(wire94) : (wire96 || wire94)))) : (($signed(wire96) ?
                              ((~&wire94) ~^ (8'hbb)) : {$signed(wire98),
                                  ((7'h41) ? wire94 : (8'hb0))}) ?
                          ((wire95 != (wire96 ?
                              wire96 : wire94)) && $unsigned($signed(wire97))) : $unsigned(((wire95 << wire96) ?
                              wire95[(4'hd):(4'hc)] : wire94[(3'h5):(1'h0)]))));
  assign wire100 = (^((wire98 ?
                       (8'hb0) : $signed($unsigned(wire99))) * wire95[(4'ha):(3'h7)]));
  assign wire101 = {($unsigned(wire97) ? (!(^$signed((8'hb9)))) : (8'hbe)),
                       wire93[(2'h3):(1'h1)]};
  always
    @(posedge clk) begin
      reg102 <= ((wire98 ?
          (7'h44) : $signed(wire94[(3'h4):(2'h2)])) & (wire100[(4'h9):(4'h8)] | (((wire100 && wire101) ?
              $unsigned((8'hab)) : (wire94 << wire101)) ?
          ((^~(8'haf)) ?
              ((7'h42) <<< (8'ha3)) : $signed(wire93)) : $signed((|(8'hbe))))));
      reg103 <= (8'hb6);
      reg104 <= wire93[(2'h3):(2'h3)];
    end
  assign wire105 = ((wire100 || wire98) ?
                       (8'hb5) : {((~&wire100[(3'h6):(2'h2)]) ?
                               ((reg103 ?
                                   wire94 : wire93) ^ $signed((8'haa))) : reg102[(3'h5):(3'h4)])});
  assign wire106 = (^~(((|$unsigned((8'hab))) ?
                           {(-wire94), wire95[(1'h0):(1'h0)]} : reg102) ?
                       (wire105 ?
                           ((~reg103) << wire98) : (~|(wire105 >> wire99))) : (!(8'hbf))));
  assign wire107 = ((-reg103[(4'hc):(4'h8)]) - $unsigned($unsigned((~$signed(wire94)))));
  assign wire108 = (reg103 <= $signed((&$signed($signed(wire100)))));
  assign wire109 = $unsigned((|$unsigned(reg103)));
  assign wire110 = {(^$signed((wire101[(4'ha):(2'h2)] * $unsigned((8'had)))))};
  always
    @(posedge clk) begin
      reg111 <= ((((~|(!(8'haa))) ?
          (^(wire100 << wire101)) : (!wire101)) != $unsigned((^wire95[(4'hb):(3'h6)]))) << $signed(($unsigned($signed(wire108)) ?
          (~^{wire105}) : ($signed(wire97) && {reg104}))));
      reg112 <= $signed(({$signed((wire94 ? (8'hb4) : (8'hae)))} << (8'hbe)));
      reg113 <= $signed(wire100);
    end
  assign wire114 = wire99;
  assign wire115 = {$signed({(reg104 != (!wire95)),
                           ($signed(reg104) ^ reg113)})};
  assign wire116 = wire107[(1'h0):(1'h0)];
  assign wire117 = wire115;
  assign wire118 = wire117[(2'h3):(2'h2)];
endmodule

module module54
#(parameter param84 = {({((^(8'hab)) - ((8'h9f) ^~ (8'had)))} ? (~(8'hb2)) : (+(|((8'hbe) ? (8'ha5) : (8'haf))))), (((8'haf) < (~^((8'hb9) ? (8'hb1) : (8'hb3)))) ? (((+(7'h43)) ? ((8'had) ? (8'hb3) : (8'hbc)) : ((8'h9f) || (8'hb7))) >= {(-(8'ha1)), ((8'ha6) ? (8'hb5) : (8'ha8))}) : ((((8'hbb) ? (8'ha6) : (8'ha4)) ? ((8'ha7) && (7'h43)) : (~(8'hb6))) ? (~&(8'ha7)) : ((!(8'hab)) <<< ((8'haf) || (7'h42)))))})
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire58;
  input wire [(3'h6):(1'h0)] wire57;
  input wire signed [(5'h10):(1'h0)] wire56;
  input wire [(5'h15):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
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
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire55 - ((|($unsigned((8'h9e)) ? wire55 : $unsigned((8'h9c)))) ?
          $unsigned(wire55[(5'h14):(2'h3)]) : $signed($signed($signed(wire57))))))
        begin
          if ($signed($unsigned($signed($unsigned($signed(wire58))))))
            begin
              reg59 <= ((~|wire58) ^ $unsigned($unsigned($unsigned(wire56))));
              reg60 <= wire56;
            end
          else
            begin
              reg59 <= (~^reg60[(4'hb):(3'h5)]);
              reg60 <= $signed((-reg59[(3'h4):(3'h4)]));
              reg61 <= {(8'hb6), wire55};
            end
        end
      else
        begin
          reg59 <= wire56;
          reg60 <= $signed({(($signed(wire57) ~^ (wire56 > wire55)) ?
                  $signed((reg59 <<< (8'haf))) : $signed(wire58[(2'h2):(2'h2)]))});
          if (reg61[(1'h1):(1'h1)])
            begin
              reg61 <= {$signed($signed(reg61))};
            end
          else
            begin
              reg61 <= $unsigned(reg60);
              reg62 <= $unsigned(reg61[(3'h6):(2'h3)]);
              reg63 <= ($unsigned(($unsigned((wire56 ? (8'ha6) : reg61)) ?
                      (reg61 >> $unsigned(reg59)) : ($signed(wire58) ?
                          ((7'h43) ? wire55 : (7'h41)) : (wire55 >>> reg60)))) ?
                  ($unsigned((8'ha7)) & $signed($unsigned($signed(reg60)))) : wire56);
            end
        end
      if ($signed($unsigned((((reg63 * wire58) >> wire57) ?
          (~{wire55}) : {$unsigned(wire57), (wire56 ? (8'ha2) : wire58)}))))
        begin
          reg64 <= reg61[(3'h4):(1'h0)];
          if ($unsigned($signed({(reg61[(1'h1):(1'h1)] && (wire55 * reg64)),
              reg60[(4'h9):(1'h1)]})))
            begin
              reg65 <= (~&reg63);
            end
          else
            begin
              reg65 <= ((wire56[(4'hc):(1'h1)] ?
                  (8'h9d) : {($unsigned(wire57) <= (wire55 ?
                          wire57 : reg62))}) | reg60);
              reg66 <= ((~&$signed((^~$unsigned(reg61)))) ^~ reg63);
            end
        end
      else
        begin
          reg64 <= reg62[(2'h3):(2'h2)];
          reg65 <= $unsigned((reg62[(3'h5):(1'h1)] << ({$signed(reg60),
                  wire57[(3'h5):(3'h4)]} ?
              wire57 : $signed((8'ha2)))));
          if (($signed((^~reg63[(2'h2):(1'h0)])) >>> wire56))
            begin
              reg66 <= ({{($signed(reg62) << (-(7'h41))),
                          ({reg61, reg61} ? reg65 : (!reg63))}} ?
                  (+(wire55[(3'h5):(1'h0)] ?
                      {((7'h43) >>> wire57)} : {reg61[(1'h0):(1'h0)]})) : $unsigned($unsigned($signed($signed(reg64)))));
              reg67 <= (8'hae);
              reg68 <= (!(reg60 ?
                  reg61 : (wire58[(2'h2):(1'h1)] ?
                      reg66 : ((wire56 >= (7'h44)) ?
                          (|reg61) : $signed(wire57)))));
              reg69 <= $signed($signed(($signed(wire57) - $signed(reg68))));
            end
          else
            begin
              reg66 <= $unsigned(wire56[(4'hd):(3'h6)]);
              reg67 <= (8'hbc);
              reg68 <= reg59;
              reg69 <= (reg59 ? reg59 : reg63[(4'h9):(1'h0)]);
              reg70 <= (reg63 ?
                  reg59 : $unsigned(((-wire57[(1'h1):(1'h0)]) != $unsigned($unsigned(wire56)))));
            end
          if ((~^((reg67[(4'ha):(1'h1)] ~^ $unsigned({(7'h40), reg62})) ?
              $unsigned($unsigned(reg59[(1'h1):(1'h1)])) : (|reg66))))
            begin
              reg71 <= reg64[(3'h4):(1'h0)];
              reg72 <= ({reg67} | ($unsigned(reg59) ?
                  ($unsigned(wire56) ?
                      wire57[(1'h0):(1'h0)] : (reg60 || $signed(reg68))) : $signed(reg64)));
              reg73 <= ((reg68 < reg65[(1'h0):(1'h0)]) << (7'h40));
              reg74 <= wire56;
              reg75 <= (-$signed((~|(+reg74))));
            end
          else
            begin
              reg71 <= wire55[(3'h5):(2'h2)];
              reg72 <= $unsigned((reg75 ?
                  $unsigned(reg70) : $unsigned(({(8'ha6), reg63} ?
                      {reg65} : (reg60 ? reg61 : reg72)))));
              reg73 <= (|$signed({((wire56 ? reg63 : reg64) >>> (reg61 ?
                      wire57 : reg68)),
                  reg75[(2'h3):(1'h1)]}));
              reg74 <= ({$unsigned(reg59[(3'h7):(2'h2)]),
                  (($unsigned(reg68) ?
                      reg63[(2'h3):(2'h2)] : $signed((8'ha0))) & (!(reg62 ~^ reg67)))} < $signed({(reg69 < {reg62})}));
              reg75 <= ({($signed(reg61[(3'h5):(2'h3)]) ?
                      $unsigned((reg64 > reg62)) : (^{wire56})),
                  ({reg61,
                      (|reg74)} >= {$unsigned(reg67)})} <= $signed((^~(((7'h40) == reg71) ?
                  (&reg72) : reg75))));
            end
        end
    end
  assign wire76 = (^((reg72 ?
                      $signed(reg62[(2'h2):(2'h2)]) : (^{reg65,
                          (8'ha3)})) ^ (8'ha9)));
  assign wire77 = $signed({((reg69 ? (reg64 + reg69) : (+reg73)) * ({reg62,
                          reg72} != reg73)),
                      {(^~$unsigned(wire56)), $unsigned(((8'hb8) >>> reg63))}});
  assign wire78 = ((reg60 & $unsigned(wire58[(1'h1):(1'h0)])) ?
                      (~|reg73) : (~&(~|reg62[(3'h4):(2'h3)])));
  assign wire79 = wire55;
  assign wire80 = wire79[(2'h3):(2'h3)];
  assign wire81 = wire79;
  assign wire82 = reg67[(3'h5):(2'h2)];
  assign wire83 = (~^(7'h43));
endmodule
