module top
#(parameter param31 = (((8'hb8) + (&(~((8'h9d) && (8'ha0))))) ? (((+(&(7'h42))) <<< ({(8'ha3)} <<< ((7'h43) << (8'hb4)))) ? ((~^{(8'hbd), (8'ha1)}) ? (&((8'hb4) | (8'h9e))) : ((~^(8'hbc)) ? ((8'hb1) ? (8'ha2) : (8'hb6)) : {(8'hb8)})) : ((8'h9e) <<< (-((8'hbe) ? (7'h42) : (8'ha7))))) : {{((!(8'ha2)) ^ ((8'hb1) << (8'hbf)))}, (&(((8'hae) ? (8'hb3) : (8'hb1)) ^~ ((7'h40) ? (8'hb4) : (7'h41))))}), 
parameter param32 = {(((8'hbb) >= (~|(param31 ? (8'hb8) : param31))) ? ({(param31 ? param31 : param31), (8'hb9)} == param31) : ((param31 ~^ (8'hb5)) ~^ param31))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire30,
                 wire4,
                 reg29,
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
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned((~|$signed($signed(wire1))));
  always
    @(posedge clk) begin
      reg5 <= wire0[(1'h0):(1'h0)];
      reg6 <= ($unsigned(wire2[(5'h14):(1'h1)]) && ({wire1[(2'h3):(1'h1)],
          (^wire1)} ^~ wire3));
      if (($unsigned((-reg6[(1'h0):(1'h0)])) >>> $unsigned({$signed(((8'hb7) ?
              wire4 : reg5)),
          (wire2 >= wire3)})))
        begin
          reg7 <= $signed($signed((&$unsigned($unsigned(reg6)))));
          reg8 <= $unsigned((reg7 >> (+reg7)));
          if ({$signed((~^(reg7 ?
                  (wire0 ? (8'hbb) : wire1) : wire1[(2'h2):(1'h0)])))})
            begin
              reg9 <= $unsigned($unsigned($signed($unsigned($unsigned(reg5)))));
            end
          else
            begin
              reg9 <= $unsigned({(^~({(8'hb8), reg8} ^~ (wire1 ^ reg8))),
                  ((~^{reg5}) >> (reg9[(4'hd):(4'hc)] < $signed(reg5)))});
              reg10 <= (8'ha2);
              reg11 <= $unsigned(wire2[(4'h9):(4'h9)]);
            end
        end
      else
        begin
          reg7 <= $signed(reg9);
          if ((wire4 | $signed(reg6[(3'h5):(3'h4)])))
            begin
              reg8 <= (($unsigned(reg8) && $signed((|(reg8 + reg11)))) ?
                  reg7[(3'h7):(1'h1)] : reg8[(2'h3):(2'h3)]);
              reg9 <= ((((wire4[(1'h0):(1'h0)] ^ reg8) || (wire2[(2'h3):(2'h3)] ?
                  reg6 : (reg8 < (8'hac)))) | (&(&(wire4 ?
                  wire2 : reg10)))) + (^$signed(reg7)));
            end
          else
            begin
              reg8 <= reg6;
            end
        end
      if ($unsigned(wire1))
        begin
          reg12 <= (reg5 ? {$signed(($unsigned(wire3) == reg7))} : (8'ha9));
        end
      else
        begin
          reg12 <= reg8[(2'h3):(1'h1)];
          reg13 <= wire3;
          reg14 <= wire0[(1'h0):(1'h0)];
          reg15 <= reg13[(1'h1):(1'h1)];
        end
      if ($signed($signed((8'ha4))))
        begin
          reg16 <= ($signed((8'ha6)) != reg12);
          reg17 <= $signed($unsigned(($unsigned((~reg10)) ?
              (reg7 || reg15[(4'ha):(2'h2)]) : (~|(-reg6)))));
          reg18 <= $unsigned(reg6[(3'h5):(2'h2)]);
          reg19 <= reg7;
          if ((~($unsigned((~((8'h9c) ^ reg18))) ?
              $unsigned(((wire3 ? wire4 : reg17) ?
                  $signed(reg15) : reg14)) : $signed(reg18[(4'h8):(2'h2)]))))
            begin
              reg20 <= reg15[(5'h12):(4'he)];
              reg21 <= (&$unsigned(($signed((reg13 == reg14)) ?
                  ((+wire1) ? (wire3 - reg15) : (^wire0)) : ({reg16, wire2} ?
                      reg5 : (reg17 ~^ reg7)))));
              reg22 <= wire3;
              reg23 <= ((($signed($signed(reg5)) ?
                  (reg20[(5'h12):(5'h11)] > (reg19 >= reg12)) : reg8) || $unsigned(($unsigned(reg17) | $signed(reg18)))) & {$signed((-reg12))});
              reg24 <= $unsigned((~&reg22[(5'h11):(4'h8)]));
            end
          else
            begin
              reg20 <= $signed(($unsigned(((~^reg22) ?
                      (reg6 ? reg10 : reg7) : $signed(reg11))) ?
                  ($unsigned(((8'hba) ?
                      (8'had) : wire0)) ^ $unsigned((reg19 - reg10))) : $unsigned(((reg10 ?
                          (8'ha5) : reg16) ?
                      (wire2 ? wire1 : reg15) : reg13))));
              reg21 <= reg8[(4'hb):(2'h3)];
              reg22 <= ((reg7[(3'h5):(3'h4)] << (+$signed(wire3))) + $unsigned((reg12 ?
                  $signed($signed((8'hb8))) : (~|reg24))));
            end
        end
      else
        begin
          reg16 <= $signed(wire1);
          reg17 <= reg16;
        end
    end
  always
    @(posedge clk) begin
      reg25 <= reg23[(3'h5):(1'h0)];
      if ($unsigned(reg6))
        begin
          reg26 <= ($signed(($unsigned($unsigned(wire2)) ?
                  reg8[(3'h4):(2'h3)] : $signed(reg17[(1'h0):(1'h0)]))) ?
              reg7[(3'h7):(3'h4)] : reg18[(1'h1):(1'h1)]);
          reg27 <= (^reg9[(4'he):(4'hb)]);
        end
      else
        begin
          reg26 <= reg18[(4'h9):(3'h4)];
          reg27 <= ($signed((~$signed((|reg7)))) ?
              reg21[(4'hc):(3'h5)] : {($signed((wire4 & reg5)) ?
                      ($unsigned(reg24) ?
                          reg26 : $signed(reg22)) : $unsigned((~^(8'ha5)))),
                  $unsigned(wire0[(1'h1):(1'h0)])});
          reg28 <= reg14;
        end
      reg29 <= (~&wire3);
    end
  assign wire30 = $signed((reg11[(2'h2):(2'h2)] <<< (&reg26[(4'ha):(3'h4)])));
endmodule
