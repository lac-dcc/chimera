module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire157;
  wire signed [(3'h7):(1'h0)] wire156;
  wire signed [(4'hd):(1'h0)] wire155;
  wire signed [(4'ha):(1'h0)] wire148;
  wire signed [(5'h15):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire150;
  wire signed [(5'h10):(1'h0)] wire151;
  wire signed [(5'h11):(1'h0)] wire152;
  wire signed [(4'hc):(1'h0)] wire153;
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire148,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire150,
                 wire151,
                 wire152,
                 wire153,
                 (1'h0)};
  module5 #() modinst76 (wire75, clk, wire2, wire1, wire3, wire0, wire4);
  assign wire77 = {wire75[(5'h14):(4'hc)]};
  assign wire78 = (-wire0);
  assign wire79 = ($unsigned(wire78) ?
                      (~|(((~wire2) < (wire75 ? wire1 : wire75)) ?
                          (~$unsigned(wire4)) : wire4[(3'h5):(2'h2)])) : (!(+(wire2 ?
                          (wire4 ? wire77 : wire0) : (wire0 | wire77)))));
  assign wire80 = wire79;
  assign wire81 = $unsigned({(wire79[(3'h4):(1'h0)] * {wire77, wire77})});
  module82 #() modinst149 (wire148, clk, wire77, wire0, wire3, wire4, wire81);
  assign wire150 = {(8'had),
                       ((wire77[(3'h6):(2'h3)] && wire81[(4'h9):(1'h1)]) ?
                           $unsigned((|(wire75 ^ (8'ha6)))) : $signed(wire0))};
  assign wire151 = $signed((({wire3} ?
                           (wire4[(3'h6):(3'h4)] << {wire2,
                               wire0}) : $unsigned((wire1 ? wire3 : wire2))) ?
                       (wire79 ?
                           ((-wire75) + (wire75 ? wire79 : wire78)) : ((wire1 ?
                                   wire1 : wire2) ?
                               $signed(wire4) : (wire3 - wire1))) : ((+wire148[(4'ha):(2'h2)]) << (&wire148))));
  assign wire152 = wire150;
  module5 #() modinst154 (.clk(clk), .wire7(wire4), .wire9(wire1), .y(wire153), .wire8(wire81), .wire6(wire79), .wire10(wire0));
  assign wire155 = wire0;
  assign wire156 = $unsigned($signed((^$unsigned(wire150[(4'h8):(3'h4)]))));
  assign wire157 = (8'hab);
endmodule

module module82
#(parameter param146 = (((((8'haa) ? ((8'hb9) & (8'ha4)) : ((8'hae) ? (8'hbc) : (8'hbe))) ? {{(8'ha0), (8'haf)}, (8'haa)} : (((8'ha9) ? (8'h9c) : (8'haa)) & ((8'hbc) + (8'hb0)))) << {({(8'hb2)} ? ((7'h40) == (8'hbb)) : (7'h44)), (!(&(8'ha7)))}) ^ ((((~|(8'hbe)) >>> ((8'h9e) ? (8'hb0) : (8'hbd))) ? (^{(8'hba)}) : (-(^~(8'had)))) ? (!{{(8'hac)}}) : (+{{(8'ha2)}}))), 
parameter param147 = ((param146 >>> (&((^~param146) ? (~|param146) : (param146 >= param146)))) ? param146 : param146))
(y, clk, wire83, wire84, wire85, wire86, wire87);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire83;
  input wire [(5'h10):(1'h0)] wire84;
  input wire [(4'hf):(1'h0)] wire85;
  input wire signed [(5'h14):(1'h0)] wire86;
  input wire [(5'h15):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire145;
  wire [(5'h14):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire129;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire127;
  reg [(5'h13):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg137 = (1'h0);
  reg [(4'h9):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire129,
                 wire88,
                 wire89,
                 wire90,
                 wire127,
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
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire88 = {wire83};
  assign wire89 = wire88;
  assign wire90 = ((|$signed($unsigned($unsigned(wire83)))) ?
                      wire89 : $signed((!$unsigned({wire86, wire88}))));
  module91 #() modinst128 (.wire93(wire83), .wire92(wire87), .wire95(wire89), .wire94(wire84), .wire96(wire86), .clk(clk), .y(wire127));
  assign wire129 = ((~|$signed((~&wire87[(1'h0):(1'h0)]))) < ($signed((~wire87[(5'h15):(5'h14)])) - $unsigned({(!wire127),
                       $unsigned(wire89)})));
  always
    @(posedge clk) begin
      reg130 <= {wire85[(3'h6):(1'h0)]};
      if ($signed(wire87[(2'h3):(1'h0)]))
        begin
          if ($unsigned(wire127[(1'h1):(1'h0)]))
            begin
              reg131 <= $signed(($signed(wire83[(3'h5):(2'h3)]) - (((reg130 ?
                  (7'h43) : wire127) ^~ wire84[(3'h5):(2'h2)]) ~^ $signed({wire84,
                  wire86}))));
              reg132 <= {(8'ha9)};
              reg133 <= (reg132 != (~&$signed(($signed((8'ha5)) << (wire127 ?
                  reg130 : (8'ha6))))));
              reg134 <= (wire86 * wire85);
              reg135 <= $signed($unsigned(($unsigned((8'h9d)) ~^ reg131)));
            end
          else
            begin
              reg131 <= ({(~|wire90[(2'h2):(1'h1)])} != ((8'ha4) ?
                  $unsigned(reg134[(4'h8):(2'h2)]) : wire86[(4'hd):(4'ha)]));
            end
          reg136 <= $unsigned($unsigned($signed(((7'h41) ?
              $unsigned(wire89) : wire85))));
          reg137 <= $signed(wire85[(4'hd):(3'h7)]);
          if (reg133)
            begin
              reg138 <= (|$signed((8'hb0)));
              reg139 <= ((reg138 != wire84[(4'hd):(3'h4)]) >= wire85);
              reg140 <= $unsigned(((~^(-(wire83 ^~ wire90))) ?
                  reg136 : {($unsigned(reg135) ?
                          {(8'ha4), wire87} : ((8'hb2) ? reg139 : reg135))}));
              reg141 <= ($unsigned($signed(({reg133, wire129} >= (wire89 ?
                      (8'hac) : wire87)))) ?
                  wire90 : wire127);
            end
          else
            begin
              reg138 <= wire88[(1'h0):(1'h0)];
              reg139 <= wire83[(4'h9):(1'h0)];
            end
          reg142 <= $signed(((wire83[(5'h10):(4'hb)] ?
                  wire89 : (reg139[(2'h3):(2'h3)] && ((8'haf) + wire127))) ?
              reg131 : $unsigned(reg132)));
        end
      else
        begin
          reg131 <= ($unsigned((reg136 ?
                  {reg138[(3'h7):(3'h4)], reg130[(3'h5):(2'h2)]} : wire84)) ?
              $unsigned({(+(|wire90)),
                  (reg138 ?
                      (reg141 ?
                          reg133 : wire87) : (wire85 - reg133))}) : (^{$signed({wire127})}));
          reg132 <= reg131;
          reg133 <= $signed($unsigned(reg130));
          if (($unsigned(wire89) ?
              (wire90[(3'h5):(1'h1)] ?
                  ($unsigned(reg133) ?
                      (reg130[(1'h1):(1'h0)] ?
                          reg139 : reg140) : ($unsigned(reg134) * reg133[(3'h4):(3'h4)])) : $unsigned({(&reg133)})) : $unsigned($signed((&(+wire127))))))
            begin
              reg134 <= wire87[(3'h4):(2'h2)];
              reg135 <= $unsigned($signed(($unsigned(reg135) ?
                  reg135 : ({wire88, (8'haa)} >= (wire87 + reg132)))));
              reg136 <= {$signed((&wire84[(4'he):(4'ha)])),
                  (reg142[(3'h5):(1'h0)] ?
                      (({(8'ha5), reg135} ?
                              (reg138 ? reg136 : reg140) : (-reg134)) ?
                          $unsigned((8'ha2)) : ((reg135 ? (8'hbc) : reg138) ?
                              reg135[(1'h1):(1'h0)] : (wire88 | reg133))) : (|(^$unsigned(reg133))))};
              reg137 <= wire129[(1'h1):(1'h0)];
              reg138 <= (+reg136);
            end
          else
            begin
              reg134 <= wire127;
              reg135 <= reg130[(1'h0):(1'h0)];
            end
          reg139 <= (wire129 - $unsigned((({reg131, reg142} - $signed(reg137)) ?
              ($signed(wire83) ^ $signed((7'h44))) : (~^$signed(wire84)))));
        end
      reg143 <= (wire83 > (~^$signed(($signed(wire129) >>> (reg130 ?
          wire84 : wire88)))));
    end
  assign wire144 = reg142;
  assign wire145 = (((~(wire129[(5'h10):(3'h5)] ?
                           $signed(reg139) : $unsigned(wire129))) ?
                       ($unsigned((~&reg138)) ?
                           ((reg130 < reg142) >>> (+(8'hac))) : wire90) : $unsigned({reg143})) <<< wire144[(2'h3):(2'h2)]);
endmodule

module module5
#(parameter param73 = (((((&(8'ha5)) ? (!(8'ha4)) : ((8'ha5) ^ (7'h42))) ? ((+(8'hb1)) ? {(8'hbe), (8'hac)} : (7'h44)) : (&((7'h44) && (8'ha1)))) ? {(-((8'hbd) == (8'hba)))} : (8'hbc)) ? ((({(8'haa)} == (+(8'h9c))) || (((8'hb0) | (7'h42)) < ((7'h40) ? (8'ha6) : (8'ha0)))) == ((^(-(8'ha8))) ? (((7'h42) ? (8'hae) : (8'hbe)) == ((7'h41) <<< (8'hbd))) : ({(8'hb4), (8'ha7)} | ((8'hb3) ? (8'ha7) : (8'ha1))))) : (!(~|(^~(!(8'ha2)))))), 
parameter param74 = (^param73))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire6;
  input wire [(4'hf):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire69;
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire31,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire38,
                 wire69,
                 reg37,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 (1'h0)};
  module11 #() modinst32 (wire31, clk, wire8, wire10, wire7, wire9);
  assign wire33 = $signed(($unsigned($signed(wire8[(3'h7):(1'h1)])) ?
                      ($unsigned((+wire8)) > wire10) : $signed(wire6)));
  assign wire34 = wire31;
  assign wire35 = $unsigned($signed({$unsigned(wire9)}));
  assign wire36 = $unsigned((wire10[(1'h1):(1'h1)] <= (~|(8'hb8))));
  always
    @(posedge clk) begin
      reg37 <= ((~|wire10[(4'hb):(1'h1)]) ?
          $signed((^~(&$signed(wire36)))) : (^~$unsigned($signed((~&wire7)))));
    end
  assign wire38 = reg37[(4'hf):(3'h7)];
  always
    @(posedge clk) begin
      reg39 <= $unsigned((wire6[(4'ha):(4'h8)] ?
          (~wire38) : $signed($unsigned((reg37 ? (8'ha2) : (8'hbc))))));
      reg40 <= (((((|wire34) ^~ (wire10 && (8'hb3))) <<< $signed((~wire31))) ?
              $unsigned(({wire36, wire9} ?
                  (wire38 <<< wire9) : (-wire35))) : ({(!reg39),
                  (wire7 > wire7)} <= (wire6 && wire6[(3'h7):(3'h6)]))) ?
          $signed((({wire7} ?
              wire36[(1'h1):(1'h1)] : (~^wire7)) >> reg39)) : ((^wire10) ?
              (|{$signed(wire36)}) : ((^$signed(wire35)) ^~ reg39)));
      reg41 <= (wire33[(4'h9):(3'h6)] >= reg40[(4'hd):(1'h0)]);
      reg42 <= reg37;
      if (wire9)
        begin
          if (wire38)
            begin
              reg43 <= (reg40[(4'h8):(2'h2)] && $signed(reg37[(4'hb):(1'h0)]));
              reg44 <= (~&$unsigned($unsigned(reg42)));
              reg45 <= ((-(({reg39} << (wire36 ? wire10 : (8'hbd))) ?
                      ((reg43 ? wire9 : reg40) | (wire10 ?
                          reg44 : wire7)) : ($signed(reg39) ^ (wire10 ?
                          wire10 : reg39)))) ?
                  reg40[(2'h2):(1'h0)] : (~&(($unsigned((8'hb8)) ?
                          reg44[(1'h1):(1'h1)] : (wire34 ? wire31 : wire36)) ?
                      reg37[(3'h6):(1'h1)] : reg41[(5'h12):(4'hf)])));
            end
          else
            begin
              reg43 <= wire8[(3'h4):(1'h1)];
              reg44 <= ($unsigned(wire6[(4'hb):(3'h5)]) ?
                  reg42 : (^~((((8'hba) ? wire6 : reg44) ?
                          {(8'hba), wire6} : $unsigned(wire38)) ?
                      (wire34[(5'h10):(1'h1)] >>> reg44) : (~|(&wire7)))));
              reg45 <= (+(wire8 ?
                  (8'hb5) : (($unsigned(reg43) < (7'h42)) ?
                      ((wire10 ? reg44 : reg43) ?
                          wire7[(4'hc):(4'h9)] : (!wire8)) : (wire38 ^ ((8'hac) ?
                          wire8 : reg40)))));
            end
        end
      else
        begin
          reg43 <= wire33;
        end
    end
  module46 #() modinst70 (wire69, clk, reg37, reg44, wire34, reg43);
  assign wire71 = reg43[(3'h4):(2'h2)];
  assign wire72 = wire31[(2'h3):(1'h1)];
endmodule

module module46
#(parameter param68 = ({(-(~|{(8'hbc), (8'ha6)})), (8'hbd)} <<< ((^~(~&((8'ha1) | (8'ha1)))) ? (8'ha5) : ({((8'hbe) + (8'hb7))} ? (((7'h41) ^~ (8'hb3)) ? ((8'hae) ? (7'h44) : (8'had)) : ((8'ha9) ? (8'hb1) : (8'hab))) : (((8'ha6) > (8'ha8)) ? ((8'hb1) ? (8'hab) : (8'hac)) : ((8'h9d) >>> (8'hb9)))))))
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire50;
  input wire signed [(5'h13):(1'h0)] wire49;
  input wire signed [(3'h5):(1'h0)] wire48;
  input wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg51 <= (8'h9f);
      if (reg51[(4'hb):(3'h6)])
        begin
          reg52 <= $signed({wire49});
          reg53 <= wire48[(3'h5):(2'h2)];
          reg54 <= wire49;
        end
      else
        begin
          reg52 <= $unsigned((reg54 <= reg51[(4'ha):(3'h7)]));
        end
      if (reg52)
        begin
          reg55 <= $signed(wire50[(4'hd):(3'h7)]);
          reg56 <= $unsigned(wire50);
          reg57 <= reg53;
          reg58 <= reg53;
          reg59 <= wire47;
        end
      else
        begin
          reg55 <= (((8'ha6) ?
                  {reg51, $signed(wire48[(2'h3):(2'h3)])} : reg55) ?
              $signed((({reg58, (8'hb9)} == reg56[(4'hd):(4'h8)]) ?
                  $signed(wire49) : ((wire49 ? wire50 : wire47) ?
                      (~&reg56) : reg54))) : reg54[(4'hc):(1'h1)]);
          reg56 <= (($unsigned(($unsigned(reg55) ^~ $signed(reg54))) ?
                  ($signed(reg59) & $unsigned((8'hb8))) : (^~reg51[(3'h6):(1'h0)])) ?
              {((~|(~|wire47)) <= $signed((+reg57))),
                  (reg59[(1'h0):(1'h0)] ? (8'hb2) : wire47)} : (8'hb3));
          if ({$signed($unsigned((^(reg59 ? reg56 : reg56))))})
            begin
              reg57 <= reg54;
              reg58 <= ((((&wire49) ?
                          ((wire48 + reg53) ?
                              $unsigned(reg51) : (^wire47)) : $signed((~reg52))) ?
                      $signed(reg51[(4'hd):(2'h2)]) : $unsigned((~|wire47[(1'h0):(1'h0)]))) ?
                  {$signed(({reg51, reg53} ?
                          (wire49 <<< reg51) : (reg59 ?
                              (8'hb8) : reg51)))} : ($signed((7'h43)) ^~ reg51[(4'ha):(4'ha)]));
              reg59 <= $signed(reg55[(4'ha):(2'h2)]);
              reg60 <= reg51;
            end
          else
            begin
              reg57 <= $unsigned(wire50);
              reg58 <= $unsigned(((~|(reg60[(5'h12):(4'h9)] ?
                  (-wire50) : (^~reg58))) <= ((!reg54[(4'hb):(2'h3)]) & wire50[(4'hf):(4'ha)])));
              reg59 <= reg52;
            end
          reg61 <= $unsigned(((&$unsigned((~(8'h9f)))) ?
              (8'hac) : reg52[(1'h0):(1'h0)]));
        end
    end
  assign wire62 = reg58;
  assign wire63 = $signed($unsigned((+wire48)));
  assign wire64 = (wire47[(2'h2):(2'h2)] ?
                      $unsigned((~&($signed(reg61) ?
                          (reg54 ?
                              reg56 : wire50) : $signed(reg59)))) : $signed((~&(~|$signed(reg61)))));
  assign wire65 = {(reg60[(3'h4):(1'h0)] | {(&$unsigned(reg61)),
                          reg55[(4'h9):(4'h9)]})};
  assign wire66 = ({(~$unsigned($signed((8'hbd)))),
                          (~&((reg55 >>> (8'hb3)) ^ $signed(reg52)))} ?
                      $signed({$signed($unsigned(reg59))}) : reg54);
  assign wire67 = reg57;
endmodule

module module11
#(parameter param30 = (~^((8'ha5) ? (~^((^~(8'h9e)) ? (-(8'h9e)) : (~^(8'ha2)))) : ((~(&(8'h9f))) ? ((-(8'h9c)) + (8'hb6)) : ((^~(8'hac)) < (~^(8'ha5)))))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  input wire signed [(3'h5):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire17,
                 wire16,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire16 = {{(!(!$unsigned(wire14))), {$signed(wire12[(3'h4):(1'h1)])}},
                      ($signed(((~^wire15) * (wire13 ? wire12 : wire14))) ?
                          (-$unsigned((wire12 ?
                              wire12 : wire14))) : $unsigned({(~wire12)}))};
  assign wire17 = {$unsigned((wire12 <= wire12[(3'h7):(2'h2)])),
                      (wire14 ? wire13 : (|$unsigned(wire13)))};
  always
    @(posedge clk) begin
      if (((8'ha1) ?
          (wire17[(2'h3):(1'h0)] ?
              ({$signed((8'hae)),
                  $signed((7'h42))} << $unsigned((~|(8'hb7)))) : $unsigned({$unsigned(wire15)})) : wire16))
        begin
          reg18 <= $unsigned((wire14 >>> $unsigned($signed((wire14 >> wire15)))));
          reg19 <= ($signed((wire13[(3'h4):(2'h2)] ?
              (^{(7'h43)}) : wire14[(1'h0):(1'h0)])) - reg18);
          if (wire13[(2'h3):(2'h2)])
            begin
              reg20 <= (wire13 ?
                  $signed($unsigned(($unsigned(wire16) ?
                      $unsigned(wire13) : wire17))) : ($unsigned((&wire16)) ?
                      ($signed((wire16 == wire13)) ?
                          $unsigned($signed(reg19)) : {wire12}) : ({(+(8'ha8))} == $unsigned((reg18 >= wire12)))));
              reg21 <= $unsigned($signed((wire16 <= {wire12[(4'h9):(4'h9)]})));
              reg22 <= $unsigned({wire17[(1'h1):(1'h0)]});
              reg23 <= $signed((~^$signed($signed((wire13 ?
                  reg22 : (8'hac))))));
            end
          else
            begin
              reg20 <= $signed(wire16[(3'h6):(1'h0)]);
              reg21 <= (reg21 ? (|reg21) : reg22);
              reg22 <= $signed(((8'h9f) << (reg18 >= (~^wire17))));
              reg23 <= reg21[(5'h14):(2'h2)];
              reg24 <= $unsigned(wire12);
            end
        end
      else
        begin
          reg18 <= (8'ha0);
          reg19 <= $signed(({$signed((8'hba))} ?
              ($signed((wire17 || wire14)) ?
                  {(reg23 == (8'ha3)),
                      ((8'had) ?
                          reg24 : reg19)} : {wire14[(2'h3):(1'h0)]}) : (~(~&(~^wire15)))));
          reg20 <= $signed(reg23[(3'h5):(3'h4)]);
          reg21 <= reg21;
        end
    end
  assign wire25 = (&{({(|reg24), reg21} ^~ ((!wire14) <<< $signed((7'h41)))),
                      $signed(wire14)});
  assign wire26 = (!(8'ha7));
  assign wire27 = (reg22 < (+reg22[(1'h1):(1'h1)]));
  assign wire28 = $unsigned(reg21[(5'h10):(2'h2)]);
  assign wire29 = (7'h44);
endmodule

module module91
#(parameter param126 = ((({((8'h9e) ? (8'ha3) : (7'h43)), {(8'ha4)}} < (^~(8'hba))) ~^ (+(!{(8'haa)}))) ? ((((~|(8'haf)) || {(8'hbd)}) ? {(~(8'hb5)), (^~(8'hb7))} : {((8'h9d) ? (8'had) : (8'hbe)), ((8'ha4) ? (8'hb1) : (8'hb1))}) != ((((8'hab) + (8'h9f)) >>> ((8'h9f) ? (8'h9c) : (8'hbe))) << (((8'hb9) || (8'had)) || (8'hb8)))) : (&(((+(8'haa)) ? {(8'hae)} : ((8'hbf) ~^ (8'ha8))) ? (+((8'hbd) ? (7'h44) : (8'hba))) : {((7'h40) << (8'ha1)), ((8'ha4) && (8'hae))}))))
(y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire96;
  input wire signed [(4'he):(1'h0)] wire95;
  input wire signed [(5'h10):(1'h0)] wire94;
  input wire signed [(4'hf):(1'h0)] wire93;
  input wire [(5'h15):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire122;
  wire [(4'hc):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire107;
  wire signed [(4'hf):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire101;
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
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
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg97 <= $signed((8'haa));
      reg98 <= wire93;
      reg99 <= (&$unsigned((^~$signed(wire94))));
      reg100 <= (~(wire96[(3'h7):(2'h2)] ?
          $unsigned(($signed((8'ha7)) ~^ (wire96 || wire92))) : (reg98 ?
              $unsigned((!wire92)) : (8'haa))));
    end
  assign wire101 = wire96;
  assign wire102 = ((wire95 ?
                           $signed((-$signed(wire94))) : wire101[(4'he):(3'h5)]) ?
                       wire95 : reg98);
  assign wire103 = (&{reg98, $signed((8'ha5))});
  assign wire104 = (+$unsigned(((!(wire102 <= (8'hb1))) == reg97)));
  assign wire105 = $signed($signed(wire93));
  assign wire106 = wire95;
  assign wire107 = $signed($signed(((reg99[(2'h2):(1'h0)] ?
                       reg100[(2'h2):(2'h2)] : wire106) * {$signed(wire101),
                       $unsigned(wire93)})));
  always
    @(posedge clk) begin
      if (($signed($unsigned(wire106)) == ({$signed($unsigned(wire106)),
              wire104[(5'h11):(5'h11)]} ?
          {reg97} : {($signed(wire94) ? (wire101 ? (8'hae) : wire94) : (7'h43)),
              (^~((8'h9f) ? (8'ha5) : reg99))})))
        begin
          if (wire92)
            begin
              reg108 <= ((7'h44) + ((^(8'hbd)) < (8'ha9)));
              reg109 <= (wire104 ?
                  {wire106[(3'h7):(2'h3)]} : wire92[(1'h0):(1'h0)]);
              reg110 <= $signed(reg97);
              reg111 <= $signed($unsigned($signed(((~reg110) > (wire92 ?
                  reg99 : wire95)))));
            end
          else
            begin
              reg108 <= reg108;
              reg109 <= (~^(8'haf));
              reg110 <= (wire107 ?
                  ($unsigned($signed(wire93)) >> $signed(reg108[(1'h1):(1'h0)])) : $signed(((~^$unsigned(wire94)) ~^ reg99)));
            end
          reg112 <= $signed((-$unsigned((^{wire92, wire106}))));
          if (({reg100} ?
              (($signed(wire94) ? wire104 : $unsigned(wire95)) ?
                  ((wire93[(4'hb):(4'hb)] << $signed(reg108)) ?
                      (^~(reg100 != reg99)) : (-(wire101 ?
                          (8'hb3) : wire106))) : $unsigned((^(~&reg112)))) : (wire103[(4'ha):(4'h8)] ?
                  wire94[(4'hc):(3'h6)] : $unsigned(((wire104 ?
                          wire104 : reg111) ?
                      $signed(wire104) : reg98)))))
            begin
              reg113 <= {$unsigned(((~(wire92 >>> wire92)) ?
                      wire96 : ($unsigned(wire106) ?
                          (wire106 ~^ wire93) : reg108))),
                  ($signed(($unsigned((7'h40)) ?
                      $unsigned((8'ha3)) : $signed(reg110))) << wire106)};
              reg114 <= ((~^$signed(({wire94} & $signed(wire106)))) ?
                  (wire103[(2'h3):(2'h2)] ?
                      {(reg98[(4'h9):(4'h8)] ^~ (~reg109)),
                          $signed((8'hba))} : {(wire103 ?
                              $unsigned(reg100) : (^wire105))}) : reg113[(4'he):(4'h9)]);
              reg115 <= (reg109 < {$signed((~&wire101))});
              reg116 <= $signed(((wire92 ?
                      reg100[(3'h6):(2'h2)] : $unsigned(reg112)) ?
                  wire102 : (8'had)));
              reg117 <= $signed(wire96);
            end
          else
            begin
              reg113 <= ((8'h9c) ?
                  reg117 : (((+(~&reg110)) >> ($signed(wire92) ?
                          (wire105 ?
                              wire94 : wire104) : wire95[(2'h2):(1'h0)])) ?
                      $signed(wire92[(3'h6):(1'h1)]) : (!(&wire105[(4'h8):(2'h2)]))));
              reg114 <= ((~(({wire101} ~^ $unsigned(reg113)) >> {wire92[(3'h6):(3'h5)],
                      wire106[(4'h9):(3'h4)]})) ?
                  $signed(reg117) : (&reg108));
            end
        end
      else
        begin
          if (wire96[(2'h3):(1'h1)])
            begin
              reg108 <= (~$unsigned(($signed((~|wire93)) ?
                  (reg109[(4'hf):(1'h0)] ?
                      (reg111 + reg117) : (wire101 ?
                          (8'ha5) : wire107)) : $signed($signed(reg116)))));
            end
          else
            begin
              reg108 <= (&(~^($signed((reg117 ? reg97 : reg113)) >= (wire96 ?
                  reg109[(4'h9):(1'h1)] : ((7'h41) ? wire103 : (8'h9e))))));
            end
          reg109 <= ($unsigned($signed((8'hb6))) ?
              wire106 : $signed((~^$unsigned(((8'hbe) ? wire95 : reg115)))));
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned(($signed((8'ha7)) ^~ (~&(reg97[(4'ha):(3'h5)] < (^~wire103))))))
        begin
          reg118 <= reg100[(1'h1):(1'h0)];
        end
      else
        begin
          reg118 <= $signed(wire104[(4'hc):(4'ha)]);
          reg119 <= $unsigned((|($unsigned((8'ha8)) ~^ $signed($signed((8'ha9))))));
        end
    end
  assign wire120 = {($unsigned(reg114) ?
                           reg114 : ($unsigned((~&reg114)) << wire101))};
  assign wire121 = ($signed($signed(reg98)) && ($unsigned(reg99[(4'h8):(3'h5)]) ?
                       $signed((wire105[(5'h11):(3'h6)] + $signed(reg98))) : ((+(!wire96)) | wire92)));
  assign wire122 = reg116;
  assign wire123 = (-(&$signed(wire103)));
  assign wire124 = (~|((~^$signed($signed(reg98))) && wire101[(1'h1):(1'h1)]));
  assign wire125 = $signed(($unsigned((((8'hb9) ?
                           (7'h43) : reg97) ^~ (!reg115))) ?
                       wire121 : wire123));
endmodule
