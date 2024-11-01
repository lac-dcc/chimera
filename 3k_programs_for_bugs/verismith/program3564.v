module top
#(parameter param28 = ((((((8'haa) ? (8'haa) : (8'ha6)) <= (-(8'hb3))) == ((8'hb8) ? ((8'ha7) ^ (8'had)) : (&(8'had)))) ? ((((8'hb9) ? (8'hbb) : (8'h9d)) ? ((8'ha7) ? (7'h42) : (7'h42)) : ((8'haf) ? (8'hb7) : (8'ha6))) + (((7'h42) > (8'hb5)) ? {(8'hbc)} : ((8'hb5) >> (8'hb9)))) : ({((8'ha6) && (8'hae)), ((8'hb4) ? (8'hb3) : (8'hb6))} | (((7'h40) ? (8'ha3) : (8'ha0)) ? ((8'had) * (8'ha9)) : (~&(8'hae))))) << (-{(((7'h42) ? (8'hbc) : (8'ha9)) ? ((8'hab) ? (8'ha6) : (8'hbd)) : {(8'ha7)}), {(~^(8'h9c)), ((8'haa) ? (7'h44) : (8'hb9))}})), 
parameter param29 = {(~|{((^~param28) ? param28 : param28), param28})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = ((wire1 >> $unsigned((wire4 ^ (wire1 ?
                     wire3 : (8'ha4))))) - (wire1 ?
                     {($unsigned(wire1) - (wire3 * wire1))} : {wire1[(4'ha):(2'h3)]}));
  assign wire6 = ($signed(((8'ha6) + ((wire2 < wire1) ^ (wire2 * wire3)))) & {(7'h40)});
  assign wire7 = $signed(wire6[(4'hc):(4'ha)]);
  always
    @(posedge clk) begin
      reg8 <= (wire5[(2'h2):(1'h0)] ? wire3 : (|wire1[(2'h3):(2'h2)]));
      reg9 <= (^~(wire1 ?
          (^wire1[(4'he):(4'hd)]) : ({(reg8 ? wire4 : wire5)} + (~&{wire7}))));
      reg10 <= (~wire4);
      if ($unsigned($unsigned((~&$signed($unsigned(wire1))))))
        begin
          reg11 <= wire4;
          if (((($signed($signed(wire1)) >= $signed($unsigned(wire3))) ?
                  (|{(7'h43)}) : wire0[(1'h0):(1'h0)]) ?
              reg9 : (~&$unsigned((wire5 != (reg11 - wire5))))))
            begin
              reg12 <= wire6[(5'h11):(4'ha)];
              reg13 <= $signed((((^$unsigned(wire5)) ?
                      $unsigned($unsigned((7'h43))) : ($signed(wire6) * reg12)) ?
                  $signed((~|reg8[(3'h6):(3'h4)])) : {$unsigned({wire2,
                          (8'hbb)})}));
              reg14 <= $unsigned(reg8[(1'h1):(1'h0)]);
            end
          else
            begin
              reg12 <= ({wire6, reg13[(1'h1):(1'h0)]} ?
                  reg12[(4'ha):(4'ha)] : (8'hac));
              reg13 <= reg14;
              reg14 <= reg12[(4'h9):(3'h6)];
              reg15 <= $signed($unsigned($signed((^(wire2 + wire0)))));
              reg16 <= reg13;
            end
          reg17 <= $signed(reg9);
          reg18 <= $unsigned($unsigned($unsigned(reg15)));
        end
      else
        begin
          reg11 <= $unsigned($signed((wire4 ?
              (+$unsigned(wire7)) : (^~(-reg11)))));
          reg12 <= $signed(reg12);
          reg13 <= wire3;
        end
    end
  assign wire19 = $signed({(wire0 ? $unsigned(wire4) : reg16)});
  assign wire20 = ((~&(8'h9d)) == $signed(reg9[(3'h4):(2'h2)]));
  assign wire21 = {($unsigned($signed($unsigned(wire7))) ?
                          ($unsigned((^(8'hb1))) <<< (8'hbf)) : wire5)};
  assign wire22 = $signed(wire1[(1'h0):(1'h0)]);
  assign wire23 = (($signed($signed(reg10[(2'h2):(1'h1)])) ?
                          wire7[(2'h3):(2'h2)] : (-(wire20[(1'h1):(1'h1)] ?
                              (|reg16) : $signed(reg17)))) ?
                      (wire1[(4'hb):(2'h2)] ?
                          reg9[(2'h3):(2'h2)] : (8'h9e)) : $signed(wire2[(3'h6):(3'h6)]));
  assign wire24 = (7'h43);
  assign wire25 = $signed(reg12[(2'h3):(2'h2)]);
  assign wire26 = wire5[(3'h5):(3'h4)];
  assign wire27 = ({reg12} <<< wire1[(4'hf):(3'h6)]);
endmodule
