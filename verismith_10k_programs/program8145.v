module top
#(parameter param85 = {((((&(8'had)) ? {(8'hb9)} : ((8'hac) ? (8'ha5) : (8'ha6))) ? ({(8'h9d)} + {(8'ha4)}) : ((8'hb2) ? ((7'h40) > (8'hab)) : ((8'hb2) >> (8'hbc)))) < {(((8'ha1) ? (8'hbb) : (8'hb9)) * (8'hb4))})}, 
parameter param86 = {(((8'hb9) ? (param85 ? {param85} : ((8'h9f) ? param85 : param85)) : param85) ? (8'hb0) : (8'h9d)), param85})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire81;
  assign y = {wire84, wire83, wire4, wire81, (1'h0)};
  assign wire4 = wire0;
  module5 #() modinst82 (wire81, clk, wire0, wire1, wire4, wire3, wire2);
  assign wire83 = (wire1[(3'h6):(1'h1)] ?
                      {((-wire1[(3'h7):(1'h0)]) + wire81[(3'h6):(3'h4)]),
                          (+((wire3 * wire0) <= $signed(wire1)))} : ((-(-wire4)) ^ (wire4[(4'ha):(4'h8)] ?
                          $unsigned(((8'haf) ?
                              (8'ha0) : wire4)) : ($unsigned(wire1) <= wire2))));
  assign wire84 = {wire81,
                      $signed({wire83[(3'h6):(3'h4)],
                          {(^~wire2), wire81[(4'hd):(3'h4)]}})};
endmodule

module module5
#(parameter param80 = ((~&({(+(8'hb2))} != ((7'h40) ? {(8'ha2), (7'h42)} : (^~(8'hb8))))) > ((^(((8'hbe) ? (8'ha6) : (8'hb6)) ? (!(8'ha3)) : ((8'hbf) ? (8'ha2) : (8'ha4)))) ? {{((8'h9f) ? (8'h9f) : (8'hbf)), (+(8'hbb))}, ({(8'hbe), (8'hba)} ? ((8'ha4) || (7'h42)) : ((7'h43) || (8'ha3)))} : ((((8'hac) ? (8'hb8) : (8'haa)) ? ((7'h44) > (8'ha5)) : {(8'ha5)}) ? (((8'hb4) ? (8'hbc) : (7'h44)) <= {(8'ha7)}) : (((8'ha4) ^~ (8'ha0)) ~^ ((8'hbe) & (8'ha2)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  assign y = {wire79,
                 wire77,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire39,
                 wire37,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg57,
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
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire11 = (&wire7);
  assign wire12 = ((wire10 | (~$unsigned($signed(wire8)))) * ({((!wire6) ?
                          (wire8 ? wire11 : wire6) : {wire10, wire11}),
                      $signed(wire10)} >>> wire11));
  assign wire13 = (wire9[(2'h3):(1'h0)] || $unsigned((8'ha1)));
  assign wire14 = wire10[(5'h10):(4'he)];
  module15 #() modinst38 (.wire16(wire11), .clk(clk), .wire17(wire7), .wire18(wire12), .y(wire37), .wire19(wire6));
  assign wire39 = (|(8'h9c));
  always
    @(posedge clk) begin
      if (((8'hb1) || (wire11 ?
          (wire11 >= wire10) : ((!wire39[(4'hb):(4'h8)]) ?
              (wire13[(3'h5):(1'h0)] ?
                  $signed(wire8) : $signed(wire37)) : {{(8'hb7)}}))))
        begin
          reg40 <= ((wire6 ^~ wire6) >> $unsigned(wire7));
        end
      else
        begin
          reg40 <= $unsigned((wire13[(1'h1):(1'h1)] ?
              $unsigned($unsigned(((8'hb0) ?
                  wire8 : wire13))) : $unsigned({$unsigned(wire12),
                  ((8'h9e) == wire37)})));
          reg41 <= $signed(wire7);
          reg42 <= (((wire7 | wire7) > wire11[(4'hd):(3'h7)]) || reg41[(1'h0):(1'h0)]);
        end
      reg43 <= ($signed(reg41) ?
          $unsigned((&$signed(wire11[(4'hc):(1'h0)]))) : wire39[(5'h14):(4'hd)]);
      reg44 <= wire10;
      if ({($unsigned(((wire39 ? wire12 : (8'ha3)) ?
                  (wire10 <= (8'h9f)) : wire13[(4'h9):(2'h3)])) ?
              reg42 : $unsigned(wire6[(4'hc):(4'hb)])),
          $signed($signed(((wire14 * wire10) != (~^(8'hb7)))))})
        begin
          reg45 <= wire8[(4'h8):(4'h8)];
          if (wire6)
            begin
              reg46 <= {(~({(wire9 >> (8'hab)), (wire8 ? (7'h42) : wire14)} ?
                      $signed((reg41 ? wire6 : wire6)) : $unsigned((~wire9))))};
              reg47 <= ((|$signed(wire13[(4'hd):(1'h0)])) ?
                  $signed(($signed($unsigned(wire14)) <= wire39)) : wire12[(5'h11):(3'h7)]);
              reg48 <= $unsigned($unsigned(wire11[(4'ha):(1'h1)]));
              reg49 <= ($signed(((!wire37[(3'h6):(1'h1)]) <<< {$signed((7'h42)),
                      (wire6 * (8'ha6))})) ?
                  ($unsigned(reg45) ?
                      wire14 : (|$signed((reg44 != (8'h9e))))) : (reg45[(4'hf):(4'hd)] ?
                      $signed(($signed(wire37) == ((8'had) <= wire6))) : (wire8[(3'h6):(2'h3)] ?
                          (8'hb5) : ((wire39 <<< reg44) ?
                              (7'h43) : (+wire9)))));
              reg50 <= (wire11 ?
                  (wire8[(1'h0):(1'h0)] ?
                      ((reg41 <= (~reg47)) ?
                          $unsigned((reg48 << wire14)) : $signed($unsigned(reg47))) : ((reg45 < (wire11 ?
                          reg45 : reg47)) ^~ (!$signed(wire14)))) : reg48);
            end
          else
            begin
              reg46 <= $unsigned($unsigned((~&((!reg48) ^ $unsigned(wire12)))));
              reg47 <= $signed(($signed({{(8'hb7), reg50}, {wire10}}) ?
                  $signed(($signed((8'hb9)) ?
                      wire39 : wire11[(5'h13):(3'h5)])) : $unsigned(reg50[(1'h0):(1'h0)])));
              reg48 <= (reg50 - (~|(($unsigned(reg44) ?
                  reg47 : (wire39 || reg48)) ^ $signed((wire39 > reg47)))));
              reg49 <= reg48[(4'ha):(3'h4)];
            end
          reg51 <= wire11[(4'hb):(4'hb)];
          if ((!$signed($unsigned((8'hac)))))
            begin
              reg52 <= ($signed(wire12) > $unsigned((reg48 ?
                  $unsigned(reg48) : (-(reg41 ? wire8 : wire39)))));
              reg53 <= wire39[(3'h7):(2'h2)];
              reg54 <= wire6[(5'h15):(1'h0)];
              reg55 <= {(reg53[(4'hd):(1'h0)] || $unsigned((~&reg41)))};
              reg56 <= ((8'had) ?
                  {$signed((8'hba)), reg47} : $unsigned((+((wire6 ?
                      (8'hb1) : (8'haf)) | (reg54 ? reg41 : wire10)))));
            end
          else
            begin
              reg52 <= reg48[(1'h0):(1'h0)];
              reg53 <= $unsigned(wire13[(4'hc):(3'h7)]);
              reg54 <= ($unsigned($signed($unsigned((~wire9)))) ?
                  {(reg51[(3'h6):(3'h5)] & $unsigned(reg47))} : wire9);
              reg55 <= (|{{(&$signed(reg54)), $signed(reg45)}});
            end
          reg57 <= $unsigned(wire7[(3'h6):(2'h2)]);
        end
      else
        begin
          reg45 <= wire8;
          reg46 <= wire12;
          reg47 <= wire39[(4'hf):(4'hf)];
        end
    end
  assign wire58 = {((~|$unsigned((reg44 ? (8'ha0) : wire9))) ^~ {reg48}),
                      (8'hb1)};
  assign wire59 = $unsigned((($unsigned($signed((7'h44))) >> wire11) && $unsigned(reg47)));
  assign wire60 = reg44;
  assign wire61 = {wire9};
  assign wire62 = $signed((&($signed((reg57 ^~ reg55)) * $signed((reg57 && wire9)))));
  module63 #() modinst78 (.wire67(wire58), .wire66(reg45), .clk(clk), .wire65(wire61), .wire64(reg55), .y(wire77));
  assign wire79 = (~^wire61[(3'h7):(1'h0)]);
endmodule

module module63
#(parameter param76 = (&((&({(8'hb6), (8'hbc)} ? {(8'hac), (8'hbf)} : {(8'hbc), (8'hae)})) ? ((|(^~(8'hbc))) ? ((~|(8'hbe)) ? {(8'h9d)} : ((8'haa) <<< (7'h44))) : (((8'ha4) == (8'hba)) ? {(8'ha3), (8'ha4)} : {(8'hba), (8'hb3)})) : (^(~^(+(8'hae)))))))
(y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire67;
  input wire [(3'h6):(1'h0)] wire66;
  input wire [(4'hc):(1'h0)] wire65;
  input wire signed [(4'h9):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 (1'h0)};
  assign wire68 = ((~|wire64) + $unsigned($unsigned((~^$signed(wire64)))));
  assign wire69 = wire67[(3'h6):(3'h4)];
  assign wire70 = (($signed((wire69[(4'h9):(2'h2)] || wire65)) + (+$signed({wire68,
                      (8'ha7)}))) && {wire66[(3'h6):(2'h2)]});
  assign wire71 = $signed($signed((($signed(wire65) ?
                          $unsigned(wire68) : $unsigned(wire67)) ?
                      wire67[(2'h3):(1'h1)] : (wire67 < wire64[(2'h2):(2'h2)]))));
  assign wire72 = (($signed((7'h43)) > $unsigned(((wire64 ~^ wire68) ~^ wire68[(2'h2):(1'h0)]))) & (-(^~(^~(wire65 ?
                      wire65 : wire64)))));
  assign wire73 = (~^wire66);
  assign wire74 = wire64;
  assign wire75 = ({(8'ha7), $unsigned($unsigned($unsigned((8'hb9))))} ?
                      (wire71[(2'h2):(2'h2)] || wire69[(3'h4):(1'h0)]) : $signed(($unsigned(wire67) < wire68[(3'h5):(1'h1)])));
endmodule

module module15
#(parameter param36 = (-{({((8'ha4) & (8'hb0))} <<< (((8'hb3) >> (8'h9c)) ? ((8'ha0) || (7'h40)) : {(8'ha1), (8'hb0)})), (~{(-(8'hbf)), ((8'hb8) ? (8'ha3) : (8'hbc))})}))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg29,
                 (1'h0)};
  assign wire20 = wire17[(5'h11):(5'h11)];
  assign wire21 = ($signed(((wire19 ?
                          $signed(wire19) : (wire18 ?
                              wire20 : (7'h40))) && (wire17 ?
                          ((8'hb8) > (7'h42)) : (8'hb6)))) ?
                      wire19 : $signed(wire18[(3'h5):(1'h0)]));
  assign wire22 = $unsigned(((wire21 ?
                      $signed((wire21 + wire21)) : $signed(wire21[(3'h4):(2'h3)])) | ((wire17 ?
                          $signed(wire17) : (|wire20)) ?
                      (^{wire17}) : $signed(wire19))));
  assign wire23 = {(wire21 ?
                          (&{$signed(wire18)}) : $signed({(wire17 ?
                                  wire17 : wire16)})),
                      $unsigned(({$unsigned(wire21),
                          {(8'hac), wire20}} << wire21[(4'h8):(3'h5)]))};
  assign wire24 = {$unsigned((wire17 ?
                          wire18[(4'hc):(4'h9)] : $unsigned($signed(wire21))))};
  assign wire25 = $signed(wire21[(4'hd):(4'hc)]);
  assign wire26 = (8'haa);
  assign wire27 = {wire17[(3'h6):(2'h3)],
                      ((-wire18) * ((((8'hab) != wire26) ?
                              wire26[(2'h3):(1'h1)] : $unsigned(wire23)) ?
                          $unsigned(wire20) : wire16[(2'h2):(1'h1)]))};
  assign wire28 = wire23[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg29 <= ($unsigned($signed(wire18)) - $signed(wire16));
    end
  assign wire30 = wire28;
  assign wire31 = $unsigned(wire22[(3'h5):(1'h1)]);
  assign wire32 = (wire30 ?
                      ((((wire24 ? (8'hbc) : (8'hbd)) < (^~wire24)) ?
                          (^$signed(wire16)) : wire23) < (wire30[(4'hb):(3'h5)] << $unsigned({(8'hb0),
                          wire31}))) : $unsigned(wire19[(3'h6):(3'h5)]));
  assign wire33 = wire30[(2'h3):(2'h3)];
  assign wire34 = {(wire32[(3'h5):(3'h5)] != wire27)};
  assign wire35 = wire31[(4'ha):(2'h2)];
endmodule
