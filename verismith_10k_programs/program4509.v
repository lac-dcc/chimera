module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire182;
  wire signed [(5'h15):(1'h0)] wire181;
  wire [(2'h3):(1'h0)] wire180;
  wire signed [(3'h6):(1'h0)] wire179;
  wire [(4'he):(1'h0)] wire168;
  wire [(4'hc):(1'h0)] wire167;
  wire [(5'h13):(1'h0)] wire166;
  wire signed [(5'h11):(1'h0)] wire165;
  wire signed [(3'h7):(1'h0)] wire163;
  wire [(5'h13):(1'h0)] wire148;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire146;
  reg [(5'h15):(1'h0)] reg178 = (1'h0);
  reg [(5'h11):(1'h0)] reg177 = (1'h0);
  reg [(5'h13):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg174 = (1'h0);
  reg [(5'h12):(1'h0)] reg173 = (1'h0);
  reg [(5'h13):(1'h0)] reg172 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg171 = (1'h0);
  reg [(5'h13):(1'h0)] reg170 = (1'h0);
  reg [(4'hb):(1'h0)] reg169 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire163,
                 wire148,
                 wire5,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire146,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire3;
  always
    @(posedge clk) begin
      if ({{$unsigned((-(wire1 ? wire0 : wire2))), (~|wire2[(4'hb):(2'h2)])},
          ($signed(wire2) > (~&(~|(wire4 ? wire1 : wire4))))})
        begin
          if (wire5[(5'h10):(4'h9)])
            begin
              reg6 <= (wire2[(1'h1):(1'h1)] ?
                  ($unsigned(($signed(wire3) + {wire3,
                      wire5})) ^~ wire0[(1'h1):(1'h0)]) : (wire0 * ((!{wire0,
                      wire4}) * (+(wire3 ~^ wire1)))));
            end
          else
            begin
              reg6 <= $unsigned((wire1 ?
                  (wire4[(3'h7):(1'h1)] ?
                      $unsigned($signed((8'ha8))) : reg6) : {(reg6 ^ wire4)}));
              reg7 <= {(wire4[(3'h6):(2'h3)] == wire2),
                  (((~|(wire3 ? wire3 : wire3)) ? (8'hb1) : $signed(wire5)) ?
                      (wire0 - $unsigned(wire3[(2'h2):(1'h0)])) : (wire1 ?
                          ((wire4 >>> wire5) ^ (wire5 ?
                              wire2 : wire0)) : {$signed(wire3),
                              $unsigned((8'ha5))}))};
            end
          reg8 <= wire2[(4'ha):(4'h9)];
          reg9 <= $signed($unsigned(wire2));
          reg10 <= wire5;
        end
      else
        begin
          reg6 <= (8'ha0);
          reg7 <= wire2;
        end
    end
  assign wire11 = wire0;
  assign wire12 = wire4;
  assign wire13 = (^~$unsigned(({$unsigned(wire2)} ?
                      (reg9[(2'h3):(2'h2)] || $unsigned(reg8)) : $unsigned(reg7[(2'h3):(2'h2)]))));
  assign wire14 = (8'hbd);
  assign wire15 = {reg8};
  assign wire16 = {(reg8 ?
                          ({$unsigned(wire12), (wire1 << wire0)} ?
                              $unsigned((wire14 ?
                                  wire12 : wire5)) : $signed((reg10 ?
                                  wire2 : wire4))) : reg8[(4'h9):(3'h4)])};
  assign wire17 = wire13[(4'h8):(3'h5)];
  module18 #() modinst147 (.wire19(reg10), .y(wire146), .clk(clk), .wire21(wire5), .wire23(wire15), .wire20(reg9), .wire22(wire1));
  assign wire148 = ($unsigned({($signed(wire13) ^~ (wire11 ? wire2 : wire3)),
                       (wire13[(3'h5):(3'h5)] ?
                           (~|wire11) : wire5)}) & $unsigned(wire4[(3'h4):(2'h3)]));
  module149 #() modinst164 (.wire150(wire5), .wire152(wire14), .wire151(reg10), .clk(clk), .wire153(reg6), .y(wire163));
  assign wire165 = reg8[(4'h8):(3'h4)];
  assign wire166 = (wire3 ? wire16 : wire146[(1'h1):(1'h0)]);
  assign wire167 = ((((wire148[(4'ha):(3'h6)] ?
                       (reg10 || reg8) : (wire163 | wire0)) && wire166) <<< wire146) < reg6[(2'h3):(2'h2)]);
  assign wire168 = (wire166[(2'h3):(1'h1)] - $unsigned(wire166));
  always
    @(posedge clk) begin
      if ((8'hbc))
        begin
          reg169 <= $unsigned(wire4);
          reg170 <= wire17[(3'h7):(1'h1)];
          reg171 <= wire12;
          reg172 <= $signed(wire11[(1'h1):(1'h1)]);
        end
      else
        begin
          reg169 <= $unsigned((wire4 ?
              $unsigned(wire3[(4'h8):(1'h0)]) : {$signed($signed(reg8))}));
          if (((wire3[(4'ha):(1'h0)] ?
              (({(8'ha7)} ? ((8'had) < reg170) : reg8) ?
                  $unsigned(reg7[(1'h1):(1'h1)]) : $signed($signed(reg8))) : (!(^$unsigned(reg7)))) < ($signed(reg172) ?
              {reg7} : wire14)))
            begin
              reg170 <= (!wire1[(2'h2):(1'h1)]);
            end
          else
            begin
              reg170 <= ($signed($unsigned(wire148)) <<< wire15[(4'h8):(3'h7)]);
              reg171 <= wire15;
              reg172 <= reg10;
            end
          if ((~^((~{(~&wire12)}) <<< (($unsigned(reg171) <= $unsigned(wire1)) ?
              $unsigned($signed(reg9)) : {(wire167 ? wire2 : wire12)}))))
            begin
              reg173 <= (($unsigned(reg8) ?
                  ((8'hbb) ?
                      $unsigned(wire15) : $unsigned(((8'hb0) <= wire12))) : $signed((wire2 ?
                      (wire12 * wire12) : wire0))) >> $signed(wire12[(3'h4):(1'h0)]));
              reg174 <= (^~$unsigned((wire4 ?
                  {$signed((8'ha1)), (reg171 << wire5)} : ((wire146 ?
                      wire12 : wire163) > reg6[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg173 <= (-(|wire166[(4'h8):(2'h2)]));
              reg174 <= $signed({({(reg172 ? wire5 : reg7)} >> ({wire0} ?
                      wire2 : (~^reg171)))});
              reg175 <= (|$signed(((~^$signed(wire3)) ?
                  $unsigned($signed(wire13)) : $unsigned((^wire4)))));
            end
        end
      reg176 <= $signed(wire0[(1'h1):(1'h1)]);
      reg177 <= wire11[(1'h1):(1'h0)];
      reg178 <= {(((wire168[(4'hc):(4'hb)] ? $unsigned(wire4) : wire15) ?
                  reg175 : (^~(8'hbd))) ?
              ($signed((~&wire12)) ?
                  ($unsigned(reg175) ?
                      (reg6 ? (8'h9c) : wire3) : reg177) : ((wire5 ?
                      wire0 : wire163) << (reg174 ?
                      wire11 : wire13))) : $signed($signed(wire11[(3'h6):(3'h4)]))),
          wire163};
    end
  assign wire179 = $signed(((|((-reg175) <<< $signed(wire16))) >> (wire5 >>> reg6[(3'h4):(1'h0)])));
  assign wire180 = ((((+reg178[(3'h6):(2'h3)]) ?
                       $unsigned((reg173 < wire1)) : ((reg177 & reg178) | $signed(reg173))) ~^ wire14[(4'h8):(4'h8)]) ^ $unsigned(reg169));
  assign wire181 = $unsigned(reg174);
  assign wire182 = wire166[(4'h9):(2'h2)];
endmodule

module module149
#(parameter param161 = (~|(~|(((~|(8'ha0)) ? (^~(8'hb7)) : ((8'ha3) ? (8'hbc) : (8'haa))) ? {(^~(8'hb8)), ((8'hb7) ? (8'hab) : (8'hb3))} : {(8'hae), ((7'h43) ? (8'ha6) : (8'h9d))}))), 
parameter param162 = (param161 ? {param161} : {(8'ha8), (~((param161 ? param161 : param161) + (8'hac)))}))
(y, clk, wire153, wire152, wire151, wire150);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire153;
  input wire signed [(4'he):(1'h0)] wire152;
  input wire signed [(4'h8):(1'h0)] wire151;
  input wire [(5'h14):(1'h0)] wire150;
  wire signed [(3'h5):(1'h0)] wire160;
  wire [(4'h8):(1'h0)] wire159;
  wire [(4'hc):(1'h0)] wire156;
  wire signed [(2'h3):(1'h0)] wire155;
  wire [(5'h11):(1'h0)] wire154;
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg157 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire156,
                 wire155,
                 wire154,
                 reg158,
                 reg157,
                 (1'h0)};
  assign wire154 = $signed($unsigned(wire150));
  assign wire155 = ($signed((|$signed((!wire153)))) ?
                       $unsigned($signed($signed((~|wire154)))) : (($unsigned(wire150[(4'h8):(3'h4)]) ?
                           $signed($signed(wire150)) : {(wire150 + wire152),
                               wire150[(5'h10):(1'h1)]}) & wire151[(1'h0):(1'h0)]));
  assign wire156 = $signed(wire155[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg157 <= ((^(wire151[(1'h1):(1'h1)] ?
          $unsigned(wire153[(2'h2):(2'h2)]) : {wire151[(3'h6):(1'h0)],
              (-wire154)})) || {wire156});
      reg158 <= wire151[(2'h2):(1'h0)];
    end
  assign wire159 = (reg157 >>> ((reg157 ~^ ({reg157, wire151} <<< (wire151 ?
                           wire155 : wire151))) ?
                       wire153 : wire150));
  assign wire160 = (|$signed($signed(wire155)));
endmodule

module module18
#(parameter param145 = {{(~(~&(|(8'hb1))))}, (((((8'hba) >= (8'ha5)) ? ((8'ha3) ? (8'hb3) : (8'ha5)) : (+(8'hb0))) ^ {(^~(8'ha8))}) >= (~&(((8'haf) >= (8'h9c)) ? (~^(8'ha0)) : ((8'hb5) ? (8'h9d) : (8'hb0)))))})
(y, clk, wire19, wire20, wire21, wire22, wire23);
  output wire [(32'h283):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire21;
  input wire signed [(5'h10):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire144;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire86;
  wire signed [(4'hd):(1'h0)] wire103;
  wire [(4'hc):(1'h0)] wire104;
  wire [(5'h15):(1'h0)] wire105;
  wire [(5'h15):(1'h0)] wire106;
  wire [(4'h8):(1'h0)] wire142;
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  assign y = {wire144,
                 wire24,
                 wire25,
                 wire54,
                 wire56,
                 wire57,
                 wire79,
                 wire80,
                 wire86,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire142,
                 reg102,
                 reg101,
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
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg78,
                 reg77,
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
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire24 = (-($signed(((wire21 ? wire22 : wire20) ?
                      (wire22 >> wire20) : (wire22 ?
                          wire23 : wire21))) | $signed((!$signed(wire20)))));
  assign wire25 = {wire22, (+(^~{(wire22 << wire22)}))};
  module26 #() modinst55 (.wire27(wire22), .wire30(wire21), .clk(clk), .wire28(wire24), .wire29(wire19), .y(wire54));
  assign wire56 = wire25[(2'h2):(2'h2)];
  assign wire57 = (~&((~|$unsigned($signed((8'hb1)))) ?
                      wire22 : wire54[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      if ($unsigned($signed((($unsigned(wire54) ^ wire23) ^ $unsigned({wire56,
          (8'hb6)})))))
        begin
          reg58 <= wire56[(4'he):(3'h5)];
          reg59 <= (7'h42);
          reg60 <= ($unsigned($unsigned({$signed(wire23)})) ?
              {wire21} : (wire20[(2'h3):(2'h2)] ?
                  {reg58[(3'h6):(2'h3)],
                      ($unsigned((8'h9c)) ~^ (^~wire23))} : wire20));
          reg61 <= $unsigned((~&((+(wire56 == reg60)) == wire23)));
        end
      else
        begin
          reg58 <= wire23;
          reg59 <= (($unsigned({(^~(8'ha9)),
              (^wire22)}) & $unsigned($unsigned($signed(wire21)))) > $signed(($unsigned((^~reg60)) ?
              ((~^wire54) ~^ (wire19 == wire54)) : $unsigned(wire20))));
          if (wire54)
            begin
              reg60 <= ($unsigned(($signed($signed(reg59)) && $unsigned((+wire23)))) <<< $signed($signed((8'hbc))));
            end
          else
            begin
              reg60 <= {(|(((wire54 <= wire24) >= wire19) ?
                      $signed(reg59) : $unsigned((-wire54)))),
                  reg59};
              reg61 <= (((reg61 ?
                          $signed((wire24 ?
                              wire54 : wire57)) : (wire23[(3'h4):(2'h3)] > $unsigned((8'haf)))) ?
                      ((^wire23) | (~&(wire57 ? wire23 : wire57))) : ({(reg61 ?
                                  wire22 : wire22),
                              (wire56 ? wire24 : (8'hba))} ?
                          (reg61[(3'h5):(1'h1)] ?
                              reg60[(3'h5):(2'h2)] : $signed(wire22)) : wire21)) ?
                  wire57[(1'h0):(1'h0)] : $signed($unsigned(((wire57 >>> reg60) ?
                      reg58[(1'h0):(1'h0)] : reg59[(4'h8):(3'h7)]))));
              reg62 <= $signed(wire21);
              reg63 <= ((&$signed($unsigned((reg61 ?
                  (8'hae) : reg58)))) > (~^(~wire21[(4'hb):(3'h7)])));
              reg64 <= (^~($unsigned(reg60) - (~^((wire56 ?
                  wire56 : reg62) && $unsigned((8'ha1))))));
            end
          reg65 <= wire57[(3'h4):(1'h1)];
        end
      reg66 <= $signed(reg62[(4'hf):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg67 <= ($signed((^~wire21)) ?
          wire54[(3'h4):(2'h3)] : {(8'ha2), wire20[(2'h2):(1'h0)]});
      if (reg66)
        begin
          if (reg67[(1'h0):(1'h0)])
            begin
              reg68 <= ($signed(($unsigned($signed(wire54)) <<< reg65)) ?
                  (((+((8'haf) <= reg66)) ?
                      ((-wire20) & (reg62 ?
                          wire25 : reg65)) : (reg61[(1'h1):(1'h1)] ?
                          (&reg59) : wire19)) ~^ {(~|wire19)}) : $unsigned(({(reg67 ?
                              (8'h9f) : reg65),
                          reg65[(2'h2):(1'h0)]} ?
                      ((-reg67) ?
                          $signed(wire25) : wire56[(3'h7):(3'h6)]) : $unsigned((8'ha2)))));
              reg69 <= $signed((($signed((~^wire19)) * ((wire19 ?
                  wire21 : (8'ha7)) >> reg68[(3'h6):(3'h5)])) * ((~&(reg65 ?
                  wire56 : wire20)) & wire23[(3'h6):(3'h4)])));
            end
          else
            begin
              reg68 <= (-$signed($unsigned(($signed(wire23) ^ $unsigned((8'hbe))))));
              reg69 <= $unsigned((+(((8'ha3) ?
                      ((8'hbe) ? wire23 : wire25) : $unsigned(wire23)) ?
                  {$signed(wire20)} : reg65)));
              reg70 <= (wire57[(1'h0):(1'h0)] ?
                  (!(reg67 ^ {reg59, {wire19}})) : ({(~^(^~(8'ha0))),
                      ((8'hb7) ?
                          {reg64} : (reg61 ?
                              wire56 : wire54))} - wire24[(4'hb):(3'h4)]));
              reg71 <= $signed((!$unsigned({(|reg65),
                  ((8'hbb) ? reg62 : reg70)})));
            end
        end
      else
        begin
          reg68 <= $unsigned(((reg62[(4'hc):(1'h0)] ^~ $unsigned(reg61)) ?
              reg71[(2'h2):(1'h1)] : (reg64 - ($unsigned(reg65) ?
                  reg63[(2'h3):(1'h1)] : (reg63 ? reg68 : reg60)))));
          reg69 <= ($unsigned($unsigned((^$signed(wire19)))) ?
              (-(-($unsigned(reg59) | (&wire22)))) : $unsigned((reg69[(4'h8):(1'h0)] ~^ $signed($signed(wire23)))));
          reg70 <= {($signed($signed($unsigned(reg60))) & (($unsigned((8'haa)) ?
                  $unsigned(reg62) : ((8'haa) ? reg62 : reg70)) >> (~&((7'h40) ?
                  wire57 : wire56)))),
              $unsigned($unsigned($signed(wire24)))};
          if ((~^$unsigned(($unsigned($unsigned(wire19)) < wire56[(4'h8):(1'h0)]))))
            begin
              reg71 <= (reg63 + $unsigned($signed($signed($signed(reg65)))));
              reg72 <= reg66;
            end
          else
            begin
              reg71 <= ((8'hac) ? wire24 : $unsigned($unsigned(reg67)));
              reg72 <= (&(-reg71[(4'h9):(1'h1)]));
              reg73 <= ($unsigned($unsigned(reg68[(5'h13):(2'h2)])) <= (8'hbb));
              reg74 <= (((~((reg72 < wire24) * reg65[(3'h6):(3'h6)])) > $signed(reg72)) && reg64[(3'h4):(2'h2)]);
            end
          reg75 <= (((reg63 == $signed($unsigned(wire21))) - $unsigned(((reg71 ?
                  reg74 : reg68) <<< wire57[(1'h0):(1'h0)]))) ?
              wire23 : reg73);
        end
      reg76 <= reg70;
      reg77 <= $signed($signed($unsigned({$unsigned(reg68),
          wire23[(1'h1):(1'h0)]})));
      reg78 <= ($unsigned(reg71) ?
          $unsigned($unsigned($unsigned((|wire21)))) : $unsigned((^(^{reg61,
              reg73}))));
    end
  assign wire79 = {($unsigned($unsigned({(8'ha8)})) ?
                          $unsigned(($signed(wire21) ^~ $signed(wire24))) : ({(^~reg76)} ?
                              $signed((~|reg67)) : {reg72}))};
  assign wire80 = ((((wire22 ?
                      (+wire24) : (wire22 >>> reg65)) <= ((~^reg68) - $signed(wire56))) | (|$signed($unsigned(wire19)))) >> $signed($signed($unsigned((!wire19)))));
  always
    @(posedge clk) begin
      reg81 <= reg67;
      reg82 <= ($signed(reg62[(3'h5):(1'h0)]) > reg73[(3'h7):(1'h1)]);
      reg83 <= reg75[(4'h8):(3'h5)];
      if ($signed(reg81))
        begin
          reg84 <= ({{{(8'had)}, $unsigned({wire56, (8'h9d)})},
                  $unsigned($unsigned((^wire54)))} ?
              (7'h41) : (^reg58));
          reg85 <= ((~|reg60[(3'h5):(2'h3)]) << reg65[(2'h3):(1'h0)]);
        end
      else
        begin
          reg84 <= reg66;
        end
    end
  assign wire86 = $signed(reg66);
  always
    @(posedge clk) begin
      if ((wire24[(4'ha):(3'h4)] || wire54))
        begin
          if (wire19)
            begin
              reg87 <= $unsigned(wire57[(1'h0):(1'h0)]);
            end
          else
            begin
              reg87 <= $signed(reg81);
              reg88 <= (^~((8'hbb) ?
                  $unsigned((^(reg63 && wire24))) : {$unsigned((8'h9e))}));
              reg89 <= $unsigned(((~$unsigned(wire19[(4'h9):(3'h5)])) * ((~^(reg58 ?
                  reg71 : reg83)) <= (reg58[(3'h4):(2'h3)] ?
                  (+wire86) : $unsigned(wire20)))));
              reg90 <= reg64[(2'h2):(1'h1)];
              reg91 <= ((wire24 ?
                      $unsigned((reg87 ? {(8'had), reg64} : {reg70})) : {wire57,
                          (reg90[(2'h3):(1'h1)] + (8'hb3))}) ?
                  $unsigned(($signed((reg74 < reg58)) ?
                      (!(reg70 ^~ reg65)) : (wire80 ?
                          (reg67 < reg61) : (!reg73)))) : wire54);
            end
          if (reg74[(4'hc):(3'h6)])
            begin
              reg92 <= (+(!(reg91[(4'hc):(1'h0)] ?
                  $signed((~|(8'ha7))) : ($unsigned(wire19) ?
                      (reg88 ? (8'ha6) : wire19) : $unsigned(wire56)))));
              reg93 <= ($signed($signed(reg77[(3'h7):(1'h1)])) ?
                  ($unsigned(($unsigned(reg76) ? wire21 : {wire21, (8'ha7)})) ?
                      reg62[(4'hb):(3'h4)] : (8'hbf)) : reg61[(4'ha):(3'h4)]);
              reg94 <= {(^reg91)};
              reg95 <= $signed((~$signed((+{wire54}))));
            end
          else
            begin
              reg92 <= wire54[(2'h3):(2'h3)];
              reg93 <= (~|($unsigned(($unsigned(reg61) || (~^reg62))) >> $signed($signed($unsigned(wire20)))));
              reg94 <= reg75[(3'h7):(1'h0)];
            end
          reg96 <= ($signed({(8'ha2), (-$unsigned((8'haf)))}) - reg61);
          reg97 <= $unsigned((reg74[(2'h2):(1'h1)] ?
              $signed($signed((~&reg71))) : (-reg76)));
        end
      else
        begin
          reg87 <= reg60;
          reg88 <= $signed((-reg88));
          reg89 <= reg66[(4'hd):(4'hb)];
          reg90 <= $unsigned(($signed($unsigned($signed(reg78))) ?
              $unsigned({$signed(wire56)}) : $unsigned(reg59)));
        end
      reg98 <= wire24;
      if (wire25)
        begin
          reg99 <= (~($signed($signed(reg98)) ?
              $unsigned(reg87[(1'h1):(1'h0)]) : (wire86 ?
                  (!(wire56 != wire57)) : reg75[(1'h1):(1'h0)])));
          if (wire86)
            begin
              reg100 <= reg85[(2'h2):(1'h1)];
              reg101 <= reg96[(1'h0):(1'h0)];
              reg102 <= (^reg71);
            end
          else
            begin
              reg100 <= $signed(reg100[(3'h4):(3'h4)]);
            end
        end
      else
        begin
          reg99 <= (^~(^($unsigned(wire86[(4'h9):(3'h7)]) - ((reg88 ?
              reg85 : reg85) >> $unsigned(reg97)))));
        end
    end
  assign wire103 = (($signed(reg70) == {(~|$unsigned(reg74))}) & reg85);
  assign wire104 = ($unsigned(($signed(reg98[(3'h6):(1'h0)]) == (^$unsigned(wire57)))) <<< $unsigned((!reg58)));
  assign wire105 = $signed($signed(((8'hb0) - $signed((wire25 + reg62)))));
  assign wire106 = (wire104[(3'h6):(2'h3)] * $signed(reg98[(3'h6):(1'h0)]));
  module107 #() modinst143 (wire142, clk, reg62, reg73, wire103, wire20, wire106);
  assign wire144 = reg93;
endmodule

module module107  (y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire112;
  input wire signed [(4'hb):(1'h0)] wire111;
  input wire [(4'hd):(1'h0)] wire110;
  input wire [(4'hd):(1'h0)] wire109;
  input wire signed [(5'h14):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire113;
  reg signed [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg135 = (1'h0);
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  reg [(4'hc):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg130 = (1'h0);
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire113,
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
                 reg127,
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
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire113 = wire111;
  always
    @(posedge clk) begin
      reg114 <= $signed(wire109[(4'hc):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg115 <= ((8'had) ?
          (+$unsigned($unsigned((-wire110)))) : (~^$signed((~^$signed(wire109)))));
      reg116 <= $unsigned(wire112[(4'h9):(2'h3)]);
      if (wire110)
        begin
          reg117 <= ((|$signed({wire113[(3'h6):(2'h2)],
              (8'hb7)})) ~^ $unsigned((^{wire108[(1'h1):(1'h1)]})));
          if (wire110[(4'hd):(3'h6)])
            begin
              reg118 <= $signed({{((wire110 + wire113) || (~^reg114))},
                  (+(~|{wire109}))});
            end
          else
            begin
              reg118 <= wire111[(3'h4):(3'h4)];
              reg119 <= $unsigned(((|({reg114} ?
                  $signed((7'h42)) : $unsigned(reg118))) | reg116[(3'h4):(2'h2)]));
              reg120 <= reg118;
            end
          reg121 <= (&((((wire113 ? wire110 : (8'hb2)) == (~^reg117)) ?
                  wire112 : wire111[(4'h9):(4'h9)]) ?
              ({(&(8'ha9))} ?
                  $unsigned($unsigned(wire110)) : $signed((8'hb5))) : reg117[(4'hb):(2'h2)]));
          if ($signed($unsigned(({(~^reg118)} ~^ $signed((wire111 < wire112))))))
            begin
              reg122 <= wire109[(2'h3):(2'h2)];
              reg123 <= $signed($unsigned($signed($unsigned(reg121))));
              reg124 <= reg123;
              reg125 <= $signed(reg117[(4'ha):(1'h1)]);
              reg126 <= (&(+$unsigned(reg122)));
            end
          else
            begin
              reg122 <= (wire110[(1'h0):(1'h0)] ?
                  reg124[(2'h2):(2'h2)] : $signed((reg114 ?
                      {(wire110 ?
                              (8'haf) : reg125)} : ($unsigned((8'h9d)) < reg114[(3'h6):(1'h0)]))));
            end
        end
      else
        begin
          reg117 <= $signed(((~(((7'h42) >> reg114) ?
                  wire113[(4'hb):(1'h1)] : wire108)) ?
              $signed(reg118[(1'h0):(1'h0)]) : $unsigned(wire108)));
          reg118 <= {$signed($unsigned(((reg114 << wire112) ?
                  (!reg121) : {wire110}))),
              $unsigned($unsigned($unsigned(reg125)))};
          reg119 <= $signed($unsigned(reg126));
        end
      reg127 <= $signed(reg123[(3'h5):(3'h4)]);
    end
  assign wire128 = (-(8'ha4));
  assign wire129 = {(($unsigned($unsigned(reg117)) + (reg117 && $unsigned(reg114))) || $unsigned(((reg125 | wire128) ^~ $unsigned(reg127)))),
                       reg124};
  always
    @(posedge clk) begin
      if (reg119)
        begin
          reg130 <= reg114[(3'h6):(2'h3)];
          reg131 <= (reg115 ?
              $signed((reg130 < (reg125 ?
                  $unsigned(reg121) : (8'hbd)))) : reg122[(4'hc):(2'h3)]);
        end
      else
        begin
          if ({wire112})
            begin
              reg130 <= wire113[(3'h7):(3'h4)];
              reg131 <= (~{{(~|((8'h9f) ^ reg118)),
                      ($unsigned(wire128) ? {(8'hb5)} : $signed(reg118))},
                  $unsigned({$signed(reg122)})});
              reg132 <= $signed($unsigned($signed(({reg125, wire112} ?
                  $signed(reg122) : (reg125 & reg115)))));
            end
          else
            begin
              reg130 <= wire108;
              reg131 <= ((reg119 != reg116) < {(&(8'ha0)),
                  $unsigned(((~^wire113) ? {reg130} : reg118[(1'h1):(1'h0)]))});
              reg132 <= (reg131[(4'hc):(1'h0)] ?
                  (-$unsigned(reg121[(2'h3):(2'h2)])) : reg130);
            end
          reg133 <= {$signed($signed(wire108[(2'h2):(1'h1)])),
              ($signed(((~&(8'hb9)) ?
                  reg123[(1'h1):(1'h1)] : $unsigned((8'ha0)))) <= ((8'hb0) >> reg122[(5'h12):(4'h8)]))};
          reg134 <= $signed({reg114[(3'h5):(3'h4)], (^~$unsigned((8'hb7)))});
        end
      reg135 <= $signed((reg120 >> {(8'hb1), wire108}));
      if (reg135[(2'h2):(2'h2)])
        begin
          reg136 <= reg115[(4'hb):(4'hb)];
          reg137 <= (~&{wire108[(3'h7):(3'h4)], reg131});
          reg138 <= $signed(({wire110[(1'h0):(1'h0)]} ^~ reg136[(1'h1):(1'h1)]));
          if ($signed($unsigned(reg114)))
            begin
              reg139 <= (!$unsigned(wire128[(4'hd):(1'h0)]));
              reg140 <= {(&($unsigned((reg138 ~^ reg122)) ?
                      {(reg118 << reg124)} : reg121[(3'h7):(3'h6)]))};
              reg141 <= {reg139, reg122};
            end
          else
            begin
              reg139 <= $signed(reg115[(4'hc):(4'h9)]);
              reg140 <= (reg115 ?
                  (($unsigned((reg133 ~^ reg133)) & $unsigned($unsigned(reg117))) <= {(-reg119[(1'h1):(1'h0)])}) : ((wire111 ?
                      $unsigned((wire108 ?
                          reg121 : reg117)) : ($signed(wire109) && reg116[(4'hb):(4'h8)])) << $signed(reg133)));
            end
        end
      else
        begin
          reg136 <= ((8'ha9) < reg115[(3'h7):(3'h4)]);
          reg137 <= $unsigned($signed($signed(((reg116 + wire110) ^ (-(8'hb4))))));
          reg138 <= (({$unsigned((^(8'ha0))),
                  ($signed((8'h9e)) ? (reg121 != (8'h9f)) : reg137)} ?
              (8'ha6) : (-$unsigned($unsigned(reg114)))) ^~ (+((~wire129[(1'h1):(1'h0)]) >= ((!reg135) ?
              reg124[(1'h1):(1'h0)] : $signed((8'hbb))))));
          reg139 <= ($signed((+(~&(&reg127)))) > {(reg126[(2'h2):(1'h0)] ?
                  ((reg136 <= wire128) ?
                      $unsigned(wire109) : $signed((8'hbe))) : {reg139[(1'h0):(1'h0)],
                      $unsigned(reg139)}),
              wire129});
          reg140 <= reg131;
        end
    end
endmodule

module module26  (y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire signed [(5'h10):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire33,
                 wire32,
                 wire31,
                 reg46,
                 reg45,
                 reg44,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire31 = ($unsigned(wire29[(2'h2):(2'h2)]) + wire30[(3'h5):(2'h3)]);
  assign wire32 = (((((wire31 << wire30) ? wire28 : $unsigned(wire30)) ?
                      (wire27 <<< (+(8'ha4))) : {(~|wire30)}) >>> ((wire31 ?
                      wire31 : (wire29 ?
                          (8'hb7) : (8'hbf))) <= $unsigned(wire31[(2'h2):(2'h2)]))) & $signed($signed($signed(wire31[(2'h2):(1'h1)]))));
  assign wire33 = ({(wire29[(2'h3):(1'h0)] ?
                          wire30[(4'hc):(4'ha)] : (wire30 ~^ wire27)),
                      ($signed((wire28 - (8'ha6))) << ((wire28 == wire28) + wire31))} ~^ $unsigned($signed({(wire29 <<< wire27),
                      wire27})));
  always
    @(posedge clk) begin
      if ($unsigned({(~^(|(wire31 ? wire30 : (8'hb8)))),
          ((~(wire31 ? (8'h9e) : wire33)) == {$unsigned(wire33)})}))
        begin
          reg34 <= (!((((wire29 ? (8'hbb) : wire30) ? (|wire29) : wire32) ?
              wire33 : $signed($signed(wire28))) > (~&$unsigned($signed(wire31)))));
        end
      else
        begin
          reg34 <= (8'hb4);
        end
      reg35 <= $signed((+{$signed((|(8'h9f)))}));
    end
  assign wire36 = reg35;
  assign wire37 = ($unsigned({{$signed(reg35),
                          reg35}}) <= {(~$signed((-wire30))), (8'hb2)});
  assign wire38 = $signed($unsigned(reg35[(2'h3):(1'h1)]));
  assign wire39 = (wire31 ?
                      (($signed(wire31) >>> $unsigned((wire31 != reg34))) < $signed($signed($unsigned(wire30)))) : {wire38,
                          wire33});
  assign wire40 = $unsigned(($signed(wire36) ?
                      {(8'hbe)} : $signed($signed((wire30 ?
                          wire30 : (8'h9c))))));
  assign wire41 = (($unsigned(($signed(wire30) > (wire32 ? wire36 : reg35))) ?
                          (+{{wire37}, (+wire28)}) : wire37[(4'hc):(1'h0)]) ?
                      (((^wire38) ? wire30 : (~wire40)) ?
                          {wire39} : wire33[(4'ha):(3'h6)]) : $unsigned(wire39[(1'h1):(1'h0)]));
  assign wire42 = (^~wire31);
  assign wire43 = (+wire28);
  always
    @(posedge clk) begin
      reg44 <= {wire38};
      reg45 <= wire28;
      reg46 <= (wire37[(2'h3):(2'h3)] ?
          (^~(~|reg34)) : ((wire37[(4'hd):(4'hb)] ? wire43 : $signed(wire43)) ?
              $unsigned(reg45[(1'h1):(1'h0)]) : ((~|$signed(wire39)) && wire32)));
    end
  assign wire47 = (wire42 ?
                      wire43[(5'h11):(2'h3)] : (((-(wire28 ? reg34 : reg34)) ?
                          (wire43[(1'h1):(1'h1)] ?
                              $signed(wire42) : (wire33 ?
                                  wire40 : reg35)) : ((wire41 * wire31) || $signed(wire38))) > (+wire28)));
  assign wire48 = (~($signed(((wire29 ? reg45 : wire28) ?
                      (|(8'ha5)) : ((8'hbc) || wire27))) - reg44));
  assign wire49 = wire31;
  assign wire50 = wire29[(1'h1):(1'h0)];
  assign wire51 = $signed(wire32[(3'h5):(2'h3)]);
  assign wire52 = $signed((~&(8'hac)));
  assign wire53 = (((-($unsigned(wire50) ?
                          (wire47 ? wire49 : wire40) : wire39[(3'h6):(1'h1)])) ?
                      $signed(({(7'h40), (8'haf)} ?
                          $signed(wire49) : (reg45 ?
                              wire32 : wire37))) : wire42) || (8'hbb));
endmodule
