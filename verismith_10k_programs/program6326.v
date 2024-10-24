module top
#(parameter param18 = {(8'hb6)}, 
parameter param19 = param18)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg4 = (1'h0);
  assign y = {wire17,
                 wire16,
                 reg15,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1[(3'h6):(1'h1)];
      reg5 <= $signed(wire2);
    end
  always
    @(posedge clk) begin
      reg6 <= (-({(~|reg5),
          ((~&reg4) ? $signed(reg5) : (8'ha7))} + reg5[(4'hc):(4'h9)]));
      if ($signed(({($unsigned(wire2) > (~^wire1))} ?
          {{wire2[(1'h0):(1'h0)]}} : {wire0[(4'hc):(4'ha)]})))
        begin
          if ({{reg4[(3'h4):(2'h2)],
                  (wire2[(2'h2):(1'h1)] >= (!$unsigned(wire3)))}})
            begin
              reg7 <= ($unsigned($signed($unsigned({wire3, reg6}))) ?
                  reg4[(2'h2):(1'h0)] : $unsigned($unsigned($unsigned({wire1}))));
            end
          else
            begin
              reg7 <= $signed((^~(~^$unsigned({(8'haf), (8'hb7)}))));
              reg8 <= (wire3 ?
                  (+$unsigned((^~$signed((8'hb4))))) : $unsigned((&$signed((wire2 ?
                      reg5 : wire0)))));
              reg9 <= $unsigned($unsigned($signed((reg4[(3'h7):(3'h5)] ?
                  (reg5 == wire3) : (wire0 | reg6)))));
            end
          reg10 <= wire3;
          if (reg7[(5'h13):(4'he)])
            begin
              reg11 <= (~|({((wire2 ? reg7 : (8'hb4)) <<< reg7[(2'h2):(1'h1)]),
                  ($signed(reg10) | (!reg6))} ^ reg5));
            end
          else
            begin
              reg11 <= (^(reg9 ? wire3 : $unsigned($signed(wire1))));
            end
          reg12 <= wire3[(4'h9):(3'h5)];
        end
      else
        begin
          reg7 <= $unsigned((reg12[(2'h2):(1'h1)] ?
              (!(&(reg6 ? wire0 : (7'h42)))) : {((reg8 ?
                      reg9 : (8'hb0)) < (reg4 || reg7)),
                  $unsigned((reg9 > reg12))}));
        end
      reg13 <= $unsigned((+(($signed(reg8) != (reg7 ? (8'ha9) : reg12)) ?
          (~^(reg4 >>> reg10)) : reg5)));
      reg14 <= $unsigned((~|$signed(((reg8 ? reg5 : wire0) <<< (reg11 ?
          wire1 : reg13)))));
      reg15 <= {(&reg6),
          $unsigned(((8'hbd) ?
              ($unsigned(reg7) < $signed(reg11)) : $unsigned((reg12 - reg4))))};
    end
  assign wire16 = (8'hb2);
  assign wire17 = $signed(wire16);
endmodule
