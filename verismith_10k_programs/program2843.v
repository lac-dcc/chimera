module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire131;
  wire signed [(3'h6):(1'h0)] wire133;
  wire [(5'h13):(1'h0)] wire134;
  wire signed [(4'hd):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire136;
  wire signed [(4'h8):(1'h0)] wire198;
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire131,
                 wire133,
                 wire134,
                 wire135,
                 wire136,
                 wire198,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = (wire3 ? wire2 : (wire4 - wire0[(4'hf):(3'h4)]));
  assign wire6 = (($signed(wire3[(3'h6):(3'h5)]) < (wire4 ?
                     (~|(wire5 ~^ wire0)) : (^wire3))) - $signed($signed((!wire5[(3'h4):(1'h1)]))));
  assign wire7 = ($unsigned($unsigned(wire1[(5'h10):(1'h0)])) < wire0[(3'h6):(2'h3)]);
  module8 #() modinst132 (.wire12(wire1), .wire10(wire0), .clk(clk), .wire9(wire4), .y(wire131), .wire11(wire2));
  assign wire133 = (|((((wire5 == wire1) >= (wire0 ?
                       wire0 : wire4)) << (+wire7[(4'hf):(3'h7)])) ~^ $signed(wire2[(4'he):(3'h7)])));
  assign wire134 = wire0[(4'h9):(3'h4)];
  assign wire135 = (~|(wire134[(1'h1):(1'h0)] && $signed((^(^wire5)))));
  assign wire136 = (~|$signed($unsigned(wire2[(3'h7):(1'h1)])));
  module137 #() modinst199 (.y(wire198), .clk(clk), .wire139(wire1), .wire141(wire4), .wire138(wire0), .wire140(wire2), .wire142(wire134));
endmodule

module module137
#(parameter param196 = ((^~{{{(8'hac)}, (-(8'hb7))}, (|(^(8'hbc)))}) && {({((8'hbd) ^ (8'hbb))} ? ({(7'h44), (8'hb6)} * (-(8'hb4))) : (((7'h42) * (8'hac)) << ((8'hb4) >>> (8'ha7)))), ((+((8'hac) >= (8'h9e))) ? ((8'h9c) ~^ ((8'hb3) ? (8'h9f) : (8'hbe))) : ((7'h44) << ((8'had) ? (7'h44) : (8'ha2))))}), 
parameter param197 = (((-((param196 ? param196 : param196) + param196)) ? (param196 ? param196 : (param196 ? (param196 >>> param196) : param196)) : {(&param196), {param196}}) << (~{param196})))
(y, clk, wire142, wire141, wire140, wire139, wire138);
  output wire [(32'h285):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire142;
  input wire [(4'hd):(1'h0)] wire141;
  input wire signed [(4'hd):(1'h0)] wire140;
  input wire [(4'hf):(1'h0)] wire139;
  input wire [(3'h6):(1'h0)] wire138;
  wire [(5'h12):(1'h0)] wire195;
  wire [(4'he):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire151;
  wire signed [(4'ha):(1'h0)] wire150;
  wire [(2'h2):(1'h0)] wire149;
  wire signed [(3'h7):(1'h0)] wire148;
  wire signed [(4'hd):(1'h0)] wire147;
  wire signed [(5'h13):(1'h0)] wire146;
  wire [(4'h9):(1'h0)] wire145;
  wire signed [(4'hd):(1'h0)] wire144;
  wire signed [(5'h10):(1'h0)] wire143;
  reg signed [(3'h4):(1'h0)] reg194 = (1'h0);
  reg [(4'hb):(1'h0)] reg193 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg191 = (1'h0);
  reg [(5'h10):(1'h0)] reg190 = (1'h0);
  reg [(5'h13):(1'h0)] reg189 = (1'h0);
  reg [(4'hd):(1'h0)] reg188 = (1'h0);
  reg [(5'h11):(1'h0)] reg187 = (1'h0);
  reg [(5'h15):(1'h0)] reg186 = (1'h0);
  reg signed [(4'he):(1'h0)] reg185 = (1'h0);
  reg [(4'hc):(1'h0)] reg184 = (1'h0);
  reg [(3'h5):(1'h0)] reg183 = (1'h0);
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg [(5'h15):(1'h0)] reg181 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg180 = (1'h0);
  reg [(5'h10):(1'h0)] reg179 = (1'h0);
  reg [(5'h10):(1'h0)] reg178 = (1'h0);
  reg [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg176 = (1'h0);
  reg [(4'ha):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg171 = (1'h0);
  reg [(3'h7):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg168 = (1'h0);
  reg [(4'hb):(1'h0)] reg167 = (1'h0);
  reg [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg164 = (1'h0);
  reg [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(4'ha):(1'h0)] reg160 = (1'h0);
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg156 = (1'h0);
  reg [(5'h12):(1'h0)] reg155 = (1'h0);
  reg [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  assign y = {wire195,
                 wire165,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
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
                 reg153,
                 reg152,
                 (1'h0)};
  assign wire143 = $signed(wire140[(4'hb):(3'h5)]);
  assign wire144 = (^~($unsigned(((wire140 ? wire140 : (8'hac)) ?
                       wire140[(3'h7):(1'h0)] : (wire140 ~^ wire138))) + wire140));
  assign wire145 = ($signed(wire141[(1'h0):(1'h0)]) ?
                       (wire138 + ($signed({wire143}) <= {wire143[(4'ha):(2'h2)],
                           (wire139 ?
                               wire144 : wire138)})) : (^~(wire144[(4'h8):(2'h3)] ?
                           wire144[(3'h6):(1'h0)] : wire141[(4'h9):(1'h0)])));
  assign wire146 = $signed(wire144);
  assign wire147 = wire141;
  assign wire148 = (!(wire139[(4'ha):(1'h1)] ?
                       wire141[(2'h3):(1'h0)] : ($unsigned(((8'haa) != wire141)) ?
                           {((8'ha9) & wire144)} : ({wire138,
                               wire140} | $unsigned(wire144)))));
  assign wire149 = $unsigned(wire143);
  assign wire150 = wire142;
  assign wire151 = (7'h40);
  always
    @(posedge clk) begin
      reg152 <= $unsigned($signed((^{(wire144 | wire149), $signed(wire138)})));
      if ((wire148[(1'h1):(1'h1)] ?
          wire145[(4'h9):(2'h3)] : $unsigned((~^$unsigned($signed(wire149))))))
        begin
          reg153 <= $unsigned(((!$unsigned(wire139)) ~^ wire139[(2'h2):(1'h0)]));
          reg154 <= {$signed({wire143[(2'h3):(2'h3)]})};
          if ((wire150[(3'h4):(2'h2)] <<< $signed((^(8'ha8)))))
            begin
              reg155 <= wire150;
              reg156 <= reg154;
              reg157 <= (^~{(8'hb9)});
              reg158 <= ({$unsigned(($signed(wire145) ?
                          $unsigned((8'hb3)) : {wire145, wire144})),
                      (!wire139)} ?
                  (($unsigned((reg152 ? (8'haa) : reg154)) ?
                      ($signed(wire138) && $signed(wire144)) : ((&reg154) ?
                          $unsigned(wire141) : (wire147 ?
                              wire145 : wire150))) * ($unsigned((^~wire139)) ?
                      $signed($unsigned(wire145)) : ($signed(wire149) ?
                          (reg153 < wire144) : $signed((8'hae))))) : ({(wire138 ?
                          ((8'ha4) == reg153) : (~^(8'haa)))} - ((wire141 <<< ((8'ha9) > wire141)) >= {(~&reg154),
                      (wire141 ? wire148 : wire148)})));
              reg159 <= wire149[(1'h0):(1'h0)];
            end
          else
            begin
              reg155 <= (!$unsigned((~|($signed(reg159) ?
                  (wire141 > reg155) : $unsigned(wire144)))));
              reg156 <= wire143;
              reg157 <= wire147;
            end
          if (($signed(wire138[(2'h2):(1'h1)]) && $signed((wire151[(1'h0):(1'h0)] || reg158[(5'h10):(3'h4)]))))
            begin
              reg160 <= (~(7'h42));
              reg161 <= $signed(((~$unsigned(reg154)) * $unsigned(reg160[(2'h2):(2'h2)])));
              reg162 <= reg161;
            end
          else
            begin
              reg160 <= ($unsigned(($unsigned((~^wire141)) < ((wire143 < wire151) | (reg154 << wire147)))) * reg152);
              reg161 <= reg155[(3'h7):(3'h7)];
              reg162 <= (&((&(|(wire144 == wire146))) <<< wire139[(4'h8):(3'h5)]));
              reg163 <= ((!wire139[(3'h5):(3'h4)]) ?
                  {($unsigned((+reg158)) ?
                          (-(wire150 ?
                              (7'h41) : wire139)) : (+(~^reg155)))} : $signed($unsigned(($unsigned((8'ha2)) + $signed(reg157)))));
              reg164 <= (wire150 ?
                  wire148 : $unsigned($signed(((~&wire146) && wire145))));
            end
        end
      else
        begin
          reg153 <= (wire151 ?
              $unsigned(reg163) : $unsigned(($unsigned(wire151[(2'h2):(1'h1)]) ?
                  wire148[(2'h3):(1'h0)] : wire143)));
          reg154 <= wire138;
          if ((($signed(reg156) >> wire151[(2'h2):(2'h2)]) ?
              wire147[(2'h3):(2'h2)] : {(reg155 >= {((8'h9e) ?
                          wire150 : wire146),
                      wire147})}))
            begin
              reg155 <= $signed($signed((+(wire151 >>> (~&reg158)))));
              reg156 <= wire138;
              reg157 <= wire150[(4'h8):(1'h1)];
              reg158 <= (+(|(&$unsigned(wire139[(3'h4):(3'h4)]))));
            end
          else
            begin
              reg155 <= wire151;
              reg156 <= reg160[(4'ha):(4'h9)];
            end
          reg159 <= ($unsigned(wire143) ? (8'ha0) : reg163);
          reg160 <= {$signed((((~wire142) ? $unsigned(wire138) : {wire150}) ?
                  $signed($unsigned(reg155)) : wire149)),
              (~&(^~$unsigned($signed(reg160))))};
        end
    end
  assign wire165 = wire145[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg166 <= $signed($unsigned(({$unsigned(reg164), $unsigned(reg155)} ?
          (8'hb2) : (reg160[(4'h9):(4'h8)] && $signed(wire149)))));
      if ($signed(wire145[(2'h3):(1'h0)]))
        begin
          if ($unsigned((~(({wire148} < reg161) ?
              $unsigned(reg160) : wire143))))
            begin
              reg167 <= (wire139 & (~&{(reg155 ?
                      $unsigned(reg159) : (~&reg152)),
                  {(reg160 ~^ wire141), wire139}}));
              reg168 <= reg156[(2'h2):(1'h0)];
              reg169 <= wire140;
              reg170 <= ($unsigned(((wire142[(4'hc):(1'h0)] >> (-reg169)) ?
                      reg155 : (reg154[(4'hd):(1'h0)] <<< $signed(reg154)))) ?
                  ($signed($unsigned(reg154[(1'h0):(1'h0)])) * $signed({((8'hb4) ^ reg164)})) : $unsigned($signed(reg166[(1'h1):(1'h0)])));
            end
          else
            begin
              reg167 <= $unsigned({wire145});
              reg168 <= reg167;
              reg169 <= ($signed($signed((|wire139))) ?
                  (((+$signed(reg169)) ? reg166[(2'h2):(1'h0)] : wire144) ?
                      reg159 : ($unsigned(reg163[(1'h0):(1'h0)]) ?
                          (wire143 < (!reg159)) : reg160[(1'h1):(1'h1)])) : ($signed((!$unsigned(wire140))) ?
                      wire140 : $unsigned($signed($signed(reg159)))));
              reg170 <= (!{reg161[(4'hd):(4'h8)]});
              reg171 <= ({(8'h9f)} >= $unsigned((~|(8'hac))));
            end
          if ({{((!reg163[(3'h7):(3'h7)]) << wire165),
                  $signed(reg168[(2'h3):(1'h1)])},
              {($unsigned($unsigned((8'hbe))) ?
                      ((+reg157) ? (~wire151) : $unsigned(reg155)) : (reg161 ?
                          ((7'h41) | wire140) : (wire141 < (8'hba)))),
                  $unsigned(((wire148 >> reg170) ?
                      (!wire142) : $signed(reg171)))}})
            begin
              reg172 <= reg163[(2'h3):(2'h3)];
              reg173 <= $signed(({($signed(wire147) ?
                      (!wire149) : wire165[(4'he):(3'h6)])} || ($signed($signed(reg156)) ?
                  ((wire141 ?
                      wire145 : reg172) >> $unsigned(reg169)) : {(!(8'had)),
                      wire149})));
              reg174 <= (wire140 ?
                  wire165 : ($signed((!reg168)) <= reg173[(3'h6):(1'h0)]));
            end
          else
            begin
              reg172 <= $unsigned(reg171);
              reg173 <= wire147[(2'h3):(1'h0)];
              reg174 <= ($unsigned({((reg153 ? (8'hbd) : reg155) + (reg158 ?
                          reg168 : wire149)),
                      {(reg168 ? (7'h43) : reg163)}}) ?
                  $signed(reg152) : $signed((reg155 ?
                      ($signed(reg164) ?
                          wire149[(1'h1):(1'h0)] : $unsigned(reg154)) : (-(-wire142)))));
              reg175 <= reg163;
            end
          reg176 <= reg159[(3'h6):(3'h6)];
          reg177 <= (reg166[(1'h1):(1'h0)] || wire143[(4'h8):(2'h2)]);
        end
      else
        begin
          reg167 <= (($signed(((reg159 ? reg176 : wire145) ?
                  (!wire146) : $unsigned(wire142))) && ($signed($unsigned(wire165)) ?
                  (|reg161) : (wire145[(3'h6):(2'h2)] ?
                      reg155 : {reg152, reg167}))) ?
              (~$unsigned($unsigned(reg159))) : $unsigned((+(~&(wire143 < (8'hbb))))));
          reg168 <= (8'hb6);
          reg169 <= {(!{(reg173[(4'h9):(3'h5)] ?
                      (reg162 ? wire148 : reg158) : $unsigned(reg173))})};
        end
      reg178 <= $unsigned((((8'h9f) <<< $unsigned(reg161[(3'h7):(2'h3)])) ?
          $signed($signed(((8'hb4) ?
              wire148 : reg169))) : (^~((reg160 > reg152) ?
              (wire148 ? reg176 : reg159) : (~|wire146)))));
      if ($signed(((^~($unsigned(wire142) ?
              $unsigned(reg155) : ((8'hbc) <= reg167))) ?
          (!reg154[(3'h7):(1'h0)]) : ({(&reg170), reg176[(3'h5):(2'h3)]} ?
              ((~&wire148) ?
                  reg164 : reg156[(2'h2):(1'h0)]) : $signed(reg166)))))
        begin
          reg179 <= (^(-$signed(reg153)));
          reg180 <= (-$unsigned($signed(reg171[(5'h12):(1'h0)])));
          reg181 <= $unsigned(wire165[(3'h7):(3'h5)]);
          reg182 <= $unsigned($signed($signed($unsigned((8'haa)))));
          reg183 <= $signed($signed((~|($signed(reg175) ?
              $unsigned(reg180) : $signed(wire165)))));
        end
      else
        begin
          reg179 <= ((8'hba) > ((~|reg166[(2'h3):(1'h1)]) ?
              (~&((reg157 - wire151) & reg178[(1'h0):(1'h0)])) : reg159[(3'h5):(1'h0)]));
          if ($unsigned(reg155))
            begin
              reg180 <= {(((reg172 ?
                      wire148 : $signed(reg156)) >= ((reg180 >>> (8'hb5)) ?
                      wire150 : wire149[(2'h2):(1'h1)])) << {reg181[(4'hf):(1'h0)],
                      ((reg164 < reg153) ?
                          $unsigned(wire151) : $signed(wire140))})};
              reg181 <= wire144[(2'h3):(1'h0)];
            end
          else
            begin
              reg180 <= (($signed(((wire148 >>> (8'h9f)) ?
                          $signed(reg162) : $signed((8'hbf)))) ?
                      $unsigned((reg170 <<< (wire141 ?
                          wire139 : reg168))) : reg182[(4'h8):(1'h0)]) ?
                  ($signed($unsigned($signed(reg178))) ^ ((reg178 ?
                      $signed(reg166) : (-reg180)) < ((wire151 ?
                          wire151 : wire139) ?
                      ((8'hbd) >>> (8'ha0)) : {wire138,
                          reg177}))) : ((-($unsigned((7'h41)) <= $unsigned(reg159))) <= $signed(wire140[(3'h5):(2'h3)])));
            end
          reg182 <= wire138;
          reg183 <= $unsigned($signed(reg183));
        end
      if (reg162[(4'hf):(1'h0)])
        begin
          reg184 <= (+({$unsigned(reg163),
              (reg179[(4'hf):(2'h2)] ?
                  (-reg176) : (reg177 | reg166))} < (+reg161)));
          if ($signed((~^wire144[(3'h4):(2'h3)])))
            begin
              reg185 <= $unsigned((+(((~^reg160) >= (wire147 ?
                  (8'hbc) : reg154)) && (reg154[(4'hc):(2'h3)] != wire165))));
              reg186 <= ((reg164 ?
                      wire139[(3'h7):(3'h7)] : $unsigned(($signed(reg175) ^~ $signed(reg157)))) ?
                  $signed((8'hb6)) : $signed(($signed($unsigned(reg184)) ?
                      ($signed((8'h9c)) ?
                          (|(7'h42)) : $unsigned((8'hae))) : reg170[(1'h1):(1'h1)])));
              reg187 <= ((reg153 >> reg186) <<< $signed(reg177));
              reg188 <= reg173;
            end
          else
            begin
              reg185 <= ((7'h42) ?
                  {reg154} : {$unsigned(reg164), $signed((8'ha8))});
              reg186 <= (^~((8'hb6) << (~^$unsigned(((8'hb4) ?
                  reg156 : reg168)))));
              reg187 <= (~^(~|(-$signed(reg158))));
              reg188 <= reg166[(2'h2):(1'h0)];
            end
          if (wire144)
            begin
              reg189 <= (reg176 ?
                  {{$unsigned((reg172 ? wire151 : wire151))},
                      (~&$signed({reg162, wire149}))} : (^(|{(|wire143)})));
              reg190 <= {$signed($signed((|$signed((8'hbb))))),
                  ($unsigned((reg179[(4'hd):(4'h9)] ?
                          $signed(reg172) : $signed(reg167))) ?
                      ((^~$signed(reg182)) <<< ((8'hb0) ?
                          $signed(reg154) : $signed(reg177))) : $signed((|(reg178 ?
                          reg154 : reg173))))};
              reg191 <= $signed((^~$signed({reg188[(1'h1):(1'h0)],
                  reg187[(4'h8):(1'h0)]})));
              reg192 <= reg179;
              reg193 <= {wire144[(4'hb):(4'h8)], (8'ha3)};
            end
          else
            begin
              reg189 <= (~^((8'hba) ?
                  (~$signed((+reg152))) : (($unsigned(wire145) >> (reg189 >>> wire144)) ?
                      (reg159 ?
                          ((8'hb9) == reg177) : {reg177,
                              (8'hb0)}) : ($unsigned(reg166) ?
                          reg163 : (-reg155)))));
              reg190 <= (($unsigned(reg192) ?
                  wire144 : (~^$signed($signed(reg172)))) >> (&((^{reg170}) ?
                  $signed({(8'hbf)}) : {reg187[(4'h8):(2'h3)]})));
              reg191 <= $signed(reg158[(4'he):(3'h6)]);
              reg192 <= reg190[(3'h7):(2'h2)];
            end
        end
      else
        begin
          if ({$signed(($signed($unsigned(reg183)) ?
                  (8'hb5) : $unsigned(reg189[(1'h1):(1'h0)])))})
            begin
              reg184 <= $signed((($signed(wire140[(3'h4):(2'h3)]) - wire143[(3'h7):(3'h5)]) ?
                  ((reg170[(3'h4):(2'h3)] ^~ ((8'ha1) ?
                      wire144 : wire149)) * ((~(7'h44)) >> $signed(wire142))) : $signed(reg153[(3'h5):(2'h2)])));
              reg185 <= ($unsigned(reg157) + ((!reg166) | (reg161[(1'h1):(1'h0)] ?
                  reg193[(1'h0):(1'h0)] : ($signed(wire141) ?
                      reg189[(1'h0):(1'h0)] : {reg154, reg154}))));
            end
          else
            begin
              reg184 <= (^(8'ha6));
              reg185 <= ($signed(($unsigned($signed(reg189)) ?
                  $signed($unsigned(reg172)) : reg172[(5'h12):(4'hf)])) * ($signed(reg192) ?
                  wire149[(1'h0):(1'h0)] : $unsigned(reg166)));
              reg186 <= reg169;
              reg187 <= ((($signed($signed(reg152)) ?
                      wire146[(2'h3):(1'h1)] : ($unsigned((8'had)) ?
                          wire143[(3'h7):(1'h0)] : (~(8'haa)))) ?
                  $unsigned((((8'hb1) ? reg192 : reg169) ?
                      wire142 : {reg153,
                          reg172})) : reg190[(4'hb):(3'h5)]) <= wire151);
            end
          if ($unsigned($unsigned((wire148 ?
              wire145[(3'h7):(1'h1)] : $unsigned(reg175)))))
            begin
              reg188 <= reg157[(1'h0):(1'h0)];
              reg189 <= {$signed($unsigned((-$signed(reg192))))};
            end
          else
            begin
              reg188 <= (~&(|$signed($signed((reg152 | reg190)))));
              reg189 <= reg154[(1'h1):(1'h1)];
              reg190 <= (~&wire138[(2'h3):(2'h3)]);
              reg191 <= wire148;
            end
          reg192 <= (wire145[(3'h4):(2'h2)] ?
              (^~(reg162 ?
                  (+{(8'had),
                      (8'h9e)}) : (wire150 | reg181[(5'h14):(4'h8)]))) : $signed(reg190[(4'h9):(3'h4)]));
          reg193 <= $unsigned(wire146[(3'h6):(2'h3)]);
          reg194 <= (&{wire165[(4'hb):(3'h5)],
              ((8'ha9) ?
                  (~&$signed(reg175)) : (reg172 ?
                      (8'hbf) : (reg167 ? (8'hb5) : reg189)))});
        end
    end
  assign wire195 = $signed((~&$unsigned($unsigned((+reg175)))));
endmodule

module module8
#(parameter param130 = ({({((8'hbe) && (8'hac))} != (((8'hb7) < (8'h9d)) == ((8'hb1) & (8'hb1))))} < ({(((8'ha6) ^~ (8'haa)) > ((8'hbb) ? (8'hb3) : (8'h9c))), (^~((8'hbc) ? (8'haa) : (8'hb8)))} ? (~|(~(~&(8'hae)))) : ({(7'h44), (~|(8'haa))} ? (((8'hb6) ? (8'hb1) : (7'h42)) ? ((8'h9c) ? (8'h9d) : (8'hbc)) : (&(8'hb1))) : (((8'hb4) ^~ (8'ha0)) ? {(8'hb0)} : ((8'hb5) ? (8'ha6) : (8'hb0)))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h2a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire12;
  input wire [(4'ha):(1'h0)] wire11;
  input wire [(3'h4):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire129;
  wire [(5'h14):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire127;
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  assign y = {wire129,
                 wire81,
                 wire19,
                 wire18,
                 wire17,
                 wire15,
                 wire14,
                 wire13,
                 wire127,
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
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg16,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 (1'h0)};
  assign wire13 = ($unsigned($unsigned($signed(wire9))) ?
                      {$unsigned(((wire9 > (8'hbf)) ?
                              $signed(wire12) : {(8'hb4),
                                  wire11}))} : wire12[(4'h9):(2'h2)]);
  assign wire14 = {wire13};
  assign wire15 = $signed(wire10);
  always
    @(posedge clk) begin
      reg16 <= (wire13 ? (8'hb6) : wire11);
    end
  assign wire17 = $unsigned(wire9[(1'h0):(1'h0)]);
  assign wire18 = wire14;
  assign wire19 = wire18[(4'hb):(4'h8)];
  always
    @(posedge clk) begin
      if ((~^wire15[(4'hf):(2'h3)]))
        begin
          reg20 <= $signed((wire10 >= (~wire10)));
          if (((^wire15[(3'h7):(3'h6)]) >>> $unsigned(((~&(~wire14)) && wire12))))
            begin
              reg21 <= $signed(wire14);
            end
          else
            begin
              reg21 <= $unsigned(($unsigned($unsigned({wire9,
                  (8'hb1)})) && (&{wire19})));
              reg22 <= ((({$signed(reg21),
                          $unsigned(reg20)} | (~|(wire17 & (8'ha8)))) ?
                      (wire9[(2'h2):(1'h0)] + ({reg20, wire18} ?
                          (~|wire10) : $unsigned(wire13))) : $unsigned($unsigned((wire12 ?
                          (7'h41) : wire12)))) ?
                  (($unsigned(wire12[(2'h3):(1'h1)]) + ($unsigned(wire11) && $unsigned((8'ha6)))) ?
                      ((wire10[(3'h4):(1'h0)] || $signed((8'ha7))) ?
                          wire10 : wire11) : ($signed({wire9,
                          reg20}) != wire9)) : (~|($signed(wire18[(1'h0):(1'h0)]) ?
                      ($signed((8'hae)) ?
                          {wire13, wire11} : wire13) : ({(8'hb4),
                          wire11} >> $unsigned(wire9)))));
            end
          reg23 <= wire18[(4'h8):(4'h8)];
          reg24 <= wire11;
        end
      else
        begin
          if (reg22[(1'h1):(1'h1)])
            begin
              reg20 <= (($unsigned(($unsigned(wire18) ?
                  $signed(wire12) : (-(8'hb6)))) ^~ ($unsigned($unsigned(wire13)) ~^ $signed((reg21 - reg16)))) != wire18);
              reg21 <= (wire18 ? reg16[(2'h3):(2'h2)] : wire19[(1'h1):(1'h1)]);
              reg22 <= wire11[(4'ha):(4'ha)];
              reg23 <= reg24;
            end
          else
            begin
              reg20 <= (wire10[(1'h0):(1'h0)] & (reg21[(1'h1):(1'h0)] ?
                  $unsigned($signed(wire12[(4'hf):(4'he)])) : ($unsigned(reg21) >= (^$unsigned(wire12)))));
              reg21 <= wire17;
              reg22 <= (~^($unsigned(((~wire19) >= $unsigned(wire12))) * ((^~wire13) >>> reg20)));
            end
          reg24 <= (~^(wire17[(2'h2):(1'h1)] >= $unsigned((-$signed(reg20)))));
          reg25 <= (~^((^((wire19 * wire13) && wire14)) || ($unsigned(reg22[(2'h2):(1'h1)]) + ({reg23} > wire11[(3'h5):(1'h0)]))));
          if ((((8'hbb) >> {wire9}) ?
              ($unsigned({$unsigned(wire14)}) != $unsigned(wire9)) : $unsigned(($unsigned($signed(reg22)) && ($unsigned(reg22) ^ wire10)))))
            begin
              reg26 <= $signed(wire17);
              reg27 <= {wire11[(2'h2):(1'h1)], wire15};
            end
          else
            begin
              reg26 <= (wire11 & (wire11 ?
                  wire9 : (({reg26, (8'hac)} ?
                      $unsigned(wire12) : wire14[(3'h4):(1'h1)]) && (wire19 <<< wire17[(1'h0):(1'h0)]))));
              reg27 <= reg26[(3'h4):(1'h1)];
              reg28 <= {(&reg25)};
              reg29 <= wire19[(2'h2):(1'h0)];
            end
          reg30 <= $unsigned(reg21);
        end
      reg31 <= $signed((reg23 ?
          (+$unsigned(reg22[(1'h1):(1'h1)])) : ((8'haf) >>> {$signed((8'ha4)),
              (8'hac)})));
    end
  always
    @(posedge clk) begin
      reg32 <= (~reg28[(3'h4):(1'h1)]);
      reg33 <= reg28[(3'h4):(3'h4)];
      reg34 <= wire15;
      if ($unsigned($signed((wire19[(2'h2):(1'h0)] ?
          (~^$signed((8'hac))) : reg21[(3'h7):(3'h7)]))))
        begin
          reg35 <= $signed(((reg23[(5'h11):(1'h0)] || $signed(wire17)) ?
              $unsigned(((reg29 < wire12) | (8'hb6))) : reg21[(4'ha):(3'h7)]));
          if (reg25[(5'h10):(4'h8)])
            begin
              reg36 <= ((-$signed($unsigned(reg35[(1'h1):(1'h1)]))) ?
                  reg26[(4'h9):(3'h5)] : (&((&(wire15 ? reg29 : reg33)) ?
                      (~&(wire17 < reg28)) : wire13[(3'h7):(3'h6)])));
              reg37 <= (8'ha4);
              reg38 <= reg23;
              reg39 <= (~|reg31);
              reg40 <= reg28;
            end
          else
            begin
              reg36 <= (reg27 ?
                  $signed(($unsigned(reg24[(2'h3):(2'h2)]) ?
                      $signed((~reg39)) : $signed((wire19 != reg38)))) : $signed(wire15));
              reg37 <= {wire19, (~$signed($signed((reg23 << (8'hae)))))};
              reg38 <= ((^~(reg40 | $signed((reg31 != reg34)))) ^~ {((reg32[(2'h2):(2'h2)] <= (-reg22)) ?
                      (reg23[(4'he):(4'hd)] >>> (reg29 ^~ reg23)) : {$signed(reg38),
                          (~|reg21)})});
            end
          reg41 <= (wire15[(1'h0):(1'h0)] > (reg32[(1'h0):(1'h0)] + wire10));
          reg42 <= (reg39[(4'h8):(4'h8)] ?
              {reg21[(4'he):(3'h4)],
                  $unsigned(reg24[(4'h9):(2'h3)])} : ((~^(~(wire19 ?
                  wire19 : reg34))) << (+reg24[(4'h9):(2'h3)])));
        end
      else
        begin
          reg35 <= (~|(~&(+reg35[(3'h5):(3'h5)])));
          reg36 <= (!(reg26[(4'hb):(2'h2)] ?
              wire13 : (((^reg25) ?
                  {reg37} : (|reg41)) & $unsigned($signed(wire12)))));
        end
      reg43 <= (reg16 ?
          reg29 : ((~^reg33) ? reg33[(3'h6):(2'h2)] : $unsigned(reg16)));
    end
  module44 #() modinst82 (wire81, clk, reg24, reg36, reg29, wire12);
  always
    @(posedge clk) begin
      reg83 <= (({(((8'hb7) ? wire19 : reg27) ?
                      wire10[(3'h4):(2'h2)] : $signed(reg26))} ?
              $unsigned($unsigned((~&wire15))) : (-$unsigned(reg29[(3'h5):(1'h1)]))) ?
          (reg27 ?
              $signed(reg20) : (^~((~reg22) ?
                  (reg24 > reg38) : {reg30, reg28}))) : $unsigned((reg37 ?
              $signed($signed(reg30)) : ((^~(8'ha1)) >= (reg25 ?
                  reg43 : reg34)))));
      reg84 <= $unsigned({$signed($unsigned(((7'h44) ? reg43 : (7'h40))))});
      reg85 <= $signed(($unsigned($signed(reg27)) ?
          reg37 : (~&$signed($signed(reg39)))));
      if ((~^reg43[(4'he):(4'hb)]))
        begin
          reg86 <= (^~(8'h9c));
          reg87 <= reg21;
        end
      else
        begin
          reg86 <= (-{$unsigned({$signed(reg41)})});
          if (reg85[(4'h8):(1'h0)])
            begin
              reg87 <= reg21;
              reg88 <= $unsigned((8'hbe));
              reg89 <= ((^~(+wire9[(2'h3):(2'h3)])) ^~ $unsigned((8'ha5)));
              reg90 <= ({wire15} ?
                  (reg24 ^ ((!reg33) ?
                      (~&$unsigned(reg33)) : reg22[(2'h2):(2'h2)])) : (8'hbc));
            end
          else
            begin
              reg87 <= (reg22 <<< ($unsigned({(reg31 ?
                      reg85 : (8'ha4))}) < $signed(((8'hb8) ?
                  (reg28 ? reg83 : reg88) : reg86))));
              reg88 <= ((8'hbc) ^ $unsigned((^~{(~|reg43), (+reg90)})));
              reg89 <= ((reg85 ^ ($unsigned({wire9, reg28}) <<< ((reg83 ?
                      reg24 : reg41) ~^ (reg29 ? wire19 : wire12)))) ?
                  $signed(((~|(|reg30)) ?
                      reg26[(4'h9):(4'h8)] : $unsigned(reg32))) : reg89);
              reg90 <= (((((~reg42) < (reg24 ?
                  wire18 : (8'hac))) * ($unsigned((8'ha6)) - (reg41 ?
                  reg88 : wire18))) && ({$unsigned(reg16)} ?
                  wire18 : (!reg84[(4'ha):(3'h7)]))) >= (~^(&(reg23 * {reg42}))));
              reg91 <= (~|((~|{reg41[(4'ha):(3'h5)]}) ~^ ((((8'hae) > (8'hb2)) && reg87[(3'h6):(3'h6)]) ?
                  $signed((^~reg86)) : (^~$unsigned(reg21)))));
            end
          if ((reg29 ?
              reg32[(3'h5):(2'h2)] : {$unsigned($unsigned(((8'h9f) ~^ wire17)))}))
            begin
              reg92 <= reg29;
              reg93 <= $unsigned(wire19);
              reg94 <= $unsigned((reg42[(4'hc):(4'h8)] ?
                  ((!(~^reg26)) << $unsigned($signed((8'hbb)))) : wire18));
            end
          else
            begin
              reg92 <= (reg43 ?
                  (((reg86[(4'hc):(3'h7)] ? wire19 : reg25[(5'h13):(2'h3)]) ?
                          $signed($unsigned(wire15)) : $unsigned(reg43)) ?
                      {((reg22 - (7'h42)) ?
                              ((8'ha3) ?
                                  reg91 : reg37) : wire15[(4'h8):(4'h8)])} : wire14[(1'h1):(1'h0)]) : $signed($signed(($unsigned(wire19) ?
                      (reg26 ^ reg93) : reg39))));
              reg93 <= $unsigned(((-$unsigned((wire11 ? reg33 : reg90))) ?
                  (wire81[(1'h1):(1'h0)] ?
                      reg33[(4'he):(2'h2)] : {reg24,
                          $unsigned((8'ha3))}) : reg39[(3'h7):(2'h2)]));
              reg94 <= (reg16 * (8'ha3));
              reg95 <= ((-(reg32 > $unsigned((^reg85)))) < $unsigned($signed((-(reg24 ?
                  wire11 : reg88)))));
              reg96 <= (!$signed({($signed(reg24) ? {wire9} : (+reg16))}));
            end
        end
      reg97 <= (^{$unsigned((!(reg89 ? reg37 : reg85))),
          {$signed(reg85[(3'h4):(1'h1)])}});
    end
  module98 #() modinst128 (wire127, clk, reg95, wire12, reg32, reg36);
  assign wire129 = $signed($signed($signed((reg27[(3'h5):(1'h1)] ?
                       reg39 : (~|reg23)))));
endmodule

module module98
#(parameter param125 = (~&(((~^((8'hb0) + (8'ha6))) | (&{(8'hab), (8'hae)})) << {{((8'ha5) ? (8'hb6) : (8'hbf)), ((8'haa) ? (8'ha0) : (8'ha8))}})), 
parameter param126 = ((-param125) ? (((~&{param125}) | (param125 ? param125 : (~|(8'ha6)))) & (8'hb0)) : param125))
(y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire102;
  input wire [(5'h12):(1'h0)] wire101;
  input wire [(4'hc):(1'h0)] wire100;
  input wire [(5'h15):(1'h0)] wire99;
  wire signed [(5'h13):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire123;
  wire [(4'h9):(1'h0)] wire122;
  wire [(3'h6):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire [(4'ha):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire103 = ($unsigned($unsigned($unsigned(wire102))) * wire100[(4'hb):(1'h1)]);
  assign wire104 = $unsigned(wire101);
  assign wire105 = wire99;
  assign wire106 = wire105[(2'h2):(2'h2)];
  assign wire107 = {((wire99 ?
                           wire100 : $signed($signed(wire103))) && (|(wire102 ?
                           (wire104 ? wire101 : (7'h40)) : wire102))),
                       $unsigned(((^wire103[(3'h4):(1'h1)]) ?
                           $signed(((7'h41) ^ wire99)) : $signed(wire104)))};
  always
    @(posedge clk) begin
      if (((~^(^($signed(wire107) ?
              {wire105, wire105} : wire99[(5'h10):(4'hd)]))) ?
          wire101 : $unsigned($signed($unsigned(((8'hb4) && wire104))))))
        begin
          reg108 <= (^~wire103[(3'h5):(3'h5)]);
          if ($unsigned(((8'hac) ?
              reg108 : $signed($unsigned(wire100[(4'h9):(3'h4)])))))
            begin
              reg109 <= $signed($unsigned($signed($signed((~|wire99)))));
              reg110 <= wire104;
              reg111 <= {($unsigned(reg110[(3'h4):(1'h0)]) ?
                      $unsigned((wire107 && (&reg109))) : wire102[(3'h4):(2'h3)])};
            end
          else
            begin
              reg109 <= (!wire101);
              reg110 <= $signed((reg110[(2'h2):(1'h1)] ~^ ((+(wire102 < wire105)) ?
                  wire103 : ($unsigned(wire106) > reg110[(2'h3):(2'h2)]))));
              reg111 <= wire107[(3'h4):(2'h2)];
            end
        end
      else
        begin
          reg108 <= $signed(wire105[(1'h0):(1'h0)]);
          if ($signed((reg111[(3'h6):(1'h1)] ^~ $signed(wire103[(2'h2):(1'h0)]))))
            begin
              reg109 <= (+(&wire106));
              reg110 <= wire101;
              reg111 <= ($signed({$signed($unsigned((8'hb5)))}) ?
                  {$signed((^~$unsigned((8'ha7))))} : {(((^~reg109) >>> (~^wire107)) <= (&$unsigned(reg111))),
                      (wire103[(3'h5):(3'h5)] ^~ $unsigned((wire101 ?
                          reg108 : reg110)))});
              reg112 <= $unsigned(reg109);
            end
          else
            begin
              reg109 <= reg109[(4'h9):(3'h7)];
            end
          reg113 <= $unsigned($signed($unsigned(reg109[(2'h3):(2'h3)])));
          reg114 <= ({$signed(({wire107} >>> reg109[(1'h0):(1'h0)]))} == (^~$signed({(reg109 >> reg112)})));
        end
      reg115 <= $signed(wire100);
    end
  always
    @(posedge clk) begin
      reg116 <= wire99;
      reg117 <= {(~(&(^wire99[(3'h6):(1'h1)]))), reg109};
      reg118 <= ($signed(reg108) != {(~(reg117[(5'h11):(1'h1)] ^~ $unsigned(reg110))),
          {$signed($signed(reg117))}});
    end
  assign wire119 = $unsigned((|reg117[(4'ha):(2'h2)]));
  assign wire120 = reg114;
  assign wire121 = ((~&{(((8'hba) ? wire106 : (8'hb8)) != $unsigned(wire99)),
                       ($unsigned(wire100) ^ wire104)}) >= ((($signed(reg111) ?
                           $unsigned((8'hbd)) : reg117[(4'hb):(3'h7)]) ^~ (~((8'ha0) ?
                           reg114 : wire104))) ?
                       wire105 : wire102));
  assign wire122 = (~^{(wire103 == reg108[(4'h8):(2'h3)])});
  assign wire123 = reg116[(1'h1):(1'h0)];
  assign wire124 = $unsigned($signed(reg115[(1'h1):(1'h1)]));
endmodule

module module44
#(parameter param80 = ((((((8'ha0) ? (8'hb9) : (8'hbd)) << ((7'h41) ? (8'h9c) : (7'h43))) != (~^((8'h9f) ? (8'ha4) : (8'hae)))) ? ((~&{(8'hb7), (8'ha5)}) >>> (|((8'hb7) ? (8'had) : (8'hb6)))) : ({{(8'hae), (8'hbe)}} ? (((8'ha1) >> (8'haf)) ? ((8'ha4) & (8'hb1)) : ((8'had) <<< (8'ha2))) : (((7'h43) ? (8'hb7) : (8'hba)) ? {(8'ha6), (8'hb3)} : {(8'haa), (8'hb6)}))) << {{(((8'had) ~^ (8'hab)) == (~^(7'h40)))}, ((8'hbd) ? {{(8'haa), (8'hb8)}, ((8'h9e) >= (8'hb5))} : ((|(8'ha5)) - ((7'h40) ? (8'ha9) : (8'hbf))))}))
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire48;
  input wire [(3'h5):(1'h0)] wire47;
  input wire signed [(4'h9):(1'h0)] wire46;
  input wire [(5'h14):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire74;
  wire [(2'h3):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire64,
                 wire63,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
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
                 (1'h0)};
  assign wire49 = ($signed({$unsigned((wire45 ?
                          wire48 : wire45))}) ~^ $signed(((~|(-wire47)) > wire48)));
  assign wire50 = (|((^wire49) && wire48[(1'h1):(1'h0)]));
  assign wire51 = $signed(wire48[(1'h0):(1'h0)]);
  assign wire52 = ($unsigned(wire45[(2'h2):(1'h0)]) ?
                      $signed(($signed(wire46) ?
                          (^~$unsigned(wire45)) : $unsigned(wire48))) : $signed($unsigned({$unsigned(wire46)})));
  always
    @(posedge clk) begin
      reg53 <= ((!(8'ha3)) << (^~wire50));
      reg54 <= ((~&wire46[(3'h4):(2'h3)]) ?
          wire52[(2'h3):(2'h2)] : ((($unsigned(wire48) << (wire48 ?
                  wire45 : reg53)) >>> {$unsigned(reg53)}) ?
              wire48 : ($signed((wire48 ~^ wire45)) - (reg53 ?
                  wire49 : (wire46 ? wire45 : wire51)))));
      reg55 <= $signed((wire46[(1'h0):(1'h0)] ?
          {wire46[(1'h0):(1'h0)],
              $unsigned((wire45 ? reg53 : reg54))} : $signed((~^wire50))));
      if (((&(^~wire46[(2'h3):(1'h1)])) ?
          (wire51[(4'h8):(3'h6)] || wire52[(4'he):(2'h2)]) : {$unsigned(reg54[(1'h0):(1'h0)])}))
        begin
          reg56 <= ((!((^~{wire50}) ?
                  reg55[(4'hb):(1'h0)] : $signed($unsigned(wire50)))) ?
              $signed($signed(wire49)) : (!wire50[(4'hf):(4'hc)]));
          if (reg53[(3'h7):(3'h7)])
            begin
              reg57 <= {wire46};
              reg58 <= wire48;
              reg59 <= wire47[(1'h1):(1'h0)];
            end
          else
            begin
              reg57 <= $signed({$unsigned((8'hab)),
                  (&({reg53, wire51} ? $signed(wire49) : {reg54, wire52}))});
              reg58 <= ({reg56,
                      ($signed((wire48 ^~ reg53)) + $unsigned((&(8'hbe))))} ?
                  $signed((($signed(reg55) || ((8'ha0) ?
                      wire50 : wire52)) - ((^~wire50) ?
                      reg59[(3'h6):(3'h6)] : wire45))) : (^(&reg59[(3'h5):(2'h2)])));
              reg59 <= ((~(~^(reg55 ? (reg56 ? reg59 : wire47) : {wire48}))) ?
                  wire46[(2'h3):(2'h2)] : wire51);
              reg60 <= reg56;
              reg61 <= (^~reg57[(4'h8):(2'h2)]);
            end
          reg62 <= ($unsigned($signed(wire50[(3'h4):(1'h1)])) ?
              reg61 : ($signed($unsigned(wire45)) ?
                  ($unsigned(reg61) ?
                      ($signed((8'ha4)) ?
                          (+wire45) : ((8'hbd) >>> reg59)) : $unsigned((reg55 ?
                          wire49 : reg60))) : wire52));
        end
      else
        begin
          reg56 <= $signed($signed((wire52[(2'h2):(1'h1)] ?
              {wire52, ((8'ha5) ? wire50 : reg60)} : {$signed(reg55),
                  $signed((8'hb2))})));
          reg57 <= (~&$signed($signed((~(reg61 ? reg56 : reg54)))));
        end
    end
  assign wire63 = $unsigned(($unsigned($unsigned((reg57 ? wire45 : wire52))) ?
                      ($signed($signed(wire45)) ?
                          $signed((reg59 ?
                              reg56 : wire48)) : wire48[(4'hd):(3'h5)]) : $unsigned(((wire47 ^ reg54) < wire48[(3'h4):(2'h2)]))));
  assign wire64 = ($unsigned(reg57) ?
                      ((~&{$unsigned(reg57)}) <<< wire46) : (reg59 << (({reg55,
                          wire45} <<< wire46) <= ((~&wire47) ?
                          ((8'h9f) ? reg55 : reg55) : $unsigned((8'hb3))))));
  always
    @(posedge clk) begin
      reg65 <= (((8'hac) <= $signed(wire47)) ?
          $signed(reg53) : (+(reg53 ?
              reg59[(1'h1):(1'h0)] : ($unsigned(wire50) ?
                  (reg58 ? reg59 : wire50) : (reg62 ? wire50 : reg59)))));
      if (reg53[(4'he):(4'ha)])
        begin
          reg66 <= $signed($unsigned({(reg65[(2'h3):(2'h2)] ^ reg61[(2'h2):(1'h0)]),
              (7'h42)}));
          reg67 <= $unsigned(($unsigned(((wire51 ? wire64 : wire46) ?
              (wire52 <= wire51) : (~^(8'had)))) ^ ($unsigned($signed(wire46)) * (-(reg61 <= reg61)))));
          reg68 <= ($signed($signed(reg61[(1'h0):(1'h0)])) ^ wire50);
          reg69 <= {($signed(wire63) ?
                  $unsigned((!$unsigned((8'hb7)))) : $unsigned(wire52))};
          reg70 <= {reg57[(1'h0):(1'h0)], (8'had)};
        end
      else
        begin
          reg66 <= $signed($signed((({reg61} ~^ (reg70 ^ reg54)) <= $signed($signed((8'hb1))))));
          reg67 <= (reg54[(1'h1):(1'h1)] ^ reg57);
          if ({$unsigned(({$unsigned(wire48), (|reg66)} ?
                  {$signed((8'ha0)),
                      (reg55 ? reg60 : reg62)} : (|$signed(reg65))))})
            begin
              reg68 <= ({$signed($signed(reg68[(3'h6):(3'h6)])),
                  reg53[(4'hd):(3'h6)]} << reg59);
              reg69 <= reg65[(2'h3):(2'h2)];
              reg70 <= $signed((reg54 ?
                  (wire52 ?
                      ({reg56} >> {wire64}) : ($signed(reg59) ?
                          wire63[(4'hd):(3'h4)] : $signed(reg55))) : (reg68 ?
                      $signed(reg67) : $signed($signed(reg58)))));
              reg71 <= wire45[(2'h2):(1'h1)];
            end
          else
            begin
              reg68 <= {((wire63 ?
                      reg69 : $unsigned((reg55 ?
                          (8'hbd) : reg65))) * reg61[(2'h2):(2'h2)]),
                  reg58};
            end
          reg72 <= (~|(reg55 ?
              $unsigned((^((8'ha3) ? reg56 : wire63))) : $signed((~^reg56))));
        end
    end
  assign wire73 = $unsigned($signed($signed({(8'ha1)})));
  assign wire74 = (((wire51 | reg70) < (7'h44)) ?
                      {(!$unsigned((reg70 ? reg58 : reg65)))} : wire73);
  assign wire75 = (reg66[(4'he):(4'hb)] != $unsigned(reg69));
  assign wire76 = (8'h9f);
  assign wire77 = (((|(!(reg72 ? reg60 : wire51))) == wire76) ?
                      (reg59[(4'h9):(2'h2)] ^~ {((~wire45) ?
                              $unsigned(reg71) : {reg58,
                                  wire63})}) : (~^$signed({$signed(reg54)})));
  assign wire78 = reg60[(2'h3):(2'h3)];
  assign wire79 = (wire73[(2'h3):(2'h3)] ?
                      $signed((((|wire64) <= (reg61 + reg68)) ?
                          $unsigned(wire77) : (~|((8'ha9) | wire52)))) : {(~&reg59),
                          {(+reg59),
                              ($unsigned(wire75) << $unsigned(wire49))}});
endmodule
