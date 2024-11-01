module top
#(parameter param97 = ((+((((8'ha3) << (8'hab)) << ((8'h9d) >>> (8'h9d))) ? {((8'hbd) + (7'h42)), ((8'hb4) ? (8'hbd) : (7'h40))} : ((~&(8'ha7)) && ((7'h43) ^ (8'ha2))))) * (((+(^~(8'hac))) ? (~|((8'haf) ? (8'hae) : (8'ha3))) : (&(&(8'h9c)))) <= ((((8'hb2) ? (8'hb2) : (8'ha2)) && ((8'h9f) ? (8'hb4) : (8'ha3))) | (&((7'h42) ? (8'hba) : (8'hae)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire92;
  wire signed [(3'h4):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire90;
  wire [(2'h2):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = wire1;
  module7 #() modinst82 (wire81, clk, wire0, wire6, wire4, wire2);
  assign wire83 = (~|{(&$signed(wire5[(3'h6):(2'h3)])), wire6[(3'h5):(1'h1)]});
  assign wire84 = (wire0[(1'h0):(1'h0)] ?
                      (^~wire83[(3'h4):(2'h2)]) : $unsigned(wire4[(4'h8):(3'h6)]));
  assign wire85 = (+((wire2[(3'h7):(1'h0)] || ($signed(wire6) > $signed(wire84))) ?
                      $signed($signed((wire5 ?
                          wire2 : wire2))) : wire2[(2'h2):(1'h1)]));
  assign wire86 = $unsigned($signed({$signed(((8'had) + wire6)),
                      (wire85 * (wire84 + wire81))}));
  assign wire87 = ($unsigned((wire6 ?
                          ((!(8'haa)) ?
                              (wire83 >>> wire84) : (wire4 ?
                                  wire4 : wire86)) : wire81)) ?
                      ((&{wire2[(4'ha):(4'h8)]}) ?
                          $unsigned(wire83) : ($unsigned($unsigned(wire6)) | (~&(wire1 & wire83)))) : ($signed((^(wire6 <<< wire5))) ?
                          {$signed($unsigned((8'haf)))} : wire0[(1'h1):(1'h1)]));
  assign wire88 = wire6[(2'h2):(1'h1)];
  assign wire89 = $unsigned(wire84[(3'h5):(2'h3)]);
  assign wire90 = $signed((~|$unsigned(((wire3 ?
                      wire85 : wire85) + $unsigned((8'hbf))))));
  assign wire91 = wire89;
  assign wire92 = wire81[(2'h2):(2'h2)];
  assign wire93 = wire86;
  assign wire94 = (wire0[(4'hb):(1'h0)] >> wire92);
  assign wire95 = wire81[(1'h1):(1'h1)];
  assign wire96 = $signed($signed((-({wire85, wire88} <= wire94))));
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  input wire [(3'h6):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  assign y = {wire80, wire79, wire77, wire14, wire13, wire12, (1'h0)};
  assign wire12 = wire8[(2'h2):(1'h1)];
  assign wire13 = (-wire11);
  assign wire14 = ((wire9 ?
                      (wire8[(1'h1):(1'h1)] >> wire13[(4'h9):(1'h1)]) : wire8) | ($unsigned($signed((wire13 > wire9))) > $signed($signed(wire10[(4'h8):(4'h8)]))));
  module15 #() modinst78 (wire77, clk, wire8, wire14, wire12, wire11);
  assign wire79 = (|wire10[(4'h9):(3'h5)]);
  assign wire80 = wire10[(1'h0):(1'h0)];
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h2e5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire signed [(4'ha):(1'h0)] wire18;
  input wire signed [(4'hd):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire73,
                 wire60,
                 wire49,
                 wire48,
                 wire27,
                 wire26,
                 wire25,
                 wire22,
                 wire21,
                 wire20,
                 reg74,
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
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
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
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire20 = (-(($unsigned(wire16[(2'h2):(1'h0)]) & wire18[(3'h6):(3'h6)]) ?
                      $signed((|(8'hb6))) : {(~{wire19}), $signed(wire17)}));
  assign wire21 = wire18;
  assign wire22 = ($unsigned((-$unsigned(wire18[(1'h0):(1'h0)]))) >= $unsigned((($signed((8'ha0)) ?
                          (wire19 ? wire18 : (8'h9c)) : wire20) ?
                      wire18[(2'h2):(1'h1)] : wire20[(4'he):(3'h7)])));
  always
    @(posedge clk) begin
      reg23 <= {(~wire18)};
      reg24 <= wire16[(2'h2):(1'h0)];
    end
  assign wire25 = $signed((-wire19[(4'h8):(1'h1)]));
  assign wire26 = wire19[(4'hd):(3'h7)];
  assign wire27 = (($signed({(wire25 ? wire17 : wire22)}) ?
                          (wire17[(3'h5):(1'h0)] > reg24[(4'h9):(3'h5)]) : wire21) ?
                      $signed(((reg23 & wire21[(4'he):(4'h8)]) && (^~(~|wire20)))) : $signed(({wire20} * $signed((reg23 ?
                          wire16 : wire25)))));
  always
    @(posedge clk) begin
      reg28 <= (^reg24);
      reg29 <= (&(|$signed($unsigned((wire19 ? wire27 : wire19)))));
      if (wire16)
        begin
          if ($unsigned((wire20 ? wire20 : (8'haf))))
            begin
              reg30 <= (+reg24);
              reg31 <= wire20;
              reg32 <= reg30[(5'h12):(4'hb)];
              reg33 <= reg24;
              reg34 <= $signed($unsigned(((reg32 ?
                  (~|(8'hb9)) : $signed(reg23)) && wire25)));
            end
          else
            begin
              reg30 <= reg34[(4'ha):(3'h7)];
              reg31 <= $unsigned(((reg23 >= ($signed(wire22) ~^ {reg24})) ?
                  $signed(($signed(wire20) <<< $signed(reg34))) : wire26[(4'hb):(3'h4)]));
              reg32 <= reg31;
            end
          if (reg34)
            begin
              reg35 <= (wire17[(3'h5):(3'h5)] > $signed((-reg24)));
            end
          else
            begin
              reg35 <= (^(+reg35[(4'ha):(3'h6)]));
              reg36 <= {(8'hb4)};
              reg37 <= (~$unsigned((($unsigned(reg23) ?
                      (~&wire19) : $unsigned(wire25)) ?
                  wire18[(3'h6):(3'h6)] : wire21[(3'h6):(2'h3)])));
              reg38 <= ((~^wire22) ^ reg23[(1'h0):(1'h0)]);
              reg39 <= {reg31};
            end
          reg40 <= reg36[(4'hd):(2'h2)];
          reg41 <= $unsigned((reg23[(1'h0):(1'h0)] ?
              ((reg23[(1'h1):(1'h1)] ? {reg33, reg34} : (-wire26)) ?
                  reg40 : wire21[(5'h10):(4'h9)]) : {{(reg23 ^~ wire26),
                      (~|(8'ha3))},
                  ({reg38, reg31} || (reg40 ? (8'hb8) : wire18))}));
          reg42 <= ($signed((wire20 ? reg37 : reg37)) | reg37[(2'h3):(2'h3)]);
        end
      else
        begin
          reg30 <= wire18[(4'ha):(2'h2)];
          reg31 <= (8'hb8);
          if (reg31)
            begin
              reg32 <= reg35[(4'hc):(4'hc)];
              reg33 <= ((wire22 ?
                      ($unsigned(((8'hac) ?
                          wire21 : wire19)) <= reg41) : reg41[(3'h5):(3'h4)]) ?
                  reg30[(1'h1):(1'h1)] : $unsigned($unsigned((~|(reg41 && wire21)))));
              reg34 <= (~|$unsigned(reg42[(4'ha):(3'h5)]));
              reg35 <= (reg31[(1'h1):(1'h0)] << reg35);
              reg36 <= (~^($signed($unsigned($unsigned(wire19))) ?
                  $signed($unsigned({reg30})) : (-{(reg40 != reg23)})));
            end
          else
            begin
              reg32 <= ($unsigned(reg38[(4'h9):(2'h3)]) ?
                  (8'hb3) : (!(-(^~$signed(reg35)))));
            end
          reg37 <= reg37[(3'h4):(1'h0)];
          if ({{reg39[(5'h11):(5'h10)],
                  (reg38 ?
                      (reg36 <= reg42[(4'h9):(2'h2)]) : ($unsigned(reg42) ?
                          reg30[(1'h0):(1'h0)] : (reg28 - reg23)))},
              $unsigned($unsigned((~(reg30 | reg42))))})
            begin
              reg38 <= $signed((({$signed(reg23)} ?
                  $unsigned($unsigned(reg39)) : {$unsigned(wire26)}) < ($unsigned($signed(reg29)) - (reg24[(2'h3):(2'h2)] == (wire18 && reg23)))));
              reg39 <= wire20;
            end
          else
            begin
              reg38 <= (!((^~$signed(((8'hba) ?
                  reg30 : reg35))) & $unsigned(($signed(reg34) ^~ ((8'hac) != wire20)))));
              reg39 <= $signed(($signed(reg30) || (-$unsigned({reg28,
                  reg24}))));
              reg40 <= (|reg23);
            end
        end
      if ((7'h43))
        begin
          reg43 <= (8'ha5);
          reg44 <= (|(($signed(reg36) && (wire18[(3'h4):(3'h4)] > $signed(reg43))) >> reg24[(3'h7):(1'h1)]));
          if (((~|(reg39 ?
              (((7'h43) >= wire19) * (^~reg38)) : ($unsigned(reg39) ?
                  $unsigned(reg39) : reg29[(1'h0):(1'h0)]))) && $signed(($unsigned(reg23) > (-$signed(wire25))))))
            begin
              reg45 <= $signed(($unsigned({$signed(reg37), wire25}) ?
                  $unsigned((((8'h9e) ? wire18 : reg38) ?
                      $signed(wire27) : wire26)) : $unsigned($signed((^reg23)))));
              reg46 <= reg40[(1'h1):(1'h1)];
            end
          else
            begin
              reg45 <= (^$unsigned({$unsigned(wire21[(4'hb):(3'h4)]),
                  ($unsigned((8'hb4)) > reg38[(1'h1):(1'h0)])}));
              reg46 <= (&((wire26 ?
                  ($unsigned((8'hb5)) >> reg31[(4'hb):(3'h6)]) : (wire22 ^~ $signed((8'h9e)))) ^~ ((8'hbc) < $unsigned($signed(wire16)))));
              reg47 <= reg41;
            end
        end
      else
        begin
          reg43 <= reg39[(4'hb):(1'h1)];
          reg44 <= (&(8'h9e));
          reg45 <= (+wire16[(3'h7):(1'h1)]);
          reg46 <= $signed($unsigned(reg36));
          reg47 <= {(reg42[(4'h9):(3'h4)] ? reg38 : (8'ha0))};
        end
    end
  assign wire48 = ((^({(|wire27),
                      $unsigned((7'h44))} ~^ reg37)) + reg44[(3'h7):(3'h6)]);
  assign wire49 = $unsigned(($unsigned((~^(reg41 * reg34))) ?
                      reg46 : ({reg46[(3'h6):(1'h0)], $unsigned((8'h9f))} ?
                          wire17 : ($unsigned(reg45) >> reg33))));
  always
    @(posedge clk) begin
      if (reg38[(3'h7):(3'h7)])
        begin
          reg50 <= (!$signed({(|$unsigned(reg41))}));
          if ((|{(~|(reg45[(3'h7):(3'h4)] ?
                  (reg37 ? reg35 : wire17) : (wire20 ? wire22 : reg47)))}))
            begin
              reg51 <= $signed(reg40[(2'h3):(2'h3)]);
              reg52 <= (~&{(wire26 ?
                      ($signed(reg50) >>> (~|reg41)) : ((reg32 ?
                          reg24 : reg33) ^ (reg28 && reg35))),
                  reg50[(3'h6):(1'h1)]});
              reg53 <= {{(&((wire21 - wire48) & $signed(reg47))),
                      (wire48[(1'h1):(1'h0)] ?
                          (wire16 << (8'ha1)) : (wire22[(4'hc):(2'h3)] ?
                              wire27[(5'h13):(4'hd)] : wire25[(3'h4):(2'h3)]))},
                  {reg40[(3'h4):(1'h1)], $signed({reg31})}};
            end
          else
            begin
              reg51 <= wire22;
            end
        end
      else
        begin
          if ((wire49 ?
              (!$unsigned((reg32[(1'h0):(1'h0)] ?
                  $signed(reg33) : reg50[(3'h6):(3'h4)]))) : {wire26[(1'h0):(1'h0)]}))
            begin
              reg50 <= ($unsigned(((8'ha8) ?
                      ($unsigned(reg30) - (~|wire22)) : (~^(reg39 >= wire17)))) ?
                  $unsigned((($unsigned(reg34) < (reg53 << wire25)) ^ wire17[(3'h4):(3'h4)])) : (reg37 ?
                      $unsigned($signed((^~reg29))) : (reg42 ?
                          (!reg30[(5'h14):(5'h11)]) : $unsigned((reg46 ?
                              reg23 : wire26)))));
              reg51 <= (^~((reg45 ?
                  $signed($signed((8'hbd))) : $signed((reg39 - reg52))) < wire16[(3'h4):(1'h1)]));
              reg52 <= $signed($unsigned(wire26));
              reg53 <= $signed((wire16 > (~&$signed(wire49))));
            end
          else
            begin
              reg50 <= {((8'ha3) ?
                      (-(~^(reg47 ? reg42 : reg44))) : $signed((8'hb2)))};
              reg51 <= reg23[(1'h1):(1'h1)];
            end
          reg54 <= (8'hae);
          reg55 <= ($unsigned(($unsigned($unsigned((8'hba))) < ((wire18 == reg51) ?
              $unsigned(reg42) : (reg45 ?
                  wire16 : (8'hb8))))) ^ wire18[(2'h2):(1'h0)]);
        end
      reg56 <= reg28[(1'h0):(1'h0)];
      reg57 <= ($signed(reg32[(2'h2):(1'h0)]) ?
          reg43 : (reg53[(1'h0):(1'h0)] ?
              ({$unsigned(reg28), $unsigned((8'hb0))} ?
                  reg53 : ($unsigned(wire48) ?
                      $signed(wire16) : (~|reg31))) : (((8'hbd) + reg47) ?
                  ($unsigned(reg53) ?
                      reg24 : $unsigned(reg24)) : reg50[(3'h6):(3'h6)])));
      reg58 <= $unsigned((reg39[(4'hd):(1'h1)] << $signed(reg55)));
      reg59 <= reg57;
    end
  assign wire60 = (+$signed(reg33[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg61 <= (($signed($unsigned($signed(reg38))) & reg59) ?
          (-$unsigned(reg35[(4'hf):(4'hc)])) : reg28);
    end
  always
    @(posedge clk) begin
      if ($unsigned((|$signed($signed(wire48[(2'h3):(1'h0)])))))
        begin
          reg62 <= $signed($unsigned(reg56));
          reg63 <= $signed(wire18[(2'h2):(1'h1)]);
          reg64 <= {({((reg62 + reg23) ?
                      reg23 : $unsigned(reg34))} >>> $signed((!$signed(reg55))))};
          reg65 <= reg64;
          if ((+($signed(wire20) < wire60)))
            begin
              reg66 <= reg61[(3'h4):(1'h0)];
              reg67 <= {reg59[(3'h5):(1'h0)], (!(8'hbb))};
            end
          else
            begin
              reg66 <= $signed((((!(reg43 ? reg62 : (8'hb8))) ?
                  (+$signed(reg23)) : ((reg61 ? reg52 : reg40) ?
                      reg34[(3'h4):(2'h2)] : (wire49 ?
                          (8'hac) : reg24))) <= reg67[(1'h1):(1'h0)]));
              reg67 <= {(~&$signed((~&reg23))), reg32[(4'h8):(3'h5)]};
              reg68 <= reg63[(5'h10):(5'h10)];
              reg69 <= ($unsigned((&{$signed(reg51)})) ?
                  $unsigned($unsigned({{reg67}})) : wire60);
              reg70 <= (((wire27[(4'ha):(2'h3)] ?
                      $unsigned((|(7'h40))) : reg37[(2'h2):(2'h2)]) ?
                  ({reg52[(3'h4):(1'h0)], (wire19 < reg46)} ?
                      (8'hbd) : reg40[(2'h3):(2'h3)]) : reg56) == (^~((&{wire49}) ?
                  reg59[(1'h0):(1'h0)] : (~^reg47[(3'h5):(2'h2)]))));
            end
        end
      else
        begin
          reg62 <= reg56;
          reg63 <= ($signed(reg61) ?
              ($unsigned(($unsigned(reg24) ?
                      (reg45 ? reg35 : wire25) : $unsigned(wire22))) ?
                  $signed(reg42[(3'h5):(3'h4)]) : $unsigned(({reg28} || reg34))) : ($signed((reg51 ?
                  (-reg63) : {reg66})) << reg41));
        end
      reg71 <= $signed(({((+reg40) ? (reg58 + (8'hac)) : $signed((8'ha1))),
              $unsigned((wire17 & (8'hac)))} ?
          (~^(~^(~|reg38))) : reg65[(3'h6):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg72 <= (^(^$signed((~(reg55 ? reg24 : reg29)))));
    end
  assign wire73 = (+$unsigned(((|$unsigned(reg40)) || (reg55 ?
                      reg44[(4'hc):(4'ha)] : reg70[(5'h11):(3'h6)]))));
  always
    @(posedge clk) begin
      reg74 <= $signed(reg42);
    end
  assign wire75 = $unsigned($signed({(&$signed(wire17))}));
  assign wire76 = $signed(reg72[(5'h10):(4'ha)]);
endmodule
