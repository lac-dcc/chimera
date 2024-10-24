module top
#(parameter param28 = {(({((8'h9c) ? (8'hb4) : (8'ha0))} ? (8'h9c) : (^~((8'ha3) ? (7'h40) : (8'hae)))) << {(((8'had) & (8'hb4)) < ((8'hbf) ? (8'hb8) : (8'ha4))), (-(~^(8'ha8)))})}, 
parameter param29 = (({(param28 - (~^(8'ha3)))} - (+((|param28) <<< (param28 ? param28 : param28)))) ? (({(param28 ? param28 : (8'hb4))} ^ ((param28 & param28) ? (param28 ? param28 : param28) : {(8'ha9)})) ? ((((8'ha4) > param28) ? ((8'hb0) ? param28 : param28) : ((8'hb8) + param28)) ? ((param28 ? param28 : param28) == param28) : {{(8'hb7)}, (param28 == param28)}) : {(((8'hbc) ? param28 : param28) ? (~param28) : (param28 ? param28 : param28)), (~|param28)}) : (param28 ? (((~^(8'hba)) || (param28 ? param28 : param28)) <<< ((param28 ? param28 : param28) != ((8'hb3) ? (8'hb2) : param28))) : ({(~^param28), (^~(8'hab))} * param28))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire20;
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire21,
                 wire20,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
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
  always
    @(posedge clk) begin
      if ((^((~$unsigned({wire3})) * $signed(wire0))))
        begin
          reg5 <= (wire2[(3'h4):(2'h3)] - wire3);
          reg6 <= wire3[(3'h7):(3'h7)];
          reg7 <= wire4;
          if ($unsigned(reg7[(1'h1):(1'h0)]))
            begin
              reg8 <= wire1[(1'h0):(1'h0)];
              reg9 <= $unsigned($signed($unsigned((|$signed(wire1)))));
              reg10 <= ($unsigned((((reg7 ?
                      reg5 : (8'ha0)) ^ wire2) >= (^wire3[(4'h8):(3'h4)]))) ?
                  reg6 : reg9);
              reg11 <= reg9;
            end
          else
            begin
              reg8 <= wire0;
              reg9 <= (~^reg6[(4'h9):(3'h7)]);
              reg10 <= (($signed(wire0) << reg6) ?
                  {wire0[(1'h1):(1'h1)],
                      $signed(($unsigned(reg6) ?
                          $unsigned(wire1) : wire1[(4'hc):(4'h9)]))} : reg11);
            end
          if (reg11[(4'h8):(3'h7)])
            begin
              reg12 <= wire1[(4'he):(3'h5)];
            end
          else
            begin
              reg12 <= $unsigned(($unsigned((reg11 << (^~(8'ha9)))) <<< (($unsigned(reg5) <= reg11[(5'h10):(3'h7)]) ?
                  reg11 : (reg10[(4'h8):(3'h5)] < $signed(wire4)))));
              reg13 <= (((&(reg10 || (~^reg10))) << (reg5 ? (~reg5) : wire2)) ?
                  $unsigned($unsigned((^~(~|(8'h9c))))) : (|((~&wire1) ?
                      (~|$signed(wire2)) : {(8'hba), (wire3 ^ wire2)})));
              reg14 <= $unsigned(reg8[(4'h8):(3'h6)]);
            end
        end
      else
        begin
          reg5 <= ({{$unsigned($signed((8'ha1)))}} <<< $signed(reg5[(3'h4):(1'h1)]));
          reg6 <= $unsigned((-($signed((~|reg13)) ^~ (8'hb1))));
        end
      reg15 <= (&{($unsigned(reg8[(4'h9):(4'h8)]) == reg10[(2'h2):(2'h2)]),
          ($signed((reg13 | reg7)) ? $signed(wire1) : (&((8'hb7) > reg7)))});
      reg16 <= (~(wire1[(4'h9):(4'h9)] ?
          $signed({wire1[(1'h0):(1'h0)],
              (reg9 << reg8)}) : wire0[(4'hf):(3'h4)]));
      if (reg8[(3'h4):(1'h0)])
        begin
          reg17 <= $unsigned(((wire2 ?
              ($unsigned(wire4) ?
                  (reg8 != wire1) : $unsigned(wire2)) : $signed((wire1 ?
                  reg16 : reg8))) > $unsigned($unsigned(((8'had) ^~ reg16)))));
          reg18 <= (8'hb5);
        end
      else
        begin
          reg17 <= reg11;
          reg18 <= ((wire3 > ((^(~^(8'h9e))) ?
                  (reg10[(4'he):(4'ha)] ? $signed(reg14) : reg17) : (^wire3))) ?
              $signed($signed((reg7 ?
                  {reg15,
                      (8'had)} : (reg12 || reg17)))) : $signed((-{(^(7'h40))})));
        end
      reg19 <= {reg9[(4'hb):(3'h7)]};
    end
  assign wire20 = (8'haa);
  assign wire21 = (|{$signed((reg17 * reg15[(2'h2):(1'h0)])),
                      ($signed($unsigned(reg9)) > wire0[(1'h1):(1'h0)])});
  always
    @(posedge clk) begin
      reg22 <= $signed(reg7[(4'hf):(4'hf)]);
      reg23 <= ({(~reg14[(2'h2):(1'h1)])} ?
          $unsigned({$unsigned($unsigned(reg5)), $unsigned(reg8)}) : reg5);
      reg24 <= (($signed(reg7[(3'h5):(2'h2)]) ?
              $unsigned({reg11, wire21}) : $signed((-(reg5 ? reg23 : reg8)))) ?
          (&$signed({(~&reg17)})) : $unsigned({((8'hb3) ?
                  wire20[(2'h3):(1'h0)] : reg18)}));
      reg25 <= (reg7[(5'h11):(1'h1)] & $unsigned(reg22));
    end
  assign wire26 = (~&(($unsigned((!reg12)) < (^~(~^reg5))) ?
                      $signed(($signed(reg19) < wire3[(4'h9):(2'h3)])) : $signed($unsigned({(8'h9c),
                          reg12}))));
  assign wire27 = reg11;
endmodule
