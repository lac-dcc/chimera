module top
#(parameter param216 = (8'hba), 
parameter param217 = param216)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire214;
  wire [(3'h5):(1'h0)] wire213;
  wire signed [(3'h6):(1'h0)] wire212;
  wire [(2'h2):(1'h0)] wire211;
  wire signed [(3'h5):(1'h0)] wire210;
  wire signed [(5'h15):(1'h0)] wire209;
  wire [(3'h5):(1'h0)] wire208;
  wire [(4'h8):(1'h0)] wire207;
  wire [(4'h9):(1'h0)] wire203;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire195;
  wire [(2'h2):(1'h0)] wire197;
  wire [(5'h11):(1'h0)] wire199;
  wire signed [(2'h3):(1'h0)] wire201;
  wire [(5'h13):(1'h0)] wire205;
  reg [(3'h7):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  assign y = {wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire203,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire13,
                 wire14,
                 wire195,
                 wire197,
                 wire199,
                 wire201,
                 wire205,
                 reg200,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire5 = (8'had);
  assign wire6 = wire4;
  assign wire7 = $signed(wire4);
  assign wire8 = (wire2 + ($signed(wire4[(3'h7):(3'h6)]) ?
                     {$unsigned((wire4 ? wire5 : wire3)),
                         wire0[(4'h8):(1'h1)]} : wire0));
  always
    @(posedge clk) begin
      reg9 <= wire3[(4'hf):(3'h6)];
      reg10 <= wire3;
      reg11 <= $signed((($unsigned((wire1 & wire6)) <= $signed(wire7[(1'h0):(1'h0)])) != ({(reg9 ^~ wire3)} ?
          $signed($signed((8'ha7))) : ((wire1 <<< wire6) <= wire6))));
      reg12 <= $unsigned({(((^~wire4) ? wire1 : (^reg9)) < $signed((wire5 ?
              wire2 : reg11))),
          ((~&(wire2 && wire7)) ? reg10[(2'h3):(1'h0)] : {{reg11, reg11}})});
    end
  assign wire13 = (8'h9f);
  assign wire14 = $signed(({(&(wire2 ? wire3 : reg10)),
                      (~|(wire8 ? (8'ha9) : wire0))} > $unsigned({(+reg9)})));
  module15 #() modinst196 (.wire18(wire7), .clk(clk), .y(wire195), .wire17(wire4), .wire16(wire1), .wire19(wire14));
  module52 #() modinst198 (.wire54(reg10), .y(wire197), .wire56(wire7), .wire55(wire2), .wire53(wire195), .clk(clk), .wire57(wire5));
  assign wire199 = (reg9[(4'hd):(3'h7)] ^ $unsigned($signed(((wire7 >= reg11) ?
                       {(8'hbd)} : {wire13, reg10}))));
  always
    @(posedge clk) begin
      reg200 <= (wire8[(2'h3):(1'h1)] <<< $signed((&(-$unsigned(wire4)))));
    end
  module52 #() modinst202 (wire201, clk, reg12, wire195, reg10, wire0, wire6);
  module15 #() modinst204 (.wire17(wire14), .wire18(wire13), .y(wire203), .clk(clk), .wire16(wire199), .wire19(reg11));
  module91 #() modinst206 (wire205, clk, wire195, wire3, wire6, reg200);
  assign wire207 = (~&(~^{reg12[(1'h1):(1'h0)], (8'haf)}));
  assign wire208 = wire6[(4'hb):(4'ha)];
  assign wire209 = (&$unsigned({(reg11[(5'h10):(4'hf)] ?
                           (~&(8'ha6)) : $unsigned(wire208)),
                       $unsigned(reg200)}));
  assign wire210 = wire0;
  assign wire211 = {((8'hb7) > {((reg9 ^~ wire13) != {reg9, wire8}),
                           (~^$unsigned(wire209))})};
  assign wire212 = {(wire7[(4'hb):(1'h1)] && (~|$unsigned($signed(wire209)))),
                       $signed($unsigned($unsigned((wire195 ?
                           wire8 : wire2))))};
  assign wire213 = (&(^~reg10[(2'h3):(1'h1)]));
  module27 #() modinst215 (.wire29(wire203), .wire28(wire209), .wire31(wire14), .y(wire214), .clk(clk), .wire30(wire6));
endmodule

module module15
#(parameter param194 = (((((+(8'ha6)) ~^ (8'h9c)) ? ((+(7'h42)) != ((7'h43) & (8'ha3))) : {{(8'h9f), (8'hb2)}}) || (!(-(!(7'h41))))) - (!(((|(8'hbf)) * ((8'hb9) >= (8'ha6))) != (+(-(8'h9e)))))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(5'h14):(1'h0)] wire17;
  input wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire193;
  wire signed [(4'hb):(1'h0)] wire192;
  wire [(5'h15):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire140;
  wire signed [(3'h6):(1'h0)] wire190;
  assign y = {wire193,
                 wire192,
                 wire88,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire42,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire90,
                 wire140,
                 wire190,
                 (1'h0)};
  assign wire20 = {((~|wire18[(2'h3):(1'h0)]) << (((8'hb3) ?
                          $unsigned(wire18) : {wire19,
                              wire18}) & wire17[(3'h4):(2'h3)]))};
  assign wire21 = wire17[(4'h9):(4'h9)];
  assign wire22 = $unsigned((wire20 >= wire16));
  assign wire23 = wire21;
  assign wire24 = wire23[(2'h3):(2'h2)];
  assign wire25 = $unsigned(wire24[(4'hc):(4'h8)]);
  assign wire26 = $unsigned((~&(($signed(wire19) ?
                          $signed(wire17) : (|wire23)) ?
                      $unsigned((+wire17)) : $unsigned($unsigned(wire22)))));
  module27 #() modinst43 (.wire29(wire20), .wire28(wire21), .wire31(wire17), .y(wire42), .wire30(wire23), .clk(clk));
  assign wire44 = (((^$signed(wire24[(3'h4):(2'h2)])) + {wire22}) ^ ((wire21 ?
                      $unsigned({wire23}) : ((wire21 ^~ wire25) ?
                          wire20 : $signed(wire20))) | wire19));
  assign wire45 = (wire44 ?
                      (^((wire17[(2'h3):(2'h2)] <= (-wire44)) ?
                          wire42 : wire23[(4'hc):(1'h1)])) : wire23);
  assign wire46 = wire25;
  assign wire47 = ((wire23[(4'hb):(2'h2)] ^ (!($signed((8'hb5)) < $signed((8'hbf))))) ?
                      $signed((wire17[(4'hd):(1'h1)] ?
                          $unsigned((^~wire22)) : wire25[(4'h9):(3'h4)])) : $unsigned(wire45[(4'hd):(2'h2)]));
  assign wire48 = $signed(wire46);
  assign wire49 = wire47[(2'h2):(1'h0)];
  assign wire50 = ($signed((^((wire48 ?
                      wire16 : wire22) ~^ wire19[(3'h6):(2'h3)]))) >= $unsigned((8'ha6)));
  assign wire51 = ($unsigned($signed($signed(((8'hb8) << wire17)))) - (($signed($unsigned(wire17)) != $unsigned($unsigned((8'ha1)))) ?
                      (($signed(wire45) >>> $signed(wire46)) ?
                          $signed(((8'hac) ~^ wire26)) : (wire16[(3'h6):(3'h4)] ?
                              wire26[(2'h3):(2'h3)] : ((8'h9d) ^~ wire21))) : ({((8'hb8) + wire18),
                          wire45[(4'h8):(2'h3)]} ~^ ($signed(wire49) ?
                          ((7'h40) ? wire45 : wire26) : $signed(wire24)))));
  module52 #() modinst89 (.clk(clk), .wire56(wire17), .wire53(wire23), .wire55(wire24), .wire54(wire25), .y(wire88), .wire57(wire22));
  assign wire90 = $signed(($signed({$signed(wire50)}) - wire19));
  module91 #() modinst141 (wire140, clk, wire88, wire21, wire44, wire50);
  module142 #() modinst191 (.wire144(wire17), .wire146(wire48), .wire147(wire50), .y(wire190), .wire143(wire22), .wire145(wire23), .clk(clk));
  assign wire192 = (+(&{{$unsigned(wire22)}}));
  assign wire193 = $unsigned(wire140[(3'h5):(3'h4)]);
endmodule

module module142
#(parameter param189 = (({(~|((8'hae) > (8'hb9)))} ? (((~&(8'hb7)) > (!(8'hbb))) ? {((8'hb8) ^~ (7'h44)), ((8'hbd) ? (8'h9e) : (8'hb2))} : ((~^(8'hb1)) ? ((8'hbf) ? (8'ha8) : (8'hae)) : (^(8'hb0)))) : ((((8'hb1) ~^ (8'hb0)) * ((7'h41) ? (8'ha5) : (8'haf))) <<< ({(7'h44), (8'hbe)} | (7'h43)))) ? (^((8'hb1) & ((|(8'ha5)) * (^(8'hb6))))) : (~&((((8'hab) < (8'hb5)) ? (&(8'hbd)) : ((8'haa) ? (7'h43) : (8'hbf))) < (((8'hb8) ? (8'hb8) : (8'h9c)) ? (~|(8'ha3)) : ((7'h42) ? (8'hbd) : (8'ha4)))))))
(y, clk, wire147, wire146, wire145, wire144, wire143);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire147;
  input wire signed [(3'h7):(1'h0)] wire146;
  input wire signed [(5'h13):(1'h0)] wire145;
  input wire signed [(4'h8):(1'h0)] wire144;
  input wire [(4'he):(1'h0)] wire143;
  wire signed [(4'hc):(1'h0)] wire188;
  wire signed [(3'h5):(1'h0)] wire187;
  wire signed [(4'hf):(1'h0)] wire186;
  wire [(3'h5):(1'h0)] wire185;
  wire signed [(4'hd):(1'h0)] wire184;
  wire [(4'h9):(1'h0)] wire183;
  wire [(3'h7):(1'h0)] wire182;
  wire [(5'h15):(1'h0)] wire181;
  wire signed [(4'h8):(1'h0)] wire179;
  wire signed [(3'h5):(1'h0)] wire178;
  wire signed [(4'h9):(1'h0)] wire177;
  wire [(3'h6):(1'h0)] wire176;
  wire [(2'h2):(1'h0)] wire175;
  wire signed [(3'h5):(1'h0)] wire174;
  wire [(4'h9):(1'h0)] wire173;
  wire [(4'hf):(1'h0)] wire172;
  wire [(4'h9):(1'h0)] wire158;
  wire [(3'h4):(1'h0)] wire157;
  reg signed [(5'h15):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg169 = (1'h0);
  reg [(3'h7):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg167 = (1'h0);
  reg [(4'ha):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg164 = (1'h0);
  reg [(2'h2):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg162 = (1'h0);
  reg signed [(4'he):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(4'ha):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg156 = (1'h0);
  reg [(3'h5):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire158,
                 wire157,
                 reg180,
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
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg148 <= (wire147[(4'h8):(3'h5)] != (&wire146));
      reg149 <= wire146;
    end
  always
    @(posedge clk) begin
      reg150 <= $signed(($signed((~|reg148)) ?
          wire144 : ((wire147[(4'hd):(1'h1)] ^ wire144) ^~ wire144)));
    end
  always
    @(posedge clk) begin
      reg151 <= (-(wire146 ?
          reg148[(2'h2):(2'h2)] : $unsigned(wire144[(3'h4):(1'h0)])));
      reg152 <= $signed((|($unsigned((reg148 <= reg150)) >>> wire144[(3'h5):(1'h1)])));
      if (($unsigned((-(~^(wire145 ? wire144 : wire143)))) ?
          $unsigned(wire145) : $signed($signed((8'ha3)))))
        begin
          if ((wire147[(3'h7):(3'h4)] >>> (reg148[(3'h5):(1'h1)] < (!$unsigned((wire143 ?
              wire146 : wire144))))))
            begin
              reg153 <= (reg148 <= ($signed((!(~^wire144))) > $unsigned($signed($unsigned((8'hb1))))));
            end
          else
            begin
              reg153 <= ($signed(reg148[(3'h5):(2'h2)]) ?
                  {$unsigned({reg149}),
                      ((^~(wire143 || wire147)) || reg148)} : $unsigned(($unsigned(reg150) && $unsigned((wire147 ?
                      wire143 : wire147)))));
              reg154 <= (&$unsigned($unsigned($unsigned(reg153[(2'h3):(2'h3)]))));
            end
          reg155 <= $signed({(wire146 ?
                  {(-reg154)} : ((wire145 < reg154) - (wire146 ?
                      wire143 : wire147)))});
        end
      else
        begin
          reg153 <= (^(~|$signed(reg154[(3'h5):(2'h2)])));
        end
      reg156 <= (($unsigned(((wire145 ~^ reg151) == $unsigned(wire147))) ?
          $signed($signed((^~reg152))) : (reg153 ?
              $unsigned((reg151 < wire145)) : (~^(~&reg148)))) << $unsigned($unsigned($unsigned(wire143))));
    end
  assign wire157 = $unsigned(((|((reg148 >> reg150) ?
                           (wire146 + reg148) : (8'hbe))) ?
                       (((&wire145) >>> (!reg152)) ?
                           $signed($unsigned(reg149)) : {(wire144 && (8'ha1))}) : ((+(reg156 ?
                           reg148 : wire145)) || reg151[(3'h5):(3'h5)])));
  assign wire158 = ((|(((~&wire157) < (~wire143)) ~^ $unsigned({reg154,
                       (8'h9c)}))) && reg155[(3'h5):(2'h3)]);
  always
    @(posedge clk) begin
      reg159 <= $unsigned(reg150);
      reg160 <= wire158;
      if (reg150)
        begin
          if ($unsigned((wire157[(2'h2):(1'h1)] <<< $signed($unsigned($unsigned(reg148))))))
            begin
              reg161 <= $signed(($unsigned((8'ha1)) ?
                  (~&{wire146[(2'h2):(1'h1)],
                      (reg148 + reg150)}) : {{$unsigned(reg152),
                          $signed(reg149)}}));
              reg162 <= ((({reg161[(2'h2):(2'h2)]} || (wire144[(2'h2):(1'h1)] ?
                          wire144 : wire143)) ?
                      ($unsigned($unsigned(reg155)) ?
                          reg148[(1'h1):(1'h1)] : (|((8'h9d) ?
                              wire158 : reg148))) : $unsigned((~&(!(8'hbb))))) ?
                  $signed((reg154[(4'hd):(4'hd)] > $signed($signed(reg159)))) : $unsigned((((reg155 + wire144) ?
                          reg155 : wire157) ?
                      reg156[(3'h7):(3'h6)] : $signed($signed((8'hb9))))));
              reg163 <= $signed({wire145[(3'h6):(2'h3)], $unsigned({reg153})});
              reg164 <= ((~(((+reg148) ?
                      (reg152 ? reg150 : reg148) : (wire157 ?
                          reg160 : reg151)) ?
                  (!$signed(wire157)) : (+(reg151 ?
                      reg148 : reg151)))) <= $unsigned(reg156));
              reg165 <= reg159;
            end
          else
            begin
              reg161 <= ({$signed((reg150 ?
                      $unsigned(reg162) : reg162))} > $signed({$unsigned((7'h44))}));
              reg162 <= wire146;
              reg163 <= wire146;
              reg164 <= {wire157};
              reg165 <= $signed(reg159[(3'h5):(2'h3)]);
            end
        end
      else
        begin
          reg161 <= $signed(reg165[(3'h6):(3'h4)]);
          reg162 <= $unsigned($unsigned((^$unsigned($unsigned(wire147)))));
          reg163 <= $unsigned(({reg153, (reg156 - reg149[(5'h13):(2'h2)])} ?
              (~{$signed(reg156), $unsigned(reg151)}) : {(+{reg161, reg154})}));
        end
      if ({$unsigned(wire144),
          ((reg160[(2'h3):(2'h2)] ?
                  ((^wire157) == (reg163 * reg150)) : reg155[(3'h4):(3'h4)]) ?
              ({{wire143}, (reg159 && reg160)} ?
                  ($signed((8'had)) > ((8'hb5) << reg164)) : reg149[(1'h1):(1'h1)]) : reg164[(1'h1):(1'h1)])})
        begin
          if ($unsigned((^~(7'h42))))
            begin
              reg166 <= reg153;
              reg167 <= ({(((~^reg163) >= {reg152}) ?
                      reg151[(3'h4):(1'h1)] : $signed($signed((7'h43))))} ~^ ($signed({(^reg154)}) + $signed(wire158)));
              reg168 <= ($unsigned((($unsigned(reg154) ^~ (~^reg149)) <= reg166)) ?
                  reg154 : $signed($signed({(~reg165),
                      (wire143 ? reg160 : reg161)})));
              reg169 <= $unsigned((wire146[(1'h1):(1'h0)] ?
                  (reg156 <= (((8'had) ?
                      reg162 : wire147) < $signed(reg164))) : ((|reg164) ?
                      $unsigned((reg162 & wire147)) : (8'ha5))));
              reg170 <= ($signed(($signed((wire157 ? reg161 : reg151)) ?
                  $unsigned($signed((8'h9f))) : ($unsigned(reg164) ?
                      (reg169 >>> (7'h44)) : (~^reg156)))) >= reg167[(2'h2):(1'h1)]);
            end
          else
            begin
              reg166 <= reg153;
            end
          reg171 <= (^~wire157);
        end
      else
        begin
          if ((((^wire147[(4'he):(3'h4)]) ?
              {wire143[(1'h0):(1'h0)]} : reg149) ^~ ((!reg169[(3'h4):(2'h3)]) ^~ {$unsigned({wire144}),
              (~^reg151[(4'ha):(4'h9)])})))
            begin
              reg166 <= (+$signed({$unsigned(reg151[(3'h5):(3'h4)]),
                  (reg161 <<< (~reg160))}));
              reg167 <= (wire145 ?
                  wire143[(4'he):(3'h7)] : ((((reg165 ?
                          (7'h40) : reg154) >> $signed(reg165)) ?
                      ((8'ha0) + wire147) : (wire147[(4'h9):(3'h7)] ?
                          (reg164 ?
                              reg168 : reg153) : $unsigned(reg161))) >> ({(reg149 ?
                          reg164 : reg160),
                      $unsigned(wire146)} | {reg151, (|wire143)})));
              reg168 <= wire143[(4'ha):(4'h9)];
              reg169 <= ($signed(reg167) ? (~reg155) : {reg169[(3'h6):(1'h1)]});
            end
          else
            begin
              reg166 <= $signed((8'had));
              reg167 <= wire157;
              reg168 <= $unsigned($unsigned(($signed(((8'ha9) | reg149)) ?
                  {(^(8'ha7))} : $unsigned({reg168}))));
            end
        end
    end
  assign wire172 = (((wire147[(1'h1):(1'h0)] ? wire146 : (wire143 <<< reg167)) ?
                           $unsigned($signed(reg171)) : reg164) ?
                       $signed(({(reg150 << wire147)} | {$signed(reg165),
                           {reg151}})) : $unsigned((+reg156[(2'h3):(2'h3)])));
  assign wire173 = $unsigned((~|$unsigned(((+(8'hb8)) ?
                       reg160[(4'h8):(2'h3)] : reg150[(1'h0):(1'h0)]))));
  assign wire174 = reg150;
  assign wire175 = ((~^reg153) <= {({$unsigned(reg166), (wire173 < (8'had))} ?
                           ($unsigned(reg164) ?
                               (reg153 ?
                                   wire145 : wire172) : (reg155 <= reg160)) : (|$unsigned(reg155)))});
  assign wire176 = reg152;
  assign wire177 = $signed((reg152 ?
                       $unsigned((&reg154[(3'h5):(1'h1)])) : $signed((((7'h41) ?
                           (8'hba) : reg154) ^~ $signed(reg166)))));
  assign wire178 = $unsigned(((((&wire146) ^~ wire172) == (~&$signed(reg170))) ?
                       $unsigned((reg162 ?
                           (-reg163) : ((8'haf) ?
                               reg151 : wire173))) : wire176[(2'h2):(1'h1)]));
  assign wire179 = (reg154[(2'h2):(1'h0)] ?
                       $signed((((reg162 > wire143) << $unsigned(reg154)) && reg159)) : ({$signed(reg159[(1'h1):(1'h1)])} <<< (reg161 == {{reg149},
                           reg166})));
  always
    @(posedge clk) begin
      reg180 <= ($signed($signed(($unsigned(wire179) | (reg166 ^ reg166)))) <= ((-reg159) ?
          reg160 : wire145));
    end
  assign wire181 = ($signed({$unsigned($signed((8'h9e))),
                       ({reg151, reg164} ?
                           $unsigned(reg170) : reg166[(3'h5):(2'h3)])}) ^ wire143[(2'h3):(1'h1)]);
  assign wire182 = (((8'hb3) >> wire174[(1'h1):(1'h1)]) ~^ reg154);
  assign wire183 = $unsigned(($signed((reg151[(4'ha):(3'h6)] & $unsigned(reg166))) ?
                       $unsigned(((^reg152) > reg167)) : wire144[(3'h4):(3'h4)]));
  assign wire184 = (7'h42);
  assign wire185 = wire182[(3'h4):(2'h2)];
  assign wire186 = (~$unsigned(reg166));
  assign wire187 = wire181[(2'h3):(1'h1)];
  assign wire188 = ((~^reg165[(2'h2):(1'h0)]) ?
                       {$unsigned(wire179[(2'h2):(2'h2)])} : ((wire175[(1'h1):(1'h1)] < {$signed(reg171),
                               wire157[(1'h0):(1'h0)]}) ?
                           ((reg169 ?
                               (^~wire179) : reg153[(3'h4):(3'h4)]) > $signed(((8'haa) <= reg159))) : (+$signed(wire182))));
endmodule

module module91  (y, clk, wire95, wire94, wire93, wire92);
  output wire [(32'h1ef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire95;
  input wire signed [(5'h13):(1'h0)] wire94;
  input wire signed [(3'h4):(1'h0)] wire93;
  input wire [(3'h7):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire signed [(4'h8):(1'h0)] wire130;
  wire [(3'h4):(1'h0)] wire129;
  wire signed [(4'hc):(1'h0)] wire111;
  wire signed [(2'h3):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire104;
  wire signed [(3'h7):(1'h0)] wire103;
  wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire signed [(3'h7):(1'h0)] wire96;
  reg signed [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg [(5'h14):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire111,
                 wire110,
                 wire109,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
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
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire96 = (~&$unsigned((+wire95)));
  assign wire97 = $unsigned((wire93 ?
                      $signed($signed(wire94[(4'hc):(1'h0)])) : wire95[(1'h1):(1'h0)]));
  assign wire98 = (-wire92);
  assign wire99 = (wire94 ?
                      $signed({$unsigned($signed(wire95)),
                          $signed($signed(wire95))}) : $unsigned((^((~^wire97) << $signed(wire92)))));
  assign wire100 = $unsigned((($unsigned((~^wire99)) ?
                       ((7'h41) ?
                           (wire98 << wire98) : (wire96 ?
                               wire94 : wire93)) : ($signed(wire99) ?
                           (wire93 || wire97) : (-wire95))) <<< (wire93 != {{wire99,
                           (8'hb3)}})));
  assign wire101 = (|{{wire98[(1'h1):(1'h0)]}});
  assign wire102 = wire98;
  assign wire103 = $signed((({(wire102 * wire101)} ?
                       ((|wire97) ?
                           (wire100 != wire93) : wire97) : $unsigned({wire100})) << ({$unsigned((8'hb5))} ?
                       ($unsigned(wire94) >> (wire92 ?
                           wire100 : (8'h9e))) : $signed({wire95}))));
  assign wire104 = $signed($unsigned(({$unsigned(wire102),
                       $signed(wire99)} <<< (&$signed((8'ha6))))));
  assign wire105 = wire96;
  always
    @(posedge clk) begin
      if ((wire94 >= wire99))
        begin
          reg106 <= $signed(wire95[(2'h2):(2'h2)]);
        end
      else
        begin
          reg106 <= wire103[(2'h3):(2'h3)];
          reg107 <= ($signed((($unsigned((8'hbd)) != $unsigned(wire97)) - (|wire98))) != $unsigned({$unsigned(wire104[(1'h0):(1'h0)]),
              {wire103, (wire98 ? wire96 : wire98)}}));
        end
      reg108 <= $signed(((wire98[(2'h3):(2'h2)] ?
          $unsigned(reg106[(3'h4):(3'h4)]) : $unsigned(wire101[(2'h3):(2'h2)])) == {$unsigned($signed(wire101))}));
    end
  assign wire109 = wire96[(3'h6):(1'h0)];
  assign wire110 = (!(8'haa));
  assign wire111 = $signed((^~{wire99[(3'h4):(1'h1)],
                       $signed($signed(wire110))}));
  always
    @(posedge clk) begin
      if ($unsigned(wire111))
        begin
          reg112 <= wire99;
          reg113 <= $unsigned($unsigned($signed({wire95[(5'h11):(4'ha)]})));
          reg114 <= wire100;
          if ((wire98 ?
              $signed({(reg107[(3'h6):(3'h5)] + $unsigned(wire103))}) : (~($signed({(8'hba),
                      reg112}) ?
                  {(wire111 ? wire100 : reg108),
                      (wire105 < wire102)} : ((wire99 <= reg107) ?
                      (wire111 - wire105) : $unsigned(wire97))))))
            begin
              reg115 <= ((wire105 && (((wire103 ? wire92 : (8'hae)) ?
                  ((8'hbd) >= wire96) : (wire102 ?
                      wire99 : reg112)) << wire92)) && ($unsigned(($unsigned(wire110) ?
                  wire109 : $signed(wire110))) >> wire93));
              reg116 <= $unsigned(($unsigned({(wire98 ^~ wire110),
                  $unsigned(wire110)}) & (^wire110)));
              reg117 <= $signed(((7'h41) ^ ((+(!wire103)) ?
                  (~$signed(wire103)) : (&((8'hbb) ? reg116 : wire110)))));
              reg118 <= ((wire105[(3'h7):(2'h2)] ?
                      ({$unsigned(reg112), $signed(reg112)} ?
                          $unsigned((wire105 ?
                              reg106 : reg117)) : ((^wire98) >> wire96[(1'h1):(1'h1)])) : wire100) ?
                  reg112 : ($signed(($signed(wire102) >>> {wire94, (8'ha7)})) ?
                      (($signed(reg114) ?
                          (reg114 << wire92) : reg108) ^ $unsigned({reg117,
                          reg108})) : $unsigned(((^reg116) >> $unsigned(wire96)))));
              reg119 <= {$signed(reg108[(1'h0):(1'h0)])};
            end
          else
            begin
              reg115 <= wire103[(3'h4):(1'h0)];
              reg116 <= ((($signed((reg117 ^ wire99)) ^~ wire94) || $signed(wire96)) ?
                  ({($signed(wire96) <<< (wire97 ? wire94 : wire105)),
                          $signed($signed(reg112))} ?
                      wire98 : (reg113 ?
                          (!(!wire94)) : $unsigned(((8'hbd) ?
                              wire92 : (8'hb4))))) : ((&((wire96 + (8'ha3)) ?
                      ((8'hb9) ~^ (8'hb5)) : (wire111 + wire109))) < wire99[(2'h3):(1'h1)]));
            end
        end
      else
        begin
          if ($signed(reg106[(2'h2):(1'h1)]))
            begin
              reg112 <= $signed(wire100);
              reg113 <= (wire111 ?
                  wire104[(4'h8):(3'h5)] : reg107[(3'h5):(1'h1)]);
              reg114 <= (((reg115 >> (wire103[(3'h4):(1'h1)] - {wire105,
                  wire111})) | reg112[(5'h11):(1'h0)]) >>> $signed($signed(((~wire92) ~^ $signed(wire104)))));
              reg115 <= wire102[(3'h4):(3'h4)];
              reg116 <= ({$signed(($signed((8'ha5)) ?
                          $signed(reg116) : reg106)),
                      $unsigned(($signed(wire100) ^ $unsigned(wire101)))} ?
                  reg116[(4'he):(4'he)] : reg107[(1'h0):(1'h0)]);
            end
          else
            begin
              reg112 <= (8'hb9);
              reg113 <= wire98[(3'h6):(3'h4)];
              reg114 <= wire96;
              reg115 <= $unsigned(wire101[(3'h7):(3'h7)]);
              reg116 <= wire109;
            end
        end
      reg120 <= $unsigned((((((8'ha8) >>> (8'had)) ?
              $unsigned(wire110) : (|wire110)) ^ (-(~|(7'h41)))) ?
          (reg107[(2'h3):(1'h0)] | ((~reg116) * {wire96,
              wire98})) : reg113[(4'h9):(2'h2)]));
      reg121 <= $signed($signed(reg107[(3'h5):(1'h0)]));
      if ($unsigned((~&reg114[(1'h1):(1'h1)])))
        begin
          reg122 <= reg108[(1'h1):(1'h1)];
        end
      else
        begin
          if ({{$unsigned((reg121 == (wire98 ? wire100 : wire93))),
                  $signed((reg113[(4'h8):(3'h6)] <= (reg122 >>> reg106)))}})
            begin
              reg122 <= {(|$unsigned(($unsigned(reg122) <= (wire99 ?
                      reg118 : (8'haa))))),
                  ((7'h44) >> $unsigned((~|(wire92 ? wire100 : wire98))))};
            end
          else
            begin
              reg122 <= $signed((!(|(^~(wire109 >> wire93)))));
              reg123 <= $unsigned((reg113 ?
                  wire94[(4'ha):(4'h9)] : (&$signed($unsigned((8'ha0))))));
              reg124 <= (wire110[(1'h0):(1'h0)] ^ reg121);
              reg125 <= wire96[(3'h5):(3'h5)];
              reg126 <= $unsigned((+reg122[(4'h9):(3'h4)]));
            end
          reg127 <= $unsigned(reg113[(3'h7):(2'h2)]);
        end
      reg128 <= wire101[(1'h1):(1'h0)];
    end
  assign wire129 = (~&{($unsigned((wire94 ? wire92 : wire98)) ?
                           $unsigned($unsigned(reg106)) : ((!wire99) ?
                               $unsigned(wire105) : $signed(wire101))),
                       (wire92[(3'h4):(2'h3)] >> wire93)});
  assign wire130 = {reg125,
                       (((-reg120) ?
                               ((-reg112) <= reg127[(3'h7):(3'h7)]) : $signed(wire94[(3'h4):(1'h1)])) ?
                           $unsigned((~^$signed(reg125))) : reg112[(3'h5):(2'h2)])};
  assign wire131 = reg117[(4'h8):(3'h6)];
  assign wire132 = (wire129 ^ ((reg108[(2'h2):(2'h2)] << wire104) ?
                       (!wire130[(1'h0):(1'h0)]) : ($unsigned({wire97,
                               wire97}) ?
                           $unsigned(reg126[(4'hc):(4'h9)]) : {reg126[(2'h3):(2'h2)],
                               (wire101 ^~ reg128)})));
  always
    @(posedge clk) begin
      reg133 <= reg114;
      reg134 <= ($signed({(^~(&reg125)), wire111[(3'h6):(3'h6)]}) ?
          {$signed(reg117[(1'h0):(1'h0)])} : wire130);
    end
  always
    @(posedge clk) begin
      reg135 <= (~|{(((wire93 || reg108) & wire96) ?
              reg116[(4'he):(4'ha)] : ((reg119 ? wire99 : wire92) > ((8'hb9) ?
                  wire103 : wire111)))});
      reg136 <= $unsigned(($unsigned(((wire96 ? wire92 : reg118) ?
          $unsigned(wire104) : $unsigned((8'ha3)))) <= (reg120 || $unsigned((|(8'hb1))))));
      reg137 <= $signed($signed((((wire110 ^~ reg114) ?
              (&wire93) : wire105[(1'h0):(1'h0)]) ?
          $unsigned(reg118[(2'h3):(1'h0)]) : (+(7'h44)))));
      reg138 <= (($signed((wire131[(3'h4):(2'h2)] > (+reg134))) <<< $signed($unsigned(reg135[(4'hc):(4'hc)]))) <<< $signed($signed(($signed(reg134) | reg136[(3'h7):(2'h3)]))));
    end
  always
    @(posedge clk) begin
      reg139 <= $unsigned($unsigned({reg114[(1'h0):(1'h0)],
          ((wire131 | (8'ha7)) ? reg115 : $signed(wire132))}));
    end
endmodule

module module52  (y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire57;
  input wire [(5'h14):(1'h0)] wire56;
  input wire [(4'hd):(1'h0)] wire55;
  input wire signed [(5'h15):(1'h0)] wire54;
  input wire [(3'h4):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  assign y = {wire74,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
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
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire58 = $signed($signed((($signed(wire57) ?
                      wire53 : (+(8'hbe))) - {$unsigned(wire56),
                      (wire57 ? (8'hb5) : wire57)})));
  assign wire59 = wire54[(3'h6):(1'h0)];
  assign wire60 = $unsigned($unsigned({(-$signed(wire53)),
                      {wire58[(3'h5):(3'h4)], {wire56}}}));
  assign wire61 = (-wire59);
  assign wire62 = (((wire61 << {(wire54 ? (8'hb2) : wire55), (^~wire61)}) ?
                          (&(((8'ha7) >>> wire53) <= $unsigned(wire58))) : ({{wire56}} ^~ wire56)) ?
                      $signed((^~{((8'hba) >>> wire53),
                          (wire53 * (8'h9d))})) : wire60);
  assign wire63 = wire54[(5'h14):(1'h0)];
  assign wire64 = (wire60[(2'h3):(1'h1)] ?
                      $unsigned(wire55[(4'hb):(4'h9)]) : (~^$unsigned(wire56[(4'hc):(1'h1)])));
  assign wire65 = {wire54, {wire56, wire54}};
  always
    @(posedge clk) begin
      reg66 <= (($signed($signed($unsigned(wire58))) && $unsigned(wire63[(1'h1):(1'h0)])) != $signed(wire54[(5'h13):(4'ha)]));
      if (($unsigned({(wire57[(2'h2):(1'h1)] ?
                  (wire62 ? wire56 : wire63) : ((8'hb1) | (8'hb4))),
              $unsigned($unsigned(wire57))}) ?
          wire58 : wire56[(3'h4):(1'h0)]))
        begin
          reg67 <= $unsigned(($signed(wire59) ?
              (|(wire59 ?
                  (wire62 >> (7'h44)) : (wire55 - (8'hb9)))) : ({{wire64}} ?
                  wire64[(3'h4):(2'h2)] : wire58[(4'h8):(1'h1)])));
          if (((+$signed({$unsigned(wire53), {wire55, wire64}})) ?
              ((~&$unsigned($unsigned(wire62))) << $unsigned(wire53[(2'h3):(1'h0)])) : {$signed(((wire58 ^~ wire62) ?
                      (^(8'hb6)) : $signed(wire54)))}))
            begin
              reg68 <= {wire55};
              reg69 <= wire63;
              reg70 <= $signed((^~{((wire65 ? reg68 : (8'hba)) ?
                      (reg69 ? (7'h44) : wire61) : (wire65 ? wire65 : wire58)),
                  ((8'hbd) != $signed(wire62))}));
            end
          else
            begin
              reg68 <= (($unsigned($unsigned((wire62 ~^ reg69))) < {wire57[(2'h2):(1'h0)]}) || $signed(((8'hb8) | $signed($unsigned((8'ha4))))));
            end
          reg71 <= (wire57[(3'h5):(2'h2)] != $signed(((~^(wire54 ?
              (8'ha4) : reg68)) + $signed((wire57 ? wire64 : reg69)))));
          reg72 <= (!$unsigned(wire53));
          reg73 <= ($signed((&($unsigned(wire60) || wire54[(4'he):(1'h1)]))) || $unsigned(wire60[(4'ha):(3'h7)]));
        end
      else
        begin
          reg67 <= wire59;
          reg68 <= reg70;
          reg69 <= wire65;
          if (reg72)
            begin
              reg70 <= (-(8'ha1));
            end
          else
            begin
              reg70 <= {$signed((&(wire55 + (wire56 ^ wire61))))};
            end
        end
    end
  assign wire74 = $signed($signed(($unsigned(reg66[(1'h1):(1'h1)]) ?
                      (wire62 ?
                          {reg67,
                              (8'hb1)} : $signed(wire63)) : $signed((wire55 == wire55)))));
  always
    @(posedge clk) begin
      reg75 <= $signed($unsigned((8'ha6)));
      reg76 <= ($signed((8'ha2)) ?
          ($unsigned({(reg69 < wire63),
              (reg75 ? wire62 : reg73)}) - (^((wire57 ? wire65 : (8'ha4)) ?
              $unsigned(wire56) : (^~reg72)))) : $unsigned(($signed(wire57) ~^ reg72[(2'h3):(2'h2)])));
      reg77 <= ((8'hb6) ^ (8'hb2));
      if ((reg75 ?
          ($signed($signed($unsigned(reg66))) ?
              $unsigned(($unsigned(reg76) >>> reg72)) : $unsigned($signed(reg73))) : reg71[(4'ha):(3'h5)]))
        begin
          reg78 <= wire65;
          if ($signed((!wire55[(4'hc):(4'hb)])))
            begin
              reg79 <= wire59;
              reg80 <= {$signed(reg72)};
              reg81 <= (8'ha1);
              reg82 <= wire61[(1'h0):(1'h0)];
              reg83 <= $unsigned(((|((wire62 ? reg66 : reg69) ?
                  (8'ha4) : wire59)) >>> wire61[(1'h1):(1'h1)]));
            end
          else
            begin
              reg79 <= wire64;
              reg80 <= ((~|$signed({(^~(8'hba))})) ?
                  (8'ha2) : wire53[(2'h3):(2'h2)]);
              reg81 <= $unsigned((~reg70));
              reg82 <= wire60[(4'hb):(4'ha)];
              reg83 <= {($unsigned(wire65) * {((8'hb4) ?
                          ((8'hac) ? wire74 : wire64) : (|reg83))}),
                  wire60};
            end
          reg84 <= {(~(+{wire57[(2'h2):(1'h1)]})),
              $signed((wire55[(2'h3):(2'h2)] || ($unsigned(wire65) & (^wire57))))};
          if ((reg66 ~^ $unsigned(reg67[(2'h3):(1'h0)])))
            begin
              reg85 <= reg75;
            end
          else
            begin
              reg85 <= reg75[(2'h3):(1'h1)];
              reg86 <= $signed((($signed({reg77}) ?
                      ((wire59 < reg77) > (reg75 > (7'h40))) : ((-reg83) <<< {(7'h42),
                          reg69})) ?
                  $unsigned($signed(wire61)) : $signed($signed(wire63[(2'h2):(2'h2)]))));
              reg87 <= wire57[(3'h7):(3'h5)];
            end
        end
      else
        begin
          reg78 <= ($unsigned($signed(((reg70 >>> wire55) || (wire58 >= wire63)))) ?
              ({(!{reg71})} >>> (~($unsigned(wire63) && $signed(wire60)))) : (({$signed((8'ha9))} ?
                      reg75[(4'h8):(1'h0)] : (8'ha1)) ?
                  $signed((~|(~|reg82))) : (8'h9e)));
        end
    end
endmodule

module module27
#(parameter param41 = (~((|(((8'ha2) ^~ (8'ha4)) ? {(8'hb7)} : (^~(8'ha3)))) ? (~&(^~{(8'h9d), (8'hb9)})) : {{((7'h43) || (8'ha0)), (8'hac)}, {((8'hac) ^ (8'hb1))}})))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire31;
  input wire [(4'h9):(1'h0)] wire30;
  input wire signed [(4'h9):(1'h0)] wire29;
  input wire signed [(5'h15):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire34,
                 wire33,
                 wire32,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire32 = (wire30[(2'h2):(2'h2)] ?
                      (wire28[(1'h1):(1'h1)] ?
                          wire28 : (wire29 ?
                              (8'hba) : ($signed(wire29) ?
                                  (-(8'ha4)) : (!wire31)))) : wire31[(2'h3):(1'h0)]);
  assign wire33 = $signed((&($signed(wire30[(3'h6):(3'h5)]) ?
                      wire29 : ($signed((8'hbb)) >= wire31))));
  assign wire34 = (~^{((~&wire28) ^~ ((wire28 ? wire33 : wire31) > (wire32 ?
                          wire32 : wire29)))});
  always
    @(posedge clk) begin
      reg35 <= ((((|(+wire33)) ?
          wire29 : (^{(8'hb9),
              (7'h41)})) > wire32[(4'h9):(3'h5)]) == $unsigned(wire31));
      reg36 <= (8'hbd);
      reg37 <= $signed(($unsigned((-((8'hb6) ^ wire28))) ?
          wire31[(2'h2):(1'h0)] : wire34[(3'h4):(3'h4)]));
      reg38 <= (8'ha8);
    end
  assign wire39 = ($unsigned((~&wire31[(2'h3):(2'h3)])) + {$signed($signed((|wire31)))});
  assign wire40 = (((reg37[(5'h11):(4'hc)] ?
                          (~^$unsigned((7'h43))) : (|wire30)) >>> (8'ha7)) ?
                      wire33 : wire29);
endmodule
