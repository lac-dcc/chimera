module top
#(parameter param140 = ({(~(((8'hab) <= (8'hb9)) ^ (~|(8'ha2))))} ~^ (({((8'hbe) ? (8'hb6) : (8'ha0)), {(8'had), (8'hb3)}} ? ((!(8'hac)) < (7'h42)) : (~{(7'h41), (7'h44)})) != ((((8'ha1) ? (8'ha5) : (8'h9c)) >= {(8'hb7)}) ? (((8'hac) ? (8'ha9) : (8'hb9)) | ((8'hb1) ? (8'ha7) : (8'ha3))) : (&((8'hbe) ? (7'h40) : (8'hb6)))))), 
parameter param141 = param140)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire135;
  wire [(5'h13):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire98;
  wire [(4'hf):(1'h0)] wire97;
  wire signed [(3'h7):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire94;
  reg signed [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(5'h12):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  assign y = {wire135,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire94,
                 reg139,
                 reg138,
                 reg137,
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
                 (1'h0)};
  module5 #() modinst95 (wire94, clk, wire3, wire4, wire1, wire2, wire0);
  assign wire96 = wire2;
  assign wire97 = wire94;
  assign wire98 = $unsigned((!((|(wire97 && wire1)) ?
                      ((|wire4) ~^ {wire3}) : $signed((~wire96)))));
  assign wire99 = {((&((wire4 ? wire1 : wire1) ?
                          wire94 : ((8'h9f) + wire1))) >= wire94),
                      wire0[(3'h7):(3'h5)]};
  assign wire100 = (&wire94);
  always
    @(posedge clk) begin
      reg101 <= (^~wire99[(3'h4):(1'h1)]);
      reg102 <= wire4;
      if ((&($signed(reg101) ?
          ($signed($unsigned(wire0)) ?
              ((~^wire0) ?
                  (reg102 >= wire0) : {wire98,
                      wire3}) : reg102) : {$unsigned($unsigned(reg101))})))
        begin
          reg103 <= wire2;
          if (wire98[(3'h6):(3'h6)])
            begin
              reg104 <= $signed($signed($unsigned($unsigned((wire3 ?
                  reg102 : wire2)))));
              reg105 <= ((8'ha7) ?
                  {$signed($unsigned({reg102})),
                      ((!$unsigned((8'hbb))) >> $signed((~wire96)))} : (((8'hb4) ?
                      (^~wire4[(4'hb):(3'h7)]) : $unsigned((8'hba))) >>> {(reg101 ?
                          (wire99 << wire97) : (wire0 ? wire2 : wire97))}));
              reg106 <= reg102[(1'h1):(1'h0)];
              reg107 <= (($signed($unsigned((+wire97))) ?
                      (wire99 ?
                          {$signed(wire4),
                              ((8'hb7) ?
                                  wire99 : wire0)} : {(-wire97)}) : {($unsigned(reg104) ^~ wire2),
                          ((~^reg101) <<< $signed(wire96))}) ?
                  reg104 : (reg105[(3'h5):(2'h3)] & ((!$signed(wire1)) ?
                      $signed((8'h9f)) : (^~$unsigned((8'ha9))))));
            end
          else
            begin
              reg104 <= reg103[(5'h13):(5'h11)];
              reg105 <= wire1[(1'h1):(1'h0)];
              reg106 <= (wire97 ?
                  ({$signed($unsigned(wire3)), {(~|wire98), $signed(wire94)}} ?
                      $unsigned($signed((wire100 ?
                          wire94 : wire97))) : {reg103[(5'h11):(3'h7)],
                          reg107}) : $unsigned(wire2));
              reg107 <= wire3;
              reg108 <= ((reg106 ? reg103 : $unsigned(wire2)) << {(~^reg103),
                  (((wire0 ?
                      reg104 : wire4) ^ $unsigned(wire100)) - $signed($signed(reg101)))});
            end
          reg109 <= $signed(wire99[(4'hd):(1'h1)]);
          reg110 <= $signed(({(reg109[(3'h6):(2'h2)] ?
                      $signed((7'h40)) : (^~reg104)),
                  $unsigned($unsigned(wire4))} ?
              reg105 : reg103[(4'hd):(4'hc)]));
        end
      else
        begin
          reg103 <= wire97[(4'hd):(1'h0)];
          reg104 <= $signed(((wire2 | reg102[(1'h1):(1'h1)]) <= ((|wire1) ?
              (reg107[(4'hf):(4'hb)] ?
                  $unsigned(wire100) : (wire0 ?
                      reg101 : reg110)) : (^~$signed(reg101)))));
          reg105 <= ($signed((~^((reg103 ^~ wire1) ?
                  $unsigned(wire1) : (^~wire96)))) ?
              ({((reg105 ^ reg101) ?
                      wire1[(1'h1):(1'h1)] : wire100)} - wire99) : wire94[(4'h9):(1'h1)]);
          if (wire2)
            begin
              reg106 <= reg103[(4'h9):(3'h4)];
              reg107 <= wire99[(3'h7):(2'h3)];
              reg108 <= $unsigned(reg101[(1'h1):(1'h1)]);
              reg109 <= (reg102[(1'h1):(1'h1)] ?
                  $unsigned((-(8'hbf))) : $signed((wire99[(2'h3):(1'h1)] ?
                      $signed($signed((8'h9c))) : reg109)));
              reg110 <= wire98[(1'h1):(1'h1)];
            end
          else
            begin
              reg106 <= ((~(reg108[(2'h2):(1'h1)] ?
                  $unsigned(((8'ha3) ~^ wire100)) : $unsigned((7'h44)))) <<< $signed($unsigned(((wire0 ?
                      reg108 : wire94) ?
                  wire1[(2'h2):(1'h1)] : (~(8'ha2))))));
            end
        end
    end
  module111 #() modinst136 (wire135, clk, wire1, wire100, reg101, reg107);
  always
    @(posedge clk) begin
      reg137 <= $signed(wire2[(1'h1):(1'h0)]);
      reg138 <= ($unsigned((~&(reg103 ?
          $unsigned(reg105) : $signed(wire4)))) < ((+(8'ha1)) * wire100[(3'h5):(2'h3)]));
      reg139 <= wire135;
    end
endmodule

module module111
#(parameter param134 = (((|(((8'hbd) && (8'hba)) ? (~(8'h9e)) : ((8'hb2) >>> (8'h9f)))) ? ({{(8'h9d), (7'h43)}, (+(8'hbb))} << (-((8'hb6) == (8'hb9)))) : (|{((7'h44) || (8'ha2)), (+(8'hbd))})) && ((&(((8'hab) ? (8'hba) : (8'hab)) <= ((8'ha3) ? (8'ha7) : (8'ha9)))) ? ((~((7'h43) | (8'h9c))) >>> (^~((8'had) <<< (8'hb4)))) : ((((8'ha6) ? (8'hbc) : (8'ha2)) ? ((8'hab) ? (8'ha0) : (8'ha0)) : {(8'haa)}) ? (8'ha2) : {(+(7'h43))}))))
(y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire115;
  input wire [(3'h5):(1'h0)] wire114;
  input wire signed [(3'h4):(1'h0)] wire113;
  input wire [(5'h14):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire133;
  wire signed [(4'ha):(1'h0)] wire132;
  wire signed [(5'h12):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire116;
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire118,
                 wire117,
                 wire116,
                 reg131,
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
                 (1'h0)};
  assign wire116 = wire114[(3'h5):(1'h0)];
  assign wire117 = wire113;
  assign wire118 = wire114;
  always
    @(posedge clk) begin
      reg119 <= (^$unsigned($unsigned(wire114[(3'h4):(3'h4)])));
      reg120 <= (((!reg119[(1'h1):(1'h0)]) <= wire112) ?
          (+wire112[(5'h14):(4'hb)]) : ((wire114[(1'h0):(1'h0)] ~^ reg119[(4'ha):(3'h7)]) ~^ $unsigned(wire113[(1'h0):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg121 <= $signed((+(-(~$unsigned(reg119)))));
    end
  always
    @(posedge clk) begin
      if ((&($unsigned($signed((~&wire113))) == $unsigned(reg121[(3'h7):(2'h3)]))))
        begin
          reg122 <= $signed(wire116[(1'h0):(1'h0)]);
          reg123 <= $signed($unsigned((8'ha4)));
        end
      else
        begin
          if (({wire113} >> ($signed($signed((!wire117))) ?
              ((~^(&(8'ha0))) ^~ reg121) : ($unsigned((wire113 ?
                      wire116 : (8'ha9))) ?
                  wire112 : (~(reg123 * wire114))))))
            begin
              reg122 <= {reg121, reg119};
              reg123 <= {($signed($signed($signed(wire114))) != ({(reg120 && reg119),
                          (wire113 ? reg121 : wire112)} ?
                      (wire115 > $signed(wire114)) : $signed((wire115 ?
                          reg122 : wire118)))),
                  wire114[(3'h4):(1'h1)]};
              reg124 <= wire114[(1'h0):(1'h0)];
            end
          else
            begin
              reg122 <= ($signed($signed($signed($unsigned(reg121)))) ^~ $unsigned(wire116));
              reg123 <= wire118[(3'h7):(3'h7)];
              reg124 <= (8'hb4);
              reg125 <= {(~|($signed((wire117 ? wire115 : (8'h9e))) ?
                      (~&(!(8'ha1))) : $unsigned(wire116))),
                  {$unsigned($signed(reg122[(2'h3):(2'h2)]))}};
              reg126 <= (((!$unsigned((!reg119))) < $unsigned(reg125)) != ((-($unsigned(wire117) ?
                      $signed(reg125) : wire117)) ?
                  $unsigned({$signed(wire112)}) : (+$signed((reg122 ?
                      reg120 : wire116)))));
            end
          reg127 <= $unsigned((-((((8'h9d) ~^ (8'h9c)) ?
                  {reg122, reg124} : {(8'ha5)}) ?
              $unsigned((8'hb2)) : {{reg123, wire115}})));
          reg128 <= (7'h42);
          reg129 <= $unsigned(wire115[(2'h3):(2'h3)]);
          reg130 <= (~^(wire113 ? $unsigned(wire116[(1'h1):(1'h0)]) : (8'h9e)));
        end
      reg131 <= (reg126 ?
          $unsigned($unsigned($unsigned((|reg129)))) : $unsigned(reg119[(4'h9):(2'h3)]));
    end
  assign wire132 = (((&reg129) ?
                           $unsigned(reg127) : $unsigned((reg120 ?
                               {(8'hbc), wire113} : (reg125 > wire117)))) ?
                       reg124[(3'h5):(3'h5)] : wire112[(2'h3):(1'h0)]);
  assign wire133 = reg130[(4'hc):(1'h0)];
endmodule

module module5
#(parameter param92 = (|({(((8'hbc) ? (8'ha0) : (8'h9d)) >>> ((8'hbf) >= (8'ha6))), (((8'hb1) > (8'h9f)) | ((8'haf) * (8'hb9)))} ^~ ((!((8'hba) != (7'h41))) * (((8'hb9) - (8'h9d)) ? (~^(8'hb7)) : ((8'h9e) ^ (8'ha8)))))), 
parameter param93 = (~|((~^((param92 > param92) || ((8'hac) & param92))) ? (~|((^param92) ? (param92 && (8'ha9)) : (!param92))) : {(+(|param92)), ((param92 ^~ param92) ? (|param92) : (-param92))})))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire6;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire88;
  wire [(4'h9):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire78;
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire11,
                 wire28,
                 wire29,
                 wire35,
                 wire78,
                 reg87,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
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
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 (1'h0)};
  assign wire11 = (8'ha0);
  always
    @(posedge clk) begin
      reg12 <= $signed({($unsigned(wire8) == {(wire6 ? (8'h9c) : wire10)})});
      reg13 <= {wire8[(2'h3):(1'h0)]};
      if ($unsigned($unsigned({$signed($unsigned(wire8)),
          (~wire8[(2'h2):(1'h1)])})))
        begin
          reg14 <= (~$unsigned({(reg12 || (^wire7))}));
          if ($signed((8'hbd)))
            begin
              reg15 <= $signed($unsigned({$unsigned(reg13[(3'h4):(2'h2)])}));
              reg16 <= reg14;
              reg17 <= (8'ha6);
            end
          else
            begin
              reg15 <= (^reg14);
              reg16 <= ($signed((~|reg12[(3'h6):(3'h5)])) ?
                  $unsigned(reg14[(4'hb):(3'h6)]) : $signed({$signed($unsigned(wire6))}));
              reg17 <= $signed($signed((wire7[(3'h6):(1'h1)] ?
                  $signed(wire7) : $unsigned((wire7 ? (8'hb6) : (8'ha8))))));
              reg18 <= (8'hac);
              reg19 <= ($unsigned(wire10) ?
                  ((^~$signed($signed((7'h44)))) ?
                      wire6 : (+wire11)) : (&reg17[(1'h1):(1'h0)]));
            end
          reg20 <= ($signed($unsigned($unsigned({wire10, reg13}))) ?
              reg15 : $unsigned((reg16[(1'h0):(1'h0)] ?
                  $unsigned(reg15) : $signed($unsigned(reg14)))));
          reg21 <= $unsigned(reg17[(5'h12):(4'he)]);
          if ($signed(($unsigned($unsigned(reg13[(2'h2):(1'h1)])) <<< $signed($signed(((8'ha1) ?
              reg12 : wire9))))))
            begin
              reg22 <= wire9[(2'h2):(1'h1)];
            end
          else
            begin
              reg22 <= $unsigned(reg15[(1'h0):(1'h0)]);
              reg23 <= (8'ha5);
              reg24 <= reg16;
              reg25 <= {{{(wire9[(3'h4):(2'h3)] ? reg23 : (!wire9)),
                          (reg12[(3'h7):(3'h7)] * $signed(reg15))},
                      (^~(~^{(8'hac)}))},
                  $unsigned(reg23)};
            end
        end
      else
        begin
          reg14 <= reg16[(1'h0):(1'h0)];
          reg15 <= $signed((($unsigned((|wire6)) ?
                  reg18[(4'h8):(1'h0)] : $unsigned($signed((8'ha7)))) ?
              {(reg13 > {reg25, reg20}),
                  (+$signed(wire8))} : $signed(((wire7 && reg16) + ((8'ha9) ?
                  reg14 : reg12)))));
          reg16 <= (((((^reg25) ? $unsigned(reg15) : wire11[(4'h9):(2'h2)]) ?
              $unsigned((~reg24)) : ((reg18 < wire7) >>> $signed(wire8))) != ($unsigned((reg19 ?
                  (8'hb4) : reg24)) ?
              reg22[(4'hd):(1'h0)] : $unsigned(wire6[(1'h1):(1'h0)]))) > (({(!reg19)} > reg24[(1'h1):(1'h1)]) ?
              reg12[(4'h8):(1'h0)] : {({reg16} || {wire8, reg14}),
                  $signed($signed(wire6))}));
          reg17 <= (((((wire10 || reg14) ?
                      (wire8 ?
                          reg24 : reg23) : $unsigned(reg18)) > $unsigned((^~wire9))) ?
                  (+wire10) : (~&(8'hb1))) ?
              (reg18[(5'h12):(5'h12)] >= $unsigned((~^$signed(reg22)))) : reg22[(4'hb):(3'h4)]);
        end
      reg26 <= ((~&(($unsigned(reg15) & ((7'h44) ^~ wire11)) ?
              $signed(reg17) : reg22)) ?
          $signed({$unsigned(reg17[(1'h0):(1'h0)])}) : reg18[(2'h2):(1'h0)]);
      reg27 <= reg13;
    end
  assign wire28 = $unsigned($unsigned($unsigned($unsigned(reg23[(2'h2):(2'h2)]))));
  assign wire29 = reg20[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      if ($signed($signed((reg14[(3'h5):(3'h5)] ?
          (reg26 ? {wire9, reg24} : (reg20 ~^ reg17)) : reg27))))
        begin
          if (reg20)
            begin
              reg30 <= $signed($signed(wire6));
              reg31 <= (8'ha6);
              reg32 <= (~|(~&($signed((reg26 ?
                  reg24 : wire28)) <<< reg13[(3'h4):(1'h0)])));
              reg33 <= $signed((({{wire9, reg23}, ((8'hab) & reg16)} ?
                      ((reg20 != wire11) != $signed(wire6)) : (~|{reg22,
                          reg16})) ?
                  (~^((reg23 > wire11) != (^reg31))) : reg23));
              reg34 <= $signed(({$unsigned(reg12[(4'h8):(3'h7)]),
                  reg27} - ($unsigned((wire29 ?
                  (8'hab) : reg33)) >>> $signed((wire8 ? reg13 : reg15)))));
            end
          else
            begin
              reg30 <= ($unsigned($signed(((reg22 ?
                  wire7 : wire28) ~^ (8'ha2)))) << ((reg32 * {reg30}) ?
                  reg23[(1'h0):(1'h0)] : reg16));
            end
        end
      else
        begin
          reg30 <= (wire28[(4'h9):(4'h8)] ?
              $signed(wire7[(3'h5):(2'h3)]) : ($signed((8'hb2)) ^~ $signed(reg26)));
        end
    end
  assign wire35 = $signed($unsigned((+reg33[(2'h3):(2'h2)])));
  module36 #() modinst79 (.clk(clk), .y(wire78), .wire40(reg25), .wire39(reg26), .wire38(reg22), .wire37(wire35));
  assign wire80 = ($signed((^~reg21)) <<< $signed($unsigned(reg26[(4'h8):(3'h5)])));
  assign wire81 = (reg23 <= ((~|reg32) >> $signed($unsigned($signed(wire10)))));
  assign wire82 = (reg27 == (^~reg31[(1'h1):(1'h1)]));
  assign wire83 = wire81;
  assign wire84 = $unsigned($signed(((wire8 != reg19) * wire80[(1'h1):(1'h1)])));
  assign wire85 = $unsigned($signed(wire80));
  assign wire86 = (((8'ha5) ?
                          $signed(((|reg16) ?
                              (-reg12) : $unsigned((8'ha5)))) : reg24) ?
                      {$unsigned($unsigned((wire35 ? (7'h40) : reg30))),
                          $signed({$unsigned((8'h9c)),
                              (~|wire80)})} : reg18[(4'hb):(1'h1)]);
  always
    @(posedge clk) begin
      reg87 <= $unsigned($signed(((reg25[(4'h8):(3'h6)] ?
              (reg20 > reg34) : (reg24 - wire9)) ?
          (!(reg34 ? wire29 : wire10)) : {reg26, wire11})));
    end
  assign wire88 = reg13;
  assign wire89 = reg21;
  assign wire90 = (+((({wire88, wire9} != (reg20 ?
                          wire35 : wire6)) > (~|(reg19 ? wire84 : wire82))) ?
                      $unsigned(((|(8'hb7)) ?
                          $signed((8'hbc)) : wire83[(1'h0):(1'h0)])) : (8'hb4)));
  assign wire91 = $unsigned(wire29);
endmodule

module module36
#(parameter param77 = ((-(-((^~(8'hb2)) && ((8'hb6) ^~ (8'haf))))) ? (({((8'ha3) ? (8'hbe) : (7'h42)), ((8'hb4) != (7'h43))} ? ((8'hb3) ? (&(8'hb0)) : {(8'ha8), (8'hab)}) : {((8'hb4) ^ (8'hbe))}) ? (~(((8'h9c) ? (8'hab) : (8'haa)) ? {(8'hb8), (8'hbd)} : ((8'hb8) ? (8'hb8) : (8'haf)))) : ({((8'h9c) >> (8'hbe)), ((8'hba) ? (8'hb9) : (8'had))} || (|((8'ha2) <= (8'hb9))))) : (&(-(((8'ha9) ^~ (8'hb9)) ? ((8'hbd) << (8'hb2)) : ((7'h40) >> (8'hb3)))))))
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire40;
  input wire signed [(3'h5):(1'h0)] wire39;
  input wire signed [(3'h4):(1'h0)] wire38;
  input wire signed [(3'h4):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg76,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire41 = $signed(($signed(wire38) | (!((wire37 != wire37) ?
                      (~&wire39) : wire39))));
  assign wire42 = (wire38[(2'h2):(2'h2)] <<< (^wire37));
  assign wire43 = {wire37[(2'h3):(1'h0)]};
  assign wire44 = {($unsigned($unsigned((-wire39))) >>> wire43[(4'hd):(1'h1)]),
                      wire38[(2'h3):(2'h3)]};
  assign wire45 = (!$signed(wire38));
  assign wire46 = wire39;
  assign wire47 = {($unsigned((^wire41[(2'h2):(2'h2)])) ?
                          wire43 : (+(wire46 >>> (~&wire38)))),
                      $unsigned(($signed((-wire40)) ^~ $unsigned({wire40})))};
  assign wire48 = (~|$unsigned($signed((^(wire42 >>> wire41)))));
  assign wire49 = (wire40[(5'h13):(1'h0)] >>> wire46);
  assign wire50 = ($unsigned(({$signed(wire42), (-(8'hbb))} < $signed({wire40,
                      (8'hbf)}))) ^ (!$signed({wire49, (wire41 - wire46)})));
  assign wire51 = wire49[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg52 <= (((wire38[(2'h3):(1'h1)] < {(wire44 & wire47)}) ^~ wire39) ?
          {(($signed((8'ha2)) < $signed(wire43)) ~^ wire51)} : (&$unsigned($signed((wire43 <<< wire40)))));
      reg53 <= wire37;
      if (wire39)
        begin
          if (wire50[(3'h4):(1'h1)])
            begin
              reg54 <= $signed((+((|$unsigned(wire38)) ?
                  $unsigned((^reg53)) : (^~wire40[(4'ha):(3'h5)]))));
              reg55 <= {(((wire51 ~^ $signed(wire41)) - $unsigned(wire50)) ?
                      (|$unsigned((wire44 | reg52))) : reg54[(4'hc):(1'h0)]),
                  $unsigned((((wire42 ? wire44 : reg54) ?
                          $unsigned(wire46) : (wire46 ? wire50 : wire43)) ?
                      (wire38[(3'h4):(2'h3)] <= ((8'hab) ?
                          wire46 : wire48)) : (!$unsigned(wire48))))};
              reg56 <= (8'hbd);
            end
          else
            begin
              reg54 <= ($signed($signed($unsigned(wire38))) ?
                  wire40 : wire41[(1'h1):(1'h1)]);
              reg55 <= (^~$signed((7'h44)));
              reg56 <= $unsigned($unsigned(({wire44[(4'h8):(1'h1)]} ?
                  reg56[(1'h0):(1'h0)] : reg52[(2'h3):(1'h1)])));
            end
          reg57 <= $unsigned((((reg54[(5'h12):(1'h1)] ?
              {wire45, wire41} : wire42) || (wire40 ?
              $signed((8'h9c)) : $unsigned(reg55))) <<< reg56[(1'h0):(1'h0)]));
          reg58 <= $unsigned(wire43);
        end
      else
        begin
          if (reg55[(4'he):(4'hc)])
            begin
              reg54 <= ($signed($unsigned($unsigned($unsigned(reg55)))) < {($signed((wire41 ?
                      wire49 : wire45)) >>> ({wire40} ?
                      $unsigned(reg53) : (wire47 != wire40)))});
              reg55 <= ({wire42, $unsigned(reg58[(3'h5):(1'h0)])} >> wire41);
              reg56 <= (((~(((8'h9c) ? wire45 : (8'ha8)) & $signed(wire49))) ?
                  reg53 : wire48) | reg58[(3'h5):(1'h0)]);
              reg57 <= (&{wire41,
                  (((^(8'ha7)) * (^reg52)) >= (|wire37[(1'h1):(1'h1)]))});
              reg58 <= {wire41[(2'h2):(1'h0)]};
            end
          else
            begin
              reg54 <= reg55[(4'hb):(4'h8)];
            end
          reg59 <= ($signed((wire43[(5'h12):(4'h8)] ?
                  $unsigned(wire42[(2'h2):(1'h0)]) : ((wire48 & (8'h9e)) < (8'hbe)))) ?
              $signed(reg57[(2'h2):(1'h1)]) : (~|{$unsigned((wire47 & wire51)),
                  (wire37 ? (wire42 ~^ wire45) : $unsigned((8'hb1)))}));
          if ({((reg57[(4'hc):(4'h9)] ?
                  $signed($signed(wire38)) : $signed((wire42 ^ (8'hb4)))) >> ((+(reg54 ?
                      wire42 : (8'ha4))) ?
                  (&$signed(wire39)) : $signed($unsigned(wire42))))})
            begin
              reg60 <= ((8'hb2) <= (!$signed(wire51[(2'h3):(2'h3)])));
              reg61 <= wire48[(1'h1):(1'h1)];
              reg62 <= {((((-reg54) ?
                          wire44[(2'h2):(1'h1)] : (reg53 != wire51)) && reg58[(2'h3):(1'h0)]) ?
                      ($signed(wire37) ?
                          ((wire51 || reg54) ?
                              (wire41 ?
                                  wire40 : reg58) : $signed(reg57)) : (~|wire39)) : (!(reg55[(4'he):(1'h0)] ?
                          ((8'ha1) ? wire43 : (8'hae)) : (wire44 ?
                              reg57 : wire42)))),
                  (|($signed(wire46) || {reg53[(4'hd):(4'hd)]}))};
              reg63 <= wire50[(1'h1):(1'h1)];
            end
          else
            begin
              reg60 <= (|wire38[(2'h2):(2'h2)]);
              reg61 <= $unsigned($signed((reg62[(1'h0):(1'h0)] ?
                  ($signed(reg55) ?
                      $unsigned(wire46) : wire46) : {$unsigned(reg57)})));
              reg62 <= $unsigned(reg59);
            end
          reg64 <= $signed($unsigned(((~(8'ha5)) <= wire47)));
          if ((reg64 > reg52[(2'h3):(1'h1)]))
            begin
              reg65 <= ($unsigned($signed((+(wire39 ~^ wire45)))) - $signed((reg54[(4'h9):(2'h2)] ?
                  reg64 : wire42[(1'h1):(1'h0)])));
            end
          else
            begin
              reg65 <= $unsigned((($signed(reg65[(2'h3):(1'h0)]) - (+(wire41 < (8'ha6)))) >> $signed(wire44)));
              reg66 <= wire50[(1'h1):(1'h0)];
            end
        end
      reg67 <= $unsigned(((&reg65) - ({wire38,
          {(8'hab)}} || $unsigned($unsigned(wire49)))));
      reg68 <= ({(8'ha6),
              $unsigned(((~|reg62) ?
                  wire39[(3'h4):(1'h0)] : ((8'hae) ? wire44 : (8'h9d))))} ?
          $signed(($signed((wire50 ? wire50 : wire45)) ?
              {wire43} : $signed((8'ha1)))) : ((wire51[(4'h8):(1'h0)] ^ wire44) ?
              wire40[(4'hc):(3'h4)] : reg59[(1'h1):(1'h0)]));
    end
  assign wire69 = (&reg54[(5'h10):(3'h4)]);
  assign wire70 = reg52;
  assign wire71 = (^~(~|$unsigned(((^~reg59) ?
                      (wire69 ? reg67 : reg65) : $signed(wire40)))));
  assign wire72 = $signed(($signed($signed($signed(reg56))) && wire51[(2'h3):(2'h2)]));
  assign wire73 = (~|wire37[(2'h2):(2'h2)]);
  assign wire74 = wire49[(4'h9):(3'h7)];
  assign wire75 = $signed($signed((reg66 <<< ((+reg66) ?
                      {wire43} : (wire38 + reg64)))));
  always
    @(posedge clk) begin
      reg76 <= (((^$unsigned(wire45)) >>> wire69[(3'h6):(3'h6)]) ?
          (reg60[(2'h2):(1'h0)] ^~ {wire73[(3'h4):(2'h3)]}) : {$unsigned($signed((wire38 ?
                  reg68 : reg63))),
              (reg68[(3'h7):(3'h7)] + (wire43 ? (8'hb7) : (wire38 && reg64)))});
    end
endmodule
