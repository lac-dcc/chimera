module top
#(parameter param151 = (({((|(8'hae)) ? ((8'hb8) ^~ (8'h9c)) : ((8'haf) ? (8'haf) : (8'hba))), (((8'ha7) ? (8'ha5) : (8'h9d)) ? (~(8'ha1)) : (^(8'hb7)))} ? ({((8'hb3) ? (8'hb1) : (8'hb4))} ? ((&(8'ha5)) ? (!(8'ha1)) : ((8'ha9) ? (8'hae) : (7'h40))) : (((8'hb5) <= (8'h9f)) + ((8'hb7) ? (8'hb8) : (8'hbc)))) : ((((8'ha7) >>> (7'h44)) < ((7'h41) ? (7'h43) : (8'haf))) ? (((8'ha6) ? (8'hb1) : (8'hb3)) ^ (-(8'h9e))) : ({(7'h42), (8'h9e)} ? ((8'hbf) ^ (8'hb0)) : ((8'haf) && (8'hb5))))) || ((~|((^~(8'hba)) ? ((8'hb3) ? (8'h9e) : (8'haa)) : {(8'had)})) & ((((8'hae) ? (8'haf) : (8'hb1)) ? {(8'h9d), (8'hae)} : ((8'hb1) ? (8'hb0) : (8'haa))) >> ((8'h9c) >>> ((7'h42) ? (8'ha2) : (8'hb3)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire150;
  wire signed [(3'h7):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire148;
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire150,
                 wire62,
                 wire5,
                 wire4,
                 wire148,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (7'h41);
  assign wire5 = $unsigned(((($unsigned((8'ha0)) ?
                         wire2 : (wire2 ? wire0 : wire4)) ?
                     (~|wire3[(2'h2):(2'h2)]) : (wire3[(1'h0):(1'h0)] ^ wire0[(2'h2):(1'h1)])) >>> (^~(wire1 ?
                     ((8'ha7) * (7'h42)) : $signed(wire1)))));
  always
    @(posedge clk) begin
      if ({($unsigned($signed(wire0)) ?
              $unsigned(wire2) : $unsigned($signed((wire3 >= wire2)))),
          {(|$signed($unsigned(wire0))),
              ((wire0 ?
                  ((8'ha4) ? wire4 : wire1) : wire4) >>> (wire4[(2'h2):(2'h2)] ?
                  (wire0 ? wire3 : wire3) : $unsigned(wire4)))}})
        begin
          reg6 <= $signed(wire0[(1'h0):(1'h0)]);
          if ($unsigned({((~&$signed(wire5)) ?
                  wire5 : ((wire4 ? wire5 : wire1) ?
                      {wire1, wire2} : $signed(wire4))),
              $unsigned($signed($signed(wire2)))}))
            begin
              reg7 <= (wire2 & wire1[(3'h5):(1'h0)]);
              reg8 <= ((^~(((wire2 ? wire1 : reg6) ?
                      wire5 : (!reg7)) <<< reg6[(2'h3):(1'h0)])) ?
                  (wire0 ^ (^~$unsigned((^~reg7)))) : wire5);
              reg9 <= (-wire0[(3'h6):(2'h2)]);
            end
          else
            begin
              reg7 <= $unsigned(((((reg9 ? reg6 : wire3) + (wire1 < (8'ha6))) ?
                  $unsigned(wire0[(1'h1):(1'h1)]) : (^~(wire4 ?
                      (8'haf) : wire5))) >= $unsigned(wire3[(2'h2):(1'h0)])));
              reg8 <= $unsigned((^($signed(reg7) <<< {$signed((7'h42))})));
            end
          reg10 <= $unsigned(((((reg7 != reg8) != $signed((7'h42))) ?
                  wire0[(3'h6):(3'h6)] : $signed((~&(7'h44)))) ?
              $unsigned(((wire0 <= wire1) & $signed(wire0))) : (wire5 < wire5[(2'h2):(2'h2)])));
          reg11 <= (reg7 >= $signed(wire1[(1'h1):(1'h1)]));
        end
      else
        begin
          reg6 <= (wire4[(3'h6):(2'h3)] - {(^wire0), wire4[(4'hb):(2'h2)]});
          reg7 <= reg10;
          reg8 <= $signed((reg7 ? reg7[(1'h0):(1'h0)] : reg7[(4'hb):(3'h5)]));
          reg9 <= wire4;
        end
    end
  module12 #() modinst63 (wire62, clk, wire3, reg7, reg8, reg9);
  module64 #() modinst149 (wire148, clk, wire3, wire1, reg9, wire0);
  assign wire150 = {wire4[(5'h10):(4'hf)]};
endmodule

module module64
#(parameter param146 = ((^~(~^{(~(8'hb0)), {(8'hbb), (8'hae)}})) ? {((|{(8'h9c), (8'hb3)}) ? (((8'haf) <= (8'ha7)) ? ((8'hbc) && (8'hb4)) : (^(8'ha7))) : (((8'h9e) ? (8'hbe) : (8'hbe)) * ((8'ha2) ? (8'hbf) : (8'hb8))))} : {((((8'hb9) < (8'hb4)) ? ((8'hbe) ~^ (8'hac)) : (|(8'hbd))) && (((8'hbe) != (8'hb7)) ? ((8'hb6) >> (8'hb5)) : {(8'ha0), (8'hbe)}))}), 
parameter param147 = ((((^param146) <= (8'ha8)) ^ param146) == ((7'h41) - param146)))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire68;
  input wire [(4'he):(1'h0)] wire67;
  input wire [(4'h9):(1'h0)] wire66;
  input wire signed [(5'h13):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire145;
  wire [(5'h11):(1'h0)] wire144;
  wire [(5'h15):(1'h0)] wire131;
  wire [(3'h5):(1'h0)] wire129;
  wire [(5'h13):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire107;
  reg [(5'h15):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(5'h11):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(4'hc):(1'h0)] reg134 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire131,
                 wire129,
                 wire109,
                 wire107,
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
                 (1'h0)};
  module69 #() modinst108 (wire107, clk, wire67, wire66, wire68, wire65);
  assign wire109 = (wire107[(3'h4):(1'h0)] + wire68);
  module110 #() modinst130 (.clk(clk), .wire112(wire107), .wire113(wire65), .wire111(wire68), .wire114(wire109), .y(wire129));
  assign wire131 = (~(wire65 ?
                       ((~^wire107[(4'ha):(4'ha)]) < $signed((~^wire66))) : ($signed($signed((8'hbf))) ?
                           $signed((~&(8'hab))) : wire107)));
  always
    @(posedge clk) begin
      reg132 <= wire129[(1'h1):(1'h1)];
      if ((((($unsigned(wire65) ?
          $unsigned(wire66) : wire66[(1'h0):(1'h0)]) - ((wire66 ?
              wire131 : wire109) ?
          (+reg132) : wire107)) * wire66[(2'h3):(2'h3)]) > ($unsigned(((reg132 <<< wire131) ?
              $signed((8'ha4)) : wire68)) ?
          wire129 : $unsigned((~(^~wire68))))))
        begin
          reg133 <= wire131;
          reg134 <= {$unsigned($signed((~^(!reg132)))),
              $signed(((!wire107) ? wire65 : wire68))};
        end
      else
        begin
          reg133 <= wire129[(1'h1):(1'h0)];
          reg134 <= (~&$unsigned(($unsigned((reg134 || wire68)) | $signed((!reg134)))));
          reg135 <= ((|{((^wire131) >= $unsigned(wire109))}) ?
              wire66 : reg134[(1'h0):(1'h0)]);
          if (($signed({$unsigned((^wire129)),
              $signed($unsigned((8'had)))}) <<< (~|wire131[(5'h11):(2'h3)])))
            begin
              reg136 <= {(wire107 ?
                      $unsigned($signed(reg135)) : $signed(wire109[(2'h2):(1'h1)])),
                  $unsigned((~^(!wire129)))};
              reg137 <= $signed({(^~wire109[(4'hb):(2'h3)]), reg132});
              reg138 <= $unsigned($signed(((7'h41) * $unsigned($unsigned((7'h40))))));
            end
          else
            begin
              reg136 <= (^$signed($unsigned((~^(^~wire107)))));
              reg137 <= $unsigned((8'h9e));
              reg138 <= reg134[(1'h1):(1'h0)];
              reg139 <= $unsigned(((({wire67} ^~ {(8'ha2)}) ?
                      (reg134[(3'h6):(1'h0)] > ((8'ha8) ~^ (8'hb2))) : ({reg138} ?
                          (wire109 >>> reg138) : (wire131 >>> reg137))) ?
                  (|reg134) : (reg134[(4'h8):(3'h5)] || (wire68 ?
                      (&(8'ha6)) : (reg136 + wire131)))));
              reg140 <= wire109;
            end
        end
      reg141 <= ($signed({(wire66 ~^ $signed(wire131)),
          ((wire131 == wire66) ?
              ((8'hab) ? wire67 : reg140) : {reg137,
                  wire66})}) <<< reg136[(3'h7):(1'h0)]);
      reg142 <= reg132[(3'h7):(3'h6)];
      reg143 <= ({(wire131[(3'h6):(1'h1)] && ((wire67 || (8'hbd)) && (wire66 <= wire65)))} | (^($signed($unsigned(reg142)) ?
          wire68 : (8'hb6))));
    end
  assign wire144 = ({reg143} >>> (reg133 >= $signed({$signed(reg143)})));
  assign wire145 = {wire68,
                       (&({$signed(wire67),
                           $unsigned(reg138)} <<< $unsigned((reg139 ^~ reg141))))};
endmodule

module module12  (y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire58;
  assign y = {wire61, wire60, wire17, wire58, (1'h0)};
  assign wire17 = ({(8'hb9)} ?
                      (wire16 ?
                          (&((wire13 >> (8'hb0)) ?
                              wire15 : wire16[(1'h1):(1'h1)])) : wire15[(1'h0):(1'h0)]) : $unsigned(($unsigned($unsigned(wire15)) || $unsigned(((8'had) ?
                          wire13 : (8'h9d))))));
  module18 #() modinst59 (wire58, clk, wire14, wire17, wire13, wire15, wire16);
  assign wire60 = $unsigned(((^($unsigned(wire58) ?
                      $signed(wire13) : wire15)) & (wire13[(2'h2):(1'h0)] ?
                      (8'hae) : {$signed((8'haa))})));
  assign wire61 = $unsigned((^~wire13));
endmodule

module module18
#(parameter param57 = (+(-({((8'ha9) ? (8'hbe) : (8'ha6)), ((8'hb0) ? (8'hbb) : (8'hb7))} ? (((8'hbb) & (7'h43)) != ((8'hbd) | (8'ha3))) : ({(7'h41)} > (~|(8'hbf)))))))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h19b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire23;
  input wire signed [(4'h9):(1'h0)] wire22;
  input wire [(3'h4):(1'h0)] wire21;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
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
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg24 <= wire19;
    end
  assign wire25 = wire19[(3'h4):(2'h2)];
  assign wire26 = $unsigned($unsigned(wire22[(3'h7):(3'h4)]));
  assign wire27 = (8'hb0);
  assign wire28 = ((!reg24[(4'he):(4'ha)]) ?
                      (wire20[(1'h0):(1'h0)] && ($unsigned($signed(reg24)) & wire25[(4'h9):(1'h0)])) : (wire27 && wire23[(1'h1):(1'h1)]));
  assign wire29 = (wire23 ?
                      wire19 : $signed($unsigned(($unsigned(wire22) + $signed(wire26)))));
  assign wire30 = ($unsigned(wire21[(2'h3):(1'h1)]) ?
                      wire20[(3'h5):(2'h3)] : $unsigned($unsigned($signed($signed(wire21)))));
  always
    @(posedge clk) begin
      if ($unsigned(wire25[(3'h6):(3'h4)]))
        begin
          reg31 <= $signed(reg24);
          reg32 <= ((~$signed(wire22)) < $signed($signed(wire21)));
        end
      else
        begin
          reg31 <= (((($signed(wire20) ? $unsigned(wire27) : $signed(reg31)) ?
                  reg32 : wire30[(4'h8):(1'h1)]) ?
              {$unsigned(wire25)} : (($unsigned(wire26) & (wire26 ~^ wire30)) - ((reg32 ?
                      wire30 : wire19) ?
                  (&wire22) : (~wire22)))) << (7'h41));
          reg32 <= $unsigned({$signed(reg31[(3'h7):(3'h5)]), (8'ha0)});
        end
      reg33 <= $signed({$unsigned((|wire21)), wire20[(1'h0):(1'h0)]});
      if (reg33[(1'h0):(1'h0)])
        begin
          if ((reg24 <= (wire29 << wire29)))
            begin
              reg34 <= (($unsigned($unsigned((reg31 ?
                  wire28 : reg31))) >>> (wire23[(4'he):(3'h4)] >> {wire26[(4'ha):(1'h0)],
                  $unsigned((8'ha9))})) >>> wire29[(4'hf):(4'h9)]);
            end
          else
            begin
              reg34 <= wire20;
              reg35 <= ($signed((($unsigned(wire20) * $signed(wire30)) ?
                      $signed((&wire28)) : ((wire20 <<< (8'ha8)) ?
                          (|wire23) : {wire20}))) ?
                  {$unsigned((wire26 ?
                          (wire20 ?
                              wire26 : wire21) : $unsigned(reg31)))} : wire22);
              reg36 <= (wire19 > $signed($signed(((wire29 ?
                  reg31 : wire29) >>> (wire29 ? wire26 : wire23)))));
            end
        end
      else
        begin
          reg34 <= (reg32[(4'h8):(3'h6)] * $signed(reg32));
          reg35 <= $unsigned(wire22);
          reg36 <= $unsigned((&$unsigned(wire21[(2'h2):(2'h2)])));
          reg37 <= (+wire19);
        end
    end
  assign wire38 = $unsigned(wire21[(2'h2):(2'h2)]);
  assign wire39 = {wire29[(4'h8):(2'h2)]};
  assign wire40 = reg31;
  assign wire41 = {reg34,
                      {(wire29[(4'he):(3'h7)] ?
                              (!wire21) : $unsigned((wire40 ? reg35 : wire20))),
                          wire30[(5'h11):(3'h7)]}};
  assign wire42 = (7'h43);
  assign wire43 = {wire19[(3'h7):(2'h2)], (!$unsigned(wire23))};
  assign wire44 = reg37[(4'h8):(1'h1)];
  always
    @(posedge clk) begin
      reg45 <= ($signed(wire29[(4'he):(1'h1)]) <<< wire41[(2'h2):(1'h1)]);
      reg46 <= ((^~wire26[(2'h2):(1'h1)]) ?
          wire22[(3'h7):(3'h6)] : ($signed(((&wire29) * wire30)) ?
              wire20 : $signed(((~&wire44) >>> (&wire25)))));
      if ($signed($signed((wire43[(1'h1):(1'h1)] ?
          ($unsigned(reg33) != $unsigned(wire43)) : ((|wire20) ?
              (reg35 ? reg45 : reg37) : (wire42 ^ wire19))))))
        begin
          if ($signed(($unsigned(((wire22 ? reg31 : reg45) ?
                  (wire39 <<< wire30) : wire21)) ?
              (~|({wire41} && $unsigned((8'hb5)))) : $unsigned(wire40[(3'h4):(3'h4)]))))
            begin
              reg47 <= $signed($signed($unsigned($unsigned($signed(wire29)))));
              reg48 <= (reg36 >= $unsigned({({wire39} <= $signed((8'ha3))),
                  ((wire30 + (8'hb9)) < reg33)}));
              reg49 <= (|(reg45[(4'hc):(1'h0)] & (+wire20)));
              reg50 <= wire28[(1'h0):(1'h0)];
              reg51 <= $unsigned((^~(wire39[(4'he):(1'h0)] ?
                  reg24[(2'h3):(2'h3)] : $signed(wire26[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg47 <= $unsigned({(reg33[(3'h7):(3'h6)] ^~ $signed((wire44 ?
                      reg31 : reg24)))});
              reg48 <= (8'h9e);
              reg49 <= $signed((~^((wire27[(4'h9):(3'h7)] >= reg31) | reg34)));
              reg50 <= wire21;
            end
          reg52 <= $signed(reg50);
          reg53 <= {(~(reg33[(4'h9):(3'h6)] ?
                  ((reg36 >> wire28) ?
                      wire43[(2'h2):(2'h2)] : (+reg31)) : ((wire27 > wire44) ?
                      $unsigned(reg33) : wire29[(5'h10):(2'h2)]))),
              reg37};
          reg54 <= wire38;
        end
      else
        begin
          reg47 <= (~$unsigned((&reg32[(5'h10):(4'hc)])));
          reg48 <= (~&(wire40 ^ ($unsigned(((8'ha7) ?
              (8'hae) : wire20)) + (^~wire27))));
          reg49 <= (^~({$signed((reg35 < reg54))} ^ ($unsigned((reg50 ?
              reg52 : (7'h43))) - $unsigned($unsigned(wire29)))));
        end
      reg55 <= wire41;
      reg56 <= ((reg51[(3'h5):(3'h5)] || $signed($unsigned({wire40}))) ?
          {(!(8'ha6))} : wire44[(1'h0):(1'h0)]);
    end
endmodule

module module110
#(parameter param128 = (^((((~(8'ha8)) ? {(8'hbb), (8'hb2)} : (&(7'h43))) * (+{(7'h42)})) ? ((!(!(8'hba))) >>> {(+(8'ha8)), ((8'haf) ? (8'hb7) : (8'hbc))}) : (^~(~^(~&(8'hb3)))))))
(y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire114;
  input wire signed [(3'h6):(1'h0)] wire113;
  input wire [(4'hd):(1'h0)] wire112;
  input wire [(4'h8):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire127;
  wire [(4'hb):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire124;
  wire [(5'h10):(1'h0)] wire123;
  wire signed [(4'ha):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire118;
  wire signed [(4'hd):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire115;
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 (1'h0)};
  assign wire115 = wire114[(4'hf):(4'hf)];
  assign wire116 = wire114[(4'h9):(3'h5)];
  assign wire117 = $unsigned($signed(wire114));
  assign wire118 = ($signed((~^(~&$unsigned(wire112)))) || $unsigned(wire116));
  assign wire119 = wire116[(3'h6):(3'h4)];
  assign wire120 = (!wire117[(4'ha):(1'h1)]);
  assign wire121 = {({wire119[(1'h0):(1'h0)], {$signed(wire111)}} ?
                           (^~(wire114 + wire117)) : $unsigned($signed($unsigned((8'hb2))))),
                       (|wire116[(2'h2):(2'h2)])};
  assign wire122 = wire120;
  assign wire123 = (8'hba);
  assign wire124 = (~(+wire114[(5'h13):(4'ha)]));
  assign wire125 = (^~{(~&{$unsigned(wire116),
                           (wire114 ? wire111 : wire119)})});
  assign wire126 = (wire115 ? wire113 : $unsigned(wire117));
  assign wire127 = ($unsigned((~(8'hbd))) ?
                       ($signed(((wire116 ? wire126 : wire112) ?
                           wire114[(2'h2):(1'h1)] : (wire114 >> wire111))) - $unsigned({$unsigned(wire123)})) : wire115);
endmodule

module module69
#(parameter param106 = ((~^(8'hab)) || (&(8'hb3))))
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h16f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire73;
  input wire signed [(4'h9):(1'h0)] wire72;
  input wire signed [(4'hd):(1'h0)] wire71;
  input wire signed [(5'h13):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire [(4'ha):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg97,
                 reg96,
                 reg95,
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
  assign wire74 = $signed($signed(($signed(wire71) || wire72[(2'h3):(2'h3)])));
  assign wire75 = (8'hbe);
  assign wire76 = ($signed(wire70) & $signed($signed(($unsigned((8'haf)) == $signed(wire71)))));
  assign wire77 = $unsigned($unsigned((|$signed($signed(wire74)))));
  assign wire78 = ((-(((wire72 ?
                      wire73 : (8'ha3)) > wire72[(2'h3):(1'h1)]) || $unsigned((wire75 ?
                      wire74 : (8'haa))))) * {(8'hb2)});
  assign wire79 = (wire73 ?
                      (wire71[(3'h4):(2'h2)] <<< ((wire74 == wire71[(4'h8):(3'h5)]) <= (^~$unsigned(wire73)))) : (wire71[(3'h7):(3'h6)] ?
                          (8'hba) : $signed($signed((&wire71)))));
  always
    @(posedge clk) begin
      reg80 <= $unsigned((8'ha4));
      reg81 <= $signed($signed($signed($unsigned(wire70))));
      reg82 <= (((^~(^~(reg80 ? wire77 : wire70))) ?
          $unsigned($unsigned(wire76[(3'h4):(3'h4)])) : $unsigned(wire76)) - (!(~|wire73)));
      reg83 <= wire75[(4'hf):(4'hd)];
      if (($unsigned({$signed((&(8'hb2))),
              (((8'hae) ? (8'hbd) : (8'hb7)) + ((7'h40) == wire70))}) ?
          wire70 : (&($signed(reg82) ?
              ((wire71 >>> wire78) ?
                  (reg81 ?
                      wire71 : wire73) : (wire78 == wire72)) : $signed({reg81})))))
        begin
          reg84 <= {(-(wire74 ?
                  $unsigned(wire75[(4'hb):(3'h5)]) : $unsigned($signed(wire77)))),
              wire74[(3'h6):(3'h6)]};
          reg85 <= (wire76[(1'h1):(1'h0)] < $signed({(&wire72),
              ((8'ha7) <<< (wire78 ? wire75 : wire73))}));
          if ((&{{((!(8'ha9)) ^~ (|reg83)), wire71}}))
            begin
              reg86 <= ((+($unsigned($unsigned((8'ha6))) ?
                      $signed((-(8'hb9))) : {(wire79 ? reg83 : wire72),
                          (+(7'h43))})) ?
                  (~|(wire72[(3'h7):(2'h2)] > (7'h41))) : wire70);
              reg87 <= wire72[(4'h9):(2'h2)];
            end
          else
            begin
              reg86 <= $unsigned((reg87 ?
                  ($unsigned({reg87, reg80}) | wire70[(4'h9):(2'h3)]) : reg80));
              reg87 <= wire75[(5'h10):(4'hf)];
              reg88 <= wire73;
              reg89 <= (wire76[(2'h2):(1'h1)] ?
                  ((($signed((8'hbe)) ?
                      $unsigned((8'hb3)) : reg80) | $unsigned({reg87})) >= wire71[(3'h4):(1'h0)]) : ((($unsigned((8'ha5)) >>> (~^(8'hb5))) ^~ reg83[(3'h7):(1'h0)]) ?
                      $unsigned((wire73 && wire70)) : ((^(wire73 ?
                              (7'h41) : reg82)) ?
                          ((~&wire74) ?
                              (+wire73) : (wire77 && wire77)) : ((+wire70) ?
                              $signed((8'hbc)) : wire72))));
            end
          reg90 <= ({(((8'h9e) ? $signed(wire76) : (wire76 ? wire77 : reg80)) ?
                      (+(~reg84)) : (8'ha0)),
                  (8'hb2)} ?
              $signed($unsigned({(wire71 || wire71),
                  reg86})) : {wire76[(2'h3):(2'h2)],
                  {($unsigned(wire79) ?
                          wire77[(1'h1):(1'h0)] : wire78[(1'h0):(1'h0)]),
                      $signed({reg88, reg82})}});
        end
      else
        begin
          if ((wire78[(1'h0):(1'h0)] ?
              $unsigned($signed(wire73[(4'h8):(3'h4)])) : $signed((((wire78 ?
                          reg89 : wire71) ?
                      (reg90 ? reg90 : wire77) : (wire71 ? wire75 : reg89)) ?
                  (|(~wire73)) : wire79[(4'hd):(4'ha)]))))
            begin
              reg84 <= ($signed((-($signed(wire71) || (8'ha6)))) ?
                  ($unsigned(wire76) || {($signed(wire74) ?
                          {(8'hbe),
                              reg83} : wire70[(4'hf):(2'h3)])}) : ($unsigned(((8'hbe) ?
                      (wire73 ? wire78 : reg80) : (reg88 ?
                          (8'ha9) : (8'ha0)))) < ($signed(wire77[(5'h12):(4'hf)]) >> $signed((+(8'ha1))))));
              reg85 <= $unsigned($unsigned((reg80 > ($unsigned(wire74) ?
                  $signed(wire72) : reg86[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg84 <= (wire77 ?
                  $unsigned($signed($signed({wire76, reg87}))) : wire78);
            end
          if (((&{reg81[(3'h6):(2'h3)], $unsigned((wire78 | wire74))}) ?
              reg87 : wire71[(1'h0):(1'h0)]))
            begin
              reg86 <= wire73[(4'h8):(1'h1)];
              reg87 <= $unsigned($unsigned($unsigned(wire79)));
              reg88 <= ((8'hb0) ? wire76 : wire76[(3'h6):(2'h3)]);
            end
          else
            begin
              reg86 <= ($unsigned({{wire78[(2'h3):(1'h0)]}}) && reg87);
              reg87 <= ($signed(reg80[(1'h1):(1'h0)]) ~^ (((8'hb5) ?
                  wire71[(4'h9):(3'h6)] : (wire74 <= (wire77 ?
                      reg87 : wire79))) == $unsigned(($signed(reg82) >>> (~wire79)))));
              reg88 <= reg83;
              reg89 <= (8'hbd);
            end
          reg90 <= ($unsigned(reg81[(3'h6):(3'h5)]) <<< ($unsigned(wire79) ?
              $signed($signed(((7'h44) ?
                  wire77 : reg90))) : reg86[(3'h5):(3'h5)]));
        end
    end
  assign wire91 = wire70[(3'h5):(2'h2)];
  assign wire92 = wire73;
  assign wire93 = (((+reg82) ?
                      ($signed(reg90) ~^ {(wire92 >= wire71)}) : (~|(reg88[(3'h4):(3'h4)] - $signed(reg86)))) + reg82[(1'h0):(1'h0)]);
  assign wire94 = reg85;
  always
    @(posedge clk) begin
      reg95 <= {wire70,
          (+(wire73[(3'h4):(1'h1)] ? (8'ha3) : $unsigned(reg82)))};
      reg96 <= reg87;
      reg97 <= {wire72};
    end
  assign wire98 = $unsigned({(wire71[(3'h6):(3'h6)] <<< wire93[(1'h1):(1'h0)])});
  assign wire99 = {($unsigned(($unsigned(wire74) <= reg82)) ?
                          (reg97 ?
                              $signed((wire93 ?
                                  reg97 : reg87)) : wire79[(4'he):(3'h7)]) : ((&wire71[(1'h1):(1'h0)]) ?
                              {reg97} : $unsigned((reg90 ^~ wire74)))),
                      (($signed($unsigned(wire73)) ? reg81 : (!(^reg97))) ?
                          $unsigned($unsigned(wire73)) : (8'hb0))};
  assign wire100 = ($unsigned($unsigned(((~^wire75) ?
                           (wire91 ? reg90 : (8'hba)) : (~|(8'h9f))))) ?
                       $unsigned(($signed($unsigned(reg96)) - ($signed(wire74) <= $unsigned((8'hb3))))) : ((($signed(wire91) ?
                           wire92[(1'h0):(1'h0)] : reg83) | $signed($unsigned(wire71))) & wire92[(1'h0):(1'h0)]));
  assign wire101 = wire92[(3'h5):(1'h0)];
  assign wire102 = wire92[(3'h7):(3'h6)];
  assign wire103 = $signed(wire76);
  assign wire104 = (wire74[(2'h2):(1'h1)] ?
                       {{(8'ha5)}, (8'hb9)} : ($signed(reg85) ?
                           ($unsigned(wire94) >= ((8'ha2) <<< (&(7'h42)))) : {wire102}));
  assign wire105 = $unsigned(reg86[(2'h3):(1'h1)]);
endmodule
