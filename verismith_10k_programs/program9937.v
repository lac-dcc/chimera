module top
#(parameter param211 = (^(~|{({(8'ha0)} ? {(8'hba), (8'hb0)} : ((8'ha3) ? (8'hbf) : (8'hbd)))})), 
parameter param212 = ((((^~{param211}) ? {(param211 ? (8'hbf) : param211)} : param211) || ((((8'hb5) ? param211 : param211) ? (param211 | param211) : (param211 > (8'hb5))) == ((+param211) ? (param211 ? param211 : param211) : (param211 ? param211 : param211)))) ~^ param211))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire191;
  wire signed [(5'h15):(1'h0)] wire190;
  wire [(3'h5):(1'h0)] wire189;
  wire [(4'hb):(1'h0)] wire188;
  wire signed [(5'h13):(1'h0)] wire182;
  wire [(3'h4):(1'h0)] wire181;
  wire signed [(4'hd):(1'h0)] wire180;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire178;
  reg [(5'h11):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg208 = (1'h0);
  reg [(3'h5):(1'h0)] reg207 = (1'h0);
  reg [(4'he):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg205 = (1'h0);
  reg [(4'hc):(1'h0)] reg204 = (1'h0);
  reg [(3'h4):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg202 = (1'h0);
  reg [(4'h9):(1'h0)] reg201 = (1'h0);
  reg [(4'ha):(1'h0)] reg200 = (1'h0);
  reg [(5'h11):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg194 = (1'h0);
  reg [(5'h13):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg187 = (1'h0);
  reg [(4'hd):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg183 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire182,
                 wire181,
                 wire180,
                 wire5,
                 wire6,
                 wire7,
                 wire178,
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
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 (1'h0)};
  assign wire5 = $signed((~&wire4[(3'h7):(1'h1)]));
  assign wire6 = (wire5 ?
                     wire2[(2'h2):(2'h2)] : $unsigned(((wire5[(4'hd):(3'h7)] || (wire3 == wire1)) & $signed({wire3}))));
  assign wire7 = (^{wire5[(2'h2):(1'h0)]});
  module8 #() modinst179 (.clk(clk), .wire11(wire2), .wire9(wire7), .wire13(wire3), .wire12(wire0), .wire10(wire1), .y(wire178));
  assign wire180 = $unsigned($signed((wire178 ?
                       ($unsigned((8'ha7)) ?
                           $signed(wire2) : (+(8'hb1))) : wire7[(4'hd):(4'hc)])));
  assign wire181 = (wire6[(4'h9):(4'h9)] ?
                       $signed((^~wire6[(4'h8):(3'h7)])) : $signed(wire4[(3'h6):(3'h6)]));
  assign wire182 = $signed($unsigned(wire0[(4'h8):(2'h2)]));
  always
    @(posedge clk) begin
      if (wire6)
        begin
          if ((8'hac))
            begin
              reg183 <= $unsigned($signed((^~(wire182[(3'h5):(2'h3)] <<< (8'ha2)))));
              reg184 <= wire7[(5'h12):(4'h9)];
              reg185 <= ($signed($signed(($unsigned((8'hb2)) - wire2[(3'h4):(2'h2)]))) ?
                  (|wire1[(2'h2):(1'h0)]) : {wire180, wire181[(1'h0):(1'h0)]});
              reg186 <= ($unsigned((&((reg185 ? (8'ha7) : wire5) ?
                      (wire6 ? wire4 : wire181) : (|wire2)))) ?
                  $unsigned(wire178[(1'h1):(1'h0)]) : (~&$unsigned(wire178)));
              reg187 <= ($unsigned((~$unsigned($unsigned(wire2)))) ?
                  (((reg183 || (&wire178)) ?
                          (~&((8'hb7) ? (8'h9e) : wire181)) : wire2) ?
                      ($unsigned((wire4 || wire3)) ?
                          {wire1[(3'h4):(2'h3)]} : $signed({wire6,
                              wire7})) : (wire3[(4'ha):(4'ha)] ?
                          reg184[(4'hb):(4'ha)] : ((reg186 ?
                              wire181 : wire4) & (~|wire7)))) : ($signed(reg183[(1'h0):(1'h0)]) ?
                      $signed(wire178) : $unsigned(wire3[(1'h1):(1'h1)])));
            end
          else
            begin
              reg183 <= reg185;
              reg184 <= $unsigned((|(wire4[(3'h6):(1'h1)] ?
                  reg187[(3'h6):(2'h3)] : reg183)));
              reg185 <= $unsigned((&$signed((~&$signed((8'had))))));
              reg186 <= {wire178};
              reg187 <= $unsigned(($signed(($signed(reg183) > wire182)) <= $unsigned((wire2[(2'h2):(2'h2)] + reg187))));
            end
        end
      else
        begin
          reg183 <= wire180[(3'h4):(2'h2)];
        end
    end
  assign wire188 = reg184;
  assign wire189 = $signed(wire3[(4'h8):(3'h4)]);
  assign wire190 = (^wire180[(4'h9):(3'h6)]);
  assign wire191 = ((+$unsigned((wire180 ? wire181 : $unsigned(wire182)))) ?
                       wire190[(2'h3):(2'h2)] : wire181);
  always
    @(posedge clk) begin
      if (((wire6[(5'h10):(2'h2)] <<< (!$unsigned(wire5[(4'h8):(3'h6)]))) | $signed(($signed($signed(wire1)) >> wire190[(4'hb):(1'h0)]))))
        begin
          reg192 <= wire5[(4'h8):(3'h5)];
          reg193 <= reg183[(2'h2):(1'h1)];
        end
      else
        begin
          reg192 <= $signed(wire190[(3'h6):(3'h6)]);
          reg193 <= $unsigned({(-$unsigned((wire180 ? wire189 : reg185))),
              wire181[(3'h4):(2'h2)]});
          reg194 <= ($signed((((^reg183) ?
              reg183[(2'h2):(2'h2)] : wire4) <<< ((-wire1) ?
              (!reg183) : (wire7 < wire1)))) >> wire4);
          reg195 <= ((~^$unsigned(reg187)) ?
              (7'h41) : {wire191[(3'h4):(2'h3)]});
          reg196 <= $signed($signed((^~($unsigned(reg195) < $signed(reg195)))));
        end
      if ($unsigned(reg183[(2'h2):(2'h2)]))
        begin
          reg197 <= $signed(($unsigned(({(8'ha6),
              reg194} << $unsigned(wire4))) ~^ $unsigned(((wire1 & reg184) ^ $signed(reg195)))));
          reg198 <= $signed($unsigned(reg185));
          if ((^~((({wire178, wire7} ?
                  $signed(reg198) : (-reg192)) & ((+wire6) <<< $unsigned(wire2))) ?
              (8'hb4) : wire3)))
            begin
              reg199 <= ({(&wire0)} >>> (|$signed(reg185)));
              reg200 <= ($signed(($unsigned(reg185[(3'h5):(2'h3)]) & reg192)) ?
                  reg194 : wire178[(1'h0):(1'h0)]);
            end
          else
            begin
              reg199 <= $unsigned((~&reg195[(1'h0):(1'h0)]));
              reg200 <= (reg197[(4'hf):(2'h3)] ?
                  ((|({reg192, reg186} || {wire180,
                      reg197})) ^ wire181) : reg183[(2'h3):(1'h1)]);
              reg201 <= wire4;
            end
          reg202 <= {(^(((wire181 >> (8'hb8)) > (wire181 ? (8'hbe) : (8'hac))) ?
                  $unsigned((~|wire5)) : ({(8'ha0)} + $unsigned((8'hb1))))),
              $unsigned($signed($signed($unsigned(reg197))))};
          reg203 <= {reg187,
              ($unsigned(((&reg197) >= (^reg184))) | $signed(((reg185 < wire5) ?
                  (^~reg197) : (reg186 & reg183))))};
        end
      else
        begin
          reg197 <= wire180;
          if (($signed({wire4}) ?
              $signed(($signed(wire7) | $unsigned((^~reg193)))) : $signed(reg183)))
            begin
              reg198 <= $unsigned((-(((reg192 >> reg202) ~^ ((8'ha8) ?
                  reg199 : (8'ha4))) & ((~|wire6) - $signed(reg196)))));
              reg199 <= $signed(((wire2 ?
                  (~^$signed((8'hb8))) : reg195[(1'h0):(1'h0)]) * (~&{(wire3 ?
                      reg184 : (8'hb0))})));
              reg200 <= reg201;
            end
          else
            begin
              reg198 <= (-{reg187[(3'h6):(3'h4)]});
              reg199 <= reg199;
            end
          if ((&reg199))
            begin
              reg201 <= reg184;
              reg202 <= wire5[(4'h8):(3'h4)];
            end
          else
            begin
              reg201 <= (-(~&{{$signed(reg201)}}));
            end
          reg203 <= (-reg184[(4'hc):(3'h6)]);
          reg204 <= $signed(($signed(((!reg194) ?
                  (reg183 ? wire181 : reg196) : {reg195})) ?
              $unsigned({(~|(8'ha2)),
                  (wire180 < reg194)}) : reg195[(1'h0):(1'h0)]));
        end
      if (wire180[(4'hc):(3'h7)])
        begin
          reg205 <= ((({{(8'h9c)}} > wire4) << $signed($signed((8'hb5)))) > ((|wire4[(3'h7):(3'h7)]) <<< $unsigned($signed($unsigned(wire180)))));
        end
      else
        begin
          if (((^(!wire178[(3'h4):(2'h3)])) ?
              $unsigned(reg205) : reg203[(3'h4):(1'h0)]))
            begin
              reg205 <= wire190[(4'h9):(1'h1)];
              reg206 <= $signed(reg183);
              reg207 <= (&(8'ha5));
            end
          else
            begin
              reg205 <= $unsigned($unsigned((^reg197)));
              reg206 <= reg185;
              reg207 <= wire188[(4'h8):(1'h1)];
            end
          reg208 <= ({($unsigned({(7'h41), reg183}) ?
                      $unsigned($unsigned(reg204)) : $signed((reg203 | wire2))),
                  ($signed(reg185) <= {(wire181 ? reg201 : reg206)})} ?
              ($signed($unsigned((reg183 ? reg205 : wire7))) ^~ (wire7 ?
                  reg184[(3'h4):(2'h2)] : ((^wire0) > (wire2 - reg202)))) : $signed({(wire2[(1'h1):(1'h0)] ^ (reg192 ?
                      reg205 : wire0))}));
          reg209 <= wire182[(4'hd):(1'h1)];
        end
      reg210 <= reg204;
    end
endmodule

module module8
#(parameter param177 = {(((((8'ha0) ^~ (8'hb6)) ? {(8'h9d), (8'hbb)} : (&(8'had))) ? (&(&(8'haa))) : (((8'hb0) ? (8'hb6) : (8'hb3)) || ((7'h42) ? (8'h9d) : (8'ha8)))) ? (({(8'haf)} ? (8'hb1) : ((8'h9f) - (7'h41))) >= ((-(8'ha1)) == ((8'hab) ? (8'h9f) : (8'h9e)))) : (^~(~|{(8'h9e), (8'hbd)}))), {(+(~|{(8'hb8), (8'hbd)}))}})
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire176;
  wire [(3'h6):(1'h0)] wire175;
  wire signed [(5'h14):(1'h0)] wire165;
  wire signed [(4'ha):(1'h0)] wire163;
  wire [(4'he):(1'h0)] wire162;
  wire [(5'h13):(1'h0)] wire161;
  wire [(5'h11):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire108;
  wire signed [(3'h4):(1'h0)] wire159;
  reg signed [(5'h14):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg173 = (1'h0);
  reg [(3'h5):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg signed [(4'he):(1'h0)] reg170 = (1'h0);
  reg [(2'h3):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg167 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg166 = (1'h0);
  reg [(3'h4):(1'h0)] reg164 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire165,
                 wire163,
                 wire162,
                 wire161,
                 wire35,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire51,
                 wire52,
                 wire53,
                 wire104,
                 wire106,
                 wire107,
                 wire108,
                 wire159,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg164,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 (1'h0)};
  module14 #() modinst36 (wire35, clk, wire10, wire9, wire12, wire13);
  assign wire37 = $signed($signed($unsigned({wire13[(4'ha):(4'h9)], wire13})));
  assign wire38 = {wire37};
  assign wire39 = wire10;
  assign wire40 = (8'hac);
  always
    @(posedge clk) begin
      reg41 <= {wire37};
      reg42 <= $signed((wire13[(4'h8):(3'h7)] ?
          wire39 : (wire10 ~^ wire9[(5'h11):(2'h2)])));
      reg43 <= $unsigned($signed(((((8'haa) || wire35) ?
          {wire11, wire38} : {wire35}) >> (&wire40[(4'hd):(4'hb)]))));
      if (wire38)
        begin
          reg44 <= $signed({(|$unsigned($signed(wire13)))});
        end
      else
        begin
          reg44 <= $signed($unsigned(($signed((wire9 == (8'ha7))) ^ ((reg44 ?
                  (7'h43) : wire38) ?
              {wire13, reg43} : {wire37, reg41}))));
          if (wire38)
            begin
              reg45 <= (($signed(($signed(wire38) ?
                          wire39 : wire9[(4'he):(4'he)])) ?
                      wire13 : (((7'h44) ?
                          (8'h9c) : (reg41 + reg43)) >= reg42[(5'h12):(4'he)])) ?
                  wire11 : ($unsigned(($signed((8'hbb)) ?
                          wire12 : $unsigned(wire40))) ?
                      wire39 : wire35[(4'h9):(3'h6)]));
              reg46 <= ($unsigned(wire39) << (reg43[(3'h4):(2'h2)] ?
                  $unsigned(($signed(reg44) ~^ wire39)) : $unsigned(wire37)));
            end
          else
            begin
              reg45 <= wire39;
              reg46 <= {wire12[(5'h12):(5'h11)],
                  $unsigned((~&((wire12 ? wire11 : wire40) ?
                      (wire40 ? wire9 : wire35) : wire12[(4'he):(2'h3)])))};
              reg47 <= (|reg41[(3'h5):(1'h1)]);
              reg48 <= reg42[(1'h1):(1'h1)];
              reg49 <= wire9;
            end
        end
      reg50 <= (($unsigned(reg42) ?
          wire40[(5'h12):(5'h10)] : (wire37[(2'h2):(1'h0)] <<< reg46)) == reg42);
    end
  assign wire51 = (($signed({{wire38}, wire40[(3'h5):(1'h0)]}) > (8'hbb)) ?
                      $unsigned(({reg46[(4'hb):(2'h3)]} || $unsigned((reg43 ?
                          reg41 : wire40)))) : $signed(reg47[(4'h8):(2'h3)]));
  assign wire52 = (($unsigned({$signed(wire9)}) ?
                          reg42[(4'h9):(3'h5)] : wire13) ?
                      reg44[(1'h1):(1'h1)] : (~&$unsigned($signed({wire9}))));
  assign wire53 = (reg47 ?
                      $unsigned($unsigned((~|(wire51 ^~ wire38)))) : $unsigned(reg47));
  module54 #() modinst105 (.wire58(wire39), .wire56(reg50), .wire55(reg49), .wire59(reg46), .clk(clk), .wire57(wire37), .y(wire104));
  assign wire106 = $signed($unsigned((wire9[(5'h14):(3'h6)] * $signed($signed((8'h9e))))));
  assign wire107 = wire53;
  assign wire108 = wire11[(1'h0):(1'h0)];
  module109 #() modinst160 (wire159, clk, reg42, wire38, wire12, reg45, wire37);
  assign wire161 = $signed($unsigned($signed((&wire159[(1'h1):(1'h1)]))));
  assign wire162 = $signed(((wire52[(3'h5):(1'h0)] ^ $signed($unsigned(reg44))) | $signed(((~^wire52) ?
                       ((7'h43) ? reg42 : (8'ha5)) : wire104))));
  assign wire163 = (~((wire104 <= ((reg42 ? wire104 : wire104) ?
                       $unsigned(reg41) : wire13)) || (+$signed((wire159 >>> wire13)))));
  always
    @(posedge clk) begin
      reg164 <= ((^reg43) || (^~$unsigned(wire11)));
    end
  assign wire165 = (reg48[(4'ha):(1'h1)] ?
                       {$signed((wire52[(2'h2):(1'h1)] >>> $unsigned(wire39)))} : wire108[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg166 <= $signed(reg46[(2'h2):(1'h1)]);
      if ((8'hb0))
        begin
          reg167 <= wire104;
        end
      else
        begin
          if (((wire51 ?
              {(wire12 > (~wire12)),
                  wire12[(5'h10):(1'h1)]} : (~^((~|reg47) <<< $signed(wire13)))) && wire161[(4'hc):(2'h3)]))
            begin
              reg167 <= (($unsigned({(^reg50),
                  reg44}) >> reg41) ^~ (~|$signed($unsigned(((8'hb9) ?
                  wire51 : reg166)))));
            end
          else
            begin
              reg167 <= ((8'hb9) ~^ (^~reg166));
              reg168 <= {$unsigned((+(+(wire40 != reg46))))};
              reg169 <= $unsigned(((8'hbc) > (wire51 << (~&reg44))));
            end
          reg170 <= $signed($unsigned($unsigned(((~&wire163) ?
              (wire163 - wire38) : (wire104 ? (7'h42) : wire9)))));
          reg171 <= (~(+wire39));
        end
      reg172 <= reg164;
      reg173 <= wire9;
      reg174 <= ((($unsigned(reg170) ?
              reg169 : {$signed(wire37),
                  reg169[(2'h3):(1'h0)]}) || reg172[(1'h0):(1'h0)]) ?
          wire161[(4'hf):(2'h3)] : reg41[(1'h1):(1'h0)]);
    end
  assign wire175 = reg43[(3'h5):(1'h1)];
  assign wire176 = (wire159 ?
                       $unsigned((((wire51 ^ (7'h40)) ?
                           $unsigned(wire162) : $signed(reg44)) < $unsigned((&reg170)))) : $signed(((~&reg50[(1'h0):(1'h0)]) <= {(wire106 ^ wire37),
                           wire13[(3'h5):(3'h5)]})));
endmodule

module module109
#(parameter param157 = ({(&(+((8'ha8) >>> (8'hbe)))), (({(8'hb7)} ? ((8'hae) ~^ (8'hbc)) : {(8'h9c)}) ? {(&(8'hb0))} : (8'ha1))} + (-(8'haa))), 
parameter param158 = (((!param157) >= ((+(~^param157)) <<< (~{(8'ha2)}))) && ({param157, (((7'h43) ? (8'ha0) : param157) ? ((8'ha9) ? param157 : param157) : (param157 ? param157 : param157))} <<< {(~|(~|(8'ha6))), (~&(~|param157))})))
(y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'h1d8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire114;
  input wire [(4'hf):(1'h0)] wire113;
  input wire signed [(5'h11):(1'h0)] wire112;
  input wire signed [(2'h3):(1'h0)] wire111;
  input wire signed [(2'h2):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire155;
  wire [(4'hf):(1'h0)] wire149;
  wire [(5'h14):(1'h0)] wire148;
  wire signed [(3'h7):(1'h0)] wire147;
  wire [(4'hf):(1'h0)] wire146;
  wire [(5'h12):(1'h0)] wire145;
  wire signed [(4'hf):(1'h0)] wire144;
  wire [(2'h3):(1'h0)] wire142;
  wire signed [(3'h7):(1'h0)] wire129;
  wire signed [(4'hb):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire126;
  wire signed [(5'h15):(1'h0)] wire119;
  wire signed [(5'h15):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire115;
  reg signed [(4'hc):(1'h0)] reg156 = (1'h0);
  reg [(2'h3):(1'h0)] reg154 = (1'h0);
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg143 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg [(3'h6):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg139 = (1'h0);
  reg [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(5'h12):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg [(3'h4):(1'h0)] reg131 = (1'h0);
  reg [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  assign y = {wire155,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire142,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 reg156,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg143,
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
                 reg131,
                 reg130,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire115 = $unsigned($signed(($unsigned((~^(8'ha6))) ?
                       {(+wire113),
                           (wire112 ? wire113 : (8'ha1))} : {$unsigned(wire114),
                           wire112})));
  assign wire116 = wire113;
  assign wire117 = wire114;
  assign wire118 = (wire112 && {$signed(((wire116 >> (8'hb6)) ?
                           $signed(wire115) : wire115[(2'h3):(2'h2)]))});
  assign wire119 = $signed(($unsigned((((8'ha2) && wire118) ?
                       $unsigned(wire110) : (wire117 ?
                           wire114 : (8'ha1)))) != wire117[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      if ($unsigned((-(wire119 ?
          (wire115[(3'h5):(3'h4)] ?
              (wire110 ? (8'ha8) : wire118) : (8'h9c)) : ((wire116 - wire112) ?
              (8'ha9) : wire113[(2'h2):(2'h2)])))))
        begin
          reg120 <= (8'h9e);
          reg121 <= {wire115};
          reg122 <= wire113[(3'h7):(3'h4)];
        end
      else
        begin
          reg120 <= wire117;
          reg121 <= ($signed((^(wire118[(4'hc):(1'h0)] < (wire114 ?
                  reg120 : wire119)))) ?
              $unsigned((((wire110 - wire110) | $signed(wire117)) ?
                  reg122[(1'h1):(1'h0)] : reg122[(3'h4):(3'h4)])) : {$unsigned((+{wire119,
                      wire116}))});
          reg122 <= (&$signed(wire118[(1'h1):(1'h1)]));
          reg123 <= $signed(({{$unsigned(wire115)}} || $signed($signed((wire117 >>> wire117)))));
          reg124 <= $signed(wire110);
        end
      reg125 <= ($signed($signed($unsigned(reg124[(1'h0):(1'h0)]))) ?
          $unsigned(((^~$unsigned(reg121)) | reg120[(2'h2):(1'h0)])) : $signed((-((wire119 ?
              wire118 : (8'hab)) == (wire119 ? reg122 : wire112)))));
    end
  assign wire126 = wire116;
  assign wire127 = wire113;
  assign wire128 = {$signed((reg123 ^ reg120))};
  assign wire129 = {($signed(reg123[(1'h0):(1'h0)]) ?
                           {($unsigned(wire111) | ((8'hbb) >= (8'hae)))} : {wire118[(4'h8):(1'h0)],
                               ($signed(reg120) ?
                                   wire115[(3'h5):(1'h1)] : (wire113 ?
                                       wire116 : wire114))})};
  always
    @(posedge clk) begin
      reg130 <= ($signed(wire110[(1'h1):(1'h1)]) == wire126[(1'h1):(1'h0)]);
      reg131 <= reg123[(4'h9):(4'h8)];
      if ({wire128})
        begin
          if ((({wire129,
              $signed((wire117 ?
                  wire113 : (8'hb9)))} | $unsigned((wire111[(1'h0):(1'h0)] * wire116[(3'h7):(2'h2)]))) * $unsigned((((7'h41) | $signed(wire128)) ?
              wire118[(3'h6):(1'h1)] : $unsigned(wire129)))))
            begin
              reg132 <= ((~|(^(wire115 <<< $signed(wire119)))) ?
                  ((wire129[(1'h0):(1'h0)] << ($signed((7'h43)) ^ $signed(wire113))) ~^ $unsigned($signed(reg130))) : ($unsigned((&(wire112 ?
                          (8'hae) : wire126))) ?
                      (wire112[(4'he):(1'h1)] ?
                          (8'hab) : (~&(|(8'ha8)))) : $signed(reg122[(1'h0):(1'h0)])));
            end
          else
            begin
              reg132 <= $signed(((reg122 + ((+reg123) ?
                  reg130 : {(8'ha8), wire129})) ^ $signed(((reg125 ?
                      reg124 : wire110) ?
                  wire111[(1'h0):(1'h0)] : (reg120 != (8'ha7))))));
              reg133 <= (($unsigned((8'ha5)) ?
                  (reg121[(4'h8):(2'h2)] ^ (-(reg132 == reg130))) : (^~reg124[(2'h2):(2'h2)])) ^~ ({$signed($unsigned(reg125)),
                  ((reg131 | reg121) <<< (^wire128))} & $signed($unsigned((wire116 ?
                  wire115 : reg131)))));
            end
          reg134 <= (^~($unsigned($signed(reg120)) ?
              ($signed($unsigned(wire117)) * $signed($unsigned(wire129))) : $signed({reg131})));
          reg135 <= ({reg123[(2'h3):(1'h1)], (&(8'hae))} ?
              (8'ha6) : $unsigned($signed(reg123)));
        end
      else
        begin
          reg132 <= $unsigned({{wire119[(3'h7):(1'h0)]},
              $signed(wire114[(1'h0):(1'h0)])});
          reg133 <= $signed((~&((wire128[(4'ha):(3'h5)] ?
              reg132 : (reg132 ?
                  reg121 : reg132)) ~^ $unsigned($signed(wire114)))));
          reg134 <= {reg132};
        end
    end
  always
    @(posedge clk) begin
      reg136 <= (|reg135[(2'h3):(2'h3)]);
      reg137 <= (($unsigned((~^(7'h41))) ?
          (reg134[(4'h8):(3'h5)] < wire110[(1'h0):(1'h0)]) : $unsigned(wire110[(2'h2):(2'h2)])) >= reg121);
      if ($signed($signed(wire116)))
        begin
          reg138 <= reg124;
        end
      else
        begin
          if ((reg123 ?
              (reg124[(2'h2):(1'h0)] ?
                  $signed($signed((&wire127))) : ($signed(reg124[(1'h0):(1'h0)]) >= {$signed((8'hba))})) : $signed(wire127[(3'h6):(2'h2)])))
            begin
              reg138 <= $unsigned($signed(reg134));
              reg139 <= ((({(~|wire112), (reg120 << wire112)} ?
                      (+$unsigned(wire118)) : ((^~wire119) & (-reg121))) ?
                  {reg133} : ({(wire111 != reg133),
                          (wire113 ? wire119 : wire117)} ?
                      $unsigned({wire117, (8'ha3)}) : ((reg131 ?
                          wire118 : (7'h43)) > reg123))) | $signed((^~$unsigned((&wire118)))));
              reg140 <= $signed((wire113[(1'h0):(1'h0)] && ({(reg131 ?
                          (8'ha4) : reg130)} ?
                  (reg132 ?
                      wire126 : (reg132 ?
                          wire117 : (8'hb4))) : wire128[(1'h0):(1'h0)])));
            end
          else
            begin
              reg138 <= (~|(wire118 ? reg133 : (8'had)));
            end
          reg141 <= (-reg137[(1'h0):(1'h0)]);
        end
    end
  assign wire142 = (reg136[(3'h7):(1'h0)] ^~ ($signed($signed($signed(reg122))) ?
                       (({reg135} ? wire113 : ((8'hbf) ? reg120 : reg135)) ?
                           ($signed(reg136) ?
                               $unsigned(wire127) : (reg134 < reg140)) : wire112) : reg138[(4'hd):(2'h2)]));
  always
    @(posedge clk) begin
      reg143 <= wire113[(4'h8):(4'h8)];
    end
  assign wire144 = {$signed(reg131), reg143};
  assign wire145 = (|{$signed(((wire144 ^~ reg135) ?
                           (reg134 >>> reg134) : reg131))});
  assign wire146 = wire126;
  assign wire147 = $signed({{(((7'h43) ? wire113 : (8'hac)) ?
                               {wire126, wire116} : reg137[(2'h3):(1'h1)]),
                           reg137}});
  assign wire148 = $unsigned((~^($signed((reg138 > wire147)) ?
                       {(wire113 + (8'haa))} : {wire116})));
  assign wire149 = ($unsigned($unsigned({reg121[(4'ha):(3'h7)]})) <<< reg130[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg150 <= $signed($signed(wire116[(4'hd):(4'hd)]));
      if ((^~($unsigned({(|wire148),
          (reg125 ? wire127 : wire116)}) < wire111[(2'h3):(1'h0)])))
        begin
          reg151 <= $signed(wire149);
        end
      else
        begin
          reg151 <= $signed((reg131 ?
              (^~(reg137[(4'h9):(2'h2)] ?
                  wire149 : (wire129 > reg136))) : reg132[(3'h4):(1'h0)]));
          reg152 <= $unsigned(($signed(reg143) << ((+reg121) >> wire142[(2'h3):(2'h2)])));
          reg153 <= (~^(~($signed($unsigned(wire119)) ?
              (~&(reg136 ?
                  reg152 : reg139)) : (reg137 > reg134[(4'he):(3'h4)]))));
          reg154 <= (((~$signed(reg133[(3'h7):(3'h4)])) ?
                  ($signed({(8'hbe)}) ?
                      (wire116[(4'hc):(4'hc)] * (reg141 | wire119)) : $signed($unsigned(wire119))) : ((wire128 && (wire144 ?
                          wire110 : wire145)) ?
                      wire142[(2'h2):(2'h2)] : $unsigned((reg136 << reg131)))) ?
              (($unsigned({wire144, reg131}) ^ (reg120[(2'h3):(1'h1)] ?
                      $signed(wire115) : reg122[(3'h5):(1'h0)])) ?
                  ((reg130 ~^ $unsigned(reg121)) ?
                      reg125 : wire115[(3'h5):(3'h5)]) : reg125) : $signed(reg121));
        end
    end
  assign wire155 = $signed((($unsigned(reg130[(2'h3):(2'h2)]) || $signed(wire145)) ?
                       $signed(({reg151} - wire128[(3'h7):(1'h1)])) : $signed(($signed(reg130) <= reg121))));
  always
    @(posedge clk) begin
      reg156 <= reg132;
    end
endmodule

module module54
#(parameter param102 = ((~&((&(|(8'hb1))) * (((8'h9d) ? (8'hac) : (8'hb3)) <= (!(8'hbf))))) ? (((((8'h9c) | (8'haa)) || ((8'ha3) ? (8'ha0) : (8'ha3))) ? (((8'hb9) ? (8'ha4) : (8'hab)) == ((8'ha5) ^ (8'hbe))) : {((8'ha5) ? (8'hbb) : (7'h41))}) * {(!(-(7'h40))), ((8'hba) << (~&(8'ha8)))}) : (~|(^(+((8'hbb) >= (8'hae)))))), 
parameter param103 = ({{(&(^param102)), ((param102 >= (8'ha6)) > (7'h40))}, param102} ? param102 : (~^(+{param102}))))
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire59;
  input wire signed [(5'h11):(1'h0)] wire58;
  input wire signed [(4'hc):(1'h0)] wire57;
  input wire signed [(4'hc):(1'h0)] wire56;
  input wire [(3'h4):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire100;
  wire signed [(3'h4):(1'h0)] wire99;
  wire [(3'h6):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire60;
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire71,
                 wire60,
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
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
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
                 (1'h0)};
  assign wire60 = ((($signed((wire55 * wire57)) ?
                      (~|(7'h44)) : wire56[(4'hb):(2'h2)]) >= {($signed(wire57) ?
                          (wire58 ^~ wire59) : $signed(wire59)),
                      $unsigned((~^wire58))}) & wire59[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if ($signed((^wire57)))
        begin
          reg61 <= wire56;
          reg62 <= wire55[(3'h4):(2'h3)];
          if (reg61)
            begin
              reg63 <= (($signed(wire60) >= (~^(reg62[(4'h8):(2'h3)] ?
                      $unsigned(wire57) : reg61))) ?
                  wire60[(3'h7):(3'h7)] : reg61[(3'h4):(2'h2)]);
            end
          else
            begin
              reg63 <= ($unsigned(wire60[(4'he):(2'h3)]) >> (wire55[(2'h3):(2'h3)] ?
                  {(wire60 ?
                          ((8'hb3) >= wire59) : wire60)} : (~&{(reg63 || wire55)})));
              reg64 <= ((({reg63} ?
                      {(~^wire59)} : ({reg63,
                          wire59} ^ wire59[(3'h6):(1'h1)])) ?
                  wire59 : (&wire59[(1'h0):(1'h0)])) >>> (~$unsigned(wire58)));
              reg65 <= (wire57 ? (8'hb9) : reg61);
              reg66 <= wire60[(1'h1):(1'h1)];
            end
          reg67 <= $signed((~|((reg61 ? (reg64 ? reg65 : wire57) : reg64) ?
              ((wire59 ?
                  reg61 : wire56) <<< reg66[(4'h9):(3'h4)]) : (^~$signed(wire57)))));
          reg68 <= (+$signed(reg61));
        end
      else
        begin
          reg61 <= $signed($unsigned(reg62[(5'h11):(2'h2)]));
          if (wire57)
            begin
              reg62 <= {(($unsigned(wire58) && (-(+reg66))) ^~ reg64[(3'h4):(1'h0)]),
                  $signed($unsigned((wire55 < reg66[(4'he):(4'hc)])))};
              reg63 <= (((8'ha7) ?
                      $signed($unsigned($signed(reg63))) : reg64[(4'h9):(4'h9)]) ?
                  ($signed(reg68) ?
                      (~|(8'ha7)) : reg62) : $signed(($signed(wire55) * wire57)));
              reg64 <= (+$signed({$unsigned({wire58, wire56})}));
              reg65 <= {((8'ha5) >= ((^~reg62[(5'h13):(3'h6)]) ?
                      (^$unsigned(reg61)) : (~|(wire58 ? reg65 : (8'hb5)))))};
              reg66 <= (((-wire57) ?
                      wire55[(3'h4):(2'h3)] : $unsigned(wire56)) ?
                  reg68[(3'h7):(3'h7)] : ({(wire58 ?
                          wire55[(3'h4):(3'h4)] : $signed((8'ha4))),
                      $unsigned((&wire56))} && $signed((reg63 ?
                      $signed(wire57) : (-(8'had))))));
            end
          else
            begin
              reg62 <= $signed(reg65);
            end
          reg67 <= reg64;
        end
      if ((wire59[(1'h0):(1'h0)] ? wire59 : (8'h9c)))
        begin
          reg69 <= (~|{{reg61[(4'h8):(3'h6)]}, (!{(wire58 ? reg66 : reg66)})});
          reg70 <= $unsigned((~&($signed((reg66 - wire56)) ?
              (-wire59) : $unsigned(wire59))));
        end
      else
        begin
          reg69 <= (^reg70);
          reg70 <= ($signed(wire60[(4'h8):(2'h2)]) ?
              reg63[(4'hb):(2'h3)] : (~^($signed((^~reg66)) ?
                  reg62[(5'h10):(4'ha)] : (~|$signed(reg65)))));
        end
    end
  assign wire71 = reg65[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg72 <= (wire56[(4'hb):(2'h3)] > reg69[(3'h6):(2'h3)]);
      if (wire55[(1'h0):(1'h0)])
        begin
          if (wire59[(2'h3):(2'h3)])
            begin
              reg73 <= reg63;
              reg74 <= $signed(((~&(^~(reg70 == reg64))) ^~ reg70));
              reg75 <= reg67;
              reg76 <= reg69;
            end
          else
            begin
              reg73 <= ((^~(~$unsigned(((8'hb8) ? (7'h40) : reg61)))) ~^ reg73);
              reg74 <= reg75;
              reg75 <= wire57;
              reg76 <= (wire60[(3'h5):(3'h4)] ?
                  $unsigned($unsigned($unsigned((reg61 >>> wire71)))) : (({$unsigned(reg68),
                              $signed((8'ha3))} ?
                          reg67 : {(reg67 ? reg66 : reg68)}) ?
                      wire55 : $signed(reg76[(1'h0):(1'h0)])));
            end
          if ($unsigned(wire60))
            begin
              reg77 <= {(($unsigned($signed(reg63)) ?
                          (reg61[(2'h2):(1'h0)] ?
                              (|(8'haa)) : reg62) : (wire71 ?
                              (wire71 ? wire59 : wire60) : ((8'ha5) ?
                                  wire58 : wire71))) ?
                      $signed((!((8'hb3) ^ reg72))) : {((reg73 ?
                                  wire71 : wire71) ?
                              {reg68, reg68} : (wire56 ? reg67 : reg63))}),
                  (wire59 ? reg70 : (|wire58[(5'h10):(4'hc)]))};
              reg78 <= {({wire57} ^ (+$unsigned((reg61 << wire59))))};
            end
          else
            begin
              reg77 <= reg66[(4'hd):(4'ha)];
              reg78 <= ($unsigned(((wire57 ? (^reg68) : reg63) ?
                  reg66[(3'h4):(2'h3)] : ((~|reg74) ?
                      (+reg78) : $unsigned(reg77)))) & $signed($unsigned(((+(8'hbb)) > (-reg64)))));
              reg79 <= (wire57 != reg62);
              reg80 <= $unsigned(((((reg61 << (8'hbd)) && (^reg69)) >> $unsigned(reg78[(3'h4):(1'h1)])) ?
                  $unsigned(wire55[(2'h3):(2'h3)]) : $signed(reg75)));
            end
          reg81 <= (^(~&(((reg69 < wire55) <<< ((8'hbd) <<< reg77)) && ((8'ha6) <<< reg80))));
          reg82 <= $signed({$unsigned(wire57)});
          reg83 <= ({((~(|(7'h43))) << reg75), (~^wire55[(3'h4):(2'h3)])} ?
              ((((wire55 ?
                  reg74 : wire55) <<< $unsigned(wire59)) <<< {((7'h44) == reg79),
                  reg79[(3'h6):(3'h5)]}) | $signed((~&{reg72}))) : $unsigned((^~$signed(reg67))));
        end
      else
        begin
          reg73 <= reg67[(1'h0):(1'h0)];
        end
      reg84 <= (((|$unsigned((~^wire58))) - (($signed(reg66) >>> $unsigned(reg75)) == ($signed(wire56) ?
          reg74 : reg68))) * reg75[(3'h4):(2'h2)]);
      reg85 <= ($signed($unsigned(wire57)) ?
          (^~$signed($unsigned($signed(reg83)))) : {$unsigned($signed(wire56)),
              (($unsigned(reg73) >= reg81) ?
                  $signed((~&(8'hb7))) : {(reg66 ? reg81 : reg62),
                      wire57[(4'h8):(3'h6)]})});
      reg86 <= (($signed(reg82[(5'h15):(2'h2)]) >>> reg70[(4'hd):(4'hc)]) <= (reg70 ?
          reg64 : ((reg70 < $signed((8'hb5))) >= ((!reg74) ?
              reg66[(4'hc):(3'h7)] : (reg81 ? reg81 : reg69)))));
    end
  always
    @(posedge clk) begin
      reg87 <= ({reg84[(1'h1):(1'h1)]} >>> (((8'hb6) ?
              ({wire57, (8'h9e)} > $unsigned(reg64)) : ($signed(wire57) ?
                  (&wire55) : (wire58 < reg61))) ?
          $signed(reg67[(1'h0):(1'h0)]) : $signed(($signed(reg79) ?
              (^~reg72) : ((8'ha9) < wire58)))));
      reg88 <= reg77[(2'h2):(2'h2)];
      reg89 <= (reg83[(1'h0):(1'h0)] <= ((|reg77) ?
          $signed((+{reg68})) : ($unsigned((reg62 && reg84)) < (^~(reg61 ?
              (8'hb1) : reg75)))));
      reg90 <= {(reg75[(2'h3):(1'h1)] > $unsigned(($unsigned(reg62) ?
              (~&wire71) : (!reg89))))};
      reg91 <= (|(+$unsigned($signed((8'ha8)))));
    end
  always
    @(posedge clk) begin
      reg92 <= reg85[(4'h9):(4'h8)];
      reg93 <= reg77;
      reg94 <= $unsigned(((reg77[(1'h0):(1'h0)] ?
          reg92[(4'he):(4'he)] : reg63[(4'hf):(3'h6)]) && {(^(reg87 - reg77)),
          ((wire71 == reg62) * (wire58 ^~ reg89))}));
      reg95 <= ({reg92, (&$unsigned(reg75[(4'hb):(2'h2)]))} + {(-(8'hb3))});
      reg96 <= (reg64 ? (!$unsigned($signed($signed(reg93)))) : (8'ha2));
    end
  assign wire97 = wire60[(4'h8):(1'h1)];
  assign wire98 = $signed($unsigned(wire59));
  assign wire99 = (|(wire98 || (&$unsigned($signed((8'hb0))))));
  assign wire100 = (!$signed((reg86 >= $unsigned((^reg90)))));
  assign wire101 = $unsigned((|(^~((-wire59) > (&wire71)))));
endmodule

module module14
#(parameter param34 = {(~(~((~|(8'hb5)) || ((8'hbc) ? (7'h44) : (8'had)))))})
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire signed [(5'h14):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire19;
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire19,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire19 = (($signed((wire16 ? $signed(wire18) : wire17)) ?
                      $signed((wire17 * $unsigned(wire17))) : $signed(wire16)) << (~^$unsigned((~wire16[(4'hd):(2'h2)]))));
  always
    @(posedge clk) begin
      reg20 <= (~(wire15[(1'h1):(1'h0)] ?
          $unsigned($signed((!wire19))) : $signed(({wire17} ?
              (wire16 ? wire15 : wire19) : wire15[(1'h0):(1'h0)]))));
      reg21 <= $unsigned($signed($signed($signed($signed(wire19)))));
    end
  assign wire22 = (wire15 ?
                      wire16[(4'hd):(4'h8)] : $signed(((~&(~&reg20)) ?
                          wire18 : wire18)));
  assign wire23 = (wire15 ?
                      reg20 : (((^~(~|reg20)) <= ((wire15 ?
                          (7'h40) : wire18) * $signed(wire19))) && (~^$signed((wire22 ?
                          wire16 : wire17)))));
  assign wire24 = {$signed(wire19[(4'h9):(1'h0)]),
                      $unsigned({((wire23 && (8'ha1)) ?
                              (~^reg21) : $unsigned(wire17)),
                          ((reg21 ? wire22 : wire16) ?
                              wire15 : $unsigned(wire16))})};
  assign wire25 = $unsigned(wire18[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg26 <= (-(8'hb9));
      if (((8'h9c) ? wire15[(3'h4):(2'h3)] : reg21))
        begin
          reg27 <= wire18[(1'h1):(1'h1)];
          reg28 <= $unsigned((-$unsigned(wire19[(4'h8):(4'h8)])));
        end
      else
        begin
          reg27 <= reg27;
          reg28 <= {(wire25 || (reg27[(2'h2):(2'h2)] & $unsigned((reg27 & (8'haa)))))};
          reg29 <= $unsigned((!wire25));
        end
      reg30 <= (reg21[(3'h5):(1'h1)] == (8'ha7));
    end
  assign wire31 = (wire18 >>> (wire15 ?
                      ($unsigned({wire23}) ?
                          {wire22[(4'h8):(3'h4)]} : (~&reg26[(2'h3):(1'h1)])) : reg27[(3'h5):(1'h0)]));
  assign wire32 = wire24[(4'ha):(1'h0)];
  assign wire33 = (~^{((wire18 ?
                          $unsigned(reg20) : $signed(wire17)) ^ $unsigned(((8'hbd) ?
                          wire31 : reg28)))});
endmodule
