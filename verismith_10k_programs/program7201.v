module top
#(parameter param29 = {(((((8'hb9) ? (8'hb6) : (8'ha0)) <<< {(8'hb8), (8'h9d)}) == (~^((8'hb3) <= (7'h44)))) > (-(((7'h44) > (8'h9c)) ? ((8'hb6) ~^ (8'hb5)) : ((8'hbc) - (8'ha3))))), (((((8'ha1) > (8'ha6)) ? (8'ha4) : ((7'h43) << (8'hbe))) <= ((~(8'ha6)) < (8'hb7))) ? (~^(8'hb6)) : ((((8'hb0) >= (8'ha2)) ? ((7'h43) == (7'h43)) : ((8'h9e) ? (8'h9d) : (8'hbf))) ? {(-(8'hb7))} : {((7'h41) + (8'hac)), (^~(8'h9f))}))}, 
parameter param30 = (((((param29 ? param29 : param29) ? (8'had) : {param29}) ? param29 : param29) + {param29}) >= (~|param29)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg28,
                 reg27,
                 reg26,
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
                 (1'h0)};
  assign wire4 = $unsigned((^~(|(&wire2[(2'h2):(1'h1)]))));
  assign wire5 = (!(~$unsigned(((wire0 ? wire2 : wire0) ?
                     wire0[(1'h0):(1'h0)] : (wire3 || wire2)))));
  assign wire6 = wire2;
  assign wire7 = {(8'hb0), wire4[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg8 <= wire5[(1'h1):(1'h0)];
      if ((wire3 ? wire2 : $signed($unsigned(wire5[(1'h1):(1'h0)]))))
        begin
          reg9 <= {(!(wire5[(3'h7):(2'h3)] ?
                  (|wire3[(4'h9):(3'h5)]) : ({(8'ha8), (8'h9e)} * ((8'hbc) ?
                      (8'hb2) : wire6))))};
          if (wire6[(3'h4):(1'h0)])
            begin
              reg10 <= (8'hbe);
              reg11 <= ((-(reg9 ^~ ($unsigned(reg10) ?
                  wire2[(4'hf):(4'hf)] : $signed(wire7)))) > {({reg9,
                      wire1[(1'h0):(1'h0)]} < ((wire2 ? wire6 : wire3) ?
                      $unsigned(reg8) : (^~(8'haa)))),
                  (&wire1)});
              reg12 <= wire6[(3'h5):(3'h5)];
              reg13 <= {$unsigned($unsigned(({wire3} & (reg9 * (8'h9e)))))};
              reg14 <= $unsigned({wire2[(2'h2):(2'h2)]});
            end
          else
            begin
              reg10 <= {wire7};
              reg11 <= ((~&{($signed(reg9) ^~ wire5)}) ?
                  wire7[(2'h2):(1'h0)] : (|$unsigned((+$signed(reg8)))));
              reg12 <= {($signed({wire1[(2'h2):(2'h2)]}) & ((~^wire0[(1'h1):(1'h1)]) ?
                      reg10 : (|$signed((8'hab))))),
                  (reg9 ? ((+wire7) ^ (+$signed((8'haa)))) : reg13)};
            end
          reg15 <= (8'hb1);
          reg16 <= {(($signed((wire2 != (8'ha8))) <<< (+((8'hba) ~^ wire3))) ?
                  wire2[(4'h9):(2'h3)] : ((~&(wire6 > wire0)) ~^ (wire5 ?
                      (wire1 ? wire1 : reg15) : (~^reg15)))),
              (8'hbe)};
        end
      else
        begin
          if (wire7[(2'h2):(2'h2)])
            begin
              reg9 <= {($signed(((wire3 ^ wire2) ?
                          $signed(reg13) : $unsigned(wire5))) ?
                      reg14[(2'h3):(1'h0)] : {((reg9 ?
                              (8'hbc) : reg14) != wire5[(1'h0):(1'h0)])})};
              reg10 <= $unsigned(((!(-(reg12 ?
                  reg11 : wire5))) <= $unsigned($unsigned(reg9))));
              reg11 <= (((wire0 ?
                      (|(~|reg14)) : wire2[(5'h10):(4'he)]) == (reg10 >>> (|(wire4 * reg10)))) ?
                  reg8 : (&({(wire0 ? wire6 : (8'hbe)), (wire5 == reg14)} ?
                      $signed(wire7) : {((7'h41) && (7'h42))})));
              reg12 <= $unsigned((~|$signed($unsigned(wire6))));
            end
          else
            begin
              reg9 <= $signed((($signed(wire2) > $signed((reg15 + wire6))) ?
                  wire1 : wire1[(2'h2):(1'h0)]));
              reg10 <= reg8[(4'ha):(3'h4)];
              reg11 <= (wire6 ?
                  ((((^~reg12) ? (reg14 ~^ (8'hb5)) : (reg11 ? wire7 : wire2)) ?
                          ($signed(reg13) || $unsigned(wire4)) : wire5[(2'h2):(2'h2)]) ?
                      ((reg15[(4'h8):(2'h2)] + $unsigned(reg13)) + (^~$unsigned(wire1))) : (~&(reg13 ^~ reg15[(4'h8):(3'h7)]))) : (wire6[(1'h0):(1'h0)] ?
                      ($unsigned(reg14) ?
                          $unsigned(reg8[(3'h4):(2'h2)]) : $unsigned({wire6,
                              reg14})) : ((~^$unsigned(reg12)) > (wire7[(2'h2):(1'h0)] ?
                          reg9 : $unsigned((7'h41))))));
              reg12 <= wire2[(1'h1):(1'h1)];
            end
          reg13 <= (!(wire4[(1'h0):(1'h0)] ?
              (-((reg11 ^ reg9) ?
                  wire5[(2'h3):(2'h3)] : wire0)) : {$signed(reg9[(2'h2):(1'h0)])}));
        end
      reg17 <= {$unsigned((~$unsigned(reg13)))};
    end
  assign wire18 = $unsigned((reg15 != $signed(($signed(reg12) | wire0))));
  assign wire19 = (reg16 && ((~(~|(+reg8))) > (({reg8,
                      reg12} < reg9[(1'h0):(1'h0)]) ^ (wire0[(1'h1):(1'h0)] | $unsigned(wire0)))));
  assign wire20 = $signed((~^reg12));
  assign wire21 = (!(!(-($signed(wire18) ? wire7 : (!reg15)))));
  assign wire22 = ($signed($unsigned({(^~reg16)})) ?
                      (wire1[(2'h2):(1'h1)] ?
                          (($signed(reg8) ^ (reg17 - wire20)) * wire1) : wire19[(2'h3):(1'h0)]) : $signed((^{(wire3 != reg14)})));
  assign wire23 = wire0;
  assign wire24 = (8'hb6);
  assign wire25 = reg10[(4'h9):(4'h9)];
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire4[(1'h1):(1'h0)])))
        begin
          if ($signed((reg17[(1'h0):(1'h0)] ?
              {wire20, reg13[(4'hd):(2'h2)]} : reg12[(1'h1):(1'h1)])))
            begin
              reg26 <= (~&((wire0 ?
                  $unsigned(wire25[(5'h10):(3'h5)]) : wire3[(3'h6):(3'h4)]) + reg16));
            end
          else
            begin
              reg26 <= reg13;
              reg27 <= wire25;
            end
        end
      else
        begin
          reg26 <= (~^$signed(wire19));
        end
      reg28 <= wire18;
    end
endmodule
