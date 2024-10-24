module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire190;
  wire signed [(4'hf):(1'h0)] wire189;
  wire signed [(3'h6):(1'h0)] wire188;
  wire [(4'hd):(1'h0)] wire183;
  wire [(3'h4):(1'h0)] wire182;
  wire [(4'hf):(1'h0)] wire181;
  wire signed [(5'h12):(1'h0)] wire180;
  wire [(5'h10):(1'h0)] wire177;
  wire [(4'hd):(1'h0)] wire175;
  wire signed [(4'h9):(1'h0)] wire174;
  wire [(5'h14):(1'h0)] wire164;
  wire signed [(4'hc):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire157;
  reg [(4'hc):(1'h0)] reg187 = (1'h0);
  reg [(4'hd):(1'h0)] reg186 = (1'h0);
  reg [(3'h7):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg179 = (1'h0);
  reg [(2'h2):(1'h0)] reg178 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg161 = (1'h0);
  reg [(4'h8):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg163 = (1'h0);
  reg [(4'he):(1'h0)] reg165 = (1'h0);
  reg [(4'h8):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg172 = (1'h0);
  reg [(5'h11):(1'h0)] reg173 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire188,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire177,
                 wire175,
                 wire174,
                 wire164,
                 wire159,
                 wire5,
                 wire51,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire157,
                 reg187,
                 reg186,
                 reg185,
                 reg179,
                 reg178,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 (1'h0)};
  assign wire5 = wire4;
  module6 #() modinst52 (.clk(clk), .wire7(wire1), .wire9(wire0), .wire8(wire2), .wire10(wire4), .y(wire51));
  assign wire53 = (~|$signed($signed(wire5[(4'ha):(2'h3)])));
  assign wire54 = wire53[(5'h10):(5'h10)];
  assign wire55 = (^{$unsigned((wire1[(3'h7):(3'h4)] ?
                          wire54[(3'h5):(3'h4)] : $unsigned(wire5)))});
  assign wire56 = (!$unsigned(((wire4 ?
                      wire2[(1'h0):(1'h0)] : (wire51 ?
                          wire53 : wire51)) <<< (!$unsigned(wire54)))));
  module57 #() modinst158 (.wire61(wire4), .clk(clk), .wire59(wire56), .wire58(wire0), .wire62(wire55), .y(wire157), .wire60(wire51));
  assign wire159 = (|wire157[(4'hb):(1'h0)]);
  always
    @(posedge clk) begin
      if ((($unsigned(wire4[(4'h8):(3'h5)]) | wire51[(4'ha):(3'h4)]) ?
          (+$unsigned((wire0 << $signed(wire54)))) : ((~&$unsigned($signed(wire2))) ?
              $signed($unsigned((wire54 ?
                  wire51 : wire3))) : ($signed($unsigned(wire1)) ?
                  $signed({wire51, (8'hb3)}) : $signed((wire55 ?
                      (8'hae) : (8'hb3)))))))
        begin
          if (((8'hab) > {$signed($signed(wire3[(2'h3):(1'h0)]))}))
            begin
              reg160 <= wire5;
              reg161 <= $signed($unsigned(wire56[(3'h6):(2'h2)]));
            end
          else
            begin
              reg160 <= (+$signed(wire159[(3'h6):(3'h5)]));
              reg161 <= wire53;
            end
        end
      else
        begin
          reg160 <= $signed(wire5[(2'h3):(2'h2)]);
          reg161 <= (^(~|wire4[(1'h0):(1'h0)]));
          reg162 <= wire5;
        end
      reg163 <= (~|$unsigned($unsigned(wire53)));
    end
  assign wire164 = reg162[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      if (wire164)
        begin
          reg165 <= (($unsigned($unsigned((wire51 < reg162))) ?
                  (^~$unsigned(wire4)) : (($unsigned(wire56) >> $signed(reg161)) < wire55[(3'h6):(2'h3)])) ?
              reg163[(3'h6):(2'h2)] : wire159);
          reg166 <= $unsigned(({{(wire53 ? wire157 : wire3),
                  (~wire53)}} != $unsigned(wire55)));
          reg167 <= ((|{(-wire56)}) ? reg162 : reg163);
          reg168 <= (~|$unsigned($signed(wire51[(3'h7):(2'h2)])));
        end
      else
        begin
          if (reg161[(3'h5):(3'h5)])
            begin
              reg165 <= $signed({wire4});
            end
          else
            begin
              reg165 <= {(~^$unsigned(wire54))};
              reg166 <= ($signed($signed((^(!reg161)))) ^ (7'h41));
              reg167 <= reg162;
              reg168 <= $signed($unsigned((|$signed($signed(wire164)))));
              reg169 <= (~(wire2[(2'h2):(2'h2)] >>> {$unsigned($unsigned(wire2))}));
            end
          reg170 <= (+wire1[(4'hc):(3'h7)]);
          if ((($unsigned(((8'hb5) + (~|reg160))) ?
              $signed(reg161[(1'h0):(1'h0)]) : ((~&(wire53 ?
                      (8'hb9) : (8'hbf))) ?
                  ({reg169, reg160} ?
                      {reg163, reg163} : ((8'haf) ?
                          (8'ha5) : reg165)) : ($unsigned(wire5) >> (^~reg168)))) > ((!$signed(reg168[(3'h4):(3'h4)])) ?
              $unsigned(wire1[(3'h4):(1'h0)]) : $signed(wire159))))
            begin
              reg171 <= $unsigned($signed(wire53[(5'h15):(4'hc)]));
              reg172 <= {$unsigned(($signed($unsigned(reg168)) | $unsigned((reg161 <= reg163)))),
                  wire1};
              reg173 <= wire2[(2'h2):(1'h1)];
            end
          else
            begin
              reg171 <= wire5;
            end
        end
    end
  assign wire174 = (|(^~$signed(($signed(reg169) ?
                       $signed(wire164) : wire3[(2'h2):(1'h1)]))));
  module57 #() modinst176 (wire175, clk, reg168, reg163, reg167, wire4, wire0);
  assign wire177 = ((reg169 ^ $signed($signed($signed(reg166)))) ~^ (&(((~|reg169) ?
                           {reg167, (8'h9d)} : (reg163 ? wire4 : wire3)) ?
                       (wire164 && reg172[(5'h12):(4'hc)]) : ((reg168 ?
                               wire164 : reg171) ?
                           wire157 : wire56[(3'h5):(3'h4)]))));
  always
    @(posedge clk) begin
      reg178 <= ($unsigned(((!$unsigned(reg169)) ?
          ($signed(wire157) ?
              $unsigned(wire51) : $signed(wire0)) : ($unsigned(wire175) ?
              {reg170} : reg163[(4'ha):(3'h4)]))) ^~ wire175);
      reg179 <= ((($signed({reg162, wire54}) ?
                  (~^$unsigned(wire4)) : (^$unsigned(wire159))) ?
              (($signed(reg171) ? ((7'h40) ? wire51 : reg171) : reg162) ?
                  (((8'haf) ?
                      reg166 : reg163) == (reg165 | wire55)) : $unsigned(wire1[(4'hd):(4'h8)])) : $unsigned((wire164[(4'hc):(3'h5)] ?
                  $signed((8'hbb)) : (!wire159)))) ?
          wire51[(3'h4):(3'h4)] : $signed($signed($unsigned($signed(reg161)))));
    end
  assign wire180 = (wire53 ?
                       $unsigned($signed(wire2[(1'h1):(1'h1)])) : (-$unsigned((|(8'hbc)))));
  assign wire181 = reg160[(3'h7):(3'h5)];
  assign wire182 = {$signed(reg170[(3'h5):(2'h3)]),
                       (reg165 | (({wire55, reg178} ?
                           (~|reg168) : (^reg169)) != $signed(reg168)))};
  module6 #() modinst184 (wire183, clk, reg167, wire51, wire56, reg169);
  always
    @(posedge clk) begin
      reg185 <= $signed($unsigned(reg169[(5'h11):(4'h8)]));
      reg186 <= (7'h41);
      reg187 <= (8'hac);
    end
  assign wire188 = $signed((8'hab));
  assign wire189 = (wire53 && {$unsigned((wire164[(4'h9):(3'h6)] ?
                           (&wire175) : {wire182, wire3})),
                       (wire174[(1'h1):(1'h1)] * (((8'hbe) != wire164) ?
                           reg187 : (reg168 == reg168)))});
  assign wire190 = wire181[(2'h3):(1'h1)];
endmodule

module module57
#(parameter param155 = (7'h42), 
parameter param156 = {((&((7'h41) + (|param155))) ^~ {((7'h42) ? (param155 ? param155 : param155) : param155), {param155}})})
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire62;
  input wire [(3'h7):(1'h0)] wire61;
  input wire [(4'hc):(1'h0)] wire60;
  input wire signed [(4'h8):(1'h0)] wire59;
  input wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire154;
  wire [(3'h6):(1'h0)] wire153;
  wire signed [(4'hb):(1'h0)] wire152;
  wire [(5'h15):(1'h0)] wire151;
  wire [(4'hf):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire145;
  wire [(5'h14):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire143;
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg148 = (1'h0);
  reg [(4'ha):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire145,
                 wire86,
                 wire67,
                 wire66,
                 wire63,
                 wire88,
                 wire89,
                 wire90,
                 wire143,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire63 = $signed(wire59[(4'h8):(4'h8)]);
  always
    @(posedge clk) begin
      if (($unsigned($signed($signed($signed(wire58)))) <<< ($signed($signed(wire60)) ?
          {wire59[(3'h4):(2'h2)]} : ((wire62[(2'h3):(1'h0)] ?
              (wire61 ?
                  wire60 : wire62) : (wire61 != wire60)) == $unsigned($unsigned(wire61))))))
        begin
          reg64 <= wire58[(3'h5):(1'h1)];
          reg65 <= wire62[(4'hb):(4'ha)];
        end
      else
        begin
          reg64 <= reg65;
        end
    end
  assign wire66 = (8'ha2);
  assign wire67 = $unsigned(wire60);
  module68 #() modinst87 (.wire71(reg64), .wire73(wire63), .wire69(wire66), .y(wire86), .wire72(wire67), .clk(clk), .wire70(reg65));
  assign wire88 = $signed((-((-(wire63 ? (8'h9f) : (8'ha2))) ^~ {(wire66 ?
                          wire58 : wire63)})));
  assign wire89 = (wire88[(4'hf):(4'hb)] ?
                      ((((reg64 ? wire62 : wire86) - (wire62 & reg65)) ?
                              reg65[(3'h7):(1'h1)] : wire62[(3'h5):(1'h1)]) ?
                          $unsigned((8'hac)) : wire62) : wire88[(3'h5):(1'h0)]);
  assign wire90 = $signed((+(~(^$unsigned(wire86)))));
  module91 #() modinst144 (wire143, clk, wire61, wire63, wire66, wire62, wire88);
  assign wire145 = $unsigned($signed(wire86));
  always
    @(posedge clk) begin
      reg146 <= $unsigned((~&wire60[(4'h8):(2'h3)]));
      reg147 <= $unsigned(wire67[(2'h2):(2'h2)]);
      reg148 <= (((($signed(wire143) + wire61[(2'h2):(1'h0)]) ?
              $signed((~|wire66)) : wire90) * $signed($signed({wire66,
              (7'h44)}))) ?
          ((({reg65,
              wire61} ^~ (wire60 != wire62)) << $signed($unsigned(wire143))) || $unsigned(wire58[(3'h7):(3'h6)])) : $signed(wire61[(3'h7):(2'h3)]));
      reg149 <= $unsigned(wire63);
    end
  assign wire150 = (&$signed(reg146));
  assign wire151 = wire150[(3'h4):(3'h4)];
  assign wire152 = (+$unsigned((($unsigned(wire150) * (&wire90)) & wire66)));
  assign wire153 = (~^({(wire60[(4'h9):(4'h9)] ?
                               (^~wire58) : (wire58 ? (8'ha7) : wire60))} ?
                       $signed(wire63) : (($unsigned((8'hbf)) ^ wire151[(4'h8):(3'h6)]) ?
                           (^{wire143}) : (-$unsigned(wire152)))));
  assign wire154 = wire62[(4'hb):(3'h7)];
endmodule

module module6
#(parameter param50 = ((((+(~^(8'hb7))) ^~ ((~(8'ha2)) > (&(8'haf)))) ? (~(+((8'ha2) ? (8'ha9) : (7'h44)))) : {(8'ha1)}) ? (^(8'haf)) : ((-{((8'h9d) ? (8'hb0) : (8'hab)), ((8'h9d) ? (8'hab) : (7'h42))}) ? (&(-(8'hb7))) : ((~(7'h42)) >> (((8'ha0) ? (8'hbc) : (8'hba)) ? {(8'hb2)} : ((8'hba) ? (8'ha4) : (8'hba)))))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire43;
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire45,
                 wire11,
                 wire12,
                 wire13,
                 wire43,
                 reg46,
                 (1'h0)};
  assign wire11 = $signed(((~&(^((8'hbe) ?
                      wire10 : wire8))) && $unsigned({(wire8 ?
                          wire8 : (8'hb6))})));
  assign wire12 = {{(($signed(wire11) ^ (wire8 > wire9)) ?
                              (wire11 ?
                                  {wire10,
                                      wire8} : $signed(wire11)) : ((wire10 ^ wire10) ?
                                  $signed(wire7) : (7'h43))),
                          ((+wire11[(3'h7):(3'h5)]) ?
                              (+wire7) : ({wire9} ?
                                  (&wire9) : (wire11 ? wire8 : wire8)))},
                      ({(wire8[(2'h2):(2'h2)] ?
                              wire8[(1'h0):(1'h0)] : $signed(wire9)),
                          wire9[(4'h9):(2'h2)]} > wire7[(3'h4):(1'h0)])};
  assign wire13 = $signed($unsigned(wire8));
  module14 #() modinst44 (wire43, clk, wire12, wire10, wire9, wire7, wire13);
  assign wire45 = (wire8 && ({wire9[(4'h9):(3'h5)], wire12} ^~ {((wire11 ?
                              wire12 : wire43) ?
                          ((8'hb4) >>> wire9) : wire9[(1'h1):(1'h1)]),
                      wire10}));
  always
    @(posedge clk) begin
      reg46 <= wire43;
    end
  assign wire47 = $unsigned(((~^wire10[(4'hb):(1'h1)]) ?
                      ({{wire12, wire13},
                          (wire7 + reg46)} <<< $signed((wire10 || wire10))) : ((!(wire11 ?
                          wire10 : (8'ha4))) ^~ ((wire10 >>> (8'hb6)) < (wire11 + (8'ha2))))));
  assign wire48 = $unsigned(($signed(wire43[(4'he):(2'h2)]) ?
                      ({$signed(wire11),
                          wire9[(3'h6):(2'h2)]} ~^ (&(~wire11))) : $unsigned((-wire9))));
  assign wire49 = (($unsigned($signed({wire7})) ?
                      (~wire45) : wire45) == (~|wire8));
endmodule

module module14
#(parameter param41 = {(^~((^((8'ha0) ? (7'h41) : (7'h43))) ? ((~(8'ha5)) ? (|(7'h44)) : ((7'h43) ^~ (8'ha7))) : (((8'ha2) ? (8'hbd) : (7'h42)) - (&(8'had))))), ((|(8'hb6)) ? (~{((8'hbf) ? (8'h9c) : (7'h43)), ((8'ha7) - (8'hb6))}) : ((~^(8'hae)) || ((|(8'hba)) >>> (~&(8'hbd)))))}, 
parameter param42 = ((((8'h9c) >= (~(~(7'h43)))) * param41) >= ((((~^param41) ? ((8'ha7) ? param41 : param41) : param41) * (&(param41 ? (8'ha7) : param41))) > (8'hb0))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire19;
  input wire signed [(4'h9):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg21,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg20 <= (+$signed((~^($unsigned((8'ha2)) ?
          (wire16 - wire17) : $signed(wire18)))));
    end
  always
    @(posedge clk) begin
      reg21 <= (reg20[(2'h3):(1'h1)] ^ {wire19[(1'h0):(1'h0)],
          $unsigned(reg20)});
    end
  assign wire22 = $signed(((^(+(8'ha2))) ?
                      $unsigned((|(wire19 <<< wire18))) : $unsigned($unsigned(((8'h9e) | reg20)))));
  assign wire23 = (~({wire18[(1'h1):(1'h0)],
                      wire17[(3'h4):(3'h4)]} >>> (^$unsigned(((8'hb9) ?
                      wire16 : wire16)))));
  assign wire24 = ({{wire22[(4'hb):(1'h1)]}} ?
                      $signed((~((reg21 ?
                          wire19 : reg21) != wire22[(3'h5):(1'h1)]))) : reg21);
  assign wire25 = wire23[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg26 <= (^(({(wire16 ? wire18 : wire24),
              (wire24 ? reg20 : wire22)} | {{wire19}, {reg21, wire18}}) ?
          (((&wire16) ?
              (reg21 ? wire23 : wire16) : $signed(wire19)) << (~&(wire23 ?
              reg21 : wire16))) : ({(8'ha5)} ?
              (|(-wire22)) : $signed($signed((7'h40))))));
      if (wire16[(1'h0):(1'h0)])
        begin
          reg27 <= (|$unsigned((((reg21 ? wire25 : wire25) < (wire25 ?
                  wire16 : wire16)) ?
              reg20[(1'h0):(1'h0)] : {(wire25 && wire24)})));
          reg28 <= (~^reg21[(1'h0):(1'h0)]);
        end
      else
        begin
          reg27 <= reg21[(2'h2):(2'h2)];
          reg28 <= (-{(reg27[(4'he):(4'h9)] || (8'hab))});
          reg29 <= (8'haf);
          if ($unsigned((((^~(reg20 >>> wire18)) <<< reg21[(1'h1):(1'h0)]) << (~|$unsigned((^~reg21))))))
            begin
              reg30 <= wire16;
            end
          else
            begin
              reg30 <= {($signed(reg27) ?
                      {$signed($unsigned(wire17))} : {wire15})};
              reg31 <= wire25[(5'h12):(4'hb)];
              reg32 <= (~|(+{(~^$signed(wire16)),
                  ($unsigned(wire17) + (wire23 >>> reg21))}));
            end
          if ($unsigned(($unsigned((8'hba)) ? wire15 : (8'had))))
            begin
              reg33 <= (reg31[(1'h0):(1'h0)] != ((~^(~|(~^reg32))) != {(reg28 * $unsigned(reg20)),
                  (^(wire25 ~^ wire15))}));
              reg34 <= reg32;
            end
          else
            begin
              reg33 <= $signed($unsigned($unsigned($unsigned((wire24 ?
                  wire25 : reg32)))));
              reg34 <= reg30;
            end
        end
      reg35 <= (!reg32[(3'h4):(2'h3)]);
      reg36 <= $unsigned(($signed($signed((reg31 ?
          reg28 : reg32))) == reg28[(3'h6):(3'h4)]));
      reg37 <= (wire25[(3'h5):(3'h5)] >>> ($signed($signed((reg34 ?
              reg34 : (8'hb4)))) ?
          $unsigned($unsigned((|reg27))) : $unsigned((~^$unsigned(reg30)))));
    end
  assign wire38 = (~|reg31[(1'h0):(1'h0)]);
  assign wire39 = wire23;
  assign wire40 = ($signed(reg28) ?
                      wire17 : (~$unsigned((((8'ha3) ?
                          reg30 : wire24) == ((8'ha8) ? reg30 : reg35)))));
endmodule

module module91
#(parameter param141 = (+{{(((8'h9d) ? (8'hb8) : (8'ha7)) * (|(8'hbf)))}, {{(!(8'hac))}, ((8'hac) | ((8'ha2) ? (8'ha8) : (8'ha7)))}}), 
parameter param142 = (param141 ? param141 : (-(((^param141) <= (~param141)) >= ((&param141) ? param141 : (param141 ^ (8'h9d)))))))
(y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'h1cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire96;
  input wire signed [(3'h7):(1'h0)] wire95;
  input wire [(4'hb):(1'h0)] wire94;
  input wire signed [(5'h11):(1'h0)] wire93;
  input wire [(4'hb):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire113;
  wire signed [(4'hb):(1'h0)] wire112;
  wire [(3'h5):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire109;
  wire signed [(4'h9):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire104;
  wire [(3'h4):(1'h0)] wire103;
  wire [(4'hb):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire97;
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(5'h10):(1'h0)] reg131 = (1'h0);
  reg [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
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
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire97 = wire96[(3'h4):(2'h3)];
  assign wire98 = (-(~|(wire93[(4'hc):(1'h1)] ^~ $signed(wire93[(3'h4):(1'h1)]))));
  assign wire99 = ({$unsigned(((~&wire97) ? wire92 : $signed(wire96))),
                          (8'hbf)} ?
                      wire94 : ($signed($unsigned((wire96 & (8'hbe)))) ?
                          $signed({(!(8'hbb)),
                              (wire94 ~^ (8'h9d))}) : (({wire98, wire93} ?
                                  (^wire94) : wire97[(4'hd):(2'h3)]) ?
                              ((+wire98) ?
                                  (8'ha9) : (wire97 >>> wire96)) : $unsigned($unsigned((8'ha7))))));
  assign wire100 = (($signed($signed((wire93 ? wire97 : wire93))) ?
                       ({(wire97 << wire99)} != (~|(wire92 ?
                           wire97 : wire92))) : wire92) ^ wire95);
  assign wire101 = (8'hb5);
  assign wire102 = wire100;
  assign wire103 = wire95[(2'h2):(2'h2)];
  assign wire104 = $signed(wire98[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg105 <= wire95[(1'h0):(1'h0)];
      reg106 <= {wire93};
      reg107 <= (8'haf);
    end
  assign wire108 = {(wire101[(3'h4):(1'h1)] | {({(8'hac)} == $signed((8'hb0)))}),
                       $signed(reg105[(3'h4):(1'h1)])};
  assign wire109 = ((~^wire94) ?
                       {($unsigned((reg107 == reg107)) ?
                               {$signed(wire102)} : ($signed(wire104) >= reg106[(4'he):(3'h6)]))} : $unsigned({((-wire92) > wire104[(3'h5):(3'h5)])}));
  assign wire110 = (^~$signed((wire101[(1'h1):(1'h0)] ?
                       ($unsigned(wire94) ^~ $signed(wire95)) : {$signed(wire109)})));
  assign wire111 = ((-$signed(((wire104 ? (8'hb2) : wire108) ?
                           $signed(wire97) : $signed(wire97)))) ?
                       $unsigned(wire102) : $signed($signed((~$unsigned(wire102)))));
  assign wire112 = ((~^$signed(wire97)) + reg107[(1'h1):(1'h1)]);
  assign wire113 = (wire94[(3'h5):(3'h5)] << (((wire102[(3'h4):(2'h2)] ?
                           $unsigned(wire100) : (wire102 >= wire104)) ?
                       {wire101} : (wire97[(1'h0):(1'h0)] ^~ wire109[(4'ha):(1'h1)])) & reg107));
  always
    @(posedge clk) begin
      reg114 <= {$unsigned($signed(((wire96 >>> wire93) >= {wire104})))};
      reg115 <= ({(((reg107 || wire102) - $unsigned(wire101)) ?
                  $unsigned((wire108 ? reg106 : wire104)) : $signed((wire96 ?
                      wire111 : wire99))),
              $unsigned((~wire96))} ?
          $signed(reg114) : reg106);
      if ((~|wire93[(3'h4):(1'h1)]))
        begin
          reg116 <= $signed((&wire108));
          if ($unsigned(wire112))
            begin
              reg117 <= ((^~wire95) ^~ $signed(((^~wire109) ?
                  (wire94[(2'h2):(1'h1)] ?
                      $unsigned(wire95) : $signed(wire103)) : (^~wire100[(3'h7):(3'h4)]))));
              reg118 <= reg114;
            end
          else
            begin
              reg117 <= reg105[(4'he):(3'h7)];
              reg118 <= (&(wire108[(1'h0):(1'h0)] <<< $unsigned(((wire104 + reg116) << (reg106 >> wire103)))));
              reg119 <= ($unsigned((wire104[(1'h1):(1'h1)] << ((wire108 ^~ reg118) ^ (+(8'ha2))))) ?
                  (8'hbf) : (~wire99));
              reg120 <= $unsigned(($signed(reg114[(2'h3):(2'h2)]) ?
                  wire95 : (~|{reg115[(3'h4):(1'h0)]})));
              reg121 <= ($unsigned(wire108[(3'h7):(3'h4)]) >= $signed($signed(wire101[(3'h4):(1'h0)])));
            end
          reg122 <= ($signed(((~|wire102[(2'h2):(2'h2)]) ?
                  $signed($signed(wire93)) : $unsigned((~^(8'ha1))))) ?
              (^reg116) : {(($signed(wire93) ^ (reg117 && wire110)) ?
                      ($unsigned(wire111) - (wire95 ?
                          (7'h44) : wire104)) : ((8'had) ?
                          {(8'hb2), (8'hba)} : {reg119})),
                  (((reg118 ? wire97 : reg121) < (^wire108)) ?
                      $unsigned({reg106, wire113}) : wire109[(4'ha):(2'h3)])});
          if ($unsigned(((wire95[(3'h6):(3'h4)] == $unsigned((wire108 ^ wire102))) ?
              (((~|reg117) == reg121[(1'h0):(1'h0)]) <<< wire99) : (~|((^(8'hb8)) ?
                  $unsigned(reg115) : (reg117 < reg106))))))
            begin
              reg123 <= (reg122[(1'h0):(1'h0)] ?
                  (^~(((reg120 ? reg115 : reg114) ?
                          (wire98 ? (7'h43) : wire104) : (wire113 ?
                              wire100 : wire102)) ?
                      reg105 : (|wire98[(1'h1):(1'h0)]))) : (&(~^wire98)));
              reg124 <= (($unsigned($unsigned((reg116 ~^ wire104))) != (wire109 - $unsigned(wire112))) ?
                  $unsigned(($signed(wire109) >>> $unsigned((+reg115)))) : (~&(($unsigned(reg105) ?
                      (reg117 != wire112) : (wire94 ?
                          reg105 : wire96)) * reg123)));
              reg125 <= wire110[(3'h5):(3'h4)];
              reg126 <= wire94[(4'ha):(4'h8)];
            end
          else
            begin
              reg123 <= $unsigned((wire96[(3'h6):(1'h1)] ?
                  {$unsigned(wire101[(3'h4):(3'h4)]),
                      $unsigned($unsigned(reg118))} : ($signed(wire92) <= ({wire100} ?
                      wire108[(2'h3):(1'h1)] : reg124[(3'h4):(2'h2)]))));
              reg124 <= $unsigned((wire101[(3'h6):(1'h1)] ^~ reg122[(2'h3):(1'h1)]));
              reg125 <= reg117[(3'h6):(1'h1)];
            end
          reg127 <= (wire112[(1'h1):(1'h1)] ?
              $signed(reg120[(3'h5):(1'h1)]) : wire109[(4'h9):(1'h1)]);
        end
      else
        begin
          reg116 <= reg127;
        end
      if ({$signed((!$unsigned({wire103, reg126}))),
          $unsigned($signed(wire110))})
        begin
          if ($signed(($unsigned(reg119) != wire102[(4'ha):(3'h7)])))
            begin
              reg128 <= (wire102 ?
                  (8'ha1) : (reg115[(1'h1):(1'h0)] ?
                      $unsigned(($unsigned(reg114) ?
                          (-(8'h9c)) : {reg117, wire96})) : $unsigned({(wire95 ?
                              wire95 : (8'hbc))})));
              reg129 <= (wire96 ?
                  $signed((^((~&wire92) ?
                      (!reg117) : (wire100 ^ wire110)))) : wire104);
              reg130 <= wire92;
              reg131 <= (~^(($unsigned(((8'hab) - reg105)) <<< $unsigned($signed(reg120))) ?
                  $unsigned($signed(wire95[(3'h4):(2'h2)])) : (wire113 ?
                      $signed($unsigned(reg122)) : ((reg130 << reg117) & (wire104 ?
                          (7'h42) : reg122)))));
            end
          else
            begin
              reg128 <= ((^wire93[(4'h9):(3'h5)]) > $signed($signed((~(^~reg125)))));
              reg129 <= (({(~|(~wire110)), (&wire113[(4'ha):(4'ha)])} ?
                  (wire112 >= ((7'h43) ~^ (reg129 ?
                      reg123 : (7'h40)))) : $signed((reg121[(4'hd):(3'h6)] | $unsigned(reg105)))) | $unsigned(({wire113} + reg127)));
              reg130 <= $unsigned($unsigned((((reg120 & reg122) ?
                      $unsigned(reg123) : {wire98, wire96}) ?
                  ($signed(reg128) || $signed(wire112)) : ((~^(7'h41)) ?
                      (reg115 ? reg123 : wire104) : (wire101 ?
                          wire103 : reg117)))));
              reg131 <= (wire94[(1'h0):(1'h0)] && $signed((!reg128)));
              reg132 <= (^~$unsigned((~{$signed(reg107), {reg127}})));
            end
        end
      else
        begin
          reg128 <= wire102;
          if ((7'h41))
            begin
              reg129 <= (|(wire110 * (+reg120[(3'h5):(2'h3)])));
              reg130 <= ((~&{reg125,
                  (^~{wire113})}) != $unsigned((((reg119 == wire100) < (^~wire103)) ?
                  (-(wire98 ? reg119 : wire100)) : reg114[(2'h2):(1'h0)])));
              reg131 <= reg124[(1'h0):(1'h0)];
              reg132 <= $signed($unsigned($signed(($signed(reg105) | wire109[(2'h3):(2'h3)]))));
              reg133 <= $signed(($unsigned((~&$unsigned(reg106))) >= ($signed((^~(8'ha4))) && ($signed(wire94) - wire100))));
            end
          else
            begin
              reg129 <= $signed((($signed(wire101[(4'h8):(2'h2)]) <= (!(reg129 ?
                  wire109 : wire98))) | reg121[(4'ha):(2'h3)]));
            end
          if ((($signed(reg107[(1'h1):(1'h0)]) ?
              $signed($unsigned((~&(8'hb0)))) : $unsigned((reg106[(4'hd):(2'h3)] ~^ (wire109 ?
                  reg123 : wire113)))) >= reg131))
            begin
              reg134 <= $signed($signed($unsigned((8'ha1))));
              reg135 <= (($signed($signed($unsigned(reg121))) ?
                  $signed((+wire111)) : ((wire94 == ((8'haf) - (8'hb5))) | (wire95 ?
                      (8'hb9) : $unsigned(reg121)))) + reg131[(1'h1):(1'h0)]);
            end
          else
            begin
              reg134 <= $unsigned($unsigned($signed(wire109)));
              reg135 <= wire110[(3'h7):(3'h5)];
              reg136 <= ($signed($signed(((reg116 ? reg120 : wire111) ?
                      wire94[(4'ha):(3'h6)] : (wire97 <= reg120)))) ?
                  ((~|$unsigned({wire111})) ?
                      (~&($signed(reg127) ?
                          {(8'h9c),
                              wire102} : wire103)) : reg125[(3'h6):(2'h2)]) : (($unsigned({(8'hb4),
                          wire96}) << (^~(wire101 << reg118))) ?
                      (~|((reg115 >>> reg119) + $unsigned(wire101))) : (!(wire104[(1'h1):(1'h1)] ?
                          wire92 : reg105))));
              reg137 <= wire111[(1'h1):(1'h1)];
              reg138 <= (reg126[(2'h3):(1'h0)] ?
                  $unsigned((&$signed(reg120))) : ({wire104[(1'h1):(1'h1)],
                          ($signed(reg107) ?
                              wire110[(4'h8):(1'h1)] : (~&wire110))} ?
                      ((&(^reg117)) ?
                          reg123[(2'h2):(1'h0)] : ((|reg128) ?
                              (reg123 ?
                                  (8'hb1) : wire99) : (&wire109))) : $signed(reg136)));
            end
          reg139 <= reg128;
        end
      reg140 <= reg128;
    end
endmodule

module module68
#(parameter param84 = {(({(~(8'hb4)), ((8'hb3) >> (8'ha9))} ? ((8'ha6) ? ((8'h9c) << (8'haa)) : (8'hb9)) : (((8'hbf) & (8'hbb)) ^~ (8'ha0))) <= {(~|(8'hab)), (-((8'hb7) >>> (7'h43)))})}, 
parameter param85 = ({param84} ? {param84, (+{(param84 ? param84 : (8'hb6)), (param84 ? param84 : param84)})} : (&(~param84))))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire73;
  input wire signed [(4'h8):(1'h0)] wire72;
  input wire [(4'hf):(1'h0)] wire71;
  input wire signed [(2'h3):(1'h0)] wire70;
  input wire signed [(4'he):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire [(4'hb):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire74;
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  assign y = {wire83,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg82,
                 (1'h0)};
  assign wire74 = $signed($unsigned(wire71));
  assign wire75 = ($unsigned((-((wire73 ~^ wire71) ?
                          (8'hb8) : (wire70 ? wire74 : (8'ha2))))) ?
                      wire73 : {wire72,
                          $signed(({wire70} ?
                              (wire72 ?
                                  wire69 : wire71) : wire69[(2'h3):(1'h1)]))});
  assign wire76 = $unsigned((|wire69[(1'h1):(1'h1)]));
  assign wire77 = wire75;
  assign wire78 = $signed(($signed($signed((&wire72))) - (7'h44)));
  assign wire79 = ($signed(wire71) >>> (-(8'hac)));
  assign wire80 = ($unsigned($signed($unsigned((wire69 ?
                      wire78 : wire74)))) || (8'ha6));
  assign wire81 = wire78[(4'ha):(3'h6)];
  always
    @(posedge clk) begin
      reg82 <= wire77[(4'hd):(4'hb)];
    end
  assign wire83 = $signed((|wire78[(4'h8):(4'h8)]));
endmodule
