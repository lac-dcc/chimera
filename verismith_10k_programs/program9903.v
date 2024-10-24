module top
#(parameter param302 = ((^((^~((8'hac) ? (8'haa) : (8'had))) << ((8'h9d) ? ((7'h41) ? (8'hba) : (8'hb1)) : ((8'haa) ? (8'ha2) : (8'hb8))))) | ({(~{(8'hbe)})} ? (~^(~^(8'h9e))) : (|(~^{(8'hbf), (8'ha9)})))), 
parameter param303 = (((|(+param302)) ^~ ((8'hb4) - (~&(param302 ? param302 : param302)))) ? param302 : ((+(((8'hae) ? param302 : (8'ha6)) ? (param302 ? param302 : param302) : param302)) && ((!param302) ? ((param302 ? param302 : param302) + (param302 ? param302 : param302)) : (param302 ^ (~|param302))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire301;
  wire signed [(2'h3):(1'h0)] wire300;
  wire [(5'h12):(1'h0)] wire298;
  wire [(3'h7):(1'h0)] wire297;
  wire signed [(4'h8):(1'h0)] wire296;
  wire [(3'h4):(1'h0)] wire295;
  wire signed [(4'hb):(1'h0)] wire292;
  wire signed [(3'h5):(1'h0)] wire277;
  wire [(4'h9):(1'h0)] wire211;
  wire signed [(4'ha):(1'h0)] wire270;
  wire [(4'he):(1'h0)] wire272;
  wire signed [(2'h3):(1'h0)] wire273;
  wire [(4'hb):(1'h0)] wire275;
  reg signed [(3'h6):(1'h0)] reg299 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg294 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg293 = (1'h0);
  reg [(4'h8):(1'h0)] reg291 = (1'h0);
  reg [(5'h13):(1'h0)] reg290 = (1'h0);
  reg [(5'h13):(1'h0)] reg289 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg288 = (1'h0);
  reg [(2'h2):(1'h0)] reg287 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg286 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg285 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg284 = (1'h0);
  reg [(5'h10):(1'h0)] reg283 = (1'h0);
  reg [(2'h2):(1'h0)] reg282 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg281 = (1'h0);
  reg [(4'hb):(1'h0)] reg280 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg279 = (1'h0);
  reg [(4'hb):(1'h0)] reg278 = (1'h0);
  reg signed [(4'he):(1'h0)] reg274 = (1'h0);
  assign y = {wire301,
                 wire300,
                 wire298,
                 wire297,
                 wire296,
                 wire295,
                 wire292,
                 wire277,
                 wire211,
                 wire270,
                 wire272,
                 wire273,
                 wire275,
                 reg299,
                 reg294,
                 reg293,
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
                 reg274,
                 (1'h0)};
  module4 #() modinst212 (wire211, clk, wire2, wire0, wire3, wire1, (8'hb2));
  module213 #() modinst271 (wire270, clk, wire0, wire1, wire2, wire3);
  assign wire272 = (((((&wire1) ?
                       {wire270,
                           wire3} : wire0) >> wire1[(4'h9):(3'h7)]) ^~ {(&(wire270 >> wire211))}) < $unsigned($unsigned(wire270[(3'h4):(2'h2)])));
  assign wire273 = wire0[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg274 <= $signed((($signed((-wire273)) << $unsigned((-wire2))) ?
          wire2[(4'ha):(3'h5)] : (((8'ha0) ^~ $signed(wire272)) <<< ($signed(wire273) << $unsigned(wire211)))));
    end
  module213 #() modinst276 (.clk(clk), .wire215(wire1), .y(wire275), .wire217(wire0), .wire214(wire270), .wire216(reg274));
  assign wire277 = (^(({(wire0 ? wire273 : (8'hbf))} ?
                           (|$unsigned(wire211)) : ({(8'h9f)} ?
                               $signed(wire270) : (wire0 & wire3))) ?
                       $unsigned((8'had)) : wire3[(4'hb):(3'h4)]));
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg278 <= (^((~(-(wire270 ? wire2 : (7'h42)))) && $unsigned({wire272,
              ((7'h40) ? wire270 : wire270)})));
        end
      else
        begin
          reg278 <= $signed($unsigned(wire272[(1'h1):(1'h0)]));
          reg279 <= reg278[(4'hb):(1'h1)];
          reg280 <= ($signed(wire3) ?
              reg279[(3'h6):(2'h2)] : $signed($unsigned({wire270,
                  $signed(reg279)})));
          if (($unsigned({((wire2 + wire2) && $signed(wire275))}) * $signed((~&(^~wire211)))))
            begin
              reg281 <= (~&$unsigned(wire2[(1'h1):(1'h1)]));
              reg282 <= (~^(!(~&{$unsigned(reg281)})));
              reg283 <= $signed(($signed(reg282) ?
                  wire272[(3'h4):(2'h2)] : (wire275 ?
                      reg282 : ((8'hb2) >>> (wire211 ? wire211 : reg278)))));
              reg284 <= ((~&({(~wire1),
                  reg274[(3'h6):(1'h1)]} | {$signed(wire1),
                  (reg281 ^ wire211)})) <= wire277[(2'h3):(2'h3)]);
              reg285 <= $unsigned(wire270[(4'h9):(1'h1)]);
            end
          else
            begin
              reg281 <= $unsigned(reg283);
              reg282 <= ($unsigned((!({wire2} * $unsigned(reg279)))) ?
                  (~|$signed(((~^reg284) ^~ $signed(wire273)))) : $signed((((~|reg285) ?
                          (reg284 << wire0) : $signed(reg283)) ?
                      ($signed(wire277) ?
                          (|wire272) : wire2[(4'h8):(2'h3)]) : ((wire270 == wire270) ?
                          ((8'hb6) ^~ (8'hb7)) : wire1))));
            end
        end
      if ($unsigned(reg278[(1'h1):(1'h0)]))
        begin
          reg286 <= (!wire3);
          if (((~&reg283) ?
              {$unsigned((wire2[(4'ha):(3'h6)] + wire1[(5'h12):(1'h1)])),
                  wire275[(1'h0):(1'h0)]} : $unsigned(wire273)))
            begin
              reg287 <= {wire272, $signed(wire0)};
            end
          else
            begin
              reg287 <= $unsigned({reg283});
              reg288 <= reg287[(1'h1):(1'h0)];
              reg289 <= ((^~((^~(reg283 > (7'h43))) ?
                      (reg288 ?
                          (~^wire272) : (^wire1)) : (wire0[(2'h2):(1'h0)] ?
                          $signed(reg280) : (reg278 ? wire0 : wire277)))) ?
                  (wire211[(3'h6):(2'h2)] ?
                      ((^$signed((7'h42))) || ($unsigned(wire3) * reg274)) : ($unsigned((+reg278)) ?
                          $signed((wire3 >>> wire273)) : $signed($signed(reg286)))) : ($unsigned((^~(wire277 & wire275))) > wire275[(3'h6):(3'h4)]));
            end
          reg290 <= $unsigned($unsigned(reg285[(3'h4):(3'h4)]));
        end
      else
        begin
          reg286 <= (~&reg284);
          reg287 <= ((reg286[(3'h6):(3'h4)] ? wire3 : wire270[(4'h9):(3'h7)]) ?
              (~($signed($signed(reg283)) ^ $unsigned((8'ha3)))) : $unsigned($unsigned((&$unsigned(reg284)))));
          reg288 <= (reg287[(1'h0):(1'h0)] ?
              $signed((~|({reg281} ?
                  (wire272 && reg284) : (~wire277)))) : $signed($signed(wire1)));
          reg289 <= wire270;
          reg290 <= $unsigned((^wire273[(2'h3):(1'h0)]));
        end
      reg291 <= (8'ha5);
    end
  assign wire292 = (wire275[(1'h0):(1'h0)] * $unsigned(wire3[(3'h6):(3'h5)]));
  always
    @(posedge clk) begin
      reg293 <= ($unsigned({((!reg288) ?
              $signed(wire277) : (reg287 != reg289))}) >>> ((((8'hbc) ?
                  $unsigned(reg279) : ((8'hb2) ? reg281 : (8'hbb))) ?
              {(reg290 ~^ reg281),
                  (reg289 ? reg291 : wire270)} : (reg287[(1'h0):(1'h0)] ?
                  wire2[(4'hd):(4'hd)] : reg278[(4'h9):(3'h7)])) ?
          (+reg285) : (~^({reg286, (8'hbe)} <= wire2))));
      reg294 <= reg283[(4'hf):(1'h0)];
    end
  assign wire295 = reg274;
  assign wire296 = wire0[(2'h2):(1'h0)];
  assign wire297 = $unsigned((!($signed((&reg283)) ?
                       $signed($unsigned(wire296)) : (!(wire1 ?
                           wire292 : reg287)))));
  assign wire298 = $unsigned((reg279[(5'h10):(4'hf)] > {reg291[(1'h0):(1'h0)],
                       (&reg290)}));
  always
    @(posedge clk) begin
      reg299 <= ((!$unsigned($signed(wire211[(2'h2):(1'h1)]))) > (+wire0[(4'hf):(4'he)]));
    end
  assign wire300 = $unsigned($signed(wire277));
  assign wire301 = wire277[(1'h1):(1'h1)];
endmodule

module module213
#(parameter param268 = {(~|(({(8'ha1), (8'hab)} + {(8'hb3), (8'hb3)}) < (((8'ha2) ? (8'ha8) : (7'h44)) ? (8'hb2) : (&(8'haf)))))}, 
parameter param269 = (8'hb2))
(y, clk, wire217, wire216, wire215, wire214);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire217;
  input wire signed [(4'he):(1'h0)] wire216;
  input wire [(4'h8):(1'h0)] wire215;
  input wire signed [(4'ha):(1'h0)] wire214;
  wire [(5'h12):(1'h0)] wire262;
  wire [(4'hc):(1'h0)] wire261;
  wire [(4'hd):(1'h0)] wire259;
  reg [(5'h11):(1'h0)] reg267 = (1'h0);
  reg [(3'h6):(1'h0)] reg266 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg265 = (1'h0);
  reg [(4'hf):(1'h0)] reg264 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg263 = (1'h0);
  assign y = {wire262,
                 wire261,
                 wire259,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 (1'h0)};
  module218 #() modinst260 (wire259, clk, wire217, wire216, wire215, wire214);
  assign wire261 = wire214;
  assign wire262 = {$unsigned((wire214[(4'ha):(4'h8)] * $unsigned(wire261))),
                       $signed($unsigned(({wire214,
                           (8'ha9)} | $signed(wire216))))};
  always
    @(posedge clk) begin
      if ((8'haa))
        begin
          reg263 <= (($signed((|(wire216 > wire262))) ?
                  wire261 : wire259[(4'hd):(4'h9)]) ?
              $signed((wire214 ?
                  wire215[(3'h5):(3'h4)] : {wire214,
                      wire215[(3'h6):(3'h6)]})) : {{{$unsigned(wire215),
                          (wire216 ? (8'hbf) : wire216)}},
                  (-((^~wire216) ^ wire217))});
          reg264 <= {$signed((((~(8'ha9)) ? (~wire262) : {wire215, wire214}) ?
                  wire262[(1'h0):(1'h0)] : $signed((reg263 & wire217))))};
          reg265 <= $signed(wire261);
          reg266 <= (wire216 ?
              {(((wire217 < wire214) >> $unsigned((8'haa))) ^~ ($unsigned(wire217) ^~ wire214))} : $unsigned(reg263[(3'h7):(2'h3)]));
        end
      else
        begin
          reg263 <= ($unsigned((~wire259[(4'hc):(4'h8)])) == (~^$signed({(reg264 && wire215),
              wire216})));
          reg264 <= {((reg265 ?
                  (|(wire262 < wire215)) : $unsigned(reg264)) && $signed($signed(reg264))),
              $unsigned((&$unsigned((reg264 < wire262))))};
        end
      reg267 <= reg263;
    end
endmodule

module module4
#(parameter param210 = (8'hb6))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h379):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire209;
  wire signed [(4'he):(1'h0)] wire208;
  wire signed [(4'hd):(1'h0)] wire180;
  wire [(4'hc):(1'h0)] wire179;
  wire signed [(4'hd):(1'h0)] wire178;
  wire signed [(3'h5):(1'h0)] wire177;
  wire signed [(4'hb):(1'h0)] wire176;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire163;
  reg [(3'h6):(1'h0)] reg207 = (1'h0);
  reg [(2'h3):(1'h0)] reg206 = (1'h0);
  reg [(4'hb):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg204 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg203 = (1'h0);
  reg [(5'h13):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg201 = (1'h0);
  reg [(5'h12):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg199 = (1'h0);
  reg [(3'h5):(1'h0)] reg198 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg195 = (1'h0);
  reg [(4'hb):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg192 = (1'h0);
  reg [(5'h13):(1'h0)] reg191 = (1'h0);
  reg [(4'hb):(1'h0)] reg190 = (1'h0);
  reg [(5'h15):(1'h0)] reg189 = (1'h0);
  reg [(4'hc):(1'h0)] reg188 = (1'h0);
  reg [(4'hc):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg186 = (1'h0);
  reg [(5'h14):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg183 = (1'h0);
  reg [(5'h14):(1'h0)] reg182 = (1'h0);
  reg signed [(4'he):(1'h0)] reg181 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg175 = (1'h0);
  reg [(3'h7):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg171 = (1'h0);
  reg signed [(4'he):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  reg [(5'h11):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg165 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  assign y = {wire209,
                 wire208,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire71,
                 wire26,
                 wire25,
                 wire84,
                 wire85,
                 wire86,
                 wire163,
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
                 reg197,
                 reg196,
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
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
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
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire7[(3'h6):(2'h3)])
        begin
          reg10 <= (+$unsigned({(wire6 || wire8[(3'h4):(1'h0)])}));
        end
      else
        begin
          reg10 <= ((wire6 && ({{reg10}} <<< wire7[(4'ha):(4'h9)])) != ((^(reg10[(3'h5):(2'h3)] ?
              $signed(wire8) : {reg10})) * $unsigned($signed($signed(reg10)))));
          reg11 <= ($signed(wire9) <<< wire7);
          reg12 <= $signed((~&(wire6 != wire6)));
          reg13 <= wire6[(4'hc):(3'h6)];
        end
      if ($signed(((~|(reg10[(3'h6):(3'h5)] ?
              (~&(8'ha9)) : reg11[(4'hb):(3'h4)])) ?
          $signed($signed((!(8'h9d)))) : $signed(((reg10 == wire8) - ((8'h9c) - reg12))))))
        begin
          reg14 <= (&reg13[(3'h5):(1'h0)]);
          if ($signed(reg11))
            begin
              reg15 <= (reg10 < (+(wire9 ?
                  ((wire7 >= reg10) | reg10[(3'h7):(1'h0)]) : ($unsigned((8'hbb)) <<< {wire6,
                      reg12}))));
              reg16 <= ((~(-wire6)) ?
                  ({{wire8[(2'h3):(1'h0)]},
                      {(wire8 + reg14),
                          $signed(reg14)}} != (+wire5[(4'h9):(2'h3)])) : ($unsigned((wire6 ?
                      $unsigned(wire8) : (wire6 >= reg15))) < ((^reg11[(2'h3):(2'h2)]) + $unsigned((reg10 ?
                      reg14 : reg13)))));
              reg17 <= (8'hba);
              reg18 <= $unsigned((~(~^(~&(8'hb0)))));
              reg19 <= {($unsigned({{wire7, reg17},
                      ((8'ha6) ?
                          reg17 : reg13)}) * $signed($signed(wire9[(3'h5):(1'h0)])))};
            end
          else
            begin
              reg15 <= $signed($signed($unsigned($unsigned($unsigned(wire7)))));
              reg16 <= reg19;
            end
          reg20 <= (($unsigned($unsigned({reg19,
              wire9})) ^~ reg17) * ((((reg15 ? reg10 : reg17) ?
                  $signed((8'hbc)) : $signed(wire5)) == wire7) ?
              (8'hb5) : $signed($unsigned((wire8 ? reg19 : reg16)))));
          reg21 <= ((~&(($unsigned((8'hb8)) >= (~|(8'had))) ^~ $unsigned(reg19))) <= reg20[(1'h0):(1'h0)]);
        end
      else
        begin
          reg14 <= (~(8'ha4));
          if ({(~reg13)})
            begin
              reg15 <= (~|$unsigned(reg10[(2'h3):(1'h0)]));
              reg16 <= (((reg10[(3'h6):(1'h0)] > $unsigned((wire9 ?
                  reg17 : reg12))) || $unsigned(reg15)) >> (|reg12));
              reg17 <= reg15;
              reg18 <= (8'hba);
              reg19 <= wire8[(3'h5):(3'h5)];
            end
          else
            begin
              reg15 <= $signed($unsigned(($signed(reg14) & (reg10[(3'h5):(1'h1)] ?
                  reg20[(2'h2):(1'h1)] : {wire9}))));
            end
        end
      reg22 <= {(reg21 ? reg12 : {(+(reg10 ^ wire8)), (8'haa)}),
          $signed((^~$signed(wire9[(3'h5):(2'h2)])))};
      reg23 <= $signed($unsigned((|$unsigned((reg11 - wire7)))));
      reg24 <= reg23;
    end
  assign wire25 = reg23;
  assign wire26 = $unsigned({(((reg10 ? reg15 : reg11) | $signed(reg15)) ?
                          $signed(wire9) : ((reg14 ^ wire25) * reg19[(4'h8):(1'h0)]))});
  module27 #() modinst72 (wire71, clk, wire26, wire5, reg23, wire9, reg13);
  always
    @(posedge clk) begin
      if ((^$unsigned(reg15[(4'h9):(1'h1)])))
        begin
          reg73 <= reg24;
          if (reg19[(4'hc):(3'h7)])
            begin
              reg74 <= {(wire26[(3'h7):(3'h4)] >> $unsigned($signed(wire8[(3'h5):(1'h1)])))};
            end
          else
            begin
              reg74 <= reg17;
              reg75 <= reg19[(4'h9):(1'h0)];
              reg76 <= $signed((reg14[(2'h2):(2'h2)] << reg15));
            end
        end
      else
        begin
          reg73 <= ($unsigned($signed(wire8[(3'h4):(3'h4)])) ?
              reg17[(1'h1):(1'h1)] : $unsigned((~^reg20)));
          reg74 <= {(reg19 ?
                  $signed($unsigned($signed((8'hba)))) : $signed($unsigned(reg15[(2'h3):(2'h3)])))};
          reg75 <= reg76[(1'h0):(1'h0)];
          if ((|reg12[(3'h6):(1'h1)]))
            begin
              reg76 <= wire26;
              reg77 <= (($unsigned($unsigned($unsigned((7'h42)))) <<< $unsigned((reg14[(3'h5):(1'h0)] ?
                      (reg12 ? wire71 : reg20) : (reg20 ? reg17 : reg14)))) ?
                  wire71 : wire8);
              reg78 <= $signed(reg16);
              reg79 <= (+$signed((wire7 ?
                  {(reg20 ?
                          reg10 : reg77)} : (wire26[(3'h6):(1'h1)] || (wire9 >= wire71)))));
              reg80 <= (&$unsigned({reg74, $signed(reg73)}));
            end
          else
            begin
              reg76 <= (~{reg21[(1'h0):(1'h0)]});
              reg77 <= (reg77 << ($unsigned(($unsigned(reg76) ~^ $signed(reg79))) ?
                  (~|reg10[(4'h8):(4'h8)]) : (^({reg20} * (wire8 ^~ reg13)))));
              reg78 <= ($unsigned(reg17[(3'h6):(1'h1)]) - ((-reg16[(4'h8):(1'h1)]) ^~ (8'hbf)));
            end
        end
      reg81 <= (8'ha2);
      reg82 <= (^$signed($signed((wire26[(3'h5):(3'h4)] - $unsigned(reg18)))));
      reg83 <= (^~(+$signed((reg73[(2'h3):(1'h1)] ?
          (&reg76) : $unsigned(reg24)))));
    end
  assign wire84 = ((~&reg22[(4'h8):(2'h2)]) <<< (($unsigned((reg74 > reg10)) ?
                      (8'hac) : reg21[(1'h0):(1'h0)]) >= $signed((reg16 ?
                      $unsigned(reg77) : $signed(reg23)))));
  assign wire85 = $signed($unsigned(({$unsigned(reg73)} != (reg78[(4'hd):(2'h2)] >= (reg19 || wire26)))));
  assign wire86 = {(&$unsigned($signed($signed(reg12)))),
                      $signed(((^$signed(wire85)) ?
                          reg18 : {wire85[(3'h5):(2'h3)]}))};
  module87 #() modinst164 (wire163, clk, wire26, reg81, reg78, wire7, wire25);
  always
    @(posedge clk) begin
      if ($unsigned((+wire163[(2'h2):(1'h1)])))
        begin
          reg165 <= (({$signed((reg78 ? reg75 : (8'ha9))),
                  ((reg77 >>> wire85) ?
                      (wire163 ? (7'h41) : wire7) : (reg77 ?
                          reg21 : reg80))} - reg81[(4'h9):(4'h8)]) ?
              (($signed(reg12[(3'h7):(3'h6)]) ?
                      (8'hac) : reg76[(1'h0):(1'h0)]) ?
                  (reg17[(2'h3):(2'h3)] ?
                      (reg18[(2'h3):(1'h1)] ?
                          reg76[(2'h3):(2'h3)] : (reg24 + reg24)) : reg82) : $signed($signed(wire71[(3'h5):(3'h5)]))) : (8'hbf));
        end
      else
        begin
          if (reg76)
            begin
              reg165 <= {(-wire85[(3'h6):(3'h4)]),
                  ($unsigned((wire25 ?
                          $signed(reg75) : ((8'h9f) ? reg23 : reg23))) ?
                      ({$unsigned(reg15)} ?
                          ($signed(wire85) ~^ {wire71,
                              (8'hb3)}) : (^$signed(reg73))) : reg165[(2'h2):(2'h2)])};
              reg166 <= ((wire163 ?
                      (^(((8'hb5) == reg77) + (&reg15))) : {(reg17 ?
                              (wire86 == wire86) : $signed(wire5)),
                          wire26}) ?
                  ($unsigned(reg11) * reg23) : ({reg22, reg20} ?
                      (|$signed((+wire163))) : reg18[(3'h5):(2'h3)]));
              reg167 <= (8'ha7);
              reg168 <= $signed($signed(({$unsigned(reg77)} >= ($unsigned(reg20) >> wire9[(3'h6):(1'h1)]))));
              reg169 <= (!(|(reg22 ?
                  $unsigned((~reg20)) : $unsigned($unsigned(reg17)))));
            end
          else
            begin
              reg165 <= ($unsigned((8'hbf)) ~^ wire84);
              reg166 <= (8'hbf);
              reg167 <= $signed((8'haf));
            end
          reg170 <= reg82;
          reg171 <= reg22[(4'hd):(3'h7)];
          reg172 <= reg80[(2'h2):(1'h0)];
          reg173 <= reg10;
        end
      reg174 <= (^$unsigned({(reg171[(3'h6):(2'h2)] ?
              wire5 : (wire5 ? reg76 : (7'h40)))}));
      reg175 <= (8'h9c);
    end
  assign wire176 = ((+($unsigned($signed(reg175)) ?
                       $signed($unsigned(wire163)) : ($unsigned(reg16) ?
                           (reg21 != wire8) : (wire7 ?
                               reg82 : (8'hb0))))) | reg170);
  assign wire177 = $signed((reg18[(2'h3):(1'h0)] ?
                       $signed($signed($signed(reg166))) : {reg175[(1'h0):(1'h0)],
                           $signed({reg175})}));
  assign wire178 = {($signed(((|wire5) ? $unsigned(reg23) : (~^reg171))) ?
                           ($signed((|reg24)) || reg12) : $signed((|reg12))),
                       $unsigned((~|reg169))};
  assign wire179 = reg168[(4'hf):(3'h5)];
  assign wire180 = ($signed(reg19[(3'h4):(2'h3)]) ?
                       ((^{(|wire179), reg168[(2'h2):(1'h1)]}) ?
                           (8'hab) : ($signed(reg21) ?
                               (wire7 & $unsigned((8'hbe))) : reg11[(3'h4):(2'h2)])) : ((reg173 && {(wire5 && reg171),
                               $unsigned(wire7)}) ?
                           $signed(reg12) : reg77[(3'h4):(2'h2)]));
  always
    @(posedge clk) begin
      reg181 <= {($unsigned(({reg75} ? (8'h9c) : $signed(wire177))) ?
              $unsigned($unsigned($unsigned((8'ha8)))) : $unsigned($unsigned((reg167 >> reg17))))};
      if ((~$unsigned((((reg20 ^~ reg81) ?
          reg14 : (wire7 <= reg16)) - (reg80 - $unsigned(wire26))))))
        begin
          reg182 <= (~|$signed((^reg10)));
          reg183 <= (~^(!$unsigned((|$unsigned(wire8)))));
        end
      else
        begin
          reg182 <= (reg169 <= $signed(reg183[(1'h0):(1'h0)]));
          reg183 <= reg173[(4'h9):(4'h8)];
          if (($signed(((&reg82) ?
              $unsigned((reg23 ^~ (8'hbd))) : {$signed(reg75)})) ^ reg83[(2'h2):(2'h2)]))
            begin
              reg184 <= {reg24[(1'h0):(1'h0)],
                  ((^~$signed($signed(reg19))) & wire176[(3'h4):(2'h2)])};
              reg185 <= (~&(reg22[(4'hd):(1'h1)] ?
                  $unsigned((~|(wire176 ?
                      reg182 : (8'ha8)))) : (~$signed((reg24 ?
                      wire9 : wire85)))));
            end
          else
            begin
              reg184 <= (reg81[(5'h14):(4'ha)] < $unsigned($unsigned(reg184)));
              reg185 <= (~|(8'hba));
              reg186 <= ((-wire85) << (reg183 >> $signed(($unsigned(wire178) <<< $signed(reg175)))));
              reg187 <= (^~reg78);
              reg188 <= ($unsigned(((~&reg166[(1'h0):(1'h0)]) ?
                  $signed(reg21[(2'h2):(1'h1)]) : {{wire7,
                          reg187}})) - (~&reg83[(3'h5):(2'h2)]));
            end
          reg189 <= (8'hab);
        end
      reg190 <= ($unsigned(reg24[(1'h1):(1'h1)]) ?
          (|$signed($signed(((7'h44) ? reg21 : reg189)))) : $unsigned(reg20));
      if ((^({(-$signed(reg83)),
          reg165[(4'hb):(3'h5)]} || ({{reg11}} <<< wire9[(3'h4):(1'h0)]))))
        begin
          if ($unsigned(($signed(((reg22 ? reg181 : reg77) ?
              $unsigned(wire71) : (reg173 ?
                  reg183 : reg175))) > $signed((~(+reg189))))))
            begin
              reg191 <= wire8[(2'h2):(2'h2)];
            end
          else
            begin
              reg191 <= (|(|$unsigned($signed($signed(reg181)))));
              reg192 <= $unsigned($signed((((reg12 ^ reg190) & (reg78 ?
                      reg15 : reg11)) ?
                  {reg76[(4'h8):(1'h0)],
                      $unsigned(wire180)} : ($unsigned(reg24) ?
                      reg12[(5'h10):(4'hb)] : {(8'hb9)}))));
              reg193 <= ((|$signed(({reg24, reg171} ?
                      ((8'ha3) ? reg191 : reg82) : (reg185 ? reg11 : reg16)))) ?
                  {reg168} : (reg190[(3'h4):(1'h1)] ?
                      wire26[(1'h1):(1'h0)] : ((|(wire179 ?
                          (8'hbb) : reg185)) == ((reg165 & wire85) ?
                          {reg76} : {wire8, reg76}))));
            end
          if ($signed((~^(~&((wire9 ? reg184 : reg189) ?
              $signed(reg10) : (~|reg166))))))
            begin
              reg194 <= $unsigned({(((8'hbf) + (reg21 ?
                      reg169 : reg14)) > reg182[(2'h3):(1'h0)])});
              reg195 <= ((8'hbc) ^~ wire25);
              reg196 <= $signed($unsigned(reg77));
            end
          else
            begin
              reg194 <= ({wire177[(3'h4):(1'h1)]} ?
                  (~^((8'ha3) > {(8'ha1)})) : reg165[(5'h14):(3'h7)]);
              reg195 <= ($unsigned($unsigned((^~(reg83 ? wire178 : wire71)))) ?
                  $unsigned({$signed($signed(reg12))}) : {(((reg175 ?
                              reg184 : reg185) ^ $signed(reg15)) ?
                          ({reg77, reg76} ?
                              $unsigned(wire85) : (reg189 ?
                                  wire25 : (7'h40))) : reg175),
                      reg175[(1'h0):(1'h0)]});
            end
          reg197 <= wire176[(1'h1):(1'h0)];
        end
      else
        begin
          reg191 <= (^reg22[(4'he):(3'h4)]);
          reg192 <= ($unsigned($unsigned(reg174[(1'h0):(1'h0)])) ?
              $signed({(~(8'hb7)),
                  $signed({reg182, (8'hb7)})}) : reg170[(1'h0):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg198 <= (((|$unsigned(reg175)) ?
              ($signed(reg193[(5'h11):(4'h8)]) >= ((reg15 <<< (8'hbe)) >= wire179)) : $signed($unsigned($signed(reg175)))) ?
          $unsigned($unsigned(reg197[(1'h0):(1'h0)])) : {reg166[(3'h4):(2'h2)]});
      if ($signed(reg24[(1'h0):(1'h0)]))
        begin
          reg199 <= {reg78[(3'h6):(1'h1)], {(+wire85), reg21}};
          if (wire178[(2'h2):(1'h1)])
            begin
              reg200 <= reg77;
              reg201 <= reg76[(3'h7):(3'h5)];
              reg202 <= wire84;
              reg203 <= $unsigned({reg22});
            end
          else
            begin
              reg200 <= ({$unsigned(reg167),
                  wire26[(3'h7):(2'h3)]} <<< wire178);
              reg201 <= ((~&$signed((reg200 >> reg172[(3'h4):(1'h1)]))) ?
                  reg12 : {reg169});
            end
          reg204 <= reg174[(1'h1):(1'h0)];
          reg205 <= $unsigned((($unsigned({reg19, reg21}) >>> reg197) ?
              (+reg13[(3'h5):(3'h4)]) : reg169));
        end
      else
        begin
          reg199 <= $unsigned(reg202);
          if ({$unsigned(reg187), (!wire7[(4'ha):(1'h1)])})
            begin
              reg200 <= (-((wire71[(4'ha):(1'h0)] < reg184[(3'h7):(1'h1)]) && (~|((reg196 ?
                  reg73 : reg190) > wire84[(1'h1):(1'h1)]))));
              reg201 <= (~|{(({(8'hb4)} ?
                          (reg205 > wire179) : ((8'ha7) & wire26)) ?
                      ((!reg197) ?
                          $unsigned(wire71) : $signed(reg191)) : ($unsigned(reg170) ?
                          $signed(wire71) : ((8'ha8) || wire8)))});
            end
          else
            begin
              reg200 <= $unsigned($unsigned((~^(~|reg165[(4'h8):(3'h6)]))));
              reg201 <= (reg187[(4'h9):(4'h9)] > (wire9[(3'h7):(1'h0)] ?
                  (-$signed($signed(reg24))) : ((^~(~|reg168)) >> $signed(wire7[(1'h0):(1'h0)]))));
              reg202 <= wire179;
            end
        end
      reg206 <= $unsigned(({($unsigned((8'h9e)) ?
                  (reg182 >= reg21) : (reg171 ? reg83 : wire9))} ?
          $signed($signed(reg193)) : reg15));
      reg207 <= $unsigned(($unsigned(reg83[(1'h0):(1'h0)]) ?
          (^(!(~|reg11))) : $signed(reg14)));
    end
  assign wire208 = $unsigned((+(^wire180)));
  assign wire209 = reg16[(1'h1):(1'h0)];
endmodule

module module87
#(parameter param162 = ({{(8'ha7), (!(!(8'hbb)))}, ((8'hbc) <= (-((7'h42) ? (8'h9e) : (8'hb7))))} ? ((8'h9c) ? (({(8'hac), (8'ha6)} + (~&(8'hb1))) ? {(~|(8'hb1)), ((8'hb7) ? (8'ha7) : (8'hb0))} : (((8'ha3) <= (8'hb1)) ? ((8'ha0) ? (8'hbf) : (7'h41)) : ((8'hbe) ? (8'ha5) : (7'h44)))) : (^(((7'h44) ? (8'ha1) : (8'hbe)) ? {(8'hbf), (8'ha1)} : {(8'hb2)}))) : ((({(8'hb5), (8'ha3)} ? ((7'h40) ? (8'hb6) : (8'hba)) : (+(7'h40))) ? (~^{(8'ha3)}) : (-(-(8'had)))) ^ ((~&((8'hb5) == (8'h9d))) >> ((^~(8'hb1)) ? ((7'h43) ? (8'hbb) : (8'ha9)) : {(8'ha7), (8'hb7)})))))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h2f4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire92;
  input wire signed [(4'hd):(1'h0)] wire91;
  input wire [(5'h10):(1'h0)] wire90;
  input wire signed [(2'h2):(1'h0)] wire89;
  input wire signed [(4'he):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire161;
  wire signed [(4'he):(1'h0)] wire160;
  wire [(5'h11):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire [(4'ha):(1'h0)] wire157;
  wire signed [(5'h10):(1'h0)] wire156;
  wire [(5'h13):(1'h0)] wire155;
  wire [(4'he):(1'h0)] wire152;
  wire [(4'hf):(1'h0)] wire151;
  wire signed [(3'h4):(1'h0)] wire150;
  wire signed [(5'h10):(1'h0)] wire149;
  wire signed [(3'h5):(1'h0)] wire148;
  wire [(4'hd):(1'h0)] wire140;
  wire signed [(3'h5):(1'h0)] wire134;
  wire [(3'h4):(1'h0)] wire133;
  wire [(3'h4):(1'h0)] wire132;
  wire signed [(3'h5):(1'h0)] wire131;
  wire signed [(4'hf):(1'h0)] wire130;
  wire [(3'h4):(1'h0)] wire129;
  reg signed [(3'h7):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg153 = (1'h0);
  reg [(4'ha):(1'h0)] reg147 = (1'h0);
  reg [(5'h15):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg145 = (1'h0);
  reg [(4'h9):(1'h0)] reg144 = (1'h0);
  reg [(4'h8):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(4'hc):(1'h0)] reg137 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire140,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 reg154,
                 reg153,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg93 <= {$signed({(^(wire90 ~^ wire89)), (+(~^wire91))})};
      if (wire92)
        begin
          reg94 <= ({$signed(wire91)} ?
              ($signed($signed(wire92)) >= wire92) : (^{$signed({wire92,
                      reg93}),
                  ($signed(wire89) ?
                      wire90[(4'h8):(4'h8)] : wire90[(4'he):(1'h1)])}));
        end
      else
        begin
          reg94 <= $signed((^$signed($unsigned(((8'ha5) ? wire90 : reg94)))));
          if ($unsigned(((~&(wire89[(2'h2):(1'h1)] | (~&wire90))) != wire92)))
            begin
              reg95 <= wire89;
              reg96 <= $unsigned(wire88[(4'hc):(3'h6)]);
              reg97 <= reg93;
            end
          else
            begin
              reg95 <= ($signed((~$unsigned(((8'hb4) ?
                  (8'hac) : wire88)))) != reg95[(2'h3):(1'h1)]);
              reg96 <= (wire90[(4'h8):(4'h8)] != (wire92[(3'h5):(1'h0)] ?
                  {(((8'hb7) <<< wire91) + (~&reg94)),
                      reg94} : (-(wire90[(4'hb):(2'h2)] ?
                      $signed(wire90) : (~wire92)))));
              reg97 <= $unsigned((-(wire91 ?
                  ((wire91 - reg96) == (!(8'hb0))) : wire92[(2'h3):(1'h1)])));
              reg98 <= wire88[(3'h5):(2'h2)];
              reg99 <= wire90;
            end
          reg100 <= ((8'hac) ?
              {$signed(wire92),
                  (~({wire91, reg99} ?
                      (wire89 != wire89) : $unsigned(reg95)))} : (&$signed($signed(((8'ha5) || (7'h43))))));
          if (((^~(-($unsigned(wire88) ? $unsigned((8'ha7)) : (~^reg93)))) ?
              (({(reg93 < wire90)} ?
                  reg99 : $signed($signed(wire90))) < reg95) : {((!reg94[(3'h7):(3'h5)]) ?
                      (!((8'hb4) - wire88)) : $unsigned({reg97, reg100}))}))
            begin
              reg101 <= reg94;
              reg102 <= (8'ha7);
            end
          else
            begin
              reg101 <= reg102[(4'hb):(4'h9)];
            end
        end
      if ($unsigned($signed(wire90[(4'h9):(2'h2)])))
        begin
          reg103 <= $unsigned((reg94 <<< ({$signed(wire88)} ?
              (((8'hb0) > reg93) && reg98) : wire92)));
          reg104 <= $signed((+$unsigned($signed((wire92 ? reg94 : wire91)))));
        end
      else
        begin
          reg103 <= $signed($unsigned({wire89[(2'h2):(1'h0)]}));
          if (reg96[(1'h1):(1'h0)])
            begin
              reg104 <= (8'hae);
            end
          else
            begin
              reg104 <= $signed((reg103[(5'h10):(3'h4)] ?
                  (($signed((8'hb2)) && {(8'hbd),
                      reg104}) <= $unsigned(reg102)) : (!$unsigned((^~reg97)))));
              reg105 <= (~&{$unsigned(reg103[(4'hd):(4'ha)])});
              reg106 <= (reg102[(4'hb):(3'h7)] ?
                  (~|$unsigned({(reg94 ?
                          wire90 : reg98)})) : reg100[(1'h0):(1'h0)]);
              reg107 <= ($signed((~^($signed(wire89) ^~ (~|reg100)))) - ((reg95 ?
                      (reg96[(1'h0):(1'h0)] ?
                          reg99 : reg103[(4'hf):(2'h2)]) : wire92[(4'ha):(2'h3)]) ?
                  wire88[(3'h6):(1'h1)] : wire88));
              reg108 <= ($signed(reg97[(1'h0):(1'h0)]) != (($unsigned((reg102 ?
                      reg107 : reg100)) ?
                  (~|(-reg98)) : ((wire92 <<< reg104) ?
                      {wire91, reg98} : $signed(reg106))) * wire91));
            end
          reg109 <= ($unsigned($signed(wire92[(2'h3):(1'h1)])) ?
              $unsigned(reg102[(4'hb):(3'h6)]) : ($unsigned(($signed((8'hb1)) + (reg100 ?
                  reg98 : reg103))) <<< $unsigned((&reg95))));
        end
      if (reg95)
        begin
          if ((($unsigned((reg99[(3'h7):(3'h5)] != $signed(reg107))) == reg102) ?
              ($signed($unsigned({reg100})) == (8'ha0)) : ($unsigned((^$unsigned(reg96))) ?
                  reg107 : (((reg97 < reg102) ?
                      reg109[(1'h1):(1'h0)] : $unsigned((8'ha8))) ^~ (reg98[(3'h6):(2'h2)] ?
                      ((8'ha7) ? reg108 : reg98) : (&wire88))))))
            begin
              reg110 <= (&wire88);
              reg111 <= reg93;
              reg112 <= $signed(reg104[(4'h8):(3'h5)]);
              reg113 <= ($unsigned($unsigned($signed($signed(reg107)))) ~^ $signed((&(^wire90[(1'h0):(1'h0)]))));
              reg114 <= ($unsigned({wire92,
                  (~((8'hb6) >= reg107))}) && (($unsigned($unsigned(reg105)) != ($unsigned((7'h41)) ?
                  {reg104,
                      reg99} : $signed(reg103))) >> $signed(((|(8'ha3)) || (wire88 > wire91)))));
            end
          else
            begin
              reg110 <= ((wire92[(3'h7):(3'h6)] != (reg99[(2'h2):(1'h0)] ?
                  $signed(reg103) : wire88[(3'h7):(3'h6)])) < (~^(+((reg97 <<< reg99) != $signed(wire90)))));
              reg111 <= reg112;
            end
          reg115 <= ($unsigned($unsigned(reg109)) + ((^reg109[(2'h2):(1'h1)]) ^~ {(|(^reg103)),
              reg113}));
          if ($unsigned($signed(wire88)))
            begin
              reg116 <= ((wire90[(1'h1):(1'h1)] | $unsigned((|(^reg105)))) ^ $unsigned((({(8'hba)} ?
                      {reg105} : reg111[(1'h0):(1'h0)]) ?
                  {{reg100, reg96}} : reg110)));
              reg117 <= ($unsigned(reg113) ^ $unsigned(wire89));
              reg118 <= {wire92, {(-($signed(reg112) - (8'hbe)))}};
              reg119 <= {((reg104[(4'hb):(2'h3)] | $unsigned((~|(8'hab)))) >= $unsigned({(reg101 - (8'hbf)),
                      (!wire88)}))};
              reg120 <= {(8'ha1), $signed($unsigned(wire89))};
            end
          else
            begin
              reg116 <= reg120;
              reg117 <= {reg119};
              reg118 <= $unsigned(((^~(7'h44)) >> (&$unsigned((&reg116)))));
            end
        end
      else
        begin
          if ($unsigned($unsigned((+(reg114 > wire91)))))
            begin
              reg110 <= $signed(((wire92 <= reg108) & (+reg113[(4'h9):(3'h4)])));
            end
          else
            begin
              reg110 <= ($unsigned($unsigned({$signed(reg104)})) >= wire90[(4'he):(4'hc)]);
              reg111 <= $signed(((reg94 ^ (reg110[(3'h7):(3'h5)] ?
                      $unsigned(reg93) : reg114[(3'h7):(3'h4)])) ?
                  {($unsigned(wire91) ?
                          $unsigned(reg112) : (~|(7'h43)))} : $signed(($unsigned(reg111) ?
                      (+reg102) : reg103))));
            end
        end
      if ($unsigned((^~$signed(reg105))))
        begin
          if (reg118)
            begin
              reg121 <= ((~&reg107[(3'h5):(3'h4)]) <= (!$unsigned(((^~reg94) & (reg98 ?
                  reg95 : wire89)))));
            end
          else
            begin
              reg121 <= $unsigned(reg100[(1'h0):(1'h0)]);
            end
          reg122 <= (!$signed(($signed($unsigned(reg97)) ~^ $unsigned((reg107 & reg94)))));
        end
      else
        begin
          reg121 <= (8'hbd);
          reg122 <= $unsigned(((({reg106} && reg122) || reg107) >= (reg121 << ($signed(reg103) ?
              reg111 : ((8'ha5) >= (8'hb1))))));
          if (($signed(((^reg95[(2'h2):(1'h0)]) & $unsigned((+reg114)))) >> $unsigned(reg119)))
            begin
              reg123 <= (((~^reg110[(3'h7):(1'h0)]) ?
                      reg113[(3'h6):(2'h2)] : $unsigned(reg118[(2'h3):(2'h3)])) ?
                  $unsigned($signed(reg112[(2'h3):(1'h1)])) : (^reg94[(1'h1):(1'h1)]));
              reg124 <= $unsigned({reg119, reg115});
              reg125 <= wire89;
              reg126 <= reg97[(1'h0):(1'h0)];
              reg127 <= reg117;
            end
          else
            begin
              reg123 <= ($unsigned($unsigned({$signed(reg101),
                  $signed(reg111)})) << $unsigned($unsigned({(^~reg127),
                  (8'hb6)})));
              reg124 <= ((~^($signed({reg96, (8'h9c)}) ?
                  (8'hb5) : ({(8'hab), wire89} ?
                      $unsigned((8'ha2)) : wire91[(4'hc):(4'hc)]))) < reg117);
              reg125 <= reg108[(3'h4):(2'h2)];
              reg126 <= reg100;
            end
          reg128 <= ($unsigned($signed((8'hbc))) ?
              (+(($unsigned(reg101) ? $unsigned(reg105) : $unsigned(reg127)) ?
                  (^{reg121}) : (((8'hb9) ? reg99 : (8'ha9)) ?
                      (8'hba) : {reg104}))) : $unsigned((|reg93[(3'h7):(3'h6)])));
        end
    end
  assign wire129 = reg127[(4'hd):(4'hc)];
  assign wire130 = reg109;
  assign wire131 = (~|(({(^~reg123)} ?
                       wire92 : reg128) && $unsigned($unsigned(((8'ha3) ?
                       reg109 : reg112)))));
  assign wire132 = $unsigned((^~($unsigned((reg113 ^ reg116)) + ({(8'ha7),
                           reg95} ?
                       $signed(reg99) : reg100))));
  assign wire133 = {(!($unsigned(reg102[(3'h6):(2'h3)]) ?
                           (((8'ha4) | reg113) != reg93[(4'h9):(2'h2)]) : ((+reg115) || reg93))),
                       ($unsigned({$signed(wire132)}) ?
                           {($signed(reg111) * (7'h41))} : (reg114[(1'h0):(1'h0)] ?
                               {reg128[(4'hb):(4'h8)],
                                   {wire129, reg100}} : ($unsigned(reg112) ?
                                   (reg115 << reg119) : $unsigned((8'hac)))))};
  assign wire134 = $signed(((reg121 ?
                       $signed((~^reg123)) : $signed($unsigned(wire132))) || ((^(reg128 || reg119)) && {(~|reg128),
                       (&reg106)})));
  always
    @(posedge clk) begin
      if (((~reg115[(4'h8):(3'h7)]) ^~ $unsigned((&reg112))))
        begin
          reg135 <= {(reg107[(2'h2):(1'h1)] ?
                  (^~$unsigned((reg128 ?
                      wire130 : reg117))) : (reg125[(1'h0):(1'h0)] >= reg128[(3'h7):(3'h5)]))};
          reg136 <= $signed({{{{reg125}, (reg94 ? reg114 : reg112)},
                  (~^(8'hbc))}});
          reg137 <= {$unsigned(reg103[(4'hc):(1'h1)]),
              ({reg123[(3'h6):(3'h5)],
                  $signed($signed(reg95))} <<< (($unsigned(wire92) ?
                      (reg116 >>> reg117) : reg126) ?
                  $unsigned(((8'hb4) != reg126)) : (8'hb5)))};
          reg138 <= ($unsigned(reg99) <<< reg103);
        end
      else
        begin
          reg135 <= {(^~(((&reg95) ?
                  wire130[(1'h1):(1'h0)] : (^reg103)) ~^ $unsigned(reg117[(1'h0):(1'h0)])))};
        end
      reg139 <= reg102;
    end
  assign wire140 = (8'hb3);
  always
    @(posedge clk) begin
      if (({reg117} ?
          reg110 : (reg135[(3'h5):(2'h3)] ?
              $unsigned(reg106) : $signed((((8'hab) ?
                  reg94 : reg139) - ((8'hb4) | reg137))))))
        begin
          if ($signed((~&$unsigned((!reg106[(2'h3):(2'h3)])))))
            begin
              reg141 <= (wire129[(2'h2):(2'h2)] || ((~{$signed(reg114),
                  (^reg138)}) * $signed((reg121 ?
                  (|wire92) : $signed(wire134)))));
              reg142 <= reg138[(1'h0):(1'h0)];
              reg143 <= reg125[(2'h3):(1'h0)];
            end
          else
            begin
              reg141 <= $signed(wire129);
              reg142 <= reg106;
              reg143 <= reg95;
              reg144 <= ($unsigned((|reg122[(2'h2):(1'h1)])) < reg97[(3'h5):(1'h1)]);
            end
        end
      else
        begin
          reg141 <= ({$unsigned((~&$unsigned(reg122))),
              (~|{(&reg99)})} + $signed($signed((^~wire89[(1'h0):(1'h0)]))));
          reg142 <= {(~|reg103[(3'h6):(1'h1)]),
              $signed({reg122[(3'h7):(1'h1)]})};
        end
      reg145 <= $signed(reg119[(4'h8):(2'h3)]);
      reg146 <= ($unsigned({reg108[(3'h4):(1'h1)]}) == $signed(reg109[(1'h0):(1'h0)]));
      reg147 <= $signed(((~(+(^~reg117))) >> (reg101[(4'he):(4'h8)] - (8'h9f))));
    end
  assign wire148 = ($signed(wire134) ?
                       reg120[(2'h2):(1'h0)] : $signed($unsigned(wire91[(4'ha):(4'h8)])));
  assign wire149 = wire90[(1'h0):(1'h0)];
  assign wire150 = (reg135 != $unsigned((^reg98[(3'h4):(1'h0)])));
  assign wire151 = wire130;
  assign wire152 = reg137;
  always
    @(posedge clk) begin
      reg153 <= {(($unsigned($unsigned(reg97)) ?
              reg123[(1'h0):(1'h0)] : $unsigned((reg126 ?
                  wire150 : wire140))) ^ reg109),
          {reg144[(1'h1):(1'h1)],
              $unsigned($unsigned((reg106 ? reg139 : wire129)))}};
      reg154 <= $unsigned(($signed(({wire131, wire129} ^~ $unsigned(reg147))) ?
          ($signed((reg94 || reg102)) != reg115) : $unsigned(($unsigned(reg99) ?
              (+(8'hbc)) : $signed(reg115)))));
    end
  assign wire155 = (^(!{reg100[(1'h1):(1'h0)], {{wire89, wire88}}}));
  assign wire156 = (wire131 ~^ (+(reg111[(3'h6):(2'h3)] ~^ (~^(reg136 & wire134)))));
  assign wire157 = $unsigned($unsigned(($signed((reg147 ? reg117 : reg114)) ?
                       wire131[(1'h1):(1'h0)] : $unsigned(reg127))));
  assign wire158 = {reg144[(3'h5):(1'h1)],
                       ({$unsigned(reg139[(1'h1):(1'h1)]),
                           ($signed(reg94) ?
                               {wire91, reg122} : (wire91 ?
                                   wire91 : wire92))} & $signed(((reg99 ?
                               wire156 : (8'hbe)) ?
                           (8'hb0) : (^reg135))))};
  assign wire159 = (~^($unsigned(((^reg113) ?
                       $signed(reg108) : (^reg97))) ^ reg97[(2'h3):(2'h3)]));
  assign wire160 = (|((|{$signed(reg105)}) ?
                       (|$unsigned($signed(reg118))) : $unsigned($signed((reg122 < reg137)))));
  assign wire161 = (((+reg147[(4'h8):(2'h3)]) ?
                       ($unsigned(wire90[(4'hb):(4'h8)]) ?
                           wire132 : reg124[(3'h4):(3'h4)]) : (^$signed((wire155 ?
                           wire160 : wire133)))) <<< (!$signed(((reg103 | reg108) ?
                       $signed(reg95) : (wire88 > wire150)))));
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire32;
  input wire signed [(5'h12):(1'h0)] wire31;
  input wire signed [(5'h11):(1'h0)] wire30;
  input wire [(3'h5):(1'h0)] wire29;
  input wire signed [(3'h4):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  assign y = {wire70,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
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
                 (1'h0)};
  assign wire33 = wire30;
  assign wire34 = (({(-wire32),
                      ((wire31 ?
                          wire31 : wire28) - wire30[(3'h4):(1'h1)])} != {$signed(wire33[(3'h4):(1'h0)]),
                      ($unsigned(wire30) ?
                          (wire29 ?
                              wire29 : wire30) : $signed((8'ha5)))}) - $signed(wire29[(2'h2):(1'h0)]));
  assign wire35 = $unsigned($unsigned((({wire31,
                      wire31} << wire29) >> wire34[(1'h1):(1'h0)])));
  assign wire36 = {wire31,
                      ((wire35 ?
                              (~^wire33[(3'h7):(3'h7)]) : wire29[(2'h2):(2'h2)]) ?
                          ($unsigned($signed(wire34)) ^~ $unsigned((8'h9d))) : wire34[(1'h1):(1'h1)])};
  assign wire37 = (8'hac);
  assign wire38 = wire34[(2'h2):(1'h0)];
  assign wire39 = $unsigned({(+wire36[(1'h1):(1'h1)]),
                      $signed({(wire28 ? wire31 : wire31)})});
  assign wire40 = (wire38 ?
                      {({wire39} ?
                              wire33 : ($unsigned((8'hba)) || (8'ha2)))} : (-wire30));
  assign wire41 = (((wire32 ?
                              wire39[(1'h0):(1'h0)] : ({wire40,
                                  wire36} <= (wire29 ? wire34 : wire38))) ?
                          wire32 : (wire31[(3'h5):(1'h0)] ?
                              wire31[(4'hd):(4'ha)] : wire39)) ?
                      (wire36[(3'h4):(2'h3)] >= wire32[(4'hf):(4'ha)]) : {($unsigned($unsigned((8'ha5))) - wire34[(1'h0):(1'h0)]),
                          $signed($signed($unsigned(wire33)))});
  assign wire42 = (($unsigned(($signed(wire37) & $unsigned(wire32))) ?
                          $signed(($signed((8'hb8)) ?
                              {(8'ha8)} : {wire39})) : (8'hb4)) ?
                      wire41 : ((+wire37) ?
                          {{$signed(wire28)}} : ((8'haa) * $unsigned($unsigned(wire33)))));
  assign wire43 = $signed((~{$unsigned((wire31 ? wire33 : (8'h9f)))}));
  always
    @(posedge clk) begin
      reg44 <= ((((8'hb0) << (^$signed(wire33))) ?
              ($signed($unsigned(wire37)) ^ (~&wire38)) : $signed({$signed(wire32)})) ?
          ({((wire37 ? wire36 : wire30) ? $signed(wire29) : $unsigned(wire33)),
              (((8'ha0) | wire37) && (~^wire40))} && (~^wire31)) : (~|wire33[(4'hc):(4'h8)]));
      if ($unsigned(wire42))
        begin
          reg45 <= $unsigned((wire42[(3'h4):(2'h2)] - (wire43 ^ wire37)));
          reg46 <= wire37;
        end
      else
        begin
          if ($signed((^~((((8'hb6) ? (8'ha5) : wire38) ?
                  ((8'hb0) + wire38) : (wire35 >>> (8'hb7))) ?
              reg44[(3'h7):(1'h1)] : wire30[(1'h1):(1'h1)]))))
            begin
              reg45 <= (!(($signed(wire30[(2'h3):(2'h3)]) ?
                      {$signed(reg45),
                          (wire34 ? reg45 : wire41)} : ($unsigned(wire30) ?
                          $unsigned(wire34) : wire28)) ?
                  wire33[(1'h1):(1'h1)] : wire38));
            end
          else
            begin
              reg45 <= wire33[(2'h2):(1'h0)];
              reg46 <= (~^(wire29[(2'h3):(2'h3)] ?
                  wire35[(3'h7):(3'h7)] : (!($signed(wire35) ^ {wire38}))));
              reg47 <= wire37[(3'h4):(2'h2)];
              reg48 <= ((-$signed(((!wire36) ?
                  (8'hba) : $unsigned((8'hbc))))) ^ wire40);
              reg49 <= wire28;
            end
          reg50 <= (-$signed(((~reg44[(2'h2):(2'h2)]) ^~ $signed((wire30 ?
              wire41 : reg49)))));
          reg51 <= $unsigned((7'h42));
          reg52 <= $signed((~|(reg51 > {$signed(reg50), $signed(reg46)})));
          reg53 <= wire31[(4'ha):(2'h3)];
        end
      reg54 <= (&((&{(~(8'hb6))}) != ($signed((wire38 >>> wire38)) ?
          $unsigned((reg52 ? wire40 : wire33)) : (wire37 >> reg51))));
    end
  always
    @(posedge clk) begin
      reg55 <= wire34[(1'h1):(1'h1)];
      reg56 <= ((wire34[(2'h2):(1'h0)] ?
          $unsigned(($signed(wire41) & (reg51 ~^ wire43))) : $signed((wire30 ?
              $signed(wire35) : $unsigned(wire30)))) ~^ reg44[(4'h9):(1'h0)]);
    end
  assign wire57 = (&(($signed($unsigned(wire32)) ?
                      (~$signed(wire42)) : reg47) <<< wire34));
  assign wire58 = (($signed($signed((^wire30))) != wire37) < reg56[(2'h3):(2'h3)]);
  assign wire59 = (8'hba);
  assign wire60 = (reg46[(1'h0):(1'h0)] ?
                      (~|($unsigned($unsigned(reg54)) | (8'h9f))) : $unsigned(reg50[(1'h1):(1'h1)]));
  assign wire61 = {$signed($unsigned(($unsigned(wire38) ?
                          $signed(reg50) : (&(8'ha4)))))};
  assign wire62 = wire35[(4'hb):(4'h9)];
  assign wire63 = ($signed({{((8'h9c) ^~ reg50), $signed(wire60)}}) ?
                      ($signed($signed(wire34[(1'h0):(1'h0)])) == (!$signed(wire59))) : reg44);
  assign wire64 = $unsigned($unsigned(wire39));
  always
    @(posedge clk) begin
      if ($unsigned((8'hb9)))
        begin
          reg65 <= (((~wire31) + wire61[(1'h1):(1'h1)]) - $signed($unsigned(((7'h42) | reg53))));
        end
      else
        begin
          reg65 <= $unsigned(wire36[(3'h4):(1'h1)]);
          reg66 <= {(wire29[(2'h2):(1'h1)] ?
                  wire60[(3'h4):(1'h0)] : (|reg45[(3'h4):(1'h1)])),
              $unsigned((((~&wire35) ?
                  (wire38 ? reg45 : wire31) : {reg49}) & (+(wire63 | reg65))))};
          reg67 <= (reg49[(2'h2):(1'h0)] ?
              (~&$unsigned($signed($unsigned(wire35)))) : $unsigned(($unsigned((wire43 ?
                      wire32 : reg46)) ?
                  (~|wire37[(1'h1):(1'h1)]) : {(~^wire59),
                      (reg46 ? reg52 : (8'hb1))})));
          reg68 <= ((8'haa) || $signed($signed(((wire35 < reg47) <= (wire59 ?
              reg56 : (8'ha6))))));
          reg69 <= {(((wire43[(3'h7):(3'h4)] * (reg50 ? (8'ha3) : reg52)) ?
                      (+(!(8'hb9))) : wire38) ?
                  (~$signed($signed(wire62))) : (~$unsigned(((8'hb8) ?
                      reg51 : wire40))))};
        end
    end
  assign wire70 = $unsigned(($signed(($unsigned(wire61) + reg53[(2'h2):(2'h2)])) ?
                      (wire62 ?
                          {$signed(reg56),
                              wire62[(3'h5):(2'h3)]} : $unsigned(wire31[(4'hd):(4'h8)])) : ((~|reg54) ?
                          (wire60[(1'h0):(1'h0)] >>> reg69[(4'h8):(3'h4)]) : {$signed((8'hae)),
                              (wire32 & reg65)})));
endmodule

module module218
#(parameter param258 = (((({(8'haf)} & (|(8'ha0))) > ((^(8'hb3)) ? (+(8'h9f)) : ((8'hb0) < (8'hbd)))) ? ((((8'hbc) > (7'h41)) - ((8'hae) << (8'h9f))) + ((+(8'hb7)) < ((8'ha9) > (7'h42)))) : (+(8'ha8))) ? ((~|{(+(8'ha5))}) && ({((8'hbd) != (7'h42))} ? (((8'hb5) ? (8'hb6) : (8'ha1)) && (~|(8'ha3))) : (((8'hbe) ? (8'hbe) : (7'h40)) >= ((8'hbb) ? (8'hb1) : (8'hae))))) : ((!{(8'h9e), (&(8'hbd))}) & (^~{(~(8'ha2))}))))
(y, clk, wire222, wire221, wire220, wire219);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire222;
  input wire signed [(2'h3):(1'h0)] wire221;
  input wire [(4'h8):(1'h0)] wire220;
  input wire signed [(4'ha):(1'h0)] wire219;
  wire [(4'h8):(1'h0)] wire257;
  wire signed [(3'h5):(1'h0)] wire256;
  wire [(4'h9):(1'h0)] wire255;
  wire [(4'h9):(1'h0)] wire254;
  wire signed [(3'h5):(1'h0)] wire253;
  wire [(2'h3):(1'h0)] wire241;
  wire [(5'h15):(1'h0)] wire230;
  wire [(5'h13):(1'h0)] wire229;
  wire signed [(4'ha):(1'h0)] wire228;
  wire [(3'h5):(1'h0)] wire227;
  wire [(5'h15):(1'h0)] wire226;
  wire [(5'h10):(1'h0)] wire225;
  wire signed [(3'h7):(1'h0)] wire224;
  wire signed [(3'h5):(1'h0)] wire223;
  reg [(4'hb):(1'h0)] reg252 = (1'h0);
  reg [(5'h13):(1'h0)] reg251 = (1'h0);
  reg [(4'h9):(1'h0)] reg250 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg249 = (1'h0);
  reg [(5'h15):(1'h0)] reg248 = (1'h0);
  reg [(5'h11):(1'h0)] reg247 = (1'h0);
  reg [(5'h12):(1'h0)] reg246 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg245 = (1'h0);
  reg [(5'h10):(1'h0)] reg244 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg243 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg242 = (1'h0);
  reg [(3'h6):(1'h0)] reg240 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg239 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg238 = (1'h0);
  reg [(2'h3):(1'h0)] reg237 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg236 = (1'h0);
  reg [(4'hf):(1'h0)] reg235 = (1'h0);
  reg [(4'he):(1'h0)] reg234 = (1'h0);
  reg [(5'h15):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg232 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg231 = (1'h0);
  assign y = {wire257,
                 wire256,
                 wire255,
                 wire254,
                 wire253,
                 wire241,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 (1'h0)};
  assign wire223 = ({{(^~$signed(wire219)),
                           (wire221 ? $signed(wire219) : wire222)},
                       $signed(($unsigned(wire219) ?
                           {wire219} : ((7'h41) >= wire219)))} - wire220[(1'h1):(1'h1)]);
  assign wire224 = ($signed($unsigned((!(wire220 >= (8'ha2))))) | wire220);
  assign wire225 = $unsigned(wire220);
  assign wire226 = wire222;
  assign wire227 = $signed(($unsigned((~|wire219[(1'h0):(1'h0)])) ?
                       $signed(wire225[(4'hd):(1'h0)]) : wire225[(4'h9):(2'h3)]));
  assign wire228 = (wire226 + $signed(wire225));
  assign wire229 = (wire224[(2'h2):(1'h0)] < $unsigned((wire226[(4'hf):(4'hf)] ?
                       ((~|wire228) <= $unsigned(wire221)) : {(wire220 | wire226),
                           (wire221 ? wire219 : wire222)})));
  assign wire230 = ({$unsigned((-wire219)), (8'hbb)} != ($signed(((wire228 ?
                           (8'hb5) : wire227) ^ $signed(wire220))) ?
                       wire221[(1'h0):(1'h0)] : ((!(wire227 ?
                               wire221 : wire219)) ?
                           wire227[(3'h5):(3'h5)] : {wire226})));
  always
    @(posedge clk) begin
      if (wire222)
        begin
          reg231 <= $signed($signed({($unsigned(wire222) ?
                  wire223 : $signed(wire229))}));
          reg232 <= wire223[(2'h2):(1'h1)];
        end
      else
        begin
          reg231 <= wire226;
          reg232 <= $signed((((8'had) + reg232) == wire225[(4'he):(2'h3)]));
          reg233 <= reg232[(4'h8):(3'h6)];
          if (({$signed(($signed(wire224) ?
                  (|reg232) : (^wire229)))} | {({$unsigned(wire229),
                  (~&wire225)} || $signed($unsigned(wire222)))}))
            begin
              reg234 <= (!$unsigned($unsigned(reg232[(5'h11):(3'h4)])));
            end
          else
            begin
              reg234 <= wire226[(1'h0):(1'h0)];
              reg235 <= wire224[(3'h4):(1'h1)];
              reg236 <= {$unsigned((wire221[(2'h2):(1'h1)] | wire220))};
            end
          reg237 <= (&$signed(({$unsigned(reg232),
              $signed(wire227)} ~^ $signed($signed((8'hb1))))));
        end
      reg238 <= $unsigned(($signed(($unsigned(reg233) ~^ (^wire223))) ?
          ((^$signed(reg233)) | ((~&wire227) ?
              $unsigned(wire230) : wire221[(1'h1):(1'h1)])) : (~^reg233)));
      reg239 <= (^~(-(($unsigned(wire225) <= (8'ha0)) != $signed({wire229}))));
      reg240 <= reg232;
    end
  assign wire241 = wire228;
  always
    @(posedge clk) begin
      if (wire241[(2'h2):(1'h1)])
        begin
          if ($unsigned($signed(((reg240 ?
              (&(8'hba)) : $signed(wire241)) <<< ((reg237 ? wire223 : wire221) ?
              (wire229 ? wire228 : (8'ha8)) : reg237[(1'h1):(1'h0)])))))
            begin
              reg242 <= reg232[(3'h6):(3'h5)];
              reg243 <= (wire221[(1'h1):(1'h1)] ?
                  {$signed({reg239})} : (reg231[(4'hb):(3'h5)] == $signed(reg233)));
              reg244 <= $signed((reg232 ?
                  {(~|((8'hb8) ? (8'hbf) : reg239))} : wire223[(1'h0):(1'h0)]));
            end
          else
            begin
              reg242 <= $signed((($signed({reg237, wire226}) ~^ wire226) ?
                  {reg234} : ($signed((+reg234)) >> $unsigned(reg242[(4'hd):(3'h4)]))));
              reg243 <= (8'hb1);
              reg244 <= reg243;
              reg245 <= $unsigned(reg234[(4'hb):(1'h0)]);
              reg246 <= {$signed($signed((reg238 ?
                      (!reg240) : $unsigned(reg239))))};
            end
          reg247 <= {wire225[(4'hd):(3'h6)]};
          reg248 <= $signed(({(^wire222),
              ((reg245 >>> reg232) ?
                  $signed(wire230) : $signed(wire221))} >>> (({reg243} ?
              $signed((8'hbf)) : (-wire227)) >>> {wire227})));
          reg249 <= (+reg234[(2'h3):(2'h2)]);
        end
      else
        begin
          reg242 <= ($signed(reg244) - $unsigned(reg232[(4'h8):(3'h7)]));
          if (reg248)
            begin
              reg243 <= {reg249};
            end
          else
            begin
              reg243 <= (^reg244[(2'h3):(1'h0)]);
              reg244 <= $unsigned((8'hb1));
              reg245 <= reg249;
              reg246 <= wire219[(3'h6):(3'h5)];
              reg247 <= (reg236[(2'h2):(2'h2)] ^ ((reg232[(4'hb):(1'h0)] >= (reg243[(1'h0):(1'h0)] ?
                  wire219 : $unsigned(wire225))) * wire241[(2'h3):(1'h1)]));
            end
        end
      reg250 <= $signed($signed((8'h9d)));
      reg251 <= $signed($unsigned(((reg245[(1'h0):(1'h0)] == reg246[(4'he):(3'h4)]) & wire223[(2'h2):(1'h0)])));
      reg252 <= (wire225 ?
          $signed($unsigned((wire227[(2'h3):(1'h1)] > $signed(wire229)))) : (8'hb1));
    end
  assign wire253 = (($unsigned($unsigned({reg245})) == reg246[(4'ha):(2'h2)]) != $signed(((!reg232) ?
                       $unsigned($unsigned(reg236)) : wire226[(4'hb):(1'h1)])));
  assign wire254 = ($unsigned(((reg243[(1'h0):(1'h0)] ~^ (~^reg249)) - reg236[(2'h2):(1'h0)])) ?
                       $unsigned(reg243) : $unsigned((&((wire220 || (8'ha1)) == (&wire220)))));
  assign wire255 = (-reg250[(3'h6):(2'h2)]);
  assign wire256 = $signed(({reg242[(4'ha):(3'h4)]} | reg234));
  assign wire257 = reg234;
endmodule
