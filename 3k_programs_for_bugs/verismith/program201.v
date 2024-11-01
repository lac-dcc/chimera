module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire199;
  wire signed [(3'h5):(1'h0)] wire198;
  wire [(4'h8):(1'h0)] wire197;
  wire signed [(5'h10):(1'h0)] wire196;
  wire signed [(4'he):(1'h0)] wire195;
  wire signed [(3'h7):(1'h0)] wire193;
  wire signed [(3'h5):(1'h0)] wire192;
  wire signed [(5'h14):(1'h0)] wire191;
  wire [(5'h12):(1'h0)] wire190;
  wire [(5'h11):(1'h0)] wire189;
  wire [(5'h13):(1'h0)] wire187;
  wire [(5'h10):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire183;
  wire [(5'h13):(1'h0)] wire185;
  assign y = {wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire187,
                 wire44,
                 wire4,
                 wire183,
                 wire185,
                 (1'h0)};
  assign wire4 = $signed($unsigned($unsigned(($signed((8'hab)) ?
                     $signed((7'h41)) : (+wire1)))));
  module5 #() modinst45 (.wire9(wire0), .wire10(wire3), .wire8(wire2), .y(wire44), .wire6(wire4), .clk(clk), .wire7(wire1));
  module46 #() modinst184 (wire183, clk, wire3, wire1, wire0, wire2);
  module137 #() modinst186 (.wire138(wire3), .wire142(wire183), .clk(clk), .wire139(wire0), .wire140(wire44), .y(wire185), .wire141(wire4));
  module46 #() modinst188 (.wire50(wire2), .wire48(wire4), .wire49(wire3), .y(wire187), .clk(clk), .wire47(wire185));
  assign wire189 = {(wire2 < ($unsigned((~(8'h9f))) <= ($signed((8'haf)) | (wire44 ~^ wire1))))};
  assign wire190 = ({{{(wire185 - wire44), (wire185 < wire189)}},
                       wire0[(2'h2):(2'h2)]} && $unsigned($unsigned(wire185)));
  assign wire191 = (^~{wire3, $unsigned(wire3)});
  assign wire192 = wire187[(5'h10):(4'hf)];
  module66 #() modinst194 (wire193, clk, wire191, wire187, wire190, wire189);
  assign wire195 = (($unsigned((!(^~wire190))) && $signed(((wire4 ?
                       wire192 : wire0) >>> $unsigned(wire1)))) - (((^~$signed(wire2)) && wire2[(2'h2):(1'h0)]) ?
                       wire0[(3'h5):(3'h5)] : (((wire3 < wire183) ?
                               $signed(wire190) : (-wire1)) ?
                           (wire1[(4'hc):(2'h3)] ?
                               wire189 : $unsigned(wire189)) : $unsigned($signed(wire2)))));
  assign wire196 = $unsigned((8'haa));
  assign wire197 = wire191[(3'h6):(2'h3)];
  assign wire198 = $unsigned($unsigned($unsigned($signed((~wire2)))));
  module66 #() modinst200 (.clk(clk), .y(wire199), .wire68(wire4), .wire69(wire196), .wire70(wire1), .wire67(wire183));
endmodule

module module46  (y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire50;
  input wire [(4'hf):(1'h0)] wire49;
  input wire [(4'hb):(1'h0)] wire48;
  input wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire182;
  wire [(4'he):(1'h0)] wire179;
  wire signed [(2'h2):(1'h0)] wire178;
  wire signed [(4'hd):(1'h0)] wire177;
  wire [(4'hb):(1'h0)] wire176;
  wire signed [(5'h10):(1'h0)] wire175;
  wire [(5'h13):(1'h0)] wire174;
  wire signed [(4'ha):(1'h0)] wire171;
  wire signed [(3'h5):(1'h0)] wire170;
  wire signed [(2'h3):(1'h0)] wire169;
  wire signed [(5'h13):(1'h0)] wire133;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire135;
  wire [(4'hd):(1'h0)] wire136;
  wire [(3'h7):(1'h0)] wire167;
  reg [(4'hb):(1'h0)] reg181 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg173 = (1'h0);
  reg [(3'h7):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  assign y = {wire182,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire171,
                 wire170,
                 wire169,
                 wire133,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire135,
                 wire136,
                 wire167,
                 reg181,
                 reg180,
                 reg173,
                 reg172,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg51 <= $unsigned(wire48[(3'h4):(3'h4)]);
      reg52 <= $unsigned(($signed((~&reg51[(3'h6):(1'h1)])) | $unsigned((!$unsigned(wire47)))));
      reg53 <= (((~|((wire48 ? reg52 : wire47) > $unsigned(wire47))) ?
              (!($unsigned((8'h9c)) ?
                  (+(8'hb2)) : (wire50 ?
                      reg52 : (8'hb0)))) : reg52[(1'h0):(1'h0)]) ?
          (8'hbf) : (-reg51));
      reg54 <= wire47[(5'h12):(4'hb)];
    end
  always
    @(posedge clk) begin
      reg55 <= wire50;
      reg56 <= $unsigned($unsigned($signed($unsigned(reg51[(3'h4):(2'h2)]))));
      if (($signed((reg56[(1'h0):(1'h0)] != reg56)) == ($unsigned((~^(wire48 ?
          reg56 : wire50))) != {((reg53 ? wire49 : (7'h41)) - reg54),
          $unsigned($signed(reg56))})))
        begin
          reg57 <= reg53[(4'hd):(4'hc)];
          reg58 <= wire49[(3'h6):(3'h4)];
          reg59 <= $unsigned((wire48 + $unsigned(reg56)));
        end
      else
        begin
          reg57 <= wire49[(3'h4):(1'h1)];
          reg58 <= reg59;
          reg59 <= (8'ha0);
          if (reg55[(3'h6):(1'h1)])
            begin
              reg60 <= reg52;
              reg61 <= ($signed((~reg56[(3'h4):(3'h4)])) ^ ((&($unsigned(reg60) ?
                      (reg57 <<< (8'ha2)) : $unsigned((8'h9d)))) ?
                  $signed($signed($signed(reg60))) : (|$unsigned((wire48 ?
                      (8'hbf) : reg51)))));
            end
          else
            begin
              reg60 <= {(($signed({reg58}) ?
                      $unsigned((wire49 ? reg58 : wire49)) : {(reg58 <= reg61),
                          $signed((8'hbb))}) || ($unsigned(((7'h40) >= reg61)) ?
                      (wire50 ?
                          $unsigned(reg58) : (+reg57)) : (reg58[(3'h7):(1'h0)] ^ wire47)))};
            end
        end
    end
  assign wire62 = $signed(reg55);
  assign wire63 = (~&reg60[(4'h9):(4'h8)]);
  assign wire64 = ($unsigned({((reg57 ?
                          (8'hb8) : (8'had)) || (reg56 <<< wire50)),
                      reg58[(5'h10):(4'he)]}) ~^ reg56[(4'h9):(4'h8)]);
  assign wire65 = (wire50 ~^ reg57);
  module66 #() modinst134 (.wire70(reg54), .wire67(wire49), .wire68(wire65), .clk(clk), .wire69(wire62), .y(wire133));
  assign wire135 = ($signed(({{reg56, reg53}} - $signed($unsigned(wire63)))) ?
                       $unsigned($signed(reg59)) : ($unsigned($signed(reg57[(3'h6):(3'h5)])) > ($unsigned((reg58 ?
                               wire50 : reg59)) ?
                           {$signed((8'haf)), (^wire62)} : $unsigned(reg58))));
  assign wire136 = $unsigned(wire47[(5'h13):(1'h0)]);
  module137 #() modinst168 (.wire141(reg52), .wire138(wire64), .clk(clk), .wire139(wire136), .wire140(reg54), .y(wire167), .wire142(wire48));
  assign wire169 = (^~($unsigned(wire65) >> $unsigned(reg61[(2'h2):(2'h2)])));
  assign wire170 = $signed((wire49[(2'h3):(2'h3)] ?
                       (-((wire49 ?
                           reg56 : reg58) ~^ (8'h9e))) : $signed(reg52[(3'h5):(2'h2)])));
  assign wire171 = $unsigned((~|$unsigned(($signed(reg57) < $signed(reg52)))));
  always
    @(posedge clk) begin
      reg172 <= (|$signed(wire50));
      reg173 <= wire167[(3'h5):(2'h2)];
    end
  assign wire174 = wire48;
  assign wire175 = $signed(reg59);
  assign wire176 = ({$signed(($unsigned(wire136) ?
                           wire65 : wire174[(3'h5):(1'h0)])),
                       (8'ha1)} && (wire175[(4'hb):(4'ha)] ?
                       $signed(((wire175 ?
                           reg56 : reg60) ^ (reg55 & wire169))) : reg56[(4'hf):(4'h9)]));
  assign wire177 = ($unsigned(wire50) ?
                       $unsigned((!wire136[(4'hc):(4'hc)])) : $signed({((wire49 >= reg58) ?
                               reg59[(1'h0):(1'h0)] : ((8'hbb) ?
                                   reg173 : wire133))}));
  assign wire178 = ($unsigned((wire175[(4'hf):(4'h8)] ?
                       reg59 : wire47[(1'h0):(1'h0)])) | $signed((!(8'h9e))));
  assign wire179 = {((!$unsigned(wire136)) ?
                           $signed(reg51[(3'h5):(2'h3)]) : {((8'hbb) ?
                                   (wire50 ? (8'haf) : wire63) : (|wire136))})};
  always
    @(posedge clk) begin
      reg180 <= $signed((|$unsigned($signed(wire63[(4'h8):(3'h4)]))));
      reg181 <= reg58;
    end
  assign wire182 = {(reg172 <<< $unsigned((8'ha7)))};
endmodule

module module5
#(parameter param43 = (^({(((8'ha9) << (8'haf)) <<< {(8'hb1)}), ((~&(8'ha6)) ? {(8'h9d)} : (~|(8'hbd)))} + (!(7'h40)))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire25,
                 wire12,
                 wire11,
                 reg42,
                 reg41,
                 reg40,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire11 = wire6[(4'ha):(2'h2)];
  assign wire12 = {(-wire8)};
  module13 #() modinst26 (.wire16(wire6), .clk(clk), .y(wire25), .wire14(wire12), .wire15(wire10), .wire17(wire11));
  always
    @(posedge clk) begin
      reg27 <= (~^wire7[(3'h6):(3'h5)]);
      if (($unsigned((8'hab)) ? wire9[(1'h1):(1'h0)] : wire25[(4'hf):(4'he)]))
        begin
          reg28 <= wire6;
        end
      else
        begin
          if ((8'hb4))
            begin
              reg28 <= (wire12 ?
                  $signed($unsigned($signed((~&wire7)))) : ({$unsigned(wire25[(3'h6):(2'h3)])} ?
                      (&({(8'ha3),
                          wire11} >>> wire10)) : {wire7[(5'h13):(1'h1)],
                          reg27}));
              reg29 <= $signed($signed((reg27[(3'h5):(3'h4)] | ((wire6 * reg27) ?
                  ((8'hbc) * reg27) : ((8'hbc) ? wire8 : wire6)))));
              reg30 <= $signed(($unsigned(reg27[(5'h11):(4'hf)]) ?
                  reg29 : wire8[(2'h3):(1'h0)]));
              reg31 <= $signed($signed(($signed((~^wire25)) >> (wire25[(5'h11):(4'he)] << reg27))));
            end
          else
            begin
              reg28 <= $unsigned($signed(reg30[(1'h1):(1'h0)]));
              reg29 <= $unsigned($unsigned((^~($unsigned(wire6) ?
                  (-reg28) : $signed(wire9)))));
              reg30 <= (wire9 ? reg29[(4'ha):(4'h8)] : reg30);
              reg31 <= ($unsigned((($unsigned(wire12) || (~wire25)) - reg27)) >= reg30[(3'h6):(2'h2)]);
            end
          reg32 <= ($signed(wire12[(1'h1):(1'h1)]) >>> (~wire8[(1'h0):(1'h0)]));
          reg33 <= {{wire8[(3'h5):(2'h3)],
                  ((~|$signed((8'ha5))) - ((wire10 ^~ reg29) ^ $unsigned(wire12)))},
              wire10[(1'h1):(1'h0)]};
          reg34 <= {wire10[(1'h1):(1'h0)],
              (-$signed(((wire6 ? wire6 : wire11) ?
                  (wire10 ? reg28 : wire10) : (~wire10))))};
        end
      reg35 <= $signed(wire7[(1'h1):(1'h1)]);
    end
  assign wire36 = ($unsigned((($signed(wire11) >>> (^wire7)) < ((8'hb2) ?
                          $unsigned(reg31) : wire12))) ?
                      {wire7[(5'h14):(3'h6)],
                          reg29[(5'h11):(4'hc)]} : $signed(reg31[(3'h7):(3'h6)]));
  assign wire37 = ((+$signed((((8'h9e) ? reg33 : wire11) ?
                      {(7'h42), (8'ha5)} : $unsigned(wire6)))) || ({((reg30 ?
                              wire8 : wire12) ?
                          wire12[(3'h6):(3'h4)] : (-wire7)),
                      $unsigned($unsigned(wire12))} * wire7));
  assign wire38 = wire36[(4'hb):(4'h8)];
  assign wire39 = $signed(({reg28} ? reg34 : reg28[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg40 <= $signed(($signed(wire7) ?
          ((~(wire9 ? reg35 : reg29)) >>> ($unsigned(reg30) * (wire37 ?
              wire38 : wire25))) : {wire11,
              ((wire38 < reg27) ? (~&reg31) : (7'h41))}));
      reg41 <= ($signed(reg29) ^ ((^~($signed(wire9) ?
              wire11 : wire9[(3'h4):(2'h2)])) ?
          reg28[(2'h3):(1'h1)] : (reg40 && $signed($signed(reg40)))));
      reg42 <= (8'ha6);
    end
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire signed [(2'h2):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire18;
  assign y = {wire24, wire23, wire22, wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = wire14;
  assign wire19 = $signed((wire16[(2'h2):(1'h1)] <<< $unsigned($unsigned($unsigned(wire16)))));
  assign wire20 = (^$unsigned($unsigned($unsigned((wire18 ?
                      wire16 : wire19)))));
  assign wire21 = (!(^($signed(wire20) ?
                      (wire20[(2'h3):(2'h3)] ^~ $signed((8'h9c))) : (!(wire17 ?
                          wire15 : wire17)))));
  assign wire22 = {((-(wire18[(4'ha):(3'h6)] ?
                          $unsigned(wire14) : $signed(wire15))) | $signed((!(wire14 * (7'h43))))),
                      wire20};
  assign wire23 = (((wire16 << wire21[(3'h4):(2'h2)]) ?
                          $signed($unsigned($signed(wire19))) : {(wire19 ?
                                  (wire19 >> wire20) : {(8'hab)})}) ?
                      $unsigned($signed(wire17[(1'h1):(1'h0)])) : ((!$signed(wire14[(3'h4):(1'h1)])) ^ {(^~wire17[(4'h9):(4'h9)])}));
  assign wire24 = (wire18[(1'h0):(1'h0)] || (((~^(~(8'hb9))) | (wire16[(2'h2):(1'h0)] < {wire18})) ?
                      ((wire14[(2'h2):(1'h1)] ? (wire18 || wire16) : wire14) ?
                          ($signed(wire14) ?
                              $signed((8'hbc)) : {wire14}) : wire15) : ($signed((8'ha4)) && wire15)));
endmodule

module module137
#(parameter param166 = {((~^{((8'had) ? (7'h40) : (8'h9d)), ((8'hb9) ? (8'ha1) : (7'h41))}) ? ((((8'hb1) ? (7'h44) : (8'hb3)) || ((8'hba) ? (8'hb6) : (8'hb2))) < ((|(8'ha9)) >>> ((8'h9d) <<< (8'ha8)))) : ((((8'h9f) ~^ (8'hbb)) == ((8'ha0) ~^ (8'hb7))) | ((~^(8'ha6)) ? (^~(8'hbc)) : ((8'ha3) ? (7'h42) : (8'hb2)))))})
(y, clk, wire142, wire141, wire140, wire139, wire138);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire142;
  input wire [(2'h2):(1'h0)] wire141;
  input wire [(3'h6):(1'h0)] wire140;
  input wire [(4'h8):(1'h0)] wire139;
  input wire [(3'h7):(1'h0)] wire138;
  wire [(3'h5):(1'h0)] wire165;
  wire signed [(3'h6):(1'h0)] wire144;
  wire signed [(4'hd):(1'h0)] wire143;
  reg [(4'ha):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg163 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(4'he):(1'h0)] reg160 = (1'h0);
  reg [(4'he):(1'h0)] reg159 = (1'h0);
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg156 = (1'h0);
  reg [(5'h15):(1'h0)] reg155 = (1'h0);
  reg [(3'h5):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(5'h13):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  assign y = {wire165,
                 wire144,
                 wire143,
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
                 reg145,
                 (1'h0)};
  assign wire143 = wire142;
  assign wire144 = $signed(({{$unsigned(wire142),
                           (-wire139)}} + wire143[(4'hb):(3'h6)]));
  always
    @(posedge clk) begin
      reg145 <= wire140;
      reg146 <= $signed(($unsigned(wire139) >> $signed({$signed(wire139),
          wire139})));
    end
  always
    @(posedge clk) begin
      reg147 <= wire139[(4'h8):(2'h2)];
      if (((!$unsigned(((wire139 ? wire140 : wire138) ?
              wire141 : $signed(wire141)))) ?
          $signed($unsigned($unsigned(reg147))) : wire138[(3'h7):(3'h6)]))
        begin
          if ($unsigned((reg147[(4'hb):(1'h1)] ?
              (($signed(reg145) ? (wire142 ~^ wire141) : (7'h43)) ?
                  $unsigned(wire144[(1'h1):(1'h1)]) : ($signed(wire143) ?
                      $signed(wire141) : $signed(wire144))) : (wire141 + (-(wire142 <<< (7'h41)))))))
            begin
              reg148 <= ((|{{reg146}, $signed((8'haf))}) ?
                  $unsigned((8'hb2)) : wire143[(4'hd):(2'h3)]);
              reg149 <= ($unsigned(reg146[(4'hb):(3'h6)]) ^ ($unsigned($signed((reg145 ?
                  reg146 : wire143))) << $signed(((8'hb2) * (^wire139)))));
            end
          else
            begin
              reg148 <= (($unsigned({(reg145 | reg146),
                      (+wire144)}) - (((reg149 <<< (8'hb8)) ?
                          wire141 : $unsigned(reg147)) ?
                      reg147[(4'hb):(1'h1)] : ($unsigned((8'ha7)) <= ((8'hbe) ?
                          reg146 : wire144)))) ?
                  $signed((~|($signed(wire138) >>> (&reg146)))) : (!$unsigned((wire143 < $unsigned(wire144)))));
              reg149 <= (((~|wire141) ?
                  (~^((wire140 ?
                      wire141 : reg147) || {wire140})) : (reg145[(1'h0):(1'h0)] ?
                      ((8'hb9) ?
                          {reg147,
                              wire144} : wire139) : (^~wire141))) | ($signed(reg149[(3'h6):(3'h6)]) > (&$unsigned($unsigned(wire142)))));
              reg150 <= ($signed((^~wire144[(3'h4):(1'h0)])) ?
                  (8'haf) : (reg148[(4'hc):(4'hc)] ?
                      (reg149[(2'h2):(1'h1)] || $unsigned($unsigned(wire138))) : $signed((!$signed(wire144)))));
              reg151 <= $signed(reg148[(4'hc):(1'h0)]);
            end
          reg152 <= $unsigned((reg147[(1'h0):(1'h0)] ?
              $unsigned((+reg145[(1'h1):(1'h0)])) : (reg148[(4'hc):(2'h2)] <= wire139[(3'h4):(1'h1)])));
          if (reg146[(4'hc):(2'h3)])
            begin
              reg153 <= reg150[(1'h1):(1'h0)];
              reg154 <= $unsigned({$signed((+(wire138 ~^ reg146))),
                  ({$unsigned(wire142), ((8'h9c) ? reg145 : reg146)} ?
                      $signed((8'hb2)) : $signed(((8'hb4) ?
                          reg150 : wire141)))});
              reg155 <= wire138[(2'h2):(1'h1)];
              reg156 <= reg148[(4'ha):(3'h4)];
            end
          else
            begin
              reg153 <= $signed({$signed(reg152),
                  ((((8'hb4) != reg153) <= $unsigned(reg149)) ?
                      wire141[(1'h1):(1'h1)] : reg147)});
            end
          reg157 <= ((($signed($signed(reg146)) | (^~reg149[(5'h10):(4'ha)])) ?
                  reg148 : (wire144[(3'h4):(1'h1)] ?
                      (~^$signed(reg155)) : $signed(wire142[(2'h2):(1'h1)]))) ?
              (~reg150[(4'h9):(2'h3)]) : (~^((reg153 >>> wire140) ?
                  ((~reg147) ^ (reg149 - wire138)) : (reg150 ^~ $unsigned(wire142)))));
        end
      else
        begin
          reg148 <= reg152[(4'hb):(4'h9)];
          if ($signed({(~(^$unsigned(reg151))),
              ($unsigned(((8'hb0) <= wire142)) != ($unsigned(reg147) && $signed(reg149)))}))
            begin
              reg149 <= wire142[(3'h6):(1'h1)];
              reg150 <= $signed($unsigned(wire140));
              reg151 <= $unsigned((8'hb0));
              reg152 <= $signed($unsigned($unsigned(({reg147, reg150} ?
                  (~&wire141) : $signed(wire142)))));
            end
          else
            begin
              reg149 <= ($unsigned((+($signed(wire140) ?
                  wire140 : ((8'ha0) < wire142)))) > (reg152[(4'ha):(1'h0)] ?
                  ((!reg150[(1'h1):(1'h1)]) ?
                      (wire138[(3'h4):(1'h0)] * reg149[(1'h0):(1'h0)]) : reg145[(4'hc):(3'h4)]) : ((wire138 == reg148[(2'h3):(2'h3)]) ^~ (reg150 >>> reg152[(4'hd):(3'h4)]))));
              reg150 <= ({reg147,
                  $unsigned($signed($signed(wire144)))} == reg154[(3'h4):(2'h3)]);
              reg151 <= {($signed(reg156) ?
                      (wire141[(2'h2):(1'h0)] ?
                          wire144[(3'h6):(3'h4)] : $signed($unsigned(reg153))) : reg146[(4'hb):(3'h6)])};
              reg152 <= {(($unsigned(((8'ha4) ? wire139 : (8'ha8))) ?
                          ($signed(reg157) == (reg153 ?
                              reg155 : reg150)) : (reg152 >>> reg147)) ?
                      (wire140 ?
                          $signed(reg150[(1'h1):(1'h0)]) : ((wire140 && reg156) ?
                              (reg147 | reg154) : (8'hb2))) : reg147[(4'hc):(1'h0)]),
                  {$signed((wire140[(2'h2):(2'h2)] || reg155))}};
              reg153 <= {{(reg145[(3'h7):(3'h4)] ?
                          reg152[(5'h10):(4'hf)] : $unsigned($unsigned((7'h44))))}};
            end
        end
      if ((|(^~{$unsigned((reg150 | reg149))})))
        begin
          if ($signed(((reg154 ?
                  ((reg148 || wire142) ?
                      reg146 : $signed(reg150)) : ($unsigned(wire139) ?
                      $signed(reg152) : $signed(wire142))) ?
              reg149 : {(~&$unsigned(reg153)), reg149[(3'h6):(3'h5)]})))
            begin
              reg158 <= wire138;
            end
          else
            begin
              reg158 <= ($signed(($signed($unsigned(reg153)) ?
                      wire142[(4'ha):(3'h6)] : $signed((wire142 ?
                          wire141 : wire140)))) ?
                  ((reg155 ?
                      (reg145[(4'hb):(3'h6)] ?
                          ((8'ha4) ? (8'hb7) : reg157) : {reg147,
                              reg150}) : reg149) || (&$unsigned($signed(wire140)))) : (($unsigned(wire144) < reg149) << reg150[(4'h9):(3'h4)]));
              reg159 <= $signed(wire143);
              reg160 <= (~^$unsigned($signed($unsigned(reg158))));
              reg161 <= (8'ha0);
              reg162 <= $signed({(8'hb4)});
            end
          reg163 <= reg158[(4'h8):(2'h3)];
        end
      else
        begin
          reg158 <= reg145;
          reg159 <= ($unsigned($unsigned($signed((^~wire144)))) >>> reg157);
          reg160 <= $signed(wire139[(2'h3):(1'h0)]);
        end
      reg164 <= wire144[(2'h3):(2'h3)];
    end
  assign wire165 = reg145[(5'h10):(3'h7)];
endmodule

module module66  (y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h348):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire70;
  input wire [(5'h10):(1'h0)] wire69;
  input wire signed [(5'h12):(1'h0)] wire68;
  input wire signed [(4'hf):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire132;
  wire signed [(5'h13):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire126;
  wire [(3'h7):(1'h0)] wire125;
  wire [(3'h5):(1'h0)] wire122;
  wire [(4'hf):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(5'h15):(1'h0)] wire103;
  wire [(5'h13):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire100;
  wire signed [(4'hf):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire71;
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(4'hc):(1'h0)] reg129 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  assign y = {wire132,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire122,
                 wire121,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire72,
                 wire71,
                 reg131,
                 reg130,
                 reg129,
                 reg124,
                 reg123,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
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
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire71 = $unsigned(wire69[(4'hf):(1'h1)]);
  assign wire72 = (8'hab);
  always
    @(posedge clk) begin
      reg73 <= ((8'hb2) ?
          ((wire69[(5'h10):(4'h9)] ?
              ((wire70 ~^ (8'hb5)) == $signed(wire71)) : (wire69 < wire69)) >>> {(|(wire71 ?
                  wire72 : (8'hb9))),
              $signed((wire71 * wire68))}) : (~^(~^$unsigned($unsigned(wire72)))));
      if (wire72)
        begin
          if ((wire71[(2'h2):(1'h1)] ?
              {((8'h9e) > wire71), {{wire69}}} : wire72[(4'hd):(3'h5)]))
            begin
              reg74 <= wire72;
              reg75 <= (({wire68,
                  wire71} - {$unsigned($signed(reg74))}) > $signed((wire69[(4'hf):(4'hb)] ?
                  $unsigned(wire68[(4'hd):(1'h1)]) : $signed((wire69 != wire67)))));
            end
          else
            begin
              reg74 <= (reg75 >>> wire69[(4'hf):(3'h4)]);
              reg75 <= reg75;
              reg76 <= wire72[(4'ha):(3'h4)];
              reg77 <= ((reg75 ?
                      reg74[(4'hb):(4'ha)] : {($unsigned(wire67) ?
                              (reg74 ? wire69 : reg75) : reg73)}) ?
                  ((wire67 ~^ wire70) ?
                      (+(~|{wire70})) : $unsigned((-(-wire69)))) : (wire68[(4'hd):(3'h7)] <= (!(^~((8'ha0) == reg75)))));
            end
          if (((~^((-wire69) ^~ $signed($signed((8'hbb))))) << $signed($unsigned($signed((&wire70))))))
            begin
              reg78 <= (reg75[(4'h8):(2'h2)] < $signed((wire68 ~^ $unsigned({(8'ha3),
                  reg74}))));
              reg79 <= $unsigned({($unsigned($signed(reg74)) ?
                      {wire67[(4'h8):(3'h6)]} : $signed((reg75 ?
                          (8'ha0) : wire70)))});
              reg80 <= (^~$unsigned((-$signed((wire67 && wire72)))));
            end
          else
            begin
              reg78 <= $signed((8'ha0));
              reg79 <= wire69;
            end
          reg81 <= (^~reg79);
          reg82 <= $unsigned(reg79[(1'h0):(1'h0)]);
        end
      else
        begin
          reg74 <= reg82;
          reg75 <= {(+$signed((-$signed(reg73)))),
              (reg73[(1'h1):(1'h0)] + $unsigned(wire72))};
          reg76 <= (~^(^(reg81 == reg75)));
          reg77 <= ((reg75 ?
                  (((wire71 == (8'hb8)) - reg74[(4'hb):(4'h9)]) ?
                      (reg79 ?
                          $signed(reg76) : wire70[(3'h6):(1'h0)]) : reg82) : $unsigned($signed($unsigned(reg75)))) ?
              (!reg77) : reg77);
          if ((wire71[(2'h3):(2'h2)] != (wire69[(5'h10):(3'h4)] <= wire67)))
            begin
              reg78 <= wire70[(5'h12):(4'h9)];
              reg79 <= $unsigned(wire72[(2'h3):(1'h1)]);
              reg80 <= reg76;
              reg81 <= reg81;
            end
          else
            begin
              reg78 <= ((reg76 ?
                      reg77[(1'h1):(1'h0)] : ($signed($signed(wire69)) ?
                          wire68[(2'h2):(2'h2)] : $unsigned(reg75))) ?
                  ($signed($unsigned((!wire71))) ?
                      reg76[(3'h4):(3'h4)] : ($unsigned(reg74) ?
                          (wire67[(4'ha):(3'h5)] <= {reg82}) : ((~&(8'ha0)) || wire70))) : wire70[(5'h13):(5'h10)]);
            end
        end
      reg83 <= (((&reg80[(1'h0):(1'h0)]) ?
          ((^((8'ha8) ? reg77 : wire72)) ?
              reg81[(1'h0):(1'h0)] : reg76[(3'h4):(2'h2)]) : (~|reg81)) * $unsigned((~&$signed({wire68}))));
      reg84 <= ($signed($signed((7'h43))) & ((~&(~^(wire71 ?
          reg82 : wire67))) & $signed((|(reg80 ? reg76 : reg81)))));
    end
  always
    @(posedge clk) begin
      reg85 <= (reg74[(4'he):(3'h5)] + (^wire67));
    end
  always
    @(posedge clk) begin
      reg86 <= ($unsigned(($unsigned((reg82 ? (8'haf) : reg83)) ?
          reg76 : $unsigned($signed(reg84)))) <<< reg78[(4'ha):(2'h3)]);
      reg87 <= ($signed($unsigned(reg84[(1'h1):(1'h0)])) ?
          ($signed((reg83 || (^reg75))) ?
              (reg78[(4'h9):(2'h3)] ?
                  reg73[(3'h7):(3'h6)] : reg74) : wire71) : ((({reg81,
                  wire68} << (reg86 || wire70)) ?
              reg82[(3'h4):(2'h2)] : wire69) == (&$unsigned((~reg84)))));
      reg88 <= (~($unsigned(reg78) || (~|(-$signed(reg73)))));
      if (($unsigned(reg87[(3'h6):(2'h3)]) || $unsigned((~|$unsigned(wire70)))))
        begin
          if (((((+(reg82 ? (8'hb5) : wire69)) >> ((|reg73) >= wire70)) ?
                  reg77 : $signed({((8'ha5) ? reg86 : reg74)})) ?
              (reg73[(1'h0):(1'h0)] ?
                  reg81 : {{(reg76 && reg80)}}) : $signed(reg77[(3'h5):(1'h0)])))
            begin
              reg89 <= (^~(reg80 ? (^~(8'hbb)) : reg80[(5'h12):(4'h9)]));
              reg90 <= $signed($unsigned({reg89[(3'h6):(1'h1)],
                  ($unsigned(reg81) ? (8'hbd) : (~^(8'ha9)))}));
            end
          else
            begin
              reg89 <= reg85[(3'h6):(3'h5)];
              reg90 <= ({reg75} ^~ ($unsigned({$unsigned((7'h40)),
                      {reg84, reg87}}) ?
                  $signed($signed((^reg85))) : (wire71[(4'he):(4'hc)] ?
                      reg76 : ((~^wire71) ^ reg83[(4'hd):(1'h1)]))));
            end
          reg91 <= $signed((+(wire71[(2'h3):(2'h3)] ?
              ({reg89} ? (wire71 ? reg74 : (8'hbf)) : {wire70}) : ((8'haf) ?
                  (^~(8'ha3)) : (reg81 < reg89)))));
        end
      else
        begin
          if ((reg81 != reg85[(3'h4):(2'h3)]))
            begin
              reg89 <= $unsigned(reg79);
              reg90 <= reg84[(2'h3):(2'h2)];
              reg91 <= (-wire68);
              reg92 <= reg73[(1'h1):(1'h0)];
              reg93 <= ((reg86[(3'h5):(1'h1)] > $signed($unsigned((reg88 ?
                  (7'h40) : reg82)))) ^~ (reg88[(1'h1):(1'h0)] ?
                  ((reg82 ? ((8'haa) ^~ reg92) : (reg75 && reg76)) ?
                      (~|(~&reg85)) : (8'ha5)) : (|(^wire71[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg89 <= reg86[(4'he):(1'h1)];
            end
          if ((({reg75, $unsigned($signed(reg79))} || {$unsigned({wire72,
                  reg78}),
              reg88[(2'h2):(1'h1)]}) <= ($unsigned(reg79[(2'h2):(2'h2)]) && ($signed({reg77}) ^ (+{reg88,
              reg77})))))
            begin
              reg94 <= reg90;
              reg95 <= reg78[(1'h0):(1'h0)];
              reg96 <= ($unsigned((7'h42)) ?
                  ($unsigned($unsigned({reg86, (8'hba)})) ?
                      $signed(reg79[(1'h0):(1'h0)]) : {{{reg88},
                              (^reg88)}}) : reg84);
              reg97 <= $unsigned((8'hbc));
            end
          else
            begin
              reg94 <= {$unsigned({(reg90 ?
                          wire68[(4'hf):(3'h4)] : (wire69 ? wire72 : reg91))})};
              reg95 <= (~(($signed($unsigned(reg75)) ^ reg86) ?
                  reg88[(4'h8):(3'h5)] : ((!$unsigned(wire72)) ?
                      reg87 : $signed($signed(wire67)))));
              reg96 <= $unsigned($unsigned((&$signed($unsigned(reg85)))));
              reg97 <= ((^~({$signed(reg88)} >> (reg77[(1'h0):(1'h0)] | $unsigned((8'h9d))))) ?
                  (reg94[(2'h2):(2'h2)] <= ((reg96[(4'hb):(4'h8)] ?
                      reg94 : $unsigned(wire70)) && {(reg89 ^~ (8'h9d)),
                      (reg77 >= reg95)})) : ((($unsigned(reg87) ?
                      (reg91 ?
                          (7'h43) : (8'hb6)) : (^reg83)) ~^ $signed((reg93 && (8'ha4)))) >= $signed(($unsigned(reg93) ?
                      reg75 : $signed(reg88)))));
            end
          reg98 <= (~^$unsigned(reg89[(4'hb):(4'hb)]));
          reg99 <= $unsigned($unsigned($unsigned((!reg74))));
        end
    end
  assign wire100 = (reg78 ?
                       ($signed(((wire69 ? wire72 : reg83) ?
                           (reg99 & reg95) : (reg89 ?
                               wire71 : wire69))) >= (8'hba)) : ((reg74[(1'h1):(1'h0)] ?
                           $unsigned((~^reg74)) : reg98) || $signed((~^reg74[(4'h9):(4'h9)]))));
  assign wire101 = reg77;
  assign wire102 = reg93;
  assign wire103 = (((reg74[(3'h6):(2'h2)] ?
                       ((reg92 ? (8'hb6) : reg88) ?
                           (reg83 ?
                               wire100 : wire72) : {reg88}) : $signed($unsigned((8'h9d)))) | (8'ha9)) == (((|$signed(reg92)) ?
                       wire100[(1'h1):(1'h1)] : $signed(reg81[(3'h4):(2'h3)])) == reg99[(5'h10):(4'hd)]));
  assign wire104 = wire71;
  assign wire105 = {reg81[(2'h3):(1'h0)], {(|$unsigned(reg86))}};
  assign wire106 = $unsigned((~(|$unsigned(reg74))));
  always
    @(posedge clk) begin
      if ((^~((~$unsigned((|wire70))) ?
          (~$unsigned(wire103[(1'h0):(1'h0)])) : wire104[(1'h0):(1'h0)])))
        begin
          reg107 <= {reg95[(2'h3):(2'h3)], reg77};
        end
      else
        begin
          reg107 <= $unsigned(reg75);
          reg108 <= (wire69 ?
              reg91 : $unsigned((|$unsigned(((7'h41) ? reg99 : wire102)))));
          reg109 <= $unsigned(wire104[(3'h5):(2'h3)]);
          reg110 <= (^$signed($signed(((wire105 ? wire100 : reg108) ?
              $signed(reg75) : (reg90 ? wire71 : reg73)))));
          reg111 <= (wire100[(4'h8):(1'h0)] == (~|wire72));
        end
    end
  always
    @(posedge clk) begin
      if (($unsigned($signed((reg92 ?
          (reg84 ?
              reg87 : reg84) : (&(8'hb3))))) >>> ((^wire69[(3'h4):(3'h4)]) >= $unsigned($signed($unsigned((8'ha4)))))))
        begin
          reg112 <= ((((wire70 < $signed(reg98)) ?
                      reg75[(1'h1):(1'h1)] : $unsigned(wire71[(4'ha):(3'h4)])) ?
                  $signed(($unsigned(wire71) >>> $unsigned(wire102))) : wire72) ?
              ((^$unsigned(reg73[(3'h5):(1'h1)])) ?
                  $signed(reg79[(1'h1):(1'h0)]) : (-{{(8'hb1)},
                      (reg86 != wire104)})) : ((reg85[(1'h0):(1'h0)] ?
                  wire106[(4'hb):(2'h2)] : ((wire72 ?
                      (8'haa) : reg80) <= {wire104})) | ($unsigned($signed((8'hb0))) ?
                  ($unsigned(reg76) - (reg79 >= reg85)) : $signed(reg77[(3'h4):(1'h0)]))));
        end
      else
        begin
          reg112 <= wire71[(4'h8):(1'h0)];
          reg113 <= reg96[(4'h8):(3'h6)];
          if (reg89[(4'hb):(1'h1)])
            begin
              reg114 <= ((reg73 ?
                  $unsigned(reg80[(3'h7):(2'h3)]) : {{$unsigned(reg78),
                          (reg91 ?
                              wire72 : reg86)}}) || (($signed((reg86 <= wire104)) + ((reg108 ?
                          reg89 : reg98) ?
                      (reg95 - reg92) : $unsigned(wire69))) ?
                  wire72 : (&$signed((!wire100)))));
            end
          else
            begin
              reg114 <= reg88[(3'h4):(2'h2)];
              reg115 <= (8'ha3);
              reg116 <= (~|(($unsigned(((8'ha9) <<< reg83)) ?
                      $signed((wire68 ?
                          reg107 : reg115)) : (wire72[(4'hb):(4'hb)] | (+reg108))) ?
                  {{{wire100, wire101}},
                      (reg75[(3'h5):(2'h2)] != (7'h40))} : reg74));
            end
          reg117 <= (({{(~reg97)}, $signed((wire106 ? wire70 : reg86))} ?
                  $unsigned($signed(reg93[(3'h4):(2'h3)])) : ($unsigned((reg111 ?
                          reg86 : reg78)) ?
                      {{reg109, wire69}} : $unsigned((+wire106)))) ?
              ((reg73[(2'h3):(1'h0)] & (~|reg109)) ?
                  wire72[(4'hf):(3'h7)] : reg97[(3'h7):(1'h1)]) : ({$unsigned((reg92 ?
                          (8'hab) : reg89)),
                      $signed((wire106 ? wire101 : reg115))} ?
                  (-({(8'ha7), wire102} ?
                      reg79[(2'h3):(2'h2)] : reg116)) : (~&wire100)));
          if ($signed(reg88))
            begin
              reg118 <= (reg73[(2'h3):(2'h2)] ?
                  reg87 : (&wire101[(1'h0):(1'h0)]));
              reg119 <= (7'h44);
            end
          else
            begin
              reg118 <= reg111;
              reg119 <= $signed(reg119[(3'h5):(3'h5)]);
              reg120 <= (~(+$signed(((reg83 ? (8'ha3) : wire67) ?
                  reg92 : {reg109}))));
            end
        end
    end
  assign wire121 = wire105;
  assign wire122 = (wire105[(4'ha):(3'h7)] ?
                       {(^~{$signed(reg107)}),
                           reg92[(1'h1):(1'h0)]} : {wire121});
  always
    @(posedge clk) begin
      reg123 <= $signed({($signed({reg78}) ?
              $signed((reg76 ? reg91 : reg110)) : ((~(8'hba)) >= (reg96 ?
                  (8'hb3) : (8'ha8))))});
      reg124 <= reg83;
    end
  assign wire125 = $unsigned((^~$unsigned($signed(reg76))));
  assign wire126 = ((~^(($unsigned(reg80) >> (~|reg79)) ~^ (reg92[(2'h2):(2'h2)] * (wire69 || reg113)))) ?
                       wire104 : (reg92 ~^ $signed((~|reg99))));
  assign wire127 = reg117;
  assign wire128 = $signed((-({$unsigned(reg88)} ^~ $unsigned((~&wire72)))));
  always
    @(posedge clk) begin
      reg129 <= (((~^$signed((reg85 ? reg112 : reg90))) ?
              wire122[(1'h0):(1'h0)] : (wire128[(5'h13):(4'hf)] ?
                  wire101[(4'ha):(1'h1)] : ((^reg86) <= (wire106 || reg76)))) ?
          $unsigned(wire105[(3'h5):(1'h1)]) : ((($unsigned(reg81) << (~&reg113)) ?
              {(~|(7'h41)), $signed((8'hb3))} : $unsigned((wire101 ?
                  wire67 : (8'hbd)))) > $signed($signed(reg124[(4'h9):(3'h7)]))));
      reg130 <= (reg124[(4'hd):(4'hc)] ^ reg116);
      reg131 <= reg88[(2'h3):(2'h3)];
    end
  assign wire132 = wire125;
endmodule
