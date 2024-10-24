module top
#(parameter param29 = (~&(((-(~(8'hb4))) + ((-(8'hbf)) ^ ((8'ha5) - (8'h9f)))) >= ({((8'hb5) - (8'ha2))} ? ((~&(8'hb3)) >= ((8'hb8) ? (8'ha8) : (8'had))) : ((-(8'hae)) == (+(8'h9d)))))), 
parameter param30 = (((^(param29 + (~|param29))) >= ((8'hbf) || (param29 >= (param29 + param29)))) ? ((!param29) ? ((^~(param29 ? param29 : param29)) ? param29 : param29) : {(&{param29, param29}), (~|(param29 - param29))}) : param29))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  assign y = {wire28,
                 wire24,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg27,
                 reg26,
                 reg25,
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
  assign wire5 = {(~(&((wire3 ? wire1 : wire2) - ((8'ha2) | (8'haa)))))};
  assign wire6 = {wire1[(1'h1):(1'h0)],
                     ($unsigned(((!wire1) ? {wire1, wire1} : wire2)) ?
                         $unsigned($unsigned(wire0)) : wire5[(1'h1):(1'h1)])};
  assign wire7 = $unsigned(wire4[(2'h2):(1'h0)]);
  assign wire8 = wire5[(1'h0):(1'h0)];
  assign wire9 = {(wire4[(3'h6):(3'h6)] < ({(!(8'hb8))} == {((8'hb3) ^ wire1)})),
                     (~(($unsigned((8'ha6)) ?
                         (8'ha2) : (wire8 ?
                             wire1 : wire7)) - (wire6[(4'hf):(4'h8)] ?
                         wire0 : $unsigned(wire8))))};
  assign wire10 = ($signed(((8'hba) ?
                          $unsigned((wire1 < wire7)) : (wire2[(3'h5):(3'h5)] ?
                              wire9 : wire8))) ?
                      ($signed($unsigned(wire1)) << $signed(($signed(wire6) < (wire2 ?
                          wire3 : wire5)))) : wire0);
  always
    @(posedge clk) begin
      reg11 <= (wire1[(2'h2):(2'h2)] ?
          $signed(wire0) : $unsigned((((~|wire9) ?
              (~wire10) : (wire5 ? wire9 : wire2)) ^ (wire1[(1'h1):(1'h1)] ?
              (wire3 < wire2) : wire5))));
      reg12 <= (($unsigned($unsigned(wire8[(3'h7):(3'h5)])) <<< wire6[(3'h5):(2'h3)]) ?
          $unsigned(wire6) : $unsigned(wire6));
      if (wire4[(2'h2):(2'h2)])
        begin
          if (wire5[(3'h4):(2'h3)])
            begin
              reg13 <= wire4;
              reg14 <= (((+$signed((wire7 <<< reg13))) ?
                      (~^$unsigned((wire6 != wire5))) : (8'h9f)) ?
                  (-{(wire4 <= (^reg13))}) : $unsigned($signed($unsigned($unsigned((8'had))))));
            end
          else
            begin
              reg13 <= ($signed(wire7[(2'h2):(1'h0)]) - $unsigned($signed($signed(wire7[(1'h1):(1'h0)]))));
              reg14 <= (reg13[(3'h6):(2'h2)] ?
                  wire3[(2'h3):(2'h3)] : $signed(($unsigned($unsigned((8'hb1))) ?
                      wire7 : $signed((wire10 ? wire0 : (8'ha4))))));
              reg15 <= {wire2,
                  (($signed((wire6 * wire4)) <<< (~|(+wire0))) ?
                      (($signed(reg14) <<< reg11) ?
                          (|{reg12}) : wire8[(3'h5):(1'h0)]) : wire3)};
            end
          reg16 <= ((wire3 ?
              ((|$unsigned((8'hb9))) ?
                  {$unsigned((8'ha9))} : (^~(|wire2))) : wire3[(1'h1):(1'h1)]) > (wire7 < ($unsigned(((8'hb3) <<< reg14)) ?
              $unsigned(reg11) : {reg14, (~wire7)})));
          reg17 <= (((wire1 ?
                  $unsigned((wire3 ^ reg15)) : ((~|(8'hb6)) ?
                      {reg13, reg12} : wire6)) ?
              wire2 : wire1[(1'h1):(1'h0)]) - (reg12 >= wire8));
        end
      else
        begin
          reg13 <= (({($signed(reg14) | $signed(wire2)),
                  $signed((wire10 == wire1))} ^ (((wire5 == (8'hb5)) ?
                      wire5 : ((8'h9e) | wire0)) ?
                  $signed(reg14[(5'h10):(4'hf)]) : (wire2[(2'h3):(1'h1)] | wire1[(1'h1):(1'h0)]))) ?
              $signed(($unsigned($unsigned((8'hab))) ?
                  $unsigned(reg12[(5'h10):(4'hd)]) : reg11)) : {(reg15 || $signed((wire5 > (8'ha9))))});
          reg14 <= (wire7[(1'h0):(1'h0)] ~^ (-(8'haa)));
          if ((~&wire1[(1'h1):(1'h0)]))
            begin
              reg15 <= (wire5[(1'h0):(1'h0)] ?
                  reg11 : (reg11 ?
                      (-$unsigned({wire9, reg17})) : (~|$unsigned({(8'hbe)}))));
              reg16 <= $signed($unsigned((!reg16[(4'ha):(3'h5)])));
              reg17 <= ((8'hb6) ?
                  (+{wire5[(3'h4):(1'h0)],
                      ({reg13} >> (reg14 * reg12))}) : (reg12[(1'h0):(1'h0)] ?
                      ({$signed(wire3)} ?
                          $signed((wire2 ^~ reg17)) : (-wire4)) : reg15[(3'h4):(1'h1)]));
              reg18 <= wire6[(3'h7):(3'h5)];
            end
          else
            begin
              reg15 <= $signed(($unsigned((&(+(8'hbf)))) ?
                  (+$signed(reg12)) : (7'h43)));
              reg16 <= $signed($unsigned(wire10));
            end
          if ((wire10[(3'h7):(1'h0)] ?
              wire1[(1'h0):(1'h0)] : wire7[(2'h3):(1'h0)]))
            begin
              reg19 <= $unsigned(wire3[(3'h7):(1'h1)]);
              reg20 <= $unsigned(((&wire9) | (+{{wire1, wire9}, reg16})));
              reg21 <= (7'h44);
            end
          else
            begin
              reg19 <= wire9[(3'h4):(2'h3)];
              reg20 <= (!(~{wire2[(2'h3):(2'h2)]}));
              reg21 <= (~|$unsigned({{{reg19}}, (+wire3[(3'h4):(2'h3)])}));
            end
          reg22 <= ((&reg17[(4'h9):(4'h9)]) * reg19);
        end
      reg23 <= ((wire10[(2'h3):(1'h1)] ?
              wire5[(1'h0):(1'h0)] : {$unsigned((~(7'h40)))}) ?
          reg20 : reg15[(3'h4):(1'h0)]);
    end
  assign wire24 = reg18[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg25 <= ({{$unsigned((~|(8'haf))), (wire6 || (reg23 << (7'h41)))}} ?
          reg16[(3'h7):(3'h5)] : reg17);
      reg26 <= (wire1[(1'h1):(1'h0)] ?
          (^~{wire1[(1'h1):(1'h1)], (~&(reg17 + wire5))}) : ($unsigned(wire0) ?
              (~|($signed(reg11) * (wire9 || reg22))) : wire2));
      reg27 <= (($signed(wire9[(1'h1):(1'h1)]) ?
          reg18[(3'h4):(1'h0)] : $signed(((reg12 * wire6) ?
              reg14[(4'hc):(3'h7)] : $signed(reg19)))) >> (-{wire4[(2'h3):(2'h2)]}));
    end
  assign wire28 = (reg13[(3'h5):(2'h2)] ? reg18[(4'h9):(4'h9)] : reg16);
endmodule
