module top
#(parameter param350 = (({((^~(7'h40)) + {(7'h40), (7'h44)}), (^~{(8'ha5)})} ? {(^((8'hba) ~^ (8'h9c)))} : (|{(~^(8'hb9))})) ? ((~|({(8'hba), (8'h9c)} ? ((8'hb9) >> (8'hb2)) : ((8'ha1) << (8'hbb)))) < ((~|((8'hb4) * (8'hbe))) ? ((&(7'h42)) ~^ ((8'h9e) | (8'hb9))) : (((7'h40) ? (8'hb4) : (7'h41)) & {(8'hb5)}))) : (|((((8'hb4) >> (8'ha2)) ? (8'ha4) : (&(8'ha3))) == (!((8'hb6) << (8'had)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1f8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire349;
  wire signed [(4'h9):(1'h0)] wire348;
  wire signed [(4'hc):(1'h0)] wire347;
  wire [(5'h11):(1'h0)] wire342;
  wire [(4'he):(1'h0)] wire220;
  wire signed [(3'h5):(1'h0)] wire219;
  wire [(5'h14):(1'h0)] wire218;
  wire signed [(5'h14):(1'h0)] wire197;
  wire signed [(5'h15):(1'h0)] wire196;
  wire [(4'hd):(1'h0)] wire195;
  wire [(4'he):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire193;
  reg [(4'hc):(1'h0)] reg346 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg345 = (1'h0);
  reg [(2'h2):(1'h0)] reg344 = (1'h0);
  reg [(4'h9):(1'h0)] reg222 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg216 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg215 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg214 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg213 = (1'h0);
  reg [(4'hd):(1'h0)] reg212 = (1'h0);
  reg [(4'hd):(1'h0)] reg211 = (1'h0);
  reg [(4'ha):(1'h0)] reg210 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg209 = (1'h0);
  reg [(5'h10):(1'h0)] reg208 = (1'h0);
  reg [(5'h13):(1'h0)] reg207 = (1'h0);
  reg [(5'h12):(1'h0)] reg206 = (1'h0);
  reg [(3'h7):(1'h0)] reg205 = (1'h0);
  reg [(5'h13):(1'h0)] reg204 = (1'h0);
  reg [(4'h9):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg202 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg200 = (1'h0);
  reg [(5'h14):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg198 = (1'h0);
  assign y = {wire349,
                 wire348,
                 wire347,
                 wire342,
                 wire220,
                 wire219,
                 wire218,
                 wire197,
                 wire196,
                 wire195,
                 wire4,
                 wire5,
                 wire193,
                 reg346,
                 reg345,
                 reg344,
                 reg222,
                 reg221,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
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
                 (1'h0)};
  assign wire4 = wire1[(2'h2):(1'h1)];
  assign wire5 = wire4[(1'h1):(1'h1)];
  module6 #() modinst194 (.wire9(wire3), .wire11(wire0), .wire10(wire2), .wire8(wire4), .y(wire193), .clk(clk), .wire7(wire5));
  assign wire195 = (($unsigned(($unsigned(wire0) ?
                       $unsigned(wire0) : wire1[(3'h5):(1'h0)])) && (((|wire2) ?
                       $unsigned(wire3) : wire5[(5'h11):(4'he)]) >= ($unsigned(wire5) ?
                       wire193[(4'h9):(4'h8)] : $unsigned((8'h9e))))) <<< $unsigned(wire5[(4'h9):(3'h5)]));
  assign wire196 = wire5[(3'h6):(3'h5)];
  assign wire197 = $signed((~^$signed($signed($signed(wire3)))));
  always
    @(posedge clk) begin
      if ({$signed((wire3 ? (~^$signed(wire195)) : wire1))})
        begin
          reg198 <= wire193[(4'hb):(4'hb)];
          reg199 <= wire3[(2'h3):(2'h3)];
        end
      else
        begin
          if ({($signed($unsigned((wire1 ? reg199 : wire196))) ?
                  $unsigned($unsigned((wire197 && wire195))) : wire195[(4'hb):(2'h3)]),
              (((7'h41) - ({(8'ha7), wire5} ?
                  wire3[(4'hb):(4'h9)] : (wire1 == wire197))) <= $signed((~^$unsigned(wire195))))})
            begin
              reg198 <= ($unsigned({(wire5 | (wire193 == reg199)),
                  (wire1[(3'h6):(3'h6)] & (&(8'had)))}) & (!reg199));
              reg199 <= wire196[(4'ha):(2'h2)];
              reg200 <= ($unsigned((-wire0)) ^ (|(reg198[(3'h7):(3'h6)] >= reg198[(1'h0):(1'h0)])));
              reg201 <= (reg199[(5'h13):(4'hc)] <= $signed((~&wire196[(5'h15):(5'h11)])));
              reg202 <= $unsigned(wire197[(5'h12):(4'he)]);
            end
          else
            begin
              reg198 <= (wire193 ^~ $signed((((reg200 << reg199) | (wire197 ?
                  reg200 : wire5)) && $unsigned({wire1, wire4}))));
              reg199 <= $signed({$signed(($unsigned(reg199) ?
                      wire4[(3'h4):(2'h3)] : $unsigned(wire2))),
                  $unsigned((^(reg198 >= wire196)))});
              reg200 <= reg200[(2'h3):(2'h3)];
              reg201 <= $unsigned({(!(~&$unsigned(wire2)))});
              reg202 <= (-(^$signed(reg201)));
            end
          reg203 <= (((8'hb0) ?
                  reg202[(4'h8):(3'h7)] : $unsigned($signed(wire195[(2'h3):(2'h3)]))) ?
              $unsigned((wire1[(3'h4):(2'h3)] >>> $signed(wire196[(5'h14):(4'he)]))) : (reg202 > wire0));
          if (reg201[(4'h8):(3'h7)])
            begin
              reg204 <= ($signed($signed({(wire5 == wire1)})) < $unsigned(reg201[(2'h3):(2'h3)]));
              reg205 <= ((|wire2[(1'h0):(1'h0)]) ?
                  $unsigned((|$unsigned((wire2 ?
                      reg201 : wire196)))) : $signed(($signed($unsigned(reg199)) && $signed($signed(reg203)))));
              reg206 <= $signed($unsigned((reg200[(3'h4):(1'h1)] ?
                  (8'hb5) : wire5[(1'h0):(1'h0)])));
              reg207 <= (reg201 ?
                  wire196[(4'h9):(3'h7)] : $unsigned(($signed(reg203[(2'h3):(2'h3)]) <<< reg202[(4'hc):(2'h3)])));
            end
          else
            begin
              reg204 <= (($signed($signed($unsigned(wire4))) ?
                      reg206 : $unsigned($signed(reg206))) ?
                  ($unsigned(($signed(wire2) ?
                          (reg205 ? (8'hb8) : wire193) : (reg200 ?
                              wire2 : wire0))) ?
                      (((&(8'ha4)) ? $unsigned(wire4) : wire3) ?
                          reg204 : $signed(wire2[(1'h0):(1'h0)])) : ({{reg206,
                                  reg199},
                              {wire193, wire193}} ?
                          ({wire4} ? (-wire195) : $signed(reg202)) : {(reg204 ?
                                  wire0 : reg202)})) : (reg199 & (~|((wire0 ?
                      wire4 : reg203) > (reg198 < reg199)))));
              reg205 <= reg201[(3'h4):(2'h3)];
              reg206 <= wire193[(4'hb):(2'h2)];
            end
        end
      reg208 <= $signed((+(~^(!$unsigned(reg207)))));
      if ((&$signed(reg205)))
        begin
          if ((~|$signed($unsigned((~|(^wire1))))))
            begin
              reg209 <= reg198;
              reg210 <= $signed((wire4[(1'h1):(1'h0)] != (($signed(reg200) >> ((8'hbf) ?
                  (8'hb9) : (8'hb6))) - wire5)));
              reg211 <= $unsigned({reg210[(4'ha):(3'h5)],
                  ((wire197 ? reg198 : (^~wire2)) ?
                      $unsigned((-(8'hb0))) : ((wire197 ?
                          (7'h43) : wire1) > (reg206 < wire193)))});
            end
          else
            begin
              reg209 <= reg200[(1'h1):(1'h1)];
            end
          reg212 <= ($unsigned(wire5[(4'hc):(4'h8)]) ?
              $signed($signed((~|reg206))) : reg210);
          reg213 <= (wire2[(1'h0):(1'h0)] ?
              (^~(!wire193)) : ({($unsigned(wire193) >> {wire2})} ?
                  reg204 : {reg208, $signed($signed(wire5))}));
          reg214 <= (wire193[(2'h3):(2'h2)] ?
              (^~$unsigned((+$signed((8'ha4))))) : $signed(($signed(reg201) ?
                  {reg203[(3'h6):(3'h6)]} : $unsigned(((8'hbd) ?
                      wire197 : wire195)))));
          reg215 <= $unsigned(reg203[(2'h2):(1'h0)]);
        end
      else
        begin
          reg209 <= $unsigned(wire196[(3'h5):(1'h1)]);
        end
      reg216 <= (reg200 ? reg210 : reg198[(3'h4):(1'h0)]);
      reg217 <= $unsigned(reg214);
    end
  assign wire218 = reg209[(3'h6):(3'h5)];
  assign wire219 = (&$unsigned({reg206, $signed($unsigned(reg210))}));
  assign wire220 = wire196[(5'h12):(2'h2)];
  always
    @(posedge clk) begin
      reg221 <= $signed(wire0[(3'h6):(2'h3)]);
      reg222 <= reg215;
    end
  module223 #() modinst343 (wire342, clk, reg216, reg204, reg207, reg200);
  always
    @(posedge clk) begin
      reg344 <= ($unsigned({wire1[(1'h1):(1'h1)],
          wire195}) > $signed({($signed(reg216) < $signed(wire220))}));
      reg345 <= $signed(reg211[(3'h7):(1'h0)]);
      reg346 <= reg344;
    end
  assign wire347 = {((^(^(wire1 ? reg210 : reg200))) * wire220[(3'h6):(3'h4)])};
  assign wire348 = $unsigned(($signed($signed($unsigned(reg206))) >>> reg212));
  assign wire349 = wire348;
endmodule

module module223
#(parameter param340 = ((&(-({(7'h40), (8'ha3)} ? ((8'ha2) && (8'h9f)) : ((8'haa) ? (8'hbe) : (8'ha3))))) == ((~{((8'h9e) ^~ (8'haa))}) ? ((!((8'hae) ? (7'h41) : (8'hb1))) ? (((8'hab) ? (8'hb4) : (8'haf)) ? ((8'ha1) != (8'hb6)) : (-(8'ha9))) : (8'hbb)) : ((8'hba) ? {((8'ha5) <<< (8'h9d))} : {((8'hb9) & (8'ha0))}))), 
parameter param341 = (param340 ? (((7'h42) ? param340 : ((8'ha2) ? {param340, param340} : (param340 ^ (8'ha4)))) ? param340 : (((param340 & param340) ? (~&param340) : param340) - (!(param340 ? (8'ha2) : param340)))) : ((param340 ? (param340 == (&param340)) : (param340 ? (param340 && param340) : (^param340))) <<< ((~^(param340 ? param340 : (8'hbf))) ? ((param340 ? (8'hb9) : param340) ? ((8'hb7) ? param340 : (8'ha8)) : param340) : param340))))
(y, clk, wire224, wire225, wire226, wire227);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire224;
  input wire [(3'h6):(1'h0)] wire225;
  input wire signed [(5'h13):(1'h0)] wire226;
  input wire [(5'h13):(1'h0)] wire227;
  wire [(5'h12):(1'h0)] wire339;
  wire [(5'h13):(1'h0)] wire228;
  wire signed [(4'hb):(1'h0)] wire229;
  wire signed [(5'h15):(1'h0)] wire300;
  wire signed [(2'h2):(1'h0)] wire302;
  wire [(4'h9):(1'h0)] wire303;
  wire signed [(4'h9):(1'h0)] wire304;
  wire signed [(5'h13):(1'h0)] wire337;
  reg signed [(5'h12):(1'h0)] reg306 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg305 = (1'h0);
  assign y = {wire339,
                 wire228,
                 wire229,
                 wire300,
                 wire302,
                 wire303,
                 wire304,
                 wire337,
                 reg306,
                 reg305,
                 (1'h0)};
  assign wire228 = (~^($unsigned(wire224[(3'h6):(3'h6)]) < ($unsigned($signed(wire224)) | $unsigned($unsigned(wire226)))));
  assign wire229 = wire224[(3'h6):(2'h3)];
  module230 #() modinst301 (wire300, clk, wire227, wire225, wire224, wire229);
  assign wire302 = (8'hbc);
  assign wire303 = wire228[(3'h6):(1'h1)];
  assign wire304 = (8'hbc);
  always
    @(posedge clk) begin
      reg305 <= ((&(8'ha0)) | wire228[(4'h8):(1'h1)]);
      reg306 <= {{$unsigned(wire300)}};
    end
  module307 #() modinst338 (wire337, clk, wire304, wire226, wire300, wire227, wire228);
  assign wire339 = ($signed((!reg305[(1'h1):(1'h1)])) || $signed(({wire227[(5'h13):(5'h10)]} | ($signed(wire225) ?
                       wire227[(1'h1):(1'h0)] : (reg305 ?
                           wire337 : (8'h9f))))));
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h31c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire192;
  wire [(4'h8):(1'h0)] wire185;
  wire [(2'h2):(1'h0)] wire184;
  wire [(4'h9):(1'h0)] wire147;
  wire signed [(5'h14):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire95;
  reg [(4'hf):(1'h0)] reg191 = (1'h0);
  reg [(5'h14):(1'h0)] reg190 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg187 = (1'h0);
  reg [(3'h6):(1'h0)] reg186 = (1'h0);
  reg [(4'he):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg181 = (1'h0);
  reg [(4'hf):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg177 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg176 = (1'h0);
  reg [(4'hc):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg174 = (1'h0);
  reg [(3'h6):(1'h0)] reg173 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg172 = (1'h0);
  reg [(5'h12):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg170 = (1'h0);
  reg [(4'he):(1'h0)] reg169 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg167 = (1'h0);
  reg [(5'h11):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg163 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(5'h12):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg160 = (1'h0);
  reg [(2'h2):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(3'h4):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  assign y = {wire192,
                 wire185,
                 wire184,
                 wire147,
                 wire64,
                 wire24,
                 wire23,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire95,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
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
                 reg164,
                 reg163,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= $unsigned({$unsigned($signed(wire10[(1'h1):(1'h0)])),
          ($signed((|wire7)) ?
              wire8[(4'h8):(3'h7)] : $signed(((8'ha2) * wire10)))});
      reg13 <= wire10;
      if ((~(($unsigned((wire11 > wire10)) ?
              (~|$unsigned(wire11)) : reg13[(4'hf):(4'hd)]) ?
          reg12 : reg12[(4'h9):(3'h6)])))
        begin
          reg14 <= $signed(($unsigned($unsigned(wire11)) ?
              reg13 : (^~(7'h40))));
        end
      else
        begin
          reg14 <= {reg14[(2'h2):(1'h0)]};
          reg15 <= $signed($signed((~wire9)));
          if ((8'ha4))
            begin
              reg16 <= (reg12 ^ (8'had));
              reg17 <= ($unsigned(($unsigned((wire11 ? (8'hb2) : (8'hb4))) ?
                      {(~^wire9), (reg12 ? wire7 : wire10)} : ((wire10 ?
                          (8'hb4) : wire9) ~^ $unsigned(reg16)))) ?
                  (~reg14[(1'h0):(1'h0)]) : reg12[(3'h5):(1'h0)]);
              reg18 <= ((~&(8'hbd)) && (wire10 * $unsigned($signed({wire7,
                  reg16}))));
              reg19 <= (8'ha4);
            end
          else
            begin
              reg16 <= reg18[(1'h1):(1'h1)];
              reg17 <= $unsigned(reg16[(4'h9):(2'h2)]);
              reg18 <= $unsigned($unsigned((~&$signed(reg12[(3'h5):(3'h5)]))));
              reg19 <= $unsigned({(((~|reg12) ?
                          ((8'hb5) ? reg17 : reg19) : (~reg18)) ?
                      (-$unsigned(wire11)) : ((reg19 | wire10) < (~|reg16)))});
              reg20 <= (reg15 ?
                  ((reg13[(4'hb):(1'h0)] ?
                          ($signed(wire9) ?
                              $signed(wire11) : wire10[(1'h1):(1'h1)]) : ($signed(wire8) != wire7[(3'h6):(3'h6)])) ?
                      $signed((8'hb9)) : (wire9 >>> wire7)) : (reg15[(1'h0):(1'h0)] <<< reg19));
            end
        end
      reg21 <= (~&(~&wire7[(3'h6):(1'h1)]));
      reg22 <= $signed(wire10);
    end
  assign wire23 = (~&($unsigned({reg19,
                      (wire10 >> reg22)}) >= ($signed((reg17 >>> reg20)) ?
                      ((reg14 ?
                          wire10 : (7'h43)) >= reg19[(3'h5):(3'h4)]) : $signed($signed((8'ha5))))));
  assign wire24 = reg15[(3'h5):(2'h3)];
  module25 #() modinst65 (wire64, clk, reg15, wire9, reg17, wire7, wire11);
  assign wire66 = ((~$unsigned(reg19)) < $unsigned(reg17[(4'hd):(4'ha)]));
  assign wire67 = $unsigned(wire66[(1'h1):(1'h0)]);
  assign wire68 = (reg19 + {$signed(reg14[(1'h1):(1'h1)])});
  assign wire69 = wire7;
  assign wire70 = ($signed(($signed((reg22 ?
                      (8'hb5) : wire24)) * wire11)) <= (({$unsigned(wire10),
                      (wire7 ? wire24 : wire68)} ^ reg13) < (~&(&reg12))));
  assign wire71 = wire69[(3'h4):(2'h2)];
  assign wire72 = ((~&{$signed({wire7}), wire64}) ~^ wire23);
  assign wire73 = wire64[(2'h2):(1'h1)];
  module74 #() modinst96 (wire95, clk, wire11, wire73, wire23, reg14);
  module97 #() modinst148 (wire147, clk, wire69, wire66, wire72, wire7);
  always
    @(posedge clk) begin
      if ((wire7[(3'h5):(3'h4)] ?
          ($signed(($signed(wire11) ?
              $signed(wire69) : {wire70, (8'ha7)})) ^ ($signed($signed(reg18)) ?
              (8'hb3) : {reg14, $signed(reg19)})) : wire64))
        begin
          reg149 <= {(wire7 ?
                  (~($signed(wire67) >= (wire66 >= reg21))) : (-wire95))};
          reg150 <= wire10[(1'h1):(1'h1)];
          reg151 <= reg12[(1'h1):(1'h1)];
          if (reg13)
            begin
              reg152 <= (8'h9c);
              reg153 <= (wire24[(4'hd):(1'h0)] == $unsigned(wire10[(1'h0):(1'h0)]));
              reg154 <= (~$signed((^$unsigned(wire11[(3'h4):(2'h2)]))));
              reg155 <= ((~($signed(wire24) ?
                  (8'ha8) : (((8'ha5) ?
                      wire95 : reg21) ^ $unsigned(reg12)))) <<< (wire70[(4'h8):(3'h5)] ?
                  {$signed((~&wire69))} : reg21));
            end
          else
            begin
              reg152 <= ($unsigned((~reg151)) - {(8'hbb), reg19});
              reg153 <= (^(reg152[(3'h4):(3'h4)] ?
                  $signed(((~^wire95) ?
                      {reg154,
                          reg21} : $signed((8'hbc)))) : ({$unsigned(wire23)} ?
                      reg151 : (reg18 >> reg155[(4'hb):(4'h9)]))));
            end
        end
      else
        begin
          reg149 <= (^(reg14[(2'h2):(1'h1)] >>> reg12[(1'h1):(1'h0)]));
          reg150 <= $signed({$signed((|wire24))});
        end
      if ((reg16 ? wire23[(4'hf):(4'h9)] : (~&wire11)))
        begin
          reg156 <= {((8'h9e) <<< wire24)};
          if (wire24)
            begin
              reg157 <= (-(|{(&wire23), ({wire70, wire69} * (|(8'ha6)))}));
              reg158 <= ((reg14[(3'h6):(2'h3)] ? wire147 : $signed(wire70)) ?
                  (wire24[(3'h6):(2'h2)] ?
                      ($unsigned(reg157) && (~&reg156)) : (|$signed((wire67 <= wire70)))) : (|(^$unsigned($unsigned(wire64)))));
              reg159 <= reg13;
              reg160 <= (~&wire67[(3'h5):(3'h5)]);
              reg161 <= (reg12 + wire64);
            end
          else
            begin
              reg157 <= $signed(wire7);
              reg158 <= {((reg13[(3'h7):(3'h6)] <<< $unsigned($signed(reg158))) ?
                      (8'h9c) : $unsigned(((8'h9d) && reg151))),
                  {((8'ha5) + reg150),
                      ($signed($unsigned(wire147)) ?
                          $unsigned((^reg152)) : (reg149 ?
                              (reg157 <= wire72) : (~&reg160)))}};
              reg159 <= {($unsigned(wire7) & ((~^wire24[(2'h2):(1'h1)]) ?
                      {reg158, {wire70}} : ((wire10 + (7'h42)) == (^reg16)))),
                  reg19};
              reg160 <= $signed(wire72[(3'h4):(2'h3)]);
              reg161 <= (!(~^(|($unsigned((7'h44)) == ((8'hb3) - reg16)))));
            end
          reg162 <= (((((-reg17) ?
                      $unsigned(reg16) : (reg158 ?
                          reg12 : reg152)) >= ((reg155 == wire67) && (wire66 ?
                      wire69 : reg22))) ?
                  $unsigned(wire11[(1'h0):(1'h0)]) : reg154) ?
              (8'ha2) : {(wire67 != reg17), (&wire66[(2'h3):(1'h1)])});
          reg163 <= (reg15[(4'ha):(1'h0)] << reg153[(3'h5):(2'h2)]);
          reg164 <= (!reg150[(1'h1):(1'h0)]);
        end
      else
        begin
          if ((8'ha8))
            begin
              reg156 <= ((reg14 ?
                  $signed($unsigned((reg153 ?
                      reg156 : reg156))) : wire95[(3'h4):(1'h0)]) & wire7[(2'h3):(1'h0)]);
            end
          else
            begin
              reg156 <= $unsigned(($signed(wire66[(2'h3):(2'h3)]) ?
                  reg17 : reg19));
              reg157 <= (reg15 ? wire147 : wire71);
              reg158 <= (7'h40);
            end
          reg159 <= {((($unsigned(reg157) ?
                          (reg16 ^ reg152) : wire71[(1'h1):(1'h0)]) ?
                      reg14 : $signed($signed(reg16))) ?
                  $unsigned((~^$unsigned(reg150))) : ($unsigned(reg151) - ((wire7 ?
                          wire10 : reg21) ?
                      reg22 : $signed(reg164))))};
        end
      if (($unsigned($unsigned((^$signed(reg153)))) ?
          $unsigned($signed(wire147[(3'h6):(3'h4)])) : reg151[(2'h3):(2'h3)]))
        begin
          reg165 <= (reg160 && (~&$unsigned(wire7)));
          if ($signed(wire8))
            begin
              reg166 <= {(^~{{(wire9 ? wire64 : (8'ha0))}})};
              reg167 <= $signed(reg155);
              reg168 <= (~$unsigned((8'ha8)));
              reg169 <= wire9;
              reg170 <= reg20;
            end
          else
            begin
              reg166 <= wire64[(3'h4):(3'h4)];
              reg167 <= (reg164[(4'hd):(3'h4)] ?
                  $unsigned($signed((!$signed((7'h44))))) : ((wire24[(4'h9):(3'h7)] ?
                      $signed(reg13[(3'h5):(2'h3)]) : ((reg155 - wire9) ?
                          $signed(reg16) : (wire66 ?
                              reg19 : wire10))) >= ({(reg165 || wire67),
                          $unsigned(wire24)} ?
                      ((wire10 ^~ (7'h40)) * $signed(reg161)) : $unsigned($unsigned(wire147)))));
              reg168 <= $unsigned($signed((!wire73[(3'h7):(1'h0)])));
              reg169 <= reg155;
            end
          reg171 <= wire9;
        end
      else
        begin
          reg165 <= reg22;
          reg166 <= wire66;
          reg167 <= ((({$signed(reg20), $unsigned(reg154)} >> ((wire7 ?
                      reg153 : reg162) ^ $signed(wire67))) ?
                  {(wire24[(3'h5):(3'h4)] ? reg155[(3'h6):(3'h4)] : (^wire71)),
                      (reg18[(1'h0):(1'h0)] ?
                          {reg16,
                              reg16} : wire23)} : $unsigned($signed($unsigned(reg167)))) ?
              (!((~$signed(reg167)) ?
                  reg150 : (reg164[(3'h5):(3'h4)] || (reg156 ?
                      wire11 : reg154)))) : ({$signed((reg149 >> wire11)),
                      ((reg154 ? reg20 : (8'h9f)) ?
                          $signed(reg166) : $signed(reg169))} ?
                  $unsigned($unsigned((reg157 >> reg17))) : $signed(((|reg159) >>> reg160))));
          reg168 <= $signed(reg22[(3'h7):(3'h5)]);
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg154))
        begin
          if ($unsigned((((+reg17[(3'h4):(2'h3)]) ?
                  $signed(wire70[(5'h10):(2'h2)]) : ($unsigned((8'hb6)) || $signed(reg165))) ?
              $signed((|(8'hbc))) : reg157[(2'h2):(1'h0)])))
            begin
              reg172 <= wire9;
              reg173 <= $signed(reg164[(4'hb):(1'h0)]);
            end
          else
            begin
              reg172 <= reg158;
              reg173 <= (reg163[(4'ha):(1'h1)] | ($signed($signed($unsigned(wire7))) > reg154));
              reg174 <= reg150;
            end
          reg175 <= (|(+reg13));
        end
      else
        begin
          reg172 <= reg150[(3'h7):(3'h4)];
        end
      reg176 <= $unsigned(($unsigned($signed($unsigned(reg161))) & wire147));
      reg177 <= (~&reg171[(5'h12):(4'hd)]);
      reg178 <= (~|reg156[(2'h2):(1'h1)]);
      if (reg14[(4'h8):(3'h5)])
        begin
          reg179 <= ($unsigned(($signed(((7'h41) | reg156)) ?
                  (8'ha0) : reg150)) ?
              ((((&wire24) > $signed(wire8)) < $unsigned(wire66[(2'h2):(1'h1)])) ?
                  (^wire11) : (|$unsigned($signed(reg167)))) : $unsigned(((reg21[(4'h8):(3'h4)] - $signed(wire66)) == {$unsigned(wire10)})));
          reg180 <= ((!$signed($signed((wire95 ?
              reg160 : reg22)))) == (&(7'h40)));
          reg181 <= reg161[(2'h2):(1'h0)];
          reg182 <= $unsigned(reg161);
        end
      else
        begin
          reg179 <= (^(($signed(reg174) ?
              wire11[(3'h6):(3'h5)] : ((wire95 & reg178) ?
                  reg163 : ((8'h9f) ? wire23 : reg158))) | ((reg18 ?
                  $unsigned(wire71) : $signed(reg156)) ?
              reg160[(1'h1):(1'h0)] : ($signed(reg22) ?
                  (reg170 >>> reg172) : (reg170 * reg164)))));
          reg180 <= (($unsigned(((reg20 >> reg181) ?
                      $unsigned(reg180) : (wire24 ? reg174 : reg182))) ?
                  (&{(~&reg17)}) : ((~|$signed(reg152)) + reg149)) ?
              (^~(+$signed((reg173 ?
                  reg156 : reg153)))) : $signed($signed(reg173)));
          reg181 <= $signed((reg12 ?
              (reg168[(2'h2):(1'h0)] ?
                  (reg179[(4'h8):(1'h0)] ?
                      wire71 : reg15[(3'h5):(1'h0)]) : reg164[(4'hb):(3'h6)]) : reg153));
          reg182 <= {($signed(($unsigned(reg166) & $unsigned((8'had)))) != (^(reg22 >= (reg163 ^~ wire70))))};
          reg183 <= $unsigned($unsigned(($unsigned((reg177 != wire7)) < (((8'ha9) ^~ reg174) ?
              (wire147 >= wire66) : (~|reg20)))));
        end
    end
  assign wire184 = reg169;
  assign wire185 = {(8'h9d), reg150};
  always
    @(posedge clk) begin
      reg186 <= ($unsigned((7'h43)) ?
          (reg162 >>> $unsigned((-$unsigned((8'hab))))) : (reg158 ?
              (7'h44) : {(8'haa)}));
      reg187 <= (wire71[(1'h1):(1'h1)] ^ reg170[(2'h2):(1'h0)]);
      if (reg167[(5'h10):(4'he)])
        begin
          reg188 <= wire185[(3'h4):(1'h1)];
        end
      else
        begin
          reg188 <= ($signed(reg158) & $unsigned((^(|reg168[(4'h8):(3'h7)]))));
          reg189 <= $unsigned((($unsigned(reg175) ?
              reg181 : (!reg166[(4'h9):(1'h0)])) ~^ (reg186[(1'h0):(1'h0)] && ((reg12 < reg183) ?
              (~^(8'hb5)) : $signed(reg151)))));
        end
      reg190 <= (8'hbf);
      reg191 <= $unsigned(((-$unsigned((^reg156))) ? (~|wire23) : wire184));
    end
  assign wire192 = reg18;
endmodule

module module97
#(parameter param146 = ((~^(+{((8'hb9) ? (8'ha3) : (7'h41)), ((8'ha3) > (8'hb5))})) - ((~(-(~&(8'hb5)))) ? ((((8'hb0) ^ (8'hbc)) ? ((8'ha3) ^~ (8'hb8)) : (!(8'hac))) ? ({(8'hba), (8'hb8)} ? ((8'hbf) ? (8'ha4) : (8'hab)) : {(8'ha6)}) : (((7'h40) ? (8'hb3) : (8'hb6)) + ((7'h40) ? (8'hab) : (8'ha6)))) : ((((8'hb0) - (8'hbf)) <<< ((8'hbe) ~^ (7'h42))) || (8'ha1)))))
(y, clk, wire101, wire100, wire99, wire98);
  output wire [(32'h1f8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire101;
  input wire [(4'h9):(1'h0)] wire100;
  input wire signed [(4'hb):(1'h0)] wire99;
  input wire [(4'he):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire145;
  wire [(4'hc):(1'h0)] wire132;
  wire [(3'h5):(1'h0)] wire131;
  wire signed [(2'h2):(1'h0)] wire130;
  wire [(5'h10):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  wire signed [(5'h10):(1'h0)] wire108;
  wire [(5'h12):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire103;
  wire [(3'h5):(1'h0)] wire102;
  reg [(2'h2):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(5'h13):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(4'ha):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  assign y = {wire145,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire119,
                 wire118,
                 wire108,
                 wire107,
                 wire106,
                 wire104,
                 wire103,
                 wire102,
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
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg105,
                 (1'h0)};
  assign wire102 = $unsigned(wire100);
  assign wire103 = ((-{((wire102 <<< wire98) * {wire98, (8'hb3)})}) ?
                       ($unsigned(((|wire99) ?
                           (wire99 && (8'ha5)) : wire100)) >= wire99[(3'h6):(1'h0)]) : ($unsigned((~wire100)) ^~ wire99[(4'h8):(4'h8)]));
  assign wire104 = ($signed(wire103[(3'h6):(2'h3)]) ?
                       {((&$unsigned(wire101)) ?
                               wire99 : ($unsigned(wire98) ?
                                   wire98 : (+wire98))),
                           ($signed((wire99 ? wire102 : wire99)) != (wire103 ?
                               (wire103 << wire103) : {wire99}))} : (~^$signed((~&$signed((7'h41))))));
  always
    @(posedge clk) begin
      reg105 <= ((($signed($signed((8'hae))) ?
          $signed((~wire101)) : ($signed((8'hb7)) ?
              $unsigned(wire103) : (-wire104))) >> (+{(wire103 ?
              wire100 : wire99)})) <= ((~|(~{(8'hbb), wire102})) ?
          $unsigned(wire102[(3'h5):(1'h1)]) : wire104[(2'h2):(2'h2)]));
    end
  assign wire106 = wire102;
  assign wire107 = wire98;
  assign wire108 = (($unsigned((~|$unsigned(wire102))) > (&wire104[(2'h2):(1'h1)])) ?
                       (wire99 ?
                           wire98 : (($unsigned(wire106) ^ wire103) ?
                               wire100 : (^~wire104))) : (~|$signed(wire100[(3'h7):(1'h0)])));
  always
    @(posedge clk) begin
      if ((~^(wire98 + ($unsigned({wire98}) != ($unsigned((8'hb8)) < $unsigned(wire98))))))
        begin
          reg109 <= ((+wire104) ?
              reg105 : $signed((wire107 ? wire102 : (!{wire104, wire99}))));
          if (((wire100[(1'h0):(1'h0)] ?
              (|$unsigned(((8'hac) ? reg109 : (8'h9c)))) : {(((8'hbf) ?
                      wire106 : wire101) <= (wire98 <<< wire106)),
                  $signed({wire107, wire107})}) | (+wire99)))
            begin
              reg110 <= $unsigned($unsigned($unsigned(wire98)));
              reg111 <= (^~($signed(((~&wire102) < $unsigned(wire106))) != $unsigned($signed((~^reg105)))));
              reg112 <= ((wire108[(4'hd):(3'h4)] && $signed($signed((wire104 && (8'hb9))))) ?
                  wire102 : (^~{wire99[(4'h9):(2'h2)]}));
              reg113 <= ((reg112 * $signed(reg112[(1'h1):(1'h1)])) == ({({reg112} > $unsigned(wire102))} == $unsigned(wire108[(4'he):(3'h5)])));
              reg114 <= wire106[(4'hd):(4'hc)];
            end
          else
            begin
              reg110 <= (((^~($unsigned(wire104) + (reg109 ?
                  reg111 : reg110))) * (($unsigned(wire104) ^ $unsigned(wire101)) & wire99)) | wire98[(3'h7):(3'h7)]);
              reg111 <= ($signed(reg113[(2'h2):(1'h0)]) ^ wire104[(2'h3):(1'h0)]);
              reg112 <= (~&($signed(((wire99 != reg111) ?
                  $unsigned(reg110) : $signed(wire101))) >> ((8'haa) * $signed(wire99[(3'h5):(3'h5)]))));
              reg113 <= reg105;
            end
        end
      else
        begin
          reg109 <= $signed($unsigned(reg109));
          reg110 <= (((~$unsigned((wire106 >>> reg114))) ?
                  (({wire99} != $signed(wire108)) - reg110[(1'h0):(1'h0)]) : (^~$unsigned($signed(reg111)))) ?
              {(reg114[(2'h2):(2'h2)] >> $signed((reg111 ^ reg109)))} : $signed((wire104 ?
                  ((wire107 || (7'h43)) ?
                      $signed(wire103) : $unsigned(reg110)) : reg113[(3'h6):(2'h2)])));
        end
      reg115 <= $signed(reg113);
      reg116 <= ($signed((+(^$unsigned(wire104)))) && $signed((($unsigned(wire108) ?
          wire100 : (reg115 >= wire100)) ^ ({reg110, (8'hb6)} ?
          $signed(wire107) : reg115))));
      reg117 <= {$signed(wire102[(2'h2):(1'h0)])};
    end
  assign wire118 = (^$signed(($unsigned((~^reg110)) | ((reg105 ?
                       wire108 : reg109) != (reg115 & (8'ha9))))));
  assign wire119 = (~^($signed((+wire104[(1'h1):(1'h0)])) + wire99));
  always
    @(posedge clk) begin
      if (wire108[(4'h9):(2'h2)])
        begin
          reg120 <= wire102[(1'h1):(1'h1)];
          if (reg117)
            begin
              reg121 <= $unsigned($unsigned((({wire103} >>> wire107) || ($signed(wire103) ?
                  wire107[(4'hb):(2'h3)] : reg120))));
              reg122 <= $unsigned((8'hbb));
              reg123 <= (!$signed(((~&(~&reg122)) ?
                  (!$signed(wire118)) : reg114)));
              reg124 <= ($signed((wire106[(4'he):(4'hd)] || reg113[(1'h0):(1'h0)])) ?
                  reg121 : (^wire99));
              reg125 <= $signed(($signed(((~&reg113) ?
                      (reg113 != wire119) : (wire102 ? (8'ha0) : reg120))) ?
                  {$signed($signed(reg112)),
                      wire107} : (((~&wire98) <= reg111) > ($signed(reg117) | reg120))));
            end
          else
            begin
              reg121 <= wire106;
              reg122 <= $unsigned({wire102[(2'h2):(2'h2)],
                  $unsigned((|$signed(reg116)))});
            end
          reg126 <= reg117[(4'hf):(4'hc)];
        end
      else
        begin
          reg120 <= (8'ha7);
          reg121 <= ((~(({reg124, reg114} | (wire103 <<< reg110)) ?
                  (~wire104[(3'h4):(2'h3)]) : reg111[(1'h1):(1'h1)])) ?
              $unsigned($unsigned({$unsigned(reg125)})) : $signed($signed($signed(((8'hb3) ?
                  wire119 : reg117)))));
          reg122 <= $signed((~^(~|$signed((^~(7'h44))))));
          reg123 <= ($unsigned((reg124[(1'h0):(1'h0)] && reg113[(4'h9):(3'h7)])) ?
              (&((reg126 ? (~(7'h41)) : (^reg125)) ?
                  wire99 : (&$signed(wire100)))) : wire103[(1'h0):(1'h0)]);
          if (reg110[(1'h0):(1'h0)])
            begin
              reg124 <= $signed(($unsigned(((~^wire99) > (wire108 ?
                  reg109 : reg124))) < (8'ha9)));
              reg125 <= $unsigned(wire107[(2'h2):(1'h0)]);
              reg126 <= $signed({{reg114}, wire99[(4'h9):(1'h0)]});
              reg127 <= reg105;
            end
          else
            begin
              reg124 <= (^~$signed({$unsigned({reg114, reg121}),
                  reg109[(2'h3):(2'h3)]}));
              reg125 <= ($unsigned($unsigned(($unsigned(reg113) ?
                      reg124[(2'h2):(2'h2)] : ((8'hbf) ? wire119 : (8'hb5))))) ?
                  {reg112[(2'h3):(2'h3)]} : ($signed($signed((^~reg125))) >> ($signed((wire103 != wire108)) | (reg126[(2'h3):(2'h3)] ?
                      reg126[(1'h1):(1'h1)] : $unsigned(reg110)))));
              reg126 <= wire103;
            end
        end
      reg128 <= $signed($signed((|wire100)));
    end
  assign wire129 = (((($signed((8'hbf)) < {wire103, reg126}) ?
                           $signed(reg111) : ($signed(reg120) ?
                               (wire107 ^ wire100) : (~&(8'hbc)))) ?
                       $signed(wire106) : wire103) > (+($unsigned($signed(wire98)) ?
                       $signed(reg105) : (&(|(8'hae))))));
  assign wire130 = reg122;
  assign wire131 = $unsigned($signed((~|(wire107 < reg109[(2'h2):(2'h2)]))));
  assign wire132 = $signed(wire104[(3'h5):(2'h3)]);
  always
    @(posedge clk) begin
      reg133 <= wire132[(3'h7):(3'h7)];
      reg134 <= $unsigned((wire131 ?
          $unsigned($unsigned($unsigned(reg116))) : (reg120[(4'hb):(4'h9)] >> (~(!reg122)))));
      if (((((reg127 >> reg112) + reg134[(3'h6):(3'h6)]) * reg122[(2'h2):(2'h2)]) > ((wire98[(2'h3):(2'h3)] != ({wire98,
              reg117} ~^ (wire130 << reg134))) ?
          reg125[(2'h2):(2'h2)] : $unsigned(reg133))))
        begin
          if (reg120[(5'h10):(3'h4)])
            begin
              reg135 <= reg113[(1'h0):(1'h0)];
              reg136 <= (wire131[(3'h5):(3'h5)] ?
                  (~(!wire106)) : ((7'h43) ?
                      reg125[(4'ha):(4'ha)] : ((|$unsigned(reg122)) ?
                          (((8'hba) ? (7'h42) : reg124) ?
                              $unsigned(wire132) : ((8'ha4) ?
                                  reg128 : wire107)) : (~|$signed((8'hae))))));
              reg137 <= {(8'hb8)};
              reg138 <= ((&$signed($signed(reg117[(4'hd):(4'h9)]))) || $signed(reg133));
            end
          else
            begin
              reg135 <= (!$unsigned($signed({((8'ha3) == reg134),
                  (wire102 | reg133)})));
              reg136 <= $signed($unsigned($unsigned($signed(((8'ha2) + (8'hbb))))));
              reg137 <= $unsigned($signed(reg105[(4'h9):(4'h8)]));
            end
        end
      else
        begin
          reg135 <= (&(reg136[(4'hb):(4'h9)] ?
              {(!(wire100 ? reg122 : reg125)),
                  $signed((wire100 ? reg134 : reg137))} : $unsigned((+((8'hbe) ?
                  reg134 : wire103)))));
          reg136 <= (~&wire118[(4'h9):(3'h5)]);
        end
      reg139 <= $unsigned((reg110 ?
          $unsigned(wire131[(1'h0):(1'h0)]) : $signed((~|(reg127 != wire106)))));
      if ({$signed($signed($unsigned((reg138 + reg127)))),
          $signed($unsigned(((wire98 | reg116) ?
              (wire100 ? reg110 : reg138) : $signed((8'hac)))))})
        begin
          reg140 <= ((wire131[(1'h0):(1'h0)] >> wire132) ?
              $signed({((-(8'ha8)) >> (reg123 == (8'hb9))),
                  {$unsigned(wire108)}}) : $signed($signed(reg138[(4'hd):(4'hb)])));
          reg141 <= wire104;
          reg142 <= (($signed({{reg120,
                  wire130}}) + wire132[(4'h9):(2'h2)]) != reg139[(1'h1):(1'h0)]);
          reg143 <= (reg140[(3'h5):(2'h3)] ?
              (&{wire101[(1'h1):(1'h1)],
                  reg110[(1'h0):(1'h0)]}) : reg140[(1'h0):(1'h0)]);
          reg144 <= reg137[(4'h9):(3'h6)];
        end
      else
        begin
          reg140 <= (reg124[(2'h2):(1'h0)] && $unsigned(reg140));
        end
    end
  assign wire145 = (wire131 < $unsigned(wire101[(1'h1):(1'h1)]));
endmodule

module module74
#(parameter param94 = (~|({(^~(~&(8'ha6))), (8'hb3)} != {(~(!(8'hbb))), {((8'hab) >>> (7'h44)), {(8'hb4)}}})))
(y, clk, wire78, wire77, wire76, wire75);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire78;
  input wire [(5'h15):(1'h0)] wire77;
  input wire [(5'h14):(1'h0)] wire76;
  input wire [(5'h10):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire91;
  wire [(4'hc):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire79;
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire79,
                 reg89,
                 reg88,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire79 = (~&($signed(wire75[(4'ha):(3'h6)]) + $signed($signed($signed(wire78)))));
  always
    @(posedge clk) begin
      reg80 <= $signed($signed(wire79[(3'h5):(1'h0)]));
      reg81 <= ($unsigned((((reg80 ^ (8'hbd)) ? $unsigned(wire76) : (^wire75)) ?
          $unsigned({reg80}) : $signed((^~wire75)))) ^~ wire75);
      reg82 <= $signed((~^({(+wire75), (wire77 ? reg81 : (8'ha1))} ?
          (&reg81[(1'h0):(1'h0)]) : $signed((wire77 != wire75)))));
      reg83 <= $unsigned((reg80[(3'h4):(1'h0)] ? (+wire75) : reg80));
    end
  assign wire84 = wire78;
  assign wire85 = $unsigned($unsigned(((wire79 <= reg82[(4'ha):(4'ha)]) ?
                      reg82[(4'h8):(2'h2)] : wire79)));
  assign wire86 = wire84;
  assign wire87 = {(-(($signed(reg83) ?
                              reg81[(1'h0):(1'h0)] : $signed(wire86)) ?
                          $signed((reg81 == wire77)) : $unsigned((wire84 ?
                              wire85 : wire86))))};
  always
    @(posedge clk) begin
      reg88 <= $signed($unsigned((reg82[(1'h0):(1'h0)] ?
          ((~&wire87) <<< (reg80 || wire78)) : reg81[(1'h0):(1'h0)])));
      reg89 <= (^$signed({wire79[(1'h0):(1'h0)]}));
    end
  assign wire90 = reg89;
  assign wire91 = $unsigned(($signed(($signed((8'hbb)) || (~|wire87))) ?
                      $unsigned($signed((wire77 ?
                          reg88 : wire75))) : ($signed(((8'ha6) ?
                              wire75 : reg80)) ?
                          {{wire85, reg80},
                              (reg83 ?
                                  wire84 : reg81)} : (-(wire77 + reg82)))));
  assign wire92 = ($unsigned(((&$signed(reg81)) > wire79)) | wire75);
  assign wire93 = ($signed($signed((~^$unsigned(reg88)))) >> ({wire87,
                      wire92[(2'h2):(2'h2)]} >>> wire76));
endmodule

module module25
#(parameter param62 = {{((((8'ha5) ^~ (8'ha2)) ? {(8'hbf), (8'ha2)} : {(8'ha3), (8'hb6)}) && ({(8'h9e)} ? {(8'hab)} : (8'h9c))), (({(8'ha7), (8'hab)} ? (^~(8'h9f)) : (~|(8'hb1))) - ((|(8'ha9)) ? (^(8'h9e)) : ((8'ha6) <= (8'hb3))))}, {((&(|(8'hb4))) ? ({(8'h9d)} ? (~(8'h9d)) : ((8'hae) ? (8'haf) : (8'hbb))) : (((8'hbf) ? (8'ha0) : (8'hb3)) | ((8'ha9) ? (7'h41) : (8'hbe)))), (({(8'hac)} ? ((8'hb0) * (8'hb3)) : (~(8'h9d))) * {(~(8'hb3)), ((8'hb8) <= (8'h9e))})}}, 
parameter param63 = {((8'h9e) >> (~((!(8'hb3)) ? param62 : (8'ha2)))), ((param62 <<< param62) < ((8'hbc) ? (param62 >>> (param62 ? param62 : param62)) : {(param62 <<< param62)}))})
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire30;
  input wire [(5'h11):(1'h0)] wire29;
  input wire [(4'hd):(1'h0)] wire28;
  input wire [(4'h9):(1'h0)] wire27;
  input wire [(3'h4):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg56,
                 reg55,
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
                 (1'h0)};
  assign wire31 = (^(8'hab));
  assign wire32 = $unsigned((({((8'hb7) && wire31), $signed(wire31)} ?
                          ($unsigned(wire29) ?
                              (~&wire28) : (wire26 ?
                                  wire27 : wire31)) : ($signed(wire29) == wire30[(3'h7):(3'h6)])) ?
                      wire29[(4'he):(1'h1)] : wire27[(2'h2):(2'h2)]));
  assign wire33 = ((~^(7'h43)) ?
                      ($unsigned(wire27) ?
                          (~($unsigned(wire28) | (wire30 ?
                              wire32 : wire26))) : $unsigned((wire28[(3'h4):(1'h1)] > $unsigned(wire29)))) : $unsigned($signed($unsigned($signed((8'ha5))))));
  assign wire34 = $unsigned(((^((^~wire32) < wire30[(2'h3):(2'h3)])) <= $unsigned(($signed(wire32) && wire26[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg35 <= (((($signed(wire32) ?
                  (8'hac) : $signed(wire32)) >>> wire32[(3'h4):(2'h2)]) ?
              (8'hbd) : wire27) ?
          (~|wire32[(4'hd):(4'h8)]) : (wire30 ?
              ($signed($unsigned(wire27)) ?
                  $unsigned((wire31 ?
                      wire32 : wire34)) : wire27) : ($unsigned((~^wire31)) ?
                  (|(wire30 ?
                      (8'hb6) : wire34)) : $signed(wire34[(3'h7):(2'h2)]))));
      reg36 <= (^~wire29[(4'hd):(2'h2)]);
      reg37 <= ($unsigned(wire31) >> reg35);
      if (wire26[(1'h1):(1'h0)])
        begin
          if ((^~((wire29 * (!$unsigned(wire29))) * (~^($unsigned(wire28) << $unsigned(reg35))))))
            begin
              reg38 <= ($unsigned(((wire29 ?
                      $signed((8'hb9)) : {reg36, wire28}) ?
                  {(8'haf),
                      (wire28 >> reg35)} : wire32[(5'h11):(4'hf)])) | $signed((($signed(wire32) >= (wire33 + wire28)) ?
                  reg35 : $signed({reg37}))));
            end
          else
            begin
              reg38 <= $unsigned({($signed(wire34) ?
                      ($unsigned(reg38) && {(8'ha9), wire28}) : ({wire31,
                              reg37} ?
                          (|wire34) : $unsigned(reg36)))});
              reg39 <= (~&((~|($unsigned(reg38) ?
                  {(8'hbf)} : (&reg37))) + (~^$signed($unsigned(wire33)))));
            end
          reg40 <= $signed($unsigned(wire33[(3'h4):(2'h3)]));
          if (((|(!({wire27,
              reg37} >>> (wire30 <<< reg35)))) - ($signed(((wire30 ^ reg38) ^ ((8'hbb) <<< (8'ha1)))) > (8'ha0))))
            begin
              reg41 <= $signed((reg40 ?
                  (8'ha5) : (reg39[(3'h6):(3'h6)] ?
                      reg38[(2'h3):(2'h3)] : (wire32 - wire26[(1'h1):(1'h1)]))));
              reg42 <= $signed((wire34 ?
                  wire27 : ({$signed(wire31), (8'haf)} != wire26)));
              reg43 <= ($unsigned(reg36[(3'h5):(3'h4)]) ?
                  $signed($signed(reg42[(1'h1):(1'h0)])) : (wire28[(3'h7):(3'h4)] ?
                      reg41[(4'h9):(1'h1)] : ($unsigned((+wire32)) ?
                          (reg35[(4'h8):(3'h4)] ?
                              (^reg36) : (~|reg42)) : (&(^~(8'hb5))))));
              reg44 <= (!(&$signed(wire30)));
              reg45 <= ((((^$unsigned(wire27)) ?
                          $unsigned((reg37 ?
                              reg38 : reg35)) : $unsigned((wire33 ?
                              wire32 : wire31))) ?
                      reg43[(4'he):(3'h5)] : wire29[(4'ha):(1'h1)]) ?
                  ($signed((~&wire30[(2'h3):(2'h2)])) ?
                      ($signed(reg41[(3'h6):(3'h4)]) ~^ $signed(reg37[(1'h1):(1'h0)])) : reg43[(5'h13):(4'he)]) : reg39[(1'h0):(1'h0)]);
            end
          else
            begin
              reg41 <= ($unsigned($signed(((reg39 ? reg41 : reg43) ?
                      $signed((8'hbd)) : reg40[(2'h3):(2'h2)]))) ?
                  $unsigned(((((8'ha2) >>> reg41) <<< $unsigned(wire29)) ?
                      ((wire32 < reg43) ?
                          wire33 : {reg38,
                              reg39}) : wire27)) : (~|$signed($unsigned((^reg36)))));
            end
          reg46 <= (8'hb7);
          if ($signed((-$unsigned((!((8'ha4) ? wire31 : reg35))))))
            begin
              reg47 <= (!$unsigned($unsigned(wire27[(1'h0):(1'h0)])));
            end
          else
            begin
              reg47 <= (-reg42);
            end
        end
      else
        begin
          reg38 <= $signed((((!$unsigned(wire27)) ?
              $unsigned($signed(reg44)) : {(-(8'ha7))}) && {(8'hb0)}));
          if ($signed(((+reg47) * ($signed((reg47 - wire31)) || ((wire33 < (8'ha6)) ?
              {(8'h9c)} : (reg45 <= wire27))))))
            begin
              reg39 <= reg45[(3'h4):(3'h4)];
            end
          else
            begin
              reg39 <= reg41;
              reg40 <= reg43;
              reg41 <= (^~(~|$unsigned(((wire33 ? reg44 : (8'ha6)) | reg45))));
            end
          if (reg43)
            begin
              reg42 <= $unsigned(reg45[(3'h6):(1'h1)]);
              reg43 <= reg41;
              reg44 <= reg47[(1'h1):(1'h0)];
            end
          else
            begin
              reg42 <= $signed(((|$signed($unsigned(reg42))) < reg39));
              reg43 <= (^~$signed($unsigned(((|(7'h40)) ^~ ((8'hbc) != (8'hb7))))));
              reg44 <= {wire26,
                  $unsigned({((wire26 <= reg41) > {reg46}),
                      reg46[(2'h3):(1'h1)]})};
              reg45 <= $signed(({wire34,
                  (+{(8'ha2)})} || $unsigned(($signed(reg39) ?
                  (~^wire33) : reg36))));
            end
        end
      reg48 <= {((+(^~(^(8'hbd)))) ?
              $signed((((8'ha7) ?
                  reg45 : wire28) || {reg42})) : $signed($unsigned(reg38[(2'h3):(1'h0)])))};
    end
  assign wire49 = reg46[(2'h2):(1'h0)];
  assign wire50 = reg35[(2'h3):(1'h0)];
  assign wire51 = {(~|$unsigned(wire32)),
                      $signed($unsigned(reg48[(2'h2):(1'h1)]))};
  assign wire52 = $signed($signed(reg38));
  assign wire53 = $signed(wire31[(4'hb):(3'h4)]);
  assign wire54 = ({$signed(wire28),
                          $signed(((reg36 ? reg48 : reg35) == (reg45 ?
                              (8'ha8) : reg41)))} ?
                      reg47[(4'hb):(4'h8)] : $unsigned($signed($unsigned((~|reg45)))));
  always
    @(posedge clk) begin
      reg55 <= (8'hb8);
      reg56 <= ($signed($unsigned({(~^reg55)})) ?
          ($signed((8'hb0)) >>> wire31) : ($signed(((reg40 ?
              (8'hb4) : (8'h9c)) || (wire54 ? reg40 : wire33))) + (|reg39)));
    end
  assign wire57 = reg55[(3'h4):(1'h1)];
  assign wire58 = $signed({$unsigned(wire32[(3'h7):(3'h4)]),
                      {(~|wire49[(4'hd):(4'ha)]),
                          $unsigned((reg45 ? wire32 : wire31))}});
  assign wire59 = {$unsigned(($unsigned((-wire52)) <= wire50[(5'h13):(1'h0)]))};
  assign wire60 = ((+$unsigned((~&$unsigned(wire50)))) ?
                      reg42 : (wire53[(3'h5):(1'h1)] ?
                          reg40 : (((!wire51) ? wire53 : (8'h9c)) ?
                              (~&((8'hb8) ?
                                  reg43 : (8'hbb))) : $unsigned($unsigned(reg35)))));
  assign wire61 = $signed((wire57[(2'h2):(1'h0)] ?
                      (reg42[(1'h1):(1'h1)] ? wire59 : reg36) : reg36));
endmodule

module module307
#(parameter param336 = (((({(8'hb8), (8'h9d)} ? ((8'hb9) ? (8'hb2) : (7'h43)) : (!(8'ha5))) - (8'ha2)) ? ((~{(8'ha6), (8'h9c)}) ? {(-(8'had))} : {(~&(8'hba))}) : ((^~(~^(8'ha8))) ? {(+(8'ha8)), ((8'hbc) ? (8'hbf) : (8'h9f))} : {(+(7'h40)), ((8'h9e) && (8'hb3))})) < (8'hbf)))
(y, clk, wire312, wire311, wire310, wire309, wire308);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire312;
  input wire [(5'h13):(1'h0)] wire311;
  input wire signed [(5'h15):(1'h0)] wire310;
  input wire [(5'h13):(1'h0)] wire309;
  input wire [(5'h13):(1'h0)] wire308;
  wire [(4'ha):(1'h0)] wire335;
  wire [(3'h7):(1'h0)] wire334;
  wire [(3'h6):(1'h0)] wire333;
  wire [(4'hf):(1'h0)] wire332;
  wire signed [(4'h9):(1'h0)] wire327;
  wire signed [(4'hb):(1'h0)] wire326;
  wire signed [(3'h7):(1'h0)] wire325;
  wire signed [(3'h6):(1'h0)] wire324;
  reg signed [(4'he):(1'h0)] reg331 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg330 = (1'h0);
  reg [(4'h8):(1'h0)] reg329 = (1'h0);
  reg [(4'hf):(1'h0)] reg328 = (1'h0);
  reg [(4'hc):(1'h0)] reg323 = (1'h0);
  reg [(3'h5):(1'h0)] reg322 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg321 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg320 = (1'h0);
  reg [(4'hd):(1'h0)] reg319 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg318 = (1'h0);
  reg [(4'h8):(1'h0)] reg317 = (1'h0);
  reg [(4'hc):(1'h0)] reg316 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg315 = (1'h0);
  reg [(5'h14):(1'h0)] reg314 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg313 = (1'h0);
  assign y = {wire335,
                 wire334,
                 wire333,
                 wire332,
                 wire327,
                 wire326,
                 wire325,
                 wire324,
                 reg331,
                 reg330,
                 reg329,
                 reg328,
                 reg323,
                 reg322,
                 reg321,
                 reg320,
                 reg319,
                 reg318,
                 reg317,
                 reg316,
                 reg315,
                 reg314,
                 reg313,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg313 <= wire308;
      reg314 <= wire311[(4'h8):(3'h5)];
      if (((wire311 + ((&$signed(reg313)) - {$unsigned(wire308)})) ?
          {((-wire311) - wire311)} : wire308[(5'h13):(5'h12)]))
        begin
          reg315 <= $unsigned((^$signed(((wire312 > reg314) ?
              $unsigned(wire311) : wire311))));
        end
      else
        begin
          if ((wire311 ? $signed(wire312) : wire310[(5'h11):(2'h2)]))
            begin
              reg315 <= ($unsigned($unsigned($signed($unsigned(reg313)))) >= ((~|$unsigned($unsigned(wire309))) > ($signed((wire311 ?
                      (8'ha0) : reg313)) ?
                  (reg314[(3'h4):(3'h4)] && $unsigned(reg314)) : $unsigned((reg315 ?
                      reg313 : (8'hbf))))));
              reg316 <= wire310;
              reg317 <= (reg313[(5'h12):(5'h10)] << (($signed($signed(wire309)) || (~^$unsigned(reg313))) ?
                  $signed(wire310) : {{(|wire308)}}));
              reg318 <= reg315[(2'h2):(1'h0)];
              reg319 <= {reg313, $unsigned(wire308)};
            end
          else
            begin
              reg315 <= reg319;
            end
          reg320 <= ((wire309[(3'h7):(3'h7)] ?
                  (^~($unsigned(wire312) && $signed(reg318))) : ((&$unsigned(reg319)) || (~(^~(8'h9f))))) ?
              (reg317 ?
                  wire311 : {$signed(wire309),
                      $signed($signed(wire311))}) : $signed($signed(reg315)));
          reg321 <= $unsigned($unsigned((+($unsigned(reg319) ?
              (reg318 & reg313) : $unsigned(reg316)))));
          reg322 <= wire308[(1'h1):(1'h0)];
        end
      reg323 <= (wire310[(1'h1):(1'h0)] | (!(~^((|reg315) < (reg313 ?
          (8'hbd) : reg317)))));
    end
  assign wire324 = {($signed(((reg316 | reg313) <= $unsigned(reg322))) ^ ($signed($signed(reg322)) >>> (((8'hac) >= (8'h9f)) + (8'hae)))),
                       $signed({{(reg319 ^ (8'hb8)), $unsigned(reg321)},
                           reg317[(2'h3):(2'h3)]})};
  assign wire325 = reg319[(4'ha):(3'h6)];
  assign wire326 = (~reg317[(4'h8):(3'h7)]);
  assign wire327 = (($signed(($unsigned(wire309) ?
                       wire308 : (8'hab))) << ($unsigned($unsigned(reg318)) * reg320[(2'h3):(1'h0)])) > ($unsigned(wire312) ?
                       wire325[(2'h3):(1'h0)] : wire326[(4'ha):(2'h3)]));
  always
    @(posedge clk) begin
      reg328 <= reg317;
      reg329 <= (8'had);
      reg330 <= ({({((8'hb7) ?
                  (8'hbf) : (8'hbc))} <<< (~((8'hab) <<< wire311)))} ^ (~|reg328));
      reg331 <= reg322;
    end
  assign wire332 = wire312;
  assign wire333 = {wire325};
  assign wire334 = reg318[(2'h2):(1'h0)];
  assign wire335 = ((~&($signed((wire333 ? wire312 : reg331)) ?
                       reg323[(2'h2):(1'h0)] : (~|wire309))) != reg314[(5'h11):(4'he)]);
endmodule

module module230
#(parameter param299 = ((((|((8'h9d) * (8'ha8))) - (8'hb0)) ? (~{(-(7'h43))}) : {(|((8'ha1) ? (8'hb6) : (8'hb4))), (~&((7'h44) ? (8'hbb) : (8'ha7)))}) ? {((!{(8'ha8), (8'ha8)}) ? {((8'hbb) ? (8'haf) : (8'hb4)), ((8'hb9) != (8'hb1))} : (~|{(8'ha4)})), ((((8'haf) ? (8'hb8) : (8'hb7)) != ((8'hbb) <= (7'h42))) >> (((8'hae) && (8'hb7)) ? ((8'hb9) ? (8'hab) : (7'h43)) : ((8'hba) ? (8'haf) : (8'h9e))))} : ({{((8'hab) | (8'ha8))}, (~((8'hbe) ? (8'haf) : (8'h9d)))} >= ((((8'hb2) ? (8'hb5) : (8'hb1)) ? ((8'hbf) <= (8'hb1)) : (8'ha5)) >= (~^((8'hb9) < (8'ha8)))))))
(y, clk, wire234, wire233, wire232, wire231);
  output wire [(32'h2d5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire234;
  input wire [(3'h6):(1'h0)] wire233;
  input wire signed [(4'h9):(1'h0)] wire232;
  input wire [(4'ha):(1'h0)] wire231;
  wire signed [(5'h13):(1'h0)] wire298;
  wire [(5'h13):(1'h0)] wire297;
  wire signed [(5'h13):(1'h0)] wire296;
  wire [(4'ha):(1'h0)] wire285;
  wire signed [(4'hb):(1'h0)] wire284;
  wire signed [(5'h12):(1'h0)] wire280;
  wire [(5'h10):(1'h0)] wire263;
  reg [(5'h15):(1'h0)] reg295 = (1'h0);
  reg [(3'h6):(1'h0)] reg294 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg293 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg292 = (1'h0);
  reg [(3'h6):(1'h0)] reg291 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg290 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg289 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg288 = (1'h0);
  reg signed [(4'he):(1'h0)] reg287 = (1'h0);
  reg [(2'h3):(1'h0)] reg286 = (1'h0);
  reg [(4'ha):(1'h0)] reg283 = (1'h0);
  reg [(2'h2):(1'h0)] reg282 = (1'h0);
  reg [(4'hc):(1'h0)] reg281 = (1'h0);
  reg [(4'h9):(1'h0)] reg279 = (1'h0);
  reg [(3'h6):(1'h0)] reg278 = (1'h0);
  reg [(5'h12):(1'h0)] reg277 = (1'h0);
  reg [(3'h4):(1'h0)] reg276 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg275 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg274 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg273 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg272 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg271 = (1'h0);
  reg [(4'h8):(1'h0)] reg270 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg269 = (1'h0);
  reg [(2'h2):(1'h0)] reg268 = (1'h0);
  reg [(5'h11):(1'h0)] reg267 = (1'h0);
  reg [(5'h12):(1'h0)] reg266 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg265 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg264 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg262 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg261 = (1'h0);
  reg [(5'h12):(1'h0)] reg260 = (1'h0);
  reg [(2'h3):(1'h0)] reg259 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg258 = (1'h0);
  reg [(4'ha):(1'h0)] reg257 = (1'h0);
  reg [(5'h12):(1'h0)] reg256 = (1'h0);
  reg [(5'h10):(1'h0)] reg255 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg254 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg253 = (1'h0);
  reg [(4'h8):(1'h0)] reg252 = (1'h0);
  reg [(4'he):(1'h0)] reg251 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg250 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg249 = (1'h0);
  reg [(3'h4):(1'h0)] reg248 = (1'h0);
  reg [(5'h13):(1'h0)] reg247 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg246 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg245 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg244 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg243 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg242 = (1'h0);
  reg [(5'h10):(1'h0)] reg241 = (1'h0);
  reg [(4'hb):(1'h0)] reg240 = (1'h0);
  reg signed [(4'he):(1'h0)] reg239 = (1'h0);
  reg [(3'h4):(1'h0)] reg238 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg237 = (1'h0);
  reg [(3'h6):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg235 = (1'h0);
  assign y = {wire298,
                 wire297,
                 wire296,
                 wire285,
                 wire284,
                 wire280,
                 wire263,
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
                 reg283,
                 reg282,
                 reg281,
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
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
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
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg235 <= {((wire231[(3'h5):(1'h0)] ?
                  $unsigned(wire234) : $signed((wire234 ^ wire233))) ?
              (~^($signed((8'hbd)) ?
                  wire234 : (!(8'hb0)))) : ($signed((wire233 ?
                  wire231 : wire234)) || $signed((wire234 >= wire231))))};
      reg236 <= $unsigned($signed((-$unsigned((wire234 << (8'hba))))));
      if (reg236)
        begin
          if (wire234)
            begin
              reg237 <= (7'h43);
              reg238 <= reg235;
            end
          else
            begin
              reg237 <= {wire234[(2'h3):(2'h3)], wire233[(3'h5):(2'h3)]};
              reg238 <= $signed(((~^{$signed(reg238)}) || $signed($signed(reg237))));
            end
          reg239 <= wire231[(4'h9):(1'h1)];
          reg240 <= ((wire234[(3'h4):(1'h1)] ?
                  (({reg236} & ((8'hba) || reg235)) ?
                      ((&wire232) > reg238) : reg237[(4'ha):(1'h0)]) : ((((8'hb3) ?
                          wire234 : reg238) ?
                      $unsigned(reg236) : (reg238 ?
                          (8'hba) : reg236)) >> $signed($signed((7'h42))))) ?
              (^~$signed((~^((8'hb8) ~^ wire231)))) : wire231[(3'h7):(2'h3)]);
          reg241 <= {reg235[(4'hd):(3'h7)]};
          reg242 <= reg238[(2'h3):(2'h3)];
        end
      else
        begin
          reg237 <= ({{{$unsigned(reg235),
                      wire232[(3'h5):(1'h1)]}}} >> (((~|$unsigned(reg241)) << ((8'ha3) == $unsigned(reg241))) ?
              $signed({(wire234 < wire232),
                  $unsigned(reg239)}) : reg240[(2'h3):(2'h3)]));
          if (reg239)
            begin
              reg238 <= (!$signed(reg237[(1'h1):(1'h1)]));
              reg239 <= reg239[(4'hb):(3'h4)];
              reg240 <= $unsigned($signed($unsigned(((wire231 ?
                      reg242 : wire231) ?
                  $unsigned(reg242) : (reg240 ? reg240 : reg237)))));
            end
          else
            begin
              reg238 <= (!((wire232[(1'h1):(1'h0)] ?
                      ($signed(wire234) != $signed(reg241)) : reg235[(5'h10):(2'h2)]) ?
                  (|(8'hbd)) : {(reg241 <= wire233), wire231[(1'h1):(1'h1)]}));
              reg239 <= ({reg242[(4'h9):(3'h5)],
                      $signed((~((8'hab) ? (8'had) : wire233)))} ?
                  ($signed(reg236[(3'h5):(2'h3)]) * (+(reg242[(2'h2):(2'h2)] >= reg239[(3'h4):(2'h3)]))) : $unsigned($unsigned({reg236[(1'h1):(1'h0)]})));
              reg240 <= reg239[(2'h3):(2'h2)];
              reg241 <= $signed(reg235[(4'h9):(3'h4)]);
              reg242 <= (($unsigned(((^reg242) ?
                      wire231 : (reg242 == reg239))) != reg242) ?
                  {$signed((~{reg236, reg240}))} : (($signed($signed(reg241)) ?
                      (-{reg238}) : reg238[(3'h4):(2'h3)]) - $unsigned(wire232)));
            end
          reg243 <= $unsigned((reg236[(1'h1):(1'h1)] | $signed(((8'hb0) >>> $unsigned(wire232)))));
        end
      if ((^$unsigned((reg237[(3'h6):(3'h5)] ? reg241 : reg243))))
        begin
          if ($unsigned((~|$unsigned((reg235[(4'hd):(1'h0)] ?
              (8'hbf) : {reg236, reg238})))))
            begin
              reg244 <= reg240[(1'h1):(1'h1)];
              reg245 <= $signed(((^wire231[(3'h6):(2'h2)]) ?
                  ($signed((reg243 ? reg237 : (8'hae))) ?
                      $signed($unsigned(reg235)) : (&$unsigned(reg235))) : reg244));
              reg246 <= reg245[(3'h4):(1'h1)];
              reg247 <= $signed((+$unsigned(reg243)));
              reg248 <= (~((-(reg241 ?
                  (reg239 ?
                      wire231 : reg245) : (wire233 && reg237))) || {((^reg237) ?
                      $unsigned(wire234) : {reg247, reg236})}));
            end
          else
            begin
              reg244 <= {wire231[(2'h3):(1'h0)],
                  ({(((8'hb4) || reg242) > ((8'ha6) | (8'ha1)))} ~^ reg248[(3'h4):(2'h3)])};
              reg245 <= reg242[(2'h3):(1'h0)];
              reg246 <= (~(+(reg238 ? $signed($unsigned(reg248)) : reg243)));
            end
          reg249 <= $unsigned(($signed({(wire231 * reg248)}) + $unsigned({{(8'had),
                  wire233},
              (-reg246)})));
          if ($unsigned(reg248))
            begin
              reg250 <= reg241[(2'h2):(2'h2)];
            end
          else
            begin
              reg250 <= $unsigned($unsigned(reg236));
              reg251 <= ($unsigned((($unsigned(reg245) ?
                      (+reg241) : (reg240 >> reg245)) ?
                  ($unsigned(reg246) ^ reg240) : $unsigned(reg243[(1'h1):(1'h1)]))) != (^~(reg242[(4'hc):(1'h0)] & $unsigned($unsigned(reg239)))));
              reg252 <= (^$signed((~^reg244[(2'h2):(1'h1)])));
            end
          if ($signed((+$unsigned(reg239[(4'h8):(1'h1)]))))
            begin
              reg253 <= (|reg245[(5'h12):(4'he)]);
              reg254 <= $unsigned(reg235);
              reg255 <= (reg239 ?
                  $signed($unsigned(($signed((8'ha1)) ?
                      wire233 : reg236))) : {$unsigned({(^reg247)})});
              reg256 <= $unsigned((-wire231[(2'h2):(1'h1)]));
            end
          else
            begin
              reg253 <= (reg243[(2'h2):(1'h1)] ?
                  ($signed($signed(reg249)) | reg243) : $unsigned(($unsigned((-reg253)) ?
                      reg235[(4'hb):(3'h6)] : $signed(reg244[(1'h0):(1'h0)]))));
              reg254 <= $unsigned((^~$unsigned((reg243 ?
                  $signed(reg253) : (^~reg249)))));
              reg255 <= $signed((-((reg249[(2'h2):(2'h2)] & (reg242 & reg249)) + ((^(8'hb6)) ?
                  reg237[(1'h0):(1'h0)] : reg249))));
              reg256 <= (~^reg252[(3'h4):(1'h1)]);
            end
          if (reg236[(1'h1):(1'h1)])
            begin
              reg257 <= wire233;
              reg258 <= (reg242 && ($signed(reg253[(1'h0):(1'h0)]) ?
                  {$unsigned(reg235)} : (8'ha0)));
            end
          else
            begin
              reg257 <= (reg256[(4'h8):(4'h8)] ~^ $unsigned(((^~(!reg239)) << {(8'ha2),
                  wire231[(2'h2):(1'h1)]})));
              reg258 <= reg241[(4'hb):(1'h0)];
              reg259 <= (reg245[(3'h7):(3'h6)] ^~ reg251[(4'ha):(4'h8)]);
              reg260 <= $unsigned(($unsigned(reg251) >= ({(reg240 >>> (8'ha2))} << reg254)));
              reg261 <= (reg257[(2'h3):(1'h0)] < reg247[(3'h7):(3'h5)]);
            end
        end
      else
        begin
          reg244 <= wire231[(4'h8):(4'h8)];
          reg245 <= ((7'h41) ? reg258[(3'h5):(2'h3)] : reg247[(4'he):(4'hc)]);
          reg246 <= $signed(reg251[(3'h4):(2'h2)]);
        end
      reg262 <= ($signed(reg254[(4'ha):(3'h7)]) ?
          ((reg261 ?
              ($unsigned(reg239) ?
                  (reg244 ?
                      wire234 : reg238) : {reg246}) : (wire234[(1'h1):(1'h1)] ?
                  $unsigned((8'h9f)) : ((8'haa) ?
                      reg245 : reg259))) - reg236) : (~|(reg238 ?
              $unsigned({(8'h9f), reg251}) : ($signed(reg247) ?
                  (reg256 || (8'hbf)) : (reg242 == (8'ha0))))));
    end
  assign wire263 = reg241;
  always
    @(posedge clk) begin
      if (reg253[(1'h0):(1'h0)])
        begin
          reg264 <= ({$signed(((reg258 ^ wire234) ?
                      $signed(wire234) : (wire233 << reg242))),
                  wire231} ?
              ($unsigned((~|reg245)) > reg237) : ($signed($signed($signed(reg247))) <<< wire232));
          if (reg245)
            begin
              reg265 <= reg260[(4'hc):(1'h1)];
              reg266 <= {$signed(reg256)};
              reg267 <= reg249;
              reg268 <= (reg257[(4'h9):(1'h1)] << $unsigned($unsigned(wire231)));
            end
          else
            begin
              reg265 <= reg250[(3'h6):(2'h2)];
              reg266 <= reg249;
            end
          reg269 <= ($signed((&$unsigned({reg243, wire234}))) ~^ reg240);
        end
      else
        begin
          if ((8'ha5))
            begin
              reg264 <= $signed((reg235[(4'he):(3'h7)] ?
                  wire263[(3'h6):(1'h1)] : reg237));
              reg265 <= $unsigned($signed(reg238[(2'h3):(1'h1)]));
              reg266 <= ($signed((($signed(reg264) ?
                      reg238[(1'h0):(1'h0)] : (^reg261)) < (~(reg239 ?
                      reg264 : reg245)))) ?
                  reg262 : reg265);
            end
          else
            begin
              reg264 <= reg244[(2'h3):(2'h3)];
              reg265 <= $unsigned($unsigned($signed($unsigned($unsigned((8'ha1))))));
              reg266 <= (8'ha0);
              reg267 <= (!($signed($signed(wire233[(3'h4):(2'h3)])) ?
                  (&$unsigned((~|wire263))) : ((7'h43) ?
                      reg267[(4'hf):(4'ha)] : reg242)));
              reg268 <= reg247[(2'h3):(1'h1)];
            end
          if ({$signed(reg254)})
            begin
              reg269 <= reg244;
              reg270 <= (8'hb2);
              reg271 <= (($unsigned(($signed(wire231) ~^ (~&wire233))) >= $unsigned(((reg252 ?
                      reg248 : reg264) ?
                  (+wire233) : (reg261 >= reg246)))) - reg266);
            end
          else
            begin
              reg269 <= reg261;
              reg270 <= reg236;
              reg271 <= $signed({$unsigned((-$signed(reg260)))});
              reg272 <= reg267;
              reg273 <= ((reg270 ~^ reg266) + (((~|(reg247 ?
                  reg259 : reg248)) ~^ $signed($signed(reg253))) > reg236[(1'h0):(1'h0)]));
            end
        end
      if ($unsigned({reg273[(2'h3):(2'h3)], $signed(reg257)}))
        begin
          if ($unsigned({(~|reg238)}))
            begin
              reg274 <= (reg265[(2'h3):(1'h0)] != wire234[(3'h5):(1'h0)]);
              reg275 <= (~^$signed((reg247[(2'h2):(1'h1)] == reg251[(4'he):(4'ha)])));
            end
          else
            begin
              reg274 <= ($signed($unsigned((+wire263[(3'h7):(3'h5)]))) == reg272[(3'h6):(3'h5)]);
            end
          reg276 <= ((($signed(reg241) < $unsigned((wire234 ?
                  reg257 : reg270))) ?
              reg275 : (~$signed({reg254}))) >>> (~$signed($signed({(8'ha7),
              reg244}))));
          reg277 <= reg249;
        end
      else
        begin
          reg274 <= {($signed({(reg235 | wire232)}) ^~ $unsigned({reg239[(4'h9):(2'h3)]})),
              $unsigned((-(~&reg257)))};
          reg275 <= reg265[(3'h6):(3'h6)];
          reg276 <= {reg245, reg269[(2'h2):(1'h0)]};
        end
    end
  always
    @(posedge clk) begin
      reg278 <= $signed($unsigned(reg253));
      reg279 <= wire263;
    end
  assign wire280 = $signed((+reg249));
  always
    @(posedge clk) begin
      reg281 <= reg238;
      reg282 <= {$signed((!(reg260 || reg266[(4'h8):(2'h2)])))};
      reg283 <= reg282[(1'h0):(1'h0)];
    end
  assign wire284 = reg274;
  assign wire285 = reg261[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (reg269[(1'h1):(1'h1)])
        begin
          if ((($signed($signed((reg264 ?
              wire263 : (8'ha9)))) > ({(!reg276)} && $unsigned((reg241 | wire284)))) > $unsigned({reg251[(2'h2):(1'h0)],
              $unsigned(reg239[(4'hc):(2'h2)])})))
            begin
              reg286 <= (^$signed(wire231));
            end
          else
            begin
              reg286 <= $unsigned(($unsigned(reg262[(2'h2):(1'h0)]) ?
                  (((8'ha2) ?
                      reg278 : $unsigned((8'hbe))) - $signed($signed(reg266))) : reg253));
            end
        end
      else
        begin
          reg286 <= {reg259[(2'h3):(1'h1)],
              (^(reg260[(4'hb):(3'h5)] ?
                  $unsigned({reg276}) : $unsigned(reg239[(2'h3):(1'h0)])))};
          reg287 <= (~($signed($signed({wire233})) >> $signed(reg255)));
          if ($unsigned((|(~reg243))))
            begin
              reg288 <= (~|(&reg241));
              reg289 <= (((~^$unsigned(reg275)) << $unsigned($unsigned((~^reg250)))) ?
                  ((reg271[(4'hb):(2'h2)] ?
                          reg266[(4'hf):(4'hf)] : (^{reg239, reg271})) ?
                      ($signed($signed(reg286)) ?
                          ((~&reg235) ?
                              ((7'h40) ?
                                  reg242 : reg271) : $unsigned(wire233)) : $unsigned(reg268[(1'h1):(1'h0)])) : ($signed((reg283 && reg252)) ?
                          ($unsigned(reg271) * $signed((8'hbe))) : (~&reg242))) : (reg258 > ({{wire232}} | reg270[(3'h4):(2'h2)])));
              reg290 <= reg282[(1'h0):(1'h0)];
              reg291 <= $unsigned($signed((^~(&reg289))));
            end
          else
            begin
              reg288 <= (&(&reg266[(4'h8):(3'h7)]));
              reg289 <= (~|$unsigned({($signed(reg247) >> reg268[(1'h0):(1'h0)])}));
            end
          reg292 <= (($signed($unsigned($unsigned(reg290))) ?
                  $signed(reg276[(2'h3):(2'h3)]) : reg265[(3'h5):(2'h2)]) ?
              ((reg270[(3'h6):(1'h1)] ?
                  $signed(reg277[(2'h2):(2'h2)]) : ({reg287, reg246} ?
                      $unsigned(reg242) : $signed(reg262))) == ((!$signed(wire280)) ?
                  {reg260[(4'hd):(3'h4)],
                      (reg243 & reg245)} : $unsigned((reg286 ?
                      reg290 : wire232)))) : reg269);
        end
    end
  always
    @(posedge clk) begin
      reg293 <= ((8'had) || $unsigned($unsigned($unsigned({reg264}))));
      reg294 <= reg247;
      reg295 <= (8'hb2);
    end
  assign wire296 = ($unsigned($signed((~&$unsigned((8'hb1))))) ?
                       (-(~|(reg236 | $signed(reg261)))) : reg288);
  assign wire297 = ({(~&(&$unsigned(wire263))), reg289} ?
                       reg266[(3'h4):(2'h3)] : $unsigned($signed(((-reg282) + wire234[(1'h0):(1'h0)]))));
  assign wire298 = $signed((($unsigned((^reg277)) ?
                       reg262 : $unsigned((reg259 + reg249))) <<< {{((8'ha4) != reg244),
                           (reg282 | reg248)},
                       (reg236[(2'h3):(1'h0)] != $signed((8'hae)))}));
endmodule
