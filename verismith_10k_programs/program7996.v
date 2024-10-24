module top
#(parameter param18 = (((~&(^(~^(8'hac)))) ? (+(~&(^~(8'hba)))) : ((~((8'hb9) ? (8'ha7) : (8'hbe))) == (!((8'haf) <= (8'hbf))))) ? (~|{(((7'h42) ? (8'h9e) : (8'ha4)) ? ((7'h44) ? (8'ha3) : (8'ha2)) : ((8'hbc) >> (8'hb9))), ((+(8'ha9)) <= ((8'hbe) << (8'hb8)))}) : ((8'ha9) - ((((8'h9f) ? (8'hbe) : (8'hba)) ? (8'had) : (8'hb9)) ^~ (((8'hb7) ? (8'hb8) : (8'hbb)) >>> ((8'hb6) | (8'ha1)))))), 
parameter param19 = param18)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed(((($unsigned(wire0) ?
                             wire2[(4'ha):(4'ha)] : (!wire1)) ?
                         (~^{wire0}) : ((wire2 & wire3) << $unsigned((8'h9e)))) ?
                     (|wire1[(3'h4):(1'h1)]) : (&wire1[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if ((^wire4[(1'h1):(1'h1)]))
        begin
          reg5 <= {wire2[(4'hd):(3'h7)], wire3[(1'h1):(1'h1)]};
          reg6 <= $unsigned((reg5 ?
              (~&wire1[(1'h1):(1'h0)]) : (~&({wire1} + $unsigned(reg5)))));
          if ($unsigned(wire4[(3'h7):(2'h3)]))
            begin
              reg7 <= ($signed((wire4[(4'h8):(3'h4)] >> (7'h40))) ?
                  wire0 : $signed($signed({(8'hbb), {wire4, wire3}})));
              reg8 <= (^~wire2);
              reg9 <= reg5;
              reg10 <= $unsigned(reg7[(3'h7):(3'h7)]);
            end
          else
            begin
              reg7 <= (7'h41);
            end
          reg11 <= (8'ha4);
        end
      else
        begin
          reg5 <= {(|reg9[(4'h9):(3'h7)])};
          reg6 <= reg10;
          reg7 <= wire1;
        end
      reg12 <= reg7[(1'h1):(1'h0)];
      if ((((~|reg10[(1'h0):(1'h0)]) == $signed(reg9[(4'hf):(3'h5)])) >= reg10[(2'h3):(1'h1)]))
        begin
          reg13 <= reg7[(4'ha):(3'h5)];
        end
      else
        begin
          reg13 <= ((8'hae) >>> (($unsigned($signed(wire2)) ?
                  ((8'ha4) ^ reg5) : ((wire1 ^~ reg8) ?
                      wire2[(4'hc):(1'h1)] : $signed(wire3))) ?
              $unsigned($signed($unsigned(reg11))) : reg13));
          reg14 <= ($signed((((reg8 ? wire2 : (8'h9c)) ?
                  ((8'hb5) ? reg11 : wire2) : (~|wire2)) ?
              reg12[(2'h3):(1'h0)] : reg6[(3'h4):(3'h4)])) <= $unsigned(wire1[(3'h5):(1'h1)]));
        end
    end
  assign wire15 = (((|{$signed(wire3),
                      (reg5 ?
                          reg12 : reg6)}) ^ $signed(reg11)) <= {((reg8 ^ $signed((8'hae))) == $signed((wire3 ?
                          reg11 : wire4)))});
  assign wire16 = (|({(~|(wire0 >= reg8))} - (reg5 > ($signed(wire15) ?
                      $signed(wire2) : $unsigned((8'ha3))))));
  assign wire17 = $unsigned((^~wire0));
endmodule
