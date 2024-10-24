module top
#(parameter param216 = {(((~^{(8'ha3), (8'ha7)}) ? {((8'ha9) ? (7'h44) : (8'ha6))} : ((~|(8'hbd)) ~^ ((8'hac) ^~ (8'h9d)))) ? ((8'hb6) ? {(~|(8'hb9)), ((8'h9e) ? (8'hbb) : (8'h9c))} : (^~{(8'haa)})) : ((((8'ha1) ? (8'h9e) : (8'hbb)) || (^(8'hbc))) ? ({(7'h43), (8'ha5)} ? (|(8'hb3)) : (~^(8'h9e))) : (((8'hb1) >= (8'hab)) ? {(8'had), (8'ha5)} : ((8'h9e) ? (8'had) : (8'hbf)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire215;
  wire signed [(3'h4):(1'h0)] wire214;
  wire signed [(2'h3):(1'h0)] wire213;
  wire signed [(5'h11):(1'h0)] wire211;
  wire [(4'he):(1'h0)] wire210;
  wire signed [(5'h11):(1'h0)] wire203;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire205;
  wire signed [(4'hd):(1'h0)] wire206;
  wire signed [(5'h10):(1'h0)] wire207;
  wire signed [(2'h3):(1'h0)] wire208;
  assign y = {wire215,
                 wire214,
                 wire213,
                 wire211,
                 wire210,
                 wire203,
                 wire5,
                 wire4,
                 wire205,
                 wire206,
                 wire207,
                 wire208,
                 (1'h0)};
  assign wire4 = $unsigned(wire0[(3'h4):(2'h2)]);
  assign wire5 = $signed($unsigned($unsigned((wire1 >> (7'h42)))));
  module6 #() modinst204 (wire203, clk, wire3, wire2, wire1, wire5, wire4);
  assign wire205 = wire2;
  assign wire206 = {(-(~&({wire4} & wire4[(2'h2):(1'h1)])))};
  assign wire207 = $signed($signed({{$signed(wire203), (wire3 << wire4)},
                       (~&$unsigned(wire203))}));
  module174 #() modinst209 (.y(wire208), .wire178(wire2), .wire179(wire5), .wire177(wire207), .wire176(wire3), .wire175(wire0), .clk(clk));
  assign wire210 = (+(($signed(wire2) ?
                       (wire2 ?
                           (wire2 ?
                               wire208 : wire2) : ((8'h9d) ^ wire1)) : (~|(wire208 ?
                           wire205 : wire205))) <<< (wire2[(1'h0):(1'h0)] ?
                       wire5 : wire207)));
  module45 #() modinst212 (.y(wire211), .wire47(wire2), .wire46(wire4), .wire48(wire3), .clk(clk), .wire49(wire210));
  assign wire213 = $unsigned((+$unsigned((&wire5))));
  assign wire214 = (wire2 + $unsigned($unsigned(wire3)));
  assign wire215 = (!wire205[(2'h2):(2'h2)]);
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire202;
  wire signed [(3'h4):(1'h0)] wire201;
  wire signed [(3'h6):(1'h0)] wire199;
  wire [(5'h12):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire118;
  wire signed [(4'hd):(1'h0)] wire120;
  wire [(5'h12):(1'h0)] wire121;
  wire [(2'h2):(1'h0)] wire170;
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg172 = (1'h0);
  reg signed [(4'he):(1'h0)] reg173 = (1'h0);
  assign y = {wire202,
                 wire201,
                 wire199,
                 wire43,
                 wire26,
                 wire25,
                 wire24,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire13,
                 wire12,
                 wire118,
                 wire120,
                 wire121,
                 wire170,
                 reg23,
                 reg22,
                 reg21,
                 reg16,
                 reg15,
                 reg14,
                 reg172,
                 reg173,
                 (1'h0)};
  assign wire12 = (+wire9[(3'h6):(2'h3)]);
  assign wire13 = (!$unsigned(wire7));
  always
    @(posedge clk) begin
      if (((~|wire10) != {((~^$signed((8'hbb))) < (-(wire9 ?
              (8'had) : (7'h44))))}))
        begin
          reg14 <= ($unsigned($unsigned((~^(~wire9)))) ?
              {$signed(wire11)} : (wire9 <<< wire7));
        end
      else
        begin
          reg14 <= (wire13[(3'h4):(1'h0)] ?
              {{(^reg14), wire10[(5'h15):(4'h8)]}} : wire13[(1'h1):(1'h1)]);
          reg15 <= ((wire8[(3'h6):(1'h1)] << {{(wire9 != reg14), (-wire10)},
                  $signed($unsigned(wire8))}) ?
              wire13 : ((^wire13[(1'h1):(1'h0)]) >>> wire13[(3'h4):(2'h2)]));
        end
      reg16 <= ((^reg15[(3'h5):(1'h1)]) ?
          $signed(($signed($unsigned((8'ha1))) ?
              wire12[(2'h2):(1'h1)] : {wire10[(3'h6):(3'h5)]})) : $unsigned((wire8[(3'h5):(2'h2)] ?
              $signed((wire11 ? wire8 : wire9)) : $signed($signed(reg15)))));
    end
  assign wire17 = ($signed((reg14 ?
                      (8'hb7) : $unsigned($unsigned(reg15)))) || $signed($unsigned({$signed(wire10)})));
  assign wire18 = ((~((^$signed(reg16)) | (^{wire11, reg14}))) == {(^~wire7)});
  assign wire19 = $unsigned((wire8 ?
                      ((&(-reg15)) != wire11[(4'hd):(4'hd)]) : {$signed($signed(reg15)),
                          ($unsigned(reg15) || $unsigned(wire13))}));
  assign wire20 = {(&wire8), wire12};
  always
    @(posedge clk) begin
      reg21 <= {$unsigned($unsigned($unsigned((wire7 ? (8'ha4) : (7'h44)))))};
      reg22 <= wire12;
      reg23 <= $signed($signed(((reg16[(3'h7):(2'h2)] ?
          wire11 : reg14[(3'h6):(1'h0)]) <<< wire9[(2'h2):(1'h1)])));
    end
  assign wire24 = $unsigned($signed((wire10[(5'h14):(3'h4)] - wire12)));
  assign wire25 = ((-wire19) <<< (~$signed($unsigned(reg23[(3'h6):(1'h0)]))));
  assign wire26 = (({($unsigned(reg16) ^~ wire8),
                          {(wire18 ?
                                  (8'hb5) : reg21)}} || $unsigned({$unsigned(wire8),
                          $signed(reg15)})) ?
                      $signed(({wire19[(3'h5):(2'h3)],
                          reg22} * {$unsigned(reg16),
                          wire9[(4'hb):(3'h5)]})) : wire13[(1'h1):(1'h0)]);
  module27 #() modinst44 (.wire28(wire19), .y(wire43), .wire32(wire18), .clk(clk), .wire29(wire25), .wire30(wire7), .wire31(wire26));
  module45 #() modinst119 (.wire47(wire17), .clk(clk), .wire46(wire25), .wire48(wire10), .wire49(wire13), .y(wire118));
  assign wire120 = ((($unsigned({(8'hbc)}) ?
                       {(wire43 >>> reg22),
                           ((8'hb3) * wire13)} : ($signed(wire7) ?
                           reg21 : wire8[(1'h0):(1'h0)])) <<< reg23) << (reg14 ?
                       $signed(((wire7 || wire25) ?
                           $signed((8'ha7)) : wire24)) : (reg23 >> (~(8'ha6)))));
  assign wire121 = (-(~|$signed($signed((wire43 << (8'hbb))))));
  module122 #() modinst171 (.wire123(wire8), .y(wire170), .wire126(wire10), .clk(clk), .wire125(reg23), .wire124(wire118));
  always
    @(posedge clk) begin
      reg172 <= wire118[(3'h4):(2'h2)];
      reg173 <= $signed((!$unsigned((wire8[(5'h11):(4'hb)] * wire26))));
    end
  module174 #() modinst200 (wire199, clk, wire121, wire24, wire12, wire13, reg15);
  assign wire201 = $signed({wire24[(4'hb):(3'h7)]});
  assign wire202 = (((($signed((8'h9d)) ^~ {(8'hb1)}) ?
                       (|(wire25 < wire120)) : (8'had)) || (wire26[(2'h2):(1'h0)] ?
                       $signed((wire12 ?
                           wire18 : wire121)) : $unsigned((|wire25)))) + {wire19[(4'h9):(3'h4)]});
endmodule

module module174  (y, clk, wire179, wire178, wire177, wire176, wire175);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire179;
  input wire signed [(5'h15):(1'h0)] wire178;
  input wire signed [(5'h10):(1'h0)] wire177;
  input wire [(2'h3):(1'h0)] wire176;
  input wire [(3'h5):(1'h0)] wire175;
  wire signed [(4'he):(1'h0)] wire198;
  wire [(5'h14):(1'h0)] wire197;
  wire signed [(4'hb):(1'h0)] wire196;
  wire signed [(4'hd):(1'h0)] wire195;
  wire signed [(4'h8):(1'h0)] wire194;
  wire signed [(4'hf):(1'h0)] wire193;
  wire signed [(5'h14):(1'h0)] wire192;
  wire signed [(4'hd):(1'h0)] wire190;
  wire signed [(3'h4):(1'h0)] wire189;
  wire [(5'h11):(1'h0)] wire188;
  wire [(5'h12):(1'h0)] wire182;
  wire [(4'h8):(1'h0)] wire181;
  wire signed [(5'h14):(1'h0)] wire180;
  reg [(2'h3):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg187 = (1'h0);
  reg [(4'h9):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg183 = (1'h0);
  assign y = {wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire190,
                 wire189,
                 wire188,
                 wire182,
                 wire181,
                 wire180,
                 reg191,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 (1'h0)};
  assign wire180 = wire175[(1'h0):(1'h0)];
  assign wire181 = wire175[(3'h5):(1'h0)];
  assign wire182 = $signed(wire179[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg183 <= (($signed($signed((^wire177))) ?
              ((-$unsigned((8'hbb))) ?
                  wire181[(1'h1):(1'h0)] : wire176[(2'h3):(1'h0)]) : wire175[(3'h5):(3'h4)]) ?
          (8'hb2) : (-((^~wire177) ?
              wire177[(4'hc):(3'h7)] : $unsigned((+(8'hb1))))));
      reg184 <= $unsigned($signed((^~$unsigned((wire175 > wire180)))));
      reg185 <= wire177;
      reg186 <= (7'h42);
      reg187 <= $signed((wire175[(3'h4):(1'h0)] <<< (^(^~(wire181 < reg184)))));
    end
  assign wire188 = wire176;
  assign wire189 = $unsigned($signed(wire179));
  assign wire190 = ($unsigned(wire178[(5'h14):(1'h1)]) >> (reg187 ~^ $signed(wire180[(4'hb):(3'h7)])));
  always
    @(posedge clk) begin
      reg191 <= $signed((+$unsigned(((|wire179) ?
          $signed(wire180) : wire189))));
    end
  assign wire192 = {(~&$signed($unsigned(wire190[(3'h5):(1'h0)])))};
  assign wire193 = (&$signed(($signed((reg184 << reg184)) ^~ reg183)));
  assign wire194 = reg183[(4'h8):(3'h4)];
  assign wire195 = {(((wire188[(1'h0):(1'h0)] & $signed(wire182)) ?
                           {$signed(wire180)} : $unsigned($signed(wire188))) || $unsigned(wire190[(4'hc):(3'h7)])),
                       ($unsigned({reg184[(2'h3):(1'h0)]}) > reg183[(2'h2):(1'h1)])};
  assign wire196 = $unsigned($unsigned(wire176));
  assign wire197 = {wire189,
                       $unsigned({(wire180 ?
                               reg185 : wire175[(3'h5):(2'h3)])})};
  assign wire198 = (~|(8'hbd));
endmodule

module module122
#(parameter param169 = (((8'h9d) ? (~|((&(8'hab)) ? (!(8'had)) : ((8'ha3) ? (7'h41) : (8'hbc)))) : (~|(((8'ha1) == (8'h9e)) ? {(8'ha5)} : (^~(7'h41))))) || (((^~(^(8'ha3))) ^ (((8'hb4) <<< (8'hae)) ? ((8'hb2) ? (8'ha9) : (8'had)) : (-(8'hb9)))) ? (~&({(7'h41), (8'hae)} ? (-(8'h9f)) : ((7'h43) ? (8'hb3) : (7'h43)))) : ((&((8'haf) ~^ (8'ha0))) || (((7'h42) ? (8'hbc) : (8'ha7)) * (+(8'hb6)))))))
(y, clk, wire126, wire125, wire124, wire123);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire126;
  input wire signed [(2'h2):(1'h0)] wire125;
  input wire signed [(5'h10):(1'h0)] wire124;
  input wire signed [(5'h11):(1'h0)] wire123;
  wire [(4'ha):(1'h0)] wire168;
  wire [(5'h14):(1'h0)] wire166;
  wire [(2'h3):(1'h0)] wire165;
  wire [(3'h5):(1'h0)] wire157;
  wire [(4'he):(1'h0)] wire156;
  wire signed [(2'h2):(1'h0)] wire155;
  wire signed [(5'h12):(1'h0)] wire149;
  wire [(3'h7):(1'h0)] wire140;
  wire signed [(4'h8):(1'h0)] wire139;
  wire [(5'h10):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire137;
  wire signed [(2'h2):(1'h0)] wire127;
  reg signed [(3'h7):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(5'h15):(1'h0)] reg162 = (1'h0);
  reg [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(3'h4):(1'h0)] reg160 = (1'h0);
  reg [(4'h9):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg151 = (1'h0);
  reg [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  reg [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg144 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg135 = (1'h0);
  reg [(2'h2):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  assign y = {wire168,
                 wire166,
                 wire165,
                 wire157,
                 wire156,
                 wire155,
                 wire149,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire127,
                 reg167,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 (1'h0)};
  assign wire127 = (8'ha0);
  always
    @(posedge clk) begin
      reg128 <= {$signed(wire126), wire123[(2'h2):(2'h2)]};
    end
  always
    @(posedge clk) begin
      if (wire126)
        begin
          reg129 <= {$unsigned({wire125[(2'h2):(2'h2)], (~$signed(wire127))})};
          reg130 <= wire125[(2'h2):(1'h1)];
          reg131 <= ((~&$unsigned(((!reg129) ? (+reg128) : wire124))) ?
              (^$unsigned(reg129)) : {(((^~reg130) ?
                      (8'h9d) : (reg128 ?
                          reg130 : reg130)) ~^ ($unsigned(reg130) >= reg130))});
          if ((~^reg131))
            begin
              reg132 <= reg131[(4'ha):(1'h1)];
            end
          else
            begin
              reg132 <= reg128[(3'h4):(2'h2)];
              reg133 <= reg131;
              reg134 <= reg132[(4'he):(4'hd)];
              reg135 <= (wire127 ?
                  (&reg130) : {($signed((reg130 ~^ reg128)) || reg130),
                      wire127[(2'h2):(2'h2)]});
              reg136 <= (|reg128[(4'h9):(3'h7)]);
            end
        end
      else
        begin
          reg129 <= (($unsigned(((reg130 != reg133) == {wire125})) < (&$signed((wire124 > reg131)))) | (~($unsigned(reg134) && {((7'h43) ?
                  (7'h42) : (8'hbf))})));
          reg130 <= $unsigned(($unsigned((8'hac)) ?
              wire127 : wire126[(2'h3):(1'h0)]));
        end
    end
  assign wire137 = $unsigned((!(($unsigned((8'haa)) <<< (reg134 ?
                           wire124 : reg128)) ?
                       reg133[(1'h0):(1'h0)] : $signed(reg132))));
  assign wire138 = (~|wire126[(3'h4):(2'h2)]);
  assign wire139 = ($unsigned($unsigned({(reg130 ? wire123 : wire126),
                       (wire127 ?
                           (8'ha8) : reg135)})) && reg132[(4'hf):(4'hf)]);
  assign wire140 = ($signed({wire123,
                       wire138}) - (~^((~&(wire123 | reg132)) != (8'had))));
  always
    @(posedge clk) begin
      if ({$signed(($signed($signed(reg136)) <<< reg133))})
        begin
          if (($unsigned(reg136[(1'h0):(1'h0)]) <<< (&$unsigned(((8'had) ?
              {wire140, reg133} : wire138[(2'h3):(1'h0)])))))
            begin
              reg141 <= wire126[(2'h2):(1'h0)];
            end
          else
            begin
              reg141 <= $unsigned((^$unsigned(($signed(wire138) ?
                  wire124[(2'h3):(1'h0)] : (-wire138)))));
              reg142 <= wire125;
              reg143 <= ($unsigned((($signed(wire125) ?
                      $unsigned(reg131) : $unsigned(wire127)) * $unsigned($signed(wire137)))) ?
                  (wire125[(1'h1):(1'h0)] ?
                      wire127[(1'h0):(1'h0)] : ({(wire126 ?
                              (8'h9f) : (8'hb0))} <<< ($unsigned((7'h40)) ?
                          (reg131 ~^ reg133) : $signed(reg136)))) : wire140[(3'h5):(3'h4)]);
            end
          if (reg131[(4'h9):(4'h8)])
            begin
              reg144 <= reg128[(1'h0):(1'h0)];
              reg145 <= ($unsigned($unsigned(reg132[(1'h1):(1'h1)])) >= wire140);
              reg146 <= reg129[(1'h0):(1'h0)];
            end
          else
            begin
              reg144 <= reg143;
            end
          reg147 <= (&reg133[(2'h2):(1'h1)]);
        end
      else
        begin
          reg141 <= wire127[(1'h1):(1'h0)];
          reg142 <= wire140[(1'h0):(1'h0)];
          if ((wire140[(3'h5):(2'h3)] ?
              $unsigned($unsigned(((reg146 * (8'h9f)) == reg131[(4'h8):(2'h3)]))) : (&(wire127 <= wire126[(2'h2):(2'h2)]))))
            begin
              reg143 <= (~^((-$signed({(8'hbe)})) >= (-$unsigned(reg129))));
              reg144 <= ({$unsigned({(wire139 ? reg130 : reg128),
                      ((8'h9f) ^~ reg146)}),
                  (wire138[(4'hf):(2'h3)] ~^ (~|$unsigned(reg146)))} << (&(wire127 ?
                  wire123 : (wire123 > (wire127 ? reg145 : reg134)))));
              reg145 <= (wire124[(4'h9):(3'h4)] ?
                  ((~|$unsigned(reg132[(4'hf):(4'hf)])) ?
                      wire123[(4'h9):(3'h7)] : $signed({$signed(reg130),
                          reg145})) : $unsigned((({(8'ha7),
                      wire127} >> $unsigned(reg128)) ^~ $unsigned((~|reg132)))));
              reg146 <= $unsigned({reg143, reg133[(1'h0):(1'h0)]});
            end
          else
            begin
              reg143 <= ({reg136, wire126[(2'h2):(1'h0)]} + (8'hb5));
            end
        end
      reg148 <= ($unsigned($signed({$signed(wire127)})) ?
          $unsigned($signed((~^$signed(reg146)))) : wire140);
    end
  assign wire149 = $unsigned(({reg146} ~^ wire139[(3'h4):(1'h0)]));
  always
    @(posedge clk) begin
      reg150 <= reg147[(1'h1):(1'h1)];
      reg151 <= reg133[(2'h2):(1'h1)];
      reg152 <= (^$unsigned($signed((reg129[(2'h3):(1'h0)] != (reg131 < wire149)))));
      reg153 <= ((~^(~(reg152 ? (wire139 * reg134) : (8'ha3)))) ?
          $unsigned(((reg132[(4'he):(2'h2)] ? $signed(reg136) : (^~wire123)) ?
              reg148 : $signed($unsigned((8'hb5))))) : wire149);
      reg154 <= ({wire126,
              $signed(($signed(reg129) ?
                  (wire126 * reg142) : $unsigned(wire138)))} ?
          (({$unsigned(wire140), $signed(reg151)} ?
                  $unsigned($signed(wire139)) : wire123[(4'hf):(4'hb)]) ?
              ((^(reg132 | reg134)) ?
                  $signed((~reg130)) : (~|reg153[(2'h3):(2'h3)])) : reg150[(4'hc):(1'h0)]) : (wire124[(2'h2):(2'h2)] & wire127));
    end
  assign wire155 = (^((8'hb8) > $unsigned($signed((reg146 ?
                       reg146 : wire149)))));
  assign wire156 = $signed((wire137[(2'h2):(2'h2)] && reg142));
  assign wire157 = reg129[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if ($signed(($signed((~^$signed(wire125))) || ({((8'hac) ?
                  (8'hbc) : wire138),
              $signed(reg146)} ?
          ((^~wire125) <<< $signed(wire123)) : (~^(reg130 && wire123))))))
        begin
          reg158 <= $signed((8'hb2));
          reg159 <= $unsigned($unsigned($signed((8'ha7))));
          reg160 <= reg135[(3'h5):(1'h1)];
          if (wire149[(5'h12):(2'h3)])
            begin
              reg161 <= reg150;
            end
          else
            begin
              reg161 <= reg159[(4'h9):(3'h6)];
              reg162 <= reg160;
            end
          reg163 <= wire125;
        end
      else
        begin
          reg158 <= $unsigned($unsigned(($signed((reg133 && reg162)) ?
              reg141[(2'h2):(2'h2)] : $signed(reg153[(3'h4):(1'h0)]))));
          reg159 <= ({$unsigned({$signed(reg135)})} && $signed(reg158[(1'h0):(1'h0)]));
        end
      reg164 <= (reg151 ?
          reg132[(3'h5):(3'h5)] : $unsigned($unsigned($unsigned((^~reg152)))));
    end
  assign wire165 = (~|(~|(^~$signed(wire157))));
  assign wire166 = ((($signed(wire139[(4'h8):(1'h0)]) ?
                           $unsigned(reg136) : ((reg160 && (8'hbc)) ?
                               wire156 : (reg141 ? (7'h43) : reg131))) ?
                       {($signed(reg145) >>> wire139),
                           wire126} : ($unsigned($signed((8'hbc))) ^~ (8'ha0))) * (reg147[(1'h1):(1'h0)] == {((reg160 ?
                           (8'ha2) : reg151) ~^ (~|reg150)),
                       (reg129 ? $unsigned((8'ha6)) : (~|reg143))}));
  always
    @(posedge clk) begin
      reg167 <= $signed(((~wire155[(2'h2):(1'h1)]) > reg161[(4'hb):(4'hb)]));
    end
  assign wire168 = reg150[(3'h6):(2'h3)];
endmodule

module module45
#(parameter param116 = (|(~&((((8'hb3) ? (8'had) : (8'haa)) ? ((8'hb4) ? (8'hb4) : (8'haa)) : (^(8'haa))) ? (~^((8'hb3) ? (8'hb4) : (8'hb2))) : {((8'ha4) - (8'hb6))}))), 
parameter param117 = ((-((-{(8'ha8)}) & param116)) ? param116 : param116))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h28b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire49;
  input wire [(3'h5):(1'h0)] wire48;
  input wire [(4'hb):(1'h0)] wire47;
  input wire [(5'h13):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire82,
                 wire81,
                 wire78,
                 wire77,
                 wire76,
                 wire63,
                 wire62,
                 wire57,
                 wire56,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
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
                 reg80,
                 reg79,
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
                 reg64,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg50 <= (|(!$signed((wire47[(3'h6):(1'h0)] ?
          {(8'ha6), (8'hb4)} : wire48))));
      reg51 <= wire46;
      reg52 <= $unsigned((&{(wire48[(3'h4):(3'h4)] > $unsigned(wire47))}));
      if (reg51)
        begin
          reg53 <= {wire49[(4'hb):(3'h4)]};
          reg54 <= $signed((~&$unsigned($signed(((8'hb8) ^ (8'haf))))));
        end
      else
        begin
          reg53 <= wire46[(1'h1):(1'h0)];
          reg54 <= $unsigned($unsigned((~|((8'hb1) && (~|reg52)))));
          reg55 <= wire46[(2'h2):(1'h1)];
        end
    end
  assign wire56 = (~|(($unsigned((wire47 ? reg50 : wire48)) ?
                          ($signed(wire46) || reg54) : (wire49[(4'he):(3'h5)] ?
                              (reg53 ? wire49 : reg51) : (reg55 ?
                                  (8'hb7) : wire48))) ?
                      {wire49[(4'h8):(1'h1)], (8'hb7)} : (reg50 ?
                          wire46 : ({wire48} > (wire46 ? reg55 : reg51)))));
  assign wire57 = wire49;
  always
    @(posedge clk) begin
      reg58 <= (&wire57);
      reg59 <= ((((reg58 ?
                  (reg50 ?
                      reg52 : reg53) : $unsigned(wire49)) <<< wire57[(2'h2):(2'h2)]) ?
              ($unsigned($signed(reg55)) + wire56[(3'h5):(3'h5)]) : wire57) ?
          $signed($unsigned((wire57[(1'h1):(1'h0)] ~^ $unsigned(reg52)))) : $unsigned(($signed((~(8'hae))) ?
              wire49[(4'he):(4'hb)] : $signed(((8'haf) ? reg53 : wire48)))));
      reg60 <= $unsigned(reg50);
      reg61 <= $signed(reg50[(4'h9):(3'h7)]);
    end
  assign wire62 = $unsigned(((((~reg50) ? $signed(reg53) : $signed(reg50)) ?
                          $unsigned((wire46 < reg60)) : ({reg55,
                              wire57} != reg55)) ?
                      ({(^reg52)} ?
                          $unsigned(wire49) : (8'ha2)) : $signed(wire57[(1'h0):(1'h0)])));
  assign wire63 = $unsigned($signed((((reg59 >>> (8'ha0)) & reg59[(2'h3):(1'h1)]) << wire57)));
  always
    @(posedge clk) begin
      reg64 <= $signed((^($unsigned(((8'hb7) ? wire62 : reg54)) ?
          ((reg53 ? wire49 : reg59) ?
              $signed(reg50) : {wire57}) : (^(reg61 + wire49)))));
      if ((($signed($signed(reg53)) != $signed((reg50 ?
          wire47[(4'hb):(1'h1)] : $signed(reg64)))) ^~ (reg58[(1'h0):(1'h0)] ?
          wire49 : ((8'hba) <= (reg50 ? $signed(reg64) : $unsigned(wire56))))))
        begin
          reg65 <= ((~(~|$signed((reg64 ? wire56 : reg64)))) ?
              {reg53, (!(^~$signed((7'h42))))} : wire49[(4'hb):(4'h8)]);
          if ($unsigned($signed((8'h9f))))
            begin
              reg66 <= wire57;
              reg67 <= ({reg61} ?
                  $unsigned($unsigned($signed((&reg65)))) : $signed($unsigned(($unsigned(reg54) ?
                      (reg66 | wire48) : (~^wire48)))));
              reg68 <= $unsigned(reg50);
            end
          else
            begin
              reg66 <= reg59[(2'h3):(2'h3)];
              reg67 <= (~^$signed($unsigned(wire46)));
              reg68 <= (((~$unsigned($unsigned(reg53))) > (($signed((8'h9c)) - (^~reg59)) && $signed($signed(reg59)))) ?
                  $unsigned((({reg65} ^~ (wire62 > reg66)) ?
                      $signed((~&reg51)) : ((&(8'ha3)) - {reg66,
                          wire63}))) : (($unsigned((reg61 ? reg51 : (8'ha2))) ?
                          (^(~reg60)) : ($signed(wire56) | $unsigned(reg68))) ?
                      reg53[(3'h4):(1'h1)] : ($unsigned((reg66 ?
                          reg60 : reg59)) - {$signed(wire56)})));
            end
        end
      else
        begin
          reg65 <= reg59;
          reg66 <= ($signed(wire56[(2'h3):(1'h1)]) ?
              $unsigned($unsigned((-$signed(reg52)))) : $signed(wire46));
          if (reg54[(3'h5):(2'h2)])
            begin
              reg67 <= wire56;
            end
          else
            begin
              reg67 <= $unsigned((8'ha6));
              reg68 <= reg61[(1'h0):(1'h0)];
              reg69 <= (((~reg58[(3'h4):(1'h0)]) - wire56) ?
                  ((8'ha1) ?
                      reg52 : ($unsigned(wire47[(1'h1):(1'h0)]) & $signed($signed(reg66)))) : (reg68[(2'h2):(1'h1)] ?
                      {$signed((wire47 ^ reg55)),
                          wire62} : (~$signed(wire47))));
              reg70 <= $unsigned(reg51);
              reg71 <= $unsigned(($unsigned(($signed(reg64) << (8'hb8))) ?
                  (+$signed(reg68[(4'h8):(3'h6)])) : ($unsigned($unsigned((8'hb7))) != ($signed(reg68) <= (^~reg54)))));
            end
          reg72 <= $signed((~&({(reg50 ? reg68 : (8'h9e)), ((8'hbc) || reg70)} ?
              (^$signed(reg67)) : (reg52[(4'hb):(1'h1)] <<< (reg53 | reg51)))));
        end
      if (wire46)
        begin
          if (($signed($unsigned(({wire48} ?
                  (^~(8'haa)) : $unsigned(wire56)))) ?
              $signed((($signed((8'hb1)) - $unsigned(reg54)) ^ (&(|wire57)))) : reg55))
            begin
              reg73 <= (wire62[(3'h4):(2'h2)] ?
                  ((|reg68) ? {reg54} : reg55[(3'h7):(3'h4)]) : wire56);
              reg74 <= ((($unsigned({reg65}) ~^ $signed(reg66)) ?
                      (&wire63[(3'h5):(2'h3)]) : {(^~(wire63 ? reg59 : wire46)),
                          ($signed(wire63) ?
                              (reg67 != (8'h9c)) : (wire62 ?
                                  reg65 : (7'h41)))}) ?
                  $unsigned($unsigned((((8'hae) ?
                      (7'h41) : (8'h9e)) ~^ (reg67 + reg50)))) : reg69[(1'h0):(1'h0)]);
            end
          else
            begin
              reg73 <= (reg68[(4'hb):(1'h1)] > {$signed(wire48[(1'h0):(1'h0)])});
              reg74 <= ((((~&$signed((8'ha6))) >> ((reg51 ? reg72 : (8'hb6)) ?
                      $unsigned(reg70) : $signed((8'ha9)))) <<< ($signed(reg66) >> $signed($unsigned(reg58)))) ?
                  $unsigned((&$unsigned(reg67))) : $unsigned((wire63 ?
                      $unsigned(reg69) : $unsigned((|(8'ha4))))));
            end
        end
      else
        begin
          reg73 <= (wire46 <<< reg71);
        end
      reg75 <= $signed((!$unsigned((reg69[(2'h2):(1'h1)] ?
          ((8'ha8) > reg73) : ((8'hac) ? reg50 : wire62)))));
    end
  assign wire76 = reg69[(2'h2):(2'h2)];
  assign wire77 = $signed($unsigned(reg54[(3'h7):(3'h7)]));
  assign wire78 = ((8'hb3) ? $unsigned((~(!wire48))) : reg58[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg79 <= reg71;
      reg80 <= {(~|wire49), $signed($signed({reg71, (7'h40)}))};
    end
  assign wire81 = reg52;
  assign wire82 = reg50[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg83 <= {$signed((|wire63))};
      if ($unsigned((reg67[(2'h3):(2'h2)] < reg74)))
        begin
          reg84 <= $signed((8'ha3));
        end
      else
        begin
          reg84 <= ((({reg55, wire57} << (^(wire57 <<< reg54))) ?
              reg79 : $unsigned({(~|reg71),
                  reg68[(3'h4):(1'h1)]})) ^~ ((!wire78) & (wire76 ?
              (~|$signed(reg66)) : (^~wire46[(2'h2):(2'h2)]))));
          reg85 <= (-$unsigned((reg59 <<< $unsigned(reg68))));
        end
      reg86 <= ($unsigned($unsigned((wire49 <= $signed((8'hbc))))) ^~ $signed(($unsigned(reg52[(3'h5):(1'h1)]) ?
          $signed(wire56[(3'h6):(2'h2)]) : {(^(8'hbb)), ((7'h43) | reg61)})));
      reg87 <= ((((~^reg53) ^ ((8'ha8) >> wire56)) >> (reg55[(1'h0):(1'h0)] == (wire77 ?
          $signed(wire57) : (reg59 << wire62)))) + $unsigned((+(^(reg53 ?
          reg83 : reg72)))));
      if ({(({$signed(wire57), wire56} <<< reg66[(2'h2):(1'h0)]) ?
              reg72[(2'h3):(1'h1)] : reg54[(1'h0):(1'h0)])})
        begin
          reg88 <= reg68[(4'ha):(3'h6)];
          reg89 <= $unsigned($unsigned((reg79 ?
              ((reg52 + reg72) && $signed(reg65)) : wire46[(4'h8):(2'h2)])));
          reg90 <= ($unsigned(reg65[(5'h10):(4'ha)]) ?
              reg53 : (wire62 * {(&wire81), (!(8'ha9))}));
          reg91 <= (~reg73);
          reg92 <= reg70[(3'h5):(1'h0)];
        end
      else
        begin
          reg88 <= (wire49 ? wire49 : reg73);
          reg89 <= reg85[(3'h7):(1'h1)];
          reg90 <= {({reg84[(3'h4):(1'h1)]} && {reg80[(1'h0):(1'h0)],
                  (~&$signed(reg66))})};
          reg91 <= ((~^(7'h42)) <<< ((reg80[(3'h6):(2'h2)] ?
                  reg73 : ((&reg53) ? (reg72 * reg68) : {reg86, reg69})) ?
              $unsigned(wire81) : ((((8'hb8) ? reg54 : reg91) ?
                  reg66 : wire56[(2'h2):(1'h1)]) & (wire82[(4'hc):(3'h6)] ?
                  (reg61 * reg80) : (reg58 ~^ wire56)))));
        end
    end
  always
    @(posedge clk) begin
      if ({(reg65 ?
              (reg55 ^ (reg87 >> (reg65 ? reg72 : reg73))) : (reg69 ?
                  ($signed(reg68) << (&wire62)) : reg88))})
        begin
          reg93 <= (~|$unsigned(wire63[(4'ha):(4'h8)]));
          if ((^~(!($signed((~wire76)) && $signed(reg64[(4'hb):(4'hb)])))))
            begin
              reg94 <= $signed(reg59);
              reg95 <= (!(($signed($signed(reg92)) ?
                      ({reg70} || (^reg83)) : (^~reg94[(1'h1):(1'h1)])) ?
                  (($unsigned(wire62) && (&reg61)) != (&$unsigned(reg79))) : $unsigned({((8'hb7) | reg54),
                      (wire63 ? reg94 : reg80)})));
              reg96 <= $unsigned(reg94[(2'h2):(1'h1)]);
              reg97 <= reg65[(3'h4):(2'h3)];
            end
          else
            begin
              reg94 <= (($signed((&$signed(reg58))) > (!(~|reg74))) ?
                  (wire56[(1'h0):(1'h0)] + reg97[(3'h5):(1'h1)]) : $signed((~^(&reg70))));
              reg95 <= ((wire62 ?
                      ($signed((reg97 ?
                          reg51 : reg97)) ^ (~wire56[(1'h0):(1'h0)])) : ($signed($signed((8'hb0))) ^ $signed((reg50 ?
                          wire76 : reg91)))) ?
                  reg75[(1'h0):(1'h0)] : $unsigned((~|({wire81} ?
                      (!wire78) : wire46))));
              reg96 <= {(reg71[(2'h2):(2'h2)] < $signed(wire81))};
              reg97 <= $unsigned((reg71[(1'h0):(1'h0)] ?
                  $unsigned(reg84[(3'h4):(2'h3)]) : (-{{wire76, reg95}})));
              reg98 <= reg88;
            end
          if (reg92)
            begin
              reg99 <= (|wire56[(3'h6):(3'h6)]);
              reg100 <= reg75[(1'h1):(1'h1)];
            end
          else
            begin
              reg99 <= (reg85[(1'h0):(1'h0)] ?
                  (($unsigned((reg88 == reg69)) ?
                          (reg66[(1'h1):(1'h0)] ~^ reg80[(3'h6):(2'h3)]) : (reg60 > $unsigned(reg59))) ?
                      (8'hb4) : reg92[(1'h1):(1'h1)]) : reg71);
            end
        end
      else
        begin
          reg93 <= reg86;
          reg94 <= (|reg55);
          reg95 <= {(^~(((wire76 ? wire57 : (8'hb8)) ?
                      $signed(reg86) : (reg91 ? reg98 : reg97)) ?
                  (+(reg84 <<< (8'hbf))) : ($unsigned(wire56) ?
                      (~&reg66) : reg90[(3'h6):(2'h3)])))};
        end
      reg101 <= $unsigned(reg67);
      reg102 <= reg52;
      if ($signed($unsigned($signed(reg93))))
        begin
          if (wire57[(2'h2):(1'h0)])
            begin
              reg103 <= ((8'had) ?
                  ($unsigned($unsigned(reg88[(4'h9):(1'h1)])) ?
                      $signed(((reg74 ~^ wire77) | reg83)) : ((+$signed(reg91)) ?
                          (~^reg74) : reg65)) : reg74[(2'h3):(1'h1)]);
              reg104 <= $signed(wire47[(4'hb):(4'hb)]);
              reg105 <= reg72;
              reg106 <= (~reg92);
            end
          else
            begin
              reg103 <= {reg85[(2'h3):(1'h1)],
                  ((-{wire46, {reg103}}) == reg68[(4'hb):(2'h2)])};
              reg104 <= ($unsigned({reg104[(3'h4):(1'h0)], (~(^~(8'had)))}) ?
                  {(~&($unsigned(reg73) ? reg69[(1'h0):(1'h0)] : reg90)),
                      {$signed((reg66 ? reg71 : reg91)),
                          ((reg93 ?
                              reg88 : reg75) ^~ $signed(reg55))}} : {(((wire47 || reg55) ?
                          (8'hb9) : reg54[(3'h5):(2'h2)]) != (-(-reg64)))});
              reg105 <= {$signed((!reg84[(2'h3):(1'h1)])),
                  (((reg92 ? wire78 : (8'ha4)) >> ($unsigned(reg71) ?
                          reg51[(1'h0):(1'h0)] : reg64)) ?
                      ({(^(7'h44))} ?
                          (reg58 * $signed(reg101)) : {reg85[(2'h3):(1'h1)]}) : wire46[(3'h4):(2'h3)])};
              reg106 <= reg97;
              reg107 <= (($unsigned($signed(reg59)) * (((~^reg75) >>> (reg85 != reg90)) == ($signed(wire62) ?
                      (wire49 ? reg65 : wire78) : (reg90 ? reg96 : reg68)))) ?
                  reg59 : $unsigned((reg99[(1'h1):(1'h1)] == ((~reg96) - reg98))));
            end
          reg108 <= reg101[(3'h7):(3'h6)];
          reg109 <= (+(((~^$signed(reg68)) ?
              (&{reg50}) : wire81[(3'h4):(2'h2)]) || reg108));
          reg110 <= reg50[(4'he):(3'h4)];
          reg111 <= (&(({(reg89 ~^ reg66)} == $signed($unsigned(wire57))) >= ($signed((wire81 ?
              (7'h40) : (8'hba))) | $unsigned($unsigned(reg96)))));
        end
      else
        begin
          reg103 <= $unsigned((~^reg96[(1'h1):(1'h0)]));
          reg104 <= reg66;
          reg105 <= (+$signed((~|$unsigned(reg106))));
        end
    end
  assign wire112 = $signed((reg95 ? reg69 : $signed((~$signed(reg59)))));
  assign wire113 = ((8'hb1) ? (~^reg92[(2'h2):(1'h0)]) : (reg100 * reg88));
  assign wire114 = reg110;
  assign wire115 = $signed($signed(reg109[(3'h4):(3'h4)]));
endmodule

module module27
#(parameter param41 = (({(((8'hb0) >>> (8'h9f)) && ((8'ha1) >>> (8'ha9)))} ? (+(~^(!(8'hb8)))) : ((^~((8'haf) - (7'h44))) >>> (8'hbd))) >= ({(((8'hae) ~^ (8'ha4)) ? {(8'ha3)} : {(8'hb8)}), (!((8'hb4) > (8'ha4)))} + (8'hb1))), 
parameter param42 = (-(~^(({param41} ^~ (8'ha5)) + (~^((8'hae) ? param41 : param41))))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire32;
  input wire [(4'hd):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  input wire [(5'h11):(1'h0)] wire29;
  input wire [(5'h13):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 (1'h0)};
  assign wire33 = $unsigned($signed((~&wire29)));
  assign wire34 = ((^(wire29[(3'h5):(2'h3)] >>> {wire28[(4'hf):(3'h6)],
                      (wire33 ?
                          wire31 : wire29)})) >> ($signed(((wire33 ^~ wire31) - (wire32 & wire33))) ?
                      $unsigned(($signed(wire30) >= wire29[(3'h7):(2'h2)])) : $unsigned(($unsigned((8'h9d)) > (wire29 && wire30)))));
  assign wire35 = ((~&$signed((((7'h41) - wire30) ?
                          (wire32 ? wire32 : wire34) : wire33))) ?
                      ($unsigned((&$unsigned(wire31))) ?
                          $unsigned({(wire31 == wire34),
                              (|wire34)}) : (($signed(wire33) ?
                                  (7'h42) : (^~wire33)) ?
                              wire31[(4'hb):(4'hb)] : ($unsigned(wire31) ?
                                  (wire29 <= wire28) : wire29))) : wire30);
  assign wire36 = ($unsigned({((~|wire29) ? {wire31} : $signed(wire35))}) ?
                      (^$unsigned($unsigned((-wire29)))) : $signed((~wire30[(5'h11):(2'h2)])));
  assign wire37 = (+((wire28[(5'h13):(3'h7)] * $signed((wire35 ?
                      wire35 : wire35))) + wire30[(1'h1):(1'h1)]));
  assign wire38 = $unsigned(wire37[(2'h3):(1'h1)]);
  assign wire39 = wire31[(2'h3):(1'h1)];
  assign wire40 = wire28[(5'h10):(2'h3)];
endmodule
