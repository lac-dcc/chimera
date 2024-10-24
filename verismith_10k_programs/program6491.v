module top
#(parameter param20 = (~|(^((((8'hbf) ? (8'ha5) : (8'hb2)) ^~ ((8'ha5) * (8'haa))) <<< (((8'hab) ^ (8'hab)) ^ {(8'h9c), (8'hb1)})))), 
parameter param21 = param20)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
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
  assign wire5 = $unsigned(wire1[(4'hf):(3'h7)]);
  assign wire6 = ((~(wire3 <= $signed((+wire1)))) ^ wire4);
  assign wire7 = wire4;
  assign wire8 = $signed((~&$signed(wire7)));
  always
    @(posedge clk) begin
      reg9 <= ($signed((^~(|wire1))) ~^ (wire1 ?
          $signed(wire5) : (-$signed({wire4}))));
      reg10 <= (wire0 >= ($unsigned(wire7[(3'h5):(2'h2)]) ^ wire5));
      reg11 <= ((($signed(wire7[(2'h2):(1'h0)]) >>> (&(wire1 ?
                  wire7 : wire7))) ?
              (((wire3 ? wire1 : wire7) | {wire4, (7'h43)}) ?
                  $unsigned((wire0 << wire1)) : $signed((wire2 <<< wire8))) : (&$signed((reg10 <= reg10)))) ?
          (&(|($signed(wire4) * {wire4}))) : ($signed(((wire0 ?
                  (8'hae) : wire6) ^ $unsigned((7'h44)))) ?
              wire1 : (&((wire7 ? (7'h42) : wire5) <= {wire8, wire8}))));
    end
  always
    @(posedge clk) begin
      if (((|wire8) ?
          $signed($unsigned(wire2[(2'h3):(1'h1)])) : (((^(wire6 ?
                  reg9 : wire4)) & ((&wire3) ? (~|(8'hbc)) : (~wire7))) ?
              ((|wire6) + ((~reg11) >> ((7'h41) & wire7))) : wire1)))
        begin
          reg12 <= $unsigned(reg10[(1'h0):(1'h0)]);
          reg13 <= wire8[(2'h3):(1'h1)];
          reg14 <= $signed($unsigned(reg10[(3'h4):(1'h0)]));
        end
      else
        begin
          reg12 <= {(wire3 ?
                  ($unsigned((~wire8)) ?
                      (|wire2[(4'hb):(3'h6)]) : $unsigned((wire8 ?
                          wire3 : reg13))) : $unsigned(((wire1 || reg14) ?
                      wire2[(3'h7):(2'h2)] : $signed(wire8))))};
          reg13 <= (wire5 ?
              (~^(wire5[(1'h1):(1'h0)] == ((reg11 - (8'h9d)) ?
                  $signed(reg11) : {wire6,
                      wire4}))) : $signed($signed($signed((~reg14)))));
          reg14 <= ((8'haf) ?
              wire0[(1'h1):(1'h0)] : (~$signed(((&wire2) ?
                  $unsigned(reg10) : (wire3 ? reg10 : wire5)))));
          reg15 <= (reg9[(3'h4):(1'h0)] - $signed((!(^~reg10))));
          reg16 <= $unsigned((reg13[(3'h5):(3'h5)] & (&(|$signed(wire1)))));
        end
      reg17 <= ($signed(reg9) != (~&(!reg10)));
      reg18 <= wire7;
      reg19 <= (|wire4[(3'h4):(1'h1)]);
    end
endmodule
