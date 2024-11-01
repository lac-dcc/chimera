module top
#(parameter param107 = {(~((((8'h9d) <= (8'hae)) ? ((8'h9d) ? (7'h44) : (8'hb4)) : {(8'ha6), (8'hb4)}) ? {((8'ha6) ^ (8'ha9))} : (((8'haa) ? (8'hbc) : (8'ha7)) ? {(8'hbc), (8'hbe)} : ((8'ha6) != (8'hbe)))))}, 
parameter param108 = (param107 ? {param107, ((|((8'haf) ? param107 : param107)) ? (&(param107 ? param107 : param107)) : {((8'hb9) ? param107 : param107), (param107 ? (8'hb1) : param107)})} : (~{{(param107 ? param107 : param107), (param107 & param107)}})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  assign y = {wire106, wire104, wire30, wire5, wire4, (1'h0)};
  assign wire4 = $signed((((+(wire0 ?
                     (8'ha9) : wire3)) ^ wire1[(1'h0):(1'h0)]) >= wire0));
  assign wire5 = $signed($signed((($unsigned(wire0) ?
                         wire3 : $unsigned(wire0)) ?
                     wire3[(3'h6):(3'h4)] : (~$unsigned(wire4)))));
  module6 #() modinst31 (.clk(clk), .y(wire30), .wire8(wire2), .wire9(wire3), .wire7(wire5), .wire10(wire0));
  module32 #() modinst105 (wire104, clk, wire3, wire1, wire2, wire0);
  assign wire106 = (((wire104 != {(^~wire0), $signed(wire3)}) ?
                           wire4[(2'h2):(2'h2)] : ((wire2[(3'h6):(3'h6)] ?
                               (wire2 ^~ wire104) : (7'h43)) * (wire2 ?
                               ((7'h40) ^ wire2) : (~&wire1)))) ?
                       (wire4 ?
                           wire3 : $signed(((8'hbd) >= $unsigned(wire3)))) : (~|wire1[(4'h8):(4'h8)]));
endmodule

module module32
#(parameter param103 = (((~^(~|((8'hbc) | (7'h42)))) ^ (~^{(~&(8'ha8))})) | ((((+(8'hb0)) || ((7'h43) ~^ (8'ha7))) || ({(8'ha6)} >= ((8'ha4) ? (8'hb8) : (8'h9f)))) ? ((((8'hac) ? (8'ha0) : (7'h40)) ? {(8'h9d), (8'ha1)} : ((7'h40) & (8'hab))) >= (((8'h9c) ? (8'hbb) : (8'haa)) == (~&(8'h9f)))) : (+(|((8'hbd) ? (8'hb3) : (8'ha6)))))))
(y, clk, wire33, wire34, wire35, wire36);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire33;
  input wire [(5'h13):(1'h0)] wire34;
  input wire signed [(3'h7):(1'h0)] wire35;
  input wire signed [(5'h10):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire [(3'h6):(1'h0)] wire98;
  wire [(4'hd):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire83;
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire86,
                 wire85,
                 wire46,
                 wire83,
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
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg37 <= ($signed($signed((wire36 ?
              wire35[(3'h5):(3'h5)] : wire34[(4'hc):(4'hb)]))) ?
          {(($unsigned(wire33) ?
                  (~wire33) : (wire34 ? (8'hbc) : wire35)) > wire36),
              (wire33 ~^ $signed(((8'hb8) ?
                  wire36 : wire36)))} : $unsigned(wire36[(4'he):(4'h8)]));
      reg38 <= $unsigned((wire36 ?
          (^(((8'hb0) <<< wire33) | {wire36,
              reg37})) : ((wire34[(4'hb):(3'h7)] ?
                  wire33[(4'h9):(1'h0)] : {wire33, (8'hbc)}) ?
              wire35[(3'h4):(2'h3)] : wire33)));
      reg39 <= (^~wire36);
      reg40 <= ({(reg37[(5'h14):(4'ha)] ?
              reg37[(4'hc):(3'h7)] : wire33)} == reg37[(5'h12):(4'ha)]);
      if (((($signed(wire36) == $signed((wire36 ? wire35 : reg37))) ?
          $unsigned(reg39[(1'h0):(1'h0)]) : reg39) | (+wire36[(3'h7):(2'h2)])))
        begin
          reg41 <= ((~{reg39[(2'h3):(2'h2)],
              wire35}) == (~&wire36[(4'h9):(3'h6)]));
          reg42 <= (&$signed($signed(wire34[(3'h4):(1'h0)])));
          reg43 <= reg38[(4'h9):(4'h9)];
        end
      else
        begin
          reg41 <= $unsigned($signed(reg41[(4'hb):(2'h2)]));
          reg42 <= ($signed((8'hbe)) ?
              $unsigned(wire33) : (+($unsigned((|reg40)) ?
                  {(reg41 << reg43)} : $signed(wire34[(3'h4):(2'h2)]))));
          reg43 <= (^$unsigned(wire34));
          reg44 <= (reg42 >> ({reg41[(4'h8):(3'h7)]} <= $signed((~&reg41[(2'h3):(1'h1)]))));
          reg45 <= $unsigned((($unsigned($unsigned(reg42)) >= (^~reg40[(3'h7):(1'h0)])) >> (+($signed((8'hab)) ?
              wire34[(1'h0):(1'h0)] : {reg39}))));
        end
    end
  assign wire46 = reg41;
  always
    @(posedge clk) begin
      reg47 <= wire35[(3'h4):(2'h3)];
      if ((reg47[(3'h6):(3'h6)] ?
          reg38[(3'h6):(2'h3)] : (~|((8'ha3) ?
              (^~(wire46 || wire33)) : wire35))))
        begin
          if (wire34)
            begin
              reg48 <= (({$unsigned($signed((8'hb5)))} ?
                      $unsigned({$unsigned((8'hba)),
                          $signed(reg42)}) : $unsigned(((wire36 ?
                              wire34 : reg47) ?
                          wire46[(1'h1):(1'h0)] : $signed(reg42)))) ?
                  wire35[(1'h0):(1'h0)] : reg45[(2'h2):(2'h2)]);
              reg49 <= ((|(~|(7'h40))) ?
                  {(8'hb8)} : ($signed($signed((reg40 ~^ reg41))) ?
                      $unsigned($signed((wire35 - (8'hb2)))) : reg41[(3'h4):(2'h3)]));
              reg50 <= wire33;
              reg51 <= (reg40 & wire36[(4'hf):(3'h5)]);
            end
          else
            begin
              reg48 <= $unsigned(((~((~(8'hbf)) ? $unsigned(wire46) : wire33)) ?
                  reg40[(3'h6):(3'h4)] : {reg37[(1'h0):(1'h0)]}));
            end
          reg52 <= (-(^~wire46[(2'h2):(1'h1)]));
          reg53 <= wire33[(4'hc):(4'h8)];
          reg54 <= (-(reg48[(3'h5):(1'h0)] > reg43[(1'h1):(1'h1)]));
          reg55 <= reg53[(4'h9):(3'h6)];
        end
      else
        begin
          if ((($signed((~&(8'hb8))) >>> (8'ha2)) << (^reg40)))
            begin
              reg48 <= (&reg37);
            end
          else
            begin
              reg48 <= reg37;
              reg49 <= ((((wire35[(2'h2):(1'h1)] ?
                      reg40 : {reg41}) <= reg52[(4'hb):(2'h2)]) ?
                  {reg37[(5'h10):(1'h1)],
                      $unsigned((8'hb5))} : (reg45[(2'h3):(1'h1)] << $signed(wire46))) >> (~^reg53));
              reg50 <= wire34[(3'h7):(3'h4)];
            end
          if ((8'h9d))
            begin
              reg51 <= {(reg44 - {$signed(reg37[(5'h14):(4'ha)])}),
                  (!((~|wire34[(4'hb):(3'h6)]) ?
                      {(reg39 ? reg47 : reg47),
                          reg43[(4'ha):(3'h6)]} : $unsigned(reg43)))};
              reg52 <= (+reg41);
              reg53 <= reg55;
              reg54 <= $signed(reg40[(2'h2):(1'h1)]);
              reg55 <= (!($unsigned((~&(-reg53))) > (-$unsigned((wire46 >> wire34)))));
            end
          else
            begin
              reg51 <= $signed(reg48[(1'h0):(1'h0)]);
              reg52 <= (~&{reg51});
            end
          reg56 <= reg55[(1'h0):(1'h0)];
          reg57 <= ((~^{($signed(reg56) * $unsigned(reg47)),
                  {(wire33 <<< reg56), $unsigned(wire34)}}) ?
              reg37[(4'hc):(2'h3)] : (|reg50[(1'h1):(1'h0)]));
        end
    end
  module58 #() modinst84 (.wire59(wire35), .clk(clk), .y(wire83), .wire62(reg53), .wire61(reg41), .wire63(reg40), .wire60(reg57));
  assign wire85 = ((!wire83) ?
                      ($signed({(reg51 > reg47), (~wire36)}) ?
                          reg51 : (~&$unsigned($unsigned((8'h9d))))) : $signed((((reg37 ?
                              reg54 : reg44) ?
                          (-reg37) : (~&reg52)) ^ $unsigned(reg54[(1'h0):(1'h0)]))));
  assign wire86 = $unsigned($unsigned(($signed((-reg41)) ?
                      (reg55 >>> (reg44 ?
                          reg53 : wire85)) : reg55[(4'ha):(3'h6)])));
  always
    @(posedge clk) begin
      reg87 <= {{reg38, reg56},
          ((($unsigned(wire34) - $signed(reg42)) | ((-reg53) ~^ ((8'ha5) ^~ wire34))) ?
              ({(reg38 ? (8'ha2) : wire35)} ?
                  reg48[(3'h6):(1'h1)] : (&reg41)) : reg50)};
      if ($signed((+reg48)))
        begin
          reg88 <= ({((^~((8'hb5) ? wire83 : (8'hbc))) < (~|(reg48 ?
                  reg38 : wire83)))} == (($signed(reg57[(3'h4):(3'h4)]) ?
                  (reg54 << (~^(8'hb1))) : (reg56 ?
                      reg40 : $unsigned(wire85))) ?
              (^($unsigned(reg39) ?
                  (reg40 | reg44) : $unsigned(reg50))) : (+reg54)));
          if (reg56[(1'h1):(1'h1)])
            begin
              reg89 <= reg43;
              reg90 <= wire36[(4'ha):(3'h6)];
            end
          else
            begin
              reg89 <= (reg47 ?
                  ($signed($signed((7'h41))) - reg51[(1'h1):(1'h0)]) : reg54);
              reg90 <= {(+(((reg38 ?
                      reg88 : reg44) >> reg57[(1'h1):(1'h1)]) * wire83[(5'h11):(3'h6)]))};
              reg91 <= (~|{$unsigned($unsigned(reg48[(2'h2):(1'h1)]))});
              reg92 <= $unsigned({(~&wire46),
                  (reg91[(4'he):(3'h7)] ?
                      ((|reg41) < (8'hb9)) : (~|reg48[(3'h4):(2'h2)]))});
            end
        end
      else
        begin
          reg88 <= wire33;
          reg89 <= $signed($signed($signed($signed((reg54 >> reg87)))));
          reg90 <= $unsigned((^(reg40[(2'h3):(2'h3)] ?
              ((+(8'ha8)) <= $unsigned(reg88)) : reg92)));
        end
      if ((8'ha7))
        begin
          reg93 <= $signed(((^$unsigned(((8'hb8) ? reg44 : reg41))) ?
              $unsigned((wire85[(1'h1):(1'h0)] ?
                  (reg48 < reg91) : reg54[(3'h6):(1'h1)])) : (($unsigned(wire83) > (8'ha3)) ^ reg37)));
          reg94 <= wire35;
          reg95 <= wire83[(4'he):(4'he)];
        end
      else
        begin
          reg93 <= $unsigned((8'h9c));
        end
      reg96 <= $signed((($unsigned({wire86, reg56}) ?
          {(reg94 ^ (8'hb6))} : ($signed(reg95) ?
              $signed(wire83) : $signed(reg89))) >>> $signed($unsigned($signed(reg39)))));
    end
  assign wire97 = (reg45 ?
                      ((|wire33[(5'h11):(5'h10)]) ?
                          reg50 : reg96) : $unsigned($signed({(&wire83),
                          reg47[(4'hb):(2'h3)]})));
  assign wire98 = ((-($signed($signed(wire34)) ?
                          reg37[(3'h6):(1'h0)] : $signed(wire46))) ?
                      wire85 : $unsigned((&$signed((-reg89)))));
  assign wire99 = ((8'haf) ? reg51 : reg92);
  assign wire100 = (wire83[(2'h3):(2'h3)] > wire85);
  assign wire101 = (^($signed((reg55 >= (wire36 ? reg39 : reg57))) ?
                       (&(wire33[(4'hf):(4'he)] && $signed(reg40))) : $unsigned($unsigned($unsigned(reg87)))));
  assign wire102 = (reg53[(2'h2):(2'h2)] <<< ((|({(8'ha4)} >> reg43[(3'h6):(1'h1)])) ^~ (&(~$unsigned(wire101)))));
endmodule

module module6
#(parameter param29 = (^~((((|(7'h44)) ? ((8'hb1) ? (8'ha0) : (8'ha4)) : ((8'ha4) ? (8'hb1) : (8'h9d))) | (((8'hb2) ? (8'haf) : (8'hbd)) || {(8'hb5)})) ? (((|(8'ha9)) + (-(8'hb7))) ? (((8'hb0) << (8'hb4)) ? {(8'hb4)} : (~&(8'ha8))) : (((8'hb9) ? (8'hb1) : (8'hb5)) | (+(8'hb6)))) : (~(&((8'ha7) ~^ (8'hb6)))))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire7;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire27;
  assign y = {wire11, wire12, wire13, wire14, wire27, (1'h0)};
  assign wire11 = ((wire10[(2'h3):(2'h2)] > $unsigned(wire9)) >= $unsigned((-$signed((wire9 ?
                      wire10 : wire9)))));
  assign wire12 = $signed((wire9[(4'hc):(1'h1)] ?
                      ($unsigned(wire7) ?
                          {((8'hbc) != wire8),
                              $unsigned((8'ha9))} : $unsigned(wire7)) : (($signed(wire8) - (&wire10)) == ((|wire9) ?
                          (|(8'hb1)) : {wire9, (8'hab)}))));
  assign wire13 = wire12[(3'h6):(3'h6)];
  assign wire14 = {($unsigned(wire9[(2'h3):(2'h3)]) ?
                          wire11 : (wire12[(3'h5):(1'h1)] > (((8'h9d) ?
                                  wire13 : wire11) ?
                              (wire13 ? (8'hb7) : wire9) : {wire10,
                                  (8'hb3)})))};
  module15 #() modinst28 (wire27, clk, wire9, wire14, wire7, wire13, wire12);
endmodule

module module15
#(parameter param26 = ((((((8'h9c) ^ (8'hab)) * (~^(8'hba))) ? {(^~(8'hae))} : (+((8'ha9) && (8'ha9)))) ? ((((8'hb7) <<< (8'haa)) ? {(8'hbc)} : ((8'hbf) ? (8'ha7) : (8'ha2))) - (^((8'hb7) >> (8'h9f)))) : ((-(-(8'hb3))) ~^ {((8'hb5) ? (8'hbe) : (8'ha4))})) ? {(^~(((7'h44) << (8'hbe)) ? ((8'hbd) == (8'hae)) : (^~(8'hbc))))} : (((~|((7'h44) * (8'ha1))) == ((~&(8'haf)) >> ((8'hbb) | (8'haf)))) != (((+(8'ha6)) ^ ((8'hae) ? (8'ha8) : (8'h9f))) ? (!(|(8'hbc))) : ((^~(8'hbf)) ? ((8'hbc) ? (8'ha9) : (7'h41)) : (8'hb8))))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire19;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire signed [(2'h3):(1'h0)] wire17;
  input wire [(4'h9):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  assign y = {wire23, wire22, wire21, reg25, reg24, (1'h0)};
  assign wire21 = (&wire18[(2'h2):(2'h2)]);
  assign wire22 = ((wire20 ? wire17[(2'h2):(1'h0)] : wire20[(1'h1):(1'h0)]) ?
                      $signed($signed(($signed(wire17) >>> $unsigned(wire18)))) : wire21[(3'h5):(1'h1)]);
  assign wire23 = wire20;
  always
    @(posedge clk) begin
      reg24 <= {(-($signed($signed(wire18)) * $signed((wire22 <<< wire17))))};
      reg25 <= $signed(wire22[(2'h2):(1'h1)]);
    end
endmodule

module module58  (y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire63;
  input wire signed [(4'hc):(1'h0)] wire62;
  input wire [(4'ha):(1'h0)] wire61;
  input wire [(3'h6):(1'h0)] wire60;
  input wire [(3'h4):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire76,
                 wire75,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg77,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire64 = $unsigned(($unsigned((-wire63[(2'h3):(1'h0)])) ^~ $unsigned($signed((wire61 ?
                      wire61 : wire59)))));
  assign wire65 = $signed(wire59[(1'h0):(1'h0)]);
  assign wire66 = ((+((^$signed(wire59)) - $signed((8'hba)))) ?
                      ($unsigned(wire61) > {wire65,
                          ((wire63 >= (8'h9e)) || ((7'h40) & wire64))}) : {wire63});
  assign wire67 = {wire60, {wire59[(2'h2):(2'h2)], {wire66}}};
  assign wire68 = (8'ha8);
  assign wire69 = wire66;
  assign wire70 = (~(($unsigned((wire63 ? wire68 : wire59)) - ((wire68 ?
                              wire69 : wire69) ?
                          ((8'hb4) < wire69) : (wire64 ? (8'h9d) : wire67))) ?
                      (&$unsigned(wire60)) : (7'h44)));
  always
    @(posedge clk) begin
      reg71 <= $unsigned(wire59);
      reg72 <= {$signed(reg71)};
      reg73 <= $signed(wire62[(3'h6):(3'h6)]);
      reg74 <= ((wire68 == wire64) ?
          ((($unsigned((8'h9f)) - ((8'ha9) > wire61)) ?
                  wire66[(4'ha):(2'h3)] : ((!(8'hb0)) + wire70[(1'h0):(1'h0)])) ?
              {wire65[(3'h4):(2'h2)]} : (wire63[(1'h1):(1'h0)] ?
                  (wire59 == (wire67 || (8'hbd))) : $unsigned({wire61,
                      wire69}))) : wire65);
    end
  assign wire75 = wire64[(3'h6):(2'h2)];
  assign wire76 = ((~^$unsigned($unsigned({reg72,
                      wire66}))) >> ({$signed($unsigned((7'h41)))} ?
                      $unsigned((reg73[(2'h3):(2'h2)] ?
                          $unsigned(reg71) : $unsigned(wire60))) : ({(reg73 >= wire59),
                          $signed(wire60)} < $unsigned($unsigned(wire70)))));
  always
    @(posedge clk) begin
      reg77 <= (&(((wire68 ? $unsigned(wire61) : wire64) ?
              ((^wire60) << wire59[(2'h3):(2'h2)]) : wire62[(4'ha):(2'h3)]) ?
          $unsigned(({(8'ha3), wire76} ?
              (+wire76) : (!(8'ha2)))) : (wire75 != ((wire61 ?
              wire66 : (8'hb9)) < ((8'hab) << (7'h40))))));
    end
  assign wire78 = (wire75[(2'h3):(2'h3)] >>> $signed(($signed($signed(wire61)) ?
                      $unsigned(((8'hab) ?
                          wire68 : (8'hb0))) : (reg71[(2'h2):(1'h1)] - (wire75 ?
                          wire69 : wire67)))));
  assign wire79 = ((reg74[(1'h0):(1'h0)] ?
                      wire68 : wire65[(5'h13):(3'h7)]) <= (wire61[(4'h9):(3'h7)] ?
                      ((((8'hb7) | (8'ha5)) ?
                              $signed(wire59) : wire75[(4'h8):(2'h3)]) ?
                          ((8'hab) - {wire66, wire78}) : ({wire61} ?
                              $signed((8'h9c)) : wire63[(3'h6):(3'h4)])) : (wire65 == $signed($signed(wire62)))));
  assign wire80 = wire65;
  assign wire81 = wire60;
  assign wire82 = (&wire61);
endmodule
