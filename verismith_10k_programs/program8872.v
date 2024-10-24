module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire217;
  wire [(4'hc):(1'h0)] wire216;
  wire [(4'h9):(1'h0)] wire215;
  wire [(2'h3):(1'h0)] wire202;
  wire [(3'h4):(1'h0)] wire201;
  wire signed [(5'h14):(1'h0)] wire200;
  wire signed [(2'h2):(1'h0)] wire199;
  wire [(4'hb):(1'h0)] wire195;
  wire [(4'hb):(1'h0)] wire194;
  wire signed [(5'h11):(1'h0)] wire189;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire187;
  reg [(5'h13):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg213 = (1'h0);
  reg [(5'h14):(1'h0)] reg212 = (1'h0);
  reg [(2'h2):(1'h0)] reg211 = (1'h0);
  reg [(3'h4):(1'h0)] reg210 = (1'h0);
  reg signed [(4'he):(1'h0)] reg209 = (1'h0);
  reg [(4'hd):(1'h0)] reg208 = (1'h0);
  reg [(4'hc):(1'h0)] reg207 = (1'h0);
  reg [(5'h10):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg205 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg204 = (1'h0);
  reg [(2'h2):(1'h0)] reg203 = (1'h0);
  reg [(3'h7):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg197 = (1'h0);
  reg [(5'h14):(1'h0)] reg196 = (1'h0);
  reg [(4'ha):(1'h0)] reg193 = (1'h0);
  reg [(5'h11):(1'h0)] reg192 = (1'h0);
  reg [(4'hf):(1'h0)] reg191 = (1'h0);
  reg [(5'h12):(1'h0)] reg190 = (1'h0);
  assign y = {wire217,
                 wire216,
                 wire215,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire195,
                 wire194,
                 wire189,
                 wire4,
                 wire187,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg198,
                 reg197,
                 reg196,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 (1'h0)};
  assign wire4 = ($unsigned({$unsigned((wire1 >>> wire0)),
                         wire1[(3'h7):(3'h5)]}) ?
                     (~|wire0) : {(&(^~(8'hbe))), $unsigned({wire0})});
  module5 #() modinst188 (wire187, clk, wire2, wire0, wire1, wire4, wire3);
  assign wire189 = ($unsigned((~&$unsigned($signed((8'haf))))) ?
                       ((wire3 && (wire187[(4'hb):(3'h6)] - (wire187 ?
                           wire2 : wire187))) || $unsigned((^wire3))) : {(wire0 ?
                               ($signed(wire2) >= $signed(wire4)) : wire3)});
  always
    @(posedge clk) begin
      reg190 <= $signed(({$signed($unsigned(wire189)),
              ((wire1 || wire2) >>> (~&wire0))} ?
          wire4 : $signed(wire189[(4'hb):(2'h3)])));
      reg191 <= ($signed(wire0) ~^ wire2);
    end
  always
    @(posedge clk) begin
      reg192 <= reg191;
      reg193 <= $unsigned({(&($unsigned(reg192) < (&wire189)))});
    end
  assign wire194 = ($unsigned($unsigned(reg193[(4'ha):(4'ha)])) ~^ ({(~^wire3[(3'h6):(3'h4)])} ?
                       $signed($signed(wire189)) : ((~&$unsigned(wire189)) ?
                           (~^(-wire187)) : $unsigned((wire3 ?
                               wire187 : reg193)))));
  assign wire195 = reg193;
  always
    @(posedge clk) begin
      reg196 <= $unsigned(reg190[(1'h0):(1'h0)]);
      reg197 <= (8'h9e);
    end
  always
    @(posedge clk) begin
      reg198 <= $unsigned($signed(($signed(wire4) ?
          $unsigned((wire4 ? reg196 : reg190)) : $signed($signed(wire2)))));
    end
  assign wire199 = (+wire194[(2'h3):(1'h0)]);
  assign wire200 = $signed($unsigned((~&((^wire0) && {wire189, wire189}))));
  assign wire201 = wire0[(4'hd):(4'h8)];
  assign wire202 = ($signed(reg190) ?
                       ($signed((~|(wire194 * wire199))) ?
                           wire199 : reg192) : (wire194[(1'h0):(1'h0)] ?
                           ($signed($signed(wire2)) + $signed(wire194[(3'h7):(3'h6)])) : wire3));
  always
    @(posedge clk) begin
      reg203 <= (|(8'ha6));
      if ((reg196[(5'h13):(4'h8)] ?
          $signed(reg196) : (&($unsigned(reg198) ?
              $signed((8'ha9)) : $signed(wire4)))))
        begin
          reg204 <= $unsigned((8'hbb));
          if ((&reg196[(4'hc):(3'h6)]))
            begin
              reg205 <= (wire189[(4'hb):(1'h1)] ?
                  reg193[(3'h6):(1'h1)] : wire3[(3'h5):(1'h0)]);
            end
          else
            begin
              reg205 <= (reg204 ?
                  (wire2 ?
                      (((&reg192) <<< reg191) ?
                          {((8'hbe) ?
                                  reg204 : wire189)} : (~|(reg204 >> reg191))) : $signed((reg198[(3'h6):(1'h0)] << (wire187 ?
                          reg191 : reg193)))) : $signed(wire194[(3'h4):(3'h4)]));
              reg206 <= $signed(wire187);
            end
        end
      else
        begin
          reg204 <= wire187[(5'h13):(4'ha)];
          reg205 <= {(({wire194[(4'ha):(2'h3)],
                  wire4} - reg193[(1'h1):(1'h0)]) & {$signed((wire187 >>> reg205))}),
              reg197[(4'h9):(2'h2)]};
          if (((&$signed($unsigned((wire4 >> reg190)))) ?
              $unsigned($unsigned($signed(wire187))) : reg196[(4'he):(4'ha)]))
            begin
              reg206 <= wire200;
              reg207 <= $signed(wire4[(1'h1):(1'h1)]);
            end
          else
            begin
              reg206 <= {(7'h40),
                  {(({reg190} >= (~|wire195)) ? reg203 : $signed(reg198))}};
            end
        end
      reg208 <= {wire195[(1'h1):(1'h1)]};
      if ($unsigned($signed(wire187)))
        begin
          reg209 <= wire195;
          reg210 <= $unsigned({$unsigned((wire3 ?
                  reg204[(1'h1):(1'h1)] : (8'hb8))),
              ((8'h9f) | reg206[(5'h10):(3'h4)])});
        end
      else
        begin
          if ($signed($unsigned({reg210, $unsigned($unsigned((8'h9c)))})))
            begin
              reg209 <= $signed({((reg209 * wire189[(2'h3):(2'h3)]) ?
                      wire200[(1'h0):(1'h0)] : ((wire195 || (8'hae)) * reg209)),
                  {$signed(reg190), wire201[(2'h2):(2'h2)]}});
            end
          else
            begin
              reg209 <= wire1;
              reg210 <= $signed(reg208);
              reg211 <= wire4;
              reg212 <= (-(~&(((!reg196) ? ((8'hac) > (8'ha7)) : reg205) ?
                  reg208 : {((8'hb8) <= reg209), $unsigned(reg197)})));
              reg213 <= {wire195[(4'hb):(3'h5)]};
            end
        end
      reg214 <= reg193[(4'h9):(1'h0)];
    end
  assign wire215 = ($signed(((|$unsigned(reg211)) ^~ reg192)) ?
                       (wire1[(4'h9):(4'h8)] ?
                           (wire200 <= $signed($unsigned(reg214))) : reg209[(3'h6):(3'h6)]) : ($signed(reg211[(1'h1):(1'h0)]) ?
                           reg212 : $unsigned($unsigned($signed(wire202)))));
  assign wire216 = reg209[(4'hb):(3'h4)];
  assign wire217 = $signed($signed($unsigned((!$signed(reg193)))));
endmodule

module module5
#(parameter param186 = (~|{((~^((8'ha7) ? (8'ha9) : (8'ha0))) > (((8'hb2) ^~ (8'ha9)) ? (-(8'hb6)) : (|(8'hb3)))), ((-((7'h42) * (8'hac))) || {((8'ha6) ? (8'ha1) : (8'hae))})}))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire185;
  wire signed [(5'h12):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire173;
  reg [(5'h10):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg183 = (1'h0);
  reg [(5'h13):(1'h0)] reg182 = (1'h0);
  reg [(2'h3):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg180 = (1'h0);
  reg signed [(4'he):(1'h0)] reg179 = (1'h0);
  reg [(3'h7):(1'h0)] reg178 = (1'h0);
  reg [(3'h4):(1'h0)] reg177 = (1'h0);
  reg [(4'hd):(1'h0)] reg176 = (1'h0);
  reg [(4'hc):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  assign y = {wire185,
                 wire59,
                 wire61,
                 wire62,
                 wire111,
                 wire173,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= ((8'hbd) <= ($unsigned(wire10) && $unsigned(((~|wire6) * $signed(wire9)))));
      reg12 <= wire7[(4'hd):(4'hb)];
      reg13 <= wire8;
      reg14 <= (((((reg12 * wire7) ? $unsigned(wire6) : {(8'hbe)}) ?
          reg13[(3'h7):(3'h4)] : ((reg12 & reg11) ?
              {wire8} : $signed(wire10))) ^ $unsigned(wire10)) || wire7[(3'h7):(2'h2)]);
      reg15 <= wire6[(2'h2):(2'h2)];
    end
  module16 #() modinst60 (wire59, clk, wire6, wire10, reg15, reg13);
  assign wire61 = (8'hbf);
  assign wire62 = wire6;
  module63 #() modinst112 (wire111, clk, wire7, wire6, wire9, wire61);
  module113 #() modinst174 (wire173, clk, reg11, reg13, wire61, wire62, wire6);
  always
    @(posedge clk) begin
      reg175 <= (~|$signed(({((7'h41) ?
              wire173 : wire9)} >>> reg11[(4'h9):(4'h9)])));
      reg176 <= wire9[(3'h4):(3'h4)];
      reg177 <= (((wire59 ? wire6[(5'h11):(3'h5)] : reg176[(4'h8):(3'h7)]) ?
              (8'hab) : $signed(reg175[(4'hb):(3'h6)])) ?
          $signed($signed((wire9[(3'h6):(1'h0)] ?
              (-(8'haf)) : (^~reg175)))) : reg12);
      reg178 <= wire61[(5'h12):(3'h6)];
      reg179 <= $signed(wire7[(2'h3):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg180 <= ($unsigned($unsigned(reg178)) || (+(-$unsigned($signed(wire6)))));
      reg181 <= (&$unsigned(wire9[(3'h6):(2'h3)]));
      reg182 <= $signed({(8'hb4)});
      reg183 <= $unsigned($signed($signed((wire111 ?
          reg11[(4'ha):(1'h0)] : reg176[(4'h9):(3'h4)]))));
      reg184 <= reg178[(1'h0):(1'h0)];
    end
  assign wire185 = $unsigned(({(reg180 >= reg11[(5'h12):(5'h12)])} >>> (7'h40)));
endmodule

module module113
#(parameter param172 = (({(+{(8'hb6), (8'hbf)})} + ((((8'hbf) < (7'h44)) ? {(8'haa), (8'ha8)} : ((8'hac) ? (8'had) : (8'h9e))) < (~^((8'ha6) ? (7'h43) : (8'hb8))))) ? {(~((~|(8'h9c)) ? ((8'hae) << (7'h40)) : ((8'hae) ? (7'h44) : (8'hb7))))} : ((!(((8'hae) >>> (8'ha1)) >> {(8'hb1), (8'hb4)})) < ((((8'ha2) && (8'h9c)) + ((8'hbd) ? (8'hb4) : (8'hb3))) ? (!((8'hb2) - (8'ha2))) : {((8'hab) ? (8'hab) : (7'h43)), (~&(8'h9c))}))))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h2b9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire118;
  input wire [(3'h4):(1'h0)] wire117;
  input wire [(4'hf):(1'h0)] wire116;
  input wire [(2'h3):(1'h0)] wire115;
  input wire signed [(5'h13):(1'h0)] wire114;
  wire [(4'h8):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire144;
  wire signed [(5'h11):(1'h0)] wire143;
  wire signed [(5'h10):(1'h0)] wire142;
  wire [(2'h3):(1'h0)] wire141;
  wire signed [(2'h2):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire133;
  wire [(4'h9):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire123;
  wire signed [(4'hb):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire120;
  wire signed [(5'h15):(1'h0)] wire119;
  reg signed [(5'h14):(1'h0)] reg171 = (1'h0);
  reg [(4'ha):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg167 = (1'h0);
  reg [(3'h7):(1'h0)] reg166 = (1'h0);
  reg [(5'h14):(1'h0)] reg165 = (1'h0);
  reg [(4'hb):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg [(4'he):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg159 = (1'h0);
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(5'h13):(1'h0)] reg157 = (1'h0);
  reg [(3'h6):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(4'hb):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg149 = (1'h0);
  reg [(4'hc):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire123,
                 wire121,
                 wire120,
                 wire119,
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
                 reg146,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg122,
                 (1'h0)};
  assign wire119 = (($signed((&{wire118})) | wire118) ?
                       $unsigned(((&wire117[(1'h1):(1'h0)]) + $unsigned((wire114 < wire117)))) : (7'h42));
  assign wire120 = $signed((-($signed(wire118[(3'h6):(2'h2)]) - $unsigned((8'h9f)))));
  assign wire121 = ($unsigned($signed(($signed(wire117) + $unsigned(wire118)))) <<< (((wire120[(3'h5):(1'h1)] && $unsigned(wire117)) ?
                           wire118 : wire114) ?
                       ($signed($unsigned(wire117)) ?
                           $unsigned((~&wire114)) : {(wire114 ?
                                   wire114 : wire117)}) : (|wire114)));
  always
    @(posedge clk) begin
      reg122 <= wire114[(4'he):(3'h5)];
    end
  assign wire123 = wire116[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg124 <= ($signed((8'ha7)) ^~ ({(^~(|wire120)),
          $signed((wire114 ?
              wire120 : reg122))} * {$signed((wire123 ^ wire117)), wire123}));
      reg125 <= $signed((+({{wire114, wire117}} && {$signed(reg124)})));
      reg126 <= ((wire123 ?
              ($signed((wire116 >> reg124)) ^ wire115) : {(+wire116[(2'h3):(1'h1)])}) ?
          ({(-$signed(wire117))} ?
              {(^$signed(wire118)),
                  {$signed(wire115)}} : (wire118[(4'hc):(3'h6)] | reg125)) : {$unsigned(((reg124 >>> reg124) ?
                  (~^wire114) : (^reg125)))});
      reg127 <= (wire115[(1'h1):(1'h1)] * (reg122[(3'h6):(3'h4)] > $signed(($signed(reg126) ?
          $unsigned(reg125) : (~^(8'hab))))));
      reg128 <= $unsigned({wire115[(2'h3):(1'h0)],
          $unsigned(($signed((8'haa)) ?
              {wire116} : (wire123 ? (8'hb3) : wire114)))});
    end
  assign wire129 = ((~|(~^(~&$unsigned(reg128)))) < (^~(~&wire120[(2'h2):(2'h2)])));
  assign wire130 = $unsigned($unsigned(wire119[(4'hb):(4'h9)]));
  assign wire131 = $signed(reg127);
  assign wire132 = wire116[(3'h5):(3'h5)];
  assign wire133 = {(&$unsigned({$unsigned(wire121), wire120})), wire120};
  always
    @(posedge clk) begin
      reg134 <= ((wire116[(1'h0):(1'h0)] ?
          (|wire131) : (~reg122[(1'h0):(1'h0)])) * $unsigned(((((8'hb3) + (8'ha5)) ?
              $signed(wire131) : (|wire119)) ?
          $unsigned((^~wire120)) : reg127[(2'h3):(1'h0)])));
      reg135 <= (8'hb2);
      if (reg135)
        begin
          reg136 <= (~&(($signed((wire120 ~^ (8'hae))) ?
              (&$unsigned(wire132)) : (+(wire129 ?
                  wire118 : wire123))) && $signed((((8'h9e) ? reg126 : reg126) ?
              {wire120} : wire117))));
          reg137 <= {$unsigned({(wire132 ?
                      $signed(wire115) : $unsigned(wire117))})};
          reg138 <= (wire129 << $unsigned((~^(~^$signed(reg126)))));
          reg139 <= wire115[(1'h1):(1'h0)];
        end
      else
        begin
          reg136 <= (+wire116);
          reg137 <= (8'ha0);
        end
    end
  assign wire140 = $signed({reg125[(3'h4):(1'h0)]});
  assign wire141 = (8'hab);
  assign wire142 = reg139[(3'h5):(2'h2)];
  assign wire143 = $signed($signed(wire130[(4'ha):(3'h7)]));
  assign wire144 = wire117[(1'h0):(1'h0)];
  assign wire145 = (($unsigned(wire142[(4'ha):(4'h9)]) | ({(wire119 ?
                           wire116 : (8'ha2))} ~^ wire129)) <= wire142);
  always
    @(posedge clk) begin
      reg146 <= $unsigned(wire116[(4'hc):(1'h0)]);
      reg147 <= (reg136[(4'hc):(1'h0)] ?
          $unsigned($signed(((+wire119) <<< ((8'ha5) || wire132)))) : (+(!(wire143[(4'hb):(2'h3)] * (wire132 ?
              (8'hb8) : reg124)))));
      if (wire120[(4'he):(2'h2)])
        begin
          reg148 <= (+{$signed(reg122)});
          reg149 <= (~wire142[(2'h3):(1'h0)]);
          reg150 <= (-reg122[(4'he):(1'h1)]);
        end
      else
        begin
          if (wire130)
            begin
              reg148 <= ((~^wire116[(4'hf):(3'h5)]) >= (!$signed(reg124[(2'h3):(2'h2)])));
              reg149 <= reg126[(4'hf):(4'hd)];
            end
          else
            begin
              reg148 <= $signed(($signed($signed(wire131[(1'h1):(1'h1)])) | wire131));
            end
          reg150 <= ($signed((wire114 != wire123)) >>> $unsigned(((wire116[(4'h8):(3'h4)] < $signed((8'ha0))) <= ((reg134 ?
                  (8'ha1) : reg138) ?
              {wire141} : wire117))));
          reg151 <= $signed((wire141 ?
              (!reg124) : (($signed(reg149) ? (+wire121) : (~&wire119)) ?
                  reg128[(3'h5):(3'h5)] : {(~|wire121), $signed(wire130)})));
          if ({($unsigned(reg136) ?
                  (~|wire123[(1'h1):(1'h0)]) : {{(reg125 << (8'ha8))}}),
              $unsigned(reg134[(3'h4):(2'h2)])})
            begin
              reg152 <= reg147;
            end
          else
            begin
              reg152 <= reg150;
              reg153 <= ((~|$signed(wire140)) ?
                  ((reg125 != $unsigned(wire132)) ^~ reg138[(4'ha):(1'h1)]) : ($signed((|(-(8'ha0)))) ^ ($unsigned($signed(wire131)) ?
                      ((wire141 - (8'hb0)) ?
                          reg134 : wire117) : $signed($unsigned((8'hbd))))));
            end
          if ({((reg122 | reg147[(4'ha):(4'h9)]) - $signed(reg153[(1'h0):(1'h0)]))})
            begin
              reg154 <= ((~&((wire114 ?
                      ((8'hb6) ? (8'ha2) : reg149) : (-(7'h40))) ?
                  (reg148[(4'h9):(1'h1)] + $signed((7'h43))) : reg149[(3'h4):(2'h3)])) > $signed($unsigned((-reg152[(4'hd):(4'h9)]))));
              reg155 <= $signed($unsigned(reg135[(4'h9):(2'h3)]));
              reg156 <= (^reg137[(3'h4):(1'h0)]);
            end
          else
            begin
              reg154 <= ($unsigned(($signed(reg126[(4'hb):(4'h8)]) <<< reg151[(3'h6):(1'h0)])) ?
                  wire118 : ($signed((8'ha1)) ?
                      (reg148 & reg124) : (reg136 < $unsigned((reg135 ?
                          wire141 : reg146)))));
              reg155 <= (reg146[(2'h2):(1'h0)] + reg122[(4'hd):(4'ha)]);
              reg156 <= ((~(-$unsigned($unsigned(wire130)))) ~^ wire120);
            end
        end
      reg157 <= reg146;
    end
  always
    @(posedge clk) begin
      reg158 <= (-(^$signed(($signed(reg148) ?
          (&reg147) : $unsigned((8'hb3))))));
      if (({(($signed(reg151) ? $unsigned((8'h9c)) : wire115[(1'h1):(1'h1)]) ?
              $signed(reg139[(1'h1):(1'h1)]) : (&(reg155 ?
                  reg149 : wire120)))} >= ($unsigned(($unsigned(wire140) ?
              (wire141 ? wire129 : wire116) : (wire133 ? reg152 : reg128))) ?
          wire142[(4'h9):(3'h6)] : wire129[(5'h13):(4'hf)])))
        begin
          if (wire133)
            begin
              reg159 <= {reg135[(1'h1):(1'h0)],
                  {$unsigned(reg135[(4'h9):(3'h5)])}};
              reg160 <= (&(($unsigned((wire142 << reg138)) < $signed((|reg136))) ?
                  wire145[(2'h3):(2'h3)] : reg155[(3'h6):(2'h3)]));
              reg161 <= wire114;
            end
          else
            begin
              reg159 <= wire145;
              reg160 <= (8'ha6);
              reg161 <= ({$signed(wire119),
                  ($signed((wire132 ?
                      reg139 : reg148)) ~^ (~^(reg126 << reg155)))} <<< wire131);
            end
          if (wire120)
            begin
              reg162 <= reg152;
              reg163 <= (+($unsigned(reg146[(1'h1):(1'h0)]) ?
                  $unsigned($unsigned(wire130)) : $unsigned((8'haa))));
              reg164 <= wire115[(1'h1):(1'h1)];
              reg165 <= reg147[(1'h1):(1'h1)];
            end
          else
            begin
              reg162 <= $signed(reg157[(4'hd):(4'hc)]);
              reg163 <= $signed((($unsigned((reg155 <<< reg164)) ?
                      ($unsigned(reg138) ?
                          $unsigned(reg125) : reg155) : reg155[(3'h7):(2'h3)]) ?
                  (wire129 ?
                      (^~reg161) : $unsigned((&reg125))) : (($signed(reg150) && (^wire143)) ^~ $unsigned($unsigned(reg128)))));
              reg164 <= (reg126[(4'hd):(1'h0)] <= reg138[(4'h9):(3'h6)]);
            end
          reg166 <= $unsigned((reg162[(4'h9):(1'h0)] ?
              $signed(reg155) : $signed(((reg162 > wire114) ~^ {(8'ha4),
                  (8'hb2)}))));
          if ((^wire144))
            begin
              reg167 <= (!$unsigned(reg137));
              reg168 <= (reg134[(4'ha):(1'h0)] | ($unsigned(($unsigned((7'h40)) < reg128[(4'hc):(2'h3)])) < $unsigned($unsigned((reg165 - reg166)))));
              reg169 <= (&wire130);
            end
          else
            begin
              reg167 <= wire132;
            end
        end
      else
        begin
          if ((~((($signed(reg163) ^ $unsigned((8'ha3))) ?
                  reg153[(2'h2):(1'h1)] : (reg159[(3'h4):(1'h0)] ?
                      (wire144 < reg134) : ((8'hb5) ? (8'haf) : (8'hbf)))) ?
              ((((8'hb5) << wire131) & (~^wire114)) ~^ (((8'hae) <<< reg149) ^~ $signed(reg136))) : wire141[(1'h0):(1'h0)])))
            begin
              reg159 <= $signed(reg150[(1'h1):(1'h0)]);
              reg160 <= {(~&({(wire119 + reg167), $signed(reg149)} ?
                      (reg138 - $signed(reg147)) : ((reg125 ?
                          (8'ha2) : reg154) < (wire140 ^ reg159)))),
                  $signed(reg150[(3'h7):(2'h3)])};
              reg161 <= ($unsigned($unsigned(((wire115 ? reg146 : reg134) ?
                      reg167[(4'he):(2'h3)] : (wire115 >= (8'hab))))) ?
                  $unsigned({$signed({reg139,
                          (8'hbe)})}) : reg128[(3'h5):(2'h2)]);
              reg162 <= {reg165[(2'h3):(2'h3)]};
              reg163 <= $unsigned($unsigned((($signed(reg158) != reg138[(5'h10):(4'hb)]) != reg159)));
            end
          else
            begin
              reg159 <= (^~(+reg158));
              reg160 <= reg148;
              reg161 <= $signed(((((reg149 >> reg159) ?
                      ((8'h9f) < reg166) : (wire118 ^~ wire114)) ?
                  wire131 : $signed({wire114,
                      wire133})) ^~ reg164[(2'h3):(2'h3)]));
            end
          reg164 <= (wire145 ?
              (^reg154[(1'h0):(1'h0)]) : {$signed((~^$unsigned(wire118))),
                  (($unsigned(reg126) ?
                      $unsigned(wire116) : (reg169 >> wire141)) != reg166[(3'h7):(3'h7)])});
          reg165 <= (reg157[(4'hd):(4'ha)] ? reg168[(4'h9):(3'h7)] : reg139);
          reg166 <= (((8'ha0) ?
                  (($signed(reg146) & reg161) ?
                      (+reg153[(2'h3):(2'h2)]) : (|$unsigned(wire123))) : ((~^reg153[(2'h2):(1'h1)]) ?
                      {(reg161 ? reg158 : (8'hb4)),
                          (reg128 ? reg163 : wire132)} : ((wire117 ?
                          reg126 : reg125) >>> (7'h44)))) ?
              wire120[(4'hc):(3'h4)] : ((wire145 <= ((~&(8'hac)) >= (wire133 != wire123))) ?
                  reg128 : (|reg127[(4'h9):(3'h4)])));
          reg167 <= $unsigned($signed(($unsigned(reg147[(1'h0):(1'h0)]) < (8'ha6))));
        end
      reg170 <= (reg139 ?
          reg122 : $unsigned((~&$signed(reg151[(3'h6):(3'h5)]))));
      reg171 <= (($unsigned($unsigned(reg127[(4'hc):(2'h3)])) ?
              reg139[(4'hc):(4'h8)] : $signed($signed({reg152}))) ?
          $unsigned($signed({$unsigned(wire132)})) : (-$unsigned(wire133[(4'h9):(3'h4)])));
    end
endmodule

module module63  (y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h240):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire67;
  input wire signed [(2'h3):(1'h0)] wire66;
  input wire [(3'h5):(1'h0)] wire65;
  input wire signed [(3'h4):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(5'h11):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire101;
  wire signed [(5'h13):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire68;
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire101,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire68,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
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
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire68 = (^~(&$signed(((wire64 ^ wire64) >= {wire67, (8'ha2)}))));
  always
    @(posedge clk) begin
      if (wire65)
        begin
          if (wire68)
            begin
              reg69 <= wire64[(2'h2):(1'h1)];
              reg70 <= {(wire68[(1'h1):(1'h0)] <= (^~(!$signed(reg69)))),
                  $unsigned($signed(wire65))};
              reg71 <= ($unsigned(((wire64[(3'h4):(2'h3)] ?
                          ((8'ha5) || wire64) : $unsigned(wire66)) ?
                      ((reg69 ? (8'haa) : wire65) ?
                          $unsigned(wire68) : $unsigned(wire68)) : $signed($unsigned(wire68)))) ?
                  wire65[(3'h4):(3'h4)] : $unsigned((~&($unsigned(wire64) ?
                      $unsigned(reg69) : (reg70 >> wire68)))));
              reg72 <= {{(!$unsigned((wire68 ? wire67 : wire66))),
                      {wire67, (|wire64[(2'h3):(2'h2)])}},
                  ({$signed($unsigned(reg70))} == {$signed((-wire66))})};
            end
          else
            begin
              reg69 <= (8'ha2);
            end
        end
      else
        begin
          reg69 <= wire67;
        end
      reg73 <= reg69[(1'h0):(1'h0)];
      reg74 <= $signed(reg72[(4'h8):(1'h1)]);
      reg75 <= $signed((~|$unsigned($signed(wire64))));
      reg76 <= $signed({wire67,
          (~($signed(wire66) ? wire66 : (wire67 >>> reg75)))});
    end
  assign wire77 = (-reg72);
  assign wire78 = $signed($unsigned(($unsigned(wire77[(3'h4):(2'h3)]) >= (-(8'hb9)))));
  assign wire79 = $signed({$signed({(reg75 ? reg73 : (8'haa))})});
  assign wire80 = ((~^{wire64[(2'h3):(2'h2)]}) <<< $signed((^~((wire77 ?
                      (8'hb3) : wire77) & {reg74}))));
  assign wire81 = (reg76[(1'h0):(1'h0)] ~^ $signed($signed((reg73 ?
                      (wire67 ? (7'h40) : wire79) : {wire79, wire66}))));
  assign wire82 = (~&$unsigned($signed(($unsigned(wire67) ?
                      reg70[(4'ha):(1'h0)] : ((8'hab) ? reg76 : reg71)))));
  assign wire83 = $unsigned((|$unsigned($unsigned($unsigned(reg73)))));
  assign wire84 = (-(reg74[(4'ha):(3'h5)] << reg69));
  assign wire85 = (wire82 ?
                      (&wire84[(5'h10):(2'h3)]) : $unsigned(($signed((reg73 ?
                          (7'h43) : reg70)) - (wire68[(1'h1):(1'h0)] ?
                          (^~(8'hab)) : $signed(reg72)))));
  always
    @(posedge clk) begin
      if (((-wire84) ?
          $signed((wire66 ?
              (!(reg72 <<< reg73)) : ((&wire78) ?
                  wire82 : (wire79 + wire85)))) : ((wire85[(5'h13):(4'hd)] + (~^{wire78})) >>> $signed($signed((reg71 << wire78))))))
        begin
          reg86 <= (reg72[(3'h4):(3'h4)] ? {wire64[(1'h0):(1'h0)]} : reg76);
          reg87 <= (wire85[(5'h12):(5'h10)] - $unsigned((|($unsigned(wire82) ?
              (wire84 >= wire82) : (!wire84)))));
          if ($unsigned(({reg73[(3'h5):(2'h2)],
                  {wire85[(4'he):(2'h2)], $unsigned(reg86)}} ?
              reg74 : ((~&$unsigned(reg74)) ~^ {(~^reg76), (^(7'h41))}))))
            begin
              reg88 <= wire64;
              reg89 <= reg71;
            end
          else
            begin
              reg88 <= (($signed($signed(reg74)) ?
                      ($signed(reg86) * (wire77[(2'h3):(1'h1)] ?
                          (reg74 < reg71) : {reg71})) : reg87[(4'he):(4'ha)]) ?
                  ({$unsigned(wire80[(2'h2):(1'h1)])} + ((-$unsigned((8'hbe))) ?
                      $signed((reg69 ?
                          wire84 : reg87)) : (^~wire67[(2'h3):(2'h2)]))) : reg72[(4'h9):(2'h2)]);
              reg89 <= ((wire82[(1'h0):(1'h0)] ?
                  (((+wire77) ^~ $unsigned(wire79)) ?
                      wire81[(1'h0):(1'h0)] : reg88[(5'h14):(5'h12)]) : (7'h41)) == (~&$unsigned({wire64[(3'h4):(2'h3)],
                  $unsigned((8'hb2))})));
              reg90 <= ($signed($signed(reg69)) ? wire78 : wire78);
              reg91 <= $unsigned(($unsigned({$unsigned(reg87),
                  reg71[(2'h2):(2'h2)]}) < (($signed(wire83) * wire82) << $unsigned((reg73 << reg69)))));
              reg92 <= wire68;
            end
        end
      else
        begin
          reg86 <= (~|reg90[(1'h0):(1'h0)]);
          reg87 <= ($signed(wire68[(1'h1):(1'h1)]) ? wire79 : $unsigned(reg87));
          if ((|((wire77[(3'h4):(3'h4)] << {(reg73 ~^ wire64)}) ?
              wire78[(1'h0):(1'h0)] : $signed(wire79[(1'h0):(1'h0)]))))
            begin
              reg88 <= {(~&((~&(wire83 ? wire67 : reg70)) ?
                      ($signed(wire77) ?
                          (reg69 >> reg87) : (~wire78)) : ((wire83 ~^ wire78) ^~ (7'h40)))),
                  $signed($unsigned(reg74[(1'h1):(1'h1)]))};
              reg89 <= reg74[(4'h9):(2'h3)];
            end
          else
            begin
              reg88 <= (!wire79);
              reg89 <= $signed(reg89[(4'hb):(2'h2)]);
              reg90 <= {reg72};
            end
        end
      reg93 <= reg75;
      reg94 <= (!wire85);
      if ((reg91[(1'h1):(1'h1)] ~^ {reg69[(2'h2):(1'h0)], reg75}))
        begin
          reg95 <= {reg87[(4'hc):(2'h3)]};
        end
      else
        begin
          if ((~&(reg91 >>> reg95[(5'h10):(2'h2)])))
            begin
              reg95 <= $signed($unsigned((&(8'ha0))));
              reg96 <= $signed($signed($signed(((wire81 >>> wire84) ?
                  $signed(wire66) : {wire80, wire85}))));
            end
          else
            begin
              reg95 <= $unsigned($unsigned((~|(8'hb7))));
              reg96 <= ($unsigned(reg91) == (~&(({reg90, (8'hbe)} ?
                      (reg71 * wire65) : $unsigned(wire83)) ?
                  $unsigned($unsigned(wire82)) : ($unsigned(reg69) >= $signed((8'h9d))))));
              reg97 <= $signed(reg75[(3'h6):(1'h0)]);
              reg98 <= wire67;
              reg99 <= wire64[(2'h3):(2'h2)];
            end
        end
      reg100 <= reg69[(4'h9):(3'h6)];
    end
  assign wire101 = wire81[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      reg102 <= $signed(({reg97[(5'h11):(3'h4)], reg87} << {(&(reg86 ?
              reg90 : wire67)),
          (&$signed(reg91))}));
      reg103 <= wire67;
      reg104 <= (~{(((wire66 ? reg74 : reg98) * (reg96 ? reg71 : (8'hb9))) ?
              wire81[(3'h6):(1'h0)] : $unsigned((!reg92)))});
      reg105 <= (((~reg71[(3'h7):(2'h3)]) * (reg89 >> {reg91})) >= (~|reg71[(3'h7):(3'h7)]));
    end
  always
    @(posedge clk) begin
      reg106 <= wire64[(1'h1):(1'h1)];
      reg107 <= reg98;
    end
  assign wire108 = $unsigned($unsigned($unsigned((~|reg104[(4'h9):(2'h3)]))));
  assign wire109 = $signed((8'ha1));
  assign wire110 = wire81;
endmodule

module module16
#(parameter param57 = ((({(+(8'ha5)), ((8'hbf) + (8'had))} ? ((~&(8'hbe)) ? (|(8'hb7)) : (8'hb4)) : (+(~(8'had)))) ? ((~&(8'hbc)) ? (((8'haa) != (8'h9d)) ? ((8'hbe) != (8'hb9)) : ((8'hb9) <= (8'hb6))) : (~^((8'ha3) > (8'ha2)))) : ({((8'hb8) ? (8'h9f) : (8'haa))} * (|(^~(8'had))))) ? {(((+(8'hb4)) <= ((8'ha6) ^ (8'h9e))) <<< (((8'ha0) == (8'hb7)) | (^~(7'h44))))} : {{{(8'hbe), (~|(8'hb2))}}}), 
parameter param58 = {(((!(param57 == (8'h9c))) | (param57 ? (param57 && param57) : (param57 ? param57 : param57))) - (^~((~&param57) - (param57 >> param57))))})
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire signed [(3'h6):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire23,
                 wire22,
                 wire21,
                 reg53,
                 reg52,
                 reg51,
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
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire21 = (^((8'ha2) != wire17));
  assign wire22 = {(+(wire20 ?
                          {((8'had) | wire19),
                              {wire17}} : $signed((~^wire20))))};
  assign wire23 = {{$unsigned(($signed(wire17) ?
                              wire19[(4'ha):(2'h3)] : $signed((8'haf))))},
                      {wire18, $unsigned($signed((&wire18)))}};
  always
    @(posedge clk) begin
      reg24 <= wire18[(1'h1):(1'h1)];
      reg25 <= {(($signed($signed(wire21)) >>> $signed(reg24[(2'h2):(1'h1)])) >>> (^~$signed({wire17}))),
          (|wire23[(4'hc):(3'h7)])};
      reg26 <= $unsigned(({wire19} ?
          ((+(~|(8'hb8))) ?
              wire23[(5'h14):(1'h1)] : {wire19[(2'h3):(1'h0)],
                  $signed(wire23)}) : ($unsigned((wire22 ^ wire20)) + ((wire20 <= wire19) - $signed(wire17)))));
    end
  assign wire27 = $unsigned(wire18);
  assign wire28 = ($signed((-(~$unsigned((8'ha0))))) ?
                      wire23[(4'ha):(1'h1)] : (^~$signed((-reg25))));
  assign wire29 = reg24[(4'ha):(4'ha)];
  assign wire30 = (((^($signed(reg26) >> wire23[(4'he):(4'ha)])) ?
                      (~^reg24) : {$unsigned((wire18 + wire21))}) != wire21[(1'h1):(1'h0)]);
  assign wire31 = wire27[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg32 <= $signed($unsigned($signed($signed((~&reg26)))));
      reg33 <= $signed($signed((({(8'hae)} + (wire31 ?
          wire17 : reg26)) == ($signed(reg26) ?
          wire27[(1'h1):(1'h0)] : (~reg25)))));
      reg34 <= reg32;
      if (reg26[(1'h1):(1'h0)])
        begin
          if ($signed(((((reg32 ?
                  (8'hbd) : (8'h9e)) <= (~|reg34)) <= wire23[(3'h4):(1'h1)]) ?
              wire17[(2'h2):(1'h0)] : ((((8'had) ? (7'h44) : wire29) ?
                  $signed(wire30) : $unsigned(reg33)) == {(wire23 ?
                      reg24 : wire30)}))))
            begin
              reg35 <= wire28;
            end
          else
            begin
              reg35 <= $unsigned((&(wire23[(4'hc):(4'hb)] ?
                  (^reg32[(4'ha):(3'h6)]) : $unsigned({wire21, wire20}))));
              reg36 <= {((^wire29[(5'h11):(4'hc)]) ?
                      wire23[(5'h10):(2'h2)] : $signed($unsigned(wire28[(2'h2):(1'h0)])))};
              reg37 <= $signed(wire20);
            end
          reg38 <= $signed(($signed((wire19 ?
              wire28[(1'h0):(1'h0)] : (wire28 > wire30))) >> {reg33,
              $signed(reg26)}));
          reg39 <= reg25[(4'hb):(2'h2)];
          reg40 <= wire17;
        end
      else
        begin
          reg35 <= reg34[(3'h5):(3'h4)];
          reg36 <= $signed(reg37[(4'h9):(3'h5)]);
          reg37 <= ((~|wire17) || {reg33});
          if ((reg37[(4'h9):(4'h9)] & reg37[(4'ha):(2'h2)]))
            begin
              reg38 <= (&$signed((($signed(wire22) + (reg40 & (8'hbf))) ?
                  $unsigned($signed(wire21)) : $unsigned(wire29))));
              reg39 <= reg35;
            end
          else
            begin
              reg38 <= {wire29,
                  ($signed({(8'ha7)}) ?
                      ((+reg40[(3'h4):(3'h4)]) ?
                          $signed((wire31 != reg24)) : reg34) : ((~|$signed(reg32)) > ((wire27 > reg26) ?
                          $signed(wire19) : reg39[(1'h1):(1'h1)])))};
              reg39 <= ($unsigned($signed((~|reg38[(4'h8):(2'h2)]))) ?
                  (^(($unsigned(wire20) ^ $signed(reg33)) >> {(~^wire29)})) : ($unsigned((~|$signed(reg34))) == wire18[(1'h1):(1'h1)]));
              reg40 <= $signed((((8'hba) ?
                      $unsigned((wire20 <= reg33)) : ($unsigned(wire31) << (reg37 ?
                          (8'ha9) : wire19))) ?
                  reg25[(3'h7):(3'h6)] : $signed({(reg37 ? reg40 : wire20)})));
              reg41 <= (~^reg32[(4'hc):(4'hb)]);
              reg42 <= wire23;
            end
          reg43 <= ($signed((reg32 ? reg32 : (wire18 + reg33))) ?
              $unsigned(wire30) : wire18[(3'h6):(3'h4)]);
        end
    end
  assign wire44 = reg40;
  assign wire45 = (reg38 ?
                      ((-reg33) & (8'h9f)) : (wire30 << $unsigned($unsigned(wire31[(4'h8):(3'h4)]))));
  assign wire46 = $unsigned($signed($unsigned(reg24)));
  assign wire47 = ($signed(((~&$signed(reg34)) | $signed(wire28))) ~^ (~&(~^reg39)));
  assign wire48 = reg37;
  assign wire49 = (!($signed(reg38) ^ (~($unsigned(reg37) ?
                      ((7'h43) << wire46) : {reg41, (8'hbc)}))));
  assign wire50 = $unsigned($unsigned($signed({{reg37, wire29}})));
  always
    @(posedge clk) begin
      reg51 <= ($signed($unsigned((&(~wire49)))) + (!(($unsigned(reg35) ?
              $unsigned(reg34) : (+wire28)) ?
          $signed(reg33[(3'h7):(1'h1)]) : wire18[(1'h1):(1'h0)])));
      reg52 <= ((wire23 ?
          reg26[(2'h3):(2'h3)] : $unsigned((!reg51))) <<< $unsigned((+reg41)));
      reg53 <= $signed(($unsigned($signed($unsigned(wire18))) ?
          $unsigned(wire17[(3'h7):(1'h1)]) : (~|$unsigned({wire22, reg51}))));
    end
  assign wire54 = (~|(wire44[(4'hc):(4'hb)] ?
                      (($unsigned((8'hb0)) ? ((7'h41) ^~ reg43) : (~&wire31)) ?
                          (!(+reg40)) : {$signed(wire21)}) : $unsigned($signed($signed(wire45)))));
  assign wire55 = $unsigned(({wire49[(3'h7):(3'h4)], (-wire54)} ?
                      (($unsigned(reg34) << wire45[(3'h4):(3'h4)]) ?
                          $signed($signed(wire45)) : {$unsigned(wire18),
                              (7'h41)}) : {$signed($signed(reg24))}));
  assign wire56 = (+reg43);
endmodule
