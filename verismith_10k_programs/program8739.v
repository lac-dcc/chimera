module top #(parameter param178 = (8'hb2)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire177;
  wire [(4'hd):(1'h0)] wire176;
  wire [(5'h12):(1'h0)] wire169;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg174 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg172 = (1'h0);
  reg [(3'h4):(1'h0)] reg171 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire169,
                 wire4,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  assign wire4 = $signed(($signed((^(wire3 && wire0))) + (^($unsigned(wire3) >= wire3[(4'h9):(3'h6)]))));
  module5 #() modinst170 (.wire9(wire3), .y(wire169), .wire7(wire0), .clk(clk), .wire8(wire2), .wire6(wire4));
  always
    @(posedge clk) begin
      reg171 <= {(($unsigned(wire3[(2'h3):(1'h0)]) <= (wire1 ?
              (!wire2) : $unsigned(wire2))) || {{(~(8'ha3)), (^wire1)}})};
      reg172 <= $signed($signed(wire1[(1'h0):(1'h0)]));
      reg173 <= reg171;
      reg174 <= $signed(reg172[(4'hb):(4'hb)]);
      reg175 <= (reg172[(3'h4):(2'h3)] <<< (-$unsigned(reg174)));
    end
  assign wire176 = $signed((!{reg172, (-{reg173})}));
  assign wire177 = $unsigned(wire169[(4'h8):(3'h7)]);
endmodule

module module5
#(parameter param167 = {(!((^~((8'hab) ? (7'h44) : (8'hbb))) ? (8'ha5) : (((8'hb2) + (8'haf)) != ((7'h40) << (8'hb3))))), {(8'hbd)}}, 
parameter param168 = ((((!param167) >= (|(param167 + (8'hbd)))) <= param167) ? param167 : ((((~&param167) || {param167}) ? (~^(param167 ? param167 : param167)) : ((param167 == param167) ? (param167 != param167) : (~param167))) <<< param167)))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire165;
  wire [(4'he):(1'h0)] wire142;
  wire [(3'h7):(1'h0)] wire140;
  wire [(3'h7):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire101;
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire165,
                 wire142,
                 wire140,
                 wire63,
                 wire11,
                 wire10,
                 wire65,
                 wire66,
                 wire67,
                 wire101,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = ({wire6[(3'h4):(1'h0)], wire6} ? $signed((8'had)) : wire6);
  assign wire11 = (wire6 <= (wire9[(1'h0):(1'h0)] ?
                      ($unsigned((~wire7)) ?
                          (wire7 ?
                              $signed(wire7) : {wire8}) : wire9) : {$unsigned(wire8),
                          wire10[(2'h3):(1'h0)]}));
  always
    @(posedge clk) begin
      reg12 <= $signed($signed(((wire7 >>> wire9) ^~ (^~{wire6}))));
      reg13 <= wire7[(3'h6):(2'h2)];
      reg14 <= (reg12[(4'h8):(2'h2)] ? wire10[(1'h1):(1'h0)] : (8'hb3));
      reg15 <= (wire7[(1'h1):(1'h1)] ?
          {$signed(reg13[(5'h14):(3'h4)]),
              $signed(((wire7 ? wire11 : (8'ha6)) >> {(8'hb4),
                  wire11}))} : $signed(wire7));
    end
  module16 #() modinst64 (.wire17(reg12), .wire18(reg13), .wire20(reg14), .wire19(wire9), .y(wire63), .clk(clk));
  assign wire65 = $unsigned(((^$unsigned($unsigned(reg15))) <= wire11));
  assign wire66 = reg13[(3'h7):(1'h0)];
  assign wire67 = ((~&$signed((|(wire6 ? wire9 : wire11)))) ?
                      wire11 : $unsigned(wire66[(3'h7):(3'h6)]));
  module68 #() modinst102 (wire101, clk, wire11, reg14, reg15, wire9, wire66);
  module103 #() modinst141 (wire140, clk, wire9, reg14, wire10, wire65, wire67);
  assign wire142 = (reg13[(1'h1):(1'h1)] ? (8'hb8) : wire8[(3'h4):(1'h1)]);
  module143 #() modinst166 (.wire146(wire142), .clk(clk), .y(wire165), .wire147(wire63), .wire144(wire7), .wire145(wire11));
endmodule

module module143
#(parameter param164 = (-(~|((^~((7'h43) ? (8'h9c) : (8'hb3))) * ({(8'had)} ? ((7'h41) || (8'hbb)) : ((8'hbe) && (8'hb8)))))))
(y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire147;
  input wire [(4'he):(1'h0)] wire146;
  input wire signed [(4'ha):(1'h0)] wire145;
  input wire signed [(2'h2):(1'h0)] wire144;
  wire [(4'ha):(1'h0)] wire163;
  wire [(4'hc):(1'h0)] wire149;
  wire [(4'he):(1'h0)] wire148;
  reg signed [(5'h15):(1'h0)] reg162 = (1'h0);
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg158 = (1'h0);
  reg [(2'h2):(1'h0)] reg157 = (1'h0);
  reg [(4'he):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg155 = (1'h0);
  reg [(3'h7):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(4'he):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg150 = (1'h0);
  assign y = {wire163,
                 wire149,
                 wire148,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 (1'h0)};
  assign wire148 = $signed((wire144[(1'h1):(1'h0)] - wire145[(3'h4):(1'h1)]));
  assign wire149 = (!({(8'h9f)} ?
                       $signed($unsigned($unsigned(wire148))) : ((^~(wire144 << wire148)) < wire145)));
  always
    @(posedge clk) begin
      reg150 <= $unsigned($unsigned(wire148[(4'hb):(3'h7)]));
      reg151 <= $signed(wire147);
      reg152 <= (wire146 ?
          ((wire148[(2'h2):(1'h0)] >> wire147) && $unsigned(wire146[(4'he):(4'ha)])) : (8'hbb));
    end
  always
    @(posedge clk) begin
      reg153 <= wire145;
      if ({(reg150 ?
              wire147[(1'h0):(1'h0)] : ((&$unsigned(reg151)) ?
                  wire148 : $signed(wire144)))})
        begin
          reg154 <= (^~(wire149[(4'hc):(3'h6)] ~^ ((~^(wire144 <= reg150)) ~^ (^~(wire145 >> wire149)))));
        end
      else
        begin
          if (($signed($unsigned(reg154[(2'h2):(1'h0)])) >> reg150))
            begin
              reg154 <= ((($signed((8'ha5)) ?
                          (8'hbc) : $signed(reg154[(2'h2):(2'h2)])) ?
                      (^~(wire145 << ((8'hb2) ?
                          reg153 : reg152))) : wire148[(3'h4):(2'h2)]) ?
                  $signed((^$unsigned($unsigned(reg151)))) : ($signed(((wire146 ?
                              reg151 : reg153) ?
                          wire145 : (reg150 ? (8'ha6) : wire144))) ?
                      ((~^(wire149 ?
                          wire148 : reg150)) && wire149[(2'h3):(1'h0)]) : reg154[(3'h4):(3'h4)]));
              reg155 <= ((wire149 == $unsigned(reg150[(1'h0):(1'h0)])) ?
                  $unsigned($signed((wire148[(3'h7):(2'h3)] ?
                      (reg153 * reg150) : $signed(reg152)))) : {((&(reg152 ?
                          reg151 : wire148)) <<< {(wire147 ?
                              wire145 : (8'hae))}),
                      wire147});
            end
          else
            begin
              reg154 <= (wire144[(1'h1):(1'h1)] ?
                  (reg154 ?
                      $unsigned(wire147) : (($unsigned(reg150) ?
                              (reg153 != wire148) : (reg150 ?
                                  reg154 : wire147)) ?
                          $unsigned($signed(wire147)) : ($signed(wire146) ?
                              reg151[(4'ha):(2'h2)] : (|reg152)))) : (^~$unsigned(wire146)));
              reg155 <= reg153;
              reg156 <= wire146;
              reg157 <= reg154[(3'h7):(2'h3)];
              reg158 <= ((!$signed(((|(8'hb6)) ?
                      (wire144 ? (8'hbd) : reg156) : (-wire149)))) ?
                  (&reg152) : {$unsigned($unsigned((reg154 ~^ reg154)))});
            end
          reg159 <= (-(!{reg153[(2'h3):(1'h1)], {{wire147, wire147}}}));
          reg160 <= $signed((8'ha6));
        end
      reg161 <= wire149[(4'ha):(1'h0)];
      reg162 <= reg159;
    end
  assign wire163 = wire145;
endmodule

module module103
#(parameter param138 = ({(8'ha2), {(+(^~(8'h9f))), {{(8'haf), (8'ha8)}}}} ^ (~&((((8'ha7) ? (8'hb2) : (8'hb9)) > ((8'haf) ~^ (8'hba))) ? (&{(8'hac)}) : (~(|(8'h9f)))))), 
parameter param139 = (param138 ? {((~param138) ? ((7'h41) ? {param138} : param138) : {(param138 ? param138 : param138)})} : param138))
(y, clk, wire108, wire107, wire106, wire105, wire104);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire108;
  input wire signed [(4'hd):(1'h0)] wire107;
  input wire [(5'h10):(1'h0)] wire106;
  input wire signed [(3'h6):(1'h0)] wire105;
  input wire [(4'hc):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire137;
  wire signed [(3'h7):(1'h0)] wire136;
  wire signed [(3'h7):(1'h0)] wire135;
  wire [(3'h6):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire133;
  wire signed [(2'h3):(1'h0)] wire132;
  wire signed [(5'h11):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire130;
  wire [(3'h4):(1'h0)] wire129;
  wire signed [(4'hf):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire127;
  wire signed [(4'hf):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire124;
  wire [(5'h13):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire118;
  wire signed [(5'h11):(1'h0)] wire117;
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
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
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((((+(wire104[(4'h8):(2'h3)] ^ (wire106 + wire104))) < (wire105[(3'h5):(2'h3)] ~^ {$signed(wire106)})) ?
          (^wire105[(3'h5):(1'h1)]) : ((wire107[(1'h1):(1'h0)] - $unsigned(wire106[(3'h5):(1'h1)])) ?
              $signed(wire105[(2'h3):(2'h2)]) : wire107)))
        begin
          reg109 <= wire106[(1'h0):(1'h0)];
          if ($unsigned(reg109))
            begin
              reg110 <= $unsigned($signed(wire104));
              reg111 <= ({wire106,
                  wire104[(2'h3):(1'h0)]} & $signed($unsigned((wire106[(4'hf):(2'h3)] ?
                  (^wire108) : (reg110 ? reg110 : wire106)))));
            end
          else
            begin
              reg110 <= $signed($signed(wire104));
              reg111 <= (wire104[(4'h8):(4'h8)] != reg111);
            end
          reg112 <= (|$signed((((-wire106) ?
              $signed(wire107) : (wire107 <= reg111)) ~^ reg110)));
          reg113 <= (~(8'hae));
        end
      else
        begin
          reg109 <= {$unsigned((reg109[(2'h2):(1'h0)] || $signed((~&wire107))))};
        end
      reg114 <= reg111;
      reg115 <= (+$unsigned($signed(($signed(reg114) ?
          (reg110 ? reg109 : reg113) : (reg114 ? reg112 : reg113)))));
      reg116 <= (8'ha2);
    end
  assign wire117 = ((-reg115) ? reg116 : (wire106[(1'h0):(1'h0)] != wire107));
  assign wire118 = wire105[(2'h2):(1'h1)];
  assign wire119 = reg112;
  assign wire120 = {{$unsigned((|(!wire117)))}};
  assign wire121 = $unsigned($signed((^$signed($signed((8'hbc))))));
  assign wire122 = (~|$unsigned(reg109[(2'h2):(1'h0)]));
  assign wire123 = $unsigned(reg115[(4'ha):(3'h5)]);
  assign wire124 = wire121;
  assign wire125 = (+wire124);
  assign wire126 = $unsigned($signed((|($unsigned(reg112) >> (wire123 ^~ wire125)))));
  assign wire127 = wire118;
  assign wire128 = $signed($signed(reg109));
  assign wire129 = (8'ha8);
  assign wire130 = $signed((!($unsigned((wire107 ? wire121 : reg115)) ?
                       {(+reg116)} : {$unsigned(wire126), wire121})));
  assign wire131 = wire106[(3'h5):(3'h4)];
  assign wire132 = {$unsigned((((wire124 ?
                               reg110 : reg109) * ((8'ha3) >>> (8'hb2))) ?
                           (!reg115) : ($unsigned(wire106) ?
                               $unsigned(reg113) : (wire119 ?
                                   wire129 : reg113)))),
                       $unsigned((^{$unsigned(wire128)}))};
  assign wire133 = (wire128 + ($signed(wire122[(4'h8):(3'h5)]) == wire124));
  assign wire134 = (^~$signed(wire107[(4'hd):(4'hb)]));
  assign wire135 = ((((|{wire131}) & (!(^wire131))) ?
                           $signed((^~reg111)) : (-(wire105 ?
                               (wire106 ^~ wire104) : $unsigned(wire130)))) ?
                       (-$signed(wire117)) : $signed(wire123));
  assign wire136 = wire123[(5'h13):(3'h7)];
  assign wire137 = reg111;
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire73;
  input wire signed [(4'h8):(1'h0)] wire72;
  input wire [(4'he):(1'h0)] wire71;
  input wire [(3'h7):(1'h0)] wire70;
  input wire signed [(4'hc):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire [(5'h11):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire74;
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire74,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire74 = $signed((-{(wire72[(2'h3):(2'h3)] ?
                          $signed(wire69) : $signed(wire70)),
                      $signed($signed(wire72))}));
  always
    @(posedge clk) begin
      reg75 <= (|$signed((7'h44)));
      reg76 <= (((|{wire72}) ^~ (8'haa)) ?
          ($unsigned(wire70) | {$unsigned((~&wire72))}) : ({wire71} && wire72[(3'h7):(2'h3)]));
      reg77 <= wire72;
      reg78 <= (wire74 != {((~^$signed(reg75)) + ((reg77 ?
              wire70 : wire73) + (^wire72)))});
    end
  assign wire79 = (wire74 ?
                      ((({reg75} < (reg78 && reg77)) ?
                              (~&wire73[(2'h3):(1'h0)]) : $signed($signed(reg78))) ?
                          ($signed(wire69[(3'h6):(3'h6)]) ?
                              (^(wire72 ? wire71 : wire73)) : ({(8'ha0)} ?
                                  $signed(wire69) : wire70)) : reg75) : (~{(wire71[(4'h9):(1'h0)] != $signed(wire73))}));
  assign wire80 = (^(wire69[(3'h4):(1'h0)] & (~&(~(~&reg75)))));
  assign wire81 = $unsigned((wire73 ?
                      reg75 : ($signed($signed(wire71)) ?
                          {wire71[(3'h4):(2'h2)]} : wire71)));
  assign wire82 = (+({$signed($signed((8'haf)))} ?
                      {($unsigned(wire70) << (~wire72)),
                          (~|{wire74, (8'ha3)})} : (~|(~|(wire79 ?
                          wire69 : reg77)))));
  assign wire83 = ((~wire69) ?
                      (($unsigned(wire81) ?
                          (wire70 ?
                              $unsigned(wire69) : $signed(wire72)) : $signed($signed((8'ha7)))) >> $signed(({reg76} == reg76[(1'h1):(1'h1)]))) : (~|$signed({{wire79,
                              reg77}})));
  assign wire84 = ((+$unsigned($unsigned($unsigned((8'hab))))) ?
                      $unsigned((wire83[(4'ha):(3'h6)] ?
                          (((8'ha8) ?
                              wire71 : (8'h9c)) >>> wire82[(4'hc):(3'h4)]) : ({wire83,
                              wire72} >> (~&wire82)))) : (8'hb8));
  assign wire85 = $unsigned(wire84[(4'h8):(4'h8)]);
  assign wire86 = (~&wire82);
  assign wire87 = (^($signed((~^{wire74, reg76})) & reg76));
  assign wire88 = $unsigned($unsigned(wire85[(3'h5):(3'h4)]));
  assign wire89 = $unsigned($unsigned($signed(wire69[(4'hb):(1'h0)])));
  always
    @(posedge clk) begin
      if ($signed((8'hbf)))
        begin
          if ($signed($unsigned($signed(wire79))))
            begin
              reg90 <= (~&$signed(((^~wire79[(1'h0):(1'h0)]) ?
                  ($signed((7'h44)) >> (wire84 + wire69)) : wire74[(4'h9):(1'h1)])));
              reg91 <= {$unsigned({(~{reg78}), wire86}),
                  ($signed($unsigned($signed(wire85))) > {wire80,
                      $signed($signed(wire86))})};
              reg92 <= reg76;
              reg93 <= (wire73[(5'h10):(3'h5)] > (~|wire74));
            end
          else
            begin
              reg90 <= $unsigned({{{wire87, ((8'ha9) ? wire85 : reg75)}}});
              reg91 <= (-wire72);
            end
          reg94 <= wire69;
          reg95 <= (^$unsigned($unsigned((wire88[(3'h6):(3'h5)] ?
              (wire79 ? reg77 : reg90) : (reg92 ? wire79 : wire69)))));
        end
      else
        begin
          reg90 <= {wire89, reg93[(4'h8):(3'h4)]};
          reg91 <= {$unsigned((^~(reg77[(2'h2):(2'h2)] ? reg77 : (|wire83)))),
              reg77[(1'h1):(1'h1)]};
          if ((^~wire87[(1'h1):(1'h0)]))
            begin
              reg92 <= $unsigned($signed(wire86[(3'h4):(2'h3)]));
              reg93 <= (^$signed(wire81[(1'h0):(1'h0)]));
            end
          else
            begin
              reg92 <= reg78[(4'hf):(1'h1)];
              reg93 <= wire70[(1'h1):(1'h0)];
              reg94 <= ($unsigned((wire86 > ((~^wire79) | (wire81 ?
                  reg95 : reg93)))) << ((8'hab) ?
                  {{$signed(wire79)}} : ({wire72[(4'h8):(2'h2)]} == $unsigned((reg94 <<< (8'hb1))))));
              reg95 <= ((8'ha3) ?
                  (~&wire87) : ($unsigned($unsigned(((8'ha5) ?
                      wire85 : wire86))) <<< $signed(wire74[(4'h9):(1'h0)])));
              reg96 <= ($signed(wire88) ?
                  (+$unsigned($unsigned((wire87 ?
                      wire80 : reg76)))) : (~|$signed(wire71[(4'hc):(1'h1)])));
            end
          reg97 <= ($signed($signed($signed($signed((8'hbe))))) ^ (+{{(wire79 ?
                      wire80 : reg75)},
              wire79}));
        end
      reg98 <= ((|$signed((wire88 < wire86[(4'hb):(3'h4)]))) ?
          wire85[(3'h7):(3'h6)] : $signed(reg96[(1'h1):(1'h0)]));
    end
  assign wire99 = $unsigned($unsigned((-(^~(!wire82)))));
  assign wire100 = (~^(-(8'h9d)));
endmodule

module module16
#(parameter param61 = (+(&{(^(&(8'ha6)))})), 
parameter param62 = ((((^((8'hb2) >= param61)) ? ((param61 + param61) ^ ((8'h9d) == (8'ha1))) : {(param61 ? param61 : param61), param61}) << (((~^(8'hb2)) + param61) ? {(param61 < param61)} : ((param61 || param61) ? (param61 >>> param61) : param61))) <= (~|(((+(8'ha6)) != param61) | (~|(param61 && param61))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire43,
                 wire42,
                 wire41,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg22,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= $unsigned(($unsigned(wire17[(2'h3):(1'h0)]) != ({(wire17 ?
                  wire19 : (8'ha3)),
              $unsigned(wire19)} ?
          (wire19[(1'h1):(1'h0)] ? (wire17 >= wire20) : (~^wire18)) : ({wire20,
                  wire17} ?
              $unsigned(wire18) : (^(8'ha9))))));
      reg22 <= wire19;
    end
  assign wire23 = (|$signed($unsigned((-(wire17 ? wire19 : (8'h9f))))));
  assign wire24 = ($signed({wire18, wire19}) ?
                      $unsigned((+wire18[(4'h9):(1'h0)])) : (~^((|$unsigned(wire23)) ?
                          $signed((8'had)) : wire19)));
  assign wire25 = wire17;
  assign wire26 = (((^(~^$unsigned(reg22))) ?
                          (~reg21[(2'h2):(1'h0)]) : wire20) ?
                      $signed(wire18) : $signed(((wire20 ?
                          {wire18} : $unsigned((8'hbc))) | $unsigned((wire24 ?
                          (8'hae) : wire20)))));
  assign wire27 = {$unsigned((~&(wire25[(4'hb):(3'h4)] >>> (wire18 ^ reg21))))};
  assign wire28 = wire19[(3'h6):(3'h5)];
  assign wire29 = $signed($unsigned($unsigned((|wire18))));
  assign wire30 = $unsigned({($signed((+wire24)) + (^(wire17 * wire25))),
                      (~|$signed((^~wire20)))});
  assign wire31 = ((wire26[(5'h11):(1'h1)] ?
                      (8'ha3) : ((reg22 ? $unsigned((8'ha6)) : (~wire17)) ?
                          $signed((-wire19)) : (~reg22[(3'h5):(2'h3)]))) >> $unsigned($signed(wire29)));
  assign wire32 = $unsigned(wire28);
  assign wire33 = (wire27 >= (7'h41));
  assign wire34 = $signed($signed(($unsigned(reg22) | wire32[(4'h8):(1'h0)])));
  assign wire35 = wire17;
  assign wire36 = (wire25[(4'ha):(3'h4)] ?
                      {(~&($unsigned(wire17) && $signed(wire27))),
                          (wire26 ^~ (wire20[(1'h0):(1'h0)] ?
                              (wire19 || wire18) : wire23))} : wire29[(4'h8):(3'h5)]);
  always
    @(posedge clk) begin
      reg37 <= ((wire17 || (wire26 | (wire34 | wire20[(3'h4):(1'h1)]))) < ($signed((~wire31)) + wire29));
      reg38 <= $unsigned({(wire32[(3'h5):(3'h4)] != ((-wire35) ?
              $signed(wire34) : wire26)),
          $signed((^$unsigned(wire19)))});
      reg39 <= ($signed($signed($signed(wire27[(4'hc):(2'h3)]))) << (^~$unsigned(((reg21 ?
              wire18 : wire30) ?
          $signed(wire23) : wire20[(2'h3):(2'h2)]))));
      reg40 <= {(+reg21[(4'hc):(3'h6)]),
          (($signed(wire18[(5'h10):(4'h8)]) ?
                  ($unsigned(wire36) ?
                      (wire33 > wire34) : $signed(wire27)) : (wire23 <<< (wire34 ?
                      wire36 : wire34))) ?
              ((|(wire35 ?
                  wire34 : wire25)) & wire23) : $unsigned(($signed(reg37) ?
                  $unsigned(wire32) : (reg39 ? wire28 : (8'ha6)))))};
    end
  assign wire41 = ($unsigned((wire34[(4'hd):(4'ha)] > {$signed(wire24)})) ~^ {(reg40 * $signed(wire30))});
  assign wire42 = reg40[(1'h0):(1'h0)];
  assign wire43 = $signed({(~&(^(wire20 ? wire23 : reg21))),
                      $signed(reg40[(1'h1):(1'h0)])});
  always
    @(posedge clk) begin
      reg44 <= wire29[(4'he):(4'he)];
      if ({($signed(reg39) ?
              ($unsigned($signed(wire27)) & reg39) : ($unsigned($signed(wire41)) ?
                  reg22 : (~&(wire43 ? (8'hbd) : (8'hae)))))})
        begin
          reg45 <= $signed({{(wire28[(3'h6):(2'h2)] ?
                      $unsigned(wire17) : wire20[(4'h9):(3'h6)]),
                  $unsigned({wire19, wire35})},
              ({wire19} ?
                  (wire33 ?
                      $signed(wire43) : wire24[(1'h1):(1'h0)]) : wire42[(4'hb):(1'h0)])});
          reg46 <= $signed((wire27[(3'h6):(3'h4)] <<< ({$unsigned((8'ha1))} ^ (!(reg22 ?
              wire24 : wire36)))));
          reg47 <= (($signed(reg22) | $signed(reg45[(4'h9):(2'h3)])) < reg22);
          reg48 <= $unsigned(reg40);
          reg49 <= wire41[(1'h0):(1'h0)];
        end
      else
        begin
          if ((wire24 ?
              wire35[(4'hf):(4'h9)] : (($unsigned(reg49) ?
                  $unsigned((wire28 ?
                      wire33 : wire28)) : $signed((reg21 > reg21))) + $unsigned($unsigned({reg46})))))
            begin
              reg45 <= wire29;
              reg46 <= {(reg38 == (((wire41 <= wire28) ?
                      $unsigned((8'hab)) : $unsigned(wire33)) & wire27)),
                  (reg40[(3'h4):(2'h2)] >> $unsigned($unsigned((wire27 ?
                      wire41 : reg39))))};
              reg47 <= reg22[(4'hb):(3'h5)];
            end
          else
            begin
              reg45 <= $unsigned((($unsigned(wire27[(3'h6):(2'h3)]) ?
                  $signed($unsigned(wire29)) : (~^reg49[(2'h2):(2'h2)])) && ((^~((8'had) ^ wire36)) != ($signed(wire35) ?
                  $signed(wire18) : $unsigned(wire18)))));
            end
          if ($signed(reg38[(4'hf):(4'ha)]))
            begin
              reg48 <= $signed((~|(^wire30)));
              reg49 <= (+$unsigned((-$unsigned((~|reg22)))));
              reg50 <= (!(-((&(wire33 ? (8'hb3) : reg44)) ?
                  $signed({reg48}) : ($unsigned((8'hb2)) ?
                      {wire18, reg44} : (reg37 ? wire24 : (8'h9e))))));
              reg51 <= ((($unsigned((wire43 ? wire25 : reg45)) ?
                          $unsigned((reg38 ? wire24 : wire34)) : (&{wire32,
                              reg21})) ?
                      {reg44, {reg22}} : (($unsigned(wire41) ?
                          (~^wire24) : $signed(reg47)) ^ ($signed((8'h9d)) ?
                          (wire27 ? wire28 : wire19) : (~&wire36)))) ?
                  ($unsigned($signed((reg49 >> reg48))) <<< $signed({wire35,
                      $signed(wire18)})) : {(((reg49 ?
                          wire27 : reg21) >>> (~|wire35)) <<< (wire29[(3'h5):(3'h5)] ?
                          (reg40 ? (8'haf) : reg22) : (wire31 + wire35)))});
            end
          else
            begin
              reg48 <= wire23[(1'h1):(1'h0)];
              reg49 <= (8'hb1);
              reg50 <= wire36[(1'h1):(1'h0)];
            end
          if ($unsigned((($signed({wire32,
              (7'h42)}) | reg46) - $unsigned($unsigned($unsigned(wire43))))))
            begin
              reg52 <= (!(wire23 && ((+reg21[(3'h6):(3'h6)]) ?
                  reg47 : $signed((reg22 ? wire35 : reg45)))));
              reg53 <= reg51[(1'h1):(1'h0)];
              reg54 <= $unsigned(reg50);
              reg55 <= $unsigned(reg46[(3'h7):(3'h4)]);
              reg56 <= ((((|reg50) ?
                          (((8'h9f) >= wire33) ?
                              reg40[(3'h4):(2'h3)] : ((7'h40) <= wire32)) : ($signed(wire31) ~^ (wire31 ?
                              (8'h9f) : (7'h44)))) ?
                      reg38[(3'h6):(1'h0)] : wire29[(4'hb):(3'h6)]) ?
                  $signed(wire36[(3'h6):(3'h6)]) : wire19[(3'h4):(2'h3)]);
            end
          else
            begin
              reg52 <= (^reg52[(3'h4):(2'h2)]);
              reg53 <= wire31;
            end
          reg57 <= $signed($signed(((~|wire20[(1'h1):(1'h1)]) * wire20[(2'h3):(2'h2)])));
        end
      reg58 <= {$unsigned($signed({((8'hb2) ? reg22 : (8'hb7))})),
          wire17[(4'ha):(4'h8)]};
    end
  assign wire59 = (~|$unsigned($unsigned($unsigned(((8'ha1) ?
                      (8'hb4) : (8'ha8))))));
  assign wire60 = $signed((~&wire31));
endmodule
