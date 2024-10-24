module top
#(parameter param206 = (((&((7'h42) >= (8'hbe))) & ((~{(8'haf), (8'ha6)}) ? (~&((8'hbb) ? (7'h41) : (8'hae))) : (((8'hab) ? (7'h42) : (8'had)) ? ((7'h40) ? (8'hab) : (8'hab)) : (~(8'hb2))))) == {(^(~((8'ha9) ? (7'h43) : (8'hac)))), ((((8'ha4) ? (8'hbc) : (8'ha0)) ? {(8'hbe)} : (8'hb2)) ? (((8'hb9) & (8'haa)) ? ((8'h9e) ? (8'ha8) : (8'ha7)) : ((8'hb6) <<< (8'hba))) : (^((8'hae) == (8'h9d))))}), 
parameter param207 = ({{param206}, {(param206 << (param206 ? param206 : param206)), (^~param206)}} ^~ param206))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire205;
  wire [(4'he):(1'h0)] wire204;
  wire signed [(2'h2):(1'h0)] wire203;
  wire [(4'hb):(1'h0)] wire201;
  wire [(5'h13):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire70;
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire201,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire18,
                 wire22,
                 wire70,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire4 = $unsigned($unsigned(wire2));
  assign wire5 = $unsigned(wire2[(3'h4):(2'h2)]);
  assign wire6 = (~^(wire4[(3'h5):(1'h1)] * (wire3[(3'h6):(1'h1)] ?
                     $unsigned(wire2[(2'h3):(2'h3)]) : wire2)));
  assign wire7 = ($signed((^(wire5[(4'h8):(2'h3)] && $unsigned(wire6)))) >>> (8'ha4));
  assign wire8 = wire0[(2'h3):(2'h2)];
  assign wire9 = $signed($signed(wire8[(3'h5):(3'h5)]));
  assign wire10 = $unsigned(wire4[(3'h7):(3'h5)]);
  assign wire11 = (wire1[(4'h9):(3'h4)] ?
                      $signed(((~(wire1 ^ wire0)) ?
                          (~^wire1) : $signed($unsigned(wire9)))) : wire2);
  assign wire12 = $unsigned((|wire3[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      reg13 <= (&{$signed($unsigned(wire9)), $signed(wire3[(3'h6):(3'h6)])});
      if (($signed(((7'h44) != wire8)) >= (~wire3[(2'h2):(1'h1)])))
        begin
          reg14 <= $signed($signed(($signed(wire0[(4'h9):(3'h7)]) * wire7[(1'h1):(1'h1)])));
          reg15 <= {wire3};
          reg16 <= wire5;
          reg17 <= ({(-$signed(wire8))} ?
              {(&($signed(wire2) ? $unsigned((8'h9e)) : (~&reg13))),
                  (wire5 >>> (~(wire10 == (8'hb3))))} : ((|(^~(8'h9d))) - $signed(reg14[(2'h3):(1'h1)])));
        end
      else
        begin
          reg14 <= wire1[(4'hc):(4'ha)];
          reg15 <= ((wire1 ?
              ((^(wire6 ? wire7 : wire11)) ?
                  ((wire12 >> wire1) < $signed(wire3)) : wire7[(2'h3):(2'h3)]) : $unsigned(wire6[(4'hf):(4'hc)])) < $unsigned(($signed(((8'had) ?
              wire12 : (8'ha6))) >>> $unsigned((wire5 ? wire8 : wire4)))));
        end
    end
  assign wire18 = (~|reg13);
  always
    @(posedge clk) begin
      reg19 <= (~&(~&((+reg16) ^ $unsigned($signed((8'hac))))));
      reg20 <= (($unsigned($signed((wire2 ? wire1 : wire10))) ?
          (^~wire5) : ($signed((reg16 ? wire9 : wire0)) ?
              wire10[(1'h0):(1'h0)] : wire0)) - {((~{wire6}) ^~ wire12[(4'h8):(3'h4)]),
          $unsigned($signed({wire6, wire4}))});
      reg21 <= (~wire5[(5'h11):(2'h2)]);
    end
  assign wire22 = ((~&($unsigned((wire4 > wire2)) ?
                          reg15[(1'h1):(1'h0)] : $unsigned(wire12))) ?
                      ($unsigned(wire1) ?
                          $unsigned(wire4[(3'h5):(1'h1)]) : ($signed((~|(8'hac))) + {{wire10}})) : (~$signed(reg15)));
  module23 #() modinst71 (wire70, clk, wire12, wire6, reg19, wire5);
  assign wire72 = (($signed(((wire6 - (8'hb1)) ?
                              (wire22 ?
                                  wire22 : reg15) : reg14[(4'he):(4'h9)])) ?
                          {wire70[(4'h8):(3'h5)],
                              $signed($signed(wire8))} : ({(^(8'had))} || ((+wire70) ?
                              (wire3 ?
                                  (8'ha3) : wire10) : wire12[(4'hd):(2'h2)]))) ?
                      (($unsigned((reg17 - reg14)) ?
                              $signed($signed(wire8)) : ((wire9 << wire11) >>> $unsigned(wire7))) ?
                          (~$unsigned((~&(8'hbe)))) : {(wire8 ?
                                  (~|wire2) : $signed(reg13))}) : (&(($signed((8'h9c)) ?
                          $signed(wire8) : $unsigned(wire4)) + (8'hb7))));
  assign wire73 = (((($unsigned(reg17) ?
                              (-wire7) : reg13[(1'h0):(1'h0)]) || ($signed(wire10) >>> $unsigned(reg15))) ?
                          (wire3 >> (!(reg16 ?
                              wire72 : wire10))) : (&reg16[(5'h10):(4'hd)])) ?
                      $signed(wire3[(1'h0):(1'h0)]) : (wire0[(3'h4):(2'h3)] > (^$signed($unsigned(wire2)))));
  assign wire74 = $signed(wire72);
  assign wire75 = $unsigned(wire9[(4'hc):(2'h3)]);
  module76 #() modinst202 (wire201, clk, reg17, reg16, wire73, wire1);
  assign wire203 = $unsigned(reg14);
  assign wire204 = {reg21, (~&$signed(wire18))};
  assign wire205 = {wire3[(3'h7):(3'h6)]};
endmodule

module module76  (y, clk, wire77, wire78, wire79, wire80);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire77;
  input wire [(3'h7):(1'h0)] wire78;
  input wire [(5'h12):(1'h0)] wire79;
  input wire signed [(4'hd):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire200;
  wire [(2'h2):(1'h0)] wire199;
  wire signed [(3'h4):(1'h0)] wire192;
  wire [(2'h3):(1'h0)] wire190;
  wire signed [(5'h15):(1'h0)] wire160;
  wire [(3'h6):(1'h0)] wire159;
  wire signed [(3'h6):(1'h0)] wire158;
  wire [(4'hf):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire156;
  reg [(5'h11):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg196 = (1'h0);
  reg [(5'h13):(1'h0)] reg195 = (1'h0);
  reg [(3'h7):(1'h0)] reg194 = (1'h0);
  reg [(3'h7):(1'h0)] reg193 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire192,
                 wire190,
                 wire160,
                 wire159,
                 wire158,
                 wire81,
                 wire82,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire92,
                 wire156,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 (1'h0)};
  assign wire81 = $signed((($signed((~|(8'h9f))) ?
                          {(wire80 >= wire80),
                              (wire77 - wire79)} : $signed((+wire79))) ?
                      ((-(wire80 - wire79)) | $unsigned($signed(wire79))) : ($unsigned(wire80) ?
                          ((8'haa) ? wire80 : (8'h9d)) : ($unsigned(wire77) ?
                              (8'hba) : {wire80}))));
  assign wire82 = wire79[(1'h1):(1'h0)];
  assign wire83 = wire82;
  assign wire84 = ($unsigned(wire78) ?
                      (~|wire83[(4'h8):(1'h0)]) : $signed(wire79));
  assign wire85 = wire78[(3'h5):(1'h1)];
  assign wire86 = {$unsigned(wire78)};
  assign wire87 = $unsigned($unsigned((($signed(wire86) < {wire84}) >>> wire83)));
  assign wire88 = $unsigned(wire78[(1'h1):(1'h0)]);
  assign wire89 = ((+wire81[(2'h2):(1'h0)]) ^~ $unsigned($signed(($unsigned(wire85) ?
                      (wire87 << wire82) : wire84[(1'h1):(1'h0)]))));
  assign wire90 = $unsigned({wire89[(3'h7):(3'h7)]});
  assign wire91 = (({$unsigned(wire78[(3'h5):(1'h1)]),
                          ((^wire86) * wire78[(1'h0):(1'h0)])} >>> wire89[(1'h1):(1'h1)]) ?
                      $unsigned({wire78}) : (|wire77));
  assign wire92 = ($unsigned((((wire85 ? wire79 : wire77) ?
                              {wire79, wire80} : $unsigned(wire79)) ?
                          $signed(wire81) : $signed(wire88[(1'h0):(1'h0)]))) ?
                      $signed($unsigned((((8'hb7) ? wire83 : wire85) ?
                          wire82[(1'h1):(1'h0)] : $signed((8'hbd))))) : (wire83 && (wire88 < (^$unsigned(wire87)))));
  module93 #() modinst157 (wire156, clk, wire77, wire82, wire88, wire84, wire80);
  assign wire158 = (~&($unsigned($unsigned($unsigned(wire84))) <= wire79));
  assign wire159 = (~&(^~$signed($signed(wire81))));
  assign wire160 = wire78[(3'h5):(2'h2)];
  module161 #() modinst191 (wire190, clk, wire158, wire80, wire160, wire79);
  assign wire192 = $unsigned((~&wire86));
  always
    @(posedge clk) begin
      if ($signed((wire90[(5'h11):(1'h1)] > $signed($signed((wire79 - wire83))))))
        begin
          reg193 <= ($unsigned(wire84[(1'h1):(1'h0)]) < (~^wire190[(2'h2):(1'h0)]));
          reg194 <= (wire77 ?
              {((wire90 ?
                      {wire79} : {wire90}) >= $signed(wire79[(4'hd):(3'h5)]))} : $signed((~&$unsigned(wire92[(1'h1):(1'h1)]))));
          reg195 <= {$signed((-($unsigned((8'ha9)) ?
                  $signed(wire190) : $signed(wire160)))),
              {reg194}};
        end
      else
        begin
          reg193 <= (8'hbb);
          reg194 <= ((wire81[(2'h2):(1'h1)] ?
                  $signed($unsigned((^~wire89))) : (-$signed($signed(wire77)))) ?
              wire160 : (^~(|$signed((wire84 & reg193)))));
        end
      reg196 <= $signed((8'hb7));
      reg197 <= $unsigned({wire91[(4'h8):(1'h0)],
          (((!wire89) ?
              {wire192, (8'hb6)} : $signed((8'ha8))) != (!$signed(wire82)))});
      reg198 <= ($unsigned((((wire87 <= reg195) ?
              (wire192 ? wire80 : reg194) : $unsigned(wire86)) ?
          $signed((~|(8'hbb))) : {wire84, wire89})) | ((((|reg195) ?
              $unsigned((8'hb7)) : wire160) ?
          wire88 : wire91) != (^wire91)));
    end
  assign wire199 = ($signed($unsigned(($unsigned((8'hab)) ?
                       wire85[(3'h6):(3'h5)] : reg193[(3'h7):(1'h1)]))) ~^ wire81);
  assign wire200 = wire192[(2'h3):(2'h3)];
endmodule

module module23
#(parameter param69 = ((^{(((8'hbd) <= (8'hae)) ? ((8'hb8) ? (8'ha4) : (8'ha4)) : (+(8'h9f)))}) - (({{(8'hb0)}, ((8'ha9) ^ (8'hbb))} ? (~&((8'haa) == (8'ha4))) : ({(8'ha5)} ? ((8'hba) + (8'hab)) : (^(8'hb4)))) ~^ (((8'ha8) - {(8'hb7)}) ? (7'h44) : ({(8'ha6), (7'h44)} + ((7'h41) ? (8'haf) : (8'ha6)))))))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire27;
  input wire signed [(5'h15):(1'h0)] wire26;
  input wire [(5'h14):(1'h0)] wire25;
  input wire signed [(4'hf):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire62,
                 wire30,
                 wire29,
                 wire28,
                 (1'h0)};
  assign wire28 = ($signed(((~(wire25 ? wire26 : wire27)) ^ wire24)) ?
                      (((~|wire25[(4'hd):(4'ha)]) + $unsigned($signed(wire27))) <= $signed((&wire25[(1'h0):(1'h0)]))) : $signed((^~wire26)));
  assign wire29 = {$unsigned($unsigned(wire28[(2'h3):(2'h3)]))};
  assign wire30 = ({(+$unsigned({wire28})),
                          (((wire24 ? wire29 : wire27) ?
                              (wire26 < wire28) : (wire28 >> (7'h40))) ~^ ($unsigned(wire26) ?
                              wire24 : $signed((8'hb4))))} ?
                      {$unsigned($signed(wire24[(1'h1):(1'h1)]))} : wire26);
  module31 #() modinst63 (.clk(clk), .wire33(wire25), .y(wire62), .wire34(wire27), .wire32(wire30), .wire35(wire24));
  assign wire64 = wire62[(4'h8):(1'h0)];
  assign wire65 = (~^(($unsigned((wire62 && (8'hb4))) ?
                      wire28 : (wire25[(5'h11):(4'hf)] ^~ ((8'hb6) ?
                          wire25 : wire62))) <<< ((wire27 ?
                          ((8'hb8) != (8'hb3)) : (~wire26)) ?
                      $signed((!wire64)) : (wire64[(2'h2):(2'h2)] ?
                          wire30[(4'ha):(3'h7)] : wire26))));
  assign wire66 = (wire65 ^~ wire26);
  assign wire67 = ($unsigned((wire66 | {(wire25 ? wire62 : wire65)})) ?
                      $unsigned(wire25[(5'h12):(4'h8)]) : ($signed(({wire66} <= (!wire65))) >>> wire64));
  assign wire68 = (!({$unsigned((^~wire64)), ((wire62 > wire27) && wire26)} ?
                      $signed(($unsigned(wire62) != $signed(wire62))) : wire24[(4'ha):(3'h6)]));
endmodule

module module31
#(parameter param60 = ((((((8'hba) ? (8'hba) : (7'h44)) ? ((8'ha5) + (8'ha1)) : (&(8'h9e))) - ((!(8'h9c)) || ((8'ha3) >> (8'hbc)))) >> (~((+(8'ha6)) < ((8'hb6) ? (8'h9d) : (8'hbc))))) && {((&{(8'ha9)}) == ((7'h40) >>> {(8'ha9)})), (^~(~((8'hb7) || (8'ha6))))}), 
parameter param61 = ((param60 ? (8'hae) : param60) >> ((^~param60) ? {param60, ((param60 ? param60 : param60) >= param60)} : param60)))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire35;
  input wire [(4'ha):(1'h0)] wire34;
  input wire signed [(5'h14):(1'h0)] wire33;
  input wire [(5'h10):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire59;
  wire [(3'h7):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
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
                 (1'h0)};
  assign wire36 = $unsigned((^~($unsigned((-wire32)) != wire32[(5'h10):(4'hd)])));
  assign wire37 = (~^wire32);
  assign wire38 = (8'ha9);
  assign wire39 = $unsigned((~|$unsigned($unsigned(((8'hb2) & (8'ha1))))));
  assign wire40 = (wire33 ? $unsigned(wire32) : wire38[(4'h8):(2'h2)]);
  assign wire41 = wire39[(2'h3):(1'h0)];
  assign wire42 = $signed((~$signed(((-wire35) * (|wire39)))));
  always
    @(posedge clk) begin
      reg43 <= $unsigned(wire40);
      if (($unsigned((8'ha6)) ? wire32[(4'hc):(4'h9)] : wire34))
        begin
          if ({(~&$signed(wire32))})
            begin
              reg44 <= $unsigned(((~$unsigned({wire34})) && (&wire37[(1'h1):(1'h0)])));
              reg45 <= {wire40, wire36[(1'h1):(1'h0)]};
              reg46 <= (reg45 ^~ (&wire35[(4'hf):(4'he)]));
              reg47 <= (wire33[(4'h8):(3'h6)] != ((+$unsigned($unsigned(wire32))) ?
                  wire39 : $unsigned(((^(8'haf)) ?
                      ((8'hb8) ? wire40 : wire35) : $unsigned(reg44)))));
              reg48 <= wire33;
            end
          else
            begin
              reg44 <= wire33;
            end
          reg49 <= $unsigned($unsigned((&(8'hb5))));
          reg50 <= $signed(wire35);
          reg51 <= ($signed(($unsigned($unsigned(wire42)) ?
                  {((8'h9f) ? wire40 : wire37)} : ((~^reg45) ?
                      (wire40 == reg45) : $signed(wire37)))) ?
              (^$unsigned($signed(reg44))) : wire34[(1'h0):(1'h0)]);
        end
      else
        begin
          reg44 <= $unsigned({$signed(($signed(wire41) >= $unsigned(reg48)))});
          if ((~|(($unsigned((+wire36)) ?
              ({wire36} ?
                  (wire38 ?
                      (8'hbe) : (8'ha8)) : {wire42}) : reg47) & (wire34[(3'h5):(1'h0)] & reg51[(1'h1):(1'h0)]))))
            begin
              reg45 <= wire32;
              reg46 <= (-(8'h9f));
              reg47 <= {(((8'ha0) > (|(wire36 ?
                      wire34 : wire41))) <<< reg47[(1'h1):(1'h0)]),
                  reg44};
              reg48 <= wire39;
            end
          else
            begin
              reg45 <= reg47[(2'h2):(1'h0)];
            end
          if ($unsigned(reg47))
            begin
              reg49 <= wire35[(1'h1):(1'h0)];
            end
          else
            begin
              reg49 <= wire32[(5'h10):(4'ha)];
            end
        end
      reg52 <= (($unsigned(wire39) <<< (&$unsigned(reg44))) & $signed(wire41[(4'he):(4'hb)]));
      reg53 <= $unsigned(reg45);
      reg54 <= wire32;
    end
  assign wire55 = (8'h9c);
  assign wire56 = (reg49[(3'h5):(2'h2)] ? wire35 : (-reg50[(4'hc):(3'h4)]));
  assign wire57 = $signed((~&wire33));
  assign wire58 = wire33[(4'h9):(4'h9)];
  assign wire59 = $signed($unsigned(reg49));
endmodule

module module161
#(parameter param189 = (((!{(-(8'haa)), ((8'hac) - (8'hb2))}) ? ({{(7'h43), (7'h44)}, ((8'h9d) ^~ (8'hbf))} || (((8'had) ? (7'h42) : (8'hbd)) >= (&(8'h9d)))) : (~{(^(8'hbb)), ((8'ha1) ? (8'hbd) : (7'h44))})) ? ((!{((8'hb9) ? (8'hbc) : (8'hb4))}) ~^ (8'h9d)) : (8'hbb)))
(y, clk, wire165, wire164, wire163, wire162);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire165;
  input wire signed [(3'h7):(1'h0)] wire164;
  input wire signed [(5'h15):(1'h0)] wire163;
  input wire [(5'h12):(1'h0)] wire162;
  wire [(5'h11):(1'h0)] wire188;
  wire signed [(4'he):(1'h0)] wire187;
  wire signed [(4'h8):(1'h0)] wire172;
  wire signed [(3'h6):(1'h0)] wire167;
  wire [(4'ha):(1'h0)] wire166;
  reg signed [(5'h12):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg184 = (1'h0);
  reg [(4'hc):(1'h0)] reg183 = (1'h0);
  reg [(5'h15):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg180 = (1'h0);
  reg [(5'h14):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg177 = (1'h0);
  reg [(5'h11):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire172,
                 wire167,
                 wire166,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 (1'h0)};
  assign wire166 = wire164;
  assign wire167 = wire163;
  always
    @(posedge clk) begin
      reg168 <= $unsigned($signed((~^(^~$signed((8'ha1))))));
      reg169 <= ($unsigned(wire164) ?
          {wire164[(3'h6):(3'h6)]} : (wire167[(2'h3):(2'h2)] * wire163[(2'h3):(2'h3)]));
      reg170 <= (~|reg168[(1'h0):(1'h0)]);
      reg171 <= $signed(reg169);
    end
  assign wire172 = $signed($unsigned({(|{reg170, (8'hbd)})}));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((reg169 ^ wire163[(3'h6):(3'h4)]))))
        begin
          reg173 <= ({(~|({wire164} >>> (|wire165))),
              (((wire163 <= reg171) >>> (wire165 ?
                  (8'ha2) : reg170)) >> $signed($unsigned((8'ha9))))} != $unsigned($unsigned($unsigned(reg168[(2'h3):(1'h1)]))));
        end
      else
        begin
          reg173 <= $signed(wire172);
          reg174 <= ($unsigned((wire172 ?
                  ((wire162 - (8'hb7)) ? (|(8'h9f)) : (8'hbf)) : ({reg169,
                      wire166} || reg170[(5'h10):(3'h6)]))) ?
              (|wire164[(3'h7):(3'h5)]) : $unsigned($signed((~&(reg170 >> reg170)))));
          reg175 <= reg169;
          if (reg171)
            begin
              reg176 <= ((~$unsigned(((^wire172) ?
                  reg170 : wire163[(4'hb):(3'h5)]))) ~^ (($unsigned(reg175) ?
                      wire162[(1'h1):(1'h0)] : (^((8'hb8) ?
                          wire165 : wire167))) ?
                  (((reg173 > reg174) - $unsigned(wire163)) ?
                      ((reg168 ?
                          wire167 : reg173) & ((8'ha8) && wire165)) : {$unsigned(reg171)}) : wire162[(2'h3):(2'h2)]));
              reg177 <= (~^(({{wire172},
                      (|reg171)} * $unsigned($unsigned(reg170))) ?
                  (!(+wire172)) : (({wire166} ?
                          (reg169 ? (8'hbc) : reg171) : ((8'hb3) ?
                              reg168 : reg169)) ?
                      (~|reg176) : wire165[(2'h2):(1'h0)])));
              reg178 <= (8'hb7);
            end
          else
            begin
              reg176 <= $unsigned(reg174[(2'h2):(1'h0)]);
              reg177 <= $unsigned($unsigned(reg178[(1'h0):(1'h0)]));
              reg178 <= (-(~{reg171[(4'hf):(4'hc)]}));
              reg179 <= (~|$signed($unsigned(($signed(reg177) ?
                  (8'ha7) : wire165))));
              reg180 <= $signed(({((wire162 ? reg169 : reg171) - {reg175,
                      reg168}),
                  $signed(wire162)} | $unsigned($signed($signed(reg173)))));
            end
        end
      reg181 <= ($unsigned(wire164[(3'h4):(2'h3)]) ?
          (~&$unsigned(reg169[(3'h5):(2'h3)])) : reg180[(2'h2):(2'h2)]);
      reg182 <= wire172;
      if ({(reg175[(3'h7):(2'h3)] ? reg168 : (8'h9c)),
          $unsigned(wire164[(3'h6):(3'h6)])})
        begin
          reg183 <= wire164;
          reg184 <= $signed((reg182[(3'h7):(3'h5)] ? reg178 : wire172));
          reg185 <= (-$unsigned(reg168));
        end
      else
        begin
          reg183 <= ((wire165 ~^ (~|reg171)) ? (8'hbd) : reg174);
          reg184 <= ($signed({($signed(reg181) ^ reg179), {$signed(reg180)}}) ?
              ((wire163[(4'h9):(4'h8)] ? {(^~(8'ha5))} : (&reg175)) ?
                  ({(reg180 ? reg170 : reg177),
                      (reg180 ?
                          reg175 : (8'ha6))} <<< (7'h44)) : (8'hab)) : (~&$unsigned({(wire172 > wire162),
                  (wire165 <= reg180)})));
          reg185 <= $unsigned((&$signed($signed((+(7'h43))))));
        end
      reg186 <= ($signed($signed(($signed(reg174) - $unsigned(reg180)))) ?
          (((~&$unsigned(reg169)) ?
              (reg169[(3'h5):(2'h2)] >>> reg184) : reg170) == $signed(((reg182 ?
                  reg174 : reg174) ?
              reg174[(1'h0):(1'h0)] : $signed(reg180)))) : ($signed(reg182[(3'h7):(2'h3)]) ^ reg175[(1'h0):(1'h0)]));
    end
  assign wire187 = (~reg171);
  assign wire188 = $signed(reg176);
endmodule

module module93  (y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h263):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire98;
  input wire [(4'ha):(1'h0)] wire97;
  input wire [(5'h15):(1'h0)] wire96;
  input wire [(2'h2):(1'h0)] wire95;
  input wire [(4'hd):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire152;
  wire [(2'h2):(1'h0)] wire151;
  wire signed [(2'h3):(1'h0)] wire150;
  wire [(3'h7):(1'h0)] wire149;
  wire [(4'hd):(1'h0)] wire148;
  wire [(4'hb):(1'h0)] wire147;
  wire [(4'hd):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire129;
  wire [(5'h12):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire127;
  wire signed [(5'h13):(1'h0)] wire121;
  wire [(3'h7):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire119;
  wire signed [(3'h6):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire99;
  reg signed [(4'he):(1'h0)] reg155 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg144 = (1'h0);
  reg signed [(4'he):(1'h0)] reg143 = (1'h0);
  reg [(4'hd):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire99,
                 reg155,
                 reg154,
                 reg153,
                 reg146,
                 reg145,
                 reg144,
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
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
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
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire99 = wire97[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg100 <= (~|(8'ha5));
      reg101 <= $signed(wire95);
      if ($signed($unsigned($signed(wire99[(3'h6):(1'h0)]))))
        begin
          reg102 <= (reg101[(1'h0):(1'h0)] >= $signed((((wire94 << wire95) >= (^~wire95)) ^ wire95[(1'h1):(1'h1)])));
        end
      else
        begin
          if ((+(~&($signed((wire96 ?
              reg101 : reg100)) & ((wire99 >= reg101) || $unsigned(reg102))))))
            begin
              reg102 <= wire97;
            end
          else
            begin
              reg102 <= (reg102 | ((^~($unsigned(reg100) ?
                      $signed(reg101) : (reg100 ? wire95 : wire96))) ?
                  {($signed((8'hb8)) ? reg102[(5'h12):(3'h4)] : (&wire98)),
                      reg102[(3'h5):(2'h2)]} : {$unsigned(((8'hbc) <<< wire97))}));
              reg103 <= wire94[(3'h5):(1'h1)];
              reg104 <= $signed((wire94[(2'h2):(2'h2)] ?
                  ($signed(wire98) ?
                      ($signed((8'hab)) ?
                          (wire97 != (7'h42)) : (wire96 ?
                              wire99 : wire96)) : $signed((+reg100))) : wire97));
            end
          reg105 <= (^~$unsigned({(reg102 ? (~^reg102) : (~reg101))}));
          reg106 <= $signed(($signed($signed($unsigned(reg103))) > reg100[(2'h2):(1'h0)]));
          reg107 <= reg102;
          reg108 <= ({reg107[(3'h6):(1'h1)]} == {($unsigned(reg103) ?
                  $signed(reg104[(3'h6):(2'h2)]) : $signed(wire97[(3'h5):(3'h5)]))});
        end
      if ({(&$unsigned(reg107)), reg103[(3'h6):(3'h6)]})
        begin
          reg109 <= (+((($signed((8'ha2)) ?
                  $signed((8'hbb)) : reg102) + (&{wire96, wire97})) ?
              reg108[(5'h10):(4'h8)] : (wire97[(4'ha):(4'h9)] <<< {{reg100}})));
          reg110 <= (reg109 != wire96[(4'hf):(3'h5)]);
          reg111 <= ($unsigned((~^wire95[(1'h1):(1'h0)])) == reg105[(1'h1):(1'h1)]);
          reg112 <= (wire99[(3'h4):(2'h2)] ?
              reg102 : ((~&reg101) != wire94[(4'h8):(1'h1)]));
          reg113 <= $unsigned(($unsigned(({wire95} ?
                  ((8'hb2) ~^ wire94) : (wire94 >> reg106))) ?
              $signed(reg100) : ($signed((^~wire98)) > $signed($signed(reg107)))));
        end
      else
        begin
          reg109 <= (reg100 ?
              ($signed($signed((+wire96))) ?
                  $unsigned(reg111[(4'hd):(1'h1)]) : $unsigned(wire96)) : (reg108[(4'h8):(1'h1)] ?
                  reg108 : reg112));
        end
    end
  always
    @(posedge clk) begin
      reg114 <= (({wire99, $unsigned((~|reg106))} ? wire99 : reg108) ?
          $signed($signed($unsigned($unsigned((8'hb8))))) : (($signed((^~(7'h40))) ^~ ((7'h43) ?
                  $signed(wire96) : $signed(reg108))) ?
              reg113[(1'h0):(1'h0)] : $signed($unsigned((~|reg106)))));
    end
  always
    @(posedge clk) begin
      reg115 <= (^((!((-reg109) << (wire95 ?
          wire99 : reg107))) >>> wire97[(4'h9):(3'h4)]));
      reg116 <= (((~((^~(8'hb8)) ?
              (reg105 ?
                  reg106 : wire99) : reg114[(1'h0):(1'h0)])) - $signed($signed((wire95 ?
              reg104 : wire94)))) ?
          reg103 : reg102[(5'h12):(2'h2)]);
      reg117 <= $unsigned((~&($unsigned($signed(reg116)) ?
          ($signed(reg111) ?
              (reg115 ?
                  (7'h40) : wire99) : wire98) : ($unsigned(wire96) != {reg108,
              wire95}))));
    end
  assign wire118 = $signed(reg108);
  assign wire119 = $unsigned(($unsigned($unsigned((^~reg111))) ?
                       $unsigned(((8'hbd) <<< wire118[(2'h2):(2'h2)])) : (((reg116 ?
                               reg107 : reg104) ?
                           reg115 : $signed(wire96)) || ((reg105 | wire94) ?
                           (reg110 ? reg108 : reg114) : (&reg111)))));
  assign wire120 = reg112[(3'h7):(2'h3)];
  assign wire121 = ((~{$signed((reg117 <= reg110))}) + (($unsigned(wire95[(2'h2):(1'h0)]) ?
                           {{reg114}} : (reg115 ?
                               $signed(reg108) : (~^reg115))) ?
                       $signed($unsigned((wire99 - (8'ha8)))) : {reg108[(3'h7):(1'h1)],
                           reg116}));
  always
    @(posedge clk) begin
      reg122 <= $signed($signed(($signed((reg113 ?
          reg104 : reg114)) && reg111[(1'h0):(1'h0)])));
      reg123 <= (($unsigned($signed((wire98 ?
              wire120 : reg108))) && ((^$unsigned(wire98)) >> (8'hba))) ?
          (~|{(-(!wire98))}) : wire119);
      reg124 <= $unsigned(reg102[(3'h6):(3'h6)]);
      reg125 <= ((wire94 ~^ ($unsigned((reg113 ?
              reg107 : (7'h40))) && $signed((reg117 | wire119)))) ?
          (($signed((reg103 ?
              reg105 : reg100)) || reg107[(1'h0):(1'h0)]) >= (~|$signed((+reg114)))) : $unsigned((($unsigned(reg117) * {(8'hb7)}) || reg103)));
      reg126 <= $signed(wire97);
    end
  assign wire127 = $unsigned(((8'hb4) > {(-(reg122 & (8'ha8))),
                       ({wire121, reg122} ? reg122 : (reg110 >> reg108))}));
  assign wire128 = {$signed((((reg116 ?
                               (8'hae) : wire127) ^~ (reg108 + reg100)) ?
                           reg107 : ((~&reg111) != reg112)))};
  assign wire129 = (reg101 ~^ ((($signed(reg106) ?
                           $unsigned(reg103) : $signed(wire97)) ?
                       (~^(~wire118)) : ({reg105} ^~ {reg117})) && (~^(wire118 >= reg122))));
  assign wire130 = reg116[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg131 <= ($unsigned((!(|reg115[(4'h9):(1'h1)]))) ?
          {reg100} : $unsigned($unsigned(reg106[(5'h13):(4'hb)])));
      if (reg112)
        begin
          if ($unsigned((~&(((reg100 ? reg111 : (8'hba)) << (reg106 ?
              reg117 : reg111)) ~^ (reg123 ^ $signed(reg106))))))
            begin
              reg132 <= $signed($unsigned(((wire97[(4'h8):(3'h5)] | (wire118 ^~ reg111)) ?
                  (-$unsigned((8'hb2))) : (~^(reg124 ? reg123 : reg131)))));
            end
          else
            begin
              reg132 <= (8'h9c);
              reg133 <= (~|wire99[(2'h3):(2'h2)]);
              reg134 <= (($signed($unsigned((wire99 ^~ wire95))) ?
                  (($signed((8'hbb)) < (~^(8'hbb))) >>> (~|$signed(wire95))) : ((reg103[(2'h2):(1'h1)] && $signed((8'h9e))) ?
                      ((~^reg126) > $unsigned(reg106)) : {$unsigned((8'ha0)),
                          $unsigned(wire119)})) <= $unsigned($unsigned(($signed(reg124) ^ (&reg124)))));
            end
          reg135 <= $unsigned(((reg131 ?
              ((reg110 >> reg101) ?
                  reg134 : (reg113 <<< reg132)) : $signed($unsigned((8'hb3)))) ^~ reg123));
          reg136 <= (wire96[(4'hd):(4'h9)] ? (-(!reg107)) : wire128);
          reg137 <= (((~^$unsigned($signed(wire121))) && $unsigned($signed(wire96[(2'h2):(2'h2)]))) >>> (8'hb0));
          if (((wire128[(3'h4):(1'h1)] < reg110[(3'h7):(3'h5)]) ?
              ((~$signed({reg136,
                  reg133})) & reg115[(4'h8):(2'h3)]) : $unsigned((reg125[(1'h1):(1'h1)] == (&$unsigned(wire94))))))
            begin
              reg138 <= $signed($unsigned(reg134));
              reg139 <= (reg117 ?
                  reg138 : (((((8'ha3) * wire120) || $unsigned(reg106)) > (^wire128[(5'h12):(1'h1)])) >= (^((^~(8'ha4)) < (wire98 ?
                      reg100 : reg137)))));
              reg140 <= ($signed($signed(wire118)) ?
                  (^reg132) : ($signed(($unsigned(reg111) + (wire119 ?
                      reg123 : reg115))) || $unsigned($signed(((7'h43) ?
                      reg112 : wire118)))));
              reg141 <= (~reg103);
            end
          else
            begin
              reg138 <= reg111;
            end
        end
      else
        begin
          reg132 <= reg141[(3'h7):(3'h7)];
          if ((&$unsigned($unsigned($signed($signed(reg141))))))
            begin
              reg133 <= reg135[(3'h6):(3'h5)];
              reg134 <= (wire129[(1'h0):(1'h0)] ?
                  {reg101[(1'h1):(1'h0)]} : reg114[(1'h0):(1'h0)]);
              reg135 <= $signed(reg126);
              reg136 <= {(wire130 ? reg116[(2'h2):(1'h1)] : (+(8'h9f)))};
              reg137 <= {wire96[(1'h0):(1'h0)]};
            end
          else
            begin
              reg133 <= $unsigned((|$signed(reg123[(1'h1):(1'h1)])));
              reg134 <= reg117[(3'h6):(1'h0)];
              reg135 <= reg134[(3'h4):(1'h1)];
            end
          reg138 <= $signed($unsigned(($unsigned($unsigned((8'hb7))) ?
              wire94[(2'h2):(2'h2)] : reg115[(4'h8):(2'h2)])));
          if ((^~($unsigned({wire97[(3'h7):(3'h5)], $unsigned(reg104)}) ?
              reg123[(2'h2):(1'h1)] : reg114)))
            begin
              reg139 <= $unsigned(reg113[(3'h4):(2'h2)]);
              reg140 <= wire120;
            end
          else
            begin
              reg139 <= ({{$signed((reg140 >> wire118))}} ?
                  $signed(reg139[(3'h4):(1'h0)]) : wire94);
            end
          reg141 <= reg103[(2'h3):(2'h2)];
        end
      if (reg124)
        begin
          reg142 <= ((~|(^((reg125 & reg141) ?
                  (reg131 ^ wire95) : $unsigned(reg117)))) ?
              $signed({$signed($signed(reg132))}) : reg125);
          reg143 <= $unsigned(reg111[(2'h3):(1'h0)]);
        end
      else
        begin
          reg142 <= reg115;
          if ((&$signed(wire95)))
            begin
              reg143 <= reg115[(3'h5):(2'h3)];
              reg144 <= $signed(reg114[(1'h0):(1'h0)]);
              reg145 <= ({($unsigned($unsigned(wire127)) ^~ (reg132[(1'h0):(1'h0)] ?
                          (~^reg112) : $signed(reg116)))} ?
                  reg142 : ((^((reg109 ? (7'h41) : reg136) ?
                          reg109[(3'h4):(1'h0)] : $signed(reg108))) ?
                      (reg114[(1'h0):(1'h0)] ?
                          (8'had) : $unsigned($signed(wire119))) : reg107));
              reg146 <= {{$unsigned((~&$signed(reg138)))}};
            end
          else
            begin
              reg143 <= (reg113 < (&(8'hb3)));
              reg144 <= ((!(((~^reg132) ?
                      $signed((8'h9c)) : $unsigned((7'h43))) ?
                  $signed($signed((8'hba))) : ((reg101 | reg142) ?
                      (reg107 ?
                          reg135 : (8'h9f)) : (wire129 && reg111)))) ^ {$unsigned(($signed(reg104) ?
                      wire120 : ((8'h9f) ? reg116 : (8'ha2))))});
              reg145 <= (~&$unsigned(({reg137[(4'hb):(4'ha)]} ?
                  wire121[(3'h7):(3'h6)] : (-(8'h9e)))));
            end
        end
    end
  assign wire147 = reg116[(1'h0):(1'h0)];
  assign wire148 = reg144[(3'h4):(1'h0)];
  assign wire149 = wire118;
  assign wire150 = $signed($signed(reg103));
  assign wire151 = (+reg123[(2'h3):(1'h0)]);
  assign wire152 = (7'h44);
  always
    @(posedge clk) begin
      reg153 <= (~&wire148[(1'h0):(1'h0)]);
      reg154 <= $signed(($signed((&$signed(reg131))) * (((wire149 ?
              reg122 : reg101) ?
          reg143[(3'h6):(3'h4)] : reg112) - $unsigned($unsigned(wire151)))));
    end
  always
    @(posedge clk) begin
      reg155 <= (8'ha2);
    end
endmodule
