module top
#(parameter param104 = (^((|(&{(8'hb8), (8'hb6)})) < {(~(8'ha6)), ((~^(8'h9d)) ? ((8'hb6) ? (7'h41) : (8'ha8)) : ((8'hb8) <<< (8'haf)))})), 
parameter param105 = ((param104 <= param104) + {(~({param104, param104} ? ((8'hbc) ? param104 : param104) : (-param104)))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire100;
  wire signed [(4'hb):(1'h0)] wire99;
  wire signed [(4'ha):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire96;
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire12,
                 wire13,
                 wire96,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire4)
        begin
          reg5 <= $unsigned(wire2);
          reg6 <= wire1;
          reg7 <= reg6;
          reg8 <= $unsigned(wire4[(4'hc):(4'h8)]);
        end
      else
        begin
          reg5 <= $signed(reg8[(3'h4):(2'h3)]);
          reg6 <= $signed(reg7);
          if ($signed((&wire0)))
            begin
              reg7 <= {$unsigned((wire3[(3'h4):(1'h1)] << reg8[(3'h6):(2'h3)]))};
            end
          else
            begin
              reg7 <= $signed($signed(($signed((reg6 ? reg8 : reg5)) ?
                  wire3 : (&(wire0 && reg7)))));
              reg8 <= reg5;
              reg9 <= wire1[(2'h3):(1'h0)];
            end
        end
      reg10 <= reg9;
      reg11 <= $signed(reg9);
    end
  assign wire12 = $signed(reg7);
  assign wire13 = $signed((8'hb1));
  module14 #() modinst97 (.y(wire96), .wire15(wire0), .wire16(wire3), .wire18(wire1), .clk(clk), .wire17(reg9));
  assign wire98 = wire2[(1'h0):(1'h0)];
  assign wire99 = (~^(~$unsigned(((~&reg8) ? $signed(wire3) : wire12))));
  assign wire100 = wire0;
  assign wire101 = (((~$signed(wire0)) ?
                       reg9 : (+reg6[(4'hd):(2'h3)])) < wire99);
  assign wire102 = $unsigned({wire1[(2'h3):(1'h0)]});
  assign wire103 = ($signed(wire100) << wire100[(3'h4):(1'h1)]);
endmodule

module module14
#(parameter param94 = (((8'ha1) ? ((((8'haa) < (8'haf)) ? ((8'hb6) && (8'hb7)) : ((8'hb3) ? (7'h40) : (8'hbe))) + (+((8'haa) > (8'ha7)))) : (((~^(7'h40)) >>> ((8'hae) ? (8'hb9) : (8'ha2))) ~^ (((8'ha8) + (7'h44)) <<< (^~(8'hba))))) >>> (((|((8'hb4) <= (8'ha0))) ? ((8'hbf) ~^ ((8'h9f) | (8'hbe))) : (^~{(8'hb8)})) ? {(((7'h40) < (8'haa)) ? (|(8'hab)) : (~&(8'hae))), (((8'hbb) ? (7'h44) : (8'hbf)) ? (~|(8'hac)) : ((8'hb8) >>> (8'hbb)))} : ((&{(8'ha6), (8'hbe)}) <<< (((8'h9c) ? (7'h42) : (8'ha0)) ? ((8'hba) > (8'hb8)) : {(7'h41), (8'ha8)})))), 
parameter param95 = ((((param94 ? {param94} : (param94 ? param94 : param94)) ? ((param94 ? param94 : (8'hbb)) <<< (^~param94)) : (+(~&(8'ha8)))) ? param94 : (((param94 ? param94 : param94) || param94) <<< {((8'hbc) ? (8'h9d) : param94), (|param94)})) <<< ({(param94 ? (param94 <= param94) : (param94 >= param94))} * (~(param94 <<< (param94 - param94))))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire [(2'h3):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire90;
  wire [(3'h4):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire43;
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire46,
                 wire45,
                 wire43,
                 (1'h0)};
  module19 #() modinst44 (.wire21(wire17), .y(wire43), .wire22(wire18), .wire24(wire16), .wire23(wire15), .wire20((8'ha3)), .clk(clk));
  assign wire45 = (~|$signed($signed($signed(wire17[(2'h3):(1'h0)]))));
  assign wire46 = {(8'ha3), wire18[(3'h7):(1'h0)]};
  module47 #() modinst89 (wire88, clk, wire15, wire45, wire43, wire16);
  assign wire90 = $signed(wire17);
  assign wire91 = ((+(((wire45 << wire46) - wire90[(3'h7):(2'h2)]) <<< wire88)) ?
                      $unsigned(wire16[(4'ha):(3'h6)]) : $unsigned(((wire17 >>> wire90) ?
                          $unsigned(wire45) : $signed($signed(wire45)))));
  assign wire92 = wire45;
  assign wire93 = wire91[(1'h0):(1'h0)];
endmodule

module module47
#(parameter param87 = (+((&(~|{(8'ha3), (8'hbd)})) ^ (8'hb2))))
(y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'h198):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire51;
  input wire [(3'h5):(1'h0)] wire50;
  input wire [(4'hf):(1'h0)] wire49;
  input wire [(5'h11):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire62;
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire62,
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
                 reg64,
                 reg63,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire51[(1'h1):(1'h0)] > $unsigned(($unsigned((|wire50)) ?
          (wire50 ?
              (8'haa) : ((8'hbd) ? (8'hb4) : wire49)) : $unsigned(wire48)))))
        begin
          reg52 <= {((8'h9c) << wire48)};
          reg53 <= (wire49[(2'h3):(2'h2)] < wire48[(2'h2):(1'h0)]);
        end
      else
        begin
          reg52 <= wire49;
          reg53 <= (wire48 != wire51);
          reg54 <= {wire49[(3'h6):(3'h6)], reg53};
        end
      reg55 <= $unsigned($unsigned((^~reg53)));
      if ((8'ha8))
        begin
          reg56 <= {reg52[(4'hf):(4'hb)],
              $signed({({reg52, reg52} ~^ (+wire51))})};
        end
      else
        begin
          reg56 <= wire51;
          if ((8'ha7))
            begin
              reg57 <= reg53;
              reg58 <= ($signed((~^{(wire49 ? wire51 : reg57)})) ?
                  (-($signed($signed(reg53)) >> $signed($unsigned((8'ha0))))) : $unsigned($signed((reg55[(4'ha):(2'h2)] * $signed(reg57)))));
              reg59 <= (reg55[(3'h5):(2'h2)] ?
                  (((wire49 & $unsigned(wire50)) ?
                      {{reg58},
                          reg52[(1'h1):(1'h0)]} : $signed({wire51})) && reg56[(1'h0):(1'h0)]) : $unsigned($unsigned(($unsigned((8'hb3)) >> (reg54 ?
                      reg57 : wire50)))));
              reg60 <= $unsigned($signed(({((8'ha9) ? reg53 : wire51)} ?
                  reg52[(4'ha):(1'h1)] : $signed(((8'hb4) != wire51)))));
            end
          else
            begin
              reg57 <= $signed((+(~|((~&reg60) ?
                  $signed((8'ha5)) : reg52[(3'h6):(3'h5)]))));
            end
          reg61 <= (reg55[(3'h7):(1'h1)] ~^ reg58[(4'ha):(4'h8)]);
        end
    end
  assign wire62 = $signed($signed($signed(($unsigned(reg56) ?
                      (reg59 * reg55) : (~^reg55)))));
  always
    @(posedge clk) begin
      if (wire62[(3'h6):(1'h1)])
        begin
          if ((~|((((reg59 ? wire62 : wire51) & $signed((8'ha0))) ?
                  (~|(reg59 ?
                      reg58 : reg56)) : ((reg53 <= reg59) > (reg53 & reg56))) ?
              ($signed((-(8'hb5))) + reg54[(2'h2):(1'h1)]) : (!reg53))))
            begin
              reg63 <= (&(reg58[(3'h5):(1'h0)] < ($unsigned(reg54) ?
                  $signed(wire48) : $signed($unsigned(reg58)))));
              reg64 <= $unsigned(reg58);
              reg65 <= ((reg60[(3'h5):(2'h2)] ?
                  $unsigned(wire51[(1'h0):(1'h0)]) : {(((8'hae) - reg55) ?
                          (reg64 ^~ wire50) : (&wire51))}) >= (reg52 >= ($unsigned($signed(reg52)) ?
                  {$signed(reg64), reg61} : $unsigned(reg64[(1'h1):(1'h1)]))));
              reg66 <= ((reg53 + {$unsigned(reg61[(4'h9):(1'h0)]),
                      (wire48 ~^ $unsigned((8'ha7)))}) ?
                  ((^~reg60) * reg63[(1'h1):(1'h0)]) : reg61);
            end
          else
            begin
              reg63 <= reg66;
            end
          reg67 <= reg60;
          reg68 <= reg66;
          if (reg66[(4'h8):(4'h8)])
            begin
              reg69 <= reg56;
              reg70 <= {$signed((-($signed((8'hbd)) <= (wire49 << reg66)))),
                  ({(8'hb4), $signed(wire50)} ?
                      $unsigned(($unsigned(reg53) ?
                          $unsigned((8'hb5)) : (reg69 ^ reg61))) : $unsigned(($unsigned(reg64) ?
                          reg69 : $signed((8'hbd)))))};
              reg71 <= wire48[(3'h4):(1'h0)];
              reg72 <= (reg54[(2'h2):(2'h2)] >>> (+reg70));
              reg73 <= (wire50[(2'h3):(1'h1)] ?
                  {(-reg66[(5'h12):(4'hb)]),
                      (~($unsigned(wire62) * (wire51 ^ reg61)))} : wire50[(1'h0):(1'h0)]);
            end
          else
            begin
              reg69 <= wire62;
            end
        end
      else
        begin
          if ((reg54 ?
              ($signed(reg54) <= (&reg66[(3'h7):(2'h2)])) : ((reg55[(2'h3):(1'h0)] >= reg57[(1'h1):(1'h1)]) ?
                  ($unsigned($signed(reg65)) * reg55) : $unsigned($signed((reg64 && reg58))))))
            begin
              reg63 <= (-$signed($unsigned(((reg72 ? wire48 : wire50) ?
                  $signed((8'hbb)) : wire48[(4'he):(3'h4)]))));
              reg64 <= $signed((!$signed((~$signed(reg70)))));
              reg65 <= $unsigned(wire48);
              reg66 <= $signed(reg68);
              reg67 <= reg54[(4'h8):(3'h7)];
            end
          else
            begin
              reg63 <= reg54[(3'h7):(3'h4)];
              reg64 <= (!reg54);
              reg65 <= reg65;
              reg66 <= (^(^reg70));
              reg67 <= reg57;
            end
          reg68 <= ((wire49 ~^ ((8'h9d) <<< $unsigned($signed((8'ha1))))) ?
              ((reg58[(4'h8):(3'h7)] | {$unsigned(reg71),
                  (+wire51)}) ^ (wire48[(4'h8):(3'h7)] ?
                  ($signed(reg69) ? (reg73 ~^ reg58) : reg55) : (~^(reg64 ?
                      reg59 : wire50)))) : (~|$signed($signed((~|reg67)))));
          reg69 <= reg73[(1'h1):(1'h0)];
          reg70 <= wire51[(1'h0):(1'h0)];
          if ((^~reg69[(3'h5):(1'h0)]))
            begin
              reg71 <= reg52[(5'h11):(5'h11)];
              reg72 <= (+reg73[(1'h0):(1'h0)]);
              reg73 <= reg67;
              reg74 <= $signed((&reg64[(4'hf):(3'h6)]));
            end
          else
            begin
              reg71 <= $unsigned((|({(|reg70),
                  wire62[(3'h7):(1'h0)]} ^~ {$signed(reg56),
                  $unsigned((8'ha1))})));
              reg72 <= $signed(($unsigned(reg54[(4'hf):(3'h4)]) & reg59[(3'h6):(1'h1)]));
              reg73 <= $signed((7'h43));
              reg74 <= reg70[(4'hc):(3'h5)];
            end
        end
      reg75 <= reg66;
      reg76 <= $unsigned($signed($unsigned($signed($unsigned(reg53)))));
      reg77 <= ((8'haf) ? ((-{(reg54 == reg72)}) ? wire62 : reg54) : reg67);
      reg78 <= (8'hab);
    end
  assign wire79 = (7'h43);
  assign wire80 = $unsigned((reg67[(3'h7):(1'h0)] ?
                      {reg61[(2'h3):(2'h2)], $signed($signed(reg56))} : reg73));
  assign wire81 = ($unsigned(reg63[(1'h0):(1'h0)]) ?
                      (reg69 ?
                          (+($unsigned(reg59) ?
                              (&wire79) : (-reg57))) : $signed(reg52[(4'hb):(3'h4)])) : ($signed(reg60[(3'h7):(3'h6)]) ?
                          (((reg59 > reg55) ?
                                  wire62[(4'hb):(3'h7)] : (reg75 ?
                                      reg55 : wire51)) ?
                              $signed((reg57 ?
                                  wire48 : wire49)) : {(^(8'hb5))}) : $signed(reg78)));
  assign wire82 = $signed(reg63[(2'h3):(2'h2)]);
  assign wire83 = (&($signed(reg76) ?
                      reg53[(3'h5):(3'h5)] : ($unsigned((8'hb9)) ?
                          (wire49[(3'h7):(3'h6)] ?
                              (-reg56) : (wire50 ?
                                  reg75 : (8'ha1))) : (+reg65[(2'h2):(1'h0)]))));
  assign wire84 = reg67[(4'he):(2'h3)];
  assign wire85 = $signed(reg77);
  assign wire86 = $unsigned((^~(8'h9f)));
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire24;
  input wire signed [(2'h2):(1'h0)] wire23;
  input wire [(4'he):(1'h0)] wire22;
  input wire signed [(4'hd):(1'h0)] wire21;
  input wire [(4'hc):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  assign y = {wire28,
                 wire27,
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
                 reg26,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg25 <= ({(|{(wire22 <<< wire20), wire22[(2'h2):(1'h0)]}),
          wire24} >> (($unsigned(wire23) ?
          wire20[(1'h1):(1'h0)] : ((wire22 < wire24) ^~ wire22[(4'hb):(4'h8)])) >> {({wire20} ?
              $signed(wire22) : $unsigned(wire24)),
          (~^(8'haa))}));
      reg26 <= (wire21[(1'h1):(1'h1)] + {$signed(((wire22 >= wire23) ?
              (wire24 >> wire21) : (^wire24))),
          wire21[(1'h0):(1'h0)]});
    end
  assign wire27 = (|(8'hbf));
  assign wire28 = $signed(wire27);
  always
    @(posedge clk) begin
      if (($unsigned($signed($unsigned({reg26, wire27}))) ?
          $unsigned(({((8'ha0) ? (8'hbe) : wire27),
              $unsigned(wire21)} >> (7'h41))) : wire21))
        begin
          reg29 <= wire23;
          reg30 <= (((wire28[(5'h14):(1'h0)] ?
              ((wire24 < reg29) >> {(8'ha8),
                  wire27}) : (~$unsigned(reg29))) > $signed((wire22 ~^ (reg25 ?
              wire23 : (8'hbb))))) > wire24[(4'hc):(4'hc)]);
          reg31 <= (wire20[(3'h5):(1'h0)] << $unsigned(wire22[(1'h1):(1'h1)]));
          reg32 <= reg29[(3'h7):(2'h2)];
          reg33 <= reg26[(4'hb):(2'h3)];
        end
      else
        begin
          reg29 <= (wire28 ?
              (reg25 ?
                  wire20 : (((+reg29) > reg32[(2'h3):(2'h2)]) ?
                      wire24 : (reg33[(3'h4):(2'h2)] - wire24[(3'h6):(1'h1)]))) : {(reg25[(2'h2):(1'h1)] - {$signed(wire27),
                      wire27})});
        end
      reg34 <= reg29[(3'h7):(2'h3)];
      if (wire24[(3'h6):(3'h5)])
        begin
          reg35 <= (reg25 ?
              $signed($signed(reg26)) : $signed({(-$signed(reg34)),
                  {reg34, (8'hb6)}}));
          reg36 <= reg25[(3'h4):(2'h3)];
          if ((8'hbb))
            begin
              reg37 <= ({$unsigned((8'hba))} ?
                  (8'hb8) : (reg35[(1'h0):(1'h0)] ?
                      reg36[(1'h1):(1'h0)] : ((~|(~|reg35)) | (^(~|reg30)))));
              reg38 <= $signed($signed(((reg35 ?
                  $signed(reg26) : $signed((8'hb0))) >>> $signed({reg29,
                  (8'h9c)}))));
              reg39 <= $signed((8'h9c));
              reg40 <= ((&$signed(reg31[(1'h0):(1'h0)])) ^ ($unsigned(({wire27,
                          reg33} ?
                      (~^reg26) : (~|(8'hb0)))) ?
                  wire28 : (reg29[(3'h5):(2'h3)] <= (reg30 ^ reg37))));
            end
          else
            begin
              reg37 <= (($signed((reg26[(1'h0):(1'h0)] ?
                          $unsigned(reg25) : $unsigned(reg31))) ?
                      (&reg34) : reg39[(1'h1):(1'h1)]) ?
                  {$signed(wire20[(4'hb):(1'h1)]),
                      {(((8'haa) <= wire20) ?
                              (wire20 & reg39) : reg39)}} : (~(wire22 * $unsigned({(7'h42)}))));
              reg38 <= {(~^(reg34[(4'h8):(3'h7)] ?
                      reg26 : ($signed((7'h43)) - $unsigned(reg37))))};
              reg39 <= ({(!(wire24[(2'h3):(1'h0)] ?
                      wire23[(1'h0):(1'h0)] : wire21[(3'h6):(3'h6)])),
                  (~|$unsigned((reg35 == reg34)))} & (7'h42));
              reg40 <= ({((^$unsigned(reg26)) ?
                      ($signed(reg38) ?
                          (wire20 * (8'ha8)) : (reg40 >>> reg40)) : ((~|wire23) >>> (reg37 ?
                          (7'h41) : wire22))),
                  reg26} >>> ((((reg29 ? (8'hbd) : wire20) ?
                      reg32 : reg29) * wire21[(2'h2):(1'h1)]) ?
                  {{$signed((8'ha4))}, $signed((~^reg29))} : reg34));
            end
          reg41 <= (reg32 ?
              wire24[(3'h7):(2'h3)] : (&$unsigned(($unsigned((8'hb4)) ?
                  $signed(reg38) : reg33))));
        end
      else
        begin
          reg35 <= {((!wire21) ~^ $unsigned({{(7'h44)}}))};
        end
      reg42 <= (^~reg40);
    end
endmodule
