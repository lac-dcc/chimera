module top
#(parameter param84 = {(&({((8'hae) << (8'hae)), {(8'hb4)}} ^~ (~((8'ha3) ? (8'h9f) : (8'hbe))))), (({((8'ha0) != (7'h40))} ? (~^(-(8'hb0))) : (((8'h9c) >> (8'h9d)) ? ((8'ha0) ? (8'hb6) : (8'had)) : {(8'hb9), (7'h44)})) ? (~&(!(|(8'h9f)))) : (|(+{(8'ha7), (8'hb0)})))}, 
parameter param85 = param84)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h20e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire72,
                 wire30,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
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
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($unsigned($signed(($unsigned(wire4) ?
          (~&wire0) : $signed(wire2)))) && wire3[(1'h1):(1'h0)]);
      reg6 <= wire4;
      if ({($unsigned(reg6[(3'h4):(2'h2)]) != (&((wire2 ? wire4 : wire0) ?
              {wire1, reg6} : $signed((8'hab))))),
          (wire4[(3'h6):(1'h1)] ^ $signed(($signed(reg5) ?
              $unsigned(wire1) : ((8'hbc) | (8'hb1)))))})
        begin
          if ((8'hab))
            begin
              reg7 <= reg5[(3'h4):(3'h4)];
            end
          else
            begin
              reg7 <= wire4;
              reg8 <= (+($signed($unsigned(wire4)) ?
                  {(~wire3[(2'h3):(1'h0)])} : $signed((~(reg7 < reg6)))));
            end
          reg9 <= ((^~($signed($signed(wire4)) ?
                  (^~(7'h41)) : wire4[(1'h1):(1'h0)])) ?
              $signed(($signed((~|wire0)) ^ wire0)) : reg7);
          reg10 <= (~^$signed({reg5[(4'h8):(4'h8)], reg6[(3'h5):(1'h1)]}));
          reg11 <= (({$signed((reg8 ^~ reg5)),
              ($unsigned((8'ha3)) & reg8[(2'h2):(1'h1)])} >>> $unsigned($unsigned($signed(reg7)))) || ((reg7 + {((8'haf) >> (8'ha8)),
              $unsigned(wire2)}) <= reg9[(4'hc):(1'h1)]));
        end
      else
        begin
          if (wire4[(2'h3):(2'h2)])
            begin
              reg7 <= $signed(wire0[(2'h3):(2'h3)]);
              reg8 <= reg7;
              reg9 <= $unsigned({$signed($unsigned((wire3 ? reg9 : (8'hbe)))),
                  reg5});
              reg10 <= $signed($signed(reg9[(2'h3):(1'h1)]));
            end
          else
            begin
              reg7 <= ((8'ha4) & reg11[(4'ha):(3'h6)]);
              reg8 <= $signed((~^(+$unsigned($signed(wire4)))));
            end
          reg11 <= wire3[(1'h0):(1'h0)];
        end
    end
  assign wire12 = reg11;
  assign wire13 = (wire3 != $unsigned($unsigned(reg10)));
  assign wire14 = (+(~&$signed(wire12[(4'he):(2'h2)])));
  assign wire15 = ((reg9 < wire13) ?
                      $unsigned($signed(reg9[(4'hb):(3'h4)])) : (^wire4));
  assign wire16 = (^~($signed($signed((reg9 ?
                      wire1 : wire1))) && $signed($unsigned((wire2 ^~ wire13)))));
  assign wire17 = wire3[(2'h2):(1'h0)];
  assign wire18 = wire0[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg19 <= wire2;
      reg20 <= ($unsigned($unsigned((+wire12[(4'hd):(4'ha)]))) ?
          (~^reg11) : wire18);
      if (($unsigned(($unsigned((wire15 ? reg6 : (8'h9f))) ^~ reg19)) ?
          wire17 : (+wire2)))
        begin
          if (wire2)
            begin
              reg21 <= (reg6[(3'h6):(3'h4)] ?
                  ($unsigned((|(reg6 ~^ reg20))) ?
                      (8'hb7) : (((~|reg6) || {(8'hb8)}) ?
                          $signed((~&wire1)) : $signed((wire4 <= wire16)))) : $unsigned(reg20));
              reg22 <= $unsigned((~^(8'hbb)));
              reg23 <= $unsigned(wire3);
            end
          else
            begin
              reg21 <= ($signed(reg7[(2'h3):(2'h2)]) >= $unsigned(wire4));
              reg22 <= (8'h9c);
              reg23 <= (^{(wire0 ? (^$signed(reg8)) : $unsigned((|(8'hb4))))});
              reg24 <= $unsigned(wire2[(3'h4):(2'h2)]);
            end
        end
      else
        begin
          reg21 <= reg24[(1'h1):(1'h1)];
          if (($signed((~&(reg9 >>> {wire13}))) != ($unsigned($unsigned(wire2)) ?
              (reg10 ?
                  ((reg20 >>> wire4) ~^ (wire18 ?
                      (8'h9d) : reg9)) : ($signed((8'h9f)) ?
                      (wire18 & reg10) : wire13[(2'h3):(2'h2)])) : $signed($unsigned(wire0)))))
            begin
              reg22 <= reg20;
            end
          else
            begin
              reg22 <= $signed($unsigned((wire16 | (-(reg6 >> (8'h9e))))));
              reg23 <= reg21;
              reg24 <= $unsigned($unsigned((~^wire12)));
              reg25 <= $signed(wire17);
              reg26 <= (reg21[(3'h4):(3'h4)] ?
                  $unsigned($unsigned(((&wire15) >= (-reg24)))) : ($unsigned((-$unsigned(reg11))) < $signed($signed($unsigned(wire16)))));
            end
          reg27 <= ($unsigned((($signed(reg20) ?
                  wire16[(3'h6):(1'h0)] : (reg5 + reg19)) >= $unsigned(wire16[(1'h0):(1'h0)]))) ?
              $unsigned($signed({((7'h44) <= wire3),
                  (wire0 ? (8'hb3) : wire13)})) : (reg25[(3'h4):(2'h3)] ?
                  (&$signed((8'haf))) : $unsigned((~|(!reg26)))));
          reg28 <= (8'ha7);
        end
      reg29 <= $unsigned((-(!$signed(reg10[(3'h6):(2'h2)]))));
    end
  assign wire30 = (wire4 >>> ($signed($unsigned(reg20[(4'h8):(1'h0)])) + reg7[(5'h10):(4'hd)]));
  always
    @(posedge clk) begin
      reg31 <= $signed(reg10);
      if (($signed((wire18 ?
          reg24 : (^~(reg31 ? wire18 : reg10)))) <<< (~|reg22)))
        begin
          if ((~^($signed($signed((reg29 >= wire30))) ?
              (((wire17 ?
                  reg29 : wire30) <<< wire0[(2'h3):(1'h1)]) ^ (8'ha6)) : $signed({wire4[(3'h4):(1'h1)],
                  (wire3 <<< (7'h44))}))))
            begin
              reg32 <= (~&(reg24[(1'h0):(1'h0)] ?
                  ($unsigned((reg31 ? wire18 : reg6)) ?
                      ($unsigned((7'h41)) - $unsigned(reg25)) : ({reg20} ?
                          (~&(8'haf)) : $signed(reg6))) : (wire16[(2'h3):(2'h2)] == (-(|(8'hae))))));
              reg33 <= reg19;
              reg34 <= (~^$signed($signed(reg26)));
            end
          else
            begin
              reg32 <= {reg20};
              reg33 <= (reg31 * wire16[(3'h4):(1'h1)]);
              reg34 <= {(8'hb0), $unsigned($unsigned(reg10[(1'h0):(1'h0)]))};
              reg35 <= (~^((^~$signed((reg33 ? reg25 : (7'h44)))) ^ reg11));
            end
          reg36 <= $unsigned({$unsigned($unsigned({reg26, (8'hb5)})),
              (~|((~&wire12) ?
                  $unsigned(reg27) : (wire2 ? (8'hb9) : (8'ha8))))});
        end
      else
        begin
          if (reg22)
            begin
              reg32 <= wire0[(3'h5):(1'h0)];
              reg33 <= ((reg11[(2'h3):(1'h0)] >>> ({reg19[(4'h8):(3'h5)]} ?
                  (reg7 ?
                      wire18 : $signed(reg7)) : (~|(~^reg32)))) ^ (($signed($unsigned(wire18)) ?
                      reg25[(2'h3):(2'h3)] : reg29) ?
                  $unsigned(((~&(8'haf)) << wire17[(3'h4):(2'h3)])) : $unsigned(reg28[(1'h1):(1'h0)])));
            end
          else
            begin
              reg32 <= $unsigned((($signed((reg28 ?
                      reg34 : reg7)) > reg25[(3'h6):(2'h2)]) ?
                  reg31[(3'h6):(2'h3)] : reg31[(4'hb):(3'h5)]));
              reg33 <= ($signed($unsigned(((reg31 ? reg35 : wire4) ?
                  (^~wire2) : wire0))) >= {((~|$unsigned(wire15)) ?
                      (reg36[(3'h5):(1'h1)] ?
                          (reg31 ?
                              wire12 : reg36) : $signed(wire18)) : $signed($signed(reg11))),
                  ((wire30 >> wire14[(5'h14):(4'hf)]) ?
                      ($signed((7'h44)) | (reg19 ? reg32 : reg9)) : wire14)});
              reg34 <= wire0[(3'h4):(3'h4)];
              reg35 <= $signed((~|reg29));
              reg36 <= ($signed((($signed(reg11) ~^ (wire17 > reg7)) || reg34)) ?
                  (reg34[(1'h0):(1'h0)] ~^ {$signed((reg7 ^ reg25))}) : reg10);
            end
        end
      reg37 <= $signed((reg36[(4'ha):(3'h5)] < reg19));
    end
  module38 #() modinst73 (wire72, clk, wire4, reg19, reg8, reg10, wire30);
  always
    @(posedge clk) begin
      if ((~^{$signed((-(~&wire18))), reg33}))
        begin
          reg74 <= reg34;
          reg75 <= (^reg37[(1'h0):(1'h0)]);
          reg76 <= $signed($signed({((reg22 + reg31) <<< (reg35 != wire3))}));
          if ((~$unsigned($unsigned($signed($signed(wire72))))))
            begin
              reg77 <= reg37[(2'h3):(2'h3)];
              reg78 <= (^$signed((8'hba)));
              reg79 <= $unsigned(reg78);
            end
          else
            begin
              reg77 <= (+((8'hb6) ?
                  $signed(reg20[(3'h7):(3'h7)]) : $unsigned((reg9 && (reg8 ^ reg36)))));
              reg78 <= reg77;
            end
        end
      else
        begin
          reg74 <= ($signed($signed(reg26)) < reg36[(4'h8):(3'h5)]);
          reg75 <= ($signed((((|reg9) ?
                  reg75[(1'h1):(1'h0)] : reg23[(4'h9):(4'h8)]) << ($signed(reg28) ?
                  reg24 : {(8'ha1), reg9}))) ?
              $signed($signed(((reg75 ? reg28 : reg31) ?
                  {(8'haf),
                      reg25} : reg7[(3'h4):(3'h4)]))) : $signed((^(~&(reg21 == (8'hb0))))));
          if (wire3)
            begin
              reg76 <= (wire72[(4'hd):(3'h6)] ?
                  (^$unsigned(($signed(reg78) ?
                      reg37[(3'h5):(2'h3)] : $signed(wire12)))) : ({(reg10 ?
                          wire2[(1'h0):(1'h0)] : wire14[(5'h13):(4'hd)])} >= reg11[(2'h3):(2'h3)]));
              reg77 <= wire2[(1'h1):(1'h1)];
            end
          else
            begin
              reg76 <= reg37;
              reg77 <= (((($unsigned(reg36) + (|reg6)) ?
                      ({reg26, reg32} ?
                          $signed((8'h9f)) : $signed(reg24)) : (8'hbb)) ?
                  reg22 : wire2[(3'h6):(1'h1)]) <<< reg24);
            end
        end
      reg80 <= (!($signed((reg37 ? $unsigned(reg33) : {wire18})) ?
          (((wire2 ?
              reg79 : reg35) || $signed(reg29)) > reg34) : ($signed((wire18 | wire12)) ?
              reg6 : ($unsigned(reg22) | wire14))));
      reg81 <= (~&reg31[(4'h8):(1'h1)]);
    end
  assign wire82 = {{((!wire15) >>> ((reg5 ? wire3 : wire0) <<< {wire1})),
                          (((8'hac) - $unsigned(reg22)) & reg81[(4'h9):(3'h4)])}};
  assign wire83 = ($signed($signed(reg20[(1'h1):(1'h1)])) ?
                      wire0 : $signed((reg22 < ($signed(reg32) ?
                          (wire17 ? (8'hb7) : wire16) : (reg78 ~^ reg35)))));
endmodule

module module38
#(parameter param70 = (((((~(8'haf)) ? (^~(8'ha3)) : ((8'had) ^ (8'hb1))) && {((7'h43) | (8'hb0))}) == ((&(~&(8'hbf))) ^ {((8'hb5) == (8'haa)), ((8'hb2) ? (8'ha0) : (8'hb2))})) ? ((((~^(8'ha1)) << ((8'ha0) ? (7'h42) : (8'h9d))) ? (|(~|(8'h9c))) : (((8'ha6) >>> (8'ha9)) ? (~&(8'hb4)) : {(8'ha5)})) - ((&((7'h42) ? (8'hac) : (7'h43))) ? (((8'hb0) && (8'hb8)) * {(8'ha3)}) : ((^(8'ha0)) ? (&(8'haa)) : (~(8'hb9))))) : (({((8'ha5) ? (8'hab) : (8'ha4))} ? (~^((7'h43) + (8'ha6))) : ((&(8'h9f)) || ((8'ha2) + (8'hb3)))) < ((~|((8'hbb) >>> (7'h40))) ? {((8'ha0) - (8'hb1)), ((8'ha3) >> (8'h9d))} : (((8'hb6) > (8'hab)) ? (^(8'h9e)) : ((8'hbd) >= (8'hbd)))))), 
parameter param71 = ((8'hac) << (param70 | (param70 ? (8'ha9) : (~|{param70, param70})))))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire43;
  input wire signed [(3'h7):(1'h0)] wire42;
  input wire signed [(3'h5):(1'h0)] wire41;
  input wire [(4'he):(1'h0)] wire40;
  input wire [(5'h14):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg69,
                 reg68,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire44 = wire40;
  assign wire45 = wire41[(2'h3):(2'h2)];
  assign wire46 = ($unsigned($signed($unsigned($unsigned((8'hb6))))) ?
                      wire41 : {$signed((wire41[(2'h2):(2'h2)] ?
                              (wire43 < wire45) : (~|wire44)))});
  assign wire47 = ((&wire40) ^~ $unsigned(wire42[(3'h7):(3'h7)]));
  assign wire48 = $unsigned((8'hb0));
  assign wire49 = (~^wire42[(2'h3):(2'h2)]);
  assign wire50 = $unsigned(wire45[(3'h6):(3'h6)]);
  assign wire51 = $unsigned($unsigned($signed(wire44[(3'h5):(2'h2)])));
  always
    @(posedge clk) begin
      reg52 <= ((&(&wire50[(4'hf):(4'h8)])) ?
          wire43[(4'h9):(3'h5)] : $unsigned($signed(wire41)));
      if (((wire44 ?
          {((wire40 ?
                  wire47 : wire46) << wire39[(5'h10):(2'h2)])} : wire39) >>> $unsigned(wire44[(1'h0):(1'h0)])))
        begin
          if ($unsigned({(reg52[(2'h3):(1'h0)] + (wire45 ? (|reg52) : (8'hb8))),
              (|reg52)}))
            begin
              reg53 <= $signed((!($unsigned((wire42 ^ wire44)) <<< wire45)));
              reg54 <= $unsigned((~^wire40));
            end
          else
            begin
              reg53 <= (($signed($signed($unsigned(wire40))) ?
                      {$unsigned(wire39)} : $unsigned(wire39[(3'h5):(2'h2)])) ?
                  (~|(~|($signed(wire51) < $unsigned(wire51)))) : (7'h43));
              reg54 <= $signed(wire39[(5'h13):(3'h7)]);
              reg55 <= (&$signed($unsigned((~(wire45 ? wire51 : wire44)))));
            end
          reg56 <= $unsigned($signed($unsigned(wire42)));
        end
      else
        begin
          reg53 <= (reg52 ?
              wire40[(3'h6):(3'h4)] : $signed((!{$unsigned(wire41)})));
          reg54 <= (+wire50[(3'h7):(1'h1)]);
          reg55 <= $signed(wire46);
        end
      reg57 <= {(~^(~^wire47)), $unsigned(wire44)};
      reg58 <= $signed((^wire51));
    end
  assign wire59 = $signed(($unsigned($unsigned((wire41 ?
                      (8'hb4) : wire43))) >>> $signed($signed(reg56[(2'h3):(2'h3)]))));
  assign wire60 = $signed($signed(((^~$signed(reg56)) > (reg55 & (wire41 ?
                      wire51 : wire45)))));
  assign wire61 = reg56;
  assign wire62 = wire59;
  assign wire63 = reg58;
  assign wire64 = (-$unsigned($signed((!(&wire63)))));
  assign wire65 = wire48[(1'h0):(1'h0)];
  assign wire66 = {$signed(reg52)};
  assign wire67 = (+wire43);
  always
    @(posedge clk) begin
      reg68 <= $unsigned((((reg56 < wire50) << ($unsigned(reg54) == $unsigned(reg54))) > (($signed(wire41) ^~ $signed((8'haf))) >>> (wire40[(3'h7):(1'h0)] <<< $unsigned(wire45)))));
      reg69 <= $unsigned(reg56);
    end
endmodule
