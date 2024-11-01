module top
#(parameter param32 = {{(((-(8'hab)) == ((8'haf) ? (8'hb9) : (8'ha9))) + {(~(8'had)), ((8'hb2) ? (8'ha2) : (8'hb8))}), (((~&(8'ha0)) ? {(8'hbe)} : ((8'hac) >= (7'h44))) ? ({(8'hb7)} >>> (7'h43)) : {((8'hb8) >> (8'hb9)), (~|(8'ha7))})}, (((((8'ha2) ? (8'ha1) : (8'ha7)) ? (^~(8'hb0)) : ((8'hb2) != (8'h9d))) << (~{(8'h9f), (8'had)})) ? ((!((8'hba) ? (8'haf) : (8'ha8))) ^~ {{(8'hae)}}) : {(((8'hbc) != (8'hbf)) ? ((8'hba) ? (8'ha9) : (8'hbd)) : (8'hbd)), ((^~(8'h9c)) <<< ((8'hbe) * (8'hb3)))})}, 
parameter param33 = (-(param32 ? (~|((param32 ? param32 : param32) ? (!param32) : (param32 ? param32 : param32))) : (~|((param32 ? param32 : param32) ? (param32 < (8'had)) : param32)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire13;
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire13,
                 reg31,
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
                 (1'h0)};
  module4 #() modinst14 (.wire7(wire3), .clk(clk), .wire6(wire2), .y(wire13), .wire8(wire1), .wire5(wire0));
  always
    @(posedge clk) begin
      if (wire1[(2'h3):(2'h3)])
        begin
          if ((|wire2[(3'h5):(3'h5)]))
            begin
              reg15 <= $signed(wire3[(3'h6):(2'h3)]);
              reg16 <= (({($unsigned((8'hb6)) ?
                              $unsigned(wire13) : {wire3, wire0})} ?
                      wire13 : {$unsigned((reg15 ? wire3 : wire2)), wire2}) ?
                  (~^wire0) : wire13);
            end
          else
            begin
              reg15 <= reg16;
              reg16 <= (wire13 & ($unsigned(reg16) >> (reg16[(3'h4):(3'h4)] ?
                  $unsigned(wire2) : {wire1})));
              reg17 <= (($signed(($unsigned((8'hae)) ?
                  $unsigned(wire2) : (wire1 ^~ wire13))) & (~&reg16)) + wire3);
              reg18 <= (&(~&$unsigned((8'hbe))));
              reg19 <= $unsigned(((~$signed((!wire3))) || reg16));
            end
          reg20 <= (^~$unsigned(((~(reg15 ? reg18 : reg18)) ?
              ((~|reg16) * $unsigned(wire2)) : $unsigned((wire1 ?
                  wire1 : reg19)))));
          reg21 <= $unsigned(wire0[(3'h6):(2'h3)]);
          reg22 <= wire13;
          reg23 <= ($unsigned((((wire0 ? reg15 : reg21) ?
                  (-wire0) : $signed(wire3)) ?
              reg15[(1'h1):(1'h0)] : $signed(reg16))) * reg19);
        end
      else
        begin
          reg15 <= $signed($unsigned(reg16));
          reg16 <= $unsigned(reg21);
          reg17 <= reg22[(3'h7):(1'h0)];
        end
      reg24 <= reg16[(3'h4):(2'h3)];
      reg25 <= ((((!{wire0}) | reg15[(1'h0):(1'h0)]) ?
              ({(reg17 ? wire3 : reg23), (^reg19)} ?
                  {(^wire3), wire2[(4'he):(4'ha)]} : (reg15[(2'h3):(2'h2)] ?
                      $unsigned(wire3) : (8'haa))) : ((wire0[(4'hb):(4'hb)] ^ (!wire1)) >= $unsigned(wire13))) ?
          ((|reg20[(2'h2):(2'h2)]) & wire3) : {$signed(reg20),
              reg24[(4'h8):(1'h0)]});
    end
  assign wire26 = $signed(((wire1[(3'h4):(1'h1)] != (((8'hb2) ?
                          reg16 : reg19) != $signed((8'had)))) ?
                      wire3 : ((^((8'hb0) ? (8'hbc) : reg21)) ?
                          (!wire1[(3'h4):(3'h4)]) : $unsigned(reg15))));
  assign wire27 = ({(reg17 ?
                          (((8'hb0) ? reg22 : reg16) >>> (reg15 ?
                              wire0 : reg17)) : (&{reg16}))} > $unsigned($signed($signed((&reg16)))));
  assign wire28 = ($signed((^~((+reg19) ?
                          (reg21 || wire13) : $signed(reg24)))) ?
                      wire3 : {wire27});
  assign wire29 = $signed(reg18[(3'h4):(3'h4)]);
  assign wire30 = (~|wire2);
  always
    @(posedge clk) begin
      reg31 <= (wire2[(4'he):(3'h7)] ?
          wire28 : $unsigned($signed({(wire30 <= reg20)})));
    end
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  assign y = {wire12, wire11, wire10, wire9, (1'h0)};
  assign wire9 = wire8;
  assign wire10 = (^~wire8);
  assign wire11 = (wire5[(4'hc):(1'h0)] ?
                      (^wire6) : $unsigned((wire9 ?
                          wire7 : $unsigned($signed(wire6)))));
  assign wire12 = ((&wire9[(2'h2):(1'h0)]) ?
                      $signed(((~&$unsigned(wire6)) * wire6)) : $signed(wire10[(3'h7):(2'h3)]));
endmodule
