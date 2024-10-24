module top
#(parameter param207 = ((-{(!((8'had) >>> (8'ha8)))}) <= {(((8'ha3) | ((8'hb5) <<< (8'ha2))) ? (((8'had) ? (8'ha3) : (8'ha1)) << (8'haf)) : (((8'ha4) | (7'h40)) < (~&(8'hbf))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire206;
  wire [(4'hf):(1'h0)] wire205;
  wire [(5'h13):(1'h0)] wire204;
  wire [(5'h10):(1'h0)] wire203;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire192;
  reg [(5'h15):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg200 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg199 = (1'h0);
  reg [(5'h14):(1'h0)] reg198 = (1'h0);
  reg [(4'h8):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg196 = (1'h0);
  reg [(5'h12):(1'h0)] reg195 = (1'h0);
  reg [(3'h7):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire5,
                 wire6,
                 wire7,
                 wire52,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire192,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg54,
                 reg55,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = wire4;
  assign wire7 = ({wire5[(3'h5):(3'h5)]} ^ $unsigned((&$unsigned(((8'ha9) & wire6)))));
  module8 #() modinst53 (.wire10(wire1), .wire9(wire6), .clk(clk), .wire12(wire5), .wire11(wire3), .y(wire52));
  always
    @(posedge clk) begin
      reg54 <= wire3[(4'hf):(2'h3)];
      reg55 <= wire0[(3'h7):(3'h6)];
    end
  assign wire56 = wire7[(4'h8):(3'h4)];
  assign wire57 = (~|wire52[(4'hb):(4'ha)]);
  assign wire58 = ($unsigned((!((wire56 ?
                          wire0 : wire2) ^ $unsigned(wire56)))) ?
                      wire5[(5'h13):(4'hf)] : ($signed((~|$signed(wire52))) ?
                          (wire2 ?
                              wire5[(4'h9):(2'h2)] : (!(|wire57))) : wire3));
  assign wire59 = wire52;
  module60 #() modinst193 (.clk(clk), .y(wire192), .wire64(reg54), .wire61(wire3), .wire62(wire57), .wire63(wire7));
  always
    @(posedge clk) begin
      reg194 <= (!wire52);
      if ((wire56[(1'h0):(1'h0)] ?
          (wire57[(4'ha):(1'h1)] ?
              ($signed((reg194 ? (8'hae) : wire3)) | ($unsigned(wire1) ?
                  (wire5 ? (8'hab) : wire3) : {reg54,
                      wire3})) : $unsigned(wire58[(4'h9):(3'h6)])) : (^~$unsigned((wire0[(4'hc):(4'ha)] >> $unsigned(wire59))))))
        begin
          reg195 <= wire57;
          reg196 <= {wire1};
        end
      else
        begin
          if ($signed($unsigned(wire52[(4'h8):(3'h4)])))
            begin
              reg195 <= {{((wire7 == $unsigned((8'ha7))) & wire0[(4'h9):(1'h1)]),
                      ((wire3 || ((8'hb8) ?
                          reg196 : wire58)) <<< ($unsigned(wire192) ?
                          (~&wire56) : (reg55 ? reg55 : wire7)))}};
              reg196 <= $unsigned((reg194 ?
                  (+($signed(wire7) ?
                      {wire56, wire192} : $signed((8'ha2)))) : ((wire6 ?
                          $unsigned(reg195) : (~&reg196)) ?
                      (~|$signed(wire1)) : $signed(wire7[(4'hd):(3'h7)]))));
              reg197 <= $unsigned((^~{reg195}));
              reg198 <= $unsigned($unsigned($unsigned($unsigned(((7'h43) ?
                  wire6 : wire3)))));
            end
          else
            begin
              reg195 <= (($signed($signed($signed((8'hbe)))) ?
                  (~(-(^~wire1))) : $unsigned($signed((~&wire5)))) << (~^($signed((reg198 << wire56)) ?
                  $unsigned((^~wire3)) : reg198)));
              reg196 <= (~&(((^{wire6, wire4}) ?
                      $unsigned((wire56 * wire52)) : (wire58[(3'h5):(1'h1)] ?
                          $unsigned((8'hb3)) : (wire0 ? (8'hb5) : wire1))) ?
                  $signed(reg196) : reg194[(3'h4):(1'h1)]));
            end
          reg199 <= wire56[(1'h1):(1'h1)];
          reg200 <= ((8'ha9) ~^ $signed(wire56));
          reg201 <= $signed(reg197);
          reg202 <= (wire1 ?
              $unsigned($signed($signed({reg55}))) : $signed((|(((8'ha5) * reg201) & (wire52 ~^ wire4)))));
        end
    end
  assign wire203 = (reg194[(3'h6):(3'h5)] ?
                       $signed(reg54) : $signed((((~wire192) ^~ $unsigned(wire2)) ~^ $signed((reg194 >>> wire5)))));
  assign wire204 = $signed((($signed($signed(reg201)) | wire4) != $signed(wire2[(1'h0):(1'h0)])));
  assign wire205 = reg55[(3'h7):(3'h4)];
  assign wire206 = wire59[(1'h0):(1'h0)];
endmodule

module module60  (y, clk, wire61, wire62, wire63, wire64);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire61;
  input wire [(5'h15):(1'h0)] wire62;
  input wire signed [(5'h15):(1'h0)] wire63;
  input wire signed [(3'h4):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire191;
  wire [(4'he):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire126;
  wire [(4'he):(1'h0)] wire128;
  wire [(2'h3):(1'h0)] wire129;
  wire signed [(3'h7):(1'h0)] wire130;
  wire signed [(4'hd):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire189;
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  assign y = {wire191,
                 wire65,
                 wire66,
                 wire67,
                 wire119,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire126,
                 wire128,
                 wire129,
                 wire130,
                 wire131,
                 wire189,
                 reg127,
                 (1'h0)};
  assign wire65 = {wire64[(2'h3):(2'h3)],
                      (&({$unsigned((8'hb1))} ?
                          (((8'h9c) * wire61) ?
                              $signed(wire62) : {wire64,
                                  wire61}) : $signed((wire62 << (8'ha6)))))};
  assign wire66 = (|wire64);
  assign wire67 = wire64;
  module68 #() modinst120 (.wire70(wire65), .wire69(wire63), .wire72(wire66), .y(wire119), .clk(clk), .wire71(wire67));
  assign wire121 = wire61[(4'he):(4'h9)];
  assign wire122 = (^wire62[(5'h13):(1'h0)]);
  assign wire123 = wire63[(4'hd):(4'h8)];
  assign wire124 = {((($unsigned(wire64) ?
                               wire121[(2'h2):(1'h0)] : (wire123 ?
                                   (8'hab) : wire122)) == $unsigned((wire63 ?
                               wire67 : wire65))) ?
                           wire67[(2'h2):(1'h1)] : {$signed((wire119 * wire67)),
                               wire119})};
  assign wire125 = $signed(wire123[(5'h10):(4'hb)]);
  assign wire126 = wire62;
  always
    @(posedge clk) begin
      reg127 <= wire124[(3'h5):(2'h3)];
    end
  assign wire128 = wire121[(3'h5):(3'h4)];
  assign wire129 = (((wire61[(4'h9):(1'h1)] ?
                               (+$unsigned(wire123)) : wire128[(1'h0):(1'h0)]) ?
                           $signed(wire126[(3'h7):(3'h6)]) : $unsigned(((wire64 ?
                               wire64 : wire66) == wire65[(1'h0):(1'h0)]))) ?
                       wire124[(2'h2):(1'h1)] : wire64[(2'h2):(2'h2)]);
  assign wire130 = wire125;
  assign wire131 = $signed($unsigned({$signed((wire67 ? wire67 : wire121)),
                       (8'hb1)}));
  module132 #() modinst190 (.wire135(wire119), .wire133(wire65), .wire137(wire62), .wire134(wire121), .y(wire189), .clk(clk), .wire136(wire128));
  assign wire191 = wire62;
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire13;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 (1'h0)};
  assign wire13 = $signed(wire9[(1'h1):(1'h0)]);
  assign wire14 = ((8'ha8) >= ((&wire12[(4'ha):(4'ha)]) ?
                      {wire11[(5'h11):(5'h11)]} : wire12[(4'ha):(3'h7)]));
  assign wire15 = ((8'hbf) ? (8'hb5) : $signed(wire11[(3'h5):(2'h2)]));
  assign wire16 = wire15;
  assign wire17 = (($signed($signed($unsigned((8'ha1)))) ?
                          $signed(($signed(wire12) | $signed(wire13))) : wire11) ?
                      $signed($unsigned($unsigned($unsigned(wire14)))) : ($signed(wire11[(3'h7):(3'h6)]) ?
                          $signed((|$unsigned(wire16))) : (wire16[(3'h6):(3'h6)] ?
                              wire10[(1'h1):(1'h0)] : $unsigned((wire9 ?
                                  wire13 : wire12)))));
  module18 #() modinst45 (.y(wire44), .wire19(wire11), .wire20(wire15), .wire22(wire9), .clk(clk), .wire21(wire17));
  assign wire46 = $signed((((~|wire16) ? {(8'ha4)} : (~&wire10)) ?
                      $signed($signed((~&wire10))) : $signed(($unsigned(wire11) && wire15[(3'h7):(1'h1)]))));
  assign wire47 = $signed(wire11);
  assign wire48 = $unsigned(wire14[(1'h1):(1'h0)]);
  assign wire49 = $unsigned($unsigned({((wire14 | wire11) ?
                          $unsigned(wire10) : wire9)}));
  assign wire50 = wire11;
  assign wire51 = (&(^$signed((((8'had) != wire14) ?
                      ((8'hb7) >>> wire15) : (~&(7'h43))))));
endmodule

module module18
#(parameter param43 = ((|(({(7'h44)} & {(8'hbe)}) < (~(~&(8'haa))))) ? {({((8'hbf) << (7'h42)), (~&(8'hbc))} ? ((~^(8'hb2)) + ((8'had) >= (8'h9f))) : (~|((8'ha6) ? (8'ha0) : (8'ha5)))), (((8'h9e) ~^ ((7'h40) >> (8'hb9))) >>> (((8'ha5) ? (8'hb2) : (7'h42)) ? ((8'hbd) ? (8'ha4) : (8'had)) : ((7'h42) ? (8'hbb) : (7'h42))))} : ((8'hbc) ? ((((8'ha6) << (8'ha3)) ^~ ((8'ha1) < (8'hae))) == (~(~|(8'haa)))) : {(((8'ha1) ? (8'ha4) : (8'ha5)) >> (&(8'hb7)))})))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire22;
  input wire signed [(3'h5):(1'h0)] wire21;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire23;
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire23,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = wire19[(4'hd):(4'hc)];
  always
    @(posedge clk) begin
      if ({wire19[(4'h8):(1'h0)]})
        begin
          reg24 <= wire23;
          reg25 <= wire20;
        end
      else
        begin
          reg24 <= $unsigned((~&(wire22 - {(~(8'ha4))})));
          reg25 <= reg25;
          reg26 <= wire19[(5'h10):(4'ha)];
          reg27 <= reg26;
        end
      if ((reg25 > wire22[(3'h7):(3'h7)]))
        begin
          reg28 <= wire19;
          reg29 <= $unsigned({wire19, (|$signed($unsigned(reg27)))});
        end
      else
        begin
          reg28 <= (^~$signed({(8'ha9)}));
        end
      if ($unsigned(reg26[(3'h6):(3'h4)]))
        begin
          if ((wire23 ?
              $signed(reg27[(3'h5):(1'h1)]) : $signed((reg28 ?
                  $unsigned(wire22[(1'h1):(1'h0)]) : ((reg25 == reg27) | {reg26})))))
            begin
              reg30 <= ((8'hbb) & (wire22 > (&{(|(8'ha5))})));
              reg31 <= reg26;
            end
          else
            begin
              reg30 <= wire19[(4'hc):(3'h7)];
              reg31 <= $signed(reg29[(4'hc):(4'ha)]);
              reg32 <= $unsigned(reg24);
              reg33 <= ($signed($signed((|$signed(reg30)))) < (-wire20));
            end
          reg34 <= ($unsigned((8'ha9)) ?
              $unsigned(wire21[(3'h4):(1'h0)]) : $unsigned(((wire19 | $signed(reg24)) >> $unsigned(reg25[(2'h2):(1'h0)]))));
          reg35 <= $signed((({$unsigned(reg26)} ? (8'hbe) : (^~reg34)) ?
              reg29[(3'h4):(1'h1)] : $unsigned(reg29[(2'h2):(1'h0)])));
        end
      else
        begin
          reg30 <= $signed({$unsigned({$unsigned(wire20),
                  (reg24 ? reg33 : reg34)}),
              $unsigned(wire23[(4'h9):(3'h4)])});
        end
    end
  assign wire36 = $signed(((~^(reg28[(4'h8):(3'h4)] ^~ $unsigned(wire20))) ~^ reg29[(1'h1):(1'h0)]));
  assign wire37 = reg24;
  assign wire38 = reg24;
  assign wire39 = ($unsigned(reg32[(1'h1):(1'h0)]) ^~ (7'h41));
  assign wire40 = {(~{(-reg32[(2'h3):(1'h1)])}),
                      (~^$signed(reg27[(4'he):(4'hd)]))};
  assign wire41 = ($signed(wire38[(4'h9):(2'h3)]) * wire36[(2'h3):(1'h0)]);
  assign wire42 = wire36;
endmodule

module module132
#(parameter param188 = (+(((((8'hb0) ? (8'ha1) : (8'ha2)) >> ((8'h9f) ? (8'haa) : (7'h44))) ? (^((8'haf) != (7'h42))) : (((8'h9d) + (8'hb0)) ? ((8'hb4) ? (8'h9e) : (8'haf)) : ((8'hbe) ? (8'h9f) : (7'h43)))) ? (8'ha2) : (((!(7'h44)) ? (~^(8'h9e)) : ((8'hbf) <<< (8'haf))) - (~|((7'h42) ? (8'hb3) : (8'hac)))))))
(y, clk, wire137, wire136, wire135, wire134, wire133);
  output wire [(32'h255):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire137;
  input wire [(4'he):(1'h0)] wire136;
  input wire [(2'h3):(1'h0)] wire135;
  input wire [(3'h5):(1'h0)] wire134;
  input wire [(4'he):(1'h0)] wire133;
  wire [(4'hc):(1'h0)] wire187;
  wire signed [(3'h4):(1'h0)] wire176;
  wire signed [(5'h11):(1'h0)] wire175;
  wire [(5'h13):(1'h0)] wire174;
  wire [(5'h14):(1'h0)] wire173;
  wire [(4'hf):(1'h0)] wire172;
  wire signed [(5'h11):(1'h0)] wire171;
  wire [(3'h5):(1'h0)] wire155;
  wire signed [(2'h2):(1'h0)] wire154;
  wire signed [(4'ha):(1'h0)] wire153;
  wire [(2'h2):(1'h0)] wire152;
  wire signed [(5'h11):(1'h0)] wire151;
  wire signed [(5'h13):(1'h0)] wire150;
  wire signed [(4'he):(1'h0)] wire149;
  wire [(5'h14):(1'h0)] wire148;
  wire [(4'h9):(1'h0)] wire147;
  wire [(5'h11):(1'h0)] wire145;
  wire signed [(4'ha):(1'h0)] wire144;
  reg [(5'h13):(1'h0)] reg186 = (1'h0);
  reg [(4'h8):(1'h0)] reg185 = (1'h0);
  reg [(4'h9):(1'h0)] reg184 = (1'h0);
  reg [(4'hd):(1'h0)] reg183 = (1'h0);
  reg [(4'hd):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg181 = (1'h0);
  reg signed [(4'he):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg178 = (1'h0);
  reg [(5'h11):(1'h0)] reg177 = (1'h0);
  reg [(4'hd):(1'h0)] reg170 = (1'h0);
  reg [(2'h3):(1'h0)] reg169 = (1'h0);
  reg signed [(4'he):(1'h0)] reg168 = (1'h0);
  reg [(3'h6):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(4'ha):(1'h0)] reg165 = (1'h0);
  reg [(4'he):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg161 = (1'h0);
  reg [(4'hd):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(4'he):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  reg [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg138 = (1'h0);
  assign y = {wire187,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire145,
                 wire144,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg146,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg138 <= $unsigned(((wire135[(1'h1):(1'h0)] ?
          (~|wire135[(2'h2):(1'h1)]) : (~wire135)) <= wire134));
      if (wire136[(1'h0):(1'h0)])
        begin
          if ((((($signed(wire135) ^~ (^wire136)) ?
                  ($unsigned(wire134) ?
                      $unsigned(reg138) : wire134[(3'h4):(1'h0)]) : wire137[(3'h6):(3'h4)]) << (wire136[(4'ha):(4'ha)] & (^~(reg138 ?
                  wire134 : wire137)))) ?
              (~$signed($signed((wire135 ?
                  reg138 : (8'hb3))))) : wire137[(4'hc):(3'h7)]))
            begin
              reg139 <= {(+((~&{wire137}) && wire133)),
                  ($signed(((~wire137) ?
                      (wire136 <= wire134) : wire133[(4'h9):(3'h7)])) <= wire133)};
              reg140 <= $unsigned($unsigned($signed({(~&wire136)})));
            end
          else
            begin
              reg139 <= reg139;
              reg140 <= {(8'ha0)};
              reg141 <= $signed((({wire135,
                  (wire137 ?
                      reg139 : reg139)} - reg140) << (+$unsigned(reg139))));
              reg142 <= ($signed((~|$unsigned((wire133 ? (8'ha4) : wire135)))) ?
                  ((wire134[(1'h0):(1'h0)] & {(wire134 ? wire135 : (7'h44))}) ?
                      ((~&(^~reg139)) <= ((~wire133) ?
                          wire134 : wire135)) : (!(reg138 & $signed(wire136)))) : $signed((reg140[(4'hb):(3'h4)] ?
                      (reg139 ?
                          $unsigned((8'hbb)) : (^~wire136)) : $signed((wire137 >> wire134)))));
            end
          reg143 <= $signed((wire136[(4'h9):(3'h4)] * wire136));
        end
      else
        begin
          reg139 <= (~reg141[(2'h2):(2'h2)]);
          reg140 <= wire136;
          reg141 <= $signed(reg142[(3'h6):(3'h5)]);
        end
    end
  assign wire144 = reg138[(3'h5):(2'h3)];
  assign wire145 = (wire136[(4'hd):(3'h6)] ?
                       $unsigned(reg138[(1'h0):(1'h0)]) : (~|$signed(reg141[(4'h9):(2'h3)])));
  always
    @(posedge clk) begin
      reg146 <= ($signed($unsigned(wire135[(1'h1):(1'h0)])) <<< wire137);
    end
  assign wire147 = $signed(($unsigned(reg140[(3'h7):(3'h4)]) ?
                       (~|$unsigned($unsigned(wire136))) : {(~&(wire144 ?
                               wire134 : wire137)),
                           (reg146 << wire133[(4'hb):(3'h7)])}));
  assign wire148 = $signed(($signed(((reg146 + wire145) ^~ $unsigned((8'ha7)))) ?
                       (({(8'ha7)} >= (~reg140)) ?
                           ((&reg146) >= $signed(wire144)) : (^(reg143 ?
                               (8'hb9) : (8'hba)))) : (-$signed((^reg138)))));
  assign wire149 = wire145[(2'h3):(2'h3)];
  assign wire150 = wire134;
  assign wire151 = $unsigned(wire145[(3'h7):(1'h0)]);
  assign wire152 = (wire150 ?
                       wire145[(2'h2):(1'h1)] : (wire150 ?
                           ((wire136[(4'hb):(1'h0)] ?
                                   (reg143 ? reg146 : (7'h42)) : (8'hb6)) ?
                               $unsigned(wire147) : wire147[(2'h2):(1'h1)]) : reg140[(4'h9):(2'h3)]));
  assign wire153 = $signed($signed($unsigned($signed({reg138, wire136}))));
  assign wire154 = wire150;
  assign wire155 = (^~wire136);
  always
    @(posedge clk) begin
      if ((($signed((8'hb5)) ?
              $unsigned($signed(wire151[(4'h9):(3'h4)])) : (-$signed(wire133))) ?
          (^~(wire148[(5'h11):(3'h6)] ?
              (^(8'hb6)) : reg139)) : {(+(~(wire135 >> (8'hb6)))),
              $signed(reg142[(3'h5):(3'h4)])}))
        begin
          reg156 <= (^((wire152 ^ {(!reg141)}) >> wire135));
          reg157 <= (((wire155 ?
                  (+wire137[(4'hb):(1'h1)]) : wire135) || ((wire135 ?
                      $unsigned(wire144) : $unsigned(wire155)) ?
                  ((~^wire135) ? $signed(wire149) : (^~reg143)) : wire145)) ?
              wire145[(1'h1):(1'h1)] : ($unsigned($unsigned((8'ha7))) ?
                  $unsigned(reg140[(1'h0):(1'h0)]) : (8'hb8)));
          if (reg157)
            begin
              reg158 <= reg143;
              reg159 <= $signed($signed((reg156[(4'hd):(3'h5)] <<< {(wire135 | wire137)})));
            end
          else
            begin
              reg158 <= (^~(reg146 ?
                  (~^$signed((reg146 > wire151))) : $signed(((~&reg159) != wire133))));
              reg159 <= (wire135 | ((^~$signed(reg139[(2'h2):(1'h1)])) ?
                  reg142[(2'h2):(1'h0)] : (~|((^~reg159) != (&reg159)))));
              reg160 <= $unsigned(((wire135[(2'h3):(2'h3)] | $unsigned(wire149)) > $signed($signed(wire153[(4'ha):(3'h4)]))));
              reg161 <= (&($signed(((wire145 ^ reg140) ?
                  ((8'ha6) & reg142) : (^reg140))) < $unsigned(reg142[(3'h4):(1'h1)])));
            end
          if (((8'hb8) ?
              {(^($unsigned(wire133) ~^ wire148)),
                  ($signed($unsigned((8'hbd))) - wire149[(3'h5):(1'h1)])} : (8'h9f)))
            begin
              reg162 <= ($unsigned($unsigned({{(8'hbb), reg140},
                      $unsigned(wire154)})) ?
                  ($unsigned($unsigned({(8'hb4), reg140})) ?
                      reg159 : wire148) : ({($signed(reg143) ?
                              $unsigned(reg159) : $signed((8'hb6)))} ?
                      (^~(8'hac)) : reg157));
              reg163 <= ((~|wire152) >>> $unsigned($unsigned(wire133[(3'h7):(1'h1)])));
              reg164 <= $signed($signed(reg157));
            end
          else
            begin
              reg162 <= wire151;
              reg163 <= $unsigned(wire153[(3'h5):(2'h2)]);
              reg164 <= $unsigned($unsigned(($signed($unsigned((7'h40))) - $unsigned(reg156))));
            end
          reg165 <= (^wire133[(3'h7):(2'h2)]);
        end
      else
        begin
          reg156 <= $signed({reg158[(2'h2):(1'h1)]});
          reg157 <= {($signed((+(reg160 ?
                  wire145 : reg159))) & $unsigned({(wire134 < reg158)}))};
          reg158 <= wire144;
          reg159 <= reg160[(4'h9):(4'h9)];
        end
      if (reg139)
        begin
          reg166 <= (~&$unsigned(($signed(((8'hac) ?
              reg142 : reg164)) < reg160)));
          reg167 <= ((&(^($signed(wire148) ? reg156 : {reg163}))) ?
              wire149[(4'hb):(1'h1)] : (~(|wire153[(4'ha):(2'h2)])));
          if ((($unsigned((reg164[(3'h4):(2'h2)] ^ wire150)) || $signed((8'hba))) >= (!(wire154 + $signed(reg142)))))
            begin
              reg168 <= (wire133 < $signed(((|reg165[(3'h6):(3'h5)]) >> (8'hbf))));
            end
          else
            begin
              reg168 <= $unsigned($signed(reg159[(4'h9):(2'h2)]));
              reg169 <= $signed((reg143[(3'h4):(1'h1)] ?
                  (~^(reg159[(3'h5):(1'h0)] ?
                      {reg168,
                          wire153} : (reg167 < wire149))) : ({$unsigned(reg141)} || wire155)));
            end
          reg170 <= ($unsigned((-(+reg158[(3'h5):(1'h1)]))) >>> (&$signed($signed({reg139,
              reg165}))));
        end
      else
        begin
          reg166 <= ((8'had) ^ reg163[(3'h5):(1'h1)]);
          reg167 <= (reg166 <= wire147);
          reg168 <= $unsigned(wire155);
        end
    end
  assign wire171 = reg163[(1'h0):(1'h0)];
  assign wire172 = $unsigned($signed((^~{$signed(wire155),
                       ((8'h9c) + wire133)})));
  assign wire173 = ((wire144 >= $unsigned(((reg165 ?
                           reg169 : wire153) >> wire152[(1'h0):(1'h0)]))) ?
                       (~|(reg157[(4'ha):(3'h6)] ?
                           ($unsigned(reg158) ?
                               (wire153 * reg168) : ((8'hb1) ?
                                   reg166 : reg156)) : ($signed((8'h9f)) ~^ (wire145 - (8'hb7))))) : {(&(8'ha7))});
  assign wire174 = (^~reg163);
  assign wire175 = reg162;
  assign wire176 = reg142;
  always
    @(posedge clk) begin
      reg177 <= wire135;
      if ((wire155 ~^ (((|(&reg139)) ?
              $unsigned($unsigned(wire147)) : wire144) ?
          (&wire174) : $signed({{reg141, reg170}, (^reg177)}))))
        begin
          if (reg161[(3'h4):(2'h2)])
            begin
              reg178 <= wire149[(4'hc):(2'h2)];
            end
          else
            begin
              reg178 <= $signed((|$unsigned(((wire172 ? wire153 : (8'h9c)) ?
                  $unsigned(reg178) : (^(8'had))))));
              reg179 <= (($signed((&$unsigned(wire144))) ^ $unsigned($unsigned($unsigned(wire176)))) >>> reg138[(4'h9):(1'h1)]);
              reg180 <= wire134[(3'h5):(3'h4)];
            end
          reg181 <= (~({reg141} ? (~|reg139[(3'h6):(3'h6)]) : wire147));
          reg182 <= ($unsigned((~(wire134 << (&reg146)))) ?
              $unsigned(wire136[(3'h4):(1'h0)]) : $unsigned({{$unsigned(wire135),
                      reg143[(1'h0):(1'h0)]},
                  reg177[(3'h4):(1'h1)]}));
        end
      else
        begin
          reg178 <= {(wire171[(4'h9):(3'h5)] * ((^$unsigned(wire147)) ?
                  {(~^wire152)} : (reg167 ^ $unsigned(reg163)))),
              reg161[(1'h1):(1'h0)]};
        end
      reg183 <= $signed($unsigned(reg163[(3'h4):(2'h3)]));
      if ((+reg162))
        begin
          reg184 <= $unsigned(wire174[(4'h9):(1'h1)]);
        end
      else
        begin
          reg184 <= $unsigned($signed((!$unsigned($unsigned((7'h41))))));
          reg185 <= {reg158, reg181[(4'hd):(1'h0)]};
          reg186 <= (~|reg164[(4'he):(4'hc)]);
        end
    end
  assign wire187 = $signed($signed(($unsigned((^~(8'h9e))) ?
                       (~^(wire150 | wire134)) : (|reg166[(2'h2):(1'h1)]))));
endmodule

module module68  (y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h243):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire72;
  input wire signed [(2'h3):(1'h0)] wire71;
  input wire signed [(3'h7):(1'h0)] wire70;
  input wire [(4'hf):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire118;
  wire signed [(5'h15):(1'h0)] wire117;
  wire signed [(4'h8):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire101,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
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
                 reg104,
                 reg103,
                 reg102,
                 reg100,
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
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire73 = $unsigned(($signed(wire69) == wire69[(4'h9):(4'h8)]));
  assign wire74 = ($unsigned((8'ha0)) ^~ $signed(({wire69} ^~ (~|$unsigned((8'h9f))))));
  assign wire75 = $signed($unsigned(wire71[(1'h1):(1'h0)]));
  assign wire76 = {$unsigned(wire70)};
  always
    @(posedge clk) begin
      reg77 <= wire74;
      reg78 <= wire71[(1'h0):(1'h0)];
    end
  assign wire79 = {((wire75[(4'hb):(3'h5)] ?
                          $unsigned((^reg78)) : ($unsigned(wire71) ?
                              wire74 : $unsigned((8'ha9)))) >> $signed(((wire73 ?
                              wire70 : wire75) ?
                          (reg78 >= wire71) : $signed(wire69)))),
                      (~^(wire71 && {wire72}))};
  assign wire80 = wire74[(2'h2):(2'h2)];
  assign wire81 = $signed(wire73);
  assign wire82 = ($unsigned(wire71) ?
                      ($unsigned({(wire76 & wire76)}) - wire72) : (wire75[(4'hf):(3'h5)] ?
                          ({$unsigned(wire75), $unsigned(reg77)} ?
                              $unsigned(wire74) : {(|wire74)}) : (|{$unsigned(wire69),
                              $signed((8'hab))})));
  always
    @(posedge clk) begin
      if (wire69[(3'h6):(2'h2)])
        begin
          if ((wire71[(2'h3):(2'h3)] ?
              $unsigned((wire73[(3'h5):(1'h1)] ?
                  $unsigned((reg77 & reg77)) : ((+wire80) | (wire79 ?
                      wire75 : wire72)))) : (wire73 ?
                  wire81[(4'h8):(3'h4)] : reg77)))
            begin
              reg83 <= (&(wire73[(1'h0):(1'h0)] ?
                  wire71[(2'h3):(2'h2)] : $signed(wire76[(4'hf):(4'hc)])));
              reg84 <= (^~$signed(wire76));
            end
          else
            begin
              reg83 <= wire74;
              reg84 <= $unsigned(($signed(((-wire72) ?
                      (wire82 ? wire81 : (8'hb7)) : (wire80 != wire71))) ?
                  (($unsigned(wire70) | reg84) ~^ wire70) : (reg83[(4'ha):(3'h4)] < wire80)));
              reg85 <= $signed(wire69);
              reg86 <= wire70;
            end
          if (reg78[(3'h5):(2'h3)])
            begin
              reg87 <= (~^reg83);
              reg88 <= ((8'had) ? wire81 : wire71);
              reg89 <= reg83[(1'h0):(1'h0)];
              reg90 <= $signed($signed(reg77));
            end
          else
            begin
              reg87 <= $signed($unsigned($unsigned($signed((reg87 ?
                  (8'h9c) : reg90)))));
            end
          reg91 <= wire79[(4'h9):(2'h3)];
          if ($unsigned(reg90))
            begin
              reg92 <= reg83[(3'h6):(3'h5)];
              reg93 <= $unsigned($signed((wire72[(2'h2):(1'h1)] | (-$unsigned(wire76)))));
              reg94 <= ($unsigned(wire81[(3'h6):(2'h2)]) ?
                  $unsigned((|(reg77[(2'h3):(1'h0)] ?
                      {wire75,
                          wire82} : (reg92 || (8'hb5))))) : $signed((reg85[(4'hf):(4'hb)] ^~ wire69)));
              reg95 <= (-$signed((~|(wire74 << reg90[(3'h5):(1'h1)]))));
            end
          else
            begin
              reg92 <= $signed((+{reg89, {$unsigned(wire80)}}));
              reg93 <= reg93;
              reg94 <= $unsigned((!($signed($signed(wire80)) ?
                  $unsigned($signed(reg87)) : ($signed((8'ha4)) <= $unsigned((8'ha3))))));
              reg95 <= $signed((7'h42));
              reg96 <= (~^reg88);
            end
          reg97 <= (wire72[(3'h5):(2'h3)] || $unsigned((({(8'ha7)} * (wire79 || reg92)) == $signed((reg95 ?
              (8'ha2) : (8'hb4))))));
        end
      else
        begin
          reg83 <= (((~|((wire82 | reg83) >= (!reg77))) ?
              ((~&(^~reg83)) != ($unsigned((8'hb8)) & wire81)) : {reg93,
                  wire75}) & reg84[(2'h2):(1'h0)]);
          reg84 <= (wire72[(1'h0):(1'h0)] ?
              (wire79[(3'h6):(1'h0)] & {($unsigned(reg95) ?
                      {(8'h9f)} : reg88[(4'hf):(1'h1)]),
                  reg94[(2'h3):(2'h2)]}) : {(-$unsigned(reg85[(1'h0):(1'h0)])),
                  (wire79 || $signed($unsigned(reg90)))});
        end
      reg98 <= (8'ha8);
      reg99 <= ($signed(wire82[(1'h0):(1'h0)]) ?
          {($signed(reg83[(4'h8):(1'h0)]) ?
                  $unsigned($signed(wire72)) : (|(reg97 ^ wire73)))} : $unsigned($unsigned(reg96)));
      reg100 <= wire75[(3'h6):(3'h4)];
    end
  assign wire101 = (~&wire72[(3'h5):(1'h0)]);
  always
    @(posedge clk) begin
      reg102 <= ({(((8'hbc) ^ (8'ha4)) ?
                  (&(reg87 ? wire74 : reg83)) : $signed((reg77 == reg91))),
              $unsigned($signed((-wire81)))} ?
          wire71[(2'h3):(1'h1)] : (+$unsigned(($unsigned(reg95) ?
              ((8'ha5) ? wire72 : (8'h9d)) : $unsigned(wire73)))));
      if (reg90)
        begin
          reg103 <= (~&reg95);
          reg104 <= ($unsigned(($signed(((8'ha9) >> reg95)) ?
                  $signed($unsigned(wire75)) : $unsigned($signed(reg99)))) ?
              ($unsigned($unsigned(reg103)) ?
                  {((reg83 ? wire101 : reg94) ^ (reg92 ?
                          reg103 : (8'hab)))} : ($unsigned((^~reg78)) ?
                      ($unsigned(reg96) > ((8'ha1) || (8'hb6))) : reg97)) : (-(&(8'ha4))));
          reg105 <= $unsigned((reg90[(4'h8):(2'h3)] <<< reg85));
          reg106 <= $unsigned(($signed(reg98) ?
              ($signed((~^reg78)) ~^ $unsigned((reg87 >> wire81))) : (((~reg78) ?
                  wire72 : (~|wire71)) | {{reg85}, (wire101 && wire76)})));
        end
      else
        begin
          if (reg77[(1'h0):(1'h0)])
            begin
              reg103 <= {$unsigned(((-(reg88 ? reg97 : (8'ha6))) ?
                      reg88 : (reg91 ? {wire73} : (reg84 ? reg90 : (8'hb8)))))};
              reg104 <= {(reg98 ?
                      (8'hb5) : (((~&reg88) ^~ wire101[(2'h3):(1'h1)]) >>> ((^wire75) ?
                          (-reg89) : (8'ha8))))};
              reg105 <= $unsigned($unsigned($unsigned((reg94[(1'h1):(1'h0)] | reg91))));
              reg106 <= (($unsigned(wire69[(4'hf):(4'hf)]) | {(~&(|wire74)),
                  $unsigned($signed((8'hab)))}) < ($signed((reg83 && reg96)) >> (($signed(reg89) | {reg92,
                  reg97}) && reg103)));
              reg107 <= reg95[(2'h2):(1'h1)];
            end
          else
            begin
              reg103 <= wire74[(3'h4):(1'h0)];
            end
          if ({(+((wire71[(1'h0):(1'h0)] ?
                  $unsigned(reg77) : (reg91 <= reg96)) <<< $unsigned($signed(reg77)))),
              {($signed((|reg102)) >>> ($signed(reg92) && $unsigned(reg91)))}})
            begin
              reg108 <= $unsigned($unsigned($unsigned(wire74[(4'h8):(2'h3)])));
            end
          else
            begin
              reg108 <= (-((8'hb4) - (reg102 >= reg83[(5'h11):(3'h6)])));
              reg109 <= (~({((reg104 ~^ reg95) | wire74),
                      wire79[(3'h7):(1'h1)]} ?
                  (~|(&$unsigned(reg107))) : (-(!reg105[(3'h6):(1'h0)]))));
              reg110 <= (^({reg87} + ((!$signed((8'hbc))) ?
                  $signed(reg92) : (reg91 ?
                      reg90[(3'h5):(1'h0)] : reg93[(2'h2):(2'h2)]))));
              reg111 <= ((+reg110[(1'h0):(1'h0)]) - {$signed(wire73[(3'h4):(1'h0)]),
                  $signed((8'h9f))});
              reg112 <= ($unsigned(reg102[(2'h3):(2'h3)]) ?
                  $signed(wire71) : wire79[(5'h13):(4'ha)]);
            end
          reg113 <= $signed(reg105);
          reg114 <= $unsigned(($unsigned(wire71) << reg95[(1'h0):(1'h0)]));
          reg115 <= (8'hbe);
        end
      if ((|reg77))
        begin
          reg116 <= reg95[(1'h1):(1'h0)];
        end
      else
        begin
          reg116 <= ($unsigned(reg116[(1'h1):(1'h0)]) ?
              ((($unsigned(reg98) != (wire75 ?
                  reg97 : reg92)) >> wire74[(2'h2):(1'h1)]) <= ((~&(reg107 ?
                  (8'ha5) : reg110)) >= (((8'haa) - wire101) ?
                  reg84[(1'h0):(1'h0)] : (wire81 ?
                      (8'ha9) : reg107)))) : $signed(reg91[(4'ha):(1'h1)]));
        end
    end
  assign wire117 = reg97[(1'h1):(1'h1)];
  assign wire118 = (((+reg86[(3'h4):(1'h0)]) ?
                           $signed((reg103 ?
                               reg103[(4'h8):(3'h6)] : $unsigned(reg116))) : {({reg94} ?
                                   (&(8'h9c)) : (&(7'h43)))}) ?
                       reg98[(3'h5):(2'h2)] : reg84);
endmodule
