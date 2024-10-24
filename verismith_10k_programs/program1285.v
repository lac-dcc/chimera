module top
#(parameter param18 = {((&{((8'ha5) ? (8'ha1) : (8'ha3)), {(8'hb5), (8'h9f)}}) ^ ((((8'h9f) ? (8'ha5) : (8'hbe)) || ((8'haf) > (8'ha4))) ? ({(7'h40)} ^ (|(8'haf))) : ({(8'hba), (8'hb1)} ? ((7'h41) & (7'h42)) : (8'hbe)))), (({((8'hb8) ? (8'h9c) : (8'ha0)), ((8'hbe) ? (8'haa) : (8'hb1))} ? (((8'ha3) ? (8'hb4) : (8'ha8)) ^ ((8'hbe) * (8'hac))) : {((8'ha6) & (7'h44)), ((8'ha6) ? (8'hac) : (8'ha8))}) ? (~^(8'hb0)) : ((8'ha5) ? (((8'hb9) >>> (8'hb2)) ? (+(8'haf)) : ((7'h44) ^~ (7'h41))) : {((8'ha7) ? (7'h40) : (8'hbf))}))}, 
parameter param19 = ((({param18} && (param18 * (param18 ~^ param18))) ? param18 : {param18}) ? ((~&param18) + ((!(&param18)) ? {param18, (param18 ? param18 : param18)} : (~^(^(8'haa))))) : {param18}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  assign y = {wire17,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = ((($unsigned((wire1 && wire2)) >>> wire4[(4'h8):(3'h4)]) <= $unsigned(({(8'ha1),
                         (8'h9c)} <<< wire0[(3'h7):(3'h6)]))) ?
                     ((&wire0[(2'h2):(2'h2)]) ?
                         wire2[(2'h2):(2'h2)] : wire1) : wire4[(3'h6):(3'h4)]);
  assign wire6 = wire3[(4'hc):(1'h1)];
  assign wire7 = (8'hac);
  assign wire8 = ((&wire0) & {(^~wire1)});
  always
    @(posedge clk) begin
      reg9 <= $unsigned(($unsigned((^(wire1 << wire0))) ?
          wire7 : wire6[(3'h7):(3'h4)]));
      reg10 <= {((~(&(~&wire4))) > (|((wire1 >> wire8) + (wire5 ?
              wire5 : wire1))))};
      reg11 <= wire6[(5'h11):(2'h2)];
      if ((($signed(($unsigned(wire7) ?
          $unsigned(wire7) : (wire0 || reg10))) >= ((wire5 >> (reg10 < (8'hb0))) ?
          wire5[(2'h2):(2'h2)] : wire8[(3'h5):(3'h5)])) == $signed((^~(wire5 ?
          (wire8 != wire0) : wire3[(4'h8):(3'h7)])))))
        begin
          if (wire0)
            begin
              reg12 <= wire3;
              reg13 <= ((wire6 ?
                  $unsigned($unsigned(((8'hbf) >= wire6))) : ({reg11} ?
                      ({wire0, wire2} ?
                          {wire2} : ((8'hba) ?
                              wire2 : wire7)) : $signed(wire3))) ~^ (wire0 & wire6[(4'h9):(2'h3)]));
            end
          else
            begin
              reg12 <= wire4;
              reg13 <= wire5[(3'h5):(2'h3)];
              reg14 <= ((reg9[(4'hd):(4'hc)] ~^ $signed((wire8[(1'h1):(1'h1)] >> (8'ha8)))) ?
                  (($signed((!wire4)) || (~^reg9[(1'h0):(1'h0)])) >>> ($signed((reg9 + wire5)) ?
                      ((reg12 == wire8) ?
                          {wire0,
                              wire2} : $unsigned(wire5)) : (^~reg11))) : reg12[(3'h5):(3'h4)]);
            end
          reg15 <= $unsigned(wire0);
        end
      else
        begin
          reg12 <= reg15[(2'h3):(2'h3)];
        end
      reg16 <= $unsigned($unsigned((!(wire2 ?
          (wire8 ? wire1 : wire8) : (wire6 ? (8'hb8) : wire3)))));
    end
  assign wire17 = $signed((($unsigned((~|reg14)) << $unsigned(reg12[(1'h1):(1'h1)])) ?
                      $unsigned(reg13[(1'h1):(1'h0)]) : wire5));
endmodule
