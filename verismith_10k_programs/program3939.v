module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire216;
  wire signed [(4'h8):(1'h0)] wire215;
  wire signed [(5'h13):(1'h0)] wire214;
  wire [(2'h3):(1'h0)] wire213;
  wire [(5'h10):(1'h0)] wire212;
  wire [(3'h5):(1'h0)] wire210;
  wire signed [(4'hb):(1'h0)] wire209;
  wire signed [(4'he):(1'h0)] wire190;
  wire [(5'h13):(1'h0)] wire189;
  wire [(4'hc):(1'h0)] wire188;
  wire [(4'hf):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire184;
  wire signed [(4'hd):(1'h0)] wire185;
  wire signed [(5'h11):(1'h0)] wire186;
  wire signed [(5'h13):(1'h0)] wire206;
  wire [(5'h12):(1'h0)] wire207;
  reg signed [(5'h12):(1'h0)] reg205 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg204 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg202 = (1'h0);
  reg [(4'h9):(1'h0)] reg201 = (1'h0);
  reg [(4'h8):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg199 = (1'h0);
  reg [(5'h14):(1'h0)] reg198 = (1'h0);
  reg [(4'he):(1'h0)] reg197 = (1'h0);
  reg [(5'h14):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg194 = (1'h0);
  reg [(4'hd):(1'h0)] reg193 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg192 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire210,
                 wire209,
                 wire190,
                 wire189,
                 wire188,
                 wire182,
                 wire6,
                 wire5,
                 wire4,
                 wire184,
                 wire185,
                 wire186,
                 wire206,
                 wire207,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire1[(3'h5):(2'h3)];
  assign wire6 = (-wire0[(4'hb):(3'h7)]);
  module7 #() modinst183 (wire182, clk, wire5, wire6, wire2, wire0, wire1);
  assign wire184 = {{$signed((((8'hba) <<< wire182) ? {wire2, wire0} : wire4))},
                       wire182[(4'he):(4'ha)]};
  assign wire185 = wire5[(4'hf):(4'h9)];
  module7 #() modinst187 (wire186, clk, wire3, wire185, wire0, wire2, wire184);
  assign wire188 = {{$unsigned(wire6[(4'hb):(1'h1)])},
                       $signed($signed($unsigned($unsigned(wire1))))};
  assign wire189 = wire4[(3'h6):(1'h0)];
  module69 #() modinst191 (wire190, clk, wire182, wire4, wire6, wire189, wire186);
  always
    @(posedge clk) begin
      reg192 <= (($signed({(~|wire189)}) == wire4) <<< $signed(wire4[(4'h8):(3'h5)]));
      reg193 <= $unsigned((($signed(reg192[(2'h3):(1'h0)]) ?
              wire5[(4'hd):(4'ha)] : wire3) ?
          $unsigned($signed(wire182[(1'h1):(1'h0)])) : (wire185[(3'h4):(2'h2)] >= $unsigned(wire1[(2'h2):(1'h0)]))));
      if ({$signed($unsigned((&$unsigned(wire184))))})
        begin
          reg194 <= (({$signed($unsigned((7'h40)))} ?
                  wire186[(3'h4):(1'h0)] : ((~|wire184[(3'h5):(2'h2)]) ?
                      $signed($unsigned(wire190)) : ((wire186 ?
                          wire184 : (8'hb9)) | wire182))) ?
              {$signed(wire182)} : reg193);
          reg195 <= (wire2[(4'hd):(1'h0)] ?
              wire2[(5'h13):(4'hd)] : wire5[(4'hf):(2'h3)]);
          reg196 <= {$signed((~|wire3[(1'h0):(1'h0)]))};
          reg197 <= (wire185[(1'h1):(1'h0)] | ({((^wire0) ? wire182 : wire189),
              (7'h40)} && reg196[(3'h7):(2'h3)]));
          reg198 <= wire4;
        end
      else
        begin
          reg194 <= reg195;
          reg195 <= (+((((reg196 < wire5) ? {wire189, wire1} : {wire189}) ?
                  reg197[(1'h0):(1'h0)] : (wire190 != (reg192 > reg197))) ?
              reg193 : (wire189[(3'h6):(2'h2)] ?
                  ((wire188 ?
                      wire184 : reg195) <= wire6[(1'h1):(1'h0)]) : (((8'hb6) ?
                      reg195 : wire189) >>> (8'ha0)))));
          reg196 <= reg193;
          reg197 <= ($signed(((^~(wire189 ?
                  wire0 : wire184)) >>> (reg193[(4'h8):(3'h4)] && reg197[(2'h2):(2'h2)]))) ?
              ($unsigned(wire189[(3'h7):(3'h6)]) & $signed(($signed(wire184) ?
                  $unsigned(wire189) : (wire5 ?
                      reg193 : wire186)))) : (|$signed(wire182)));
          reg198 <= (wire0 ?
              ($unsigned((~(reg194 >>> wire6))) ~^ (+($unsigned((8'hba)) ?
                  (wire184 << wire2) : wire4))) : wire188);
        end
      if (({{wire189[(4'ha):(2'h3)]},
          wire2[(5'h11):(4'hf)]} == $unsigned((~^(((8'ha3) >>> wire188) != $signed(wire1))))))
        begin
          reg199 <= (^reg197[(4'hc):(4'hc)]);
          reg200 <= (&((wire190 >= ((reg198 ? wire182 : wire188) ?
              wire188 : (reg197 ? (8'ha0) : wire2))) == ((-(wire0 ?
                  (8'hbb) : (8'hb5))) ?
              ($signed(reg197) ~^ (wire6 ?
                  wire1 : wire185)) : $unsigned($signed(wire189)))));
          reg201 <= wire0[(4'hc):(2'h2)];
        end
      else
        begin
          reg199 <= (8'hb0);
          if (wire185[(1'h1):(1'h1)])
            begin
              reg200 <= (wire182 - ((^wire3) || $signed($unsigned((wire182 ?
                  wire190 : wire184)))));
              reg201 <= $signed((reg200[(4'h8):(2'h2)] ?
                  {reg198[(3'h6):(3'h6)], $signed((|wire186))} : reg195));
              reg202 <= reg196;
              reg203 <= ({(wire6[(3'h6):(1'h0)] ?
                          ($unsigned(wire184) | wire3[(4'he):(3'h4)]) : reg200)} ?
                  ((^reg192) ?
                      $signed((~(wire5 ?
                          wire188 : reg202))) : wire0) : $signed((~&wire185)));
            end
          else
            begin
              reg200 <= wire4;
              reg201 <= ({$signed($unsigned($unsigned(reg193))),
                  wire188[(2'h2):(2'h2)]} != ((^~wire185) ?
                  (!($unsigned((8'h9e)) ?
                      $signed(wire182) : $signed(wire6))) : (-wire4[(4'hc):(1'h0)])));
            end
          reg204 <= (~^reg202);
        end
    end
  always
    @(posedge clk) begin
      reg205 <= (&(wire2 == $signed(wire0[(3'h7):(2'h2)])));
    end
  assign wire206 = reg198[(1'h1):(1'h0)];
  module87 #() modinst208 (wire207, clk, reg196, reg198, reg192, wire3);
  assign wire209 = {reg205[(3'h7):(2'h2)],
                       ($signed({(reg198 >> wire186)}) ^ {(^~wire182)})};
  module7 #() modinst211 (.y(wire210), .wire10(reg205), .clk(clk), .wire12(reg195), .wire8(wire209), .wire11(reg199), .wire9(wire186));
  assign wire212 = (^$unsigned({(|{wire5, wire5})}));
  assign wire213 = (wire212 << (((~(reg201 < reg192)) ^ (+wire0[(1'h1):(1'h0)])) ?
                       (~((8'hb7) && (reg202 ^ (8'had)))) : reg194));
  assign wire214 = ({$signed(($signed(wire209) ?
                           (-(8'hb2)) : (reg202 >> wire212)))} != reg202);
  assign wire215 = (wire189 <= {(((wire4 && reg197) ?
                               (wire186 ~^ wire189) : $unsigned((8'hb7))) ?
                           wire212 : (|(|wire6))),
                       wire1});
  assign wire216 = $signed(((reg197 ?
                           (^~(reg193 ?
                               wire182 : reg192)) : wire207[(3'h4):(1'h1)]) ?
                       ($signed((reg204 ? wire213 : reg198)) ?
                           $unsigned(wire1[(2'h3):(1'h1)]) : {reg205,
                               reg197[(4'ha):(4'h9)]}) : wire184));
endmodule

module module7
#(parameter param181 = ({(+(((8'hb8) ? (8'h9d) : (8'had)) & (|(8'hb5))))} ^~ (((|(8'hb5)) ? ({(8'had)} <= {(8'ha9), (8'haa)}) : {(8'ha7)}) < ((((8'ha7) <<< (8'hbc)) ? ((8'ha5) ? (8'haa) : (8'hbe)) : (~(8'hb0))) ? (8'ha9) : (((8'ha0) ? (8'hb3) : (7'h43)) >> {(8'hae)})))))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire126;
  wire signed [(4'h8):(1'h0)] wire179;
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  assign y = {wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire27,
                 wire28,
                 wire57,
                 wire59,
                 wire60,
                 wire61,
                 wire67,
                 wire68,
                 wire81,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire126,
                 wire179,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire13 = $unsigned($unsigned((~&((wire10 != (8'ha7)) ?
                      $unsigned(wire10) : $signed(wire9)))));
  assign wire14 = $signed({{($signed(wire10) ^~ (wire13 ? wire11 : wire12)),
                          (-$signed(wire11))},
                      {wire12[(2'h3):(2'h2)]}});
  assign wire15 = {(+(~wire10))};
  assign wire16 = $signed((wire8 ?
                      $unsigned(wire10) : $unsigned((((8'hb5) + wire14) ?
                          wire15[(2'h3):(1'h1)] : wire9))));
  assign wire17 = wire11;
  always
    @(posedge clk) begin
      reg18 <= wire10;
      reg19 <= $unsigned(wire16);
      if ((((({wire10, (8'hb6)} ^ ((8'hbd) ? wire15 : reg19)) ?
              $signed($signed(wire11)) : {{wire17}, $signed(wire13)}) ?
          ($signed(wire10[(1'h0):(1'h0)]) ~^ $signed((wire13 * (8'haf)))) : ({wire16[(3'h5):(1'h0)]} ?
              {(wire11 ?
                      (8'ha9) : reg19)} : $signed(wire17))) * (~|wire16[(3'h4):(2'h2)])))
        begin
          reg20 <= wire16[(3'h5):(1'h1)];
          if (reg19[(3'h5):(3'h4)])
            begin
              reg21 <= (~(!$unsigned($signed(reg20[(2'h2):(1'h0)]))));
              reg22 <= $unsigned($unsigned(wire16));
              reg23 <= wire17[(5'h15):(4'hc)];
              reg24 <= (wire8 * (((reg19 << $signed(wire13)) ?
                      ((reg19 ? (8'hb8) : reg19) == {(8'hbc)}) : (|wire9)) ?
                  $unsigned(reg21) : wire10));
            end
          else
            begin
              reg21 <= $unsigned($signed((wire8[(3'h4):(2'h3)] ?
                  (((8'haf) + (8'hb5)) ?
                      ((8'hbd) ?
                          reg22 : reg24) : $unsigned(wire15)) : $signed((reg19 ?
                      reg24 : (8'ha4))))));
            end
        end
      else
        begin
          reg20 <= wire13[(2'h3):(1'h1)];
          reg21 <= $signed((+({$unsigned(reg22)} != $unsigned($unsigned(wire12)))));
          reg22 <= ($signed(({$signed(wire15)} ?
              reg23[(3'h4):(1'h0)] : (~wire13))) == {$unsigned($unsigned(((8'h9f) ?
                  reg18 : wire13)))});
          reg23 <= reg23;
          if (reg19)
            begin
              reg24 <= (!$signed($signed(((^reg18) ?
                  wire12 : reg23[(3'h7):(3'h5)]))));
              reg25 <= ($signed(reg23) * $unsigned(reg22));
            end
          else
            begin
              reg24 <= ((reg21 > $signed((reg18[(4'he):(3'h6)] ?
                      (wire15 != wire15) : (wire13 == (8'hb6))))) ?
                  ($unsigned($unsigned(reg18[(4'hf):(4'ha)])) <<< reg23[(3'h6):(1'h1)]) : {$signed($signed((|wire17))),
                      reg20[(2'h3):(1'h0)]});
              reg25 <= ((-reg23) < (!($unsigned((~|wire13)) ?
                  ((8'hae) ?
                      {reg22,
                          wire14} : reg24[(4'h8):(3'h4)]) : $signed((wire9 + wire16)))));
              reg26 <= $signed(reg23);
            end
        end
    end
  assign wire27 = (8'ha0);
  assign wire28 = (reg24 ?
                      $unsigned(((8'hb0) * wire14[(3'h5):(2'h3)])) : reg19[(1'h0):(1'h0)]);
  module29 #() modinst58 (wire57, clk, wire15, reg25, reg20, reg21, wire16);
  assign wire59 = (wire16[(3'h5):(3'h4)] >= wire17);
  assign wire60 = reg25;
  assign wire61 = (^~($unsigned(reg25) ~^ (~wire28)));
  always
    @(posedge clk) begin
      reg62 <= $unsigned(((((|wire27) <= $unsigned(wire28)) < ((wire59 ^~ reg24) >> $unsigned(wire27))) ?
          {(reg24 > reg21[(2'h3):(1'h1)])} : ($signed($signed(reg25)) - wire8[(3'h4):(3'h4)])));
      reg63 <= (-$unsigned((wire13 ^ (|((8'h9f) ? reg20 : (8'hae))))));
      reg64 <= $unsigned((wire27 ?
          $unsigned($unsigned((|reg21))) : $signed($signed({reg63, reg23}))));
      reg65 <= $signed(wire16[(3'h6):(1'h0)]);
      reg66 <= $unsigned($signed((wire59[(4'h8):(2'h3)] ?
          (-$unsigned((8'ha0))) : ((wire12 ?
              wire16 : wire17) != $signed(wire10)))));
    end
  assign wire67 = (7'h41);
  assign wire68 = reg23;
  module69 #() modinst82 (.y(wire81), .wire72(wire10), .clk(clk), .wire71(wire12), .wire74(wire17), .wire70(reg26), .wire73(wire27));
  assign wire83 = (((-$signed(reg25[(2'h3):(1'h1)])) ?
                      {{wire16[(2'h3):(2'h3)],
                              (^reg64)}} : wire28[(3'h4):(2'h3)]) <<< (((|(wire15 & reg18)) ?
                      $signed($signed(reg62)) : (((8'hb3) == reg26) <<< (~&wire10))) >= ((|$unsigned(reg66)) && reg26)));
  assign wire84 = $signed($signed(wire10[(3'h7):(2'h2)]));
  assign wire85 = $signed(((|((wire61 + (8'had)) * $signed(wire57))) ?
                      ((wire9[(2'h2):(2'h2)] ? (!wire8) : $unsigned(wire28)) ?
                          wire14 : ($unsigned(reg25) + reg24[(5'h10):(2'h3)])) : (reg25[(3'h7):(2'h3)] <<< $unsigned({wire8}))));
  assign wire86 = (wire13[(4'h9):(1'h0)] ? (~^wire85) : (^reg18));
  module87 #() modinst127 (.y(wire126), .wire91(wire11), .wire90(reg22), .clk(clk), .wire88(wire28), .wire89(reg62));
  module128 #() modinst180 (.clk(clk), .wire131(reg20), .wire132(wire28), .wire130(wire84), .y(wire179), .wire129(wire13));
endmodule

module module128
#(parameter param177 = (~|(~(!{((8'ha8) ? (8'ha8) : (8'ha3)), ((8'hb1) < (8'hbe))}))), 
parameter param178 = {((((param177 <= (8'ha2)) | (~|param177)) << (^~(-param177))) ? (~param177) : (~&(~|(~&param177)))), ((({(8'hb3), param177} << (~^param177)) >= (param177 * param177)) >= (-param177))})
(y, clk, wire132, wire131, wire130, wire129);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire132;
  input wire signed [(4'h9):(1'h0)] wire131;
  input wire signed [(3'h6):(1'h0)] wire130;
  input wire signed [(2'h2):(1'h0)] wire129;
  wire [(2'h3):(1'h0)] wire176;
  wire [(4'hc):(1'h0)] wire175;
  wire signed [(4'h8):(1'h0)] wire174;
  wire [(3'h5):(1'h0)] wire173;
  wire [(2'h2):(1'h0)] wire172;
  wire signed [(5'h13):(1'h0)] wire171;
  wire signed [(4'hf):(1'h0)] wire170;
  wire [(2'h3):(1'h0)] wire169;
  wire signed [(4'h9):(1'h0)] wire168;
  wire [(4'h9):(1'h0)] wire167;
  wire [(4'hb):(1'h0)] wire166;
  wire signed [(4'hf):(1'h0)] wire142;
  wire signed [(2'h3):(1'h0)] wire133;
  reg [(4'hb):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg163 = (1'h0);
  reg [(3'h7):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg158 = (1'h0);
  reg [(4'h8):(1'h0)] reg157 = (1'h0);
  reg [(3'h6):(1'h0)] reg156 = (1'h0);
  reg [(5'h13):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(2'h3):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(4'h9):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg139 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg138 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg134 = (1'h0);
  assign y = {wire176,
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
                 wire142,
                 wire133,
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
                 reg143,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  assign wire133 = $unsigned(wire129[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg134 <= $signed($unsigned(({(wire130 ~^ (7'h40)), (~|wire131)} ?
          (^$unsigned(wire131)) : ((wire130 || wire130) ?
              (wire131 ? wire133 : wire130) : (wire132 ? wire129 : wire131)))));
      if (($signed(reg134[(2'h3):(1'h1)]) ?
          (|$unsigned(((wire133 ? wire133 : (8'hb9)) > (wire130 ?
              wire130 : wire133)))) : wire132))
        begin
          if (wire130)
            begin
              reg135 <= wire130;
            end
          else
            begin
              reg135 <= ((^~reg135[(3'h4):(2'h3)]) ?
                  {wire131, wire130} : ($signed((~^wire129)) * reg134));
              reg136 <= ((reg135[(1'h1):(1'h1)] < ((&(wire130 ?
                      wire130 : (8'hb4))) > wire133[(1'h1):(1'h0)])) ?
                  ($signed((((8'h9f) ?
                          wire133 : wire130) == $unsigned(wire130))) ?
                      $signed({$unsigned(wire131),
                          $unsigned((8'hba))}) : {(reg135[(2'h3):(2'h3)] ?
                              (wire132 ?
                                  wire133 : wire130) : $signed(wire130))}) : ((~&(~$signed(wire131))) >> {$unsigned(wire131),
                      wire133}));
              reg137 <= $unsigned(reg136);
              reg138 <= (reg134[(1'h0):(1'h0)] ?
                  (&($unsigned({wire133}) >> $signed(((8'ha5) + wire129)))) : reg137[(3'h5):(2'h3)]);
              reg139 <= ({($unsigned(((8'hbf) ?
                      wire130 : (8'hba))) <<< (|wire132))} == (8'haf));
            end
        end
      else
        begin
          reg135 <= (((reg138 > ((reg137 ?
                  (8'hb6) : reg136) != $signed(wire129))) ?
              (($unsigned((8'hb5)) >> reg134) ?
                  {$signed(reg137),
                      $unsigned(wire129)} : wire129[(1'h1):(1'h1)]) : $signed(({wire133,
                      (8'ha4)} ?
                  ((8'h9e) ? wire131 : reg134) : ((8'hb2) ?
                      reg137 : wire130)))) ^~ reg134[(2'h2):(1'h1)]);
          reg136 <= ($signed(reg139) ?
              {(reg138[(3'h6):(2'h3)] << ({wire129} ?
                      (^wire131) : wire131))} : wire130[(1'h0):(1'h0)]);
          reg137 <= reg136;
        end
      reg140 <= ((wire130 >> $signed(reg135[(3'h5):(2'h2)])) ?
          (8'hb5) : (~^$signed($signed($signed(wire133)))));
      reg141 <= wire132[(2'h3):(2'h3)];
    end
  assign wire142 = wire129;
  always
    @(posedge clk) begin
      if ((($unsigned($unsigned((&reg139))) ?
              (wire133 ?
                  (~(reg136 ? reg139 : reg135)) : $unsigned((reg141 ?
                      wire132 : wire132))) : $signed(wire142[(4'ha):(3'h5)])) ?
          $unsigned(({(8'hb8), (reg141 == wire132)} ?
              (reg139 ?
                  reg141 : reg134) : ($unsigned(wire131) ^ wire130))) : ((7'h42) ^ reg138[(4'ha):(4'ha)])))
        begin
          reg143 <= (wire133 ?
              ($signed(reg138) ?
                  reg138 : {$signed(wire129[(2'h2):(2'h2)]),
                      reg135[(3'h5):(1'h0)]}) : ((reg134 ?
                  wire133 : {$unsigned(reg138)}) <<< reg139[(3'h5):(1'h0)]));
        end
      else
        begin
          if ((8'hbd))
            begin
              reg143 <= ((wire142[(4'hc):(1'h1)] ~^ $signed($signed($signed(reg141)))) ?
                  ($unsigned(wire129) << ($signed((wire142 & wire130)) ?
                      ($unsigned(wire132) ?
                          $unsigned((8'hbb)) : $unsigned(reg134)) : {(reg139 ~^ wire132),
                          (&(8'haf))})) : ($unsigned(wire130[(3'h6):(2'h3)]) ?
                      reg140[(3'h5):(1'h0)] : $signed(({wire142} + (reg135 ?
                          reg143 : wire130)))));
              reg144 <= reg143;
              reg145 <= (~^{wire133[(1'h1):(1'h1)], wire132[(4'h8):(3'h6)]});
              reg146 <= (8'hae);
              reg147 <= reg139[(1'h0):(1'h0)];
            end
          else
            begin
              reg143 <= $signed(((^~reg141) | ($signed((~^reg135)) ?
                  {reg144[(3'h4):(2'h3)],
                      (reg134 ? reg138 : reg134)} : reg137[(3'h6):(3'h4)])));
              reg144 <= (~reg134[(1'h0):(1'h0)]);
            end
          reg148 <= reg136[(1'h0):(1'h0)];
          if (wire132)
            begin
              reg149 <= {$unsigned(($signed({wire132,
                      (8'hb4)}) <<< $unsigned((wire130 * reg137))))};
              reg150 <= ((~|$signed((~(7'h42)))) ?
                  $unsigned({reg139[(1'h1):(1'h1)],
                      (^~wire142[(1'h1):(1'h0)])}) : wire133[(2'h3):(2'h2)]);
              reg151 <= $unsigned({reg150});
              reg152 <= reg139[(3'h5):(1'h0)];
              reg153 <= reg138;
            end
          else
            begin
              reg149 <= reg149;
            end
        end
      reg154 <= reg146[(3'h5):(2'h3)];
      reg155 <= ($signed($signed(wire131)) >>> ((7'h42) ?
          $signed((reg152[(4'h8):(3'h5)] * $signed(reg151))) : (^~((reg141 << (8'ha8)) ?
              reg151 : (reg140 ~^ reg141)))));
      if ($unsigned($signed({$signed((reg145 ~^ (8'hba))),
          $unsigned(wire129)})))
        begin
          reg156 <= ((reg144 << (&$signed(((8'hbb) ?
              reg150 : wire142)))) > (&$unsigned((reg135 + (wire131 != reg151)))));
          if ({$signed((reg144[(4'ha):(4'ha)] | ({reg137,
                  (8'hb3)} >> $signed(reg152)))),
              reg137})
            begin
              reg157 <= (!$signed((~^reg138)));
              reg158 <= reg139[(3'h5):(1'h1)];
            end
          else
            begin
              reg157 <= reg148[(4'hd):(4'h8)];
              reg158 <= (wire133[(2'h2):(1'h1)] ?
                  $unsigned($signed((wire142 == (reg153 <<< reg138)))) : $signed(reg158));
              reg159 <= (7'h43);
            end
          reg160 <= {($unsigned(wire133[(1'h1):(1'h0)]) ?
                  (reg155 <= reg138[(2'h2):(2'h2)]) : (~^$signed(reg138[(2'h2):(1'h1)]))),
              reg145};
        end
      else
        begin
          if ((^~reg147[(2'h2):(1'h1)]))
            begin
              reg156 <= (8'haa);
              reg157 <= (8'hb0);
              reg158 <= $unsigned($signed(reg145[(3'h6):(3'h6)]));
              reg159 <= (((((reg141 + (8'h9f)) ? $signed((8'hbe)) : (+reg152)) ?
                          reg140[(4'hc):(1'h0)] : (~^$unsigned((8'h9d)))) ?
                      $signed($unsigned(wire142[(1'h0):(1'h0)])) : $unsigned(reg150[(3'h6):(1'h0)])) ?
                  (8'ha8) : $signed($signed(($signed(reg139) ?
                      (8'ha8) : $signed((8'h9d))))));
            end
          else
            begin
              reg156 <= {(~|reg146)};
              reg157 <= reg146;
              reg158 <= reg158[(2'h2):(1'h1)];
              reg159 <= $signed(((($signed(reg160) ?
                      (8'ha5) : $unsigned(wire131)) ?
                  (~wire132[(5'h11):(3'h4)]) : wire130[(3'h5):(2'h2)]) | {(^~(~|reg145)),
                  (reg154[(1'h0):(1'h0)] - reg137)}));
            end
          reg160 <= reg143[(4'hb):(4'ha)];
          if ((^~{$signed((~reg139))}))
            begin
              reg161 <= reg143[(1'h0):(1'h0)];
              reg162 <= ($signed((($unsigned(wire131) ?
                      {reg144} : $unsigned(reg138)) * wire133[(1'h0):(1'h0)])) ?
                  reg157 : ((^(!$unsigned(reg141))) ?
                      wire129[(2'h2):(1'h1)] : $unsigned((reg156 > reg138))));
              reg163 <= (reg159 ~^ ((($signed(reg136) >>> $unsigned((7'h42))) ?
                      (~(reg140 << reg159)) : wire129) ?
                  wire129[(1'h1):(1'h0)] : (reg149[(3'h4):(1'h0)] ?
                      (^~(+reg149)) : reg160)));
            end
          else
            begin
              reg161 <= {((({reg150} + $unsigned((7'h40))) ?
                          {reg144[(3'h4):(2'h2)]} : ((reg149 ?
                                  (7'h42) : reg138) ?
                              {reg150} : ((8'ha7) ? reg156 : (8'hb7)))) ?
                      reg159 : ($unsigned(reg143) > $unsigned(reg157[(3'h7):(1'h1)])))};
              reg162 <= reg152;
              reg163 <= $unsigned((8'hb1));
              reg164 <= (|reg153[(2'h2):(2'h2)]);
              reg165 <= $signed((((-(reg152 < (8'hb4))) > $unsigned({wire132,
                  reg140})) && ((reg151[(3'h7):(3'h7)] <<< wire131[(3'h7):(3'h7)]) - ((reg147 ?
                  reg146 : reg155) - $signed(reg164)))));
            end
        end
    end
  assign wire166 = $unsigned($unsigned($unsigned(($unsigned(reg136) >>> wire132[(1'h1):(1'h0)]))));
  assign wire167 = reg140;
  assign wire168 = reg155[(3'h7):(3'h5)];
  assign wire169 = (8'ha6);
  assign wire170 = reg135;
  assign wire171 = reg137[(4'h8):(1'h0)];
  assign wire172 = ((8'hac) ?
                       (reg149 > reg164[(3'h5):(1'h0)]) : (~($signed(((8'h9f) << wire129)) == reg157)));
  assign wire173 = $unsigned(reg139);
  assign wire174 = $unsigned((!reg154[(3'h5):(2'h3)]));
  assign wire175 = $unsigned((~$signed((!{wire173}))));
  assign wire176 = ((&$unsigned(((reg153 ?
                       wire169 : reg138) ^ wire167[(3'h7):(3'h6)]))) == (reg141[(2'h3):(1'h1)] & wire171));
endmodule

module module87
#(parameter param125 = (+(((~&((7'h43) ? (8'ha8) : (8'hb4))) << {(&(7'h41)), ((8'ha7) ? (8'h9f) : (8'h9f))}) ? (8'hbc) : {(((8'haf) ? (8'hb2) : (8'hb7)) & (8'hb6))})))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire91;
  input wire signed [(5'h14):(1'h0)] wire90;
  input wire signed [(2'h3):(1'h0)] wire89;
  input wire signed [(3'h7):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire122;
  wire signed [(5'h12):(1'h0)] wire121;
  wire signed [(2'h2):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire92;
  reg [(5'h15):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire98,
                 wire97,
                 wire96,
                 wire92,
                 reg120,
                 reg119,
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
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire92 = {(+$unsigned(wire90)),
                      (((^~wire91) >>> (wire91[(5'h11):(2'h2)] ?
                          wire88 : (wire91 ? (8'ha6) : wire89))) > ({(wire89 ?
                                  (8'hac) : (8'ha9))} ?
                          wire91[(4'he):(2'h2)] : (~&wire88)))};
  always
    @(posedge clk) begin
      reg93 <= (8'ha4);
      reg94 <= ($signed($unsigned((wire92[(2'h2):(1'h1)] ?
          {wire91,
              reg93} : $signed(wire88)))) >= (wire90 + $signed(wire92[(2'h2):(2'h2)])));
      reg95 <= (8'hb0);
    end
  assign wire96 = wire90[(1'h0):(1'h0)];
  assign wire97 = wire88;
  assign wire98 = reg95[(3'h7):(3'h4)];
  always
    @(posedge clk) begin
      reg99 <= (-reg94[(2'h3):(2'h2)]);
      reg100 <= (-(!((8'hb5) ?
          $unsigned($signed(wire88)) : (|((8'ha0) < wire92)))));
    end
  always
    @(posedge clk) begin
      reg101 <= {((((^reg95) >>> (~^wire96)) ?
              wire88[(1'h1):(1'h0)] : (wire97[(1'h0):(1'h0)] | {(8'hac)})) ^ wire90[(1'h1):(1'h1)]),
          (wire98[(1'h0):(1'h0)] ?
              (wire88 ?
                  reg99 : (^reg93[(4'h9):(3'h6)])) : (((wire98 << wire92) ?
                      (~^wire88) : $signed(wire88)) ?
                  (wire98 >= $unsigned(wire88)) : reg100))};
      if ((-$signed((($unsigned((8'hb4)) - $unsigned(wire92)) ?
          ((+wire98) <= (~|wire91)) : ((wire98 << wire96) > reg94)))))
        begin
          if (($unsigned(wire90) ?
              $unsigned((|wire89)) : wire90[(5'h11):(4'h8)]))
            begin
              reg102 <= $signed({$unsigned({$unsigned(reg101),
                      ((8'hb7) >>> reg99)})});
            end
          else
            begin
              reg102 <= (&reg95[(3'h7):(3'h7)]);
              reg103 <= (reg102[(2'h3):(2'h3)] - ({$unsigned(reg101)} ?
                  wire88 : ((8'ha8) ?
                      (reg100[(1'h1):(1'h0)] ^~ wire92) : wire90[(5'h10):(2'h3)])));
              reg104 <= $signed($unsigned((($unsigned(reg93) ?
                      wire90 : {wire90, (8'hba)}) ?
                  reg101[(5'h12):(5'h12)] : (~|(8'hb1)))));
              reg105 <= reg101;
            end
        end
      else
        begin
          if ((reg102 ?
              $signed($signed($unsigned($signed(wire90)))) : (wire97[(5'h10):(4'h9)] ?
                  wire96[(5'h11):(5'h11)] : reg104[(4'h8):(1'h1)])))
            begin
              reg102 <= $unsigned({reg95[(1'h1):(1'h1)],
                  (+$unsigned($unsigned(wire96)))});
              reg103 <= {(((wire97 == $signed(reg105)) <= reg94[(4'h8):(3'h5)]) >= $signed((reg93 > (wire88 && (8'hae))))),
                  $signed(wire92[(2'h2):(2'h2)])};
              reg104 <= ((reg99 ?
                  reg102[(4'hf):(4'h8)] : (~|$signed(reg103[(4'h8):(1'h0)]))) ~^ (|$signed((wire97[(5'h11):(4'hc)] ?
                  $signed(wire90) : (wire91 + (8'ha5))))));
              reg105 <= wire89;
            end
          else
            begin
              reg102 <= $signed(wire88[(1'h1):(1'h1)]);
              reg103 <= ((8'ha0) ?
                  $unsigned((^((^(8'haf)) <<< $unsigned(reg95)))) : ($signed(reg105[(4'he):(3'h6)]) ?
                      $unsigned({(wire92 ? (8'h9c) : reg99),
                          reg95}) : (reg95[(4'h8):(3'h4)] ^ (&(wire90 >= wire91)))));
            end
          if ((^wire92[(1'h1):(1'h1)]))
            begin
              reg106 <= $unsigned({$unsigned(wire96)});
              reg107 <= (reg104[(4'h9):(3'h7)] - {reg104});
              reg108 <= wire90[(4'h9):(3'h4)];
              reg109 <= (~&($unsigned(reg104) < $signed(reg107[(2'h3):(1'h1)])));
            end
          else
            begin
              reg106 <= wire91[(3'h5):(2'h2)];
            end
          reg110 <= reg93[(4'ha):(3'h5)];
          reg111 <= $signed(((8'hbe) ?
              $unsigned(($signed(wire96) || $unsigned(reg108))) : wire98[(1'h1):(1'h0)]));
          if ({((~^((^wire96) && $signed(reg101))) ?
                  wire88[(3'h4):(1'h1)] : reg100)})
            begin
              reg112 <= ((($signed({wire92}) ?
                      $unsigned($signed(reg105)) : (wire91[(4'h8):(2'h3)] + (|wire98))) << ({(^~wire96)} - {(reg100 ?
                          reg110 : (7'h42)),
                      ((8'hb8) ^~ (8'hb7))})) ?
                  {$signed(reg107)} : reg93);
            end
          else
            begin
              reg112 <= (($unsigned(($signed(reg95) | (reg94 && reg93))) ?
                      (~reg112[(2'h3):(1'h1)]) : ($signed((reg95 > reg102)) || {reg94[(4'hf):(4'ha)],
                          wire98})) ?
                  {{(|(reg94 ^ reg109)),
                          reg107[(3'h6):(2'h3)]}} : ((reg100[(3'h5):(1'h0)] ^~ reg106[(1'h0):(1'h0)]) <= $unsigned((8'hae))));
              reg113 <= {((|$unsigned(reg111[(2'h3):(2'h3)])) <<< $unsigned((reg110[(2'h2):(2'h2)] * reg100[(3'h6):(1'h1)]))),
                  ($signed((~reg95)) != $unsigned($signed((^reg93))))};
              reg114 <= ({(wire98 ?
                          reg105[(3'h4):(1'h0)] : ((reg113 ?
                              (8'hbb) : (8'ha7)) || $signed(reg104))),
                      (~|(^~$signed(reg93)))} ?
                  {$unsigned(wire88)} : reg100);
              reg115 <= $unsigned($signed(reg109));
              reg116 <= $unsigned(($signed({$signed(reg106), (~reg103)}) ?
                  $signed((reg108[(2'h3):(2'h2)] >= reg104)) : $unsigned(((8'had) ?
                      $unsigned(reg93) : (reg94 && wire90)))));
            end
        end
      reg117 <= $unsigned(({$unsigned(reg101)} ?
          $signed($signed(reg107)) : (!{{(8'had), reg105}})));
    end
  always
    @(posedge clk) begin
      reg118 <= reg115;
      if (reg111[(2'h3):(1'h0)])
        begin
          reg119 <= reg117[(4'ha):(3'h5)];
        end
      else
        begin
          reg119 <= (wire97 ?
              ((|$unsigned((wire90 ?
                  reg100 : wire88))) > $unsigned((reg113 && reg114[(5'h11):(4'hf)]))) : reg102);
        end
      reg120 <= (~|reg118[(3'h6):(2'h3)]);
    end
  assign wire121 = (+reg94);
  assign wire122 = (((!$unsigned(wire91[(3'h5):(1'h1)])) != (|$signed((reg106 ^~ (8'ha6))))) ?
                       $signed(wire97[(3'h6):(3'h5)]) : $signed((reg104[(1'h0):(1'h0)] ?
                           $unsigned(reg99) : {reg104[(3'h6):(3'h4)]})));
  assign wire123 = $signed(reg116[(3'h5):(1'h0)]);
  assign wire124 = $signed($unsigned((($signed((8'hb0)) | $signed(wire92)) && ($unsigned(reg102) ?
                       $unsigned((8'hae)) : {reg117, wire88}))));
endmodule

module module69
#(parameter param80 = {{(((~|(8'hb5)) <= {(8'hba), (8'hb5)}) ? (~&((8'ha0) ? (8'hb9) : (8'hab))) : {((8'ha6) ? (8'hb0) : (8'h9c)), ((8'hbe) ? (8'haf) : (8'ha1))})}})
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire74;
  input wire [(5'h10):(1'h0)] wire73;
  input wire signed [(4'he):(1'h0)] wire72;
  input wire signed [(4'h9):(1'h0)] wire71;
  input wire [(5'h11):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire75;
  assign y = {wire79, wire78, wire77, wire76, wire75, (1'h0)};
  assign wire75 = ({((wire72[(3'h4):(2'h2)] ~^ {wire72}) <<< ($signed(wire71) || (~|(8'haa)))),
                          wire74[(2'h2):(2'h2)]} ?
                      (($unsigned(wire71[(3'h5):(3'h5)]) * $unsigned((~wire70))) ^~ (~&((wire72 <= (8'ha9)) ?
                          (wire73 == wire74) : {wire73,
                              wire73}))) : (^$signed($unsigned($unsigned(wire72)))));
  assign wire76 = (|($signed($signed(((8'hb2) ^ wire71))) ^ $unsigned((+(wire71 * wire75)))));
  assign wire77 = (wire72 ?
                      ($signed({(wire76 ? wire76 : (8'hb6)),
                          ((8'ha6) && (8'had))}) ~^ (+((8'haf) != ((8'ha3) - wire75)))) : $signed((($signed((8'hba)) >= $signed(wire76)) || {wire76[(2'h2):(2'h2)],
                          ((8'h9f) << (8'h9f))})));
  assign wire78 = ($unsigned(wire77) ?
                      wire74 : ((wire76[(4'hd):(4'ha)] - wire72[(4'h8):(3'h7)]) ?
                          {(~|(wire76 ?
                                  (7'h42) : (8'hb4)))} : {wire76[(4'hd):(1'h1)]}));
  assign wire79 = $unsigned($signed((^~wire71)));
endmodule

module module29
#(parameter param55 = ((((&(!(7'h41))) ? (((7'h43) ^~ (8'hb6)) > ((8'ha0) + (8'hae))) : {(~^(8'ha0))}) ? ({{(8'hb3)}} ~^ {((8'hb3) ? (7'h43) : (7'h41))}) : (+{{(8'ha6)}, (^~(8'haa))})) ? (((^(&(8'hbd))) < {{(8'ha9), (8'hb5)}, ((8'hac) ? (8'ha6) : (8'ha5))}) ? ((^~((8'h9e) | (8'hb4))) == (((8'h9f) ? (8'hbe) : (8'hb1)) - ((8'hb6) ? (8'hbc) : (8'h9e)))) : {(|(~&(8'haf))), (8'h9f)}) : (({((8'h9d) & (8'hba)), (!(7'h41))} ? ({(8'hbd)} > (8'hbb)) : (8'hb8)) >= {((~&(8'had)) <<< ((8'h9f) ~^ (7'h44)))})), 
parameter param56 = ((8'hbc) >= ({param55} - param55)))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire34;
  input wire [(4'h8):(1'h0)] wire33;
  input wire signed [(4'ha):(1'h0)] wire32;
  input wire signed [(3'h6):(1'h0)] wire31;
  input wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire35;
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire40,
                 wire39,
                 wire35,
                 reg43,
                 reg42,
                 reg41,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire35 = {(~$signed(wire30)), wire32};
  always
    @(posedge clk) begin
      reg36 <= {{(!(|(8'haf)))}, wire31[(2'h3):(1'h0)]};
    end
  always
    @(posedge clk) begin
      reg37 <= {wire35, wire30[(4'hd):(1'h1)]};
      reg38 <= ($signed((((^~reg37) ? wire31 : (wire30 ? (8'h9d) : reg36)) ?
          (&$signed(wire35)) : $unsigned($signed(wire33)))) > reg37[(1'h1):(1'h1)]);
    end
  assign wire39 = $unsigned(wire32);
  assign wire40 = (&$unsigned(($unsigned($unsigned(wire32)) >> $unsigned(wire30))));
  always
    @(posedge clk) begin
      if (({wire34[(3'h4):(1'h0)], {{{wire31}}}} ?
          $signed((~&(^~$signed(reg36)))) : $signed($signed(wire39))))
        begin
          reg41 <= wire31[(2'h3):(2'h3)];
        end
      else
        begin
          reg41 <= (wire30 ?
              (wire32[(1'h1):(1'h1)] ?
                  $unsigned(((wire40 ? (8'hab) : reg36) ?
                      reg38[(3'h5):(1'h1)] : $unsigned((8'h9c)))) : {wire35[(3'h4):(1'h1)]}) : (8'h9d));
        end
      reg42 <= $unsigned(wire39);
      reg43 <= wire33[(1'h0):(1'h0)];
    end
  assign wire44 = (|reg43);
  assign wire45 = reg42;
  assign wire46 = $unsigned(((8'ha3) ? reg43 : (-$signed(wire40))));
  assign wire47 = wire46[(2'h2):(2'h2)];
  assign wire48 = wire46;
  assign wire49 = $unsigned(wire30);
  assign wire50 = ({{((wire49 * wire32) ^ $unsigned(wire32)),
                          $unsigned(reg38[(1'h1):(1'h0)])},
                      reg41} * reg42[(2'h3):(2'h3)]);
  assign wire51 = reg43;
  assign wire52 = {((^((+reg41) ? $unsigned(wire30) : (&reg37))) ?
                          (8'hbd) : $unsigned(($signed(wire32) | (reg41 << wire48))))};
  assign wire53 = $signed(wire44);
  assign wire54 = reg37;
endmodule
