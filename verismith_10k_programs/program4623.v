module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h227):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire201;
  wire signed [(2'h3):(1'h0)] wire199;
  wire signed [(3'h7):(1'h0)] wire198;
  wire signed [(4'he):(1'h0)] wire197;
  wire signed [(4'ha):(1'h0)] wire182;
  wire [(3'h5):(1'h0)] wire181;
  wire [(5'h13):(1'h0)] wire180;
  wire signed [(4'hb):(1'h0)] wire179;
  wire [(4'hf):(1'h0)] wire178;
  wire [(4'he):(1'h0)] wire177;
  wire [(5'h12):(1'h0)] wire176;
  wire [(2'h2):(1'h0)] wire175;
  wire [(3'h5):(1'h0)] wire159;
  wire signed [(4'he):(1'h0)] wire158;
  wire [(4'hf):(1'h0)] wire157;
  wire signed [(4'hc):(1'h0)] wire156;
  wire signed [(3'h4):(1'h0)] wire155;
  wire [(5'h13):(1'h0)] wire154;
  wire signed [(4'hf):(1'h0)] wire153;
  wire signed [(4'hb):(1'h0)] wire151;
  reg [(4'ha):(1'h0)] reg160 = (1'h0);
  reg [(4'hc):(1'h0)] reg161 = (1'h0);
  reg [(2'h3):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg166 = (1'h0);
  reg [(4'h8):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg170 = (1'h0);
  reg [(5'h13):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  reg [(4'hb):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg185 = (1'h0);
  reg [(4'hc):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg189 = (1'h0);
  reg [(4'h8):(1'h0)] reg190 = (1'h0);
  reg [(4'h8):(1'h0)] reg191 = (1'h0);
  reg [(4'h9):(1'h0)] reg192 = (1'h0);
  reg [(5'h11):(1'h0)] reg193 = (1'h0);
  reg [(2'h2):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg196 = (1'h0);
  assign y = {wire201,
                 wire199,
                 wire198,
                 wire197,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire151,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
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
                 reg195,
                 reg196,
                 (1'h0)};
  module5 #() modinst152 (.wire7(wire0), .wire10(wire1), .wire6(wire4), .clk(clk), .y(wire151), .wire8(wire2), .wire9(wire3));
  assign wire153 = ($signed($signed($unsigned(((8'ha8) ? wire2 : wire2)))) ?
                       $signed(({(wire3 ? wire4 : wire3)} - ((wire0 ?
                               wire0 : wire4) ?
                           {wire4} : wire3))) : $unsigned(($signed((~|wire0)) ?
                           (~&{wire3}) : (wire0 < {wire1}))));
  assign wire154 = $signed((((!$signed(wire4)) ?
                           ($signed((8'ha0)) != (~wire153)) : (~|$signed(wire0))) ?
                       $signed(wire0[(3'h5):(3'h5)]) : $signed(((!wire151) >= (wire153 ?
                           wire153 : wire3)))));
  assign wire155 = $unsigned(wire1[(1'h0):(1'h0)]);
  assign wire156 = $signed($unsigned(((^~(wire155 || (8'ha1))) ~^ wire0[(4'hf):(4'h9)])));
  assign wire157 = ($unsigned(((|(~^wire0)) - ((wire1 * wire4) ?
                       (|wire3) : (wire154 & (8'hbe))))) != {(wire3 || $signed(((8'ha8) ?
                           wire151 : wire154))),
                       $unsigned((^wire151))});
  assign wire158 = $signed(wire0[(3'h5):(1'h1)]);
  assign wire159 = (8'hb7);
  always
    @(posedge clk) begin
      if ($signed((|(~|(&$signed(wire3))))))
        begin
          if (wire4[(4'h8):(3'h7)])
            begin
              reg160 <= wire4;
              reg161 <= (wire151[(1'h0):(1'h0)] ?
                  ($signed(wire159) - (|($unsigned(wire155) == $signed(wire0)))) : wire154);
              reg162 <= ((($unsigned($signed(wire3)) ?
                      wire154[(4'hb):(4'hb)] : (~^(reg160 ~^ reg161))) ?
                  {{wire151[(1'h1):(1'h1)]},
                      wire1} : $signed($signed(reg161))) * $signed(($signed((wire0 > (8'hb6))) & (8'hac))));
              reg163 <= wire0;
            end
          else
            begin
              reg160 <= reg160[(1'h1):(1'h0)];
              reg161 <= reg162;
              reg162 <= (|wire0[(1'h1):(1'h0)]);
            end
          if ((-wire1[(3'h4):(1'h1)]))
            begin
              reg164 <= ({{wire151[(3'h4):(2'h2)]}} ?
                  ($unsigned({(wire157 ? wire153 : (8'ha4)),
                      wire156}) <= (((wire155 - reg161) <= (&wire3)) ?
                      wire153 : {(wire155 << wire2)})) : (wire159 >>> ($signed($signed(reg161)) | ($signed(reg160) ^ ((8'ha3) >= (8'hb6))))));
              reg165 <= ($signed(($signed((wire0 ?
                  reg163 : (8'haa))) ^~ wire158)) || (wire159 ?
                  (((8'hb9) ^~ wire157) > (wire3[(3'h7):(3'h5)] < (reg164 * reg160))) : (~$signed($signed(wire0)))));
              reg166 <= ($unsigned(reg165) >> wire151[(3'h5):(2'h3)]);
              reg167 <= {wire157[(3'h6):(3'h5)], reg164[(1'h1):(1'h0)]};
            end
          else
            begin
              reg164 <= reg164;
              reg165 <= (-(!(wire159[(1'h0):(1'h0)] >> reg160)));
            end
        end
      else
        begin
          reg160 <= (wire4[(3'h7):(3'h4)] ?
              {reg166[(1'h1):(1'h0)], {$signed($unsigned((8'hab)))}} : (wire3 ?
                  $signed((wire155 ?
                      (+(8'ha7)) : reg163[(1'h1):(1'h1)])) : ((~^(~|reg161)) * (wire1 >= wire157[(4'hb):(4'h9)]))));
        end
      reg168 <= $signed($signed(wire157));
      if (wire3)
        begin
          reg169 <= ($signed(((8'ha5) ?
                  (~|(wire156 ?
                      (8'hb2) : reg166)) : $unsigned(wire156[(3'h4):(1'h1)]))) ?
              {$signed(($unsigned(reg162) ?
                      (wire0 ? reg163 : (8'haf)) : ((8'ha0) <<< wire155))),
                  wire3[(5'h11):(3'h5)]} : (-((^~wire0[(1'h1):(1'h1)]) ?
                  ((reg168 ? wire153 : reg160) ?
                      $signed(reg166) : reg165) : wire4)));
          reg170 <= (^(|(~^(7'h40))));
          reg171 <= wire155;
        end
      else
        begin
          reg169 <= (reg168[(4'ha):(2'h2)] ?
              ($signed((wire0 ?
                  reg164[(3'h6):(3'h4)] : (|reg171))) ~^ (({(8'ha8)} ?
                  (wire3 ?
                      wire153 : wire151) : (reg170 | reg167)) < wire159)) : $unsigned($unsigned((reg163[(1'h1):(1'h0)] ?
                  (^wire157) : $unsigned(wire158)))));
          reg170 <= ((!reg167) ^~ $signed((|((reg169 ?
              reg161 : (8'h9d)) >>> $signed(wire2)))));
          reg171 <= ((($signed({reg166, wire155}) ?
                  (~|(wire0 <<< (8'hbb))) : (wire159[(1'h1):(1'h0)] * (^~wire157))) > $unsigned(reg169[(3'h4):(1'h1)])) ?
              $signed($unsigned(($signed(reg161) >>> (~^(8'haf))))) : $signed((8'hb1)));
          reg172 <= $unsigned(reg162[(2'h3):(1'h1)]);
        end
      reg173 <= (+(wire1[(2'h3):(1'h0)] ?
          $signed(reg171) : (((~^reg163) < (~^reg167)) ?
              (+reg161) : $signed(wire153[(4'he):(4'he)]))));
      reg174 <= {reg171[(1'h1):(1'h1)]};
    end
  assign wire175 = reg169[(5'h15):(5'h12)];
  assign wire176 = (!(~&reg170));
  assign wire177 = $signed((~&(wire176[(3'h7):(1'h1)] ?
                       ($unsigned((8'hba)) < (8'hb6)) : ((reg171 ?
                               (8'hb1) : (8'hb9)) ?
                           (reg165 <= wire1) : wire176))));
  assign wire178 = {(~^$unsigned((~&$signed(wire175)))),
                       (reg174 + reg170[(4'hc):(3'h5)])};
  assign wire179 = wire158;
  assign wire180 = reg164;
  assign wire181 = reg165;
  assign wire182 = ($signed((|((&(8'hba)) ?
                       $signed(reg168) : (^(7'h42))))) + {$signed(wire177),
                       ($unsigned($unsigned((8'hb2))) >= $signed($signed(wire0)))});
  always
    @(posedge clk) begin
      if ((^~({reg172[(4'he):(4'h9)]} ? (8'hbe) : reg169[(2'h3):(1'h1)])))
        begin
          reg183 <= $unsigned(((7'h40) >= $signed(((wire156 < wire181) == reg170[(4'ha):(3'h7)]))));
          if ((-$signed((wire1[(3'h4):(2'h2)] ?
              ($signed(wire175) ?
                  $signed(wire2) : (~^wire158)) : ((wire157 >= reg162) >> (^~wire181))))))
            begin
              reg184 <= wire4[(4'hb):(2'h2)];
              reg185 <= reg184;
              reg186 <= $unsigned((|reg165[(3'h5):(2'h2)]));
            end
          else
            begin
              reg184 <= $unsigned((-((~&$signed((8'ha6))) <<< $signed(reg172))));
              reg185 <= (+wire3[(5'h12):(4'hc)]);
              reg186 <= $signed($unsigned((((wire153 ? wire176 : wire159) ?
                      $unsigned(reg163) : {(8'hb5), reg165}) ?
                  (^~reg163[(1'h1):(1'h1)]) : $signed(reg173))));
            end
          if ($signed(reg160))
            begin
              reg187 <= $unsigned(reg167);
              reg188 <= (|wire153);
              reg189 <= {{wire3[(4'hd):(2'h3)],
                      (wire181[(3'h4):(3'h4)] | $unsigned($signed(wire1)))},
                  (^~((~^reg183) >>> $signed($unsigned(reg174))))};
              reg190 <= ((+reg169[(4'hb):(3'h6)]) ?
                  {{(~$unsigned(reg166)),
                          reg185[(1'h1):(1'h0)]}} : $unsigned($unsigned(($signed(wire157) ?
                      $unsigned(reg183) : (wire182 & reg174)))));
              reg191 <= (&wire159[(2'h2):(1'h1)]);
            end
          else
            begin
              reg187 <= $unsigned(((reg167 ?
                  ($unsigned(reg170) + reg164[(3'h5):(2'h3)]) : wire153) < $unsigned(reg168)));
              reg188 <= (reg171[(1'h1):(1'h0)] - wire180);
              reg189 <= $unsigned(reg169[(3'h4):(2'h2)]);
              reg190 <= (($unsigned(({wire2, reg165} << $signed(wire156))) ?
                  (wire180[(3'h4):(2'h2)] ?
                      ($unsigned(reg168) ?
                          wire180 : (+wire180)) : ($signed(wire178) ?
                          ((8'ha6) ?
                              reg190 : reg170) : $signed(wire151))) : $signed(((reg188 && reg161) ?
                      (reg171 <= (8'hbc)) : wire159[(1'h1):(1'h1)]))) >= (8'hbd));
              reg191 <= reg174[(1'h1):(1'h1)];
            end
          reg192 <= ((wire159 && (wire158[(3'h7):(1'h0)] == (8'ha2))) ?
              ((^~$unsigned(wire4)) ?
                  $unsigned(((reg165 ^~ (8'hb8)) ?
                      (reg189 ?
                          reg166 : reg172) : (8'haf))) : $unsigned(reg185)) : $signed(reg189[(2'h2):(1'h0)]));
          reg193 <= ((^(reg160[(2'h2):(1'h0)] ?
                  wire156 : ((reg192 ? wire2 : wire2) ~^ $unsigned(wire156)))) ?
              wire153[(1'h0):(1'h0)] : $unsigned($signed(((|(8'haa)) >>> (reg192 ?
                  wire2 : wire176)))));
        end
      else
        begin
          reg183 <= $signed((~|wire1[(4'hf):(3'h4)]));
          reg184 <= $unsigned(wire157);
          reg185 <= (wire0 ?
              reg187 : $unsigned(($signed((+(8'hb9))) != reg190)));
        end
      reg194 <= reg170[(4'hf):(4'hd)];
      reg195 <= wire156;
      reg196 <= wire151;
    end
  assign wire197 = ((^($signed($signed(reg194)) ^ ((reg185 == wire151) ?
                       wire177 : (wire175 <= reg189)))) && (8'ha6));
  assign wire198 = ($unsigned((8'ha5)) ?
                       {$unsigned($signed($signed(reg195)))} : $unsigned(reg183));
  module5 #() modinst200 (.wire7(reg185), .clk(clk), .wire8(wire154), .y(wire199), .wire10(wire4), .wire9(reg171), .wire6(reg193));
  assign wire201 = reg162[(2'h2):(1'h1)];
endmodule

module module5
#(parameter param149 = (!(-(^~{((8'hb2) >= (8'ha2)), ((8'h9c) ? (8'ha9) : (8'h9e))}))), 
parameter param150 = (8'haa))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire143;
  wire signed [(4'he):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(4'h8):(1'h0)] wire140;
  wire [(4'h8):(1'h0)] wire138;
  wire signed [(5'h14):(1'h0)] wire113;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire111;
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg [(2'h3):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire138,
                 wire113,
                 wire46,
                 wire13,
                 wire12,
                 wire11,
                 wire85,
                 wire87,
                 wire88,
                 wire90,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire95,
                 wire111,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg89,
                 (1'h0)};
  assign wire11 = wire8;
  assign wire12 = wire6[(4'h9):(4'h8)];
  assign wire13 = $unsigned((wire6[(2'h2):(1'h1)] && ({$signed(wire10),
                      (wire12 ? wire8 : (8'ha4))} > (~(wire11 ?
                      wire10 : wire11)))));
  module14 #() modinst47 (wire46, clk, wire10, wire7, wire12, wire6, wire8);
  module48 #() modinst86 (.clk(clk), .wire52(wire6), .wire50(wire7), .wire49(wire10), .wire51(wire8), .y(wire85));
  assign wire87 = wire46;
  assign wire88 = $signed((($unsigned(wire9) ?
                          $unsigned(wire46) : {wire87, (-wire12)}) ?
                      ($signed((~&wire11)) >>> (wire46[(4'hb):(4'hb)] || $signed(wire7))) : $signed({wire7[(4'hb):(2'h2)],
                          wire7})));
  always
    @(posedge clk) begin
      reg89 <= ({wire88[(2'h2):(2'h2)],
          {wire10,
              (~$unsigned(wire85))}} ~^ $signed((({wire87} < $signed(wire10)) << {wire9[(3'h5):(2'h2)]})));
    end
  assign wire90 = {($signed($signed((wire11 ? wire8 : wire46))) ?
                          wire12[(5'h12):(1'h1)] : (wire9 ^~ (~&$unsigned(wire11)))),
                      wire11[(1'h1):(1'h0)]};
  assign wire91 = (wire6 != {wire6,
                      ((~$signed(wire8)) ?
                          reg89[(5'h13):(5'h12)] : (wire7[(4'h8):(3'h6)] ?
                              (~wire88) : (8'hbc)))});
  assign wire92 = (~|$unsigned(wire6[(4'hc):(3'h7)]));
  assign wire93 = ($unsigned(((wire13[(1'h0):(1'h0)] & reg89) ?
                      wire10[(1'h1):(1'h0)] : wire87)) << wire87);
  assign wire94 = $unsigned((&($unsigned(reg89[(3'h4):(1'h0)]) ?
                      ($unsigned(wire8) ?
                          (|wire9) : $signed(wire90)) : wire10[(4'ha):(2'h2)])));
  assign wire95 = $signed(wire10[(2'h3):(2'h3)]);
  module96 #() modinst112 (.wire101(wire10), .y(wire111), .wire100(wire90), .wire97(wire93), .clk(clk), .wire99(wire88), .wire98(wire95));
  assign wire113 = wire12;
  module114 #() modinst139 (.y(wire138), .wire115(wire10), .wire118(wire85), .clk(clk), .wire117(wire87), .wire116(wire12));
  assign wire140 = wire92;
  assign wire141 = wire95[(1'h0):(1'h0)];
  assign wire142 = wire46[(4'hc):(3'h7)];
  assign wire143 = (!{(wire91 <<< {(wire94 >> (7'h44)), (wire113 << wire8)})});
  always
    @(posedge clk) begin
      if ($unsigned((~|$signed(wire140))))
        begin
          reg144 <= $signed(((~&(wire142 ^~ (wire95 >>> wire88))) ?
              (((wire7 ? wire95 : (8'h9c)) ?
                  $unsigned(wire10) : (wire141 ?
                      (8'ha5) : wire12)) * $unsigned($unsigned(wire7))) : $signed(((wire142 | wire7) ?
                  $unsigned((7'h43)) : ((8'hae) ? wire7 : wire13)))));
          if ((((wire91 - ((^~wire94) ?
              (~&wire13) : (-wire6))) > $unsigned(((&(8'ha8)) | (wire7 ?
              wire91 : wire111)))) + (wire140[(1'h1):(1'h0)] | (^~$unsigned(wire88[(4'h8):(4'h8)])))))
            begin
              reg145 <= (7'h44);
            end
          else
            begin
              reg145 <= $unsigned((+reg144));
              reg146 <= ({$unsigned((~wire143[(2'h3):(2'h2)]))} ?
                  wire91[(3'h4):(1'h1)] : (^~(-(-wire8))));
              reg147 <= wire46;
            end
        end
      else
        begin
          if ($signed($signed(wire138[(3'h6):(1'h0)])))
            begin
              reg144 <= ({(8'hbc)} ?
                  (wire7 ^ (((+wire143) & $signed(wire46)) | {$signed(wire138),
                      wire9})) : (&($unsigned((^~(8'ha0))) ^ wire85)));
              reg145 <= (wire141[(2'h2):(2'h2)] ?
                  wire11 : (~&(((wire111 >>> wire8) & (^~wire95)) ?
                      (wire142 || wire12[(4'h8):(1'h1)]) : wire91)));
              reg146 <= wire141;
            end
          else
            begin
              reg144 <= (-(wire143[(3'h5):(3'h5)] ~^ reg147));
              reg145 <= wire7[(4'hf):(4'hd)];
              reg146 <= ((reg146 ?
                      wire142 : ((wire13[(2'h3):(2'h3)] <= reg146) ?
                          $unsigned({wire13}) : ((wire7 < wire95) ?
                              (reg147 == wire90) : wire92[(4'ha):(1'h1)]))) ?
                  (wire138 ?
                      reg144 : ({$unsigned(wire91)} ?
                          wire111[(3'h6):(1'h1)] : (~^$signed((8'hb8))))) : $signed(($signed((wire46 ?
                      reg145 : wire13)) - wire93)));
              reg147 <= $unsigned(wire85);
              reg148 <= ((|$unsigned(wire141[(1'h1):(1'h0)])) <<< $unsigned((($unsigned(reg146) & (reg89 == wire13)) ?
                  ((8'h9e) > (^~reg146)) : wire7[(4'he):(4'ha)])));
            end
        end
    end
endmodule

module module114  (y, clk, wire118, wire117, wire116, wire115);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire118;
  input wire [(5'h11):(1'h0)] wire117;
  input wire signed [(4'ha):(1'h0)] wire116;
  input wire signed [(4'ha):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire137;
  wire [(3'h4):(1'h0)] wire136;
  wire signed [(3'h7):(1'h0)] wire135;
  wire signed [(3'h4):(1'h0)] wire125;
  wire signed [(4'hc):(1'h0)] wire124;
  reg signed [(3'h5):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg [(4'hc):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg119 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire125,
                 wire124,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((($unsigned(wire117) * (!(8'ha4))) ?
          ((wire116 - (7'h44)) ?
              wire118 : $unsigned(wire117)) : (!wire116[(2'h3):(2'h3)])))))
        begin
          reg119 <= $signed(((($unsigned(wire118) && (wire118 >= wire118)) * {(^wire116),
              ((8'hb2) - wire115)}) >> wire115));
          reg120 <= ((~((+$unsigned(wire115)) || wire116[(3'h6):(1'h0)])) ?
              ((wire118 ? wire118 : $unsigned(wire118[(3'h4):(1'h0)])) ?
                  ($unsigned((wire118 <= wire115)) ?
                      wire115 : wire118) : wire115[(1'h0):(1'h0)]) : $unsigned(($unsigned((^(8'ha3))) ?
                  $signed({wire116}) : ((reg119 ? wire116 : wire118) ?
                      $signed((8'h9d)) : (wire115 ? wire118 : wire116)))));
          reg121 <= $signed((((^~(wire115 ? wire115 : wire117)) ?
              ((wire118 && (8'h9c)) | (~|wire115)) : wire117) && ($signed(wire116) <= reg120[(3'h6):(2'h3)])));
        end
      else
        begin
          if (($signed((wire116 ?
              reg119 : ((wire115 ? wire115 : (8'hb6)) ?
                  $unsigned(wire118) : wire115))) | $unsigned($signed(((wire117 ?
                  wire118 : reg120) ?
              (wire115 ? wire118 : reg121) : wire118[(1'h0):(1'h0)])))))
            begin
              reg119 <= $signed($signed(reg121));
              reg120 <= $unsigned(reg121);
              reg121 <= {(reg121 ?
                      (-reg121) : ({$unsigned(reg120),
                          reg121} ^ (wire117[(1'h0):(1'h0)] ?
                          (reg120 ?
                              wire118 : wire116) : wire118[(2'h2):(1'h0)]))),
                  {(reg121[(4'ha):(2'h2)] >> ($signed(reg119) >> (wire116 ?
                          reg119 : wire117)))}};
              reg122 <= ((^~({$unsigned((8'hbf)),
                      reg120[(5'h11):(3'h7)]} - $unsigned(wire117))) ?
                  {{{wire118}, ((~|wire117) & ((8'h9f) ? wire117 : (8'hb2)))},
                      (~|($unsigned(wire116) ?
                          $signed(wire118) : $unsigned(wire117)))} : ((wire117[(2'h3):(2'h3)] ?
                      $signed($unsigned(wire118)) : wire118) > $signed((&$unsigned(reg119)))));
              reg123 <= (((^(reg119 ?
                  $signed((8'h9d)) : {wire117})) ^~ wire117[(1'h1):(1'h0)]) ^ $signed((8'hbc)));
            end
          else
            begin
              reg119 <= (~^($signed(wire116[(3'h5):(1'h1)]) ?
                  (8'hb1) : {(~$unsigned(wire117)),
                      (^wire116[(4'h8):(2'h3)])}));
              reg120 <= (($unsigned({(reg121 != reg121),
                      $signed(wire116)}) * wire118[(1'h0):(1'h0)]) ?
                  $unsigned($unsigned((~^((8'hb3) - reg120)))) : (&(&$unsigned((^(8'hb3))))));
              reg121 <= ((reg120 > $unsigned((8'hb5))) == (~|$unsigned((!wire117[(2'h3):(1'h1)]))));
              reg122 <= (reg123 ?
                  ((~&(!(~&wire115))) < $signed(reg120)) : (reg121 ?
                      reg122 : (|wire117)));
              reg123 <= $signed(reg119);
            end
        end
    end
  assign wire124 = ($unsigned(reg122[(4'h8):(2'h2)]) ?
                       (~(wire117 < reg119[(3'h4):(3'h4)])) : (($signed((reg122 >= reg122)) || (reg121 ?
                           (wire118 ~^ wire117) : (wire118 ?
                               reg123 : (8'hbd)))) || $unsigned($unsigned(reg119))));
  assign wire125 = (~|(|$signed(reg119[(4'ha):(2'h3)])));
  always
    @(posedge clk) begin
      reg126 <= (!reg120[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg127 <= reg122[(4'h8):(2'h3)];
      if ({(({reg122[(4'hf):(4'he)],
                  ((8'hae) ? wire115 : wire116)} != reg123[(3'h4):(1'h1)]) ?
              reg123 : $unsigned(wire116))})
        begin
          reg128 <= $unsigned($signed(((reg119 > (!(8'ha6))) ^~ wire118[(2'h2):(1'h0)])));
          reg129 <= {$signed(reg126)};
        end
      else
        begin
          reg128 <= $signed(wire124[(2'h3):(2'h2)]);
          reg129 <= $signed((^~($signed($signed(reg121)) ?
              wire117[(4'ha):(4'ha)] : (^~(reg122 >= (8'hb8))))));
          reg130 <= (|reg127);
          reg131 <= $signed($signed($unsigned(($unsigned(reg127) << wire118))));
        end
      reg132 <= reg119[(4'h9):(3'h7)];
      reg133 <= (!$unsigned(($signed((wire125 ? reg132 : wire125)) ?
          $signed((wire118 & reg128)) : (!(wire117 ? reg131 : (7'h43))))));
      reg134 <= $unsigned($unsigned(reg120[(3'h7):(3'h6)]));
    end
  assign wire135 = $unsigned({(~^wire117[(5'h11):(1'h1)]),
                       (~&$unsigned((reg120 ~^ reg119)))});
  assign wire136 = ((((&(reg128 ?
                       wire115 : reg122)) << wire135[(2'h3):(2'h3)]) - (|reg126)) * $signed($signed((-$signed(reg133)))));
  assign wire137 = ($signed($signed(reg128)) ?
                       {$signed(reg133),
                           (~(&(reg132 ?
                               reg131 : reg130)))} : (~^reg128[(3'h4):(1'h1)]));
endmodule

module module96  (y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire101;
  input wire [(3'h4):(1'h0)] wire100;
  input wire [(4'h8):(1'h0)] wire99;
  input wire [(4'hc):(1'h0)] wire98;
  input wire signed [(5'h13):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire105;
  wire signed [(4'h9):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 (1'h0)};
  assign wire102 = wire100[(2'h2):(2'h2)];
  assign wire103 = (^(((8'hae) ~^ $unsigned((wire101 - (8'hab)))) <<< (!((+wire101) >> wire100[(3'h4):(3'h4)]))));
  assign wire104 = ((wire97[(4'hb):(3'h4)] ?
                           wire99[(3'h5):(3'h5)] : wire101[(2'h2):(1'h0)]) ?
                       (wire103 ^~ (wire98 ?
                           $unsigned((wire100 == wire101)) : ($unsigned(wire100) ?
                               $signed(wire102) : wire102))) : {wire103[(3'h6):(1'h0)]});
  assign wire105 = wire98[(4'h8):(2'h3)];
  assign wire106 = wire99[(1'h1):(1'h0)];
  assign wire107 = ((|$unsigned(({wire97} ?
                           (wire99 ~^ wire105) : (~^wire103)))) ?
                       $signed(wire98) : {($unsigned(wire97) <= wire99[(3'h5):(3'h5)])});
  assign wire108 = (wire102 ?
                       {($signed(wire101[(4'hf):(4'hd)]) + (8'hb1)),
                           wire102} : $signed($unsigned(($signed(wire106) ?
                           wire104[(1'h1):(1'h1)] : (wire104 ?
                               wire99 : wire104)))));
  assign wire109 = $unsigned((wire106 ?
                       {wire104, wire99} : ((8'hb4) ?
                           ((wire101 <= wire97) ?
                               (|wire103) : $unsigned(wire98)) : $signed(wire101[(4'he):(3'h6)]))));
  assign wire110 = $unsigned($unsigned(wire104));
endmodule

module module48
#(parameter param83 = ((((!((8'hae) ? (8'hae) : (8'haf))) ? (&((8'hb7) <<< (8'h9c))) : (((8'hb3) >>> (8'ha1)) || ((8'hb6) ? (7'h41) : (8'hbf)))) ? (+{(~(8'hb2))}) : ((((8'hb0) ? (8'ha4) : (8'hbc)) ? {(8'hae)} : ((8'hbb) | (7'h41))) + (((8'hbc) ? (8'hbc) : (8'h9d)) ? ((8'hb0) ? (8'hbc) : (8'hac)) : ((8'ha2) ? (8'ha9) : (8'hbd))))) >>> (({((8'hbd) ? (8'haa) : (8'hba))} * (7'h40)) >= (^(&(^~(7'h42)))))), 
parameter param84 = {(&(~|param83)), (param83 * ((8'ha9) >> {(-param83), param83}))})
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire52;
  input wire [(3'h7):(1'h0)] wire51;
  input wire [(4'he):(1'h0)] wire50;
  input wire [(4'hd):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg54,
                 reg53,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg53 <= {($signed(wire50[(3'h6):(2'h2)]) ?
              $signed(wire51) : (wire51[(2'h2):(2'h2)] ?
                  ((wire50 ? wire50 : (8'h9c)) != (wire52 ?
                      wire51 : wire52)) : ((wire50 || wire49) <<< (wire52 && wire49))))};
      reg54 <= wire51;
    end
  assign wire55 = (8'hb8);
  assign wire56 = (wire55 == wire55[(3'h4):(2'h2)]);
  assign wire57 = $signed((((+$signed(reg53)) ?
                          wire51[(3'h6):(2'h3)] : $unsigned((!wire50))) ?
                      (($signed((8'hb7)) ?
                          $unsigned((8'ha4)) : (~reg54)) < (8'haf)) : wire50[(2'h3):(1'h0)]));
  assign wire58 = (wire49[(3'h4):(2'h2)] | {wire55[(2'h3):(2'h3)]});
  assign wire59 = wire55[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg60 <= wire52;
      reg61 <= ({{$unsigned(wire50)}} >>> {wire52[(1'h0):(1'h0)]});
    end
  always
    @(posedge clk) begin
      reg62 <= $unsigned(wire51);
      if (wire50)
        begin
          if ($unsigned(wire52[(2'h2):(1'h0)]))
            begin
              reg63 <= $signed({(|wire55[(1'h0):(1'h0)]), $unsigned(reg61)});
              reg64 <= reg53[(3'h5):(2'h2)];
              reg65 <= ($signed((~&reg53[(5'h12):(4'hc)])) <<< $signed((((~wire58) ?
                  (~^wire57) : (reg62 < wire51)) == reg53[(5'h10):(4'h9)])));
            end
          else
            begin
              reg63 <= {reg61};
              reg64 <= (~(wire58 <<< (wire57[(4'h9):(3'h4)] != ((8'hb3) ?
                  ((8'ha9) ? wire51 : wire58) : $unsigned(reg64)))));
              reg65 <= ($unsigned(reg53[(5'h11):(5'h11)]) <= (~&(~wire58)));
              reg66 <= (+reg53[(4'h9):(2'h2)]);
              reg67 <= ($unsigned((~|(wire55 ?
                  (wire58 ? wire58 : wire52) : (reg65 ?
                      reg62 : reg64)))) >= (~(wire52 ?
                  ($unsigned(wire58) < (wire58 ?
                      wire59 : reg65)) : $signed($signed(reg54)))));
            end
          if ((~(~&((~&reg62[(2'h2):(2'h2)]) ?
              ((-wire57) + (8'ha1)) : ($unsigned(reg60) ?
                  ((8'hba) * reg60) : (8'ha9))))))
            begin
              reg68 <= ($signed(reg54) != {reg60});
              reg69 <= (+reg62[(1'h0):(1'h0)]);
              reg70 <= $unsigned((~&{((+wire50) ?
                      $signed(reg67) : reg65[(2'h2):(1'h0)]),
                  $unsigned((wire51 + wire57))}));
              reg71 <= (~|{$signed(((^reg66) ?
                      reg62 : (reg69 ? wire57 : reg65))),
                  (&$unsigned(reg64[(1'h0):(1'h0)]))});
              reg72 <= $signed($unsigned((^wire49)));
            end
          else
            begin
              reg68 <= wire51[(2'h3):(2'h3)];
            end
        end
      else
        begin
          if (wire50)
            begin
              reg63 <= $signed(wire57);
              reg64 <= ((({reg62, (wire51 | reg67)} + reg63) ?
                      ((^$signed(wire51)) < $signed($unsigned(reg60))) : {(7'h43)}) ?
                  reg53 : $signed((~^$unsigned($signed(wire57)))));
              reg65 <= $signed((-($signed(reg54) ?
                  reg61[(1'h1):(1'h0)] : (~(~&reg62)))));
              reg66 <= {({$signed($signed(reg62)),
                      $signed((wire59 ? wire50 : reg63))} ^ $signed(((reg63 ?
                          reg54 : reg67) ?
                      reg65[(2'h2):(1'h1)] : wire55))),
                  {($unsigned((wire52 || (8'haa))) ?
                          ((reg67 & wire57) >= reg70) : wire58),
                      ((8'hbd) >>> ($unsigned(wire49) | wire52[(4'ha):(3'h6)]))}};
              reg67 <= (&reg69[(3'h4):(1'h1)]);
            end
          else
            begin
              reg63 <= (-wire49[(4'hd):(3'h6)]);
              reg64 <= ($unsigned(((wire57 & (reg65 ? wire59 : reg60)) ?
                  reg53[(4'ha):(3'h7)] : (~$signed((8'hae))))) <= wire56);
            end
          reg68 <= (8'ha4);
          reg69 <= (($signed($unsigned((~|reg67))) ?
              {(wire57 >> (~reg72)),
                  $signed((^reg60))} : $signed(wire57[(4'hf):(4'h9)])) < $unsigned($unsigned(($signed((8'ha7)) ?
              reg71 : {reg62, wire51}))));
        end
      reg73 <= {($signed((reg67 <= wire50[(3'h6):(3'h6)])) || ({reg63[(1'h0):(1'h0)]} ^ wire49)),
          $signed((~|$signed(reg65[(2'h3):(1'h1)])))};
      reg74 <= (((7'h40) ?
              ($signed($signed(wire57)) ?
                  ($unsigned((8'hb0)) >= wire51[(3'h7):(2'h2)]) : reg61[(1'h1):(1'h1)]) : $signed($signed($signed(wire55)))) ?
          reg54 : (+(~^(|(reg53 >> reg67)))));
    end
  assign wire75 = $unsigned((~^$unsigned(reg70[(2'h3):(1'h0)])));
  assign wire76 = reg60[(2'h2):(1'h0)];
  assign wire77 = reg62;
  assign wire78 = ((^~(reg73 ?
                          (wire52[(4'he):(3'h5)] ?
                              reg71[(4'hc):(4'h9)] : $signed(reg67)) : ((!reg61) - (reg74 << wire49)))) ?
                      ($unsigned($unsigned(wire58)) ?
                          reg54 : $signed(wire49[(3'h7):(2'h3)])) : $signed((-reg71[(4'ha):(3'h6)])));
  assign wire79 = $signed($signed(reg73));
  assign wire80 = (((-(wire59 ?
                          (reg53 ? wire49 : reg63) : (wire51 ?
                              reg70 : wire79))) ?
                      ((reg70[(1'h0):(1'h0)] >>> $signed(wire75)) <= wire52) : $signed((wire58 != {reg74,
                          reg67}))) & reg65);
  assign wire81 = (-reg53);
  assign wire82 = $unsigned({((-(wire51 + (8'hae))) + $unsigned((~^wire56)))});
endmodule

module module14
#(parameter param45 = (-(((8'ha8) ^~ {(+(8'hb5)), ((8'hbd) ? (8'ha8) : (8'ha9))}) ? (8'hb7) : {{(|(8'hb6))}})))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire35,
                 wire33,
                 wire32,
                 wire31,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg34,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire20 = $signed((($unsigned((wire15 * wire15)) ~^ (&$signed(wire17))) ?
                      (wire19 ?
                          $unsigned($signed(wire16)) : ({wire19,
                              wire18} || $unsigned(wire16))) : $signed(wire19)));
  assign wire21 = ((^wire20[(4'ha):(2'h3)]) ?
                      ((wire17 ? wire16 : wire16) * (wire17 ?
                          (7'h40) : ($signed(wire18) ?
                              $signed(wire16) : wire18[(5'h10):(1'h1)]))) : (&(({wire15,
                              (8'hb8)} >> $signed(wire18)) ?
                          {(wire15 - wire18), (wire18 != wire18)} : ((~wire17) ?
                              (-(7'h42)) : (-wire18)))));
  assign wire22 = (|(wire18 < $unsigned(({wire17} ?
                      (~&wire17) : (wire21 ? (8'h9e) : wire18)))));
  assign wire23 = (~|wire21[(2'h2):(1'h0)]);
  assign wire24 = $signed((^~(((wire16 ^~ wire23) >>> (~wire16)) + wire22[(1'h1):(1'h0)])));
  assign wire25 = $unsigned(wire23);
  always
    @(posedge clk) begin
      reg26 <= $signed(({(~^{wire18}), ($unsigned((8'hab)) > wire20)} ?
          ({(|wire16)} ?
              (~^(wire16 ?
                  wire23 : wire21)) : $unsigned({(8'hb9)})) : {$signed($unsigned(wire17)),
              $signed(((8'h9e) + wire15))}));
      reg27 <= wire22;
      reg28 <= $unsigned($signed($signed((wire17[(1'h0):(1'h0)] || (reg26 ?
          wire16 : reg27)))));
      reg29 <= (reg26[(3'h7):(1'h1)] < (!{$unsigned((^~wire20))}));
      reg30 <= $unsigned((((wire22 ?
          $unsigned(wire16) : wire21[(3'h7):(3'h5)]) ^ reg29) ^ (~^$unsigned($unsigned(wire17)))));
    end
  assign wire31 = (^(~^$signed(wire18[(5'h10):(1'h1)])));
  assign wire32 = (reg27 ? wire22[(4'h9):(4'h9)] : wire24[(1'h0):(1'h0)]);
  assign wire33 = $unsigned(reg27);
  always
    @(posedge clk) begin
      reg34 <= ({wire17,
          $unsigned(wire22[(3'h6):(1'h1)])} <= $unsigned($unsigned(wire19[(1'h1):(1'h1)])));
    end
  assign wire35 = (~&(^~reg29[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if ($unsigned(wire32))
        begin
          reg36 <= (reg30 ? wire20[(4'h9):(1'h0)] : $signed(wire20));
          reg37 <= {{wire15[(3'h6):(3'h4)]}};
          reg38 <= ($unsigned(((8'ha4) >>> ((wire31 != reg27) ?
              $signed(wire22) : wire18[(4'hc):(3'h4)]))) ^ $signed(($signed(wire15) ^ (~^(~&wire24)))));
        end
      else
        begin
          reg36 <= (({wire16,
                  ((reg36 ? wire35 : wire25) < $unsigned((8'hb0)))} ?
              (((wire18 ^ reg30) ~^ $unsigned(reg38)) >>> $signed((reg34 ?
                  (8'hb0) : (8'ha9)))) : ($unsigned((wire20 ?
                      (8'ha0) : wire17)) ?
                  ({wire33,
                      wire35} ~^ wire22) : wire31[(2'h3):(2'h3)])) > (~^wire15[(4'h9):(1'h1)]));
        end
      reg39 <= reg27;
      reg40 <= ($unsigned({(^~wire18)}) ?
          ($signed((~((8'hae) ?
              wire24 : reg27))) & (wire25 != $signed($signed(wire16)))) : reg29[(2'h2):(2'h2)]);
      reg41 <= $signed(wire25[(2'h2):(1'h1)]);
      reg42 <= $unsigned(reg38);
    end
  assign wire43 = (((((reg34 ? wire23 : wire21) ?
                                  (reg29 - reg29) : (wire18 ?
                                      wire32 : (8'hbc))) ?
                              (^~{reg34, reg39}) : reg42[(3'h7):(1'h0)]) ?
                          reg39 : wire21[(4'ha):(4'h8)]) ?
                      {$unsigned(reg27),
                          (^~{(wire23 ? reg26 : reg37),
                              (-wire19)})} : (~&$signed({(wire22 ?
                              (8'h9f) : wire19)})));
  assign wire44 = $unsigned($signed($unsigned($signed(wire15))));
endmodule
