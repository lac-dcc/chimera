module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire216;
  wire signed [(5'h15):(1'h0)] wire215;
  wire signed [(2'h3):(1'h0)] wire214;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire183;
  wire signed [(5'h12):(1'h0)] wire185;
  wire signed [(2'h2):(1'h0)] wire186;
  wire [(4'ha):(1'h0)] wire187;
  wire [(5'h10):(1'h0)] wire190;
  wire signed [(5'h12):(1'h0)] wire194;
  wire signed [(4'hd):(1'h0)] wire204;
  wire [(5'h14):(1'h0)] wire209;
  wire signed [(5'h13):(1'h0)] wire210;
  wire [(3'h7):(1'h0)] wire211;
  wire [(3'h6):(1'h0)] wire212;
  reg [(4'h9):(1'h0)] reg221 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg220 = (1'h0);
  reg [(4'h8):(1'h0)] reg219 = (1'h0);
  reg [(4'hf):(1'h0)] reg218 = (1'h0);
  reg [(5'h11):(1'h0)] reg193 = (1'h0);
  reg [(5'h11):(1'h0)] reg192 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg191 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg189 = (1'h0);
  reg [(5'h12):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg198 = (1'h0);
  reg [(5'h11):(1'h0)] reg199 = (1'h0);
  reg signed [(4'he):(1'h0)] reg200 = (1'h0);
  reg [(4'hf):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg203 = (1'h0);
  reg [(4'h8):(1'h0)] reg205 = (1'h0);
  reg [(4'hb):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg207 = (1'h0);
  reg [(4'hc):(1'h0)] reg208 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire214,
                 wire4,
                 wire5,
                 wire183,
                 wire185,
                 wire186,
                 wire187,
                 wire190,
                 wire194,
                 wire204,
                 wire209,
                 wire210,
                 wire211,
                 wire212,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg193,
                 reg192,
                 reg191,
                 reg189,
                 reg188,
                 reg196,
                 reg197,
                 reg198,
                 reg199,
                 reg200,
                 reg201,
                 reg202,
                 reg203,
                 reg205,
                 reg206,
                 reg207,
                 reg208,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = {$unsigned(((wire4 ?
                         wire4 : $signed(wire3)) >= $signed((^~wire3)))),
                     {wire1}};
  module6 #() modinst184 (.y(wire183), .wire8(wire3), .wire7(wire5), .wire9(wire1), .clk(clk), .wire10(wire4));
  assign wire185 = wire183;
  assign wire186 = $unsigned((~|(($unsigned(wire5) || $unsigned(wire5)) > wire3)));
  assign wire187 = (-{{($signed(wire1) ? $signed(wire186) : {wire1}),
                           $unsigned(((8'had) ? (8'hbb) : wire1))}});
  always
    @(posedge clk) begin
      reg188 <= $signed(((-($signed(wire4) >= wire1)) ?
          $signed($unsigned($unsigned(wire187))) : wire185[(3'h5):(1'h0)]));
      reg189 <= $unsigned(((~wire4[(1'h1):(1'h0)]) ?
          ((^~((7'h41) >>> wire0)) << reg188) : (wire3 ? reg188 : (8'hb2))));
    end
  assign wire190 = ({(8'h9e),
                       $signed((~^wire187))} != (wire2[(4'hd):(1'h1)] != (|$signed($unsigned(wire185)))));
  always
    @(posedge clk) begin
      reg191 <= {(~^(^~reg189)), $signed((^wire187))};
      reg192 <= {$signed(wire183)};
      reg193 <= wire4;
    end
  module48 #() modinst195 (wire194, clk, reg188, wire2, wire0, wire4, wire3);
  always
    @(posedge clk) begin
      if (((8'ha3) ? (+wire194[(2'h3):(2'h3)]) : wire4))
        begin
          reg196 <= (wire186[(1'h1):(1'h1)] ?
              (&wire190[(4'he):(4'ha)]) : wire0[(4'hf):(2'h2)]);
          reg197 <= reg189[(1'h0):(1'h0)];
        end
      else
        begin
          if (($unsigned(wire187[(1'h1):(1'h1)]) || (~|(8'hbc))))
            begin
              reg196 <= ($unsigned($signed((|(wire3 ? reg197 : (8'ha7))))) ?
                  {($signed($signed((8'ha2))) ^ wire186[(1'h1):(1'h1)])} : (&((8'hb9) ?
                      {(reg191 ? reg189 : wire183),
                          $signed(wire183)} : wire4)));
              reg197 <= $unsigned(($unsigned($signed((-wire186))) ?
                  (+$unsigned((wire1 ? wire0 : wire183))) : reg196));
              reg198 <= (&$unsigned((!$unsigned(wire185[(5'h11):(1'h1)]))));
              reg199 <= reg196;
            end
          else
            begin
              reg196 <= reg198;
              reg197 <= ({($signed(reg199) > (~^$signed((8'ha1))))} * wire1[(4'h9):(3'h6)]);
            end
          reg200 <= reg198[(2'h3):(2'h2)];
        end
      reg201 <= ({(wire1[(3'h7):(3'h5)] ? $unsigned(wire2) : reg200)} ?
          reg191 : (wire3 < (|(((8'hb2) << wire2) ^ (reg200 ?
              wire194 : (8'hbe))))));
      reg202 <= $unsigned((^{$signed(wire186), (+(-reg200))}));
      reg203 <= $unsigned({$signed(wire5)});
    end
  assign wire204 = ({$unsigned($signed((|(8'hae))))} != ($unsigned(((7'h43) ^~ $signed((8'ha2)))) ?
                       {((wire190 == wire186) ?
                               (reg198 >= (8'ha5)) : (reg193 ?
                                   reg199 : wire0))} : wire187));
  always
    @(posedge clk) begin
      reg205 <= (8'hb9);
      reg206 <= wire183;
    end
  always
    @(posedge clk) begin
      reg207 <= (-{(^~(~|$unsigned(wire0))),
          (((reg206 ? wire1 : reg193) ^~ wire194) ?
              $signed(((8'hb8) ? wire2 : (8'hab))) : ($unsigned(reg197) ?
                  (&reg193) : (wire186 ? wire183 : reg200)))});
      reg208 <= $signed($signed(((|wire194[(4'hb):(3'h4)]) ?
          reg192 : wire183)));
    end
  assign wire209 = $unsigned((+((-((8'h9c) ? wire5 : reg207)) ?
                       reg193[(2'h3):(1'h0)] : (^$unsigned((8'had))))));
  assign wire210 = reg199;
  assign wire211 = {(~^reg191),
                       $unsigned({$unsigned($unsigned(reg201)),
                           ((wire187 ? wire190 : wire3) ?
                               {reg188, reg191} : $signed(reg196))})};
  module92 #() modinst213 (wire212, clk, reg192, reg199, reg201, wire1);
  assign wire214 = wire1;
  assign wire215 = $signed(reg202);
  module141 #() modinst217 (.y(wire216), .clk(clk), .wire144(wire3), .wire145(reg197), .wire142(reg202), .wire143(wire215));
  always
    @(posedge clk) begin
      if (((reg200[(3'h5):(1'h0)] ?
          {((^reg191) || $signed((8'ha7)))} : (($unsigned(wire211) ^~ wire212[(3'h4):(1'h1)]) >>> reg207)) ~^ $signed((^(~|$unsigned(reg208))))))
        begin
          reg218 <= $signed(reg200);
          reg219 <= ((!wire216) ?
              ($signed(wire1[(2'h2):(1'h0)]) ?
                  $signed($signed(wire194)) : wire5) : wire2);
          reg220 <= (reg196 & $unsigned((((wire4 ~^ wire3) || (reg208 - wire5)) ?
              reg188[(4'hb):(3'h5)] : $signed(wire212[(3'h5):(1'h0)]))));
        end
      else
        begin
          reg218 <= wire190;
          reg219 <= $unsigned(reg207[(5'h14):(4'hb)]);
          reg220 <= $unsigned(reg201[(4'ha):(3'h6)]);
          reg221 <= reg201;
        end
    end
endmodule

module module6
#(parameter param182 = ((((((8'ha8) <<< (8'hb2)) <<< (&(8'haf))) ^~ (^~((8'hbb) ? (8'ha0) : (8'ha5)))) ? ((((8'ha7) ? (8'hbe) : (8'hb2)) ? ((8'hb0) ? (8'ha9) : (8'haf)) : ((7'h41) > (8'ha6))) ? {((8'hb4) ^ (8'hae)), ((8'hbf) & (8'hb6))} : (((8'ha0) || (8'hb9)) <= (8'ha3))) : {((8'hb5) ^ (|(8'ha6))), ((^~(8'hb9)) | ((8'haa) ? (8'ha6) : (8'h9c)))}) ? ((((~(8'ha6)) ? ((8'hac) * (8'hb9)) : ((8'hbc) - (8'hbb))) <<< {((8'hbc) ? (8'hb0) : (8'hbb))}) & {(((8'ha7) << (8'h9f)) ^ ((8'ha8) - (8'hb5))), (((8'h9e) ^ (8'ha9)) ? ((8'ha0) || (8'hbd)) : (&(8'ha5)))}) : ({(&((7'h41) << (8'h9c)))} ? {((8'hb5) < ((7'h43) ? (7'h42) : (8'hb3)))} : {((!(8'hae)) >= ((8'ha7) - (8'ha2)))})))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h222):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire181;
  wire signed [(5'h12):(1'h0)] wire114;
  wire [(3'h5):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire85;
  wire [(5'h13):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire139;
  wire [(3'h4):(1'h0)] wire140;
  wire signed [(5'h11):(1'h0)] wire179;
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg133 = (1'h0);
  reg [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg136 = (1'h0);
  reg [(2'h2):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg138 = (1'h0);
  assign y = {wire181,
                 wire114,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire43,
                 wire13,
                 wire12,
                 wire11,
                 wire116,
                 wire139,
                 wire140,
                 wire179,
                 reg45,
                 reg46,
                 reg47,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
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
                 (1'h0)};
  assign wire11 = (($unsigned({{wire10},
                          {wire9, wire10}}) > $unsigned((-{wire9}))) ?
                      (wire8 >>> $signed(((wire8 ?
                          wire8 : wire10) << (wire10 * wire7)))) : $signed($unsigned(wire7)));
  assign wire12 = $unsigned($signed($unsigned(wire7[(1'h0):(1'h0)])));
  assign wire13 = wire9;
  module14 #() modinst44 (.wire18(wire10), .clk(clk), .wire15(wire8), .y(wire43), .wire17(wire12), .wire16(wire9));
  always
    @(posedge clk) begin
      reg45 <= (wire43 ^ ($signed(($signed(wire7) ?
          $unsigned(wire9) : wire10[(4'hc):(4'h8)])) && ($unsigned((~|wire7)) <<< (~^(-wire10)))));
      reg46 <= (wire9[(4'hc):(2'h2)] >= $unsigned((^~wire10)));
      reg47 <= reg46;
    end
  module48 #() modinst86 (wire85, clk, wire13, wire9, wire8, wire11, reg45);
  assign wire87 = (wire11[(2'h3):(2'h2)] ^~ $unsigned($signed(wire7)));
  assign wire88 = reg45;
  assign wire89 = $signed($unsigned(reg45));
  assign wire90 = $unsigned((reg45 ?
                      {((wire9 & wire11) ? reg45[(2'h3):(1'h0)] : reg47),
                          (~|(wire88 ?
                              (8'ha4) : reg45))} : wire88[(1'h1):(1'h0)]));
  assign wire91 = ((^{$unsigned((wire9 ?
                          wire89 : wire13))}) || $unsigned((^wire11)));
  module92 #() modinst115 (wire114, clk, wire85, wire7, wire90, reg46);
  assign wire116 = ({(~|(((8'h9d) ? wire88 : wire89) ?
                               $unsigned(wire88) : (wire10 && wire88)))} ?
                       $signed((!({wire12, wire11} ?
                           wire10 : wire11[(2'h2):(2'h2)]))) : reg46);
  always
    @(posedge clk) begin
      if (wire87[(4'h8):(4'h8)])
        begin
          reg117 <= (wire13[(4'hb):(2'h3)] ?
              $signed($signed($unsigned(wire87[(4'h9):(2'h3)]))) : {$signed(wire85),
                  wire11[(3'h7):(2'h2)]});
          reg118 <= $signed(((-(!$signed(wire114))) | $unsigned(((8'hbc) >>> ((8'hbc) ?
              wire10 : reg117)))));
          if (reg118)
            begin
              reg119 <= reg45[(1'h1):(1'h1)];
              reg120 <= (((8'ha4) ?
                      ((wire87 != $unsigned(wire116)) + wire88) : {$unsigned((^~reg118)),
                          (~|reg47[(4'h8):(2'h3)])}) ?
                  (^(wire88 >>> $unsigned((reg46 <<< (8'hbc))))) : wire90);
              reg121 <= ((8'ha3) ?
                  $signed(wire87[(1'h1):(1'h0)]) : $signed({$signed((~^wire9)),
                      $signed(wire87[(4'h8):(3'h4)])}));
            end
          else
            begin
              reg119 <= (^(~|wire8));
              reg120 <= $signed($signed((+(-reg47[(3'h5):(3'h4)]))));
              reg121 <= wire43[(3'h4):(3'h4)];
            end
          if ($signed($unsigned($signed((((8'ha5) | reg46) ?
              (&wire7) : wire88)))))
            begin
              reg122 <= (^~(({(wire91 - wire12)} ?
                  $signed((wire88 ?
                      (7'h43) : reg120)) : reg118) ^~ $unsigned($signed((wire13 ?
                  reg47 : (8'hbf))))));
            end
          else
            begin
              reg122 <= wire85[(2'h2):(1'h0)];
              reg123 <= wire90;
            end
        end
      else
        begin
          reg117 <= (8'hb3);
          reg118 <= ({(reg122 ?
                  reg47 : (wire116[(3'h5):(3'h5)] == (~^reg47)))} <= reg119);
          reg119 <= $unsigned(((~$signed((+wire87))) ?
              $unsigned($signed({reg117})) : wire10[(4'h9):(1'h0)]));
          reg120 <= ((^~(reg47 ?
              (~$unsigned(reg47)) : wire8[(2'h2):(1'h1)])) >>> wire89[(4'hc):(4'ha)]);
          if (wire85[(4'he):(3'h6)])
            begin
              reg121 <= ({$signed(({reg47} ? (~wire90) : (~^wire87))),
                      $signed((reg120 - (!reg117)))} ?
                  {$signed(($signed(reg123) ? wire10 : reg47[(4'ha):(2'h3)])),
                      ((reg118[(3'h6):(3'h4)] > (+wire91)) & (~^(~&wire8)))} : $unsigned((reg119[(4'h8):(3'h4)] <= wire116)));
              reg122 <= $unsigned((~|$signed($signed(reg119))));
              reg123 <= ((|((reg120 ?
                      wire11[(2'h3):(1'h0)] : (^wire90)) + ($signed(wire90) ?
                      (8'hb8) : wire10))) ?
                  {(&wire116[(3'h4):(2'h3)])} : reg117[(2'h3):(2'h2)]);
              reg124 <= {(wire12[(1'h1):(1'h0)] ?
                      $unsigned($unsigned({wire116,
                          wire12})) : (reg47[(1'h1):(1'h0)] ?
                          wire116 : ((wire90 <= reg122) - (reg117 ?
                              (8'ha6) : (7'h42))))),
                  ({$unsigned(((8'ha7) ? reg123 : wire114)),
                      (8'had)} >= {reg120[(4'h8):(4'h8)], wire116})};
            end
          else
            begin
              reg121 <= (!wire11);
              reg122 <= reg118[(1'h1):(1'h0)];
              reg123 <= wire89[(3'h5):(2'h3)];
              reg124 <= wire13[(1'h0):(1'h0)];
            end
        end
      if ((8'hb0))
        begin
          if (wire116[(1'h1):(1'h1)])
            begin
              reg125 <= (reg119[(2'h3):(2'h3)] - reg121);
              reg126 <= {wire10,
                  $signed((~((~|reg124) ?
                      (reg121 ? reg46 : wire87) : wire11[(2'h2):(1'h1)])))};
            end
          else
            begin
              reg125 <= wire10[(3'h4):(1'h0)];
            end
          if (((8'hac) > wire10))
            begin
              reg127 <= reg124[(3'h4):(2'h3)];
              reg128 <= $unsigned((~wire87));
            end
          else
            begin
              reg127 <= (wire12[(4'hb):(4'ha)] ?
                  ((!((&wire85) > $unsigned(reg123))) ?
                      (~^($unsigned(reg120) ^ (reg128 < wire91))) : $signed(((wire114 ^~ reg122) ?
                          wire90 : (reg126 != (8'hb1))))) : (^~$signed($unsigned((~|(7'h43))))));
              reg128 <= wire10[(4'hf):(4'h8)];
              reg129 <= $signed({reg126});
              reg130 <= $unsigned({$unsigned($unsigned((reg128 ?
                      (8'h9c) : wire89)))});
              reg131 <= $signed(reg45);
            end
          reg132 <= (wire88[(1'h1):(1'h0)] ?
              $signed(wire43) : (reg119 || {($signed((8'ha2)) ?
                      reg122[(5'h12):(3'h6)] : (reg129 ? (8'hb3) : reg118))}));
          if (wire116[(4'ha):(4'ha)])
            begin
              reg133 <= (wire7[(1'h1):(1'h0)] ?
                  $signed((^((reg126 | reg121) <= $unsigned(reg121)))) : reg131[(4'h8):(2'h2)]);
              reg134 <= $unsigned((8'h9c));
              reg135 <= reg119[(3'h5):(1'h1)];
            end
          else
            begin
              reg133 <= ($signed($signed($unsigned((wire87 ?
                  reg118 : (7'h44))))) == reg130[(1'h1):(1'h1)]);
            end
          reg136 <= ($unsigned($signed(wire12)) ?
              (^reg46) : ($unsigned(((reg125 ~^ wire90) ?
                      wire114 : reg123[(1'h0):(1'h0)])) ?
                  {((wire114 ? wire89 : wire88) ?
                          ((8'ha8) ^~ (8'hbf)) : $signed(reg118))} : (wire91 - (~^(reg117 ~^ (7'h44))))));
        end
      else
        begin
          reg125 <= reg134;
        end
      reg137 <= (-(reg47[(3'h7):(2'h2)] ?
          $signed($signed(reg122[(4'he):(3'h4)])) : $unsigned($signed(((8'hab) >>> reg126)))));
      reg138 <= (~^((~&((reg136 + reg119) ^ wire9)) ^~ {((reg118 && reg121) == wire90[(3'h6):(2'h2)]),
          reg127[(5'h14):(5'h12)]}));
    end
  assign wire139 = $unsigned($signed($signed((((8'h9e) ?
                       wire91 : wire90) << reg124))));
  assign wire140 = $signed(reg137);
  module141 #() modinst180 (.clk(clk), .wire143(wire91), .wire145(wire139), .y(wire179), .wire144(wire7), .wire142(reg135));
  assign wire181 = $unsigned(reg138[(4'hb):(3'h6)]);
endmodule

module module141
#(parameter param178 = (^(8'ha4)))
(y, clk, wire145, wire144, wire143, wire142);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire145;
  input wire signed [(4'h8):(1'h0)] wire144;
  input wire [(2'h2):(1'h0)] wire143;
  input wire signed [(3'h6):(1'h0)] wire142;
  wire signed [(4'hc):(1'h0)] wire177;
  wire [(4'he):(1'h0)] wire176;
  wire [(5'h10):(1'h0)] wire175;
  wire signed [(5'h13):(1'h0)] wire174;
  wire signed [(3'h7):(1'h0)] wire173;
  wire [(2'h3):(1'h0)] wire172;
  wire [(4'hf):(1'h0)] wire171;
  wire signed [(4'hf):(1'h0)] wire170;
  wire [(5'h14):(1'h0)] wire169;
  wire signed [(4'h8):(1'h0)] wire168;
  wire signed [(4'hf):(1'h0)] wire167;
  wire signed [(3'h7):(1'h0)] wire166;
  wire [(3'h5):(1'h0)] wire165;
  wire [(3'h7):(1'h0)] wire164;
  wire signed [(3'h4):(1'h0)] wire163;
  wire [(4'hd):(1'h0)] wire146;
  reg [(5'h14):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg161 = (1'h0);
  reg [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(5'h11):(1'h0)] reg159 = (1'h0);
  reg [(2'h3):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg156 = (1'h0);
  reg [(3'h4):(1'h0)] reg155 = (1'h0);
  reg [(5'h15):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg148 = (1'h0);
  reg signed [(4'he):(1'h0)] reg147 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire146,
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
                 (1'h0)};
  assign wire146 = wire144[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg147 <= ($unsigned($signed(wire143)) ?
          wire144 : (&(((!(8'h9d)) ?
              ((8'ha0) & wire145) : (wire146 ?
                  wire143 : wire145)) >= $unsigned({(8'hbb), wire142}))));
      if ($signed($signed(((wire142[(2'h2):(1'h0)] - (wire142 ?
              (8'ha5) : wire143)) ?
          (!{wire142, (8'h9c)}) : $unsigned(wire144)))))
        begin
          reg148 <= (+wire143[(1'h0):(1'h0)]);
        end
      else
        begin
          reg148 <= $unsigned(((|($unsigned(wire146) & reg148)) ?
              wire144 : ({{reg148}} ?
                  ((reg148 ? reg147 : (8'hb3)) ?
                      (reg148 && reg148) : $signed(reg148)) : $unsigned($unsigned(wire145)))));
        end
      if ((reg148 ? reg147[(4'hc):(4'h9)] : wire142[(3'h5):(3'h4)]))
        begin
          reg149 <= wire144[(1'h1):(1'h0)];
          if (((wire142[(3'h5):(3'h4)] >> wire144[(3'h7):(3'h6)]) == ((-(8'hae)) >> (wire144 != $signed(wire145[(4'h9):(3'h5)])))))
            begin
              reg150 <= (((wire145 >= ((wire145 ? wire146 : wire145) ?
                          reg149 : (~&wire144))) ?
                      (~&((!reg147) >>> $unsigned(wire145))) : (({wire144} ?
                          (8'ha5) : (reg149 ?
                              wire145 : wire145)) == $unsigned((wire143 < wire142)))) ?
                  wire143[(2'h2):(1'h0)] : ((reg147 ?
                          wire143 : reg147[(4'he):(4'h9)]) ?
                      ($unsigned(wire145[(4'hc):(1'h1)]) ^~ reg147) : wire146[(1'h1):(1'h1)]));
              reg151 <= ($signed(wire145) & (~&((&wire143[(1'h0):(1'h0)]) && ((8'hbb) ?
                  $signed(reg147) : (wire145 == reg150)))));
              reg152 <= reg148[(2'h2):(1'h1)];
              reg153 <= (~^(wire143 ?
                  $unsigned($signed(reg149)) : $signed($unsigned((|(8'h9c))))));
            end
          else
            begin
              reg150 <= ($unsigned((&($signed(wire142) >> wire143))) ?
                  reg150[(4'hb):(1'h1)] : $unsigned($unsigned(({reg153,
                      (7'h43)} << (-reg147)))));
              reg151 <= wire144[(3'h4):(3'h4)];
              reg152 <= (({wire146[(4'hc):(1'h1)],
                          $signed($unsigned((8'hb6)))} ?
                      wire143 : {$signed($signed(wire145))}) ?
                  reg153[(2'h2):(2'h2)] : (+(|(~&reg149[(4'h9):(3'h5)]))));
            end
          if (($unsigned(($unsigned($signed(wire144)) & ((8'hb0) >> {wire143,
                  reg147}))) ?
              wire144[(3'h7):(2'h2)] : reg147[(4'hb):(4'ha)]))
            begin
              reg154 <= (&($signed(wire145[(1'h1):(1'h0)]) < (~&((&reg149) ^ {reg150}))));
              reg155 <= reg154;
              reg156 <= $signed(reg154);
              reg157 <= $unsigned($unsigned($unsigned($signed({wire143,
                  reg152}))));
            end
          else
            begin
              reg154 <= (reg148[(1'h0):(1'h0)] >> {wire143,
                  reg151[(3'h4):(1'h0)]});
              reg155 <= $unsigned((~|(~|reg148)));
              reg156 <= ((reg150[(4'hc):(3'h7)] ?
                  (wire144 >= {(~|wire142), wire146}) : (-(wire146 ?
                      (~^wire145) : (8'ha7)))) | ($signed({reg151[(4'h9):(3'h7)]}) ?
                  $signed(wire145) : ($unsigned((-wire143)) ?
                      (!{wire142, reg157}) : (8'hbe))));
              reg157 <= {wire143[(2'h2):(2'h2)]};
              reg158 <= (($signed($signed((reg155 ? reg153 : reg148))) ?
                      reg149 : (~&$signed((wire146 ? reg155 : reg149)))) ?
                  {wire142[(1'h0):(1'h0)]} : ((~&(reg156[(1'h1):(1'h1)] ?
                          $signed(reg150) : reg157)) ?
                      reg156 : (reg147 || (|(reg154 ? wire142 : reg149)))));
            end
          reg159 <= reg149[(3'h5):(3'h4)];
        end
      else
        begin
          if (reg152[(1'h0):(1'h0)])
            begin
              reg149 <= wire143;
              reg150 <= $signed(($unsigned(reg152) ?
                  $signed(reg157[(2'h3):(2'h2)]) : ({reg152[(3'h6):(3'h6)],
                          reg157} ?
                      reg157[(3'h6):(1'h1)] : wire142[(1'h1):(1'h0)])));
              reg151 <= ($signed($signed((wire145[(3'h7):(2'h2)] | (wire143 + wire142)))) ?
                  {reg150[(4'hc):(3'h7)]} : reg151);
              reg152 <= (($unsigned(wire146[(4'h8):(3'h5)]) || $signed((7'h40))) ?
                  reg154[(2'h2):(2'h2)] : $unsigned((-wire145[(2'h3):(1'h1)])));
            end
          else
            begin
              reg149 <= {(reg151[(2'h3):(2'h2)] | (((~|reg157) ^~ reg153[(2'h3):(2'h2)]) >> reg153))};
              reg150 <= (8'hb6);
              reg151 <= ($unsigned(($signed(reg159) ?
                  {$unsigned(wire146),
                      $signed((8'hb3))} : $signed($unsigned(wire142)))) ^ $signed((((reg147 + wire143) ?
                      $unsigned(wire142) : reg150) ?
                  ($unsigned(reg153) ?
                      reg156 : wire146) : wire142[(1'h1):(1'h1)])));
              reg152 <= (~|($signed($signed(reg154)) > wire146[(3'h7):(3'h5)]));
              reg153 <= reg154;
            end
          if (reg156[(2'h2):(2'h2)])
            begin
              reg154 <= ((~^$unsigned(($signed(reg155) ~^ (reg151 ?
                      reg154 : reg155)))) ?
                  $signed((((wire144 ? reg150 : reg148) > ((8'h9d) ?
                      (8'hba) : reg149)) ~^ ((reg156 < reg148) ?
                      ((8'had) ^~ reg151) : (reg150 ?
                          reg159 : reg147)))) : ($signed((&wire144)) ?
                      reg156 : {wire145, (|$unsigned(reg150))}));
              reg155 <= ((!reg157[(2'h2):(2'h2)]) >>> wire143[(1'h1):(1'h1)]);
              reg156 <= (reg157[(3'h4):(1'h1)] >>> reg156[(1'h1):(1'h1)]);
            end
          else
            begin
              reg154 <= {({$signed((~^reg154)),
                      $signed((~|(8'hb5)))} || reg158[(2'h2):(1'h0)])};
              reg155 <= ((~&$unsigned(reg152[(1'h0):(1'h0)])) <<< (-(wire142[(2'h3):(1'h0)] ?
                  (reg147 ?
                      reg148[(3'h7):(3'h5)] : wire144[(4'h8):(2'h3)]) : wire146)));
              reg156 <= $signed((wire142 ?
                  wire145[(4'h9):(2'h3)] : $unsigned(((8'h9e) && reg158[(2'h3):(2'h3)]))));
              reg157 <= (($signed(reg158[(2'h3):(1'h0)]) - $unsigned(reg152[(2'h3):(1'h0)])) | (&$unsigned(reg158[(2'h2):(2'h2)])));
              reg158 <= {({reg158[(2'h2):(1'h0)]} ?
                      (~^reg150) : $unsigned($unsigned(((8'ha3) ?
                          reg155 : wire145))))};
            end
          if ((^~({($unsigned(reg154) & reg155), $signed($unsigned(reg148))} ?
              reg148[(3'h4):(3'h4)] : (-(~&{reg156})))))
            begin
              reg159 <= reg156[(3'h4):(2'h2)];
            end
          else
            begin
              reg159 <= reg150;
              reg160 <= wire144[(4'h8):(3'h5)];
            end
          reg161 <= $signed(reg155[(2'h3):(1'h1)]);
        end
      reg162 <= ((^~$signed((+reg157))) ?
          (reg155 & {((&reg161) ? wire142[(3'h4):(3'h4)] : $unsigned(wire146)),
              (wire146 ?
                  (wire144 && reg147) : $signed(wire143))}) : (+($signed(reg148[(3'h4):(1'h0)]) ?
              (reg148[(3'h4):(3'h4)] ?
                  ((8'ha8) && (8'haa)) : (^~reg159)) : $unsigned($unsigned(reg159)))));
    end
  assign wire163 = (~^$unsigned({reg160[(2'h3):(1'h1)]}));
  assign wire164 = reg153[(1'h1):(1'h0)];
  assign wire165 = wire142;
  assign wire166 = (|((reg156[(1'h0):(1'h0)] <<< (^~(&reg147))) ?
                       wire165[(2'h2):(1'h0)] : (^((wire164 + wire143) ?
                           (reg152 != (7'h41)) : $signed((8'ha8))))));
  assign wire167 = ((($signed((reg156 >>> wire144)) ?
                       (reg149[(4'hd):(1'h0)] ?
                           (reg151 | (8'hbb)) : reg155) : reg150[(4'h8):(1'h0)]) * wire146[(4'hc):(3'h5)]) < $unsigned(($unsigned(((8'hb9) ?
                       reg147 : reg149)) >> (reg152 | reg154[(3'h5):(2'h3)]))));
  assign wire168 = ($unsigned(wire164[(2'h2):(2'h2)]) ?
                       $signed((($unsigned(reg160) <= (wire166 ?
                           reg148 : reg151)) < (reg147 ?
                           $unsigned(reg150) : ((8'h9e) ?
                               reg149 : reg154)))) : {reg159[(3'h6):(3'h6)]});
  assign wire169 = reg157;
  assign wire170 = {$unsigned((~&(-(reg153 >= reg159))))};
  assign wire171 = $unsigned((&$unsigned((!reg157[(4'h9):(2'h3)]))));
  assign wire172 = (8'hb4);
  assign wire173 = ($unsigned($unsigned($signed($unsigned(wire167)))) | wire172);
  assign wire174 = $signed(reg154[(5'h10):(4'he)]);
  assign wire175 = {{(((|wire144) ~^ (wire143 ?
                               wire163 : reg154)) ~^ $unsigned(reg152[(3'h4):(3'h4)])),
                           (-$signed($signed((8'ha1))))},
                       reg149};
  assign wire176 = ((~^$signed((!$unsigned(wire173)))) ?
                       wire171[(4'h8):(1'h1)] : wire172[(2'h3):(1'h0)]);
  assign wire177 = wire145[(2'h2):(1'h0)];
endmodule

module module92  (y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire96;
  input wire [(4'hc):(1'h0)] wire95;
  input wire signed [(4'hf):(1'h0)] wire94;
  input wire signed [(5'h11):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire113;
  wire [(3'h4):(1'h0)] wire112;
  wire [(4'h9):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire98;
  wire signed [(3'h6):(1'h0)] wire97;
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire109,
                 wire108,
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
                 wire97,
                 reg110,
                 (1'h0)};
  assign wire97 = wire94[(3'h5):(3'h5)];
  assign wire98 = ((wire94[(1'h1):(1'h0)] ?
                      wire94 : $unsigned(($unsigned(wire96) ?
                          wire94[(2'h3):(2'h2)] : (|(8'h9f))))) && (wire96[(4'hd):(3'h7)] ?
                      $unsigned((((8'hb7) ^~ (8'hb0)) ?
                          (wire95 ^~ wire94) : ((8'haa) >>> wire97))) : (~|(&(wire94 ?
                          wire94 : wire97)))));
  assign wire99 = $signed((wire98 ?
                      $signed(wire94) : $unsigned($unsigned($unsigned(wire97)))));
  assign wire100 = wire97;
  assign wire101 = (wire98 ?
                       (wire98 < ({((8'hb6) >>> wire96),
                           $unsigned(wire98)} ^~ wire97)) : $signed(((!wire94) ?
                           (-(wire98 >> wire97)) : $unsigned($unsigned(wire97)))));
  assign wire102 = $signed((wire96 ?
                       {$unsigned((wire99 >>> wire95)),
                           $unsigned(wire95[(1'h0):(1'h0)])} : ($signed(wire93[(3'h4):(1'h1)]) ?
                           $unsigned(wire95[(1'h0):(1'h0)]) : $signed({(8'hb8),
                               wire93}))));
  assign wire103 = $unsigned({($unsigned((wire101 ? wire98 : wire99)) ?
                           $unsigned($signed(wire97)) : (^$signed((7'h44))))});
  assign wire104 = {(+{$unsigned((wire94 ^ wire101))}),
                       {({$unsigned((8'ha2))} == wire94)}};
  assign wire105 = wire104[(3'h7):(3'h7)];
  assign wire106 = wire100;
  assign wire107 = ($unsigned(((((8'haa) ? wire104 : (7'h44)) ?
                           (^~wire97) : $unsigned(wire102)) != ((wire102 > wire106) != $signed((7'h43))))) ?
                       (8'ha7) : (($unsigned(((7'h40) * wire100)) ?
                               (^~{wire102,
                                   (8'hb6)}) : $unsigned((wire96 << (7'h43)))) ?
                           wire99 : (-wire95)));
  assign wire108 = (^~(8'hbd));
  assign wire109 = ($unsigned((((wire102 ^~ wire99) ^~ $unsigned(wire99)) & wire95[(4'h9):(4'h8)])) ^ {$unsigned(((~wire104) >= $unsigned(wire97))),
                       wire97[(2'h3):(1'h1)]});
  always
    @(posedge clk) begin
      reg110 <= $unsigned({wire103[(3'h7):(1'h1)]});
    end
  assign wire111 = (($signed(((wire105 ? wire103 : (8'hae)) ?
                               ((7'h42) < wire108) : $unsigned(wire97))) ?
                           $unsigned(wire106) : ((~&$unsigned(wire99)) + (wire102[(1'h1):(1'h0)] ?
                               $unsigned(wire100) : wire102))) ?
                       wire95[(4'h9):(4'h8)] : ((^wire107[(4'h9):(3'h6)]) ?
                           (((wire99 >>> wire108) ^~ $signed(wire101)) ?
                               wire105 : ((wire101 && wire94) ?
                                   $signed(wire99) : {wire108,
                                       wire106})) : {wire109[(2'h2):(1'h0)]}));
  assign wire112 = reg110;
  assign wire113 = $unsigned(((($signed(wire104) ?
                           $unsigned(wire100) : (wire93 > wire107)) <= (+wire100[(1'h1):(1'h1)])) ?
                       wire101 : wire96[(4'h9):(3'h5)]));
endmodule

module module48  (y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire53;
  input wire [(3'h6):(1'h0)] wire52;
  input wire signed [(5'h12):(1'h0)] wire51;
  input wire [(4'h9):(1'h0)] wire50;
  input wire signed [(2'h2):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire54;
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire59,
                 wire58,
                 wire57,
                 wire54,
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
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire54 = $unsigned(wire53);
  always
    @(posedge clk) begin
      reg55 <= (!$signed({$unsigned((wire49 ? wire50 : wire51))}));
      reg56 <= $unsigned((wire54[(2'h2):(1'h0)] | $signed((reg55 >> wire49[(1'h1):(1'h0)]))));
    end
  assign wire57 = (reg55 <<< wire50[(4'h8):(3'h7)]);
  assign wire58 = wire54[(5'h10):(3'h4)];
  assign wire59 = $unsigned(($signed($unsigned((^wire57))) ?
                      $unsigned($signed((wire50 < wire58))) : {$unsigned(reg56)}));
  always
    @(posedge clk) begin
      if ((^~(^wire58[(2'h2):(1'h1)])))
        begin
          reg60 <= ((^~((~^{wire59,
                  wire59}) == $signed(wire53[(2'h2):(1'h0)]))) ?
              $signed(wire52[(2'h2):(1'h1)]) : (!{$unsigned($unsigned((7'h40)))}));
          if ($unsigned($unsigned($signed(wire53[(4'h8):(1'h0)]))))
            begin
              reg61 <= $signed((~wire52[(3'h6):(2'h2)]));
              reg62 <= wire52[(1'h0):(1'h0)];
              reg63 <= $signed({$unsigned((!(wire53 ? wire59 : wire52)))});
              reg64 <= $unsigned(reg62[(3'h7):(3'h7)]);
            end
          else
            begin
              reg61 <= $signed($unsigned(wire49[(1'h1):(1'h1)]));
              reg62 <= reg56[(2'h2):(1'h1)];
              reg63 <= (wire59 * (~|($unsigned($signed((7'h42))) != $signed((reg64 <<< wire57)))));
              reg64 <= (&({(~&(~|(8'ha1))), $unsigned(wire58[(2'h2):(1'h1)])} ?
                  reg61 : $signed($unsigned((reg60 >> reg60)))));
            end
          reg65 <= ($unsigned(({reg60[(1'h0):(1'h0)]} ?
              (+wire50[(2'h2):(2'h2)]) : reg56)) < reg55);
        end
      else
        begin
          if ((~^($unsigned(reg65[(3'h6):(2'h3)]) - ((8'hb7) ?
              ((&(8'ha6)) > (reg61 ? wire59 : reg55)) : (+{reg56, reg55})))))
            begin
              reg60 <= reg65;
              reg61 <= (reg61 ?
                  ($unsigned(reg56) ?
                      ($unsigned($unsigned(reg60)) & (8'hb1)) : (^(~^reg65))) : $unsigned((!(wire50[(4'h8):(1'h0)] ?
                      (wire53 ? reg55 : wire51) : {reg65, reg61}))));
              reg62 <= $signed($signed({wire54,
                  ((+reg56) ? (~wire54) : (wire49 ? reg62 : reg65))}));
              reg63 <= $signed(($unsigned((wire57 ?
                  wire57 : (reg56 * reg60))) ^~ wire49[(1'h0):(1'h0)]));
              reg64 <= (~&{($unsigned(reg64[(3'h6):(3'h5)]) && ($unsigned(reg65) ?
                      $signed(reg55) : reg63)),
                  (~|wire59[(4'hf):(1'h1)])});
            end
          else
            begin
              reg60 <= ((~$signed({wire53})) | (($signed(reg56) <<< $unsigned($unsigned(wire59))) ?
                  reg64[(4'he):(4'h9)] : (((~^reg60) | $unsigned(wire58)) ^~ (-{reg62,
                      wire52}))));
              reg61 <= (8'hb6);
              reg62 <= ((($signed((reg56 * reg63)) ~^ reg63[(1'h1):(1'h0)]) ?
                  $signed(reg55[(1'h0):(1'h0)]) : ((&$unsigned(wire59)) ?
                      ({reg63, (8'haf)} ?
                          wire59[(4'hf):(3'h7)] : (wire54 ?
                              reg60 : (8'hb9))) : $signed((wire50 < (8'hb9))))) >> (wire58[(3'h4):(2'h2)] <<< ($signed({reg65,
                  reg64}) * $unsigned((reg63 > wire59)))));
              reg63 <= (wire57 ?
                  $unsigned((~&(^(reg62 ? reg60 : wire49)))) : reg62);
            end
          reg65 <= (+wire49[(1'h1):(1'h1)]);
          reg66 <= reg62;
        end
      reg67 <= (($signed(reg62) ?
          $unsigned(wire57[(1'h0):(1'h0)]) : $unsigned(((8'hb7) < (wire53 - wire57)))) < (reg55 || $signed(reg56[(2'h2):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg68 <= (-$signed($signed((~reg61[(1'h1):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      reg69 <= (+$signed($unsigned((8'h9f))));
      reg70 <= $unsigned((!$unsigned({reg64})));
      reg71 <= (($unsigned({$signed(reg63)}) ?
              (8'h9c) : $signed((wire59[(1'h0):(1'h0)] ^ $unsigned(wire49)))) ?
          {{(((8'haf) ? (8'hbe) : reg68) >= reg70)}} : reg67[(3'h5):(1'h1)]);
    end
  assign wire72 = reg68[(1'h0):(1'h0)];
  assign wire73 = reg60;
  assign wire74 = (reg55[(3'h7):(2'h2)] | reg60);
  assign wire75 = $signed($unsigned(wire58[(3'h4):(3'h4)]));
  assign wire76 = $signed(($unsigned((~&(|wire57))) & $unsigned(wire50)));
  assign wire77 = (($unsigned({((8'ha0) & reg56)}) ?
                      $unsigned(reg65[(3'h4):(3'h4)]) : $unsigned((|(reg68 * reg61)))) << reg64[(3'h5):(3'h4)]);
  assign wire78 = (!(wire58 ?
                      {$signed((wire57 ? wire52 : wire50)),
                          reg55[(3'h6):(1'h1)]} : ((wire77 ?
                          $unsigned(wire53) : ((8'hbf) <<< reg68)) < ((reg68 ?
                              wire50 : reg62) ?
                          wire51[(2'h2):(2'h2)] : reg67))));
  assign wire79 = $unsigned((&(!($unsigned(wire76) ? (8'hb6) : reg64))));
  assign wire80 = $signed((-reg62[(2'h2):(1'h1)]));
  assign wire81 = {(~|wire80)};
  assign wire82 = $signed((($unsigned(wire77) >> $unsigned(wire77)) ?
                      reg64 : $signed(wire79)));
  assign wire83 = reg68[(3'h4):(3'h4)];
  assign wire84 = $unsigned($signed((8'hb0)));
endmodule

module module14
#(parameter param41 = (~({{((8'h9e) ? (7'h42) : (8'hb6))}, {(~&(7'h44))}} & ((((8'hba) ? (8'ha4) : (8'ha0)) << ((8'hae) ? (8'hbe) : (8'hb3))) > (((8'hae) ? (8'hbb) : (8'hb2)) ? ((8'hbe) ^ (8'hb9)) : (&(8'hbc)))))), 
parameter param42 = (param41 <<< (param41 <<< (((param41 >= param41) ^ (param41 * param41)) * (|(param41 ~^ param41))))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire [(3'h6):(1'h0)] wire16;
  input wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 (1'h0)};
  assign wire19 = $signed($signed(wire17[(4'h9):(3'h4)]));
  assign wire20 = {($signed((^~$signed(wire16))) ?
                          ({((8'hb1) ?
                                  wire15 : (8'hbe))} | $signed($unsigned((8'hb1)))) : wire15[(4'hf):(4'hc)])};
  assign wire21 = wire17;
  assign wire22 = (~$unsigned((wire21 ?
                      $signed((wire15 <<< wire15)) : {(wire16 + wire15)})));
  assign wire23 = (wire21[(1'h0):(1'h0)] ?
                      ($signed($unsigned($signed(wire19))) <= wire16) : (((&(wire19 - wire15)) ?
                          (8'ha1) : $unsigned($signed(wire17))) & wire18));
  assign wire24 = {wire16};
  assign wire25 = (wire21 >>> {$signed($unsigned((wire16 < wire17))),
                      $signed((wire20[(3'h4):(3'h4)] ?
                          (wire18 ? wire17 : (8'hb9)) : (~&wire18)))});
  assign wire26 = $signed($signed(($signed(wire18) && wire16[(3'h4):(1'h1)])));
  assign wire27 = (wire16[(3'h4):(1'h1)] && $unsigned(wire22[(3'h7):(3'h6)]));
  assign wire28 = (^~(wire27[(2'h3):(2'h3)] > {(wire23 ?
                          $unsigned(wire20) : wire19)}));
  assign wire29 = wire23;
  assign wire30 = wire26[(2'h2):(1'h1)];
  assign wire31 = ($signed(wire21) ?
                      ((8'ha4) ?
                          $signed((8'hbf)) : {$signed((8'ha2))}) : (^((wire23[(3'h6):(2'h3)] >> {wire22,
                              wire28}) ?
                          (|(8'hb6)) : $signed(wire25))));
  assign wire32 = $unsigned(wire29[(1'h1):(1'h1)]);
  assign wire33 = (|$signed(wire15));
  assign wire34 = wire22;
  assign wire35 = ((7'h43) ?
                      $unsigned($signed($signed(wire27[(4'ha):(3'h6)]))) : ((^~((wire30 ?
                              wire17 : wire31) ^ $signed(wire28))) ?
                          ((~^wire34) ?
                              ({wire28, wire15} ?
                                  (wire29 ?
                                      wire23 : wire15) : ((8'hb9) > wire21)) : ((wire30 ?
                                      wire30 : (8'hb2)) ?
                                  $signed(wire20) : (wire31 << (8'h9e)))) : $unsigned((8'hb3))));
  assign wire36 = (~^(($signed((wire32 | wire24)) ?
                          wire26 : $unsigned(wire32[(2'h2):(1'h0)])) ?
                      (wire27[(5'h11):(4'h8)] << wire24[(1'h1):(1'h0)]) : (-$unsigned(wire24))));
  assign wire37 = $unsigned((8'h9e));
  assign wire38 = $signed($unsigned($signed($unsigned((~wire22)))));
  assign wire39 = ((wire31 < wire36[(3'h5):(3'h4)]) ?
                      $signed((^(+wire15[(4'he):(1'h0)]))) : $signed($signed((wire21 ?
                          wire24[(1'h1):(1'h1)] : wire32))));
  assign wire40 = $unsigned((+(($unsigned(wire15) ?
                      (^wire22) : wire35[(1'h0):(1'h0)]) ^ ((wire38 > wire17) ?
                      wire29 : wire36[(2'h2):(1'h0)]))));
endmodule
