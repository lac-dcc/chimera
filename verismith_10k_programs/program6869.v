module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire222;
  wire signed [(5'h12):(1'h0)] wire221;
  wire signed [(2'h3):(1'h0)] wire220;
  wire [(5'h10):(1'h0)] wire219;
  wire [(4'ha):(1'h0)] wire218;
  wire [(5'h12):(1'h0)] wire210;
  wire signed [(5'h14):(1'h0)] wire150;
  wire signed [(4'hc):(1'h0)] wire149;
  wire signed [(4'ha):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire147;
  wire signed [(4'hd):(1'h0)] wire212;
  wire signed [(5'h15):(1'h0)] wire213;
  wire signed [(3'h7):(1'h0)] wire214;
  wire [(4'h9):(1'h0)] wire216;
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  assign y = {wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire210,
                 wire150,
                 wire149,
                 wire76,
                 wire78,
                 wire81,
                 wire82,
                 wire147,
                 wire212,
                 wire213,
                 wire214,
                 wire216,
                 reg79,
                 reg80,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 (1'h0)};
  module4 #() modinst77 (wire76, clk, wire2, wire0, wire3, wire1, (7'h44));
  assign wire78 = $unsigned($signed($signed(wire1[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg79 <= $unsigned(($signed((wire1[(2'h2):(2'h2)] ^ $unsigned(wire78))) ?
          (~|(8'h9e)) : ((&wire78[(3'h7):(2'h2)]) ?
              (~^{wire1, wire1}) : ((|wire76) | $unsigned(wire1)))));
    end
  always
    @(posedge clk) begin
      reg80 <= wire1;
    end
  assign wire81 = $unsigned({(~(^$unsigned(reg79)))});
  assign wire82 = (($unsigned(wire0) & (wire0 ?
                      $signed((&reg79)) : $unsigned($unsigned(wire2)))) < wire78[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg83 <= wire1[(4'he):(4'hb)];
      reg84 <= ({((~|(wire78 ?
              wire82 : reg80)) == wire82[(4'he):(2'h2)])} > $unsigned(wire3));
      reg85 <= (|($signed((wire1 ?
          wire2[(5'h11):(2'h2)] : {wire3})) && (^$signed((wire82 ?
          wire82 : reg79)))));
      if ($signed(((reg83[(2'h3):(1'h0)] << {$unsigned(wire78)}) ?
          wire0 : (($unsigned(wire1) <= wire78[(2'h3):(1'h1)]) ?
              wire3[(4'hf):(3'h5)] : (&(~&wire0))))))
        begin
          reg86 <= {reg80,
              ($unsigned(((reg83 ? wire1 : wire3) ?
                  wire82 : wire2[(4'ha):(3'h7)])) << (-{{reg83}}))};
        end
      else
        begin
          reg86 <= ((&$signed(wire82)) ? wire2 : wire76[(2'h2):(1'h0)]);
          reg87 <= ($signed((($signed(reg86) ?
              (+reg85) : (wire81 == wire1)) >= reg83)) ~^ $signed($signed((!(reg83 ?
              wire76 : wire1)))));
        end
    end
  module88 #() modinst148 (.wire91(reg79), .clk(clk), .wire93(wire82), .wire89(wire0), .wire92(wire2), .wire90(reg80), .y(wire147));
  assign wire149 = ((|$signed((!(^(7'h41))))) != ({wire3,
                       (^~(wire147 * (8'hb1)))} >> $signed($unsigned($unsigned(reg86)))));
  assign wire150 = (!{((~&$signed(reg85)) ^~ ((reg86 ?
                           wire3 : reg85) != wire149)),
                       {((^wire2) && $signed(wire0))}});
  module151 #() modinst211 (.wire155(wire150), .wire153(reg79), .wire154(wire3), .y(wire210), .clk(clk), .wire152(wire2), .wire156(reg86));
  assign wire212 = (~{((wire149 > (wire81 ? reg85 : (8'hae))) ?
                           reg79 : $unsigned((wire81 ? reg85 : wire210)))});
  assign wire213 = (!$unsigned(wire150[(5'h10):(1'h0)]));
  module15 #() modinst215 (wire214, clk, wire3, wire2, wire210, wire0);
  module15 #() modinst217 (.wire18(wire82), .clk(clk), .wire19(reg85), .wire16(wire212), .y(wire216), .wire17(wire78));
  assign wire218 = reg85[(4'hb):(1'h1)];
  assign wire219 = wire210;
  assign wire220 = ({$signed(({wire214, wire2} ?
                               $signed(wire212) : (!wire214))),
                           (wire212[(3'h4):(3'h4)] | ((wire0 ?
                               wire216 : wire76) & wire81[(4'h9):(3'h6)]))} ?
                       ($signed(((wire78 ? (8'hb3) : (8'ha8)) ?
                               $signed(wire213) : $signed(reg86))) ?
                           wire216 : {wire219[(4'he):(2'h3)]}) : {$signed(({wire82} ?
                               $unsigned(reg84) : (wire214 ?
                                   wire150 : wire210))),
                           $unsigned(wire78[(1'h0):(1'h0)])});
  assign wire221 = wire214[(2'h3):(2'h3)];
  assign wire222 = $signed($signed(reg87[(4'h9):(2'h3)]));
endmodule

module module151
#(parameter param209 = (^{((((8'ha6) ? (8'hbe) : (8'hb4)) | ((8'h9f) && (8'ha0))) ? (~&((8'h9f) <<< (8'hb8))) : (((8'ha1) & (7'h44)) ? (&(7'h40)) : ((8'hbb) ? (8'hbd) : (7'h42)))), (~&((~|(7'h40)) ? {(8'haf), (8'hb7)} : (~(8'h9e))))}))
(y, clk, wire156, wire155, wire154, wire153, wire152);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire156;
  input wire [(4'hf):(1'h0)] wire155;
  input wire [(3'h4):(1'h0)] wire154;
  input wire [(4'ha):(1'h0)] wire153;
  input wire [(4'hf):(1'h0)] wire152;
  wire signed [(5'h11):(1'h0)] wire207;
  wire signed [(5'h10):(1'h0)] wire182;
  wire [(4'hb):(1'h0)] wire181;
  wire [(4'h9):(1'h0)] wire180;
  wire [(4'hc):(1'h0)] wire179;
  wire signed [(4'hb):(1'h0)] wire178;
  wire [(4'ha):(1'h0)] wire177;
  wire [(4'hb):(1'h0)] wire176;
  wire signed [(3'h4):(1'h0)] wire175;
  reg signed [(4'he):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg174 = (1'h0);
  reg [(3'h6):(1'h0)] reg173 = (1'h0);
  reg [(5'h14):(1'h0)] reg172 = (1'h0);
  reg signed [(4'he):(1'h0)] reg171 = (1'h0);
  reg [(4'hc):(1'h0)] reg170 = (1'h0);
  reg [(2'h3):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg168 = (1'h0);
  reg [(4'hc):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg166 = (1'h0);
  reg [(4'ha):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg163 = (1'h0);
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg161 = (1'h0);
  reg [(3'h5):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg157 = (1'h0);
  assign y = {wire207,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 reg183,
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
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((~^$signed({$unsigned(wire154), (wire154 <<< wire153)}))))
        begin
          if (wire156)
            begin
              reg157 <= ({{$unsigned((wire154 || wire155)),
                      $signed((8'ha9))}} && wire153[(2'h2):(1'h0)]);
              reg158 <= (wire156[(4'ha):(3'h7)] ?
                  wire155[(2'h3):(2'h3)] : (^~{((|wire153) ?
                          wire156[(4'h8):(1'h0)] : $unsigned(wire155))}));
              reg159 <= wire156;
              reg160 <= (^(($unsigned(reg159[(1'h0):(1'h0)]) * reg159[(1'h0):(1'h0)]) > $signed(($signed(reg158) ?
                  wire155[(4'hd):(3'h6)] : $unsigned((8'ha6))))));
            end
          else
            begin
              reg157 <= wire154;
              reg158 <= $signed(($unsigned((~|(reg158 << reg157))) ?
                  $unsigned({{(8'ha8), reg158}}) : $unsigned(((reg158 ?
                          reg157 : reg157) ?
                      wire152 : (reg158 > wire153)))));
              reg159 <= $signed($unsigned(((wire152[(3'h4):(1'h0)] ?
                      wire156 : $unsigned(wire153)) ?
                  wire152 : (|$signed(reg160)))));
            end
          reg161 <= wire156;
          if (((wire155 && reg160) < (wire153[(4'h9):(3'h5)] ?
              wire154[(2'h3):(2'h2)] : reg158[(2'h2):(1'h0)])))
            begin
              reg162 <= (wire154 ?
                  {$unsigned($signed($unsigned(wire156))),
                      ({(wire156 ? reg160 : wire154), (^(8'hb4))} ?
                          (&{(8'h9e)}) : $signed((reg157 ?
                              reg159 : wire156)))} : {($unsigned($unsigned(wire154)) || {wire152})});
              reg163 <= reg162[(4'h9):(1'h1)];
              reg164 <= reg159[(2'h2):(1'h1)];
              reg165 <= (~|((!$unsigned(reg161)) ?
                  (^reg157) : $signed($signed(reg162[(3'h7):(1'h1)]))));
              reg166 <= (-($signed({(^~reg159),
                  {reg160}}) <<< $unsigned((!(wire154 >> wire153)))));
            end
          else
            begin
              reg162 <= $signed((wire153[(3'h4):(1'h1)] ? reg162 : reg160));
              reg163 <= (~|(((wire155 == $unsigned(reg161)) ?
                      (|(8'hbf)) : ({reg164} ?
                          ((8'h9f) >> reg158) : (reg163 ? (8'had) : reg165))) ?
                  (|reg157) : (!(+reg166))));
            end
          if ((+(reg166[(4'h8):(3'h4)] << (((reg160 ?
              wire152 : wire153) ^ $unsigned((8'ha9))) - wire156[(5'h11):(4'hc)]))))
            begin
              reg167 <= reg162;
              reg168 <= ($signed($signed(reg167)) ?
                  reg157 : ($unsigned(reg161) ?
                      wire152 : ($signed($signed(reg167)) ?
                          ({reg166, wire154} - (wire152 ?
                              (8'ha8) : reg167)) : (8'ha5))));
              reg169 <= (reg165[(2'h2):(2'h2)] ?
                  reg165[(3'h7):(1'h1)] : {(^~$signed(reg161))});
              reg170 <= (8'ha6);
            end
          else
            begin
              reg167 <= wire153[(3'h5):(2'h3)];
            end
        end
      else
        begin
          reg157 <= reg162;
          reg158 <= (^~$signed(((^~$unsigned(wire154)) ~^ wire155)));
        end
      reg171 <= $unsigned(wire154);
      reg172 <= (~^$signed({$signed({(8'ha3), reg162}), (~|wire152)}));
      reg173 <= (!wire154);
      reg174 <= (reg165[(3'h7):(1'h0)] | ({$signed((reg161 ?
                  wire153 : wire156)),
              {$signed(reg170), reg158[(2'h2):(1'h0)]}} ?
          (reg167[(4'h9):(3'h6)] ?
              reg159[(2'h2):(1'h0)] : $signed($signed(reg173))) : ($signed(reg157) & {(8'hb1),
              (wire155 >>> reg161)})));
    end
  assign wire175 = wire156;
  assign wire176 = reg168[(2'h3):(2'h2)];
  assign wire177 = (8'hbe);
  assign wire178 = $signed((8'ha5));
  assign wire179 = (8'hb6);
  assign wire180 = $unsigned($signed(reg165));
  assign wire181 = ((((-$signed(wire177)) ^~ $signed(reg169[(2'h2):(1'h0)])) | (wire176 ?
                           ((reg159 ? reg161 : reg164) >= ((8'hba) ?
                               (8'ha0) : reg165)) : wire178[(3'h7):(1'h1)])) ?
                       $signed((|wire152[(4'he):(4'hb)])) : (~wire176[(3'h5):(1'h1)]));
  assign wire182 = $unsigned((~|$signed(($unsigned((8'ha6)) >= $unsigned(reg170)))));
  always
    @(posedge clk) begin
      reg183 <= reg167[(3'h6):(3'h5)];
    end
  module184 #() modinst208 (wire207, clk, wire178, reg174, reg172, wire182);
endmodule

module module88  (y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire93;
  input wire [(4'hb):(1'h0)] wire92;
  input wire signed [(4'h8):(1'h0)] wire91;
  input wire [(3'h6):(1'h0)] wire90;
  input wire [(4'hb):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire146;
  wire [(4'hd):(1'h0)] wire144;
  wire signed [(5'h10):(1'h0)] wire115;
  wire [(5'h14):(1'h0)] wire114;
  wire signed [(4'h8):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire112;
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  assign y = {wire146,
                 wire144,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg94 <= wire92[(1'h1):(1'h0)];
      reg95 <= (&(wire90[(3'h4):(1'h1)] + $signed($unsigned((wire90 ?
          (8'hb2) : wire90)))));
      reg96 <= (reg94[(2'h3):(2'h2)] ?
          $signed($signed(wire90[(2'h3):(2'h3)])) : {(($signed(wire91) <<< (wire92 != wire91)) != ($signed(wire90) ^~ reg94)),
              $signed(wire90[(2'h3):(2'h3)])});
    end
  always
    @(posedge clk) begin
      reg97 <= {$signed(wire93), (^~$unsigned($unsigned($signed(reg95))))};
      if ($unsigned(reg94[(3'h4):(1'h0)]))
        begin
          reg98 <= wire92;
          reg99 <= $signed(($unsigned($signed(((8'hb4) ? wire89 : reg97))) ?
              ($unsigned(reg94) ?
                  reg97 : reg98) : $unsigned(reg95[(1'h0):(1'h0)])));
          reg100 <= (8'ha2);
          reg101 <= wire93;
        end
      else
        begin
          if (((&wire91[(1'h1):(1'h0)]) ?
              reg101[(5'h12):(4'hd)] : $signed($signed(reg96[(1'h0):(1'h0)]))))
            begin
              reg98 <= reg97[(3'h6):(3'h6)];
              reg99 <= {(+(8'h9d))};
              reg100 <= {reg101,
                  (((-reg98[(4'hb):(3'h4)]) ?
                      $unsigned($unsigned(reg97)) : reg99) | reg101)};
              reg101 <= reg95[(1'h1):(1'h1)];
              reg102 <= {(~^((^~((8'h9c) == reg98)) ?
                      reg97 : ($signed((8'hb5)) ?
                          $signed((7'h42)) : (^~reg101)))),
                  reg98};
            end
          else
            begin
              reg98 <= (((~(((8'ha8) >>> reg96) << $unsigned(reg94))) ?
                      (($signed(wire91) >> (-wire93)) < (wire89[(1'h1):(1'h0)] ?
                          $unsigned(wire90) : (wire90 ?
                              wire92 : reg100))) : ((^$signed((8'hbe))) ?
                          (reg102[(1'h1):(1'h1)] ?
                              (reg97 ~^ reg96) : wire90[(1'h1):(1'h1)]) : reg96[(1'h1):(1'h0)])) ?
                  ((((reg96 >> reg101) | (reg99 & wire93)) ^ (reg94 ?
                          (&(8'hb3)) : (reg97 || wire89))) ?
                      (reg99[(3'h5):(3'h5)] ?
                          $unsigned(reg97[(3'h6):(3'h4)]) : $signed((reg102 | reg101))) : wire91) : wire92[(1'h1):(1'h1)]);
            end
          if (reg101)
            begin
              reg103 <= $unsigned((!{$unsigned(((8'hbf) ? wire89 : (8'hbb)))}));
              reg104 <= wire91;
              reg105 <= wire92;
            end
          else
            begin
              reg103 <= ($unsigned((+(~(8'hb3)))) && (reg102 * $signed($signed((reg97 ?
                  reg97 : (8'hbb))))));
              reg104 <= wire91[(2'h2):(1'h1)];
              reg105 <= (($signed(reg101[(4'ha):(4'h8)]) ?
                  $signed((^~(reg102 ? reg95 : reg101))) : {{$signed(wire91)},
                      (&$unsigned(reg104))}) * $unsigned(reg94[(2'h2):(1'h1)]));
            end
          reg106 <= ((^$unsigned($unsigned(((8'ha4) ?
              wire89 : reg102)))) * ($signed($signed((~|wire91))) * reg102));
          reg107 <= (reg98 ?
              ((reg102[(3'h7):(1'h1)] ?
                  (reg96 ?
                      $unsigned(reg101) : reg101[(4'hb):(4'ha)]) : ($signed(reg106) ^ (reg102 ?
                      reg95 : reg97))) >= wire93) : $signed((({reg105,
                      (7'h40)} < (reg104 >> (8'hb7))) ?
                  $signed(((8'hba) && wire90)) : (+(-reg105)))));
          reg108 <= (reg106[(1'h1):(1'h1)] ?
              reg104 : $unsigned((reg95[(1'h0):(1'h0)] - $unsigned((~wire89)))));
        end
      reg109 <= reg108[(1'h0):(1'h0)];
      reg110 <= ((^$unsigned($signed($signed(reg106)))) != (reg98 ?
          ((&((8'ha3) - wire91)) || $signed((reg108 ?
              wire89 : reg97))) : ((~(!wire92)) ?
              {(reg106 && reg94)} : ($signed(reg104) ?
                  (reg95 ? reg94 : reg104) : $unsigned((8'hb6))))));
      reg111 <= ((|reg94[(2'h2):(1'h0)]) ?
          $unsigned($signed({(wire92 ? reg106 : (8'ha5))})) : (^~(({reg102,
                  reg96} & $signed(reg94)) ?
              ($unsigned(reg106) ?
                  $unsigned(wire89) : (reg108 < (8'h9f))) : $signed(((8'ha8) ~^ wire89)))));
    end
  assign wire112 = (-$unsigned($unsigned($signed((reg94 <<< reg103)))));
  assign wire113 = ($unsigned($unsigned($signed(reg98[(4'he):(4'he)]))) | $unsigned($unsigned($unsigned(reg98[(5'h12):(4'hb)]))));
  assign wire114 = $signed(((wire113 || ((reg99 ?
                           reg106 : reg108) ^ wire90[(3'h5):(2'h3)])) ?
                       (&(reg104[(4'h8):(2'h3)] ?
                           reg111 : $unsigned(reg97))) : $signed($signed(((8'hba) == wire92)))));
  assign wire115 = (((((reg96 ? wire92 : reg109) <<< $signed(reg94)) ?
                           ($unsigned((8'hab)) << reg109[(3'h6):(1'h0)]) : (reg111 ?
                               (reg104 ?
                                   reg96 : (8'h9c)) : wire93[(1'h1):(1'h1)])) && reg94[(2'h3):(2'h3)]) ?
                       $unsigned($signed((8'ha1))) : (+$unsigned((+(reg104 ?
                           reg103 : (7'h41))))));
  module116 #() modinst145 (.wire120(reg100), .y(wire144), .wire121(reg109), .wire117(reg105), .wire118(reg103), .wire119(reg101), .clk(clk));
  assign wire146 = ((reg105[(4'hf):(4'h9)] ?
                       $signed({(reg98 || reg102), reg109}) : reg97) < reg106);
endmodule

module module4
#(parameter param75 = (((+(~|((8'h9d) ? (8'hb4) : (8'hba)))) != {(-((8'hb9) ? (8'hb6) : (8'ha4))), {((8'ha1) && (8'hab))}}) | ((~|(((8'ha4) < (8'hb7)) ? {(8'ha4)} : (8'hb6))) ? ((((8'hb9) ? (8'hb6) : (8'h9f)) | (8'ha3)) * (~((8'haf) ? (8'hb0) : (8'ha1)))) : (^(&((8'hbb) ? (8'hba) : (8'hb7)))))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  assign y = {wire71,
                 wire69,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire10 = $signed({$unsigned(wire6),
                      $signed((wire9[(4'h9):(2'h3)] ?
                          (~|wire5) : $unsigned(wire7)))});
  assign wire11 = wire8[(3'h7):(2'h3)];
  assign wire12 = (&$signed(wire5[(4'h8):(1'h1)]));
  assign wire13 = ($signed(wire10) ? wire8[(2'h3):(2'h2)] : $unsigned(wire6));
  assign wire14 = ($signed((wire13 << (wire9[(4'ha):(4'h8)] >>> {wire6,
                      wire8}))) ~^ ($signed(wire6) ?
                      wire13[(4'h8):(2'h2)] : (~((wire10 ? wire12 : wire11) ?
                          (wire11 > (8'ha4)) : (wire13 ? wire6 : wire5)))));
  module15 #() modinst70 (wire69, clk, wire6, wire9, wire7, wire13);
  assign wire71 = {(wire12 ?
                          wire9 : (+$unsigned(((8'hb2) ? wire12 : (8'hb4)))))};
  always
    @(posedge clk) begin
      if (({$unsigned(wire13),
          (((wire5 << wire11) ? $signed(wire14) : $signed(wire6)) ?
              (-$signed(wire69)) : {(wire14 >>> wire69)})} <= ($signed({(7'h42)}) && ((~^((8'hb0) ?
          wire9 : (8'hab))) > (-(wire11 ? wire9 : wire6))))))
        begin
          reg72 <= ((wire9[(3'h4):(3'h4)] ?
              $signed($signed($signed(wire9))) : $signed((~|(wire69 >>> wire8)))) == ((wire10[(2'h2):(1'h1)] ?
                  ((wire7 ? (8'had) : wire14) ?
                      {wire71} : (^~(7'h43))) : {(wire5 ? wire8 : wire12)}) ?
              wire8[(4'he):(3'h5)] : ((wire9 >= (&(8'ha1))) <<< (8'hb1))));
        end
      else
        begin
          reg72 <= $unsigned(($signed($signed(wire6)) ?
              {((wire10 >>> (8'hbe)) < $signed(wire5))} : ({(wire14 ?
                          wire8 : wire12),
                      (wire5 ? wire10 : wire10)} ?
                  wire10[(1'h0):(1'h0)] : wire5[(4'hc):(3'h4)])));
          reg73 <= wire10[(1'h0):(1'h0)];
          reg74 <= $unsigned($unsigned(wire6));
        end
    end
endmodule

module module15
#(parameter param68 = ((((((8'ha8) ? (8'hbe) : (8'hb3)) + (&(8'hae))) <= ((^~(8'ha1)) ? (~(8'had)) : ((8'hb6) ? (7'h40) : (8'hb2)))) == (8'hbd)) << {{(((8'hb5) ? (8'hb2) : (7'h42)) << ((8'had) ? (8'h9d) : (8'h9f)))}, ({{(8'ha0), (8'hb1)}} ? (8'h9f) : (((8'hb2) ? (8'hb8) : (8'hb1)) ? (~^(8'h9e)) : ((8'hb0) ? (7'h44) : (8'ha3))))}))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h23f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(4'hd):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  assign y = {wire67,
                 wire54,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire25,
                 wire24,
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
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg20 <= ($signed($signed($unsigned($signed(wire17)))) >> (!$unsigned(($unsigned(wire18) + (wire17 ?
          wire16 : (8'ha3))))));
      reg21 <= (8'hb4);
      reg22 <= (&$signed(wire18[(1'h0):(1'h0)]));
      reg23 <= ($signed({wire17[(3'h4):(1'h1)]}) || ($unsigned((-(wire16 >> wire18))) == ((~&{reg21,
              wire19}) ?
          (~^$unsigned(reg22)) : wire19[(1'h0):(1'h0)])));
    end
  assign wire24 = $unsigned($unsigned((wire18[(2'h3):(2'h2)] ?
                      ($unsigned(wire16) ?
                          (!wire18) : $unsigned(wire18)) : reg23)));
  assign wire25 = $unsigned((^~(({wire17, reg21} ?
                          (wire18 ? reg22 : wire18) : ((8'h9d) > wire19)) ?
                      $signed($signed(reg21)) : (wire16[(2'h3):(1'h1)] ^ reg21))));
  always
    @(posedge clk) begin
      if ((&wire16))
        begin
          if ($signed((~&(+wire17[(5'h11):(4'hd)]))))
            begin
              reg26 <= reg23;
            end
          else
            begin
              reg26 <= ({(~reg23),
                  (~(~$signed((8'hbc))))} <= ($signed(((wire19 <= wire25) ?
                      (wire24 ^~ reg20) : reg20)) ?
                  (|((&reg23) ?
                      (reg21 ? wire17 : reg23) : $signed(reg20))) : wire24));
              reg27 <= ($signed((~&$unsigned($signed(reg23)))) ^~ $unsigned({{(wire17 * (8'hbe))},
                  $signed((reg23 <= reg26))}));
              reg28 <= reg20;
              reg29 <= wire25;
            end
          if ((wire25[(4'h8):(3'h5)] - (~|wire18[(4'hd):(4'ha)])))
            begin
              reg30 <= $unsigned((($signed($signed((8'ha3))) > {$unsigned(reg23)}) ?
                  $signed((~^wire17[(4'hf):(3'h4)])) : (-(+reg29))));
            end
          else
            begin
              reg30 <= (~(^reg27[(5'h10):(3'h7)]));
              reg31 <= $signed(($signed(wire17[(5'h10):(4'he)]) ?
                  (($signed(reg29) ?
                      reg27 : $unsigned(reg26)) ^ wire24[(4'hb):(4'ha)]) : $signed((wire25[(4'he):(3'h6)] + {wire17,
                      reg23}))));
            end
          if (($signed(({(reg26 || reg21), (reg31 + reg26)} ?
                  ($unsigned(reg23) - (wire18 ?
                      reg20 : reg26)) : reg27[(4'hf):(1'h0)])) ?
              wire17[(4'hd):(1'h0)] : wire25))
            begin
              reg32 <= $signed((wire16 ?
                  ((7'h42) ?
                      (^~$unsigned(reg30)) : ((^~wire16) ~^ (reg30 <= (8'ha6)))) : (~(reg22 ~^ (reg23 ?
                      reg29 : reg30)))));
              reg33 <= (~^((reg21[(3'h4):(2'h3)] ^ wire18) ?
                  (^~{(wire24 * wire24)}) : {$signed(reg32)}));
              reg34 <= (&(({reg30} ^ reg21) == reg33));
              reg35 <= $unsigned($signed(($unsigned(wire24) ?
                  reg27 : ((reg21 ^ wire25) != (8'ha3)))));
              reg36 <= $unsigned({reg27[(4'ha):(1'h1)]});
            end
          else
            begin
              reg32 <= wire17[(4'hd):(4'hc)];
              reg33 <= $unsigned(wire17[(4'hd):(4'ha)]);
              reg34 <= {reg30[(2'h2):(1'h0)]};
              reg35 <= $signed({reg32[(5'h14):(4'ha)]});
            end
          reg37 <= reg33;
          reg38 <= ({{reg33[(4'h9):(1'h1)]},
              $signed(((-(8'ha1)) ?
                  (reg32 < reg34) : (reg22 ^ (8'hb6))))} == reg32[(2'h3):(1'h1)]);
        end
      else
        begin
          reg26 <= wire25;
          reg27 <= (reg33 ?
              (&$signed((((8'hbe) || reg26) <<< reg31))) : (8'hb6));
          reg28 <= reg31[(3'h5):(1'h0)];
        end
      reg39 <= {($signed(((~(8'ha9)) + reg23[(5'h10):(4'hd)])) | reg28[(3'h6):(2'h2)])};
    end
  assign wire40 = reg26;
  assign wire41 = {$signed($unsigned({wire16[(2'h3):(2'h3)],
                          ((8'hb2) ? (8'hbb) : reg27)})),
                      reg23};
  assign wire42 = (~&(reg22[(1'h1):(1'h1)] >= $signed(((-wire16) ?
                      {reg36} : (|reg35)))));
  assign wire43 = ($unsigned((8'ha8)) & $signed((|((wire42 - wire16) ?
                      wire16[(4'hb):(4'h8)] : $signed((8'hb0))))));
  assign wire44 = (~|($unsigned($signed($signed(reg21))) <<< (~((reg37 || reg37) <<< reg22[(3'h5):(2'h2)]))));
  assign wire45 = reg30[(2'h3):(1'h1)];
  assign wire46 = (~&(^~wire40[(4'hc):(4'hb)]));
  assign wire47 = (~|(~^(reg22 ?
                      {(7'h40),
                          (reg21 ? wire46 : reg30)} : ((reg35 <<< wire41) ?
                          (8'h9f) : (wire25 ? (8'h9c) : wire24)))));
  assign wire48 = $unsigned(wire43);
  always
    @(posedge clk) begin
      reg49 <= (((^wire44[(1'h1):(1'h0)]) || (wire19 ?
              (&((8'ha8) | wire19)) : ($unsigned(wire18) <<< (~^reg20)))) ?
          {($unsigned((reg36 ? (8'hbe) : reg30)) ?
                  reg28[(2'h3):(2'h2)] : wire18[(3'h7):(3'h4)])} : $unsigned(($signed((-reg20)) ?
              ($signed((8'hbe)) ?
                  reg32 : reg37[(2'h3):(2'h2)]) : {$signed(wire19)})));
      reg50 <= (reg21[(3'h6):(2'h2)] ? $signed(wire48) : wire24);
      reg51 <= {(^~($unsigned($signed(wire43)) ?
              wire42 : ({reg28} <= (reg39 - reg32))))};
      reg52 <= (^~(($signed($signed(wire16)) ?
              $unsigned(wire46) : $unsigned(reg33[(3'h5):(2'h2)])) ?
          wire24 : ($signed((reg28 + wire40)) <= (8'hb3))));
      reg53 <= $signed(((^~(~(reg38 && (8'hb4)))) - ((^wire17[(4'hb):(3'h7)]) ?
          (reg34 << $signed(reg26)) : ((reg32 ? wire19 : reg35) ?
              wire47[(1'h1):(1'h0)] : (~|reg38)))));
    end
  assign wire54 = (reg30[(2'h2):(2'h2)] ?
                      ($unsigned((((8'hba) ? wire46 : reg52) != (wire40 ?
                          reg36 : reg33))) >> ((8'hbd) ?
                          (wire42 ?
                              (~^reg37) : $signed(wire16)) : $unsigned((wire42 ?
                              (8'hb7) : reg49)))) : (8'hbf));
  always
    @(posedge clk) begin
      reg55 <= {($unsigned(reg23) ?
              $signed((((8'hb2) == wire17) ?
                  (wire18 ^ reg28) : (wire41 ?
                      (8'hbd) : wire18))) : wire47[(2'h2):(2'h2)])};
      if (reg31)
        begin
          reg56 <= $signed(reg26);
          reg57 <= $signed({((8'ha3) ?
                  ((|(8'ha5)) * reg30[(3'h4):(1'h0)]) : (|{reg32, reg28}))});
        end
      else
        begin
          reg56 <= ((&reg57) > $unsigned(($signed($unsigned(wire25)) - $signed((wire44 != reg50)))));
          if ((|($signed(wire45[(2'h2):(1'h1)]) & (|wire16))))
            begin
              reg57 <= (($unsigned($unsigned($unsigned((8'ha2)))) ?
                  wire48[(5'h14):(4'h8)] : reg36[(5'h14):(1'h1)]) | $signed(reg34[(3'h4):(1'h1)]));
              reg58 <= $unsigned({$unsigned(reg35[(3'h7):(3'h6)]),
                  ($signed($signed(reg38)) ?
                      $unsigned((reg52 == reg55)) : reg27)});
              reg59 <= (wire45 ^ (^~(reg50 == $unsigned($unsigned(reg53)))));
            end
          else
            begin
              reg57 <= wire42[(4'h8):(2'h2)];
              reg58 <= ((-$unsigned((reg49[(1'h0):(1'h0)] != $unsigned(reg22)))) >>> {wire46,
                  ($unsigned((|wire45)) ?
                      (((8'ha5) ? reg49 : reg50) ?
                          (reg56 + reg52) : (reg51 ?
                              wire43 : (7'h40))) : wire46)});
              reg59 <= $unsigned($signed({(+$signed(wire25))}));
            end
          reg60 <= reg53;
          reg61 <= (reg26[(3'h4):(1'h0)] ^ ((!((|wire16) == $signed(reg28))) ?
              wire54 : ($unsigned((reg51 ? wire18 : wire41)) >> (|(wire46 ?
                  reg37 : reg39)))));
        end
      reg62 <= ((reg34[(3'h5):(1'h1)] ?
          $unsigned(wire18[(3'h4):(1'h0)]) : (wire18[(4'he):(1'h1)] | $signed($unsigned(reg38)))) >> reg60[(4'hc):(4'hb)]);
    end
  always
    @(posedge clk) begin
      reg63 <= (~|$unsigned(($signed(reg32) != reg32[(2'h2):(1'h0)])));
      if ((8'hb1))
        begin
          reg64 <= {reg37, wire24[(4'he):(2'h3)]};
          reg65 <= reg33;
        end
      else
        begin
          reg64 <= {(((^~(reg57 == wire43)) ?
                      (8'hb1) : ($unsigned(reg61) ? (8'hbb) : $signed(reg23))) ?
                  (reg20[(3'h7):(3'h5)] ?
                      (~|wire40) : reg32[(4'hc):(4'hc)]) : (reg65 > reg56[(4'h8):(1'h1)])),
              $signed($signed(reg63[(4'hd):(4'hc)]))};
        end
      reg66 <= ({reg34} || {{$unsigned({wire25, wire16})}});
    end
  assign wire67 = {$signed({{$unsigned(reg20), ((8'had) ? reg61 : reg30)}}),
                      ((reg39 <= reg28[(5'h12):(1'h1)]) > $signed(reg64))};
endmodule

module module116
#(parameter param142 = (((({(8'ha2)} ? (|(8'hb7)) : {(8'hb8)}) < ({(8'hb6), (8'hb4)} ? (!(8'hae)) : (^(8'ha7)))) ? ((~&((8'hb6) ~^ (8'hbe))) ? ({(8'ha2), (8'haa)} & ((8'ha1) ~^ (8'hbf))) : (((8'hb2) == (8'had)) & ((8'ha9) >> (8'ha7)))) : ({((8'hb7) ? (8'hb7) : (8'hb9))} <<< {((8'hba) ? (8'hb1) : (8'hb1))})) < (+((((8'ha5) ? (8'ha1) : (8'h9c)) ? ((8'h9d) == (8'haf)) : (+(8'ha9))) ? (8'h9c) : (8'hbd)))), 
parameter param143 = ((({(^(7'h41)), (!param142)} > ({param142, param142} ? (param142 - param142) : param142)) || ({(param142 | param142)} ? ((param142 ? param142 : param142) < (^~param142)) : ((param142 & param142) - {param142}))) != (&((~^(~&param142)) << ((~^param142) >>> (param142 ~^ param142))))))
(y, clk, wire121, wire120, wire119, wire118, wire117);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire121;
  input wire signed [(3'h4):(1'h0)] wire120;
  input wire signed [(4'ha):(1'h0)] wire119;
  input wire [(5'h14):(1'h0)] wire118;
  input wire signed [(2'h3):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire141;
  wire signed [(2'h2):(1'h0)] wire140;
  wire signed [(3'h5):(1'h0)] wire139;
  wire [(2'h2):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire136;
  wire [(3'h5):(1'h0)] wire135;
  wire signed [(3'h4):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire131;
  wire [(3'h6):(1'h0)] wire130;
  wire [(4'he):(1'h0)] wire129;
  wire [(3'h5):(1'h0)] wire128;
  wire [(5'h14):(1'h0)] wire127;
  wire [(3'h7):(1'h0)] wire126;
  wire signed [(2'h3):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire123;
  wire signed [(4'he):(1'h0)] wire122;
  reg signed [(4'he):(1'h0)] reg137 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
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
                 reg137,
                 (1'h0)};
  assign wire122 = wire119;
  assign wire123 = wire118;
  assign wire124 = (~&$signed($signed((wire118 ?
                       $signed((7'h43)) : ((8'ha1) && wire120)))));
  assign wire125 = (~|wire117[(2'h2):(1'h1)]);
  assign wire126 = ($unsigned(wire118) ?
                       wire124 : $unsigned(($signed(wire119) >= (-$signed(wire124)))));
  assign wire127 = ((|wire120) >> $signed(($unsigned($signed(wire125)) ?
                       wire119 : ({wire119, wire123} ?
                           wire123[(2'h2):(1'h0)] : (wire120 ^ wire121)))));
  assign wire128 = {((({wire126} & (wire125 - wire124)) * wire122[(3'h4):(3'h4)]) ?
                           $unsigned($signed(wire117[(2'h2):(1'h1)])) : $unsigned($signed(wire125)))};
  assign wire129 = wire119;
  assign wire130 = (($signed(wire118) ?
                           (($signed(wire122) + $signed((8'hbb))) ?
                               (wire120 ?
                                   $unsigned(wire129) : wire119) : {{(8'ha2),
                                       wire124}}) : wire122[(1'h1):(1'h0)]) ?
                       {$unsigned((~&$unsigned(wire126)))} : ((wire126 ?
                               ((~^wire129) ?
                                   (7'h41) : $unsigned((8'ha5))) : ($signed(wire118) || wire125)) ?
                           ($signed(wire117[(1'h1):(1'h1)]) ?
                               $unsigned((+wire126)) : (wire126 ?
                                   (+wire117) : wire123)) : (+$signed((wire117 || (7'h42))))));
  assign wire131 = $signed($unsigned(wire123));
  assign wire132 = (((+(wire124[(2'h3):(1'h0)] ~^ wire120[(2'h3):(1'h0)])) ?
                           ({(-wire128)} * wire118) : (+{(8'hbe),
                               (wire123 | wire123)})) ?
                       wire122 : (-(8'hab)));
  assign wire133 = wire128;
  assign wire134 = (($unsigned(((^wire123) ?
                           (wire124 ?
                               (8'haa) : wire120) : $signed(wire130))) | $signed((&wire122[(4'hb):(4'h8)]))) ?
                       (+wire122[(4'hc):(4'hb)]) : (~|({$unsigned(wire118),
                           ((8'had) ? wire128 : wire127)} | $signed(wire117))));
  assign wire135 = (8'h9c);
  assign wire136 = $unsigned($unsigned($signed(wire119[(3'h4):(1'h0)])));
  always
    @(posedge clk) begin
      reg137 <= (7'h44);
    end
  assign wire138 = ($signed(wire117) ?
                       (reg137[(4'hd):(2'h2)] ?
                           {wire133,
                               wire129[(1'h0):(1'h0)]} : ($unsigned(wire127[(4'he):(3'h4)]) >= $unsigned($unsigned(wire134)))) : $unsigned($unsigned({(wire122 != wire117),
                           {wire129, wire128}})));
  assign wire139 = reg137[(1'h0):(1'h0)];
  assign wire140 = (8'h9e);
  assign wire141 = (8'hb5);
endmodule

module module184
#(parameter param205 = (&(8'ha9)), 
parameter param206 = (~^(~^param205)))
(y, clk, wire188, wire187, wire186, wire185);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire188;
  input wire [(4'hf):(1'h0)] wire187;
  input wire signed [(3'h4):(1'h0)] wire186;
  input wire [(2'h2):(1'h0)] wire185;
  wire [(3'h7):(1'h0)] wire204;
  wire signed [(4'hd):(1'h0)] wire201;
  wire [(2'h3):(1'h0)] wire200;
  wire signed [(4'hb):(1'h0)] wire199;
  wire signed [(2'h3):(1'h0)] wire198;
  wire [(5'h15):(1'h0)] wire197;
  wire signed [(3'h4):(1'h0)] wire196;
  wire signed [(5'h12):(1'h0)] wire195;
  wire [(3'h6):(1'h0)] wire193;
  wire signed [(4'he):(1'h0)] wire192;
  wire signed [(5'h10):(1'h0)] wire191;
  wire signed [(5'h13):(1'h0)] wire190;
  wire signed [(4'he):(1'h0)] wire189;
  reg signed [(4'hc):(1'h0)] reg203 = (1'h0);
  reg [(4'hf):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg194 = (1'h0);
  assign y = {wire204,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 reg203,
                 reg202,
                 reg194,
                 (1'h0)};
  assign wire189 = (((7'h42) ?
                       (|$unsigned((wire187 ?
                           wire188 : wire187))) : (wire187[(3'h4):(2'h2)] < ($signed(wire187) ?
                           wire187 : (wire187 ?
                               wire187 : wire186)))) ~^ {(!wire187)});
  assign wire190 = wire186[(1'h1):(1'h0)];
  assign wire191 = $signed($unsigned(((((8'hbb) ? (8'ha5) : wire189) ?
                           (-wire185) : {wire189, wire185}) ?
                       $unsigned((~^wire189)) : wire188)));
  assign wire192 = (($signed(($unsigned(wire186) ?
                           wire185[(1'h0):(1'h0)] : $unsigned((8'hbd)))) ?
                       ((&(^(8'ha0))) ~^ (8'hbf)) : wire191[(4'h8):(2'h2)]) && wire188[(3'h4):(2'h3)]);
  assign wire193 = ($unsigned(wire187) ?
                       $unsigned(((~^(~(8'ha0))) ?
                           (!$unsigned(wire187)) : ((wire191 < wire188) && $unsigned(wire188)))) : $signed($unsigned((wire187[(3'h5):(3'h5)] >>> $signed(wire185)))));
  always
    @(posedge clk) begin
      reg194 <= $unsigned((wire186[(1'h0):(1'h0)] >> (8'hb4)));
    end
  assign wire195 = ($signed(((wire185[(2'h2):(1'h1)] != $unsigned(reg194)) ?
                       ((wire186 != wire185) || $signed(wire186)) : $unsigned({wire187}))) != (($signed(wire192) << wire187) ?
                       $signed(reg194) : {(((8'hb5) ~^ wire188) << $signed(wire185)),
                           $signed($unsigned(reg194))}));
  assign wire196 = ($unsigned($signed(($unsigned(wire186) | wire191[(4'he):(3'h6)]))) ^ (7'h43));
  assign wire197 = wire191[(4'hc):(4'ha)];
  assign wire198 = (+wire195[(4'hc):(1'h0)]);
  assign wire199 = wire195[(4'hc):(4'hc)];
  assign wire200 = $unsigned(wire195[(3'h7):(2'h3)]);
  assign wire201 = wire199[(4'ha):(3'h5)];
  always
    @(posedge clk) begin
      reg202 <= (~^$unsigned(wire197[(4'hc):(4'hc)]));
      reg203 <= (wire197 ?
          wire198[(2'h2):(2'h2)] : {(8'h9e),
              (({wire189} ? reg194 : wire188) ?
                  (^~(~&wire185)) : (((8'hbe) ^ wire200) ^~ (wire201 ?
                      (8'hbb) : wire186)))});
    end
  assign wire204 = $unsigned((($unsigned((wire193 ?
                       reg202 : wire193)) < wire185) - wire201));
endmodule
