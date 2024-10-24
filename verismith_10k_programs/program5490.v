module top
#(parameter param205 = (!((|(+(~^(8'hb8)))) ? ((^~(^(8'hbd))) & (((8'hb8) ? (8'hbe) : (7'h44)) ? ((8'hb7) ? (8'hbe) : (7'h41)) : ((8'hb0) ? (8'hb0) : (8'had)))) : ((~|((8'hb2) >>> (8'hb9))) ? ((8'ha9) ? (8'hb4) : (&(8'haa))) : (^{(8'hb2)})))), 
parameter param206 = ((~|{((8'hac) && (!param205))}) >>> (8'hab)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire204;
  wire signed [(4'hd):(1'h0)] wire199;
  wire [(2'h3):(1'h0)] wire198;
  wire [(5'h15):(1'h0)] wire186;
  wire [(5'h12):(1'h0)] wire182;
  wire [(5'h12):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire105;
  wire signed [(5'h13):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire184;
  reg signed [(4'ha):(1'h0)] reg203 = (1'h0);
  reg [(5'h12):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg187 = (1'h0);
  reg [(5'h12):(1'h0)] reg188 = (1'h0);
  reg [(5'h15):(1'h0)] reg189 = (1'h0);
  reg [(2'h2):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg191 = (1'h0);
  reg [(5'h14):(1'h0)] reg192 = (1'h0);
  reg [(5'h14):(1'h0)] reg193 = (1'h0);
  reg [(3'h7):(1'h0)] reg194 = (1'h0);
  reg [(4'h8):(1'h0)] reg195 = (1'h0);
  reg [(3'h4):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg197 = (1'h0);
  assign y = {wire204,
                 wire199,
                 wire198,
                 wire186,
                 wire182,
                 wire106,
                 wire105,
                 wire104,
                 wire102,
                 wire184,
                 reg203,
                 reg202,
                 reg201,
                 reg107,
                 reg108,
                 reg109,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 reg197,
                 (1'h0)};
  module4 #() modinst103 (.clk(clk), .wire5((8'hb5)), .wire6(wire1), .wire7(wire3), .wire8(wire0), .y(wire102), .wire9(wire2));
  assign wire104 = wire1;
  assign wire105 = (+(!($signed((~wire104)) | ($signed(wire0) ?
                       (wire2 ~^ wire1) : (wire102 << wire1)))));
  assign wire106 = wire102[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg107 <= (~|(((^$signed(wire104)) ? wire3 : wire102) <<< ({(wire105 ?
              wire2 : wire0),
          (wire105 ? wire0 : wire1)} < $unsigned($unsigned(wire104)))));
      reg108 <= ((~^wire1[(4'h8):(1'h0)]) ?
          $signed((~^$signed((8'hb6)))) : $unsigned(reg107));
      reg109 <= reg107[(2'h2):(2'h2)];
    end
  module110 #() modinst183 (.wire111(wire106), .wire113(wire3), .wire114(wire1), .clk(clk), .y(wire182), .wire115(wire102), .wire112(wire0));
  module152 #() modinst185 (.wire153(wire182), .wire154(wire2), .wire155(wire105), .wire156(wire106), .wire157(wire1), .clk(clk), .y(wire184));
  assign wire186 = wire1[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg187 <= $unsigned({(8'hb4)});
      if ($signed(({(wire184[(4'hf):(3'h5)] || $signed(wire186)), (~(8'ha8))} ?
          {($unsigned(reg187) <<< {wire105}),
              $signed($unsigned((8'hab)))} : ($unsigned((&wire186)) & $signed($signed(reg107))))))
        begin
          reg188 <= (~|$signed({wire1[(4'h8):(2'h3)]}));
          reg189 <= $signed($signed((~^$signed(wire184))));
          if ($signed(({((-wire1) ?
                      wire2[(3'h6):(3'h4)] : wire182[(2'h3):(1'h0)])} ?
              (wire1 < ({wire184} != wire104)) : $unsigned((~(reg188 ?
                  reg187 : (8'hbf)))))))
            begin
              reg190 <= $signed($signed(wire106[(4'he):(3'h6)]));
              reg191 <= reg189;
              reg192 <= ($unsigned({reg108}) ?
                  $unsigned($unsigned($signed((8'ha3)))) : $unsigned($signed(reg191)));
              reg193 <= ((8'hbd) != $unsigned($unsigned((~wire1))));
              reg194 <= wire184[(2'h2):(2'h2)];
            end
          else
            begin
              reg190 <= ($signed(reg192) & (reg107 ?
                  $unsigned(((wire0 ? (8'had) : wire186) ?
                      $unsigned(wire102) : reg188[(2'h2):(1'h0)])) : reg109));
            end
          reg195 <= reg193[(4'he):(3'h6)];
        end
      else
        begin
          reg188 <= {$unsigned($unsigned((wire102[(4'hf):(4'hc)] * (~wire1)))),
              reg187};
        end
      reg196 <= $unsigned($unsigned((((wire2 < wire3) ?
          (reg109 ? wire2 : reg191) : $signed(wire186)) - (8'ha2))));
      reg197 <= wire102;
    end
  assign wire198 = ($signed($signed({(8'h9f)})) != {(8'ha1)});
  module152 #() modinst200 (.wire153(wire102), .wire154(reg195), .wire155(reg193), .wire156(reg188), .wire157(wire106), .y(wire199), .clk(clk));
  always
    @(posedge clk) begin
      reg201 <= ((reg109 ?
              ((+{reg191}) ?
                  $unsigned((reg196 ?
                      reg108 : reg191)) : reg195[(3'h6):(3'h5)]) : $unsigned(reg196)) ?
          (~^wire182) : (~|($unsigned(wire184) << reg190[(1'h1):(1'h0)])));
      reg202 <= ({{$unsigned($unsigned(wire182)),
                  {(reg193 ? reg195 : reg196), wire106}},
              reg197[(2'h2):(2'h2)]} ?
          (wire3[(4'hd):(3'h5)] ~^ wire105) : wire3);
      reg203 <= (8'hbc);
    end
  assign wire204 = {$signed($unsigned((8'h9e))), wire198[(2'h3):(1'h1)]};
endmodule

module module110
#(parameter param181 = ((((+((7'h40) ? (8'hbe) : (8'hac))) ? {((8'hb0) ? (7'h42) : (8'hab))} : {(+(7'h44)), ((8'hba) - (8'h9d))}) ? (~^(((8'ha0) <= (7'h42)) ? (~^(8'hb3)) : {(8'hb4)})) : (^(^((8'hb6) ? (8'ha5) : (8'ha3))))) ? (8'hb3) : (-((((8'hbe) ? (7'h43) : (8'ha9)) ? {(8'ha5), (8'hab)} : ((7'h40) <= (8'hb4))) == (~{(8'hbb), (8'ha1)})))))
(y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'h209):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire115;
  input wire [(4'hc):(1'h0)] wire114;
  input wire [(5'h11):(1'h0)] wire113;
  input wire signed [(4'ha):(1'h0)] wire112;
  input wire [(5'h10):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire180;
  wire [(4'hd):(1'h0)] wire179;
  wire [(5'h12):(1'h0)] wire178;
  wire signed [(4'h8):(1'h0)] wire177;
  wire signed [(4'h9):(1'h0)] wire176;
  wire signed [(4'hd):(1'h0)] wire175;
  wire signed [(4'hb):(1'h0)] wire172;
  wire signed [(4'ha):(1'h0)] wire151;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire125;
  wire [(5'h12):(1'h0)] wire124;
  wire [(5'h13):(1'h0)] wire123;
  wire [(4'ha):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire121;
  reg signed [(3'h7):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(4'hb):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(4'hf):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg150 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire172,
                 wire151,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 reg174,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg116 <= ($unsigned((wire111[(2'h2):(1'h0)] ?
              (~|(wire112 ? wire115 : wire112)) : wire111)) ?
          wire111 : wire115);
      reg117 <= ($unsigned(wire115[(4'hd):(4'ha)]) ?
          (7'h43) : {((((7'h44) ?
                  wire115 : wire112) ~^ wire115) * (reg116[(4'h9):(3'h4)] - $signed(wire111)))});
      reg118 <= (~wire115[(4'h8):(3'h4)]);
      reg119 <= $signed($signed((&$unsigned($unsigned(reg118)))));
      reg120 <= reg119[(3'h4):(2'h2)];
    end
  assign wire121 = {$unsigned(($signed((^wire112)) ?
                           $signed((|(7'h42))) : (reg116 ^~ $unsigned((8'haa))))),
                       ($unsigned(reg116) ?
                           wire111[(4'hb):(3'h5)] : reg120[(3'h6):(2'h3)])};
  assign wire122 = (~&wire111[(2'h2):(2'h2)]);
  assign wire123 = (^~(~^wire121));
  assign wire124 = (wire112[(3'h5):(3'h4)] ?
                       {((wire121 ? reg116 : $unsigned(reg117)) <<< ({wire113} ?
                               (~|reg117) : reg120))} : wire121);
  assign wire125 = wire113[(4'he):(4'h8)];
  assign wire126 = ($signed(wire112) <= wire113);
  always
    @(posedge clk) begin
      if ($signed(wire112))
        begin
          reg127 <= reg117[(4'h9):(2'h3)];
          reg128 <= (~|($unsigned($unsigned((reg116 ?
              wire123 : wire126))) + ((reg119 <<< (reg118 ? reg117 : reg127)) ?
              ($unsigned(reg127) ?
                  (reg119 << wire126) : $unsigned(wire111)) : $signed((reg116 || wire126)))));
          if ($signed($signed($unsigned(reg120))))
            begin
              reg129 <= $signed($signed((($unsigned(wire113) ?
                  (reg127 ?
                      (7'h44) : (8'hb7)) : $signed(wire126)) ~^ $signed($signed(reg128)))));
              reg130 <= (^~wire113[(2'h2):(1'h0)]);
              reg131 <= (wire125[(4'hf):(4'hb)] ?
                  wire115 : $unsigned($unsigned({reg117})));
            end
          else
            begin
              reg129 <= (~|$unsigned((~|(&reg128[(3'h7):(1'h1)]))));
              reg130 <= $signed((~$signed((~^(reg130 << reg130)))));
              reg131 <= wire126;
              reg132 <= reg118[(2'h3):(2'h2)];
              reg133 <= ($signed((^~(~^wire114[(3'h7):(3'h5)]))) && {((+(reg119 ^~ reg119)) ?
                      {(-wire111)} : wire124)});
            end
          reg134 <= $signed($signed(($unsigned((|(8'ha3))) || $signed($signed(wire122)))));
        end
      else
        begin
          if ((((|$signed(wire115[(3'h6):(2'h2)])) ?
              ($unsigned(reg131[(3'h6):(1'h1)]) ?
                  (+$unsigned(reg128)) : $unsigned(reg116)) : reg129) >>> $unsigned((|wire123))))
            begin
              reg127 <= $signed($unsigned($signed(reg120)));
              reg128 <= wire124[(3'h5):(1'h1)];
              reg129 <= (((reg133[(4'h9):(2'h3)] >>> $signed($unsigned(wire124))) ?
                      wire115 : (wire112[(3'h6):(2'h3)] <= ($signed(wire126) ?
                          (reg117 - reg129) : $unsigned(reg118)))) ?
                  (-(-$unsigned($signed(reg131)))) : $unsigned(reg116));
              reg130 <= reg120;
              reg131 <= ((reg127 ?
                      ((wire126 <= $unsigned(reg118)) ?
                          $signed({reg119,
                              reg130}) : reg134[(3'h7):(3'h7)]) : $signed($unsigned(reg128))) ?
                  ((^wire122[(3'h4):(2'h2)]) ?
                      {$unsigned({reg120}),
                          $signed((wire125 ?
                              wire113 : (8'hbc)))} : wire115) : (((reg130[(4'hb):(3'h6)] ?
                          {wire125} : $unsigned(reg128)) < (&$signed((7'h42)))) ?
                      reg120[(4'hf):(4'hb)] : reg130));
            end
          else
            begin
              reg127 <= reg118;
            end
          reg132 <= $signed($signed((reg130 & $unsigned(wire121[(1'h1):(1'h1)]))));
          reg133 <= reg129[(5'h12):(4'h9)];
          if ((^~(wire111[(4'ha):(3'h4)] == (wire115 ?
              $signed((wire123 ? reg131 : wire124)) : ((&wire114) ?
                  (~|wire112) : {(8'ha1)})))))
            begin
              reg134 <= $unsigned(((~^$unsigned($signed(wire123))) <= $signed($unsigned($unsigned(reg127)))));
              reg135 <= $signed(wire111[(4'hb):(3'h5)]);
              reg136 <= $signed(wire121);
            end
          else
            begin
              reg134 <= ($signed(reg132[(2'h2):(2'h2)]) ~^ {$signed((|wire125[(3'h7):(3'h4)])),
                  ($unsigned($unsigned(wire113)) ?
                      (reg119 ?
                          (reg133 ?
                              wire114 : (8'ha9)) : $signed(reg128)) : $unsigned(reg128))});
              reg135 <= (7'h41);
            end
        end
      if ($unsigned($unsigned($signed(((wire111 ?
          wire125 : wire115) > $unsigned((7'h42)))))))
        begin
          reg137 <= wire111[(4'hb):(2'h3)];
          reg138 <= $unsigned(((-({wire126} ?
                  $unsigned(reg131) : (wire111 < (8'hbc)))) ?
              reg118[(2'h2):(1'h1)] : wire125));
          reg139 <= (^~$signed(wire124[(5'h10):(1'h0)]));
          reg140 <= (((wire112[(3'h4):(2'h3)] ?
                      (~(~reg128)) : ($unsigned(reg132) < ((8'hbc) * reg130))) ?
                  $unsigned(wire114) : ($signed((^~reg128)) - $signed((reg117 + wire122)))) ?
              $signed({$unsigned($signed(reg136)),
                  $unsigned(reg117[(4'hc):(4'ha)])}) : wire114[(3'h7):(3'h5)]);
          if ({(~(8'hba)), wire115[(4'h8):(3'h6)]})
            begin
              reg141 <= (+(wire125[(1'h1):(1'h0)] ?
                  reg120 : (reg119[(3'h5):(1'h0)] ?
                      $unsigned($unsigned(reg133)) : ((reg120 ?
                          (8'hac) : reg134) + (reg131 | reg129)))));
              reg142 <= (reg120 ?
                  $signed(($unsigned((8'hbb)) ?
                      (^(wire125 ?
                          reg129 : reg133)) : $unsigned((7'h40)))) : $signed((~((wire124 ?
                      wire126 : reg138) - (reg119 ? reg127 : wire113)))));
            end
          else
            begin
              reg141 <= $signed({{((reg117 & reg117) - $signed((8'h9d)))}});
              reg142 <= {{$signed($signed(reg120)),
                      (((reg130 == reg141) ^ (reg116 == reg127)) && ((reg128 << reg137) ?
                          reg116[(1'h0):(1'h0)] : $signed(reg136)))},
                  $unsigned({(~&$signed(wire122))})};
              reg143 <= reg138[(5'h10):(3'h4)];
            end
        end
      else
        begin
          if ((reg132 + $unsigned($signed(reg133[(4'hc):(4'hb)]))))
            begin
              reg137 <= (reg135[(1'h0):(1'h0)] < {(reg131[(4'h8):(3'h6)] <= (^~$unsigned(wire111)))});
              reg138 <= (wire114[(2'h2):(2'h2)] != $signed(((!{reg129}) ?
                  $signed(reg135) : (reg134[(4'hd):(2'h3)] > (^reg129)))));
              reg139 <= ($signed((8'haa)) || wire114[(4'hc):(4'h8)]);
              reg140 <= ((((|reg140[(3'h7):(3'h4)]) ?
                  (-reg119) : (~^$unsigned(wire125))) >> (((!reg136) - (+reg132)) ?
                  $signed(((8'hac) >>> reg136)) : (-(reg136 ?
                      wire111 : wire112)))) & (~|(($unsigned(wire125) ?
                      (^wire115) : (-reg119)) ?
                  reg140[(4'h9):(2'h3)] : $unsigned((!reg138)))));
            end
          else
            begin
              reg137 <= reg135;
              reg138 <= (reg139[(4'h9):(2'h3)] | ((^~(reg128 ?
                  reg142 : $unsigned(reg120))) <= ($signed((reg137 || reg118)) ?
                  {$signed(reg143),
                      (wire126 ?
                          wire126 : reg131)} : $signed(reg128[(4'h8):(1'h1)]))));
              reg139 <= (((reg118 << reg139) ?
                      $signed({$signed(reg135),
                          reg139[(3'h4):(2'h3)]}) : (~wire126)) ?
                  ({$signed($unsigned((7'h43)))} ?
                      reg127 : $signed((((8'ha5) ~^ wire121) ?
                          (|(8'hae)) : (reg139 ?
                              (8'hb9) : reg140)))) : (reg120 == wire111[(1'h1):(1'h1)]));
            end
        end
      if ((-($signed(wire111) >>> ($unsigned($unsigned((8'ha3))) ?
          (^~reg116[(3'h5):(3'h5)]) : (8'hb9)))))
        begin
          reg144 <= $signed(reg117);
          if (((|((~{reg128, reg118}) ?
              ($unsigned((7'h40)) ?
                  $signed(reg131) : reg141[(4'hd):(3'h7)]) : wire122[(3'h6):(3'h4)])) < {(^$unsigned((~&reg130)))}))
            begin
              reg145 <= {$unsigned($unsigned(reg140[(1'h0):(1'h0)])),
                  ({$signed((reg142 ? reg141 : (8'hbd)))} ?
                      wire112 : ($signed(reg138[(4'hc):(3'h6)]) ?
                          $signed((wire126 <= reg141)) : (8'ha5)))};
              reg146 <= ($signed(reg135) ?
                  wire122 : (reg135 ~^ (reg131 ?
                      $signed((8'hbe)) : wire114[(4'ha):(2'h2)])));
            end
          else
            begin
              reg145 <= wire122;
              reg146 <= (reg116 < {($signed((reg119 ? (8'h9e) : wire123)) ?
                      reg117 : (~&wire115))});
              reg147 <= $unsigned(reg127[(3'h5):(2'h2)]);
            end
          reg148 <= reg147;
        end
      else
        begin
          if ((($unsigned($signed((reg118 ?
              wire126 : (8'ha7)))) | ($signed((|reg147)) ?
              (^{reg135}) : $signed(wire125))) != reg116[(3'h7):(3'h4)]))
            begin
              reg144 <= reg131[(4'h8):(1'h0)];
            end
          else
            begin
              reg144 <= $unsigned(wire124);
            end
        end
      reg149 <= ($signed($signed({(reg128 ? reg116 : (8'ha1)),
          $unsigned((8'hbc))})) | $unsigned($signed($signed(reg127[(2'h2):(1'h0)]))));
      reg150 <= wire113[(3'h5):(1'h0)];
    end
  assign wire151 = ($unsigned($signed((~(^reg116)))) > {reg119, reg127});
  module152 #() modinst173 (wire172, clk, reg133, reg127, reg150, reg143, reg119);
  always
    @(posedge clk) begin
      reg174 <= (|$signed((~^$unsigned((reg149 ? (8'ha5) : (8'ha8))))));
    end
  assign wire175 = wire172;
  assign wire176 = ($signed(wire175) ?
                       ((reg149 < ((reg149 ?
                           wire114 : wire126) || $signed((8'hac)))) && reg127[(4'hb):(2'h2)]) : {$signed(((~|(8'hbf)) ?
                               $signed((8'hb0)) : $signed(reg147))),
                           reg137});
  assign wire177 = reg116[(2'h3):(1'h0)];
  assign wire178 = (~|{{((8'h9d) + $signed(reg149))}});
  assign wire179 = wire126;
  assign wire180 = $unsigned((^~(reg148 ? (~$unsigned(reg145)) : reg147)));
endmodule

module module4
#(parameter param101 = ((({((8'hb0) > (8'hb8)), (~(8'hb1))} ? {((8'hb1) ? (8'hb8) : (8'ha3))} : {{(8'hb0)}}) ? {({(8'ha2), (7'h44)} ? ((8'h9f) ^ (8'hb5)) : ((7'h43) ? (8'hb7) : (8'haa)))} : ((^~((8'hbc) ? (8'hbd) : (8'hb0))) <<< ({(8'hbd)} < ((8'ha0) || (8'hae))))) & {((~&((8'h9c) << (8'hb5))) >> ((|(8'hb7)) && {(8'h9f)})), (&(((8'hb3) >> (8'hb2)) ? (-(8'hb7)) : (!(8'ha8))))}))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h1c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  input wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire94;
  wire signed [(3'h4):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire10;
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg71 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire97,
                 wire96,
                 wire94,
                 wire72,
                 wire62,
                 wire61,
                 wire60,
                 wire49,
                 wire48,
                 wire44,
                 wire43,
                 wire41,
                 wire10,
                 reg98,
                 reg45,
                 reg46,
                 reg47,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 (1'h0)};
  assign wire10 = $unsigned(wire5);
  module11 #() modinst42 (.y(wire41), .wire13(wire8), .wire14(wire6), .wire12(wire9), .wire15(wire5), .clk(clk));
  assign wire43 = $signed(((wire7 ~^ wire7[(4'h8):(3'h6)]) ?
                      $signed(((wire8 ? wire6 : wire7) ?
                          wire7 : $signed(wire8))) : $unsigned({(wire10 ?
                              (8'hac) : (8'hb3)),
                          {wire8, wire6}})));
  assign wire44 = ((({$signed(wire7), (wire41 ? wire8 : wire6)} ?
                          $unsigned(wire9) : ({(8'hb1)} ?
                              (~|wire6) : (+wire6))) * $signed($signed(((8'h9d) - wire43)))) ?
                      $signed((^wire7[(3'h6):(2'h2)])) : $unsigned(wire8[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg45 <= wire44;
      reg46 <= wire9;
      reg47 <= $unsigned(wire44);
    end
  assign wire48 = wire7[(5'h10):(4'hd)];
  assign wire49 = wire41[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg50 <= $unsigned(((~wire7) - $unsigned({$unsigned((8'hb9)), wire7})));
      reg51 <= ($unsigned(wire10[(1'h1):(1'h0)]) && $unsigned({wire7}));
      if ($unsigned(reg50))
        begin
          reg52 <= {wire5, $unsigned(reg45[(4'hc):(4'h9)])};
          reg53 <= {wire48};
          if (($unsigned($unsigned((|(wire5 | reg47)))) ^~ $unsigned(wire7)))
            begin
              reg54 <= reg52[(4'hd):(3'h7)];
              reg55 <= ((8'ha1) || (-((~^reg53) ?
                  reg46[(4'h9):(1'h1)] : (reg46[(3'h6):(2'h3)] == {wire41}))));
              reg56 <= (8'hb9);
            end
          else
            begin
              reg54 <= wire7;
              reg55 <= (wire9 | $signed($signed($unsigned((wire8 ?
                  reg54 : reg46)))));
            end
          reg57 <= $unsigned(reg55);
          reg58 <= (wire43[(3'h5):(2'h3)] >= $unsigned(($unsigned({reg53}) ?
              wire48[(3'h4):(2'h2)] : ((wire7 ? wire44 : wire48) ?
                  $unsigned(reg45) : reg54[(3'h4):(3'h4)]))));
        end
      else
        begin
          reg52 <= (|$signed((~|$signed(reg55))));
        end
      reg59 <= $unsigned((7'h44));
    end
  assign wire60 = (|$signed($unsigned($unsigned((wire41 ~^ reg53)))));
  assign wire61 = $signed($signed(wire5));
  assign wire62 = $signed($signed(((((8'hb9) || reg54) >= reg56) ?
                      wire61 : ($unsigned(reg51) ?
                          reg56[(4'hc):(4'hc)] : $unsigned(wire49)))));
  always
    @(posedge clk) begin
      reg63 <= ((((wire9 != (~&reg47)) ?
          {wire7,
              reg56} : (!$unsigned(reg56))) < (-(^~(+reg54)))) << reg56[(5'h10):(3'h7)]);
      reg64 <= ($unsigned(($unsigned(wire6[(1'h1):(1'h1)]) | ((wire49 && (8'hb6)) ?
          $signed(wire62) : $signed(reg57)))) <<< $unsigned($unsigned($unsigned($unsigned(wire60)))));
      reg65 <= ($unsigned(wire10) ? reg59[(3'h5):(1'h1)] : (~reg59));
      reg66 <= {(reg54 ?
              reg46[(1'h1):(1'h0)] : (^(!(reg59 ? (8'hb1) : (8'ha2))))),
          $signed({($unsigned(wire43) >> (reg64 ? wire41 : reg53)),
              ($unsigned(reg47) ?
                  reg46[(4'h9):(4'h9)] : (reg57 ? (8'had) : reg56))})};
      if ($signed((+wire49)))
        begin
          reg67 <= $unsigned(($unsigned($unsigned($unsigned(reg57))) < $signed(((wire60 ?
              reg50 : reg58) ~^ wire62))));
        end
      else
        begin
          reg67 <= ($signed($unsigned(($unsigned(reg53) - $signed(wire62)))) ?
              (~|reg65) : (!$signed($signed(reg47[(2'h3):(2'h2)]))));
          reg68 <= ($unsigned($signed(((reg47 ? wire10 : reg54) - (reg47 ?
                  (8'hba) : wire60)))) ?
              reg47 : reg52[(4'hb):(3'h4)]);
          reg69 <= $unsigned((($signed((wire10 ~^ wire5)) ?
                  {(reg68 ? reg46 : reg55), reg50} : ((reg53 * wire43) ?
                      $unsigned(wire8) : $signed(wire8))) ?
              $unsigned(((8'hb9) ?
                  {reg68} : wire10)) : ({(8'ha9)} >>> $unsigned(reg66[(2'h3):(2'h2)]))));
          reg70 <= reg46;
          reg71 <= reg68[(5'h10):(4'hf)];
        end
    end
  assign wire72 = reg68;
  module73 #() modinst95 (wire94, clk, wire6, wire5, wire62, reg56, wire60);
  assign wire96 = $signed((({{reg52, reg63}} + $unsigned($unsigned(reg54))) ?
                      $unsigned($signed($signed((8'ha1)))) : ((wire10[(2'h2):(2'h2)] ^~ reg57[(1'h1):(1'h0)]) ?
                          wire5 : (~^$unsigned(reg54)))));
  assign wire97 = ((!$signed({{reg67}})) + $signed({wire8, (8'hb0)}));
  always
    @(posedge clk) begin
      reg98 <= reg57[(3'h5):(1'h0)];
    end
  assign wire99 = $signed($signed($unsigned((reg68[(3'h5):(3'h4)] ?
                      (^~wire10) : reg98))));
  assign wire100 = $unsigned(wire94[(4'hb):(2'h3)]);
endmodule

module module73  (y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire78;
  input wire [(4'ha):(1'h0)] wire77;
  input wire [(4'hb):(1'h0)] wire76;
  input wire signed [(5'h11):(1'h0)] wire75;
  input wire signed [(2'h2):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire79;
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire79 = $unsigned($unsigned(wire74[(1'h0):(1'h0)]));
  assign wire80 = wire76;
  assign wire81 = $unsigned(((wire76 ?
                      wire78[(1'h1):(1'h0)] : $unsigned((~^(8'h9e)))) <<< wire78));
  assign wire82 = $unsigned(wire79);
  always
    @(posedge clk) begin
      reg83 <= (wire78 ?
          {(wire75[(5'h10):(1'h1)] ?
                  ((~&wire79) ?
                      {wire76} : (+wire80)) : wire75[(4'hd):(4'hc)])} : wire81[(2'h3):(2'h3)]);
      reg84 <= (wire79[(3'h6):(2'h2)] ?
          (^$signed($unsigned(((8'hac) ^ wire74)))) : ($unsigned((+{wire76})) ?
              ((wire81 ? $unsigned(wire80) : wire77) ?
                  ((wire77 >> wire78) ?
                      wire82[(5'h11):(3'h5)] : $signed(wire79)) : wire79) : (wire81[(4'h8):(3'h6)] ^ ((7'h44) ?
                  $unsigned(wire74) : wire77))));
      reg85 <= (reg84[(3'h7):(3'h5)] - $unsigned((wire81 ?
          ($unsigned(wire79) ?
              ((7'h44) < reg84) : $unsigned(reg83)) : (&{wire77, (8'ha2)}))));
      reg86 <= reg85;
      reg87 <= $signed(($unsigned(wire79[(1'h0):(1'h0)]) ?
          (((~|wire78) ? reg86[(3'h6):(3'h5)] : $unsigned(wire78)) ?
              $signed((^reg84)) : ($unsigned((8'hbb)) >> reg84[(1'h0):(1'h0)])) : reg83));
    end
  assign wire88 = wire79;
  assign wire89 = wire88;
  assign wire90 = wire82;
  assign wire91 = reg87;
  assign wire92 = reg87;
  assign wire93 = wire77[(4'h9):(2'h3)];
endmodule

module module11
#(parameter param39 = ((|((~((8'hb9) <<< (8'hbd))) ? (((8'hba) <<< (8'hb2)) >> {(8'hb3)}) : (|((8'had) ? (8'haa) : (8'ha4))))) * {({((8'h9e) ? (8'hb6) : (8'h9f))} ? (~(&(7'h40))) : (|(|(8'hb3)))), ((((7'h41) ? (8'h9e) : (8'hbc)) ? (-(8'h9d)) : {(8'hb9)}) ? (~((7'h42) ? (8'hb3) : (8'hbf))) : {(^(8'hac))})}), 
parameter param40 = (~&param39))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire signed [(4'hc):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  assign y = {wire17,
                 wire16,
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
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire16 = $unsigned(wire13);
  assign wire17 = (wire12[(1'h1):(1'h1)] ?
                      $signed((($signed((8'hba)) & wire13[(4'he):(4'hd)]) <= ($signed(wire12) ?
                          (wire16 ?
                              (8'h9d) : wire13) : wire12[(2'h3):(2'h2)]))) : (^wire12));
  always
    @(posedge clk) begin
      reg18 <= (^~wire14[(2'h3):(2'h3)]);
      reg19 <= ((~(8'ha0)) != wire17[(1'h0):(1'h0)]);
      reg20 <= wire17[(3'h4):(2'h3)];
      reg21 <= (reg18[(3'h4):(3'h4)] ?
          (wire16 ?
              {$signed($signed((8'hab))),
                  {(reg19 == wire15)}} : ($unsigned((wire15 ^~ wire17)) ?
                  {((8'hbf) == wire14)} : ((!reg19) ?
                      wire14[(2'h2):(1'h0)] : $signed(reg18)))) : $unsigned((~|({reg18} | (8'haa)))));
      reg22 <= (^wire15[(2'h3):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg23 <= (-(-$unsigned($signed(((8'hbc) ? wire14 : wire14)))));
      reg24 <= {$signed(($signed($unsigned(reg19)) <<< wire16)),
          $signed({(|(wire16 ? reg21 : (7'h44)))})};
      if ((-wire16[(3'h6):(1'h0)]))
        begin
          reg25 <= (~$signed(wire12[(4'hb):(4'ha)]));
          if ($signed(wire15))
            begin
              reg26 <= (-$signed({(8'hba), wire12}));
            end
          else
            begin
              reg26 <= {(^reg21[(2'h3):(2'h2)]), reg19};
              reg27 <= (^((^~reg22) >= (8'hbe)));
              reg28 <= $signed((($signed(reg19) ?
                      reg25[(4'hb):(4'h9)] : (~reg26)) ?
                  reg18[(1'h0):(1'h0)] : {(8'hb2), reg20}));
              reg29 <= (reg28 ?
                  reg18[(3'h4):(1'h0)] : $signed($unsigned(({reg21} ?
                      (8'hb5) : (8'h9d)))));
              reg30 <= (reg18[(3'h4):(2'h3)] > (^(((^reg21) ?
                  reg18[(3'h5):(3'h5)] : (^reg21)) ~^ (8'ha2))));
            end
        end
      else
        begin
          reg25 <= wire16;
        end
      if ($signed(wire17[(3'h7):(3'h4)]))
        begin
          reg31 <= $unsigned($unsigned($unsigned((wire13[(1'h1):(1'h1)] ?
              $signed(reg28) : $unsigned(reg20)))));
          reg32 <= $signed(((reg23 - $unsigned((reg20 >= reg30))) ?
              reg28 : ((8'hb1) ?
                  ((reg31 >= wire16) && $unsigned(reg30)) : reg21[(2'h2):(2'h2)])));
          if (({(({(8'ha5)} ? reg22 : (reg23 ? reg19 : reg31)) ?
                  ($signed(wire17) <<< (~|wire16)) : $unsigned((reg21 == reg26)))} >> (+(~|{((8'haa) * reg25),
              reg26}))))
            begin
              reg33 <= (!(&(((~&wire12) ? reg23 : $signed((8'ha9))) ?
                  $signed($unsigned((8'hb8))) : $signed((wire13 ?
                      reg26 : wire16)))));
              reg34 <= ({(~wire16)} ?
                  (~^reg22[(4'he):(1'h0)]) : ({((wire17 | (8'ha1)) ?
                          (8'haa) : $unsigned(reg33))} & ({$signed(reg29)} ~^ ((reg27 | (7'h42)) ?
                      (~reg27) : ((8'ha6) != reg21)))));
            end
          else
            begin
              reg33 <= (wire12[(2'h3):(2'h3)] && reg21);
              reg34 <= $signed(reg24);
            end
          reg35 <= $signed($signed($unsigned($signed(reg23))));
        end
      else
        begin
          reg31 <= reg32[(3'h6):(3'h6)];
          if ($unsigned(reg19))
            begin
              reg32 <= reg27[(4'hc):(3'h5)];
            end
          else
            begin
              reg32 <= (~|$unsigned((-(reg34 <<< (reg35 ^ reg33)))));
              reg33 <= {$signed((^($signed(wire13) >= reg23[(1'h0):(1'h0)]))),
                  $signed({(|reg28)})};
            end
          reg34 <= ($unsigned($signed($signed($unsigned(reg18)))) ?
              $unsigned(reg18[(1'h1):(1'h1)]) : $signed($unsigned((reg20[(4'h9):(4'h8)] ?
                  reg24[(4'he):(3'h4)] : (-reg19)))));
          if ((wire16 ?
              (-(((wire16 ? reg18 : reg29) + (wire17 ? reg25 : reg20)) ?
                  {(reg19 ? (8'hbc) : wire15),
                      $signed(wire13)} : (~^(~|wire14)))) : $signed($unsigned(($unsigned(wire14) ~^ reg26[(1'h0):(1'h0)])))))
            begin
              reg35 <= (reg18 != {(({reg34, reg22} ?
                      $unsigned(wire13) : (reg31 | reg21)) >>> ($signed(reg28) ?
                      {reg21} : wire12)),
                  (reg32 ?
                      (&reg20[(4'h8):(3'h5)]) : $unsigned((reg26 - wire13)))});
              reg36 <= reg28;
              reg37 <= reg26;
            end
          else
            begin
              reg35 <= $signed(wire14);
            end
          reg38 <= (!$signed((((reg31 | (8'hac)) & reg37) | reg20[(4'hf):(4'ha)])));
        end
    end
endmodule

module module152
#(parameter param171 = (|(~|((|(+(8'hae))) ? (((8'h9f) ? (8'hb2) : (8'ha8)) >>> ((8'hb2) * (8'ha5))) : (+((8'ha8) ? (8'hb1) : (8'hb2)))))))
(y, clk, wire157, wire156, wire155, wire154, wire153);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire157;
  input wire [(5'h12):(1'h0)] wire156;
  input wire signed [(2'h2):(1'h0)] wire155;
  input wire signed [(4'h8):(1'h0)] wire154;
  input wire [(4'h9):(1'h0)] wire153;
  wire [(4'h8):(1'h0)] wire170;
  wire signed [(4'h9):(1'h0)] wire169;
  wire [(4'h8):(1'h0)] wire168;
  wire [(4'he):(1'h0)] wire167;
  wire signed [(3'h6):(1'h0)] wire166;
  wire signed [(4'hd):(1'h0)] wire165;
  wire [(5'h14):(1'h0)] wire164;
  wire [(4'hd):(1'h0)] wire158;
  reg [(4'hd):(1'h0)] reg163 = (1'h0);
  reg [(2'h3):(1'h0)] reg162 = (1'h0);
  reg [(5'h15):(1'h0)] reg161 = (1'h0);
  reg [(4'hf):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire158,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 (1'h0)};
  assign wire158 = (wire155[(1'h1):(1'h0)] ?
                       {$unsigned(wire157[(4'hb):(4'hb)])} : ($unsigned(wire155[(2'h2):(1'h1)]) * $signed((7'h42))));
  always
    @(posedge clk) begin
      if ($signed(($signed(wire155) ?
          (($signed(wire157) > $unsigned(wire153)) < wire155[(1'h1):(1'h0)]) : (~({wire157,
              (8'hb8)} <<< wire156)))))
        begin
          reg159 <= (8'h9e);
          reg160 <= ((7'h43) * (wire153 >= wire155[(1'h0):(1'h0)]));
          if (((~^$signed({{wire154, (8'hb8)},
              (7'h41)})) < ((((wire157 << (7'h42)) ?
                  (8'hbf) : (|(8'hb3))) << wire154) ?
              ($signed(wire154) ?
                  (~(wire154 ? reg160 : (8'ha1))) : (wire156 >= (wire153 ?
                      reg160 : (8'hb1)))) : (wire153 ?
                  $unsigned((wire156 ? reg160 : wire154)) : $unsigned((wire156 ?
                      reg159 : reg159))))))
            begin
              reg161 <= $signed(wire155);
              reg162 <= (($signed((reg159 * {wire158})) ?
                  ({(^wire157),
                      (8'hb3)} << (8'hb0)) : (+(+{wire157}))) ~^ (~&(($unsigned(reg160) && reg160[(4'h8):(1'h0)]) || {wire155,
                  wire156})));
            end
          else
            begin
              reg161 <= wire155[(1'h0):(1'h0)];
              reg162 <= {(8'hb0),
                  (~|($unsigned($unsigned((8'h9e))) ?
                      ((reg160 ?
                          reg161 : wire153) || (wire156 >>> reg161)) : ($unsigned((8'hb2)) ?
                          reg162[(1'h1):(1'h0)] : $unsigned(reg162))))};
            end
        end
      else
        begin
          reg159 <= (wire153[(2'h3):(2'h3)] ?
              $unsigned((wire155[(1'h1):(1'h1)] || {(wire157 > wire158),
                  ((8'h9d) ? reg159 : wire157)})) : reg161[(3'h5):(2'h2)]);
          reg160 <= wire157;
          reg161 <= $unsigned((-wire158));
        end
      reg163 <= wire153[(3'h6):(1'h0)];
    end
  assign wire164 = ((8'ha7) | ((~&$unsigned(wire155[(1'h0):(1'h0)])) ?
                       ($unsigned((7'h44)) | ((reg163 - wire157) ?
                           $signed((8'hb6)) : (~&reg163))) : wire156[(4'hf):(3'h6)]));
  assign wire165 = $unsigned(wire158[(4'ha):(4'h9)]);
  assign wire166 = $signed((wire164 ?
                       {$unsigned({wire156, wire165}),
                           ($signed(wire157) ^~ $unsigned((8'hab)))} : (wire153[(1'h0):(1'h0)] == $signed((reg163 ?
                           wire158 : wire154)))));
  assign wire167 = reg162[(2'h3):(2'h2)];
  assign wire168 = wire164[(3'h6):(3'h6)];
  assign wire169 = $unsigned(($unsigned($signed((~^reg161))) == wire168));
  assign wire170 = (+(8'ha3));
endmodule
