module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire147;
  wire [(5'h11):(1'h0)] wire146;
  wire [(4'he):(1'h0)] wire145;
  wire [(4'hf):(1'h0)] wire144;
  wire signed [(5'h11):(1'h0)] wire143;
  wire signed [(4'h8):(1'h0)] wire142;
  wire [(5'h11):(1'h0)] wire141;
  wire signed [(4'he):(1'h0)] wire140;
  wire signed [(5'h12):(1'h0)] wire139;
  wire signed [(4'hc):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire137;
  wire signed [(4'hd):(1'h0)] wire136;
  wire [(5'h11):(1'h0)] wire135;
  wire signed [(4'h8):(1'h0)] wire134;
  wire signed [(3'h4):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire107;
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg112 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire125,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
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
                 (1'h0)};
  module5 #() modinst108 (wire107, clk, wire2, wire4, wire1, wire0, wire3);
  assign wire109 = (|$unsigned(wire107));
  assign wire110 = $unsigned((wire107[(1'h1):(1'h0)] ?
                       wire4[(1'h0):(1'h0)] : ({$unsigned(wire2),
                           (&wire109)} * wire0[(4'h8):(1'h1)])));
  assign wire111 = wire4[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg112 <= (~^{wire4});
      reg113 <= ($signed($signed((^((8'hb3) <= reg112)))) <<< $unsigned({(8'ha8)}));
      if (wire3)
        begin
          if (($unsigned(($signed({(8'hbc), (7'h43)}) ?
              ((8'h9e) < $signed(wire0)) : {reg113,
                  (|(8'hb4))})) == (~$unsigned(((wire110 ~^ wire111) > $unsigned(wire4))))))
            begin
              reg114 <= {wire107[(4'h8):(3'h6)], $signed(wire1)};
              reg115 <= {reg113};
              reg116 <= wire111;
              reg117 <= $signed(($signed(wire3[(3'h7):(2'h3)]) ?
                  $signed(reg113[(1'h0):(1'h0)]) : ((wire0[(3'h6):(2'h3)] ?
                          (wire0 ? reg116 : wire3) : (reg112 ?
                              wire2 : (8'haa))) ?
                      ((+reg114) ?
                          (8'hba) : wire109[(3'h5):(2'h2)]) : wire107)));
              reg118 <= wire109;
            end
          else
            begin
              reg114 <= $signed(wire4[(4'h9):(3'h7)]);
            end
          reg119 <= ($signed($unsigned(wire0[(4'h8):(1'h0)])) ?
              wire0 : (~(!({(8'hb5), reg116} ?
                  $signed(reg116) : $unsigned(wire0)))));
          reg120 <= ((~^$signed((reg115 ?
              wire2 : $unsigned(reg116)))) | ($signed((8'hb1)) & $unsigned($signed((-reg112)))));
          reg121 <= ((($signed($signed((8'h9f))) > reg120[(1'h1):(1'h1)]) ?
                  wire110[(4'hc):(4'h8)] : $unsigned((8'hbd))) ?
              wire2[(5'h11):(2'h3)] : $unsigned((((&(8'hb4)) << $signed(wire2)) ?
                  (reg112[(3'h4):(3'h4)] ?
                      (wire1 << reg118) : {reg115, wire2}) : (reg118 ?
                      $unsigned(wire2) : $signed(wire109)))));
          reg122 <= $signed($signed({{wire4[(4'hd):(3'h6)]}}));
        end
      else
        begin
          reg114 <= (&($unsigned(wire2[(4'hd):(4'h9)]) ?
              (^wire111[(4'hb):(1'h0)]) : {$signed($unsigned(wire110))}));
          reg115 <= wire111[(4'h9):(3'h5)];
          reg116 <= wire110;
          reg117 <= reg117[(1'h0):(1'h0)];
        end
      reg123 <= reg122;
      reg124 <= ({($unsigned($signed(reg119)) * {reg112}),
          {$signed(wire2[(3'h7):(2'h2)])}} > (~&reg118[(4'h8):(1'h0)]));
    end
  assign wire125 = (~&$signed((8'hbb)));
  always
    @(posedge clk) begin
      reg126 <= ((8'haf) < (((8'hb3) ^ wire3) ?
          $unsigned((reg123 ?
              (~|reg116) : {reg113,
                  wire109})) : $unsigned($unsigned($signed((8'h9d))))));
      if (wire109[(2'h3):(2'h3)])
        begin
          reg127 <= reg115[(4'h8):(3'h6)];
          reg128 <= wire0[(1'h0):(1'h0)];
          reg129 <= $signed((8'hbe));
          reg130 <= $unsigned(wire3);
          reg131 <= reg115[(4'hf):(4'h9)];
        end
      else
        begin
          if ($signed($signed($unsigned({$signed(wire109),
              reg126[(1'h0):(1'h0)]}))))
            begin
              reg127 <= $signed($signed(reg117[(3'h4):(3'h4)]));
              reg128 <= ($signed((~^reg126[(4'he):(4'h9)])) || reg131);
              reg129 <= wire3[(4'h9):(2'h2)];
              reg130 <= $unsigned($unsigned(((^(|(8'haf))) & (~|reg116))));
              reg131 <= $unsigned($unsigned((reg124 ~^ reg126)));
            end
          else
            begin
              reg127 <= $signed($unsigned($unsigned(reg124)));
              reg128 <= (($signed(($signed((8'ha8)) >> (wire110 >> (8'had)))) ?
                      reg126[(4'hb):(4'ha)] : wire109) ?
                  $signed({$signed(reg128)}) : ((reg130[(1'h1):(1'h1)] ?
                      wire110[(3'h7):(2'h3)] : $unsigned(reg123)) >>> $unsigned((^~reg126[(3'h5):(3'h5)]))));
              reg129 <= (wire107[(4'ha):(4'h9)] ?
                  ((((+reg114) ?
                      $signed(reg126) : reg117) || reg121[(1'h0):(1'h0)]) - $signed($signed((-reg113)))) : (^~reg124[(4'hc):(3'h5)]));
            end
          reg132 <= reg117[(3'h4):(1'h0)];
        end
    end
  assign wire133 = wire111;
  assign wire134 = wire110;
  assign wire135 = reg128[(4'h9):(1'h0)];
  assign wire136 = (reg116 ? wire111 : {(-{(reg114 | (8'hbd)), (~&(8'ha2))})});
  assign wire137 = ((wire3[(3'h7):(3'h7)] ?
                       wire111 : (wire125 ^ ((8'hb3) ?
                           reg131 : $signed(reg132)))) + $unsigned((({wire133,
                           reg122} ?
                       ((8'hbf) ?
                           wire2 : reg115) : $signed(reg117)) ^ (reg122[(2'h2):(1'h1)] > (|wire110)))));
  assign wire138 = ((^($signed(wire136[(4'h8):(2'h3)]) <= (reg130[(1'h1):(1'h0)] < (reg116 ?
                           wire109 : wire110)))) ?
                       wire111[(4'hb):(4'h8)] : wire136[(4'ha):(3'h5)]);
  assign wire139 = $signed($unsigned(reg121));
  assign wire140 = ($unsigned(($signed((reg131 ? wire1 : wire111)) ?
                           reg131[(3'h7):(3'h6)] : $unsigned($signed(reg113)))) ?
                       {($signed($signed(wire0)) < $unsigned((wire138 ^ reg120)))} : ({({wire3} || wire107)} != wire2));
  assign wire141 = wire137;
  assign wire142 = $unsigned(wire1[(4'h8):(3'h4)]);
  assign wire143 = reg120[(4'h9):(3'h5)];
  assign wire144 = (-(7'h41));
  assign wire145 = wire140;
  assign wire146 = $signed((wire125[(4'hb):(3'h7)] | (reg121[(2'h2):(2'h2)] ?
                       reg122[(1'h1):(1'h0)] : $signed(reg116))));
  assign wire147 = ((({$unsigned((7'h40))} ?
                               $signed((reg131 >>> reg128)) : wire4[(2'h2):(2'h2)]) ?
                           $unsigned(((~reg112) ?
                               $signed(wire137) : (~^wire138))) : $unsigned($unsigned(wire3[(1'h1):(1'h0)]))) ?
                       ((wire3 <= ((~&reg113) - wire141)) ?
                           $unsigned(($signed(reg123) ?
                               wire142[(3'h7):(1'h1)] : (wire142 ?
                                   (8'h9d) : wire110))) : (reg114 < $unsigned(reg124))) : (^~((~|(wire1 >= reg116)) ^~ $signed(reg132))));
endmodule

module module5
#(parameter param105 = (^((({(8'hbd)} <<< (~(8'hab))) ? (((8'ha1) > (8'hb7)) ? (8'h9e) : {(8'hb1)}) : (((8'hbd) - (8'h9f)) ? ((8'hba) ? (8'hbe) : (8'ha4)) : ((8'hb6) >= (8'hba)))) ? ((^((8'ha6) + (7'h41))) & {(~^(7'h44)), ((8'ha2) && (8'hab))}) : ((((8'hb2) == (8'hbe)) ? (~&(8'hbc)) : ((8'hb4) * (7'h43))) - {(~(8'hba))}))), 
parameter param106 = (&((((~param105) >> (~|(8'ha9))) ^~ ({param105, param105} ? (^~param105) : (param105 <<< (7'h43)))) ? (({param105, param105} ? (param105 >> param105) : (+param105)) >>> ((^param105) || param105)) : param105)))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire6;
  input wire [(4'he):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire104;
  wire [(3'h4):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire102;
  wire signed [(4'ha):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire78;
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire98,
                 wire11,
                 wire12,
                 wire36,
                 wire78,
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
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = {$unsigned($signed($unsigned(wire8[(4'hc):(1'h0)])))};
  assign wire12 = $unsigned(((^(wire10 > wire9[(2'h2):(1'h0)])) ^ wire9[(3'h6):(2'h2)]));
  always
    @(posedge clk) begin
      if (($signed(wire6[(3'h7):(1'h1)]) ?
          wire9 : ((wire10[(3'h4):(3'h4)] > (((8'hb6) >> wire7) > (~|wire6))) <= wire8)))
        begin
          reg13 <= wire6[(4'h9):(2'h2)];
          if ($signed((&{$unsigned({wire10, wire9})})))
            begin
              reg14 <= wire11;
              reg15 <= wire8;
              reg16 <= wire12;
            end
          else
            begin
              reg14 <= $unsigned(($unsigned($signed(((8'hb2) ?
                  wire8 : wire10))) || reg13));
              reg15 <= $signed((~|(wire6[(4'hc):(3'h6)] ^ wire12[(1'h0):(1'h0)])));
            end
          reg17 <= wire7;
          reg18 <= ($signed(reg14) ?
              $signed($unsigned((&$unsigned(wire8)))) : wire12[(3'h5):(2'h2)]);
          if ($unsigned({wire7}))
            begin
              reg19 <= wire11;
              reg20 <= ($signed((&(reg17 ? wire12[(1'h0):(1'h0)] : (-reg13)))) ?
                  ((|((&wire8) != (wire9 ? (8'hbf) : reg19))) ?
                      ($unsigned($unsigned((8'h9d))) ^ (wire11[(1'h1):(1'h1)] ?
                          wire8 : $signed(wire6))) : (reg17[(3'h5):(1'h1)] + $unsigned(reg18))) : $unsigned($unsigned(reg18)));
              reg21 <= (~((wire9 ? $signed((wire8 ^~ reg13)) : {{reg13}}) ?
                  wire10 : ((~&(wire11 ? reg19 : wire9)) ?
                      (((8'hba) <= reg20) || (reg17 <= wire9)) : (^~$unsigned((7'h41))))));
              reg22 <= ($signed((reg17 ?
                      (reg19 ?
                          reg18[(1'h0):(1'h0)] : {reg15}) : (wire10[(4'h9):(3'h4)] < wire6))) ?
                  reg13[(3'h6):(3'h6)] : reg18);
              reg23 <= ((reg13[(1'h1):(1'h1)] & $unsigned({{wire11, reg13},
                  $signed(reg22)})) || (^reg22));
            end
          else
            begin
              reg19 <= reg15;
              reg20 <= $signed((+wire8[(4'hf):(3'h4)]));
            end
        end
      else
        begin
          reg13 <= ({($signed((-wire12)) + wire12), wire10} ?
              $unsigned({$unsigned(reg18)}) : $signed({{$unsigned(reg17)}}));
          reg14 <= wire7[(3'h6):(2'h2)];
          reg15 <= ($signed(reg18) <= ((^reg13) ?
              reg22 : wire7[(3'h6):(2'h2)]));
        end
      reg24 <= $unsigned($signed(($unsigned(reg18[(3'h4):(2'h2)]) | reg13)));
      reg25 <= (^reg16[(3'h7):(2'h3)]);
      if (($signed((reg23[(4'ha):(2'h2)] != ($signed(reg24) <<< reg21))) ?
          ({((reg19 ? (7'h40) : reg19) ? $signed(wire8) : wire7)} ?
              {$unsigned((reg14 ?
                      wire10 : wire12))} : ($signed(reg21[(1'h1):(1'h0)]) ^~ $signed($unsigned(reg13)))) : reg19))
        begin
          if (((wire9[(1'h0):(1'h0)] ? reg25[(2'h3):(1'h1)] : (~(^(~reg20)))) ?
              (&(~|reg23)) : wire12))
            begin
              reg26 <= (+$unsigned($unsigned(reg19[(1'h0):(1'h0)])));
            end
          else
            begin
              reg26 <= ($unsigned(((&reg23) ?
                      (&$signed(reg24)) : $signed(wire11[(1'h1):(1'h1)]))) ?
                  (($signed((wire12 <= (8'hbd))) >> (reg14[(3'h4):(2'h2)] ?
                          (~|wire8) : reg17)) ?
                      ({$unsigned(reg24),
                          (~reg16)} * $unsigned((reg15 != reg18))) : $signed(wire7[(3'h5):(1'h0)])) : {$unsigned((reg21 ?
                          (~&reg19) : (reg21 ? reg13 : (8'hbd)))),
                      {$unsigned(wire6)}});
              reg27 <= wire6;
              reg28 <= (~$signed(reg18[(2'h2):(1'h0)]));
            end
        end
      else
        begin
          reg26 <= wire9[(3'h5):(3'h4)];
          reg27 <= (wire12 ?
              {(reg24 & $signed(wire6[(2'h2):(1'h0)])),
                  reg25[(1'h1):(1'h1)]} : reg13);
          reg28 <= $signed((((|$signed(wire9)) ~^ (wire11 != $signed(reg23))) ?
              $unsigned($unsigned(reg27[(3'h6):(2'h3)])) : $signed($unsigned(reg27[(3'h4):(1'h0)]))));
          if ($unsigned($unsigned((~|(&((8'hae) || reg22))))))
            begin
              reg29 <= (((+(|(wire10 ?
                      wire11 : wire9))) || reg18[(3'h4):(2'h3)]) ?
                  $signed((8'ha5)) : (^~$signed({(|(8'ha4))})));
              reg30 <= reg20;
              reg31 <= $signed((reg23 ?
                  {(+wire7),
                      (reg18[(1'h0):(1'h0)] ?
                          reg23[(4'ha):(3'h5)] : (!reg28))} : ($unsigned((^~(8'hb5))) << ({(8'hb7),
                      reg26} == reg15))));
              reg32 <= $unsigned($signed($unsigned(reg31[(2'h3):(1'h0)])));
            end
          else
            begin
              reg29 <= $signed($signed(reg15[(1'h1):(1'h0)]));
              reg30 <= (reg22[(2'h2):(1'h1)] ?
                  ($signed(wire12[(3'h4):(2'h3)]) == $unsigned($signed(reg29[(1'h1):(1'h1)]))) : $signed(wire12[(4'hb):(1'h0)]));
            end
          if ($signed((reg22 ?
              ({$unsigned(wire6), (reg23 ? reg31 : reg22)} ?
                  wire10 : $unsigned((8'hac))) : reg15[(1'h0):(1'h0)])))
            begin
              reg33 <= reg29;
              reg34 <= $unsigned(reg18[(3'h5):(2'h2)]);
            end
          else
            begin
              reg33 <= $signed($signed((wire8 + $unsigned(((8'hae) - reg15)))));
            end
        end
      reg35 <= $signed($signed($signed({reg25})));
    end
  assign wire36 = (($signed($unsigned((reg29 ?
                      reg14 : reg18))) >> wire11) * $signed(($unsigned(reg21[(2'h3):(2'h3)]) > ((+reg32) | $unsigned(reg25)))));
  module37 #() modinst79 (.wire39(reg16), .wire40(wire6), .clk(clk), .y(wire78), .wire41(reg30), .wire38(reg27));
  module80 #() modinst99 (wire98, clk, reg35, reg13, reg15, reg24, reg34);
  assign wire100 = (reg15 & reg24[(2'h2):(1'h1)]);
  assign wire101 = (^~$unsigned(((reg19[(3'h5):(2'h2)] ?
                           $unsigned(reg26) : $signed(reg18)) ?
                       $signed((reg23 ? wire100 : reg18)) : {(reg28 ?
                               wire6 : (8'hbc)),
                           (+(8'haa))})));
  assign wire102 = $unsigned(($signed({(wire8 ? wire101 : wire36),
                           (reg28 | reg13)}) ?
                       (reg13 ?
                           reg15[(2'h3):(2'h3)] : ((reg14 ?
                               wire101 : reg31) | (~&reg33))) : $unsigned(wire78)));
  assign wire103 = reg26[(2'h2):(1'h0)];
  assign wire104 = wire102;
endmodule

module module80  (y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire85;
  input wire [(5'h14):(1'h0)] wire84;
  input wire signed [(4'h9):(1'h0)] wire83;
  input wire signed [(2'h2):(1'h0)] wire82;
  input wire signed [(4'hb):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire86 = wire85;
  assign wire87 = wire85[(2'h2):(1'h1)];
  assign wire88 = wire83[(3'h7):(2'h3)];
  assign wire89 = (^wire84[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      if ($unsigned((+(^(|(!(8'hb0)))))))
        begin
          reg90 <= wire84[(2'h2):(1'h1)];
          reg91 <= (~&wire87[(3'h7):(2'h2)]);
        end
      else
        begin
          reg90 <= reg91;
          reg91 <= ($signed((8'hbd)) < (^~$signed((wire87 ?
              wire84 : (reg90 <= wire83)))));
          reg92 <= wire88;
          reg93 <= (~|(wire88 ?
              ((-$unsigned(wire88)) & wire82) : $signed((~|reg91[(2'h2):(1'h0)]))));
          if ((+(($signed(wire87) && {$signed(wire81)}) ?
              ((wire84[(3'h6):(2'h3)] <<< ((8'hbf) ? wire87 : wire82)) ?
                  (wire84 ?
                      reg92 : reg92) : reg90) : $unsigned($signed((^~wire85))))))
            begin
              reg94 <= wire85;
              reg95 <= {reg90[(1'h1):(1'h0)]};
              reg96 <= {(8'hbf)};
              reg97 <= ((wire89[(1'h1):(1'h1)] ?
                      $unsigned((8'hb1)) : (((~^wire89) | wire87[(1'h1):(1'h1)]) <= $unsigned(((7'h43) > wire84)))) ?
                  $signed((~^(~^$signed(reg91)))) : {((~&reg93[(1'h1):(1'h1)]) >= ($unsigned(reg95) ?
                          (reg94 + wire84) : ((8'hb9) ? reg92 : wire86))),
                      $signed($unsigned(reg90[(2'h3):(1'h1)]))});
            end
          else
            begin
              reg94 <= $signed($unsigned($signed(((reg94 ?
                  reg90 : (8'h9d)) < (+wire82)))));
              reg95 <= wire89[(1'h1):(1'h0)];
            end
        end
    end
endmodule

module module37
#(parameter param77 = ((((((8'ha9) ~^ (8'ha6)) ? {(8'hba), (8'hb2)} : {(8'ha5)}) << (((7'h40) ? (8'hbc) : (8'hbf)) ? (!(8'hbf)) : ((8'ha6) ? (8'hbd) : (8'ha6)))) ? ((~|((8'hbf) ? (8'hab) : (8'hba))) << ((+(8'hb4)) & ((8'h9f) ^~ (8'ha0)))) : ((((8'hae) ? (7'h43) : (8'ha8)) ? (!(8'hb8)) : (~^(7'h43))) == (((8'hb9) > (8'hbf)) ? ((8'hb3) ? (8'haf) : (8'hbc)) : (~|(8'ha7))))) < (((&{(8'hbd), (8'haf)}) + {((8'ha3) ? (8'hb1) : (8'haa))}) ? (({(8'hb8), (8'h9e)} | {(8'hba)}) ? (~&(&(8'h9c))) : {(~&(8'ha0))}) : (!{{(8'ha0), (8'ha7)}}))))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h1ad):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire41;
  input wire signed [(3'h7):(1'h0)] wire40;
  input wire [(5'h14):(1'h0)] wire39;
  input wire signed [(5'h12):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire42;
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire63,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire44,
                 wire43,
                 wire42,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire42 = $unsigned(wire39[(3'h7):(3'h7)]);
  assign wire43 = $unsigned((!({(wire41 ?
                          wire41 : wire42)} <= wire41[(1'h0):(1'h0)])));
  assign wire44 = $unsigned($signed({(!{wire42})}));
  always
    @(posedge clk) begin
      reg45 <= ($unsigned(($unsigned((wire42 ? wire39 : wire44)) ?
          $signed({wire41}) : wire43)) << (~wire44));
      reg46 <= ((+({wire43, $signed(wire41)} ?
          {(reg45 ? wire40 : (8'hb0)),
              (wire42 > wire39)} : {$signed(wire42)})) * $signed((~wire40)));
    end
  always
    @(posedge clk) begin
      reg47 <= $unsigned((~(wire41[(4'ha):(2'h3)] ?
          (~^(!(8'hac))) : $unsigned((!wire44)))));
      reg48 <= reg47;
    end
  assign wire49 = $signed($signed((~|(&(~^(8'hab))))));
  assign wire50 = wire44;
  assign wire51 = (^(wire44[(3'h6):(3'h5)] - (~^$unsigned(((8'h9f) ?
                      reg45 : wire41)))));
  assign wire52 = (8'hbe);
  always
    @(posedge clk) begin
      if (((~&(!$signed((8'hb3)))) ?
          (&(~|(reg45[(1'h0):(1'h0)] ? reg48 : $unsigned(wire52)))) : wire44))
        begin
          reg53 <= (wire41[(3'h6):(3'h6)] ?
              ($unsigned((~|(wire44 ?
                  wire50 : (7'h43)))) && wire40) : ($unsigned((-wire40)) && reg46[(2'h3):(2'h3)]));
          if (reg47)
            begin
              reg54 <= wire44;
              reg55 <= ($signed(((~(reg53 ?
                      wire42 : (8'hb4))) * (wire51[(4'h8):(3'h6)] << ((7'h40) ?
                      wire39 : wire42)))) ?
                  wire39[(5'h10):(3'h7)] : ($unsigned({(&wire49),
                      (wire41 ?
                          reg45 : wire39)}) || ((8'h9d) > wire44[(3'h6):(3'h6)])));
            end
          else
            begin
              reg54 <= reg55[(2'h2):(1'h0)];
            end
          reg56 <= ((|(($unsigned(reg48) ?
                  (~|wire50) : (wire42 ? wire41 : wire42)) ?
              wire49 : $signed($signed(wire43)))) >>> $unsigned($unsigned(((reg47 ?
              reg55 : reg53) > $unsigned(wire38)))));
          reg57 <= wire42;
          if ($unsigned($unsigned(($unsigned((8'had)) <= {(wire52 ?
                  (8'hbc) : wire40),
              wire44}))))
            begin
              reg58 <= ((($unsigned((reg46 ?
                      reg55 : (7'h40))) < (reg54[(2'h2):(2'h2)] ?
                      wire40[(2'h2):(1'h0)] : $unsigned(reg55))) ?
                  $unsigned((8'ha2)) : (wire38 ?
                      $signed(wire52[(3'h6):(2'h2)]) : ((!wire49) != {(7'h44),
                          (8'ha6)}))) - {(wire42[(2'h3):(2'h3)] ?
                      $unsigned((reg47 + (7'h40))) : $signed(wire49[(4'hd):(4'ha)]))});
              reg59 <= (+((|(~&wire50[(5'h12):(5'h10)])) <= wire52[(3'h4):(1'h0)]));
            end
          else
            begin
              reg58 <= reg58[(3'h6):(1'h0)];
              reg59 <= reg47[(3'h7):(2'h3)];
              reg60 <= {{($signed((~^reg59)) >= $unsigned(wire50[(5'h13):(3'h6)]))}};
            end
        end
      else
        begin
          reg53 <= $signed((8'ha0));
          reg54 <= (reg58[(4'h9):(3'h4)] ?
              wire51[(4'h8):(3'h5)] : (-$unsigned($unsigned($unsigned(wire51)))));
        end
      reg61 <= $signed(reg45[(3'h4):(2'h3)]);
      reg62 <= reg54[(4'hb):(2'h2)];
    end
  assign wire63 = $unsigned((wire40[(3'h7):(3'h5)] ^~ $signed($signed((reg48 ?
                      reg56 : wire42)))));
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire43[(2'h2):(2'h2)])))
        begin
          if ({(($signed((~&wire40)) >> ((reg55 ? (8'hb7) : wire39) ?
                  $signed(wire52) : ((8'ha5) | (8'ha7)))) > ($signed((reg45 ?
                  wire50 : wire39)) <<< wire42)),
              (wire40[(1'h1):(1'h1)] || {{$unsigned(reg55),
                      reg47[(3'h7):(2'h2)]},
                  reg45[(2'h2):(1'h0)]})})
            begin
              reg64 <= wire43[(1'h0):(1'h0)];
              reg65 <= $unsigned($unsigned(reg56));
              reg66 <= wire39;
            end
          else
            begin
              reg64 <= wire50[(4'hf):(4'hc)];
            end
          reg67 <= (|wire40[(3'h6):(3'h5)]);
          reg68 <= ({reg46, {reg67[(3'h6):(1'h1)]}} ?
              $signed({$unsigned((reg60 ^ reg65))}) : ($signed($signed($signed((8'hb0)))) | wire51));
        end
      else
        begin
          reg64 <= ((reg66[(1'h0):(1'h0)] ?
              (+($signed(wire52) <= (reg47 ?
                  reg56 : reg45))) : ($signed((wire43 ? (8'hac) : wire51)) ?
                  ((wire41 ?
                      reg60 : reg48) ~^ wire63) : wire52)) + $unsigned($signed((-wire39))));
        end
      reg69 <= $unsigned(((-reg48) * ((|(reg45 ? reg55 : wire42)) ?
          ({wire44} > $unsigned((8'haa))) : $unsigned((reg59 ?
              (8'hb2) : reg64)))));
    end
  assign wire70 = ($signed(((!reg53[(3'h5):(2'h3)]) ?
                          $unsigned($signed(wire38)) : ((reg53 < reg57) ?
                              wire42[(2'h3):(1'h0)] : wire52))) ?
                      (({$unsigned(reg58), {(8'hb9)}} ?
                          (^~wire38) : (^(reg48 ?
                              wire40 : (7'h40)))) <<< reg65[(3'h6):(2'h2)]) : $signed((($unsigned((8'h9f)) == (reg59 | wire43)) + (reg48[(3'h4):(1'h0)] ^~ $signed((8'h9e))))));
  assign wire71 = $unsigned({((~^$unsigned(wire51)) ?
                          (!(reg64 ? reg64 : reg56)) : (~&(reg64 ~^ reg55))),
                      (~$unsigned(wire50[(3'h6):(2'h2)]))});
  assign wire72 = reg55[(2'h3):(1'h1)];
  assign wire73 = {{(~&((^wire39) ^ (&(8'had)))),
                          $unsigned($unsigned((~^wire44)))},
                      (+$unsigned(($signed(wire39) ^ (reg65 ?
                          reg53 : wire70))))};
  assign wire74 = (~&($unsigned((wire40 != (~reg48))) < wire38[(2'h3):(1'h1)]));
  assign wire75 = reg45;
  assign wire76 = (reg66[(3'h4):(1'h0)] ?
                      (wire63[(4'hc):(2'h2)] << $unsigned((wire73 ?
                          reg57[(2'h3):(2'h2)] : (~wire51)))) : {$signed((~^{wire63}))});
endmodule
