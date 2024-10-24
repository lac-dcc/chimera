module top
#(parameter param25 = ((((8'hbf) - ((~(8'hbe)) ? ((8'ha7) & (8'h9d)) : (^(8'ha0)))) ? ((((8'hb4) ? (8'hbd) : (7'h40)) && ((8'hbf) ? (8'hae) : (8'hb2))) + (~&((8'ha6) ? (8'h9d) : (8'h9f)))) : (8'ha0)) ? ((8'hab) ? ((((8'ha3) * (8'ha8)) ? (8'hb6) : {(7'h43)}) && {{(8'hae), (8'hb7)}, ((8'hbf) ? (8'hb1) : (8'hb4))}) : (((~(8'hae)) >> ((8'haa) || (7'h40))) ? (^(8'ha8)) : (((8'h9f) ? (8'h9e) : (8'hb9)) ? (~&(8'hbd)) : ((8'hae) == (8'hb2))))) : (({((8'h9d) ? (8'hab) : (8'ha6)), (~^(8'hb4))} ? ({(8'hbe)} <<< ((8'hba) ? (8'h9e) : (8'hb5))) : ({(8'hbd), (7'h42)} ? (~&(8'hb3)) : (|(7'h43)))) ? (~&(+(8'ha2))) : (((~|(8'hba)) <<< ((7'h44) <= (8'hb2))) | (((8'h9f) ? (8'h9c) : (8'ha1)) ? {(8'hab)} : {(8'had), (8'hbe)})))), 
parameter param26 = param25)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg9,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = $unsigned($signed($unsigned((7'h40))));
  assign wire6 = $signed({wire5});
  assign wire7 = $unsigned($unsigned((wire3[(4'h8):(2'h2)] ?
                     (wire3 ?
                         wire2[(4'h8):(3'h7)] : (wire1 ~^ wire2)) : $signed({wire2,
                         wire2}))));
  assign wire8 = wire7;
  always
    @(posedge clk) begin
      if (($unsigned((((wire0 ?
          wire7 : wire7) != $unsigned(wire6)) ^ ((&wire6) < (wire3 ^~ wire0)))) <= $signed(wire3[(4'h9):(1'h1)])))
        begin
          if ($signed($signed($signed($unsigned({wire5, wire1})))))
            begin
              reg9 <= $signed($unsigned($signed(wire7)));
            end
          else
            begin
              reg9 <= wire7[(4'h9):(4'h8)];
              reg10 <= wire7;
              reg11 <= (reg9 ?
                  $unsigned((8'h9d)) : (^$signed({(-wire6),
                      (wire3 >>> (8'ha1))})));
              reg12 <= reg10;
            end
          if ($unsigned(wire1))
            begin
              reg13 <= (|reg9);
              reg14 <= wire7[(1'h1):(1'h0)];
              reg15 <= ({(~&$unsigned((8'hbc))),
                      $unsigned($unsigned($signed(reg10)))} ?
                  $signed(wire6[(4'hd):(3'h4)]) : {wire5[(4'h9):(3'h4)]});
              reg16 <= ($unsigned((wire4 == ($signed(wire2) ?
                  wire3 : {(8'hb6)}))) - reg12[(4'h8):(4'h8)]);
              reg17 <= (~|($unsigned(reg10) ^ {$unsigned($unsigned((8'ha4)))}));
            end
          else
            begin
              reg13 <= {wire7[(4'h8):(2'h3)],
                  ($signed(wire7) > (reg16[(1'h1):(1'h1)] ?
                      ((wire7 << reg10) <<< (wire1 && wire1)) : ($unsigned(reg9) < reg11)))};
              reg14 <= reg15[(4'h9):(3'h4)];
              reg15 <= (reg12[(3'h5):(3'h5)] ? reg10 : wire3);
              reg16 <= {(|((-reg12) ?
                      (~wire5[(2'h2):(1'h1)]) : (((8'hb7) > wire7) ?
                          (^(8'ha8)) : $signed(reg9)))),
                  $unsigned($signed($signed({wire3, wire3})))};
              reg17 <= $unsigned((8'ha5));
            end
          reg18 <= (-($signed(reg16) ?
              (~($unsigned(reg14) ?
                  (~&wire4) : (wire2 - reg17))) : (reg17[(1'h1):(1'h0)] ?
                  ($unsigned(wire7) ?
                      (wire5 ?
                          reg11 : reg16) : $unsigned((8'hb2))) : reg13[(3'h4):(1'h0)])));
          reg19 <= reg11[(1'h0):(1'h0)];
          reg20 <= (^wire2);
        end
      else
        begin
          reg9 <= (8'hb1);
          reg10 <= (reg17[(2'h2):(2'h2)] != wire3[(3'h5):(3'h5)]);
          reg11 <= $unsigned(($unsigned((~|(~^(8'hb9)))) ~^ ({{wire6,
                  (8'hae)}} || (&reg11))));
          reg12 <= wire4;
        end
      reg21 <= (~^(wire8 ?
          ((wire1 ?
              $unsigned(reg12) : reg11[(1'h1):(1'h0)]) == {$unsigned(wire0),
              (wire4 ?
                  wire5 : (8'ha4))}) : (wire6[(4'ha):(4'h9)] >> ((&reg12) <<< (&(8'hac))))));
      if (wire4)
        begin
          if (wire0[(4'hd):(4'hc)])
            begin
              reg22 <= (^($signed(wire0[(1'h1):(1'h0)]) <= $signed(({wire3,
                  wire2} ^~ $unsigned(wire2)))));
              reg23 <= reg12[(3'h4):(2'h2)];
            end
          else
            begin
              reg22 <= (8'ha9);
              reg23 <= (wire2[(3'h7):(2'h2)] ?
                  ((wire5[(2'h3):(1'h0)] + $signed($unsigned(reg18))) + ($signed($unsigned(wire3)) ?
                      ((~reg12) & $unsigned(reg22)) : ($unsigned(wire0) ~^ $signed(wire0)))) : {wire5[(3'h7):(3'h5)]});
              reg24 <= $signed($unsigned((!$signed((wire8 ?
                  (8'h9e) : reg15)))));
            end
        end
      else
        begin
          if ({(&$unsigned(((wire0 ? reg21 : reg14) ?
                  $signed(reg24) : (reg10 == reg24)))),
              {(wire3[(5'h12):(2'h2)] < reg22[(3'h7):(2'h3)])}})
            begin
              reg22 <= $unsigned(($unsigned((~(wire0 ? wire0 : reg18))) ?
                  $signed($unsigned((reg22 <<< reg12))) : (wire4 && wire2[(1'h1):(1'h0)])));
              reg23 <= (reg10[(1'h0):(1'h0)] ^~ $unsigned($signed((((8'h9f) << wire2) ^~ reg16))));
            end
          else
            begin
              reg22 <= $unsigned((reg24 | $signed($signed(reg11))));
              reg23 <= (reg19 > $signed(($signed({reg19,
                  reg11}) ^~ ($unsigned(wire0) & wire2))));
              reg24 <= ($unsigned($unsigned((wire8 ^~ $unsigned((8'h9e))))) ?
                  (8'ha9) : $signed($unsigned(({wire0, (8'hae)} || {reg15,
                      reg11}))));
            end
        end
    end
endmodule
