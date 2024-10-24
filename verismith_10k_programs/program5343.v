module top
#(parameter param90 = (((~|(|((8'hac) && (8'haf)))) ? {(~|((8'hb3) != (7'h40)))} : ((((8'hb4) ? (8'ha4) : (8'h9e)) ? (~^(8'hab)) : ((8'ha4) ? (8'hb8) : (8'hb4))) ? (((8'ha3) ~^ (7'h44)) & (^(8'ha8))) : (^~((8'haa) == (7'h40))))) ? ({(&((8'ha0) && (8'h9d))), ((~&(8'ha2)) ? ((8'ha0) >= (8'hbc)) : ((7'h41) ? (8'ha9) : (8'hab)))} ? (((^(7'h42)) & (~&(8'haa))) ? ((|(8'hba)) & ((7'h44) >= (7'h41))) : (8'hb4)) : ((((8'ha1) & (8'hbb)) | ((8'h9f) ? (8'haa) : (7'h42))) - ((~^(8'hbb)) != ((8'hbf) ? (8'hba) : (8'ha6))))) : {(^~(^((8'hb1) ? (8'h9c) : (8'hb4)))), (-(((8'hac) ? (8'hbd) : (7'h42)) <<< {(8'ha1), (8'hba)}))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire88;
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  assign y = {wire5,
                 wire22,
                 wire88,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
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
                 (1'h0)};
  assign wire5 = {$unsigned(wire4),
                     (($unsigned((8'haf)) >= {(wire4 ? wire3 : wire4),
                             {wire3}}) ?
                         (-$signed($signed(wire2))) : (8'hb3))};
  always
    @(posedge clk) begin
      if (wire4[(2'h2):(1'h1)])
        begin
          reg6 <= ((wire5 ?
                  ($unsigned(wire0[(5'h14):(3'h5)]) ?
                      wire3[(3'h4):(2'h3)] : {(8'hb2),
                          $signed((8'hbb))}) : {($signed(wire3) ?
                          $signed(wire3) : $unsigned((8'ha1))),
                      {(wire2 || wire4)}}) ?
              $signed($signed((wire1[(1'h1):(1'h1)] ?
                  $signed(wire4) : ((8'ha7) + (8'hac))))) : (wire3 ?
                  $signed({{wire5}}) : (!(wire0 ?
                      $signed((8'haf)) : (~^wire0)))));
          reg7 <= ($unsigned(((|wire5[(1'h0):(1'h0)]) <= $signed($signed(wire2)))) ?
              (wire4 != (~^(|(wire0 >> wire3)))) : $unsigned(wire4[(3'h4):(1'h0)]));
          if (wire1[(1'h0):(1'h0)])
            begin
              reg8 <= wire5[(1'h1):(1'h1)];
              reg9 <= {((-$unsigned((~reg6))) > (wire5[(3'h7):(2'h3)] ?
                      $unsigned($unsigned(reg7)) : {reg7[(1'h0):(1'h0)]})),
                  ({wire3} ? (!wire2) : $signed(wire2[(1'h1):(1'h0)]))};
              reg10 <= ($unsigned((-(~|wire2[(2'h2):(1'h0)]))) - $signed((~(+$unsigned(reg8)))));
            end
          else
            begin
              reg8 <= {reg9[(5'h11):(3'h7)]};
              reg9 <= (wire5[(4'hc):(2'h3)] << (|wire5[(3'h5):(1'h0)]));
              reg10 <= wire0;
            end
        end
      else
        begin
          reg6 <= (((($signed(wire4) ?
                      $signed(wire4) : ((8'hab) || wire1)) >>> reg8) ?
                  reg7[(4'he):(2'h3)] : $signed(wire1)) ?
              (^~$unsigned(wire1[(2'h2):(2'h2)])) : {$signed((wire0 * wire1)),
                  {$signed((~&reg9))}});
          reg7 <= $signed($signed(reg10));
          reg8 <= (wire0[(3'h4):(2'h2)] ?
              ({(reg8 || $signed(wire1))} ?
                  wire1 : ((-(reg10 ? wire3 : wire4)) ?
                      (((8'hae) - wire3) ?
                          (wire5 | (8'hb6)) : wire5[(2'h2):(2'h2)]) : ((|reg10) < wire3[(3'h4):(1'h1)]))) : wire1);
          reg9 <= wire4;
        end
      if (reg9)
        begin
          reg11 <= (8'ha8);
          reg12 <= $signed(wire2);
          reg13 <= $signed($unsigned((wire0[(4'hf):(1'h1)] ?
              ({wire3} <<< $unsigned(reg12)) : $signed($signed(reg12)))));
          reg14 <= $signed($signed(($unsigned({wire1,
              (7'h42)}) >>> $signed(reg7))));
        end
      else
        begin
          reg11 <= reg12[(3'h6):(1'h0)];
          if (reg13)
            begin
              reg12 <= {$signed(reg13[(3'h4):(1'h0)])};
              reg13 <= ($unsigned(reg14) ?
                  ($unsigned(wire0) ?
                      $signed($signed(wire3[(3'h4):(2'h2)])) : reg10[(3'h4):(1'h0)]) : wire0);
              reg14 <= {$unsigned((($signed(wire1) ?
                      (~^wire3) : (wire2 < reg11)) ^~ $signed({wire1, wire4}))),
                  ((reg8[(1'h0):(1'h0)] ? reg6 : (8'hae)) ?
                      ($unsigned($signed((8'h9d))) ?
                          ((wire2 ?
                              wire5 : (8'hb1)) ^~ $signed(wire4)) : (!$unsigned(wire4))) : (~|$signed((reg12 ?
                          reg8 : reg9))))};
              reg15 <= wire0[(5'h11):(4'hd)];
              reg16 <= $signed($signed((!$signed($signed(wire0)))));
            end
          else
            begin
              reg12 <= $unsigned(((((reg7 ?
                      wire5 : wire2) >= $unsigned(wire2)) ?
                  wire5[(4'hd):(4'h9)] : (8'hb3)) >> reg13));
            end
          reg17 <= {(^(wire0 ?
                  $signed(((8'ha3) ? reg13 : wire5)) : reg16[(3'h5):(1'h1)]))};
          reg18 <= {reg16, (&$unsigned(wire4))};
        end
      reg19 <= $signed($signed(($unsigned($unsigned(reg18)) ?
          {(reg13 ? reg7 : reg9), ((8'ha2) ? wire2 : (8'hb9))} : {{wire2},
              (~|reg10)})));
      reg20 <= $signed((reg18 ~^ reg12[(3'h4):(1'h0)]));
      reg21 <= (|(+$signed(wire3[(1'h1):(1'h0)])));
    end
  assign wire22 = (8'haa);
  module23 #() modinst89 (.wire26(wire0), .wire24(reg9), .y(wire88), .wire25(wire2), .clk(clk), .wire27(wire1));
endmodule

module module23  (y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire [(4'he):(1'h0)] wire26;
  input wire signed [(4'he):(1'h0)] wire25;
  input wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(4'hd):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire73;
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire76,
                 wire75,
                 wire73,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  module28 #() modinst74 (wire73, clk, wire25, wire24, wire26, wire27, (8'hb2));
  assign wire75 = $unsigned(wire25);
  assign wire76 = $signed(((wire73[(2'h2):(2'h2)] | ($signed(wire25) - $signed(wire24))) ?
                      $signed({(wire27 ? (8'ha8) : wire73),
                          $signed(wire75)}) : wire73));
  always
    @(posedge clk) begin
      if ((~&$signed(wire27)))
        begin
          reg77 <= $signed($signed($signed($signed((^wire25)))));
        end
      else
        begin
          reg77 <= ((^wire26) ? reg77 : wire24);
          reg78 <= $signed($unsigned($unsigned(wire26[(4'he):(4'hc)])));
          if (((((((8'ha9) ?
              wire75 : wire27) <<< $signed((8'ha0))) >>> wire76) >>> {wire25[(2'h2):(2'h2)]}) >> wire26[(4'hb):(3'h5)]))
            begin
              reg79 <= $unsigned((({(wire24 >>> (8'hb8)),
                  ((8'ha3) || wire75)} > reg78[(4'h8):(2'h2)]) * (((~&wire25) >>> (wire27 + (8'ha2))) ?
                  wire27 : reg77[(2'h2):(1'h1)])));
            end
          else
            begin
              reg79 <= wire73[(3'h5):(3'h4)];
              reg80 <= (^~wire73[(2'h2):(1'h1)]);
              reg81 <= ($unsigned(reg77[(2'h3):(2'h3)]) + {$unsigned(($signed(wire76) ^ {wire76,
                      reg77})),
                  (reg79 <<< ((reg80 ? reg79 : wire26) ^~ $signed(wire26)))});
            end
          reg82 <= wire25;
        end
      reg83 <= $signed((wire27[(2'h3):(2'h2)] ^ $unsigned(wire27)));
    end
  assign wire84 = $signed($signed((+$signed(reg79[(1'h0):(1'h0)]))));
  assign wire85 = (($unsigned(wire76[(4'ha):(4'h9)]) ?
                          (($unsigned(reg80) ?
                              $signed(wire25) : {wire27}) ^~ $unsigned($unsigned(wire25))) : $signed((~&(reg80 < (7'h44))))) ?
                      $signed(reg82[(4'hf):(4'hc)]) : (reg82[(3'h5):(3'h4)] + (!({wire27} >= $unsigned(reg82)))));
  assign wire86 = (wire85 ?
                      (($signed((wire25 ? wire27 : reg82)) > ((reg81 ?
                          wire85 : reg77) ^ $unsigned(reg78))) << $signed(reg83[(2'h2):(1'h1)])) : $unsigned(((wire24 >>> wire25) ?
                          reg81[(3'h4):(1'h1)] : reg79[(3'h5):(3'h4)])));
  assign wire87 = wire26[(4'h8):(3'h4)];
endmodule

module module28
#(parameter param71 = (~{(8'hbb)}), 
parameter param72 = (~param71))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h1c6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire33;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire signed [(4'hb):(1'h0)] wire31;
  input wire [(4'h9):(1'h0)] wire30;
  input wire [(4'h9):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  assign y = {wire70,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire36,
                 wire35,
                 wire34,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire34 = ($signed({(^~wire30[(3'h5):(3'h5)])}) + wire33[(4'h8):(3'h7)]);
  assign wire35 = (~&(wire33[(3'h5):(1'h1)] ?
                      (wire29 - $signed(wire33[(4'hb):(2'h2)])) : $unsigned(((wire34 || wire29) ?
                          $unsigned(wire29) : (!(8'hb4))))));
  assign wire36 = ($unsigned((wire34 ?
                      ((wire31 ? wire35 : wire35) ?
                          $unsigned(wire30) : wire35) : ($unsigned((7'h41)) ^~ (wire29 ?
                          wire30 : (8'ha2))))) >> $signed((+wire33[(4'hd):(1'h0)])));
  always
    @(posedge clk) begin
      reg37 <= (~&(~^(8'ha3)));
      if (reg37)
        begin
          if ({({$signed((~(8'hbb)))} ?
                  wire32[(2'h2):(1'h1)] : (wire31[(1'h0):(1'h0)] ?
                      $unsigned(wire35) : {wire30})),
              wire30})
            begin
              reg38 <= (+($unsigned($unsigned(wire33[(4'hd):(4'h9)])) << $unsigned((wire34 >= (^~(8'ha6))))));
            end
          else
            begin
              reg38 <= $signed(wire31[(3'h4):(2'h3)]);
            end
          reg39 <= (^~wire32);
        end
      else
        begin
          reg38 <= reg39;
          reg39 <= (~&{wire32[(2'h3):(1'h0)],
              $unsigned((((8'hb4) ? wire30 : reg37) ?
                  (wire29 ^ reg39) : (wire32 ~^ reg37)))});
          reg40 <= wire34;
        end
      reg41 <= wire32[(1'h1):(1'h0)];
    end
  assign wire42 = wire35[(1'h0):(1'h0)];
  assign wire43 = $unsigned(reg38);
  assign wire44 = wire29;
  assign wire45 = reg39;
  assign wire46 = $signed((7'h42));
  assign wire47 = (!(~^(($signed(wire32) < wire42[(1'h0):(1'h0)]) >> ($signed(wire35) <<< wire35))));
  always
    @(posedge clk) begin
      if (((wire43 ?
          (8'hb9) : (^~(wire32 & wire36[(2'h2):(1'h1)]))) & (~|(wire36 ?
          ({wire34, (7'h40)} || $signed(reg39)) : {$unsigned(wire46),
              wire44[(4'hd):(4'hc)]}))))
        begin
          if (wire46[(1'h0):(1'h0)])
            begin
              reg48 <= wire47[(3'h4):(1'h0)];
              reg49 <= ((wire29 ^~ $unsigned($signed($signed((8'hb6))))) ?
                  (wire32[(1'h1):(1'h1)] || (((wire46 != wire33) ^~ (wire33 ?
                          wire46 : wire34)) ?
                      reg37 : (~(wire31 ? wire35 : wire46)))) : reg40);
              reg50 <= (reg38 ? wire32 : $signed(wire29[(3'h6):(1'h0)]));
              reg51 <= (wire33 ?
                  {(((8'hab) != (reg41 <<< reg48)) || $signed((wire33 - wire33))),
                      (((~^reg48) ? $unsigned(reg38) : wire29) ?
                          {$signed(reg48), wire43[(2'h3):(1'h1)]} : ((reg49 ?
                              wire31 : wire46) > (reg39 ~^ wire35)))} : reg48[(3'h6):(2'h2)]);
            end
          else
            begin
              reg48 <= (reg38[(3'h4):(1'h1)] != {($signed($unsigned(wire33)) | $unsigned(wire45))});
              reg49 <= ($signed((+$unsigned($signed(wire46)))) ?
                  wire34[(3'h7):(3'h5)] : ({((+wire43) <= $signed(wire30))} ?
                      $unsigned((^wire30)) : ({wire34[(3'h7):(3'h6)]} ?
                          (+wire33[(4'he):(3'h4)]) : ((wire32 ?
                              wire31 : reg39) << (wire44 ? wire30 : wire32)))));
              reg50 <= wire34[(3'h4):(2'h3)];
              reg51 <= $signed(((wire29 ?
                  {$unsigned(reg49), $signed(reg41)} : ((reg40 == wire47) ?
                      {wire33,
                          reg40} : (!wire31))) >> {($signed(wire29) == wire36),
                  ({wire30} ? $signed(wire44) : (wire33 <= wire35))}));
              reg52 <= $unsigned((reg49[(3'h4):(1'h0)] ?
                  ((reg39 || reg38[(3'h5):(2'h2)]) ?
                      $signed((~&reg51)) : reg37) : $unsigned(($unsigned(reg38) & $signed(wire30)))));
            end
        end
      else
        begin
          reg48 <= $signed(({$signed(wire44), (~&$signed(wire47))} ?
              $signed($unsigned((wire31 ~^ (7'h43)))) : wire32[(3'h4):(1'h1)]));
          reg49 <= (wire46 >> ($unsigned(($unsigned(wire43) ?
              $signed(wire29) : (~^(8'hb0)))) <= $signed((((8'ha4) ?
              wire45 : wire47) >> (+(8'hae))))));
        end
    end
  assign wire53 = (reg50 ~^ ($unsigned(wire43) != $unsigned(wire44[(4'hd):(4'h8)])));
  assign wire54 = $signed(reg41[(3'h7):(1'h0)]);
  assign wire55 = (8'hb4);
  assign wire56 = ($signed((+$signed(reg48))) >>> $unsigned($signed(reg37)));
  assign wire57 = reg48[(4'ha):(4'ha)];
  assign wire58 = (wire53[(3'h7):(3'h7)] | $unsigned(wire53));
  assign wire59 = (!((&$signed({wire58, reg41})) ? (7'h40) : wire43));
  always
    @(posedge clk) begin
      reg60 <= (&(((&(-wire30)) ?
          ($unsigned(wire46) ?
              $signed(wire46) : $unsigned(wire55)) : $signed(reg38)) ^~ (wire46 ?
          wire47 : reg49)));
      if ((^~$signed($unsigned($unsigned((wire55 ? reg38 : wire33))))))
        begin
          reg61 <= wire53[(4'h8):(3'h5)];
          reg62 <= reg40;
          reg63 <= $unsigned((^~(wire56[(3'h4):(1'h0)] ?
              (reg49 ?
                  (wire42 ?
                      reg50 : wire33) : wire55[(2'h3):(2'h3)]) : reg62[(4'hd):(2'h2)])));
          reg64 <= reg49[(4'h9):(2'h2)];
          if (wire59)
            begin
              reg65 <= reg40[(4'ha):(2'h3)];
            end
          else
            begin
              reg65 <= (wire59 ?
                  reg50[(4'h8):(3'h7)] : ($signed((~&(wire54 * wire53))) << (~|(wire42 <= (reg64 ?
                      wire44 : wire29)))));
              reg66 <= $signed((+(^wire29[(2'h3):(2'h2)])));
            end
        end
      else
        begin
          reg61 <= wire57[(1'h0):(1'h0)];
          reg62 <= ($unsigned(reg60) ?
              wire34 : ((reg66 ?
                      reg49[(3'h7):(3'h5)] : ((~^reg49) ^~ (wire36 >> wire32))) ?
                  wire53 : ($signed((~^wire57)) << (^(&(8'ha5))))));
          reg63 <= ($unsigned($unsigned($signed((wire56 ~^ reg63)))) * wire43);
          reg64 <= (reg61 ?
              ((($signed(reg62) ?
                  reg39 : (-wire46)) - $unsigned((wire57 >= (8'hb8)))) >> (+(7'h40))) : (8'ha6));
          reg65 <= reg38;
        end
      reg67 <= $signed((7'h41));
      reg68 <= $signed(reg39[(2'h2):(2'h2)]);
      reg69 <= $unsigned(reg60[(4'h9):(2'h2)]);
    end
  assign wire70 = (^wire36[(3'h7):(3'h4)]);
endmodule
