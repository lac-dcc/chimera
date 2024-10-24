module top
#(parameter param227 = ((((!(~&(8'h9d))) << (~|((8'h9f) > (8'h9c)))) - (~^((8'h9f) ? ((8'hb3) ? (8'hb4) : (7'h44)) : (~&(8'ha3))))) ? ((~^((~^(8'ha9)) > (^~(8'hba)))) ? ((((8'hb5) ? (8'h9c) : (8'ha3)) >= {(8'hb7), (8'hb7)}) || {((8'hac) ? (8'h9d) : (7'h41)), {(8'hab)}}) : ((-(~&(8'hbd))) >= (((8'ha3) ? (8'h9d) : (8'hb6)) ? ((8'ha2) << (8'haf)) : ((8'ha8) ? (8'ha6) : (8'ha5))))) : (((((8'had) == (8'hba)) ? {(8'hb1), (8'hab)} : ((8'hab) || (8'hb0))) ? ((~&(8'hbd)) >> {(8'hb8)}) : (((7'h41) ? (8'hb7) : (8'ha6)) ? (|(8'ha2)) : ((8'hb4) ? (8'h9e) : (8'haa)))) ^ {((~&(8'ha9)) ? (~|(8'hb1)) : ((8'hb3) << (7'h44))), (((8'hb0) && (8'hbf)) <<< {(8'haf)})})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire222;
  wire [(3'h6):(1'h0)] wire221;
  wire signed [(5'h10):(1'h0)] wire219;
  reg [(3'h4):(1'h0)] reg226 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg225 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg224 = (1'h0);
  reg [(3'h6):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire222,
                 wire221,
                 wire219,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed($signed(((~&wire1) >>> (wire2 ?
          wire3 : wire2)))) ^~ wire3[(4'hb):(2'h3)]);
      if (wire3[(1'h0):(1'h0)])
        begin
          reg5 <= (((~|((~&(8'hbf)) ^ ((8'hb3) & wire0))) > {((-wire0) <<< wire3[(2'h2):(1'h1)])}) && (((+wire3) ?
                  wire1 : ((reg4 != wire3) ?
                      wire2[(3'h7):(1'h0)] : wire0[(4'hc):(4'h8)])) ?
              $unsigned($signed($unsigned(reg4))) : $signed((8'hbd))));
          reg6 <= wire2[(4'h8):(1'h1)];
          if (wire0)
            begin
              reg7 <= $signed(($signed(($unsigned((8'hbd)) ?
                  reg5[(3'h5):(3'h5)] : (reg5 ? wire2 : (8'hb0)))) << reg4));
              reg8 <= ((wire2[(4'h8):(3'h5)] ?
                      (8'haf) : (($unsigned(wire3) >= {wire3,
                          reg5}) >>> $signed($signed((8'hb0))))) ?
                  $signed(wire0) : (reg7 && $unsigned(($unsigned(wire3) + {reg7,
                      wire2}))));
              reg9 <= ((reg7[(1'h1):(1'h0)] ?
                  $unsigned(($signed(wire1) ^ reg6)) : reg5[(4'ha):(2'h3)]) ^ (^~({$signed((8'hac)),
                      (wire1 ? wire0 : reg4)} ?
                  $signed(reg6[(5'h15):(3'h5)]) : (-reg8[(4'ha):(3'h5)]))));
              reg10 <= (reg4[(1'h0):(1'h0)] ?
                  $unsigned($unsigned($signed(((8'ha0) ?
                      wire0 : reg5)))) : ((((wire2 ? reg5 : reg5) ?
                          (reg4 ? reg7 : reg7) : wire1) >> (~|(reg7 & wire0))) ?
                      $signed($signed(wire2)) : $unsigned((~|(reg8 ?
                          wire2 : wire3)))));
              reg11 <= ($signed($signed({wire1})) ?
                  $unsigned($signed(reg8[(3'h7):(3'h6)])) : $unsigned(($signed((~wire2)) ?
                      $unsigned((8'ha1)) : wire2)));
            end
          else
            begin
              reg7 <= wire3;
              reg8 <= (reg9[(4'h8):(1'h0)] == wire3);
            end
        end
      else
        begin
          if (reg8)
            begin
              reg5 <= ((^~($unsigned((+reg5)) ?
                      (^(reg5 ? wire3 : wire0)) : reg4[(1'h0):(1'h0)])) ?
                  $signed($unsigned((!$unsigned((8'ha5))))) : (~&{reg11[(1'h1):(1'h0)]}));
              reg6 <= (&{$signed($signed((wire3 ^~ reg10))),
                  (reg11[(2'h2):(1'h1)] ?
                      {$signed(reg6), {wire2}} : $signed({reg5}))});
              reg7 <= ((((~$unsigned(reg4)) ?
                          ({(8'ha4), reg6} ?
                              reg4[(3'h7):(3'h7)] : (~|reg11)) : (+$signed(reg10))) ?
                      wire2 : $unsigned({$unsigned(wire1), $unsigned(reg9)})) ?
                  (~^(~|reg6)) : {reg5[(4'h9):(2'h2)]});
            end
          else
            begin
              reg5 <= (|(wire1 && wire2));
              reg6 <= reg9[(2'h3):(1'h1)];
              reg7 <= $signed(wire2);
              reg8 <= $unsigned((({{wire0, wire0},
                      (reg6 ? wire0 : reg6)} != (~^$unsigned(reg8))) ?
                  $signed((~$signed(reg4))) : (^reg9[(3'h7):(1'h1)])));
              reg9 <= ($signed(($signed(reg11[(1'h1):(1'h1)]) << reg6)) >> $unsigned($signed(((wire3 < reg7) ?
                  reg9[(3'h4):(2'h2)] : reg6))));
            end
          reg10 <= reg10;
          reg11 <= ($signed(((~reg10[(3'h4):(1'h1)]) && wire2)) > (wire1 >>> reg11[(1'h0):(1'h0)]));
          if ({$signed({((-reg9) + reg5[(3'h7):(2'h3)]), reg11})})
            begin
              reg12 <= (8'ha6);
              reg13 <= ($signed($signed((reg4 ^ $signed(reg8)))) ?
                  wire2 : ($unsigned($unsigned(reg4)) & (^$unsigned($signed(reg5)))));
              reg14 <= $unsigned(wire2[(4'hb):(4'h9)]);
            end
          else
            begin
              reg12 <= $unsigned((^~reg10));
            end
        end
      reg15 <= (~|reg12);
    end
  module16 #() modinst220 (wire219, clk, reg9, wire0, reg5, reg15, reg6);
  assign wire221 = reg11;
  assign wire222 = reg12;
  always
    @(posedge clk) begin
      if ($unsigned(((8'hb8) >> {(8'hb2), (~^((8'hb8) ? reg15 : wire222))})))
        begin
          reg223 <= wire221;
          reg224 <= (^wire222);
          reg225 <= wire219[(4'hc):(3'h6)];
        end
      else
        begin
          reg223 <= reg6;
        end
      reg226 <= {$unsigned(($unsigned({wire0, reg4}) ?
              wire2 : (wire0 ? {reg9} : {reg11})))};
    end
endmodule

module module16
#(parameter param217 = ((({((8'hb7) ? (8'hb0) : (8'ha1)), (^~(8'ha6))} ? (8'ha3) : (8'hbd)) ? (~&(((8'hac) ? (8'ha6) : (8'hb9)) ? ((8'hbe) >> (8'haa)) : (~(8'hab)))) : {(~((8'hb5) ? (8'hb5) : (8'hb5))), (((8'hb0) ? (8'h9f) : (8'hac)) ~^ (|(8'hb6)))}) << (&(((7'h42) ? (~^(8'hb7)) : ((8'h9c) ? (8'ha3) : (7'h41))) <<< (~&{(8'h9d), (7'h43)})))), 
parameter param218 = param217)
(y, clk, wire17, wire18, wire19, wire20, wire21);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire216;
  wire [(3'h7):(1'h0)] wire215;
  wire signed [(5'h14):(1'h0)] wire188;
  wire [(5'h11):(1'h0)] wire122;
  wire [(4'ha):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(2'h3):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire191;
  wire signed [(4'hf):(1'h0)] wire192;
  wire [(5'h12):(1'h0)] wire213;
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg190 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire188,
                 wire122,
                 wire120,
                 wire77,
                 wire71,
                 wire70,
                 wire69,
                 wire22,
                 wire42,
                 wire44,
                 wire45,
                 wire67,
                 wire191,
                 wire192,
                 wire213,
                 reg46,
                 reg47,
                 reg48,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg190,
                 (1'h0)};
  assign wire22 = (|wire17);
  module23 #() modinst43 (wire42, clk, wire21, wire17, wire20, wire19);
  assign wire44 = (8'ha6);
  assign wire45 = (~{wire44,
                      $signed({(wire17 ? wire42 : wire22), (~^(8'ha4))})});
  always
    @(posedge clk) begin
      reg46 <= wire18[(2'h3):(2'h2)];
      reg47 <= $unsigned((!((wire20[(3'h7):(3'h5)] ?
              $unsigned(wire18) : wire22[(1'h1):(1'h1)]) ?
          (!$signed(wire21)) : {(wire22 <= wire42),
              (wire18 ? wire42 : wire21)})));
      reg48 <= wire42[(1'h1):(1'h0)];
    end
  module49 #() modinst68 (wire67, clk, wire21, wire19, wire17, wire45, wire44);
  assign wire69 = wire17;
  assign wire70 = reg46[(3'h4):(2'h2)];
  assign wire71 = ({(^~$unsigned((wire69 & reg47))),
                      wire21[(2'h3):(1'h0)]} == $unsigned(((^~(wire70 ^ (8'hbd))) ?
                      $signed($signed(wire67)) : {wire45[(5'h12):(4'hb)]})));
  always
    @(posedge clk) begin
      reg72 <= $unsigned({((wire70 >= ((8'hb5) ^ wire45)) << $signed(reg47)),
          (^({reg47, reg47} ? {wire69, wire42} : reg47))});
      reg73 <= ($unsigned((wire70 ^~ ((~|wire44) ? (~&wire69) : wire20))) ?
          wire42[(1'h0):(1'h0)] : ($unsigned(wire21) >> wire19[(2'h2):(1'h1)]));
      reg74 <= $signed(($unsigned(wire67[(3'h4):(1'h1)]) <<< (!{$unsigned(wire69)})));
      reg75 <= $signed($unsigned((!reg72)));
      reg76 <= $unsigned({{{(-wire71)}, $unsigned((^~wire70))}});
    end
  assign wire77 = ((^$signed((&(wire19 ? (8'h9f) : wire18)))) & {reg46,
                      $signed($signed((wire19 ? wire70 : wire19)))});
  module78 #() modinst121 (.wire82(wire19), .wire79(reg76), .wire83(wire20), .y(wire120), .wire81(wire77), .clk(clk), .wire80(wire42));
  assign wire122 = wire42[(3'h6):(2'h2)];
  module123 #() modinst189 (.y(wire188), .clk(clk), .wire124(wire77), .wire127(wire19), .wire126(wire67), .wire125(reg48));
  always
    @(posedge clk) begin
      reg190 <= wire19;
    end
  assign wire191 = {$signed(((wire18 ?
                           ((8'hb4) ?
                               (8'h9e) : reg48) : ((8'ha4) | wire70)) <= ({reg72,
                               reg76} ?
                           $unsigned(wire42) : (!reg72))))};
  assign wire192 = $signed(wire18[(2'h2):(1'h0)]);
  module193 #() modinst214 (.y(wire213), .clk(clk), .wire194(wire191), .wire196(wire20), .wire197(wire192), .wire195(reg72));
  assign wire215 = wire42;
  assign wire216 = $signed(($unsigned($signed(wire42[(3'h6):(3'h5)])) ?
                       $signed((|{wire122,
                           wire42})) : ((((8'ha8) ~^ wire45) <= $unsigned(reg48)) ~^ $signed(((8'ha3) << wire188)))));
endmodule

module module193  (y, clk, wire197, wire196, wire195, wire194);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire197;
  input wire signed [(5'h15):(1'h0)] wire196;
  input wire [(4'h9):(1'h0)] wire195;
  input wire signed [(4'hc):(1'h0)] wire194;
  wire signed [(3'h6):(1'h0)] wire212;
  wire [(4'h9):(1'h0)] wire211;
  wire [(4'ha):(1'h0)] wire210;
  wire signed [(4'hd):(1'h0)] wire209;
  wire signed [(4'hb):(1'h0)] wire198;
  reg [(3'h7):(1'h0)] reg208 = (1'h0);
  reg [(2'h3):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg206 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg204 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg203 = (1'h0);
  reg [(4'hf):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg200 = (1'h0);
  reg [(5'h14):(1'h0)] reg199 = (1'h0);
  assign y = {wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire198,
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
                 (1'h0)};
  assign wire198 = (^wire194);
  always
    @(posedge clk) begin
      reg199 <= $unsigned({$unsigned(((wire196 ? wire195 : wire198) ?
              wire196 : wire198)),
          $unsigned(((wire194 ? wire198 : wire198) | wire194[(3'h4):(1'h0)]))});
      reg200 <= wire195;
      reg201 <= (((~$unsigned((wire198 * wire196))) ?
          (-$signed({reg200,
              wire195})) : $unsigned($unsigned((reg199 && (8'had))))) > $unsigned(wire198[(2'h3):(2'h3)]));
      reg202 <= ({(8'hbf), (~|$unsigned($unsigned((8'ha9))))} ?
          $unsigned($unsigned($unsigned({(8'h9d)}))) : wire195[(4'h8):(2'h3)]);
      reg203 <= {$signed($signed((^~(~reg201))))};
    end
  always
    @(posedge clk) begin
      reg204 <= wire194;
      if (wire197)
        begin
          if (wire196[(2'h3):(1'h0)])
            begin
              reg205 <= wire195;
              reg206 <= (~|((^~wire194) ?
                  $unsigned($signed((reg200 ?
                      wire196 : wire196))) : $unsigned((reg203[(2'h2):(1'h1)] < $signed(reg205)))));
            end
          else
            begin
              reg205 <= reg204;
              reg206 <= ((|((reg203 <<< (wire196 ? reg200 : wire195)) ?
                      $unsigned((reg205 < reg206)) : ($signed(wire194) ?
                          {wire195} : reg199[(4'h9):(3'h4)]))) ?
                  $unsigned((~&$signed((reg202 ?
                      (8'hb1) : reg201)))) : ($unsigned($signed($signed(wire197))) ?
                      $signed(reg205) : reg201));
            end
          if ($signed(((^~reg200) + ({$unsigned((8'hb4))} ?
              $signed(reg204) : (8'ha5)))))
            begin
              reg207 <= (-$signed((-($signed(wire196) && (&reg199)))));
            end
          else
            begin
              reg207 <= $unsigned({reg201[(4'h8):(3'h5)],
                  (&$unsigned($unsigned(wire194)))});
            end
        end
      else
        begin
          reg205 <= (wire194[(1'h0):(1'h0)] ?
              (reg200 ~^ ((8'ha4) ?
                  (8'hb1) : (8'ha3))) : reg207[(2'h2):(1'h1)]);
          reg206 <= reg200[(1'h0):(1'h0)];
        end
      reg208 <= $unsigned((!$unsigned({(wire198 ? (8'h9f) : reg207),
          $signed(reg200)})));
    end
  assign wire209 = reg201;
  assign wire210 = (reg200 >= $unsigned((reg200[(3'h4):(2'h3)] <= $signed((~^reg208)))));
  assign wire211 = ((^$signed((wire194[(3'h7):(2'h2)] ?
                       (wire196 & wire209) : $unsigned(reg208)))) != $signed(wire197));
  assign wire212 = $signed($signed($unsigned((~&$signed(wire194)))));
endmodule

module module123
#(parameter param186 = (~(!((((8'hba) ? (8'hb6) : (8'h9d)) ^ {(8'ha2), (8'ha5)}) ? ({(8'hbc), (8'h9c)} <<< ((8'ha7) < (8'hb2))) : (|((8'hb7) ? (8'hb1) : (8'hb1)))))), 
parameter param187 = ((param186 ? (~|param186) : (+(~^{param186, param186}))) ? ((!((|param186) > (^param186))) ? ({param186, (param186 * (8'hb5))} ? ({param186} ? (param186 ? param186 : param186) : (+(8'h9f))) : ((8'hbe) ? {param186} : {param186, param186})) : ({(param186 > param186), {param186}} == ((+param186) >= param186))) : param186))
(y, clk, wire127, wire126, wire125, wire124);
  output wire [(32'h2aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire127;
  input wire signed [(2'h2):(1'h0)] wire126;
  input wire signed [(5'h10):(1'h0)] wire125;
  input wire signed [(4'he):(1'h0)] wire124;
  wire [(3'h4):(1'h0)] wire185;
  wire [(3'h7):(1'h0)] wire184;
  wire [(3'h7):(1'h0)] wire183;
  wire [(5'h15):(1'h0)] wire165;
  wire signed [(5'h14):(1'h0)] wire153;
  wire signed [(5'h13):(1'h0)] wire152;
  wire signed [(4'h8):(1'h0)] wire151;
  wire [(4'h8):(1'h0)] wire150;
  wire [(4'h9):(1'h0)] wire136;
  wire signed [(4'h9):(1'h0)] wire135;
  wire signed [(4'he):(1'h0)] wire134;
  wire [(4'ha):(1'h0)] wire133;
  wire signed [(4'hd):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire129;
  wire signed [(5'h11):(1'h0)] wire128;
  reg signed [(5'h13):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg181 = (1'h0);
  reg [(5'h13):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg179 = (1'h0);
  reg [(5'h11):(1'h0)] reg178 = (1'h0);
  reg [(3'h7):(1'h0)] reg177 = (1'h0);
  reg [(5'h14):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg175 = (1'h0);
  reg signed [(4'he):(1'h0)] reg174 = (1'h0);
  reg [(4'h8):(1'h0)] reg173 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg172 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg170 = (1'h0);
  reg [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(5'h13):(1'h0)] reg168 = (1'h0);
  reg [(4'ha):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(4'hf):(1'h0)] reg163 = (1'h0);
  reg [(4'hc):(1'h0)] reg162 = (1'h0);
  reg [(5'h11):(1'h0)] reg161 = (1'h0);
  reg [(3'h5):(1'h0)] reg160 = (1'h0);
  reg signed [(4'he):(1'h0)] reg159 = (1'h0);
  reg [(5'h15):(1'h0)] reg158 = (1'h0);
  reg [(4'he):(1'h0)] reg157 = (1'h0);
  reg [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(4'hc):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(4'h8):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire183,
                 wire165,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire130,
                 wire129,
                 wire128,
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
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire128 = (|((($signed(wire127) <<< (wire127 ?
                           wire124 : (8'ha2))) - wire125[(4'he):(2'h2)]) ?
                       wire124[(1'h0):(1'h0)] : (wire127[(2'h2):(1'h1)] & wire126[(1'h1):(1'h0)])));
  assign wire129 = {((~wire125[(5'h10):(1'h1)]) ?
                           (wire125 < (~&{wire125, wire124})) : {(7'h41),
                               $unsigned((~|(8'hae)))}),
                       (wire124[(4'hc):(3'h6)] ?
                           wire124[(1'h0):(1'h0)] : $signed(wire125[(4'hb):(4'hb)]))};
  assign wire130 = (8'ha6);
  always
    @(posedge clk) begin
      reg131 <= $signed(wire128[(4'h9):(2'h2)]);
      reg132 <= reg131[(4'he):(4'h8)];
    end
  assign wire133 = wire127;
  assign wire134 = ((8'h9c) ?
                       ($signed(((+(8'haf)) - reg131)) ?
                           wire125 : ($signed(wire124) ~^ wire125[(4'he):(1'h0)])) : wire127);
  assign wire135 = $signed(wire126);
  assign wire136 = $signed(wire128);
  always
    @(posedge clk) begin
      reg137 <= (-(wire128 ?
          (~|$unsigned($signed((8'hb2)))) : $signed(($signed(wire126) && wire125[(4'h9):(2'h2)]))));
      reg138 <= wire125[(2'h3):(2'h3)];
      reg139 <= ((~$unsigned(reg132[(4'hb):(3'h7)])) || ($signed($unsigned((wire129 << wire127))) ?
          $unsigned(((wire136 & reg132) >> wire128[(1'h0):(1'h0)])) : $signed(wire124)));
    end
  always
    @(posedge clk) begin
      if (reg131[(3'h7):(3'h7)])
        begin
          reg140 <= ((wire129[(2'h3):(1'h0)] ?
              (+wire135) : (wire127 >= reg139)) - ({(^wire124),
                  wire134[(4'h9):(3'h6)]} ?
              $unsigned(reg138) : wire126));
          if (reg132)
            begin
              reg141 <= ($signed($signed(reg131[(1'h1):(1'h1)])) & (7'h40));
              reg142 <= (!reg140[(4'he):(3'h6)]);
              reg143 <= reg141[(4'h8):(3'h5)];
              reg144 <= ((7'h44) ?
                  $unsigned((wire125 ?
                      $unsigned($signed((8'hb0))) : $signed($unsigned(reg138)))) : (~($unsigned({(7'h42),
                      reg141}) & wire129)));
              reg145 <= (($signed($unsigned((wire124 <= reg137))) ?
                      wire127 : {{(^reg142)}}) ?
                  (^~$unsigned($unsigned(reg132))) : reg132);
            end
          else
            begin
              reg141 <= (({(~|$unsigned(reg137)), wire126} ?
                  ($signed(reg145[(3'h4):(1'h0)]) ~^ (^~{reg140,
                      wire128})) : $unsigned({(+reg142),
                      (reg131 ?
                          (8'hb9) : (8'ha1))})) * (((((8'hb2) >>> wire125) > (|reg139)) == reg137) ?
                  wire126 : $unsigned($signed((~|wire125)))));
              reg142 <= (~(reg131[(2'h2):(1'h0)] ?
                  ($signed((^reg132)) ?
                      ((reg139 <= reg132) ?
                          {(7'h44), reg139} : {(8'hb6),
                              wire125}) : wire134[(1'h1):(1'h0)]) : wire130));
            end
        end
      else
        begin
          reg140 <= {reg137[(1'h1):(1'h1)]};
          reg141 <= ({($unsigned(((8'hbd) > reg139)) ?
                      reg132[(4'ha):(3'h4)] : reg132[(4'h8):(3'h5)]),
                  reg143[(2'h3):(1'h1)]} ?
              $unsigned(wire135[(3'h7):(3'h4)]) : wire134);
          reg142 <= wire133;
        end
      reg146 <= {wire130[(3'h7):(1'h1)],
          (^~(~(reg145[(1'h1):(1'h1)] << $signed(wire129))))};
      reg147 <= (((8'ha0) ?
              (|reg132[(4'he):(4'he)]) : ($signed((wire125 ?
                      wire134 : wire129)) ?
                  $signed($signed(reg140)) : wire133[(1'h0):(1'h0)])) ?
          reg132 : reg138);
      reg148 <= wire135;
      reg149 <= (reg143 ?
          (~{wire134[(1'h0):(1'h0)], (~{wire126})}) : {wire129});
    end
  assign wire150 = ($unsigned((~&((7'h40) ?
                           (wire125 ? wire134 : (8'hb1)) : (^(8'hbb))))) ?
                       (((((8'hb7) ? reg138 : wire126) ^~ (reg139 ?
                               wire133 : wire126)) ?
                           wire127[(2'h2):(1'h1)] : (reg143 != reg139[(4'he):(4'hc)])) << {wire126}) : reg132[(4'hb):(2'h3)]);
  assign wire151 = $unsigned($signed({((^wire135) >> (-reg131)),
                       ($unsigned(reg142) ?
                           ((8'hbc) ? (8'h9e) : wire150) : wire134)}));
  assign wire152 = reg144;
  assign wire153 = reg149[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg154 <= wire152[(2'h3):(1'h0)];
      reg155 <= (!(~|{$signed((reg141 || wire136)),
          ($unsigned((8'had)) ? $signed(wire126) : (+reg139))}));
      reg156 <= $signed((|((wire126[(1'h1):(1'h1)] && ((8'hb3) && reg132)) ?
          reg137 : (wire150[(1'h0):(1'h0)] < reg142))));
    end
  always
    @(posedge clk) begin
      reg157 <= $unsigned({(&(wire133 << (reg154 ? reg146 : wire153))),
          wire151[(2'h3):(2'h3)]});
      if ($unsigned(reg154[(5'h12):(5'h11)]))
        begin
          if ($unsigned($unsigned(wire152)))
            begin
              reg158 <= (((reg139[(4'hd):(4'hd)] << (^(7'h43))) <= ({$signed(wire127),
                          reg148} ?
                      ($unsigned(reg155) || (~^wire128)) : $signed($signed((8'ha1))))) ?
                  (!wire151) : reg140);
              reg159 <= wire152;
              reg160 <= ($signed(($signed({(8'hba), reg145}) ^ {reg131})) ?
                  $unsigned($signed(($unsigned(reg137) ?
                      $unsigned(reg138) : ((8'ha3) ~^ wire151)))) : (8'ha1));
              reg161 <= (~^(+{(reg141 ? (~|wire134) : (!reg154)),
                  (~$signed((8'hb2)))}));
            end
          else
            begin
              reg158 <= wire126;
              reg159 <= (7'h41);
              reg160 <= (~^reg137);
            end
          reg162 <= wire135[(4'h9):(2'h3)];
          reg163 <= (~|(wire126[(2'h2):(1'h0)] >= {($unsigned(reg156) ?
                  (reg141 ? reg139 : reg140) : (wire136 << wire135)),
              (~&(+wire126))}));
        end
      else
        begin
          reg158 <= reg158;
          reg159 <= (reg140[(4'hd):(4'hd)] ?
              (!(reg140 ~^ $unsigned((~|reg160)))) : (reg147[(2'h3):(2'h3)] ?
                  $unsigned(reg154[(3'h6):(2'h3)]) : {($unsigned(reg157) ?
                          (reg157 <<< wire127) : (wire127 ?
                              wire125 : reg156))}));
        end
      reg164 <= (reg137[(4'ha):(3'h6)] ?
          $signed(((^~(~^wire129)) & (^reg145[(3'h4):(2'h2)]))) : $unsigned($signed($unsigned(reg144[(1'h1):(1'h1)]))));
    end
  assign wire165 = (wire152[(4'hc):(4'hb)] * {((^~$signed(reg158)) * (!$signed(reg159))),
                       wire152[(3'h7):(3'h4)]});
  always
    @(posedge clk) begin
      if (reg155)
        begin
          reg166 <= (reg147[(1'h1):(1'h1)] || reg145);
          reg167 <= (((^~(reg142 ?
              {reg162} : wire165[(5'h15):(3'h6)])) - reg161[(4'hb):(1'h0)]) << $signed({wire127[(3'h4):(1'h0)],
              reg162[(3'h6):(1'h1)]}));
        end
      else
        begin
          if (((wire126 >> {(8'hb6)}) ?
              $signed(wire135[(1'h1):(1'h1)]) : (^~wire129[(3'h4):(1'h0)])))
            begin
              reg166 <= ($signed(((((8'hb1) ~^ reg139) ?
                          (reg158 ? reg137 : wire153) : (reg164 ?
                              reg162 : reg141)) ?
                      $unsigned({reg160, (8'hb3)}) : $unsigned(reg143))) ?
                  (^~{$unsigned($unsigned(reg147))}) : (~|$signed($signed(reg141))));
              reg167 <= (reg154[(5'h13):(1'h0)] ?
                  (reg161 ?
                      (wire150 > ((wire124 <<< reg166) ?
                          $signed(reg145) : $unsigned(reg137))) : $signed({$signed(reg164)})) : wire165);
              reg168 <= (^~($unsigned(wire126) ?
                  (reg144 || (!{reg158})) : $signed((~&$unsigned((8'ha7))))));
              reg169 <= reg144[(3'h5):(3'h4)];
              reg170 <= ($unsigned($signed((reg145 ?
                  {wire152} : (wire151 ?
                      reg147 : reg161)))) >> $unsigned($unsigned(wire153)));
            end
          else
            begin
              reg166 <= ($signed({$signed(reg169[(2'h2):(1'h0)]),
                      $unsigned($unsigned(reg170))}) ?
                  $unsigned({(|(reg156 ?
                          (8'ha0) : reg132))}) : reg146[(2'h2):(1'h1)]);
              reg167 <= (wire125 ?
                  (($signed(wire134) + $unsigned((^reg167))) ?
                      $signed((!$signed((8'hb4)))) : $signed((-reg132[(4'hb):(3'h7)]))) : $unsigned((($unsigned(reg155) == $unsigned(wire127)) && $unsigned((reg146 << reg132)))));
              reg168 <= $signed(reg149);
              reg169 <= $unsigned($signed(wire152));
              reg170 <= (((-$unsigned((reg138 ? (8'hb7) : reg167))) ?
                      wire127 : reg137) ?
                  (~|{$unsigned($signed(reg157)),
                      {$unsigned(reg144),
                          $signed(wire136)}}) : reg158[(1'h0):(1'h0)]);
            end
          reg171 <= $signed(reg143[(2'h2):(2'h2)]);
          reg172 <= reg144[(3'h5):(1'h0)];
        end
      if ({$signed(reg131[(4'hb):(1'h1)]),
          (|(~&((8'hb9) | (wire153 < reg169))))})
        begin
          if (((|((reg144[(1'h0):(1'h0)] ?
              (reg168 <<< reg140) : reg161) ^~ wire125[(4'h9):(3'h4)])) > (reg144 ?
              (wire151 + {$unsigned(reg170)}) : (7'h44))))
            begin
              reg173 <= (reg139 != $signed((8'haa)));
            end
          else
            begin
              reg173 <= $unsigned((~&(reg137[(4'hd):(4'h8)] & ($signed(wire151) | (reg144 == reg160)))));
              reg174 <= {($signed((-(~reg145))) ?
                      $unsigned($unsigned(reg162)) : reg140),
                  $unsigned(($signed(wire165) * reg161))};
              reg175 <= wire153;
              reg176 <= reg173;
            end
          if ((-$signed(reg166)))
            begin
              reg177 <= (!($signed((~|((8'hb6) ?
                  (8'hb3) : reg137))) * {(reg157 > (~reg139)),
                  ($unsigned(reg171) ~^ (reg167 & reg146))}));
              reg178 <= wire125;
            end
          else
            begin
              reg177 <= (-$signed(wire135));
              reg178 <= (({($signed(reg176) ?
                              $unsigned(reg144) : ((8'hac) > reg139))} ?
                      wire151 : $unsigned(reg172[(1'h0):(1'h0)])) ?
                  ((reg172 ?
                      (!(wire128 ? wire126 : reg174)) : ((reg160 ?
                              reg155 : reg168) ?
                          wire153 : (~|reg156))) - (reg138 ?
                      $signed($unsigned(reg156)) : (wire153[(5'h11):(3'h6)] ?
                          {reg149} : (wire128 ~^ reg163)))) : wire151[(3'h4):(3'h4)]);
              reg179 <= (&wire126[(2'h2):(2'h2)]);
              reg180 <= ((^(&(wire153 ?
                  (reg163 ?
                      (8'ha5) : reg138) : $unsigned((8'hb1))))) > $unsigned({(^$unsigned(reg146))}));
            end
        end
      else
        begin
          reg173 <= {$unsigned(reg162[(2'h3):(2'h2)])};
          if (((!wire150) ?
              ((!reg161) && reg155[(3'h4):(1'h0)]) : (reg137 ?
                  ($unsigned(reg159[(4'hd):(4'h8)]) & (8'hb4)) : {reg175})))
            begin
              reg174 <= ((8'h9c) ^ $signed($signed(($unsigned(reg162) ?
                  reg139[(4'hd):(1'h0)] : (reg156 ? reg131 : reg139)))));
            end
          else
            begin
              reg174 <= (reg175 ?
                  $unsigned({$unsigned((reg158 < reg164)),
                      reg171}) : $unsigned((((reg146 ?
                          reg141 : reg162) & wire150[(1'h0):(1'h0)]) ?
                      reg167[(4'h9):(3'h4)] : (^(reg161 ? reg147 : reg164)))));
              reg175 <= $unsigned(reg169[(3'h4):(1'h0)]);
            end
          reg176 <= (($signed($signed({(8'ha1)})) ?
                  (~|$unsigned(wire151)) : reg177) ?
              {(^~$signed(wire127))} : $unsigned(reg176));
          if (reg172)
            begin
              reg177 <= (reg139 ~^ reg164);
              reg178 <= ((~^(reg131[(4'hc):(3'h4)] == $unsigned($unsigned(wire134)))) & reg167);
              reg179 <= wire136;
              reg180 <= $unsigned((-{reg157}));
              reg181 <= ((~&wire135[(1'h0):(1'h0)]) ?
                  wire150 : ($unsigned((&(~&reg173))) << (reg179[(3'h4):(3'h4)] <= ((+reg160) ~^ reg180))));
            end
          else
            begin
              reg177 <= (~(+wire136));
              reg178 <= $unsigned((~$signed((^~{reg142, reg156}))));
              reg179 <= {(reg174 ?
                      ((reg143[(1'h0):(1'h0)] == reg175) <= wire152) : $signed((wire151 * $unsigned(wire165))))};
            end
        end
      reg182 <= $unsigned(reg169[(1'h1):(1'h0)]);
    end
  assign wire183 = wire126[(1'h0):(1'h0)];
  assign wire184 = ($unsigned($signed(((wire125 != reg139) ?
                       (reg155 != wire129) : $unsigned(wire124)))) * wire130[(1'h0):(1'h0)]);
  assign wire185 = $signed($unsigned(($signed($unsigned(reg175)) ?
                       wire124 : {wire165[(5'h14):(5'h13)],
                           (reg146 ? (8'hb8) : reg173)})));
endmodule

module module78  (y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire83;
  input wire signed [(5'h12):(1'h0)] wire82;
  input wire signed [(5'h11):(1'h0)] wire81;
  input wire [(3'h7):(1'h0)] wire80;
  input wire [(3'h4):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire [(5'h14):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire [(3'h7):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire114;
  wire [(3'h5):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire112;
  wire [(5'h12):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire84;
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
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
                 (1'h0)};
  assign wire84 = wire82[(1'h0):(1'h0)];
  assign wire85 = $unsigned((-wire83[(2'h2):(1'h1)]));
  assign wire86 = (!(((~|$unsigned(wire85)) ?
                      (wire79 ?
                          wire83[(5'h14):(5'h14)] : (wire85 || (8'ha7))) : (-(wire81 ?
                          wire83 : wire85))) >= wire84[(4'h9):(1'h0)]));
  assign wire87 = wire84;
  assign wire88 = (^wire86[(3'h4):(2'h2)]);
  assign wire89 = wire79[(1'h0):(1'h0)];
  assign wire90 = wire81[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ((|({$signed($signed(wire87))} ?
          $unsigned(($unsigned(wire82) ?
              $signed(wire88) : wire85[(2'h2):(2'h2)])) : $unsigned({(wire88 <= wire82)}))))
        begin
          reg91 <= wire85[(1'h1):(1'h0)];
          reg92 <= $unsigned(({wire87, $unsigned($signed(wire90))} ?
              (~|((wire88 >>> (8'hb9)) ?
                  $signed(wire90) : $signed(wire88))) : ($unsigned($signed(wire81)) ?
                  (&(wire85 ? wire81 : wire85)) : ((wire82 ?
                      wire90 : wire85) >> (wire79 == wire82)))));
        end
      else
        begin
          if ((&$unsigned((~&(8'hb8)))))
            begin
              reg91 <= wire86[(2'h2):(1'h0)];
            end
          else
            begin
              reg91 <= $unsigned((({$signed(wire82)} ?
                      $signed(wire84) : $signed((wire86 ? (8'ha5) : reg92))) ?
                  (~|{(&(8'ha0)),
                      (+wire87)}) : (wire82 && $signed(wire84[(4'hc):(2'h2)]))));
              reg92 <= (wire79[(3'h4):(1'h0)] >= ($unsigned($unsigned({reg91})) ?
                  (wire79[(1'h0):(1'h0)] ?
                      wire86[(1'h1):(1'h0)] : ($unsigned(wire83) + {wire90})) : wire88));
            end
          reg93 <= $unsigned(((~$signed((!(8'ha3)))) ?
              (-reg92) : $signed((|(wire82 ? wire79 : wire80)))));
        end
      reg94 <= (($unsigned(($signed(wire86) ?
              (wire84 ? wire79 : wire83) : (&(8'ha2)))) == ({(wire89 ?
                      wire79 : wire82)} ?
              $signed(wire80[(3'h4):(2'h2)]) : ($unsigned(reg91) <<< $signed((8'h9e))))) ?
          wire86[(2'h3):(2'h3)] : (^~wire88[(4'h8):(2'h2)]));
      reg95 <= $signed(wire84[(1'h1):(1'h1)]);
      reg96 <= (((~&wire81[(3'h6):(3'h4)]) ?
          {(reg93[(4'hd):(4'hb)] >= wire86[(3'h5):(1'h0)]),
              (wire86 ? wire86 : wire83)} : (wire84 ?
              $signed($signed(wire84)) : ($unsigned(wire87) ?
                  $unsigned(wire84) : wire83))) * wire80);
    end
  always
    @(posedge clk) begin
      reg97 <= $signed($signed(wire86));
      reg98 <= $unsigned({$unsigned(($unsigned(wire88) < $unsigned(wire81)))});
      reg99 <= $unsigned((!(-wire79)));
      reg100 <= (((reg92 >> $unsigned(wire83)) ?
              ((wire81[(4'hc):(4'hc)] ? $unsigned(wire90) : reg92) ?
                  (reg91 >= ((7'h40) ? wire90 : wire79)) : ((^~wire89) ?
                      {(8'hb1),
                          wire89} : wire86[(3'h4):(2'h3)])) : reg91[(2'h3):(1'h1)]) ?
          wire83[(3'h6):(3'h6)] : (~&(!$unsigned(reg96))));
    end
  assign wire101 = {wire86[(3'h7):(3'h5)], wire87};
  assign wire102 = wire89[(4'he):(4'hc)];
  assign wire103 = wire101[(4'he):(3'h4)];
  assign wire104 = (-$signed((^(8'ha4))));
  always
    @(posedge clk) begin
      if ((wire80[(3'h5):(2'h3)] & ($unsigned((&(wire101 ?
          wire89 : wire88))) >> wire79[(3'h4):(1'h0)])))
        begin
          reg105 <= $signed(wire79[(3'h4):(1'h1)]);
          reg106 <= (reg91[(4'h9):(1'h0)] <= ($signed($signed((wire82 ?
              wire79 : reg92))) || (+(|$signed((8'h9c))))));
          if (wire89[(4'h8):(2'h2)])
            begin
              reg107 <= $signed((-(~$unsigned($signed(reg97)))));
              reg108 <= wire83[(5'h13):(5'h12)];
            end
          else
            begin
              reg107 <= reg93[(4'hc):(4'h8)];
              reg108 <= ((!wire81) >> $signed((wire80 || $signed(((8'h9f) || (8'ha4))))));
            end
          reg109 <= (reg107 ? wire84 : reg107);
          reg110 <= $unsigned(($unsigned($signed((wire84 ^ reg91))) ^~ $signed((wire90[(4'he):(4'hc)] ?
              $signed(wire103) : $signed(wire86)))));
        end
      else
        begin
          reg105 <= ((|wire85) ? (^~(&(^(+(8'hb9))))) : wire79[(1'h0):(1'h0)]);
          reg106 <= (reg105 + $signed(($signed($unsigned(wire102)) ?
              wire104 : ((&(8'hb6)) ? ((8'hb9) * wire80) : reg105))));
          reg107 <= $unsigned((wire102[(4'he):(3'h4)] + ((wire102[(4'h8):(3'h7)] == $signed(wire83)) && (^~$unsigned(reg108)))));
        end
    end
  assign wire111 = wire85[(5'h10):(3'h5)];
  assign wire112 = (^$signed($signed((~&$signed(reg91)))));
  assign wire113 = (~|reg107);
  assign wire114 = $unsigned(wire81);
  assign wire115 = $unsigned(reg100);
  assign wire116 = $signed((-($signed(wire79[(1'h0):(1'h0)]) ?
                       $signed((wire83 ~^ reg107)) : $signed(wire103))));
  assign wire117 = (wire113 ?
                       (|$signed(($signed(reg96) ?
                           reg106 : $unsigned(wire104)))) : reg106);
  assign wire118 = reg95[(3'h7):(1'h0)];
  assign wire119 = (8'hb4);
endmodule

module module49  (y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire54;
  input wire [(4'he):(1'h0)] wire53;
  input wire [(3'h7):(1'h0)] wire52;
  input wire signed [(5'h12):(1'h0)] wire51;
  input wire signed [(4'hd):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire55;
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 reg56,
                 (1'h0)};
  assign wire55 = {(!{(-wire52), wire54}), wire53};
  always
    @(posedge clk) begin
      reg56 <= (+$unsigned(wire54[(2'h2):(1'h1)]));
    end
  assign wire57 = ($signed((~&$unsigned($unsigned(reg56)))) <<< (((~(reg56 <<< wire53)) ?
                          {(reg56 & wire54),
                              (|(8'hbc))} : $signed($unsigned(wire55))) ?
                      ((~^(reg56 + wire51)) ?
                          $unsigned((wire55 ?
                              (8'h9c) : reg56)) : $unsigned({wire53})) : wire54[(1'h0):(1'h0)]));
  assign wire58 = ((~^(((wire55 > wire54) ? (wire54 ^~ wire50) : (|(8'h9f))) ?
                      ($signed((8'h9f)) ?
                          (wire53 ^ wire55) : (wire55 ?
                              wire50 : (8'hb4))) : (~^wire50))) | $unsigned((&$signed((~wire55)))));
  assign wire59 = $unsigned({$signed((&wire52[(3'h4):(1'h0)]))});
  assign wire60 = {({(wire52 ? wire59[(3'h6):(2'h3)] : (wire57 > wire59)),
                              (wire55[(5'h13):(3'h4)] >> {wire55})} ?
                          ($signed($signed(reg56)) ?
                              ($unsigned(wire57) <= {reg56,
                                  wire50}) : {wire51}) : wire55[(4'ha):(3'h4)])};
  assign wire61 = $signed($unsigned(wire54[(1'h1):(1'h1)]));
  assign wire62 = ((wire52 ~^ $signed({{(8'hae), wire58},
                      wire54})) >>> $unsigned(($unsigned((~^wire55)) >= wire57)));
  assign wire63 = $signed($signed(wire53));
  assign wire64 = $unsigned({((!(wire52 | wire50)) ?
                          reg56 : $signed((+wire52)))});
  assign wire65 = (($signed($unsigned(wire52[(3'h5):(3'h4)])) < (wire57 >= ((8'hb8) ?
                      (wire51 & wire63) : (|wire61)))) << $signed(wire54));
  assign wire66 = (|({(+wire51)} <<< (wire64[(1'h0):(1'h0)] || (~$unsigned(wire52)))));
endmodule

module module23  (y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire27;
  input wire [(3'h4):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  input wire [(5'h12):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire28;
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire28 = wire27[(3'h4):(2'h3)];
  assign wire29 = wire27[(1'h1):(1'h0)];
  assign wire30 = wire27[(3'h7):(3'h7)];
  assign wire31 = {$signed(($unsigned(wire30[(3'h4):(3'h4)]) > ({wire26,
                          wire30} ^ (wire30 != wire26)))),
                      $unsigned($signed($unsigned((-wire25))))};
  assign wire32 = wire27[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg33 <= wire24;
      reg34 <= reg33;
      reg35 <= {{($unsigned((wire26 ? wire32 : wire29)) ?
                  ($signed(wire24) | (^wire29)) : wire26),
              ((7'h41) ^ $signed($signed(reg33)))}};
    end
  assign wire36 = (~^{(!$signed({wire30, wire27}))});
  assign wire37 = ($unsigned($signed(((^wire24) ^~ (-wire29)))) ?
                      wire29 : wire32);
  assign wire38 = ($signed({reg33}) ?
                      ($signed({(|wire36)}) ?
                          ((~&(wire27 ?
                              wire29 : wire31)) << $unsigned($unsigned((8'hbb)))) : {$signed((^~reg33))}) : wire26[(1'h0):(1'h0)]);
  assign wire39 = (!wire38[(4'hb):(1'h1)]);
  assign wire40 = {wire32, reg34[(2'h2):(1'h0)]};
  assign wire41 = (|wire32[(3'h4):(1'h1)]);
endmodule
