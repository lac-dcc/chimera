module top
#(parameter param185 = (((^({(8'ha8)} + (!(8'ha8)))) ? ((~^(8'hb1)) ? (((8'hba) != (8'h9f)) + {(8'hb9)}) : {(&(7'h42))}) : {({(8'ha2), (8'h9e)} ? ((8'hbe) >> (8'h9f)) : ((8'hbf) ? (8'haa) : (8'hab))), ({(8'hb1), (8'ha1)} ? (^(8'hb1)) : ((8'hb1) || (8'hb4)))}) >>> (((((8'hae) ? (8'hbb) : (8'ha1)) * (^~(8'h9f))) < {((8'hbf) ? (8'hb1) : (8'ha0)), ((8'h9d) ? (8'hbc) : (8'ha0))}) ? (~|{((8'hac) - (8'hb0))}) : ((((8'hbe) ? (8'hb9) : (8'ha3)) ? ((7'h44) ? (7'h40) : (8'ha4)) : ((8'ha6) <= (7'h41))) ? (|((8'hbb) | (7'h41))) : ({(8'ha1), (8'h9d)} ^~ (&(8'had)))))), 
parameter param186 = (|{(param185 ? param185 : (~|param185)), ((+param185) ^ {{param185, param185}})}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire184;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire182;
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  assign y = {wire184,
                 wire26,
                 wire28,
                 wire35,
                 wire36,
                 wire182,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  module4 #() modinst27 (wire26, clk, wire0, wire1, wire3, wire2, (8'hb0));
  assign wire28 = (wire0[(5'h13):(3'h7)] ?
                      ({($signed(wire2) ?
                              {wire3} : (wire26 >>> wire26))} != ($signed((wire2 && wire1)) ?
                          (~&$unsigned(wire3)) : {$signed(wire3)})) : $signed(($unsigned((&(8'hb1))) ?
                          wire0 : (|(+wire2)))));
  always
    @(posedge clk) begin
      if (wire2[(4'hb):(4'ha)])
        begin
          reg29 <= (((($signed((8'hac)) <= {wire26, (8'hae)}) ?
                      wire0 : ($unsigned(wire2) >>> (|wire28))) ?
                  wire26 : (^~((wire26 ^ wire28) ?
                      ((8'hac) ? wire3 : (8'haf)) : $signed(wire3)))) ?
              ($unsigned($signed((wire2 ~^ wire0))) ?
                  (~|wire28[(2'h2):(2'h2)]) : ((8'h9c) * $signed((-(7'h40))))) : (({{wire1},
                  ((8'h9c) ? (7'h44) : wire1)} * (8'ha9)) >> $signed((!(wire2 ?
                  wire0 : wire3)))));
        end
      else
        begin
          reg29 <= wire2;
          reg30 <= (((~wire28[(1'h0):(1'h0)]) ~^ ((reg29 ?
                  $signed(wire0) : {wire1}) ^ (~|$signed(reg29)))) ?
              $unsigned(reg29[(2'h3):(2'h3)]) : ((~|wire26) ?
                  (wire2[(3'h7):(2'h2)] ?
                      (|(reg29 ?
                          reg29 : wire26)) : (~$unsigned(reg29))) : wire28));
          reg31 <= $unsigned({$unsigned($signed($unsigned(wire28))),
              ((8'hb5) + $signed(wire3))});
          reg32 <= $signed($unsigned((($unsigned(reg30) <= {reg29,
              reg31}) <<< (8'hb0))));
          reg33 <= ({((~|(wire28 ? wire2 : wire2)) ?
                  $unsigned(reg31) : ((&wire1) ?
                      (wire28 - (8'hb7)) : reg31[(5'h11):(4'hd)])),
              $signed(((+reg31) ?
                  $unsigned(wire28) : (reg31 ^ wire2)))} <<< (-$signed({reg30[(1'h0):(1'h0)],
              {(8'haa)}})));
        end
      reg34 <= ($unsigned($signed(({wire28, (8'hb5)} >= (wire2 | reg30)))) ?
          (~^$unsigned((-{wire28}))) : (wire26[(4'hc):(2'h3)] != (wire2[(4'ha):(3'h6)] >= (&(wire0 || reg30)))));
    end
  assign wire35 = reg31[(5'h11):(4'ha)];
  assign wire36 = $signed($unsigned((+{(8'hb6)})));
  module37 #() modinst183 (wire182, clk, reg31, reg30, wire3, wire28, wire35);
  assign wire184 = ((-wire36[(2'h2):(2'h2)]) ^~ ((^(&((8'hb4) ?
                           wire35 : wire36))) ?
                       {$signed((reg33 < wire26)),
                           wire35[(4'h8):(2'h2)]} : $signed((^(8'hac)))));
endmodule

module module37  (y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire42;
  input wire signed [(4'ha):(1'h0)] wire41;
  input wire [(4'hb):(1'h0)] wire40;
  input wire [(5'h10):(1'h0)] wire39;
  input wire [(4'hb):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire116;
  wire [(4'ha):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire118;
  wire signed [(4'ha):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire120;
  wire signed [(3'h7):(1'h0)] wire180;
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  assign y = {wire116,
                 wire59,
                 wire58,
                 wire44,
                 wire43,
                 wire118,
                 wire119,
                 wire120,
                 wire180,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 (1'h0)};
  assign wire43 = ($signed($signed((+(wire42 ? wire39 : wire42)))) ?
                      (wire38[(4'h8):(1'h0)] ^ wire40[(3'h7):(1'h0)]) : (wire39 ?
                          $unsigned(wire42) : (8'hb5)));
  assign wire44 = $signed(wire42[(3'h7):(2'h2)]);
  always
    @(posedge clk) begin
      reg45 <= ((($unsigned(wire43) ?
          wire38[(4'hb):(3'h5)] : $unsigned($signed(wire44))) >> (&(~|(|(8'hb0))))) == wire39);
      reg46 <= ((-wire44) ^~ (&($unsigned((wire43 ?
          (8'ha5) : reg45)) && $unsigned(wire40))));
      reg47 <= $signed(wire44[(1'h0):(1'h0)]);
      if (($unsigned((8'hb6)) * (!reg47)))
        begin
          reg48 <= (reg47 < (wire42[(2'h2):(2'h2)] ?
              {{$unsigned((7'h41)), $unsigned(reg45)},
                  (wire40 ?
                      (reg45 * wire43) : ((8'haa) ?
                          reg45 : wire38))} : $unsigned($unsigned({reg45,
                  reg45}))));
          reg49 <= $unsigned(reg47[(3'h7):(1'h0)]);
          if (wire39)
            begin
              reg50 <= (8'hb4);
              reg51 <= $signed(((8'h9f) ?
                  (($unsigned(wire42) ?
                          (-wire42) : ((8'hb4) ? reg50 : (8'hab))) ?
                      reg49 : $unsigned(wire38)) : (8'h9d)));
              reg52 <= ({(((reg51 ? wire44 : wire40) ?
                      $signed(wire43) : (reg45 & reg47)) * ({reg48} ?
                      $unsigned(wire41) : (wire39 ? wire43 : wire44))),
                  (((reg46 ?
                      wire42 : reg47) & $unsigned(wire44)) << ($unsigned(wire39) >> ((8'hb3) * reg46)))} || $signed(reg46[(2'h3):(1'h1)]));
              reg53 <= $unsigned($unsigned($unsigned({reg49, reg48})));
            end
          else
            begin
              reg50 <= {reg51, reg45[(2'h3):(1'h0)]};
              reg51 <= wire43[(3'h5):(2'h3)];
              reg52 <= ((~^$unsigned(((reg48 ?
                      (8'hac) : reg49) && $signed(wire43)))) ?
                  ({$unsigned((reg47 - reg48))} ?
                      $unsigned(wire38) : {$unsigned((~|wire43))}) : wire43);
              reg53 <= ({(8'hba),
                      {((&wire42) ?
                              (reg51 != (8'h9d)) : ((8'h9e) ?
                                  wire39 : wire40))}} ?
                  reg52 : reg53[(1'h0):(1'h0)]);
              reg54 <= $unsigned(reg53[(3'h5):(1'h0)]);
            end
          reg55 <= ($unsigned((wire43 - ((reg53 ? (8'hbf) : reg53) >> (wire43 ?
                  reg54 : reg51)))) ?
              {(^~reg45)} : wire39[(4'hb):(2'h2)]);
          reg56 <= (~&($unsigned((!$signed(reg47))) ?
              reg45[(1'h1):(1'h1)] : reg54));
        end
      else
        begin
          if (($signed($unsigned($unsigned(((8'hb2) >>> reg51)))) ?
              reg48[(2'h2):(1'h1)] : $signed((^($signed(wire42) ?
                  reg50 : reg56[(4'he):(4'hb)])))))
            begin
              reg48 <= (~|(&($unsigned($unsigned(reg55)) & (~&reg56))));
            end
          else
            begin
              reg48 <= {$signed((!reg53[(3'h6):(2'h2)]))};
              reg49 <= $unsigned(((reg53[(2'h2):(2'h2)] ^ reg45) >>> ($signed($unsigned((8'haa))) - reg48[(3'h4):(1'h1)])));
              reg50 <= $signed((^~$signed(({reg55, wire39} ?
                  {(8'hb4), (8'ha1)} : $signed(reg55)))));
            end
          reg51 <= reg45;
          reg52 <= ($unsigned(reg46[(3'h7):(3'h4)]) > (!$signed({(reg47 ?
                  wire40 : reg52),
              {reg55, reg49}})));
          reg53 <= (-$unsigned((($unsigned((7'h42)) > (+(8'h9e))) ^ (wire43[(3'h7):(1'h0)] * wire41))));
        end
      reg57 <= $unsigned(({(~&reg45[(1'h0):(1'h0)])} ?
          $signed($unsigned(wire44)) : reg52[(3'h4):(1'h1)]));
    end
  assign wire58 = (reg45 ? (~|$signed(reg53[(2'h2):(2'h2)])) : wire43);
  assign wire59 = {reg48, $signed(reg53)};
  module60 #() modinst117 (wire116, clk, wire40, wire42, wire44, reg47, reg52);
  assign wire118 = wire44;
  assign wire119 = (($signed($unsigned($signed(wire38))) ?
                       wire39[(4'h9):(1'h0)] : (({reg51} >= (reg47 != reg53)) ?
                           $unsigned($signed(reg46)) : $unsigned((|wire58)))) * wire42[(4'ha):(4'ha)]);
  assign wire120 = (~|$signed($unsigned((reg51[(4'h9):(3'h7)] ?
                       reg48 : reg57))));
  module121 #() modinst181 (.wire123(wire41), .wire122(reg53), .wire124(reg55), .clk(clk), .wire125(reg57), .y(wire180));
endmodule

module module4
#(parameter param24 = {(((((8'hb3) ? (8'hb3) : (8'ha1)) >= ((8'hb4) >>> (8'hb9))) ? ((^~(8'hb6)) ? ((8'hbe) ? (8'hb9) : (8'haa)) : ((8'hb2) ? (8'haa) : (8'hbc))) : {(^~(7'h41))}) >= ((~&(|(8'ha6))) ? {(~|(8'hac)), (^~(8'hb5))} : (((8'ha5) ? (7'h42) : (8'hb0)) || (~&(8'ha9))))), {((~^((8'hb5) ? (8'hbf) : (8'hb3))) ? (~|((8'ha0) ? (8'ha5) : (8'hab))) : {(|(8'ha1))})}}, 
parameter param25 = ((param24 ? (8'hbc) : ({(|param24), (param24 & param24)} ? param24 : (param24 < param24))) ? (!(8'hae)) : param24))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  input wire [(4'he):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  assign y = {wire23,
                 wire15,
                 wire14,
                 wire13,
                 wire11,
                 wire10,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg12,
                 (1'h0)};
  assign wire10 = (wire6 ?
                      (wire6[(3'h5):(1'h1)] ?
                          $unsigned($unsigned((wire7 ?
                              wire7 : wire8))) : wire8) : wire9[(5'h15):(4'hb)]);
  assign wire11 = wire8;
  always
    @(posedge clk) begin
      reg12 <= $signed($unsigned(wire10[(4'he):(3'h6)]));
    end
  assign wire13 = $signed(((~^((wire7 >>> reg12) ? wire9 : $unsigned(wire10))) ?
                      wire7[(3'h6):(2'h3)] : wire8));
  assign wire14 = wire8[(1'h1):(1'h1)];
  assign wire15 = (8'hb2);
  always
    @(posedge clk) begin
      reg16 <= wire10[(4'he):(4'h9)];
      reg17 <= wire6;
      if (($unsigned((~(8'hb3))) & wire7[(3'h6):(2'h2)]))
        begin
          reg18 <= (reg12 <<< $unsigned($signed(($unsigned((8'hb7)) ?
              $signed(reg12) : reg17[(2'h3):(2'h3)]))));
        end
      else
        begin
          reg18 <= {$signed(wire5)};
          reg19 <= wire5;
          reg20 <= ($unsigned(wire7) ?
              reg12[(3'h6):(3'h6)] : ($signed($signed(wire8)) ^ (8'h9f)));
        end
      reg21 <= $unsigned(({((~&wire5) ?
                  (wire6 ? reg20 : wire15) : (reg16 <<< reg17))} ?
          (wire5 ? reg17 : wire5[(3'h5):(1'h0)]) : $unsigned(reg12)));
      reg22 <= $signed((~|wire13));
    end
  assign wire23 = wire14;
endmodule

module module121  (y, clk, wire125, wire124, wire123, wire122);
  output wire [(32'h244):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire125;
  input wire signed [(5'h11):(1'h0)] wire124;
  input wire [(3'h7):(1'h0)] wire123;
  input wire [(4'hd):(1'h0)] wire122;
  wire signed [(5'h12):(1'h0)] wire168;
  wire signed [(3'h5):(1'h0)] wire167;
  wire signed [(3'h6):(1'h0)] wire154;
  wire [(2'h3):(1'h0)] wire153;
  wire [(3'h5):(1'h0)] wire152;
  wire signed [(4'hd):(1'h0)] wire151;
  wire signed [(4'hc):(1'h0)] wire150;
  wire signed [(4'hf):(1'h0)] wire149;
  wire signed [(3'h7):(1'h0)] wire148;
  wire signed [(5'h11):(1'h0)] wire147;
  wire [(3'h7):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire145;
  wire [(3'h7):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire143;
  wire signed [(2'h2):(1'h0)] wire142;
  wire [(4'hc):(1'h0)] wire141;
  wire signed [(3'h4):(1'h0)] wire126;
  reg signed [(5'h14):(1'h0)] reg179 = (1'h0);
  reg [(5'h10):(1'h0)] reg178 = (1'h0);
  reg [(4'hb):(1'h0)] reg177 = (1'h0);
  reg [(5'h10):(1'h0)] reg176 = (1'h0);
  reg [(5'h13):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg174 = (1'h0);
  reg [(4'h8):(1'h0)] reg173 = (1'h0);
  reg [(3'h4):(1'h0)] reg172 = (1'h0);
  reg [(4'he):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg166 = (1'h0);
  reg [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(4'hc):(1'h0)] reg162 = (1'h0);
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg160 = (1'h0);
  reg [(4'hb):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg157 = (1'h0);
  reg [(4'hb):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(5'h11):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire126,
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
                 (1'h0)};
  assign wire126 = $signed((~&wire122[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      reg127 <= wire123;
      if ((wire126 <= (^reg127)))
        begin
          reg128 <= (^(($unsigned($signed(wire126)) ?
              ($signed(wire122) >>> (reg127 ?
                  (8'hb0) : (8'hb8))) : $unsigned((-reg127))) ^~ {$unsigned(wire125),
              reg127[(3'h4):(2'h3)]}));
          reg129 <= wire123[(3'h4):(1'h1)];
          reg130 <= $unsigned(((reg127[(3'h6):(3'h6)] >> $signed(reg129)) <<< $signed($unsigned((~&wire122)))));
          reg131 <= (wire123[(2'h2):(1'h0)] || (-{(8'hb5),
              ((wire124 ? wire126 : reg128) ? {(8'hb6)} : wire122)}));
        end
      else
        begin
          if ((($signed(({wire125} ?
              reg127 : {wire122})) ~^ $unsigned(($signed(reg128) >>> (-wire124)))) && {wire122}))
            begin
              reg128 <= (~|({((reg129 & (7'h44)) <<< (+wire125)),
                      $signed(reg131)} ?
                  (^~{{reg129}}) : reg127[(2'h2):(2'h2)]));
              reg129 <= (({$signed((^reg128)), wire123} ?
                      {{(!reg128), {wire123, wire126}},
                          reg127} : reg131[(2'h3):(1'h0)]) ?
                  $signed(((reg131[(4'hd):(1'h1)] ?
                      (^~wire126) : (^(8'hab))) + ({reg128,
                      (8'hba)} & wire126))) : ((~|wire126) || $signed($signed((reg129 ^~ wire125)))));
              reg130 <= (-(|$unsigned(($unsigned(wire122) ^~ {(8'ha4)}))));
              reg131 <= wire122;
            end
          else
            begin
              reg128 <= ((($unsigned((reg128 ?
                      reg128 : reg131)) * $unsigned((+reg130))) >> (((reg131 + wire125) ?
                      ((8'hba) ?
                          wire123 : reg127) : wire125[(4'hd):(3'h4)]) >= (-reg128[(3'h6):(3'h5)]))) ?
                  $signed((((wire124 ~^ wire124) ^~ reg130) ?
                      wire123[(3'h6):(3'h6)] : (^((8'ha0) ?
                          wire124 : reg131)))) : {$unsigned((reg128 * (&wire124))),
                      (($unsigned(wire124) ? wire126 : reg127[(3'h4):(1'h1)]) ?
                          (!(reg130 + reg127)) : ((reg127 ?
                              reg130 : reg131) * reg127))});
              reg129 <= ($signed((wire126 && $signed(reg129))) ?
                  ({((wire123 && (8'hbe)) > (wire123 ? wire125 : wire122)),
                          $signed((~^reg130))} ?
                      $unsigned(wire124[(5'h10):(3'h7)]) : reg129) : $signed($signed(({reg129,
                          reg129} ?
                      wire122 : (|reg131)))));
              reg130 <= wire125[(4'hc):(4'ha)];
              reg131 <= $unsigned((&$unsigned(($unsigned(reg127) ^ (reg130 ?
                  wire123 : wire126)))));
              reg132 <= reg131;
            end
          reg133 <= (8'had);
          reg134 <= $unsigned($signed((wire125[(3'h4):(1'h1)] ?
              (^reg130[(3'h6):(3'h5)]) : wire123[(2'h3):(1'h1)])));
          reg135 <= $signed($unsigned($unsigned({(^reg128)})));
          if ($signed((^reg130[(2'h3):(1'h0)])))
            begin
              reg136 <= ($signed({((8'h9d) != $signed((8'hb0))),
                  $unsigned($unsigned(reg129))}) ^ $signed((&(&wire125[(4'he):(4'ha)]))));
            end
          else
            begin
              reg136 <= (!{reg130[(3'h5):(2'h2)],
                  $unsigned({reg136, $signed((7'h44))})});
              reg137 <= {((((reg134 > reg131) ^ (8'hbf)) ?
                      $unsigned((&reg133)) : (^reg127[(3'h7):(3'h6)])) >> (~|(!(~&reg131))))};
              reg138 <= reg132[(1'h0):(1'h0)];
            end
        end
      reg139 <= (reg133 << $unsigned($unsigned(reg134)));
      reg140 <= (reg127 != (^~$signed($signed((~&(8'hb9))))));
    end
  assign wire141 = {(((-{(7'h41), wire125}) ?
                               wire125[(4'hf):(4'hc)] : ((wire126 >> reg138) != (reg137 ?
                                   reg135 : wire126))) ?
                           (8'haf) : reg128)};
  assign wire142 = ((+{(^$signed(reg128)), ({wire122, (7'h41)} << (8'ha9))}) ?
                       {reg137[(1'h1):(1'h0)], reg132} : $signed(reg140));
  assign wire143 = (|{{($unsigned(reg139) ? reg139 : (reg134 && (8'hbd)))}});
  assign wire144 = ((reg136[(2'h3):(1'h0)] ?
                       ($signed((8'hba)) ?
                           reg138 : reg133) : $unsigned((&wire126[(2'h3):(2'h2)]))) & (|reg133));
  assign wire145 = (wire144[(3'h4):(2'h3)] < ($unsigned($signed($unsigned(reg127))) ?
                       $signed(((~wire123) ?
                           reg128[(2'h2):(1'h1)] : wire122[(4'h9):(2'h3)])) : (~^$signed(reg129[(4'ha):(4'h9)]))));
  assign wire146 = wire144;
  assign wire147 = $unsigned($signed((+$signed($signed((8'hba))))));
  assign wire148 = reg140;
  assign wire149 = {((~^$unsigned((8'hb3))) > (reg134[(3'h5):(1'h0)] ?
                           ((!reg138) ?
                               (!wire123) : reg134) : $signed($signed(wire123)))),
                       {(reg135 + reg137), wire124[(5'h10):(4'ha)]}};
  assign wire150 = {wire126[(1'h0):(1'h0)],
                       (($unsigned((~&(8'hbf))) ?
                           {reg128[(1'h0):(1'h0)]} : ((wire124 >>> wire122) ?
                               (~&reg133) : $signed(reg136))) + $unsigned((~&{wire146})))};
  assign wire151 = wire124;
  assign wire152 = $signed((~$unsigned(($unsigned(wire123) * (wire149 >> reg129)))));
  assign wire153 = (wire126 != wire122);
  assign wire154 = {({($unsigned(wire147) ? (~reg127) : (reg127 ^ (8'hb0))),
                               $signed((8'ha6))} ?
                           reg138 : (8'hb0))};
  always
    @(posedge clk) begin
      if (wire147)
        begin
          reg155 <= $unsigned((^((wire144 ?
              ((8'hac) ? (7'h41) : wire150) : (wire154 ?
                  reg134 : reg127)) >>> $signed((wire147 ?
              wire143 : (8'hb9))))));
          if (($signed((wire149[(3'h7):(1'h0)] & ((|(8'ha5)) ?
                  ((8'hbe) ? (8'ha6) : wire125) : wire148[(1'h0):(1'h0)]))) ?
              (wire142[(1'h1):(1'h1)] >= (-(~|(wire146 ?
                  reg135 : reg128)))) : (&$signed((8'ha8)))))
            begin
              reg156 <= $signed((~{wire122[(3'h7):(1'h1)]}));
              reg157 <= reg134[(4'h9):(1'h0)];
              reg158 <= reg131;
              reg159 <= (!$signed((($signed((8'ha5)) ?
                      {reg136, reg156} : {wire124, reg157}) ?
                  $unsigned($unsigned((7'h44))) : reg135[(1'h1):(1'h1)])));
              reg160 <= reg159[(3'h7):(2'h3)];
            end
          else
            begin
              reg156 <= (($signed($unsigned(wire122[(4'hc):(3'h5)])) ?
                      ((~&reg129[(3'h6):(3'h6)]) << reg155) : $unsigned(reg139[(4'h8):(1'h1)])) ?
                  ((reg133[(3'h5):(2'h3)] < $unsigned(reg158[(3'h6):(2'h3)])) ?
                      (wire122[(3'h4):(1'h1)] < ((~|wire153) | (reg156 ?
                          reg157 : reg138))) : $unsigned(($signed(wire143) | wire152[(2'h2):(1'h0)]))) : wire153);
            end
          reg161 <= $signed((~reg133[(3'h6):(2'h2)]));
          if (wire141[(4'hc):(4'hb)])
            begin
              reg162 <= ((($signed((reg127 - wire154)) ?
                  reg130 : $unsigned({reg132})) & (&wire123)) | $unsigned(reg135));
            end
          else
            begin
              reg162 <= reg157[(3'h6):(2'h3)];
              reg163 <= $unsigned((&{((!reg130) ?
                      (reg127 ? wire148 : wire123) : $unsigned(reg130))}));
              reg164 <= {((reg131 * (reg134[(4'hf):(1'h0)] ?
                      (wire142 ?
                          reg127 : reg133) : (wire145 & (8'had)))) + (((!wire152) * (8'hb9)) ?
                      reg155[(2'h3):(2'h2)] : ($unsigned(wire147) ?
                          (8'hb3) : $unsigned((8'hb0))))),
                  reg159};
              reg165 <= ($unsigned($signed($signed({wire152,
                  wire142}))) && ($unsigned(((wire148 ?
                      reg160 : wire147) - (!wire141))) ?
                  ((8'ha8) ?
                      $unsigned($unsigned(reg155)) : $signed($signed(wire142))) : (8'hba)));
            end
          reg166 <= ($signed({wire148}) >> wire125);
        end
      else
        begin
          reg155 <= $signed(reg163[(2'h2):(1'h0)]);
        end
    end
  assign wire167 = {$signed((&$unsigned((reg131 ? reg137 : reg165)))),
                       ((^wire126[(1'h1):(1'h0)]) >>> (reg137 >> reg157[(4'h9):(4'h9)]))};
  assign wire168 = (~^(&((~$unsigned((8'h9d))) ?
                       (+{(8'hac)}) : (^{wire167, reg157}))));
  always
    @(posedge clk) begin
      reg169 <= $unsigned(wire154[(2'h3):(1'h1)]);
      if ($signed(reg134))
        begin
          reg170 <= ((((~^(wire149 | reg128)) ~^ $unsigned((~&reg160))) ?
                  $signed((~(reg169 ~^ wire149))) : reg164) ?
              reg131 : (!($signed(wire141) ?
                  wire152 : (reg156[(4'ha):(3'h6)] <= {wire153}))));
          reg171 <= ((wire147[(4'ha):(4'h8)] ?
              $unsigned(({reg161} ?
                  (reg155 ?
                      reg127 : reg131) : reg127[(4'h9):(2'h2)])) : ((~&reg136) ?
                  ($signed(wire122) ?
                      (wire125 | reg131) : (^wire168)) : (~|(wire124 ?
                      reg133 : wire122)))) > $signed(wire154));
          reg172 <= (wire126 & (((~^$unsigned(wire154)) ?
                  (reg138[(4'h9):(4'h9)] ?
                      $signed(reg156) : {reg158,
                          reg140}) : $unsigned($unsigned(wire143))) ?
              reg128[(2'h2):(2'h2)] : reg162));
          reg173 <= $signed({$signed(wire168[(4'h9):(1'h0)])});
          reg174 <= ((~|wire122) ?
              wire126[(3'h4):(2'h2)] : (^$signed(($signed(wire149) ?
                  $unsigned(reg140) : $unsigned(wire149)))));
        end
      else
        begin
          reg170 <= reg170[(1'h1):(1'h1)];
          if ($signed(reg162[(4'hb):(3'h7)]))
            begin
              reg171 <= $signed(wire152);
              reg172 <= (-$signed((reg170 & (~^reg174))));
              reg173 <= reg173;
            end
          else
            begin
              reg171 <= reg165;
              reg172 <= reg161;
            end
          reg174 <= reg163;
          if (wire147[(3'h4):(2'h2)])
            begin
              reg175 <= $signed(reg136);
              reg176 <= $signed(reg158[(1'h0):(1'h0)]);
              reg177 <= (^~reg166[(3'h4):(3'h4)]);
              reg178 <= (wire144 ?
                  $signed((reg175[(4'hc):(3'h7)] << ($signed(reg155) + {reg166}))) : (reg130 ?
                      (((reg172 ? wire123 : reg176) ?
                              $unsigned(reg129) : (wire146 <= (7'h41))) ?
                          {wire146} : $signed($signed((8'hbb)))) : wire150));
            end
          else
            begin
              reg175 <= reg159;
              reg176 <= reg176;
              reg177 <= $unsigned({{reg173[(4'h8):(1'h0)]}});
            end
          reg179 <= ((($signed($signed(reg165)) ?
                  wire141[(4'h9):(4'h9)] : $unsigned({reg158})) - reg140) ?
              {wire126[(1'h0):(1'h0)]} : $signed(wire145));
        end
    end
endmodule

module module60
#(parameter param114 = (~|(^{{((8'ha1) + (7'h40))}, (((8'hb6) ? (8'ha8) : (8'ha0)) - {(8'haa), (8'hb5)})})), 
parameter param115 = param114)
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h21b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire65;
  input wire signed [(5'h12):(1'h0)] wire64;
  input wire signed [(2'h3):(1'h0)] wire63;
  input wire signed [(5'h13):(1'h0)] wire62;
  input wire [(2'h2):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire113;
  wire signed [(4'he):(1'h0)] wire112;
  wire [(3'h4):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  wire signed [(3'h6):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire100;
  wire [(4'hb):(1'h0)] wire99;
  wire [(4'ha):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire signed [(3'h6):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire66;
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
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
                 (1'h0)};
  assign wire66 = $signed(wire61[(2'h2):(1'h0)]);
  assign wire67 = $unsigned($signed((wire61[(1'h0):(1'h0)] - (!(~wire66)))));
  assign wire68 = (!wire61);
  assign wire69 = (wire65 << wire65);
  always
    @(posedge clk) begin
      reg70 <= ({$signed(wire65),
          (~|$unsigned((wire67 ? wire61 : wire66)))} ~^ wire64);
      reg71 <= (~$unsigned(((~|$signed(wire62)) ?
          ((wire63 ? wire69 : reg70) ?
              $signed(wire67) : $signed(wire66)) : ($unsigned(wire69) ?
              {wire63, reg70} : $unsigned(wire69)))));
      reg72 <= wire65;
    end
  always
    @(posedge clk) begin
      if ($signed(((~^$signed((wire64 ? reg71 : wire67))) ?
          ($signed((+wire62)) ?
              wire67[(2'h2):(1'h1)] : {((8'h9c) ? wire68 : reg71),
                  (wire62 & (8'hac))}) : (^~wire65))))
        begin
          reg73 <= $signed($signed($unsigned(({reg72, wire62} ?
              (^wire64) : reg71))));
          if ((((wire61 ? {wire63} : reg71) ^~ ((!$unsigned(wire61)) ?
                  ((~wire61) - $unsigned(wire65)) : ({wire66} * (wire67 ?
                      wire67 : wire64)))) ?
              (~|((((8'had) && (8'hb8)) ?
                  wire62 : (~|(7'h42))) < $unsigned(wire61[(1'h1):(1'h1)]))) : (^~wire65[(4'h9):(3'h4)])))
            begin
              reg74 <= (reg73[(3'h5):(2'h3)] ?
                  ({$unsigned(wire66[(5'h10):(2'h3)]),
                      ((reg70 + wire67) & (wire66 ?
                          (8'hae) : wire69))} < ((~(reg72 <= (8'hba))) ^~ reg70)) : wire62);
              reg75 <= wire61;
              reg76 <= $signed((&$unsigned((|(~&wire64)))));
              reg77 <= ($unsigned(wire65[(1'h1):(1'h0)]) ?
                  (({(^wire64)} ?
                          ((wire69 ? (8'h9f) : wire64) ?
                              $unsigned(wire69) : (wire61 ?
                                  reg74 : wire68)) : (!$unsigned(wire66))) ?
                      $signed(((wire68 == reg75) ?
                          (7'h42) : (reg76 >>> reg71))) : $signed($signed($unsigned(reg71)))) : {(((reg73 <<< reg74) < (reg71 ?
                          reg71 : reg71)) < ({wire61} ?
                          {(8'hb0), reg73} : wire63[(2'h3):(1'h1)])),
                      $signed((wire62 < (8'hab)))});
            end
          else
            begin
              reg74 <= $unsigned(wire66);
              reg75 <= (8'hbf);
            end
        end
      else
        begin
          reg73 <= $unsigned($unsigned(reg75));
        end
      if ((-wire66[(4'hd):(4'h9)]))
        begin
          reg78 <= wire68[(2'h2):(1'h1)];
          reg79 <= (wire67[(1'h1):(1'h1)] ?
              wire61[(1'h0):(1'h0)] : $signed((^~((wire66 ? (8'hbf) : reg70) ?
                  ((7'h42) ? reg73 : (8'ha1)) : {(8'hac), (8'hab)}))));
          reg80 <= $unsigned(wire67[(2'h2):(1'h1)]);
          if ($unsigned($unsigned(((~|(reg79 ^ wire64)) && ((wire61 >>> (8'h9d)) == reg79[(2'h3):(1'h0)])))))
            begin
              reg81 <= ({(reg75[(1'h1):(1'h0)] ?
                          $unsigned((wire61 ?
                              (8'hb1) : wire66)) : (reg71[(1'h1):(1'h0)] ?
                              (|wire69) : $unsigned(reg74))),
                      (+reg74[(3'h6):(1'h1)])} ?
                  (wire64[(3'h5):(3'h4)] ?
                      $signed(wire62) : (^$unsigned({(8'ha8),
                          (8'haf)}))) : $signed(wire61));
              reg82 <= reg79[(1'h0):(1'h0)];
            end
          else
            begin
              reg81 <= (^~{$signed(($signed(reg74) ~^ (reg77 ?
                      wire69 : reg79))),
                  wire68});
              reg82 <= reg77;
              reg83 <= $unsigned($signed((~&reg82)));
            end
        end
      else
        begin
          if ($signed($signed((~$signed(reg74)))))
            begin
              reg78 <= wire66[(3'h4):(1'h1)];
              reg79 <= $signed(($unsigned(wire69[(4'h8):(2'h3)]) < reg74[(1'h0):(1'h0)]));
              reg80 <= $signed({(!$signed($signed(reg75)))});
              reg81 <= ((~^$signed(((~^wire68) > $signed(reg75)))) && $signed(reg77));
            end
          else
            begin
              reg78 <= ((^$signed(($signed(reg83) * $signed(reg80)))) ?
                  $signed((!$unsigned($signed(reg70)))) : wire67);
              reg79 <= $unsigned({$unsigned(({reg75} ^~ (reg83 >= reg74))),
                  reg81});
              reg80 <= reg83[(2'h2):(1'h0)];
            end
        end
      if (wire61[(1'h0):(1'h0)])
        begin
          if ((!(reg76[(4'h9):(3'h5)] ? $signed(reg81[(2'h3):(2'h2)]) : reg82)))
            begin
              reg84 <= ((wire65 * $signed((reg83[(2'h2):(1'h1)] ?
                  ((8'hba) ?
                      reg75 : reg82) : $unsigned(reg82)))) - (|$unsigned(wire62[(4'h8):(4'h8)])));
              reg85 <= (-(-(7'h44)));
              reg86 <= wire64;
            end
          else
            begin
              reg84 <= ($signed(($signed($signed(reg80)) ^ $signed((reg71 ?
                      wire63 : reg78)))) ?
                  $unsigned({wire69[(2'h2):(1'h1)]}) : {(+wire64)});
              reg85 <= ((~|$signed(((~wire62) < $unsigned(wire63)))) + $unsigned((~^reg72)));
              reg86 <= ({({reg73[(3'h4):(2'h3)], reg80} ?
                          (reg75 ?
                              $unsigned(reg71) : $signed(reg81)) : (+$unsigned(reg81))),
                      (reg84[(4'h8):(1'h1)] >>> $signed($signed(reg71)))} ?
                  ($unsigned((!$unsigned(reg76))) < (~|$unsigned((^(8'hb3))))) : $unsigned($unsigned((!$signed(reg76)))));
              reg87 <= reg80[(2'h2):(1'h1)];
            end
          reg88 <= (reg76 != $unsigned($signed((wire64 ?
              $signed((8'ha0)) : (wire66 ? (8'ha8) : wire61)))));
          reg89 <= (+$unsigned($unsigned($signed(reg79))));
          if (reg81)
            begin
              reg90 <= {$signed(reg71[(4'ha):(3'h4)]),
                  $unsigned(((~|wire64) ?
                      {(reg86 + reg72)} : ({(8'hb9)} ?
                          (reg70 == wire68) : reg76[(1'h0):(1'h0)])))};
              reg91 <= ($signed(wire69) + $signed((~&({reg77} | $signed(wire64)))));
              reg92 <= reg78;
            end
          else
            begin
              reg90 <= (+(reg82 ^~ $unsigned(wire69[(3'h5):(1'h0)])));
              reg91 <= reg85;
              reg92 <= (~^({$signed((reg83 ? wire67 : (8'hb7))),
                  ($unsigned(wire63) >= (reg78 ? reg73 : reg77))} << ((8'h9f) ?
                  reg78 : ((~|wire69) - (-reg91)))));
              reg93 <= {$unsigned(reg91)};
              reg94 <= $signed((reg82[(2'h3):(1'h0)] ?
                  reg85[(5'h10):(3'h6)] : (7'h42)));
            end
        end
      else
        begin
          reg84 <= (reg71 ? (-wire61) : reg74[(2'h2):(1'h0)]);
          reg85 <= reg75[(1'h0):(1'h0)];
          reg86 <= reg94[(3'h6):(3'h4)];
          reg87 <= (!(wire69 ^~ $signed($signed((wire64 ? reg94 : reg87)))));
        end
    end
  assign wire95 = $unsigned($signed($signed(wire66[(4'hb):(1'h0)])));
  assign wire96 = reg71[(2'h2):(2'h2)];
  assign wire97 = (8'ha8);
  assign wire98 = {((-reg87[(2'h2):(1'h0)]) ?
                          $signed(wire64) : (wire64[(4'h9):(3'h6)] ?
                              {wire64[(3'h5):(2'h3)],
                                  {reg83}} : reg85[(4'hd):(4'h9)]))};
  assign wire99 = (($signed(((+reg75) ?
                          (reg74 ? reg90 : wire97) : $unsigned((8'h9d)))) ?
                      reg83[(4'hd):(4'hc)] : reg94[(2'h2):(2'h2)]) >= $unsigned((|$unsigned(wire68))));
  assign wire100 = reg91;
  assign wire101 = (reg75[(2'h3):(2'h2)] * $unsigned({wire66[(3'h7):(2'h3)]}));
  always
    @(posedge clk) begin
      reg102 <= ((reg94 ?
          $unsigned(reg87[(1'h1):(1'h0)]) : (^(8'hb3))) << {($signed($unsigned(reg77)) ?
              ($signed(wire101) < {reg90,
                  (8'hbd)}) : ($unsigned(reg83) & (~^wire96)))});
      reg103 <= wire100;
      reg104 <= (((~^(+(~&wire68))) ? ($signed(wire64) * reg75) : reg103) ?
          reg80[(3'h4):(1'h0)] : ($signed($signed((wire95 ?
                  (8'haf) : wire99))) ?
              (+$unsigned((+wire64))) : wire96));
      reg105 <= {$signed(reg89[(1'h1):(1'h0)]),
          $signed($signed(reg70[(3'h6):(1'h1)]))};
    end
  assign wire106 = $signed($unsigned($signed(wire65)));
  assign wire107 = $unsigned($signed({($unsigned(reg73) ?
                           (reg92 ? reg71 : reg85) : (+reg92)),
                       ($signed(reg82) ? {reg94} : wire63[(2'h3):(1'h0)])}));
  assign wire108 = {reg81, $unsigned({wire67})};
  assign wire109 = $unsigned($signed($unsigned({(^~reg78), $signed(wire65)})));
  assign wire110 = wire97;
  assign wire111 = (~^wire95[(5'h14):(4'he)]);
  assign wire112 = $signed($unsigned((!(reg93 ^ (wire64 <<< wire66)))));
  assign wire113 = ($unsigned($signed($signed(reg87[(2'h2):(1'h0)]))) ~^ ((~&(^~wire100)) >> ({(8'hbc)} ?
                       ($signed(wire107) << ((7'h41) ^ wire69)) : $signed($unsigned(reg80)))));
endmodule
