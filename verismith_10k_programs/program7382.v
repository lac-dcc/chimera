module top
#(parameter param134 = ((!({((8'hbe) ? (8'h9c) : (8'hb2)), (!(8'h9d))} <= ({(8'h9f)} ? (8'hb8) : ((8'ha5) ? (8'hbb) : (8'h9e))))) <= (!(-(((7'h41) - (8'ha7)) ? ((8'hb4) ? (8'ha8) : (8'hbc)) : ((8'ha9) + (7'h40)))))), 
parameter param135 = (^~(8'hb2)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire133;
  wire signed [(4'ha):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  assign y = {wire133,
                 wire131,
                 wire110,
                 wire89,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire4,
                 reg88,
                 reg112,
                 reg113,
                 (1'h0)};
  assign wire4 = (wire2 ? wire2[(4'he):(3'h7)] : wire3);
  module5 #() modinst82 (.clk(clk), .wire6(wire1), .wire9(wire2), .wire7(wire4), .y(wire81), .wire8(wire3));
  assign wire83 = (((|((~|wire4) ? (wire4 == wire1) : $signed(wire1))) ?
                      (wire81[(1'h1):(1'h0)] ~^ wire81[(2'h3):(1'h1)]) : wire81[(2'h2):(1'h1)]) + wire0[(2'h2):(1'h0)]);
  assign wire84 = (|((+wire83[(4'hc):(1'h1)]) ?
                      wire83 : {($signed(wire3) != wire81),
                          (|wire81[(2'h3):(2'h2)])}));
  assign wire85 = {$signed($signed((wire81 ? (^wire2) : (~&wire3))))};
  assign wire86 = $unsigned(wire1[(3'h7):(1'h0)]);
  assign wire87 = $unsigned(wire2);
  always
    @(posedge clk) begin
      reg88 <= (8'ha0);
    end
  assign wire89 = wire81;
  module90 #() modinst111 (.wire94(wire83), .wire91(wire2), .clk(clk), .wire93(wire89), .y(wire110), .wire92(wire4));
  always
    @(posedge clk) begin
      reg112 <= $signed({$unsigned(wire81)});
      reg113 <= (+$unsigned(($unsigned($signed(wire84)) >= ((~&wire4) ?
          {wire3} : wire1[(2'h3):(1'h0)]))));
    end
  module114 #() modinst132 (.wire115(wire3), .wire119(reg112), .wire117(wire84), .wire116(wire83), .wire118(wire110), .clk(clk), .y(wire131));
  assign wire133 = (wire131 || wire83);
endmodule

module module114
#(parameter param130 = (&(((~&((8'hbd) ^ (8'ha1))) ? (((8'hab) ? (8'hb5) : (8'hb4)) ? ((8'hab) >>> (8'h9d)) : ((8'hab) ? (8'hbd) : (8'hbe))) : (-(^(8'ha7)))) ? ((((8'ha9) == (8'had)) ? ((8'hab) <<< (8'haf)) : {(8'ha3)}) + (|(~|(8'hbb)))) : ((~&(8'hb0)) ? ((^(8'ha1)) && ((8'hbd) && (8'hb0))) : (8'hbd)))))
(y, clk, wire119, wire118, wire117, wire116, wire115);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire119;
  input wire signed [(2'h2):(1'h0)] wire118;
  input wire [(4'h9):(1'h0)] wire117;
  input wire signed [(5'h11):(1'h0)] wire116;
  input wire [(2'h3):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire129;
  wire [(4'hb):(1'h0)] wire123;
  wire signed [(4'he):(1'h0)] wire120;
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  assign y = {wire129,
                 wire123,
                 wire120,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire120 = $unsigned((~|(&({wire116} ? wire119 : (+wire116)))));
  always
    @(posedge clk) begin
      reg121 <= $unsigned($unsigned(wire117[(3'h7):(3'h5)]));
      reg122 <= ($unsigned((wire118 ~^ ($unsigned(wire115) & (!wire115)))) <= $unsigned(wire116));
    end
  assign wire123 = {(&$unsigned(reg121[(4'h9):(2'h3)])),
                       ($unsigned(((wire116 ~^ wire120) ?
                               (~&reg121) : reg121)) ?
                           ($unsigned(reg122) ^~ reg122) : ($signed($signed(wire120)) ?
                               reg122[(2'h3):(2'h3)] : ((wire115 ?
                                       (8'hbf) : wire115) ?
                                   ((8'hbb) * (8'hbb)) : (wire120 ?
                                       wire119 : wire118))))};
  always
    @(posedge clk) begin
      reg124 <= wire117;
      reg125 <= ($unsigned(reg122[(1'h1):(1'h0)]) | (!(reg122[(3'h5):(1'h1)] ?
          $unsigned({reg124}) : $signed($unsigned(reg122)))));
      reg126 <= $signed(((~|$unsigned($signed((8'hb5)))) >> (({(7'h40)} == $unsigned((8'hb2))) ?
          ($signed(reg124) || wire115[(1'h1):(1'h0)]) : reg122[(3'h4):(3'h4)])));
      reg127 <= {reg122};
      reg128 <= $signed((!(^(|(wire120 ? reg126 : (8'h9d))))));
    end
  assign wire129 = (+reg124);
endmodule

module module90  (y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire94;
  input wire [(3'h5):(1'h0)] wire93;
  input wire signed [(5'h10):(1'h0)] wire92;
  input wire [(4'h9):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire95;
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  assign y = {wire109,
                 wire96,
                 wire95,
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
                 reg97,
                 (1'h0)};
  assign wire95 = (!(~^($signed(wire94[(1'h0):(1'h0)]) ?
                      $signed(wire94[(1'h0):(1'h0)]) : wire91)));
  assign wire96 = $signed(wire91[(3'h7):(3'h7)]);
  always
    @(posedge clk) begin
      if ((($unsigned(wire92) >= ({$signed(wire96)} ?
          (^~$signed(wire96)) : $unsigned((wire93 ?
              wire94 : wire95)))) > $signed(wire92)))
        begin
          reg97 <= (wire96 - (((wire93 ?
                  wire96 : {wire91, wire95}) || $unsigned((wire95 ?
                  wire93 : wire95))) ?
              (~$unsigned($signed(wire91))) : (&{(wire93 * wire91)})));
          reg98 <= $unsigned(($signed((&$unsigned(wire96))) >>> $signed(((wire92 ?
                  (8'hbf) : wire91) ?
              wire93[(2'h2):(1'h0)] : $unsigned(wire96)))));
          reg99 <= wire91[(4'h9):(1'h1)];
          if (reg97)
            begin
              reg100 <= wire96[(1'h1):(1'h1)];
              reg101 <= wire96[(3'h4):(2'h2)];
            end
          else
            begin
              reg100 <= $signed((wire92 ? (reg97 >= wire94) : wire94));
              reg101 <= reg100;
              reg102 <= $unsigned((8'hb8));
            end
        end
      else
        begin
          reg97 <= ($signed(wire93) ?
              wire91 : {$unsigned({{reg100}, wire96}), wire95});
          reg98 <= (+wire95);
          reg99 <= ({(~^$unsigned($unsigned(reg99))),
              reg99} | $unsigned({wire91,
              ($unsigned(wire93) ? {(7'h42)} : (reg98 ? wire92 : wire94))}));
        end
      reg103 <= $signed(($unsigned($signed(reg100[(3'h7):(3'h5)])) ?
          (((reg102 ? reg99 : (8'hba)) ?
              reg100[(1'h1):(1'h1)] : $unsigned((8'hb4))) ~^ $signed((|wire92))) : {$unsigned(reg100),
              $signed($signed(reg97))}));
      reg104 <= (^($signed(wire94[(1'h0):(1'h0)]) & $unsigned($unsigned(reg98))));
      reg105 <= {($unsigned(((~^reg97) <= (reg101 ? wire91 : reg100))) ?
              ((reg99 ? (reg97 ? reg100 : wire92) : $signed(reg97)) ?
                  wire96[(3'h5):(3'h4)] : $signed((reg98 >> reg102))) : reg104[(1'h0):(1'h0)]),
          (8'h9c)};
      if ($signed(wire93[(3'h4):(2'h2)]))
        begin
          reg106 <= ($signed({((reg102 > reg97) >> (reg105 ? reg97 : reg98)),
              ((~|wire91) ?
                  $unsigned(wire94) : (^~reg99))}) > $unsigned({$unsigned((reg101 >> (8'ha9))),
              wire93[(3'h5):(3'h5)]}));
        end
      else
        begin
          reg106 <= ($unsigned((!$unsigned((wire96 ? reg103 : reg99)))) ?
              ($unsigned((|reg99[(1'h0):(1'h0)])) ^~ $unsigned((^~(wire92 ?
                  reg100 : wire91)))) : (reg97[(3'h4):(2'h2)] ?
                  $signed(($signed(reg106) ?
                      {(8'ha0),
                          reg101} : $signed(reg97))) : (-$signed((+reg98)))));
          if ($signed((~|(~(reg97 ? $signed(wire96) : $signed(reg106))))))
            begin
              reg107 <= (+(($signed({reg103, reg101}) ?
                      {(wire95 <= (8'hbf)), (^reg106)} : $unsigned((wire95 ?
                          reg101 : reg97))) ?
                  (($signed(wire92) ? {reg97} : (+reg101)) ?
                      wire95 : ($signed((8'ha3)) == $unsigned(reg101))) : reg98));
              reg108 <= $unsigned(wire94);
            end
          else
            begin
              reg107 <= ((~^(~|reg103)) || (reg101[(4'hd):(4'hd)] ?
                  ((&$unsigned(wire93)) ?
                      {reg106[(3'h6):(3'h6)],
                          $unsigned((8'hb7))} : $signed((reg106 >>> reg105))) : (((reg101 * reg103) ?
                      $signed(reg98) : reg107[(4'hd):(1'h0)]) ^ reg108)));
              reg108 <= $unsigned((((^~(!(8'ha6))) ?
                      (^$signed(wire93)) : $unsigned($unsigned(reg101))) ?
                  reg107 : wire93[(1'h1):(1'h0)]));
            end
        end
    end
  assign wire109 = $unsigned($unsigned((($unsigned(reg97) ?
                           (wire93 ? wire92 : reg101) : $signed(reg102)) ?
                       (!(&reg106)) : reg101[(4'hb):(4'hb)])));
endmodule

module module5
#(parameter param80 = (8'hb1))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire41,
                 wire40,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire10 = wire7[(4'he):(3'h5)];
  assign wire11 = ((wire6 - wire8[(3'h4):(1'h0)]) ?
                      wire7 : (~|wire8[(3'h5):(1'h0)]));
  assign wire12 = wire8[(1'h0):(1'h0)];
  assign wire13 = ((-({wire11, $signed((8'hb4))} ?
                          (~$signed(wire6)) : ((~&wire6) | {wire8}))) ?
                      (|(^$unsigned((wire9 ?
                          wire6 : wire6)))) : (((((7'h41) && wire8) ?
                          $unsigned(wire9) : (!wire10)) > wire11) > ($unsigned((wire10 ^ wire8)) ?
                          $signed((8'hbf)) : $unsigned({(8'ha2), wire7}))));
  assign wire14 = (wire10 == $signed(wire7));
  assign wire15 = wire13;
  always
    @(posedge clk) begin
      if ((&(wire13 ? (~wire13[(3'h4):(3'h4)]) : $unsigned((8'hb0)))))
        begin
          reg16 <= (wire13 ?
              (wire8[(1'h0):(1'h0)] <<< (((7'h43) ?
                      wire11[(4'h8):(2'h3)] : (-(8'hbe))) ?
                  (~&{wire7}) : {$signed(wire13),
                      (wire10 ? wire12 : wire13)})) : wire11[(4'hb):(3'h6)]);
          reg17 <= $unsigned(wire9[(4'he):(1'h0)]);
          if ($unsigned($signed(wire13)))
            begin
              reg18 <= $unsigned(reg16);
              reg19 <= wire9;
              reg20 <= (|$signed(reg16[(4'he):(4'hd)]));
            end
          else
            begin
              reg18 <= $unsigned(($signed(wire12) ?
                  (^wire10[(3'h4):(2'h2)]) : wire10[(4'h9):(1'h0)]));
              reg19 <= ((8'hb1) ~^ $unsigned($signed(wire12)));
              reg20 <= reg18;
              reg21 <= {wire7,
                  (wire7[(4'hd):(4'ha)] ?
                      $signed($signed((~wire7))) : ($signed(reg20[(3'h6):(2'h2)]) ?
                          ((+wire15) ?
                              wire11[(3'h5):(1'h1)] : (|(8'hbd))) : wire14))};
              reg22 <= $signed(wire9);
            end
          reg23 <= (((+$unsigned($signed((8'hb6)))) ?
                  ($unsigned(reg18[(1'h1):(1'h0)]) != (~&{(8'hb9)})) : {(&$signed((8'hb5))),
                      $unsigned((wire15 >= wire6))}) ?
              $signed(wire14) : (^$signed((~^(!(7'h41))))));
          reg24 <= $signed($signed(reg19[(2'h2):(2'h2)]));
        end
      else
        begin
          reg16 <= $unsigned({wire13[(4'hf):(3'h5)]});
          reg17 <= (~^{reg24});
          reg18 <= reg24;
          reg19 <= wire10[(3'h6):(1'h1)];
          reg20 <= wire11;
        end
      reg25 <= reg24;
      if (($signed(($signed($signed(wire7)) ?
              $signed($unsigned(wire6)) : reg21)) ?
          reg20[(2'h2):(2'h2)] : (8'h9d)))
        begin
          reg26 <= (~$signed(((-$signed(reg23)) * $signed((wire12 ?
              wire9 : wire14)))));
        end
      else
        begin
          reg26 <= (-(~|$unsigned($unsigned({reg21}))));
          if (((8'haa) ~^ (7'h41)))
            begin
              reg27 <= $unsigned(reg18);
            end
          else
            begin
              reg27 <= (&(((^~$signed(reg22)) >> {(reg20 ? reg17 : (7'h44)),
                  (~wire9)}) && (-($signed(wire15) - wire13[(5'h11):(1'h0)]))));
              reg28 <= $signed((reg21[(4'he):(4'ha)] ?
                  $signed({(reg26 ? reg27 : (8'hb1))}) : wire7[(4'h8):(2'h2)]));
              reg29 <= $signed($signed($unsigned(reg23[(4'hd):(2'h2)])));
            end
          if ($unsigned({$signed(reg29[(2'h3):(2'h2)]),
              $unsigned($unsigned((^~reg23)))}))
            begin
              reg30 <= $signed($unsigned($unsigned((wire8[(3'h5):(3'h4)] || reg24))));
              reg31 <= $signed((reg25[(3'h4):(1'h1)] ?
                  reg17[(3'h7):(1'h1)] : (($unsigned(wire6) ?
                          (reg30 < wire7) : reg18[(1'h1):(1'h0)]) ?
                      $signed(wire7) : ((8'haf) >>> (wire11 ?
                          reg30 : wire14)))));
              reg32 <= $signed((8'hba));
            end
          else
            begin
              reg30 <= (|$signed(reg25));
              reg31 <= (wire8 > reg16);
              reg32 <= reg17;
              reg33 <= (^(reg19 & (($unsigned(reg16) == (|reg21)) ?
                  wire7[(4'h9):(1'h1)] : $signed(reg17[(2'h3):(1'h1)]))));
              reg34 <= $unsigned(wire15);
            end
          reg35 <= $unsigned(reg34);
        end
    end
  always
    @(posedge clk) begin
      reg36 <= (&({reg19[(1'h1):(1'h0)], (~^((8'h9c) >= reg27))} ?
          ($signed(((8'h9c) & reg30)) == {(-(8'ha0))}) : ((|$signed(reg20)) ?
              $signed($signed(wire13)) : (reg34 ^ $signed(reg18)))));
      reg37 <= (($signed(reg27[(2'h2):(1'h1)]) ?
          reg19 : $unsigned((8'hb5))) || (~(^(+(wire13 <<< reg20)))));
      reg38 <= $unsigned($unsigned({reg30}));
      reg39 <= (~&{$signed(reg23[(4'h9):(2'h2)]),
          (~$unsigned($signed(reg17)))});
    end
  assign wire40 = $signed($signed(wire13[(4'ha):(2'h2)]));
  assign wire41 = (^~(reg36[(3'h4):(1'h0)] ?
                      reg36[(3'h4):(3'h4)] : $signed($unsigned((~wire7)))));
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned(((~&reg31) | reg17[(1'h1):(1'h0)])) | $signed({wire7,
          reg24[(1'h1):(1'h0)]}))))
        begin
          reg42 <= ((&($unsigned((^(8'hb0))) ?
              reg22 : ($signed((8'hba)) != wire41))) && (($unsigned((wire10 - reg29)) ?
                  ((reg19 ? reg31 : reg28) ?
                      (reg17 >> reg31) : reg39) : ((reg16 && reg28) ?
                      $unsigned(reg16) : (reg23 ? reg17 : reg33))) ?
              {((8'h9f) ?
                      wire10[(3'h7):(3'h6)] : ((8'ha3) >> reg26))} : $unsigned($unsigned(reg17[(1'h0):(1'h0)]))));
          reg43 <= $signed((^(!((&wire7) == {reg27}))));
          reg44 <= $unsigned($signed($unsigned($signed((reg24 & reg35)))));
          reg45 <= (~|reg29[(3'h4):(1'h1)]);
        end
      else
        begin
          reg42 <= (^(^~reg20[(2'h3):(2'h3)]));
          reg43 <= (((^reg30[(5'h10):(4'hc)]) & (~|$unsigned(reg37[(3'h6):(3'h6)]))) <<< $unsigned(wire6));
        end
      reg46 <= $unsigned(wire7);
    end
  assign wire47 = {{(~|$unsigned((8'ha3))),
                          (reg42[(4'hf):(2'h2)] ?
                              $signed(reg29) : $signed((wire15 ?
                                  reg25 : reg17)))}};
  assign wire48 = (~&{$unsigned($signed(reg46)), reg27[(2'h2):(1'h0)]});
  assign wire49 = reg24;
  assign wire50 = (wire13 ? reg27 : wire11);
  assign wire51 = $signed({($signed((|wire41)) < (^~wire14[(3'h4):(3'h4)]))});
  module52 #() modinst75 (wire74, clk, wire13, wire50, wire51, wire40);
  assign wire76 = (-($signed({$unsigned(reg27),
                      reg21}) - $unsigned((~wire13[(4'hf):(2'h2)]))));
  assign wire77 = reg31[(1'h0):(1'h0)];
  assign wire78 = {(((+$signed((8'ha1))) ?
                          $signed(((8'hb9) ?
                              wire48 : reg18)) : (7'h42)) || $signed(reg32))};
  assign wire79 = $signed((($unsigned(wire9) ?
                      wire77[(2'h2):(1'h1)] : reg25) < ($signed((reg26 == reg20)) ?
                      $unsigned((&reg25)) : (~^(~^(8'hb9))))));
endmodule

module module52
#(parameter param73 = ((({{(8'ha8)}} == (~&((8'hbf) << (8'ha0)))) ? {{(~&(7'h40)), {(8'haa)}}} : (+(&((8'ha1) ? (8'hb3) : (8'hab))))) ? {(!(!((8'hae) && (8'hae)))), (~|(((7'h42) * (7'h42)) > (!(8'hbb))))} : (((!{(8'hb1)}) ? (~^((8'ha4) >>> (8'hb4))) : {(-(8'hbf))}) - (8'ha4))))
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire56;
  input wire [(4'he):(1'h0)] wire55;
  input wire [(4'hc):(1'h0)] wire54;
  input wire [(5'h12):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire59,
                 wire58,
                 wire57,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire57 = (8'ha7);
  assign wire58 = (wire53 ?
                      $signed($unsigned(wire55[(1'h0):(1'h0)])) : $unsigned((|$unsigned($unsigned(wire53)))));
  assign wire59 = $unsigned(wire58);
  always
    @(posedge clk) begin
      reg60 <= wire53[(4'h8):(3'h5)];
      reg61 <= ($unsigned($signed((&(wire56 >>> wire53)))) ?
          ((-($signed((8'hb0)) >>> {wire59})) ?
              (-(^~(wire53 ? wire59 : reg60))) : (8'hbd)) : {$signed({(8'ha4),
                  (wire59 && wire55)})});
    end
  assign wire62 = $unsigned(((reg61 ? wire56 : {(|wire59)}) ?
                      wire56[(1'h1):(1'h0)] : $unsigned(reg61[(2'h3):(1'h0)])));
  assign wire63 = (8'hb8);
  assign wire64 = ((^((~|$signed(wire57)) ?
                      wire57[(4'ha):(2'h2)] : $signed(wire56))) >>> (^(reg60 ?
                      ((wire57 >> (8'hb5)) != {wire58}) : (((8'ha9) >> (8'ha2)) >>> wire53[(1'h1):(1'h0)]))));
  assign wire65 = $unsigned(($signed($unsigned((|wire54))) << (($unsigned(wire64) << wire62[(1'h1):(1'h1)]) & $signed((wire54 >> wire57)))));
  assign wire66 = (wire58[(4'ha):(2'h2)] ^~ (-(($signed((7'h40)) ?
                          $unsigned(wire54) : wire62) ?
                      ($signed(reg60) ?
                          (^wire54) : $signed(wire62)) : ($signed(reg61) >= (wire59 <<< wire59)))));
  assign wire67 = (($unsigned((wire66[(5'h10):(4'hd)] == wire57)) ?
                          (wire62 + wire65[(3'h6):(2'h2)]) : ($signed(((8'h9e) == wire64)) >= wire55)) ?
                      $signed({wire53[(3'h7):(3'h7)],
                          ((wire64 ? wire57 : wire62) | ((8'ha1) ?
                              wire62 : wire54))}) : $signed({$unsigned($signed(reg61)),
                          ((wire58 ? (8'ha9) : wire58) ?
                              $unsigned((8'haf)) : (reg60 ?
                                  wire55 : (8'haf)))}));
  assign wire68 = (|$signed(((8'ha6) ?
                      (7'h41) : ($signed(reg60) == (wire57 ~^ reg60)))));
  assign wire69 = wire67;
  assign wire70 = $signed({(|(wire58[(2'h3):(2'h3)] ?
                          (wire63 < wire69) : $unsigned((8'hbc)))),
                      $signed((-$signed(wire55)))});
  assign wire71 = (((8'h9d) ^ (~(8'hbc))) ?
                      wire56[(1'h1):(1'h0)] : {$unsigned($unsigned(wire69[(1'h1):(1'h1)]))});
  assign wire72 = wire63[(2'h2):(2'h2)];
endmodule
