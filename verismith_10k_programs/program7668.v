module top
#(parameter param126 = (|(|({((8'hab) ? (7'h41) : (8'ha5)), (^(7'h41))} ? ((-(8'hbb)) ~^ ((8'ha3) ? (7'h43) : (8'hb7))) : (8'hab)))), 
parameter param127 = ({(-((param126 + param126) + param126))} ? param126 : ({(~param126), (8'ha5)} || (-(8'hb4)))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire123;
  wire [(4'hc):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire121;
  wire signed [(4'ha):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire117;
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire5,
                 wire6,
                 wire7,
                 wire117,
                 (1'h0)};
  assign wire5 = $signed({$signed((+$signed(wire0))),
                     $signed(wire4[(1'h1):(1'h1)])});
  assign wire6 = wire3;
  assign wire7 = wire4[(2'h2):(1'h0)];
  module8 #() modinst118 (.wire10(wire0), .wire13(wire6), .clk(clk), .wire9(wire7), .y(wire117), .wire11(wire1), .wire12(wire3));
  assign wire119 = {{(~&{wire3})},
                       {(~{wire2[(2'h3):(2'h3)], $unsigned(wire0)})}};
  assign wire120 = $unsigned({$unsigned({$unsigned(wire4), {wire2, wire4}})});
  assign wire121 = ((^{{wire4[(3'h6):(3'h4)]},
                       wire6[(3'h6):(2'h3)]}) + $unsigned(wire3));
  assign wire122 = (wire0 ?
                       $signed(($signed((+wire1)) ?
                           {$unsigned(wire3)} : (wire121[(4'h8):(2'h2)] >> $signed((8'had))))) : (!({wire3,
                           $signed((8'hbe))} != ((wire119 + (8'ha7)) | $signed(wire119)))));
  assign wire123 = ((&wire2) - {wire6});
  assign wire124 = $unsigned(wire7);
  assign wire125 = wire4;
endmodule

module module8
#(parameter param116 = ({((((8'haf) != (8'h9e)) & ((7'h44) ? (8'h9f) : (8'hbb))) ~^ (8'hbe))} << (&(~({(8'hb7), (8'h9e)} ? ((8'hb8) ? (8'hbc) : (8'haf)) : (|(8'ha4)))))))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire114;
  wire [(5'h12):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire90;
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  assign y = {wire114,
                 wire93,
                 wire92,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire59,
                 wire90,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 (1'h0)};
  assign wire14 = $signed((^~wire12[(5'h12):(4'he)]));
  assign wire15 = $signed(wire14[(4'hb):(3'h7)]);
  assign wire16 = $unsigned($signed(wire15));
  assign wire17 = wire12[(5'h13):(5'h13)];
  always
    @(posedge clk) begin
      if (((-$unsigned(wire13[(4'hb):(2'h3)])) <<< ($signed($signed((^wire13))) ?
          wire10 : (-$signed(wire14[(3'h7):(3'h4)])))))
        begin
          reg18 <= (~$unsigned($unsigned((+((8'hbb) ? wire12 : wire9)))));
          if (wire10)
            begin
              reg19 <= ($unsigned(wire12) ?
                  wire17[(3'h6):(3'h5)] : $unsigned((wire17[(4'hd):(1'h1)] ^ (+(^~wire15)))));
              reg20 <= wire12;
            end
          else
            begin
              reg19 <= $signed((8'hb7));
              reg20 <= wire9[(1'h1):(1'h0)];
              reg21 <= ((|reg20[(4'hb):(3'h5)]) == $unsigned((({(8'hae),
                      reg19} + $unsigned(reg20)) ?
                  $signed((~|wire13)) : ($unsigned(reg18) ?
                      $unsigned((7'h42)) : wire17[(1'h0):(1'h0)]))));
              reg22 <= $unsigned($signed({$signed($signed(wire9)),
                  reg19[(1'h0):(1'h0)]}));
              reg23 <= $signed((!$unsigned(($unsigned(wire16) ?
                  {wire15, wire13} : reg22[(4'h8):(2'h2)]))));
            end
          if (wire14[(4'hc):(3'h6)])
            begin
              reg24 <= reg18;
              reg25 <= (reg22 <= reg21[(4'ha):(1'h0)]);
              reg26 <= $signed($unsigned(wire17));
              reg27 <= wire16[(3'h7):(3'h4)];
            end
          else
            begin
              reg24 <= ($signed(($signed((wire9 ? reg23 : reg21)) ?
                      reg26 : (~reg26[(5'h10):(4'h8)]))) ?
                  (~(8'had)) : {wire12});
              reg25 <= reg22[(4'he):(2'h3)];
              reg26 <= {wire13[(1'h1):(1'h1)], $unsigned(reg23)};
              reg27 <= wire17;
              reg28 <= {(($signed((!wire14)) ?
                      (-(reg18 ?
                          wire16 : reg27)) : wire9[(5'h10):(3'h7)]) | (wire12 || $signed((^(7'h41)))))};
            end
          reg29 <= reg18[(1'h0):(1'h0)];
        end
      else
        begin
          if (wire13[(4'h8):(3'h4)])
            begin
              reg18 <= (|$signed($signed($signed($unsigned(reg23)))));
            end
          else
            begin
              reg18 <= (!(wire11 <<< $signed((-reg28[(1'h0):(1'h0)]))));
              reg19 <= reg22[(4'hd):(2'h2)];
              reg20 <= ($signed(wire13) >= wire12[(3'h4):(2'h2)]);
              reg21 <= reg18;
            end
          reg22 <= ($unsigned($signed((~^{(8'had)}))) ?
              (reg20[(4'hb):(4'h9)] ?
                  {$unsigned(wire11[(4'h9):(2'h2)]),
                      $unsigned($signed(reg26))} : $unsigned($unsigned(wire15[(2'h2):(2'h2)]))) : reg23[(5'h12):(4'ha)]);
        end
    end
  assign wire30 = ($unsigned(reg28[(4'h8):(3'h4)]) ^ ({(8'hb8),
                          $signed((reg28 ? reg29 : reg23))} ?
                      {reg23} : $signed(((&reg22) ?
                          ((8'ha9) ? wire11 : wire11) : reg18))));
  assign wire31 = reg28;
  assign wire32 = $unsigned(reg18[(3'h5):(2'h2)]);
  assign wire33 = $signed(reg26[(1'h1):(1'h0)]);
  assign wire34 = wire9[(1'h0):(1'h0)];
  assign wire35 = ({(|(^~$signed(reg23)))} | $signed($signed(wire30[(4'h9):(3'h7)])));
  assign wire36 = $signed(($unsigned((wire17 >= (reg22 == (8'hae)))) + ($signed($unsigned((8'ha4))) ?
                      $unsigned((&reg28)) : ($signed(wire15) ?
                          (~wire13) : ((8'hbb) & reg22)))));
  module37 #() modinst60 (wire59, clk, wire35, wire31, reg18, reg21, reg23);
  module61 #() modinst91 (wire90, clk, reg25, wire16, wire10, wire11);
  assign wire92 = $signed(($signed((~^(8'hb9))) >> $signed(reg27[(4'h9):(2'h2)])));
  assign wire93 = ($unsigned({($signed(wire59) > {wire15, wire15})}) ?
                      $signed({{$unsigned(wire13), (~^reg19)},
                          reg20[(4'hc):(2'h2)]}) : ((+(reg26 ?
                              wire10 : (wire12 ~^ wire59))) ?
                          reg27[(4'h8):(1'h1)] : ($unsigned({wire30}) ?
                              ({(8'h9e)} ^~ (^wire30)) : ($unsigned(reg21) ?
                                  wire9 : reg19[(1'h1):(1'h0)]))));
  module94 #() modinst115 (wire114, clk, wire10, reg21, wire13, wire90, wire17);
endmodule

module module94
#(parameter param112 = ((({{(8'h9f), (8'haf)}} ? {{(8'h9d), (8'hb5)}, (+(8'hb1))} : (|(8'hae))) ? ((((7'h41) ? (8'h9c) : (8'hac)) ? (~(8'hb1)) : (+(8'ha0))) <<< ((8'hbe) ? ((7'h43) << (8'hb6)) : ((8'hb1) ? (8'hb6) : (8'hb4)))) : (({(8'hb1)} ? {(8'hbb)} : {(8'hb8)}) <= (~(8'hbf)))) ? ({((~|(7'h43)) ? (|(8'hb6)) : ((8'hae) ? (8'hba) : (8'hab)))} ? {(&((8'h9d) ? (8'hbd) : (8'ha9))), (~^(!(8'hb2)))} : ((((8'haa) != (8'ha8)) <<< {(8'hb9), (7'h41)}) ? (((8'ha1) && (7'h41)) ? {(8'ha0), (8'ha5)} : ((8'hb3) ? (8'hb2) : (8'hba))) : ({(7'h43), (8'hb0)} ? ((8'ha9) ? (7'h43) : (7'h40)) : ((8'h9e) ? (8'hb8) : (8'hbe))))) : (~^(!(-((8'hb7) >= (8'haa)))))), 
parameter param113 = (param112 ? ({((-param112) ~^ {param112, param112}), (^param112)} ? {param112} : (-param112)) : param112))
(y, clk, wire99, wire98, wire97, wire96, wire95);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire99;
  input wire signed [(4'h8):(1'h0)] wire98;
  input wire signed [(3'h6):(1'h0)] wire97;
  input wire signed [(2'h3):(1'h0)] wire96;
  input wire signed [(5'h12):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire100;
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire100,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire100 = (wire99[(4'hb):(1'h0)] ?
                       {(-(+$unsigned((8'hb5)))),
                           wire97[(3'h5):(2'h3)]} : $signed($signed(wire98)));
  always
    @(posedge clk) begin
      reg101 <= (wire96[(2'h3):(1'h1)] - $unsigned(wire99));
      if ($signed((7'h42)))
        begin
          if (($signed({((&wire100) ? (~^wire95) : wire98[(1'h0):(1'h0)]),
                  (~^((8'ha8) ^ wire97))}) ?
              $unsigned((&{$unsigned(wire95),
                  (wire100 ?
                      wire98 : (8'hbe))})) : $unsigned(($unsigned($unsigned((7'h43))) ?
                  (wire97[(1'h0):(1'h0)] ?
                      wire97[(3'h5):(2'h2)] : wire98) : ($unsigned(wire96) ?
                      wire100[(2'h3):(1'h0)] : (wire96 ^~ wire95))))))
            begin
              reg102 <= $signed((~(((wire99 ?
                  wire97 : wire97) << (|wire96)) || (((8'hb5) && wire97) | wire98))));
              reg103 <= $unsigned($unsigned(reg102));
              reg104 <= reg103[(3'h4):(3'h4)];
              reg105 <= (($signed(wire100) >>> $unsigned($unsigned(((8'hbd) ?
                      reg104 : reg103)))) ?
                  reg103[(1'h0):(1'h0)] : (~|wire96[(2'h2):(2'h2)]));
              reg106 <= (~&((-(8'hb6)) ?
                  {(+wire99),
                      ($signed(reg105) << reg104[(2'h2):(2'h2)])} : wire100[(4'h8):(1'h1)]));
            end
          else
            begin
              reg102 <= wire97[(2'h2):(1'h1)];
            end
          reg107 <= (((^((reg106 ? reg104 : reg103) ?
              {wire98,
                  reg101} : (^~wire97))) - (^~((~&reg104) && wire99))) ^~ (-({(~&reg102),
                  (wire96 ^ wire95)} ?
              $signed(wire98) : ({wire99} ?
                  (wire98 * reg104) : (reg101 ? reg106 : (8'hb3))))));
          reg108 <= (($signed($signed(reg103[(1'h0):(1'h0)])) ?
                  ($signed(wire96[(1'h0):(1'h0)]) << ((wire99 ?
                          reg107 : wire98) ?
                      {reg104} : reg105)) : ($signed((|(8'hb5))) < {(~&wire98),
                      wire95[(4'hc):(3'h7)]})) ?
              wire96 : ((reg102 ?
                  reg104 : (~|wire96[(2'h2):(1'h0)])) && reg103[(2'h2):(2'h2)]));
        end
      else
        begin
          reg102 <= reg103[(1'h1):(1'h0)];
          reg103 <= reg104;
          reg104 <= {$unsigned(reg102), reg107};
          reg105 <= (!(wire97 ?
              $unsigned((reg104[(4'hc):(4'h9)] >= wire97[(3'h4):(2'h2)])) : ((~&{wire100,
                      reg103}) ?
                  ($signed(reg106) ?
                      (reg106 ? wire100 : reg103) : (wire100 ?
                          reg101 : reg104)) : (~^(~^wire98)))));
          reg106 <= ((wire96 | (+(|{(8'hba)}))) ?
              $unsigned(((7'h43) | $unsigned((reg105 ~^ reg106)))) : $unsigned(($unsigned(wire98) >= (&reg101[(3'h5):(2'h2)]))));
        end
      reg109 <= ($unsigned((((&(8'hae)) < reg102[(4'hc):(2'h2)]) || (^~$signed((8'ha1))))) >>> reg104);
    end
  assign wire110 = {$signed($signed(((~^wire99) ?
                           (reg107 && (8'ha2)) : (~^reg107)))),
                       ((|(~reg107[(1'h0):(1'h0)])) * (reg103 < ($unsigned(wire99) | wire97[(3'h5):(1'h0)])))};
  assign wire111 = (~^$signed(($signed($signed(reg103)) < (((8'ha4) ?
                           (8'hb3) : wire99) ?
                       {wire99, wire95} : $signed(wire99)))));
endmodule

module module61
#(parameter param89 = (((|(((7'h40) * (8'hb4)) > (^~(8'ha1)))) >>> (7'h43)) != ({(&((8'hbc) ? (8'hb5) : (8'hb7)))} ? ((-((8'ha7) * (7'h40))) ? (((8'h9e) ? (8'hb8) : (8'hb8)) ? ((8'had) ? (7'h42) : (8'hb9)) : ((8'hbd) ? (8'haf) : (7'h41))) : (((8'hb9) <= (8'ha4)) ? ((8'h9d) > (7'h44)) : (!(7'h42)))) : ((~((8'ha2) ? (8'hae) : (8'hbb))) ? ((+(8'hb7)) >> (~|(8'hba))) : (((8'hb6) ? (8'h9d) : (8'ha5)) ^ ((8'hb7) ^~ (8'hb2)))))))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire65;
  input wire [(4'hc):(1'h0)] wire64;
  input wire signed [(4'he):(1'h0)] wire63;
  input wire signed [(4'hc):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire66 = wire65[(3'h4):(1'h1)];
  assign wire67 = ({wire63} ?
                      (|((~|$unsigned(wire63)) | $signed((wire64 ~^ wire65)))) : {$signed(wire63[(3'h4):(2'h2)])});
  assign wire68 = (($signed($signed((wire67 ^~ wire66))) * {(~|$unsigned((8'ha3))),
                          wire63[(2'h3):(1'h0)]}) ?
                      $signed(wire62[(3'h4):(1'h0)]) : ($unsigned($unsigned(wire63)) & {wire65[(1'h0):(1'h0)]}));
  assign wire69 = {wire66, $unsigned(wire63[(4'he):(1'h0)])};
  assign wire70 = (wire65[(1'h1):(1'h0)] ?
                      $unsigned($signed(($signed(wire62) ?
                          ((7'h41) - wire68) : ((8'hbd) ?
                              wire66 : wire63)))) : $signed(wire63[(1'h0):(1'h0)]));
  assign wire71 = wire68[(4'hb):(3'h6)];
  assign wire72 = $unsigned(wire65);
  assign wire73 = ((((wire69 - (wire69 ? (8'h9f) : wire69)) ?
                          {(wire68 & wire64)} : (&(wire64 ?
                              wire66 : wire71))) >> $signed(((wire71 | (8'hba)) ^ $unsigned(wire67)))) ?
                      ($unsigned(wire68[(2'h2):(1'h1)]) ?
                          ($signed((~(8'hbd))) ?
                              $unsigned($signed(wire69)) : (|wire72[(2'h2):(2'h2)])) : {wire69[(1'h0):(1'h0)]}) : (8'had));
  assign wire74 = $unsigned(wire68);
  assign wire75 = ((!(wire72[(4'h9):(3'h4)] ?
                          {{wire62, wire63},
                              wire63} : $unsigned($signed(wire68)))) ?
                      wire69[(2'h3):(2'h2)] : (~&{$unsigned({wire67}),
                          wire64[(3'h4):(1'h0)]}));
  assign wire76 = ((^(wire72 && ($signed(wire71) | (7'h42)))) * ($unsigned(({wire69,
                              wire74} ?
                          wire63[(4'hd):(4'h9)] : {wire67, wire70})) ?
                      (wire65 ?
                          ((wire72 ? wire62 : wire66) ?
                              (~&wire63) : (wire75 ?
                                  wire66 : wire72)) : $unsigned(wire63)) : wire72));
  assign wire77 = (^$unsigned(((~|(wire75 && wire68)) ?
                      ($signed(wire75) < wire62) : wire68[(1'h1):(1'h0)])));
  assign wire78 = $unsigned({wire76});
  assign wire79 = wire67;
  assign wire80 = {(|($unsigned((wire62 >>> wire65)) && (~|wire72))), wire75};
  assign wire81 = $unsigned(wire78[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if ({(wire72 ?
              wire64[(1'h1):(1'h1)] : $signed(($signed(wire80) ?
                  wire77[(4'hc):(3'h5)] : (7'h44)))),
          ((^$unsigned($unsigned(wire76))) ? wire68[(4'hc):(3'h7)] : wire71)})
        begin
          reg82 <= ($signed({wire65, wire62}) - (^~({wire74} ?
              (~^$signed(wire74)) : wire68[(4'h8):(2'h3)])));
          reg83 <= $signed(wire66[(4'ha):(2'h2)]);
          reg84 <= $signed((|$signed((^$unsigned(wire75)))));
        end
      else
        begin
          reg82 <= $unsigned((wire77[(2'h3):(2'h3)] ?
              $signed($unsigned((wire78 ^ wire70))) : ((~^$signed(wire79)) - (((8'ha0) ?
                      wire81 : wire74) ?
                  wire64[(4'hc):(3'h4)] : $unsigned(reg83)))));
        end
    end
  assign wire85 = (wire63[(4'hc):(4'hb)] & (!((wire71[(3'h6):(1'h0)] ?
                      wire63 : {wire77}) * wire66)));
  assign wire86 = {((wire62 > ((^~wire72) >>> $signed((8'hb2)))) ?
                          $signed($signed({wire65,
                              (8'ha8)})) : ((wire66 >= wire63) ?
                              reg82 : wire68[(4'he):(3'h5)]))};
  assign wire87 = wire75[(3'h5):(3'h5)];
  assign wire88 = wire86;
endmodule

module module37  (y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire42;
  input wire signed [(3'h6):(1'h0)] wire41;
  input wire signed [(2'h3):(1'h0)] wire40;
  input wire [(4'hd):(1'h0)] wire39;
  input wire [(3'h5):(1'h0)] wire38;
  wire signed [(3'h4):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 (1'h0)};
  assign wire43 = wire41;
  assign wire44 = (!(^({wire41[(3'h4):(1'h1)]} | $signed((wire41 ?
                      (8'hbd) : wire42)))));
  assign wire45 = $unsigned($unsigned($unsigned(wire44[(4'h8):(1'h0)])));
  assign wire46 = $unsigned((^($signed({wire38}) ?
                      $unsigned((wire38 <<< wire41)) : (~(wire40 >> wire44)))));
  assign wire47 = (~|wire41[(3'h4):(2'h2)]);
  assign wire48 = wire45;
  assign wire49 = {$unsigned(((wire43[(5'h10):(4'hb)] ^ $signed(wire39)) >>> $signed((8'ha7)))),
                      wire45};
  assign wire50 = {$unsigned(wire45),
                      (wire46[(4'he):(4'hb)] ?
                          (wire45 ?
                              (~^$unsigned((8'hba))) : $unsigned($signed((8'hb4)))) : $signed((|(+wire46))))};
  assign wire51 = $unsigned({(((^wire45) == (^wire46)) ?
                          (~^(8'hbc)) : $signed((wire45 ? (7'h43) : wire49)))});
  assign wire52 = wire43;
  assign wire53 = $unsigned(wire48);
  assign wire54 = wire43[(4'ha):(1'h0)];
  assign wire55 = wire52[(3'h6):(1'h1)];
  assign wire56 = (~&{$unsigned($unsigned($signed(wire50)))});
  assign wire57 = wire49;
  assign wire58 = (+wire41);
endmodule
