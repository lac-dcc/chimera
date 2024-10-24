module top
#(parameter param123 = {(((((8'ha3) | (7'h41)) ? (8'ha1) : (^~(8'hbe))) >>> ((^~(8'hac)) ^~ (~&(8'h9e)))) & ({{(7'h42)}, (~&(8'hb7))} ~^ (!((8'hb5) ? (8'hb4) : (8'hbc))))), (((^~(!(8'ha9))) ? (^((8'hb6) ? (8'hb1) : (8'hb9))) : {(-(8'hb3))}) << (8'hb8))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire122;
  wire [(5'h12):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  assign y = {wire122,
                 wire120,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (+$unsigned(wire1[(4'hf):(3'h7)]));
  assign wire5 = wire1[(4'hc):(3'h6)];
  assign wire6 = $unsigned(wire2[(3'h5):(3'h5)]);
  assign wire7 = (wire3 * wire0[(4'he):(3'h4)]);
  assign wire8 = wire3;
  module9 #() modinst89 (wire88, clk, wire0, wire2, wire4, wire3);
  assign wire90 = wire7[(4'hb):(2'h2)];
  assign wire91 = wire88;
  assign wire92 = $signed((((^$signed(wire1)) ?
                      (!$unsigned(wire88)) : (&wire8[(4'h8):(3'h5)])) & $unsigned($unsigned(wire90))));
  always
    @(posedge clk) begin
      reg93 <= wire2;
      reg94 <= wire1;
      if ({(8'haf)})
        begin
          if ($signed($unsigned(wire8[(4'ha):(2'h2)])))
            begin
              reg95 <= wire2;
              reg96 <= $signed((~wire88));
              reg97 <= (~^(^$unsigned($unsigned((^~wire0)))));
              reg98 <= (~|reg93);
            end
          else
            begin
              reg95 <= (7'h44);
              reg96 <= $signed((8'ha8));
              reg97 <= ({((7'h42) ?
                          (~^(wire1 ? wire88 : reg93)) : ((&(8'hbf)) ?
                              wire5 : (reg97 & wire90)))} ?
                  (!(reg96[(3'h7):(3'h4)] == (&(wire8 != wire88)))) : wire88[(1'h1):(1'h0)]);
              reg98 <= {$unsigned(reg97), (&wire88[(3'h5):(1'h0)])};
            end
          reg99 <= wire8[(4'hd):(4'hb)];
        end
      else
        begin
          reg95 <= wire6;
          if (reg99[(1'h0):(1'h0)])
            begin
              reg96 <= (|$unsigned(wire4[(4'ha):(3'h5)]));
              reg97 <= reg97;
              reg98 <= wire2[(2'h3):(2'h2)];
            end
          else
            begin
              reg96 <= (reg98 ~^ ($unsigned(wire88) ?
                  (wire91[(1'h1):(1'h1)] ?
                      (^~(-reg98)) : ((wire7 == reg94) ?
                          (wire5 + wire4) : ((8'hb8) * wire8))) : wire7[(5'h14):(4'ha)]));
            end
          if ((reg96 ?
              $signed((reg95 ?
                  $signed(wire0[(2'h3):(1'h0)]) : $signed((-reg97)))) : (^$signed((8'hb2)))))
            begin
              reg99 <= reg99[(4'hb):(2'h3)];
              reg100 <= wire2;
              reg101 <= (&(~$unsigned({(&(8'hba))})));
              reg102 <= wire2;
            end
          else
            begin
              reg99 <= $unsigned($unsigned(($unsigned($signed(wire3)) ?
                  {$signed(wire7)} : $signed((~&wire0)))));
              reg100 <= wire92[(4'hc):(1'h1)];
              reg101 <= (~^wire4[(3'h4):(1'h1)]);
              reg102 <= wire0;
              reg103 <= wire0[(3'h7):(3'h6)];
            end
          reg104 <= ((^(&reg99)) >>> wire0[(1'h0):(1'h0)]);
        end
    end
  module105 #() modinst121 (.wire108(reg98), .wire109(reg97), .clk(clk), .wire106(reg94), .y(wire120), .wire107(reg99));
  assign wire122 = $signed(reg98[(4'h9):(2'h2)]);
endmodule

module module105
#(parameter param118 = (!(!((8'hb4) * {((8'hb1) ? (8'hb4) : (8'hb6))}))), 
parameter param119 = {{(param118 < (((8'hbc) ? param118 : param118) ? (param118 >> param118) : {(8'h9c), param118}))}, ({{(param118 && param118)}} <= (param118 ^~ ((param118 ? param118 : param118) ? param118 : (-param118))))})
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire109;
  input wire signed [(4'hf):(1'h0)] wire108;
  input wire [(4'hc):(1'h0)] wire107;
  input wire [(4'hc):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire117;
  wire signed [(3'h4):(1'h0)] wire116;
  wire [(5'h12):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire112;
  wire [(3'h5):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg115,
                 (1'h0)};
  assign wire110 = (wire107 ?
                       (wire107 ?
                           wire106[(3'h4):(2'h2)] : ((wire106[(4'hc):(1'h1)] ?
                               (wire108 >> wire109) : $signed(wire107)) == (-wire108))) : wire108);
  assign wire111 = ((~{wire110, wire110}) ?
                       $signed((~^(wire110[(3'h4):(2'h2)] >= wire107[(4'hc):(4'hb)]))) : (-wire109[(3'h4):(3'h4)]));
  assign wire112 = $unsigned((~$signed($unsigned($unsigned(wire108)))));
  assign wire113 = (~&wire106);
  assign wire114 = ((|(wire106 ?
                           ((~|wire106) ?
                               (^wire111) : $unsigned(wire108)) : (&wire112[(1'h1):(1'h1)]))) ?
                       ((~^{{wire110, (8'hb9)},
                           (&wire106)}) | ($unsigned({(8'ha6)}) ?
                           ({wire107, (8'h9c)} ?
                               (wire112 ?
                                   wire106 : wire110) : (wire113 >> wire112)) : wire113)) : $signed({$unsigned((|wire111))}));
  always
    @(posedge clk) begin
      reg115 <= ({((wire112 > (~|wire113)) ?
                  ($signed(wire107) ?
                      (!(8'hac)) : (^wire107)) : ($unsigned(wire112) * wire106[(4'hb):(4'hb)]))} ?
          (^~($unsigned($unsigned(wire107)) ?
              ((^wire114) ? wire112 : (~^wire111)) : (wire110 ?
                  $unsigned(wire110) : wire111))) : ($signed({wire106,
                  (wire111 >= wire112)}) ?
              $signed((wire112 | (wire109 >= wire109))) : {$unsigned((|(8'hb4)))}));
    end
  assign wire116 = wire107[(2'h3):(1'h1)];
  assign wire117 = (+(~|(wire109 <<< wire107[(3'h6):(1'h0)])));
endmodule

module module9
#(parameter param87 = ((~^(+((|(8'ha5)) == ((8'hb6) < (8'h9d))))) ? (((((8'hba) ? (8'hbd) : (8'h9e)) ? ((8'hb0) ? (8'ha2) : (8'hb0)) : {(8'hb9), (8'h9c)}) == {{(8'hb6), (8'ha7)}}) ? (-(~|(~|(8'haf)))) : {{((7'h40) ? (8'ha0) : (8'hbc))}}) : ((&(!(+(8'hb3)))) ? (((8'ha2) ? ((8'hb7) * (8'ha8)) : ((8'hb6) ? (8'hb3) : (8'hb2))) && (~|{(8'ha7), (8'hb5)})) : (((~|(8'haf)) ? (~(8'ha4)) : {(8'hba), (8'hb9)}) ? ((!(8'hae)) || ((8'had) << (8'ha2))) : (((8'hb7) ? (8'ha2) : (8'h9e)) || ((8'ha2) ? (8'ha4) : (8'hae)))))))
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire86;
  wire signed [(4'hc):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire70;
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire24,
                 wire25,
                 wire26,
                 wire70,
                 reg82,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg14,
                 reg15,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= (((wire12[(1'h0):(1'h0)] * $signed((+wire10))) ^ ($unsigned($unsigned(wire13)) ?
          (wire12[(4'h8):(1'h0)] ?
              $unsigned(wire10) : (wire12 ~^ wire11)) : ((wire13 ?
              wire10 : wire11) - (wire10 ^ wire13)))) || $unsigned((8'hbd)));
      reg15 <= $signed(reg14);
    end
  assign wire16 = {(reg15[(4'h8):(3'h7)] >> $signed((-(reg15 + wire12))))};
  assign wire17 = wire13;
  assign wire18 = {wire10};
  assign wire19 = ($unsigned(wire16[(4'hc):(3'h4)]) ?
                      reg15 : (~^((^~reg15) > (wire17[(1'h0):(1'h0)] << {wire10}))));
  always
    @(posedge clk) begin
      reg20 <= wire10;
      reg21 <= $unsigned(wire13[(3'h6):(3'h5)]);
      reg22 <= wire12;
      reg23 <= (7'h41);
    end
  assign wire24 = (wire16[(4'hc):(4'h9)] >>> reg20);
  assign wire25 = reg20;
  assign wire26 = wire25[(3'h7):(1'h0)];
  module27 #() modinst71 (.wire31(reg23), .wire29(reg14), .wire30(reg15), .wire28(wire17), .clk(clk), .y(wire70));
  always
    @(posedge clk) begin
      reg72 <= (^(|wire12));
      reg73 <= $unsigned(wire70);
      if ({((~&((wire19 ?
              wire26 : wire19) << wire16)) < $unsigned($signed({(8'hbf),
              wire12}))),
          reg73})
        begin
          reg74 <= reg73;
          reg75 <= $signed(wire13);
        end
      else
        begin
          reg74 <= ((((~reg21[(4'h8):(1'h0)]) << wire16) ?
              (^reg73) : reg22) < {wire25});
          reg75 <= wire11;
        end
      reg76 <= $signed(((({(8'hb9)} ?
          reg75 : (!reg23)) >> $unsigned((8'ha6))) ~^ $signed($signed((&wire17)))));
    end
  assign wire77 = (~&(reg22 ?
                      (($unsigned(wire26) <= $signed(reg21)) <<< $signed(reg73[(4'hc):(4'hc)])) : wire12));
  assign wire78 = $signed($signed(wire25));
  assign wire79 = $signed($signed($signed(wire77[(2'h2):(2'h2)])));
  assign wire80 = ({(wire17[(4'hd):(1'h1)] ? (8'hb7) : $signed(wire70)),
                      $unsigned(((&(8'hae)) <= (-reg22)))} & (!($unsigned($signed(reg23)) ?
                      (reg75[(3'h6):(3'h5)] ^ $unsigned(wire11)) : $unsigned((+wire79)))));
  assign wire81 = $unsigned((wire16[(2'h2):(1'h1)] ?
                      $signed(reg72) : ({$signed(reg23),
                          (-wire77)} == $signed(wire13[(4'hc):(4'ha)]))));
  always
    @(posedge clk) begin
      reg82 <= (+($signed((~(wire26 ? wire78 : wire10))) ?
          $unsigned(reg21[(2'h3):(1'h0)]) : (~($unsigned(reg23) & wire26[(3'h4):(2'h2)]))));
    end
  assign wire83 = ($signed((7'h40)) ?
                      (~(-$signed((reg20 ?
                          wire70 : wire78)))) : {(|$unsigned($unsigned(wire10)))});
  assign wire84 = wire10[(2'h2):(1'h1)];
  assign wire85 = $signed(((wire17[(5'h10):(4'ha)] & (reg21 + (wire84 ?
                          wire11 : wire84))) ?
                      (+(+wire19[(2'h2):(1'h1)])) : $signed(wire19[(3'h5):(3'h5)])));
  assign wire86 = $unsigned(reg75[(4'hc):(4'hc)]);
endmodule

module module27
#(parameter param68 = ((^(!(^~((8'haa) >> (8'ha9))))) ? ({(((8'ha5) << (8'h9c)) ? (~^(8'ha0)) : ((8'ha0) ? (8'haf) : (7'h43)))} >> ({((8'hbd) ? (8'hbd) : (8'hb9))} ? ({(7'h41)} + ((7'h44) <= (8'hb2))) : {((8'h9f) ? (8'hb8) : (8'ha7)), (8'hae)})) : ((+(((8'hac) ? (8'ha1) : (8'h9f)) == ((8'ha9) ? (8'hb9) : (8'hb5)))) ^ (~^((^(8'h9d)) >> ((8'hb7) - (8'ha4)))))), 
parameter param69 = {((param68 ? (^((8'hb0) < param68)) : param68) ? (param68 ? ((+param68) ? param68 : (&param68)) : ((param68 ? param68 : param68) >> param68)) : param68)})
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire31;
  input wire [(5'h14):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
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
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire32 = ($signed(($signed($unsigned((8'hae))) ?
                      wire31 : wire29)) >> $unsigned({(~wire30[(5'h10):(5'h10)])}));
  assign wire33 = $signed((($unsigned(((8'hb7) ?
                      (8'h9d) : (8'hb2))) ~^ $unsigned((wire32 >>> wire30))) & $unsigned($unsigned((wire30 ?
                      wire28 : wire30)))));
  assign wire34 = (wire33 ^~ $unsigned(($unsigned((wire31 ? wire29 : wire28)) ?
                      $unsigned((wire28 ?
                          wire32 : wire32)) : $signed((wire32 > (8'h9f))))));
  assign wire35 = $unsigned($unsigned($unsigned(wire34)));
  always
    @(posedge clk) begin
      if ((({$unsigned(wire33[(3'h7):(3'h6)])} ?
          (^((wire28 ^ wire29) ?
              wire29[(4'hc):(3'h6)] : (^wire34))) : $unsigned(((+wire33) | (wire28 & wire30)))) && (-(($unsigned((8'ha4)) ?
          {wire28} : (wire32 ? wire32 : wire34)) ^ (&(8'ha8))))))
        begin
          reg36 <= ((wire32[(2'h2):(1'h1)] ?
              $unsigned((8'had)) : wire35[(1'h1):(1'h1)]) - wire35);
          reg37 <= $signed({wire32});
          reg38 <= ($signed($unsigned((~|$signed(wire34)))) | (wire29 ?
              $unsigned(wire30[(3'h4):(2'h2)]) : (wire33 >> ({wire29} ?
                  $signed(wire28) : $unsigned((8'ha3))))));
          reg39 <= reg36[(3'h4):(3'h4)];
          reg40 <= {(~^(~|{(wire34 ? wire34 : (8'ha6)), reg37[(1'h0):(1'h0)]})),
              $unsigned((reg38[(2'h2):(2'h2)] ?
                  $signed(reg38[(4'hb):(4'h8)]) : ((wire33 + wire30) ?
                      reg36[(5'h12):(5'h11)] : (^wire31))))};
        end
      else
        begin
          if ($unsigned(reg38[(5'h10):(4'h8)]))
            begin
              reg36 <= (^{wire31, $signed($unsigned({reg39}))});
              reg37 <= (reg40[(3'h4):(1'h0)] ?
                  $signed(((-$unsigned((8'hbd))) >= {(+wire34)})) : $unsigned(((&(wire30 * wire34)) < wire34[(2'h3):(2'h3)])));
              reg38 <= reg39[(3'h4):(1'h0)];
              reg39 <= ($unsigned(wire35[(4'he):(2'h3)]) ^~ {reg39[(3'h4):(1'h1)]});
              reg40 <= $signed($signed((8'hbc)));
            end
          else
            begin
              reg36 <= (~$signed($unsigned((&reg36[(1'h0):(1'h0)]))));
              reg37 <= {(($unsigned({wire29, wire35}) << {(wire30 ?
                              reg37 : (8'ha7))}) ?
                      {$signed(wire35[(5'h10):(1'h1)])} : $unsigned((^~$unsigned(reg40)))),
                  $unsigned((wire28 ?
                      wire29 : ($unsigned(reg36) ?
                          $unsigned(wire34) : (reg36 ^ reg38))))};
              reg38 <= wire32;
              reg39 <= wire28;
            end
        end
      reg41 <= wire32[(4'hb):(2'h2)];
      reg42 <= ((reg41 | (^~{reg40})) + (wire31[(3'h7):(3'h4)] ?
          (^wire28[(5'h11):(2'h3)]) : ($signed(((7'h44) == wire29)) ?
              (&wire32[(4'hb):(3'h5)]) : $unsigned($signed(wire29)))));
      reg43 <= reg37;
    end
  assign wire44 = wire31[(4'hd):(4'hb)];
  assign wire45 = $unsigned((&(|(reg37 | wire44[(4'hf):(3'h4)]))));
  assign wire46 = (^~(reg40[(4'h9):(3'h6)] * (($unsigned(wire33) >>> $signed(wire32)) ?
                      $unsigned(reg36[(3'h7):(3'h7)]) : wire45)));
  assign wire47 = $signed(reg39);
  assign wire48 = wire44[(4'ha):(4'h9)];
  assign wire49 = $unsigned(wire45[(1'h0):(1'h0)]);
  assign wire50 = ((~$unsigned((&$unsigned(wire48)))) ~^ (8'haf));
  assign wire51 = ($unsigned((($unsigned((8'hae)) ? $unsigned(reg43) : wire35) ?
                      $signed(wire29) : $unsigned($unsigned(wire46)))) == $signed($signed((8'haa))));
  assign wire52 = (~|(~^wire33));
  assign wire53 = (wire44 ?
                      {(((reg43 ~^ reg39) < (wire30 ?
                              wire45 : wire49)) >> ({wire50} != wire46)),
                          ($unsigned(reg43[(1'h0):(1'h0)]) ~^ (8'ha4))} : $signed((~&$unsigned(wire52))));
  assign wire54 = ($unsigned((~&{$signed(wire50)})) ?
                      (8'hb0) : (^$signed($signed(reg42[(1'h0):(1'h0)]))));
  assign wire55 = $signed(($unsigned($signed((wire35 ?
                      wire50 : wire47))) >> reg43[(1'h0):(1'h0)]));
  assign wire56 = reg36;
  assign wire57 = {(-((^~{wire31}) ? (8'haa) : (~|(reg43 ? reg43 : wire53))))};
  assign wire58 = $signed(wire31[(4'hb):(4'hb)]);
  always
    @(posedge clk) begin
      reg59 <= $unsigned($signed({wire56}));
      if (wire47[(1'h0):(1'h0)])
        begin
          if ($signed(reg59))
            begin
              reg60 <= (^~$unsigned((+wire32[(2'h2):(1'h0)])));
              reg61 <= $unsigned(($signed(({wire57} ^~ reg37[(3'h6):(2'h2)])) ?
                  (((wire31 - reg60) ? (^~wire28) : wire33) ?
                      (8'had) : ($signed(reg41) >> (wire51 ?
                          wire51 : (7'h43)))) : (^wire34[(3'h7):(1'h0)])));
              reg62 <= (((-wire35) ?
                  wire33 : $unsigned(wire52)) >= reg40[(1'h0):(1'h0)]);
              reg63 <= wire45;
              reg64 <= $unsigned((&(8'hb6)));
            end
          else
            begin
              reg60 <= {(({(!reg62)} ? reg43 : reg62[(3'h4):(2'h2)]) ?
                      $unsigned(((+wire53) ?
                          reg39[(1'h1):(1'h1)] : (8'hbc))) : reg41),
                  (wire44 ?
                      $unsigned($signed($unsigned(reg38))) : $unsigned({$signed(wire29)}))};
              reg61 <= {$unsigned(reg63[(1'h0):(1'h0)]),
                  (wire55 ?
                      $unsigned($signed($unsigned(wire30))) : $signed(((reg63 >= (8'hbb)) ?
                          (wire45 ? (8'hb1) : reg38) : {wire46, wire44})))};
              reg62 <= $signed((((^~wire51) ^ ((&(8'hb9)) <= (reg63 * wire47))) >> ($unsigned((8'hb6)) ?
                  reg63 : (~$unsigned(wire58)))));
              reg63 <= wire50[(4'hb):(2'h2)];
            end
        end
      else
        begin
          if ({$unsigned((^$signed({wire51}))),
              $signed({reg38,
                  (wire33[(2'h3):(2'h2)] ?
                      {wire55, wire34} : wire31[(4'he):(3'h6)])})})
            begin
              reg60 <= ((reg60[(4'h9):(2'h3)] >> ({(reg59 * reg37),
                  $signed(wire35)} & wire28[(5'h12):(4'hc)])) != $signed((wire56 ?
                  $unsigned(wire51) : $signed({reg37}))));
              reg61 <= (((reg41[(1'h0):(1'h0)] ?
                      (~(reg42 ?
                          wire33 : wire58)) : $unsigned($unsigned((7'h43)))) ?
                  wire49 : $unsigned($signed((8'hb6)))) >> {(^{wire51[(3'h4):(1'h1)]})});
              reg62 <= ({$unsigned({(wire33 ? wire34 : reg59),
                      $signed(reg63)})} == wire57[(3'h7):(3'h4)]);
              reg63 <= (7'h41);
              reg64 <= reg38[(4'hc):(4'hb)];
            end
          else
            begin
              reg60 <= ((8'ha0) ? (|$unsigned(reg37[(2'h2):(1'h0)])) : wire52);
            end
          reg65 <= (wire44 ? reg61 : reg38[(1'h1):(1'h1)]);
          reg66 <= $signed($unsigned((~|(reg60 ?
              $unsigned(wire47) : {(8'h9d), reg60}))));
        end
      reg67 <= $signed($signed((wire46[(4'h9):(3'h7)] << (reg65[(3'h5):(1'h1)] ?
          $signed(wire33) : wire52))));
    end
endmodule
