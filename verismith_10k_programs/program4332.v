module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire23,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire5 = ((~^$unsigned((7'h41))) == $signed((wire4 ?
                     ((~wire0) <= (8'hb6)) : ($unsigned(wire3) ?
                         (8'ha0) : wire3[(1'h1):(1'h0)]))));
  assign wire6 = $unsigned(wire2);
  assign wire7 = $unsigned($signed((!((~&wire1) < wire1))));
  assign wire8 = $unsigned($unsigned(wire7));
  assign wire9 = (+wire1[(1'h0):(1'h0)]);
  assign wire10 = wire5;
  assign wire11 = {wire10[(2'h2):(1'h0)], wire7[(3'h5):(2'h3)]};
  assign wire12 = (+(~$signed($unsigned(wire2[(3'h5):(1'h0)]))));
  assign wire13 = $unsigned((wire9[(3'h4):(3'h4)] >= $unsigned($signed(wire10[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg14 <= ($signed($unsigned((~^(wire12 ? (8'h9c) : wire5)))) ?
          (|($signed($signed((8'ha3))) ?
              (-$unsigned((8'ha8))) : $signed((8'ha7)))) : (~^((wire9 == $signed(wire8)) ?
              wire8 : (!$signed(wire1)))));
      if (wire9)
        begin
          reg15 <= ((wire11[(3'h7):(2'h2)] | (wire1[(3'h5):(3'h5)] ?
              (wire13 ?
                  (wire7 <= wire10) : (~|wire13)) : $signed((wire1 & wire3)))) <<< $signed($unsigned($signed((~wire7)))));
          reg16 <= (~&(^~(wire2 < wire3)));
          reg17 <= ((8'h9e) ?
              (&($signed(wire1[(1'h0):(1'h0)]) && {(wire13 ? wire9 : wire1),
                  (reg16 ? wire2 : wire2)})) : wire7);
        end
      else
        begin
          reg15 <= wire3;
          reg16 <= wire1[(3'h5):(2'h3)];
          reg17 <= (+$signed({$unsigned((wire1 & wire6)), {reg15}}));
          if ((&(+reg17[(4'h8):(1'h1)])))
            begin
              reg18 <= $unsigned((wire5 ? wire9 : (8'hae)));
              reg19 <= $signed(wire13[(3'h5):(1'h1)]);
            end
          else
            begin
              reg18 <= ($signed({wire4[(2'h2):(2'h2)],
                  $unsigned($signed((8'haa)))}) > wire8);
            end
          if ((wire3 - ((~{wire13,
              $unsigned(wire8)}) ^~ (|(wire10[(2'h3):(2'h3)] ?
              (reg14 && (8'hb2)) : (reg19 ? reg17 : wire11))))))
            begin
              reg20 <= {wire1[(2'h3):(1'h1)],
                  $signed((wire0[(1'h1):(1'h0)] ?
                      reg14[(2'h2):(1'h0)] : (((8'hbe) ? (8'h9c) : wire7) ?
                          (~wire12) : wire3[(1'h0):(1'h0)])))};
              reg21 <= ((8'hb5) ?
                  (~|wire4[(1'h0):(1'h0)]) : $unsigned((+(^~wire12))));
              reg22 <= (~&(($unsigned((-reg20)) ? reg18 : $unsigned(reg20)) ?
                  ($signed($unsigned(wire0)) ?
                      reg18 : reg16) : (wire10 > ($unsigned(reg19) ?
                      $signed(wire0) : (reg14 ? wire3 : wire10)))));
            end
          else
            begin
              reg20 <= reg21;
            end
        end
    end
  assign wire23 = (wire3[(2'h2):(2'h2)] && $unsigned({$unsigned($signed(wire2))}));
  always
    @(posedge clk) begin
      if (((reg14[(2'h2):(1'h0)] < (wire8[(4'h8):(2'h3)] != ((^~wire23) & (wire0 >= reg15)))) - (^(($signed(wire7) ?
          (reg17 ? (8'hb4) : (8'ha7)) : wire7) != (|$unsigned((8'ha6)))))))
        begin
          reg24 <= ($signed($unsigned(wire13[(3'h5):(1'h1)])) ?
              $unsigned((8'hb0)) : (reg21 ?
                  {reg20,
                      wire3[(2'h2):(1'h0)]} : $unsigned(wire2[(3'h4):(3'h4)])));
          reg25 <= wire12[(1'h1):(1'h0)];
          reg26 <= $signed($signed($signed(wire23[(2'h2):(2'h2)])));
          reg27 <= $signed($unsigned($unsigned({$signed(wire9)})));
          reg28 <= wire6;
        end
      else
        begin
          reg24 <= {(($unsigned(reg26[(4'hd):(3'h6)]) <= reg14[(1'h0):(1'h0)]) > (((8'hb6) ?
                  $signed(reg15) : $unsigned(reg27)) ^ (&(wire1 ?
                  wire5 : reg15)))),
              (wire4[(2'h3):(1'h1)] ?
                  $unsigned({$unsigned(wire12)}) : {$unsigned($unsigned(reg27))})};
          reg25 <= $signed((((-(+wire3)) > ({reg14} ?
                  (reg24 ? reg21 : wire3) : $signed(wire8))) ?
              $signed($unsigned($unsigned((8'ha3)))) : reg14));
        end
      reg29 <= wire5;
    end
  assign wire30 = {$signed($unsigned((~|(~&wire7)))), $unsigned(wire7)};
  assign wire31 = $unsigned(wire7[(1'h0):(1'h0)]);
  assign wire32 = $unsigned($unsigned((((7'h44) ?
                      wire5[(3'h4):(3'h4)] : reg29) <= (+(wire1 ?
                      wire8 : reg26)))));
  assign wire33 = ($unsigned(($signed((8'hb1)) <= (wire23 | $unsigned(wire3)))) ?
                      wire23[(4'hc):(4'h9)] : wire11);
  always
    @(posedge clk) begin
      if ((((reg21 - (^~{(7'h43)})) ?
          (|{wire12, $unsigned(reg20)}) : $unsigned(((reg19 ?
              reg21 : wire2) && wire10[(1'h0):(1'h0)]))) >>> reg27))
        begin
          reg34 <= (((wire31[(3'h6):(2'h2)] ?
                  $unsigned((~&reg26)) : wire2[(2'h2):(1'h1)]) ?
              (wire9[(2'h3):(2'h2)] & $signed({wire5})) : $signed($signed(reg26))) & $signed(({$signed(reg26)} ?
              reg27[(2'h3):(1'h1)] : (+(|wire31)))));
          if ($unsigned({$signed($signed($signed(reg27)))}))
            begin
              reg35 <= $signed(((wire2[(2'h3):(1'h1)] ?
                      (!(reg20 < wire2)) : reg21) ?
                  ((-$unsigned(wire5)) ?
                      ({wire0, (8'hb9)} >= (^~wire6)) : $unsigned({reg25,
                          (7'h41)})) : ((&(wire10 ? reg14 : wire33)) ?
                      ($unsigned(wire13) ?
                          (^~wire1) : (wire5 ?
                              wire30 : wire12)) : ((wire23 + wire9) ?
                          wire6 : wire5))));
              reg36 <= $unsigned({(reg15[(1'h1):(1'h0)] ?
                      $unsigned($signed((7'h43))) : {$unsigned(reg28)}),
                  ($signed($signed(reg17)) ? $signed((~|wire7)) : (8'ha0))});
              reg37 <= $unsigned(($signed($unsigned((reg16 ?
                  (8'ha6) : reg14))) & (~|reg26[(4'hd):(4'hc)])));
            end
          else
            begin
              reg35 <= {($signed({reg27[(4'hb):(1'h1)]}) != (($signed(reg15) ?
                      (^~(8'hbe)) : $unsigned((8'hbc))) <<< $unsigned((8'ha4))))};
            end
          reg38 <= {(($signed({reg14}) >>> $unsigned({reg37})) > wire6),
              ((~|(~&((7'h44) ^ (8'hb4)))) ?
                  {(|reg24[(3'h5):(3'h4)])} : $unsigned($unsigned((~|reg22))))};
        end
      else
        begin
          reg34 <= (8'hb8);
          reg35 <= $signed($unsigned($signed(((reg36 ^~ reg21) ?
              reg35 : wire2[(2'h2):(2'h2)]))));
          reg36 <= {wire13[(4'hc):(4'h9)]};
          reg37 <= wire5;
          reg38 <= {(~^(($unsigned(reg14) ~^ {reg37}) ?
                  wire23 : ((reg24 < reg36) && wire32[(5'h11):(4'hd)]))),
              reg16[(3'h5):(3'h5)]};
        end
      reg39 <= ((reg34[(1'h1):(1'h0)] ? wire12 : reg21) ?
          (^({(reg16 < wire8),
              (wire13 - wire2)} & reg16)) : (~^(^(&reg16[(4'ha):(4'ha)]))));
      reg40 <= ((($signed(wire7[(3'h5):(1'h0)]) << reg14[(2'h3):(1'h0)]) ?
          (^~$signed((|wire10))) : wire33[(3'h4):(3'h4)]) <<< $unsigned(($unsigned((wire5 == reg36)) > ((~reg35) ^ (wire7 ^~ reg26)))));
      reg41 <= wire2;
      reg42 <= (((|$signed($signed(reg29))) <= $unsigned(wire9[(2'h2):(2'h2)])) - {$signed($unsigned((reg36 >= wire31))),
          wire3});
    end
endmodule
