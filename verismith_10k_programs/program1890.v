module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h27a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire262;
  wire signed [(4'h8):(1'h0)] wire261;
  wire signed [(4'hf):(1'h0)] wire260;
  wire signed [(3'h4):(1'h0)] wire258;
  wire signed [(2'h2):(1'h0)] wire257;
  wire [(5'h15):(1'h0)] wire256;
  wire signed [(4'h8):(1'h0)] wire255;
  wire signed [(4'hb):(1'h0)] wire254;
  wire [(4'hf):(1'h0)] wire253;
  wire [(5'h12):(1'h0)] wire251;
  wire [(2'h2):(1'h0)] wire243;
  wire [(5'h14):(1'h0)] wire230;
  wire [(5'h15):(1'h0)] wire229;
  wire [(2'h2):(1'h0)] wire228;
  wire [(5'h14):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire207;
  wire signed [(5'h12):(1'h0)] wire226;
  wire signed [(4'hf):(1'h0)] wire232;
  reg signed [(3'h7):(1'h0)] reg209 = (1'h0);
  reg [(5'h15):(1'h0)] reg210 = (1'h0);
  reg [(4'hf):(1'h0)] reg211 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg212 = (1'h0);
  reg [(4'h9):(1'h0)] reg213 = (1'h0);
  reg [(4'hb):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg215 = (1'h0);
  reg [(5'h11):(1'h0)] reg216 = (1'h0);
  reg [(5'h15):(1'h0)] reg217 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg219 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg221 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg222 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg223 = (1'h0);
  reg [(5'h14):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg225 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg234 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg235 = (1'h0);
  reg [(3'h6):(1'h0)] reg236 = (1'h0);
  reg [(5'h10):(1'h0)] reg237 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg238 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg239 = (1'h0);
  reg [(2'h3):(1'h0)] reg240 = (1'h0);
  reg [(5'h12):(1'h0)] reg241 = (1'h0);
  reg [(4'ha):(1'h0)] reg242 = (1'h0);
  reg [(4'ha):(1'h0)] reg244 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg245 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg246 = (1'h0);
  reg [(4'hb):(1'h0)] reg247 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg248 = (1'h0);
  reg [(4'hc):(1'h0)] reg249 = (1'h0);
  reg [(4'he):(1'h0)] reg250 = (1'h0);
  reg [(4'h9):(1'h0)] reg252 = (1'h0);
  assign y = {wire262,
                 wire261,
                 wire260,
                 wire258,
                 wire257,
                 wire256,
                 wire255,
                 wire254,
                 wire253,
                 wire251,
                 wire243,
                 wire230,
                 wire229,
                 wire228,
                 wire4,
                 wire207,
                 wire226,
                 wire232,
                 reg209,
                 reg210,
                 reg211,
                 reg212,
                 reg213,
                 reg214,
                 reg215,
                 reg216,
                 reg217,
                 reg218,
                 reg219,
                 reg220,
                 reg221,
                 reg222,
                 reg223,
                 reg224,
                 reg225,
                 reg234,
                 reg235,
                 reg236,
                 reg237,
                 reg238,
                 reg239,
                 reg240,
                 reg241,
                 reg242,
                 reg244,
                 reg245,
                 reg246,
                 reg247,
                 reg248,
                 reg249,
                 reg250,
                 reg252,
                 (1'h0)};
  assign wire4 = (8'ha7);
  module5 #() modinst208 (wire207, clk, wire1, wire4, wire2, wire3);
  always
    @(posedge clk) begin
      if ({wire207[(1'h0):(1'h0)], wire2[(4'he):(4'h9)]})
        begin
          reg209 <= wire207;
        end
      else
        begin
          reg209 <= $unsigned(wire1[(4'hc):(1'h0)]);
          reg210 <= {(8'hb9),
              (wire1 ? wire4[(4'hd):(4'h9)] : {wire4[(4'hb):(3'h4)]})};
          if (wire4)
            begin
              reg211 <= $signed($signed((wire3[(2'h3):(2'h2)] ?
                  wire0[(3'h5):(3'h5)] : {wire1})));
              reg212 <= wire4[(2'h3):(2'h2)];
              reg213 <= wire4;
              reg214 <= wire2;
            end
          else
            begin
              reg211 <= wire4[(3'h4):(1'h1)];
              reg212 <= $unsigned((8'ha5));
              reg213 <= wire2[(4'he):(3'h5)];
              reg214 <= reg213;
            end
        end
      if ((~&reg212))
        begin
          reg215 <= wire2[(4'ha):(1'h1)];
          reg216 <= reg210[(4'ha):(3'h7)];
          reg217 <= wire3[(4'hb):(2'h2)];
          if ($signed((~^$unsigned((8'hb6)))))
            begin
              reg218 <= ($signed($signed($signed((wire1 ?
                  wire0 : (7'h42))))) << wire0[(1'h1):(1'h1)]);
              reg219 <= ((wire2[(5'h12):(4'hb)] ?
                      $unsigned((|(~|wire2))) : ((((8'ha3) ?
                          reg211 : reg210) <<< (wire1 ?
                          reg210 : (8'had))) > (!reg213))) ?
                  ($unsigned(($signed(reg210) < reg212[(3'h5):(3'h5)])) > (reg211 ?
                      (&reg211) : (reg209 ?
                          {reg213} : wire207))) : {(wire207 < $signed($signed(reg217)))});
              reg220 <= $unsigned(reg213);
              reg221 <= (~reg213);
            end
          else
            begin
              reg218 <= ($unsigned((((7'h41) ?
                      $unsigned(wire1) : $signed(reg212)) | (-$signed((8'hb7))))) ?
                  $unsigned(($unsigned((|wire4)) ?
                      reg220 : reg210)) : $signed(wire0));
              reg219 <= ($signed(($unsigned(reg219) >> reg220[(1'h1):(1'h0)])) == $unsigned((-(^~reg210[(1'h0):(1'h0)]))));
              reg220 <= (((-$signed($unsigned(reg217))) == reg216[(3'h6):(1'h0)]) ?
                  {$unsigned((8'hb0))} : ((reg219 && (^~(reg214 << reg214))) ?
                      ($unsigned($unsigned(wire207)) ?
                          (&$unsigned(reg218)) : {$signed(wire4),
                              reg218[(4'h8):(1'h0)]}) : {$signed($signed(reg220)),
                          {(reg214 != reg210)}}));
              reg221 <= ((-(^~reg218[(2'h3):(2'h2)])) ?
                  (reg217 ? reg209[(1'h0):(1'h0)] : reg219) : (+{reg212,
                      (reg215[(5'h13):(3'h4)] > (wire4 ? reg211 : reg220))}));
              reg222 <= ($signed($unsigned(((~^reg217) >= $unsigned(reg213)))) ?
                  reg213 : $unsigned(($unsigned($signed(reg220)) < $signed(reg215[(5'h11):(4'h9)]))));
            end
        end
      else
        begin
          reg215 <= (~|(-(~$signed((|reg214)))));
        end
      reg223 <= reg212[(3'h4):(1'h1)];
      reg224 <= ($unsigned(wire0[(2'h2):(1'h1)]) >>> (-$unsigned((~|$signed((8'haa))))));
      reg225 <= $signed((reg222 * $unsigned($signed($unsigned(reg217)))));
    end
  module96 #() modinst227 (.wire97(reg214), .wire98(wire207), .y(wire226), .clk(clk), .wire100(reg224), .wire99(reg222));
  assign wire228 = $signed($signed((((~&(8'hb0)) ?
                       reg222 : (reg217 ? reg211 : reg209)) >>> {((7'h43) ?
                           reg209 : reg219)})));
  assign wire229 = wire228[(2'h2):(2'h2)];
  module56 #() modinst231 (wire230, clk, reg221, reg222, reg216, wire3, reg210);
  module130 #() modinst233 (.clk(clk), .wire131(reg225), .wire134(reg224), .y(wire232), .wire132(reg223), .wire133(wire1));
  always
    @(posedge clk) begin
      reg234 <= (^~$signed(reg222));
      reg235 <= wire226;
      reg236 <= $signed((({(reg209 < reg212), (~wire4)} ?
          reg210 : reg221[(5'h13):(4'hc)]) ~^ {(~|wire207[(2'h2):(1'h0)]),
          wire230}));
      if ((^{$unsigned($signed({wire1})),
          $unsigned($signed($unsigned(reg222)))}))
        begin
          if (wire229[(4'hd):(4'h8)])
            begin
              reg237 <= wire4;
              reg238 <= $signed($signed((^(8'ha9))));
              reg239 <= $unsigned(reg216);
              reg240 <= {($unsigned(reg223[(3'h7):(3'h4)]) >= ((~(reg220 ?
                      reg219 : wire207)) < reg235[(3'h6):(3'h5)]))};
              reg241 <= $signed($signed($unsigned(reg238[(3'h6):(2'h2)])));
            end
          else
            begin
              reg237 <= $unsigned({(($signed(wire226) * reg239) == $unsigned((reg211 ?
                      reg236 : reg234)))});
              reg238 <= wire229;
              reg239 <= ($signed((+($signed(wire2) ?
                      (wire4 ? reg241 : reg238) : $signed(reg237)))) ?
                  {reg212[(3'h6):(1'h0)]} : (~&$unsigned({$unsigned(reg223)})));
            end
        end
      else
        begin
          reg237 <= $unsigned((^(($unsigned(reg219) ?
              reg221[(3'h5):(3'h4)] : $signed(reg215)) && {reg211,
              $signed((8'ha2))})));
          reg238 <= wire228[(2'h2):(2'h2)];
          reg239 <= (($signed(($unsigned(wire2) * (|reg209))) ?
                  reg213 : reg212) ?
              wire226[(4'h8):(3'h5)] : (^~$unsigned($unsigned((~(7'h41))))));
          reg240 <= ($signed(($signed((&wire4)) ?
              ((~&reg219) ^ ((8'hb2) ?
                  (7'h43) : reg223)) : reg222[(4'h9):(3'h6)])) > $signed((~^$unsigned({reg209,
              reg217}))));
          reg241 <= (8'hb5);
        end
      reg242 <= $unsigned(reg212[(2'h2):(1'h1)]);
    end
  assign wire243 = (((!reg221) - reg215) & $signed(wire4[(5'h13):(4'hf)]));
  always
    @(posedge clk) begin
      reg244 <= $signed((^~{reg220}));
      reg245 <= {$unsigned($signed(reg235[(3'h5):(1'h1)]))};
      if ({$unsigned({(^(reg217 ? (7'h43) : (8'hb1)))})})
        begin
          reg246 <= wire230;
          if ((wire2[(4'h9):(2'h3)] ?
              (-({reg222[(3'h4):(3'h4)]} ?
                  {(^~reg219)} : $unsigned((wire230 ?
                      reg234 : wire230)))) : $unsigned($unsigned($unsigned((~|reg220))))))
            begin
              reg247 <= ((~$unsigned(reg235)) ^~ $signed(reg218));
            end
          else
            begin
              reg247 <= $signed((wire2[(1'h1):(1'h1)] ?
                  reg247 : (wire226[(4'h9):(1'h0)] ~^ $signed(wire232))));
            end
        end
      else
        begin
          reg246 <= (reg211 ? reg211[(4'he):(4'h9)] : (|reg234[(2'h2):(2'h2)]));
          reg247 <= reg234[(3'h6):(1'h1)];
          reg248 <= $unsigned((reg214 <<< (!wire243[(2'h2):(1'h0)])));
        end
      reg249 <= $signed((~&$unsigned({(reg248 ? reg237 : (8'hb8))})));
      reg250 <= ((~^$unsigned($unsigned($signed(reg238)))) ?
          $signed(wire229[(4'hb):(4'h9)]) : $unsigned((((^~reg218) - {wire229,
                  reg214}) ?
              reg248[(3'h4):(2'h3)] : $signed(reg222[(4'hd):(4'ha)]))));
    end
  assign wire251 = (&{(~|reg212[(1'h0):(1'h0)])});
  always
    @(posedge clk) begin
      reg252 <= reg222[(4'he):(3'h6)];
    end
  assign wire253 = $signed(reg216[(4'hf):(4'he)]);
  assign wire254 = {(($signed(reg238[(3'h4):(2'h3)]) ?
                               (reg241 ?
                                   $unsigned(reg215) : ((8'ha4) ?
                                       reg235 : wire2)) : (~^$signed(wire3))) ?
                           $unsigned((8'hb9)) : $unsigned(wire229))};
  assign wire255 = reg249;
  assign wire256 = ({{((wire230 >= reg245) - $signed(reg215))},
                           $unsigned(((reg216 >= wire230) ^ (~^reg239)))} ?
                       $unsigned(reg239[(2'h3):(2'h2)]) : reg244);
  assign wire257 = $unsigned((~|{($signed(reg248) ?
                           $unsigned(wire228) : $unsigned(reg241)),
                       (!(8'ha3))}));
  module41 #() modinst259 (wire258, clk, reg242, reg238, wire254, wire226, reg209);
  assign wire260 = reg222[(4'hc):(4'h9)];
  assign wire261 = reg237;
  assign wire262 = {(wire261 ?
                           wire253 : (((~&(8'haf)) <= $signed(reg223)) & {(wire255 ?
                                   reg250 : reg240)}))};
endmodule

module module5
#(parameter param206 = (&((({(8'hb4), (8'had)} - (&(8'hb0))) < (|((8'hae) - (8'hb9)))) >= {((&(8'ha5)) ? {(8'h9f), (7'h40)} : (7'h43)), ((+(8'hae)) | {(8'ha6), (8'hb2)})})))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire205;
  wire signed [(2'h3):(1'h0)] wire204;
  wire signed [(5'h11):(1'h0)] wire203;
  wire signed [(5'h12):(1'h0)] wire202;
  wire [(4'hf):(1'h0)] wire126;
  wire signed [(4'hb):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire128;
  wire [(2'h3):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire200;
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire126,
                 wire94,
                 wire55,
                 wire53,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 wire25,
                 wire10,
                 wire128,
                 wire129,
                 wire200,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg29,
                 (1'h0)};
  assign wire10 = wire6[(2'h2):(2'h2)];
  module11 #() modinst26 (wire25, clk, wire10, wire6, wire8, wire7);
  assign wire27 = ($signed($unsigned(wire25)) == ((($signed(wire10) && wire6) ?
                          ((wire25 ? wire10 : wire25) ?
                              (wire8 <<< wire10) : {wire7}) : (wire10[(2'h3):(2'h3)] < $signed(wire25))) ?
                      wire10[(4'he):(4'he)] : (((~(8'h9f)) ?
                              wire25 : wire10[(2'h2):(1'h1)]) ?
                          (wire7[(1'h1):(1'h0)] <= ((8'ha1) && wire8)) : (wire9[(3'h4):(2'h2)] ?
                              (8'hbd) : (wire6 ? wire10 : wire25)))));
  assign wire28 = (&(^~$signed(wire10)));
  always
    @(posedge clk) begin
      reg29 <= (&wire6[(2'h2):(1'h0)]);
    end
  assign wire30 = (({$unsigned(((8'h9e) && wire7)),
                      ($signed(wire10) || ((7'h41) == wire8))} ~^ wire7[(4'hf):(4'h9)]) + $signed(wire7[(4'h8):(3'h5)]));
  assign wire31 = ((((wire27 >>> $unsigned(wire8)) >> (wire25[(4'hf):(3'h7)] ?
                      $unsigned(wire9) : wire30)) > (8'ha8)) - (wire10 && (($signed(wire6) ?
                      wire30 : (wire9 & wire10)) == ((wire30 != wire8) * $signed(reg29)))));
  assign wire32 = wire6[(3'h4):(1'h0)];
  assign wire33 = $signed(wire32);
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed(wire31))))
        begin
          if (wire25)
            begin
              reg34 <= $unsigned(wire6);
              reg35 <= (wire7 ?
                  $signed($signed(((wire10 ^~ wire10) ?
                      {wire31} : (wire28 ? (8'hb8) : wire27)))) : wire32);
              reg36 <= ($unsigned(($signed(((7'h44) < wire31)) != $unsigned(wire6[(1'h1):(1'h1)]))) << {$unsigned((wire32[(2'h2):(1'h0)] << wire27)),
                  wire27[(4'hd):(2'h2)]});
              reg37 <= (($signed($signed((wire7 ?
                  wire32 : wire6))) << (wire25[(5'h13):(1'h0)] > {$unsigned(wire9)})) ^ wire31);
              reg38 <= wire31[(1'h0):(1'h0)];
            end
          else
            begin
              reg34 <= (({wire27[(3'h5):(3'h4)],
                          ($signed(wire6) ? (8'hb4) : $unsigned(wire32))} ?
                      (~($signed(wire9) & $signed(wire25))) : $signed(reg34)) ?
                  reg34[(4'hc):(4'ha)] : {(($unsigned(wire27) >>> (^~reg35)) ?
                          (8'hae) : $signed({(8'had), reg34}))});
            end
          reg39 <= $unsigned($signed($unsigned({$unsigned(wire9),
              (wire33 ? wire8 : wire25)})));
        end
      else
        begin
          reg34 <= $unsigned((|(~wire7)));
        end
      reg40 <= wire27;
    end
  module41 #() modinst54 (wire53, clk, wire7, reg39, reg34, wire9, reg38);
  assign wire55 = wire25[(4'hd):(3'h4)];
  module56 #() modinst95 (wire94, clk, wire32, reg29, wire55, wire7, wire28);
  module96 #() modinst127 (.wire98(wire53), .clk(clk), .wire97(wire6), .wire100(wire25), .wire99(reg36), .y(wire126));
  assign wire128 = wire32[(5'h10):(3'h6)];
  assign wire129 = {$unsigned($signed($signed((wire31 >> reg29)))),
                       $unsigned(($signed((wire94 & wire32)) & ((~&reg40) && wire10)))};
  module130 #() modinst201 (.wire133(wire9), .wire132(reg36), .clk(clk), .y(wire200), .wire134(reg37), .wire131(reg34));
  assign wire202 = wire25[(4'hf):(4'hc)];
  assign wire203 = $signed((((~|(|wire33)) - (~|(wire7 ~^ wire31))) ?
                       reg34 : $signed(reg35[(4'h9):(1'h0)])));
  assign wire204 = (wire9 + (8'ha8));
  assign wire205 = $signed(wire129[(1'h0):(1'h0)]);
endmodule

module module130
#(parameter param198 = (((((~|(8'hbb)) ? ((8'h9d) ? (8'h9d) : (8'ha5)) : ((8'ha7) ? (8'hbb) : (8'hb4))) | (^((8'hbb) ? (8'hb2) : (8'ha3)))) >> ((((8'hae) ? (7'h43) : (8'ha4)) ? ((8'ha5) && (8'ha1)) : (~^(8'hbd))) ? (~&(~^(8'ha8))) : ((-(8'hbe)) ^~ ((8'hb0) ? (8'hb3) : (8'haf))))) ? {(&{{(8'haf), (8'hb3)}, {(8'h9e), (8'h9f)}}), (&{((8'hbe) || (8'hac)), ((8'hac) | (8'h9d))})} : (~((((8'haf) ? (8'haf) : (8'hbf)) & (~|(8'h9e))) < ((~|(8'h9f)) ? ((8'hb4) ? (7'h44) : (8'ha8)) : ((8'hb5) <<< (7'h43)))))), 
parameter param199 = {({({param198} ? {param198} : {param198}), param198} | {(~|{param198, (8'hbd)}), {param198}}), ({(7'h41), (~|((8'had) ? param198 : (8'hbb)))} << ((((8'hbd) ? param198 : param198) ? (param198 ? param198 : param198) : param198) | param198))})
(y, clk, wire134, wire133, wire132, wire131);
  output wire [(32'h298):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire134;
  input wire signed [(4'h8):(1'h0)] wire133;
  input wire signed [(3'h6):(1'h0)] wire132;
  input wire [(5'h14):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire181;
  wire [(2'h3):(1'h0)] wire175;
  wire signed [(4'h9):(1'h0)] wire174;
  wire [(5'h15):(1'h0)] wire173;
  wire [(2'h3):(1'h0)] wire172;
  wire [(3'h6):(1'h0)] wire171;
  wire signed [(5'h15):(1'h0)] wire170;
  wire [(5'h11):(1'h0)] wire156;
  wire signed [(4'hb):(1'h0)] wire155;
  wire [(4'hd):(1'h0)] wire142;
  wire [(4'h8):(1'h0)] wire141;
  wire [(5'h15):(1'h0)] wire140;
  wire signed [(4'hd):(1'h0)] wire137;
  wire [(4'he):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire135;
  reg signed [(3'h4):(1'h0)] reg197 = (1'h0);
  reg [(5'h12):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg195 = (1'h0);
  reg [(3'h5):(1'h0)] reg194 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg193 = (1'h0);
  reg [(5'h11):(1'h0)] reg192 = (1'h0);
  reg [(4'ha):(1'h0)] reg191 = (1'h0);
  reg [(4'hf):(1'h0)] reg190 = (1'h0);
  reg [(4'hc):(1'h0)] reg189 = (1'h0);
  reg [(3'h4):(1'h0)] reg188 = (1'h0);
  reg [(3'h6):(1'h0)] reg187 = (1'h0);
  reg [(4'h9):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg180 = (1'h0);
  reg [(5'h11):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg178 = (1'h0);
  reg [(5'h12):(1'h0)] reg177 = (1'h0);
  reg [(2'h2):(1'h0)] reg176 = (1'h0);
  reg [(4'hd):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg168 = (1'h0);
  reg [(4'hf):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(5'h10):(1'h0)] reg165 = (1'h0);
  reg [(3'h7):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg163 = (1'h0);
  reg [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg161 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg [(3'h7):(1'h0)] reg159 = (1'h0);
  reg [(5'h11):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(4'hd):(1'h0)] reg152 = (1'h0);
  reg [(2'h2):(1'h0)] reg151 = (1'h0);
  reg [(3'h4):(1'h0)] reg150 = (1'h0);
  reg [(2'h3):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg148 = (1'h0);
  reg [(2'h3):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg138 = (1'h0);
  assign y = {wire181,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire156,
                 wire155,
                 wire142,
                 wire141,
                 wire140,
                 wire137,
                 wire136,
                 wire135,
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
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
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
                 reg139,
                 reg138,
                 (1'h0)};
  assign wire135 = (8'hbd);
  assign wire136 = $signed($unsigned(($unsigned($signed(wire133)) ~^ (&$unsigned(wire132)))));
  assign wire137 = $signed($signed((8'ha4)));
  always
    @(posedge clk) begin
      reg138 <= $unsigned($signed((({wire133} ? wire131 : $unsigned(wire131)) ?
          wire135[(4'he):(4'he)] : $signed(wire136))));
      reg139 <= (^~reg138);
    end
  assign wire140 = {({$unsigned((wire133 >= wire132))} << (reg139 | $unsigned((wire133 ^~ wire131)))),
                       ((&wire131[(3'h4):(2'h3)]) ?
                           wire136 : wire135[(3'h6):(1'h0)])};
  assign wire141 = (8'h9c);
  assign wire142 = {(~$signed(wire135[(4'ha):(4'h9)]))};
  always
    @(posedge clk) begin
      if (wire140[(1'h1):(1'h1)])
        begin
          reg143 <= wire131;
        end
      else
        begin
          reg143 <= {{$unsigned(($unsigned(wire141) ?
                      $unsigned(wire133) : $signed(wire140))),
                  wire135},
              {{wire136[(1'h1):(1'h0)]}}};
        end
      reg144 <= {wire137[(4'hc):(3'h6)]};
      if ($unsigned(wire131[(5'h10):(3'h6)]))
        begin
          reg145 <= $unsigned((8'had));
          if ($signed(reg143[(3'h4):(3'h4)]))
            begin
              reg146 <= $signed($unsigned($unsigned(((wire142 + (8'hb8)) & wire132))));
              reg147 <= $signed(reg139);
            end
          else
            begin
              reg146 <= $signed(((^((wire142 << reg145) ?
                  (wire133 - wire140) : wire135)) == (reg143[(2'h3):(2'h3)] ?
                  wire133 : reg138)));
              reg147 <= wire135[(4'ha):(4'ha)];
              reg148 <= (($unsigned(((reg144 ? (8'hb6) : (8'ha1)) ?
                      (wire133 ? wire137 : (8'hab)) : (reg147 ?
                          reg146 : (8'ha1)))) ?
                  $signed($signed($unsigned(reg139))) : $signed($unsigned((wire136 ?
                      wire142 : (8'hb5))))) > wire140);
              reg149 <= wire135[(4'ha):(1'h0)];
              reg150 <= wire132;
            end
          reg151 <= $signed((~&$unsigned($unsigned((wire133 <= wire135)))));
          reg152 <= ((reg145 <<< ({$unsigned(reg143),
                  {wire136, reg148}} << $signed((wire136 ^~ reg143)))) ?
              wire131[(2'h3):(1'h1)] : $signed(($signed((reg148 > wire135)) ?
                  {wire142[(3'h7):(3'h7)],
                      reg149[(2'h2):(1'h1)]} : (~&$unsigned(reg147)))));
          reg153 <= reg151;
        end
      else
        begin
          if (wire132)
            begin
              reg145 <= reg143;
              reg146 <= $unsigned((($signed((^wire135)) ?
                      $signed((+wire141)) : ({reg152} - reg145[(4'hc):(3'h6)])) ?
                  (~^reg144) : $signed(($unsigned(wire135) ?
                      (^wire131) : $signed(reg153)))));
              reg147 <= $unsigned($signed(($unsigned($unsigned(reg153)) > $signed((wire141 ?
                  wire136 : reg139)))));
            end
          else
            begin
              reg145 <= (8'h9f);
              reg146 <= $unsigned($unsigned((8'h9d)));
              reg147 <= reg143[(3'h5):(3'h5)];
              reg148 <= {(reg151 + ((^(wire135 ?
                      wire137 : reg148)) != (~&(^wire135)))),
                  ({($unsigned(wire141) ?
                              $unsigned((8'hbb)) : $unsigned(reg151)),
                          (((7'h43) + reg153) ? {(8'h9d), wire135} : wire132)} ?
                      (reg145[(3'h4):(2'h3)] ?
                          {(~reg148)} : (8'hba)) : (($unsigned(reg145) ?
                          (|reg138) : wire136) - (8'haf)))};
            end
          reg149 <= wire134[(3'h5):(2'h3)];
          reg150 <= (wire137[(4'h8):(3'h4)] <= wire142[(2'h3):(1'h1)]);
        end
      reg154 <= $unsigned(($signed((|reg150[(3'h4):(2'h2)])) ?
          reg149[(1'h1):(1'h1)] : (((reg145 ?
                  reg138 : (8'hbe)) * wire132[(3'h6):(2'h3)]) ?
              reg139 : (((8'ha5) && reg150) ?
                  (wire136 || wire134) : $unsigned(reg149)))));
    end
  assign wire155 = (&($unsigned(((reg153 ? wire141 : reg138) ?
                           reg151 : reg145[(1'h0):(1'h0)])) ?
                       reg154[(2'h2):(1'h0)] : reg143));
  assign wire156 = {(($signed($signed(reg144)) >= {$signed((8'hbd))}) << $signed($unsigned((~|reg138)))),
                       (wire140 ? $signed(wire140[(4'hb):(2'h3)]) : reg153)};
  always
    @(posedge clk) begin
      if ((~|($signed($unsigned($signed(wire133))) ?
          wire141[(3'h6):(1'h1)] : $unsigned(((~^wire136) || $unsigned(reg147))))))
        begin
          reg157 <= $unsigned((|$signed(($signed(wire133) == $unsigned(reg138)))));
          reg158 <= wire131[(5'h12):(4'h9)];
        end
      else
        begin
          if ($unsigned({$signed((-reg138[(2'h2):(2'h2)])), (8'hb6)}))
            begin
              reg157 <= (^reg158);
              reg158 <= ($signed(($signed($signed((8'h9d))) * reg145[(2'h2):(1'h0)])) >>> ((~(^{(8'hb9)})) == (^$unsigned((wire140 >> wire141)))));
              reg159 <= $signed(reg147);
            end
          else
            begin
              reg157 <= {(($signed((wire134 ? wire133 : reg159)) ?
                          reg145[(4'h8):(2'h2)] : $signed((wire136 <<< (8'haf)))) ?
                      ((|(~reg153)) ?
                          reg159[(3'h5):(1'h1)] : $unsigned((reg159 ?
                              reg151 : wire156))) : wire140)};
              reg158 <= $unsigned($signed($unsigned(((wire155 ?
                      reg151 : reg147) ?
                  reg150 : $signed(reg154)))));
              reg159 <= (^reg159);
              reg160 <= $unsigned((8'h9c));
              reg161 <= (^wire131[(2'h2):(1'h0)]);
            end
          if ($unsigned($signed((~^((reg157 * reg158) ?
              $unsigned(reg146) : {(8'haa)})))))
            begin
              reg162 <= (reg158[(5'h10):(4'hb)] ~^ $unsigned(wire136));
            end
          else
            begin
              reg162 <= (reg161 ~^ (reg138[(2'h2):(1'h1)] ?
                  ($signed(wire134[(1'h0):(1'h0)]) ~^ reg160[(4'hf):(4'hb)]) : wire133));
              reg163 <= reg147[(1'h1):(1'h0)];
              reg164 <= wire137[(3'h7):(2'h2)];
              reg165 <= $unsigned($signed((reg147[(2'h2):(1'h0)] < {(reg151 ?
                      wire133 : reg148)})));
            end
          reg166 <= ((~|$unsigned(($unsigned(reg152) ?
              (!wire131) : ((8'hb8) || wire137)))) ^ (&($signed((reg138 - reg139)) ?
              $signed((~wire141)) : wire137[(4'hb):(3'h7)])));
          reg167 <= reg159;
        end
      reg168 <= (~^((wire133[(3'h6):(1'h0)] >>> {(reg165 ?
              reg158 : reg154)}) <<< (((8'hbc) && wire155) ?
          reg152 : reg154[(2'h2):(2'h2)])));
      reg169 <= $signed((reg139[(2'h3):(1'h1)] * wire133));
    end
  assign wire170 = $unsigned(wire156[(5'h10):(3'h7)]);
  assign wire171 = ((reg144 ?
                           ($signed((~^(8'ha4))) != $signed(wire141[(3'h7):(1'h1)])) : reg153) ?
                       reg165 : (-($unsigned((wire141 ?
                           reg168 : reg165)) >>> $signed($unsigned(wire170)))));
  assign wire172 = (~&$signed(reg161[(3'h5):(1'h1)]));
  assign wire173 = (!(~^reg166));
  assign wire174 = $unsigned($unsigned(reg165[(4'h8):(2'h2)]));
  assign wire175 = ($unsigned(wire156) - $signed(reg152[(3'h7):(1'h0)]));
  always
    @(posedge clk) begin
      reg176 <= $unsigned(reg159[(2'h2):(1'h1)]);
      reg177 <= ((wire173[(2'h2):(1'h1)] ? wire132 : reg147) ?
          (~$unsigned(wire136)) : ($unsigned(wire137[(4'ha):(1'h1)]) + reg176[(1'h0):(1'h0)]));
      reg178 <= {(reg147 ?
              (reg163[(3'h7):(3'h6)] ^~ wire155[(3'h6):(3'h5)]) : $signed(({wire136,
                  (8'hb5)} == {wire155}))),
          {$signed((!reg164))}};
      reg179 <= ($unsigned(($unsigned((&reg152)) ?
              $signed($unsigned(reg162)) : ($signed(reg144) ?
                  wire170 : (wire131 ? reg160 : reg154)))) ?
          $unsigned(reg138) : (($signed($unsigned(reg161)) ?
              ($signed((8'h9e)) | $unsigned(wire173)) : ((wire136 ?
                      (8'hbb) : reg154) ?
                  $signed(reg169) : (8'h9d))) > reg157[(4'h9):(3'h6)]));
      reg180 <= reg151[(2'h2):(2'h2)];
    end
  assign wire181 = {wire170[(2'h2):(2'h2)], reg164[(2'h3):(1'h1)]};
  always
    @(posedge clk) begin
      reg182 <= ($unsigned((((!reg176) ^~ (reg163 - wire174)) ?
          (~^$signed(reg160)) : wire156)) + {reg139});
      if (reg146)
        begin
          if (($signed(reg178[(3'h5):(2'h2)]) ?
              wire170 : wire181[(3'h7):(3'h4)]))
            begin
              reg183 <= $signed(($unsigned(reg165[(1'h1):(1'h0)]) ?
                  {$signed(reg163[(3'h5):(2'h3)]),
                      $unsigned((~^wire136))} : (reg167 != (reg143 ~^ (reg145 ?
                      reg164 : (8'h9c))))));
              reg184 <= $unsigned({($signed((reg138 ? wire136 : reg151)) ?
                      $signed(wire135[(4'hd):(1'h0)]) : $unsigned($signed(reg183))),
                  $unsigned($signed($signed(reg153)))});
              reg185 <= {($signed(reg159) ?
                      ((!(^reg182)) ?
                          reg184[(2'h3):(2'h2)] : $signed($signed((8'hb8)))) : reg183[(1'h0):(1'h0)])};
            end
          else
            begin
              reg183 <= ((wire173 ?
                      $signed((wire173[(4'hb):(2'h3)] | (reg160 == wire170))) : (-(+reg144))) ?
                  reg169[(2'h3):(2'h3)] : $unsigned((reg145[(4'hd):(4'ha)] || $unsigned(reg168))));
              reg184 <= $unsigned({reg176[(2'h2):(2'h2)]});
              reg185 <= $unsigned(reg167);
              reg186 <= $unsigned(reg139);
            end
          reg187 <= ((reg163 ?
                  $signed((~|(reg185 ?
                      reg146 : reg176))) : $unsigned(reg167[(3'h6):(3'h4)])) ?
              $unsigned({{$signed(wire172)},
                  ((8'hbb) ? $unsigned(reg184) : $signed(wire141))}) : (8'ha1));
          if ($unsigned($unsigned(reg146)))
            begin
              reg188 <= $unsigned(wire142);
              reg189 <= (|(+$unsigned(reg148[(3'h6):(2'h2)])));
              reg190 <= wire174[(3'h4):(1'h1)];
              reg191 <= ((($signed((wire181 <<< reg143)) + ($signed(reg180) ?
                          (wire156 >>> reg188) : reg187[(3'h6):(3'h4)])) ?
                      $unsigned(($signed(reg188) <= $unsigned(reg186))) : reg157) ?
                  ($signed(reg157) ?
                      (((wire142 >= reg187) ~^ (wire140 ?
                          reg177 : wire137)) < reg150[(2'h2):(2'h2)]) : (+reg182)) : $unsigned(wire135[(1'h1):(1'h1)]));
              reg192 <= $signed(wire141);
            end
          else
            begin
              reg188 <= (^(reg168 < reg190));
              reg189 <= $unsigned(reg176[(2'h2):(1'h1)]);
              reg190 <= $unsigned({wire134,
                  (|((reg149 >>> reg178) || (7'h44)))});
            end
          reg193 <= (reg167 + $unsigned((|reg167[(4'hf):(4'hd)])));
          reg194 <= $signed($unsigned(reg186[(3'h6):(3'h5)]));
        end
      else
        begin
          reg183 <= {reg187[(3'h5):(1'h1)], reg162[(3'h4):(3'h4)]};
          reg184 <= (~&reg190[(3'h5):(3'h4)]);
          reg185 <= (!{($signed($signed((7'h41))) ?
                  $unsigned((reg160 ^ wire137)) : (^$unsigned(reg183)))});
        end
      reg195 <= (-wire135[(3'h7):(1'h0)]);
      reg196 <= ((($signed((reg160 ? reg168 : wire156)) != ((reg169 | reg152) ?
              {reg146, wire170} : (~^reg179))) ?
          ({{wire155}} ?
              (reg179 ^~ (reg151 && reg148)) : (|$unsigned(reg179))) : reg185) && $unsigned((((reg165 >> reg184) ?
              (reg179 <<< reg166) : wire137[(3'h7):(3'h6)]) ?
          $signed((~&reg138)) : reg183[(2'h2):(2'h2)])));
      reg197 <= ($unsigned(((!(8'hbe)) ?
          ($unsigned((8'hbd)) ?
              reg183[(2'h2):(2'h2)] : ((8'hac) ?
                  reg176 : reg166)) : (&(^reg169)))) && (reg167[(2'h2):(1'h1)] ?
          $signed(((+reg154) & $signed(reg163))) : reg162[(2'h2):(1'h1)]));
    end
endmodule

module module96  (y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire100;
  input wire [(4'hd):(1'h0)] wire99;
  input wire [(4'h8):(1'h0)] wire98;
  input wire signed [(4'h9):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire125;
  wire [(4'hf):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire112;
  wire [(4'hf):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire110;
  wire [(4'h9):(1'h0)] wire109;
  wire [(3'h4):(1'h0)] wire103;
  wire [(4'hb):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire101;
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire103,
                 wire102,
                 wire101,
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
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire101 = $unsigned((+$unsigned((((8'hab) || wire100) < $unsigned(wire99)))));
  assign wire102 = {{($unsigned({wire100, wire100}) ?
                               (~^$unsigned(wire100)) : (((8'hb5) ?
                                       wire97 : wire97) ?
                                   (~^wire100) : $unsigned(wire99)))}};
  assign wire103 = ((^~$signed({wire100[(3'h4):(1'h1)],
                           wire100[(1'h0):(1'h0)]})) ?
                       $unsigned({($unsigned(wire98) ?
                               $unsigned(wire98) : (~&wire99))}) : wire100[(4'hb):(3'h5)]);
  always
    @(posedge clk) begin
      if (wire97)
        begin
          reg104 <= $signed((wire102 ?
              (~&(^(wire101 ? wire101 : (8'had)))) : wire98[(1'h0):(1'h0)]));
          reg105 <= wire99;
          reg106 <= wire101;
          reg107 <= (-($signed($signed($unsigned(reg106))) ?
              wire99[(3'h4):(3'h4)] : ((8'hbe) ?
                  (~&(wire103 ? wire99 : reg106)) : ((wire98 ?
                      wire98 : reg105) >>> $signed((8'ha6))))));
          reg108 <= (|(~|$signed($signed(wire101[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg104 <= (~&wire101);
          reg105 <= {reg105[(3'h6):(3'h6)],
              ({wire100,
                  (wire101 || (reg106 ?
                      wire102 : reg108))} | {({reg108} >>> reg108),
                  $unsigned($unsigned(reg108))})};
          reg106 <= wire102;
        end
    end
  assign wire109 = $unsigned(wire101);
  assign wire110 = (8'ha2);
  assign wire111 = $unsigned(wire98);
  assign wire112 = $signed((reg106 != (!$signed($unsigned(wire101)))));
  always
    @(posedge clk) begin
      reg113 <= ({($signed((reg104 ? (8'hbd) : wire97)) ?
              $unsigned((wire110 ?
                  (8'hbc) : reg106)) : reg108)} & $unsigned(wire99[(3'h4):(1'h1)]));
      if (((~&$unsigned(wire98)) >>> wire111))
        begin
          reg114 <= ((-wire101[(2'h2):(1'h0)]) ?
              (($signed($signed(wire99)) ?
                      (+(reg105 ?
                          reg113 : (7'h44))) : $unsigned((wire99 + wire100))) ?
                  wire112 : (^wire101[(3'h4):(2'h3)])) : ({wire110[(3'h6):(1'h1)]} ?
                  wire100[(4'hb):(3'h6)] : $signed(reg107)));
          reg115 <= ($unsigned(($signed((wire111 <<< reg104)) - (^(8'ha9)))) ?
              {(wire109 + wire112)} : wire99);
          if (wire111[(4'ha):(4'h8)])
            begin
              reg116 <= $unsigned((!$unsigned($unsigned($unsigned(wire101)))));
              reg117 <= $signed((wire111 ? wire100[(3'h7):(2'h3)] : reg116));
              reg118 <= $unsigned($signed($signed((^(~^reg105)))));
            end
          else
            begin
              reg116 <= (|$signed($signed(reg118[(3'h4):(1'h0)])));
              reg117 <= reg117;
            end
          reg119 <= wire103;
          reg120 <= reg108;
        end
      else
        begin
          reg114 <= ($unsigned($signed((~|$unsigned(wire100)))) >= $signed((reg107 ?
              wire109 : reg118)));
          reg115 <= (+((~&wire100[(4'hb):(2'h3)]) ?
              $unsigned($unsigned((~^reg106))) : $unsigned({wire111[(1'h1):(1'h1)]})));
          reg116 <= wire109[(2'h2):(1'h1)];
          if ((wire112[(4'he):(2'h2)] <= ($unsigned((~&{reg107})) ?
              (~&((~^wire97) ?
                  ((8'had) ?
                      wire102 : reg107) : reg115[(5'h10):(4'hc)])) : (~&wire109))))
            begin
              reg117 <= ((($signed((wire109 & wire111)) ?
                      (+{reg118,
                          reg119}) : ($unsigned((8'ha5)) << (reg115 != reg117))) ?
                  $unsigned(wire100) : wire101) << {(^((~&wire112) + (reg114 ?
                      (8'ha2) : reg118)))});
              reg118 <= $signed(reg119[(3'h4):(1'h0)]);
            end
          else
            begin
              reg117 <= {reg114[(3'h5):(2'h3)]};
              reg118 <= (~&reg107[(1'h0):(1'h0)]);
              reg119 <= $signed(reg108[(1'h0):(1'h0)]);
              reg120 <= ((!$unsigned(((reg105 ^~ (8'hb1)) ?
                  reg113 : (&(7'h44))))) - ($signed($unsigned((8'hae))) ?
                  (|reg114) : wire109));
              reg121 <= ({{$unsigned({reg104}), reg115[(5'h11):(5'h11)]},
                      reg105[(4'h9):(3'h5)]} ?
                  (~&$signed($signed((reg115 ?
                      reg119 : reg120)))) : $signed((wire99[(4'h8):(3'h5)] + {{reg106,
                          (8'hb5)}})));
            end
        end
      reg122 <= ((|wire110) < wire99);
      reg123 <= {wire101,
          $signed(($signed((reg118 ? reg105 : reg122)) ?
              ((reg117 ? (7'h41) : wire99) ?
                  reg122 : (reg105 ?
                      (8'ha8) : wire110)) : wire112[(5'h12):(4'h9)]))};
    end
  assign wire124 = (reg115[(4'ha):(2'h2)] >>> $signed((!(~(wire98 << reg117)))));
  assign wire125 = wire109[(4'h8):(1'h0)];
endmodule

module module56
#(parameter param93 = (~{(((!(8'h9d)) ? ((8'hb3) << (8'hb1)) : ((7'h41) >>> (8'hbd))) ? {((8'ha9) ? (8'ha7) : (8'hb4)), (8'hb5)} : {(^(7'h41)), ((8'hba) ~^ (8'hbb))})}))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire61;
  input wire signed [(4'hc):(1'h0)] wire60;
  input wire signed [(4'h8):(1'h0)] wire59;
  input wire [(3'h6):(1'h0)] wire58;
  input wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire88;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  assign y = {wire91,
                 wire89,
                 wire88,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 reg92,
                 reg90,
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
                 (1'h0)};
  assign wire62 = wire58[(3'h4):(3'h4)];
  assign wire63 = ((~|(&($signed(wire61) >> wire57[(4'he):(1'h0)]))) || (+wire62[(3'h4):(1'h0)]));
  assign wire64 = $signed($signed((((wire57 ? wire58 : (8'ha1)) ?
                      (+(8'h9d)) : {wire59, wire57}) <<< wire58)));
  assign wire65 = wire61;
  assign wire66 = $signed((~|(wire58[(3'h6):(1'h1)] ?
                      wire61[(1'h0):(1'h0)] : wire61[(4'h8):(3'h4)])));
  assign wire67 = (~{{$unsigned((~(8'ha5))), $unsigned((wire65 && wire64))},
                      (wire64 < $signed((wire59 ? wire62 : wire60)))});
  assign wire68 = $signed(((wire59[(2'h3):(1'h0)] <= (wire59 + wire66)) ?
                      wire59[(3'h4):(1'h0)] : wire67));
  assign wire69 = wire63[(3'h6):(3'h5)];
  assign wire70 = wire58[(1'h0):(1'h0)];
  assign wire71 = $signed((wire65 ?
                      ((-wire69) ?
                          ({(7'h42)} != wire63[(2'h3):(2'h3)]) : wire59) : ((8'ha8) >> $unsigned((wire67 ?
                          wire67 : wire66)))));
  assign wire72 = ($unsigned(wire66[(4'hf):(4'h8)]) >= ((((+wire71) * ((8'h9d) ?
                      wire69 : wire61)) - ($unsigned(wire60) * $signed((7'h43)))) != $signed($unsigned((wire65 > wire58)))));
  assign wire73 = {$signed(($signed((!wire71)) + $unsigned(wire64[(1'h1):(1'h1)])))};
  assign wire74 = {(~$unsigned($unsigned({wire72, wire68})))};
  assign wire75 = ($unsigned((^~($unsigned(wire63) ?
                      wire65 : $unsigned(wire74)))) ^~ $unsigned($signed($signed($unsigned(wire72)))));
  always
    @(posedge clk) begin
      reg76 <= {(|(|wire61[(3'h5):(1'h1)])), (^(!($signed(wire60) * wire62)))};
      reg77 <= {$unsigned($unsigned($unsigned(wire58))),
          (~&wire68[(1'h1):(1'h0)])};
      reg78 <= (~^wire64);
      reg79 <= $signed(wire64[(1'h0):(1'h0)]);
      if (reg77[(3'h6):(2'h2)])
        begin
          reg80 <= wire73;
          reg81 <= $unsigned((8'had));
          if ($signed($signed(reg76[(2'h3):(1'h1)])))
            begin
              reg82 <= {wire57};
              reg83 <= $unsigned((~$unsigned($unsigned($unsigned(wire69)))));
              reg84 <= ((~^($signed({wire71}) + wire62[(2'h3):(1'h0)])) & ($unsigned(($signed(wire62) < (wire65 != wire67))) & ({(wire59 * (8'hbc)),
                      (^~(8'haa))} ?
                  $unsigned({wire73}) : ((wire69 == reg81) ?
                      (reg76 ? wire61 : (8'hb4)) : $unsigned(reg81)))));
            end
          else
            begin
              reg82 <= $signed(wire57[(5'h14):(5'h12)]);
              reg83 <= {(wire64 * $unsigned($signed({reg77}))),
                  {(|($signed(reg81) ? (wire62 + wire74) : (wire73 && wire62))),
                      $signed($unsigned((wire71 ? wire65 : wire58)))}};
              reg84 <= wire59[(3'h5):(3'h4)];
              reg85 <= $unsigned($unsigned(reg79));
            end
          reg86 <= ((~&($signed($unsigned(wire73)) ?
              reg84 : {(!(8'ha3)),
                  wire58})) >= $unsigned((wire69 && ((&wire73) ?
              ((7'h44) ? wire66 : wire62) : $unsigned(reg81)))));
          reg87 <= (wire70[(4'h8):(1'h0)] ?
              $unsigned((((^reg84) ?
                  reg81 : $unsigned(wire58)) * $unsigned(wire63))) : {$signed($signed($signed(wire58)))});
        end
      else
        begin
          if (wire74[(1'h0):(1'h0)])
            begin
              reg80 <= $unsigned($unsigned($unsigned(wire62[(4'h9):(2'h2)])));
              reg81 <= ((reg77[(5'h14):(4'hf)] ?
                      (({(8'ha1)} ?
                              (wire75 ? wire70 : wire74) : $signed(wire57)) ?
                          (8'hb8) : $unsigned(wire64)) : (!wire61)) ?
                  (reg85[(4'h8):(3'h4)] ?
                      reg82[(3'h4):(3'h4)] : $unsigned({((8'hb0) ?
                              wire65 : wire60),
                          {(8'hba), wire64}})) : reg79[(1'h0):(1'h0)]);
            end
          else
            begin
              reg80 <= $unsigned($signed(wire69[(2'h3):(2'h2)]));
              reg81 <= $unsigned(($signed($unsigned($unsigned(reg87))) && reg83));
              reg82 <= ($signed($signed($signed($unsigned(wire57)))) ?
                  (reg79[(2'h2):(2'h2)] ?
                      ((8'ha2) && wire67) : (-wire73[(3'h6):(3'h4)])) : $signed({(~{reg79})}));
              reg83 <= ((~|reg76) ?
                  $unsigned(reg81[(4'hb):(4'hb)]) : (&{$signed($unsigned(reg82)),
                      (((8'hb8) < wire72) ?
                          wire72[(2'h2):(2'h2)] : $unsigned(reg77))}));
            end
        end
    end
  assign wire88 = $unsigned((8'hac));
  assign wire89 = reg83[(4'ha):(2'h3)];
  always
    @(posedge clk) begin
      reg90 <= (|(+wire71[(4'ha):(1'h0)]));
    end
  assign wire91 = (~|(reg86 ?
                      $signed({$signed(wire58)}) : reg87[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg92 <= $unsigned(wire72);
    end
endmodule

module module41
#(parameter param51 = ((~&(((^(8'ha2)) ? (~(8'hae)) : (!(8'hb4))) ? ({(8'hba), (7'h40)} ? (8'h9e) : (~|(8'ha6))) : ((^~(8'hb8)) >= (^(8'hbe))))) >= ((((!(8'h9c)) > ((8'ha2) != (8'ha6))) * ((^~(8'hbe)) - (~&(8'ha3)))) ? {(~|{(8'ha3)})} : ((!(&(8'hb3))) ? (^(-(8'hb9))) : (((8'ha6) ? (8'ha5) : (7'h44)) ? (8'hac) : ((8'hb1) ? (8'hb1) : (7'h40)))))), 
parameter param52 = (^(^((|param51) && {((8'hb3) & param51), param51}))))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire46;
  input wire [(2'h3):(1'h0)] wire45;
  input wire signed [(3'h4):(1'h0)] wire44;
  input wire [(5'h12):(1'h0)] wire43;
  input wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  assign y = {wire50, wire49, wire48, wire47, (1'h0)};
  assign wire47 = wire46[(1'h0):(1'h0)];
  assign wire48 = wire47[(4'hb):(1'h1)];
  assign wire49 = {wire44[(2'h2):(2'h2)],
                      ((-{((8'hb0) ? wire48 : (8'ha5))}) ?
                          wire47 : $unsigned((wire48 << (wire45 ?
                              wire47 : wire45))))};
  assign wire50 = wire44;
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  assign y = {wire24,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire16 = (($unsigned(wire15[(2'h3):(2'h3)]) ^ wire14[(1'h1):(1'h1)]) ?
                      {wire12[(2'h3):(2'h3)]} : (wire12 ?
                          $signed((8'hae)) : $unsigned($signed((&wire15)))));
  assign wire17 = wire15[(3'h4):(2'h2)];
  assign wire18 = $unsigned(wire13[(5'h14):(4'ha)]);
  assign wire19 = ($signed($unsigned(($unsigned(wire15) ?
                          (~&wire15) : wire18))) ?
                      $unsigned(($signed($signed(wire12)) | wire14)) : ($signed($unsigned((wire14 * wire18))) != (~$signed($signed(wire17)))));
  assign wire20 = wire16;
  assign wire21 = {(+wire13)};
  always
    @(posedge clk) begin
      reg22 <= wire17[(1'h1):(1'h1)];
      reg23 <= $signed(($signed($signed(wire20[(5'h13):(4'hd)])) ?
          (~&$unsigned(wire17[(2'h3):(1'h0)])) : (+$signed(wire19[(3'h4):(2'h3)]))));
    end
  assign wire24 = $unsigned($unsigned($signed({wire20[(3'h5):(1'h0)]})));
endmodule
