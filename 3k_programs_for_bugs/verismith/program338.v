module top
#(parameter param180 = (((^~(~|((7'h43) ? (8'hbd) : (8'h9e)))) - (-(((8'hb0) ? (8'h9c) : (8'hae)) ? ((8'ha0) ? (8'hb6) : (7'h40)) : (|(8'haf))))) ? (|(((~&(7'h42)) || ((8'hb0) ? (8'hb0) : (8'ha2))) != ({(8'h9d), (8'hbd)} && ((8'hb6) || (8'hbe))))) : (8'ha1)), 
parameter param181 = ((((|(param180 > param180)) ? {(param180 << param180)} : (!(+param180))) >= (param180 ? (param180 ? param180 : (-param180)) : (-(param180 < (8'hba))))) ? (!(|((8'hb2) >>> (param180 ? param180 : param180)))) : (7'h42)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire158;
  wire signed [(4'hb):(1'h0)] wire157;
  wire signed [(4'h8):(1'h0)] wire156;
  wire [(2'h3):(1'h0)] wire155;
  wire [(3'h7):(1'h0)] wire154;
  wire [(2'h2):(1'h0)] wire153;
  wire signed [(5'h11):(1'h0)] wire152;
  wire signed [(3'h5):(1'h0)] wire134;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  reg [(4'h9):(1'h0)] reg144 = (1'h0);
  reg [(4'hd):(1'h0)] reg143 = (1'h0);
  reg [(5'h12):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  reg [(4'h9):(1'h0)] reg136 = (1'h0);
  assign y = {wire178,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire134,
                 wire4,
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
                 (1'h0)};
  assign wire4 = $signed($signed({wire2[(4'ha):(4'ha)]}));
  module5 #() modinst135 (.clk(clk), .y(wire134), .wire8(wire1), .wire7(wire0), .wire6(wire4), .wire9(wire3));
  always
    @(posedge clk) begin
      reg136 <= (wire0[(1'h1):(1'h1)] ?
          (wire2 ? wire134 : $unsigned($signed(wire2))) : (~((7'h42) ?
              $unsigned((wire4 >> wire3)) : $unsigned($signed(wire134)))));
      if ($signed($signed(((&wire2[(3'h7):(1'h1)]) && wire4))))
        begin
          if ($unsigned({wire134}))
            begin
              reg137 <= $signed({$signed($unsigned(wire4[(4'hf):(2'h3)])),
                  $unsigned(($unsigned(wire4) ?
                      $signed(wire4) : $unsigned(wire1)))});
              reg138 <= (((reg137[(4'ha):(3'h5)] ?
                  wire0 : ($signed(wire3) ?
                      reg136[(2'h2):(1'h1)] : $signed(wire2))) | {reg136}) < $unsigned(((+{reg137}) != ({wire2} ?
                  $signed(reg137) : $unsigned(wire134)))));
              reg139 <= ((8'haa) < ((8'hab) ?
                  ($unsigned((^wire134)) ?
                      ((|(8'ha3)) ?
                          (wire3 ?
                              reg137 : wire3) : $unsigned(wire3)) : {((8'hbd) ~^ wire1),
                          $unsigned((7'h43))}) : ((+wire0) ?
                      $signed($unsigned(wire3)) : ((wire0 <<< wire3) << (~|wire1)))));
            end
          else
            begin
              reg137 <= $signed((8'hab));
              reg138 <= $unsigned($signed(($unsigned((wire3 >> wire134)) ^~ reg138[(1'h0):(1'h0)])));
              reg139 <= (((|reg136[(3'h5):(1'h1)]) ?
                      wire4 : $unsigned($signed((reg138 ? reg138 : reg136)))) ?
                  $unsigned((~|(wire1[(4'hb):(4'h8)] >> $unsigned(wire134)))) : $signed($unsigned((&(reg138 ?
                      wire2 : wire1)))));
            end
          reg140 <= (((reg139 ?
                  $signed((~|wire3)) : (~&(~&wire134))) * reg139[(3'h6):(3'h4)]) ?
              ((($signed(wire134) || wire134) << reg137[(1'h0):(1'h0)]) ?
                  ((!$signed(wire4)) <<< ((wire0 ?
                      wire4 : wire1) ^~ $unsigned(wire1))) : (reg137 << $unsigned(reg139))) : (~&((wire3[(1'h1):(1'h0)] || $signed(reg138)) ?
                  wire0[(4'h8):(3'h5)] : ($signed(reg139) >= (wire0 >>> reg139)))));
          if ($unsigned(reg139[(3'h5):(3'h5)]))
            begin
              reg141 <= (-(reg138[(3'h6):(3'h6)] ?
                  $signed(reg139) : $unsigned($unsigned((wire134 | (7'h44))))));
              reg142 <= $unsigned(($unsigned(wire3) <= $unsigned((~|(reg137 ?
                  reg140 : wire0)))));
              reg143 <= reg139;
            end
          else
            begin
              reg141 <= reg143;
              reg142 <= $signed((~|reg136));
            end
        end
      else
        begin
          if (((^~reg140[(1'h1):(1'h0)]) >> $unsigned((~($unsigned(reg137) == (~|reg139))))))
            begin
              reg137 <= (!reg142);
              reg138 <= ($signed((wire0[(1'h1):(1'h0)] ?
                  $unsigned((reg142 ^ wire3)) : $unsigned(wire4))) >>> ($unsigned(((wire3 >= reg139) * (wire0 >> (8'ha2)))) - wire3));
              reg139 <= wire0;
            end
          else
            begin
              reg137 <= ((!(wire0[(4'ha):(1'h0)] ?
                      wire3 : (~{reg142, (7'h42)}))) ?
                  reg136 : (wire0 ?
                      {wire134[(1'h0):(1'h0)]} : (~|(((8'hb4) != reg137) && (reg142 ?
                          reg137 : reg137)))));
              reg138 <= wire1;
            end
          reg140 <= reg140[(2'h3):(1'h1)];
          reg141 <= $signed(wire0);
          reg142 <= {wire1[(4'ha):(3'h4)], reg143};
        end
      if ($unsigned(reg141[(4'h9):(1'h0)]))
        begin
          reg144 <= ((^reg143) ^ $signed(($signed(reg139) + wire3)));
          reg145 <= reg143;
          if ((+reg140))
            begin
              reg146 <= reg143;
              reg147 <= ((!(~^wire1)) != $unsigned({{(^~reg139),
                      (reg137 != wire1)}}));
            end
          else
            begin
              reg146 <= reg144;
              reg147 <= $signed(reg142);
            end
          reg148 <= ((reg146 != {(wire1[(3'h5):(2'h3)] | (-reg143))}) ?
              wire4 : (^$unsigned(((reg138 ? (7'h44) : wire1) | wire134))));
          if ({$unsigned((8'ha8)),
              {((^(wire2 ? (8'ha3) : reg147)) & ((reg143 ?
                      wire134 : reg148) <<< (reg136 ? reg136 : reg145))),
                  (8'hb9)}})
            begin
              reg149 <= reg146;
              reg150 <= reg142[(4'he):(4'h8)];
              reg151 <= (8'hbe);
            end
          else
            begin
              reg149 <= $signed(wire134);
            end
        end
      else
        begin
          reg144 <= reg150;
          if ((reg148 ? $signed((8'hbb)) : reg142))
            begin
              reg145 <= reg146;
              reg146 <= reg145;
              reg147 <= $signed(reg137);
            end
          else
            begin
              reg145 <= ((wire2 ? {reg138} : reg151[(3'h5):(3'h5)]) ?
                  reg138[(2'h2):(1'h1)] : $signed(wire0));
              reg146 <= ($unsigned((~&reg137[(1'h0):(1'h0)])) - reg141);
              reg147 <= (reg142 ? wire3[(2'h3):(2'h2)] : wire4);
              reg148 <= (8'hb3);
              reg149 <= ({(!$unsigned((reg144 >>> wire3)))} < wire134);
            end
        end
    end
  assign wire152 = $signed((8'haa));
  assign wire153 = reg146[(4'hc):(4'hc)];
  assign wire154 = $unsigned({$unsigned(({reg144} ?
                           $unsigned(reg146) : reg137[(3'h6):(1'h1)]))});
  assign wire155 = $unsigned($unsigned($unsigned($signed($unsigned(wire134)))));
  assign wire156 = reg148[(3'h6):(2'h3)];
  assign wire157 = reg141;
  assign wire158 = ({(wire134[(1'h0):(1'h0)] ^~ (((8'hb5) ?
                               wire3 : wire134) >= ((8'ha0) ?
                               (7'h44) : reg145)))} ?
                       $signed($unsigned($signed((reg143 << wire152)))) : ((&({reg146} ?
                           reg137 : {reg150})) >> wire2));
  module159 #() modinst179 (.wire161(reg148), .wire163(reg149), .y(wire178), .wire162(reg143), .wire160(reg136), .clk(clk));
endmodule

module module159  (y, clk, wire163, wire162, wire161, wire160);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire163;
  input wire [(4'hd):(1'h0)] wire162;
  input wire signed [(5'h12):(1'h0)] wire161;
  input wire [(3'h5):(1'h0)] wire160;
  wire [(5'h10):(1'h0)] wire177;
  wire [(5'h15):(1'h0)] wire176;
  wire signed [(3'h6):(1'h0)] wire175;
  reg signed [(5'h13):(1'h0)] reg174 = (1'h0);
  reg [(3'h4):(1'h0)] reg173 = (1'h0);
  reg [(4'he):(1'h0)] reg172 = (1'h0);
  reg [(4'h9):(1'h0)] reg171 = (1'h0);
  reg signed [(4'he):(1'h0)] reg170 = (1'h0);
  reg [(5'h15):(1'h0)] reg169 = (1'h0);
  reg [(4'hb):(1'h0)] reg168 = (1'h0);
  reg signed [(4'he):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg166 = (1'h0);
  reg [(5'h12):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg164 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire160)
        begin
          if ((wire163 ? wire161 : wire162[(4'hc):(1'h0)]))
            begin
              reg164 <= $unsigned($signed($signed($unsigned((wire163 ?
                  (8'hbd) : wire160)))));
              reg165 <= {(^~wire160), wire160[(2'h2):(1'h1)]};
              reg166 <= reg165[(4'hd):(4'h9)];
              reg167 <= {((^(wire163 ?
                          $unsigned(reg164) : reg166[(2'h3):(2'h2)])) ?
                      (&($signed((8'hb8)) & (~&reg164))) : (reg164 - (~&(wire162 ?
                          wire163 : (8'hae))))),
                  $unsigned(wire160[(2'h3):(2'h3)])};
            end
          else
            begin
              reg164 <= {$signed(($signed(wire160[(3'h4):(3'h4)]) ~^ (wire163 ~^ wire160[(3'h5):(1'h1)]))),
                  (-(reg165 > $signed((reg167 ? wire162 : reg164))))};
              reg165 <= ((!reg167) || $signed((^~reg166[(2'h2):(2'h2)])));
              reg166 <= wire161[(4'he):(4'he)];
              reg167 <= $unsigned($unsigned((((-reg167) ?
                      reg167[(4'he):(3'h7)] : ((8'ha9) ? wire160 : reg167)) ?
                  wire162 : (+(reg166 + reg167)))));
              reg168 <= reg164[(1'h1):(1'h0)];
            end
          if ({$unsigned(((wire162 == $unsigned(reg167)) ?
                  $unsigned(wire163) : reg166[(3'h4):(2'h2)]))})
            begin
              reg169 <= wire163;
            end
          else
            begin
              reg169 <= (+reg166[(2'h2):(1'h0)]);
              reg170 <= (((!($signed(reg166) ?
                      ((8'h9f) ^ wire162) : {reg166})) ?
                  {(~^wire163[(3'h7):(3'h5)]),
                      reg167[(4'he):(4'hd)]} : ((reg169 ?
                          reg167[(4'ha):(2'h2)] : $unsigned(reg165)) ?
                      ((wire160 ? reg166 : wire163) ?
                          (reg166 >= wire163) : $signed(reg164)) : wire161[(3'h6):(1'h1)])) - {$unsigned($signed((~&reg168))),
                  reg168});
              reg171 <= (reg168[(2'h3):(1'h1)] >= reg164);
              reg172 <= (reg165[(1'h1):(1'h0)] ?
                  $unsigned(($signed(((8'ha1) ?
                      reg166 : wire163)) >= reg171)) : (reg170 & {(-{(8'ha7),
                          wire162})}));
            end
          reg173 <= $signed($unsigned(reg164[(2'h3):(2'h3)]));
        end
      else
        begin
          reg164 <= (8'haf);
          reg165 <= $signed(($unsigned(reg170[(2'h2):(1'h0)]) & $signed({(!reg166)})));
        end
      reg174 <= (~&((((reg167 ^~ wire161) >= (reg168 ?
          reg169 : reg164)) > (~{reg172, reg168})) > wire162));
    end
  assign wire175 = (($unsigned({$unsigned(wire163),
                       $unsigned(reg172)}) << (((-reg164) ?
                           (reg174 | reg173) : $unsigned(wire163)) ?
                       (reg164[(3'h5):(3'h5)] ?
                           $unsigned(wire160) : (reg166 ?
                               reg170 : (8'had))) : reg164)) >= $unsigned(((wire160[(2'h3):(2'h2)] ?
                       (-reg173) : reg166[(2'h3):(2'h3)]) & ((~reg172) ?
                       (!wire163) : $unsigned(wire163)))));
  assign wire176 = $signed(reg168[(3'h6):(1'h0)]);
  assign wire177 = ({({(-reg165)} ?
                           reg167 : $signed((^reg171)))} != ($signed((!$signed(reg171))) ?
                       reg170 : $unsigned($signed($signed((8'ha7))))));
endmodule

module module5
#(parameter param133 = ((+(((~&(8'ha4)) ? ((8'hb1) ? (8'hbb) : (8'hbe)) : (&(8'hb4))) + ({(8'ha4), (8'hbb)} <= ((8'ha1) + (8'ha6))))) ? (+(+(((8'hbf) - (8'hbc)) ? {(8'ha0)} : {(7'h43)}))) : (-(&(((8'ha6) ? (8'ha1) : (8'ha1)) >= ((8'hbd) * (8'hbb)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire132;
  wire signed [(4'h9):(1'h0)] wire121;
  wire signed [(4'hb):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire71;
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(2'h2):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  assign y = {wire132,
                 wire121,
                 wire119,
                 wire84,
                 wire83,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire71,
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
                 reg82,
                 (1'h0)};
  module10 #() modinst72 (.wire12(wire9), .y(wire71), .clk(clk), .wire11(wire6), .wire13(wire7), .wire14(wire8));
  assign wire73 = wire9[(3'h4):(2'h2)];
  assign wire74 = $unsigned($unsigned($signed(wire71)));
  assign wire75 = (({{$unsigned(wire6), $unsigned(wire9)},
                          wire71[(1'h0):(1'h0)]} ?
                      wire74[(4'ha):(3'h4)] : wire71) && $signed(wire6[(2'h2):(1'h1)]));
  assign wire76 = $signed((8'hb3));
  assign wire77 = (wire75[(3'h4):(2'h2)] ?
                      ({($unsigned(wire6) ? wire75 : ((7'h42) >= wire73)),
                              {$unsigned(wire7)}} ?
                          (8'ha6) : wire6[(4'hb):(1'h0)]) : wire7[(3'h5):(2'h2)]);
  assign wire78 = $unsigned((^wire74));
  assign wire79 = $signed(wire71);
  assign wire80 = (wire7[(1'h0):(1'h0)] ?
                      ($unsigned((8'hb2)) ?
                          wire9[(5'h10):(1'h0)] : ((8'ha1) < ((wire76 > wire6) != {(8'hb2)}))) : wire6[(2'h2):(1'h0)]);
  assign wire81 = (~|(wire77 > $unsigned((-(&wire78)))));
  always
    @(posedge clk) begin
      reg82 <= ($unsigned((((wire7 <= wire71) == wire73[(3'h5):(1'h0)]) ^ $unsigned({wire79,
          wire6}))) + ((wire80[(2'h3):(2'h3)] & wire9) <= (((wire74 ?
                  wire81 : wire8) ?
              (wire81 ? wire73 : wire80) : wire78) ?
          {(8'ha6), wire77} : {(wire80 ? wire7 : wire9), $unsigned(wire73)})));
    end
  assign wire83 = $unsigned(wire77[(2'h3):(2'h3)]);
  assign wire84 = (wire7[(3'h4):(1'h0)] ^~ (($signed((+wire80)) ?
                          $unsigned(wire76[(1'h1):(1'h0)]) : wire80[(2'h2):(1'h0)]) ?
                      $signed(wire73[(1'h0):(1'h0)]) : (wire80 + $signed((~|wire79)))));
  module85 #() modinst120 (wire119, clk, wire74, wire76, wire73, wire81);
  assign wire121 = {$unsigned((({(8'h9c)} ?
                               ((8'hbb) ?
                                   wire83 : wire76) : wire75[(4'h9):(2'h2)]) ?
                           $signed((&(7'h44))) : (~^$signed(wire76)))),
                       $signed(wire77)};
  always
    @(posedge clk) begin
      reg122 <= wire76[(1'h0):(1'h0)];
      reg123 <= $signed(((($signed(wire78) != (|(8'hba))) ?
              (~$unsigned((8'ha6))) : {$signed(wire73), wire80}) ?
          $unsigned(wire7[(2'h2):(1'h1)]) : reg122));
      if ($signed(((((wire80 ~^ wire74) ~^ {wire83}) < wire80) >= ({(~^wire75)} ?
          $unsigned($unsigned(reg123)) : $signed((^wire7))))))
        begin
          reg124 <= $signed($signed((~&(-(|(7'h42))))));
          if (reg82)
            begin
              reg125 <= ($unsigned((wire80 ?
                      wire9[(4'hc):(4'h8)] : wire119[(4'ha):(3'h7)])) ?
                  reg122 : {((^$unsigned(wire119)) ^~ (reg122[(1'h1):(1'h0)] ?
                          wire83[(1'h1):(1'h1)] : ((8'hb8) ?
                              wire75 : wire121)))});
              reg126 <= wire78[(3'h4):(2'h2)];
              reg127 <= $signed(({$unsigned((^~wire77)),
                      (~&reg126[(3'h7):(3'h7)])} ?
                  ({reg123[(1'h0):(1'h0)],
                      {reg122, reg125}} ~^ wire8) : (~&(((7'h40) >>> wire74) ?
                      (+wire7) : wire8))));
            end
          else
            begin
              reg125 <= $unsigned({wire81[(3'h6):(2'h2)],
                  (reg123 && {$signed((8'ha5)), (-wire75)})});
              reg126 <= $unsigned($unsigned((&$unsigned(wire74[(3'h4):(1'h1)]))));
              reg127 <= ((wire83[(2'h2):(2'h2)] ?
                  (~|(^$signed(wire8))) : {$unsigned((reg124 ? reg123 : wire6)),
                      reg123}) == wire75[(4'h8):(3'h4)]);
            end
          reg128 <= $unsigned((8'ha7));
          if ((!(8'h9e)))
            begin
              reg129 <= wire83;
              reg130 <= (wire9 ? (^wire73) : reg124);
              reg131 <= $unsigned($unsigned((reg127 ?
                  ((~&wire76) ?
                      {wire78} : (wire79 ? (8'ha5) : (8'ha8))) : wire73)));
            end
          else
            begin
              reg129 <= reg126;
              reg130 <= (+{((wire78 >> $unsigned((8'hb7))) ?
                      wire71[(4'h8):(4'h8)] : $unsigned((wire84 ?
                          (8'ha4) : reg122)))});
            end
        end
      else
        begin
          reg124 <= $unsigned($unsigned($unsigned(reg126)));
          reg125 <= {wire121,
              $signed(({(reg123 >>> reg122), $unsigned((8'hb9))} ?
                  (~&(reg125 || reg131)) : $signed($unsigned(wire81))))};
        end
    end
  assign wire132 = (((~&((-reg129) && wire80[(2'h2):(1'h1)])) ?
                       ($signed(reg127[(4'h8):(1'h1)]) ?
                           (+wire8) : ($signed((7'h44)) ?
                               (-wire79) : (wire7 ?
                                   wire78 : wire6))) : $unsigned(reg128[(1'h0):(1'h0)])) || reg131);
endmodule

module module85  (y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire89;
  input wire [(5'h14):(1'h0)] wire88;
  input wire [(4'hc):(1'h0)] wire87;
  input wire [(3'h6):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire118;
  wire [(2'h2):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire114;
  wire signed [(4'hb):(1'h0)] wire113;
  wire signed [(4'hd):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire90;
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire90,
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
                 reg101,
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
                 (1'h0)};
  assign wire90 = $signed(wire89);
  always
    @(posedge clk) begin
      if (wire89[(1'h1):(1'h1)])
        begin
          if ((^(~&$signed({$unsigned(wire86)}))))
            begin
              reg91 <= $signed(((~|$signed($unsigned(wire86))) >> $unsigned((wire86 ?
                  $unsigned((8'haa)) : {wire87, (8'ha9)}))));
            end
          else
            begin
              reg91 <= wire90;
              reg92 <= (|(($unsigned((wire87 ? reg91 : reg91)) ?
                  wire90[(4'h8):(3'h5)] : $unsigned({(8'hba)})) <= {((+wire89) >> wire86[(2'h3):(2'h3)]),
                  (|(wire88 && reg91))}));
            end
        end
      else
        begin
          reg91 <= (8'h9c);
          if (($unsigned((&$unsigned($signed(wire87)))) ?
              reg92[(2'h3):(2'h2)] : reg91))
            begin
              reg92 <= ({wire88} ?
                  reg91 : (^{($unsigned((8'ha8)) ? (^~wire88) : wire90),
                      {(wire87 << reg92)}}));
              reg93 <= (+wire86);
              reg94 <= (|(reg93[(2'h3):(1'h0)] == (wire86 ?
                  reg93[(2'h2):(1'h0)] : reg92)));
              reg95 <= $unsigned(reg93[(1'h1):(1'h0)]);
              reg96 <= wire88;
            end
          else
            begin
              reg92 <= ((!(wire87 ?
                  $signed($signed(reg92)) : {(wire89 ^~ wire90)})) ^~ ((($unsigned(reg96) ?
                      $signed(wire86) : (reg92 && wire86)) ?
                  ((|wire89) ?
                      reg94 : (~^reg95)) : (8'hb6)) && ($signed(reg93[(2'h3):(2'h2)]) && (+(reg95 ?
                  wire88 : reg92)))));
            end
          if (wire87[(4'h8):(2'h2)])
            begin
              reg97 <= $unsigned(wire87[(2'h2):(1'h1)]);
              reg98 <= wire89;
              reg99 <= ((8'hba) ^~ (~^$signed($signed(reg91[(1'h0):(1'h0)]))));
              reg100 <= $signed({wire86});
            end
          else
            begin
              reg97 <= (|reg93);
              reg98 <= reg95[(3'h4):(3'h4)];
              reg99 <= (~|(reg97 ? {wire88, wire86} : (~^reg96)));
              reg100 <= reg99;
            end
          if (wire87)
            begin
              reg101 <= reg94[(4'hf):(2'h3)];
              reg102 <= reg97[(4'h8):(3'h5)];
              reg103 <= reg98[(1'h0):(1'h0)];
              reg104 <= wire90[(3'h4):(1'h0)];
            end
          else
            begin
              reg101 <= ((~reg101) ? reg98 : reg101[(3'h5):(2'h3)]);
              reg102 <= (!$unsigned($unsigned(reg103[(2'h3):(1'h1)])));
              reg103 <= reg95[(1'h1):(1'h1)];
              reg104 <= $signed($signed(reg102[(1'h0):(1'h0)]));
            end
        end
      reg105 <= (~$signed($signed({((8'ha6) ? wire89 : reg98),
          $unsigned(reg102)})));
      reg106 <= (-$signed(($unsigned($signed(reg91)) ?
          $signed($unsigned(reg94)) : (-(reg103 >= (8'hbb))))));
      if ((&reg95[(2'h3):(2'h2)]))
        begin
          reg107 <= $unsigned((|(8'hbc)));
          reg108 <= $signed(($signed((8'ha9)) < (reg94 && ({reg105} | (reg98 ?
              reg98 : reg92)))));
        end
      else
        begin
          if (($signed((wire87[(4'h8):(3'h4)] ? $signed(reg94) : reg92)) ?
              (|(({reg105} ? {wire86} : (reg106 ? reg107 : (8'hb9))) ?
                  ($unsigned(wire86) ?
                      $unsigned(reg101) : (reg92 ?
                          reg99 : reg95)) : reg94)) : (wire89 ?
                  (reg96[(1'h0):(1'h0)] ^~ ($signed((8'hb4)) ?
                      (&reg104) : reg104)) : $unsigned(((~|reg91) == (reg97 ?
                      reg93 : reg99))))))
            begin
              reg107 <= $signed($signed((|$signed(reg94[(4'hc):(4'h9)]))));
            end
          else
            begin
              reg107 <= $signed(((~^$signed({reg91})) * {reg104[(4'hf):(3'h7)],
                  $unsigned((~^wire87))}));
              reg108 <= ($unsigned((reg102 ?
                  $unsigned($unsigned(reg91)) : ((~wire86) ?
                      reg107[(2'h3):(1'h1)] : (reg100 << reg95)))) || reg97[(3'h6):(3'h4)]);
              reg109 <= $unsigned(((8'ha6) >= wire86));
              reg110 <= $unsigned(reg107[(1'h1):(1'h0)]);
              reg111 <= (reg98 > $signed(reg99[(2'h2):(2'h2)]));
            end
        end
    end
  assign wire112 = $signed(($signed($signed($unsigned((8'hbc)))) ^ reg97));
  assign wire113 = reg92;
  assign wire114 = {((+reg94[(3'h6):(2'h3)]) != (8'hac)),
                       (^~$signed(((~^wire88) >= (8'had))))};
  assign wire115 = wire90[(4'hc):(1'h1)];
  assign wire116 = (~^{{(|(reg95 ? reg97 : (8'ha1)))},
                       $unsigned($signed($unsigned(wire114)))});
  assign wire117 = $unsigned(($unsigned(wire116) ?
                       (&wire116[(3'h6):(3'h6)]) : (wire114 * reg95[(3'h4):(2'h3)])));
  assign wire118 = ((wire88[(5'h12):(5'h10)] == wire88[(4'hc):(4'h9)]) * wire117[(2'h2):(1'h1)]);
endmodule

module module10
#(parameter param70 = (~(~|((|{(8'hbe), (8'haf)}) & (|((8'hbd) ? (8'hbf) : (8'hb8)))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h26b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire14;
  input wire [(4'ha):(1'h0)] wire13;
  input wire signed [(3'h5):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire48,
                 wire47,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
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
                 reg49,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
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
                 (1'h0)};
  assign wire15 = ($unsigned((((^wire12) < wire13[(1'h1):(1'h1)]) || $signed(wire12[(1'h1):(1'h1)]))) ?
                      ((|$signed(wire12[(1'h1):(1'h0)])) + $unsigned($unsigned({(8'hb5),
                          (8'ha9)}))) : $unsigned(wire13[(3'h4):(3'h4)]));
  assign wire16 = $unsigned({(wire12 && $signed(wire13[(1'h1):(1'h0)])),
                      wire11[(4'ha):(3'h4)]});
  assign wire17 = $unsigned(wire13[(3'h5):(2'h2)]);
  assign wire18 = ($unsigned($signed(({wire11, (8'hae)} ?
                          (wire13 ?
                              wire15 : wire12) : wire13[(3'h5):(1'h1)]))) ?
                      wire12 : (~&$signed(((^wire17) ?
                          (wire11 ? wire13 : wire17) : ((8'hb4) ?
                              (8'ha1) : wire17)))));
  always
    @(posedge clk) begin
      reg19 <= (!wire17);
      if ((~^(&$signed((|{wire14, wire18})))))
        begin
          reg20 <= wire11;
          reg21 <= wire17;
          reg22 <= (8'hbf);
        end
      else
        begin
          reg20 <= $unsigned(wire14[(4'h9):(2'h2)]);
          reg21 <= ($unsigned((($unsigned(reg22) ?
                  reg21 : wire13) || wire14[(4'ha):(2'h3)])) ?
              $unsigned((+$unsigned($unsigned(wire12)))) : $unsigned(reg19));
        end
      reg23 <= ($unsigned((($unsigned(wire16) & reg22) ?
              (wire12[(1'h0):(1'h0)] ?
                  $signed(reg22) : $signed(wire17)) : wire15[(2'h2):(1'h1)])) ?
          (+(!wire15[(3'h4):(1'h0)])) : $signed($unsigned($unsigned(wire18))));
      if ($unsigned(wire17))
        begin
          reg24 <= wire11[(4'hd):(2'h2)];
          reg25 <= $signed((~|$unsigned(({wire17,
              wire14} * $unsigned(reg22)))));
          reg26 <= $unsigned((|({$unsigned(wire17)} || {wire11, wire12})));
          reg27 <= wire17[(4'h9):(2'h2)];
          reg28 <= ($unsigned(wire11[(2'h2):(2'h2)]) <= (reg27 ?
              (^(^(reg21 ? reg27 : reg25))) : {reg19}));
        end
      else
        begin
          if ((wire12 > wire14))
            begin
              reg24 <= wire14;
            end
          else
            begin
              reg24 <= (reg27 ^ wire12);
              reg25 <= reg24;
              reg26 <= (({(reg22 + reg26)} << $signed(wire12)) << wire18[(4'h9):(1'h0)]);
              reg27 <= reg28;
            end
          reg28 <= reg25[(1'h1):(1'h0)];
          reg29 <= (~^wire13);
          reg30 <= ($unsigned({({reg20} ?
                      $unsigned((8'ha0)) : $unsigned(wire16))}) ?
              $unsigned($signed(({wire11, wire15} ?
                  (8'hb8) : $signed(wire17)))) : $unsigned($signed((reg24[(1'h0):(1'h0)] + wire17))));
        end
    end
  assign wire31 = reg23[(3'h7):(3'h5)];
  assign wire32 = reg27;
  assign wire33 = reg21;
  assign wire34 = (($signed(wire14[(2'h3):(2'h3)]) ?
                          $unsigned(((&reg20) <<< $unsigned(wire18))) : wire13[(1'h1):(1'h0)]) ?
                      ($signed(wire18) > wire18[(4'h8):(4'h8)]) : $signed($signed({(&wire16),
                          $signed(wire14)})));
  always
    @(posedge clk) begin
      if ((((&(~reg30[(4'h9):(1'h1)])) <= (~&wire18)) ?
          (~|(+{(^reg25), {reg30, wire13}})) : reg27))
        begin
          reg35 <= wire32;
          reg36 <= reg30[(1'h0):(1'h0)];
          reg37 <= $unsigned(($signed(((wire12 ? wire13 : reg21) ?
              $signed(reg25) : wire31)) <<< (+((wire33 ? reg20 : (8'ha2)) ?
              reg24 : reg25))));
          reg38 <= (wire31[(3'h7):(3'h5)] || ($unsigned(wire16) < $unsigned((~|wire16[(4'h9):(1'h1)]))));
        end
      else
        begin
          reg35 <= (|$unsigned(wire11));
          if ($signed({wire32}))
            begin
              reg36 <= (~&$unsigned({wire13[(4'h9):(1'h1)]}));
              reg37 <= $unsigned($unsigned($unsigned(($unsigned(wire31) ^~ reg24[(3'h4):(1'h0)]))));
              reg38 <= $unsigned((reg35[(3'h4):(1'h1)] ?
                  reg26 : reg27[(2'h2):(2'h2)]));
              reg39 <= ({$signed(((wire34 ? reg26 : reg30) ?
                      reg36 : reg23[(1'h1):(1'h1)]))} | wire14);
            end
          else
            begin
              reg36 <= reg39;
              reg37 <= (&((^$signed($unsigned(wire12))) ?
                  (~&(reg27 ?
                      $signed(reg35) : reg27[(1'h1):(1'h0)])) : (8'h9d)));
              reg38 <= reg26[(2'h3):(1'h0)];
            end
        end
      reg40 <= $unsigned($signed((~wire14[(3'h7):(3'h4)])));
      reg41 <= reg21;
      if (wire32)
        begin
          reg42 <= (((((7'h40) << $unsigned(reg19)) | $unsigned($unsigned(wire33))) ~^ ((reg20[(4'hc):(3'h4)] + reg20) || (^wire17[(2'h2):(1'h0)]))) & ({{$unsigned(reg20),
                  reg41[(2'h2):(1'h1)]},
              $signed(reg27[(2'h2):(1'h1)])} >>> $unsigned(((7'h41) ?
              $signed(wire33) : (reg24 ? reg38 : (8'haa))))));
          if ((^(~^$signed(reg23))))
            begin
              reg43 <= (~|((~{reg42[(2'h3):(2'h2)]}) ?
                  $signed((wire12[(2'h2):(2'h2)] > (reg28 ?
                      wire12 : reg26))) : $unsigned($signed((|(8'h9c))))));
              reg44 <= $unsigned((wire14[(1'h1):(1'h1)] - $signed($signed((reg27 ?
                  reg30 : wire33)))));
              reg45 <= wire15;
              reg46 <= $unsigned(wire12[(3'h5):(2'h3)]);
            end
          else
            begin
              reg43 <= {reg37,
                  $unsigned($unsigned(($unsigned((8'h9f)) << reg22)))};
              reg44 <= $unsigned(reg24[(2'h2):(1'h0)]);
            end
        end
      else
        begin
          reg42 <= $unsigned(((|($unsigned(wire11) >>> {reg38,
              reg41})) != reg40[(4'hb):(2'h3)]));
        end
    end
  assign wire47 = ((({((8'ha4) ? reg41 : reg29), reg23} ?
                          $unsigned($signed(reg19)) : $unsigned(reg29[(1'h0):(1'h0)])) ?
                      $signed(((^~wire17) ?
                          ((8'hb4) ~^ reg35) : (~wire14))) : ($unsigned((8'ha3)) ^~ ((!reg38) ?
                          wire15 : $signed(wire32)))) <<< ($unsigned(reg40[(4'he):(3'h6)]) >= (|$unsigned($signed(reg36)))));
  assign wire48 = (wire17 << $unsigned($signed(reg28)));
  always
    @(posedge clk) begin
      reg49 <= $signed(((~|reg24) >>> {reg40[(4'hb):(2'h2)]}));
      if ({$signed({reg45})})
        begin
          reg50 <= wire15;
          reg51 <= $signed(($unsigned((+(8'hb7))) ~^ ({$unsigned(reg40)} ?
              (!{reg45, reg42}) : reg46[(2'h3):(1'h1)])));
          reg52 <= reg30;
          reg53 <= $signed((7'h44));
          if ((($unsigned(reg46) + $signed(((&reg50) ?
                  $unsigned(wire12) : $signed((8'hb7))))) ?
              (-$signed($unsigned($signed(reg30)))) : (^~$unsigned((reg53 ?
                  $unsigned(wire31) : reg44[(4'h9):(4'h9)])))))
            begin
              reg54 <= ({$signed((!$signed(wire13))),
                  {$unsigned(reg46),
                      wire47[(3'h5):(1'h0)]}} + (~|((~&$unsigned(wire47)) >> (8'h9d))));
              reg55 <= reg35;
              reg56 <= reg26;
            end
          else
            begin
              reg54 <= ($unsigned((|reg35)) * ($signed(reg42[(4'h9):(3'h5)]) ?
                  ($signed((|(8'hbc))) == (wire11[(3'h5):(3'h5)] ?
                      $unsigned(reg56) : (reg45 ?
                          wire14 : reg54))) : $unsigned(($signed(wire34) ?
                      reg52[(4'hb):(4'hb)] : $signed(reg36)))));
              reg55 <= reg54;
              reg56 <= $signed($signed((^~wire47)));
              reg57 <= (({$signed($signed(reg39))} ?
                      (reg27 * $signed((reg28 >= reg37))) : reg25) ?
                  reg28[(3'h4):(1'h0)] : reg46);
            end
        end
      else
        begin
          reg50 <= (($signed((8'ha4)) ?
                  (^$unsigned(wire17)) : (($signed(reg39) < $signed(wire13)) < reg41)) ?
              ((wire16[(3'h5):(3'h4)] ?
                  $unsigned($unsigned(wire18)) : ((+wire48) ?
                      reg57[(4'hb):(2'h2)] : (8'hb3))) < (|$signed((!reg27)))) : {$signed(reg45[(4'hb):(4'hb)])});
        end
      reg58 <= (reg30[(2'h2):(1'h0)] ?
          $signed((~&(^$unsigned(wire34)))) : {reg45});
      if (reg36[(2'h3):(2'h3)])
        begin
          reg59 <= (!{$unsigned({(reg28 ? (8'ha3) : reg42), reg51}),
              reg23[(3'h5):(1'h0)]});
          reg60 <= ((~reg20) == reg50[(1'h1):(1'h1)]);
          if ((~(($signed((reg46 <<< reg49)) ?
              ((~^(7'h43)) & $unsigned(wire47)) : $unsigned((~&wire14))) <= ($unsigned($unsigned(reg54)) ?
              (!(8'hac)) : reg22[(1'h0):(1'h0)]))))
            begin
              reg61 <= reg60;
            end
          else
            begin
              reg61 <= (8'hbe);
              reg62 <= $signed({reg28, wire32});
            end
        end
      else
        begin
          reg59 <= (-wire32);
        end
    end
  assign wire63 = reg50;
  assign wire64 = $unsigned($unsigned((($signed(wire33) ?
                          ((8'hb6) ? reg25 : reg56) : $unsigned((8'ha3))) ?
                      ($unsigned(wire32) | (~(8'ha8))) : reg53)));
  assign wire65 = wire64;
  assign wire66 = reg26;
  assign wire67 = reg38[(1'h0):(1'h0)];
  assign wire68 = $signed($signed((8'haf)));
  assign wire69 = ({((^~$unsigned(wire48)) ?
                              $unsigned((reg36 ? reg51 : reg62)) : reg45)} ?
                      {(~|wire64)} : $signed(wire66));
endmodule
