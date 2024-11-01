module top
#(parameter param15 = {({{{(8'hbc), (8'h9f)}, ((8'hab) ? (8'ha3) : (8'hbf))}} + (^~((~|(8'hb1)) - ((8'h9d) < (8'h9e))))), (8'h9f)}, 
parameter param16 = (((|((param15 - param15) >= param15)) ? (param15 ^ (!(param15 ^ param15))) : param15) * (&(^~param15))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire8,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      reg6 <= ((~&(|({wire5} ? $unsigned(wire0) : (+wire4)))) ? wire4 : wire5);
      reg7 <= $signed(wire2);
    end
  assign wire8 = ((($signed(wire4) ^ ((wire2 ? wire1 : reg7) ?
                         (reg6 ? wire4 : wire4) : $unsigned(reg6))) ?
                     (&((-reg7) > $unsigned(reg7))) : (wire1 ?
                         $unsigned(wire5[(3'h7):(2'h3)]) : $unsigned((!wire0)))) || (-$signed(reg6[(3'h7):(3'h7)])));
  always
    @(posedge clk) begin
      reg9 <= $signed(((((reg7 ? reg6 : wire1) ?
              wire0 : $signed(wire1)) << $unsigned($signed(wire1))) ?
          wire8[(4'h8):(1'h1)] : (wire2[(2'h3):(1'h0)] ?
              (!(|(8'hb0))) : (reg7 - {wire2, wire1}))));
      if ({$signed(($unsigned((~reg9)) ?
              wire4[(5'h12):(4'hc)] : (reg7 ?
                  reg9[(4'hd):(3'h7)] : $signed(wire8))))})
        begin
          reg10 <= wire5;
        end
      else
        begin
          reg10 <= {$unsigned({$signed({wire4})}), wire2[(4'ha):(3'h7)]};
          reg11 <= {reg9[(4'h9):(3'h5)], wire3[(4'h8):(1'h0)]};
        end
      reg12 <= (|{($unsigned((reg6 ? (8'ha4) : reg7)) ?
              $unsigned($signed(wire4)) : reg10[(3'h4):(1'h1)]),
          ((^{(8'hb5), (8'ha4)}) ?
              ((reg6 && reg10) ?
                  $unsigned(wire2) : ((7'h43) ?
                      wire5 : reg7)) : reg6[(2'h3):(1'h1)])});
      reg13 <= reg12;
      reg14 <= (~$signed(reg12));
    end
endmodule
