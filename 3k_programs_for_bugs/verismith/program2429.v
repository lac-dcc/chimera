module top
#(parameter param20 = (~&(((((7'h44) ? (8'ha0) : (7'h43)) ^ ((8'ha3) ^~ (7'h41))) || {{(8'hbb), (8'hb4)}}) * (7'h40))), 
parameter param21 = (param20 & param20))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire15;
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
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
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg5 <= (8'ha2);
          reg6 <= (((((^~reg5) ?
                  (~&wire0) : (reg5 ?
                      (8'ha9) : wire0)) >>> {wire1}) + (($signed(wire4) ?
                      {reg5} : (wire2 | (8'hb6))) ?
                  wire0[(2'h2):(1'h1)] : $signed(wire1[(4'hf):(4'h9)]))) ?
              ($unsigned(wire1) ?
                  ((|reg5[(1'h1):(1'h0)]) ~^ wire1[(4'h8):(2'h2)]) : $unsigned(reg5)) : wire4);
        end
      else
        begin
          reg5 <= ((wire4 | reg5[(5'h10):(1'h0)]) ^ $signed($signed((!(~^reg6)))));
          reg6 <= wire2;
          reg7 <= ((8'h9e) && (+reg6));
          reg8 <= (|{reg5[(1'h1):(1'h0)]});
        end
      if ((wire2 ?
          {((((8'hb3) + wire1) == (|wire4)) - $signed((reg6 ?
                  wire2 : reg7)))} : $unsigned(wire1)))
        begin
          reg9 <= $signed((8'hba));
        end
      else
        begin
          if (($unsigned(((reg7[(3'h6):(3'h5)] ?
                  ((7'h44) ? wire2 : reg5) : $signed((7'h44))) >>> ((^~wire1) ?
                  wire4 : {wire4, reg8}))) ?
              reg9[(3'h5):(3'h5)] : {$signed(reg6)}))
            begin
              reg9 <= ((8'hb0) ^~ wire1[(3'h4):(2'h2)]);
              reg10 <= wire3;
              reg11 <= $signed($signed(($signed($signed(reg7)) ?
                  wire3 : wire4)));
              reg12 <= (8'had);
            end
          else
            begin
              reg9 <= (($signed((~^$unsigned((8'ha1)))) >> (reg12 < wire2)) <= (reg8 ?
                  reg10 : ($signed((reg12 ? wire2 : wire1)) && reg8)));
              reg10 <= (+$signed((reg10[(4'hd):(3'h6)] | reg12[(4'hc):(3'h5)])));
              reg11 <= $unsigned(reg10);
              reg12 <= ($unsigned($signed(wire0)) ~^ {($unsigned((reg12 + reg8)) ^~ $signed((&(8'hac))))});
            end
          reg13 <= {(^~(reg7[(4'h8):(4'h8)] ?
                  {(reg8 ? wire3 : (8'ha7)),
                      (reg11 <<< wire1)} : $signed((8'hb9))))};
          reg14 <= ($unsigned($unsigned(wire2)) ?
              $unsigned($signed({reg11[(4'ha):(1'h1)]})) : {(((~^wire2) ^~ {reg10,
                      reg8}) >>> ({reg5, wire3} ? (&reg12) : (reg10 ~^ reg11))),
                  $unsigned(((|reg13) > (reg6 - reg13)))});
        end
    end
  assign wire15 = ((8'h9d) + {wire4[(1'h0):(1'h0)],
                      $signed($signed({reg8, wire0}))});
  assign wire16 = reg12[(4'ha):(3'h7)];
  assign wire17 = (|reg6);
  assign wire18 = ((wire1[(3'h7):(1'h1)] ?
                          (({(8'haf)} ? $signed((8'hba)) : $unsigned(wire0)) ?
                              ({wire4, (8'hb3)} ?
                                  (&reg5) : reg12) : wire15) : $signed($unsigned((!(8'ha9))))) ?
                      $signed($signed($unsigned({wire2,
                          reg13}))) : $unsigned(reg13));
  assign wire19 = wire2;
endmodule
