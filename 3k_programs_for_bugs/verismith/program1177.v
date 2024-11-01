module top
#(parameter param174 = (|((((~|(8'haa)) ? ((8'hbb) ? (7'h41) : (8'hb7)) : ((8'h9d) ? (8'hae) : (8'h9e))) | (((8'h9c) > (8'hb3)) ? ((8'ha5) ^ (8'ha2)) : ((8'hbb) ? (8'ha7) : (8'hb0)))) ? (|(^~((8'hb9) ? (8'hac) : (8'hb8)))) : ((&((8'ha6) ^~ (7'h40))) ? (((7'h42) ? (8'ha7) : (8'hbe)) ? ((7'h42) | (8'ha1)) : (+(8'h9c))) : ({(8'ha6), (8'hae)} ? {(8'ha0), (8'had)} : (~|(8'ha4)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire173;
  wire signed [(5'h13):(1'h0)] wire172;
  wire [(4'ha):(1'h0)] wire171;
  wire signed [(4'ha):(1'h0)] wire170;
  wire signed [(4'hd):(1'h0)] wire169;
  wire [(5'h14):(1'h0)] wire168;
  wire [(4'hb):(1'h0)] wire167;
  wire signed [(3'h5):(1'h0)] wire163;
  wire signed [(4'hb):(1'h0)] wire160;
  wire [(5'h15):(1'h0)] wire159;
  wire [(4'hb):(1'h0)] wire158;
  wire signed [(4'hc):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire22;
  reg [(4'h9):(1'h0)] reg166 = (1'h0);
  reg [(2'h3):(1'h0)] reg165 = (1'h0);
  reg [(4'hf):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg162 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire163,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire155,
                 wire26,
                 wire25,
                 wire24,
                 wire22,
                 reg166,
                 reg165,
                 reg164,
                 reg162,
                 (1'h0)};
  module5 #() modinst23 (.wire7(wire1), .wire6(wire3), .wire9(wire4), .clk(clk), .wire10(wire2), .wire8(wire0), .y(wire22));
  assign wire24 = wire3;
  assign wire25 = (($signed($unsigned((wire4 ?
                      wire24 : wire2))) >> $signed($signed(wire1))) <<< wire22[(1'h0):(1'h0)]);
  assign wire26 = {$unsigned({wire3[(4'hd):(4'h9)]})};
  module27 #() modinst156 (wire155, clk, wire2, wire0, wire4, wire25);
  assign wire157 = ($unsigned($signed((!$unsigned(wire155)))) ?
                       ($unsigned($signed($signed((8'hbe)))) ~^ ($signed(wire24) ?
                           (~(~wire22)) : (wire22[(2'h2):(1'h1)] ?
                               ((7'h43) ?
                                   wire0 : wire22) : $unsigned(wire0)))) : wire3[(4'h9):(3'h5)]);
  assign wire158 = wire1[(3'h5):(1'h1)];
  assign wire159 = $signed(((((wire157 != wire22) ?
                       wire155[(4'h8):(1'h0)] : {wire1,
                           wire1}) - wire157[(2'h2):(2'h2)]) ~^ wire22));
  module125 #() modinst161 (.wire127(wire22), .y(wire160), .wire128(wire0), .wire126(wire24), .clk(clk), .wire129(wire157));
  always
    @(posedge clk) begin
      reg162 <= $signed({(|(wire158[(3'h4):(3'h4)] ?
              $signed(wire25) : $unsigned(wire22)))});
    end
  assign wire163 = wire2[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg164 <= {wire4[(3'h4):(2'h3)], $unsigned((7'h40))};
      reg165 <= wire22[(2'h3):(1'h0)];
      reg166 <= $unsigned((~|(reg164 ? wire159[(2'h2):(2'h2)] : (+wire4))));
    end
  assign wire167 = $unsigned(({((wire157 ? wire160 : wire22) ?
                               wire163[(3'h5):(3'h4)] : (8'haf)),
                           $signed(wire155)} ?
                       (8'hbb) : $signed(reg162[(5'h10):(3'h4)])));
  assign wire168 = wire3;
  assign wire169 = (+((((~|wire22) + (wire157 ? wire155 : (7'h44))) ?
                           wire157[(3'h6):(3'h5)] : wire24) ?
                       (~wire26[(4'hd):(3'h6)]) : ((((8'ha2) ?
                                   reg162 : wire22) ?
                               {reg162, wire22} : ((8'hb7) ? wire158 : wire0)) ?
                           {((8'hb3) > (8'h9f))} : wire160[(3'h6):(3'h6)])));
  assign wire170 = (8'hb5);
  assign wire171 = $signed($unsigned(wire0));
  assign wire172 = $signed(wire169);
  assign wire173 = $unsigned($unsigned(((wire171 == wire26[(4'he):(4'h9)]) - (wire24 >>> wire4))));
endmodule

module module27
#(parameter param154 = ((!(^(7'h40))) <<< (|(^(-((8'hb4) ? (8'h9c) : (7'h40)))))))
(y, clk, wire28, wire29, wire30, wire31);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire29;
  input wire [(5'h10):(1'h0)] wire30;
  input wire [(5'h10):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire118;
  wire signed [(2'h2):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire152;
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  assign y = {wire116,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire84,
                 wire118,
                 wire124,
                 wire152,
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
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 (1'h0)};
  assign wire32 = $signed({wire30, (8'ha5)});
  assign wire33 = wire28[(2'h3):(1'h0)];
  assign wire34 = (wire30 ? wire33[(3'h7):(3'h4)] : wire28);
  assign wire35 = (($signed($unsigned((~wire31))) ?
                          $signed($unsigned({wire34,
                              (8'hab)})) : wire28[(2'h2):(1'h1)]) ?
                      $unsigned(wire28) : wire29[(2'h3):(1'h1)]);
  assign wire36 = (wire34[(2'h3):(1'h1)] ?
                      $signed((8'hac)) : $unsigned($signed(((wire31 || wire29) ?
                          wire34[(3'h6):(2'h3)] : (~|wire32)))));
  assign wire37 = wire34[(3'h7):(1'h1)];
  assign wire38 = (|wire34);
  assign wire39 = ($signed($unsigned($signed($unsigned(wire29)))) == (^wire29));
  assign wire40 = ($signed($signed($unsigned({wire29}))) ?
                      wire32 : (wire35 ? wire29 : {wire37}));
  assign wire41 = wire28[(2'h3):(2'h3)];
  assign wire42 = ((^~(((|wire40) ?
                          {(7'h44)} : (8'hb9)) >>> (wire31[(3'h4):(1'h1)] + wire36))) ?
                      {wire29[(3'h4):(3'h4)]} : $unsigned((8'h9f)));
  assign wire43 = (({$signed((+wire32))} ^ {wire36}) ?
                      $unsigned(($signed((~wire34)) >>> $signed(wire34[(4'ha):(2'h3)]))) : $signed(((!(wire31 ^~ (7'h40))) ?
                          (((7'h41) ?
                              wire40 : wire28) || $signed(wire36)) : ($signed(wire38) <= (wire34 ?
                              (8'hb7) : wire31)))));
  assign wire44 = wire34[(4'hb):(3'h7)];
  always
    @(posedge clk) begin
      reg45 <= (8'ha0);
      if ((8'ha3))
        begin
          reg46 <= (($signed(((wire39 ? (8'hbf) : wire42) ?
              $signed(wire34) : (wire33 ?
                  wire39 : wire31))) ~^ wire35) - ((&(reg45 != (^~wire33))) & (~wire40[(3'h4):(1'h0)])));
          reg47 <= wire35;
          reg48 <= (-(((8'hba) ?
              ((reg47 ? wire42 : (8'haf)) ?
                  wire40 : reg46[(3'h4):(2'h3)]) : wire28) <= reg46));
          reg49 <= wire34;
        end
      else
        begin
          reg46 <= (^~wire40[(3'h4):(3'h4)]);
          if (reg47[(2'h3):(1'h1)])
            begin
              reg47 <= ({($signed((wire37 ? (8'ha7) : wire31)) ?
                          (~reg46[(4'hb):(3'h4)]) : ($signed(wire34) ^ (wire31 + reg48))),
                      $signed(wire41[(3'h6):(3'h4)])} ?
                  wire39 : ({(wire34 ? wire44 : reg46[(4'he):(1'h1)]),
                          wire42[(1'h1):(1'h1)]} ?
                      $unsigned($unsigned(wire42[(2'h2):(1'h1)])) : (wire42 && ((wire36 >> reg48) ?
                          $unsigned(wire38) : (+wire37)))));
              reg48 <= reg46;
            end
          else
            begin
              reg47 <= wire33[(4'hb):(3'h7)];
            end
        end
      reg50 <= (((((wire35 != wire36) ? wire29 : ((8'ha9) ? (8'hbe) : wire33)) ?
                  (~|{wire34}) : wire32) ?
              $unsigned({$unsigned(wire32),
                  {wire29}}) : $signed($unsigned(wire30[(3'h7):(3'h7)]))) ?
          $signed($unsigned(((wire29 ? wire41 : reg49) ?
              (reg49 < (8'hbe)) : (|wire35)))) : (-(+$unsigned((wire35 ?
              (8'hac) : wire30)))));
      reg51 <= $signed(reg45);
      if ({wire31[(4'hf):(3'h7)], wire35[(3'h6):(1'h0)]})
        begin
          reg52 <= $unsigned($signed($unsigned({(wire34 || wire44)})));
          reg53 <= {(((wire31[(4'hc):(4'hc)] ^ (wire38 == reg51)) ?
                  $unsigned($unsigned(wire30)) : ((~|wire41) ?
                      (reg45 ?
                          wire30 : reg46) : $unsigned(wire38))) != (wire44[(1'h0):(1'h0)] ?
                  wire40 : wire28)),
              wire37[(3'h5):(1'h0)]};
        end
      else
        begin
          reg52 <= (reg49[(3'h6):(3'h4)] >= wire44);
          reg53 <= (+{$signed((wire33 ? (reg47 && wire35) : reg47)),
              $signed(reg47)});
          reg54 <= $unsigned(((~|wire39) ?
              wire44[(2'h3):(1'h0)] : $signed(((reg48 ? reg48 : wire29) ?
                  (8'ha3) : $unsigned(wire29)))));
        end
    end
  module55 #() modinst85 (wire84, clk, wire37, reg51, wire40, wire31, reg52);
  module86 #() modinst117 (wire116, clk, reg54, reg52, wire33, wire32, wire28);
  assign wire118 = reg50;
  always
    @(posedge clk) begin
      reg119 <= (|(|(|($signed(reg53) ? (^wire35) : (8'hba)))));
      reg120 <= {(^~$unsigned($signed($unsigned((8'haf))))),
          $unsigned((((reg45 ? wire31 : wire42) ~^ (8'hb2)) ? wire42 : reg52))};
      if ($signed(reg45))
        begin
          reg121 <= (~|wire37);
          reg122 <= wire29;
          reg123 <= wire43;
        end
      else
        begin
          reg121 <= ((&$signed(({wire29, reg122} ? (!wire28) : reg120))) ?
              (~|wire44) : {($signed((reg121 ? wire37 : wire116)) ?
                      (!((8'hb3) & reg51)) : reg51[(1'h0):(1'h0)])});
          reg122 <= reg53[(3'h6):(3'h4)];
        end
    end
  assign wire124 = (wire33 >= {($signed((reg49 >> reg52)) >= (~$signed(wire39))),
                       (!wire29)});
  module125 #() modinst153 (wire152, clk, reg51, wire44, wire31, wire29);
endmodule

module module5
#(parameter param21 = {(~&((((8'ha9) ? (8'hb6) : (8'h9e)) * ((7'h43) ^ (8'hbb))) * (((8'hb1) ? (8'ha2) : (8'hb3)) ? (&(8'hb6)) : ((8'hb1) <= (8'h9f)))))})
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg17,
                 (1'h0)};
  assign wire11 = {$unsigned(wire8)};
  assign wire12 = ((((wire10[(1'h1):(1'h1)] != wire10[(1'h0):(1'h0)]) ?
                              $signed($unsigned(wire8)) : (wire6 ?
                                  $signed(wire10) : (~wire11))) ?
                          $signed(($unsigned(wire10) ?
                              (7'h40) : wire6[(3'h6):(3'h6)])) : $signed(wire7[(4'he):(2'h3)])) ?
                      (7'h43) : wire6[(3'h7):(3'h5)]);
  assign wire13 = wire7;
  assign wire14 = wire13;
  assign wire15 = $unsigned((wire9[(3'h6):(2'h2)] < $signed((wire11[(3'h4):(1'h1)] ?
                      {wire13, (8'ha6)} : (wire12 | wire9)))));
  assign wire16 = wire13[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg17 <= $unsigned($unsigned({wire15,
          $unsigned((wire13 ? wire15 : wire6))}));
    end
  assign wire18 = wire12;
  assign wire19 = $signed($unsigned(wire16[(2'h2):(2'h2)]));
  assign wire20 = $signed((+(wire14[(3'h6):(3'h4)] ?
                      wire8[(1'h0):(1'h0)] : $unsigned($unsigned(wire8)))));
endmodule

module module125  (y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire129;
  input wire [(4'ha):(1'h0)] wire128;
  input wire signed [(2'h3):(1'h0)] wire127;
  input wire [(5'h15):(1'h0)] wire126;
  wire signed [(5'h15):(1'h0)] wire151;
  wire [(5'h15):(1'h0)] wire150;
  wire signed [(4'hf):(1'h0)] wire149;
  wire [(2'h2):(1'h0)] wire145;
  wire signed [(5'h12):(1'h0)] wire144;
  wire signed [(5'h10):(1'h0)] wire143;
  wire signed [(4'hb):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  wire [(5'h15):(1'h0)] wire140;
  wire signed [(4'hf):(1'h0)] wire130;
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg137 = (1'h0);
  reg [(3'h7):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire130,
                 reg148,
                 reg147,
                 reg146,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire130 = wire128;
  always
    @(posedge clk) begin
      if ($signed((wire126 || wire128[(1'h1):(1'h1)])))
        begin
          reg131 <= wire128[(1'h0):(1'h0)];
          if (((($unsigned((~|wire129)) ?
                  {$signed(wire127)} : wire128[(2'h2):(1'h1)]) && (~^$signed((wire127 || wire128)))) ?
              (((+(wire126 != (8'ha6))) != (&$signed(reg131))) ~^ reg131[(3'h5):(1'h1)]) : ((8'haa) <= $signed(($unsigned((8'hb4)) ?
                  $unsigned(reg131) : ((8'ha0) ? (8'hbc) : wire127))))))
            begin
              reg132 <= (wire130[(1'h1):(1'h0)] ?
                  (((&(~|reg131)) ?
                      $signed(wire126) : {(wire130 | (8'ha1)),
                          (wire127 && wire130)}) >= $unsigned($signed({wire129,
                      (8'hbf)}))) : {$unsigned(((wire130 >>> wire129) <= (wire130 < wire127)))});
              reg133 <= (8'hbf);
              reg134 <= $unsigned(reg133);
            end
          else
            begin
              reg132 <= $unsigned((((8'ha2) >= ($signed(reg132) ?
                  (reg134 ? reg131 : reg132) : (reg134 ?
                      reg134 : wire126))) && $unsigned(({(8'had),
                  wire129} + wire127))));
              reg133 <= (!$unsigned($signed((+(^~reg134)))));
              reg134 <= $signed((|(+$unsigned(wire130))));
              reg135 <= $unsigned((reg133[(4'he):(4'hb)] ?
                  ({$signed(wire127), ((8'hb8) >>> wire127)} ?
                      ($signed(wire129) - {reg132}) : (((8'hb9) ?
                          reg131 : reg133) ^ wire130[(4'he):(3'h4)])) : (^$signed(wire127[(1'h0):(1'h0)]))));
              reg136 <= $signed(reg134);
            end
        end
      else
        begin
          reg131 <= $signed(wire127);
          reg132 <= wire129[(1'h1):(1'h0)];
          reg133 <= ((^({((8'hb2) <<< (8'hb9)),
                  $signed(reg135)} < (~^(^~reg136)))) ?
              {(((reg133 ? reg136 : reg134) ? (!reg134) : reg136) ?
                      $signed($signed((8'hb0))) : ({wire128,
                          (8'hac)} + wire127[(1'h0):(1'h0)]))} : reg132[(3'h6):(2'h3)]);
        end
      reg137 <= {wire126[(3'h6):(3'h5)], reg132[(4'h9):(2'h2)]};
      reg138 <= ((((&(reg134 ?
          (8'ha5) : wire128)) + {reg133}) > (+reg137)) <<< (wire128 ?
          (^(|(^wire126))) : reg137[(1'h1):(1'h1)]));
      reg139 <= {((((reg133 != (8'ha3)) ?
                      $signed((8'hb9)) : ((8'hba) & reg138)) ?
                  ((reg131 + (8'hb0)) ~^ reg133) : ((8'hb4) <<< (~^wire128))) ?
              $unsigned(($unsigned(wire126) ~^ $signed(reg132))) : $signed(reg131[(4'h9):(3'h4)])),
          $unsigned((&(7'h42)))};
    end
  assign wire140 = (~^$unsigned((((reg136 ?
                       (8'hae) : reg133) ~^ $unsigned(wire129)) >>> $signed((^~(8'hbc))))));
  assign wire141 = {(~|wire127)};
  assign wire142 = (&wire128[(2'h2):(1'h0)]);
  assign wire143 = wire141[(1'h0):(1'h0)];
  assign wire144 = (!(~|$signed({reg132[(4'hf):(4'hc)]})));
  assign wire145 = reg136[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg146 <= $unsigned((8'hac));
      reg147 <= ($unsigned((7'h43)) >= (reg139 || {reg146}));
      reg148 <= {(&reg135)};
    end
  assign wire149 = (-(wire141[(1'h1):(1'h1)] ?
                       reg134[(3'h4):(3'h4)] : reg134[(3'h4):(1'h0)]));
  assign wire150 = $unsigned($signed($signed(wire143)));
  assign wire151 = reg148[(4'hb):(3'h5)];
endmodule

module module86
#(parameter param114 = (^~(((((8'hb8) ? (8'haa) : (8'ha0)) == (^~(8'haa))) ? (((8'h9c) ? (8'hb5) : (8'hb2)) ? {(8'ha3)} : (~^(8'h9c))) : (((8'ha6) << (8'hba)) ? {(7'h44), (8'hbb)} : ((8'hb4) || (8'hbf)))) ? ((((8'hb6) <= (8'hb8)) < (8'ha6)) && ({(8'hb8), (8'hb5)} < (~(8'ha6)))) : (!(((8'ha3) << (8'hb5)) * ((8'hbf) == (8'ha0)))))), 
parameter param115 = param114)
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire91;
  input wire signed [(5'h10):(1'h0)] wire90;
  input wire [(5'h11):(1'h0)] wire89;
  input wire [(4'ha):(1'h0)] wire88;
  input wire signed [(4'hc):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire113;
  wire signed [(4'hb):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire [(4'he):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire104;
  wire signed [(3'h6):(1'h0)] wire103;
  wire [(2'h2):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire92;
  reg signed [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire92,
                 reg110,
                 reg109,
                 reg108,
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
  assign wire92 = (wire90[(3'h4):(2'h3)] ?
                      $signed((~|($signed(wire88) ?
                          $unsigned(wire89) : $unsigned(wire88)))) : wire89);
  always
    @(posedge clk) begin
      if ($signed(wire92))
        begin
          if (((^~wire92[(1'h0):(1'h0)]) ?
              $signed((wire88 ?
                  (&(&wire88)) : $unsigned($unsigned((8'ha9))))) : ((~|{(+wire91),
                      {wire88}}) ?
                  ({(wire91 ? wire91 : wire92),
                      (~^wire88)} >>> wire88) : $signed(wire92))))
            begin
              reg93 <= ((^wire88) ~^ $signed(wire88[(3'h4):(2'h2)]));
            end
          else
            begin
              reg93 <= wire88[(3'h6):(3'h6)];
              reg94 <= (~|{($signed($unsigned(wire91)) || wire92)});
              reg95 <= {wire87};
              reg96 <= ($unsigned(wire87) ~^ ($signed(wire90) | (((~reg94) & (wire92 == wire90)) >= reg95[(3'h6):(3'h6)])));
              reg97 <= (reg94[(1'h0):(1'h0)] ?
                  wire88 : (($signed((~^reg93)) < wire91) <<< {$unsigned(((8'hb8) ^ wire89)),
                      (~|reg96)}));
            end
          reg98 <= (($signed(((^reg97) + $signed(wire89))) ?
                  $unsigned(reg95) : ($unsigned(reg93) ?
                      wire92 : wire87[(4'h9):(4'h9)])) ?
              wire87 : (8'had));
          reg99 <= reg93[(1'h1):(1'h1)];
          reg100 <= wire92[(2'h3):(1'h1)];
          reg101 <= (8'ha5);
        end
      else
        begin
          reg93 <= reg100;
          reg94 <= ($unsigned($signed((~|(!reg96)))) >> wire89);
        end
    end
  assign wire102 = reg96[(2'h2):(2'h2)];
  assign wire103 = wire92;
  assign wire104 = (wire92[(4'h8):(1'h1)] ? wire92 : wire90);
  assign wire105 = $unsigned((wire90[(4'hd):(2'h3)] ?
                       wire102 : {$unsigned((~|wire102)),
                           wire92[(3'h4):(2'h2)]}));
  assign wire106 = (reg96 ^~ (~&(8'haf)));
  assign wire107 = (&$unsigned((^(~|wire87))));
  always
    @(posedge clk) begin
      reg108 <= ($signed({{(-reg95)},
          wire102[(1'h0):(1'h0)]}) - $signed(reg97[(1'h0):(1'h0)]));
      reg109 <= $unsigned((~|$signed(((reg99 ? wire89 : wire104) ^ wire107))));
      reg110 <= (8'ha1);
    end
  assign wire111 = wire88;
  assign wire112 = ({reg100[(4'h8):(3'h6)], wire87[(1'h0):(1'h0)]} ?
                       $signed((+wire91[(3'h4):(1'h0)])) : ((wire105 ?
                           ((!reg95) ?
                               (reg110 & wire87) : ((7'h40) ?
                                   reg95 : reg101)) : (reg98 * (8'h9c))) <= (|$signed(reg100))));
  assign wire113 = {reg95[(3'h7):(2'h3)]};
endmodule

module module55
#(parameter param83 = ({{(((8'hb5) && (8'ha7)) - ((7'h41) > (8'hb3))), (((8'hae) || (8'haf)) ? ((8'hac) ? (8'hb4) : (8'hb0)) : (^~(8'hab)))}, (8'hae)} == (~|((~&{(8'hac), (8'hb8)}) < (((8'hb9) ? (8'ha4) : (8'hae)) - (!(8'hbc)))))))
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire60;
  input wire [(4'hb):(1'h0)] wire59;
  input wire [(4'ha):(1'h0)] wire58;
  input wire signed [(4'hc):(1'h0)] wire57;
  input wire signed [(3'h7):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire signed [(2'h2):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire61;
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire71,
                 wire70,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg74,
                 reg73,
                 reg72,
                 reg69,
                 (1'h0)};
  assign wire61 = $unsigned($unsigned(wire58));
  assign wire62 = ((~$signed(($unsigned(wire57) & $signed((8'hae))))) ?
                      $signed(((wire59 ^~ $unsigned(wire61)) ?
                          $unsigned((~&(8'hac))) : ($signed(wire57) & ((7'h44) ~^ (8'ha0))))) : $signed((wire58[(2'h3):(1'h0)] ?
                          wire57[(2'h2):(1'h0)] : ((wire61 ?
                              wire60 : wire56) * wire56))));
  assign wire63 = (($signed($signed(((8'ha4) && wire56))) ?
                          ($unsigned(wire57[(3'h5):(2'h3)]) ?
                              ({wire57} >= (wire58 && wire58)) : wire59[(3'h7):(1'h1)]) : wire62[(3'h4):(1'h1)]) ?
                      (~($unsigned((wire62 ? (8'h9d) : wire59)) ?
                          $unsigned(((8'h9f) > wire61)) : $signed((8'hac)))) : wire60[(3'h7):(3'h6)]);
  assign wire64 = (&$unsigned(wire58[(3'h4):(2'h2)]));
  assign wire65 = ((~&(wire56 && {$signed(wire57), $unsigned(wire60)})) ?
                      $unsigned(($signed(wire64) ?
                          {wire61[(1'h0):(1'h0)]} : ((wire57 <= (8'hb5)) ?
                              wire56[(1'h0):(1'h0)] : (wire64 ?
                                  wire60 : wire56)))) : ({$signed(((8'hbe) <= wire58))} ?
                          (wire61 ?
                              (~|wire63) : $signed((wire58 ?
                                  wire58 : wire62))) : wire58[(1'h0):(1'h0)]));
  assign wire66 = ((($unsigned($unsigned(wire60)) < ((!wire61) > (wire63 - wire57))) && ((((8'h9c) | wire58) ?
                      ((8'h9e) ?
                          wire58 : (8'haa)) : wire60[(2'h2):(2'h2)]) ^ (wire60[(1'h0):(1'h0)] ?
                      (wire57 > wire65) : wire63[(2'h2):(1'h1)]))) >>> ((wire56[(3'h5):(2'h2)] ~^ $unsigned($signed(wire61))) >>> wire56[(3'h5):(1'h0)]));
  assign wire67 = $unsigned($unsigned(wire56[(2'h2):(2'h2)]));
  assign wire68 = $unsigned({wire61[(5'h10):(4'ha)], wire65[(3'h4):(1'h0)]});
  always
    @(posedge clk) begin
      reg69 <= ((~^{$signed(wire63[(3'h6):(3'h4)]),
          ((!(7'h42)) ? (wire64 - wire64) : wire64)}) >>> (((~|(wire67 ?
              wire57 : wire58)) < wire60[(1'h0):(1'h0)]) ?
          wire63 : $signed((wire57 ? $unsigned(wire62) : $unsigned(wire67)))));
    end
  assign wire70 = (~&{(~|{$unsigned(wire62), {wire68}}), wire61});
  assign wire71 = (8'hbf);
  always
    @(posedge clk) begin
      reg72 <= wire60;
      reg73 <= ($signed((+((~reg69) ?
          (^(8'had)) : (wire57 ? wire58 : wire67)))) >> wire60);
      reg74 <= $unsigned(((wire62[(2'h3):(2'h2)] ?
              {$unsigned(wire60), $signed(reg73)} : (wire59[(3'h6):(2'h2)] ?
                  $unsigned(wire65) : wire71[(1'h0):(1'h0)])) ?
          (8'hb6) : $signed((~^$signed(reg69)))));
    end
  assign wire75 = wire66[(3'h4):(1'h0)];
  assign wire76 = ($signed(wire63) ?
                      {wire58[(3'h5):(3'h4)], (|$unsigned(wire62))} : reg72);
  assign wire77 = (((~^wire70) ?
                      (((wire71 - wire62) ?
                              wire66[(4'h8):(1'h1)] : (wire64 ?
                                  wire75 : reg69)) ?
                          ($unsigned(reg73) >= (wire63 ?
                              reg73 : wire57)) : ({wire68} + (&wire60))) : $signed($signed($unsigned(reg69)))) ~^ reg73);
  assign wire78 = {reg74[(3'h5):(3'h5)],
                      ($unsigned((~&wire75[(1'h1):(1'h0)])) <<< (^$signed((7'h44))))};
  assign wire79 = {(~(((-reg69) ?
                          reg72 : wire57[(4'ha):(3'h5)]) <= ($signed((8'hb9)) ?
                          {wire77, wire58} : {wire64})))};
  assign wire80 = (^((~reg72) ~^ wire76));
  assign wire81 = (~wire56);
  assign wire82 = wire81;
endmodule
