module top
#(parameter param211 = ((((~&((8'ha0) ? (8'ha6) : (8'hb2))) && {((8'hb3) > (8'ha0)), (~(8'hac))}) ? ((((7'h44) ? (8'ha4) : (8'ha3)) ? ((8'hb1) ? (8'hbb) : (8'ha2)) : ((8'hbb) ? (8'hb9) : (8'hbf))) ? (^~(-(8'hb5))) : (((8'hba) ? (8'ha4) : (7'h43)) ? (-(7'h41)) : ((7'h40) ? (7'h42) : (8'hb6)))) : ((~^((8'ha3) & (8'hb6))) * (((8'hb7) ? (8'hbc) : (8'haf)) | {(8'hb7), (8'hb3)}))) <= (|((((8'ha5) ? (8'hb4) : (8'hb7)) ? {(8'hbf), (8'hab)} : ((8'hb4) ~^ (8'hbe))) ? ((~|(8'ha6)) ? ((8'hac) > (8'hb9)) : (!(8'hb7))) : ({(8'ha1), (8'hba)} * ((8'ha8) + (8'ha5)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h336):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire210;
  wire signed [(2'h3):(1'h0)] wire209;
  wire [(4'hb):(1'h0)] wire173;
  wire signed [(5'h11):(1'h0)] wire172;
  wire [(3'h7):(1'h0)] wire171;
  wire [(4'hd):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(5'h10):(1'h0)] wire195;
  wire [(2'h2):(1'h0)] wire196;
  wire [(5'h15):(1'h0)] wire202;
  wire signed [(3'h7):(1'h0)] wire203;
  wire signed [(3'h6):(1'h0)] wire204;
  wire signed [(4'hc):(1'h0)] wire205;
  wire signed [(3'h6):(1'h0)] wire207;
  reg signed [(2'h3):(1'h0)] reg170 = (1'h0);
  reg [(3'h5):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg168 = (1'h0);
  reg [(4'h9):(1'h0)] reg167 = (1'h0);
  reg [(5'h15):(1'h0)] reg166 = (1'h0);
  reg [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(3'h6):(1'h0)] reg164 = (1'h0);
  reg [(4'hf):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg160 = (1'h0);
  reg signed [(4'he):(1'h0)] reg159 = (1'h0);
  reg [(5'h10):(1'h0)] reg158 = (1'h0);
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg156 = (1'h0);
  reg [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg152 = (1'h0);
  reg [(4'hf):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg [(3'h4):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg144 = (1'h0);
  reg [(5'h13):(1'h0)] reg175 = (1'h0);
  reg [(3'h5):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg177 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg178 = (1'h0);
  reg [(5'h12):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg180 = (1'h0);
  reg [(5'h11):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg182 = (1'h0);
  reg [(4'h8):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(5'h15):(1'h0)] reg186 = (1'h0);
  reg [(4'hc):(1'h0)] reg187 = (1'h0);
  reg [(4'hb):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg189 = (1'h0);
  reg [(4'h9):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg191 = (1'h0);
  reg [(4'hb):(1'h0)] reg192 = (1'h0);
  reg [(3'h7):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg197 = (1'h0);
  reg [(4'hd):(1'h0)] reg198 = (1'h0);
  reg [(5'h13):(1'h0)] reg199 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg200 = (1'h0);
  reg [(4'h8):(1'h0)] reg201 = (1'h0);
  assign y = {wire210,
                 wire209,
                 wire173,
                 wire172,
                 wire171,
                 wire5,
                 wire6,
                 wire68,
                 wire142,
                 wire195,
                 wire196,
                 wire202,
                 wire203,
                 wire204,
                 wire205,
                 wire207,
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
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg197,
                 reg198,
                 reg199,
                 reg200,
                 reg201,
                 (1'h0)};
  assign wire5 = (wire3[(5'h10):(3'h6)] | (($signed((!wire1)) ?
                     (wire4 ? (wire0 > wire1) : (wire1 + wire0)) : ({wire2,
                         wire3} ^~ (-wire3))) >= ($signed($unsigned((8'hab))) | wire3)));
  assign wire6 = (&(~|($signed({wire1}) ~^ $unsigned($signed(wire1)))));
  module7 #() modinst69 (.wire9(wire1), .wire10(wire3), .wire11(wire4), .clk(clk), .wire8(wire2), .y(wire68));
  module70 #() modinst143 (.wire73(wire68), .wire75(wire1), .clk(clk), .y(wire142), .wire71(wire4), .wire72(wire6), .wire74(wire0));
  always
    @(posedge clk) begin
      reg144 <= wire142;
      reg145 <= (((7'h43) ?
          (wire2 && wire5[(1'h1):(1'h1)]) : ($signed({wire4}) ?
              ({wire0} ?
                  ((8'ha0) || (8'ha6)) : $unsigned(wire0)) : $unsigned(wire5[(1'h0):(1'h0)]))) >>> {$unsigned(wire3[(5'h12):(3'h7)]),
          (7'h42)});
      reg146 <= (8'hb2);
      if ($unsigned($unsigned($unsigned(wire5[(4'hb):(1'h0)]))))
        begin
          if ((!(~&wire3[(1'h1):(1'h0)])))
            begin
              reg147 <= wire2[(4'hb):(1'h0)];
            end
          else
            begin
              reg147 <= $signed((wire6 ?
                  wire4[(2'h2):(2'h2)] : ($unsigned($unsigned(wire1)) * {wire4[(4'ha):(4'h8)],
                      (wire68 - reg147)})));
            end
          if ($unsigned(reg144[(2'h3):(1'h0)]))
            begin
              reg148 <= wire68;
              reg149 <= ({(^{reg146})} ?
                  wire4[(3'h6):(2'h3)] : {({wire1[(5'h13):(1'h1)]} < $signed($signed((8'hac))))});
              reg150 <= reg144;
              reg151 <= {reg150[(4'hd):(3'h7)],
                  ($signed(wire68[(4'he):(1'h0)]) ?
                      {($signed((8'hba)) && (wire68 ? reg145 : wire6)),
                          $unsigned($signed(wire68))} : wire4)};
              reg152 <= $signed(((8'hb7) ?
                  ((wire0 >= $unsigned(wire142)) ?
                      wire5 : wire1) : ($signed((^reg145)) & $signed(wire0))));
            end
          else
            begin
              reg148 <= (~reg149);
              reg149 <= ($signed($unsigned($signed($signed((8'hb6))))) + ((!reg149) ?
                  (|(wire2 ?
                      reg152 : reg144[(4'hf):(4'he)])) : $signed((^~(reg150 >= wire3)))));
              reg150 <= (wire4 ?
                  $unsigned({(reg148[(1'h1):(1'h1)] >= $signed(reg145))}) : wire3[(3'h7):(2'h2)]);
              reg151 <= ($signed(wire1[(3'h4):(2'h3)]) >>> $unsigned(reg144[(1'h0):(1'h0)]));
              reg152 <= wire5[(3'h4):(3'h4)];
            end
          reg153 <= (-$signed((+wire68[(4'h8):(3'h5)])));
          reg154 <= $signed(wire68);
          if (($signed({(^~reg153[(1'h0):(1'h0)]),
                  ((~wire142) ? reg153 : (~^reg150))}) ?
              $signed(wire5[(3'h7):(3'h5)]) : (~wire5)))
            begin
              reg155 <= $unsigned(($unsigned(reg154[(1'h0):(1'h0)]) != (7'h40)));
              reg156 <= reg151;
            end
          else
            begin
              reg155 <= ($signed({wire4[(4'hc):(4'ha)],
                  (^(reg147 > wire3))}) <= (!({wire2[(3'h5):(1'h0)]} ?
                  $signed(reg153[(1'h0):(1'h0)]) : ($unsigned(reg150) | wire5))));
              reg156 <= reg154[(2'h2):(1'h1)];
              reg157 <= (reg152[(3'h5):(2'h3)] < $unsigned(wire3));
              reg158 <= (reg157[(2'h3):(1'h0)] >>> reg154[(1'h0):(1'h0)]);
              reg159 <= $unsigned($signed(($unsigned((^~wire4)) ?
                  wire5 : ($unsigned(wire4) ~^ (reg149 ? reg156 : reg156)))));
            end
        end
      else
        begin
          reg147 <= $unsigned(wire142[(2'h3):(1'h1)]);
          if (reg147[(5'h12):(4'hd)])
            begin
              reg148 <= ((($signed((wire3 ? reg157 : wire6)) ?
                      reg159[(4'hb):(4'hb)] : (!$signed(reg153))) | (~wire68[(4'h9):(3'h7)])) ?
                  reg155 : ((&((reg155 ?
                      wire4 : (8'ha3)) && $signed(reg150))) > $unsigned({$signed(wire6),
                      wire0[(5'h13):(4'hc)]})));
              reg149 <= reg147[(4'h8):(3'h5)];
              reg150 <= (reg150[(4'he):(3'h7)] >>> ((|reg158) ?
                  wire68[(5'h11):(4'hc)] : wire3));
              reg151 <= (~&{$signed(reg158[(4'hb):(3'h7)])});
              reg152 <= reg146;
            end
          else
            begin
              reg148 <= wire0[(3'h4):(3'h4)];
              reg149 <= {(~&((wire5 >> (reg154 ? reg158 : wire142)) ?
                      wire6 : $unsigned((wire3 >>> wire68)))),
                  (wire5[(1'h1):(1'h1)] ? $unsigned({{reg155}}) : (+wire1))};
              reg150 <= $signed($signed((8'ha1)));
            end
        end
      reg160 <= {$signed($signed((8'hbd))),
          $signed((^$unsigned($signed(wire2))))};
    end
  always
    @(posedge clk) begin
      reg161 <= (+(&(((wire1 ? (8'hb9) : (8'h9e)) | $signed(reg152)) ?
          (&(reg157 ? reg155 : wire4)) : (reg148[(1'h0):(1'h0)] <<< (reg152 ?
              reg148 : reg152)))));
      reg162 <= $signed(reg154);
      reg163 <= ((reg155[(1'h1):(1'h1)] & reg145[(4'hf):(4'hd)]) ?
          $signed((~$signed($unsigned(reg151)))) : (reg155[(2'h2):(1'h1)] ?
              reg148 : $unsigned(($unsigned(reg155) * (+reg147)))));
      if ($unsigned((~wire5)))
        begin
          if ((((~|($unsigned(reg161) < {reg160})) ?
              reg146 : wire3) <= $unsigned((8'h9d))))
            begin
              reg164 <= wire4[(1'h0):(1'h0)];
              reg165 <= (!$unsigned((~$signed((reg153 ? wire68 : wire68)))));
              reg166 <= ((~(|$signed(wire142[(1'h0):(1'h0)]))) == {(8'ha1)});
            end
          else
            begin
              reg164 <= reg161[(4'hc):(1'h1)];
              reg165 <= (!$signed($signed((+(wire5 != reg162)))));
              reg166 <= reg146;
              reg167 <= reg148[(1'h1):(1'h1)];
            end
          reg168 <= reg164;
          reg169 <= $signed((($signed(wire142) << reg147[(3'h7):(3'h7)]) ?
              reg151[(3'h5):(3'h5)] : ((8'hb5) ?
                  (7'h42) : (reg163 + reg164[(1'h1):(1'h0)]))));
          reg170 <= $unsigned(wire3);
        end
      else
        begin
          reg164 <= ($unsigned((wire3[(3'h4):(1'h0)] > {$signed(reg150)})) ^ reg150);
        end
    end
  assign wire171 = {$unsigned((reg149[(3'h5):(1'h0)] <= {{reg159, reg148},
                           $unsigned((8'hbd))}))};
  assign wire172 = reg161;
  module76 #() modinst174 (wire173, clk, reg162, wire172, reg166, reg152);
  always
    @(posedge clk) begin
      if ($signed({(&reg161[(3'h7):(3'h4)])}))
        begin
          reg175 <= {(-$unsigned($signed($unsigned(reg149)))),
              ((~&($unsigned(reg157) <<< $unsigned(reg153))) ?
                  ($signed((reg147 ? reg151 : reg148)) ?
                      (&reg152[(4'h8):(4'h8)]) : reg145) : $unsigned((8'had)))};
          if ((~&wire5[(3'h5):(2'h3)]))
            begin
              reg176 <= (wire3[(5'h10):(2'h2)] ?
                  ((~^(reg147 ?
                      (reg159 ? wire172 : reg159) : (reg152 ?
                          reg154 : reg163))) >>> wire0[(3'h5):(2'h3)]) : ($unsigned((|{reg156})) ^ $signed(($unsigned((8'hb0)) <= (reg166 <= reg144)))));
              reg177 <= ($signed($signed((~&((8'h9c) ?
                  wire171 : reg146)))) >> (&reg165));
              reg178 <= reg159;
            end
          else
            begin
              reg176 <= ($signed(wire2[(3'h4):(2'h2)]) && $unsigned({$unsigned(reg164),
                  $signed(reg160)}));
              reg177 <= {(reg157 > reg152)};
              reg178 <= ((^(reg160 ?
                  (reg156 ? $signed(reg153) : (~reg154)) : ({reg170, reg153} ?
                      $unsigned(wire68) : (wire4 < wire171)))) && $signed((~$unsigned($signed(reg147)))));
            end
          reg179 <= (reg153[(2'h2):(1'h0)] << (~&$unsigned($signed($signed(reg148)))));
        end
      else
        begin
          if ($signed($signed((~^reg176[(1'h0):(1'h0)]))))
            begin
              reg175 <= wire142[(3'h7):(1'h1)];
              reg176 <= (reg165 ?
                  ({{(wire68 < wire172)}} >= $signed(reg164)) : $unsigned($signed(($signed(reg146) ?
                      $unsigned(reg167) : $unsigned(wire5)))));
              reg177 <= wire1;
              reg178 <= reg166[(3'h7):(3'h5)];
              reg179 <= $unsigned(((7'h42) ?
                  ($signed($unsigned(wire142)) >>> ((reg161 <<< reg160) ^ reg144)) : (((reg156 || reg144) ?
                          {reg166, (8'hb5)} : $unsigned(wire5)) ?
                      $signed($signed(reg175)) : reg161[(4'hd):(4'h9)])));
            end
          else
            begin
              reg175 <= reg177;
              reg176 <= (~$unsigned(reg162));
            end
          if (wire173)
            begin
              reg180 <= (reg167[(4'h8):(2'h3)] <= $unsigned(($signed($unsigned((8'hab))) >> ($signed(reg160) >>> (!reg149)))));
              reg181 <= $signed(($signed(((8'ha0) ?
                  (~&reg162) : reg145[(4'he):(4'hd)])) < (&reg168)));
              reg182 <= reg179;
              reg183 <= ((reg155 ?
                  (+reg157) : ((&$signed(wire3)) ?
                      (^reg160[(1'h0):(1'h0)]) : $signed((^~(8'ha2))))) << ((~reg146[(2'h2):(1'h0)]) ?
                  ($unsigned((wire173 ?
                      reg145 : reg166)) < $unsigned($unsigned(reg147))) : {$signed($signed(reg164)),
                      $unsigned($signed(reg175))}));
              reg184 <= $unsigned(({reg177[(4'h8):(3'h7)],
                      wire6[(3'h6):(1'h0)]} ?
                  reg145[(5'h12):(2'h2)] : $signed(reg169)));
            end
          else
            begin
              reg180 <= $signed(((reg146 ?
                  reg182 : $signed((reg179 ?
                      wire3 : reg183))) && (~(~&$unsigned(reg146)))));
              reg181 <= reg165;
              reg182 <= (((($unsigned((8'ha8)) <<< $unsigned(wire142)) ?
                      wire6[(4'hc):(4'h8)] : $signed((-(8'hb5)))) ^ reg148[(1'h1):(1'h1)]) ?
                  $unsigned(reg154[(3'h4):(3'h4)]) : reg177[(3'h6):(1'h0)]);
              reg183 <= (&reg166[(3'h5):(1'h1)]);
              reg184 <= reg162[(4'hb):(3'h4)];
            end
          reg185 <= {(-((((8'ha8) ? reg156 : reg180) ?
                  (reg154 ?
                      (8'ha3) : wire2) : $signed(reg163)) | $unsigned(wire2[(4'he):(4'hd)]))),
              $signed({(((8'ha3) + (8'ha5)) ?
                      $signed(wire142) : (reg179 ? wire1 : (8'ha1))),
                  ((reg146 == reg161) ?
                      reg162[(4'ha):(4'ha)] : $unsigned(reg164))})};
          reg186 <= (^~$unsigned($signed((reg166[(5'h11):(4'hd)] ?
              {reg147, reg183} : $unsigned(reg150)))));
          reg187 <= (-(&$signed(reg186)));
        end
      reg188 <= reg158[(4'ha):(3'h7)];
      reg189 <= $signed(reg185);
      if ($signed(((~|$unsigned(reg184[(2'h3):(2'h2)])) ?
          wire171[(1'h1):(1'h0)] : $unsigned(($unsigned(reg162) ^ $signed(reg159))))))
        begin
          reg190 <= $unsigned(wire2);
          reg191 <= $unsigned({reg182[(2'h3):(1'h1)],
              ({(wire142 != reg154), reg156[(2'h2):(1'h0)]} ?
                  $unsigned(reg188[(2'h3):(2'h2)]) : {reg170,
                      $unsigned(reg182)})});
        end
      else
        begin
          reg190 <= $signed((|{(reg161 ?
                  reg184[(4'he):(3'h7)] : reg181[(3'h6):(3'h5)])}));
          if (({{$unsigned(((8'ha6) ^~ reg147)), (8'hbb)}} ?
              reg148[(3'h6):(2'h3)] : $unsigned($signed(((wire68 ?
                  reg185 : reg157) ~^ (reg152 || reg164))))))
            begin
              reg191 <= (((8'hbc) + reg151) ?
                  (+{(8'hbe)}) : {(((wire171 ? reg178 : reg156) ?
                          reg152[(3'h4):(1'h0)] : (reg181 < reg144)) != reg152[(2'h2):(1'h1)])});
              reg192 <= (8'h9e);
            end
          else
            begin
              reg191 <= ((8'hb8) > wire172[(5'h11):(4'hf)]);
              reg192 <= ((~&(wire0[(5'h14):(5'h12)] ?
                      $signed(reg179[(3'h7):(2'h3)]) : (reg179[(4'hc):(3'h5)] ?
                          (reg166 ^ reg152) : $unsigned(wire4)))) ?
                  (($unsigned({reg185}) >= $signed((wire171 ?
                          wire1 : reg168))) ?
                      ($unsigned((|wire5)) + reg183[(3'h6):(3'h4)]) : reg190) : $unsigned({(8'ha4),
                      reg176[(1'h1):(1'h0)]}));
              reg193 <= ($unsigned((8'ha2)) ?
                  ($signed((&(!(8'h9c)))) >> (($unsigned(reg154) ?
                      reg144[(3'h6):(2'h2)] : reg189[(4'hf):(4'hc)]) ~^ ($signed(reg181) <<< reg156[(3'h4):(1'h0)]))) : ($unsigned($unsigned(wire171[(1'h1):(1'h1)])) ?
                      wire173 : $unsigned(reg157)));
              reg194 <= reg151[(3'h7):(3'h4)];
            end
        end
    end
  assign wire195 = (~|reg154[(1'h0):(1'h0)]);
  assign wire196 = wire195;
  always
    @(posedge clk) begin
      reg197 <= $unsigned((+(+{{reg155, wire5}})));
      reg198 <= ((reg197[(1'h1):(1'h1)] ?
          {(|wire196)} : (-{((8'ha3) ? (7'h43) : reg152),
              ((8'h9e) ? reg155 : (8'had))})) != reg193);
      reg199 <= $unsigned((-($signed($signed(reg146)) ?
          reg184 : reg169[(3'h5):(2'h3)])));
      reg200 <= ((^{$unsigned(wire1), $unsigned($unsigned(reg163))}) ?
          {(&$unsigned((reg180 - wire68))),
              (~^$unsigned((!wire172)))} : $unsigned($signed(($unsigned(reg177) ?
              (|reg148) : $signed(reg159)))));
      reg201 <= (reg191[(2'h3):(2'h2)] ?
          reg199[(5'h11):(4'h8)] : $unsigned((reg186 ?
              ((^wire196) ^ wire6[(3'h6):(3'h4)]) : reg187)));
    end
  assign wire202 = {(~$unsigned(reg176[(3'h4):(3'h4)]))};
  assign wire203 = $signed((^~($unsigned(reg147) ?
                       wire196 : ($signed(reg152) ?
                           (8'h9d) : $signed(reg190)))));
  assign wire204 = (8'ha6);
  module76 #() modinst206 (wire205, clk, wire202, wire68, wire4, wire203);
  module76 #() modinst208 (wire207, clk, reg157, reg160, wire202, reg193);
  assign wire209 = reg167[(3'h4):(2'h3)];
  assign wire210 = $signed($signed($unsigned(reg185)));
endmodule

module module70
#(parameter param141 = {({(((8'hab) << (8'had)) <<< ((8'hbd) ? (8'hb2) : (8'hb0)))} - {(|(~|(8'hbb)))}), (((~{(8'ha7)}) * ({(8'hb9), (8'ha5)} ? (^(8'hb9)) : (-(8'h9c)))) <= ((!((8'ha6) ? (8'hbf) : (8'ha2))) << ((~|(8'hb8)) ? ((8'hb3) ? (8'ha0) : (8'ha4)) : ((8'hb8) ? (8'ha2) : (8'hab)))))})
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire75;
  input wire signed [(5'h10):(1'h0)] wire74;
  input wire signed [(5'h13):(1'h0)] wire73;
  input wire signed [(4'hf):(1'h0)] wire72;
  input wire signed [(5'h15):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire139;
  wire signed [(4'hd):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire133;
  wire signed [(3'h4):(1'h0)] wire132;
  wire [(2'h3):(1'h0)] wire131;
  wire signed [(3'h6):(1'h0)] wire129;
  wire [(5'h11):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire99;
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire133,
                 wire132,
                 wire131,
                 wire129,
                 wire101,
                 wire99,
                 reg135,
                 reg134,
                 (1'h0)};
  module76 #() modinst100 (.wire80(wire74), .clk(clk), .wire79(wire72), .wire77(wire73), .y(wire99), .wire78(wire71));
  assign wire101 = $unsigned((({$signed(wire71)} != ((~^(7'h44)) >> $unsigned((8'hbb)))) + $unsigned(((wire75 ?
                       wire99 : wire75) - {wire99, wire99}))));
  module102 #() modinst130 (.clk(clk), .wire104(wire75), .y(wire129), .wire103(wire73), .wire106(wire99), .wire105(wire74));
  assign wire131 = wire74[(2'h3):(1'h0)];
  assign wire132 = wire71;
  assign wire133 = wire132;
  always
    @(posedge clk) begin
      reg134 <= wire133[(4'ha):(3'h6)];
      reg135 <= $signed((^(wire75[(3'h5):(1'h0)] ?
          $unsigned($unsigned(wire131)) : $signed((wire71 ?
              wire74 : wire73)))));
    end
  assign wire136 = {$unsigned(wire101)};
  assign wire137 = wire101;
  assign wire138 = wire129[(2'h2):(1'h0)];
  assign wire139 = {$signed(wire75)};
  assign wire140 = (|wire75);
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire59;
  wire [(3'h7):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire62,
                 wire61,
                 wire59,
                 wire21,
                 wire20,
                 wire13,
                 wire12,
                 reg64,
                 reg63,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire12 = $signed((wire9[(2'h2):(1'h1)] ?
                      wire10[(4'h9):(2'h3)] : wire8[(4'h8):(3'h5)]));
  assign wire13 = {{(wire8[(4'h9):(3'h7)] ? (|$signed((8'hb8))) : wire9)}};
  always
    @(posedge clk) begin
      reg14 <= {({(^((8'hb1) | wire10)),
              $signed($signed(wire12))} >>> $unsigned({(wire8 ?
                  wire10 : wire12),
              wire11}))};
      reg15 <= (~$signed(wire11));
      reg16 <= wire13[(2'h3):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg17 <= wire10;
      reg18 <= $signed({$signed((~^reg17))});
      reg19 <= reg15[(4'h8):(1'h1)];
    end
  assign wire20 = {($signed($unsigned((reg18 - wire11))) * (reg14[(4'h8):(3'h4)] ?
                          $unsigned($signed(wire13)) : (~&reg15[(1'h0):(1'h0)]))),
                      reg15[(1'h0):(1'h0)]};
  assign wire21 = ((^~((wire8[(3'h4):(2'h3)] ^ {wire12, wire8}) ?
                      reg14[(1'h1):(1'h0)] : wire12[(4'h9):(1'h0)])) && (8'ha5));
  module22 #() modinst60 (wire59, clk, reg16, reg15, wire21, reg14, wire9);
  assign wire61 = ($unsigned(($signed(reg17) != $unsigned(wire20))) < (^$unsigned(((wire20 <<< wire59) ?
                      $unsigned(reg19) : (&reg16)))));
  assign wire62 = wire21[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ({(($unsigned(reg14[(3'h4):(1'h0)]) >> ($unsigned(wire12) - reg19)) ?
              (-{$signed(reg16), {(8'h9c)}}) : ({$signed((8'hbe)),
                      (reg14 ? wire12 : wire9)} ?
                  reg14[(3'h4):(3'h4)] : ($unsigned(wire61) ?
                      (reg15 - wire59) : {reg14, reg18}))),
          $signed(wire8[(4'hb):(4'h9)])})
        begin
          reg63 <= wire61[(1'h0):(1'h0)];
        end
      else
        begin
          reg63 <= reg19;
        end
      reg64 <= ($signed(wire11[(3'h4):(2'h3)]) << ($signed((reg17[(1'h0):(1'h0)] ?
              $signed(wire13) : $signed(reg14))) ?
          ($signed(wire13[(1'h0):(1'h0)]) ?
              (wire8 && wire12[(3'h7):(2'h3)]) : ({wire10,
                  wire10} ^~ (~wire21))) : ($signed(reg18) >>> ({wire62,
              (8'ha6)} + $signed(reg17)))));
    end
  assign wire65 = reg17[(1'h0):(1'h0)];
  assign wire66 = reg64;
  assign wire67 = $signed((~^(~^(|(!wire61)))));
endmodule

module module22  (y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire27;
  input wire [(4'hd):(1'h0)] wire26;
  input wire [(3'h7):(1'h0)] wire25;
  input wire signed [(3'h6):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
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
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(($signed(wire27[(4'hc):(4'hb)]) >> wire26[(1'h0):(1'h0)])))
        begin
          if (wire26[(3'h7):(2'h3)])
            begin
              reg28 <= ($unsigned((^~wire25[(2'h3):(2'h3)])) && (wire25[(2'h2):(1'h0)] ?
                  {$unsigned(wire27[(5'h10):(1'h0)]),
                      (~&{(7'h44)})} : ($unsigned((~&wire25)) ?
                      (8'ha1) : $unsigned(((8'hae) ? wire24 : wire23)))));
            end
          else
            begin
              reg28 <= {(!$unsigned(((|wire25) || (-reg28))))};
              reg29 <= (reg28 < (wire26[(1'h1):(1'h0)] ?
                  $unsigned($unsigned((-wire27))) : (reg28[(5'h10):(3'h7)] ?
                      (wire26 || {wire23, reg28}) : wire27[(3'h5):(1'h0)])));
              reg30 <= (wire25 ?
                  (($signed($unsigned((8'h9d))) ^ (^(~|wire23))) != (^({wire23} ?
                      wire25 : wire26[(3'h4):(2'h3)]))) : (wire24 ?
                      $signed((~^(reg28 || wire24))) : (8'hb2)));
            end
          reg31 <= $unsigned($unsigned($signed(wire25[(3'h7):(1'h0)])));
          reg32 <= wire25[(3'h5):(1'h0)];
          reg33 <= (wire26 ?
              wire23 : $signed((wire25 ?
                  reg31[(4'h8):(1'h1)] : $signed((^~reg32)))));
          if ($unsigned(reg29[(1'h0):(1'h0)]))
            begin
              reg34 <= wire24;
              reg35 <= wire23;
              reg36 <= ((~(reg34[(4'h8):(3'h7)] != wire24)) ?
                  (reg32 || (8'hbc)) : reg30);
              reg37 <= ({$unsigned(wire24)} ?
                  $unsigned(reg31) : ((-(-$unsigned(wire24))) ?
                      reg35 : $unsigned(reg29)));
              reg38 <= (~|(wire26[(3'h6):(2'h3)] ?
                  ($unsigned(reg31[(4'ha):(2'h2)]) ~^ (reg34 && $unsigned(wire23))) : reg30[(3'h4):(3'h4)]));
            end
          else
            begin
              reg34 <= (8'h9d);
            end
        end
      else
        begin
          reg28 <= wire24;
          reg29 <= wire27[(4'hf):(2'h3)];
        end
      reg39 <= {(&(((~|reg32) <= $signed(wire26)) != (~{wire27, reg31}))),
          (~$signed(reg30[(3'h6):(3'h4)]))};
      if ($unsigned(reg28[(3'h7):(2'h2)]))
        begin
          reg40 <= $unsigned(((^~{(~reg33), (reg33 ? reg31 : wire26)}) ?
              $unsigned(reg32[(4'ha):(4'ha)]) : {$signed((^wire23))}));
          reg41 <= $signed((+((8'hae) ?
              reg28 : ((wire24 ? reg35 : reg40) >= (8'ha2)))));
          reg42 <= $unsigned(($signed((&(-reg30))) ^~ (reg38 ?
              (+$unsigned((8'hab))) : reg30[(2'h2):(1'h1)])));
          reg43 <= (8'hb5);
        end
      else
        begin
          reg40 <= reg34[(2'h3):(1'h1)];
          reg41 <= (!reg40);
          reg42 <= $unsigned(($unsigned(((reg39 >> reg32) ^ $signed(reg35))) == reg29[(3'h7):(3'h4)]));
        end
      reg44 <= $signed(reg35);
    end
  assign wire45 = ((8'ha9) ? reg35[(4'h8):(2'h3)] : (-{reg35}));
  assign wire46 = $signed((~&(reg41 ?
                      {reg42, (reg33 | reg28)} : reg36[(4'ha):(2'h2)])));
  assign wire47 = $unsigned(reg44[(1'h0):(1'h0)]);
  assign wire48 = ((&(~^$signed((reg39 ? wire27 : reg35)))) << ((^wire25) ?
                      $unsigned(((8'hb7) ?
                          $signed(reg43) : wire46[(1'h1):(1'h1)])) : (({wire46,
                          reg30} | $signed(reg29)) << (reg43[(1'h1):(1'h0)] ?
                          reg43[(3'h4):(2'h2)] : (reg41 || wire26)))));
  assign wire49 = (reg28 >= reg34[(4'hb):(4'h8)]);
  assign wire50 = $signed($unsigned(($unsigned({reg35}) >> ((~^wire48) <<< $unsigned(wire23)))));
  assign wire51 = $signed(reg39);
  assign wire52 = reg42[(4'hc):(4'h8)];
  assign wire53 = $unsigned($signed((8'hae)));
  assign wire54 = $signed({reg33, (-reg43)});
  assign wire55 = $unsigned(wire45[(4'h8):(1'h1)]);
  assign wire56 = reg34[(4'hb):(4'ha)];
  assign wire57 = (-$unsigned((!{$signed(wire49), (~&wire47)})));
  assign wire58 = (8'hb0);
endmodule

module module102
#(parameter param127 = (8'ha7), 
parameter param128 = {((param127 ? param127 : {(^param127)}) ? (~&((8'hb7) | (param127 >= param127))) : param127)})
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire106;
  input wire [(4'ha):(1'h0)] wire105;
  input wire [(5'h14):(1'h0)] wire104;
  input wire [(5'h13):(1'h0)] wire103;
  wire [(2'h3):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire121;
  wire signed [(3'h6):(1'h0)] wire120;
  wire signed [(3'h4):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire118;
  wire signed [(2'h2):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire116;
  wire [(5'h12):(1'h0)] wire115;
  wire [(5'h14):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire [(4'ha):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire108;
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg107 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 reg124,
                 reg123,
                 reg122,
                 reg107,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg107 <= $signed((8'hab));
    end
  assign wire108 = (((!$signed($signed((8'hae)))) ?
                           (wire106 << $signed($signed((8'hb2)))) : (~|($unsigned(reg107) ?
                               (reg107 ~^ reg107) : (|wire104)))) ?
                       ($unsigned(wire104) ?
                           {{wire103,
                                   wire105}} : ($signed(wire106) >= $unsigned(reg107))) : wire106);
  assign wire109 = $signed(({(~$unsigned(reg107)),
                           ($unsigned(wire103) ?
                               (wire108 ~^ wire103) : $signed(reg107))} ?
                       $unsigned(reg107) : ((8'hb2) - (((8'hb4) ^ wire105) ?
                           (reg107 ?
                               wire108 : (8'hbc)) : wire105[(2'h3):(2'h3)]))));
  assign wire110 = reg107[(1'h1):(1'h1)];
  assign wire111 = wire108;
  assign wire112 = (wire105[(4'h9):(2'h2)] ?
                       $unsigned((+$unsigned({wire109, wire103}))) : (wire104 ?
                           $unsigned(wire106[(4'h8):(3'h6)]) : (~&{(reg107 ?
                                   wire109 : wire110),
                               (~&(7'h44))})));
  assign wire113 = {$unsigned(wire109)};
  assign wire114 = ((~({((8'hb4) || (8'ha5))} ?
                           wire106[(4'ha):(4'h9)] : $unsigned((wire112 ?
                               (7'h44) : (8'ha2))))) ?
                       ($signed(({wire108, wire109} ?
                               (^~wire110) : {wire108, wire106})) ?
                           (wire105 ?
                               (~(wire106 ^~ wire105)) : ((wire105 ^~ wire106) >> $unsigned(wire112))) : (wire109[(3'h7):(2'h3)] ?
                               ((~^wire110) ?
                                   reg107 : (^wire111)) : $unsigned((8'hb2)))) : wire109[(4'h8):(3'h7)]);
  assign wire115 = {wire103[(4'ha):(3'h5)],
                       $signed(((~&(-wire105)) || wire112))};
  assign wire116 = $unsigned(((^~$signed((&wire106))) ?
                       wire105[(3'h5):(2'h2)] : wire104[(4'hf):(4'hd)]));
  assign wire117 = (8'hac);
  assign wire118 = wire109[(2'h3):(2'h2)];
  assign wire119 = ((|wire108) << wire109);
  assign wire120 = $unsigned(($signed(({reg107} ?
                           reg107[(4'hb):(1'h1)] : (~|wire115))) ?
                       ((wire111[(1'h0):(1'h0)] < wire106[(3'h4):(2'h3)]) ~^ $unsigned((~&(8'had)))) : $signed(wire110[(3'h4):(2'h2)])));
  assign wire121 = $unsigned(($unsigned((wire103[(3'h5):(2'h3)] ?
                           (~|wire117) : $unsigned(wire117))) ?
                       {(((8'hab) ? wire106 : wire104) ?
                               (wire116 ?
                                   wire111 : wire110) : (wire103 <= wire114)),
                           wire118} : (!$unsigned(wire108[(4'hc):(1'h0)]))));
  always
    @(posedge clk) begin
      reg122 <= $unsigned((~$unsigned({(wire106 ? wire110 : wire119),
          wire110})));
      reg123 <= $unsigned($signed(wire115));
    end
  always
    @(posedge clk) begin
      reg124 <= $signed(wire116);
    end
  assign wire125 = $signed((wire115 >= ((wire114 | (wire111 & wire110)) ?
                       $signed(wire119[(2'h3):(1'h1)]) : ((&wire117) ^~ wire118))));
  assign wire126 = reg123;
endmodule

module module76  (y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire80;
  input wire [(4'hf):(1'h0)] wire79;
  input wire [(5'h15):(1'h0)] wire78;
  input wire [(3'h7):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire98;
  wire [(4'hd):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire81;
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire81,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire81 = $unsigned(wire79[(4'ha):(4'h9)]);
  always
    @(posedge clk) begin
      reg82 <= ($unsigned(wire81[(4'h9):(1'h1)]) == wire81[(4'h9):(3'h7)]);
      reg83 <= (reg82 ?
          $signed({$unsigned({(8'hbd), wire78})}) : ((^~{(wire78 && reg82),
                  $signed(wire77)}) ?
              wire81 : (|($signed(wire78) ?
                  $signed(reg82) : $signed((8'hae))))));
      reg84 <= $signed(((|($signed(reg82) ? {wire78} : $signed(wire80))) ?
          $unsigned((+(~|(8'hbf)))) : $signed(({reg82,
              reg83} >= wire78[(4'hd):(4'h8)]))));
      reg85 <= $unsigned((wire77[(2'h3):(2'h3)] ?
          wire78[(1'h0):(1'h0)] : $unsigned(wire77[(3'h7):(1'h0)])));
      if ((8'hae))
        begin
          if (($unsigned(wire78) ?
              ((!(!wire81)) < ({(wire80 <= (8'hb9)),
                  wire81} >>> wire79[(4'hc):(4'ha)])) : ($signed((|(+reg85))) ?
                  (^~(wire80[(4'h8):(1'h1)] ?
                      wire81 : (reg83 ?
                          wire81 : (8'hac)))) : ((~|$unsigned(reg84)) - wire79))))
            begin
              reg86 <= (wire80 < reg83[(1'h1):(1'h1)]);
              reg87 <= wire78[(3'h6):(3'h5)];
            end
          else
            begin
              reg86 <= $signed(wire80);
              reg87 <= {(8'hb3)};
            end
          reg88 <= reg86;
          reg89 <= (($unsigned((^~$unsigned(reg87))) == (+$unsigned(reg86[(1'h0):(1'h0)]))) ?
              wire77 : (+$signed((+$signed((8'ha2))))));
          reg90 <= ((((^$unsigned(reg83)) <<< ({wire77,
              reg88} ^ (reg86 > (8'hb0)))) ^ reg83[(4'hd):(1'h1)]) && (8'h9d));
        end
      else
        begin
          reg86 <= (^$signed(reg82[(3'h4):(1'h1)]));
          reg87 <= $unsigned({reg90[(1'h1):(1'h0)]});
          reg88 <= ($unsigned($signed($signed((wire80 ~^ wire77)))) ?
              $unsigned(($signed(reg83) ?
                  $unsigned(wire80[(1'h0):(1'h0)]) : (|reg88[(2'h2):(2'h2)]))) : {reg90,
                  $signed(reg87[(1'h1):(1'h0)])});
        end
    end
  assign wire91 = {reg90, (~&reg88[(1'h0):(1'h0)])};
  assign wire92 = $unsigned(reg83[(3'h4):(3'h4)]);
  assign wire93 = {(^reg90[(5'h13):(3'h7)])};
  assign wire94 = $unsigned($unsigned(({wire93[(4'hb):(1'h0)],
                      ((8'ha4) + reg86)} <= wire92[(4'h8):(2'h3)])));
  assign wire95 = {{((~|$unsigned(wire92)) ?
                              wire81[(4'h9):(4'h9)] : (~(wire92 ?
                                  (8'hba) : wire93))),
                          reg85}};
  assign wire96 = reg83;
  assign wire97 = {{reg82}};
  assign wire98 = $unsigned(reg82);
endmodule
