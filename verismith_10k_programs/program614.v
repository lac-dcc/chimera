module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire223;
  wire [(5'h13):(1'h0)] wire222;
  wire [(4'h8):(1'h0)] wire221;
  wire [(5'h14):(1'h0)] wire220;
  wire signed [(4'hf):(1'h0)] wire219;
  wire [(5'h11):(1'h0)] wire212;
  wire [(5'h13):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire214;
  wire [(5'h11):(1'h0)] wire216;
  wire signed [(4'hb):(1'h0)] wire217;
  assign y = {wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire212,
                 wire142,
                 wire140,
                 wire214,
                 wire216,
                 wire217,
                 (1'h0)};
  module4 #() modinst141 (.wire7(wire0), .clk(clk), .wire6(wire1), .y(wire140), .wire5(wire3), .wire8(wire2));
  assign wire142 = wire1;
  module143 #() modinst213 (wire212, clk, wire2, wire3, wire140, wire0, wire1);
  module4 #() modinst215 (wire214, clk, wire0, wire142, wire1, wire212);
  assign wire216 = ($unsigned(wire214[(1'h1):(1'h0)]) ?
                       (7'h42) : ((~|wire0[(1'h0):(1'h0)]) + (-$unsigned($signed(wire3)))));
  module42 #() modinst218 (.clk(clk), .wire43(wire214), .wire44(wire0), .wire46(wire142), .wire47(wire1), .y(wire217), .wire45(wire212));
  assign wire219 = (8'hbf);
  assign wire220 = $unsigned(((wire216 ?
                           ((-wire3) ?
                               (~&wire219) : (+(8'h9d))) : $unsigned((wire216 & wire0))) ?
                       (wire217 + $signed($signed((8'haf)))) : {($unsigned(wire0) > (wire216 - wire140)),
                           ((wire1 ? wire142 : wire3) << {wire214, wire219})}));
  assign wire221 = {(~|(8'hb4)),
                       (~&(wire1[(5'h11):(1'h1)] <= $signed(wire217[(4'h8):(1'h1)])))};
  assign wire222 = (((wire142[(5'h10):(1'h1)] || wire2[(3'h7):(1'h1)]) ?
                       wire221[(1'h1):(1'h1)] : wire0[(3'h5):(1'h1)]) + {(wire1 ?
                           wire142[(4'ha):(1'h1)] : ((wire217 ?
                                   wire221 : wire3) ?
                               $signed(wire219) : $unsigned(wire212)))});
  assign wire223 = ($signed({{(^wire216)}}) ?
                       (wire221 == $unsigned(wire214[(2'h2):(1'h1)])) : ({$signed((wire2 ?
                               wire222 : wire222)),
                           $unsigned(wire219[(2'h3):(2'h3)])} ^ (((wire0 + wire216) ?
                               $signed(wire142) : $unsigned(wire2)) ?
                           $signed(wire142[(4'ha):(1'h1)]) : ((+(8'ha4)) ?
                               $unsigned(wire1) : (wire212 ?
                                   (8'hb0) : wire220)))));
endmodule

module module143
#(parameter param210 = ((|{{((8'haa) ? (8'hbb) : (8'hb0)), {(8'ha3), (8'h9d)}}}) ? (-(({(8'hba), (8'hbd)} ? ((8'ha3) ? (8'ha5) : (8'hb7)) : ((8'hb0) ^~ (8'hb8))) - (|((8'ha6) > (7'h40))))) : ((8'hac) ? (~^{((8'hb7) ? (8'hba) : (8'hb7)), (~^(8'ha0))}) : (~|((~|(8'hb3)) ? ((8'h9f) ? (7'h43) : (8'h9f)) : ((8'ha2) ? (8'hb1) : (8'haf)))))), 
parameter param211 = (((param210 ? ({param210, param210} ? param210 : (param210 ? param210 : param210)) : {(8'hab), (~^param210)}) ? ((param210 ? param210 : (param210 ? param210 : param210)) >= param210) : ({(+param210)} ? param210 : ((~^param210) & (!param210)))) > (~&((-(~param210)) >>> ((param210 ? param210 : (8'hb8)) - (param210 ? param210 : param210))))))
(y, clk, wire148, wire147, wire146, wire145, wire144);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire148;
  input wire [(4'hc):(1'h0)] wire147;
  input wire [(5'h13):(1'h0)] wire146;
  input wire [(4'h9):(1'h0)] wire145;
  input wire [(4'h8):(1'h0)] wire144;
  wire signed [(4'hd):(1'h0)] wire209;
  wire [(2'h3):(1'h0)] wire197;
  wire [(5'h14):(1'h0)] wire196;
  wire [(4'hb):(1'h0)] wire195;
  wire signed [(5'h10):(1'h0)] wire194;
  wire [(5'h10):(1'h0)] wire192;
  wire signed [(3'h5):(1'h0)] wire150;
  wire [(4'ha):(1'h0)] wire149;
  reg signed [(4'ha):(1'h0)] reg208 = (1'h0);
  reg [(4'ha):(1'h0)] reg207 = (1'h0);
  reg [(4'h8):(1'h0)] reg206 = (1'h0);
  reg [(5'h12):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg204 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg202 = (1'h0);
  reg [(4'hb):(1'h0)] reg201 = (1'h0);
  reg [(3'h7):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg199 = (1'h0);
  reg [(3'h6):(1'h0)] reg198 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(3'h5):(1'h0)] reg152 = (1'h0);
  reg [(4'hf):(1'h0)] reg153 = (1'h0);
  assign y = {wire209,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire192,
                 wire150,
                 wire149,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg151,
                 reg152,
                 reg153,
                 (1'h0)};
  assign wire149 = (|((wire147[(2'h2):(2'h2)] ?
                           (~&(~&wire146)) : ($unsigned(wire144) && wire144)) ?
                       wire144 : (|{wire146[(4'hf):(3'h6)],
                           (wire144 < wire145)})));
  assign wire150 = wire148;
  always
    @(posedge clk) begin
      if (((((~|(~&wire149)) ~^ (+(wire145 ^~ wire147))) ?
              $signed((wire147[(4'h8):(1'h0)] ?
                  (wire149 >= (8'hb6)) : (wire148 ?
                      wire146 : (8'ha2)))) : wire150) ?
          wire150 : ({(~^$unsigned(wire150))} ?
              $signed($signed((wire144 ?
                  wire148 : wire147))) : ({wire148} && {$unsigned((8'hb1)),
                  (-wire146)}))))
        begin
          reg151 <= $unsigned((wire149 ^~ $unsigned(($signed(wire147) ^ $signed(wire148)))));
          reg152 <= reg151[(2'h2):(1'h1)];
          reg153 <= wire150;
        end
      else
        begin
          reg151 <= {$signed(wire145[(3'h6):(3'h5)]), wire148[(4'hd):(4'h8)]};
          reg152 <= ({(~&($signed(reg153) >> wire147[(2'h2):(1'h1)])),
              wire144[(1'h1):(1'h0)]} > wire145);
        end
    end
  module154 #() modinst193 (wire192, clk, wire146, reg153, wire144, wire149, wire148);
  assign wire194 = (|(7'h44));
  assign wire195 = $unsigned((~^{$signed((reg153 ? (8'hb8) : wire147)),
                       ({wire194} ?
                           (wire146 && wire194) : $unsigned(wire144))}));
  assign wire196 = ((~^reg152) < wire194[(4'hb):(4'ha)]);
  assign wire197 = ($unsigned(($unsigned((~|wire146)) <<< wire149[(3'h7):(3'h6)])) && $unsigned(($unsigned(wire144) < $unsigned(reg153[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if ((^$unsigned(wire150[(2'h3):(2'h3)])))
        begin
          reg198 <= ($unsigned((8'haa)) ?
              {wire144[(2'h3):(1'h0)],
                  $signed(((8'hab) ?
                      (-(8'hac)) : (^~wire149)))} : $signed((((wire197 ~^ reg153) ?
                      (8'ha5) : wire194[(3'h4):(3'h4)]) ?
                  $unsigned((^~reg151)) : $unsigned($signed((8'hb3))))));
          reg199 <= $signed((($unsigned(((8'hbe) && wire192)) ^ ((~(7'h44)) * (wire144 ?
              wire197 : reg152))) && $unsigned($unsigned($signed(wire196)))));
          reg200 <= (((((wire194 ? wire150 : reg153) << (wire197 ?
                      wire150 : wire150)) ?
                  $unsigned((wire145 <= reg152)) : $unsigned(wire150[(3'h5):(2'h2)])) + wire194[(1'h1):(1'h0)]) ?
              reg153 : wire148);
          reg201 <= $unsigned(wire148[(5'h11):(4'hf)]);
        end
      else
        begin
          reg198 <= $unsigned($unsigned((~&$signed(wire195[(3'h5):(3'h5)]))));
          reg199 <= {wire144,
              ((8'had) ?
                  ((wire196[(4'hb):(2'h3)] ?
                          {wire197, reg153} : $signed((8'hb9))) ?
                      ((wire145 ~^ wire149) ?
                          (reg200 ?
                              wire194 : (7'h42)) : (+wire194)) : (reg201 >= (reg152 == wire194))) : (|$signed(reg151)))};
          reg200 <= $unsigned($signed($signed(wire196)));
          if (((~(8'h9d)) ?
              (wire194[(3'h7):(3'h7)] ?
                  wire196[(3'h5):(2'h3)] : $unsigned({(wire150 ?
                          wire196 : reg153)})) : wire192))
            begin
              reg201 <= reg198[(3'h5):(2'h2)];
              reg202 <= (~^(!wire150));
            end
          else
            begin
              reg201 <= (reg202 ?
                  $unsigned((^$unsigned(reg199))) : wire192[(3'h6):(2'h3)]);
            end
        end
      if (wire196[(3'h5):(2'h3)])
        begin
          if ($unsigned(((&((wire144 ? reg198 : wire195) ?
              $unsigned(reg198) : (wire144 ? reg200 : wire145))) || (8'had))))
            begin
              reg203 <= (&wire196);
              reg204 <= wire195[(3'h4):(3'h4)];
            end
          else
            begin
              reg203 <= wire197;
              reg204 <= $signed({$signed($signed($signed(reg199)))});
              reg205 <= reg153;
              reg206 <= ({wire192, reg153} ?
                  ($unsigned(({(8'hbb)} ?
                      $signed(reg203) : wire195[(3'h7):(3'h6)])) == (reg152 ?
                      reg204[(2'h3):(1'h0)] : reg200[(3'h6):(2'h2)])) : {$signed($unsigned(wire194[(3'h5):(2'h2)]))});
            end
        end
      else
        begin
          if ((8'hae))
            begin
              reg203 <= ((8'hb8) ?
                  (&(wire149 ?
                      $signed($unsigned(wire150)) : $unsigned($unsigned(reg201)))) : reg206);
              reg204 <= reg201[(4'ha):(3'h7)];
            end
          else
            begin
              reg203 <= $unsigned(((~|(^$signed(reg203))) ?
                  {$unsigned((reg205 + wire196))} : {reg202}));
              reg204 <= {$unsigned(((~(reg198 ? wire150 : wire195)) ?
                      (reg205 || wire149) : reg202[(2'h3):(2'h2)])),
                  (wire148 && reg205)};
              reg205 <= {(|reg152[(3'h5):(2'h3)]),
                  ($signed((wire146 ? (wire144 >> reg206) : (~^wire146))) ?
                      {reg203,
                          ({reg199} << ((8'ha0) ?
                              (8'had) : wire196))} : reg204)};
              reg206 <= (((7'h41) ?
                  $unsigned(((wire195 >>> wire147) ?
                      {wire144,
                          wire148} : $signed(wire197))) : $unsigned(reg202[(4'hd):(4'hd)])) & reg205);
            end
          reg207 <= reg153[(4'hb):(4'h9)];
        end
    end
  always
    @(posedge clk) begin
      reg208 <= wire197;
    end
  assign wire209 = (^~{{$unsigned(wire148[(2'h2):(1'h0)])},
                       ($signed((reg200 ? wire144 : reg204)) | (|{wire147,
                           wire195}))});
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h228):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire5;
  input wire [(4'ha):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire90;
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire135,
                 wire122,
                 wire121,
                 wire119,
                 wire92,
                 wire9,
                 wire10,
                 wire11,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire90,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  assign wire9 = wire5[(3'h6):(2'h2)];
  assign wire10 = {wire6[(3'h5):(3'h5)], wire7};
  assign wire11 = {wire8};
  always
    @(posedge clk) begin
      reg12 <= $signed((wire11 < ($unsigned($unsigned(wire7)) ?
          {(~^wire8)} : (~^wire6))));
      reg13 <= {wire8};
    end
  always
    @(posedge clk) begin
      if (wire7)
        begin
          reg14 <= ($unsigned(wire11[(2'h2):(1'h1)]) + wire7);
        end
      else
        begin
          reg14 <= $unsigned(((~|$unsigned(wire8)) ?
              (({(8'hb1), wire9} <<< reg14[(1'h1):(1'h1)]) ?
                  $signed({reg14,
                      wire11}) : (-wire7)) : $signed(reg13[(3'h5):(2'h3)])));
          if ($signed($unsigned((((reg12 >> reg13) && wire9) ?
              ($unsigned(wire5) + (reg13 ^~ wire7)) : reg13))))
            begin
              reg15 <= (wire7[(3'h5):(3'h5)] <= $signed((~|reg13[(4'h8):(1'h1)])));
              reg16 <= wire8[(1'h0):(1'h0)];
              reg17 <= wire7[(5'h12):(1'h1)];
            end
          else
            begin
              reg15 <= (reg12[(1'h0):(1'h0)] ?
                  ((-wire10[(1'h0):(1'h0)]) << {reg13}) : {(^{wire8})});
              reg16 <= (~|($unsigned($unsigned((!reg14))) >>> (((reg14 < reg12) ^~ reg16[(1'h0):(1'h0)]) ?
                  $signed({reg15}) : {$unsigned(reg14)})));
              reg17 <= $signed($signed($signed(wire7[(3'h7):(3'h7)])));
              reg18 <= (wire11[(2'h3):(1'h0)] ? wire8 : wire7[(3'h7):(3'h6)]);
              reg19 <= {{(reg18[(3'h7):(2'h3)] == ($signed(reg17) * reg17))},
                  reg14};
            end
          if ((~({(&{(8'had)}), $signed((^wire11))} ?
              wire11[(1'h0):(1'h0)] : (&(reg14[(3'h7):(3'h6)] > (~reg18))))))
            begin
              reg20 <= (reg12 <= (($unsigned(reg13) ?
                      {(!reg13), {reg15, reg16}} : $unsigned((reg16 > reg12))) ?
                  reg18 : $unsigned(({(8'hb8)} ? reg15 : (reg17 || wire11)))));
              reg21 <= {(8'ha0), $signed(wire10)};
              reg22 <= ((wire7 ?
                  $signed((~|$unsigned((8'ha0)))) : reg12[(3'h4):(1'h0)]) > {(+(reg17[(1'h1):(1'h1)] ?
                      (reg18 ? (8'hb5) : reg21) : wire7))});
            end
          else
            begin
              reg20 <= (!((($unsigned((8'ha3)) - {reg19, reg12}) ?
                  {(wire5 ? (8'hb4) : reg15)} : (wire11[(2'h3):(1'h1)] ?
                      $unsigned(wire9) : (wire10 ?
                          wire9 : wire9))) >>> reg19[(4'h9):(1'h0)]));
              reg21 <= (~|$signed((8'hb9)));
              reg22 <= reg17[(2'h2):(1'h0)];
              reg23 <= $signed((-$signed($signed((wire11 ~^ wire10)))));
              reg24 <= (wire10 - $unsigned(((^~((8'ha4) ?
                  reg22 : (8'hb9))) >> $unsigned(wire9))));
            end
          reg25 <= reg20;
          if ({(reg18[(4'hb):(4'h8)] >= ({(reg14 >= reg21)} & (reg20 > $signed(reg18)))),
              (($signed($signed((8'ha3))) + (|$unsigned(wire8))) ~^ $signed({(wire5 != wire6),
                  reg17[(2'h3):(2'h2)]}))})
            begin
              reg26 <= ($signed((({reg23} && {reg12}) == reg20)) ~^ (wire11[(2'h3):(1'h0)] >= wire7[(4'he):(1'h0)]));
            end
          else
            begin
              reg26 <= $signed($unsigned((reg21[(4'h8):(3'h6)] ?
                  ($unsigned(reg13) ?
                      (reg19 * (7'h41)) : (^~reg25)) : (7'h44))));
            end
        end
      if ((((7'h40) >>> {({reg18} ?
              reg20[(4'hc):(1'h0)] : $unsigned(reg20))}) >> (reg16 & $unsigned((~&(reg20 > wire5))))))
        begin
          reg27 <= (~|reg19);
          if ({((8'hb5) & ((!((8'hae) || reg23)) + reg27))})
            begin
              reg28 <= ({$unsigned($unsigned((reg15 ? reg19 : reg26))),
                      $signed(wire11)} ?
                  (^(!$signed((reg27 ^~ (8'hb2))))) : (((reg14 ?
                          (|wire7) : ((7'h44) < (8'haa))) && ($unsigned((8'ha4)) ?
                          reg15[(4'h9):(3'h6)] : (~^reg21))) ?
                      $signed(wire11) : $signed($signed(wire9[(2'h3):(2'h3)]))));
              reg29 <= $unsigned((((&wire10[(3'h5):(3'h4)]) ?
                  $unsigned((reg26 ? reg28 : reg14)) : reg17) != (+(wire8 ?
                  reg12 : $signed(wire10)))));
              reg30 <= ((^wire11) != wire11);
              reg31 <= $signed(reg17);
            end
          else
            begin
              reg28 <= ($unsigned(($signed((wire7 + (7'h40))) & reg29)) * {({(wire7 ^ wire9)} ?
                      ($signed(reg16) ?
                          $signed(reg30) : $unsigned(reg20)) : {{reg16}})});
              reg29 <= wire5[(3'h5):(1'h0)];
              reg30 <= (-$unsigned(reg14[(4'ha):(3'h7)]));
              reg31 <= reg31[(1'h1):(1'h1)];
              reg32 <= $unsigned(wire7);
            end
        end
      else
        begin
          if ((((reg21 >>> $signed((8'hab))) ^~ (($signed((8'hb8)) ?
                  $signed((8'ha9)) : reg17) && ({reg20, reg13} ?
                  (wire10 > reg19) : (8'hb7)))) ?
              $signed((~$signed((~^reg21)))) : $signed((~&((reg14 ?
                  reg15 : reg27) && reg31[(1'h1):(1'h1)])))))
            begin
              reg27 <= reg28[(3'h6):(2'h2)];
              reg28 <= (~reg17[(1'h0):(1'h0)]);
              reg29 <= (|({reg27, $unsigned((reg13 ? reg27 : wire8))} ?
                  $signed($signed((^reg19))) : (8'hbf)));
              reg30 <= (^~$unsigned((^~(8'hb2))));
              reg31 <= reg20;
            end
          else
            begin
              reg27 <= $signed($signed((($signed(reg24) ?
                      reg20[(4'h9):(2'h2)] : $unsigned(reg28)) ?
                  $signed($unsigned(reg17)) : $unsigned(wire11))));
            end
        end
      reg33 <= ($signed(({reg13,
          $signed(reg32)} * $signed($signed(reg21)))) + $signed((|wire9[(4'hc):(4'hb)])));
      reg34 <= $signed(reg31);
      reg35 <= {$unsigned(reg15), (~&reg28[(3'h5):(1'h0)])};
    end
  assign wire36 = reg32;
  assign wire37 = $unsigned(reg35[(1'h0):(1'h0)]);
  assign wire38 = $unsigned(reg24);
  assign wire39 = $signed((+((wire11 ?
                      $unsigned(reg29) : $unsigned(wire7)) ^~ reg25[(3'h6):(3'h5)])));
  assign wire40 = reg24[(2'h3):(1'h0)];
  assign wire41 = (~|reg34[(3'h6):(3'h5)]);
  module42 #() modinst91 (.wire45(reg23), .wire47(wire7), .y(wire90), .clk(clk), .wire44(reg24), .wire46(reg26), .wire43(reg12));
  assign wire92 = {$unsigned(($signed($unsigned(reg20)) >> (wire38[(3'h4):(1'h0)] ?
                          (reg17 ? reg17 : reg29) : reg20))),
                      wire8[(1'h0):(1'h0)]};
  module93 #() modinst120 (wire119, clk, reg13, wire39, reg20, wire8);
  assign wire121 = (+$signed((~|$signed(wire92))));
  assign wire122 = reg20[(3'h7):(3'h7)];
  module123 #() modinst136 (wire135, clk, reg19, wire6, reg14, wire5, reg21);
  assign wire137 = ($signed(((^~(reg32 ? reg21 : reg27)) | (reg20 ?
                       wire119 : (reg23 ?
                           reg34 : reg25)))) ~^ $signed($signed($signed((~wire9)))));
  assign wire138 = reg28[(3'h5):(1'h1)];
  assign wire139 = reg15;
endmodule

module module123
#(parameter param134 = (((~|(&((8'hbe) ? (8'hab) : (8'hb3)))) >> ({{(8'hbe), (8'h9e)}} <<< (((8'hb7) ^ (8'h9e)) < (7'h42)))) == {({{(8'hbc), (8'haf)}} ^ ({(8'haa)} != ((8'ha2) > (8'hb4))))}))
(y, clk, wire128, wire127, wire126, wire125, wire124);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire128;
  input wire [(3'h7):(1'h0)] wire127;
  input wire [(2'h2):(1'h0)] wire126;
  input wire signed [(4'h9):(1'h0)] wire125;
  input wire [(5'h15):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire133;
  wire signed [(5'h10):(1'h0)] wire132;
  wire [(4'h9):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire130;
  wire signed [(4'hf):(1'h0)] wire129;
  assign y = {wire133, wire132, wire131, wire130, wire129, (1'h0)};
  assign wire129 = wire127[(3'h6):(1'h0)];
  assign wire130 = {$unsigned(wire126[(1'h1):(1'h0)]), (~&wire128)};
  assign wire131 = $unsigned({wire129});
  assign wire132 = ($unsigned(wire130[(1'h1):(1'h0)]) ?
                       $unsigned({$signed((wire131 <= wire124)),
                           $unsigned(wire127)}) : wire128[(1'h0):(1'h0)]);
  assign wire133 = (!($unsigned($unsigned((~wire124))) ^~ $signed(((wire126 != wire127) ?
                       $signed(wire125) : wire128))));
endmodule

module module93
#(parameter param118 = (&{((((7'h42) ? (8'haf) : (8'ha7)) > ((8'ha6) ? (8'h9c) : (8'ha4))) ~^ {(~&(8'hb9)), ((8'hbf) ? (8'hbf) : (8'hbd))})}))
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire97;
  input wire signed [(3'h5):(1'h0)] wire96;
  input wire [(5'h11):(1'h0)] wire95;
  input wire signed [(5'h10):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire114;
  wire [(5'h12):(1'h0)] wire113;
  wire [(2'h3):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire103;
  wire signed [(2'h3):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire98;
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire98 = {wire96, {wire94, wire94[(4'he):(4'hb)]}};
  assign wire99 = wire94;
  assign wire100 = (-$unsigned(({(~|wire96), $signed(wire97)} <<< (wire99 ?
                       (wire98 <= wire99) : $signed(wire97)))));
  assign wire101 = {$signed($signed(((wire97 ? wire98 : (8'hbf)) ?
                           wire96 : wire96[(2'h2):(2'h2)]))),
                       $signed(wire100)};
  assign wire102 = ({($unsigned((wire94 - wire101)) ?
                           $unsigned((wire99 * wire96)) : (7'h43)),
                       wire100[(3'h7):(3'h7)]} & wire100);
  assign wire103 = $signed($signed({((wire95 >= wire96) ?
                           ((8'hb0) | wire98) : (~|wire102)),
                       (-(+wire95))}));
  assign wire104 = (-wire103);
  assign wire105 = ($signed($signed((8'hb0))) ?
                       (($unsigned($unsigned((8'h9e))) <= $unsigned((wire100 ?
                               wire94 : wire98))) ?
                           (($signed(wire100) ?
                               wire94[(4'he):(4'h9)] : ((7'h42) ?
                                   wire96 : (7'h44))) << (^~{wire97})) : ($unsigned((wire104 ?
                                   wire97 : wire94)) ?
                               (^((8'hb8) ?
                                   wire104 : wire97)) : (wire100 && (wire102 ~^ wire97)))) : wire94);
  always
    @(posedge clk) begin
      reg106 <= wire102;
      reg107 <= (wire102 ^ $unsigned(($unsigned(((8'had) + wire104)) ?
          {{reg106, wire103}, $unsigned(wire104)} : wire98)));
    end
  assign wire108 = (wire103 ^~ ((wire103[(1'h1):(1'h1)] ?
                           ((wire99 >>> wire94) ?
                               {wire100, wire98} : wire94) : $unsigned((wire99 ?
                               wire97 : wire102))) ?
                       (wire95[(4'h8):(4'h8)] ?
                           $unsigned(wire98[(4'ha):(3'h7)]) : ((8'h9e) ?
                               wire94 : wire103)) : (8'h9c)));
  assign wire109 = ((wire97[(2'h3):(2'h2)] * $unsigned(((wire97 ?
                               wire94 : wire108) ?
                           wire99[(2'h3):(1'h1)] : (reg106 ?
                               wire94 : wire102)))) ?
                       ({(wire95[(4'ha):(4'ha)] ?
                                   $unsigned((8'hb9)) : (-wire98)),
                               wire94} ?
                           $signed({(wire100 * (8'hae)),
                               (^wire102)}) : $unsigned(wire105)) : wire95[(5'h10):(4'hc)]);
  assign wire110 = ({{(wire100 && (wire95 ^~ reg107))},
                           ($signed({(8'hb6)}) ~^ wire99)} ?
                       (-$unsigned(wire103)) : $unsigned(wire104));
  assign wire111 = $signed((($signed($signed((8'hbe))) & $signed($unsigned((8'hb3)))) ?
                       (wire101 * $signed(wire95)) : wire102[(2'h3):(1'h0)]));
  assign wire112 = $unsigned((wire98[(4'hd):(4'ha)] > ($unsigned(wire101[(4'hc):(2'h2)]) <<< $signed((wire101 ?
                       wire98 : wire96)))));
  assign wire113 = wire109;
  assign wire114 = {(!wire100)};
  assign wire115 = wire101;
  assign wire116 = ($signed((8'h9d)) ?
                       {{((+wire96) ? $unsigned(wire96) : $unsigned(wire110)),
                               (~&(wire114 ? wire99 : wire109))},
                           wire97[(3'h6):(1'h1)]} : ((^$unsigned({wire104,
                               wire113})) ?
                           wire105[(3'h5):(1'h0)] : wire97[(2'h2):(2'h2)]));
  assign wire117 = ($signed({wire114[(4'hd):(3'h7)],
                       (((8'hb1) + (8'hbd)) ?
                           reg106 : wire105)}) << (({wire104[(4'hb):(4'h9)]} ?
                       wire108 : $signed((~wire108))) >= ((^~(reg107 >> wire104)) ^ wire105[(1'h0):(1'h0)])));
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h216):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire47;
  input wire signed [(5'h11):(1'h0)] wire46;
  input wire signed [(3'h4):(1'h0)] wire45;
  input wire [(5'h13):(1'h0)] wire44;
  input wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire56;
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire86,
                 wire85,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire56,
                 reg87,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire45 ^~ (wire44[(4'he):(3'h5)] ?
          wire46 : $signed($signed(wire43)))))
        begin
          reg48 <= (^$signed(wire47));
          if ($unsigned((($signed(wire44[(4'h9):(2'h2)]) ?
              (&(^wire45)) : wire46) <= (-$signed(wire43[(4'h8):(2'h3)])))))
            begin
              reg49 <= (-(+(-{$unsigned(reg48), $signed(wire47)})));
              reg50 <= (wire44 >>> $unsigned(wire43[(2'h3):(2'h2)]));
              reg51 <= ($unsigned($unsigned(((~&reg48) <= reg49[(3'h5):(3'h4)]))) <<< (8'ha8));
              reg52 <= $signed({wire43[(5'h12):(1'h1)], wire47});
              reg53 <= $unsigned($signed((8'h9f)));
            end
          else
            begin
              reg49 <= ($signed($signed((wire44 ?
                      (wire43 ? (8'hbc) : reg53) : $signed(reg52)))) ?
                  $unsigned($signed($unsigned((reg50 ~^ reg48)))) : (((reg53 ?
                              $unsigned((8'hbd)) : (reg48 | wire44)) ?
                          ((reg50 >> reg49) + $signed(reg51)) : (wire44 * reg53[(4'hd):(3'h5)])) ?
                      (^~reg53) : $unsigned(reg49)));
              reg50 <= reg48;
              reg51 <= ($unsigned(((reg53 - (7'h40)) ?
                  wire47[(2'h3):(1'h0)] : wire44[(1'h1):(1'h0)])) + ((8'h9d) ~^ $unsigned(((reg50 ?
                      wire47 : wire43) ?
                  $signed(reg50) : (reg52 ? wire46 : wire46)))));
            end
          reg54 <= reg53;
        end
      else
        begin
          reg48 <= wire45;
          if ((~reg49[(4'h9):(3'h6)]))
            begin
              reg49 <= (8'hbf);
              reg50 <= reg50[(2'h3):(1'h1)];
            end
          else
            begin
              reg49 <= $signed((!$signed(((^~wire46) << (|reg50)))));
            end
          if (((+(((reg53 ? wire45 : wire44) & {reg49}) ?
              (((8'hb3) && reg50) ^ {wire47, reg48}) : ((reg49 ?
                  (8'hbf) : reg49) ^ $unsigned(wire43)))) || $unsigned(((~wire43[(3'h6):(2'h2)]) ^~ (reg50 ?
              (~|reg49) : (~^wire45))))))
            begin
              reg51 <= wire46;
              reg52 <= {((wire46[(4'he):(4'he)] ? reg54 : reg48) ?
                      reg52[(4'h9):(4'h9)] : (^((^~(8'hab)) | $unsigned((8'hb0))))),
                  reg52};
              reg53 <= (reg49[(4'h9):(3'h4)] ^ reg48);
              reg54 <= reg49;
            end
          else
            begin
              reg51 <= ((&wire45) ?
                  $signed($unsigned($unsigned($unsigned(reg53)))) : $signed((~$unsigned($signed(wire47)))));
              reg52 <= $unsigned(reg48);
              reg53 <= $unsigned((wire44 >>> $unsigned({((8'hb2) - reg53)})));
              reg54 <= $signed($unsigned($unsigned($signed(reg50))));
            end
        end
      reg55 <= ((^{(~|(reg54 == wire47)), wire46}) <= ($signed(((wire46 ?
                  wire46 : wire45) ?
              $unsigned((8'h9e)) : (reg50 <= (8'ha7)))) ?
          (^((wire47 ? reg52 : wire45) ? reg49 : (&wire44))) : wire46));
    end
  assign wire56 = $unsigned($unsigned(({((8'ha9) ? reg49 : wire46),
                      (reg50 ? (8'hab) : wire47)} ~^ wire46)));
  always
    @(posedge clk) begin
      reg57 <= (wire43 ^~ reg49);
      if ($unsigned($signed(reg51)))
        begin
          reg58 <= (wire56 ? wire46[(4'he):(2'h2)] : reg49[(2'h2):(1'h1)]);
          if ((+reg51))
            begin
              reg59 <= $unsigned((wire56 - (+reg55[(3'h5):(3'h5)])));
              reg60 <= reg51;
            end
          else
            begin
              reg59 <= wire45;
              reg60 <= wire46;
              reg61 <= (~^(7'h44));
              reg62 <= reg59;
            end
          reg63 <= $unsigned($signed((!(reg58[(4'h9):(3'h5)] ~^ {reg60,
              wire46}))));
          reg64 <= $signed((~$unsigned(((&reg55) ?
              reg51 : (wire44 >= reg59)))));
          reg65 <= (8'ha1);
        end
      else
        begin
          if ((~(~reg61)))
            begin
              reg58 <= (~&$unsigned(($signed((reg48 >> reg57)) ?
                  ((8'had) ?
                      $signed(reg61) : wire45) : (-reg63[(3'h5):(1'h0)]))));
              reg59 <= ({((8'hbe) - reg60[(3'h4):(3'h4)]),
                      reg63[(2'h2):(1'h1)]} ?
                  ((reg63 <<< wire47[(3'h7):(3'h6)]) - $unsigned((reg59[(2'h3):(2'h3)] > (reg50 ?
                      wire47 : reg50)))) : (-{$signed(reg64)}));
            end
          else
            begin
              reg58 <= wire44[(3'h7):(3'h5)];
              reg59 <= {reg48};
              reg60 <= wire46[(1'h0):(1'h0)];
              reg61 <= (($signed(reg60[(2'h3):(2'h3)]) ?
                  $unsigned({(-reg63)}) : (+reg65[(4'h8):(2'h3)])) >= reg51[(3'h6):(3'h4)]);
            end
          reg62 <= $unsigned((^~(((reg51 + reg53) != $signed(reg49)) - (-wire46[(4'ha):(4'h9)]))));
          reg63 <= ($signed($signed(($signed(reg61) && (reg58 ^ reg48)))) ?
              $unsigned((+$signed($unsigned(wire45)))) : (((-((8'haf) | reg57)) ?
                      {{reg62}, (~|reg57)} : reg55) ?
                  $signed(reg52) : (+(-(wire44 ? (8'hbc) : reg49)))));
          reg64 <= {{(~^reg62[(2'h2):(2'h2)])},
              $unsigned($unsigned($signed(reg48)))};
        end
      reg66 <= (-(~|$unsigned($signed({reg63, reg52}))));
    end
  always
    @(posedge clk) begin
      reg67 <= (-($unsigned($signed($unsigned(reg58))) ?
          $signed((~(reg65 ?
              reg50 : reg57))) : $signed($unsigned((reg53 + reg64)))));
      if (reg51)
        begin
          if ($unsigned((|$unsigned($signed((8'hb3))))))
            begin
              reg68 <= reg50[(3'h7):(1'h1)];
              reg69 <= wire56[(1'h0):(1'h0)];
              reg70 <= (!{$unsigned(($unsigned(reg64) < reg54))});
              reg71 <= reg67;
              reg72 <= ($signed(($unsigned(reg49) - wire46[(4'ha):(4'h9)])) ~^ reg52);
            end
          else
            begin
              reg68 <= (~|reg67[(5'h13):(2'h2)]);
              reg69 <= (+reg57);
              reg70 <= ($unsigned({$unsigned(((8'haa) <<< reg48))}) ?
                  (wire47[(2'h2):(1'h1)] ?
                      {($signed(reg59) ?
                              {(8'h9f),
                                  (8'haf)} : wire45)} : $unsigned(reg60[(2'h3):(2'h3)])) : reg72);
            end
          reg73 <= reg53[(1'h1):(1'h0)];
        end
      else
        begin
          reg68 <= ($unsigned({((reg63 << wire56) ? (~^reg63) : reg51),
              $signed((reg62 ^~ wire45))}) * (reg70[(3'h4):(2'h2)] ?
              (($unsigned(reg68) - (reg70 > reg73)) < $signed((wire47 ^ (8'hb3)))) : {($unsigned((8'ha0)) * $unsigned(wire45)),
                  reg65[(3'h6):(3'h4)]}));
          reg69 <= ($unsigned({($signed(reg55) ?
                  (reg73 * reg54) : (reg72 ? reg62 : wire45)),
              (reg52 - reg68[(2'h2):(1'h1)])}) * (((~^reg57[(1'h0):(1'h0)]) && $signed(((8'ha5) == reg64))) ?
              reg50[(4'h8):(3'h7)] : (+(~^(wire46 || (8'hb4))))));
          reg70 <= $unsigned(reg70);
        end
    end
  assign wire74 = $unsigned((-(((wire56 <<< reg72) - ((8'hbf) ?
                      wire46 : reg69)) >> (~^reg53[(4'hd):(4'hd)]))));
  assign wire75 = (8'ha8);
  assign wire76 = $unsigned(({{(reg69 || reg70)}} ?
                      ($unsigned($signed(reg53)) ?
                          $signed($unsigned(wire75)) : {(^~wire56),
                              wire74[(1'h0):(1'h0)]}) : {wire75[(2'h3):(2'h2)],
                          (reg72 ? (8'hbc) : reg63[(3'h7):(2'h3)])}));
  assign wire77 = $signed(($signed(reg58[(1'h1):(1'h1)]) && $unsigned(((&wire43) ?
                      $unsigned(wire74) : reg51[(4'he):(4'ha)]))));
  assign wire78 = $signed((&(^~wire74[(2'h3):(1'h1)])));
  assign wire79 = $signed(reg68[(3'h4):(1'h0)]);
  assign wire80 = $signed(wire78);
  always
    @(posedge clk) begin
      if ({((reg64[(5'h13):(3'h4)] + reg67[(5'h13):(5'h13)]) << reg50),
          reg68[(2'h3):(1'h1)]})
        begin
          reg81 <= wire45[(1'h1):(1'h1)];
        end
      else
        begin
          reg81 <= reg62[(4'h9):(3'h5)];
          reg82 <= $unsigned({$signed(reg66),
              $signed((!(reg50 ? reg54 : reg71)))});
        end
      reg83 <= {(^((((8'hbe) + reg68) - reg81[(3'h4):(1'h1)]) ?
              $unsigned(((8'hba) ^~ (8'h9c))) : ($signed(wire76) ?
                  $unsigned(reg60) : wire78))),
          (&$signed($unsigned($unsigned((8'hbc)))))};
      reg84 <= $unsigned(((($unsigned(reg83) || $signed((8'ha7))) - $signed(((8'hb6) <= wire47))) || (~|$unsigned((reg52 > reg71)))));
    end
  assign wire85 = $signed(reg48);
  assign wire86 = (wire45 ?
                      ((^((+reg73) >> $signed(reg53))) ^ (reg57 ?
                          (7'h44) : $unsigned((reg83 >= (8'had))))) : {wire74});
  always
    @(posedge clk) begin
      reg87 <= wire56[(1'h1):(1'h1)];
    end
  assign wire88 = reg83[(4'ha):(3'h7)];
  assign wire89 = (!$signed((~^reg51[(3'h5):(2'h3)])));
endmodule

module module154  (y, clk, wire159, wire158, wire157, wire156, wire155);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire159;
  input wire signed [(4'hf):(1'h0)] wire158;
  input wire signed [(4'h8):(1'h0)] wire157;
  input wire [(4'ha):(1'h0)] wire156;
  input wire [(5'h12):(1'h0)] wire155;
  wire [(4'hf):(1'h0)] wire191;
  wire signed [(4'he):(1'h0)] wire183;
  wire signed [(5'h14):(1'h0)] wire182;
  wire [(5'h10):(1'h0)] wire181;
  wire [(5'h12):(1'h0)] wire180;
  wire signed [(3'h4):(1'h0)] wire179;
  wire signed [(5'h11):(1'h0)] wire178;
  wire signed [(4'ha):(1'h0)] wire177;
  wire signed [(2'h3):(1'h0)] wire176;
  wire signed [(3'h5):(1'h0)] wire175;
  wire signed [(4'hb):(1'h0)] wire174;
  wire signed [(5'h14):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire161;
  wire signed [(4'he):(1'h0)] wire160;
  reg signed [(4'hf):(1'h0)] reg190 = (1'h0);
  reg [(4'he):(1'h0)] reg189 = (1'h0);
  reg [(2'h2):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg187 = (1'h0);
  reg [(5'h11):(1'h0)] reg186 = (1'h0);
  reg [(5'h14):(1'h0)] reg185 = (1'h0);
  reg [(5'h10):(1'h0)] reg184 = (1'h0);
  reg [(4'hb):(1'h0)] reg172 = (1'h0);
  reg [(4'hd):(1'h0)] reg171 = (1'h0);
  reg [(4'h8):(1'h0)] reg170 = (1'h0);
  reg [(4'ha):(1'h0)] reg169 = (1'h0);
  reg [(4'h9):(1'h0)] reg168 = (1'h0);
  reg [(5'h12):(1'h0)] reg167 = (1'h0);
  reg [(5'h10):(1'h0)] reg166 = (1'h0);
  reg [(3'h5):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg162 = (1'h0);
  assign y = {wire191,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire161,
                 wire160,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
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
                 (1'h0)};
  assign wire160 = (wire157 ^~ $unsigned(wire156));
  assign wire161 = ($signed(wire158) ?
                       (^$unsigned(wire156[(3'h4):(2'h3)])) : (((~&{wire159}) ~^ wire156[(2'h2):(1'h0)]) > wire158[(4'he):(3'h4)]));
  always
    @(posedge clk) begin
      reg162 <= $signed(wire160[(1'h0):(1'h0)]);
      if ((&wire159))
        begin
          reg163 <= (!{wire157[(2'h2):(1'h0)], $signed((^{(7'h43), wire161}))});
          reg164 <= ({(($signed(wire156) * {wire160}) & wire161),
                  {$signed(wire157[(3'h5):(2'h3)]),
                      $unsigned(wire157[(3'h6):(3'h4)])}} ?
              ((wire156[(1'h1):(1'h0)] >> ((^wire159) ^ (reg163 && reg162))) ?
                  (wire159 ?
                      ($signed((8'hbf)) + (~^reg162)) : wire156[(3'h6):(3'h5)]) : $signed(wire161)) : (wire158 <= $signed($unsigned($unsigned(reg162)))));
          reg165 <= {(wire156 ?
                  ((((7'h40) ? wire160 : reg164) ?
                          $unsigned((8'hb8)) : (wire157 ? reg164 : wire159)) ?
                      ($signed(reg163) ?
                          (wire157 ^ wire160) : wire160[(1'h0):(1'h0)]) : wire156) : $signed(wire158[(4'h9):(1'h0)]))};
          if ((8'ha7))
            begin
              reg166 <= $signed({$unsigned($signed($signed((8'ha6)))),
                  $signed(wire157[(3'h4):(2'h3)])});
              reg167 <= ((reg162 | reg164[(2'h2):(2'h2)]) + $unsigned(($unsigned({wire156,
                  reg164}) << $unsigned((reg162 * wire156)))));
            end
          else
            begin
              reg166 <= (|wire157[(2'h3):(2'h2)]);
            end
        end
      else
        begin
          reg163 <= (^~(+$signed((wire157[(1'h0):(1'h0)] && (wire156 << reg164)))));
        end
      reg168 <= wire160[(1'h1):(1'h0)];
      reg169 <= $unsigned($signed(wire158[(3'h5):(1'h1)]));
      if (wire160[(1'h0):(1'h0)])
        begin
          reg170 <= $signed($signed($unsigned(reg162[(2'h2):(1'h1)])));
          reg171 <= reg164;
          reg172 <= $signed(($unsigned($unsigned(wire161[(2'h2):(1'h0)])) && $signed(wire161[(4'h8):(1'h1)])));
        end
      else
        begin
          reg170 <= $unsigned((^{$unsigned((8'h9f)), reg164}));
        end
    end
  assign wire173 = {wire158,
                       (reg172 ?
                           $unsigned({(&reg163)}) : $unsigned({{reg165,
                                   wire157},
                               (reg163 >> reg171)}))};
  assign wire174 = reg162;
  assign wire175 = $signed($unsigned($signed($unsigned(((8'hbe) ?
                       (7'h43) : wire173)))));
  assign wire176 = wire155[(2'h3):(1'h1)];
  assign wire177 = ($unsigned(({(reg169 >> wire160)} ^ reg163[(3'h6):(2'h2)])) ?
                       $signed((8'hb5)) : $signed($signed(((~|wire175) > (^reg165)))));
  assign wire178 = (~^$unsigned(({{reg165}, $unsigned(reg172)} ?
                       $signed({reg168}) : $unsigned((reg163 < reg165)))));
  assign wire179 = (8'hae);
  assign wire180 = wire161;
  assign wire181 = reg164;
  assign wire182 = {(~reg165)};
  assign wire183 = (reg165[(1'h0):(1'h0)] - ((reg162[(2'h2):(1'h1)] ?
                       ({wire178} ~^ $unsigned(reg165)) : (reg164[(1'h1):(1'h1)] >> $signed(reg170))) != (wire180[(4'he):(4'he)] ?
                       {(reg168 == wire180)} : $unsigned(wire180[(4'h8):(2'h3)]))));
  always
    @(posedge clk) begin
      reg184 <= ((+(((reg170 ? wire176 : wire181) ?
                  wire156[(3'h6):(3'h4)] : (wire182 ? (7'h44) : wire179)) ?
              $signed((reg169 & wire157)) : (((8'ha6) ?
                  wire173 : (8'hbd)) >> wire177[(4'ha):(3'h4)]))) ?
          reg171 : ($signed(((wire157 == wire178) <<< (reg162 ?
                  reg163 : (8'hb5)))) ?
              $signed((^~wire179)) : wire181));
      reg185 <= (~&reg163);
      reg186 <= $unsigned((~&$unsigned(($unsigned((8'hac)) ?
          $unsigned(reg166) : wire176[(2'h3):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      reg187 <= ($unsigned($signed($signed((~&(8'hb0))))) | (+wire173));
      if ($unsigned($unsigned($unsigned(wire180[(4'ha):(4'h9)]))))
        begin
          reg188 <= $signed((wire178[(4'h8):(3'h6)] & {wire176[(2'h3):(1'h0)]}));
          reg189 <= ({({(wire158 ? (8'hb7) : reg187), reg164[(1'h0):(1'h0)]} ?
                      ((~&(7'h44)) << (reg188 | wire182)) : ((wire182 ?
                              wire175 : (8'ha0)) ?
                          (^reg188) : (8'hb0)))} ?
              reg187 : ((~|(|(+reg187))) > reg167));
        end
      else
        begin
          reg188 <= {$unsigned((+$unsigned((wire161 ? reg164 : wire156))))};
        end
      reg190 <= $unsigned((^($unsigned((-wire183)) >= {$signed(wire155)})));
    end
  assign wire191 = (8'hbb);
endmodule
