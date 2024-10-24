module top
#(parameter param29 = {(((((8'hba) ? (8'had) : (8'ha8)) && {(8'hbd), (8'hbc)}) & (((8'hb9) ? (8'ha2) : (8'had)) ^ ((8'hab) ^ (8'hb0)))) ? ((((7'h42) && (8'hb4)) + ((8'hbe) | (8'ha2))) ? (((8'h9e) ? (8'had) : (8'ha8)) << {(8'ha9), (8'ha5)}) : (((8'h9d) != (8'h9d)) + (~|(8'haf)))) : (({(8'hbc)} > ((8'hb4) >= (8'hb0))) & (8'ha7))), (^~(8'ha2))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg10,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = ((+$signed((wire3[(2'h2):(1'h0)] ?
                         (wire1 < wire0) : {wire2}))) ?
                     ($signed((wire4 >>> (wire1 ? wire2 : wire0))) ?
                         {$signed({wire3,
                                 wire3})} : wire0) : wire4[(2'h2):(1'h1)]);
  assign wire7 = (8'ha0);
  assign wire8 = ((($signed(wire4[(2'h2):(1'h1)]) ?
                         $signed((+wire6)) : wire1[(1'h0):(1'h0)]) <<< wire7[(4'hc):(3'h6)]) ?
                     $unsigned(wire1) : (^~wire1));
  assign wire9 = wire2[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      if ((wire9[(3'h7):(1'h0)] ? $signed((8'ha7)) : wire7[(5'h11):(4'hb)]))
        begin
          if ((wire9 ?
              wire4 : (~&(wire9[(5'h11):(3'h4)] ?
                  $signed((wire1 <= wire1)) : (-$unsigned(wire7))))))
            begin
              reg10 <= wire2;
            end
          else
            begin
              reg10 <= wire2[(2'h2):(1'h1)];
              reg11 <= (8'ha0);
              reg12 <= (&wire5[(4'h9):(3'h7)]);
            end
          reg13 <= ((8'h9e) * $signed(($unsigned((reg10 == (8'h9e))) << wire5[(1'h1):(1'h0)])));
          if ($unsigned({$unsigned((reg11 ?
                  (wire9 ~^ wire1) : $signed(wire0)))}))
            begin
              reg14 <= (~|$signed(reg13[(3'h4):(2'h3)]));
              reg15 <= $unsigned($unsigned($signed((|(~reg13)))));
            end
          else
            begin
              reg14 <= $signed((+$unsigned($signed((|reg13)))));
              reg15 <= wire3[(4'hb):(1'h1)];
              reg16 <= ($signed($unsigned(wire6[(5'h12):(5'h12)])) ^ $unsigned($unsigned(wire8[(1'h0):(1'h0)])));
            end
          reg17 <= ($unsigned((~|(^{(7'h41),
              wire8}))) ^~ $signed($unsigned({(reg12 ? wire3 : (8'hb8)),
              $signed((8'hb9))})));
          reg18 <= reg13;
        end
      else
        begin
          reg10 <= wire9[(4'ha):(2'h3)];
          reg11 <= {reg14[(3'h5):(1'h0)]};
          reg12 <= wire3[(3'h4):(1'h0)];
          reg13 <= $unsigned({wire9[(5'h10):(4'hd)]});
        end
      reg19 <= (~&(wire4 ? {wire5[(2'h3):(2'h3)]} : $unsigned(wire8)));
      if ($unsigned(wire1[(1'h0):(1'h0)]))
        begin
          reg20 <= (~&($unsigned($unsigned($signed(reg14))) ^ (reg10 ^~ $unsigned(reg13[(2'h3):(1'h0)]))));
          reg21 <= $unsigned({(&(^~$signed(wire8)))});
          reg22 <= (reg18 ? $signed(wire5) : $signed(reg17));
          reg23 <= (~reg22);
          if (((((wire4 ?
                  (reg18 ?
                      wire1 : reg17) : $signed(wire2)) <= $unsigned(wire7[(3'h7):(3'h5)])) << ($signed(wire8) << wire4)) ?
              (reg17[(3'h4):(1'h1)] ?
                  wire5 : $unsigned((~^$unsigned(reg15)))) : $unsigned(reg20)))
            begin
              reg24 <= {(^(~|$signed($signed(reg10)))), wire5[(3'h6):(3'h4)]};
              reg25 <= {(($unsigned($signed(reg16)) ?
                          (^~reg11[(5'h11):(3'h4)]) : $signed((-wire9))) ?
                      (({wire0} ? reg11[(5'h10):(4'ha)] : $signed(reg24)) ?
                          (reg16 ?
                              (wire5 & reg12) : $unsigned((8'haa))) : $unsigned((~|reg17))) : $unsigned(wire8[(1'h1):(1'h0)])),
                  $unsigned(wire3)};
              reg26 <= reg13[(3'h4):(3'h4)];
            end
          else
            begin
              reg24 <= $unsigned($signed((((|reg25) ?
                      reg10[(2'h2):(1'h1)] : {reg17, wire4}) ?
                  (8'hb0) : (reg14 * reg26[(5'h10):(4'h8)]))));
              reg25 <= (reg18 ? $signed((8'hab)) : (~reg23));
              reg26 <= reg24[(4'hc):(3'h6)];
            end
        end
      else
        begin
          reg20 <= ($signed(((((8'ha0) && reg15) ^ $signed(reg11)) ?
              ((reg13 ?
                  reg17 : reg11) ~^ $unsigned(wire3)) : (|reg18))) == ((&(reg14[(2'h3):(2'h3)] != (wire1 + reg18))) > (((reg24 ?
              (8'hb5) : wire4) - wire9) >> $signed((reg17 ?
              (7'h41) : reg24)))));
          reg21 <= reg23;
          reg22 <= wire6[(5'h11):(5'h11)];
          reg23 <= $unsigned((8'ha1));
        end
    end
  assign wire27 = $signed($signed($signed((reg18[(3'h5):(2'h3)] >> wire3))));
  assign wire28 = {wire6[(4'ha):(2'h3)]};
endmodule
