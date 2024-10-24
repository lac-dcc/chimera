module top
#(parameter param124 = (~{(-{((8'ha1) ? (8'had) : (8'hbc))})}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire123;
  wire signed [(3'h4):(1'h0)] wire121;
  wire signed [(4'h9):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire57;
  assign y = {wire123, wire121, wire60, wire59, wire57, (1'h0)};
  module5 #() modinst58 (wire57, clk, wire3, wire1, wire4, wire2, wire0);
  assign wire59 = wire57[(1'h1):(1'h0)];
  assign wire60 = (&$signed($unsigned((wire2 << (wire57 ? (8'h9d) : wire2)))));
  module61 #() modinst122 (wire121, clk, wire3, wire0, wire59, wire60);
  assign wire123 = $signed($unsigned({((wire0 ? wire1 : wire3) ?
                           $unsigned((8'ha8)) : wire121)}));
endmodule

module module61
#(parameter param120 = (((|({(8'hbb)} ? (!(8'hbc)) : ((8'hbc) >> (8'ha1)))) ? {((~|(7'h40)) >= (~(8'hbe)))} : (({(7'h43), (8'hb3)} ? {(8'hb6)} : (~(8'ha4))) != (((7'h41) ? (8'ha8) : (8'h9d)) ~^ ((8'hb7) + (8'haf))))) | (^~((((8'hb2) > (8'hb1)) ? ((8'hbb) ? (8'ha2) : (8'had)) : {(8'ha9)}) ? (((8'ha2) ? (8'ha8) : (8'hba)) & ((8'ha5) ? (7'h44) : (8'hb8))) : (((8'hb9) < (8'hb6)) ? ((8'h9d) | (8'h9f)) : ((8'hbb) && (8'h9f)))))))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire65;
  input wire signed [(5'h10):(1'h0)] wire64;
  input wire signed [(5'h13):(1'h0)] wire63;
  input wire signed [(2'h3):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire119;
  wire [(5'h11):(1'h0)] wire117;
  wire [(3'h5):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire87;
  wire [(4'hb):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire66;
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  assign y = {wire119,
                 wire117,
                 wire90,
                 wire89,
                 wire87,
                 wire68,
                 wire66,
                 reg67,
                 (1'h0)};
  assign wire66 = wire62;
  always
    @(posedge clk) begin
      reg67 <= wire65[(4'hc):(4'hb)];
    end
  assign wire68 = (&$unsigned(((~&wire63) ?
                      ({wire64} < wire63) : ($signed(reg67) ?
                          wire63 : wire63[(5'h10):(1'h1)]))));
  module69 #() modinst88 (wire87, clk, wire64, reg67, wire65, wire63, wire68);
  assign wire89 = wire66[(3'h6):(1'h0)];
  assign wire90 = wire89[(3'h5):(1'h1)];
  module91 #() modinst118 (.wire96(wire63), .y(wire117), .wire93(wire68), .wire94(wire89), .wire92(reg67), .clk(clk), .wire95(wire87));
  assign wire119 = wire117;
endmodule

module module5
#(parameter param56 = ((((((8'hab) >= (8'hb6)) ? ((8'hbb) ? (8'ha8) : (7'h40)) : ((7'h41) ? (8'ha5) : (8'h9f))) >>> (+((8'hb6) ? (8'hb8) : (8'hbf)))) + (8'h9c)) ^~ (|(~(((8'h9f) ? (8'hb3) : (8'ha0)) ? ((8'ha6) >= (8'hb2)) : (8'ha9))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire44;
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire47,
                 wire46,
                 wire44,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  module11 #() modinst45 (.wire14(wire8), .clk(clk), .wire12(wire6), .y(wire44), .wire13(wire10), .wire15(wire9));
  assign wire46 = {(wire10[(4'h9):(1'h0)] ?
                          $unsigned($signed($signed(wire9))) : wire10),
                      ((^($unsigned(wire6) >= ((8'hbe) & (8'hbe)))) ?
                          wire9[(4'hc):(4'h8)] : wire8)};
  assign wire47 = $signed((~&wire6));
  always
    @(posedge clk) begin
      reg48 <= wire47[(1'h1):(1'h0)];
      reg49 <= ({$signed(wire7[(3'h7):(3'h4)]),
              $signed($unsigned($signed(wire8)))} ?
          reg48[(1'h1):(1'h0)] : (~&$unsigned($signed(((8'h9f) ~^ wire8)))));
      reg50 <= $signed(reg48[(2'h2):(1'h0)]);
    end
  assign wire51 = {$signed($unsigned(((8'ha1) ?
                          (^~wire6) : $unsigned(reg50))))};
  assign wire52 = $signed($signed($unsigned(((reg50 ? wire7 : wire10) ?
                      (wire46 ? wire8 : wire7) : $unsigned((8'hbb))))));
  assign wire53 = (wire10[(4'hc):(3'h5)] ?
                      $signed((&wire52)) : (~^(({wire44} | ((8'hba) ?
                          wire6 : wire51)) <= wire47)));
  assign wire54 = {$unsigned($unsigned({wire6})), wire7[(2'h3):(1'h1)]};
  assign wire55 = (wire44[(2'h3):(1'h1)] < ($unsigned($signed((wire46 ^~ reg48))) != $unsigned((!$unsigned(reg48)))));
endmodule

module module11
#(parameter param42 = {{(({(8'hbe), (8'ha9)} - {(8'hb3), (8'ha0)}) ? (~((8'hb9) || (8'hb5))) : {{(8'hb4)}}), (~(((8'hb9) ^ (8'hb7)) >= {(8'hb6)}))}, (!({((8'ha6) && (8'hbf)), ((8'hbe) - (8'ha3))} ^ (((8'h9c) >> (8'hb6)) ? ((7'h40) ? (8'hb1) : (8'ha7)) : ((8'hba) ^~ (8'haf)))))}, 
parameter param43 = (~(~(!param42))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire13;
  input wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
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
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= wire14[(3'h4):(3'h4)];
    end
  assign wire17 = $signed($signed(wire15));
  assign wire18 = {((^(wire17[(1'h1):(1'h1)] < {wire15})) < (wire13[(3'h5):(1'h0)] ?
                          (wire14[(3'h7):(2'h3)] ?
                              (&(7'h41)) : $unsigned(wire17)) : wire17[(3'h4):(3'h4)])),
                      wire17[(3'h7):(3'h6)]};
  assign wire19 = ($signed((~|{$unsigned(wire12)})) ?
                      (~$signed(reg16[(1'h0):(1'h0)])) : (~^$signed(reg16)));
  assign wire20 = reg16[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg21 <= wire15[(4'h9):(4'h9)];
      reg22 <= (wire15[(4'ha):(3'h5)] ^ {({(wire17 ^ wire15),
              ((8'ha4) <= reg16)} ^~ ({wire20, wire15} ?
              $unsigned(wire19) : (wire13 > wire17)))});
      if (wire12[(1'h0):(1'h0)])
        begin
          reg23 <= wire15;
          if (((&{{wire14[(2'h3):(2'h2)]}, reg22[(1'h1):(1'h1)]}) ?
              (~$signed(reg16[(3'h6):(1'h0)])) : wire19))
            begin
              reg24 <= wire14[(4'ha):(1'h1)];
              reg25 <= ((!$signed(($unsigned(wire18) || (!wire20)))) > $signed({({(8'hbc),
                          wire19} ?
                      reg21[(4'hd):(4'hc)] : wire12[(2'h3):(1'h0)]),
                  ((wire18 ? reg16 : wire12) ?
                      {reg23} : (reg21 ? wire13 : (8'hbe)))}));
            end
          else
            begin
              reg24 <= (reg24 ?
                  ((8'hac) ?
                      $signed((wire18[(2'h3):(1'h0)] >> (8'had))) : $unsigned(((reg23 ^ reg22) != $unsigned(wire12)))) : (8'ha9));
              reg25 <= $unsigned((reg16[(3'h6):(1'h1)] | {(~|(reg23 ?
                      reg16 : wire19)),
                  (8'hbe)}));
              reg26 <= (8'had);
            end
          if (reg16[(1'h1):(1'h0)])
            begin
              reg27 <= ($signed((^~((^~wire15) < (reg22 ?
                  wire13 : reg24)))) > $signed((^~$unsigned($signed(reg23)))));
              reg28 <= ({reg25,
                  ($unsigned($signed(wire17)) >>> wire19[(5'h12):(1'h1)])} >> {(~{(reg27 ?
                          reg23 : (8'hb4)),
                      (reg24 != reg25)}),
                  ((-$signed(reg26)) < (~^$signed(reg16)))});
              reg29 <= wire14;
            end
          else
            begin
              reg27 <= ((reg23[(5'h12):(4'hc)] ?
                      $signed($signed(reg24[(1'h0):(1'h0)])) : $signed($signed($signed(reg22)))) ?
                  $unsigned((reg29[(2'h3):(2'h3)] <= {(reg21 ? reg29 : wire19),
                      reg28[(2'h3):(1'h0)]})) : (~&((^~(reg24 ?
                      reg28 : (8'ha4))) <= (~&(|wire17)))));
            end
          if ((~^$signed($signed(reg23[(3'h7):(2'h3)]))))
            begin
              reg30 <= reg24[(2'h3):(1'h0)];
              reg31 <= $signed(((($signed((7'h44)) ?
                  $unsigned(reg26) : (wire14 | reg16)) >>> (&wire13[(4'ha):(2'h3)])) < $signed((-(^reg26)))));
            end
          else
            begin
              reg30 <= ((|(({wire18, (8'ha9)} > ((7'h42) ?
                  (8'hb2) : wire20)) >>> reg24[(3'h6):(2'h3)])) == (~^{(8'hb5),
                  $signed((reg28 ? reg25 : (8'hbb)))}));
              reg31 <= ($unsigned(reg24) ? reg23 : $signed((8'hbf)));
            end
          reg32 <= reg30;
        end
      else
        begin
          reg23 <= wire12[(3'h4):(3'h4)];
          reg24 <= reg27;
          if ((^~$signed((reg16[(1'h0):(1'h0)] ?
              ((reg30 ?
                  wire14 : reg28) + reg22[(2'h3):(1'h1)]) : wire18[(1'h0):(1'h0)]))))
            begin
              reg25 <= {(8'hb1)};
              reg26 <= (-((((-reg25) ? {(8'hb5)} : reg30) ?
                      (~|$signed(wire18)) : reg27[(3'h7):(1'h0)]) ?
                  (-(reg25[(2'h2):(1'h1)] ?
                      {wire15,
                          wire17} : $unsigned(wire13))) : $signed((~$signed(reg28)))));
            end
          else
            begin
              reg25 <= (wire15[(2'h3):(2'h2)] ?
                  reg29[(1'h1):(1'h0)] : $unsigned({wire12[(1'h1):(1'h0)]}));
              reg26 <= (|reg28[(1'h0):(1'h0)]);
            end
          reg27 <= $unsigned(reg16[(3'h6):(3'h6)]);
          reg28 <= (~&($unsigned(reg24[(4'h9):(3'h5)]) ?
              reg29 : wire15[(1'h1):(1'h1)]));
        end
      reg33 <= (+$signed((^((|reg27) ?
          {(8'hb2), (8'hbb)} : (wire15 - wire18)))));
    end
  always
    @(posedge clk) begin
      reg34 <= (wire13[(3'h4):(1'h0)] ?
          ($signed((~(~(8'ha9)))) * $unsigned(wire15)) : (((|wire20) * reg28) << ($unsigned($unsigned(reg25)) & {(reg28 ~^ wire17)})));
      reg35 <= reg33[(2'h2):(2'h2)];
      reg36 <= reg30[(3'h7):(2'h3)];
      reg37 <= (({{(8'hb7)}} != $signed(reg23)) ?
          (~^($signed((reg25 ~^ wire12)) ?
              reg32[(4'h8):(1'h1)] : $unsigned(reg21[(3'h4):(2'h2)]))) : wire17[(1'h1):(1'h0)]);
      reg38 <= reg35;
    end
  assign wire39 = wire18;
  assign wire40 = $unsigned(reg25[(1'h0):(1'h0)]);
  assign wire41 = reg22[(2'h3):(2'h3)];
endmodule

module module91
#(parameter param115 = (((((+(8'hab)) <= (8'ha7)) ? ((~|(8'ha1)) ^ ((8'hb8) ^~ (8'hb6))) : (8'had)) ? (((&(8'ha9)) <<< {(8'hb0), (8'hbc)}) ^ (-(-(8'ha6)))) : {(((8'hbf) ? (8'hb0) : (8'hb2)) && ((8'hb8) ? (8'ha6) : (8'ha1)))}) ? ((((~&(8'hb2)) && {(8'hb0)}) >= (~&{(8'ha7), (8'hb8)})) ~^ ((((8'hba) != (8'ha6)) ? ((8'h9d) > (8'ha6)) : (&(8'hb2))) || ((-(8'hbf)) ? ((8'hb0) ? (8'h9e) : (8'ha0)) : {(8'ha2), (8'hac)}))) : ((^(8'ha3)) ? (|((~(8'hb8)) ? ((8'hb1) >= (8'ha0)) : (~|(8'hb5)))) : ((((8'h9d) * (8'h9c)) - (~(8'hbe))) ^~ {((8'ha6) ? (8'haa) : (8'h9e))}))), 
parameter param116 = ({((!param115) << param115)} <= param115))
(y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire96;
  input wire signed [(4'hd):(1'h0)] wire95;
  input wire signed [(4'hf):(1'h0)] wire94;
  input wire signed [(3'h4):(1'h0)] wire93;
  input wire signed [(4'h8):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire113;
  wire [(3'h6):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire97;
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire98,
                 wire97,
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
                 (1'h0)};
  assign wire97 = {(wire94[(4'ha):(2'h2)] == $unsigned((((7'h41) >> (7'h40)) ?
                          {wire96} : $unsigned(wire96))))};
  assign wire98 = wire93;
  always
    @(posedge clk) begin
      if ((($unsigned(($signed(wire97) + $signed(wire92))) ?
          (+($signed(wire96) ?
              (wire96 ?
                  wire93 : wire93) : wire95[(3'h4):(2'h3)])) : $unsigned($signed({(8'ha6)}))) << $signed(wire95)))
        begin
          reg99 <= ($signed(wire96[(3'h4):(2'h3)]) ?
              (((-{wire95, wire93}) << (wire97[(3'h4):(2'h2)] ?
                      wire95 : {wire94, wire97})) ?
                  $unsigned($signed((wire95 != wire98))) : (8'hb0)) : $signed(wire97[(3'h7):(3'h5)]));
          if ((|wire93[(2'h2):(1'h1)]))
            begin
              reg100 <= {($unsigned(wire97[(4'h8):(4'h8)]) ~^ $signed(wire93[(2'h2):(1'h1)])),
                  (+$unsigned({(~|wire93)}))};
              reg101 <= wire98[(3'h7):(3'h6)];
              reg102 <= (wire96 ?
                  reg100[(4'hf):(4'h9)] : wire92[(2'h3):(2'h3)]);
              reg103 <= $signed(($unsigned(wire92) ?
                  (wire95[(4'h9):(1'h0)] & (~|wire98)) : (^(~|$unsigned(wire95)))));
              reg104 <= {((reg101[(3'h7):(2'h3)] ?
                          $unsigned((wire93 <= (8'hbe))) : wire94[(4'hd):(4'h8)]) ?
                      (8'ha1) : ((^(8'haf)) ~^ ((|(8'hbc)) ?
                          reg99[(1'h0):(1'h0)] : (wire98 + reg99)))),
                  $signed(((wire94[(3'h7):(3'h5)] >>> $signed(reg100)) ?
                      reg102 : ($unsigned(wire95) ?
                          wire97 : ((8'h9d) >= wire92))))};
            end
          else
            begin
              reg100 <= $signed({((-reg100) ?
                      reg100[(5'h11):(4'hd)] : $signed(wire93)),
                  reg103[(5'h10):(1'h1)]});
              reg101 <= ($signed((((wire93 && reg101) ?
                          $signed(reg102) : wire95) ?
                      ((wire94 ?
                          wire94 : reg100) << $unsigned((8'hae))) : ($unsigned(reg104) ^~ $signed(reg100)))) ?
                  (~^$signed(wire92[(2'h3):(2'h3)])) : ((((^wire95) ?
                          $signed(reg104) : $signed(wire92)) >> reg103[(1'h1):(1'h1)]) ?
                      $signed((!(reg102 ? (8'hb7) : reg103))) : (+(7'h43))));
            end
          reg105 <= $signed(((({reg104, wire96} >> (~reg104)) ?
              ((8'hb4) <= $unsigned(wire93)) : (reg103[(4'hc):(1'h0)] ^~ reg102[(4'hc):(3'h5)])) && $signed(($unsigned(reg102) >> (|reg104)))));
          reg106 <= $signed(((wire96[(4'hc):(1'h0)] ?
                  {(wire97 + wire94)} : {reg100, $signed(reg100)}) ?
              $unsigned(wire97[(4'hd):(3'h7)]) : $unsigned(wire94)));
        end
      else
        begin
          reg99 <= {wire96};
          reg100 <= (reg103[(3'h5):(1'h0)] + $signed($signed(wire93)));
          reg101 <= (($signed($unsigned($unsigned(wire93))) || $signed($signed((|wire93)))) ?
              $unsigned($unsigned(reg99[(2'h2):(2'h2)])) : ({(reg103[(4'ha):(2'h2)] == {wire96}),
                  $unsigned(wire94[(4'hb):(2'h2)])} ^ reg99[(2'h2):(1'h1)]));
          reg102 <= $unsigned(wire92[(3'h5):(1'h1)]);
        end
      if ({reg99,
          (($signed($signed((8'hb6))) != wire93) ?
              reg103[(4'ha):(4'ha)] : (((reg106 ? wire94 : wire96) ?
                  (+reg101) : (!wire96)) + $signed((wire97 ?
                  reg104 : wire96))))})
        begin
          reg107 <= {$signed($unsigned(((+reg103) < (wire93 - reg104)))),
              {$unsigned(wire97)}};
        end
      else
        begin
          reg107 <= (wire95 - $signed($unsigned(($unsigned(reg99) <= (~^(8'hbf))))));
          reg108 <= reg104;
          reg109 <= reg104[(1'h0):(1'h0)];
          if ((~^reg99))
            begin
              reg110 <= $unsigned($unsigned($unsigned((wire92[(3'h7):(2'h2)] ^ $signed(wire95)))));
            end
          else
            begin
              reg110 <= ((~(reg101 - ($signed(wire93) ?
                  (+reg107) : (wire93 | (8'hb2))))) || ($signed((^~wire95)) ?
                  {(reg104 ? $signed(reg108) : $signed(reg101)),
                      (reg100[(4'hc):(4'h9)] ?
                          ((8'hb2) ^~ reg107) : $unsigned(reg104))} : (~&($signed(wire94) ?
                      (reg107 ? (8'ha2) : reg100) : reg102))));
            end
        end
      reg111 <= (8'h9d);
    end
  assign wire112 = {({$unsigned(reg102)} ?
                           ({reg109[(3'h7):(3'h4)], $unsigned((8'h9d))} ?
                               ((!reg101) ?
                                   ((8'hb5) - wire98) : $signed(wire95)) : (8'ha5)) : (^~$signed((wire95 ?
                               reg108 : reg104)))),
                       (~(((reg108 - wire94) ?
                           reg100[(5'h10):(4'ha)] : wire97) != $signed(((8'hbf) >= reg99))))};
  assign wire113 = (+(reg102[(5'h12):(1'h1)] ?
                       ((+(~|wire98)) ?
                           reg110[(2'h2):(2'h2)] : ((wire95 > wire93) ?
                               $unsigned(reg102) : (|(8'hab)))) : ((^~(^~reg106)) > ((8'hb0) <= wire95[(4'hd):(4'hd)]))));
  assign wire114 = (((((8'hbd) == wire113[(4'ha):(4'h8)]) ?
                       ({wire113, reg105} <= (~|reg103)) : ({reg110, reg100} ?
                           (wire112 ?
                               wire96 : reg106) : $unsigned(reg111))) >= {({wire94,
                           wire112} >= $signed(wire92))}) && wire92);
endmodule

module module69
#(parameter param85 = {(((((8'h9d) * (8'hbc)) ? ((8'h9e) ^~ (8'ha8)) : (8'hb0)) <= (8'hb7)) ? ((~((8'h9e) ? (8'hb6) : (8'had))) ? ({(7'h41), (8'hb7)} ? (8'hbb) : (^~(8'ha9))) : ((!(8'hb9)) <<< ((8'hbc) ? (8'ha3) : (8'ha6)))) : {(((8'haf) >> (8'hb4)) ? ((7'h44) ^ (8'hb8)) : ((7'h42) < (8'hbd)))}), (|((7'h43) ? ((|(8'ha9)) << (~&(8'hae))) : ({(8'h9d)} ? {(8'hb7), (7'h41)} : {(8'h9c), (8'hbb)})))}, 
parameter param86 = {({((-param85) >>> (param85 | param85))} != param85), (|{(-{param85, param85})})})
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire74;
  input wire [(5'h14):(1'h0)] wire73;
  input wire signed [(5'h12):(1'h0)] wire72;
  input wire signed [(3'h5):(1'h0)] wire71;
  input wire [(4'hb):(1'h0)] wire70;
  wire [(5'h15):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  assign y = {wire84,
                 wire83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg75 <= wire72;
    end
  always
    @(posedge clk) begin
      reg76 <= wire74;
      reg77 <= ((reg76[(2'h2):(2'h2)] ?
              (({reg75, (8'hb3)} ?
                      ((8'ha6) ? (8'hbb) : reg76) : {reg75, (7'h44)}) ?
                  ((8'h9d) != $signed(wire74)) : $signed((wire74 ?
                      wire74 : wire74))) : $signed(wire70)) ?
          wire72[(3'h7):(1'h1)] : $unsigned($unsigned((~$unsigned(wire70)))));
    end
  always
    @(posedge clk) begin
      if ({$signed($signed({(reg77 ? wire73 : reg75), (reg75 > reg76)}))})
        begin
          reg78 <= (~&(!$signed($unsigned(((8'hac) ~^ reg76)))));
          reg79 <= $unsigned($unsigned($unsigned({{reg77}})));
          reg80 <= wire73[(4'hf):(3'h6)];
          reg81 <= reg78;
        end
      else
        begin
          reg78 <= (8'hb1);
          reg79 <= (((wire73 != $unsigned(((8'h9c) & (8'hb1)))) == $unsigned($signed((~|wire72)))) == (((^$signed(reg77)) ?
                  $unsigned((wire74 ^~ reg80)) : $unsigned(wire72[(4'h8):(3'h5)])) ?
              ($signed(reg75) | (reg75 ?
                  (reg76 >> reg80) : $signed(reg80))) : $unsigned(wire73[(1'h1):(1'h1)])));
        end
      reg82 <= (((~^wire73[(3'h4):(3'h4)]) << ((~reg81[(3'h4):(2'h2)]) && (~$unsigned(reg77)))) || (({(reg79 <= (8'haa)),
                  wire74[(4'h9):(3'h6)]} ?
              reg78[(4'ha):(3'h6)] : ((&reg81) <<< (reg77 ^~ wire70))) ?
          ($signed(reg81[(4'hb):(4'h8)]) ?
              ({reg78,
                  (7'h40)} <<< wire72[(4'hc):(3'h7)]) : reg76) : (!$signed((reg77 ?
              wire71 : (8'hb9))))));
    end
  assign wire83 = $signed((((7'h43) ?
                          $signed((reg81 * wire73)) : ($signed(reg76) ?
                              ((8'ha0) ?
                                  wire71 : wire71) : $unsigned(wire70))) ?
                      (((+reg81) < ((8'ha4) ?
                          wire72 : reg80)) >= reg78) : ($unsigned({reg75,
                          reg80}) + (-$signed(reg82)))));
  assign wire84 = wire73[(5'h10):(4'hf)];
endmodule
