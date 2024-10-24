module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire204;
  wire [(5'h13):(1'h0)] wire104;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire206;
  reg [(5'h15):(1'h0)] reg218 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg216 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg215 = (1'h0);
  reg [(5'h11):(1'h0)] reg214 = (1'h0);
  reg [(3'h5):(1'h0)] reg213 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg212 = (1'h0);
  reg [(3'h6):(1'h0)] reg211 = (1'h0);
  reg [(4'hb):(1'h0)] reg210 = (1'h0);
  reg [(3'h7):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg208 = (1'h0);
  assign y = {wire204,
                 wire104,
                 wire5,
                 wire6,
                 wire7,
                 wire22,
                 wire102,
                 wire206,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 (1'h0)};
  assign wire5 = ((-((wire1[(4'h8):(4'h8)] * (-wire0)) <= wire2[(3'h6):(1'h0)])) | ((~|(~^(^~wire1))) ?
                     ((&wire3[(4'h8):(3'h6)]) ?
                         (wire4[(3'h6):(1'h1)] ?
                             $signed(wire4) : wire4[(4'hb):(4'h9)]) : ({wire4} > (wire1 ?
                             wire0 : wire1))) : wire4));
  assign wire6 = (8'h9d);
  assign wire7 = $signed(($unsigned($unsigned(wire6[(3'h6):(2'h2)])) & ((8'hb5) == $signed((~|wire3)))));
  module8 #() modinst23 (.wire10(wire2), .wire12(wire1), .wire9(wire7), .clk(clk), .wire11(wire0), .y(wire22));
  module24 #() modinst103 (.y(wire102), .wire27(wire22), .wire26(wire2), .wire28(wire4), .wire29(wire1), .wire25(wire0), .clk(clk));
  assign wire104 = $unsigned(wire6[(4'h9):(3'h5)]);
  module105 #() modinst205 (.wire106(wire5), .wire109(wire0), .wire107(wire7), .wire110(wire3), .clk(clk), .y(wire204), .wire108(wire4));
  module24 #() modinst207 (.wire27(wire104), .wire26(wire22), .clk(clk), .wire25(wire4), .wire28(wire2), .y(wire206), .wire29(wire3));
  always
    @(posedge clk) begin
      reg208 <= ($unsigned($signed(wire104)) & $signed((8'hac)));
      reg209 <= (~&($signed((((8'ha7) ? wire2 : wire204) ?
          (8'h9e) : (wire104 || wire6))) > (!(wire5[(4'h9):(1'h0)] < wire0))));
      reg210 <= (~|$unsigned((($signed(wire102) * (~|wire2)) <= (+((8'h9e) * wire7)))));
      if ((~&wire4))
        begin
          reg211 <= (((({reg208, wire204} ? {wire7} : wire206) ?
                  (wire6[(2'h2):(1'h1)] ^ {wire1,
                      wire6}) : wire0) < $signed(wire6)) ?
              $signed({$unsigned((~|wire0)),
                  ({wire5} ? $signed(wire4) : $signed(wire22))}) : (8'hae));
          reg212 <= $unsigned((~^wire1));
        end
      else
        begin
          if (wire206[(1'h0):(1'h0)])
            begin
              reg211 <= (((((wire4 ? reg208 : reg212) > $signed(wire22)) ?
                          (((8'ha1) ? (8'hb9) : reg210) | (reg210 ?
                              wire206 : wire3)) : ($signed(wire104) <<< (|wire22))) ?
                      wire6[(3'h6):(3'h5)] : (~|wire3)) ?
                  $unsigned(wire104) : $unsigned((wire5 ?
                      $unsigned((wire2 ?
                          wire0 : reg209)) : (~$signed(wire6)))));
            end
          else
            begin
              reg211 <= ((wire3 ?
                  (((~(8'ha3)) * wire4[(4'ha):(3'h4)]) ^ $signed({(8'hb5)})) : wire2[(5'h12):(1'h1)]) > {wire6});
              reg212 <= $unsigned(wire22[(4'hd):(3'h6)]);
              reg213 <= ((-{(wire22[(4'he):(4'ha)] ?
                      (^(8'ha3)) : wire2[(4'h8):(1'h0)]),
                  $unsigned({reg210})}) ~^ (wire4 ? wire0 : wire204));
              reg214 <= wire4;
              reg215 <= $signed({(+$unsigned((wire2 ? (8'hb6) : wire206)))});
            end
          reg216 <= ({wire5[(4'hc):(1'h0)], reg211} ?
              reg208 : ((8'h9d) ~^ wire6[(4'h9):(2'h2)]));
          if (reg209)
            begin
              reg217 <= reg211;
            end
          else
            begin
              reg217 <= (wire7 ?
                  (|(wire102 ?
                      wire104[(5'h11):(2'h2)] : wire0[(5'h11):(4'he)])) : $signed($signed($unsigned($signed(reg209)))));
              reg218 <= wire104[(4'hf):(1'h1)];
            end
        end
    end
endmodule

module module105
#(parameter param202 = ({(8'h9d), ((((8'hbf) < (8'hb3)) << ((8'ha8) ? (8'hbf) : (8'hb1))) ? (~{(8'hb3)}) : (-(~|(8'h9d))))} ? (+{{(~(8'hb7)), ((8'ha6) + (7'h44))}}) : ((+(((8'hbf) & (8'hae)) ? ((8'hb3) || (7'h40)) : (&(8'ha9)))) != ((~^((8'ha4) <= (8'ha5))) < (^~((8'haa) ? (8'hb2) : (8'hbe)))))), 
parameter param203 = (~((~&(^~{param202})) != (param202 ? (+(param202 != param202)) : param202))))
(y, clk, wire110, wire109, wire108, wire107, wire106);
  output wire [(32'h287):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire110;
  input wire signed [(4'ha):(1'h0)] wire109;
  input wire signed [(4'hd):(1'h0)] wire108;
  input wire [(2'h2):(1'h0)] wire107;
  input wire [(4'hf):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire201;
  wire signed [(5'h15):(1'h0)] wire200;
  wire [(5'h13):(1'h0)] wire198;
  wire signed [(2'h3):(1'h0)] wire140;
  wire signed [(4'hb):(1'h0)] wire124;
  wire [(3'h6):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire121;
  wire [(3'h5):(1'h0)] wire120;
  wire signed [(5'h11):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire118;
  wire [(5'h13):(1'h0)] wire117;
  wire signed [(3'h4):(1'h0)] wire116;
  wire [(5'h14):(1'h0)] wire115;
  wire [(4'he):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire113;
  wire [(5'h15):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire111;
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(5'h14):(1'h0)] reg132 = (1'h0);
  reg [(5'h10):(1'h0)] reg133 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(4'h8):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg136 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(5'h11):(1'h0)] reg143 = (1'h0);
  reg [(3'h4):(1'h0)] reg144 = (1'h0);
  reg [(5'h15):(1'h0)] reg145 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(4'he):(1'h0)] reg150 = (1'h0);
  reg [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg154 = (1'h0);
  reg signed [(4'he):(1'h0)] reg155 = (1'h0);
  reg [(2'h3):(1'h0)] reg156 = (1'h0);
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg [(4'hf):(1'h0)] reg158 = (1'h0);
  assign y = {wire201,
                 wire200,
                 wire198,
                 wire140,
                 wire124,
                 wire123,
                 wire122,
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
                 reg125,
                 reg126,
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
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 (1'h0)};
  assign wire111 = {{(8'hb5),
                           (wire108 ?
                               $unsigned({wire106}) : (+(wire106 ?
                                   wire109 : wire110)))}};
  assign wire112 = {(($signed({wire111}) ?
                           {(-wire106)} : $unsigned($signed(wire110))) ^ ((^(wire109 << wire106)) << $signed({wire109}))),
                       {(wire107 ?
                               ((&wire110) >= $unsigned((8'hb0))) : $signed({wire109,
                                   wire111}))}};
  assign wire113 = wire110[(3'h4):(2'h3)];
  assign wire114 = wire111;
  assign wire115 = (wire112 - wire111);
  assign wire116 = $signed({{$unsigned((wire115 ? wire111 : wire113)),
                           {(+wire110), {wire108, wire112}}},
                       wire112[(4'h9):(1'h0)]});
  assign wire117 = $unsigned(({(wire106[(4'hc):(3'h7)] == $signed(wire108))} ?
                       ((wire111 >> {wire115, wire116}) ?
                           wire112 : ($unsigned(wire109) ?
                               ((8'hba) ?
                                   wire107 : (8'hbc)) : (+wire106))) : (wire116[(2'h2):(1'h0)] && (wire110 << wire114))));
  assign wire118 = $signed((($unsigned((wire116 ?
                           (8'hb0) : wire114)) + ((~^wire109) ?
                           wire115 : wire107[(1'h0):(1'h0)])) ?
                       (-wire108) : wire114));
  assign wire119 = ((({{wire108, wire115}} ?
                       $unsigned({wire114,
                           wire107}) : wire117[(3'h6):(1'h0)]) || wire118[(1'h1):(1'h1)]) ^~ (~$signed(wire112)));
  assign wire120 = $unsigned((~{wire110, wire108[(3'h6):(1'h0)]}));
  assign wire121 = wire115[(4'ha):(4'h9)];
  assign wire122 = ($unsigned({(~|$signed(wire108)),
                       $unsigned({wire118})}) <= {wire112});
  assign wire123 = $unsigned(($unsigned(wire122[(4'hd):(4'h9)]) ?
                       (7'h44) : wire121));
  assign wire124 = ((!wire112) ?
                       {$unsigned(wire113),
                           (wire119 * wire106[(4'hf):(2'h3)])} : (~|$signed((wire118 ^~ wire109[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg125 <= wire116;
      if ($signed(wire107))
        begin
          reg126 <= wire120;
          if ((!(wire113[(3'h6):(3'h6)] ~^ (^$signed(wire122)))))
            begin
              reg127 <= wire115[(4'he):(4'hb)];
            end
          else
            begin
              reg127 <= (~wire111);
              reg128 <= reg127[(2'h3):(1'h1)];
            end
          reg129 <= wire107;
        end
      else
        begin
          if ((8'had))
            begin
              reg126 <= $signed($signed($signed(wire108)));
              reg127 <= reg129[(3'h4):(2'h3)];
              reg128 <= (wire116[(2'h3):(1'h1)] ?
                  ($signed(wire120) ^ (reg128 >= wire119[(1'h1):(1'h1)])) : ($signed(((reg127 ?
                          (8'ha2) : wire115) ?
                      (8'hba) : (8'hbc))) | ((^~(^(8'haf))) & reg127)));
              reg129 <= $unsigned(wire111[(4'hb):(2'h3)]);
            end
          else
            begin
              reg126 <= (wire114[(4'h9):(3'h7)] ?
                  ($signed(wire119[(4'hb):(3'h7)]) || $signed(wire124)) : reg127);
            end
          if (wire113)
            begin
              reg130 <= (+wire115);
              reg131 <= ((((~{wire116, wire118}) ?
                          $signed((&(7'h43))) : ($signed(wire110) <= $unsigned(reg125))) ?
                      ((!$signed(wire124)) ?
                          ({wire124, wire107} ?
                              $unsigned(wire114) : {wire107}) : {wire116[(1'h0):(1'h0)]}) : wire116[(3'h4):(1'h0)]) ?
                  wire111 : reg126);
              reg132 <= $unsigned($signed($unsigned(({reg127} <= wire115))));
              reg133 <= ($unsigned(wire116) >>> $unsigned((+(~&wire114))));
            end
          else
            begin
              reg130 <= $unsigned((^reg130));
            end
          reg134 <= $unsigned((reg126 ^~ (~|reg132)));
          if ({$unsigned((wire112[(3'h7):(3'h6)] ?
                  (+(wire113 ? (8'haa) : wire119)) : reg126)),
              $unsigned($unsigned($signed(wire114)))})
            begin
              reg135 <= $signed((((wire118[(1'h0):(1'h0)] ?
                          (^wire122) : $signed(wire116)) ?
                      reg130[(1'h0):(1'h0)] : $signed((^wire124))) ?
                  $signed(wire118[(1'h1):(1'h1)]) : ({$signed(wire123)} ?
                      {wire109, (8'hb5)} : $unsigned((~|wire119)))));
              reg136 <= reg126;
              reg137 <= (({(wire118[(1'h0):(1'h0)] ?
                          $signed(wire117) : $signed(reg134))} ?
                  $unsigned(((reg135 || wire121) >> (reg134 ^ reg128))) : {(^(wire121 ?
                          wire112 : wire107)),
                      ($unsigned((8'hb6)) ?
                          wire119[(4'hd):(3'h6)] : $signed(wire123))}) >= wire107);
            end
          else
            begin
              reg135 <= $unsigned(((-{(~reg130)}) ?
                  (reg130[(3'h6):(1'h0)] ?
                      ($unsigned((8'ha7)) ?
                          $unsigned(reg130) : (~reg136)) : reg129[(3'h5):(3'h4)]) : $signed(((wire106 <<< wire106) >= $unsigned((8'h9e))))));
              reg136 <= wire112;
              reg137 <= (|(((((8'h9e) || (8'h9d)) ?
                      $signed(wire117) : (+(8'had))) - wire122) ?
                  wire106 : $signed($unsigned((reg135 && wire117)))));
              reg138 <= ((({$signed(wire116), $unsigned(wire123)} ?
                      wire106[(3'h5):(3'h5)] : ((8'hab) ?
                          ((8'hb7) * (8'ha6)) : wire113[(4'he):(2'h3)])) ?
                  $unsigned(wire113[(4'hf):(4'hb)]) : $unsigned(reg134[(1'h0):(1'h0)])) < (~|$signed(reg126)));
            end
          reg139 <= wire110[(3'h5):(3'h4)];
        end
    end
  assign wire140 = $signed(wire122);
  always
    @(posedge clk) begin
      if (({wire113[(5'h10):(3'h6)]} || $unsigned(wire120[(3'h5):(2'h3)])))
        begin
          reg141 <= $unsigned((~|((+$signed((8'haa))) - (reg138 - (wire122 ^~ reg127)))));
          reg142 <= reg139[(3'h4):(2'h3)];
          reg143 <= (8'hbb);
          if (wire123)
            begin
              reg144 <= $unsigned((^~$signed((~|$signed((7'h43))))));
              reg145 <= reg141;
            end
          else
            begin
              reg144 <= (((8'hb4) + ($signed($signed(wire117)) >>> wire117)) ?
                  ((reg142 ?
                      wire118 : reg133) > wire113) : ({{((8'h9c) >>> (8'ha0)),
                          $unsigned(wire118)},
                      reg137} || (wire121[(1'h0):(1'h0)] ?
                      ($signed(wire114) >>> reg134) : wire120)));
              reg145 <= (|(-$signed((~(wire108 < reg136)))));
            end
        end
      else
        begin
          if (wire109)
            begin
              reg141 <= wire113;
              reg142 <= $unsigned(((wire140[(1'h1):(1'h0)] ?
                      (^(reg128 ? wire140 : reg139)) : (^{wire115})) ?
                  wire122[(1'h1):(1'h0)] : reg135[(3'h7):(3'h7)]));
              reg143 <= reg139[(3'h6):(2'h3)];
              reg144 <= ($signed((~&reg143)) ?
                  ($signed({$signed((8'hb2))}) ?
                      $unsigned($signed($unsigned(reg135))) : $signed({reg143[(3'h4):(3'h4)]})) : wire107);
              reg145 <= (-($signed((7'h40)) ?
                  (((reg126 ? wire122 : reg130) ?
                      (wire123 ^ reg139) : (wire110 - wire106)) + $signed((reg142 >= reg136))) : reg142[(2'h2):(1'h1)]));
            end
          else
            begin
              reg141 <= $unsigned(((!($unsigned(reg145) ?
                      reg137[(2'h2):(1'h0)] : wire112)) ?
                  (($signed(reg126) ?
                      (reg128 ^~ reg143) : (!reg137)) >= $unsigned((wire113 ?
                      reg126 : wire112))) : $unsigned(reg126[(5'h11):(5'h10)])));
              reg142 <= wire107[(2'h2):(1'h0)];
              reg143 <= reg135;
            end
          reg146 <= $unsigned(reg132);
          reg147 <= (-reg131[(3'h7):(1'h0)]);
          reg148 <= (^~wire121);
        end
      reg149 <= wire121;
      if ($signed(($signed(reg136) * $signed((-wire122)))))
        begin
          reg150 <= $signed(($unsigned((~&(wire115 <= wire106))) <<< ($signed((wire121 ?
                  (8'hb8) : reg139)) ?
              wire118 : reg128[(3'h5):(2'h3)])));
          reg151 <= (wire108 ?
              ((8'hb0) ?
                  $unsigned(((reg126 < (8'ha0)) * $signed(reg137))) : (-$signed($unsigned(wire123)))) : {reg150[(1'h1):(1'h1)]});
          reg152 <= $unsigned(((^($unsigned(wire106) >> $unsigned(reg150))) ?
              {$unsigned(wire122[(2'h2):(1'h0)]),
                  reg141[(2'h2):(2'h2)]} : (-((wire120 && wire116) > {reg128,
                  reg147}))));
          if ({$unsigned(($signed((reg136 == reg127)) ?
                  (wire122[(4'he):(3'h6)] || wire140) : ($unsigned(wire124) | (reg142 ?
                      reg151 : (8'hac)))))})
            begin
              reg153 <= wire121[(3'h5):(3'h5)];
              reg154 <= wire116[(1'h1):(1'h0)];
              reg155 <= wire119[(4'h8):(3'h4)];
              reg156 <= $unsigned(reg142[(2'h2):(1'h1)]);
              reg157 <= ({$unsigned(((+wire122) ^ wire120[(3'h5):(1'h0)])),
                      {reg156[(1'h0):(1'h0)], reg133}} ?
                  {(-reg149[(3'h7):(3'h4)])} : $signed(reg138[(3'h4):(2'h3)]));
            end
          else
            begin
              reg153 <= {((^~reg137) >>> {(8'h9d),
                      $signed(((8'ha0) ? wire106 : reg155))}),
                  reg153};
              reg154 <= reg155[(4'hc):(1'h1)];
              reg155 <= (~($unsigned(reg153) >> {$signed((wire120 ?
                      (8'hb9) : reg133)),
                  wire117[(5'h13):(3'h7)]}));
              reg156 <= reg141;
              reg157 <= reg128[(4'he):(2'h3)];
            end
        end
      else
        begin
          if (wire113[(3'h4):(2'h2)])
            begin
              reg150 <= $unsigned((reg148 ?
                  (reg134 ?
                      $signed((wire113 ?
                          wire114 : reg145)) : wire140) : reg156[(2'h2):(2'h2)]));
              reg151 <= $signed($unsigned({(-reg145)}));
              reg152 <= $signed({wire106[(4'ha):(3'h7)],
                  $unsigned((((7'h41) ? wire123 : reg135) >= (~reg142)))});
              reg153 <= {wire115,
                  ({$signed((~(8'hb6))),
                      wire116[(3'h4):(3'h4)]} ~^ $signed((^(^reg145))))};
              reg154 <= $signed($signed((reg153 ?
                  (reg139 ? $signed(reg150) : (~reg126)) : {$signed(reg132)})));
            end
          else
            begin
              reg150 <= reg132[(2'h2):(1'h0)];
              reg151 <= wire118;
              reg152 <= reg149[(4'hb):(4'ha)];
            end
          reg155 <= $unsigned((8'ha0));
        end
      reg158 <= (8'hab);
    end
  module159 #() modinst199 (.clk(clk), .wire162(reg138), .wire164(wire112), .y(wire198), .wire161(reg137), .wire163(wire122), .wire160(reg128));
  assign wire200 = (!wire106);
  assign wire201 = (($signed(reg149[(3'h6):(3'h4)]) ?
                           (wire119[(4'hb):(3'h5)] ?
                               (reg131[(4'h8):(2'h3)] - wire120[(2'h2):(1'h1)]) : (~&(wire140 <= reg130))) : (((~&reg158) ?
                               wire123[(3'h5):(3'h5)] : reg156) < {wire109[(3'h5):(3'h4)],
                               reg133[(1'h0):(1'h0)]})) ?
                       wire124[(4'ha):(3'h4)] : (reg141 ?
                           reg152 : (wire120[(1'h0):(1'h0)] ?
                               ((wire110 >>> reg127) & (|reg133)) : ($unsigned((8'h9e)) ?
                                   $unsigned(reg142) : (~^wire121)))));
endmodule

module module24
#(parameter param101 = ({(-(((8'hab) ? (8'hae) : (8'ha5)) ? (+(8'hb8)) : (~(7'h42)))), (-((|(8'ha2)) ? ((8'ha8) ? (8'ha2) : (7'h44)) : ((8'hbe) ? (8'hba) : (8'hb9))))} | (~|({((8'hba) ? (8'haa) : (8'ha5))} ? (~{(8'hb8), (8'hb5)}) : ((!(8'hba)) ? ((8'hae) >>> (8'had)) : (|(7'h42)))))))
(y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire [(5'h13):(1'h0)] wire27;
  input wire signed [(5'h13):(1'h0)] wire28;
  input wire signed [(4'ha):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire49;
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  assign y = {wire99, wire97, wire51, wire30, wire31, wire49, reg100, (1'h0)};
  assign wire30 = ((8'hb4) ?
                      {(~&(~^wire26)),
                          wire29} : ($unsigned($unsigned((^(8'hac)))) ?
                          $signed($unsigned($signed(wire29))) : $unsigned($signed(wire26))));
  assign wire31 = {{wire26,
                          ($unsigned($unsigned((8'hae))) ?
                              wire27 : {(+wire30)})},
                      wire30};
  module32 #() modinst50 (wire49, clk, wire31, wire29, wire28, wire27, wire26);
  assign wire51 = (!wire25[(4'ha):(4'h9)]);
  module52 #() modinst98 (.wire56(wire28), .wire55(wire49), .wire53(wire51), .wire54(wire25), .clk(clk), .y(wire97));
  assign wire99 = wire51[(4'hb):(4'ha)];
  always
    @(posedge clk) begin
      reg100 <= (($signed(wire30) ^ wire51) ? wire27[(4'ha):(1'h0)] : wire25);
    end
endmodule

module module8
#(parameter param21 = (8'haa))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 (1'h0)};
  assign wire13 = {(({$unsigned(wire12)} + wire10) >= wire12),
                      {$signed($unsigned($unsigned(wire11))),
                          $unsigned({(wire11 <<< (8'hbc))})}};
  assign wire14 = $signed((^(wire13[(4'hc):(1'h1)] ?
                      ((~|wire11) >>> (wire13 ?
                          wire10 : (8'ha4))) : $unsigned({wire9, wire10}))));
  assign wire15 = (+$signed({$unsigned((~wire13))}));
  assign wire16 = $signed(((((wire9 ? wire14 : (8'h9f)) ?
                              (wire13 | (8'hb9)) : {(8'ha5), (8'hb6)}) ?
                          $unsigned({wire15, wire11}) : (wire9 || wire9)) ?
                      (wire14 ?
                          wire12[(3'h7):(3'h7)] : (8'h9c)) : (($unsigned(wire10) + (wire13 ?
                          wire13 : (8'h9e))) | {((8'hbe) <<< wire12),
                          $unsigned(wire12)})));
  assign wire17 = (-(8'ha0));
  assign wire18 = wire16;
  assign wire19 = (wire11[(2'h2):(1'h0)] ?
                      wire10[(5'h11):(3'h6)] : $signed((~|($signed(wire15) == {wire9,
                          wire17}))));
  assign wire20 = wire19[(4'he):(3'h5)];
endmodule

module module52  (y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire56;
  input wire signed [(4'h9):(1'h0)] wire55;
  input wire signed [(5'h15):(1'h0)] wire54;
  input wire [(4'hb):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire57;
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire74,
                 wire73,
                 wire57,
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
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire57 = ((($signed((wire54 ?
                          wire53 : wire55)) & $signed(wire55[(3'h4):(1'h0)])) <= $unsigned(($unsigned(wire54) >= (^wire56)))) ?
                      wire56 : wire55);
  always
    @(posedge clk) begin
      if (wire56)
        begin
          reg58 <= wire55[(1'h1):(1'h0)];
        end
      else
        begin
          reg58 <= (reg58[(1'h1):(1'h0)] || ((($unsigned(wire56) ?
                  $unsigned(reg58) : wire55[(4'h8):(2'h3)]) <<< {(wire57 != wire57),
                  (&wire57)}) ?
              ($unsigned(wire57[(3'h5):(1'h1)]) ^~ {(7'h41),
                  (wire53 + (8'hb4))}) : ((^~wire55) | (|$unsigned(wire56)))));
          if ((wire54 + wire54[(4'hd):(3'h7)]))
            begin
              reg59 <= {(!$signed((&$signed(wire57)))), wire53[(4'h9):(3'h7)]};
              reg60 <= {((+$signed($signed(wire56))) << {(8'ha3)})};
            end
          else
            begin
              reg59 <= wire57;
              reg60 <= ({reg60[(4'ha):(4'h8)],
                  wire57} + $signed(wire56[(4'ha):(3'h6)]));
              reg61 <= $unsigned((^wire56));
              reg62 <= (+(~($unsigned((-reg61)) <<< {reg58})));
              reg63 <= $signed(reg60);
            end
          reg64 <= ($unsigned($signed(wire53[(1'h1):(1'h0)])) | reg58[(2'h2):(2'h2)]);
          reg65 <= reg64;
          reg66 <= (|$signed((($signed(reg64) <<< (wire56 >> reg64)) ?
              {{wire54, reg61}, reg65} : $unsigned(wire56))));
        end
      reg67 <= {{(((wire54 || reg60) <= $signed(reg64)) << {(wire54 >> reg64),
                  (wire56 ? reg59 : (8'ha2))})},
          ((($signed(wire54) ? (~&wire54) : wire57) ?
              $unsigned(((7'h43) * (8'hb6))) : $unsigned((reg66 << (7'h42)))) <= $unsigned(reg64))};
      if ({reg62, ((8'ha9) ? (8'hbb) : $signed((~|(reg60 ? reg59 : reg66))))})
        begin
          reg68 <= reg64[(5'h10):(3'h7)];
        end
      else
        begin
          if (($signed($unsigned($unsigned(reg67[(3'h7):(1'h1)]))) ?
              reg58 : wire53))
            begin
              reg68 <= ((|(!reg65[(4'h9):(3'h6)])) == ((~&$unsigned((|reg62))) ?
                  (-({reg61,
                      (8'hb2)} & $signed(wire55))) : ($signed(reg62[(2'h2):(1'h1)]) ?
                      $signed($unsigned((8'ha6))) : ((~|wire57) ~^ wire55))));
              reg69 <= {(~^reg68)};
              reg70 <= reg61;
              reg71 <= (+reg58);
            end
          else
            begin
              reg68 <= (8'hb9);
              reg69 <= reg64[(3'h4):(2'h2)];
              reg70 <= $signed((^(|reg60[(3'h6):(3'h6)])));
              reg71 <= (~^(($unsigned(reg60[(2'h2):(1'h0)]) ?
                  ($signed(reg63) ?
                      reg71[(1'h0):(1'h0)] : (7'h40)) : wire57[(4'hc):(2'h3)]) ~^ (-reg64[(3'h6):(1'h0)])));
            end
        end
      reg72 <= (!(reg59[(4'hb):(3'h6)] ?
          (&$unsigned(((8'haa) * reg58))) : $signed(($signed(reg69) * $signed((8'hb6))))));
    end
  assign wire73 = reg61[(2'h3):(1'h1)];
  assign wire74 = $signed($unsigned((wire73[(4'h8):(1'h1)] ?
                      ((wire53 ?
                          (8'ha9) : reg66) & $signed((8'hb7))) : ((+wire53) << $signed(reg60)))));
  always
    @(posedge clk) begin
      reg75 <= (($signed(($signed(reg65) == (^~(8'hac)))) ?
          reg71 : reg64[(3'h4):(2'h3)]) < $unsigned(reg58[(1'h1):(1'h1)]));
      reg76 <= reg72[(4'hc):(4'ha)];
      if (($signed((reg60 ^~ ((wire74 || reg68) || $unsigned(wire54)))) ?
          $signed($signed(reg75[(2'h2):(1'h1)])) : reg62))
        begin
          reg77 <= reg70;
          reg78 <= (+reg65);
          if ((~&$signed((|wire57[(2'h2):(1'h0)]))))
            begin
              reg79 <= ($signed(wire53[(1'h0):(1'h0)]) <= {(^{$unsigned(wire56),
                      $unsigned(wire53)})});
            end
          else
            begin
              reg79 <= (~^$unsigned(wire73[(4'ha):(2'h3)]));
              reg80 <= wire73;
            end
        end
      else
        begin
          reg77 <= (~^$unsigned((($signed((8'h9e)) << $unsigned(reg70)) && $signed((wire57 + (7'h43))))));
          if ($signed(((wire55 || (((8'ha7) ?
              reg80 : reg68) > (+reg75))) >>> wire55)))
            begin
              reg78 <= {$unsigned(reg60[(4'ha):(1'h1)])};
              reg79 <= {$unsigned(($unsigned(reg64) ?
                      reg68 : (!$unsigned(reg72)))),
                  reg67};
              reg80 <= (8'hae);
              reg81 <= {$unsigned((8'ha3)),
                  $signed($unsigned((((7'h43) ? reg68 : reg79) <<< {reg80,
                      reg72})))};
            end
          else
            begin
              reg78 <= reg64;
              reg79 <= $signed(reg72);
              reg80 <= reg77[(1'h0):(1'h0)];
              reg81 <= ({(-($unsigned(reg69) - wire73))} ? wire73 : (^(8'hb4)));
              reg82 <= $unsigned(wire57[(3'h4):(2'h2)]);
            end
          if ({$signed((^~$signed((reg71 ? reg82 : reg60))))})
            begin
              reg83 <= {{(reg61[(3'h4):(2'h3)] | (8'ha7)),
                      $unsigned($unsigned($unsigned(wire74)))},
                  reg81};
              reg84 <= ({$unsigned($unsigned($signed(wire57))),
                      {{((8'h9e) >> reg65)}}} ?
                  $unsigned((+($signed(wire53) ?
                      $signed(reg68) : $unsigned(reg69)))) : {{reg71}});
              reg85 <= reg64[(3'h6):(2'h2)];
              reg86 <= (-$signed(reg60[(3'h4):(1'h0)]));
            end
          else
            begin
              reg83 <= (~|reg85);
              reg84 <= (~&(~&reg78));
            end
          reg87 <= reg83[(2'h2):(1'h0)];
          if ({(|reg70), $signed($signed(($signed(reg68) && (-reg85))))})
            begin
              reg88 <= $unsigned((~{(~&reg63)}));
              reg89 <= $unsigned(($signed((~&{reg85, reg77})) ?
                  ((reg60[(3'h7):(3'h5)] & $unsigned((8'h9f))) ?
                      $signed(((8'ha9) ?
                          reg78 : (7'h44))) : ($unsigned(reg62) | {reg72})) : (^$signed((reg70 ^~ wire56)))));
              reg90 <= $signed($signed(reg62[(1'h0):(1'h0)]));
              reg91 <= (-{(~(~&$unsigned(reg61))),
                  $unsigned((^$unsigned(reg88)))});
              reg92 <= {$unsigned($signed((~^{wire53}))),
                  (&$signed($unsigned($signed(reg79))))};
            end
          else
            begin
              reg88 <= $signed(((reg90[(5'h11):(2'h3)] - wire55[(4'h8):(3'h7)]) ^~ reg85[(1'h0):(1'h0)]));
              reg89 <= ($unsigned($signed((~^((8'hbf) ? reg69 : reg68)))) ?
                  ($signed(($unsigned(reg92) >> reg81[(1'h1):(1'h0)])) ?
                      (8'hbf) : $signed(((reg79 & reg86) >>> (8'hbb)))) : (reg86 ?
                      wire73 : (~&({reg83} ? $signed((8'ha4)) : reg76))));
              reg90 <= (reg64[(4'h9):(3'h4)] * ((8'hb0) * reg80[(3'h4):(1'h1)]));
              reg91 <= (~(+$signed({{reg62, (8'hbd)}, (!reg69)})));
              reg92 <= (-$unsigned(($unsigned($signed(wire74)) ^ (reg90 ?
                  (reg70 - reg67) : reg62))));
            end
        end
      reg93 <= ($unsigned(((8'ha3) ?
          wire74[(3'h7):(2'h3)] : reg83[(3'h5):(1'h0)])) > (reg59 ?
          reg82[(2'h2):(2'h2)] : {(8'h9c)}));
    end
  assign wire94 = $signed(wire53[(3'h7):(3'h6)]);
  assign wire95 = (8'haa);
  assign wire96 = (reg71[(1'h0):(1'h0)] ?
                      (reg66 | (reg60 ?
                          (!reg84) : reg72[(2'h3):(2'h3)])) : $unsigned((^(!(reg86 << wire73)))));
endmodule

module module32  (y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire37;
  input wire [(4'ha):(1'h0)] wire36;
  input wire signed [(5'h13):(1'h0)] wire35;
  input wire signed [(5'h13):(1'h0)] wire34;
  input wire signed [(5'h12):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 reg38,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg38 <= ($unsigned(wire37[(3'h6):(3'h5)]) && wire33);
    end
  assign wire39 = wire37[(3'h7):(1'h0)];
  assign wire40 = $unsigned((wire34[(4'ha):(2'h3)] || $signed({$unsigned(wire34),
                      (8'hbf)})));
  assign wire41 = $unsigned((wire34 ^~ (^$signed($signed(wire39)))));
  assign wire42 = (({(+((8'had) ~^ wire33)), (~(wire36 - wire40))} ?
                      wire36[(4'ha):(3'h5)] : ($unsigned(wire33[(5'h10):(4'h9)]) ?
                          ((wire33 ? wire34 : reg38) ?
                              (!wire39) : (wire36 ~^ wire40)) : ({reg38,
                              wire33} && (wire40 != wire37)))) ~^ wire34);
  assign wire43 = {(|wire39[(3'h5):(1'h0)])};
  assign wire44 = $unsigned(({((wire33 - wire36) && wire34),
                      {{wire43}, (wire39 ? wire43 : wire42)}} >= (((wire33 ?
                          wire42 : wire42) <= $unsigned(wire37)) ?
                      (+$signed(wire36)) : $signed(wire33[(3'h6):(1'h1)]))));
  assign wire45 = wire40;
  assign wire46 = $unsigned(wire35);
  assign wire47 = $unsigned($unsigned(({(wire37 ?
                          reg38 : wire35)} - $signed(wire44[(4'hc):(4'hc)]))));
  assign wire48 = ($signed($unsigned($signed(wire43))) ?
                      $signed(wire35) : ((wire35 ^~ reg38) > $unsigned(((wire45 >= (8'ha1)) && wire40[(1'h1):(1'h0)]))));
endmodule

module module159
#(parameter param197 = (~(((((7'h44) * (8'ha5)) ? (8'hae) : ((8'hac) ^ (8'ha8))) ? {(&(8'hba)), {(8'haa)}} : (8'hb6)) > ({((7'h40) >>> (8'hbc))} == {(~^(8'hb5))}))))
(y, clk, wire164, wire163, wire162, wire161, wire160);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire164;
  input wire [(4'he):(1'h0)] wire163;
  input wire [(4'ha):(1'h0)] wire162;
  input wire signed [(4'h8):(1'h0)] wire161;
  input wire [(3'h4):(1'h0)] wire160;
  wire [(4'h8):(1'h0)] wire191;
  wire [(5'h11):(1'h0)] wire176;
  wire signed [(4'h9):(1'h0)] wire175;
  wire [(5'h12):(1'h0)] wire174;
  wire [(4'h8):(1'h0)] wire173;
  wire signed [(4'hc):(1'h0)] wire171;
  wire signed [(3'h7):(1'h0)] wire170;
  wire signed [(2'h2):(1'h0)] wire169;
  wire [(5'h10):(1'h0)] wire168;
  wire [(2'h3):(1'h0)] wire167;
  wire signed [(4'hc):(1'h0)] wire166;
  wire [(3'h7):(1'h0)] wire165;
  reg [(4'h8):(1'h0)] reg196 = (1'h0);
  reg [(5'h12):(1'h0)] reg195 = (1'h0);
  reg signed [(4'he):(1'h0)] reg194 = (1'h0);
  reg [(4'h9):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg [(5'h11):(1'h0)] reg187 = (1'h0);
  reg [(4'he):(1'h0)] reg186 = (1'h0);
  reg [(4'hf):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg184 = (1'h0);
  reg [(4'ha):(1'h0)] reg183 = (1'h0);
  reg [(5'h14):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg177 = (1'h0);
  reg [(5'h14):(1'h0)] reg172 = (1'h0);
  assign y = {wire191,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
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
                 reg172,
                 (1'h0)};
  assign wire165 = wire161;
  assign wire166 = ((wire163[(3'h6):(2'h3)] ?
                           wire160[(1'h1):(1'h1)] : wire160[(3'h4):(1'h1)]) ?
                       $signed((|wire161)) : wire160);
  assign wire167 = $unsigned((wire162 > (((wire164 + wire166) == $unsigned(wire165)) < {$signed(wire160),
                       wire166[(4'ha):(4'ha)]})));
  assign wire168 = (~wire162[(3'h5):(3'h5)]);
  assign wire169 = (!wire165);
  assign wire170 = ($unsigned(wire167) ?
                       (wire163[(3'h5):(1'h1)] >= (wire166[(1'h1):(1'h0)] ?
                           $signed(((8'hbb) ?
                               wire165 : wire165)) : wire165[(3'h4):(3'h4)])) : ({wire165[(3'h4):(2'h3)],
                               (+$unsigned(wire161))} ?
                           wire168[(3'h4):(3'h4)] : wire161));
  assign wire171 = (+($signed({(wire170 & wire160),
                       (^~wire163)}) >= (^$unsigned((wire164 ~^ wire165)))));
  always
    @(posedge clk) begin
      reg172 <= wire167;
    end
  assign wire173 = {(~|$signed((wire161[(1'h0):(1'h0)] && wire160)))};
  assign wire174 = $signed($unsigned($unsigned(((wire163 == wire166) ?
                       (^wire170) : $signed((8'hbe))))));
  assign wire175 = wire163;
  assign wire176 = $signed($unsigned((^({wire175} >> ((7'h42) ?
                       (8'hb2) : wire160)))));
  always
    @(posedge clk) begin
      if ((wire161 && {(~|($signed(wire171) ? (wire176 << wire176) : wire168)),
          wire167[(1'h0):(1'h0)]}))
        begin
          reg177 <= ($unsigned((~|((+(7'h42)) ?
                  (wire168 ? (8'hb0) : wire160) : wire163[(4'h8):(3'h6)]))) ?
              $unsigned((wire175 + $unsigned((wire163 ?
                  (8'hbd) : wire176)))) : (wire171[(2'h3):(2'h3)] < (~^$signed(wire175))));
          reg178 <= $signed(wire166[(4'h9):(4'h8)]);
          reg179 <= $unsigned(wire161[(3'h6):(2'h2)]);
        end
      else
        begin
          if ((8'ha0))
            begin
              reg177 <= $signed($signed((+reg179[(3'h4):(1'h0)])));
              reg178 <= wire168;
              reg179 <= wire171[(4'h9):(1'h1)];
              reg180 <= (~&$signed(wire165[(3'h5):(1'h0)]));
              reg181 <= $unsigned($unsigned((&$unsigned(wire165[(2'h3):(2'h2)]))));
            end
          else
            begin
              reg177 <= ($unsigned($signed((8'h9d))) && ((-(8'ha8)) != ((((8'hab) <<< reg177) | (wire165 ?
                  reg172 : wire176)) >>> (wire170 ^~ (wire173 ?
                  wire166 : wire166)))));
              reg178 <= wire168[(4'h8):(2'h3)];
            end
          reg182 <= (((~|$unsigned($unsigned(wire173))) ?
                  (-($unsigned(wire162) ?
                      (wire164 || wire169) : $unsigned(wire168))) : reg172[(2'h2):(2'h2)]) ?
              wire167 : (!$unsigned(wire165[(3'h7):(3'h7)])));
          if (wire176[(1'h0):(1'h0)])
            begin
              reg183 <= wire166;
              reg184 <= wire163[(3'h4):(2'h2)];
              reg185 <= (wire168[(4'ha):(4'h8)] == (wire161 ?
                  ({wire173[(3'h7):(3'h6)],
                      $signed(wire175)} < {wire168}) : reg172));
              reg186 <= (^~$signed((~(-$unsigned(wire161)))));
            end
          else
            begin
              reg183 <= ($unsigned(reg184[(4'hc):(4'hc)]) && wire164);
            end
        end
      reg187 <= $unsigned(wire168[(4'h9):(2'h3)]);
      reg188 <= ((^$signed((8'haf))) != $signed(reg187[(1'h1):(1'h0)]));
      reg189 <= $unsigned({(^$signed((-(8'ha0))))});
      reg190 <= wire171;
    end
  assign wire191 = wire170;
  always
    @(posedge clk) begin
      reg192 <= ($signed(wire191) ? $signed(reg181) : (~|wire166));
      reg193 <= $signed(($signed(wire166) ^ (^(~&wire165))));
      reg194 <= ($signed($unsigned((^$signed((8'ha4))))) && $unsigned(((~&$signed(reg182)) ?
          ((~^wire173) ?
              (~(7'h44)) : (reg188 ?
                  wire191 : reg180)) : $signed(((8'ha8) * (7'h44))))));
      reg195 <= wire169[(2'h2):(1'h1)];
      reg196 <= $unsigned(($signed(wire167[(1'h1):(1'h0)]) || reg177));
    end
endmodule
