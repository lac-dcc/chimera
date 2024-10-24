module top
#(parameter param26 = (&(+(^~(~|(~(8'hac)))))), 
parameter param27 = {{((((8'hab) >= param26) ? (+param26) : ((8'ha9) >> param26)) ? (param26 == (param26 ^~ param26)) : (~&{param26})), (param26 ^ (param26 + {param26, param26}))}, param26})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire19,
                 wire6,
                 wire5,
                 reg20,
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
  assign wire5 = $signed(wire1);
  assign wire6 = {(($signed((wire1 >= wire3)) ?
                         ($unsigned((8'hb2)) == ((8'hb8) ~^ wire2)) : $unsigned((wire1 && wire5))) == wire5[(2'h3):(2'h2)])};
  always
    @(posedge clk) begin
      if ((wire0[(3'h7):(1'h1)] != (!wire6[(2'h2):(2'h2)])))
        begin
          reg7 <= (wire4 <= $signed(wire5[(2'h3):(2'h3)]));
          reg8 <= $signed(reg7);
          reg9 <= $signed(wire6);
          reg10 <= reg8[(1'h1):(1'h0)];
          reg11 <= reg9[(3'h4):(2'h3)];
        end
      else
        begin
          reg7 <= (wire0[(1'h0):(1'h0)] >> (&$unsigned(($unsigned(wire1) ^ (~wire1)))));
        end
      reg12 <= reg7;
      reg13 <= (^reg12);
      reg14 <= $signed($unsigned({$signed((wire1 ? (8'h9f) : wire3))}));
      if ((reg11[(5'h15):(3'h6)] >>> $unsigned({((^~wire2) ?
              {reg8, wire6} : reg14)})))
        begin
          if (wire2[(4'ha):(2'h3)])
            begin
              reg15 <= ((-{$unsigned($unsigned((8'ha3))),
                      (wire5 ? reg11[(5'h12):(4'he)] : wire1[(2'h3):(1'h0)])}) ?
                  ($unsigned($unsigned($unsigned(wire5))) ?
                      ($unsigned((reg7 ? wire3 : reg8)) ?
                          $signed({wire2}) : wire2) : wire4) : (wire6 ?
                      (((|reg14) ? wire2[(1'h0):(1'h0)] : wire0) ?
                          $unsigned(((8'h9c) ? reg11 : (8'ha4))) : ({reg8,
                                  wire6} ?
                              $unsigned(wire1) : wire3[(3'h6):(1'h1)])) : (($signed(reg7) < (wire2 ?
                              wire2 : (8'hab))) ?
                          $unsigned($unsigned(wire0)) : $unsigned(wire0[(4'h8):(4'h8)]))));
            end
          else
            begin
              reg15 <= $unsigned($signed(wire2));
            end
          reg16 <= wire0[(4'hb):(4'h8)];
          reg17 <= $unsigned((7'h44));
          reg18 <= (8'hb0);
        end
      else
        begin
          reg15 <= {(reg13 ?
                  reg14[(1'h0):(1'h0)] : (reg9 != (&$signed((8'hbd)))))};
          reg16 <= ($signed(reg10[(1'h0):(1'h0)]) ?
              (~^reg8[(2'h2):(1'h0)]) : reg12[(5'h13):(3'h6)]);
          reg17 <= reg11[(4'ha):(4'h8)];
        end
    end
  assign wire19 = reg15;
  always
    @(posedge clk) begin
      reg20 <= (wire2 ? wire3 : {(~|wire5[(2'h2):(1'h1)])});
    end
  assign wire21 = {((!$signed($unsigned(reg8))) * reg13[(4'ha):(3'h7)])};
  assign wire22 = {reg18[(1'h0):(1'h0)], reg11[(5'h11):(2'h2)]};
  assign wire23 = {reg16[(4'hf):(3'h4)], reg9[(4'hf):(4'h8)]};
  assign wire24 = reg7;
  assign wire25 = wire6[(1'h1):(1'h0)];
endmodule
