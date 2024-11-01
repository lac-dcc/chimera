module top
#(parameter param228 = ((~&({{(8'hbb), (8'hbb)}, (!(8'hbd))} <= (((8'ha3) ? (8'ha9) : (7'h40)) != ((8'haa) != (8'hb1))))) << (~(8'hb0))), 
parameter param229 = (&(({(param228 + param228), (param228 ? (8'hab) : param228)} <= (param228 ? (param228 + param228) : (+param228))) ? (8'hb8) : param228)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire227;
  wire signed [(4'h9):(1'h0)] wire226;
  wire [(4'hb):(1'h0)] wire225;
  wire signed [(3'h6):(1'h0)] wire224;
  wire [(2'h3):(1'h0)] wire222;
  wire [(4'hb):(1'h0)] wire164;
  wire signed [(5'h13):(1'h0)] wire163;
  wire signed [(4'he):(1'h0)] wire142;
  wire signed [(5'h15):(1'h0)] wire141;
  wire signed [(4'he):(1'h0)] wire139;
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg147 = (1'h0);
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg153 = (1'h0);
  reg [(2'h3):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg155 = (1'h0);
  reg [(4'hf):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(3'h4):(1'h0)] reg158 = (1'h0);
  reg [(4'hd):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg160 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg162 = (1'h0);
  assign y = {wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire222,
                 wire164,
                 wire163,
                 wire142,
                 wire141,
                 wire139,
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
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 (1'h0)};
  module4 #() modinst140 (wire139, clk, wire3, wire0, wire2, wire1, (8'hb2));
  assign wire141 = (^~(7'h40));
  assign wire142 = (!(!{$signed((+wire1)),
                       (wire0 ? (wire0 ? wire141 : wire2) : wire1)}));
  always
    @(posedge clk) begin
      if (wire1[(4'ha):(2'h3)])
        begin
          if ((($unsigned(($unsigned(wire141) ?
                  ((7'h42) | (8'h9d)) : $signed(wire142))) ?
              wire141 : wire2[(4'hc):(4'ha)]) & $unsigned($signed(wire139))))
            begin
              reg143 <= ((wire0 || wire141[(3'h7):(3'h5)]) || $unsigned($signed($signed((wire142 == wire3)))));
              reg144 <= $signed($unsigned((($unsigned(wire0) >>> wire1) != (wire139[(3'h5):(2'h2)] ?
                  (!(8'hb4)) : (wire139 ? (8'haa) : wire2)))));
              reg145 <= wire142[(3'h4):(1'h0)];
            end
          else
            begin
              reg143 <= $signed(wire141);
              reg144 <= wire141[(1'h0):(1'h0)];
              reg145 <= $signed(reg143[(4'he):(3'h4)]);
              reg146 <= $unsigned((({wire2} < (!(reg143 * (8'ha2)))) ?
                  (wire139 ?
                      $unsigned(reg144[(5'h11):(4'ha)]) : wire2) : wire0));
            end
          reg147 <= reg144[(4'ha):(1'h1)];
          reg148 <= reg143[(4'he):(2'h2)];
          reg149 <= ((reg143 ?
              (wire1[(4'he):(4'he)] + $signed($unsigned((8'ha2)))) : $unsigned(reg143)) > ((reg146 && wire142[(2'h3):(2'h3)]) | $unsigned((wire1[(1'h1):(1'h1)] ?
              wire1 : (wire3 ? (8'ha1) : reg148)))));
          if (($unsigned(reg146) >>> ($unsigned(((+reg147) & (^reg148))) ?
              reg149[(5'h12):(4'hc)] : (~|reg149[(4'h9):(3'h6)]))))
            begin
              reg150 <= wire3;
            end
          else
            begin
              reg150 <= reg143;
              reg151 <= ((~^(!$unsigned(reg150[(3'h4):(1'h0)]))) ?
                  ((~reg150) ?
                      $signed(reg147) : reg148) : ($signed($signed((reg146 ?
                      reg144 : reg145))) ^~ (+(^$unsigned(reg150)))));
            end
        end
      else
        begin
          reg143 <= $unsigned(wire141[(1'h1):(1'h1)]);
          if ((~&(~|$signed($unsigned($unsigned(wire2))))))
            begin
              reg144 <= (~|$unsigned($unsigned($signed($signed(wire0)))));
              reg145 <= (-{$signed((wire2[(3'h6):(3'h5)] ?
                      ((8'hb5) * reg149) : wire1))});
              reg146 <= ($unsigned(reg145) - ((-$unsigned((reg151 | (8'hb0)))) ?
                  reg144 : (-(-(8'haf)))));
            end
          else
            begin
              reg144 <= (($unsigned(((+reg151) ?
                          reg144[(1'h0):(1'h0)] : (~|wire0))) ?
                      $signed(reg151) : reg150) ?
                  ((-(+(~^wire0))) * {wire139[(1'h0):(1'h0)],
                      ($signed(wire141) ?
                          ((8'ha0) <= reg143) : $unsigned(reg146))}) : $unsigned({(~&$signed((8'h9d)))}));
              reg145 <= ($unsigned((reg144[(5'h10):(4'h8)] + $unsigned({wire142}))) >> (~&((wire0[(3'h5):(3'h4)] ?
                  $signed(reg146) : $signed(reg150)) >>> (-wire3))));
              reg146 <= {$signed((wire3[(1'h0):(1'h0)] != wire2)),
                  (reg149 <<< (~reg146[(2'h2):(1'h0)]))};
              reg147 <= ((!(($unsigned((8'hb3)) == (reg146 ?
                      reg147 : wire0)) ~^ $unsigned(wire141[(5'h12):(2'h2)]))) ?
                  wire3[(4'he):(4'h8)] : ((8'hb8) != reg146[(2'h2):(1'h0)]));
              reg148 <= (^~{$signed($signed((|(8'hb2)))),
                  ($signed(wire3[(1'h1):(1'h0)]) >= (~|(reg147 ?
                      wire141 : reg146)))});
            end
        end
      reg152 <= (((($unsigned(wire1) ?
              reg145[(3'h4):(1'h1)] : (reg147 ?
                  wire3 : wire142)) * $unsigned((reg148 ?
              reg151 : wire3))) * $signed((+reg148[(4'h8):(2'h3)]))) ?
          $signed($signed($unsigned($unsigned(wire3)))) : $unsigned($signed(reg146)));
      reg153 <= {(!$signed((^reg151))), wire139};
      if (($signed((8'hb1)) * (^((((8'ha1) ? reg144 : reg152) ?
              reg150 : reg143[(4'hc):(3'h4)]) ?
          reg153 : $signed(reg147)))))
        begin
          reg154 <= ($signed($signed($unsigned((-reg148)))) == wire141[(1'h0):(1'h0)]);
          reg155 <= ((|$signed((^~(reg146 ? reg143 : reg147)))) ?
              (($signed($unsigned(reg147)) ?
                  (~reg145[(4'h8):(2'h3)]) : wire141[(5'h15):(3'h7)]) <<< (8'hb3)) : reg147);
          reg156 <= wire0;
          if (((((^reg145[(3'h4):(1'h1)]) >>> wire139) ?
              wire141 : $signed(((reg145 <<< wire1) ?
                  $unsigned((8'hb8)) : (^reg147)))) && (reg155 >>> {$signed({reg152})})))
            begin
              reg157 <= $signed($unsigned(reg147));
              reg158 <= wire139;
              reg159 <= (wire141[(4'hb):(2'h3)] ?
                  $unsigned((reg148[(4'he):(2'h3)] ?
                      $unsigned($signed((8'ha2))) : ((reg148 ?
                              wire141 : reg148) ?
                          (|reg147) : $signed(reg154)))) : (~^reg156[(1'h0):(1'h0)]));
              reg160 <= $signed((reg146[(3'h4):(1'h1)] ?
                  $unsigned($signed(reg154[(2'h2):(1'h0)])) : ($unsigned(reg158) ?
                      {$unsigned(reg146),
                          $signed(reg155)} : reg156[(4'h8):(1'h0)])));
            end
          else
            begin
              reg157 <= $signed(($unsigned($signed(reg158)) ?
                  ((~((8'ha0) ? (8'hb3) : reg155)) ?
                      wire2[(4'hd):(4'h9)] : ((reg159 ?
                          reg154 : reg150) < $signed(wire0))) : ((|wire139) << (reg152 * (+reg160)))));
              reg158 <= (reg149[(3'h7):(3'h5)] == ({$unsigned((reg150 ?
                          wire142 : (8'hb6)))} ?
                  (&(+{reg153})) : {$signed(reg153[(2'h3):(1'h1)])}));
              reg159 <= (~^reg155);
              reg160 <= (wire139[(3'h5):(2'h3)] * ($unsigned(((8'ha5) ?
                      $unsigned(reg144) : $signed(reg156))) ?
                  ($unsigned(reg144) ?
                      ((reg146 ?
                          (7'h41) : reg147) >= (+reg146)) : ((^reg157) >> $unsigned(wire0))) : $unsigned({$unsigned(reg146)})));
              reg161 <= reg157;
            end
          reg162 <= $unsigned((!$signed((+(reg146 ? reg157 : wire139)))));
        end
      else
        begin
          reg154 <= reg144;
          reg155 <= {($signed(wire141[(4'hc):(3'h7)]) ?
                  reg152 : ($unsigned($unsigned(wire139)) ?
                      (~|((8'ha3) || (8'hb0))) : $signed(reg155))),
              (~&$signed(reg153))};
          reg156 <= reg162[(3'h7):(2'h3)];
        end
    end
  assign wire163 = (|$unsigned({(~$signed(reg157)), (7'h44)}));
  assign wire164 = ((reg152[(2'h3):(2'h3)] ?
                       (^reg143) : reg156[(3'h5):(3'h5)]) ^ ((~|($unsigned(reg148) ?
                           wire163[(4'hc):(1'h1)] : $unsigned(reg148))) ?
                       (($unsigned(wire2) >= reg153) <<< ((reg151 << wire141) ?
                           (^reg145) : (~^reg162))) : wire3));
  module165 #() modinst223 (.wire169(reg156), .wire168(reg152), .wire167(wire142), .clk(clk), .y(wire222), .wire166(wire139), .wire170(reg148));
  assign wire224 = reg147;
  assign wire225 = $signed(((|reg162) ?
                       (~$signed((reg151 - reg158))) : $unsigned(reg143)));
  assign wire226 = reg153;
  assign wire227 = (!wire163);
endmodule

module module165  (y, clk, wire170, wire169, wire168, wire167, wire166);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire170;
  input wire signed [(4'hf):(1'h0)] wire169;
  input wire [(4'hc):(1'h0)] wire168;
  input wire [(4'he):(1'h0)] wire167;
  input wire [(4'he):(1'h0)] wire166;
  wire [(4'he):(1'h0)] wire216;
  wire [(5'h12):(1'h0)] wire215;
  wire signed [(3'h7):(1'h0)] wire214;
  wire signed [(5'h13):(1'h0)] wire213;
  wire [(3'h7):(1'h0)] wire212;
  wire signed [(4'he):(1'h0)] wire211;
  wire signed [(5'h10):(1'h0)] wire210;
  wire [(4'hc):(1'h0)] wire209;
  wire signed [(3'h7):(1'h0)] wire208;
  wire signed [(4'h9):(1'h0)] wire207;
  wire signed [(4'ha):(1'h0)] wire206;
  wire signed [(5'h12):(1'h0)] wire193;
  wire signed [(4'hb):(1'h0)] wire192;
  wire signed [(3'h5):(1'h0)] wire189;
  wire signed [(4'he):(1'h0)] wire188;
  wire signed [(4'he):(1'h0)] wire187;
  wire signed [(3'h4):(1'h0)] wire185;
  wire signed [(5'h11):(1'h0)] wire173;
  wire signed [(4'hf):(1'h0)] wire172;
  wire [(5'h14):(1'h0)] wire171;
  reg signed [(5'h12):(1'h0)] reg221 = (1'h0);
  reg [(2'h2):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg217 = (1'h0);
  reg [(5'h15):(1'h0)] reg205 = (1'h0);
  reg [(3'h6):(1'h0)] reg204 = (1'h0);
  reg [(5'h15):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg202 = (1'h0);
  reg [(5'h11):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg200 = (1'h0);
  reg signed [(4'he):(1'h0)] reg199 = (1'h0);
  reg [(2'h2):(1'h0)] reg198 = (1'h0);
  reg [(2'h2):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg196 = (1'h0);
  reg [(4'hb):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg194 = (1'h0);
  reg [(4'hd):(1'h0)] reg191 = (1'h0);
  reg [(5'h10):(1'h0)] reg190 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire193,
                 wire192,
                 wire189,
                 wire188,
                 wire187,
                 wire185,
                 wire173,
                 wire172,
                 wire171,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
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
                 reg191,
                 reg190,
                 (1'h0)};
  assign wire171 = $unsigned(wire168[(1'h1):(1'h0)]);
  assign wire172 = wire168[(3'h4):(3'h4)];
  assign wire173 = wire168;
  module174 #() modinst186 (wire185, clk, wire173, wire170, wire169, wire168);
  assign wire187 = {(^~(((wire166 ? (8'ha1) : (8'hbe)) ?
                           wire169[(4'ha):(3'h5)] : (|wire168)) >> wire170[(5'h11):(4'h8)])),
                       wire167};
  assign wire188 = ($signed(wire170[(3'h6):(1'h0)]) ?
                       $signed($unsigned($unsigned((~&wire167)))) : wire169[(2'h3):(2'h3)]);
  assign wire189 = $unsigned(wire169[(4'hd):(4'hd)]);
  always
    @(posedge clk) begin
      reg190 <= wire173;
      if (wire185[(3'h4):(2'h3)])
        begin
          reg191 <= {($signed((^(+(8'hba)))) || $signed({{wire188, (7'h44)}}))};
        end
      else
        begin
          reg191 <= (((($signed(wire189) < (wire167 ? wire172 : (8'ha1))) ?
                  (wire173[(5'h11):(3'h4)] >> (reg191 ?
                      wire168 : wire171)) : {(wire189 & wire168)}) >>> wire187) ?
              (~$unsigned(((8'hbc) ?
                  wire172[(3'h7):(3'h4)] : (|wire166)))) : $signed((wire172[(4'hd):(4'ha)] ^~ ($signed(wire187) ^~ (+(8'hb1))))));
        end
    end
  assign wire192 = $unsigned((^wire185[(3'h4):(2'h3)]));
  assign wire193 = {($signed($unsigned(wire185)) * {(^{wire166, wire170}),
                           $signed((wire167 | wire192))}),
                       ($signed(reg191[(3'h6):(2'h2)]) ?
                           $unsigned($unsigned($unsigned(reg190))) : reg191)};
  always
    @(posedge clk) begin
      if ($signed((((wire168 ? ((8'ha7) >>> wire185) : wire172) ?
          {wire187} : ((-wire171) ?
              $signed(wire171) : $unsigned(reg191))) > (-(wire170 ?
          wire170[(3'h6):(3'h5)] : {wire189})))))
        begin
          reg194 <= ((8'ha1) ?
              wire168[(2'h2):(1'h0)] : $signed($signed($unsigned(reg191))));
          reg195 <= $unsigned((^~((^(reg190 < wire172)) ?
              ((wire187 << (8'ha8)) ?
                  (wire171 < wire171) : (wire192 < wire172)) : $unsigned((reg194 <= wire168)))));
          reg196 <= {(^wire192[(4'ha):(1'h0)])};
        end
      else
        begin
          reg194 <= wire170[(5'h14):(4'he)];
          reg195 <= ({(((wire171 << wire187) < wire188) ?
                  $unsigned((wire189 != (7'h43))) : (~&(wire187 ?
                      (8'hbe) : reg190)))} != wire166);
          reg196 <= $unsigned(wire170);
        end
      reg197 <= $unsigned(wire192);
      if ($signed((&$signed((|{wire188})))))
        begin
          reg198 <= {$signed($unsigned({wire188, (wire167 >> reg194)})),
              $signed(((&wire192[(4'hb):(2'h3)]) ?
                  $unsigned($unsigned(wire193)) : wire185))};
          reg199 <= (($signed(((+wire167) ?
              wire173[(4'hd):(4'hc)] : (!(8'ha4)))) <= wire167[(3'h6):(2'h3)]) <= ($signed((wire188 ?
              $signed(wire187) : (8'haf))) <= wire193));
          reg200 <= $signed(reg199);
        end
      else
        begin
          reg198 <= (reg191 ?
              reg191 : {{((wire185 != reg190) << wire189)},
                  {wire169[(4'hd):(1'h1)]}});
          if (({$unsigned((~|(8'had))), wire185[(1'h1):(1'h1)]} ?
              (^{wire170[(4'hd):(4'ha)]}) : $unsigned((wire188 ?
                  reg195[(2'h3):(2'h3)] : (8'ha3)))))
            begin
              reg199 <= $signed($unsigned(wire169));
              reg200 <= (~^((-(~^$unsigned(wire171))) ?
                  $unsigned($unsigned($unsigned(wire169))) : ($unsigned(reg194) << (8'haf))));
              reg201 <= $signed(({(+$signed(reg199))} && {(reg198[(1'h0):(1'h0)] == $signed(reg198))}));
              reg202 <= $unsigned($signed(reg196[(5'h15):(5'h13)]));
              reg203 <= (!$signed($signed(wire166[(3'h7):(3'h7)])));
            end
          else
            begin
              reg199 <= $signed(wire192);
              reg200 <= reg191;
              reg201 <= $unsigned(((wire187 ?
                  reg191 : reg197[(1'h0):(1'h0)]) >>> wire188));
            end
          reg204 <= $signed($signed($unsigned($signed((wire166 != reg196)))));
        end
      reg205 <= wire167[(4'he):(3'h5)];
    end
  assign wire206 = {$unsigned((((wire185 >>> wire188) != reg190) >> ((wire169 & wire168) ?
                           wire167[(4'hb):(1'h0)] : $signed((8'ha3)))))};
  assign wire207 = wire168;
  assign wire208 = $unsigned(reg201[(2'h3):(2'h2)]);
  assign wire209 = (&{(({wire168} ?
                               (wire170 ?
                                   wire192 : wire168) : $unsigned(reg190)) ?
                           reg196 : wire193)});
  assign wire210 = (((8'ha1) ?
                       wire208[(1'h1):(1'h0)] : ((~{wire187, wire170}) ?
                           ({wire171} ~^ $unsigned(reg197)) : ((wire206 ~^ (8'ha7)) ?
                               (~^reg202) : {wire187}))) != (~^wire207));
  assign wire211 = (((($signed(wire208) ?
                           ((8'had) & wire170) : ((7'h41) ?
                               (8'had) : wire210)) << reg191) | reg195[(4'hb):(1'h1)]) ?
                       {wire169[(4'hc):(3'h5)], reg198} : ((^~({reg194,
                                   wire208} ?
                               reg205[(3'h6):(2'h3)] : {reg190, (8'ha1)})) ?
                           $signed($unsigned($signed(wire208))) : $unsigned($unsigned((wire193 ?
                               wire169 : reg195)))));
  assign wire212 = reg194[(3'h4):(2'h2)];
  assign wire213 = $unsigned((!(!reg204[(2'h3):(2'h3)])));
  assign wire214 = $unsigned({(!{(wire206 + reg200)})});
  assign wire215 = ($signed($unsigned($unsigned(wire168[(1'h0):(1'h0)]))) <<< wire189[(1'h1):(1'h1)]);
  assign wire216 = ({((wire167[(3'h7):(3'h6)] >= (wire185 ?
                                   (8'hbd) : (7'h44))) ?
                               wire214 : (reg198 == (wire188 ?
                                   wire207 : (8'ha0))))} ?
                       $signed({{{(8'h9d), wire188},
                               {wire215}}}) : (~&{($signed(wire215) ~^ wire167[(3'h5):(2'h2)]),
                           {(7'h41)}}));
  always
    @(posedge clk) begin
      reg217 <= $signed(wire215);
      reg218 <= (&reg196[(3'h6):(2'h2)]);
      if ((reg218[(2'h2):(1'h1)] > (~&(~&((&reg218) ?
          $unsigned(wire169) : (~|wire212))))))
        begin
          reg219 <= $signed(wire170);
          reg220 <= (wire206 != (reg219[(2'h2):(1'h0)] ?
              $signed((|{wire215, reg205})) : $signed($unsigned((|wire169)))));
        end
      else
        begin
          reg219 <= $unsigned(((+(!$unsigned((7'h42)))) ?
              (~^{$unsigned(wire192)}) : (~^($unsigned(reg204) > (|wire213)))));
          reg220 <= $unsigned($unsigned({wire189[(1'h0):(1'h0)]}));
          reg221 <= reg191[(4'hc):(3'h5)];
        end
    end
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(2'h2):(1'h0)] wire6;
  input wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire137;
  wire [(5'h12):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire109;
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  assign y = {wire137,
                 wire86,
                 wire27,
                 wire26,
                 wire25,
                 wire21,
                 wire15,
                 wire11,
                 wire10,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire92,
                 wire109,
                 reg24,
                 reg23,
                 reg22,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = wire7;
  assign wire11 = ({((~|$signed(wire10)) ?
                          $unsigned((!wire5)) : ((wire10 * wire9) >>> wire8[(1'h0):(1'h0)])),
                      {($unsigned(wire8) < (wire7 >= wire9)),
                          (8'hb6)}} || wire6);
  always
    @(posedge clk) begin
      reg12 <= wire7;
      reg13 <= ($signed(({(wire8 && wire9)} ?
          wire8 : wire7[(3'h5):(3'h4)])) ^ ((wire6 << {$unsigned(wire10),
              wire6}) ?
          $signed((8'hb6)) : {(wire11[(1'h1):(1'h0)] >= $unsigned(reg12)),
              $signed(((8'hae) ? wire5 : wire9))}));
      reg14 <= {{$unsigned({wire6, (wire9 ? wire6 : (8'ha0))})},
          (!(|$unsigned(((8'ha9) ? wire10 : (8'h9d)))))};
    end
  assign wire15 = (wire7 ?
                      $signed($unsigned(((wire11 ? (8'hb7) : wire8) ?
                          ((8'hab) ?
                              wire10 : wire10) : wire6[(1'h1):(1'h1)]))) : (^wire7));
  always
    @(posedge clk) begin
      reg16 <= (wire8[(2'h2):(2'h2)] * (8'hb7));
      reg17 <= $unsigned($signed(wire15[(1'h1):(1'h1)]));
      if (reg13[(2'h3):(1'h0)])
        begin
          reg18 <= ((|$signed(reg12[(4'hd):(1'h0)])) >>> (({(~^reg12)} ^~ wire6) >> (8'hac)));
        end
      else
        begin
          reg18 <= (reg18[(3'h7):(2'h2)] ? wire11 : (^~reg14[(4'hb):(4'h8)]));
        end
      reg19 <= reg17;
      reg20 <= (&$signed(((|(!wire15)) ? reg16[(4'hc):(3'h4)] : reg12)));
    end
  assign wire21 = ($signed(reg16) - $signed((^~reg16)));
  always
    @(posedge clk) begin
      if ($signed(reg17))
        begin
          reg22 <= wire7[(2'h3):(2'h3)];
        end
      else
        begin
          reg22 <= (^~{(8'hb2)});
          if (($signed($unsigned($signed((wire10 >= (8'hb6))))) ?
              $signed($signed((^(!wire21)))) : reg12[(2'h3):(2'h2)]))
            begin
              reg23 <= reg17[(3'h6):(1'h0)];
            end
          else
            begin
              reg23 <= $signed(wire11);
              reg24 <= reg12;
            end
        end
    end
  assign wire25 = wire5[(4'ha):(3'h4)];
  assign wire26 = (^~reg23[(4'hc):(4'h9)]);
  assign wire27 = (&$unsigned($signed((|(^~reg13)))));
  module28 #() modinst87 (wire86, clk, wire15, wire26, reg24, wire27);
  assign wire88 = $signed(({$signed(((8'h9c) - wire27)), (8'hb2)} ?
                      $unsigned($unsigned({wire11})) : (^~(!wire6))));
  assign wire89 = {$unsigned(reg22),
                      ({(8'h9f),
                              ((wire27 ? wire10 : (8'h9c)) ?
                                  reg24[(5'h12):(3'h6)] : (reg20 ~^ wire15))} ?
                          wire9 : reg20[(1'h0):(1'h0)])};
  assign wire90 = reg24[(1'h0):(1'h0)];
  assign wire91 = wire7;
  assign wire92 = $unsigned(($signed($unsigned(reg20)) ?
                      (-(wire26 & $signed(wire91))) : $signed({$signed((8'haa)),
                          $signed(wire6)})));
  module93 #() modinst110 (.wire94(wire27), .wire95(wire89), .clk(clk), .y(wire109), .wire97(wire7), .wire96(reg16));
  module111 #() modinst138 (.y(wire137), .clk(clk), .wire115(wire91), .wire113(reg23), .wire112(wire89), .wire114(reg14));
endmodule

module module111  (y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire115;
  input wire signed [(5'h15):(1'h0)] wire114;
  input wire signed [(4'hc):(1'h0)] wire113;
  input wire [(4'h9):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire136;
  wire signed [(5'h14):(1'h0)] wire128;
  wire [(2'h3):(1'h0)] wire127;
  wire signed [(2'h2):(1'h0)] wire126;
  wire [(4'he):(1'h0)] wire125;
  wire signed [(2'h2):(1'h0)] wire124;
  wire [(4'ha):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  wire signed [(3'h4):(1'h0)] wire121;
  wire [(5'h12):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  wire [(3'h7):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire116;
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  assign y = {wire136,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 (1'h0)};
  assign wire116 = (!(8'ha9));
  assign wire117 = ({$signed($signed((wire114 + wire112)))} ?
                       $signed(wire116) : (^~$signed(((wire116 ?
                           (7'h40) : wire115) ~^ {wire114, wire112}))));
  assign wire118 = (^~$unsigned(wire113));
  assign wire119 = ($signed((|$signed(wire118[(2'h3):(2'h2)]))) ?
                       ((wire116 ?
                           $unsigned((~(8'hb6))) : wire113[(3'h6):(1'h1)]) < wire113) : (($unsigned(((8'haa) ?
                               (8'hb8) : wire117)) ?
                           wire113 : wire118[(4'h8):(2'h3)]) * $unsigned(wire118[(1'h0):(1'h0)])));
  assign wire120 = wire112;
  assign wire121 = (+wire119);
  assign wire122 = (!$signed($unsigned((^~(^~wire117)))));
  assign wire123 = (wire118 ?
                       $signed((wire117[(2'h3):(2'h2)] ?
                           $unsigned({wire117}) : $signed(wire122))) : {$signed((wire119[(1'h1):(1'h1)] ?
                               (wire113 < wire112) : wire122))});
  assign wire124 = $unsigned((&(&$signed($unsigned(wire123)))));
  assign wire125 = $signed($signed((~&(~|((8'hb9) ? wire117 : wire113)))));
  assign wire126 = wire115[(2'h3):(2'h2)];
  assign wire127 = wire118[(1'h0):(1'h0)];
  assign wire128 = wire118[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((^{wire127}))
        begin
          if ((~wire114))
            begin
              reg129 <= $unsigned($unsigned($signed({$unsigned(wire126)})));
              reg130 <= (^$unsigned((~|((wire126 ? wire116 : wire126) ?
                  ((8'hb2) ? wire121 : wire113) : wire121[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg129 <= $unsigned(wire112);
              reg130 <= $signed($signed(wire115));
            end
        end
      else
        begin
          if ({({(wire117[(3'h4):(1'h0)] >> wire119)} ?
                  $unsigned((wire115[(3'h5):(2'h3)] ?
                      wire114[(4'hd):(3'h6)] : $signed(wire119))) : $signed(wire121))})
            begin
              reg129 <= wire124;
              reg130 <= (^~{wire113[(4'ha):(3'h5)],
                  ($unsigned(wire119) - (wire123[(2'h2):(2'h2)] || wire127[(1'h0):(1'h0)]))});
              reg131 <= $unsigned(wire126);
              reg132 <= reg130;
            end
          else
            begin
              reg129 <= wire124;
              reg130 <= reg131;
              reg131 <= {$unsigned({{wire127[(2'h2):(1'h1)]},
                      wire121[(1'h0):(1'h0)]}),
                  wire118};
              reg132 <= $unsigned($signed($signed((~&(wire124 && wire125)))));
              reg133 <= $unsigned(((^(wire115[(2'h3):(1'h0)] <= wire118)) ?
                  $unsigned(wire112) : (((|wire123) ?
                      $signed(reg130) : $unsigned(wire113)) || (wire121 < (!(8'h9f))))));
            end
          reg134 <= reg132[(3'h6):(3'h4)];
          reg135 <= wire120;
        end
    end
  assign wire136 = wire127[(1'h0):(1'h0)];
endmodule

module module93  (y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire97;
  input wire [(4'hd):(1'h0)] wire96;
  input wire signed [(3'h4):(1'h0)] wire95;
  input wire [(4'hd):(1'h0)] wire94;
  wire signed [(2'h2):(1'h0)] wire108;
  wire [(4'h8):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire104;
  wire [(4'hf):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 (1'h0)};
  assign wire98 = (!wire94[(4'hb):(3'h7)]);
  assign wire99 = ($unsigned((-($unsigned(wire96) + $unsigned(wire94)))) ?
                      ({$signed($signed(wire96)), $unsigned($signed(wire94))} ?
                          (+((wire96 ?
                              wire95 : wire97) == (7'h44))) : (wire98[(4'hf):(4'hc)] ?
                              wire95 : wire95[(3'h4):(3'h4)])) : (wire98 ?
                          (^($signed(wire94) == (wire94 ^ wire94))) : $signed({(-wire95)})));
  assign wire100 = (^($signed(({(7'h44)} ?
                           $unsigned((8'hbf)) : (wire97 << (8'hbc)))) ?
                       $unsigned($unsigned(wire97[(5'h12):(3'h7)])) : (|wire94)));
  assign wire101 = $unsigned((((wire100[(3'h5):(1'h0)] ?
                               $signed(wire96) : wire95[(3'h4):(2'h3)]) ?
                           (|(|wire96)) : $signed(wire98)) ?
                       wire94[(4'hd):(4'hc)] : $signed(wire96)));
  assign wire102 = $signed($unsigned($unsigned(wire95)));
  assign wire103 = ($unsigned(($unsigned((wire99 && wire96)) + (wire101 <= (wire99 >= wire94)))) ?
                       (8'ha5) : {wire101});
  assign wire104 = {wire101};
  assign wire105 = ($unsigned(wire94[(4'hb):(3'h7)]) > (((~^(^~wire104)) ?
                       $signed((wire97 ^ wire102)) : (wire104[(1'h1):(1'h1)] ?
                           wire95[(1'h1):(1'h0)] : wire102)) <= wire97[(1'h1):(1'h1)]));
  assign wire106 = $unsigned((8'ha0));
  assign wire107 = wire106[(4'h8):(3'h7)];
  assign wire108 = (wire107 ?
                       $signed((wire107[(1'h1):(1'h0)] ?
                           wire99 : wire107[(2'h2):(1'h1)])) : ((~({wire107,
                                   wire107} ?
                               $unsigned(wire99) : (|(8'ha1)))) ?
                           {((wire101 < wire95) ?
                                   (wire104 != wire95) : (wire106 || wire94)),
                               wire105[(2'h3):(1'h0)]} : $signed($signed({wire94,
                               (8'hae)}))));
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h221):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire32;
  input wire [(5'h10):(1'h0)] wire31;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire85;
  wire [(5'h13):(1'h0)] wire64;
  wire signed [(5'h13):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  assign y = {wire85,
                 wire64,
                 wire63,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
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
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg62,
                 reg61,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg33 <= wire32;
      if ({{$unsigned(reg33[(4'hf):(2'h3)])}})
        begin
          reg34 <= $unsigned(wire32[(2'h2):(1'h0)]);
          reg35 <= {wire31[(4'h8):(3'h5)],
              (!$unsigned({(wire31 ? wire32 : wire29)}))};
          reg36 <= reg34;
          if (wire29)
            begin
              reg37 <= (|(($signed(wire29[(3'h4):(1'h1)]) ?
                  reg34[(4'h8):(1'h1)] : reg34[(3'h6):(1'h1)]) != $signed(reg36[(1'h1):(1'h1)])));
              reg38 <= reg34[(2'h2):(1'h0)];
              reg39 <= ((!((((8'hb1) ? reg36 : wire31) < {reg38,
                      wire32}) <<< ((reg37 & wire31) ? wire31 : reg34))) ?
                  $unsigned(reg35[(1'h0):(1'h0)]) : reg34);
              reg40 <= (reg39[(3'h7):(3'h4)] <= $signed($unsigned($unsigned(reg33[(4'h9):(1'h0)]))));
            end
          else
            begin
              reg37 <= reg39[(3'h4):(2'h2)];
              reg38 <= ($unsigned(wire31[(3'h6):(3'h4)]) ~^ (|reg37[(3'h7):(3'h4)]));
            end
        end
      else
        begin
          reg34 <= (-$unsigned({$unsigned(reg38[(2'h3):(1'h1)])}));
          reg35 <= reg35[(1'h1):(1'h1)];
          reg36 <= reg37[(5'h11):(5'h11)];
        end
      reg41 <= $unsigned((reg34 * $unsigned(wire32[(2'h2):(1'h0)])));
    end
  assign wire42 = reg37;
  assign wire43 = reg36;
  assign wire44 = ($unsigned($signed(reg37)) ?
                      ((~(&reg37)) << $signed($signed(reg39))) : ((~&reg33) ?
                          (((~|reg40) | ((8'hbc) ? wire31 : reg37)) ?
                              $signed($unsigned(wire32)) : (7'h41)) : (reg36[(1'h0):(1'h0)] ~^ wire43[(3'h5):(1'h0)])));
  assign wire45 = reg40[(4'hb):(4'h9)];
  assign wire46 = $signed(wire44[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg47 <= {$unsigned(reg35),
          (-(((wire32 ? reg37 : reg34) ?
                  $unsigned(reg39) : (reg39 ? wire46 : wire46)) ?
              (~$signed(wire29)) : $signed($signed(wire44))))};
      reg48 <= $unsigned((~|(reg47 >>> $unsigned(wire31))));
      reg49 <= ({(~&reg38),
          ($signed((^~(8'ha9))) <<< wire29)} << $signed((&($signed(wire31) & (wire31 ?
          reg38 : reg36)))));
      if ({({{$unsigned((8'hb6)), ((8'hba) != reg38)}} ^ wire46),
          $signed(reg38)})
        begin
          if ((!reg49[(3'h7):(3'h6)]))
            begin
              reg50 <= reg49;
              reg51 <= {$signed((~reg36))};
              reg52 <= $signed((|(reg50 ^ (~&((8'haa) | reg40)))));
              reg53 <= ((!reg51[(3'h6):(2'h3)]) << ($signed(reg47) <<< $signed((~^(wire32 ?
                  wire29 : reg39)))));
            end
          else
            begin
              reg50 <= $signed(((wire30 >>> (reg39[(4'hd):(4'ha)] + (!(8'ha3)))) != wire44));
              reg51 <= $signed(reg53[(4'h9):(4'h8)]);
              reg52 <= $signed($unsigned((wire42 | reg40)));
              reg53 <= (reg38[(2'h3):(1'h1)] & $unsigned({$signed((!reg34))}));
              reg54 <= $signed($unsigned((^(~^$signed(wire29)))));
            end
          if ($unsigned(reg50))
            begin
              reg55 <= ((reg47[(2'h3):(2'h3)] ?
                      (($signed((8'hbe)) == wire32[(2'h2):(1'h1)]) ?
                          $signed((wire44 ? reg51 : reg54)) : ((reg39 ?
                                  wire30 : reg52) ?
                              (wire30 ?
                                  wire46 : reg38) : wire44[(3'h4):(3'h4)])) : (|reg48[(1'h1):(1'h0)])) ?
                  wire31 : $signed((~^$signed($unsigned(wire30)))));
              reg56 <= ($unsigned(reg35) + (^(8'ha0)));
              reg57 <= (({(reg54[(3'h4):(3'h4)] <= reg53[(4'h8):(3'h5)]),
                  ($signed((8'h9e)) <= reg41)} && ({{wire45, wire30}} ?
                  $unsigned(reg34) : ($signed(reg47) ?
                      (8'hb6) : $unsigned(wire44)))) ~^ reg48);
              reg58 <= ((~(wire29 + {(wire44 ? reg38 : reg50),
                  reg38})) ^ (+(|{reg51[(2'h3):(2'h2)]})));
              reg59 <= (~^(reg36[(1'h0):(1'h0)] ?
                  $unsigned($unsigned(reg34[(4'h9):(3'h4)])) : ((^~(reg52 ?
                          reg57 : reg52)) ?
                      $unsigned((~^reg47)) : $unsigned({reg47, reg54}))));
            end
          else
            begin
              reg55 <= $unsigned((wire31 >>> reg49[(4'ha):(4'ha)]));
              reg56 <= reg54[(3'h4):(1'h1)];
            end
          reg60 <= $signed(wire31);
          reg61 <= $signed(wire29);
          reg62 <= reg57;
        end
      else
        begin
          reg50 <= $unsigned({reg33[(2'h2):(2'h2)]});
          reg51 <= ({$unsigned({(~|wire32)})} ?
              {({reg49[(5'h15):(5'h10)]} ^~ {(reg33 ? reg53 : reg40)}),
                  $unsigned(((8'hb4) ?
                      reg37[(4'h9):(3'h4)] : (reg55 >= wire32)))} : $signed((reg35[(1'h0):(1'h0)] ?
                  (reg41[(3'h5):(2'h3)] ?
                      (8'hbc) : $unsigned(reg35)) : (reg40[(3'h6):(2'h3)] <<< (^~wire31)))));
        end
    end
  assign wire63 = $unsigned((!($signed($signed(reg59)) ?
                      $signed((wire30 * wire29)) : $signed((reg41 > reg37)))));
  assign wire64 = $signed((|(~&reg34[(3'h7):(1'h1)])));
  always
    @(posedge clk) begin
      if (({(^~{$unsigned((8'hb9)), (reg48 - reg62)})} - {wire63}))
        begin
          if (wire43)
            begin
              reg65 <= (!(reg60[(1'h1):(1'h0)] ?
                  $unsigned($unsigned((wire31 ?
                      wire43 : reg58))) : wire29[(1'h0):(1'h0)]));
              reg66 <= reg52[(3'h5):(2'h3)];
              reg67 <= reg57;
              reg68 <= $unsigned(reg51[(1'h1):(1'h1)]);
            end
          else
            begin
              reg65 <= $signed(wire46[(5'h10):(4'h8)]);
              reg66 <= wire32;
              reg67 <= $signed(((~^(7'h41)) ?
                  ($unsigned(wire64[(1'h0):(1'h0)]) ?
                      $unsigned(reg60[(2'h3):(1'h0)]) : ((reg38 ?
                              reg61 : reg67) ?
                          {reg55} : reg56)) : reg52));
              reg68 <= reg67;
              reg69 <= reg65;
            end
          reg70 <= $unsigned($unsigned(wire31));
          reg71 <= {reg68,
              ($unsigned({wire44[(2'h3):(1'h0)]}) ?
                  $unsigned(wire46) : (reg37[(1'h1):(1'h1)] ?
                      reg60[(3'h4):(2'h2)] : ($signed(reg58) | (reg36 >>> reg67))))};
          if (reg34[(3'h6):(3'h4)])
            begin
              reg72 <= $unsigned((reg65[(1'h0):(1'h0)] ?
                  ((~^$unsigned(reg39)) && $signed({wire42,
                      reg39})) : $signed(wire63[(5'h10):(2'h2)])));
              reg73 <= reg39;
            end
          else
            begin
              reg72 <= {(wire31 != $signed($signed($signed(reg56))))};
              reg73 <= $signed((^$signed(reg38[(1'h1):(1'h1)])));
              reg74 <= {($signed(wire44) ?
                      (reg50[(5'h14):(4'he)] ?
                          reg47 : ((^~reg49) << wire30[(1'h1):(1'h0)])) : ($signed((wire32 ?
                          wire43 : wire44)) < (reg67 ?
                          $signed(reg33) : reg67)))};
              reg75 <= wire64;
            end
        end
      else
        begin
          if (reg36)
            begin
              reg65 <= reg71;
              reg66 <= $unsigned((~$signed($unsigned($unsigned(reg47)))));
              reg67 <= reg36[(2'h3):(2'h2)];
            end
          else
            begin
              reg65 <= wire45;
              reg66 <= (reg74 ?
                  {{reg34},
                      ({{reg69}} ?
                          ((reg59 < reg34) < $unsigned(reg38)) : $unsigned(wire46[(5'h14):(4'hf)]))} : (reg59 ?
                      reg66 : wire42));
              reg67 <= reg53[(4'hb):(1'h0)];
              reg68 <= $signed((-($signed({(8'hba)}) ?
                  (-(!wire45)) : (reg41 ? $signed(reg49) : (reg57 >> reg50)))));
            end
          if ($unsigned($unsigned({($signed(reg36) ? $signed(reg72) : wire31),
              (|$signed(reg55))})))
            begin
              reg69 <= reg67[(3'h7):(3'h4)];
              reg70 <= wire29;
            end
          else
            begin
              reg69 <= reg61[(3'h7):(3'h4)];
              reg70 <= $signed(($signed($unsigned((reg38 ? (8'hb7) : reg55))) ?
                  ($unsigned((reg59 ? wire32 : reg40)) ?
                      reg53 : (((8'ha5) ? reg55 : (8'hbd)) ?
                          reg60 : (reg52 <= wire30))) : (reg75[(3'h4):(1'h1)] ?
                      $signed(reg71) : reg70)));
            end
          if (wire42)
            begin
              reg71 <= {$signed(reg41[(4'h8):(1'h1)]),
                  $signed(reg35[(2'h2):(1'h1)])};
              reg72 <= (wire44[(3'h4):(1'h1)] ?
                  (-reg66[(4'hc):(3'h7)]) : (&(reg41 ?
                      $signed((~(8'hbe))) : reg66)));
              reg73 <= $unsigned({$signed((^~(reg53 ^ reg41))),
                  $unsigned({reg57, reg66[(3'h6):(3'h6)]})});
              reg74 <= (wire64 ?
                  (wire46 ?
                      $unsigned((7'h44)) : ($unsigned($signed(wire45)) ?
                          (|(|reg53)) : (reg40[(4'he):(3'h7)] ?
                              (reg50 ~^ reg48) : $unsigned(reg69)))) : $unsigned((^~((-reg69) && reg60))));
            end
          else
            begin
              reg71 <= (reg74[(2'h2):(1'h0)] + reg70);
            end
          reg75 <= ((reg56[(4'he):(4'h9)] ?
                  ((^wire64) ?
                      $unsigned((reg47 ?
                          reg70 : reg73)) : reg55[(1'h1):(1'h0)]) : ($signed((~|reg68)) * ((wire46 ?
                      reg48 : reg33) >> (wire46 ? wire64 : (8'hbb))))) ?
              (~$signed(reg37[(4'ha):(4'h9)])) : (8'hbc));
        end
      reg76 <= $unsigned($signed(wire29));
      if ($signed(reg61))
        begin
          reg77 <= $signed({wire64[(4'hb):(1'h0)]});
          reg78 <= (~^$signed((&($signed(reg38) ?
              (wire43 ? reg68 : wire30) : (8'ha0)))));
          reg79 <= $signed($signed((((reg75 || wire42) && {reg40}) ?
              wire31[(3'h6):(3'h6)] : reg59[(3'h6):(1'h1)])));
        end
      else
        begin
          reg77 <= reg51[(1'h1):(1'h1)];
          if ($unsigned((8'ha4)))
            begin
              reg78 <= (((reg53[(4'hc):(4'h9)] ?
                          wire42 : ($signed(reg36) ^~ $unsigned(reg79))) ?
                      $unsigned((reg56 ?
                          reg33 : ((7'h43) <= wire44))) : (^$signed(wire32))) ?
                  {wire45,
                      $signed(($signed(reg69) ?
                          reg41 : $unsigned(reg77)))} : (~$signed((reg49 ?
                      $unsigned((8'ha7)) : reg79))));
              reg79 <= reg59[(3'h5):(1'h0)];
            end
          else
            begin
              reg78 <= reg55[(1'h1):(1'h1)];
              reg79 <= wire43;
            end
          if (((8'hbb) ?
              reg50[(5'h14):(5'h13)] : $unsigned(((~|$signed(wire43)) == $unsigned(reg34)))))
            begin
              reg80 <= $signed($signed($unsigned(($signed(wire30) == reg69[(2'h3):(1'h1)]))));
            end
          else
            begin
              reg80 <= $unsigned($unsigned($unsigned(wire30)));
            end
          reg81 <= {(&{(~^$signed(reg53)), (7'h43)})};
          reg82 <= $signed(($unsigned(($signed(reg49) ?
              (~^reg48) : (8'hbc))) >= ($signed((~|reg50)) && reg52)));
        end
      if ((^$signed((($signed(wire29) & (wire29 ? reg54 : reg75)) | (&{reg36,
          reg70})))))
        begin
          reg83 <= reg65[(1'h1):(1'h0)];
        end
      else
        begin
          reg83 <= ($unsigned(((^(reg54 ^ (8'hbc))) && (^~$signed(reg49)))) ?
              $signed($signed({(8'hbf)})) : ((-$signed((-(7'h43)))) > reg55[(2'h3):(2'h2)]));
          reg84 <= wire31;
        end
    end
  assign wire85 = reg39[(4'hf):(4'h9)];
endmodule

module module174  (y, clk, wire178, wire177, wire176, wire175);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire178;
  input wire signed [(3'h6):(1'h0)] wire177;
  input wire signed [(4'hf):(1'h0)] wire176;
  input wire signed [(4'hc):(1'h0)] wire175;
  wire [(3'h6):(1'h0)] wire184;
  wire [(2'h2):(1'h0)] wire181;
  wire [(5'h14):(1'h0)] wire180;
  wire [(5'h13):(1'h0)] wire179;
  reg signed [(4'ha):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg182 = (1'h0);
  assign y = {wire184, wire181, wire180, wire179, reg183, reg182, (1'h0)};
  assign wire179 = (wire176 * ($unsigned((|(wire178 ? wire176 : wire176))) ?
                       ({$unsigned(wire175),
                           (wire178 ?
                               (7'h43) : wire177)} >>> ($unsigned(wire178) ?
                           $unsigned(wire178) : (~&(7'h42)))) : wire175[(1'h0):(1'h0)]));
  assign wire180 = wire179;
  assign wire181 = (|(~|wire179[(4'h9):(3'h7)]));
  always
    @(posedge clk) begin
      reg182 <= $signed(wire180);
      reg183 <= {wire180[(3'h4):(3'h4)]};
    end
  assign wire184 = $signed(($unsigned(wire177[(1'h1):(1'h1)]) ?
                       $unsigned(wire176) : wire175));
endmodule
