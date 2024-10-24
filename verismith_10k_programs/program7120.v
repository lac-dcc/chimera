module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h289):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire125;
  wire signed [(3'h4):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire122;
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire4,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire21,
                 wire22,
                 wire23,
                 wire41,
                 wire42,
                 wire49,
                 wire50,
                 wire122,
                 reg5,
                 reg6,
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
                 reg29,
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
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 (1'h0)};
  assign wire4 = wire0[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg5 <= (($signed(wire3) ^~ wire1[(3'h5):(3'h4)]) ?
          wire1[(2'h3):(2'h2)] : (^$signed(wire3[(1'h1):(1'h1)])));
      reg6 <= wire1[(2'h2):(2'h2)];
    end
  assign wire7 = $signed($signed($signed(wire0[(4'he):(4'h9)])));
  assign wire8 = wire1;
  assign wire9 = ((~&(^$unsigned((wire8 ^ wire1)))) >= wire2[(4'hd):(4'h9)]);
  assign wire10 = wire8[(1'h1):(1'h1)];
  assign wire11 = wire3[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg12 <= (~^((!$signed((wire11 > reg5))) ?
          $unsigned({(+wire2)}) : $unsigned(wire7[(3'h4):(2'h2)])));
      reg13 <= reg6[(2'h3):(2'h3)];
      if ($unsigned($unsigned(($unsigned(wire2) ? wire10 : wire7))))
        begin
          if (reg12)
            begin
              reg14 <= ((wire11[(1'h0):(1'h0)] ?
                  (|reg12) : ((^~(reg12 ? wire11 : wire10)) ^ ((~&wire3) ?
                      $signed(reg5) : wire0[(4'hc):(1'h1)]))) >= wire3);
            end
          else
            begin
              reg14 <= (($unsigned(wire10) != reg5[(2'h3):(2'h3)]) > reg13[(4'hb):(3'h5)]);
            end
          reg15 <= ((wire11 ?
                  ((~$signed(wire11)) ?
                      {(wire2 == reg5)} : wire0[(3'h6):(1'h0)]) : (^($unsigned(wire1) | {wire11,
                      wire0}))) ?
              wire2 : {reg13, $unsigned(wire8)});
          reg16 <= $signed($unsigned(((!(~^reg15)) & wire4[(3'h5):(3'h5)])));
        end
      else
        begin
          reg14 <= wire10[(1'h0):(1'h0)];
          reg15 <= $unsigned({(!wire0)});
          reg16 <= (&$unsigned(($unsigned(wire4) ?
              (~|$signed(wire10)) : $signed((wire1 ^~ wire3)))));
          if (((|reg13) ?
              $signed((wire11 <<< (8'hb3))) : ((({reg14, wire7} * (^~reg6)) ?
                      (wire10 * (~|reg6)) : $unsigned((|(8'hac)))) ?
                  {{$unsigned(reg5)}} : {reg13[(3'h5):(2'h3)]})))
            begin
              reg17 <= $unsigned(wire3);
              reg18 <= $signed($unsigned(reg14));
            end
          else
            begin
              reg17 <= (^~reg6[(5'h13):(4'hf)]);
              reg18 <= (($unsigned({$unsigned(wire11)}) & reg15) ?
                  (~^(|(8'hb5))) : reg6[(4'hd):(4'h8)]);
              reg19 <= (((~wire11[(2'h2):(1'h0)]) ?
                  $signed(wire7) : wire8) < ((&$signed((&wire7))) | $unsigned({(8'hb2)})));
            end
          reg20 <= $signed($signed(reg5[(3'h6):(3'h6)]));
        end
    end
  assign wire21 = reg5[(4'hf):(3'h7)];
  assign wire22 = wire8;
  assign wire23 = {((($signed(reg17) ? (wire8 || reg16) : (wire4 >= wire2)) ?
                              (+$unsigned(reg6)) : wire3) ?
                          $unsigned((+wire21)) : wire8[(2'h3):(1'h0)]),
                      wire2[(3'h7):(1'h0)]};
  always
    @(posedge clk) begin
      reg24 <= $unsigned(($unsigned(wire23) ?
          $signed(({wire21} - $signed(reg14))) : {$signed((wire8 | wire1)),
              (reg19 < $unsigned(wire22))}));
      reg25 <= (reg13[(3'h5):(1'h0)] ? wire22 : (&(~&(~$unsigned(reg18)))));
    end
  always
    @(posedge clk) begin
      reg26 <= {($signed({(wire0 ?
                  reg16 : (8'hae))}) <= $unsigned({wire21[(3'h7):(3'h6)]})),
          ($unsigned((wire21 ^ reg6[(5'h13):(5'h12)])) ?
              wire7 : $unsigned(({wire3} ? $signed(wire2) : wire10)))};
      reg27 <= reg5[(2'h3):(2'h2)];
      reg28 <= ((reg5 ?
          reg25[(3'h5):(2'h2)] : reg17[(1'h1):(1'h1)]) ^ ((8'ha6) ?
          $unsigned((wire4 ? (reg13 + wire10) : reg18)) : reg20));
      if (reg28)
        begin
          reg29 <= $signed((8'h9e));
          if ($unsigned(wire9))
            begin
              reg30 <= reg16[(1'h1):(1'h0)];
              reg31 <= $unsigned(($signed(wire2[(5'h11):(4'hc)]) ?
                  reg16 : ($signed(wire11[(2'h3):(1'h0)]) ?
                      {((7'h40) >>> reg17)} : {$unsigned(wire22)})));
              reg32 <= (($signed(reg14[(2'h3):(1'h0)]) && wire10[(4'hf):(4'h8)]) - reg30);
            end
          else
            begin
              reg30 <= reg27;
              reg31 <= reg15;
              reg32 <= (reg17 < reg19);
            end
          if (wire0[(5'h10):(4'h8)])
            begin
              reg33 <= $signed(wire8);
              reg34 <= $unsigned(($signed(wire8[(3'h5):(3'h4)]) - wire23));
            end
          else
            begin
              reg33 <= (~&($signed(((8'hb6) ? $unsigned((8'hae)) : {(8'ha5)})) ?
                  {$signed($unsigned(wire7))} : $unsigned($signed({reg18,
                      (8'ha8)}))));
              reg34 <= wire4;
            end
          if (($signed(($signed({wire9}) ?
              (~(reg14 >>> reg24)) : $unsigned((-reg32)))) + $signed((+$unsigned((wire10 ?
              reg26 : reg25))))))
            begin
              reg35 <= ((&($signed(reg33[(4'ha):(3'h6)]) ^~ reg17)) > reg27[(4'hb):(3'h6)]);
              reg36 <= ($signed({$signed($unsigned(wire3)),
                  reg16}) - $signed((^wire11)));
              reg37 <= ((reg12 ?
                      $unsigned(((reg16 ? reg28 : wire22) ?
                          $unsigned(reg14) : wire7)) : $signed((((8'hac) >> wire7) ?
                          (reg24 >= wire0) : {reg27}))) ?
                  (^(reg16 ? $unsigned({(8'ha3)}) : reg18)) : (!wire1));
              reg38 <= reg29;
            end
          else
            begin
              reg35 <= reg13;
              reg36 <= reg12;
              reg37 <= reg37;
              reg38 <= ($unsigned(wire3[(2'h3):(2'h3)]) >= reg24[(3'h5):(1'h0)]);
              reg39 <= ((+$signed(reg18[(2'h2):(1'h0)])) >= $signed($signed($unsigned($signed((8'ha0))))));
            end
        end
      else
        begin
          reg29 <= (8'h9c);
          reg30 <= $signed($unsigned(wire10[(3'h6):(1'h0)]));
          reg31 <= (reg32 ?
              $signed(wire9) : ((wire11[(2'h2):(1'h1)] <<< reg17[(1'h0):(1'h0)]) ?
                  reg14 : wire11));
          if (($signed(reg38[(3'h6):(1'h1)]) - reg35))
            begin
              reg32 <= $signed(reg33);
            end
          else
            begin
              reg32 <= (((((reg12 <= reg26) ? $signed(reg6) : $signed(reg15)) ?
                      reg5 : (~wire4)) ^~ wire9[(2'h2):(1'h0)]) ?
                  reg38 : (-((&$signed(wire8)) >>> (^~(8'ha8)))));
            end
        end
      reg40 <= $unsigned(reg19[(1'h1):(1'h1)]);
    end
  assign wire41 = ((&wire23) + (~$unsigned($unsigned($signed((7'h41))))));
  assign wire42 = reg17;
  always
    @(posedge clk) begin
      reg43 <= ((!(({wire8} ?
              (wire8 ? (8'hb3) : (8'ha2)) : reg18[(4'hb):(3'h4)]) ?
          reg17[(2'h3):(1'h0)] : ($unsigned(reg18) ~^ ((8'hb8) >= reg5)))) * (reg25 | (reg16[(4'hd):(3'h4)] ?
          $unsigned($unsigned(wire41)) : wire23)));
      reg44 <= (8'ha0);
      reg45 <= (wire0[(3'h6):(1'h1)] ^~ $signed(wire22[(1'h1):(1'h1)]));
      reg46 <= $signed(($unsigned(wire22[(4'ha):(3'h4)]) && $unsigned((!$unsigned(reg13)))));
    end
  always
    @(posedge clk) begin
      reg47 <= ({$unsigned(wire3[(2'h3):(1'h0)])} ?
          ($signed({(|wire9)}) > (8'hbe)) : ({reg35[(3'h6):(1'h0)]} ?
              ((^~(~reg18)) & reg32[(4'h9):(2'h3)]) : (^$unsigned($signed((8'hba))))));
      reg48 <= $signed((({reg34} >= $signed(reg39)) ?
          reg35[(3'h5):(2'h3)] : $unsigned((wire10 ^~ {reg24, reg34}))));
    end
  assign wire49 = $unsigned(($signed(reg33[(1'h1):(1'h1)]) & reg29));
  assign wire50 = (reg34 ?
                      $signed(($unsigned(wire1) ?
                          (^wire1) : (+reg18))) : reg39[(3'h5):(3'h4)]);
  module51 #() modinst123 (wire122, clk, reg25, wire42, reg39, reg6);
  assign wire124 = wire122[(3'h4):(3'h4)];
  assign wire125 = reg6[(4'ha):(4'h9)];
endmodule

module module51
#(parameter param121 = (~^((((-(7'h41)) ? ((8'hb4) >> (7'h40)) : ((8'ha3) - (8'hb8))) ? ({(8'had), (8'hab)} ? ((7'h41) ? (8'hb7) : (7'h41)) : {(8'ha3), (8'haa)}) : ((7'h42) ? {(8'haf)} : (|(7'h41)))) | ((((8'hb6) | (8'hba)) ? {(8'hb1)} : ((8'ha8) ? (8'haa) : (8'hac))) ^~ (~|((8'hbc) + (8'h9c)))))))
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire55;
  input wire [(4'he):(1'h0)] wire54;
  input wire [(5'h15):(1'h0)] wire53;
  input wire signed [(5'h12):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire116;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire69;
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg118 = (1'h0);
  assign y = {wire116, wire84, wire82, wire69, reg120, reg119, reg118, (1'h0)};
  module56 #() modinst70 (.clk(clk), .wire60(wire55), .wire59(wire54), .wire61(wire53), .wire57((8'hb8)), .y(wire69), .wire58(wire52));
  module71 #() modinst83 (.wire73(wire53), .y(wire82), .wire75(wire54), .wire74(wire55), .wire72(wire69), .clk(clk));
  assign wire84 = ({(wire55 ^~ (wire55 ?
                              $unsigned(wire55) : (wire69 ^ (8'hb9))))} ?
                      (^wire55) : ($signed($unsigned((wire54 && wire82))) > $signed(((~|wire82) == wire82[(3'h4):(2'h3)]))));
  module85 #() modinst117 (wire116, clk, wire54, wire52, wire53, wire82);
  always
    @(posedge clk) begin
      reg118 <= wire69;
      reg119 <= ($unsigned($signed($unsigned((8'ha8)))) - $unsigned(wire54[(3'h5):(2'h3)]));
      reg120 <= (((&(~^(wire69 & wire69))) >= $unsigned(((~^wire69) ?
          $unsigned(wire84) : (wire82 ?
              wire82 : wire116)))) < ($unsigned({(wire55 >> (8'hb2))}) ?
          wire84 : (($signed(wire116) ? wire53[(5'h15):(3'h4)] : {(8'ha0)}) ?
              (((8'hb3) ? wire53 : reg119) ?
                  $unsigned(wire55) : wire53[(3'h6):(1'h0)]) : (+reg118[(2'h2):(1'h0)]))));
    end
endmodule

module module85  (y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire89;
  input wire [(2'h3):(1'h0)] wire88;
  input wire [(5'h13):(1'h0)] wire87;
  input wire signed [(5'h10):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire115;
  wire [(3'h7):(1'h0)] wire114;
  wire [(4'he):(1'h0)] wire113;
  wire [(3'h4):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
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
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire90 = ($signed($signed($signed((wire88 != (7'h40))))) << wire89[(3'h4):(1'h0)]);
  assign wire91 = wire90[(1'h0):(1'h0)];
  assign wire92 = $signed(wire90[(4'ha):(2'h2)]);
  assign wire93 = {wire91[(4'h8):(3'h7)]};
  assign wire94 = (($unsigned({$signed((7'h43)), wire93}) ?
                          ($unsigned((|wire86)) ?
                              $unsigned((wire88 ?
                                  wire87 : wire93)) : wire86[(2'h3):(1'h1)]) : {wire86[(5'h10):(3'h4)],
                              wire90}) ?
                      ($signed(wire93[(4'hd):(1'h0)]) <<< $signed(((|wire90) ?
                          (wire91 && wire93) : $signed(wire89)))) : wire91);
  assign wire95 = wire89;
  assign wire96 = wire91[(3'h6):(1'h0)];
  assign wire97 = (wire89[(2'h2):(1'h1)] << wire95);
  always
    @(posedge clk) begin
      reg98 <= $unsigned(wire89);
      reg99 <= wire89[(3'h7):(3'h7)];
      if (wire91[(3'h5):(1'h1)])
        begin
          reg100 <= (~|(wire91[(4'ha):(3'h4)] ?
              (&($unsigned(reg99) ?
                  (~&wire88) : $unsigned(wire93))) : $signed(((wire86 ?
                      reg98 : wire94) ?
                  {wire87, wire96} : wire96))));
          if ((wire91[(2'h2):(2'h2)] ?
              (&wire90[(4'hc):(3'h6)]) : $signed(($signed((wire94 ?
                      wire94 : wire90)) ?
                  wire89[(3'h6):(1'h1)] : $signed($unsigned(wire90))))))
            begin
              reg101 <= wire87[(4'hd):(4'hc)];
              reg102 <= wire91[(4'h9):(3'h5)];
              reg103 <= (+(wire90[(2'h3):(2'h2)] ?
                  $signed(((reg98 >= reg101) ?
                      (wire96 ?
                          reg98 : wire97) : reg102[(2'h2):(1'h0)])) : ($unsigned({(8'ha1),
                          wire88}) ?
                      (!reg100) : wire89)));
              reg104 <= ((({$unsigned((8'ha3))} ?
                      (reg100 ?
                          (wire89 ^ wire86) : reg103[(4'ha):(2'h2)]) : {wire93,
                          (~&(8'ha4))}) == reg100[(1'h1):(1'h0)]) ?
                  (reg100[(3'h4):(1'h0)] < $signed((|(wire87 ^~ reg100)))) : $unsigned(($signed($unsigned(reg102)) ?
                      {wire88[(2'h3):(2'h2)],
                          $unsigned(wire97)} : (reg99[(3'h6):(3'h5)] + (wire86 ?
                          reg103 : wire93)))));
              reg105 <= $signed((wire87[(4'he):(3'h5)] * $unsigned(($signed(wire93) * {wire96,
                  wire96}))));
            end
          else
            begin
              reg101 <= $signed(reg105[(3'h4):(1'h0)]);
              reg102 <= wire86[(4'hd):(2'h3)];
            end
          reg106 <= reg104;
          reg107 <= $signed($signed(((reg101 >>> (wire91 ? reg103 : wire88)) ?
              wire93[(4'h8):(4'h8)] : ((reg102 ? wire90 : reg98) ?
                  (wire86 <= wire92) : (+reg106)))));
        end
      else
        begin
          reg100 <= reg100;
          reg101 <= wire94[(3'h4):(2'h2)];
        end
      if ((({(wire95[(3'h6):(3'h5)] ?
                      (reg99 ? (7'h43) : wire93) : $unsigned(wire92)),
                  wire93} ?
              (^($signed(reg100) < wire94)) : (reg98 ?
                  wire92 : $unsigned($signed(wire91)))) ?
          (^$unsigned(wire93[(4'hc):(4'h8)])) : $signed((wire92[(1'h1):(1'h0)] != ($unsigned((7'h40)) ?
              reg107[(5'h10):(3'h7)] : (~reg107))))))
        begin
          reg108 <= (($unsigned($unsigned(wire92[(3'h5):(2'h3)])) ?
              ((|(8'haf)) ?
                  wire89 : $signed((~|wire91))) : $unsigned({$signed(wire89)})) || wire93);
          reg109 <= $signed($unsigned((-reg99[(3'h7):(3'h4)])));
          reg110 <= $signed($signed(wire88));
        end
      else
        begin
          reg108 <= $unsigned(reg100[(3'h4):(2'h3)]);
          reg109 <= (^(8'ha1));
          reg110 <= wire96;
          reg111 <= $signed(wire97);
          reg112 <= $unsigned($unsigned(reg104[(1'h1):(1'h1)]));
        end
    end
  assign wire113 = (~^$unsigned(reg105[(3'h4):(1'h0)]));
  assign wire114 = (($signed(($signed(reg99) ?
                       (wire91 | reg105) : (wire93 || reg111))) <= (^~reg107)) ^ ((^~{(reg107 ?
                               reg102 : reg101)}) ?
                       $signed(wire87[(3'h5):(3'h5)]) : (~^(((8'hb0) ?
                               reg105 : wire93) ?
                           (^~reg99) : reg111))));
  assign wire115 = $unsigned($signed($unsigned(({reg104, (8'ha8)} ?
                       (reg98 | reg107) : (reg107 ^~ reg110)))));
endmodule

module module71
#(parameter param80 = (({(+((8'hba) ? (7'h44) : (8'hb4)))} ? {(((7'h42) ? (8'haf) : (8'hb0)) ? ((8'h9f) ? (8'hab) : (8'h9f)) : ((8'hbf) ^ (8'haa)))} : (+(((8'hbc) ? (8'hb3) : (8'hb6)) == ((8'ha2) ? (8'hb6) : (8'hb4))))) != ((((-(8'hb0)) && ((8'ha2) + (8'h9e))) == (-((8'hb8) <= (7'h44)))) ? ((^{(8'h9c), (8'hbb)}) ? (((8'hba) + (8'hb2)) ? (~&(7'h42)) : ((8'ha8) && (8'hba))) : ((|(8'ha4)) & ((8'h9d) ? (8'hb1) : (8'h9d)))) : (((~&(8'haf)) ? {(7'h41)} : ((8'haa) ? (7'h43) : (8'h9f))) ? ((8'hba) ? (8'ha3) : (8'hac)) : (|((8'ha0) ? (8'ha2) : (8'hbd)))))), 
parameter param81 = ({(param80 && ((param80 ? param80 : param80) ? (^~(8'hb4)) : {param80}))} || ((|((-param80) ^~ {param80, param80})) ? param80 : param80)))
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire75;
  input wire signed [(5'h14):(1'h0)] wire74;
  input wire signed [(5'h13):(1'h0)] wire73;
  input wire signed [(4'hd):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  assign y = {wire79, wire78, wire77, wire76, (1'h0)};
  assign wire76 = $signed((8'hac));
  assign wire77 = $signed(wire76);
  assign wire78 = wire76[(4'hd):(4'h9)];
  assign wire79 = ((wire74 ?
                      $signed((((7'h43) ? (8'h9c) : wire75) ?
                          {wire74} : wire73[(4'h9):(1'h1)])) : ($signed((wire76 ?
                              wire73 : wire73)) ?
                          ($unsigned(wire74) && wire76[(2'h2):(1'h0)]) : ($unsigned(wire74) ?
                              (wire73 ?
                                  wire73 : wire72) : $unsigned(wire77)))) * $signed(((~^(~wire75)) - ((wire74 || wire73) & (wire72 ?
                      wire78 : wire78)))));
endmodule

module module56
#(parameter param68 = (((~(((8'ha2) ? (8'hb6) : (8'hb6)) ? ((7'h41) ? (8'ha9) : (8'h9f)) : ((8'ha2) <= (8'h9f)))) ^ (((+(8'hb6)) ^ (8'hb1)) & ((-(8'hbc)) - {(8'hae)}))) ? (~|(~^({(8'h9c)} ? ((7'h44) >= (8'ha3)) : (~|(8'h9c))))) : (((&((8'ha6) > (8'hbc))) - {((8'hb2) ? (7'h40) : (8'hb7))}) && ((|{(8'hb1), (8'haa)}) ? (^((8'hab) <= (8'had))) : {((8'hbf) ? (8'ha6) : (8'hb7))}))))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire61;
  input wire signed [(5'h10):(1'h0)] wire60;
  input wire signed [(4'he):(1'h0)] wire59;
  input wire signed [(5'h12):(1'h0)] wire58;
  input wire [(5'h14):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  assign y = {wire67, wire66, wire65, wire64, wire63, wire62, (1'h0)};
  assign wire62 = {{wire57[(3'h6):(1'h0)], wire60}};
  assign wire63 = $signed((~&$unsigned((wire58 ?
                      (wire59 ? wire62 : (8'hae)) : $signed((8'hae))))));
  assign wire64 = $unsigned((8'ha8));
  assign wire65 = (8'haf);
  assign wire66 = {(~(~&$signed((~&(7'h43))))), wire65};
  assign wire67 = (^wire64);
endmodule
