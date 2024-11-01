module top
#(parameter param26 = (^{((|((8'hb0) >> (8'hb3))) ? ({(8'ha8), (8'hb1)} ^ ((8'ha6) ? (8'hb2) : (8'had))) : (((8'ha2) ? (8'ha6) : (8'hbc)) ? ((8'hbf) ? (8'hbc) : (8'ha7)) : ((8'h9f) ? (8'hbf) : (8'hb6))))}), 
parameter param27 = (-(^~(!((param26 & param26) ? param26 : (param26 ? param26 : param26))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = $signed({$unsigned($signed((wire4 ? wire2 : wire4))),
                     $unsigned($signed((wire3 ? wire0 : wire4)))});
  assign wire6 = (7'h44);
  assign wire7 = (((~|(&wire5[(4'he):(4'h9)])) + wire6[(1'h1):(1'h0)]) - wire0);
  assign wire8 = wire2[(2'h3):(2'h2)];
  assign wire9 = (wire2[(1'h1):(1'h1)] ?
                     ({$unsigned(wire5), wire0[(3'h6):(1'h0)]} ?
                         wire3[(3'h4):(2'h2)] : $signed((~&(!wire4)))) : $unsigned($signed($signed(wire1[(4'hc):(4'hb)]))));
  assign wire10 = (~^(8'hbd));
  assign wire11 = ($signed(((((8'hbe) || wire8) ~^ $signed(wire6)) >>> {$signed(wire8),
                      wire0[(2'h2):(1'h0)]})) + {($signed({wire4, wire6}) ?
                          wire3[(1'h0):(1'h0)] : (8'had)),
                      $signed(({wire8, wire8} ?
                          (wire5 ? wire1 : wire1) : (wire5 ? wire7 : wire0)))});
  assign wire12 = {wire6[(1'h0):(1'h0)], wire6[(3'h4):(3'h4)]};
  always
    @(posedge clk) begin
      reg13 <= ($signed(wire5[(3'h6):(3'h5)]) ?
          ((((wire12 & wire10) ? (|wire5) : ((8'hb4) ? wire8 : wire4)) ?
                  {wire0[(3'h6):(1'h1)]} : $signed((+(8'had)))) ?
              $unsigned((~|$signed(wire0))) : ((&(8'hae)) >= (+$signed((8'hb8))))) : ((~|(&wire0)) == (wire7 ?
              ($signed(wire3) ?
                  $unsigned(wire9) : wire6[(3'h4):(2'h2)]) : {(wire11 ?
                      wire12 : wire0),
                  $signed(wire3)})));
      if ({$unsigned(wire8)})
        begin
          reg14 <= (wire7[(1'h0):(1'h0)] ?
              $unsigned(wire4[(4'ha):(3'h7)]) : wire3[(1'h0):(1'h0)]);
          reg15 <= (-wire11[(2'h3):(1'h1)]);
          reg16 <= $signed(wire11[(1'h1):(1'h0)]);
          if (wire10[(4'hb):(1'h1)])
            begin
              reg17 <= (^~$signed($unsigned(((reg16 >>> wire7) >>> wire3))));
              reg18 <= (^~(~&($unsigned($unsigned((8'hbe))) ?
                  ($unsigned((8'h9c)) & wire6[(2'h3):(1'h1)]) : ((wire9 && wire1) * $unsigned(wire4)))));
            end
          else
            begin
              reg17 <= (reg15 & ($signed($signed(reg14[(1'h1):(1'h0)])) + (wire5[(4'hf):(2'h2)] ?
                  wire12 : ((^reg17) < wire12))));
              reg18 <= (($signed((wire1[(3'h7):(2'h3)] >>> $signed(wire6))) | $signed((&(-reg18)))) >>> ($unsigned($unsigned(wire7[(1'h0):(1'h0)])) | {((wire2 || wire0) ?
                      $unsigned(reg17) : $signed((8'ha1)))}));
              reg19 <= (-wire4[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          reg14 <= wire5[(4'hf):(1'h0)];
          if ($unsigned((({wire8[(2'h2):(1'h1)],
              $unsigned(wire11)} | $signed((~wire6))) >> (8'hbe))))
            begin
              reg15 <= (((8'h9f) || $unsigned(wire1)) ?
                  $signed((8'ha7)) : wire11);
            end
          else
            begin
              reg15 <= ((reg15[(1'h1):(1'h1)] ?
                      (reg18 ?
                          (|wire6[(3'h4):(1'h1)]) : $unsigned((8'haa))) : ($signed(((8'hbd) ?
                          wire4 : (7'h44))) == (8'ha8))) ?
                  ($signed(wire3[(2'h2):(2'h2)]) <= (^(~(8'hb7)))) : $signed($signed((((7'h43) <<< reg15) + (wire7 ?
                      wire7 : wire3)))));
              reg16 <= (|wire2);
              reg17 <= {(wire2 ?
                      (((wire2 ?
                          reg19 : wire11) != $unsigned(reg17)) >= $signed((-wire1))) : ($signed((|wire1)) ?
                          {$unsigned(reg18),
                              $unsigned(wire9)} : $unsigned((reg17 ~^ wire8)))),
                  wire9[(4'h9):(3'h6)]};
              reg18 <= (($unsigned((((8'ha9) <<< wire5) && (reg16 ?
                      wire9 : (8'ha4)))) ?
                  ({(wire4 || reg18)} ?
                      ({reg14} ?
                          reg17[(1'h0):(1'h0)] : $unsigned((8'hbc))) : (|wire8)) : $signed((reg19 ?
                      wire8 : (&(8'hba))))) > $signed(wire6));
              reg19 <= $signed((!(-wire7[(1'h1):(1'h1)])));
            end
        end
      reg20 <= ((~&($signed(reg16[(1'h0):(1'h0)]) > {(reg16 < wire7)})) ?
          reg14[(4'h8):(2'h3)] : $signed(((~|wire11) ?
              (~&reg13[(4'h8):(2'h2)]) : $signed((wire7 <<< reg15)))));
    end
  assign wire21 = wire12[(2'h3):(2'h2)];
  assign wire22 = $signed(reg20[(4'h8):(1'h0)]);
  assign wire23 = $signed($unsigned(reg14));
  assign wire24 = ($unsigned(reg16[(4'hc):(3'h7)]) ?
                      reg20 : wire11[(2'h2):(2'h2)]);
  assign wire25 = $signed((wire23 ?
                      wire22 : {reg14[(3'h6):(3'h6)], reg16[(3'h5):(2'h2)]}));
endmodule
