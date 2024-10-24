module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h338):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire214;
  wire [(5'h14):(1'h0)] wire213;
  wire [(5'h15):(1'h0)] wire200;
  wire signed [(4'h8):(1'h0)] wire89;
  wire signed [(5'h15):(1'h0)] wire88;
  wire [(3'h5):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire202;
  wire signed [(5'h14):(1'h0)] wire203;
  wire signed [(4'ha):(1'h0)] wire210;
  wire [(5'h10):(1'h0)] wire211;
  wire signed [(3'h7):(1'h0)] wire216;
  reg [(5'h15):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg208 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg207 = (1'h0);
  reg [(4'hd):(1'h0)] reg206 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg205 = (1'h0);
  reg [(4'ha):(1'h0)] reg204 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg4 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  assign y = {wire214,
                 wire213,
                 wire200,
                 wire89,
                 wire88,
                 wire87,
                 wire72,
                 wire67,
                 wire66,
                 wire64,
                 wire25,
                 wire24,
                 wire23,
                 wire202,
                 wire203,
                 wire210,
                 wire211,
                 wire216,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg4,
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
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg26,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned($unsigned((~&wire3)));
      if ((($unsigned(wire2) < (reg4 ?
              $signed(reg4[(1'h0):(1'h0)]) : ($signed(wire2) ?
                  wire0 : $signed((8'ha5))))) ?
          {{wire1[(3'h7):(3'h5)],
                  wire3[(4'h8):(3'h4)]}} : wire2[(3'h4):(3'h4)]))
        begin
          reg5 <= $signed(reg4);
          reg6 <= wire0[(4'h9):(3'h6)];
          reg7 <= $unsigned($unsigned(reg6));
        end
      else
        begin
          if ($signed(({((wire3 >>> wire0) ? wire1 : reg7[(4'h9):(1'h1)])} ?
              (reg6 ? (^{(8'hac)}) : {reg7, {(8'h9c), wire2}}) : reg7)))
            begin
              reg5 <= $unsigned((($signed({reg7}) ^ $unsigned(wire0)) ?
                  ((wire3 >>> reg4) ?
                      ($signed(reg6) ?
                          $unsigned(reg4) : reg5[(3'h4):(2'h2)]) : reg6[(4'hc):(1'h0)]) : ($signed($unsigned(wire0)) >= $signed((~(8'hba))))));
              reg6 <= wire0[(3'h5):(1'h0)];
              reg7 <= $signed($unsigned((8'hbd)));
            end
          else
            begin
              reg5 <= {$signed($signed(((reg5 ? (8'hba) : reg7) ^ {wire3,
                      reg5})))};
              reg6 <= $signed(reg5[(4'hc):(3'h7)]);
            end
          reg8 <= (+{reg5[(4'hc):(4'hc)], reg6[(2'h3):(2'h3)]});
          reg9 <= reg4;
          if ($unsigned((&(~|$signed((reg4 & reg8))))))
            begin
              reg10 <= (({reg9[(3'h5):(1'h1)],
                      (((8'h9f) == reg8) ?
                          (wire0 ~^ reg5) : $unsigned(reg5))} - (~(~&(reg7 <= reg9)))) ?
                  ({((~|wire3) ^~ (&reg7)), reg6} ?
                      (~|$unsigned((8'ha5))) : wire3) : {wire3[(2'h2):(1'h0)]});
              reg11 <= ((+wire0) ? reg8 : reg10[(4'hc):(1'h1)]);
              reg12 <= ($unsigned($unsigned($unsigned(((8'hbb) > wire3)))) || $unsigned({{$unsigned((7'h42))},
                  {(~|wire3)}}));
              reg13 <= $signed(($signed(((8'hb6) & (~^reg7))) ?
                  {{reg9}, (reg9 || $unsigned(reg12))} : (reg12[(3'h4):(2'h2)] ?
                      ($unsigned(reg12) ?
                          (^~reg9) : (wire1 ?
                              reg10 : wire0)) : $unsigned($unsigned((8'had))))));
              reg14 <= (reg8 >>> $signed(reg7[(3'h6):(3'h5)]));
            end
          else
            begin
              reg10 <= $signed(reg11[(4'h8):(2'h3)]);
              reg11 <= $signed((wire0 * {(reg9 != reg12[(2'h3):(1'h0)])}));
              reg12 <= ({reg6[(3'h7):(3'h7)]} ?
                  (($signed((~wire0)) << ((~wire3) ?
                          (8'hb6) : $unsigned(reg10))) ?
                      (reg12[(3'h7):(1'h1)] == $unsigned($signed(reg8))) : (reg7[(1'h0):(1'h0)] ?
                          reg9[(4'h9):(3'h4)] : wire2[(1'h0):(1'h0)])) : (&$signed(reg6[(4'h9):(4'h8)])));
            end
          if (reg10)
            begin
              reg15 <= reg5[(3'h4):(1'h0)];
              reg16 <= (-$unsigned($unsigned($signed($signed((8'hbf))))));
              reg17 <= ($unsigned(((wire3 * reg12) ?
                  reg5 : $unsigned({wire3,
                      wire0}))) - $signed((+{reg12[(3'h7):(2'h2)]})));
              reg18 <= wire1[(3'h7):(3'h5)];
              reg19 <= reg17;
            end
          else
            begin
              reg15 <= {$signed((reg7[(1'h1):(1'h1)] >= ((~|(8'h9c)) ?
                      (reg18 ~^ reg14) : (reg5 <= wire3)))),
                  $unsigned(({$signed(reg6)} & wire3[(4'h8):(3'h7)]))};
              reg16 <= reg12;
              reg17 <= (wire2[(3'h6):(3'h5)] ?
                  ({$signed((reg6 ? reg15 : (8'ha6))),
                      {(reg11 >>> reg5),
                          $unsigned(wire0)}} <<< reg9) : {((!(|reg4)) ?
                          (wire1[(1'h1):(1'h0)] + reg12[(4'hc):(3'h5)]) : $signed(reg13[(1'h1):(1'h1)]))});
            end
        end
      reg20 <= {(^~(&(~$unsigned(reg17))))};
      reg21 <= {($signed((~^reg17[(3'h6):(1'h0)])) ?
              wire2[(1'h0):(1'h0)] : reg16[(1'h1):(1'h0)])};
      reg22 <= ($signed($unsigned(wire1[(1'h1):(1'h0)])) ?
          reg8[(3'h4):(2'h3)] : reg18);
    end
  assign wire23 = reg12[(4'ha):(3'h7)];
  assign wire24 = (wire2[(3'h4):(2'h3)] ?
                      reg8 : (-($unsigned(wire0) ?
                          (~|reg9[(4'ha):(1'h1)]) : reg20[(3'h5):(2'h3)])));
  assign wire25 = ((((!reg15[(3'h4):(2'h2)]) ?
                      $unsigned((wire24 ?
                          reg10 : (7'h40))) : $signed(reg17)) ^ ($unsigned((wire2 ?
                          wire23 : wire3)) ?
                      {reg12,
                          reg11} : ($unsigned(wire0) & (reg11 <<< reg13)))) >= $unsigned($signed(((wire0 ?
                      reg14 : reg15) ~^ reg6[(4'ha):(4'h8)]))));
  always
    @(posedge clk) begin
      reg26 <= reg9;
    end
  module27 #() modinst65 (wire64, clk, wire23, reg21, wire0, reg17);
  assign wire66 = ({reg14[(5'h12):(5'h11)],
                      (($unsigned(wire25) ?
                          (reg17 <<< wire25) : (~&reg6)) >= {wire64[(1'h0):(1'h0)]})} & $unsigned(reg13[(1'h0):(1'h0)]));
  assign wire67 = $signed(((^(wire25[(2'h3):(2'h3)] == (reg22 ?
                          wire24 : reg19))) ?
                      (~^($unsigned(wire2) >> reg9)) : $unsigned($signed({wire64,
                          reg5}))));
  always
    @(posedge clk) begin
      reg68 <= ($signed(reg14) ?
          $unsigned((reg15 >= reg21[(3'h7):(1'h0)])) : {((((8'ha3) ?
                      wire67 : reg11) != (reg20 ~^ reg13)) ?
                  (&$signed(wire25)) : (|(^wire66)))});
      reg69 <= (~(reg13[(1'h1):(1'h1)] != (8'haf)));
      reg70 <= ($signed((~{(reg16 ? (8'ha9) : (8'had)),
          $unsigned((8'hbe))})) << (!(^(~|$unsigned(reg8)))));
      reg71 <= wire0[(2'h3):(2'h3)];
    end
  assign wire72 = ((wire25 ?
                      {wire24,
                          {$unsigned((7'h43)),
                              ((8'hab) ^ reg16)}} : reg17) >>> reg9[(4'hb):(1'h1)]);
  always
    @(posedge clk) begin
      reg73 <= reg5[(3'h6):(3'h4)];
      if ({{reg20, reg26}})
        begin
          reg74 <= (($unsigned(wire24[(4'h8):(3'h5)]) ?
              $unsigned((^$signed(reg73))) : reg18[(3'h7):(3'h7)]) >>> (reg8 != $signed($unsigned((7'h41)))));
          reg75 <= {reg10, reg12};
          reg76 <= (reg74 ?
              (($unsigned(reg71) ?
                      (reg73[(4'h8):(1'h1)] + {reg4,
                          wire0}) : $unsigned($unsigned(reg4))) ?
                  wire64 : reg16) : reg16[(4'hf):(3'h5)]);
          reg77 <= (reg17[(4'h8):(3'h7)] - reg22[(1'h0):(1'h0)]);
          reg78 <= ($unsigned((^~(wire2 ?
              (8'had) : ((8'h9f) ?
                  (8'hb6) : reg26)))) ^~ ({(wire1[(3'h6):(3'h6)] ~^ $unsigned(reg18)),
                  {reg69[(4'ha):(3'h5)], ((8'hbb) >>> wire1)}} ?
              reg17 : {(8'haf), (&reg13[(2'h2):(1'h1)])}));
        end
      else
        begin
          reg74 <= $signed($unsigned($signed((reg6 * (reg75 || (8'ha8))))));
          if (({(!{reg74[(4'hd):(2'h2)], $unsigned(wire67)}),
                  (reg8 >> reg18[(1'h1):(1'h0)])} ?
              reg73[(2'h3):(1'h0)] : $signed((-reg16))))
            begin
              reg75 <= (8'hb9);
              reg76 <= $signed(((reg74[(4'ha):(3'h5)] ?
                  ($unsigned(reg5) < reg78[(3'h5):(1'h0)]) : $unsigned((reg16 >>> reg8))) + $unsigned($signed(wire23[(3'h7):(3'h4)]))));
              reg77 <= ((8'hbf) >>> (|(reg75 ?
                  reg4[(2'h2):(1'h1)] : $unsigned((~reg8)))));
            end
          else
            begin
              reg75 <= (+reg9[(2'h2):(1'h1)]);
              reg76 <= $signed(reg21);
              reg77 <= reg69[(2'h3):(2'h3)];
              reg78 <= {reg5, (&reg22)};
            end
          reg79 <= (7'h41);
          if ((reg7[(1'h1):(1'h1)] != reg71))
            begin
              reg80 <= (~|($unsigned(reg78) ?
                  ($unsigned($signed(reg70)) >> wire72) : (((~^(8'ha9)) ?
                      reg13 : $unsigned(wire66)) >>> ((8'hb3) < $signed(reg12)))));
              reg81 <= ($unsigned(reg6[(4'h8):(3'h4)]) ?
                  (({(reg26 ~^ reg12)} ? reg6 : (-$signed(reg78))) ?
                      (!$unsigned((8'ha6))) : (&{((7'h41) ?
                              reg21 : reg19)})) : ($unsigned({wire1, reg15}) ?
                      $signed($unsigned((reg80 ?
                          reg4 : reg10))) : (((wire3 <<< (7'h44)) ?
                              $unsigned(reg13) : (^wire24)) ?
                          (wire66 ?
                              $unsigned(reg76) : wire0[(3'h6):(2'h2)]) : $unsigned($unsigned((8'had))))));
              reg82 <= ((^$signed(wire67[(4'h9):(3'h7)])) - wire23[(3'h4):(2'h3)]);
              reg83 <= reg21;
            end
          else
            begin
              reg80 <= $signed((~&(((wire1 ~^ reg8) ?
                  reg15[(3'h7):(2'h2)] : {reg75, reg73}) >>> (~{reg68,
                  (8'ha0)}))));
              reg81 <= ((|(~^wire67[(2'h2):(1'h0)])) ?
                  {$unsigned(reg76[(1'h0):(1'h0)]),
                      $signed((8'haf))} : {$unsigned(((^~wire24) >> reg75)),
                      $unsigned((|(wire1 >>> reg5)))});
            end
          reg84 <= (reg15[(3'h5):(3'h4)] ?
              (reg70[(2'h2):(1'h1)] == wire23) : (($signed($unsigned(reg81)) ?
                      $signed((wire72 ? reg21 : reg81)) : reg80) ?
                  ($unsigned((reg5 ? wire2 : (8'hab))) ?
                      $unsigned((~&(8'hbc))) : ((reg77 ?
                          reg18 : reg74) == (reg82 ?
                          reg20 : reg79))) : $signed(($unsigned(reg74) == (~wire23)))));
        end
      reg85 <= $unsigned($signed($unsigned((&reg13[(1'h0):(1'h0)]))));
      reg86 <= (~&($unsigned((((8'h9c) ?
          reg71 : reg74) != $unsigned(reg71))) ^ (({reg11, reg7} ?
              {reg13} : (reg79 | reg10)) ?
          $unsigned($unsigned(reg14)) : $unsigned((wire24 ? reg9 : reg10)))));
    end
  assign wire87 = $signed({$unsigned((^(wire64 ? reg71 : reg80)))});
  assign wire88 = $unsigned({((wire66[(1'h0):(1'h0)] ?
                              (wire87 ? reg77 : wire0) : $signed((8'hb9))) ?
                          wire2[(2'h3):(2'h2)] : $signed(reg80[(2'h3):(1'h0)])),
                      $unsigned(($signed(reg10) ?
                          $unsigned(reg5) : (&reg12)))});
  assign wire89 = (~&(reg11[(3'h4):(1'h0)] - reg84));
  module90 #() modinst201 (.clk(clk), .wire92(reg10), .wire93(reg16), .wire94(wire72), .y(wire200), .wire91(reg85));
  assign wire202 = $signed($unsigned($unsigned($signed($unsigned(reg15)))));
  assign wire203 = (!(8'hb6));
  always
    @(posedge clk) begin
      reg204 <= {(((~^wire0) >> (reg6[(3'h4):(1'h1)] <= $unsigned((8'ha8)))) * reg11)};
      if ($signed({$signed(reg204[(4'ha):(4'h9)])}))
        begin
          if ((reg86 && wire24[(4'hf):(4'hc)]))
            begin
              reg205 <= $unsigned((+$signed((+(reg9 ? (8'h9e) : reg86)))));
              reg206 <= reg73[(4'h8):(3'h7)];
              reg207 <= $unsigned($signed(((~^reg86) ?
                  ((-reg17) ?
                      {reg78} : reg78[(1'h1):(1'h0)]) : $unsigned({(7'h40)}))));
              reg208 <= (~&$signed($unsigned(wire200)));
            end
          else
            begin
              reg205 <= reg17;
              reg206 <= reg16[(4'hf):(4'hd)];
              reg207 <= wire89;
            end
          reg209 <= (|$signed((reg74 == wire3)));
        end
      else
        begin
          reg205 <= reg4;
        end
    end
  assign wire210 = (~^({reg85[(3'h6):(1'h0)], reg83} - ((!(|reg85)) ?
                       wire1 : reg22[(3'h4):(3'h4)])));
  module90 #() modinst212 (.wire91(wire202), .wire92(reg20), .clk(clk), .wire94(wire203), .y(wire211), .wire93(wire88));
  assign wire213 = (({reg81, $signed((!wire202))} ?
                       {wire66[(1'h1):(1'h1)]} : (&(-$signed(reg86)))) && reg207[(4'h8):(2'h3)]);
  module164 #() modinst215 (wire214, clk, wire25, reg209, reg15, reg75, reg86);
  module27 #() modinst217 (.clk(clk), .wire29(wire210), .y(wire216), .wire31(reg18), .wire28(reg77), .wire30(reg13));
endmodule

module module90  (y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire94;
  input wire signed [(5'h15):(1'h0)] wire93;
  input wire [(5'h14):(1'h0)] wire92;
  input wire signed [(5'h11):(1'h0)] wire91;
  wire signed [(4'hb):(1'h0)] wire199;
  wire signed [(4'he):(1'h0)] wire196;
  wire [(3'h5):(1'h0)] wire194;
  wire [(4'he):(1'h0)] wire193;
  wire [(3'h5):(1'h0)] wire191;
  wire [(3'h5):(1'h0)] wire156;
  wire [(3'h4):(1'h0)] wire155;
  wire [(2'h3):(1'h0)] wire154;
  wire [(4'hb):(1'h0)] wire133;
  wire [(5'h10):(1'h0)] wire96;
  wire [(5'h12):(1'h0)] wire95;
  wire signed [(5'h12):(1'h0)] wire152;
  reg signed [(5'h12):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg137 = (1'h0);
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(5'h14):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg159 = (1'h0);
  reg [(5'h14):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg162 = (1'h0);
  reg [(3'h4):(1'h0)] reg163 = (1'h0);
  assign y = {wire199,
                 wire196,
                 wire194,
                 wire193,
                 wire191,
                 wire156,
                 wire155,
                 wire154,
                 wire133,
                 wire96,
                 wire95,
                 wire152,
                 reg198,
                 reg197,
                 reg195,
                 reg137,
                 reg136,
                 reg135,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 (1'h0)};
  assign wire95 = ($unsigned($signed({$unsigned((8'hae)), $unsigned(wire93)})) ?
                      $unsigned(wire94) : $signed($signed(({(8'ha9)} ~^ {wire91,
                          wire94}))));
  assign wire96 = ((wire92 << wire95) <= $signed(wire95));
  module97 #() modinst134 (wire133, clk, wire96, wire95, wire91, wire92, wire94);
  always
    @(posedge clk) begin
      reg135 <= $signed(wire91[(3'h4):(1'h0)]);
      reg136 <= $signed((wire94 ?
          (wire91 > (^~((8'h9f) >>> wire92))) : wire91[(3'h5):(1'h1)]));
      reg137 <= ((wire93 ?
          (($unsigned(wire94) ?
              (!(7'h44)) : (!wire93)) < wire94[(2'h3):(2'h2)]) : (!(^~wire94[(2'h3):(1'h0)]))) & $unsigned($unsigned(reg136[(3'h7):(2'h3)])));
    end
  module138 #() modinst153 (wire152, clk, wire94, wire91, reg137, wire133);
  assign wire154 = wire93[(4'hb):(4'ha)];
  assign wire155 = ((7'h42) ?
                       ((($signed(wire93) + $signed((8'hba))) ?
                               wire95 : wire95) ?
                           {(wire92 ?
                                   (wire91 ?
                                       wire92 : wire133) : $unsigned(wire95))} : $signed(wire93)) : wire152);
  assign wire156 = $signed((wire92 <<< reg137[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      if (wire96)
        begin
          reg157 <= wire95[(5'h12):(5'h12)];
          reg158 <= (~$signed((wire155 || $unsigned($signed(reg135)))));
          reg159 <= (((wire154[(2'h3):(1'h0)] >= {$signed(wire152)}) ^ (($signed(wire92) >= $unsigned(wire154)) ~^ $signed({wire133}))) ?
              (wire91[(1'h0):(1'h0)] ?
                  wire94 : ($unsigned((~&wire91)) ?
                      $signed(wire133[(4'ha):(3'h6)]) : (wire93 ?
                          {wire93} : (8'hbe)))) : $unsigned(reg158[(4'hd):(3'h6)]));
        end
      else
        begin
          if (($unsigned((-$unsigned({reg158}))) + $signed($unsigned($unsigned({reg158})))))
            begin
              reg157 <= ((8'ha5) + reg136);
              reg158 <= ($unsigned((+({(8'hbf),
                  wire96} <= (8'hb1)))) + (((~&wire95) ^~ reg159) != $signed(wire154[(1'h0):(1'h0)])));
              reg159 <= $unsigned(wire95[(4'h8):(4'h8)]);
              reg160 <= $signed(reg136[(3'h7):(2'h3)]);
              reg161 <= ($unsigned($signed($unsigned(wire93))) < wire152);
            end
          else
            begin
              reg157 <= $signed((-(-$signed(wire133))));
              reg158 <= $unsigned(($unsigned((~|wire152)) << (($unsigned(reg160) | (reg136 < wire156)) ?
                  $unsigned($signed(reg136)) : ($unsigned(reg135) ~^ $signed(wire91)))));
              reg159 <= wire95;
              reg160 <= (~^($signed({$unsigned(wire95),
                  (wire94 ? (8'haf) : reg158)}) && reg137));
            end
          reg162 <= reg160[(3'h6):(3'h6)];
          reg163 <= (&$signed((reg136[(3'h4):(2'h2)] ?
              $signed({wire152, reg136}) : (~&$signed(wire155)))));
        end
    end
  module164 #() modinst192 (.clk(clk), .wire168(wire93), .wire169(wire96), .wire167(wire91), .wire166(wire152), .y(wire191), .wire165(reg136));
  assign wire193 = (~&{{$unsigned($unsigned(reg157))},
                       ((7'h43) > $unsigned((reg136 ? (8'had) : reg162)))});
  assign wire194 = $signed({($signed($signed(reg159)) > (~|(+wire91)))});
  always
    @(posedge clk) begin
      reg195 <= ($unsigned((wire133[(3'h4):(1'h0)] << wire194)) + ((8'ha5) ?
          $unsigned((^~(reg136 ? wire93 : (7'h40)))) : (((^~wire95) ^~ (wire91 ?
                  wire94 : reg136)) ?
              $signed((wire133 ?
                  wire92 : reg160)) : $signed(reg162[(3'h6):(3'h4)]))));
    end
  assign wire196 = (~&(wire95[(3'h7):(3'h4)] ?
                       reg157 : ($unsigned((wire193 - reg161)) && ($unsigned(reg158) >> reg159))));
  always
    @(posedge clk) begin
      reg197 <= {{reg160[(4'hc):(4'hc)]}};
      reg198 <= $signed($signed(({wire152[(1'h1):(1'h1)]} ?
          $unsigned($unsigned(reg160)) : wire155)));
    end
  assign wire199 = wire152[(4'hf):(3'h4)];
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire31;
  input wire signed [(5'h10):(1'h0)] wire30;
  input wire [(4'h9):(1'h0)] wire29;
  input wire [(5'h11):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire34,
                 wire33,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= (8'h9f);
    end
  assign wire33 = $signed($signed($unsigned((reg32 - (wire28 & reg32)))));
  assign wire34 = $signed({wire31[(3'h5):(1'h0)]});
  always
    @(posedge clk) begin
      reg35 <= ((&$unsigned(wire31[(3'h5):(1'h1)])) ?
          $signed({(-wire33)}) : wire33);
      reg36 <= (wire31[(2'h2):(1'h0)] - $signed(((~^((8'hb5) || (8'ha7))) == (!(wire34 - wire33)))));
      if (reg35[(2'h3):(1'h1)])
        begin
          reg37 <= ((8'had) && reg35);
        end
      else
        begin
          if ($unsigned($unsigned((|$unsigned((|reg37))))))
            begin
              reg37 <= wire33;
              reg38 <= $unsigned(($unsigned((^~wire34[(3'h4):(2'h2)])) ?
                  ((+reg36[(2'h3):(1'h1)]) >= $unsigned(wire28)) : {($unsigned((8'ha0)) < $unsigned(wire30))}));
              reg39 <= wire30[(2'h3):(1'h0)];
              reg40 <= ($unsigned(((((8'hac) ? wire34 : wire33) ?
                          ((8'hbf) ? (7'h43) : reg35) : $signed(reg35)) ?
                      $unsigned({wire29, reg32}) : wire28[(5'h10):(4'he)])) ?
                  (wire30 || reg37[(1'h1):(1'h0)]) : (+reg36[(3'h4):(1'h0)]));
              reg41 <= $signed((($unsigned((8'hba)) && wire33) <= $signed((8'h9f))));
            end
          else
            begin
              reg37 <= (+(^~($signed((reg41 ?
                  (8'hb4) : wire30)) != $unsigned($signed(reg36)))));
              reg38 <= (^~$signed(((^wire28[(3'h5):(2'h2)]) && ($signed(wire34) != $unsigned(wire29)))));
              reg39 <= (reg40 - ($unsigned(((reg36 ?
                      reg37 : wire31) | (~|(8'hbc)))) ?
                  $unsigned(reg38) : $signed((!$unsigned(wire30)))));
            end
          reg42 <= reg37[(1'h0):(1'h0)];
        end
    end
  assign wire43 = ({$unsigned(wire30),
                      $unsigned((^~(8'ha8)))} * ((($unsigned(wire28) ?
                      reg32 : (reg32 ?
                          wire34 : reg40)) << $signed(wire33)) || $signed(((wire34 ?
                          reg40 : reg36) ?
                      (reg42 ^ reg35) : {wire28, reg32}))));
  assign wire44 = {(|(~|$signed((~&wire43)))), wire34[(4'ha):(3'h7)]};
  assign wire45 = ((8'hb5) ?
                      $signed((~$signed(reg38[(3'h7):(3'h6)]))) : $unsigned((reg38[(4'hb):(4'hb)] >>> (wire31[(2'h2):(1'h1)] ?
                          {reg35, reg37} : (reg35 & reg39)))));
  assign wire46 = (~&$unsigned((~^{(reg35 ? wire29 : reg36), reg32})));
  assign wire47 = $signed((-(~|(reg35 ?
                      wire33[(3'h4):(1'h0)] : $unsigned(reg41)))));
  assign wire48 = reg42;
  assign wire49 = {(((reg40 >> $unsigned((8'hb6))) <<< (wire30 ?
                          $signed(wire44) : (~^reg32))) > reg42[(1'h0):(1'h0)]),
                      (-((!$unsigned(wire45)) ?
                          wire45 : (wire45 < reg37[(3'h4):(3'h4)])))};
  assign wire50 = {wire31};
  assign wire51 = {(8'h9e)};
  assign wire52 = ((~(8'hbe)) ?
                      ($unsigned($unsigned(reg40)) <<< $unsigned($signed(wire43[(4'hc):(4'hb)]))) : $unsigned($signed(wire45)));
  always
    @(posedge clk) begin
      if ((~(!(~&((reg35 ? wire34 : wire31) * $unsigned((8'hab)))))))
        begin
          reg53 <= $unsigned({reg32[(4'h9):(2'h3)]});
          if ((($unsigned($unsigned((wire28 << (8'ha0)))) ?
              (^reg32[(4'h8):(2'h3)]) : $unsigned(((~^(8'h9d)) > wire45))) >= {($unsigned($unsigned((8'hbe))) * {wire52[(2'h2):(1'h1)],
                  (wire43 ? reg32 : (8'hbb))})}))
            begin
              reg54 <= $unsigned($unsigned({reg37[(2'h3):(1'h0)]}));
            end
          else
            begin
              reg54 <= (7'h44);
              reg55 <= (8'hb3);
            end
          reg56 <= ((+(($signed(wire49) >= ((8'ha5) ? reg53 : (8'hb3))) ?
              wire44 : reg54[(1'h1):(1'h1)])) << (wire52 ?
              ($unsigned(wire29[(2'h2):(1'h1)]) ?
                  reg41[(2'h3):(2'h3)] : ((+wire44) ?
                      (wire43 | wire34) : (wire49 ?
                          reg54 : wire52))) : ((-$signed(wire29)) ?
                  wire43[(3'h4):(2'h3)] : $signed(wire46[(2'h3):(1'h0)]))));
        end
      else
        begin
          if ($signed(reg36[(4'ha):(4'h9)]))
            begin
              reg53 <= reg53;
            end
          else
            begin
              reg53 <= reg38;
            end
          if (($unsigned($unsigned((wire34[(3'h6):(2'h3)] && ((8'ha1) ?
              (8'ha5) : (8'ha1))))) != $unsigned(wire45[(5'h13):(2'h3)])))
            begin
              reg54 <= $signed($signed(wire48));
            end
          else
            begin
              reg54 <= $unsigned({{{{reg37}}}});
              reg55 <= reg41;
              reg56 <= $unsigned(({wire34} ?
                  ({((8'hac) ? reg42 : reg36), (wire34 ? reg36 : reg42)} ?
                      (reg41[(1'h1):(1'h1)] || $signed(wire28)) : reg32) : (&(|reg56[(4'ha):(4'h8)]))));
              reg57 <= wire50;
            end
        end
      reg58 <= $signed($unsigned(reg56[(3'h7):(2'h3)]));
      reg59 <= reg53[(4'h8):(3'h6)];
      reg60 <= (wire30 ?
          {{reg58},
              (^~wire33[(4'hc):(3'h7)])} : $unsigned($unsigned($unsigned(wire33))));
      reg61 <= wire28;
    end
  assign wire62 = reg38[(4'hb):(1'h0)];
  assign wire63 = (!$signed($signed(({reg60} ?
                      $signed(reg41) : ((8'hbc) | wire51)))));
endmodule

module module164
#(parameter param190 = ((((8'h9f) && (|((8'ha4) ? (8'ha8) : (8'hba)))) == (~(~^(!(7'h41))))) + ({((|(8'hbf)) << ((8'ha2) * (8'ha9))), (^~((8'hb4) ? (8'hb4) : (8'hbd)))} ^~ ((-(^(8'hb7))) ? (((8'haf) ? (7'h40) : (8'hba)) << {(8'ha3)}) : (&((8'hb7) ? (8'hbd) : (8'ha8)))))))
(y, clk, wire169, wire168, wire167, wire166, wire165);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire169;
  input wire signed [(5'h15):(1'h0)] wire168;
  input wire [(5'h10):(1'h0)] wire167;
  input wire signed [(5'h12):(1'h0)] wire166;
  input wire signed [(5'h14):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire189;
  wire signed [(4'hf):(1'h0)] wire188;
  wire signed [(5'h10):(1'h0)] wire187;
  wire [(3'h6):(1'h0)] wire186;
  wire [(5'h14):(1'h0)] wire185;
  wire signed [(3'h4):(1'h0)] wire184;
  wire signed [(3'h5):(1'h0)] wire183;
  wire [(5'h15):(1'h0)] wire182;
  wire signed [(5'h15):(1'h0)] wire181;
  wire [(3'h4):(1'h0)] wire180;
  wire signed [(3'h5):(1'h0)] wire179;
  wire signed [(5'h15):(1'h0)] wire178;
  wire signed [(3'h5):(1'h0)] wire177;
  wire signed [(4'h9):(1'h0)] wire176;
  wire signed [(4'hf):(1'h0)] wire175;
  wire signed [(5'h10):(1'h0)] wire174;
  wire [(4'h8):(1'h0)] wire173;
  wire signed [(5'h10):(1'h0)] wire172;
  wire signed [(5'h12):(1'h0)] wire171;
  wire signed [(4'hc):(1'h0)] wire170;
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 (1'h0)};
  assign wire170 = ((($signed($unsigned(wire166)) ?
                           wire166 : ((~wire167) ?
                               $unsigned(wire165) : wire167)) > {(8'hbc),
                           ((wire168 ^ wire165) >> (wire167 ?
                               (7'h42) : wire169))}) ?
                       (wire167 * wire167[(2'h3):(1'h0)]) : wire169[(1'h1):(1'h0)]);
  assign wire171 = $signed(wire166);
  assign wire172 = {$signed($signed($signed({wire167, wire170}))),
                       $unsigned(wire169[(4'hc):(1'h1)])};
  assign wire173 = ((~&wire172[(4'hb):(2'h2)]) ? wire171 : wire172);
  assign wire174 = wire170;
  assign wire175 = (wire172 * (wire174 != wire167));
  assign wire176 = wire172[(3'h7):(2'h2)];
  assign wire177 = (((($unsigned(wire173) ?
                               $signed(wire174) : (wire175 ^ (7'h42))) ?
                           $signed((^wire176)) : wire173[(4'h8):(3'h7)]) << ({wire172[(4'hb):(1'h1)],
                           (wire167 && wire166)} >= wire169)) ?
                       $unsigned(wire165[(5'h13):(2'h2)]) : ((($unsigned(wire176) ^~ (-wire176)) ~^ wire169) ?
                           $unsigned((-{wire165,
                               wire176})) : $signed(wire170[(2'h3):(2'h2)])));
  assign wire178 = (~wire170);
  assign wire179 = ({(!wire174[(4'h9):(4'h9)])} ?
                       (({(8'h9e), {wire173}} ?
                           {(wire177 ? (7'h40) : wire178),
                               $signed(wire170)} : $unsigned(wire175[(4'he):(3'h6)])) | $unsigned((wire178 ?
                           wire171 : (-wire166)))) : {{(8'hbe),
                               wire169[(4'hf):(4'h8)]}});
  assign wire180 = $unsigned((|wire174));
  assign wire181 = wire166;
  assign wire182 = wire176;
  assign wire183 = (wire182 ~^ wire176[(3'h6):(2'h3)]);
  assign wire184 = $signed($unsigned({wire183[(2'h2):(2'h2)],
                       wire177[(1'h0):(1'h0)]}));
  assign wire185 = wire174[(4'h9):(4'h9)];
  assign wire186 = {$signed(wire174[(3'h4):(1'h0)]),
                       ((((wire166 - wire185) ?
                                   (wire182 ?
                                       wire183 : (8'hb6)) : (wire167 > wire166)) ?
                               $signed(wire177) : $unsigned(wire171[(4'hc):(3'h7)])) ?
                           $unsigned(({wire174,
                               (8'hbc)} ^~ (~^(8'hbb)))) : $signed(wire179[(2'h3):(2'h2)]))};
  assign wire187 = wire168;
  assign wire188 = ($signed($unsigned(wire175[(3'h4):(2'h2)])) ?
                       (&$signed($unsigned($signed(wire184)))) : $signed(wire171[(4'h9):(4'h9)]));
  assign wire189 = $signed($signed($signed((8'had))));
endmodule

module module138  (y, clk, wire142, wire141, wire140, wire139);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire142;
  input wire signed [(3'h6):(1'h0)] wire141;
  input wire [(5'h14):(1'h0)] wire140;
  input wire signed [(4'hb):(1'h0)] wire139;
  wire signed [(5'h14):(1'h0)] wire151;
  wire [(4'ha):(1'h0)] wire150;
  wire signed [(5'h12):(1'h0)] wire149;
  wire signed [(4'hf):(1'h0)] wire148;
  reg signed [(4'h9):(1'h0)] reg147 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg [(4'he):(1'h0)] reg144 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg143 <= {wire142[(4'h8):(2'h2)]};
      reg144 <= {((wire140[(5'h14):(1'h0)] ?
                  (|(!wire142)) : (((8'hb2) ? wire142 : wire140) ?
                      (wire139 || wire142) : {reg143, reg143})) ?
              wire141 : ({$signed((8'hbe))} ?
                  $unsigned({reg143}) : $unsigned((&(8'hb2)))))};
      reg145 <= ($unsigned(wire139[(4'hb):(3'h5)]) ?
          $unsigned($unsigned($signed((~^reg143)))) : {wire141,
              (~|((^~wire140) > (reg143 <<< wire142)))});
      reg146 <= (-reg145[(1'h1):(1'h0)]);
      reg147 <= $signed($signed({reg143,
          ((wire142 ^~ wire142) ? $signed(reg143) : wire141[(3'h5):(2'h3)])}));
    end
  assign wire148 = $unsigned(reg144);
  assign wire149 = {$signed($signed($unsigned({wire148})))};
  assign wire150 = $signed($signed(wire140[(3'h6):(3'h4)]));
  assign wire151 = $signed(($signed($unsigned($signed(wire149))) ?
                       (reg145 ?
                           {{wire148}} : $unsigned($signed(reg145))) : $signed(wire140[(5'h12):(4'h8)])));
endmodule

module module97
#(parameter param132 = {(|((~^((8'ha1) ? (8'ha4) : (8'ha9))) ? {((8'ha3) ? (8'hb2) : (8'hb8))} : (+(+(8'ha8))))), ((((!(8'hb3)) ? ((8'hbe) > (8'ha5)) : ((8'haf) ? (8'haa) : (7'h43))) == {{(8'ha0), (8'hbd)}, ((8'hb2) * (8'h9f))}) ? ((((8'hb2) ? (8'ha1) : (8'hab)) >>> {(8'h9c), (8'hab)}) ? (~&(^(8'hbd))) : ({(8'hae), (8'hab)} + ((7'h42) ? (8'hbb) : (8'hb3)))) : ({((8'h9f) ? (7'h42) : (8'ha1)), ((7'h40) ? (8'h9f) : (7'h43))} == ({(8'hb0)} ^~ (~^(8'hba)))))})
(y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire102;
  input wire signed [(4'h8):(1'h0)] wire101;
  input wire signed [(4'ha):(1'h0)] wire100;
  input wire signed [(5'h14):(1'h0)] wire99;
  input wire signed [(5'h11):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire130;
  wire [(5'h11):(1'h0)] wire129;
  wire signed [(4'h9):(1'h0)] wire128;
  wire [(5'h13):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire124;
  wire signed [(3'h6):(1'h0)] wire123;
  wire signed [(2'h3):(1'h0)] wire122;
  wire signed [(5'h14):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire120;
  wire signed [(5'h14):(1'h0)] wire119;
  wire [(4'hf):(1'h0)] wire117;
  wire signed [(4'hb):(1'h0)] wire103;
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(3'h5):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  assign y = {wire130,
                 wire129,
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
                 wire117,
                 wire103,
                 reg131,
                 reg118,
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
                 (1'h0)};
  assign wire103 = (~&wire98);
  always
    @(posedge clk) begin
      if ((^wire99[(2'h2):(1'h0)]))
        begin
          reg104 <= wire99[(4'h9):(4'h8)];
          reg105 <= (-{wire98, $unsigned($unsigned($unsigned(reg104)))});
          reg106 <= ((wire98 ^ wire99) <<< $unsigned(wire102));
          if ($unsigned(reg106))
            begin
              reg107 <= wire100[(3'h5):(1'h0)];
              reg108 <= reg104[(3'h6):(3'h6)];
            end
          else
            begin
              reg107 <= wire99[(3'h6):(3'h6)];
              reg108 <= reg106[(4'hc):(1'h1)];
              reg109 <= (^~$unsigned(({wire103} - ((~^(8'ha2)) ?
                  (reg104 ? wire100 : reg106) : $signed((8'hba))))));
              reg110 <= ((~&{{((8'hac) ? reg107 : (8'ha7))}}) ?
                  wire99[(4'h8):(3'h7)] : (!($unsigned(reg109) ?
                      $signed($signed(reg106)) : ((~|reg109) != reg106))));
              reg111 <= (wire98 && $unsigned(($signed((reg106 | reg109)) >> reg107)));
            end
          reg112 <= wire103;
        end
      else
        begin
          reg104 <= reg105;
          reg105 <= reg107;
          reg106 <= $signed((^~{$unsigned({wire103})}));
        end
      reg113 <= $unsigned(reg111[(3'h4):(3'h4)]);
      reg114 <= (+$signed((^{(reg108 ? reg104 : wire101)})));
      reg115 <= (8'haa);
      reg116 <= (~$signed($signed((^(^~(8'h9e))))));
    end
  assign wire117 = (~|reg116[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      if (($signed(reg108[(3'h6):(3'h6)]) ?
          $signed($unsigned($unsigned($unsigned(reg105)))) : reg115[(4'hc):(4'hb)]))
        begin
          reg118 <= {$unsigned($unsigned(({wire117} - $signed(wire102)))),
              (8'hbc)};
        end
      else
        begin
          reg118 <= $signed({wire103, reg116});
        end
    end
  assign wire119 = $unsigned((((~$signed(reg107)) && reg108[(4'h9):(2'h3)]) * {$signed((wire103 - reg111))}));
  assign wire120 = {$unsigned((~&(^wire99[(4'h9):(4'h9)]))), {wire102}};
  assign wire121 = reg116[(2'h3):(1'h0)];
  assign wire122 = (^~$signed(($unsigned(reg106[(4'hb):(4'hb)]) - ($unsigned(reg111) >> (wire101 <<< wire103)))));
  assign wire123 = (reg116 ?
                       ($unsigned($unsigned((^~reg115))) & {{reg118[(2'h3):(1'h1)]},
                           $unsigned(reg105)}) : (reg107[(1'h0):(1'h0)] < ($signed(reg114) || reg106[(4'ha):(3'h7)])));
  assign wire124 = wire119[(4'hd):(2'h3)];
  assign wire125 = (reg108[(1'h1):(1'h1)] ?
                       {(~|(~^$signed(wire98)))} : ({(~|(8'ha0)), {wire122}} ?
                           reg106 : $unsigned(reg115[(4'hd):(4'hc)])));
  assign wire126 = $unsigned(wire122[(1'h0):(1'h0)]);
  assign wire127 = (^~(~&(+wire103[(1'h0):(1'h0)])));
  assign wire128 = $unsigned(({$unsigned($signed(reg111)),
                           reg114[(2'h2):(1'h0)]} ?
                       {$signed({(7'h40)}),
                           $unsigned(wire121[(1'h1):(1'h0)])} : (wire127[(4'ha):(3'h6)] & ($unsigned(reg112) ?
                           {reg109} : (reg112 ? wire117 : wire101)))));
  assign wire129 = reg105;
  assign wire130 = {wire103,
                       (($unsigned({reg105}) ?
                               reg110 : $unsigned(((8'hb4) ?
                                   (8'hbc) : reg114))) ?
                           $signed(((|(7'h42)) ?
                               (reg108 < reg107) : (~^wire124))) : reg108)};
  always
    @(posedge clk) begin
      reg131 <= {reg108[(3'h7):(2'h2)],
          $signed($signed((^(wire100 && wire123))))};
    end
endmodule
