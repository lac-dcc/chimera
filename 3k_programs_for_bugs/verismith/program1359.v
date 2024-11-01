module top
#(parameter param29 = {((|(((8'hb3) >= (7'h40)) ? ((8'hbc) ? (8'hbb) : (8'hbb)) : (-(8'hb5)))) ? ((((8'ha3) ? (8'hb1) : (7'h40)) - ((8'hbf) ? (7'h40) : (8'h9e))) ? (^~((8'had) <<< (8'hb6))) : {((8'hb9) ? (8'ha2) : (8'hbc))}) : (((&(8'hbf)) ? ((8'ha1) ? (8'h9d) : (8'hb2)) : (-(8'h9f))) | (((8'hab) ? (8'hbd) : (8'h9d)) && (8'hbe)))), ((~&(((8'hb6) ? (7'h44) : (8'ha0)) ? ((8'ha3) && (8'hbc)) : ((8'h9e) > (8'hb6)))) ? ((((8'had) ? (8'ha0) : (8'hb1)) <<< ((8'hbf) ? (8'haa) : (8'hbd))) ? {(^~(8'hae))} : ({(8'ha7), (8'ha7)} ^~ ((8'ha1) << (8'hb8)))) : ((8'hbe) ? (~|((7'h43) ? (8'ha1) : (8'hba))) : (((8'hb1) * (7'h44)) >= (~&(8'ha3)))))}, 
parameter param30 = param29)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
                 wire4,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = ($unsigned(wire0) != (|wire3[(1'h1):(1'h0)]));
  assign wire5 = $signed((wire4 ?
                     wire3[(4'h9):(1'h0)] : (((|wire3) + (wire4 ?
                         wire0 : wire3)) > wire2[(2'h2):(1'h1)])));
  assign wire6 = wire5;
  always
    @(posedge clk) begin
      if ((8'hb0))
        begin
          reg7 <= wire4[(4'hb):(2'h3)];
          if ((8'haa))
            begin
              reg8 <= {$unsigned(wire2[(1'h0):(1'h0)]), wire3[(2'h2):(2'h2)]};
            end
          else
            begin
              reg8 <= wire4;
              reg9 <= (((({wire4, wire1} ?
                          reg8[(2'h2):(1'h1)] : ((8'hb1) && wire3)) - $unsigned($signed(reg7))) ?
                      {wire0[(5'h12):(3'h5)],
                          (reg7[(1'h0):(1'h0)] >= $unsigned(wire3))} : wire3[(1'h0):(1'h0)]) ?
                  (8'haf) : ($signed((reg8[(2'h2):(1'h1)] ?
                          wire3[(4'h9):(2'h3)] : (reg8 == wire4))) ?
                      wire2 : $unsigned($signed({wire4, wire5}))));
              reg10 <= $signed({wire2[(3'h7):(3'h6)]});
            end
          reg11 <= wire0[(5'h14):(4'h9)];
          reg12 <= (8'hb0);
          if ($unsigned({($signed((reg12 < wire0)) - wire1),
              $unsigned($unsigned($unsigned((8'hac))))}))
            begin
              reg13 <= ((reg8 & $signed(wire2[(3'h7):(2'h2)])) ?
                  wire2[(3'h5):(3'h5)] : (~reg10));
              reg14 <= ((wire3[(4'h8):(2'h3)] ?
                      $signed(wire6[(3'h7):(3'h5)]) : ({$signed(reg8),
                          reg8[(4'ha):(4'ha)]} != $unsigned(wire3[(1'h0):(1'h0)]))) ?
                  (^($signed((wire3 > wire3)) ^~ wire2[(1'h0):(1'h0)])) : {((wire2 >= $signed(reg10)) <= (~|$unsigned(wire0))),
                      ((reg11[(4'he):(3'h5)] ?
                              $signed((8'hab)) : $unsigned(reg8)) ?
                          (reg8 ? (reg12 + wire1) : reg12) : (!(~|wire3)))});
              reg15 <= $signed((8'hb8));
            end
          else
            begin
              reg13 <= wire3[(3'h7):(1'h0)];
              reg14 <= wire5;
              reg15 <= (~|reg13);
              reg16 <= (wire0 ?
                  {(wire6 ^~ $unsigned((+(8'hae)))),
                      $unsigned((((8'hae) ? (8'hbf) : reg13) ?
                          (-reg13) : (wire3 & reg7)))} : $unsigned((reg8 != $unsigned((8'ha2)))));
            end
        end
      else
        begin
          reg7 <= ((~^$signed(reg15)) ?
              ((~&$unsigned(reg7[(1'h1):(1'h1)])) ?
                  wire6[(1'h1):(1'h1)] : (^~(~$signed(reg11)))) : $signed(($signed($unsigned((7'h43))) ?
                  $signed(((8'ha2) <<< reg16)) : {{wire5, reg7}})));
        end
      if (wire5[(2'h2):(1'h1)])
        begin
          reg17 <= $unsigned(wire0);
          reg18 <= {reg9[(2'h2):(1'h0)]};
        end
      else
        begin
          reg17 <= $unsigned((($signed((wire6 ?
              reg11 : wire0)) | $signed(((8'ha9) << (8'hb6)))) || (~|$unsigned($unsigned(reg12)))));
          reg18 <= (~(~^wire0[(4'hd):(4'hd)]));
          reg19 <= (($signed(((-reg8) ? reg18 : reg14)) ?
              reg12 : ({$signed((8'hac))} ~^ $unsigned((^~reg17)))) != $unsigned({{(-wire1),
                  (^wire2)}}));
          if ($signed($signed(reg8[(3'h7):(3'h6)])))
            begin
              reg20 <= ($signed(reg16[(1'h0):(1'h0)]) - reg18[(3'h4):(1'h1)]);
              reg21 <= reg20;
              reg22 <= (reg14[(1'h0):(1'h0)] ?
                  reg17[(1'h0):(1'h0)] : (($unsigned($unsigned(wire2)) >> {{reg21,
                              reg9},
                          wire5}) ?
                      {$unsigned((reg16 ?
                              wire2 : reg20))} : $signed(($signed(reg7) == (8'ha0)))));
              reg23 <= {reg17};
            end
          else
            begin
              reg20 <= reg23;
              reg21 <= reg10;
              reg22 <= $unsigned((^~reg14[(4'h9):(2'h3)]));
            end
        end
      if (wire3[(3'h6):(3'h4)])
        begin
          reg24 <= ({($unsigned($signed(reg23)) ?
                      reg22 : $signed(((8'hb7) - reg19)))} ?
              (($unsigned($unsigned(wire4)) ?
                      $signed((reg13 >> reg17)) : ($unsigned(reg23) ?
                          (reg23 ? reg15 : (8'hb0)) : (reg13 ?
                              wire6 : reg21))) ?
                  ($unsigned(((8'hb9) ?
                      reg13 : reg18)) > wire0[(4'ha):(2'h3)]) : wire3[(3'h6):(3'h6)]) : reg19[(4'hd):(4'h8)]);
          reg25 <= (+reg13);
          reg26 <= $unsigned($signed((8'haa)));
          reg27 <= (&reg15[(3'h4):(2'h2)]);
        end
      else
        begin
          reg24 <= $unsigned({(wire4[(1'h1):(1'h1)] | $signed((8'h9e)))});
        end
      reg28 <= (~{$unsigned({$unsigned(reg21)})});
    end
endmodule
