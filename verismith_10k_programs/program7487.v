module top
#(parameter param17 = ((~(+((|(8'ha8)) ? (7'h43) : (8'ha3)))) ? {((8'hbf) - (~((8'h9c) >>> (8'hb4))))} : {((((8'hbf) ? (8'hb0) : (8'hb2)) ? ((8'ha0) ? (8'haf) : (8'ha3)) : ((8'h9d) <= (8'haa))) ^~ (((8'hb1) ? (8'hb1) : (8'h9d)) ? ((8'hac) ? (8'hb4) : (8'hbd)) : (8'ha9))), (8'ha1)}), 
parameter param18 = (param17 - param17))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
                 wire4,
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
  assign wire4 = $unsigned($unsigned(wire1));
  assign wire5 = $unsigned($signed((~wire2)));
  assign wire6 = ($unsigned(wire3[(1'h0):(1'h0)]) || wire2[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg7 <= wire1;
      reg8 <= (({(&wire3), wire0} ?
              (&(~^reg7)) : {$unsigned($unsigned(reg7))}) ?
          reg7[(2'h3):(2'h2)] : {wire5[(2'h2):(2'h2)]});
      reg9 <= (wire3[(2'h3):(1'h1)] ?
          ((|reg7) ~^ ((|{wire6}) || wire6[(4'hd):(4'h8)])) : $signed($unsigned(wire6[(1'h0):(1'h0)])));
      if (wire0[(2'h2):(1'h1)])
        begin
          if (wire4)
            begin
              reg10 <= {wire4,
                  (((8'ha1) ^ reg9) ?
                      wire6[(4'hd):(1'h1)] : $signed($signed((reg9 ~^ wire1))))};
              reg11 <= ($unsigned((!wire2)) ?
                  (-($signed((reg8 ? wire4 : wire1)) ?
                      $unsigned(wire6) : $signed($unsigned(wire4)))) : ($signed(wire3[(1'h1):(1'h1)]) ?
                      (&reg9[(2'h2):(1'h0)]) : $unsigned($signed(wire6))));
              reg12 <= $unsigned(wire4);
              reg13 <= (reg12 ?
                  {(((8'hb2) ?
                          (wire5 ?
                              wire1 : wire6) : (wire5 ^~ reg9)) ^ ($unsigned(reg8) ?
                          (!wire2) : (reg11 ?
                              (8'ha9) : wire2)))} : (wire3[(2'h2):(2'h2)] >> wire1));
            end
          else
            begin
              reg10 <= $signed(reg13);
              reg11 <= $signed($unsigned({(^reg11[(2'h2):(1'h1)])}));
              reg12 <= ((+$signed($signed((wire1 + reg7)))) ?
                  (&wire6[(4'hb):(2'h2)]) : $unsigned((-($unsigned(reg7) ?
                      (-reg7) : (^~wire1)))));
              reg13 <= $signed(((-(reg9[(4'h9):(2'h2)] >= $signed(reg10))) >> $unsigned(wire5[(1'h1):(1'h0)])));
              reg14 <= $unsigned(wire6);
            end
          reg15 <= ((reg12 > (&(^~$signed(reg12)))) ?
              (!wire5[(1'h0):(1'h0)]) : $unsigned((-((wire2 ?
                  reg11 : wire1) >= reg11[(3'h5):(1'h1)]))));
          reg16 <= wire4;
        end
      else
        begin
          reg10 <= $signed((&$unsigned({{reg16}})));
        end
    end
endmodule
