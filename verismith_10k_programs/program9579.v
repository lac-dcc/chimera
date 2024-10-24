module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h265):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire173;
  wire [(4'hf):(1'h0)] wire172;
  wire [(4'hb):(1'h0)] wire159;
  wire signed [(2'h3):(1'h0)] wire158;
  wire [(5'h15):(1'h0)] wire157;
  wire [(4'hf):(1'h0)] wire140;
  wire signed [(3'h6):(1'h0)] wire139;
  wire [(4'he):(1'h0)] wire138;
  wire [(3'h7):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire135;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg184 = (1'h0);
  reg [(3'h4):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg181 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg179 = (1'h0);
  reg [(3'h7):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg176 = (1'h0);
  reg [(3'h5):(1'h0)] reg175 = (1'h0);
  reg signed [(4'he):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  reg [(2'h3):(1'h0)] reg167 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg [(5'h12):(1'h0)] reg164 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg161 = (1'h0);
  reg [(4'hd):(1'h0)] reg160 = (1'h0);
  reg [(4'hf):(1'h0)] reg156 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg [(4'h8):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg144 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire159,
                 wire158,
                 wire157,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire135,
                 wire6,
                 wire5,
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
                 reg174,
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
                 reg142,
                 reg141,
                 (1'h0)};
  assign wire5 = wire3[(4'hd):(2'h3)];
  assign wire6 = ((wire3[(3'h6):(2'h2)] ?
                         {(wire4[(3'h7):(3'h7)] ?
                                 (wire4 << (8'hb3)) : $signed(wire1))} : $signed((+{wire1,
                             (8'hbe)}))) ?
                     wire2 : wire4[(4'he):(4'h8)]);
  module7 #() modinst136 (wire135, clk, wire3, wire0, wire1, wire2);
  assign wire137 = wire5[(2'h2):(1'h0)];
  assign wire138 = $unsigned(wire137[(3'h5):(2'h3)]);
  assign wire139 = (~wire2);
  assign wire140 = $unsigned(($unsigned((~&(wire0 ?
                       wire0 : (7'h44)))) < $unsigned((~(^~wire6)))));
  always
    @(posedge clk) begin
      reg141 <= (^wire3[(4'ha):(3'h6)]);
      reg142 <= (^((($signed(reg141) <<< $signed(wire2)) ?
          ((wire2 ? (8'hb4) : wire139) < wire3) : {(wire137 ?
                  (8'hb5) : wire6)}) + ((~$unsigned(wire2)) ?
          wire6 : reg141[(5'h10):(3'h5)])));
      reg143 <= (wire6 <= wire5[(2'h2):(1'h0)]);
      if (wire0)
        begin
          reg144 <= $signed($unsigned(((wire139[(2'h3):(1'h1)] != reg142) ?
              {reg142, (^(8'h9f))} : {wire6[(1'h0):(1'h0)],
                  reg143[(1'h0):(1'h0)]})));
          reg145 <= {{wire5, $unsigned($signed(wire6))},
              wire137[(2'h3):(2'h3)]};
          reg146 <= $signed((reg144[(5'h10):(4'hf)] ?
              wire6[(3'h4):(3'h4)] : (8'hb3)));
        end
      else
        begin
          reg144 <= $unsigned((8'hbf));
          reg145 <= wire5[(1'h1):(1'h0)];
          reg146 <= $signed((~^(wire137[(3'h5):(2'h2)] * wire5)));
          reg147 <= (wire6 >= wire135[(3'h7):(3'h4)]);
        end
      if ($unsigned($unsigned((wire138 ?
          $signed(((8'ha8) * reg144)) : wire2[(1'h0):(1'h0)]))))
        begin
          reg148 <= wire137[(1'h1):(1'h0)];
        end
      else
        begin
          if (wire135)
            begin
              reg148 <= ((^~$signed(wire137[(3'h7):(1'h1)])) ?
                  wire0[(3'h7):(2'h3)] : ($unsigned($unsigned($unsigned(wire135))) >> wire2[(1'h1):(1'h1)]));
              reg149 <= (!(8'hb2));
              reg150 <= {{({wire140} >> {((8'hac) > (8'hac)), (-wire2)})},
                  {wire1, $signed($signed(reg147[(3'h7):(2'h2)]))}};
              reg151 <= $signed($signed(({{(8'hb8)},
                  wire135[(3'h5):(3'h4)]} >= (|(~&wire6)))));
            end
          else
            begin
              reg148 <= ((~wire138[(2'h3):(1'h0)]) < $signed(((^~$signed(reg141)) ?
                  $signed((wire139 ? wire4 : reg147)) : $unsigned((7'h44)))));
              reg149 <= (~|wire1[(4'hb):(4'h8)]);
              reg150 <= $unsigned(reg141[(3'h4):(2'h2)]);
            end
          if (wire137)
            begin
              reg152 <= wire0[(3'h4):(2'h2)];
              reg153 <= wire140[(4'h8):(1'h1)];
            end
          else
            begin
              reg152 <= ((~|$signed($unsigned($unsigned(wire4)))) ?
                  (+reg145[(2'h2):(1'h1)]) : reg144);
              reg153 <= wire135;
              reg154 <= (!$signed(($unsigned(((8'hb7) || (8'hbb))) || $unsigned((~|wire1)))));
              reg155 <= $signed(wire4);
              reg156 <= (~$unsigned(reg143[(4'h8):(3'h7)]));
            end
        end
    end
  assign wire157 = ((^reg142) ? reg141 : reg150);
  assign wire158 = $unsigned(reg155[(2'h3):(1'h0)]);
  assign wire159 = (8'haa);
  always
    @(posedge clk) begin
      reg160 <= $unsigned(wire159);
      if ((~|reg156[(3'h5):(3'h5)]))
        begin
          if (((-(($unsigned(wire137) ? $unsigned(reg146) : {wire3}) ?
                  (reg142 - (reg144 * (8'hbf))) : $unsigned($signed(reg144)))) ?
              ($unsigned((-(reg155 - reg149))) || wire3) : (~^reg142[(3'h5):(3'h4)])))
            begin
              reg161 <= $unsigned(wire140);
            end
          else
            begin
              reg161 <= ($unsigned(($unsigned($unsigned((8'ha9))) << reg146)) || $signed(reg150));
            end
          reg162 <= (reg151[(4'h8):(3'h5)] ^ ($signed(reg150[(1'h0):(1'h0)]) ?
              $signed($unsigned({wire5,
                  wire138})) : (((8'hb6) != (8'h9f)) << ((reg161 > reg153) - $signed(wire3)))));
          reg163 <= ((8'hac) <<< reg142[(4'h9):(4'h9)]);
        end
      else
        begin
          reg161 <= wire0;
          reg162 <= wire158;
          reg163 <= $signed($signed(wire135));
          reg164 <= ((|wire158[(1'h1):(1'h1)]) ?
              $unsigned($signed((|reg150[(4'hd):(2'h3)]))) : reg153);
          reg165 <= reg162;
        end
      if ($signed(($signed(reg141) - (+(wire137 ?
          (reg141 && reg151) : reg147)))))
        begin
          reg166 <= (~|{(~(|reg164[(4'hc):(2'h2)]))});
          reg167 <= (&(((~$signed(reg148)) ?
                  wire3[(4'hc):(1'h1)] : (wire3[(5'h12):(5'h10)] ?
                      $signed(wire1) : (8'ha4))) ?
              $signed(((reg146 ^~ reg148) ?
                  {wire139} : reg162)) : ({(reg144 >>> wire140)} >>> ((reg160 | wire0) ?
                  (wire137 ? reg162 : reg151) : $unsigned((8'h9f))))));
        end
      else
        begin
          reg166 <= (((~&reg145) >= {((wire4 ? wire0 : reg164) ?
                      $unsigned(reg162) : reg167[(1'h1):(1'h1)]),
                  reg160}) ?
              reg165 : reg153[(4'ha):(2'h2)]);
          reg167 <= (({(~&reg161)} && $unsigned({reg151[(2'h3):(1'h0)],
              ((7'h44) * wire6)})) ~^ ($signed($signed($unsigned((8'hb3)))) & (-reg144)));
          reg168 <= reg149;
          reg169 <= wire158[(1'h0):(1'h0)];
        end
      reg170 <= $signed(wire157);
      reg171 <= reg168;
    end
  assign wire172 = (!wire1);
  assign wire173 = ((reg145[(4'hf):(4'h8)] | $signed(wire0[(4'h8):(2'h2)])) * $unsigned((7'h42)));
  always
    @(posedge clk) begin
      reg174 <= (+($signed((-(wire139 ? wire157 : reg151))) ?
          ($unsigned($unsigned((8'ha8))) == $signed((|wire158))) : $unsigned($signed((reg141 & reg160)))));
      if (($unsigned(reg162) ?
          wire158[(1'h0):(1'h0)] : $unsigned({($signed(wire158) ^ $signed(wire4)),
              (|{(8'ha5)})})))
        begin
          reg175 <= {(~reg162[(4'hc):(1'h1)]),
              (reg167[(1'h0):(1'h0)] ?
                  $signed($unsigned($signed(reg168))) : (~|reg164))};
          reg176 <= reg141[(3'h4):(2'h2)];
          if (wire139)
            begin
              reg177 <= reg156[(4'he):(4'h8)];
              reg178 <= (8'hab);
              reg179 <= ($signed(wire137) << $signed(wire5[(3'h6):(3'h4)]));
              reg180 <= wire158;
            end
          else
            begin
              reg177 <= wire2;
              reg178 <= reg178;
            end
          if ($signed((-(-{reg174[(2'h2):(1'h0)], reg144}))))
            begin
              reg181 <= ((~((reg153[(5'h12):(5'h10)] ?
                          $signed(wire4) : $signed((8'hb1))) ?
                      ($signed(reg150) >>> reg142) : wire3)) ?
                  (+$signed(wire6[(3'h6):(3'h6)])) : reg167);
              reg182 <= (reg178[(3'h7):(3'h5)] ?
                  (+($signed($signed(reg177)) ?
                      (^~(reg181 ?
                          wire4 : reg143)) : $unsigned(reg142[(3'h4):(2'h3)]))) : {(wire6[(1'h0):(1'h0)] & (~|(wire138 ^ (8'h9d)))),
                      reg152[(3'h7):(3'h6)]});
            end
          else
            begin
              reg181 <= ((($signed((reg167 ? reg145 : (8'hb6))) ?
                  (~&$signed(reg180)) : $unsigned(reg146)) ~^ ($unsigned($signed(reg170)) ?
                  reg163[(2'h3):(2'h3)] : (~|$unsigned(reg175)))) > $unsigned($signed(reg180)));
              reg182 <= ((~^$signed({$unsigned(reg174)})) ?
                  (&(8'haf)) : $signed(wire2));
              reg183 <= (~$signed($unsigned($unsigned(reg179[(1'h1):(1'h1)]))));
              reg184 <= (reg163 ?
                  reg168 : ($signed(({reg183, wire139} ?
                      (reg164 && reg179) : $unsigned(reg169))) && wire0[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          reg175 <= ((($signed((reg166 ? reg179 : reg177)) ?
                  $unsigned(reg163[(1'h1):(1'h0)]) : (reg166[(4'h9):(1'h1)] ?
                      reg144 : ((8'ha5) >>> reg156))) ^ wire5) ?
              {($signed((reg175 == reg166)) != reg184[(2'h3):(2'h3)])} : wire5[(3'h4):(2'h2)]);
          if (({reg149} ?
              ((reg178[(2'h3):(2'h2)] ^ wire0[(3'h4):(2'h2)]) ?
                  wire0[(1'h0):(1'h0)] : (|($signed(reg147) ^ $signed(reg146)))) : ($signed({reg183[(3'h4):(2'h2)]}) << reg164[(4'he):(3'h6)])))
            begin
              reg176 <= $signed((~($unsigned(((8'ha2) ? reg160 : wire157)) ?
                  $signed(wire6[(1'h0):(1'h0)]) : $unsigned(reg144[(3'h5):(1'h1)]))));
            end
          else
            begin
              reg176 <= reg171;
              reg177 <= (reg150[(3'h7):(2'h2)] ?
                  (({(8'hba)} == $signed((wire3 ?
                      reg161 : reg176))) >> $unsigned(reg182[(2'h2):(1'h1)])) : (^~{{$unsigned(wire0)},
                      ($signed(reg162) ? {reg156, reg154} : reg165)}));
              reg178 <= (|$unsigned($signed(({wire137} ?
                  $signed(reg171) : reg171[(3'h5):(2'h3)]))));
              reg179 <= reg184[(4'hc):(4'h8)];
              reg180 <= ($unsigned((~^$signed($unsigned(wire159)))) || reg161);
            end
          reg181 <= $unsigned(reg175);
          reg182 <= reg146;
          reg183 <= reg167[(1'h1):(1'h0)];
        end
    end
endmodule

module module7
#(parameter param134 = ((~|({(-(8'ha1)), ((8'hb1) ? (8'h9f) : (8'hb6))} ? ({(8'hbb), (8'ha8)} ? {(8'h9d)} : ((8'hbb) < (7'h40))) : ((^(8'hbb)) + {(8'hb2), (8'hb8)}))) ? (&(-(((8'ha9) || (8'hae)) ? ((8'ha5) ? (7'h40) : (8'haf)) : (~^(8'hb4))))) : (^~{{((8'hba) >= (8'hae))}})))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h2e1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire131;
  wire [(2'h2):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire91;
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  assign y = {wire133,
                 wire131,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire76,
                 wire78,
                 wire91,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
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
                 reg37,
                 reg38,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 (1'h0)};
  assign wire12 = (+($unsigned($unsigned((wire9 ? wire9 : wire11))) ?
                      $signed(wire11[(4'h8):(3'h5)]) : wire11[(4'h8):(4'h8)]));
  assign wire13 = wire11;
  assign wire14 = (((!((wire12 != wire13) >>> wire10)) ?
                          (($unsigned((8'hac)) + $signed(wire8)) ?
                              ((wire9 >>> wire12) > (wire11 ?
                                  wire9 : wire12)) : (7'h42)) : wire11) ?
                      (^$unsigned(wire10[(2'h3):(1'h0)])) : $signed($unsigned($signed((|wire10)))));
  assign wire15 = $signed(((wire14 ?
                      {$unsigned(wire14),
                          wire8[(4'h9):(3'h4)]} : $signed($unsigned(wire8))) <= (wire10[(2'h3):(1'h1)] >= $signed($signed(wire14)))));
  always
    @(posedge clk) begin
      if ($signed(wire9[(1'h1):(1'h1)]))
        begin
          reg16 <= $signed(wire11);
          reg17 <= $unsigned((~|(~({(8'h9d), wire11} ?
              wire14 : $unsigned(wire9)))));
        end
      else
        begin
          reg16 <= wire13;
          reg17 <= wire15[(1'h1):(1'h1)];
          reg18 <= {(~&((reg17[(2'h2):(1'h1)] >= (wire11 ^~ wire8)) || (wire15 ?
                  (wire10 - wire11) : ((8'hb3) - reg16))))};
        end
      reg19 <= ($unsigned(wire13) ?
          {((7'h42) * (!(+(8'haa))))} : (|($signed($signed(wire8)) ?
              $signed({wire13}) : {{wire14}, (+wire11)})));
      reg20 <= $unsigned((~^wire12[(1'h1):(1'h0)]));
      if (reg16[(4'hc):(1'h1)])
        begin
          reg21 <= (+$signed((|{{wire14}})));
        end
      else
        begin
          if ({(reg19 + wire13[(4'he):(1'h1)]), wire15[(4'h8):(4'h8)]})
            begin
              reg21 <= ((~^(wire14 > wire15[(4'hf):(3'h6)])) ?
                  wire11[(3'h5):(1'h1)] : reg18[(3'h7):(3'h5)]);
              reg22 <= ((^reg18[(3'h5):(3'h4)]) & wire12);
              reg23 <= $unsigned((((wire10 <= (wire9 >> wire9)) ?
                      wire12 : wire10) ?
                  wire11 : $unsigned(reg18[(1'h1):(1'h0)])));
            end
          else
            begin
              reg21 <= (|($signed(reg18) - (~&wire9)));
              reg22 <= reg20[(5'h13):(1'h0)];
              reg23 <= (($unsigned($signed({(8'hb6)})) * ($unsigned((wire13 > reg20)) ^ $signed(reg19[(4'h8):(1'h0)]))) - reg19[(2'h2):(2'h2)]);
            end
          if ({reg19})
            begin
              reg24 <= reg20[(4'ha):(4'h8)];
              reg25 <= $unsigned($unsigned((reg17[(3'h4):(2'h2)] ?
                  wire9 : $signed((^wire15)))));
              reg26 <= $unsigned($unsigned({((8'hb2) ? (-reg24) : (8'ha9)),
                  ({reg17, reg23} ? {wire8} : (^~reg20))}));
            end
          else
            begin
              reg24 <= {$unsigned($signed({(&reg23), reg26})),
                  ($signed($unsigned($signed(reg26))) <<< $signed(($unsigned(wire11) ?
                      $signed(wire11) : $unsigned(reg17))))};
            end
          reg27 <= (~^((|((8'hae) >> (-reg17))) ?
              ($signed($signed(reg17)) << $signed($unsigned(wire12))) : (($signed(reg26) ?
                      $unsigned(reg23) : (~|reg18)) ?
                  (!wire11[(4'h9):(2'h3)]) : reg24)));
          if (((^($unsigned(wire15) - $unsigned({wire14}))) ?
              $signed($unsigned($signed((^~reg17)))) : (reg22 ?
                  (($unsigned(reg27) ? $signed(wire10) : (reg21 & reg27)) ?
                      reg18 : {(reg21 ?
                              reg27 : reg23)}) : $unsigned(($signed(reg21) * (^~reg17))))))
            begin
              reg28 <= ((^~$unsigned((reg24[(4'h8):(2'h3)] << wire15[(4'hf):(4'hd)]))) <<< ({((~|reg23) ?
                      {(8'hab)} : (reg20 > reg26))} + $signed(wire8)));
              reg29 <= reg22;
              reg30 <= {$signed((~&(-(reg19 - reg24))))};
              reg31 <= $unsigned(reg24);
              reg32 <= (&reg27);
            end
          else
            begin
              reg28 <= {(!reg16),
                  {$signed(({(8'haf), reg26} <= {reg22})),
                      ((8'ha7) ? reg22[(4'hd):(4'h8)] : wire11)}};
              reg29 <= $unsigned($unsigned(wire13));
              reg30 <= $signed($signed((((-reg31) <= (+reg23)) ?
                  (^~((8'hba) ? reg23 : reg28)) : $signed((wire14 ?
                      wire10 : reg28)))));
            end
        end
      if ($unsigned(wire11[(4'ha):(3'h4)]))
        begin
          reg33 <= (&(&(~&((+reg29) ? reg25 : $signed((8'ha9))))));
        end
      else
        begin
          reg33 <= ($signed($signed({(reg25 ? reg28 : reg27),
              (wire12 ~^ reg25)})) == $signed($unsigned(($signed(reg20) + reg33[(3'h6):(2'h3)]))));
          reg34 <= {reg20[(4'hf):(4'hf)],
              $unsigned(((&$unsigned(wire10)) > $unsigned((reg27 ?
                  wire14 : wire9))))};
          if (($unsigned((~|reg24[(4'h8):(3'h7)])) & ($unsigned($unsigned($signed(reg22))) ?
              $unsigned((wire12 || reg23)) : wire15[(4'he):(4'hb)])))
            begin
              reg35 <= reg16[(3'h4):(3'h4)];
            end
          else
            begin
              reg35 <= (~&reg30);
              reg36 <= $signed((+(((reg19 < (7'h44)) ?
                      {wire10, reg17} : (&reg35)) ?
                  (wire10[(1'h1):(1'h0)] ?
                      (8'hab) : $unsigned(reg32)) : wire11)));
              reg37 <= wire12;
              reg38 <= ($signed({($unsigned(wire11) != reg18[(2'h2):(1'h1)])}) <= ({((~reg23) ?
                      $signed(wire13) : ((8'h9c) | wire9)),
                  ((reg18 * (8'hbf)) > (reg29 <= wire14))} <<< wire15));
            end
        end
    end
  assign wire39 = ((^($unsigned(reg19) ?
                      ({reg24, wire13} ?
                          (&reg38) : $unsigned(wire14)) : reg17)) & $unsigned((&($signed(reg36) ?
                      (reg28 != reg23) : (+(8'hbc))))));
  assign wire40 = $signed($signed($unsigned(($signed((7'h40)) ?
                      {(8'hb6)} : $signed(wire11)))));
  assign wire41 = $unsigned($unsigned(reg27));
  assign wire42 = $signed(((+reg38[(1'h1):(1'h0)]) < ($signed((wire10 ^~ wire9)) ?
                      ((^~(8'hae)) ? $unsigned(reg17) : (8'ha5)) : reg16)));
  assign wire43 = reg19[(4'ha):(1'h1)];
  assign wire44 = reg26;
  module45 #() modinst77 (wire76, clk, reg23, wire12, wire11, reg18);
  assign wire78 = ((reg17[(4'h8):(2'h3)] ?
                      $unsigned((!wire14[(4'hc):(4'hc)])) : reg23) ~^ {reg37[(3'h6):(1'h1)]});
  module79 #() modinst92 (.clk(clk), .wire82(reg17), .wire80(reg37), .wire83(wire39), .wire84(wire78), .y(wire91), .wire81(wire76));
  assign wire93 = reg24[(2'h3):(1'h0)];
  assign wire94 = ($unsigned(($unsigned(wire93) ?
                          $signed((wire78 ?
                              wire9 : wire14)) : (^~$unsigned(reg28)))) ?
                      ($unsigned($signed($signed((8'haf)))) ?
                          $signed($unsigned(reg37[(2'h2):(2'h2)])) : (reg21[(4'hc):(4'ha)] == $unsigned((&wire76)))) : $signed((wire44 - $unsigned($signed(reg20)))));
  assign wire95 = ((reg18[(3'h4):(3'h4)] > {reg34,
                          ($signed(reg17) ?
                              reg38[(2'h3):(1'h1)] : {reg34, reg37})}) ?
                      wire91 : ({wire44[(1'h0):(1'h0)]} ?
                          $signed((reg22 && {reg36})) : {(-(+reg20))}));
  assign wire96 = (($unsigned((wire78 ?
                          wire9[(1'h1):(1'h1)] : $unsigned(wire12))) - wire93[(2'h3):(1'h0)]) ?
                      (~&reg22[(4'h8):(1'h1)]) : ((8'ha6) ?
                          $unsigned(({reg20} ?
                              (wire12 ?
                                  wire44 : reg36) : reg24[(3'h5):(1'h1)])) : wire78[(2'h2):(1'h0)]));
  assign wire97 = (~$signed((~&{$signed(wire15), $unsigned(reg19)})));
  assign wire98 = wire94;
  always
    @(posedge clk) begin
      if ($signed(reg16))
        begin
          if ((~&$unsigned($signed($unsigned((wire41 ? reg26 : wire13))))))
            begin
              reg99 <= wire11;
              reg100 <= $signed($unsigned($unsigned(($unsigned(reg24) ?
                  $unsigned(wire95) : reg33[(1'h0):(1'h0)]))));
              reg101 <= $signed($signed(wire8));
              reg102 <= $signed(reg26[(3'h6):(1'h1)]);
            end
          else
            begin
              reg99 <= $unsigned((wire94[(3'h4):(3'h4)] >>> $unsigned(reg22[(4'hd):(2'h2)])));
              reg100 <= (~|reg37[(3'h5):(3'h5)]);
            end
          reg103 <= wire96;
          reg104 <= $signed((reg19 ?
              (+$unsigned((&reg22))) : $signed(wire98[(1'h0):(1'h0)])));
        end
      else
        begin
          if ($signed((&(^({reg22, reg99} ?
              (wire39 ? reg25 : wire42) : (reg27 == reg104))))))
            begin
              reg99 <= $signed(wire44[(4'hc):(1'h0)]);
            end
          else
            begin
              reg99 <= (wire39[(1'h0):(1'h0)] ?
                  {$signed(reg38),
                      wire41[(2'h2):(2'h2)]} : wire9[(1'h1):(1'h1)]);
              reg100 <= $signed($unsigned((|$signed((!wire44)))));
              reg101 <= {(~^($unsigned((8'hbe)) | $unsigned((~reg27))))};
              reg102 <= ($signed((^$unsigned(reg27))) != reg21[(4'h8):(2'h3)]);
              reg103 <= reg20[(5'h14):(1'h0)];
            end
        end
      if (wire8)
        begin
          if (reg32)
            begin
              reg105 <= (((($signed(wire11) >= $signed(wire12)) & reg37) ~^ ($unsigned($signed((8'ha7))) ?
                      ({(8'ha7), (7'h40)} ?
                          (~|reg24) : $signed(wire43)) : $unsigned(wire42))) ?
                  (-$signed(((~|reg104) - ((8'hb3) ?
                      (8'hbc) : reg35)))) : ((8'hb0) - $signed(((reg100 >= wire13) >>> (reg99 ?
                      wire39 : wire96)))));
              reg106 <= $signed((^wire91));
            end
          else
            begin
              reg105 <= (((7'h44) ?
                      (~|(&$unsigned(wire14))) : (~&$unsigned(wire14[(1'h0):(1'h0)]))) ?
                  $signed((((8'hbd) + wire9[(1'h0):(1'h0)]) > wire11[(3'h5):(1'h1)])) : reg35[(1'h0):(1'h0)]);
              reg106 <= $unsigned(wire40);
              reg107 <= (|reg34);
            end
        end
      else
        begin
          if ($signed($signed(reg101[(3'h5):(1'h0)])))
            begin
              reg105 <= wire11[(3'h6):(3'h5)];
              reg106 <= reg30[(5'h10):(3'h7)];
              reg107 <= {$unsigned(wire42[(4'hc):(4'hc)])};
              reg108 <= (reg22[(5'h15):(5'h10)] ?
                  ({$unsigned(wire41[(2'h3):(2'h3)]),
                      ($unsigned(reg102) ?
                          $signed(reg20) : (reg104 || reg33))} && $signed(((+wire9) != reg19[(1'h1):(1'h1)]))) : $unsigned(wire96));
            end
          else
            begin
              reg105 <= (&(reg19[(2'h3):(1'h0)] & reg18[(3'h5):(1'h0)]));
              reg106 <= $signed($unsigned(($unsigned($unsigned(wire91)) <= wire13[(1'h0):(1'h0)])));
              reg107 <= wire14;
              reg108 <= reg32;
            end
          reg109 <= wire95[(2'h3):(2'h3)];
          reg110 <= (~(-{wire13}));
          reg111 <= ($signed(wire98) + {(wire13[(3'h5):(1'h1)] == reg104),
              $signed($signed({reg23, reg32}))});
        end
    end
  module112 #() modinst132 (.wire114(reg23), .wire116(reg31), .clk(clk), .wire115(wire44), .y(wire131), .wire117(wire43), .wire113(reg22));
  assign wire133 = $signed(({((wire13 > reg102) <<< (!reg16))} ?
                       (reg100 ?
                           (((8'h9f) ?
                               reg103 : reg104) + (reg29 >>> reg105)) : (wire41[(3'h4):(2'h2)] ?
                               (wire93 ? reg36 : wire76) : (wire98 ?
                                   reg38 : reg106))) : reg109[(4'hb):(3'h6)]));
endmodule

module module112
#(parameter param130 = ((((((8'h9d) < (8'hbc)) ? {(8'ha6)} : (~(8'hae))) ? ((8'ha5) && ((8'ha3) ? (8'haa) : (8'h9c))) : (&{(8'h9d), (8'hb1)})) | ((((8'ha9) ? (8'ha7) : (8'hbf)) ? ((8'ha1) && (8'ha5)) : (~|(8'haa))) < {((8'ha0) ? (8'hbd) : (7'h41))})) + {(((8'ha8) >>> ((7'h41) ~^ (8'haa))) >>> {((8'haa) ? (8'hb3) : (8'h9d)), ((8'hb4) & (8'hb5))}), (({(8'ha2), (8'hb3)} ? {(8'hab), (8'ha1)} : {(8'ha9), (8'ha9)}) ? (8'ha8) : (8'ha9))}))
(y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire117;
  input wire signed [(5'h13):(1'h0)] wire116;
  input wire [(3'h4):(1'h0)] wire115;
  input wire signed [(5'h10):(1'h0)] wire114;
  input wire signed [(3'h4):(1'h0)] wire113;
  wire signed [(5'h14):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire127;
  wire [(3'h5):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire123;
  wire [(5'h15):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire signed [(2'h3):(1'h0)] wire118;
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 (1'h0)};
  assign wire118 = (&$signed(((-{wire115}) ?
                       ((+wire115) >>> $unsigned(wire114)) : wire116)));
  assign wire119 = (($signed(($unsigned(wire117) + $unsigned(wire116))) ?
                           $unsigned(wire116) : $unsigned(wire117)) ?
                       wire118[(1'h1):(1'h1)] : (~$unsigned(($signed(wire118) ?
                           $unsigned(wire116) : (wire118 != (7'h43))))));
  assign wire120 = (wire114 ?
                       ($signed((~$unsigned(wire113))) ?
                           (-(|$signed((8'hb0)))) : (~|(+$unsigned(wire113)))) : $signed((wire117 || wire116)));
  assign wire121 = ($signed($signed(wire114[(4'hc):(1'h1)])) >> ((($unsigned((8'hbe)) ?
                           (wire116 ?
                               wire116 : wire117) : wire118) ~^ $signed($signed(wire116))) ?
                       (7'h40) : ((((7'h44) ^~ wire119) < {(8'hbd)}) > wire120)));
  assign wire122 = (wire118 ?
                       (^~(+({wire117,
                           (8'ha6)} & (wire121 <<< wire116)))) : ((8'ha5) << ((!(!wire113)) ?
                           (wire117 ^ (wire118 == (8'ha4))) : (wire117[(2'h2):(2'h2)] ?
                               $unsigned(wire121) : (wire121 ?
                                   wire115 : wire118)))));
  assign wire123 = $signed(((!(((8'ha6) ? wire120 : wire119) != (wire114 ?
                           wire116 : wire118))) ?
                       $unsigned(wire119[(1'h0):(1'h0)]) : ((&(^~wire117)) - {$unsigned(wire117),
                           wire122})));
  assign wire124 = (!(!(wire120[(4'hd):(4'hb)] << $unsigned(((8'hb8) == wire114)))));
  assign wire125 = $signed(($signed(({(8'hb0),
                       wire118} <= (wire113 ^ wire122))) || wire115[(1'h1):(1'h0)]));
  assign wire126 = (wire117[(2'h2):(1'h1)] ? (!(7'h43)) : (&wire120));
  assign wire127 = $unsigned(wire120);
  assign wire128 = $signed(wire121[(2'h2):(1'h0)]);
  assign wire129 = $signed((($signed((wire125 ?
                           wire121 : wire117)) == ((~|wire119) | $unsigned(wire128))) ?
                       (8'hab) : (($signed(wire119) ~^ (wire114 << wire115)) - $signed($unsigned((8'hb3))))));
endmodule

module module79
#(parameter param89 = ((((((8'ha9) ? (8'hb6) : (8'haa)) < {(8'haa), (8'hba)}) >= (8'ha2)) ? (~&(!((7'h42) ? (8'hb2) : (8'hb8)))) : ((8'hb3) && {((8'hb6) ? (8'ha4) : (8'hbf)), ((8'hb0) <= (8'ha8))})) <= (((~|((7'h44) ? (8'haa) : (8'ha9))) ? (+((8'ha1) == (8'hbf))) : {{(8'ha4)}, ((8'hb5) ? (8'hab) : (7'h43))}) ? ((8'hbf) << (((8'hba) ? (8'ha0) : (8'ha0)) ? {(7'h41), (8'hbe)} : {(8'ha5)})) : {((+(8'ha6)) ? (~|(8'ha5)) : (-(7'h43)))})), 
parameter param90 = param89)
(y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire84;
  input wire signed [(5'h12):(1'h0)] wire83;
  input wire [(3'h5):(1'h0)] wire82;
  input wire [(5'h12):(1'h0)] wire81;
  input wire signed [(3'h6):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire85;
  assign y = {wire88, wire87, wire86, wire85, (1'h0)};
  assign wire85 = ($signed(wire82) > ($signed(wire84[(2'h2):(1'h1)]) ^ $unsigned((~^(8'hb4)))));
  assign wire86 = {(-(((wire81 ? wire80 : wire84) ?
                          wire85 : (wire81 ^ wire84)) <= (8'ha8)))};
  assign wire87 = $unsigned(wire82);
  assign wire88 = (wire80[(1'h1):(1'h1)] | wire83);
endmodule

module module45
#(parameter param74 = (((({(8'hac), (8'ha3)} ? ((8'hb3) < (8'h9f)) : (~(8'hb7))) == (((8'had) <<< (8'hbb)) ? ((8'h9f) ? (7'h40) : (8'h9d)) : (+(8'hac)))) ~^ ((~^(^~(8'haa))) != (((8'h9c) != (8'ha8)) <<< ((8'ha8) >>> (8'hb6))))) < ((-((~^(7'h41)) ? ((7'h42) + (8'had)) : {(8'ha7)})) ? (^~{(8'ha8)}) : ((((8'hbb) ? (8'hbe) : (8'hbe)) && ((7'h41) || (8'hbb))) * (~^{(8'haf), (8'ha8)})))), 
parameter param75 = (((param74 >= param74) ? (^~{{param74}}) : (&param74)) ? ((({(8'hbb)} ? param74 : (&param74)) ? (((8'hb7) ? param74 : param74) ? {param74, param74} : (param74 ? (8'ha1) : param74)) : (8'ha1)) > param74) : param74))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire49;
  input wire [(5'h10):(1'h0)] wire48;
  input wire [(3'h6):(1'h0)] wire47;
  input wire signed [(4'hb):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire50;
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire65,
                 wire64,
                 wire50,
                 reg67,
                 reg66,
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
                 (1'h0)};
  assign wire50 = (wire47[(1'h0):(1'h0)] ?
                      (wire47[(3'h5):(2'h2)] || (~|wire49[(3'h5):(2'h3)])) : $unsigned((~|wire48)));
  always
    @(posedge clk) begin
      reg51 <= $signed({$signed(wire47)});
      reg52 <= (-(!{((reg51 ? reg51 : wire49) >> $signed((8'ha1))),
          wire49[(4'h8):(2'h2)]}));
      reg53 <= (reg52 != (|reg51[(3'h4):(1'h0)]));
    end
  always
    @(posedge clk) begin
      if (wire48[(3'h4):(2'h3)])
        begin
          reg54 <= $unsigned(($signed({(wire46 & reg53), (^wire48)}) ?
              wire47[(3'h5):(1'h0)] : $signed($unsigned({reg52}))));
        end
      else
        begin
          if (wire49)
            begin
              reg54 <= ((|(((wire50 ? wire50 : reg51) ?
                      (&wire50) : (~^reg51)) < (|$unsigned(wire50)))) ?
                  (reg51 ?
                      {wire48[(4'hb):(4'hb)]} : wire47) : (&$unsigned((~{(8'h9d),
                      (8'haa)}))));
              reg55 <= ((|(~|((reg52 <= wire49) ?
                      $signed(wire47) : (-reg53)))) ?
                  (+reg52[(3'h6):(1'h1)]) : $signed(wire50[(4'h8):(1'h0)]));
              reg56 <= wire48;
              reg57 <= (reg52[(1'h0):(1'h0)] << ($unsigned(((8'hb9) ?
                  $unsigned(wire47) : $unsigned(wire48))) <<< (!($unsigned(wire46) ?
                  ((8'ha3) >= (8'haa)) : wire50[(4'ha):(4'h8)]))));
            end
          else
            begin
              reg54 <= (~&({$unsigned({(8'h9f)}),
                  (~|(!wire49))} || ($unsigned((~&wire50)) ?
                  ($signed(wire50) ?
                      reg52[(4'ha):(1'h0)] : $unsigned(wire47)) : (^~$signed(wire47)))));
              reg55 <= wire50[(1'h0):(1'h0)];
              reg56 <= {reg55};
              reg57 <= ((!reg52) <<< $signed((~({wire50, reg52} ?
                  (reg55 & reg51) : (!reg53)))));
            end
          reg58 <= ($unsigned(reg54) & $signed(reg57[(3'h4):(1'h1)]));
          reg59 <= (((!(~^reg56)) >>> $signed(((reg54 >>> wire47) ?
                  (wire49 >> reg57) : reg54))) ?
              $signed(wire50[(3'h6):(3'h6)]) : (~&$signed((reg55[(2'h2):(1'h0)] ?
                  (reg57 ? reg57 : wire50) : wire49[(3'h4):(2'h2)]))));
        end
      if ($signed($signed(($signed((reg59 ^~ wire50)) ?
          ((~reg58) ~^ (wire50 <<< reg55)) : ((|wire49) && reg55[(2'h2):(2'h2)])))))
        begin
          reg60 <= (reg56[(3'h4):(3'h4)] ?
              (($signed(wire50[(1'h0):(1'h0)]) >> $unsigned((~^reg56))) ?
                  $unsigned(wire48) : ($unsigned((reg59 ^ reg57)) < $signed(reg59))) : reg55);
          reg61 <= $unsigned($signed($signed(reg55)));
          reg62 <= ({reg53,
              (!{$signed(wire49)})} << ($signed(wire48[(2'h2):(1'h0)]) ?
              wire50 : ($unsigned((reg54 ? reg55 : reg57)) ?
                  $unsigned((!reg61)) : (reg57[(1'h0):(1'h0)] ^~ $signed(wire46)))));
          reg63 <= {$signed((-($signed(reg58) | {(8'h9c)})))};
        end
      else
        begin
          reg60 <= reg53;
          reg61 <= ({(|(!$unsigned(reg60)))} && $signed(((~(8'h9c)) <= (!{wire50,
              wire46}))));
        end
    end
  assign wire64 = reg51[(1'h0):(1'h0)];
  assign wire65 = (~&((reg59 >= {{reg54, reg53}}) && (wire48[(4'he):(3'h4)] ?
                      reg61[(4'ha):(2'h3)] : (wire49 ?
                          $signed(reg52) : wire64[(4'ha):(2'h2)]))));
  always
    @(posedge clk) begin
      reg66 <= ($signed($unsigned((~&$unsigned(wire65)))) ?
          wire46 : ($signed(reg52) >> ((reg60[(2'h2):(2'h2)] ^~ ((8'ha5) != reg57)) ?
              wire64 : (reg62[(4'ha):(4'h9)] ? (reg60 < wire48) : wire65))));
      reg67 <= (^~(!(8'hb8)));
    end
  assign wire68 = reg62[(4'he):(3'h7)];
  assign wire69 = {(+$signed($signed((wire50 <= (8'ha4)))))};
  assign wire70 = reg58[(3'h7):(2'h3)];
  assign wire71 = reg62[(5'h14):(3'h6)];
  assign wire72 = (&{({(wire47 ? reg51 : reg55),
                          $signed(reg61)} != ($signed(reg66) || reg57[(2'h3):(1'h1)]))});
  assign wire73 = {$unsigned(({(reg59 ? wire64 : wire72)} ?
                          ((reg63 ? wire69 : wire47) ?
                              $signed(reg63) : {reg58}) : $unsigned((^~reg54))))};
endmodule
