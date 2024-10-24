module top
#(parameter param219 = (~(|(~|({(8'hab), (8'ha8)} ^ {(8'ha5), (8'ha7)})))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire218;
  wire [(4'he):(1'h0)] wire217;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire207;
  reg [(3'h5):(1'h0)] reg216 = (1'h0);
  reg [(4'h8):(1'h0)] reg215 = (1'h0);
  reg [(5'h14):(1'h0)] reg214 = (1'h0);
  reg [(5'h12):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg212 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg211 = (1'h0);
  reg [(3'h6):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg209 = (1'h0);
  assign y = {wire218,
                 wire217,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire207,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 (1'h0)};
  assign wire5 = (~&(((wire0[(4'h9):(4'h8)] >> $signed(wire3)) ?
                     wire2[(4'ha):(4'ha)] : wire2) || wire1[(4'hd):(4'hd)]));
  assign wire6 = ($signed((((!wire2) ? wire5 : $signed(wire3)) ?
                         (~^(wire1 + wire4)) : $unsigned((~&(8'hb3))))) ?
                     wire0 : ((~^$unsigned(wire1[(4'hd):(2'h3)])) << (~^(-wire4))));
  assign wire7 = $unsigned(wire6);
  assign wire8 = (wire5[(1'h0):(1'h0)] ?
                     wire6[(3'h7):(3'h7)] : $unsigned(wire2[(3'h5):(3'h5)]));
  assign wire9 = (~|(~&(~|wire1[(2'h3):(2'h2)])));
  assign wire10 = ($unsigned(((wire7[(1'h1):(1'h1)] ?
                      $unsigned(wire0) : $unsigned(wire6)) < {{wire1,
                          wire5}})) >> (~^{(~|(wire4 ? wire1 : wire9))}));
  assign wire11 = wire7[(2'h3):(2'h2)];
  assign wire12 = (((-((wire0 ~^ (8'hb6)) ?
                              $unsigned(wire1) : wire1[(2'h3):(2'h3)])) ?
                          wire2 : $signed((&wire8))) ?
                      (^~$signed(wire6)) : (($signed(wire4[(3'h4):(1'h1)]) ?
                              wire5 : wire1[(1'h0):(1'h0)]) ?
                          wire9[(1'h1):(1'h1)] : ($unsigned({wire11, wire6}) ?
                              wire5[(1'h1):(1'h0)] : $signed((8'ha0)))));
  assign wire13 = ((($unsigned($unsigned(wire8)) ?
                          wire7[(2'h2):(2'h2)] : $unsigned($signed(wire11))) ^~ $signed(wire8)) ?
                      (((|wire10) ?
                          wire11 : $unsigned(wire0[(2'h3):(1'h1)])) || $signed($unsigned((-wire1)))) : ((((-wire2) << $signed(wire9)) >= (~^$unsigned(wire2))) <<< (wire1[(4'ha):(4'ha)] ?
                          $unsigned($unsigned((8'hb5))) : $unsigned(wire0))));
  assign wire14 = ($unsigned($signed(wire7[(1'h1):(1'h1)])) ?
                      $signed($signed(wire12[(3'h6):(3'h4)])) : {wire3,
                          (-((wire9 << wire13) - (~&(8'ha3))))});
  assign wire15 = wire10;
  module16 #() modinst208 (.wire17(wire10), .wire20(wire1), .wire19(wire4), .wire18(wire2), .wire21(wire13), .clk(clk), .y(wire207));
  always
    @(posedge clk) begin
      reg209 <= (wire10[(1'h1):(1'h0)] >>> wire5[(1'h1):(1'h0)]);
      if ($signed({wire14, (|wire15)}))
        begin
          if (((((8'ha1) ?
              wire13 : ($unsigned(wire8) ^ (wire14 ?
                  wire9 : wire14))) <= (wire15[(5'h10):(3'h6)] & {wire5,
              (7'h43)})) > $unsigned(($signed(wire9[(2'h2):(2'h2)]) ~^ ((wire1 && wire10) ?
              (wire10 ^~ wire14) : (wire4 ? (7'h44) : wire7))))))
            begin
              reg210 <= (^$unsigned(wire9));
              reg211 <= reg209;
              reg212 <= (({wire0[(1'h0):(1'h0)], (~|reg210)} ?
                      wire4 : wire207) ?
                  $signed(($unsigned(wire14[(4'h9):(2'h3)]) ?
                      reg211 : (~^(wire1 ? wire6 : wire3)))) : reg210);
              reg213 <= (~^$signed(wire7[(1'h0):(1'h0)]));
            end
          else
            begin
              reg210 <= reg209[(3'h7):(3'h6)];
            end
          reg214 <= (^~(+wire11));
          reg215 <= (~^$unsigned(wire14));
        end
      else
        begin
          reg210 <= reg209;
        end
      reg216 <= ((($signed((reg210 & wire14)) ~^ $signed((wire11 >> reg213))) ?
              (8'h9c) : $unsigned($unsigned(reg209[(3'h7):(2'h2)]))) ?
          (+((wire11[(3'h6):(2'h3)] ?
              {wire12} : (~&wire7)) >= $unsigned((reg213 ?
              wire207 : wire11)))) : wire2);
    end
  assign wire217 = (^~{(($signed(wire207) >> {reg216}) - ($unsigned((7'h41)) ?
                           (|wire10) : $signed(wire5))),
                       (wire9 + $signed($signed(wire10)))});
  assign wire218 = $signed($unsigned(wire12));
endmodule

module module16
#(parameter param205 = (&({((8'hb0) | {(8'hb6)})} ^~ ((((8'hbd) ? (8'hb1) : (7'h42)) * ((8'ha3) ? (7'h43) : (8'ha1))) & {(|(8'haa))}))), 
parameter param206 = (~|param205))
(y, clk, wire17, wire18, wire19, wire20, wire21);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire199;
  wire signed [(5'h12):(1'h0)] wire138;
  wire signed [(5'h13):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire135;
  wire signed [(3'h7):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire52;
  reg [(2'h3):(1'h0)] reg204 = (1'h0);
  reg [(4'hd):(1'h0)] reg203 = (1'h0);
  reg [(4'hf):(1'h0)] reg202 = (1'h0);
  reg [(4'he):(1'h0)] reg201 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg142 = (1'h0);
  reg [(4'h8):(1'h0)] reg143 = (1'h0);
  reg [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg147 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(4'h9):(1'h0)] reg153 = (1'h0);
  assign y = {wire199,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire133,
                 wire54,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire52,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg26,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 (1'h0)};
  assign wire22 = (wire21[(3'h5):(1'h1)] ?
                      $unsigned((({wire18} < wire21[(1'h0):(1'h0)]) ?
                          $signed(wire21[(2'h3):(2'h2)]) : wire17)) : $signed((wire21 ^~ (8'hb0))));
  assign wire23 = wire18;
  assign wire24 = $signed(wire19[(2'h3):(2'h2)]);
  assign wire25 = ($signed(wire21[(3'h7):(2'h2)]) ?
                      ($unsigned(((^~wire24) || ((8'hbb) < wire24))) ?
                          ((|(8'ha1)) << ($signed(wire22) ?
                              (wire18 ?
                                  (8'hb3) : wire24) : wire20[(4'hd):(4'hc)])) : {wire22,
                              $unsigned((~&(8'h9c)))}) : ($signed($unsigned((wire18 * (8'hb2)))) ?
                          {(wire24[(1'h1):(1'h0)] ? wire21 : {wire24, wire24}),
                              (wire21[(3'h4):(1'h0)] ?
                                  wire17[(1'h1):(1'h1)] : (wire20 > wire24))} : (((+wire17) ?
                                  $unsigned(wire19) : wire22[(4'he):(3'h5)]) ?
                              (wire21 & $unsigned(wire17)) : $signed({(8'ha6),
                                  wire23}))));
  always
    @(posedge clk) begin
      reg26 <= (wire20[(3'h4):(1'h0)] + wire18);
    end
  module27 #() modinst53 (.clk(clk), .wire32(wire21), .wire29(wire23), .wire28(wire24), .wire31(wire19), .wire30(wire22), .y(wire52));
  assign wire54 = $signed(({wire25} - $signed($unsigned($unsigned((8'had))))));
  module55 #() modinst134 (wire133, clk, wire21, reg26, wire23, wire22, wire54);
  assign wire135 = reg26;
  assign wire136 = $signed(wire54);
  assign wire137 = ($unsigned((wire136 ?
                           $signed(wire18[(3'h5):(3'h4)]) : (wire25 ?
                               (!wire25) : $unsigned(wire18)))) ?
                       $unsigned($signed($signed((wire21 != wire22)))) : (&$signed((reg26 ?
                           {wire23} : $unsigned((7'h41))))));
  assign wire138 = $unsigned(wire23);
  always
    @(posedge clk) begin
      if ($unsigned((wire19 ? (^~wire137[(3'h4):(2'h2)]) : $unsigned((8'hb6)))))
        begin
          if ($unsigned(wire21))
            begin
              reg139 <= $signed($signed(((^~$signed(wire54)) > $signed(wire135))));
              reg140 <= $unsigned((-(|{(&wire137), $signed(wire19)})));
              reg141 <= (~|wire18);
              reg142 <= wire135;
            end
          else
            begin
              reg139 <= wire19;
              reg140 <= wire22;
            end
          if ((8'hb6))
            begin
              reg143 <= ((wire17[(1'h0):(1'h0)] >= (~&(wire20 ?
                      wire22 : (wire138 | (8'hbc))))) ?
                  (((|{wire133}) + wire136) == (!$signed((reg26 ?
                      wire136 : wire24)))) : reg140);
              reg144 <= {$unsigned(wire17),
                  (!(((reg143 < reg142) | wire52[(2'h2):(1'h0)]) ^ ($signed(wire23) ?
                      $signed((8'hb6)) : {wire18})))};
              reg145 <= (|reg144[(2'h2):(1'h0)]);
            end
          else
            begin
              reg143 <= (~|$signed($unsigned(((wire20 ? reg145 : reg141) ?
                  (reg140 ? reg139 : reg142) : ((8'hbd) ? reg139 : wire25)))));
              reg144 <= (8'hb3);
              reg145 <= wire137[(2'h2):(1'h0)];
              reg146 <= wire133;
              reg147 <= {{$unsigned({$signed((8'haf)), (!wire24)})},
                  (~{(-$unsigned(wire138))})};
            end
          reg148 <= reg144[(2'h2):(1'h0)];
          reg149 <= (reg140 ?
              $signed((-(8'ha9))) : (|$unsigned(($unsigned(wire135) + reg140[(3'h7):(1'h0)]))));
          if (reg146)
            begin
              reg150 <= reg26[(3'h7):(3'h6)];
              reg151 <= wire54[(4'hc):(4'hc)];
            end
          else
            begin
              reg150 <= $signed($unsigned((-$unsigned($signed(reg151)))));
              reg151 <= $signed({(($signed(reg143) || (|reg143)) - wire19[(3'h7):(1'h1)]),
                  ($unsigned(wire20) ?
                      wire20[(4'hd):(4'h9)] : wire25[(1'h1):(1'h1)])});
              reg152 <= {reg140,
                  (((~^reg149) ?
                      (^(wire20 ? wire52 : wire21)) : ((wire138 < reg150) ?
                          $signed(reg143) : reg151[(3'h4):(1'h0)])) ~^ (+(+(8'hb0))))};
            end
        end
      else
        begin
          reg139 <= {$signed(($signed(wire52) == reg147)), $signed(wire20)};
          if ($unsigned((wire52[(1'h0):(1'h0)] <<< wire18[(4'hb):(4'hb)])))
            begin
              reg140 <= (8'hb9);
            end
          else
            begin
              reg140 <= (^wire137[(1'h1):(1'h1)]);
              reg141 <= $unsigned((reg146 ?
                  reg146 : ($signed(wire21) ?
                      $signed(wire138) : ($unsigned(wire25) >>> reg142[(4'ha):(4'ha)]))));
              reg142 <= $signed(((8'hb4) >= (((-wire21) && wire21[(4'hc):(2'h3)]) >= wire20[(1'h1):(1'h0)])));
              reg143 <= {(8'ha3),
                  $unsigned((~^($signed(reg151) < reg144[(1'h1):(1'h0)])))};
            end
          if ((~^{(!reg143), reg148}))
            begin
              reg144 <= reg147[(1'h1):(1'h0)];
              reg145 <= $signed((~$signed(wire18)));
              reg146 <= ((($signed((+reg149)) ?
                      (!(reg146 ?
                          reg149 : reg142)) : $signed((+wire23))) >>> $unsigned(((+(8'hb6)) < (~reg150)))) ?
                  $unsigned(reg150) : $unsigned(reg148));
            end
          else
            begin
              reg144 <= reg151;
              reg145 <= ((reg139 < reg145) ? {reg145} : (8'ha1));
              reg146 <= ((wire133[(3'h7):(3'h6)] ^ reg149) ?
                  ($unsigned((~|(-(8'ha0)))) ?
                      $signed((-reg142[(3'h5):(3'h4)])) : ($unsigned((~&reg149)) && wire136)) : ((({reg150} ?
                      {reg26} : {reg145}) ^ $unsigned((reg152 ?
                      reg142 : reg142))) * (~^($signed((8'ha4)) ?
                      (reg143 ? reg140 : wire17) : ((8'hbf) == (7'h41))))));
            end
          reg147 <= (~^(wire54 >= {reg142}));
        end
      reg153 <= {{$unsigned((reg141 ? $signed(wire137) : (wire136 + wire137))),
              reg140[(1'h0):(1'h0)]},
          ({$signed((-wire133))} ?
              $signed(($unsigned(wire136) ^~ wire23)) : reg141)};
    end
  module154 #() modinst200 (wire199, clk, wire137, reg139, reg144, wire54, reg142);
  always
    @(posedge clk) begin
      reg201 <= $unsigned($unsigned(($unsigned($signed(wire52)) >>> (~&(~^wire17)))));
      reg202 <= $unsigned($signed((($unsigned(wire133) >>> (reg144 != wire17)) <<< wire23[(5'h14):(2'h3)])));
      reg203 <= (wire25[(4'ha):(3'h4)] ?
          ($signed($signed((reg140 >> reg202))) ?
              reg153 : ((((8'hae) >>> reg201) * (reg140 ^ reg151)) ?
                  $unsigned((reg148 ~^ reg147)) : (reg145 ?
                      (!(8'ha3)) : reg150))) : (~&(~|reg146)));
      reg204 <= (reg139[(1'h0):(1'h0)] ?
          reg147 : (~^{reg148, reg146[(1'h0):(1'h0)]}));
    end
endmodule

module module154
#(parameter param197 = ((({{(8'h9c)}} | {((7'h44) + (8'ha9))}) ~^ ((^~((8'ha9) > (8'ha9))) >>> {((8'hbe) ? (8'hbc) : (8'hab)), ((8'hb6) ? (8'hbc) : (8'ha2))})) ? ({(((7'h42) ? (8'h9f) : (8'hba)) ? ((7'h41) || (8'hae)) : {(8'ha7), (7'h42)}), (((8'ha3) * (7'h41)) == (&(8'hba)))} ? (((~&(8'hb4)) ? (~^(8'hbb)) : (8'hbc)) && {(!(8'ha3)), (~|(8'haf))}) : (({(8'hab), (8'hb1)} == ((8'h9c) ? (8'h9e) : (8'ha8))) > ({(8'ha6), (8'hb0)} ? (^(8'h9f)) : ((7'h44) ? (8'hbc) : (8'hab))))) : (((+((8'h9c) ? (8'hbb) : (8'hb6))) ? (8'ha6) : ((^(8'hbe)) ? ((8'h9e) < (8'ha5)) : (~(8'ha7)))) ? (((~^(7'h44)) ? ((8'ha3) + (8'hb1)) : {(8'ha6)}) ? {((8'ha6) ? (8'ha0) : (8'hbc))} : (8'h9e)) : (((!(8'hb6)) < ((8'hb2) != (8'h9d))) ? ({(8'hb6)} >> {(8'hb3)}) : (!((8'hb1) ? (8'ha4) : (8'hb4)))))), 
parameter param198 = (|(!param197)))
(y, clk, wire159, wire158, wire157, wire156, wire155);
  output wire [(32'h1ea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire159;
  input wire signed [(3'h5):(1'h0)] wire158;
  input wire [(5'h10):(1'h0)] wire157;
  input wire [(5'h12):(1'h0)] wire156;
  input wire signed [(3'h4):(1'h0)] wire155;
  wire [(3'h6):(1'h0)] wire196;
  wire [(5'h10):(1'h0)] wire195;
  wire signed [(5'h12):(1'h0)] wire194;
  wire signed [(5'h12):(1'h0)] wire193;
  wire [(4'hf):(1'h0)] wire192;
  wire signed [(4'ha):(1'h0)] wire191;
  wire [(5'h15):(1'h0)] wire177;
  wire [(2'h2):(1'h0)] wire176;
  reg [(4'h8):(1'h0)] reg190 = (1'h0);
  reg [(5'h12):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg188 = (1'h0);
  reg [(4'h9):(1'h0)] reg187 = (1'h0);
  reg [(4'ha):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg185 = (1'h0);
  reg [(4'hd):(1'h0)] reg184 = (1'h0);
  reg [(4'hc):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg181 = (1'h0);
  reg [(5'h13):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg179 = (1'h0);
  reg [(3'h6):(1'h0)] reg178 = (1'h0);
  reg [(5'h13):(1'h0)] reg175 = (1'h0);
  reg [(4'hb):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg171 = (1'h0);
  reg [(5'h13):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  reg [(4'hf):(1'h0)] reg168 = (1'h0);
  reg [(4'hd):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg166 = (1'h0);
  reg [(4'hb):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg161 = (1'h0);
  reg [(2'h2):(1'h0)] reg160 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire177,
                 wire176,
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
                 reg180,
                 reg179,
                 reg178,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((~|(((wire158 ? wire155 : wire159) ?
                  $signed(wire156) : $unsigned(wire157)) ?
              $signed((wire159 ?
                  wire157 : (8'had))) : $unsigned(wire156[(3'h6):(3'h5)]))) ?
          wire157 : (~|$unsigned((~|(wire157 ^~ (8'ha7)))))))
        begin
          reg160 <= $unsigned($unsigned(($signed((~wire159)) ?
              $signed({wire159, wire156}) : $unsigned(wire155))));
          reg161 <= wire159[(4'hb):(4'h8)];
          reg162 <= $signed(wire157);
          reg163 <= $unsigned(wire158[(2'h3):(2'h3)]);
        end
      else
        begin
          reg160 <= $signed(((reg162[(3'h4):(2'h2)] ?
              ({wire157,
                  reg163} ^~ reg163) : $unsigned($unsigned(reg161))) ^~ (8'h9d)));
          reg161 <= reg163;
          reg162 <= ($signed(wire155) ?
              (reg161[(3'h4):(2'h2)] - reg163) : {$unsigned($signed($unsigned(wire159))),
                  reg161[(3'h4):(2'h3)]});
          if ((-(~^$signed($signed((wire159 ? reg161 : wire159))))))
            begin
              reg163 <= reg163[(3'h6):(1'h0)];
              reg164 <= wire159[(1'h1):(1'h0)];
              reg165 <= (~wire157[(3'h5):(1'h0)]);
              reg166 <= (((~^(-$signed(reg164))) ?
                      (wire156 ~^ ((reg165 < reg164) - reg162)) : $unsigned($unsigned($signed(reg162)))) ?
                  wire156[(4'hd):(2'h3)] : $signed((8'hb4)));
            end
          else
            begin
              reg163 <= wire156[(5'h10):(3'h5)];
              reg164 <= wire157[(4'ha):(2'h2)];
              reg165 <= $unsigned(reg163);
              reg166 <= wire158[(2'h2):(1'h0)];
              reg167 <= (-($unsigned(wire155[(1'h1):(1'h1)]) ?
                  ((~&$signed(wire158)) <<< $signed(wire158[(3'h5):(3'h5)])) : $signed((-$signed((8'ha1))))));
            end
          reg168 <= (8'ha4);
        end
      if ((&(~|(^~$unsigned($unsigned((8'hb9)))))))
        begin
          reg169 <= (reg165[(4'h9):(4'h8)] > ($unsigned($signed($unsigned(wire157))) | (wire157[(3'h7):(1'h1)] == reg164)));
          reg170 <= reg161;
        end
      else
        begin
          reg169 <= {{$signed(wire156)}};
          if (reg169)
            begin
              reg170 <= reg169;
            end
          else
            begin
              reg170 <= $unsigned(reg165[(3'h7):(3'h4)]);
              reg171 <= $signed(reg168[(1'h1):(1'h1)]);
              reg172 <= $signed(reg161[(3'h4):(1'h0)]);
              reg173 <= (&reg168[(1'h1):(1'h0)]);
            end
          reg174 <= reg162[(4'hf):(4'hb)];
          reg175 <= (($signed($unsigned($signed(reg165))) >= ($signed((wire156 ?
                  reg166 : reg162)) ?
              $signed(((8'hba) <<< wire159)) : ($signed(reg169) ?
                  ((8'h9f) + reg163) : $signed((8'ha6))))) && $signed(reg166));
        end
    end
  assign wire176 = (({$unsigned($signed(wire159))} ^~ (reg171 >>> $unsigned($signed(reg165)))) == $signed(({(wire156 ?
                           reg175 : reg169),
                       (^(8'ha4))} + (~|(reg166 ? reg166 : wire158)))));
  assign wire177 = reg169;
  always
    @(posedge clk) begin
      if (((wire177[(3'h7):(2'h2)] ?
              (~(((8'ha8) + wire155) ?
                  (~|reg174) : (reg166 ? reg170 : wire177))) : (^~reg170)) ?
          (reg170[(3'h6):(1'h0)] ?
              (((reg163 < reg165) >> $signed(reg173)) ?
                  $signed($unsigned(reg174)) : (~$unsigned(reg175))) : (($signed((8'ha3)) ?
                  wire176 : wire156[(4'h9):(3'h4)]) || ((~|wire158) ^~ $unsigned(wire157)))) : $unsigned({$signed((~wire156)),
              $unsigned($signed(reg167))})))
        begin
          reg178 <= reg167[(2'h3):(2'h3)];
          reg179 <= $signed(reg173);
          if (wire155[(2'h2):(2'h2)])
            begin
              reg180 <= (~|reg169);
              reg181 <= ($signed(reg168) ? reg166 : reg161[(3'h4):(2'h2)]);
              reg182 <= (reg162[(5'h10):(4'ha)] * (($signed((|(7'h42))) ?
                  ((~^reg178) ?
                      ((8'hb8) == reg178) : reg170[(1'h1):(1'h0)]) : (-$signed(reg171))) == reg171));
              reg183 <= {$unsigned((!reg173[(1'h0):(1'h0)])), wire155};
            end
          else
            begin
              reg180 <= ($unsigned(reg180[(5'h11):(2'h2)]) ?
                  (^~((^reg172[(4'hb):(4'hb)]) ?
                      {$signed(reg166)} : ($unsigned(wire176) <<< ((8'hbf) >= wire157)))) : $signed((((reg181 ?
                      reg160 : wire156) >> (|reg160)) >> {(reg170 ?
                          reg173 : wire177)})));
              reg181 <= (($unsigned((^~(wire157 ?
                  reg165 : reg170))) > reg182[(3'h6):(2'h3)]) - $unsigned({wire155,
                  $signed((reg180 > (8'h9d)))}));
              reg182 <= $unsigned(reg161);
              reg183 <= wire159;
            end
          if ($signed($unsigned($signed(reg171[(4'hf):(4'he)]))))
            begin
              reg184 <= (8'hb7);
            end
          else
            begin
              reg184 <= (~|{$signed(reg180[(4'ha):(1'h1)])});
              reg185 <= $signed($signed(wire177[(4'h8):(1'h1)]));
              reg186 <= (&(wire157 || $unsigned(reg170)));
              reg187 <= reg180;
            end
        end
      else
        begin
          reg178 <= (reg174 ^ (wire155[(1'h1):(1'h0)] ^ reg179[(3'h7):(2'h3)]));
          reg179 <= (($signed(((wire177 ?
                  (8'hbb) : reg169) < $unsigned(reg186))) & (reg167[(4'h8):(1'h1)] > (8'h9e))) ?
              reg170 : (({$signed(reg163), (&reg168)} > ({reg183} ?
                      (~|reg168) : ((8'ha1) ? reg163 : reg187))) ?
                  (~((!wire158) ?
                      ((8'hb2) ? reg184 : reg165) : (reg164 ?
                          reg187 : reg168))) : ($unsigned($signed(reg163)) ?
                      wire177[(2'h2):(1'h0)] : $unsigned(reg184))));
          reg180 <= $signed((~^reg161));
        end
      reg188 <= (($unsigned(reg165) ?
              {wire157,
                  $signed($unsigned((8'hb7)))} : $unsigned((^$unsigned(reg164)))) ?
          ({wire176,
              reg164[(2'h2):(1'h1)]} >= (^~(((8'haf) << reg163) > (reg184 - reg165)))) : {(^~$unsigned(reg175))});
      reg189 <= (reg168[(1'h0):(1'h0)] ?
          (((^~(^reg163)) << ((8'hb6) <= $signed(reg160))) >> $unsigned(((reg168 > reg169) ?
              (reg175 == wire158) : (reg180 || reg187)))) : reg164[(1'h1):(1'h1)]);
      reg190 <= ($unsigned(reg188[(4'ha):(2'h3)]) | {$signed($signed((reg184 ?
              (8'hbc) : wire158)))});
    end
  assign wire191 = (8'ha5);
  assign wire192 = ($signed(($signed(reg165) != ($unsigned((8'ha7)) + {reg178,
                       reg179}))) >>> ($signed(reg186[(2'h3):(2'h3)]) && $unsigned(reg183)));
  assign wire193 = reg189[(1'h1):(1'h1)];
  assign wire194 = (+($unsigned((^~(reg172 >>> wire159))) ?
                       (^~wire193) : (wire157[(4'ha):(3'h7)] * (reg173[(4'hd):(3'h5)] ?
                           reg160 : reg187[(3'h7):(3'h5)]))));
  assign wire195 = wire158;
  assign wire196 = reg172[(2'h2):(1'h1)];
endmodule

module module55
#(parameter param131 = (8'hba), 
parameter param132 = (param131 ? param131 : ({((param131 ? (8'ha8) : param131) | param131), {(param131 ? param131 : (8'hb0))}} ~^ (param131 - param131))))
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h368):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire60;
  input wire signed [(5'h12):(1'h0)] wire59;
  input wire [(5'h14):(1'h0)] wire58;
  input wire signed [(5'h15):(1'h0)] wire57;
  input wire [(3'h6):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire130;
  wire [(4'h9):(1'h0)] wire129;
  wire [(5'h13):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire125,
                 wire124,
                 wire114,
                 wire113,
                 wire107,
                 wire106,
                 wire68,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg127,
                 reg126,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
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
                 reg71,
                 reg70,
                 reg69,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire61 = $unsigned(wire60);
  assign wire62 = (((8'hbe) > wire58[(5'h10):(2'h3)]) << (&((wire60[(1'h0):(1'h0)] >> (+wire61)) >>> $unsigned(wire56))));
  assign wire63 = (-($unsigned(((8'hbd) ?
                          $signed(wire57) : wire58[(4'hc):(1'h1)])) ?
                      (wire57[(1'h0):(1'h0)] ^ ($signed(wire58) ?
                          (!wire62) : $signed((8'h9e)))) : (&wire60)));
  assign wire64 = (^~(((~(~wire62)) | $unsigned($signed((8'hb1)))) ?
                      $unsigned(wire60[(3'h4):(2'h3)]) : $unsigned((~(wire59 != wire57)))));
  assign wire65 = $signed((~&$signed($signed((wire64 ^ wire57)))));
  always
    @(posedge clk) begin
      reg66 <= (wire56 ^ wire60[(4'hc):(4'hc)]);
      reg67 <= wire58;
    end
  assign wire68 = $unsigned($unsigned(($signed($unsigned(reg66)) ?
                      (+(+(8'ha8))) : wire63)));
  always
    @(posedge clk) begin
      if (reg67[(2'h2):(1'h0)])
        begin
          reg69 <= $signed(wire57);
          reg70 <= {reg66};
          reg71 <= (&(wire63[(2'h3):(2'h2)] | (($unsigned(reg70) << $unsigned(wire60)) ?
              $signed(wire63) : ((^~(8'ha0)) ?
                  {wire63, (8'ha8)} : wire63[(1'h1):(1'h0)]))));
          reg72 <= {((+wire64[(3'h7):(2'h3)]) ?
                  {(wire59 < (wire62 ? wire68 : wire56)),
                      (8'ha9)} : $signed(wire64)),
              wire60};
          reg73 <= (8'hb5);
        end
      else
        begin
          reg69 <= ($signed(wire59) > $signed((wire60 ? (~wire56) : reg72)));
          if (($signed($unsigned((wire64[(4'hc):(3'h4)] ?
                  (wire61 ? wire61 : wire60) : (|reg73)))) ?
              (((+$unsigned((8'ha3))) >>> (~&(wire58 ?
                  reg66 : reg69))) ^~ $unsigned(wire62)) : ((((wire57 ?
                          reg72 : wire61) ?
                      wire61 : $unsigned(reg67)) && (wire68[(5'h13):(5'h12)] ?
                      $unsigned((8'hb2)) : {wire56, reg70})) ?
                  wire65[(2'h3):(2'h2)] : ((wire61 ?
                          (^~wire64) : (wire62 ? reg71 : wire56)) ?
                      (8'ha8) : ($signed(wire59) ?
                          wire56[(2'h2):(1'h1)] : $unsigned((8'ha7)))))))
            begin
              reg70 <= $unsigned($signed($signed($signed((wire60 ?
                  (8'had) : reg67)))));
              reg71 <= (|$signed($signed($signed($signed(wire68)))));
              reg72 <= ((^(^(((8'hb7) ? wire61 : (8'hba)) ?
                      (wire59 ? (7'h44) : wire64) : (wire64 || (8'hb5))))) ?
                  (wire57[(3'h5):(3'h5)] ?
                      ({{wire62, (8'hab)},
                          (8'hb1)} - $unsigned((8'hb4))) : ($unsigned(wire61) | wire63)) : $unsigned({wire63[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg70 <= $signed((8'haf));
              reg71 <= $signed($unsigned((reg66 && (^~$unsigned(wire64)))));
            end
          reg73 <= wire59[(2'h2):(2'h2)];
          reg74 <= (&wire63);
          if ((^(($signed((~wire59)) << (-$signed(reg70))) ?
              $unsigned(reg67[(3'h7):(2'h2)]) : $unsigned(wire56))))
            begin
              reg75 <= {(wire56[(1'h0):(1'h0)] ?
                      $unsigned((!((8'hb1) ?
                          wire58 : wire61))) : (&($signed(wire68) ?
                          (^~wire62) : wire56[(1'h0):(1'h0)]))),
                  wire61[(2'h2):(2'h2)]};
              reg76 <= (({reg71[(1'h1):(1'h1)]} <<< (8'haa)) << reg75);
              reg77 <= (((8'hb6) ^~ $signed($signed({reg73,
                  reg67}))) >>> (!$unsigned($signed(wire58[(5'h12):(4'h8)]))));
            end
          else
            begin
              reg75 <= (wire61[(1'h1):(1'h1)] ? reg72[(4'h9):(4'h9)] : reg66);
            end
        end
      reg78 <= {(~|{$signed((8'ha2))}), ($signed((8'ha3)) > (8'ha9))};
      reg79 <= ((reg70 ? wire68 : wire62) ?
          $signed(reg66) : (|$signed(({reg73, reg71} & (reg66 ?
              wire58 : (7'h44))))));
      reg80 <= wire57[(5'h11):(2'h3)];
    end
  always
    @(posedge clk) begin
      if (wire64)
        begin
          reg81 <= $signed({reg73, reg78[(4'h8):(2'h3)]});
          reg82 <= ($signed((8'hb3)) << {wire56[(3'h4):(2'h2)],
              {((wire61 | reg78) <= (&(8'hab)))}});
        end
      else
        begin
          reg81 <= {(reg77 - wire61[(2'h3):(2'h3)]), (^reg67[(4'h8):(1'h0)])};
          reg82 <= (+$signed(((reg79 ? (~&wire60) : (reg79 ? wire59 : reg78)) ?
              $signed(wire56) : ((wire65 | reg74) >= {reg75, (8'haf)}))));
        end
      reg83 <= wire61[(2'h2):(1'h1)];
      reg84 <= (-{(^~(wire64 ? wire56 : (8'ha1))),
          (~&$unsigned((wire64 ? (8'hbf) : reg69)))});
      if ((wire58[(5'h10):(4'hc)] ? reg72[(2'h3):(2'h2)] : wire63))
        begin
          if ((wire60[(3'h5):(3'h5)] ?
              {((8'ha5) ? {(|reg70), (wire68 < reg83)} : (~wire58)),
                  $unsigned(wire63[(2'h2):(1'h0)])} : ((((reg80 == reg70) & wire62[(5'h15):(4'hd)]) ?
                      ({reg74} << $signed(reg67)) : wire64[(2'h2):(1'h0)]) ?
                  ((-(reg71 ? reg67 : wire59)) ?
                      (((8'ha0) <= reg70) ?
                          (reg80 >= reg81) : (~&(8'h9c))) : reg82[(4'ha):(4'h8)]) : wire57[(4'hc):(4'ha)])))
            begin
              reg85 <= $unsigned((~(8'ha3)));
              reg86 <= reg83;
            end
          else
            begin
              reg85 <= (~|reg67[(1'h1):(1'h1)]);
              reg86 <= wire59[(1'h1):(1'h0)];
              reg87 <= (((reg74[(2'h2):(1'h0)] <<< {reg75[(4'he):(4'hb)]}) ?
                  reg75 : (reg82 <= reg75[(4'hf):(3'h5)])) < (reg76 ?
                  $unsigned((-reg82)) : ((wire57[(4'he):(2'h2)] << ((8'ha8) && reg80)) ?
                      reg77 : ($unsigned(wire59) <= (~(8'ha4))))));
            end
          if (reg83)
            begin
              reg88 <= $unsigned((reg77[(3'h4):(1'h1)] ?
                  $unsigned(((!wire65) ?
                      $signed(reg83) : $signed(reg74))) : ($signed($unsigned(reg75)) <= (&reg86[(5'h10):(5'h10)]))));
            end
          else
            begin
              reg88 <= ((reg83 != (-$signed($unsigned(reg67)))) || (reg66 ?
                  $unsigned({reg75}) : ((!reg77[(3'h4):(2'h2)]) ?
                      wire60 : {{wire56}})));
            end
          reg89 <= reg67[(3'h4):(1'h0)];
          if ((^~(($signed(((8'ha6) ? reg74 : wire63)) <<< $signed({wire64,
                  reg87})) ?
              {reg75[(4'ha):(1'h1)]} : reg78)))
            begin
              reg90 <= (+(($signed((reg77 ? wire65 : reg71)) ?
                      reg71 : ($unsigned(wire57) ?
                          reg84[(3'h4):(3'h4)] : wire59[(5'h12):(4'hd)])) ?
                  reg84 : (~^{{wire57}})));
              reg91 <= $unsigned($signed($signed((wire58[(5'h10):(3'h6)] ?
                  (~|(8'hb2)) : reg83))));
              reg92 <= wire62;
            end
          else
            begin
              reg90 <= (~|wire57);
              reg91 <= (^~{reg71[(1'h0):(1'h0)], reg72[(4'h8):(3'h4)]});
              reg92 <= ((8'hb7) ?
                  $signed(($signed({reg88,
                      reg85}) | reg74)) : ($unsigned({(reg91 != reg71)}) ?
                      reg89 : $signed(wire63)));
              reg93 <= ($unsigned(({(~|reg70), wire63[(2'h3):(2'h2)]} ?
                      (reg80[(3'h7):(3'h4)] ^ (reg87 ?
                          (8'hbd) : reg75)) : $unsigned(((8'hab) ?
                          reg86 : wire63)))) ?
                  wire58 : (-wire68));
            end
          reg94 <= (-{$signed(({reg81, (7'h42)} && (reg67 ? (8'ha6) : reg72))),
              $signed({wire58[(4'h9):(4'h9)], reg87[(4'hd):(3'h4)]})});
        end
      else
        begin
          if ((({$signed((~|reg89)),
                  wire64[(4'hd):(4'hc)]} ^~ $unsigned((reg71 ?
                  wire60[(1'h1):(1'h1)] : reg70[(2'h3):(2'h2)]))) ?
              ($signed((reg77 ? wire61[(1'h0):(1'h0)] : (-reg80))) ?
                  $unsigned((+reg82)) : wire68) : $unsigned(($signed((~|reg92)) ?
                  $signed(((8'hb2) && (8'hbe))) : ((-(8'h9e)) ^~ (reg93 == reg85))))))
            begin
              reg85 <= $unsigned(reg88);
              reg86 <= ($signed((reg82[(3'h6):(1'h1)] ?
                  reg79 : wire59)) ^ $unsigned({((reg86 ?
                      (8'hae) : (7'h40)) > (8'hab)),
                  ($signed(wire58) ~^ {reg79})}));
              reg87 <= (^~$signed($signed((~{reg66, wire63}))));
            end
          else
            begin
              reg85 <= (~|(wire63 > (~^wire65[(3'h4):(1'h0)])));
              reg86 <= $signed((($unsigned(reg82) ?
                      $signed($unsigned(reg76)) : wire65[(1'h1):(1'h0)]) ?
                  $unsigned((-$unsigned(wire65))) : (-$signed((wire63 ?
                      wire58 : (8'hab))))));
              reg87 <= $unsigned({reg75,
                  $unsigned(((-reg85) ? (8'hbb) : wire64[(4'hf):(2'h2)]))});
              reg88 <= (wire57[(4'h9):(1'h1)] ?
                  $unsigned($signed((8'ha8))) : reg67);
            end
          reg89 <= wire60[(1'h0):(1'h0)];
          if (reg94)
            begin
              reg90 <= {(~&($unsigned($signed(reg93)) ?
                      ($unsigned(reg90) << (^reg74)) : reg85[(4'ha):(4'h8)]))};
              reg91 <= reg75[(1'h1):(1'h1)];
              reg92 <= reg80[(1'h0):(1'h0)];
            end
          else
            begin
              reg90 <= (reg94 ?
                  (!(({(8'hbd)} ?
                      reg92[(4'hd):(1'h0)] : $unsigned(reg91)) + {(wire62 && reg75)})) : $signed($unsigned((7'h42))));
            end
        end
      if (((^$signed({$signed(reg78), wire61})) <= {$signed($signed({reg81,
              reg85})),
          ({(reg66 ? wire58 : wire62)} < reg82[(4'he):(1'h1)])}))
        begin
          reg95 <= (8'haf);
          reg96 <= reg73;
          reg97 <= reg81[(4'h8):(4'h8)];
          reg98 <= reg82;
          reg99 <= {(&(+wire57)),
              (($signed((reg73 || reg96)) > reg88[(5'h14):(4'he)]) == $unsigned(reg79[(3'h7):(1'h1)]))};
        end
      else
        begin
          reg95 <= ($unsigned($unsigned(($unsigned(reg84) ?
                  (reg83 ? (8'h9e) : (7'h42)) : (!(8'ha1))))) ?
              (reg80[(4'h9):(3'h6)] ?
                  (~|(+reg67)) : (&{(reg86 ^~ (7'h44)),
                      wire56})) : ($signed($signed(reg76)) ?
                  ((&(wire62 ?
                      wire61 : reg92)) > $signed(reg85[(1'h0):(1'h0)])) : (reg73[(4'hc):(3'h5)] ?
                      (wire61 ? (+reg97) : reg73) : ((wire59 ? reg95 : reg78) ?
                          reg96 : (wire59 <= reg96)))));
          reg96 <= $unsigned((+reg69));
          if (reg69)
            begin
              reg97 <= reg67;
              reg98 <= (+(reg72[(1'h0):(1'h0)] ?
                  reg71[(2'h2):(2'h2)] : {reg94}));
              reg99 <= reg72;
              reg100 <= $signed(((($signed(reg66) * (~^reg96)) ?
                      (8'hb7) : wire60[(3'h4):(3'h4)]) ?
                  $signed((|(wire62 + (8'hab)))) : (reg84[(2'h3):(2'h3)] << reg86[(4'hb):(3'h4)])));
              reg101 <= (~$unsigned($signed(((reg81 >>> reg85) > $unsigned(reg100)))));
            end
          else
            begin
              reg97 <= wire61;
            end
          reg102 <= reg85[(4'ha):(3'h6)];
          if (reg81[(4'h8):(3'h7)])
            begin
              reg103 <= (~|$unsigned((^~$unsigned($unsigned(reg73)))));
              reg104 <= wire68;
              reg105 <= $signed(($signed({(!(8'ha7)), {wire57}}) ?
                  $signed($signed((reg83 ?
                      wire61 : reg81))) : {$signed((-reg92)), (8'ha6)}));
            end
          else
            begin
              reg103 <= {({reg77,
                      reg80[(4'ha):(3'h7)]} >> reg73[(4'hc):(4'ha)])};
            end
        end
    end
  assign wire106 = reg89;
  assign wire107 = $unsigned($signed($signed($signed(reg70))));
  always
    @(posedge clk) begin
      reg108 <= $signed(($signed((-{reg73})) >= ($signed(reg79) != $signed($signed(reg66)))));
      reg109 <= {$unsigned((~^{$signed(reg84), $unsigned(reg85)})),
          (^~(($signed(reg71) && (wire65 >= reg93)) ~^ reg87))};
      reg110 <= $unsigned(((wire60[(1'h1):(1'h1)] >> $signed(reg84[(2'h2):(2'h2)])) ?
          wire65[(2'h3):(1'h1)] : $unsigned((^~$signed((7'h40))))));
      reg111 <= {wire65};
      reg112 <= $unsigned({$unsigned(reg92[(1'h0):(1'h0)]),
          $unsigned(($unsigned(reg82) ? (~|reg81) : (reg95 ~^ reg73)))});
    end
  assign wire113 = (wire61[(2'h3):(1'h1)] ?
                       wire57[(5'h13):(4'he)] : ($signed($signed((reg69 ?
                           reg97 : reg67))) != reg93[(4'ha):(2'h3)]));
  assign wire114 = $signed(reg84[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg115 <= {{$signed(reg80), $signed((-$signed(reg66)))}};
      if (reg115[(3'h4):(2'h3)])
        begin
          reg116 <= reg77[(3'h5):(3'h5)];
        end
      else
        begin
          reg116 <= ((~&$signed(reg71[(1'h0):(1'h0)])) > ($signed((^~$signed(reg93))) ?
              (^~reg85[(4'h9):(4'h9)]) : (reg78 ?
                  reg79[(3'h5):(3'h5)] : reg77[(1'h0):(1'h0)])));
          reg117 <= (~reg111);
          reg118 <= (^~$unsigned((reg94 ?
              ($signed(wire63) ?
                  reg92[(3'h6):(3'h6)] : reg67[(3'h5):(2'h2)]) : (~|$signed(reg103)))));
          reg119 <= (+(wire64 ?
              ($unsigned((&(8'hb8))) < wire68) : $signed(reg117[(1'h1):(1'h1)])));
          if ((wire61[(1'h1):(1'h1)] <= ($signed((|$unsigned(reg103))) >= ((reg99 > (^~wire57)) ?
              (8'h9d) : ((reg86 ? wire61 : wire68) ?
                  (reg77 ? (7'h42) : reg112) : reg93)))))
            begin
              reg120 <= $signed(reg69[(1'h1):(1'h0)]);
              reg121 <= $unsigned((wire63 == $unsigned($unsigned($signed((8'ha8))))));
              reg122 <= ($unsigned(reg103[(4'h8):(1'h0)]) ?
                  $unsigned((({reg82, reg101} ?
                      (-reg87) : $signed(reg96)) && ($signed(reg67) <= wire59))) : ($unsigned($unsigned($unsigned(wire114))) & (((~reg84) ~^ reg119[(1'h0):(1'h0)]) ^~ $unsigned((reg77 ?
                      (8'ha9) : reg86)))));
              reg123 <= ({(((reg116 >= reg91) ? {reg105} : {(8'hb1), reg119}) ?
                      (|reg101) : (8'hae)),
                  $signed(reg115[(1'h0):(1'h0)])} ^ (reg67 ?
                  reg95 : $signed(wire57)));
            end
          else
            begin
              reg120 <= $unsigned(($unsigned({reg80[(4'h9):(3'h6)]}) | ({((8'h9c) <= (8'hac))} + (^~$unsigned(wire113)))));
              reg121 <= {{($unsigned({reg67, wire59}) ?
                          (!$unsigned(reg97)) : reg121)},
                  $unsigned(reg74[(1'h1):(1'h0)])};
              reg122 <= ((8'hb2) ?
                  (^wire65) : $unsigned(({{wire62}} >> ({wire113} ^~ wire68))));
            end
        end
    end
  assign wire124 = reg70;
  assign wire125 = ($signed(($signed(reg111[(4'h9):(3'h4)]) >= ($unsigned(wire107) >= (8'hb2)))) || {reg96[(4'h8):(3'h5)]});
  always
    @(posedge clk) begin
      reg126 <= $unsigned(((&reg119) <<< ((reg101[(5'h11):(4'hb)] * ((7'h41) ~^ reg79)) > (!(~^(8'ha9))))));
      reg127 <= reg99;
    end
  assign wire128 = {(8'had),
                       $signed($signed(($unsigned((8'ha8)) ?
                           (&wire56) : reg86[(4'h8):(3'h6)])))};
  assign wire129 = (8'h9e);
  assign wire130 = reg91[(3'h4):(1'h0)];
endmodule

module module27
#(parameter param50 = (((~^((^~(8'ha2)) ? ((8'hba) ? (8'haa) : (8'hbf)) : (8'ha6))) ? (({(8'ha1), (8'hab)} & ((8'hbc) ^ (7'h42))) ~^ (((8'ha0) ~^ (8'h9c)) - {(8'ha9), (7'h41)})) : (|{((8'hb0) - (8'hba))})) ? ((8'hb4) * (((+(8'hb0)) <= {(8'ha3)}) ? (((8'hb6) ? (8'ha1) : (8'hab)) - (|(8'ha2))) : ((-(8'hbe)) <= ((8'h9c) ? (8'ha5) : (8'h9c))))) : ((8'hb9) + (((^(8'had)) ? ((8'ha4) ? (8'h9f) : (8'hbc)) : (|(8'hb8))) ? (((8'haa) == (8'hbf)) ? ((8'hbc) >= (8'h9c)) : ((8'hbd) != (8'ha7))) : ({(8'ha5), (7'h40)} ^ ((8'haa) >> (8'ha3)))))), 
parameter param51 = param50)
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire32;
  input wire [(5'h13):(1'h0)] wire31;
  input wire [(2'h3):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(3'h5):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire33 = (((wire28 ? wire28 : wire31) ?
                      ($unsigned($signed(wire31)) ?
                          (~|(|wire32)) : $signed((+(8'ha7)))) : wire31) <= wire30[(2'h2):(1'h1)]);
  assign wire34 = (8'hb2);
  assign wire35 = (((^~wire30) < $signed(((&wire33) * $signed(wire34)))) ?
                      (($signed((wire32 ?
                              wire33 : (8'h9f))) <= {wire34[(1'h1):(1'h0)]}) ?
                          (~($unsigned(wire28) ?
                              wire32 : $signed(wire30))) : (^~wire32)) : wire29[(4'h9):(4'h9)]);
  assign wire36 = $unsigned($signed((~^$signed($signed(wire33)))));
  assign wire37 = (8'hb7);
  assign wire38 = $signed($unsigned(($unsigned({wire37}) ?
                      (8'ha7) : (((8'hbd) ~^ wire37) ?
                          wire36[(4'ha):(4'h8)] : wire35[(3'h5):(1'h1)]))));
  always
    @(posedge clk) begin
      reg39 <= wire31[(4'he):(4'he)];
      if ((-wire33))
        begin
          reg40 <= {{{($signed(wire31) ?
                          ((8'ha4) ?
                              wire37 : wire32) : wire31[(4'h9):(4'h9)])}},
              wire38[(4'h8):(1'h0)]};
        end
      else
        begin
          reg40 <= (wire33[(1'h1):(1'h1)] ?
              wire38 : $signed($unsigned($signed(wire38[(4'hd):(3'h4)]))));
          reg41 <= (^~wire37[(4'ha):(4'h8)]);
          reg42 <= $unsigned($unsigned(((8'hb2) ? (8'hac) : (^~wire33))));
          reg43 <= $unsigned(($signed($unsigned((wire34 >>> reg41))) ?
              ($unsigned((~wire32)) + wire30[(2'h2):(1'h1)]) : (wire36[(1'h1):(1'h0)] << $signed((8'hb8)))));
          reg44 <= (($unsigned({{wire36}}) ^~ (~|wire37)) ?
              ($signed(((reg43 | wire38) ? (8'h9e) : {wire32, (8'hae)})) ?
                  wire30[(2'h3):(1'h0)] : wire36[(3'h6):(1'h1)]) : (($unsigned((reg43 < wire30)) || (reg42[(4'hc):(4'h9)] || (8'hb3))) && reg43));
        end
    end
  always
    @(posedge clk) begin
      reg45 <= $signed(($signed($unsigned(reg41)) >= ($unsigned(wire32) * (|((8'h9d) == reg39)))));
      reg46 <= ((+$signed($signed($signed(reg42)))) >>> reg40);
    end
  assign wire47 = ($unsigned(reg39[(3'h4):(2'h3)]) < ({wire32,
                          wire36[(3'h4):(2'h2)]} ?
                      wire29 : ({(reg40 << (8'ha3))} >> wire30[(1'h1):(1'h0)])));
  assign wire48 = wire37;
  assign wire49 = $signed(reg43);
endmodule
