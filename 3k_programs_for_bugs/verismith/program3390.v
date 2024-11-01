module top
#(parameter param209 = {((((!(8'hbb)) ^~ (~|(7'h42))) ? (-((7'h43) ? (8'hbb) : (8'hab))) : ((8'hbc) ? {(8'hae), (8'hb7)} : ((8'hb9) ? (8'ha4) : (8'ha6)))) == (+(((8'hae) ^~ (8'haf)) ? (^~(8'haa)) : ((8'hbf) ? (8'ha5) : (7'h43)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire208;
  wire signed [(2'h3):(1'h0)] wire207;
  wire [(2'h3):(1'h0)] wire206;
  wire [(4'hb):(1'h0)] wire205;
  wire [(3'h5):(1'h0)] wire204;
  wire signed [(5'h13):(1'h0)] wire203;
  wire signed [(5'h10):(1'h0)] wire202;
  wire signed [(4'h9):(1'h0)] wire201;
  wire [(4'hb):(1'h0)] wire192;
  wire [(3'h6):(1'h0)] wire190;
  reg [(4'hb):(1'h0)] reg200 = (1'h0);
  reg [(4'hb):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg197 = (1'h0);
  reg [(4'he):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg195 = (1'h0);
  reg [(5'h13):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg193 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire192,
                 wire190,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 (1'h0)};
  module4 #() modinst191 (.y(wire190), .wire7(wire1), .wire5(wire2), .wire9((8'hb2)), .wire6(wire0), .wire8(wire3), .clk(clk));
  assign wire192 = (~&$unsigned($signed(({wire2,
                       wire0} >>> $unsigned(wire190)))));
  always
    @(posedge clk) begin
      reg193 <= wire3;
      if (({(((wire0 ? (8'hb6) : wire2) ?
              wire3[(4'h8):(3'h6)] : (~^wire0)) <= {(wire3 ? reg193 : wire1),
              reg193[(4'hd):(3'h4)]})} > ((&($signed(reg193) ?
          (wire1 || (8'hb5)) : wire1[(2'h2):(1'h1)])) + ($signed($signed((8'ha6))) ?
          wire190[(2'h2):(2'h2)] : wire192[(2'h2):(2'h2)]))))
        begin
          if ($unsigned(wire3))
            begin
              reg194 <= $unsigned({(8'h9e), $signed(wire192[(4'hb):(1'h1)])});
            end
          else
            begin
              reg194 <= (^~{wire192,
                  ((wire190[(1'h1):(1'h0)] & wire2) ?
                      (wire190 ?
                          (reg193 >>> wire0) : (wire2 & wire2)) : wire190[(2'h3):(1'h1)])});
              reg195 <= ($signed(reg194) || ($unsigned((wire190 <= $unsigned(reg194))) ?
                  ($unsigned(wire0) ?
                      (wire0 ?
                          $unsigned(reg194) : (wire192 ?
                              reg193 : wire0)) : ((wire0 | wire192) != wire0[(3'h7):(2'h3)])) : ((wire190[(3'h4):(2'h2)] ?
                          (~^wire0) : (~wire190)) ?
                      ({wire1,
                          wire190} ^ wire0[(4'hf):(4'h8)]) : $signed(wire192[(4'hb):(2'h2)]))));
              reg196 <= (^$signed($signed((wire0 == $signed(wire3)))));
              reg197 <= (+wire192[(3'h5):(1'h1)]);
            end
          reg198 <= wire0[(2'h3):(2'h2)];
          reg199 <= ({$unsigned(({reg196} < (reg193 >> wire2))),
                  (reg194 ?
                      wire192[(2'h3):(2'h2)] : $unsigned($signed((8'hb7))))} ?
              $unsigned((+(!(wire190 ?
                  reg198 : wire1)))) : $unsigned(((|(wire190 < reg196)) ?
                  ((~^wire2) >>> ((8'ha8) >= (8'hbf))) : $unsigned(wire3[(4'hb):(3'h6)]))));
        end
      else
        begin
          reg194 <= ($signed((($signed(reg197) ?
                  ((8'hb6) ? wire190 : reg199) : (reg199 ? reg199 : wire192)) ?
              (reg199[(3'h5):(3'h5)] * reg198[(3'h5):(1'h0)]) : $unsigned((~|(8'hb3))))) & wire192[(3'h5):(3'h5)]);
          reg195 <= $signed((-(!$signed((reg198 ? (8'haa) : wire190)))));
          reg196 <= $signed((wire3 | (wire192 ?
              $unsigned(wire1[(4'h8):(3'h4)]) : $signed($unsigned(reg194)))));
          reg197 <= (~&$unsigned($unsigned($signed({reg193, wire2}))));
        end
      reg200 <= $unsigned($unsigned(($signed((wire1 ? wire1 : reg193)) ?
          $signed({wire0, reg197}) : reg198[(1'h0):(1'h0)])));
    end
  assign wire201 = (8'hbf);
  assign wire202 = {((7'h42) ? wire3 : $unsigned(wire1))};
  assign wire203 = $unsigned((~&(((wire192 ? (8'hac) : wire202) ?
                           wire2[(4'hb):(3'h6)] : wire202) ?
                       (reg193 ?
                           $unsigned(reg195) : wire1) : reg193[(4'hf):(4'h8)])));
  assign wire204 = reg194[(3'h5):(1'h0)];
  assign wire205 = (~&$unsigned($unsigned({(+(7'h44)), $signed((7'h44))})));
  assign wire206 = (^(($signed(reg194) ? (~|{(8'hb7), wire204}) : (~reg197)) ?
                       wire203[(5'h11):(4'he)] : (7'h42)));
  assign wire207 = (8'h9d);
  assign wire208 = {{$signed(reg197)}, wire3};
endmodule

module module4
#(parameter param188 = ((~^(((~(8'h9f)) ? ((8'hb1) ? (8'hb8) : (8'ha7)) : ((7'h40) <= (8'ha7))) ? (^{(7'h44)}) : ((^~(8'hbc)) >>> (~^(8'hac))))) ? (((((7'h43) ? (8'ha0) : (7'h43)) ? ((8'hb2) ? (8'hbb) : (7'h44)) : {(8'hb4), (7'h42)}) ? ({(7'h42)} ~^ {(8'hab), (8'hbc)}) : ({(7'h42), (8'hbf)} ? (-(8'hbe)) : ((8'h9e) ? (7'h42) : (8'hbc)))) ? (({(8'hb4)} < ((8'hb4) * (8'ha5))) ? (8'hb1) : ({(8'hb6)} ? ((8'h9d) ? (8'hab) : (8'ha2)) : {(8'hbc)})) : (~&({(8'hbd)} - ((8'ha9) * (8'ha7))))) : (^((~^((8'ha8) <<< (8'hbb))) < (&{(7'h42), (8'ha6)})))), 
parameter param189 = param188)
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h28c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire5;
  input wire [(5'h15):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire98;
  wire signed [(4'h9):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire181;
  wire signed [(5'h10):(1'h0)] wire182;
  wire [(2'h3):(1'h0)] wire183;
  wire signed [(4'he):(1'h0)] wire184;
  wire signed [(3'h6):(1'h0)] wire186;
  reg signed [(5'h15):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg178 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg177 = (1'h0);
  reg signed [(4'he):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg175 = (1'h0);
  reg [(4'hd):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg170 = (1'h0);
  reg [(4'hc):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg168 = (1'h0);
  reg [(5'h11):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(3'h4):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(2'h2):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg154 = (1'h0);
  reg [(4'hd):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg152 = (1'h0);
  reg [(4'h8):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg signed [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  assign y = {wire119,
                 wire98,
                 wire50,
                 wire49,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
                 wire10,
                 wire30,
                 wire146,
                 wire181,
                 wire182,
                 wire183,
                 wire184,
                 wire186,
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
                 reg148,
                 reg48,
                 (1'h0)};
  assign wire10 = (~((wire7[(1'h0):(1'h0)] != (~wire9[(5'h10):(3'h7)])) ?
                      {((&wire8) + $signed(wire5)),
                          {wire5}} : wire6[(4'he):(4'hb)]));
  module11 #() modinst31 (wire30, clk, wire9, wire5, wire6, wire7, wire8);
  module32 #() modinst44 (.clk(clk), .wire34(wire8), .wire33(wire10), .y(wire43), .wire36(wire30), .wire35(wire6));
  assign wire45 = $unsigned($unsigned((($unsigned(wire6) * (&wire10)) == $unsigned(wire6[(1'h0):(1'h0)]))));
  assign wire46 = (&(wire30 ?
                      $signed($unsigned(wire5)) : (~&((~wire5) | wire6))));
  assign wire47 = {{wire5[(3'h7):(3'h6)], wire9}, wire9[(4'hb):(4'ha)]};
  always
    @(posedge clk) begin
      reg48 <= $unsigned($signed((&wire7)));
    end
  assign wire49 = $unsigned($unsigned($signed($unsigned((wire6 <<< (8'had))))));
  assign wire50 = $unsigned(wire9);
  module51 #() modinst99 (wire98, clk, wire5, reg48, wire46, wire49, wire6);
  module100 #() modinst120 (wire119, clk, wire5, wire98, wire7, wire9, wire10);
  module121 #() modinst147 (.wire122(wire45), .wire123(wire5), .clk(clk), .wire125(wire43), .y(wire146), .wire124(wire10));
  always
    @(posedge clk) begin
      reg148 <= wire10[(1'h0):(1'h0)];
      reg149 <= $signed(wire5);
      if (wire9)
        begin
          if ((~wire49))
            begin
              reg150 <= (^~((~^(((8'ha5) == wire7) ^ (+wire50))) ?
                  (wire5 >> {$unsigned(wire30)}) : wire6[(4'hf):(4'hf)]));
              reg151 <= $unsigned((~|((-(wire30 && wire47)) ?
                  ($signed((8'haf)) ?
                      {(8'hbe)} : (wire49 ~^ reg48)) : ((-wire30) ?
                      (8'hb1) : $unsigned(reg148)))));
            end
          else
            begin
              reg150 <= (wire8[(3'h6):(2'h2)] ?
                  {$signed($signed($unsigned(wire146))),
                      ({$signed(reg149),
                          (wire45 ?
                              reg150 : wire7)} ~^ wire146[(4'ha):(2'h2)])} : ($unsigned(wire10[(4'hc):(4'hb)]) == ($unsigned(((8'hb1) ?
                      wire50 : reg149)) ^~ ((wire45 ? wire30 : (8'hbb)) ?
                      (wire46 ? (8'haf) : wire46) : (~|(8'hae))))));
              reg151 <= $unsigned((((~^{reg148, wire6}) ?
                  (~|wire10) : reg149) >>> ($unsigned($signed(wire146)) > wire146)));
              reg152 <= wire9[(4'ha):(4'h8)];
              reg153 <= $signed(((^~wire10) ?
                  {((&wire119) ?
                          $unsigned(wire119) : wire6[(5'h13):(1'h0)])} : {wire119}));
              reg154 <= $unsigned(wire45);
            end
          if ({wire10})
            begin
              reg155 <= {({$signed((reg48 & wire9)), (~&reg154)} ?
                      ($signed(wire98) ?
                          wire45[(5'h11):(4'ha)] : $signed((wire9 || reg48))) : (|(8'ha0))),
                  $unsigned(($signed((wire119 + wire45)) | wire8))};
              reg156 <= wire46[(2'h2):(1'h1)];
              reg157 <= (^~wire45[(4'hd):(4'hc)]);
            end
          else
            begin
              reg155 <= {wire146};
              reg156 <= $signed(wire50[(3'h6):(2'h3)]);
            end
          if ($signed($signed((&wire45))))
            begin
              reg158 <= $unsigned((~^($unsigned((~reg157)) && ({wire50} ?
                  (-(8'ha8)) : (reg153 - wire6)))));
              reg159 <= ($unsigned((~|(+{wire6,
                  wire47}))) + $signed(((wire10 >> wire8) ?
                  ((^~reg156) ?
                      wire119[(3'h5):(3'h5)] : (wire6 * reg48)) : reg156)));
            end
          else
            begin
              reg158 <= $unsigned(wire146[(3'h4):(1'h0)]);
            end
          if ($signed(wire10))
            begin
              reg160 <= {$unsigned(wire146[(4'h8):(1'h1)])};
              reg161 <= reg153;
              reg162 <= (wire98[(3'h6):(3'h5)] ?
                  wire6 : ($signed({wire7}) ^ (|reg48[(4'h8):(4'h8)])));
            end
          else
            begin
              reg160 <= $unsigned(((~&$signed((8'haa))) <<< reg149));
              reg161 <= $unsigned($unsigned($signed($signed({wire45,
                  reg161}))));
              reg162 <= ($signed({$unsigned(wire8)}) ?
                  {$unsigned((7'h44))} : {wire47});
              reg163 <= ((({(wire146 >= (8'ha4))} ?
                      $unsigned(wire6) : $unsigned((+reg149))) ?
                  $signed((^~(reg158 ?
                      wire49 : wire43))) : $signed(((+(8'hbc)) ?
                      ((7'h41) << reg151) : (wire146 != reg159)))) >> ($unsigned(reg151[(4'h8):(2'h3)]) && reg154[(3'h5):(1'h1)]));
            end
          reg164 <= $unsigned(wire49[(3'h6):(3'h4)]);
        end
      else
        begin
          if ($signed(reg159))
            begin
              reg150 <= ($unsigned({$unsigned($unsigned(reg155)),
                  wire47}) >>> wire47[(1'h0):(1'h0)]);
              reg151 <= ($unsigned($unsigned(((reg164 != wire6) ?
                  $unsigned(reg153) : reg151))) << $signed({(+wire46[(3'h6):(1'h1)])}));
            end
          else
            begin
              reg150 <= wire10;
              reg151 <= $signed(wire7);
              reg152 <= $signed({($signed((reg163 ? reg160 : wire43)) ?
                      wire30[(3'h7):(2'h3)] : (((8'hb8) ? reg160 : wire30) ?
                          {reg149, reg154} : wire10[(4'he):(3'h4)])),
                  wire47[(2'h3):(1'h0)]});
              reg153 <= ((7'h43) ?
                  reg156[(1'h1):(1'h0)] : $unsigned(((reg157[(5'h13):(1'h0)] & (8'ha3)) ?
                      wire98[(3'h5):(3'h4)] : reg160)));
              reg154 <= ({{(^{reg164})}} <= (((reg149 >> (7'h44)) ?
                      $unsigned($signed(wire5)) : $unsigned({(7'h42),
                          wire119})) ?
                  $signed($signed(wire5)) : wire8[(1'h1):(1'h1)]));
            end
          reg155 <= $signed($unsigned(reg161));
        end
      if ((&reg153[(2'h2):(1'h1)]))
        begin
          reg165 <= $unsigned((wire5[(4'h9):(3'h4)] ?
              wire46[(5'h10):(2'h2)] : $unsigned((~(reg152 ?
                  (8'hb9) : (7'h43))))));
        end
      else
        begin
          reg165 <= {{{$unsigned(wire47[(4'hf):(4'ha)]),
                      $unsigned($unsigned(reg157))},
                  wire49[(1'h0):(1'h0)]},
              (reg164 ?
                  ((+(^~wire98)) <= (&((8'hab) >>> wire30))) : (wire5[(4'hb):(4'hb)] | (((8'haf) + wire43) || {(8'hb3)})))};
          reg166 <= {reg164};
          if ($signed(($unsigned($signed((~&wire6))) >>> $unsigned($signed($signed(reg165))))))
            begin
              reg167 <= (&$unsigned($unsigned(wire5)));
              reg168 <= $unsigned((8'hbd));
              reg169 <= ($unsigned((reg162[(3'h5):(1'h0)] <<< wire47[(4'hd):(3'h6)])) ?
                  (reg168 ?
                      wire146[(1'h0):(1'h0)] : $signed($unsigned($signed(reg149)))) : $unsigned((reg157 <<< ((~&wire47) ^~ (~&(7'h44))))));
            end
          else
            begin
              reg167 <= $unsigned(($unsigned({(^reg152)}) ?
                  (reg166 ?
                      ($signed(wire8) || (!wire46)) : wire10[(4'he):(4'h9)]) : ((+(|wire47)) ^~ ($signed(reg169) < $unsigned(reg150)))));
              reg168 <= ((!(reg161[(4'he):(4'ha)] <= (reg166 ?
                      (reg156 ^ reg168) : (-reg167)))) ?
                  reg163[(1'h1):(1'h0)] : $unsigned($signed(reg48)));
              reg169 <= {reg48};
              reg170 <= wire7;
            end
        end
      reg171 <= (-wire45[(1'h1):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg172 <= ({wire6[(4'hc):(3'h5)], reg158} ^ (^~({wire119,
          $unsigned(wire43)} >= $unsigned($signed((8'hb3))))));
    end
  always
    @(posedge clk) begin
      reg173 <= {({{reg161, ((7'h43) ? reg169 : (8'ha1))}} ?
              reg172 : wire5[(3'h6):(2'h2)]),
          ((wire6 >>> (reg169 + reg169[(1'h0):(1'h0)])) != ($signed((+(8'ha5))) ?
              reg149 : {((8'haf) <<< wire7)}))};
      reg174 <= $signed((&reg170));
      reg175 <= reg169;
    end
  always
    @(posedge clk) begin
      reg176 <= wire43[(3'h5):(2'h2)];
      reg177 <= ($unsigned($unsigned($signed((reg169 | reg163)))) ?
          reg162[(1'h0):(1'h0)] : {{$signed((reg165 ~^ reg153))},
              wire119[(1'h0):(1'h0)]});
      reg178 <= ((wire49[(4'hc):(1'h1)] >= $unsigned((~|(wire43 >= reg151)))) ?
          ((-(&$unsigned((7'h43)))) ?
              reg165[(4'hf):(4'hb)] : (+$unsigned({(8'haa)}))) : $unsigned(reg163));
      reg179 <= ((($unsigned(reg48[(1'h0):(1'h0)]) ?
          reg171 : {reg175[(3'h7):(2'h2)],
              $unsigned(reg165)}) == (reg166 + {reg163[(2'h3):(2'h3)],
          $unsigned(reg165)})) * {reg156, reg155[(1'h0):(1'h0)]});
      reg180 <= $unsigned(reg163[(1'h0):(1'h0)]);
    end
  assign wire181 = (8'h9d);
  assign wire182 = (($signed(reg161[(4'hb):(4'h8)]) ?
                       reg161[(1'h0):(1'h0)] : wire50[(1'h0):(1'h0)]) >>> reg166);
  assign wire183 = $signed(wire43);
  module100 #() modinst185 (wire184, clk, reg169, reg171, wire182, wire47, reg155);
  module121 #() modinst187 (.y(wire186), .wire123(reg154), .clk(clk), .wire122(reg157), .wire124(wire6), .wire125(reg152));
endmodule

module module121  (y, clk, wire125, wire124, wire123, wire122);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire125;
  input wire [(5'h14):(1'h0)] wire124;
  input wire [(3'h5):(1'h0)] wire123;
  input wire [(5'h14):(1'h0)] wire122;
  wire signed [(4'hf):(1'h0)] wire145;
  wire [(5'h15):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire132;
  wire signed [(3'h6):(1'h0)] wire131;
  wire [(3'h7):(1'h0)] wire130;
  wire [(4'h9):(1'h0)] wire129;
  wire signed [(4'h9):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire127;
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg [(4'hf):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg [(3'h4):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(5'h13):(1'h0)] reg137 = (1'h0);
  reg [(3'h4):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  assign y = {wire145,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
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
                 reg126,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg126 <= {{((^$unsigned(wire124)) ?
                  $unsigned($unsigned(wire123)) : $unsigned($signed(wire123))),
              (8'hbc)}};
    end
  assign wire127 = wire124;
  assign wire128 = $unsigned($signed($signed(((~&wire122) ?
                       wire125[(3'h5):(2'h2)] : $signed(wire125)))));
  assign wire129 = {wire124};
  assign wire130 = ($signed(wire123) + (wire124[(4'hf):(3'h4)] ?
                       wire123 : $signed(wire124[(5'h13):(4'hb)])));
  assign wire131 = (((&$unsigned((|wire130))) | {($signed(wire124) ?
                               ((8'hb7) > wire123) : $signed(wire125)),
                           ((wire122 ? wire125 : reg126) ?
                               (wire124 ^~ (8'hb6)) : (8'ha2))}) ?
                       ({($signed((8'hac)) | {wire127})} ?
                           $signed((wire123 < (wire129 ?
                               wire123 : wire124))) : $signed(wire123[(2'h2):(1'h1)])) : $signed(reg126));
  assign wire132 = ($unsigned((8'ha6)) << wire129);
  assign wire133 = wire123[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg134 <= ((!wire123) >= (~|($signed(wire127[(3'h5):(1'h1)]) << ((+wire131) <= (+wire130)))));
      reg135 <= $signed($unsigned((^(wire130 && (!wire125)))));
      reg136 <= (-((+$signed((8'hba))) | (wire131 ?
          (~(~^(8'hae))) : (~&(wire132 ? wire131 : wire125)))));
      reg137 <= ({$unsigned((wire128 ?
                  $signed(reg136) : (reg126 ? reg136 : wire125)))} ?
          $unsigned((^~wire123[(1'h1):(1'h0)])) : $unsigned({(~&$signed(wire127))}));
      if (wire130[(3'h5):(1'h1)])
        begin
          if ({wire128})
            begin
              reg138 <= (wire130 >> $signed($unsigned(reg135[(2'h3):(1'h0)])));
              reg139 <= $signed($signed(({(reg134 ?
                      reg138 : wire122)} + (wire129 ?
                  $signed((8'hb0)) : (wire133 ? wire129 : (8'hbc))))));
            end
          else
            begin
              reg138 <= (+(($unsigned((reg136 ? wire124 : wire129)) ?
                  ((reg139 < reg138) ?
                      reg137 : (^wire127)) : reg135[(1'h0):(1'h0)]) ^ (reg139[(1'h0):(1'h0)] & wire127[(4'he):(3'h6)])));
            end
          if (reg126)
            begin
              reg140 <= ((~^(({reg138,
                      wire132} >> {(8'hac)}) == $signed(wire122))) ?
                  ((wire133 ? (^~(+wire131)) : wire130) ?
                      $unsigned($signed((wire129 < wire122))) : (-(!(+reg138)))) : wire132);
            end
          else
            begin
              reg140 <= wire133[(4'ha):(1'h1)];
              reg141 <= wire130;
              reg142 <= wire131[(3'h6):(2'h2)];
              reg143 <= $signed({(wire122[(5'h14):(1'h0)] ^~ wire130),
                  $signed($signed((^~wire124)))});
            end
          reg144 <= $unsigned(wire123[(3'h4):(3'h4)]);
        end
      else
        begin
          reg138 <= wire132;
        end
    end
  assign wire145 = wire133;
endmodule

module module100
#(parameter param118 = (^(((8'had) ? ({(7'h41)} >>> (&(8'ha7))) : ({(7'h42), (7'h40)} > ((8'hb2) ? (7'h43) : (8'ha8)))) ? ((^{(8'ha0)}) ? (~&(!(8'hb5))) : (((8'ha0) ? (8'hbf) : (8'hba)) ? ((8'ha9) * (8'had)) : (~&(8'hb8)))) : {((^~(7'h41)) ? {(8'hb7), (8'ha3)} : ((7'h44) > (8'hbb)))})))
(y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire105;
  input wire [(3'h6):(1'h0)] wire104;
  input wire signed [(5'h10):(1'h0)] wire103;
  input wire signed [(4'h9):(1'h0)] wire102;
  input wire [(5'h14):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire116;
  wire signed [(5'h13):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire [(5'h14):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire106;
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire106 = (~$signed({$unsigned((wire102 && wire104)),
                       ({(8'hbb), wire105} ? (+wire101) : wire105)}));
  assign wire107 = wire106;
  assign wire108 = ((^~($signed(((8'hb1) ?
                       (8'hb2) : wire105)) * {(wire101 < wire107),
                       wire107[(5'h11):(3'h7)]})) < wire107[(4'hd):(1'h0)]);
  assign wire109 = wire108;
  assign wire110 = $signed(wire102[(1'h0):(1'h0)]);
  assign wire111 = $signed((~|wire106[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg112 <= wire104;
      reg113 <= $signed(((8'hb3) <<< $unsigned(wire107[(5'h12):(4'hc)])));
      reg114 <= ((((wire101 > (reg112 ? wire110 : wire111)) ?
              ((wire101 >> wire104) ?
                  (wire106 == wire109) : $signed((8'ha7))) : (wire110 > (~&reg113))) * $unsigned(wire104)) ?
          (^~(~$unsigned(wire107))) : $signed($signed(($unsigned(wire102) <= $unsigned(reg112)))));
      reg115 <= (~&wire106[(1'h0):(1'h0)]);
    end
  assign wire116 = $signed($unsigned({((wire111 ? reg113 : wire102) * wire101),
                       wire107}));
  assign wire117 = (({wire109, {$signed(reg113)}} - ((((8'h9e) <= (8'hb7)) ?
                       ((8'hac) || wire108) : (wire107 ?
                           wire103 : wire105)) & ($signed(reg114) ~^ wire101))) ^~ ((((|(8'hb5)) | $signed(wire108)) + $signed(wire107[(3'h4):(1'h1)])) ?
                       $unsigned($unsigned((~|wire116))) : (($signed(reg115) <<< wire111) << (reg112[(3'h5):(2'h2)] | (^~wire101)))));
endmodule

module module51  (y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire56;
  input wire [(4'hc):(1'h0)] wire55;
  input wire signed [(3'h4):(1'h0)] wire54;
  input wire signed [(2'h3):(1'h0)] wire53;
  input wire signed [(3'h5):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire73,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
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
                 (1'h0)};
  assign wire57 = (|{((wire52[(1'h1):(1'h0)] < (^wire55)) ?
                          $signed(wire55) : {{wire53, wire56},
                              $unsigned(wire52)})});
  assign wire58 = (~^wire57);
  assign wire59 = $signed($unsigned($unsigned($unsigned(wire55[(3'h6):(1'h0)]))));
  assign wire60 = (&(^{((wire55 ? wire56 : wire55) + (wire52 & (8'hbc)))}));
  assign wire61 = (wire54 ? (8'hbe) : $signed(wire59[(2'h3):(2'h2)]));
  assign wire62 = $signed(($signed(wire55) != (&$signed((wire57 ?
                      wire56 : wire54)))));
  always
    @(posedge clk) begin
      if ({wire53, (8'ha7)})
        begin
          reg63 <= $unsigned(wire59[(4'h9):(2'h3)]);
          reg64 <= $unsigned($unsigned(wire52));
          reg65 <= (7'h41);
          reg66 <= {reg63[(4'hc):(4'ha)]};
          reg67 <= {(~^($signed((wire59 ?
                  reg66 : (7'h41))) <= wire61[(4'he):(4'hb)])),
              (8'hb9)};
        end
      else
        begin
          if ($unsigned(reg67))
            begin
              reg63 <= $signed($signed(wire58));
              reg64 <= $signed((wire58 & ($signed({reg66, reg63}) ?
                  {reg63} : wire62[(2'h2):(2'h2)])));
            end
          else
            begin
              reg63 <= (wire55[(3'h7):(2'h3)] ?
                  $signed($unsigned((!$unsigned(wire58)))) : (|(~wire62)));
              reg64 <= wire58;
            end
          if ($signed(((~&((reg63 ? wire53 : wire55) && $signed(reg64))) ?
              (reg66[(5'h15):(5'h13)] ?
                  ($signed(wire57) ?
                      reg67[(2'h2):(2'h2)] : {wire54}) : (wire56[(3'h6):(3'h5)] ?
                      (wire60 ?
                          wire60 : reg64) : wire61)) : wire56[(1'h1):(1'h0)])))
            begin
              reg65 <= ((^(wire61[(3'h4):(2'h3)] ?
                  reg66 : $signed($signed(reg66)))) ~^ reg63[(4'hb):(4'hb)]);
              reg66 <= (reg66 ? reg67[(4'hc):(4'h9)] : {wire58});
            end
          else
            begin
              reg65 <= $unsigned($signed({($unsigned(wire56) ?
                      $signed(reg63) : $unsigned(reg63))}));
              reg66 <= $unsigned((wire60[(2'h2):(2'h2)] ?
                  $unsigned((^$signed(wire58))) : (|$signed(wire58[(4'hd):(4'hc)]))));
              reg67 <= ($unsigned(wire54) & (($signed((wire53 << reg66)) ?
                      wire54[(2'h2):(1'h1)] : (!wire58)) ?
                  wire58[(4'hd):(4'hd)] : (~^(&(wire56 ? reg66 : wire59)))));
              reg68 <= {($signed((^~$unsigned(wire58))) * {wire58,
                      (|(reg64 == reg66))}),
                  ($signed(reg67) ?
                      $signed(($signed(wire60) ?
                          (!reg67) : (wire62 || wire59))) : ($unsigned($signed(wire56)) != ((|(8'ha8)) ?
                          $unsigned(reg66) : (wire53 == wire54))))};
              reg69 <= wire52;
            end
          if ($unsigned({wire62[(4'h8):(2'h3)],
              $signed((wire59 ? (~wire59) : (reg68 ? (8'ha1) : reg63)))}))
            begin
              reg70 <= reg66;
              reg71 <= wire56[(3'h7):(1'h0)];
            end
          else
            begin
              reg70 <= $signed($signed(reg63[(1'h1):(1'h0)]));
            end
          reg72 <= $signed(wire60[(4'hd):(3'h6)]);
        end
    end
  assign wire73 = ({wire53[(1'h1):(1'h1)]} ?
                      $signed({{reg64,
                              wire61}}) : ($signed((wire54[(3'h4):(2'h3)] ?
                          $signed(reg67) : wire62)) | ($signed($signed(wire56)) != ($unsigned(wire58) < $signed(wire53)))));
  always
    @(posedge clk) begin
      if (reg70)
        begin
          reg74 <= $signed($unsigned(wire54[(1'h0):(1'h0)]));
          reg75 <= (-(((7'h40) != $unsigned(wire55)) ?
              wire55[(4'ha):(1'h0)] : wire57[(5'h12):(4'h9)]));
          reg76 <= $unsigned((~reg67[(4'ha):(4'h8)]));
          if ((wire73 ? wire54[(2'h3):(2'h3)] : wire52[(3'h4):(2'h2)]))
            begin
              reg77 <= {{reg67[(4'h8):(3'h6)]}};
              reg78 <= (-((-(wire73 ?
                      (wire62 ? wire73 : reg72) : {wire59, wire60})) ?
                  {({reg72, wire73} ?
                          reg77[(1'h1):(1'h1)] : (reg75 < reg65))} : $unsigned(wire59)));
              reg79 <= reg75;
            end
          else
            begin
              reg77 <= (((|$signed((wire62 != reg71))) > reg76) >= (reg65[(1'h0):(1'h0)] ?
                  $signed(wire56) : $unsigned($unsigned({reg65}))));
              reg78 <= $signed((((reg64[(3'h5):(3'h4)] <<< reg65[(3'h5):(2'h3)]) ^ $signed((reg78 ?
                      (8'h9d) : wire54))) ?
                  reg79[(3'h5):(1'h0)] : {($unsigned(wire54) >= (^~wire54)),
                      wire57[(5'h12):(3'h7)]}));
            end
          reg80 <= (wire61 >= $signed((8'hbf)));
        end
      else
        begin
          reg74 <= $signed($unsigned(({(reg75 == (8'ha0)), $signed(wire55)} ?
              reg68[(4'ha):(3'h7)] : {$unsigned(reg71), (~^reg77)})));
          reg75 <= wire55;
          if ($signed((~|(+{(reg68 - reg77)}))))
            begin
              reg76 <= (|wire57[(3'h7):(1'h0)]);
              reg77 <= (reg74[(5'h12):(3'h6)] ?
                  (8'ha9) : $signed($unsigned(reg80)));
              reg78 <= wire73[(3'h4):(1'h0)];
              reg79 <= $signed($signed((^($signed(reg75) ?
                  $unsigned(wire52) : $unsigned(wire73)))));
            end
          else
            begin
              reg76 <= ($signed($signed($unsigned((reg67 ?
                  reg64 : wire62)))) ~^ (8'haf));
              reg77 <= ($signed(wire73) ? wire57[(5'h10):(4'hd)] : reg70);
              reg78 <= $signed((~|$signed(reg71)));
              reg79 <= (7'h40);
              reg80 <= $signed(wire73);
            end
          reg81 <= $signed(wire54[(3'h4):(2'h3)]);
        end
      reg82 <= $signed((wire60 - $signed($signed(reg78[(3'h5):(1'h0)]))));
      reg83 <= (~|{{$signed((!(8'ha7)))},
          ((8'hac) ? $signed($signed(reg63)) : wire52[(3'h5):(3'h4)])});
      if (reg64)
        begin
          reg84 <= wire73;
          reg85 <= (+(8'hb4));
        end
      else
        begin
          reg84 <= ((({$signed(reg67),
              (wire54 >>> reg78)} ~^ $signed($unsigned(wire58))) << reg70) <<< (reg79[(4'h8):(3'h5)] ?
              wire53 : (reg71[(1'h1):(1'h1)] ^~ {reg64})));
          reg85 <= $signed(({$unsigned($signed((7'h42))), $signed(reg79)} ?
              (&((reg82 != wire73) <= reg68[(2'h3):(1'h0)])) : reg83));
          reg86 <= ((wire56[(3'h7):(3'h7)] ?
                  $signed({$signed(reg80)}) : (~reg76[(3'h5):(3'h4)])) ?
              ($signed(((wire57 <<< reg63) == reg78)) > $signed((^~wire59[(4'hc):(4'ha)]))) : reg69);
          reg87 <= (7'h41);
          if ($signed($unsigned(((reg81[(4'h8):(3'h4)] << wire57[(3'h6):(2'h2)]) ?
              reg74 : reg81))))
            begin
              reg88 <= $signed((reg70 ?
                  (wire57 ?
                      reg86[(2'h2):(1'h1)] : reg69[(3'h7):(2'h2)]) : $unsigned(reg65)));
              reg89 <= wire62[(1'h0):(1'h0)];
              reg90 <= (&($unsigned((|(reg76 ?
                  wire57 : reg70))) >>> ($unsigned(wire62[(3'h7):(2'h3)]) ?
                  ({reg87, (8'hb6)} ?
                      (wire62 || wire57) : (reg80 && (8'hb0))) : $signed(wire54))));
              reg91 <= (8'hb0);
              reg92 <= $signed(reg66);
            end
          else
            begin
              reg88 <= reg82;
              reg89 <= reg86;
              reg90 <= $unsigned(reg65[(1'h0):(1'h0)]);
            end
        end
      if ((({reg74[(5'h10):(1'h0)],
          ({reg83, reg89} ? reg68 : reg88[(2'h3):(2'h2)])} >= (reg87 ?
          {(~reg74), $signed(reg67)} : reg65)) && reg70))
        begin
          reg93 <= reg72[(1'h1):(1'h0)];
          reg94 <= (^$signed(reg81[(3'h5):(1'h0)]));
        end
      else
        begin
          reg93 <= reg70;
          reg94 <= reg91;
        end
    end
  assign wire95 = (reg78[(4'hb):(4'h8)] ?
                      ((wire61 ?
                              $signed(reg71[(1'h0):(1'h0)]) : ($signed((8'hbc)) >>> $signed(reg63))) ?
                          $signed(((wire61 << wire61) ?
                              (wire60 - reg65) : wire60[(3'h7):(3'h4)])) : $unsigned($signed({wire61,
                              reg93}))) : (+reg76[(3'h4):(1'h1)]));
  assign wire96 = reg92[(4'hb):(3'h5)];
  assign wire97 = (7'h41);
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire36;
  input wire [(5'h15):(1'h0)] wire35;
  input wire signed [(2'h2):(1'h0)] wire34;
  input wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  assign y = {wire42, wire41, wire40, wire39, wire38, wire37, (1'h0)};
  assign wire37 = $signed((wire35[(5'h11):(5'h11)] >>> (((wire35 && wire36) != (~|wire34)) - (wire33[(4'hc):(4'hc)] ~^ ((8'hb9) ~^ wire33)))));
  assign wire38 = (((8'hb8) - ($signed((!wire35)) ?
                          wire34[(1'h0):(1'h0)] : wire36[(4'hb):(3'h5)])) ?
                      $unsigned(wire33) : (wire34 <= (~|($unsigned((8'ha7)) < (wire35 ?
                          wire34 : wire35)))));
  assign wire39 = wire35;
  assign wire40 = $unsigned(($signed($unsigned(wire38)) < $unsigned(((^(7'h42)) && (8'ha5)))));
  assign wire41 = wire33[(4'hb):(4'hb)];
  assign wire42 = $signed(wire35);
endmodule

module module11
#(parameter param28 = {(~&({((8'ha4) <<< (8'hb6))} ? (^((8'hb1) ? (8'hb6) : (8'hb7))) : {((8'hac) || (8'hb5)), {(8'had), (7'h40)}})), ((8'hb0) ? (((8'hb6) != (~(7'h41))) << (((8'ha8) ? (8'haa) : (8'hb7)) <= {(8'h9c)})) : {(~{(8'h9c)})})}, 
parameter param29 = ((((|(param28 ^ param28)) ? (!(^param28)) : param28) ? (((7'h44) + (8'had)) < (~|param28)) : ((~^(&param28)) ? {(&param28)} : ({param28} ? (&param28) : (|param28)))) ? {param28, (((~^param28) ? (param28 ^ param28) : (8'haa)) ? (~{param28, param28}) : (((8'hb4) + param28) ? (param28 ? param28 : param28) : {param28, param28}))} : (param28 << param28)))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire16;
  input wire [(2'h2):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  assign y = {wire27,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire17 = $signed(($unsigned(((wire12 | wire12) || $signed(wire16))) ?
                      $signed(($signed(wire14) * (~&wire16))) : $signed(($unsigned(wire15) ?
                          (~^wire13) : $signed((8'hb6))))));
  assign wire18 = (&{((~|(wire15 ?
                          wire17 : wire14)) != (~&wire16[(3'h4):(1'h1)]))});
  assign wire19 = $signed((wire17[(3'h4):(1'h0)] ?
                      (wire15 ?
                          ((wire17 ? (8'ha1) : (8'hba)) ?
                              ((8'ha2) ?
                                  wire14 : (8'hb8)) : $unsigned(wire13)) : wire13) : (wire17 > $unsigned({wire16}))));
  assign wire20 = wire19;
  assign wire21 = (8'h9e);
  always
    @(posedge clk) begin
      reg22 <= ((((&(wire19 ? wire18 : wire21)) ?
                  (wire15 ^~ {wire18}) : $unsigned($unsigned(wire19))) ?
              (((wire18 ? wire18 : wire13) - (|wire12)) ?
                  wire12 : $signed({wire21, (8'hab)})) : (^((~wire18) ?
                  {wire15, wire12} : (wire16 < wire20)))) ?
          {(({wire18} ? wire17[(2'h3):(1'h1)] : wire19) ^ wire16),
              wire15[(1'h1):(1'h0)]} : wire15);
      reg23 <= wire14[(4'hf):(2'h2)];
      reg24 <= {wire21[(4'h8):(1'h0)]};
      reg25 <= $unsigned(wire20[(3'h6):(3'h5)]);
      reg26 <= $unsigned(reg25);
    end
  assign wire27 = ({(^{wire12})} ?
                      wire21 : ($signed(((reg25 ? reg26 : wire14) ?
                          (reg25 <<< (8'ha9)) : (reg23 ?
                              wire18 : reg25))) || (|({reg22} ?
                          (reg22 ? wire18 : (8'hbc)) : $signed((8'ha2))))));
endmodule
