module top
#(parameter param128 = ((({((8'hb8) <<< (8'ha3))} >>> (^((8'hb2) || (8'ha0)))) ? ((&{(8'hba)}) ? (((8'haf) ? (8'h9e) : (8'hb0)) ? (8'hac) : {(8'ha5), (8'hb5)}) : (^(|(8'ha3)))) : ((((8'hbf) ? (7'h43) : (8'h9d)) > (8'h9c)) | (|(~^(8'ha1))))) >= ((8'hb5) ? {(|((8'hb5) >>> (8'ha3))), ({(8'hb9)} ? ((8'hab) || (8'hab)) : (-(7'h44)))} : (~^{((8'ha8) <<< (8'hae)), {(8'hac)}}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire127;
  wire signed [(4'hf):(1'h0)] wire126;
  wire signed [(4'hf):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire123;
  wire [(3'h5):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  reg [(5'h10):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire116,
                 wire115,
                 wire114,
                 wire112,
                 wire7,
                 wire6,
                 wire5,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire5 = $unsigned((&$unsigned(({wire2} ~^ $unsigned(wire2)))));
  assign wire6 = (((((wire3 <= (8'ha5)) || (wire4 ? (8'h9d) : wire2)) ?
                         $signed(wire2) : wire2[(5'h10):(2'h3)]) ^ (^wire1)) ?
                     $unsigned(wire0[(2'h2):(2'h2)]) : wire2[(4'h8):(3'h5)]);
  assign wire7 = wire0[(3'h4):(2'h2)];
  module8 #() modinst113 (wire112, clk, wire6, wire7, wire4, wire3);
  assign wire114 = $unsigned((^((~|(~wire5)) ?
                       wire112[(4'hb):(1'h0)] : wire5[(3'h4):(3'h4)])));
  assign wire115 = {wire4,
                       ((wire112[(3'h6):(1'h0)] ?
                               ((~^wire1) == (wire7 ?
                                   wire0 : wire7)) : wire112[(4'he):(3'h4)]) ?
                           (8'ha3) : wire112)};
  assign wire116 = wire0;
  always
    @(posedge clk) begin
      reg117 <= wire0[(4'hc):(4'hc)];
      reg118 <= ($signed(({((8'hb0) < wire3)} ?
              wire0[(3'h7):(1'h1)] : wire5[(4'h8):(4'h8)])) ?
          (~&$unsigned((^$unsigned(wire112)))) : (~wire116));
      reg119 <= wire5[(2'h2):(1'h0)];
      reg120 <= $signed((wire3 >>> (($signed((8'h9d)) <= (wire112 >>> wire5)) < (!(wire1 ?
          wire115 : wire115)))));
      reg121 <= ((~&$signed((~$unsigned(wire7)))) ?
          $unsigned((~^(7'h43))) : (($signed(wire115) + wire115) <= ($unsigned((8'hb8)) && {wire115})));
    end
  assign wire122 = (8'ha1);
  assign wire123 = $signed(reg119);
  assign wire124 = wire3;
  assign wire125 = $signed(wire123);
  assign wire126 = wire125[(3'h5):(1'h0)];
  assign wire127 = reg119[(4'h8):(1'h0)];
endmodule

module module8
#(parameter param110 = (((~(((8'hb8) >> (8'h9c)) >= {(8'ha2), (8'hb9)})) != ((((8'hb6) ? (8'ha4) : (8'ha6)) < ((8'hbe) ~^ (7'h40))) ~^ (-((8'h9e) && (8'ha6))))) ? ({(~((8'hb6) ? (7'h43) : (8'haa)))} ~^ (8'ha5)) : ({((~(8'hae)) >= ((8'ha3) ? (8'ha5) : (8'hae)))} ? ({{(8'hb0), (8'hb1)}, ((8'ha5) > (8'had))} | (((8'hb4) ? (8'had) : (8'hb1)) ? ((8'h9c) && (8'h9f)) : (8'h9c))) : ((~|{(8'hae), (7'h40)}) ? (((8'ha1) ? (8'ha0) : (8'hb3)) ? ((8'haf) || (8'hbd)) : (-(7'h41))) : ((+(8'ha6)) ? (-(8'h9c)) : (~(8'hbb)))))), 
parameter param111 = ((({param110, param110} - ((-param110) ? (param110 ? param110 : (8'ha9)) : (~&param110))) && ((&(7'h42)) ~^ ((param110 ? param110 : param110) ? (~param110) : (param110 <<< param110)))) ? (^~param110) : (~|((param110 * (8'ha1)) ? (7'h41) : (8'hb2)))))
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire46;
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  assign y = {wire108,
                 wire106,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire46,
                 reg109,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg53,
                 reg54,
                 reg55,
                 (1'h0)};
  assign wire13 = (~&$unsigned(($signed((wire11 ~^ wire9)) ^~ ((wire10 ?
                          wire10 : (8'hab)) ?
                      $signed(wire11) : wire10[(4'hb):(4'hb)]))));
  assign wire14 = (~|$unsigned(($signed((wire12 && (8'hbb))) <<< ($unsigned(wire9) | wire13))));
  assign wire15 = ($signed({$signed($signed(wire10))}) ?
                      wire12[(3'h7):(1'h1)] : ($unsigned(wire14) >= ((^~$signed(wire14)) ?
                          $signed($signed(wire14)) : wire12[(4'hc):(3'h5)])));
  assign wire16 = {{{((~&wire12) ? $signed(wire12) : (wire14 == wire14)),
                              wire13[(5'h13):(3'h6)]},
                          $signed(((8'ha2) ?
                              wire14 : (wire10 ? wire11 : wire10)))}};
  assign wire17 = $unsigned($signed(((^~wire13[(4'h9):(2'h3)]) ?
                      wire10 : $unsigned(wire9[(3'h6):(3'h6)]))));
  assign wire18 = ((&{((wire10 & wire11) ^ (wire11 * wire17)),
                          ((wire11 >= wire10) != {wire14})}) ?
                      $unsigned((wire12[(4'hc):(3'h4)] - ((wire15 ?
                          (8'haa) : wire15) <= $signed(wire9)))) : ($unsigned((~$signed((8'ha9)))) && $signed(wire11[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg19 <= ({($signed({wire15}) || (^wire10))} ?
          (&wire10[(4'hb):(3'h6)]) : (((|{wire17}) ?
              $unsigned((wire14 ?
                  wire14 : (8'ha6))) : ($unsigned(wire11) >>> (~&wire10))) - ((((8'ha3) ?
                  (8'hb5) : wire9) ?
              $signed(wire16) : (wire16 || wire17)) >> (~wire18[(2'h3):(2'h2)]))));
      reg20 <= (wire14[(4'he):(4'ha)] & (~&wire9[(4'hd):(3'h7)]));
      if ({(~(wire14 ? wire13[(4'h9):(2'h2)] : $unsigned(((8'hab) >> wire17)))),
          ((-(~&wire15)) ?
              $signed(((reg20 >= (8'haa)) ?
                  {wire14,
                      wire11} : (~|wire15))) : ({(wire17 && (8'hab))} >> ((wire14 ?
                      wire17 : reg20) ?
                  (wire16 <<< wire9) : $unsigned(wire14))))})
        begin
          reg21 <= $unsigned(wire16[(3'h7):(2'h3)]);
          reg22 <= $unsigned($signed(((+wire13) - wire18)));
        end
      else
        begin
          reg21 <= {((~|reg21[(3'h6):(1'h0)]) ?
                  $signed(reg21[(4'h8):(3'h4)]) : $unsigned(reg21[(1'h1):(1'h1)])),
              (+wire18[(1'h1):(1'h0)])};
          reg22 <= wire16;
          if (reg22[(2'h3):(2'h2)])
            begin
              reg23 <= wire9;
              reg24 <= (8'hbe);
              reg25 <= $unsigned(($unsigned($unsigned(wire12[(5'h14):(4'hd)])) && $signed(wire17)));
              reg26 <= ((|reg25) ? wire18 : $signed(wire12));
              reg27 <= (&(&$unsigned($unsigned($unsigned(wire12)))));
            end
          else
            begin
              reg23 <= $unsigned((^~$unsigned($signed((reg24 ?
                  reg26 : wire16)))));
              reg24 <= (-(^~(^reg22[(3'h7):(3'h4)])));
              reg25 <= (-reg20);
            end
        end
    end
  module28 #() modinst47 (.wire32(reg19), .clk(clk), .wire30(reg20), .wire29(wire12), .wire31(reg25), .y(wire46));
  assign wire48 = $signed($unsigned(wire12[(3'h4):(2'h2)]));
  assign wire49 = reg24[(3'h6):(2'h2)];
  assign wire50 = reg20[(1'h1):(1'h1)];
  assign wire51 = {reg24[(4'hd):(3'h6)]};
  assign wire52 = $unsigned({{$signed($signed(reg26))},
                      $unsigned((reg19 ^ $unsigned(wire13)))});
  always
    @(posedge clk) begin
      reg53 <= {$unsigned($signed($unsigned(wire12[(5'h11):(4'ha)]))),
          {wire52[(3'h4):(3'h4)]}};
      reg54 <= wire52;
      reg55 <= {(+$unsigned($unsigned({reg27, (8'ha0)})))};
    end
  assign wire56 = $unsigned(({$unsigned(wire15), reg27} ?
                      $unsigned($signed(reg23[(1'h0):(1'h0)])) : wire17[(4'h9):(4'h8)]));
  assign wire57 = $unsigned(wire46);
  assign wire58 = (8'ha5);
  assign wire59 = $unsigned(reg20);
  assign wire60 = $unsigned(reg21);
  assign wire61 = ((wire12[(4'hc):(3'h7)] - $signed($signed((~^wire60)))) ?
                      ((wire48[(3'h7):(3'h7)] > (reg54[(4'h8):(3'h5)] << (!wire50))) ?
                          $signed(((~wire12) < wire51)) : reg23) : (($signed((8'h9c)) <= (!$unsigned(reg25))) + {(|$signed(reg24)),
                          $unsigned((^~wire58))}));
  module62 #() modinst107 (wire106, clk, reg21, wire57, wire49, wire13, wire11);
  assign wire108 = wire17[(4'he):(3'h5)];
  always
    @(posedge clk) begin
      reg109 <= wire17;
    end
endmodule

module module62
#(parameter param104 = ((({(!(8'h9c))} >>> ({(8'hb8)} ? (8'haa) : ((8'hb8) < (8'h9c)))) * (((~^(8'hbf)) ? ((8'ha1) == (8'hb3)) : ((8'haf) ^~ (8'hac))) ? (((8'ha6) ? (8'ha0) : (8'ha1)) ? ((8'ha2) || (8'haf)) : ((8'haf) >= (8'hb8))) : (((8'haf) & (8'h9c)) * ((7'h40) ~^ (8'haf))))) ? ({(((8'hb2) ? (8'hb1) : (7'h40)) ? {(8'had), (7'h43)} : ((8'ha2) * (8'hb4)))} ? ((~|(~&(7'h44))) - ({(8'hbe)} >> (-(8'hb6)))) : (&((+(8'h9d)) ? ((8'hba) ? (8'ha6) : (8'ha5)) : (+(8'hab))))) : ((-((+(8'hb8)) ^ ((8'h9c) ? (8'hb1) : (8'hba)))) > ((((8'hb0) ? (8'ha9) : (8'ha2)) ^~ {(8'had), (8'hbc)}) ~^ (^((7'h41) ? (8'hbf) : (8'hbd)))))), 
parameter param105 = {(({(param104 >>> param104)} ? (((8'h9d) | param104) ^~ param104) : (^((8'hb7) ? (8'h9c) : param104))) <<< (param104 == (param104 >>> (-param104))))})
(y, clk, wire67, wire66, wire65, wire64, wire63);
  output wire [(32'h1c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire67;
  input wire [(5'h15):(1'h0)] wire66;
  input wire signed [(5'h10):(1'h0)] wire65;
  input wire [(5'h13):(1'h0)] wire64;
  input wire signed [(4'ha):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire103;
  wire signed [(2'h3):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire90;
  wire [(5'h15):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire90,
                 wire89,
                 wire83,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg82,
                 reg81,
                 reg80,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg68 <= wire66[(5'h14):(5'h12)];
      reg69 <= reg68;
      reg70 <= $signed((wire65[(1'h0):(1'h0)] ~^ (wire65[(3'h4):(1'h0)] <= ($unsigned(wire65) * $signed(reg69)))));
    end
  assign wire71 = (wire65 <<< reg70[(4'h8):(3'h6)]);
  assign wire72 = (reg70[(3'h4):(1'h0)] ?
                      (wire63 ?
                          ({(wire63 ~^ wire64)} ?
                              wire71 : $unsigned(reg69)) : ($unsigned({wire71}) <= ((+wire67) ?
                              reg68[(1'h1):(1'h0)] : reg68))) : $unsigned(wire71));
  assign wire73 = $unsigned(wire64[(4'hc):(4'h8)]);
  assign wire74 = {$unsigned(($unsigned((wire63 > wire67)) ?
                          (~|(wire67 ?
                              reg68 : wire65)) : wire63[(2'h2):(2'h2)])),
                      reg68};
  assign wire75 = wire71;
  assign wire76 = ($unsigned((~$unsigned((+wire63)))) * (!{(&$signed(wire74))}));
  assign wire77 = (-$signed((((&reg70) - {wire66, reg70}) ?
                      (^$signed(wire64)) : $unsigned((wire66 ?
                          wire65 : (8'hb4))))));
  assign wire78 = reg69;
  assign wire79 = $unsigned(wire72);
  always
    @(posedge clk) begin
      reg80 <= ((^~(wire73 ^ {(reg69 ? (8'h9e) : reg69), reg68})) >= wire64);
      reg81 <= wire74[(3'h4):(3'h4)];
      reg82 <= $unsigned($signed((reg68[(2'h3):(2'h3)] ? wire78 : wire79)));
    end
  assign wire83 = $signed($unsigned(wire75[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      if ((reg70[(1'h0):(1'h0)] == reg69))
        begin
          reg84 <= reg80[(4'h8):(3'h4)];
          reg85 <= {wire72, wire76};
        end
      else
        begin
          if ((wire77[(1'h1):(1'h0)] ?
              (reg82[(2'h2):(2'h2)] ?
                  $signed(wire65) : $unsigned((~^(wire65 ?
                      (7'h43) : (8'hb9))))) : $signed((wire83 ?
                  (8'ha9) : ($signed((8'hae)) ?
                      (reg68 != wire65) : $signed(wire76))))))
            begin
              reg84 <= (~|({reg82[(1'h0):(1'h0)], $signed(((8'hbb) - wire63))} ?
                  $signed(({wire75,
                      wire66} <= wire66[(4'ha):(3'h5)])) : reg85[(1'h1):(1'h1)]));
              reg85 <= $unsigned((($signed((-reg82)) >> reg70) >>> wire65));
            end
          else
            begin
              reg84 <= $unsigned($unsigned($signed($signed(wire65))));
              reg85 <= wire78;
              reg86 <= ($signed($signed({wire79})) * (8'hb9));
            end
        end
      reg87 <= wire67[(4'h9):(2'h3)];
      reg88 <= ((-$signed(({reg69} > ((8'hb8) + (7'h40))))) ?
          reg85 : (~^wire78[(2'h2):(2'h2)]));
    end
  assign wire89 = {$unsigned(((!$unsigned((8'ha7))) || reg81)),
                      $signed(((!(wire76 ~^ wire63)) ?
                          $signed($unsigned(wire76)) : (wire71[(4'h9):(2'h2)] ^~ (wire72 + wire78))))};
  assign wire90 = {($signed(wire72[(1'h1):(1'h1)]) ?
                          ($signed($unsigned((7'h44))) ?
                              (^~$signed(reg70)) : reg80[(2'h2):(1'h1)]) : $signed(reg86)),
                      {{(-reg85),
                              {$unsigned((7'h43)), wire66[(4'he):(3'h6)]}}}};
  always
    @(posedge clk) begin
      if ((({$signed($signed(wire74))} ?
          wire77[(1'h1):(1'h1)] : (~|reg85[(1'h1):(1'h0)])) - ((((reg84 ?
              wire63 : wire71) < (|reg70)) ?
          {(wire76 || wire77),
              (wire73 <= wire74)} : reg81[(1'h1):(1'h0)]) >>> (~$unsigned(wire73[(3'h7):(3'h7)])))))
        begin
          reg91 <= $unsigned((wire72 || (~|(((8'ha8) ^~ reg80) * (wire75 ^~ reg88)))));
          reg92 <= (^~(~wire66));
          reg93 <= (!($signed(({(8'hb8),
              (8'haf)} != (reg80 == wire76))) <<< (reg70 ?
              ((reg69 ? wire67 : wire65) ?
                  $signed((8'hb0)) : (8'hb1)) : (&(reg80 & wire73)))));
        end
      else
        begin
          reg91 <= $signed($signed(($unsigned(reg91) * (~^(&wire64)))));
          if (($signed($signed((~^$unsigned(wire79)))) ^ ((reg91 > (+$signed(wire90))) ?
              ($signed($unsigned(reg92)) < {(|reg70)}) : {wire77[(3'h7):(3'h4)],
                  (~{reg81})})))
            begin
              reg92 <= (|(^~({$unsigned(reg69)} * ((!wire72) ?
                  (wire75 <<< (8'ha5)) : reg84))));
              reg93 <= {(8'had),
                  ($unsigned(wire90) ?
                      $signed(wire73[(4'hb):(1'h0)]) : (~^reg88[(4'hc):(3'h6)]))};
              reg94 <= $signed(($signed(((reg69 ~^ (8'hb7)) ?
                      {wire89, wire72} : $signed(wire76))) ?
                  wire90[(1'h0):(1'h0)] : (wire71 ?
                      $signed(wire83) : (8'hbf))));
              reg95 <= reg93[(1'h1):(1'h1)];
            end
          else
            begin
              reg92 <= $unsigned($signed(((reg84[(2'h3):(1'h0)] ?
                      $unsigned(reg81) : (^(8'ha5))) ?
                  (reg85 != ((7'h41) ?
                      wire64 : (8'h9f))) : (~&wire83[(3'h6):(3'h6)]))));
            end
        end
      if ($signed((8'ha0)))
        begin
          reg96 <= (~|reg87[(3'h4):(3'h4)]);
          reg97 <= ({($signed({reg84}) < $unsigned((wire83 ?
                  wire71 : (8'h9d)))),
              $signed((wire72[(1'h0):(1'h0)] <= (wire76 ?
                  (8'h9e) : reg84)))} ~^ wire63);
          reg98 <= (-$signed(reg80[(1'h0):(1'h0)]));
          reg99 <= reg70[(2'h3):(2'h2)];
          reg100 <= ($unsigned(((^~(reg95 ? wire65 : reg84)) ?
                  $signed(((8'h9d) ? (8'haa) : wire75)) : ((wire76 ?
                      reg68 : wire74) || (+reg69)))) ?
              ($signed(reg84[(4'hb):(4'h8)]) + $signed(((8'ha0) ?
                  reg93[(3'h4):(2'h2)] : (reg94 >= reg84)))) : reg97);
        end
      else
        begin
          reg96 <= {reg80[(4'hd):(1'h1)], reg91[(3'h6):(1'h1)]};
          reg97 <= (!$signed($unsigned((wire89[(4'he):(1'h1)] * $signed(reg97)))));
          reg98 <= (8'ha7);
          reg99 <= {(+$signed(((!(8'h9f)) ?
                  (reg95 ? wire64 : reg88) : (wire90 ? reg95 : wire89)))),
              reg91};
          reg100 <= (8'hb6);
        end
      reg101 <= $unsigned($unsigned(((!((8'hae) ? reg69 : reg86)) - ((reg99 ?
              reg96 : reg95) ?
          (wire66 ? reg81 : wire75) : (~wire74)))));
    end
  assign wire102 = reg85[(2'h2):(2'h2)];
  assign wire103 = {reg101,
                       $signed($signed({(reg82 | reg96),
                           reg85[(1'h0):(1'h0)]}))};
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire32;
  input wire signed [(4'hf):(1'h0)] wire31;
  input wire [(4'hc):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg43,
                 (1'h0)};
  assign wire33 = (wire29[(2'h2):(1'h1)] ?
                      {($signed((wire31 | wire30)) ?
                              (~$signed(wire30)) : wire29)} : wire30);
  assign wire34 = $signed((&$signed($signed((wire32 == wire33)))));
  assign wire35 = (|$unsigned(wire33[(3'h4):(1'h0)]));
  assign wire36 = (!((!$signed((wire32 || wire29))) - (-{wire32[(4'hb):(3'h7)],
                      (wire31 ? wire32 : (8'hbc))})));
  assign wire37 = wire34[(4'hc):(1'h1)];
  assign wire38 = (~|(8'hb3));
  assign wire39 = (wire33[(4'hc):(3'h7)] ?
                      $signed(((~^wire32[(3'h4):(3'h4)]) > (wire33 > wire34[(3'h5):(1'h1)]))) : {wire30[(1'h0):(1'h0)],
                          $unsigned($signed(wire37[(4'hb):(2'h2)]))});
  assign wire40 = $signed(wire36);
  assign wire41 = {wire37,
                      (($unsigned($signed(wire39)) ?
                              {wire40[(3'h5):(2'h2)],
                                  $unsigned(wire31)} : {(wire32 >>> wire32)}) ?
                          wire37[(2'h2):(1'h0)] : ((wire31 ?
                              {wire38} : (wire37 > wire38)) < (wire32[(3'h4):(1'h0)] ?
                              $signed((8'hbf)) : ((7'h44) && (8'hbe)))))};
  assign wire42 = $unsigned(wire29);
  always
    @(posedge clk) begin
      reg43 <= {$signed((wire36[(2'h3):(1'h0)] ^~ $unsigned(wire35))),
          (($signed((|wire40)) <<< $unsigned($unsigned((8'h9c)))) ?
              wire38 : (!wire37))};
    end
  assign wire44 = {(8'hab), ($signed((-wire38)) && (8'h9d))};
  assign wire45 = (($signed($unsigned($signed(wire37))) >= ($signed((wire35 ?
                          wire37 : wire38)) * ((wire31 | (8'hbe)) || (wire35 ~^ wire36)))) ?
                      (wire31[(4'hc):(2'h2)] ?
                          ((^(wire44 ?
                              wire29 : wire31)) && ((wire37 ^~ wire42) ?
                              {wire36,
                                  wire32} : {wire31})) : $signed(wire32[(4'hc):(2'h2)])) : $signed($unsigned(wire35[(1'h1):(1'h1)])));
endmodule
