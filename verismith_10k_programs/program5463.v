module top
#(parameter param21 = (^(({((8'ha3) ? (7'h44) : (8'hb7)), ((8'hb9) && (8'hb9))} ? (8'hb5) : (((8'ha9) < (8'hae)) ^ (+(8'ha3)))) >= (^{(^~(8'ha1)), ((8'ha0) ? (8'hba) : (8'hbf))}))), 
parameter param22 = {param21, ({(~&(param21 + param21)), param21} ? ((param21 ? ((8'hae) & (8'h9f)) : (param21 ? param21 : (8'haf))) ? (~param21) : param21) : param21)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire14,
                 wire11,
                 wire5,
                 wire4,
                 reg17,
                 reg16,
                 reg15,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed($signed($signed((8'hb4))));
  assign wire5 = $unsigned((wire3 ?
                     $signed(wire4[(2'h2):(1'h1)]) : {((~|wire0) ?
                             (|(8'hb9)) : wire3[(3'h4):(2'h2)])}));
  always
    @(posedge clk) begin
      reg6 <= $unsigned((^~wire5));
      reg7 <= ((wire5[(4'h9):(3'h7)] || (((~wire3) ?
              $signed(wire1) : (&reg6)) - wire0)) ?
          (!(((wire3 ?
              wire2 : (8'ha0)) - $signed(wire4)) - (!reg6))) : (wire1 <<< (reg6 ^ ((8'hb0) >> ((8'hac) ?
              wire3 : wire0)))));
      reg8 <= $signed((8'haa));
      reg9 <= $signed(wire0);
      reg10 <= wire4;
    end
  assign wire11 = $unsigned($signed((^~wire4[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg12 <= wire11[(1'h0):(1'h0)];
      reg13 <= {(~&({$unsigned(reg10)} ?
              ((reg8 >> (8'hb7)) ? (~|reg7) : reg8) : reg6[(3'h4):(3'h4)])),
          wire4};
    end
  assign wire14 = wire2;
  always
    @(posedge clk) begin
      reg15 <= ((8'hbb) == wire5[(2'h2):(1'h0)]);
      reg16 <= $unsigned($unsigned($unsigned(reg15[(2'h3):(2'h3)])));
      reg17 <= reg16[(1'h1):(1'h1)];
    end
  assign wire18 = (+(reg13[(5'h12):(3'h7)] ^~ $signed($unsigned($unsigned(wire0)))));
  assign wire19 = (8'hb1);
  assign wire20 = (wire18 ^ ({$unsigned((~(8'hb2))),
                          ((~&wire0) | (reg17 ? (8'hb6) : reg6))} ?
                      ((&{(8'hae), wire2}) ?
                          $signed(reg16) : (|$signed(wire1))) : $signed($signed($unsigned(reg9)))));
endmodule
