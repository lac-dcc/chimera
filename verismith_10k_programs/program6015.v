module top
#(parameter param176 = ((~|(-{((8'ha0) & (8'hbf)), ((8'hb4) | (8'hb7))})) ? ((|((&(8'hb7)) ? ((8'ha9) < (8'hba)) : {(8'hbb), (8'h9d)})) + {((^(8'ha0)) <= (^~(8'hb6)))}) : {((+((8'hb1) <= (7'h42))) & {((8'haa) ? (8'ha1) : (8'hbb)), ((8'ha7) ? (8'hb2) : (8'hbd))}), ((|(-(8'ha8))) ^~ ((~(7'h43)) ? ((8'hb1) ? (8'h9d) : (8'hb2)) : ((8'haa) << (7'h40))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire175;
  wire signed [(5'h12):(1'h0)] wire174;
  wire signed [(4'hd):(1'h0)] wire173;
  wire [(5'h11):(1'h0)] wire170;
  wire signed [(5'h10):(1'h0)] wire169;
  wire signed [(4'h8):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire116;
  wire [(2'h2):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire134;
  wire [(4'hb):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire167;
  reg [(4'hc):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire170,
                 wire169,
                 wire113,
                 wire23,
                 wire115,
                 wire116,
                 wire117,
                 wire134,
                 wire135,
                 wire167,
                 reg172,
                 reg171,
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
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  module5 #() modinst24 (.wire6(wire1), .y(wire23), .wire7(wire2), .wire8(wire4), .clk(clk), .wire9(wire3));
  module25 #() modinst114 (wire113, clk, wire23, wire3, wire4, wire1, wire0);
  assign wire115 = wire1;
  assign wire116 = wire1;
  assign wire117 = (wire23[(2'h2):(1'h1)] ?
                       wire113[(1'h1):(1'h0)] : $unsigned({wire4, wire113}));
  always
    @(posedge clk) begin
      reg118 <= ($signed(wire113) ?
          $signed(wire117) : {($signed((wire4 ? (8'h9e) : wire2)) ?
                  $unsigned((^~wire117)) : $signed(wire4)),
              wire117});
      reg119 <= wire23;
      if ((~|(8'hb6)))
        begin
          reg120 <= {((wire4[(2'h2):(1'h1)] ?
                  ((wire23 ? (8'hb3) : wire3) ^~ (&wire117)) : ($signed(wire4) ?
                      (wire4 ?
                          wire116 : wire2) : wire4)) - (^~(~^$unsigned(reg119)))),
              (~|$signed($unsigned(wire0)))};
        end
      else
        begin
          if ((~&{$unsigned(({reg119, wire23} - {wire113}))}))
            begin
              reg120 <= $unsigned($signed(wire113[(1'h0):(1'h0)]));
              reg121 <= wire116;
              reg122 <= $signed($signed($signed(($unsigned(wire113) ?
                  reg120[(3'h4):(2'h2)] : (&(7'h44))))));
            end
          else
            begin
              reg120 <= (wire116 + {wire3[(5'h10):(5'h10)],
                  $signed({wire0, wire115})});
            end
          reg123 <= $unsigned(wire116[(1'h0):(1'h0)]);
          reg124 <= (~|$signed($signed({(wire115 ? reg119 : wire113)})));
          if (reg122)
            begin
              reg125 <= ({(|(+(wire0 ? wire113 : reg121)))} ?
                  (wire2[(4'h9):(3'h4)] ?
                      ($unsigned(reg120[(2'h2):(1'h0)]) ?
                          reg122[(3'h7):(2'h3)] : $signed($signed(reg120))) : $unsigned($signed(reg123[(3'h5):(2'h2)]))) : reg122);
              reg126 <= (reg119 ?
                  (wire0[(4'h8):(4'h8)] ?
                      reg121 : ($signed(wire3) - $signed({wire0}))) : (($signed($signed((8'hbe))) ?
                      {{wire0}} : ((-(8'ha4)) ?
                          wire2 : $signed((8'hbf)))) <= ((&$signed(reg118)) ?
                      ((^~wire3) ? wire113 : reg121) : {(!reg120),
                          $unsigned(reg121)})));
            end
          else
            begin
              reg125 <= {(~^{reg123, (8'h9d)})};
              reg126 <= wire115[(2'h3):(1'h0)];
              reg127 <= $signed(reg124);
              reg128 <= reg127[(1'h0):(1'h0)];
              reg129 <= $signed((~|$unsigned({((8'h9f) | reg126)})));
            end
          reg130 <= $signed((!{$signed(wire1),
              ($unsigned((8'hb6)) ^~ (!reg121))}));
        end
      reg131 <= (&$unsigned(reg123));
    end
  always
    @(posedge clk) begin
      reg132 <= $unsigned(wire4);
      reg133 <= (|(8'hba));
    end
  assign wire134 = $unsigned((~reg123[(3'h5):(3'h5)]));
  assign wire135 = {((+{{reg125}}) ?
                           {reg123, (^reg118)} : wire117[(2'h2):(1'h0)]),
                       {(reg131 ?
                               ((+(8'hb1)) < $unsigned(reg130)) : ({(8'h9c),
                                       wire2} ?
                                   wire4[(4'hb):(2'h2)] : {reg123}))}};
  module136 #() modinst168 (wire167, clk, wire23, wire2, reg118, reg124, wire4);
  assign wire169 = (7'h43);
  assign wire170 = $signed($unsigned(({(wire115 ? (8'hab) : reg132),
                       $signed(wire2)} ^ reg131[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      reg171 <= (~|reg122);
      reg172 <= (~^{$signed({$signed((8'hb2)), (reg132 ? (8'hb8) : wire135)})});
    end
  assign wire173 = (wire2 > $unsigned({$unsigned(wire23[(3'h7):(3'h6)])}));
  assign wire174 = $signed($unsigned(($unsigned((reg127 ? (8'hbe) : reg122)) ?
                       ((wire173 | wire135) ?
                           reg131[(2'h2):(2'h2)] : (+wire170)) : $unsigned($unsigned(wire0)))));
  assign wire175 = wire4;
endmodule

module module136
#(parameter param165 = (((~^{(~|(8'hb6))}) ? (|{(8'ha4)}) : (-(~&((8'ha2) ? (8'hb8) : (7'h44))))) ? {((8'hab) ? (|((8'ha8) ? (8'hb0) : (7'h43))) : ({(8'ha1)} ? ((7'h42) * (7'h40)) : (~^(8'h9d))))} : (7'h41)), 
parameter param166 = ((((+(param165 ? param165 : param165)) ? (~(param165 * param165)) : (~|(^~param165))) ? param165 : param165) ? ((-param165) ? (param165 == (-(param165 ? param165 : (8'hb0)))) : ({(^param165), (param165 != (8'hb7))} ? (param165 >= (param165 < (8'h9c))) : (((8'ha8) ? param165 : param165) ? (param165 ? param165 : param165) : (param165 ? param165 : (8'ha9))))) : ({param165, param165} ? ((param165 ? param165 : {param165}) ? (((8'haa) != param165) >= (^(8'hb7))) : ((8'ha0) ? (param165 ? param165 : param165) : {param165})) : param165)))
(y, clk, wire141, wire140, wire139, wire138, wire137);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire141;
  input wire [(3'h7):(1'h0)] wire140;
  input wire [(2'h2):(1'h0)] wire139;
  input wire signed [(5'h11):(1'h0)] wire138;
  input wire signed [(3'h4):(1'h0)] wire137;
  wire [(4'hc):(1'h0)] wire160;
  wire [(3'h4):(1'h0)] wire159;
  wire [(4'h8):(1'h0)] wire158;
  wire [(5'h10):(1'h0)] wire156;
  wire signed [(5'h14):(1'h0)] wire155;
  wire signed [(2'h2):(1'h0)] wire154;
  wire [(3'h4):(1'h0)] wire153;
  wire [(3'h6):(1'h0)] wire152;
  wire signed [(3'h6):(1'h0)] wire151;
  wire signed [(4'he):(1'h0)] wire146;
  wire [(2'h3):(1'h0)] wire145;
  wire signed [(2'h3):(1'h0)] wire144;
  wire [(4'h8):(1'h0)] wire143;
  wire [(3'h7):(1'h0)] wire142;
  reg [(4'he):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg163 = (1'h0);
  reg [(3'h4):(1'h0)] reg162 = (1'h0);
  reg [(3'h7):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg150 = (1'h0);
  reg [(2'h3):(1'h0)] reg149 = (1'h0);
  reg [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg157,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire142 = (wire138[(1'h0):(1'h0)] ?
                       ($signed(wire141) >> $unsigned((^wire137[(2'h3):(1'h1)]))) : wire139);
  assign wire143 = wire139[(1'h1):(1'h0)];
  assign wire144 = (wire143 ?
                       wire137 : ($signed((wire139 ?
                               ((8'hb2) * wire139) : ((7'h44) && wire140))) ?
                           {wire137} : $signed({$signed(wire140)})));
  assign wire145 = $signed(wire144);
  assign wire146 = $unsigned((($signed(wire144) ^~ wire138[(5'h11):(3'h7)]) ?
                       (&(^~$signed(wire144))) : {(wire144[(2'h2):(1'h1)] ?
                               wire137 : wire145)}));
  always
    @(posedge clk) begin
      reg147 <= ((&$signed($unsigned((^wire138)))) ?
          wire141[(2'h2):(2'h2)] : $unsigned(((wire137[(3'h4):(1'h1)] ?
              wire139[(1'h1):(1'h0)] : (wire143 ?
                  wire144 : wire138)) >>> $unsigned(wire139[(2'h2):(1'h0)]))));
      reg148 <= reg147;
      reg149 <= ((reg147[(2'h3):(1'h1)] ?
          wire143 : ($signed((reg147 ? (8'h9f) : wire144)) ?
              wire143[(3'h7):(3'h4)] : wire142)) <= wire145);
      reg150 <= $unsigned($signed((wire143[(3'h6):(2'h3)] << (|$unsigned(wire139)))));
    end
  assign wire151 = reg147;
  assign wire152 = (reg149 ~^ wire143);
  assign wire153 = wire152[(1'h1):(1'h0)];
  assign wire154 = ((wire137[(2'h3):(2'h2)] ?
                           (&$unsigned(reg148[(4'hd):(4'hb)])) : ($signed({wire139}) + ((wire138 >> wire139) ^ $unsigned((8'h9d))))) ?
                       wire146 : ((((reg149 ? wire143 : wire153) ?
                               (|wire152) : wire152[(3'h5):(3'h4)]) ?
                           $signed((!wire141)) : ((!reg150) == (~|wire137))) && reg149[(2'h2):(1'h1)]));
  assign wire155 = (((wire141[(2'h2):(2'h2)] != ({wire152} == ((8'hb6) & wire145))) ?
                       (reg149 ?
                           {((7'h41) ?
                                   wire145 : wire144)} : wire142) : $unsigned(($unsigned((8'had)) ?
                           (^~wire154) : {(8'hb7),
                               wire151}))) >>> (($signed((wire153 ?
                           wire142 : wire145)) ?
                       $unsigned({wire151}) : {$signed(reg147)}) >> $unsigned(wire143[(4'h8):(3'h6)])));
  assign wire156 = (reg150[(3'h5):(1'h1)] && (reg148 ?
                       (($unsigned((8'ha1)) ^~ $signed(wire146)) ?
                           (^~wire146) : wire154) : $signed(wire144[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      reg157 <= (-$signed((wire141 ?
          ($signed(wire146) || (+wire138)) : wire153)));
    end
  assign wire158 = (((&$unsigned(wire146[(3'h5):(2'h3)])) < (~^(|(~&reg147)))) ?
                       wire139 : wire152[(3'h6):(2'h2)]);
  assign wire159 = {$signed(wire155), wire151[(2'h2):(1'h0)]};
  assign wire160 = wire159;
  always
    @(posedge clk) begin
      reg161 <= wire160;
      reg162 <= {$signed($signed((wire151[(2'h2):(1'h1)] >= (wire141 - wire158)))),
          {(!$unsigned($signed((8'ha1)))), wire153}};
      reg163 <= {(7'h43)};
      reg164 <= wire151;
    end
endmodule

module module25
#(parameter param112 = ((({((8'hb7) ? (8'hbc) : (8'hb5))} ? (((8'hb2) ? (8'ha4) : (8'ha6)) * ((8'hb9) <= (7'h43))) : (((8'hb6) ? (8'h9e) : (8'hb6)) > (-(8'ha1)))) && {(((8'h9c) <= (8'h9f)) ? (8'ha4) : ((8'ha9) || (8'ha4)))}) + (!(|(((8'h9c) ^~ (8'haf)) ? (&(7'h43)) : ((8'h9c) ? (8'hbc) : (8'hba)))))))
(y, clk, wire26, wire27, wire28, wire29, wire30);
  output wire [(32'h2a9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire26;
  input wire [(4'ha):(1'h0)] wire27;
  input wire signed [(4'ha):(1'h0)] wire28;
  input wire signed [(4'he):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire110;
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  assign y = {wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire76,
                 wire77,
                 wire78,
                 wire81,
                 wire82,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire110,
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
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg79,
                 reg80,
                 (1'h0)};
  assign wire31 = ($signed(wire27) * wire27);
  assign wire32 = $unsigned(wire28);
  assign wire33 = (wire30 ?
                      $unsigned(wire30[(2'h3):(1'h1)]) : (-{$signed((~&(7'h42)))}));
  assign wire34 = $signed((((^~((8'hbb) ? wire31 : wire33)) ?
                      {(wire31 ^~ wire31),
                          $unsigned(wire33)} : (8'hae)) < {$unsigned(wire30[(2'h3):(1'h1)])}));
  assign wire35 = ($unsigned($signed((~wire28[(3'h5):(2'h2)]))) >>> ($signed({(8'had)}) - (((wire28 ~^ (8'ha1)) > {wire31,
                          wire30}) ?
                      (wire27 <<< $signed(wire34)) : (|wire27))));
  assign wire36 = wire27[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg37 <= ($unsigned($signed((wire32 ?
          (wire27 & wire29) : wire32[(1'h1):(1'h0)]))) & $signed(wire31[(4'h8):(3'h7)]));
      if (wire34)
        begin
          reg38 <= $signed(wire34[(3'h5):(1'h0)]);
        end
      else
        begin
          reg38 <= $signed(wire32);
          reg39 <= (wire29[(2'h3):(1'h1)] ^~ (8'hbe));
          reg40 <= (&((wire35 > (+wire32[(4'h9):(4'h8)])) || (~|$unsigned((wire28 << (8'hb6))))));
          if ((wire30[(4'hb):(3'h4)] ?
              (wire33 * (($unsigned(wire30) ?
                  $unsigned(reg38) : wire29[(3'h7):(3'h5)]) | reg40)) : {($unsigned($unsigned(wire35)) ?
                      $signed(wire33[(3'h6):(3'h6)]) : $unsigned(((8'hab) ?
                          wire34 : wire33))),
                  reg38[(5'h14):(1'h0)]}))
            begin
              reg41 <= $signed($signed($signed(wire27[(3'h7):(1'h0)])));
              reg42 <= (-{($signed($signed(reg40)) ?
                      wire35 : ($signed(wire31) >>> $signed(wire32))),
                  ((8'hb8) >> (-(reg38 ? wire28 : wire36)))});
              reg43 <= {reg37};
              reg44 <= (reg41 ?
                  $unsigned($signed((~&$signed(reg38)))) : $unsigned((-{(^reg40),
                      $unsigned(wire32)})));
              reg45 <= {(+(reg39 | ((reg42 ? wire27 : wire32) < wire31)))};
            end
          else
            begin
              reg41 <= {(^~wire27[(3'h5):(1'h0)])};
              reg42 <= ($unsigned(wire33) <<< reg39);
              reg43 <= $signed(($unsigned(($unsigned(wire35) ?
                      {wire29} : $signed((8'ha7)))) ?
                  (reg41[(2'h2):(2'h2)] != wire36) : (8'ha5)));
              reg44 <= (wire30 ^~ ((+$signed(((8'hab) ?
                  wire30 : (8'hb5)))) == ((wire33[(3'h7):(1'h1)] == reg41[(4'ha):(1'h1)]) ?
                  (wire28 ?
                      $unsigned(wire35) : $signed((8'ha3))) : $signed((reg38 ?
                      reg45 : wire36)))));
              reg45 <= ($signed((({wire27} ^~ (wire33 ?
                      wire33 : (8'ha0))) == reg37)) ?
                  $signed((~&(-reg41[(2'h3):(1'h1)]))) : wire33[(4'hc):(4'hb)]);
            end
        end
    end
  always
    @(posedge clk) begin
      reg46 <= (-$unsigned($unsigned(($signed(reg44) ?
          {reg39, reg38} : (~reg37)))));
      reg47 <= {(8'ha0)};
      if (reg39)
        begin
          if ($unsigned(((($signed(reg42) <<< ((8'hb0) ?
                  wire27 : reg44)) == {((8'hb2) <= reg39)}) ?
              $unsigned($unsigned(wire35[(2'h3):(1'h1)])) : $unsigned($unsigned({reg40})))))
            begin
              reg48 <= $signed({$unsigned($signed(wire31[(3'h5):(1'h0)]))});
              reg49 <= wire35;
            end
          else
            begin
              reg48 <= (~^reg40[(1'h1):(1'h1)]);
              reg49 <= $signed((^$unsigned((~&$signed((8'hb1))))));
              reg50 <= (((wire35 < (~reg42)) >>> (&$signed((-reg39)))) ?
                  (reg40[(1'h0):(1'h0)] ?
                      reg45 : ((reg43 && reg41) ?
                          $unsigned($unsigned(wire28)) : $unsigned((reg40 << wire36)))) : ($unsigned(($unsigned(reg49) ?
                          (~reg49) : $unsigned((8'hb6)))) ?
                      (((8'hbb) ? wire35 : $unsigned(reg45)) ?
                          reg46[(3'h6):(1'h1)] : $unsigned((reg43 | (8'ha1)))) : wire31[(1'h1):(1'h0)]));
              reg51 <= reg46[(3'h5):(1'h1)];
              reg52 <= (wire27 < (-(($signed(reg45) ?
                  (reg48 & wire36) : {reg37, reg41}) < wire31)));
            end
          if (reg39)
            begin
              reg53 <= $signed({$unsigned(reg42[(2'h3):(2'h2)])});
              reg54 <= ((~^reg49) - wire27);
              reg55 <= {reg54[(2'h3):(2'h3)]};
              reg56 <= $unsigned((reg54 ^~ (~|$unsigned((reg50 << wire35)))));
              reg57 <= $signed($signed({wire29, reg55}));
            end
          else
            begin
              reg53 <= reg43;
              reg54 <= reg43;
              reg55 <= {$unsigned(reg41[(3'h6):(2'h3)])};
              reg56 <= (reg44[(3'h6):(3'h6)] != reg42);
              reg57 <= ((~{((reg53 << reg46) >>> $unsigned(reg56))}) ?
                  (reg45 ?
                      ({$signed((8'ha9)),
                          (~&(8'hb5))} - reg39) : $signed({(wire27 ?
                              (8'hb5) : wire34),
                          $signed(reg50)})) : (|wire27[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          if ((8'ha8))
            begin
              reg48 <= ((^reg47) ?
                  (reg52[(4'hb):(4'h8)] * reg44) : wire26[(2'h3):(1'h0)]);
              reg49 <= (!reg37[(1'h1):(1'h0)]);
              reg50 <= reg40[(1'h0):(1'h0)];
            end
          else
            begin
              reg48 <= ((^$unsigned($unsigned((8'had)))) ?
                  $unsigned(wire30[(3'h7):(3'h6)]) : (reg47[(2'h2):(2'h2)] - reg37));
              reg49 <= (~|$signed({{{reg42}}}));
              reg50 <= (^$unsigned((((8'hbc) + wire32[(4'hc):(2'h2)]) | ($signed((8'haf)) ~^ reg42))));
              reg51 <= (~|$signed(($unsigned((wire33 ? wire28 : reg44)) ?
                  {$unsigned(reg37), (|reg54)} : ($unsigned(reg48) + reg43))));
              reg52 <= (({{$signed(reg54)}} ?
                      (wire29[(3'h5):(3'h5)] == reg41) : (((reg39 << (8'hbc)) - wire31) || ($signed((8'ha2)) ?
                          (reg41 ? reg42 : reg44) : {wire32}))) ?
                  $unsigned({reg42, reg50}) : reg44[(3'h6):(3'h4)]);
            end
          reg53 <= (~|reg44[(1'h0):(1'h0)]);
        end
      reg58 <= $unsigned($signed({((8'h9f) & (7'h40))}));
      if ((+($unsigned(($signed(wire32) | reg52)) > (&{reg55}))))
        begin
          reg59 <= (($unsigned(({(8'ha1)} ? reg47 : wire32[(3'h7):(2'h2)])) ?
              (((reg41 ^~ reg58) ? (~&reg42) : (wire30 >> reg38)) ~^ (((8'ha3) ?
                      (8'ha0) : (8'hb4)) ?
                  $unsigned(reg54) : reg38[(5'h12):(4'hd)])) : reg56) <= $unsigned(reg52));
          if (reg48)
            begin
              reg60 <= reg51[(1'h1):(1'h0)];
              reg61 <= $unsigned(reg55[(1'h0):(1'h0)]);
              reg62 <= $unsigned(reg39);
              reg63 <= (~$signed($signed((reg44 > (reg47 - wire29)))));
              reg64 <= wire28;
            end
          else
            begin
              reg60 <= (reg43[(4'hc):(2'h3)] + ((reg58 ?
                  $signed((reg44 | wire35)) : reg64) >= wire30));
              reg61 <= {reg42};
              reg62 <= ((reg56[(2'h3):(1'h1)] > $signed(reg57[(4'hf):(3'h5)])) ?
                  (8'hac) : wire29[(3'h6):(2'h2)]);
            end
          reg65 <= wire26[(1'h0):(1'h0)];
          if (reg37)
            begin
              reg66 <= (((-(~|(~|reg53))) ?
                  (+reg47) : $signed(reg47)) >= (!wire27[(1'h0):(1'h0)]));
              reg67 <= (8'haf);
              reg68 <= (8'ha7);
            end
          else
            begin
              reg66 <= wire36[(4'hd):(4'h8)];
              reg67 <= (^{reg57, (reg40 ? wire30 : (8'hab))});
              reg68 <= reg50;
              reg69 <= {{{wire27[(4'h9):(1'h1)]}}};
              reg70 <= $signed(reg60);
            end
          reg71 <= $signed($unsigned(reg59[(1'h0):(1'h0)]));
        end
      else
        begin
          reg59 <= $signed($signed(($unsigned($signed(reg54)) && (^reg57[(4'he):(3'h6)]))));
          reg60 <= $signed($signed($signed($signed(((8'h9e) ~^ reg59)))));
        end
    end
  always
    @(posedge clk) begin
      if ((((|(~&$signed(reg62))) <<< {{$signed(wire31),
                  (reg52 ? reg45 : reg56)},
              $signed((reg68 >> reg44))}) ?
          $signed(reg64) : $signed((^~(~^$unsigned(wire27))))))
        begin
          reg72 <= wire29;
          reg73 <= ((+($unsigned(reg70) ?
              (reg67[(4'hd):(4'h8)] ?
                  $unsigned((8'hb8)) : {reg44}) : $signed((~^reg60)))) - $unsigned($unsigned((reg49 ?
              $signed((8'ha1)) : (7'h42)))));
        end
      else
        begin
          reg72 <= (-($unsigned($signed((reg45 ? reg67 : reg61))) ?
              wire35 : $signed((reg48 << (reg73 ^ (8'hb1))))));
        end
      reg74 <= (~reg52);
      reg75 <= $signed(reg69);
    end
  assign wire76 = (^~$unsigned($unsigned((reg46 != (reg47 << reg51)))));
  assign wire77 = reg71;
  assign wire78 = $signed((reg59[(2'h2):(2'h2)] ^~ reg44[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg79 <= {((~^$unsigned($unsigned((8'ha9)))) > wire33)};
      reg80 <= $unsigned($unsigned($unsigned((reg40[(4'hd):(4'hc)] ?
          reg74 : reg79[(1'h0):(1'h0)]))));
    end
  assign wire81 = {reg75[(2'h2):(1'h0)],
                      (reg60 ?
                          reg69 : (reg58[(5'h11):(4'hc)] ?
                              $signed((&reg41)) : reg52[(4'hc):(4'ha)]))};
  assign wire82 = reg58[(3'h7):(3'h6)];
  assign wire83 = (8'h9e);
  assign wire84 = $signed($unsigned($signed($unsigned((reg66 ?
                      reg45 : reg42)))));
  assign wire85 = $signed({$signed($signed((|wire76))), reg64[(3'h4):(3'h4)]});
  assign wire86 = {(8'hbe), (~|reg48)};
  module87 #() modinst111 (wire110, clk, wire34, reg57, reg71, reg69);
endmodule

module module5
#(parameter param22 = (8'h9c))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire12,
                 wire11,
                 wire10,
                 reg13,
                 (1'h0)};
  assign wire10 = (&((wire6 - wire6[(2'h2):(2'h2)]) ?
                      (&{(wire7 ?
                              wire7 : (8'ha2))}) : ($unsigned(wire6) >>> ((-(8'h9f)) <= $signed(wire7)))));
  assign wire11 = (8'hb1);
  assign wire12 = $unsigned($signed(wire6[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg13 <= ($signed($unsigned(wire11)) & ((|wire7[(4'hd):(1'h1)]) ?
          $unsigned($signed((wire7 ? wire7 : wire6))) : (~|$unsigned({wire9,
              wire11}))));
    end
  assign wire14 = $unsigned(({((wire8 > wire7) << $unsigned(wire9))} != wire10));
  assign wire15 = $signed(($signed(wire7[(4'h8):(3'h7)]) | {$signed((wire8 >> wire14)),
                      $signed((wire10 ? wire11 : wire8))}));
  assign wire16 = $signed((wire7 == wire10));
  assign wire17 = wire8[(4'hd):(4'h9)];
  assign wire18 = (wire7 + wire8);
  assign wire19 = (wire9[(2'h2):(1'h1)] + ($unsigned(wire6[(3'h5):(2'h2)]) ?
                      (~{((8'hbf) && (8'ha0))}) : {$signed((!wire8)),
                          reg13[(1'h0):(1'h0)]}));
  assign wire20 = (((~wire10[(4'hf):(4'hd)]) ? (^{wire11}) : (8'ha6)) ?
                      $signed((((8'h9c) ?
                          (reg13 - (7'h43)) : $signed(wire12)) >> $unsigned($unsigned(wire19)))) : ((wire7 ?
                          $signed($unsigned(wire17)) : wire16) - (&wire17)));
  assign wire21 = wire12[(3'h6):(3'h4)];
endmodule

module module87
#(parameter param108 = (({(~^((8'hbf) ? (8'hba) : (8'hb3))), (^{(8'h9c), (8'ha7)})} - ((((8'h9d) ? (8'ha8) : (8'h9d)) ? {(8'hb5), (8'hb0)} : (|(8'ha5))) != (((8'had) ? (8'haf) : (8'hbc)) ? ((8'hb3) ? (8'haf) : (8'h9c)) : {(8'hb5), (8'hac)}))) << ({((|(8'ha6)) <= ((8'hba) <<< (8'ha5))), (((8'hba) ? (7'h44) : (8'ha7)) >>> (~(8'ha8)))} ? (~(((8'hb7) ? (8'hb6) : (8'ha6)) + {(8'hbf)})) : (((|(8'hb0)) ? ((8'hb5) ? (8'ha6) : (8'hab)) : (~^(8'ha3))) ? ({(8'hb2), (8'haa)} <= ((8'ha1) << (8'hbc))) : {{(8'hae), (8'ha7)}}))), 
parameter param109 = (~^((8'hb5) ~^ (param108 >> ((param108 >= param108) * (^param108))))))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire91;
  input wire [(4'ha):(1'h0)] wire90;
  input wire signed [(4'ha):(1'h0)] wire89;
  input wire [(4'h8):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire103;
  wire signed [(4'he):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
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
                 (1'h0)};
  assign wire92 = $signed((^~$signed(wire91[(3'h4):(3'h4)])));
  assign wire93 = ((&wire89) ?
                      wire90 : (wire90 ?
                          ($signed($unsigned(wire88)) ?
                              $signed(((8'hb9) ? wire88 : wire92)) : ((wire91 ?
                                  wire90 : wire91) <<< (wire89 || wire91))) : ((wire92[(2'h3):(1'h0)] ?
                                  (wire91 ^ wire92) : $unsigned(wire88)) ?
                              wire91 : $signed($signed(wire90)))));
  assign wire94 = $unsigned($signed((wire88 ? wire89 : (+(+wire89)))));
  assign wire95 = ($signed(wire92[(4'hb):(4'hb)]) << wire90[(2'h2):(1'h0)]);
  assign wire96 = $unsigned(wire89[(2'h2):(2'h2)]);
  assign wire97 = wire91;
  assign wire98 = $signed(wire95);
  assign wire99 = ((((wire95[(4'ha):(1'h0)] ? (~|wire92) : $signed(wire96)) ?
                              (~wire96[(4'ha):(4'h8)]) : wire96[(4'hb):(4'h8)]) ?
                          $unsigned($unsigned((!wire98))) : $unsigned(wire96)) ?
                      $signed($unsigned((&wire95))) : $signed($signed((8'ha5))));
  assign wire100 = $signed((~(8'h9e)));
  assign wire101 = wire99[(2'h2):(2'h2)];
  assign wire102 = $unsigned($unsigned(wire92[(4'ha):(3'h5)]));
  assign wire103 = (-((wire98 ~^ wire94) ?
                       (wire101 ?
                           $unsigned(wire100) : wire92[(1'h0):(1'h0)]) : (~&(wire91[(2'h2):(2'h2)] ?
                           $signed(wire101) : (wire102 - (8'hb4))))));
  assign wire104 = wire93[(3'h4):(3'h4)];
  assign wire105 = (wire91 ?
                       $signed($signed((wire95 ?
                           wire90[(3'h4):(3'h4)] : (wire99 ?
                               wire99 : wire91)))) : ((({wire94,
                                   wire104} >>> $unsigned((8'ha5))) ?
                               ((^~wire102) ?
                                   $signed((8'hb7)) : {wire91,
                                       wire95}) : ($unsigned(wire92) ^~ $signed(wire101))) ?
                           wire98[(4'hb):(1'h1)] : wire93[(3'h6):(2'h3)]));
  assign wire106 = wire88[(4'h8):(3'h6)];
  assign wire107 = wire92[(4'hc):(2'h2)];
endmodule
