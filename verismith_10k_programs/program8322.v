module top
#(parameter param321 = (-{(+(8'ha7)), (((~(8'h9c)) || (8'ha2)) == ((~&(8'hb2)) ? ((8'ha9) < (8'h9e)) : (^(8'hb3))))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire306;
  wire signed [(3'h4):(1'h0)] wire302;
  wire signed [(4'hb):(1'h0)] wire300;
  wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire149;
  reg signed [(3'h6):(1'h0)] reg320 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg319 = (1'h0);
  reg [(4'hd):(1'h0)] reg318 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg317 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg316 = (1'h0);
  reg [(4'h8):(1'h0)] reg315 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg314 = (1'h0);
  reg signed [(4'he):(1'h0)] reg313 = (1'h0);
  reg [(4'he):(1'h0)] reg312 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg311 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg310 = (1'h0);
  reg [(5'h11):(1'h0)] reg309 = (1'h0);
  reg [(5'h13):(1'h0)] reg308 = (1'h0);
  reg [(4'he):(1'h0)] reg307 = (1'h0);
  reg signed [(4'he):(1'h0)] reg305 = (1'h0);
  reg [(2'h2):(1'h0)] reg304 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg303 = (1'h0);
  assign y = {wire306,
                 wire302,
                 wire300,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire149,
                 reg320,
                 reg319,
                 reg318,
                 reg317,
                 reg316,
                 reg315,
                 reg314,
                 reg313,
                 reg312,
                 reg311,
                 reg310,
                 reg309,
                 reg308,
                 reg307,
                 reg305,
                 reg304,
                 reg303,
                 (1'h0)};
  assign wire4 = wire2[(1'h1):(1'h1)];
  assign wire5 = wire0[(2'h2):(1'h1)];
  assign wire6 = ($unsigned(wire4) ?
                     (8'hac) : ($signed((~&(wire1 ? wire0 : wire5))) ?
                         wire0[(1'h0):(1'h0)] : (^wire0)));
  assign wire7 = (wire5[(1'h0):(1'h0)] ^~ (($signed((|wire4)) ?
                         (wire5[(3'h5):(2'h2)] >> wire5[(5'h10):(4'he)]) : wire2[(3'h4):(3'h4)]) ?
                     wire4 : wire0));
  module8 #() modinst150 (.wire12(wire6), .wire10(wire1), .wire13(wire2), .clk(clk), .wire9(wire4), .wire11(wire7), .y(wire149));
  module151 #() modinst301 (.wire155(wire6), .y(wire300), .clk(clk), .wire153(wire1), .wire154(wire4), .wire152(wire3));
  assign wire302 = (-(wire4 != ($unsigned((+wire7)) & ((wire6 ?
                       wire5 : wire3) != (~wire300)))));
  always
    @(posedge clk) begin
      reg303 <= (&(({(wire4 ? wire300 : wire7), wire6[(1'h1):(1'h0)]} ?
          wire7[(3'h6):(1'h1)] : $signed({wire300, wire2})) >> (((!wire149) ?
          wire300[(3'h5):(2'h3)] : (wire0 ?
              wire6 : wire149)) ^~ wire6[(4'hd):(3'h7)])));
      reg304 <= wire300;
      reg305 <= reg303;
    end
  assign wire306 = $signed($signed(((~&$unsigned(wire7)) ?
                       {$signed((8'hbc))} : (((8'hb1) ? wire2 : wire4) ?
                           $unsigned(wire6) : reg303[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      if (wire306)
        begin
          if ({($unsigned((~^reg305[(4'hd):(4'hd)])) ?
                  (wire2[(3'h6):(3'h6)] >= (wire5 ?
                      wire302[(2'h2):(1'h1)] : (wire300 ?
                          wire1 : wire1))) : reg303[(1'h1):(1'h1)])})
            begin
              reg307 <= wire302[(1'h1):(1'h0)];
              reg308 <= $signed($unsigned(wire306[(1'h1):(1'h0)]));
              reg309 <= ({(8'ha4)} ?
                  (wire0[(2'h2):(2'h2)] ?
                      (~&(!(reg304 != wire1))) : ($unsigned(wire7[(4'h8):(3'h4)]) < reg304[(2'h2):(2'h2)])) : (~^(wire5[(4'h8):(2'h3)] + wire3)));
            end
          else
            begin
              reg307 <= wire3[(3'h4):(2'h3)];
              reg308 <= $unsigned(((^reg307[(3'h7):(1'h0)]) ?
                  reg305[(4'hb):(1'h1)] : wire0));
            end
          if (reg308)
            begin
              reg310 <= (-((((wire3 != wire5) ? $signed(wire2) : reg303) ?
                  reg309[(3'h6):(3'h5)] : ($signed(wire3) ~^ (wire300 | reg309))) && wire5[(4'h8):(4'h8)]));
              reg311 <= (-reg305);
              reg312 <= (^$signed(($signed(wire2) >= wire302)));
              reg313 <= (((((wire149 <<< (8'hb9)) ~^ reg303) & (~^(&reg308))) >> wire149[(2'h3):(1'h1)]) ?
                  (&wire306[(1'h1):(1'h0)]) : {$unsigned($unsigned((reg304 <= reg305))),
                      (~|$signed($signed(wire0)))});
            end
          else
            begin
              reg310 <= ($unsigned($signed((reg308[(1'h0):(1'h0)] ?
                      wire0 : $unsigned(wire0)))) ?
                  $signed({(^~reg310[(3'h4):(2'h2)])}) : (~^(&{(wire300 + (8'h9e)),
                      (wire1 == reg305)})));
              reg311 <= (~&(8'ha4));
              reg312 <= ($signed((~&wire5[(4'h8):(4'h8)])) >>> $unsigned((^(^wire300[(4'hb):(4'ha)]))));
              reg313 <= wire302;
              reg314 <= wire302[(3'h4):(1'h0)];
            end
          reg315 <= (($signed(reg304) ?
              (^reg309) : (+(reg312[(4'h9):(4'h9)] ~^ wire5[(4'hf):(4'hc)]))) < (+wire5));
        end
      else
        begin
          if (($signed(wire2[(4'ha):(2'h2)]) ?
              {reg307} : $unsigned({reg309[(3'h7):(3'h4)]})))
            begin
              reg307 <= wire300;
              reg308 <= (($unsigned(((&reg308) ?
                  $signed(reg312) : $signed(reg303))) & $signed($unsigned(reg315[(3'h4):(3'h4)]))) - ($unsigned(($signed((8'hbc)) ?
                      (-(8'had)) : wire7)) ?
                  (&(reg305 ? wire4 : $unsigned((8'haf)))) : wire3));
              reg309 <= (wire5[(4'hc):(2'h3)] ?
                  ((~$signed(reg314)) >>> wire300) : (^wire0));
              reg310 <= (^wire149);
              reg311 <= $unsigned({wire300, (~^(8'hb2))});
            end
          else
            begin
              reg307 <= $unsigned(reg313);
              reg308 <= reg314[(3'h5):(3'h4)];
              reg309 <= {((reg303[(1'h1):(1'h0)] ?
                      wire0 : (7'h40)) * $unsigned(($signed(wire1) << $unsigned(wire4)))),
                  $unsigned(wire300[(3'h6):(2'h3)])};
            end
        end
      if (({$signed(wire1[(3'h7):(2'h2)]),
          (((&wire6) < (wire7 ? (8'hb1) : (8'ha4))) ?
              reg309[(3'h6):(3'h6)] : ($unsigned((8'hbb)) <= wire1[(2'h2):(1'h0)]))} != $unsigned(wire4)))
        begin
          reg316 <= $unsigned(wire5);
          reg317 <= {(reg305[(4'ha):(2'h2)] >> (wire7[(2'h2):(2'h2)] - $unsigned(wire2))),
              reg310};
          reg318 <= {{wire2[(4'h8):(2'h2)]},
              (|$signed($signed($signed(wire5))))};
        end
      else
        begin
          reg316 <= reg304;
          reg317 <= wire1;
          reg318 <= reg305;
          reg319 <= reg312[(3'h7):(3'h5)];
          reg320 <= ($signed((+(&reg305[(2'h3):(1'h1)]))) ?
              $unsigned($signed(reg303)) : $signed(wire1[(4'ha):(3'h4)]));
        end
    end
endmodule

module module151
#(parameter param299 = (~|((!(((8'hb8) >>> (8'hb6)) ? ((7'h42) ? (8'h9f) : (8'hbf)) : ((8'ha3) ~^ (8'h9d)))) * ((|(~(8'hb1))) & (8'ha6)))))
(y, clk, wire152, wire153, wire154, wire155);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire152;
  input wire signed [(4'ha):(1'h0)] wire153;
  input wire [(4'h9):(1'h0)] wire154;
  input wire [(5'h15):(1'h0)] wire155;
  wire [(3'h6):(1'h0)] wire298;
  wire signed [(5'h14):(1'h0)] wire297;
  wire [(4'he):(1'h0)] wire282;
  wire signed [(5'h12):(1'h0)] wire156;
  wire signed [(4'h9):(1'h0)] wire157;
  wire [(5'h12):(1'h0)] wire212;
  wire [(2'h2):(1'h0)] wire240;
  reg [(4'h8):(1'h0)] reg296 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg295 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg294 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg293 = (1'h0);
  reg signed [(4'he):(1'h0)] reg292 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg291 = (1'h0);
  reg [(3'h5):(1'h0)] reg290 = (1'h0);
  reg [(4'ha):(1'h0)] reg289 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg288 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg287 = (1'h0);
  reg [(3'h6):(1'h0)] reg286 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg285 = (1'h0);
  reg [(3'h4):(1'h0)] reg284 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(4'hd):(1'h0)] reg159 = (1'h0);
  reg [(4'h8):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg162 = (1'h0);
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg164 = (1'h0);
  reg [(3'h4):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg168 = (1'h0);
  assign y = {wire298,
                 wire297,
                 wire282,
                 wire156,
                 wire157,
                 wire212,
                 wire240,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 (1'h0)};
  assign wire156 = ($signed((^($signed(wire154) ?
                           $unsigned(wire152) : $signed(wire152)))) ?
                       ((wire152[(4'ha):(2'h3)] ?
                           wire153[(4'ha):(1'h0)] : $signed(((8'ha0) & (8'hb9)))) && wire155) : (~^wire155[(3'h4):(2'h2)]));
  assign wire157 = $unsigned((wire155[(1'h1):(1'h1)] ?
                       wire154 : ((8'ha9) ?
                           (wire153 ?
                               $signed(wire155) : $signed(wire155)) : wire155[(3'h6):(3'h6)])));
  always
    @(posedge clk) begin
      reg158 <= wire153[(1'h1):(1'h1)];
      reg159 <= ((&((&(wire152 ?
          wire154 : wire154)) >>> (~|wire153))) << ($unsigned(reg158[(4'h8):(3'h6)]) ?
          (~&((wire154 ? wire154 : reg158) ?
              {wire156} : (wire155 ?
                  wire152 : (8'hb4)))) : (wire157[(3'h4):(1'h1)] || $signed(wire152[(3'h6):(2'h2)]))));
      if ((wire157 ?
          (-$unsigned($signed(((8'hac) * (8'had))))) : $unsigned(((((8'had) ?
                  wire155 : wire157) > (~wire154)) ?
              $signed((reg159 ? wire152 : wire156)) : {(!reg158),
                  $signed(wire153)}))))
        begin
          reg160 <= {(8'ha1)};
          if (wire153)
            begin
              reg161 <= reg158[(4'hc):(4'h9)];
            end
          else
            begin
              reg161 <= $unsigned(wire153);
              reg162 <= reg158[(4'hc):(4'hc)];
              reg163 <= reg161[(2'h2):(1'h0)];
            end
          reg164 <= (~|$unsigned((({reg158, reg160} - wire152) ?
              {(reg162 ?
                      (8'hb8) : (8'ha8))} : (wire157[(3'h5):(3'h4)] >> (reg158 ?
                  (8'hb8) : wire156)))));
        end
      else
        begin
          reg160 <= $signed($unsigned(wire152));
          reg161 <= (-{(7'h40)});
          reg162 <= $signed(($signed($unsigned((^reg160))) ?
              reg164[(2'h3):(1'h1)] : $unsigned({(~wire155)})));
          reg163 <= $signed((^(wire154[(3'h5):(2'h2)] <<< wire157)));
          if ({$unsigned($signed(((wire157 - (8'had)) ?
                  wire156 : (reg159 ^ reg160)))),
              wire156[(5'h10):(4'h9)]})
            begin
              reg164 <= $unsigned($signed(reg162[(3'h7):(1'h1)]));
              reg165 <= reg164[(4'hb):(3'h6)];
              reg166 <= ($unsigned((reg159[(2'h3):(2'h3)] ?
                  $unsigned($signed(reg164)) : reg164)) <<< $unsigned(reg158));
            end
          else
            begin
              reg164 <= $unsigned((wire156 ?
                  ((reg163[(3'h6):(2'h2)] ?
                      wire154 : (reg165 ?
                          reg165 : wire155)) | $unsigned((wire154 ~^ reg161))) : $unsigned(reg164)));
              reg165 <= $unsigned(reg164[(3'h4):(2'h3)]);
              reg166 <= ($unsigned(reg165[(1'h1):(1'h0)]) ?
                  (8'ha6) : $signed((8'hba)));
            end
        end
      reg167 <= (^~(-$signed(reg163[(3'h4):(1'h0)])));
      reg168 <= (^~reg160[(1'h0):(1'h0)]);
    end
  module169 #() modinst213 (wire212, clk, wire155, reg162, wire152, reg168);
  module214 #() modinst241 (.wire216(wire153), .wire215(reg158), .wire217(reg162), .wire218(reg160), .y(wire240), .clk(clk));
  module242 #() modinst283 (.wire243(wire155), .wire246(reg167), .clk(clk), .wire245(wire152), .y(wire282), .wire244(reg159));
  always
    @(posedge clk) begin
      if ((+reg167))
        begin
          reg284 <= ((wire282[(1'h0):(1'h0)] - (reg167[(1'h1):(1'h1)] | (~^wire212))) >>> (wire152 ?
              $signed((wire155[(4'hf):(4'h9)] ^~ reg164)) : (($unsigned(reg159) >> (-reg164)) ?
                  (reg159[(2'h2):(1'h0)] ? reg159 : {wire155}) : (wire212 ?
                      (reg161 ? wire212 : reg165) : wire152[(4'ha):(1'h0)]))));
          reg285 <= {$unsigned($signed((8'hae))), wire155[(4'h8):(3'h5)]};
          reg286 <= reg161[(4'ha):(4'h9)];
        end
      else
        begin
          reg284 <= $unsigned($unsigned({$unsigned((reg166 ? reg284 : reg285)),
              wire157[(4'h9):(3'h5)]}));
          reg285 <= $unsigned($signed(reg162[(3'h5):(1'h0)]));
          reg286 <= reg162;
          reg287 <= reg158[(4'hc):(3'h4)];
        end
      if ((8'hb6))
        begin
          reg288 <= (+((reg168[(2'h2):(1'h0)] ?
              (reg166 != reg164) : (reg163 != (reg164 <<< wire240))) & wire212[(4'hb):(3'h4)]));
        end
      else
        begin
          reg288 <= wire154;
          reg289 <= reg160;
          reg290 <= $unsigned(($signed(($unsigned(reg166) ?
                  $unsigned(reg287) : reg168[(2'h2):(1'h0)])) ?
              $unsigned((8'hb0)) : {(reg289 ?
                      (wire152 ? wire157 : wire157) : (wire154 <<< reg158)),
                  ((8'h9f) << (8'hb7))}));
          if ($signed($unsigned((wire154[(3'h6):(3'h6)] ?
              $signed($signed((8'ha1))) : ($unsigned(reg286) ^~ (~^reg163))))))
            begin
              reg291 <= $signed(({$unsigned({wire157,
                      (8'hbe)})} < $unsigned((reg159[(1'h0):(1'h0)] | (reg289 <<< wire152)))));
              reg292 <= $unsigned({reg291, reg167[(4'h9):(2'h3)]});
              reg293 <= (~&(!(reg167[(4'hf):(1'h1)] != $unsigned((reg162 & reg166)))));
              reg294 <= $unsigned(wire152);
            end
          else
            begin
              reg291 <= wire153;
            end
          if (((~|(reg294[(3'h7):(3'h6)] ?
                  (&reg162[(1'h0):(1'h0)]) : (!reg161))) ?
              (-reg290[(1'h0):(1'h0)]) : (-reg165)))
            begin
              reg295 <= $signed(($signed(reg163) >= $signed(wire240[(2'h2):(2'h2)])));
            end
          else
            begin
              reg295 <= (8'had);
            end
        end
      reg296 <= $signed(($signed($signed(wire153)) ^ ($signed((wire157 >>> reg288)) || $unsigned((+wire154)))));
    end
  assign wire297 = $signed((|(^~$unsigned($signed(reg296)))));
  assign wire298 = ((!(|(8'ha8))) & $unsigned((+(reg295 ?
                       reg294 : $signed(reg293)))));
endmodule

module module8
#(parameter param147 = ((|((8'hb3) && (((7'h44) ? (8'ha9) : (8'ha9)) | ((8'hb0) + (8'hbc))))) << (((-{(8'hb1), (8'hb5)}) - (((8'hbe) ? (8'ha6) : (8'ha2)) <= {(8'haa), (7'h41)})) ? ((((7'h40) ~^ (8'hab)) ? (~(7'h44)) : ((8'hba) ? (8'hb8) : (8'hbc))) == (~|((7'h41) | (8'h9f)))) : ({{(8'haa)}} || (((8'ha2) ? (8'hb2) : (8'hab)) ? (^~(8'hac)) : ((8'ha7) ? (8'hab) : (8'h9f)))))), 
parameter param148 = ((((&(param147 ? param147 : param147)) || (+(param147 | param147))) << ((param147 * (~param147)) || ((param147 - param147) < param147))) << (((8'hb9) * ((param147 ? (8'hba) : (8'hbc)) ? {param147, param147} : param147)) ? (((param147 ? param147 : param147) ? {param147, param147} : (-param147)) & (^~(~&param147))) : ((param147 - (param147 | param147)) - (((8'hba) < param147) + (param147 ? (8'hb8) : param147))))))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire89;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire145;
  assign y = {wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire80,
                 wire82,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire145,
                 (1'h0)};
  assign wire14 = {($signed($unsigned($unsigned((7'h43)))) ?
                          wire13[(1'h0):(1'h0)] : (8'hb9))};
  assign wire15 = ($signed(((^$unsigned(wire11)) ?
                      $signed((wire12 >>> wire14)) : wire12[(2'h3):(2'h3)])) & $unsigned(({{wire9,
                              wire13},
                          (-wire14)} ?
                      $unsigned($unsigned(wire12)) : {$unsigned(wire10),
                          wire9[(1'h0):(1'h0)]})));
  assign wire16 = (~&((~&wire13[(4'h9):(1'h0)]) | (wire15 ?
                      $unsigned(wire14) : $signed((~|wire11)))));
  assign wire17 = ($unsigned({(~^(8'ha3)), wire11}) ?
                      $signed(((wire11[(4'h8):(3'h7)] * (wire12 ?
                          (8'haa) : wire9)) ^ (8'h9c))) : $signed({(+{wire16,
                              wire16})}));
  module18 #() modinst81 (.wire22(wire10), .wire20(wire9), .y(wire80), .wire19(wire14), .wire21(wire13), .clk(clk));
  assign wire82 = wire17;
  assign wire83 = {wire13,
                      (wire15[(4'h8):(2'h3)] ?
                          ({$signed((8'haa)), $signed(wire15)} + (!(wire15 ?
                              wire12 : wire16))) : wire16[(2'h2):(2'h2)])};
  assign wire84 = (((((wire12 | wire80) << $unsigned(wire14)) ?
                          (!wire17[(4'he):(3'h4)]) : $unsigned($unsigned(wire80))) + wire83) ?
                      $signed(wire17) : (({wire83} ~^ wire82) ?
                          $unsigned($signed((wire14 == wire80))) : $signed(wire9)));
  assign wire85 = $unsigned(wire84);
  assign wire86 = wire80;
  assign wire87 = ((|wire12[(1'h0):(1'h0)]) ? $signed(wire10) : wire10);
  assign wire88 = (wire84 ? wire11 : wire86[(3'h4):(1'h0)]);
  assign wire89 = $unsigned(wire82);
  assign wire90 = wire80;
  assign wire91 = {wire85};
  assign wire92 = ({(((-wire85) ? (wire91 == (8'ha1)) : (wire15 >>> wire85)) ?
                              $signed((^wire13)) : (wire16 || (wire11 != wire88)))} ?
                      $unsigned(wire84) : (wire87[(4'hb):(1'h1)] ?
                          ($unsigned($unsigned(wire17)) ?
                              wire10[(3'h6):(1'h0)] : $unsigned($signed(wire80))) : wire89));
  assign wire93 = wire88;
  assign wire94 = ($unsigned(wire80[(5'h10):(3'h4)]) ?
                      ($unsigned(wire10) != {($unsigned(wire84) ?
                              (wire10 << wire82) : wire12),
                          ((wire86 ? wire89 : wire87) ?
                              (wire91 >> wire84) : (wire84 ?
                                  wire17 : (8'hae)))}) : {$signed(($unsigned((8'h9d)) ?
                              (wire15 ~^ wire11) : $signed(wire10)))});
  module95 #() modinst146 (.wire99(wire85), .y(wire145), .wire98(wire11), .clk(clk), .wire96(wire84), .wire97(wire94), .wire100(wire91));
endmodule

module module95
#(parameter param144 = (!({(~&{(8'haa), (8'h9c)})} << ((((8'had) <<< (8'hb4)) | ((8'h9c) ? (8'ha9) : (8'hac))) || (((8'haa) ? (8'hb0) : (8'ha3)) - (!(8'hb1)))))))
(y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'h1a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire100;
  input wire [(2'h2):(1'h0)] wire99;
  input wire signed [(3'h5):(1'h0)] wire98;
  input wire signed [(4'h8):(1'h0)] wire97;
  input wire signed [(4'hf):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire143;
  wire signed [(3'h5):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire134;
  wire [(2'h3):(1'h0)] wire133;
  wire signed [(2'h2):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire111;
  wire signed [(2'h2):(1'h0)] wire110;
  wire [(3'h5):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire [(4'h8):(1'h0)] wire107;
  wire [(4'h9):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  reg [(4'hd):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(4'hd):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  assign y = {wire143,
                 wire135,
                 wire134,
                 wire133,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg132,
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
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire101 = wire96[(4'hf):(2'h3)];
  assign wire102 = $unsigned(wire101[(3'h6):(3'h6)]);
  assign wire103 = (wire102[(3'h6):(2'h3)] & {(wire101 ?
                           wire101[(2'h3):(2'h2)] : (wire101 ?
                               $unsigned(wire98) : wire99[(1'h0):(1'h0)]))});
  assign wire104 = $signed(((wire100[(2'h2):(1'h0)] ?
                           wire98[(1'h1):(1'h0)] : wire100) ?
                       (~^$signed(wire101)) : (&$unsigned((~&wire96)))));
  assign wire105 = $unsigned((+$signed(((wire101 <= wire102) - wire98))));
  assign wire106 = (wire96 >> wire100[(2'h2):(1'h1)]);
  assign wire107 = wire104;
  assign wire108 = (wire97[(1'h0):(1'h0)] ?
                       (wire96[(4'hd):(4'ha)] == wire103) : {$signed((wire101 & (+(8'ha0))))});
  assign wire109 = ((^(8'ha3)) <= wire99[(2'h2):(1'h1)]);
  assign wire110 = wire102;
  assign wire111 = ($unsigned(($signed($unsigned((8'haa))) >>> {wire103[(3'h4):(1'h0)],
                           (wire109 != (8'hb5))})) ?
                       $signed($unsigned(((wire109 ? wire96 : wire104) ?
                           wire98[(2'h2):(1'h1)] : (wire107 ?
                               wire105 : wire103)))) : ((~&wire108[(1'h1):(1'h0)]) ?
                           wire101 : wire101));
  assign wire112 = $signed(((wire102 ~^ wire110) != wire111[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg113 <= $signed((wire111 ?
          $unsigned(wire112) : {((wire108 >= wire111) ?
                  (wire111 >= wire106) : (wire108 >>> wire111))}));
      reg114 <= $unsigned((wire96 * (wire107[(3'h4):(3'h4)] + {$signed(wire107),
          (wire110 ^ wire104)})));
      if ($unsigned(((wire101[(3'h5):(1'h0)] ?
              $unsigned(wire103) : {(wire106 ? wire105 : wire101)}) ?
          $signed($unsigned((wire109 ?
              reg113 : wire103))) : (~|{wire103[(3'h4):(1'h1)],
              $signed(wire104)}))))
        begin
          if (wire97[(4'h8):(3'h5)])
            begin
              reg115 <= {reg114};
              reg116 <= wire102;
              reg117 <= ($unsigned((wire103 * (7'h40))) ?
                  wire110[(1'h0):(1'h0)] : ((((wire112 && (8'hb2)) <= wire100) ?
                          (!$signed(wire99)) : $signed($signed(wire111))) ?
                      (^~($unsigned(reg114) >> wire96)) : {((~|wire110) || (|wire108))}));
              reg118 <= wire100;
              reg119 <= $unsigned(wire108);
            end
          else
            begin
              reg115 <= wire96[(2'h2):(2'h2)];
              reg116 <= (^((($unsigned(reg118) ?
                          (~reg114) : (wire106 ^~ wire99)) ?
                      (~|(reg116 ? wire109 : wire96)) : reg116) ?
                  (8'h9c) : reg119));
              reg117 <= {({(!{(8'hb7), wire98}),
                      (reg117 ?
                          (8'h9d) : {wire102})} - $signed((~$unsigned((8'hb3))))),
                  $signed($signed($signed({reg116})))};
            end
          reg120 <= wire97;
          reg121 <= wire98;
        end
      else
        begin
          reg115 <= $unsigned(reg119);
          reg116 <= $signed($unsigned((~wire105)));
        end
    end
  always
    @(posedge clk) begin
      reg122 <= (wire102[(4'he):(2'h3)] + (((~^(~reg113)) <= {(~|reg113)}) ?
          (wire106 ?
              $unsigned((reg113 ? wire108 : wire106)) : {reg121,
                  (reg115 || wire108)}) : (~|(~|wire97))));
      if ($unsigned($signed(reg121[(1'h0):(1'h0)])))
        begin
          reg123 <= wire104;
          reg124 <= (($unsigned(((|(8'hb9)) - (wire97 ~^ (7'h41)))) ?
                  $signed((&wire111)) : ((8'ha4) << ($unsigned(wire102) ?
                      wire97 : {wire102}))) ?
              $signed($unsigned(wire111)) : wire99[(1'h0):(1'h0)]);
          reg125 <= wire108[(1'h0):(1'h0)];
        end
      else
        begin
          reg123 <= ($unsigned($unsigned($signed((wire99 ? reg124 : reg120)))) ?
              $signed((wire99 <= (|reg120))) : (wire106 ^~ wire108[(1'h1):(1'h0)]));
          if ($signed((wire98[(2'h3):(1'h0)] ?
              $signed(({reg125, (8'h9d)} | (reg120 ?
                  reg115 : wire97))) : ($unsigned(((8'haf) | reg120)) < ($signed(reg119) ^~ wire111[(2'h2):(1'h0)])))))
            begin
              reg124 <= wire107;
            end
          else
            begin
              reg124 <= $signed($unsigned((((reg117 == (8'hbd)) >> (wire103 ?
                      wire101 : (8'haf))) ?
                  (~$signed(reg125)) : $unsigned((&wire111)))));
              reg125 <= reg116[(4'h9):(3'h6)];
              reg126 <= $unsigned((&((~|{reg118, wire112}) ?
                  (&$signed(wire111)) : reg117[(4'hf):(3'h5)])));
            end
          if (wire109)
            begin
              reg127 <= $unsigned(wire103);
              reg128 <= (^~($unsigned((|(^~wire108))) == ($unsigned(reg115[(3'h5):(2'h3)]) >>> (~$signed(wire106)))));
              reg129 <= (^~((~|$signed(wire104[(3'h7):(3'h5)])) <= wire107[(4'h8):(3'h6)]));
              reg130 <= $unsigned((8'ha7));
            end
          else
            begin
              reg127 <= ((~|$unsigned(wire100[(2'h2):(1'h0)])) <= $signed((~((wire110 && reg129) - {(8'ha3),
                  reg127}))));
            end
          reg131 <= ($unsigned(wire110) | reg113[(1'h0):(1'h0)]);
          reg132 <= ((~|(|$signed({wire101, reg126}))) ?
              reg115 : {{reg122[(3'h7):(3'h7)]},
                  {(^$unsigned(wire99)),
                      (reg125[(2'h2):(1'h1)] ?
                          (reg124 ? reg116 : (8'ha3)) : (^reg122))}});
        end
    end
  assign wire133 = reg126[(2'h3):(2'h2)];
  assign wire134 = $unsigned((reg128[(1'h1):(1'h1)] ?
                       (~(8'h9e)) : (wire109[(1'h1):(1'h1)] ?
                           ((reg126 || wire100) < $unsigned(wire98)) : ($unsigned(wire104) >>> (~(8'haa))))));
  assign wire135 = $signed({(~($signed((8'hae)) ?
                           (reg122 || reg124) : (+reg113)))});
  always
    @(posedge clk) begin
      if ((&(|(^reg126))))
        begin
          reg136 <= ($signed(($signed(((8'haa) - wire97)) + ((!wire104) ?
                  (~^(8'hbf)) : (wire100 ^ (8'hb2))))) ?
              reg114[(1'h1):(1'h1)] : reg114[(1'h1):(1'h1)]);
          reg137 <= (reg121[(2'h2):(1'h0)] > {($signed({reg130, reg116}) ?
                  reg129[(3'h4):(1'h0)] : {(wire97 <= wire133)})});
          if (($signed($unsigned((~|(wire107 <= reg114)))) ?
              (wire100 ?
                  $unsigned(reg128) : (&{(wire109 == wire111),
                      (reg125 == reg115)})) : ($unsigned(($signed(wire106) ?
                  wire135 : reg137)) ~^ (8'haf))))
            begin
              reg138 <= $unsigned({$unsigned(($unsigned(wire97) ?
                      (|(8'ha5)) : (|wire101))),
                  reg137});
              reg139 <= $unsigned((wire100[(1'h1):(1'h1)] ?
                  $signed(($unsigned(reg132) || {wire109})) : $unsigned(reg116[(3'h5):(1'h0)])));
              reg140 <= ((reg139 ?
                      (((^wire108) | (reg122 & wire99)) ?
                          reg115[(2'h2):(1'h0)] : (reg131 ?
                              (~reg130) : $signed(wire98))) : (^~{$unsigned(reg137)})) ?
                  ((8'hac) <<< {(^~(~^reg128))}) : {$unsigned(reg126[(5'h12):(4'h8)]),
                      $signed(($unsigned(wire110) ?
                          {wire108, reg132} : (^~wire111)))});
            end
          else
            begin
              reg138 <= ({$unsigned(($unsigned(reg123) ?
                      (wire105 ? reg127 : (8'hba)) : (+wire104)))} - wire100);
              reg139 <= $signed($unsigned((8'ha1)));
              reg140 <= $unsigned(reg117);
              reg141 <= (wire97[(3'h5):(3'h5)] == (reg136[(1'h0):(1'h0)] - reg132[(2'h2):(1'h0)]));
            end
          reg142 <= ((!{reg116}) ?
              (|reg139) : ((wire100[(1'h0):(1'h0)] ?
                      $signed({reg141}) : (^$signed(reg121))) ?
                  ($signed((wire106 || reg137)) >= $unsigned($signed(reg132))) : wire106[(4'h8):(1'h0)]));
        end
      else
        begin
          reg136 <= (($signed((wire104 || $unsigned((8'hb7)))) <= (^~((reg130 ?
                  wire103 : reg139) ?
              (reg114 || wire134) : reg139[(4'h8):(3'h5)]))) << reg123);
          reg137 <= {(8'ha5), reg125};
        end
    end
  assign wire143 = reg138;
endmodule

module module18
#(parameter param79 = (((|(((8'ha9) ^~ (8'h9c)) ? ((8'ha3) ? (8'ha0) : (8'hba)) : {(8'hab)})) && ((((8'hbb) >= (8'h9d)) ? (8'hb5) : ((8'hb5) - (8'ha5))) ? ((~|(8'ha4)) - ((8'ha6) < (8'hb9))) : ({(8'hab), (8'ha5)} ? ((7'h42) ? (8'ha8) : (8'h9e)) : {(8'hb9), (8'ha8)}))) ? (!({(!(8'hac))} <<< (((8'h9f) ? (8'hbc) : (8'haa)) ? {(7'h44), (8'hbb)} : ((8'ha2) == (7'h41))))) : (8'hac)))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h292):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire22;
  input wire [(4'h8):(1'h0)] wire21;
  input wire [(3'h4):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire23;
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire64,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire41,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire23,
                 reg76,
                 reg75,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = (~^((^$unsigned($signed(wire21))) >= {(8'hb7),
                      $unsigned($unsigned(wire19))}));
  always
    @(posedge clk) begin
      reg24 <= (8'hbf);
      reg25 <= $unsigned($unsigned($signed(((wire22 <= reg24) ?
          (~|wire19) : (wire19 ? wire23 : wire20)))));
      reg26 <= (8'h9d);
      if ($signed(((&$unsigned($unsigned(wire23))) + wire23[(4'h9):(4'h9)])))
        begin
          reg27 <= ((-reg24[(1'h1):(1'h0)]) ? reg24 : wire20[(1'h0):(1'h0)]);
          if ($unsigned((reg25 ?
              (({wire22} ?
                  (wire23 <<< (8'hb0)) : wire20) ~^ wire21[(2'h2):(2'h2)]) : (+($unsigned(wire23) ?
                  {reg24} : (wire22 - wire22))))))
            begin
              reg28 <= wire21;
            end
          else
            begin
              reg28 <= (($signed($signed($signed(reg26))) || reg27[(3'h5):(3'h4)]) <= ((~|(~|$signed(reg26))) > reg25));
              reg29 <= (8'hb9);
              reg30 <= $unsigned((8'hac));
              reg31 <= $unsigned($signed($signed((^~$unsigned((8'hb4))))));
            end
        end
      else
        begin
          reg27 <= wire19[(4'hc):(1'h0)];
          reg28 <= $unsigned({(!$signed($unsigned(wire23))),
              (~^reg24[(4'hb):(3'h5)])});
          reg29 <= wire21;
        end
    end
  assign wire32 = (~&(($signed($unsigned(reg28)) >>> reg31[(1'h0):(1'h0)]) ?
                      (wire20 ?
                          ($unsigned(reg28) + wire19) : ((reg27 ?
                              wire23 : wire22) ^~ (-reg24))) : (&$unsigned((wire19 & reg26)))));
  assign wire33 = reg26[(3'h5):(1'h0)];
  assign wire34 = $unsigned($unsigned(wire22[(2'h3):(2'h2)]));
  assign wire35 = {{{((~^reg30) | (reg30 ? wire32 : (8'haf))),
                              (((8'hb9) >>> (8'hb7)) << $signed(reg26))},
                          wire32[(5'h10):(4'hb)]},
                      {{$signed(wire21[(2'h3):(1'h0)])}}};
  always
    @(posedge clk) begin
      reg36 <= {reg28[(3'h7):(3'h4)]};
      reg37 <= {{$signed(wire35[(2'h3):(1'h1)])}, reg30[(3'h4):(2'h2)]};
      reg38 <= (^(~^$signed((reg28[(3'h7):(3'h5)] & (wire35 < reg29)))));
      reg39 <= $unsigned($signed(($unsigned((+reg36)) * wire34)));
      reg40 <= (^(~^reg24));
    end
  assign wire41 = ($unsigned($unsigned(wire23[(2'h2):(1'h1)])) > {(7'h44)});
  always
    @(posedge clk) begin
      reg42 <= reg36;
      reg43 <= wire33;
      if (reg37[(2'h3):(1'h1)])
        begin
          reg44 <= (^wire20[(2'h2):(2'h2)]);
          if ((8'hbe))
            begin
              reg45 <= $signed($signed({wire32[(4'hc):(4'hb)]}));
              reg46 <= wire32[(2'h3):(2'h2)];
            end
          else
            begin
              reg45 <= ({(reg25 < reg43), reg42} ?
                  ((8'hae) != (~^($unsigned((8'hb4)) ?
                      reg38 : (reg38 < wire32)))) : (-(~|wire41[(1'h0):(1'h0)])));
              reg46 <= reg44;
            end
          reg47 <= $signed(((~^reg43[(1'h0):(1'h0)]) ?
              $signed(reg42[(1'h1):(1'h1)]) : {{$signed((8'ha6)), reg37}}));
          reg48 <= (&$unsigned(($unsigned((wire23 ?
              reg29 : reg44)) * reg38[(3'h5):(2'h3)])));
        end
      else
        begin
          if ($unsigned(reg39[(4'ha):(3'h6)]))
            begin
              reg44 <= reg43;
              reg45 <= $signed($signed($signed($signed((wire21 | reg40)))));
              reg46 <= reg29;
              reg47 <= (&$signed(({{reg24,
                      reg26}} | ((reg47 > (8'hb2)) > (reg38 ?
                  wire23 : reg46)))));
            end
          else
            begin
              reg44 <= ($signed(reg47[(3'h7):(2'h2)]) > wire32[(3'h7):(3'h5)]);
              reg45 <= reg42;
              reg46 <= $unsigned($signed($unsigned((-(reg45 ~^ reg24)))));
              reg47 <= (($unsigned({(-reg39),
                      ((8'hb1) + (8'h9f))}) >>> $unsigned(reg36[(1'h1):(1'h1)])) ?
                  wire34[(3'h4):(2'h2)] : reg38);
            end
          reg48 <= (!((8'hb0) ?
              ((reg25[(1'h0):(1'h0)] == $unsigned((8'hbc))) ?
                  $unsigned($signed(reg28)) : wire41) : $unsigned((7'h41))));
        end
    end
  assign wire49 = (8'ha4);
  assign wire50 = (^~{(+(-$unsigned((7'h43)))), (8'hb2)});
  assign wire51 = $signed(reg25);
  assign wire52 = (|(^{($unsigned((8'hbe)) != (wire22 ? reg36 : wire32)),
                      ((-reg48) >>> $signed(reg45))}));
  assign wire53 = $signed((~^reg45[(4'h8):(1'h0)]));
  assign wire54 = (~|({(|{wire51}),
                      (wire20 ?
                          {reg38,
                              reg45} : $unsigned((7'h41)))} * (^wire21[(3'h4):(1'h0)])));
  assign wire55 = $unsigned((8'ha7));
  assign wire56 = $unsigned((~$signed({(8'hab)})));
  always
    @(posedge clk) begin
      reg57 <= $unsigned(reg47);
      reg58 <= {wire49[(5'h14):(5'h11)], reg38};
      reg59 <= $unsigned($unsigned(reg38));
      if (wire51)
        begin
          if ($signed($signed($unsigned(reg26))))
            begin
              reg60 <= $unsigned((reg39[(1'h0):(1'h0)] || $unsigned({$signed((8'ha6)),
                  reg48})));
              reg61 <= ($signed({$signed($unsigned(reg25)),
                  reg59[(3'h6):(3'h4)]}) * $unsigned((wire34 ?
                  reg57 : wire51[(1'h0):(1'h0)])));
            end
          else
            begin
              reg60 <= (wire22 ? reg30[(4'hb):(4'ha)] : reg44[(2'h3):(2'h3)]);
            end
          reg62 <= reg43;
          reg63 <= $signed(((reg59 ? (+{reg43, reg39}) : $signed(reg31)) ?
              reg36[(4'h9):(2'h2)] : {$signed((reg28 & wire34))}));
        end
      else
        begin
          reg60 <= (&{(&reg29)});
        end
    end
  assign wire64 = (~^wire51[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ((+($signed(wire32) ?
          ($unsigned((^~wire35)) ?
              reg57 : ((~^wire23) ?
                  (wire22 != wire21) : $unsigned(reg42))) : $signed((wire35 == reg27)))))
        begin
          reg65 <= $unsigned(((^(|(reg62 != reg40))) >> wire49));
        end
      else
        begin
          reg65 <= {((!$signed($signed((8'hb7)))) ?
                  $signed((^~{reg27, reg36})) : (($unsigned(reg36) ?
                      $unsigned(reg31) : $unsigned(wire49)) ~^ $unsigned(reg25)))};
        end
      reg66 <= reg62[(5'h10):(4'he)];
      if ((~^reg38[(4'hc):(3'h6)]))
        begin
          reg67 <= (8'had);
          if ({$unsigned(($unsigned($signed((8'hb6))) <<< reg48[(4'h9):(3'h4)]))})
            begin
              reg68 <= $unsigned((7'h41));
              reg69 <= ((({wire52} >= reg45) ?
                      (($signed(reg27) ?
                          $signed(reg42) : wire53[(4'hd):(3'h4)]) * {reg66[(4'ha):(4'h8)],
                          reg42[(2'h2):(1'h0)]}) : $signed((+(~&wire51)))) ?
                  ((reg59[(3'h6):(1'h0)] > (!$unsigned(wire54))) ^~ reg62) : (((wire19[(3'h7):(3'h7)] >> {reg48,
                          wire33}) > ((^wire54) | reg45)) ?
                      wire20[(1'h0):(1'h0)] : $unsigned(($signed(reg30) >= reg26[(2'h3):(1'h1)]))));
              reg70 <= reg40[(3'h7):(3'h7)];
              reg71 <= $signed({$unsigned($signed((!reg45))),
                  (|(^~$signed((7'h43))))});
            end
          else
            begin
              reg68 <= ($signed((^({wire56, (8'hb0)} ?
                  $signed((7'h44)) : (~|wire33)))) ^~ reg70);
              reg69 <= ({(((wire33 ? reg40 : reg40) ?
                          reg44 : wire55[(1'h0):(1'h0)]) ?
                      $unsigned($unsigned(reg39)) : wire55[(4'hc):(3'h4)]),
                  ($unsigned((reg70 + wire21)) > (8'hba))} > (^~{$signed({reg46,
                      reg25}),
                  reg48[(4'hb):(2'h3)]}));
            end
          reg72 <= reg63;
        end
      else
        begin
          reg67 <= ($unsigned(reg27) <<< (((~|(wire53 ?
                  reg68 : reg67)) && ($signed(reg28) && (reg58 ?
                  reg27 : wire49))) ?
              $unsigned(((~(8'h9c)) ?
                  $unsigned(wire64) : reg71[(4'hf):(3'h6)])) : reg72[(1'h1):(1'h1)]));
          if ($signed($unsigned((reg59 ?
              reg40[(1'h1):(1'h1)] : $signed($unsigned((8'ha2)))))))
            begin
              reg68 <= reg66[(2'h2):(2'h2)];
              reg69 <= wire34[(2'h3):(1'h0)];
              reg70 <= (reg46 ? reg46 : ($signed({$unsigned(reg63)}) >= reg62));
              reg71 <= $signed((~|{$unsigned((wire49 ? reg57 : reg29)),
                  (!reg66[(4'ha):(4'ha)])}));
              reg72 <= wire54[(1'h0):(1'h0)];
            end
          else
            begin
              reg68 <= reg30;
              reg69 <= $signed($unsigned({(((8'hae) >= reg68) * wire23)}));
              reg70 <= {(~|wire56)};
              reg71 <= (!reg29[(3'h6):(2'h3)]);
            end
          if (($unsigned($unsigned((+reg58))) ?
              reg25[(3'h7):(2'h2)] : $unsigned(((^~((8'hb3) ? wire55 : reg67)) ?
                  $signed($signed(reg58)) : $signed($signed(reg25))))))
            begin
              reg73 <= $unsigned($signed($unsigned({((8'hbf) ? reg43 : reg28),
                  {reg38, wire52}})));
              reg74 <= wire41;
            end
          else
            begin
              reg73 <= $signed($unsigned(wire20));
            end
          reg75 <= (reg28[(2'h3):(2'h3)] ^~ reg30);
          reg76 <= (($unsigned(({reg25, reg48} ?
                  reg66 : (reg44 ? reg72 : reg36))) < ($signed($signed(reg28)) ?
                  ($unsigned(reg66) | $unsigned(reg61)) : {reg70[(3'h6):(1'h1)],
                      reg72})) ?
              wire23[(1'h0):(1'h0)] : ({(&$signed(wire23))} ?
                  $signed(wire33[(4'h8):(3'h7)]) : $unsigned((&{reg40}))));
        end
    end
  assign wire77 = ((~&$unsigned(((wire56 == wire56) ?
                      ((8'ha7) >> reg45) : wire52))) == (~^$unsigned({(wire56 ?
                          wire33 : reg28)})));
  assign wire78 = reg43[(3'h4):(3'h4)];
endmodule

module module242
#(parameter param280 = ((^({((8'hbc) >= (8'h9c)), ((7'h42) == (8'hb5))} ? (((8'h9d) ? (8'h9c) : (8'hb5)) + {(8'hbc), (8'hbd)}) : (((8'ha6) ~^ (8'ha1)) & {(8'ha7), (8'hb8)}))) ^~ {{(((8'ha9) ? (8'ha7) : (8'hb0)) ? ((8'hac) || (8'hbb)) : (&(8'hbf)))}, (-(((8'ha0) | (8'hb5)) ? ((7'h40) > (8'h9d)) : (~|(8'h9c))))}), 
parameter param281 = (~^(8'ha0)))
(y, clk, wire246, wire245, wire244, wire243);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire246;
  input wire signed [(5'h13):(1'h0)] wire245;
  input wire [(4'hd):(1'h0)] wire244;
  input wire [(5'h15):(1'h0)] wire243;
  wire [(3'h6):(1'h0)] wire279;
  wire [(3'h6):(1'h0)] wire278;
  wire [(5'h14):(1'h0)] wire277;
  wire signed [(3'h5):(1'h0)] wire273;
  wire signed [(5'h13):(1'h0)] wire272;
  wire [(5'h13):(1'h0)] wire271;
  wire [(5'h13):(1'h0)] wire262;
  wire signed [(4'ha):(1'h0)] wire261;
  wire signed [(5'h15):(1'h0)] wire252;
  wire [(5'h11):(1'h0)] wire251;
  wire signed [(2'h2):(1'h0)] wire250;
  wire signed [(4'h8):(1'h0)] wire249;
  wire [(4'hc):(1'h0)] wire248;
  wire signed [(4'h9):(1'h0)] wire247;
  reg [(3'h7):(1'h0)] reg276 = (1'h0);
  reg [(4'hf):(1'h0)] reg275 = (1'h0);
  reg [(3'h4):(1'h0)] reg274 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg270 = (1'h0);
  reg [(5'h15):(1'h0)] reg269 = (1'h0);
  reg [(3'h6):(1'h0)] reg268 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg267 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg266 = (1'h0);
  reg [(3'h6):(1'h0)] reg265 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg264 = (1'h0);
  reg [(5'h13):(1'h0)] reg263 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg260 = (1'h0);
  reg [(4'h8):(1'h0)] reg259 = (1'h0);
  reg [(4'h9):(1'h0)] reg258 = (1'h0);
  reg [(3'h4):(1'h0)] reg257 = (1'h0);
  reg [(4'h8):(1'h0)] reg256 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg255 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg254 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg253 = (1'h0);
  assign y = {wire279,
                 wire278,
                 wire277,
                 wire273,
                 wire272,
                 wire271,
                 wire262,
                 wire261,
                 wire252,
                 wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 reg276,
                 reg275,
                 reg274,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 (1'h0)};
  assign wire247 = ((((|wire246) <= $signed((wire245 <= wire245))) ?
                           wire244[(4'ha):(2'h3)] : $unsigned($unsigned((+wire246)))) ?
                       {(|($unsigned(wire243) ?
                               wire243[(3'h7):(1'h0)] : (8'h9f)))} : wire246);
  assign wire248 = $signed($unsigned((wire246 + ($signed(wire246) ?
                       (wire247 < wire247) : {wire244}))));
  assign wire249 = wire244[(4'hb):(3'h5)];
  assign wire250 = ($unsigned($signed((!wire246[(4'hc):(1'h0)]))) ?
                       wire248 : (wire248 | wire247));
  assign wire251 = (($signed($signed((!wire243))) ?
                           $signed((~|((8'hb2) ?
                               wire248 : (8'ha6)))) : $unsigned(((7'h43) * $unsigned(wire248)))) ?
                       (~wire245[(4'h8):(2'h2)]) : $unsigned(wire246));
  assign wire252 = wire246;
  always
    @(posedge clk) begin
      reg253 <= (~(wire245[(1'h1):(1'h1)] + (8'hb0)));
      if ($unsigned(wire245[(4'hf):(4'hf)]))
        begin
          reg254 <= (^~{(^(&(wire245 ? wire244 : reg253)))});
          reg255 <= wire250;
        end
      else
        begin
          if ((~(~{$unsigned({wire246, (8'hb3)})})))
            begin
              reg254 <= (wire245[(5'h11):(3'h5)] ?
                  (wire250[(1'h1):(1'h1)] < reg254) : wire246);
              reg255 <= (($unsigned($unsigned($signed(reg254))) ^ {(wire247 - wire251)}) * $signed($signed((8'hb1))));
              reg256 <= ((($signed((^wire248)) << wire249) ?
                  wire252 : (+reg255[(2'h2):(1'h1)])) == $signed($unsigned({wire243})));
              reg257 <= $unsigned((wire248 < (((wire248 && wire247) ^~ (wire252 ?
                      (8'hb8) : wire249)) ?
                  $unsigned(reg256) : $signed((!wire251)))));
              reg258 <= (|(wire247 ?
                  {(wire247[(1'h1):(1'h1)] ?
                          $unsigned((7'h43)) : (reg256 ? wire251 : reg254)),
                      {$unsigned(wire245)}} : wire246[(4'hd):(4'hc)]));
            end
          else
            begin
              reg254 <= ({(^~$unsigned(wire244[(1'h1):(1'h0)])),
                      reg256[(3'h4):(2'h3)]} ?
                  ($unsigned((~(wire250 & reg256))) ?
                      $signed(reg254) : $unsigned({(wire246 ~^ wire249)})) : $unsigned((wire248[(3'h7):(2'h3)] ~^ $signed($unsigned(reg253)))));
              reg255 <= $signed($signed($signed(wire251)));
              reg256 <= $unsigned((!$signed(wire246)));
            end
          reg259 <= $signed($signed(reg254));
          reg260 <= (~&($signed((wire252[(3'h4):(3'h4)] ?
                  $signed(wire248) : $signed(wire243))) ?
              ($unsigned((+wire251)) << (wire251[(3'h4):(1'h1)] ?
                  $signed(wire247) : reg258)) : (|$unsigned($unsigned(wire246)))));
        end
    end
  assign wire261 = $unsigned($unsigned({{reg255, $unsigned(reg255)},
                       $signed($unsigned(reg257))}));
  assign wire262 = $unsigned(($signed(wire261) ?
                       ((-reg253) << wire246) : $unsigned($signed(wire247))));
  always
    @(posedge clk) begin
      if (($unsigned(($unsigned((wire247 < wire243)) ?
              $unsigned({wire247, reg260}) : {(wire245 >>> reg255)})) ?
          ((|((reg260 ? wire243 : reg259) - {(7'h42)})) ?
              $unsigned(({wire250, wire261} ?
                  $signed((8'hb6)) : $signed((8'hb5)))) : {(~&(~(8'ha0)))}) : $unsigned((~&((reg260 & wire247) && $signed(reg258))))))
        begin
          if ((wire243 >= (~((!reg260) ?
              ((~|reg254) ?
                  wire262 : (reg254 ?
                      (8'h9f) : reg255)) : $unsigned(wire251[(1'h1):(1'h0)])))))
            begin
              reg263 <= {((~$signed($signed(reg254))) - reg260), (|reg253)};
              reg264 <= reg254[(5'h10):(2'h3)];
              reg265 <= wire247;
              reg266 <= $unsigned((wire251[(4'ha):(1'h0)] ?
                  (($signed(reg264) ?
                      $signed((8'h9e)) : reg259[(3'h5):(3'h5)]) + (~wire249)) : (~|{{reg255,
                          (8'hba)},
                      $unsigned(reg253)})));
            end
          else
            begin
              reg263 <= $unsigned(($unsigned((^~$unsigned(wire251))) ?
                  reg253 : (|$unsigned(reg260))));
              reg264 <= wire250[(1'h1):(1'h1)];
            end
          reg267 <= reg258[(4'h8):(2'h2)];
        end
      else
        begin
          reg263 <= $signed((!$signed(($unsigned(reg260) || reg255))));
        end
      reg268 <= (reg259[(1'h1):(1'h1)] ?
          reg264[(3'h7):(3'h6)] : ({$signed((reg267 ?
                  wire246 : reg265))} ^~ ((reg253 == $unsigned(wire244)) ?
              (!(wire249 + wire244)) : $unsigned($unsigned((8'ha9))))));
      reg269 <= ((8'ha1) || reg263);
      reg270 <= ($signed($signed(({wire262} ?
          {wire252} : wire246))) & (((~&$signed(reg256)) && reg267[(3'h4):(1'h1)]) ^ ((^(|reg257)) ?
          ($signed(wire246) ? (-wire251) : reg266) : reg254)));
    end
  assign wire271 = ($signed(wire262) ?
                       $signed((|(((8'hab) + wire249) ?
                           $signed(reg254) : reg259[(4'h8):(3'h5)]))) : $unsigned({$unsigned(((7'h43) ?
                               (8'ha8) : wire246)),
                           $signed((8'hbd))}));
  assign wire272 = $unsigned((8'hae));
  assign wire273 = {((|(^(~^reg260))) == $unsigned(({wire252, wire251} ?
                           $unsigned(reg270) : $unsigned(reg254)))),
                       reg255};
  always
    @(posedge clk) begin
      reg274 <= (reg269 ?
          {({reg256, $unsigned((8'hb1))} ?
                  ((wire272 ? reg267 : wire247) ?
                      (~^wire262) : (reg270 ?
                          (8'ha4) : reg265)) : ((&wire272) ^ $signed(reg265))),
              wire252[(2'h2):(2'h2)]} : $unsigned($signed(({wire249, (8'ha8)} ?
              wire252[(5'h15):(3'h6)] : (reg260 ~^ wire262)))));
      reg275 <= ((reg258 ?
          $unsigned(wire262[(4'ha):(4'h8)]) : $unsigned((-(~&reg264)))) >>> (-$unsigned(((wire262 ?
          wire273 : wire244) & $signed(wire251)))));
      reg276 <= (~((($unsigned(wire262) ?
              $unsigned(wire261) : reg259[(2'h2):(1'h1)]) ?
          $unsigned(reg269[(5'h15):(4'hf)]) : (8'hbe)) >>> $unsigned($signed(reg268))));
    end
  assign wire277 = wire262;
  assign wire278 = (8'hb8);
  assign wire279 = (^~(7'h43));
endmodule

module module214
#(parameter param239 = (|{({(^(8'hac))} && {((8'ha1) ? (8'hae) : (8'hbd))}), ((~&{(8'hab)}) ? {((8'had) | (8'ha7)), {(8'hb0)}} : {{(8'ha8)}, {(8'hbc)}})}))
(y, clk, wire218, wire217, wire216, wire215);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire218;
  input wire signed [(4'hf):(1'h0)] wire217;
  input wire signed [(3'h6):(1'h0)] wire216;
  input wire signed [(4'h9):(1'h0)] wire215;
  wire [(5'h14):(1'h0)] wire238;
  wire [(5'h12):(1'h0)] wire237;
  wire [(5'h12):(1'h0)] wire236;
  wire signed [(4'h9):(1'h0)] wire235;
  wire [(4'hc):(1'h0)] wire234;
  wire [(4'hf):(1'h0)] wire226;
  wire signed [(4'ha):(1'h0)] wire225;
  wire signed [(2'h3):(1'h0)] wire224;
  wire signed [(3'h4):(1'h0)] wire223;
  wire signed [(4'hf):(1'h0)] wire222;
  wire signed [(3'h5):(1'h0)] wire221;
  wire [(4'hf):(1'h0)] wire220;
  wire signed [(4'hb):(1'h0)] wire219;
  reg signed [(4'hf):(1'h0)] reg233 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg232 = (1'h0);
  reg [(5'h12):(1'h0)] reg231 = (1'h0);
  reg [(3'h5):(1'h0)] reg230 = (1'h0);
  reg [(4'h9):(1'h0)] reg229 = (1'h0);
  reg [(3'h7):(1'h0)] reg228 = (1'h0);
  reg [(2'h2):(1'h0)] reg227 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 (1'h0)};
  assign wire219 = $unsigned(wire216);
  assign wire220 = ((wire219[(3'h4):(2'h3)] >= (^wire215)) ?
                       $unsigned($unsigned($signed($signed(wire217)))) : ((~^$unsigned(wire218[(2'h3):(1'h0)])) > $signed($signed($signed(wire216)))));
  assign wire221 = $signed(wire220);
  assign wire222 = (~wire218);
  assign wire223 = wire217[(4'hd):(4'h8)];
  assign wire224 = $signed($signed($unsigned(((wire222 ?
                       wire222 : wire218) || {(8'h9e), wire220}))));
  assign wire225 = (wire224[(2'h3):(1'h1)] <= ($signed($signed((~|wire222))) ?
                       $signed($unsigned((8'ha4))) : wire221));
  assign wire226 = ((8'hae) ?
                       ($unsigned(((8'hb7) - $unsigned(wire224))) ?
                           (wire215[(1'h0):(1'h0)] ?
                               $unsigned({wire225}) : wire225) : ($signed(wire222[(1'h1):(1'h1)]) ?
                               wire215 : {$unsigned(wire216),
                                   wire216})) : wire223[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg227 <= wire226[(3'h4):(1'h0)];
      reg228 <= (!{$signed((^~(^~wire220)))});
      reg229 <= (~$signed(wire225));
      reg230 <= wire222[(4'hf):(3'h5)];
      reg231 <= $signed((~reg227[(1'h0):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg232 <= {wire220[(1'h0):(1'h0)], reg228[(1'h1):(1'h1)]};
    end
  always
    @(posedge clk) begin
      reg233 <= (wire222[(4'ha):(3'h4)] ?
          (^($signed((wire217 ?
              wire216 : reg231)) <<< $unsigned($unsigned(reg230)))) : (wire226[(1'h0):(1'h0)] >>> {wire226[(2'h2):(1'h0)],
              ($signed(wire223) << (wire223 > wire215))}));
    end
  assign wire234 = $unsigned(reg231);
  assign wire235 = wire223;
  assign wire236 = (reg227[(1'h0):(1'h0)] != (~&({{(8'ha6),
                           wire225}} >>> ((wire221 ? reg231 : wire220) ?
                       (wire225 ? wire225 : reg230) : (wire215 ^ reg232)))));
  assign wire237 = {reg229[(3'h6):(1'h1)]};
  assign wire238 = (|reg228);
endmodule

module module169
#(parameter param211 = (~^(((((8'hae) >>> (8'hb2)) != (~|(8'ha9))) | (^((8'hb9) ? (8'ha5) : (7'h42)))) ^~ ((~^((7'h41) > (8'h9d))) ? ({(8'hb9), (8'hb4)} ^ (~|(8'hb5))) : (8'hb8)))))
(y, clk, wire173, wire172, wire171, wire170);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire173;
  input wire [(5'h14):(1'h0)] wire172;
  input wire [(5'h10):(1'h0)] wire171;
  input wire signed [(5'h10):(1'h0)] wire170;
  wire [(4'h9):(1'h0)] wire210;
  wire [(2'h2):(1'h0)] wire209;
  wire signed [(5'h10):(1'h0)] wire208;
  wire [(4'hf):(1'h0)] wire207;
  wire signed [(3'h4):(1'h0)] wire206;
  wire signed [(4'ha):(1'h0)] wire205;
  wire signed [(2'h2):(1'h0)] wire204;
  wire signed [(2'h2):(1'h0)] wire203;
  wire [(5'h11):(1'h0)] wire202;
  wire [(5'h13):(1'h0)] wire201;
  wire [(3'h7):(1'h0)] wire200;
  wire [(5'h12):(1'h0)] wire184;
  wire signed [(3'h6):(1'h0)] wire183;
  wire [(4'hd):(1'h0)] wire182;
  wire signed [(3'h4):(1'h0)] wire181;
  wire [(5'h15):(1'h0)] wire180;
  wire signed [(3'h6):(1'h0)] wire179;
  wire [(4'hd):(1'h0)] wire178;
  wire signed [(3'h4):(1'h0)] wire177;
  wire signed [(4'h9):(1'h0)] wire176;
  wire signed [(5'h13):(1'h0)] wire175;
  wire signed [(4'hf):(1'h0)] wire174;
  reg [(3'h7):(1'h0)] reg199 = (1'h0);
  reg [(4'h8):(1'h0)] reg198 = (1'h0);
  reg signed [(4'he):(1'h0)] reg197 = (1'h0);
  reg [(5'h12):(1'h0)] reg196 = (1'h0);
  reg [(5'h14):(1'h0)] reg195 = (1'h0);
  reg [(4'h9):(1'h0)] reg194 = (1'h0);
  reg [(5'h10):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg192 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg190 = (1'h0);
  reg [(4'h9):(1'h0)] reg189 = (1'h0);
  reg [(5'h13):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  assign y = {wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire184,
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
                 (1'h0)};
  assign wire174 = wire173[(2'h3):(2'h2)];
  assign wire175 = ((|(($unsigned(wire172) != (+wire174)) != (((8'hae) < (8'hbc)) < wire171[(4'hf):(3'h5)]))) ^~ (-wire171));
  assign wire176 = $unsigned($signed(wire174[(3'h4):(3'h4)]));
  assign wire177 = (^((wire175 + {$signed((8'hbe)),
                       (wire173 ?
                           wire172 : wire175)}) - wire172[(4'ha):(1'h1)]));
  assign wire178 = ($signed((^(~|(^wire172)))) ?
                       (~{$signed(wire174[(3'h5):(1'h1)]),
                           wire173[(1'h1):(1'h0)]}) : $unsigned(wire177));
  assign wire179 = {$signed($signed(wire171))};
  assign wire180 = (($unsigned($signed(wire174[(4'hc):(4'hc)])) * wire175[(2'h3):(1'h0)]) ?
                       wire178 : wire172);
  assign wire181 = (wire179[(3'h5):(1'h0)] ?
                       $signed((8'ha1)) : $unsigned(((^((8'ha0) ~^ wire177)) ?
                           wire171 : (wire175[(5'h11):(2'h2)] ?
                               $signed(wire171) : {wire174, (8'ha5)}))));
  assign wire182 = $unsigned(((+wire178) == $unsigned(wire181[(2'h2):(2'h2)])));
  assign wire183 = (wire171[(4'hd):(2'h2)] ?
                       $unsigned($signed(wire182)) : ({{$signed((8'hb5))},
                               wire181[(1'h0):(1'h0)]} ?
                           wire179 : ((~|$signed((8'ha0))) ?
                               ((8'had) ?
                                   wire171[(4'he):(3'h7)] : wire173[(2'h2):(2'h2)]) : wire172)));
  assign wire184 = $unsigned($signed(wire181[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ($unsigned(wire184[(4'h9):(4'h8)]))
        begin
          reg185 <= $unsigned(($unsigned((|{wire172})) >>> (~&(&(-wire179)))));
          reg186 <= wire172;
        end
      else
        begin
          reg185 <= ($unsigned($unsigned(($unsigned(wire173) ?
              wire173 : $unsigned(wire171)))) * (~^((+wire183[(3'h6):(2'h3)]) * {wire175})));
        end
      reg187 <= wire175[(3'h6):(3'h4)];
      if ($signed($signed(reg187)))
        begin
          reg188 <= wire179[(2'h3):(1'h1)];
          reg189 <= (($unsigned($signed((!(7'h41)))) ^ $signed(wire179[(3'h6):(2'h3)])) < wire171);
          reg190 <= (+wire178[(1'h0):(1'h0)]);
          if (($signed(wire176) ?
              ((wire183[(3'h5):(1'h1)] ? wire177 : reg190) ?
                  (wire182[(1'h1):(1'h0)] ?
                      wire171[(1'h1):(1'h1)] : (wire174[(3'h4):(3'h4)] ?
                          (reg188 ?
                              wire183 : wire178) : wire181)) : $unsigned(wire179[(3'h6):(2'h2)])) : $signed($unsigned(wire181[(1'h1):(1'h0)]))))
            begin
              reg191 <= $unsigned(wire171[(4'h8):(3'h4)]);
            end
          else
            begin
              reg191 <= (wire171 >= (((~|wire182[(3'h7):(3'h5)]) ?
                  (~^wire174[(3'h6):(3'h6)]) : ($signed(wire174) == reg189[(3'h6):(2'h2)])) >>> wire178));
            end
          if (($unsigned((^~($unsigned(wire180) >= (^(8'h9d))))) ?
              wire173[(2'h2):(1'h1)] : wire182))
            begin
              reg192 <= $unsigned((reg189[(3'h4):(3'h4)] >= ({reg190,
                  $signed(wire184)} ^~ (~(|wire175)))));
              reg193 <= $signed((($unsigned((^wire177)) && $signed((&reg185))) ?
                  {wire177} : $signed(reg190[(3'h4):(2'h3)])));
              reg194 <= wire171;
              reg195 <= $unsigned((^((wire184 ?
                      (wire170 ? (8'hb6) : reg193) : (wire183 > (8'hb9))) ?
                  wire178 : wire180)));
              reg196 <= wire179;
            end
          else
            begin
              reg192 <= {(8'hbd), $signed(reg196)};
              reg193 <= (&((8'hac) ? reg194[(4'h8):(3'h7)] : wire183));
              reg194 <= reg194;
              reg195 <= $signed($unsigned($signed((reg191[(2'h3):(1'h0)] && (wire182 >>> wire181)))));
            end
        end
      else
        begin
          if ($unsigned($signed(wire183)))
            begin
              reg188 <= $signed(wire182[(4'hb):(1'h1)]);
              reg189 <= $unsigned(($signed($unsigned(reg196[(4'h9):(4'h9)])) | $unsigned(wire174[(4'hb):(3'h5)])));
              reg190 <= {$unsigned((!(wire179[(3'h4):(3'h4)] ?
                      $unsigned(reg188) : wire181[(1'h1):(1'h1)]))),
                  $signed(((wire176[(3'h6):(3'h5)] & reg189[(3'h4):(1'h0)]) << reg192))};
              reg191 <= $unsigned($signed(((((8'ha9) == wire184) ^~ wire170) ?
                  (~|((8'had) | (8'hb8))) : wire172)));
            end
          else
            begin
              reg188 <= reg189[(4'h9):(4'h8)];
            end
          if (wire176[(3'h5):(3'h5)])
            begin
              reg192 <= $signed(wire176);
            end
          else
            begin
              reg192 <= reg192[(4'hc):(3'h6)];
              reg193 <= reg185;
              reg194 <= reg192;
            end
          if (wire170)
            begin
              reg195 <= (+$signed({$signed((reg186 ? wire179 : reg186))}));
              reg196 <= $signed(reg194[(1'h0):(1'h0)]);
              reg197 <= (((8'haa) ?
                  (wire173[(3'h6):(2'h2)] ?
                      ((!wire175) & (~|wire182)) : $unsigned((wire180 ?
                          wire179 : wire171))) : {$unsigned($unsigned(wire177)),
                      (~(~|wire173))}) >> $unsigned(wire173));
              reg198 <= $signed((~({$unsigned(reg196), $signed(reg194)} ?
                  (8'h9e) : (-wire178[(2'h2):(1'h1)]))));
              reg199 <= ($signed(reg197) ^ (($unsigned(reg194[(4'h9):(1'h1)]) >> ((|wire170) ?
                  (wire180 ?
                      reg189 : (8'hb3)) : (+wire171))) >>> (reg197 || $signed(wire183))));
            end
          else
            begin
              reg195 <= ((&($signed((wire172 ?
                      wire178 : (8'h9d))) < (!(wire181 | wire182)))) ?
                  (wire184[(1'h0):(1'h0)] ?
                      $signed({{wire183},
                          wire182}) : wire171[(3'h7):(3'h5)]) : ($signed(wire173[(1'h0):(1'h0)]) ?
                      ((&wire176) << (!reg199)) : $unsigned($signed((wire182 >>> reg197)))));
              reg196 <= (-{reg186[(3'h4):(3'h4)], $unsigned(wire175)});
              reg197 <= wire179[(3'h6):(3'h4)];
              reg198 <= $signed($unsigned((8'h9e)));
              reg199 <= ({($signed(reg185) ?
                      $unsigned($unsigned((8'ha9))) : $unsigned(wire171[(4'ha):(4'h8)])),
                  (!$unsigned((reg193 ?
                      wire175 : reg198)))} || {($signed($unsigned(wire178)) ?
                      {$signed(wire171)} : wire175)});
            end
        end
    end
  assign wire200 = wire171[(4'hc):(3'h6)];
  assign wire201 = (7'h40);
  assign wire202 = (^~((((reg199 <<< reg190) == $signed(reg195)) != wire181[(3'h4):(1'h1)]) ?
                       (reg190[(1'h1):(1'h1)] ^~ $signed($unsigned(reg193))) : (~&reg198[(2'h3):(2'h2)])));
  assign wire203 = ((&(((reg198 || wire201) - (wire201 - wire179)) && wire179[(2'h2):(1'h0)])) ?
                       (~|$unsigned($signed($unsigned(reg198)))) : (({$unsigned(reg191),
                           $signed((8'ha9))} * wire181) >= {wire183[(3'h4):(2'h2)]}));
  assign wire204 = $signed(wire180);
  assign wire205 = $signed($unsigned((8'hae)));
  assign wire206 = (((!wire200[(3'h7):(3'h6)]) ?
                       wire177[(2'h3):(1'h1)] : (+wire180[(4'ha):(1'h1)])) | (8'hb9));
  assign wire207 = reg192;
  assign wire208 = {(^~wire206),
                       (wire177 ?
                           $signed({(reg194 ?
                                   reg185 : wire175)}) : $unsigned(((^reg186) * $signed(reg195))))};
  assign wire209 = (&$unsigned({{(wire184 ? reg189 : wire177), reg193},
                       reg192[(3'h6):(3'h5)]}));
  assign wire210 = wire208;
endmodule
