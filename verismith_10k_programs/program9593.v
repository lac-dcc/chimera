module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire155;
  wire [(3'h5):(1'h0)] wire154;
  wire [(4'hc):(1'h0)] wire83;
  wire signed [(5'h10):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire89;
  wire [(4'hd):(1'h0)] wire152;
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire83,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire152,
                 (1'h0)};
  module5 #() modinst84 (.wire9(wire3), .wire7(wire0), .wire6(wire4), .wire8(wire1), .clk(clk), .y(wire83));
  assign wire85 = wire0;
  assign wire86 = ((!$signed({(8'ha4), (|wire83)})) == wire2[(4'h9):(2'h2)]);
  assign wire87 = (~^wire1[(4'h8):(2'h3)]);
  assign wire88 = $signed(wire1);
  assign wire89 = $unsigned($signed($signed(wire0[(5'h11):(1'h1)])));
  module90 #() modinst153 (.wire93(wire4), .clk(clk), .y(wire152), .wire94(wire85), .wire92(wire89), .wire91(wire88), .wire95(wire86));
  assign wire154 = wire89[(3'h4):(1'h1)];
  assign wire155 = wire1;
  assign wire156 = $unsigned((~&(wire89 ?
                       wire154 : $unsigned($unsigned(wire1)))));
endmodule

module module90
#(parameter param150 = ({((((7'h42) < (8'had)) < (~&(8'hb7))) ? ((+(8'haf)) < (|(8'ha9))) : ({(7'h43), (7'h41)} ^~ ((8'hbe) ? (8'hb1) : (8'hb6)))), ((((8'haa) || (8'had)) >> ((8'h9f) ? (8'h9e) : (8'ha2))) ? (+((8'ha5) | (8'hb5))) : (((8'h9e) >>> (8'ha5)) ^~ ((8'ha8) ? (8'hb6) : (7'h42))))} ^ (((((8'hac) ? (8'hb2) : (8'ha5)) < ((8'hbc) ? (7'h42) : (8'hb9))) ? (((8'ha8) ? (8'hbe) : (7'h44)) >>> ((8'hb0) ? (8'hb4) : (8'hb0))) : {{(8'haf)}}) ? {{(&(8'hb2)), ((8'h9d) ? (8'ha0) : (8'h9c))}} : (~|(((8'hb9) != (8'hb1)) ? ((8'h9c) ? (8'hae) : (8'hb7)) : ((8'hb4) ? (8'hb3) : (8'hbc)))))), 
parameter param151 = (^~param150))
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire95;
  input wire [(5'h10):(1'h0)] wire94;
  input wire signed [(4'hc):(1'h0)] wire93;
  input wire signed [(5'h15):(1'h0)] wire92;
  input wire signed [(3'h5):(1'h0)] wire91;
  wire [(4'hc):(1'h0)] wire149;
  wire [(3'h4):(1'h0)] wire148;
  wire [(3'h5):(1'h0)] wire147;
  wire [(2'h2):(1'h0)] wire146;
  wire signed [(5'h10):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire144;
  wire [(4'hc):(1'h0)] wire143;
  wire [(2'h3):(1'h0)] wire140;
  wire [(5'h15):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire112;
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire140,
                 wire115,
                 wire114,
                 wire112,
                 reg142,
                 (1'h0)};
  module96 #() modinst113 (wire112, clk, wire92, wire91, wire94, wire95);
  assign wire114 = $unsigned(wire112);
  assign wire115 = wire114[(3'h5):(1'h1)];
  module116 #() modinst141 (.wire120(wire114), .wire117(wire112), .y(wire140), .wire119(wire115), .clk(clk), .wire118(wire94));
  always
    @(posedge clk) begin
      reg142 <= wire94;
    end
  assign wire143 = ($signed($unsigned(($signed(wire93) * wire112[(4'hc):(1'h0)]))) ?
                       (!wire112[(3'h4):(1'h1)]) : wire95[(4'hb):(4'hb)]);
  assign wire144 = wire94;
  assign wire145 = $unsigned($signed(wire94[(4'hc):(4'hc)]));
  assign wire146 = (~{wire114[(3'h7):(2'h2)]});
  assign wire147 = $signed(($signed(wire140) ?
                       (wire143 ?
                           ((wire95 & wire144) ?
                               (^wire93) : {wire145}) : wire140) : ($signed((wire145 ?
                               wire93 : wire94)) ?
                           (((8'hba) && wire140) ?
                               $signed(wire140) : $signed((7'h44))) : (|(8'h9d)))));
  assign wire148 = wire112[(1'h1):(1'h1)];
  assign wire149 = $unsigned($signed((8'hb1)));
endmodule

module module5
#(parameter param81 = ((!{(|(|(7'h42)))}) <= (~(((8'ha3) ? ((8'haa) ? (7'h41) : (8'hac)) : ((8'hbf) ? (8'ha1) : (7'h43))) ~^ (((8'h9d) * (8'hb8)) ? (&(8'hae)) : ((8'hb1) >>> (8'ha3)))))), 
parameter param82 = ({(^~((^~param81) ? {(8'ha2)} : (param81 + param81))), (((param81 == param81) ? (param81 ? param81 : param81) : (8'hb6)) ? param81 : param81)} | ((~|param81) & (&{{param81, param81}, {param81}}))))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire77;
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire43,
                 wire45,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire77,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  module10 #() modinst44 (.clk(clk), .wire12(wire7), .wire13(wire9), .y(wire43), .wire14(wire6), .wire11(wire8));
  assign wire45 = (wire9 ?
                      (($signed((!wire43)) ?
                          (wire43 || wire8[(2'h3):(1'h0)]) : $unsigned($signed(wire9))) <= $signed($unsigned((wire8 ?
                          (8'ha2) : wire8)))) : $signed($signed((-wire9))));
  always
    @(posedge clk) begin
      reg46 <= (^~$signed(($unsigned(wire43) ?
          ($signed(wire43) - $signed(wire9)) : $unsigned($signed(wire43)))));
      reg47 <= wire43[(2'h2):(1'h1)];
      reg48 <= (~((~|wire45[(1'h0):(1'h0)]) * wire6[(2'h3):(1'h0)]));
      if (reg47)
        begin
          reg49 <= wire43;
          reg50 <= ($unsigned((~&reg48)) ?
              wire43[(4'hb):(2'h2)] : (&(wire7[(5'h10):(4'h8)] < wire6[(3'h7):(3'h7)])));
          reg51 <= {{wire8,
                  (((-reg46) == (wire43 && reg46)) != (!(reg47 >= reg48)))}};
        end
      else
        begin
          if ($unsigned($signed(((7'h43) >> reg50[(3'h5):(1'h0)]))))
            begin
              reg49 <= {$unsigned((8'ha6)), wire9[(4'hb):(3'h6)]};
              reg50 <= (!$unsigned($unsigned((^~$unsigned(wire45)))));
              reg51 <= $signed(wire6[(2'h3):(2'h3)]);
            end
          else
            begin
              reg49 <= reg50;
              reg50 <= reg51;
              reg51 <= wire7[(3'h7):(3'h4)];
              reg52 <= ($signed(($unsigned(reg46) ?
                  (!reg49[(2'h3):(2'h2)]) : (8'h9d))) >>> {(reg46[(4'ha):(3'h4)] >>> ((~reg46) ?
                      ((8'haa) <= reg48) : reg50[(3'h5):(3'h4)]))});
              reg53 <= wire6[(3'h4):(3'h4)];
            end
          reg54 <= reg52[(5'h10):(2'h3)];
        end
    end
  assign wire55 = reg54[(3'h6):(3'h4)];
  assign wire56 = ((reg48[(3'h4):(3'h4)] ?
                          ((+reg51[(3'h4):(1'h0)]) | (^~(^~reg52))) : ((~&(~|reg49)) ~^ $unsigned($signed(reg47)))) ?
                      wire8[(1'h1):(1'h0)] : (~|{((reg46 ? wire45 : reg51) ?
                              ((8'ha7) == wire7) : $signed((8'hab))),
                          (((8'ha6) ?
                              reg50 : (7'h41)) ^~ reg50[(4'he):(3'h6)])}));
  assign wire57 = (|(wire45 ?
                      $signed($unsigned((wire7 ?
                          wire6 : wire6))) : ($unsigned((wire7 ?
                              wire8 : wire56)) ?
                          ((!wire45) - $unsigned(wire55)) : reg52)));
  assign wire58 = $unsigned(((~|(^~$unsigned(reg54))) ?
                      ($unsigned((~(8'hae))) * (~^wire56)) : $signed(((wire56 ^ (8'hb7)) ?
                          $unsigned(reg46) : (|reg49)))));
  module59 #() modinst78 (wire77, clk, reg50, wire56, reg49, reg52, reg48);
  assign wire79 = (+$signed(reg54[(2'h2):(2'h2)]));
  assign wire80 = $unsigned(wire57[(1'h0):(1'h0)]);
endmodule

module module59
#(parameter param76 = ((({((7'h40) << (8'hb4))} ? (((8'hbb) || (7'h40)) != ((8'haa) | (7'h41))) : (8'hba)) ? (~(((8'ha2) <= (8'ha0)) << ((8'haf) ? (8'h9d) : (8'ha1)))) : (~|((^~(8'hba)) >>> ((8'ha8) ? (8'ha6) : (8'hb5))))) ? (|{((^(8'hb5)) ? ((8'hab) ? (8'ha3) : (8'hb9)) : ((8'hae) && (8'haf)))}) : (~({(~&(8'haf)), (|(8'ha2))} ? ((-(8'h9d)) ? ((8'hb2) ? (8'ha6) : (8'hb6)) : {(8'ha1), (8'hb6)}) : (~^((8'hb8) || (8'ha5)))))))
(y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire64;
  input wire signed [(4'h8):(1'h0)] wire63;
  input wire signed [(5'h10):(1'h0)] wire62;
  input wire signed [(4'h8):(1'h0)] wire61;
  input wire signed [(3'h7):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire65;
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg72,
                 (1'h0)};
  assign wire65 = wire64[(3'h7):(3'h7)];
  assign wire66 = wire65[(2'h3):(2'h2)];
  assign wire67 = $signed({wire65[(3'h5):(2'h3)], $unsigned((~&(-wire60)))});
  assign wire68 = (~$signed($signed((8'h9d))));
  assign wire69 = $signed($signed(((8'h9f) ?
                      (~&wire67[(1'h0):(1'h0)]) : (wire60[(1'h0):(1'h0)] ^ $unsigned(wire65)))));
  assign wire70 = $signed(wire64);
  assign wire71 = $unsigned(($signed($signed((~^wire68))) ?
                      (((wire63 ^~ wire67) >>> (8'haf)) ?
                          ((8'hb6) ?
                              {wire63} : (-wire60)) : $signed(wire60)) : wire63[(3'h5):(3'h4)]));
  always
    @(posedge clk) begin
      reg72 <= (~|(^wire66));
    end
  assign wire73 = $signed(wire65[(3'h7):(1'h0)]);
  assign wire74 = {(~|((^~(wire61 ? wire70 : reg72)) == wire64)),
                      (+(wire68 & wire62))};
  assign wire75 = wire60[(1'h1):(1'h0)];
endmodule

module module10
#(parameter param41 = ((~|(8'hb8)) - (((^((8'hba) << (8'h9f))) ? (8'hb8) : ({(8'hb9), (8'hb8)} ? (8'haf) : ((8'ha5) + (8'hba)))) ? ((~|(~|(8'h9f))) > (((8'h9c) ? (8'ha0) : (7'h42)) <= (~^(8'haa)))) : (((!(7'h41)) ? (!(8'ha8)) : ((7'h42) | (8'h9d))) << ({(8'ha5), (8'hb7)} <= (+(8'ha0)))))), 
parameter param42 = (!{(~^param41), param41}))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire17,
                 wire16,
                 wire15,
                 reg33,
                 reg32,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire15 = (~(wire13 & (~^$unsigned($signed(wire12)))));
  assign wire16 = (wire13[(1'h0):(1'h0)] >= wire13[(3'h5):(3'h4)]);
  assign wire17 = $unsigned(wire13);
  always
    @(posedge clk) begin
      reg18 <= ($unsigned($unsigned(wire12[(4'he):(3'h6)])) ?
          $unsigned(wire15) : (($unsigned((wire14 ^ (8'hb5))) << (((8'ha1) & wire13) && (8'hae))) ?
              $unsigned($unsigned((wire13 & wire16))) : $unsigned(wire11)));
      reg19 <= wire13[(2'h3):(2'h2)];
      reg20 <= wire11[(3'h5):(3'h5)];
      reg21 <= wire15[(4'h8):(3'h7)];
      reg22 <= (|$unsigned(((!$unsigned(reg18)) ?
          $unsigned((8'ha9)) : (+$unsigned(reg20)))));
    end
  assign wire23 = wire16;
  assign wire24 = (+wire17[(2'h2):(1'h1)]);
  assign wire25 = (wire15 & (^wire12[(4'ha):(4'h8)]));
  assign wire26 = wire15[(3'h5):(1'h0)];
  assign wire27 = reg18[(4'h8):(1'h1)];
  assign wire28 = ($unsigned(reg21) ?
                      wire11 : (~^{wire15, $signed((wire14 << wire17))}));
  assign wire29 = ($unsigned((wire15[(2'h3):(1'h0)] == {((8'ha0) + wire12)})) ?
                      $unsigned((reg22[(4'h8):(1'h0)] & $unsigned($unsigned(wire12)))) : ($unsigned(wire13[(1'h1):(1'h0)]) ?
                          (reg20[(1'h1):(1'h1)] ?
                              $unsigned((wire12 ?
                                  (8'ha4) : wire11)) : wire15[(3'h6):(3'h4)]) : (^~((wire26 & wire16) == $signed((8'haf))))));
  assign wire30 = (({wire29,
                      ($signed(wire12) ?
                          (^~reg19) : (wire26 ?
                              reg22 : wire14))} >> (!reg20)) - wire15[(3'h7):(3'h4)]);
  assign wire31 = (8'hae);
  always
    @(posedge clk) begin
      reg32 <= wire16;
      reg33 <= wire14[(3'h4):(1'h0)];
    end
  assign wire34 = wire16[(1'h0):(1'h0)];
  assign wire35 = $signed(wire15);
  assign wire36 = (8'ha3);
  assign wire37 = reg18[(2'h3):(1'h0)];
  assign wire38 = (~&$signed(($signed((+reg19)) ?
                      $signed((reg21 ? wire29 : reg33)) : {((8'h9c) >= wire37),
                          (wire34 ~^ wire30)})));
  assign wire39 = $signed((($unsigned(reg22[(3'h5):(2'h3)]) > $signed((~|wire13))) * wire23));
  assign wire40 = ({(~|wire38),
                          $unsigned(($unsigned(wire37) ^~ (wire25 ?
                              wire31 : wire17)))} ?
                      (|((wire14 ?
                          (wire15 ?
                              wire15 : reg32) : $unsigned(reg18)) <= $signed(wire36[(4'ha):(1'h1)]))) : {((^(|wire26)) ?
                              (^{wire12}) : ($unsigned(wire26) & (wire26 ^ wire35)))});
endmodule

module module116
#(parameter param139 = ((&({(|(8'had))} ? {(8'haf), (+(7'h40))} : (((8'h9c) & (8'hb9)) ? {(8'haf)} : {(8'hb8)}))) >> (^(((~&(8'ha6)) ? ((8'haf) || (8'h9d)) : {(7'h40), (8'hb2)}) ? {((8'hb3) ? (8'hbe) : (8'hb3)), (!(8'had))} : ((8'hbe) ? (^~(8'had)) : ((8'hb0) >>> (8'hbf)))))))
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire120;
  input wire signed [(5'h15):(1'h0)] wire119;
  input wire [(4'he):(1'h0)] wire118;
  input wire signed [(4'hd):(1'h0)] wire117;
  wire signed [(3'h4):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire125;
  wire signed [(4'hf):(1'h0)] wire124;
  wire signed [(2'h2):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  reg signed [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  assign y = {wire129,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg128,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire121 = (wire117 >>> wire119);
  assign wire122 = ((7'h43) ?
                       (({$signed(wire120),
                           wire119[(3'h4):(2'h3)]} & ($signed(wire121) ^~ (wire120 ?
                           wire119 : (8'ha2)))) & wire117) : (^~($signed($signed(wire120)) ?
                           wire121 : $signed((wire118 ^ wire121)))));
  assign wire123 = (~|(|$signed($unsigned({wire122, wire118}))));
  assign wire124 = (&((8'hb3) ? $signed($unsigned((^(8'hac)))) : wire120));
  assign wire125 = {(~|$signed((|wire117))), wire122[(3'h5):(1'h0)]};
  always
    @(posedge clk) begin
      reg126 <= wire119;
      reg127 <= wire117;
      reg128 <= ((!wire124[(4'ha):(1'h0)]) ? wire120 : wire123);
    end
  assign wire129 = wire124[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      if ({wire123, wire124[(3'h7):(1'h0)]})
        begin
          reg130 <= wire124[(4'hb):(1'h0)];
          reg131 <= (wire125[(3'h6):(3'h4)] ?
              wire129[(1'h1):(1'h1)] : wire119[(4'hb):(4'h9)]);
          reg132 <= {{(~|$unsigned((reg128 ? wire118 : reg128))), reg131},
              reg126[(3'h5):(1'h0)]};
          reg133 <= $unsigned((^$signed($signed(reg127))));
          reg134 <= $signed((~{wire119[(2'h3):(2'h2)],
              {reg128, (reg126 <<< (8'haf))}}));
        end
      else
        begin
          reg130 <= wire119[(4'h9):(2'h2)];
          reg131 <= $unsigned(reg133[(2'h2):(1'h1)]);
          if ($signed(reg134))
            begin
              reg132 <= (wire123[(2'h2):(2'h2)] ?
                  ((8'h9e) || ((^~wire119) >= $signed(wire117[(3'h6):(3'h4)]))) : {(({wire120,
                              wire124} ?
                          $signed(reg134) : (wire117 ?
                              wire129 : reg131)) && wire125),
                      {(+(^~wire123))}});
            end
          else
            begin
              reg132 <= (~&{$unsigned((~^wire118)),
                  ((&(~^wire117)) ?
                      $signed($unsigned(wire122)) : $signed(wire122))});
              reg133 <= $signed((reg130 ?
                  ($unsigned(wire122) ?
                      $signed(wire117[(3'h7):(3'h6)]) : $unsigned((~|(8'ha8)))) : (($signed(wire121) ?
                      (wire129 && wire121) : $signed(wire121)) >= (+(reg132 ?
                      wire122 : reg131)))));
              reg134 <= ((~&(&$unsigned(wire117))) || ($unsigned(reg126) < (~&wire117[(2'h3):(1'h0)])));
              reg135 <= ((~|(wire118 <<< (~&{wire119, (8'hb8)}))) ?
                  wire123[(1'h1):(1'h0)] : ({$unsigned((reg133 * wire118))} ?
                      (reg130 + (^~(wire119 ?
                          (8'hbc) : reg131))) : $unsigned((reg134[(4'h8):(2'h3)] ?
                          (wire118 ? reg131 : wire123) : (reg127 < wire119)))));
              reg136 <= (-((~|(7'h41)) ?
                  ((|(&wire122)) ^ (((8'ha7) ? (8'hb1) : wire117) ?
                      wire124[(3'h5):(2'h3)] : $unsigned(wire117))) : $signed(({reg132} >> (~&wire123)))));
            end
          reg137 <= ($unsigned($unsigned($unsigned($unsigned((8'hb2))))) <<< $unsigned((($unsigned(reg130) ^ $signed((8'hb7))) | wire120[(4'hf):(4'hc)])));
          reg138 <= $signed((7'h41));
        end
    end
endmodule

module module96
#(parameter param110 = (((((-(8'ha4)) <<< {(8'hab)}) ? (((8'hbc) <<< (8'hb0)) ? (|(8'hb5)) : {(8'h9c)}) : {{(8'hb4), (8'hba)}}) ? (^~((~|(8'hbe)) && ((7'h41) <= (8'h9c)))) : (-({(8'hb4)} ^~ {(8'hb8), (8'hbb)}))) ^~ (((^~((8'ha7) > (8'ha3))) > (((8'had) ? (8'h9e) : (8'h9f)) ? (-(8'hb4)) : {(7'h40)})) + (8'ha3))), 
parameter param111 = ((8'ha5) + (!(((param110 ? param110 : param110) ? (param110 < (8'ha6)) : (param110 == param110)) ? ((param110 && param110) * param110) : (-((8'haa) ^~ param110))))))
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire100;
  input wire signed [(3'h5):(1'h0)] wire99;
  input wire [(5'h10):(1'h0)] wire98;
  input wire signed [(5'h11):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire102;
  wire [(3'h6):(1'h0)] wire101;
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire103,
                 wire102,
                 wire101,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire101 = {$unsigned(wire99[(3'h4):(2'h3)]),
                       $unsigned(wire99[(3'h4):(3'h4)])};
  assign wire102 = (8'hbf);
  assign wire103 = wire102;
  always
    @(posedge clk) begin
      reg104 <= (^wire97);
      reg105 <= $unsigned($signed(($signed((8'hbb)) ?
          reg104[(3'h6):(2'h3)] : wire102[(3'h5):(2'h3)])));
      reg106 <= (~^$signed({(^~wire103)}));
    end
  assign wire107 = ($unsigned(wire103[(1'h0):(1'h0)]) ?
                       reg105 : $signed((|$signed((&wire98)))));
  assign wire108 = (~^($signed($unsigned(wire103[(2'h3):(1'h0)])) ?
                       (((reg106 ? reg105 : wire102) ?
                               {wire101} : ((8'ha4) ? wire107 : reg104)) ?
                           (~&$signed(wire103)) : ((-wire97) == (reg105 ?
                               wire97 : wire100))) : ($signed(((8'hab) != wire103)) ?
                           (+$unsigned((8'ha1))) : (reg106[(3'h7):(3'h5)] <= wire100[(4'ha):(1'h0)]))));
  assign wire109 = (reg105[(5'h12):(4'h9)] ?
                       $unsigned(((~&(^wire101)) ?
                           wire103[(4'hd):(3'h4)] : {$signed(wire102)})) : (+{(8'hbf),
                           ((^~(8'hbe)) ?
                               wire97[(4'h8):(2'h2)] : $unsigned((8'hac)))}));
endmodule
