module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire315;
  wire [(4'h9):(1'h0)] wire314;
  wire signed [(3'h6):(1'h0)] wire313;
  wire [(5'h13):(1'h0)] wire312;
  wire [(3'h4):(1'h0)] wire311;
  wire [(4'h8):(1'h0)] wire310;
  wire signed [(4'h9):(1'h0)] wire293;
  wire [(4'he):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire295;
  wire [(2'h3):(1'h0)] wire297;
  wire signed [(5'h13):(1'h0)] wire307;
  wire signed [(4'he):(1'h0)] wire308;
  reg signed [(4'ha):(1'h0)] reg306 = (1'h0);
  reg [(3'h7):(1'h0)] reg305 = (1'h0);
  reg signed [(4'he):(1'h0)] reg304 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg303 = (1'h0);
  reg [(4'he):(1'h0)] reg302 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg301 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg300 = (1'h0);
  reg [(3'h5):(1'h0)] reg299 = (1'h0);
  reg [(2'h3):(1'h0)] reg298 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire315,
                 wire314,
                 wire313,
                 wire312,
                 wire311,
                 wire310,
                 wire293,
                 wire22,
                 wire12,
                 wire295,
                 wire297,
                 wire307,
                 wire308,
                 reg306,
                 reg305,
                 reg304,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg24,
                 reg23,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3;
      reg6 <= wire3;
      reg7 <= ((8'hbf) <= {{($signed(wire4) ?
                  wire0[(3'h7):(3'h5)] : $signed(wire3)),
              $unsigned({wire3, wire1})}});
      reg8 <= ($unsigned({(~&(^reg7))}) & wire1[(1'h1):(1'h0)]);
      if (((+wire4) <= $signed($signed(wire2[(1'h0):(1'h0)]))))
        begin
          reg9 <= $signed((~wire4[(2'h2):(2'h2)]));
          reg10 <= reg5;
        end
      else
        begin
          reg9 <= (+$unsigned($unsigned(($unsigned(wire2) != (wire0 ?
              reg7 : reg8)))));
          reg10 <= (&(reg5 || $unsigned((&((8'hab) & wire3)))));
          reg11 <= reg6[(2'h3):(2'h2)];
        end
    end
  assign wire12 = (($signed(reg6) ?
                      ((reg7 - {reg11}) <= $unsigned(((8'hb5) ?
                          wire2 : wire1))) : ({(reg6 ? reg5 : reg6),
                              (reg5 ? (7'h41) : reg6)} ?
                          ((reg9 || (8'ha6)) || (reg7 >>> reg5)) : (+$signed(reg9)))) >> wire0);
  always
    @(posedge clk) begin
      reg13 <= reg6;
      if ($signed($signed({(+(reg10 == reg9)),
          ({wire4, wire4} ? (8'hb5) : (!wire0))})))
        begin
          reg14 <= $signed(($signed(({wire3} ?
              $unsigned(reg13) : $unsigned(reg5))) - ((~|(reg11 - reg13)) ?
              {$signed(wire12)} : {(wire4 ^ reg10)})));
          if ({{(&(8'hb6))}, (!{reg13[(2'h3):(2'h3)]})})
            begin
              reg15 <= $unsigned(reg8);
            end
          else
            begin
              reg15 <= $unsigned((reg9[(1'h1):(1'h0)] ?
                  wire1 : {$unsigned((^wire0)),
                      $unsigned((wire4 ? reg13 : wire3))}));
              reg16 <= (reg8[(4'hb):(3'h6)] ?
                  $signed((~$unsigned($unsigned(wire0)))) : reg13[(1'h0):(1'h0)]);
              reg17 <= (wire2 >> ((~&((reg13 << reg14) >>> (reg16 > reg14))) ?
                  (((reg7 * reg5) + (wire0 ? (8'ha6) : (8'hb2))) ?
                      reg10 : (wire1 ?
                          (^~wire2) : $unsigned(reg5))) : reg8[(4'hd):(4'ha)]));
            end
        end
      else
        begin
          reg14 <= (|$unsigned(($signed((reg15 ? wire3 : reg9)) ?
              {wire12} : $signed((reg13 ? wire0 : wire3)))));
          reg15 <= $signed(reg16[(3'h5):(3'h4)]);
          reg16 <= (!wire1);
          if (((wire2 ? $signed(reg5) : reg16[(4'hb):(3'h7)]) ?
              (&wire2) : {($signed($signed((8'hbc))) & reg16)}))
            begin
              reg17 <= {$signed(reg11[(3'h5):(2'h3)]),
                  ((~$unsigned(reg11)) ? (8'hbc) : {$signed(reg5), reg14})};
              reg18 <= (reg7[(1'h0):(1'h0)] ?
                  {(~&((~reg11) ? $unsigned((8'hae)) : wire3)),
                      (~(wire4 || $unsigned((8'ha1))))} : $signed(wire2[(3'h5):(1'h1)]));
              reg19 <= (+wire1);
            end
          else
            begin
              reg17 <= (reg8 ? $signed(reg16) : reg16[(2'h2):(1'h0)]);
            end
          reg20 <= $unsigned(((^{{wire4, (8'hb5)},
              $signed(wire0)}) - wire4[(4'he):(4'hc)]));
        end
      reg21 <= ($unsigned($signed(reg15[(3'h5):(3'h4)])) > (7'h43));
    end
  assign wire22 = ($unsigned($unsigned($signed((^wire3)))) << {$signed(({(8'hab)} <<< (~^wire3))),
                      wire2});
  always
    @(posedge clk) begin
      reg23 <= reg13;
      reg24 <= ((~&(+$unsigned($signed((8'haf))))) ?
          (^~reg21[(4'hc):(2'h3)]) : {((-(reg14 + wire1)) ?
                  (~(reg8 && wire3)) : (!(wire1 && (8'hab)))),
              $signed(({(8'hb4)} <<< $signed(reg19)))});
    end
  module25 #() modinst294 (.y(wire293), .clk(clk), .wire27(reg5), .wire26(wire3), .wire28(reg18), .wire29(reg7));
  module31 #() modinst296 (.clk(clk), .wire36(reg23), .wire34(wire2), .y(wire295), .wire35(wire22), .wire33(reg24), .wire32(reg11));
  assign wire297 = $unsigned($signed(((~&(8'hb2)) ?
                       {(reg21 > reg18), (wire12 << reg9)} : (reg20 ?
                           wire0[(3'h5):(1'h1)] : $signed(reg15)))));
  always
    @(posedge clk) begin
      reg298 <= (&reg8);
      if ({(-(^~({reg20, wire293} - $unsigned(reg17))))})
        begin
          reg299 <= (reg23 & (reg23[(5'h12):(5'h11)] ?
              ($signed(reg8[(3'h4):(1'h0)]) - reg18) : $unsigned($signed($signed(reg24)))));
          reg300 <= $unsigned({$signed($signed((~reg20)))});
          if ($unsigned(reg300[(3'h6):(3'h6)]))
            begin
              reg301 <= (|((^~$unsigned((reg17 < reg14))) ?
                  reg18 : (wire297 ? $unsigned($unsigned((8'hbb))) : reg5)));
              reg302 <= reg20[(4'h9):(3'h7)];
              reg303 <= (($signed(reg16[(1'h1):(1'h0)]) ?
                  wire2[(3'h4):(1'h1)] : $signed((reg24[(3'h5):(1'h1)] < reg9))) ~^ $signed($signed($unsigned((reg5 != reg5)))));
              reg304 <= {(((&$unsigned((8'hb5))) ?
                          ($signed((8'haf)) ?
                              reg10[(3'h4):(2'h3)] : $signed(reg14)) : ($unsigned(reg11) ?
                              reg6[(2'h3):(2'h2)] : (|reg9))) ?
                      reg300 : {{(reg5 || reg8), (~wire0)}}),
                  ($signed((wire4 << (wire2 ? reg10 : (8'ha5)))) ?
                      $unsigned((^reg15)) : wire1[(4'hb):(4'ha)])};
            end
          else
            begin
              reg301 <= {$signed(reg300), $unsigned({wire12[(2'h2):(1'h0)]})};
              reg302 <= $unsigned((~&wire4));
              reg303 <= $signed(wire293);
            end
        end
      else
        begin
          reg299 <= ($signed($unsigned(reg303)) ^ ((^~($signed(reg11) ?
                  (!reg300) : reg14[(2'h2):(2'h2)])) ?
              $signed((~reg13)) : ($signed((~^(7'h42))) && ($unsigned(wire3) ?
                  $unsigned(wire2) : {wire0, reg18}))));
          reg300 <= wire4;
          reg301 <= ({(reg16 ?
                  ((~(8'ha1)) ? reg24[(4'hd):(4'h8)] : (8'h9f)) : ((^reg11) ?
                      (reg11 ? wire293 : reg16) : $signed(reg302))),
              ((^~$unsigned(reg15)) >>> {(-reg6)})} <= ((+(~((8'hbf) ?
                  (8'hbe) : (8'ha4)))) ?
              reg8[(3'h5):(1'h0)] : $unsigned($signed(reg304[(4'h9):(1'h0)]))));
        end
      reg305 <= ($unsigned(reg16[(3'h7):(3'h6)]) ?
          ((reg10[(2'h3):(2'h2)] ?
              $signed($unsigned(wire3)) : $unsigned((wire0 ?
                  reg6 : wire22))) <<< {$signed(wire293[(4'h8):(3'h4)]),
              $signed(wire12[(3'h7):(3'h5)])}) : (-$signed((~^reg13[(2'h3):(2'h3)]))));
      reg306 <= $unsigned(reg305);
    end
  assign wire307 = $signed((($signed(reg306) ?
                           $signed({(8'hbf),
                               reg299}) : $signed((reg302 < reg19))) ?
                       reg19 : ($signed((reg300 ? reg20 : reg23)) ?
                           $unsigned($signed(reg7)) : (~|$unsigned(wire22)))));
  module81 #() modinst309 (wire308, clk, reg16, reg300, wire12, reg21);
  assign wire310 = ($signed(((wire12[(1'h0):(1'h0)] ^~ reg9) ?
                           {wire2[(2'h2):(1'h1)]} : $signed((wire308 ?
                               reg5 : wire297)))) ?
                       (($unsigned((wire295 || reg302)) ?
                               reg305[(3'h5):(2'h3)] : (+(reg19 == reg8))) ?
                           $signed(wire12) : {((wire308 >>> wire2) ?
                                   ((8'haa) ?
                                       reg11 : reg18) : $signed(reg14))}) : (^$unsigned((~&(reg299 ?
                           (8'h9c) : reg9)))));
  assign wire311 = (reg300 == {(+$signed(reg20[(4'hd):(4'hd)]))});
  assign wire312 = reg9[(4'h8):(1'h0)];
  assign wire313 = reg10[(3'h4):(2'h2)];
  assign wire314 = (^~{$unsigned((~$unsigned(wire12))), reg19[(3'h6):(1'h0)]});
  module149 #() modinst316 (.wire152(reg5), .y(wire315), .wire153(reg11), .wire151(wire314), .wire154(wire308), .wire150(reg23), .clk(clk));
endmodule

module module25
#(parameter param292 = (!(({(~|(8'hb5)), (|(8'ha1))} >>> (((8'ha4) >> (8'ha4)) ? (&(8'hb9)) : ((7'h44) ? (8'had) : (8'haa)))) && (8'haf))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h312):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire29;
  input wire [(4'hc):(1'h0)] wire28;
  input wire [(5'h15):(1'h0)] wire27;
  input wire [(5'h13):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire146;
  wire signed [(4'he):(1'h0)] wire147;
  wire [(4'he):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire212;
  wire signed [(4'h9):(1'h0)] wire253;
  reg [(3'h5):(1'h0)] reg291 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg290 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg289 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg288 = (1'h0);
  reg [(4'hb):(1'h0)] reg287 = (1'h0);
  reg [(5'h11):(1'h0)] reg286 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg285 = (1'h0);
  reg [(4'h8):(1'h0)] reg284 = (1'h0);
  reg [(4'h8):(1'h0)] reg283 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg282 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg281 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg280 = (1'h0);
  reg [(5'h11):(1'h0)] reg279 = (1'h0);
  reg [(3'h5):(1'h0)] reg278 = (1'h0);
  reg [(4'hb):(1'h0)] reg277 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg276 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg275 = (1'h0);
  reg [(4'hf):(1'h0)] reg274 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg273 = (1'h0);
  reg [(5'h12):(1'h0)] reg272 = (1'h0);
  reg [(5'h10):(1'h0)] reg271 = (1'h0);
  reg [(4'h8):(1'h0)] reg270 = (1'h0);
  reg signed [(4'he):(1'h0)] reg269 = (1'h0);
  reg [(4'ha):(1'h0)] reg268 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg267 = (1'h0);
  reg [(5'h15):(1'h0)] reg266 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg265 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg264 = (1'h0);
  reg [(4'he):(1'h0)] reg263 = (1'h0);
  reg [(5'h13):(1'h0)] reg262 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg261 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg260 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg259 = (1'h0);
  reg [(3'h6):(1'h0)] reg258 = (1'h0);
  reg [(4'ha):(1'h0)] reg257 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg256 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg255 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  reg [(4'ha):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  assign y = {wire71,
                 wire30,
                 wire73,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire137,
                 wire146,
                 wire147,
                 wire148,
                 wire212,
                 wire253,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire30 = $unsigned(((~^((wire26 | wire27) >>> $unsigned((7'h44)))) << (-$unsigned($unsigned(wire27)))));
  module31 #() modinst72 (wire71, clk, wire27, wire29, wire30, wire26, wire28);
  assign wire73 = ((($signed(((8'hb4) ?
                          wire26 : wire30)) && wire28[(1'h1):(1'h0)]) ^~ wire28) ?
                      (~^wire28) : $unsigned($unsigned($signed(wire28[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      reg74 <= wire26;
      reg75 <= (reg74[(4'h9):(2'h2)] + (^~$signed(reg74)));
      reg76 <= (($unsigned((wire71 - (wire71 ~^ wire71))) * ($signed(wire29) != (8'hb5))) ?
          ($unsigned($unsigned((&wire30))) ^~ reg75) : {wire30[(3'h6):(2'h2)],
              $unsigned($signed((!wire27)))});
    end
  assign wire77 = ({wire73[(1'h1):(1'h0)],
                          $unsigned(((&wire29) * (wire71 ? wire73 : wire71)))} ?
                      $unsigned((|wire26[(3'h7):(3'h5)])) : (|$signed((wire30 && {wire26,
                          reg75}))));
  assign wire78 = $signed((+(^~$signed($unsigned(wire71)))));
  assign wire79 = $signed((8'ha0));
  assign wire80 = (^((reg75[(3'h7):(3'h5)] ?
                      ((~wire28) | {wire71}) : (8'ha0)) > {$unsigned(wire73)}));
  module81 #() modinst138 (.wire84(wire30), .wire83(reg76), .y(wire137), .wire85(wire26), .clk(clk), .wire82(reg74));
  always
    @(posedge clk) begin
      if (wire26[(3'h4):(3'h4)])
        begin
          reg139 <= (^~wire137);
          reg140 <= {{$unsigned(wire73[(1'h1):(1'h1)])}};
          reg141 <= $unsigned(($unsigned(wire80[(3'h4):(3'h4)]) + reg76));
          reg142 <= ($unsigned(((8'hb6) & ({(7'h41),
              wire78} >= wire30))) * (!$unsigned(wire30)));
        end
      else
        begin
          reg139 <= wire78[(4'hb):(2'h2)];
          reg140 <= wire79;
          reg141 <= wire29[(2'h3):(2'h3)];
          reg142 <= wire26[(3'h7):(2'h3)];
        end
      reg143 <= (reg142 ~^ $unsigned(($signed($unsigned(reg139)) - $unsigned(((8'hb7) ?
          reg142 : wire77)))));
      reg144 <= {(($unsigned(reg143[(4'h8):(2'h3)]) + (reg139[(1'h1):(1'h1)] >>> (~reg143))) ?
              wire79 : $signed($unsigned({wire73, wire26}))),
          $signed((~|($signed(reg141) ?
              $signed(wire27) : (reg74 ? reg140 : wire28))))};
      reg145 <= $signed($signed((~&$signed((~wire27)))));
    end
  assign wire146 = $unsigned((+(~|reg75)));
  assign wire147 = {(((wire79 ? (wire29 + (8'hb1)) : $signed(wire29)) ?
                           ({wire73, reg76} ?
                               $signed((8'hb1)) : (^~reg145)) : {$signed(reg145),
                               reg75}) <<< wire78),
                       ($unsigned(wire27[(5'h10):(3'h6)]) ?
                           (8'hb6) : ($signed($unsigned((8'h9d))) >= $signed($unsigned(wire28))))};
  assign wire148 = (~$signed(($signed(reg140[(4'h8):(2'h2)]) || wire80[(1'h0):(1'h0)])));
  module149 #() modinst213 (.clk(clk), .wire153(wire79), .wire151(wire147), .wire150(wire27), .wire152(wire80), .y(wire212), .wire154(reg139));
  module214 #() modinst254 (.wire215(wire27), .wire218(wire28), .y(wire253), .clk(clk), .wire217(reg141), .wire216(wire79));
  always
    @(posedge clk) begin
      reg255 <= {wire147[(2'h2):(1'h1)], {{$signed(reg144)}, (~wire77)}};
      if ($unsigned(($signed($unsigned((+reg139))) ?
          $signed($signed(wire78)) : reg143[(5'h11):(4'hc)])))
        begin
          reg256 <= $unsigned(((((wire26 ? reg144 : wire79) ^ wire137) ?
              (~^reg145[(3'h6):(1'h0)]) : ($signed(reg145) * reg145)) != wire28[(3'h7):(3'h4)]));
          reg257 <= (wire29 + (((reg139[(1'h0):(1'h0)] ?
                  (|wire147) : wire78[(4'he):(1'h0)]) && ({wire137, wire80} ?
                  $signed(reg76) : (wire27 & wire212))) ?
              wire148 : ((wire147 != reg76) ?
                  (wire73 ?
                      {reg139, reg145} : {reg143,
                          wire71}) : wire79[(2'h3):(2'h3)])));
          reg258 <= reg255;
          reg259 <= $signed(({($unsigned(reg141) && {reg258})} >> $unsigned($signed(reg143))));
          reg260 <= $unsigned(((^~(7'h42)) ?
              reg76[(5'h14):(3'h4)] : (($signed(wire80) ?
                  (+reg256) : (^~wire137)) * ($signed(reg74) | (wire78 ?
                  wire147 : wire28)))));
        end
      else
        begin
          reg256 <= wire78[(4'hb):(2'h2)];
          if (($signed(reg256[(3'h6):(3'h4)]) ^ wire26[(4'hc):(1'h0)]))
            begin
              reg257 <= $unsigned({(&reg142)});
              reg258 <= (reg144[(1'h1):(1'h0)] ?
                  (|wire78[(1'h0):(1'h0)]) : (wire147 ?
                      (-(((8'hac) ?
                          wire137 : wire212) >>> wire27[(4'ha):(1'h0)])) : (((wire73 ?
                          reg255 : (8'hb4)) != {reg259}) | wire80)));
              reg259 <= wire73[(2'h2):(2'h2)];
            end
          else
            begin
              reg257 <= {$signed($unsigned((wire30[(4'ha):(3'h4)] || reg257)))};
              reg258 <= ((-$signed((reg140[(3'h6):(1'h1)] ?
                  $signed(wire79) : ((8'hb4) & (7'h43))))) + $unsigned(reg74));
              reg259 <= (&reg76[(4'h8):(2'h2)]);
            end
          if (reg255[(1'h0):(1'h0)])
            begin
              reg260 <= {$signed((~&$unsigned($unsigned(wire78))))};
              reg261 <= (reg260[(4'hd):(3'h7)] >>> (-$signed(((reg75 ?
                      (7'h40) : reg141) ?
                  {wire253} : $signed(reg140)))));
            end
          else
            begin
              reg260 <= wire29[(3'h4):(2'h3)];
              reg261 <= reg260;
              reg262 <= $unsigned({$unsigned(((reg140 >>> reg259) ^~ (^~reg256)))});
            end
          if ($unsigned($signed($signed(({reg259,
              wire137} && ((8'hbc) & reg76))))))
            begin
              reg263 <= ((7'h42) ?
                  reg257[(1'h1):(1'h1)] : $unsigned(((^{wire77, reg262}) ?
                      $unsigned(reg261[(2'h3):(2'h2)]) : (wire212[(1'h1):(1'h1)] ?
                          $unsigned(reg139) : wire137[(4'hb):(3'h7)]))));
              reg264 <= (^(~&$unsigned(($signed(reg76) ^ reg263))));
              reg265 <= (((-($signed(wire73) || reg259[(4'hd):(4'hb)])) ^~ $signed($signed((wire80 | wire71)))) ?
                  $unsigned(($signed((reg257 ?
                      (8'h9c) : reg255)) + $signed(wire148))) : $signed($unsigned($unsigned((wire212 ?
                      reg257 : reg144)))));
              reg266 <= $signed(((8'hb3) ?
                  {((7'h43) <= (reg76 ?
                          reg265 : reg263))} : $signed(($unsigned(reg76) ?
                      $signed(wire78) : (7'h40)))));
              reg267 <= $unsigned((reg265 ?
                  ((^~reg144) <= ({reg263, reg76} ?
                      $unsigned(wire71) : {wire29})) : ({(reg259 ?
                              wire30 : wire78)} ?
                      reg143[(4'hb):(1'h1)] : reg144)));
            end
          else
            begin
              reg263 <= wire77[(4'he):(1'h1)];
              reg264 <= (+reg256);
              reg265 <= ($unsigned(wire78[(1'h0):(1'h0)]) | reg256);
              reg266 <= wire26[(2'h2):(1'h0)];
            end
        end
      reg268 <= (|(~({(wire26 + reg266),
          (wire146 ? reg259 : wire29)} << (^$signed(reg266)))));
    end
  always
    @(posedge clk) begin
      reg269 <= {(&wire147[(1'h0):(1'h0)]),
          (reg257[(1'h0):(1'h0)] ?
              {(!(wire28 ? reg141 : wire212)),
                  reg257} : ((wire27 + $signed(wire29)) >>> {wire212}))};
      reg270 <= {($signed((^(wire28 ?
              (8'ha9) : wire30))) <= $unsigned({(reg143 == wire26),
              ((8'ha1) - wire26)})),
          {($signed($signed(wire77)) & ($unsigned(wire147) <<< {(8'ha4),
                  wire29})),
              reg264}};
      reg271 <= reg255;
      if ((wire78 <<< ((&reg261[(1'h0):(1'h0)]) | $signed($unsigned((~|wire30))))))
        begin
          reg272 <= $signed(wire26[(2'h2):(1'h0)]);
          reg273 <= wire80[(4'h9):(4'h8)];
          if (wire73)
            begin
              reg274 <= (~^{$signed(reg266),
                  $signed(((reg256 ? reg268 : reg145) ?
                      (wire146 != reg139) : (reg142 ? reg143 : wire253)))});
              reg275 <= wire79[(1'h0):(1'h0)];
              reg276 <= ($unsigned(wire78[(5'h10):(2'h3)]) - $unsigned(reg260[(4'h8):(4'h8)]));
            end
          else
            begin
              reg274 <= $unsigned((+$unsigned(($signed((8'hb7)) ?
                  $signed(wire71) : (&(8'hb6))))));
              reg275 <= ((&((8'hab) ?
                  {reg267} : ($unsigned(reg140) <= (wire212 - wire79)))) << $signed($signed(reg262[(1'h0):(1'h0)])));
            end
          reg277 <= ($signed((8'h9e)) ~^ $unsigned(reg263));
          if (reg261[(4'hf):(4'he)])
            begin
              reg278 <= $unsigned($signed((^~reg143[(4'hb):(3'h5)])));
              reg279 <= (~^({reg278} - $signed($unsigned(wire27))));
            end
          else
            begin
              reg278 <= reg145[(5'h10):(4'he)];
              reg279 <= reg75;
              reg280 <= (8'ha7);
              reg281 <= $signed(reg276[(3'h4):(1'h0)]);
            end
        end
      else
        begin
          reg272 <= $signed((8'ha1));
          reg273 <= $signed($unsigned(reg278[(1'h0):(1'h0)]));
          if (((reg269 * wire253[(2'h2):(2'h2)]) ?
              (^$unsigned(reg257)) : ($unsigned(((reg259 != reg257) ?
                  (reg266 ?
                      reg74 : wire79) : reg74[(3'h6):(2'h2)])) < (reg143[(4'h9):(3'h5)] << (reg265 ?
                  (8'hbb) : (8'hb5))))))
            begin
              reg274 <= $unsigned($unsigned((~(reg74[(4'hb):(2'h2)] >= (!wire80)))));
              reg275 <= ((^($signed($signed(reg141)) >>> $unsigned($unsigned(reg278)))) >= ({(~reg269),
                  (&$unsigned(reg76))} | reg259));
              reg276 <= reg272;
            end
          else
            begin
              reg274 <= ($signed(($unsigned({reg268, reg140}) < (~|(reg75 ?
                      wire146 : reg263)))) ?
                  (reg273[(3'h7):(3'h5)] ?
                      ($signed((reg275 ?
                          reg143 : reg260)) && reg74) : (reg260[(4'hf):(4'hf)] <<< {(&(8'ha2)),
                          {reg139, (8'h9c)}})) : reg266);
            end
        end
      if (reg265[(1'h1):(1'h1)])
        begin
          reg282 <= wire26;
          reg283 <= (wire28 ?
              $unsigned((7'h43)) : (|($signed(reg140[(4'h9):(2'h2)]) ?
                  {$signed(wire71)} : ($signed(reg270) & $signed((8'ha5))))));
          reg284 <= {((reg283 ?
                  (+((8'h9f) | wire77)) : reg264[(3'h6):(3'h5)]) ^ {reg280}),
              wire146};
          reg285 <= $signed(reg263[(3'h7):(1'h0)]);
          if (($signed(($unsigned($signed(reg276)) ?
              ($signed(reg274) ^ reg143[(4'hf):(4'hf)]) : (reg142 ?
                  wire147 : (^reg258)))) == wire253))
            begin
              reg286 <= $signed(reg140[(3'h4):(2'h2)]);
              reg287 <= ((($unsigned((~^reg280)) ?
                      wire137[(4'hf):(2'h2)] : $unsigned($signed(reg281))) ?
                  ({((8'ha8) ? reg144 : wire29), reg282[(2'h2):(2'h2)]} ?
                      $unsigned(reg286) : (-reg139[(3'h6):(3'h4)])) : (~&{(!(8'hb0))})) ~^ $unsigned($signed(reg281[(2'h2):(2'h2)])));
              reg288 <= wire148[(3'h7):(1'h1)];
              reg289 <= (($unsigned($signed(wire253[(3'h4):(1'h0)])) ?
                      reg142 : {(&wire78[(4'hb):(3'h4)])}) ?
                  wire147 : reg273);
              reg290 <= $signed((wire147 < (~reg76[(5'h10):(4'hc)])));
            end
          else
            begin
              reg286 <= reg268;
            end
        end
      else
        begin
          reg282 <= $unsigned((reg260[(4'hb):(3'h5)] ?
              reg142[(4'hc):(2'h3)] : ({wire26[(4'ha):(3'h4)]} ?
                  $signed($unsigned(reg281)) : ((reg255 ?
                      wire26 : reg282) | (reg285 == reg255)))));
          if ((($unsigned($signed({reg266, reg276})) ?
                  $signed(({reg142, (8'hb9)} ?
                      $unsigned((8'ha2)) : $unsigned(reg281))) : reg257[(3'h6):(3'h4)]) ?
              (&(wire26 << wire73)) : wire28[(2'h2):(1'h0)]))
            begin
              reg283 <= wire80;
              reg284 <= reg255;
              reg285 <= {(^~($unsigned(reg290) != $unsigned((&reg276))))};
              reg286 <= wire26[(4'h8):(3'h4)];
              reg287 <= $signed(reg262[(4'hc):(3'h6)]);
            end
          else
            begin
              reg283 <= (!$unsigned(reg286));
              reg284 <= wire80[(4'h9):(1'h1)];
            end
          if ($unsigned($unsigned((~^({reg140} ?
              $signed(reg280) : {wire148})))))
            begin
              reg288 <= $signed($unsigned((((reg275 ? reg258 : reg261) ?
                      reg262[(5'h13):(4'hf)] : (reg286 < wire77)) ?
                  (8'hb3) : $signed(reg145))));
            end
          else
            begin
              reg288 <= (~$signed({(&reg268[(3'h4):(2'h3)]),
                  (reg76[(3'h6):(2'h3)] ^~ $unsigned(reg264))}));
              reg289 <= (8'hb5);
              reg290 <= reg260;
            end
          reg291 <= wire30;
        end
    end
endmodule

module module214
#(parameter param252 = ({((^((8'hbb) ? (8'ha1) : (8'ha1))) ? (~|((8'hbe) ? (8'hbd) : (8'ha0))) : ((~(8'hb9)) ? ((8'hb8) >> (8'h9e)) : (+(8'hae)))), ((((8'ha1) && (8'haf)) - ((8'ha6) ? (8'hab) : (8'ha6))) >> ((-(8'hbe)) ^~ ((8'ha8) | (8'h9c))))} << ({(&((8'hbc) ? (8'ha9) : (8'hbc))), (((8'hb8) < (7'h43)) ? ((8'ha9) ? (8'hae) : (7'h41)) : (^~(8'hae)))} ? ((-((8'ha3) ? (7'h41) : (8'ha5))) || {(-(8'hb2)), ((7'h41) <= (8'hb3))}) : {({(8'ha6)} - (!(8'ha0))), (((7'h44) ? (8'hbe) : (7'h44)) < (&(8'had)))})))
(y, clk, wire218, wire217, wire216, wire215);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire218;
  input wire [(3'h6):(1'h0)] wire217;
  input wire [(2'h2):(1'h0)] wire216;
  input wire signed [(4'h8):(1'h0)] wire215;
  wire signed [(2'h2):(1'h0)] wire251;
  wire [(4'hf):(1'h0)] wire250;
  wire signed [(4'ha):(1'h0)] wire249;
  wire signed [(2'h2):(1'h0)] wire248;
  wire [(3'h6):(1'h0)] wire247;
  wire [(2'h2):(1'h0)] wire246;
  wire [(3'h4):(1'h0)] wire240;
  wire [(5'h14):(1'h0)] wire224;
  wire [(4'hf):(1'h0)] wire223;
  wire [(4'hb):(1'h0)] wire222;
  wire [(5'h10):(1'h0)] wire221;
  wire signed [(5'h15):(1'h0)] wire220;
  wire [(5'h11):(1'h0)] wire219;
  reg [(3'h6):(1'h0)] reg245 = (1'h0);
  reg [(4'h8):(1'h0)] reg244 = (1'h0);
  reg [(4'h9):(1'h0)] reg243 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg242 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg241 = (1'h0);
  reg [(5'h11):(1'h0)] reg239 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg238 = (1'h0);
  reg [(5'h10):(1'h0)] reg237 = (1'h0);
  reg [(4'hf):(1'h0)] reg236 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg235 = (1'h0);
  reg [(4'h9):(1'h0)] reg234 = (1'h0);
  reg [(3'h5):(1'h0)] reg233 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg232 = (1'h0);
  reg [(4'he):(1'h0)] reg231 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg230 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg229 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg228 = (1'h0);
  reg [(5'h12):(1'h0)] reg227 = (1'h0);
  reg [(5'h11):(1'h0)] reg226 = (1'h0);
  reg [(4'ha):(1'h0)] reg225 = (1'h0);
  assign y = {wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire240,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 (1'h0)};
  assign wire219 = $signed($unsigned((~^$unsigned($signed(wire218)))));
  assign wire220 = wire219;
  assign wire221 = wire216[(1'h0):(1'h0)];
  assign wire222 = wire219;
  assign wire223 = $signed($signed($signed(wire221)));
  assign wire224 = (^~$unsigned($unsigned((~^{wire215}))));
  always
    @(posedge clk) begin
      if (wire216)
        begin
          reg225 <= ((8'hbf) ?
              {$signed({$unsigned(wire217)})} : {({(wire220 ?
                              wire218 : wire218),
                          (wire222 ? wire221 : wire220)} ?
                      wire218 : (!wire218[(2'h2):(1'h0)])),
                  wire223[(4'hd):(3'h6)]});
        end
      else
        begin
          reg225 <= wire216;
          reg226 <= {(~|wire216),
              (wire220[(2'h3):(2'h3)] < $unsigned((~|(+wire217))))};
          reg227 <= wire220[(5'h13):(4'h8)];
          reg228 <= (~^(~|((~|$signed((8'ha6))) ?
              ((wire220 >>> wire222) ?
                  (reg225 ?
                      wire219 : wire217) : (!wire224)) : reg225[(2'h2):(1'h1)])));
          reg229 <= {reg225[(3'h7):(3'h4)], reg227[(5'h10):(3'h4)]};
        end
      if ($unsigned($signed((8'h9e))))
        begin
          reg230 <= ($unsigned((((wire219 && wire223) ?
              $signed(wire223) : reg225[(4'h8):(2'h3)]) < wire224)) * reg226[(5'h10):(1'h1)]);
        end
      else
        begin
          if ((-$unsigned($signed(($signed((7'h44)) ?
              $signed(reg225) : $signed(reg227))))))
            begin
              reg230 <= $unsigned(wire223[(1'h1):(1'h1)]);
              reg231 <= ((reg228[(3'h6):(3'h5)] ?
                  ((&reg226) ?
                      wire215[(4'h8):(1'h1)] : $signed($signed((8'ha9)))) : $unsigned((~(|(8'ha9))))) >> (^(-$unsigned(((7'h42) ?
                  wire218 : (8'ha5))))));
              reg232 <= reg230;
              reg233 <= ($unsigned(wire216) ?
                  (~&{((^wire220) != $signed(wire216)),
                      $signed({wire220})}) : (^~(wire221 ?
                      ($unsigned((8'hba)) ?
                          ((8'hb6) | wire218) : (reg232 > wire218)) : (+(~wire216)))));
            end
          else
            begin
              reg230 <= reg230[(1'h0):(1'h0)];
              reg231 <= ((reg230 <<< (^~(8'hbe))) & $unsigned(({wire217[(2'h3):(2'h2)]} ?
                  wire220[(3'h4):(2'h3)] : {$signed(wire218)})));
              reg232 <= $unsigned({($unsigned((wire217 != wire224)) ?
                      (((8'hab) ? reg225 : reg231) ?
                          (wire218 < reg233) : (wire223 ?
                              wire221 : wire219)) : wire224[(4'hf):(3'h7)]),
                  (^~$unsigned((reg227 ? reg226 : reg226)))});
              reg233 <= wire222[(2'h2):(1'h0)];
              reg234 <= wire224;
            end
          reg235 <= ((8'hac) ~^ reg225[(1'h1):(1'h0)]);
        end
      reg236 <= $signed($signed((reg232[(3'h4):(2'h2)] == $signed((|reg232)))));
      if ((^~(reg233[(2'h3):(1'h0)] ?
          (wire218[(4'ha):(2'h2)] - ((8'hbc) ^~ $signed(wire221))) : (wire224[(1'h1):(1'h0)] ?
              $unsigned($signed((7'h44))) : reg236[(3'h5):(3'h5)]))))
        begin
          reg237 <= $signed(reg228);
        end
      else
        begin
          reg237 <= $unsigned((($signed((reg235 ? (8'haa) : reg225)) ?
                  $unsigned($signed(reg234)) : {(~&(8'hbc)), (~&wire224)}) ?
              wire221 : reg228[(3'h7):(3'h7)]));
          reg238 <= {$signed((((~reg229) ?
                  {reg232} : {reg231,
                      wire218}) + $unsigned(reg237[(2'h2):(1'h0)])))};
          reg239 <= reg233;
        end
    end
  assign wire240 = $signed(reg229[(4'hb):(3'h6)]);
  always
    @(posedge clk) begin
      if ({$signed(reg225[(2'h2):(1'h1)]),
          {((7'h43) <= ((!wire218) & wire223[(4'he):(4'hd)]))}})
        begin
          reg241 <= (reg239[(5'h10):(4'he)] ?
              (8'ha7) : {(+((wire217 + wire215) <<< (!wire219)))});
          reg242 <= (~^reg241[(4'hb):(3'h6)]);
          reg243 <= reg234[(3'h7):(2'h3)];
          reg244 <= reg243[(2'h3):(1'h1)];
        end
      else
        begin
          reg241 <= $signed($signed(wire220[(3'h6):(1'h1)]));
          reg242 <= ((-($signed((reg236 & wire224)) >>> wire218)) & ((($signed(reg236) >= wire220) > (+(&wire224))) <= {$signed(wire240[(1'h1):(1'h0)]),
              (wire240 ? $signed(reg229) : $unsigned(wire217))}));
          reg243 <= wire215[(2'h2):(1'h0)];
        end
      reg245 <= wire219[(4'hc):(1'h0)];
    end
  assign wire246 = ((8'ha3) ^ (({(wire223 ? wire222 : wire219),
                       $signed((7'h44))} - $signed($signed(reg231))) != reg230[(2'h3):(1'h1)]));
  assign wire247 = ($unsigned({(^$unsigned((8'haf)))}) ?
                       $unsigned(reg242[(3'h6):(3'h5)]) : ($signed(wire246) ?
                           reg232 : {((wire223 ?
                                   wire215 : reg230) || $signed(reg234)),
                               reg230[(2'h3):(1'h1)]}));
  assign wire248 = ((reg226 > (~|$unsigned((wire240 >>> wire216)))) ?
                       (wire220[(5'h12):(4'ha)] ?
                           $signed((-$signed((8'hba)))) : (!{(^~wire224)})) : reg242[(3'h6):(1'h0)]);
  assign wire249 = $signed(reg236[(3'h6):(1'h1)]);
  assign wire250 = (((~|$signed(((7'h40) != reg237))) == ({{wire217},
                           (^wire216)} ?
                       $signed((reg230 ?
                           wire220 : reg235)) : (|reg235[(3'h4):(1'h1)]))) || reg230[(3'h7):(3'h4)]);
  assign wire251 = reg243;
endmodule

module module149
#(parameter param211 = (8'hb5))
(y, clk, wire154, wire153, wire152, wire151, wire150);
  output wire [(32'h294):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire154;
  input wire signed [(2'h3):(1'h0)] wire153;
  input wire signed [(5'h12):(1'h0)] wire152;
  input wire signed [(3'h7):(1'h0)] wire151;
  input wire [(3'h5):(1'h0)] wire150;
  wire signed [(4'hb):(1'h0)] wire210;
  wire signed [(4'h8):(1'h0)] wire209;
  wire signed [(4'hd):(1'h0)] wire208;
  wire [(5'h15):(1'h0)] wire207;
  wire signed [(5'h14):(1'h0)] wire205;
  wire signed [(4'hc):(1'h0)] wire204;
  wire signed [(4'h8):(1'h0)] wire203;
  wire [(3'h7):(1'h0)] wire202;
  wire [(4'ha):(1'h0)] wire199;
  wire [(4'h8):(1'h0)] wire198;
  wire [(5'h10):(1'h0)] wire197;
  wire signed [(3'h4):(1'h0)] wire196;
  wire [(5'h14):(1'h0)] wire180;
  wire [(5'h13):(1'h0)] wire179;
  wire [(4'ha):(1'h0)] wire178;
  wire [(3'h7):(1'h0)] wire155;
  reg [(4'ha):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg200 = (1'h0);
  reg [(4'hc):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg194 = (1'h0);
  reg [(3'h6):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg192 = (1'h0);
  reg [(4'hb):(1'h0)] reg191 = (1'h0);
  reg [(4'h8):(1'h0)] reg190 = (1'h0);
  reg [(4'hf):(1'h0)] reg189 = (1'h0);
  reg [(3'h7):(1'h0)] reg188 = (1'h0);
  reg [(3'h6):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg185 = (1'h0);
  reg [(4'h8):(1'h0)] reg184 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg182 = (1'h0);
  reg [(5'h10):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg172 = (1'h0);
  reg [(3'h5):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg170 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg169 = (1'h0);
  reg [(5'h13):(1'h0)] reg168 = (1'h0);
  reg [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(3'h7):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(5'h11):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg159 = (1'h0);
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  assign y = {wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire180,
                 wire179,
                 wire178,
                 wire155,
                 reg206,
                 reg201,
                 reg200,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
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
                 reg177,
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
                 (1'h0)};
  assign wire155 = {$unsigned($signed(wire152[(4'hf):(3'h7)])),
                       ({($signed(wire152) >= wire150[(2'h3):(1'h1)])} ^ wire151)};
  always
    @(posedge clk) begin
      reg156 <= (8'hba);
      reg157 <= (($signed(wire155[(3'h4):(2'h2)]) ?
          $unsigned($signed((wire152 ^ (8'ha2)))) : wire152) && (&(((wire153 ?
                  wire154 : wire150) ?
              wire151[(3'h5):(2'h2)] : {wire155}) ?
          $unsigned((reg156 ?
              wire155 : wire155)) : $signed($unsigned(reg156)))));
      reg158 <= wire152;
      reg159 <= (+wire155[(2'h2):(1'h1)]);
      reg160 <= wire150;
    end
  always
    @(posedge clk) begin
      if ({((~^{wire151[(2'h2):(1'h0)],
              (wire151 ?
                  wire151 : wire151)}) != $signed($unsigned((reg160 ^ (8'h9f))))),
          $unsigned($signed(reg157[(3'h6):(3'h5)]))})
        begin
          reg161 <= ($unsigned(wire153) ?
              (((|$signed(wire151)) ? {reg160} : ({wire154} >>> {wire154})) ?
                  reg157 : reg158[(3'h4):(3'h4)]) : (!(!(reg159[(1'h1):(1'h0)] ?
                  $signed(wire150) : reg159))));
          if ((wire153[(1'h0):(1'h0)] ?
              ((-wire152) ?
                  $unsigned($unsigned(wire150)) : $signed(reg161[(1'h0):(1'h0)])) : ($unsigned(((wire152 ?
                      reg156 : reg161) ?
                  wire151[(2'h3):(1'h0)] : ((8'ha1) ^ reg156))) != $signed(wire155))))
            begin
              reg162 <= wire153;
              reg163 <= (~^{(^~(-wire150))});
              reg164 <= $signed((reg159 <<< (wire150 * $unsigned(reg156))));
            end
          else
            begin
              reg162 <= $signed(reg158[(3'h4):(2'h2)]);
              reg163 <= (8'hbc);
              reg164 <= {(^(wire153[(1'h1):(1'h1)] ?
                      ($signed(reg164) ?
                          (~&wire153) : (wire151 ?
                              reg158 : (8'ha8))) : ((&reg162) ?
                          $unsigned(wire150) : $signed((8'ha2))))),
                  $signed({((|reg158) ? ((7'h43) < wire153) : $signed(reg164)),
                      reg158[(3'h6):(2'h3)]})};
              reg165 <= ($unsigned(($signed($unsigned(wire150)) | {$signed(reg158),
                      $signed((8'ha7))})) ?
                  $unsigned({{$signed(reg159)},
                      (wire151[(1'h1):(1'h1)] ?
                          $unsigned(wire155) : $unsigned(reg157))}) : (~^($unsigned((wire152 && reg156)) != reg156)));
            end
          if ($signed({(((reg158 ? reg164 : reg164) ? (!reg160) : reg163) ?
                  ((reg156 <= reg164) || wire153[(1'h0):(1'h0)]) : reg160)}))
            begin
              reg166 <= reg158[(3'h4):(1'h0)];
              reg167 <= $signed(((reg158 ?
                  {reg165,
                      (~^wire150)} : $signed($unsigned(wire150))) + $signed(reg166[(2'h2):(2'h2)])));
              reg168 <= reg165[(3'h4):(3'h4)];
            end
          else
            begin
              reg166 <= (~{($signed((reg162 || wire155)) ?
                      $signed((~reg161)) : $unsigned($unsigned(wire151)))});
              reg167 <= ((-$signed((-wire153))) < ((7'h42) ?
                  (~^((-reg165) ?
                      {(8'hbc)} : (wire150 ? (8'h9e) : (8'hab)))) : (8'hb0)));
              reg168 <= $unsigned(wire155);
            end
          if ($signed((reg167 ? (8'hbd) : reg168[(5'h13):(4'h8)])))
            begin
              reg169 <= (wire150 ^~ reg158);
              reg170 <= wire152;
              reg171 <= {(~^$unsigned(((reg170 & reg168) > $signed((8'h9e))))),
                  $unsigned($unsigned((reg163 - reg161[(4'h9):(3'h4)])))};
            end
          else
            begin
              reg169 <= (^(reg164 ?
                  (reg160 != (+(~^reg157))) : ((&reg167) < $signed(wire153))));
              reg170 <= {$signed($unsigned($signed((!reg168)))),
                  (reg165 <<< reg164[(4'ha):(4'ha)])};
              reg171 <= $unsigned((|{{$unsigned(reg164),
                      (reg158 ? reg159 : (7'h43))},
                  ((&wire152) ? reg170 : (reg163 ? reg169 : reg162))}));
              reg172 <= reg159[(1'h1):(1'h1)];
            end
          reg173 <= (~^reg163[(2'h3):(1'h1)]);
        end
      else
        begin
          reg161 <= reg163;
          reg162 <= ($signed(((reg164[(1'h0):(1'h0)] ?
                  (|(8'ha7)) : reg159[(3'h5):(3'h5)]) ?
              wire155[(3'h6):(2'h2)] : ((reg168 | wire155) || reg162[(4'he):(4'hb)]))) >> (+reg168));
        end
      if (reg169)
        begin
          reg174 <= $unsigned((~|$unsigned(wire153[(1'h1):(1'h1)])));
        end
      else
        begin
          reg174 <= (-(8'hb2));
          reg175 <= reg171[(1'h0):(1'h0)];
        end
      reg176 <= (|$unsigned($unsigned($unsigned((^reg163)))));
    end
  always
    @(posedge clk) begin
      reg177 <= (($unsigned(reg163[(4'h8):(2'h3)]) <<< wire152[(4'hc):(4'ha)]) ?
          $unsigned({$unsigned((wire154 ^ wire155)),
              ($signed(reg170) ^ {reg157, reg157})}) : ((~&($signed(wire152) ?
              reg172 : reg172[(1'h1):(1'h1)])) && (&($unsigned((8'hb1)) ?
              $signed(reg158) : $signed((7'h40))))));
    end
  assign wire178 = $unsigned((-((~reg158[(3'h4):(1'h0)]) ^~ (reg162 || $signed(reg164)))));
  assign wire179 = ((8'h9c) ?
                       (!($unsigned((reg161 ?
                           reg176 : reg176)) - $signed(((8'hba) + reg165)))) : (7'h42));
  assign wire180 = $unsigned({($unsigned({reg164}) ?
                           (&$unsigned(wire179)) : $signed(wire153[(2'h2):(1'h1)]))});
  always
    @(posedge clk) begin
      reg181 <= (&(&$signed(({reg163, reg170} ?
          (~|reg160) : (wire155 & wire150)))));
      if ($unsigned(reg169[(2'h2):(1'h1)]))
        begin
          reg182 <= reg175[(4'h8):(1'h0)];
          reg183 <= (($unsigned(reg159) ?
                  $unsigned(wire153[(1'h1):(1'h1)]) : (!$signed($unsigned(reg162)))) ?
              (((&reg162) ? {(reg182 > wire152), $unsigned((8'hbb))} : reg177) ?
                  (8'hac) : $signed((~^(reg173 >>> reg168)))) : {$unsigned(reg176),
                  ((8'ha1) ? (!(wire154 < reg162)) : {$signed(reg177)})});
        end
      else
        begin
          reg182 <= wire150[(2'h2):(1'h1)];
          reg183 <= (($signed((reg160[(4'ha):(4'h9)] < reg160[(4'h9):(4'h8)])) ?
                  (&reg164[(4'hc):(4'h9)]) : (wire152[(4'ha):(3'h5)] ?
                      reg171 : $signed((&reg158)))) ?
              ((~{$unsigned(wire154), reg183}) ?
                  ({wire154, (reg156 * reg182)} ?
                      $unsigned($unsigned(reg172)) : (!reg167)) : (^reg159[(3'h4):(3'h4)])) : reg183);
          reg184 <= wire155[(3'h4):(2'h2)];
        end
      if ($signed({reg158[(3'h7):(3'h6)]}))
        begin
          reg185 <= {{(|((reg172 >> reg160) ?
                      (wire153 ? wire179 : reg160) : (reg183 >= reg156))),
                  (-($signed((8'h9c)) ?
                      $unsigned(reg168) : (reg176 <= reg173)))}};
          if ($signed((8'hbd)))
            begin
              reg186 <= reg183;
              reg187 <= reg176[(4'hb):(4'ha)];
              reg188 <= reg168;
            end
          else
            begin
              reg186 <= $signed(((+$unsigned($signed(wire178))) ?
                  reg165 : {$signed($signed(wire180)), (wire155 & (8'hbb))}));
              reg187 <= ($signed($unsigned($unsigned(reg186))) ?
                  (~(reg156 - $unsigned((-reg186)))) : reg184[(2'h3):(1'h1)]);
              reg188 <= (wire151[(3'h4):(1'h0)] > wire155[(2'h3):(1'h0)]);
              reg189 <= ($unsigned(reg168[(5'h13):(4'h9)]) < (wire152 ?
                  $unsigned($signed((reg169 ?
                      reg170 : reg168))) : {$signed((reg184 ?
                          reg161 : wire179)),
                      $signed({reg185})}));
              reg190 <= (&reg172);
            end
          reg191 <= $unsigned({($unsigned((~^reg174)) ?
                  ((reg165 ? wire179 : (8'ha6)) ?
                      (reg162 ?
                          (8'had) : reg160) : $unsigned(reg158)) : reg161[(3'h5):(1'h1)]),
              (((reg162 ?
                  wire178 : wire150) - (reg177 ^ (8'ha7))) >>> (!reg174))});
          reg192 <= ($signed($signed((|$unsigned(reg161)))) ?
              (((wire180[(4'ha):(2'h2)] ?
                      $signed(reg169) : (wire180 ~^ wire178)) ^~ {reg191[(4'ha):(2'h3)]}) ?
                  $signed(($unsigned(reg169) ?
                      (^reg170) : $unsigned((8'hbc)))) : $signed($signed((!reg169)))) : reg177);
          reg193 <= (|$signed((($signed(reg175) ?
                  (reg191 & reg191) : ((8'hb5) ? reg171 : (8'h9c))) ?
              reg174 : $signed(wire153))));
        end
      else
        begin
          reg185 <= ($signed(reg186[(1'h1):(1'h1)]) ^~ (($unsigned(reg177) ^ ($signed(reg162) == (~|reg184))) ?
              wire152[(3'h5):(2'h2)] : $signed({(wire178 ? reg171 : reg174),
                  reg156})));
          reg186 <= ((|reg185[(3'h4):(2'h3)]) ?
              reg188 : (reg185[(4'h9):(3'h7)] ^ {(+(^~reg192)), reg181}));
          reg187 <= (^~((-($unsigned((7'h44)) - (8'ha8))) != wire179[(1'h0):(1'h0)]));
          reg188 <= $signed(reg161[(4'hc):(4'ha)]);
        end
      reg194 <= ((reg168 ?
              ((&reg173) <= $unsigned((reg175 + reg181))) : reg159) ?
          ((reg156[(3'h7):(1'h1)] - (!(reg156 ? reg191 : wire179))) ?
              reg163[(4'hc):(3'h5)] : reg157[(1'h1):(1'h1)]) : (^($unsigned($signed(reg177)) << {{reg158},
              $unsigned(wire154)})));
      reg195 <= reg189;
    end
  assign wire196 = $unsigned($unsigned(reg193));
  assign wire197 = $signed((wire196[(2'h2):(2'h2)] ?
                       (^reg173[(4'hf):(4'hc)]) : $signed($unsigned((8'h9e)))));
  assign wire198 = {reg181[(3'h7):(2'h2)]};
  assign wire199 = (reg182 ? reg159[(3'h7):(2'h3)] : reg167[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg200 <= wire197[(1'h1):(1'h0)];
      reg201 <= (($signed((!wire196[(1'h0):(1'h0)])) || ((wire154[(1'h1):(1'h0)] && reg177[(3'h5):(3'h4)]) >> $unsigned(reg171))) <<< (((!(~|reg167)) ?
          (8'hab) : ((reg165 <= reg158) + (reg172 ?
              reg188 : reg165))) <<< reg200));
    end
  assign wire202 = ({(&wire150)} ? $signed(wire178) : (8'hb6));
  assign wire203 = (~^reg164);
  assign wire204 = wire180;
  assign wire205 = {$signed($unsigned((^~(reg160 != reg157))))};
  always
    @(posedge clk) begin
      reg206 <= $signed(reg170);
    end
  assign wire207 = (^($unsigned($unsigned((reg168 | reg195))) <= reg192[(2'h2):(2'h2)]));
  assign wire208 = wire178;
  assign wire209 = $unsigned((wire202 & $signed(reg181)));
  assign wire210 = {((($unsigned(reg163) ?
                               (reg176 > wire197) : (wire199 ?
                                   reg187 : reg158)) ^ ($signed((8'hab)) < (-reg177))) ?
                           ((7'h42) ?
                               ((reg169 ?
                                   (7'h41) : (8'hbb)) ^ $unsigned(wire196)) : reg201) : (wire204[(4'h9):(2'h3)] ^~ reg164))};
endmodule

module module81
#(parameter param135 = (((~|(+((8'haa) ? (8'hbf) : (8'h9c)))) > ((^((7'h40) ~^ (8'h9e))) ^ (^~(!(8'h9f))))) ^~ (^~({{(8'hab)}} ? (~|(!(8'ha8))) : (((8'hb0) << (8'ha9)) ? {(8'hbc)} : (+(8'hb7)))))), 
parameter param136 = {(param135 != (((param135 ? param135 : (8'had)) ? (param135 < param135) : (param135 ? (8'hb4) : param135)) ? ((param135 ? param135 : param135) << ((8'hba) <= param135)) : (((8'h9e) ? param135 : param135) ? ((8'ha0) + param135) : ((8'hb4) ? param135 : param135))))})
(y, clk, wire85, wire84, wire83, wire82);
  output wire [(32'h265):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire85;
  input wire [(5'h13):(1'h0)] wire84;
  input wire signed [(5'h14):(1'h0)] wire83;
  input wire [(4'hf):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire134;
  wire [(4'hd):(1'h0)] wire133;
  wire signed [(4'hf):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire129;
  wire signed [(2'h2):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire126;
  wire [(5'h13):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire [(5'h12):(1'h0)] wire116;
  wire [(4'hc):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire114;
  wire [(5'h14):(1'h0)] wire113;
  wire [(2'h3):(1'h0)] wire111;
  wire [(4'ha):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire109;
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire111,
                 wire110,
                 wire109,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg112,
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
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire83)
        begin
          reg86 <= wire84[(4'he):(4'h9)];
          if ($signed(wire82[(4'hc):(4'h9)]))
            begin
              reg87 <= $unsigned((wire84[(4'hc):(4'h9)] ?
                  ($unsigned((wire85 ^ wire82)) ?
                      reg86[(2'h2):(2'h2)] : (^wire82)) : (~^{$signed(wire82),
                      $signed(wire85)})));
              reg88 <= $signed($unsigned($signed(wire84[(4'hb):(1'h1)])));
              reg89 <= wire84[(5'h10):(4'hf)];
              reg90 <= wire85[(1'h0):(1'h0)];
              reg91 <= (($signed(wire83[(4'hd):(4'h8)]) | (&((|wire83) ?
                      (reg90 ? reg89 : wire84) : $signed(reg87)))) ?
                  wire85[(2'h3):(2'h3)] : reg87[(3'h5):(1'h1)]);
            end
          else
            begin
              reg87 <= (((reg89[(3'h5):(3'h5)] << reg88[(3'h5):(2'h3)]) && $unsigned(reg87)) ?
                  ((wire85 > (wire84[(3'h6):(1'h0)] ? {wire83} : (-(8'ha4)))) ?
                      $unsigned(((~^wire85) > {(8'hb5)})) : (-reg88)) : (reg87 || {reg90,
                      reg87[(4'ha):(3'h7)]}));
              reg88 <= (8'ha6);
              reg89 <= (~^reg89[(2'h3):(2'h3)]);
              reg90 <= wire83[(4'h9):(3'h7)];
            end
          if ($signed($signed({((wire82 != reg89) * $unsigned(reg91)),
              $unsigned((&reg91))})))
            begin
              reg92 <= ((({(wire82 ? (8'ha1) : wire84)} & $unsigned((wire82 ?
                      wire82 : (8'hb3)))) != reg88[(1'h0):(1'h0)]) ?
                  $signed(wire82[(4'hd):(2'h2)]) : ({reg90} - ($unsigned(reg90[(3'h5):(1'h0)]) * wire82[(4'hd):(2'h3)])));
              reg93 <= ($unsigned(($unsigned((|(8'h9f))) ?
                  $signed($signed(reg89)) : (+(&wire84)))) | reg92[(4'h8):(3'h7)]);
              reg94 <= $unsigned($signed($unsigned((~reg88[(2'h3):(1'h0)]))));
              reg95 <= reg93[(1'h1):(1'h1)];
              reg96 <= reg93[(4'h8):(2'h2)];
            end
          else
            begin
              reg92 <= wire85;
              reg93 <= reg94[(5'h11):(3'h7)];
            end
        end
      else
        begin
          reg86 <= (8'hbb);
          reg87 <= (+{reg91});
          reg88 <= ($unsigned((((reg87 == (8'hbc)) ?
              reg92 : (~reg89)) ^~ wire83[(2'h2):(2'h2)])) + (reg88 <<< $unsigned((reg90[(3'h5):(3'h4)] ?
              (wire83 ? reg90 : reg87) : {reg94}))));
        end
      reg97 <= $unsigned($unsigned($unsigned(((wire84 >= wire85) ?
          (wire84 ? reg89 : wire83) : $signed(wire85)))));
      reg98 <= $unsigned($signed({reg93}));
      reg99 <= wire83;
      if ($unsigned($unsigned($signed($unsigned(reg94[(4'hd):(4'ha)])))))
        begin
          reg100 <= reg95;
          reg101 <= (&$unsigned(wire82[(4'hf):(4'he)]));
          if ($signed(reg100[(2'h2):(2'h2)]))
            begin
              reg102 <= $signed((+$unsigned($signed($unsigned(wire82)))));
              reg103 <= (((reg91[(3'h4):(1'h0)] ~^ reg86) | reg99) ?
                  wire83[(4'h9):(4'h9)] : $unsigned((|{reg87})));
              reg104 <= reg96[(1'h0):(1'h0)];
              reg105 <= {reg98,
                  $signed(($signed(reg97[(4'ha):(3'h7)]) ?
                      $signed(reg90) : (!(~|reg100))))};
            end
          else
            begin
              reg102 <= reg87;
              reg103 <= ($unsigned((reg97 + (reg103[(3'h5):(1'h0)] ?
                      reg100[(4'h9):(3'h5)] : (reg101 ^ reg97)))) ?
                  reg89 : reg88[(1'h0):(1'h0)]);
              reg104 <= (~$signed((~^{wire82[(4'h8):(3'h5)], {reg93}})));
              reg105 <= (-$unsigned($signed(($unsigned(reg105) ?
                  $unsigned(reg102) : $signed(reg105)))));
            end
          if ($signed(reg87[(1'h1):(1'h1)]))
            begin
              reg106 <= ($unsigned((~$unsigned(reg87[(4'hc):(2'h2)]))) ?
                  {reg99} : wire82);
              reg107 <= reg91[(2'h3):(1'h0)];
            end
          else
            begin
              reg106 <= $signed(((reg86[(3'h4):(1'h1)] ?
                      reg96 : $unsigned(reg86[(2'h3):(2'h3)])) ?
                  (reg95 ? reg89 : wire84) : (!({wire85, reg92} && (8'hb6)))));
              reg107 <= $unsigned({(8'hac)});
              reg108 <= (8'hbc);
            end
        end
      else
        begin
          reg100 <= $unsigned(($unsigned({$signed(reg94)}) ?
              $signed(($signed((8'hb6)) ?
                  wire84 : $signed(reg104))) : (((reg105 == reg94) ?
                  $signed(reg89) : $signed(reg97)) <= (reg95 ?
                  $signed(reg92) : (!(8'ha3))))));
          reg101 <= reg100;
        end
    end
  assign wire109 = reg87[(4'ha):(4'h9)];
  assign wire110 = (~reg91[(3'h6):(1'h0)]);
  assign wire111 = (+(reg107[(4'hd):(3'h7)] <<< reg92[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg112 <= reg86;
    end
  assign wire113 = reg112;
  assign wire114 = (+$signed($signed((8'hb7))));
  assign wire115 = ((+($signed($unsigned(wire113)) ? (8'hb8) : (+wire82))) ?
                       ($unsigned(wire83[(4'hb):(4'hb)]) > $signed(reg105[(3'h6):(1'h0)])) : wire85);
  assign wire116 = $signed((reg98[(4'h8):(1'h1)] <= $signed(wire84)));
  assign wire117 = $signed((reg95[(5'h13):(5'h12)] ?
                       $signed(reg100[(4'he):(4'hc)]) : wire116[(5'h11):(2'h3)]));
  assign wire118 = $unsigned({reg105[(3'h6):(3'h4)]});
  always
    @(posedge clk) begin
      if ((~&($signed(((|reg93) << (wire83 ^ reg103))) * wire117[(3'h7):(1'h1)])))
        begin
          if (wire111[(2'h3):(1'h0)])
            begin
              reg119 <= ($signed((reg96[(1'h1):(1'h0)] >> $unsigned((~^(8'hb2))))) ?
                  ((wire115[(4'hc):(3'h7)] && wire113) ?
                      wire85 : (^((&wire110) | reg95[(5'h11):(5'h11)]))) : $signed(reg107[(4'hb):(4'h9)]));
            end
          else
            begin
              reg119 <= $signed($signed(reg107));
              reg120 <= (reg92[(4'hc):(1'h1)] ~^ reg102[(2'h2):(2'h2)]);
              reg121 <= (8'h9f);
              reg122 <= reg119[(4'hc):(3'h5)];
            end
          if ($signed($unsigned($signed((!(wire115 || wire82))))))
            begin
              reg123 <= ((((|$unsigned((8'haa))) ?
                      $signed(reg86[(3'h6):(2'h2)]) : reg100[(4'ha):(1'h0)]) | reg92) ?
                  reg122 : wire115);
            end
          else
            begin
              reg123 <= $unsigned((&wire84));
              reg124 <= $signed((reg105[(4'h8):(3'h5)] ?
                  $unsigned($unsigned((&(8'hb6)))) : $signed({(+wire110),
                      reg121[(1'h1):(1'h1)]})));
            end
        end
      else
        begin
          if (reg92)
            begin
              reg119 <= (wire83 | (reg95 ?
                  (8'hbd) : ((((8'hb4) ? wire114 : reg96) || (8'hb0)) ?
                      (reg86 && $signed((8'h9d))) : ((~(8'ha8)) ?
                          $unsigned(wire110) : $unsigned(wire116)))));
              reg120 <= $signed(wire117);
              reg121 <= (!$unsigned(reg119));
              reg122 <= reg106;
            end
          else
            begin
              reg119 <= (8'hb9);
              reg120 <= (reg108[(4'h8):(1'h0)] ?
                  reg90[(3'h4):(2'h3)] : (^reg89));
            end
          reg123 <= (((({reg121} >= (8'hae)) ? (8'ha9) : wire113) ?
              (reg112 ^ (wire110[(4'h9):(2'h2)] && $unsigned(reg97))) : (!(~(reg120 ?
                  reg97 : reg96)))) ^ $unsigned($signed($signed(wire117[(3'h7):(2'h2)]))));
          reg124 <= (-(reg104 >= wire110));
          reg125 <= $signed($unsigned((+(~|$signed(reg97)))));
        end
    end
  assign wire126 = $unsigned(($unsigned($unsigned(reg112[(1'h1):(1'h1)])) * reg101));
  assign wire127 = (($signed(wire83) && (((reg99 ?
                               reg86 : reg102) * $signed(wire126)) ?
                           reg95 : (^(~^(8'haa))))) ?
                       (|(reg121[(3'h5):(1'h1)] ?
                           $signed(reg103) : $signed({wire84}))) : ($unsigned(((reg112 & wire82) >> (reg102 | wire109))) != {$signed($unsigned(reg87)),
                           reg104[(4'hf):(3'h4)]}));
  assign wire128 = (((7'h40) ?
                           (|(~^$signed(reg86))) : ((reg97[(3'h4):(1'h0)] ?
                                   $unsigned((8'ha9)) : $signed((8'ha2))) ?
                               {{wire118, reg98},
                                   $unsigned(wire84)} : ($signed((8'hb1)) ?
                                   reg119[(3'h6):(3'h6)] : $signed(reg123)))) ?
                       wire85 : (^({(~&reg87),
                           (wire85 ?
                               wire126 : reg112)} << ($signed(reg91) <= $unsigned(wire110)))));
  assign wire129 = {{reg102, (reg99 & (~^$unsigned(reg108)))}};
  assign wire130 = (~&$unsigned({(~^reg97[(3'h7):(1'h1)]),
                       $signed((^(8'hbf)))}));
  assign wire131 = ((($signed(((8'ha5) >> reg108)) ?
                           ((reg99 >= wire128) ?
                               $unsigned(reg88) : (wire82 >= reg103)) : reg104[(1'h1):(1'h0)]) - reg98) ?
                       reg92 : wire115);
  assign wire132 = (^~(|($signed(reg112) ^ $unsigned((wire129 ?
                       reg122 : reg95)))));
  assign wire133 = (^reg90);
  assign wire134 = ($unsigned($signed(reg106[(3'h6):(3'h6)])) < ($signed(((wire118 ?
                       reg100 : (8'ha7)) + $signed(reg86))) < {((~|(8'hae)) ?
                           reg89 : (|(8'hbf)))}));
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h1b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire36;
  input wire [(2'h2):(1'h0)] wire35;
  input wire signed [(2'h2):(1'h0)] wire34;
  input wire [(2'h3):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire37;
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire41,
                 wire40,
                 wire37,
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
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire37 = (|({($unsigned(wire36) ? $signed(wire36) : wire36)} ?
                      ($unsigned((~wire34)) ?
                          wire35 : (wire36 + $unsigned(wire36))) : (((wire33 ?
                              wire34 : (7'h41)) ?
                          ((8'hbf) ? (8'ha5) : wire36) : ((7'h40) ?
                              wire36 : wire32)) - ((wire34 ? wire34 : (8'ha4)) ?
                          $unsigned(wire32) : $signed(wire32)))));
  always
    @(posedge clk) begin
      reg38 <= (^~(~&((~(wire36 > wire35)) ?
          ((~^wire36) ?
              $signed(wire37) : {(8'h9c), wire36}) : $unsigned((wire36 ?
              wire36 : wire35)))));
      reg39 <= $signed($unsigned(wire36));
    end
  assign wire40 = reg38[(4'hb):(1'h1)];
  assign wire41 = ($unsigned((wire34 ? wire40 : $signed($unsigned(wire37)))) ?
                      (wire37 ?
                          $signed($unsigned($unsigned(reg38))) : (~&((-wire40) ?
                              $signed(wire34) : reg39[(3'h6):(1'h0)]))) : wire32[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg42 <= (($signed({$signed(wire41)}) ?
          (wire41 ^ ({wire32} <<< $unsigned(wire32))) : wire36[(5'h10):(2'h2)]) >>> wire35);
      reg43 <= (8'h9e);
      if ($signed(((({wire32,
          reg42} != $signed(reg42)) <<< $unsigned(wire41[(1'h0):(1'h0)])) < (-(-$unsigned(reg43))))))
        begin
          if ($signed(wire33[(1'h0):(1'h0)]))
            begin
              reg44 <= $unsigned($signed({(&wire41[(1'h1):(1'h0)]),
                  (((8'hb9) ? (8'ha0) : (8'hbc)) ?
                      $signed((8'hbe)) : (reg39 || wire35))}));
              reg45 <= wire32[(2'h2):(1'h0)];
              reg46 <= (((wire33[(1'h1):(1'h1)] ?
                      ($signed(wire33) ^~ (wire41 ?
                          reg45 : wire35)) : ({wire33} >>> (reg44 << wire40))) ?
                  $unsigned(reg42[(3'h6):(3'h6)]) : $unsigned(reg43)) > {(reg38[(3'h7):(3'h7)] ?
                      ((wire36 * reg38) - reg43) : (~|$unsigned((8'hb4)))),
                  reg39});
              reg47 <= $signed((($signed($signed(wire32)) ?
                  $signed(wire35[(1'h1):(1'h1)]) : (&(reg38 ?
                      wire36 : reg42))) != ($unsigned(wire41) & (~^(reg39 ?
                  reg43 : wire32)))));
              reg48 <= ($unsigned($unsigned(wire33[(1'h0):(1'h0)])) >= wire34);
            end
          else
            begin
              reg44 <= {($signed(((8'ha1) ?
                      $signed(wire35) : $signed(wire34))) == $unsigned(((+reg48) || (wire40 ?
                      wire37 : wire33)))),
                  $signed((^~(reg39[(3'h7):(3'h7)] > (8'h9f))))};
              reg45 <= wire35[(1'h0):(1'h0)];
            end
          reg49 <= (+$unsigned((reg42[(5'h10):(4'hf)] >> reg46)));
          if ((({$signed($signed((8'hae))),
              wire36[(5'h15):(4'hb)]} ^ $unsigned(reg42)) && $signed((~$signed((reg49 ?
              (8'ha9) : wire40))))))
            begin
              reg50 <= ({wire32,
                      (wire40[(4'h8):(1'h0)] >>> {(^~(8'hb2)), {reg48}})} ?
                  (-(reg39 ?
                      wire40 : $unsigned((^wire37)))) : {(|$signed((~&reg46)))});
              reg51 <= {(!$signed({$signed(wire32), wire32[(1'h0):(1'h0)]})),
                  {(~wire36[(4'ha):(1'h1)])}};
              reg52 <= wire36;
              reg53 <= reg49[(2'h2):(1'h1)];
              reg54 <= wire33[(2'h3):(1'h0)];
            end
          else
            begin
              reg50 <= $unsigned(($signed($unsigned($unsigned(reg46))) ?
                  (8'hb3) : wire36));
            end
          reg55 <= {reg39};
        end
      else
        begin
          reg44 <= (((reg52 ?
              ((reg38 ? wire40 : reg44) ?
                  wire35[(1'h1):(1'h0)] : (8'hbd)) : (reg43 >= wire37[(3'h4):(2'h2)])) - (~|$unsigned($unsigned(wire35)))) == $unsigned((^~(^$unsigned((8'hbc))))));
          reg45 <= $unsigned(((-$unsigned((~reg49))) ?
              $signed($signed((-(7'h42)))) : ($unsigned(wire34[(1'h0):(1'h0)]) ^~ $unsigned($signed(wire32)))));
          reg46 <= (reg46 ?
              reg54[(3'h7):(2'h3)] : ($signed((+reg48[(3'h6):(3'h5)])) ?
                  wire34 : (8'h9e)));
          if ((+reg51))
            begin
              reg47 <= $signed(((~|$unsigned(reg52[(2'h3):(1'h0)])) != (^~(8'hbd))));
              reg48 <= wire32[(2'h3):(1'h0)];
              reg49 <= $unsigned($unsigned(((wire32 ^~ reg47) ?
                  (wire32[(2'h3):(1'h1)] | (reg48 ?
                      reg42 : (7'h42))) : {(wire33 >= wire41)})));
              reg50 <= {reg46[(1'h1):(1'h0)]};
            end
          else
            begin
              reg47 <= ({(~&{$unsigned(wire32), $unsigned(reg51)})} ?
                  ((((reg39 ? wire40 : wire32) ?
                          ((8'hbf) ? reg53 : (8'ha4)) : {reg43}) < ((reg47 ?
                          reg45 : (8'ha0)) | reg55[(4'h8):(2'h2)])) ?
                      $unsigned((reg38 <= reg38[(3'h5):(3'h5)])) : wire36[(4'hb):(4'h8)]) : wire33);
            end
        end
      reg56 <= (8'hb4);
      reg57 <= (8'hb3);
    end
  assign wire58 = reg49;
  assign wire59 = reg39;
  assign wire60 = (|{(^((+wire41) ? (reg53 ? (8'ha0) : reg46) : {wire36}))});
  assign wire61 = {wire41};
  assign wire62 = ((((~&{reg38, reg48}) + (wire36[(4'he):(2'h3)] ?
                      $unsigned(reg45) : (8'hb0))) && (($unsigned(reg46) * wire33[(2'h3):(1'h0)]) ?
                      $signed({reg51,
                          reg42}) : (~^$unsigned(wire41)))) >>> reg55);
  assign wire63 = (reg56[(3'h6):(3'h5)] <= $signed($unsigned(wire37)));
  assign wire64 = reg38;
  assign wire65 = reg43;
  assign wire66 = $unsigned((reg54 <= reg57));
  assign wire67 = ((~&$unsigned(((reg52 ?
                      reg49 : wire59) * wire33[(1'h1):(1'h1)]))) >>> ($signed(((wire58 > reg56) ^~ $unsigned(wire64))) <= ($signed(reg51[(4'hb):(2'h3)]) ?
                      ((wire41 ^~ reg49) <<< $signed(wire62)) : $unsigned((reg52 != reg45)))));
  assign wire68 = reg45;
  assign wire69 = reg44[(3'h7):(3'h7)];
  assign wire70 = $unsigned(reg52);
endmodule
