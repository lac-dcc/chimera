module top
#(parameter param188 = ((7'h41) < ({(^(!(8'hbf)))} ? ((((8'ha6) <= (7'h44)) ? (~&(8'h9f)) : (|(8'ha0))) >= {((7'h44) >> (8'hb3)), {(8'hab), (8'hae)}}) : {((~^(8'ha1)) ? {(8'hb8), (8'hab)} : ((8'ha7) ? (8'hb5) : (7'h44))), {((7'h43) || (8'hb6))}})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire187;
  wire [(5'h12):(1'h0)] wire185;
  wire signed [(4'hb):(1'h0)] wire181;
  wire [(5'h15):(1'h0)] wire180;
  wire signed [(5'h15):(1'h0)] wire179;
  wire signed [(5'h11):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire177;
  wire [(3'h5):(1'h0)] wire176;
  wire signed [(5'h12):(1'h0)] wire174;
  wire [(5'h10):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire122;
  wire [(3'h7):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire15;
  reg signed [(4'h9):(1'h0)] reg184 = (1'h0);
  reg [(2'h2):(1'h0)] reg183 = (1'h0);
  reg [(4'h9):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  assign y = {wire187,
                 wire185,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire174,
                 wire123,
                 wire122,
                 wire120,
                 wire15,
                 reg184,
                 reg183,
                 reg182,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed($signed((($unsigned((8'hbb)) || (wire0 & wire3)) && wire1[(2'h2):(1'h1)])));
      if (wire1)
        begin
          reg6 <= (reg5 > $unsigned((wire1 ?
              {wire0, {(8'hb7), wire3}} : {(~wire2), wire3})));
          reg7 <= {(((!$unsigned((8'had))) ?
                      $unsigned(wire4) : ((wire2 ? reg5 : wire3) ?
                          (~(8'ha6)) : (~|reg6))) ?
                  $signed($signed((+wire1))) : ($unsigned($signed(wire1)) <= $unsigned(reg6[(4'h9):(3'h7)])))};
          reg8 <= (($signed($signed({wire0})) || (wire3[(4'h8):(3'h6)] ?
                  $unsigned(reg5) : $unsigned(reg7))) ?
              wire3[(4'ha):(2'h3)] : ({$unsigned((wire2 * wire1))} <<< {$unsigned((reg5 < wire2))}));
        end
      else
        begin
          reg6 <= {reg6[(3'h7):(1'h0)]};
        end
      reg9 <= $unsigned((8'hb2));
      if (reg7)
        begin
          reg10 <= $signed((^wire0[(4'ha):(3'h6)]));
          reg11 <= (((~|$unsigned({wire1})) ?
              $signed(($signed(reg10) > $signed(wire0))) : (&reg10[(4'h9):(3'h6)])) | wire1[(5'h12):(3'h5)]);
          reg12 <= (wire0 ?
              (&((((8'ha0) == wire3) ?
                  (wire2 && reg11) : (reg10 ?
                      reg10 : (8'hb5))) + (8'hb7))) : reg5);
          reg13 <= (wire1[(4'h9):(3'h4)] ? wire3[(4'hb):(3'h6)] : reg9);
          reg14 <= {$signed(wire2[(3'h7):(1'h1)]), $signed((~reg7))};
        end
      else
        begin
          if (wire1)
            begin
              reg10 <= reg7[(1'h0):(1'h0)];
              reg11 <= (((8'hac) >= $unsigned(reg11)) ?
                  {{$signed((reg5 ? reg9 : reg8))}, wire3} : (8'hb3));
              reg12 <= $unsigned((-(~&wire3[(3'h5):(1'h1)])));
              reg13 <= ((-$signed((~$signed((8'hb5))))) - $unsigned((~reg5[(4'h9):(3'h7)])));
            end
          else
            begin
              reg10 <= (~|(~|(((8'haf) ^~ (~(7'h41))) ?
                  ($signed(reg11) ?
                      ((8'hbc) == wire0) : wire1[(4'hf):(4'hd)]) : {(reg7 ?
                          reg5 : wire1),
                      $signed((8'hbb))})));
              reg11 <= (reg6 < $unsigned(reg13[(2'h3):(1'h1)]));
              reg12 <= reg12;
              reg13 <= (&$signed(((reg5 ^ wire0[(2'h2):(1'h0)]) ?
                  reg14[(3'h6):(1'h1)] : ((^~reg9) ?
                      (reg6 ? reg10 : reg7) : $signed(reg10)))));
            end
        end
    end
  assign wire15 = ($signed(($unsigned((reg6 ?
                      reg5 : reg5)) || $unsigned((wire1 << wire3)))) <= ($signed(($unsigned((8'hba)) ?
                          $signed(reg14) : wire1)) ?
                      {reg8[(1'h1):(1'h0)]} : (8'had)));
  module16 #() modinst121 (.clk(clk), .wire21(wire1), .wire18(wire2), .wire19(wire15), .wire20(reg7), .wire17(wire4), .y(wire120));
  assign wire122 = (|(&$signed(reg11[(2'h3):(1'h1)])));
  assign wire123 = (-{wire120});
  module124 #() modinst175 (.wire128(reg12), .y(wire174), .wire127(wire122), .clk(clk), .wire126(reg10), .wire125(wire1));
  assign wire176 = ((+$signed(((reg11 ~^ wire120) ?
                       $unsigned(reg5) : (&reg12)))) ^~ (^$unsigned({{reg5,
                           wire122},
                       (8'hba)})));
  assign wire177 = wire174;
  assign wire178 = reg5[(3'h7):(2'h3)];
  assign wire179 = wire1[(4'hf):(4'hf)];
  assign wire180 = reg9[(4'h8):(3'h7)];
  assign wire181 = ((|reg9[(2'h2):(2'h2)]) ?
                       ((+($signed(wire180) && wire174[(4'hb):(3'h5)])) - (wire179[(4'h8):(1'h1)] ?
                           (~|(reg13 ?
                               (8'h9f) : (8'hb1))) : wire179[(4'ha):(2'h3)])) : ($signed((8'ha3)) < $unsigned((8'had))));
  always
    @(posedge clk) begin
      reg182 <= ($signed($signed((+{reg12}))) ? reg8 : (~&(8'hb6)));
      if ($unsigned(wire0[(4'hb):(4'hb)]))
        begin
          reg183 <= (^~$signed((wire4 ? wire4[(4'hd):(4'ha)] : (8'h9f))));
          reg184 <= $unsigned((^~wire122[(4'h8):(1'h1)]));
        end
      else
        begin
          reg183 <= (wire4 > $unsigned(reg13));
        end
    end
  module124 #() modinst186 (.clk(clk), .wire126(wire0), .wire125(wire179), .wire128(reg184), .wire127(reg10), .y(wire185));
  assign wire187 = {($signed({{wire15, wire4},
                           (wire179 ?
                               wire177 : wire123)}) ~^ (($unsigned(reg11) >>> $unsigned((7'h43))) ?
                           reg12 : (-$signed(wire174)))),
                       $signed(wire176)};
endmodule

module module124
#(parameter param173 = (~^(~|((~^(~^(8'haa))) >>> ((~(8'ha7)) ? ((8'ha1) ? (8'ha6) : (8'hbb)) : ((8'hbb) ? (8'ha6) : (8'h9e)))))))
(y, clk, wire128, wire127, wire126, wire125);
  output wire [(32'h206):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire128;
  input wire signed [(5'h14):(1'h0)] wire127;
  input wire [(4'he):(1'h0)] wire126;
  input wire signed [(4'ha):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire172;
  wire [(4'ha):(1'h0)] wire170;
  wire signed [(2'h3):(1'h0)] wire169;
  wire [(5'h12):(1'h0)] wire168;
  wire [(4'hd):(1'h0)] wire153;
  wire signed [(4'hf):(1'h0)] wire152;
  wire [(4'h8):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire150;
  wire signed [(5'h14):(1'h0)] wire149;
  wire signed [(4'hb):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  reg signed [(4'ha):(1'h0)] reg171 = (1'h0);
  reg [(2'h3):(1'h0)] reg167 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg166 = (1'h0);
  reg [(5'h13):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg161 = (1'h0);
  reg [(4'hb):(1'h0)] reg160 = (1'h0);
  reg [(3'h7):(1'h0)] reg159 = (1'h0);
  reg [(3'h6):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(5'h15):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(4'h8):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg131 = (1'h0);
  assign y = {wire172,
                 wire170,
                 wire169,
                 wire168,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire130,
                 wire129,
                 reg171,
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
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire129 = $unsigned($unsigned($unsigned($signed(wire128[(1'h1):(1'h1)]))));
  assign wire130 = $signed(wire125[(3'h7):(3'h6)]);
  always
    @(posedge clk) begin
      if ((({(wire128 + (wire128 ? wire127 : wire126))} ?
              ({{wire129,
                      wire125}} >= wire125[(4'h8):(3'h5)]) : wire128[(2'h3):(1'h0)]) ?
          wire127[(4'he):(1'h0)] : $unsigned($unsigned({((8'hab) ?
                  wire128 : wire125)}))))
        begin
          reg131 <= {(~$signed(($unsigned(wire127) == $unsigned(wire130)))),
              (wire126[(4'ha):(4'ha)] >= (~^wire128[(3'h5):(1'h0)]))};
          reg132 <= $signed(((8'hbb) ?
              $signed($signed($unsigned(wire125))) : $signed(wire125)));
          if ($unsigned(((($signed(wire127) ?
              reg132[(3'h4):(3'h4)] : reg131) ^~ (~|$unsigned(wire128))) + ($signed(wire129) ?
              wire125[(3'h6):(3'h5)] : $unsigned(((8'ha8) >= wire127))))))
            begin
              reg133 <= $signed(({{wire125[(4'h9):(3'h6)]}} + ($signed((&wire130)) >>> $signed(((8'haf) && (7'h40))))));
              reg134 <= (reg132 ?
                  ({$signed((wire126 < wire129)),
                      ((wire129 ?
                          (8'ha0) : wire126) + reg132[(3'h5):(3'h4)])} != (&{reg132[(1'h1):(1'h0)]})) : ((-wire129[(4'h8):(3'h5)]) || {{((8'hb0) ?
                              wire130 : wire130)}}));
              reg135 <= (8'ha9);
              reg136 <= ($unsigned(($signed(reg131) ?
                  (wire128[(3'h6):(2'h2)] > (-wire126)) : ((|wire127) << wire130[(2'h2):(1'h0)]))) - (((~|((8'h9e) ?
                      wire127 : wire127)) ?
                  (wire129 ? reg131 : wire130) : (reg133 ?
                      {(8'hbf)} : ((8'hb3) > (8'ha9)))) | ({reg135[(4'hc):(3'h7)]} ?
                  $unsigned((wire129 ^ (8'ha8))) : (8'hb3))));
              reg137 <= ((($unsigned($unsigned(wire129)) == (((8'hbe) <= wire129) ?
                  (wire127 ? wire130 : reg135) : {wire129})) >>> ({{wire130,
                      wire126}} | (~|wire130))) * {($unsigned(wire127[(4'h9):(3'h6)]) ?
                      {((8'ha3) ? wire129 : wire126)} : (&(reg131 ?
                          wire129 : wire130))),
                  $unsigned(wire128[(2'h3):(1'h0)])});
            end
          else
            begin
              reg133 <= (~^$signed(wire128[(1'h1):(1'h1)]));
              reg134 <= $unsigned($signed(({$unsigned(wire127)} || $signed((8'ha6)))));
              reg135 <= (~wire125[(4'h8):(1'h0)]);
            end
          if (({(!((^~(8'hba)) ? (wire128 ? (8'had) : wire130) : (8'h9f))),
              ({(wire127 > (8'hb7))} ?
                  {(&reg134)} : ($signed(wire130) ?
                      $unsigned(reg136) : reg135[(4'hc):(4'hb)]))} <= $unsigned(((wire126 - ((8'h9f) ?
                  wire129 : (8'ha3))) ?
              $signed($unsigned(reg136)) : $signed(reg132)))))
            begin
              reg138 <= (({reg137} ^~ wire129) && reg137[(3'h5):(2'h3)]);
            end
          else
            begin
              reg138 <= reg131;
              reg139 <= wire130[(3'h7):(3'h7)];
              reg140 <= (wire130 ?
                  (wire127 ?
                      reg131 : wire126[(3'h7):(1'h0)]) : $unsigned((((wire129 <<< reg135) ?
                      (+reg136) : wire125) != reg134)));
            end
        end
      else
        begin
          reg131 <= (wire129[(2'h3):(2'h3)] != {wire125});
          reg132 <= reg134[(4'h9):(3'h6)];
        end
      reg141 <= (+((^~(8'hba)) ?
          reg136 : (($unsigned(wire125) ^~ $signed(wire126)) ?
              $unsigned((7'h41)) : wire126)));
      if (($signed((wire125 == ({reg138} != $signed(reg140)))) != $signed(reg133)))
        begin
          reg142 <= $unsigned((((|{reg140}) ?
                  $unsigned(reg137) : ((~|wire127) ^~ $unsigned(reg140))) ?
              $unsigned((~((8'hac) ?
                  reg135 : wire130))) : $unsigned((wire125 ^ $unsigned((8'hbb))))));
          reg143 <= ($unsigned({{reg137[(2'h2):(1'h0)], ((8'hab) ~^ (8'hb9))},
              $signed(reg133[(3'h7):(2'h3)])}) + $signed(reg136[(3'h6):(1'h1)]));
          reg144 <= $signed(($signed(((reg131 ? (8'hb4) : reg137) || {reg142,
                  reg142})) ?
              ((reg141 >>> {reg136, reg136}) ?
                  $signed(((8'ha1) ?
                      reg137 : reg134)) : reg140[(1'h0):(1'h0)]) : reg134[(3'h4):(2'h2)]));
          reg145 <= {reg142[(3'h6):(3'h5)],
              $signed($unsigned($unsigned(wire128[(3'h7):(1'h1)])))};
        end
      else
        begin
          if (($signed(wire126[(3'h5):(1'h0)]) ?
              ($unsigned($signed(((8'ha1) ?
                  reg139 : wire129))) >> $unsigned({((8'hb5) ?
                      reg143 : reg138)})) : wire129[(3'h5):(1'h1)]))
            begin
              reg142 <= ((8'h9e) + (^~(reg142 ?
                  {$signed((8'hbc))} : reg137[(5'h15):(5'h10)])));
              reg143 <= (-$signed((8'hb5)));
              reg144 <= ((^~$signed($unsigned((reg136 ? wire127 : reg142)))) ?
                  (-({(reg142 ? wire127 : (8'hbb))} ?
                      ((reg143 ? reg139 : reg144) ?
                          $unsigned(reg131) : (!(8'hb3))) : reg139[(4'hd):(3'h6)])) : {$unsigned((~^(~reg140))),
                      (^~wire126[(4'hb):(3'h5)])});
              reg145 <= (((reg134 && (((7'h44) ?
                          reg131 : reg139) + (^~(8'had)))) ?
                      reg140[(3'h4):(2'h3)] : reg136) ?
                  {($unsigned(reg137) || reg137)} : (reg135[(3'h4):(2'h2)] ?
                      $signed(({reg139, (8'ha7)} ?
                          {wire130, wire127} : (reg140 ?
                              reg137 : reg141))) : {((8'ha0) == (reg140 ?
                              reg144 : reg135)),
                          reg140[(3'h7):(3'h6)]}));
              reg146 <= {(~($unsigned((~reg141)) ?
                      reg142[(3'h7):(2'h3)] : (8'hbd)))};
            end
          else
            begin
              reg142 <= (reg141[(3'h5):(1'h1)] <<< {(+wire128[(3'h4):(2'h2)]),
                  ($signed((!reg138)) ? reg137 : wire127)});
              reg143 <= $signed((((-reg136) & $unsigned(reg142[(1'h0):(1'h0)])) > $unsigned(wire127[(4'hd):(3'h6)])));
              reg144 <= (wire130 <<< ((reg138[(1'h0):(1'h0)] < $unsigned($signed((8'ha7)))) < {wire127[(4'h9):(2'h3)],
                  $unsigned((&reg133))}));
            end
        end
      reg147 <= reg131;
      reg148 <= ({reg144,
              {(((8'hb6) ? reg145 : reg139) ? $unsigned(reg133) : reg139),
                  $signed((reg147 == reg142))}} ?
          $signed(reg132) : {(+{(~reg139), ((8'hb9) || wire126)})});
    end
  assign wire149 = wire126[(3'h6):(1'h0)];
  assign wire150 = (reg141[(4'h9):(4'h9)] ?
                       ((!$unsigned(((8'hb9) <= reg140))) ?
                           reg147 : wire149[(3'h4):(2'h2)]) : (&{(8'haa),
                           ((~&reg136) && $signed(reg131))}));
  assign wire151 = $unsigned(reg134);
  assign wire152 = (^~$unsigned((reg145[(1'h1):(1'h0)] >>> {(wire150 ?
                           reg145 : (8'hba)),
                       $unsigned(wire149)})));
  assign wire153 = (-(reg148[(3'h5):(1'h1)] ?
                       {(|(reg139 ? reg131 : reg133)),
                           {$signed(reg147),
                               ((8'hb5) ?
                                   reg137 : (8'ha5))}} : ($unsigned(reg133[(4'h8):(1'h0)]) != wire126)));
  always
    @(posedge clk) begin
      reg154 <= $unsigned(($unsigned((8'hae)) ? (~&wire130) : reg141));
      reg155 <= (wire127 ? (8'hb3) : (-(+reg133[(4'h8):(3'h5)])));
      if (({(&reg140), wire129} ?
          $unsigned((({reg134} ? {wire126} : ((8'hae) != wire130)) ?
              (wire153 ?
                  (-(8'hbb)) : {wire150,
                      reg147}) : reg131[(4'hb):(3'h6)])) : ({$signed($signed(wire125)),
                  (~|reg135)} ?
              $unsigned(reg146[(4'h9):(3'h6)]) : (!$unsigned((wire150 <<< reg144))))))
        begin
          if (($unsigned($signed($unsigned((^~reg141)))) ?
              wire125 : (((8'ha6) ?
                  (((8'ha8) * reg137) - ((8'hb6) | wire149)) : ({reg145,
                          wire130} ?
                      (wire127 ?
                          (7'h40) : reg140) : (reg154 ~^ wire149))) * reg134)))
            begin
              reg156 <= (reg140[(5'h14):(4'ha)] ?
                  $unsigned((-wire149[(4'ha):(2'h3)])) : wire126[(2'h3):(1'h0)]);
              reg157 <= (~|(~^($unsigned((~^(7'h42))) | $unsigned(reg131))));
              reg158 <= ({(8'ha1)} ~^ (($signed(wire130) ?
                  $unsigned(wire152) : reg140[(3'h6):(1'h0)]) <<< wire126));
              reg159 <= reg139[(4'hd):(2'h2)];
            end
          else
            begin
              reg156 <= {{((|$signed(wire125)) ? reg133 : wire125),
                      {(reg133 > reg155[(4'hc):(4'h9)])}},
                  $unsigned(wire129[(3'h5):(2'h3)])};
              reg157 <= (reg144[(4'hd):(2'h3)] << wire130[(4'ha):(2'h2)]);
            end
          reg160 <= ((reg134[(3'h4):(1'h0)] - $signed(reg141[(2'h3):(1'h0)])) | ((~&(-(|reg133))) >>> ({$unsigned(reg155)} > (8'ha4))));
          if ((~((wire129[(3'h6):(3'h6)] < ($unsigned(reg146) ?
                  $unsigned(reg140) : reg142[(3'h6):(3'h4)])) ?
              (~reg132) : (reg157[(1'h0):(1'h0)] & reg146))))
            begin
              reg161 <= ($unsigned(reg143) > $signed({($unsigned((8'hb7)) != ((8'hbd) < reg145)),
                  $unsigned((reg159 ? (8'hbb) : wire151))}));
              reg162 <= (8'haf);
              reg163 <= $unsigned(reg156);
              reg164 <= ($unsigned({$signed(((7'h44) <<< reg136)),
                  reg162}) <= $unsigned((8'hac)));
              reg165 <= (~|((((reg133 ? wire126 : (8'ha6)) ?
                          reg136[(3'h5):(3'h4)] : $signed(wire129)) ?
                      reg135 : wire153[(4'ha):(1'h0)]) ?
                  (&((^reg135) ?
                      {reg137} : reg158[(3'h4):(1'h1)])) : $signed({$signed(reg143),
                      {reg140}})));
            end
          else
            begin
              reg161 <= (~(-($unsigned($unsigned(reg137)) ^ ((~reg141) ?
                  (reg142 ? reg132 : wire150) : $signed(reg133)))));
              reg162 <= (((~^($unsigned((8'h9e)) & $unsigned(reg155))) + ({((8'hbc) ?
                          reg137 : reg161),
                      $unsigned(reg156)} | reg145)) ?
                  $unsigned(reg160[(3'h5):(1'h0)]) : {reg138[(2'h2):(2'h2)],
                      wire127[(4'hb):(1'h1)]});
              reg163 <= $signed(((8'hb2) ?
                  {$signed($signed(reg161)),
                      reg144[(1'h1):(1'h1)]} : (wire128[(3'h4):(2'h3)] ?
                      (-(reg136 ? reg137 : wire153)) : (~^(-wire126)))));
              reg164 <= ((|reg160[(4'hb):(3'h4)]) ~^ reg158[(3'h5):(2'h2)]);
              reg165 <= $signed($unsigned((+{(8'hbe), (^~reg158)})));
            end
          reg166 <= (((reg139[(1'h1):(1'h0)] * (reg139[(5'h10):(4'ha)] << (reg138 >>> reg161))) << $unsigned(reg154)) == (!$signed($unsigned((~|wire149)))));
          reg167 <= {{$unsigned(((wire128 ? wire126 : reg134) <= wire128))}};
        end
      else
        begin
          reg156 <= $signed($signed((!reg131)));
          reg157 <= ((($unsigned($signed(wire127)) <<< ($unsigned(wire149) < (wire130 ?
                      (8'ha8) : reg163))) ?
                  (!(8'hbf)) : (reg145[(2'h2):(2'h2)] ?
                      ((wire150 >>> reg161) ?
                          wire130[(4'ha):(3'h4)] : (~|reg131)) : (~|(8'hae)))) ?
              (((wire153[(3'h5):(2'h3)] >= {reg158}) ?
                  (reg161[(2'h3):(1'h0)] || reg143) : (|(~|reg146))) ^ reg163) : $unsigned({$unsigned({wire150}),
                  reg148[(2'h2):(1'h0)]}));
          reg158 <= ($unsigned(((~^(wire126 ? reg134 : wire126)) ?
                  {(reg160 ? reg136 : reg143), $signed(reg133)} : ((~|reg165) ?
                      $signed(reg161) : $signed(reg161)))) ?
              ($unsigned($signed($unsigned(reg132))) + $unsigned(wire129)) : ((~&reg162) && $unsigned((8'hb3))));
          reg159 <= $signed(wire127[(4'he):(4'hd)]);
          reg160 <= $unsigned(reg137[(4'hc):(1'h1)]);
        end
    end
  assign wire168 = ((wire127[(1'h1):(1'h1)] ?
                       wire151 : wire130[(4'h8):(3'h5)]) || $unsigned((|(~^(wire125 ^~ wire151)))));
  assign wire169 = reg148;
  assign wire170 = $signed(((+($signed((8'hb0)) ?
                           (reg146 <= wire130) : (7'h44))) ?
                       (reg134[(3'h5):(1'h1)] || ((^(8'hbe)) <= wire125[(4'h8):(4'h8)])) : reg160));
  always
    @(posedge clk) begin
      reg171 <= (!reg147);
    end
  assign wire172 = (reg135 ?
                       $signed((~$unsigned((reg144 < reg158)))) : (({$unsigned(wire149),
                               wire152[(3'h7):(3'h7)]} ?
                           $signed($unsigned(wire153)) : $signed(wire125)) << $unsigned(reg139[(4'hf):(3'h7)])));
endmodule

module module16
#(parameter param118 = (~&({(!(!(7'h42))), ({(8'hbf), (8'haa)} >>> {(8'h9d), (7'h43)})} > ((!((8'hbc) ? (8'hb4) : (8'ha9))) ? (7'h40) : (8'hb9)))), 
parameter param119 = (|param118))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire21;
  input wire [(5'h12):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire113;
  wire [(2'h2):(1'h0)] wire112;
  wire [(3'h5):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(3'h7):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire68;
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire37,
                 wire22,
                 wire39,
                 wire68,
                 (1'h0)};
  assign wire22 = ($signed(((wire20 ? (wire20 ^ (8'hbc)) : $signed(wire19)) ?
                      (+(wire18 ? wire17 : wire17)) : (|(wire18 ?
                          wire19 : (8'ha2))))) != ($unsigned(wire17[(4'h9):(4'h9)]) ?
                      $signed({(wire20 >>> wire19),
                          (wire20 ?
                              wire17 : wire17)}) : $signed((wire19 <= $signed(wire17)))));
  module23 #() modinst38 (wire37, clk, wire17, wire22, wire19, wire21, wire20);
  assign wire39 = wire21;
  module40 #() modinst69 (wire68, clk, wire19, wire21, wire20, wire22, wire37);
  assign wire70 = wire18[(4'hc):(4'hc)];
  assign wire71 = wire20;
  assign wire72 = wire21;
  assign wire73 = $unsigned($signed(((^$unsigned(wire18)) >>> $unsigned(wire19[(5'h12):(2'h3)]))));
  assign wire74 = $signed(($unsigned(((|wire18) <<< $signed(wire73))) ?
                      (!$unsigned((wire71 ?
                          wire21 : wire39))) : $unsigned((~wire18))));
  module75 #() modinst108 (wire107, clk, wire21, wire22, wire17, wire20);
  assign wire109 = $signed(($unsigned((wire21[(5'h13):(1'h0)] ?
                       wire21[(3'h7):(2'h2)] : (~|wire74))) | $unsigned(wire18)));
  assign wire110 = $signed(wire39);
  assign wire111 = (((~&($unsigned(wire20) ^ (~wire70))) ^ $unsigned((wire68 & $signed(wire70)))) ~^ ((&wire18) ?
                       (wire71 ?
                           $signed((!wire17)) : ((~&wire109) ?
                               (|wire72) : $unsigned(wire74))) : (({wire19} ?
                           (wire19 ~^ wire71) : $unsigned(wire72)) ~^ {$signed(wire72),
                           (8'haa)})));
  assign wire112 = $unsigned((wire110[(4'hb):(4'h9)] ?
                       ((+$unsigned(wire109)) ?
                           $signed((wire109 ?
                               (8'ha6) : wire73)) : $signed((^~wire22))) : ((!(wire107 ?
                           wire72 : wire72)) > wire74)));
  assign wire113 = wire22;
  assign wire114 = ({(|((wire109 ? wire72 : wire72) ?
                           $signed(wire68) : (wire22 * wire74)))} << (((^~wire111) ?
                       {(wire73 >>> wire17)} : wire18) || wire73));
  assign wire115 = {wire22};
  assign wire116 = $signed((wire110[(4'hc):(4'h9)] <= $signed(wire71)));
  assign wire117 = $unsigned((-(~|$unsigned(wire116[(3'h7):(3'h7)]))));
endmodule

module module75  (y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire79;
  input wire signed [(3'h7):(1'h0)] wire78;
  input wire [(4'h8):(1'h0)] wire77;
  input wire [(5'h12):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire89;
  wire [(4'hd):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire80;
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
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
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire80 = $signed({($unsigned($unsigned((8'hb0))) ?
                          (&wire77) : $unsigned(wire78))});
  assign wire81 = wire78[(3'h7):(3'h7)];
  assign wire82 = ((^(8'hb5)) ?
                      (wire80[(2'h2):(1'h0)] & {wire78[(1'h1):(1'h0)],
                          ($signed(wire77) ?
                              (wire79 <= wire80) : ((8'hb6) ?
                                  (8'ha3) : wire76))}) : $signed(wire79));
  assign wire83 = $signed(($signed(({wire78, (8'hba)} ?
                          wire78[(3'h5):(3'h4)] : $signed(wire79))) ?
                      wire77[(3'h6):(2'h3)] : {(^~$unsigned(wire78))}));
  assign wire84 = $unsigned($unsigned((-wire77[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg85 <= (!$signed((~|($signed(wire82) ? (+wire80) : (~|wire80)))));
      reg86 <= $unsigned($unsigned(wire76[(1'h1):(1'h1)]));
      reg87 <= {reg86[(3'h6):(1'h1)]};
    end
  assign wire88 = (reg85 <<< $signed($unsigned((8'haf))));
  assign wire89 = wire80;
  assign wire90 = wire81[(2'h2):(1'h1)];
  assign wire91 = ($unsigned({wire83, (+(~|(8'hb2)))}) ?
                      ($signed((wire83[(3'h7):(3'h6)] ^~ wire90)) + $unsigned(wire90)) : (~&wire81[(2'h2):(1'h0)]));
  assign wire92 = (~&$unsigned($unsigned((-wire81))));
  assign wire93 = {{(wire91[(4'h9):(4'h9)] ?
                              (wire77[(1'h1):(1'h0)] ?
                                  $unsigned(wire92) : (-wire88)) : ($unsigned(wire92) ^ $signed(wire92))),
                          (wire77[(4'h8):(2'h3)] ?
                              ((wire77 >> wire80) >> (^wire79)) : $unsigned((wire92 ?
                                  (8'hbf) : wire84)))},
                      $signed((((~&wire77) >= wire89[(3'h5):(2'h3)]) > ($unsigned(wire82) <= (reg85 ?
                          wire82 : wire88))))};
  always
    @(posedge clk) begin
      reg94 <= ({(wire82 > (&(wire91 ~^ wire93))),
          $unsigned((^(wire90 * reg87)))} > ($signed(wire81[(1'h1):(1'h1)]) ~^ ($unsigned((wire90 && wire88)) ?
          ($signed(wire79) ?
              wire93[(2'h3):(1'h1)] : $signed(wire89)) : ($signed(wire83) ?
              (&wire89) : (^~wire78)))));
      reg95 <= (wire81 ?
          ($unsigned((((8'ha9) ^ reg94) == $unsigned((8'haa)))) ?
              (wire80[(2'h2):(1'h1)] ?
                  wire77 : reg87) : ($signed($unsigned(wire79)) ?
                  wire83 : ($signed((8'hb5)) ?
                      (8'hba) : (reg86 & (8'ha4))))) : $signed((wire81 && ((reg85 ?
              wire76 : wire92) ^ (wire89 ^~ reg85)))));
      reg96 <= wire90[(2'h3):(2'h3)];
      reg97 <= $signed(reg85);
      if (reg95)
        begin
          reg98 <= $signed(($signed((~^$signed(reg97))) || $signed((wire81 && (wire82 ?
              reg87 : wire89)))));
          reg99 <= (!(8'hb4));
          if (($unsigned({$signed(reg85), {wire91}}) ?
              $unsigned((&$unsigned(((8'ha1) + wire91)))) : (($unsigned($signed(wire78)) << reg87[(3'h7):(3'h6)]) || {({wire88} <<< (+reg86))})))
            begin
              reg100 <= (8'hb4);
              reg101 <= ((((wire82[(4'he):(4'he)] ^~ $unsigned(reg86)) ?
                      wire88 : reg87) ?
                  ((reg94[(1'h1):(1'h0)] | ((8'ha3) ? reg86 : (8'h9c))) ?
                      (&$unsigned((8'hae))) : wire91) : wire80[(2'h2):(2'h2)]) & (+reg97));
              reg102 <= (({reg98, {wire78[(2'h3):(1'h0)]}} ?
                  $unsigned($unsigned($unsigned(wire92))) : (($signed(reg100) >>> $signed(wire82)) ?
                      $unsigned(reg87[(2'h3):(2'h3)]) : wire91)) ^ reg94);
              reg103 <= ($unsigned($signed((~&(-reg101)))) ?
                  (reg85[(3'h7):(3'h5)] >= $signed((reg100 ?
                      $signed((8'hab)) : ((7'h44) ?
                          reg101 : (8'ha6))))) : ($signed($signed(wire77)) ?
                      $unsigned(($signed((8'ha1)) ?
                          $unsigned(reg86) : (wire90 ?
                              reg97 : reg86))) : ($unsigned(wire90[(2'h2):(2'h2)]) - reg102[(3'h7):(1'h1)])));
            end
          else
            begin
              reg100 <= (wire84 - {(($signed(wire91) ?
                      reg102 : (reg96 || (8'ha3))) ^ {(reg86 << reg86),
                      wire81}),
                  {((reg102 >> reg97) ? $unsigned(reg103) : {reg98}),
                      reg97[(2'h3):(2'h3)]}});
              reg101 <= {$unsigned(reg94),
                  $unsigned(((~^(!wire78)) >> {$signed(wire93)}))};
              reg102 <= wire81;
              reg103 <= ((~|(8'ha6)) << reg98);
            end
          reg104 <= (wire77[(2'h2):(1'h1)] - $signed(reg96[(1'h0):(1'h0)]));
          reg105 <= $signed(((^~$unsigned(((8'ha3) ? reg86 : reg102))) ?
              wire80[(1'h1):(1'h0)] : (reg100 != $unsigned($unsigned((8'ha9))))));
        end
      else
        begin
          reg98 <= $unsigned({(reg101[(2'h3):(2'h3)] ^~ {((8'hab) ?
                      wire84 : reg94)}),
              (8'h9c)});
          reg99 <= $unsigned(wire82);
          reg100 <= (wire89 ?
              (8'haa) : ((reg103[(3'h4):(2'h2)] ?
                  {(reg85 ? wire90 : wire89)} : ($unsigned(reg103) ?
                      $unsigned(wire88) : {wire92})) | (~|reg98)));
          reg101 <= (~^{reg105, $unsigned((!$signed(wire89)))});
        end
    end
  always
    @(posedge clk) begin
      reg106 <= $signed((+reg97[(3'h6):(1'h0)]));
    end
endmodule

module module40
#(parameter param66 = {(((((8'hba) ^~ (8'hbc)) <= ((8'hb7) | (8'haa))) ? (((8'hb3) ? (8'hb5) : (8'ha1)) | ((8'h9f) ? (8'h9c) : (8'hab))) : (^~(&(8'hab)))) >>> (+{((8'ha7) & (8'hb3)), ((8'h9d) ? (8'h9f) : (8'ha8))}))}, 
parameter param67 = (~(!({{(8'ha3), param66}} << ({(7'h41), param66} <= (param66 ^ (8'haa)))))))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire45;
  input wire signed [(3'h4):(1'h0)] wire44;
  input wire [(5'h10):(1'h0)] wire43;
  input wire signed [(4'h8):(1'h0)] wire42;
  input wire [(5'h14):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire46 = wire43[(3'h6):(3'h6)];
  assign wire47 = wire42[(3'h5):(3'h4)];
  assign wire48 = wire43;
  assign wire49 = wire43[(3'h7):(2'h3)];
  always
    @(posedge clk) begin
      reg50 <= wire48;
      reg51 <= wire46;
      reg52 <= wire48;
      reg53 <= ((!$unsigned($signed($signed(wire47)))) ?
          $signed(wire42[(1'h0):(1'h0)]) : $unsigned($unsigned($unsigned($unsigned(wire42)))));
    end
  assign wire54 = wire46[(3'h5):(2'h2)];
  assign wire55 = (^~((~^wire49) >= $unsigned(((&wire41) ?
                      {reg52} : $unsigned((8'hb4))))));
  assign wire56 = ((~&(8'hbd)) ?
                      wire48[(1'h0):(1'h0)] : ({wire43,
                          (wire44[(3'h4):(2'h3)] && $signed((8'had)))} ~^ {((wire44 ?
                                  wire46 : (8'h9d)) ?
                              (wire49 ? reg50 : wire54) : reg53),
                          ($unsigned(wire48) ?
                              $unsigned((8'had)) : $signed(reg52))}));
  assign wire57 = (~^{wire45});
  assign wire58 = ($unsigned(wire49) ~^ wire42[(2'h2):(1'h0)]);
  assign wire59 = wire41[(5'h14):(4'hc)];
  assign wire60 = wire57[(3'h4):(1'h0)];
  assign wire61 = (wire56 ?
                      {wire58[(4'hc):(3'h4)],
                          (+(wire48 ?
                              (wire46 ?
                                  wire59 : reg50) : (wire47 ^ wire48)))} : {{$unsigned($unsigned(wire55)),
                              {(wire47 && wire55), (7'h41)}},
                          $signed((|wire54))});
  assign wire62 = wire54[(2'h3):(1'h0)];
  assign wire63 = $signed((~(((wire54 ^ reg50) ?
                          {wire59, wire59} : (wire61 ? (8'h9f) : (8'ha3))) ?
                      $unsigned($signed(wire47)) : $signed(wire59))));
  assign wire64 = ((wire41[(4'h8):(2'h3)] ?
                      ((reg51 ? (wire45 ? wire43 : wire61) : wire41) ?
                          {(|wire59)} : ((reg50 ^ wire63) ^ wire55)) : {{wire47[(1'h0):(1'h0)],
                              (wire44 <= wire55)},
                          ($unsigned(wire56) - wire60[(4'hb):(3'h4)])}) > {{(^~$signed(wire62))},
                      (({reg52, (8'hab)} | wire45[(5'h10):(3'h6)]) ?
                          (~wire60) : reg50[(1'h0):(1'h0)])});
  assign wire65 = ($signed($signed((wire62 <= wire55))) ?
                      wire58 : ($signed({$unsigned(wire58)}) >> (wire63[(4'hb):(2'h3)] ?
                          $signed($unsigned((8'hae))) : $unsigned($signed((8'ha0))))));
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire28;
  input wire signed [(3'h6):(1'h0)] wire27;
  input wire signed [(5'h11):(1'h0)] wire26;
  input wire signed [(2'h3):(1'h0)] wire25;
  input wire [(4'he):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 (1'h0)};
  assign wire29 = wire26[(5'h11):(1'h1)];
  assign wire30 = wire28[(1'h0):(1'h0)];
  assign wire31 = $signed($unsigned(((!wire24) ~^ ($signed(wire27) ~^ {wire29}))));
  assign wire32 = wire28;
  assign wire33 = (^~$signed((wire31[(3'h4):(2'h3)] ?
                      (8'ha1) : ({wire26} ? (&wire29) : (~|(8'hb5))))));
  assign wire34 = wire32[(1'h0):(1'h0)];
  assign wire35 = (~|(|wire25[(1'h1):(1'h0)]));
  assign wire36 = ((8'hac) ?
                      (-((~&(wire33 ?
                          wire27 : wire28)) <= $unsigned(wire24))) : $signed(wire32));
endmodule
