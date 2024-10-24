module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  assign y = {wire13,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = (wire0 ?
                     {($signed({wire4, wire4}) ?
                             ({wire4, wire2} ?
                                 (|wire2) : (wire0 ?
                                     wire0 : (8'hb5))) : $signed((wire3 ~^ wire3))),
                         wire2[(3'h6):(1'h1)]} : ((7'h42) ?
                         wire0[(2'h2):(1'h0)] : $unsigned($signed((wire3 ?
                             wire0 : wire3)))));
  assign wire6 = wire4;
  assign wire7 = wire3;
  assign wire8 = ((~&(!wire7)) ?
                     ($unsigned(wire6[(4'h9):(3'h6)]) ?
                         {{$unsigned(wire1)},
                             $unsigned(wire7[(3'h4):(3'h4)])} : (8'ha5)) : {$signed(wire2),
                         (wire4[(1'h1):(1'h0)] ?
                             (wire3[(5'h13):(5'h10)] >= (~wire4)) : wire5)});
  always
    @(posedge clk) begin
      reg9 <= (($unsigned((wire2[(1'h1):(1'h0)] ?
              (wire2 + (8'hbd)) : $signed(wire4))) ?
          (~^wire7) : $signed(({wire3} == $signed((8'ha9))))) | $unsigned(((wire3[(1'h1):(1'h1)] ~^ {wire7}) ?
          $unsigned((8'hb7)) : $signed(wire5))));
      reg10 <= wire6;
      reg11 <= wire1;
      reg12 <= wire1;
    end
  assign wire13 = $signed($unsigned(reg9));
  always
    @(posedge clk) begin
      reg14 <= $signed((~&$unsigned((reg12[(4'h9):(3'h6)] ?
          wire8[(3'h5):(3'h5)] : $signed(wire5)))));
    end
  always
    @(posedge clk) begin
      reg15 <= $unsigned($signed(reg10));
      if (wire7)
        begin
          if (wire6)
            begin
              reg16 <= $unsigned((wire2 ?
                  ({(+reg12), (wire7 << wire3)} ?
                      wire0 : (~|(reg9 <= wire5))) : $unsigned($signed((reg14 <<< reg14)))));
              reg17 <= $signed($signed((&$signed((~|reg10)))));
              reg18 <= (~$signed(wire13[(4'hb):(3'h5)]));
            end
          else
            begin
              reg16 <= reg12[(3'h7):(2'h3)];
              reg17 <= ($unsigned((((wire6 ^ (8'hab)) ?
                  $unsigned(reg14) : (7'h42)) ^~ ($unsigned(reg14) <<< $signed(reg17)))) * reg15);
              reg18 <= reg9[(3'h4):(1'h0)];
              reg19 <= (~^($signed(reg16) ?
                  reg18[(2'h2):(1'h0)] : ((-$signed(wire2)) - (^~$unsigned(wire5)))));
              reg20 <= wire6[(4'h9):(3'h5)];
            end
          reg21 <= ((reg12[(3'h4):(1'h0)] * wire5[(4'h8):(3'h6)]) << ($signed((reg12 || {reg18})) >> {$unsigned(wire13)}));
          reg22 <= reg21;
          reg23 <= (reg15 ?
              $signed($unsigned(((8'hbc) - $unsigned(reg20)))) : wire4);
          reg24 <= ((reg14[(1'h0):(1'h0)] ?
              $signed(($unsigned(wire6) ?
                  $unsigned(wire0) : wire8[(2'h2):(1'h0)])) : reg23) > ($unsigned(({wire7,
                  reg9} ?
              $unsigned(reg20) : reg14[(1'h0):(1'h0)])) || ((!(reg11 <= reg18)) ?
              ($signed(reg20) ?
                  ((7'h44) ? wire13 : reg16) : $unsigned(reg12)) : wire2)));
        end
      else
        begin
          reg16 <= $unsigned(({$signed((&reg16)),
                  ($signed(wire7) || $unsigned(wire4))} ?
              reg10 : wire0[(4'h8):(2'h3)]));
          reg17 <= (wire0[(4'h8):(3'h4)] < wire8);
          reg18 <= $unsigned(reg10[(3'h4):(2'h3)]);
          reg19 <= reg23;
        end
      reg25 <= {wire1, reg18[(2'h3):(1'h0)]};
      reg26 <= reg21;
      reg27 <= ($signed($unsigned(reg17)) || wire4[(4'hc):(4'h8)]);
    end
endmodule
