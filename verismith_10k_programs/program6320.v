module top
#(parameter param219 = ((~^({(&(8'h9c)), ((8'hb4) >> (8'hac))} ? ({(8'hb8), (8'h9c)} >> ((8'ha3) || (8'haa))) : ((+(7'h42)) - ((8'ha9) ? (8'hb0) : (8'h9d))))) ? (((((7'h41) || (8'h9e)) << ((8'hb8) ? (8'hb8) : (8'hae))) ? (+(8'hb5)) : (&((8'haf) >>> (7'h41)))) >> ((-{(8'h9c)}) ? (-((8'ha0) || (8'hbc))) : (~^((8'ha6) ? (8'hab) : (8'ha2))))) : {(&(~&((8'hbd) * (8'hb9)))), ((((8'hbd) ? (8'h9e) : (8'ha4)) ^ ((8'hbb) ? (8'hbd) : (8'hbd))) & ((~(8'haa)) && ((8'ha0) ? (8'hb9) : (8'hb1))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire193;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire195;
  wire signed [(5'h14):(1'h0)] wire196;
  wire signed [(5'h11):(1'h0)] wire197;
  wire [(4'hf):(1'h0)] wire198;
  wire signed [(3'h6):(1'h0)] wire217;
  reg [(3'h6):(1'h0)] reg216 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg215 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg214 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg213 = (1'h0);
  reg [(4'hb):(1'h0)] reg212 = (1'h0);
  reg [(4'h8):(1'h0)] reg211 = (1'h0);
  reg [(2'h2):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg208 = (1'h0);
  reg [(3'h4):(1'h0)] reg207 = (1'h0);
  reg [(3'h6):(1'h0)] reg206 = (1'h0);
  reg [(5'h11):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg203 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg202 = (1'h0);
  reg signed [(4'he):(1'h0)] reg201 = (1'h0);
  reg [(3'h7):(1'h0)] reg200 = (1'h0);
  reg [(5'h13):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire193,
                 wire6,
                 wire5,
                 wire195,
                 wire196,
                 wire197,
                 wire198,
                 wire217,
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
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = {(($signed((wire3 ?
                         wire2 : (8'ha1))) == wire2[(4'hd):(4'h8)]) >> $signed({(-wire2)}))};
  assign wire6 = wire3;
  always
    @(posedge clk) begin
      reg7 <= (!(7'h44));
      reg8 <= (^~(reg7[(3'h6):(1'h0)] ?
          $signed(((reg7 || wire3) ?
              wire3[(3'h5):(3'h4)] : wire1)) : $unsigned(wire6)));
      if ((wire0[(3'h5):(1'h0)] < $unsigned((&$unsigned((wire1 ?
          wire3 : wire5))))))
        begin
          if (reg8)
            begin
              reg9 <= (^~wire5[(3'h4):(2'h2)]);
            end
          else
            begin
              reg9 <= (|$signed(((^~wire2) & (8'hba))));
            end
        end
      else
        begin
          reg9 <= wire6;
          reg10 <= wire0[(3'h4):(2'h3)];
          reg11 <= (-($unsigned($signed(wire0)) >> reg9));
          reg12 <= (!$signed($unsigned((wire6[(3'h6):(3'h5)] ?
              wire6 : wire3[(4'h8):(1'h0)]))));
        end
    end
  module13 #() modinst194 (.clk(clk), .wire18(wire2), .wire17(reg12), .wire16(reg9), .wire15(wire0), .wire14(wire1), .y(wire193));
  assign wire195 = {(^$unsigned({(8'hb2), reg9})),
                       $signed({(&$unsigned(wire2))})};
  assign wire196 = (((^~$unsigned({wire193, reg10})) ?
                           ($signed(wire193) >> ((!wire5) ?
                               ((7'h42) ?
                                   wire5 : wire195) : (wire4 + reg9))) : $unsigned(wire3[(3'h5):(3'h5)])) ?
                       ((+($unsigned(wire2) ?
                           (~^wire6) : wire0[(3'h5):(3'h5)])) | (wire0[(2'h2):(2'h2)] ?
                           ((^reg8) < wire193) : wire0)) : wire3[(2'h2):(2'h2)]);
  assign wire197 = wire2[(1'h1):(1'h0)];
  assign wire198 = {{$signed(((wire2 ? wire2 : wire4) + ((8'hbe) >>> wire1))),
                           wire1},
                       (+(($unsigned(reg8) ^~ (8'hae)) ?
                           (wire3 >> (-wire2)) : (^~$unsigned(wire193))))};
  always
    @(posedge clk) begin
      if (wire4)
        begin
          reg199 <= reg9;
          reg200 <= wire6;
          reg201 <= $signed(wire5[(3'h7):(2'h3)]);
          if ($unsigned((!($signed(reg199[(2'h3):(1'h0)]) ?
              $unsigned((^~reg201)) : (~^$signed((8'hb5)))))))
            begin
              reg202 <= {(!{$unsigned((~&reg8)),
                      ((reg10 ? wire195 : reg8) ^~ (reg8 >> reg201))}),
                  $signed((~&((~|wire195) ?
                      (wire193 ? reg12 : wire4) : (wire193 != (8'hbd)))))};
              reg203 <= (~|$unsigned(wire5[(4'hf):(4'h8)]));
            end
          else
            begin
              reg202 <= (8'h9f);
              reg203 <= reg203;
            end
        end
      else
        begin
          reg199 <= (&wire4[(3'h7):(1'h1)]);
        end
      reg204 <= (reg202 ? reg8[(4'ha):(2'h3)] : (8'hb8));
      if (reg12[(3'h5):(3'h5)])
        begin
          reg205 <= ((^~({(wire6 ? wire196 : (8'haa)),
                  (~|reg204)} >> $unsigned((|(7'h41))))) ?
              $signed($unsigned({((8'hba) ? reg8 : reg10),
                  $signed((8'hb4))})) : {reg200[(2'h3):(1'h0)]});
          if ((((!{((7'h42) ? (8'hba) : (8'ha4)),
                  (reg9 ? reg12 : wire0)}) - reg202[(3'h7):(2'h2)]) ?
              $unsigned(wire197[(4'he):(4'hd)]) : (8'hb7)))
            begin
              reg206 <= reg201[(4'h9):(3'h6)];
              reg207 <= $unsigned({(($unsigned((8'hbb)) ?
                          wire197[(3'h4):(2'h3)] : {reg9, (7'h42)}) ?
                      $unsigned((8'hb3)) : ((+wire5) < (^(8'hab))))});
              reg208 <= {reg200[(3'h6):(3'h6)]};
            end
          else
            begin
              reg206 <= reg203[(3'h4):(2'h3)];
              reg207 <= ($unsigned(reg202) ?
                  (&(~$unsigned((wire1 ?
                      wire0 : (8'haf))))) : $signed(((~&$unsigned(reg208)) | {$signed((8'had)),
                      $signed(wire2)})));
              reg208 <= $unsigned(wire198);
              reg209 <= {(&wire196)};
            end
          if (wire197)
            begin
              reg210 <= reg203[(2'h3):(1'h0)];
              reg211 <= $signed((($unsigned(wire0[(3'h5):(2'h3)]) ?
                      ((reg203 ?
                          (8'hb6) : reg210) <= reg7[(4'ha):(2'h2)]) : {(reg10 == reg210)}) ?
                  $signed({reg7,
                      (wire198 > reg205)}) : (|$unsigned((reg7 >> wire5)))));
              reg212 <= wire198;
            end
          else
            begin
              reg210 <= (reg10 ? $unsigned(wire6) : $unsigned($signed(reg11)));
              reg211 <= $unsigned(reg205[(4'hc):(4'hc)]);
              reg212 <= $signed($signed((~($signed(reg212) ?
                  reg9 : $unsigned(reg11)))));
            end
          if ($unsigned((!{$unsigned($signed((7'h44)))})))
            begin
              reg213 <= wire3;
            end
          else
            begin
              reg213 <= (wire2[(4'h8):(1'h0)] ? reg7[(4'hb):(4'h9)] : (8'ha0));
              reg214 <= ((-wire5) ?
                  (&$signed((8'hb8))) : $signed((^(&(reg212 ?
                      (8'hbe) : wire4)))));
            end
          reg215 <= ((reg214[(2'h2):(1'h1)] ?
              reg200[(2'h2):(2'h2)] : (+{(^~reg210)})) << $unsigned($unsigned((^~$signed((8'ha5))))));
        end
      else
        begin
          reg205 <= ((^({(!wire3)} ?
              (8'hb9) : reg202[(3'h6):(1'h1)])) * reg199[(1'h0):(1'h0)]);
          reg206 <= reg206[(3'h5):(1'h1)];
          if ($unsigned((reg199[(1'h1):(1'h0)] ?
              wire0[(2'h3):(2'h3)] : $signed((+(~^reg201))))))
            begin
              reg207 <= {$unsigned(reg201[(2'h3):(2'h3)]),
                  wire193[(3'h4):(3'h4)]};
            end
          else
            begin
              reg207 <= wire198;
            end
        end
      reg216 <= $unsigned((wire1[(4'hb):(4'h9)] ?
          $unsigned(reg10[(2'h2):(2'h2)]) : {$signed(reg206[(1'h1):(1'h1)]),
              (-$unsigned(wire193))}));
    end
  module164 #() modinst218 (.wire168(reg8), .wire165(wire196), .wire167(reg204), .wire169(reg10), .wire166(reg201), .y(wire217), .clk(clk));
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire16;
  input wire signed [(5'h10):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire192;
  wire signed [(5'h15):(1'h0)] wire162;
  wire [(5'h10):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire111;
  wire signed [(2'h3):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire89;
  wire [(5'h15):(1'h0)] wire88;
  wire signed [(5'h14):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire190;
  assign y = {wire192,
                 wire162,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire106,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire45,
                 wire47,
                 wire83,
                 wire190,
                 (1'h0)};
  module19 #() modinst46 (wire45, clk, wire17, wire16, wire14, wire18, wire15);
  assign wire47 = wire17;
  module48 #() modinst84 (.wire49(wire18), .wire52(wire17), .clk(clk), .wire50(wire47), .wire51(wire16), .y(wire83), .wire53(wire14));
  assign wire85 = $signed($signed($signed($unsigned((wire18 != (8'h9c))))));
  assign wire86 = wire85;
  assign wire87 = (!({wire14[(4'h9):(2'h3)],
                      (^{(8'hb7), wire47})} == $unsigned((|wire14))));
  assign wire88 = ($unsigned({$signed(wire87[(3'h6):(1'h1)]),
                      $signed((wire14 + wire15))}) ~^ (~$unsigned(wire16[(5'h15):(5'h11)])));
  assign wire89 = $unsigned($signed($signed($unsigned(wire87[(3'h7):(3'h6)]))));
  assign wire90 = $unsigned((((~|{wire47}) ?
                      (~&wire14) : ((-wire88) ^~ wire83)) + {((wire18 <<< wire83) & (wire83 || wire17)),
                      $signed($signed(wire15))}));
  assign wire91 = ({$signed(((^~(8'ha5)) >> wire87))} >= ((&$signed({wire16,
                          wire87})) ?
                      $unsigned((8'h9e)) : $unsigned($signed(wire87[(4'h9):(2'h3)]))));
  assign wire92 = {wire47[(3'h5):(1'h0)]};
  assign wire93 = $signed({$unsigned(({wire47} ^ wire16[(3'h6):(3'h6)]))});
  module94 #() modinst107 (.wire97(wire15), .y(wire106), .clk(clk), .wire98(wire83), .wire95(wire88), .wire96(wire87));
  assign wire108 = (^~((&$unsigned({(8'ha0),
                       (7'h42)})) >> (wire88[(3'h7):(2'h2)] ?
                       $unsigned((^~(8'hae))) : $signed(wire88))));
  assign wire109 = wire18[(5'h10):(1'h0)];
  assign wire110 = (!wire108[(2'h2):(2'h2)]);
  assign wire111 = {(&(((wire88 >>> wire86) ? $signed(wire45) : wire15) ?
                           $unsigned($signed(wire93)) : ((~|(7'h41)) ?
                               $signed(wire110) : wire45))),
                       wire16[(5'h13):(2'h2)]};
  assign wire112 = $signed(($signed((wire108[(4'hc):(4'h8)] - (wire106 || (8'hae)))) | wire47[(1'h1):(1'h0)]));
  assign wire113 = {($unsigned($signed((|wire83))) ?
                           (wire92[(1'h1):(1'h0)] > ($signed(wire15) ?
                               $unsigned(wire47) : $signed(wire85))) : (!$signed($unsigned(wire93)))),
                       wire91};
  module114 #() modinst163 (wire162, clk, wire113, wire92, wire91, wire86, wire18);
  module164 #() modinst191 (.wire166(wire18), .wire169(wire90), .y(wire190), .clk(clk), .wire167(wire16), .wire165(wire93), .wire168(wire15));
  assign wire192 = ((wire113 ?
                       wire190[(1'h1):(1'h1)] : wire108[(5'h14):(5'h13)]) >= {wire108[(4'ha):(1'h1)]});
endmodule

module module164
#(parameter param188 = ((({((8'hbc) ? (8'haa) : (8'hb2)), ((8'h9e) ^~ (8'ha1))} || (((8'hbc) ? (8'ha6) : (7'h44)) ? ((8'ha9) ? (8'hac) : (8'hac)) : (8'hb7))) ? ((|(~|(8'ha5))) >> (7'h42)) : (~{((8'ha8) & (8'h9e)), (-(8'hbb))})) ? (~&{{{(8'hb2), (8'hbd)}}, (((8'had) ? (8'h9e) : (8'had)) >> ((8'ha4) ? (8'ha9) : (8'had)))}) : (((-((8'ha5) ^ (8'hbc))) ? (((8'ha7) ? (8'hb3) : (7'h42)) ? ((8'hb9) ? (8'hbd) : (7'h40)) : ((8'hac) && (8'ha6))) : (((8'hb0) ? (8'hba) : (8'hbb)) ? {(8'haa), (8'ha0)} : (|(7'h41)))) != (!{(|(8'ha6))}))), 
parameter param189 = ((param188 ? (^~(~&{param188})) : ((|{(8'ha9)}) + {param188, (^~param188)})) * {param188}))
(y, clk, wire169, wire168, wire167, wire166, wire165);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire169;
  input wire signed [(4'hf):(1'h0)] wire168;
  input wire signed [(5'h14):(1'h0)] wire167;
  input wire [(4'he):(1'h0)] wire166;
  input wire [(5'h14):(1'h0)] wire165;
  wire [(4'he):(1'h0)] wire184;
  wire [(3'h5):(1'h0)] wire183;
  wire signed [(5'h13):(1'h0)] wire182;
  wire [(4'hc):(1'h0)] wire181;
  wire [(3'h7):(1'h0)] wire172;
  wire [(5'h15):(1'h0)] wire171;
  wire [(4'hf):(1'h0)] wire170;
  reg signed [(4'ha):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg178 = (1'h0);
  reg [(5'h12):(1'h0)] reg177 = (1'h0);
  reg [(4'hf):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg174 = (1'h0);
  reg [(5'h10):(1'h0)] reg173 = (1'h0);
  assign y = {wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire172,
                 wire171,
                 wire170,
                 reg187,
                 reg186,
                 reg185,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 (1'h0)};
  assign wire170 = wire165[(5'h11):(5'h10)];
  assign wire171 = $unsigned((|wire170));
  assign wire172 = wire169[(5'h10):(4'hb)];
  always
    @(posedge clk) begin
      reg173 <= (8'ha1);
      if (wire172)
        begin
          reg174 <= (!wire167[(3'h4):(2'h2)]);
          if (($signed(wire171) ? wire168 : (8'ha1)))
            begin
              reg175 <= ({((wire168 | reg174) * ($unsigned(wire172) ?
                      (|(8'haf)) : (wire172 > wire168))),
                  ($signed($unsigned(wire170)) ?
                      $unsigned(wire168) : wire167)} | (-{((wire168 ?
                      wire165 : reg173) + wire170)}));
              reg176 <= $unsigned($signed(wire169));
              reg177 <= (^~($signed({(~wire172)}) ?
                  reg173[(4'hc):(3'h5)] : (((&(8'h9c)) ?
                      $signed(wire172) : (wire170 ?
                          wire169 : reg173)) < $unsigned({reg174}))));
              reg178 <= reg175[(4'h8):(4'h8)];
              reg179 <= $signed($unsigned(({$signed((8'hb5)), $signed(reg178)} ?
                  (7'h44) : (!{wire172, wire168}))));
            end
          else
            begin
              reg175 <= $signed((-(-((wire171 < wire172) ~^ (reg177 || wire172)))));
            end
          reg180 <= wire169;
        end
      else
        begin
          reg174 <= ((reg178 & $signed(wire169[(4'h9):(3'h6)])) + (wire170[(4'h8):(1'h1)] | wire170[(2'h3):(2'h2)]));
          reg175 <= ((wire169 | (reg179 == {wire171[(4'hd):(1'h1)],
              $signed((7'h44))})) >> wire166);
          reg176 <= reg180[(4'hb):(1'h1)];
        end
    end
  assign wire181 = (reg174[(2'h2):(1'h1)] + (reg174 ~^ $signed(wire171[(5'h14):(4'h9)])));
  assign wire182 = $signed(wire170);
  assign wire183 = wire181;
  assign wire184 = wire170[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg185 <= $signed({$unsigned($unsigned((&(8'had)))),
          (!($signed(wire184) == {wire169}))});
      reg186 <= $signed((reg173 ^~ (reg177[(4'ha):(4'h8)] ?
          wire171 : wire165)));
      reg187 <= wire168;
    end
endmodule

module module114
#(parameter param160 = ({(~{((8'ha8) - (7'h43))})} ^~ (^~{(((8'ha1) ? (8'hbf) : (8'hb0)) - ((8'had) > (8'ha5)))})), 
parameter param161 = (8'ha4))
(y, clk, wire119, wire118, wire117, wire116, wire115);
  output wire [(32'h1bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire119;
  input wire [(2'h2):(1'h0)] wire118;
  input wire [(4'hd):(1'h0)] wire117;
  input wire [(3'h5):(1'h0)] wire116;
  input wire [(2'h2):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire159;
  wire [(3'h6):(1'h0)] wire150;
  wire [(5'h10):(1'h0)] wire149;
  wire [(2'h2):(1'h0)] wire147;
  reg [(2'h2):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg155 = (1'h0);
  reg [(5'h11):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg143 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(4'he):(1'h0)] reg140 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg136 = (1'h0);
  reg [(4'hb):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg133 = (1'h0);
  reg [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  assign y = {wire159,
                 wire150,
                 wire149,
                 wire147,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg148,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg120 <= $signed((|(({wire115} ^~ (wire116 << wire115)) ?
          {wire118[(2'h2):(1'h1)]} : ((7'h40) * (wire118 < (8'hb2))))));
    end
  always
    @(posedge clk) begin
      reg121 <= wire116;
      if ((wire118[(1'h0):(1'h0)] ?
          (($signed(((8'ha2) << wire117)) ?
              (((8'ha0) ? reg121 : wire118) ?
                  reg120 : $unsigned(wire116)) : ((reg121 ?
                  reg120 : wire117) == $signed(wire119))) | $signed(((reg120 <= wire117) && reg120))) : $signed(wire116)))
        begin
          if ($signed(wire118[(1'h1):(1'h1)]))
            begin
              reg122 <= (+$signed((reg121 << (8'hb2))));
              reg123 <= wire115;
              reg124 <= reg120[(4'hf):(2'h2)];
              reg125 <= $unsigned($signed((+{reg124, reg121})));
              reg126 <= ($signed(wire117) << $unsigned(($unsigned($unsigned(reg120)) != $unsigned($unsigned(wire118)))));
            end
          else
            begin
              reg122 <= ($signed(reg122[(2'h3):(1'h0)]) || {$unsigned((((8'hb4) ?
                          reg121 : wire119) ?
                      (wire116 ? reg126 : wire118) : (~^reg121))),
                  ({$unsigned(wire115)} >>> (-(reg123 ? wire119 : (8'hac))))});
              reg123 <= $unsigned(wire115);
              reg124 <= (8'hb8);
              reg125 <= $unsigned((($unsigned(reg125) != (((8'haa) ?
                      wire119 : wire119) >> $unsigned(wire119))) ?
                  wire118 : (wire116[(2'h3):(1'h1)] >> reg126[(2'h2):(2'h2)])));
            end
          reg127 <= {reg125[(1'h1):(1'h0)],
              $unsigned((reg122 ?
                  ($unsigned(reg125) + wire117[(2'h2):(1'h0)]) : $unsigned(reg123[(3'h4):(1'h0)])))};
          if ((+(8'ha8)))
            begin
              reg128 <= {($unsigned($signed({(8'ha2),
                      wire118})) + $signed(($unsigned(reg123) ~^ wire118))),
                  ((reg121[(4'ha):(4'h9)] ?
                          $signed((~reg124)) : (wire117 ?
                              (-wire117) : {reg126, reg124})) ?
                      ($unsigned((wire117 ? wire116 : reg127)) ^ {{wire118},
                          reg125}) : wire118)};
            end
          else
            begin
              reg128 <= {{(wire117 ^~ (~|$signed((8'hb6))))}};
              reg129 <= {$unsigned($signed($unsigned($signed(wire115)))),
                  (wire118 ?
                      {reg120,
                          ((reg120 || reg120) ?
                              (reg125 ~^ reg120) : (reg123 > wire119))} : (reg128[(1'h0):(1'h0)] < reg126))};
              reg130 <= $signed((wire115[(1'h1):(1'h1)] && {(reg122 ?
                      $unsigned(wire116) : (|(8'hbf)))}));
            end
          reg131 <= $signed({wire118[(1'h1):(1'h0)],
              ((8'ha3) ?
                  (reg128 ?
                      (reg122 ?
                          reg128 : reg124) : {reg124}) : (~|(~^reg126)))});
          reg132 <= reg123[(4'hb):(4'hb)];
        end
      else
        begin
          reg122 <= $signed(reg129[(2'h3):(1'h1)]);
          if ($unsigned({$unsigned($unsigned((8'ha6)))}))
            begin
              reg123 <= ((((+reg130[(1'h0):(1'h0)]) ?
                      wire115 : (+reg126[(3'h4):(1'h0)])) - reg131) ?
                  reg128 : (~&reg124[(3'h6):(3'h5)]));
            end
          else
            begin
              reg123 <= (wire119[(4'h8):(1'h0)] ?
                  (!reg124[(5'h10):(2'h2)]) : $signed(($unsigned((^~reg121)) ?
                      ((wire116 - reg121) != wire119[(1'h1):(1'h1)]) : reg132[(4'he):(4'he)])));
              reg124 <= reg132[(4'hf):(1'h1)];
              reg125 <= ($unsigned(reg128[(1'h0):(1'h0)]) ?
                  $unsigned({reg120,
                      ({(7'h40)} ?
                          {(8'hac),
                              reg130} : $signed(reg127))}) : (wire116[(3'h5):(3'h5)] ?
                      wire116 : reg131));
              reg126 <= reg121[(1'h0):(1'h0)];
            end
          if ($unsigned(wire117[(4'hb):(3'h6)]))
            begin
              reg127 <= reg126[(2'h2):(1'h1)];
              reg128 <= (reg121[(2'h2):(2'h2)] || $signed(wire116[(3'h5):(3'h5)]));
              reg129 <= ($signed((~reg131)) ?
                  (^($signed(wire118) | (+(reg127 ?
                      wire115 : reg126)))) : $signed($unsigned((~&$signed(reg122)))));
              reg130 <= $unsigned($signed((+reg129[(1'h1):(1'h0)])));
            end
          else
            begin
              reg127 <= (+(8'hbd));
            end
          reg131 <= reg127;
        end
      reg133 <= $signed(((reg122[(2'h3):(1'h0)] ?
              (!reg124) : (~&$unsigned(reg129))) ?
          (|wire118) : wire117[(3'h4):(3'h4)]));
      reg134 <= $signed((&$unsigned(({reg124, reg128} ?
          (reg126 ? reg128 : wire117) : ((8'hb6) ? reg126 : reg132)))));
    end
  always
    @(posedge clk) begin
      reg135 <= ($unsigned((reg131[(1'h1):(1'h1)] ?
          (8'hb7) : {reg125[(1'h0):(1'h0)]})) | $unsigned($signed((((8'h9e) ?
          reg120 : reg131) | reg129[(2'h3):(2'h2)]))));
      reg136 <= (~&$unsigned((reg128[(3'h4):(2'h2)] ?
          wire117[(4'h8):(1'h0)] : ($unsigned(reg126) ?
              ((8'ha7) & (8'ha8)) : (reg128 ? reg135 : wire119)))));
      if ($unsigned(reg135))
        begin
          if ({wire117[(4'hc):(1'h0)]})
            begin
              reg137 <= $unsigned(reg136[(3'h5):(2'h2)]);
              reg138 <= {(((~|$signed(wire119)) ?
                      (+$signed(reg120)) : wire119) < reg137),
                  (^(($signed(wire118) ?
                          {reg121, (8'ha5)} : reg137[(4'hc):(4'hc)]) ?
                      (reg129[(3'h6):(1'h0)] ?
                          $signed((7'h40)) : reg120) : $unsigned($unsigned((8'hb4)))))};
              reg139 <= reg136;
              reg140 <= reg133;
            end
          else
            begin
              reg137 <= reg136;
              reg138 <= reg121[(4'ha):(2'h3)];
            end
          reg141 <= (!reg129);
          reg142 <= $signed((|$unsigned({reg125[(1'h0):(1'h0)],
              (wire119 - reg129)})));
          reg143 <= $signed($signed(({$signed(reg128)} ?
              reg126 : $signed((~&wire119)))));
          reg144 <= (wire119[(3'h5):(2'h2)] || (|reg129));
        end
      else
        begin
          reg137 <= (reg135 > reg140);
          reg138 <= $unsigned(((reg137[(4'hf):(2'h2)] ?
              ((reg143 & (8'ha8)) || $unsigned(wire118)) : $unsigned($unsigned(reg141))) < reg137[(5'h10):(4'he)]));
        end
      reg145 <= reg132[(3'h6):(1'h1)];
      reg146 <= {reg120};
    end
  assign wire147 = (((reg134 ~^ $unsigned($unsigned(reg139))) ?
                           $signed((~&$signed(reg129))) : ($unsigned(reg129) ?
                               ({reg126} && reg146) : ($signed(reg135) ?
                                   {reg135} : {reg120}))) ?
                       reg122 : ({(reg124[(5'h10):(4'he)] && $unsigned(reg136)),
                           reg139[(3'h4):(1'h0)]} * $unsigned(reg140)));
  always
    @(posedge clk) begin
      reg148 <= $unsigned(({$unsigned((reg136 << reg138)), reg141} > reg130));
    end
  assign wire149 = $unsigned(($unsigned({reg125,
                       (~|reg144)}) != $unsigned((~^$signed(wire147)))));
  assign wire150 = reg144;
  always
    @(posedge clk) begin
      if ($unsigned((reg142[(3'h6):(2'h2)] ? $unsigned(reg131) : reg130)))
        begin
          reg151 <= reg121;
          reg152 <= reg145[(2'h3):(2'h3)];
        end
      else
        begin
          if ((^reg124))
            begin
              reg151 <= $signed((&{((reg140 ~^ reg125) >> (!wire117)),
                  (~^reg127)}));
              reg152 <= ((+(^{$signed(wire150), reg134[(1'h0):(1'h0)]})) ?
                  {((reg137[(5'h10):(4'hc)] >> (wire147 ~^ reg122)) == (reg128 == $signed(reg140)))} : reg140);
              reg153 <= (7'h41);
              reg154 <= (((({(8'ha0)} < (reg145 >> reg139)) ?
                  ((reg137 ? reg137 : wire150) ?
                      {reg126} : reg131[(2'h3):(2'h2)]) : {$signed(wire118)}) >> (^~((reg153 ?
                  reg137 : reg133) && reg146[(4'hc):(4'hc)]))) && (reg142 ?
                  (8'h9e) : $unsigned((|(reg145 ? reg145 : reg153)))));
            end
          else
            begin
              reg151 <= (-(&$unsigned($unsigned((reg141 + reg130)))));
              reg152 <= (^~$unsigned(((reg137[(5'h12):(4'hf)] ?
                      (reg122 <= (8'h9e)) : wire147) ?
                  reg144 : (~|(|reg146)))));
              reg153 <= {($signed(wire118[(2'h2):(1'h1)]) & reg153[(2'h2):(1'h1)]),
                  ($unsigned((~^(reg141 != reg138))) ?
                      (($unsigned(reg123) <<< (8'hb5)) ?
                          (~^(wire150 | reg126)) : {reg146,
                              reg152}) : (-($unsigned(reg135) < reg128[(3'h5):(1'h1)])))};
              reg154 <= $unsigned((^~reg127[(3'h4):(3'h4)]));
              reg155 <= reg131;
            end
        end
      reg156 <= (reg154 ? $unsigned(reg151) : reg123[(4'hd):(4'h9)]);
      reg157 <= {((~|$signed((reg152 ?
              reg138 : (8'hab)))) || (reg121[(4'h9):(4'h8)] ~^ (^(+(8'ha6)))))};
      reg158 <= reg133[(1'h1):(1'h1)];
    end
  assign wire159 = $signed($signed((~&$signed({reg130}))));
endmodule

module module94
#(parameter param104 = ((~|((~|((8'hb6) <<< (8'hae))) != (!((8'hb5) != (8'h9f))))) << ((((~^(8'hb0)) << {(8'ha8), (8'hb3)}) ? (+{(8'ha2), (8'h9d)}) : (~&((8'h9f) ? (8'hae) : (8'haa)))) ? (((&(8'hb2)) > (~&(8'hae))) ? (((8'ha7) << (8'hbf)) ? {(8'hac)} : ((8'had) ? (8'h9d) : (8'ha8))) : ({(8'ha3), (8'ha9)} * ((8'ha5) ? (8'hb1) : (8'hab)))) : (8'ha6))), 
parameter param105 = ({param104, param104} == ((param104 ? (param104 - (param104 ? param104 : (8'haf))) : (8'hae)) || ((param104 ? param104 : (param104 ? param104 : param104)) > (8'hb7)))))
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire98;
  input wire signed [(4'hd):(1'h0)] wire97;
  input wire [(5'h14):(1'h0)] wire96;
  input wire [(5'h15):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire101;
  wire signed [(2'h3):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire99;
  assign y = {wire103, wire102, wire101, wire100, wire99, (1'h0)};
  assign wire99 = $unsigned(wire96);
  assign wire100 = wire99[(2'h3):(1'h1)];
  assign wire101 = wire98;
  assign wire102 = wire100;
  assign wire103 = (+(~&$unsigned($signed($signed(wire97)))));
endmodule

module module48  (y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire53;
  input wire signed [(5'h15):(1'h0)] wire52;
  input wire signed [(5'h15):(1'h0)] wire51;
  input wire signed [(4'hb):(1'h0)] wire50;
  input wire [(5'h11):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire61,
                 wire60,
                 wire56,
                 wire55,
                 wire54,
                 reg76,
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
                 reg63,
                 reg62,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire54 = (8'hb2);
  assign wire55 = $unsigned((wire50 * {$unsigned((wire54 ~^ wire53)),
                      wire49[(4'hc):(3'h5)]}));
  assign wire56 = wire54[(5'h15):(4'ha)];
  always
    @(posedge clk) begin
      reg57 <= {{(((-wire51) != $signed(wire56)) * wire54[(1'h1):(1'h0)])},
          $signed((&($unsigned(wire56) ?
              (wire49 * wire49) : $signed(wire53))))};
      reg58 <= ({((~$signed(wire55)) == $unsigned((8'ha4)))} >= $unsigned((((reg57 - wire55) ?
          (reg57 ? wire55 : reg57) : ((8'ha1) ?
              wire53 : wire52)) ^ $unsigned($signed(wire49)))));
      reg59 <= wire51;
    end
  assign wire60 = (8'haf);
  assign wire61 = $unsigned(wire52);
  always
    @(posedge clk) begin
      reg62 <= $signed({wire56});
      reg63 <= wire56[(1'h1):(1'h1)];
      reg64 <= (-{$signed((+$signed((8'h9d)))), reg57[(3'h4):(2'h2)]});
      if (wire49)
        begin
          reg65 <= (8'ha4);
          reg66 <= (reg62[(3'h4):(2'h3)] ?
              (!(($unsigned(wire56) ?
                  $unsigned(wire50) : (8'ha5)) | $signed((reg63 ?
                  reg65 : reg62)))) : ((8'haf) ?
                  $unsigned($signed((~^(8'hab)))) : $signed($unsigned(wire55))));
          reg67 <= {$signed($unsigned($unsigned(wire56))),
              $unsigned($unsigned((wire49 >> {(7'h40), wire49})))};
        end
      else
        begin
          reg65 <= $unsigned(reg65[(4'ha):(3'h5)]);
        end
      if ((~^($unsigned($signed($unsigned(wire49))) && reg67[(1'h0):(1'h0)])))
        begin
          reg68 <= (((($unsigned(wire61) ?
                      $unsigned(reg63) : wire56) >> ((wire51 - wire61) ?
                      wire54 : (wire52 ? (8'hb0) : (8'h9f)))) ?
                  wire56[(1'h1):(1'h0)] : $signed($unsigned((wire52 ^~ wire56)))) ?
              ((~reg63[(4'hd):(3'h6)]) - reg64[(5'h10):(3'h5)]) : ($signed(reg62[(1'h0):(1'h0)]) <<< $unsigned(($signed(reg66) > {(8'hbb),
                  wire51}))));
        end
      else
        begin
          reg68 <= reg59;
        end
    end
  always
    @(posedge clk) begin
      reg69 <= reg66[(3'h7):(3'h6)];
      reg70 <= reg59;
      if (((+(reg67[(2'h2):(2'h2)] < $signed((reg63 << wire54)))) <<< ({{$unsigned(wire50)},
          (~&$unsigned(reg58))} > $signed(reg68))))
        begin
          reg71 <= (wire55[(3'h5):(2'h3)] ?
              $signed(reg67) : ((wire55 ?
                  {(&wire61),
                      (wire60 ?
                          wire49 : wire60)} : $unsigned((wire54 <<< wire61))) ^~ ((((8'hbe) >> reg68) ?
                  $signed(reg58) : wire49) || (~|{reg58, wire49}))));
          if ($unsigned(wire49[(4'hc):(1'h1)]))
            begin
              reg72 <= reg70[(4'ha):(3'h4)];
              reg73 <= {$unsigned(wire51[(1'h1):(1'h1)]),
                  ((((wire49 ? wire53 : reg58) ? $unsigned(reg65) : wire54) ?
                      $signed($unsigned((8'h9d))) : ((!wire61) ?
                          (~^reg58) : {wire60})) || (wire50 && ({reg64} ?
                      $unsigned((8'ha3)) : reg59)))};
              reg74 <= $unsigned($unsigned(reg69[(3'h7):(3'h5)]));
              reg75 <= (^(^~$signed((&$signed(reg63)))));
              reg76 <= ((&(~reg68[(1'h1):(1'h0)])) ?
                  ((-reg71) && ({(reg75 ? wire60 : reg66), {reg70}} ?
                      reg72 : wire60)) : (~$signed(reg62)));
            end
          else
            begin
              reg72 <= $signed({(~^(reg59[(3'h4):(2'h2)] ?
                      reg74[(3'h4):(2'h2)] : $unsigned(reg71))),
                  wire56[(1'h1):(1'h1)]});
              reg73 <= $unsigned(reg71[(2'h2):(1'h0)]);
              reg74 <= wire61;
            end
        end
      else
        begin
          reg71 <= wire49;
        end
    end
  assign wire77 = ((&($unsigned((reg62 | reg65)) ?
                      ((wire50 ? reg66 : reg68) ?
                          wire51 : reg70) : reg58)) != ($unsigned(($signed(reg58) || (wire55 >= reg76))) & $signed($signed($unsigned(reg62)))));
  assign wire78 = (reg68[(1'h0):(1'h0)] ^~ ((~|reg68[(2'h3):(1'h0)]) < $signed((wire53 ?
                      (~&reg59) : (reg70 ? wire49 : (7'h43))))));
  assign wire79 = reg70[(3'h7):(1'h1)];
  assign wire80 = (((8'hb9) >= wire56[(3'h4):(3'h4)]) ?
                      $signed((((wire61 < reg73) ?
                              $signed(reg76) : (~(8'hac))) ?
                          (((8'ha0) < reg71) ?
                              $unsigned(reg73) : reg57) : wire60)) : (|((8'hb6) + (wire77 << wire52[(4'h8):(3'h4)]))));
  assign wire81 = (~^$unsigned($unsigned(wire60[(2'h2):(1'h1)])));
  assign wire82 = $unsigned($signed(wire80[(2'h3):(1'h0)]));
endmodule

module module19
#(parameter param43 = (8'ha5), 
parameter param44 = (!((((param43 ^~ (7'h42)) <<< param43) == param43) | {{param43}})))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire [(3'h4):(1'h0)] wire22;
  input wire [(5'h11):(1'h0)] wire21;
  input wire signed [(5'h10):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire25;
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire34,
                 wire33,
                 wire32,
                 wire25,
                 reg35,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire25 = ((~^$unsigned($signed($signed(wire21)))) ?
                      $unsigned($unsigned((((8'hb7) >> wire22) != {wire22,
                          (8'ha6)}))) : wire24[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ({(|$signed($unsigned(wire22)))})
        begin
          if ((^$signed({((wire20 < (8'hbf)) ?
                  $unsigned(wire25) : $unsigned(wire24)),
              wire22})))
            begin
              reg26 <= $unsigned($signed(wire22[(2'h3):(1'h0)]));
              reg27 <= ((~wire21) ?
                  wire21[(3'h5):(3'h4)] : ($unsigned($unsigned($signed(wire20))) || wire21[(3'h4):(1'h0)]));
              reg28 <= ((wire21[(1'h0):(1'h0)] ?
                      $unsigned((wire24[(1'h1):(1'h0)] ?
                          reg27[(4'h9):(4'h9)] : {(8'hab),
                              (8'h9f)})) : (~|$signed($unsigned(wire22)))) ?
                  $unsigned(wire23[(3'h5):(3'h5)]) : (^$unsigned(((^wire24) & reg27[(4'he):(4'hb)]))));
            end
          else
            begin
              reg26 <= (wire22 ?
                  (!($signed((reg28 ? wire24 : wire22)) ?
                      ((~^wire23) ?
                          wire23[(4'h9):(1'h0)] : (wire20 ?
                              wire22 : wire25)) : (-(^~wire22)))) : (8'h9f));
            end
        end
      else
        begin
          reg26 <= ($unsigned(reg26[(1'h0):(1'h0)]) || ((!{wire22}) ?
              (reg28[(1'h0):(1'h0)] > {$signed((7'h44))}) : wire21));
          reg27 <= {$unsigned(wire22), reg28[(4'he):(4'ha)]};
        end
      reg29 <= $unsigned(((8'haf) ? $unsigned(reg27) : $unsigned(reg27)));
      reg30 <= reg27;
      reg31 <= (+($signed((8'hb5)) && $unsigned(wire24)));
    end
  assign wire32 = wire20;
  assign wire33 = ((8'ha6) ?
                      wire25[(2'h2):(1'h1)] : ((((~&reg29) ^ (^reg27)) ~^ $signed((wire32 ?
                          reg26 : wire32))) - $unsigned((^(~&(8'hb6))))));
  assign wire34 = {$signed(wire21),
                      ($signed(wire25[(2'h2):(1'h1)]) ?
                          $unsigned(wire24) : ($signed($signed(wire24)) ?
                              (|$unsigned(reg30)) : reg26[(3'h4):(1'h0)]))};
  always
    @(posedge clk) begin
      reg35 <= ($signed((reg28 >> {(reg31 ? wire24 : wire34),
              reg28[(3'h4):(2'h3)]})) ?
          reg30 : $unsigned((^~({wire34} << wire25))));
    end
  assign wire36 = $unsigned($signed($unsigned(reg35)));
  assign wire37 = ($unsigned(wire23) ^~ $signed(reg28[(4'hd):(1'h1)]));
  assign wire38 = (wire37[(3'h5):(1'h0)] != $signed((((wire21 ?
                          (8'ha4) : reg26) > $signed(reg31)) ?
                      (((8'h9e) | reg35) ?
                          $unsigned((8'ha7)) : $unsigned(wire21)) : $signed(wire22[(2'h3):(2'h3)]))));
  assign wire39 = reg30;
  assign wire40 = $signed((($unsigned($unsigned(wire39)) ?
                      $signed((wire39 != wire23)) : (~&{wire25})) <<< ((wire21[(5'h10):(3'h4)] ?
                          (-reg31) : {wire39, wire33}) ?
                      $unsigned($signed((7'h40))) : wire21[(4'ha):(1'h0)])));
  assign wire41 = (wire32[(4'h8):(2'h2)] ?
                      $unsigned((!wire38)) : $signed(wire33));
  assign wire42 = wire39;
endmodule
