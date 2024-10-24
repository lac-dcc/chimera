module top
#(parameter param178 = ((((((8'ha2) ? (7'h44) : (8'hb0)) ~^ ((8'hbe) ? (8'hb9) : (8'ha3))) ~^ ((8'h9c) ? ((8'hb6) ^~ (7'h43)) : (8'hb2))) == ((|(~^(8'hbf))) | (((8'ha8) ? (8'had) : (8'hb4)) ? ((8'had) ? (8'hb8) : (8'hb3)) : ((8'h9f) * (8'ha8))))) * ({({(8'hb4), (7'h41)} + ((8'hb3) ? (7'h40) : (8'h9c))), (^~((8'hab) || (7'h42)))} ? ((((8'h9f) + (8'ha6)) ? ((8'hb2) ? (7'h44) : (8'hb3)) : ((8'hac) >>> (8'h9e))) != {((8'hab) ^ (8'hb0)), (!(8'hbb))}) : (((~(7'h43)) ? (!(7'h42)) : {(8'haf), (8'hb5)}) ? (8'hb9) : (((8'ha2) + (8'ha9)) ? ((8'hba) & (8'haa)) : (^~(8'hbb)))))), 
parameter param179 = ((-((~|(-param178)) ? param178 : (^(param178 ? param178 : param178)))) ? ({(param178 | (~param178)), (-(param178 ? param178 : param178))} || (8'hba)) : {(~param178)}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire177;
  wire [(4'h8):(1'h0)] wire176;
  wire signed [(5'h14):(1'h0)] wire175;
  wire signed [(3'h7):(1'h0)] wire174;
  wire [(5'h14):(1'h0)] wire173;
  wire [(4'he):(1'h0)] wire172;
  wire signed [(5'h14):(1'h0)] wire170;
  wire signed [(5'h13):(1'h0)] wire169;
  wire [(3'h7):(1'h0)] wire168;
  wire [(4'ha):(1'h0)] wire167;
  wire [(5'h13):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire165;
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire77,
                 wire40,
                 wire39,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire37,
                 wire165,
                 (1'h0)};
  assign wire5 = ($unsigned($unsigned(wire1)) ^ $unsigned($signed(wire4)));
  assign wire6 = $unsigned((8'hb7));
  assign wire7 = wire0;
  assign wire8 = {(wire1 ? $unsigned(wire2[(1'h1):(1'h1)]) : wire0),
                     (wire2 == (~|((wire5 > wire5) ?
                         $unsigned(wire1) : wire2)))};
  assign wire9 = (^~wire2[(3'h4):(2'h3)]);
  module10 #() modinst38 (wire37, clk, wire4, wire0, wire6, wire5, wire7);
  assign wire39 = (wire4[(4'h8):(3'h7)] ?
                      wire37[(2'h2):(1'h1)] : (wire1 ?
                          wire37 : (^~((wire2 || (8'h9c)) ?
                              (-wire0) : $signed(wire5)))));
  assign wire40 = ($signed((wire4 ?
                          {(wire8 - (8'hb2)),
                              (wire5 ? wire8 : wire1)} : (wire7[(4'he):(2'h3)] ?
                              (wire2 ? wire5 : (8'hbe)) : (|wire37)))) ?
                      (8'hba) : wire0);
  module41 #() modinst78 (wire77, clk, wire2, wire4, wire37, wire9, wire3);
  module79 #() modinst166 (.wire83(wire8), .wire81(wire37), .wire84(wire77), .y(wire165), .clk(clk), .wire80(wire6), .wire82(wire5));
  assign wire167 = $unsigned(wire77);
  assign wire168 = (8'ha0);
  assign wire169 = wire2;
  module86 #() modinst171 (wire170, clk, wire7, wire4, wire169, wire6);
  assign wire172 = (wire168[(2'h3):(1'h1)] || $unsigned((!({wire168,
                       (8'h9e)} | $signed(wire9)))));
  assign wire173 = (|{{$signed((wire9 * wire172))}, wire165});
  assign wire174 = wire2;
  assign wire175 = wire2;
  assign wire176 = ($signed(((wire0[(2'h3):(1'h0)] <= (+wire6)) ?
                           wire168 : $signed((wire37 ? wire174 : wire37)))) ?
                       (wire172 ~^ wire40) : ($unsigned((wire174 ?
                           $signed((7'h42)) : (|wire167))) * (wire6 ?
                           (((8'ha3) >> wire1) ^~ $signed((8'ha9))) : $unsigned((-wire175)))));
  assign wire177 = ((-(^$signed($unsigned(wire169)))) ?
                       $signed({$unsigned($unsigned(wire167)),
                           (wire0 ?
                               (wire176 + wire170) : (wire172 ^ wire174))}) : ({({wire0,
                               wire39} ^~ wire5[(4'hf):(4'he)])} << $unsigned($unsigned((&wire168)))));
endmodule

module module79  (y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire84;
  input wire [(4'hc):(1'h0)] wire83;
  input wire [(3'h5):(1'h0)] wire82;
  input wire [(5'h12):(1'h0)] wire81;
  input wire signed [(5'h14):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire164;
  wire [(4'h9):(1'h0)] wire160;
  wire [(4'hb):(1'h0)] wire158;
  wire signed [(3'h7):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire85;
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg161 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  assign y = {wire164,
                 wire160,
                 wire158,
                 wire134,
                 wire133,
                 wire131,
                 wire103,
                 wire102,
                 wire101,
                 wire97,
                 wire85,
                 reg163,
                 reg162,
                 reg161,
                 reg99,
                 reg100,
                 (1'h0)};
  assign wire85 = $unsigned((|wire80));
  module86 #() modinst98 (.clk(clk), .wire88(wire85), .wire90(wire81), .wire89(wire80), .wire87(wire84), .y(wire97));
  always
    @(posedge clk) begin
      reg99 <= $unsigned(wire80);
      reg100 <= wire84[(3'h6):(2'h3)];
    end
  assign wire101 = (~(8'hab));
  assign wire102 = wire85;
  assign wire103 = (~^{$unsigned(wire102[(3'h7):(2'h3)]),
                       {$signed(((7'h40) ? (8'hb9) : wire102))}});
  module104 #() modinst132 (.wire106(wire103), .clk(clk), .y(wire131), .wire107(wire81), .wire105(wire83), .wire109(wire85), .wire108(reg99));
  assign wire133 = (~&($signed((~|(wire131 ? wire85 : wire131))) ?
                       (8'hb3) : (((~|wire103) && {wire97}) * wire85[(3'h6):(3'h5)])));
  assign wire134 = $unsigned((~|wire97[(3'h5):(1'h0)]));
  module135 #() modinst159 (.y(wire158), .wire139(reg100), .wire136(wire85), .clk(clk), .wire137(wire101), .wire138(reg99));
  assign wire160 = wire133[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg161 <= wire101[(2'h2):(1'h1)];
      reg162 <= wire101;
      reg163 <= (((wire158 >= wire160[(2'h2):(2'h2)]) ?
          (wire134[(3'h4):(2'h3)] ?
              (8'haf) : wire160[(2'h2):(2'h2)]) : {wire103}) >> $signed(wire158[(1'h1):(1'h1)]));
    end
  assign wire164 = $signed(($unsigned((|(^~wire158))) ?
                       {(8'had),
                           $signed($signed(wire85))} : (($signed(wire160) ?
                           (|wire85) : (reg163 ?
                               (8'hb3) : wire85)) != $unsigned($signed(reg99)))));
endmodule

module module41
#(parameter param75 = (8'hbe), 
parameter param76 = (^(7'h42)))
(y, clk, wire42, wire43, wire44, wire45, wire46);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire42;
  input wire signed [(5'h12):(1'h0)] wire43;
  input wire signed [(5'h11):(1'h0)] wire44;
  input wire [(4'he):(1'h0)] wire45;
  input wire signed [(4'hf):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(5'h15):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire66;
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire66,
                 (1'h0)};
  module47 #() modinst67 (.y(wire66), .clk(clk), .wire48(wire43), .wire49(wire44), .wire50(wire46), .wire52(wire42), .wire51(wire45));
  assign wire68 = wire44[(5'h11):(3'h7)];
  assign wire69 = wire68[(4'ha):(2'h2)];
  assign wire70 = $signed(wire45);
  assign wire71 = (((+{wire46,
                      wire66[(4'hf):(4'h8)]}) >> {wire66[(5'h11):(4'h9)],
                      $unsigned((8'hb5))}) ^ (^((~&wire68[(3'h5):(3'h4)]) ?
                      ((wire66 ?
                          wire44 : wire45) - (8'h9d)) : wire69[(2'h2):(2'h2)])));
  assign wire72 = ($signed((8'hb1)) ?
                      wire66[(3'h5):(1'h1)] : (&$unsigned($unsigned(wire44[(4'h8):(1'h1)]))));
  assign wire73 = (8'h9c);
  assign wire74 = wire44;
endmodule

module module10
#(parameter param36 = (((~(~|(-(8'h9f)))) ? (({(7'h43), (8'hba)} ? ((8'h9f) && (8'ha7)) : (~(7'h41))) ? (-((8'h9c) ^~ (7'h44))) : (~&(!(8'had)))) : (~&(((8'hbd) <= (8'hbc)) ^~ ((8'hb9) ? (8'ha4) : (8'h9f))))) ? ((&((+(8'hac)) ? (^~(8'h9c)) : ((8'ha4) & (8'hb5)))) ? {((~(8'hbd)) >= (8'haa))} : (~|(((8'hb0) ? (8'hbd) : (8'hae)) >> ((8'ha4) ? (8'ha2) : (8'ha5))))) : (((((8'ha1) ^ (8'hb4)) ? ((8'hbe) <<< (8'hb7)) : (~(8'h9c))) != ((&(8'ha1)) ? (8'ha9) : (-(8'ha4)))) + ((~|((8'ha5) ? (8'ha5) : (8'hb7))) ? (((7'h44) + (8'h9e)) <= (~|(8'hbc))) : (((8'ha7) < (8'hb1)) - (^(8'hbc)))))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire31;
  assign y = {wire35, wire34, wire33, wire31, (1'h0)};
  module16 #() modinst32 (wire31, clk, wire15, wire12, wire13, wire11);
  assign wire33 = $signed($unsigned(wire11));
  assign wire34 = $signed(wire12[(4'hf):(4'ha)]);
  assign wire35 = $signed($unsigned({wire33, wire33[(4'hb):(3'h5)]}));
endmodule

module module16
#(parameter param30 = ((^~{(((8'hb7) ? (8'hb8) : (7'h44)) >= (~(7'h42))), ((!(8'ha8)) ? ((7'h43) - (8'hb5)) : {(8'hb7), (8'ha8)})}) * (|(&(~&(^~(8'ha1)))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire20;
  input wire signed [(4'h8):(1'h0)] wire19;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire [(4'hc):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire21;
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire23,
                 wire22,
                 wire21,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire21 = wire17[(3'h7):(3'h6)];
  assign wire22 = wire20;
  assign wire23 = wire17;
  always
    @(posedge clk) begin
      reg24 <= $unsigned($signed(wire20));
      reg25 <= $signed(wire20[(1'h0):(1'h0)]);
    end
  assign wire26 = $unsigned(wire21[(3'h5):(2'h2)]);
  assign wire27 = (wire23[(1'h1):(1'h0)] ? (~^wire19[(1'h0):(1'h0)]) : wire20);
  assign wire28 = wire17;
  assign wire29 = (wire22[(1'h1):(1'h0)] & $unsigned(wire20));
endmodule

module module47
#(parameter param65 = ((({((8'hb6) ? (7'h40) : (7'h44)), {(8'haf), (8'hb8)}} < (|((8'h9e) && (8'hb0)))) ^~ ((!{(8'ha8), (8'hb4)}) < (((8'ha9) ? (8'h9f) : (8'h9d)) ? (&(8'ha3)) : ((8'hb0) == (8'ha0))))) || (8'h9e)))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire52;
  input wire signed [(4'hb):(1'h0)] wire51;
  input wire signed [(4'he):(1'h0)] wire50;
  input wire [(5'h11):(1'h0)] wire49;
  input wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg53 <= (-wire51[(4'h9):(3'h4)]);
      reg54 <= (8'hb2);
      reg55 <= {$unsigned({$unsigned($signed(wire51)),
              $unsigned($signed(reg53))})};
      reg56 <= {($signed(((~^wire49) && wire48[(4'hf):(4'he)])) && (((!wire51) <= (wire50 ?
              reg53 : wire49)) ~^ (wire52 + wire51)))};
    end
  assign wire57 = reg55;
  assign wire58 = (8'h9c);
  assign wire59 = $unsigned($signed($unsigned((~|$signed(reg55)))));
  assign wire60 = $signed($signed((|(7'h44))));
  assign wire61 = wire52;
  assign wire62 = (reg54 & $unsigned(((~|reg54[(4'h9):(3'h6)]) ^~ {(wire57 ?
                          wire51 : (8'ha9)),
                      {wire58}})));
  assign wire63 = $unsigned($signed(wire59[(3'h4):(2'h2)]));
  assign wire64 = wire62[(3'h5):(2'h2)];
endmodule

module module135
#(parameter param157 = ((((8'hb3) == (+(~^(8'ha1)))) ? {((~&(8'hb0)) ? ((7'h43) ~^ (8'hb0)) : ((8'ha8) <= (8'hb8))), {((8'h9d) > (8'ha5)), ((7'h42) ^~ (8'hbd))}} : (~|({(8'ha6)} ? {(8'hb5), (8'ha8)} : ((8'hbc) ? (8'had) : (8'ha8))))) << {({(^(7'h42)), ((8'hb1) ? (7'h44) : (7'h40))} ? (((7'h42) || (8'hb1)) ? ((8'ha7) ? (8'hab) : (8'hb6)) : ((8'hb9) ? (8'ha4) : (8'ha1))) : ((!(8'ha3)) ^~ ((8'hbd) ^ (7'h40))))}))
(y, clk, wire139, wire138, wire137, wire136);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire139;
  input wire [(2'h2):(1'h0)] wire138;
  input wire [(3'h6):(1'h0)] wire137;
  input wire signed [(5'h13):(1'h0)] wire136;
  wire [(5'h11):(1'h0)] wire156;
  wire signed [(5'h15):(1'h0)] wire155;
  wire signed [(5'h13):(1'h0)] wire154;
  wire signed [(4'hc):(1'h0)] wire153;
  wire signed [(4'ha):(1'h0)] wire152;
  wire [(2'h2):(1'h0)] wire150;
  wire [(3'h6):(1'h0)] wire149;
  wire [(3'h7):(1'h0)] wire141;
  wire signed [(4'hb):(1'h0)] wire140;
  reg [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire150,
                 wire149,
                 wire141,
                 wire140,
                 reg151,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 (1'h0)};
  assign wire140 = {wire136};
  assign wire141 = $signed($unsigned((((wire139 ?
                       (8'hab) : wire138) >> wire138) <= (wire138 | (wire137 ?
                       wire137 : wire138)))));
  always
    @(posedge clk) begin
      reg142 <= (wire140 ?
          $signed($unsigned($unsigned((wire141 ?
              wire141 : (7'h43))))) : (^~$unsigned((wire140[(2'h3):(1'h0)] - (wire138 ?
              wire139 : wire140)))));
      reg143 <= (!wire138);
    end
  always
    @(posedge clk) begin
      if (wire139[(1'h1):(1'h1)])
        begin
          reg144 <= reg143;
        end
      else
        begin
          reg144 <= $signed((wire139 ~^ reg143));
        end
      if (((wire140[(3'h6):(3'h6)] ^ (|{$signed(wire138),
          wire139})) + (~&(|((~&wire139) ?
          wire140[(4'ha):(3'h5)] : wire141[(1'h0):(1'h0)])))))
        begin
          reg145 <= reg144[(2'h2):(1'h1)];
        end
      else
        begin
          reg145 <= reg145[(4'h8):(3'h6)];
          reg146 <= $signed(reg143);
          reg147 <= {wire137};
          reg148 <= $signed((&$signed((+(~|reg143)))));
        end
    end
  assign wire149 = wire136;
  assign wire150 = $signed((reg146[(5'h12):(4'hf)] >> (wire137[(3'h5):(1'h1)] ^ $signed(reg146[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      reg151 <= (8'hae);
    end
  assign wire152 = (reg146[(4'hd):(1'h0)] > {((wire150[(2'h2):(1'h1)] <= $signed((7'h43))) ?
                           ((wire136 ? (8'hac) : reg144) << (reg146 ?
                               wire150 : reg146)) : $signed((wire139 ?
                               reg151 : (8'hae))))});
  assign wire153 = wire149;
  assign wire154 = (~reg151[(2'h2):(1'h0)]);
  assign wire155 = (reg146[(4'hd):(4'h9)] || {$unsigned($signed((~|wire141)))});
  assign wire156 = (wire139 + wire137);
endmodule

module module104
#(parameter param129 = (7'h41), 
parameter param130 = ((&param129) ~^ (~(!(8'hb2)))))
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire109;
  input wire signed [(4'hc):(1'h0)] wire108;
  input wire [(4'ha):(1'h0)] wire107;
  input wire signed [(5'h14):(1'h0)] wire106;
  input wire [(3'h7):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire128;
  wire signed [(4'hb):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire126;
  wire [(4'h8):(1'h0)] wire125;
  wire [(5'h13):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire112;
  wire [(5'h14):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire110;
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(4'he):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire110 = $signed($signed(wire107));
  assign wire111 = $signed(wire106[(5'h13):(5'h10)]);
  assign wire112 = wire105;
  assign wire113 = $signed(wire110);
  assign wire114 = (!(~^{$signed({(8'hb6)}), $unsigned($signed(wire107))}));
  assign wire115 = (+(~&(^~{(^wire111), wire105})));
  assign wire116 = wire110;
  always
    @(posedge clk) begin
      if (wire108)
        begin
          if ((wire114[(1'h0):(1'h0)] == $signed(((wire108 ?
                  (^(8'hbf)) : wire114) ?
              wire114 : ({wire110, wire112} ?
                  $signed((8'hb6)) : $signed(wire115))))))
            begin
              reg117 <= wire115[(1'h0):(1'h0)];
              reg118 <= (~|(wire111[(4'hd):(3'h5)] ?
                  $unsigned($signed(wire106[(4'hb):(4'h8)])) : wire107));
            end
          else
            begin
              reg117 <= (wire115 ^~ (wire115 == wire105));
              reg118 <= (+(+((&$signed((8'hb5))) ?
                  (wire107[(4'h8):(2'h2)] ?
                      $signed(reg117) : (wire113 ?
                          wire111 : wire116)) : ((8'ha9) ^~ $unsigned((8'ha9))))));
            end
          if ($unsigned({((8'hb0) ? wire105 : (~|(~wire108))), wire114}))
            begin
              reg119 <= {reg117, $signed(wire113)};
              reg120 <= ($signed($unsigned({wire108, $unsigned((8'hab))})) ?
                  reg117 : {({$signed(wire111), {reg119}} || wire109)});
              reg121 <= reg118;
              reg122 <= {wire115[(1'h0):(1'h0)]};
            end
          else
            begin
              reg119 <= {(wire106 ?
                      reg122 : $signed(($unsigned(wire105) ?
                          $unsigned(wire106) : {wire110, reg122}))),
                  $unsigned(($unsigned({wire114}) ^ reg122))};
              reg120 <= ((^~($signed((&reg120)) ?
                  (^$signed(wire105)) : wire115)) + $unsigned(wire116));
            end
          reg123 <= $signed((8'hb2));
          reg124 <= reg123[(1'h0):(1'h0)];
        end
      else
        begin
          reg117 <= (reg123[(1'h0):(1'h0)] ?
              $unsigned(reg121[(1'h1):(1'h0)]) : (wire106[(4'hb):(4'hb)] ?
                  ((|$signed(reg122)) ~^ $signed($unsigned(reg119))) : (^~((reg122 ?
                          wire110 : wire114) ?
                      ((8'hab) ? wire111 : wire113) : (wire108 ~^ wire112)))));
          reg118 <= (~&reg120);
          reg119 <= wire112[(3'h6):(2'h2)];
          reg120 <= ((($signed($signed(wire115)) != ($unsigned((8'hae)) > (!(8'h9c)))) ?
              wire106 : ($unsigned(wire115) ?
                  ((&wire112) <<< (reg117 ? (8'ha6) : (8'hab))) : ((reg120 ?
                          wire109 : wire113) ?
                      $signed(wire109) : reg120))) >> wire108);
          reg121 <= (^wire115[(1'h0):(1'h0)]);
        end
    end
  assign wire125 = (!{wire115[(2'h2):(2'h2)],
                       ((7'h44) ? $unsigned($unsigned(reg119)) : (7'h42))});
  assign wire126 = $signed(wire109);
  assign wire127 = (|wire112);
  assign wire128 = $unsigned((reg120 ?
                       ((wire108[(4'hc):(2'h2)] ?
                           wire108 : (wire106 | wire125)) * $unsigned($signed(reg120))) : wire125));
endmodule

module module86
#(parameter param96 = ((8'h9f) ? ({(^~{(8'ha4), (7'h41)}), (^(~|(8'h9f)))} < (!(&(~|(8'hac))))) : ({{(~|(8'hbb)), ((8'hbc) >>> (8'ha9))}, (((8'hb4) ^ (8'hae)) || ((8'had) ? (8'ha6) : (8'ha8)))} != ((((8'hb0) ? (8'h9e) : (8'hb4)) | ((8'hab) <= (8'hbd))) ? ((~|(8'haa)) >= ((8'ha4) > (8'ha7))) : (((8'ha6) || (8'hb6)) ? (-(8'ha2)) : ((8'hbe) ? (8'hb9) : (8'ha1)))))))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire90;
  input wire [(5'h10):(1'h0)] wire89;
  input wire [(4'h9):(1'h0)] wire88;
  input wire signed [(5'h13):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire [(3'h6):(1'h0)] wire92;
  wire signed [(4'h8):(1'h0)] wire91;
  assign y = {wire95, wire94, wire93, wire92, wire91, (1'h0)};
  assign wire91 = (~&wire90[(2'h3):(2'h3)]);
  assign wire92 = wire88;
  assign wire93 = (-((!$unsigned(wire87)) ?
                      $unsigned({wire88}) : (^~(~&$unsigned(wire88)))));
  assign wire94 = {$signed(($signed($unsigned(wire90)) ?
                          wire90 : $signed($signed(wire89))))};
  assign wire95 = ((wire90[(2'h3):(1'h0)] >>> $signed({$unsigned(wire87)})) ?
                      (($unsigned({wire92}) >> (|wire92)) ^~ {wire90[(2'h3):(2'h2)],
                          $signed($signed((8'hb8)))}) : $signed((wire87[(2'h3):(2'h2)] <<< $unsigned(wire89[(4'hb):(3'h4)]))));
endmodule
