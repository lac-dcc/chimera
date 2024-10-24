module top
#(parameter param21 = {(8'hbc), {{(((8'ha7) ^~ (8'hbb)) ? (^~(8'hab)) : ((8'hb5) ? (8'h9c) : (8'hb1)))}, {((7'h44) ? ((8'hb2) > (8'hb3)) : ((8'ha6) << (8'hb8))), ((^(8'hb8)) * ((8'ha7) ? (7'h42) : (8'ha8)))}}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire7,
                 wire4,
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
                 reg8,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {$signed(wire3[(4'hf):(3'h4)])};
  always
    @(posedge clk) begin
      reg5 <= ($unsigned((^~(+((8'hbf) >>> wire3)))) ?
          ($signed(((wire1 ^~ wire2) ? wire2 : $unsigned(wire4))) ?
              (~^(wire0[(4'hd):(1'h1)] ?
                  (wire4 >>> wire1) : $signed(wire2))) : (-wire0[(2'h3):(1'h0)])) : ($unsigned($unsigned($signed(wire1))) + wire2[(3'h4):(2'h2)]));
      reg6 <= (({(wire3 == ((8'haa) ? reg5 : (8'h9f))),
              wire2[(3'h4):(3'h4)]} >= {wire1[(3'h4):(2'h2)],
              ((reg5 || wire1) ? wire3[(4'hc):(3'h7)] : $unsigned((7'h41)))}) ?
          ($unsigned(wire2[(3'h5):(2'h3)]) ~^ $signed(wire1[(1'h1):(1'h0)])) : $signed($unsigned(($signed(wire2) ?
              $unsigned(wire3) : wire4))));
    end
  assign wire7 = {(^~$signed({{wire2}, {(8'hb4)}})),
                     ((~|($unsigned(wire0) + ((8'had) ^~ wire2))) ?
                         {({wire3} == {wire0, wire0}),
                             wire2[(1'h0):(1'h0)]} : ((~&wire2) >> (+wire3[(4'hc):(3'h6)])))};
  always
    @(posedge clk) begin
      reg8 <= (wire2[(2'h2):(2'h2)] ~^ $unsigned({(wire2 << $unsigned(wire4)),
          (|(~wire7))}));
      reg9 <= $unsigned($unsigned($signed((wire1 >= (wire1 || wire1)))));
      reg10 <= $unsigned(wire0);
      if (reg6[(3'h4):(1'h0)])
        begin
          if ((^~$unsigned($unsigned(((wire7 ? wire7 : wire2) ?
              $unsigned((8'hba)) : $unsigned(reg6))))))
            begin
              reg11 <= $unsigned({reg5[(4'hb):(1'h1)], wire4});
              reg12 <= $signed($unsigned(({(^reg9), reg6[(2'h3):(1'h1)]} ?
                  (reg11[(4'ha):(1'h0)] | reg11[(4'h9):(4'h9)]) : ((reg5 * (8'h9e)) ?
                      $signed(wire2) : $unsigned(wire7)))));
              reg13 <= $signed($signed(wire2[(2'h2):(2'h2)]));
              reg14 <= (reg13 ?
                  {(|($unsigned(reg11) <= wire2))} : reg10[(2'h2):(2'h2)]);
              reg15 <= reg13;
            end
          else
            begin
              reg11 <= (-(reg6 <<< (reg14[(1'h0):(1'h0)] ?
                  ((!wire0) < $signed((7'h40))) : wire4[(3'h7):(2'h2)])));
              reg12 <= $unsigned((~reg6));
              reg13 <= {$unsigned((reg10[(2'h2):(1'h1)] ?
                      reg13[(4'h9):(3'h6)] : ((wire3 ?
                          reg12 : wire0) == reg10[(1'h0):(1'h0)]))),
                  (^$signed(($unsigned(wire4) ?
                      ((8'hb8) >= reg15) : $unsigned(reg5))))};
              reg14 <= (~&((wire0[(3'h6):(1'h0)] > ($signed(reg12) >>> $unsigned(wire0))) ?
                  (reg8[(2'h2):(1'h1)] ?
                      $signed($signed((8'ha0))) : wire4) : (+reg6)));
            end
        end
      else
        begin
          reg11 <= reg13[(3'h6):(1'h0)];
          reg12 <= ((8'ha3) * reg15[(2'h2):(2'h2)]);
          if (($unsigned(reg6[(1'h1):(1'h0)]) ^~ $signed({(^~$signed(reg5)),
              reg14})))
            begin
              reg13 <= ($signed((reg12 > (~reg13[(1'h0):(1'h0)]))) <= $unsigned(wire4[(4'h9):(3'h5)]));
              reg14 <= {(((((8'hb9) && reg10) < (wire3 ? reg12 : wire4)) ?
                      ($signed(reg13) == $signed(wire3)) : $unsigned($unsigned(reg6))) >>> reg12[(3'h4):(1'h0)])};
              reg15 <= ({{wire7},
                  $unsigned((^~reg14[(1'h1):(1'h0)]))} >> $signed($unsigned((+reg14[(1'h1):(1'h1)]))));
              reg16 <= reg11[(3'h4):(2'h3)];
              reg17 <= wire3[(4'hc):(3'h6)];
            end
          else
            begin
              reg13 <= (reg11 != ((($signed(reg6) & (-wire0)) ?
                      (~|(reg9 << reg5)) : $signed($signed(wire2))) ?
                  reg11 : $unsigned($signed((8'hae)))));
              reg14 <= $unsigned({$unsigned({reg6[(3'h6):(2'h3)],
                      (reg5 ? reg5 : wire7)})});
              reg15 <= reg15[(4'ha):(2'h3)];
              reg16 <= reg11;
              reg17 <= (^(wire3 & $unsigned($unsigned((~&wire3)))));
            end
        end
      reg18 <= reg16;
    end
  assign wire19 = wire3;
  assign wire20 = $signed((8'had));
endmodule
