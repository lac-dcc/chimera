module top
#(parameter param126 = (((~((~(8'ha4)) + ((7'h41) && (8'hb7)))) <= ((^~((8'hb1) ? (8'haf) : (7'h42))) ? {(~^(8'ha2)), (!(8'ha3))} : {(!(8'hbd)), ((8'h9d) ? (8'hb5) : (8'hb9))})) ? ((((+(8'ha2)) ? {(8'haa)} : {(8'hb8), (8'hb4)}) ~^ (8'hbd)) ^ (!{((8'hbf) ? (8'h9c) : (8'hbc)), (!(7'h40))})) : (((((7'h41) ? (8'hbb) : (8'ha9)) & ((8'hae) ? (8'ha4) : (8'ha1))) ^~ ({(8'hb6), (8'hb3)} + ((8'ha6) || (8'ha5)))) ? ((8'hbe) ? (|((8'ha6) ? (8'hb7) : (8'hae))) : ((~^(8'hb1)) ? ((8'hb3) ? (8'hab) : (8'h9c)) : ((8'ha3) ? (8'ha1) : (8'hbe)))) : (&(((8'hba) || (8'hb4)) | (^~(8'ha2)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire125;
  wire signed [(2'h2):(1'h0)] wire124;
  wire [(4'h9):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire122;
  wire signed [(4'hc):(1'h0)] wire121;
  wire [(3'h6):(1'h0)] wire120;
  wire [(4'h9):(1'h0)] wire118;
  wire [(5'h14):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire118,
                 wire21,
                 wire19,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = {wire0[(2'h3):(2'h2)], $signed({(^~{wire0, wire3})})};
  assign wire6 = $unsigned(wire4[(3'h4):(3'h4)]);
  module7 #() modinst20 (wire19, clk, wire6, wire4, wire3, wire1);
  assign wire21 = ($unsigned(($unsigned((wire2 ^~ wire6)) ?
                      (&$unsigned((8'ha7))) : (+wire2[(2'h2):(1'h0)]))) >> $signed(wire19[(3'h5):(2'h3)]));
  module22 #() modinst119 (.wire25(wire3), .wire26(wire0), .y(wire118), .wire23(wire5), .wire24(wire19), .clk(clk));
  assign wire120 = wire1;
  assign wire121 = (^~{(((wire5 <= wire6) ?
                           (|wire6) : wire3[(1'h0):(1'h0)]) < (^(wire2 ?
                           wire1 : wire5))),
                       (wire19[(4'h8):(3'h4)] >= (~|wire21))});
  assign wire122 = $signed($signed(wire2[(3'h5):(3'h5)]));
  assign wire123 = (!(!wire4));
  assign wire124 = ($unsigned($unsigned(wire1)) ~^ wire1);
  assign wire125 = wire123;
endmodule

module module22
#(parameter param116 = (!(~^((((7'h42) < (8'haa)) || {(8'hb3)}) ? {((8'hb8) >>> (8'h9c)), (|(8'hbf))} : ((^(8'hbe)) - ((7'h42) == (8'had)))))), 
parameter param117 = (|((+(!(-param116))) < (|(|{param116, param116})))))
(y, clk, wire23, wire24, wire25, wire26);
  output wire [(32'h21f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire23;
  input wire signed [(2'h2):(1'h0)] wire24;
  input wire signed [(2'h2):(1'h0)] wire25;
  input wire signed [(2'h2):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire115;
  wire signed [(4'hb):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire112;
  wire [(5'h14):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire77;
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire99,
                 wire79,
                 wire27,
                 wire28,
                 wire29,
                 wire34,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire77,
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
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 (1'h0)};
  assign wire27 = (-wire24[(1'h0):(1'h0)]);
  assign wire28 = wire25[(1'h1):(1'h0)];
  assign wire29 = wire24;
  always
    @(posedge clk) begin
      reg30 <= wire25;
      reg31 <= {{$unsigned(($signed(wire29) ? {wire28, wire24} : (-wire26))),
              ($unsigned($signed(wire26)) <<< {(wire24 ? wire27 : wire26)})}};
      reg32 <= ($signed($signed(((wire27 ? wire26 : (8'hb7)) ?
          wire25[(1'h1):(1'h1)] : wire25))) == $signed($unsigned(($signed(reg30) ~^ (^reg31)))));
      reg33 <= ($unsigned({{(!wire27), $signed(wire27)},
          $unsigned((~^wire27))}) << ((^~wire28) ~^ $unsigned((wire29 & (wire28 <= (8'ha9))))));
    end
  assign wire34 = (reg31[(4'h8):(4'h8)] ^~ ((((reg31 ?
                          wire26 : wire28) * wire28) < $signed($signed((8'ha4)))) ?
                      $unsigned($unsigned(wire23[(3'h6):(2'h2)])) : ((wire23[(1'h0):(1'h0)] ?
                              $signed(wire28) : wire27) ?
                          ((reg33 ? (8'hb3) : wire23) ?
                              (&reg30) : $unsigned((8'ha2))) : ((wire25 ?
                                  wire26 : wire23) ?
                              $signed(reg31) : $signed(reg33)))));
  always
    @(posedge clk) begin
      reg35 <= reg31[(1'h0):(1'h0)];
      if (wire34)
        begin
          reg36 <= $unsigned($signed($signed(((&reg35) * (|wire25)))));
          reg37 <= wire25[(1'h0):(1'h0)];
          reg38 <= $unsigned((&reg30[(2'h2):(1'h0)]));
          reg39 <= (({((reg38 != reg30) <<< (wire29 ? (8'ha6) : reg31)),
                  (reg37[(2'h3):(2'h2)] ?
                      (&wire23) : (~reg35))} < $signed($unsigned({reg32}))) ?
              reg36[(1'h0):(1'h0)] : (~^(-reg37[(5'h14):(5'h14)])));
          reg40 <= {(|($signed((reg38 ?
                  reg30 : wire28)) ^ reg36[(2'h3):(2'h3)])),
              (^~$unsigned(((^reg31) != $unsigned((8'ha1)))))};
        end
      else
        begin
          if (({wire25, (~$unsigned((^wire27)))} == {reg35}))
            begin
              reg36 <= $unsigned(reg38);
            end
          else
            begin
              reg36 <= (^(~^reg32[(2'h2):(2'h2)]));
            end
          reg37 <= $unsigned({$unsigned(((^wire24) ?
                  reg38 : ((8'had) ? (8'hb7) : reg36)))});
          reg38 <= ((reg32 < ($signed((wire34 ?
                  reg37 : wire23)) || ((wire25 ~^ reg35) ?
                  reg37 : $signed(reg32)))) ?
              ({reg32, ($signed(reg37) >= wire26[(1'h0):(1'h0)])} ?
                  (((wire23 ?
                      wire26 : wire27) ~^ wire23[(2'h3):(2'h3)]) > (wire34[(3'h5):(3'h4)] ?
                      (wire24 ?
                          wire29 : reg36) : $signed(reg37))) : {(~&(reg33 ?
                          wire34 : wire24))}) : $unsigned((+$unsigned(reg32[(3'h5):(3'h5)]))));
          reg39 <= (|($unsigned($unsigned((wire25 || wire26))) || $signed($signed($unsigned((8'h9f))))));
        end
      reg41 <= $unsigned(({((-reg37) ?
              {wire27, reg30} : $signed(wire24))} >= {reg39[(4'hb):(4'ha)]}));
      if (($unsigned(reg32) ?
          (wire23[(4'h8):(3'h5)] ?
              (reg32[(1'h0):(1'h0)] ^ (~^reg33)) : $signed((~|wire28))) : $unsigned(((8'ha4) ~^ $signed($signed(wire26))))))
        begin
          reg42 <= $signed({reg36});
          if ($signed($unsigned($unsigned({{reg38, reg42}, (reg37 ~^ reg40)}))))
            begin
              reg43 <= (reg37 ^ (reg30 == $signed((8'hbb))));
              reg44 <= (8'hb1);
              reg45 <= $unsigned((~($signed(reg32[(3'h4):(1'h0)]) ?
                  reg42[(4'h9):(1'h1)] : $signed(((8'h9c) | reg41)))));
              reg46 <= reg33;
              reg47 <= $unsigned(reg42);
            end
          else
            begin
              reg43 <= $signed((^(reg39[(3'h5):(2'h3)] - $unsigned((reg39 <= reg42)))));
              reg44 <= reg35;
              reg45 <= (($signed(wire24) ?
                      wire24 : ((reg46 * {(8'ha1), (8'hbe)}) ?
                          $signed((wire25 & reg44)) : (^~(wire24 >= reg43)))) ?
                  $signed((~|$signed($signed(wire25)))) : (wire27 ^ ((&{wire24}) ?
                      ($signed(reg43) ~^ wire34[(4'hb):(2'h2)]) : reg39)));
            end
        end
      else
        begin
          reg42 <= (7'h40);
          reg43 <= (!(((-$signed(reg41)) ~^ (^~(reg45 ?
              wire27 : wire29))) || (~&($unsigned(reg39) <<< $signed(reg35)))));
          reg44 <= reg42[(2'h2):(2'h2)];
          if ($signed($unsigned((($unsigned((8'hb1)) <= (~&(7'h40))) ?
              {(wire28 ? reg44 : reg39)} : reg41[(3'h5):(3'h5)]))))
            begin
              reg45 <= (wire24 ?
                  ($unsigned($signed(wire34[(1'h1):(1'h0)])) ?
                      $unsigned($unsigned((!wire25))) : ({$unsigned(wire25),
                          reg43} > $signed({(8'ha9)}))) : (wire34[(1'h1):(1'h1)] > reg38));
              reg46 <= $signed((8'ha5));
              reg47 <= {reg39};
            end
          else
            begin
              reg45 <= (reg42[(2'h2):(1'h1)] > (reg37[(3'h7):(3'h6)] ?
                  reg42 : reg44));
              reg46 <= (^(wire34[(3'h4):(1'h0)] >= (wire28[(3'h6):(2'h3)] ?
                  $unsigned((^~reg45)) : reg42)));
            end
          reg48 <= reg38;
        end
    end
  assign wire49 = reg33;
  assign wire50 = (+(~^$unsigned(wire26[(2'h2):(1'h0)])));
  assign wire51 = reg45[(5'h11):(4'hb)];
  assign wire52 = $signed(wire49[(1'h0):(1'h0)]);
  assign wire53 = ((^~(((wire50 <= (7'h40)) ~^ reg38) | reg38[(2'h2):(1'h1)])) ?
                      (^~wire23[(4'h9):(2'h2)]) : ((-({wire51, reg37} ?
                              reg45 : (wire27 ? (8'ha7) : (8'ha3)))) ?
                          reg45 : $signed((^(wire29 ? reg42 : wire24)))));
  assign wire54 = (~|{(|$signed(reg48)),
                      {$signed((~|wire27)),
                          {reg32[(2'h3):(2'h3)], (reg47 ? wire50 : reg30)}}});
  assign wire55 = wire29;
  module56 #() modinst78 (wire77, clk, reg36, reg35, reg41, wire23);
  assign wire79 = (wire23 < {(-(+$signed((8'had)))),
                      {(reg41[(4'h9):(2'h3)] ~^ (+wire50))}});
  module80 #() modinst100 (wire99, clk, wire52, reg36, wire55, reg42);
  always
    @(posedge clk) begin
      reg101 <= {wire34[(1'h1):(1'h0)]};
      if ((8'ha9))
        begin
          if ((+{$signed((~|(wire26 - wire26)))}))
            begin
              reg102 <= ($unsigned(reg41) ?
                  (($unsigned(reg40[(1'h0):(1'h0)]) << (wire28[(4'hc):(4'hb)] | $unsigned(reg31))) ?
                      {((wire25 ?
                              wire51 : wire50) < $unsigned((7'h42)))} : (~(((8'h9e) * wire99) << wire34))) : (|$signed($signed((reg47 ~^ wire50)))));
              reg103 <= {($signed(reg41) & $signed((~&(+wire27)))), reg40};
              reg104 <= reg45[(5'h11):(2'h2)];
            end
          else
            begin
              reg102 <= ((-reg37[(4'h8):(3'h4)]) + (($unsigned($unsigned(wire25)) ?
                      reg36 : ((8'hac) ?
                          $unsigned(reg33) : reg31[(1'h0):(1'h0)])) ?
                  $signed((~(~|reg32))) : ({{wire99, (8'hbe)}} ?
                      $signed((|reg38)) : (!$signed(reg101)))));
            end
          reg105 <= (|$unsigned(reg31[(4'h9):(3'h7)]));
          if (($signed($unsigned($unsigned($unsigned(wire51)))) ?
              ((8'hab) | ((^~(wire25 ? wire29 : (8'hb4))) ?
                  ($unsigned((8'hbc)) && (^reg32)) : $signed($signed((8'hb9))))) : $unsigned($signed(({(8'hb1),
                      wire49} ?
                  wire27[(1'h0):(1'h0)] : $unsigned(reg35))))))
            begin
              reg106 <= wire23[(2'h2):(2'h2)];
            end
          else
            begin
              reg106 <= {wire51[(3'h4):(1'h1)],
                  ($unsigned(($signed((8'ha5)) ?
                          $signed(reg46) : (wire23 ? wire23 : reg38))) ?
                      wire51[(5'h10):(4'hd)] : (^~$signed($signed(reg106))))};
              reg107 <= $signed(({$unsigned($unsigned(wire24)),
                  (-$unsigned(reg103))} >>> $unsigned($signed($signed(wire55)))));
            end
          reg108 <= $unsigned($signed((+{wire55[(3'h6):(1'h0)],
              ((8'hac) ? (8'ha6) : wire49)})));
          reg109 <= ({reg40[(1'h1):(1'h1)]} + {$signed((8'hbd)),
              ((8'haf) | (reg30 || (wire26 ? wire34 : wire50)))});
        end
      else
        begin
          if ((~|$signed((8'hac))))
            begin
              reg102 <= {wire27[(1'h1):(1'h1)]};
              reg103 <= $signed((wire49 ?
                  reg41[(4'hb):(3'h6)] : $signed(reg46)));
              reg104 <= ({reg108} ?
                  (~|((~|$signed(reg108)) <= (reg108[(1'h1):(1'h0)] >= (!(8'ha7))))) : ($unsigned((~$signed(reg47))) < wire55));
              reg105 <= {reg44};
              reg106 <= (8'hb2);
            end
          else
            begin
              reg102 <= wire26;
              reg103 <= wire77;
              reg104 <= reg40[(1'h0):(1'h0)];
              reg105 <= reg109;
            end
          reg107 <= $unsigned((8'h9d));
          reg108 <= $unsigned($unsigned((|$signed((reg108 > (8'hbb))))));
        end
      reg110 <= $unsigned((wire99[(4'he):(4'h8)] <<< (&(~|(reg48 || reg41)))));
    end
  assign wire111 = (^$signed((8'ha8)));
  assign wire112 = (&reg104[(1'h0):(1'h0)]);
  assign wire113 = {reg46};
  assign wire114 = wire53[(4'h8):(3'h5)];
  assign wire115 = (8'hb4);
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  assign y = {wire18, wire17, wire16, wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = ((-$unsigned((wire10 >= (~|(8'h9e))))) ?
                      wire10 : (^wire9[(4'h9):(3'h7)]));
  assign wire13 = {(-{(wire8[(4'ha):(4'h9)] || wire10[(2'h2):(1'h0)]),
                          $unsigned((^~wire11))}),
                      $signed($unsigned($signed((8'hb9))))};
  assign wire14 = (^~($unsigned((~|wire12[(5'h13):(4'h9)])) ?
                      {$unsigned($unsigned(wire12))} : (-wire8[(3'h4):(1'h1)])));
  assign wire15 = (^($signed(($unsigned(wire10) ? wire13 : (^~wire12))) ?
                      $unsigned($unsigned($unsigned(wire13))) : $signed((!$unsigned(wire13)))));
  assign wire16 = wire8;
  assign wire17 = ((~&wire12[(5'h11):(4'hb)]) * (wire12 ~^ (|($signed(wire9) ?
                      (^~wire15) : wire14))));
  assign wire18 = $unsigned(wire14[(1'h0):(1'h0)]);
endmodule

module module80  (y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire84;
  input wire [(5'h12):(1'h0)] wire83;
  input wire signed [(5'h11):(1'h0)] wire82;
  input wire signed [(2'h3):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire91;
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire92,
                 wire91,
                 reg93,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg85 <= $unsigned($signed($unsigned($signed((wire84 ?
          wire84 : wire82)))));
    end
  always
    @(posedge clk) begin
      reg86 <= $signed((|$unsigned(((-wire83) != $signed((8'ha7))))));
      reg87 <= $unsigned((^{reg85[(3'h4):(2'h2)]}));
      if ($unsigned($unsigned(((+(reg87 ? wire83 : reg87)) ?
          $unsigned($unsigned((8'h9c))) : (+$unsigned(wire82))))))
        begin
          reg88 <= (-(((-reg87) << $unsigned((wire82 ?
              reg87 : reg87))) && ((&$unsigned(wire81)) << reg86[(4'ha):(4'h9)])));
        end
      else
        begin
          reg88 <= (((wire81[(2'h3):(2'h3)] ?
                  ((reg86 ^ reg87) >= ((8'had) ?
                      wire81 : (8'hbd))) : reg88[(4'h9):(4'h8)]) & $signed($signed((^~wire82)))) ?
              $signed(reg88) : ($unsigned(wire82) ?
                  $signed($signed((wire83 & wire82))) : reg85[(3'h5):(3'h5)]));
          reg89 <= (&((wire81[(1'h0):(1'h0)] <= $unsigned(wire84[(4'hf):(4'hc)])) + $unsigned($unsigned($unsigned(reg88)))));
        end
      reg90 <= reg88[(4'h8):(3'h7)];
    end
  assign wire91 = (((wire84 < (8'hb4)) == $unsigned($unsigned((|reg89)))) ?
                      wire82 : $signed(wire81[(1'h0):(1'h0)]));
  assign wire92 = $unsigned(reg87[(3'h6):(1'h1)]);
  always
    @(posedge clk) begin
      reg93 <= (({(+(wire92 ? reg88 : (8'ha1)))} ?
          $unsigned(({(8'hb4)} ^~ (^wire84))) : wire83) >>> (-{reg89}));
    end
  assign wire94 = wire92[(3'h6):(1'h0)];
  assign wire95 = ($unsigned($signed(((wire84 ?
                          wire92 : wire94) && reg88[(5'h13):(4'h8)]))) ?
                      (|{((wire82 ^ wire81) ?
                              (~&reg90) : (reg90 ? wire83 : reg93)),
                          ({reg88} != (wire84 - (8'ha5)))}) : reg93[(2'h3):(2'h2)]);
  assign wire96 = ((+(^~wire83)) ? (!(~&reg87[(1'h1):(1'h1)])) : reg86);
  assign wire97 = {$unsigned($unsigned(({wire92} < $unsigned((8'hbb)))))};
  assign wire98 = $signed(wire81[(2'h2):(2'h2)]);
endmodule

module module56  (y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire60;
  input wire signed [(3'h5):(1'h0)] wire59;
  input wire [(5'h15):(1'h0)] wire58;
  input wire signed [(4'hc):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire61;
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire62,
                 wire61,
                 reg71,
                 reg70,
                 reg63,
                 (1'h0)};
  assign wire61 = (($unsigned($unsigned(wire59)) < ((|wire58) ?
                          (~&(^~wire59)) : $signed($signed(wire59)))) ?
                      (!wire59) : (~$signed($unsigned($unsigned(wire57)))));
  assign wire62 = $unsigned((^$signed($unsigned((wire59 >= wire58)))));
  always
    @(posedge clk) begin
      reg63 <= wire62[(1'h0):(1'h0)];
    end
  assign wire64 = {((reg63 + (!{wire61})) + {(wire60 | $signed(reg63))})};
  assign wire65 = ($unsigned((wire64 || $unsigned(wire57[(3'h7):(3'h5)]))) ?
                      wire59[(2'h3):(2'h3)] : (^wire57[(4'h9):(1'h0)]));
  assign wire66 = $signed((~(wire57[(4'hc):(4'h8)] ?
                      ((reg63 ? (8'hba) : wire57) ?
                          $signed(reg63) : wire61[(1'h0):(1'h0)]) : ((wire64 ?
                              reg63 : wire57) ?
                          (wire60 ? wire65 : wire58) : wire65))));
  assign wire67 = ((wire61 ?
                      wire58[(5'h14):(5'h12)] : $unsigned(wire62)) >> (8'hbc));
  assign wire68 = ((^wire57[(1'h0):(1'h0)]) == {{({wire60, wire67} ?
                              (wire66 >= wire67) : wire57[(2'h3):(2'h3)]),
                          ((wire64 ? wire66 : (8'hb8)) ?
                              (wire62 >= (8'hb6)) : $signed(wire59))}});
  assign wire69 = wire67[(4'hf):(3'h7)];
  always
    @(posedge clk) begin
      if (((wire66[(4'hb):(3'h5)] >>> (wire64 ?
              $unsigned((wire58 <<< wire59)) : ($unsigned(wire66) ?
                  {wire69} : (wire65 < (8'ha9))))) ?
          ((&wire65) ?
              {wire59,
                  ($unsigned(wire57) ?
                      (wire64 * wire60) : (wire64 ^ wire62))} : $unsigned(((+reg63) ?
                  (wire66 != wire57) : wire67))) : (^~(-$unsigned((wire61 ?
              wire67 : (8'h9f)))))))
        begin
          reg70 <= (+$unsigned({$signed(wire62), (8'h9f)}));
        end
      else
        begin
          reg70 <= (~^(((~wire61) ? reg70[(3'h6):(1'h1)] : reg63) ?
              $signed((|{wire67})) : wire60));
          reg71 <= (^~((~^reg63[(3'h5):(1'h1)]) ?
              $signed((wire57 <<< (|(8'hb7)))) : (8'hbe)));
        end
    end
  assign wire72 = $signed({reg71, $unsigned($unsigned($unsigned(wire58)))});
  assign wire73 = (8'h9f);
  assign wire74 = ({wire59,
                      (^~{$signed((8'hb8)),
                          $signed(wire73)})} << wire66[(4'hb):(4'h8)]);
  assign wire75 = $signed(reg63[(3'h5):(3'h5)]);
  assign wire76 = ((wire65[(2'h3):(2'h3)] ? wire72 : wire64[(1'h1):(1'h1)]) ?
                      $signed({((wire59 ? wire60 : wire68) ?
                              (~wire57) : (wire64 <= wire66))}) : $unsigned($signed(((wire72 ?
                              (8'hbd) : wire74) ?
                          (wire68 ? wire65 : wire64) : (wire74 + reg71)))));
endmodule
