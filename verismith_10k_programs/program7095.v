module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire237;
  wire [(5'h13):(1'h0)] wire235;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire233;
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire237,
                 wire235,
                 wire12,
                 wire233,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ({wire3[(1'h0):(1'h0)],
              ((8'haa) && $unsigned(((8'hb0) << (8'had))))} ?
          (~&(|$unsigned(wire1[(2'h2):(2'h2)]))) : $signed((8'ha8)));
      reg5 <= ((~^reg4[(1'h1):(1'h1)]) ?
          {$signed($unsigned((wire1 <<< wire1))),
              (($signed((8'hb0)) - ((8'haf) ^ wire2)) << {$signed((8'ha3)),
                  (&reg4)})} : $signed((7'h41)));
      if ((wire2[(1'h0):(1'h0)] ?
          wire0[(3'h6):(3'h5)] : {{wire3[(1'h1):(1'h0)], reg5[(4'h9):(3'h6)]},
              $unsigned($unsigned($signed(reg5)))}))
        begin
          if (wire0[(3'h6):(3'h5)])
            begin
              reg6 <= {(&$unsigned(((~|reg5) <<< (+wire2)))), wire2};
              reg7 <= wire1[(4'h9):(1'h0)];
              reg8 <= $unsigned(wire2);
            end
          else
            begin
              reg6 <= (wire1[(2'h3):(1'h0)] ? reg8[(4'h9):(3'h5)] : (^wire0));
              reg7 <= (((8'had) ?
                  (((wire0 ? reg5 : wire0) ?
                          $unsigned(wire2) : (reg8 * wire3)) ?
                      wire1 : reg8) : $unsigned(reg8)) | (+$signed((-reg8[(1'h1):(1'h1)]))));
              reg8 <= (wire1 <= {$signed(($signed(reg4) < reg4)), reg6});
            end
          reg9 <= ($signed(reg7) ?
              $signed($signed($unsigned(wire3))) : (~|{{wire0[(3'h6):(1'h0)]},
                  reg4}));
          reg10 <= $unsigned(wire0[(1'h1):(1'h1)]);
          reg11 <= (+$signed(reg4));
        end
      else
        begin
          reg6 <= ((((^(reg9 ? wire0 : wire2)) ? reg5 : reg8) ?
              (^{$signed(reg11)}) : (-reg4[(2'h3):(2'h2)])) | $signed(reg6[(2'h3):(2'h2)]));
          reg7 <= {$unsigned(((~|reg6[(1'h0):(1'h0)]) ~^ reg11))};
        end
    end
  assign wire12 = {$unsigned($signed((^~reg5[(4'hd):(4'hb)])))};
  module13 #() modinst234 (wire233, clk, wire0, reg4, reg7, reg8);
  module127 #() modinst236 (wire235, clk, reg7, reg8, reg11, wire1, wire12);
  assign wire237 = (~{{$signed({reg11}), ({wire233, reg10} - (reg8 >> reg8))},
                       reg4[(4'hf):(3'h5)]});
endmodule

module module13
#(parameter param232 = ((({{(8'hb1)}, ((8'hae) ? (8'had) : (8'ha0))} + (((8'ha8) <= (8'hb9)) ? ((8'hb6) ? (8'h9e) : (8'hbf)) : {(8'hab), (8'hb6)})) <<< ((((8'ha2) ? (8'h9c) : (8'hbc)) ~^ ((7'h42) > (7'h40))) ~^ (|((8'h9f) > (8'hab))))) ? ((((~&(8'ha1)) ~^ ((8'hbc) && (8'hb8))) ? (+((8'ha3) ? (8'ha7) : (8'hb5))) : (~&((8'had) ? (8'hb6) : (8'ha2)))) ? {(((8'hb5) >= (8'hae)) <<< ((7'h40) + (8'h9f)))} : (~(+{(8'h9d), (8'hb8)}))) : (|((+{(8'h9f)}) ? (~{(8'ha1)}) : {{(8'ha0)}, ((7'h40) >= (8'ha9))}))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire180;
  wire [(4'he):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire125;
  wire [(5'h11):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire156;
  wire [(4'hf):(1'h0)] wire186;
  wire signed [(4'hb):(1'h0)] wire187;
  wire signed [(3'h5):(1'h0)] wire230;
  reg signed [(4'hd):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg183 = (1'h0);
  reg [(2'h2):(1'h0)] reg182 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  assign y = {wire180,
                 wire63,
                 wire25,
                 wire18,
                 wire123,
                 wire125,
                 wire126,
                 wire156,
                 wire186,
                 wire187,
                 wire230,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire18 = (($signed(($signed(wire14) ?
                      wire17 : (&wire15))) > (($signed(wire15) + $signed((8'ha1))) ?
                      ((wire17 - (8'haf)) + wire14) : wire15[(2'h3):(2'h3)])) ^~ $signed($unsigned(((~wire17) ?
                      ((8'h9d) ? wire17 : wire16) : (wire14 <<< wire17)))));
  always
    @(posedge clk) begin
      reg19 <= $signed($unsigned({((wire15 <= wire16) == $signed(wire16)),
          wire15}));
      reg20 <= (wire17[(4'hb):(4'h9)] ? (8'hbd) : wire17);
      if (reg20)
        begin
          if ($signed(($signed(reg19[(4'hb):(3'h5)]) ^ (+$signed($unsigned(wire16))))))
            begin
              reg21 <= (((|$signed(reg20)) ? reg19 : wire17) ?
                  wire15[(3'h4):(2'h2)] : $unsigned(wire18));
              reg22 <= {{reg21[(4'h9):(3'h7)],
                      $unsigned($signed((wire18 + reg21)))},
                  wire16};
              reg23 <= (reg19 + (wire14 > $signed($signed((^reg21)))));
            end
          else
            begin
              reg21 <= $unsigned(reg22[(4'he):(4'ha)]);
            end
        end
      else
        begin
          reg21 <= reg23[(5'h10):(3'h5)];
          reg22 <= $signed((((((8'hb3) ? reg19 : reg22) ?
              $signed(wire14) : $signed(wire15)) ^ wire15[(1'h1):(1'h0)]) ^ (-(wire18 ?
              $signed((8'haf)) : {reg21, wire16}))));
          reg23 <= wire16;
        end
      reg24 <= {$signed($signed({((8'hb0) <= reg23)})),
          (((&(!(8'hb7))) ?
              $unsigned(reg19[(4'ha):(4'ha)]) : $signed($unsigned(reg22))) | (8'ha8))};
    end
  assign wire25 = $unsigned($signed((8'hb4)));
  module26 #() modinst64 (.wire28(reg20), .wire31(reg19), .clk(clk), .y(wire63), .wire29(wire16), .wire27(wire25), .wire30(wire15));
  module65 #() modinst124 (.clk(clk), .wire66(wire15), .wire69(wire63), .y(wire123), .wire67(reg23), .wire68(wire14), .wire70(wire17));
  assign wire125 = $unsigned($unsigned(({reg21} + wire15[(4'hf):(4'hf)])));
  assign wire126 = wire16;
  module127 #() modinst157 (.wire131(wire15), .wire128(wire63), .clk(clk), .y(wire156), .wire129(wire126), .wire132(wire14), .wire130(wire125));
  module158 #() modinst181 (.wire160(wire17), .wire162(reg21), .y(wire180), .clk(clk), .wire161(wire15), .wire159(wire156));
  always
    @(posedge clk) begin
      reg182 <= reg24[(4'hd):(4'ha)];
      reg183 <= (|{((~^{wire18, wire15}) ?
              (!(~reg20)) : ((wire180 || (8'hbc)) ?
                  {wire14} : $unsigned(wire126)))});
      reg184 <= $signed(((((reg20 << wire18) || wire125[(3'h7):(1'h1)]) ^ $signed((reg182 >= reg19))) ?
          wire180[(2'h2):(2'h2)] : reg21));
      reg185 <= {((($signed((8'ha6)) ?
              wire15[(1'h1):(1'h0)] : (~wire180)) + reg182) * reg19[(4'ha):(2'h2)]),
          $unsigned(($signed((wire156 != reg183)) ?
              $signed((-reg20)) : {wire125}))};
    end
  assign wire186 = {$signed({(^$unsigned(reg19)), {$signed(wire180)}}),
                       {(|($signed(wire126) ?
                               (wire123 ^ wire16) : $signed(wire17)))}};
  assign wire187 = $signed($unsigned((!wire16[(4'hc):(4'h9)])));
  module188 #() modinst231 (wire230, clk, reg185, reg184, reg22, wire63, reg23);
endmodule

module module188  (y, clk, wire193, wire192, wire191, wire190, wire189);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire193;
  input wire signed [(5'h15):(1'h0)] wire192;
  input wire [(5'h12):(1'h0)] wire191;
  input wire signed [(3'h5):(1'h0)] wire190;
  input wire signed [(3'h5):(1'h0)] wire189;
  wire signed [(5'h15):(1'h0)] wire229;
  wire [(5'h15):(1'h0)] wire228;
  wire [(4'he):(1'h0)] wire218;
  wire signed [(4'hb):(1'h0)] wire217;
  wire [(3'h7):(1'h0)] wire216;
  wire [(2'h3):(1'h0)] wire206;
  wire [(4'hb):(1'h0)] wire205;
  wire [(2'h2):(1'h0)] wire204;
  wire [(5'h10):(1'h0)] wire203;
  wire [(4'hb):(1'h0)] wire202;
  wire signed [(5'h14):(1'h0)] wire201;
  wire [(4'hb):(1'h0)] wire200;
  wire [(4'hc):(1'h0)] wire199;
  wire signed [(3'h5):(1'h0)] wire198;
  wire [(3'h6):(1'h0)] wire197;
  wire [(4'hd):(1'h0)] wire196;
  wire [(2'h3):(1'h0)] wire195;
  wire [(4'hc):(1'h0)] wire194;
  reg [(5'h15):(1'h0)] reg227 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg226 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg225 = (1'h0);
  reg [(5'h15):(1'h0)] reg224 = (1'h0);
  reg [(5'h12):(1'h0)] reg223 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg220 = (1'h0);
  reg [(4'h8):(1'h0)] reg219 = (1'h0);
  reg [(4'ha):(1'h0)] reg215 = (1'h0);
  reg [(4'hb):(1'h0)] reg214 = (1'h0);
  reg [(4'hc):(1'h0)] reg213 = (1'h0);
  reg [(3'h7):(1'h0)] reg212 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg211 = (1'h0);
  reg [(4'he):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg209 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg208 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg207 = (1'h0);
  assign y = {wire229,
                 wire228,
                 wire218,
                 wire217,
                 wire216,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 (1'h0)};
  assign wire194 = (($unsigned((-(^wire189))) ?
                           wire189 : (($signed(wire192) ?
                               {wire192,
                                   wire190} : wire190) >>> ((|wire189) ~^ $signed(wire191)))) ?
                       (wire191 ?
                           (((~wire189) > {wire192, wire190}) ?
                               wire190[(2'h3):(1'h0)] : wire191[(4'hb):(2'h2)]) : $signed(($signed(wire190) >>> (-wire191)))) : (-wire190[(1'h1):(1'h1)]));
  assign wire195 = $unsigned((((wire193[(3'h6):(2'h3)] == wire193[(2'h3):(1'h1)]) < wire194[(4'hc):(1'h1)]) ?
                       wire193[(2'h2):(2'h2)] : ($signed(wire191) ?
                           $unsigned((wire193 ?
                               (8'hae) : wire193)) : wire190[(2'h3):(2'h2)])));
  assign wire196 = $signed($unsigned(((+(wire190 ? wire195 : wire189)) ?
                       $signed((wire192 | (7'h42))) : ((wire189 ?
                               wire195 : (8'ha9)) ?
                           wire194[(2'h2):(1'h0)] : (wire192 ?
                               wire193 : wire195)))));
  assign wire197 = ({$signed(($signed(wire192) | $signed(wire190))),
                       wire196[(1'h0):(1'h0)]} >> ({$signed(wire193),
                           (+wire191)} ?
                       ($signed($signed((8'hb3))) ?
                           {$signed((7'h44))} : ($signed(wire195) ?
                               $unsigned(wire190) : $signed(wire195))) : $unsigned(wire196[(4'hd):(4'ha)])));
  assign wire198 = wire189[(3'h5):(3'h4)];
  assign wire199 = wire196[(3'h5):(3'h4)];
  assign wire200 = $unsigned($signed(((wire192 ?
                           $signed(wire191) : (wire196 ? wire197 : wire189)) ?
                       ({wire196} ?
                           (wire197 ? (8'hbd) : wire190) : (wire189 ?
                               wire198 : wire196)) : wire196)));
  assign wire201 = $signed({(7'h41)});
  assign wire202 = ((~^$unsigned($unsigned((wire200 != wire191)))) < (~wire200));
  assign wire203 = ((((~|(wire196 ?
                       wire197 : wire192)) & $signed((8'hb2))) > $signed({(^~wire195),
                       wire189[(1'h1):(1'h1)]})) >>> (wire200[(4'ha):(3'h7)] ?
                       ((((8'h9d) ?
                               wire191 : wire193) * wire192[(4'hd):(3'h7)]) ?
                           (&(|wire190)) : $signed(wire197[(1'h0):(1'h0)])) : (|wire191[(5'h10):(3'h5)])));
  assign wire204 = ({(^~$unsigned((~wire198))),
                       $signed($signed($signed(wire203)))} == wire191);
  assign wire205 = (!(~(wire192[(3'h7):(3'h5)] <<< (~&wire197[(1'h1):(1'h0)]))));
  assign wire206 = ({(~&((wire200 ?
                           wire199 : wire196) == (wire202 ^~ wire195)))} | $signed(wire204));
  always
    @(posedge clk) begin
      reg207 <= wire201[(3'h7):(3'h6)];
      if ((wire201[(2'h3):(1'h0)] ? $signed(reg207[(1'h0):(1'h0)]) : wire193))
        begin
          if ($unsigned(wire199[(4'hc):(3'h4)]))
            begin
              reg208 <= (({$unsigned(wire201[(1'h0):(1'h0)])} ?
                      (wire204 ?
                          $unsigned((^(8'hb0))) : $unsigned((wire194 ?
                              wire196 : wire201))) : {($unsigned(wire205) ?
                              $signed((8'hb2)) : $unsigned(wire190))}) ?
                  $unsigned({({wire196, wire193} + {wire205,
                          wire192})}) : (((^~(~|wire189)) ?
                      $unsigned($signed(wire196)) : $signed($unsigned(wire197))) >>> $unsigned($unsigned({wire199}))));
              reg209 <= ((^wire198) ?
                  $signed(wire201) : ({(^~wire192)} ?
                      wire199[(2'h3):(2'h2)] : $signed($unsigned((wire199 ?
                          wire204 : wire203)))));
            end
          else
            begin
              reg208 <= {{(wire201[(2'h3):(1'h0)] >> (^$unsigned(wire189)))},
                  (!wire193)};
            end
          if ($unsigned(wire190))
            begin
              reg210 <= wire195[(2'h3):(1'h1)];
              reg211 <= (|($signed((((7'h41) + reg210) ?
                      {wire204, reg209} : (wire197 <= wire202))) ?
                  $unsigned($unsigned((&wire191))) : $unsigned($signed(wire194))));
              reg212 <= $unsigned($unsigned($unsigned($unsigned({wire192}))));
              reg213 <= $unsigned($signed($unsigned(($unsigned(wire193) - (wire198 >= wire201)))));
              reg214 <= $unsigned(($unsigned(((reg208 ?
                  (8'ha3) : wire190) > wire189)) ^~ ($unsigned((wire189 ~^ (8'hb3))) + (^~wire200))));
            end
          else
            begin
              reg210 <= (reg210[(3'h7):(2'h3)] < ($signed((|wire206)) > {wire203[(3'h4):(3'h4)],
                  (~|(wire200 ? wire196 : wire200))}));
              reg211 <= $unsigned($signed($signed(reg210[(1'h0):(1'h0)])));
              reg212 <= $signed(wire204[(1'h1):(1'h0)]);
              reg213 <= ($unsigned($signed((reg207 ?
                  wire200 : $unsigned(wire206)))) << $signed(($unsigned($signed((8'hba))) << $signed(wire198))));
              reg214 <= (^wire203);
            end
        end
      else
        begin
          reg208 <= $signed(((wire198[(1'h0):(1'h0)] < $signed(wire197[(2'h2):(1'h1)])) ?
              (!((+wire205) ^ (reg209 ?
                  (8'hb6) : reg208))) : (((~&wire200) >>> (~|reg209)) ?
                  wire204 : (wire196 < $unsigned(reg207)))));
          reg209 <= wire205;
        end
      reg215 <= (wire194 ?
          reg214[(3'h5):(3'h4)] : (reg211 ?
              (^~($unsigned(wire191) << (^wire206))) : wire191[(4'he):(4'he)]));
    end
  assign wire216 = $signed(reg215[(1'h0):(1'h0)]);
  assign wire217 = $unsigned(((|(8'ha8)) + (~^$signed({wire203, wire193}))));
  assign wire218 = (wire193[(1'h1):(1'h1)] ?
                       $unsigned(wire190[(2'h3):(1'h0)]) : (~wire202[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      if (($unsigned((((-reg212) && {(8'ha1)}) ?
          {{reg213}} : (~|(wire193 && wire194)))) > $unsigned((~^wire193))))
        begin
          reg219 <= wire200;
          if ((wire205 ?
              $signed((~{$signed(reg210), reg208[(4'h8):(4'h8)]})) : (8'hbf)))
            begin
              reg220 <= (~^$signed((&($signed(wire200) <= (reg207 >> wire206)))));
              reg221 <= reg219;
            end
          else
            begin
              reg220 <= (({wire217} | $unsigned(reg219)) ?
                  {(($signed(wire201) ? wire216 : wire198) > ((wire218 ?
                          reg221 : reg212) > (wire191 - wire204)))} : (~^(~^(wire204[(1'h0):(1'h0)] - $unsigned(reg221)))));
              reg221 <= (&(~|(^~wire192[(5'h13):(4'ha)])));
              reg222 <= wire217;
              reg223 <= (~&$unsigned(($signed((reg219 ^ reg221)) ?
                  (((8'hbb) ? (8'hb4) : wire196) ?
                      $unsigned(reg212) : (wire198 ?
                          reg222 : wire196)) : {reg214})));
              reg224 <= (reg215[(3'h7):(3'h7)] ?
                  $unsigned($unsigned(wire198[(3'h4):(1'h1)])) : {(($signed(reg222) ?
                          reg212 : (^reg215)) || $unsigned((reg222 + (8'hb7))))});
            end
          reg225 <= reg211;
        end
      else
        begin
          reg219 <= $signed(reg225[(1'h1):(1'h0)]);
          if ($unsigned(reg221[(5'h11):(4'h8)]))
            begin
              reg220 <= ((($signed(reg221[(5'h13):(5'h10)]) != ((wire195 ?
                      wire204 : wire205) >= $signed(reg225))) ?
                  reg219 : wire198) >> wire203[(5'h10):(5'h10)]);
              reg221 <= wire202;
            end
          else
            begin
              reg220 <= {wire204,
                  $signed(($unsigned($signed(wire199)) & ((reg221 <<< reg219) ^~ (~reg221))))};
            end
        end
      reg226 <= {$signed(wire193[(1'h1):(1'h1)]), (~^reg219)};
      reg227 <= reg215[(3'h7):(3'h4)];
    end
  assign wire228 = $signed(((~|$unsigned($unsigned(reg211))) > wire192));
  assign wire229 = ($unsigned((&(^~wire189[(2'h2):(1'h0)]))) ?
                       reg215[(4'h9):(2'h3)] : ({(-reg214),
                               $signed((reg225 ? wire200 : reg212))} ?
                           wire194[(4'hc):(1'h0)] : {wire206,
                               $signed($signed(wire196))}));
endmodule

module module158
#(parameter param178 = ((&((((8'h9f) ? (8'ha3) : (8'ha6)) ? (^~(8'hb7)) : (^~(8'h9c))) ? {((8'hab) ? (8'hb1) : (8'hbc))} : ((~^(8'hb1)) >> ((8'hb0) ? (8'hb9) : (8'hb6))))) ? ((~(((8'h9c) ? (8'ha4) : (7'h42)) ? ((8'hbc) ? (7'h44) : (8'hb5)) : ((8'h9c) ? (8'hb6) : (8'hb0)))) & ((((8'haf) != (8'hbd)) ? ((8'hbe) ? (8'hb5) : (8'hbd)) : ((7'h43) ? (8'hae) : (7'h42))) ? (((8'ha1) ? (8'h9d) : (8'h9d)) - ((7'h40) & (8'hab))) : (~((8'hac) ? (8'hb8) : (8'hbd))))) : ((({(8'had), (8'hb3)} + (~|(8'ha1))) ? (^(!(8'haf))) : (((8'ha4) <= (8'hac)) ? ((8'hae) ? (8'hb4) : (8'h9c)) : (~&(8'hbf)))) ? (!{((7'h44) << (7'h40))}) : (((^(8'ha8)) <= (~|(8'hb3))) ? (+((8'h9f) ? (8'h9d) : (8'hac))) : (((7'h40) >= (8'hb0)) ^~ ((8'hb2) ? (8'ha1) : (8'ha0)))))), 
parameter param179 = (^(~|{(+(param178 ? param178 : param178))})))
(y, clk, wire162, wire161, wire160, wire159);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire162;
  input wire signed [(4'hf):(1'h0)] wire161;
  input wire signed [(4'h8):(1'h0)] wire160;
  input wire [(3'h7):(1'h0)] wire159;
  wire [(4'he):(1'h0)] wire177;
  wire [(5'h15):(1'h0)] wire176;
  wire [(5'h12):(1'h0)] wire175;
  wire [(5'h13):(1'h0)] wire172;
  wire signed [(4'ha):(1'h0)] wire171;
  wire [(4'hb):(1'h0)] wire170;
  wire [(4'ha):(1'h0)] wire169;
  wire [(5'h13):(1'h0)] wire168;
  wire [(5'h13):(1'h0)] wire167;
  wire [(4'hf):(1'h0)] wire166;
  wire [(3'h7):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire163;
  reg signed [(4'h8):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg164 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire163,
                 reg174,
                 reg173,
                 reg164,
                 (1'h0)};
  assign wire163 = wire160[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg164 <= (&$unsigned((wire160[(3'h5):(2'h2)] ?
          (wire159 ^ wire162) : {(wire163 != wire159)})));
    end
  assign wire165 = $unsigned((8'hbc));
  assign wire166 = (wire159[(3'h5):(3'h4)] != {(wire163[(1'h0):(1'h0)] ?
                           wire159[(3'h6):(3'h6)] : $signed(reg164[(1'h1):(1'h0)]))});
  assign wire167 = (&wire159[(3'h5):(2'h2)]);
  assign wire168 = reg164[(1'h0):(1'h0)];
  assign wire169 = ((wire165 ?
                       {(^((8'ha1) >= reg164))} : $unsigned(wire165[(3'h5):(2'h2)])) - (!$unsigned(({wire161} ?
                       wire168 : (+wire167)))));
  assign wire170 = (wire169 ?
                       $unsigned((+$unsigned((wire166 ?
                           (8'hb3) : wire166)))) : ($unsigned($unsigned($signed(wire167))) | {wire166[(3'h6):(1'h0)]}));
  assign wire171 = (~|$signed({wire163[(3'h5):(3'h5)]}));
  assign wire172 = $signed(wire160);
  always
    @(posedge clk) begin
      reg173 <= $unsigned({wire160});
      reg174 <= (((wire161 + ((wire169 ?
              wire171 : reg173) << $unsigned(wire160))) ?
          $signed(({wire169, wire171} ?
              ((8'hb3) ?
                  reg173 : wire162) : $signed(wire166))) : wire170[(4'h9):(4'h8)]) >> wire159);
    end
  assign wire175 = {wire160, $unsigned(wire160)};
  assign wire176 = $unsigned($signed($signed({(wire161 ~^ wire175)})));
  assign wire177 = (((({wire161} ? wire163[(3'h4):(2'h3)] : (-reg174)) ?
                           $unsigned(wire171) : wire175[(4'h9):(4'h9)]) >>> (((&wire170) <= wire175) ?
                           ({wire161, wire165} ?
                               (&(8'ha3)) : wire172[(3'h7):(3'h4)]) : {(wire171 << reg173),
                               $unsigned(wire163)})) ?
                       $signed({($signed(wire167) ^~ (wire162 ?
                               wire161 : wire166))}) : (7'h43));
endmodule

module module127
#(parameter param154 = ((&{(-((8'ha8) < (7'h40)))}) && (((~&(|(8'hae))) * (((8'hbc) ^~ (8'hbf)) >>> ((7'h43) ? (7'h44) : (8'hba)))) ? (({(8'ha0)} || (8'ha4)) ? ((+(8'h9c)) ? ((8'h9d) != (8'haf)) : (8'h9d)) : ({(8'hb5), (8'h9f)} ? (-(8'ha4)) : {(7'h43), (8'h9c)})) : (~^(((8'ha8) ? (8'hb1) : (8'ha4)) ? (^(8'hbb)) : {(8'hb0), (7'h43)})))), 
parameter param155 = ((param154 != {(param154 << (^(8'hb6))), ((param154 - param154) ~^ {param154})}) ? ((-param154) ? ((~^(param154 ? param154 : param154)) ? ((-param154) ? (param154 ? (8'ha9) : param154) : ((7'h41) <<< param154)) : (~^(8'hb8))) : ((&(~param154)) + (param154 ^ (param154 && param154)))) : param154))
(y, clk, wire132, wire131, wire130, wire129, wire128);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire132;
  input wire signed [(3'h4):(1'h0)] wire131;
  input wire [(4'hc):(1'h0)] wire130;
  input wire [(4'h8):(1'h0)] wire129;
  input wire [(4'hc):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire153;
  wire signed [(4'he):(1'h0)] wire152;
  wire [(4'hd):(1'h0)] wire151;
  wire [(4'hd):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire149;
  wire [(3'h5):(1'h0)] wire148;
  wire [(5'h15):(1'h0)] wire147;
  wire signed [(4'hc):(1'h0)] wire146;
  wire signed [(4'hb):(1'h0)] wire135;
  wire [(3'h7):(1'h0)] wire134;
  wire signed [(2'h3):(1'h0)] wire133;
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg144 = (1'h0);
  reg [(5'h15):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg140 = (1'h0);
  reg [(4'hd):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg136 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire135,
                 wire134,
                 wire133,
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
  assign wire133 = $unsigned($signed(({wire132} | wire129[(3'h5):(3'h5)])));
  assign wire134 = $unsigned(($unsigned((+$unsigned(wire128))) ?
                       {(~^wire131)} : (+($signed(wire132) <= $unsigned(wire133)))));
  assign wire135 = $unsigned((wire131[(1'h0):(1'h0)] << wire129));
  always
    @(posedge clk) begin
      if (wire132)
        begin
          reg136 <= (~($signed((wire131[(1'h0):(1'h0)] & (wire130 >> wire130))) ?
              $unsigned((wire132[(1'h0):(1'h0)] >> $signed(wire134))) : wire128));
          reg137 <= {($unsigned({(&(8'had)), (wire128 <= (8'hb9))}) ?
                  (wire130 > (8'hb2)) : wire132),
              (^(^~wire134[(3'h4):(2'h3)]))};
          reg138 <= (8'hb8);
          reg139 <= $signed((wire131 ?
              (((8'h9e) && reg136) + wire132[(3'h4):(1'h0)]) : {wire135[(2'h3):(1'h1)]}));
          if (wire133)
            begin
              reg140 <= reg138[(5'h14):(5'h10)];
              reg141 <= wire131[(2'h2):(1'h0)];
            end
          else
            begin
              reg140 <= reg139;
              reg141 <= (wire135 ? (+$unsigned($unsigned(reg136))) : wire129);
              reg142 <= wire128;
              reg143 <= ((((^~(wire131 ^~ wire128)) ?
                      $unsigned($signed(reg136)) : ((reg142 > reg140) >>> (wire134 ?
                          reg141 : wire130))) <= ((~reg140[(1'h0):(1'h0)]) ?
                      ((~&wire129) ?
                          wire132[(3'h5):(1'h1)] : ((8'hb0) * reg140)) : $unsigned((wire130 | wire128)))) ?
                  $unsigned((wire129 << {wire131[(3'h4):(3'h4)]})) : (wire130 - (wire132 ^ $unsigned($signed(reg141)))));
              reg144 <= (8'ha9);
            end
        end
      else
        begin
          reg136 <= {wire129[(1'h0):(1'h0)]};
          reg137 <= reg139[(1'h1):(1'h0)];
          if (((wire135 | reg144[(4'hf):(4'h8)]) >= wire131))
            begin
              reg138 <= (reg141[(1'h1):(1'h1)] ?
                  reg136[(4'ha):(1'h1)] : $signed(($unsigned((reg140 ?
                      reg143 : wire131)) - (reg143 ?
                      $signed(wire128) : (wire134 ? reg138 : reg141)))));
              reg139 <= $unsigned({(($unsigned(reg139) ?
                      ((8'ha9) ?
                          reg141 : wire132) : reg138[(4'hc):(2'h2)]) | ((8'hb4) != wire129[(1'h1):(1'h0)]))});
              reg140 <= (((!(^~wire134)) ?
                  wire134 : wire128) <= $signed(reg143));
              reg141 <= reg140;
            end
          else
            begin
              reg138 <= ({($signed((8'hb9)) == wire130[(4'h9):(1'h0)]),
                      ((-$signed(wire134)) ?
                          {reg140,
                              $unsigned(wire129)} : wire135[(4'h9):(1'h1)])} ?
                  ($unsigned((+((8'hb8) == reg137))) ?
                      (~^$signed($unsigned(reg138))) : (7'h44)) : ((|(reg144[(4'ha):(4'h9)] ?
                      {reg144, (8'hb8)} : wire128)) >> wire132[(3'h4):(1'h1)]));
              reg139 <= reg136;
              reg140 <= wire128[(4'ha):(1'h1)];
              reg141 <= $signed(reg136[(4'hc):(3'h6)]);
              reg142 <= {$unsigned((~wire133)), $signed(reg141)};
            end
        end
      reg145 <= (^$unsigned(reg141));
    end
  assign wire146 = (~&{reg140});
  assign wire147 = $unsigned((~(wire133[(2'h2):(1'h1)] ?
                       (~(~reg136)) : (~|(wire135 != reg138)))));
  assign wire148 = $signed($signed(($unsigned(reg145) ?
                       (7'h42) : wire132[(3'h5):(1'h0)])));
  assign wire149 = (^(&(8'hbc)));
  assign wire150 = $unsigned((($signed(wire130) + (!$signed(wire132))) < (|(reg139[(4'h9):(1'h0)] < (|wire134)))));
  assign wire151 = reg142;
  assign wire152 = (^wire135);
  assign wire153 = $signed($unsigned(reg139));
endmodule

module module65
#(parameter param121 = ((+(|(((8'hb7) ? (8'ha9) : (8'ha7)) >> (&(8'ha6))))) ? {({{(8'h9f), (8'ha3)}, ((8'hb5) ? (8'ha6) : (8'hbb))} & (^~((8'ha8) ^~ (7'h42))))} : {{{((8'haa) >>> (8'hab))}}}), 
parameter param122 = (~&param121))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h226):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire70;
  input wire signed [(4'he):(1'h0)] wire69;
  input wire [(4'ha):(1'h0)] wire68;
  input wire [(3'h5):(1'h0)] wire67;
  input wire [(5'h10):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire71;
  reg signed [(2'h2):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
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
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire71 = (~&(|({(wire67 >>> (8'haf)), wire66[(3'h7):(3'h7)]} ?
                      wire67 : (8'ha5))));
  assign wire72 = $unsigned((8'ha5));
  assign wire73 = (^~wire67);
  assign wire74 = $unsigned(((wire68 ?
                          ($unsigned(wire66) ?
                              (^~wire73) : wire69[(4'hb):(2'h2)]) : {(^~wire68),
                              (wire70 >> wire68)}) ?
                      wire71 : (wire68[(3'h7):(2'h3)] ?
                          ((wire73 - wire66) ?
                              (^~wire71) : (-wire67)) : (((8'ha4) ?
                              wire71 : wire66) && wire73[(3'h6):(2'h2)]))));
  assign wire75 = wire74;
  assign wire76 = wire75;
  always
    @(posedge clk) begin
      reg77 <= ($signed(($signed((~|wire71)) ?
          $signed((wire76 + wire69)) : (+wire73[(2'h2):(1'h0)]))) < wire74);
      reg78 <= $signed(wire66);
      reg79 <= reg78[(2'h2):(1'h1)];
      if (wire67[(2'h2):(1'h0)])
        begin
          if ((^(({((8'h9c) ? reg79 : (7'h44)), wire69} ?
              ($unsigned(reg78) ?
                  (|(8'hb4)) : wire69) : $signed((-(8'hb4)))) ~^ ($unsigned((-wire66)) ~^ wire75))))
            begin
              reg80 <= wire74;
            end
          else
            begin
              reg80 <= $unsigned((-{(wire69[(2'h2):(1'h0)] != (wire68 < reg77))}));
              reg81 <= (-($signed($signed($unsigned(reg78))) ?
                  $signed({(wire74 ? reg77 : reg80)}) : {((&wire70) ?
                          (reg78 != wire71) : wire69),
                      (&$signed((8'haa)))}));
              reg82 <= wire69[(1'h1):(1'h0)];
              reg83 <= (~(|(($unsigned(reg77) != {(8'hb0)}) ?
                  $unsigned(wire69[(3'h5):(1'h0)]) : (!(reg81 ^ wire67)))));
            end
          reg84 <= reg83[(4'hf):(1'h0)];
        end
      else
        begin
          reg80 <= wire74;
        end
      reg85 <= ((wire74[(3'h4):(2'h3)] ?
          ($signed((|wire69)) ^ $signed({reg82})) : $signed($unsigned(((8'hb3) >> reg79)))) - (~|$signed(reg81[(2'h2):(1'h0)])));
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg77[(5'h10):(4'hd)]))
        begin
          reg86 <= {(|(~^$signed(reg83[(4'he):(2'h3)])))};
        end
      else
        begin
          reg86 <= (-($unsigned((+$signed(reg80))) << (((wire72 ?
              wire68 : wire68) < reg80) <= $signed((~&wire76)))));
          reg87 <= (reg85[(4'h9):(4'h8)] ?
              $signed($unsigned($unsigned((reg84 & wire73)))) : $signed(wire73));
          reg88 <= (($signed(((wire75 ?
                      wire70 : (8'hb3)) || wire68[(4'h9):(3'h4)])) ?
                  $unsigned(($signed(wire68) ^ (wire70 ?
                      wire72 : reg81))) : (((8'h9e) > $signed((8'ha3))) ?
                      {$unsigned(wire68),
                          $unsigned(wire71)} : $unsigned((~|reg83)))) ?
              reg79[(1'h1):(1'h1)] : ((~|wire67[(2'h2):(1'h0)]) ?
                  $signed((~&wire67)) : (~&((~|(8'hb1)) || wire69))));
          if (reg81[(3'h7):(3'h6)])
            begin
              reg89 <= reg84[(2'h2):(1'h0)];
              reg90 <= (reg84 == wire67[(1'h1):(1'h0)]);
              reg91 <= wire68;
            end
          else
            begin
              reg89 <= reg86;
              reg90 <= {(~|{{wire70, (wire66 ? wire70 : wire74)}})};
              reg91 <= $unsigned((($unsigned({wire67,
                      wire67}) >>> (~(~reg77))) ?
                  $unsigned((8'hac)) : (~|reg86[(3'h4):(1'h1)])));
              reg92 <= (((+(&(|reg79))) >>> wire73) ~^ ((8'hbf) << ({$signed(wire73)} ?
                  {{(7'h44)}} : (wire72 >> (reg81 >> reg90)))));
              reg93 <= (&($signed(reg78[(3'h4):(1'h1)]) == reg92[(1'h0):(1'h0)]));
            end
          if ((~^{$signed(((reg92 > reg92) ^~ $unsigned((8'ha3))))}))
            begin
              reg94 <= wire72;
            end
          else
            begin
              reg94 <= (-reg86[(1'h0):(1'h0)]);
              reg95 <= ((wire69[(4'he):(4'hc)] ?
                  wire66[(3'h6):(2'h3)] : (~^$unsigned((-reg80)))) || $unsigned((($signed(reg86) ?
                  (~^reg94) : reg84[(1'h0):(1'h0)]) ^~ (~|$signed((8'hbf))))));
              reg96 <= reg92;
              reg97 <= ($unsigned((-reg85)) < (({(-reg92)} * {$unsigned((7'h42)),
                      $unsigned(reg81)}) ?
                  $unsigned(wire73[(2'h2):(2'h2)]) : $unsigned((~((8'ha9) ~^ reg94)))));
            end
        end
      if (wire73)
        begin
          if ($unsigned(((^~$unsigned($unsigned(reg79))) ?
              reg96 : ((+reg88) >>> $unsigned((reg81 ^~ reg81))))))
            begin
              reg98 <= reg83[(4'hc):(3'h7)];
            end
          else
            begin
              reg98 <= $unsigned(reg90[(2'h3):(1'h0)]);
            end
          reg99 <= wire69;
          reg100 <= $unsigned(wire72[(5'h12):(4'hb)]);
          if (($unsigned({reg97[(3'h5):(3'h4)]}) ?
              $signed((wire68 << ((~^wire67) | wire66[(4'ha):(1'h0)]))) : {$signed($signed($signed(wire73))),
                  (&wire75)}))
            begin
              reg101 <= $signed(wire66);
              reg102 <= (reg97 << (($unsigned((reg92 != (7'h40))) ?
                  ((^wire67) - $signed(wire68)) : $unsigned({wire73,
                      wire71})) | wire73));
            end
          else
            begin
              reg101 <= (((8'hb4) >>> reg77[(4'hf):(1'h0)]) | $signed(reg98));
              reg102 <= wire68;
              reg103 <= {((~&reg82) ? (~$signed(wire71)) : (wire73 > wire76))};
              reg104 <= reg82[(3'h6):(2'h2)];
              reg105 <= wire67[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg98 <= $signed(reg79);
          reg99 <= $unsigned($signed(reg97));
          reg100 <= ($unsigned(wire69) ?
              reg89[(5'h12):(5'h12)] : {reg92[(2'h2):(2'h2)]});
          reg101 <= $signed(wire74);
          reg102 <= (wire66[(4'hc):(4'h9)] ?
              (reg84 ? reg96 : (!reg93)) : wire74);
        end
    end
  assign wire106 = (-$signed(reg88[(2'h3):(2'h3)]));
  assign wire107 = $unsigned((~^((!(reg81 ? reg79 : reg81)) ?
                       ((reg88 + reg105) ?
                           ((8'hb9) >>> reg79) : {reg77}) : $unsigned(reg79))));
  assign wire108 = {(~((!reg92[(2'h3):(1'h0)]) << ({reg82} ~^ ((8'hbf) != reg92)))),
                       ($unsigned(reg103[(3'h4):(1'h0)]) ?
                           ((reg85[(1'h0):(1'h0)] < wire66[(5'h10):(4'ha)]) < reg77[(5'h10):(4'ha)]) : reg80[(3'h4):(2'h2)])};
  assign wire109 = ($signed((!$unsigned((!reg102)))) ?
                       $unsigned($signed(($unsigned(reg80) ?
                           reg84 : (+wire108)))) : ((((&reg82) ?
                           (wire106 ^~ reg80) : ((8'ha0) <<< wire75)) ^~ reg80) && reg100));
  assign wire110 = (reg78 ?
                       reg100 : {((((8'had) + reg97) ?
                               $signed(wire73) : {wire74}) * (~|$unsigned((8'haf)))),
                           ({(8'hb5),
                               ((8'ha3) == reg87)} || reg86[(2'h3):(1'h1)])});
  assign wire111 = ((~^wire109[(1'h1):(1'h1)]) ?
                       $signed({$signed({reg94})}) : reg85[(1'h0):(1'h0)]);
  assign wire112 = (reg103 < $signed((wire75[(1'h1):(1'h0)] == (~&(reg83 || reg102)))));
  always
    @(posedge clk) begin
      if ($signed(reg105[(1'h1):(1'h0)]))
        begin
          if ($unsigned(wire69[(3'h4):(1'h0)]))
            begin
              reg113 <= $unsigned({reg104[(2'h2):(1'h0)], reg99});
            end
          else
            begin
              reg113 <= $signed(reg84);
              reg114 <= wire67[(2'h3):(1'h0)];
            end
          reg115 <= $signed((!wire73[(3'h6):(2'h2)]));
          reg116 <= reg102[(4'he):(4'hb)];
        end
      else
        begin
          if ($unsigned(reg84))
            begin
              reg113 <= (^~reg96[(2'h2):(1'h0)]);
              reg114 <= (^~reg105);
              reg115 <= $signed(((~&$signed($signed((8'hb3)))) ?
                  reg94[(1'h1):(1'h1)] : reg82));
              reg116 <= ((|reg116) ?
                  reg89 : $unsigned($signed((|$signed((8'h9e))))));
            end
          else
            begin
              reg113 <= $unsigned(((wire71 >= reg80[(1'h0):(1'h0)]) < ($unsigned($signed(wire68)) ?
                  $unsigned({reg94}) : $signed((reg79 ? reg101 : reg85)))));
            end
          reg117 <= ((+reg103[(1'h0):(1'h0)]) ?
              (|$signed(($signed((8'ha8)) ^ {wire108,
                  reg87}))) : $unsigned(((~&(reg103 || reg88)) ?
                  (wire71[(2'h2):(1'h0)] ?
                      (reg79 ?
                          wire108 : wire68) : (wire108 << reg98)) : {((8'ha2) - reg84),
                      (~wire109)})));
          reg118 <= $signed(((-reg103[(1'h1):(1'h0)]) ^ (reg91[(2'h3):(1'h0)] ?
              $unsigned($signed(reg86)) : $signed((^~wire69)))));
          reg119 <= ((|$unsigned(wire75[(1'h0):(1'h0)])) ?
              reg116[(1'h0):(1'h0)] : (wire107 ^ ((8'ha4) >= $unsigned($unsigned(wire108)))));
        end
      reg120 <= wire72[(3'h4):(2'h3)];
    end
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire31;
  input wire [(3'h7):(1'h0)] wire30;
  input wire [(5'h13):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  input wire [(5'h10):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
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
                 reg48,
                 reg47,
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
                 (1'h0)};
  assign wire32 = (wire30[(2'h2):(1'h0)] - (((wire29 || (+wire29)) ?
                          ({wire27, wire29} & {wire27}) : ((wire31 ?
                                  wire28 : wire29) ?
                              (8'ha0) : $signed(wire29))) ?
                      wire28[(3'h6):(2'h2)] : ($signed((~|wire29)) && ({wire31} >> ((8'hbb) ?
                          wire28 : (8'hb8))))));
  assign wire33 = (~((wire30[(3'h6):(1'h0)] ^~ $signed(wire27[(4'h9):(1'h0)])) ?
                      wire27 : $signed(wire32[(4'he):(3'h6)])));
  assign wire34 = ((8'h9f) == (wire32 ?
                      ({$unsigned(wire33)} ?
                          {$signed(wire28),
                              (wire28 << wire27)} : (-((8'haf) ^ wire30))) : ((^~$signed((8'hb6))) ^ wire29)));
  assign wire35 = $signed(wire30);
  always
    @(posedge clk) begin
      if (wire29)
        begin
          if ({$unsigned({(~|(8'hb2)), ((~&wire33) >= wire27[(4'he):(2'h3)])}),
              (wire28[(5'h13):(3'h4)] >> (^~wire27))})
            begin
              reg36 <= (wire29[(3'h6):(3'h4)] ?
                  wire28[(3'h5):(1'h0)] : wire32[(4'hc):(4'hc)]);
            end
          else
            begin
              reg36 <= wire33[(2'h2):(1'h0)];
              reg37 <= wire32[(3'h5):(3'h5)];
              reg38 <= wire27;
            end
          reg39 <= wire30;
          reg40 <= $unsigned((&reg39[(2'h2):(1'h1)]));
          reg41 <= $signed((wire34 ^~ wire29[(3'h6):(1'h1)]));
        end
      else
        begin
          reg36 <= reg37;
          reg37 <= $unsigned(wire34[(2'h3):(1'h1)]);
          reg38 <= $unsigned((reg39[(4'h8):(3'h4)] ?
              $signed((~|$signed(wire33))) : $signed($signed((~&(8'hb8))))));
          reg39 <= (-$unsigned((((8'hbf) ?
              $unsigned(wire32) : (wire29 + wire27)) * {(wire30 ~^ reg37),
              (wire31 ? wire28 : wire31)})));
        end
      reg42 <= (reg36 >= $unsigned((($unsigned(reg36) ?
          (wire31 ^ reg40) : (+reg39)) | {(~^wire29)})));
      if ($unsigned($unsigned((+($unsigned(reg39) <<< (wire29 ?
          reg40 : reg38))))))
        begin
          reg43 <= wire27;
          reg44 <= $unsigned((~(wire33[(3'h7):(2'h2)] ?
              ((8'ha9) << $unsigned(wire33)) : {$unsigned(wire29)})));
          reg45 <= ({($signed((wire33 ~^ wire32)) <<< (&(reg38 ?
                  reg38 : reg36))),
              $signed(wire28)} > (~^({(!wire34), $unsigned((8'hac))} ?
              reg41 : reg42)));
          reg46 <= $unsigned((reg37[(3'h6):(1'h1)] ?
              {reg39[(4'h9):(4'h8)]} : (^((reg36 ? wire34 : wire33) > reg43))));
        end
      else
        begin
          reg43 <= $signed(($signed($unsigned((8'ha7))) || (reg40 ?
              (wire33 == (!reg42)) : wire35[(4'hb):(4'h9)])));
          reg44 <= ($unsigned($unsigned(((reg37 ? (8'h9c) : reg43) && {reg40,
              reg37}))) * $signed({$unsigned($signed(reg37)),
              reg36[(3'h5):(1'h0)]}));
          reg45 <= (!($unsigned((~^(8'hb7))) ?
              $signed($unsigned((wire27 + wire30))) : (8'hb4)));
          reg46 <= reg42;
          if ((($unsigned(wire31[(4'hc):(2'h2)]) ?
                  wire32[(3'h4):(1'h0)] : (reg41[(3'h7):(3'h6)] != {(reg45 ?
                          reg37 : reg38)})) ?
              (wire30 ?
                  ({(wire32 ? (8'ha0) : reg45),
                      (wire32 >>> reg38)} != ($signed(reg44) ?
                      $unsigned(wire28) : reg36)) : wire33[(2'h2):(1'h0)]) : wire30[(2'h2):(2'h2)]))
            begin
              reg47 <= (^~$signed((!(&wire33))));
              reg48 <= ($unsigned((-$unsigned($signed(reg42)))) > reg45[(3'h7):(3'h5)]);
              reg49 <= ((reg47[(1'h1):(1'h0)] ?
                      {reg43[(1'h1):(1'h1)],
                          $signed((wire27 | reg40))} : {(wire33 ?
                              $signed(wire32) : $signed(reg45))}) ?
                  $unsigned(($unsigned(reg37) || $signed($unsigned(wire27)))) : (~($signed({reg44,
                          wire35}) ?
                      $signed(wire35) : $signed((~(8'hb2))))));
              reg50 <= ($signed($unsigned(({wire27} ?
                  (reg44 ? (8'hae) : wire32) : ((8'ha2) ?
                      wire35 : reg40)))) != $unsigned($signed(($signed(wire30) && (~|wire33)))));
            end
          else
            begin
              reg47 <= (~(~|reg41[(1'h0):(1'h0)]));
              reg48 <= $unsigned(reg43);
            end
        end
      reg51 <= ((8'h9f) ?
          $signed({reg37[(3'h5):(3'h4)],
              wire27}) : $unsigned($unsigned($unsigned({wire32, reg47}))));
      if ($unsigned((^reg49[(3'h5):(2'h2)])))
        begin
          reg52 <= (({wire28} ?
                  {$unsigned((wire27 ?
                          reg36 : reg38))} : $signed($unsigned(reg41))) ?
              reg36[(4'hc):(4'h8)] : (reg42[(3'h7):(1'h0)] > $unsigned(reg36)));
        end
      else
        begin
          if ((!(^~(&reg42))))
            begin
              reg52 <= $signed((reg37 ?
                  reg47[(1'h1):(1'h0)] : ($unsigned(((8'hab) ^~ wire35)) ?
                      reg51[(3'h7):(1'h1)] : {reg48[(5'h14):(5'h14)]})));
              reg53 <= $signed((($unsigned($unsigned(reg41)) ?
                      (~$unsigned(reg51)) : $signed(wire33[(3'h5):(2'h3)])) ?
                  (reg50[(5'h13):(5'h13)] >>> (+$unsigned(wire29))) : $signed(($unsigned(reg41) >> (reg36 - reg50)))));
              reg54 <= wire28;
              reg55 <= {((!$signed($unsigned(reg49))) || (reg40 > (-(reg39 + wire34))))};
            end
          else
            begin
              reg52 <= {reg51[(3'h7):(3'h7)]};
              reg53 <= wire30[(1'h0):(1'h0)];
              reg54 <= reg40;
            end
          reg56 <= $signed(((((wire34 ? reg53 : (8'ha2)) > ((7'h40) != reg48)) ?
              $unsigned((8'ha9)) : {(reg48 ^~ wire29)}) && (wire31 ?
              ((wire30 >> wire33) | {wire29, (7'h42)}) : reg39)));
          if (wire29)
            begin
              reg57 <= ((~^(-reg40[(1'h0):(1'h0)])) > (|reg54[(1'h1):(1'h1)]));
              reg58 <= ((wire32[(3'h5):(3'h5)] ?
                  (($unsigned(wire28) ^ {reg43, wire33}) ?
                      $signed({(8'hbb)}) : ((reg57 ?
                          wire31 : wire33) > {reg40})) : reg38) * reg44[(4'hd):(3'h7)]);
              reg59 <= {$signed($unsigned(((~&wire29) ?
                      ((8'hb8) >> (8'hb9)) : (reg58 ? reg57 : reg53))))};
              reg60 <= (wire30[(2'h2):(2'h2)] ?
                  {((-(reg41 * reg37)) ?
                          $unsigned(((8'haf) ?
                              reg49 : wire33)) : $signed((!wire32))),
                      (~&($signed(reg38) != $unsigned(reg53)))} : reg56);
            end
          else
            begin
              reg57 <= ($signed(($unsigned((7'h43)) ?
                      $signed(reg59) : $unsigned((reg46 ? reg55 : (8'hbe))))) ?
                  (~^(reg56[(3'h6):(1'h1)] == ($signed(reg40) ?
                      reg46[(2'h3):(2'h3)] : $unsigned(wire33)))) : {(^$unsigned((wire32 ?
                          reg38 : reg47)))});
              reg58 <= wire32;
            end
        end
    end
  assign wire61 = (($unsigned(($unsigned(reg50) * wire35[(3'h4):(1'h1)])) < $signed(({reg40} ?
                          (|reg56) : $unsigned(reg39)))) ?
                      reg59[(2'h3):(1'h1)] : reg46);
  assign wire62 = reg56;
endmodule
