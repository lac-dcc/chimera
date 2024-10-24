module top
#(parameter param26 = (7'h43), 
parameter param27 = (((param26 ^~ (~^(param26 <<< param26))) <<< (((param26 >= param26) >>> (param26 ? param26 : param26)) != param26)) ? ((-({param26} ^ param26)) > (((param26 ? param26 : param26) << (param26 + param26)) * (|(8'ha6)))) : ((8'hab) ? param26 : (!((param26 == param26) ? param26 : (~^(8'hb1)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  assign y = {wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (~|((((!(8'h9d)) ?
                             (wire3 ? wire2 : (8'hb0)) : $unsigned(wire3)) ?
                         wire1 : wire2) ?
                     (~|$signed(wire3)) : ($unsigned(wire2[(2'h2):(1'h1)]) ?
                         $signed(wire2[(3'h6):(1'h0)]) : wire0[(2'h2):(2'h2)])));
  assign wire5 = $signed(({(+(~|wire3))} != $signed(((^~(8'ha7)) + wire3[(5'h11):(4'h9)]))));
  assign wire6 = (~(wire1 < ((~|$unsigned(wire0)) << wire0)));
  assign wire7 = (wire5 ^~ $signed(wire4));
  assign wire8 = ($unsigned((~&($signed(wire1) << wire0[(1'h0):(1'h0)]))) && ($unsigned($signed(((8'hb6) ?
                         wire7 : wire1))) ?
                     wire7[(4'h9):(1'h1)] : $unsigned({$signed(wire3)})));
  assign wire9 = wire1;
  assign wire10 = wire0;
  always
    @(posedge clk) begin
      reg11 <= (!wire1[(1'h1):(1'h1)]);
      if (((|$signed({(+(8'ha9)), (wire6 + wire7)})) & wire6[(5'h14):(3'h6)]))
        begin
          reg12 <= $signed(wire0);
          reg13 <= ($unsigned((wire10[(1'h0):(1'h0)] <= wire6[(4'hc):(4'h9)])) ?
              (8'hb3) : (&(|(reg12[(3'h4):(1'h1)] << reg11[(2'h3):(2'h3)]))));
          if ({$unsigned((!(wire4 >= $unsigned(wire7)))), reg12})
            begin
              reg14 <= ($unsigned({(+(wire6 <<< reg12))}) ?
                  (({(wire2 + reg12)} >> $signed(reg11[(2'h2):(1'h0)])) || wire10[(3'h6):(1'h1)]) : $unsigned(({(^(8'h9c)),
                          $signed(wire5)} ?
                      (-(wire7 ? wire8 : (8'h9c))) : {(^wire8),
                          $signed(wire2)})));
            end
          else
            begin
              reg14 <= wire1;
              reg15 <= $signed($unsigned({(-{wire1}), (^wire2)}));
              reg16 <= $unsigned(wire4[(4'ha):(4'ha)]);
              reg17 <= {(($unsigned((wire5 ? wire2 : wire1)) ?
                          reg16[(1'h1):(1'h1)] : (reg16[(3'h6):(3'h5)] <= wire6)) ?
                      wire3[(4'ha):(3'h4)] : wire7[(4'hd):(3'h6)]),
                  $unsigned($signed($signed(reg13[(3'h6):(1'h0)])))};
            end
          reg18 <= wire3;
          if ($unsigned($signed(reg13)))
            begin
              reg19 <= wire9;
              reg20 <= ((($signed((reg14 ?
                      (7'h44) : wire9)) >= $unsigned(wire1[(4'h8):(2'h2)])) || $signed(((wire6 >> reg19) ?
                      wire6[(4'hf):(4'hb)] : reg17[(2'h3):(1'h1)]))) ?
                  (($unsigned($unsigned(wire7)) * $unsigned($signed((8'hbe)))) ?
                      $unsigned(reg15[(3'h5):(1'h0)]) : {(&(wire8 ?
                              wire5 : wire0)),
                          $signed((-wire3))}) : reg18[(3'h4):(1'h0)]);
              reg21 <= reg20;
              reg22 <= reg21;
            end
          else
            begin
              reg19 <= $unsigned($signed(wire2));
              reg20 <= $unsigned((wire2[(3'h4):(2'h2)] > (!wire0)));
              reg21 <= (~|$unsigned((-wire4)));
              reg22 <= $signed((8'hab));
            end
        end
      else
        begin
          reg12 <= ($unsigned((wire5 - reg19)) ? reg19 : reg15);
          reg13 <= {$unsigned(($signed(reg21[(5'h12):(4'hd)]) ?
                  ((wire3 > wire9) ?
                      reg12[(1'h1):(1'h0)] : (wire2 ?
                          reg14 : (8'hb9))) : reg16[(2'h2):(2'h2)]))};
          if ($signed(reg11))
            begin
              reg14 <= (!{(~&($signed((8'h9f)) + (|(8'hab))))});
              reg15 <= ((&($signed((reg21 ?
                  (8'hae) : wire6)) + $signed({(8'hb3)}))) <<< $unsigned($signed(((wire8 ?
                  wire10 : (8'ha0)) < reg20))));
            end
          else
            begin
              reg14 <= (reg22 ?
                  $unsigned(($unsigned(reg22) ?
                      (|$unsigned(wire4)) : {(reg20 > wire8),
                          reg15})) : wire7[(1'h0):(1'h0)]);
              reg15 <= (!$unsigned((8'hb0)));
              reg16 <= reg13;
              reg17 <= reg20;
              reg18 <= (8'hbd);
            end
          if ((^~(+($signed($unsigned(reg19)) >>> (reg17[(4'hd):(2'h3)] ?
              $signed(wire10) : $unsigned((8'hb4)))))))
            begin
              reg19 <= $signed(wire8);
              reg20 <= (~&$unsigned({((reg14 >> reg11) ?
                      (reg20 <<< (7'h41)) : (|reg21))}));
              reg21 <= (^~wire6[(3'h5):(1'h0)]);
            end
          else
            begin
              reg19 <= ((wire6 | $unsigned($signed((reg14 ? wire3 : reg21)))) ?
                  (&reg20[(2'h2):(1'h0)]) : wire0);
            end
          reg22 <= $unsigned($unsigned(($signed((^wire5)) ?
              $signed((reg20 < wire5)) : $unsigned((^~wire9)))));
        end
      reg23 <= $unsigned(($signed(wire2[(2'h3):(1'h1)]) ~^ $unsigned($unsigned(wire10[(3'h6):(2'h3)]))));
      reg24 <= ((reg18[(3'h5):(3'h4)] ?
          $unsigned(wire6) : ((~&reg23[(5'h15):(4'hb)]) ?
              reg20[(3'h7):(1'h1)] : reg23)) ~^ reg19);
      reg25 <= {reg13};
    end
endmodule
