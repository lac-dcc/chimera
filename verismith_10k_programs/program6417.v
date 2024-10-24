module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire131;
  wire signed [(4'hb):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire129;
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  assign y = {wire131,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire129,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = wire3[(3'h4):(1'h0)];
  assign wire5 = (-wire3[(2'h2):(1'h1)]);
  assign wire6 = $signed(($unsigned((-$unsigned(wire2))) ?
                     $signed((^{wire0})) : $signed({(|wire1)})));
  assign wire7 = (wire1[(3'h5):(2'h2)] ?
                     $unsigned((^$unsigned((~^wire5)))) : ($unsigned($unsigned($unsigned((8'haa)))) ^~ $unsigned({(wire1 ?
                             wire6 : wire2)})));
  assign wire8 = $unsigned($unsigned(wire1));
  assign wire9 = {($signed(wire7) <= ($signed($signed(wire7)) ?
                         {$signed(wire6)} : (wire2[(4'he):(3'h7)] | wire7[(3'h4):(1'h1)]))),
                     wire7[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      if (wire9)
        begin
          reg10 <= $signed(wire2);
          reg11 <= ((7'h40) * wire4);
          reg12 <= wire6;
          reg13 <= $unsigned(wire5[(2'h3):(2'h2)]);
        end
      else
        begin
          reg10 <= $unsigned(($unsigned(wire1) != {$unsigned(reg11[(4'h9):(2'h3)])}));
          reg11 <= $signed(($signed($unsigned((wire0 - reg10))) > wire3));
          reg12 <= wire4[(3'h4):(2'h2)];
        end
      reg14 <= (^$signed($unsigned((wire1[(1'h0):(1'h0)] >>> $signed(wire6)))));
      reg15 <= $signed(((&({wire6} >> (wire0 ?
          wire0 : reg10))) ^~ $signed((|$signed(wire5)))));
      reg16 <= $signed({($signed((wire8 ?
              wire7 : (8'ha7))) < (reg13 | {(8'hb8)})),
          (~^{wire5})});
      reg17 <= {$unsigned(wire8[(5'h11):(2'h3)])};
    end
  module18 #() modinst130 (.y(wire129), .wire19(reg16), .clk(clk), .wire20(reg17), .wire23(wire8), .wire22(wire1), .wire21(wire3));
  assign wire131 = $signed(((($unsigned(reg12) ?
                           (~wire0) : reg16[(1'h0):(1'h0)]) ?
                       ($signed((8'hb5)) ?
                           ((7'h43) ?
                               wire8 : reg14) : reg16[(4'ha):(3'h5)]) : ({wire129,
                               reg15} ?
                           (wire8 ?
                               wire1 : reg12) : reg10)) << {($unsigned(wire7) <<< $unsigned(reg10))}));
endmodule

module module18
#(parameter param127 = (({(~&{(8'hb8), (8'ha1)})} ? (({(8'h9e), (8'h9f)} ? ((8'hbf) != (7'h44)) : ((8'hb5) | (8'ha7))) > (((8'hb7) ? (7'h43) : (8'hb6)) ? {(8'hb1)} : ((8'hba) == (8'hab)))) : ((((8'ha9) == (8'hbc)) ? ((8'hac) == (8'ha4)) : ((8'ha7) ^~ (8'hae))) >>> (^{(8'hb5), (8'hbf)}))) ? ((({(8'ha1), (8'had)} & ((8'hbf) * (8'h9e))) ? (~|(&(8'hb6))) : (+(~^(8'hbf)))) & {(~^((8'ha0) ? (8'hbe) : (7'h44))), ((~|(8'hb1)) << (8'hb5))}) : (8'hb0)), 
parameter param128 = ((({param127} * param127) ? (-((param127 ? param127 : param127) ? param127 : (~^(8'hb3)))) : ((~(param127 ^~ (8'hac))) ? ((^~param127) ? (-param127) : {param127}) : ((8'hbe) << {param127, param127}))) && (param127 ^ ((((8'hba) ? param127 : param127) >= param127) << ((param127 ? param127 : param127) < (param127 >> param127))))))
(y, clk, wire19, wire20, wire21, wire22, wire23);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire21;
  input wire signed [(5'h14):(1'h0)] wire22;
  input wire [(5'h14):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire57;
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  assign y = {wire108,
                 wire106,
                 wire60,
                 wire59,
                 wire33,
                 wire57,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
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
      reg24 <= $signed((8'hb7));
      reg25 <= ($unsigned($signed(((^wire22) ?
              (wire21 ? wire22 : wire20) : (wire20 ? reg24 : wire22)))) ?
          wire21[(3'h7):(3'h5)] : (({$signed(wire20), ((8'hb1) & wire21)} ?
                  ((wire20 ? wire22 : wire21) ?
                      wire23[(2'h2):(1'h1)] : $unsigned((8'hb9))) : (~|{wire20,
                      wire23})) ?
              (reg24[(3'h5):(1'h0)] ?
                  ((reg24 ^ (8'ha6)) <= $signed((8'ha8))) : {(wire19 | wire20)}) : $unsigned($unsigned($signed(wire19)))));
      reg26 <= ($unsigned(reg25[(3'h6):(1'h0)]) < $signed(reg25[(2'h3):(1'h0)]));
      reg27 <= $unsigned((wire23[(2'h3):(1'h0)] * ({((8'hb2) ? reg24 : wire21),
              (wire23 ~^ reg24)} ?
          $signed(((8'hba) ~^ wire21)) : wire19[(3'h4):(1'h0)])));
      if (reg25)
        begin
          reg28 <= ($unsigned((-$signed(wire23[(5'h11):(2'h3)]))) <= $signed(wire20));
          reg29 <= $unsigned((&(+reg28)));
          reg30 <= {$signed(reg25)};
        end
      else
        begin
          reg28 <= reg26;
          reg29 <= reg30[(2'h2):(2'h2)];
          if (wire19)
            begin
              reg30 <= wire19;
              reg31 <= $signed(reg26[(2'h3):(2'h3)]);
              reg32 <= reg26;
            end
          else
            begin
              reg30 <= $signed(reg25);
              reg31 <= ((~^reg24) ?
                  ($unsigned((^wire21)) && wire22[(2'h2):(1'h0)]) : $unsigned((~reg32)));
            end
        end
    end
  assign wire33 = $signed(wire20[(1'h1):(1'h0)]);
  module34 #() modinst58 (.wire35(reg31), .wire37(reg30), .y(wire57), .wire36(wire23), .wire38(reg26), .clk(clk));
  assign wire59 = ($signed($unsigned((!(8'ha3)))) ?
                      reg26 : ((!(~^wire20)) ~^ ({reg29[(4'h9):(4'h9)],
                              reg25[(3'h7):(3'h7)]} ?
                          reg26[(3'h6):(1'h1)] : $unsigned((wire23 | reg28)))));
  assign wire60 = $unsigned(wire57);
  module61 #() modinst107 (.clk(clk), .wire62(reg26), .wire63(wire57), .wire66(wire23), .wire65(wire22), .wire64(wire60), .y(wire106));
  assign wire108 = $signed(wire20);
  always
    @(posedge clk) begin
      if ((8'hab))
        begin
          reg109 <= ((reg24 == (~&{$signed((8'ha5)),
              (wire59 ? wire33 : wire19)})) != (reg24 ?
              wire21[(3'h6):(3'h5)] : (8'haf)));
          reg110 <= (wire23[(3'h6):(1'h0)] ? reg24[(2'h2):(1'h0)] : wire21);
          reg111 <= wire21;
        end
      else
        begin
          reg109 <= reg31[(4'hb):(4'h9)];
        end
      reg112 <= {(~|($unsigned($unsigned(wire59)) ?
              wire23[(5'h12):(4'hd)] : $signed((reg28 ? reg24 : wire21)))),
          $signed($signed(reg32))};
      reg113 <= (wire23 ?
          wire57 : (($signed(reg26[(4'hc):(4'hb)]) & reg24[(3'h5):(3'h4)]) || (&(wire108 || reg25))));
      reg114 <= ({{($signed(reg32) + $unsigned((7'h42)))},
              (((8'h9d) & (reg112 | wire33)) != ((wire33 ^~ wire59) << $unsigned(reg24)))} ?
          wire33 : reg32[(3'h6):(3'h5)]);
      reg115 <= {(&$signed((|(-wire23))))};
    end
  always
    @(posedge clk) begin
      reg116 <= ($signed((reg26[(4'h9):(3'h5)] ?
          $signed($unsigned(wire20)) : reg110[(1'h0):(1'h0)])) <<< (~&$unsigned(reg114)));
      reg117 <= ($unsigned((8'hb5)) ?
          reg32[(4'hb):(4'h8)] : (($unsigned((&wire59)) & (|(wire22 ^ wire20))) > (~|($signed((8'hb5)) > (reg28 * (8'hac))))));
      reg118 <= wire57;
      if ((!reg111))
        begin
          reg119 <= ($signed($signed((&wire20))) >>> {wire19});
          reg120 <= (&(|reg30));
          reg121 <= (~|wire60[(2'h3):(1'h0)]);
        end
      else
        begin
          if (($signed(($signed($signed(reg31)) < ((reg26 <<< reg25) <<< $unsigned(wire21)))) >> $signed(wire59)))
            begin
              reg119 <= $unsigned(reg27);
              reg120 <= (($unsigned((reg29[(1'h1):(1'h0)] ?
                  wire108[(2'h2):(1'h0)] : {wire33,
                      reg32})) || (^~($signed(reg121) ?
                  {wire21} : (-reg110)))) | (wire108 ?
                  reg29[(3'h6):(3'h6)] : reg115[(2'h2):(1'h1)]));
              reg121 <= (!$signed(wire22[(2'h2):(2'h2)]));
            end
          else
            begin
              reg119 <= (($unsigned($unsigned($unsigned((8'hac)))) ?
                  $signed({((8'hb6) * wire23),
                      (wire57 ? wire21 : reg24)}) : (+reg113)) + wire106);
              reg120 <= $unsigned($signed(reg26));
            end
          reg122 <= (8'hbc);
          reg123 <= ($signed({({reg119, reg28} ?
                  ((7'h44) ?
                      reg29 : reg31) : $signed(reg121))}) >> ({reg111[(2'h3):(2'h2)],
                  wire19[(1'h0):(1'h0)]} ?
              reg28 : $signed((reg115 ^ $unsigned(wire21)))));
          if ((~^reg32[(4'hf):(3'h4)]))
            begin
              reg124 <= wire21[(2'h3):(1'h0)];
              reg125 <= ((~^(&reg123[(2'h2):(1'h1)])) & ($signed((+reg29[(4'h9):(3'h6)])) << (|wire20[(4'ha):(1'h1)])));
              reg126 <= reg125;
            end
          else
            begin
              reg124 <= (!$unsigned(wire20));
            end
        end
    end
endmodule

module module61
#(parameter param104 = {{((7'h42) || ((~&(8'hb8)) ? ((8'ha2) ~^ (8'hb6)) : ((8'hb9) ? (8'hb2) : (7'h44)))), {((!(7'h42)) | {(8'h9f)})}}}, 
parameter param105 = (~&((-((param104 * (7'h41)) < (param104 ? param104 : param104))) <<< ({(~^(8'ha7))} ? param104 : (^~(param104 ? param104 : param104))))))
(y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire66;
  input wire [(4'h9):(1'h0)] wire65;
  input wire [(3'h6):(1'h0)] wire64;
  input wire [(5'h12):(1'h0)] wire63;
  input wire signed [(4'hf):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire91;
  wire [(3'h6):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire [(3'h7):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire67;
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
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
                 reg87,
                 reg86,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire67 = {wire62[(4'h9):(3'h4)],
                      $unsigned($unsigned(wire64[(1'h1):(1'h0)]))};
  assign wire68 = $signed((|((wire62[(2'h3):(2'h3)] <<< {wire63}) != {(^~wire65)})));
  assign wire69 = wire65[(4'h9):(4'h9)];
  assign wire70 = wire68;
  assign wire71 = $signed(wire67);
  assign wire72 = ($unsigned(wire70[(4'hf):(4'hd)]) - ((|wire64[(3'h6):(2'h3)]) ?
                      {(wire63 <<< $unsigned(wire70))} : wire68));
  assign wire73 = (wire62 < (^wire62[(1'h0):(1'h0)]));
  assign wire74 = wire69;
  assign wire75 = $signed({(~$unsigned(wire69[(1'h0):(1'h0)])),
                      wire73[(4'hc):(3'h5)]});
  always
    @(posedge clk) begin
      reg76 <= (~&{wire70[(4'h8):(3'h7)]});
      reg77 <= ((wire69 ?
          wire67[(1'h0):(1'h0)] : (-({wire72, wire64} ?
              $signed(wire68) : wire74))) <<< {wire75[(2'h2):(2'h2)]});
      reg78 <= $unsigned({reg77});
      reg79 <= (wire75 < $unsigned(wire73[(2'h2):(1'h1)]));
    end
  assign wire80 = (($unsigned((wire75[(1'h0):(1'h0)] ?
                              $unsigned(reg76) : wire71[(4'hd):(4'ha)])) ?
                          (!{$signed(wire65)}) : reg77[(3'h7):(1'h0)]) ?
                      (!(($unsigned(reg77) < (reg76 || reg79)) * $unsigned($unsigned(wire69)))) : reg76);
  assign wire81 = $unsigned($signed(wire66[(3'h7):(2'h2)]));
  assign wire82 = $signed($unsigned({(wire63 ? $signed(wire74) : {wire68}),
                      {$unsigned(wire68)}}));
  assign wire83 = {wire66};
  assign wire84 = (~&{(~&$unsigned((wire63 ? wire74 : wire62)))});
  assign wire85 = (8'haa);
  always
    @(posedge clk) begin
      reg86 <= (({$signed($unsigned(wire80))} != ($signed($signed((8'ha7))) == (-{wire73,
          wire65}))) ~^ wire68[(5'h14):(1'h0)]);
      reg87 <= (^$signed($signed((wire85[(3'h6):(3'h5)] || ((8'h9c) ?
          (8'hae) : wire73)))));
    end
  assign wire88 = (|(((reg79 < wire69[(1'h0):(1'h0)]) & $signed(((8'ha5) * (8'hbf)))) ?
                      ($signed($signed(wire63)) ?
                          (wire67[(1'h0):(1'h0)] != (^wire65)) : (wire71[(4'hf):(2'h3)] >= $signed(wire65))) : $signed((&wire75))));
  assign wire89 = ({wire85[(1'h0):(1'h0)]} ?
                      {($signed($signed(reg77)) ?
                              (!(reg87 ^ (8'ha4))) : (|$unsigned(wire64))),
                          reg77[(4'hc):(2'h3)]} : reg78[(1'h1):(1'h1)]);
  assign wire90 = wire72;
  assign wire91 = wire75;
  assign wire92 = {(wire82[(1'h1):(1'h1)] >= ((8'ha2) ?
                          wire88 : (reg86[(1'h1):(1'h1)] >>> wire63[(2'h2):(2'h2)]))),
                      {wire84[(3'h4):(2'h2)]}};
  always
    @(posedge clk) begin
      reg93 <= wire82;
      reg94 <= reg93;
      reg95 <= (^~(~wire89[(4'h9):(2'h3)]));
      reg96 <= $signed(wire84[(4'hd):(3'h5)]);
      if (((8'ha5) ? wire91[(3'h6):(3'h4)] : reg86))
        begin
          reg97 <= wire63;
        end
      else
        begin
          reg97 <= (8'hb5);
          reg98 <= wire75[(2'h2):(1'h1)];
          reg99 <= (~&wire74);
          if (($unsigned(($unsigned((8'hbf)) > wire80)) >>> (reg86 & {wire65[(1'h0):(1'h0)],
              (~^$signed(wire83))})))
            begin
              reg100 <= $unsigned(reg77);
              reg101 <= (wire73 ?
                  $unsigned($unsigned(((reg100 ? (8'h9e) : reg98) ?
                      $signed(wire88) : (&wire81)))) : (7'h43));
              reg102 <= wire90[(3'h6):(2'h3)];
              reg103 <= {$signed(wire85[(2'h3):(2'h3)])};
            end
          else
            begin
              reg100 <= wire68[(3'h7):(2'h3)];
              reg101 <= wire66[(1'h1):(1'h1)];
              reg102 <= $signed(((wire81 ?
                      reg98[(4'ha):(3'h4)] : (|wire71[(3'h6):(3'h6)])) ?
                  $signed($unsigned($unsigned((8'hbc)))) : reg100[(4'h8):(3'h4)]));
              reg103 <= $unsigned((wire85 >>> reg97));
            end
        end
    end
endmodule

module module34
#(parameter param56 = ({(((~|(8'had)) << ((8'haf) > (8'hbd))) <<< (&{(8'hbc), (7'h41)})), ((~((8'hb7) + (8'hbb))) ? (^(~^(8'h9d))) : (~&((8'hb4) ? (8'hb3) : (8'hb0))))} >>> ((^~(8'ha7)) ? (~^(^(^~(7'h41)))) : ((((8'hbe) < (8'hb1)) ? {(8'hb8), (7'h43)} : (8'ha3)) ? ((^(8'hbf)) ? ((8'hbe) ? (8'h9c) : (8'hb1)) : (8'ha8)) : ({(8'ha3)} < ((8'hb5) >= (8'hb1)))))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire38;
  input wire [(4'h8):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire49;
  wire [(2'h2):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire39 = ((~&{($unsigned(wire36) ?
                              $signed(wire36) : ((8'h9c) ? wire38 : wire38)),
                          ($unsigned(wire37) < $signed(wire36))}) ?
                      $signed($signed(wire35[(3'h7):(1'h1)])) : wire36);
  assign wire40 = (+wire36);
  assign wire41 = (wire36 || wire38);
  assign wire42 = $signed($signed(($signed((wire36 ? wire41 : wire41)) ?
                      wire40 : wire38[(2'h3):(1'h1)])));
  assign wire43 = wire39;
  assign wire44 = ($unsigned($unsigned(wire37)) ?
                      $signed($signed((~(wire35 ?
                          wire37 : wire42)))) : wire39[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg45 <= {(7'h43)};
      reg46 <= (~|$unsigned((reg45[(3'h7):(2'h2)] ?
          ((wire41 | wire43) == $unsigned(reg45)) : (-$unsigned(wire36)))));
      reg47 <= wire38;
      reg48 <= $signed($signed(wire39[(1'h0):(1'h0)]));
    end
  assign wire49 = (+(|(wire36[(3'h6):(2'h3)] ?
                      $signed(wire37[(2'h3):(1'h0)]) : reg45)));
  assign wire50 = {(^~(|(8'ha6)))};
  assign wire51 = $signed($unsigned((!$unsigned($signed(wire39)))));
  assign wire52 = $signed((wire36 ? reg48 : wire51[(3'h5):(2'h2)]));
  assign wire53 = {wire36[(4'h8):(3'h7)]};
  assign wire54 = (^~wire44);
  assign wire55 = $unsigned((wire37 * (~$unsigned((&wire35)))));
endmodule
