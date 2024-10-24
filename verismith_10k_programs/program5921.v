module top
#(parameter param96 = {(^~((~&((8'hbd) ? (8'hac) : (8'hb8))) >> (!(|(8'h9f))))), (((^((8'hab) ? (7'h41) : (8'ha3))) ? ({(8'hac)} ? {(8'ha0), (8'hbd)} : ((8'ha6) | (8'had))) : (~(+(8'ha3)))) ? (^~{((8'hbb) ? (8'h9f) : (8'ha4))}) : {(|((8'hac) ? (8'hb4) : (8'hb4))), (~^(~&(8'ha9)))})}, 
parameter param97 = {(param96 ? (~^(8'ha7)) : (((^~(8'hab)) ? param96 : (param96 > param96)) ? ((8'h9f) & (7'h44)) : param96))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h2ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire90;
  wire signed [(2'h2):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire83;
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire4,
                 wire5,
                 wire6,
                 wire21,
                 wire22,
                 wire23,
                 wire29,
                 wire54,
                 wire55,
                 wire83,
                 reg95,
                 reg94,
                 reg86,
                 reg85,
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
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 (1'h0)};
  assign wire4 = wire1[(3'h7):(1'h0)];
  assign wire5 = {(+($signed((~|(8'ha9))) + $unsigned((wire1 ^ (8'hbc)))))};
  assign wire6 = wire2;
  always
    @(posedge clk) begin
      if (($signed((&$signed({wire2, wire4}))) ?
          {wire4,
              ($unsigned((wire1 ~^ wire6)) | ((~^wire5) ?
                  wire1[(1'h1):(1'h1)] : $unsigned(wire0)))} : $unsigned(($unsigned($signed(wire4)) << (wire3[(2'h2):(1'h1)] > (wire2 ?
              wire0 : wire5))))))
        begin
          reg7 <= (wire1[(3'h5):(1'h0)] ?
              wire5[(4'h9):(4'h9)] : wire3[(1'h0):(1'h0)]);
          reg8 <= (~^$unsigned($signed(((wire4 & wire4) ?
              $signed(wire6) : $unsigned((8'ha8))))));
          reg9 <= ((($signed(((7'h42) <<< wire3)) ^~ wire4[(4'hc):(2'h3)]) || wire2) ?
              $unsigned($signed(({wire5} ?
                  (reg7 ? wire3 : wire1) : $unsigned(wire4)))) : wire4);
        end
      else
        begin
          if ($unsigned($signed(wire0)))
            begin
              reg7 <= $signed($unsigned((($unsigned(wire6) >= ((8'ha8) ?
                      (8'hba) : wire6)) ?
                  reg8 : {(reg8 >>> (8'had))})));
              reg8 <= $unsigned((!((8'hb7) >= (reg8 - wire1[(2'h3):(1'h1)]))));
              reg9 <= (+($signed($unsigned(reg9)) ?
                  (reg8 ?
                      {wire0[(3'h7):(2'h3)]} : (~^(&wire0))) : $signed(($unsigned(reg8) ?
                      (reg9 || wire3) : reg8))));
              reg10 <= (&$signed((((~^wire5) * {(8'hb2), wire3}) ?
                  ({wire6} ?
                      $signed(wire3) : (wire1 & (8'hb9))) : ((~^(8'hb3)) ?
                      {wire3, wire2} : ((8'ha0) ? (8'hb6) : reg9)))));
            end
          else
            begin
              reg7 <= (($unsigned(($signed(wire1) ?
                          $unsigned((7'h42)) : $signed((8'hae)))) ?
                      $signed($signed(wire4[(4'hf):(4'hd)])) : ((~{wire3,
                              reg7}) ?
                          $unsigned($signed(wire3)) : (8'hb6))) ?
                  (~|(~(-(wire6 ~^ (7'h42))))) : (($signed((reg7 * wire4)) ?
                          (reg9[(2'h3):(1'h1)] ?
                              (^~(8'haf)) : wire1[(4'hb):(4'hb)]) : ((reg8 ?
                              wire1 : wire3) ~^ (reg8 | wire6))) ?
                      (((reg10 ? (8'hab) : (8'ha3)) + (&wire2)) ?
                          {$signed(wire4)} : wire0) : {$signed(wire0[(3'h5):(2'h2)]),
                          $signed(reg7)}));
              reg8 <= wire3[(1'h0):(1'h0)];
              reg9 <= (7'h42);
              reg10 <= reg7[(3'h6):(1'h0)];
              reg11 <= wire6;
            end
          if ($signed(wire0[(3'h5):(3'h5)]))
            begin
              reg12 <= (~^$signed(wire1));
            end
          else
            begin
              reg12 <= (reg8[(4'hf):(3'h5)] ?
                  (reg8 + ($signed($unsigned(wire6)) >= wire0[(4'h8):(3'h5)])) : wire3[(2'h2):(1'h1)]);
              reg13 <= (+$unsigned($unsigned((+wire3))));
              reg14 <= ({wire4[(3'h4):(1'h0)]} >>> (!((&(-wire3)) >> $signed($signed(reg12)))));
            end
          if (($signed($signed(($signed(reg10) | (wire3 == wire5)))) ?
              (~((!wire3) | $signed(wire4))) : $unsigned($unsigned(reg13[(4'hb):(4'hb)]))))
            begin
              reg15 <= $unsigned((($unsigned((8'ha9)) ?
                  wire3[(2'h3):(1'h1)] : wire1) <<< reg11));
            end
          else
            begin
              reg15 <= $unsigned((($signed($signed((8'hbb))) >= $unsigned(reg12)) ?
                  (-(8'ha6)) : wire0));
            end
          reg16 <= ((~|($unsigned($unsigned(reg15)) ?
              $unsigned({wire5,
                  wire5}) : (^~(^~reg11)))) ^ $unsigned($signed(wire2)));
          reg17 <= $unsigned($unsigned($unsigned((wire1 ?
              {reg7, reg8} : wire0[(3'h5):(2'h3)]))));
        end
      reg18 <= wire4[(2'h2):(1'h1)];
      reg19 <= $unsigned({(~|(~^$signed((8'hb5))))});
      reg20 <= ($unsigned(reg12) << (($signed((wire5 ^~ reg9)) ?
              ($signed(reg8) * (8'hbd)) : $signed((-reg8))) ?
          $unsigned({{wire6}, reg8}) : ((8'hb6) ?
              (reg19[(1'h0):(1'h0)] ?
                  $unsigned(reg18) : (-(7'h42))) : $signed(reg13[(4'hc):(4'h9)]))));
    end
  assign wire21 = wire5[(3'h7):(2'h3)];
  assign wire22 = ({wire0, (&reg16)} <<< {$unsigned((reg16 ?
                          $signed((8'hb6)) : (|reg10))),
                      $signed(($unsigned((8'ha1)) ?
                          ((8'ha7) ^~ reg18) : (8'hb7)))});
  assign wire23 = ((reg16[(3'h4):(1'h0)] ?
                          $signed($signed((~&reg9))) : {((|reg15) >> reg20),
                              ((|wire3) && (wire3 * (8'hba)))}) ?
                      reg12 : (8'haf));
  always
    @(posedge clk) begin
      if ((wire1 ?
          $signed(((^~wire21) ^~ $signed($unsigned(wire6)))) : (({$unsigned(wire4),
                  {(8'hba), reg13}} | (-$signed(reg17))) ?
              (wire5[(1'h0):(1'h0)] && (~(|(8'ha6)))) : $signed({(&wire1),
                  $unsigned(wire1)}))))
        begin
          reg24 <= {reg7};
        end
      else
        begin
          if ($unsigned((^wire4[(1'h1):(1'h0)])))
            begin
              reg24 <= {((({reg24} ?
                              $unsigned((8'hb5)) : (wire3 ? wire1 : reg20)) ?
                          (^(~^wire0)) : {(wire1 ? reg18 : reg9)}) ?
                      reg12 : $unsigned(reg15))};
            end
          else
            begin
              reg24 <= $unsigned((wire0[(2'h3):(2'h2)] | $signed(reg18)));
            end
        end
      if ($signed((-$unsigned(reg17))))
        begin
          reg25 <= (+$unsigned($unsigned((+{reg24, reg8}))));
          reg26 <= ((-$signed((wire22 ? (reg11 ? reg25 : reg12) : reg10))) ?
              (8'hb4) : (($signed($signed(reg11)) ?
                  {(reg25 ? (8'hab) : reg15)} : {reg17, (~|reg10)}) < (8'h9f)));
          reg27 <= (~^{(reg10[(1'h0):(1'h0)] <<< ((wire3 <= reg7) + $unsigned(wire1)))});
          reg28 <= reg20[(2'h3):(1'h0)];
        end
      else
        begin
          reg25 <= $unsigned($signed(reg8));
          reg26 <= $signed((reg25 ?
              reg14[(1'h0):(1'h0)] : $signed($unsigned((~|reg10)))));
        end
    end
  assign wire29 = wire4;
  always
    @(posedge clk) begin
      if ($unsigned((reg7[(3'h5):(2'h2)] == (+reg8[(1'h1):(1'h0)]))))
        begin
          reg30 <= reg27;
          reg31 <= (reg24 ?
              $signed({{(8'hb7),
                      (~|reg18)}}) : (~|($signed(reg28) * ((~&reg8) < (reg8 ?
                  reg12 : wire4)))));
          reg32 <= {$signed($signed(((reg10 ?
                  reg25 : reg10) <= $signed(wire23)))),
              (wire2[(2'h2):(1'h1)] >= reg12)};
          if ($signed((&reg9)))
            begin
              reg33 <= (reg24[(4'ha):(3'h7)] ?
                  (|(7'h43)) : (reg20 >>> wire2[(2'h2):(2'h2)]));
              reg34 <= (((&wire21[(3'h5):(1'h0)]) ?
                  {reg13[(3'h5):(1'h0)],
                      (reg32[(1'h1):(1'h0)] ?
                          (reg30 ?
                              reg16 : reg27) : reg20[(4'h9):(1'h1)])} : ((reg14[(1'h1):(1'h0)] ?
                      ((8'hb4) ?
                          reg30 : reg32) : reg31[(2'h2):(1'h0)]) != ($signed(reg13) ^~ $signed((8'ha4))))) >>> (~|wire2));
              reg35 <= $signed($unsigned($unsigned(($signed(reg18) ?
                  (~^wire2) : (reg8 ? reg30 : reg7)))));
            end
          else
            begin
              reg33 <= ((~|{{(-reg20),
                      $unsigned(reg10)}}) >>> $unsigned(wire23[(2'h3):(1'h1)]));
              reg34 <= (~^(reg15 ^~ wire0[(3'h6):(2'h3)]));
            end
        end
      else
        begin
          reg30 <= (^reg9);
          reg31 <= $signed(($unsigned(((reg24 ? reg35 : reg9) ?
                  (wire5 | (7'h40)) : (wire1 ^~ reg7))) ?
              (8'h9c) : (|((reg19 ? reg11 : reg32) > $unsigned((8'haf))))));
          reg32 <= {(wire21 ?
                  $signed({reg27, $signed(wire23)}) : {$unsigned({wire4,
                          reg26}),
                      (~|wire29)})};
        end
      reg36 <= (^~reg10[(1'h1):(1'h1)]);
      reg37 <= reg24[(2'h3):(1'h1)];
      if ((^reg34))
        begin
          reg38 <= wire21[(3'h4):(3'h4)];
          if ($signed(((((reg30 >>> wire23) ?
                  reg25 : reg36[(4'hc):(4'hc)]) <= reg20[(4'hb):(4'h9)]) ?
              $signed((^~$signed(reg20))) : reg27[(3'h6):(2'h3)])))
            begin
              reg39 <= reg12;
              reg40 <= (reg12 & (reg35 ? reg39 : $unsigned(reg25)));
              reg41 <= (|(reg18 ?
                  $signed((reg33 && reg15)) : $signed(reg12[(2'h2):(1'h0)])));
              reg42 <= $unsigned(reg9);
              reg43 <= (^reg34[(2'h2):(1'h0)]);
            end
          else
            begin
              reg39 <= ((|reg41[(1'h0):(1'h0)]) ?
                  reg39 : ({(^~$signed((8'hb8))), wire0} ?
                      {wire5} : $signed(({reg28, reg39} <<< (~^(8'hbe))))));
            end
        end
      else
        begin
          reg38 <= $unsigned(((^wire3[(3'h4):(2'h3)]) ?
              ({(reg34 != wire29)} || $signed((8'hb0))) : $signed(($unsigned((8'hbf)) ?
                  $unsigned(reg27) : {wire21, reg41}))));
        end
      reg44 <= $unsigned(reg33);
    end
  always
    @(posedge clk) begin
      reg45 <= reg10[(2'h3):(2'h3)];
      reg46 <= (+{$signed(reg20[(3'h4):(3'h4)])});
      reg47 <= ((+$signed((reg14[(1'h0):(1'h0)] ?
          (~|reg12) : $unsigned(reg30)))) <<< $signed(reg13));
      reg48 <= $signed(($signed($signed($signed(reg46))) <<< $signed($unsigned((^~reg12)))));
      if (reg39[(3'h5):(1'h0)])
        begin
          reg49 <= (~|$unsigned((~|reg24)));
          reg50 <= ((reg44[(3'h4):(3'h4)] + wire21[(1'h1):(1'h1)]) ^ ($unsigned(reg31) != (|wire3)));
          reg51 <= wire3[(3'h4):(1'h0)];
          reg52 <= $unsigned($signed(reg15[(1'h1):(1'h0)]));
          reg53 <= ((~|reg14[(1'h1):(1'h0)]) - reg31);
        end
      else
        begin
          reg49 <= ({(reg46[(4'hc):(4'hb)] ?
                  reg42[(4'hd):(1'h0)] : (reg10[(4'h9):(1'h1)] ?
                      $unsigned(reg41) : {reg7})),
              wire3} >= {wire3[(3'h4):(1'h1)]});
          reg50 <= ($unsigned(((-(~^wire29)) >= reg39[(3'h6):(3'h4)])) ?
              {reg36,
                  (reg10 ?
                      (&reg36[(4'hb):(1'h0)]) : reg53)} : reg33[(3'h4):(1'h0)]);
          reg51 <= $unsigned(((&($signed(reg39) ?
                  reg15[(1'h0):(1'h0)] : ((8'hb2) ? reg9 : (8'haa)))) ?
              {$signed((reg28 - reg18)),
                  ($signed(reg50) ?
                      $signed((8'hac)) : reg13[(4'hd):(4'hc)])} : reg8));
        end
    end
  assign wire54 = reg30[(1'h1):(1'h0)];
  assign wire55 = $unsigned(($signed(reg46[(3'h4):(3'h4)]) ?
                      {$signed((reg47 + reg15))} : ($signed(((8'hb1) ?
                              reg53 : reg26)) ?
                          wire21[(1'h0):(1'h0)] : reg37)));
  module56 #() modinst84 (.wire60(reg52), .wire57(reg32), .y(wire83), .clk(clk), .wire59(wire29), .wire58(reg16));
  always
    @(posedge clk) begin
      reg85 <= (-$unsigned(reg32));
      reg86 <= $unsigned((reg19 ?
          ((reg49 == $signed(reg43)) || $unsigned($signed((7'h43)))) : reg16));
    end
  assign wire87 = $unsigned((reg24 | reg53[(3'h6):(3'h4)]));
  assign wire88 = (!{$signed(wire29[(1'h0):(1'h0)])});
  assign wire89 = ($signed(reg41[(3'h5):(3'h5)]) << $unsigned(reg17));
  assign wire90 = ((|wire6) ?
                      $unsigned($signed({reg16[(3'h5):(1'h0)]})) : $signed(reg53));
  assign wire91 = reg10;
  assign wire92 = $signed({(~^($signed((8'haa)) ?
                          (reg39 ? reg15 : wire88) : reg35[(2'h2):(1'h0)]))});
  assign wire93 = $signed((|(wire91 ?
                      ($signed(reg17) ?
                          $unsigned(reg44) : $signed(reg16)) : (wire23[(3'h6):(2'h3)] ^ (~|reg43)))));
  always
    @(posedge clk) begin
      reg94 <= reg30;
      reg95 <= {(^reg39)};
    end
endmodule

module module56  (y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire60;
  input wire signed [(4'he):(1'h0)] wire59;
  input wire [(2'h3):(1'h0)] wire58;
  input wire [(5'h11):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire61;
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire76,
                 wire75,
                 wire74,
                 wire63,
                 wire62,
                 wire61,
                 reg79,
                 reg78,
                 reg77,
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
                 (1'h0)};
  assign wire61 = $signed(($signed(wire60) ?
                      $signed((wire59[(3'h4):(1'h1)] == $unsigned(wire58))) : (-(((8'ha6) ?
                          wire60 : wire59) != wire60[(3'h4):(1'h1)]))));
  assign wire62 = (($signed(wire61[(4'h8):(3'h7)]) ?
                          $unsigned($unsigned(wire60)) : {wire58[(2'h2):(1'h0)]}) ?
                      (wire60[(1'h0):(1'h0)] == $signed((~&(wire60 ?
                          (8'hb3) : wire60)))) : (wire59 ?
                          $signed(wire61[(3'h6):(3'h5)]) : $unsigned($unsigned($signed(wire59)))));
  assign wire63 = (wire57[(4'h9):(3'h6)] ? wire57 : $signed(wire61));
  always
    @(posedge clk) begin
      if ({$signed((~|{{wire60}}))})
        begin
          reg64 <= (~|wire63);
          reg65 <= (-wire60);
          reg66 <= (wire62[(1'h0):(1'h0)] || $unsigned((((wire60 ^~ wire59) <<< (wire59 ^ reg65)) ^ wire62)));
        end
      else
        begin
          reg64 <= wire60;
          reg65 <= $signed((((wire59[(1'h1):(1'h0)] ?
              (8'ha9) : reg64) == {$unsigned(wire61)}) >> $signed($unsigned((wire63 == wire63)))));
          if ($signed(({$signed((reg65 ? wire59 : (8'ha8))),
              wire59} >> {{(^wire63), (|reg64)}})))
            begin
              reg66 <= ($unsigned($signed($signed(reg66[(4'hc):(3'h5)]))) >= $unsigned($unsigned((wire58[(2'h3):(1'h0)] ^~ (reg65 ?
                  reg66 : wire57)))));
              reg67 <= wire63[(4'hc):(4'hc)];
              reg68 <= {{{(-$signed((8'ha0)))}, wire60[(3'h5):(3'h4)]},
                  ($unsigned($unsigned($unsigned(wire61))) ?
                      {$signed(wire63[(4'h8):(3'h7)])} : (((^~wire61) && $signed(wire63)) < (wire61 ?
                          (8'ha5) : reg66)))};
              reg69 <= (wire58[(1'h1):(1'h1)] ? wire61 : reg68);
              reg70 <= $signed((+$unsigned($signed(reg68))));
            end
          else
            begin
              reg66 <= wire59;
            end
        end
      reg71 <= $signed((-((-$signed(wire58)) ?
          $unsigned(reg65[(4'hd):(2'h2)]) : reg64[(3'h6):(1'h1)])));
      reg72 <= ((wire60[(3'h5):(1'h1)] >> (~^(reg65 ?
              $unsigned(reg71) : (wire63 ^~ wire57)))) ?
          $unsigned(reg71) : (~|$unsigned(wire60[(1'h0):(1'h0)])));
      reg73 <= (reg66 ? reg64[(4'hc):(1'h1)] : (~|(+{{wire58, (8'hb1)}})));
    end
  assign wire74 = reg67[(2'h3):(1'h0)];
  assign wire75 = wire62;
  assign wire76 = {(reg65 ?
                          ({reg72[(4'h9):(4'h8)]} << reg69[(1'h0):(1'h0)]) : wire60)};
  always
    @(posedge clk) begin
      reg77 <= ($unsigned($unsigned(wire62)) - $unsigned($unsigned(reg65)));
      reg78 <= (~|$signed(reg66));
      reg79 <= wire75;
    end
  assign wire80 = wire59[(1'h0):(1'h0)];
  assign wire81 = $signed((wire76 ?
                      $signed($signed({wire74,
                          reg67})) : reg73[(5'h13):(4'h9)]));
  assign wire82 = ((wire81 >= (~^$signed((wire57 ?
                      wire76 : reg66)))) - (($unsigned((reg79 ?
                          wire75 : reg65)) ?
                      (wire74[(4'he):(3'h4)] ?
                          (|(8'haf)) : (^~reg70)) : $signed(((8'ha0) * wire74))) | ($unsigned(wire59[(3'h4):(2'h3)]) ?
                      $unsigned((~|reg65)) : reg77[(2'h3):(2'h3)])));
endmodule
