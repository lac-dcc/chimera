module top
#(parameter param47 = ((^~(({(8'ha7)} << ((8'ha2) ? (7'h42) : (8'hb3))) <= (^~((8'ha1) ? (8'ha3) : (8'hb1))))) ^~ (-(((-(8'hb2)) ? ((8'ha3) ? (7'h40) : (8'haa)) : ((8'ha6) ? (8'hba) : (8'hb1))) == (((8'haa) ? (8'hb7) : (8'ha6)) ? ((8'hb0) | (8'hbe)) : (&(8'h9c)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = $unsigned(($signed(wire2) ^~ (wire2 ^ (8'ha2))));
  assign wire5 = ($signed({(wire2 ?
                         (wire0 < wire0) : wire4[(4'h8):(3'h4)])}) - (8'h9e));
  assign wire6 = $signed($signed(($unsigned((|(8'hae))) ^ {{wire3, (8'ha0)}})));
  assign wire7 = wire0;
  assign wire8 = wire4[(2'h3):(1'h1)];
  assign wire9 = ((8'hbf) ? wire8[(4'h8):(2'h2)] : wire5);
  always
    @(posedge clk) begin
      reg10 <= $unsigned({$unsigned($unsigned((wire5 ? wire0 : (8'h9e))))});
      reg11 <= $signed($unsigned({$unsigned(wire2), wire7}));
      if ({$unsigned($signed(reg10))})
        begin
          if (wire0[(3'h7):(1'h0)])
            begin
              reg12 <= (|$signed((-{(&reg10)})));
              reg13 <= (^{(wire3[(1'h0):(1'h0)] ?
                      wire6[(3'h5):(3'h5)] : (reg12 || $signed((8'ha3)))),
                  $signed($signed((wire5 ? wire3 : wire2)))});
            end
          else
            begin
              reg12 <= (($unsigned(($unsigned(wire0) != reg13)) ?
                  (((+reg13) ?
                      (wire1 >>> reg10) : (~&wire9)) ~^ {{wire1}}) : $unsigned(((^~wire7) << (reg10 < reg13)))) >> (wire5[(1'h1):(1'h1)] ?
                  wire1 : (8'hbe)));
              reg13 <= ((wire9 << {((reg11 ? (8'hb9) : wire7) ^ $signed(wire5)),
                      $signed((-wire7))}) ?
                  $signed($signed(((~&reg12) ^~ (wire6 * wire7)))) : reg10[(2'h2):(1'h0)]);
              reg14 <= {(^$unsigned(((~wire7) ?
                      (8'hb3) : (reg12 ? wire8 : reg10))))};
            end
          reg15 <= wire1;
        end
      else
        begin
          if ($unsigned(((8'hab) == (|(&{wire8})))))
            begin
              reg12 <= $signed({wire1[(4'hf):(2'h2)]});
            end
          else
            begin
              reg12 <= wire9[(1'h1):(1'h1)];
              reg13 <= ($signed({{$signed((8'ha3)), (8'haf)}}) ? wire7 : reg10);
              reg14 <= $unsigned(((+{$signed(wire5)}) <= (^{$signed(reg15)})));
              reg15 <= wire1[(1'h0):(1'h0)];
            end
          reg16 <= $signed($signed($signed($unsigned((8'hbf)))));
          reg17 <= wire7[(1'h1):(1'h1)];
          reg18 <= (~^(~|($signed((wire9 ? wire6 : reg13)) ?
              (^$unsigned((8'hbd))) : reg14[(1'h0):(1'h0)])));
          reg19 <= (~$unsigned(({$unsigned(wire4)} < (|{wire8, reg15}))));
        end
      if ({(8'h9c)})
        begin
          reg20 <= ({$signed((^~(wire3 < wire1))), wire9} ?
              wire9 : $unsigned($signed(reg12[(5'h12):(4'hf)])));
          if (({{(((8'ha1) ? reg14 : reg16) || (reg10 ?
                      wire9 : reg15))}} >> {{($signed(wire6) ^~ (reg15 || reg12))}}))
            begin
              reg21 <= (reg10 ?
                  $signed({({wire7, wire9} != $unsigned(wire7)),
                      (~|(!(8'hb3)))}) : (~^(~&(wire2[(4'h8):(1'h0)] | $signed(reg11)))));
              reg22 <= reg11;
            end
          else
            begin
              reg21 <= wire1;
            end
          reg23 <= ((8'ha3) >>> {(reg15 ~^ $signed((reg19 << reg12)))});
          reg24 <= wire2[(1'h1):(1'h0)];
          if (reg17[(3'h5):(2'h3)])
            begin
              reg25 <= $unsigned((reg16[(1'h1):(1'h1)] ?
                  ((reg20[(3'h4):(2'h2)] ?
                      (~&wire4) : $signed((8'hbe))) | reg18[(3'h5):(1'h0)]) : $signed($signed($unsigned(reg18)))));
              reg26 <= $unsigned($signed((-{(&wire6)})));
              reg27 <= (&wire2);
            end
          else
            begin
              reg25 <= (reg12[(5'h12):(3'h5)] ? reg17 : $unsigned(reg10));
              reg26 <= wire4[(3'h4):(1'h1)];
            end
        end
      else
        begin
          reg20 <= ($signed(($unsigned(reg25) != reg16[(2'h2):(1'h1)])) ?
              (reg25[(2'h3):(2'h3)] ~^ $signed((reg13[(4'h9):(4'h8)] && (reg22 && wire5)))) : (+reg13[(4'hc):(3'h4)]));
          if (wire5[(2'h2):(2'h2)])
            begin
              reg21 <= wire9[(1'h0):(1'h0)];
              reg22 <= reg26[(5'h11):(3'h4)];
            end
          else
            begin
              reg21 <= {(wire2[(5'h13):(1'h1)] - ((-(-reg21)) == reg20))};
              reg22 <= reg26;
            end
          reg23 <= {($unsigned(reg26) ?
                  (reg11[(1'h1):(1'h0)] ?
                      reg15[(3'h4):(2'h2)] : wire2) : ($signed((reg25 | reg20)) ?
                      wire1[(4'h8):(3'h5)] : (reg10 >> $unsigned(wire8)))),
              wire5};
          if (($unsigned((|((~^(8'hbf)) ? $signed(wire1) : (~&reg21)))) ?
              ((+((~reg11) ? reg17 : $unsigned(wire4))) ?
                  $unsigned($signed(wire2[(4'he):(3'h7)])) : {$signed({reg25,
                          reg21})}) : $unsigned(((&(8'hb2)) && (8'hba)))))
            begin
              reg24 <= $unsigned(($signed($signed(reg21)) ?
                  reg14[(2'h2):(1'h1)] : ($signed((~&reg21)) >> $signed((wire9 ?
                      reg12 : (8'hb2))))));
              reg25 <= reg18[(5'h13):(3'h4)];
              reg26 <= $signed(reg20);
              reg27 <= (wire0[(2'h3):(1'h0)] ? (&reg14) : wire9[(1'h1):(1'h0)]);
              reg28 <= $signed((reg18[(2'h3):(1'h1)] ?
                  (wire8[(1'h1):(1'h1)] <<< wire2) : (+{(wire7 ?
                          reg11 : reg22)})));
            end
          else
            begin
              reg24 <= (wire4 ? (~&(-reg19)) : reg14);
              reg25 <= reg11;
              reg26 <= $unsigned(reg14[(1'h0):(1'h0)]);
              reg27 <= wire5;
              reg28 <= reg12;
            end
          reg29 <= reg20;
        end
    end
  always
    @(posedge clk) begin
      reg30 <= wire1[(3'h5):(3'h4)];
    end
  assign wire31 = $unsigned($unsigned((({reg14, wire1} << ((8'haf) << reg14)) ?
                      $unsigned((reg18 ?
                          reg19 : reg12)) : reg19[(4'hd):(4'ha)])));
  assign wire32 = ($signed($unsigned((^$signed(wire4)))) | (^~wire9));
  assign wire33 = {(({$unsigned(wire8)} <<< reg15) ?
                          (wire9[(2'h2):(2'h2)] < ((reg30 ?
                              wire4 : reg29) * (reg22 ~^ reg18))) : (reg13 & (|(reg30 ?
                              reg30 : reg15)))),
                      ($signed(reg16[(3'h6):(1'h1)]) | (~&$signed({reg24,
                          reg10})))};
  assign wire34 = ((reg24 >= $signed($signed(reg22))) ^ (7'h42));
  assign wire35 = (((^~reg25) != ($unsigned($signed(reg29)) ?
                          (8'haf) : ((wire33 ? (8'hb6) : reg17) ?
                              (wire6 > reg21) : reg18))) ?
                      $signed(reg27) : reg23);
  assign wire36 = ({($signed((reg22 >= reg25)) && ({wire7,
                          reg24} && (~|reg24))),
                      $signed({(reg30 >= (8'ha5)),
                          $unsigned(reg27)})} < $signed($signed((^(reg12 + wire7)))));
  assign wire37 = (~(((reg12[(1'h0):(1'h0)] ^~ ((8'hae) - wire4)) ?
                      ($unsigned(reg13) ?
                          (^~wire32) : {reg20, reg16}) : (reg11 ?
                          (wire0 ?
                              wire36 : (8'ha9)) : $unsigned(wire1))) >= ((wire6[(2'h3):(1'h0)] ?
                      wire4 : $signed(wire6)) << ((~reg27) | $signed(reg21)))));
  always
    @(posedge clk) begin
      reg38 <= (((reg16 < (~|wire36[(1'h1):(1'h0)])) != wire36) > ({wire35,
              $signed((~|(8'hb4)))} ?
          reg24 : $signed($signed($unsigned(reg20)))));
      reg39 <= reg29[(3'h4):(2'h2)];
      reg40 <= wire9[(2'h2):(2'h2)];
      reg41 <= (wire9 ?
          wire32 : $signed($unsigned($unsigned(((8'h9f) == wire9)))));
      if ($unsigned($signed($unsigned((reg21 ?
          (wire0 ? (7'h44) : (8'ha2)) : $signed(wire33))))))
        begin
          reg42 <= (+$signed($unsigned((-(reg11 ? reg18 : reg24)))));
          reg43 <= (reg13[(4'he):(1'h1)] ?
              {reg13[(3'h6):(3'h4)]} : ((wire31[(3'h6):(3'h6)] && (~|{reg17,
                      reg40})) ?
                  reg28[(3'h4):(3'h4)] : (7'h43)));
          reg44 <= (|($signed(wire1[(4'hf):(4'hd)]) ^ reg38));
        end
      else
        begin
          reg42 <= $signed(wire9[(1'h0):(1'h0)]);
          reg43 <= $unsigned((reg40[(4'h9):(4'h8)] ?
              (($unsigned(reg21) <<< $signed(reg22)) ?
                  {(^(8'hac)),
                      ((8'hb5) ?
                          wire6 : reg42)} : ((wire33 <<< reg25) == (8'hba))) : $signed((^$signed(reg18)))));
          reg44 <= (^(wire5[(1'h1):(1'h1)] ?
              ({wire32[(4'ha):(4'h8)], {reg39, reg12}} ?
                  {$unsigned(wire36)} : (reg28 | (!wire2))) : $unsigned($unsigned((8'ha5)))));
          if ($signed(reg26))
            begin
              reg45 <= wire31;
              reg46 <= ((^($signed(wire32) ?
                  $unsigned(reg20[(3'h6):(2'h2)]) : wire36)) >= $unsigned($signed((&$signed(wire37)))));
            end
          else
            begin
              reg45 <= ($signed({(+wire1),
                      ($signed(reg10) ? wire6 : (~^reg25))}) ?
                  (wire37[(4'hb):(3'h6)] ?
                      (reg42[(4'h9):(4'h9)] ?
                          wire37[(4'hd):(3'h5)] : reg28[(3'h6):(2'h3)]) : {$unsigned(reg44)}) : reg12[(1'h1):(1'h1)]);
              reg46 <= reg26[(4'hf):(4'he)];
            end
        end
    end
endmodule
