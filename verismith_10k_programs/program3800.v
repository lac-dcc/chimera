module top
#(parameter param201 = (8'hb3), 
parameter param202 = ((+(param201 ? (-(param201 ? param201 : param201)) : (param201 ? (param201 ? param201 : param201) : (param201 ? param201 : param201)))) ? (param201 ? ({(~param201), (~^param201)} != (8'hbd)) : param201) : ((^~(param201 & (param201 >= param201))) ? (7'h43) : {param201, param201})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire200;
  wire [(4'hb):(1'h0)] wire199;
  wire signed [(5'h12):(1'h0)] wire198;
  wire signed [(4'hf):(1'h0)] wire197;
  wire signed [(5'h10):(1'h0)] wire196;
  wire signed [(3'h6):(1'h0)] wire195;
  wire [(4'hf):(1'h0)] wire194;
  wire signed [(4'hd):(1'h0)] wire193;
  wire signed [(2'h3):(1'h0)] wire192;
  wire [(3'h6):(1'h0)] wire191;
  wire [(3'h6):(1'h0)] wire177;
  wire [(4'ha):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire165;
  reg signed [(4'hd):(1'h0)] reg190 = (1'h0);
  reg [(3'h4):(1'h0)] reg189 = (1'h0);
  reg [(4'ha):(1'h0)] reg188 = (1'h0);
  reg [(3'h6):(1'h0)] reg187 = (1'h0);
  reg [(2'h2):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg185 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg179 = (1'h0);
  reg [(3'h7):(1'h0)] reg178 = (1'h0);
  reg [(3'h5):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg172 = (1'h0);
  reg [(5'h15):(1'h0)] reg171 = (1'h0);
  reg [(3'h5):(1'h0)] reg170 = (1'h0);
  reg [(4'hd):(1'h0)] reg169 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg168 = (1'h0);
  reg signed [(4'he):(1'h0)] reg167 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire177,
                 wire84,
                 wire86,
                 wire165,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  module5 #() modinst85 (wire84, clk, wire0, wire1, wire3, wire2);
  assign wire86 = $signed((wire1 ?
                      wire4[(1'h1):(1'h1)] : $signed((wire2[(4'hd):(3'h5)] ?
                          $unsigned(wire3) : (wire1 ? wire84 : wire2)))));
  module87 #() modinst166 (wire165, clk, wire0, wire84, wire1, wire86, wire3);
  always
    @(posedge clk) begin
      reg167 <= $unsigned(wire0[(3'h6):(3'h6)]);
      reg168 <= wire84;
      reg169 <= reg167[(4'ha):(2'h3)];
      if ($unsigned($signed((+($unsigned(wire86) | (wire86 & wire4))))))
        begin
          reg170 <= $unsigned(wire1[(4'he):(3'h5)]);
          if ({$unsigned(wire4[(2'h2):(1'h1)])})
            begin
              reg171 <= (($unsigned($unsigned(reg169[(4'hc):(3'h6)])) ?
                      $unsigned(((reg168 >>> wire4) ?
                          wire3[(1'h1):(1'h0)] : wire4[(2'h2):(1'h1)])) : {((-wire165) && (|(7'h43)))}) ?
                  ((~$unsigned(wire165)) * (7'h41)) : wire0[(3'h5):(1'h1)]);
              reg172 <= wire84;
              reg173 <= (wire2 ?
                  wire3[(5'h15):(4'he)] : {$signed(((reg171 ?
                          wire4 : (7'h42)) >> ((8'ha6) ? reg167 : reg170))),
                      $signed($unsigned($signed(wire2)))});
              reg174 <= wire3[(4'hf):(4'he)];
              reg175 <= $signed(reg173);
            end
          else
            begin
              reg171 <= $unsigned($signed(reg168[(4'h9):(3'h6)]));
              reg172 <= {(8'ha7), (^~$signed(wire1[(3'h4):(2'h3)]))};
              reg173 <= $unsigned(($signed(($signed(reg174) ?
                  (8'ha3) : wire3[(3'h5):(1'h0)])) + (reg170[(3'h5):(1'h1)] ^~ reg171[(4'ha):(3'h7)])));
            end
          reg176 <= ($signed($unsigned((((8'hba) - wire86) >> reg175[(4'h8):(3'h5)]))) + reg175);
        end
      else
        begin
          if ($signed((($signed($signed(reg172)) ?
              ($unsigned(reg175) ?
                  $signed(wire1) : (reg176 < wire3)) : ($signed(wire0) ?
                  reg167 : (wire165 <<< wire2))) <= reg172[(2'h2):(1'h0)])))
            begin
              reg170 <= $unsigned((reg170[(3'h5):(2'h3)] ?
                  $signed($signed((reg167 ^ wire86))) : $signed(($signed((8'ha2)) && reg172[(2'h2):(1'h1)]))));
              reg171 <= reg172[(2'h2):(2'h2)];
              reg172 <= ($signed($unsigned(((wire0 ?
                      reg168 : (8'hbe)) >> (wire165 ? reg174 : reg170)))) ?
                  ($signed(reg173[(1'h0):(1'h0)]) ?
                      (8'hbb) : (wire1 ?
                          reg172 : reg168[(3'h7):(3'h7)])) : (reg169 ~^ {(~|(8'hbf)),
                      ((+reg167) < $signed(wire1))}));
              reg173 <= wire4[(2'h2):(1'h0)];
              reg174 <= reg168[(3'h6):(1'h1)];
            end
          else
            begin
              reg170 <= {((|(wire1 ? wire4 : reg172[(2'h3):(2'h2)])) ?
                      (^~({reg170} << wire86[(3'h6):(1'h1)])) : $signed(reg173))};
              reg171 <= {(&$signed(wire4)), wire4};
              reg172 <= $signed(reg168);
              reg173 <= ($unsigned(reg169) ^~ $unsigned(reg170));
            end
        end
    end
  assign wire177 = (~(reg169 ?
                       ($unsigned((wire2 ? wire1 : wire0)) ?
                           $signed($signed(wire1)) : reg169) : (^$signed({reg172,
                           (8'ha1)}))));
  always
    @(posedge clk) begin
      reg178 <= reg169;
      reg179 <= $signed(({wire165[(3'h5):(3'h4)]} != $signed($unsigned(wire165))));
      if ((~reg167[(3'h6):(1'h1)]))
        begin
          reg180 <= (-reg172[(3'h4):(2'h3)]);
          if ($signed({((!reg173[(1'h0):(1'h0)]) ?
                  wire3[(3'h7):(3'h6)] : ($unsigned(wire84) ?
                      reg171 : {(8'hb4), (8'ha8)})),
              {{wire0, $signed(wire1)}}}))
            begin
              reg181 <= ($unsigned(reg169[(3'h6):(2'h3)]) << ({(wire2 ?
                          ((8'hb9) || reg170) : (8'hab))} ?
                  $unsigned($unsigned({wire4})) : (~$signed({reg179}))));
              reg182 <= wire177[(1'h0):(1'h0)];
              reg183 <= $signed(((+reg171) ?
                  $signed(($signed(wire165) ?
                      $unsigned(reg168) : wire177)) : ($signed((wire1 == (8'ha1))) | {$signed(wire84)})));
            end
          else
            begin
              reg181 <= (-(8'hbb));
            end
          reg184 <= (((8'ha5) ?
                  (^{(reg183 >> reg174),
                      $signed(wire2)}) : $unsigned($signed((reg173 ?
                      reg183 : wire2)))) ?
              wire4 : wire0[(3'h4):(3'h4)]);
          reg185 <= ((~^wire165) << $unsigned(wire165[(2'h3):(1'h1)]));
          reg186 <= $unsigned($signed(reg167));
        end
      else
        begin
          reg180 <= (&reg173);
          if ($unsigned(reg186))
            begin
              reg181 <= (+$signed(reg184[(1'h1):(1'h0)]));
              reg182 <= $signed($signed(($signed(reg175[(3'h7):(1'h1)]) ?
                  (~$signed(reg185)) : ({reg174,
                      reg175} ~^ wire3[(4'hc):(3'h6)]))));
              reg183 <= ($unsigned(wire4) < $unsigned((!reg173)));
            end
          else
            begin
              reg181 <= (((&(~|(reg169 - reg176))) ?
                      (~|((|wire4) ?
                          {reg174, (8'hb2)} : (reg178 ?
                              reg167 : reg168))) : ((wire4 ?
                              (reg181 * (8'had)) : (wire165 > wire1)) ?
                          (~reg173[(1'h0):(1'h0)]) : reg184[(4'h8):(3'h4)])) ?
                  reg183 : $unsigned($unsigned(((~&reg180) ?
                      reg168 : (reg172 * reg179)))));
            end
          if ($signed((8'hbe)))
            begin
              reg184 <= wire0;
              reg185 <= (reg167 == $signed($signed({$unsigned(reg184)})));
              reg186 <= reg183;
            end
          else
            begin
              reg184 <= {(+wire2)};
              reg185 <= ($unsigned(reg171[(2'h2):(1'h1)]) ?
                  $signed((wire165 ?
                      ($signed((8'ha7)) ?
                          $signed(reg171) : (wire84 ?
                              reg174 : wire165)) : (reg185[(3'h6):(1'h1)] ?
                          $signed(wire84) : wire0))) : {$signed(((+reg181) ?
                          reg173 : $signed(reg186)))});
              reg186 <= $unsigned((&$unsigned(reg183[(2'h2):(1'h1)])));
              reg187 <= reg167[(1'h1):(1'h0)];
              reg188 <= {reg172, wire2};
            end
          reg189 <= ({(|$signed((-reg181)))} ?
              (&(reg175 ?
                  wire4 : $signed($signed(reg188)))) : reg174[(1'h0):(1'h0)]);
        end
      reg190 <= $unsigned($signed((((reg179 <= reg182) ~^ (wire84 ?
          reg181 : wire177)) == $unsigned($unsigned(wire165)))));
    end
  assign wire191 = {(wire2 <<< $unsigned(wire3[(4'hb):(1'h0)])),
                       ((&reg171) + {$unsigned((reg188 & (8'hbc))),
                           wire2[(3'h6):(1'h0)]})};
  assign wire192 = (^~{(!({(7'h41), wire84} ?
                           {reg170, reg187} : $signed((8'hb5)))),
                       ((~^reg179) <<< $unsigned(wire4))});
  assign wire193 = (8'ha5);
  assign wire194 = reg188;
  assign wire195 = $signed((((-wire165[(3'h6):(3'h5)]) ?
                       (((8'ha8) || (8'ha6)) ?
                           (~&wire4) : reg172) : ((wire194 || reg180) || reg171)) <<< {reg186}));
  assign wire196 = $signed((+$signed(reg185[(3'h4):(1'h0)])));
  assign wire197 = (({((~reg185) & (reg185 ? reg187 : reg190))} ?
                           ($signed(((7'h40) << reg176)) || $signed(reg186[(2'h2):(2'h2)])) : (($unsigned(wire196) ?
                                   reg169[(4'h8):(4'h8)] : $unsigned((8'ha1))) ?
                               wire191 : reg176[(3'h4):(2'h2)])) ?
                       reg174[(3'h6):(3'h4)] : $unsigned(wire4));
  assign wire198 = ($unsigned((reg181[(3'h6):(2'h3)] ?
                           {$signed(reg174),
                               reg185} : $signed($signed(reg168)))) ?
                       $signed((-$unsigned(reg174[(1'h1):(1'h0)]))) : (wire3 >> (8'ha9)));
  assign wire199 = reg185;
  assign wire200 = (~(8'ha5));
endmodule

module module87
#(parameter param164 = {(~(((~^(8'haa)) ~^ (-(8'ha2))) ? (~{(8'hb3)}) : (((8'hba) >> (8'ha5)) ? {(8'hbf), (7'h44)} : ((8'ha9) != (8'h9e))))), {(~(+((7'h44) <<< (8'ha9))))}})
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire92;
  input wire [(4'ha):(1'h0)] wire91;
  input wire signed [(5'h12):(1'h0)] wire90;
  input wire signed [(4'hd):(1'h0)] wire89;
  input wire [(4'hd):(1'h0)] wire88;
  wire [(3'h5):(1'h0)] wire163;
  wire [(5'h10):(1'h0)] wire135;
  wire [(4'h9):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire99;
  wire signed [(4'hb):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire96;
  wire [(3'h4):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire93;
  reg signed [(5'h15):(1'h0)] reg162 = (1'h0);
  reg signed [(4'he):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg [(3'h7):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg156 = (1'h0);
  reg [(3'h5):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg [(2'h3):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(5'h12):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg137 = (1'h0);
  assign y = {wire163,
                 wire135,
                 wire112,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
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
                 (1'h0)};
  assign wire93 = ((^~{$signed((^wire89))}) >>> (wire92[(4'ha):(2'h2)] ?
                      $signed((~^(~wire91))) : $unsigned((((8'hb3) ?
                          (8'h9e) : wire88) & wire91[(3'h6):(1'h0)]))));
  assign wire94 = $signed(((~|($signed(wire91) && wire90)) ?
                      (^($unsigned(wire91) ?
                          wire88[(2'h3):(2'h3)] : (wire90 | wire88))) : {((wire92 ?
                                  wire93 : wire88) ?
                              wire92 : (~|wire92))}));
  assign wire95 = (8'ha2);
  assign wire96 = ((8'hae) | (+$signed(wire91)));
  assign wire97 = $unsigned({($signed(wire92[(5'h10):(2'h3)]) == (+$signed(wire93)))});
  assign wire98 = (!((^~$unsigned(wire95)) ?
                      wire91[(3'h7):(3'h5)] : $signed(($unsigned((8'hbc)) ?
                          (wire94 >= wire91) : (wire95 >> wire96)))));
  assign wire99 = wire93[(1'h1):(1'h1)];
  module100 #() modinst113 (.wire103(wire97), .y(wire112), .wire102(wire88), .wire101(wire94), .clk(clk), .wire104(wire89));
  module114 #() modinst136 (wire135, clk, wire98, wire99, wire90, wire96);
  always
    @(posedge clk) begin
      if (wire88)
        begin
          if ((7'h41))
            begin
              reg137 <= {wire91[(2'h2):(1'h1)]};
            end
          else
            begin
              reg137 <= $signed((~^$signed(wire97[(3'h4):(1'h0)])));
              reg138 <= wire98;
              reg139 <= {$signed(($signed($signed((8'ha8))) >>> (~^$unsigned(reg138))))};
              reg140 <= (wire112[(2'h3):(2'h2)] << ({((reg137 ^ wire97) > (!wire96)),
                      reg137[(1'h1):(1'h0)]} ?
                  {((~|reg137) ?
                          (reg138 ?
                              wire91 : wire97) : wire99[(1'h1):(1'h0)])} : wire91[(2'h3):(2'h2)]));
              reg141 <= (!reg140);
            end
          if (($unsigned(wire95) << $signed($signed(wire99))))
            begin
              reg142 <= {(wire96 ? $unsigned(wire98[(4'h8):(3'h5)]) : wire95)};
              reg143 <= (+$unsigned({wire95[(1'h1):(1'h1)]}));
              reg144 <= ((~^wire95) ?
                  reg141 : (wire90[(2'h2):(1'h0)] ?
                      {(wire97[(1'h1):(1'h1)] ? $signed(wire98) : (8'hab)),
                          $unsigned((~(8'ha7)))} : $unsigned($unsigned(wire99[(5'h12):(3'h4)]))));
              reg145 <= (+{((reg143 && ((8'hbd) ?
                      wire94 : wire90)) <= ($signed(reg142) >> (~|(8'h9c)))),
                  wire112[(2'h3):(2'h2)]});
            end
          else
            begin
              reg142 <= $signed(($unsigned(reg142) * (8'ha3)));
              reg143 <= ($signed((((reg141 ? wire94 : reg140) + (~wire94)) ?
                  {(reg145 ? reg144 : reg140),
                      (wire135 ?
                          reg139 : (8'hbf))} : wire88)) >>> wire88[(3'h4):(3'h4)]);
              reg144 <= wire97[(1'h1):(1'h0)];
              reg145 <= $signed((|reg138));
            end
          reg146 <= reg142[(3'h4):(3'h4)];
          reg147 <= (&{reg138});
        end
      else
        begin
          reg137 <= wire88[(4'h9):(3'h4)];
          reg138 <= $unsigned(((+{$unsigned(reg146)}) || wire92));
          reg139 <= ((wire92[(4'hd):(4'h9)] ?
              wire94[(1'h0):(1'h0)] : {(8'h9e)}) && wire93[(3'h4):(3'h4)]);
          reg140 <= $unsigned(wire135[(3'h6):(3'h4)]);
          reg141 <= {reg137,
              (^($signed($signed(reg141)) ^~ (!reg147[(3'h4):(1'h1)])))};
        end
      if ($signed(((wire95 ^ $unsigned($signed(wire112))) ?
          wire112 : (|$unsigned(((8'ha1) ? reg143 : (8'hb5)))))))
        begin
          reg148 <= $unsigned((~&(!({wire94} ?
              wire90 : (wire96 ? reg139 : wire90)))));
          reg149 <= $unsigned(wire112);
          reg150 <= (!($unsigned($unsigned((wire99 ?
              wire97 : wire88))) != (reg137 ?
              (&{wire88, wire97}) : $unsigned($unsigned(wire92)))));
        end
      else
        begin
          reg148 <= ((!(wire96[(4'he):(2'h3)] ?
                  ({reg145,
                      reg142} + wire94[(1'h0):(1'h0)]) : $unsigned(reg144[(1'h1):(1'h0)]))) ?
              $signed(({(+reg146),
                  $unsigned(reg137)} >> (&((8'hb0) * wire89)))) : $signed($unsigned(reg145)));
          if ({reg138[(4'hb):(3'h7)],
              (reg145[(4'ha):(3'h6)] ?
                  {$signed(wire99[(2'h3):(2'h3)]),
                      ($unsigned((8'ha3)) ?
                          $signed(reg141) : reg150[(4'ha):(1'h0)])} : ((~|(wire96 ?
                      wire91 : wire89)) * wire99))})
            begin
              reg149 <= (^$signed($signed($unsigned(wire95))));
              reg150 <= reg146[(2'h3):(1'h1)];
            end
          else
            begin
              reg149 <= ($unsigned($unsigned($unsigned((|reg137)))) ?
                  $signed(($unsigned((wire93 == reg137)) ?
                      $unsigned({wire89, wire112}) : ($signed(reg142) ?
                          wire90[(4'hb):(4'h8)] : (~reg142)))) : {wire92});
              reg150 <= wire91;
              reg151 <= wire96;
              reg152 <= ((8'ha7) ?
                  ($signed(reg146) ?
                      (^~$unsigned((reg149 ?
                          wire93 : (8'hb7)))) : ($signed({reg142}) ?
                          $unsigned({reg151}) : (|$unsigned(wire96)))) : {({$unsigned(reg148)} || $signed(wire94[(2'h2):(1'h0)])),
                      wire92});
              reg153 <= reg148;
            end
        end
      reg154 <= (8'hbf);
    end
  always
    @(posedge clk) begin
      if ((^($signed(reg153[(2'h2):(2'h2)]) ?
          $unsigned(wire91[(4'h9):(3'h6)]) : {reg146[(2'h3):(1'h1)]})))
        begin
          reg155 <= ({$signed(reg150),
                  (!{$unsigned(reg142), (reg149 >= wire97)})} ?
              ((~|$unsigned((~reg144))) ?
                  $unsigned((^((8'ha5) ? wire90 : (8'hae)))) : (((wire94 ?
                          wire90 : reg147) ?
                      (^wire96) : (reg145 ^ reg143)) ~^ (8'hae))) : reg138[(4'he):(4'hb)]);
          reg156 <= (reg144 ?
              (&((wire94 ? {(8'ha2), (8'haf)} : $signed(reg139)) ?
                  wire135 : $unsigned(((8'hb8) ?
                      (8'hb8) : (7'h41))))) : wire88);
          reg157 <= $unsigned(($unsigned((wire91 ?
                  (reg156 >>> reg140) : $signed(reg138))) ?
              (((&reg154) == {reg146,
                  reg145}) || reg146[(1'h0):(1'h0)]) : (wire94 ?
                  $unsigned({(8'ha1)}) : {$unsigned(reg145)})));
          if ({(8'ha9),
              $signed((~|((reg139 >> reg139) << (wire92 ^~ reg146))))})
            begin
              reg158 <= wire96[(4'h8):(3'h6)];
              reg159 <= ((wire97[(2'h3):(1'h0)] ?
                      (^($unsigned(wire93) ?
                          reg154[(3'h4):(3'h4)] : $unsigned(reg145))) : reg144) ?
                  ({reg146[(3'h7):(2'h3)],
                      $signed(reg138[(4'hd):(4'hd)])} < (&$signed((-reg153)))) : reg156);
              reg160 <= (reg145[(4'ha):(1'h1)] ?
                  $unsigned((($signed(wire112) ? ((7'h44) && reg142) : reg159) ?
                      $unsigned($unsigned(reg147)) : reg157)) : $signed(wire95[(3'h4):(2'h2)]));
            end
          else
            begin
              reg158 <= (((($unsigned((8'hac)) ?
                              $signed(wire99) : (reg156 ? (8'ha8) : reg151)) ?
                          (~|(~&wire99)) : wire90[(3'h7):(3'h5)]) ?
                      reg159 : $signed((reg155 >> (reg149 <<< reg142)))) ?
                  reg160[(1'h0):(1'h0)] : $unsigned(($signed(reg149[(4'hb):(2'h2)]) ?
                      $unsigned((8'h9f)) : ($signed(wire89) ?
                          $unsigned(reg152) : $unsigned(wire90)))));
              reg159 <= ($signed(reg153) ?
                  ($unsigned({$unsigned(wire112)}) && (!(~wire112))) : $unsigned((reg140[(2'h3):(1'h1)] - ((reg150 * reg157) ?
                      (8'hbd) : $unsigned(wire97)))));
              reg160 <= $signed((!{wire88, wire91}));
            end
        end
      else
        begin
          reg155 <= ({(reg153 << $signed(reg147[(2'h3):(2'h2)]))} ~^ ({(reg144 * wire88[(3'h5):(3'h4)]),
                  reg137[(2'h3):(1'h1)]} ?
              (reg140[(1'h0):(1'h0)] || (8'ha1)) : ((~^$unsigned((7'h42))) <<< wire92[(4'he):(3'h4)])));
          reg156 <= $signed($unsigned(reg153[(3'h4):(2'h2)]));
        end
      reg161 <= $signed((&wire96));
      reg162 <= {(((|(!reg148)) ?
                  ((~^reg152) ?
                      (reg154 <<< reg144) : $unsigned(reg139)) : ($signed(reg143) ?
                      $signed(wire91) : (&wire96))) ?
              $unsigned({$signed(reg143)}) : $signed(reg156[(3'h5):(2'h3)])),
          reg138[(4'h8):(3'h6)]};
    end
  assign wire163 = wire95[(3'h4):(1'h0)];
endmodule

module module5
#(parameter param82 = ((((~(&(8'hbe))) ? (-((8'hbf) ? (7'h43) : (7'h43))) : ((-(8'hb1)) ? ((8'ha4) ~^ (8'hab)) : ((8'hac) || (8'hbe)))) ? (({(8'hac), (8'ha2)} ? ((8'hb3) >> (7'h43)) : ((8'hbf) ? (8'hbb) : (8'hbd))) - ({(8'ha8)} ? {(7'h44), (8'ha8)} : ((8'h9e) == (8'hab)))) : ({((8'hbe) <<< (8'h9c)), (-(8'ha6))} ? (^((7'h40) << (7'h40))) : (!((8'ha0) ? (8'ha3) : (7'h43))))) || ((|(~&((8'had) != (8'hb3)))) ? {((^~(8'ha1)) ? (|(8'hab)) : {(7'h41), (8'h9e)}), (8'hb7)} : ((((8'h9d) << (8'ha2)) + (8'hba)) ? (((8'haa) * (8'h9f)) ? {(7'h44)} : (!(8'ha6))) : {((8'hb2) != (7'h41))}))), 
parameter param83 = param82)
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire10;
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  assign y = {wire81,
                 wire79,
                 wire69,
                 wire64,
                 wire38,
                 wire37,
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
                 wire25,
                 wire10,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire10 = wire7;
  module11 #() modinst26 (.clk(clk), .y(wire25), .wire12(wire10), .wire13(wire6), .wire15(wire9), .wire14(wire8));
  assign wire27 = {wire7, wire10[(4'hd):(4'hd)]};
  assign wire28 = $unsigned((~|wire27[(3'h4):(2'h2)]));
  assign wire29 = $signed($signed($signed((~|wire7))));
  assign wire30 = {(~|((wire27 ?
                          $signed(wire9) : ((7'h42) ?
                              wire10 : wire9)) + $signed({wire28})))};
  assign wire31 = $signed($unsigned((wire6[(3'h4):(1'h1)] ?
                      wire28[(2'h2):(2'h2)] : wire27[(2'h2):(2'h2)])));
  assign wire32 = $signed(wire28);
  assign wire33 = ((wire29 ?
                          $signed(wire30[(1'h0):(1'h0)]) : (({wire9} - (^(8'had))) == wire8)) ?
                      (wire29[(1'h1):(1'h1)] <<< $unsigned({((7'h40) >>> (8'ha7)),
                          $signed(wire27)})) : ($unsigned(((wire31 | (8'ha8)) ?
                              {wire29, wire31} : (wire30 ? wire27 : wire25))) ?
                          ((^~{wire31}) ^~ wire31[(4'he):(4'h8)]) : wire27));
  assign wire34 = {wire29[(1'h0):(1'h0)], $unsigned(wire9)};
  assign wire35 = $unsigned(wire8);
  assign wire36 = wire35[(2'h2):(2'h2)];
  assign wire37 = $signed(wire9);
  assign wire38 = wire35;
  module39 #() modinst65 (.wire42(wire30), .wire40(wire32), .clk(clk), .wire41(wire29), .y(wire64), .wire43(wire34));
  always
    @(posedge clk) begin
      reg66 <= $unsigned(($unsigned(wire37) ?
          $unsigned(wire8) : $signed((~&{wire34, wire29}))));
      reg67 <= wire25;
      reg68 <= $unsigned(wire32);
    end
  assign wire69 = {((~&wire35[(2'h2):(1'h0)]) ?
                          {reg66[(1'h0):(1'h0)]} : (wire8[(5'h11):(4'h9)] ?
                              $signed({reg68, reg66}) : $unsigned(wire36)))};
  module70 #() modinst80 (.wire71(reg67), .wire73(wire7), .wire74(wire35), .clk(clk), .y(wire79), .wire72(reg66));
  assign wire81 = wire9;
endmodule

module module70  (y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire74;
  input wire [(4'h9):(1'h0)] wire73;
  input wire [(4'hc):(1'h0)] wire72;
  input wire [(3'h6):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire75;
  assign y = {wire78, wire77, wire76, wire75, (1'h0)};
  assign wire75 = (|(|$signed(((&wire72) ?
                      (wire72 ? wire71 : (8'ha0)) : ((8'hb3) ?
                          wire73 : wire71)))));
  assign wire76 = (|wire72[(4'hc):(4'hc)]);
  assign wire77 = $signed(wire75[(1'h0):(1'h0)]);
  assign wire78 = (&(|(wire77 ~^ {wire74, $signed(wire76)})));
endmodule

module module39
#(parameter param63 = (~(~^(~((8'hb6) < ((8'hb0) ? (8'ha3) : (8'hb0)))))))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire43;
  input wire [(5'h15):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  input wire [(3'h4):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  assign y = {wire62,
                 wire54,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire44 = (~^(~&wire40[(1'h0):(1'h0)]));
  assign wire45 = $unsigned(($unsigned($signed($unsigned(wire44))) ?
                      $unsigned({(^~wire42),
                          (^~wire41)}) : (wire42[(3'h6):(2'h3)] ?
                          {(~|wire44),
                              (~wire43)} : $signed((wire40 > (8'hac))))));
  assign wire46 = (8'hb5);
  assign wire47 = $unsigned($unsigned((({wire45} ?
                      (wire45 << wire41) : $unsigned(wire40)) >= ((wire42 <<< wire45) ?
                      (wire41 ? wire41 : wire45) : wire46))));
  always
    @(posedge clk) begin
      reg48 <= (&$unsigned(wire44));
      reg49 <= $signed(($signed((+$unsigned(wire45))) ~^ (((-wire43) ?
              $unsigned(wire41) : reg48[(5'h11):(4'h8)]) ?
          $signed($signed(wire47)) : $signed((wire42 ? wire45 : wire40)))));
      if (($unsigned((^$signed((wire47 * reg48)))) - (reg49 ?
          ($unsigned(wire42) ?
              $unsigned({wire40}) : wire47[(2'h3):(1'h1)]) : $signed($signed((wire46 == wire43))))))
        begin
          reg50 <= (wire46[(4'h9):(1'h1)] <<< (reg48[(1'h1):(1'h0)] ?
              {{$unsigned(wire47), (~wire43)},
                  wire47} : (^((wire46 & wire46) + $unsigned(wire46)))));
          reg51 <= ($unsigned(($signed($unsigned((8'hbe))) >> $signed($unsigned((8'hab))))) ?
              (-(|$signed({(8'hbd),
                  wire40}))) : ($signed($signed((+reg49))) ~^ (($signed(wire41) * (reg48 * (8'hba))) < $signed((+wire41)))));
        end
      else
        begin
          reg50 <= wire42;
          if ($signed({((~|reg49) ?
                  ((wire42 <= reg48) > {(8'hb8),
                      wire41}) : wire47[(2'h3):(1'h0)])}))
            begin
              reg51 <= wire45;
            end
          else
            begin
              reg51 <= {wire41, $unsigned(reg48)};
              reg52 <= reg50;
              reg53 <= reg48;
            end
        end
    end
  assign wire54 = {reg48};
  always
    @(posedge clk) begin
      reg55 <= $unsigned($signed(wire45));
      if ($signed((8'hb2)))
        begin
          reg56 <= $signed((+wire41));
          reg57 <= $unsigned({(~&({wire54, wire44} ?
                  $signed((8'hac)) : wire46[(2'h2):(1'h1)])),
              $signed((~(-wire54)))});
          reg58 <= (~&($signed(wire41[(1'h1):(1'h1)]) + ({{(8'hb9), reg53},
              wire44} >= ((wire46 ? wire42 : reg53) ?
              reg56 : (wire43 ? wire54 : wire42)))));
          reg59 <= reg51;
          reg60 <= (reg56[(1'h1):(1'h1)] & $unsigned($unsigned((!{reg51,
              reg56}))));
        end
      else
        begin
          if ((wire42 ?
              {($unsigned(wire47) * $unsigned({(7'h44)})),
                  $signed(reg48[(2'h2):(1'h0)])} : reg52))
            begin
              reg56 <= (~|($unsigned(($unsigned(reg57) ?
                      $signed(wire44) : wire44[(1'h0):(1'h0)])) ?
                  (~^(((8'hb7) ~^ reg53) >>> $unsigned(reg50))) : (~^$signed($unsigned(reg48)))));
              reg57 <= wire42;
              reg58 <= reg52[(4'hb):(1'h1)];
            end
          else
            begin
              reg56 <= $signed((reg55[(2'h3):(2'h2)] ? (8'hb3) : wire47));
              reg57 <= ((reg60[(5'h13):(4'h8)] >> wire41) ?
                  $signed(((reg50[(4'he):(4'h8)] ?
                          ((8'hb1) == (8'hb7)) : (~wire43)) ?
                      $signed(reg49) : (wire45[(1'h0):(1'h0)] | wire43))) : $signed(reg60));
              reg58 <= reg52[(4'h9):(2'h3)];
              reg59 <= {((((reg55 ? reg51 : (8'haa)) - $signed(wire40)) ?
                          reg50 : ($signed(reg49) | $signed(reg51))) ?
                      $unsigned(wire43) : $signed(reg52)),
                  $unsigned(wire42[(5'h10):(3'h7)])};
            end
        end
      reg61 <= ((~((wire43 + (~&reg55)) ?
              reg53[(3'h6):(2'h3)] : (+(reg57 && wire46)))) ?
          wire45 : wire40);
    end
  assign wire62 = $signed($signed($signed((+(reg53 != wire42)))));
endmodule

module module11
#(parameter param23 = (|(((~|{(8'hb7), (8'ha3)}) ~^ (&((8'hb1) ? (8'hb9) : (8'haf)))) & ((~^((7'h41) <= (8'haa))) ? {(~|(8'hba)), ((7'h41) ? (8'hbb) : (8'hb2))} : ((8'hb8) ? (!(8'ha8)) : ((8'had) <= (8'ha9)))))), 
parameter param24 = param23)
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  input wire [(4'ha):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire16;
  assign y = {wire22, wire21, wire20, wire19, wire18, wire17, wire16, (1'h0)};
  assign wire16 = ($unsigned(wire12) >>> (({{wire14, wire12},
                          (!wire15)} <= {$unsigned((8'hb5)), wire14}) ?
                      wire15 : wire13[(3'h6):(1'h1)]));
  assign wire17 = $unsigned(((~(wire16[(3'h7):(2'h2)] << (wire16 ?
                      wire15 : wire14))) != $signed(($signed(wire15) ?
                      (~|wire15) : $signed(wire16)))));
  assign wire18 = {((((|(8'hae)) < $signed(wire14)) <= $signed($signed(wire14))) ?
                          (wire13[(2'h2):(1'h1)] >>> wire14) : wire16[(4'ha):(3'h7)]),
                      $unsigned(wire15[(3'h6):(2'h2)])};
  assign wire19 = $unsigned($signed(((&(wire12 ? wire13 : wire13)) ?
                      ((wire18 << wire13) ?
                          (wire14 ?
                              wire14 : wire17) : wire18[(1'h0):(1'h0)]) : (wire13 ?
                          (wire12 ? wire14 : (8'ha7)) : $signed(wire16)))));
  assign wire20 = ((+(!($unsigned(wire14) > (wire18 && (8'hae))))) ?
                      ($unsigned($unsigned((^~wire14))) ?
                          ((wire13[(4'h9):(3'h5)] ?
                              (wire13 && wire18) : (!wire15)) <<< ((|wire19) != $unsigned(wire12))) : $signed(wire14)) : ((((wire16 ?
                                      wire19 : wire18) ?
                                  $signed(wire16) : (~|(8'h9d))) ?
                              $signed((wire18 ?
                                  wire16 : wire18)) : $unsigned((wire13 || wire19))) ?
                          {($signed(wire12) ? $unsigned(wire14) : (&wire18)),
                              wire19} : (wire18 != (|(~&(8'ha0))))));
  assign wire21 = (($unsigned(wire14) >= $signed($signed($unsigned((8'ha0))))) ?
                      wire14 : $signed((($unsigned(wire20) >= $unsigned((8'ha8))) <= wire20[(4'hf):(1'h0)])));
  assign wire22 = (wire20[(4'h8):(1'h0)] ?
                      $unsigned($signed((+wire13[(4'h9):(1'h0)]))) : wire21[(5'h12):(4'he)]);
endmodule

module module114
#(parameter param134 = ((|((!((8'hb5) ? (8'ha8) : (7'h43))) ? (((8'h9e) ? (8'hbe) : (7'h42)) ? (^(7'h42)) : (-(8'hb5))) : ((~|(7'h41)) < (+(7'h43))))) == {((((8'hb2) ? (8'ha3) : (8'ha7)) ? (8'h9c) : ((8'ha0) ? (8'hbd) : (8'ha3))) ? {((8'ha7) ? (8'hb7) : (8'ha7)), (!(8'ha0))} : ({(8'hb0)} >>> ((8'hb4) ? (8'hba) : (8'haf)))), ((((8'hb3) ? (8'hbd) : (8'hb4)) ? ((8'hab) && (8'ha7)) : ((8'hbf) << (8'hb1))) == (-(&(8'ha3))))}))
(y, clk, wire118, wire117, wire116, wire115);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire118;
  input wire signed [(5'h15):(1'h0)] wire117;
  input wire signed [(5'h12):(1'h0)] wire116;
  input wire signed [(2'h2):(1'h0)] wire115;
  wire signed [(5'h12):(1'h0)] wire133;
  wire signed [(4'hc):(1'h0)] wire124;
  wire signed [(5'h12):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire122;
  wire [(5'h15):(1'h0)] wire121;
  wire signed [(5'h14):(1'h0)] wire120;
  wire signed [(4'h8):(1'h0)] wire119;
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  assign y = {wire133,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 (1'h0)};
  assign wire119 = ($signed({({wire117, wire118} ^ $unsigned(wire117)),
                       ($unsigned((7'h40)) > {wire115})}) * wire117);
  assign wire120 = wire119[(1'h1):(1'h0)];
  assign wire121 = (wire120[(4'hd):(4'ha)] ?
                       wire120[(2'h3):(2'h2)] : $unsigned($unsigned((|(wire119 + wire120)))));
  assign wire122 = (((~&((wire115 - wire116) - ((8'hae) && wire115))) || $unsigned(wire121)) && wire120);
  assign wire123 = wire121;
  assign wire124 = ((&(^~wire117[(4'ha):(4'h8)])) | $unsigned((~|((wire122 <<< wire119) ?
                       ((8'hae) | wire123) : (&wire115)))));
  always
    @(posedge clk) begin
      if (({wire115, $signed(($signed(wire118) - (~wire123)))} ?
          wire117 : (!wire120)))
        begin
          if (((~|wire124[(4'h8):(3'h6)]) * $unsigned($signed((wire117[(4'he):(4'h8)] >= (wire119 && (8'ha6)))))))
            begin
              reg125 <= wire118;
              reg126 <= $unsigned(wire117);
              reg127 <= $unsigned($unsigned((((wire119 ?
                      wire117 : wire116) >> (~&wire118)) ?
                  wire120 : (^~$signed(reg125)))));
              reg128 <= wire118[(1'h0):(1'h0)];
            end
          else
            begin
              reg125 <= wire122;
            end
          reg129 <= wire120;
          reg130 <= $unsigned(({$unsigned(wire118)} <<< $signed(((~^wire123) ?
              reg129[(3'h7):(3'h6)] : reg125[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg125 <= (^~wire116[(1'h1):(1'h0)]);
          reg126 <= $signed($signed(wire115));
          reg127 <= ($signed((8'hb2)) ?
              {(^$signed($signed((8'ha5))))} : wire123);
        end
      reg131 <= wire120;
      reg132 <= ($signed(wire122) ?
          $unsigned((reg131[(1'h1):(1'h1)] ?
              $signed($signed(wire124)) : $unsigned(((8'h9e) << reg125)))) : wire116);
    end
  assign wire133 = $signed($unsigned({((^~wire121) ?
                           (wire119 ? wire122 : wire116) : {reg130})}));
endmodule

module module100  (y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire104;
  input wire signed [(4'ha):(1'h0)] wire103;
  input wire [(4'hd):(1'h0)] wire102;
  input wire [(3'h4):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg106,
                 reg105,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg105 <= {wire103[(2'h2):(1'h1)]};
      reg106 <= $signed((8'ha0));
    end
  assign wire107 = wire102[(1'h0):(1'h0)];
  assign wire108 = $unsigned($unsigned((&$signed((|(8'hac))))));
  assign wire109 = {(wire104[(4'h9):(4'h8)] < {wire108}),
                       $signed((^~wire102[(2'h2):(1'h0)]))};
  assign wire110 = $unsigned(($signed($signed(wire107)) ?
                       $signed($unsigned(wire108)) : wire101));
  assign wire111 = ((8'hb9) & ((reg105[(1'h1):(1'h1)] ?
                           (reg105[(3'h6):(2'h3)] ~^ (~|reg106)) : (-(wire108 | wire107))) ?
                       $unsigned(wire103[(3'h4):(3'h4)]) : wire109));
endmodule
