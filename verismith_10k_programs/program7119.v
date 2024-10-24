module top
#(parameter param70 = ((~(~^(((8'hbc) <= (8'ha9)) << (~&(8'hb0))))) ? ((((8'ha2) * {(8'hbb)}) || (+(~^(8'hb1)))) ? ((((8'ha8) ? (8'hb7) : (8'hb1)) ? ((8'hac) ? (8'ha4) : (8'ha5)) : (8'h9d)) ? (~&(~^(8'haf))) : {((8'ha7) == (8'hae))}) : (|((^(8'hb8)) ? (+(8'hb4)) : (&(8'h9c))))) : (((((8'had) <= (8'ha0)) >>> ((8'hac) ? (8'hbe) : (8'hb3))) & {((8'ha8) ? (8'hb8) : (8'haf)), ((8'hb0) ^~ (8'hb7))}) ? {{((8'hbb) == (8'hb0))}} : (~((!(8'hb8)) && (^~(8'ha1)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire68,
                 wire24,
                 wire23,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire5,
                 reg26,
                 reg25,
                 reg22,
                 reg21,
                 reg20,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      if ((wire1 ?
          ($signed((~^wire4[(1'h0):(1'h0)])) ?
              (~&($unsigned(wire5) ?
                  $signed(wire4) : wire5)) : $unsigned(($unsigned(wire4) ?
                  (!wire2) : (wire3 ? wire4 : (8'hbe))))) : wire3))
        begin
          if (wire1[(2'h2):(1'h1)])
            begin
              reg6 <= $signed((wire4[(3'h4):(1'h0)] ?
                  $signed($signed($unsigned(wire3))) : $signed({$signed(wire5),
                      ((7'h44) == wire2)})));
              reg7 <= (+$signed(wire0[(1'h1):(1'h0)]));
              reg8 <= $unsigned(wire0);
              reg9 <= $signed(wire3[(4'ha):(2'h3)]);
            end
          else
            begin
              reg6 <= ((reg9[(4'h8):(1'h1)] && wire4) == $signed((($unsigned((8'hab)) <<< wire2[(3'h6):(1'h1)]) < $signed(wire5[(2'h2):(1'h1)]))));
              reg7 <= (+reg6[(2'h2):(2'h2)]);
              reg8 <= reg8[(2'h3):(1'h0)];
            end
          reg10 <= reg9;
          if ({(($signed(reg8) & ((wire4 ? reg10 : reg7) ?
                  (wire5 >> wire3) : (~reg7))) ~^ $unsigned($signed((^~reg8)))),
              {(($signed((8'h9e)) ? $signed(reg6) : $signed((8'h9f))) ?
                      wire2 : ({reg7} ? {wire4} : ((8'hb5) && wire4))),
                  ($signed(wire0[(2'h2):(2'h2)]) <= $signed(reg8))}})
            begin
              reg11 <= (^~wire5);
            end
          else
            begin
              reg11 <= $unsigned(({$signed(wire1),
                      $signed(reg6[(1'h0):(1'h0)])} ?
                  (wire2[(1'h1):(1'h0)] >= $unsigned((wire4 ?
                      (8'had) : reg9))) : $unsigned($unsigned((!(8'hae))))));
              reg12 <= wire5;
              reg13 <= (!$signed((!$unsigned((~|reg11)))));
            end
        end
      else
        begin
          if ($unsigned(wire5[(2'h2):(1'h1)]))
            begin
              reg6 <= reg12[(4'hb):(1'h1)];
              reg7 <= {reg11};
            end
          else
            begin
              reg6 <= $unsigned(((&wire2[(4'h8):(3'h6)]) <<< (-wire3[(1'h1):(1'h0)])));
              reg7 <= {((wire2[(1'h0):(1'h0)] ?
                      (|$unsigned(reg7)) : wire4) == (-$signed(((8'hab) <<< wire4)))),
                  ($signed(reg9[(3'h4):(2'h2)]) ^~ (~^reg8[(4'hb):(3'h4)]))};
              reg8 <= reg10;
              reg9 <= ($unsigned($signed(($signed(wire0) ?
                      (^~wire2) : (reg12 ? wire2 : reg9)))) ?
                  {($signed({wire1, wire1}) ?
                          (reg12[(4'h8):(3'h4)] & reg7[(5'h10):(3'h4)]) : (^(~(8'ha4)))),
                      (wire1[(4'ha):(3'h5)] & {$unsigned(reg6)})} : (!($unsigned($unsigned(wire1)) ?
                      reg12[(4'hc):(4'hb)] : wire1[(1'h1):(1'h0)])));
              reg10 <= wire5;
            end
          reg11 <= $signed((((reg13[(2'h2):(2'h2)] ? (+reg9) : wire2) ?
              (~$unsigned(wire1)) : $signed(wire2[(4'ha):(2'h3)])) != $unsigned($unsigned(((8'hab) > reg12)))));
          reg12 <= $unsigned($unsigned((+((wire5 ? wire5 : wire0) ?
              wire2[(3'h7):(2'h2)] : (^(8'ha0))))));
        end
      reg14 <= ({{(+((8'ha0) ? (8'hba) : wire5))},
          (+(((8'hb7) >> wire1) ?
              {reg13} : $signed((8'haf))))} | (($signed($unsigned(wire5)) | (~|$signed(reg7))) <<< (~^{(-reg13)})));
      reg15 <= (&$unsigned(wire5[(2'h2):(2'h2)]));
    end
  assign wire16 = ($signed($unsigned(reg9)) >> $signed($unsigned((~&$signed(reg10)))));
  assign wire17 = $unsigned(wire2);
  assign wire18 = wire4[(5'h13):(4'hf)];
  assign wire19 = reg15[(4'h9):(3'h5)];
  always
    @(posedge clk) begin
      reg20 <= (8'hb0);
      reg21 <= (wire3[(3'h6):(1'h1)] >>> (wire2 ?
          reg9[(3'h4):(2'h2)] : reg8[(4'hc):(4'hb)]));
      reg22 <= ({reg10, $signed(reg11[(4'ha):(3'h4)])} ?
          wire0[(1'h0):(1'h0)] : wire5[(1'h1):(1'h1)]);
    end
  assign wire23 = (($unsigned($signed({(8'hb3)})) ?
                          ($unsigned((8'hb2)) && {(reg21 ?
                                  reg10 : reg15)}) : wire3[(5'h13):(4'hb)]) ?
                      $unsigned((^~reg20)) : ((((^(8'hb1)) ?
                          reg14 : $signed(wire16)) != $unsigned((reg9 ?
                          wire18 : reg10))) <= (((reg10 ?
                          reg11 : wire19) + $unsigned(reg6)) <<< (8'hb8))));
  assign wire24 = (|$signed(reg20[(4'ha):(3'h6)]));
  always
    @(posedge clk) begin
      reg25 <= ((wire0 != (({wire16} ~^ $signed(wire2)) ?
          $unsigned(reg14) : wire23[(1'h1):(1'h0)])) != ($signed(((|reg8) & {wire18})) ?
          (wire2 > $unsigned(wire17[(4'h9):(2'h2)])) : $signed(reg6)));
      reg26 <= wire24[(3'h6):(1'h0)];
    end
  module27 #() modinst69 (wire68, clk, reg14, reg12, reg15, reg11);
endmodule

module module27
#(parameter param66 = {(((-(|(8'hb5))) ? (((8'ha9) >= (7'h40)) ? ((8'haa) ? (8'hb8) : (8'hb6)) : ((8'h9e) | (8'hac))) : ((|(8'hb6)) ? ((8'hae) ? (8'haf) : (8'hba)) : ((8'hb8) ? (8'ha8) : (8'h9c)))) ~^ ({(~^(8'ha1))} ? (8'hbd) : ({(8'hb6)} ? ((7'h43) == (8'haa)) : ((7'h40) ? (8'hac) : (8'hb0)))))}, 
parameter param67 = {(8'h9e), {param66}})
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire31;
  input wire [(5'h11):(1'h0)] wire30;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire signed [(4'h8):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  assign y = {wire62,
                 wire60,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire32 = {((!({wire29, wire29} && (wire29 ? (8'ha7) : wire31))) ?
                          (!wire28[(2'h2):(1'h1)]) : wire30[(2'h3):(1'h0)]),
                      {$unsigned((^~((8'had) ? wire30 : (8'hb4)))), wire31}};
  assign wire33 = (+$signed((|wire32[(2'h2):(2'h2)])));
  assign wire34 = $signed({wire28[(2'h2):(1'h0)]});
  assign wire35 = wire34[(3'h5):(2'h3)];
  assign wire36 = wire33;
  assign wire37 = {((|(wire28 < (~&wire34))) << $signed(wire36))};
  module38 #() modinst61 (.wire40(wire33), .wire42(wire32), .wire41(wire34), .wire39(wire31), .clk(clk), .y(wire60));
  assign wire62 = {($unsigned((8'ha4)) ~^ (^$unsigned($signed(wire35))))};
  always
    @(posedge clk) begin
      reg63 <= wire32;
      reg64 <= (wire34 ? $unsigned($signed(wire60[(4'h8):(2'h3)])) : (!wire29));
      reg65 <= (8'ha0);
    end
endmodule

module module38
#(parameter param59 = {(~|(&(~&((7'h42) ? (8'haa) : (8'hb7))))), (8'ha8)})
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire42;
  input wire [(3'h4):(1'h0)] wire41;
  input wire signed [(3'h4):(1'h0)] wire40;
  input wire signed [(5'h13):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  assign y = {wire58,
                 wire51,
                 wire44,
                 wire43,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire43 = $unsigned(wire42[(4'ha):(4'h8)]);
  assign wire44 = wire43[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg45 <= $unsigned(((8'hae) ?
          wire42[(3'h7):(1'h0)] : ($signed((wire44 >= wire43)) >>> (wire39[(4'h8):(3'h4)] ?
              (-wire42) : $signed(wire42)))));
      if (wire42[(2'h2):(1'h0)])
        begin
          reg46 <= {$signed($unsigned($signed((wire39 ? wire43 : wire42))))};
          reg47 <= (($signed(reg46) <= (^~(-(wire42 ?
              wire42 : reg45)))) ~^ wire43);
          reg48 <= (wire42 || (($unsigned({(8'had), wire42}) ?
                  wire39[(4'h8):(3'h6)] : reg45) ?
              wire42 : $signed($unsigned((8'hb1)))));
          reg49 <= ({wire39[(2'h2):(1'h0)]} + $signed($unsigned((8'ha4))));
          reg50 <= (((reg46[(3'h4):(2'h2)] >> (~(wire44 <= wire42))) ?
              {reg46[(4'hb):(3'h7)],
                  $signed((wire40 + reg47))} : ((reg49[(2'h2):(2'h2)] != $unsigned(wire40)) > $unsigned($unsigned(wire39)))) > ($signed({reg46}) > wire39));
        end
      else
        begin
          reg46 <= $signed(wire43[(4'h8):(2'h2)]);
          reg47 <= reg50;
        end
    end
  assign wire51 = $signed(((wire40 ?
                          $signed($unsigned(wire42)) : wire40[(2'h2):(1'h1)]) ?
                      $signed($signed((^~reg49))) : (wire40[(3'h4):(2'h2)] ?
                          (!{reg50, wire44}) : wire43[(3'h4):(2'h3)])));
  always
    @(posedge clk) begin
      reg52 <= reg48[(2'h2):(1'h1)];
      reg53 <= $signed({{$unsigned(reg47), $unsigned(wire41[(2'h3):(2'h3)])}});
      if (($unsigned({(reg46 ? $signed(wire51) : {reg45, reg52})}) ?
          (({$unsigned(reg45), reg49} >= wire40[(1'h0):(1'h0)]) ?
              ((&wire41) ?
                  $unsigned((~wire43)) : {(~^wire51),
                      wire40[(2'h2):(1'h1)]}) : wire39) : ($signed(reg49) ?
              (~|(|wire42[(4'ha):(3'h5)])) : $unsigned($unsigned((-reg46))))))
        begin
          reg54 <= reg50;
        end
      else
        begin
          if ($unsigned((wire51[(3'h4):(1'h0)] < ((reg45[(1'h1):(1'h0)] ^~ wire44) <<< ({reg50,
              wire40} == {wire43, wire43})))))
            begin
              reg54 <= $signed({{($unsigned(reg50) ~^ {(8'h9e), reg46})}});
              reg55 <= (~^wire44);
              reg56 <= ((reg46[(4'hc):(4'h8)] ?
                  $signed(reg55[(3'h7):(3'h7)]) : $signed(((reg55 ?
                          wire51 : reg45) ?
                      reg55 : (wire41 >= reg48)))) ^ ((~|reg52[(3'h4):(2'h3)]) < (wire41[(3'h4):(1'h1)] != ((wire40 ?
                  reg52 : wire44) > $unsigned(reg52)))));
            end
          else
            begin
              reg54 <= ($unsigned({$signed((~^reg49))}) ?
                  $unsigned(((reg49[(2'h3):(1'h0)] & (^~(8'h9d))) | (wire40 & reg55))) : $signed($unsigned(reg47[(2'h2):(1'h1)])));
              reg55 <= $unsigned((reg56[(3'h6):(3'h5)] ^~ (|reg56)));
              reg56 <= $unsigned(wire40);
            end
          reg57 <= reg50;
        end
    end
  assign wire58 = {(~&$signed({((7'h43) <= (8'hb8)),
                          (wire39 ? (8'hb8) : wire40)}))};
endmodule
