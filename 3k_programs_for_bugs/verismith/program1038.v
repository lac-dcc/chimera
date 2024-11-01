module top
#(parameter param28 = ((~|((((8'haf) >= (8'hb5)) ~^ ((8'hb9) <= (7'h41))) * (((8'hb2) ? (8'hbc) : (8'hbd)) ? ((8'h9f) ? (8'hac) : (8'hb7)) : ((8'ha9) <= (8'hb7))))) ? (~^((((8'hac) ? (8'ha0) : (8'ha0)) == ((8'hb0) ? (8'hb9) : (8'h9d))) + (8'h9c))) : {((((8'haa) >> (8'ha1)) ? {(8'hb6)} : ((8'hb4) == (7'h41))) > (8'hba)), (~^(&((8'hb4) ? (8'hbe) : (8'hb8))))}), 
parameter param29 = param28)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire18,
                 wire17,
                 wire5,
                 wire4,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
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
                 reg6,
                 (1'h0)};
  assign wire4 = $signed(($signed((8'hb2)) ?
                     wire3[(3'h5):(2'h2)] : wire3[(4'hc):(4'hb)]));
  assign wire5 = (~^$unsigned(((~|(wire4 - wire1)) ~^ $signed({wire4,
                     wire0}))));
  always
    @(posedge clk) begin
      if ($signed(wire0[(3'h4):(3'h4)]))
        begin
          reg6 <= $signed((~&$signed($signed((~&wire5)))));
          reg7 <= $unsigned((($signed(wire0[(2'h3):(1'h1)]) & (~|$signed(wire2))) ?
              (|$unsigned(((8'haf) >= wire3))) : wire2));
          reg8 <= reg6;
        end
      else
        begin
          if (((wire4 ? reg8 : $unsigned($signed(wire3[(3'h5):(1'h0)]))) ?
              wire1[(4'h8):(3'h7)] : $unsigned(((|{reg8,
                  reg6}) > $unsigned($unsigned(wire4))))))
            begin
              reg6 <= reg8;
              reg7 <= {$unsigned($unsigned(wire1[(4'ha):(4'h8)]))};
              reg8 <= ({$signed($signed($unsigned(wire4))), (8'hae)} << wire3);
            end
          else
            begin
              reg6 <= wire5[(4'hc):(3'h7)];
              reg7 <= ((!(^~((reg8 * wire0) ?
                  (wire4 ?
                      wire3 : wire4) : (wire2 <<< reg7)))) + (^~(wire1[(4'hb):(3'h5)] ?
                  {$signed((7'h42))} : ((+(8'hae)) ?
                      $unsigned(wire1) : reg7[(5'h14):(1'h0)]))));
              reg8 <= reg8[(1'h1):(1'h1)];
              reg9 <= reg6[(2'h3):(1'h1)];
              reg10 <= (~&wire4[(4'hd):(4'hd)]);
            end
          reg11 <= {((~^$signed($signed(wire4))) ?
                  reg6[(3'h4):(1'h0)] : ($signed((8'hbb)) ?
                      (~|{reg9}) : reg7[(5'h14):(3'h6)]))};
          reg12 <= (^(^{(8'h9d)}));
          reg13 <= {wire0[(4'ha):(1'h0)],
              (reg11 ? (~|$unsigned({reg12})) : reg8)};
        end
      reg14 <= $signed((($unsigned((~|reg10)) ?
              reg9 : $signed(wire5[(2'h2):(2'h2)])) ?
          (reg6[(1'h0):(1'h0)] ?
              ($unsigned(wire0) << (reg7 >= wire0)) : $signed((wire4 ?
                  reg7 : wire1))) : $unsigned($unsigned(wire4[(2'h3):(1'h1)]))));
      reg15 <= {($unsigned((~$signed(reg7))) ?
              (!$signed((wire5 ?
                  (8'hab) : reg11))) : $signed(wire0[(5'h10):(5'h10)]))};
      reg16 <= ((reg7 ? $unsigned(wire4) : reg10) ?
          ($unsigned($signed($unsigned(wire4))) - reg6[(3'h6):(2'h2)]) : wire4);
    end
  assign wire17 = (&{{$signed(reg9[(1'h1):(1'h1)])}, $unsigned((^(^~reg9)))});
  assign wire18 = (^{((~$signed(reg12)) ?
                          (8'hb2) : $signed(((7'h43) & reg13)))});
  always
    @(posedge clk) begin
      reg19 <= reg14;
      reg20 <= (~&(({{wire2, wire0}} ? reg19[(1'h0):(1'h0)] : reg6) + {{{reg10,
                  reg14}}}));
      reg21 <= $unsigned((|(~^({(8'hbd), reg12} ?
          $signed(wire3) : (reg14 ? reg6 : reg6)))));
      if (reg21)
        begin
          reg22 <= (+reg16);
          reg23 <= reg12[(2'h3):(2'h2)];
          reg24 <= (-$unsigned($unsigned({$signed(reg9), (~reg9)})));
        end
      else
        begin
          reg22 <= (^wire1[(1'h0):(1'h0)]);
        end
    end
  assign wire25 = ((8'hbb) ^ wire4);
  assign wire26 = (~^$signed(wire4[(4'hb):(3'h7)]));
  assign wire27 = $unsigned((($unsigned($signed(wire2)) ?
                      $signed((8'hbb)) : (8'hbd)) * (reg14[(3'h4):(3'h4)] ?
                      (!(wire4 ? wire26 : reg13)) : $signed((reg15 ?
                          reg11 : wire4)))));
endmodule
