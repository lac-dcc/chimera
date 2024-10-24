module top
#(parameter param161 = {(((((8'haa) ? (8'ha7) : (8'hbc)) | (^(8'hbc))) - (((8'hb5) & (8'h9f)) - (7'h44))) - ((~|(!(8'hb0))) ^~ (((8'ha2) ? (8'hb8) : (8'hb8)) ? ((8'hac) ^~ (8'ha1)) : ((8'hb3) <= (8'hbc))))), (({((8'ha8) ? (8'hab) : (8'h9d)), {(8'haf), (8'h9d)}} <= ((~&(8'hbf)) ? {(8'ha0)} : {(8'hb7)})) ? (^~(+((8'h9e) ? (7'h41) : (8'ha8)))) : (^~({(7'h44), (8'hb3)} ? ((8'ha4) ? (8'ha8) : (8'haa)) : ((8'ha9) ? (8'haf) : (8'hae)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire160;
  wire [(4'ha):(1'h0)] wire159;
  wire [(4'ha):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire157;
  wire [(5'h12):(1'h0)] wire156;
  wire [(4'he):(1'h0)] wire155;
  wire [(4'hf):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire153;
  wire [(4'hf):(1'h0)] wire152;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire112;
  wire signed [(4'hb):(1'h0)] wire150;
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg111 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire5,
                 wire6,
                 wire12,
                 wire98,
                 wire112,
                 wire150,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 (1'h0)};
  assign wire5 = $unsigned(wire4[(1'h1):(1'h1)]);
  assign wire6 = $unsigned((8'hbd));
  always
    @(posedge clk) begin
      reg7 <= $signed(wire1);
      reg8 <= wire1[(4'hb):(4'hb)];
      reg9 <= ((8'haa) ? reg8 : {(|$signed(reg8)), (&wire4)});
      reg10 <= (&((wire6 ? wire4[(2'h2):(2'h2)] : wire3) > wire4));
      reg11 <= reg10;
    end
  assign wire12 = (&(-{$unsigned($signed(wire4))}));
  module13 #() modinst99 (wire98, clk, reg7, wire6, reg11, wire4);
  always
    @(posedge clk) begin
      if ((((reg10[(3'h7):(3'h4)] ?
                  $signed($signed(wire12)) : ($signed(wire5) << ((8'hae) ?
                      wire6 : (8'ha2)))) ?
              reg7 : wire2[(3'h4):(3'h4)]) ?
          reg7 : $unsigned(((((7'h43) ^ wire6) | reg9[(3'h4):(1'h0)]) ?
              $unsigned((wire3 ? wire3 : wire1)) : $unsigned((wire98 ?
                  (8'ha7) : wire2))))))
        begin
          if (($unsigned(wire3[(4'h8):(3'h6)]) ^ (^~wire5)))
            begin
              reg100 <= ($signed(((wire12 ^ ((7'h41) ? wire2 : reg8)) ?
                  (reg8[(2'h3):(1'h0)] && wire6) : (-{wire12,
                      wire98}))) ^ wire5);
              reg101 <= $unsigned((^($signed($signed(wire0)) & ({wire2} == (~(8'hb2))))));
            end
          else
            begin
              reg100 <= (wire1[(1'h0):(1'h0)] ?
                  (~&{(|wire4), wire12}) : ($signed((7'h41)) ?
                      (~|$unsigned((wire6 ? reg100 : reg10))) : {reg100,
                          (!(^~reg7))}));
            end
          reg102 <= (~&$signed((reg11 ?
              $signed($unsigned(wire6)) : reg101[(2'h3):(1'h1)])));
          reg103 <= reg8[(3'h5):(1'h0)];
          if ($signed((($signed(reg9) >> $signed(((8'haa) < reg9))) ?
              reg7[(3'h6):(3'h6)] : $signed((wire12 ~^ wire6[(5'h12):(5'h10)])))))
            begin
              reg104 <= (!{$signed($signed($unsigned((8'haa))))});
              reg105 <= $signed(reg103);
              reg106 <= wire3[(4'hd):(4'hd)];
              reg107 <= ((+(($signed(wire98) ?
                      reg102 : (~&(8'ha4))) ~^ ($unsigned(wire98) >> $unsigned(wire3)))) ?
                  $unsigned(reg103[(4'hb):(3'h5)]) : ((^~(reg7 | (8'hba))) <= reg7[(4'ha):(4'ha)]));
            end
          else
            begin
              reg104 <= ($unsigned($unsigned($unsigned((reg9 ?
                      reg103 : (8'ha4))))) ?
                  (reg101[(1'h0):(1'h0)] >= $signed({wire6})) : $signed($signed(($unsigned(wire1) == $signed((8'h9f))))));
              reg105 <= (^$unsigned(((~$unsigned(reg103)) ?
                  (((8'hb5) ? reg9 : reg103) ?
                      (reg101 < reg11) : $unsigned(reg102)) : wire0)));
              reg106 <= wire4[(4'ha):(3'h5)];
            end
          reg108 <= $signed((((+reg101) ^~ (|{reg10, reg106})) ?
              $unsigned($unsigned(reg104[(4'hd):(2'h2)])) : (~&wire0[(4'h9):(2'h2)])));
        end
      else
        begin
          if (({$signed($signed(reg100))} || $unsigned($signed($signed((wire4 ?
              (8'hab) : wire0))))))
            begin
              reg100 <= ({(($signed((7'h41)) - ((8'ha5) ?
                      reg103 : reg105)) < ($signed(reg105) ?
                      (reg108 ^ (8'ha6)) : (wire12 ?
                          reg100 : reg7)))} || (-wire3));
              reg101 <= (8'hbd);
              reg102 <= reg7;
              reg103 <= ((reg100 ~^ reg107[(4'hb):(1'h1)]) ? (7'h41) : reg8);
            end
          else
            begin
              reg100 <= reg11[(5'h12):(3'h6)];
              reg101 <= $unsigned($signed($unsigned(((|(8'hbf)) ?
                  $signed((8'ha4)) : {wire12, reg100}))));
              reg102 <= $unsigned($unsigned((^~wire12[(5'h11):(4'he)])));
              reg103 <= wire12;
              reg104 <= (reg108[(3'h6):(1'h1)] - reg107);
            end
          reg105 <= {wire0, reg8[(2'h3):(2'h3)]};
          if (((|(((reg104 ? reg103 : wire0) | {reg101,
                  wire5}) <<< $signed($signed(wire2)))) ?
              $unsigned(wire2[(1'h1):(1'h0)]) : wire0[(2'h3):(2'h3)]))
            begin
              reg106 <= (^~(reg108 ?
                  (|reg102) : $unsigned($unsigned((reg107 ? reg11 : reg102)))));
              reg107 <= (8'hb1);
            end
          else
            begin
              reg106 <= reg7;
              reg107 <= {((wire2[(3'h4):(1'h1)] ^~ $unsigned({wire12,
                      reg8})) != reg100),
                  (wire0 * wire98[(1'h1):(1'h1)])};
              reg108 <= reg100[(3'h4):(2'h3)];
            end
          reg109 <= (wire1 || ((8'hb1) ?
              {((reg106 ? reg7 : reg7) ?
                      $signed(wire1) : $signed(reg8))} : (reg8 | ($unsigned(reg105) != (-wire12)))));
          reg110 <= $signed((((^~(reg108 ? wire6 : (8'hb9))) + wire6) ?
              (8'h9f) : (!{wire12})));
        end
      reg111 <= $signed($signed(((~(8'ha3)) == wire98)));
    end
  assign wire112 = $signed($unsigned((~&((reg111 ^~ reg102) ?
                       (reg8 ? reg102 : wire6) : (^reg100)))));
  module113 #() modinst151 (wire150, clk, reg108, wire0, reg110, reg111);
  assign wire152 = $unsigned((~^reg11[(4'hc):(3'h7)]));
  assign wire153 = ((~&wire3) ?
                       reg103 : $unsigned($signed(reg103[(4'he):(3'h5)])));
  assign wire154 = reg102[(2'h3):(2'h3)];
  assign wire155 = wire154[(4'hf):(4'h9)];
  assign wire156 = $unsigned($signed(wire150));
  assign wire157 = {$signed((~{(8'h9e), $signed(wire3)})), reg8};
  assign wire158 = $unsigned($signed(((~&(reg105 ?
                       reg7 : reg8)) ~^ $unsigned($signed(reg106)))));
  assign wire159 = $signed((8'h9f));
  assign wire160 = $signed(reg109[(4'hb):(4'ha)]);
endmodule

module module113  (y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire117;
  input wire signed [(4'h9):(1'h0)] wire116;
  input wire signed [(5'h12):(1'h0)] wire115;
  input wire [(5'h11):(1'h0)] wire114;
  wire signed [(3'h7):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire148;
  wire signed [(5'h12):(1'h0)] wire147;
  wire signed [(4'he):(1'h0)] wire145;
  assign y = {wire149, wire148, wire147, wire145, (1'h0)};
  module118 #() modinst146 (wire145, clk, wire115, wire116, wire117, wire114, (8'hbc));
  assign wire147 = ((((^wire145[(3'h5):(3'h5)]) >> ($signed(wire115) ?
                           ((8'hbb) ?
                               wire115 : wire114) : wire117)) <= ($unsigned((|wire145)) ?
                           $signed($unsigned(wire117)) : ({wire115, wire145} ?
                               wire114[(2'h3):(2'h2)] : (wire116 ?
                                   wire117 : wire145)))) ?
                       (^~(^~(8'hab))) : (-(&wire116)));
  assign wire148 = $unsigned(((8'hab) ?
                       $unsigned(((&wire114) || $unsigned(wire114))) : wire116));
  assign wire149 = wire145;
endmodule

module module13
#(parameter param96 = (~^(+(~&(|((8'ha8) ? (8'hbd) : (8'ha6)))))), 
parameter param97 = param96)
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(5'h12):(1'h0)] wire92;
  wire signed [(4'h8):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire88;
  wire [(3'h5):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire18;
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire18,
                 (1'h0)};
  assign wire18 = ((^~$signed(wire15)) ?
                      (wire17[(4'h9):(1'h1)] ?
                          wire14[(1'h0):(1'h0)] : (^~($signed((8'hba)) ?
                              $unsigned(wire16) : wire17))) : {((wire14[(3'h4):(1'h0)] ?
                                  (wire16 << wire14) : $signed(wire16)) ?
                              wire17[(1'h1):(1'h0)] : ({wire15} > $signed(wire15))),
                          ((^((8'hbf) ? wire17 : (7'h43))) >> ((wire15 ?
                              wire17 : wire16) || $signed(wire16)))});
  module19 #() modinst87 (.wire21(wire14), .y(wire86), .wire22(wire16), .wire20(wire18), .clk(clk), .wire23(wire17));
  assign wire88 = wire17;
  assign wire89 = ((^((^~wire88) >>> (~^(wire14 ? wire14 : (8'ha6))))) ?
                      ($unsigned($signed(wire15)) ?
                          $signed({$signed(wire18)}) : (|{wire16,
                              {wire88}})) : $unsigned(((^~(wire86 != wire15)) ?
                          $unsigned($unsigned(wire17)) : ($unsigned(wire88) ?
                              wire16[(5'h15):(2'h2)] : (~|wire14)))));
  assign wire90 = ((!wire14) && $unsigned($unsigned({$signed(wire16),
                      ((8'ha9) & wire86)})));
  assign wire91 = $signed(wire86);
  assign wire92 = $signed((~{{(~^wire14)},
                      (wire16[(5'h12):(4'h9)] ?
                          (wire14 * wire88) : ((8'hb8) ? wire16 : wire88))}));
  assign wire93 = $unsigned($signed(wire15));
  assign wire94 = ((&wire16[(4'hf):(1'h0)]) <<< (&wire16[(4'hd):(4'hd)]));
  assign wire95 = (wire16 ?
                      ({$signed(wire92),
                              (wire91[(1'h0):(1'h0)] ?
                                  {(8'hb3), (8'hb3)} : (+wire15))} ?
                          ($unsigned((wire92 ? wire18 : wire16)) ?
                              ($signed(wire17) ?
                                  wire90 : {(8'hb1),
                                      wire88}) : (~&$signed(wire18))) : wire93[(4'ha):(1'h0)]) : $signed($unsigned(wire17[(1'h1):(1'h1)])));
endmodule

module module19
#(parameter param84 = ({(8'ha7)} ? {(7'h41)} : ((-(((7'h44) << (8'hb0)) ? {(8'hbe)} : {(8'hb9)})) ? ((((8'hb2) | (7'h44)) ? ((8'haa) ? (8'hb8) : (8'hb8)) : {(8'hb7), (7'h43)}) < {(~(8'had))}) : ((((8'ha7) ? (8'h9f) : (8'ha3)) ? (~^(8'hab)) : ((8'ha7) ? (8'hbd) : (8'hb1))) == (^((8'hac) ? (8'hb9) : (8'hb9)))))), 
parameter param85 = ((8'haf) ? ({(param84 ? (param84 < (8'hab)) : (param84 << param84)), (~{param84, param84})} ? (&(((8'hb6) & param84) >> (param84 ? param84 : param84))) : {((param84 << param84) <= {param84})}) : ((((param84 ^~ param84) ? (param84 << param84) : (|param84)) > (~(param84 ? (8'hb5) : param84))) + (~^((+param84) >= {param84})))))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h30c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire23;
  input wire signed [(5'h15):(1'h0)] wire22;
  input wire signed [(5'h13):(1'h0)] wire21;
  input wire [(2'h3):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 wire25,
                 wire24,
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
                 reg35,
                 reg34,
                 reg33,
                 reg27,
                 (1'h0)};
  assign wire24 = (~$signed((!(^wire22[(3'h7):(3'h4)]))));
  assign wire25 = {((wire20[(2'h3):(1'h1)] ?
                          $unsigned((wire20 ? wire21 : wire22)) : ({wire24,
                                  wire24} ?
                              (wire22 ? wire20 : wire21) : (wire21 ?
                                  wire20 : wire21))) >> (((wire20 ?
                              wire24 : wire20) ?
                          (wire21 ? wire20 : wire22) : wire20) || ((wire22 ?
                          wire21 : wire23) ^ wire22[(4'he):(4'hd)]))),
                      $unsigned($signed(wire21[(4'hf):(4'hc)]))};
  assign wire26 = wire24[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg27 <= wire26[(2'h3):(2'h3)];
    end
  assign wire28 = $signed((8'hb1));
  assign wire29 = wire25[(1'h1):(1'h1)];
  assign wire30 = (^~$signed(wire28[(4'h9):(3'h4)]));
  assign wire31 = $unsigned(wire23);
  assign wire32 = (($signed(($unsigned(wire23) ? reg27 : (!wire20))) ?
                      {wire28} : {wire23}) != {(((wire24 ^~ wire23) ?
                          (wire26 <<< wire26) : $unsigned(wire23)) ~^ $unsigned($unsigned(wire23))),
                      wire22[(5'h15):(4'h9)]});
  always
    @(posedge clk) begin
      if (({reg27, wire31} >>> wire23[(1'h1):(1'h1)]))
        begin
          if ((((~&$signed(wire21[(5'h10):(4'hb)])) ?
              $unsigned(((~&wire21) ?
                  (!wire29) : ((8'hb3) >>> wire29))) : $signed(((wire31 ?
                  wire31 : wire28) | ((8'hbc) ?
                  wire29 : reg27)))) ^~ $unsigned($unsigned($unsigned($signed(wire32))))))
            begin
              reg33 <= wire22[(4'h9):(3'h6)];
            end
          else
            begin
              reg33 <= ($unsigned(({{wire28}} ?
                  wire26[(2'h2):(1'h1)] : ((~wire21) ?
                      wire28 : (~^reg27)))) || {$signed(wire30),
                  $unsigned(((wire26 ? wire22 : (8'haf)) ?
                      $unsigned(wire21) : (wire20 ? reg27 : wire28)))});
            end
          reg34 <= (($signed((^~$signed(wire31))) ?
              wire24 : (|(wire22 | wire32))) ~^ $unsigned($unsigned((~|wire29))));
          if ((wire29[(1'h1):(1'h0)] & {$unsigned($unsigned($unsigned(wire26)))}))
            begin
              reg35 <= ((~&(7'h41)) + ({wire20[(2'h3):(1'h0)],
                      ($unsigned(wire20) >>> (wire24 == (8'ha5)))} ?
                  $signed($unsigned($unsigned(wire20))) : (7'h43)));
            end
          else
            begin
              reg35 <= wire21;
              reg36 <= $signed((|wire22[(2'h3):(2'h2)]));
              reg37 <= (~&(wire28 ?
                  ((wire20[(2'h3):(1'h1)] != $unsigned(reg35)) ?
                      {(wire28 ?
                              wire31 : wire26)} : (8'haa)) : $unsigned($signed(wire20[(1'h1):(1'h1)]))));
              reg38 <= $unsigned({{(^$signed(wire25))}, wire30});
            end
        end
      else
        begin
          reg33 <= wire20[(2'h2):(1'h1)];
          reg34 <= $signed(($signed(wire26[(3'h6):(3'h4)]) >= ($unsigned($unsigned(wire21)) >>> ((wire23 ^~ wire30) != (wire24 ?
              reg34 : (8'hb3))))));
          reg35 <= $unsigned({$unsigned(reg35[(4'hc):(2'h3)]), reg36});
        end
      if ((^~reg35))
        begin
          reg39 <= ({$signed($signed({reg35}))} ?
              ($unsigned($unsigned((reg37 ?
                  reg37 : reg27))) >>> (|$signed(wire25[(1'h0):(1'h0)]))) : $signed(({wire28,
                      $signed((8'ha7))} ?
                  (((8'had) - reg36) + {wire29}) : {(wire21 * (8'ha6))})));
          reg40 <= $signed($unsigned({$signed({reg27, wire20})}));
          reg41 <= (({$signed((~reg36)),
              ((wire28 < wire32) ?
                  (reg37 ?
                      reg35 : wire28) : $signed(wire30))} <= wire22[(4'he):(2'h3)]) == $unsigned(wire28[(2'h3):(1'h0)]));
          reg42 <= wire23;
        end
      else
        begin
          reg39 <= reg40[(3'h6):(3'h5)];
          reg40 <= (&reg36);
          reg41 <= ($signed($unsigned($unsigned((reg35 ?
              reg38 : (8'ha7))))) << $unsigned(((^(!wire26)) ^ (&(wire29 ?
              wire32 : wire32)))));
          if ($signed($signed(reg42[(3'h7):(2'h3)])))
            begin
              reg42 <= reg27;
              reg43 <= wire25[(1'h0):(1'h0)];
              reg44 <= (&(8'hb1));
            end
          else
            begin
              reg42 <= {$unsigned($signed($signed($unsigned(wire31))))};
              reg43 <= (~&wire20[(2'h3):(1'h0)]);
              reg44 <= {(^$signed($signed(reg34)))};
              reg45 <= {$unsigned(wire24)};
              reg46 <= reg43[(1'h0):(1'h0)];
            end
        end
      if ((reg27 ~^ $signed({((reg37 ~^ wire23) >> reg34[(4'hf):(1'h0)]),
          $signed((^~reg38))})))
        begin
          if ($signed((~(($unsigned((8'ha7)) >> (reg35 + (8'ha3))) >> wire30[(4'he):(3'h4)]))))
            begin
              reg47 <= wire21[(5'h13):(2'h3)];
              reg48 <= $unsigned((8'ha9));
            end
          else
            begin
              reg47 <= reg39;
              reg48 <= (wire32 ^ $signed(reg41));
              reg49 <= $unsigned($unsigned(wire29));
              reg50 <= $signed((reg35[(4'hc):(4'ha)] ?
                  (-$signed((+reg43))) : $signed((((7'h43) == wire21) ?
                      $unsigned(reg44) : (8'hac)))));
              reg51 <= $signed((&(7'h42)));
            end
          reg52 <= $signed(wire32);
          reg53 <= $unsigned({((reg42 ~^ wire21[(5'h10):(4'hd)]) ?
                  reg52[(1'h1):(1'h1)] : $unsigned(wire28[(3'h6):(2'h2)])),
              ($unsigned(wire25) - $signed(reg37))});
        end
      else
        begin
          reg47 <= wire26[(3'h5):(1'h1)];
          reg48 <= {((reg45[(3'h4):(2'h3)] <= wire30) ?
                  $signed((wire26 ?
                      (+wire26) : (|wire23))) : $signed((reg41 >> (&(7'h41))))),
              ((^$signed((~^(8'hb3)))) ?
                  {reg33[(1'h0):(1'h0)],
                      ((reg27 <= (8'hbb)) ?
                          (reg50 ^~ (7'h41)) : $unsigned(reg44))} : (~wire25))};
        end
    end
  assign wire54 = reg43;
  assign wire55 = $unsigned((((~&(reg43 != reg52)) <<< $signed((~^(7'h41)))) ?
                      (((~wire31) ?
                          (~reg44) : (wire25 - reg38)) <<< {(!reg33)}) : $signed(((+wire24) && (reg43 ?
                          reg36 : wire23)))));
  assign wire56 = (reg51 && reg34);
  assign wire57 = $signed({$signed((8'ha0)),
                      (wire54[(5'h11):(5'h11)] ?
                          (wire23 >> reg27[(2'h3):(1'h1)]) : reg50)});
  always
    @(posedge clk) begin
      if ({reg49})
        begin
          reg58 <= {((wire30 >>> {{reg51, wire28}}) ^~ (-$signed(reg40)))};
          reg59 <= $signed(((7'h43) >>> wire28[(4'hd):(2'h2)]));
          if ((~{$signed((reg48 ^ $unsigned(reg42))),
              $unsigned($signed($signed((8'hb2))))}))
            begin
              reg60 <= $signed($signed(reg40[(3'h4):(2'h3)]));
              reg61 <= $signed(reg53[(1'h1):(1'h1)]);
              reg62 <= $unsigned((wire21 != wire32[(2'h2):(1'h1)]));
              reg63 <= ($unsigned($unsigned(((reg59 - (8'hb2)) > (reg40 < reg35)))) ?
                  ($unsigned(((reg51 <= reg45) <<< $unsigned(reg33))) ?
                      ((wire54 * (8'ha5)) ?
                          (~|wire20[(1'h0):(1'h0)]) : (-$signed(reg47))) : reg50[(3'h5):(2'h3)]) : wire20);
            end
          else
            begin
              reg60 <= reg27;
            end
        end
      else
        begin
          if (({$unsigned(wire32), (^($unsigned((8'ha1)) != (|reg59)))} ?
              $signed((&$signed($signed(wire56)))) : $unsigned($signed(reg37[(4'hc):(4'h8)]))))
            begin
              reg58 <= $signed($unsigned(reg59));
              reg59 <= $signed({$signed($unsigned((~&reg63))),
                  (($signed(reg41) >= (wire26 ? reg51 : wire22)) ?
                      $signed((wire30 ?
                          reg53 : reg53)) : ((&reg45) & {wire22}))});
              reg60 <= (8'hb7);
              reg61 <= (($unsigned(reg53[(1'h1):(1'h0)]) ? reg48 : reg39) ?
                  $signed((|(|$signed(reg63)))) : $unsigned((+(!reg62))));
              reg62 <= ((($signed($signed(reg36)) ?
                      $signed($signed(reg40)) : reg62[(4'hb):(4'ha)]) ?
                  $unsigned(reg51) : wire29) - $signed(wire54[(5'h12):(3'h7)]));
            end
          else
            begin
              reg58 <= $signed({wire20});
              reg59 <= $unsigned(({$unsigned((reg43 ? reg45 : wire25)),
                  ($signed(reg41) * $unsigned(reg40))} ^ {$unsigned($signed(reg40)),
                  {{wire25, (7'h43)}, reg27}}));
              reg60 <= reg42;
              reg61 <= ((~|({$signed(wire57), (wire31 || reg60)} ?
                      $signed({(7'h41), wire24}) : $signed(((8'hae) ?
                          reg27 : reg35)))) ?
                  ($unsigned((^~{wire31})) ?
                      ($unsigned((reg34 != reg37)) >= (^~(+reg43))) : {(wire23 ?
                              (-reg40) : $signed(wire54))}) : $unsigned(reg41));
              reg62 <= (&reg50);
            end
          reg63 <= $unsigned($signed(({$signed(reg47), {wire28}} ?
              reg33[(2'h3):(1'h0)] : wire28[(4'h8):(4'h8)])));
          reg64 <= $signed(reg33);
          reg65 <= ((reg61 ?
              (reg46[(5'h12):(3'h7)] & (reg45 && reg34[(4'he):(4'ha)])) : $unsigned(wire22[(4'hc):(4'hc)])) && reg62);
        end
      if ($unsigned(wire20))
        begin
          reg66 <= wire32;
        end
      else
        begin
          reg66 <= ((~^(~(reg53 ?
                  ((7'h42) ? reg49 : wire26) : (wire25 ? reg35 : wire55)))) ?
              reg33[(4'ha):(4'h9)] : reg44[(5'h11):(4'he)]);
        end
      if ($signed(($signed($signed((wire25 ? wire24 : reg48))) ?
          wire23[(1'h0):(1'h0)] : $unsigned((8'ha3)))))
        begin
          reg67 <= reg61;
          reg68 <= (reg67[(3'h5):(1'h1)] ?
              (wire24 + (reg48 ?
                  ($signed(reg62) | $unsigned(reg50)) : (~|reg66[(5'h11):(4'he)]))) : ((!$unsigned({wire28,
                      reg35})) ?
                  reg33[(4'hd):(4'hd)] : reg64));
        end
      else
        begin
          if ($unsigned((&(reg58 >>> $unsigned({reg59})))))
            begin
              reg67 <= (+$signed(reg35));
            end
          else
            begin
              reg67 <= {($signed((~^$unsigned(reg50))) <= {reg53[(2'h3):(2'h2)],
                      reg53[(1'h1):(1'h1)]}),
                  ((-wire28) >= $unsigned($unsigned({reg66, reg59})))};
              reg68 <= reg39[(4'ha):(1'h1)];
            end
          reg69 <= wire55;
          if ((8'h9f))
            begin
              reg70 <= ((|(8'hbd)) ?
                  (wire30 ?
                      $signed((~|wire55[(2'h3):(1'h1)])) : ($signed($signed(wire31)) ?
                          $unsigned((wire31 ?
                              reg46 : reg49)) : $signed(wire55[(1'h0):(1'h0)]))) : ({reg33} ?
                      $signed($unsigned($signed(reg47))) : reg61[(4'h8):(1'h1)]));
              reg71 <= reg50;
              reg72 <= (8'hb7);
              reg73 <= $signed(((($unsigned(wire28) >> (~reg58)) ?
                      wire26 : wire28) ?
                  (wire30[(3'h6):(2'h3)] ^ reg36[(4'h8):(3'h7)]) : reg38));
            end
          else
            begin
              reg70 <= reg72;
              reg71 <= reg62;
              reg72 <= $signed(wire26[(2'h2):(1'h0)]);
              reg73 <= (reg59 ? (reg63 + reg60) : (^~(~&reg46[(4'hf):(4'h9)])));
              reg74 <= $unsigned($unsigned($unsigned($unsigned(reg66[(4'ha):(4'ha)]))));
            end
          reg75 <= (reg63[(4'h8):(4'h8)] ?
              $signed((!($signed(reg65) || (wire57 >= reg50)))) : (($signed($signed(reg67)) ?
                      $unsigned($signed(reg41)) : $signed({(8'ha9)})) ?
                  (~|{{reg44}}) : reg67[(1'h1):(1'h0)]));
          reg76 <= wire55;
        end
      reg77 <= wire55[(1'h0):(1'h0)];
    end
  assign wire78 = (($unsigned(wire28) >= ($signed({reg27}) <= reg62)) && (-(8'hb5)));
  assign wire79 = reg66[(4'he):(3'h7)];
  assign wire80 = (((+$signed((reg39 ? reg33 : reg68))) <<< ($unsigned(reg46) ?
                      wire31[(5'h11):(4'ha)] : ($unsigned(wire54) ?
                          (reg68 << (8'hac)) : $unsigned(reg44)))) >> reg37[(4'hd):(4'ha)]);
  assign wire81 = reg34[(4'hc):(4'h9)];
  assign wire82 = $signed(($signed((+(~&(8'hbb)))) == (^~$unsigned((wire29 ?
                      reg49 : wire21)))));
  assign wire83 = $unsigned((^reg40[(2'h2):(1'h0)]));
endmodule

module module118
#(parameter param143 = ((8'h9d) ^ {((((8'hb7) ? (8'ha2) : (8'hb2)) ? ((8'haa) * (8'hb2)) : (^(8'ha2))) ? (~^((8'ha3) ? (8'hba) : (7'h41))) : (8'ha3))}), 
parameter param144 = (^param143))
(y, clk, wire123, wire122, wire121, wire120, wire119);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire123;
  input wire signed [(4'h9):(1'h0)] wire122;
  input wire signed [(4'h9):(1'h0)] wire121;
  input wire [(5'h11):(1'h0)] wire120;
  input wire [(4'hd):(1'h0)] wire119;
  wire signed [(5'h15):(1'h0)] wire130;
  wire [(4'h9):(1'h0)] wire129;
  wire [(5'h10):(1'h0)] wire128;
  wire signed [(5'h14):(1'h0)] wire127;
  wire [(4'hd):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire125;
  wire signed [(4'hc):(1'h0)] wire124;
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
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
                 (1'h0)};
  assign wire124 = $unsigned($signed(($unsigned((wire119 ? wire121 : wire121)) ?
                       ($signed(wire122) <= ((8'h9c) || (8'had))) : {wire120[(4'hb):(4'hb)],
                           (wire120 | wire120)})));
  assign wire125 = (wire120 < {{wire123[(4'hd):(3'h7)]}});
  assign wire126 = $unsigned(wire123[(3'h4):(1'h0)]);
  assign wire127 = $unsigned($unsigned($unsigned(((~&wire126) ?
                       $signed(wire120) : ((8'hba) ? wire120 : wire126)))));
  assign wire128 = wire125;
  assign wire129 = $unsigned(wire122);
  assign wire130 = (wire119[(2'h2):(1'h0)] ?
                       wire128[(4'hc):(1'h1)] : $unsigned(wire123));
  always
    @(posedge clk) begin
      reg131 <= $unsigned(wire126[(3'h4):(2'h3)]);
      if ((8'haa))
        begin
          reg132 <= (wire126 < (^~$unsigned((+wire120[(5'h10):(2'h2)]))));
          if (wire120[(4'hb):(3'h4)])
            begin
              reg133 <= ({(wire126[(4'h9):(4'h9)] ?
                      wire127[(1'h1):(1'h0)] : {(wire125 ? wire123 : wire126),
                          (wire120 ? wire123 : wire127)}),
                  $signed({$unsigned(reg131)})} - $signed({(wire126 ?
                      (wire123 ? (8'hab) : wire130) : $unsigned(wire122)),
                  (wire120[(3'h7):(3'h5)] ?
                      (wire130 ? wire127 : wire125) : $signed(wire127))}));
              reg134 <= $signed((reg131[(4'ha):(1'h0)] ?
                  wire127[(3'h4):(3'h4)] : reg133[(5'h12):(2'h3)]));
              reg135 <= $unsigned(($unsigned(((~|wire123) ?
                  (+(8'ha0)) : wire122)) <<< wire123[(1'h1):(1'h0)]));
              reg136 <= {{{$unsigned(reg131[(4'ha):(4'h9)])}}};
              reg137 <= (wire123[(4'hf):(3'h7)] << (($signed((wire124 ?
                          wire121 : reg134)) ?
                      (reg133 ? wire121 : $unsigned(wire119)) : (8'ha6)) ?
                  wire119 : $unsigned($unsigned((wire125 | wire122)))));
            end
          else
            begin
              reg133 <= ((($unsigned((reg131 * reg135)) | $signed(reg131[(4'hb):(3'h7)])) != reg137[(1'h1):(1'h1)]) ?
                  ((^~reg132[(2'h2):(1'h0)]) ?
                      (^(~(wire123 ~^ wire120))) : $signed((-((8'hb6) ?
                          wire130 : reg134)))) : (^($signed((~^wire125)) & reg131)));
              reg134 <= (~&$signed({(reg135[(2'h3):(1'h1)] ?
                      wire120 : (wire127 <= (8'hb7))),
                  wire120[(1'h1):(1'h0)]}));
              reg135 <= ((wire126 - $signed(reg132)) == (((|{wire124}) > reg131[(4'hb):(1'h1)]) | $signed(wire126[(4'hb):(2'h3)])));
              reg136 <= wire121;
              reg137 <= $unsigned($signed($signed($signed((wire120 >> (8'ha4))))));
            end
          reg138 <= (8'hbc);
          reg139 <= wire127;
        end
      else
        begin
          reg132 <= wire130[(2'h3):(2'h2)];
          reg133 <= (~&(~&reg131));
          reg134 <= $signed($unsigned(reg134[(4'he):(2'h2)]));
          reg135 <= {($signed(wire126) <= $signed(reg137[(1'h0):(1'h0)])),
              (wire119 ?
                  {(^~$unsigned(wire119)),
                      $unsigned($unsigned(wire128))} : wire130)};
        end
      reg140 <= $signed(($unsigned((wire129 <= (~wire129))) << ((wire122 * $signed((8'hbb))) ^ $unsigned((wire122 ?
          wire119 : wire121)))));
      reg141 <= reg134[(4'h8):(2'h2)];
      reg142 <= wire129;
    end
endmodule
