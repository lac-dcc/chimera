module top
#(parameter param96 = (((((&(8'hb3)) ? {(7'h42)} : {(8'h9e)}) <= ({(8'haa), (8'had)} ? ((8'ha0) ? (8'hbe) : (8'ha9)) : {(8'hb9), (8'h9d)})) ? ((8'ha8) >> ({(8'hbd)} ? (8'ha3) : (|(8'hbd)))) : ((((8'ha4) ? (8'ha8) : (8'ha1)) ? ((7'h41) >> (8'hb4)) : ((8'hbd) << (7'h40))) ? {((8'hb7) ? (8'hb8) : (8'ha4)), (8'h9c)} : (((7'h44) * (8'ha6)) ? (8'hab) : (+(7'h40))))) >>> (+{((!(8'ha4)) ? ((8'hbe) ^ (8'hbe)) : ((8'ha1) && (8'ha4)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire95;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire93;
  assign y = {wire95,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire93,
                 (1'h0)};
  assign wire5 = ((wire3[(3'h4):(1'h1)] ^~ wire1[(1'h0):(1'h0)]) ?
                     {{{{wire2, wire4}, $signed(wire0)}, $unsigned((~&wire2))},
                         (wire4[(3'h5):(1'h0)] ?
                             $signed($unsigned(wire1)) : {(^~wire0)})} : ({$unsigned(wire4[(4'h9):(1'h0)]),
                         (^$unsigned((8'ha2)))} ~^ $signed(wire3[(2'h2):(1'h1)])));
  assign wire6 = wire2;
  assign wire7 = (wire6 <= $signed($unsigned(wire5)));
  assign wire8 = ((($signed({wire2, wire2}) ?
                     $signed(wire0) : wire3[(4'he):(3'h7)]) <= $unsigned($unsigned($unsigned(wire4)))) ^~ (8'ha8));
  assign wire9 = wire8[(4'he):(3'h4)];
  assign wire10 = $unsigned($unsigned(wire0));
  assign wire11 = $unsigned(wire5);
  module12 #() modinst94 (wire93, clk, wire1, wire11, wire4, wire6, wire7);
  assign wire95 = wire6[(3'h7):(1'h1)];
endmodule

module module12
#(parameter param92 = (!(~((((8'haa) >= (8'ha5)) ? ((8'had) ? (8'hbe) : (8'hb0)) : (~(8'h9d))) ? (((8'hbf) ? (8'ha8) : (8'hbf)) ? {(7'h40)} : {(8'ha3), (8'hbd)}) : {((8'h9f) >= (8'hb1))}))))
(y, clk, wire13, wire14, wire15, wire16, wire17);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire14;
  input wire signed [(5'h12):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire85;
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  assign y = {wire91,
                 wire87,
                 wire18,
                 wire19,
                 wire20,
                 wire85,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire18 = (|((((wire14 ? wire16 : wire16) <= wire13) ?
                          $signed((wire16 ?
                              wire13 : wire16)) : ((wire15 >= wire17) * (~|wire13))) ?
                      $unsigned($signed((8'hb1))) : ({$signed(wire17),
                              (wire16 >= wire15)} ?
                          wire13 : (+$unsigned(wire13)))));
  assign wire19 = (8'h9c);
  assign wire20 = $unsigned(wire19[(4'h8):(3'h4)]);
  module21 #() modinst86 (.y(wire85), .wire25(wire18), .clk(clk), .wire26(wire19), .wire23(wire16), .wire22(wire20), .wire24(wire15));
  assign wire87 = $signed(wire18);
  always
    @(posedge clk) begin
      reg88 <= ((8'ha8) ? wire85 : wire15);
      reg89 <= (8'hb6);
      reg90 <= {$signed({wire13[(1'h1):(1'h1)]})};
    end
  assign wire91 = (~&wire15[(3'h5):(3'h4)]);
endmodule

module module21
#(parameter param84 = (~&(((((7'h40) - (8'ha3)) + {(8'hbd), (8'ha5)}) ? {(~|(7'h42))} : (((8'hb9) >>> (8'hbc)) & (~&(8'ha5)))) ? {(((8'hb5) <= (8'hbc)) + (|(8'ha2)))} : (((7'h42) ^~ ((8'hb1) ? (8'ha0) : (8'hbf))) ^ {(^(8'hb1)), ((8'hbd) > (8'hbc))}))))
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h291):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire26;
  input wire [(2'h2):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire [(3'h4):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire81;
  wire signed [(4'hd):(1'h0)] wire80;
  wire signed [(4'hc):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire29,
                 wire28,
                 wire27,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire27 = (wire23 ? (~^wire23[(4'hc):(4'hb)]) : wire25);
  assign wire28 = wire26[(3'h4):(1'h1)];
  assign wire29 = (($unsigned(((wire28 && wire23) <= $signed((8'hab)))) == {($signed(wire28) * ((8'hab) || (8'hb7)))}) == {(-$signed(wire24[(1'h0):(1'h0)]))});
  always
    @(posedge clk) begin
      reg30 <= ({wire22[(3'h4):(2'h2)]} & wire23[(4'hc):(3'h6)]);
      reg31 <= $signed(($unsigned($unsigned(wire26)) << $unsigned({$signed(wire24)})));
      reg32 <= wire27;
      reg33 <= (7'h43);
    end
  always
    @(posedge clk) begin
      reg34 <= $unsigned(reg30[(4'h8):(3'h6)]);
    end
  assign wire35 = wire24[(1'h0):(1'h0)];
  assign wire36 = ((&({wire29[(4'hc):(3'h5)]} ?
                      $unsigned(((8'ha1) ?
                          reg34 : wire24)) : wire26)) << $signed(wire24));
  assign wire37 = (+(^~(wire27 <= $unsigned(reg32))));
  assign wire38 = (^reg32);
  assign wire39 = ($signed(((^~{wire36}) + ((reg32 - wire26) ?
                          (^wire29) : wire22))) ?
                      reg30[(4'hf):(4'hc)] : ((((wire25 ?
                          wire35 : reg30) ^ (-wire23)) > (8'h9e)) - {$unsigned((wire23 + wire22)),
                          ((reg33 >= wire27) ?
                              $unsigned(reg32) : $unsigned(wire26))}));
  always
    @(posedge clk) begin
      if ($signed((reg31 >> ((wire28[(4'hb):(3'h6)] ?
              (~wire28) : wire39[(1'h1):(1'h1)]) ?
          ($unsigned(wire38) >= reg34) : wire24[(4'ha):(3'h7)]))))
        begin
          reg40 <= ($unsigned(wire26) != {$unsigned(wire26[(1'h0):(1'h0)]),
              wire22[(2'h3):(2'h2)]});
          reg41 <= {(-wire28[(4'he):(4'ha)])};
        end
      else
        begin
          reg40 <= {wire27,
              ({wire26[(1'h1):(1'h1)]} | (-((wire37 ? wire36 : reg32) ?
                  $signed(reg32) : wire26[(2'h3):(1'h1)])))};
          if (reg41[(1'h1):(1'h0)])
            begin
              reg41 <= $unsigned($signed(reg31[(3'h4):(2'h3)]));
              reg42 <= ($unsigned(({(wire26 ? wire26 : wire38), (~|wire23)} ?
                      ($signed(wire28) ?
                          $signed(wire22) : (wire25 ?
                              reg40 : wire25)) : $signed($unsigned(wire38)))) ?
                  wire38[(3'h6):(2'h3)] : ((8'hb1) ?
                      {wire29} : (~^(~^{(7'h42), reg34}))));
            end
          else
            begin
              reg41 <= (-($signed(wire39) >= reg32[(5'h11):(4'h8)]));
              reg42 <= ($unsigned((8'ha5)) < ($unsigned(reg30[(2'h3):(2'h2)]) ?
                  ($signed((&wire24)) ?
                      wire36 : $signed(wire22)) : $signed(wire24)));
              reg43 <= wire23;
              reg44 <= $unsigned((7'h41));
            end
          reg45 <= (reg43 ?
              $unsigned(($signed((wire28 ?
                  reg44 : wire24)) <<< $signed((reg31 & reg31)))) : ($unsigned($signed($signed(wire39))) ?
                  $unsigned(reg41[(1'h1):(1'h1)]) : $unsigned($unsigned(wire36[(3'h4):(1'h1)]))));
          reg46 <= reg31;
          reg47 <= wire22;
        end
      if (({wire22} >> (+wire39[(4'hc):(3'h6)])))
        begin
          if ($signed((~|reg31)))
            begin
              reg48 <= wire36;
              reg49 <= (wire28[(5'h12):(2'h2)] ?
                  wire26 : $unsigned(wire36[(1'h0):(1'h0)]));
              reg50 <= wire35;
            end
          else
            begin
              reg48 <= $signed(reg45[(3'h6):(3'h6)]);
              reg49 <= $unsigned({($signed($signed(wire35)) ?
                      $signed($signed(wire39)) : ($signed(wire28) >> ((8'hb6) <<< (8'hba))))});
            end
          if ((-((-(8'hb4)) ^~ $signed($signed(((8'hb6) >= reg42))))))
            begin
              reg51 <= (!((~^(~^(reg46 * wire39))) ?
                  (^~($unsigned(wire27) ?
                      $unsigned(wire22) : $unsigned(reg46))) : $signed($unsigned($unsigned((8'ha0))))));
              reg52 <= $unsigned(reg42);
              reg53 <= reg30[(4'ha):(3'h4)];
              reg54 <= $signed((|({wire25, reg48[(1'h1):(1'h0)]} << (&(reg41 ?
                  (8'h9c) : wire35)))));
            end
          else
            begin
              reg51 <= $signed((~(&wire38)));
              reg52 <= (+{reg42[(1'h1):(1'h1)]});
              reg53 <= (!(reg34[(5'h10):(3'h4)] ^ reg30));
              reg54 <= reg51;
              reg55 <= reg41[(2'h2):(1'h1)];
            end
          reg56 <= ((~&(^~(^~$unsigned(reg34)))) || (reg34 ?
              wire22 : (($unsigned((7'h41)) ?
                  {reg51} : {(8'ha0)}) >> (wire27[(4'hf):(4'hc)] ?
                  {reg47, (8'had)} : wire26))));
          if ((^$unsigned((reg47[(2'h2):(2'h2)] ?
              $signed($unsigned(reg51)) : (^~(reg34 * wire25))))))
            begin
              reg57 <= wire22[(2'h2):(2'h2)];
              reg58 <= (wire29 ?
                  reg45 : (+((reg43[(1'h0):(1'h0)] | wire39[(5'h14):(4'hf)]) >>> $unsigned($signed((8'hb5))))));
              reg59 <= (($signed(wire25[(2'h2):(2'h2)]) <<< (+{{(8'hba)}})) ?
                  (8'ha3) : (+(&((-reg45) ?
                      wire28[(3'h4):(1'h1)] : $unsigned((8'ha3))))));
            end
          else
            begin
              reg57 <= (reg31 ^ ((+(reg57 & (8'hb3))) ?
                  ((8'ha7) << ((wire28 ^ reg40) >> wire29[(4'he):(1'h0)])) : {($signed(reg50) >= (!(7'h41)))}));
              reg58 <= reg42[(3'h7):(3'h4)];
            end
          reg60 <= $signed(wire38[(5'h12):(4'hd)]);
        end
      else
        begin
          reg48 <= wire38;
        end
      if ((+(wire27 ? wire36 : $signed($signed(reg53[(3'h4):(2'h2)])))))
        begin
          reg61 <= {$unsigned(reg54[(1'h0):(1'h0)])};
          if (wire29)
            begin
              reg62 <= wire39;
              reg63 <= reg59;
              reg64 <= (|wire27[(4'he):(2'h3)]);
              reg65 <= reg55[(4'hd):(3'h5)];
              reg66 <= (reg32 - {reg43[(1'h1):(1'h1)]});
            end
          else
            begin
              reg62 <= reg45[(2'h2):(1'h1)];
            end
        end
      else
        begin
          reg61 <= $unsigned($signed($signed($unsigned(wire27))));
          reg62 <= wire23;
          reg63 <= reg45[(1'h1):(1'h1)];
          reg64 <= wire28[(5'h12):(2'h3)];
          reg65 <= reg66;
        end
    end
  assign wire67 = wire39[(4'h8):(2'h2)];
  assign wire68 = $signed(wire29[(2'h2):(2'h2)]);
  assign wire69 = (+reg44);
  assign wire70 = $unsigned($unsigned((+reg64)));
  always
    @(posedge clk) begin
      reg71 <= (|$signed(reg51[(4'hf):(2'h2)]));
      if ($unsigned((($unsigned(((8'hae) ? wire26 : reg52)) ?
          {((8'hab) >> (8'hb0)), reg61[(4'hf):(4'hb)]} : ({wire36, reg44} ?
              (reg66 > reg71) : $signed(reg45))) << $signed((+$signed(wire67))))))
        begin
          if (((~&reg51[(4'hd):(1'h1)]) ~^ $signed((reg33 ?
              ((reg59 ?
                  wire69 : wire24) == (reg66 << reg41)) : wire70[(4'hc):(3'h7)]))))
            begin
              reg72 <= reg51;
            end
          else
            begin
              reg72 <= $signed($unsigned(wire70[(3'h6):(2'h2)]));
            end
          reg73 <= reg50[(4'hd):(4'hb)];
          reg74 <= {($unsigned($signed($unsigned((8'ha1)))) + $signed(wire29[(2'h3):(2'h3)]))};
        end
      else
        begin
          if ($unsigned($unsigned(((-(~&reg59)) < $signed(reg33[(3'h4):(2'h3)])))))
            begin
              reg72 <= {wire26,
                  ({$signed($unsigned(reg65)), reg60} ?
                      (8'haf) : {$unsigned((wire27 + (8'ha8)))})};
            end
          else
            begin
              reg72 <= (!reg64);
              reg73 <= (8'hac);
              reg74 <= wire27;
            end
          reg75 <= $unsigned($unsigned(reg44));
          if ((~$signed($signed(wire35))))
            begin
              reg76 <= $signed($unsigned((!(-$signed(reg41)))));
              reg77 <= $unsigned(reg64[(4'hc):(3'h6)]);
            end
          else
            begin
              reg76 <= (8'hb4);
              reg77 <= reg40[(2'h2):(2'h2)];
              reg78 <= ((((~(wire35 >> (8'hb0))) ?
                      $unsigned({reg44, (8'ha6)}) : $signed({reg52})) ?
                  $unsigned(reg46) : (!($signed(wire39) ?
                      $signed(wire25) : wire69))) != wire27[(2'h2):(1'h0)]);
            end
        end
      reg79 <= ($signed(reg59[(3'h7):(3'h6)]) ?
          ((reg53 ? $signed((8'hac)) : (!reg76)) ?
              $unsigned($unsigned((~&reg73))) : (~&reg31)) : wire24[(4'hb):(2'h3)]);
    end
  assign wire80 = $unsigned(((reg66[(3'h5):(3'h4)] & reg66[(3'h7):(3'h6)]) ~^ (^$unsigned(reg30[(3'h6):(2'h3)]))));
  assign wire81 = $signed((!((((8'hb2) ? reg73 : reg56) < {reg46,
                      reg45}) >> reg44)));
  assign wire82 = ($unsigned(wire70[(2'h2):(1'h0)]) ?
                      wire24[(4'h8):(1'h1)] : wire81[(4'hc):(4'hc)]);
  assign wire83 = reg77;
endmodule
