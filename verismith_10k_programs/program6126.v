module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire228;
  wire signed [(4'hc):(1'h0)] wire227;
  wire [(4'hd):(1'h0)] wire226;
  wire [(5'h14):(1'h0)] wire225;
  wire signed [(5'h11):(1'h0)] wire224;
  wire signed [(2'h2):(1'h0)] wire223;
  wire [(4'he):(1'h0)] wire222;
  wire [(5'h12):(1'h0)] wire221;
  wire signed [(4'h9):(1'h0)] wire220;
  wire [(3'h7):(1'h0)] wire219;
  wire [(2'h2):(1'h0)] wire218;
  wire [(5'h15):(1'h0)] wire217;
  wire [(4'he):(1'h0)] wire216;
  wire [(2'h2):(1'h0)] wire215;
  wire [(5'h13):(1'h0)] wire212;
  wire signed [(3'h5):(1'h0)] wire211;
  wire [(4'h9):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire209;
  reg signed [(5'h10):(1'h0)] reg214 = (1'h0);
  reg [(4'h9):(1'h0)] reg213 = (1'h0);
  assign y = {wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire212,
                 wire211,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire209,
                 reg214,
                 reg213,
                 (1'h0)};
  assign wire4 = (wire0 - $signed((8'hb7)));
  assign wire5 = wire4;
  assign wire6 = ((!$unsigned(((wire2 && (8'hb1)) ?
                         (&wire4) : $unsigned(wire1)))) ?
                     wire1 : ((wire4[(3'h7):(1'h1)] >> ({wire1,
                         wire4} << $unsigned(wire2))) && (8'h9d)));
  assign wire7 = (wire4 ?
                     wire2[(3'h4):(1'h0)] : (($unsigned(wire3) >> ($unsigned(wire6) ?
                         ((8'hab) ?
                             wire1 : wire3) : (wire2 << wire4))) && wire5));
  module8 #() modinst210 (.wire13(wire3), .y(wire209), .wire10(wire2), .clk(clk), .wire9(wire0), .wire11(wire1), .wire12(wire6));
  assign wire211 = $signed($signed($signed((^~wire3))));
  assign wire212 = wire2;
  always
    @(posedge clk) begin
      reg213 <= ((7'h44) ? $unsigned(wire211) : wire7[(2'h2):(2'h2)]);
      reg214 <= ($signed((~$unsigned({wire2, wire6}))) ?
          wire211[(3'h4):(3'h4)] : wire1);
    end
  assign wire215 = (^((((+wire7) && (wire1 ?
                       wire209 : wire209)) ^~ (reg213[(1'h0):(1'h0)] ?
                       (+wire4) : (~|(8'hb7)))) + $unsigned({$signed(wire2),
                       (~&wire211)})));
  assign wire216 = wire5;
  assign wire217 = (reg214 ?
                       $signed(wire209) : (^~(wire4[(2'h2):(1'h1)] != $signed((wire7 ^ (8'hb1))))));
  assign wire218 = wire5;
  assign wire219 = wire5;
  assign wire220 = {(($signed((reg214 ?
                               wire7 : (8'h9e))) > wire216[(4'hd):(4'hd)]) ?
                           (7'h40) : ((^((7'h42) | wire1)) <<< wire2)),
                       wire6[(4'hf):(4'hb)]};
  assign wire221 = {{(wire217[(3'h7):(3'h6)] ?
                               ({wire209} ?
                                   $signed(wire5) : (8'hb0)) : $unsigned($unsigned((8'hbe))))},
                       (({((7'h40) ^~ wire3), (~|wire219)} ?
                           ((+wire209) | ((8'hbf) ?
                               (8'h9c) : (8'hb9))) : (~|(reg213 & wire218))) > (~|{(wire216 ?
                               reg214 : wire5),
                           wire2}))};
  assign wire222 = {$unsigned(wire0[(4'hb):(3'h6)])};
  assign wire223 = $signed($unsigned((|($unsigned(wire2) ?
                       $signed(wire209) : wire220))));
  assign wire224 = ($signed((wire4 ? wire223 : (|(wire3 ~^ wire216)))) ?
                       $unsigned(wire222[(3'h5):(1'h0)]) : wire6[(4'h8):(3'h5)]);
  assign wire225 = wire2[(4'h8):(3'h4)];
  assign wire226 = wire225;
  assign wire227 = $signed((8'hb0));
  assign wire228 = wire2;
endmodule

module module8
#(parameter param207 = (((((~&(8'hba)) | ((8'hb7) ? (8'hac) : (8'had))) > (((8'h9c) ? (8'ha9) : (8'hbd)) >= (-(8'haa)))) ? (8'ha4) : ((((8'hb1) ? (8'hbb) : (8'hb4)) ? (~&(8'hba)) : ((7'h42) >> (7'h42))) ? {((8'hbb) ? (8'ha1) : (8'h9e))} : (!((8'ha0) <= (8'ha4))))) ^~ ({(!((8'h9e) >= (8'hbf)))} >>> ({((7'h40) * (8'h9c)), ((7'h43) ? (8'hab) : (8'ha7))} ^~ (((7'h42) ? (8'hb5) : (8'ha6)) < (!(8'hb0)))))), 
parameter param208 = ((~{(param207 || {param207})}) ? param207 : (8'h9e)))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h2c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire206;
  wire signed [(4'h9):(1'h0)] wire205;
  wire signed [(4'hd):(1'h0)] wire203;
  wire signed [(5'h12):(1'h0)] wire170;
  wire [(5'h15):(1'h0)] wire169;
  wire signed [(4'he):(1'h0)] wire168;
  wire signed [(4'h8):(1'h0)] wire167;
  wire signed [(4'he):(1'h0)] wire144;
  wire [(5'h15):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire14;
  reg [(5'h15):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg164 = (1'h0);
  reg [(4'h8):(1'h0)] reg163 = (1'h0);
  reg [(3'h4):(1'h0)] reg162 = (1'h0);
  reg [(2'h2):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg [(2'h2):(1'h0)] reg159 = (1'h0);
  reg [(4'he):(1'h0)] reg158 = (1'h0);
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg155 = (1'h0);
  reg [(4'h9):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg152 = (1'h0);
  reg [(3'h7):(1'h0)] reg151 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire203,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire144,
                 wire109,
                 wire67,
                 wire65,
                 wire37,
                 wire19,
                 wire14,
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
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire14 = wire11;
  always
    @(posedge clk) begin
      reg15 <= wire10[(2'h2):(1'h1)];
      reg16 <= (!$unsigned((~|wire14[(5'h10):(4'h9)])));
      reg17 <= $signed((wire14[(4'he):(3'h4)] >= (~|$signed(wire9[(4'hc):(3'h5)]))));
      reg18 <= $signed(wire13[(5'h12):(4'ha)]);
    end
  assign wire19 = wire12[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg20 <= (reg15[(2'h2):(1'h0)] ? wire19 : (wire13 ? (~(8'hbb)) : wire13));
      if ($unsigned(wire11))
        begin
          if ({(~^$signed((-$unsigned(reg20)))),
              {$unsigned(wire10[(1'h0):(1'h0)])}})
            begin
              reg21 <= $unsigned((~^($unsigned($unsigned(wire9)) ?
                  (wire10[(2'h2):(1'h1)] ?
                      (~^wire12) : wire19[(1'h1):(1'h1)]) : {(wire13 <= reg18)})));
              reg22 <= (reg21[(2'h2):(1'h1)] != {$signed(wire12[(3'h4):(1'h0)]),
                  $unsigned(((wire9 ? reg20 : reg20) ?
                      $unsigned(wire14) : $signed(reg18)))});
              reg23 <= ($unsigned((-$unsigned($signed(wire11)))) ?
                  $unsigned((reg18 || $signed((wire12 <<< reg15)))) : reg22[(4'he):(2'h3)]);
            end
          else
            begin
              reg21 <= (8'hb3);
              reg22 <= $signed(($signed($signed($signed(wire19))) | $unsigned((~^$unsigned((8'ha6))))));
              reg23 <= (~reg22[(4'ha):(3'h6)]);
              reg24 <= $signed(($signed($unsigned(reg16[(1'h1):(1'h1)])) > $signed($signed({(8'h9e)}))));
              reg25 <= (7'h44);
            end
        end
      else
        begin
          reg21 <= reg16;
          reg22 <= $signed(reg22);
          reg23 <= (+$unsigned(reg24[(4'hb):(3'h6)]));
          if ((7'h43))
            begin
              reg24 <= ({($unsigned(reg22[(4'hf):(4'hb)]) || $signed($unsigned(reg16)))} <<< (~^$unsigned((7'h40))));
              reg25 <= wire9[(4'ha):(3'h4)];
            end
          else
            begin
              reg24 <= $unsigned((~|$signed((~$unsigned(reg23)))));
              reg25 <= $unsigned((($unsigned($signed(reg21)) > (8'h9e)) & (-$signed(reg22))));
              reg26 <= {reg21[(3'h4):(2'h2)]};
            end
          reg27 <= {(reg20[(2'h2):(1'h1)] ? $unsigned(wire9) : wire14)};
        end
      if ({reg16[(2'h2):(2'h2)], $signed((-$signed({wire10, (8'hac)})))})
        begin
          reg28 <= $unsigned($signed(($unsigned(wire19[(3'h4):(1'h0)]) < reg26[(3'h5):(2'h2)])));
          if ($signed(wire10[(2'h3):(1'h1)]))
            begin
              reg29 <= reg21[(3'h5):(3'h4)];
              reg30 <= $unsigned(wire13);
              reg31 <= (^~($unsigned((reg21[(3'h4):(3'h4)] ~^ $unsigned(wire12))) ?
                  (((reg18 ? reg17 : reg21) ?
                      wire11 : $signed(wire14)) != $signed($unsigned(wire9))) : ((wire14 == wire13[(3'h6):(2'h3)]) < $unsigned($unsigned(reg29)))));
              reg32 <= (|$signed((8'hb8)));
            end
          else
            begin
              reg29 <= $signed($unsigned((((^wire13) ?
                      reg22 : reg23[(5'h12):(3'h5)]) ?
                  (8'hac) : $unsigned((reg32 || wire9)))));
            end
          if ((+$signed((8'hb4))))
            begin
              reg33 <= ((((&$unsigned(reg17)) ?
                  ((8'hb9) && {reg30}) : ($unsigned(reg18) << reg15[(2'h2):(1'h1)])) <<< $signed(((wire19 << reg22) > wire12))) && (($unsigned(reg27) ?
                      {reg29[(4'he):(2'h2)],
                          $signed(reg15)} : reg23[(2'h2):(2'h2)]) ?
                  (8'ha2) : $signed((^$unsigned(reg26)))));
              reg34 <= reg32[(3'h5):(1'h0)];
              reg35 <= reg20[(2'h2):(1'h0)];
              reg36 <= $unsigned(reg17[(1'h1):(1'h0)]);
            end
          else
            begin
              reg33 <= $signed($signed(reg33[(1'h0):(1'h0)]));
              reg34 <= ($signed($signed(($signed(reg17) < (!reg33)))) ?
                  ($signed(((^wire11) ?
                      $signed(reg24) : (+reg24))) >>> $signed($unsigned((~&wire9)))) : ({(reg31[(3'h6):(3'h4)] ?
                          $signed((8'h9f)) : $signed(reg36)),
                      $signed($unsigned(reg32))} & wire19[(4'hc):(1'h1)]));
              reg35 <= reg32;
            end
        end
      else
        begin
          reg28 <= wire11[(3'h7):(2'h2)];
          reg29 <= ($signed(((reg28 ?
                  $unsigned(wire9) : ((8'h9e) ^ reg30)) >>> (reg20 ?
                  (^~reg24) : $signed(wire13)))) ?
              reg32 : reg32[(4'ha):(1'h1)]);
          reg30 <= ((reg32[(3'h6):(1'h0)] ?
              $signed(((8'hb5) ?
                  (reg15 + (8'ha4)) : {reg33})) : $unsigned($signed(reg34))) & wire11[(5'h11):(5'h10)]);
          reg31 <= $unsigned(reg16[(2'h2):(2'h2)]);
        end
    end
  assign wire37 = $signed(wire12[(2'h3):(1'h0)]);
  module38 #() modinst66 (wire65, clk, reg17, wire19, reg29, wire12);
  assign wire67 = reg22[(4'he):(3'h4)];
  module68 #() modinst110 (wire109, clk, reg21, reg20, wire9, wire12);
  module111 #() modinst145 (.wire113(wire9), .wire115(reg23), .clk(clk), .wire114(reg27), .wire116(wire109), .wire112(reg15), .y(wire144));
  always
    @(posedge clk) begin
      if (reg26)
        begin
          reg146 <= $unsigned(reg24);
          reg147 <= (reg17[(2'h3):(2'h3)] != (-reg25));
          reg148 <= wire9;
          if (($unsigned(wire13[(4'hc):(2'h2)]) ~^ reg32[(2'h3):(2'h3)]))
            begin
              reg149 <= {(reg147[(3'h5):(2'h3)] ?
                      ((reg18[(4'hc):(4'h8)] ? (reg23 < reg33) : (-wire13)) ?
                          $unsigned(reg24[(2'h2):(1'h1)]) : ($unsigned(reg31) ?
                              $signed(reg33) : $signed(reg30))) : reg24)};
              reg150 <= reg21[(5'h14):(4'ha)];
              reg151 <= reg24;
            end
          else
            begin
              reg149 <= ($signed((($unsigned(reg18) || reg16) ^ (reg146 & (+reg21)))) - (^$signed((~((8'hb6) ?
                  reg146 : reg148)))));
              reg150 <= $signed(reg20[(3'h7):(3'h4)]);
              reg151 <= ($unsigned((^(8'hb5))) > reg20[(4'ha):(3'h4)]);
            end
          if (reg36)
            begin
              reg152 <= reg29[(3'h6):(2'h3)];
              reg153 <= {$signed((^wire11[(3'h5):(3'h4)])),
                  ((wire65 ? $signed($signed(reg26)) : wire11) ?
                      ($signed((~reg17)) << $signed(reg35[(4'h9):(3'h6)])) : (~|reg33))};
            end
          else
            begin
              reg152 <= ((($unsigned((wire19 || wire9)) <= {(reg31 == reg16),
                          {wire14, reg29}}) ?
                      $unsigned((~^$signed(reg153))) : reg32[(1'h1):(1'h1)]) ?
                  (&{((wire37 ? reg25 : reg146) ?
                          (wire67 ? reg23 : reg148) : reg29),
                      ($unsigned(reg26) ?
                          $unsigned(reg35) : (reg151 ?
                              reg22 : wire13))}) : reg26[(4'ha):(4'ha)]);
            end
        end
      else
        begin
          if ((^reg29))
            begin
              reg146 <= (wire9[(3'h5):(1'h0)] ?
                  (&(8'ha5)) : $unsigned(($signed((~^wire12)) < reg30)));
              reg147 <= ((+wire9) - {($signed(wire9) * $unsigned(wire67)),
                  (~|$signed((wire19 >= reg29)))});
            end
          else
            begin
              reg146 <= (~(|(((reg34 ? wire67 : reg151) || $unsigned(wire19)) ?
                  $unsigned((reg34 ?
                      reg31 : reg15)) : ($unsigned(reg31) & (~&(8'hb2))))));
              reg147 <= $signed($signed($unsigned(({reg28, reg153} ?
                  $signed(reg148) : $unsigned(reg15)))));
              reg148 <= ((8'hb1) <<< (~|{reg153[(2'h2):(1'h1)]}));
              reg149 <= ({$signed(((wire12 ? reg32 : reg33) * (8'hb7))),
                      $signed((wire13[(4'h8):(3'h4)] + (wire13 ?
                          reg16 : wire19)))} ?
                  (~^({(reg153 ? wire19 : reg18),
                      (wire14 ?
                          reg146 : reg16)} | $signed(wire13[(2'h2):(2'h2)]))) : reg150[(2'h3):(1'h0)]);
              reg150 <= (~^reg32[(2'h2):(1'h0)]);
            end
        end
      if (reg25)
        begin
          reg154 <= $signed(reg26[(3'h6):(3'h6)]);
        end
      else
        begin
          if ((!($signed((~$unsigned(wire67))) ?
              ($signed($signed(reg147)) <<< $unsigned((~|(8'hb2)))) : (~$unsigned((^(7'h43)))))))
            begin
              reg154 <= reg27[(4'h9):(3'h6)];
              reg155 <= (&$unsigned((8'ha1)));
              reg156 <= (^(|$unsigned(((reg32 ? wire11 : reg23) >> (wire14 ?
                  wire65 : reg148)))));
              reg157 <= {(8'h9f)};
              reg158 <= ((reg152[(2'h2):(1'h1)] & ($signed((~^wire11)) <= reg151)) ?
                  ($signed((~^$unsigned(reg154))) ?
                      reg147[(1'h0):(1'h0)] : $unsigned({(-reg20)})) : $signed(wire109));
            end
          else
            begin
              reg154 <= $unsigned($unsigned(reg15));
              reg155 <= wire14[(5'h11):(3'h5)];
              reg156 <= $signed($signed(reg18));
              reg157 <= reg156[(4'ha):(1'h0)];
            end
          reg159 <= reg32;
        end
      reg160 <= reg151[(1'h1):(1'h1)];
      if (reg23[(3'h4):(2'h2)])
        begin
          reg161 <= $unsigned((+(&(~^$signed(wire14)))));
          reg162 <= (7'h42);
          if (reg160[(4'hb):(4'h9)])
            begin
              reg163 <= (~&{(((reg31 <= wire13) - (reg158 ? wire19 : reg155)) ?
                      $unsigned(wire10[(4'ha):(3'h7)]) : $unsigned($signed(wire10))),
                  $unsigned((reg154 ? reg159[(2'h2):(1'h0)] : (~wire67)))});
              reg164 <= ($unsigned(wire37[(4'hc):(4'ha)]) ?
                  wire65 : $unsigned({(~{reg27}),
                      {reg33[(1'h1):(1'h0)], (~reg33)}}));
              reg165 <= ($signed(reg157) ^ {(!{((8'haa) ? reg30 : wire144)}),
                  $unsigned(reg21)});
              reg166 <= reg154;
            end
          else
            begin
              reg163 <= $signed(reg33);
              reg164 <= $signed({{reg36}});
              reg165 <= $unsigned(($unsigned($unsigned($signed(wire11))) ?
                  wire37[(4'hc):(3'h4)] : reg148));
            end
        end
      else
        begin
          reg161 <= $unsigned($unsigned(reg27));
          reg162 <= reg165[(3'h6):(2'h2)];
          reg163 <= reg27;
          reg164 <= (-(8'h9c));
          reg165 <= ($unsigned(reg148[(3'h7):(3'h7)]) ~^ {{$unsigned((^~reg33)),
                  ((~&reg20) << (8'hb0))},
              $unsigned({$signed(reg150), wire37})});
        end
    end
  assign wire167 = reg27[(4'ha):(4'h9)];
  assign wire168 = {reg158[(2'h2):(2'h2)]};
  assign wire169 = (~^(((((8'h9c) <<< reg165) >= (reg148 > (8'h9d))) != $signed((|reg22))) ^ ({(reg22 ^~ reg159)} && (8'hb2))));
  assign wire170 = $unsigned($signed(reg15));
  module171 #() modinst204 (wire203, clk, reg30, wire9, wire169, reg31);
  assign wire205 = ($signed($signed($signed((wire144 ^~ reg36)))) <= $signed(reg161));
  assign wire206 = (reg17[(3'h6):(3'h4)] ?
                       (reg17[(4'h9):(3'h6)] && (+({reg22} || (-reg164)))) : (~$signed(((reg161 ?
                               reg149 : reg15) ?
                           (reg29 * reg28) : wire169))));
endmodule

module module171  (y, clk, wire175, wire174, wire173, wire172);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire175;
  input wire [(4'h8):(1'h0)] wire174;
  input wire [(3'h6):(1'h0)] wire173;
  input wire signed [(3'h6):(1'h0)] wire172;
  wire [(3'h6):(1'h0)] wire202;
  wire signed [(2'h2):(1'h0)] wire194;
  wire signed [(4'h9):(1'h0)] wire193;
  wire signed [(5'h13):(1'h0)] wire192;
  wire [(5'h12):(1'h0)] wire191;
  wire signed [(5'h12):(1'h0)] wire190;
  wire [(5'h10):(1'h0)] wire189;
  wire [(3'h5):(1'h0)] wire188;
  wire signed [(5'h11):(1'h0)] wire187;
  wire [(5'h10):(1'h0)] wire186;
  wire signed [(5'h15):(1'h0)] wire185;
  wire signed [(5'h11):(1'h0)] wire184;
  wire [(5'h12):(1'h0)] wire183;
  wire signed [(3'h5):(1'h0)] wire182;
  wire [(3'h5):(1'h0)] wire181;
  wire [(2'h2):(1'h0)] wire179;
  wire signed [(4'ha):(1'h0)] wire178;
  wire signed [(5'h13):(1'h0)] wire177;
  wire [(3'h7):(1'h0)] wire176;
  reg signed [(3'h5):(1'h0)] reg201 = (1'h0);
  reg [(3'h7):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg199 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg197 = (1'h0);
  reg [(2'h2):(1'h0)] reg196 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg180 = (1'h0);
  assign y = {wire202,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg180,
                 (1'h0)};
  assign wire176 = ((wire172 ?
                       $signed(wire174) : ((wire175[(4'h9):(4'h8)] ?
                               (|wire175) : $unsigned(wire172)) ?
                           $signed(wire174[(1'h0):(1'h0)]) : (~&(wire172 ?
                               wire172 : wire175)))) * ({wire173[(3'h6):(1'h1)]} <= (^(((8'haa) ?
                       wire175 : wire172) <= (~&wire173)))));
  assign wire177 = $signed(wire175);
  assign wire178 = $signed($unsigned((wire172[(3'h4):(1'h0)] ?
                       wire173 : (!$signed(wire174)))));
  assign wire179 = wire178[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg180 <= (+(($unsigned($signed((8'hbd))) + {wire172[(1'h0):(1'h0)]}) ^ $signed(($unsigned(wire176) ?
          (8'hae) : wire173[(3'h5):(1'h1)]))));
    end
  assign wire181 = $signed(wire177);
  assign wire182 = (wire181 | wire181[(3'h4):(2'h2)]);
  assign wire183 = ($signed(($signed($signed(wire174)) ?
                           (((8'ha6) <<< wire181) ?
                               $signed(wire178) : {wire178,
                                   wire177}) : $signed($unsigned(wire182)))) ?
                       wire172[(3'h4):(2'h3)] : wire172);
  assign wire184 = reg180;
  assign wire185 = $signed((($signed((wire175 + wire179)) ?
                           wire182 : $signed((wire179 || wire178))) ?
                       {({wire178} ?
                               wire183 : {wire183,
                                   wire184})} : ($signed($signed(wire173)) ?
                           $signed((wire181 == wire177)) : ((&wire179) || {wire183,
                               wire181}))));
  assign wire186 = (7'h42);
  assign wire187 = wire181[(2'h3):(1'h0)];
  assign wire188 = wire174;
  assign wire189 = ((!$unsigned((&$signed(wire173)))) ?
                       ((^$signed((-wire172))) < (|((wire186 != wire186) ?
                           (wire188 ?
                               wire174 : (8'hb8)) : (wire186 >= wire174)))) : (7'h42));
  assign wire190 = wire178[(3'h6):(3'h4)];
  assign wire191 = (^~(~|(~|{wire182[(3'h4):(2'h3)], (wire185 ~^ (8'hb8))})));
  assign wire192 = (8'ha3);
  assign wire193 = wire183[(5'h11):(3'h6)];
  assign wire194 = wire174;
  always
    @(posedge clk) begin
      if (((!{$signed(wire189[(5'h10):(2'h2)])}) ?
          wire181 : ((~$unsigned((wire178 ?
              wire185 : wire192))) != wire179[(2'h2):(2'h2)])))
        begin
          reg195 <= (|(8'hab));
          reg196 <= $unsigned((8'hb6));
          reg197 <= wire186;
        end
      else
        begin
          reg195 <= $unsigned(wire179[(2'h2):(2'h2)]);
        end
      reg198 <= {reg197[(4'h9):(3'h6)],
          (wire177[(5'h12):(5'h12)] * wire176[(3'h6):(3'h6)])};
      reg199 <= wire181;
      reg200 <= {wire175};
      reg201 <= (~|wire174[(1'h1):(1'h0)]);
    end
  assign wire202 = ((8'hba) <<< wire173[(1'h1):(1'h1)]);
endmodule

module module111
#(parameter param143 = {(^~((((8'hbc) ? (8'hb4) : (8'ha7)) <= {(8'hbd), (7'h41)}) && ((-(8'h9c)) <<< ((8'hae) == (8'hba))))), ((-(^((8'had) ? (8'hb3) : (8'hb4)))) ~^ ({((8'hb1) == (8'hae))} ? {(^~(7'h44)), (-(8'hae))} : (((8'h9d) ? (8'had) : (8'haf)) ? (8'h9f) : {(8'hbb)})))})
(y, clk, wire116, wire115, wire114, wire113, wire112);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire116;
  input wire [(3'h4):(1'h0)] wire115;
  input wire [(3'h6):(1'h0)] wire114;
  input wire [(5'h11):(1'h0)] wire113;
  input wire signed [(4'he):(1'h0)] wire112;
  wire signed [(2'h3):(1'h0)] wire129;
  wire [(4'hf):(1'h0)] wire128;
  wire signed [(3'h6):(1'h0)] wire127;
  reg signed [(5'h13):(1'h0)] reg142 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg137 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(4'hd):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  reg [(3'h4):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(4'ha):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg117 <= $signed($unsigned((^~$unsigned(wire113))));
      if ($unsigned(wire115[(1'h0):(1'h0)]))
        begin
          reg118 <= {($unsigned((((8'hb0) > wire115) <= wire113)) ^~ {{(&reg117),
                      $signed(wire114)}})};
        end
      else
        begin
          reg118 <= wire116;
          reg119 <= (~^(((+wire116) ?
                  $signed($signed(reg117)) : wire112[(1'h0):(1'h0)]) ?
              (reg118 ?
                  (^~(wire115 != wire116)) : reg117) : $unsigned(((~&(8'ha0)) != $signed(wire116)))));
          if ((reg117[(3'h4):(1'h0)] ?
              (+(wire116[(5'h11):(4'hd)] & $unsigned(((8'hb0) >> (8'ha6))))) : $unsigned(reg118)))
            begin
              reg120 <= $signed(wire115[(2'h3):(2'h2)]);
              reg121 <= {(^$signed((~wire114[(1'h1):(1'h1)]))),
                  (wire113[(4'h9):(4'h8)] & {(!wire115)})};
              reg122 <= $signed((wire115[(2'h2):(1'h1)] ?
                  (8'hb5) : (+($unsigned((8'hb0)) ?
                      $signed(wire116) : wire115))));
              reg123 <= $signed($unsigned({(^~(~&reg120)), (^(~^reg121))}));
              reg124 <= $unsigned((~&$signed(wire112)));
            end
          else
            begin
              reg120 <= $unsigned((((wire113[(1'h0):(1'h0)] ?
                      wire112[(4'hc):(3'h4)] : reg123) - reg124[(4'ha):(2'h3)]) ?
                  (8'ha0) : $signed($signed((reg119 ? (8'hb7) : wire116)))));
              reg121 <= $unsigned($signed(reg123[(1'h0):(1'h0)]));
              reg122 <= $unsigned(wire112[(4'hc):(4'ha)]);
              reg123 <= $unsigned(((~reg122) ?
                  wire115[(2'h2):(2'h2)] : $signed($signed($signed(wire114)))));
            end
        end
      reg125 <= reg124;
      reg126 <= (~((($unsigned(reg125) ? {wire114} : $signed((8'haa))) ?
              (&reg119) : {$signed(reg125)}) ?
          (reg119 ?
              (8'hab) : $signed((reg119 ?
                  reg125 : reg121))) : $signed({((8'hb4) ? reg122 : reg125),
              (^(8'hb5))})));
    end
  assign wire127 = ((8'haa) ?
                       wire115 : $unsigned($signed($signed({reg121,
                           wire113}))));
  assign wire128 = (|wire127);
  assign wire129 = wire128;
  always
    @(posedge clk) begin
      reg130 <= ($signed($unsigned((reg125[(2'h2):(2'h2)] ?
          (wire116 ?
              wire129 : wire115) : (^~reg122)))) * reg120[(2'h2):(1'h1)]);
      reg131 <= $signed({(((wire112 ?
              (7'h42) : reg126) ^~ $signed(reg120)) >= reg118[(3'h4):(1'h1)]),
          $signed({(reg121 >>> reg126)})});
      reg132 <= (+reg125[(4'hb):(4'hb)]);
      if ((reg130 ? $unsigned(reg132[(4'h9):(3'h5)]) : reg122))
        begin
          reg133 <= ((8'haa) ? wire112 : $unsigned((^~reg120[(4'ha):(2'h2)])));
          if ($unsigned({$signed({$unsigned(reg123), (reg131 <= wire127)}),
              $unsigned($signed((wire112 ? wire113 : wire114)))}))
            begin
              reg134 <= (~|$unsigned(((+reg133) - {(reg118 == (8'hb0))})));
              reg135 <= reg126;
            end
          else
            begin
              reg134 <= $signed(((wire112[(4'hd):(4'h8)] << (!$signed(reg124))) ?
                  (reg133[(1'h0):(1'h0)] << reg133) : (^~$unsigned($unsigned(reg126)))));
              reg135 <= {($signed((reg134[(4'h9):(3'h4)] <= {reg120})) ?
                      ($unsigned((wire112 ? reg133 : wire115)) ?
                          ({reg117} ?
                              (wire129 ?
                                  wire128 : reg133) : $signed(wire128)) : wire129) : reg122)};
              reg136 <= (|(~&reg130[(1'h0):(1'h0)]));
            end
          reg137 <= ({$signed(reg121[(3'h6):(3'h4)])} ?
              ((($signed(reg135) ?
                  $unsigned(wire114) : $signed((8'hbf))) <= $signed((reg134 * reg123))) >= reg122[(4'h9):(3'h6)]) : (~|wire128));
          if ((^(~|($unsigned((wire113 == reg130)) ?
              $signed(reg122) : $unsigned(reg119[(4'hb):(3'h7)])))))
            begin
              reg138 <= ($signed(reg131) ?
                  reg118 : ($unsigned((^~reg136)) ?
                      ($signed((wire112 ?
                          wire114 : reg132)) || reg135) : $signed(((~|reg136) ?
                          wire116[(4'h8):(1'h1)] : (reg125 == (8'hbd))))));
            end
          else
            begin
              reg138 <= (~^$unsigned(wire127));
            end
        end
      else
        begin
          reg133 <= {reg134,
              ({(wire127 ^~ reg119[(4'hc):(4'ha)]),
                  $signed($unsigned(reg119))} >> ((8'h9e) * (wire127 ?
                  (wire114 ? wire116 : reg132) : (~^reg137))))};
          reg134 <= ((~|$unsigned((~{(8'ha8)}))) ?
              reg136 : reg126[(4'hc):(4'h9)]);
          reg135 <= {($unsigned(reg118) ? reg119 : wire116[(3'h5):(1'h1)]),
              $signed({reg126, (~|(~reg121))})};
          reg136 <= (reg137 ? {reg135, {reg135}} : reg138);
        end
      if ($unsigned({$signed((+reg123)), reg124}))
        begin
          reg139 <= (reg121[(4'h9):(3'h7)] ?
              (^~(({reg137, reg122} ?
                  reg136[(1'h1):(1'h1)] : {reg133}) >>> $signed({reg133}))) : $unsigned(($signed({wire114}) ?
                  reg138 : $unsigned((wire112 < reg134)))));
          reg140 <= $unsigned(reg136);
        end
      else
        begin
          reg139 <= (~^(8'hb6));
          reg140 <= (&(8'haf));
          reg141 <= reg118;
          reg142 <= $unsigned(reg135);
        end
    end
endmodule

module module68
#(parameter param108 = ((((((8'ha9) ? (8'h9e) : (8'hae)) >= ((7'h40) == (8'hb2))) ? ((~&(8'hac)) ? {(8'hbc)} : (+(8'hbb))) : (((7'h43) ? (7'h40) : (8'hb0)) ^~ ((8'hb7) ~^ (8'ha5)))) ? (((+(7'h43)) ? ((8'ha8) ? (8'hb3) : (8'hb1)) : ((8'hb2) > (7'h42))) >> (((8'hb1) ? (8'h9c) : (8'hbe)) <<< {(8'hb6), (8'hba)})) : (^((~^(8'hb8)) ? ((8'hb2) ? (8'hae) : (8'had)) : {(8'ha4), (8'ha3)}))) - ((8'hb0) & (^~({(8'h9c)} ? {(8'ha5), (8'h9f)} : ((8'hac) ? (8'ha2) : (8'hb7)))))))
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h183):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire72;
  input wire [(2'h3):(1'h0)] wire71;
  input wire signed [(5'h10):(1'h0)] wire70;
  input wire [(4'h8):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire98,
                 wire97,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
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
                 (1'h0)};
  assign wire73 = {(({(wire72 ? wire70 : wire71), (8'hb1)} ?
                          {(wire70 || wire72)} : ({(8'ha9), wire70} ?
                              {wire71} : (wire70 >>> wire70))) >>> wire69),
                      $signed((wire69 ?
                          wire70[(2'h2):(1'h1)] : (^wire71[(2'h2):(1'h1)])))};
  assign wire74 = (|(wire71[(1'h1):(1'h0)] ?
                      $unsigned(((&(8'h9e)) | (^~(7'h41)))) : ($signed(wire71[(1'h1):(1'h1)]) | (wire72[(3'h6):(3'h5)] > (~^wire73)))));
  assign wire75 = ((8'hb8) ?
                      {(wire70 ? $signed(wire74) : wire74),
                          wire71[(2'h2):(2'h2)]} : (&(~&($signed((8'ha4)) ^~ wire71))));
  assign wire76 = wire75;
  assign wire77 = $signed({$unsigned(((wire71 ? wire69 : wire70) ?
                          {wire75} : (wire69 ? (8'ha6) : wire76))),
                      ({(~&(7'h41))} || {$signed(wire72), wire71})});
  assign wire78 = ((^~((~^wire74[(4'ha):(2'h3)]) ?
                          $signed((wire71 ?
                              wire70 : wire71)) : $signed($unsigned(wire76)))) ?
                      $signed((8'haa)) : $unsigned($signed($signed($signed(wire77)))));
  assign wire79 = ({wire74} ?
                      $unsigned({(-$unsigned(wire74))}) : (~$unsigned((wire69[(1'h1):(1'h0)] == (&wire74)))));
  assign wire80 = wire69;
  always
    @(posedge clk) begin
      if ($signed(wire71))
        begin
          reg81 <= wire74[(2'h2):(1'h0)];
          reg82 <= wire70;
          reg83 <= (wire70 ?
              (~^wire77) : (wire80[(1'h1):(1'h1)] ~^ (^~((8'h9e) <= reg81[(1'h1):(1'h1)]))));
          if ((8'hb2))
            begin
              reg84 <= $signed(wire80);
              reg85 <= $signed(($unsigned($signed((wire71 * wire76))) << {wire73}));
            end
          else
            begin
              reg84 <= {$signed($signed({wire72, $unsigned(wire79)})), wire79};
              reg85 <= ($unsigned($signed(((reg84 != wire72) ?
                      (wire69 ? wire76 : reg82) : (wire74 ?
                          wire78 : (8'ha8))))) ?
                  {wire74[(4'he):(4'h9)]} : ($unsigned((((7'h40) ?
                      reg83 : wire80) | (|(8'ha2)))) | (^(wire77[(1'h1):(1'h0)] & (8'hbe)))));
              reg86 <= $unsigned(reg83);
            end
          if (reg84)
            begin
              reg87 <= $signed(wire76);
            end
          else
            begin
              reg87 <= wire77[(2'h2):(2'h2)];
              reg88 <= ($unsigned((|$unsigned(wire76))) * reg84);
              reg89 <= wire74;
              reg90 <= wire79[(4'hd):(1'h1)];
            end
        end
      else
        begin
          if (reg88[(4'hf):(4'h9)])
            begin
              reg81 <= wire75[(3'h6):(1'h1)];
              reg82 <= (8'haa);
              reg83 <= $unsigned((-wire69));
              reg84 <= wire73[(3'h6):(3'h6)];
            end
          else
            begin
              reg81 <= (((reg90[(3'h5):(2'h3)] && (wire75 - $signed(reg90))) ?
                      reg90 : wire70) ?
                  $signed({wire70}) : $signed($signed(wire73)));
            end
        end
      reg91 <= (!$signed(reg86));
      if ({wire77})
        begin
          reg92 <= wire71;
          if ((8'haa))
            begin
              reg93 <= (wire70[(4'he):(3'h6)] ?
                  $unsigned($unsigned(wire77[(2'h2):(1'h1)])) : reg81);
              reg94 <= $unsigned(wire73[(1'h1):(1'h0)]);
              reg95 <= $unsigned((reg92 * (~|$signed($unsigned(wire77)))));
              reg96 <= $unsigned(reg82[(4'h8):(4'h8)]);
            end
          else
            begin
              reg93 <= $signed(wire74);
              reg94 <= (8'ha0);
              reg95 <= $signed((reg89 ^~ (($unsigned(reg84) ?
                  $signed(wire79) : wire80[(4'h8):(1'h0)]) ~^ $unsigned($unsigned(reg96)))));
            end
        end
      else
        begin
          reg92 <= wire79[(5'h10):(5'h10)];
          if ({$unsigned(reg90[(3'h7):(3'h4)]),
              ((wire77 > wire69) ?
                  wire74[(1'h0):(1'h0)] : (wire71 >> ((~&wire71) ?
                      $unsigned(reg83) : $unsigned(reg95))))})
            begin
              reg93 <= (^($unsigned($unsigned((reg90 || wire72))) || reg90[(3'h7):(2'h3)]));
            end
          else
            begin
              reg93 <= $unsigned((wire79[(1'h1):(1'h0)] ?
                  $signed((|{wire74})) : $signed($signed(wire69[(3'h5):(1'h1)]))));
              reg94 <= (wire71[(2'h3):(2'h3)] & {$signed($unsigned(wire75[(3'h6):(3'h5)])),
                  (wire71[(1'h1):(1'h0)] ?
                      {reg95[(1'h0):(1'h0)]} : wire74[(2'h2):(1'h1)])});
            end
        end
    end
  assign wire97 = $signed({(wire80[(4'h8):(2'h2)] ?
                          wire77 : ((+wire76) ^~ $signed(reg83))),
                      ((~&{(8'hb9)}) && (reg81 > reg91[(1'h1):(1'h1)]))});
  assign wire98 = reg94[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg99 <= (~|reg83);
      reg100 <= reg82[(3'h5):(2'h3)];
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed($unsigned(reg81))))
        begin
          reg101 <= ($unsigned((8'ha4)) >>> {reg96[(4'hb):(3'h5)],
              (~^$signed($unsigned(reg93)))});
        end
      else
        begin
          reg101 <= (((-(&(~^wire74))) != {$signed((+wire70))}) ?
              $signed($unsigned($signed($signed((8'ha1))))) : reg86[(4'h8):(2'h2)]);
          if ($signed($signed(reg94)))
            begin
              reg102 <= reg87;
            end
          else
            begin
              reg102 <= $signed(((({(7'h41), reg101} ?
                  $signed((8'hbf)) : (8'hbc)) >>> $unsigned(reg84)) * reg96));
              reg103 <= reg84;
              reg104 <= (+(&reg94[(2'h2):(1'h1)]));
            end
          reg105 <= $unsigned($signed(($signed((wire79 ?
              reg102 : reg104)) >= $signed((wire74 ? (8'ha7) : (8'hb8))))));
        end
    end
  assign wire106 = (+(+(^{(8'ha5), (wire80 ? reg84 : reg100)})));
  assign wire107 = (~|(reg83 ?
                       $signed($signed((wire77 ?
                           (8'hb1) : (8'hab)))) : reg102));
endmodule

module module38
#(parameter param63 = ((({((8'had) >> (8'hb2))} >> {((8'ha3) ? (8'h9d) : (8'hbc))}) ? (^((!(8'hae)) == (8'hb0))) : (^~(((8'hb0) ^~ (8'h9d)) ? {(8'hbf), (7'h42)} : ((8'hb5) << (8'hbe))))) ? (8'hbf) : (~(8'hbf))), 
parameter param64 = (8'hae))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire42;
  input wire signed [(5'h13):(1'h0)] wire41;
  input wire signed [(4'he):(1'h0)] wire40;
  input wire signed [(5'h14):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire44,
                 wire43,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire43 = (wire41[(3'h4):(1'h1)] ?
                      ({wire42[(4'ha):(2'h3)],
                          $unsigned($signed((7'h44)))} - ((wire42[(1'h1):(1'h1)] >>> (wire40 ?
                              (7'h40) : wire40)) ?
                          (8'hb3) : {{wire39,
                                  wire40}})) : $signed(wire39[(5'h11):(3'h4)]));
  assign wire44 = $unsigned(wire39);
  always
    @(posedge clk) begin
      reg45 <= ($signed((^($signed((8'h9c)) ?
          $unsigned(wire42) : $unsigned(wire40)))) * ((~&wire40[(3'h4):(1'h0)]) - (&wire40[(4'h9):(4'h9)])));
      reg46 <= ($signed(($signed($unsigned(reg45)) ?
              ($signed((8'hb1)) - (wire43 ? wire41 : reg45)) : wire42)) ?
          wire43[(4'hb):(1'h0)] : {$unsigned((8'ha7))});
      reg47 <= wire40[(4'ha):(4'h8)];
      reg48 <= $unsigned((reg47 ?
          (wire42[(1'h1):(1'h1)] ?
              $signed(wire40[(4'hb):(1'h1)]) : wire44[(1'h1):(1'h0)]) : $unsigned((~$unsigned(reg45)))));
    end
  assign wire49 = $unsigned((($unsigned(wire40) ^ {{wire44,
                          wire43}}) && {(^$signed(wire39)), (8'hbd)}));
  assign wire50 = reg45;
  assign wire51 = ($unsigned(((8'ha8) + $unsigned({wire49,
                      (8'hb9)}))) < wire49[(1'h0):(1'h0)]);
  assign wire52 = {($unsigned((wire40[(4'hb):(3'h7)] ?
                              (wire40 ? wire42 : reg45) : (reg48 < (8'hbf)))) ?
                          wire41 : $signed(($signed(reg45) ?
                              (+reg46) : $signed(wire44))))};
  assign wire53 = (~|$signed(((~&$unsigned((7'h42))) ?
                      wire42[(4'ha):(2'h3)] : (&$signed(wire39)))));
  assign wire54 = ((-(((^~wire39) ?
                      $unsigned(reg47) : wire39[(4'hf):(4'h8)]) - ((~&(8'h9f)) * $signed(wire42)))) != ((wire39[(5'h10):(2'h2)] ?
                      $signed($unsigned(wire41)) : {((8'haf) ?
                              wire40 : wire52)}) != reg47[(1'h1):(1'h1)]));
  assign wire55 = (wire44[(1'h0):(1'h0)] ? reg45[(2'h2):(1'h0)] : wire44);
  assign wire56 = $signed(((-$unsigned((reg48 ? wire41 : (8'hb4)))) ?
                      {($signed(wire50) * wire50),
                          $unsigned(wire55)} : (^~wire39[(5'h10):(4'hf)])));
  assign wire57 = wire50[(4'ha):(1'h0)];
  assign wire58 = wire44[(1'h0):(1'h0)];
  assign wire59 = (&(($unsigned((7'h40)) ?
                      (!(wire49 || wire51)) : ($signed(reg46) ?
                          (~^wire51) : {wire52, reg47})) < (wire44 > (8'ha5))));
  assign wire60 = ({(+{(wire53 < wire41)})} ?
                      (~({wire44,
                          {wire55,
                              (7'h41)}} && {reg46[(4'hb):(2'h3)]})) : $unsigned($signed({(wire55 ?
                              wire55 : wire50),
                          (wire43 ? wire52 : wire52)})));
  assign wire61 = (((~wire56) * {$signed(reg46)}) >> wire41);
  assign wire62 = wire60;
endmodule
