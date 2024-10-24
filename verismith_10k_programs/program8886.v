module top
#(parameter param27 = {(8'hbf)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire20,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire4 = $unsigned((&{($signed(wire2) ?
                         $unsigned(wire0) : $signed(wire0))}));
  assign wire5 = (((|(8'hb8)) - {(wire4[(3'h7):(3'h5)] ?
                             (wire4 + wire2) : {wire0, (8'hbf)})}) ?
                     wire1 : wire3);
  assign wire6 = (~&{$signed(wire1),
                     (wire1[(2'h2):(1'h1)] ~^ $unsigned($unsigned((8'hb3))))});
  assign wire7 = $signed(wire6[(4'h9):(1'h0)]);
  assign wire8 = wire0[(5'h11):(3'h7)];
  assign wire9 = wire2[(4'h8):(4'h8)];
  assign wire10 = wire9[(4'hf):(4'h8)];
  assign wire11 = (~^(wire2[(3'h6):(2'h3)] ?
                      (((+wire7) == wire2) ?
                          (|(~&wire8)) : $signed(wire8[(1'h0):(1'h0)])) : wire5[(2'h2):(2'h2)]));
  assign wire12 = wire3[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg13 <= wire0[(3'h6):(3'h4)];
      if (wire10)
        begin
          if ({$unsigned({(wire3[(3'h4):(2'h2)] ?
                      (wire0 - wire3) : ((8'ha5) ? (8'had) : reg13)),
                  $unsigned({wire6, wire9})}),
              (($unsigned({wire9,
                  (8'hb6)}) >>> $unsigned(wire0[(3'h6):(3'h5)])) ^ ((wire4 ?
                  (wire3 ?
                      wire2 : (8'hb9)) : wire7) && $unsigned($signed(wire7))))})
            begin
              reg14 <= wire0;
            end
          else
            begin
              reg14 <= (~^(reg14[(4'he):(1'h0)] ?
                  $unsigned({{wire5, (8'h9e)}}) : (wire10[(2'h3):(1'h1)] ?
                      $signed(wire3) : $signed(wire7[(4'h9):(4'h8)]))));
              reg15 <= ($signed(wire0) != {(-((wire8 & (8'ha0)) ?
                      wire11 : (|wire0))),
                  $signed($unsigned(wire8))});
              reg16 <= $signed((~&reg15));
              reg17 <= ((reg16[(4'ha):(1'h0)] ?
                  {($signed(wire1) <<< (reg15 ? wire5 : wire9)),
                      $unsigned($unsigned(reg15))} : ({$unsigned(wire5)} ?
                      reg15[(4'hc):(3'h5)] : ($unsigned(wire10) ?
                          (^wire1) : wire3[(3'h4):(1'h1)]))) != $signed((|({wire10} ?
                  wire1[(3'h5):(1'h0)] : (^~wire2)))));
              reg18 <= wire8;
            end
        end
      else
        begin
          reg14 <= $unsigned(reg18[(2'h2):(1'h1)]);
          reg15 <= (~&$unsigned(wire0[(4'hd):(4'h8)]));
          reg16 <= (wire11[(2'h2):(1'h0)] ? (~^wire0) : wire8[(2'h2):(1'h1)]);
        end
      reg19 <= ((wire11 ?
              $signed($signed((reg13 ?
                  reg16 : wire7))) : $signed(wire5[(2'h3):(1'h0)])) ?
          (wire3 ? wire3 : (-(^$unsigned(reg15)))) : reg18);
    end
  assign wire20 = {$signed((wire8 ?
                          ({reg14,
                              wire10} ~^ $unsigned(wire4)) : $signed($unsigned(reg16)))),
                      wire0};
  always
    @(posedge clk) begin
      reg21 <= wire9[(1'h0):(1'h0)];
      reg22 <= $signed(($unsigned(($unsigned(reg18) ?
          (wire4 ? (8'h9f) : reg19) : (!reg21))) >= (~{(wire6 > reg21)})));
      reg23 <= (!{$unsigned((&wire12))});
      reg24 <= ($signed(((^(wire9 ? wire9 : reg18)) ?
              $unsigned(wire4[(3'h6):(2'h3)]) : (8'ha7))) ?
          $unsigned(($unsigned(wire10) ?
              wire10[(5'h10):(5'h10)] : (7'h44))) : (wire11[(4'he):(4'ha)] ?
              wire6[(2'h3):(1'h1)] : (!($signed(wire6) << (wire8 >>> wire9)))));
    end
  assign wire25 = reg17;
  assign wire26 = reg23[(3'h5):(1'h0)];
endmodule
