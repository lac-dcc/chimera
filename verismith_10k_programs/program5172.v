module top
#(parameter param22 = (^~{{(~&((7'h41) <= (8'ha2)))}}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire5,
                 wire4,
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
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire0[(1'h1):(1'h0)];
  assign wire5 = $unsigned(wire4[(4'h8):(2'h3)]);
  always
    @(posedge clk) begin
      if ((|((+($unsigned((8'ha3)) ? wire4 : (-wire3))) ?
          (((wire2 ? (7'h44) : wire4) ? $signed(wire0) : $signed(wire3)) ?
              (wire5 || wire3) : (|$unsigned(wire1))) : (~^(wire1 >> wire2)))))
        begin
          reg6 <= (|((wire0[(4'hb):(4'h8)] ?
                  {{wire4, (8'hbf)}, $signed(wire1)} : wire0) ?
              (8'hb1) : {{(wire5 > wire0)}, $signed($signed(wire1))}));
          if ($unsigned(reg6))
            begin
              reg7 <= $unsigned(wire3);
              reg8 <= reg7[(4'ha):(4'h8)];
              reg9 <= reg6;
            end
          else
            begin
              reg7 <= (|$signed((|{wire2})));
              reg8 <= $signed((~(((8'h9f) <<< $signed(reg8)) ?
                  (8'hba) : wire0)));
            end
          reg10 <= (wire4[(4'ha):(1'h0)] ?
              $signed(($unsigned((wire0 ? wire1 : wire0)) ?
                  reg8 : $signed((~|wire2)))) : $signed({((8'hb3) ?
                      wire2[(4'hb):(3'h6)] : $signed(reg6)),
                  ($signed((8'h9f)) ? (wire5 << (8'ha9)) : $signed(wire4))}));
          reg11 <= (reg8[(2'h2):(1'h0)] >>> $signed((|reg7[(1'h0):(1'h0)])));
          if ($unsigned((wire2[(5'h15):(3'h5)] ?
              reg7[(4'h9):(1'h1)] : (({(8'hb4), (8'hba)} ? (~&reg6) : reg6) ?
                  (reg11[(2'h2):(1'h1)] ^~ (reg6 ?
                      wire0 : (8'haa))) : wire2[(4'ha):(3'h5)]))))
            begin
              reg12 <= (({reg7, ($unsigned((8'h9d)) ? wire0 : $signed(wire2))} ?
                      $signed({(wire0 >>> wire2)}) : ($signed($signed(wire1)) ?
                          (!wire2) : $signed((wire0 ^~ reg8)))) ?
                  wire1 : ((reg11[(3'h5):(1'h1)] == ($signed(wire3) | $unsigned(reg10))) | ($signed($unsigned((7'h40))) * $signed($signed((8'hbb))))));
              reg13 <= {$signed(reg11),
                  $unsigned((^~($unsigned(reg7) ?
                      (reg9 ^ (8'ha2)) : (wire5 < reg8))))};
              reg14 <= $unsigned(reg11);
              reg15 <= $signed((&{((wire1 != reg7) - reg10)}));
            end
          else
            begin
              reg12 <= (-(({(!reg15)} ?
                      $unsigned(wire1[(3'h4):(1'h0)]) : reg6[(1'h1):(1'h0)]) ?
                  (~|$signed(wire5)) : ({(wire0 ?
                          (8'hb9) : reg8)} < $unsigned(reg7))));
            end
        end
      else
        begin
          reg6 <= (&wire2);
          reg7 <= reg12[(3'h5):(2'h3)];
          reg8 <= (reg6 ?
              (reg13[(3'h7):(3'h7)] && (^(~&$unsigned(reg8)))) : (($signed((reg7 ?
                          wire5 : (8'ha5))) ?
                      ($unsigned((8'hb6)) <<< (reg12 ?
                          wire0 : reg10)) : (^(wire3 > reg6))) ?
                  $signed((~(8'hbe))) : $signed(reg8)));
          if ({($signed((reg12[(4'he):(2'h3)] < ((8'ha3) && reg10))) ?
                  reg11[(3'h5):(1'h1)] : (-({reg13, wire0} <<< {reg13})))})
            begin
              reg9 <= ((~(wire2[(5'h15):(5'h15)] && ((|reg11) ?
                      (reg6 && (8'hba)) : (~&wire1)))) ?
                  {$signed($signed($unsigned(reg8)))} : {($unsigned(reg14[(4'h9):(1'h1)]) ^ ({(8'hbe),
                          reg11} - (wire4 ~^ (8'haf)))),
                      $signed((reg13 ?
                          $unsigned(wire2) : (reg12 ? reg15 : (8'hb5))))});
              reg10 <= reg15;
              reg11 <= reg10[(3'h6):(3'h5)];
            end
          else
            begin
              reg9 <= (8'ha5);
              reg10 <= (~&(~&($unsigned(wire5[(4'hf):(3'h4)]) & reg14)));
              reg11 <= ($signed(reg10) * (reg9[(3'h5):(1'h0)] ?
                  $unsigned((^wire5[(4'he):(3'h4)])) : wire4));
            end
          reg12 <= ((&reg7[(5'h10):(2'h2)]) ?
              $signed({(((8'hab) * wire3) ?
                      $signed((8'hab)) : reg10[(3'h7):(3'h4)]),
                  reg9[(4'hb):(1'h1)]}) : $signed({((wire5 ?
                      reg8 : reg10) & (^~wire2)),
                  $signed((reg9 ? reg10 : wire1))}));
        end
      reg16 <= (^(~^({wire1, (7'h41)} ? $signed($signed(reg15)) : reg7)));
      reg17 <= (^(($signed((~(8'hbc))) == ($unsigned((8'ha4)) ?
              wire0[(4'hf):(3'h5)] : reg7[(5'h10):(4'hc)])) ?
          ($signed($signed(wire3)) ~^ (|(reg13 ?
              reg6 : wire0))) : {reg12[(3'h6):(1'h1)], reg10}));
      reg18 <= reg10[(4'h8):(3'h5)];
    end
  assign wire19 = {wire5[(2'h2):(1'h0)],
                      ($unsigned($signed(wire3[(3'h4):(2'h3)])) << ((reg13 ?
                          reg8[(1'h1):(1'h0)] : reg13[(4'ha):(3'h5)]) > (+(-wire3))))};
  assign wire20 = (($signed($unsigned((~reg13))) << $signed(reg13[(5'h13):(4'h8)])) ?
                      wire1 : {((8'hbf) >= $signed($unsigned(reg17)))});
  assign wire21 = ($unsigned((8'ha2)) ?
                      $unsigned(reg18[(3'h4):(1'h1)]) : $signed(({((8'hb4) && reg13)} >> ({reg15,
                              reg6} ?
                          $signed(wire2) : reg12))));
endmodule
