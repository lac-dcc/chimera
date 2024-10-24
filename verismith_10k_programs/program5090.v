module top
#(parameter param112 = ((+(({(8'hbf)} & {(7'h44)}) - (-((7'h44) ? (8'ha1) : (8'hab))))) ? (~^(|{(~&(8'hb9)), ((8'hb2) ? (8'ha6) : (7'h41))})) : ({((+(8'hac)) ? (!(8'hbb)) : (~(8'hbb)))} | ((-((8'had) ? (8'hbc) : (8'hb4))) ? ((+(8'haa)) ? ((8'ha3) - (8'h9d)) : {(8'ha8)}) : (&((7'h44) ? (8'hae) : (8'haa)))))), 
parameter param113 = ((({(8'haf)} ? param112 : {(param112 ? (7'h42) : param112), param112}) > ({(param112 ? param112 : param112)} > param112)) ? {(~&((param112 ? (8'hb4) : param112) ? (param112 <= (8'hbe)) : param112))} : ((&({param112, param112} * param112)) & param112)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  assign y = {wire106,
                 wire77,
                 wire76,
                 wire74,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg10,
                 (1'h0)};
  assign wire5 = {wire1[(3'h6):(1'h0)]};
  assign wire6 = {wire3[(1'h0):(1'h0)], (8'h9e)};
  assign wire7 = (wire5[(3'h7):(1'h1)] ? wire0 : wire2[(3'h4):(1'h1)]);
  assign wire8 = (wire4 ^~ $unsigned($signed(wire2)));
  assign wire9 = wire1;
  always
    @(posedge clk) begin
      reg10 <= (!wire0[(2'h2):(2'h2)]);
    end
  module11 #() modinst75 (wire74, clk, wire5, wire7, reg10, wire8, wire0);
  assign wire76 = reg10[(2'h2):(2'h2)];
  assign wire77 = {$unsigned((&wire9)),
                      $unsigned(((|((8'hb2) || (7'h43))) ?
                          ((wire1 ?
                              wire74 : wire3) * wire3[(4'h8):(3'h4)]) : ($signed((8'hbb)) ?
                              $unsigned(wire7) : (!wire4))))};
  module78 #() modinst107 (.wire82(wire0), .wire81(wire3), .wire79(wire2), .clk(clk), .y(wire106), .wire83(reg10), .wire80(wire6));
  always
    @(posedge clk) begin
      reg108 <= {wire4[(3'h6):(1'h0)],
          ({((wire74 ? wire8 : wire7) ? $unsigned(wire3) : $signed(wire77))} ?
              (~$signed(wire0[(2'h2):(2'h2)])) : wire0[(4'hf):(2'h2)])};
      reg109 <= ($signed((wire106[(1'h1):(1'h0)] - $unsigned({wire4,
          wire7}))) >>> $unsigned((&(+(wire4 ? (8'hb5) : wire2)))));
      reg110 <= $unsigned($unsigned($unsigned($unsigned((reg108 ?
          wire1 : wire77)))));
      reg111 <= (^reg108);
    end
endmodule

module module78
#(parameter param104 = ((+({((7'h44) <<< (8'ha3))} ? ((-(8'hb6)) >> {(8'ha8)}) : ((|(7'h40)) ? {(8'hb9), (8'hbe)} : ((8'hb2) >>> (8'ha8))))) >= ({(((8'had) ? (8'hbd) : (8'hb0)) ? ((8'hab) ? (8'hb5) : (8'ha3)) : ((8'hac) ^ (8'hb6))), (+(^~(8'hb7)))} << ((((8'had) & (8'ha8)) ? (&(8'h9e)) : {(8'hb2), (8'hb4)}) <<< ((|(8'h9f)) == {(8'h9c)})))), 
parameter param105 = {((param104 || ({param104} ? ((8'hb5) >> param104) : (param104 == param104))) <<< {{(param104 <<< param104)}})})
(y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire83;
  input wire [(3'h5):(1'h0)] wire82;
  input wire signed [(3'h4):(1'h0)] wire81;
  input wire [(5'h12):(1'h0)] wire80;
  input wire [(5'h11):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire101;
  wire signed [(5'h12):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire84;
  assign y = {wire103, wire101, wire86, wire85, wire84, (1'h0)};
  assign wire84 = $unsigned((wire81[(2'h3):(1'h0)] >>> $unsigned($unsigned((!wire82)))));
  assign wire85 = (&wire83[(3'h4):(2'h3)]);
  assign wire86 = (8'haf);
  module87 #() modinst102 (.clk(clk), .wire90(wire81), .wire91(wire79), .wire89(wire80), .y(wire101), .wire88(wire84));
  assign wire103 = $unsigned($signed(wire79[(4'hc):(4'ha)]));
endmodule

module module11
#(parameter param72 = (~&({((7'h42) ? ((8'ha5) ? (8'hbb) : (8'hb3)) : {(8'hac)}), ((&(8'hb8)) ? (8'hbf) : (~&(8'ha1)))} ^ ((((8'hb5) << (8'ha1)) ? (-(8'hb8)) : ((8'hb1) ? (7'h41) : (8'hba))) <= (8'ha2)))), 
parameter param73 = ({(~&(param72 ? param72 : param72))} <<< param72))
(y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire [(4'ha):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire41;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire68;
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire17,
                 wire18,
                 wire40,
                 wire41,
                 wire42,
                 wire68,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire17 = {{{{$unsigned(wire15), wire13[(3'h5):(3'h5)]},
                              $signed((wire16 ? wire15 : wire14))}},
                      ((8'hbf) ?
                          wire15 : {$signed(wire15[(1'h1):(1'h0)]),
                              ($signed(wire14) ?
                                  ((8'hbc) ? wire15 : wire12) : ((8'haf) ?
                                      wire15 : wire15))})};
  assign wire18 = (+wire17);
  always
    @(posedge clk) begin
      reg19 <= (-{(|(~wire16))});
      if (wire14[(4'h9):(2'h3)])
        begin
          if (($unsigned($signed((wire13[(4'hb):(4'ha)] ?
                  wire14 : wire18[(1'h0):(1'h0)]))) ?
              ($unsigned({wire12[(2'h2):(1'h0)], (wire16 ? wire13 : reg19)}) ?
                  (^{wire12[(3'h5):(2'h3)]}) : wire18) : $signed(($unsigned((wire12 ?
                      wire14 : wire16)) ?
                  ((8'ha9) ?
                      (reg19 ?
                          wire16 : wire16) : $unsigned(reg19)) : ($signed(wire14) ?
                      wire18 : $unsigned(wire17))))))
            begin
              reg20 <= $unsigned(wire18[(5'h11):(3'h6)]);
              reg21 <= (!((~&((8'ha9) - wire12)) >>> (reg20[(4'hd):(4'h9)] ?
                  $signed(wire15[(3'h6):(2'h2)]) : $unsigned((reg20 ?
                      wire14 : wire13)))));
            end
          else
            begin
              reg20 <= wire12;
              reg21 <= $signed(wire14);
              reg22 <= (!(^~(reg20[(3'h5):(3'h4)] >> reg21)));
              reg23 <= $unsigned(($unsigned(wire16) <= (&wire15[(2'h3):(1'h0)])));
              reg24 <= $signed(wire15[(1'h0):(1'h0)]);
            end
          reg25 <= $signed((~^(8'hbe)));
        end
      else
        begin
          reg20 <= wire17;
          reg21 <= $unsigned((-$unsigned(((wire15 * (8'hbd)) == (!wire17)))));
          reg22 <= wire12;
          if ($signed(wire17[(1'h0):(1'h0)]))
            begin
              reg23 <= (($unsigned(wire14) ?
                  (~$unsigned(((8'hbd) ? reg25 : reg22))) : (wire15 ?
                      ((wire15 && (8'ha1)) ?
                          (reg24 ?
                              (8'hae) : wire18) : (reg23 ^~ reg20)) : $unsigned((reg20 ?
                          reg24 : reg23)))) >> ({(~&(wire16 ?
                          wire12 : (8'hb1))),
                      (reg21 ? wire17 : $unsigned(wire17))} ?
                  reg22[(2'h3):(1'h1)] : reg23));
            end
          else
            begin
              reg23 <= {{$unsigned({(wire18 ? reg23 : reg25),
                          {wire12, (8'ha7)}})}};
              reg24 <= ({reg24[(4'hb):(3'h7)], (^~(!wire15))} ?
                  reg20[(3'h5):(1'h0)] : $unsigned((^~(wire12[(3'h4):(2'h2)] ?
                      $unsigned(wire13) : wire14[(2'h2):(1'h1)]))));
            end
        end
      if (wire15[(4'hb):(4'hb)])
        begin
          reg26 <= $signed($signed(reg22[(1'h0):(1'h0)]));
          if ($signed((^~($signed((~^wire17)) ?
              $signed((wire17 - reg26)) : (8'hbf)))))
            begin
              reg27 <= (8'hbd);
              reg28 <= wire13;
              reg29 <= reg25[(4'h9):(4'h8)];
            end
          else
            begin
              reg27 <= $unsigned($signed(({(reg26 ?
                      (7'h43) : (8'ha3))} << ($signed((8'hae)) & wire15[(4'he):(4'hd)]))));
              reg28 <= ((8'hbd) ?
                  $signed({$signed($signed(reg25))}) : $signed(reg25));
            end
          if ((!reg24))
            begin
              reg30 <= reg29[(4'hd):(4'ha)];
            end
          else
            begin
              reg30 <= $signed($signed(reg21));
              reg31 <= (wire16[(1'h1):(1'h1)] * $unsigned(reg26));
              reg32 <= ($signed($signed((8'hae))) == $signed((wire13 <= (!reg22[(3'h4):(1'h0)]))));
              reg33 <= {((reg25 ?
                          ($signed((7'h40)) < wire15) : $signed((8'h9d))) ?
                      wire14 : $unsigned(((~&wire14) >>> (~|reg27)))),
                  (~((8'hb3) < (~$unsigned((8'hb3)))))};
              reg34 <= ({$unsigned((reg27[(1'h1):(1'h1)] ?
                          (~&reg24) : (^reg27)))} ?
                  ({$unsigned((reg28 >>> reg26))} ?
                      ((~|(reg20 ? wire12 : reg28)) ?
                          reg25[(4'hf):(4'h8)] : $signed((wire14 == wire15))) : reg23) : (reg20 >= {({reg24} != ((8'hbb) ?
                          reg24 : reg31))}));
            end
        end
      else
        begin
          reg26 <= reg25[(1'h1):(1'h1)];
        end
      if (({reg20[(3'h7):(3'h5)],
          ((^~$signed(reg21)) ? reg27 : $unsigned((reg20 - reg32)))} * (reg32 ?
          {$unsigned((!reg19)), (&$unsigned((8'hac)))} : $unsigned(reg26))))
        begin
          reg35 <= wire13[(4'he):(4'he)];
          reg36 <= (^(((-(reg26 << reg19)) | (^~(-reg20))) + ($signed($signed(wire16)) <= $unsigned($unsigned(reg35)))));
          reg37 <= (^~{wire18,
              $signed(((wire18 >= reg24) >>> (wire17 ? reg24 : wire14)))});
        end
      else
        begin
          reg35 <= $signed(($unsigned($signed(reg19[(1'h0):(1'h0)])) & (-({wire13} ?
              $signed((8'had)) : wire18[(4'h8):(3'h6)]))));
          if ($signed(reg30[(2'h2):(1'h1)]))
            begin
              reg36 <= (8'ha7);
              reg37 <= (reg24[(5'h11):(3'h6)] ?
                  $signed((reg29 ^~ ((reg34 & reg23) < (&(8'ha9))))) : {(((~&(8'hb2)) ?
                              wire16[(1'h1):(1'h1)] : reg23[(1'h1):(1'h0)]) ?
                          (-(reg37 ? reg35 : reg22)) : ((reg34 >> wire17) ?
                              (reg23 ? reg24 : reg32) : (wire17 ~^ (8'ha0)))),
                      $unsigned({(^~wire12), $signed(wire15)})});
            end
          else
            begin
              reg36 <= (($unsigned(reg33) | (8'h9f)) ?
                  ((($unsigned(reg35) ?
                          $unsigned((8'haa)) : $unsigned(reg32)) - $unsigned($signed(reg20))) ?
                      (|reg36) : (-$unsigned((reg27 ?
                          reg29 : reg36)))) : ((((8'hae) != reg27) ?
                          reg24[(3'h4):(1'h0)] : ((7'h42) > $signed(reg26))) ?
                      reg21 : reg19));
              reg37 <= ((8'hb8) ?
                  (((reg34 <<< {reg25, reg21}) ?
                          ((!reg20) && reg19) : (reg25[(4'hf):(3'h7)] ?
                              (wire14 ? (8'ha4) : reg20) : $signed(reg34))) ?
                      reg33[(3'h4):(1'h1)] : $unsigned((~|(wire17 >>> wire13)))) : reg34[(1'h1):(1'h1)]);
            end
        end
      reg38 <= reg33;
    end
  always
    @(posedge clk) begin
      reg39 <= (~^wire12[(1'h0):(1'h0)]);
    end
  assign wire40 = (!($unsigned(wire18) ?
                      ($signed($signed(reg31)) <<< ({reg30} ^ wire14)) : {wire17}));
  assign wire41 = $unsigned(({((8'hab) ? reg37[(2'h3):(2'h2)] : {reg21, reg30}),
                          (~(reg21 >>> reg20))} ?
                      $signed(((-reg31) ?
                          reg23 : $unsigned(reg35))) : ($unsigned((wire18 ?
                              reg30 : reg27)) ?
                          (^(wire40 ? wire18 : reg21)) : (+reg19))));
  assign wire42 = reg22;
  module43 #() modinst69 (.clk(clk), .y(wire68), .wire46(wire14), .wire48(wire40), .wire44(wire41), .wire47(reg19), .wire45(reg20));
  assign wire70 = reg37;
  assign wire71 = {(~&((^(8'haa)) ?
                          ((wire70 ?
                              reg31 : wire42) >> (~^wire70)) : reg24[(5'h11):(4'he)]))};
endmodule

module module43  (y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire48;
  input wire signed [(4'he):(1'h0)] wire47;
  input wire [(3'h7):(1'h0)] wire46;
  input wire [(4'hb):(1'h0)] wire45;
  input wire [(5'h13):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire50,
                 wire49,
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
                 reg57,
                 reg56,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire49 = wire48[(3'h7):(1'h1)];
  assign wire50 = wire47;
  always
    @(posedge clk) begin
      reg51 <= wire44[(4'h8):(3'h6)];
      reg52 <= $signed({(~|wire45[(3'h4):(2'h3)])});
      reg53 <= {(wire47 <<< wire45)};
    end
  assign wire54 = (wire44 * ((reg53 ?
                          {(wire50 >= (8'ha2)),
                              (-wire49)} : wire49[(4'ha):(4'h8)]) ?
                      $signed(((wire46 | wire49) >= $signed(wire47))) : $signed($signed((~|reg52)))));
  assign wire55 = (($unsigned((~|((8'hb9) > wire49))) ^~ wire48) ?
                      $signed((+wire50[(3'h7):(3'h7)])) : (~&wire45));
  always
    @(posedge clk) begin
      if ($unsigned((^wire47)))
        begin
          reg56 <= ($unsigned($unsigned(reg53)) >> ({(wire54 <<< ((8'h9e) ?
                  wire45 : wire47)),
              ($signed((8'h9d)) - $unsigned(wire47))} == (!((wire44 ?
                  wire44 : wire54) ?
              (wire55 ? wire54 : wire46) : (reg52 ? reg53 : wire48)))));
          reg57 <= wire47;
          if ({reg51[(2'h3):(1'h1)],
              (&$signed($unsigned(wire49[(4'h9):(1'h0)])))})
            begin
              reg58 <= ($signed($unsigned($unsigned($signed((8'hba))))) ?
                  $signed($signed((((8'ha2) & wire49) ?
                      $signed(wire49) : (reg52 >= (8'h9e))))) : $unsigned($signed($unsigned(wire54))));
              reg59 <= wire46;
            end
          else
            begin
              reg58 <= $signed($signed(reg53[(3'h7):(1'h1)]));
            end
          reg60 <= $unsigned(((&({reg53} ?
              wire47[(3'h7):(1'h1)] : (8'hbc))) ^~ wire46[(3'h4):(2'h3)]));
        end
      else
        begin
          reg56 <= wire46;
          reg57 <= ($unsigned((((~&wire50) ?
              wire48 : {reg57}) >> ((reg57 ~^ wire50) && wire44))) > ({(&$unsigned(wire49)),
              $signed($unsigned(reg51))} >>> {wire48[(2'h3):(2'h2)]}));
          reg58 <= (8'h9f);
          reg59 <= {reg60[(2'h3):(2'h3)], (~|wire48)};
          reg60 <= (reg57[(4'hd):(3'h5)] ?
              ($unsigned(reg58) != ((((8'hae) ? wire45 : reg58) ?
                      (wire46 + reg59) : reg58[(3'h6):(3'h4)]) ?
                  $unsigned($signed(wire54)) : wire54)) : reg57[(3'h4):(1'h0)]);
        end
      reg61 <= {(~^$signed(wire48)),
          $unsigned((($signed(reg52) ^ $signed(wire45)) <= (~&$unsigned(reg53))))};
      if (((((+(~&wire47)) ^ wire49) ?
              (reg59 && reg51[(1'h0):(1'h0)]) : $signed($unsigned(reg58))) ?
          (+(^~($signed(wire45) ~^ {reg59}))) : (reg52 ?
              $signed({(wire47 ? (8'ha6) : (8'hb7)),
                  (wire54 ? reg52 : wire47)}) : (!((wire49 ? reg56 : reg51) ?
                  $unsigned(wire55) : (^reg58))))))
        begin
          if ($unsigned($signed(wire50)))
            begin
              reg62 <= (^~reg53[(4'ha):(3'h7)]);
              reg63 <= $signed($signed((~|((7'h43) ^~ $signed(wire49)))));
              reg64 <= $signed((8'had));
            end
          else
            begin
              reg62 <= (wire44 ?
                  (reg58 << (~^reg52)) : (((reg60[(2'h3):(2'h2)] * (~|wire48)) ?
                          reg53[(4'hb):(3'h4)] : reg51) ?
                      $unsigned(reg58[(2'h2):(1'h1)]) : $signed((reg57 && wire47))));
            end
          reg65 <= $signed((wire49 ?
              $signed(reg59) : ($unsigned($signed(reg61)) ?
                  ((wire49 ? wire49 : (7'h44)) >> (wire48 ?
                      reg59 : reg63)) : reg51[(1'h0):(1'h0)])));
          reg66 <= ((~^wire54) || $unsigned((~&(~^{(8'h9d), wire50}))));
          reg67 <= ((8'hb6) <<< (~reg56[(2'h3):(2'h2)]));
        end
      else
        begin
          reg62 <= $signed($signed(reg58));
          reg63 <= ($unsigned(reg52) ?
              ({$unsigned(((8'hb7) >= reg64)), reg57} * {({(8'hbd), reg51} ?
                      $signed((8'hb4)) : (^(8'ha2)))}) : $unsigned((~|{reg62[(2'h2):(2'h2)]})));
        end
    end
endmodule

module module87
#(parameter param99 = {(-(^((!(8'ha4)) << ((7'h40) ? (8'ha5) : (8'hb8)))))}, 
parameter param100 = (~(param99 >> (!((8'h9e) ? (~^param99) : (param99 + param99))))))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire91;
  input wire [(2'h3):(1'h0)] wire90;
  input wire [(3'h7):(1'h0)] wire89;
  input wire [(3'h5):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire96;
  wire signed [(3'h4):(1'h0)] wire95;
  wire signed [(2'h3):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  assign y = {wire98, wire97, wire96, wire95, wire94, wire93, reg92, (1'h0)};
  always
    @(posedge clk) begin
      reg92 <= ($unsigned(wire91[(3'h5):(2'h2)]) >= {wire88[(1'h1):(1'h0)]});
    end
  assign wire93 = wire88[(3'h5):(3'h4)];
  assign wire94 = wire88;
  assign wire95 = ((wire94 ?
                          reg92 : $signed(((wire88 ? wire89 : wire91) ?
                              wire93 : wire89[(1'h0):(1'h0)]))) ?
                      $signed((~wire93[(2'h3):(2'h2)])) : (((8'ha3) ?
                          (-wire90) : $signed(wire94[(2'h3):(2'h3)])) ~^ ((~(wire93 - wire93)) ?
                          (+(~^wire91)) : (wire93[(1'h0):(1'h0)] ?
                              ((8'ha9) ? reg92 : (8'hbe)) : $signed(wire88)))));
  assign wire96 = $signed($unsigned(wire94[(1'h1):(1'h0)]));
  assign wire97 = $signed(reg92);
  assign wire98 = (8'hb5);
endmodule
