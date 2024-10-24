module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire186;
  wire [(5'h10):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire181;
  wire [(4'he):(1'h0)] wire179;
  wire signed [(4'hb):(1'h0)] wire178;
  wire signed [(4'he):(1'h0)] wire176;
  wire [(5'h12):(1'h0)] wire175;
  wire signed [(5'h15):(1'h0)] wire174;
  wire signed [(5'h12):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire172;
  wire signed [(4'hd):(1'h0)] wire184;
  assign y = {wire186,
                 wire182,
                 wire181,
                 wire179,
                 wire178,
                 wire176,
                 wire175,
                 wire174,
                 wire110,
                 wire112,
                 wire172,
                 wire184,
                 (1'h0)};
  module4 #() modinst111 (wire110, clk, wire0, wire1, wire3, wire2);
  assign wire112 = wire3;
  module113 #() modinst173 (.wire117(wire2), .wire116(wire112), .y(wire172), .wire115(wire0), .wire118(wire110), .clk(clk), .wire114(wire1));
  assign wire174 = wire110[(4'h9):(1'h1)];
  assign wire175 = wire3;
  module11 #() modinst177 (.y(wire176), .clk(clk), .wire15(wire174), .wire13(wire0), .wire12(wire112), .wire14(wire175));
  assign wire178 = ((^$unsigned($signed(wire2))) ?
                       wire3 : ((8'hb3) ?
                           (((wire174 ?
                               wire176 : wire110) | $signed(wire112)) > $signed({wire112,
                               wire0})) : {wire1[(5'h15):(4'hd)],
                               ((8'ha5) ^ (~&wire112))}));
  module11 #() modinst180 (.wire13(wire176), .clk(clk), .wire12(wire172), .wire15(wire0), .y(wire179), .wire14(wire175));
  assign wire181 = $signed($signed(({$signed(wire0)} ?
                       ($signed(wire172) << (8'ha9)) : $signed((&(8'hbe))))));
  module113 #() modinst183 (.wire118(wire181), .wire115(wire178), .wire116(wire1), .wire117(wire2), .clk(clk), .wire114(wire0), .y(wire182));
  module52 #() modinst185 (.y(wire184), .wire56(wire112), .clk(clk), .wire54(wire3), .wire53(wire110), .wire55(wire176), .wire57(wire0));
  assign wire186 = $signed((~{($signed(wire181) * wire2),
                       wire2[(5'h12):(4'ha)]}));
endmodule

module module113
#(parameter param170 = {((~|((8'h9d) ? ((8'hbb) - (8'h9d)) : (8'ha2))) ? (+({(8'hbc), (8'ha8)} ? ((8'hbd) <<< (8'hb2)) : ((8'hae) ? (8'hbd) : (8'ha0)))) : {(|((8'hab) & (8'ha3))), (((8'hba) ? (8'ha9) : (8'ha2)) ? (8'ha3) : {(8'hb4), (8'hb1)})})}, 
parameter param171 = (((((param170 ? param170 : (8'ha3)) ? param170 : {param170, param170}) | (~^param170)) ? {(^~(param170 | param170))} : ((+param170) ? {(-param170), param170} : (^(param170 ? param170 : param170)))) ? ((((!param170) ^ (-param170)) ? (^((8'haf) <<< param170)) : ((^~(8'ha6)) ? (param170 <= param170) : (param170 ^~ (7'h44)))) <<< ((^~{param170}) != (param170 ? (param170 ~^ (8'hae)) : (param170 ? param170 : param170)))) : {(+((param170 ? param170 : param170) ? param170 : param170))}))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire118;
  input wire [(5'h13):(1'h0)] wire117;
  input wire [(3'h6):(1'h0)] wire116;
  input wire [(4'hb):(1'h0)] wire115;
  input wire signed [(5'h12):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire154;
  wire [(5'h13):(1'h0)] wire153;
  wire signed [(4'hc):(1'h0)] wire145;
  wire [(5'h12):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire119;
  reg [(2'h2):(1'h0)] reg169 = (1'h0);
  reg [(4'hf):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(3'h4):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(3'h5):(1'h0)] reg162 = (1'h0);
  reg [(5'h12):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg160 = (1'h0);
  reg [(4'he):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg157 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(5'h14):(1'h0)] reg152 = (1'h0);
  reg [(4'hb):(1'h0)] reg151 = (1'h0);
  reg [(4'hb):(1'h0)] reg150 = (1'h0);
  reg [(4'h9):(1'h0)] reg149 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg146 = (1'h0);
  reg [(4'hc):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(4'hc):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(5'h10):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg138 = (1'h0);
  reg [(5'h13):(1'h0)] reg137 = (1'h0);
  reg [(2'h3):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire145,
                 wire120,
                 wire119,
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
                 reg155,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire119 = $unsigned((wire116 ?
                       ((^~((8'hbe) ?
                           wire115 : wire115)) >> (~&$unsigned(wire115))) : $unsigned(((wire118 ?
                           wire114 : wire115) ^~ $signed((8'h9c))))));
  assign wire120 = ((+{wire117[(2'h2):(1'h0)],
                       $unsigned($unsigned(wire118))}) < wire119[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      if ((~&(((8'ha2) ?
          wire114[(4'h8):(3'h4)] : ($signed(wire114) | (|wire116))) << wire114[(4'hc):(4'hc)])))
        begin
          reg121 <= {$signed(wire116[(1'h0):(1'h0)]),
              {(^wire120[(1'h0):(1'h0)]),
                  ($signed((wire119 ? wire117 : wire115)) ?
                      wire115[(4'ha):(3'h6)] : wire118[(3'h6):(3'h4)])}};
          reg122 <= $unsigned((~^wire118));
        end
      else
        begin
          reg121 <= wire115;
          reg122 <= wire119[(4'h8):(3'h5)];
          reg123 <= $signed($unsigned(wire119[(3'h4):(1'h0)]));
        end
      reg124 <= wire114[(1'h0):(1'h0)];
      if (({wire119[(4'h8):(1'h1)]} || reg122[(2'h2):(2'h2)]))
        begin
          reg125 <= (|wire114[(2'h3):(2'h2)]);
          reg126 <= (wire117[(4'hb):(1'h1)] || (reg123[(2'h2):(1'h0)] != (+$signed(reg124[(2'h3):(1'h1)]))));
        end
      else
        begin
          reg125 <= (($signed($unsigned((&wire120))) ~^ reg123[(2'h2):(1'h0)]) == $signed({wire118}));
          reg126 <= $signed({$unsigned((8'hb2)),
              ($unsigned((^wire116)) ?
                  wire116[(2'h3):(2'h2)] : ((reg121 ?
                      wire117 : wire114) >>> (~&wire115)))});
        end
    end
  always
    @(posedge clk) begin
      if (((^reg124) * (wire120 ?
          wire115 : (reg125 ?
              (wire119 + reg121[(3'h4):(2'h3)]) : (~|(wire116 ?
                  reg125 : reg125))))))
        begin
          reg127 <= (($signed(wire116[(3'h4):(1'h0)]) || wire116) ?
              wire120 : reg122[(3'h7):(3'h5)]);
          reg128 <= (reg121[(1'h0):(1'h0)] ?
              wire119 : $signed($signed((reg122 ?
                  (+wire119) : $unsigned(wire120)))));
        end
      else
        begin
          reg127 <= $signed(wire114[(1'h1):(1'h0)]);
          if ($signed(({(reg128[(2'h2):(2'h2)] - wire115)} ?
              $unsigned(({wire115} | wire117[(3'h4):(2'h3)])) : reg122[(4'hb):(4'hb)])))
            begin
              reg128 <= $signed({(|reg123[(1'h1):(1'h1)]),
                  {($unsigned((8'ha0)) ?
                          reg121[(3'h6):(2'h3)] : (wire117 <= (8'h9e))),
                      wire116[(1'h1):(1'h0)]}});
              reg129 <= wire115;
              reg130 <= (^{reg123, (!(&(wire119 ? reg124 : wire116)))});
              reg131 <= $signed(((((!reg125) || (wire116 | reg125)) <<< (~|wire116[(2'h2):(1'h0)])) < (8'ha2)));
            end
          else
            begin
              reg128 <= $signed(({(+$signed(reg123)),
                  (~$signed(reg126))} <= {reg128[(3'h5):(1'h0)],
                  ({reg125} ^ (wire115 ? (8'ha3) : wire119))}));
              reg129 <= $signed({(8'hbb)});
            end
          if (wire120[(1'h1):(1'h0)])
            begin
              reg132 <= ($signed((~((reg125 ^ wire117) <<< (|wire116)))) ?
                  ($signed($signed((reg123 ? wire120 : wire117))) ?
                      (&$unsigned((reg121 + reg126))) : $signed((8'hba))) : $unsigned(({{reg125},
                      $unsigned(wire119)} >> $signed((wire116 ?
                      reg127 : reg129)))));
            end
          else
            begin
              reg132 <= $signed((|reg131));
            end
          reg133 <= $signed(reg126[(1'h0):(1'h0)]);
          reg134 <= $signed($unsigned(({((8'hbf) > wire116)} ?
              $unsigned(reg128[(3'h4):(1'h1)]) : ($signed(reg122) ?
                  (wire120 == (8'hba)) : $unsigned(reg128)))));
        end
      reg135 <= reg130[(2'h2):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg136 <= (~&$unsigned((~^wire114)));
      if ($signed(reg135[(3'h5):(2'h3)]))
        begin
          reg137 <= reg121;
          reg138 <= (&$unsigned((~(&reg128[(4'h9):(3'h5)]))));
          if ((!wire115))
            begin
              reg139 <= ((reg135 + ({reg128} ?
                      $unsigned((&reg127)) : $unsigned(reg122))) ?
                  (~^($unsigned((|reg138)) ?
                      ((wire115 >= (7'h40)) ?
                          reg134[(2'h3):(1'h0)] : (reg124 ?
                              wire116 : reg134)) : (wire117 == reg130[(2'h2):(2'h2)]))) : ((reg121[(1'h1):(1'h0)] ?
                      reg123[(1'h1):(1'h1)] : reg138) | (((reg127 * reg126) >= $signed(reg124)) ?
                      (reg123[(1'h1):(1'h0)] + reg131[(3'h4):(2'h2)]) : (^(|reg133)))));
              reg140 <= ((reg122[(4'hc):(3'h7)] >= $signed($unsigned(reg132[(2'h3):(2'h3)]))) ?
                  (^~$signed((8'ha1))) : (~$unsigned((reg137 << reg136))));
              reg141 <= (($unsigned(reg129[(3'h4):(1'h0)]) > (((-(8'hae)) >>> reg126) ?
                      (+$signed((8'ha3))) : $signed((reg133 ?
                          reg133 : reg131)))) ?
                  ((~&reg140[(3'h5):(1'h0)]) ?
                      ($unsigned(reg122[(1'h0):(1'h0)]) != $signed((~&reg135))) : wire115[(3'h6):(3'h6)]) : reg131);
            end
          else
            begin
              reg139 <= wire118;
              reg140 <= (8'hac);
              reg141 <= reg130[(1'h0):(1'h0)];
              reg142 <= (((wire119 <= reg136[(1'h0):(1'h0)]) != (-$signed(reg130[(1'h0):(1'h0)]))) == (((reg128 <= reg124) >> reg138[(1'h0):(1'h0)]) + ((!$unsigned((8'h9f))) ?
                  $signed(reg140) : (^~(reg122 || reg130)))));
              reg143 <= reg123[(1'h1):(1'h1)];
            end
          reg144 <= ($unsigned((^~(reg128 ~^ (8'ha3)))) ?
              reg127 : ($signed({{wire116, reg142}}) ?
                  $unsigned(((8'hb1) && (reg129 ^~ reg138))) : $unsigned($unsigned(reg132))));
        end
      else
        begin
          reg137 <= reg125[(4'h8):(2'h2)];
        end
    end
  assign wire145 = (^{{reg124, $unsigned((reg132 != reg131))}});
  always
    @(posedge clk) begin
      reg146 <= $unsigned((!reg132[(2'h3):(2'h2)]));
      reg147 <= wire115[(1'h1):(1'h0)];
      reg148 <= wire119;
      if (($signed(((&(wire116 <<< wire145)) ?
              reg131[(3'h4):(2'h2)] : $signed(reg132))) ?
          $unsigned($unsigned(reg147)) : reg147))
        begin
          reg149 <= (((~&(8'ha7)) << ((|reg135[(4'hd):(4'ha)]) ?
              $unsigned((8'haf)) : {$unsigned(reg132),
                  reg138[(1'h1):(1'h0)]})) - $signed(reg139[(3'h6):(2'h3)]));
          reg150 <= $signed(reg148);
          reg151 <= reg134[(2'h2):(1'h0)];
        end
      else
        begin
          reg149 <= $signed({$unsigned({$signed(wire145), $unsigned(reg146)}),
              reg121});
          reg150 <= (($unsigned(($unsigned(reg127) ?
              (reg138 ?
                  reg123 : reg140) : (reg125 >> reg139))) && wire119[(4'h9):(1'h0)]) != reg137);
          reg151 <= (($unsigned(reg146) > (reg139[(1'h0):(1'h0)] ?
                  wire115 : reg132[(4'h8):(1'h1)])) ?
              {reg144[(4'h8):(3'h7)], reg141[(1'h0):(1'h0)]} : (8'hb7));
          reg152 <= $signed($unsigned($unsigned((&$unsigned(reg144)))));
        end
    end
  assign wire153 = ({((^$unsigned(reg133)) != reg127[(3'h4):(2'h3)]),
                       reg143} ^~ {reg130[(1'h1):(1'h0)]});
  assign wire154 = reg121;
  always
    @(posedge clk) begin
      if (({{$signed(reg122), reg123[(1'h0):(1'h0)]}} ?
          reg137 : $signed((~^(~^{wire118})))))
        begin
          reg155 <= reg146;
        end
      else
        begin
          if (reg143[(4'hf):(4'he)])
            begin
              reg155 <= $signed((-(8'hb6)));
              reg156 <= $unsigned(($unsigned(reg136) ?
                  $unsigned(reg148[(3'h6):(2'h2)]) : reg135));
              reg157 <= (wire114[(5'h12):(4'ha)] ?
                  (~|(~^(^~(!(8'hb9))))) : $unsigned($signed((~&(reg126 <= reg138)))));
              reg158 <= $unsigned(reg122[(4'ha):(2'h2)]);
            end
          else
            begin
              reg155 <= reg142;
              reg156 <= reg134[(2'h3):(1'h0)];
              reg157 <= $signed($signed((~$signed($signed(reg144)))));
              reg158 <= $unsigned((~^(((reg125 ? reg141 : (8'hb4)) ?
                      $signed(reg143) : (reg148 ? wire154 : (8'hb9))) ?
                  ((reg155 >> (8'hb3)) <= (8'ha5)) : (~^$unsigned(reg157)))));
              reg159 <= (($signed($unsigned($unsigned(reg124))) ?
                  (wire153 && (&$signed(reg124))) : (^wire114)) >> $unsigned($unsigned($signed({reg157,
                  wire145}))));
            end
          if ($signed((~reg140)))
            begin
              reg160 <= ($signed($signed(($unsigned(reg123) <<< (^~reg139)))) ?
                  reg157 : reg158);
              reg161 <= ((^~(reg149 > reg134)) > wire145);
              reg162 <= $signed({(+wire154[(4'hb):(3'h4)])});
              reg163 <= $signed(wire120[(3'h5):(2'h2)]);
              reg164 <= reg148[(3'h5):(2'h3)];
            end
          else
            begin
              reg160 <= ($unsigned($signed(reg151[(2'h2):(2'h2)])) >> $unsigned({(&{(8'hb6)})}));
              reg161 <= $signed(reg130[(2'h2):(1'h0)]);
            end
          reg165 <= (((((^(7'h40)) ^ $unsigned(reg142)) ?
                      (reg141[(4'h8):(3'h4)] >>> $unsigned(reg130)) : reg128) ?
                  $signed($signed($signed(reg139))) : (wire154[(3'h5):(1'h0)] + $unsigned((reg141 ?
                      reg137 : (8'hba))))) ?
              reg122 : (~$unsigned((((8'hb0) ? (8'hbe) : reg141) ?
                  (reg129 ? reg146 : reg133) : (reg124 ? wire118 : reg134)))));
          reg166 <= reg122[(3'h6):(2'h2)];
        end
      reg167 <= reg163;
      reg168 <= (!({{(reg122 >> reg130), (reg152 == reg134)},
              {(reg136 ? (8'ha9) : (8'hba)), reg142}} ?
          (-(~|reg135[(3'h4):(2'h2)])) : (!($signed((8'hb0)) >>> wire115))));
      reg169 <= reg129;
    end
endmodule

module module4
#(parameter param108 = {(8'hab)}, 
parameter param109 = param108)
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire5;
  input wire [(5'h11):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire78;
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  assign y = {wire107,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire99,
                 wire81,
                 wire80,
                 wire9,
                 wire10,
                 wire49,
                 wire51,
                 wire78,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire9 = (wire7[(5'h11):(4'he)] & {(~^$signed({wire5, (8'hb0)}))});
  assign wire10 = {(wire6 ?
                          (+wire5[(3'h5):(3'h5)]) : {wire7[(5'h10):(1'h0)],
                              $signed((wire7 ? wire5 : wire5))})};
  module11 #() modinst50 (wire49, clk, wire7, wire9, wire8, wire6);
  assign wire51 = (!(~$signed($signed($signed(wire9)))));
  module52 #() modinst79 (wire78, clk, wire7, wire5, wire51, wire9, wire6);
  assign wire80 = wire7[(4'he):(2'h2)];
  assign wire81 = $signed($signed($unsigned({wire78[(1'h0):(1'h0)],
                      ((8'hb0) ? wire6 : wire49)})));
  module82 #() modinst100 (.y(wire99), .wire83(wire81), .wire85(wire6), .wire86(wire10), .clk(clk), .wire84(wire49));
  assign wire101 = $signed(wire6);
  assign wire102 = $unsigned($signed((+wire7)));
  assign wire103 = wire49;
  assign wire104 = $signed(((wire9 ?
                       $unsigned((|wire7)) : (~$unsigned(wire49))) || ({((8'hb9) ?
                           wire78 : wire5)} >>> ($signed((8'hbd)) ?
                       ((8'ha0) ? wire80 : (7'h42)) : (~&(8'ha9))))));
  always
    @(posedge clk) begin
      reg105 <= wire81;
      reg106 <= $unsigned(((wire101 < wire49) ~^ ({(|wire6),
              (wire102 > wire8)} ?
          (wire8[(3'h4):(1'h0)] & wire51[(2'h2):(1'h0)]) : {$unsigned(wire101)})));
    end
  assign wire107 = ((|$signed(((^~wire5) && (8'hbf)))) - (~&(&wire99)));
endmodule

module module82  (y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire86;
  input wire [(4'ha):(1'h0)] wire85;
  input wire [(5'h12):(1'h0)] wire84;
  input wire [(5'h14):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire98;
  wire [(4'h8):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire87;
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire87 = wire84[(1'h1):(1'h0)];
  assign wire88 = wire87;
  assign wire89 = wire88;
  assign wire90 = $signed(((8'ha9) || (-wire89)));
  assign wire91 = (((+{(wire86 <= wire86)}) ?
                          (~|{(wire89 ^ wire90)}) : ((wire83[(3'h7):(3'h4)] ?
                                  {wire87} : wire83[(3'h6):(1'h1)]) ?
                              (+wire83) : ((wire85 == wire86) != wire83[(4'hb):(4'hb)]))) ?
                      ($unsigned(wire83[(4'h9):(3'h4)]) * $unsigned(wire83[(4'h8):(2'h3)])) : (($unsigned((wire89 ?
                              wire87 : wire84)) ~^ $unsigned((wire90 >>> (8'hbd)))) ?
                          $unsigned({wire85}) : $signed(($unsigned((8'hb5)) ?
                              wire84[(4'hc):(4'hc)] : $signed(wire84)))));
  always
    @(posedge clk) begin
      reg92 <= wire90;
      reg93 <= (~((($unsigned((8'ha9)) ?
          wire90 : {wire88}) + $unsigned((wire91 > (8'ha9)))) << ((~&wire88[(2'h3):(2'h3)]) ?
          wire85[(2'h2):(1'h0)] : wire90)));
    end
  assign wire94 = $unsigned((((^wire91[(4'hf):(4'he)]) ?
                          wire85[(4'h8):(3'h7)] : $unsigned(((8'hae) ^~ wire87))) ?
                      $signed(wire91) : ({(wire85 >>> wire83),
                              reg93[(4'hc):(3'h6)]} ?
                          (!{wire89}) : $signed((wire83 ? wire86 : (8'ha0))))));
  assign wire95 = {(+$signed(($unsigned(reg93) ?
                          ((8'h9e) >= wire91) : reg92[(3'h4):(3'h4)])))};
  assign wire96 = $signed({((^$signed(reg92)) * reg93)});
  assign wire97 = wire87;
  assign wire98 = $unsigned($signed({(&{(8'ha2)}),
                      {(wire83 ^~ wire95), (^wire83)}}));
endmodule

module module52
#(parameter param77 = ((&(((~&(8'hb4)) ^ ((8'hab) > (8'ha7))) < ((~&(8'hbf)) <<< (!(8'haa))))) >> {({((8'ha9) ? (8'hb2) : (8'ha2))} != (((8'hb8) ? (8'hb1) : (7'h40)) ? ((8'hb8) ? (8'ha8) : (8'hbe)) : ((8'hbf) ^ (7'h44))))}))
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire57;
  input wire [(4'h9):(1'h0)] wire56;
  input wire [(4'h9):(1'h0)] wire55;
  input wire signed [(3'h5):(1'h0)] wire54;
  input wire signed [(4'ha):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(3'h7):(1'h0)] wire58;
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire58 = $signed(wire55);
  assign wire59 = ($signed($unsigned($signed(((8'had) ?
                      wire54 : wire53)))) + wire58[(3'h4):(2'h2)]);
  assign wire60 = (wire59 && (~&{(^~((8'hb5) ? wire53 : (8'hb9)))}));
  assign wire61 = (8'ha6);
  assign wire62 = wire61[(3'h4):(1'h1)];
  assign wire63 = wire57;
  assign wire64 = $unsigned((~^(wire56 ? wire54 : $signed(wire61))));
  always
    @(posedge clk) begin
      reg65 <= wire64;
      if (wire63)
        begin
          if ({(wire59 ?
                  $unsigned(wire60) : ($signed($signed((8'h9f))) || $unsigned(wire60))),
              {(~|$signed((wire63 - wire60))), (7'h41)}})
            begin
              reg66 <= (($signed(wire54[(3'h4):(2'h3)]) | {$unsigned((wire62 ?
                      reg65 : wire56))}) - wire57);
              reg67 <= {$signed(wire53[(3'h5):(2'h2)])};
              reg68 <= wire63;
            end
          else
            begin
              reg66 <= $unsigned((($unsigned((reg66 || reg67)) ?
                      wire60[(4'ha):(4'h8)] : reg65[(3'h6):(2'h2)]) ?
                  $unsigned((!$unsigned(wire59))) : wire54));
              reg67 <= $unsigned(((reg67[(3'h5):(1'h0)] >>> ({wire63,
                      (8'hbf)} || wire64[(4'hb):(4'hb)])) ?
                  (8'hb5) : $signed((~(wire58 < reg68)))));
              reg68 <= wire63;
            end
        end
      else
        begin
          reg66 <= $unsigned(wire57);
          reg67 <= ($unsigned({$signed((wire53 ? reg65 : reg67)),
              (8'hba)}) - wire64);
        end
      reg69 <= (wire64 >>> (wire58 ? reg68 : reg65));
      reg70 <= wire61[(3'h4):(3'h4)];
      reg71 <= wire53[(2'h3):(1'h0)];
    end
  assign wire72 = ($signed((|(wire63 & (~|wire54)))) ?
                      $unsigned(reg65[(4'hc):(3'h5)]) : (^~$signed(((!wire59) && (wire56 >> wire55)))));
  assign wire73 = (({((wire58 ? wire55 : wire58) | (|wire53))} ?
                          $unsigned((-$unsigned(wire58))) : $unsigned($unsigned((wire55 ?
                              (7'h44) : wire58)))) ?
                      reg65[(5'h11):(4'h8)] : ((~|(-$signed(reg66))) ?
                          reg66 : ($unsigned(reg68[(2'h3):(1'h0)]) ?
                              $signed(((8'ha3) && wire64)) : $unsigned({reg65}))));
  assign wire74 = $unsigned((&(^(!$unsigned((8'ha4))))));
  assign wire75 = {$unsigned((-reg68))};
  assign wire76 = $signed(($unsigned((wire73[(4'hf):(3'h6)] & {wire60,
                      wire56})) && ($signed(wire53) > (8'haa))));
endmodule

module module11
#(parameter param47 = (^~(-({((8'hb9) ? (8'hba) : (8'ha4))} ? ((~^(8'hbc)) ? ((8'haa) ? (8'hb0) : (8'hbb)) : (~|(8'ha3))) : ((!(8'hb4)) ? ((8'hb4) ? (8'hba) : (8'hb8)) : ((8'ha5) << (8'ha2)))))), 
parameter param48 = param47)
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire30;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire16;
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire18,
                 wire17,
                 wire16,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire16 = wire15;
  assign wire17 = ($unsigned({(~^$signed(wire15)),
                          ({wire16, wire15} ?
                              wire14 : (wire16 ? wire16 : wire16))}) ?
                      {($signed((wire16 * wire16)) && ($unsigned(wire16) | $unsigned(wire16)))} : (~|(wire12 ^ wire15)));
  assign wire18 = ((~|($signed((^wire13)) || (((8'hbf) <= (8'hb1)) ?
                      $unsigned(wire16) : $unsigned(wire16)))) - wire15);
  always
    @(posedge clk) begin
      reg19 <= wire16[(3'h7):(2'h2)];
      reg20 <= {(({{wire18, wire14},
                  {wire15, wire12}} ~^ (wire13 <<< {wire12})) ?
              (((|wire12) != $signed(wire18)) == reg19) : $signed($signed($signed((8'hb4)))))};
      reg21 <= $signed(reg20);
    end
  assign wire22 = (+$signed((^$signed((!wire14)))));
  assign wire23 = (wire16[(4'hd):(2'h3)] ?
                      ((|((8'hb0) ? wire17 : reg19[(2'h2):(1'h0)])) ?
                          ($signed((!wire22)) >= (wire13 ?
                              (&wire12) : (|wire16))) : ((~&{(8'ha4), wire13}) ?
                              (-wire22) : {$signed((8'hac)),
                                  (-(8'hbb))})) : ((wire22 ?
                              (((8'ha9) ?
                                  wire17 : wire12) && $signed((8'hb0))) : wire12[(1'h0):(1'h0)]) ?
                          (((8'had) ?
                              $signed(wire15) : (wire14 ?
                                  wire15 : wire22)) == (reg19 ?
                              (wire22 ?
                                  wire15 : (8'ha8)) : {wire14})) : $unsigned($unsigned(wire18))));
  assign wire24 = (|reg21[(4'hf):(4'hd)]);
  assign wire25 = ((~{(((8'h9f) << reg20) <<< wire22)}) ?
                      $signed(wire13[(4'hd):(2'h3)]) : (($signed(reg19) || ($unsigned(wire15) < {wire12})) <= ($signed((wire16 * wire16)) ^~ {$signed(wire22),
                          (wire16 ? wire18 : reg21)})));
  assign wire26 = $signed((wire23[(2'h3):(1'h0)] >= ((-(|wire14)) >= wire18)));
  assign wire27 = $unsigned($signed((~&(^~(wire12 ? wire18 : wire16)))));
  assign wire28 = {(wire12[(2'h3):(2'h3)] && reg19),
                      (wire22 <<< $unsigned((wire26[(2'h3):(2'h3)] <= $unsigned(wire25))))};
  assign wire29 = (-$signed($unsigned(wire16)));
  assign wire30 = wire25;
  always
    @(posedge clk) begin
      if ({(~&$unsigned(wire14[(2'h3):(1'h1)])),
          ((~^wire29) ?
              $signed(((wire14 >>> wire14) < (wire17 & wire27))) : {$signed($unsigned(wire22)),
                  ({wire26, wire23} != (wire18 ^~ wire28))})})
        begin
          if ($unsigned($signed((((wire13 ? wire25 : wire22) ?
                  (reg21 >> reg20) : wire14[(4'hb):(1'h1)]) ?
              (wire30[(1'h0):(1'h0)] ~^ $unsigned(wire27)) : $signed((wire14 ^ wire27))))))
            begin
              reg31 <= $signed($unsigned($signed({wire25, (wire28 * wire13)})));
              reg32 <= (((8'hb8) ?
                  wire23 : (^~$signed($signed(wire23)))) ^ $unsigned((((~&wire18) ?
                      (^~(8'had)) : reg19) ?
                  $unsigned((|wire24)) : wire24)));
              reg33 <= wire27;
            end
          else
            begin
              reg31 <= $signed($signed((|$signed((wire14 <<< wire28)))));
              reg32 <= (~|wire17[(2'h3):(2'h3)]);
              reg33 <= wire18;
              reg34 <= (^(8'hae));
              reg35 <= ($signed($unsigned({$signed(reg33),
                  (wire18 ? wire12 : wire12)})) ^~ (8'hb6));
            end
          reg36 <= $signed({$unsigned((^~(-wire18)))});
        end
      else
        begin
          if (wire13)
            begin
              reg31 <= wire28[(4'hd):(1'h0)];
            end
          else
            begin
              reg31 <= ((((&$unsigned(reg35)) || $signed(reg32)) ?
                      $unsigned((wire12 < reg34[(4'he):(4'h9)])) : wire29[(3'h4):(1'h0)]) ?
                  $signed((wire17 >>> $signed($unsigned((8'ha1))))) : (|{wire17}));
            end
          if (((wire24 ?
              $signed({(wire30 ? reg36 : wire15),
                  (wire18 ?
                      wire22 : reg20)}) : wire12[(2'h3):(1'h1)]) | ($signed($signed((reg32 - (8'ha6)))) ?
              wire29[(2'h2):(2'h2)] : reg33)))
            begin
              reg32 <= {reg36};
              reg33 <= (wire23[(2'h3):(1'h0)] ?
                  ($unsigned(wire25[(2'h2):(1'h0)]) ^ $signed($signed($signed(reg36)))) : wire16[(4'ha):(3'h7)]);
              reg34 <= $signed(wire25[(1'h0):(1'h0)]);
              reg35 <= {$unsigned($signed($signed((reg34 >> wire29)))),
                  $signed($signed($unsigned((7'h44))))};
            end
          else
            begin
              reg32 <= ($signed($signed($signed($unsigned(wire18)))) || (~|(wire24 ?
                  reg21[(5'h10):(3'h4)] : {(reg34 ? wire13 : wire22)})));
              reg33 <= $signed($signed($unsigned((reg31 * wire26))));
              reg34 <= $unsigned(reg20);
              reg35 <= (^~(&(($signed(wire17) ?
                  $unsigned(reg20) : (~&reg34)) + reg33[(2'h3):(2'h3)])));
            end
        end
    end
  assign wire37 = {$unsigned(wire24[(3'h4):(2'h2)]), wire15[(2'h2):(2'h2)]};
  assign wire38 = ((8'h9f) ?
                      (+$signed($unsigned($signed(wire12)))) : ((($unsigned(reg35) <= (&wire37)) ?
                          wire13 : wire37[(2'h2):(1'h1)]) || (~|wire30)));
  assign wire39 = ((wire17 ?
                      ((!$signed(wire26)) ?
                          ($signed((8'hae)) & (reg34 ?
                              wire28 : reg19)) : (8'ha7)) : $unsigned(wire13[(2'h2):(2'h2)])) * (wire23 >> wire24[(2'h3):(1'h1)]));
  assign wire40 = (((^~$unsigned((8'ha2))) ?
                          (~($unsigned(wire24) ?
                              (~&wire18) : $signed((8'ha2)))) : $signed({(-wire15)})) ?
                      $unsigned(($unsigned((+reg35)) ?
                          ((|(7'h43)) ?
                              (reg32 ?
                                  reg36 : reg36) : (^wire39)) : (((8'ha9) << wire18) ?
                              (8'h9d) : $unsigned(wire25)))) : {$signed({(wire22 ?
                                  reg34 : (8'hba)),
                              wire12}),
                          (^~(wire30 ?
                              $signed(wire15) : ((7'h43) ?
                                  (8'ha9) : (8'hbc))))});
  assign wire41 = ($unsigned(($signed((wire37 - (8'hab))) * ($unsigned(reg32) ?
                          (^~reg20) : (-wire13)))) ?
                      ($signed(({wire38, wire29} ?
                          $signed((8'haa)) : wire22[(1'h0):(1'h0)])) * wire30[(1'h0):(1'h0)]) : ((&{reg19[(1'h1):(1'h1)],
                          wire16}) || (~{reg19[(1'h1):(1'h1)]})));
  assign wire42 = (^~{wire37[(3'h7):(2'h3)]});
  always
    @(posedge clk) begin
      reg43 <= {wire39, ({(+reg36), wire26[(1'h1):(1'h0)]} + $unsigned(reg32))};
      reg44 <= (({$signed(((8'hb9) ? (8'ha2) : wire23)),
                  wire38[(2'h3):(2'h3)]} ?
              {((reg35 ? wire37 : wire24) + (wire12 ?
                      wire29 : reg32))} : $unsigned({$unsigned(reg32),
                  reg33[(1'h0):(1'h0)]})) ?
          (((wire39 ? wire23 : $unsigned(wire12)) | {reg31[(3'h5):(2'h2)]}) ?
              (~($signed((8'hb5)) | reg43[(1'h0):(1'h0)])) : (8'ha2)) : $signed({$unsigned({wire25})}));
      reg45 <= wire39[(3'h5):(3'h5)];
      reg46 <= ($signed((((reg21 ?
              reg36 : wire14) << reg21) && ($unsigned(wire30) <= (wire23 >= wire39)))) ?
          reg33 : $unsigned((((^wire37) + $signed(reg31)) ?
              (reg21[(4'hf):(2'h2)] ?
                  (wire29 ~^ wire13) : wire18[(3'h7):(2'h2)]) : wire13[(2'h3):(1'h0)])));
    end
endmodule
