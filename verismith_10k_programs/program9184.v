module top
#(parameter param24 = ((((&((8'ha8) & (8'hb0))) ? ((~&(7'h42)) ? ((8'had) | (8'ha5)) : ((8'h9e) <= (8'hab))) : (((8'ha1) - (8'h9c)) ? ((8'ha0) | (8'h9e)) : ((8'h9e) ? (8'ha6) : (8'hb8)))) ? {({(7'h44), (8'ha8)} ^~ (!(8'hb4)))} : ({{(7'h40), (8'ha2)}, ((8'ha5) ~^ (8'ha5))} >= (~|((7'h41) ? (8'haa) : (8'hba))))) ? ((^((8'ha2) ? (&(8'hb8)) : (~(8'ha6)))) & (~&(7'h42))) : (((((8'hb5) ? (8'ha0) : (8'hb0)) >> ((8'ha4) <<< (7'h42))) ? ({(7'h43), (8'h9c)} <= ((8'hac) ? (8'h9f) : (8'hb6))) : (((8'hbc) ? (8'hb0) : (8'hb5)) ? (^~(8'hbe)) : {(7'h43), (8'hba)})) != (({(8'hbd)} >> {(8'hab)}) ? (((8'hb4) ? (8'hb8) : (8'haa)) - (!(7'h40))) : {((7'h42) ? (7'h42) : (8'ha0)), (&(8'hac))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire20,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg21,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = {wire4[(1'h0):(1'h0)],
                     ((((wire2 ? wire2 : wire0) ? {wire5, wire5} : (8'h9d)) ?
                             wire5 : wire4) ?
                         $unsigned((^(wire3 ^ wire4))) : {wire4, (~wire1)})};
  assign wire7 = (8'hba);
  assign wire8 = wire5;
  assign wire9 = {(~|((|$unsigned(wire4)) + $unsigned({wire2}))),
                     ((|wire2[(1'h0):(1'h0)]) ?
                         $unsigned(((~(8'hb7)) ?
                             wire6[(3'h4):(1'h0)] : (wire0 < wire0))) : $unsigned({(~^wire2),
                             $unsigned((8'haf))}))};
  assign wire10 = wire9[(1'h1):(1'h0)];
  assign wire11 = wire2;
  assign wire12 = (^(^wire8[(4'hb):(4'ha)]));
  always
    @(posedge clk) begin
      reg13 <= $unsigned(($unsigned((^wire7[(1'h0):(1'h0)])) ?
          {$signed($unsigned(wire12))} : ({(!(8'hb7))} > {(wire7 ?
                  (8'h9d) : wire2),
              wire10})));
      reg14 <= {reg13};
      reg15 <= {wire11};
      if (wire1)
        begin
          reg16 <= (wire1 ?
              $signed($unsigned(((wire1 || wire5) ?
                  (wire7 << wire0) : (wire5 ?
                      (8'hb7) : wire5)))) : (~^$signed($signed((wire5 && wire5)))));
          reg17 <= $unsigned($unsigned((~^wire7[(1'h0):(1'h0)])));
          reg18 <= (^~{$unsigned((wire1 >>> (reg14 ? (8'ha9) : wire12)))});
        end
      else
        begin
          reg16 <= $signed((&(&((!wire11) ^ reg16))));
        end
      reg19 <= (wire5 ? wire9 : wire10[(4'h9):(3'h6)]);
    end
  assign wire20 = reg13[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg21 <= ($signed(wire0) <= wire10[(2'h3):(2'h2)]);
    end
  assign wire22 = (^~$signed((($signed((8'ha0)) << $unsigned((8'h9d))) ?
                      $unsigned(reg19) : $unsigned(wire3[(4'h8):(3'h7)]))));
  assign wire23 = wire22;
endmodule
