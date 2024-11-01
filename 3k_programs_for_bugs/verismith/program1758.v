module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire130;
  wire [(5'h14):(1'h0)] wire129;
  wire signed [(4'hf):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire127;
  wire [(4'h8):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire121;
  wire signed [(2'h2):(1'h0)] wire120;
  wire [(3'h7):(1'h0)] wire119;
  wire [(5'h11):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire117;
  wire [(4'ha):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire114;
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire9,
                 wire114,
                 reg124,
                 reg123,
                 reg122,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (+wire0);
      reg6 <= {($unsigned((wire0 && (^~wire4))) == ($signed(wire2) ?
              $signed($signed(wire0)) : $unsigned((wire4 <<< wire1))))};
      reg7 <= wire0[(4'h9):(3'h4)];
      reg8 <= ($unsigned((reg7 ? wire2 : {(^~reg5), $signed(reg7)})) ?
          {$unsigned((wire2[(1'h0):(1'h0)] ^~ (reg6 + wire1))),
              $signed(wire4)} : wire2[(3'h5):(3'h4)]);
    end
  assign wire9 = $signed((&wire3[(3'h4):(1'h1)]));
  always
    @(posedge clk) begin
      reg10 <= reg7;
      if (reg7)
        begin
          reg11 <= wire1;
          reg12 <= wire9;
        end
      else
        begin
          reg11 <= (reg11 ?
              reg8[(4'hb):(1'h0)] : (&(((reg6 ^ wire3) ?
                      (wire2 ? wire9 : reg6) : $unsigned(reg6)) ?
                  $signed({(8'hb8)}) : $signed(wire0))));
          if (((~(((reg10 << (8'hb4)) ~^ (reg6 == wire0)) ?
                  ($unsigned(reg7) ?
                      (reg10 ? wire4 : wire0) : (reg6 <= reg12)) : (~|reg7))) ?
              (-(~(8'had))) : $signed((~^reg6))))
            begin
              reg12 <= $signed(reg12[(3'h5):(2'h2)]);
              reg13 <= wire2[(2'h3):(1'h1)];
            end
          else
            begin
              reg12 <= $unsigned((wire0 ?
                  {$signed(wire3[(1'h1):(1'h1)]),
                      {$signed(wire0)}} : wire3[(3'h5):(1'h1)]));
              reg13 <= {{(reg8[(4'hb):(4'ha)] ?
                          $unsigned(reg10[(4'h9):(4'h9)]) : wire9),
                      reg8[(3'h4):(1'h0)]},
                  $unsigned(reg12[(1'h0):(1'h0)])};
              reg14 <= ($unsigned((+($signed(reg8) ?
                  $unsigned((8'ha2)) : (wire4 ^~ reg7)))) <<< $signed((wire4 == wire2)));
            end
        end
      reg15 <= ((&$signed(reg11)) ?
          (~&$signed(reg14)) : ((8'hb6) ?
              {reg12} : (reg14[(1'h1):(1'h1)] ?
                  ((reg14 ? reg12 : reg10) ?
                      $signed(reg7) : (8'ha0)) : {(&(8'hba))})));
      reg16 <= $signed((reg15[(2'h3):(1'h1)] ?
          {wire9, (^(~^reg11))} : $signed(reg11[(3'h5):(3'h4)])));
    end
  module17 #() modinst115 (.wire18(reg13), .wire22(wire1), .y(wire114), .clk(clk), .wire21(reg15), .wire19(reg5), .wire20(reg14));
  assign wire116 = reg8[(3'h5):(1'h1)];
  assign wire117 = wire114;
  assign wire118 = $unsigned((!$unsigned({(wire2 ? reg7 : (7'h42))})));
  assign wire119 = (^reg15);
  assign wire120 = (-$unsigned((wire1 ? $unsigned(wire2) : wire118)));
  assign wire121 = $unsigned($unsigned($unsigned({$unsigned(reg8)})));
  always
    @(posedge clk) begin
      reg122 <= {($signed(reg8) >= ((~^$signed((7'h40))) < $unsigned(wire120)))};
      reg123 <= (-(+$signed(((^~reg6) >= (reg7 ? reg5 : reg16)))));
      reg124 <= $unsigned(wire114[(3'h4):(1'h1)]);
    end
  assign wire125 = $unsigned(reg15[(3'h7):(3'h6)]);
  assign wire126 = reg14;
  assign wire127 = ((($unsigned((reg123 ?
                       wire114 : reg5)) ^~ wire118) > (wire0 ?
                       ({(8'hae)} ?
                           (wire4 ?
                               reg123 : reg8) : wire3[(3'h5):(3'h5)]) : wire4[(3'h4):(2'h2)])) || wire125);
  assign wire128 = (wire125[(4'hf):(2'h2)] ?
                       ((((wire127 ? wire121 : reg10) ?
                           $signed(reg12) : (~reg8)) == reg16) < (~(~^(+wire120)))) : $signed((+$unsigned((~reg6)))));
  assign wire129 = (~&$signed($signed(($signed(reg10) ?
                       $signed(wire3) : $signed(reg16)))));
  assign wire130 = ({$unsigned($signed($signed(wire9)))} * ((((wire129 || reg16) ?
                           reg10 : wire126) && (+{wire3, reg7})) ?
                       (wire118[(4'hb):(3'h6)] ^ $unsigned(((8'haa) ?
                           wire129 : reg5))) : {wire3[(2'h2):(2'h2)],
                           (8'hb2)}));
endmodule

module module17  (y, clk, wire18, wire19, wire20, wire21, wire22);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire [(4'hb):(1'h0)] wire21;
  input wire [(4'hd):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(4'hb):(1'h0)] wire112;
  wire [(4'h9):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire98;
  wire [(3'h7):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire95;
  wire signed [(5'h12):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire44;
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire102,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire93,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire44,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire23 = ((~wire20[(1'h0):(1'h0)]) ~^ ((+wire18[(4'hc):(4'h8)]) ?
                      (($unsigned(wire19) ?
                              $unsigned(wire21) : $unsigned((8'hba))) ?
                          (!(wire22 ? wire22 : wire18)) : $signed((wire20 ?
                              wire19 : wire22))) : wire22));
  assign wire24 = (~|($signed($unsigned($unsigned(wire20))) <= ({(+wire18),
                          $unsigned(wire23)} ?
                      $signed($unsigned(wire18)) : wire18)));
  assign wire25 = (|$signed((((wire23 + wire19) ^~ (wire19 ~^ wire21)) ?
                      wire21 : (8'hb0))));
  assign wire26 = (wire20 ?
                      (wire21[(2'h3):(1'h1)] + (~&(~|{(8'hb7),
                          wire21}))) : (~^$signed(wire18[(4'hc):(4'ha)])));
  assign wire27 = wire21[(4'h8):(2'h2)];
  assign wire28 = (^~$signed($signed((~wire18[(3'h4):(1'h1)]))));
  assign wire29 = ({$unsigned((&wire28))} ?
                      ($unsigned(wire25) ?
                          ((^~wire25) ?
                              wire19[(1'h0):(1'h0)] : (8'ha8)) : wire21[(1'h1):(1'h0)]) : wire25[(1'h0):(1'h0)]);
  module30 #() modinst45 (wire44, clk, wire27, wire21, wire18, wire20, wire19);
  module46 #() modinst94 (wire93, clk, wire25, wire24, wire28, wire19);
  assign wire95 = ((~^$unsigned(wire22)) - $signed(wire25[(4'hf):(4'h9)]));
  assign wire96 = (~|wire21);
  assign wire97 = ((($signed(wire23[(3'h4):(1'h0)]) | ((~wire93) ?
                          (8'ha4) : $unsigned(wire20))) < (({(8'hb9)} ~^ wire44[(2'h2):(1'h0)]) ^~ ((wire44 ?
                              wire18 : wire96) ?
                          {wire20} : (~&wire19)))) ?
                      $unsigned((~|wire95[(1'h1):(1'h1)])) : $signed(wire27[(1'h0):(1'h0)]));
  assign wire98 = (!$unsigned((^~wire28[(3'h7):(3'h7)])));
  always
    @(posedge clk) begin
      reg99 <= wire23;
      reg100 <= ((~|(^~$unsigned(wire97[(3'h4):(1'h0)]))) >> ($unsigned(wire27) ?
          ({$signed(wire28), {wire19}} ?
              $unsigned(wire19) : {{wire23}, $unsigned(wire95)}) : wire93));
      reg101 <= wire26[(5'h10):(4'h8)];
    end
  assign wire102 = $signed($signed(($unsigned($unsigned((8'hbf))) ~^ {(^~wire24)})));
  always
    @(posedge clk) begin
      if ({$signed((wire19 ?
              ((wire102 ?
                  reg100 : wire18) - $unsigned(wire95)) : $unsigned((wire28 ?
                  wire26 : (8'hb8))))),
          {((^(wire96 ? reg99 : wire18)) == wire22[(3'h7):(3'h4)])}})
        begin
          reg103 <= wire44;
          reg104 <= (!wire21[(3'h6):(3'h6)]);
        end
      else
        begin
          reg103 <= $unsigned($unsigned({$unsigned((wire18 ?
                  reg99 : reg100))}));
        end
      reg105 <= (8'ha5);
      if (($unsigned((~&$unsigned(wire21))) <= (+wire23)))
        begin
          reg106 <= (({$signed(reg104[(2'h3):(2'h3)]),
                  $signed(wire95[(1'h1):(1'h0)])} ?
              wire18[(5'h11):(4'hf)] : reg105) >= $signed(wire44[(1'h1):(1'h1)]));
          reg107 <= $signed(((^~wire19[(2'h3):(2'h3)]) ?
              (~&((8'hb0) & $unsigned(wire26))) : wire23[(2'h3):(1'h0)]));
        end
      else
        begin
          reg106 <= ((reg107 ?
              $signed($signed(reg103[(2'h2):(1'h1)])) : wire22) - (|wire28));
          reg107 <= ((!reg99[(3'h4):(2'h2)]) ?
              {($unsigned(reg104) ?
                      ((!wire18) + wire29) : {{(8'hb3)}, reg99[(3'h7):(3'h4)]}),
                  wire25[(4'h9):(4'h9)]} : $unsigned(wire28[(2'h3):(1'h1)]));
          reg108 <= reg104[(3'h6):(1'h0)];
          reg109 <= reg100[(2'h3):(2'h2)];
          reg110 <= ($signed((~^$signed($signed(wire27)))) ?
              $unsigned(reg109) : wire21[(3'h5):(3'h5)]);
        end
      reg111 <= $unsigned($unsigned((^~(~|reg107))));
    end
  assign wire112 = wire93[(4'he):(2'h2)];
  assign wire113 = wire25;
endmodule

module module46
#(parameter param91 = (((((^(8'ha6)) ~^ ((7'h42) ? (7'h42) : (8'hb1))) ^ ((!(8'h9d)) ? {(7'h44), (8'ha2)} : ((8'h9f) ? (8'ha7) : (8'ha8)))) != (((~&(8'hb6)) ? ((8'ha8) ? (8'ha3) : (8'hab)) : {(7'h41)}) == (^~((8'ha6) ? (8'hb5) : (8'ha3))))) && (((((8'ha7) ? (8'hb8) : (8'hbe)) >> ((8'hb5) == (8'hb9))) ? {{(8'h9d)}} : (+((8'hb8) ? (7'h44) : (8'ha5)))) && (~^((|(8'hb3)) | {(8'hbe), (8'hb3)})))), 
parameter param92 = {{(((^param91) ? param91 : (param91 || param91)) ? (param91 ? (|param91) : (-param91)) : param91), (({param91, param91} ? param91 : (!param91)) ? (^{param91}) : param91)}})
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire50;
  input wire signed [(4'hb):(1'h0)] wire49;
  input wire signed [(4'h8):(1'h0)] wire48;
  input wire [(5'h10):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(4'hb):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire51;
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire64,
                 wire63,
                 wire62,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 reg87,
                 reg85,
                 reg84,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg52,
                 (1'h0)};
  assign wire51 = $unsigned((wire47 | (|$signed($signed(wire48)))));
  always
    @(posedge clk) begin
      reg52 <= ({((~(wire51 <<< wire48)) >> wire47)} ?
          $signed($unsigned(((~^wire47) * $unsigned(wire51)))) : $signed((^~$signed($unsigned(wire48)))));
    end
  assign wire53 = wire48;
  assign wire54 = $unsigned($signed($unsigned($unsigned((~|wire48)))));
  assign wire55 = $signed(wire50);
  assign wire56 = (wire54[(3'h4):(2'h3)] <= (({((8'hb1) ? reg52 : wire53),
                          $signed((8'ha4))} <<< $signed(wire51[(3'h4):(2'h2)])) ?
                      $signed($unsigned((wire48 <<< wire51))) : wire53));
  assign wire57 = wire56;
  always
    @(posedge clk) begin
      reg58 <= ($unsigned(wire57) ?
          ((|$signed(wire49[(2'h2):(1'h0)])) | reg52) : ($unsigned(reg52[(5'h10):(4'hb)]) >> (8'hab)));
      reg59 <= $signed($unsigned(((-wire54) + wire50)));
      reg60 <= ($signed($unsigned(wire54[(3'h4):(3'h4)])) == ($signed($unsigned($unsigned((8'h9e)))) ?
          $signed(($unsigned((8'hb8)) ?
              {reg58} : $unsigned(wire53))) : $signed(((wire55 - wire50) << (wire50 ?
              wire50 : (8'h9e))))));
      reg61 <= wire56;
    end
  assign wire62 = wire47[(4'h8):(2'h3)];
  assign wire63 = wire54;
  assign wire64 = wire56;
  always
    @(posedge clk) begin
      reg65 <= (&wire62[(4'ha):(2'h2)]);
      if ($signed((&(|$signed(wire54[(1'h1):(1'h0)])))))
        begin
          reg66 <= {wire47[(4'hb):(2'h2)],
              ((+((reg58 ~^ wire48) ?
                  wire56 : (-wire47))) ^ $signed((reg58[(2'h2):(1'h0)] > (~|wire51))))};
          if (reg61[(4'hf):(2'h2)])
            begin
              reg67 <= $signed(((7'h44) & (((~|wire56) <= (wire63 ?
                      wire57 : reg60)) ?
                  wire56[(1'h1):(1'h0)] : (wire48[(2'h2):(2'h2)] > ((8'hb2) <<< wire64)))));
            end
          else
            begin
              reg67 <= (^reg59);
              reg68 <= (((~|(^~(wire63 ? (8'ha1) : reg67))) ~^ wire63) ?
                  wire62[(2'h3):(1'h1)] : (~^$unsigned(((wire57 == reg66) < (reg58 ?
                      wire56 : wire50)))));
              reg69 <= (reg68[(2'h2):(2'h2)] << $signed($signed((!((8'hbe) ?
                  (8'ha7) : wire49)))));
              reg70 <= $signed((~^{wire53[(1'h1):(1'h1)]}));
            end
          reg71 <= (wire47 ?
              wire54 : ($unsigned($signed(wire54)) ?
                  {(wire47 ? $unsigned((8'haa)) : ((8'ha2) >> reg66)),
                      $signed((wire48 ? wire64 : reg66))} : wire63));
          if ((~&wire54[(2'h2):(1'h1)]))
            begin
              reg72 <= ((($signed(reg58) ?
                      ($unsigned(wire54) ?
                          (~&wire50) : $signed(reg66)) : reg60[(1'h0):(1'h0)]) ?
                  reg61 : $signed({(reg66 << reg68),
                      (+(8'h9e))})) ~^ reg58[(3'h5):(3'h5)]);
              reg73 <= $unsigned(wire64);
              reg74 <= (-(reg66[(2'h2):(2'h2)] >= {{$signed(reg60)}}));
              reg75 <= wire47[(4'h8):(3'h6)];
            end
          else
            begin
              reg72 <= {$signed(((wire57 ?
                      (reg65 ? wire62 : wire49) : $signed(wire54)) < ((wire50 ?
                          reg75 : reg74) ?
                      (wire62 ^ wire53) : reg58)))};
              reg73 <= (~((reg67 ?
                      ($unsigned(wire55) * reg66[(2'h2):(2'h2)]) : reg71) ?
                  reg72[(1'h0):(1'h0)] : (&reg66[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          reg66 <= $signed((~^$signed($signed(reg68))));
          reg67 <= (reg67[(3'h4):(1'h1)] ?
              (reg59[(3'h7):(3'h4)] ?
                  reg58 : $signed(($unsigned(wire53) ?
                      $signed(reg58) : $signed(wire54)))) : wire55);
          reg68 <= ((({$signed(reg68),
              (^~reg68)} && $unsigned($signed(wire56))) || $unsigned((wire63 ?
              ((8'hbf) && (8'ha5)) : reg52))) ^ ((|$unsigned(wire56[(2'h3):(2'h3)])) ?
              ($signed(wire48) >= (wire62[(3'h7):(3'h4)] || (reg66 ?
                  wire56 : (8'ha3)))) : $unsigned($signed($unsigned(reg74)))));
          reg69 <= (-(^~((8'h9d) >> $unsigned(wire47[(4'hd):(3'h4)]))));
          reg70 <= $signed(({((|reg65) ? (!(8'hbc)) : $signed(wire53)),
              ((wire53 ?
                  wire63 : reg66) << (reg58 >>> reg72))} == reg72[(1'h0):(1'h0)]));
        end
      reg76 <= (wire57 >>> ((reg67[(4'h9):(1'h0)] && $signed($signed(reg68))) || reg67));
      reg77 <= reg71[(2'h2):(1'h1)];
      reg78 <= reg68[(4'ha):(1'h1)];
    end
  assign wire79 = (wire53[(1'h0):(1'h0)] ?
                      $unsigned((reg58[(4'h8):(3'h6)] || (reg77[(4'he):(4'ha)] >> {reg72}))) : ($signed(((reg68 < wire53) ?
                          wire55 : ((8'hb5) ^ wire50))) + ($signed((wire47 ?
                              reg52 : wire55)) ?
                          $unsigned($signed(reg72)) : (!((8'haf) | reg60)))));
  assign wire80 = (^{$signed($unsigned($unsigned(wire62))),
                      (reg74[(4'he):(3'h5)] ?
                          (^~reg68) : (&wire79[(3'h6):(2'h3)]))});
  assign wire81 = $unsigned((^~$unsigned(({reg69,
                      wire56} < $signed((8'ha7))))));
  assign wire82 = {((8'ha5) <= ((wire55 | wire50) && (((8'hb1) ?
                              reg61 : wire56) ?
                          (reg58 ? wire81 : wire51) : $signed(wire64))))};
  assign wire83 = $unsigned((wire51[(3'h6):(1'h1)] ?
                      $unsigned(reg66[(2'h2):(1'h0)]) : $signed((+(wire51 ^~ wire49)))));
  always
    @(posedge clk) begin
      reg84 <= $unsigned($signed($unsigned($signed($signed(wire51)))));
      reg85 <= (-$signed((reg69 ?
          (wire48 ? (~^(7'h43)) : wire53) : $signed((wire55 ?
              wire55 : reg73)))));
    end
  assign wire86 = (($unsigned($unsigned($unsigned(reg85))) >> wire80[(1'h1):(1'h0)]) ?
                      (reg61 ~^ $signed(((wire62 || reg59) == reg75))) : reg66);
  always
    @(posedge clk) begin
      reg87 <= $unsigned((($signed({reg71, (8'h9d)}) ?
          {(wire79 ^ wire48)} : ((^(7'h40)) | reg58)) | $unsigned($unsigned((reg74 >> (8'hb8))))));
    end
  assign wire88 = (~|(wire55 ?
                      (($unsigned(wire83) ?
                          ((8'hb4) ?
                              wire55 : (8'hba)) : reg60) ~^ $signed($unsigned(wire55))) : (~^(+(wire81 ?
                          wire47 : wire63)))));
  assign wire89 = $unsigned(wire48[(3'h7):(2'h2)]);
  assign wire90 = wire56[(2'h2):(1'h0)];
endmodule

module module30
#(parameter param42 = (((8'ha3) & (8'hb4)) ? (8'ha3) : {(~&({(8'hb9)} ? (^~(8'ha3)) : (~&(8'hac))))}), 
parameter param43 = (+(8'ha0)))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire35;
  input wire signed [(4'hb):(1'h0)] wire34;
  input wire signed [(3'h7):(1'h0)] wire33;
  input wire [(5'h10):(1'h0)] wire32;
  input wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  assign y = {wire41, wire40, wire39, wire38, wire37, wire36, (1'h0)};
  assign wire36 = $signed($unsigned($unsigned((|(wire35 ? wire33 : (8'ha8))))));
  assign wire37 = (((~|(wire31 ?
                      wire33 : (^wire35))) > wire34[(3'h7):(3'h4)]) != ((~(8'h9c)) | (~|(^(wire33 <<< wire34)))));
  assign wire38 = $signed($signed({$signed(((8'ha1) * (8'ha4))), wire34}));
  assign wire39 = {$unsigned(($unsigned(wire36[(3'h4):(1'h1)]) ?
                          ($unsigned(wire38) & ((8'hbe) ?
                              (8'h9f) : wire35)) : (wire36 ?
                              (^~wire37) : {wire31}))),
                      ((&(~&(wire38 ? wire38 : wire34))) ?
                          wire35[(3'h4):(1'h0)] : ((!$unsigned(wire38)) ?
                              {wire33} : wire31[(3'h7):(3'h4)]))};
  assign wire40 = {{wire36, (-$unsigned(wire39[(4'ha):(1'h1)]))},
                      $unsigned({(wire32 ? (~(8'hbd)) : (wire31 >= wire38)),
                          ((wire37 ? wire37 : wire35) - (wire35 && (8'hb4)))})};
  assign wire41 = wire37[(2'h3):(1'h0)];
endmodule
