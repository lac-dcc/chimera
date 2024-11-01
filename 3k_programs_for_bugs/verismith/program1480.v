module top
#(parameter param218 = ((~((&{(8'hb5)}) ^~ (~^(+(8'haa))))) || (((|((8'hab) > (8'ha3))) >> (((7'h43) ? (8'h9e) : (8'hbb)) ? ((7'h40) ^~ (8'h9e)) : ((7'h40) >= (8'hb8)))) - ({((8'had) ? (8'ha6) : (8'hb6))} >>> ({(8'had)} ? ((8'hbd) ? (8'ha7) : (7'h43)) : ((7'h41) ^ (8'h9e)))))), 
parameter param219 = (~param218))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire171;
  wire signed [(4'ha):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire173;
  wire [(4'hd):(1'h0)] wire174;
  wire signed [(3'h5):(1'h0)] wire176;
  wire [(5'h11):(1'h0)] wire215;
  reg signed [(2'h2):(1'h0)] reg217 = (1'h0);
  reg [(4'hc):(1'h0)] reg175 = (1'h0);
  assign y = {wire171,
                 wire84,
                 wire173,
                 wire174,
                 wire176,
                 wire215,
                 reg217,
                 reg175,
                 (1'h0)};
  module4 #() modinst85 (.wire7(wire2), .clk(clk), .wire6(wire1), .y(wire84), .wire8(wire0), .wire5(wire3));
  module86 #() modinst172 (.wire89(wire84), .wire87(wire0), .wire90(wire1), .wire91(wire3), .wire88(wire2), .y(wire171), .clk(clk));
  assign wire173 = $signed(wire84);
  assign wire174 = ({(~(~|$signed((8'hb9))))} ?
                       $signed($signed((~^$signed((8'haa))))) : ($unsigned((wire2 >>> wire0)) ?
                           {(((8'hb3) ? (8'h9f) : wire173) ?
                                   (^~wire173) : (wire2 ?
                                       wire171 : wire0))} : $unsigned(({(8'hac)} ?
                               {wire0, wire2} : {wire0}))));
  always
    @(posedge clk) begin
      reg175 <= (8'hbf);
    end
  assign wire176 = $unsigned(wire3[(4'ha):(2'h3)]);
  module177 #() modinst216 (wire215, clk, wire173, wire171, wire0, wire176, wire1);
  always
    @(posedge clk) begin
      reg217 <= (((wire174 >> $unsigned((8'ha5))) ? wire171 : (7'h43)) ?
          $unsigned($unsigned($unsigned((reg175 && wire84)))) : wire176);
    end
endmodule

module module177
#(parameter param213 = (7'h44), 
parameter param214 = param213)
(y, clk, wire178, wire179, wire180, wire181, wire182);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire178;
  input wire [(5'h13):(1'h0)] wire179;
  input wire signed [(5'h12):(1'h0)] wire180;
  input wire signed [(3'h5):(1'h0)] wire181;
  input wire [(5'h13):(1'h0)] wire182;
  wire [(4'h9):(1'h0)] wire212;
  wire [(4'hd):(1'h0)] wire211;
  wire signed [(4'hd):(1'h0)] wire210;
  wire signed [(2'h2):(1'h0)] wire209;
  wire [(5'h11):(1'h0)] wire183;
  wire signed [(5'h10):(1'h0)] wire184;
  wire signed [(4'hc):(1'h0)] wire185;
  wire [(2'h3):(1'h0)] wire186;
  wire [(5'h12):(1'h0)] wire187;
  wire [(4'hb):(1'h0)] wire207;
  assign y = {wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire183,
                 wire184,
                 wire185,
                 wire186,
                 wire187,
                 wire207,
                 (1'h0)};
  assign wire183 = (~|((!(wire179[(3'h6):(1'h0)] ?
                           wire181 : $signed(wire178))) ?
                       ((8'h9d) ?
                           ((wire178 ? wire181 : wire179) ?
                               (wire178 ?
                                   wire182 : (7'h41)) : (|(8'hbb))) : $unsigned($signed(wire182))) : (wire180[(3'h7):(3'h5)] & $unsigned((wire181 ?
                           wire178 : wire179)))));
  assign wire184 = (((!wire182[(4'h9):(3'h7)]) ?
                       {$unsigned($signed(wire182))} : $signed($unsigned((~|wire182)))) ~^ ((({wire180} && wire182[(2'h2):(1'h1)]) ?
                       {$signed(wire179)} : wire180[(1'h1):(1'h1)]) <<< {((wire180 <= wire182) >= ((7'h42) ?
                           wire181 : wire183))}));
  assign wire185 = $signed(($unsigned(($signed((8'ha0)) ^~ wire182[(3'h5):(3'h4)])) <<< (((wire178 * wire183) ?
                           ((8'ha3) >= wire179) : wire181[(3'h5):(2'h3)]) ?
                       $signed((~|wire179)) : wire183)));
  assign wire186 = ((|(~|wire180[(4'he):(4'he)])) == wire184[(2'h3):(2'h3)]);
  assign wire187 = wire179[(1'h0):(1'h0)];
  module188 #() modinst208 (.wire192(wire182), .wire193(wire183), .clk(clk), .wire191(wire186), .y(wire207), .wire189(wire179), .wire190(wire180));
  assign wire209 = $signed(wire180);
  assign wire210 = {wire209[(2'h2):(1'h0)],
                       {((wire178 && $unsigned((8'hbf))) >> ((~^wire207) ?
                               wire181[(1'h0):(1'h0)] : wire186[(1'h1):(1'h1)])),
                           $signed((((8'hb6) >>> wire186) ?
                               (wire184 <= wire184) : $unsigned(wire207)))}};
  assign wire211 = wire182;
  assign wire212 = ((~|$signed(wire179[(4'hd):(4'h9)])) >>> $signed($signed(wire184[(3'h6):(3'h5)])));
endmodule

module module86
#(parameter param170 = ({(-(~^((8'hbc) ? (8'ha3) : (8'ha7))))} == (((((7'h40) ^~ (8'hb3)) + (&(8'hb0))) >= ({(8'h9e)} * {(8'hbb), (8'h9c)})) | (((~&(8'h9d)) != ((8'h9f) + (8'h9d))) ? ((~|(7'h43)) << (8'ha3)) : (&(~|(8'hbd)))))))
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire91;
  input wire signed [(5'h15):(1'h0)] wire90;
  input wire signed [(4'ha):(1'h0)] wire89;
  input wire signed [(4'h8):(1'h0)] wire88;
  input wire signed [(4'hf):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire169;
  wire [(4'hb):(1'h0)] wire168;
  wire [(4'ha):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire119;
  wire [(5'h15):(1'h0)] wire92;
  reg signed [(3'h4):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg163 = (1'h0);
  reg [(4'hb):(1'h0)] reg162 = (1'h0);
  reg [(4'hf):(1'h0)] reg161 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  reg [(4'hd):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg157 = (1'h0);
  reg [(3'h6):(1'h0)] reg156 = (1'h0);
  reg [(2'h3):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(2'h2):(1'h0)] reg151 = (1'h0);
  reg [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg144 = (1'h0);
  reg [(4'hd):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(4'hb):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(2'h3):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(3'h5):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire121,
                 wire119,
                 wire92,
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
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
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
                 (1'h0)};
  assign wire92 = wire91[(2'h3):(2'h2)];
  module93 #() modinst120 (.wire94(wire90), .y(wire119), .wire96(wire89), .clk(clk), .wire95(wire87), .wire97(wire91));
  assign wire121 = wire91[(3'h7):(2'h3)];
  always
    @(posedge clk) begin
      reg122 <= (-$signed((wire88 ?
          (wire90 != $signed(wire88)) : ((~|wire119) ?
              (!wire87) : wire121[(1'h0):(1'h0)]))));
      if (wire91[(2'h2):(2'h2)])
        begin
          reg123 <= wire90[(4'hc):(4'hc)];
        end
      else
        begin
          reg123 <= $signed(($unsigned(({wire88} ^ wire89[(3'h4):(2'h3)])) && $unsigned(wire121)));
          reg124 <= $unsigned($signed($signed($signed($unsigned((8'hbe))))));
          if (wire119[(4'h8):(2'h3)])
            begin
              reg125 <= wire121[(1'h1):(1'h1)];
              reg126 <= (8'hbb);
            end
          else
            begin
              reg125 <= reg123;
              reg126 <= wire90;
              reg127 <= $unsigned((+{((~|wire121) ?
                      (wire87 & wire87) : (wire88 ? reg124 : wire90)),
                  ($signed(reg126) * $signed(reg123))}));
              reg128 <= {reg125};
              reg129 <= wire87[(4'ha):(2'h2)];
            end
          reg130 <= $unsigned($unsigned(((-(~&reg127)) && (&wire119))));
        end
      reg131 <= $unsigned($signed(reg123[(4'he):(4'hd)]));
      reg132 <= (~&((^reg124) ?
          $unsigned($unsigned($signed(reg122))) : $unsigned({(reg126 ~^ wire90)})));
    end
  always
    @(posedge clk) begin
      reg133 <= $unsigned((|$signed(reg130)));
      reg134 <= reg130[(3'h5):(2'h3)];
      reg135 <= reg131;
      if ((({reg123,
              {((8'hb2) ? reg127 : wire90), $signed(reg123)}} & {(wire87 ?
                  $signed(wire87) : {wire90})}) ?
          $unsigned(($unsigned(reg127) ?
              reg133[(4'h9):(3'h4)] : reg131)) : reg133[(3'h4):(1'h0)]))
        begin
          reg136 <= $signed((|reg129[(4'h9):(1'h0)]));
          if (((reg128[(3'h5):(3'h4)] ?
                  (+(wire88[(3'h5):(2'h3)] ?
                      $unsigned(reg130) : reg132[(3'h4):(1'h0)])) : $signed(reg130[(3'h4):(2'h3)])) ?
              ((reg125 ?
                      reg133[(4'he):(4'ha)] : ((wire89 + reg127) ?
                          $signed(reg133) : reg131[(4'h9):(3'h6)])) ?
                  {wire119,
                      ((8'hb7) ?
                          (wire119 ?
                              reg136 : (8'hac)) : $unsigned(reg134))} : ($unsigned((wire90 ?
                      wire92 : (8'hb8))) != reg127)) : {reg134}))
            begin
              reg137 <= wire121;
              reg138 <= ($unsigned(($unsigned(reg126[(3'h5):(2'h2)]) ?
                      (~&(8'hb1)) : reg125)) ?
                  (reg125 ?
                      $unsigned($signed((-reg129))) : (8'h9e)) : (!((8'hb0) * (+{reg127,
                      wire121}))));
            end
          else
            begin
              reg137 <= wire119[(4'ha):(4'ha)];
              reg138 <= {{(($unsigned(reg125) ?
                          $unsigned(reg130) : $unsigned(wire121)) == {reg126})}};
              reg139 <= $unsigned(($unsigned({(+reg133)}) ?
                  ($signed(reg122) ?
                      $signed((8'hbe)) : $signed((reg124 != reg129))) : (^wire92)));
              reg140 <= (($signed(((reg133 ? reg123 : wire88) ?
                      reg135 : {(8'hb6),
                          (8'hb7)})) <= $unsigned($unsigned((wire87 ~^ wire92)))) ?
                  reg135[(4'hd):(3'h6)] : reg127);
              reg141 <= $unsigned($signed(($signed((!(8'ha5))) ?
                  ((8'h9c) ^ (^~wire91)) : (reg129 << wire119[(1'h1):(1'h1)]))));
            end
        end
      else
        begin
          reg136 <= {$unsigned((!$signed((^wire91)))),
              (^({((8'ha1) << reg132)} ? reg126 : reg138))};
          reg137 <= (~&$signed($signed(wire87)));
          reg138 <= wire92[(4'h9):(3'h6)];
          if ($unsigned($signed((~|(+(8'h9e))))))
            begin
              reg139 <= reg123[(4'he):(3'h5)];
              reg140 <= $unsigned({(&wire91[(4'hd):(4'hd)])});
              reg141 <= $unsigned($signed((wire91[(4'hc):(2'h3)] ^ ($unsigned(reg129) ?
                  (&reg139) : $signed(reg128)))));
              reg142 <= (~|$unsigned(reg139[(4'hc):(4'hc)]));
              reg143 <= $unsigned(($unsigned((^reg127[(1'h1):(1'h1)])) ?
                  (-($unsigned(reg123) | $signed(reg132))) : {{wire121,
                          $signed(reg133)},
                      (wire89 * (8'hba))}));
            end
          else
            begin
              reg139 <= (($signed($unsigned((~^reg123))) << $unsigned(((~(8'haf)) ?
                      (&reg130) : reg139[(1'h0):(1'h0)]))) ?
                  ($unsigned(($signed((8'h9e)) ^~ {reg126})) || {(|$unsigned(wire89))}) : $signed((wire92 > ($signed(wire121) ?
                      reg127 : ((8'ha9) >> reg137)))));
              reg140 <= (((reg127 ^~ reg135[(1'h1):(1'h0)]) ?
                  (|reg126) : $unsigned($signed(wire88))) == reg126[(2'h3):(1'h0)]);
            end
          if (reg123)
            begin
              reg144 <= $signed(($signed($unsigned(reg139[(1'h1):(1'h1)])) ?
                  {$signed((reg122 + (8'ha3))),
                      {((8'h9f) - reg131), $unsigned((8'hb9))}} : (!(+(wire87 ?
                      reg134 : wire89)))));
              reg145 <= (((~|reg128) || ($unsigned((wire88 ?
                          reg129 : (8'hbb))) ?
                      ($unsigned(wire121) ?
                          reg132 : (reg130 ?
                              reg130 : reg126)) : reg135[(4'he):(1'h0)])) ?
                  {reg124[(2'h2):(2'h2)],
                      (~|$unsigned($unsigned(reg140)))} : {((~|(reg143 ?
                          reg136 : reg126)) < {(wire119 ~^ wire121)})});
              reg146 <= ($unsigned(reg137) ?
                  $unsigned(reg135[(4'ha):(3'h5)]) : ((8'ha4) ?
                      reg144[(2'h2):(1'h1)] : $signed(($signed((8'ha3)) ^ (reg138 ?
                          reg123 : (7'h41))))));
              reg147 <= {((((reg140 ? reg126 : reg136) ?
                      reg144[(4'hc):(3'h6)] : (reg126 ?
                          reg137 : reg124)) > $unsigned({reg135,
                      reg135})) * ((~^$signed((7'h44))) < ((7'h41) <= (reg134 ?
                      reg128 : reg128))))};
              reg148 <= reg145[(2'h3):(1'h1)];
            end
          else
            begin
              reg144 <= ((~|reg129) ^~ wire91[(4'he):(4'hb)]);
              reg145 <= wire90[(4'he):(4'he)];
              reg146 <= $signed({reg138[(1'h1):(1'h1)],
                  ({(&(8'hb2))} ?
                      reg139[(4'h9):(2'h3)] : {(&reg128),
                          (wire88 ^~ reg136)})});
            end
        end
    end
  always
    @(posedge clk) begin
      if (((-(|$signed($signed(reg143)))) ?
          (reg135[(2'h3):(1'h0)] << (((reg146 ~^ reg148) > {reg141}) ~^ reg145[(4'h9):(3'h4)])) : $signed($unsigned($unsigned(wire90)))))
        begin
          if ($signed($unsigned($unsigned((((8'hac) ? reg141 : wire119) ?
              ((8'hab) ? reg140 : reg123) : reg132)))))
            begin
              reg149 <= wire119;
            end
          else
            begin
              reg149 <= ((-reg140) ?
                  ((8'h9c) ?
                      (~|$signed(reg148[(1'h1):(1'h1)])) : (reg133[(3'h4):(1'h1)] ^ ($signed(reg130) & $signed((8'hbb))))) : ($unsigned(reg132) != reg134));
              reg150 <= $unsigned({reg132, reg132});
              reg151 <= $signed(reg146[(2'h3):(1'h1)]);
              reg152 <= reg128[(1'h0):(1'h0)];
            end
          reg153 <= (reg139[(2'h2):(1'h1)] <= $signed($signed($signed((reg151 ~^ wire121)))));
        end
      else
        begin
          reg149 <= $unsigned(reg140[(5'h14):(5'h13)]);
          reg150 <= (~$unsigned($unsigned($unsigned(reg150))));
          reg151 <= ($unsigned($unsigned((!((8'ha6) ? reg127 : reg137)))) ?
              ($signed(reg141) ?
                  {($unsigned(reg124) ?
                          $unsigned((8'hbb)) : reg129)} : $signed(($unsigned((7'h42)) ^ (reg153 != reg128)))) : {reg122[(3'h7):(3'h7)],
                  reg133});
          if (reg129[(3'h4):(2'h3)])
            begin
              reg152 <= reg141;
              reg153 <= reg132;
              reg154 <= (~&reg134[(2'h2):(1'h0)]);
              reg155 <= $unsigned(reg123);
              reg156 <= reg125;
            end
          else
            begin
              reg152 <= {(reg150[(4'h9):(4'h8)] ?
                      $signed((~&reg123)) : (({(8'had),
                              reg136} ~^ $unsigned(reg135)) ?
                          ($unsigned(reg150) ?
                              $unsigned(reg154) : (~&reg135)) : reg152[(1'h0):(1'h0)]))};
              reg153 <= (reg125[(1'h1):(1'h0)] - ((^~reg124[(2'h2):(1'h0)]) <= (&reg126)));
              reg154 <= (-{(8'ha7)});
              reg155 <= (((^(~$unsigned(reg151))) ?
                      $unsigned((~^(reg136 * wire87))) : $unsigned($signed($unsigned(reg123)))) ?
                  $signed(reg156[(2'h3):(1'h1)]) : (|reg154[(3'h5):(1'h0)]));
              reg156 <= $unsigned($unsigned((~^{(+reg149)})));
            end
        end
      if ((~&wire92[(4'hc):(1'h1)]))
        begin
          reg157 <= (8'had);
          reg158 <= (^~$signed($unsigned((~^{reg127}))));
          reg159 <= $signed($unsigned(reg149));
          if ($unsigned(reg145[(4'h9):(4'h8)]))
            begin
              reg160 <= ({$signed({{reg141, reg130}, (reg136 && wire121)})} ?
                  (reg151 ?
                      reg134[(3'h4):(1'h1)] : $unsigned($signed($unsigned(reg146)))) : reg150[(4'h9):(4'h8)]);
              reg161 <= reg137;
              reg162 <= {$unsigned(((!(~|wire88)) ?
                      reg147[(4'ha):(4'h9)] : wire90)),
                  ($signed($unsigned($unsigned(reg122))) < (((8'hb3) ?
                          wire121[(3'h6):(3'h4)] : (reg132 ?
                              reg145 : (8'h9e))) ?
                      (((7'h43) ?
                          reg145 : reg136) && reg157) : ({reg137} * (~|reg160))))};
              reg163 <= ({({(~(7'h40)), (reg151 - reg128)} ?
                      (^~wire88[(1'h1):(1'h0)]) : $unsigned((wire90 && reg136))),
                  (~^(8'ha9))} ^~ reg133);
              reg164 <= (~|(reg125[(3'h4):(1'h1)] * $unsigned($unsigned((reg122 ?
                  wire89 : reg159)))));
            end
          else
            begin
              reg160 <= ($unsigned((-$unsigned(reg155[(2'h3):(2'h2)]))) | reg129);
              reg161 <= $unsigned(reg126[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          reg157 <= (reg159 == {((8'h9d) ?
                  reg129 : ((reg123 ? reg160 : reg162) ?
                      (^reg145) : $signed(reg139)))});
          reg158 <= (~&(({$unsigned(reg143)} ?
              (8'hb3) : ((reg126 ? wire88 : wire121) ?
                  (reg160 != reg158) : (^~reg157))) >>> wire119));
          reg159 <= (~|(reg162 > (($unsigned(reg152) + reg156[(2'h2):(1'h1)]) != $unsigned((reg137 >>> wire89)))));
        end
      reg165 <= (!(~|(^~({wire121, reg136} ?
          (reg122 <= reg136) : $signed(wire89)))));
      reg166 <= $unsigned($unsigned($unsigned(reg136[(4'ha):(3'h6)])));
      reg167 <= $unsigned($unsigned(reg141));
    end
  assign wire168 = $unsigned($unsigned(reg151[(2'h2):(1'h0)]));
  assign wire169 = reg142;
endmodule

module module4
#(parameter param82 = (8'hb1), 
parameter param83 = param82)
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  input wire [(4'ha):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire9;
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire68,
                 wire67,
                 wire65,
                 wire9,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire9 = $signed(wire6);
  module10 #() modinst66 (wire65, clk, wire5, wire6, wire9, wire7);
  assign wire67 = ($unsigned((~wire65[(1'h0):(1'h0)])) ^ (wire6 ?
                      wire8[(5'h12):(5'h12)] : wire9));
  assign wire68 = ($signed($unsigned((+(~|wire7)))) ?
                      (((+(&wire9)) || $signed(wire8)) != (+($signed(wire65) << (wire8 == wire7)))) : wire8);
  always
    @(posedge clk) begin
      reg69 <= $signed(wire5);
      if ((+$unsigned({((wire8 ? (8'h9c) : wire9) * wire9[(3'h4):(1'h0)])})))
        begin
          reg70 <= wire7;
        end
      else
        begin
          reg70 <= $unsigned((($unsigned($signed(wire6)) ?
              {{wire8}} : wire68) || (8'h9f)));
          reg71 <= $unsigned(wire5[(3'h4):(1'h0)]);
          reg72 <= $signed({$unsigned(((reg69 ?
                  (8'hbb) : wire65) ~^ wire8[(4'hf):(3'h4)]))});
          reg73 <= ($unsigned(($unsigned((wire5 ?
                  wire65 : reg71)) ^ reg71[(1'h0):(1'h0)])) ?
              $unsigned(reg69) : wire68[(4'hd):(4'h9)]);
          reg74 <= $unsigned($signed(((wire7[(3'h4):(1'h1)] ?
              {reg71, wire67} : ((8'h9f) ? wire67 : wire8)) ~^ wire8)));
        end
      reg75 <= (&$unsigned(reg74[(4'h9):(1'h1)]));
    end
  assign wire76 = wire68[(4'h8):(3'h7)];
  assign wire77 = (^{wire65});
  assign wire78 = (((((~^reg71) ?
                              $signed(reg72) : $signed(wire5)) || wire7[(1'h1):(1'h1)]) ?
                          (!(|(reg72 ?
                              reg72 : reg70))) : {(&reg69[(3'h6):(1'h0)]),
                              reg71}) ?
                      (!reg72[(3'h4):(1'h1)]) : (8'hbc));
  assign wire79 = (reg72 < (reg71 ~^ {$signed((~&wire7))}));
  assign wire80 = {wire8};
  assign wire81 = wire76;
endmodule

module module10
#(parameter param63 = ((&(&(-(|(8'hb4))))) && (|(~(((7'h41) * (8'hac)) ? (~(7'h41)) : (~(8'hbe)))))), 
parameter param64 = param63)
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h242):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= $unsigned(wire12[(1'h0):(1'h0)]);
      if ((-($signed($unsigned($signed(reg15))) ?
          (wire13[(3'h6):(1'h1)] - wire13) : $unsigned(wire12))))
        begin
          if (((wire11[(3'h6):(3'h6)] << $unsigned($unsigned((~|reg15)))) & (^$unsigned({(-wire12),
              wire12}))))
            begin
              reg16 <= wire12[(3'h4):(3'h4)];
              reg17 <= (wire12 ?
                  ((wire11[(3'h7):(3'h5)] - (wire14[(1'h1):(1'h1)] ?
                      (|wire14) : $signed(wire11))) == reg16[(3'h7):(1'h1)]) : ($signed($signed($unsigned((8'ha2)))) ?
                      (-$unsigned((reg16 ?
                          (8'haa) : wire12))) : (~&wire12[(2'h3):(1'h1)])));
              reg18 <= {$unsigned((8'haa))};
            end
          else
            begin
              reg16 <= wire12;
              reg17 <= wire13[(4'h8):(3'h6)];
              reg18 <= $signed((8'haf));
              reg19 <= (((^$unsigned($unsigned(wire13))) | (-$unsigned((~|wire11)))) ?
                  reg15 : $unsigned((reg15 >>> (!(~|reg18)))));
            end
          reg20 <= ($unsigned((wire14[(2'h3):(1'h0)] ?
              $unsigned((~^reg15)) : (+(|wire11)))) ~^ reg15);
          reg21 <= {reg15,
              (!($unsigned(reg20) ? (~&reg16) : (~|reg20[(2'h2):(2'h2)])))};
          reg22 <= $signed(reg15);
        end
      else
        begin
          reg16 <= $signed(wire14[(2'h2):(1'h1)]);
          reg17 <= ($unsigned({(^~(~^reg22)),
              (reg20[(1'h0):(1'h0)] > $unsigned(wire13))}) >> $signed((!($unsigned((8'hb2)) && (reg17 < reg15)))));
        end
      reg23 <= $unsigned($signed(((&(wire14 ? (8'ha3) : wire12)) ?
          (~^{reg20, reg20}) : reg22[(2'h2):(1'h0)])));
      if (reg19)
        begin
          reg24 <= reg18;
          if ({((~|(reg24 && wire11[(3'h4):(2'h3)])) ?
                  reg19 : ((reg21 < $signed(reg18)) ?
                      $unsigned(reg22[(2'h2):(2'h2)]) : (~&reg16)))})
            begin
              reg25 <= (((((reg21 > wire12) <<< (reg17 ? (7'h42) : wire13)) ?
                  reg16 : (~&reg18[(4'h9):(3'h6)])) & (~(~|wire11))) <<< (!(-reg17[(2'h2):(1'h0)])));
              reg26 <= wire11;
            end
          else
            begin
              reg25 <= (8'ha2);
            end
          reg27 <= (((reg26 ?
                  $signed((~^wire12)) : {((8'hb4) ? wire12 : reg15)}) ?
              (8'hae) : (~|$unsigned($signed(reg19)))) != $unsigned($unsigned($unsigned((reg26 ?
              wire12 : reg26)))));
          reg28 <= (^~$signed((((reg15 ?
              reg27 : reg18) < $signed(reg18)) + $unsigned((reg22 ?
              wire14 : reg20)))));
          reg29 <= reg27;
        end
      else
        begin
          reg24 <= (~$unsigned((&$signed(reg22[(2'h2):(1'h0)]))));
          if ((^$unsigned(($signed((reg23 <<< wire14)) <= (reg19 - $signed((8'ha4)))))))
            begin
              reg25 <= (($signed(wire14[(1'h1):(1'h1)]) ?
                      (&wire13[(3'h5):(2'h2)]) : reg16[(2'h3):(2'h2)]) ?
                  $signed($signed((-(reg15 << reg17)))) : $signed(reg24[(3'h6):(2'h3)]));
              reg26 <= ((reg26 ^ reg15[(1'h1):(1'h1)]) ?
                  reg18 : reg27[(3'h4):(2'h2)]);
              reg27 <= $unsigned((^~$unsigned($signed($signed((8'had))))));
              reg28 <= $signed($unsigned(($unsigned(reg22[(1'h1):(1'h1)]) - (reg23 != $signed(reg20)))));
            end
          else
            begin
              reg25 <= $signed(((&reg20[(2'h2):(2'h2)]) ^ (^($unsigned((7'h40)) ?
                  (reg16 ? reg22 : reg20) : $unsigned(reg19)))));
              reg26 <= $unsigned($unsigned(reg23[(4'hf):(4'hb)]));
              reg27 <= $signed(((-(8'hbf)) << $signed((reg29[(3'h6):(1'h0)] ?
                  ((8'hbd) == (8'hbb)) : (-reg23)))));
            end
          reg29 <= (~^(7'h40));
          reg30 <= (+(reg17 ?
              ({$signed(reg25), wire14[(1'h1):(1'h1)]} ?
                  $unsigned(reg17) : $signed({(8'hbb)})) : $unsigned((8'haf))));
        end
    end
  assign wire31 = ($signed(((reg23 - $unsigned(reg20)) | ((!reg23) & (!reg26)))) - ({$signed((~reg24)),
                      reg19[(3'h4):(3'h4)]} ~^ (wire13[(4'ha):(4'ha)] - reg22[(2'h2):(1'h1)])));
  assign wire32 = ($signed(((-(reg30 ? wire12 : wire31)) ?
                      (~&(reg26 ?
                          wire31 : reg29)) : reg16[(1'h1):(1'h0)])) > {reg18[(5'h13):(5'h11)]});
  assign wire33 = $unsigned($signed(wire11));
  assign wire34 = (((((reg24 ? (7'h43) : wire13) && reg27) || {$unsigned(reg27),
                          $signed(reg28)}) ?
                      ((^reg25) == ((~|wire11) ?
                          (reg25 ?
                              reg23 : wire11) : $unsigned((8'h9d)))) : wire13) & reg23[(1'h0):(1'h0)]);
  assign wire35 = (!$unsigned((8'hbc)));
  assign wire36 = (+(~|$unsigned(reg26[(3'h4):(1'h1)])));
  assign wire37 = (^wire34);
  assign wire38 = (reg30 < ((~^wire33[(1'h1):(1'h0)]) ?
                      {({reg25, wire35} ? {wire34, wire34} : $signed(wire36)),
                          {(^(7'h41))}} : {reg29}));
  assign wire39 = (^~$signed(reg20[(1'h0):(1'h0)]));
  assign wire40 = (^~reg18[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg41 <= $unsigned((((~^(wire38 ? (8'haf) : reg23)) ?
          reg29[(3'h7):(1'h0)] : $signed((wire32 ?
              reg25 : wire36))) * (reg26[(1'h1):(1'h1)] ?
          $unsigned((^wire32)) : $unsigned($unsigned(wire36)))));
      reg42 <= (+wire31[(4'he):(2'h3)]);
      if ((((reg20 <= reg30[(1'h1):(1'h1)]) >> $signed($signed({reg28}))) ?
          reg24 : $signed($signed(reg17))))
        begin
          reg43 <= reg18;
          reg44 <= (~|$unsigned((~|$unsigned({wire36}))));
          if ({wire37})
            begin
              reg45 <= (($unsigned((8'h9c)) == wire14[(1'h0):(1'h0)]) ?
                  reg23 : reg29[(3'h7):(2'h3)]);
              reg46 <= wire32;
            end
          else
            begin
              reg45 <= (((~^{reg46, {(8'had), reg43}}) ?
                  (8'haa) : (($signed(reg46) ?
                      $unsigned(reg28) : ((8'hbb) ^~ wire37)) <= reg19)) - reg22[(1'h0):(1'h0)]);
              reg46 <= (wire13[(3'h4):(1'h1)] && (-wire13));
              reg47 <= reg22;
              reg48 <= $unsigned({((&(~|reg22)) ?
                      (!$unsigned((8'hb6))) : reg28[(4'h8):(1'h0)]),
                  reg41});
              reg49 <= reg18;
            end
        end
      else
        begin
          reg43 <= reg48;
          reg44 <= $signed(((reg18[(5'h10):(4'he)] - ((wire14 & wire36) + $unsigned(wire37))) < $signed((+(wire38 ?
              reg23 : (8'ha7))))));
          reg45 <= $unsigned((($unsigned({wire14, wire40}) * (+(reg47 ?
              (8'hb8) : reg28))) >> $signed({reg21[(5'h11):(1'h1)],
              (wire32 ? reg46 : reg16)})));
          if ($signed({((^$unsigned(reg26)) << reg30), reg43}))
            begin
              reg46 <= {$unsigned($unsigned($unsigned($unsigned(reg17))))};
              reg47 <= wire31;
              reg48 <= $unsigned($signed((+reg28[(3'h7):(3'h4)])));
              reg49 <= ($unsigned(wire39) ?
                  (~&reg16) : $signed({$signed($signed(reg29))}));
              reg50 <= (reg48 ^ (8'ha4));
            end
          else
            begin
              reg46 <= $unsigned(((reg30[(3'h4):(1'h0)] ?
                      (8'ha4) : (reg22[(1'h1):(1'h0)] ?
                          wire37[(4'hb):(2'h2)] : (wire40 && reg25))) ?
                  (reg44 <<< ((-reg20) || wire38[(1'h1):(1'h0)])) : (8'haf)));
              reg47 <= (~&$signed(((~$unsigned(reg47)) || ((reg22 >= (8'hb4)) == wire11))));
            end
        end
    end
  assign wire51 = ($unsigned($signed(((8'haa) ~^ (~reg50)))) ?
                      ((|wire13) ?
                          reg19[(4'hd):(4'hb)] : wire31) : $signed($unsigned($signed((wire12 - reg46)))));
  assign wire52 = $unsigned($signed($signed(reg43)));
  assign wire53 = $signed($unsigned((8'hb8)));
  assign wire54 = (~reg19);
  assign wire55 = $signed(($unsigned($signed($signed(reg41))) & $signed(((^reg15) ^~ (reg27 ?
                      reg46 : reg28)))));
  always
    @(posedge clk) begin
      reg56 <= wire33[(2'h2):(1'h1)];
      reg57 <= (+$unsigned(((|(|reg19)) ?
          (reg44 >>> ((8'hb9) | reg48)) : {(wire54 != wire11)})));
      reg58 <= $signed((reg16 ? wire11 : reg16[(3'h5):(1'h1)]));
      reg59 <= reg29;
      reg60 <= (($unsigned($signed((wire11 | reg30))) & (reg21[(3'h4):(1'h0)] ?
              $signed(((8'h9c) ? reg43 : reg23)) : wire37)) ?
          reg50 : ((((wire34 <<< reg49) ?
              (&reg22) : reg50) & $signed($signed(reg18))) <= $unsigned(reg45[(2'h3):(1'h1)])));
    end
  assign wire61 = $signed(reg15[(2'h2):(2'h2)]);
  assign wire62 = (|$signed((&{(wire39 ? reg50 : wire38)})));
endmodule

module module93
#(parameter param118 = (|((-({(7'h44)} * ((8'hb7) ? (8'ha7) : (8'h9c)))) ? ((~&(~|(8'ha0))) ? (~^((8'ha4) ? (8'ha4) : (8'h9d))) : (~^{(7'h40), (7'h43)})) : (~|({(8'hb3)} ? (~(8'ha4)) : (~^(8'ha5)))))))
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire97;
  input wire signed [(4'ha):(1'h0)] wire96;
  input wire signed [(4'hf):(1'h0)] wire95;
  input wire signed [(4'h9):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire113;
  wire [(3'h4):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire110;
  wire signed [(5'h11):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire98;
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 reg117,
                 reg116,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire98 = $signed(wire94[(1'h1):(1'h1)]);
  assign wire99 = ((+({(wire94 ?
                          wire97 : wire94)} ^ $signed(wire96))) >>> $unsigned(wire96[(4'h8):(3'h4)]));
  assign wire100 = wire96;
  assign wire101 = ((~&$signed($unsigned(wire95[(3'h7):(3'h5)]))) <= $unsigned((~&wire100[(4'ha):(3'h7)])));
  assign wire102 = wire94[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if (wire96[(4'h8):(1'h1)])
        begin
          reg103 <= {($signed(wire97) ?
                  $unsigned({wire96,
                      (wire95 & wire102)}) : ({wire94[(1'h1):(1'h1)]} ~^ (~|(^~wire94)))),
              (wire94 ? (8'hb0) : wire101[(2'h3):(2'h2)])};
          reg104 <= ($unsigned(wire101[(3'h4):(2'h3)]) ?
              {(^~$signed((wire102 >= reg103)))} : wire100);
          reg105 <= ({$unsigned({(~^(8'hbc)), (-(8'hb6))}),
              wire98} != $unsigned(wire96));
          reg106 <= $unsigned($signed(wire99[(4'hd):(4'hd)]));
          reg107 <= {wire96[(3'h6):(2'h2)]};
        end
      else
        begin
          reg103 <= (~|(reg107[(5'h14):(5'h12)] >>> wire102[(1'h1):(1'h1)]));
        end
      reg108 <= reg104[(4'hf):(3'h5)];
      reg109 <= (((wire94[(3'h6):(1'h0)] && (|$unsigned(reg107))) >> (7'h43)) ?
          $signed({$unsigned(wire98[(1'h0):(1'h0)]), wire102}) : ((({wire102,
                      wire97} ?
                  (wire102 <= wire101) : (wire102 ?
                      reg105 : reg104)) >> (^~wire98)) ?
              $unsigned(((^reg104) ?
                  $unsigned((8'ha8)) : (~&wire102))) : ($unsigned((wire97 ?
                  reg108 : (8'hac))) | reg104[(3'h4):(1'h0)])));
    end
  assign wire110 = wire96[(2'h2):(2'h2)];
  assign wire111 = $signed($signed(wire100[(1'h1):(1'h1)]));
  assign wire112 = $unsigned({({(reg107 >> reg108), reg107} ?
                           {((8'ha2) ? wire94 : wire94),
                               $signed(reg107)} : $unsigned((wire100 < (8'ha5)))),
                       (reg108[(3'h6):(1'h1)] >= $signed((wire94 == wire100)))});
  assign wire113 = $unsigned(wire112);
  assign wire114 = ((!(+reg109[(4'hc):(3'h7)])) - $unsigned($unsigned((wire102[(3'h7):(1'h1)] ?
                       wire99 : $signed((8'hb0))))));
  assign wire115 = (~($signed((&$signed(wire98))) && reg109));
  always
    @(posedge clk) begin
      reg116 <= wire113;
      reg117 <= $signed($unsigned($signed($signed($unsigned(wire98)))));
    end
endmodule

module module188  (y, clk, wire193, wire192, wire191, wire190, wire189);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire193;
  input wire signed [(5'h13):(1'h0)] wire192;
  input wire [(2'h3):(1'h0)] wire191;
  input wire signed [(5'h11):(1'h0)] wire190;
  input wire [(5'h13):(1'h0)] wire189;
  wire [(4'hd):(1'h0)] wire206;
  wire signed [(5'h15):(1'h0)] wire205;
  wire signed [(3'h5):(1'h0)] wire204;
  wire [(4'ha):(1'h0)] wire203;
  wire signed [(5'h10):(1'h0)] wire202;
  wire signed [(3'h5):(1'h0)] wire201;
  wire signed [(4'hf):(1'h0)] wire195;
  wire [(3'h5):(1'h0)] wire194;
  reg [(5'h15):(1'h0)] reg200 = (1'h0);
  reg [(5'h12):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg197 = (1'h0);
  reg [(4'ha):(1'h0)] reg196 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire195,
                 wire194,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 (1'h0)};
  assign wire194 = (+$unsigned((-wire190)));
  assign wire195 = ({({wire191, $signed((7'h41))} && wire192[(5'h11):(3'h4)])} ?
                       wire193 : $signed({((wire194 <<< (7'h42)) > (wire194 ?
                               wire193 : (8'ha5)))}));
  always
    @(posedge clk) begin
      reg196 <= (~|wire190[(2'h3):(2'h3)]);
      reg197 <= {wire193};
      reg198 <= wire189;
      reg199 <= (8'hb6);
      reg200 <= wire194[(1'h0):(1'h0)];
    end
  assign wire201 = (wire190 ?
                       $unsigned((($signed(wire193) <<< (reg196 ^~ wire195)) ?
                           (8'ha0) : {(reg196 ? wire193 : wire194),
                               $signed(reg196)})) : wire195);
  assign wire202 = ((wire193 * {$signed($signed(wire189))}) == reg199);
  assign wire203 = wire192[(4'hf):(4'h9)];
  assign wire204 = {wire190[(4'h9):(4'h9)]};
  assign wire205 = ($signed({reg196[(1'h0):(1'h0)]}) <<< (wire202[(4'h8):(2'h2)] | reg198));
  assign wire206 = wire190[(3'h4):(3'h4)];
endmodule
