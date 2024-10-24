module top
#(parameter param180 = {((~&(7'h40)) && (((^(8'h9d)) ? ((8'h9e) || (8'haa)) : (-(8'ha7))) ? ((-(8'ha2)) != ((8'ha9) ? (8'ha7) : (8'h9c))) : {((8'hae) ? (7'h43) : (7'h42))}))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire178;
  wire [(4'hc):(1'h0)] wire124;
  wire [(4'he):(1'h0)] wire123;
  wire [(4'h8):(1'h0)] wire109;
  wire signed [(3'h4):(1'h0)] wire100;
  wire signed [(2'h3):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire90;
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  assign y = {wire178,
                 wire124,
                 wire123,
                 wire109,
                 wire100,
                 wire99,
                 wire98,
                 wire92,
                 wire90,
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
                 reg111,
                 reg110,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  module4 #() modinst91 (.clk(clk), .y(wire90), .wire8(wire2), .wire7(wire0), .wire5(wire3), .wire6(wire1));
  assign wire92 = $unsigned($signed($signed(wire3)));
  always
    @(posedge clk) begin
      reg93 <= ({wire92, $signed(wire3[(2'h2):(2'h2)])} & wire92);
      reg94 <= $unsigned(wire2[(2'h3):(2'h3)]);
      if ({wire92})
        begin
          reg95 <= $signed($unsigned((wire90 ?
              (~|(wire1 != reg94)) : wire0[(1'h1):(1'h0)])));
          reg96 <= $signed({($signed((+(8'hbd))) ?
                  {wire1[(3'h4):(1'h1)]} : ((reg94 ~^ wire92) ?
                      (&reg93) : $signed(wire90))),
              (reg93[(1'h1):(1'h1)] ^~ $unsigned((reg94 ? wire0 : wire0)))});
        end
      else
        begin
          reg95 <= ($unsigned((~$signed(wire0[(3'h5):(1'h0)]))) <= (reg93 <= ($unsigned((^wire0)) ?
              (reg96 ?
                  $unsigned(reg93) : (|reg94)) : ($unsigned(wire3) | (wire3 != wire92)))));
          reg96 <= $unsigned($signed({(+(wire92 || (8'hbc)))}));
        end
      reg97 <= ((wire3 == wire1) ~^ (($unsigned((|wire3)) ?
          ($signed(reg93) ?
              (-wire3) : (wire90 ? reg93 : wire3)) : ($signed(wire2) ?
              reg93[(4'ha):(2'h3)] : (wire90 & reg95))) * {{(wire3 ?
                  reg93 : reg96),
              $unsigned(reg95)}}));
    end
  assign wire98 = ($signed($unsigned($signed((reg93 & reg95)))) < reg97[(4'hb):(4'ha)]);
  assign wire99 = ($signed(($signed($unsigned((8'hb1))) && $unsigned(reg94[(2'h2):(1'h1)]))) | $signed(($signed(((8'hb1) || (8'haa))) || wire1)));
  assign wire100 = (|wire0[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg101 <= (!{$unsigned((|wire98[(3'h7):(2'h2)]))});
    end
  always
    @(posedge clk) begin
      if (reg93)
        begin
          reg102 <= {(8'had),
              {wire1, (wire1[(4'h8):(3'h4)] != $signed((~|wire3)))}};
          reg103 <= ($unsigned((+($signed((8'hb7)) ?
                  $unsigned(reg95) : (wire1 & (7'h42))))) ?
              $unsigned((|wire98[(5'h10):(4'he)])) : ((^wire92[(3'h5):(1'h0)]) ?
                  reg93 : ($signed(wire100[(1'h1):(1'h0)]) ?
                      (8'had) : {$unsigned(reg96)})));
        end
      else
        begin
          if (wire92)
            begin
              reg102 <= $signed({{($signed(wire3) <= ((8'ha9) ^ reg94))},
                  reg94[(2'h3):(1'h0)]});
            end
          else
            begin
              reg102 <= ({($unsigned((!reg97)) ?
                      ($signed(reg95) >>> reg97[(4'ha):(3'h5)]) : {(reg95 || wire3),
                          $unsigned(wire99)}),
                  (-(reg102[(4'h9):(4'h9)] ?
                      (|wire92) : {wire98,
                          reg93}))} > $signed(reg95[(1'h0):(1'h0)]));
              reg103 <= reg97[(4'ha):(1'h0)];
              reg104 <= (+wire100);
              reg105 <= $unsigned($unsigned(wire92[(3'h4):(1'h1)]));
              reg106 <= $signed($signed(reg95[(2'h2):(1'h0)]));
            end
        end
      reg107 <= (+{($unsigned(wire92) ?
              reg104[(2'h2):(1'h1)] : $unsigned($signed(wire92)))});
      reg108 <= ($unsigned((7'h40)) ?
          (wire90 ?
              $signed(($signed(reg101) >= ((8'ha9) <= reg107))) : ((|$unsigned(reg97)) ?
                  $signed((reg96 ?
                      (8'hb3) : reg97)) : wire2[(4'h8):(2'h2)])) : (~^wire1[(3'h4):(2'h2)]));
    end
  assign wire109 = $signed((-$signed(reg94)));
  always
    @(posedge clk) begin
      if ($signed($unsigned((!((reg96 != (8'hb4)) ?
          {wire1, reg93} : $unsigned(wire2))))))
        begin
          reg110 <= (^~$signed(wire98));
          if ($unsigned(reg93))
            begin
              reg111 <= (reg101 >= (8'hb6));
              reg112 <= wire0;
              reg113 <= (reg96 ?
                  (~(($signed(reg112) >> (reg97 ? (8'hb6) : wire109)) ?
                      (+reg102[(5'h12):(4'hc)]) : (^$unsigned(wire98)))) : reg110[(1'h0):(1'h0)]);
              reg114 <= (^~reg107);
              reg115 <= $signed(((~|reg95) == $signed((~^$signed(wire90)))));
            end
          else
            begin
              reg111 <= ($signed(reg108[(2'h2):(2'h2)]) ?
                  ($signed($signed(((8'hbd) & reg111))) | wire2[(3'h6):(3'h5)]) : (reg113[(3'h5):(3'h4)] + $unsigned($signed(reg114))));
              reg112 <= (8'hbe);
            end
          reg116 <= reg96[(4'hd):(4'hb)];
        end
      else
        begin
          reg110 <= wire100;
          reg111 <= (-reg116);
          reg112 <= (reg112[(3'h4):(3'h4)] * reg110);
          reg113 <= $signed($signed((reg97 ?
              (~^wire92) : $unsigned((reg97 ~^ (8'h9d))))));
          reg114 <= (reg116[(3'h6):(2'h3)] ?
              reg110[(5'h15):(4'h9)] : (($signed($unsigned(reg97)) || {((8'hb9) | (8'hb4)),
                      $unsigned(reg113)}) ?
                  reg115[(2'h3):(2'h2)] : (&$signed((!reg112)))));
        end
      if (($signed($unsigned((reg107 ? (~^wire99) : wire99[(2'h3):(2'h3)]))) ?
          ($signed(reg101) ?
              {{wire3}} : reg104[(1'h1):(1'h1)]) : $unsigned(wire1)))
        begin
          if (($signed($signed((reg111 ?
              (&(8'hbe)) : (wire1 < wire92)))) ^~ reg97[(3'h4):(1'h1)]))
            begin
              reg117 <= $signed($signed(reg93));
              reg118 <= (+wire1[(4'he):(4'hb)]);
              reg119 <= $unsigned(reg96);
              reg120 <= ({reg95} - {(((reg104 ? (8'h9f) : reg116) ?
                      (reg112 ?
                          (8'hbf) : reg108) : (&reg102)) <<< $signed({reg107}))});
            end
          else
            begin
              reg117 <= $unsigned({(wire1 ?
                      {(reg106 != (8'h9f)),
                          (~reg106)} : reg102[(5'h10):(4'hc)]),
                  ((8'ha1) == ((reg96 != reg119) ? (|(8'h9d)) : reg103))});
              reg118 <= $signed((($signed((~^reg102)) ?
                  (wire100[(2'h3):(1'h0)] ?
                      {wire92, reg113} : {reg106,
                          reg96}) : (^~$unsigned(wire3))) <= ((reg105 > $signed((8'hbf))) && $signed($unsigned(wire99)))));
              reg119 <= {{((~(8'hba)) - (^(~|reg97))),
                      (+{(reg108 ? reg116 : reg93)})},
                  reg114};
              reg120 <= (($unsigned((-(wire90 ? reg115 : reg103))) ?
                  (reg119[(3'h5):(1'h1)] ?
                      reg107[(4'ha):(3'h4)] : wire2) : wire109) >= $signed($unsigned(((~|reg115) & $signed(reg105)))));
            end
        end
      else
        begin
          reg117 <= $signed(($signed({$signed(reg96),
              (^~wire1)}) && reg110[(1'h0):(1'h0)]));
          if (wire0[(1'h1):(1'h1)])
            begin
              reg118 <= $signed($signed(((~&(~|reg111)) ? wire109 : reg112)));
              reg119 <= reg110[(2'h2):(2'h2)];
              reg120 <= $unsigned(wire100);
              reg121 <= $signed(reg120[(2'h2):(2'h2)]);
              reg122 <= $unsigned((|$signed(reg108[(1'h1):(1'h1)])));
            end
          else
            begin
              reg118 <= {(reg103[(3'h7):(1'h0)] ?
                      $unsigned(wire100[(2'h2):(1'h0)]) : reg121[(4'hc):(4'h9)]),
                  reg120};
            end
        end
    end
  assign wire123 = (((~|(^$unsigned(reg101))) & (($unsigned(wire92) ?
                           (reg96 && reg115) : (&(8'haf))) ?
                       reg111 : ($signed((8'ha5)) ?
                           (|reg105) : {reg111}))) + ($signed(reg95[(2'h2):(2'h2)]) >> (^reg108)));
  assign wire124 = (($signed($unsigned(wire1)) >>> ({wire98} ^ ((reg108 & reg104) ?
                           (wire123 >> reg101) : $unsigned(reg122)))) ?
                       $signed(($signed((reg103 ?
                           reg106 : reg116)) || (~|reg94[(2'h2):(2'h2)]))) : $unsigned(wire3));
  always
    @(posedge clk) begin
      reg125 <= ($signed((reg120[(1'h1):(1'h1)] ?
          $signed($unsigned(wire90)) : {reg115,
              (reg107 ? reg94 : reg111)})) ^~ reg117[(4'he):(4'h8)]);
      if (($unsigned((~(~|(&wire109)))) ?
          $unsigned(($signed($signed(wire3)) ^~ reg114)) : $signed(reg96)))
        begin
          if ((({((|(7'h41)) * (8'hba)), wire123} > (^~wire1)) == reg97))
            begin
              reg126 <= $signed((($unsigned($unsigned(wire98)) ^~ ((8'ha5) ?
                      $signed(reg102) : (wire90 == reg104))) ?
                  reg105[(1'h1):(1'h1)] : (!wire3)));
              reg127 <= $signed(((reg116 ^~ reg119[(1'h1):(1'h1)]) & (($signed(reg106) - reg93[(4'hc):(4'h8)]) <= $unsigned((!reg93)))));
            end
          else
            begin
              reg126 <= $signed($unsigned(((((8'ha7) ?
                  reg96 : (8'hae)) <<< (wire99 ^~ wire0)) ^~ ((^reg120) ?
                  {reg125, wire100} : wire109[(2'h3):(2'h3)]))));
            end
          reg128 <= (wire98 ?
              ((&(reg125[(1'h1):(1'h1)] ?
                      wire98[(2'h2):(2'h2)] : (reg115 * reg96))) ?
                  $unsigned($signed((reg101 & reg105))) : {((reg119 ^ reg113) >= {reg104}),
                      $unsigned(reg126[(1'h0):(1'h0)])}) : (8'ha2));
          reg129 <= wire98;
          reg130 <= (($signed((8'hb5)) <<< $signed(wire3)) | reg129[(2'h3):(2'h2)]);
          if ($signed($unsigned((^~((!reg119) ?
              reg119[(3'h5):(2'h3)] : $unsigned(wire98))))))
            begin
              reg131 <= reg122[(2'h3):(2'h2)];
            end
          else
            begin
              reg131 <= reg131[(1'h1):(1'h1)];
              reg132 <= ({(($signed(reg103) < (reg95 ? reg115 : wire124)) ?
                      ((reg129 ?
                          reg121 : wire98) - $unsigned((8'hb7))) : (~|(reg104 ?
                          wire92 : reg113)))} + $signed((~reg122[(4'ha):(4'ha)])));
              reg133 <= $signed({(~(^(!reg96))),
                  ((8'hae) - $signed((~reg116)))});
              reg134 <= $unsigned(reg116);
            end
        end
      else
        begin
          if ($signed(reg116[(1'h0):(1'h0)]))
            begin
              reg126 <= ((^reg119[(1'h0):(1'h0)]) ?
                  ($signed(reg132) ?
                      (~(~|wire90[(2'h2):(1'h1)])) : reg134[(3'h5):(3'h4)]) : $signed($unsigned(wire100[(2'h3):(1'h1)])));
              reg127 <= {(^(8'ha1))};
              reg128 <= ((-(+$unsigned($signed(wire90)))) > (~^(~&$signed((reg121 ?
                  wire3 : wire1)))));
              reg129 <= ($signed({reg116[(3'h4):(1'h1)]}) ?
                  (~^(~{(&reg97)})) : (^(!((reg102 ?
                      wire123 : reg125) - (reg117 & reg114)))));
              reg130 <= $signed(((&(8'ha3)) ?
                  {((reg129 ^~ (8'h9d)) + reg106)} : (~(~|$signed(reg106)))));
            end
          else
            begin
              reg126 <= ((reg128 <= reg131[(3'h4):(1'h0)]) >= (($signed((reg114 && wire0)) != $signed(reg106[(4'h8):(3'h6)])) == reg111));
              reg127 <= $unsigned($unsigned($unsigned(reg113)));
            end
        end
      reg135 <= reg134;
      reg136 <= ($signed((+(~&(reg130 ? wire92 : reg97)))) ?
          reg117[(4'hd):(4'hd)] : ($signed((!reg131)) ?
              $signed((8'had)) : $unsigned(({reg95,
                  reg108} <= $signed(reg108)))));
    end
  module137 #() modinst179 (.clk(clk), .y(wire178), .wire141(reg104), .wire139(reg115), .wire138(reg114), .wire140(reg120));
endmodule

module module137
#(parameter param176 = (~&(~^({(^(8'hb5))} ? (^((8'ha1) ^~ (8'hb4))) : (8'hb5)))), 
parameter param177 = param176)
(y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire141;
  input wire signed [(5'h13):(1'h0)] wire140;
  input wire [(5'h15):(1'h0)] wire139;
  input wire signed [(5'h15):(1'h0)] wire138;
  wire signed [(2'h2):(1'h0)] wire175;
  wire signed [(4'hb):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire173;
  wire [(3'h4):(1'h0)] wire172;
  wire signed [(3'h5):(1'h0)] wire171;
  wire signed [(3'h6):(1'h0)] wire165;
  reg signed [(3'h5):(1'h0)] reg170 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg169 = (1'h0);
  reg [(5'h13):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg167 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire165,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  module142 #() modinst166 (.wire145(wire139), .wire143(wire140), .clk(clk), .wire144(wire141), .wire146(wire138), .y(wire165));
  always
    @(posedge clk) begin
      reg167 <= wire139[(4'hc):(3'h4)];
      reg168 <= (($unsigned(($signed((8'ha7)) ?
              wire165 : (wire141 ? wire138 : (8'ha9)))) ?
          $signed(reg167) : (wire139[(5'h15):(4'ha)] ?
              reg167 : ($unsigned(wire140) ?
                  $signed(wire165) : wire141[(5'h15):(5'h13)]))) > $unsigned(wire165[(3'h6):(1'h0)]));
      reg169 <= $unsigned(wire138);
      reg170 <= (wire138[(5'h14):(4'h9)] ^~ (+{($unsigned(wire141) < $signed(reg168)),
          wire141}));
    end
  assign wire171 = (~|{(-(reg167 ?
                           $signed(wire139) : ((8'hb9) ? (8'hbd) : (8'hbf)))),
                       (8'h9d)});
  assign wire172 = {$signed(wire141[(4'h8):(3'h6)]), (8'ha5)};
  assign wire173 = (~($signed(((wire141 ?
                       reg170 : (7'h40)) & wire141[(4'h8):(1'h0)])) || (8'ha3)));
  assign wire174 = wire165;
  assign wire175 = (^~wire139);
endmodule

module module4
#(parameter param89 = ({(({(8'hae)} < ((8'hb7) ? (8'hbc) : (8'hab))) ? (~(~&(8'hbd))) : (((8'hb3) ? (8'hbf) : (8'hb9)) == ((8'hbd) & (8'ha4)))), (^{((8'had) ? (8'hb1) : (8'haa)), (~|(8'hb8))})} ? (((^~(&(8'hb9))) ? (8'hbd) : (^{(8'hb4)})) ~^ ((8'ha5) ? {(-(8'hba)), (8'hbf)} : (((8'hb2) ? (8'hba) : (7'h40)) < (!(8'hab))))) : ({(~|((8'hab) * (8'hb7))), ((~^(8'hb2)) ? ((8'hb0) * (8'ha5)) : ((8'h9d) == (8'hb9)))} >= (~|(((7'h42) ? (8'ha4) : (8'ha7)) && ((8'hac) + (8'hb0)))))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire5;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire [(3'h7):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire87;
  wire [(3'h7):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  wire signed [(4'hf):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire76;
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire76,
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
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire9 = (-(8'hbf));
  assign wire10 = (^(((|wire9[(1'h0):(1'h0)]) ?
                      wire6[(4'hd):(4'hd)] : ((wire7 ?
                          wire6 : wire6) >> wire7)) * wire5[(4'hb):(4'ha)]));
  assign wire11 = $unsigned(wire8[(1'h1):(1'h0)]);
  assign wire12 = (~wire9);
  always
    @(posedge clk) begin
      if (wire8[(4'h8):(3'h5)])
        begin
          reg13 <= $signed(wire12[(1'h0):(1'h0)]);
          reg14 <= (^wire8);
        end
      else
        begin
          reg13 <= $signed((wire11[(1'h1):(1'h0)] << ($signed({wire5, wire10}) ?
              wire6 : ((!wire12) << $unsigned(wire7)))));
          if (wire10)
            begin
              reg14 <= wire11[(2'h2):(2'h2)];
              reg15 <= (!($unsigned((&(wire11 ?
                  wire9 : wire8))) + $signed($unsigned(reg14[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg14 <= (((&$unsigned({(8'hbb)})) ?
                  wire9[(2'h2):(2'h2)] : (~&(wire9 >= $signed((8'ha9))))) + (wire12 | ($signed((wire11 - (8'hb8))) <<< {{wire7}})));
              reg15 <= $unsigned($unsigned($signed(((wire8 ?
                  wire10 : (8'ha9)) - (|wire11)))));
              reg16 <= $unsigned($signed((~&{wire8})));
              reg17 <= (wire9[(2'h2):(1'h1)] ^~ (-reg14));
            end
          if (wire5[(3'h5):(1'h0)])
            begin
              reg18 <= $signed($signed(((-$unsigned((8'hae))) ?
                  wire5 : (^(~wire7)))));
              reg19 <= (+(reg13[(1'h1):(1'h1)] ?
                  ($unsigned($signed(wire11)) ?
                      $unsigned((reg14 ^~ wire10)) : {wire12,
                          (reg13 ? wire8 : reg14)}) : (reg16 ?
                      (+$signed(wire7)) : (((7'h42) == wire10) != wire12))));
              reg20 <= $unsigned((7'h42));
              reg21 <= {reg19};
              reg22 <= ((~^(8'ha2)) ?
                  (~|(reg13[(2'h2):(1'h0)] ?
                      $unsigned((wire8 ?
                          (8'ha1) : reg15)) : (~(~|reg19)))) : $signed($signed(reg20)));
            end
          else
            begin
              reg18 <= (((($unsigned(reg16) < (reg15 >> reg15)) ?
                      (reg18[(1'h1):(1'h1)] ?
                          reg14 : $unsigned(wire11)) : (reg17 < reg21[(3'h6):(2'h3)])) ?
                  (wire6[(3'h6):(3'h5)] ?
                      wire6 : {wire10}) : (reg16[(2'h2):(2'h2)] || (|$signed(wire11)))) | (wire10[(3'h6):(1'h1)] ?
                  ($unsigned(reg22) ?
                      (8'hb5) : (wire11 ?
                          reg21[(4'hb):(1'h1)] : (reg14 ?
                              reg17 : wire5))) : ((8'hb3) >> wire5)));
              reg19 <= $signed((($signed((reg18 << wire10)) && (~&$signed(wire12))) ?
                  {{$unsigned(wire10)}} : $unsigned(wire9[(2'h2):(2'h2)])));
            end
          reg23 <= {$signed($signed(wire11)),
              ($unsigned($signed((reg20 & (8'haf)))) ? wire10 : wire7)};
          reg24 <= reg16[(1'h0):(1'h0)];
        end
      reg25 <= $unsigned($unsigned(reg22[(1'h0):(1'h0)]));
      reg26 <= ($unsigned(($unsigned((~^wire5)) ?
          wire7[(2'h2):(2'h2)] : wire12[(1'h1):(1'h0)])) ^~ (|{$signed({reg23,
              (8'hb9)})}));
      if ((wire6 == wire7[(2'h3):(1'h1)]))
        begin
          reg27 <= reg18;
          reg28 <= reg13[(1'h0):(1'h0)];
          if ($signed({$unsigned(reg16)}))
            begin
              reg29 <= $unsigned((((wire12 >> (+reg18)) ?
                      ({reg14} < $signed(reg24)) : ((reg28 ? wire11 : (8'h9f)) ?
                          $unsigned(reg16) : wire9[(2'h3):(2'h3)])) ?
                  $signed(wire10[(4'h9):(2'h2)]) : (&$unsigned($unsigned(reg28)))));
              reg30 <= reg13[(1'h1):(1'h1)];
              reg31 <= reg27;
              reg32 <= ($unsigned(wire7[(2'h2):(1'h0)]) + reg18[(4'hc):(3'h4)]);
              reg33 <= reg31;
            end
          else
            begin
              reg29 <= (8'haa);
            end
          if (($signed($unsigned($signed((+wire7)))) ?
              wire8 : $signed({reg19[(3'h5):(3'h4)]})))
            begin
              reg34 <= wire10[(3'h6):(3'h4)];
              reg35 <= reg23;
              reg36 <= ({$signed($unsigned(wire11))} & {wire11,
                  reg20[(1'h1):(1'h0)]});
            end
          else
            begin
              reg34 <= ($signed({($signed((7'h43)) | (-reg28)),
                      $signed(wire8[(3'h4):(2'h2)])}) ?
                  (~^((~|$unsigned((8'h9e))) ?
                      $unsigned((wire8 >= reg24)) : (-$unsigned((8'hbb))))) : reg18[(3'h5):(1'h0)]);
              reg35 <= (($unsigned(reg27) ?
                      $signed($unsigned($unsigned(reg25))) : $signed(wire7)) ?
                  reg26 : (~|(reg31[(2'h3):(2'h2)] > (~^wire6[(2'h2):(1'h1)]))));
            end
          reg37 <= (~^(&(reg30 ?
              {wire5[(4'ha):(3'h5)],
                  $signed(wire5)} : ((~|wire12) || (reg24 ~^ (8'ha7))))));
        end
      else
        begin
          reg27 <= reg23;
          reg28 <= (reg22 || $unsigned(reg28[(3'h6):(2'h2)]));
        end
      reg38 <= reg22[(2'h2):(1'h0)];
    end
  module39 #() modinst77 (.wire40(reg33), .wire43(reg31), .wire42(reg15), .wire41(wire9), .clk(clk), .y(wire76), .wire44(reg16));
  assign wire78 = ((($unsigned((wire9 ?
                          reg28 : wire9)) >= reg22[(1'h0):(1'h0)]) ?
                      (~^$signed((reg25 ^~ wire7))) : reg28) < {reg26,
                      $unsigned((~|reg26[(5'h10):(5'h10)]))});
  assign wire79 = reg34;
  assign wire80 = {{((wire8 ?
                              {reg36} : $signed(wire10)) ^~ $unsigned((reg31 != wire5))),
                          (((wire12 >= reg23) || (~^wire11)) ?
                              $unsigned((+wire11)) : $unsigned($unsigned(reg36)))}};
  assign wire81 = (reg24[(3'h4):(2'h3)] ?
                      (-((reg26[(3'h5):(3'h4)] ?
                          $signed(wire80) : wire76) >> ({reg34,
                          wire79} ^~ (reg20 > reg13)))) : ($unsigned($unsigned(((8'hbd) > (8'ha8)))) ?
                          $unsigned(((reg37 ? reg36 : reg27) ?
                              $signed(reg35) : $unsigned(wire78))) : $unsigned(((7'h43) ~^ reg37))));
  assign wire82 = (((reg24[(5'h11):(4'he)] ~^ $unsigned(wire12[(2'h3):(1'h1)])) <= reg20[(4'hb):(3'h6)]) ?
                      wire12[(3'h6):(2'h3)] : $unsigned($signed(((~^wire79) != $unsigned((8'haf))))));
  assign wire83 = ({{$signed((&reg14))}, wire76} ^~ wire76);
  assign wire84 = ($signed($unsigned(reg21)) ?
                      reg27[(4'h9):(3'h6)] : $signed((((+reg25) ?
                          $unsigned(reg18) : {wire7}) && ($unsigned((8'hb5)) & (8'hab)))));
  assign wire85 = (~&$signed(wire5[(4'hd):(3'h6)]));
  assign wire86 = ((^~(((reg33 << (8'hba)) - reg34[(1'h0):(1'h0)]) ?
                          reg22 : $unsigned(reg30))) ?
                      $unsigned((|reg14)) : reg25[(3'h6):(1'h1)]);
  assign wire87 = $signed($unsigned({((reg29 ? reg25 : wire6) ?
                          (&wire6) : (!reg24)),
                      (8'hbf)}));
  assign wire88 = reg20;
endmodule

module module39
#(parameter param75 = (((-((~|(8'hbe)) ? {(8'ha9), (8'ha2)} : ((8'ha2) > (7'h44)))) << ({{(8'hab)}, {(8'had)}} ? (((8'hab) ? (7'h40) : (8'hb1)) ~^ {(8'hbb), (7'h41)}) : (((8'h9c) ? (8'haf) : (8'hb0)) & ((8'h9f) && (8'hac))))) && ((&{((8'hb7) && (8'hae)), ((7'h44) ~^ (8'ha4))}) ? ((~|((8'hb7) ? (8'ha7) : (7'h44))) ? (~^((7'h43) ? (8'hb6) : (7'h44))) : ((~&(7'h41)) != ((8'h9c) + (8'ha6)))) : {({(8'haa)} ? ((8'hb5) ? (8'ha6) : (7'h44)) : (^(8'h9f)))})))
(y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire44;
  input wire [(4'hf):(1'h0)] wire43;
  input wire signed [(3'h6):(1'h0)] wire42;
  input wire signed [(4'ha):(1'h0)] wire41;
  input wire [(2'h2):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire47,
                 wire46,
                 wire45,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
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
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire45 = ((-({{wire40, wire40}} ? (^wire41) : wire43[(4'h9):(2'h3)])) ?
                      $signed(wire42[(1'h0):(1'h0)]) : {$signed(wire41[(1'h1):(1'h1)]),
                          wire42});
  assign wire46 = (wire44 ?
                      $unsigned(wire45[(4'hd):(3'h6)]) : ((wire42[(2'h3):(1'h1)] >= {(wire44 - wire40),
                              wire43}) ?
                          wire40[(1'h0):(1'h0)] : $unsigned({$signed(wire43)})));
  assign wire47 = ($unsigned(wire40) ?
                      (wire45[(4'h8):(3'h7)] <<< {$unsigned((~|(8'hb8))),
                          (wire46[(4'hd):(1'h0)] ?
                              (8'ha9) : (wire42 ?
                                  wire43 : wire40))}) : $unsigned(((&$unsigned(wire42)) + $signed($signed(wire42)))));
  always
    @(posedge clk) begin
      reg48 <= {$unsigned(((wire44 - (wire41 - wire42)) ^~ ((wire45 >= wire40) == wire47[(3'h7):(3'h7)])))};
      if ((wire40 ?
          $unsigned({(wire41[(3'h5):(1'h1)] <= wire44),
              $signed((-wire42))}) : wire45[(4'ha):(4'ha)]))
        begin
          if ($unsigned(wire45[(3'h6):(3'h5)]))
            begin
              reg49 <= (8'hbc);
              reg50 <= (+$unsigned(reg48));
              reg51 <= wire43[(4'hd):(4'h9)];
            end
          else
            begin
              reg49 <= $unsigned($unsigned(reg48));
              reg50 <= (reg51[(3'h4):(2'h3)] ^ ((~^$signed($unsigned(reg51))) || (~reg49[(2'h3):(1'h0)])));
              reg51 <= $unsigned(wire40);
              reg52 <= {($unsigned(((reg50 != wire44) ?
                          wire44[(3'h6):(3'h6)] : $unsigned(wire42))) ?
                      {($signed(reg51) || (reg48 ? wire46 : reg48)),
                          ((reg51 * wire47) << (wire46 ^~ reg51))} : wire46[(4'ha):(1'h0)])};
              reg53 <= (((wire43 ?
                          $unsigned(wire43) : ($unsigned(wire44) ?
                              wire47 : (reg50 << wire41))) ?
                      $unsigned((wire44 ?
                          $signed(wire45) : {wire47,
                              wire47})) : reg52[(4'h9):(4'h8)]) ?
                  $signed((~^$unsigned((wire41 ? wire42 : wire44)))) : (wire43 ?
                      wire44 : wire40));
            end
          reg54 <= (~&(wire46 < reg53[(3'h4):(2'h3)]));
          reg55 <= reg50[(2'h3):(1'h0)];
        end
      else
        begin
          reg49 <= {(reg48[(4'hf):(1'h0)] ?
                  (reg54 ?
                      $signed((reg54 || reg52)) : ({wire41, reg48} ?
                          $signed(wire40) : {reg54, reg53})) : (~&(~&reg49))),
              {(&wire44), wire43}};
          reg50 <= reg48[(1'h0):(1'h0)];
          reg51 <= (wire42 ?
              $signed($signed(wire40)) : ($unsigned(wire43) ?
                  ($signed($signed(wire45)) << wire43) : {{wire41[(2'h3):(1'h0)]}}));
          reg52 <= $signed(((-reg53[(4'h9):(3'h6)]) ?
              (reg53 ?
                  (~&(wire44 ?
                      reg48 : wire45)) : wire45[(4'hf):(3'h5)]) : wire43));
        end
      if ((!(!wire43[(4'hf):(4'hb)])))
        begin
          reg56 <= $signed($signed((+({wire44} == wire43))));
          reg57 <= {wire46, $unsigned(reg55)};
          reg58 <= (reg51[(3'h5):(1'h0)] >= (reg56 ?
              {(+{wire46, wire42})} : ($signed((&reg52)) <= reg55)));
          reg59 <= reg52[(3'h5):(3'h5)];
          if ((7'h42))
            begin
              reg60 <= reg52;
              reg61 <= (!wire47[(3'h7):(3'h5)]);
              reg62 <= reg52[(4'h9):(1'h1)];
            end
          else
            begin
              reg60 <= $unsigned(reg56[(3'h7):(3'h5)]);
              reg61 <= (wire45 & (!(|reg59)));
              reg62 <= $signed($unsigned($signed($signed(reg54[(4'h8):(3'h4)]))));
              reg63 <= $unsigned($unsigned(({(reg48 ? (7'h43) : wire46),
                  (reg62 ^ reg60)} >> ((^wire45) ?
                  (reg55 == reg61) : {reg57, wire45}))));
              reg64 <= reg59[(3'h7):(1'h1)];
            end
        end
      else
        begin
          reg56 <= $signed((reg48[(4'hd):(4'h9)] * $signed(wire47[(3'h7):(2'h3)])));
          reg57 <= wire40;
          reg58 <= $signed($signed(($signed($signed(reg55)) ?
              reg51 : ({wire46} - (~&reg52)))));
          reg59 <= ((~|$signed($unsigned($unsigned(reg49)))) == reg48[(2'h3):(2'h2)]);
        end
      reg65 <= (~^((+(^$unsigned((8'hba)))) <<< (reg54 >>> $unsigned((~reg58)))));
      reg66 <= (~reg64[(2'h3):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg67 <= (reg57 || $unsigned(reg65));
      if ((reg49 ?
          $unsigned({({wire44} == (wire47 ?
                  reg52 : reg64))}) : ({$unsigned(wire47)} ?
              ((~(reg62 ?
                  reg56 : (8'ha4))) | $signed(wire46[(3'h7):(3'h4)])) : (+{$unsigned(wire45),
                  (reg54 ? reg65 : reg61)}))))
        begin
          reg68 <= (reg48 >> (wire45 == $unsigned(reg63)));
          reg69 <= $unsigned((wire46[(3'h6):(2'h3)] ?
              wire45[(4'ha):(4'h8)] : reg61[(1'h1):(1'h1)]));
          reg70 <= $unsigned(({(wire45[(1'h0):(1'h0)] ^ $signed((8'h9d))),
              ($unsigned(wire41) ?
                  {(8'ha8),
                      wire41} : (wire41 << reg52))} & (~^(reg63[(1'h0):(1'h0)] ^ ((8'ha8) ?
              reg69 : reg66)))));
          reg71 <= $signed(reg59[(4'hb):(3'h6)]);
          reg72 <= $unsigned(reg53);
        end
      else
        begin
          reg68 <= ($signed(wire45[(3'h5):(1'h0)]) ?
              $signed(reg70) : (reg71[(4'hd):(4'ha)] * $unsigned($signed((wire47 ?
                  (8'ha6) : reg59)))));
        end
    end
  assign wire73 = (+(!$signed(($unsigned(reg59) >> (reg66 ? wire45 : reg55)))));
  assign wire74 = reg61;
endmodule

module module142  (y, clk, wire146, wire145, wire144, wire143);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire146;
  input wire [(4'he):(1'h0)] wire145;
  input wire [(5'h15):(1'h0)] wire144;
  input wire signed [(4'hc):(1'h0)] wire143;
  wire signed [(3'h5):(1'h0)] wire164;
  wire [(2'h2):(1'h0)] wire154;
  wire signed [(5'h13):(1'h0)] wire153;
  wire [(4'h8):(1'h0)] wire152;
  wire signed [(4'h8):(1'h0)] wire151;
  wire [(4'hc):(1'h0)] wire150;
  wire [(4'ha):(1'h0)] wire149;
  wire signed [(5'h12):(1'h0)] wire148;
  wire signed [(4'he):(1'h0)] wire147;
  reg [(5'h15):(1'h0)] reg163 = (1'h0);
  reg [(2'h2):(1'h0)] reg162 = (1'h0);
  reg [(5'h11):(1'h0)] reg161 = (1'h0);
  reg [(5'h15):(1'h0)] reg160 = (1'h0);
  reg [(4'hf):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg155 = (1'h0);
  assign y = {wire164,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 (1'h0)};
  assign wire147 = (8'hb3);
  assign wire148 = (wire147[(4'h8):(3'h5)] ^~ (wire146[(3'h4):(1'h1)] >>> (wire143 ?
                       ((+wire146) ?
                           wire144 : (|wire143)) : ($unsigned(wire146) ?
                           {(8'hb4), wire147} : (wire143 ?
                               wire146 : wire147)))));
  assign wire149 = $unsigned({wire143[(4'ha):(2'h2)]});
  assign wire150 = ($signed(({(wire149 ? wire143 : wire145)} ?
                           (wire143[(1'h1):(1'h1)] ?
                               wire149 : wire145[(1'h0):(1'h0)]) : $unsigned((-wire147)))) ?
                       (~^$signed(($unsigned(wire148) ?
                           wire144 : (wire148 << wire144)))) : (wire143[(3'h4):(2'h2)] ?
                           wire143 : (+wire143)));
  assign wire151 = $signed(wire149);
  assign wire152 = $signed(wire146[(1'h0):(1'h0)]);
  assign wire153 = $signed(wire151);
  assign wire154 = (~|{wire143[(4'hc):(2'h2)],
                       $signed(wire151[(4'h8):(1'h1)])});
  always
    @(posedge clk) begin
      if ($unsigned($signed($unsigned(wire154[(1'h0):(1'h0)]))))
        begin
          reg155 <= $signed((&(($unsigned(wire144) ? (~|wire147) : wire144) ?
              wire151[(1'h0):(1'h0)] : ((^~wire145) ?
                  wire150 : (wire144 + wire148)))));
          reg156 <= {((|wire152) >>> ((8'ha1) < $signed((wire153 > (7'h44))))),
              $signed((~|(-$signed(wire147))))};
          reg157 <= (wire143[(1'h1):(1'h0)] ?
              $unsigned((^~(reg156[(1'h1):(1'h1)] != $signed(wire144)))) : $unsigned(((~^$unsigned(reg156)) > ($signed(wire147) ^ $unsigned((8'hb5))))));
          reg158 <= wire154;
          reg159 <= {reg158};
        end
      else
        begin
          if ($signed((~^$signed((((8'h9d) ? wire150 : wire152) != (8'hb6))))))
            begin
              reg155 <= ((reg155 == (~reg155[(2'h2):(1'h1)])) == $unsigned(reg158[(2'h3):(1'h0)]));
              reg156 <= wire143;
              reg157 <= (~(reg159[(4'h8):(1'h0)] ?
                  (((wire149 ? wire153 : wire148) ?
                      wire148[(3'h5):(2'h2)] : (~|wire149)) * ((reg156 >> wire143) ?
                      $unsigned(wire144) : (wire148 ?
                          wire149 : reg159))) : (~&wire153[(4'hd):(2'h3)])));
              reg158 <= ((reg159[(4'he):(3'h6)] >>> wire152) ?
                  {(8'ha8),
                      ($signed(wire153[(5'h12):(2'h2)]) ?
                          (8'hab) : ($signed(reg156) < (~&wire149)))} : wire151[(2'h2):(2'h2)]);
            end
          else
            begin
              reg155 <= reg159[(3'h5):(2'h3)];
              reg156 <= reg155;
              reg157 <= $unsigned((((((8'ha9) > wire146) ?
                      $signed(wire151) : (wire148 ?
                          wire148 : wire153)) <<< ($signed(reg155) ?
                      (~&wire153) : wire144)) ?
                  (wire152[(1'h0):(1'h0)] ?
                      $signed((wire144 ? wire148 : (8'h9c))) : ((wire148 ?
                              (8'h9c) : reg155) ?
                          reg159 : reg159[(1'h1):(1'h1)])) : {(wire153[(4'hb):(3'h5)] != $signed(wire146))}));
            end
          reg159 <= ({wire154,
              ((^(reg159 >= wire145)) | (^~$signed(wire154)))} ~^ {$unsigned((^~(wire154 >> wire145))),
              (+$signed(wire149))});
          reg160 <= (8'hb6);
          reg161 <= $unsigned($signed((wire148 ?
              ($signed(wire147) != (wire149 ?
                  (8'haf) : (8'hb4))) : wire149[(4'h9):(3'h5)])));
          reg162 <= $signed(wire143);
        end
      reg163 <= {$unsigned($signed((^wire147))),
          $unsigned((wire153[(4'he):(4'he)] ? wire147 : reg155))};
    end
  assign wire164 = {$unsigned(((wire149[(1'h1):(1'h0)] ?
                               wire143 : $signed(wire144)) ?
                           $signed((reg155 <<< wire153)) : (wire148 + (|wire146)))),
                       (~reg161)};
endmodule
