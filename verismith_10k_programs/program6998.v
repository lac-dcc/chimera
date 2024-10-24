module top
#(parameter param185 = ({(+((+(8'hb5)) ? ((8'ha5) ? (8'hbb) : (8'ha8)) : ((7'h42) ? (8'haf) : (8'hab)))), ((((8'hbc) ? (8'hbf) : (8'hb7)) - ((8'ha8) ? (8'haa) : (8'ha4))) ? ((+(8'ha9)) && (~^(8'ha5))) : (((8'ha6) > (7'h43)) ? (~^(7'h41)) : ((8'hab) ^ (8'hac))))} << (!(~((+(8'had)) ? (~&(8'h9c)) : {(8'h9d), (8'h9e)})))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(4'hf):(1'h0)] wire184;
  wire signed [(5'h11):(1'h0)] wire183;
  wire [(4'he):(1'h0)] wire182;
  wire [(5'h14):(1'h0)] wire181;
  wire signed [(4'h8):(1'h0)] wire180;
  wire signed [(4'h9):(1'h0)] wire179;
  wire [(3'h4):(1'h0)] wire178;
  wire [(4'h9):(1'h0)] wire168;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire166;
  reg [(4'hb):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg176 = (1'h0);
  reg [(4'hf):(1'h0)] reg175 = (1'h0);
  reg [(3'h4):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg169 = (1'h0);
  assign y = {wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire168,
                 wire4,
                 wire166,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  assign wire4 = wire3;
  module5 #() modinst167 (wire166, clk, wire2, wire3, wire0, wire4, wire1);
  assign wire168 = $signed({wire166[(4'hd):(3'h4)]});
  always
    @(posedge clk) begin
      if ({($unsigned({(wire168 ? wire3 : wire168),
              $unsigned(wire3)}) - wire168[(3'h7):(3'h6)])})
        begin
          if (((~&(($unsigned((8'ha9)) ?
                  wire2 : {wire166,
                      (8'hb3)}) < (wire3[(4'hb):(2'h3)] << ((8'h9f) ~^ wire3)))) ?
              {(-wire168),
                  {({wire3} ?
                          (wire4 ?
                              wire0 : wire0) : (|wire3))}} : (-(~&$unsigned($signed(wire3))))))
            begin
              reg169 <= ((((-$signed(wire168)) ?
                      {(wire0 + wire168),
                          $signed(wire168)} : ((wire1 ^~ wire3) ?
                          (8'hab) : (wire1 != wire3))) ?
                  wire0 : ($signed($signed(wire3)) ?
                      (wire4[(2'h2):(2'h2)] <= $unsigned(wire166)) : wire1[(2'h2):(2'h2)])) ~^ (|$unsigned(($signed((7'h40)) ?
                  wire2 : wire168[(3'h6):(3'h6)]))));
              reg170 <= {wire1};
              reg171 <= $signed($signed((((wire1 ?
                      wire3 : (8'h9f)) - (~|wire168)) ?
                  {(wire168 ? (8'h9d) : wire4),
                      wire2[(5'h11):(4'hd)]} : wire1)));
              reg172 <= $signed($signed(wire3));
            end
          else
            begin
              reg169 <= reg171[(3'h5):(3'h5)];
              reg170 <= (wire3[(3'h6):(3'h5)] - $signed(wire0));
              reg171 <= (((wire1 ~^ ($unsigned((8'hbf)) ^~ $signed(reg170))) ?
                  $signed($signed(wire0)) : wire0[(3'h4):(2'h3)]) <= wire2);
            end
        end
      else
        begin
          reg169 <= wire1;
          reg170 <= ((8'ha2) * {{{(~^(8'hb6)), (~wire3)},
                  {(reg169 ? (8'haf) : reg172), wire2[(5'h10):(1'h0)]}}});
          if ($signed({$signed({(8'hb0), {wire166, (8'had)}})}))
            begin
              reg171 <= (~&wire3);
            end
          else
            begin
              reg171 <= ({$signed(($signed(wire3) ^~ (|wire0))), wire0} ?
                  {{$unsigned($signed(wire4))},
                      (^~$signed(wire3[(4'he):(2'h2)]))} : ($unsigned(wire166) | ({(reg170 >= wire0),
                      $signed(wire166)} + wire3[(4'h9):(3'h6)])));
              reg172 <= reg170[(4'hb):(3'h5)];
              reg173 <= $unsigned($unsigned(((wire3 ?
                      ((8'ha3) ? wire166 : reg169) : $unsigned((8'ha1))) ?
                  (wire0[(5'h12):(4'h8)] < wire2) : reg170)));
              reg174 <= (~&$unsigned($signed({(wire2 ? reg171 : wire168)})));
              reg175 <= {(^(!wire3))};
            end
        end
      reg176 <= (wire168 << wire168[(4'h8):(3'h5)]);
      reg177 <= {(~$signed(($signed(reg172) ?
              $unsigned(reg174) : (wire168 > (8'h9f)))))};
    end
  assign wire178 = reg170[(4'h8):(1'h1)];
  assign wire179 = $unsigned($unsigned($signed(reg174)));
  assign wire180 = ($signed((wire0 ?
                           (reg174 > $unsigned(wire3)) : $unsigned((&reg175)))) ?
                       ($signed(reg170) ^ wire3[(4'ha):(3'h7)]) : (&(|(~&(reg170 & (8'ha7))))));
  assign wire181 = reg176[(1'h0):(1'h0)];
  assign wire182 = reg175[(3'h5):(2'h2)];
  assign wire183 = {reg170};
  assign wire184 = reg175;
endmodule

module module5
#(parameter param164 = (((8'ha7) ~^ ((((8'ha3) > (8'hb1)) ? ((7'h44) ? (8'ha5) : (8'ha8)) : ((8'hb6) ? (8'hbb) : (8'ha1))) ? (~((8'h9e) + (7'h40))) : {{(8'hac), (8'hb1)}, ((8'h9d) ^ (8'ha0))})) ? ((((-(8'haf)) ? ((8'hb2) ? (8'hb3) : (8'had)) : ((8'ha5) == (8'h9c))) < ((&(8'hab)) < ((8'h9e) >= (8'h9f)))) == (~|((!(8'hb3)) <<< ((8'ha1) ? (8'hba) : (8'hb4))))) : {(8'had), ((((8'h9c) >>> (8'h9c)) ? ((8'hb0) ? (8'ha2) : (8'h9d)) : (^~(8'ha3))) ? {(~&(8'ha7)), (8'ha6)} : (((7'h43) << (8'hab)) > (8'hb5)))}), 
parameter param165 = ((param164 - (8'ha8)) >= (param164 ? {((^param164) * (^~param164)), (~(param164 ? param164 : param164))} : {{(param164 > param164), param164}})))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire163;
  wire signed [(2'h2):(1'h0)] wire162;
  wire [(4'h8):(1'h0)] wire161;
  wire signed [(3'h4):(1'h0)] wire160;
  wire [(3'h4):(1'h0)] wire159;
  wire [(4'hd):(1'h0)] wire158;
  wire [(4'hc):(1'h0)] wire157;
  wire signed [(4'hf):(1'h0)] wire156;
  wire [(4'hf):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire154;
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire99,
                 wire58,
                 wire56,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire106,
                 wire154,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire11 = $signed(($unsigned(wire8) ? (~^wire8) : (~wire6)));
  assign wire12 = (8'ha4);
  assign wire13 = ((wire9 ?
                      (wire7[(2'h3):(1'h1)] ^~ wire6[(1'h0):(1'h0)]) : (~^$signed(((8'ha0) * (8'hb8))))) >>> wire6);
  assign wire14 = ($signed(($unsigned({wire9,
                      (8'ha8)}) + wire13)) * wire7[(1'h0):(1'h0)]);
  assign wire15 = wire8[(2'h3):(1'h1)];
  module16 #() modinst57 (.clk(clk), .y(wire56), .wire18(wire7), .wire19(wire15), .wire20(wire14), .wire17(wire10));
  assign wire58 = $signed((~^$unsigned(((wire13 ? wire11 : wire11) ?
                      wire56[(4'hc):(1'h1)] : wire15[(1'h1):(1'h1)]))));
  module59 #() modinst100 (.y(wire99), .wire61(wire15), .clk(clk), .wire62(wire7), .wire60(wire12), .wire64(wire56), .wire63(wire9));
  always
    @(posedge clk) begin
      reg101 <= $unsigned((((((8'h9f) ? wire10 : wire9) ?
              (~wire8) : (wire58 > wire58)) & {$signed(wire56)}) ?
          (wire7 <<< $signed((+(8'hb6)))) : wire12));
      reg102 <= wire10;
      reg103 <= (8'h9f);
      reg104 <= wire56;
      reg105 <= wire13[(5'h12):(5'h11)];
    end
  assign wire106 = $signed(wire15[(3'h5):(1'h1)]);
  module107 #() modinst155 (wire154, clk, wire6, reg101, reg105, wire10, wire99);
  assign wire156 = wire11;
  assign wire157 = (~^wire9);
  assign wire158 = wire6;
  assign wire159 = wire99[(1'h1):(1'h1)];
  assign wire160 = $unsigned($signed($unsigned(((reg105 & (8'ha7)) >>> (&wire156)))));
  assign wire161 = wire6;
  assign wire162 = $signed($signed(($unsigned((wire6 ?
                       (8'haf) : reg101)) ^~ reg101)));
  assign wire163 = ($signed($signed(reg101)) ?
                       (($unsigned((wire10 >> wire157)) ?
                           wire157 : (-(~|reg104))) << ({$signed((8'ha0)),
                           (8'ha9)} != (8'hba))) : (^~{((^reg103) <= ((8'had) ?
                               (8'hbb) : reg104))}));
endmodule

module module107  (y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire112;
  input wire [(4'hb):(1'h0)] wire111;
  input wire [(4'hd):(1'h0)] wire110;
  input wire signed [(4'hb):(1'h0)] wire109;
  input wire signed [(4'he):(1'h0)] wire108;
  wire [(2'h3):(1'h0)] wire148;
  wire signed [(4'hf):(1'h0)] wire147;
  wire [(4'he):(1'h0)] wire146;
  wire signed [(4'h9):(1'h0)] wire145;
  wire [(5'h11):(1'h0)] wire144;
  wire signed [(4'h9):(1'h0)] wire143;
  wire [(5'h12):(1'h0)] wire142;
  wire [(4'h9):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire140;
  wire [(4'h8):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire121;
  reg signed [(4'hd):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire136,
                 wire131,
                 wire122,
                 wire121,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg139,
                 reg138,
                 reg137,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg113 <= {(^~($signed((-wire109)) ?
              $unsigned($signed((8'hba))) : ((8'hb3) + $signed((8'hb5))))),
          (($unsigned((^~wire111)) ^ (|$signed(wire108))) ?
              ((wire110 > wire111[(1'h1):(1'h0)]) <<< $unsigned($signed(wire110))) : wire112[(3'h6):(3'h5)])};
      if ((({$unsigned($unsigned(wire112)), $signed($signed(wire112))} ?
          reg113 : $unsigned(((~&reg113) ?
              (wire110 > wire112) : $signed(wire111)))) >= wire112[(2'h3):(1'h1)]))
        begin
          if (wire109)
            begin
              reg114 <= (wire111[(2'h2):(1'h0)] ?
                  (8'hb6) : ((((wire111 ^ wire111) ^ wire112[(4'ha):(3'h7)]) ?
                          $unsigned((wire111 ?
                              wire110 : wire108)) : (!((8'ha9) ?
                              wire110 : reg113))) ?
                      (~^((~^(8'hac)) ?
                          (wire108 ?
                              wire112 : wire110) : $signed(wire112))) : (~&(+wire112[(3'h6):(3'h4)]))));
              reg115 <= ({($signed({wire112}) ~^ {{wire112, wire109},
                      (+wire111)})} ^~ $unsigned(reg113));
              reg116 <= wire112;
            end
          else
            begin
              reg114 <= (reg114 ?
                  wire112[(2'h2):(1'h0)] : ($unsigned($unsigned({wire108})) > ($unsigned((wire112 >> reg113)) * $unsigned((+(8'hae))))));
              reg115 <= reg113[(3'h6):(3'h4)];
            end
          reg117 <= (~^(^~$signed(((reg116 ?
              wire109 : wire109) && $signed(wire112)))));
          reg118 <= ((-reg113) ?
              $signed(((reg117[(4'h9):(4'h9)] * (wire112 ? wire112 : reg115)) ?
                  (((8'hb3) ? wire111 : wire111) ?
                      (+reg117) : (~|wire112)) : $unsigned($signed(reg114)))) : $unsigned(reg114));
          reg119 <= (wire111 <<< (wire110[(4'hc):(4'h9)] | (!(|$unsigned(reg118)))));
        end
      else
        begin
          reg114 <= $signed(((-wire110[(3'h6):(2'h3)]) >= ((8'hb3) ?
              (reg114[(2'h2):(1'h0)] ?
                  $unsigned(wire110) : $unsigned(reg113)) : ($signed(wire108) + {reg117}))));
          reg115 <= wire112;
          if (($signed((((reg117 ? wire110 : wire108) ?
              $unsigned((7'h41)) : $unsigned((8'hba))) || (wire111[(3'h7):(1'h0)] ?
              wire109[(2'h3):(1'h1)] : ((8'hb6) != reg115)))) < (8'hac)))
            begin
              reg116 <= ($unsigned(reg116[(5'h10):(4'hf)]) ?
                  (~^($signed({wire109}) ?
                      {(wire108 <<< reg118)} : reg117[(3'h4):(1'h1)])) : (wire111 ?
                      reg115[(2'h2):(1'h0)] : wire108[(4'hd):(3'h6)]));
              reg117 <= $unsigned($unsigned(reg118));
              reg118 <= ((!reg117[(1'h1):(1'h0)]) >>> ((~|$signed((wire108 ?
                      (8'h9f) : wire112))) ?
                  (wire111[(2'h3):(1'h0)] ?
                      $signed($signed(reg119)) : ((reg117 ? reg116 : (8'hab)) ?
                          $unsigned(reg118) : $signed(wire109))) : reg116));
              reg119 <= (^~reg118[(1'h1):(1'h1)]);
              reg120 <= $unsigned(($unsigned($unsigned(wire108[(3'h5):(2'h2)])) >= ({(^~reg118),
                  $unsigned(wire112)} ~^ ((wire112 ? reg114 : wire108) ?
                  (wire111 != reg119) : wire108[(4'h8):(2'h3)]))));
            end
          else
            begin
              reg116 <= wire111;
            end
        end
    end
  assign wire121 = $unsigned(reg116);
  assign wire122 = reg113;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($unsigned((~&reg114[(2'h2):(1'h1)])))))
        begin
          if ((-(^(wire122 <<< (wire110 ? (8'ha2) : (~^reg117))))))
            begin
              reg123 <= (^$unsigned(($unsigned((&wire111)) ^~ (8'ha1))));
              reg124 <= reg116;
            end
          else
            begin
              reg123 <= (+(8'h9e));
              reg124 <= ($signed((^(~&reg114[(4'h8):(3'h5)]))) ^ reg117[(1'h0):(1'h0)]);
              reg125 <= ({wire111} << (((|wire122[(4'h9):(3'h7)]) ?
                      wire112 : $unsigned($signed(reg116))) ?
                  {reg117} : wire121));
              reg126 <= $unsigned(wire121[(1'h0):(1'h0)]);
              reg127 <= (8'haa);
            end
          reg128 <= (^~(~&$signed({(+reg125)})));
        end
      else
        begin
          reg123 <= reg125;
        end
      reg129 <= {wire122[(5'h11):(4'he)],
          (((reg117 ?
              $signed(wire108) : (wire110 ?
                  reg125 : wire122)) - wire121) && {(7'h44)})};
      reg130 <= $unsigned({$unsigned($unsigned((+(8'ha5))))});
    end
  assign wire131 = (+({$signed(((8'hae) <<< reg128)),
                           (wire109 <= $signed(reg118))} ?
                       ($signed((reg126 - (8'hb9))) >> wire121[(3'h5):(2'h3)]) : reg116));
  always
    @(posedge clk) begin
      reg132 <= (8'haf);
      reg133 <= (^((({reg115,
              wire110} & wire108[(4'h8):(1'h1)]) >= $signed({reg123})) ?
          $unsigned($unsigned(reg123)) : $unsigned($unsigned((8'hb7)))));
      reg134 <= $unsigned(reg133[(4'h8):(1'h1)]);
      reg135 <= $unsigned(($signed(reg126[(1'h1):(1'h1)]) ?
          $unsigned($unsigned(reg123)) : (reg113 ?
              reg116[(3'h6):(3'h5)] : (-{(8'ha7)}))));
    end
  assign wire136 = (reg117[(3'h5):(1'h0)] < reg127[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg137 <= (+$signed((reg133[(4'hb):(3'h7)] ^~ ($signed((8'hb5)) ?
          (wire122 ? reg118 : reg134) : wire136))));
      reg138 <= $unsigned((|{wire108[(4'hc):(4'h8)], (&(~^reg116))}));
      reg139 <= (+(($signed({(8'h9c), reg133}) ?
              (~|reg138[(2'h3):(2'h3)]) : $signed(reg114)) ?
          (^~{reg128}) : (($unsigned((8'hba)) > reg135[(3'h4):(1'h1)]) ?
              (wire131 ^~ wire121[(4'hb):(2'h3)]) : (+(wire136 ?
                  reg134 : reg123)))));
    end
  assign wire140 = ($unsigned(wire111) ?
                       $signed((~|{$unsigned(reg127)})) : wire136[(3'h5):(1'h0)]);
  assign wire141 = wire111[(3'h4):(2'h2)];
  assign wire142 = ($unsigned((^~reg113)) >> ((reg113[(2'h3):(1'h1)] + (^{(8'ha8),
                       reg123})) | $unsigned(wire121)));
  assign wire143 = (+$unsigned((^({reg115, reg132} ~^ (reg124 + reg139)))));
  assign wire144 = (({(wire109[(3'h4):(1'h0)] ? {reg133} : $unsigned(wire108)),
                               ({reg137, reg115} ?
                                   $signed(wire136) : (|reg134))} ?
                           reg134[(3'h5):(3'h5)] : {{reg114[(3'h7):(3'h6)]},
                               ($unsigned(reg135) & $unsigned(wire131))}) ?
                       (~^$signed((reg128 ?
                           (wire108 ? reg116 : reg125) : (&reg124)))) : reg135);
  assign wire145 = reg127;
  assign wire146 = (|((!({(8'haa)} <= reg118[(3'h5):(3'h5)])) ?
                       ((~^reg130[(1'h0):(1'h0)]) ?
                           reg130 : wire142) : (~(((8'haf) << wire142) != $signed(reg115)))));
  assign wire147 = $signed((~(~reg139[(3'h5):(2'h3)])));
  assign wire148 = wire142[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg149 <= $unsigned($signed({$unsigned((~&reg139)),
          reg115[(1'h1):(1'h1)]}));
      reg150 <= {reg117[(1'h0):(1'h0)]};
      reg151 <= ($signed({wire145}) ?
          {{wire144,
                  ((reg128 != wire121) ?
                      wire141[(1'h1):(1'h0)] : $signed((8'hb6)))}} : $signed(($unsigned($signed(wire131)) >>> {(8'haa),
              reg134[(3'h7):(2'h3)]})));
      reg152 <= $signed({$signed($signed($signed(reg150))),
          $signed({(reg118 ^ (8'ha0)), reg113})});
      reg153 <= wire108;
    end
endmodule

module module59  (y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire64;
  input wire [(4'h9):(1'h0)] wire63;
  input wire signed [(5'h15):(1'h0)] wire62;
  input wire signed [(4'h9):(1'h0)] wire61;
  input wire signed [(5'h13):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire98;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire71;
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  assign y = {wire98,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
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
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg65 <= $unsigned(wire64[(3'h5):(1'h0)]);
      if ($signed(((($signed(wire60) <= (wire62 ?
              wire64 : wire62)) ^~ (8'hb3)) ?
          wire61[(2'h3):(1'h0)] : $signed(($signed(wire63) - (wire63 - wire64))))))
        begin
          if ($unsigned(wire61[(1'h1):(1'h0)]))
            begin
              reg66 <= ((+$unsigned((reg65[(1'h1):(1'h1)] ?
                  wire64[(3'h4):(2'h3)] : $unsigned(wire64)))) == $unsigned(($signed(wire64[(1'h1):(1'h1)]) ~^ wire61[(2'h2):(2'h2)])));
              reg67 <= $unsigned(wire61[(1'h1):(1'h0)]);
              reg68 <= {(~^$signed(wire63[(4'h8):(2'h2)])),
                  wire63[(4'h8):(3'h7)]};
            end
          else
            begin
              reg66 <= $signed($signed(wire63[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          reg66 <= $signed((&$unsigned($unsigned((^reg66)))));
        end
      if ((!$unsigned((wire62[(5'h13):(1'h0)] ?
          {wire60[(3'h4):(1'h0)]} : wire61[(4'h9):(2'h2)]))))
        begin
          reg69 <= wire61;
        end
      else
        begin
          reg69 <= ($unsigned((^~$unsigned({(7'h43), wire63}))) ?
              (~|{(8'ha9)}) : {(wire61[(2'h2):(1'h1)] || wire63)});
        end
      reg70 <= wire62[(2'h2):(1'h0)];
    end
  assign wire71 = $unsigned((($signed(reg67) <= (|$signed((8'hbd)))) ?
                      reg68 : {(wire62[(4'hd):(1'h0)] ?
                              reg67 : $unsigned(wire62))}));
  assign wire72 = wire60[(1'h0):(1'h0)];
  assign wire73 = ((&(wire60 ? wire71 : wire62[(5'h11):(1'h0)])) ?
                      wire62[(4'ha):(3'h6)] : (((~&$signed(wire61)) ?
                              $signed(wire71) : $signed({reg70, wire61})) ?
                          ($signed((&reg67)) ?
                              ($signed(reg69) ?
                                  (~|reg68) : reg68[(1'h0):(1'h0)]) : (!$signed((8'ha1)))) : wire60[(2'h3):(2'h3)]));
  assign wire74 = $unsigned($unsigned(wire71));
  always
    @(posedge clk) begin
      if ((~|(~(|wire72))))
        begin
          reg75 <= wire63[(3'h6):(2'h2)];
          if ((8'hac))
            begin
              reg76 <= $signed($signed((&wire74[(2'h3):(1'h0)])));
              reg77 <= (wire73[(3'h4):(1'h1)] + wire60);
              reg78 <= $unsigned((7'h43));
              reg79 <= {wire60[(3'h6):(1'h1)],
                  $signed({$signed(wire71),
                      $unsigned((reg70 ? reg76 : wire72))})};
            end
          else
            begin
              reg76 <= $signed(reg79);
              reg77 <= (~|(|wire73));
            end
          reg80 <= reg76;
          reg81 <= {wire74};
        end
      else
        begin
          reg75 <= $signed((|reg81));
          reg76 <= $unsigned((reg80[(4'hc):(4'h8)] + $unsigned((~^$signed((8'hb1))))));
        end
      if ($signed((reg79 ? wire72[(2'h3):(2'h3)] : (8'ha9))))
        begin
          if (wire74[(3'h7):(3'h7)])
            begin
              reg82 <= reg70;
              reg83 <= reg78[(4'h8):(2'h3)];
            end
          else
            begin
              reg82 <= (8'h9e);
              reg83 <= (reg77 ? reg66 : reg77);
            end
          if ($unsigned(reg81[(4'h9):(3'h6)]))
            begin
              reg84 <= $unsigned(reg68[(4'hc):(4'hb)]);
              reg85 <= {$signed({((reg81 ? reg68 : reg81) == $signed(wire71))}),
                  $unsigned($signed(((reg82 <= reg75) ?
                      {reg77, (8'hb6)} : reg69)))};
              reg86 <= (~&$signed({(!(reg81 == reg80))}));
              reg87 <= ((8'hb4) ?
                  reg66 : (^$unsigned(((wire71 >> wire73) >= reg78))));
              reg88 <= $unsigned((reg86 ?
                  (~$signed($unsigned((7'h44)))) : $unsigned(reg67)));
            end
          else
            begin
              reg84 <= $unsigned((~$signed({reg81})));
              reg85 <= wire62[(5'h14):(4'ha)];
              reg86 <= ((-(((wire71 ? wire60 : reg75) ?
                      ((8'haf) ?
                          reg65 : wire60) : $signed(reg86)) && $signed($unsigned((8'hb2))))) ?
                  $unsigned(wire60) : $signed(reg84[(3'h5):(1'h1)]));
              reg87 <= $signed($unsigned(reg69));
              reg88 <= (8'hb5);
            end
        end
      else
        begin
          reg82 <= (wire71[(4'ha):(4'h8)] == (reg76 > ($signed((reg81 ?
              reg86 : reg75)) || $unsigned($signed(reg81)))));
          reg83 <= {({$unsigned(reg80[(4'ha):(3'h5)]), reg70[(3'h4):(1'h1)]} ?
                  wire61 : $unsigned((|(reg88 ? reg76 : (8'hab))))),
              reg67[(3'h5):(2'h3)]};
          reg84 <= {wire74[(4'hb):(3'h7)]};
        end
      reg89 <= reg80;
      if (wire64)
        begin
          reg90 <= ($signed({$unsigned($unsigned(reg86))}) ?
              (~|$signed($unsigned($unsigned(wire64)))) : reg86);
          reg91 <= $unsigned(reg66);
          reg92 <= $unsigned($signed(((reg88 | reg77) >> (8'hb3))));
        end
      else
        begin
          if (($unsigned(($unsigned($signed(reg69)) ?
              $signed((reg80 ^ reg68)) : $unsigned({wire64}))) >>> $signed($unsigned(reg81))))
            begin
              reg90 <= {(~^{((-reg76) ? $signed(reg79) : (~&(8'hbe))), reg65})};
              reg91 <= reg80[(4'he):(1'h0)];
              reg92 <= $unsigned((reg84[(3'h5):(1'h1)] ?
                  {reg82[(4'ha):(3'h7)]} : $signed((wire74[(4'hc):(4'hc)] ~^ (reg80 ?
                      reg78 : reg80)))));
              reg93 <= ({wire72, reg88} >> wire73[(4'h8):(2'h3)]);
              reg94 <= (8'had);
            end
          else
            begin
              reg90 <= {$unsigned(reg70),
                  {($unsigned((wire71 < reg84)) >= ($unsigned(wire74) ?
                          $signed(reg67) : (reg85 ? reg80 : reg89)))}};
              reg91 <= (~&(^~(((~^wire74) ?
                  $signed(reg78) : {reg89, reg75}) > $unsigned((8'hb5)))));
              reg92 <= (((|{(8'haf)}) || ($signed(((8'hb0) ?
                      reg66 : reg68)) <<< (((8'hb7) ?
                      (8'h9f) : wire60) == (^wire62)))) ?
                  $signed(((|((8'hae) != reg89)) <= $signed($signed((8'ha3))))) : (~$signed(reg83)));
            end
          if ($unsigned(wire64))
            begin
              reg95 <= reg83[(3'h6):(2'h2)];
            end
          else
            begin
              reg95 <= (8'ha3);
            end
          reg96 <= $signed(reg83[(3'h4):(2'h2)]);
          reg97 <= (wire61 ?
              reg93[(2'h3):(1'h0)] : $unsigned(reg75[(3'h4):(3'h4)]));
        end
    end
  assign wire98 = reg67[(3'h5):(3'h5)];
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire [(4'h9):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire21;
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  assign y = {wire55,
                 wire51,
                 wire50,
                 wire21,
                 reg54,
                 reg53,
                 reg52,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
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
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire21 = {($signed(wire17[(4'hf):(3'h5)]) || wire18[(1'h0):(1'h0)]),
                      (wire20 ?
                          (~&$unsigned((wire20 ?
                              wire17 : wire20))) : $unsigned(wire20))};
  always
    @(posedge clk) begin
      reg22 <= (~$unsigned(($signed($unsigned(wire19)) ^~ ((~|wire17) ?
          ((8'ha4) <= wire17) : (8'ha9)))));
      if ((wire18[(3'h6):(3'h5)] ?
          {(-{(reg22 ? wire21 : wire18),
                  (reg22 > reg22)})} : $unsigned($unsigned($signed($unsigned(wire18))))))
        begin
          if ($signed(wire18[(4'h8):(2'h3)]))
            begin
              reg23 <= wire19;
              reg24 <= reg22;
              reg25 <= (-$signed($signed(((reg22 && reg24) ?
                  {wire19} : reg22))));
              reg26 <= $signed($signed($unsigned(((|(8'h9f)) != (wire21 > (8'ha3))))));
            end
          else
            begin
              reg23 <= $signed(reg23);
              reg24 <= ((wire19[(3'h5):(3'h5)] < reg23) ?
                  (reg26 & wire20[(1'h1):(1'h0)]) : ($signed(wire20) ?
                      wire17[(5'h11):(5'h11)] : reg26));
              reg25 <= (^~(&reg22));
              reg26 <= $signed((~&$unsigned(((wire19 && wire20) ?
                  wire17[(4'he):(4'hd)] : $unsigned((8'hb1))))));
              reg27 <= $unsigned($signed($signed(((|wire21) ?
                  (8'ha8) : (+(8'hb0))))));
            end
          reg28 <= $unsigned($signed((({reg22, (8'hac)} ?
                  wire19[(1'h0):(1'h0)] : $signed(reg25)) ?
              (8'hbd) : wire19[(1'h1):(1'h1)])));
          if ($signed(reg26))
            begin
              reg29 <= $unsigned(($signed(($unsigned(reg22) ?
                  (~|reg22) : reg25)) || (~wire20[(3'h4):(3'h4)])));
              reg30 <= (^{($signed(reg26) ?
                      ((reg23 ? reg24 : reg29) ?
                          ((7'h43) ?
                              reg27 : reg24) : wire21) : $signed((!wire20)))});
              reg31 <= (-(7'h43));
            end
          else
            begin
              reg29 <= ($signed({(|(wire20 ? reg23 : reg23))}) ?
                  $unsigned((reg24[(4'hd):(3'h7)] ?
                      $signed((&reg23)) : $unsigned((~|wire17)))) : (+(reg25 ~^ (wire18 ?
                      (reg26 >> wire18) : reg31[(4'hb):(3'h4)]))));
              reg30 <= $unsigned(reg22[(4'h9):(3'h6)]);
              reg31 <= {$signed($signed($signed(wire20)))};
              reg32 <= reg26[(1'h0):(1'h0)];
              reg33 <= $unsigned($signed(wire21));
            end
          if ($signed((($signed((wire17 ? reg22 : reg28)) ?
              (8'h9c) : ($unsigned(reg28) ? wire20 : (+reg29))) > reg31)))
            begin
              reg34 <= {reg25};
            end
          else
            begin
              reg34 <= (&(~^($signed($signed(reg27)) >>> reg28)));
              reg35 <= reg24;
            end
          reg36 <= (|(wire21[(4'h9):(1'h1)] || $unsigned(({wire19, (8'hb2)} ?
              $signed(reg26) : reg29))));
        end
      else
        begin
          reg23 <= (({(&wire21),
                  (((8'ha4) ?
                      wire20 : wire19) != $unsigned(reg33))} ^ {reg22[(4'h8):(2'h2)],
                  (+{wire18, reg24})}) ?
              (~$signed((wire18 ? reg27 : reg33))) : wire18[(3'h5):(2'h3)]);
        end
      reg37 <= reg25[(5'h12):(4'ha)];
      if ((wire21 ?
          (~^(|{(^reg36), $signed((8'ha2))})) : ((reg36[(1'h1):(1'h1)] ?
                  (^(reg23 > (8'hae))) : ($unsigned(reg31) >= $signed(reg33))) ?
              reg29 : (reg35 << {$signed(reg36)}))))
        begin
          if ({{reg36[(1'h0):(1'h0)], $signed(reg33)}})
            begin
              reg38 <= wire18;
              reg39 <= reg24;
              reg40 <= reg37;
              reg41 <= (&reg28[(4'hd):(3'h4)]);
            end
          else
            begin
              reg38 <= $unsigned((&(^reg23[(4'ha):(1'h1)])));
              reg39 <= reg31;
              reg40 <= $signed((8'ha2));
              reg41 <= ($signed($signed($unsigned($signed(reg38)))) == ({(!$unsigned((8'hb4))),
                  reg27} | ($unsigned(reg36) ?
                  $signed((-wire20)) : ((~^reg23) ~^ (reg36 | reg27)))));
            end
          reg42 <= reg33[(2'h2):(1'h1)];
        end
      else
        begin
          if (((($unsigned(reg25[(1'h0):(1'h0)]) ^~ reg39[(2'h2):(1'h0)]) && reg24[(1'h0):(1'h0)]) & reg40))
            begin
              reg38 <= (&reg28[(3'h5):(1'h0)]);
              reg39 <= $signed($signed(reg31[(3'h4):(2'h2)]));
            end
          else
            begin
              reg38 <= (^~(~^$signed({$unsigned(reg32), $unsigned(reg39)})));
              reg39 <= (^~$signed(reg26[(4'h9):(3'h7)]));
              reg40 <= ((reg39[(4'hb):(3'h4)] ?
                      (^~wire21) : {reg34, {(reg27 ? reg30 : reg31)}}) ?
                  reg35[(3'h4):(2'h2)] : (&wire21));
            end
          if ((reg25 ?
              reg26 : (~&($unsigned($signed((8'haa))) > reg39[(4'hd):(3'h5)]))))
            begin
              reg41 <= {$signed((wire17[(3'h4):(2'h3)] ?
                      (-(~|reg28)) : ((reg30 ?
                          reg35 : reg27) >> $unsigned(reg34)))),
                  $signed($unsigned(reg32[(1'h1):(1'h0)]))};
              reg42 <= ($unsigned(reg32) ?
                  wire19 : (wire20 ? (8'hbe) : (-$signed($signed(reg30)))));
              reg43 <= (^($unsigned($signed($signed(reg31))) & {reg25[(4'h8):(4'h8)],
                  reg40}));
            end
          else
            begin
              reg41 <= reg32;
              reg42 <= reg23;
              reg43 <= {(reg24 ?
                      reg42[(1'h0):(1'h0)] : $signed(((7'h42) ?
                          reg27[(3'h4):(3'h4)] : reg43[(2'h3):(2'h2)]))),
                  $signed(wire21)};
              reg44 <= $unsigned((|((7'h40) ?
                  (^~(wire20 ? wire19 : wire21)) : ({reg40, reg31} ?
                      {wire18, (8'ha3)} : $unsigned(reg41)))));
              reg45 <= reg38;
            end
          reg46 <= reg26;
          reg47 <= reg24[(2'h3):(2'h2)];
          if (reg42[(4'h8):(2'h3)])
            begin
              reg48 <= $unsigned(((reg42[(3'h5):(1'h1)] >> {{wire17},
                  $signed((8'ha0))}) != reg36[(2'h2):(2'h2)]));
              reg49 <= ({reg43,
                  {(reg39[(3'h7):(3'h7)] > ((8'had) ?
                          reg26 : reg22))}} & ($unsigned((~|$unsigned((8'ha6)))) ^~ ({(reg46 < wire19),
                      $unsigned((8'ha5))} ?
                  ($signed(reg26) ?
                      $unsigned((8'h9c)) : {reg46,
                          (8'ha2)}) : ($unsigned((8'hbb)) - (reg30 ?
                      reg28 : wire19)))));
            end
          else
            begin
              reg48 <= $unsigned($unsigned($signed(((|reg47) >= (wire21 >>> reg38)))));
              reg49 <= reg35[(2'h2):(1'h0)];
            end
        end
    end
  assign wire50 = $signed(((^~reg26[(3'h5):(1'h0)]) ~^ reg27));
  assign wire51 = (({$unsigned($unsigned(reg24)), reg43} ?
                      (^~($signed(reg46) << wire19)) : ($unsigned((reg42 ?
                          (8'hbf) : (7'h44))) >>> ({wire19} | (+reg27)))) < {$unsigned(({reg47} ^ (8'had)))});
  always
    @(posedge clk) begin
      reg52 <= ($unsigned($signed((~wire18))) & (({reg38[(3'h6):(3'h6)]} ?
          ((^reg28) >= {wire20,
              (8'hb1)}) : (reg33 << (reg49 << reg44))) == ($signed($signed(reg23)) ?
          (8'haf) : $signed((^~reg28)))));
    end
  always
    @(posedge clk) begin
      reg53 <= ((^$signed(reg27[(3'h5):(1'h1)])) < ((-reg28) != reg35[(2'h2):(1'h1)]));
      reg54 <= $unsigned((~|(((reg32 ? reg35 : reg43) ?
              $unsigned(reg23) : reg37[(3'h5):(1'h0)]) ?
          $unsigned((reg25 ? reg49 : reg28)) : ($unsigned(reg31) ?
              $unsigned(wire17) : {reg37, reg49}))));
    end
  assign wire55 = $signed((8'hb7));
endmodule
