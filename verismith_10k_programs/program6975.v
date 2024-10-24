module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1ae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire91;
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire107,
                 wire9,
                 wire10,
                 wire91,
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
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {$unsigned(($signed($signed(wire4)) ?
              (wire2[(5'h11):(3'h5)] != $unsigned(wire1)) : (((8'ha4) ?
                  (8'hac) : wire3) ~^ wire3[(3'h4):(1'h0)])))};
      reg6 <= wire2[(4'hf):(4'h8)];
      reg7 <= wire0[(5'h12):(1'h0)];
      reg8 <= (!$unsigned((~^($unsigned(wire1) & $unsigned(reg6)))));
    end
  assign wire9 = reg6[(1'h1):(1'h0)];
  assign wire10 = $unsigned(reg5);
  module11 #() modinst92 (.clk(clk), .y(wire91), .wire14(wire1), .wire15(reg8), .wire12(reg5), .wire13(reg7));
  always
    @(posedge clk) begin
      if (reg7)
        begin
          reg93 <= ($unsigned(wire2) << reg6);
          if (((($unsigned({wire9, (8'ha1)}) ?
                  {reg6[(3'h4):(1'h1)]} : reg8[(4'he):(3'h5)]) ?
              wire3[(4'h9):(3'h5)] : reg5) <= ((~^$unsigned(wire1)) << ($unsigned($signed((7'h41))) ?
              {(reg8 ? (7'h41) : wire1)} : ($signed(wire91) ?
                  (reg93 ? reg7 : reg8) : {wire91, (8'ha5)})))))
            begin
              reg94 <= wire91;
            end
          else
            begin
              reg94 <= $signed((+wire3[(5'h12):(3'h4)]));
              reg95 <= $unsigned(wire91);
              reg96 <= (wire2 ?
                  $signed((reg95 != (|reg8))) : ((wire10[(4'h8):(3'h5)] + (-$unsigned(wire10))) ?
                      (((reg95 < reg6) ?
                          {wire0,
                              (8'hb0)} : (8'hb1)) ^ (~&$signed(wire2))) : {wire4[(2'h2):(1'h1)]}));
            end
          if (reg5[(3'h4):(1'h1)])
            begin
              reg97 <= wire1;
            end
          else
            begin
              reg97 <= wire91[(1'h0):(1'h0)];
              reg98 <= {(+$signed(wire0[(3'h6):(2'h2)]))};
              reg99 <= (((((reg93 <<< reg95) >= (8'hb9)) <= {((8'haa) ?
                              reg5 : reg5),
                          reg97[(3'h6):(3'h4)]}) ?
                      (({(8'hbb),
                          wire3} - {reg5}) - $unsigned((7'h42))) : reg7) ?
                  wire10[(3'h7):(3'h4)] : $signed((reg94[(1'h1):(1'h1)] >= (reg98 ?
                      $unsigned(reg6) : (wire10 ? reg93 : wire0)))));
              reg100 <= reg8[(1'h0):(1'h0)];
              reg101 <= reg99;
            end
          reg102 <= $unsigned(reg5);
        end
      else
        begin
          reg93 <= wire3;
          reg94 <= {((&(wire0[(4'ha):(3'h5)] ?
                      (reg102 ? reg98 : wire10) : reg96[(1'h1):(1'h0)])) ?
                  (~|($unsigned((8'hb1)) || $signed(reg102))) : $signed($signed((wire3 - reg101))))};
          if ((~|$signed($signed((reg6 ? wire2[(4'he):(4'he)] : reg96)))))
            begin
              reg95 <= ($unsigned(($signed((-reg5)) ?
                  $signed((~wire1)) : $signed(reg95[(1'h1):(1'h1)]))) != ($unsigned(reg7) <<< $signed(((reg7 || reg97) ?
                  $unsigned((8'hab)) : (reg5 ? reg93 : wire91)))));
            end
          else
            begin
              reg95 <= $signed($unsigned((reg95 * $unsigned(reg96))));
              reg96 <= $signed(({$signed(reg99[(4'hd):(3'h6)]),
                      reg100[(1'h1):(1'h0)]} ?
                  (((reg94 >> wire1) ? reg94 : (&reg97)) ?
                      $signed((wire91 ?
                          reg98 : (8'hab))) : ({reg5} > reg8)) : (((wire2 < wire9) == (reg7 ?
                      reg102 : reg94)) > (~{(8'h9e)}))));
              reg97 <= $unsigned($signed($signed((wire2 ?
                  $signed(wire4) : reg96[(3'h6):(1'h0)]))));
              reg98 <= reg7[(5'h11):(4'hd)];
              reg99 <= wire10[(3'h7):(1'h0)];
            end
        end
      reg103 <= (reg100[(3'h4):(1'h1)] ? reg95 : $signed(reg6));
      reg104 <= (reg103[(3'h5):(2'h2)] ?
          (((!(wire2 ? (8'hbf) : reg7)) ^~ {{(7'h40)}}) ?
              ((reg7[(4'hc):(3'h4)] ?
                  $signed(reg97) : $signed(reg96)) || wire10[(4'h9):(4'h8)]) : reg101[(4'hb):(1'h0)]) : reg102);
      reg105 <= wire4[(1'h1):(1'h1)];
      reg106 <= (~|wire9[(5'h11):(2'h2)]);
    end
  assign wire107 = ($signed({reg94[(1'h0):(1'h0)], reg8[(5'h15):(5'h15)]}) ?
                       $signed(reg98[(1'h0):(1'h0)]) : $signed(wire1));
  always
    @(posedge clk) begin
      reg108 <= (reg102 ?
          (8'ha2) : (($unsigned((reg94 ^ reg97)) >>> reg96) & (&$unsigned(reg98))));
      reg109 <= $signed($unsigned($unsigned(((reg5 == reg101) ?
          $unsigned(reg103) : (!reg97)))));
      reg110 <= (+($unsigned(((&(8'ha9)) ?
          (&reg97) : $unsigned(reg5))) ^~ (8'ha4)));
      if ($unsigned(reg97))
        begin
          reg111 <= (~(&$unsigned($unsigned(wire2))));
          reg112 <= {{(-$unsigned($signed(reg94))), reg96}};
          if ((^(7'h41)))
            begin
              reg113 <= reg8;
            end
          else
            begin
              reg113 <= $signed($signed(reg101));
              reg114 <= (reg93[(1'h1):(1'h0)] <= reg112[(3'h6):(3'h4)]);
              reg115 <= ((!((+wire4[(1'h0):(1'h0)]) >>> $unsigned((^(8'haf))))) ?
                  (^($signed((^~wire0)) ?
                      (+(8'h9d)) : {(^wire2), (reg110 << wire2)})) : (~{reg103,
                      wire9[(5'h12):(4'hd)]}));
              reg116 <= (~^reg104[(2'h3):(2'h3)]);
              reg117 <= $signed($signed((((wire107 + wire91) && (wire0 ?
                      reg112 : reg114)) ?
                  $unsigned($signed(reg112)) : (+$signed((8'ha0))))));
            end
        end
      else
        begin
          reg111 <= {reg8[(4'hd):(3'h4)]};
          reg112 <= reg95;
        end
      reg118 <= reg95[(1'h0):(1'h0)];
    end
endmodule

module module11
#(parameter param90 = (-((((+(8'haa)) > (^~(8'hbc))) > (|(~|(8'h9c)))) && (8'haf))))
(y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire85;
  assign y = {wire89, wire88, wire87, wire16, wire17, wire85, (1'h0)};
  assign wire16 = (|((wire13[(4'he):(3'h6)] ?
                          wire13 : (wire14[(3'h7):(2'h2)] << $signed(wire13))) ?
                      wire15 : $unsigned(({wire13, wire15} ^~ ((8'hb5) ?
                          (8'ha9) : (8'hba))))));
  assign wire17 = $signed($signed($unsigned((&(8'ha1)))));
  module18 #() modinst86 (wire85, clk, wire17, wire13, wire15, wire16, wire12);
  assign wire87 = $unsigned(wire85[(1'h0):(1'h0)]);
  assign wire88 = (~^($unsigned(wire14[(4'hc):(3'h7)]) ?
                      wire14 : (wire87[(4'hb):(4'h9)] ?
                          wire87[(4'h9):(2'h3)] : wire12)));
  assign wire89 = ({((8'ha3) ~^ (^~(wire85 ?
                          wire88 : (8'hb8))))} | ({($signed(wire14) * $unsigned(wire85)),
                          ($unsigned((8'hbb)) <<< $signed((7'h41)))} ?
                      wire87 : (|($signed(wire87) ^ wire15))));
endmodule

module module18
#(parameter param83 = ((({((7'h40) ? (8'hac) : (8'hb3))} ? (&((8'hb7) ? (8'h9f) : (8'hb0))) : (((8'hb1) ? (8'ha3) : (8'hac)) ? ((8'hb0) * (8'ha3)) : ((8'hab) >= (7'h41)))) <<< ((((8'ha1) || (8'hae)) ^~ ((8'hbc) <<< (8'hbb))) < {{(8'ha4), (8'hbd)}, (^(7'h42))})) >>> {(|(^~((8'hbd) > (8'hb0)))), (~|(((8'h9d) || (8'hbb)) ? ((8'hb2) ? (7'h44) : (8'ha4)) : (8'ha3)))}), 
parameter param84 = (((((8'ha0) ? param83 : {(8'hba), param83}) ? {(!param83), (^param83)} : ((param83 ? param83 : param83) + {param83, (8'ha1)})) ? param83 : param83) ^~ param83))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h272):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire22;
  input wire [(3'h4):(1'h0)] wire21;
  input wire [(4'hf):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  assign y = {wire81,
                 wire35,
                 wire34,
                 wire33,
                 reg82,
                 reg80,
                 reg79,
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
                 reg62,
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
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg24 <= wire23;
      if (wire23)
        begin
          reg25 <= wire22[(1'h1):(1'h1)];
        end
      else
        begin
          reg25 <= wire19;
        end
      reg26 <= (~^reg24);
      reg27 <= $signed(($signed(($signed(wire19) ?
          (wire20 ?
              (8'hb5) : wire21) : wire23[(1'h0):(1'h0)])) <<< {reg24[(1'h0):(1'h0)],
          reg26}));
      if (((-$signed(reg25[(3'h7):(1'h0)])) * wire19[(4'hf):(3'h6)]))
        begin
          if (wire20)
            begin
              reg28 <= reg24[(1'h0):(1'h0)];
              reg29 <= (8'hb7);
              reg30 <= $unsigned((~|$unsigned(reg28)));
              reg31 <= (+(~^(|{{wire23}})));
            end
          else
            begin
              reg28 <= $signed((wire22 ?
                  $unsigned(($unsigned(reg31) << wire19[(4'hd):(1'h0)])) : $signed(reg29[(2'h3):(1'h0)])));
              reg29 <= reg30[(1'h1):(1'h1)];
              reg30 <= ($signed($unsigned($unsigned((reg26 > reg30)))) * $unsigned((reg26 ?
                  ({(8'ha1),
                      reg29} >= $unsigned(reg28)) : (wire23[(3'h6):(3'h4)] > $unsigned(wire20)))));
              reg31 <= $signed(($unsigned($unsigned(wire22)) > (|($signed(reg31) != wire19[(3'h6):(1'h1)]))));
            end
        end
      else
        begin
          reg28 <= (!((({reg27, reg28} ?
                      ((7'h42) >= wire21) : ((8'hb5) - wire20)) ?
                  ($signed(wire21) ?
                      (reg26 == reg24) : reg27[(1'h1):(1'h1)]) : $unsigned((reg27 <<< reg30))) ?
              ($signed(reg27) || ($unsigned(reg31) + $signed(reg25))) : {reg25,
                  wire20[(4'hd):(4'hb)]}));
          reg29 <= (wire20 ? reg30[(4'hd):(4'hc)] : $unsigned((8'h9c)));
          if ($signed($unsigned({(~&(!reg29)),
              (reg24[(1'h1):(1'h0)] <= $unsigned(reg27))})))
            begin
              reg30 <= $unsigned($unsigned((!wire23[(3'h5):(3'h5)])));
              reg31 <= reg28[(2'h2):(2'h2)];
              reg32 <= $unsigned({{reg27}, (|reg30[(3'h5):(1'h0)])});
            end
          else
            begin
              reg30 <= $unsigned(wire23);
              reg31 <= ((~&reg32[(2'h3):(1'h1)]) ?
                  $unsigned((((reg28 & reg30) ?
                          {reg28} : wire22[(4'hc):(4'ha)]) ?
                      (~|reg26) : $unsigned((^~wire23)))) : wire19);
              reg32 <= (+wire20);
            end
        end
    end
  assign wire33 = $signed(($signed((~^(reg32 ? (8'ha4) : reg31))) ?
                      (-reg30[(3'h7):(2'h2)]) : ((^reg28[(1'h1):(1'h1)]) <= {$unsigned(reg28)})));
  assign wire34 = $signed((((~&wire33) ?
                      reg32 : ((~wire19) ?
                          {(7'h44)} : (reg32 >= reg28))) - $unsigned(reg27[(2'h2):(2'h2)])));
  assign wire35 = (^~$unsigned(($unsigned($unsigned(wire34)) ?
                      (&reg25[(2'h2):(2'h2)]) : reg25)));
  always
    @(posedge clk) begin
      reg36 <= $unsigned({reg26[(1'h1):(1'h0)]});
      if ((8'h9f))
        begin
          reg37 <= {$unsigned(reg30)};
        end
      else
        begin
          reg37 <= reg31;
          if (reg36)
            begin
              reg38 <= $signed((8'h9e));
              reg39 <= $unsigned({(8'hb5)});
              reg40 <= (8'haf);
            end
          else
            begin
              reg38 <= (!($unsigned(wire19[(1'h1):(1'h0)]) + reg26[(3'h7):(3'h5)]));
            end
          reg41 <= (^{({(reg39 >>> (8'hbd))} ?
                  (reg24 ?
                      wire22[(4'hc):(4'hc)] : $signed(reg24)) : $unsigned({(8'hb6)}))});
          reg42 <= $signed($signed((~|(reg41 < ((8'hb2) ? reg39 : wire20)))));
        end
      reg43 <= $unsigned((wire23[(3'h4):(1'h0)] ?
          (reg36[(4'ha):(3'h5)] * (~(reg39 ?
              wire23 : reg28))) : wire22[(2'h2):(2'h2)]));
      if ({(($unsigned((8'hb2)) <<< ($signed(wire19) <<< (-reg43))) + $signed($signed($signed(wire19)))),
          reg40[(2'h3):(2'h2)]})
        begin
          if (($signed((8'ha8)) ?
              (+reg29[(4'h9):(4'h9)]) : $unsigned(reg40[(1'h0):(1'h0)])))
            begin
              reg44 <= ((wire22 >= ((~|reg29) > $unsigned({(8'hbf),
                  reg37}))) + (8'ha1));
              reg45 <= reg30;
              reg46 <= wire22[(4'hc):(1'h1)];
              reg47 <= (wire22[(3'h6):(3'h5)] ?
                  wire22 : (+((+$signed((8'had))) ?
                      (~|reg38[(3'h4):(3'h4)]) : ((reg44 ^~ reg31) - $unsigned(reg43)))));
              reg48 <= reg25[(2'h2):(1'h1)];
            end
          else
            begin
              reg44 <= reg46;
              reg45 <= (((($signed(wire34) ?
                          {reg40, (8'haf)} : reg36) >> $unsigned((reg41 ?
                          wire19 : reg28))) ?
                      (-($unsigned(reg43) ? reg45 : (reg41 < reg45))) : reg43) ?
                  $signed($unsigned(reg38[(2'h3):(1'h1)])) : $unsigned($signed($signed((-wire33)))));
            end
          reg49 <= $unsigned((&(($signed(reg40) << reg28[(4'he):(4'hd)]) ?
              (~$unsigned(reg37)) : $signed((reg24 - reg26)))));
          reg50 <= wire19;
        end
      else
        begin
          if ({(^$signed((~&{wire33}))), (reg25[(4'h8):(1'h0)] <= reg42)})
            begin
              reg44 <= (!$signed(($signed($signed(reg47)) >= wire20[(3'h6):(3'h5)])));
              reg45 <= wire22[(4'h8):(3'h7)];
              reg46 <= ($signed($signed($unsigned(reg31))) > ($signed({(8'h9e)}) ?
                  {{(reg26 <<< reg36)}} : $signed(({reg40, reg25} ?
                      (reg31 == (7'h43)) : {reg26, reg46}))));
              reg47 <= reg36[(4'he):(3'h6)];
              reg48 <= (^reg26);
            end
          else
            begin
              reg44 <= {$unsigned($unsigned({(reg49 ? wire19 : reg47)})),
                  $unsigned(((~^((8'hbe) >= reg38)) | (reg29[(5'h12):(4'he)] & wire33)))};
              reg45 <= (|$unsigned($signed($signed($signed(reg47)))));
            end
        end
    end
  always
    @(posedge clk) begin
      if (wire20[(1'h1):(1'h1)])
        begin
          reg51 <= (($unsigned($signed($signed(reg24))) ?
              $signed((wire34 ^ $unsigned(reg26))) : $signed(wire21[(1'h0):(1'h0)])) >= $signed((~&$unsigned($signed(reg30)))));
          reg52 <= reg43;
        end
      else
        begin
          reg51 <= wire22[(3'h5):(3'h4)];
          if ($signed(reg49[(2'h2):(1'h0)]))
            begin
              reg52 <= (!(~|((7'h44) ?
                  {(reg40 <<< wire20),
                      $unsigned(reg46)} : $signed((reg27 >= reg50)))));
              reg53 <= $signed(($unsigned(reg42[(2'h3):(1'h0)]) ?
                  ({((8'hb5) + reg37), $signed(reg24)} ?
                      reg25[(2'h3):(1'h0)] : (8'ha5)) : (+((~|wire34) * (|wire34)))));
              reg54 <= {$unsigned(wire20),
                  $unsigned($unsigned($signed((wire20 <= (7'h42)))))};
              reg55 <= $unsigned(reg31);
            end
          else
            begin
              reg52 <= $unsigned({reg50});
              reg53 <= $unsigned(reg31);
              reg54 <= (reg40 ?
                  $unsigned(((7'h44) & ((reg46 ? wire33 : reg44) ?
                      $unsigned(reg39) : $unsigned(reg24)))) : (({reg30} <<< (reg30[(4'h8):(1'h0)] <= (reg25 || wire23))) ?
                      $signed(reg40[(1'h1):(1'h0)]) : $signed((reg40[(4'h9):(3'h5)] ?
                          (^~reg54) : (reg25 ? reg26 : reg44)))));
              reg55 <= (^wire34[(4'ha):(4'h8)]);
              reg56 <= reg46;
            end
          if (wire20)
            begin
              reg57 <= (({((wire19 ? (8'haf) : reg37) ?
                      reg50[(3'h4):(2'h2)] : reg29)} - reg25) >= {(&(wire20[(4'hb):(1'h1)] ?
                      (reg46 ? wire33 : reg48) : (reg36 ? wire21 : reg53)))});
              reg58 <= (+wire33[(2'h2):(1'h0)]);
              reg59 <= $signed({$unsigned(reg50[(1'h1):(1'h0)])});
              reg60 <= $signed({$signed($signed((reg30 < reg38))),
                  (-$signed(reg49))});
            end
          else
            begin
              reg57 <= reg56[(1'h0):(1'h0)];
              reg58 <= (!wire20);
              reg59 <= reg32[(2'h3):(2'h3)];
              reg60 <= (~$signed(({$unsigned(reg39)} ?
                  reg28[(1'h1):(1'h1)] : ((reg46 || reg24) ?
                      $unsigned(reg37) : (reg44 && wire34)))));
              reg61 <= $signed($signed((+(^~{reg50, (8'ha5)}))));
            end
        end
      if ($signed(((((8'ha9) ?
              (reg41 ? (8'hac) : reg48) : (reg40 ? reg60 : wire35)) ?
          (!$signed(reg38)) : {$signed(reg43)}) >= reg30)))
        begin
          if ($unsigned(((-reg25[(3'h4):(3'h4)]) == $unsigned(((^~reg56) <= $unsigned(reg25))))))
            begin
              reg62 <= (reg50 ?
                  (((!((8'h9c) ? reg55 : (8'hbe))) ?
                      (reg44 >= (wire34 >= reg47)) : ((~wire34) > $signed(reg26))) + (reg47 + wire33[(2'h3):(1'h1)])) : (|$signed({$signed(wire34),
                      $signed(reg40)})));
              reg63 <= $unsigned(((~|$unsigned({reg46})) ?
                  $signed({(reg60 && reg44)}) : (~$signed($signed((8'ha7))))));
              reg64 <= {($signed((reg29[(4'hd):(3'h6)] ^ $signed(reg49))) ?
                      (&(reg24 * (^reg40))) : $unsigned(wire33)),
                  (~^$signed((!{reg31})))};
            end
          else
            begin
              reg62 <= ((((&(reg39 ? wire20 : (8'hb1))) ?
                  {(reg49 ?
                          reg41 : (8'h9d))} : $unsigned((reg47 & reg42))) ^ reg50) ^ wire23);
              reg63 <= wire22[(3'h4):(2'h3)];
              reg64 <= reg29[(4'hf):(2'h2)];
              reg65 <= $signed(wire21);
              reg66 <= ((^~reg46) <<< (wire34[(1'h1):(1'h1)] <<< reg38));
            end
          reg67 <= reg39;
        end
      else
        begin
          reg62 <= $signed((reg26 >> ($signed((~|reg37)) ?
              $signed({reg30}) : {{wire34}})));
        end
      reg68 <= reg55[(4'hd):(4'hd)];
      if (($unsigned($signed($signed((wire34 >> reg54)))) ?
          $unsigned(((~&$unsigned(reg25)) != reg45)) : $signed((~$unsigned({reg54})))))
        begin
          reg69 <= (({reg62} ?
              reg62 : ((7'h42) | ((wire33 & reg67) - (!(8'ha5))))) ~^ (reg43 ?
              (~^$signed((wire22 ? (8'h9e) : reg63))) : {$signed((|(8'hb0)))}));
          if ((~wire35))
            begin
              reg70 <= reg31;
              reg71 <= (((~^((&reg28) <= (^~reg26))) - $signed($signed(reg64[(5'h10):(4'h9)]))) ^~ ({(+$signed(reg36))} ?
                  (wire22 == ($unsigned(reg43) ?
                      (reg31 ^ reg63) : (reg63 <<< reg67))) : wire33[(2'h2):(1'h1)]));
              reg72 <= ((-(+(reg29[(2'h3):(2'h2)] != (8'hbe)))) + ($signed((&(~^reg43))) >> (($unsigned(reg68) | $unsigned(reg49)) ?
                  (|$signed(reg55)) : reg59)));
            end
          else
            begin
              reg70 <= {$signed(reg69[(4'h9):(4'h8)])};
              reg71 <= {((~$signed((~reg32))) <<< ($signed($unsigned((8'ha7))) ?
                      $unsigned((reg28 < reg63)) : reg44))};
              reg72 <= $unsigned($unsigned(reg58));
              reg73 <= reg43[(5'h10):(4'hd)];
            end
          reg74 <= (-$signed(reg24[(1'h0):(1'h0)]));
          if (reg43[(4'hc):(4'hb)])
            begin
              reg75 <= ($unsigned(((&reg26) ~^ ((8'hba) ?
                      $signed(reg40) : wire23))) ?
                  $unsigned(({{reg24}} ?
                      {reg67[(1'h0):(1'h0)]} : ({wire20,
                          reg32} ~^ $signed(reg59)))) : reg53);
              reg76 <= $signed(reg32);
              reg77 <= (($signed($unsigned({wire20})) ?
                      $unsigned((((8'ha1) ?
                          reg62 : reg26) ^ $signed(reg39))) : $signed($signed(((8'hae) ?
                          reg37 : reg56)))) ?
                  (&reg50[(1'h0):(1'h0)]) : (|$signed($unsigned(reg30))));
              reg78 <= reg58[(2'h2):(1'h1)];
              reg79 <= wire19[(4'hb):(4'hb)];
            end
          else
            begin
              reg75 <= $unsigned($signed(reg61));
              reg76 <= reg31;
              reg77 <= (reg43[(5'h11):(4'hb)] ?
                  ({(-$unsigned(reg60))} ?
                      $signed($unsigned(reg24)) : reg74[(3'h6):(2'h3)]) : $signed({{$signed(reg48)}}));
              reg78 <= reg60;
              reg79 <= (reg77[(4'hb):(3'h7)] ?
                  {(|$signed($unsigned(reg40)))} : reg42);
            end
        end
      else
        begin
          reg69 <= reg54[(4'hc):(4'h8)];
          reg70 <= (($signed($unsigned(((8'ha6) ? reg53 : reg53))) ?
              $signed((reg72 ?
                  reg48[(1'h1):(1'h0)] : reg30)) : (($signed(reg27) ?
                      (reg67 ? (7'h40) : reg73) : (^reg31)) ?
                  reg67 : (~reg71[(1'h1):(1'h1)]))) ^ $unsigned(reg41));
          if (reg37)
            begin
              reg71 <= $unsigned(wire22[(4'ha):(2'h2)]);
            end
          else
            begin
              reg71 <= reg73[(2'h3):(2'h3)];
              reg72 <= (^~{{(reg29 ? $unsigned(reg50) : reg56),
                      {(reg74 ? wire19 : reg73)}},
                  ({reg44} ~^ $signed(((8'hbd) << reg51)))});
              reg73 <= (~&reg30);
              reg74 <= ($signed(($signed(reg69[(3'h7):(2'h2)]) ?
                      (8'ha5) : reg60[(2'h2):(2'h2)])) ?
                  $unsigned({reg63[(1'h1):(1'h1)]}) : {$signed(reg40)});
            end
          reg75 <= $signed((wire20 ? (8'haa) : reg65));
        end
      reg80 <= (reg75 ?
          $unsigned($signed(((reg69 >= reg42) + reg54))) : (&reg48));
    end
  assign wire81 = (~(|{$unsigned($unsigned(wire22)), reg40[(3'h5):(2'h2)]}));
  always
    @(posedge clk) begin
      reg82 <= ((8'haa) || (reg76[(2'h3):(2'h3)] != (~(reg53 ?
          (reg30 ? reg76 : reg79) : reg28[(4'hc):(4'hb)]))));
    end
endmodule
