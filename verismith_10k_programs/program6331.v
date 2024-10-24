module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire188;
  wire [(4'h8):(1'h0)] wire187;
  wire signed [(4'hc):(1'h0)] wire186;
  wire signed [(4'hc):(1'h0)] wire185;
  wire signed [(4'he):(1'h0)] wire178;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg181 = (1'h0);
  reg signed [(4'he):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire178,
                 wire27,
                 wire21,
                 wire4,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire4 = (&(^wire1[(1'h0):(1'h0)]));
  module5 #() modinst22 (wire21, clk, wire3, wire0, wire4, wire1);
  always
    @(posedge clk) begin
      reg23 <= ((wire0 ?
              ($signed($signed(wire1)) << $unsigned(wire3)) : $unsigned(({wire2} ?
                  (wire4 == (7'h40)) : $unsigned(wire1)))) ?
          ((wire21 << ({(8'hb7), wire4} ?
              wire2[(1'h1):(1'h1)] : wire21[(3'h7):(1'h1)])) > $signed($unsigned((wire3 ?
              wire0 : wire3)))) : $unsigned(wire4));
      reg24 <= (wire4 ?
          (wire3[(3'h6):(1'h0)] ? wire2[(1'h1):(1'h0)] : reg23) : wire1);
      reg25 <= wire4[(4'hd):(4'hb)];
      reg26 <= wire3;
    end
  assign wire27 = $unsigned(reg25);
  module28 #() modinst179 (wire178, clk, wire0, reg23, wire4, wire2, wire1);
  always
    @(posedge clk) begin
      reg180 <= reg26[(1'h0):(1'h0)];
      reg181 <= (!(((^~reg23[(5'h10):(4'h9)]) + (wire21 ^ {reg23, reg25})) ?
          (+reg26) : wire3));
      reg182 <= (($unsigned(($unsigned(wire1) ?
          $signed((8'h9f)) : reg24[(2'h3):(1'h0)])) <<< reg180[(3'h5):(3'h5)]) * reg25[(2'h2):(1'h1)]);
      reg183 <= {(^(($signed(reg23) ~^ (7'h41)) | $unsigned((reg182 ?
              wire3 : (8'hbb))))),
          (+$unsigned((&reg181[(1'h0):(1'h0)])))};
      reg184 <= (!(reg25[(3'h6):(3'h5)] ~^ reg25));
    end
  assign wire185 = ((^~(wire21 ? wire27[(3'h4):(1'h1)] : reg26)) ?
                       ($signed(wire4) > (|wire2)) : ((+wire1[(2'h2):(1'h1)]) <<< $unsigned(($signed(wire0) & {wire0,
                           (7'h40)}))));
  assign wire186 = reg184[(1'h0):(1'h0)];
  assign wire187 = $signed(wire0[(3'h7):(2'h3)]);
  assign wire188 = (($signed(reg180[(3'h7):(1'h0)]) > $unsigned(wire4[(5'h11):(4'ha)])) <<< $signed(wire4[(4'ha):(1'h1)]));
endmodule

module module28
#(parameter param177 = ((({((8'ha9) ? (8'ha6) : (7'h43))} + (^((8'hab) + (8'hbf)))) ? {{(~|(8'ha3))}, (((8'haf) ? (7'h40) : (7'h43)) ^ ((8'ha8) << (8'hbe)))} : (8'hb8)) ? (|{{{(8'hbe), (8'h9c)}}}) : (~^(~^(!((7'h42) != (8'hb3)))))))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire33;
  input wire [(5'h10):(1'h0)] wire32;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire signed [(4'ha):(1'h0)] wire30;
  input wire [(5'h13):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire176;
  wire [(4'h8):(1'h0)] wire174;
  wire signed [(5'h11):(1'h0)] wire169;
  wire [(2'h3):(1'h0)] wire167;
  wire [(3'h6):(1'h0)] wire122;
  wire [(5'h12):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire100;
  wire [(3'h4):(1'h0)] wire119;
  reg signed [(4'h9):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  assign y = {wire176,
                 wire174,
                 wire169,
                 wire167,
                 wire122,
                 wire121,
                 wire96,
                 wire98,
                 wire99,
                 wire100,
                 wire119,
                 reg175,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 (1'h0)};
  module34 #() modinst97 (wire96, clk, wire31, wire33, wire30, wire32, wire29);
  assign wire98 = (($unsigned((|(wire33 != wire30))) >> $unsigned($signed($unsigned(wire31)))) ?
                      {$unsigned({((8'hbe) ? wire32 : wire33),
                              (wire29 ? wire33 : wire29)}),
                          wire30} : wire30[(1'h0):(1'h0)]);
  assign wire99 = $unsigned((wire31 ~^ (($unsigned(wire30) ?
                      ((8'hbf) ?
                          wire29 : wire31) : $signed(wire98)) <<< $unsigned((~&wire31)))));
  assign wire100 = (^(((^$signed(wire32)) ?
                           $signed(((8'hb6) ?
                               wire31 : (7'h43))) : wire33[(4'he):(4'hc)]) ?
                       $signed($unsigned({wire98})) : ((~^$signed(wire32)) << $signed(wire32[(4'hb):(4'h9)]))));
  module101 #() modinst120 (.clk(clk), .y(wire119), .wire103(wire33), .wire105(wire29), .wire104(wire99), .wire106(wire100), .wire102(wire98));
  assign wire121 = wire99;
  assign wire122 = wire32;
  module123 #() modinst168 (wire167, clk, wire29, wire33, wire99, wire31);
  assign wire169 = (^~((((+wire33) ^ $signed(wire99)) ?
                       wire100[(1'h1):(1'h0)] : (!{wire167,
                           wire32})) || $unsigned((|$unsigned(wire30)))));
  always
    @(posedge clk) begin
      reg170 <= wire33;
      reg171 <= $signed(wire99);
      reg172 <= {{(wire33 <= wire96[(4'ha):(1'h0)]),
              ((8'hba) + ((wire121 ? wire30 : (7'h44)) == (wire122 ?
                  wire32 : wire122)))}};
      reg173 <= $unsigned($signed(wire32));
    end
  assign wire174 = (+(7'h41));
  always
    @(posedge clk) begin
      reg175 <= wire119[(1'h0):(1'h0)];
    end
  assign wire176 = (wire167 ? (7'h44) : $signed(wire29[(5'h11):(4'ha)]));
endmodule

module module5
#(parameter param20 = ({((!{(8'h9e), (8'hb0)}) >= (((8'hb8) ? (8'hbd) : (8'hba)) ^ ((8'ha3) <= (8'ha6))))} < (((+((8'ha8) <= (8'ha8))) ? (((7'h43) | (8'ha4)) ? (-(8'ha1)) : {(8'hbe), (8'hac)}) : (((7'h42) <<< (8'hac)) ? (-(8'ha5)) : (^~(7'h43)))) ? (^~{((8'ha1) < (8'hac))}) : {(^{(8'hab), (8'hbd)}), (~|((8'hb9) ? (8'ha6) : (8'hb6)))})))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire7;
  input wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire10;
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire10 = $unsigned({wire7, (wire6 | $signed({wire8, wire8}))});
  assign wire11 = ((~|{wire6[(1'h0):(1'h0)], $signed($unsigned(wire10))}) ?
                      (($signed((~&wire9)) ~^ (wire10 ?
                          $signed(wire7) : $unsigned(wire6))) || wire10) : {{wire8}});
  assign wire12 = $signed($signed($signed(($unsigned(wire8) ^~ wire11))));
  assign wire13 = wire12[(2'h3):(2'h3)];
  assign wire14 = $signed(wire9[(2'h3):(2'h2)]);
  assign wire15 = $signed((~|wire7[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg16 <= wire8[(1'h1):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg17 <= $unsigned(({wire6[(1'h0):(1'h0)]} ?
          (($signed(wire15) ?
              (wire13 ?
                  (8'haa) : wire10) : wire7) ~^ {(~&(8'hb1))}) : $unsigned(reg16[(1'h1):(1'h1)])));
      reg18 <= (($signed((!$signed(wire9))) ?
          (wire14[(1'h1):(1'h0)] <= $unsigned(reg17[(4'hf):(1'h0)])) : wire15[(3'h7):(1'h0)]) && reg16[(1'h0):(1'h0)]);
      reg19 <= ((^reg17) - {reg18, wire10[(4'hb):(4'h9)]});
    end
endmodule

module module123
#(parameter param166 = {{((~|{(7'h42), (8'hb4)}) ? (((8'ha2) > (8'ha1)) >> ((7'h40) + (7'h42))) : (((8'ha3) < (8'haa)) ? (~(8'haa)) : ((8'ha1) ^ (8'haf)))), ((((8'hab) ? (8'hbd) : (8'h9e)) ? ((8'hbb) <= (8'hb8)) : ((8'hb2) ? (8'hb1) : (8'h9e))) + ({(8'hb2), (7'h44)} >> (&(8'ha5))))}})
(y, clk, wire127, wire126, wire125, wire124);
  output wire [(32'h1ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire127;
  input wire signed [(4'hf):(1'h0)] wire126;
  input wire signed [(4'hb):(1'h0)] wire125;
  input wire signed [(5'h10):(1'h0)] wire124;
  wire signed [(2'h2):(1'h0)] wire165;
  wire signed [(4'h8):(1'h0)] wire164;
  wire signed [(5'h13):(1'h0)] wire163;
  wire signed [(2'h3):(1'h0)] wire162;
  wire signed [(5'h12):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire160;
  wire [(5'h11):(1'h0)] wire159;
  wire [(4'hb):(1'h0)] wire142;
  wire signed [(4'ha):(1'h0)] wire141;
  wire signed [(3'h4):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire139;
  wire [(4'ha):(1'h0)] wire138;
  wire [(4'hd):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire133;
  wire signed [(3'h5):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire128;
  reg [(5'h13):(1'h0)] reg158 = (1'h0);
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg153 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg151 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(3'h7):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(5'h10):(1'h0)] reg147 = (1'h0);
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg145 = (1'h0);
  reg [(4'hc):(1'h0)] reg144 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire133,
                 wire129,
                 wire128,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg136,
                 reg135,
                 reg134,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire128 = wire126;
  assign wire129 = $unsigned((wire126 - ($unsigned(wire128) > (~^((8'ha1) * wire125)))));
  always
    @(posedge clk) begin
      reg130 <= (((wire128 - wire124[(3'h4):(1'h0)]) - wire127[(4'he):(4'ha)]) < wire127[(3'h4):(1'h1)]);
      reg131 <= (^~$unsigned($unsigned((^(wire127 <<< (8'hb3))))));
      reg132 <= wire126[(4'hd):(1'h1)];
    end
  assign wire133 = {(!wire128[(1'h1):(1'h1)])};
  always
    @(posedge clk) begin
      reg134 <= (~|$signed(wire124[(4'hc):(1'h1)]));
      reg135 <= $signed($signed((^$unsigned(wire124[(4'hb):(1'h1)]))));
      reg136 <= $unsigned({(((8'ha1) << $signed(reg130)) - reg134), wire128});
    end
  assign wire137 = wire133[(4'h8):(3'h7)];
  assign wire138 = $unsigned((^~(($unsigned(wire129) ?
                       $unsigned(wire124) : $signed(wire129)) != ((-reg134) <<< (8'ha7)))));
  assign wire139 = reg134;
  assign wire140 = $unsigned(({({wire139,
                           (8'hb0)} | (^reg132))} || reg136[(1'h1):(1'h0)]));
  assign wire141 = (($unsigned((wire129[(1'h0):(1'h0)] >= wire127[(2'h2):(1'h0)])) > (($signed(wire129) <= (wire124 ?
                           wire137 : wire127)) ^ reg136[(4'h8):(1'h1)])) ?
                       (wire128[(1'h1):(1'h0)] - {$signed($unsigned(wire128))}) : $unsigned(reg132[(3'h6):(3'h4)]));
  assign wire142 = {{((~&wire128) ?
                               ($signed((8'ha4)) ^~ (!reg134)) : {$signed(wire126),
                                   (wire125 ? wire141 : wire133)}),
                           ($signed($unsigned(reg136)) ?
                               (reg136[(2'h3):(1'h1)] && (wire133 ?
                                   wire126 : wire125)) : {$unsigned(wire139)})},
                       {wire139}};
  always
    @(posedge clk) begin
      reg143 <= $unsigned({reg134});
      if (({$signed(((+(8'hbe)) ? $unsigned(wire140) : $signed(wire139))),
          reg134[(3'h4):(1'h0)]} <<< ((~wire139[(2'h2):(1'h1)]) == (~&wire124))))
        begin
          reg144 <= ((($unsigned($unsigned(wire126)) ?
              wire127 : (^~$unsigned((8'hb7)))) == ({wire124[(3'h6):(3'h6)],
              (wire137 ? wire139 : reg136)} && $signed((&wire124)))) - wire142);
        end
      else
        begin
          if ({wire126[(4'hd):(3'h7)]})
            begin
              reg144 <= wire137[(3'h7):(3'h6)];
              reg145 <= $unsigned((~&(wire139 ~^ {{wire142}})));
            end
          else
            begin
              reg144 <= wire129[(3'h5):(3'h5)];
            end
        end
      reg146 <= (8'ha3);
      if (wire139[(2'h2):(1'h1)])
        begin
          reg147 <= {$signed({{wire140[(2'h2):(2'h2)], (reg145 ^ (8'hb8))},
                  reg146}),
              {wire129}};
          if ({wire138[(4'ha):(4'ha)]})
            begin
              reg148 <= reg132[(4'h9):(3'h6)];
            end
          else
            begin
              reg148 <= $unsigned((-$unsigned(wire124[(3'h6):(2'h3)])));
              reg149 <= ($signed((~wire133[(4'hb):(3'h5)])) < (($unsigned((^~reg144)) ?
                  $signed((~reg134)) : wire125[(4'h9):(1'h0)]) >= ($unsigned({wire142,
                      (8'ha7)}) ?
                  reg148[(4'h8):(3'h5)] : wire139[(2'h2):(1'h1)])));
              reg150 <= wire138[(1'h1):(1'h1)];
            end
          if (reg130)
            begin
              reg151 <= ((~^((((8'ha8) ^~ (8'hae)) ?
                      {reg145,
                          reg147} : reg149[(1'h1):(1'h0)]) ~^ ((wire138 & reg131) ^ $unsigned(wire128)))) ?
                  ($signed({reg148,
                      reg148[(3'h6):(2'h3)]}) ^~ reg134) : (($unsigned((reg146 ~^ wire133)) || $unsigned(reg134[(1'h0):(1'h0)])) ?
                      $signed((^~reg149[(1'h0):(1'h0)])) : ($unsigned($unsigned((8'hbf))) | reg130)));
              reg152 <= (~|wire141);
              reg153 <= wire125;
            end
          else
            begin
              reg151 <= $signed($unsigned(reg131));
              reg152 <= reg143;
              reg153 <= (reg130[(5'h10):(1'h1)] ?
                  {$signed(wire128[(3'h7):(2'h3)]),
                      $signed(($unsigned(wire140) ?
                          $signed(wire128) : (|wire127)))} : ($unsigned($signed($signed(wire124))) <= wire141[(3'h5):(3'h4)]));
              reg154 <= ($signed((8'ha1)) <= $unsigned(wire125));
            end
          if ($signed((^~(reg150[(4'hc):(4'h9)] ?
              ((wire142 <<< reg149) + reg132[(3'h6):(3'h4)]) : $unsigned({(8'h9f)})))))
            begin
              reg155 <= reg153[(5'h10):(4'ha)];
              reg156 <= reg151[(1'h0):(1'h0)];
              reg157 <= (&$unsigned(reg135[(3'h4):(1'h1)]));
              reg158 <= (8'hbc);
            end
          else
            begin
              reg155 <= ((+(wire140 ?
                      {wire133,
                          reg145[(2'h3):(2'h3)]} : $unsigned((^~reg146)))) ?
                  (7'h42) : reg153);
              reg156 <= (reg134[(3'h4):(3'h4)] ? reg144 : reg131);
            end
        end
      else
        begin
          reg147 <= reg156;
          reg148 <= $unsigned($unsigned(reg136));
          if ($unsigned(({({wire141} + $signed(reg143))} ?
              ({(reg154 ? reg136 : reg153), (|reg151)} ?
                  $signed((reg151 ?
                      reg131 : reg152)) : wire139) : (reg154[(1'h0):(1'h0)] == ((^wire139) ?
                  {reg131} : $unsigned(wire140))))))
            begin
              reg149 <= $unsigned(($unsigned(reg135) ?
                  (8'hbe) : (reg136 ^ reg134)));
              reg150 <= ($signed(reg151) & (^$signed(reg158)));
              reg151 <= (wire126[(1'h1):(1'h1)] ?
                  (reg132 ?
                      $signed($signed(wire128)) : $signed(reg143)) : $signed(wire137));
            end
          else
            begin
              reg149 <= wire129;
            end
        end
    end
  assign wire159 = $signed($unsigned((^~(reg154 > (wire137 * reg149)))));
  assign wire160 = (8'hbe);
  assign wire161 = $signed($signed((~|wire133)));
  assign wire162 = reg157;
  assign wire163 = wire138;
  assign wire164 = (((reg144 >>> ({wire127} ?
                       $signed(wire129) : {reg154,
                           wire163})) && $signed(((8'hbd) ?
                       wire161 : wire138[(2'h2):(1'h1)]))) << (8'hb2));
  assign wire165 = $unsigned(($unsigned(($unsigned(reg135) || $signed(wire126))) ?
                       (reg156 && $signed((+wire162))) : wire128[(1'h1):(1'h0)]));
endmodule

module module101
#(parameter param118 = ((8'haa) ^~ (~((8'h9f) >= ({(8'hb4), (8'ha2)} ? ((8'hba) ? (8'hb8) : (7'h44)) : ((8'ha2) | (8'hba)))))))
(y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire106;
  input wire signed [(4'hf):(1'h0)] wire105;
  input wire [(3'h4):(1'h0)] wire104;
  input wire signed [(5'h14):(1'h0)] wire103;
  input wire [(4'ha):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire117;
  wire signed [(4'hf):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire115;
  wire signed [(4'hf):(1'h0)] wire110;
  wire signed [(3'h4):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire108;
  wire signed [(3'h6):(1'h0)] wire107;
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire107 = $signed((8'hb1));
  assign wire108 = wire105[(4'hf):(1'h0)];
  assign wire109 = $signed((wire106[(3'h4):(2'h3)] ?
                       {((!wire106) >> wire102[(3'h4):(1'h1)])} : (wire107[(1'h1):(1'h0)] ?
                           ((wire102 * (8'h9d)) ?
                               wire104[(1'h1):(1'h1)] : wire105) : wire103[(5'h12):(4'h8)])));
  assign wire110 = (wire106[(4'hb):(2'h3)] == (wire104[(2'h3):(2'h2)] ?
                       ({(!wire108)} ?
                           $unsigned(wire107) : $signed(wire104)) : (wire106 ?
                           wire104 : (~(-wire106)))));
  always
    @(posedge clk) begin
      reg111 <= wire103;
      reg112 <= ($unsigned((~|$unsigned($unsigned(wire110)))) <= wire104[(2'h2):(2'h2)]);
      if ((8'h9f))
        begin
          reg113 <= ({{wire104[(1'h1):(1'h1)]},
              $unsigned($signed($unsigned(reg111)))} >>> (wire110[(3'h4):(2'h3)] ?
              (~^reg112) : ((^~(8'hae)) < $signed($unsigned((8'hb7))))));
        end
      else
        begin
          reg113 <= (~&wire107[(3'h6):(3'h5)]);
          reg114 <= wire108;
        end
    end
  assign wire115 = wire108[(3'h4):(1'h0)];
  assign wire116 = $unsigned(((((reg111 ? wire115 : wire108) ?
                               $unsigned((8'ha7)) : (wire109 ?
                                   wire115 : wire109)) ?
                           ($signed(wire106) ^~ (wire109 ?
                               wire106 : wire108)) : {$signed((8'ha6))}) ?
                       {$signed(reg111[(3'h7):(1'h1)])} : (~&wire107)));
  assign wire117 = (|(-$signed(wire103[(3'h5):(2'h2)])));
endmodule

module module34
#(parameter param94 = ((((|((7'h44) || (8'ha5))) ? (^~((8'hbd) ? (8'hb3) : (7'h41))) : (((8'haa) == (8'haa)) ? {(8'haf), (8'hb2)} : ((8'ha9) ? (8'ha3) : (8'ha7)))) ? (~&(~&((8'haa) ? (7'h42) : (8'h9e)))) : ((~{(8'hb0)}) << {((8'ha4) ? (8'h9f) : (8'hbf))})) <<< (((((8'hb3) ? (8'h9e) : (8'h9c)) << {(8'hbc), (8'had)}) ? {((8'hb6) ? (7'h43) : (8'ha9)), ((8'hb6) ? (8'hab) : (7'h40))} : (((8'haa) * (8'hbf)) ? ((8'hbd) >> (7'h41)) : (8'hb4))) + (8'ha1))), 
parameter param95 = {(~&{(-(param94 ? param94 : param94)), (~(param94 ? param94 : param94))}), ((|(8'ha4)) ~^ param94)})
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h2a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire39;
  input wire signed [(5'h10):(1'h0)] wire38;
  input wire [(3'h4):(1'h0)] wire37;
  input wire signed [(5'h10):(1'h0)] wire36;
  input wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire79,
                 wire78,
                 wire77,
                 wire66,
                 wire41,
                 wire40,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
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
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = (wire35[(3'h4):(2'h2)] ^~ (wire37[(2'h2):(1'h0)] != wire38[(4'h9):(2'h2)]));
  assign wire41 = (|$unsigned($signed(wire39)));
  always
    @(posedge clk) begin
      reg42 <= (wire35[(4'hd):(3'h5)] + $signed(({((8'hb5) - wire37)} ?
          {$signed(wire36)} : wire37)));
      reg43 <= reg42[(3'h5):(3'h4)];
      if ({(8'hb3), (wire40 ? (~(^~wire40[(1'h1):(1'h1)])) : {(8'ha9)})})
        begin
          reg44 <= $signed($signed((|{(wire37 ? reg42 : wire36)})));
          reg45 <= (reg42[(2'h3):(1'h0)] ?
              ((~|$unsigned($signed(wire39))) + {((wire40 - reg43) <<< ((8'hb6) >> reg43))}) : (($unsigned($signed(wire41)) | wire38) >>> wire40));
        end
      else
        begin
          reg44 <= (8'hb8);
          if ($unsigned(({wire35, $unsigned($signed(reg45))} + ({(wire37 ?
                      reg43 : wire36),
                  $unsigned(wire39)} ?
              $unsigned((~^wire40)) : $unsigned((wire41 ? wire35 : (8'hba)))))))
            begin
              reg45 <= ($signed((-wire36)) ^~ wire39[(4'h9):(4'h9)]);
              reg46 <= {$signed($unsigned((~wire35))), reg43};
              reg47 <= reg43;
            end
          else
            begin
              reg45 <= (|$signed({($unsigned((8'ha5)) ?
                      {wire37} : $signed(wire39)),
                  reg46}));
              reg46 <= ((wire40 ~^ ($unsigned(wire35[(1'h0):(1'h0)]) >>> wire41)) ?
                  $signed($unsigned($signed(reg43[(4'hc):(4'hb)]))) : $signed((wire35[(4'hb):(3'h4)] | (((8'ha6) || (8'hb7)) ^ $signed(reg45)))));
            end
          if (($signed(wire40[(4'h9):(3'h4)]) ? reg44[(1'h1):(1'h0)] : wire36))
            begin
              reg48 <= $unsigned($unsigned(reg43));
            end
          else
            begin
              reg48 <= {reg46,
                  ((~^(-wire36)) ?
                      (&$unsigned($unsigned(reg47))) : wire40[(5'h12):(1'h0)])};
            end
          reg49 <= (+reg43);
        end
      reg50 <= $unsigned($unsigned({reg48}));
      if ({(+(|(~wire38[(3'h7):(2'h3)])))})
        begin
          reg51 <= (&wire37);
          reg52 <= ((reg50 ?
                  wire38[(4'hd):(3'h6)] : $unsigned(reg44[(3'h7):(3'h4)])) ?
              reg50 : wire39[(3'h5):(1'h0)]);
          reg53 <= $signed(wire40[(4'hd):(4'hb)]);
        end
      else
        begin
          reg51 <= $signed(reg44[(4'hf):(4'he)]);
        end
    end
  always
    @(posedge clk) begin
      reg54 <= {(^reg47),
          ($signed(reg49[(3'h6):(1'h0)]) ?
              {$signed({reg50,
                      reg50})} : ((reg53 + $unsigned(reg46)) * (~|wire35)))};
      if (($signed(((8'hb2) ?
              $signed($signed(wire37)) : (|(reg50 >> wire40)))) ?
          $signed({$unsigned(((8'had) | reg46))}) : reg50[(4'h9):(4'h8)]))
        begin
          reg55 <= reg44;
          if ((reg55[(4'h9):(1'h0)] ~^ (((((8'h9c) ?
              reg45 : reg42) >> $signed(reg54)) || reg53[(4'h8):(2'h3)]) & ((reg46[(1'h0):(1'h0)] < (reg52 <= reg52)) ?
              (~^wire36) : (&$signed((7'h44)))))))
            begin
              reg56 <= reg47;
              reg57 <= $signed((((!$unsigned(wire40)) ?
                      $unsigned(reg43) : $signed((wire39 ? wire40 : reg51))) ?
                  (8'haa) : (^~($signed((7'h43)) ?
                      reg54 : (reg47 ? reg56 : reg50)))));
              reg58 <= {($signed(reg42[(3'h7):(3'h4)]) ~^ $unsigned($unsigned((~reg49)))),
                  $unsigned(((!$unsigned(wire35)) ?
                      ((reg56 ? (8'h9e) : wire35) << (reg51 ?
                          (8'hab) : wire37)) : $unsigned($signed(reg45))))};
              reg59 <= reg42;
              reg60 <= $unsigned(reg42[(1'h0):(1'h0)]);
            end
          else
            begin
              reg56 <= ($signed((~^reg55[(3'h4):(2'h2)])) > $signed(reg46));
              reg57 <= ((&(reg48 ?
                      (reg59[(3'h6):(3'h4)] ?
                          (reg57 <<< reg60) : reg42) : $signed(wire41))) ?
                  reg53[(3'h4):(2'h2)] : (wire35[(2'h3):(1'h1)] * reg58[(3'h5):(3'h5)]));
              reg58 <= wire40[(3'h6):(1'h0)];
              reg59 <= reg46[(1'h0):(1'h0)];
            end
          if ($signed((~&$unsigned(reg59))))
            begin
              reg61 <= ($signed($signed((reg51 == $unsigned(reg54)))) > reg55[(3'h7):(1'h1)]);
              reg62 <= (~|$signed(reg45));
              reg63 <= {reg46, (~($signed({(7'h44), reg43}) < (8'ha2)))};
              reg64 <= reg62;
            end
          else
            begin
              reg61 <= reg58;
              reg62 <= $unsigned($signed(reg57[(4'hc):(4'hb)]));
            end
        end
      else
        begin
          if ((^((~^(&(wire41 ? reg43 : reg46))) ?
              $unsigned(wire36[(2'h3):(1'h1)]) : $signed($unsigned($signed(reg59))))))
            begin
              reg55 <= (8'hb3);
              reg56 <= reg43[(4'hb):(4'h9)];
            end
          else
            begin
              reg55 <= ($unsigned($signed($signed((reg63 ~^ reg50)))) <= ((&$signed((-(8'ha4)))) ~^ $signed($signed($unsigned(reg58)))));
              reg56 <= ((^(({wire39} ?
                  $unsigned(reg49) : $unsigned((8'hab))) - ({wire39,
                  wire40} >= (&(8'hb7))))) <<< {$signed($signed((reg59 ?
                      reg48 : reg54)))});
              reg57 <= (~($unsigned(reg61[(5'h10):(4'h9)]) ^~ {(^(&reg43))}));
              reg58 <= (8'hb4);
            end
        end
      reg65 <= {$signed(reg57[(2'h3):(2'h3)])};
    end
  assign wire66 = $unsigned(($signed((!$signed(wire39))) <= $signed(reg42[(4'hc):(4'hb)])));
  always
    @(posedge clk) begin
      reg67 <= $signed((reg52 >= reg45));
      reg68 <= reg56;
      if ((reg46[(2'h2):(1'h0)] ?
          {$signed({{reg49, reg54}, $signed(reg47)}),
              wire38[(3'h4):(1'h0)]} : (^~({(wire66 ?
                  (7'h40) : reg68)} <<< $signed({wire36, wire38})))))
        begin
          if ($signed($unsigned($signed(($signed(reg52) ?
              $signed(reg48) : (reg45 >= wire37))))))
            begin
              reg69 <= $signed(reg58[(2'h2):(2'h2)]);
              reg70 <= $unsigned((((&$unsigned(reg57)) ?
                  ({reg59, reg44} ?
                      (reg64 ?
                          reg51 : reg52) : $signed(wire40)) : $signed((reg57 || reg42))) && reg68[(4'hd):(4'ha)]));
              reg71 <= (!(8'hbd));
            end
          else
            begin
              reg69 <= $unsigned(($signed($signed($signed((8'haa)))) ^~ $signed({((8'hb6) ?
                      reg57 : reg46),
                  (reg57 << reg55)})));
            end
          reg72 <= (~&$signed((+((reg67 ?
              (8'hb5) : reg45) >>> (reg58 | reg47)))));
          reg73 <= ((^~$signed(reg47[(1'h1):(1'h1)])) ?
              $unsigned(($unsigned(((8'ha7) ?
                  reg58 : wire66)) == reg42[(1'h1):(1'h0)])) : wire38);
          reg74 <= reg57[(4'h9):(1'h1)];
        end
      else
        begin
          reg69 <= reg44;
          if (reg71[(3'h6):(3'h5)])
            begin
              reg70 <= $signed((({$signed(reg61)} ?
                  (-(^(8'ha4))) : $unsigned($unsigned(wire38))) >>> (&((reg56 * reg55) ?
                  (&wire41) : (wire36 + reg48)))));
              reg71 <= $unsigned($unsigned(((reg44 != reg62) ?
                  (~&((8'ha1) >>> reg73)) : {$signed(reg48),
                      $signed(wire66)})));
              reg72 <= reg42;
            end
          else
            begin
              reg70 <= {($unsigned(reg73[(4'he):(3'h6)]) ?
                      $signed(reg74) : reg45[(1'h1):(1'h0)])};
              reg71 <= (reg55[(1'h0):(1'h0)] && reg51);
              reg72 <= ((reg64[(5'h10):(1'h1)] ?
                  (~|reg43) : ($signed((reg42 ^~ reg43)) >> reg61[(4'h8):(3'h5)])) - ($signed($unsigned({reg72,
                  reg52})) >= ((8'ha2) ?
                  (~&reg55[(4'hc):(2'h3)]) : $signed(reg58))));
              reg73 <= (((($unsigned((8'h9e)) ^~ $signed(reg43)) - (-(^(8'hb9)))) ?
                      reg64 : $unsigned((~^wire66[(2'h2):(2'h2)]))) ?
                  $signed((({reg64} ?
                      $signed(wire38) : $signed(reg65)) + {(!reg52)})) : ($unsigned(reg49) << {($unsigned(reg64) ?
                          $unsigned(reg55) : (+reg55)),
                      reg57}));
            end
          reg74 <= reg63[(3'h4):(1'h1)];
        end
      reg75 <= (({$signed($unsigned(reg68)),
              $unsigned($signed(reg69))} >= $signed(reg46[(1'h0):(1'h0)])) ?
          $signed($signed((((8'hb2) ? reg44 : wire66) ?
              (reg73 - reg64) : reg67[(2'h2):(1'h1)]))) : $unsigned(reg50));
      reg76 <= (~^($signed($unsigned((|reg46))) != $signed(((reg61 ?
          reg52 : reg73) >= reg67))));
    end
  assign wire77 = reg70[(3'h5):(3'h4)];
  assign wire78 = (^reg56);
  assign wire79 = reg44[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      reg80 <= ($unsigned(((^(~&reg53)) >= ((reg55 << (8'ha7)) ?
          ((8'ha1) * reg59) : $unsigned(reg52)))) <= (reg43[(3'h6):(1'h1)] ^~ reg58));
    end
  always
    @(posedge clk) begin
      reg81 <= {{($signed($unsigned(reg73)) ?
                  {(reg42 >>> reg47), (reg69 & reg73)} : ((reg52 ?
                          reg60 : reg43) ?
                      reg67 : (&reg62)))}};
      reg82 <= reg80[(3'h5):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg83 <= ($signed(wire38[(3'h5):(3'h4)]) ?
          reg49[(4'h8):(2'h2)] : (8'ha0));
      reg84 <= (reg60[(2'h2):(1'h0)] == {($unsigned($unsigned(reg60)) << reg60),
          (|(reg45 ? $signed(reg75) : (reg54 ? wire79 : reg80)))});
    end
  assign wire85 = (^~(&reg69));
  assign wire86 = ((reg75[(2'h3):(2'h3)] && reg81[(4'ha):(3'h6)]) ?
                      (reg81 ?
                          (-(~^(reg61 ~^ reg54))) : wire36[(2'h3):(2'h2)]) : {($unsigned($signed(wire66)) ?
                              $unsigned({wire39}) : ((~&reg45) < reg43)),
                          (reg76 & ($signed(reg62) < (reg67 | reg58)))});
  assign wire87 = (|reg46[(1'h0):(1'h0)]);
  assign wire88 = reg80[(2'h3):(2'h2)];
  assign wire89 = wire78[(2'h2):(1'h1)];
  assign wire90 = (|{(^reg76[(2'h2):(2'h2)])});
  assign wire91 = reg56;
  assign wire92 = ((reg75[(2'h2):(1'h1)] | (+((~|reg52) + ((8'h9e) | reg57)))) ?
                      (~|wire41[(3'h4):(2'h2)]) : reg64);
  assign wire93 = wire88[(3'h6):(2'h3)];
endmodule
