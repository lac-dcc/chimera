module top
#(parameter param145 = {(((((8'ha5) ? (8'hbd) : (8'hb1)) ? ((8'hac) ^ (8'hb9)) : (!(8'ha5))) | (((8'ha5) ? (7'h40) : (8'haa)) >>> ((8'haa) ? (8'hae) : (8'hb1)))) >>> ((~^(&(7'h42))) && ({(8'hbc), (8'hb5)} <= ((8'haf) ? (8'h9f) : (8'hb4)))))}, 
parameter param146 = {(((!(^param145)) ? {((8'ha5) < param145)} : ((param145 || param145) ~^ param145)) ? (param145 ? ((param145 * param145) ? param145 : (|param145)) : (~&param145)) : (param145 + (^~((7'h40) ? param145 : param145))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire143;
  wire [(5'h12):(1'h0)] wire139;
  wire [(5'h14):(1'h0)] wire137;
  wire [(5'h11):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire141;
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire139,
                 wire137,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire7,
                 wire6,
                 wire5,
                 wire141,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire0[(2'h2):(1'h1)];
  assign wire6 = (wire2 ?
                     (wire3 != ($signed(wire3) <<< {$signed(wire3),
                         wire0})) : $signed({(~wire5[(1'h0):(1'h0)])}));
  assign wire7 = {(8'ha8)};
  always
    @(posedge clk) begin
      reg8 <= $unsigned(wire3);
      if ((^(^wire4)))
        begin
          if (($unsigned($signed((~&(~|wire6)))) != {$unsigned((((8'hb3) << reg8) == $unsigned(wire4))),
              wire0[(1'h1):(1'h1)]}))
            begin
              reg9 <= wire2[(2'h3):(1'h1)];
              reg10 <= (wire5 >> ($signed(wire1[(3'h4):(1'h0)]) >>> $unsigned(reg9[(1'h0):(1'h0)])));
            end
          else
            begin
              reg9 <= (((&((wire5 ? wire7 : wire0) > {(8'ha9)})) ?
                      (((reg8 ? wire7 : wire6) ?
                          {wire1, wire6} : {(8'hbb),
                              wire2}) == {wire3[(2'h2):(1'h0)],
                          $signed((8'hb7))}) : wire2[(2'h3):(2'h2)]) ?
                  {reg9, reg8[(3'h5):(3'h5)]} : (^($signed(wire1) ^~ {(!wire3),
                      {wire5}})));
              reg10 <= ((+(!wire1[(4'h9):(2'h2)])) >>> {wire4[(4'h9):(3'h6)]});
              reg11 <= wire4[(5'h14):(1'h1)];
            end
          reg12 <= reg11[(5'h14):(3'h7)];
        end
      else
        begin
          reg9 <= (&reg11[(4'ha):(3'h5)]);
          reg10 <= $unsigned(wire1);
          reg11 <= $signed(wire3);
        end
      reg13 <= $unsigned($signed((~|(wire0 > (~&reg10)))));
      reg14 <= wire0[(1'h0):(1'h0)];
      if (wire5)
        begin
          reg15 <= (+wire2);
          reg16 <= $unsigned(wire1[(2'h3):(1'h0)]);
          reg17 <= $signed((&{$unsigned((reg14 ? reg11 : reg10))}));
        end
      else
        begin
          reg15 <= $signed(({(|(~^reg13)), reg16} ?
              {reg9[(2'h2):(2'h2)]} : {((wire3 == (8'ha2)) ?
                      wire2[(3'h4):(2'h3)] : (wire0 ? reg11 : reg9))}));
          reg16 <= wire6[(4'h9):(4'h8)];
          reg17 <= ($signed(((&(wire1 ?
                  reg10 : reg9)) <<< wire6[(1'h1):(1'h1)])) ?
              {({(~reg13), {reg13, reg11}} ? (7'h44) : wire3[(4'h8):(2'h2)]),
                  wire0} : wire0[(1'h0):(1'h0)]);
        end
    end
  assign wire18 = {wire4[(1'h1):(1'h0)]};
  assign wire19 = (+(~$signed($unsigned($unsigned(reg14)))));
  assign wire20 = wire1[(1'h1):(1'h0)];
  assign wire21 = ((&(wire19[(2'h2):(2'h2)] ?
                          wire1[(3'h4):(1'h1)] : {(reg15 ? wire6 : reg10),
                              (8'haa)})) ?
                      (^~(reg14 == (~&wire5))) : ($unsigned(reg15) ?
                          (+wire20[(1'h1):(1'h1)]) : $unsigned({$unsigned(wire3),
                              wire2})));
  assign wire22 = ((($signed((!reg10)) ?
                          wire1 : {reg17}) ~^ wire18[(4'h9):(4'h8)]) ?
                      {reg12,
                          wire7[(1'h1):(1'h0)]} : $unsigned(reg9[(2'h2):(1'h0)]));
  assign wire23 = ($signed($unsigned($unsigned($signed(reg8)))) ?
                      $unsigned(reg11) : wire1);
  assign wire24 = ($unsigned(wire22) | $signed((reg10 != $signed($signed(reg12)))));
  assign wire25 = wire22[(2'h2):(1'h1)];
  assign wire26 = (((+(+$signed((8'ha3)))) | (!wire23[(3'h6):(1'h1)])) ?
                      $unsigned(reg15[(4'hf):(4'ha)]) : $unsigned(reg10));
  assign wire27 = $signed((&wire4[(4'hd):(3'h4)]));
  module28 #() modinst138 (.wire29(wire4), .clk(clk), .wire30(wire21), .wire31(reg16), .wire32(wire1), .y(wire137), .wire33(wire6));
  module36 #() modinst140 (wire139, clk, wire23, reg17, reg11, wire1, wire27);
  module86 #() modinst142 (wire141, clk, wire139, wire27, reg13, wire25);
  assign wire143 = (&((^(wire25 ?
                           {wire25, (8'hae)} : ((7'h44) ? (8'h9e) : reg10))) ?
                       ($signed((wire0 ? (8'haa) : reg13)) ?
                           $signed($unsigned(wire22)) : reg16) : {(wire21[(4'hd):(3'h5)] <= (+reg9))}));
  assign wire144 = wire18;
endmodule

module module28
#(parameter param135 = {((~&(~((8'ha4) ? (8'hac) : (8'hbe)))) ^ (!{((8'hac) ^~ (8'haa))})), ({{((8'had) >>> (8'hb3)), ((8'hbe) * (7'h42))}} ? {{{(8'hbe)}}, {((8'hac) ? (7'h42) : (8'ha1)), {(8'h9f), (8'ha6)}}} : (|((-(8'ha4)) ? (~(8'hb0)) : ((8'hac) && (8'ha0)))))}, 
parameter param136 = {param135, ({(^~(~|param135))} < (~^((param135 < param135) ? (param135 <<< param135) : (8'hb3))))})
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire33;
  input wire signed [(5'h12):(1'h0)] wire32;
  input wire [(5'h10):(1'h0)] wire31;
  input wire [(5'h14):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire134;
  wire signed [(4'h9):(1'h0)] wire132;
  wire signed [(5'h13):(1'h0)] wire104;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire84;
  assign y = {wire134,
                 wire132,
                 wire104,
                 wire59,
                 wire35,
                 wire34,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire84,
                 (1'h0)};
  assign wire34 = wire33;
  assign wire35 = $unsigned(wire33);
  module36 #() modinst60 (wire59, clk, wire33, wire29, wire35, wire30, wire32);
  assign wire61 = wire30;
  assign wire62 = ($unsigned(($signed($unsigned((8'hb7))) << ((wire32 - (7'h44)) >>> (^~wire59)))) & $signed((&(-((8'ha2) ?
                      wire30 : wire33)))));
  assign wire63 = $signed((8'hb5));
  assign wire64 = wire63[(2'h3):(2'h3)];
  module65 #() modinst85 (wire84, clk, wire35, wire29, wire63, wire59, wire32);
  module86 #() modinst105 (.clk(clk), .wire90(wire33), .wire89(wire63), .y(wire104), .wire87(wire30), .wire88(wire61));
  module106 #() modinst133 (.clk(clk), .wire109(wire84), .wire110(wire33), .wire108(wire35), .wire107(wire59), .y(wire132));
  assign wire134 = $signed(({wire32, $signed((wire64 ? wire63 : wire30))} ?
                       $unsigned($unsigned(wire33[(5'h10):(3'h5)])) : $signed($signed(wire59[(1'h0):(1'h0)]))));
endmodule

module module106
#(parameter param131 = ({(^({(8'hac)} ? ((8'ha4) ? (8'hbe) : (7'h40)) : ((8'ha3) ? (8'ha7) : (8'hb7)))), ((((7'h43) * (7'h44)) >>> {(8'hb0)}) >> (~((8'h9f) >= (8'hb9))))} ? (((^((8'haa) ^~ (8'haa))) ^ (((8'h9f) ? (8'h9c) : (7'h42)) * (|(8'ha5)))) ? (({(8'h9d), (8'hbe)} ? ((8'hb0) - (7'h40)) : (-(8'ha0))) & {{(8'ha6), (8'hb5)}, ((8'hb9) <= (8'h9c))}) : ((((8'hbf) ^~ (8'ha7)) ? {(8'hac), (8'ha8)} : ((8'hbf) ? (8'hb2) : (8'hba))) ? (((8'hb2) <<< (8'ha8)) * ((8'h9d) ? (8'ha4) : (8'had))) : (((8'ha2) >> (8'hb2)) ? (8'ha0) : ((8'hac) | (8'ha3))))) : ((-(-(|(8'ha6)))) > ((|(~^(8'hae))) ? (((8'h9d) ? (8'ha2) : (8'hb6)) << (+(8'ha3))) : ({(8'h9f)} ? (&(8'hba)) : {(8'haa)})))))
(y, clk, wire110, wire109, wire108, wire107);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire110;
  input wire signed [(5'h15):(1'h0)] wire109;
  input wire signed [(5'h14):(1'h0)] wire108;
  input wire [(4'hc):(1'h0)] wire107;
  wire [(4'h9):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire [(3'h4):(1'h0)] wire113;
  wire signed [(5'h14):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  reg signed [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire111 = wire108;
  assign wire112 = wire108[(2'h3):(1'h0)];
  assign wire113 = wire109;
  assign wire114 = $signed((!wire112));
  assign wire115 = $signed((($unsigned($unsigned(wire113)) ?
                           (~$signed(wire110)) : wire109[(3'h5):(1'h1)]) ?
                       (|(~^wire107[(1'h1):(1'h1)])) : ($unsigned($unsigned((8'h9f))) ?
                           wire111[(1'h1):(1'h0)] : ((wire112 ^ wire110) ?
                               wire111 : $unsigned(wire114)))));
  assign wire116 = (-(-({(-wire113)} ?
                       wire107[(1'h1):(1'h1)] : ((wire110 ?
                           wire112 : wire115) > (wire109 ?
                           wire110 : wire109)))));
  assign wire117 = (wire113 ?
                       $unsigned(wire108[(3'h4):(3'h4)]) : ($unsigned(((wire115 ?
                           wire109 : (8'ha9)) >>> wire108[(4'hf):(3'h4)])) << $unsigned(({(8'hbe)} >>> (wire110 && (8'ha1))))));
  always
    @(posedge clk) begin
      if (wire111[(2'h2):(1'h1)])
        begin
          if ((^((|(~&$signed(wire117))) != $unsigned((~(wire113 >> wire111))))))
            begin
              reg118 <= (|(wire113[(2'h2):(1'h0)] ?
                  ($signed(wire117) ?
                      $signed($signed(wire113)) : wire110[(1'h1):(1'h1)]) : $unsigned($unsigned((~|(8'hbd))))));
            end
          else
            begin
              reg118 <= $signed((+wire111[(3'h7):(3'h4)]));
              reg119 <= wire116[(3'h5):(1'h0)];
            end
        end
      else
        begin
          reg118 <= {$signed($signed({(wire114 ~^ wire107)}))};
          if ((!$unsigned(wire117)))
            begin
              reg119 <= (!wire117[(4'h8):(1'h0)]);
              reg120 <= wire110;
              reg121 <= (((~&(8'had)) ?
                  (wire109[(3'h4):(3'h4)] ?
                      $signed((wire113 ?
                          wire114 : wire113)) : ((wire109 < (8'hb2)) ?
                          (|wire113) : $unsigned(reg118))) : wire109[(3'h4):(1'h0)]) <<< ($unsigned($unsigned({(8'hbd),
                      wire110})) ?
                  $signed((+(8'h9e))) : $unsigned(wire108)));
              reg122 <= ($signed(wire113) >>> $unsigned((8'hb1)));
            end
          else
            begin
              reg119 <= ((wire112[(3'h7):(1'h1)] ^~ wire115[(2'h3):(2'h2)]) > wire107[(4'hb):(1'h0)]);
              reg120 <= {wire113,
                  ((wire107 > $unsigned($unsigned(wire110))) ?
                      {$unsigned(reg122)} : wire116[(3'h4):(1'h1)])};
              reg121 <= $signed($signed(reg119));
              reg122 <= wire111;
              reg123 <= wire110;
            end
          reg124 <= (wire116 >>> ($signed(reg120) >= ({((8'h9e) ~^ reg123)} < (~&$signed(wire107)))));
          reg125 <= (reg122[(2'h3):(1'h1)] > (reg123[(4'hc):(4'hc)] ^~ wire109[(5'h10):(4'h9)]));
          reg126 <= $signed((~|wire117));
        end
      reg127 <= reg123[(5'h10):(4'hb)];
      reg128 <= $unsigned(((~|((~wire113) * $signed(wire111))) & {reg123[(4'hd):(1'h1)],
          (reg121 * (-(8'ha4)))}));
      if ((8'hbe))
        begin
          reg129 <= {$signed($signed(((8'hb7) ?
                  $unsigned(reg126) : $signed(reg126))))};
          reg130 <= wire107;
        end
      else
        begin
          reg129 <= reg119[(4'ha):(4'h8)];
          reg130 <= wire116[(1'h1):(1'h0)];
        end
    end
endmodule

module module86  (y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire90;
  input wire signed [(5'h11):(1'h0)] wire89;
  input wire [(2'h3):(1'h0)] wire88;
  input wire [(5'h14):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire103;
  wire signed [(4'he):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire signed [(4'hb):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 (1'h0)};
  assign wire91 = ((wire89[(3'h6):(1'h0)] != $signed($signed({wire87,
                          wire89}))) ?
                      (7'h41) : (~($signed((^~wire90)) ?
                          ({wire88} && $unsigned(wire89)) : $unsigned($unsigned(wire87)))));
  assign wire92 = wire89;
  assign wire93 = (^(~^((+(wire91 ?
                      wire90 : wire89)) ^~ wire91[(1'h0):(1'h0)])));
  assign wire94 = (+(~^wire87));
  assign wire95 = wire90[(4'hd):(4'h9)];
  assign wire96 = ((wire93 ?
                          ($signed(wire94[(2'h2):(1'h0)]) & $signed(wire87)) : wire95) ?
                      (-{wire88, wire95[(2'h3):(1'h0)]}) : {wire90,
                          wire94[(1'h1):(1'h1)]});
  assign wire97 = (wire89[(4'h9):(4'h9)] ?
                      $unsigned(wire89[(3'h7):(3'h6)]) : $unsigned((~&{$unsigned(wire93)})));
  assign wire98 = (^(wire96[(2'h3):(1'h1)] >= wire97));
  assign wire99 = ((wire93 ?
                      ({(-wire94), wire95} ?
                          $unsigned((wire98 || (8'hb9))) : ({wire91} >= $unsigned(wire90))) : ($unsigned((wire89 ?
                          (8'ha1) : (8'h9c))) | wire94[(2'h2):(1'h0)])) >= (wire91 ?
                      (^wire92[(4'hb):(3'h4)]) : (~|wire94)));
  assign wire100 = {(wire95[(2'h3):(1'h1)] ?
                           (wire94 ?
                               ($unsigned(wire87) >= (~&wire90)) : (wire95[(2'h2):(1'h1)] ^~ wire92[(3'h7):(3'h7)])) : wire94[(2'h2):(2'h2)])};
  assign wire101 = ($signed((~^(wire90 <= (~&wire90)))) ?
                       $signed(wire93) : $signed((-$unsigned($signed(wire94)))));
  assign wire102 = (($signed(((|(8'ha5)) ~^ {wire99,
                       wire96})) + (|(-(!wire99)))) >= {(wire88 << (((8'hbb) ?
                               wire93 : wire88) ?
                           (8'hbd) : (wire99 & wire88))),
                       $signed(wire99)});
  assign wire103 = ($signed((!(~&$signed(wire91)))) <= wire100[(2'h2):(1'h0)]);
endmodule

module module65
#(parameter param82 = ((!{(~((8'haf) >>> (8'hb8)))}) ? {(&({(8'hb2)} ? ((8'hb4) ? (8'hb4) : (8'hab)) : {(8'ha0), (8'hba)}))} : (|((~|((8'hb7) ? (8'ha3) : (7'h44))) <<< (((8'ha9) ? (7'h42) : (8'ha9)) + ((7'h40) - (7'h43)))))), 
parameter param83 = (8'ha5))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire70;
  input wire [(3'h5):(1'h0)] wire69;
  input wire signed [(3'h4):(1'h0)] wire68;
  input wire [(3'h4):(1'h0)] wire67;
  input wire signed [(3'h7):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  assign y = {wire81,
                 wire73,
                 wire72,
                 wire71,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire71 = {wire69[(1'h1):(1'h0)]};
  assign wire72 = $unsigned($unsigned($unsigned(wire67)));
  assign wire73 = wire72[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg74 <= wire71[(5'h12):(4'hf)];
      reg75 <= wire70[(4'h9):(3'h7)];
      if ($unsigned((-(wire72[(3'h7):(3'h7)] || ((wire73 ?
          wire72 : wire70) || (wire67 == wire69))))))
        begin
          reg76 <= wire68[(1'h0):(1'h0)];
          if ({(($signed({wire69}) ?
                  reg76 : (&(8'ha7))) >= reg76[(3'h7):(3'h5)])})
            begin
              reg77 <= wire68[(1'h0):(1'h0)];
            end
          else
            begin
              reg77 <= $signed($signed($unsigned((reg76 >> (~|reg75)))));
              reg78 <= (wire73 >= (|$unsigned(wire73)));
              reg79 <= $unsigned(($signed(($unsigned(reg75) > (~reg78))) ?
                  wire72[(3'h5):(2'h3)] : {(-(reg75 ~^ wire67)),
                      reg76[(4'hf):(4'hd)]}));
              reg80 <= {({reg75[(4'ha):(4'h8)]} ?
                      $unsigned(reg76) : (^($unsigned(reg76) ?
                          wire72 : (reg79 ? reg76 : wire68))))};
            end
        end
      else
        begin
          reg76 <= (((reg76 ^~ $unsigned($signed(wire66))) ?
                  wire66 : $unsigned(((reg74 && wire72) ?
                      ((8'ha7) ~^ reg80) : (reg79 | wire71)))) ?
              {(|(+reg77))} : $signed(($signed($signed(reg74)) >= $unsigned((reg77 ?
                  reg79 : reg74)))));
        end
    end
  assign wire81 = reg76;
endmodule

module module36
#(parameter param58 = ({((((8'hbc) ? (8'hba) : (8'haf)) ? (~&(8'hbb)) : {(8'ha0), (8'hb3)}) >> ((^~(8'ha3)) ? {(8'ha0)} : ((8'hb5) + (8'ha6))))} ^~ {((((8'hb4) - (8'h9c)) ? ((8'h9e) >= (8'h9f)) : (8'ha1)) >= (((8'ha5) & (8'ha4)) * {(8'hb8), (7'h44)})), ((8'h9f) + {((8'hb4) >> (8'hb8)), ((8'hb9) ^~ (8'hb9))})}))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire41;
  input wire signed [(4'h9):(1'h0)] wire40;
  input wire signed [(4'ha):(1'h0)] wire39;
  input wire [(3'h5):(1'h0)] wire38;
  input wire [(4'hb):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire42;
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
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
                 (1'h0)};
  assign wire42 = wire37[(2'h2):(2'h2)];
  assign wire43 = $unsigned($signed(wire38[(3'h4):(2'h2)]));
  assign wire44 = (($signed((~^wire42[(2'h2):(1'h1)])) ?
                          wire38 : $signed((~|wire38[(3'h4):(1'h0)]))) ?
                      wire37[(3'h7):(1'h0)] : $unsigned((8'ha1)));
  always
    @(posedge clk) begin
      reg45 <= ((~|$signed($signed(wire37[(4'h9):(1'h0)]))) && $unsigned($unsigned(wire38)));
      if (((+wire40) ^~ (!wire44[(3'h5):(1'h1)])))
        begin
          reg46 <= $signed({$unsigned(wire41), wire43});
          reg47 <= wire43[(3'h7):(2'h3)];
        end
      else
        begin
          if (($unsigned(wire41[(4'ha):(4'h9)]) ^ $signed((|wire42[(2'h3):(2'h2)]))))
            begin
              reg46 <= wire44[(3'h4):(2'h3)];
            end
          else
            begin
              reg46 <= wire40[(3'h6):(3'h6)];
              reg47 <= $signed(reg46[(4'hf):(4'hb)]);
              reg48 <= (~|wire40[(3'h6):(1'h0)]);
              reg49 <= wire40;
            end
          reg50 <= $unsigned(($unsigned(($unsigned((8'hbf)) ^~ (8'had))) ?
              $signed(wire38) : {reg49}));
          reg51 <= wire40[(3'h7):(3'h4)];
          if ((~&(reg50[(4'hf):(4'hb)] | (wire41 >= (!wire42[(2'h3):(1'h0)])))))
            begin
              reg52 <= (~&reg47);
              reg53 <= ((reg49 ? wire37 : (reg47 == reg50[(4'h8):(3'h6)])) ?
                  $signed((~^reg47)) : $unsigned(((8'had) ^~ (8'hbc))));
              reg54 <= $unsigned((reg53 < reg46));
            end
          else
            begin
              reg52 <= {$unsigned($signed((8'hb3))), {reg47[(4'ha):(2'h2)]}};
            end
          reg55 <= wire43;
        end
      reg56 <= reg48[(4'hd):(4'hb)];
      reg57 <= (reg52[(3'h4):(1'h0)] ?
          reg49[(3'h7):(2'h2)] : $signed(({(!(8'ha9))} * {reg51[(3'h4):(2'h3)]})));
    end
endmodule
