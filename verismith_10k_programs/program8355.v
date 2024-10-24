module top
#(parameter param20 = (8'hbd), 
parameter param21 = (((({param20, param20} - ((8'h9f) <<< param20)) ? param20 : ((~|param20) > {param20, param20})) <= param20) || (8'h9e)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  assign y = {wire9,
                 wire8,
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
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = ($signed((+((wire5 ?
                     wire2 : wire4) || (wire2 + wire1)))) == wire2);
  assign wire7 = $unsigned($signed({wire4}));
  assign wire8 = (wire1 & wire3);
  assign wire9 = {wire8, wire5[(3'h4):(1'h0)]};
  always
    @(posedge clk) begin
      if (wire1)
        begin
          if ((^(^~$unsigned(($unsigned(wire8) && wire6)))))
            begin
              reg10 <= (~^wire8);
              reg11 <= $signed($unsigned((^~(^$signed((8'hab))))));
            end
          else
            begin
              reg10 <= ({$signed($signed((~reg11)))} ?
                  $unsigned($signed($signed(wire0))) : ((~|(-wire0[(1'h1):(1'h0)])) <<< (((-wire7) << ((8'hb6) ?
                      wire1 : wire9)) & wire1[(4'ha):(4'h9)])));
              reg11 <= (({$unsigned((~&wire7)),
                      ($unsigned(wire2) <<< (wire6 <= wire6))} ?
                  {$unsigned($signed((8'ha6))),
                      {(8'h9d)}} : (-$unsigned($signed(wire4)))) ^ $unsigned((({(8'hb0)} ^~ (wire2 ?
                  reg11 : reg10)) || ($signed(wire7) ?
                  wire6[(4'hc):(3'h7)] : $unsigned(wire6)))));
            end
          reg12 <= (-{wire2[(2'h3):(1'h1)]});
          reg13 <= wire5;
          reg14 <= ((|(^(wire3 >>> reg10[(3'h4):(3'h4)]))) ?
              (~&$signed({wire1[(3'h5):(2'h3)],
                  (~&wire5)})) : ((wire3[(1'h1):(1'h1)] ?
                      {reg13[(1'h1):(1'h0)],
                          reg12[(1'h1):(1'h0)]} : $signed((wire2 ?
                          reg10 : reg11))) ?
                  ((~&wire1[(3'h4):(3'h4)]) < reg10[(2'h3):(1'h1)]) : wire7));
          if ((wire3 ? (8'ha7) : $signed(wire2[(5'h13):(4'h8)])))
            begin
              reg15 <= {wire6};
              reg16 <= ($unsigned(wire8[(3'h4):(2'h3)]) + wire5[(1'h0):(1'h0)]);
              reg17 <= (($unsigned(wire5) | (~|((|reg13) ?
                      (wire5 ? wire9 : reg15) : $unsigned(wire4)))) ?
                  {(reg10[(1'h0):(1'h0)] ?
                          $signed(wire8[(2'h2):(1'h0)]) : (|(reg14 >> wire8))),
                      $unsigned(reg12[(3'h6):(1'h1)])} : $signed((+wire6[(3'h4):(2'h2)])));
              reg18 <= $signed({(!$signed($signed(reg11))),
                  (wire1[(2'h2):(1'h0)] > ({reg17, wire5} ?
                      reg15[(1'h0):(1'h0)] : reg12))});
              reg19 <= reg12[(3'h7):(2'h2)];
            end
          else
            begin
              reg15 <= $signed(reg15);
              reg16 <= $unsigned(wire8);
              reg17 <= (reg10[(1'h0):(1'h0)] >> reg10[(2'h2):(2'h2)]);
            end
        end
      else
        begin
          reg10 <= reg15[(2'h3):(1'h1)];
          reg11 <= reg18;
          reg12 <= (~^(wire1[(1'h1):(1'h1)] ?
              reg11[(3'h5):(3'h4)] : {{$unsigned(wire8), (8'haf)}}));
          reg13 <= (&$signed((~^$unsigned({wire0}))));
          reg14 <= (($unsigned(wire0) ?
                  (reg18[(3'h4):(2'h2)] <= (^$unsigned(wire9))) : wire0[(2'h2):(1'h0)]) ?
              wire4 : wire5[(1'h1):(1'h0)]);
        end
    end
endmodule
