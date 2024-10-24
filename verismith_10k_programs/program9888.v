module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire209;
  wire [(5'h11):(1'h0)] wire208;
  wire signed [(4'h9):(1'h0)] wire207;
  wire [(3'h7):(1'h0)] wire196;
  wire [(5'h11):(1'h0)] wire195;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire193;
  wire signed [(3'h4):(1'h0)] wire198;
  wire signed [(2'h2):(1'h0)] wire199;
  reg signed [(5'h12):(1'h0)] reg206 = (1'h0);
  reg [(3'h6):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg204 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg203 = (1'h0);
  reg [(4'h8):(1'h0)] reg202 = (1'h0);
  reg [(4'h9):(1'h0)] reg201 = (1'h0);
  assign y = {wire209,
                 wire208,
                 wire207,
                 wire196,
                 wire195,
                 wire5,
                 wire6,
                 wire193,
                 wire198,
                 wire199,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = (&{(~&wire1[(1'h0):(1'h0)])});
  module7 #() modinst194 (wire193, clk, wire1, wire5, wire2, wire4, wire3);
  assign wire195 = $signed((~&(wire6[(4'h8):(3'h4)] ?
                       wire5[(2'h3):(1'h0)] : wire6[(4'ha):(3'h6)])));
  module7 #() modinst197 (wire196, clk, wire2, wire3, wire5, wire195, wire4);
  assign wire198 = ($signed(wire5[(3'h7):(3'h6)]) << (wire2 > $signed(($unsigned(wire6) != wire196[(3'h5):(3'h5)]))));
  module135 #() modinst200 (wire199, clk, wire3, wire2, wire0, wire1, wire198);
  always
    @(posedge clk) begin
      reg201 <= ((wire6[(3'h5):(1'h0)] ?
              (-wire193) : (wire2 ?
                  wire2[(3'h5):(2'h3)] : (wire1 ?
                      (wire6 >> wire193) : (wire2 >> wire3)))) ?
          $unsigned(wire193[(4'he):(4'h9)]) : $unsigned((wire5 || wire6)));
      if ((8'ha8))
        begin
          reg202 <= wire199;
          reg203 <= {$unsigned($unsigned(({wire199, wire195} ^ (wire196 ?
                  (8'hae) : (8'h9e))))),
              {((|$signed(wire2)) <<< (+(&wire2)))}};
        end
      else
        begin
          reg202 <= wire1[(4'h9):(4'h9)];
          reg203 <= (wire5 || $signed(wire199));
          reg204 <= $unsigned(wire198[(1'h1):(1'h1)]);
          reg205 <= $unsigned(wire198);
          reg206 <= (({(((8'h9c) ? (8'ha1) : wire196) ?
                      $signed((7'h40)) : (^~reg203))} && wire6[(1'h1):(1'h0)]) ?
              ($unsigned((^~wire193[(5'h10):(3'h7)])) ?
                  (wire196[(3'h6):(1'h1)] ?
                      (wire193 ?
                          (wire199 ? wire4 : reg202) : (wire0 ?
                              wire195 : wire193)) : $signed((wire4 ?
                          wire0 : reg201))) : reg204[(2'h3):(1'h0)]) : ($signed(((wire199 ?
                      wire198 : (8'hae)) <<< (~^(8'ha2)))) ?
                  ($signed($signed((8'ha3))) == ($signed(wire199) ?
                      wire196[(3'h5):(3'h5)] : ((8'hbe) - reg204))) : $signed(wire0[(1'h1):(1'h0)])));
        end
    end
  assign wire207 = (wire2[(5'h11):(4'hf)] ?
                       $signed((((wire195 ?
                           wire198 : (8'ha4)) && $unsigned(wire1)) & (((8'hb3) || wire6) || wire1))) : $signed((8'ha7)));
  assign wire208 = (-((~((wire196 >> (7'h42)) ^ reg201[(3'h6):(2'h2)])) ^ ({$signed(reg203)} > {(-wire0)})));
  assign wire209 = (reg202[(3'h5):(1'h1)] ~^ (($unsigned($unsigned(wire198)) <<< (~&wire0)) ?
                       (+($unsigned(reg201) ?
                           (~^wire198) : reg203)) : $signed(wire196[(3'h5):(1'h0)])));
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire127;
  wire signed [(5'h10):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire90;
  wire signed [(4'hc):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire129;
  wire signed [(5'h11):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire131;
  wire signed [(5'h12):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire133;
  wire [(3'h5):(1'h0)] wire134;
  wire [(4'he):(1'h0)] wire182;
  reg signed [(4'h9):(1'h0)] reg192 = (1'h0);
  reg [(3'h4):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg189 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg188 = (1'h0);
  reg [(4'ha):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg186 = (1'h0);
  reg [(4'hb):(1'h0)] reg185 = (1'h0);
  reg [(3'h7):(1'h0)] reg184 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  assign y = {wire127,
                 wire92,
                 wire91,
                 wire90,
                 wire13,
                 wire14,
                 wire47,
                 wire60,
                 wire61,
                 wire62,
                 wire88,
                 wire129,
                 wire130,
                 wire131,
                 wire132,
                 wire133,
                 wire134,
                 wire182,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
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
                 (1'h0)};
  assign wire13 = {wire12, wire12[(1'h1):(1'h0)]};
  assign wire14 = wire9[(2'h3):(2'h3)];
  module15 #() modinst48 (wire47, clk, wire12, wire13, wire14, wire8);
  always
    @(posedge clk) begin
      reg49 <= (((^~(~(8'ha9))) ?
          wire14[(4'ha):(1'h1)] : (^(8'hb2))) | $signed($unsigned(wire47)));
      if (wire9)
        begin
          reg50 <= wire13;
          reg51 <= wire11[(3'h7):(3'h4)];
          if (($unsigned(($unsigned(reg51[(3'h5):(3'h5)]) && wire13)) ?
              wire12[(4'hc):(2'h3)] : $signed($signed($signed(reg49)))))
            begin
              reg52 <= ((~|$unsigned($unsigned(wire8))) << {wire9[(1'h1):(1'h1)]});
              reg53 <= ((($signed((+reg51)) ^~ {reg51[(3'h7):(1'h0)],
                      (-(8'hb0))}) ?
                  $signed(((reg51 >>> wire47) ?
                      reg52[(2'h2):(2'h2)] : wire14)) : (wire11[(3'h5):(3'h4)] ?
                      $unsigned(wire10[(4'hb):(1'h0)]) : wire14)) ~^ (wire12[(1'h1):(1'h0)] < (&$signed($signed((8'had))))));
              reg54 <= (((^~reg50) >> wire11[(4'h8):(4'h8)]) < reg53[(5'h10):(4'h8)]);
            end
          else
            begin
              reg52 <= (((((wire12 >= reg49) ~^ (wire12 ? wire12 : (8'ha0))) ?
                  ($signed(reg52) ?
                      $unsigned((8'haf)) : {reg52,
                          wire8}) : $unsigned((!wire9))) >> ($signed(wire9[(2'h3):(2'h2)]) ?
                  (wire14 <= {wire12}) : wire13[(2'h2):(2'h2)])) | ((+reg50[(2'h3):(1'h0)]) ?
                  $signed($signed((^reg50))) : ($unsigned(((8'ha3) ?
                          wire9 : wire12)) ?
                      wire11 : ((~&wire9) ? $signed((8'hb6)) : (-(8'hb4))))));
            end
          reg55 <= reg51[(2'h3):(2'h2)];
        end
      else
        begin
          reg50 <= (^(wire9[(1'h1):(1'h1)] == ((reg54 ?
                  wire10 : (reg49 ? wire9 : (8'hbc))) ?
              $unsigned($unsigned(reg51)) : $signed({wire8}))));
          reg51 <= reg51[(1'h0):(1'h0)];
          reg52 <= reg51[(1'h0):(1'h0)];
          if (wire14)
            begin
              reg53 <= ((-wire10[(3'h4):(2'h3)]) && (~|wire13));
              reg54 <= (wire47[(3'h4):(2'h3)] & $unsigned(reg51));
              reg55 <= $signed($unsigned(reg50[(2'h3):(1'h1)]));
              reg56 <= ($signed((reg55[(4'h8):(3'h4)] >= (+wire8[(4'ha):(3'h6)]))) ?
                  $unsigned(($unsigned($signed(reg55)) > $unsigned($unsigned(wire12)))) : $unsigned((wire14 ?
                      $unsigned($unsigned(reg53)) : $unsigned($signed(reg49)))));
            end
          else
            begin
              reg53 <= (reg50[(4'hb):(2'h3)] > reg53[(3'h4):(2'h3)]);
              reg54 <= ((wire14[(1'h1):(1'h1)] <<< ((wire11[(2'h2):(1'h0)] != reg56) ?
                      reg53 : {(wire9 == (8'hb9))})) ?
                  (~|(reg50[(4'h9):(1'h1)] * ($signed(wire47) ^~ reg53))) : $signed($signed({(reg49 >= reg51)})));
              reg55 <= ((~^(!(8'hab))) ?
                  (^~$unsigned((~&wire14))) : ($unsigned(($unsigned(wire47) ^ reg54)) ?
                      reg50[(3'h4):(3'h4)] : reg56[(3'h4):(1'h0)]));
              reg56 <= (-((($signed(reg49) ?
                  $unsigned((8'hae)) : (wire14 ?
                      reg52 : reg55)) & wire13[(1'h1):(1'h0)]) >= (wire9[(3'h4):(1'h1)] < (~(~^reg50)))));
              reg57 <= reg55[(1'h1):(1'h1)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg58 <= (((~^reg52[(2'h3):(2'h2)]) ?
              reg50 : ($unsigned(reg51) + (+wire47))) ?
          wire8 : ({((wire8 & wire47) ?
                      (reg57 & wire10) : (wire11 ? reg55 : wire11)),
                  ($signed(wire11) ? (reg56 ? reg53 : reg57) : (~^wire10))} ?
              $unsigned((reg52[(2'h2):(1'h1)] && reg55)) : $unsigned((~|(reg55 & wire11)))));
      reg59 <= wire13[(1'h0):(1'h0)];
    end
  assign wire60 = (^(((wire12[(3'h6):(1'h1)] ?
                      (reg51 & reg54) : $signed(reg54)) && $unsigned((wire47 | reg52))) | $signed(((wire13 ?
                          reg51 : wire8) ?
                      (reg55 ? (8'hb7) : reg57) : $signed(reg58)))));
  assign wire61 = (($unsigned($signed($unsigned(reg57))) ?
                      wire14[(4'hd):(4'hc)] : $signed(($unsigned(wire8) ?
                          (wire8 ?
                              reg51 : wire10) : $unsigned(reg57)))) | wire14);
  assign wire62 = ($signed(($unsigned({(8'ha9), wire9}) ?
                          wire60 : ((reg58 ? (7'h44) : (7'h41)) ?
                              reg52[(2'h3):(1'h0)] : (~|reg50)))) ?
                      {$signed(($signed(wire14) < (reg49 ^ reg57)))} : (&reg52));
  module63 #() modinst89 (.clk(clk), .wire65(wire60), .y(wire88), .wire67(wire47), .wire66(reg53), .wire64(wire9));
  assign wire90 = ($unsigned((8'ha0)) * reg56);
  assign wire91 = (wire88[(5'h12):(4'hf)] >> $unsigned(wire60));
  assign wire92 = (+$unsigned(($signed((^~wire11)) || {{reg57}})));
  module93 #() modinst128 (wire127, clk, reg55, reg54, reg49, wire62);
  assign wire129 = (+($unsigned(reg50) != (~{(wire47 - (7'h43))})));
  assign wire130 = (7'h44);
  assign wire131 = $unsigned((8'haf));
  assign wire132 = (reg55[(1'h0):(1'h0)] ?
                       (wire127 ?
                           $unsigned($signed($signed(reg58))) : $unsigned($signed({wire131,
                               (8'hab)}))) : ((($signed(wire129) ?
                               (reg53 && wire8) : (&wire47)) ?
                           ((^~(8'ha0)) & $unsigned(reg57)) : $signed((~^wire12))) | reg49[(5'h13):(2'h2)]));
  assign wire133 = ($signed(($signed({wire10}) | {(^reg49), {wire10}})) ?
                       (({(reg52 ? wire91 : wire132), (&wire91)} ?
                           ($unsigned(reg59) - (wire131 | wire92)) : reg59) >> $unsigned(wire132[(3'h4):(3'h4)])) : $signed(wire90[(2'h3):(1'h1)]));
  assign wire134 = $signed((~wire10[(2'h2):(1'h1)]));
  module135 #() modinst183 (.wire140(wire130), .wire139(wire90), .y(wire182), .wire137(wire9), .clk(clk), .wire138(reg50), .wire136(reg57));
  always
    @(posedge clk) begin
      reg184 <= reg58;
      reg185 <= $unsigned($signed(wire130[(4'he):(4'hb)]));
      reg186 <= $unsigned(reg52);
      reg187 <= (|(wire90[(4'h8):(1'h1)] | wire130[(4'h9):(1'h0)]));
      if ((wire47[(4'hb):(1'h0)] || (-$signed(reg54))))
        begin
          if ({$unsigned(wire134)})
            begin
              reg188 <= reg59;
              reg189 <= wire134;
              reg190 <= (8'ha4);
              reg191 <= reg189;
              reg192 <= wire13;
            end
          else
            begin
              reg188 <= $signed({wire90[(4'hc):(4'hc)]});
              reg189 <= $unsigned($unsigned($signed($unsigned((wire129 & (8'h9d))))));
            end
        end
      else
        begin
          reg188 <= wire88[(4'ha):(3'h6)];
          reg189 <= $signed((+wire12[(4'h9):(4'h8)]));
          reg190 <= (wire60[(3'h5):(2'h2)] << (~((reg55[(3'h5):(3'h4)] ?
                  $signed(wire8) : reg186[(2'h2):(1'h1)]) ?
              (wire11[(1'h0):(1'h0)] + $signed(reg52)) : ((~^reg51) & $signed((8'hbf))))));
          reg191 <= $signed((|(reg59[(3'h4):(1'h1)] ?
              $unsigned({wire131}) : (wire88[(5'h14):(4'hb)] ?
                  (8'ha2) : reg54))));
          reg192 <= $unsigned($unsigned($unsigned(reg184)));
        end
    end
endmodule

module module135  (y, clk, wire140, wire139, wire138, wire137, wire136);
  output wire [(32'h1e8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire140;
  input wire signed [(5'h13):(1'h0)] wire139;
  input wire signed [(2'h3):(1'h0)] wire138;
  input wire [(2'h3):(1'h0)] wire137;
  input wire [(2'h2):(1'h0)] wire136;
  wire [(2'h2):(1'h0)] wire179;
  wire signed [(4'hf):(1'h0)] wire178;
  wire signed [(5'h15):(1'h0)] wire177;
  wire [(4'hb):(1'h0)] wire176;
  wire signed [(3'h7):(1'h0)] wire175;
  wire signed [(5'h11):(1'h0)] wire174;
  wire [(5'h15):(1'h0)] wire173;
  wire [(3'h7):(1'h0)] wire172;
  wire signed [(4'hc):(1'h0)] wire146;
  wire [(2'h2):(1'h0)] wire145;
  wire signed [(4'ha):(1'h0)] wire144;
  wire [(4'hd):(1'h0)] wire143;
  wire [(3'h7):(1'h0)] wire142;
  wire signed [(5'h10):(1'h0)] wire141;
  reg signed [(3'h7):(1'h0)] reg181 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg180 = (1'h0);
  reg [(4'hd):(1'h0)] reg171 = (1'h0);
  reg [(5'h13):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg168 = (1'h0);
  reg [(3'h4):(1'h0)] reg167 = (1'h0);
  reg signed [(4'he):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg165 = (1'h0);
  reg [(3'h7):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg161 = (1'h0);
  reg [(5'h10):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg158 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg157 = (1'h0);
  reg [(5'h12):(1'h0)] reg156 = (1'h0);
  reg [(4'hc):(1'h0)] reg155 = (1'h0);
  reg [(5'h13):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(5'h13):(1'h0)] reg151 = (1'h0);
  reg [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(5'h10):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg147 = (1'h0);
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 reg181,
                 reg180,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
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
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire141 = $unsigned((wire140[(2'h3):(2'h2)] ~^ wire138[(1'h1):(1'h1)]));
  assign wire142 = ($signed(wire137[(1'h1):(1'h0)]) ?
                       (($unsigned((!wire139)) + ((wire140 ?
                                   wire137 : wire140) ?
                               {wire137, wire138} : (wire137 * wire141))) ?
                           ((&(wire138 == wire140)) && (wire140 ?
                               wire141 : $signed((8'h9c)))) : wire136[(1'h0):(1'h0)]) : ($unsigned({(wire138 ?
                               wire136 : wire137),
                           $signed(wire138)}) >>> wire139[(4'hc):(4'h9)]));
  assign wire143 = wire137;
  assign wire144 = $signed(((((-wire142) >>> $unsigned(wire141)) ~^ $signed((wire137 ?
                       wire139 : wire141))) >> (((wire137 ^ wire143) == $unsigned((8'ha1))) ~^ wire143[(2'h3):(2'h3)])));
  assign wire145 = $unsigned((!(|{$unsigned(wire138)})));
  assign wire146 = ((~|$signed(wire144[(1'h1):(1'h0)])) ^ $signed({((wire137 ?
                           wire140 : wire145) * wire144)}));
  always
    @(posedge clk) begin
      if (wire137[(1'h0):(1'h0)])
        begin
          reg147 <= $unsigned($unsigned($signed($unsigned(wire143[(3'h6):(3'h5)]))));
          reg148 <= (~^$unsigned((((7'h43) ?
              ((8'h9d) <= wire137) : {wire136}) ~^ $signed(wire137))));
          if ($unsigned(($unsigned(($signed(wire142) >= wire143)) ?
              {wire141} : (8'ha8))))
            begin
              reg149 <= $unsigned(wire140);
              reg150 <= (8'ha3);
              reg151 <= {$signed(wire138)};
              reg152 <= (~^$unsigned($signed(($signed(wire139) >= (|wire140)))));
            end
          else
            begin
              reg149 <= $signed((-$unsigned(wire143[(1'h1):(1'h0)])));
              reg150 <= wire138;
              reg151 <= ({$unsigned($signed(reg147)),
                  $unsigned(($signed(wire140) ?
                      (^~reg150) : (wire138 < wire137)))} ^ $unsigned((~&((^reg148) ?
                  $signed(wire139) : wire139[(1'h0):(1'h0)]))));
              reg152 <= (^reg147);
              reg153 <= (~|(~^(8'hbf)));
            end
        end
      else
        begin
          if (wire144)
            begin
              reg147 <= $unsigned((reg152 <= (($signed(wire145) ?
                      (&wire139) : (!wire137)) ?
                  ({reg153} < $signed((8'hbe))) : $signed($signed(wire142)))));
              reg148 <= ($signed(wire137[(1'h0):(1'h0)]) ?
                  $unsigned($signed({(~|wire146),
                      wire136[(2'h2):(2'h2)]})) : (|$signed($signed((wire136 ?
                      wire137 : reg147)))));
              reg149 <= {$unsigned(reg151[(5'h12):(4'he)])};
              reg150 <= $signed(reg149[(4'he):(3'h5)]);
            end
          else
            begin
              reg147 <= {(&wire142),
                  {{wire137[(2'h3):(2'h3)]},
                      ((~|$signed(wire140)) ?
                          (~&$unsigned(wire138)) : {(^~(8'hbf))})}};
            end
          reg151 <= ((~&($unsigned((~&reg152)) ?
              {reg152[(1'h0):(1'h0)]} : $signed(reg152[(2'h2):(1'h0)]))) <<< reg150);
        end
      if (wire146[(4'ha):(4'h9)])
        begin
          reg154 <= (((reg151 == reg150[(4'h8):(2'h2)]) > ((reg153[(3'h4):(1'h1)] | {reg147,
                  reg148}) << (-(reg152 & reg147)))) ?
              (wire140 > $signed($unsigned((~wire144)))) : $signed(($signed(wire139[(4'he):(3'h6)]) ?
                  ((!wire142) << {wire141}) : wire144)));
          reg155 <= (($signed((8'hac)) ?
                  wire136 : {$unsigned($signed(wire142))}) ?
              (&(reg148 + (~wire136[(1'h1):(1'h1)]))) : ($signed(({wire146,
                      reg149} ~^ $unsigned(wire136))) ?
                  wire143[(2'h2):(1'h0)] : (({wire138} <= (7'h44)) >> wire136[(2'h2):(1'h0)])));
        end
      else
        begin
          reg154 <= ({{wire137}} > ((reg153[(1'h1):(1'h1)] ?
              $signed(reg150[(4'hb):(1'h0)]) : wire143) - wire140));
          reg155 <= {reg154,
              $unsigned(((~reg153[(2'h3):(1'h0)]) ^ ((wire141 <<< wire140) ?
                  (~&wire145) : (wire142 ? (8'h9c) : reg148))))};
          if (reg152[(2'h2):(2'h2)])
            begin
              reg156 <= $unsigned(reg155);
              reg157 <= $unsigned($signed(wire137));
            end
          else
            begin
              reg156 <= wire139[(4'hc):(4'hb)];
              reg157 <= (($signed((8'hbb)) ?
                      (((-reg154) != (reg156 ?
                          reg154 : reg152)) - (^wire140)) : ((|(^~reg156)) && wire143[(1'h0):(1'h0)])) ?
                  wire140[(1'h0):(1'h0)] : ($signed((~&wire144[(3'h5):(1'h0)])) ?
                      $signed((-wire145[(2'h2):(1'h0)])) : ($unsigned($unsigned(wire144)) ?
                          (wire143 <<< ((8'hb2) ?
                              wire142 : (8'hae))) : (&((8'hb9) <= wire142)))));
              reg158 <= wire146;
              reg159 <= ((~^wire141) > ($unsigned(wire143) >>> (wire138[(1'h0):(1'h0)] ?
                  $signed($signed(reg156)) : ($signed(reg148) ?
                      wire143[(4'hc):(3'h5)] : wire141))));
              reg160 <= {{($unsigned(wire142) - ($unsigned((8'ha0)) ?
                          {(8'hbf), reg159} : reg149))}};
            end
        end
      reg161 <= $signed($signed($unsigned(wire136[(1'h1):(1'h1)])));
      reg162 <= $unsigned({wire137});
      if (reg158[(5'h10):(4'hf)])
        begin
          if (((reg155 ?
              (wire137 ?
                  $signed((wire145 ^~ wire144)) : ((wire137 ^ wire144) | (reg161 ?
                      reg152 : reg152))) : (reg161 ?
                  ($unsigned(wire138) ?
                      (+wire146) : {reg161,
                          wire141}) : (~|(wire138 && (7'h43))))) + ($signed($signed((wire141 <<< wire141))) != ((-wire139) ?
              $signed((^wire138)) : $unsigned(((8'hb9) >> reg159))))))
            begin
              reg163 <= (reg158[(5'h12):(5'h10)] & reg151[(4'ha):(1'h0)]);
              reg164 <= reg159;
              reg165 <= $signed($unsigned((^~(&$signed((8'ha9))))));
            end
          else
            begin
              reg163 <= ($signed((~^wire143)) - (~&reg157[(3'h4):(2'h2)]));
              reg164 <= ((!{(reg160[(4'hb):(1'h1)] ?
                          (reg161 ? wire138 : wire139) : reg147),
                      {(reg163 ? wire137 : wire146)}}) ?
                  ({(-$signed(reg154))} ?
                      reg165 : reg160) : reg157[(2'h2):(1'h0)]);
              reg165 <= (!wire138);
            end
          if ($unsigned((((^(~|reg148)) >> wire145[(1'h1):(1'h1)]) & ($unsigned({reg158}) ?
              wire145 : (wire146 < (~&reg154))))))
            begin
              reg166 <= {$unsigned(reg157)};
              reg167 <= reg156;
              reg168 <= (~&$signed((((reg152 <= (7'h40)) ~^ reg155) ?
                  $unsigned(reg160) : ((8'hb1) ?
                      wire146[(4'hb):(2'h2)] : reg151))));
              reg169 <= $signed(reg147);
              reg170 <= {wire145, (~&$unsigned((~(~^(8'hae)))))};
            end
          else
            begin
              reg166 <= reg161;
              reg167 <= ((((8'ha2) * reg165[(4'h9):(2'h2)]) >>> ((~|(reg166 ?
                      (8'haf) : wire143)) ^~ ((+(8'hb7)) ?
                      wire141 : (reg163 ? (8'hb9) : wire145)))) ?
                  $unsigned((^~(7'h42))) : (reg169 <<< {(&{wire145, reg168})}));
              reg168 <= {(^~reg153),
                  (wire138 < ((&(&reg164)) ?
                      {(-wire146),
                          reg150[(4'h8):(1'h1)]} : ((reg161 >>> wire144) ?
                          {reg165, reg166} : wire137[(1'h1):(1'h0)])))};
            end
        end
      else
        begin
          if (wire141[(4'hc):(4'ha)])
            begin
              reg163 <= (wire143[(1'h1):(1'h1)] * $signed((reg154[(5'h12):(3'h6)] << {{reg161,
                      reg161}})));
              reg164 <= $unsigned((+({(reg166 ? wire146 : reg167)} ?
                  $signed((reg165 == reg152)) : ($signed(wire141) ?
                      (^~reg159) : (|wire143)))));
              reg165 <= $signed(wire141);
              reg166 <= (^({$unsigned($unsigned(reg153))} ?
                  {reg164[(3'h6):(2'h2)]} : $unsigned(((wire139 ?
                          reg169 : wire143) ?
                      {reg158, reg155} : {(8'haa), (7'h40)}))));
              reg167 <= $unsigned((~^reg156[(2'h2):(1'h1)]));
            end
          else
            begin
              reg163 <= $signed(reg152);
              reg164 <= (reg151 | $signed($unsigned({reg159[(3'h7):(2'h3)],
                  (+(8'hbb))})));
              reg165 <= ($unsigned($signed(reg163)) && ($signed($unsigned((^(8'hba)))) - $unsigned(reg154[(3'h4):(3'h4)])));
              reg166 <= reg157[(1'h1):(1'h1)];
            end
          reg168 <= ($signed(reg147) | ((+$signed((8'hb8))) >>> ($signed($unsigned(wire142)) >= {reg170[(3'h7):(1'h1)],
              $unsigned(reg167)})));
          reg169 <= wire145;
          reg170 <= (wire141 ? $signed((~(8'hab))) : reg169[(3'h4):(2'h2)]);
          reg171 <= $unsigned({{{reg161[(1'h0):(1'h0)]}}});
        end
    end
  assign wire172 = reg160[(4'h9):(4'h8)];
  assign wire173 = reg147[(4'h8):(4'h8)];
  assign wire174 = $unsigned(reg164);
  assign wire175 = (|(reg159[(4'he):(3'h5)] <= {((+reg148) ?
                           wire137 : (|wire141)),
                       ((^~reg160) ? (^~reg148) : $signed(wire141))}));
  assign wire176 = wire136[(1'h1):(1'h1)];
  assign wire177 = (^~(&(((8'h9e) ? reg169[(2'h3):(2'h2)] : {(8'hb0)}) ?
                       wire172[(3'h5):(1'h0)] : reg160[(2'h3):(2'h3)])));
  assign wire178 = $signed((reg164 ?
                       (&(^~(&wire142))) : $signed(wire175[(2'h3):(1'h0)])));
  assign wire179 = ((reg160 ?
                       {$signed((reg155 | wire136))} : (|(!reg157[(2'h3):(1'h1)]))) ^~ $signed($signed($signed((~&wire140)))));
  always
    @(posedge clk) begin
      reg180 <= {$unsigned(reg153)};
      reg181 <= (+(~|{$unsigned((wire179 ? reg165 : reg151)), reg157}));
    end
endmodule

module module93
#(parameter param125 = (({({(8'hac), (8'h9f)} & (&(8'ha5))), (8'hac)} * (^~((!(8'hb1)) << ((8'hb8) && (8'hbc))))) ? (|(((!(8'hb6)) <<< ((8'ha3) ? (7'h44) : (8'had))) >= {((8'haf) | (8'hb0))})) : ({(~^((8'ha7) ? (8'hb8) : (8'hb2))), (((8'ha2) ? (8'hbe) : (8'hbe)) ^ (~(8'hb5)))} <= (((~(8'haa)) < ((7'h43) > (7'h43))) < (8'hb4)))), 
parameter param126 = param125)
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire97;
  input wire signed [(3'h4):(1'h0)] wire96;
  input wire [(5'h13):(1'h0)] wire95;
  input wire signed [(5'h14):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire106;
  wire [(4'hd):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire100;
  wire signed [(3'h7):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  assign y = {wire124,
                 wire118,
                 wire117,
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
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire98 = wire94;
  assign wire99 = (wire97 * (wire94 >= $signed($unsigned(wire96))));
  assign wire100 = (+($signed(wire95[(5'h11):(1'h0)]) << ($unsigned((wire94 <= wire96)) ?
                       $unsigned($signed(wire98)) : $unsigned(wire99))));
  assign wire101 = wire96;
  assign wire102 = ((~|(((wire101 ? (8'h9d) : wire95) ?
                           ((8'hb3) == wire94) : (wire99 ?
                               (8'haf) : wire98)) < $unsigned($unsigned(wire94)))) ?
                       (($unsigned(wire101) ?
                               wire95 : $unsigned(wire95[(3'h5):(2'h2)])) ?
                           {$signed((8'hb3))} : $signed(wire100[(3'h6):(1'h0)])) : ((&wire99) ?
                           (($unsigned(wire101) ?
                                   wire101[(1'h0):(1'h0)] : $signed(wire101)) ?
                               (^~wire97) : (~&(8'haf))) : (^wire95[(1'h1):(1'h0)])));
  assign wire103 = (8'haa);
  assign wire104 = $signed(wire103);
  assign wire105 = wire102[(3'h4):(2'h3)];
  assign wire106 = ($unsigned({(~$unsigned(wire96)),
                           {$signed(wire94), wire95[(5'h13):(4'hf)]}}) ?
                       (!(wire98[(1'h0):(1'h0)] ?
                           wire101[(4'he):(2'h3)] : (8'hb9))) : $unsigned(wire95));
  assign wire107 = ((~^(&$signed(wire103[(4'h9):(4'h8)]))) <<< $signed($signed((8'ha4))));
  assign wire108 = (8'h9e);
  always
    @(posedge clk) begin
      reg109 <= $unsigned(wire98);
      if ({($unsigned($unsigned(wire104[(2'h3):(1'h0)])) | $unsigned(wire94[(4'ha):(3'h7)]))})
        begin
          if (wire98[(3'h5):(1'h1)])
            begin
              reg110 <= $unsigned(wire106[(4'hc):(4'hc)]);
              reg111 <= (~|$unsigned((wire105 != $unsigned(wire100[(1'h1):(1'h1)]))));
              reg112 <= (!(~^($unsigned($unsigned((8'hb3))) ?
                  ((-wire97) == (-(8'hab))) : $unsigned($signed(wire100)))));
              reg113 <= $unsigned((^~wire106[(1'h1):(1'h0)]));
            end
          else
            begin
              reg110 <= (((({reg109} <<< (reg110 ?
                  wire94 : wire98)) + {(~&reg109),
                  wire105}) <<< $unsigned(($unsigned(wire97) || (^wire95)))) == ((((^~wire95) ?
                      (8'hb8) : (wire102 <<< wire100)) && wire96[(2'h2):(2'h2)]) ?
                  (wire94 - ($signed(wire105) >= (reg110 != wire102))) : (~|((wire101 ?
                          reg113 : (8'h9c)) ?
                      $signed(reg109) : wire96[(2'h3):(2'h2)]))));
            end
          reg114 <= reg110[(3'h4):(2'h2)];
        end
      else
        begin
          reg110 <= wire100[(3'h4):(1'h0)];
          reg111 <= $signed($unsigned(wire104));
          reg112 <= $unsigned((wire102[(3'h4):(2'h3)] ?
              ($signed($signed(wire94)) << {$signed(wire104),
                  (+reg111)}) : wire108[(1'h1):(1'h1)]));
          reg113 <= ($unsigned($signed((^(reg114 != wire98)))) || {wire101,
              (~^$unsigned((wire96 >= (8'h9f))))});
          reg114 <= (($signed($signed($signed(reg109))) ^ ($signed((+reg109)) ?
              wire100[(3'h5):(3'h4)] : $signed((~wire104)))) != (|{wire95}));
        end
      reg115 <= $unsigned((~&wire94[(4'hc):(2'h3)]));
      if (($signed({(reg112[(1'h0):(1'h0)] ?
              (reg109 == reg114) : (8'hba))}) * reg115[(4'h9):(1'h0)]))
        begin
          reg116 <= (+{reg113, wire107[(4'hb):(3'h7)]});
        end
      else
        begin
          reg116 <= ($unsigned(wire99) * wire107[(3'h4):(1'h0)]);
        end
    end
  assign wire117 = ((((8'hb6) ^~ ((~^wire105) ?
                       {wire99} : (|reg113))) << wire105[(4'h8):(3'h4)]) >> (wire99[(3'h5):(1'h1)] ?
                       (reg113 ?
                           $signed(wire101[(2'h3):(1'h1)]) : $signed($unsigned(wire103))) : $unsigned(reg111[(3'h6):(2'h3)])));
  assign wire118 = wire106[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg119 <= $unsigned(($signed(($unsigned(wire106) ?
          wire98 : wire94[(5'h10):(4'hb)])) ^ $unsigned($unsigned((^~wire108)))));
      reg120 <= (~|$signed($unsigned($unsigned(((8'hb6) >= wire100)))));
      reg121 <= $unsigned((^(7'h42)));
      reg122 <= ($unsigned(wire118) ~^ reg116[(1'h1):(1'h0)]);
      reg123 <= wire102[(2'h2):(1'h0)];
    end
  assign wire124 = reg112;
endmodule

module module63
#(parameter param87 = {((|(-(8'hb3))) ? ((((8'ha4) >>> (8'ha8)) ? ((8'ha3) ? (8'ha9) : (8'hab)) : ((7'h40) * (8'hbf))) ? ((8'hb6) < ((8'hac) ^~ (8'hba))) : (^~((8'hb4) || (8'hbb)))) : {(((8'hae) ^ (8'h9f)) ? {(7'h44), (8'had)} : (^~(8'hb9))), (((8'ha0) | (8'ha1)) ? ((8'ha5) <= (8'hb9)) : {(8'hb7)})}), {{(((8'hab) * (7'h43)) & ((8'hbc) + (8'h9f))), {((8'hb7) ? (8'haa) : (8'haf))}}, (((~^(8'hb8)) ? ((7'h41) ? (8'hb7) : (7'h43)) : ((7'h40) ^~ (8'hac))) ? ({(8'hba)} ? (+(8'haa)) : ((8'ha5) << (8'h9e))) : (((8'hb5) ? (8'ha0) : (7'h41)) >>> (!(8'hb5))))}})
(y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire67;
  input wire [(5'h10):(1'h0)] wire66;
  input wire [(4'ha):(1'h0)] wire65;
  input wire signed [(4'h9):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire68;
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire68,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire68 = wire65[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ($signed(({$signed((^~wire64))} ?
          $signed(wire67) : {(-$unsigned(wire64)),
              $unsigned($unsigned((8'hae)))})))
        begin
          reg69 <= $signed($signed(wire68[(4'hc):(2'h2)]));
          if ((~(wire68[(4'h8):(3'h5)] ?
              (|$unsigned(wire65[(4'ha):(3'h5)])) : $unsigned((^~{wire66,
                  wire64})))))
            begin
              reg70 <= wire65[(2'h2):(1'h1)];
              reg71 <= (((-{$signed(wire68),
                  (wire64 ? wire68 : wire64)}) >= reg69) <<< $unsigned(wire68));
            end
          else
            begin
              reg70 <= $unsigned(wire65);
              reg71 <= wire67[(2'h2):(1'h0)];
              reg72 <= wire67[(2'h2):(2'h2)];
              reg73 <= (~|wire67);
              reg74 <= (($unsigned($unsigned(wire66[(2'h3):(1'h0)])) <<< $unsigned($unsigned((~^wire64)))) ?
                  reg71[(4'ha):(2'h2)] : wire65[(3'h6):(2'h3)]);
            end
          reg75 <= (wire66[(4'hc):(3'h5)] ^~ {(($signed(reg72) ?
                  (reg70 < wire64) : $unsigned(wire68)) + $unsigned($unsigned(wire64))),
              (wire68[(4'he):(4'h8)] ?
                  $unsigned((&wire67)) : wire67[(3'h4):(1'h1)])});
        end
      else
        begin
          reg69 <= wire66[(4'h9):(2'h3)];
          if ((+$signed((8'ha0))))
            begin
              reg70 <= {(~reg74[(5'h14):(3'h4)]), wire68[(3'h5):(2'h2)]};
              reg71 <= reg73;
            end
          else
            begin
              reg70 <= wire66;
              reg71 <= wire64[(3'h5):(2'h2)];
              reg72 <= $unsigned(({wire67} >>> $signed(((!(8'ha0)) ?
                  (reg71 >> reg73) : $signed(wire67)))));
              reg73 <= $signed(reg70[(2'h2):(1'h0)]);
              reg74 <= $signed({{$signed($signed(reg71)),
                      wire66[(3'h4):(1'h1)]}});
            end
          reg75 <= {$unsigned($signed(wire65[(2'h3):(2'h3)]))};
        end
    end
  assign wire76 = $signed((8'ha8));
  assign wire77 = {wire76[(1'h1):(1'h0)]};
  assign wire78 = reg75[(4'ha):(2'h2)];
  assign wire79 = $unsigned((~(wire76[(2'h2):(2'h2)] ?
                      wire77[(2'h2):(1'h1)] : wire64)));
  assign wire80 = ((!(~|(~|reg72))) == $signed(($signed((|wire68)) <= wire66)));
  assign wire81 = (|(((~|(8'hb6)) <<< {wire77[(4'hc):(4'hc)]}) == wire77));
  assign wire82 = wire77;
  assign wire83 = wire77;
  assign wire84 = {(8'haf), wire83[(4'hc):(2'h3)]};
  assign wire85 = {{$unsigned(reg74[(4'he):(3'h5)])}};
  assign wire86 = reg75[(2'h3):(1'h1)];
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire19;
  input wire signed [(3'h7):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire17;
  input wire signed [(2'h2):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire39,
                 wire38,
                 wire37,
                 wire33,
                 wire21,
                 wire20,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg36,
                 reg35,
                 reg34,
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
  assign wire20 = $signed(wire16);
  assign wire21 = (wire20 ?
                      $unsigned((~|$unsigned(wire20))) : wire16[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if ({wire18})
        begin
          reg22 <= (&wire21);
          reg23 <= {$signed(wire19[(2'h2):(2'h2)]),
              (!((8'hbb) ? wire20[(1'h1):(1'h0)] : wire17))};
          reg24 <= $signed((8'hb7));
        end
      else
        begin
          reg22 <= (~wire16[(1'h1):(1'h1)]);
          if ({{wire19}, $signed((!$signed($signed(wire16))))})
            begin
              reg23 <= ((-(((|wire17) ?
                      ((8'hb5) ? (8'hb2) : reg24) : {wire21,
                          wire20}) * ((8'ha2) ? {reg24, reg24} : (~&wire20)))) ?
                  (^{((reg24 ? wire20 : wire20) ?
                          {wire18} : (^~reg23))}) : {(|{$unsigned(wire21)})});
              reg24 <= $unsigned($unsigned(wire20));
              reg25 <= (reg24 ?
                  wire17[(4'hf):(4'hd)] : $signed(($signed($signed(wire20)) + (8'ha0))));
              reg26 <= $signed(reg22);
              reg27 <= reg25;
            end
          else
            begin
              reg23 <= $signed(wire19[(4'h9):(3'h6)]);
            end
          reg28 <= ($unsigned(($unsigned($unsigned(reg23)) ?
              $signed(wire17) : (+(!reg27)))) * (-wire19));
          reg29 <= (^~$unsigned((-wire20[(1'h0):(1'h0)])));
          reg30 <= $unsigned($signed((((8'ha1) < reg27) ~^ ($signed(reg29) == (^reg22)))));
        end
      reg31 <= $unsigned({reg22, reg29});
      reg32 <= {reg24, (-(8'hb0))};
    end
  assign wire33 = (|(|$signed($unsigned(wire20))));
  always
    @(posedge clk) begin
      reg34 <= reg29;
      reg35 <= ($signed((^~reg30)) ?
          ((|(|{wire19,
              reg23})) >= $unsigned(($signed(reg28) >>> wire19))) : $signed((($signed(wire19) ?
                  $signed(reg29) : (-(8'hac))) ?
              (+(wire21 * reg31)) : (wire16[(1'h0):(1'h0)] & reg30))));
      reg36 <= (reg34[(1'h0):(1'h0)] ?
          ($signed(reg35) >= $unsigned({$signed(reg25),
              $signed((8'ha7))})) : $unsigned(wire33));
    end
  assign wire37 = reg24;
  assign wire38 = $unsigned($unsigned(((reg22 << wire37[(4'h8):(3'h6)]) ?
                      wire19 : wire18[(3'h5):(2'h2)])));
  assign wire39 = reg22[(5'h10):(1'h0)];
  always
    @(posedge clk) begin
      reg40 <= ({$unsigned(({wire37, reg23} < $unsigned(reg26)))} ?
          wire18 : (reg24 ?
              $signed($signed((~reg29))) : ($signed(reg30) >> (reg34[(4'he):(4'ha)] ?
                  $signed((8'hb8)) : $unsigned(reg27)))));
      reg41 <= wire17[(4'hc):(3'h5)];
      reg42 <= $unsigned($unsigned(reg28));
      reg43 <= $signed(reg31[(3'h7):(3'h6)]);
      reg44 <= (+reg43);
    end
  assign wire45 = ($signed(reg27) ? wire17 : (~^reg36[(3'h7):(3'h6)]));
  assign wire46 = reg26;
endmodule
