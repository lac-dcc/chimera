module top
#(parameter param30 = {(8'ha9), ((8'ha5) ? (~^{((8'ha6) <<< (8'ha5)), ((8'hbd) * (8'hb3))}) : (((~^(8'hab)) ^~ ((7'h40) >>> (8'hb2))) ? ((~(7'h40)) ? (-(8'haa)) : {(8'hb9)}) : ((8'h9e) << ((8'hac) >> (8'hab)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire29,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg9,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = wire4;
  assign wire7 = (~|$signed((wire4 ?
                     (wire6[(3'h7):(1'h0)] != wire2[(2'h2):(1'h1)]) : $unsigned({wire6,
                         (8'ha8)}))));
  assign wire8 = wire5;
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg9 <= (+$signed((!wire4)));
          if (((&$unsigned(wire0)) ?
              $signed(((&$unsigned(wire7)) ?
                  (~^wire6[(3'h5):(3'h5)]) : {(wire5 << wire1),
                      $signed(wire0)})) : {(8'hb9), reg9}))
            begin
              reg10 <= {{$unsigned((((8'ha7) ? reg9 : wire8) ?
                          (reg9 | wire7) : ((7'h44) ? (8'hb5) : wire0)))},
                  ($unsigned(($unsigned(wire8) < $signed(wire4))) || $unsigned((wire6 ?
                      wire6[(3'h7):(3'h7)] : $signed(wire3))))};
              reg11 <= ($unsigned($unsigned((|wire8[(3'h6):(1'h0)]))) ?
                  $signed((reg10 ?
                      $unsigned({(8'h9d),
                          (8'hbb)}) : (^$signed(wire2)))) : reg9);
              reg12 <= (+wire2);
            end
          else
            begin
              reg10 <= $signed({(&wire1[(2'h2):(2'h2)]),
                  $signed(({wire5, wire5} ? (wire6 && wire2) : wire8))});
              reg11 <= wire0[(4'h8):(4'h8)];
            end
        end
      else
        begin
          if ($unsigned(reg10))
            begin
              reg9 <= (^wire6);
              reg10 <= (~&(wire6 ?
                  wire0 : $unsigned((reg9 ?
                      reg12[(3'h4):(2'h3)] : wire2[(2'h2):(1'h0)]))));
              reg11 <= $signed($signed(wire1));
              reg12 <= (^~(|(&wire5)));
              reg13 <= $unsigned((+(wire4 ?
                  $signed($signed((8'hbc))) : (^~$signed(wire6)))));
            end
          else
            begin
              reg9 <= ($signed($unsigned(($signed(reg9) == reg13[(4'hd):(2'h2)]))) ^ $signed($unsigned(wire1[(3'h5):(1'h1)])));
            end
          if ($signed(wire3))
            begin
              reg14 <= ({(reg12[(3'h6):(3'h6)] ?
                          (wire5 ?
                              (^wire0) : {wire5}) : reg13[(3'h6):(2'h2)])} ?
                  (8'hb2) : ((reg9[(3'h6):(1'h0)] != wire5) ^ ((8'haa) ?
                      wire6[(3'h5):(1'h0)] : (8'hbb))));
              reg15 <= (wire7 != $signed($unsigned(wire7[(2'h3):(1'h0)])));
              reg16 <= wire5[(4'hd):(4'hc)];
            end
          else
            begin
              reg14 <= $signed((reg12 ?
                  $unsigned((((8'h9e) * (8'hba)) >> {wire2,
                      (8'hb2)})) : (+(reg10[(1'h1):(1'h1)] ~^ (reg12 + reg15)))));
              reg15 <= {($unsigned({(wire0 ?
                          reg14 : wire2)}) * wire4[(2'h3):(1'h1)])};
              reg16 <= (8'h9c);
              reg17 <= {$signed(((^~$signed(wire0)) ^ wire6[(3'h6):(2'h3)])),
                  {wire1[(3'h5):(1'h0)], $signed($signed(reg10))}};
            end
          reg18 <= (^~(+(^reg14)));
          reg19 <= (wire3[(2'h3):(1'h0)] ?
              wire1 : $unsigned($unsigned($signed(reg13))));
        end
      reg20 <= $unsigned($signed({$signed((~&wire8))}));
      reg21 <= wire2;
      reg22 <= $signed(wire2);
      reg23 <= (!((~&(-wire1[(5'h12):(2'h2)])) << ($unsigned($unsigned((8'ha8))) < ((~|reg12) ?
          (wire0 ? reg19 : (8'hb6)) : reg11))));
    end
  always
    @(posedge clk) begin
      if (wire8)
        begin
          reg24 <= $unsigned(reg11);
          reg25 <= (({(~^(wire3 >> reg18)),
                  $signed((reg22 ? wire3 : reg10))} > (~&$signed({wire5,
                  wire3}))) ?
              wire4[(1'h1):(1'h0)] : {$signed((wire2[(1'h0):(1'h0)] || (~reg24))),
                  $unsigned(((~^reg20) <= $unsigned(reg14)))});
        end
      else
        begin
          if (($signed($unsigned(((reg12 <= reg21) || (wire7 ?
                  reg25 : reg20)))) ?
              (~&(-wire5[(4'h8):(1'h1)])) : (+(~^$unsigned(wire8[(3'h4):(3'h4)])))))
            begin
              reg24 <= {wire5[(3'h7):(3'h5)]};
            end
          else
            begin
              reg24 <= $unsigned({{(~(wire7 ~^ reg23))},
                  (!(~|reg15[(2'h3):(2'h3)]))});
              reg25 <= reg15[(1'h1):(1'h1)];
              reg26 <= $signed((reg10 == (-{$unsigned(wire4)})));
            end
        end
      reg27 <= wire3[(3'h5):(1'h0)];
      reg28 <= (^$unsigned(reg17));
    end
  assign wire29 = reg17;
endmodule
