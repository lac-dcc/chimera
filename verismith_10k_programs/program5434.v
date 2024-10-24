module top
#(parameter param206 = (^(({((8'ha4) < (8'hab))} & ({(8'hb1)} ? {(7'h41), (8'hbc)} : ((8'ha3) ? (8'haa) : (8'ha0)))) ~^ ((^(-(8'h9d))) && (~^((8'had) | (8'hb9)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire205;
  wire signed [(3'h6):(1'h0)] wire204;
  wire signed [(4'hb):(1'h0)] wire203;
  wire [(5'h15):(1'h0)] wire202;
  wire [(2'h3):(1'h0)] wire201;
  wire signed [(3'h4):(1'h0)] wire200;
  wire signed [(3'h4):(1'h0)] wire199;
  wire [(3'h7):(1'h0)] wire195;
  wire signed [(5'h13):(1'h0)] wire178;
  wire [(5'h11):(1'h0)] wire172;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire197;
  reg [(4'ha):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg175 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg184 = (1'h0);
  reg signed [(4'he):(1'h0)] reg185 = (1'h0);
  reg [(3'h7):(1'h0)] reg186 = (1'h0);
  reg [(4'he):(1'h0)] reg187 = (1'h0);
  reg [(4'hf):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg189 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg191 = (1'h0);
  reg [(4'hd):(1'h0)] reg192 = (1'h0);
  reg [(5'h13):(1'h0)] reg193 = (1'h0);
  reg [(4'hf):(1'h0)] reg194 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire195,
                 wire178,
                 wire172,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire197,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg180,
                 reg181,
                 reg182,
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
                 (1'h0)};
  assign wire5 = ($unsigned({wire4[(4'h8):(3'h6)]}) ?
                     (8'h9c) : $signed(wire0[(3'h7):(3'h5)]));
  assign wire6 = $signed((^~{wire0[(1'h0):(1'h0)]}));
  assign wire7 = $unsigned($unsigned(wire4[(4'h9):(3'h4)]));
  assign wire8 = (|(&{$signed(((8'hab) != (8'hb6)))}));
  assign wire9 = ((($signed((wire8 ? wire4 : wire5)) && {(wire8 ?
                         wire5 : wire1)}) + {({wire7,
                         wire1} + $signed(wire4))}) < ((8'haf) ~^ (((~&(8'ha6)) > (wire4 ?
                     wire4 : wire4)) + wire1[(3'h7):(3'h7)])));
  assign wire10 = $signed(wire0[(4'h9):(2'h3)]);
  assign wire11 = wire8[(4'hd):(3'h5)];
  assign wire12 = $signed((((wire4 >> (!wire10)) ~^ (8'ha9)) && {$unsigned({wire2,
                          wire9}),
                      ($unsigned(wire8) ? wire4 : wire5)}));
  module13 #() modinst173 (.wire16(wire3), .y(wire172), .wire14(wire2), .wire15(wire4), .wire17(wire12), .clk(clk));
  always
    @(posedge clk) begin
      reg174 <= (+{$unsigned(((~^wire9) << wire172[(4'ha):(1'h1)]))});
      reg175 <= ($unsigned(((!(-wire3)) ?
          ((wire9 ? (7'h44) : wire12) ?
              wire10[(2'h3):(1'h1)] : (wire1 > wire6)) : $unsigned({reg174}))) >> $unsigned((({wire1,
          wire172} | {(7'h43)}) & (((8'haa) ? (8'hb5) : wire4) ?
          wire3 : {wire10, wire3}))));
      reg176 <= ((wire5[(2'h2):(2'h2)] ?
              ($unsigned($signed(wire5)) < $signed(wire4)) : (($unsigned(wire1) ?
                      $unsigned(wire7) : wire0) ?
                  wire3[(4'ha):(1'h1)] : {wire4})) ?
          $signed(reg174[(1'h1):(1'h0)]) : wire10);
      reg177 <= (+(wire11[(1'h1):(1'h1)] ?
          wire172 : $signed(((~&wire172) ?
              ((8'hb0) ? wire1 : wire12) : $signed(wire4)))));
    end
  module66 #() modinst179 (.wire69(wire3), .y(wire178), .wire71(wire0), .clk(clk), .wire67(wire11), .wire70(reg175), .wire68(wire5));
  always
    @(posedge clk) begin
      reg180 <= ((!{$signed($unsigned(wire0)),
          $signed($signed((8'hb9)))}) - (~((7'h43) ?
          {((7'h40) <= wire172), (&wire2)} : wire3)));
      if (reg174)
        begin
          reg181 <= (wire4[(4'h8):(1'h0)] | $signed(wire0[(2'h3):(2'h2)]));
        end
      else
        begin
          reg181 <= ((8'hb8) < {(wire0 != $unsigned(wire172)),
              $signed($signed($signed(wire6)))});
          reg182 <= wire5[(1'h1):(1'h0)];
          reg183 <= ($unsigned(wire172[(3'h4):(1'h0)]) ?
              (~^(7'h42)) : {(wire9 << (|$unsigned(reg175))), wire172});
          if ($signed($signed((+(8'haa)))))
            begin
              reg184 <= wire12;
              reg185 <= reg183;
            end
          else
            begin
              reg184 <= (8'h9f);
              reg185 <= ($unsigned((^~$signed(reg175[(4'hf):(4'he)]))) ?
                  (({$unsigned(wire6)} ? wire11 : reg182[(4'hd):(3'h4)]) ?
                      reg181 : wire8[(4'hb):(4'hb)]) : $unsigned({((reg177 ?
                          wire2 : (8'hbb)) != $signed((8'ha3))),
                      $signed((~wire8))}));
              reg186 <= reg175;
              reg187 <= ((~|$unsigned(($unsigned(wire172) ~^ (wire172 ?
                  reg186 : wire4)))) <<< $signed($signed((^$unsigned(wire6)))));
            end
        end
      if (((|{(~^reg177),
          $signed((wire4 ~^ reg182))}) >> (($unsigned((reg183 * reg175)) < (wire0[(4'h8):(1'h0)] ?
          $unsigned(reg175) : wire5[(3'h7):(3'h6)])) >> $signed(((reg182 ?
              reg187 : (8'h9d)) ?
          $signed(wire6) : (~^wire172))))))
        begin
          reg188 <= reg182;
          reg189 <= $signed((($unsigned((-(8'h9d))) ~^ (((8'had) <<< wire0) ?
              (reg182 << (8'hb1)) : (7'h41))) <<< (($unsigned(wire8) << wire3) ?
              $signed($signed(wire178)) : ((~^wire5) && (reg185 >> wire5)))));
          reg190 <= $signed(wire4[(4'ha):(3'h6)]);
          reg191 <= wire11[(3'h6):(2'h2)];
          reg192 <= $unsigned($signed($signed(wire8[(2'h2):(1'h0)])));
        end
      else
        begin
          reg188 <= wire4;
          reg189 <= reg189[(2'h3):(1'h0)];
          reg190 <= {($unsigned(wire8[(3'h7):(2'h2)]) ~^ $unsigned({$unsigned((8'hbe)),
                  $unsigned(reg191)}))};
          reg191 <= ({{(&(wire8 ^ (8'h9e)))},
              $signed($unsigned($unsigned(reg176)))} | reg175[(5'h12):(4'hb)]);
        end
      reg193 <= ((reg177[(2'h3):(1'h0)] ~^ $signed($signed((wire5 >>> reg184)))) & (~&$signed(reg174)));
      reg194 <= {$unsigned(wire11)};
    end
  module139 #() modinst196 (wire195, clk, reg188, reg177, reg183, wire12, reg184);
  module108 #() modinst198 (wire197, clk, reg181, reg182, reg188, wire11);
  assign wire199 = reg190[(3'h6):(3'h5)];
  assign wire200 = $unsigned((~^$signed(wire8)));
  assign wire201 = ({reg188[(2'h2):(2'h2)]} <= (wire1 ?
                       $unsigned({$unsigned(wire200)}) : ($unsigned((wire8 ?
                               wire12 : reg183)) ?
                           {(wire1 <= reg180),
                               wire1} : $unsigned($signed(reg188)))));
  assign wire202 = ($signed(wire5[(4'hb):(1'h0)]) ?
                       $unsigned({(~&$unsigned(wire6))}) : ((~^$signed((wire10 ?
                           wire200 : wire8))) | reg182[(4'hf):(3'h4)]));
  assign wire203 = $signed($unsigned((^~$signed($unsigned(wire0)))));
  assign wire204 = $signed((!reg187[(4'h9):(2'h3)]));
  assign wire205 = reg176;
endmodule

module module13  (y, clk, wire14, wire15, wire16, wire17);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire14;
  input wire [(4'hb):(1'h0)] wire15;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire signed [(5'h12):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire171;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire126;
  wire signed [(3'h7):(1'h0)] wire127;
  wire [(4'ha):(1'h0)] wire138;
  wire [(4'h8):(1'h0)] wire169;
  reg [(4'hc):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  assign y = {wire171,
                 wire18,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire62,
                 wire64,
                 wire65,
                 wire106,
                 wire124,
                 wire126,
                 wire127,
                 wire138,
                 wire169,
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
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire18 = (((~^$unsigned($signed(wire15))) ?
                      $unsigned(({wire17, wire17} ?
                          (wire14 ? wire14 : wire17) : (wire14 ?
                              wire15 : (8'ha4)))) : wire14) - (({((8'hbb) ?
                          wire16 : wire14)} <= wire17) ^ (&$signed($signed((8'hba))))));
  always
    @(posedge clk) begin
      reg19 <= wire18;
      reg20 <= (wire16 ?
          (~^((wire17[(2'h2):(1'h1)] & wire16) & (^$signed((8'hac))))) : wire18[(2'h2):(1'h1)]);
      reg21 <= wire14;
    end
  assign wire22 = {(wire15 ~^ (-{(wire14 ? wire14 : wire17)})),
                      $signed($signed(((~wire16) ?
                          (reg20 ? wire17 : wire16) : (^reg20))))};
  assign wire23 = (8'h9f);
  assign wire24 = $signed($unsigned((((8'hb1) + (wire22 ?
                      wire17 : (8'hb1))) + $unsigned(wire22))));
  assign wire25 = (-wire22);
  module26 #() modinst63 (wire62, clk, wire18, wire15, reg21, wire23, wire24);
  assign wire64 = ({$signed($unsigned($signed(reg21))),
                          {$unsigned($signed(wire16)),
                              $signed($unsigned(reg19))}} ?
                      $unsigned((~({wire23,
                          wire23} > $unsigned(wire62)))) : wire25);
  assign wire65 = $signed((~|wire64[(1'h1):(1'h0)]));
  module66 #() modinst107 (.wire68(wire22), .wire70(reg20), .clk(clk), .wire69(wire17), .wire67(wire65), .y(wire106), .wire71(wire62));
  module108 #() modinst125 (.wire109(wire15), .wire110(wire65), .clk(clk), .wire112(wire23), .wire111(wire24), .y(wire124));
  assign wire126 = wire15;
  assign wire127 = wire24;
  always
    @(posedge clk) begin
      reg128 <= ($unsigned((^$unsigned((wire124 ^~ wire22)))) ?
          (~(-$unsigned((wire18 ^ wire14)))) : wire23);
      if ({$signed((((wire106 || wire22) ?
              wire18[(4'h9):(1'h1)] : $unsigned(wire126)) >= (wire64[(3'h5):(1'h0)] ?
              $unsigned(wire16) : ((8'ha0) ? wire15 : reg20))))})
        begin
          reg129 <= $signed(((!(((8'h9d) ?
              wire16 : wire24) + (+wire124))) <<< wire65));
          if ((|$signed((|((8'hbc) <= $signed(wire106))))))
            begin
              reg130 <= wire106[(4'h9):(1'h0)];
              reg131 <= {$signed((^~reg20[(3'h6):(2'h2)]))};
              reg132 <= ($unsigned($signed($unsigned(((8'ha0) & wire14)))) ?
                  ($unsigned((-(^wire62))) ?
                      ($unsigned((reg130 >= reg20)) <= wire25) : {($signed(wire15) ?
                              $unsigned(wire23) : (-wire24)),
                          $unsigned((wire64 ?
                              wire18 : (8'haa)))}) : $unsigned($unsigned(reg19[(3'h5):(2'h2)])));
              reg133 <= $signed(wire65[(4'h9):(4'h9)]);
            end
          else
            begin
              reg130 <= $signed(($signed(reg131[(4'hb):(2'h2)]) ?
                  (^~({wire24,
                      wire62} != $signed(reg130))) : ($unsigned((wire14 ?
                      (8'ha6) : wire15)) >> reg21[(3'h4):(2'h2)])));
              reg131 <= (((((reg19 ? wire127 : (8'had)) ?
                          (wire65 ^ wire24) : (8'hb1)) >> $signed(wire124[(1'h1):(1'h1)])) ?
                      $signed($unsigned((8'hb0))) : {(wire24[(2'h3):(2'h2)] >= (|reg130))}) ?
                  (&$unsigned(reg133[(4'he):(3'h4)])) : $signed(($unsigned({(8'hbe),
                      (7'h42)}) | (~|(8'hb7)))));
              reg132 <= $signed((8'hac));
            end
          reg134 <= reg133[(4'h8):(4'h8)];
        end
      else
        begin
          reg129 <= $signed({wire16[(2'h2):(1'h0)], (~wire18[(3'h4):(2'h2)])});
          reg130 <= ((~|(|$signed(wire24[(1'h1):(1'h0)]))) ?
              $signed(wire25[(5'h10):(4'hf)]) : wire17[(4'ha):(3'h7)]);
          reg131 <= $signed((8'hb4));
          reg132 <= ($unsigned((((wire64 ?
                  wire25 : wire23) < $unsigned(wire106)) ?
              $signed($unsigned(reg134)) : (8'ha3))) + wire14);
          reg133 <= $unsigned(wire64[(3'h4):(2'h3)]);
        end
      reg135 <= ($unsigned($signed(wire22)) ?
          ((wire126[(2'h3):(1'h1)] <<< reg21[(4'h8):(3'h5)]) ?
              reg132 : {(8'ha6)}) : (^~($signed((+wire15)) || (^~wire126[(2'h2):(1'h1)]))));
      reg136 <= $unsigned((~$unsigned((+(8'hb6)))));
      reg137 <= wire23[(1'h0):(1'h0)];
    end
  assign wire138 = $signed(wire124);
  module139 #() modinst170 (wire169, clk, wire22, reg130, wire25, wire65, reg21);
  assign wire171 = reg135[(1'h1):(1'h0)];
endmodule

module module139
#(parameter param167 = ((({((8'hbd) ^ (8'ha5)), ((8'ha9) ? (8'ha7) : (8'h9e))} ^~ ({(8'ha9), (8'hb2)} ? (~|(8'had)) : ((8'ha4) ^~ (8'h9f)))) ? (-{((8'hb5) >> (8'ha5)), ((7'h44) <= (8'haa))}) : (|(+(8'ha9)))) ? {{(+((7'h43) ? (8'ha1) : (8'ha7)))}, ((|((8'hb5) + (8'ha7))) ? (~^(-(8'hb6))) : {((8'hb8) <= (8'hbc))})} : ({(~|((7'h41) >> (8'haa)))} + {{{(8'h9c)}}})), 
parameter param168 = param167)
(y, clk, wire144, wire143, wire142, wire141, wire140);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire144;
  input wire [(4'ha):(1'h0)] wire143;
  input wire signed [(4'hb):(1'h0)] wire142;
  input wire signed [(5'h15):(1'h0)] wire141;
  input wire signed [(4'h8):(1'h0)] wire140;
  wire [(3'h5):(1'h0)] wire166;
  wire [(5'h11):(1'h0)] wire165;
  wire [(5'h11):(1'h0)] wire164;
  wire [(4'hd):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire162;
  wire [(4'hc):(1'h0)] wire161;
  wire [(4'hf):(1'h0)] wire160;
  wire [(3'h5):(1'h0)] wire150;
  wire signed [(4'h8):(1'h0)] wire149;
  wire signed [(5'h12):(1'h0)] wire148;
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(5'h13):(1'h0)] reg158 = (1'h0);
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire150,
                 wire149,
                 wire148,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg145 <= $signed($signed(((wire141 ?
          wire143[(2'h3):(1'h1)] : {wire141}) | ((wire140 < wire143) <= (wire143 <= wire142)))));
      reg146 <= (((^wire141[(5'h15):(4'hd)]) >= (8'hb0)) ~^ reg145);
      reg147 <= ($signed(($unsigned((-wire144)) ?
              (8'hb2) : $signed(wire142[(4'hb):(1'h1)]))) ?
          $unsigned(wire140) : (({$unsigned(wire142), wire140[(4'h8):(3'h7)]} ?
                  (~$unsigned(reg145)) : ({(8'ha7), reg146} << wire140)) ?
              (wire144[(3'h5):(3'h5)] ?
                  (wire144 ?
                      (wire141 ?
                          wire143 : wire140) : {(7'h43)}) : {(wire141 >= reg145)}) : $signed((wire144 || wire140))));
    end
  assign wire148 = $signed($unsigned((wire140 ? (8'ha0) : $signed(reg147))));
  assign wire149 = ({reg147[(1'h1):(1'h0)], reg146} ?
                       {wire148[(4'hb):(3'h4)],
                           ((reg147 ?
                               wire148[(4'hf):(3'h6)] : $signed(wire142)) ^~ $signed($unsigned((8'hab))))} : $unsigned({$unsigned($unsigned(reg147)),
                           $unsigned($unsigned(reg147))}));
  assign wire150 = (+($unsigned($signed($signed(wire142))) ?
                       $unsigned((&(wire144 ? reg146 : wire144))) : wire143));
  always
    @(posedge clk) begin
      reg151 <= wire140[(1'h1):(1'h1)];
      if ($signed($signed($unsigned($unsigned($signed(wire141))))))
        begin
          reg152 <= $signed($unsigned($signed({wire141[(5'h14):(5'h10)]})));
          reg153 <= wire143;
          reg154 <= reg147[(4'hd):(4'hd)];
          reg155 <= (~((^(^~(~^(8'hbd)))) <= $signed((wire142[(4'h9):(3'h6)] ?
              $unsigned(reg154) : (reg146 ? wire141 : wire150)))));
          reg156 <= ($signed(((reg154 > (wire141 ? reg153 : reg152)) ?
                  reg152 : (^~$unsigned(wire150)))) ?
              ({($signed(wire149) <= (wire150 ? wire143 : wire149)),
                  reg145} - ($unsigned(reg153) ?
                  (~&reg147[(4'hb):(3'h7)]) : ($unsigned(wire148) > (wire140 > (8'haf))))) : $unsigned($unsigned(($unsigned(wire144) + {wire142}))));
        end
      else
        begin
          reg152 <= ($signed(wire140) ?
              $signed((~&(wire144[(1'h0):(1'h0)] <<< $signed(reg145)))) : wire140[(3'h5):(1'h0)]);
          reg153 <= wire142[(1'h1):(1'h0)];
          if ((reg152[(1'h1):(1'h0)] ?
              $unsigned((($unsigned(reg145) ?
                  $unsigned(reg145) : $unsigned(reg152)) >> {(&wire144)})) : (8'ha3)))
            begin
              reg154 <= reg152[(4'hc):(4'h8)];
            end
          else
            begin
              reg154 <= ($signed((8'h9d)) ?
                  reg152 : ($unsigned(($unsigned(reg152) ?
                      $signed((8'ha7)) : wire141[(5'h15):(4'hf)])) <<< reg155));
              reg155 <= $unsigned(((($unsigned(wire143) < (~wire148)) ?
                      wire142[(3'h7):(2'h2)] : (8'ha2)) ?
                  reg152[(3'h4):(2'h2)] : $unsigned($signed($signed(wire150)))));
              reg156 <= wire140;
              reg157 <= wire141;
              reg158 <= $signed(($signed(reg156[(4'ha):(3'h7)]) >>> $unsigned((!reg146[(2'h3):(1'h1)]))));
            end
          reg159 <= ((reg155 ?
              wire140 : ((((8'ha8) * reg146) != {reg157, wire142}) ?
                  reg153 : wire149)) >> (wire144[(2'h2):(1'h0)] ?
              reg147[(4'hf):(3'h5)] : reg157));
        end
    end
  assign wire160 = (|{{(8'hb6), {(reg158 < reg147), (wire150 - reg156)}}});
  assign wire161 = $signed((~({(8'hbf), wire142} && (~&(reg153 * reg155)))));
  assign wire162 = wire150[(1'h1):(1'h1)];
  assign wire163 = {(wire143[(4'ha):(1'h0)] ?
                           reg156 : $signed({{reg155}, (wire160 | (8'ha9))}))};
  assign wire164 = (($unsigned($signed($signed((8'hb5)))) ?
                       wire144[(4'hd):(3'h4)] : (^~reg153)) + (wire143 + $signed((8'hbf))));
  assign wire165 = {{(reg151 + $unsigned({reg158, reg153}))},
                       ((reg156 ?
                               wire140[(2'h3):(2'h3)] : ((&reg153) > (|(8'ha6)))) ?
                           reg155 : {(~&(!wire140)), (8'ha8)})};
  assign wire166 = wire149[(3'h7):(3'h6)];
endmodule

module module108  (y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire112;
  input wire signed [(2'h3):(1'h0)] wire111;
  input wire [(4'hd):(1'h0)] wire110;
  input wire signed [(3'h6):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire122;
  wire signed [(2'h2):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire118;
  wire [(5'h13):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire113;
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 (1'h0)};
  assign wire113 = (~&({($unsigned(wire109) ?
                               $unsigned((8'hb4)) : (wire112 <= (7'h42))),
                           wire111[(1'h1):(1'h0)]} ?
                       ({(wire112 ? wire112 : wire109), $signed((8'hae))} ?
                           ($signed(wire109) ?
                               wire112[(1'h1):(1'h1)] : $signed(wire109)) : $signed((!wire111))) : {$unsigned($signed(wire110)),
                           wire110[(4'hc):(4'h8)]}));
  assign wire114 = $unsigned(wire112);
  assign wire115 = (8'hae);
  assign wire116 = $signed(((($signed(wire111) & $unsigned(wire109)) ?
                           $unsigned(wire110[(4'ha):(4'h8)]) : $unsigned($unsigned(wire113))) ?
                       (~wire112[(1'h0):(1'h0)]) : $unsigned(wire109)));
  assign wire117 = {$signed(($signed($unsigned(wire114)) ?
                           {(~wire116),
                               $signed(wire110)} : wire115[(2'h2):(1'h0)])),
                       (~^(&($signed(wire110) ?
                           $unsigned((8'hb1)) : (~|wire111))))};
  assign wire118 = wire115[(1'h1):(1'h0)];
  assign wire119 = wire109[(2'h2):(2'h2)];
  assign wire120 = (($unsigned($signed(wire118)) != ((+(wire115 << wire115)) >>> wire115[(2'h2):(2'h2)])) << (8'ha7));
  assign wire121 = $unsigned(((!wire115) + $signed(wire111[(2'h2):(1'h0)])));
  assign wire122 = ((((~^(+wire121)) * (|wire119)) && $unsigned({((8'hb8) && (8'hae))})) - (($signed($unsigned(wire110)) <<< wire113[(5'h10):(4'hc)]) ?
                       wire117 : (|$signed({wire113}))));
  assign wire123 = wire109;
endmodule

module module66
#(parameter param105 = {((((8'hbe) ? (&(8'haa)) : (^(8'hbb))) ? (((8'ha3) | (8'hb8)) ^ ((8'hac) ? (8'h9e) : (8'hbf))) : (((7'h42) ? (8'ha9) : (8'ha5)) ? (~^(8'hbf)) : {(8'hb8), (8'hb9)})) && (^(((8'hab) ? (8'haa) : (7'h43)) ? ((8'ha4) >> (8'hb2)) : {(7'h40), (8'hbb)})))})
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire71;
  input wire signed [(5'h14):(1'h0)] wire70;
  input wire [(5'h12):(1'h0)] wire69;
  input wire [(4'hb):(1'h0)] wire68;
  input wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(2'h3):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire101;
  wire [(4'h8):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire signed [(4'hc):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
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
                 reg104,
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
                 (1'h0)};
  assign wire72 = ((^~wire70[(5'h10):(4'h9)]) ?
                      ({$unsigned($signed((8'hba))),
                          wire67} + wire69[(3'h4):(1'h1)]) : $signed({((+wire70) > {wire71}),
                          $unsigned(wire70)}));
  assign wire73 = {$signed((~^((~&(8'had)) <<< (wire67 << (8'ha2))))),
                      ((wire68[(4'h8):(3'h7)] ?
                          (-{wire67}) : $signed(wire68[(2'h3):(1'h0)])) && (~&wire69[(2'h2):(2'h2)]))};
  assign wire74 = $signed(($signed((~wire72)) & ($signed((wire70 ?
                      (8'haa) : wire67)) ~^ wire72)));
  assign wire75 = $unsigned(wire71[(1'h0):(1'h0)]);
  assign wire76 = wire72;
  assign wire77 = (~^(-($signed($unsigned(wire67)) ?
                      $unsigned(wire74) : wire68[(3'h5):(1'h0)])));
  assign wire78 = $unsigned($signed((((wire77 ? wire71 : wire68) ?
                      (wire74 ?
                          wire73 : wire74) : (wire72 < wire70)) == ({wire76} ?
                      {(8'ha1), (8'hbb)} : $signed(wire74)))));
  assign wire79 = (wire70 ? $signed({$signed({(8'had), wire69})}) : wire73);
  assign wire80 = (((wire78 ?
                          ((-wire69) == wire72) : $unsigned((wire70 ?
                              wire69 : wire75))) ?
                      wire69[(4'hf):(4'hc)] : ({$unsigned(wire77),
                              (wire67 || (8'h9d))} ?
                          (8'ha2) : ((8'ha4) ?
                              (wire69 <<< wire67) : wire78))) + wire70);
  assign wire81 = $unsigned($unsigned(($signed((7'h40)) <= wire77)));
  assign wire82 = (wire69 ?
                      wire81[(2'h3):(2'h3)] : {(|((!(8'ha6)) ?
                              (wire70 && wire69) : $signed(wire75))),
                          wire68[(4'ha):(2'h2)]});
  assign wire83 = $signed(((~|wire72[(2'h3):(1'h1)]) ^ $signed((+$unsigned(wire67)))));
  always
    @(posedge clk) begin
      reg84 <= ((+(+$signed(wire81[(1'h0):(1'h0)]))) != wire75);
      reg85 <= {wire77[(1'h1):(1'h1)], wire71};
    end
  always
    @(posedge clk) begin
      reg86 <= ({wire80[(1'h0):(1'h0)]} ?
          (+wire68[(2'h3):(1'h1)]) : (reg84[(1'h1):(1'h0)] & $unsigned(wire77)));
      if (wire70)
        begin
          reg87 <= wire70[(5'h13):(2'h3)];
          reg88 <= $unsigned($unsigned((&reg87[(2'h2):(1'h0)])));
          reg89 <= $unsigned((+reg88));
          reg90 <= wire81[(2'h3):(1'h1)];
          reg91 <= {(~^($unsigned($unsigned(reg86)) ?
                  (reg89 ^~ reg86) : {reg84[(1'h1):(1'h0)], reg88})),
              (wire70 >>> {({(8'hb7), reg89} < reg88), (~&wire70)})};
        end
      else
        begin
          if ($signed(($signed((reg91 || (8'ha2))) ?
              (|reg89[(2'h3):(2'h3)]) : $signed(({wire79} ?
                  $signed(wire68) : (reg91 == reg84))))))
            begin
              reg87 <= ($signed((wire75[(3'h4):(2'h3)] ?
                  $signed((wire81 ?
                      wire74 : (7'h42))) : reg91[(4'hd):(4'hb)])) - (wire80[(4'hb):(4'hb)] ?
                  reg86[(3'h7):(3'h7)] : $signed(((^wire68) ?
                      wire82[(4'h8):(3'h5)] : (8'hb7)))));
              reg88 <= wire75;
              reg89 <= $signed(wire78);
              reg90 <= $signed($signed(reg85));
              reg91 <= wire76;
            end
          else
            begin
              reg87 <= $unsigned($signed((($signed((8'had)) & reg91) ^ wire67)));
              reg88 <= (wire70[(3'h7):(3'h6)] == ((7'h44) ?
                  (!{reg88[(2'h3):(2'h3)]}) : {(wire68 ?
                          $unsigned(reg89) : $signed(wire73)),
                      {(reg89 ? wire69 : (7'h42)), {wire78}}}));
              reg89 <= reg88[(4'he):(3'h5)];
              reg90 <= wire70[(5'h13):(4'h8)];
            end
          reg92 <= $unsigned($signed((!reg91)));
          reg93 <= $unsigned($unsigned($unsigned($signed($unsigned(reg92)))));
        end
      reg94 <= wire69[(3'h5):(3'h4)];
      reg95 <= ((($signed((reg94 ? wire76 : wire83)) ?
              (wire78[(3'h6):(3'h6)] | $signed(wire81)) : $signed(reg90[(1'h1):(1'h0)])) ?
          {(^~wire81)} : wire80) | $unsigned(((8'hba) ?
          wire73 : wire68[(3'h7):(3'h5)])));
      if (wire78)
        begin
          reg96 <= $signed(reg89[(4'ha):(4'ha)]);
          reg97 <= $unsigned(reg89);
        end
      else
        begin
          reg96 <= ($signed((8'hb7)) & (~|$unsigned(reg88[(4'hd):(3'h5)])));
          reg97 <= wire70;
        end
    end
  assign wire98 = $unsigned((((-wire67[(4'hb):(2'h2)]) | (&(wire78 | wire77))) ?
                      ($signed((reg93 ? reg97 : reg89)) ?
                          reg91[(3'h6):(1'h1)] : reg90[(3'h5):(2'h3)]) : (!(^(~|(8'ha3))))));
  assign wire99 = {reg87};
  assign wire100 = (reg84 ?
                       (~|wire77) : {(((reg88 ?
                               (8'hbb) : wire80) << (reg97 & reg89)) && wire78)});
  assign wire101 = $signed((8'h9c));
  assign wire102 = reg89;
  assign wire103 = $signed($unsigned({{$signed(reg94)}}));
  always
    @(posedge clk) begin
      reg104 <= reg97;
    end
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire31;
  input wire signed [(3'h4):(1'h0)] wire30;
  input wire [(5'h14):(1'h0)] wire29;
  input wire [(3'h5):(1'h0)] wire28;
  input wire signed [(4'h8):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire32;
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire32,
                 reg51,
                 reg50,
                 reg49,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire32 = wire29;
  always
    @(posedge clk) begin
      reg33 <= {{wire32[(1'h0):(1'h0)], $unsigned((8'hae))}};
      if (wire30[(3'h4):(1'h1)])
        begin
          reg34 <= wire27[(3'h7):(3'h5)];
          reg35 <= wire32;
          if ($unsigned($signed($unsigned(wire32[(3'h6):(2'h2)]))))
            begin
              reg36 <= (~(|reg35));
              reg37 <= wire31;
            end
          else
            begin
              reg36 <= $unsigned(wire27[(3'h7):(3'h4)]);
              reg37 <= $unsigned($signed(reg36[(4'ha):(3'h4)]));
            end
          reg38 <= reg33;
        end
      else
        begin
          reg34 <= $unsigned((wire30[(2'h3):(1'h0)] - reg37[(3'h5):(3'h5)]));
        end
      reg39 <= (~(^~$unsigned($unsigned((wire32 >> (8'ha9))))));
      reg40 <= ((((reg34[(2'h2):(1'h1)] ?
              ((8'hb7) != reg36) : $signed(reg39)) ^ {(wire29 ? wire27 : reg36),
              (&wire27)}) ~^ ($unsigned((wire27 ^ (8'hba))) ?
              $signed(wire31[(4'h8):(2'h2)]) : reg37)) ?
          $signed({(8'hb6), wire29}) : (reg36 <= (+($unsigned(wire27) > (reg33 ?
              reg36 : wire32)))));
      reg41 <= $unsigned(wire31);
    end
  assign wire42 = (reg39[(2'h3):(1'h0)] || (($unsigned((reg35 ^~ reg41)) <<< (~&((8'ha3) ?
                          wire27 : reg34))) ?
                      (+((-wire31) + wire30[(1'h1):(1'h0)])) : ($unsigned((!reg33)) || (reg34[(3'h5):(2'h3)] ?
                          $signed(wire31) : $unsigned(wire28)))));
  assign wire43 = reg41[(4'ha):(3'h4)];
  assign wire44 = reg38;
  assign wire45 = ($unsigned(reg41[(3'h6):(3'h6)]) >>> (reg41 > reg38[(4'h8):(3'h7)]));
  assign wire46 = {$unsigned(((!wire32[(4'he):(1'h1)]) ^~ (reg40[(1'h0):(1'h0)] || (reg41 <<< reg37))))};
  assign wire47 = {wire29};
  assign wire48 = wire43[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg49 <= (~&(8'hb3));
      reg50 <= wire31;
      reg51 <= wire48[(3'h4):(3'h4)];
    end
  assign wire52 = $signed((^reg36));
  assign wire53 = reg37[(3'h6):(3'h4)];
  assign wire54 = (&$unsigned($signed($unsigned((wire31 ? reg36 : wire45)))));
  assign wire55 = wire42[(3'h5):(1'h1)];
  assign wire56 = (($unsigned(($signed(reg40) <<< ((8'ha0) >>> reg51))) ?
                          $unsigned(reg38) : $signed((~&(wire43 ^~ reg49)))) ?
                      ($signed(wire52[(4'h8):(3'h7)]) >= $unsigned($signed({reg36}))) : $signed(reg33));
  assign wire57 = (wire27[(2'h2):(1'h1)] ?
                      ((reg38[(2'h3):(1'h1)] ?
                              (reg36[(3'h7):(3'h6)] + (wire31 ?
                                  (8'hbc) : (8'h9e))) : $unsigned((8'hbd))) ?
                          reg33[(2'h2):(1'h0)] : reg34[(4'h8):(3'h7)]) : (&reg50[(1'h1):(1'h0)]));
  assign wire58 = (reg39[(3'h5):(3'h5)] ^~ wire29);
  assign wire59 = (~(-$unsigned((&$unsigned(wire30)))));
  assign wire60 = (^wire48[(3'h4):(3'h4)]);
  assign wire61 = {wire45,
                      (reg38 ?
                          ((reg51 ?
                              (!reg34) : $unsigned(wire60)) && (~&$unsigned(reg39))) : ((-reg33) << ((8'hb2) >>> (wire45 ?
                              reg49 : reg51))))};
endmodule
