module top
#(parameter param47 = ((((((8'h9d) ? (8'h9c) : (7'h41)) ? (^~(8'ha9)) : (+(7'h43))) ~^ {((8'ha2) || (8'hbf))}) ? ({((8'ha9) || (8'hbc)), ((8'hbf) == (8'hb7))} ? {{(8'haf)}, ((8'hb7) ? (8'ha8) : (8'haa))} : (((8'ha3) ^~ (8'haa)) == ((8'ha3) + (8'h9d)))) : (^(((8'hb2) <= (8'hbb)) ? ((8'ha7) ? (8'ha6) : (8'ha2)) : ((8'hb0) ? (8'ha0) : (7'h44))))) <= ({((8'hb7) == (^~(8'h9d))), (^~((8'hb6) * (7'h41)))} || (|(^~{(7'h44)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire16,
                 wire15,
                 wire4,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
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
                 (1'h0)};
  assign wire4 = (wire1[(4'hd):(1'h1)] ?
                     $unsigned($unsigned((~|{wire2,
                         wire1}))) : wire1[(4'he):(4'he)]);
  always
    @(posedge clk) begin
      reg5 <= $signed({wire2});
      if ({(|(((|wire2) == (8'hb3)) >>> reg5[(2'h2):(2'h2)])),
          $unsigned(($signed(wire3[(1'h1):(1'h1)]) > $unsigned((wire3 ?
              wire2 : wire3))))})
        begin
          reg6 <= (wire0 ? $unsigned(reg5[(1'h0):(1'h0)]) : $unsigned(wire2));
          if ($signed(wire3[(2'h2):(1'h0)]))
            begin
              reg7 <= wire4[(4'h8):(3'h6)];
              reg8 <= (((^~reg5) ^ wire3) ?
                  (~|wire4[(3'h6):(3'h4)]) : $signed({wire2[(2'h3):(2'h3)],
                      ({(8'hb1), wire3} << wire3[(3'h4):(2'h3)])}));
            end
          else
            begin
              reg7 <= reg6;
              reg8 <= ((8'hb1) - {((+(reg7 ?
                      wire0 : wire1)) >>> $unsigned(reg8))});
              reg9 <= $signed(((($signed(wire3) == (wire2 ?
                  wire1 : reg8)) < $unsigned($unsigned(wire0))) != (-$signed((wire0 ?
                  reg8 : wire3)))));
              reg10 <= wire4[(4'hd):(4'hd)];
              reg11 <= wire4;
            end
          reg12 <= $unsigned($unsigned(((-(~reg9)) ?
              $unsigned($unsigned(reg9)) : (((8'hb8) ? (8'ha5) : reg10) ?
                  wire2[(1'h0):(1'h0)] : wire1))));
        end
      else
        begin
          if ((~|$signed(($signed($unsigned(wire0)) < ((reg7 ? wire3 : reg10) ?
              $signed((8'hab)) : ((7'h43) ^~ (8'hb1)))))))
            begin
              reg6 <= reg6[(2'h2):(1'h1)];
              reg7 <= {wire0};
              reg8 <= (~|wire2[(1'h1):(1'h1)]);
            end
          else
            begin
              reg6 <= (reg12[(4'hc):(3'h6)] ?
                  $signed((reg5[(1'h0):(1'h0)] ?
                      $unsigned({reg11}) : reg6[(1'h0):(1'h0)])) : {$signed(wire3[(1'h0):(1'h0)]),
                      ($unsigned((&reg9)) > (~$signed(wire4)))});
              reg7 <= ({{{(7'h40), {(7'h40)}},
                          $signed(((8'ha6) ? (8'ha5) : reg12))},
                      reg12[(2'h2):(2'h2)]} ?
                  reg6 : (7'h43));
              reg8 <= $signed((({reg12[(4'ha):(4'h8)]} ^ reg12[(4'h9):(3'h6)]) << $unsigned(wire3)));
              reg9 <= reg5[(2'h3):(1'h1)];
              reg10 <= (reg5[(3'h6):(1'h1)] ?
                  reg10[(1'h0):(1'h0)] : (wire4[(3'h5):(1'h1)] ?
                      $unsigned(({reg8} ?
                          (wire3 >= wire0) : (~|reg9))) : {reg9[(2'h2):(2'h2)],
                          (~((8'hbf) ? reg7 : reg7))}));
            end
        end
      reg13 <= $signed(reg10);
      reg14 <= ((8'ha9) ?
          $unsigned((~(((8'hb3) >= reg8) != $signed(wire1)))) : (~|$unsigned(reg7)));
    end
  assign wire15 = $signed((($signed($unsigned((8'h9d))) ?
                      (|$signed(wire3)) : wire0) ^~ wire1));
  assign wire16 = (!(($signed({reg9,
                      wire15}) << $unsigned($signed(reg13))) >= reg14));
  always
    @(posedge clk) begin
      if ($signed(reg14[(4'hc):(2'h3)]))
        begin
          reg17 <= (|$unsigned((&($unsigned((8'h9f)) >= $unsigned(reg5)))));
          reg18 <= reg6[(1'h1):(1'h1)];
        end
      else
        begin
          if (reg6[(2'h3):(1'h0)])
            begin
              reg17 <= reg12;
              reg18 <= ((wire16 + (({wire3, wire16} + wire16) ?
                  $signed((reg14 ?
                      wire15 : reg12)) : wire0[(1'h0):(1'h0)])) || {reg17});
            end
          else
            begin
              reg17 <= (($unsigned(($unsigned((8'hb6)) | {reg6,
                      reg18})) != wire2) ?
                  (wire1[(4'h8):(4'h8)] ?
                      wire1[(4'hb):(4'hb)] : reg6) : $signed(wire0[(2'h3):(2'h2)]));
            end
          reg19 <= $unsigned({reg9[(3'h4):(1'h0)],
              ($unsigned({wire1}) ?
                  (-$signed((8'hb8))) : ((reg5 ? wire4 : wire15) ?
                      $unsigned((8'hb4)) : {reg10}))});
          if ((~&(((((8'hb1) == wire1) ? (wire4 | reg8) : $signed(reg18)) ?
                  {(&reg11)} : $signed(((7'h43) ? reg18 : wire15))) ?
              reg7 : $unsigned({((8'ha8) | (8'hac))}))))
            begin
              reg20 <= wire15;
              reg21 <= reg12[(2'h2):(1'h1)];
              reg22 <= (+({wire3} ?
                  {reg17[(3'h6):(3'h6)],
                      ((reg17 - reg19) ~^ $unsigned(reg10))} : (&$unsigned((reg9 * (8'ha7))))));
              reg23 <= $signed(reg8[(4'h8):(3'h4)]);
              reg24 <= $unsigned($signed((reg10[(2'h3):(2'h3)] ?
                  $unsigned($signed((8'hbe))) : ((reg14 ?
                      wire3 : reg18) > (reg17 << wire16)))));
            end
          else
            begin
              reg20 <= $signed((($unsigned($unsigned(wire15)) ?
                      ((^~wire0) && (~|wire4)) : (!reg13)) ?
                  (reg14 ?
                      reg23 : $signed({reg8, wire0})) : $unsigned((~|reg11))));
              reg21 <= $unsigned({($unsigned((reg24 < wire0)) ?
                      $signed({reg12, reg19}) : reg24),
                  $unsigned($unsigned(reg20))});
            end
          reg25 <= $unsigned((($signed($unsigned(reg14)) <<< $unsigned((8'ha3))) ~^ {$unsigned((reg11 ?
                  reg11 : reg18))}));
        end
      reg26 <= (!(^~((^(reg14 + reg6)) | {((7'h42) <= reg23)})));
      reg27 <= ($unsigned(wire1[(1'h0):(1'h0)]) ?
          {reg24,
              ((|reg25) ?
                  (reg13 - ((8'hbe) ? (8'hb2) : reg5)) : ({wire16, wire2} ?
                      (reg8 ? reg11 : wire4) : {(8'hb8), wire15}))} : (reg20 ?
              reg5 : reg21[(2'h2):(2'h2)]));
      reg28 <= ($signed((|($unsigned((8'hae)) ?
          $unsigned(wire0) : $signed(reg11)))) >>> $signed((!($signed(reg24) ?
          (reg17 <= (7'h42)) : reg18[(2'h2):(2'h2)]))));
    end
  assign wire29 = reg14;
  assign wire30 = {((reg28[(3'h6):(2'h2)] != wire16[(1'h1):(1'h1)]) > (reg11 && ((reg26 ^ (8'hbe)) <= $signed(reg10)))),
                      (($unsigned((reg9 & wire0)) ?
                              reg7[(4'hd):(4'hd)] : {$signed(reg19)}) ?
                          (^~(^wire29)) : $signed((~((8'hac) + reg19))))};
  assign wire31 = $signed($signed(reg19[(3'h6):(3'h6)]));
  assign wire32 = $unsigned(reg13);
  assign wire33 = ($signed($unsigned($unsigned($unsigned(reg11)))) <<< (({reg24} ?
                      ($signed(reg26) ^ reg5[(2'h3):(1'h0)]) : $signed((wire2 >> reg6))) >= (((+reg27) > wire32[(3'h5):(3'h5)]) && ((-wire30) ?
                      $unsigned(reg23) : $unsigned(reg26)))));
  assign wire34 = ($unsigned((reg26 ?
                          $signed({reg11, (8'h9d)}) : $signed({wire29,
                              reg13}))) ?
                      reg6[(1'h0):(1'h0)] : $signed($signed((reg24 & reg19))));
  assign wire35 = {({wire0, wire29[(3'h7):(3'h6)]} != $signed((~|reg23)))};
  assign wire36 = $unsigned(($unsigned(((!wire3) ?
                      $signed(wire0) : ((8'hb6) ?
                          wire32 : wire3))) ^ (reg5[(1'h1):(1'h0)] > $signed(reg18))));
  assign wire37 = wire0[(2'h2):(1'h0)];
  assign wire38 = ($signed($signed((8'hab))) >> (wire0 | reg22[(4'hb):(4'ha)]));
  assign wire39 = (!$unsigned($unsigned(reg17)));
  assign wire40 = $signed((|(~|$unsigned($signed(wire34)))));
  always
    @(posedge clk) begin
      if ((($unsigned(wire0[(3'h4):(3'h4)]) ?
          ($unsigned({wire4, reg17}) ^~ ((^wire15) ?
              wire35 : wire4[(4'h8):(3'h7)])) : (~^$unsigned({reg8,
              reg24}))) ^ wire38[(3'h7):(2'h3)]))
        begin
          reg41 <= (-$signed($unsigned(((reg20 ? wire2 : reg23) ?
              $signed((8'haf)) : wire40[(4'h8):(2'h3)]))));
          reg42 <= ((reg12 >= (wire1[(4'h9):(1'h0)] ?
                  {(+reg20)} : $signed(wire2[(2'h2):(1'h1)]))) ?
              {$signed($unsigned((wire35 ? wire0 : wire40)))} : (+reg19));
          reg43 <= (~^(reg9 ?
              $signed($unsigned((wire40 ?
                  wire1 : reg6))) : (reg14 || $signed($unsigned(wire3)))));
        end
      else
        begin
          reg41 <= ($unsigned((~^(-wire37))) ?
              $signed($unsigned($unsigned((reg11 * reg23)))) : $signed(reg25));
          if ($unsigned(({{reg6[(2'h3):(2'h3)], (~&wire35)},
              $unsigned((wire30 & reg41))} ^~ (((wire3 ? (8'hbc) : reg42) ?
              reg10[(3'h5):(1'h0)] : reg22) && (!(reg13 && reg7))))))
            begin
              reg42 <= wire36;
            end
          else
            begin
              reg42 <= ((|reg7[(5'h11):(4'h8)]) ^ $signed(wire35));
              reg43 <= reg25;
              reg44 <= {($signed($unsigned($signed(reg17))) | reg10),
                  ((reg14[(5'h11):(3'h5)] >>> {(&(8'haf))}) ?
                      (($unsigned(wire3) <<< wire29[(3'h6):(2'h2)]) ?
                          reg22 : {(reg24 <= (8'ha1)),
                              $unsigned(reg18)}) : $unsigned(({wire2,
                          reg22} & wire29)))};
            end
        end
      reg45 <= $signed($unsigned(((wire38[(4'hb):(1'h0)] >>> {wire0}) << wire31[(4'h8):(3'h5)])));
      reg46 <= reg5;
    end
endmodule
