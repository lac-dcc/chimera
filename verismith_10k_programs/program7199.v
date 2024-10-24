module top
#(parameter param36 = (~^(({((8'hbf) ? (8'had) : (8'hbb))} ? ({(7'h42)} ? {(8'ha5)} : (|(8'hb8))) : (^((7'h43) ? (8'hab) : (8'had)))) != ({((8'h9e) ? (8'hb2) : (8'ha0))} ? (((8'ha2) != (8'ha1)) < {(8'hb5), (8'ha0)}) : ((-(8'ha5)) ? ((8'ha7) ? (8'had) : (8'hb1)) : ((8'ha2) ? (8'hb1) : (8'hb4)))))), 
parameter param37 = ((param36 ? (!(((7'h41) ? param36 : param36) ? param36 : ((8'had) ? param36 : param36))) : param36) > ((((param36 ? param36 : param36) ? (~|param36) : (~param36)) | {param36, param36}) ? (8'hbb) : param36)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire35,
                 wire30,
                 wire29,
                 wire28,
                 wire4,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
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
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire3;
  always
    @(posedge clk) begin
      reg5 <= $signed(((~^wire1[(4'hf):(4'hc)]) != (+$signed($signed(wire1)))));
      reg6 <= ({{wire2}, $signed((^(wire2 & wire4)))} ?
          {$unsigned($signed($unsigned((8'ha0))))} : ($signed((-(wire3 & (8'ha6)))) + wire4[(4'h9):(3'h5)]));
    end
  always
    @(posedge clk) begin
      reg7 <= wire4;
      reg8 <= (reg6 ^ reg5[(4'hb):(3'h4)]);
      if ((reg6 >> wire3[(1'h0):(1'h0)]))
        begin
          if ($signed((&{$unsigned(reg8[(4'hf):(4'hf)])})))
            begin
              reg9 <= wire0;
              reg10 <= ({reg9[(2'h2):(1'h0)]} >>> (^~((8'hbf) ?
                  wire1 : wire1[(5'h11):(2'h3)])));
              reg11 <= reg7;
              reg12 <= (~^reg5);
            end
          else
            begin
              reg9 <= reg10;
              reg10 <= reg7[(3'h7):(3'h5)];
              reg11 <= {(~|$unsigned(reg9[(1'h1):(1'h0)]))};
            end
          reg13 <= $signed($unsigned(wire0[(2'h3):(1'h0)]));
          if ({(8'hbd),
              ($unsigned($signed(wire3[(4'h9):(3'h7)])) ?
                  ((^wire3[(3'h7):(3'h5)]) ^~ $unsigned((reg11 ?
                      wire1 : wire1))) : $signed($unsigned((reg5 ?
                      reg13 : wire1))))})
            begin
              reg14 <= reg6[(1'h1):(1'h0)];
            end
          else
            begin
              reg14 <= reg7[(4'ha):(4'h9)];
              reg15 <= reg13[(4'hd):(3'h7)];
            end
          reg16 <= (reg12[(4'hb):(2'h3)] ^ ($unsigned(((reg10 >= reg9) ?
                  $unsigned(reg8) : (^reg11))) ?
              (&wire3[(1'h1):(1'h0)]) : (((reg13 >= wire2) ~^ $signed(reg6)) ?
                  reg15 : $unsigned({(8'hb4)}))));
        end
      else
        begin
          reg9 <= (8'ha0);
          if ((&(reg5 < reg10[(4'h9):(3'h4)])))
            begin
              reg10 <= (^~$unsigned(($unsigned($signed(reg5)) ?
                  (|reg7[(4'h8):(2'h2)]) : $signed($unsigned(reg12)))));
              reg11 <= reg12[(3'h5):(1'h1)];
              reg12 <= (8'hb1);
              reg13 <= ($unsigned($signed(reg10[(2'h2):(2'h2)])) ?
                  (|(((&reg6) ^~ reg8) | $signed((reg7 && reg14)))) : ((-reg7[(3'h4):(1'h1)]) >= $unsigned($unsigned(((8'hbc) ?
                      wire1 : wire2)))));
              reg14 <= reg12;
            end
          else
            begin
              reg10 <= (reg9[(1'h1):(1'h1)] > reg8[(4'h9):(3'h7)]);
              reg11 <= reg6;
            end
        end
      reg17 <= (reg16 ?
          $signed($signed((~^$signed(wire0)))) : (+reg13[(3'h5):(1'h0)]));
      if ({reg5[(3'h6):(1'h1)]})
        begin
          reg18 <= wire3;
          if (({((reg14[(4'h8):(3'h5)] >> reg5) ^~ (&$signed(reg11)))} ?
              reg18[(1'h1):(1'h1)] : reg5[(4'h8):(3'h6)]))
            begin
              reg19 <= $signed((8'hba));
              reg20 <= reg10[(2'h2):(1'h0)];
              reg21 <= $signed((+(^reg8[(5'h11):(4'hc)])));
              reg22 <= wire1[(3'h6):(1'h1)];
              reg23 <= reg12[(3'h7):(2'h2)];
            end
          else
            begin
              reg19 <= $unsigned($unsigned({$signed((wire0 + wire2))}));
              reg20 <= $unsigned($unsigned(wire3));
            end
          if ($signed($unsigned((~^reg7))))
            begin
              reg24 <= wire0[(2'h3):(2'h3)];
            end
          else
            begin
              reg24 <= (wire0[(3'h5):(2'h2)] - reg21);
              reg25 <= $unsigned((^(((~|reg11) - reg24[(2'h2):(1'h0)]) ?
                  $unsigned($signed(reg8)) : ((wire3 & wire1) && $unsigned(reg16)))));
            end
          reg26 <= {$signed((reg11 ?
                  $unsigned($unsigned(reg12)) : ((reg6 >> reg8) ?
                      wire4 : (reg5 ? reg16 : reg18)))),
              (~((reg7[(1'h0):(1'h0)] ? (reg5 << reg11) : reg10) ?
                  reg24[(4'h9):(2'h3)] : (&(reg14 & (8'hb4)))))};
          reg27 <= reg25;
        end
      else
        begin
          reg18 <= (reg18 ~^ (+$signed(reg27)));
        end
    end
  assign wire28 = reg19[(3'h7):(2'h3)];
  assign wire29 = reg20;
  assign wire30 = $unsigned($signed(wire4));
  always
    @(posedge clk) begin
      reg31 <= reg7;
      reg32 <= {($signed(wire0[(3'h4):(2'h3)]) == $signed(($unsigned(reg31) + ((8'hb9) >= reg9)))),
          (~$unsigned(wire1[(1'h0):(1'h0)]))};
      reg33 <= reg20;
      reg34 <= ($signed((($signed(reg7) >= $unsigned(reg12)) <<< (reg11 && (wire28 != reg14)))) - reg22[(1'h0):(1'h0)]);
    end
  assign wire35 = $signed(((^$unsigned($unsigned(reg17))) + ($unsigned(reg17) ?
                      (~&(wire4 >>> reg33)) : $unsigned((reg19 != wire4)))));
endmodule
