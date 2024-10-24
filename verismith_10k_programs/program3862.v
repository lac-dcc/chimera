module top
#(parameter param222 = {{((&((7'h43) != (8'hb8))) ^ (8'h9f)), (+({(8'had)} ^ ((8'hb7) + (8'hb1))))}})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire205;
  wire signed [(5'h14):(1'h0)] wire204;
  wire signed [(4'h8):(1'h0)] wire198;
  wire [(5'h10):(1'h0)] wire145;
  wire [(4'hb):(1'h0)] wire144;
  wire signed [(2'h2):(1'h0)] wire143;
  wire signed [(5'h15):(1'h0)] wire142;
  wire [(4'hc):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire139;
  wire signed [(4'hf):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire113;
  wire signed [(4'hd):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire200;
  wire signed [(5'h13):(1'h0)] wire201;
  wire signed [(5'h12):(1'h0)] wire202;
  reg signed [(3'h7):(1'h0)] reg221 = (1'h0);
  reg [(4'hd):(1'h0)] reg220 = (1'h0);
  reg [(4'h8):(1'h0)] reg219 = (1'h0);
  reg [(5'h13):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg217 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg216 = (1'h0);
  reg [(4'hf):(1'h0)] reg215 = (1'h0);
  reg [(4'ha):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg213 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg212 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg211 = (1'h0);
  reg [(2'h2):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg209 = (1'h0);
  reg [(5'h15):(1'h0)] reg208 = (1'h0);
  reg [(4'ha):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg141 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg115 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire198,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire140,
                 wire139,
                 wire137,
                 wire113,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire200,
                 wire201,
                 wire202,
                 reg221,
                 reg220,
                 reg219,
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
                 reg207,
                 reg206,
                 reg141,
                 reg138,
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
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  module5 #() modinst84 (.wire7(wire1), .wire9(wire0), .wire10(wire2), .clk(clk), .wire8(wire4), .y(wire83), .wire6(wire3));
  assign wire85 = (wire2 || (wire1[(4'hc):(3'h4)] <<< ($unsigned((wire3 ?
                          wire3 : wire0)) ?
                      $signed($signed(wire4)) : $signed((wire83 + wire4)))));
  assign wire86 = ((&(^~wire85[(4'h8):(4'h8)])) <<< (!((&{(8'ha1), wire3}) ?
                      ({(7'h41)} ?
                          $signed(wire83) : wire2[(4'hc):(4'hb)]) : (wire2[(5'h12):(4'hd)] << (&wire83)))));
  assign wire87 = wire1;
  assign wire88 = $signed(wire83);
  module89 #() modinst114 (wire113, clk, wire88, wire4, wire87, wire3);
  always
    @(posedge clk) begin
      if ($signed(($unsigned(wire0) ?
          (&wire85[(1'h1):(1'h1)]) : (((wire0 ? wire83 : wire1) ?
                  {wire4, wire4} : {wire87, wire4}) ?
              (&$unsigned(wire86)) : $unsigned({(8'h9f)})))))
        begin
          reg115 <= $unsigned((-$signed($signed(wire4))));
          reg116 <= $unsigned($unsigned((^{wire4})));
          reg117 <= $signed({wire4});
          reg118 <= ($signed(wire2) ^~ wire85[(3'h5):(3'h4)]);
        end
      else
        begin
          reg115 <= ($signed(wire88) ?
              {$unsigned(reg117[(4'hd):(1'h1)])} : $unsigned(wire86[(1'h0):(1'h0)]));
          reg116 <= (!wire113);
          reg117 <= $unsigned($unsigned((($signed(wire113) != $signed((8'hb7))) & $signed((~&wire4)))));
          if (wire86[(3'h4):(2'h3)])
            begin
              reg118 <= $signed((-reg117[(4'hc):(4'h8)]));
              reg119 <= (wire113 ?
                  {({$signed((8'hbf))} ?
                          reg118[(4'hf):(2'h2)] : $signed($unsigned(wire83)))} : wire1[(5'h12):(5'h11)]);
              reg120 <= (~^({(~|wire2[(4'he):(1'h1)])} >>> (-($signed((8'hbd)) ?
                  (reg116 ? reg115 : reg118) : (reg117 || wire4)))));
              reg121 <= $signed($signed($signed(wire87[(4'h9):(4'h8)])));
            end
          else
            begin
              reg118 <= $signed(reg115[(2'h2):(2'h2)]);
              reg119 <= (8'hae);
              reg120 <= wire83;
              reg121 <= ((({(8'hb4), {reg117, wire1}} ?
                  (~(~&reg115)) : $signed((8'ha7))) * $unsigned($signed((~reg121)))) <= (~|$signed((wire3[(1'h1):(1'h1)] ~^ (wire85 != wire87)))));
              reg122 <= (reg116[(2'h2):(1'h1)] > wire1);
            end
          reg123 <= (~((wire87 ?
              $unsigned({reg120}) : $signed(((8'hb5) | wire3))) >> wire1[(5'h13):(1'h0)]));
        end
      reg124 <= {$signed($signed((~^wire86[(3'h6):(3'h4)]))),
          (wire1 ?
              $signed($signed($signed(wire2))) : $signed(({reg116, wire3} ?
                  {wire1, wire113} : wire4[(5'h11):(3'h5)])))};
      reg125 <= wire87;
      if ($unsigned((reg125[(4'h9):(3'h4)] ?
          {reg122,
              ((wire88 + wire86) << $unsigned(reg121))} : ((wire1[(1'h1):(1'h0)] + {(8'ha7)}) << wire83))))
        begin
          reg126 <= {((~^(^~{reg123, reg119})) >> (reg118 ?
                  (~^$unsigned(wire88)) : ($unsigned(reg122) - {wire1}))),
              (+reg118[(4'h8):(1'h1)])};
          reg127 <= {$unsigned($unsigned(((^(7'h44)) * {reg123}))),
              wire86[(1'h0):(1'h0)]};
        end
      else
        begin
          reg126 <= $signed((~|(|((8'hb1) ? reg125[(4'hd):(4'hd)] : reg122))));
          reg127 <= reg116[(1'h0):(1'h0)];
          if ((^$signed($unsigned($unsigned((wire88 ? wire86 : wire4))))))
            begin
              reg128 <= (wire83 >>> {$unsigned((wire86[(1'h0):(1'h0)] * (reg115 ~^ wire0)))});
            end
          else
            begin
              reg128 <= ((($signed({wire88}) ?
                      (^~{wire113,
                          reg115}) : {$signed(reg126)}) || reg119[(2'h2):(2'h2)]) ?
                  (reg118 & ((8'hb8) >= wire87)) : wire1[(2'h2):(1'h1)]);
              reg129 <= wire2;
              reg130 <= reg116[(2'h2):(2'h2)];
            end
          if ($signed(($signed(((reg125 ? reg130 : (8'hb9)) ?
                  $signed(wire83) : (8'h9c))) ?
              $unsigned((8'hb7)) : (8'hab))))
            begin
              reg131 <= ($signed((((~&reg123) ?
                      wire86[(1'h0):(1'h0)] : {reg123}) ^ (~&(wire4 ?
                      wire113 : wire1)))) ?
                  $signed((^($unsigned(reg120) ?
                      $signed(wire3) : {reg125,
                          wire83}))) : (&reg125[(3'h5):(3'h5)]));
              reg132 <= reg129[(2'h2):(1'h1)];
              reg133 <= (|($signed({(-wire87)}) ?
                  $unsigned({$signed(reg131),
                      reg117}) : (wire86 <<< $signed((8'ha5)))));
              reg134 <= reg118[(4'h8):(1'h0)];
              reg135 <= (8'haf);
            end
          else
            begin
              reg131 <= (^~($signed((((8'hb1) >> (8'h9f)) ^ ((8'ha5) ?
                  reg122 : wire83))) < (reg129[(1'h1):(1'h1)] * reg125)));
              reg132 <= wire4;
              reg133 <= (8'hae);
            end
        end
      reg136 <= ($unsigned((((wire85 ? reg117 : wire1) ?
                  (8'h9c) : (reg117 != reg124)) ?
              $unsigned($signed(reg128)) : (wire2[(2'h3):(2'h2)] ?
                  {reg130} : wire88))) ?
          ({$unsigned(wire3)} ?
              ($unsigned($unsigned((8'ha2))) != (reg115[(1'h0):(1'h0)] ?
                  reg128[(2'h2):(1'h1)] : (reg115 != reg122))) : reg129) : reg123[(3'h6):(1'h1)]);
    end
  assign wire137 = ({($unsigned($unsigned(reg121)) + (~|reg133))} ?
                       (^(reg125[(2'h3):(1'h1)] ?
                           ($unsigned(wire88) ?
                               reg117 : (reg133 ?
                                   reg125 : reg132)) : {reg122[(1'h0):(1'h0)]})) : (($unsigned({reg130}) ?
                           $unsigned((reg131 ?
                               wire4 : wire85)) : (reg125[(4'h8):(3'h5)] ?
                               reg118 : reg115)) < ({(|(7'h40))} < reg119)));
  always
    @(posedge clk) begin
      reg138 <= ({(reg120 ?
                  (reg120[(4'h9):(2'h3)] ?
                      {reg116, reg134} : (wire83 ?
                          reg129 : reg129)) : ((reg129 ?
                      wire88 : (8'hab)) >> (reg121 <<< reg126))),
              $unsigned(($signed(reg132) ? $unsigned(reg123) : (-reg118)))} ?
          reg118[(4'h8):(3'h5)] : $unsigned((|(8'had))));
    end
  assign wire139 = ($unsigned(($unsigned((^(8'ha3))) ?
                       reg134 : {reg135[(3'h5):(1'h0)],
                           reg127[(4'ha):(4'ha)]})) << (^$unsigned($unsigned((+wire3)))));
  assign wire140 = {$unsigned((~^wire3[(3'h6):(2'h3)]))};
  always
    @(posedge clk) begin
      reg141 <= {(((reg135 >> $signed(reg125)) + $signed((reg133 | wire3))) ?
              reg129 : {$signed((reg120 * reg116))})};
    end
  assign wire142 = (!({$unsigned(wire137)} ?
                       $signed((8'h9e)) : {$unsigned((~&reg135)),
                           ((~&reg138) ? reg135[(3'h7):(2'h2)] : (~|reg130))}));
  assign wire143 = {reg132[(2'h3):(2'h3)]};
  assign wire144 = $unsigned(reg129[(2'h2):(1'h0)]);
  assign wire145 = (8'ha9);
  module146 #() modinst199 (wire198, clk, wire139, reg117, wire85, wire145);
  assign wire200 = reg133;
  assign wire201 = (8'h9e);
  module146 #() modinst203 (.wire148(reg116), .wire149(wire200), .clk(clk), .wire147(reg121), .wire150(reg122), .y(wire202));
  assign wire204 = (^(((((8'hb1) ?
                       wire87 : reg118) ^~ reg133[(2'h2):(2'h2)]) << $signed({wire140})) - wire202[(5'h10):(2'h2)]));
  assign wire205 = wire145;
  always
    @(posedge clk) begin
      if ((^~(reg120[(3'h4):(2'h3)] <<< (+(((8'hab) >= (8'hb8)) ?
          reg122[(4'h8):(3'h6)] : reg131[(1'h0):(1'h0)])))))
        begin
          if ((wire137 ?
              ((((reg115 - wire200) ? (reg130 ^ wire143) : reg124) ?
                      reg124[(3'h5):(2'h3)] : ((reg120 ? reg132 : (8'hbc)) ?
                          (^wire202) : $unsigned(wire202))) ?
                  ((!(8'ha6)) ?
                      wire0[(3'h6):(3'h5)] : $signed((8'hb4))) : $unsigned(reg130)) : $signed($unsigned(wire113[(3'h4):(1'h0)]))))
            begin
              reg206 <= (!$signed(((~|wire142[(4'h9):(3'h7)]) ?
                  $signed((wire2 ? wire86 : reg118)) : $unsigned((wire143 ?
                      (8'hbb) : wire140)))));
              reg207 <= wire88[(1'h1):(1'h1)];
              reg208 <= (8'hba);
            end
          else
            begin
              reg206 <= $signed(reg116[(4'h9):(3'h4)]);
              reg207 <= ((~&$unsigned($signed(reg127[(3'h5):(3'h4)]))) ?
                  ($unsigned(($signed(wire201) && $unsigned(reg133))) ?
                      ($unsigned(((8'hb4) || wire1)) | reg141[(5'h10):(4'h8)]) : $signed({(reg207 + wire143),
                          wire87[(3'h5):(2'h2)]})) : (-$signed(((wire198 ?
                          (8'h9d) : reg124) ?
                      $unsigned(wire4) : (~wire201)))));
              reg208 <= (&reg118[(4'he):(4'h8)]);
            end
          if (wire201[(4'hf):(4'h9)])
            begin
              reg209 <= ({($unsigned((~|reg120)) ^ reg127),
                  $unsigned($unsigned(wire204[(4'hf):(4'hd)]))} < $unsigned(($signed({reg131}) ?
                  ({reg116,
                      (8'h9f)} & ((8'haf) << wire145)) : ($unsigned(wire140) > wire143))));
              reg210 <= $unsigned({((wire2[(4'h8):(2'h2)] ?
                          reg129[(2'h2):(2'h2)] : (wire87 ^ wire143)) ?
                      wire200 : $signed({reg124})),
                  wire200[(1'h0):(1'h0)]});
              reg211 <= (-$signed((~&wire201)));
            end
          else
            begin
              reg209 <= ({reg206} << ({($unsigned(reg211) ?
                      $unsigned(reg122) : (reg125 != wire3))} | $signed(reg130[(5'h13):(2'h2)])));
              reg210 <= wire88;
              reg211 <= $signed($signed(reg135));
            end
        end
      else
        begin
          if ($unsigned(wire88[(4'ha):(4'h8)]))
            begin
              reg206 <= $signed(wire200[(2'h2):(1'h1)]);
              reg207 <= $signed((^~(8'hbf)));
              reg208 <= {$signed(reg122[(4'hc):(2'h2)]), wire85[(3'h5):(3'h4)]};
              reg209 <= ($signed((&(wire202[(1'h0):(1'h0)] ?
                      (8'hba) : $signed(reg117)))) ?
                  (|$unsigned((wire140[(4'h8):(1'h0)] ?
                      {wire1} : {reg126, reg123}))) : (-(8'ha5)));
              reg210 <= $unsigned($signed($signed(($unsigned(reg136) ?
                  ((8'ha7) >>> reg127) : reg138[(5'h15):(5'h15)]))));
            end
          else
            begin
              reg206 <= ($unsigned(((reg120[(2'h3):(2'h2)] ^~ reg130[(4'hd):(1'h0)]) ?
                  reg116 : reg136[(4'h9):(4'h8)])) >= {$unsigned(((reg206 ?
                          reg208 : wire3) ?
                      (reg207 >= wire86) : {reg133})),
                  (~|wire88)});
              reg207 <= $unsigned((8'ha9));
            end
          reg211 <= $unsigned($signed({($unsigned(wire144) ?
                  (wire139 ? reg115 : (8'ha0)) : (reg211 >>> wire86)),
              $signed(reg134[(4'hd):(3'h4)])}));
          if ((~|$unsigned((8'ha0))))
            begin
              reg212 <= (&$signed(((^(wire4 ?
                  reg122 : reg121)) >= reg208[(5'h12):(4'h8)])));
              reg213 <= (|(8'ha7));
              reg214 <= wire139[(3'h4):(2'h2)];
            end
          else
            begin
              reg212 <= ($signed({(|(wire0 ?
                      reg127 : (7'h41)))}) <<< $unsigned(reg125));
              reg213 <= wire204[(2'h3):(1'h1)];
            end
        end
      reg215 <= reg126[(3'h4):(3'h4)];
      if ((reg210[(2'h2):(1'h1)] ?
          {$unsigned(reg119)} : $signed($unsigned({wire139,
              (reg209 ? wire137 : wire202)}))))
        begin
          reg216 <= $unsigned(reg208[(4'hd):(3'h4)]);
          if ($unsigned((($signed((wire205 | wire140)) ?
                  ((~reg115) != reg120[(3'h5):(2'h3)]) : (wire145 ?
                      (reg128 ? reg128 : reg121) : (wire139 ?
                          reg208 : wire88))) ?
              reg123[(4'hb):(2'h2)] : $signed({(~|wire204),
                  ((8'hbf) ? wire113 : (7'h43))}))))
            begin
              reg217 <= $unsigned((-((^reg216[(3'h7):(3'h5)]) <<< $signed(wire2))));
              reg218 <= $signed(($signed(((~reg117) != $unsigned((8'hb4)))) ?
                  ($signed($unsigned(wire87)) ?
                      (7'h43) : (reg126 ?
                          reg117[(3'h5):(1'h0)] : wire200[(3'h5):(3'h5)])) : wire86));
              reg219 <= {reg116[(1'h1):(1'h0)]};
            end
          else
            begin
              reg217 <= (wire198 + $unsigned(reg141[(3'h4):(1'h0)]));
              reg218 <= $unsigned((((~^$signed(reg213)) == ((reg119 >>> reg138) + reg208[(4'h8):(1'h1)])) ?
                  (wire1[(4'h9):(2'h2)] ?
                      (reg134[(4'hc):(3'h4)] ?
                          wire113[(4'he):(3'h5)] : {wire145,
                              (8'hb3)}) : (~|(reg219 >> wire198))) : (-reg120[(4'hc):(4'hc)])));
            end
        end
      else
        begin
          reg216 <= wire4;
          reg217 <= $signed($signed((~|({reg123,
              wire201} >>> (wire198 && (8'hb7))))));
          reg218 <= (reg130 ?
              (^((8'hb3) - reg214[(4'h9):(4'h9)])) : $unsigned({reg134[(3'h6):(3'h6)],
                  {$unsigned(reg123), (wire204 ? reg131 : reg214)}}));
          reg219 <= {$unsigned(wire204)};
          reg220 <= $signed(wire142[(3'h6):(1'h1)]);
        end
      reg221 <= {{$signed(wire83[(4'h9):(1'h1)]), wire201[(4'h9):(1'h0)]},
          wire198[(1'h1):(1'h0)]};
    end
endmodule

module module146
#(parameter param197 = (8'hbe))
(y, clk, wire150, wire149, wire148, wire147);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire150;
  input wire signed [(4'hd):(1'h0)] wire149;
  input wire signed [(5'h15):(1'h0)] wire148;
  input wire [(5'h10):(1'h0)] wire147;
  wire [(3'h6):(1'h0)] wire193;
  wire [(3'h6):(1'h0)] wire191;
  wire signed [(5'h10):(1'h0)] wire152;
  wire [(4'hf):(1'h0)] wire151;
  reg [(4'hf):(1'h0)] reg196 = (1'h0);
  reg [(2'h3):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg194 = (1'h0);
  reg [(4'h8):(1'h0)] reg153 = (1'h0);
  reg [(2'h3):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg156 = (1'h0);
  reg [(4'ha):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg159 = (1'h0);
  reg [(4'hd):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg164 = (1'h0);
  reg [(5'h11):(1'h0)] reg165 = (1'h0);
  reg [(5'h12):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg167 = (1'h0);
  reg [(2'h3):(1'h0)] reg168 = (1'h0);
  assign y = {wire193,
                 wire191,
                 wire152,
                 wire151,
                 reg196,
                 reg195,
                 reg194,
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
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 (1'h0)};
  assign wire151 = $signed(($signed((~|(wire150 ?
                       (8'ha2) : wire149))) ^~ ((-wire148) ?
                       wire147 : $unsigned(wire148[(5'h11):(4'hf)]))));
  assign wire152 = (wire148[(4'hc):(3'h4)] <<< $unsigned($unsigned(wire151)));
  always
    @(posedge clk) begin
      reg153 <= (8'hbb);
      reg154 <= (~|$signed(({$signed(wire151)} ?
          (((7'h42) >>> wire152) ?
              {wire149,
                  reg153} : $signed(wire149)) : $unsigned($signed(wire150)))));
      reg155 <= $unsigned((($unsigned(wire150) >= ({wire152, wire147} ?
          (wire150 - wire152) : {wire147, wire152})) || (((wire149 && wire148) ?
              (|wire151) : (8'haf)) ?
          {wire149, $signed(wire148)} : (&wire150))));
      if ($unsigned($signed($unsigned(($signed(wire149) ~^ ((7'h41) + wire149))))))
        begin
          reg156 <= {{{(8'h9c), (|(wire149 ? (8'haa) : wire151))}},
              $signed((~(wire149 ? {(8'ha0), (7'h43)} : ((8'hb7) | wire149))))};
          reg157 <= reg155;
          reg158 <= {(!wire150[(2'h2):(1'h1)]), $signed(reg157)};
          reg159 <= {$signed((+((reg155 ?
                  wire148 : (8'hb2)) >= wire151[(4'hd):(4'h8)]))),
              $signed((!(~^wire148[(4'h9):(1'h1)])))};
        end
      else
        begin
          if ((($signed(wire147) ?
              wire148[(4'h8):(4'h8)] : wire149[(1'h1):(1'h0)]) != (8'ha8)))
            begin
              reg156 <= wire147;
              reg157 <= $unsigned((wire147[(4'hb):(3'h5)] * $unsigned((wire149 ?
                  $signed(wire147) : $signed((8'ha2))))));
              reg158 <= (((~^($signed(wire151) == reg157)) ?
                      (&$signed($signed(wire147))) : $unsigned($unsigned((^~wire149)))) ?
                  ((~&$unsigned((wire148 ? wire151 : reg159))) ?
                      reg153[(3'h4):(2'h3)] : (reg154 - ((|wire148) < (wire149 | wire149)))) : wire147);
              reg159 <= (~|wire152[(5'h10):(2'h2)]);
            end
          else
            begin
              reg156 <= (wire152[(4'hb):(4'h8)] ? $unsigned(wire151) : (8'ha0));
            end
          reg160 <= ({$signed(((wire152 > reg157) ?
                  (~^wire152) : $signed(wire152))),
              $unsigned(wire152[(4'he):(4'h8)])} + (((~^(8'hb5)) ?
                  ((reg158 ?
                      reg155 : wire152) != $signed(reg157)) : $signed((^reg157))) ?
              (((~wire150) ?
                      (reg153 ? wire152 : wire149) : $unsigned((8'hbe))) ?
                  (~&$unsigned(reg159)) : (((8'hb3) ?
                      wire151 : reg156) * {reg156})) : $unsigned(reg157)));
          reg161 <= (wire149[(4'h8):(1'h0)] ~^ (~&((+$unsigned(reg159)) ~^ ((8'ha6) ?
              (8'ha2) : wire148[(5'h11):(1'h0)]))));
          reg162 <= reg155;
          if (((reg153 <= ((((7'h44) == (8'ha7)) * (reg158 ?
              reg158 : reg161)) <= $unsigned(wire152))) > (reg159 | ($unsigned((^~reg161)) ?
              wire152[(3'h6):(1'h0)] : $signed((~reg156))))))
            begin
              reg163 <= reg154;
              reg164 <= (reg163[(3'h7):(2'h2)] && (-reg153));
              reg165 <= $signed(wire149);
              reg166 <= (7'h44);
            end
          else
            begin
              reg163 <= ((~^wire149) == {($unsigned(reg166[(5'h11):(2'h2)]) <= ({reg159} <<< (reg158 ?
                      wire150 : wire147))),
                  reg161});
              reg164 <= ((-(wire147 >> {(reg153 ? (8'ha6) : reg166),
                      {wire152, reg157}})) ?
                  ($unsigned($signed((reg156 ? wire149 : reg158))) ?
                      reg156[(3'h6):(3'h6)] : reg154) : {wire150[(4'h9):(2'h2)]});
              reg165 <= (8'h9e);
              reg166 <= $unsigned($unsigned(($unsigned((~|reg154)) << ((~&reg163) ?
                  wire152 : {reg160, wire147}))));
              reg167 <= ($unsigned((8'ha7)) > $unsigned(reg164[(4'hb):(4'h9)]));
            end
        end
      reg168 <= wire151[(2'h2):(2'h2)];
    end
  module169 #() modinst192 (.wire173(reg160), .wire170(wire147), .y(wire191), .wire174(wire151), .wire171(reg165), .wire172(reg157), .clk(clk));
  assign wire193 = $signed(((~&((reg162 - reg168) ?
                           $unsigned(reg153) : ((8'hac) ? wire148 : wire191))) ?
                       (^~$signed(reg160[(4'hd):(3'h4)])) : ((~&reg163[(4'hb):(4'h8)]) <<< (+(reg157 >>> wire147)))));
  always
    @(posedge clk) begin
      reg194 <= ((reg155 ?
              wire151[(4'hd):(3'h5)] : {($unsigned(wire151) <<< wire191[(1'h0):(1'h0)])}) ?
          $signed(reg153) : (|wire149));
      reg195 <= (|reg157[(4'h8):(2'h2)]);
      reg196 <= (~|reg154);
    end
endmodule

module module89  (y, clk, wire93, wire92, wire91, wire90);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire93;
  input wire [(4'h9):(1'h0)] wire92;
  input wire [(5'h14):(1'h0)] wire91;
  input wire signed [(2'h2):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire112;
  wire signed [(4'ha):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire110;
  wire [(4'h9):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire107;
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg94 <= $signed(wire92[(1'h0):(1'h0)]);
      if ($signed($unsigned(({reg94[(3'h4):(1'h0)], $unsigned(wire90)} ?
          (~{wire93}) : (((8'hb5) ? wire90 : wire91) ?
              (wire90 ? wire90 : wire91) : wire91)))))
        begin
          reg95 <= wire93[(3'h5):(3'h4)];
          if ({$unsigned($signed((wire91 ^ {wire92, (8'had)}))), wire91})
            begin
              reg96 <= wire90[(2'h2):(1'h1)];
              reg97 <= (8'ha6);
            end
          else
            begin
              reg96 <= $signed($signed($signed(((!wire90) - wire92))));
            end
          if (wire90)
            begin
              reg98 <= (&((((wire93 ?
                  reg95 : (8'hb8)) > ((8'hbd) - wire91)) <<< {(|wire91),
                  wire90}) + (($unsigned(wire93) == (&reg95)) ?
                  {$unsigned(wire91)} : {$signed(reg96)})));
              reg99 <= (!($signed(wire92[(3'h5):(1'h1)]) < $signed((!reg97))));
              reg100 <= (|((8'hb8) ?
                  (reg98[(4'ha):(2'h3)] | wire90[(2'h2):(1'h1)]) : (reg94 ?
                      (~reg98) : $signed({reg95, wire91}))));
            end
          else
            begin
              reg98 <= (&(8'hb4));
              reg99 <= reg97[(4'h8):(3'h7)];
              reg100 <= $unsigned($unsigned((((^~reg95) ?
                  reg95[(3'h5):(3'h4)] : (reg99 ?
                      reg96 : wire91)) ~^ wire91[(5'h13):(4'hc)])));
            end
          reg101 <= $signed(($unsigned(reg95[(4'hd):(2'h3)]) ?
              wire93[(4'hc):(2'h2)] : (8'hac)));
        end
      else
        begin
          reg95 <= ((~|(($signed((8'hb8)) ? $signed(reg97) : $signed((8'hb2))) ?
              $unsigned((wire91 ?
                  wire93 : wire90)) : wire93[(4'hc):(4'hc)])) <<< reg101[(2'h2):(2'h2)]);
          reg96 <= $signed($signed((((+wire91) ?
              (reg100 ? wire90 : reg98) : (~&reg98)) <<< (reg98[(3'h4):(3'h4)] ?
              (reg101 <<< (8'ha2)) : $signed(wire90)))));
          reg97 <= (^~(~&(^~{$unsigned(wire90)})));
          reg98 <= $unsigned(reg95[(5'h10):(3'h6)]);
        end
      if (reg99)
        begin
          if (($unsigned(({wire90} ?
                  $unsigned((reg94 ? wire90 : reg94)) : reg94)) ?
              $unsigned(wire93[(3'h6):(2'h2)]) : reg101[(2'h2):(1'h1)]))
            begin
              reg102 <= (8'hbd);
            end
          else
            begin
              reg102 <= {({$signed($unsigned(reg95)), (~^$signed(reg102))} ?
                      $signed($signed((|wire92))) : wire90[(1'h0):(1'h0)])};
              reg103 <= $signed(wire93[(3'h5):(3'h5)]);
            end
        end
      else
        begin
          reg102 <= wire93[(3'h4):(1'h0)];
          reg103 <= (wire90 ?
              $unsigned(((reg94[(4'he):(2'h2)] ?
                      $signed(wire91) : $unsigned(wire90)) ?
                  reg100[(1'h0):(1'h0)] : $unsigned(reg94[(2'h2):(1'h1)]))) : reg101);
          reg104 <= (((&(reg103[(1'h0):(1'h0)] ?
                  $unsigned((7'h42)) : $signed(reg96))) * $unsigned(((reg102 >>> wire91) ^ (reg95 != reg95)))) ?
              ((^($unsigned(wire92) < reg98)) ?
                  (reg96[(4'h8):(3'h6)] ?
                      {$unsigned((8'h9f)),
                          {reg100}} : $signed(wire93[(4'hc):(2'h2)])) : (&($unsigned(wire91) == (reg94 ?
                      wire91 : reg94)))) : ((+reg103[(4'h9):(2'h3)]) || $signed(((reg101 ?
                      reg95 : (8'hb4)) ?
                  $signed((8'hbe)) : reg94))));
          reg105 <= ({reg97} ?
              ({$signed($unsigned(reg96)),
                  reg101} > $signed(reg101[(1'h1):(1'h0)])) : (reg102 | $signed({$unsigned(reg94)})));
        end
      reg106 <= {{reg96}};
    end
  assign wire107 = reg95;
  assign wire108 = wire92[(1'h0):(1'h0)];
  assign wire109 = $unsigned($unsigned(reg106[(3'h4):(3'h4)]));
  assign wire110 = wire92[(4'h8):(2'h3)];
  assign wire111 = reg103;
  assign wire112 = reg106;
endmodule

module module5
#(parameter param81 = (((8'hbc) == (~^(~&((8'hac) ? (8'ha8) : (8'hac))))) <<< (^~((8'h9d) ? (~^((8'hb6) | (8'ha1))) : (((8'hbe) < (8'h9c)) ? ((8'ha8) | (8'ha1)) : ((8'h9c) <<< (8'haf)))))), 
parameter param82 = param81)
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire11;
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire33,
                 wire32,
                 wire26,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire11,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg25,
                 reg24,
                 reg23,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = $signed($unsigned({({wire8} ?
                          wire9[(2'h2):(1'h1)] : (wire6 ~^ wire9))}));
  always
    @(posedge clk) begin
      reg12 <= (wire7 ? {wire11} : {wire6[(4'hd):(4'hd)], $signed((8'hb9))});
      reg13 <= (8'hb1);
      reg14 <= $signed((reg13 ? (|reg13) : wire9));
      reg15 <= $unsigned($signed(($signed(wire7) ?
          $signed((wire10 >> wire11)) : $unsigned((^wire10)))));
      reg16 <= ($unsigned($unsigned({$signed((8'hbc)), reg13[(1'h1):(1'h0)]})) ?
          ((8'haf) < ({$signed(wire11), $unsigned(wire6)} != wire7)) : reg13);
    end
  assign wire17 = (+reg12[(3'h4):(3'h4)]);
  assign wire18 = (+(wire7[(3'h6):(3'h4)] ? wire7[(4'he):(4'he)] : wire7));
  assign wire19 = ($unsigned((((reg14 ? reg13 : reg13) <<< (8'hb9)) ?
                      $signed($signed(wire7)) : $signed($signed(reg15)))) << $unsigned(reg16[(4'hb):(3'h7)]));
  assign wire20 = $unsigned($unsigned(({(reg16 >> wire7)} & wire9)));
  assign wire21 = wire19[(1'h0):(1'h0)];
  assign wire22 = $unsigned(reg14);
  always
    @(posedge clk) begin
      reg23 <= wire7;
      reg24 <= {{wire22}};
    end
  always
    @(posedge clk) begin
      reg25 <= (!(~&$unsigned(wire17[(3'h4):(2'h3)])));
    end
  assign wire26 = (^{(~&$signed(wire11))});
  always
    @(posedge clk) begin
      reg27 <= wire10;
      reg28 <= wire6;
      reg29 <= wire21[(2'h3):(2'h3)];
      reg30 <= $unsigned($signed({(((8'haf) ?
              reg14 : wire6) != reg29[(3'h5):(2'h2)]),
          ((reg16 | wire11) ? (8'ha2) : $unsigned((8'hb9)))}));
      reg31 <= {wire6[(4'hb):(1'h0)], $unsigned(wire11[(1'h0):(1'h0)])};
    end
  assign wire32 = reg13[(3'h4):(2'h3)];
  assign wire33 = {{(($signed(reg30) == ((8'h9e) ? reg25 : (8'haa))) ?
                              ((reg25 ^ reg12) ?
                                  $signed((8'hb9)) : ((8'hbc) != reg27)) : $unsigned((~&wire18))),
                          reg24[(3'h4):(2'h3)]},
                      reg25};
  module34 #() modinst73 (.y(wire72), .clk(clk), .wire38(reg30), .wire36(wire7), .wire35(wire11), .wire37(reg16));
  assign wire74 = $unsigned($signed($signed($signed($signed(reg25)))));
  assign wire75 = (wire33 ?
                      (~|reg14) : $signed(($unsigned((wire21 ? reg28 : reg24)) ?
                          $unsigned($signed(wire7)) : (reg12 ^~ (-wire21)))));
  assign wire76 = wire11[(4'hb):(2'h3)];
  assign wire77 = (~&$signed((reg30 - {$unsigned(reg25)})));
  assign wire78 = wire8[(5'h11):(3'h7)];
  assign wire79 = ((reg13 ?
                          (^~(~{reg23, wire75})) : {$unsigned({wire26,
                                  reg25})}) ?
                      reg13[(3'h4):(3'h4)] : (~&($unsigned($unsigned(reg13)) >>> reg12[(3'h4):(3'h4)])));
  assign wire80 = wire18[(2'h2):(1'h0)];
endmodule

module module34  (y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire38;
  input wire signed [(4'he):(1'h0)] wire37;
  input wire signed [(4'h9):(1'h0)] wire36;
  input wire [(5'h13):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
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
                 reg44,
                 (1'h0)};
  assign wire39 = $signed((^~$unsigned(({wire36} ?
                      $signed(wire37) : $signed(wire37)))));
  assign wire40 = $unsigned({((8'hb8) > (wire36[(4'h9):(4'h9)] ?
                          $signed(wire39) : wire37[(2'h2):(1'h0)]))});
  assign wire41 = ((wire40 != (!(!(8'hb1)))) ?
                      ((^wire40) ?
                          (8'hb5) : ((wire38 < wire35[(4'ha):(3'h4)]) <<< {$signed(wire40)})) : ((wire37[(1'h1):(1'h0)] ?
                          wire40 : wire38[(1'h1):(1'h0)]) | $unsigned(($unsigned(wire35) >> (wire38 >> wire38)))));
  assign wire42 = ($signed((~wire36)) << $signed((wire36[(3'h4):(1'h0)] ?
                      ((&wire38) >= (wire41 >> (8'ha0))) : $unsigned((8'h9e)))));
  assign wire43 = ((wire38[(3'h6):(1'h1)] >= {wire35}) || $unsigned(wire37[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg44 <= ($signed(wire42) ?
          wire37 : ((((~(8'hba)) < wire35) < (~wire36)) ?
              $signed(wire40) : $unsigned((~^(wire39 + wire43)))));
    end
  assign wire45 = (!(~|(~(|wire41))));
  assign wire46 = wire36[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      if ((^(wire46 ~^ $signed(($signed((8'hbd)) == ((8'hae) ?
          wire35 : wire41))))))
        begin
          reg47 <= {{({(wire43 >= wire43), $unsigned(wire35)} ?
                      $unsigned((wire35 ?
                          wire40 : reg44)) : {(wire41 << wire35)}),
                  wire37[(4'h9):(1'h1)]},
              $unsigned(wire40)};
        end
      else
        begin
          if ($unsigned((!(^~wire45[(3'h4):(1'h0)]))))
            begin
              reg47 <= {(~^wire43[(4'hd):(2'h3)])};
            end
          else
            begin
              reg47 <= $signed($unsigned(wire46[(4'hc):(3'h6)]));
              reg48 <= wire45[(1'h1):(1'h0)];
              reg49 <= (~|wire37[(4'h8):(3'h6)]);
              reg50 <= (+((((8'ha5) ? $signed(wire39) : wire43) ?
                      {(-reg47)} : (reg47[(2'h2):(2'h2)] ?
                          (reg48 || (7'h41)) : (wire38 < wire41))) ?
                  ($signed(wire39) - wire43) : wire42));
              reg51 <= wire39[(1'h1):(1'h0)];
            end
        end
      if ($unsigned(((reg47 ?
          {$signed((8'hbd)),
              $unsigned(wire45)} : $unsigned((~^reg44))) ^~ $unsigned(reg50[(1'h0):(1'h0)]))))
        begin
          if ($signed(($unsigned($unsigned(reg47[(2'h3):(2'h3)])) - $unsigned(((|(8'hb8)) ?
              (|reg49) : {reg47})))))
            begin
              reg52 <= ({$unsigned($unsigned($unsigned(reg48)))} ?
                  (!(^$signed((~^wire46)))) : ($signed((((8'hab) ?
                      reg50 : reg50) - wire36)) != $unsigned((~|$signed(wire39)))));
              reg53 <= (8'hbc);
              reg54 <= ((!(^wire43[(3'h7):(3'h6)])) ?
                  (reg52 ?
                      $unsigned((&$unsigned(wire35))) : $unsigned((!wire37))) : (!$unsigned(wire41)));
              reg55 <= $signed(wire42[(2'h2):(2'h2)]);
              reg56 <= (|{($unsigned(reg47) ?
                      $unsigned(reg54[(5'h12):(4'hf)]) : ($unsigned(wire37) ?
                          reg49 : (wire39 ? (8'hbd) : wire42))),
                  wire37[(3'h5):(2'h2)]});
            end
          else
            begin
              reg52 <= ((reg55 ?
                      {({(8'haf), (7'h41)} ?
                              (wire39 << reg51) : wire46[(4'hb):(3'h7)]),
                          reg55[(4'h9):(4'h9)]} : ($unsigned((reg53 > reg48)) ?
                          reg53[(4'ha):(4'h9)] : ((wire35 >>> wire46) > {reg44}))) ?
                  $signed(reg56[(1'h1):(1'h0)]) : wire43[(2'h2):(2'h2)]);
              reg53 <= $signed(((~|$unsigned({wire37, reg48})) ?
                  (((&wire38) + {reg53, reg47}) <<< ((8'h9e) ?
                      (reg49 ?
                          wire43 : (7'h40)) : $unsigned(reg52))) : (reg52[(4'hd):(3'h6)] - ($signed(reg47) ?
                      (!wire45) : (~reg48)))));
            end
          reg57 <= $signed({reg55[(2'h3):(2'h2)]});
          reg58 <= (wire35 ?
              {{wire36, (~&$unsigned(reg48))},
                  ((reg55 ? wire42[(1'h0):(1'h0)] : $signed(wire38)) ?
                      wire46 : $unsigned((reg57 >> wire43)))} : (~&wire42[(2'h3):(2'h2)]));
          reg59 <= reg57[(4'h8):(3'h4)];
        end
      else
        begin
          reg52 <= reg52;
          reg53 <= (((~|($signed(wire42) ^~ $unsigned(wire39))) - (^~(((8'ha0) <<< reg52) | wire35[(4'he):(2'h3)]))) ?
              (((~^reg51) - ((wire41 + reg50) + reg50)) <= ((wire37 ?
                      (wire35 != reg47) : (wire41 ? wire42 : wire45)) ?
                  $signed(reg55[(4'h8):(3'h4)]) : (wire42 ?
                      {reg52,
                          reg44} : reg58))) : ((~wire38) == $unsigned(reg54[(4'ha):(1'h1)])));
        end
      reg60 <= ((reg56 ?
          reg44[(4'he):(4'h9)] : reg49[(4'h9):(2'h3)]) >= {wire40[(3'h6):(2'h3)]});
      if (reg50[(2'h3):(1'h1)])
        begin
          reg61 <= (wire36[(3'h5):(2'h3)] && reg54);
          if ($unsigned((8'had)))
            begin
              reg62 <= reg51[(2'h3):(1'h0)];
              reg63 <= $signed($unsigned(wire41));
              reg64 <= {((!(reg58 & (!wire45))) ?
                      $unsigned((8'hae)) : wire45[(1'h1):(1'h1)])};
              reg65 <= (reg58 ? (7'h43) : reg59);
            end
          else
            begin
              reg62 <= (^~(!((|$unsigned((8'hb5))) ?
                  ({reg55} != {wire42,
                      wire45}) : $unsigned(wire43[(3'h5):(3'h4)]))));
              reg63 <= reg48;
              reg64 <= (|((($signed(wire40) == (~^reg48)) ^~ {wire42}) > (^~reg48[(4'he):(2'h2)])));
            end
          if ($signed((8'haf)))
            begin
              reg66 <= ($unsigned(reg54) * (|(+$signed({reg63, (8'hac)}))));
              reg67 <= $unsigned($unsigned((8'hb0)));
              reg68 <= reg56[(4'hf):(4'hf)];
            end
          else
            begin
              reg66 <= (~&(~^(+({reg65, reg49} && (wire35 >> reg52)))));
              reg67 <= (~|(8'hb1));
              reg68 <= ({reg56[(4'hc):(4'h8)], wire45} != ((((reg56 <= wire42) ?
                      (reg57 != wire35) : $unsigned(wire38)) <<< ((wire38 ?
                          reg61 : reg57) ?
                      (reg60 ? reg54 : reg68) : wire38)) ?
                  (reg52 ?
                      (reg65[(3'h6):(3'h6)] & (~|reg56)) : $signed($signed((8'hb0)))) : {wire36[(4'h8):(2'h2)],
                      reg64}));
              reg69 <= ((~(~&(~(reg47 && reg60)))) - $signed(wire35));
            end
          reg70 <= $signed(((~((7'h40) ?
              (+reg55) : reg68)) | (+$unsigned(reg62[(2'h2):(2'h2)]))));
          reg71 <= $unsigned(reg48[(4'hb):(2'h2)]);
        end
      else
        begin
          reg61 <= (wire43 ?
              $unsigned(wire43[(4'hb):(1'h1)]) : $unsigned({$unsigned(reg71[(1'h0):(1'h0)]),
                  reg51[(2'h2):(1'h0)]}));
          if ($signed((reg68 ~^ $signed($unsigned($signed(reg55))))))
            begin
              reg62 <= ((^reg55[(3'h4):(1'h0)]) >= $signed(wire35[(1'h0):(1'h0)]));
              reg63 <= $signed(reg69[(3'h5):(3'h5)]);
              reg64 <= wire43[(3'h5):(1'h1)];
              reg65 <= (+$signed(((8'ha9) ?
                  (wire38[(4'hf):(4'h8)] ?
                      (reg67 | (8'ha6)) : wire37[(4'h9):(2'h3)]) : wire35)));
              reg66 <= $unsigned((wire35[(5'h13):(3'h4)] ?
                  reg71[(4'hc):(2'h2)] : reg61));
            end
          else
            begin
              reg62 <= reg51[(3'h4):(1'h1)];
              reg63 <= (((8'hb1) ?
                  (+$unsigned($signed(wire42))) : $unsigned({$unsigned(wire42),
                      {reg58}})) > (8'hb3));
              reg64 <= reg50[(1'h0):(1'h0)];
              reg65 <= reg70;
            end
          reg67 <= (8'ha0);
          reg68 <= {wire35[(3'h7):(3'h6)]};
        end
    end
endmodule

module module169
#(parameter param190 = ({(+((^~(8'hb8)) ? {(8'h9d), (8'ha6)} : ((8'hbf) ? (8'hbd) : (8'hb5))))} <= (~|{(((8'hb5) ? (8'hbe) : (8'ha8)) ? (~^(8'hba)) : {(8'haf), (8'haa)})})))
(y, clk, wire174, wire173, wire172, wire171, wire170);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire174;
  input wire [(4'h9):(1'h0)] wire173;
  input wire signed [(4'h8):(1'h0)] wire172;
  input wire signed [(3'h7):(1'h0)] wire171;
  input wire signed [(3'h6):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire184;
  wire signed [(4'ha):(1'h0)] wire183;
  wire signed [(5'h10):(1'h0)] wire182;
  wire signed [(5'h13):(1'h0)] wire181;
  wire signed [(2'h2):(1'h0)] wire180;
  wire [(5'h15):(1'h0)] wire179;
  wire signed [(5'h14):(1'h0)] wire178;
  wire signed [(4'hd):(1'h0)] wire177;
  wire signed [(5'h15):(1'h0)] wire176;
  wire [(4'hf):(1'h0)] wire175;
  reg [(4'hb):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg187 = (1'h0);
  reg [(4'h9):(1'h0)] reg186 = (1'h0);
  reg [(4'hd):(1'h0)] reg185 = (1'h0);
  assign y = {wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 (1'h0)};
  assign wire175 = $signed({wire173[(2'h3):(1'h0)],
                       $unsigned($unsigned({wire172}))});
  assign wire176 = ((+$signed(wire173[(2'h3):(2'h2)])) ^ wire175);
  assign wire177 = $signed((-(^~wire175)));
  assign wire178 = wire176;
  assign wire179 = wire171;
  assign wire180 = $unsigned($signed(wire178));
  assign wire181 = wire173[(1'h0):(1'h0)];
  assign wire182 = ({$unsigned($unsigned($unsigned(wire176))),
                           wire176[(3'h5):(2'h3)]} ?
                       wire178[(2'h3):(1'h0)] : ((&(wire176[(4'h9):(2'h3)] >> $unsigned((7'h43)))) ?
                           (&wire178[(4'h9):(4'h8)]) : ((~(+wire173)) <<< wire170[(1'h1):(1'h1)])));
  assign wire183 = (~&((^wire182[(4'ha):(4'h8)]) ?
                       (~^(!(-wire175))) : wire175));
  assign wire184 = $unsigned({$signed(wire170[(3'h5):(2'h3)])});
  always
    @(posedge clk) begin
      reg185 <= (^$signed({((wire171 < wire180) ? $signed(wire178) : wire171),
          {{wire181, wire181}, wire178[(3'h5):(2'h3)]}}));
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire172))
        begin
          reg186 <= $signed((wire182[(4'he):(4'ha)] != wire174));
          reg187 <= ({($unsigned($signed(wire184)) >>> $signed(wire179))} ?
              wire184[(4'h9):(3'h4)] : (!wire180[(1'h0):(1'h0)]));
          reg188 <= wire171;
        end
      else
        begin
          reg186 <= wire171[(3'h5):(3'h5)];
          reg187 <= ($unsigned((~(((8'hb6) ? (8'hb5) : (7'h43)) ?
                  (8'had) : $unsigned(reg186)))) ?
              wire176 : wire184);
          reg188 <= ((~^wire173) & wire177);
          reg189 <= ($unsigned({wire177,
              (+$signed(wire175))}) ~^ wire179[(4'hb):(3'h6)]);
        end
    end
endmodule
