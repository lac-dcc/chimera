module top
#(parameter param31 = ((((((8'hb3) != (8'ha5)) == ((8'h9f) >>> (7'h43))) != ((^~(8'hb9)) ? ((8'h9f) <<< (8'hb6)) : (+(8'haa)))) ? (8'ha0) : (^{(8'hb7)})) >> {(8'h9d), (((^~(8'ha9)) - ((8'h9f) ? (8'hb4) : (8'hb9))) > (^{(8'hbd), (7'h42)}))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(2'h3):(1'h0)] reg4 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire17,
                 wire16,
                 wire15,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (8'hb9);
      if ($signed(($unsigned(wire2[(4'hb):(4'h8)]) - reg4[(2'h3):(1'h1)])))
        begin
          reg5 <= ($signed(((reg4[(2'h3):(1'h1)] ? $unsigned(wire3) : wire1) ?
                  ({wire2} ? wire3[(1'h0):(1'h0)] : (~^wire0)) : ((^~wire1) ?
                      (reg4 <= wire0) : $signed((8'hb5))))) ?
              reg4 : {((-(wire0 <= reg4)) ?
                      ((reg4 << (8'hba)) ?
                          {reg4} : (wire1 <= reg4)) : $unsigned(wire1[(2'h2):(1'h1)])),
                  wire3});
          reg6 <= wire0;
          reg7 <= (reg4 ?
              $unsigned((~&wire1[(1'h0):(1'h0)])) : $unsigned(reg4));
          reg8 <= {reg6[(3'h6):(3'h4)]};
        end
      else
        begin
          reg5 <= ((((-(^reg8)) == ($unsigned(wire2) <= (+wire0))) == reg5) ?
              $unsigned(wire0) : wire3[(3'h6):(3'h5)]);
          if ($signed($unsigned(($signed($unsigned(reg4)) ?
              $unsigned($unsigned(wire2)) : wire1[(2'h2):(2'h2)]))))
            begin
              reg6 <= $signed($unsigned(reg7));
              reg7 <= (+wire1);
              reg8 <= reg7[(2'h3):(1'h0)];
            end
          else
            begin
              reg6 <= $unsigned((reg8[(3'h5):(1'h0)] >>> $unsigned(((!(8'hb4)) ?
                  (~|wire3) : (reg8 - wire0)))));
              reg7 <= {reg7, ((~|reg7) ^~ $unsigned(reg6[(3'h5):(3'h4)]))};
              reg8 <= (wire0[(1'h0):(1'h0)] <<< reg4[(2'h2):(1'h0)]);
            end
          reg9 <= ($unsigned(wire0[(1'h1):(1'h1)]) ?
              reg6[(3'h6):(3'h5)] : (reg5[(3'h7):(3'h4)] ?
                  (+$signed((wire0 ?
                      wire2 : (8'had)))) : ($signed($signed(wire2)) == (~^reg4[(2'h2):(2'h2)]))));
          if (({$unsigned(((^(8'hb6)) ? (reg4 >> reg6) : $signed((8'hb1)))),
              (&(reg4[(2'h2):(1'h0)] ?
                  (wire0 || (8'hac)) : $signed(wire3)))} ^~ (reg6[(3'h6):(3'h5)] ^ (reg9[(4'hb):(3'h7)] ?
              reg9 : ($signed(reg9) ?
                  ((8'ha1) ? reg8 : wire3) : {wire1, reg8})))))
            begin
              reg10 <= $signed((~^$unsigned(((reg5 <= wire1) ?
                  {reg9} : (reg5 * (8'hae))))));
              reg11 <= (reg8 >= {(reg6 ?
                      ((wire1 << reg9) && (wire0 & reg5)) : (&(~&reg6)))});
              reg12 <= (wire3 ?
                  (($unsigned($unsigned(wire3)) <= $unsigned((reg6 ^ reg8))) ?
                      (^~({wire0, reg10} ?
                          $unsigned((7'h42)) : reg6)) : (((8'h9c) ?
                              (^~reg10) : $signed((8'hba))) ?
                          (8'hb4) : ({reg5} <<< reg9[(3'h5):(2'h3)]))) : $signed((($signed(reg8) == $unsigned(reg7)) ^~ {(wire3 + reg6),
                      wire3})));
              reg13 <= $signed({(!(+{reg10, reg10})), (8'ha5)});
              reg14 <= $signed($signed(reg6[(3'h4):(1'h1)]));
            end
          else
            begin
              reg10 <= reg8[(2'h3):(2'h3)];
              reg11 <= (({({reg5, (8'ha4)} >>> reg13),
                          ((reg6 ^~ wire0) ? {reg4} : (^reg7))} ?
                      $signed((((8'h9d) <<< reg8) ?
                          $signed((8'hb8)) : {reg11, wire2})) : (-{(8'hbe),
                          reg4[(1'h1):(1'h0)]})) ?
                  {reg8, reg14[(4'h8):(3'h4)]} : $signed(({(!wire3)} > reg11)));
              reg12 <= {(($signed(reg6[(3'h6):(2'h2)]) == ((!reg13) >> (&reg10))) ?
                      (^$signed($signed(reg4))) : $unsigned({reg5[(2'h2):(2'h2)]}))};
              reg13 <= {reg14,
                  (wire2[(3'h6):(3'h6)] ^~ (^~(^~$unsigned((8'hb2)))))};
              reg14 <= reg4;
            end
        end
    end
  assign wire15 = $unsigned($unsigned({$unsigned(wire3[(3'h6):(2'h3)]),
                      $unsigned((reg9 > reg6))}));
  assign wire16 = reg6;
  assign wire17 = ((!reg10) ?
                      wire0 : $unsigned((((reg11 ?
                          reg8 : wire16) >= reg6[(1'h1):(1'h0)]) ~^ wire1[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if ((&((&(|$unsigned(wire0))) >> ((&$unsigned(reg7)) ?
          ({reg9} ? wire0[(3'h4):(3'h4)] : (reg11 <= reg11)) : ($signed(wire3) ?
              $unsigned(reg14) : reg4)))))
        begin
          reg18 <= (((~|reg10[(2'h3):(2'h2)]) ?
              $signed($signed(reg10[(5'h10):(2'h2)])) : wire0) > reg9[(1'h0):(1'h0)]);
          reg19 <= (wire3 ^ {wire1});
          if ((($signed($signed({reg12})) ?
              wire15 : (^($unsigned(reg6) ?
                  (reg13 ? reg5 : reg10) : reg11[(2'h2):(1'h1)]))) - (&wire2)))
            begin
              reg20 <= (wire3[(3'h5):(3'h4)] < reg18[(3'h7):(2'h2)]);
              reg21 <= wire17[(3'h5):(3'h5)];
              reg22 <= (reg21[(3'h4):(1'h1)] >= $signed($unsigned((8'ha5))));
              reg23 <= reg22;
              reg24 <= wire2;
            end
          else
            begin
              reg20 <= $unsigned((reg19[(3'h4):(1'h0)] == $signed($signed({(7'h43),
                  reg21}))));
              reg21 <= wire17;
            end
        end
      else
        begin
          reg18 <= {{$signed(reg22)},
              ($signed({reg18}) == (~|(wire16 >>> $signed((8'hbb)))))};
          reg19 <= {$unsigned($signed((wire15 << (~^reg9))))};
          if (reg21)
            begin
              reg20 <= (+reg18);
              reg21 <= (($signed($unsigned((&reg20))) ^ (((+reg8) >= (!reg8)) | (~^(~^wire15)))) * {$unsigned((^$signed(reg19)))});
              reg22 <= (reg21 < ($signed((wire17[(3'h7):(2'h3)] ?
                      (reg9 - reg24) : (reg8 ~^ reg24))) ?
                  $signed(($signed(reg22) ?
                      $signed((7'h42)) : $signed(reg5))) : $unsigned($signed((reg13 ?
                      wire1 : reg11)))));
              reg23 <= $signed($signed((&$signed($unsigned(reg23)))));
              reg24 <= $signed(reg23[(3'h7):(3'h6)]);
            end
          else
            begin
              reg20 <= {($signed((8'haa)) ?
                      (reg8[(2'h2):(2'h2)] ?
                          $signed((reg7 ?
                              reg12 : reg14)) : $signed(reg23)) : (-((~^reg14) ?
                          (7'h43) : $unsigned(reg7))))};
              reg21 <= (|((|{wire16[(3'h6):(3'h5)]}) ~^ (^$unsigned(reg11[(2'h3):(1'h0)]))));
              reg22 <= (wire17[(2'h3):(1'h1)] || reg20);
            end
          reg25 <= ($unsigned(($signed($signed(reg9)) ?
              (wire15[(3'h6):(3'h5)] ? reg23[(1'h0):(1'h0)] : (~|reg7)) : {reg5,
                  wire15})) == $unsigned({(8'hb1)}));
        end
      reg26 <= $unsigned((($signed($signed(wire2)) && $signed((wire15 ?
              wire16 : wire16))) ?
          reg13[(3'h5):(1'h1)] : reg21[(4'hb):(2'h3)]));
    end
  assign wire27 = (~^((((&(8'h9e)) ?
                          (reg4 ? (7'h42) : reg7) : (^wire3)) == ((reg26 ?
                              reg19 : reg24) ?
                          (wire17 ? reg22 : wire16) : $unsigned(reg20))) ?
                      (~^($signed(wire2) <= (-reg18))) : reg9[(3'h5):(1'h0)]));
  assign wire28 = {reg25[(1'h0):(1'h0)]};
  assign wire29 = (reg5[(4'hc):(4'hc)] ^~ ($unsigned(reg22) ?
                      reg10[(5'h15):(5'h15)] : (~$signed($signed(reg4)))));
  assign wire30 = ((8'hae) <= ((-$unsigned((wire28 ? reg24 : reg20))) ?
                      (~&{reg23[(1'h1):(1'h1)]}) : $unsigned(($unsigned((8'h9d)) ?
                          wire28 : {(8'hac), wire17}))));
endmodule
