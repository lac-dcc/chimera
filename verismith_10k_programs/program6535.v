module top
#(parameter param27 = ((!(((~(7'h42)) ? ((8'hb2) ? (8'ha6) : (8'hbe)) : {(8'hb9)}) << {(+(8'h9f)), (~&(8'ha0))})) ? (((^~((8'ha5) * (8'ha8))) ? {(~(8'hb1))} : ((~|(7'h41)) ? (-(8'hac)) : ((7'h43) >= (8'hbf)))) ? (((~|(7'h43)) != (8'ha5)) ? (~&((8'hb4) ? (8'hb0) : (8'had))) : (((8'h9e) ? (8'ha2) : (7'h41)) || ((8'hb6) ? (8'ha5) : (7'h44)))) : ({((8'ha9) >>> (8'had)), (^(8'hbe))} >>> (((8'hb6) & (8'haf)) >> ((8'hb9) | (8'hb3))))) : (^((-(~&(7'h40))) >>> (|(8'hb6))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire0)
        begin
          if (((wire4[(2'h2):(1'h1)] ?
              wire2[(1'h0):(1'h0)] : {((wire4 != wire1) | (wire0 >>> wire0))}) | ($unsigned(($signed(wire0) >= {wire0,
                  wire4})) ?
              wire1[(3'h7):(3'h6)] : $signed($signed({wire1, wire4})))))
            begin
              reg5 <= (+(wire0[(2'h2):(1'h1)] | (wire4 ?
                  $signed($signed(wire2)) : ((!wire4) + wire3[(4'hd):(2'h3)]))));
              reg6 <= wire1;
              reg7 <= wire1;
            end
          else
            begin
              reg5 <= $signed(wire1);
              reg6 <= reg6;
              reg7 <= ((({$signed(reg5)} > (8'hbf)) ^ reg6) ^~ wire0[(2'h2):(2'h2)]);
            end
          reg8 <= $unsigned(reg7);
        end
      else
        begin
          if ((wire4 ? $signed(wire0) : wire0[(2'h2):(1'h0)]))
            begin
              reg5 <= (wire3 ?
                  (|$unsigned((^reg6[(5'h10):(5'h10)]))) : ($signed($signed((wire0 && (8'hb2)))) && (wire1[(4'h8):(2'h3)] ?
                      (~&(!(8'ha0))) : $signed($signed((8'hae))))));
              reg6 <= $signed(wire4[(3'h6):(1'h0)]);
              reg7 <= wire0;
            end
          else
            begin
              reg5 <= ((wire4[(1'h0):(1'h0)] ?
                      (wire4[(2'h3):(1'h0)] == wire4[(3'h4):(1'h0)]) : $signed(reg6)) ?
                  {($signed((wire1 ^~ reg5)) ?
                          {(wire0 >= reg7),
                              wire3[(4'hf):(4'he)]} : {(wire4 < wire1),
                              (|reg5)}),
                      (&($unsigned(wire0) ?
                          ((8'haf) ? (7'h40) : wire3) : (wire4 ?
                              reg5 : wire0)))} : (8'haf));
              reg6 <= wire4[(3'h4):(1'h1)];
              reg7 <= ($signed((+(~|$unsigned(wire0)))) + $signed($unsigned(wire3)));
            end
          reg8 <= (reg6[(2'h2):(1'h0)] ?
              (&wire2[(1'h1):(1'h1)]) : $unsigned($signed(($unsigned((8'hb5)) >= {reg6,
                  reg6}))));
          reg9 <= (wire1 ^~ reg5[(4'hb):(2'h3)]);
          reg10 <= wire4[(3'h5):(1'h1)];
        end
      reg11 <= reg8;
      reg12 <= wire0[(1'h1):(1'h0)];
    end
  assign wire13 = wire2;
  assign wire14 = (reg7 <= wire0);
  assign wire15 = (~|reg5[(5'h13):(4'hd)]);
  always
    @(posedge clk) begin
      if (wire4[(3'h5):(1'h1)])
        begin
          reg16 <= {{((+(!reg5)) ?
                      {wire15[(1'h1):(1'h0)]} : (!(reg9 ^ (8'hbf))))}};
          reg17 <= $signed(wire14[(3'h4):(3'h4)]);
          reg18 <= (7'h42);
          reg19 <= wire13;
        end
      else
        begin
          if ((wire3 ?
              wire2[(2'h2):(1'h1)] : (reg8[(2'h3):(1'h1)] ^ $unsigned((8'hb5)))))
            begin
              reg16 <= ($signed((wire2 || $signed($signed(wire14)))) ?
                  (-(|((reg6 ? wire4 : reg5) ?
                      $unsigned(reg16) : {reg12}))) : $unsigned($unsigned($unsigned(reg11))));
              reg17 <= ((reg9 <<< (8'hb0)) ?
                  $unsigned(($signed((reg12 >>> wire0)) - reg11)) : $signed({{$unsigned(wire14)}}));
              reg18 <= (~$unsigned(wire14));
              reg19 <= $unsigned((wire15[(2'h2):(2'h2)] ?
                  (reg11[(4'hd):(4'hd)] ?
                      reg18 : (8'hba)) : reg17[(2'h3):(2'h3)]));
            end
          else
            begin
              reg16 <= wire14;
              reg17 <= $unsigned($unsigned(reg6));
              reg18 <= reg17[(2'h3):(1'h1)];
            end
          reg20 <= $signed($unsigned(wire1[(1'h1):(1'h0)]));
          if ({reg19[(4'he):(3'h7)], wire15})
            begin
              reg21 <= reg10[(3'h4):(2'h2)];
              reg22 <= {reg8[(3'h5):(2'h2)]};
              reg23 <= (|wire3[(4'h9):(4'h9)]);
              reg24 <= $unsigned(reg12[(4'hc):(4'h9)]);
            end
          else
            begin
              reg21 <= reg11[(3'h5):(3'h4)];
              reg22 <= reg12[(3'h5):(3'h4)];
              reg23 <= wire15;
              reg24 <= (~^reg22[(3'h4):(1'h0)]);
              reg25 <= {$signed(($unsigned(((8'h9f) <= wire0)) ?
                      $signed(reg24) : wire4))};
            end
        end
      reg26 <= (|reg11[(4'hf):(4'hd)]);
    end
endmodule
