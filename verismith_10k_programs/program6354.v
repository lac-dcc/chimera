module top
#(parameter param243 = (!((({(8'hb4), (8'hb4)} ~^ ((8'hbd) == (8'hb1))) ? {{(8'hbe)}, (~|(8'hbc))} : (((8'hb5) ? (8'hb7) : (8'hb7)) ? (8'hb6) : ((8'h9c) != (8'ha4)))) <= (((!(8'ha4)) ~^ ((8'h9e) ? (8'hb0) : (8'haf))) | (((8'h9c) >= (8'hb6)) ? (8'ha2) : ((8'haf) > (8'h9f)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire241;
  wire signed [(2'h3):(1'h0)] wire240;
  wire signed [(4'hd):(1'h0)] wire239;
  wire signed [(5'h15):(1'h0)] wire238;
  wire signed [(4'h8):(1'h0)] wire237;
  wire [(5'h14):(1'h0)] wire236;
  wire [(3'h6):(1'h0)] wire235;
  wire signed [(3'h6):(1'h0)] wire234;
  wire [(2'h3):(1'h0)] wire227;
  wire [(5'h12):(1'h0)] wire226;
  wire signed [(2'h3):(1'h0)] wire225;
  wire [(5'h15):(1'h0)] wire224;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire215;
  wire signed [(4'he):(1'h0)] wire217;
  wire signed [(3'h7):(1'h0)] wire221;
  wire signed [(3'h4):(1'h0)] wire222;
  reg [(5'h10):(1'h0)] reg233 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg232 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg231 = (1'h0);
  reg [(4'hf):(1'h0)] reg230 = (1'h0);
  reg [(4'he):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg228 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg218 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg220 = (1'h0);
  assign y = {wire241,
                 wire240,
                 wire239,
                 wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire5,
                 wire215,
                 wire217,
                 wire221,
                 wire222,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg218,
                 reg219,
                 reg220,
                 (1'h0)};
  assign wire5 = ((((~|(~|wire1)) ?
                         $unsigned(wire4[(3'h5):(2'h3)]) : wire1[(3'h5):(2'h3)]) ?
                     wire4[(2'h3):(2'h3)] : wire3) > (wire4 ^ $unsigned($unsigned((wire3 ?
                     wire1 : wire2)))));
  module6 #() modinst216 (wire215, clk, wire5, wire4, wire0, wire2);
  assign wire217 = wire0[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg218 <= {$signed({wire215, {$signed((8'ha9)), $unsigned((8'hb3))}})};
      reg219 <= (8'hb3);
      reg220 <= wire3;
    end
  assign wire221 = ({wire215,
                           (wire2[(5'h11):(2'h2)] == $unsigned((reg220 ^ (7'h40))))} ?
                       wire1[(1'h1):(1'h0)] : (reg219 < {((wire1 ?
                                   reg219 : (8'ha1)) ?
                               {wire5, (8'haa)} : $unsigned(wire1))}));
  module87 #() modinst223 (.wire90(reg218), .y(wire222), .wire91(wire221), .clk(clk), .wire89(wire4), .wire88(wire3));
  assign wire224 = $signed({$unsigned(wire3), wire1[(3'h4):(1'h1)]});
  assign wire225 = $signed(reg220);
  assign wire226 = (&$unsigned({((~&wire4) ?
                           (wire221 ? wire1 : wire0) : wire221[(1'h0):(1'h0)]),
                       (wire1 - wire3[(2'h2):(1'h0)])}));
  assign wire227 = $signed($unsigned($unsigned((&$unsigned(wire4)))));
  always
    @(posedge clk) begin
      if ($signed(wire224[(4'h8):(4'h8)]))
        begin
          reg228 <= {wire2[(4'hf):(2'h2)]};
          reg229 <= reg220[(5'h11):(4'h9)];
          reg230 <= reg219[(2'h2):(2'h2)];
          reg231 <= ((({wire227[(1'h1):(1'h1)]} ?
              $signed(wire3[(3'h5):(1'h0)]) : ((-wire4) ?
                  (^~wire226) : (~wire0))) || $unsigned(wire224)) ~^ (!reg220[(3'h5):(2'h3)]));
        end
      else
        begin
          reg228 <= $unsigned(wire225[(2'h3):(1'h1)]);
          reg229 <= wire2;
          reg230 <= (wire4 ? reg218 : reg218);
          reg231 <= $unsigned($signed(($unsigned(wire226) ?
              ($unsigned(wire221) ?
                  (~&wire215) : (~|reg230)) : (!(~wire224)))));
        end
      reg232 <= $signed((^~{wire217[(3'h5):(3'h5)], (~{reg218})}));
      reg233 <= (^$unsigned((^~((8'hb5) ? wire4 : reg228))));
    end
  assign wire234 = (reg230[(4'ha):(4'ha)] ?
                       {($unsigned((reg219 != wire2)) | {reg232[(1'h0):(1'h0)],
                               $signed(wire227)}),
                           ((reg228[(3'h6):(1'h1)] ?
                               (reg229 ?
                                   reg218 : wire1) : $unsigned(reg230)) & {wire5})} : $signed($signed(({(8'ha1)} <<< $unsigned(wire3)))));
  assign wire235 = ((wire222 ? reg233 : {$unsigned(wire4)}) ? wire224 : wire4);
  assign wire236 = wire222;
  assign wire237 = wire4[(3'h4):(3'h4)];
  assign wire238 = $unsigned(wire215);
  assign wire239 = (wire236 | ((((+wire222) ?
                           (wire1 ?
                               wire236 : wire225) : $unsigned(wire236)) >>> $unsigned(reg233)) ?
                       $signed((+(wire237 <<< wire215))) : ($unsigned((wire4 ?
                               reg230 : wire1)) ?
                           reg218[(1'h0):(1'h0)] : wire1[(3'h6):(3'h5)])));
  assign wire240 = $unsigned((wire235 ?
                       $signed(((&wire227) ?
                           wire238[(2'h2):(1'h0)] : wire5)) : $unsigned($unsigned((wire3 ?
                           wire227 : reg232)))));
  module87 #() modinst242 (wire241, clk, wire221, wire236, reg220, reg218);
endmodule

module module6
#(parameter param213 = ((~|(-(((8'ha7) >>> (8'hbd)) ? ((8'hb7) >>> (7'h40)) : ((8'ha7) ? (8'hbb) : (8'ha4))))) ? {((|((8'hb1) & (8'hba))) > ((~^(8'hac)) ? ((7'h40) < (8'ha9)) : ((7'h43) ? (8'hab) : (8'hb5)))), ({(!(8'ha2)), ((8'ha6) ? (8'hb5) : (8'hb3))} ? (-((8'hb0) ? (7'h43) : (8'hbe))) : (&(-(8'hb9))))} : (((((8'ha1) ? (8'hb7) : (8'hbf)) < ((8'hbe) ~^ (8'hbe))) && (((8'ha0) ? (8'ha7) : (8'ha2)) && ((7'h42) ? (8'hb3) : (7'h41)))) ? ((^~(!(8'ha2))) ? ({(8'hb8)} + ((8'hb3) ? (8'hac) : (8'hbb))) : (8'ha0)) : {(((8'hb3) ? (8'hab) : (8'had)) <= {(8'hb8)}), (((8'ha8) ^~ (8'hb4)) >> ((8'ha2) ? (8'hab) : (8'hb9)))})), 
parameter param214 = {(param213 >> ((^~(~|param213)) || ((-param213) - (~|param213)))), ((&{param213, (param213 ? param213 : (7'h41))}) ? (8'hb8) : (|(~|{param213, param213})))})
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire111;
  wire signed [(5'h12):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire164;
  wire signed [(5'h11):(1'h0)] wire166;
  wire [(3'h7):(1'h0)] wire167;
  wire [(2'h2):(1'h0)] wire168;
  wire signed [(4'hc):(1'h0)] wire193;
  wire [(4'h8):(1'h0)] wire211;
  reg signed [(5'h11):(1'h0)] reg169 = (1'h0);
  reg [(4'ha):(1'h0)] reg170 = (1'h0);
  reg [(5'h15):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg175 = (1'h0);
  reg [(3'h7):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg177 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg178 = (1'h0);
  reg [(4'hc):(1'h0)] reg179 = (1'h0);
  reg [(4'h9):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg182 = (1'h0);
  reg [(5'h15):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg187 = (1'h0);
  reg [(5'h12):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg192 = (1'h0);
  assign y = {wire84,
                 wire86,
                 wire108,
                 wire110,
                 wire111,
                 wire112,
                 wire113,
                 wire114,
                 wire164,
                 wire166,
                 wire167,
                 wire168,
                 wire193,
                 wire211,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 (1'h0)};
  module11 #() modinst85 (.wire13(wire7), .y(wire84), .wire16(wire9), .wire12((8'h9c)), .wire14(wire10), .wire15(wire8), .clk(clk));
  assign wire86 = (~&$unsigned({wire84[(3'h5):(1'h0)]}));
  module87 #() modinst109 (wire108, clk, wire9, wire8, wire84, wire10);
  assign wire110 = $unsigned(wire7[(1'h0):(1'h0)]);
  assign wire111 = (({wire84[(5'h12):(3'h4)],
                       $signed((wire10 ^~ wire10))} & $signed({$unsigned(wire9),
                       {wire84}})) >>> wire84[(2'h2):(1'h0)]);
  assign wire112 = (((((wire10 ? wire86 : (8'hb9)) ?
                                   ((8'hbb) ?
                                       wire7 : wire111) : (wire84 & wire7)) ?
                               wire86 : $signed((wire110 & (7'h43)))) ?
                           (((~wire7) ? {(8'hb3)} : wire86[(2'h2):(2'h2)]) ?
                               (wire108[(3'h5):(2'h2)] ~^ $signed(wire86)) : wire108[(4'ha):(4'h9)]) : ($unsigned({(8'hb6)}) <= (-$signed(wire10)))) ?
                       wire7[(4'hf):(1'h1)] : (~&wire84));
  assign wire113 = $signed((~&(wire110 << wire86[(1'h1):(1'h0)])));
  assign wire114 = (&wire10);
  module115 #() modinst165 (.wire119(wire112), .wire117(wire10), .clk(clk), .wire116(wire114), .y(wire164), .wire118(wire84));
  assign wire166 = ($unsigned({{(wire113 ? wire108 : (8'hba))},
                           wire10[(3'h4):(3'h4)]}) ?
                       (({wire8[(3'h6):(3'h4)],
                           wire84[(3'h6):(3'h4)]} || (wire7[(5'h14):(4'h8)] >> (wire110 ?
                           wire108 : wire113))) < ((^~wire84) ?
                           $signed($unsigned((8'ha9))) : wire114[(3'h5):(3'h5)])) : $signed(wire114[(3'h5):(2'h2)]));
  assign wire167 = wire108;
  assign wire168 = ((wire7[(4'h9):(1'h1)] ?
                       ($signed({wire167}) ?
                           {$unsigned(wire84)} : (-wire114)) : wire164[(2'h3):(2'h2)]) << {wire9});
  always
    @(posedge clk) begin
      reg169 <= ((~&($unsigned((wire8 ?
              wire10 : wire8)) || wire114[(5'h10):(4'hb)])) ?
          (~(wire10[(4'hb):(1'h0)] ?
              ($unsigned(wire84) ^ {(8'hb0)}) : $signed(wire86[(1'h0):(1'h0)]))) : wire8);
      if (wire164)
        begin
          if (((8'hae) ?
              $unsigned($unsigned({wire112,
                  (~|wire164)})) : ($unsigned(wire9) ^~ ({(wire166 | wire112),
                      $unsigned(wire86)} ?
                  wire110[(3'h7):(1'h1)] : $unsigned((!(8'had)))))))
            begin
              reg170 <= $signed(($unsigned(wire166[(1'h0):(1'h0)]) >= wire168));
            end
          else
            begin
              reg170 <= ($signed((wire111 ?
                  (~^$signed(wire164)) : $signed($unsigned(wire9)))) ~^ wire10[(3'h6):(3'h5)]);
              reg171 <= ({(wire114[(2'h3):(2'h2)] ?
                          $unsigned(((8'hac) - wire112)) : wire9),
                      (((wire9 ? wire10 : wire111) ?
                          wire166[(3'h7):(3'h5)] : $unsigned(wire167)) - ({wire110} && (wire168 * wire7)))} ?
                  $unsigned(($unsigned($signed(reg169)) ?
                      wire7[(5'h13):(2'h2)] : $unsigned(((8'ha6) ^ wire110)))) : (~^(^~$unsigned(wire167[(1'h0):(1'h0)]))));
              reg172 <= (wire113 ?
                  ((8'hbd) ?
                      $signed($signed({wire86,
                          wire112})) : wire108) : wire113[(3'h6):(2'h3)]);
              reg173 <= (~|(~&(~|reg172)));
              reg174 <= ((!(^wire9)) ^~ $signed((wire168 ?
                  reg173[(2'h2):(1'h1)] : (wire7[(5'h11):(4'he)] & (wire167 ?
                      wire8 : (8'hbd))))));
            end
          if ($unsigned(($unsigned({{wire108, wire112},
              wire166[(4'hc):(1'h0)]}) * reg171)))
            begin
              reg175 <= {(((((7'h43) || reg169) < wire7) ^~ ((wire84 | (7'h40)) * wire110)) ?
                      ((&{reg173, wire110}) ?
                          wire9[(4'ha):(2'h2)] : wire113[(3'h4):(3'h4)]) : $unsigned((~^$signed(wire114))))};
              reg176 <= ($unsigned($signed($signed($unsigned((8'ha0))))) ?
                  $unsigned($unsigned((^~$signed(reg172)))) : $unsigned((wire7 ?
                      ((8'ha7) || (reg173 ? wire7 : reg169)) : wire164)));
              reg177 <= reg172[(1'h0):(1'h0)];
            end
          else
            begin
              reg175 <= (^($unsigned(($signed(wire86) ?
                      wire8[(4'he):(4'ha)] : $signed(wire164))) ?
                  (|$unsigned((reg170 ?
                      reg176 : reg169))) : ((~(wire111 <= reg177)) + ((&reg175) ?
                      $unsigned(wire110) : wire110))));
              reg176 <= (~^((^($signed(wire86) > wire112)) ?
                  (+(((8'h9e) != reg174) ?
                      $signed(wire112) : (!(8'hb3)))) : (^{reg174[(4'hc):(2'h2)]})));
              reg177 <= $unsigned(($signed($signed({wire7})) > $signed($unsigned(reg170[(4'ha):(1'h1)]))));
              reg178 <= {{(reg169 & $unsigned((-wire108))),
                      (wire111[(4'hd):(1'h1)] == ((8'hab) ?
                          $unsigned(wire86) : (reg172 ? wire113 : (7'h40))))},
                  (~&({(wire84 ? reg177 : wire168), (~&wire164)} ?
                      wire112[(2'h2):(2'h2)] : ($unsigned(wire114) ?
                          $unsigned(wire108) : $unsigned(reg173))))};
              reg179 <= wire10;
            end
          if ((+(~|wire110)))
            begin
              reg180 <= (wire7[(4'h8):(2'h3)] ?
                  (~|$signed(reg175[(3'h6):(2'h3)])) : $signed($unsigned($signed($unsigned(reg173)))));
              reg181 <= wire111[(5'h13):(4'ha)];
              reg182 <= (~&$unsigned({{wire9, $signed(reg173)},
                  $unsigned({wire108, wire84})}));
              reg183 <= ((~|$signed(($signed(wire110) ?
                      (wire86 ^ (8'ha0)) : $signed((7'h44))))) ?
                  ((reg176 ? (~|$unsigned(reg182)) : reg173[(2'h3):(1'h1)]) ?
                      ($unsigned($signed(wire110)) <= wire114) : wire108) : reg174);
              reg184 <= (^~reg178);
            end
          else
            begin
              reg180 <= $signed({((((8'haf) >> wire86) ?
                          $signed(reg178) : ((8'hbe) + wire111)) ?
                      $signed(reg173) : ((reg182 ? reg173 : reg169) ^ {reg181,
                          (8'ha8)})),
                  (|$signed($signed((7'h42))))});
            end
          reg185 <= ((~^(&((8'ha5) >>> (reg182 | reg170)))) * reg179);
        end
      else
        begin
          if ({$unsigned(($unsigned({wire110, (7'h43)}) ?
                  wire110 : {((8'hb6) < reg170)}))})
            begin
              reg170 <= reg179[(2'h2):(2'h2)];
              reg171 <= {$signed(reg175)};
              reg172 <= ($unsigned($signed($unsigned((~^reg171)))) < (|reg181[(2'h2):(1'h1)]));
            end
          else
            begin
              reg170 <= $signed((!reg175[(4'hc):(4'ha)]));
              reg171 <= $signed(($unsigned(((wire110 ?
                      (8'hbd) : wire167) != wire114[(3'h4):(2'h2)])) ?
                  (8'h9f) : reg183[(4'hb):(1'h1)]));
              reg172 <= (-reg171);
              reg173 <= ($signed($signed(wire167[(1'h0):(1'h0)])) ?
                  wire7 : $signed({reg171[(4'hc):(4'hc)], (7'h43)}));
              reg174 <= $unsigned((((wire164 ? reg170 : {wire108}) ?
                      (+{reg174}) : ((wire84 ? reg185 : (7'h42)) ?
                          (-wire114) : (8'hac))) ?
                  (-{reg174[(4'h9):(3'h6)],
                      $unsigned(reg173)}) : (+reg178[(3'h7):(1'h0)])));
            end
          reg175 <= reg181;
        end
      reg186 <= ((wire168 ? (~^$signed({(8'ha3)})) : wire110) ?
          $signed($signed((~|wire166))) : $signed((&((~&wire167) >> ((8'hbe) ?
              reg183 : reg171)))));
      if ({$unsigned((^~(wire111[(4'hd):(4'h8)] ~^ wire7)))})
        begin
          if ((&reg170[(4'ha):(2'h2)]))
            begin
              reg187 <= $signed(($unsigned((|$signed(reg174))) ?
                  (reg171[(4'hf):(4'he)] || (8'hbe)) : reg183[(4'ha):(1'h0)]));
              reg188 <= (reg171[(5'h13):(2'h2)] ?
                  wire168 : $unsigned((&(reg179[(3'h5):(1'h0)] ?
                      {wire110} : reg179[(3'h5):(2'h2)]))));
              reg189 <= wire84[(4'ha):(2'h3)];
              reg190 <= $unsigned({wire7[(4'he):(4'h8)]});
            end
          else
            begin
              reg187 <= ($signed(wire7) ? reg178[(4'h8):(4'h8)] : reg170);
              reg188 <= (reg187[(5'h12):(4'hf)] & ($unsigned(((wire111 ?
                      reg172 : reg184) ?
                  (reg187 ? reg174 : (8'had)) : (&wire113))) ^~ {reg178}));
              reg189 <= (&wire114[(3'h7):(3'h4)]);
            end
          reg191 <= reg171;
        end
      else
        begin
          if ($unsigned(($signed(({(8'hac)} ? reg177 : $unsigned(reg183))) ?
              (((reg190 ? (8'ha0) : reg188) ?
                  $unsigned(reg177) : (^~reg171)) == $unsigned($unsigned(wire111))) : ({$unsigned((8'ha2)),
                  wire112[(4'hf):(3'h5)]} & reg172[(1'h1):(1'h1)]))))
            begin
              reg187 <= wire167[(1'h0):(1'h0)];
              reg188 <= reg190;
              reg189 <= (&($unsigned((8'ha0)) ?
                  $signed((~^wire164[(1'h1):(1'h1)])) : reg170));
              reg190 <= reg174[(4'hb):(4'h9)];
            end
          else
            begin
              reg187 <= ((reg178[(3'h4):(1'h1)] - (wire8[(3'h7):(1'h0)] ?
                      (wire86[(1'h0):(1'h0)] && (wire86 >>> wire110)) : $unsigned((~|reg178)))) ?
                  (&({(!wire84)} & ((reg190 < wire8) ?
                      (wire166 ?
                          (8'ha4) : reg186) : (wire167 >>> wire9)))) : $unsigned(({$unsigned(wire111),
                          (8'hb0)} ?
                      (~$signed(reg177)) : $signed($unsigned((7'h43))))));
              reg188 <= (reg190[(2'h3):(1'h0)] ?
                  (~^(reg182[(4'h9):(2'h2)] ?
                      $signed((wire168 ~^ reg175)) : $signed((|reg189)))) : ($signed(reg188) && $signed($signed((wire84 * reg182)))));
              reg189 <= $unsigned(wire9);
              reg190 <= (reg171[(3'h4):(3'h4)] != ((^(8'ha7)) ?
                  $signed(($unsigned(reg182) >= reg175)) : (8'hbb)));
            end
          reg191 <= $signed($unsigned({reg186[(1'h0):(1'h0)],
              ((^~reg169) ? {reg175, wire111} : (|wire111))}));
          reg192 <= (($signed((8'had)) ?
                  $unsigned((^$unsigned(reg173))) : $signed((+$signed(reg179)))) ?
              $unsigned($signed((reg186 && wire112))) : (($unsigned($unsigned(wire110)) <<< {$unsigned(wire110)}) == reg180[(4'h8):(1'h1)]));
        end
    end
  assign wire193 = wire112;
  module194 #() modinst212 (wire211, clk, wire166, wire110, reg172, wire9);
endmodule

module module194
#(parameter param209 = (8'ha3), 
parameter param210 = (((({(8'ha8), param209} ? param209 : {(8'hb3)}) ? {(+param209)} : param209) ? {(param209 ? param209 : param209), (8'ha1)} : (({param209, param209} ? (8'hbd) : (param209 <<< param209)) ? param209 : (param209 ? param209 : (param209 ? param209 : param209)))) >> (!param209)))
(y, clk, wire198, wire197, wire196, wire195);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire198;
  input wire [(5'h13):(1'h0)] wire197;
  input wire [(4'h9):(1'h0)] wire196;
  input wire [(4'ha):(1'h0)] wire195;
  wire [(4'hd):(1'h0)] wire208;
  wire signed [(5'h13):(1'h0)] wire207;
  wire [(5'h11):(1'h0)] wire206;
  wire [(5'h11):(1'h0)] wire205;
  wire [(4'hb):(1'h0)] wire201;
  wire [(3'h7):(1'h0)] wire200;
  wire [(5'h12):(1'h0)] wire199;
  reg signed [(5'h12):(1'h0)] reg204 = (1'h0);
  reg [(5'h11):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg202 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire201,
                 wire200,
                 wire199,
                 reg204,
                 reg203,
                 reg202,
                 (1'h0)};
  assign wire199 = (wire198 ?
                       $unsigned({wire196[(3'h5):(3'h5)],
                           wire197[(4'h8):(3'h6)]}) : wire197);
  assign wire200 = wire197[(4'hb):(4'ha)];
  assign wire201 = $signed(wire196);
  always
    @(posedge clk) begin
      reg202 <= (wire195 ?
          ((((wire196 ?
              wire198 : wire197) != (wire196 + wire200)) <<< ($signed(wire197) > {wire197,
              (8'hb6)})) | wire200[(1'h0):(1'h0)]) : ((8'hb4) - wire198));
      reg203 <= ((+$signed($unsigned($unsigned(wire201)))) ?
          $signed($signed(wire196)) : ($unsigned($unsigned((wire199 ^ wire200))) ?
              reg202 : wire201));
      reg204 <= wire197;
    end
  assign wire205 = wire200;
  assign wire206 = ($unsigned(wire196[(2'h2):(1'h0)]) ?
                       (|wire199[(4'hc):(2'h3)]) : {$unsigned($unsigned((wire199 ?
                               wire199 : (8'hbd))))});
  assign wire207 = (^~((wire200 * wire205[(1'h0):(1'h0)]) <<< $signed((-((8'haa) ?
                       wire197 : wire201)))));
  assign wire208 = wire200;
endmodule

module module115
#(parameter param163 = {(((~(!(8'hb2))) ? (((8'hbe) == (8'hb3)) ? ((8'ha6) ? (8'haf) : (8'hbd)) : (8'h9f)) : ({(8'ha6)} || ((8'hb4) ? (8'hbe) : (8'ha9)))) & ((^~((8'hb4) | (7'h43))) ? (-((8'ha1) * (7'h42))) : (((8'hae) ? (8'ha7) : (8'ha7)) | (^~(8'haa))))), {{(((8'hb7) ~^ (8'hb5)) >= ((8'hb3) == (7'h44)))}, {(((8'hbf) ? (8'haa) : (8'ha5)) ? {(8'ha9)} : ((8'hae) | (8'ha4)))}}})
(y, clk, wire119, wire118, wire117, wire116);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire119;
  input wire signed [(2'h3):(1'h0)] wire118;
  input wire signed [(5'h10):(1'h0)] wire117;
  input wire [(5'h12):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire161;
  wire signed [(4'h8):(1'h0)] wire160;
  wire [(4'h8):(1'h0)] wire159;
  wire signed [(5'h11):(1'h0)] wire158;
  wire signed [(2'h3):(1'h0)] wire155;
  wire signed [(3'h6):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire130;
  wire [(4'hc):(1'h0)] wire121;
  wire [(4'hc):(1'h0)] wire120;
  reg [(4'hd):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg157 = (1'h0);
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg152 = (1'h0);
  reg [(4'hb):(1'h0)] reg151 = (1'h0);
  reg [(3'h5):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg149 = (1'h0);
  reg [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire155,
                 wire131,
                 wire130,
                 wire121,
                 wire120,
                 reg162,
                 reg157,
                 reg156,
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
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire120 = wire119[(4'h9):(4'h8)];
  assign wire121 = wire116;
  always
    @(posedge clk) begin
      reg122 <= (wire117[(3'h4):(2'h2)] ? (8'hbe) : wire120);
      reg123 <= $signed(($unsigned((8'hb1)) ?
          (wire121 ?
              $signed({wire119, wire116}) : ({wire116, wire117} || (wire116 ?
                  wire120 : wire118))) : ($unsigned((+wire121)) << $unsigned((&(8'h9c))))));
      if (({(wire116[(4'hc):(4'h9)] ?
              ((~reg123) ?
                  (reg123 ^~ wire117) : $unsigned(wire116)) : ((^wire117) ?
                  ((8'hbb) != reg122) : {reg123}))} >= (($unsigned((wire118 ^~ wire121)) ^~ (|$unsigned(wire116))) ?
          $signed(((~wire118) ?
              (wire119 ?
                  wire117 : (8'hab)) : ((8'hb2) >= (8'hbf)))) : wire118)))
        begin
          if (wire121[(4'h9):(3'h6)])
            begin
              reg124 <= (wire117[(4'h9):(4'h9)] ?
                  (reg123 ?
                      (~|($signed(reg123) ?
                          $unsigned((8'hbc)) : $unsigned((8'hb1)))) : wire119[(2'h2):(2'h2)]) : (8'ha3));
            end
          else
            begin
              reg124 <= reg123[(2'h3):(1'h1)];
              reg125 <= $signed($unsigned((~(&$unsigned(wire118)))));
              reg126 <= {wire119, {reg122[(3'h5):(3'h4)]}};
              reg127 <= $unsigned((~|reg122));
            end
        end
      else
        begin
          reg124 <= $signed((wire116 ?
              $unsigned(($unsigned(reg124) ^~ (reg122 * reg127))) : $unsigned((reg125 ?
                  $unsigned(wire121) : (reg123 ? (8'hb2) : reg123)))));
          reg125 <= $unsigned(reg127[(2'h2):(1'h0)]);
          reg126 <= wire116[(3'h7):(3'h7)];
          reg127 <= $signed($unsigned(reg127[(3'h4):(1'h0)]));
          reg128 <= (reg126[(2'h3):(1'h1)] ^~ $unsigned(wire119[(3'h7):(3'h4)]));
        end
      reg129 <= $unsigned((8'ha0));
    end
  assign wire130 = wire121[(4'h8):(3'h4)];
  assign wire131 = ($signed($unsigned(wire121[(2'h2):(1'h1)])) ?
                       wire119[(1'h1):(1'h1)] : reg124);
  always
    @(posedge clk) begin
      if ($unsigned(reg122[(5'h13):(3'h7)]))
        begin
          reg132 <= $unsigned({$signed((((8'hb7) << reg128) ?
                  (reg122 ? reg122 : wire120) : $signed(reg129)))});
          reg133 <= ((~|reg132[(1'h1):(1'h1)]) != wire118[(2'h2):(2'h2)]);
          reg134 <= ($signed((wire121 >= reg128)) + (|$signed(reg129)));
          reg135 <= $unsigned((~(~$unsigned((wire120 ? reg126 : (8'hae))))));
          reg136 <= {{$unsigned(($unsigned(reg123) | (reg126 <= reg123))),
                  (wire121 >>> $unsigned($signed(reg128)))}};
        end
      else
        begin
          reg132 <= ((reg125 ?
              $unsigned(reg127[(1'h0):(1'h0)]) : (+$unsigned(wire118))) ^~ $signed(wire116));
          reg133 <= ((^wire117) >>> reg124);
          if ($unsigned($unsigned($signed($signed($unsigned(wire131))))))
            begin
              reg134 <= reg134[(2'h2):(1'h1)];
              reg135 <= (^~{((~&(reg129 <<< reg125)) ?
                      wire120[(4'hb):(4'ha)] : wire117),
                  $signed(wire117[(4'hb):(3'h7)])});
              reg136 <= reg136;
              reg137 <= (^$unsigned(wire116));
            end
          else
            begin
              reg134 <= $unsigned({reg129[(4'h8):(2'h3)],
                  ((8'hbf) | (+{wire120, reg122}))});
              reg135 <= (wire119[(4'hd):(3'h7)] ?
                  (-(wire121 <<< ({(8'ha5),
                      reg137} && $signed(wire119)))) : $signed($unsigned((reg133 || {wire120,
                      reg125}))));
            end
        end
      reg138 <= (($unsigned(($signed(reg137) ?
              $signed((8'h9c)) : ((8'hb9) & reg123))) == wire117) ?
          ((-($unsigned((8'hb3)) >>> (wire118 ^ reg136))) ?
              reg128 : reg129[(1'h0):(1'h0)]) : (~((((8'hb0) ?
              wire130 : wire130) - $unsigned(wire116)) ~^ reg126)));
    end
  always
    @(posedge clk) begin
      if ((((|$signed((reg138 == (8'hb4)))) && reg136[(1'h1):(1'h0)]) ?
          $signed($signed($unsigned(reg125))) : (reg133[(3'h6):(1'h1)] == ((reg137[(3'h5):(1'h0)] << {reg132,
                  reg132}) ?
              ((^reg128) << reg122) : wire130))))
        begin
          reg139 <= $unsigned((($unsigned(reg122[(2'h2):(1'h0)]) ?
              ((wire119 & (8'ha2)) ?
                  (wire130 && wire119) : $unsigned(reg136)) : reg124[(3'h4):(2'h2)]) == (reg137 ?
              $signed((wire130 ? wire116 : wire130)) : reg136[(2'h3):(1'h0)])));
          reg140 <= {(((wire121 ?
                      reg133[(3'h4):(3'h4)] : $unsigned(reg134)) > ({reg137,
                          reg139} ?
                      $signed(reg134) : $unsigned((8'hb1)))) ?
                  ($unsigned(reg138) ?
                      $unsigned(((8'hbf) ?
                          (8'ha4) : wire131)) : ({reg127} >>> (wire121 ?
                          reg138 : reg133))) : $signed($unsigned((reg137 <<< (8'hb6)))))};
          if (reg124[(1'h0):(1'h0)])
            begin
              reg141 <= (reg132 ?
                  ({reg128[(2'h3):(2'h2)]} >= $unsigned($unsigned((reg125 | (8'hbf))))) : $unsigned(reg139[(2'h2):(1'h1)]));
              reg142 <= (!reg127[(1'h1):(1'h0)]);
            end
          else
            begin
              reg141 <= $unsigned((wire120[(1'h0):(1'h0)] ?
                  reg128 : (-{reg127})));
              reg142 <= (reg142 ?
                  reg128 : (reg137 - (wire116[(4'ha):(3'h7)] ?
                      {$unsigned(reg133),
                          {reg137, reg133}} : (^~$signed(reg140)))));
              reg143 <= reg135;
            end
          reg144 <= wire121;
          if (($signed((reg127 || (reg129 ?
              reg134[(1'h0):(1'h0)] : ((8'h9d) ?
                  wire118 : reg139)))) >>> (~|((|((8'hb3) ?
              (8'ha6) : reg132)) >> reg141[(2'h3):(1'h1)]))))
            begin
              reg145 <= (reg141[(1'h0):(1'h0)] ?
                  (+$unsigned(($unsigned((8'hbd)) <<< $unsigned(reg124)))) : reg124);
              reg146 <= $unsigned(wire119[(4'he):(3'h5)]);
              reg147 <= reg140[(4'he):(4'ha)];
              reg148 <= $unsigned(reg128[(2'h3):(1'h0)]);
              reg149 <= reg133;
            end
          else
            begin
              reg145 <= wire130[(1'h1):(1'h0)];
              reg146 <= $signed(((($unsigned((8'hb3)) ?
                  reg127 : (reg122 ?
                      reg129 : reg124)) - {$unsigned(reg141)}) ^~ $unsigned(((|reg127) ^~ $unsigned(wire116)))));
            end
        end
      else
        begin
          reg139 <= reg137[(3'h4):(2'h2)];
          reg140 <= $signed(reg137);
          if ($signed(reg139))
            begin
              reg141 <= (~|$unsigned($unsigned((8'hb5))));
            end
          else
            begin
              reg141 <= $signed({$unsigned((|$signed(reg129))), (7'h40)});
              reg142 <= reg132[(1'h0):(1'h0)];
              reg143 <= ((8'ha8) ^ (-$signed($signed(wire116))));
              reg144 <= (wire118 ?
                  ($unsigned((7'h41)) ?
                      (^~$signed((reg124 ?
                          wire117 : (8'ha1)))) : (~^((~(8'hb5)) << (reg149 - reg124)))) : $signed($unsigned(reg134)));
              reg145 <= ($unsigned(reg132[(1'h0):(1'h0)]) ?
                  (~^$signed(wire120[(3'h5):(1'h0)])) : (^(-(|reg143[(2'h2):(2'h2)]))));
            end
          if ((~^(reg146 != reg125[(5'h14):(5'h14)])))
            begin
              reg146 <= $signed($signed(($signed((reg125 ? reg125 : reg125)) ?
                  $unsigned($signed(reg136)) : {reg147[(4'hd):(4'hd)]})));
              reg147 <= $signed($unsigned((^reg148)));
              reg148 <= reg146[(2'h2):(2'h2)];
            end
          else
            begin
              reg146 <= (($unsigned(({reg145} >= $unsigned(wire131))) ?
                  (-$unsigned((reg122 ?
                      reg149 : (8'ha7)))) : (~&$unsigned((reg127 ?
                      wire119 : (8'ha8))))) - (~{{{reg146}}}));
              reg147 <= $unsigned(wire117[(1'h0):(1'h0)]);
              reg148 <= $unsigned(((reg145[(2'h2):(1'h0)] ?
                  $signed((reg126 ?
                      (8'ha1) : reg140)) : (reg138[(1'h1):(1'h1)] ?
                      $signed((8'hb1)) : ((7'h44) ?
                          reg138 : reg145))) >> {wire131}));
              reg149 <= (wire120[(4'h8):(4'h8)] ?
                  $signed(($signed($signed(reg143)) ?
                      $unsigned((7'h44)) : {(reg148 & (8'ha9))})) : (8'haa));
              reg150 <= reg126;
            end
          reg151 <= reg138[(2'h2):(1'h1)];
        end
      reg152 <= {($signed($unsigned(reg126[(3'h5):(3'h4)])) ? (7'h42) : reg133),
          ({reg140} ?
              (reg145 ?
                  ((-(8'hba)) - $unsigned(reg128)) : reg134) : ((~^(reg125 ?
                      wire120 : reg125)) ?
                  (~|reg143[(2'h2):(2'h2)]) : ((reg134 ? reg139 : wire120) ?
                      (~&reg133) : reg144)))};
      reg153 <= (&(^$unsigned(reg142[(3'h6):(1'h1)])));
      reg154 <= (^({reg122} != reg140[(2'h3):(1'h1)]));
    end
  assign wire155 = $signed($unsigned($signed($unsigned((8'hb3)))));
  always
    @(posedge clk) begin
      reg156 <= ({($unsigned((reg153 ^ reg149)) ^ $signed(reg123[(4'ha):(3'h4)]))} >>> $unsigned((^$signed($signed((8'hb1))))));
      reg157 <= $unsigned(reg154[(3'h4):(3'h4)]);
    end
  assign wire158 = ($unsigned({$unsigned(reg153[(4'hc):(4'h9)])}) < {wire117[(4'hb):(2'h2)]});
  assign wire159 = $unsigned((8'hb8));
  assign wire160 = {$unsigned($unsigned(((8'hab) ?
                           wire130 : reg153[(5'h10):(3'h5)])))};
  assign wire161 = (!$unsigned({($signed(wire131) ?
                           $unsigned(reg122) : $unsigned(reg122)),
                       (&wire155[(1'h1):(1'h0)])}));
  always
    @(posedge clk) begin
      reg162 <= (reg150 > ((wire160 << $signed({wire118,
          reg136})) < ($unsigned((reg147 <= reg144)) ?
          (~^(reg141 ? (8'hbc) : reg128)) : $signed(reg148))));
    end
endmodule

module module87  (y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire91;
  input wire signed [(4'h9):(1'h0)] wire90;
  input wire [(5'h12):(1'h0)] wire89;
  input wire signed [(5'h12):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  wire [(4'hc):(1'h0)] wire105;
  wire [(3'h6):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire103;
  wire [(3'h5):(1'h0)] wire102;
  wire [(5'h11):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire92;
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire92 = $unsigned((|wire91[(2'h3):(2'h3)]));
  assign wire93 = $signed(((^~((wire90 << wire88) ?
                      (wire91 + (8'hb1)) : wire91[(3'h7):(1'h1)])) - (~($unsigned(wire91) ?
                      wire89[(5'h12):(4'h9)] : (wire89 > (8'hb0))))));
  assign wire94 = wire90[(3'h6):(2'h2)];
  assign wire95 = {$unsigned($signed(wire88)),
                      $unsigned((wire89[(4'ha):(4'h9)] != (~&{wire90,
                          wire89})))};
  assign wire96 = wire90;
  assign wire97 = wire96[(3'h4):(3'h4)];
  assign wire98 = ($unsigned((~&$signed($signed((8'hb7))))) || ({({wire97} ?
                          ((8'hbe) >= wire96) : wire97),
                      ($signed(wire88) ?
                          (&wire93) : {wire92, wire90})} == wire88));
  always
    @(posedge clk) begin
      reg99 <= (wire94 ?
          (|wire97) : $signed($unsigned(($unsigned((8'ha9)) == wire95))));
      reg100 <= $unsigned((~&(wire97 ?
          $signed((wire97 ? wire88 : wire98)) : (((8'hb1) > (8'hbd)) ?
              $signed(wire90) : wire95[(2'h2):(2'h2)]))));
    end
  assign wire101 = ({wire93,
                           ((|$signed((8'hb1))) ?
                               $signed(((8'ha8) ?
                                   wire98 : wire89)) : $unsigned($unsigned(wire88)))} ?
                       ({wire90[(4'h8):(3'h7)]} ?
                           ({$unsigned(wire92)} + (~$signed(wire97))) : (|$unsigned((+wire89)))) : $signed({{$unsigned((8'hb3))}}));
  assign wire102 = $signed((+(8'haf)));
  assign wire103 = $signed(wire98[(5'h10):(4'he)]);
  assign wire104 = (~$unsigned(($signed($unsigned(reg99)) ?
                       wire89[(4'hc):(4'hb)] : $unsigned($signed(wire102)))));
  assign wire105 = (&(~^({(wire104 ? wire103 : wire89),
                       {wire90}} > ($signed(wire92) ?
                       wire91 : $signed(wire97)))));
  assign wire106 = (8'ha5);
  assign wire107 = wire101[(4'hb):(3'h5)];
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h2b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire14;
  input wire [(5'h11):(1'h0)] wire13;
  input wire signed [(3'h6):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  assign y = {wire83,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire62,
                 wire61,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= ($signed(wire12[(2'h2):(2'h2)]) >= ((($signed(wire16) ?
              (-wire12) : wire16) ?
          ({(7'h40),
              wire15} || {wire12}) : wire13[(4'ha):(3'h7)]) > ($unsigned($signed(wire16)) >>> ((~^wire15) ?
          wire12[(1'h0):(1'h0)] : $unsigned(wire14)))));
      reg18 <= $signed(((wire12[(2'h2):(1'h0)] * $signed((reg17 != wire16))) ?
          ($unsigned($signed(wire12)) ?
              reg17[(2'h3):(2'h2)] : $unsigned((8'ha0))) : {(wire13 >> (wire14 ?
                  wire14 : (8'hb9))),
              ($signed(wire13) & (~|(8'hb8)))}));
      reg19 <= $unsigned(wire15);
    end
  assign wire20 = (reg18[(1'h0):(1'h0)] ?
                      wire15[(4'h9):(4'h8)] : ((reg17[(2'h2):(1'h1)] <= $signed(((8'hb2) < reg18))) ?
                          $unsigned(reg17) : $signed((-((8'hac) ?
                              (8'haf) : wire15)))));
  assign wire21 = reg17;
  assign wire22 = {($signed(((wire21 - reg17) ?
                              (wire13 ? wire21 : reg17) : (wire13 ?
                                  wire21 : wire20))) ?
                          ($unsigned((&wire14)) < ((^wire15) ?
                              wire13[(4'hf):(4'he)] : {reg19,
                                  wire13})) : wire15[(4'ha):(2'h3)]),
                      $unsigned($unsigned(((&(8'hb5)) ?
                          $unsigned((8'hbd)) : ((8'ha5) ? reg18 : (8'hb7)))))};
  assign wire23 = (8'ha9);
  assign wire24 = (7'h41);
  assign wire25 = $signed((|wire20[(2'h3):(1'h0)]));
  assign wire26 = (8'hbc);
  assign wire27 = {(-wire15),
                      (wire23[(3'h6):(2'h2)] - {($signed(reg18) & $signed(reg19))})};
  assign wire28 = $signed((~wire16));
  assign wire29 = $unsigned(((~{{wire13}, wire28}) ?
                      $unsigned((wire20[(4'h8):(2'h3)] ?
                          wire26 : $signed(reg17))) : wire12));
  always
    @(posedge clk) begin
      reg30 <= (({(~|$signed((8'ha2)))} ?
              ($unsigned(reg17[(4'h8):(3'h4)]) == ((wire23 >> wire26) ^~ wire12)) : $signed(((+reg17) <= reg19))) ?
          wire25 : wire23[(3'h6):(3'h4)]);
      if (((wire15[(3'h5):(1'h0)] ? wire14 : wire14) ?
          $signed({((8'hba) - $unsigned(wire21)),
              $signed((wire20 ? wire29 : wire16))}) : wire25))
        begin
          if ($unsigned(wire15))
            begin
              reg31 <= ({$unsigned((~^wire20))} ~^ $unsigned((wire24[(1'h0):(1'h0)] << ($signed((8'hb3)) ?
                  $unsigned(wire26) : reg18))));
              reg32 <= (~^{($unsigned({(8'ha3)}) || (~|(wire14 ^~ (8'hb5))))});
              reg33 <= (($signed($signed($signed(wire16))) >= (~wire27[(1'h1):(1'h0)])) > (~&(~^wire23)));
              reg34 <= wire26;
            end
          else
            begin
              reg31 <= $signed((({(&wire12)} ?
                      wire16[(5'h13):(4'h8)] : ((!reg17) ?
                          wire27[(3'h4):(1'h0)] : wire25[(4'h9):(4'h8)])) ?
                  $signed(wire29) : $unsigned($unsigned(wire20))));
              reg32 <= reg17[(4'hc):(4'hc)];
              reg33 <= $unsigned($unsigned($unsigned($unsigned({wire27}))));
              reg34 <= $unsigned((reg19[(3'h5):(2'h2)] ?
                  ((((7'h42) == reg18) - (^~wire20)) <= $signed(reg33[(2'h3):(2'h2)])) : (reg30 ?
                      (!$signed((8'hbb))) : $signed((+wire29)))));
              reg35 <= wire22[(4'hb):(4'hb)];
            end
          if (reg30[(5'h15):(2'h2)])
            begin
              reg36 <= ($signed(reg30[(5'h13):(2'h3)]) ?
                  reg35[(3'h4):(2'h2)] : ({((~^(7'h44)) ?
                          ((8'hb1) ?
                              wire28 : wire29) : $unsigned((8'hb7)))} > $unsigned((wire12 ?
                      $signed(wire22) : (~wire20)))));
              reg37 <= (reg31 ?
                  (wire15 ?
                      $unsigned($unsigned($signed(reg34))) : wire22) : (8'had));
              reg38 <= (~reg18);
              reg39 <= $signed($signed(((^((8'hb6) ? reg30 : wire12)) ?
                  $unsigned($signed(wire24)) : (^~$unsigned(reg17)))));
              reg40 <= wire22;
            end
          else
            begin
              reg36 <= $signed($unsigned(($signed(wire13[(3'h5):(1'h0)]) - (^~reg17[(2'h2):(1'h1)]))));
              reg37 <= $unsigned($signed(({$signed(reg30)} >= $unsigned((~^(7'h41))))));
              reg38 <= $unsigned($unsigned(wire12));
              reg39 <= ({$signed($signed((reg34 ? wire21 : reg17))),
                  (reg19[(3'h5):(3'h4)] ?
                      (reg39 ?
                          (wire28 ?
                              wire13 : reg37) : {wire14}) : $unsigned(((8'h9d) < wire21)))} <<< (^~(~^wire15[(1'h0):(1'h0)])));
            end
          reg41 <= reg31;
          if ((wire21[(4'ha):(2'h2)] ?
              ($signed(wire24[(1'h1):(1'h1)]) ?
                  (reg33[(2'h3):(2'h3)] * wire26[(3'h5):(3'h5)]) : $signed((wire29 ?
                      {wire14, wire29} : {reg31, wire27}))) : reg41))
            begin
              reg42 <= (!$unsigned(wire21[(1'h1):(1'h1)]));
              reg43 <= ((8'h9d) << (^(reg34[(2'h3):(1'h1)] <= wire29)));
              reg44 <= wire13;
              reg45 <= (&(((&{(8'ha5), (8'h9d)}) <= reg18) ?
                  (~|wire12[(2'h3):(1'h1)]) : (&{$signed(wire25),
                      $signed(reg44)})));
            end
          else
            begin
              reg42 <= (+$unsigned((-($unsigned(reg31) ?
                  reg37 : (wire23 ? reg32 : wire25)))));
              reg43 <= reg40;
              reg44 <= (reg39 ?
                  (~^((((8'hb1) ? reg31 : reg36) ?
                          $signed(wire29) : ((8'hbd) ? wire14 : (8'ha7))) ?
                      (^reg40) : {reg18, wire28[(2'h3):(2'h3)]})) : (wire23 ?
                      ({(|(8'hbc)), (~&wire25)} ?
                          $signed($signed(reg36)) : ((~&reg43) ?
                              (~|reg33) : (+reg45))) : ($unsigned((wire15 ?
                          wire15 : wire14)) <<< ($signed(reg34) ?
                          $signed(reg42) : $signed(wire29)))));
            end
        end
      else
        begin
          reg31 <= {reg38};
        end
      reg46 <= (wire29 ? $unsigned(reg19[(1'h0):(1'h0)]) : $signed((~&reg31)));
      if (reg38)
        begin
          reg47 <= ($unsigned($signed($signed(((8'hab) ?
              reg40 : (8'hab))))) & reg18);
          reg48 <= wire22[(4'hb):(3'h4)];
          reg49 <= $signed($unsigned(((8'hbe) ?
              (~&(wire13 <= reg35)) : (8'hb6))));
          reg50 <= {$signed(wire20)};
          reg51 <= (7'h41);
        end
      else
        begin
          if ((7'h42))
            begin
              reg47 <= (((wire12 ?
                      $unsigned((reg18 ? reg46 : reg41)) : {{wire12,
                              (8'hb6)}}) ?
                  {(wire29 ? reg19 : reg32),
                      reg33[(1'h1):(1'h1)]} : (($signed(reg32) ?
                      (reg37 > reg50) : wire23[(4'h8):(2'h3)]) ~^ ($unsigned(reg47) ?
                      (wire23 ?
                          reg30 : reg32) : $signed(wire25)))) ^ ({$unsigned((wire23 ^~ wire27))} * ({$signed(wire12)} >>> ($unsigned(reg47) | (+wire27)))));
              reg48 <= reg31[(1'h1):(1'h0)];
              reg49 <= (^~(((8'hb7) ?
                  $signed(reg32) : (8'hab)) == $signed(((wire26 ?
                      reg50 : wire22) ?
                  {(8'ha3), (7'h42)} : $unsigned(reg38)))));
              reg50 <= reg42[(1'h1):(1'h0)];
              reg51 <= {(wire27 ?
                      $unsigned(($signed(reg40) + (wire24 << reg31))) : (^~$signed({reg45,
                          reg30})))};
            end
          else
            begin
              reg47 <= $signed((8'h9e));
              reg48 <= ((((~(reg46 ^ reg34)) ?
                      $unsigned((&wire20)) : reg36) & (((reg47 ?
                          wire24 : reg17) ^ $unsigned(reg19)) ?
                      wire23[(4'h8):(4'h8)] : $unsigned((wire15 != reg33)))) ?
                  (reg42[(2'h2):(2'h2)] ?
                      ($signed((8'hba)) != ((wire29 ? reg18 : reg35) ?
                          $unsigned((8'hbd)) : $unsigned(reg30))) : {(wire15 <= (wire13 ?
                              (8'hb0) : reg36))}) : $signed((~^$unsigned((reg40 >> reg41)))));
              reg49 <= {((8'h9e) ^~ (($unsigned(reg37) ?
                          $unsigned(wire23) : reg46) ?
                      wire23 : reg43[(4'h9):(1'h1)])),
                  (reg39 ^~ wire28)};
            end
          if ((-reg45[(3'h4):(1'h0)]))
            begin
              reg52 <= (wire21 & reg47);
              reg53 <= $signed(((reg49 - (~^reg52[(5'h10):(4'hb)])) ?
                  wire24[(1'h0):(1'h0)] : $unsigned(wire24[(1'h1):(1'h0)])));
            end
          else
            begin
              reg52 <= ((^~(8'haa)) ?
                  (~(wire16 ^ {(!reg34)})) : ((((reg36 ?
                          reg47 : wire16) * (~^reg41)) - (-{wire27, reg46})) ?
                      {((^~reg42) * reg51[(5'h14):(4'h8)])} : (^($signed(reg39) ^ $unsigned((8'ha2))))));
            end
          if (reg34)
            begin
              reg54 <= ((((&(reg30 ? (8'h9e) : reg47)) ?
                  (~|{wire26}) : (8'ha7)) ~^ (wire13 ?
                  $unsigned((reg32 * reg39)) : ((&reg37) <<< (wire23 ?
                      wire23 : reg41)))) || reg31[(1'h0):(1'h0)]);
            end
          else
            begin
              reg54 <= $unsigned(($signed(($unsigned(reg39) ?
                  (~^reg46) : $unsigned((7'h43)))) >= $unsigned(((wire28 * reg52) ?
                  $unsigned(reg40) : (wire24 <= (8'hae))))));
              reg55 <= $unsigned($signed($unsigned(((^~(8'hbd)) <<< $unsigned(reg35)))));
              reg56 <= $signed(($signed(reg32) ?
                  reg33[(2'h3):(2'h3)] : (($unsigned(reg37) ?
                          ((8'hb2) ? (8'hb8) : wire23) : $signed(wire29)) ?
                      reg49[(5'h10):(3'h5)] : $unsigned((reg41 ?
                          reg46 : wire12)))));
            end
          if ($signed($signed($unsigned(reg19[(1'h1):(1'h0)]))))
            begin
              reg57 <= reg52;
              reg58 <= ($unsigned(reg41) + $signed($unsigned((wire21[(4'hd):(1'h0)] >= reg36))));
              reg59 <= ($signed(reg34[(4'hc):(4'hc)]) ?
                  ($signed(reg34[(4'he):(3'h4)]) ?
                      $unsigned(((reg51 ? reg34 : (8'hb8)) >> (reg38 ?
                          wire29 : reg34))) : $unsigned((reg37[(4'hb):(3'h6)] * (reg50 ?
                          (7'h40) : reg42)))) : $signed((~^(!((8'hb4) + wire15)))));
              reg60 <= {{{($signed(reg47) ? $unsigned(wire25) : (8'haf))},
                      (((wire29 ? reg32 : (8'h9f)) == $unsigned(wire27)) ?
                          (-$signed(reg52)) : (|wire26))}};
            end
          else
            begin
              reg57 <= ((reg42[(1'h1):(1'h1)] ?
                      $signed((^~(-reg33))) : (((~&(8'hb3)) ?
                              $signed(reg17) : $unsigned(wire12)) ?
                          reg19 : reg52[(3'h6):(3'h5)])) ?
                  (((-$signed(reg42)) + $signed(wire27)) ?
                      (wire27[(3'h4):(2'h3)] ?
                          (&{wire24,
                              wire20}) : wire21[(4'hd):(4'ha)]) : (^~(((8'haf) ?
                          reg59 : (8'hae)) >> ((8'hb8) ?
                          wire23 : reg32)))) : $unsigned({$unsigned((wire22 | wire13))}));
              reg58 <= $signed((reg42 ^~ (wire20[(3'h5):(3'h5)] ?
                  $signed((reg56 & wire20)) : (-reg41))));
            end
        end
    end
  assign wire61 = reg58[(2'h3):(1'h1)];
  assign wire62 = reg54[(4'h9):(2'h2)];
  always
    @(posedge clk) begin
      if ({wire61[(2'h2):(1'h1)]})
        begin
          reg63 <= reg45;
          if ((8'ha5))
            begin
              reg64 <= (&($signed(reg33) ?
                  $signed(((wire21 ? reg63 : reg50) * (reg34 ?
                      (8'ha8) : reg63))) : reg37[(1'h0):(1'h0)]));
              reg65 <= (8'haf);
              reg66 <= reg30[(4'ha):(2'h3)];
            end
          else
            begin
              reg64 <= $signed(reg57);
              reg65 <= (~&(wire15 ?
                  reg35[(1'h1):(1'h1)] : $signed(((~^reg32) == {(8'haa)}))));
              reg66 <= (reg65 ?
                  $unsigned(((reg30[(4'hf):(4'h8)] ?
                      (wire25 ? wire24 : (8'ha0)) : (~reg18)) >= ({reg50,
                      wire20} != reg17[(4'hd):(4'hc)]))) : ((($signed(reg18) - (~reg30)) ^~ wire14) | (wire12 | wire62[(1'h1):(1'h0)])));
              reg67 <= $signed((&($signed((-reg40)) ?
                  {$signed(reg63)} : (wire29 ?
                      (reg60 ? (8'ha6) : reg46) : {reg38}))));
            end
        end
      else
        begin
          reg63 <= ({($signed(reg31) >= reg19[(4'hd):(1'h1)])} <<< {$signed(reg18[(1'h1):(1'h1)]),
              {$signed(wire62), $unsigned($signed(reg66))}});
          if (reg47)
            begin
              reg64 <= $signed(reg19);
              reg65 <= $signed(wire13[(4'h8):(2'h3)]);
            end
          else
            begin
              reg64 <= {wire25[(4'hb):(4'hb)]};
              reg65 <= ((((~|$signed(reg18)) == (reg64[(4'hc):(3'h4)] | reg30[(2'h3):(1'h1)])) && (reg63[(1'h0):(1'h0)] - reg41)) ?
                  ($unsigned($unsigned($unsigned(reg64))) ?
                      ((~^(wire23 ? reg46 : reg41)) ?
                          $signed(reg35[(2'h2):(1'h0)]) : ((reg51 >= reg36) != (8'hbd))) : $signed(((wire14 > reg18) ?
                          $unsigned(wire21) : wire26[(3'h5):(1'h0)]))) : (7'h42));
              reg66 <= $unsigned($signed((reg66 | (~&wire13))));
              reg67 <= reg59[(2'h2):(2'h2)];
              reg68 <= $signed({reg67});
            end
          reg69 <= ((({reg68[(4'hb):(1'h0)], (reg68 ? reg50 : (8'hbe))} ?
                  $unsigned($unsigned(wire15)) : ((reg39 ^~ wire13) - $signed(reg30))) | (((reg67 ?
                      wire24 : (8'hb2)) ?
                  {reg36, reg18} : reg58) << $unsigned((reg17 & (8'ha7))))) ?
              ($unsigned($unsigned(reg44[(3'h7):(2'h2)])) ?
                  $unsigned($unsigned((wire62 ?
                      reg43 : wire13))) : reg57) : $signed($signed(({wire14,
                  (7'h44)} >>> $signed(wire24)))));
        end
      reg70 <= (reg65[(1'h1):(1'h0)] ?
          $signed(($unsigned((reg56 ? reg67 : (8'ha3))) ?
              $signed({reg43, reg55}) : (((8'hbe) >> (8'h9c)) ?
                  (wire22 * reg66) : (^~reg67)))) : $unsigned(($unsigned((^wire27)) ?
              ((reg36 && wire21) ?
                  $unsigned(wire23) : (reg32 >> reg18)) : reg17[(4'ha):(2'h2)])));
      reg71 <= (~$signed(($signed($signed(reg19)) ?
          $signed(wire23[(3'h4):(1'h0)]) : $unsigned((reg68 > wire21)))));
    end
  assign wire72 = $signed((((reg35 && (7'h42)) == $unsigned((~&reg51))) | reg17));
  assign wire73 = $signed((~($signed(reg52) < wire14)));
  assign wire74 = {{reg67[(4'h8):(3'h7)], (^~(&reg57[(1'h1):(1'h0)]))}, wire21};
  assign wire75 = (8'ha6);
  always
    @(posedge clk) begin
      reg76 <= (reg60 && (reg38 ?
          {wire73[(3'h6):(3'h4)]} : ($signed((reg65 && reg37)) ?
              (reg48 ?
                  {wire24,
                      wire74} : (wire23 ^~ reg64)) : (-$unsigned(reg42)))));
      if ($unsigned((~&$signed($signed((~(8'ha0)))))))
        begin
          reg77 <= (+{(|((~reg54) ? reg44 : reg53))});
          if (reg42[(2'h2):(1'h0)])
            begin
              reg78 <= {reg54};
              reg79 <= reg78[(2'h3):(2'h2)];
            end
          else
            begin
              reg78 <= wire74[(4'hd):(1'h0)];
            end
        end
      else
        begin
          reg77 <= (reg44 >> ((~^{wire62[(2'h3):(2'h2)]}) ?
              (((~&wire74) ? $signed((8'ha9)) : reg35[(1'h1):(1'h1)]) ?
                  $signed((wire74 ?
                      wire74 : reg17)) : reg37[(2'h3):(1'h0)]) : reg46[(1'h0):(1'h0)]));
          if ($signed($signed((|reg33[(2'h3):(2'h2)]))))
            begin
              reg78 <= $signed($signed({(8'hb2)}));
              reg79 <= $unsigned((-{reg50[(2'h2):(1'h0)],
                  $unsigned((-(8'hb5)))}));
            end
          else
            begin
              reg78 <= wire14[(4'hc):(1'h0)];
              reg79 <= wire13[(4'h8):(4'h8)];
            end
          reg80 <= reg68;
          reg81 <= ($unsigned($signed(reg32[(1'h0):(1'h0)])) ?
              $signed(reg70[(4'ha):(4'ha)]) : ($unsigned(reg63) ?
                  (wire12[(3'h5):(1'h1)] ?
                      $unsigned((8'ha6)) : $unsigned((^wire61))) : $signed(($unsigned(reg42) ^ reg39))));
        end
      reg82 <= wire15;
    end
  assign wire83 = $signed({((~&$unsigned(reg33)) * $signed(reg64)),
                      (|reg35[(2'h3):(1'h1)])});
endmodule
