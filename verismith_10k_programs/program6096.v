module top
#(parameter param196 = (({(((8'hb2) ? (8'hbf) : (8'hb5)) + ((8'hac) > (7'h40))), (-((8'hb5) ? (7'h40) : (8'ha9)))} <<< (~^({(8'h9e), (8'ha9)} >= (7'h43)))) ? ({((~&(8'ha4)) ^ ((8'hb9) ? (7'h42) : (8'hbc))), {((8'ha7) <= (8'hb1)), ((8'h9e) && (8'hb2))}} >> ((((8'hb5) ^~ (8'ha9)) <<< ((8'hbc) ? (8'hb2) : (8'ha7))) ? {{(8'ha9), (8'h9f)}} : ((~(8'hbe)) ? ((7'h44) <= (8'h9d)) : {(8'h9e)}))) : (((((8'ha1) ? (7'h43) : (8'hb4)) ^ ((8'ha7) ? (8'hb3) : (8'ha9))) | {((8'hbf) | (8'haa))}) ? (({(7'h41), (8'hb5)} || (^~(8'ha2))) ? (^((8'haa) & (8'hb7))) : ((8'hbd) << {(8'ha8), (8'hb5)})) : {(((8'hb9) ? (8'ha1) : (8'ha2)) | {(8'hb5), (8'hac)}), (&((8'hb4) >= (8'hab)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire [(5'h14):(1'h0)] wire195;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire193;
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  assign y = {wire195,
                 wire4,
                 wire5,
                 wire12,
                 wire13,
                 wire14,
                 wire24,
                 wire193,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire4 = {wire0, wire2[(4'hb):(3'h5)]};
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      if (wire0[(4'h9):(4'h8)])
        begin
          reg6 <= (wire2 ?
              ((wire3[(4'hc):(1'h0)] & ((-wire4) ?
                      wire5[(4'hc):(4'h9)] : (^wire5))) ?
                  $signed(((wire5 ~^ wire5) ?
                      $unsigned(wire0) : (wire4 + wire5))) : $signed((!(wire1 ?
                      wire3 : wire1)))) : (+$signed($unsigned((wire1 | wire3)))));
        end
      else
        begin
          reg6 <= {wire5};
          if ($unsigned({$signed($unsigned(wire0[(4'h8):(4'h8)]))}))
            begin
              reg7 <= (!(~&reg6));
            end
          else
            begin
              reg7 <= $signed((8'hba));
              reg8 <= $unsigned($signed((^~($signed(reg6) >= $unsigned(wire1)))));
              reg9 <= (|$unsigned((wire3[(2'h3):(2'h2)] ?
                  (8'hb8) : $signed($signed(wire0)))));
              reg10 <= {wire2, wire5[(3'h6):(3'h5)]};
            end
        end
      reg11 <= $signed((8'hbb));
    end
  assign wire12 = {reg7[(3'h4):(3'h4)],
                      $signed($unsigned(wire2[(3'h4):(2'h3)]))};
  assign wire13 = (~wire1);
  assign wire14 = ($signed(reg8[(3'h5):(3'h4)]) ? (8'ha6) : wire5);
  always
    @(posedge clk) begin
      reg15 <= $unsigned($unsigned({$signed((reg9 ? reg10 : reg7)),
          {wire4, (wire2 ? wire0 : wire14)}}));
      if ((-wire2[(2'h2):(1'h1)]))
        begin
          reg16 <= (~|(+(-reg7[(3'h4):(1'h1)])));
        end
      else
        begin
          if ((~^({(reg8 ? reg9 : (^~wire12)), wire14} * reg15)))
            begin
              reg16 <= ($unsigned(wire1) ?
                  $signed($unsigned($signed((^~wire1)))) : wire1);
              reg17 <= (~&$unsigned((~^{$unsigned(wire5), (^~wire0)})));
              reg18 <= (!wire5[(1'h1):(1'h0)]);
            end
          else
            begin
              reg16 <= ($unsigned(($unsigned($unsigned(reg6)) >>> wire0)) ?
                  (7'h44) : ({($unsigned(reg6) != $signed(wire0))} ?
                      (($unsigned(wire3) ?
                              $signed(reg18) : wire1[(1'h1):(1'h1)]) ?
                          ((~wire0) <<< $unsigned(wire4)) : (8'hab)) : $signed($signed($signed(wire12)))));
              reg17 <= $unsigned($signed($unsigned($unsigned($unsigned(wire13)))));
              reg18 <= $signed((~|{($unsigned(reg15) ?
                      $signed((8'hbe)) : (wire3 != reg10))}));
              reg19 <= $signed(wire1);
              reg20 <= reg17[(4'hc):(1'h1)];
            end
          reg21 <= $signed(wire14[(3'h6):(3'h4)]);
        end
      reg22 <= (~&({$signed($signed(reg19))} ?
          (~^$unsigned($unsigned(reg9))) : wire12));
      reg23 <= {wire14[(5'h10):(4'h8)]};
    end
  assign wire24 = {reg21,
                      ((($signed(reg6) <= $signed(reg22)) ? reg23 : (|reg7)) ?
                          reg6 : (-(reg20 ? wire1 : $unsigned(wire12))))};
  module25 #() modinst194 (wire193, clk, reg17, wire4, reg20, reg23);
  assign wire195 = reg8[(4'ha):(3'h6)];
endmodule

module module25
#(parameter param192 = (+(~(|(8'ha9)))))
(y, clk, wire26, wire27, wire28, wire29);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire191;
  wire [(4'h8):(1'h0)] wire190;
  wire signed [(2'h2):(1'h0)] wire188;
  wire [(4'h9):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(5'h15):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire125;
  wire [(4'hd):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire167;
  assign y = {wire191,
                 wire190,
                 wire188,
                 wire30,
                 wire65,
                 wire67,
                 wire68,
                 wire69,
                 wire70,
                 wire105,
                 wire107,
                 wire108,
                 wire123,
                 wire125,
                 wire126,
                 wire167,
                 (1'h0)};
  assign wire30 = $unsigned($signed((wire28 * ((wire27 ?
                      wire28 : wire27) | {wire27}))));
  module31 #() modinst66 (wire65, clk, wire26, wire27, wire28, wire30);
  assign wire67 = $unsigned((wire29 ^ (((wire27 ? wire65 : wire30) ?
                          (~&wire65) : $signed(wire28)) ?
                      ($unsigned(wire29) ?
                          (~|wire28) : {wire27}) : ((wire30 >>> wire30) ?
                          $signed((8'ha8)) : wire27))));
  assign wire68 = wire28;
  assign wire69 = $signed(((wire27 ~^ {wire27[(3'h5):(1'h1)]}) * ($unsigned($signed(wire67)) ?
                      $signed({wire68}) : $unsigned($signed(wire68)))));
  assign wire70 = $unsigned($unsigned(wire65[(3'h6):(3'h6)]));
  module71 #() modinst106 (wire105, clk, wire29, wire65, wire28, wire67);
  assign wire107 = $signed((((~|{wire27}) > (-(^wire65))) >>> wire68));
  assign wire108 = $signed((-((~&$signed(wire70)) ? wire68 : wire65)));
  module109 #() modinst124 (.wire110(wire108), .y(wire123), .wire112(wire70), .wire111(wire29), .clk(clk), .wire113(wire105));
  assign wire125 = wire123;
  assign wire126 = ($unsigned((-$signed($unsigned((8'haa))))) > wire70[(5'h12):(4'hc)]);
  module127 #() modinst168 (wire167, clk, wire68, wire65, wire27, wire30, wire125);
  module169 #() modinst189 (.wire171(wire67), .wire173(wire27), .wire170(wire28), .clk(clk), .wire172(wire26), .y(wire188));
  assign wire190 = {(&wire29[(1'h1):(1'h0)]),
                       $signed($unsigned((~^(~wire65))))};
  assign wire191 = ((~&$unsigned({(&wire105)})) >> wire68[(3'h6):(1'h1)]);
endmodule

module module169  (y, clk, wire173, wire172, wire171, wire170);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire173;
  input wire [(5'h13):(1'h0)] wire172;
  input wire signed [(5'h12):(1'h0)] wire171;
  input wire [(3'h5):(1'h0)] wire170;
  wire [(5'h14):(1'h0)] wire187;
  wire signed [(5'h13):(1'h0)] wire186;
  wire [(4'h8):(1'h0)] wire182;
  wire [(3'h5):(1'h0)] wire181;
  wire [(4'he):(1'h0)] wire180;
  wire [(4'ha):(1'h0)] wire178;
  wire [(4'hf):(1'h0)] wire177;
  wire [(4'h8):(1'h0)] wire176;
  wire [(4'hd):(1'h0)] wire175;
  wire [(3'h6):(1'h0)] wire174;
  reg [(5'h12):(1'h0)] reg185 = (1'h0);
  reg [(4'hb):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg179 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire182,
                 wire181,
                 wire180,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 reg185,
                 reg184,
                 reg183,
                 reg179,
                 (1'h0)};
  assign wire174 = (wire170[(1'h0):(1'h0)] && $unsigned($signed({{wire171,
                           (8'h9f)}})));
  assign wire175 = ($signed($signed(wire172)) ?
                       (|wire171[(3'h4):(3'h4)]) : (|wire173));
  assign wire176 = ($unsigned(wire174) ?
                       (wire170[(2'h3):(2'h2)] || wire174) : $unsigned(($unsigned({wire174}) ^~ wire170[(2'h2):(1'h0)])));
  assign wire177 = ($unsigned(($unsigned(wire174[(3'h4):(3'h4)]) ?
                           wire176[(2'h2):(1'h0)] : {(8'hb7)})) ?
                       ($signed(wire171[(4'hd):(4'hc)]) ~^ (wire171[(3'h5):(2'h2)] < (~^wire172))) : (~(&((wire171 ?
                               (8'ha7) : wire174) ?
                           (wire175 ? wire176 : wire175) : $signed(wire172)))));
  assign wire178 = ((~|(+wire174[(3'h6):(3'h6)])) || $unsigned(({(~wire175),
                           $signed(wire175)} ?
                       $unsigned((wire177 != wire170)) : (8'hbf))));
  always
    @(posedge clk) begin
      reg179 <= {$unsigned(((~^$signed((8'hba))) ?
              wire170[(3'h4):(2'h3)] : (wire176 & wire176))),
          ($unsigned({(wire174 ^~ (8'ha8)), (wire171 ? wire172 : wire173)}) ?
              $unsigned((wire178[(1'h1):(1'h0)] ^ (wire174 ?
                  (7'h40) : wire177))) : (~$unsigned(wire172[(2'h2):(1'h0)])))};
    end
  assign wire180 = ($unsigned((($signed(wire176) | wire171[(2'h2):(2'h2)]) << (((8'ha5) <<< reg179) ^~ ((8'hab) > (8'h9e))))) & wire175);
  assign wire181 = ($unsigned($signed(wire177[(4'h9):(3'h5)])) ^ ((~|$unsigned((wire173 ?
                       (8'hbe) : wire171))) < $signed({$unsigned(wire172)})));
  assign wire182 = $signed($unsigned(wire176[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if (((($signed(wire177[(3'h4):(2'h3)]) ?
          wire176 : ((!wire175) ?
              {(7'h41)} : ((7'h41) & wire172))) * (&$unsigned((wire178 ?
          wire175 : wire182)))) & ({($signed(wire171) ?
              (wire182 ?
                  wire170 : wire182) : $unsigned(wire181))} >>> {wire172[(4'hb):(2'h3)],
          $signed($signed(wire175))})))
        begin
          reg183 <= wire170[(1'h0):(1'h0)];
          reg184 <= $signed(reg183);
        end
      else
        begin
          reg183 <= $unsigned(wire182);
          reg184 <= ((&($signed(wire173[(3'h7):(2'h2)]) > (~|((8'hb2) != (8'h9d))))) ?
              (|(8'ha5)) : (-(wire171[(1'h1):(1'h1)] != (~(+wire171)))));
        end
      reg185 <= reg183;
    end
  assign wire186 = (wire174 ?
                       $unsigned($unsigned(wire173)) : (wire178 & {(wire180[(2'h3):(2'h3)] ?
                               $signed(wire178) : $unsigned(wire174)),
                           wire171}));
  assign wire187 = wire173[(3'h7):(1'h0)];
endmodule

module module127  (y, clk, wire132, wire131, wire130, wire129, wire128);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire132;
  input wire [(5'h10):(1'h0)] wire131;
  input wire [(5'h10):(1'h0)] wire130;
  input wire [(4'h9):(1'h0)] wire129;
  input wire signed [(5'h14):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire166;
  wire [(4'hd):(1'h0)] wire165;
  wire signed [(3'h5):(1'h0)] wire164;
  wire [(2'h3):(1'h0)] wire158;
  wire [(4'hc):(1'h0)] wire156;
  wire signed [(5'h10):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire133;
  reg signed [(3'h7):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg162 = (1'h0);
  reg [(4'hf):(1'h0)] reg161 = (1'h0);
  reg [(3'h5):(1'h0)] reg160 = (1'h0);
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  reg [(2'h3):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(2'h3):(1'h0)] reg148 = (1'h0);
  reg [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg143 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg141 = (1'h0);
  reg [(4'h9):(1'h0)] reg140 = (1'h0);
  reg [(2'h2):(1'h0)] reg139 = (1'h0);
  reg [(5'h12):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(5'h11):(1'h0)] reg134 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire158,
                 wire156,
                 wire155,
                 wire133,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg157,
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
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  assign wire133 = {(^~(^wire128[(2'h3):(2'h2)])), wire128};
  always
    @(posedge clk) begin
      if ($signed((+wire131)))
        begin
          reg134 <= (($unsigned(wire129[(1'h1):(1'h1)]) >= (((wire131 ^ (8'hb0)) == ((8'hb3) ?
                      wire131 : wire129)) ?
                  (~^(wire133 ? wire131 : wire128)) : ({wire132} ?
                      {wire129} : $unsigned(wire130)))) ?
              wire133 : ($unsigned((^$signed(wire128))) <= (((wire128 != (8'ha8)) ?
                      $signed(wire130) : $signed(wire132)) ?
                  ((~|wire131) ?
                      (~wire130) : ((8'ha5) >>> wire132)) : ((+wire129) ?
                      wire129[(2'h3):(2'h3)] : (^~wire132)))));
        end
      else
        begin
          reg134 <= $unsigned((wire132[(1'h0):(1'h0)] ?
              ($signed((^wire133)) ? wire129 : wire131) : wire130));
          if (wire131)
            begin
              reg135 <= (reg134 ~^ wire131[(5'h10):(4'ha)]);
              reg136 <= $signed((((^~$signed(wire133)) ^ (~&wire133[(2'h3):(1'h1)])) ?
                  $signed((&reg135[(1'h0):(1'h0)])) : wire130));
            end
          else
            begin
              reg135 <= {((8'ha5) | ((^~wire131[(4'hd):(3'h7)]) > wire132[(1'h1):(1'h1)])),
                  (~$unsigned($signed(wire133[(2'h2):(1'h1)])))};
              reg136 <= ({(reg135 ?
                          $signed(wire133) : wire132[(2'h3):(2'h3)])} ?
                  (($signed((!wire129)) ?
                          wire133 : $unsigned(wire133[(5'h10):(4'hf)])) ?
                      $unsigned(wire128) : wire128[(4'ha):(2'h2)]) : (reg136 ?
                      $signed(reg135) : reg135[(3'h5):(1'h0)]));
              reg137 <= (wire132[(2'h2):(2'h2)] ?
                  reg135[(1'h1):(1'h0)] : {wire131,
                      $unsigned($unsigned({reg134, reg136}))});
              reg138 <= (wire133 ~^ (($unsigned((wire131 ?
                  (8'hac) : (8'ha3))) ^ reg135[(3'h4):(1'h0)]) >= $unsigned($signed((wire133 ?
                  reg134 : reg136)))));
            end
          reg139 <= {reg135[(4'h9):(2'h3)]};
        end
      if (reg135)
        begin
          reg140 <= (~|(((+reg136) ^ {reg139,
              (wire128 ? wire131 : wire129)}) * $signed(($unsigned(reg134) ?
              (wire129 + wire131) : (reg137 ? reg136 : wire128)))));
          reg141 <= $signed((~^wire133[(5'h10):(3'h6)]));
        end
      else
        begin
          reg140 <= wire128;
          reg141 <= ($signed($signed({(reg140 * (8'hb9)),
              $unsigned((8'hbc))})) < {(((+reg140) ~^ {reg138,
                  wire133}) == ($signed(reg136) ?
                  (wire130 ? wire133 : wire133) : $signed(reg137))),
              (($signed(wire130) ? {wire131, wire132} : (~|(8'hb6))) ?
                  reg136 : ((reg134 - (8'ha8)) ?
                      $signed(wire129) : $signed((8'ha8))))});
          if ($unsigned(reg138[(1'h1):(1'h0)]))
            begin
              reg142 <= reg134;
              reg143 <= ({{wire128[(3'h5):(3'h5)],
                      (wire133[(4'h8):(1'h0)] >>> {wire128})}} >> (reg135 ?
                  reg142 : $unsigned($unsigned((reg137 ~^ reg140)))));
            end
          else
            begin
              reg142 <= (-$signed($signed(reg141)));
              reg143 <= (reg134[(2'h2):(2'h2)] ^ wire132[(3'h6):(3'h5)]);
              reg144 <= $unsigned(({(reg137 - $unsigned(wire128)),
                  (+$signed(reg141))} || (8'hbf)));
              reg145 <= {(|(($unsigned(wire133) ? reg141 : {reg141, reg137}) ?
                      ((wire133 ? wire129 : reg136) ?
                          $unsigned(reg135) : {reg134}) : $signed($signed((8'haf)))))};
            end
        end
      reg146 <= reg137;
      reg147 <= reg143;
      if ($unsigned(reg143[(1'h1):(1'h1)]))
        begin
          reg148 <= ($signed((($signed(reg135) < (7'h41)) * (reg144[(4'h8):(2'h2)] == reg147))) ?
              {$signed($signed((~reg135))), (8'ha6)} : (&(^((reg138 ?
                      reg137 : wire128) ?
                  (-wire130) : (8'hb9)))));
          reg149 <= (~|(~($signed(reg148) ?
              (&(~^reg146)) : wire128[(4'ha):(3'h6)])));
        end
      else
        begin
          reg148 <= ((7'h44) <<< {reg138,
              ((reg143[(4'ha):(4'h9)] ? (!wire128) : $signed(reg143)) ?
                  (reg140 ~^ reg148) : $signed($unsigned(reg145)))});
          reg149 <= reg138[(5'h11):(3'h5)];
          if ($unsigned((($signed((reg139 ?
                  reg134 : (8'had))) > reg148[(1'h1):(1'h0)]) ?
              $unsigned((reg134 | $signed(reg137))) : reg149)))
            begin
              reg150 <= {(~|(((reg142 ? reg136 : (8'hbd)) ?
                      $signed((8'hbc)) : (~&reg138)) ^~ reg137[(4'h9):(4'h8)])),
                  reg144[(4'h8):(1'h1)]};
              reg151 <= ($unsigned($signed($signed(reg140[(4'h8):(3'h6)]))) ?
                  ($signed(({reg134, wire133} ?
                      (&(8'hb4)) : (reg142 ?
                          reg149 : (8'ha6)))) + (!($signed(reg139) ?
                      $signed(reg139) : $unsigned((8'hbd))))) : (wire133[(5'h12):(4'ha)] ?
                      wire130 : reg139));
              reg152 <= ({$signed(reg151[(4'h8):(4'h8)]),
                  ({(reg149 * wire130)} * ((reg141 >> reg138) ?
                      {reg137,
                          reg139} : $unsigned(wire133)))} | ((reg138[(4'h8):(1'h1)] ?
                      (~wire132[(2'h2):(2'h2)]) : (((7'h44) ?
                          reg135 : wire129) < $signed(wire129))) ?
                  (reg140[(4'h9):(2'h2)] ?
                      (^~(reg145 ?
                          reg144 : reg143)) : wire133[(3'h5):(1'h0)]) : (reg140[(2'h3):(2'h3)] != (|reg139[(1'h0):(1'h0)]))));
              reg153 <= (|(7'h43));
            end
          else
            begin
              reg150 <= ({$unsigned((~|(wire131 ? wire128 : reg134)))} ?
                  (&(reg147[(3'h5):(3'h5)] ?
                      ($unsigned(reg148) ?
                          (&(8'ha3)) : $unsigned(reg142)) : reg134[(3'h4):(2'h2)])) : reg135[(4'he):(3'h4)]);
              reg151 <= reg145;
              reg152 <= reg139[(2'h2):(2'h2)];
            end
          reg154 <= (reg146[(3'h7):(2'h3)] ?
              reg147[(1'h0):(1'h0)] : $unsigned($signed($signed((^reg148)))));
        end
    end
  assign wire155 = wire132[(3'h5):(1'h0)];
  assign wire156 = reg147;
  always
    @(posedge clk) begin
      reg157 <= {$signed($signed(((reg144 ? wire130 : wire155) ?
              wire129[(1'h0):(1'h0)] : (reg147 >>> (8'hb5)))))};
    end
  assign wire158 = $unsigned($unsigned(($unsigned($unsigned(wire156)) <= ((wire155 && reg135) | reg139))));
  always
    @(posedge clk) begin
      reg159 <= (~&{{reg141},
          ((reg134[(1'h1):(1'h1)] ? $unsigned(wire158) : $signed(reg139)) ?
              (reg146[(4'h9):(3'h5)] ^~ (wire132 > reg153)) : $signed(reg135))});
      reg160 <= $unsigned(reg139);
      reg161 <= {((({reg141} ? {reg154} : (8'ha9)) <= {reg139[(1'h0):(1'h0)],
                  (reg153 >= wire156)}) ?
              wire130 : (~|reg148)),
          (reg135[(2'h3):(1'h1)] ?
              (!$signed((reg140 ?
                  reg149 : reg136))) : (&$unsigned($unsigned((8'ha9)))))};
      reg162 <= (wire158 ?
          (wire130[(1'h0):(1'h0)] && (-reg146)) : reg141[(4'hc):(3'h6)]);
      reg163 <= $unsigned((~&$unsigned(reg162)));
    end
  assign wire164 = $signed(reg151[(1'h0):(1'h0)]);
  assign wire165 = $unsigned(reg147[(3'h4):(1'h1)]);
  assign wire166 = (8'haf);
endmodule

module module109  (y, clk, wire113, wire112, wire111, wire110);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire113;
  input wire signed [(5'h13):(1'h0)] wire112;
  input wire [(3'h5):(1'h0)] wire111;
  input wire [(5'h15):(1'h0)] wire110;
  wire [(2'h3):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  wire signed [(5'h11):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire117;
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire119,
                 wire118,
                 wire117,
                 reg120,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg114 <= ($unsigned($unsigned(((wire113 ? (8'haa) : wire110) ?
              wire111 : (|wire113)))) ?
          wire113[(1'h0):(1'h0)] : ({wire110[(4'hd):(3'h4)],
                  wire113[(3'h7):(2'h2)]} ?
              wire113[(3'h4):(2'h2)] : ({wire113,
                  (wire113 != (8'hb2))} <= (^wire113))));
      reg115 <= wire113[(2'h2):(2'h2)];
      reg116 <= wire111[(3'h5):(2'h2)];
    end
  assign wire117 = (|(^~reg115[(2'h2):(2'h2)]));
  assign wire118 = $signed($unsigned((~^reg116)));
  assign wire119 = $signed($unsigned((-$unsigned(reg114))));
  always
    @(posedge clk) begin
      reg120 <= $signed($signed((~^$signed($signed(reg116)))));
    end
  assign wire121 = ((~((&(~reg116)) | ((wire118 <<< wire118) && $unsigned(wire119)))) ?
                       {(8'ha7),
                           {reg115[(1'h0):(1'h0)]}} : $signed((reg120[(3'h7):(3'h5)] - wire113[(3'h6):(1'h1)])));
  assign wire122 = wire117[(1'h0):(1'h0)];
endmodule

module module71  (y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire75;
  input wire signed [(5'h15):(1'h0)] wire74;
  input wire signed [(4'hf):(1'h0)] wire73;
  input wire signed [(4'h9):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire103;
  wire signed [(3'h6):(1'h0)] wire102;
  wire [(4'h9):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
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
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire76 = ($signed((~|(wire74[(2'h3):(2'h3)] < (wire74 ?
                          wire73 : wire75)))) ?
                      ($signed(({wire73, wire72} ?
                              (wire72 | wire74) : wire75)) ?
                          $signed(({(8'hba)} ?
                              (wire72 ?
                                  wire72 : (8'hb1)) : $signed(wire75))) : wire73[(3'h4):(1'h1)]) : wire75[(1'h1):(1'h0)]);
  assign wire77 = (wire76 ?
                      (~&wire74[(2'h2):(1'h0)]) : $signed(wire73[(4'h8):(3'h6)]));
  assign wire78 = (^~{$signed(wire76)});
  assign wire79 = $signed((wire73 ?
                      $signed({(^wire74),
                          {(8'hb8)}}) : ($unsigned((wire74 << wire75)) <= wire75[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg80 <= (wire74 < $signed(wire75[(2'h2):(2'h2)]));
      if (wire78)
        begin
          reg81 <= (&$unsigned($unsigned($unsigned(wire75))));
          reg82 <= $signed(wire73);
          reg83 <= wire77[(1'h0):(1'h0)];
          reg84 <= $signed($signed(((-(wire75 ? wire77 : wire72)) ?
              {((8'hb7) | reg82)} : {(~(8'hac)), reg83[(3'h6):(1'h0)]})));
        end
      else
        begin
          reg81 <= (wire73[(4'hb):(2'h3)] >> (8'ha0));
          reg82 <= (&$unsigned(($signed($signed((8'ha2))) | $unsigned(wire73))));
          reg83 <= $signed(reg84[(1'h1):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg85 <= (($signed(((wire75 > (8'haa)) << (~^(8'h9f)))) * (wire75 <= (8'hb8))) != wire76);
      if ((wire79[(4'h8):(2'h2)] ~^ (((8'haf) | ((-(8'ha9)) <<< (+reg81))) == ({(8'hbb),
              reg80[(2'h2):(1'h0)]} ?
          reg84 : (wire77[(1'h0):(1'h0)] ?
              wire74[(3'h5):(2'h3)] : reg85[(3'h5):(1'h1)])))))
        begin
          reg86 <= reg80;
          reg87 <= {$unsigned((wire74 == $unsigned($unsigned(reg86)))),
              {{(~&$unsigned(reg86)), $signed(((8'ha2) ? (8'h9f) : reg80))},
                  ($signed(reg81[(4'ha):(3'h4)]) ~^ $signed({reg83}))}};
          reg88 <= ({$signed({$signed(reg85)})} << $signed((reg85[(3'h5):(2'h3)] ?
              wire74 : (~&reg85[(3'h6):(2'h2)]))));
          if (reg82)
            begin
              reg89 <= (($signed(reg88) >> reg80[(2'h3):(2'h2)]) != ($unsigned($signed(wire75)) <= reg87));
              reg90 <= (($signed(reg84[(3'h4):(1'h1)]) ?
                  (+reg86[(3'h4):(1'h1)]) : $unsigned((~^{wire79,
                      reg88}))) >= ((~^(~^reg82)) == (^~(wire79[(3'h7):(1'h0)] ?
                  wire74[(4'ha):(4'ha)] : (wire73 | reg88)))));
              reg91 <= $signed((+{(8'hb8), (reg90 <<< $signed(reg89))}));
              reg92 <= ((~|(8'h9e)) < {$unsigned(((&(8'hb3)) < (reg91 ?
                      (8'haf) : reg84))),
                  $signed(reg89)});
              reg93 <= (($unsigned((8'haa)) ?
                      reg91[(2'h2):(1'h0)] : reg87[(3'h4):(2'h2)]) ?
                  $unsigned(($signed(reg92[(1'h1):(1'h0)]) ?
                      $signed($unsigned((8'hbb))) : {(wire72 ? wire79 : reg85),
                          wire76})) : $unsigned(((wire75[(1'h1):(1'h0)] ^ $unsigned(wire75)) * $signed(wire72[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg89 <= (reg92 - wire74[(4'hc):(3'h5)]);
              reg90 <= wire75[(3'h4):(2'h3)];
              reg91 <= $signed(reg81);
            end
          reg94 <= (~&(8'haa));
        end
      else
        begin
          reg86 <= ((~&reg80) ?
              $signed($signed((-$unsigned(reg83)))) : (+$signed(reg87[(2'h3):(1'h0)])));
          reg87 <= reg83[(2'h2):(2'h2)];
          if (reg81[(3'h6):(3'h4)])
            begin
              reg88 <= ((((~(~&reg85)) ?
                      $signed($signed(wire73)) : reg94[(2'h2):(1'h0)]) >>> $unsigned(((wire75 ?
                          reg83 : reg90) ?
                      reg89[(3'h6):(1'h0)] : $signed((8'haa))))) ?
                  wire77 : {(~&reg84[(2'h2):(1'h0)])});
              reg89 <= $signed((wire72 ?
                  (~&$signed(reg94)) : (+($signed(reg89) ?
                      $signed(wire75) : $unsigned(reg93)))));
              reg90 <= (reg82[(2'h3):(2'h3)] >>> $unsigned($signed(($unsigned(wire77) ?
                  reg93 : $unsigned((8'ha9))))));
              reg91 <= (8'ha9);
              reg92 <= $unsigned(reg89[(4'h8):(1'h0)]);
            end
          else
            begin
              reg88 <= $signed((reg86 >>> ($unsigned((~^wire78)) >> {{reg86,
                      wire72}})));
              reg89 <= wire78[(1'h1):(1'h0)];
              reg90 <= (reg90[(1'h1):(1'h1)] && reg82);
              reg91 <= ($unsigned($unsigned(wire73[(3'h6):(3'h5)])) ?
                  wire76 : $unsigned(($signed($signed((7'h41))) >>> (8'hbb))));
              reg92 <= $signed((wire76[(3'h4):(2'h2)] ?
                  reg80 : (reg87 ? reg91[(4'h8):(3'h7)] : (!wire73))));
            end
          reg93 <= (reg87[(2'h3):(1'h1)] == (reg93[(1'h1):(1'h1)] >= {reg89[(1'h0):(1'h0)],
              ($signed(reg83) ? reg82 : (~&wire78))}));
        end
      if ($signed(reg93[(5'h11):(3'h6)]))
        begin
          reg95 <= $signed($signed(({(^~reg86),
              reg85[(3'h5):(1'h1)]} ^~ reg82[(3'h4):(1'h1)])));
          reg96 <= wire73;
          reg97 <= (((wire78 ?
                  {wire78,
                      reg86[(1'h1):(1'h0)]} : (((8'hb4) & wire77) >>> {reg86,
                      (8'hbc)})) & $signed((reg82 ?
                  wire76 : (reg96 ? (8'hae) : wire79)))) ?
              {((!wire79[(4'ha):(4'h8)]) ?
                      reg84[(1'h1):(1'h1)] : ((wire76 ? reg95 : reg85) ?
                          (&(8'ha3)) : ((8'haf) ^ reg95)))} : $signed($signed(reg92)));
        end
      else
        begin
          if ($unsigned((^$unsigned($signed((!(8'ha2)))))))
            begin
              reg95 <= {(&(((^(8'haa)) - (reg80 << reg88)) ?
                      $signed($signed(reg87)) : $signed((&wire72))))};
              reg96 <= ((~&(~|reg84[(2'h3):(1'h0)])) ?
                  $unsigned(({(reg82 ? reg88 : reg91),
                      (reg86 ? reg93 : wire75)} <= {$signed(reg87),
                      (^~reg89)})) : {reg81});
              reg97 <= (~$signed($signed(wire73)));
            end
          else
            begin
              reg95 <= (((({(8'hba)} + wire77) ?
                          ((wire76 ? wire74 : reg82) ?
                              $unsigned(reg84) : (wire72 & reg87)) : $unsigned({wire76})) ?
                      ((~^(reg97 >= wire79)) ?
                          $unsigned({reg97, reg81}) : {(reg86 | wire73),
                              (reg90 ?
                                  reg92 : wire78)}) : $signed($signed((reg84 ?
                          wire75 : wire72)))) ?
                  {reg80[(1'h0):(1'h0)],
                      (($signed((8'hab)) ? $unsigned(reg92) : $signed(reg89)) ?
                          reg83 : $signed((!wire79)))} : wire73);
              reg96 <= {$signed($signed((|$unsigned(reg80))))};
              reg97 <= ($signed($signed((!(~&wire76)))) && $signed(reg94));
              reg98 <= wire77;
            end
        end
    end
  assign wire99 = reg87;
  assign wire100 = (^~(reg97[(2'h2):(2'h2)] != wire72[(1'h0):(1'h0)]));
  assign wire101 = $signed((((!(reg81 * (8'h9c))) & (reg81 == $unsigned((8'hab)))) >= (~(&{reg85,
                       reg91}))));
  assign wire102 = $unsigned($unsigned($signed($unsigned($signed(reg87)))));
  assign wire103 = ((((+$unsigned(reg82)) * wire79) ?
                       reg86[(1'h0):(1'h0)] : reg82[(3'h5):(3'h4)]) > (8'h9c));
  assign wire104 = (reg81 ?
                       (^$unsigned(wire78)) : $unsigned($signed((reg84 + $signed((7'h41))))));
endmodule

module module31  (y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire35;
  input wire [(4'h8):(1'h0)] wire34;
  input wire signed [(2'h2):(1'h0)] wire33;
  input wire [(3'h4):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire36;
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 reg64,
                 reg63,
                 reg62,
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
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg37,
                 (1'h0)};
  assign wire36 = $unsigned((8'hbd));
  always
    @(posedge clk) begin
      reg37 <= {{(~({wire32} >> $signed((8'hb8)))),
              {wire35, ((8'ha0) ? (wire36 <<< wire35) : $unsigned(wire33))}},
          $unsigned((^(wire36 != (wire36 >= wire34))))};
    end
  assign wire38 = $unsigned(((!(wire36 >= $unsigned(wire34))) ~^ $unsigned(wire32)));
  assign wire39 = $signed(wire32[(1'h0):(1'h0)]);
  assign wire40 = wire38[(3'h7):(2'h3)];
  assign wire41 = (^~((~^(wire33 <<< $unsigned(wire35))) ?
                      wire36[(3'h4):(3'h4)] : $signed(wire40)));
  always
    @(posedge clk) begin
      reg42 <= ($unsigned((wire32[(2'h3):(2'h3)] - wire33[(1'h0):(1'h0)])) ?
          (($signed((^~(8'hb7))) - {((7'h41) || reg37)}) | (^~{$signed(wire33),
              wire34[(3'h4):(1'h0)]})) : wire38);
      reg43 <= (wire39[(2'h3):(2'h3)] & wire38[(2'h2):(1'h1)]);
      reg44 <= {$signed((wire36[(1'h1):(1'h1)] ?
              wire34[(4'h8):(2'h2)] : $unsigned({wire41, reg37})))};
      reg45 <= $unsigned(($signed((!((8'ha0) ? wire40 : wire35))) ?
          reg37 : $unsigned($signed(wire36[(1'h1):(1'h1)]))));
      reg46 <= (($signed((|wire32[(1'h1):(1'h0)])) + wire38[(3'h5):(2'h3)]) >= (wire36[(2'h3):(2'h3)] <= $signed(((wire32 <<< wire36) ?
          (-(8'hb0)) : {reg43}))));
    end
  always
    @(posedge clk) begin
      reg47 <= ((wire40[(2'h3):(2'h3)] ?
              wire38[(1'h1):(1'h0)] : ($signed(wire40) < ((~|(8'ha9)) ?
                  $signed(reg42) : wire41))) ?
          wire40[(1'h0):(1'h0)] : wire41);
      reg48 <= $signed($signed({reg37[(5'h12):(4'hd)]}));
      reg49 <= (!(8'ha9));
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((({reg48, (8'ha2)} - {wire32, reg37}) ?
          {wire40, $signed(reg49)} : $unsigned(reg42[(2'h3):(1'h0)])))))
        begin
          reg50 <= reg37[(2'h3):(1'h0)];
        end
      else
        begin
          if ($unsigned(wire41[(2'h2):(2'h2)]))
            begin
              reg50 <= (~&$unsigned((reg37 ?
                  $signed($unsigned(wire34)) : $signed($unsigned((8'haa))))));
            end
          else
            begin
              reg50 <= ($unsigned((({reg37, (8'hbb)} ?
                      (reg43 ^~ reg37) : wire32) && ({reg48} | {reg48}))) ?
                  (8'ha2) : ({wire41} & $unsigned($signed((-wire34)))));
              reg51 <= reg44[(2'h2):(2'h2)];
              reg52 <= (reg44 * wire39[(2'h2):(2'h2)]);
              reg53 <= wire39[(2'h3):(2'h3)];
            end
        end
      reg54 <= reg43[(4'h9):(3'h7)];
      reg55 <= $signed(reg50[(3'h5):(3'h5)]);
      reg56 <= $unsigned(reg45);
    end
  assign wire57 = reg49[(3'h4):(1'h0)];
  assign wire58 = ($signed((reg42[(1'h1):(1'h0)] ?
                          ((reg37 ? reg52 : reg56) ?
                              (-wire36) : (wire35 ?
                                  reg48 : reg37)) : $unsigned((8'hb5)))) ?
                      (&((wire39[(2'h2):(1'h1)] ?
                          (wire57 - wire57) : $signed(reg52)) >>> wire36[(3'h5):(2'h2)])) : {wire35[(3'h5):(2'h3)],
                          $unsigned(wire57[(2'h3):(1'h1)])});
  assign wire59 = ((~|(((reg50 || (8'ha3)) ~^ $signed(reg47)) ?
                          $unsigned(reg55[(1'h1):(1'h1)]) : ((wire32 ?
                              reg53 : reg55) && (~^reg55)))) ?
                      $unsigned($unsigned((wire39[(2'h3):(2'h3)] ?
                          $unsigned(wire58) : {reg55, wire32}))) : (+wire39));
  assign wire60 = reg43[(3'h6):(1'h1)];
  assign wire61 = $signed($unsigned($signed($unsigned(reg56))));
  always
    @(posedge clk) begin
      if (wire59[(2'h2):(1'h1)])
        begin
          if (reg55)
            begin
              reg62 <= $unsigned(((wire60 ?
                  $unsigned({wire60}) : ($unsigned(wire32) >>> {reg44,
                      wire41})) != ((8'ha9) | (+(^~reg51)))));
              reg63 <= wire57;
            end
          else
            begin
              reg62 <= wire58[(3'h6):(3'h5)];
            end
          reg64 <= $signed((reg53[(4'h9):(4'h8)] ?
              reg42 : (((8'hb8) ~^ wire32[(3'h4):(1'h1)]) & reg52)));
        end
      else
        begin
          reg62 <= reg63;
          reg63 <= ((8'hbc) << {$signed(reg37[(4'ha):(3'h7)]),
              {reg44[(2'h3):(2'h3)], reg52}});
          reg64 <= (reg54[(3'h4):(2'h3)] || $signed($unsigned($unsigned(reg45[(3'h5):(3'h4)]))));
        end
    end
endmodule
