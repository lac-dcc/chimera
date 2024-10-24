module top
#(parameter param22 = ((&(!((~|(8'hab)) && (&(8'ha4))))) >= (8'ha0)), 
parameter param23 = (!{param22, (({param22, param22} >= ((8'h9c) ? param22 : param22)) < {param22, (8'hb7)})}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg9,
                 (1'h0)};
  assign wire5 = $signed(((((wire4 ^~ wire2) && $signed(wire2)) == {$signed(wire1),
                         wire3[(4'ha):(3'h4)]}) ?
                     (~^(7'h42)) : (({wire4, wire1} + ((8'ha9) || wire0)) ?
                         $signed((wire2 ?
                             wire3 : wire3)) : $signed((~|wire2)))));
  assign wire6 = wire1;
  assign wire7 = $signed(wire1[(1'h1):(1'h0)]);
  assign wire8 = {wire1, wire3};
  always
    @(posedge clk) begin
      if ((~|((wire3 & ($signed(wire8) ?
              ((8'ha0) || wire4) : $unsigned(wire3))) ?
          ($signed((|(8'hbe))) ?
              $signed($unsigned(wire8)) : (^wire3)) : (wire6[(2'h2):(1'h0)] <<< wire1))))
        begin
          if (wire8)
            begin
              reg9 <= $signed(wire4[(5'h12):(5'h12)]);
              reg10 <= {{wire0[(3'h5):(1'h1)],
                      (^({(8'hbf)} <<< $unsigned((8'ha9))))}};
            end
          else
            begin
              reg9 <= $signed(wire8);
              reg10 <= (((&(wire8 ? wire3 : $unsigned(wire2))) + wire8) ?
                  ((reg10[(4'he):(4'h9)] == (~&wire1[(4'hc):(2'h2)])) ?
                      ((~^wire0[(4'hb):(3'h6)]) ?
                          wire3[(1'h0):(1'h0)] : ((wire0 ?
                              reg9 : reg9) > (wire2 | (8'ha7)))) : wire5) : wire3);
              reg11 <= (8'ha4);
              reg12 <= wire2[(2'h2):(1'h0)];
              reg13 <= ((~(~^wire6[(2'h2):(1'h0)])) ?
                  ({$signed((&(8'ha7))),
                      (((7'h40) - reg12) ?
                          (reg10 ?
                              (8'hbf) : wire0) : reg12)} >= $signed($unsigned(reg12))) : $signed((reg12[(1'h0):(1'h0)] >> wire1)));
            end
          reg14 <= ($unsigned((($unsigned(reg10) ?
                  (|wire6) : reg13[(1'h1):(1'h1)]) ?
              wire0 : {(reg11 ?
                      wire6 : reg12)})) || (((!$unsigned(reg10)) | (^{wire3})) ^~ (($signed(wire1) | $signed(reg12)) && $unsigned($unsigned((8'ha4))))));
          reg15 <= $unsigned(($unsigned({reg10[(1'h0):(1'h0)],
              {reg9, wire8}}) < $signed(reg14)));
        end
      else
        begin
          reg9 <= (|reg12);
          if ((((reg10[(5'h14):(5'h14)] ?
              {$signed(wire1),
                  $signed(wire3)} : reg15) ~^ {$unsigned((!(8'hbd)))}) ^ ({wire4} - (((^~wire4) > $unsigned(wire1)) ~^ (8'hbc)))))
            begin
              reg10 <= (&(8'hba));
              reg11 <= $signed((wire6 >>> ((~|$unsigned(reg9)) ?
                  wire1 : (wire6[(1'h0):(1'h0)] != $unsigned(wire7)))));
              reg12 <= $signed((|$unsigned(wire0)));
            end
          else
            begin
              reg10 <= reg9[(1'h0):(1'h0)];
              reg11 <= (reg12[(3'h7):(1'h0)] > $unsigned((wire4[(4'hf):(1'h0)] < (wire5[(5'h12):(4'ha)] ?
                  $signed((8'hac)) : (~^wire3)))));
              reg12 <= (8'hbc);
              reg13 <= (((8'ha0) ?
                  (($unsigned(reg12) ?
                      reg14 : ((8'hb9) ?
                          wire8 : wire1)) == $signed({wire5})) : (({reg12} ?
                      $signed(wire3) : (reg13 >>> (8'hbc))) ~^ $unsigned(wire6))) <<< (!{reg11}));
              reg14 <= reg15;
            end
          if ((^~{(~reg11[(4'hc):(1'h1)]), $unsigned(reg9[(2'h2):(1'h0)])}))
            begin
              reg15 <= wire6;
            end
          else
            begin
              reg15 <= (wire1 ?
                  {$unsigned($signed($signed(wire4))),
                      (^((wire1 ? reg10 : wire2) ?
                          ((8'h9c) ? (8'ha1) : wire6) : (reg14 ?
                              wire1 : reg12)))} : (((reg11 >= (wire7 ?
                          wire2 : reg11)) ?
                      reg14[(2'h3):(2'h2)] : (reg15 && (reg9 ?
                          reg12 : reg13))) >>> ({{wire3,
                          reg9}} ~^ $unsigned(wire0))));
            end
          if (($unsigned((((wire8 + (8'hbf)) ? wire6 : wire1[(2'h3):(2'h3)]) ?
              ($unsigned(wire1) >> (8'hbd)) : (~(reg9 ?
                  reg9 : reg12)))) >= ((~(8'hb8)) && {({wire5,
                  wire7} ^~ $unsigned(reg10))})))
            begin
              reg16 <= (~&wire3[(3'h7):(3'h5)]);
            end
          else
            begin
              reg16 <= (^~((^~(wire0 ~^ (reg14 ? (8'ha3) : wire2))) ?
                  wire0[(4'hb):(3'h4)] : (($signed(wire7) ?
                      $signed(wire5) : wire1[(4'h9):(3'h7)]) << (((8'hb1) ?
                          wire5 : wire8) ?
                      (wire7 ? wire5 : wire7) : reg16))));
            end
          reg17 <= (({{{reg11}, (reg12 ? reg13 : reg13)},
                      ((wire5 >>> wire4) ~^ ((8'ha7) << wire5))} ?
                  ({(reg10 > reg12), {reg11}} ?
                      ((~^wire7) - wire1[(4'hd):(4'h8)]) : $unsigned((~wire6))) : (($signed((8'ha9)) ?
                      $signed(wire7) : (~|reg14)) < {(~wire8),
                      wire3[(4'h9):(1'h0)]})) ?
              (reg10 >= reg11[(4'hf):(4'hb)]) : reg10);
        end
      reg18 <= reg15[(1'h1):(1'h1)];
      reg19 <= $signed($signed(wire5));
      reg20 <= $unsigned(((|$unsigned($unsigned(reg14))) + (7'h40)));
      reg21 <= reg19[(1'h0):(1'h0)];
    end
endmodule
