module top
#(parameter param288 = ({(({(7'h40)} ? ((8'had) ? (8'hbe) : (8'hba)) : ((8'hb8) < (8'ha9))) ? (((8'hb3) ? (8'hbd) : (8'hb2)) ? {(8'haa)} : (-(8'hb9))) : ((8'hb9) < ((7'h40) ? (8'had) : (8'hbc))))} != (~&(~&(((8'hac) << (8'hb4)) || ((8'ha1) ? (8'hb3) : (7'h40)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire287;
  wire [(5'h13):(1'h0)] wire286;
  wire signed [(2'h2):(1'h0)] wire284;
  wire [(3'h4):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire151;
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire287,
                 wire286,
                 wire284,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire151,
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
                 reg14,
                 reg13,
                 reg12,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3[(4'h8):(1'h0)];
      reg6 <= {$signed($unsigned({(~reg5)})),
          $signed($signed(($unsigned(reg5) >>> $signed(reg5))))};
    end
  assign wire7 = reg6;
  assign wire8 = $signed($signed((wire3[(1'h1):(1'h0)] << {((8'ha7) ?
                         reg5 : reg6)})));
  assign wire9 = reg5[(3'h5):(2'h2)];
  assign wire10 = $unsigned(reg6);
  assign wire11 = wire10[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg12 <= ($unsigned(wire10) < wire8[(2'h2):(2'h2)]);
        end
      else
        begin
          if ((reg5 ? $unsigned(wire2) : wire4[(4'h8):(3'h5)]))
            begin
              reg12 <= ({(($unsigned(wire11) < $signed(wire3)) ?
                      $unsigned(wire3[(3'h4):(3'h4)]) : wire7[(1'h1):(1'h0)]),
                  (~$unsigned($unsigned(reg6)))} & {wire10,
                  wire3[(2'h3):(2'h3)]});
              reg13 <= $unsigned($signed($unsigned(reg12[(3'h6):(3'h4)])));
              reg14 <= reg5[(3'h4):(2'h3)];
              reg15 <= (~|$signed(($unsigned({wire8,
                  wire0}) < (~|(wire7 * wire3)))));
            end
          else
            begin
              reg12 <= (reg5[(4'h9):(1'h1)] ? {(+reg5)} : reg15);
              reg13 <= (~$unsigned(wire9));
              reg14 <= {$signed(wire11),
                  ($unsigned({wire3[(2'h3):(1'h1)],
                      (wire7 <= reg12)}) >>> (^~$signed({reg15})))};
              reg15 <= ((!(&(wire7 << (wire10 > reg14)))) != $unsigned($signed(reg5[(1'h1):(1'h1)])));
            end
          reg16 <= (8'hb4);
          reg17 <= (((((wire0 + reg13) ?
                  $unsigned(reg12) : (reg5 << reg15)) >> wire11) >>> {(8'ha1),
                  $unsigned({reg15, reg12})}) ?
              wire0 : wire9);
        end
      if (reg15)
        begin
          if (wire7)
            begin
              reg18 <= $unsigned(reg16[(3'h6):(3'h6)]);
              reg19 <= {$signed({(wire2[(4'hb):(2'h2)] ? $signed(reg5) : wire9),
                      reg14}),
                  wire2};
              reg20 <= reg18;
              reg21 <= reg16[(3'h5):(2'h2)];
              reg22 <= ((~$signed((8'ha6))) ?
                  (8'h9e) : ($unsigned(((^~(7'h44)) << $signed(reg13))) ?
                      (+wire10) : (($signed(wire11) ?
                          $unsigned(reg18) : (|reg17)) ^ $unsigned($signed(reg6)))));
            end
          else
            begin
              reg18 <= $signed((wire3 ?
                  $unsigned((~&$unsigned(wire4))) : ($unsigned($signed(wire10)) ?
                      $signed(wire4) : ({reg22,
                          reg16} >= $unsigned((8'hab))))));
              reg19 <= $unsigned(wire1[(3'h7):(3'h6)]);
              reg20 <= $signed((+(((wire0 ? reg12 : reg19) | (wire9 ?
                  (8'hbf) : wire9)) << reg19)));
              reg21 <= wire2;
              reg22 <= wire2[(4'ha):(1'h1)];
            end
          if ($signed(((((wire8 ? reg18 : (8'hb0)) ?
                  $unsigned(wire8) : (reg19 & reg6)) >> wire11[(3'h4):(3'h4)]) ?
              $unsigned(((wire10 == (7'h41)) ?
                  wire10 : (reg21 ? reg21 : reg6))) : $signed(reg15))))
            begin
              reg23 <= reg18[(4'h8):(1'h1)];
              reg24 <= reg23[(4'hb):(4'hb)];
              reg25 <= $signed(reg16[(3'h4):(2'h2)]);
              reg26 <= $unsigned($unsigned(reg24));
              reg27 <= $signed(wire9[(1'h0):(1'h0)]);
            end
          else
            begin
              reg23 <= $signed($unsigned(({reg21[(5'h12):(4'hc)],
                      reg14[(1'h0):(1'h0)]} ?
                  {(reg16 ? wire11 : reg15)} : wire9[(2'h3):(1'h0)])));
              reg24 <= wire10[(1'h0):(1'h0)];
              reg25 <= reg19[(4'ha):(1'h1)];
              reg26 <= reg24;
            end
        end
      else
        begin
          reg18 <= $unsigned(($unsigned(wire3) > (!$signed((-wire3)))));
          reg19 <= (~|reg19);
          reg20 <= $signed(($unsigned((!(-wire2))) ?
              (reg6 ?
                  (~$unsigned(wire7)) : ((!reg6) ?
                      wire2 : reg25[(3'h5):(3'h5)])) : wire9[(3'h4):(1'h0)]));
          reg21 <= (((^{(reg22 | reg23)}) ?
              $signed(((reg27 * wire0) ^~ {wire2})) : ($unsigned((reg27 ?
                      (8'ha3) : reg16)) ?
                  ($unsigned(wire7) != {wire4,
                      wire7}) : $signed({reg20}))) << (reg5[(3'h4):(1'h1)] - reg14[(1'h0):(1'h0)]));
        end
      reg28 <= reg15[(3'h7):(3'h6)];
    end
  assign wire29 = (~&$unsigned(reg14[(4'h9):(1'h0)]));
  assign wire30 = $signed((($unsigned($signed((8'h9f))) > ((8'ha6) ?
                          $unsigned(reg23) : $unsigned(reg22))) ?
                      (!{(reg23 <= reg17)}) : reg22[(4'hb):(3'h4)]));
  assign wire31 = $signed(($signed($unsigned($signed(wire11))) << wire7[(3'h4):(2'h3)]));
  assign wire32 = ((wire4[(4'he):(4'ha)] < $unsigned($unsigned((reg15 ?
                      reg28 : (8'h9d))))) && {$unsigned((((8'hbd) < (8'ha1)) ?
                          $signed(reg26) : (8'ha7))),
                      wire0[(4'hb):(3'h4)]});
  assign wire33 = (reg17[(5'h11):(3'h7)] ^~ wire4[(4'hd):(4'ha)]);
  assign wire34 = $signed(({(8'had), ($signed(reg28) > (8'hb5))} & reg5));
  assign wire35 = (~(((&(~reg28)) << $unsigned(wire29[(4'hb):(1'h0)])) & (~&($signed(reg23) ~^ (|(8'hac))))));
  module36 #() modinst152 (.clk(clk), .wire38(wire2), .wire39(reg26), .wire37(reg15), .y(wire151), .wire40(reg12));
  module153 #() modinst285 (.clk(clk), .wire155(wire35), .wire154(reg26), .wire158(wire9), .y(wire284), .wire157(reg25), .wire156(reg13));
  assign wire286 = wire9;
  assign wire287 = ($unsigned(reg13) ?
                       wire3[(5'h11):(2'h2)] : reg13[(4'h9):(3'h4)]);
endmodule

module module153  (y, clk, wire158, wire157, wire156, wire155, wire154);
  output wire [(32'h236):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire158;
  input wire signed [(4'ha):(1'h0)] wire157;
  input wire [(4'hf):(1'h0)] wire156;
  input wire signed [(4'h8):(1'h0)] wire155;
  input wire [(4'ha):(1'h0)] wire154;
  wire signed [(5'h12):(1'h0)] wire283;
  wire [(4'ha):(1'h0)] wire254;
  wire signed [(3'h6):(1'h0)] wire251;
  wire signed [(3'h6):(1'h0)] wire193;
  wire [(5'h15):(1'h0)] wire159;
  wire signed [(4'hd):(1'h0)] wire195;
  wire [(4'hc):(1'h0)] wire196;
  wire [(4'hd):(1'h0)] wire197;
  wire signed [(5'h14):(1'h0)] wire198;
  wire [(2'h3):(1'h0)] wire199;
  wire [(5'h12):(1'h0)] wire200;
  wire signed [(2'h3):(1'h0)] wire204;
  wire [(5'h15):(1'h0)] wire205;
  wire [(4'ha):(1'h0)] wire206;
  wire [(4'hc):(1'h0)] wire207;
  wire [(4'h9):(1'h0)] wire208;
  wire [(3'h4):(1'h0)] wire249;
  reg signed [(3'h5):(1'h0)] reg282 = (1'h0);
  reg [(5'h12):(1'h0)] reg281 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg280 = (1'h0);
  reg [(4'h8):(1'h0)] reg279 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg278 = (1'h0);
  reg [(4'he):(1'h0)] reg277 = (1'h0);
  reg [(5'h14):(1'h0)] reg276 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg275 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg274 = (1'h0);
  reg [(5'h10):(1'h0)] reg273 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg272 = (1'h0);
  reg [(4'hc):(1'h0)] reg271 = (1'h0);
  reg [(4'h8):(1'h0)] reg270 = (1'h0);
  reg [(5'h15):(1'h0)] reg269 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg268 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg267 = (1'h0);
  reg [(4'hb):(1'h0)] reg266 = (1'h0);
  reg [(3'h5):(1'h0)] reg265 = (1'h0);
  reg [(4'hf):(1'h0)] reg264 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg263 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg262 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg261 = (1'h0);
  reg [(4'hf):(1'h0)] reg260 = (1'h0);
  reg [(2'h3):(1'h0)] reg259 = (1'h0);
  reg [(4'h9):(1'h0)] reg258 = (1'h0);
  reg [(3'h7):(1'h0)] reg257 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg256 = (1'h0);
  reg [(4'ha):(1'h0)] reg255 = (1'h0);
  reg [(2'h2):(1'h0)] reg253 = (1'h0);
  reg [(5'h13):(1'h0)] reg252 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg202 = (1'h0);
  reg [(2'h2):(1'h0)] reg201 = (1'h0);
  assign y = {wire283,
                 wire254,
                 wire251,
                 wire193,
                 wire159,
                 wire195,
                 wire196,
                 wire197,
                 wire198,
                 wire199,
                 wire200,
                 wire204,
                 wire205,
                 wire206,
                 wire207,
                 wire208,
                 wire249,
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
                 reg253,
                 reg252,
                 reg203,
                 reg202,
                 reg201,
                 (1'h0)};
  assign wire159 = wire154;
  module160 #() modinst194 (.clk(clk), .wire164(wire158), .wire165(wire155), .y(wire193), .wire161(wire156), .wire162(wire154), .wire163(wire157));
  assign wire195 = (!(wire193 ?
                       $unsigned({(wire154 ?
                               wire159 : wire156)}) : (wire193[(2'h2):(2'h2)] ?
                           $signed(wire156) : {$signed(wire193),
                               wire159[(5'h13):(4'hf)]})));
  assign wire196 = wire195;
  assign wire197 = (($unsigned($signed($unsigned(wire158))) < (&$unsigned(wire157[(3'h6):(1'h1)]))) ^~ ($signed($signed((!(7'h44)))) ?
                       wire193 : $signed($unsigned((wire193 ^ wire155)))));
  assign wire198 = ($unsigned(wire159) && wire155);
  assign wire199 = wire198[(4'h9):(3'h5)];
  assign wire200 = wire159[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg201 <= wire193[(3'h6):(2'h2)];
      reg202 <= wire199;
      reg203 <= $unsigned($unsigned(((!(wire154 ?
          wire155 : wire158)) ^ wire159)));
    end
  assign wire204 = wire159;
  assign wire205 = wire157;
  assign wire206 = ($unsigned(((8'h9d) << reg201)) | {{{$unsigned(wire195),
                               (wire159 ? wire205 : (8'h9d))},
                           ((|(8'h9f)) ? wire156 : (~wire155))},
                       wire156});
  assign wire207 = (wire199 >= ($signed(($signed(wire200) <<< wire199[(2'h3):(2'h3)])) ?
                       $signed($unsigned(wire199)) : (wire205 > wire159)));
  assign wire208 = $unsigned($signed($signed($unsigned((reg201 ?
                       wire204 : wire206)))));
  module209 #() modinst250 (.wire213(wire197), .clk(clk), .wire210(wire159), .wire211(wire196), .wire212(wire208), .y(wire249), .wire214(wire158));
  assign wire251 = $unsigned(wire197[(4'ha):(3'h4)]);
  always
    @(posedge clk) begin
      reg252 <= ({{$unsigned($signed(wire156))},
          ($unsigned((wire207 ?
              wire195 : wire199)) >= wire157)} >> wire193[(3'h4):(1'h0)]);
      reg253 <= {{$signed($unsigned($unsigned((8'hbb))))}};
    end
  assign wire254 = ($signed({(((8'hbb) + wire251) ?
                               {wire251, reg202} : (wire207 ?
                                   wire249 : (8'hae))),
                           $signed((^~wire207))}) ?
                       $signed((^$signed((~wire205)))) : wire195[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg255 <= $signed((wire200[(5'h11):(1'h1)] >>> $signed(wire249)));
      reg256 <= $signed(((&$unsigned((~|wire200))) ?
          wire254[(2'h2):(2'h2)] : (((wire199 ~^ (8'hb2)) ?
              wire251 : reg203) & $unsigned(((8'hb5) == wire196)))));
      if ((wire207[(2'h2):(2'h2)] ? $signed(wire154) : wire196[(2'h2):(1'h0)]))
        begin
          reg257 <= (^(((~&(&wire154)) == wire249) ?
              $unsigned((!$unsigned(wire200))) : wire196[(3'h4):(1'h0)]));
        end
      else
        begin
          reg257 <= ((~(wire205[(4'hf):(4'ha)] ?
                  (~^$unsigned(wire205)) : ((^reg257) ?
                      (~reg253) : (|wire198)))) ?
              $signed(wire249[(2'h2):(1'h1)]) : {$signed($unsigned($signed(wire249)))});
          reg258 <= wire204[(1'h0):(1'h0)];
          reg259 <= $unsigned($unsigned(wire200[(4'hd):(4'h9)]));
          reg260 <= $signed((&(wire200[(5'h11):(4'h9)] ?
              wire206 : ((8'hb0) < {reg257}))));
        end
      if ((8'ha1))
        begin
          reg261 <= ($signed(reg203[(1'h1):(1'h1)]) ?
              wire154[(3'h7):(1'h0)] : wire208);
          reg262 <= (wire199[(1'h0):(1'h0)] > (wire157[(3'h5):(2'h2)] >= (wire159 >> $unsigned(wire198[(3'h5):(3'h4)]))));
          reg263 <= $unsigned($signed({((-(8'ha1)) ?
                  (wire196 >>> wire195) : (wire196 << (8'hb8)))}));
          reg264 <= (8'hae);
        end
      else
        begin
          reg261 <= {reg261};
          reg262 <= wire193[(1'h1):(1'h1)];
          reg263 <= $signed($unsigned($signed((+{(7'h41), reg262}))));
        end
    end
  always
    @(posedge clk) begin
      reg265 <= ($unsigned($unsigned((~(~&(7'h43))))) ?
          ((^((^~(8'hbf)) != (wire155 || wire155))) * ($unsigned((wire155 - reg257)) ?
              wire204[(1'h1):(1'h1)] : $unsigned($signed((8'haa))))) : ($signed(reg258[(3'h7):(3'h4)]) != $signed(reg202)));
      reg266 <= ((reg256 >= (wire198 << (7'h44))) ~^ reg256);
      if ((((+reg255) - reg260) ?
          (8'ha0) : ((^(-$signed((7'h44)))) & $signed($unsigned({reg265,
              reg262})))))
        begin
          reg267 <= reg265;
          reg268 <= $signed((!$unsigned(($signed(reg266) * (wire193 ?
              wire205 : (8'ha1))))));
        end
      else
        begin
          reg267 <= ({((reg265[(1'h0):(1'h0)] ?
                          $signed(wire156) : ((8'ha8) ? wire156 : wire154)) ?
                      {wire249} : $signed($unsigned(reg265)))} ?
              ({(~&((8'hb3) >= wire254))} ?
                  wire196 : $unsigned(reg259[(1'h1):(1'h1)])) : wire193[(2'h2):(1'h1)]);
        end
      reg269 <= $signed((~|(wire156[(2'h2):(1'h0)] ?
          (^wire206) : $unsigned((~|(8'hb0))))));
      if ((-((reg264[(2'h2):(1'h0)] ?
          wire195[(4'hc):(4'hb)] : {(wire158 && wire158)}) - ($unsigned((^~wire249)) ?
          ((&wire196) | (^(8'hba))) : (-$unsigned(wire208))))))
        begin
          if (reg258)
            begin
              reg270 <= wire156;
              reg271 <= ((~reg267[(4'h9):(3'h4)]) << wire207[(4'hb):(1'h1)]);
              reg272 <= ($signed($unsigned(reg202[(3'h4):(1'h0)])) ?
                  wire200[(1'h0):(1'h0)] : $signed(reg267));
              reg273 <= wire249[(3'h4):(2'h3)];
              reg274 <= reg253[(1'h0):(1'h0)];
            end
          else
            begin
              reg270 <= (wire251 > (^$unsigned($unsigned(reg267[(4'hb):(2'h2)]))));
              reg271 <= ($signed((reg262 >= $unsigned($signed((8'hb2))))) >>> (8'hb3));
              reg272 <= wire200;
              reg273 <= (reg270[(3'h4):(1'h1)] ?
                  $unsigned($signed((8'haa))) : $signed(((-(+reg259)) >>> $signed((reg264 == wire254)))));
            end
          if ((~^wire199[(2'h2):(1'h1)]))
            begin
              reg275 <= (reg261[(4'h8):(3'h5)] ?
                  $signed($unsigned(($unsigned(wire154) - (|wire251)))) : $unsigned(((-(reg257 ?
                          wire204 : reg274)) ?
                      (!wire193) : $unsigned((^~wire154)))));
              reg276 <= $signed($unsigned($unsigned({$unsigned(reg255),
                  $unsigned(reg269)})));
            end
          else
            begin
              reg275 <= ($signed($unsigned($unsigned($unsigned(wire205)))) ?
                  ((!(~|(|wire193))) ?
                      $signed($signed((&(8'hb0)))) : (+(~|wire154))) : ((8'ha4) ?
                      $signed(reg203[(1'h1):(1'h0)]) : $signed({wire158[(3'h4):(2'h2)]})));
              reg276 <= reg265;
              reg277 <= (wire206[(2'h2):(1'h0)] ?
                  ($unsigned($signed((wire157 * wire193))) ?
                      (+(~|wire200)) : ((reg258 < $signed(reg276)) >= $signed($signed(reg256)))) : reg201);
              reg278 <= reg201[(1'h1):(1'h1)];
              reg279 <= $signed((+$signed($signed($unsigned((7'h44))))));
            end
          reg280 <= ($signed($unsigned(wire196[(3'h4):(2'h3)])) & wire156);
          reg281 <= reg273[(4'hc):(4'hb)];
          reg282 <= {$unsigned(({(wire254 && wire204), reg281} ^~ reg201))};
        end
      else
        begin
          reg270 <= reg259[(1'h1):(1'h1)];
        end
    end
  assign wire283 = reg280[(1'h1):(1'h0)];
endmodule

module module36
#(parameter param150 = ((|({((8'hb0) >>> (8'ha4))} && ({(8'ha1)} ? (~&(8'h9d)) : ((8'had) ? (8'hae) : (8'ha2))))) ? (~((((8'ha7) | (8'ha0)) << ((7'h43) != (8'hb1))) ? ({(8'ha2), (8'hbf)} ? ((8'had) + (8'had)) : ((8'hb4) - (8'h9d))) : ((^~(8'hab)) * (|(7'h42))))) : ((^~(((8'hac) ~^ (8'ha9)) - ((8'hae) ? (8'hb9) : (8'hb3)))) ? ({{(8'hbd)}, ((8'h9c) ? (8'hae) : (8'ha4))} ? (((8'ha4) & (8'hb3)) ? ((8'hbb) != (8'h9d)) : ((8'hbd) ~^ (8'hbb))) : ({(8'ha0), (8'ha9)} ? ((8'h9c) ^ (8'hb1)) : (^~(8'ha0)))) : ((~|(^(8'hbf))) ? ({(8'hb3)} ? ((8'hbf) ? (8'ha7) : (8'hae)) : ((8'hbe) ? (8'h9f) : (8'ha1))) : (((8'h9c) ? (8'haa) : (8'hae)) ? (~&(8'hbd)) : {(7'h41)})))))
(y, clk, wire37, wire38, wire39, wire40);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire37;
  input wire [(4'hb):(1'h0)] wire38;
  input wire [(2'h2):(1'h0)] wire39;
  input wire [(5'h12):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire148;
  wire signed [(5'h15):(1'h0)] wire115;
  wire signed [(4'hf):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire95;
  wire [(4'he):(1'h0)] wire113;
  reg [(3'h4):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  assign y = {wire148,
                 wire115,
                 wire41,
                 wire46,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire95,
                 wire113,
                 reg117,
                 reg116,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 (1'h0)};
  assign wire41 = $unsigned(wire39[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      if (wire41)
        begin
          reg42 <= (wire41[(4'he):(3'h4)] ?
              {wire41} : (&$unsigned((((8'hb7) > wire40) + ((8'h9f) - wire41)))));
        end
      else
        begin
          reg42 <= (~|(^$signed((8'ha2))));
          reg43 <= reg42[(3'h4):(3'h4)];
          reg44 <= $unsigned(wire37);
        end
      reg45 <= ($unsigned(wire37[(5'h15):(5'h13)]) ?
          (~^$unsigned(((reg44 == wire38) ?
              $unsigned(wire40) : (wire38 ?
                  reg43 : reg42)))) : $signed($signed((wire39[(1'h0):(1'h0)] ~^ (wire39 != wire38)))));
    end
  assign wire46 = $unsigned(wire41);
  always
    @(posedge clk) begin
      if ($signed(({{$unsigned(reg44), (reg45 ? wire40 : wire46)}} ?
          (+(reg44 ?
              (reg44 ?
                  (8'hb9) : wire39) : reg43)) : $signed(reg45[(3'h6):(3'h6)]))))
        begin
          reg47 <= reg42[(3'h4):(1'h1)];
          reg48 <= ((($signed(wire40[(4'hd):(4'ha)]) ?
                  $unsigned(wire39) : wire37) ?
              ((~^wire46[(1'h1):(1'h0)]) < $signed((wire38 < wire46))) : (~&reg43)) <<< wire38);
          reg49 <= wire38;
          reg50 <= (~|({{reg47}, (+$unsigned((8'hae)))} ~^ {reg49,
              (((8'hba) <= reg48) >> reg49[(4'h9):(3'h5)])}));
        end
      else
        begin
          reg47 <= ((&$unsigned($unsigned($unsigned((7'h40))))) ?
              wire40 : $unsigned(((wire37[(5'h11):(3'h5)] ?
                  (reg47 ? wire46 : reg50) : {wire41, reg45}) | (+(wire41 ?
                  reg45 : wire40)))));
        end
      reg51 <= {$unsigned(({(reg50 + reg42), (reg42 ? wire38 : (8'hb1))} ?
              $signed(wire37[(3'h7):(2'h2)]) : (~(~|(8'h9f))))),
          reg49};
      if (reg50)
        begin
          if (wire40)
            begin
              reg52 <= ({(~|{reg50, (reg49 << (8'hb9))}),
                      $unsigned($signed((+wire39)))} ?
                  (~&(((8'ha0) ?
                      $signed(wire41) : reg48[(3'h4):(2'h2)]) >>> wire38[(3'h5):(3'h5)])) : (reg43[(2'h3):(1'h1)] ?
                      (^~$unsigned(reg44)) : $unsigned((~reg43))));
            end
          else
            begin
              reg52 <= reg42;
              reg53 <= reg42[(2'h3):(2'h3)];
              reg54 <= reg53[(3'h6):(2'h2)];
            end
          if ((8'hae))
            begin
              reg55 <= $unsigned($unsigned(wire38));
              reg56 <= $unsigned(reg48);
              reg57 <= ($signed((reg47[(2'h2):(1'h1)] && reg55[(1'h0):(1'h0)])) >>> (8'hac));
              reg58 <= (reg44 >= wire46);
              reg59 <= $signed(($unsigned($unsigned($unsigned(reg56))) || wire40[(4'h8):(3'h6)]));
            end
          else
            begin
              reg55 <= wire39;
              reg56 <= reg45[(3'h4):(2'h3)];
              reg57 <= ((!reg58) ? (8'hb5) : ({reg52[(2'h3):(1'h0)]} || reg55));
              reg58 <= {$unsigned(reg58)};
              reg59 <= ($unsigned((($signed(reg47) + reg59[(2'h3):(1'h0)]) >>> $unsigned((wire39 | (8'haa))))) & reg47);
            end
          if (($unsigned(reg55[(3'h5):(2'h2)]) && (~&((~|wire37[(5'h12):(4'he)]) << {$signed(reg50)}))))
            begin
              reg60 <= $signed(reg43);
            end
          else
            begin
              reg60 <= (^~reg53);
              reg61 <= ((((8'hbc) <<< ((|wire38) ?
                  (reg60 || reg56) : (reg44 ?
                      reg59 : (8'ha0)))) >> {reg55}) >>> reg56);
              reg62 <= $signed((^~reg43));
            end
          reg63 <= reg52[(3'h5):(2'h2)];
        end
      else
        begin
          reg52 <= reg47;
          reg53 <= $unsigned({reg45[(3'h4):(1'h1)]});
          if ($unsigned((&(^wire39))))
            begin
              reg54 <= ($signed((~reg50)) > $signed($signed((wire46 + (7'h41)))));
              reg55 <= ($unsigned(reg47) || (~(reg61[(1'h0):(1'h0)] ?
                  reg51[(1'h0):(1'h0)] : (-reg56))));
              reg56 <= wire39[(1'h1):(1'h1)];
              reg57 <= reg44[(1'h0):(1'h0)];
              reg58 <= reg48[(1'h1):(1'h0)];
            end
          else
            begin
              reg54 <= $unsigned($unsigned((+($unsigned(wire41) ?
                  $unsigned(reg48) : reg47[(2'h2):(2'h2)]))));
              reg55 <= reg54[(3'h6):(3'h5)];
            end
        end
      if (reg59[(2'h3):(1'h1)])
        begin
          reg64 <= ($signed(reg45) ? reg42[(3'h4):(2'h2)] : reg56);
          reg65 <= $unsigned(($unsigned(reg42) ?
              $unsigned($unsigned(reg49)) : ($signed(reg59) > (reg50 > $signed(reg51)))));
          reg66 <= ((~^$signed((reg64[(4'ha):(4'h8)] ?
              {(7'h40)} : reg49))) + reg51);
          reg67 <= (~(8'hbe));
        end
      else
        begin
          reg64 <= (|$signed((8'ha6)));
        end
      reg68 <= {reg48,
          (($unsigned(reg64) << (~|{reg43})) ?
              $signed($signed((|wire41))) : (reg55[(4'h8):(3'h6)] ?
                  reg50 : $unsigned(reg45)))};
    end
  assign wire69 = reg64;
  assign wire70 = (&$signed(($signed(reg65[(4'h9):(2'h2)]) ?
                      ((8'haa) ?
                          $unsigned(reg44) : wire69[(2'h2):(1'h1)]) : ((~|reg64) << (reg50 | reg55)))));
  assign wire71 = {{{reg54[(4'h9):(4'h8)], wire38[(4'h9):(4'h9)]}}};
  assign wire72 = {{(((reg49 << reg61) ?
                              (~&(8'hb5)) : reg43) >> $unsigned(wire69[(1'h0):(1'h0)])),
                          $signed(($signed((7'h42)) <= (^reg62)))},
                      {$unsigned($unsigned($unsigned(reg56))),
                          (wire69 | $unsigned((8'ha3)))}};
  assign wire73 = ((!(|($unsigned(reg42) ?
                      (~wire38) : $unsigned(reg52)))) - $signed($unsigned(((reg55 ?
                      reg66 : reg43) >= $unsigned(reg43)))));
  assign wire74 = reg44[(2'h2):(2'h2)];
  module75 #() modinst96 (.wire79(reg51), .y(wire95), .wire78(reg48), .clk(clk), .wire76(reg44), .wire80(reg42), .wire77(reg54));
  module97 #() modinst114 (wire113, clk, wire46, reg61, reg57, reg43, reg44);
  assign wire115 = reg45[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg116 <= $unsigned((($unsigned(reg47[(2'h3):(1'h1)]) == (8'hb9)) & $signed((^~wire39))));
      reg117 <= (($signed((reg48 & wire72)) ?
              $unsigned((!reg61[(3'h6):(1'h0)])) : (wire41 ?
                  $signed((reg42 & wire95)) : $signed(reg63[(3'h4):(1'h1)]))) ?
          $unsigned((reg47[(2'h2):(1'h1)] ?
              reg53[(2'h2):(1'h1)] : $unsigned((reg57 ?
                  wire71 : reg54)))) : $unsigned((((reg68 ? reg50 : reg42) ?
                  reg68[(3'h5):(2'h2)] : $unsigned(reg56)) ?
              ((reg57 ? (8'ha4) : reg50) ? (|wire73) : reg45) : $signed((reg63 ?
                  reg116 : reg54)))));
    end
  module118 #() modinst149 (.wire119(reg50), .wire122(wire40), .clk(clk), .wire121(reg66), .wire120(wire70), .y(wire148));
endmodule

module module118  (y, clk, wire122, wire121, wire120, wire119);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire122;
  input wire [(3'h5):(1'h0)] wire121;
  input wire [(4'ha):(1'h0)] wire120;
  input wire signed [(3'h4):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire147;
  wire [(3'h7):(1'h0)] wire146;
  wire signed [(4'h9):(1'h0)] wire145;
  wire [(2'h2):(1'h0)] wire137;
  wire [(3'h4):(1'h0)] wire136;
  wire signed [(2'h2):(1'h0)] wire135;
  wire [(5'h10):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire123;
  reg [(4'h9):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(5'h14):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg130 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg128 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire137,
                 wire136,
                 wire135,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 (1'h0)};
  assign wire123 = ($unsigned((wire119 & (wire119 ?
                       (~wire121) : $unsigned(wire119)))) == (8'hbc));
  assign wire124 = ((|(wire123[(4'hc):(4'h8)] ?
                           wire123 : wire120[(4'ha):(4'ha)])) ?
                       ((|$unsigned((8'hb6))) && $unsigned(wire123[(4'hf):(4'he)])) : ((^$unsigned($signed((8'hbd)))) <= $signed((wire121 <<< (^wire123)))));
  assign wire125 = wire124[(1'h0):(1'h0)];
  assign wire126 = (8'ha2);
  assign wire127 = (~$signed(wire122[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg128 <= $unsigned(((|wire125[(5'h10):(4'hf)]) ^~ wire122));
      reg129 <= reg128;
    end
  always
    @(posedge clk) begin
      reg130 <= $unsigned({$signed($unsigned(wire123[(3'h5):(3'h4)])),
          (~^wire126[(1'h1):(1'h1)])});
      reg131 <= (~&wire127);
      reg132 <= ((8'ha5) | $signed($signed(wire119)));
      reg133 <= $unsigned($unsigned(reg128[(5'h10):(1'h0)]));
      reg134 <= $signed(((wire122[(2'h2):(1'h1)] ?
          wire126[(1'h1):(1'h1)] : (reg131[(4'he):(3'h6)] <<< wire119)) <= wire122[(1'h1):(1'h0)]));
    end
  assign wire135 = $signed($signed(reg128));
  assign wire136 = $unsigned(reg128[(4'he):(1'h0)]);
  assign wire137 = ($signed(reg128[(4'ha):(3'h4)]) == $unsigned((8'ha9)));
  always
    @(posedge clk) begin
      reg138 <= {$signed({(~&(~&wire123)), $signed((|reg132))})};
      if ($unsigned($signed($unsigned(({wire137, reg134} >= wire127)))))
        begin
          if ($unsigned((wire122 == ({{wire127}} >>> ($unsigned(reg129) ?
              reg138 : $signed((8'hb0)))))))
            begin
              reg139 <= (((-$signed($unsigned(wire125))) ?
                  (~|((wire122 ?
                      wire136 : reg132) ~^ (8'hbb))) : wire119) - (wire121 ?
                  {$signed((reg138 ? wire125 : (8'hb9))),
                      (+(8'hb9))} : (~|$unsigned($signed(reg138)))));
            end
          else
            begin
              reg139 <= ((|$unsigned($unsigned((wire137 ? reg128 : reg130)))) ?
                  $signed($unsigned((reg128 < reg128[(4'ha):(3'h7)]))) : (~(&$unsigned((wire127 ~^ (8'ha7))))));
              reg140 <= $signed(wire121[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg139 <= (7'h40);
          if ((((~&({wire125} == (~|wire123))) ?
              wire122 : $unsigned($signed({reg128}))) | (~|$signed(($unsigned(reg133) ?
              $signed(wire120) : $signed(wire125))))))
            begin
              reg140 <= wire120[(4'ha):(2'h3)];
            end
          else
            begin
              reg140 <= wire123[(4'hc):(4'ha)];
              reg141 <= reg132[(1'h1):(1'h1)];
            end
          reg142 <= $unsigned($signed($unsigned((&reg138[(3'h4):(1'h1)]))));
          reg143 <= $unsigned((reg138[(3'h4):(1'h0)] ?
              $unsigned(((reg133 ?
                  (7'h44) : (8'ha0)) << (&wire123))) : (8'hb3)));
          reg144 <= ({(+(~|{(8'ha5)}))} ?
              reg143[(4'ha):(3'h4)] : ((&reg128) ?
                  (8'h9e) : $unsigned((&$unsigned(reg133)))));
        end
    end
  assign wire145 = $signed(reg143);
  assign wire146 = ($signed((8'h9d)) ?
                       $unsigned((|{{reg134},
                           (wire119 <<< wire135)})) : (($unsigned($unsigned(reg129)) ?
                           $signed($signed(wire121)) : reg143[(1'h1):(1'h0)]) >> ({reg141,
                               (reg134 ? reg128 : reg130)} ?
                           $unsigned((reg128 << reg130)) : reg140)));
  assign wire147 = (((wire127[(5'h10):(4'hb)] < ($signed(reg138) ?
                       $signed(wire135) : $signed(reg143))) <= {$signed(reg143),
                       ({reg143} ~^ $unsigned(wire145))}) | ($signed($unsigned((reg134 | reg140))) << {(^~(^~wire126))}));
endmodule

module module97
#(parameter param111 = ({(~^(((8'h9e) ? (8'ha5) : (8'hb7)) && {(8'h9d), (8'ha7)}))} < {((((8'h9f) + (8'ha8)) << ((8'hba) >>> (8'hae))) ? ({(8'h9e), (8'hb8)} ? ((8'hab) ? (8'hb2) : (8'ha0)) : (8'h9e)) : ((7'h41) == ((8'ha6) ~^ (8'ha8)))), ((~&((8'ha4) ? (8'hb5) : (8'h9f))) - (|(-(8'haf))))}), 
parameter param112 = ({param111} ? (8'h9e) : {{((param111 ? param111 : param111) ? (param111 == param111) : param111)}, (^~{{(8'hb1)}, (param111 * param111)})}))
(y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire102;
  input wire signed [(3'h5):(1'h0)] wire101;
  input wire [(2'h2):(1'h0)] wire100;
  input wire signed [(4'hc):(1'h0)] wire99;
  input wire signed [(5'h12):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire107;
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire107,
                 reg108,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg103 <= wire98[(5'h11):(4'hf)];
      reg104 <= wire100;
      reg105 <= (+wire100[(1'h1):(1'h0)]);
      reg106 <= {(reg105 || reg105[(4'hb):(3'h4)])};
    end
  assign wire107 = $signed($unsigned((wire98[(4'he):(3'h4)] >> $signed((wire101 ?
                       (8'hb1) : reg105)))));
  always
    @(posedge clk) begin
      reg108 <= wire101[(1'h0):(1'h0)];
    end
  assign wire109 = reg105[(4'hb):(1'h0)];
  assign wire110 = $signed($unsigned($unsigned((^$signed(reg106)))));
endmodule

module module75
#(parameter param93 = (({(~&((8'ha8) ? (8'hb3) : (7'h41))), ((7'h44) ? ((8'hbe) ? (8'hb5) : (8'ha3)) : {(8'hbe), (8'hb9)})} ? (~^(-((7'h40) && (8'hbe)))) : ({(^(7'h43))} ? (((8'hbf) ? (8'ha5) : (8'hbf)) - (|(8'ha9))) : (((8'h9f) ? (8'hb2) : (7'h44)) ? ((8'ha8) >>> (8'haf)) : (&(8'hbf))))) <<< ((((&(8'hb2)) ^~ ((8'haa) ? (7'h43) : (8'ha4))) >>> ({(8'h9f), (8'hb2)} <= ((8'hb5) + (8'hbb)))) >> ((~&((8'hbe) <<< (8'hbb))) * (~^(|(8'hbf)))))), 
parameter param94 = (!((((~param93) && (^~param93)) || (param93 ? ((8'ha7) + param93) : (^~param93))) ? ((((8'hbd) ? param93 : param93) <= (param93 ? param93 : param93)) ? (|(param93 ? param93 : param93)) : param93) : param93)))
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire80;
  input wire signed [(4'ha):(1'h0)] wire79;
  input wire signed [(3'h6):(1'h0)] wire78;
  input wire signed [(4'hd):(1'h0)] wire77;
  input wire signed [(2'h3):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire [(4'hc):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire88;
  wire [(4'h8):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 reg86,
                 (1'h0)};
  assign wire81 = $unsigned(wire78[(3'h6):(1'h1)]);
  assign wire82 = $unsigned(wire78[(3'h4):(2'h2)]);
  assign wire83 = {$unsigned(wire78[(2'h3):(2'h3)]),
                      ((wire82 + (~|$signed(wire78))) ?
                          {{$unsigned(wire81),
                                  $unsigned(wire79)}} : wire79[(2'h3):(1'h1)])};
  assign wire84 = (($signed(((wire76 ? wire82 : wire80) ?
                      (^wire78) : $signed(wire77))) >>> $signed(({wire82,
                          wire79} ?
                      ((8'hb7) ?
                          wire78 : wire79) : wire82))) * $unsigned((~{(wire80 ?
                          wire79 : wire78)})));
  assign wire85 = (((!($signed(wire84) < (wire79 ?
                          wire83 : wire79))) >> (~|$signed(wire81))) ?
                      ((~|$signed(wire84[(4'hd):(3'h5)])) || wire82[(4'hb):(3'h6)]) : $unsigned(({wire81[(3'h6):(1'h1)],
                          {(8'ha0), wire84}} > ((8'hac) ?
                          $unsigned(wire80) : ((8'ha0) ? wire77 : wire80)))));
  always
    @(posedge clk) begin
      reg86 <= (+wire76[(1'h1):(1'h0)]);
    end
  assign wire87 = $unsigned((-wire76));
  assign wire88 = $unsigned(((~|$unsigned($signed((7'h42)))) ?
                      wire83 : {wire80[(4'h8):(3'h5)],
                          (^(wire81 ? (8'hbe) : (7'h43)))}));
  assign wire89 = ((reg86[(4'h8):(2'h3)] >= $unsigned((|wire88))) < $signed((|($signed((8'haa)) ?
                      wire79[(2'h3):(1'h1)] : (wire78 + wire83)))));
  assign wire90 = wire82;
  assign wire91 = {wire80, $unsigned({$signed((8'hab))})};
  assign wire92 = $signed(wire88);
endmodule

module module209
#(parameter param247 = (8'hbd), 
parameter param248 = ({{({param247, (8'hab)} ? {(8'hbf), param247} : param247), ((param247 ? param247 : (7'h44)) ? (param247 <= param247) : (|param247))}, param247} ? (((+{param247}) ? {(param247 == param247)} : param247) ? param247 : (|{{param247}})) : ((({param247, param247} ? ((8'hb3) != param247) : {param247}) >> (~(~|param247))) ? (((|(8'haa)) ? {param247} : param247) ? (~|((7'h42) ? param247 : param247)) : ((param247 & param247) <= {param247, param247})) : ((~&(^~param247)) > {(~^param247)}))))
(y, clk, wire214, wire213, wire212, wire211, wire210);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire214;
  input wire signed [(4'hd):(1'h0)] wire213;
  input wire signed [(4'h9):(1'h0)] wire212;
  input wire signed [(3'h5):(1'h0)] wire211;
  input wire signed [(5'h14):(1'h0)] wire210;
  wire signed [(5'h15):(1'h0)] wire246;
  wire signed [(4'h9):(1'h0)] wire245;
  wire [(5'h14):(1'h0)] wire244;
  wire signed [(4'he):(1'h0)] wire243;
  wire [(2'h2):(1'h0)] wire238;
  wire signed [(5'h10):(1'h0)] wire237;
  wire signed [(4'h9):(1'h0)] wire236;
  wire [(4'hd):(1'h0)] wire216;
  reg signed [(2'h2):(1'h0)] reg242 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg241 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg240 = (1'h0);
  reg [(5'h11):(1'h0)] reg239 = (1'h0);
  reg [(3'h5):(1'h0)] reg235 = (1'h0);
  reg [(4'ha):(1'h0)] reg234 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg233 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg232 = (1'h0);
  reg [(5'h13):(1'h0)] reg231 = (1'h0);
  reg [(4'hc):(1'h0)] reg230 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg229 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg228 = (1'h0);
  reg [(2'h2):(1'h0)] reg227 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg226 = (1'h0);
  reg [(4'hb):(1'h0)] reg225 = (1'h0);
  reg [(3'h7):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg223 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg222 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg221 = (1'h0);
  reg [(3'h7):(1'h0)] reg220 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg219 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg218 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg217 = (1'h0);
  reg [(4'ha):(1'h0)] reg215 = (1'h0);
  assign y = {wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire238,
                 wire237,
                 wire236,
                 wire216,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
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
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg215,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg215 <= wire213[(2'h3):(2'h3)];
    end
  assign wire216 = wire210[(4'hc):(4'h9)];
  always
    @(posedge clk) begin
      reg217 <= $unsigned((((wire212[(3'h5):(1'h0)] ?
              (wire210 ? wire210 : wire213) : (~|wire216)) ?
          ((wire216 ? wire214 : wire213) ?
              (wire210 - wire214) : (wire214 * wire214)) : $unsigned($unsigned(wire212))) << (wire212[(2'h2):(2'h2)] ?
          ((wire214 ? wire213 : (8'hb2)) + (~|(8'hb4))) : wire216)));
      reg218 <= wire210[(4'ha):(1'h0)];
      if ((-$signed((~^{(wire210 << reg215), $signed(reg217)}))))
        begin
          if ($unsigned((~^((~^{wire214}) & $signed($unsigned((8'h9f)))))))
            begin
              reg219 <= ((~|$signed($unsigned((reg218 + reg218)))) ?
                  ($signed((reg215 ? (reg215 <<< wire211) : reg215)) ?
                      $signed($unsigned(wire211[(3'h4):(2'h2)])) : $unsigned(wire214)) : $signed((($signed(wire210) ?
                      (wire212 << reg218) : (~|wire216)) == ((wire213 ?
                          wire211 : (8'hb5)) ?
                      wire214 : (wire212 ? (8'ha9) : reg218)))));
              reg220 <= $signed(wire211[(3'h4):(2'h3)]);
              reg221 <= reg220[(1'h0):(1'h0)];
              reg222 <= wire214[(4'hf):(4'he)];
              reg223 <= $unsigned($unsigned(reg215[(1'h0):(1'h0)]));
            end
          else
            begin
              reg219 <= ($unsigned($unsigned((~&((8'hb2) ^ wire216)))) ?
                  (|(|($unsigned(wire216) ?
                      (|wire212) : {reg217}))) : ({(+wire216),
                      ((&wire214) < {(8'hbc),
                          (8'h9e)})} >= (+{wire213[(4'hc):(2'h3)],
                      {(8'hac), (8'h9d)}})));
              reg220 <= reg222;
              reg221 <= $unsigned(($signed(($unsigned(wire213) ?
                  {reg219} : (|(7'h42)))) ^ reg220[(1'h1):(1'h1)]));
            end
          if (((^((~$unsigned(reg215)) ~^ (reg215 ?
                  (!(8'hb2)) : {wire213, reg222}))) ?
              $signed({{(wire216 ?
                          reg221 : wire212)}}) : ((~|(((8'hb8) ^~ reg217) ?
                  $signed(wire214) : {reg222, reg223})) - ((reg219 ?
                      $signed(wire213) : (reg222 == wire210)) ?
                  wire216 : $unsigned(reg223[(1'h1):(1'h1)])))))
            begin
              reg224 <= $unsigned(wire214);
              reg225 <= ($signed($unsigned((((8'hb0) != wire211) ?
                      reg222[(3'h4):(2'h2)] : (reg217 - reg215)))) ?
                  (((wire214 ?
                          {reg219} : $signed(wire212)) || $signed($unsigned(reg224))) ?
                      (|(|(wire216 ^ reg224))) : reg223) : wire214[(4'hb):(4'hb)]);
              reg226 <= ($signed(((&reg224) ?
                      $signed((&(8'hbb))) : ((reg215 ?
                          wire212 : wire216) <= (reg220 ? reg222 : wire212)))) ?
                  wire213 : reg222[(3'h5):(2'h2)]);
            end
          else
            begin
              reg224 <= ($unsigned($unsigned(reg224)) ?
                  ($signed((-(-reg226))) > ($unsigned($unsigned(wire210)) - $signed(((8'ha5) + reg223)))) : (($signed(reg222[(2'h3):(1'h0)]) ?
                          $unsigned((reg226 ^~ wire210)) : reg223) ?
                      reg215[(3'h6):(2'h2)] : reg219));
              reg225 <= ($unsigned({(reg225[(2'h2):(2'h2)] << (&(8'hbf)))}) ^~ ($unsigned(($unsigned((8'hb3)) ?
                      (reg221 ? reg226 : reg219) : (+reg219))) ?
                  $signed({$signed(reg226)}) : ((8'hb8) >>> {(wire214 ?
                          (8'haf) : (8'hbf)),
                      reg225[(3'h4):(1'h1)]})));
              reg226 <= {(($unsigned($unsigned(reg223)) ?
                      ((&reg223) ?
                          wire212 : wire214[(4'he):(4'hc)]) : reg217) >> $signed({(reg219 & wire213)})),
                  (-(reg217 ? $signed($unsigned(reg226)) : $signed(reg220)))};
              reg227 <= (+(^(reg225 ?
                  (reg226[(3'h4):(3'h4)] ?
                      {reg220, wire216} : $unsigned((8'hb1))) : (|(wire213 ?
                      reg226 : reg219)))));
              reg228 <= (~|(reg224 ?
                  wire212[(2'h2):(1'h0)] : reg223[(3'h4):(1'h0)]));
            end
          reg229 <= (~&wire212[(3'h6):(1'h0)]);
          reg230 <= $signed((wire210 ^~ reg226));
          reg231 <= reg228[(1'h0):(1'h0)];
        end
      else
        begin
          reg219 <= ((({$signed(reg224), reg219} ?
              ({reg220, (8'had)} ?
                  (reg221 >>> reg221) : $signed(reg229)) : $unsigned((reg222 ?
                  reg221 : wire210))) ^~ {((wire212 * wire216) ?
                  $unsigned(reg228) : (reg227 ? (8'ha4) : wire211)),
              ((wire216 >> (8'hac)) ?
                  reg215 : $unsigned(reg221))}) >>> (~|$unsigned($unsigned($signed(reg230)))));
          reg220 <= $signed(((reg226 ?
                  $unsigned((|wire214)) : reg221[(1'h0):(1'h0)]) ?
              $unsigned($signed((reg227 ^ wire211))) : wire216[(1'h1):(1'h1)]));
        end
      if ((reg228 ?
          $signed($unsigned(($signed(wire216) ?
              reg225 : reg220[(1'h1):(1'h1)]))) : $signed(reg217)))
        begin
          reg232 <= $signed((&$signed($signed((^reg224)))));
          reg233 <= ((reg226 ?
              reg232[(3'h4):(2'h3)] : $unsigned(reg215)) >= $unsigned(reg227[(2'h2):(1'h0)]));
        end
      else
        begin
          if (wire212)
            begin
              reg232 <= (wire210[(2'h2):(1'h0)] ?
                  reg228[(2'h3):(2'h2)] : $unsigned(reg227));
              reg233 <= $signed((reg231[(3'h4):(2'h3)] * wire211));
              reg234 <= (8'hbe);
            end
          else
            begin
              reg232 <= reg221;
              reg233 <= ({(~^(reg217 ?
                      $unsigned(reg221) : (reg228 ? reg227 : (8'haa)))),
                  {$unsigned($unsigned(wire210)),
                      (8'h9e)}} <<< ($signed($signed($signed(reg231))) ?
                  $signed(wire211) : (+(reg227 ?
                      $signed((8'ha3)) : $unsigned(reg215)))));
              reg234 <= (&wire214[(1'h1):(1'h1)]);
            end
        end
      reg235 <= (((-$unsigned((wire213 >> reg226))) == ($signed($unsigned(reg234)) | ((reg221 ?
              wire213 : reg233) << {reg226}))) ?
          $signed(reg221[(1'h0):(1'h0)]) : $signed({reg230[(3'h7):(1'h0)],
              (-$unsigned(reg224))}));
    end
  assign wire236 = $signed((^(8'ha6)));
  assign wire237 = ((^(~reg235)) ?
                       (~^$unsigned((wire210[(5'h13):(4'he)] ?
                           ((8'h9f) ^~ reg219) : (8'hb8)))) : $signed(({$signed(reg219)} ?
                           ((~^reg217) ? reg229 : {reg218}) : reg215)));
  assign wire238 = (wire211 ?
                       ($unsigned(((8'hba) ?
                               (wire211 ? wire216 : reg226) : (!reg217))) ?
                           (&reg217[(2'h2):(1'h0)]) : $signed(($signed(reg232) ?
                               {reg227} : ((7'h40) ?
                                   reg221 : (8'hb7))))) : {(reg230[(2'h2):(1'h0)] ?
                               ($signed(reg218) ?
                                   ((8'hb8) & reg233) : (~|reg233)) : $unsigned(reg217)),
                           (8'hb4)});
  always
    @(posedge clk) begin
      reg239 <= reg222;
      reg240 <= (reg235[(2'h3):(2'h3)] == ({reg222[(3'h5):(1'h0)]} || reg231[(2'h3):(1'h1)]));
      reg241 <= reg227[(1'h1):(1'h0)];
      reg242 <= $unsigned(($unsigned($unsigned($unsigned(reg222))) ^~ $unsigned(reg223)));
    end
  assign wire243 = ((($signed($signed(reg224)) ?
                       (~|(^reg240)) : (^~((8'ha0) - reg231))) | $signed($unsigned({(8'hb8),
                       reg225}))) << (~^$unsigned((~(-reg233)))));
  assign wire244 = reg227;
  assign wire245 = {$unsigned(reg221[(1'h1):(1'h0)]), wire210};
  assign wire246 = ((!{$signed({(7'h43)})}) ?
                       wire214[(4'hb):(4'hb)] : ($unsigned($signed(wire211)) ?
                           (+$unsigned((reg231 ?
                               (8'ha4) : reg239))) : $signed(wire245)));
endmodule

module module160
#(parameter param192 = (({((&(8'ha2)) ? {(8'ha1), (8'ha7)} : {(7'h41), (8'hb3)}), ((~&(8'ha1)) | ((8'hae) - (8'hba)))} ? ((((8'hb8) != (8'ha8)) ? {(8'had)} : ((8'hb5) ? (8'h9c) : (8'hba))) ~^ ({(8'hb2)} ? ((8'ha5) << (8'hb0)) : (~^(7'h41)))) : (|(((8'hb4) ? (8'hbb) : (8'hba)) * ((8'hb6) ? (8'h9c) : (8'hac))))) ^ (-((-(&(8'hba))) < ((~&(8'hbb)) ? ((8'hbb) ^~ (8'hb2)) : {(8'hbb), (7'h44)})))))
(y, clk, wire165, wire164, wire163, wire162, wire161);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire165;
  input wire [(4'hd):(1'h0)] wire164;
  input wire signed [(3'h7):(1'h0)] wire163;
  input wire [(4'ha):(1'h0)] wire162;
  input wire signed [(4'hf):(1'h0)] wire161;
  wire [(3'h6):(1'h0)] wire191;
  wire signed [(4'hf):(1'h0)] wire190;
  wire [(5'h15):(1'h0)] wire182;
  wire signed [(5'h13):(1'h0)] wire181;
  wire signed [(5'h12):(1'h0)] wire178;
  wire signed [(5'h12):(1'h0)] wire177;
  wire signed [(4'ha):(1'h0)] wire176;
  wire [(5'h11):(1'h0)] wire175;
  wire signed [(4'hd):(1'h0)] wire174;
  wire [(4'hd):(1'h0)] wire173;
  wire [(4'hf):(1'h0)] wire168;
  wire [(4'h9):(1'h0)] wire167;
  wire signed [(5'h13):(1'h0)] wire166;
  reg signed [(2'h3):(1'h0)] reg189 = (1'h0);
  reg [(4'hd):(1'h0)] reg188 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg185 = (1'h0);
  reg [(5'h13):(1'h0)] reg184 = (1'h0);
  reg [(4'hb):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg180 = (1'h0);
  reg [(4'hc):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg172 = (1'h0);
  reg [(5'h12):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg169 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire182,
                 wire181,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire168,
                 wire167,
                 wire166,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg180,
                 reg179,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  assign wire166 = (!{$signed((~|(wire164 == wire165))),
                       (~|$unsigned(wire164[(4'h8):(2'h2)]))});
  assign wire167 = (wire162[(4'h8):(3'h7)] > $signed((wire163 ?
                       $unsigned((+wire162)) : {wire166[(4'he):(3'h4)]})));
  assign wire168 = (((|$signed(wire167)) ?
                       $signed(($unsigned((8'hae)) ?
                           $signed(wire166) : wire161)) : wire162) <<< wire161);
  always
    @(posedge clk) begin
      reg169 <= $unsigned((wire163[(2'h3):(1'h0)] >>> (~|(wire164 <<< (~&wire167)))));
      reg170 <= (({wire166} ?
              ($signed(wire165) ?
                  ($signed(wire162) + wire165) : ((wire162 ?
                      wire166 : wire166) != wire167[(3'h4):(1'h0)])) : ((wire166[(5'h13):(4'hb)] <= reg169[(4'h8):(3'h6)]) ?
                  $signed({reg169, wire164}) : wire161)) ?
          wire163 : wire161);
      if (wire162)
        begin
          reg171 <= reg169[(2'h3):(2'h3)];
        end
      else
        begin
          reg171 <= wire168[(4'h8):(2'h3)];
        end
      reg172 <= $signed((~&$signed(wire162)));
    end
  assign wire173 = wire164[(1'h0):(1'h0)];
  assign wire174 = {((!{$unsigned(wire165)}) ?
                           $unsigned(({wire166, (8'haa)} ?
                               (~reg169) : (-wire167))) : $signed({$signed(reg172),
                               (|reg169)})),
                       {wire166[(5'h10):(3'h5)],
                           ($unsigned((-reg172)) + wire161[(2'h3):(1'h0)])}};
  assign wire175 = (reg172 <= wire166[(5'h10):(4'he)]);
  assign wire176 = (^~(($signed((wire161 >>> (8'hbb))) ~^ ({wire163, wire161} ?
                           (8'hbc) : wire168)) ?
                       ($unsigned((8'hbb)) ?
                           wire161[(4'ha):(1'h1)] : $signed((^~(8'ha5)))) : $unsigned((wire168[(3'h7):(3'h7)] ?
                           (wire175 >= wire167) : (wire161 != wire164)))));
  assign wire177 = wire175[(3'h7):(2'h2)];
  assign wire178 = $signed($unsigned(wire176));
  always
    @(posedge clk) begin
      reg179 <= (-$unsigned(((-(wire166 - wire167)) ?
          {{reg172, wire166}} : $unsigned((wire164 ? wire166 : wire176)))));
      reg180 <= (wire166[(4'h8):(3'h7)] ?
          wire168 : (-(wire164[(3'h7):(3'h4)] >= $unsigned(wire174))));
    end
  assign wire181 = ($unsigned(($signed((+wire167)) != $unsigned(wire177[(4'hb):(4'h8)]))) <= (8'haa));
  assign wire182 = $signed({{wire167[(3'h4):(2'h3)], reg170[(5'h11):(5'h10)]},
                       ((reg180[(2'h2):(1'h1)] ?
                               $unsigned(wire174) : (reg180 ?
                                   reg169 : (8'h9c))) ?
                           $signed((-reg179)) : $unsigned($signed((8'ha0))))});
  always
    @(posedge clk) begin
      reg183 <= ($signed(($unsigned((reg180 ? reg172 : (8'haf))) ?
          $signed($signed(reg169)) : $signed(((8'ha5) && reg170)))) != ((|$unsigned((-reg169))) ^ ((8'hb1) != $unsigned((reg179 ?
          (7'h44) : wire177)))));
      reg184 <= $signed($unsigned(reg170));
      if ({reg183[(4'hb):(1'h1)], (wire181[(4'hf):(1'h0)] ? wire175 : wire181)})
        begin
          reg185 <= ((($unsigned((wire177 << reg169)) ?
                  {(wire175 ?
                          wire174 : wire175)} : (!$signed(reg170))) << reg171[(3'h4):(2'h2)]) ?
              ({((+reg172) > (^reg183))} ?
                  wire181 : (!(|$unsigned(wire165)))) : $signed((wire175[(4'hd):(3'h6)] ?
                  (^~(&wire167)) : ($unsigned(reg183) ?
                      (-reg171) : (~|wire161)))));
          reg186 <= $unsigned(reg172);
        end
      else
        begin
          reg185 <= $unsigned((~|$unsigned({reg185, $unsigned(wire161)})));
          reg186 <= $unsigned($signed(wire162[(2'h3):(2'h3)]));
          reg187 <= wire174[(3'h5):(1'h0)];
          reg188 <= (~^$unsigned(wire166[(2'h2):(1'h0)]));
          reg189 <= (reg180 ?
              (~^$signed(({wire165, wire173} | (wire177 ?
                  wire177 : (8'hb0))))) : {$signed(($unsigned(reg186) ?
                      $signed((7'h44)) : reg185)),
                  (~$unsigned((reg188 + reg186)))});
        end
    end
  assign wire190 = $unsigned($unsigned(($unsigned($signed((8'hb5))) < $signed((wire182 ~^ reg187)))));
  assign wire191 = (((~^(+(wire174 ? wire166 : (8'hbb)))) ?
                           (reg183 <= reg169[(3'h4):(2'h2)]) : $signed(((reg186 ?
                               (8'hbf) : wire161) + (8'ha9)))) ?
                       (~^$signed({(8'hbc), $signed(wire163)})) : (wire162 ?
                           (&$unsigned($signed(wire177))) : $unsigned(reg179)));
endmodule
