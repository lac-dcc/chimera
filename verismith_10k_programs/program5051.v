module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire69;
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire69,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire5 = ($signed((!(&{wire4, wire2}))) == (~^(~^{(^wire4)})));
  assign wire6 = (wire5 <= ({((wire3 > wire5) ^~ wire2)} ?
                     (~((&wire5) ~^ $unsigned((8'ha5)))) : (((~wire1) | (wire0 * wire2)) | wire2)));
  assign wire7 = ({(^~((!wire5) != wire4[(2'h3):(2'h3)])),
                         $unsigned(((^wire3) ? (wire4 ^~ wire2) : wire4))} ?
                     (((wire4 <= $unsigned(wire4)) <<< (+{wire4, wire3})) ?
                         $unsigned(wire3[(4'hc):(4'hc)]) : $signed(wire4)) : $unsigned(($unsigned(wire0) >> wire0[(1'h0):(1'h0)])));
  assign wire8 = ($signed(((((8'ha4) - wire4) == $signed(wire2)) >= wire6)) <= $signed($unsigned(wire4)));
  assign wire9 = $unsigned(((|$signed($unsigned(wire3))) ?
                     $unsigned(wire7[(3'h4):(1'h1)]) : wire4));
  assign wire10 = (!wire0[(2'h2):(1'h0)]);
  assign wire11 = ((wire3[(1'h0):(1'h0)] - wire5[(4'ha):(4'h8)]) < wire3[(4'hb):(4'ha)]);
  assign wire12 = wire0;
  assign wire13 = {$unsigned(((|wire9[(2'h2):(2'h2)]) ?
                          wire5[(5'h15):(4'ha)] : $unsigned(wire12[(4'h9):(2'h2)]))),
                      $signed(wire7)};
  always
    @(posedge clk) begin
      reg14 <= $unsigned(((wire2[(4'hc):(4'hb)] - wire7) ?
          {wire6, wire7} : (8'hbf)));
      reg15 <= wire9;
      reg16 <= wire12[(3'h4):(2'h2)];
      reg17 <= (({wire0[(1'h0):(1'h0)]} ?
          $signed((wire8 ^~ (wire10 && wire3))) : $signed((-reg14))) ^~ $unsigned($signed($unsigned($signed(wire10)))));
    end
  assign wire18 = ($signed(wire0) ?
                      {(((~(8'hba)) || reg14[(1'h1):(1'h0)]) ?
                              wire9[(2'h3):(1'h0)] : (wire11 ?
                                  $signed(wire8) : wire4[(1'h0):(1'h0)])),
                          wire13} : $signed($signed((wire10 ?
                          wire13 : ((8'hb1) == (7'h42))))));
  assign wire19 = $signed($unsigned($unsigned(wire8[(4'hb):(2'h3)])));
  assign wire20 = (^wire13);
  assign wire21 = (8'hb9);
  assign wire22 = $signed((wire8 ^ ((wire7[(1'h0):(1'h0)] ?
                      $signed(wire20) : (wire3 ? (8'hbc) : wire11)) || ({wire12,
                      wire18} >> {wire7, wire19}))));
  module23 #() modinst70 (wire69, clk, wire7, wire22, reg17, wire19);
endmodule

module module23
#(parameter param68 = {(((8'hb6) ^~ (((8'hb5) ? (8'haf) : (8'ha5)) ? (!(7'h40)) : ((8'haa) | (8'hb8)))) ^ ({((8'hae) * (8'hb0))} ^ ((~|(8'hac)) ? (^~(8'hb4)) : ((8'hba) - (8'ha0))))), (-{(-((8'hb6) ? (8'hae) : (7'h42))), (((8'hb6) ^ (8'hb6)) == (^(8'hae)))})})
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire27;
  input wire signed [(5'h10):(1'h0)] wire26;
  input wire [(4'h8):(1'h0)] wire25;
  input wire [(5'h12):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire61;
  assign y = {wire67, wire66, wire65, wire64, wire63, wire61, (1'h0)};
  module28 #() modinst62 (.wire29((8'ha8)), .wire30(wire27), .wire33(wire26), .wire32(wire25), .clk(clk), .wire31(wire24), .y(wire61));
  assign wire63 = (wire27[(3'h5):(2'h2)] >>> ({({wire27} - (wire24 > (8'hb8)))} > $unsigned(wire61)));
  assign wire64 = wire61[(1'h1):(1'h0)];
  assign wire65 = wire61;
  assign wire66 = $signed(wire25);
  assign wire67 = wire26;
endmodule

module module28
#(parameter param60 = {((~&{((8'hb1) ? (8'hb7) : (8'h9d)), (|(8'hb0))}) ? (~&(&{(8'hbf)})) : (!({(8'hbf), (8'haf)} ? ((8'h9c) * (8'ha0)) : (~|(7'h44)))))})
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire33;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire [(5'h12):(1'h0)] wire31;
  input wire [(4'ha):(1'h0)] wire30;
  input wire [(5'h14):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
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
                 (1'h0)};
  assign wire34 = $signed(wire33[(1'h1):(1'h0)]);
  assign wire35 = $signed((7'h40));
  assign wire36 = (^~($unsigned({(wire32 ? wire32 : wire30)}) ?
                      $signed($unsigned($unsigned(wire32))) : {wire35[(1'h1):(1'h0)]}));
  assign wire37 = ((&$signed((wire34 != (~&wire31)))) ?
                      $unsigned(((8'hb8) < ((|wire36) >= wire34))) : {(wire34 == ((wire32 ?
                                  wire31 : (8'hbc)) ?
                              $signed(wire36) : (!wire35)))});
  assign wire38 = $unsigned($signed(wire35[(1'h1):(1'h1)]));
  assign wire39 = (!($unsigned({(-wire37), $signed((8'h9e))}) ?
                      {(~^(wire34 ~^ wire29))} : (((wire36 << wire36) ?
                              $unsigned(wire35) : $unsigned((8'haf))) ?
                          $signed({wire30, wire34}) : ((wire36 >> wire31) ?
                              wire36 : (wire34 ? wire33 : wire33)))));
  assign wire40 = ($signed(({(wire33 > wire37)} * ({wire38} < $signed(wire34)))) ?
                      (wire38[(2'h3):(1'h0)] ?
                          wire39[(3'h7):(3'h5)] : wire31[(1'h1):(1'h0)]) : (({wire30} & $unsigned(wire36[(2'h3):(1'h1)])) ?
                          {$signed(wire29[(5'h10):(2'h2)])} : {wire37[(3'h4):(1'h0)]}));
  always
    @(posedge clk) begin
      reg41 <= (&(((wire37[(2'h3):(1'h0)] ?
              (wire39 ^~ (8'hb8)) : {wire31,
                  wire35}) << (+(wire36 || wire30))) ?
          $unsigned(wire31) : {wire31}));
      reg42 <= wire40;
      if ($signed($unsigned({$unsigned((wire39 - wire32))})))
        begin
          reg43 <= ($unsigned({({(8'hbc), wire40} == wire40)}) ?
              ($unsigned($signed($signed(wire29))) ?
                  wire40 : wire30) : $unsigned({((wire35 ~^ (8'ha2)) ^~ (^wire33)),
                  (~$unsigned(reg42))}));
          reg44 <= (($unsigned($signed((^wire33))) ?
              (-(7'h41)) : wire34[(2'h2):(1'h1)]) * wire30[(3'h6):(3'h4)]);
          reg45 <= (!wire38);
        end
      else
        begin
          reg43 <= wire32[(3'h4):(3'h4)];
          reg44 <= {$unsigned(((((8'hac) ? reg41 : wire40) ?
                  $unsigned(wire33) : ((8'hb3) ? reg45 : wire34)) & ({wire29} ?
                  (reg44 || reg42) : $unsigned(wire31))))};
          if (reg42[(1'h1):(1'h1)])
            begin
              reg45 <= {($unsigned($signed((wire35 != (8'hbc)))) ?
                      (wire36[(3'h5):(2'h2)] ?
                          (~^$signed(wire36)) : $unsigned(reg44[(1'h1):(1'h1)])) : ((+$unsigned(wire34)) <= wire29)),
                  wire31[(3'h7):(3'h6)]};
              reg46 <= wire38;
              reg47 <= reg43;
              reg48 <= wire37[(2'h3):(2'h2)];
              reg49 <= wire35;
            end
          else
            begin
              reg45 <= (+$unsigned($signed((wire39[(3'h7):(3'h5)] ?
                  wire37 : wire40[(3'h6):(1'h1)]))));
              reg46 <= (~^$unsigned($unsigned($unsigned((reg46 ?
                  (8'hbb) : reg49)))));
              reg47 <= (($signed(reg41) ?
                      $signed((~(wire40 > wire29))) : ($unsigned({reg46}) & $unsigned($signed((8'hb4))))) ?
                  reg47[(3'h4):(1'h0)] : (8'hb0));
              reg48 <= $unsigned(((~|wire31) ?
                  wire40[(3'h6):(3'h5)] : (~reg49)));
              reg49 <= ((wire38[(3'h6):(3'h6)] || (~(wire37 ?
                      reg48[(2'h2):(1'h0)] : $signed((8'hba))))) ?
                  wire35[(1'h0):(1'h0)] : wire33[(3'h5):(2'h2)]);
            end
          reg50 <= wire29[(5'h13):(3'h6)];
          if (reg50)
            begin
              reg51 <= (&reg47);
            end
          else
            begin
              reg51 <= {(~|{(^~(wire37 ? (8'hbd) : (8'hb3)))})};
              reg52 <= (~wire35);
              reg53 <= $signed({$signed($unsigned((+reg42))),
                  $signed(wire38[(3'h5):(3'h5)])});
            end
        end
      reg54 <= $unsigned(((($signed((8'ha7)) << $signed(reg46)) ?
              (!(reg44 ? wire30 : wire38)) : (^(~|(8'hb5)))) ?
          (wire29 && $unsigned((reg48 ?
              reg43 : reg41))) : $signed((wire38[(4'he):(4'hb)] ?
              (wire32 ? reg42 : reg44) : $signed(reg43)))));
    end
  assign wire55 = wire32[(1'h1):(1'h1)];
  assign wire56 = (~^(~^($signed($signed(reg44)) > (!reg49[(3'h5):(2'h3)]))));
  assign wire57 = reg54[(4'hc):(4'hb)];
  assign wire58 = ($unsigned((7'h41)) ?
                      (^~reg54[(1'h1):(1'h1)]) : ((reg54[(5'h10):(4'hd)] ^ wire39[(3'h5):(2'h3)]) <<< reg45[(1'h0):(1'h0)]));
  assign wire59 = (($signed((&reg51[(4'he):(4'ha)])) * (wire34[(4'hf):(3'h6)] ?
                      (((8'h9e) + reg53) >>> $unsigned(reg53)) : ($signed(reg42) < ((7'h40) ^ reg44)))) < ($signed(($unsigned(wire34) >>> $unsigned(wire40))) ?
                      reg48 : wire58[(2'h3):(1'h1)]));
endmodule
