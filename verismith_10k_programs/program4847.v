module top
#(parameter param257 = (~^(^~((8'hbb) ? (+(!(8'ha2))) : (((7'h42) <<< (8'ha6)) ? ((8'h9e) >= (8'hae)) : ((8'hba) ? (8'ha4) : (8'hb2)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire252;
  wire signed [(5'h14):(1'h0)] wire251;
  wire signed [(4'hb):(1'h0)] wire250;
  wire [(3'h7):(1'h0)] wire249;
  wire signed [(4'h8):(1'h0)] wire248;
  wire [(4'h9):(1'h0)] wire245;
  wire signed [(4'hf):(1'h0)] wire244;
  wire [(4'h9):(1'h0)] wire233;
  wire signed [(5'h15):(1'h0)] wire232;
  wire [(4'hd):(1'h0)] wire231;
  wire signed [(4'hb):(1'h0)] wire230;
  wire signed [(2'h3):(1'h0)] wire229;
  wire signed [(5'h12):(1'h0)] wire228;
  wire [(2'h2):(1'h0)] wire227;
  wire signed [(2'h2):(1'h0)] wire225;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg256 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg255 = (1'h0);
  reg [(4'hc):(1'h0)] reg254 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg247 = (1'h0);
  reg [(5'h12):(1'h0)] reg246 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg243 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg242 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg241 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg240 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg239 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg238 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg237 = (1'h0);
  reg [(5'h15):(1'h0)] reg236 = (1'h0);
  reg [(5'h15):(1'h0)] reg235 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg234 = (1'h0);
  assign y = {wire252,
                 wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire245,
                 wire244,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire225,
                 wire6,
                 wire5,
                 wire4,
                 reg256,
                 reg255,
                 reg254,
                 reg247,
                 reg246,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = (wire2 <<< {((^~wire2) < $signed(wire3)),
                     (($signed(wire0) && wire4) >> (wire0[(1'h1):(1'h1)] | (|wire2)))});
  assign wire6 = (|wire5[(3'h4):(2'h2)]);
  module7 #() modinst226 (wire225, clk, wire3, wire4, wire1, wire2);
  assign wire227 = ($signed(({(wire6 ? (8'hbb) : wire4), $signed(wire3)} ?
                       $unsigned(wire1) : ((^~wire0) | (wire5 <<< wire1)))) >>> ((&(&wire6[(1'h0):(1'h0)])) ?
                       wire4 : wire3));
  assign wire228 = (8'ha7);
  assign wire229 = (wire5[(2'h3):(2'h2)] ?
                       (8'hbc) : {{$unsigned(wire6[(5'h12):(4'hc)])},
                           wire3[(3'h5):(3'h5)]});
  assign wire230 = wire4[(2'h3):(2'h3)];
  assign wire231 = wire225[(1'h1):(1'h0)];
  assign wire232 = ((~^wire231[(3'h4):(1'h0)]) ?
                       $unsigned(((~&$signed(wire231)) * ($signed(wire231) ?
                           (~^wire2) : wire230))) : $signed({wire225[(1'h0):(1'h0)],
                           ((&wire3) ?
                               wire3[(3'h6):(3'h4)] : ((7'h41) ?
                                   wire3 : (8'ha6)))}));
  assign wire233 = wire5;
  always
    @(posedge clk) begin
      reg234 <= (!{({(wire232 << wire4), wire233[(2'h2):(1'h1)]} ?
              wire229[(2'h2):(1'h1)] : ((~^(8'ha0)) > wire0)),
          $signed({(8'hb2), (8'hae)})});
      if ($unsigned(((|(~^$signed(wire232))) == (wire230[(4'ha):(2'h3)] ?
          $unsigned((~|wire232)) : (-$unsigned(wire227))))))
        begin
          if (((!(~&wire3[(1'h1):(1'h0)])) ?
              (~^{(~|wire4[(4'hc):(3'h6)]),
                  (+$signed(wire231))}) : $signed(((~&{(7'h43), wire232}) ?
                  (wire2[(4'hb):(4'h9)] * (wire229 ?
                      wire228 : reg234)) : $unsigned(wire233[(4'h8):(3'h7)])))))
            begin
              reg235 <= ($unsigned(wire233) | ((wire228 ?
                  $unsigned((reg234 ?
                      wire229 : wire229)) : wire4) || (~|{(wire230 <<< wire0),
                  {(7'h42), reg234}})));
              reg236 <= (!((((8'hac) <<< wire0) ?
                  reg235 : (~|(+(8'hb2)))) == ($signed((wire233 ?
                      reg234 : wire233)) ?
                  wire0[(1'h1):(1'h0)] : $signed($signed(wire0)))));
              reg237 <= wire3[(4'hb):(1'h1)];
            end
          else
            begin
              reg235 <= (^~($unsigned($unsigned((~^wire225))) ?
                  reg234 : wire230));
            end
          reg238 <= $signed((-wire230));
          reg239 <= (reg234 ? wire2 : (wire233 == wire4[(5'h11):(1'h0)]));
        end
      else
        begin
          reg235 <= (((wire232 ?
                      (~^$unsigned(wire229)) : $unsigned($unsigned(wire3))) ?
                  wire231[(3'h7):(3'h4)] : reg234) ?
              wire1[(4'h8):(3'h6)] : {$signed(wire6)});
          if (wire232)
            begin
              reg236 <= $signed(($signed((8'ha4)) ?
                  (~$unsigned((wire231 ?
                      reg234 : wire231))) : $unsigned($unsigned($signed(wire227)))));
            end
          else
            begin
              reg236 <= wire230;
            end
          if (wire228)
            begin
              reg237 <= {reg235[(3'h4):(2'h2)], reg236[(4'hc):(3'h6)]};
              reg238 <= wire1;
              reg239 <= wire227;
              reg240 <= wire233[(2'h2):(1'h0)];
            end
          else
            begin
              reg237 <= reg234;
              reg238 <= ((reg238 ?
                  (((wire1 ? wire228 : (7'h42)) ?
                      reg240 : (+wire4)) == $unsigned((wire227 < wire6))) : (!(8'ha8))) >= (~&$unsigned($signed((reg235 << (8'hb7))))));
              reg239 <= ((((^wire2[(3'h6):(2'h3)]) ? reg236 : wire0) ?
                      (~wire3) : wire228[(4'hb):(4'hb)]) ?
                  reg240 : wire230);
              reg240 <= reg240;
              reg241 <= wire229[(1'h1):(1'h1)];
            end
        end
      reg242 <= $unsigned(((reg240 ?
          wire225[(2'h2):(2'h2)] : (+reg241[(4'h9):(1'h1)])) == reg234[(2'h3):(1'h0)]));
      reg243 <= wire229;
    end
  assign wire244 = (~|((wire229 && $unsigned((wire232 | wire3))) && {reg236}));
  assign wire245 = {$unsigned(wire228)};
  always
    @(posedge clk) begin
      reg246 <= $unsigned($signed(({reg238, {reg236, (8'hb2)}} ?
          (~|wire229[(1'h1):(1'h1)]) : {(wire1 ? wire4 : reg237), reg240})));
      reg247 <= (reg242[(2'h3):(2'h2)] ? wire1[(3'h6):(2'h2)] : {(8'ha1)});
    end
  assign wire248 = wire244;
  assign wire249 = wire245;
  assign wire250 = ((wire227[(1'h0):(1'h0)] ?
                           (($unsigned(wire227) ?
                                   {wire229, wire225} : $unsigned(wire225)) ?
                               reg243[(4'hc):(4'h8)] : $signed((wire232 * reg247))) : wire230) ?
                       reg236[(1'h0):(1'h0)] : reg246);
  assign wire251 = (-{$unsigned(wire0[(3'h5):(2'h3)]), reg234});
  module7 #() modinst253 (.wire9(wire245), .wire10(reg235), .wire8(reg239), .wire11(wire251), .clk(clk), .y(wire252));
  always
    @(posedge clk) begin
      reg254 <= (wire233[(3'h5):(1'h1)] != (((8'h9c) ?
          (^(8'h9e)) : $unsigned((~|wire228))) << reg242[(5'h14):(5'h13)]));
      reg255 <= (^(~|reg243[(1'h1):(1'h1)]));
      reg256 <= {(wire252 ?
              {(|$unsigned((8'ha6))),
                  ((+reg243) ^~ wire227[(1'h0):(1'h0)])} : (wire3 ~^ (-$unsigned(wire227))))};
    end
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire224;
  wire [(2'h2):(1'h0)] wire223;
  wire [(5'h14):(1'h0)] wire222;
  wire [(3'h6):(1'h0)] wire221;
  wire [(3'h5):(1'h0)] wire219;
  wire [(4'he):(1'h0)] wire136;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire138;
  wire signed [(5'h15):(1'h0)] wire139;
  wire signed [(5'h11):(1'h0)] wire140;
  wire signed [(3'h5):(1'h0)] wire193;
  reg [(5'h11):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg152 = (1'h0);
  reg [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg146 = (1'h0);
  reg [(4'hc):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  assign y = {wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire219,
                 wire136,
                 wire85,
                 wire84,
                 wire82,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire138,
                 wire139,
                 wire140,
                 wire193,
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
                 reg12,
                 reg13,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= (((wire9[(2'h2):(2'h2)] <= $signed($signed(wire8))) ?
              (|($signed((8'h9f)) <= (~&wire8))) : $unsigned($signed((wire8 < wire11)))) ?
          (wire10 ?
              (-($signed((8'ha7)) >= $signed((8'ha6)))) : ((|(~^wire11)) > $unsigned((wire9 > (8'ha2))))) : $signed(({wire9[(4'h8):(4'h8)]} | $unsigned($signed(wire11)))));
      reg13 <= reg12;
    end
  assign wire14 = reg13[(1'h0):(1'h0)];
  assign wire15 = (({(~&(~|wire11))} ?
                      {(|$unsigned(reg12)),
                          $signed((-reg12))} : ($unsigned(reg13) ?
                          $signed($signed(reg12)) : ($unsigned(reg13) ?
                              (wire14 ? (8'hbc) : wire14) : {reg12,
                                  wire10}))) << wire10[(3'h4):(1'h0)]);
  assign wire16 = $signed(wire8[(2'h3):(1'h1)]);
  assign wire17 = ((wire16 + $signed($unsigned($signed(wire15)))) ?
                      wire8[(4'h8):(1'h1)] : $unsigned((wire8 - $unsigned(reg12))));
  assign wire18 = ($signed(wire16[(1'h0):(1'h0)]) ?
                      (~$unsigned(wire17[(3'h4):(2'h3)])) : (~^(wire10[(4'h8):(3'h6)] ?
                          $signed($unsigned(wire8)) : $signed(wire15[(1'h1):(1'h0)]))));
  assign wire19 = wire9[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((8'hbf))
        begin
          reg20 <= {(wire18 ^ (^~$signed((wire19 && wire16))))};
        end
      else
        begin
          reg20 <= wire14;
          reg21 <= wire19[(2'h2):(2'h2)];
          if ($unsigned((reg20[(2'h3):(1'h1)] >>> (+(8'hac)))))
            begin
              reg22 <= $signed((+$unsigned($signed((wire19 ?
                  (8'ha5) : (8'ha7))))));
              reg23 <= $unsigned((wire14 == {((!wire19) ?
                      (!reg20) : $signed(reg21))}));
            end
          else
            begin
              reg22 <= {reg22, wire18};
              reg23 <= $unsigned(((-wire9) + wire14[(4'hc):(1'h1)]));
            end
          if ((^~(reg13[(3'h5):(2'h3)] ?
              $signed(wire11[(3'h6):(3'h6)]) : ((~&reg22) & $signed((reg13 ?
                  reg12 : reg23))))))
            begin
              reg24 <= wire14;
            end
          else
            begin
              reg24 <= (8'ha8);
              reg25 <= ({$unsigned(wire18)} <= ((^~$unsigned($unsigned(wire14))) ?
                  {$unsigned((wire11 ? wire11 : reg23)),
                      reg22[(2'h3):(2'h2)]} : wire11[(3'h6):(2'h2)]));
            end
        end
      reg26 <= reg12;
    end
  module27 #() modinst83 (.clk(clk), .y(wire82), .wire28(reg21), .wire31(wire10), .wire29(wire17), .wire30(reg12));
  assign wire84 = $unsigned(($signed((|$unsigned(wire11))) <<< (-{(wire19 ?
                          wire17 : wire19),
                      $signed((8'h9c))})));
  assign wire85 = $signed($signed(wire19));
  module86 #() modinst137 (wire136, clk, reg22, wire18, wire8, wire11);
  assign wire138 = (($unsigned((8'ha9)) ?
                       (((wire136 >= (8'hba)) ?
                           $unsigned(reg13) : $signed(wire11)) || ((wire17 == (8'hb7)) ?
                           (wire85 + wire11) : (wire17 || (8'hb0)))) : {(+(8'hba)),
                           wire85}) << ((|(reg22[(4'hd):(3'h7)] ?
                       ((8'h9c) ?
                           (8'ha3) : wire19) : $unsigned(reg12))) * ((wire10 ?
                           reg22 : (reg24 != reg23)) ?
                       ((8'hbd) ?
                           (wire17 ^~ (7'h43)) : $unsigned((8'haa))) : ($signed(wire10) ?
                           $unsigned((8'hb0)) : wire84))));
  assign wire139 = (~|reg24);
  assign wire140 = reg25[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg141 <= (($signed($unsigned((wire15 ?
          wire19 : wire139))) <<< $unsigned($signed(wire17[(4'hf):(3'h4)]))) <= reg12);
      reg142 <= (~&((wire18 ? (~$unsigned(wire18)) : wire19) ?
          reg141 : $unsigned((reg22[(3'h5):(2'h2)] || $signed((8'ha4))))));
      reg143 <= ({(((reg22 ^ reg25) | $signed((8'hb9))) == (reg13 <<< wire140))} - wire19);
    end
  always
    @(posedge clk) begin
      if (wire139)
        begin
          if ({$signed(reg142[(3'h4):(3'h4)])})
            begin
              reg144 <= (~((wire18[(4'hc):(4'hc)] != wire85) >= $unsigned(({wire138,
                  reg20} ~^ (reg26 ? reg23 : reg26)))));
              reg145 <= wire14[(1'h1):(1'h1)];
              reg146 <= {$unsigned($signed(($signed(wire16) ~^ wire10)))};
              reg147 <= $unsigned($signed(($unsigned(reg21[(1'h1):(1'h1)]) ?
                  ((~&reg23) ?
                      $unsigned(wire85) : (^~wire138)) : $unsigned((reg23 * reg143)))));
            end
          else
            begin
              reg144 <= $unsigned(reg20);
              reg145 <= $signed($unsigned(wire18[(2'h3):(1'h1)]));
            end
          if ({wire139, reg147[(4'h8):(2'h3)]})
            begin
              reg148 <= wire84[(4'h8):(1'h1)];
              reg149 <= (~&reg12[(3'h5):(3'h4)]);
            end
          else
            begin
              reg148 <= ({($unsigned(reg147[(4'h8):(3'h6)]) >>> $unsigned({reg22,
                          wire138})),
                      $signed({reg12, (+(7'h43))})} ?
                  {$signed($signed({wire9}))} : wire82);
            end
          reg150 <= ((wire139 || wire14[(3'h4):(2'h3)]) >>> $signed((!(!(reg12 ?
              reg144 : reg144)))));
          reg151 <= {$signed((|$signed((wire18 ? wire15 : wire11))))};
        end
      else
        begin
          reg144 <= (&reg150);
          reg145 <= (((^~reg144) ?
              ((^~reg13[(5'h10):(4'hf)]) ?
                  ({(8'hb4)} >= reg21[(2'h2):(2'h2)]) : wire9[(3'h5):(3'h4)]) : $unsigned((wire82 <= (~^wire19)))) | {({$unsigned(reg26),
                      (8'hb1)} ?
                  {wire140[(4'hf):(3'h5)]} : reg151),
              (+(&$signed((8'hb6))))});
          reg146 <= ((+reg22) ?
              ($signed(reg146) != ($unsigned(((8'h9c) < wire16)) ?
                  $unsigned((wire15 == reg147)) : wire140)) : ((^wire9[(2'h2):(2'h2)]) ?
                  (~&reg141[(4'hb):(1'h1)]) : {reg20}));
        end
      reg152 <= (wire85 ?
          reg149[(3'h4):(3'h4)] : $signed($unsigned(wire82[(3'h6):(3'h4)])));
      reg153 <= reg152[(2'h2):(1'h1)];
    end
  module154 #() modinst194 (wire193, clk, wire10, reg151, reg152, reg144);
  module195 #() modinst220 (wire219, clk, wire139, reg13, wire193, wire82, wire84);
  assign wire221 = reg26[(4'hc):(1'h1)];
  assign wire222 = $unsigned((+((((7'h40) ? (8'hbf) : wire85) ?
                       (reg144 ?
                           reg12 : wire16) : (reg153 * reg12)) <<< $signed($unsigned(reg146)))));
  assign wire223 = reg12;
  assign wire224 = (reg21 ?
                       $unsigned(reg21[(1'h0):(1'h0)]) : $unsigned(((&(~wire139)) >>> reg152)));
endmodule

module module195
#(parameter param218 = {(^(-((!(8'h9e)) ? (~|(8'hbf)) : ((8'ha3) ? (8'hae) : (8'ha3))))), {({{(8'hb6)}, ((8'hb4) ? (8'hb3) : (8'haf))} ^~ (((8'hb1) < (8'hac)) ? ((8'ha9) ? (8'h9f) : (8'h9f)) : ((7'h44) ? (8'ha5) : (7'h44)))), ((((8'h9f) ? (8'hb7) : (8'hbb)) | (^(8'haf))) ? ((~(8'hab)) << {(8'h9e), (8'h9d)}) : ((~^(7'h42)) && {(8'h9f), (7'h44)}))}})
(y, clk, wire200, wire199, wire198, wire197, wire196);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire200;
  input wire [(5'h11):(1'h0)] wire199;
  input wire [(3'h4):(1'h0)] wire198;
  input wire signed [(4'h8):(1'h0)] wire197;
  input wire signed [(3'h7):(1'h0)] wire196;
  wire signed [(3'h7):(1'h0)] wire217;
  wire [(3'h6):(1'h0)] wire216;
  wire [(5'h13):(1'h0)] wire215;
  wire signed [(5'h12):(1'h0)] wire214;
  wire signed [(4'ha):(1'h0)] wire213;
  wire [(5'h13):(1'h0)] wire212;
  wire signed [(2'h2):(1'h0)] wire207;
  wire signed [(3'h6):(1'h0)] wire206;
  wire [(3'h4):(1'h0)] wire205;
  wire signed [(5'h11):(1'h0)] wire204;
  wire signed [(4'hd):(1'h0)] wire203;
  wire [(3'h5):(1'h0)] wire202;
  wire signed [(3'h7):(1'h0)] wire201;
  reg signed [(5'h10):(1'h0)] reg211 = (1'h0);
  reg [(5'h11):(1'h0)] reg210 = (1'h0);
  reg signed [(4'he):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg208 = (1'h0);
  assign y = {wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 (1'h0)};
  assign wire201 = $unsigned(wire200[(4'h9):(2'h3)]);
  assign wire202 = (wire196[(3'h7):(3'h7)] * $unsigned($signed(wire201[(2'h3):(1'h1)])));
  assign wire203 = $signed($unsigned(wire200[(5'h11):(3'h6)]));
  assign wire204 = wire196;
  assign wire205 = ($signed($signed(wire197)) ?
                       $unsigned((wire196 ?
                           (!{wire202, wire204}) : {{wire196, wire196},
                               wire200})) : $signed({({wire196} ?
                               wire199 : (wire198 == wire197)),
                           wire198[(3'h4):(3'h4)]}));
  assign wire206 = wire197[(3'h4):(3'h4)];
  assign wire207 = wire200;
  always
    @(posedge clk) begin
      reg208 <= wire197;
      reg209 <= ($signed({$unsigned(((8'hbf) * wire206)),
              ($signed(wire203) == (~^wire200))}) ?
          $unsigned((-(!wire200))) : $unsigned(((!(~reg208)) * (^~$unsigned(wire206)))));
      reg210 <= (-wire197);
      reg211 <= (~^(8'ha2));
    end
  assign wire212 = (|(({(wire203 == wire197), (wire201 ? reg209 : reg208)} ?
                           reg209 : (~^$unsigned(reg211))) ?
                       (wire201[(3'h6):(3'h4)] ?
                           (-$unsigned(wire205)) : wire205[(2'h2):(2'h2)]) : (wire205 ?
                           ((+wire203) < (wire200 ?
                               wire200 : reg209)) : {{reg209, wire204}})));
  assign wire213 = wire196[(2'h2):(1'h0)];
  assign wire214 = wire204;
  assign wire215 = reg208;
  assign wire216 = ($unsigned(reg211) || $signed(wire199));
  assign wire217 = wire200;
endmodule

module module154  (y, clk, wire158, wire157, wire156, wire155);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire158;
  input wire signed [(2'h3):(1'h0)] wire157;
  input wire [(4'he):(1'h0)] wire156;
  input wire signed [(5'h15):(1'h0)] wire155;
  wire [(5'h14):(1'h0)] wire192;
  wire signed [(5'h11):(1'h0)] wire191;
  wire signed [(3'h7):(1'h0)] wire190;
  wire signed [(4'hc):(1'h0)] wire189;
  wire signed [(5'h12):(1'h0)] wire188;
  wire signed [(3'h6):(1'h0)] wire179;
  wire signed [(4'hc):(1'h0)] wire164;
  wire signed [(4'he):(1'h0)] wire163;
  wire signed [(2'h3):(1'h0)] wire162;
  wire signed [(4'hd):(1'h0)] wire161;
  wire [(5'h14):(1'h0)] wire160;
  reg [(2'h2):(1'h0)] reg187 = (1'h0);
  reg [(4'ha):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg185 = (1'h0);
  reg [(4'hc):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg181 = (1'h0);
  reg [(4'hc):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg178 = (1'h0);
  reg [(5'h10):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg176 = (1'h0);
  reg [(3'h5):(1'h0)] reg175 = (1'h0);
  reg [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg173 = (1'h0);
  reg [(3'h7):(1'h0)] reg172 = (1'h0);
  reg [(5'h15):(1'h0)] reg171 = (1'h0);
  reg [(5'h13):(1'h0)] reg170 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg168 = (1'h0);
  reg [(5'h12):(1'h0)] reg167 = (1'h0);
  reg [(2'h3):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg165 = (1'h0);
  reg [(3'h7):(1'h0)] reg159 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire179,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg178,
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
                 reg159,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg159 <= ($unsigned($signed({wire157, {(8'hb0), wire156}})) > wire157);
    end
  assign wire160 = ($unsigned((((wire156 || wire158) << $signed(wire158)) ?
                           $unsigned(wire156[(4'h9):(2'h3)]) : (reg159 ?
                               (~^reg159) : wire157[(1'h1):(1'h1)]))) ?
                       (~&($signed((reg159 ? wire156 : wire155)) ?
                           $signed((wire156 ? wire157 : wire158)) : {(wire157 ?
                                   wire158 : wire155)})) : (!{wire158[(4'hd):(4'hc)],
                           (&$unsigned(wire155))}));
  assign wire161 = $unsigned(((((wire160 <= wire156) ?
                           (~reg159) : ((8'haa) * reg159)) ?
                       wire157 : $signed((wire157 & (7'h40)))) || (&(-$signed(reg159)))));
  assign wire162 = wire157;
  assign wire163 = (!$signed((~&(+(wire155 ^~ wire160)))));
  assign wire164 = $unsigned($signed((wire157[(2'h2):(2'h2)] ?
                       $signed($unsigned(wire161)) : wire157)));
  always
    @(posedge clk) begin
      reg165 <= ((-(~reg159[(2'h3):(2'h2)])) ?
          wire162[(1'h1):(1'h0)] : (~|$signed($unsigned((&reg159)))));
      if (($signed(wire157) == (~|{wire162[(2'h3):(2'h2)],
          wire157[(2'h2):(2'h2)]})))
        begin
          reg166 <= wire161;
          reg167 <= $signed($signed(reg159[(2'h3):(2'h2)]));
          if ($signed(reg166))
            begin
              reg168 <= (wire160 ?
                  wire160 : ((+($signed((8'hbe)) ?
                          (-reg159) : $signed(reg167))) ?
                      wire157[(1'h0):(1'h0)] : wire161[(4'hb):(1'h0)]));
              reg169 <= {$signed({wire161[(3'h4):(2'h3)],
                      ((reg166 ? wire155 : wire163) ~^ $unsigned(reg167))}),
                  $signed($unsigned(({(8'hb2)} ?
                      $unsigned(wire156) : (reg159 ? wire155 : wire163))))};
              reg170 <= wire164;
            end
          else
            begin
              reg168 <= $unsigned($unsigned({reg170,
                  $signed((reg170 ~^ reg167))}));
              reg169 <= ($signed(((~|$unsigned((8'hb7))) ?
                  $unsigned({wire162}) : wire163[(3'h6):(2'h2)])) << $unsigned((reg167 | $signed({reg166}))));
              reg170 <= (reg166[(1'h0):(1'h0)] < ($unsigned(($signed(wire160) ?
                      $signed(reg165) : (8'hb4))) ?
                  $signed(reg170) : $signed($signed(reg168[(5'h13):(4'h9)]))));
            end
          if ((~^reg159))
            begin
              reg171 <= reg169[(1'h0):(1'h0)];
              reg172 <= $unsigned(((wire162[(1'h1):(1'h0)] != wire156[(4'hd):(3'h5)]) - ($signed(reg170) == $signed(reg168[(5'h10):(4'hb)]))));
            end
          else
            begin
              reg171 <= reg159;
              reg172 <= (reg172[(3'h6):(2'h3)] ?
                  (+wire155) : ($signed(($signed((8'hbd)) - $signed(wire164))) < $signed($signed($signed(reg166)))));
              reg173 <= ({($signed(reg167) >= (-(wire164 ? reg167 : reg165))),
                  (wire155 < wire157)} && {reg165[(2'h2):(1'h0)],
                  $signed(reg170)});
              reg174 <= wire162;
              reg175 <= ({$unsigned(($unsigned((8'hbf)) ?
                      $signed(wire158) : $unsigned(wire161))),
                  $unsigned((^reg165[(3'h4):(1'h0)]))} ^~ (^~$unsigned($signed({wire163}))));
            end
          if (($signed((~|{reg173[(3'h7):(3'h5)]})) || ({$unsigned((&wire156))} <= reg166[(1'h0):(1'h0)])))
            begin
              reg176 <= wire160;
              reg177 <= reg169[(2'h2):(1'h1)];
              reg178 <= ($unsigned({(^~(-reg173)),
                      ((reg169 < wire163) ?
                          $signed((7'h41)) : $signed(wire161))}) ?
                  {({wire161} ? wire156[(3'h4):(1'h0)] : $signed(reg167)),
                      wire156[(3'h4):(3'h4)]} : $signed((($unsigned(reg169) > (reg169 ?
                      reg176 : (8'hb0))) + reg170[(4'h8):(2'h2)])));
            end
          else
            begin
              reg176 <= ((wire157 ?
                      $signed(((reg169 ? reg177 : (8'ha5)) ?
                          $unsigned(wire164) : $signed(wire161))) : $signed((8'ha2))) ?
                  (reg177 ?
                      {$signed(reg168[(4'hd):(3'h5)])} : (reg170[(2'h2):(1'h1)] ?
                          (8'hac) : ((wire162 ~^ reg168) ?
                              (^reg172) : {wire155,
                                  wire161}))) : $unsigned($signed({$unsigned(reg159),
                      (8'ha7)})));
            end
        end
      else
        begin
          reg166 <= (8'hb5);
          if (((~|(!(~&reg176))) ?
              reg172 : {$signed(wire161[(2'h2):(2'h2)]),
                  ($unsigned((reg171 ? reg172 : reg176)) ^ wire164)}))
            begin
              reg167 <= (((8'haa) <<< {reg172[(3'h4):(3'h4)],
                      (-wire161[(2'h3):(2'h3)])}) ?
                  ((^$signed((wire160 <<< wire163))) ?
                      (+wire158[(3'h7):(3'h4)]) : (wire158 ?
                          (reg172 < wire155[(4'h8):(1'h0)]) : reg166)) : $signed($unsigned(reg175[(1'h1):(1'h0)])));
              reg168 <= {{($unsigned(reg166[(2'h2):(2'h2)]) ?
                          {(8'h9d)} : wire156)}};
            end
          else
            begin
              reg167 <= reg173[(3'h5):(1'h1)];
              reg168 <= reg175;
            end
          reg169 <= reg173;
        end
    end
  assign wire179 = $unsigned({($unsigned($unsigned(reg177)) > ($signed(wire163) ?
                           reg169 : (!wire158)))});
  always
    @(posedge clk) begin
      if ($signed($signed((8'haf))))
        begin
          reg180 <= $unsigned($unsigned(((~(reg177 > wire157)) ?
              (wire164 * (^reg169)) : (8'ha0))));
        end
      else
        begin
          reg180 <= reg180;
          reg181 <= $unsigned($unsigned($signed({{(8'ha4)}})));
          if ($signed($unsigned(reg173)))
            begin
              reg182 <= $unsigned((($signed(reg165) ^~ (-(wire163 - reg180))) ~^ {wire179[(3'h5):(3'h5)],
                  reg159[(3'h4):(3'h4)]}));
              reg183 <= wire162[(2'h3):(1'h1)];
            end
          else
            begin
              reg182 <= ($unsigned((8'hb8)) ^ reg182);
              reg183 <= wire155;
              reg184 <= ($unsigned((reg170[(2'h3):(1'h1)] || (|(reg178 * reg178)))) << {(reg176 ?
                      (wire162[(2'h3):(1'h0)] ^~ (&wire163)) : $unsigned({(8'hb6),
                          wire156})),
                  {(~&((8'ha4) & reg182))}});
              reg185 <= (|(^{$unsigned((wire161 ^ reg178)), reg173}));
            end
          reg186 <= ({(((~|reg176) ?
                      (reg165 ? (8'haf) : wire158) : (~&reg174)) && {(reg168 ?
                          wire179 : wire179),
                      (reg167 ? reg176 : (8'h9d))}),
                  reg166[(2'h2):(2'h2)]} ?
              (8'haf) : reg170[(2'h3):(2'h3)]);
        end
      reg187 <= (+{reg178});
    end
  assign wire188 = (($signed((8'ha3)) ?
                           wire160 : (~&$signed((reg177 * reg169)))) ?
                       $unsigned($signed(((wire161 >= reg185) ~^ (reg173 ^ wire161)))) : ((~(reg165[(3'h4):(1'h1)] ?
                               $signed(wire162) : (-reg175))) ?
                           {$unsigned($unsigned(reg169)),
                               wire156[(4'hc):(4'hb)]} : (+wire158)));
  assign wire189 = (reg186 + {($unsigned((reg166 ?
                           reg166 : (8'hba))) < ($signed(reg168) ?
                           (wire156 ? wire179 : reg166) : (reg178 | reg185))),
                       $unsigned(wire161)});
  assign wire190 = {(~(wire161 | wire155)),
                       $signed(($signed({wire155}) ?
                           $unsigned((&wire160)) : reg177))};
  assign wire191 = $signed(reg184[(4'hb):(4'ha)]);
  assign wire192 = (reg174[(1'h0):(1'h0)] ?
                       reg170[(1'h0):(1'h0)] : reg182[(1'h0):(1'h0)]);
endmodule

module module86  (y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire90;
  input wire signed [(4'ha):(1'h0)] wire89;
  input wire signed [(5'h15):(1'h0)] wire88;
  input wire signed [(5'h12):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire134;
  wire signed [(3'h5):(1'h0)] wire133;
  wire signed [(2'h3):(1'h0)] wire132;
  wire signed [(3'h7):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire130;
  wire [(2'h3):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire103;
  wire [(4'hb):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire100;
  wire [(3'h6):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire96;
  wire signed [(4'hc):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire93;
  wire [(5'h12):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  reg [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire105,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
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
                 reg104,
                 (1'h0)};
  assign wire91 = wire87[(4'hf):(4'he)];
  assign wire92 = (~(($unsigned((wire90 ? wire90 : wire87)) & (wire91 ?
                      $unsigned(wire87) : wire87[(4'hc):(1'h0)])) && {($signed((7'h40)) || (wire91 ^ wire87)),
                      (wire90[(4'hd):(2'h2)] >= (~wire91))}));
  assign wire93 = $unsigned({wire92, (~|wire88)});
  assign wire94 = wire90;
  assign wire95 = $unsigned(wire89);
  assign wire96 = wire89;
  assign wire97 = ((!((^~(8'h9e)) ?
                      (~$signed(wire89)) : wire91[(2'h2):(1'h0)])) ~^ wire92[(4'h8):(3'h4)]);
  assign wire98 = {wire87};
  assign wire99 = wire89[(3'h5):(3'h5)];
  assign wire100 = wire97[(2'h2):(1'h1)];
  assign wire101 = wire87;
  assign wire102 = $unsigned(wire97);
  assign wire103 = (-(-$signed(((wire100 >> (8'hbe)) ^ (wire102 > wire99)))));
  always
    @(posedge clk) begin
      reg104 <= wire94;
    end
  assign wire105 = (-{wire88, wire97});
  always
    @(posedge clk) begin
      if ({(~&({$signed((8'ha5))} ?
              $signed(wire91[(2'h2):(1'h1)]) : wire101[(3'h4):(1'h1)])),
          wire94})
        begin
          reg106 <= (wire97[(2'h3):(1'h0)] ^~ ($signed((^$signed(wire105))) ?
              wire105[(2'h2):(1'h1)] : $unsigned((~|((7'h42) ^~ wire90)))));
          reg107 <= (wire89 || (($signed((^~wire89)) != (^(wire93 ?
              wire98 : wire105))) >> wire99[(2'h2):(1'h0)]));
          reg108 <= (8'hbe);
          reg109 <= wire101;
        end
      else
        begin
          reg106 <= ({$unsigned({(wire88 <= wire103), (wire90 ^ wire90)}),
                  $signed(($unsigned(wire92) << (reg109 | wire102)))} ?
              (((~&$signed(wire101)) ?
                  $unsigned(wire91[(1'h0):(1'h0)]) : {$unsigned(wire97)}) | (^{(reg104 ?
                      wire103 : wire90)})) : ($unsigned(wire93) ^ wire98[(5'h14):(1'h1)]));
          if ($unsigned((+(wire103[(2'h2):(1'h1)] ?
              $unsigned($unsigned(wire101)) : reg104[(4'h9):(1'h1)]))))
            begin
              reg107 <= wire97;
              reg108 <= wire96[(5'h12):(4'hf)];
              reg109 <= wire88[(4'hf):(1'h0)];
              reg110 <= $signed(reg104);
            end
          else
            begin
              reg107 <= $unsigned(wire93[(3'h5):(1'h1)]);
              reg108 <= wire98[(1'h1):(1'h0)];
              reg109 <= $signed((-{(~^wire98[(1'h1):(1'h1)]),
                  {(&wire88), (wire98 != wire103)}}));
              reg110 <= {(8'ha3)};
            end
          if ((!wire87))
            begin
              reg111 <= $unsigned(wire101);
              reg112 <= reg106;
              reg113 <= ((8'ha3) ?
                  wire98 : ((|{{wire96, reg104},
                      $signed(wire90)}) ^~ reg112[(3'h7):(2'h3)]));
              reg114 <= $signed((8'ha3));
            end
          else
            begin
              reg111 <= (~|(wire95 ?
                  wire103[(1'h0):(1'h0)] : $unsigned($signed(wire102))));
            end
          if ($signed((wire89[(1'h1):(1'h0)] ?
              (wire93 ?
                  $unsigned(wire103[(1'h1):(1'h1)]) : wire102[(3'h4):(1'h0)]) : (($signed(wire94) & wire90[(4'hb):(3'h5)]) ?
                  (|(reg108 ? wire92 : wire90)) : reg110))))
            begin
              reg115 <= $signed(wire93);
              reg116 <= (+{$unsigned(reg106)});
              reg117 <= reg106;
              reg118 <= wire97;
            end
          else
            begin
              reg115 <= ($unsigned((^$signed($signed(wire103)))) & (8'hbb));
              reg116 <= (wire100[(2'h3):(1'h1)] ^ wire97[(2'h2):(1'h1)]);
              reg117 <= $signed({(((reg108 - (8'hac)) && $unsigned((8'haf))) << $unsigned((reg106 ?
                      wire93 : reg117)))});
            end
          reg119 <= ((wire103 ?
              wire96 : wire98[(5'h10):(4'hc)]) || ($unsigned(reg118) ?
              reg114 : $signed((~&wire92))));
        end
    end
  always
    @(posedge clk) begin
      reg120 <= wire97;
      if ($signed(reg106))
        begin
          reg121 <= ($signed($unsigned($signed((wire103 + wire95)))) ?
              reg112[(1'h0):(1'h0)] : $signed((-({wire87, reg113} < (8'hb8)))));
        end
      else
        begin
          reg121 <= reg110[(4'hb):(1'h1)];
          reg122 <= (-wire91[(2'h2):(2'h2)]);
          reg123 <= (reg121[(2'h2):(1'h0)] ?
              (|$unsigned((((8'hbf) <= reg119) >>> $unsigned(reg106)))) : $unsigned($unsigned($signed(wire88))));
          if ($unsigned($signed(wire103[(2'h2):(1'h0)])))
            begin
              reg124 <= $unsigned(reg115[(4'h9):(3'h6)]);
              reg125 <= {(&{{(wire101 ~^ reg122), (wire92 <<< reg107)}}),
                  ($unsigned($signed((reg118 ? (8'hb2) : (8'hbc)))) ?
                      (reg123 ?
                          ((wire96 | reg120) ?
                              $signed(reg107) : $unsigned(wire97)) : {(reg123 != reg110),
                              reg123[(2'h2):(1'h0)]}) : (+$unsigned(wire91)))};
              reg126 <= ({(^((wire94 ^ reg122) ~^ $unsigned(reg120)))} - ({((wire96 && reg117) ?
                          (reg116 ? wire88 : wire100) : reg124),
                      $signed($signed(reg110))} ?
                  $signed(((~|(8'hb8)) ?
                      (+reg110) : $unsigned(reg116))) : $signed($signed($unsigned((8'hab))))));
              reg127 <= $unsigned(($signed((8'hbc)) != reg104));
            end
          else
            begin
              reg124 <= $unsigned((reg111 ? $signed(wire97) : reg125));
            end
        end
      reg128 <= ({$signed((wire88[(4'h9):(3'h7)] ?
                  (wire97 && reg120) : wire94)),
              {((reg116 ~^ wire99) <= (~&(8'hb1))), $signed($signed(wire87))}} ?
          wire92[(4'hb):(3'h5)] : ({({reg116} <= (^reg126)),
                  ((+(8'ha9)) ^~ (reg109 ? (8'h9d) : wire89))} ?
              $unsigned(wire96) : (reg122 ?
                  {$unsigned(wire97)} : $signed((reg114 | reg112)))));
      reg129 <= (&(wire100 - ((wire94 ?
          reg127[(1'h1):(1'h0)] : $signed(reg121)) + ($unsigned(wire88) ?
          $signed(wire92) : reg106))));
    end
  assign wire130 = ({wire105,
                           ((~|(+reg114)) ?
                               ({reg123, reg127} ?
                                   (wire96 ?
                                       reg121 : wire101) : $unsigned(wire103)) : (8'h9f))} ?
                       ((($signed(reg124) ? reg116 : (wire92 * wire94)) ?
                               {(&reg109)} : {$unsigned(reg112)}) ?
                           ({reg118[(5'h11):(4'h9)],
                               $unsigned(reg110)} << wire96) : $unsigned($unsigned((|reg120)))) : $signed(reg112[(3'h7):(3'h4)]));
  assign wire131 = (8'ha7);
  assign wire132 = ((~^((((7'h40) != wire101) ? (!reg106) : $signed(reg113)) ?
                       {(reg111 ? reg118 : reg118),
                           (~|wire87)} : wire101[(3'h7):(3'h6)])) - ($signed(($signed(reg104) ?
                       $signed(reg124) : $signed(wire103))) != ($unsigned($signed(wire103)) || $signed((reg118 ?
                       reg114 : reg109)))));
  assign wire133 = wire100[(3'h5):(3'h4)];
  assign wire134 = ((reg116[(3'h5):(2'h3)] >= ($signed(wire91[(1'h0):(1'h0)]) ^~ wire97[(1'h1):(1'h0)])) ?
                       (^~$unsigned($unsigned({wire98, wire87}))) : ((((reg114 ?
                               wire93 : (8'hb6)) << $signed(wire94)) ?
                           wire92 : $signed($signed(wire101))) > $signed((8'ha7))));
  assign wire135 = ((|(($signed(wire134) ?
                               (wire98 ? (8'ha5) : reg128) : (reg124 ?
                                   reg117 : wire92)) ?
                           ($unsigned((8'hb7)) >>> $unsigned((8'hb8))) : reg124[(4'h8):(2'h3)])) ?
                       wire96 : ($signed(((wire131 ? (8'h9e) : (8'hb8)) ?
                           reg117 : (wire95 ?
                               (8'ha3) : reg126))) >= reg116[(2'h3):(1'h0)]));
endmodule

module module27
#(parameter param81 = (-(&(({(8'hae)} >> ((8'hb0) ? (8'ha3) : (8'h9d))) <= (~((7'h43) ? (8'hae) : (8'hac)))))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire31;
  input wire signed [(3'h6):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  input wire [(4'ha):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire34,
                 wire33,
                 wire32,
                 reg74,
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
                 reg56,
                 reg55,
                 reg54,
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
                 (1'h0)};
  assign wire32 = {((((wire30 ?
                              (8'h9d) : wire29) != wire30[(3'h5):(2'h3)]) > $signed(wire31[(4'he):(4'hb)])) ?
                          $unsigned(((-wire31) != (wire30 != wire29))) : ($unsigned({wire29}) && (wire28 <<< wire30)))};
  assign wire33 = (^~(8'ha7));
  assign wire34 = (($unsigned($unsigned((wire32 ? wire32 : wire33))) ?
                      wire28[(3'h6):(3'h5)] : (wire33[(1'h1):(1'h0)] ?
                          ((~wire33) ?
                              $unsigned((8'hab)) : ((8'hba) || wire31)) : ((8'had) ?
                              wire32[(3'h5):(1'h1)] : ((8'h9d) >>> wire32)))) && (($unsigned((wire28 ^ wire32)) ?
                      (~&((8'hbf) && wire33)) : wire33[(1'h0):(1'h0)]) + {$unsigned($unsigned(wire30))}));
  always
    @(posedge clk) begin
      reg35 <= $signed(((|wire32) >> $unsigned($signed($signed(wire33)))));
      reg36 <= ($signed((((8'hb8) ?
          $signed(wire30) : $unsigned(wire33)) > wire31)) <= wire29);
      reg37 <= wire31;
      if (wire28)
        begin
          if ((|$unsigned(wire30)))
            begin
              reg38 <= ({$unsigned($signed(reg35[(2'h2):(2'h2)])),
                      (((wire29 ^~ wire30) ?
                              $unsigned(wire29) : $signed(wire33)) ?
                          reg37 : (7'h41))} ?
                  (-($unsigned((wire34 ? reg36 : wire31)) >= $signed((wire30 ?
                      wire32 : wire32)))) : (~^{(^(reg35 ? wire34 : wire34))}));
              reg39 <= ((~reg37) ?
                  wire34 : ($unsigned($unsigned((!reg35))) <<< $signed($signed(wire28))));
            end
          else
            begin
              reg38 <= $unsigned({(8'hb0)});
              reg39 <= ({((|$signed(wire32)) ?
                          ((!reg38) ?
                              $unsigned(wire30) : (wire33 ?
                                  reg36 : wire34)) : $unsigned((&wire33))),
                      ($unsigned((wire29 ? wire33 : wire29)) ?
                          $signed($unsigned(reg36)) : ((&reg36) != (wire33 ?
                              reg36 : reg39)))} ?
                  $unsigned((((reg36 ? wire29 : wire33) * (wire31 ?
                      wire33 : (8'hab))) < reg37[(3'h7):(3'h4)])) : ($unsigned(reg39) << ($signed({wire28}) & ($unsigned(wire31) ?
                      (8'hbc) : $unsigned(wire30)))));
              reg40 <= (~^(&wire32[(2'h3):(2'h2)]));
              reg41 <= $signed(wire29);
            end
          reg42 <= (^$unsigned(wire28));
          reg43 <= (reg40[(3'h4):(2'h2)] ?
              reg35[(4'h8):(2'h2)] : $unsigned(((8'ha4) & wire33)));
          reg44 <= $unsigned(reg42);
          reg45 <= {$signed({($unsigned((8'ha7)) << (!reg37))}),
              ((reg38[(1'h1):(1'h1)] ~^ {$unsigned(wire28)}) == (^~$signed((&wire34))))};
        end
      else
        begin
          if (reg36[(2'h3):(1'h1)])
            begin
              reg38 <= ((^~reg41) ? (reg36 >>> wire34) : wire29[(2'h3):(2'h2)]);
              reg39 <= ($unsigned((8'hb2)) ?
                  (^((|$signed(wire33)) + ($unsigned(wire31) * $signed(wire31)))) : wire28[(2'h2):(1'h0)]);
            end
          else
            begin
              reg38 <= reg44;
              reg39 <= $unsigned(((8'hb5) * $signed(((8'hb3) ?
                  (~reg42) : (~^wire34)))));
              reg40 <= reg43[(3'h4):(1'h1)];
              reg41 <= $unsigned(((+wire33) ?
                  (|$unsigned($unsigned(reg38))) : reg45));
              reg42 <= $unsigned(reg41[(4'h8):(4'h8)]);
            end
          if ((-($signed(wire28) ?
              $unsigned($unsigned($signed(reg44))) : {$signed(reg41[(4'hd):(3'h5)]),
                  $unsigned(((8'hbd) * wire30))})))
            begin
              reg43 <= ($signed($unsigned($unsigned((+reg44)))) ?
                  wire28 : ({reg44[(1'h1):(1'h0)], reg36} ?
                      (!$signed($unsigned(wire30))) : wire31[(3'h7):(3'h4)]));
              reg44 <= $signed(($signed((wire33 ?
                  $signed(reg39) : $unsigned((8'haf)))) > ($unsigned(reg35[(3'h4):(3'h4)]) ?
                  ((reg43 ? (8'hbf) : wire28) ?
                      $signed((8'ha5)) : $signed(reg45)) : $signed($unsigned(wire34)))));
            end
          else
            begin
              reg43 <= ($signed($signed(($unsigned(reg37) ^ (&(8'ha6))))) ?
                  $signed(reg35) : (&reg44));
            end
          reg45 <= reg45[(4'hb):(4'h8)];
        end
    end
  assign wire46 = reg43[(3'h4):(2'h3)];
  assign wire47 = (|$signed($unsigned({$signed(reg44), $signed((8'ha6))})));
  assign wire48 = ($unsigned($signed($unsigned({reg37}))) - $unsigned($unsigned((+reg35[(1'h0):(1'h0)]))));
  assign wire49 = ($unsigned($signed(reg37[(3'h4):(2'h2)])) ^~ ((8'hb1) <= $unsigned($signed($unsigned(wire28)))));
  assign wire50 = (({wire29, $signed($unsigned(wire34))} ?
                      $unsigned($signed(wire32)) : (~^(-reg44[(1'h1):(1'h1)]))) * $unsigned((~{$signed(wire32),
                      {reg40, reg36}})));
  assign wire51 = wire31[(5'h10):(2'h3)];
  assign wire52 = (({{{reg40, wire49}, (~^(8'hba))},
                              (wire32 ? wire28 : wire50[(3'h5):(3'h4)])} ?
                          ($signed(((8'hbc) ? wire29 : wire46)) ?
                              wire50[(3'h7):(2'h3)] : reg39) : $signed((~^wire48))) ?
                      reg45 : $unsigned((($unsigned(wire49) ?
                              ((8'hb0) ?
                                  reg44 : reg39) : wire28[(3'h7):(3'h5)]) ?
                          (reg37 ?
                              (~wire34) : (wire50 ? wire31 : wire33)) : (reg41 ?
                              $signed(wire48) : (7'h41)))));
  assign wire53 = {$signed($signed(reg40[(2'h2):(2'h2)])),
                      ($unsigned((wire32 == wire30)) ?
                          ($signed(((8'hbd) ? wire31 : reg43)) ?
                              (reg42 ^~ wire28[(2'h2):(1'h1)]) : $signed((wire29 ^ (8'ha9)))) : (reg39[(2'h2):(2'h2)] == (8'ha1)))};
  always
    @(posedge clk) begin
      if (((wire46[(4'ha):(3'h4)] ^ $unsigned(((reg45 || reg44) ?
          (~|wire47) : reg37))) * reg40))
        begin
          if (wire29[(1'h1):(1'h1)])
            begin
              reg54 <= wire29;
              reg55 <= (reg37[(3'h5):(1'h1)] + {$signed($signed($unsigned((8'hb7))))});
            end
          else
            begin
              reg54 <= $signed(reg37[(3'h7):(3'h6)]);
            end
          reg56 <= {wire53[(1'h1):(1'h0)]};
        end
      else
        begin
          reg54 <= (8'hbc);
          reg55 <= (|(reg36 & ($unsigned((^~wire50)) ?
              reg43 : reg41[(4'ha):(3'h7)])));
          reg56 <= (&(7'h40));
          reg57 <= $unsigned((!($unsigned(wire48) && ((wire47 && wire51) ?
              $unsigned(reg40) : (8'hac)))));
        end
      reg58 <= {wire33, wire50};
      if ((wire46[(3'h7):(2'h2)] ?
          $unsigned($signed(($signed(wire47) | (!wire49)))) : (((!reg40) == {reg41[(3'h5):(1'h0)]}) + (-($unsigned(wire48) + reg38)))))
        begin
          if (($signed((~&wire30[(2'h3):(1'h1)])) & (wire49 ?
              (+$unsigned((reg40 ? wire31 : wire50))) : (wire50[(3'h4):(2'h3)] ?
                  wire32[(1'h1):(1'h0)] : wire47[(1'h1):(1'h1)]))))
            begin
              reg59 <= (^reg42[(1'h0):(1'h0)]);
              reg60 <= $signed(((($unsigned(reg45) ?
                  $unsigned((7'h40)) : $unsigned(reg56)) && (&(reg41 << reg44))) && (^~$signed({reg40}))));
              reg61 <= $unsigned(wire34);
              reg62 <= (($unsigned((+$unsigned((8'h9c)))) ?
                      {(+((8'had) ?
                              wire29 : reg40))} : $signed((reg44[(1'h0):(1'h0)] <<< reg36))) ?
                  ((7'h43) ^ wire48[(1'h1):(1'h1)]) : ((|$signed($signed(reg55))) ?
                      $signed(((reg44 || wire46) >= {reg35,
                          reg37})) : $unsigned(((wire53 < wire28) < {wire28,
                          reg36}))));
            end
          else
            begin
              reg59 <= $unsigned(reg57[(4'h8):(2'h2)]);
              reg60 <= {$unsigned($unsigned($signed($signed(reg39)))),
                  ($signed(reg55[(4'hd):(4'ha)]) ?
                      reg42[(2'h3):(2'h3)] : {$unsigned(wire49),
                          ({reg59} ? (reg43 ~^ wire32) : $unsigned(reg45))})};
              reg61 <= $signed((8'hb9));
              reg62 <= ($signed((!wire53)) ? reg42 : {reg43[(4'hc):(4'h8)]});
              reg63 <= wire50[(4'he):(2'h3)];
            end
          reg64 <= wire46[(4'hd):(3'h5)];
          reg65 <= $unsigned(reg61[(2'h3):(1'h1)]);
          reg66 <= $signed($unsigned($unsigned(($signed(reg36) ^~ (^reg39)))));
        end
      else
        begin
          reg59 <= ($unsigned(reg63) ?
              ($signed(reg55) != (^$signed((|reg40)))) : ($unsigned(reg54) - {(^~((8'hb5) >>> wire47)),
                  ((reg42 * reg36) && wire32[(2'h3):(2'h3)])}));
          reg60 <= {reg65[(2'h3):(2'h2)],
              $unsigned(((8'hb1) ? (8'hb2) : (~^(reg62 ? reg45 : reg39))))};
          reg61 <= $signed(wire32);
        end
      if (wire32)
        begin
          reg67 <= $unsigned($unsigned($unsigned($signed((wire50 ?
              wire47 : (8'ha3))))));
          if ((wire52 <= reg36))
            begin
              reg68 <= (reg57[(3'h7):(3'h6)] + wire50);
              reg69 <= ((((~^(~^wire49)) >> wire52[(4'he):(2'h3)]) && (reg40[(2'h2):(1'h1)] ?
                      reg38[(4'ha):(1'h1)] : (~(-(8'ha3))))) ?
                  (&(reg55 || {wire51})) : reg67[(4'he):(2'h3)]);
              reg70 <= reg35;
              reg71 <= {(($unsigned($signed((8'hb0))) == (reg69[(1'h1):(1'h1)] >> $signed(reg38))) ?
                      wire29[(3'h6):(3'h4)] : (($unsigned(reg44) << $unsigned(reg69)) || {reg40,
                          (reg63 + reg38)}))};
              reg72 <= $unsigned((~$signed((~reg59))));
            end
          else
            begin
              reg68 <= ($unsigned({reg45,
                  reg62[(1'h0):(1'h0)]}) ^~ $unsigned((!(+$unsigned(reg55)))));
              reg69 <= ($unsigned(((reg37[(3'h4):(1'h0)] ?
                      reg63[(3'h7):(1'h1)] : (wire28 ~^ reg58)) || (((7'h42) ?
                          reg68 : (8'hb7)) ?
                      reg44[(2'h2):(2'h2)] : $unsigned(reg39)))) ?
                  {wire50[(4'hd):(3'h4)]} : {({(~|reg69)} ? (!reg55) : (8'hbf)),
                      reg72});
              reg70 <= (~($unsigned(({reg68} <<< (reg58 <= wire53))) ?
                  ({$signed(wire34), reg66} ?
                      $signed(wire51[(2'h2):(1'h1)]) : (^~(reg62 ?
                          reg68 : wire52))) : {reg72, wire52}));
              reg71 <= (reg72 & reg35);
              reg72 <= (wire51[(1'h1):(1'h1)] ?
                  (~&({(reg72 - reg54)} ?
                      wire49 : $signed((7'h44)))) : (!$unsigned(reg45)));
            end
          reg73 <= wire29;
          reg74 <= $signed(reg35[(3'h4):(2'h3)]);
        end
      else
        begin
          reg67 <= {(~|{(8'ha6)})};
          reg68 <= $signed(((7'h40) ? reg71 : $unsigned(reg43[(4'h8):(1'h0)])));
          reg69 <= reg62;
          if ((wire33[(1'h1):(1'h0)] ?
              reg39[(4'hb):(4'h8)] : ($signed(((wire34 ?
                      reg59 : wire34) > $unsigned(reg54))) ?
                  {({reg37, wire47} ^ reg41)} : (~|({wire51,
                      wire52} * (&reg66))))))
            begin
              reg70 <= (8'h9d);
              reg71 <= reg55[(5'h12):(4'hc)];
              reg72 <= reg64[(4'hd):(3'h7)];
              reg73 <= $unsigned(reg72[(4'hc):(1'h0)]);
            end
          else
            begin
              reg70 <= (-reg73);
              reg71 <= (reg42 ?
                  $signed($signed(wire48)) : reg58[(2'h2):(2'h2)]);
            end
          reg74 <= ($unsigned(reg69[(2'h3):(2'h2)]) ?
              reg42[(4'ha):(3'h4)] : ({wire28} ^ (($signed(reg71) || $unsigned(wire49)) ?
                  $unsigned((reg72 ? reg57 : wire46)) : ((reg40 ?
                      wire33 : wire50) || reg63))));
        end
    end
  assign wire75 = ($signed(($unsigned((^~reg36)) ~^ $unsigned((reg55 ?
                          wire51 : reg45)))) ?
                      (^{reg41, wire28}) : ((^wire47) << ({$signed(reg67),
                          (^~(8'hb8))} >= (^~reg58))));
  assign wire76 = (reg43[(2'h3):(1'h0)] & $unsigned(reg68));
  assign wire77 = reg62;
  assign wire78 = $unsigned($signed({((reg62 <= wire31) ?
                          (wire52 || reg39) : (&(7'h44)))}));
  assign wire79 = ($unsigned((&$signed(((8'hac) ?
                      (8'hb3) : (8'hae))))) == $signed($unsigned($signed((wire50 ?
                      wire51 : reg56)))));
  assign wire80 = $unsigned($signed($signed(((reg37 ? reg57 : reg66) || (reg41 ?
                      reg68 : reg61)))));
endmodule
