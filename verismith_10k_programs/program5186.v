module top
#(parameter param28 = {({(~&{(7'h42), (8'hb1)}), {(8'ha0), ((8'ha7) ? (8'hb4) : (8'hb3))}} >> (((&(8'hb4)) ? ((8'had) + (7'h40)) : (|(8'hb8))) <= ((~(8'haa)) | ((8'hb5) ? (8'hb9) : (8'hb3))))), (((!((8'ha5) < (8'hb4))) ? (((8'hb7) && (7'h42)) ? ((7'h44) ? (8'hab) : (8'hbf)) : (^(8'hba))) : {((8'haf) ? (7'h42) : (8'hbe))}) < ((~^((8'ha9) ~^ (8'ha5))) ? ((^~(8'h9d)) || {(8'hb0), (8'hbc)}) : (^((8'hbf) ? (8'ha5) : (8'hbe)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = $signed($unsigned(wire1[(4'hd):(4'h9)]));
  assign wire5 = wire1;
  assign wire6 = ((wire5[(1'h0):(1'h0)] ?
                         {($signed(wire5) & (wire2 >= wire1)),
                             (wire1 ?
                                 (wire2 ?
                                     wire1 : wire5) : wire2[(4'hb):(2'h2)])} : wire5) ?
                     wire5[(1'h0):(1'h0)] : wire5[(4'hc):(3'h5)]);
  always
    @(posedge clk) begin
      reg7 <= ($signed(wire2) > $signed({wire0}));
      reg8 <= ($unsigned($unsigned($signed({wire5}))) >>> ($signed(reg7[(3'h7):(3'h6)]) && ($unsigned((wire0 ?
          reg7 : (8'hb6))) <<< (-wire6[(4'h9):(1'h1)]))));
      if (wire0[(1'h1):(1'h0)])
        begin
          reg9 <= ($unsigned($unsigned(wire5[(4'hd):(2'h2)])) ?
              wire6[(4'h9):(4'h9)] : (^wire3));
          if ({$unsigned($unsigned({(|reg9)})),
              {reg9, (+(wire2 * (~^(8'hae))))}})
            begin
              reg10 <= wire4;
              reg11 <= reg10;
              reg12 <= (wire1[(5'h13):(3'h5)] ? wire4 : reg10[(1'h0):(1'h0)]);
              reg13 <= $signed((wire2 ?
                  ((^$signed((8'hb8))) ?
                      (wire3 ?
                          (reg9 - (8'hbf)) : {wire5,
                              reg10}) : $signed((reg10 > (8'hb6)))) : reg12));
              reg14 <= reg8;
            end
          else
            begin
              reg10 <= $signed(wire3[(1'h1):(1'h1)]);
            end
          if ($unsigned(reg7))
            begin
              reg15 <= wire5[(4'he):(4'h8)];
              reg16 <= (wire6 < ((reg7[(5'h10):(2'h3)] ?
                  ($signed((8'hbe)) ~^ (^wire2)) : ((+(8'h9e)) ?
                      (7'h41) : reg12)) != reg8[(1'h0):(1'h0)]));
              reg17 <= (^~wire5[(2'h3):(1'h1)]);
              reg18 <= (wire6[(3'h5):(3'h4)] ?
                  ($unsigned($unsigned((8'ha1))) >= {(reg12[(2'h2):(1'h1)] != (wire1 ?
                          wire4 : reg15))}) : $unsigned((&($unsigned(reg8) ~^ (~|reg15)))));
              reg19 <= reg8;
            end
          else
            begin
              reg15 <= $signed($signed(($unsigned((reg9 ^~ reg7)) * ((wire3 | (8'ha7)) ?
                  $unsigned((8'ha8)) : $unsigned(reg19)))));
              reg16 <= $signed((~$unsigned((wire1[(5'h14):(3'h6)] ?
                  $unsigned(reg8) : $signed((8'ha3))))));
            end
          if ({(8'hb3), reg16})
            begin
              reg20 <= (((~&$unsigned({reg8, wire4})) & {(!(wire5 == reg12)),
                      reg9[(1'h1):(1'h0)]}) ?
                  (&wire1[(4'hc):(4'ha)]) : ($unsigned(($unsigned(reg17) ^ $unsigned(reg12))) ?
                      reg7[(4'h8):(2'h2)] : wire2[(4'hf):(3'h4)]));
              reg21 <= reg12;
              reg22 <= $unsigned(wire0[(3'h5):(2'h3)]);
              reg23 <= reg18;
            end
          else
            begin
              reg20 <= (&$unsigned((~^wire6)));
              reg21 <= {$signed(reg23[(3'h7):(3'h5)]),
                  $unsigned((((reg16 - reg7) <<< ((7'h43) ?
                      reg20 : (8'haa))) > ($signed(reg8) < (!(8'hb0)))))};
              reg22 <= (reg18[(4'h8):(2'h3)] ?
                  (|reg14) : ((|(^~((8'hb5) ? reg15 : reg19))) >= reg14));
              reg23 <= wire2;
              reg24 <= $unsigned(reg14[(4'he):(4'ha)]);
            end
        end
      else
        begin
          reg9 <= reg17;
        end
    end
  assign wire25 = (({($signed((8'ha2)) * $signed(reg13))} ?
                          (($signed(wire4) ?
                              (reg9 & reg14) : (reg9 ?
                                  reg16 : reg9)) >> {(reg10 & reg15)}) : wire2[(4'hd):(4'h8)]) ?
                      (8'ha0) : {reg13[(4'he):(3'h6)],
                          $unsigned((&$signed(reg11)))});
  assign wire26 = $signed($signed(reg11));
  assign wire27 = (8'hb8);
endmodule
