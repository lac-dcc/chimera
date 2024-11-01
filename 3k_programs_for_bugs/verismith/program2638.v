module top
#(parameter param31 = (~&((!{{(8'h9d), (8'hb9)}, {(8'ha5), (8'ha1)}}) && ((((8'hb2) ? (8'hbd) : (8'ha6)) <= (~|(7'h44))) ? ((~|(8'haf)) ? (!(8'hab)) : ((7'h42) ? (8'h9c) : (8'hb0))) : (((8'haa) ? (8'ha1) : (8'ha3)) < (&(8'ha5)))))), 
parameter param32 = (8'hae))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire20,
                 wire19,
                 wire17,
                 wire11,
                 wire10,
                 wire9,
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
                 reg18,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = (((-(!$signed(wire0))) ?
                     $signed(({wire4} <= wire4)) : {$unsigned((wire2 >>> wire1))}) >>> {$unsigned(wire3[(3'h5):(2'h3)])});
  assign wire6 = $signed((+wire3));
  assign wire7 = {$signed(({(wire5 & wire2)} ?
                         wire1[(4'h9):(3'h7)] : $signed(wire0[(1'h1):(1'h1)]))),
                     $signed(wire0)};
  assign wire8 = $unsigned((~&wire2[(2'h2):(1'h1)]));
  assign wire9 = (!{({$signed(wire6), wire1} ?
                         $unsigned((wire2 ? (8'hb4) : wire1)) : {(wire7 ?
                                 wire1 : wire5)})});
  assign wire10 = wire6[(4'hb):(3'h5)];
  assign wire11 = wire7[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg12 <= $unsigned((~^(^~(wire0 ? (~&wire7) : $signed(wire5)))));
      reg13 <= ((|{(|$unsigned(wire8))}) ?
          $signed(($signed((wire10 + wire7)) ?
              (^$unsigned((8'hb5))) : ($signed((8'ha7)) | (-wire4)))) : reg12[(4'hb):(2'h3)]);
      reg14 <= wire9;
      reg15 <= wire5;
      reg16 <= $unsigned((8'h9c));
    end
  assign wire17 = (((wire7 ? wire4[(4'h9):(2'h3)] : wire2) ?
                      ($unsigned((wire2 ? (8'haf) : wire1)) >> ({reg13} ?
                          (&wire6) : $signed(wire6))) : (8'hbe)) <= $signed({$signed({wire7})}));
  always
    @(posedge clk) begin
      reg18 <= $unsigned((~&wire4));
    end
  assign wire19 = $unsigned((({(reg16 && (7'h44))} ?
                      $signed($unsigned((8'haa))) : (wire3[(4'hb):(3'h6)] ?
                          $signed((7'h43)) : wire5[(4'ha):(3'h5)])) + (~|(^(wire2 ?
                      reg13 : (8'hae))))));
  assign wire20 = ((~^{$signed(reg16[(4'h9):(1'h0)]),
                          $unsigned((reg12 ? wire8 : reg12))}) ?
                      reg15 : (($signed((reg15 | wire2)) ?
                          wire4[(4'hb):(3'h7)] : $signed((wire17 && wire11))) <= (((wire7 - wire19) ?
                          ((8'ha6) < wire5) : $unsigned(wire9)) > ({reg16} << $unsigned(reg13)))));
  always
    @(posedge clk) begin
      if ((8'hb1))
        begin
          reg21 <= wire6[(5'h10):(3'h6)];
          reg22 <= (reg14[(3'h5):(3'h4)] - (wire0[(2'h3):(1'h1)] | (((!reg15) != (wire10 || wire5)) <= wire4[(4'hb):(4'ha)])));
          reg23 <= (8'h9f);
          if ($signed(wire1))
            begin
              reg24 <= $signed((|((~|$unsigned(reg21)) ?
                  wire20[(3'h6):(3'h6)] : ({wire2} ?
                      (reg21 ? reg21 : wire4) : $unsigned(wire9)))));
              reg25 <= wire5[(3'h7):(1'h0)];
              reg26 <= {$unsigned(reg13[(2'h2):(2'h2)])};
            end
          else
            begin
              reg24 <= (8'haf);
              reg25 <= wire3;
              reg26 <= {((((wire8 > reg23) <<< (~&wire9)) != {$signed(wire9),
                          reg22}) ?
                      wire5 : ($unsigned((^~wire2)) ^ $unsigned(reg16[(4'h9):(1'h0)])))};
            end
          reg27 <= (-$unsigned((reg21[(4'h8):(3'h6)] ~^ ((^wire5) ?
              (wire2 != wire20) : wire7))));
        end
      else
        begin
          reg21 <= wire2[(1'h0):(1'h0)];
          reg22 <= reg22[(4'h9):(1'h0)];
        end
      reg28 <= wire7[(4'he):(4'hb)];
    end
  assign wire29 = $signed((($signed((reg21 ? reg25 : reg22)) ?
                      $unsigned({wire7}) : (wire9[(1'h1):(1'h0)] ^~ $unsigned(wire4))) & {({wire7,
                          reg15} ^~ (wire7 != reg21))}));
  assign wire30 = wire17[(4'hc):(4'h9)];
endmodule
