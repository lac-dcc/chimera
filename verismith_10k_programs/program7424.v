module top
#(parameter param39 = ({(^~((8'had) >> (+(8'haf))))} ? (~|(((~|(8'hbe)) ? ((8'hb4) ? (8'hbc) : (8'hae)) : ((8'h9f) | (8'ha4))) ? (&((8'hba) ? (8'hbb) : (8'ha3))) : ((^(8'hb7)) != (^(8'h9c))))) : (({((8'hba) || (8'haa)), (+(8'hbc))} ? {(8'h9f)} : (((8'hbe) > (8'ha9)) ~^ ((8'ha7) <<< (8'ha6)))) <<< ((((8'hbd) ? (8'h9e) : (8'hb2)) * ((8'hba) ^~ (8'hbd))) ? (+(~&(8'h9d))) : {(8'haa), ((8'hb5) + (8'hb6))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
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
                 (1'h0)};
  assign wire4 = (7'h43);
  assign wire5 = {{$unsigned((~&(wire4 && wire2))), (~&wire2[(4'ha):(1'h0)])}};
  assign wire6 = $signed($unsigned(($unsigned($signed(wire1)) ~^ ($unsigned(wire1) << wire5[(4'hf):(3'h7)]))));
  assign wire7 = $unsigned(($unsigned({(wire1 || wire2)}) ?
                     $unsigned({$signed(wire5),
                         $unsigned(wire4)}) : wire6[(1'h0):(1'h0)]));
  assign wire8 = (~|$signed(wire4[(3'h6):(2'h2)]));
  assign wire9 = $signed((~&($signed({wire2, wire3}) ?
                     (^wire0[(4'hf):(4'hd)]) : wire1[(3'h5):(2'h2)])));
  assign wire10 = wire6;
  assign wire11 = wire4;
  always
    @(posedge clk) begin
      reg12 <= (8'ha1);
      reg13 <= $unsigned($signed(wire2[(4'hb):(4'h8)]));
    end
  always
    @(posedge clk) begin
      if (wire6)
        begin
          reg14 <= wire0[(2'h3):(1'h1)];
          if ((8'ha5))
            begin
              reg15 <= (~wire5[(3'h5):(1'h0)]);
              reg16 <= wire0;
            end
          else
            begin
              reg15 <= (8'ha0);
            end
          if (((-wire9) ?
              reg12 : (wire4[(4'hd):(4'h9)] ?
                  reg15[(4'hc):(3'h4)] : ($unsigned((^reg15)) ?
                      ($signed(reg14) <<< {wire6, wire1}) : (wire4 ?
                          (-wire8) : wire7)))))
            begin
              reg17 <= wire4[(3'h5):(3'h5)];
              reg18 <= (~^(wire3 + {$signed((~wire8))}));
              reg19 <= wire10[(4'he):(4'ha)];
              reg20 <= ($signed(($unsigned((reg17 ?
                  reg16 : reg14)) == (7'h40))) && (reg14[(2'h2):(1'h1)] - wire0[(3'h6):(2'h3)]));
            end
          else
            begin
              reg17 <= (^((wire10 >>> (^~(reg18 ? (8'ha0) : (8'ha7)))) ?
                  ($signed((-reg14)) && $signed((~^wire10))) : wire9[(3'h6):(2'h2)]));
              reg18 <= wire0;
              reg19 <= ({$signed(($unsigned(reg15) >= $unsigned(wire8))),
                      $signed(reg19[(4'h9):(2'h2)])} ?
                  wire7 : reg15[(5'h14):(3'h7)]);
            end
        end
      else
        begin
          reg14 <= (8'h9d);
          reg15 <= (((wire8[(1'h1):(1'h1)] ?
                  (8'h9d) : ((^~reg12) ?
                      (-wire7) : $unsigned(wire9))) != reg15) ?
              (({$unsigned(wire5), (!(8'ha6))} >> $signed($unsigned(reg18))) ?
                  $signed({(~^reg13)}) : (~&((wire8 >> (8'hb4)) <= $unsigned(wire10)))) : $unsigned((wire0[(4'h9):(3'h6)] >>> wire1[(4'h9):(3'h5)])));
          reg16 <= (~^wire1);
          if (wire5[(2'h2):(1'h1)])
            begin
              reg17 <= wire10[(5'h14):(1'h0)];
            end
          else
            begin
              reg17 <= $unsigned(reg19);
            end
          reg18 <= $unsigned(wire4[(4'he):(4'hb)]);
        end
      reg21 <= (((reg13[(2'h3):(2'h2)] || $signed((wire9 ?
          wire8 : reg14))) - reg17) != wire2);
      reg22 <= ((+$signed(wire0[(4'hf):(3'h4)])) ?
          (((wire1 ? reg14 : (wire5 < wire0)) ? (8'ha2) : {(^(8'h9f))}) ?
              ($signed(wire4[(1'h0):(1'h0)]) != $signed((wire7 * wire9))) : {(reg17[(1'h1):(1'h1)] ?
                      $signed((8'hbe)) : wire6),
                  $signed((wire7 ? reg18 : wire0))}) : reg12);
      if ((8'h9d))
        begin
          if ($signed(reg15))
            begin
              reg23 <= {((($signed(wire4) ? {reg12} : (~wire10)) ?
                      $signed(wire5) : wire11[(2'h3):(2'h3)]) & reg22)};
            end
          else
            begin
              reg23 <= {reg18, (!reg21[(2'h3):(2'h2)])};
              reg24 <= $signed($signed(wire0));
              reg25 <= wire6;
              reg26 <= $signed($unsigned($unsigned(wire2[(2'h2):(2'h2)])));
              reg27 <= (&$signed((~|(~|wire3[(1'h0):(1'h0)]))));
            end
          reg28 <= (~^$signed(reg24));
          if ($unsigned((!(((reg25 ? reg24 : (7'h42)) | (8'hb5)) ?
              wire3 : (8'hb3)))))
            begin
              reg29 <= $signed((((~(wire3 - wire0)) > (^~wire11)) << (!((~|reg13) ?
                  $signed(wire2) : $signed(wire5)))));
              reg30 <= (&$unsigned(((+reg26[(4'hc):(3'h6)]) ?
                  $unsigned(reg29) : ({reg24,
                      (8'hb5)} == wire2[(5'h12):(2'h3)]))));
              reg31 <= ({{reg24,
                      $signed(reg24)}} <<< $signed(((-$signed(wire4)) ?
                  wire7 : $signed(((8'ha7) == (8'hb1))))));
            end
          else
            begin
              reg29 <= (^~(!(wire6 || ({(8'ha0), reg23} ?
                  wire0 : $signed(reg28)))));
              reg30 <= $unsigned(reg22);
              reg31 <= (~^$unsigned((reg25[(1'h0):(1'h0)] ?
                  ((reg26 ? wire4 : reg24) ?
                      (wire2 * (7'h40)) : $signed(reg26)) : (8'hb1))));
            end
          reg32 <= reg25;
          if (($unsigned((wire0 ?
                  $signed((wire3 >= reg19)) : ((~wire1) ?
                      $signed(wire7) : reg14))) ?
              ((((^~reg31) ? (~wire2) : wire8) ?
                  wire9[(4'h9):(4'h8)] : $unsigned($signed((8'had)))) ^ ((wire8 ^ $signed(reg18)) ?
                  $signed(reg14) : (8'ha9))) : (wire0[(4'h8):(3'h6)] << wire5)))
            begin
              reg33 <= (8'ha5);
              reg34 <= $signed(reg22[(4'h8):(3'h4)]);
              reg35 <= ((+$unsigned((reg34 ?
                      $unsigned(reg27) : $signed(reg18)))) ?
                  (~{$unsigned(wire3)}) : wire6);
            end
          else
            begin
              reg33 <= reg15[(5'h14):(1'h1)];
              reg34 <= reg24;
              reg35 <= reg14;
            end
        end
      else
        begin
          reg23 <= reg12[(1'h0):(1'h0)];
          reg24 <= $signed({$unsigned((reg21[(3'h6):(2'h2)] ^ (wire8 <= reg27)))});
        end
    end
  assign wire36 = (((8'had) | (~|$unsigned((reg25 > reg16)))) ?
                      (8'ha8) : (^$signed($unsigned(reg25[(2'h3):(1'h1)]))));
  assign wire37 = $signed((~&$unsigned(wire1[(4'ha):(1'h1)])));
  assign wire38 = reg26;
endmodule
