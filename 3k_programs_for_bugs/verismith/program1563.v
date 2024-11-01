module top
#(parameter param27 = {(((-(!(8'ha1))) ? (((8'haa) ? (8'h9d) : (8'hbf)) ? {(8'hbb), (7'h44)} : ((8'hb9) ? (7'h40) : (8'hbd))) : (+(!(8'ha2)))) ? ((((8'ha0) ? (8'hbb) : (7'h44)) ? (~|(8'haf)) : ((8'hb4) >>> (8'ha7))) ? (((7'h42) ? (7'h44) : (7'h42)) ? ((8'ha4) ? (8'hbb) : (8'h9f)) : ((8'ha7) ? (7'h43) : (8'ha0))) : (-((8'hb0) ~^ (8'hb6)))) : (8'ha7))}, 
parameter param28 = (8'ha2))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire6,
                 wire5,
                 wire4,
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
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = $unsigned({wire0,
                     (wire0[(5'h10):(4'hc)] & $unsigned((wire0 ?
                         wire1 : wire3)))});
  assign wire5 = ($signed((-$unsigned($unsigned((7'h44))))) ?
                     (~wire3) : ($unsigned(wire2[(3'h6):(1'h0)]) <= ($unsigned((8'hab)) ?
                         $signed($unsigned(wire3)) : wire0[(1'h1):(1'h0)])));
  assign wire6 = $signed((~&(wire1 ?
                     wire0[(1'h1):(1'h0)] : (-(wire2 ? (8'ha2) : wire4)))));
  always
    @(posedge clk) begin
      reg7 <= ($unsigned(wire6[(1'h1):(1'h0)]) > $unsigned((((wire2 == wire1) ?
              wire5[(3'h4):(3'h4)] : {wire4, wire5}) ?
          wire4 : (~&$unsigned(wire3)))));
      reg8 <= (~(($signed(wire1[(1'h0):(1'h0)]) ^~ wire6) ?
          $unsigned({((8'hac) >= (8'ha3))}) : ((((8'hbf) & wire0) ?
              wire6[(4'hd):(4'hb)] : wire1[(3'h4):(1'h1)]) > (-(~|reg7)))));
    end
  assign wire9 = wire5[(3'h5):(2'h2)];
  assign wire10 = $unsigned({((wire1[(3'h5):(1'h0)] ?
                              $unsigned((8'hb9)) : (-reg8)) ?
                          $signed(wire9[(1'h0):(1'h0)]) : ({(8'hbf), wire1} ?
                              $signed((8'haf)) : $signed((8'h9c))))});
  assign wire11 = (8'ha9);
  always
    @(posedge clk) begin
      if (wire4[(1'h0):(1'h0)])
        begin
          if (wire3[(2'h3):(2'h2)])
            begin
              reg12 <= {(|(^~$unsigned((reg8 ? wire5 : wire0))))};
              reg13 <= $unsigned(wire10[(4'hf):(3'h5)]);
              reg14 <= ((|$unsigned({(&wire6), (wire1 | wire4)})) ?
                  wire10[(3'h4):(2'h2)] : (!((reg13 ?
                      wire6 : $unsigned(wire1)) | ({reg7, reg8} | (8'ha6)))));
            end
          else
            begin
              reg12 <= $unsigned(((((|wire9) == {reg14, reg8}) ?
                  wire6 : ($signed(wire10) ?
                      (~wire3) : reg13)) - ($unsigned($signed(wire11)) ?
                  (8'hac) : (~^$signed((8'hbd))))));
              reg13 <= (((~^({(8'hb3), reg13} == $signed(wire4))) ?
                      (^wire0) : $signed({{wire5}, reg13[(4'ha):(1'h1)]})) ?
                  wire3 : $signed(wire4));
              reg14 <= (!((wire3[(2'h3):(2'h3)] >> {wire3[(1'h1):(1'h0)],
                      (wire4 ? (8'hb7) : wire1)}) ?
                  reg14 : $signed((+$unsigned((8'hac))))));
              reg15 <= $unsigned(reg8);
            end
        end
      else
        begin
          reg12 <= ($unsigned((wire1[(2'h3):(2'h2)] > $unsigned($signed(wire9)))) ?
              $unsigned({wire6, wire3}) : $unsigned($unsigned(((wire5 ?
                  wire6 : reg13) > (~reg15)))));
          reg13 <= $unsigned(wire5[(4'ha):(4'ha)]);
          reg14 <= $unsigned(wire9);
        end
      reg16 <= wire10[(3'h7):(3'h4)];
      reg17 <= $signed((reg15[(4'hb):(3'h4)] > (^~reg15[(3'h4):(1'h1)])));
      reg18 <= $signed((reg7 ? $unsigned(wire5) : {(8'ha5)}));
    end
  always
    @(posedge clk) begin
      if ({(~|wire2),
          ((~(|(wire10 >> wire10))) ?
              $unsigned($unsigned(wire3[(3'h7):(3'h6)])) : reg7[(3'h7):(3'h7)])})
        begin
          reg19 <= ({(~^(&wire5[(5'h10):(4'ha)]))} < (~&$signed((wire9 ?
              (reg12 ? reg15 : wire11) : wire3[(3'h4):(1'h0)]))));
          reg20 <= (wire4 > ((8'ha5) != $unsigned(((reg14 ? wire0 : wire4) ?
              (wire11 ? (8'hb8) : wire11) : (~|reg16)))));
          reg21 <= $unsigned((wire11[(3'h5):(1'h1)] ?
              (8'hb8) : $signed($unsigned($unsigned(reg7)))));
        end
      else
        begin
          reg19 <= (8'hb6);
          reg20 <= {((reg18 || (+reg15)) | (reg12 & {(^~(8'hb7))}))};
          reg21 <= (wire9[(3'h6):(2'h2)] ?
              (reg19 != wire6[(4'hd):(4'h9)]) : $unsigned(reg20[(3'h4):(3'h4)]));
          reg22 <= reg21;
          reg23 <= $signed(((~|(reg20[(3'h6):(2'h2)] & (~&reg12))) >> $unsigned($signed((reg12 <= reg13)))));
        end
      reg24 <= {$unsigned((($signed(wire3) ? (reg18 >>> wire3) : reg7) ?
              (reg22 >>> {reg16, reg21}) : $signed(reg23)))};
      reg25 <= ((^~(~|((reg17 + wire4) >>> reg15))) ?
          {reg14,
              ({$signed(wire6)} ?
                  ((reg23 & reg14) ?
                      (reg21 ? reg22 : wire10) : {wire5}) : {(|(8'hb9)),
                      $signed((8'hba))})} : reg18);
      reg26 <= (8'hac);
    end
endmodule
