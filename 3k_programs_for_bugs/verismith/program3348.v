module top
#(parameter param163 = (((+(^(!(8'ha5)))) & {{((8'h9e) + (8'hbc))}}) ? ((^(((7'h44) <= (8'hb6)) ? ((8'hb5) ? (8'ha3) : (8'hb3)) : ((8'ha0) ? (8'hbc) : (7'h44)))) ? ({((8'hbd) ? (8'hbe) : (8'ha8))} ? {((8'h9e) + (8'hbf)), ((8'hb3) ? (8'hbc) : (8'hbf))} : (((8'hbb) ? (8'hba) : (8'h9c)) > ((8'hbf) ? (7'h44) : (8'hae)))) : (~&(((8'hb0) ? (8'hb1) : (8'h9e)) ? (~&(8'hbe)) : ((8'hb6) < (8'ha2))))) : {((+(&(8'hb2))) ? (8'hbb) : ({(8'hac), (8'hae)} + ((7'h44) | (8'ha5)))), (~^(8'ha5))}), 
parameter param164 = param163)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire162;
  wire signed [(5'h13):(1'h0)] wire161;
  wire signed [(5'h12):(1'h0)] wire160;
  wire [(3'h5):(1'h0)] wire159;
  wire [(3'h7):(1'h0)] wire157;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire157,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = (((wire3[(2'h3):(1'h1)] >= (!(|(8'hb8)))) >> $signed(((wire2 ?
                         (8'hac) : wire2) ?
                     wire1[(1'h0):(1'h0)] : (&wire1)))) > {$signed((wire3 ?
                         (!wire0) : (~wire1))),
                     wire2});
  assign wire5 = $signed((8'hb9));
  assign wire6 = ($unsigned((wire1 == $unsigned(wire0))) + (wire5[(2'h2):(2'h2)] ?
                     $signed((wire1 ?
                         wire2 : (~&wire3))) : wire3[(1'h1):(1'h0)]));
  module7 #() modinst158 (wire157, clk, wire1, wire3, wire4, wire5);
  assign wire159 = wire157[(2'h2):(2'h2)];
  assign wire160 = ((($signed(wire2) ?
                           $unsigned((8'ha0)) : $unsigned((wire4 ?
                               wire5 : (8'hb5)))) ?
                       wire159[(3'h4):(1'h1)] : wire6[(2'h2):(1'h0)]) != $unsigned(((wire1[(2'h2):(2'h2)] ?
                           (wire159 <<< wire6) : $signed(wire3)) ?
                       wire1[(3'h5):(1'h0)] : wire0)));
  assign wire161 = ((~|(-wire157)) ?
                       (~|wire1[(3'h7):(3'h4)]) : $signed($signed($unsigned({wire157,
                           wire2}))));
  assign wire162 = (&(wire2[(3'h4):(3'h4)] ?
                       ((!$unsigned((8'haa))) << wire157) : (~^$signed((wire4 ?
                           wire161 : wire161)))));
endmodule

module module7
#(parameter param155 = (((8'hbf) == (~^(-((8'hb3) ? (7'h42) : (8'hab))))) ? (((((8'ha9) ? (8'hbd) : (7'h40)) ^ ((8'ha9) > (8'hb3))) ? (~{(8'hb6), (8'hb1)}) : (((8'h9e) <<< (8'haf)) ? (!(8'hb5)) : ((8'ha9) ? (7'h44) : (8'h9d)))) ? ((((8'hbf) ? (8'hb5) : (8'ha0)) ? ((7'h40) * (8'hb8)) : ((8'hb3) + (8'ha4))) ? (^(^(8'hba))) : ((~|(8'ha5)) ? (+(8'h9d)) : (^~(8'hac)))) : ((((8'hbf) <<< (7'h43)) ? (8'ha1) : ((8'h9d) ? (8'hb4) : (8'hb2))) & (~^{(7'h42)}))) : (&(8'hb8))), 
parameter param156 = (((^(((8'ha4) <<< param155) | param155)) ? param155 : (~^((param155 ? param155 : param155) << ((8'ha8) + param155)))) ? (~^param155) : ({((param155 ^ param155) >= {param155, param155}), ((param155 ? (8'hba) : (7'h43)) < {(8'hb5), (8'hac)})} ? (param155 ? (8'ha5) : {(^param155), (param155 != param155)}) : param155)))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire153;
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  assign y = {wire75,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire22,
                 wire77,
                 wire78,
                 wire83,
                 wire84,
                 wire85,
                 wire153,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 (1'h0)};
  module12 #() modinst23 (wire22, clk, wire10, wire9, wire11, wire8);
  assign wire24 = (~&((^~(wire22[(3'h6):(3'h4)] & wire11)) ?
                      ($signed((wire11 ? wire11 : (7'h40))) ?
                          (-(wire22 << (8'hb2))) : ($unsigned(wire22) ?
                              (wire8 ^ wire22) : (+wire11))) : wire22));
  assign wire25 = $unsigned($unsigned(wire10));
  assign wire26 = ($unsigned(wire8[(4'h9):(3'h7)]) ?
                      $signed({(~|(wire8 ? wire25 : (8'ha9))),
                          ((&(7'h44)) ?
                              (wire9 && wire10) : wire10[(4'h9):(4'h8)])}) : wire11[(5'h10):(3'h6)]);
  assign wire27 = wire22[(3'h4):(1'h0)];
  assign wire28 = $unsigned(($unsigned((~&(wire10 ?
                      wire8 : wire24))) < (~&$unsigned((-wire25)))));
  assign wire29 = (($unsigned($signed((~|(8'ha2)))) | ($signed($signed(wire10)) == $signed((^~wire22)))) ^~ (~&wire24));
  assign wire30 = {$signed({{(~wire24)}}),
                      {{($unsigned(wire25) ? (&(7'h42)) : (+wire28))}}};
  module31 #() modinst76 (.wire34(wire8), .y(wire75), .wire36(wire26), .wire35(wire22), .wire33(wire29), .clk(clk), .wire32(wire28));
  assign wire77 = ({$unsigned({((8'hbc) >> wire27)})} << $signed((($signed(wire11) * $unsigned(wire11)) & wire30[(1'h1):(1'h1)])));
  assign wire78 = (wire28[(4'h9):(3'h6)] + ($signed(wire75) ?
                      wire10 : wire22[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      reg79 <= wire75[(1'h1):(1'h1)];
      reg80 <= $unsigned($signed(((((8'hbb) != wire8) ?
              (~|wire77) : wire30[(1'h1):(1'h0)]) ?
          {wire28[(4'ha):(3'h7)], $signed(wire11)} : (8'hb0))));
    end
  always
    @(posedge clk) begin
      reg81 <= ((($signed((wire29 << wire30)) ?
                  wire24[(4'h9):(1'h0)] : $unsigned(wire30[(2'h3):(1'h0)])) ?
              ({(reg79 == wire27), (wire9 >>> (8'hbc))} ?
                  {$unsigned(wire30)} : $unsigned({reg80,
                      wire27})) : $signed(reg79)) ?
          ($signed(reg80[(3'h5):(3'h4)]) < ((8'hb8) - (wire24 + $unsigned(wire25)))) : {wire22});
      reg82 <= reg81[(1'h1):(1'h1)];
    end
  assign wire83 = wire26;
  assign wire84 = $unsigned({wire27[(2'h2):(1'h1)], $signed(wire30)});
  assign wire85 = wire10;
  module86 #() modinst154 (wire153, clk, wire25, wire27, wire26, reg79);
endmodule

module module86
#(parameter param152 = {(&(+(8'h9f)))})
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h2c4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire90;
  input wire signed [(4'h8):(1'h0)] wire89;
  input wire [(4'he):(1'h0)] wire88;
  input wire signed [(4'hc):(1'h0)] wire87;
  wire signed [(2'h2):(1'h0)] wire151;
  wire [(5'h15):(1'h0)] wire150;
  wire signed [(3'h7):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire138;
  wire [(5'h12):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire112;
  wire [(3'h6):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire107;
  wire signed [(4'hf):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire91;
  reg [(3'h7):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg [(4'ha):(1'h0)] reg141 = (1'h0);
  reg [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire139,
                 wire138,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire91,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
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
                 reg92,
                 (1'h0)};
  assign wire91 = $signed($signed(wire88[(3'h4):(2'h2)]));
  always
    @(posedge clk) begin
      reg92 <= $signed(wire87[(1'h0):(1'h0)]);
      reg93 <= $unsigned((-{(~(8'hbb))}));
      if ((~|wire87))
        begin
          reg94 <= ($unsigned(wire87[(1'h0):(1'h0)]) - ((^~wire91) ?
              ($signed(reg93[(2'h3):(2'h3)]) >>> wire87) : $unsigned(wire87)));
          reg95 <= wire91[(1'h1):(1'h1)];
          if (($unsigned((!reg92[(2'h2):(1'h1)])) ?
              (reg95[(4'h8):(2'h2)] ^ wire90) : ($signed((wire90[(5'h13):(4'he)] <= {reg92})) <= (-(8'hab)))))
            begin
              reg96 <= ((wire87 ?
                  (reg93 ?
                      ((wire90 == wire90) * ((8'had) ?
                          (8'ha0) : (8'haa))) : reg95) : (wire89 && {reg93[(1'h1):(1'h1)]})) | reg95);
            end
          else
            begin
              reg96 <= wire90;
              reg97 <= $signed(wire91);
            end
          reg98 <= ($signed((wire87[(3'h5):(3'h5)] ~^ reg93[(2'h3):(1'h1)])) ?
              (!wire89) : ($unsigned(((wire89 <<< wire91) ?
                  (|reg95) : $signed(reg97))) >= (7'h43)));
          reg99 <= (-reg96);
        end
      else
        begin
          reg94 <= ($signed(wire88[(4'h9):(4'h8)]) == $signed((($unsigned((7'h41)) >> $signed(reg95)) == {$signed(reg94)})));
          if (wire90[(4'he):(3'h7)])
            begin
              reg95 <= wire91[(2'h2):(1'h0)];
              reg96 <= ({wire87[(4'h8):(3'h6)]} | (8'haf));
            end
          else
            begin
              reg95 <= $signed(((~&((wire91 ? (8'ha5) : reg98) != (~wire91))) ?
                  ((~^$signed(reg94)) * (~&$unsigned(wire87))) : (-((reg99 <<< wire89) | wire87))));
              reg96 <= $signed((8'ha6));
              reg97 <= (^~($signed({$unsigned((8'hbe)), $signed(wire91)}) ?
                  (wire87[(1'h0):(1'h0)] ?
                      ({reg92, wire90} * (wire90 ?
                          reg98 : (7'h43))) : reg92[(2'h3):(2'h3)]) : wire89[(3'h7):(3'h7)]));
              reg98 <= reg93;
            end
          if (wire89[(2'h2):(1'h0)])
            begin
              reg99 <= $unsigned((($unsigned(reg96[(5'h10):(4'h8)]) <<< $unsigned((!reg92))) * (reg95[(3'h6):(3'h4)] ?
                  reg93 : (!$signed(reg96)))));
            end
          else
            begin
              reg99 <= ((~|wire91[(1'h1):(1'h1)]) ?
                  $unsigned(($signed(((8'hb9) ? wire91 : reg98)) ?
                      (~&(~^reg94)) : ($unsigned(reg94) ?
                          (+reg93) : $signed(reg94)))) : wire89[(2'h2):(2'h2)]);
              reg100 <= (reg99 ?
                  (reg97[(2'h2):(1'h1)] ?
                      ((+reg95) ? wire90[(3'h6):(1'h0)] : wire89) : (~{{wire87},
                          (reg94 ?
                              reg99 : reg94)})) : ((^~wire87[(4'hb):(4'h9)]) != $signed(reg94)));
              reg101 <= (reg92[(1'h1):(1'h0)] ?
                  ((({reg93, reg94} > reg97) * (+$signed(reg98))) ?
                      reg95 : reg94) : $unsigned((~&$unsigned($unsigned(wire90)))));
              reg102 <= (^(($signed((~&reg99)) > $unsigned((~&reg94))) << ($unsigned(reg100[(4'h8):(3'h6)]) ^~ (|$signed(reg101)))));
              reg103 <= (reg93[(2'h3):(2'h3)] >> (|wire87[(1'h0):(1'h0)]));
            end
        end
    end
  assign wire104 = $unsigned(reg102);
  assign wire105 = ($signed(($unsigned($unsigned(wire88)) ~^ ($signed(wire87) ?
                       (reg102 ?
                           reg97 : wire89) : (~reg103)))) | $unsigned(reg93[(3'h5):(2'h3)]));
  assign wire106 = $signed(wire105[(3'h5):(1'h0)]);
  assign wire107 = reg95[(2'h2):(1'h0)];
  assign wire108 = $signed($signed($signed((&{reg100, (8'hbf)}))));
  assign wire109 = {(^{(|(reg93 > wire91)),
                           (((8'hb5) ? reg103 : reg103) ?
                               {wire106, (8'h9d)} : $signed((8'h9c)))}),
                       $unsigned($signed(wire104[(2'h3):(1'h0)]))};
  assign wire110 = $unsigned($signed($unsigned((8'hb3))));
  assign wire111 = (~|(({$signed(reg94)} == reg93) != reg96[(4'h9):(1'h0)]));
  assign wire112 = ((wire109 <<< (($signed(reg92) ?
                       (reg94 ? reg102 : reg92) : (reg97 ?
                           wire90 : (7'h44))) || (^$signed(wire87)))) < {(reg100 <<< wire110)});
  assign wire113 = reg93[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg114 <= reg93[(2'h3):(2'h3)];
      if ((wire90 * $unsigned(((8'hba) <= $signed({wire107})))))
        begin
          reg115 <= (^$signed($signed({((8'hbb) ? reg94 : (8'h9f)),
              (reg102 ? reg93 : reg94)})));
          reg116 <= wire89;
          reg117 <= (($signed({(8'h9d),
                  (reg96 ? reg101 : (7'h40))}) <<< reg95) ?
              reg95 : {$signed($signed(reg103[(2'h2):(2'h2)]))});
        end
      else
        begin
          reg115 <= ((reg95[(4'hb):(4'ha)] ?
              (((7'h44) ?
                  reg97[(3'h7):(3'h6)] : wire112) > $unsigned(reg99[(4'h8):(2'h3)])) : {$unsigned({wire106})}) | $unsigned((~^wire106)));
          reg116 <= reg115[(2'h2):(1'h1)];
        end
      reg118 <= ((wire88[(2'h2):(2'h2)] > (wire104 || ((wire109 ~^ wire109) ?
          (-reg99) : wire111))) >= reg116);
    end
  assign wire119 = reg98;
  assign wire120 = (wire112[(2'h2):(1'h1)] >> $unsigned(wire105));
  assign wire121 = $signed(((($unsigned(wire119) ?
                               $unsigned(reg116) : wire112) ?
                           $unsigned(wire111) : reg114) ?
                       (-$signed($signed((8'hb6)))) : (+reg96[(2'h2):(1'h0)])));
  assign wire122 = ({(&(wire119 ? $unsigned(wire91) : reg92)),
                       wire121[(1'h0):(1'h0)]} + (($unsigned({(8'ha5),
                           (7'h44)}) < $signed(wire113)) ?
                       wire105[(3'h6):(1'h0)] : reg115));
  always
    @(posedge clk) begin
      if (((~&reg97[(3'h5):(3'h4)]) ? (|(8'hae)) : (~|(!$signed(wire122)))))
        begin
          reg123 <= ($signed({reg93[(3'h6):(3'h6)]}) ?
              $signed(({((7'h44) || reg103)} || $unsigned(wire105))) : ((8'hb1) ?
                  $unsigned(($unsigned(wire87) ?
                      reg117[(1'h0):(1'h0)] : (+reg94))) : (8'ha1)));
          reg124 <= ($signed(wire105) <<< (wire87 ?
              reg117 : $signed(({(7'h44), wire119} ?
                  (reg102 <= reg98) : $signed(reg101)))));
          reg125 <= wire119[(1'h1):(1'h1)];
          reg126 <= wire105[(1'h0):(1'h0)];
          reg127 <= $unsigned((wire106 ?
              ((~$signed(wire119)) + wire89) : (8'hab)));
        end
      else
        begin
          reg123 <= reg123;
        end
      reg128 <= wire107;
      if (((reg99[(4'hb):(4'h8)] ?
              (^reg103[(3'h5):(1'h0)]) : (((~|reg93) ?
                  reg127[(3'h5):(2'h2)] : {reg102,
                      (8'hab)}) ^~ $unsigned($signed(reg99)))) ?
          (reg116 ~^ (^~reg99[(3'h4):(3'h4)])) : $signed($signed((reg94[(4'hc):(3'h5)] ?
              (wire89 ? reg124 : reg101) : (~|reg125))))))
        begin
          reg129 <= (^$signed($signed((wire87[(4'h9):(1'h1)] ?
              (!reg126) : reg125))));
          if (wire107[(2'h2):(1'h0)])
            begin
              reg130 <= (^(~^reg124[(4'ha):(2'h2)]));
              reg131 <= (^((8'hb5) << ($unsigned((reg102 ?
                  reg98 : wire91)) >= wire121)));
            end
          else
            begin
              reg130 <= ($unsigned(reg100[(3'h5):(3'h5)]) ?
                  {(wire122[(1'h0):(1'h0)] - {(wire112 | reg96),
                          reg98})} : $unsigned(wire91));
              reg131 <= wire87[(4'hc):(2'h3)];
              reg132 <= (({wire91[(2'h2):(2'h2)]} ?
                  {reg127,
                      reg95} : (-(&((8'hb2) < reg118)))) ^ $unsigned((-($signed(wire91) ?
                  (reg127 ? reg101 : reg98) : wire113[(3'h5):(2'h3)]))));
              reg133 <= $unsigned(wire113);
            end
          reg134 <= reg100;
          reg135 <= ($unsigned(($signed($unsigned(reg93)) * $unsigned((~^reg118)))) ?
              ((^reg92) ?
                  (8'hb6) : (^(wire105[(1'h1):(1'h1)] ?
                      (wire122 ?
                          reg100 : reg134) : ((8'h9e) || reg92)))) : $unsigned($unsigned($signed($unsigned((8'h9c))))));
          reg136 <= $signed((((+reg131[(1'h0):(1'h0)]) << reg128[(3'h6):(1'h1)]) && ((reg133 || $signed((8'ha8))) ~^ ((reg124 <= reg116) ?
              wire104[(1'h1):(1'h1)] : $signed(reg131)))));
        end
      else
        begin
          reg129 <= reg102[(1'h1):(1'h0)];
        end
      reg137 <= $signed(($unsigned(((reg115 ?
          (8'ha2) : reg99) - $unsigned(wire120))) >= reg118));
    end
  assign wire138 = (reg125[(2'h3):(2'h3)] ~^ $signed(reg124));
  assign wire139 = {$unsigned($signed((~reg115[(2'h3):(2'h2)]))), (~|reg124)};
  always
    @(posedge clk) begin
      if ($signed(wire87))
        begin
          reg140 <= (wire138[(4'h8):(1'h0)] ?
              (+(+$signed(((8'h9d) + wire88)))) : (-$signed(($signed(wire87) == (7'h40)))));
        end
      else
        begin
          reg140 <= ((~^$unsigned((~^reg99))) ^ wire110);
          if ((~wire138[(4'hc):(3'h6)]))
            begin
              reg141 <= {(|wire104)};
              reg142 <= (($unsigned(wire105) ?
                  ($unsigned($unsigned(wire113)) && $signed({(8'ha4)})) : (!((wire108 <= wire111) ?
                      (&wire138) : (wire120 | reg123)))) & wire122);
            end
          else
            begin
              reg141 <= (reg116[(4'hc):(3'h4)] ?
                  $signed(reg134) : (~&(reg100 ?
                      $unsigned(((8'hb1) ? reg142 : reg116)) : reg129)));
              reg142 <= $unsigned((~|$signed(reg126[(4'ha):(1'h0)])));
              reg143 <= ($unsigned($signed((~|(reg123 ?
                  reg142 : reg103)))) + reg135);
              reg144 <= (~^(~|$signed(reg129)));
            end
          reg145 <= $unsigned({wire122[(5'h11):(2'h2)],
              $unsigned((reg118 ?
                  ((8'ha0) ? reg125 : wire138) : $signed(wire119)))});
        end
      reg146 <= wire87;
      if ((({((reg130 ? wire119 : reg131) ? $signed(reg100) : wire109)} ?
          {$signed((reg103 ? wire119 : reg94)), wire91} : {((wire107 ?
                      wire104 : wire87) ?
                  {wire104,
                      reg135} : $unsigned(wire108))}) < $signed({({reg100} ?
              (|reg93) : (8'hb1))})))
        begin
          reg147 <= $unsigned(reg95[(2'h3):(2'h3)]);
          reg148 <= (7'h41);
          reg149 <= $unsigned((~|({wire112} ^ $signed($signed(reg94)))));
        end
      else
        begin
          reg147 <= $signed({reg130[(4'h8):(4'h8)]});
        end
    end
  assign wire150 = (|$unsigned($unsigned((^(^wire121)))));
  assign wire151 = (wire108[(4'h9):(4'h8)] ?
                       ((($signed(reg93) >>> $unsigned(wire88)) >> {$unsigned((8'ha2)),
                               reg125}) ?
                           reg94[(2'h2):(1'h0)] : ((((8'hbc) >>> reg146) ?
                                   $unsigned(reg126) : wire89) ?
                               {$signed(reg103)} : (!{reg118,
                                   reg145}))) : {wire122[(4'hf):(3'h5)]});
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire36;
  input wire [(4'hb):(1'h0)] wire35;
  input wire signed [(5'h12):(1'h0)] wire34;
  input wire [(4'h8):(1'h0)] wire33;
  input wire [(3'h7):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire74;
  wire [(2'h3):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 wire38,
                 wire37,
                 reg72,
                 reg71,
                 reg70,
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
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg40,
                 (1'h0)};
  assign wire37 = (~^wire36);
  assign wire38 = $signed((~^$signed((|$unsigned(wire36)))));
  assign wire39 = $signed({wire38, $unsigned(wire38)});
  always
    @(posedge clk) begin
      reg40 <= {({{wire38[(3'h6):(2'h2)],
                  {wire37,
                      (7'h43)}}} - $unsigned($signed((wire32 >> wire37))))};
    end
  assign wire41 = (($signed($signed($signed(wire37))) - wire39[(2'h2):(1'h0)]) ~^ wire32);
  assign wire42 = ((+$unsigned((((8'hbb) ^ wire38) | (wire35 <= wire36)))) ?
                      (~wire38[(2'h2):(2'h2)]) : ($signed({$signed(wire37)}) * $signed($unsigned(wire33[(1'h1):(1'h0)]))));
  assign wire43 = $unsigned((|$signed((8'hbf))));
  always
    @(posedge clk) begin
      if ($signed(wire38[(1'h1):(1'h1)]))
        begin
          reg44 <= $unsigned({wire34, wire43});
          reg45 <= $signed($signed((wire35 ?
              wire41 : (((8'hb6) > wire35) - wire42[(1'h1):(1'h1)]))));
          reg46 <= $unsigned({($unsigned({wire39}) ?
                  ($unsigned(wire33) >> (wire36 & wire37)) : {wire37}),
              (wire41[(4'ha):(1'h0)] ?
                  (8'hbc) : (wire41 ? wire39 : {wire33}))});
          reg47 <= wire32[(3'h5):(3'h5)];
        end
      else
        begin
          reg44 <= $signed($unsigned($unsigned(((reg47 ? wire32 : (8'ha7)) ?
              $signed(wire34) : $signed(wire34)))));
          if ((wire42[(2'h2):(2'h2)] ?
              ($unsigned($signed({wire33})) >= {$unsigned($signed(wire36))}) : wire38))
            begin
              reg45 <= (($signed(({wire32, wire37} ?
                          (reg44 | wire43) : $unsigned(wire43))) ?
                      wire35[(3'h5):(1'h1)] : ((-{reg47, wire41}) ?
                          (wire35 ?
                              reg46[(2'h2):(2'h2)] : $signed(wire39)) : $unsigned((wire41 ?
                              wire32 : (8'h9c))))) ?
                  wire39 : $unsigned((wire34 - ($signed(wire35) ?
                      (wire33 ? wire35 : reg40) : (+(8'hbc))))));
            end
          else
            begin
              reg45 <= (~&(~^$signed($signed($unsigned(wire36)))));
              reg46 <= (reg44 ?
                  wire41[(1'h1):(1'h1)] : (($signed(wire37) * (~&$signed(reg46))) ?
                      $signed(wire41) : ({(~|wire42)} ?
                          ((!wire42) ? reg47 : wire35) : $unsigned((wire34 ?
                              wire43 : (8'hb9))))));
              reg47 <= wire34;
            end
          reg48 <= reg47;
        end
      reg49 <= $unsigned((^$unsigned($signed(wire42))));
      if ($unsigned($signed((~^$signed($signed(reg46))))))
        begin
          reg50 <= (~wire32);
          reg51 <= ($unsigned((wire32 ? {$signed(wire33)} : wire38)) ?
              $signed(wire39[(1'h0):(1'h0)]) : ((8'hb4) ^ (wire37[(3'h4):(1'h0)] ?
                  wire43[(1'h1):(1'h1)] : wire33)));
        end
      else
        begin
          if ({(~wire35)})
            begin
              reg50 <= reg40;
              reg51 <= $signed((|$unsigned(($signed(reg49) ?
                  $unsigned(wire36) : $unsigned(wire41)))));
              reg52 <= $unsigned($unsigned(wire37));
              reg53 <= wire35[(3'h4):(3'h4)];
              reg54 <= (reg45 <= ((^$signed(reg49)) ?
                  (((wire41 ?
                      reg50 : (8'ha2)) << (!reg53)) >> ((|wire34) * $unsigned(wire41))) : reg51));
            end
          else
            begin
              reg50 <= wire42[(1'h0):(1'h0)];
              reg51 <= $unsigned(wire39[(1'h1):(1'h0)]);
              reg52 <= $signed(({$signed((wire35 ? wire39 : reg48))} && (reg54 ?
                  (^~$signed(reg44)) : reg52[(3'h5):(3'h5)])));
              reg53 <= wire37[(4'he):(3'h7)];
              reg54 <= reg40;
            end
          if (wire36)
            begin
              reg55 <= {$unsigned((wire35 < (~|(wire36 ? reg46 : wire32)))),
                  {(((wire37 ? wire38 : reg53) >>> {(8'hb3)}) + (-(8'ha4))),
                      reg47}};
            end
          else
            begin
              reg55 <= ($unsigned($unsigned(wire41)) >>> $unsigned((|{(^reg53)})));
              reg56 <= (~(-$signed((((8'hb7) ? (8'hbe) : reg54) ?
                  (wire34 & (7'h42)) : (~|wire42)))));
              reg57 <= (~^{$unsigned(((8'hb2) - reg55[(1'h1):(1'h1)]))});
            end
          reg58 <= reg53[(3'h4):(1'h1)];
          if ((~^reg56[(3'h5):(2'h2)]))
            begin
              reg59 <= {(~|reg57[(4'hf):(2'h3)])};
              reg60 <= (8'hb6);
              reg61 <= $signed({(reg56 && $signed((reg47 >>> reg49))),
                  (8'ha0)});
              reg62 <= (-wire33[(3'h7):(2'h3)]);
              reg63 <= wire39;
            end
          else
            begin
              reg59 <= $unsigned({(8'hb3)});
              reg60 <= ({(reg62[(2'h2):(1'h1)] ?
                      reg49[(2'h3):(1'h0)] : ($unsigned((8'hb4)) ?
                          (reg49 ?
                              reg44 : wire39) : (|reg54)))} & wire32[(3'h4):(3'h4)]);
            end
          reg64 <= reg56;
        end
      reg65 <= $unsigned(reg47);
    end
  assign wire66 = ($unsigned($signed((~$signed((7'h42))))) ?
                      reg48 : (($signed($signed(wire43)) < reg56) ?
                          reg62[(3'h4):(1'h0)] : $signed($signed(reg49[(1'h1):(1'h1)]))));
  assign wire67 = wire36;
  assign wire68 = wire39;
  assign wire69 = (^(~&$signed(wire38)));
  always
    @(posedge clk) begin
      reg70 <= {((8'hba) ?
              ((wire43[(3'h5):(1'h1)] <<< $signed(reg57)) - ({reg60,
                  reg54} || $unsigned(wire38))) : reg60[(3'h6):(3'h5)])};
      reg71 <= ((-reg59[(2'h3):(2'h3)]) ?
          {$signed($unsigned(reg45[(3'h6):(1'h1)]))} : reg54);
      reg72 <= ($signed($unsigned(reg55)) ?
          (-(~(|(reg62 != reg55)))) : ({(reg57[(2'h2):(1'h1)] ?
                      (|reg40) : $unsigned(reg61)),
                  $unsigned($signed(reg48))} ?
              {$unsigned($signed(reg59))} : ($signed($unsigned(reg55)) ?
                  $unsigned(reg47) : reg63[(5'h13):(5'h11)])));
    end
  assign wire73 = (^(~{$signed(wire37), (~$signed(reg45))}));
  assign wire74 = (reg59[(2'h3):(1'h1)] || $unsigned((~((reg44 ?
                      reg70 : (7'h40)) >= (~|wire38)))));
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  assign y = {wire21, wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = $signed(wire14[(5'h14):(5'h13)]);
  assign wire18 = $signed($unsigned($unsigned(($unsigned(wire13) ?
                      wire17 : $unsigned(wire13)))));
  assign wire19 = (^$signed(wire14));
  assign wire20 = $unsigned(wire18);
  assign wire21 = wire17[(3'h6):(1'h0)];
endmodule
