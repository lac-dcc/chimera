module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire31;
  assign y = {wire36, wire35, wire34, wire33, wire4, wire31, (1'h0)};
  assign wire4 = ($signed({wire3, $signed((wire1 > wire1))}) ^ (({{wire3},
                             (wire0 ? wire0 : wire0)} ?
                         (wire3 ~^ (&(8'hb0))) : ((wire2 <<< wire2) ~^ {wire3,
                             wire1})) ?
                     (8'h9c) : $unsigned(((wire2 ?
                         wire3 : wire0) >> $signed(wire1)))));
  module5 #() modinst32 (.clk(clk), .wire7(wire1), .wire9(wire4), .wire8(wire3), .wire6(wire2), .wire10(wire0), .y(wire31));
  assign wire33 = ((8'hbe) < $unsigned(wire0));
  assign wire34 = (8'hae);
  assign wire35 = $signed((~(~&(8'had))));
  assign wire36 = $unsigned($unsigned((wire2 & {(^wire35), $unsigned(wire1)})));
endmodule

module module5
#(parameter param30 = ((8'ha9) & ((({(8'haa)} ? ((8'ha3) ? (8'ha6) : (8'h9c)) : ((8'ha5) & (8'ha1))) ^ {((8'hb6) ^ (8'hae))}) ? ((!((8'hb0) << (7'h41))) >= (8'ha0)) : ((8'hb3) >>> (^~{(8'had)})))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire7[(1'h1):(1'h1)])
        begin
          reg11 <= (wire10 ?
              $unsigned($unsigned(wire9)) : wire6[(3'h7):(2'h3)]);
        end
      else
        begin
          reg11 <= {(-(!((wire6 + wire8) ? {wire8} : $signed(wire7)))),
              ($unsigned({{(8'haf)}}) || (((wire9 < reg11) ?
                      $signed(wire9) : $unsigned(wire8)) ?
                  wire8[(3'h4):(2'h3)] : {$unsigned(reg11),
                      wire9[(4'hb):(4'ha)]}))};
          reg12 <= ({$signed((~&(reg11 & wire7)))} <= $unsigned(wire9[(4'ha):(3'h6)]));
          reg13 <= $unsigned(($signed(((wire10 >>> wire7) ?
                  wire6[(4'h9):(4'h8)] : (wire7 < wire9))) ?
              ($unsigned(wire8) != $signed($signed((8'ha8)))) : $signed({wire8[(3'h6):(2'h3)]})));
        end
      reg14 <= reg12;
      reg15 <= reg13[(2'h2):(1'h1)];
      reg16 <= $unsigned($unsigned($signed($unsigned({reg12}))));
    end
  always
    @(posedge clk) begin
      reg17 <= $unsigned((7'h44));
      if (((~|{(^(~(8'h9e)))}) > (~wire9[(4'he):(2'h3)])))
        begin
          reg18 <= (~wire8);
          reg19 <= reg17[(2'h3):(1'h1)];
          reg20 <= $signed(reg18[(2'h3):(1'h0)]);
          reg21 <= (^(~&$signed($signed($unsigned(wire10)))));
        end
      else
        begin
          reg18 <= (reg18 ? wire7 : reg12[(4'ha):(2'h3)]);
        end
      if (($unsigned((wire7 ?
              $signed((reg19 ? reg18 : reg19)) : {reg21[(1'h1):(1'h1)],
                  $signed(reg16)})) ?
          ({(wire9 <= {wire10, reg13}), reg13[(3'h4):(1'h0)]} ?
              $signed((|((8'hb5) ? reg20 : wire10))) : ({(reg12 ^ reg20)} ?
                  $signed({(8'hb6),
                      (8'hb8)}) : $signed((~|reg21)))) : (+$unsigned((~&(reg14 ?
              wire10 : reg12))))))
        begin
          reg22 <= (|$unsigned((&{$signed(reg18)})));
          reg23 <= {reg19[(1'h0):(1'h0)]};
          reg24 <= $signed($signed(((wire9[(4'he):(4'he)] ?
                  reg20[(2'h3):(2'h2)] : {reg17, reg15}) ?
              ((8'hae) ? (reg17 & reg22) : $signed(wire9)) : reg19)));
          reg25 <= ((reg14[(3'h5):(2'h2)] ?
                  (((~|(8'hb5)) ? (~^reg22) : wire7) ?
                      {reg22,
                          $unsigned(reg20)} : reg13[(2'h2):(1'h1)]) : $unsigned({$unsigned(reg23),
                      reg13[(1'h0):(1'h0)]})) ?
              reg11 : ((wire9 && ((reg15 ? reg18 : reg16) && reg23)) && reg23));
        end
      else
        begin
          reg22 <= reg24[(4'hf):(4'ha)];
        end
      reg26 <= (($unsigned($signed(reg22[(3'h4):(2'h2)])) + {{(reg15 ?
                      reg15 : wire10)}}) ?
          reg15[(1'h0):(1'h0)] : reg15);
    end
  assign wire27 = ({$signed(({reg13} ?
                          (reg20 >= reg24) : $signed(reg18)))} > ({($signed(wire8) >= (~reg22)),
                      $unsigned($signed(reg15))} <= (($signed(reg22) ?
                      (wire6 > wire10) : {(8'hbf)}) <= $signed($signed(wire6)))));
  assign wire28 = ($unsigned(((!$signed(reg19)) != ({reg24} >> reg12))) != wire9[(1'h0):(1'h0)]);
  assign wire29 = $signed($unsigned($unsigned($signed((reg20 <<< wire28)))));
endmodule
