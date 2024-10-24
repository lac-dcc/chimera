module top
#(parameter param24 = (~(-(|(((8'h9d) ? (8'hb8) : (8'ha5)) ? (~|(8'hb4)) : ((8'h9f) >> (8'hb2)))))), 
parameter param25 = param24)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = ((|wire2) ? $unsigned(wire3[(3'h5):(3'h5)]) : wire3);
  assign wire5 = ($signed(wire2[(2'h3):(1'h0)]) | (wire1[(1'h1):(1'h0)] ?
                     ({wire3} <<< (wire2[(4'he):(4'he)] ?
                         wire1 : (wire2 >> wire1))) : {wire1,
                         $unsigned((^~wire3))}));
  always
    @(posedge clk) begin
      if ($signed((~|wire4[(1'h0):(1'h0)])))
        begin
          reg6 <= (($unsigned((8'ha9)) > (~(wire2 ?
                  wire3[(5'h12):(2'h3)] : wire5[(4'hd):(1'h0)]))) ?
              $unsigned(((!$signed(wire2)) ?
                  ((wire0 + wire4) ?
                      wire1[(4'h9):(2'h3)] : (~wire3)) : ((^~wire5) ?
                      (wire2 && wire2) : ((7'h42) | wire3)))) : wire3);
          reg7 <= $unsigned(wire2);
          reg8 <= wire4;
        end
      else
        begin
          if ($signed(wire2[(4'hf):(2'h3)]))
            begin
              reg6 <= {(&$signed({(wire4 ? (8'hbf) : (8'h9d)),
                      (wire1 ? (8'hbb) : (8'haa))}))};
              reg7 <= wire3[(5'h14):(4'hd)];
              reg8 <= (reg7 ?
                  (($unsigned(wire2) <= $unsigned((wire1 >> wire3))) ?
                      $signed(wire3[(4'h8):(3'h4)]) : ((wire5 < $unsigned(reg8)) ?
                          $signed(reg6[(1'h1):(1'h0)]) : reg7)) : wire3[(4'hd):(2'h3)]);
              reg9 <= reg6[(1'h0):(1'h0)];
            end
          else
            begin
              reg6 <= (-(reg8[(2'h2):(1'h1)] | wire5[(1'h0):(1'h0)]));
              reg7 <= (((~^$signed(reg7)) ?
                  wire5 : $unsigned(wire0)) | $unsigned((((reg8 ?
                          wire4 : wire3) ?
                      (reg9 >> (8'haf)) : (wire0 - (8'ha2))) ?
                  (~(wire4 ? wire3 : wire4)) : $signed((~|reg6)))));
              reg8 <= wire1[(3'h7):(1'h1)];
            end
          reg10 <= (reg9[(1'h1):(1'h0)] ?
              (($unsigned((wire1 >= wire3)) && $signed(reg7)) == ((^~(8'haa)) ?
                  (wire3 ?
                      reg8 : {(8'h9e),
                          (7'h42)}) : wire1[(3'h4):(2'h3)])) : ($signed({{reg8,
                      (8'h9c)}}) | wire1[(3'h6):(2'h3)]));
          reg11 <= (+$signed((reg10 * ((wire3 ~^ wire1) ?
              $signed((8'haf)) : (wire5 ? wire0 : wire5)))));
          if ((reg7[(1'h1):(1'h0)] | (&(wire0 ?
              $signed($unsigned(wire4)) : ((!wire3) >>> ((8'ha2) & wire1))))))
            begin
              reg12 <= {{{($signed(wire1) + (!(8'h9e)))}}};
              reg13 <= {((reg9[(2'h2):(1'h1)] ^~ ({reg7} == (^wire5))) >= (((wire4 ?
                          reg11 : wire4) ~^ ((8'hab) ? reg11 : reg8)) ?
                      (~&reg8[(3'h7):(3'h4)]) : reg6[(2'h2):(2'h2)]))};
              reg14 <= $unsigned((~^reg7));
              reg15 <= {(^$unsigned(reg11[(2'h3):(1'h0)]))};
              reg16 <= (!$signed($signed($unsigned((reg12 << reg10)))));
            end
          else
            begin
              reg12 <= reg6;
              reg13 <= (-($signed({(+reg7),
                  wire2}) && $unsigned(($signed(wire1) ^ $signed(reg15)))));
              reg14 <= reg15[(2'h2):(1'h1)];
              reg15 <= (reg15[(1'h0):(1'h0)] ?
                  wire5[(4'hd):(4'hc)] : $signed((((reg9 ? (8'hb4) : wire4) ?
                      (8'h9d) : (~|wire5)) - $signed((~|wire3)))));
              reg16 <= wire1;
            end
          reg17 <= $signed($signed(reg14));
        end
      reg18 <= reg10[(2'h2):(1'h1)];
      reg19 <= (8'hbb);
      if (reg9)
        begin
          if ({($unsigned($signed((reg19 ^~ (8'hb2)))) ^ (reg12[(5'h10):(4'h9)] ?
                  reg16 : (reg11[(3'h6):(1'h0)] ?
                      ((7'h44) << reg12) : (wire3 ~^ wire4))))})
            begin
              reg20 <= (~|(((^reg13) + $unsigned($unsigned(reg6))) ?
                  ((!(8'hb0)) ?
                      (reg13 ?
                          (8'haf) : $unsigned(reg17)) : (reg18[(5'h10):(2'h3)] ?
                          (+reg18) : $signed(reg18))) : $unsigned(($signed(reg11) ?
                      reg19 : {wire4}))));
              reg21 <= $signed(((~^$signed(wire4)) && reg13));
            end
          else
            begin
              reg20 <= ($signed(reg10[(4'ha):(3'h6)]) >> (!reg19));
              reg21 <= {(8'ha4),
                  ($unsigned((wire3[(4'hd):(3'h4)] ? {reg7, reg8} : {reg14})) ?
                      $signed($signed((reg6 ?
                          wire2 : reg17))) : reg20[(3'h6):(2'h3)])};
            end
        end
      else
        begin
          reg20 <= ((reg12 >= wire2[(3'h5):(3'h5)]) ~^ $signed(reg10));
        end
    end
  assign wire22 = $unsigned((reg11[(1'h1):(1'h1)] ^~ reg20[(3'h6):(3'h4)]));
  assign wire23 = $signed(($unsigned((|(^~reg15))) != $unsigned(reg19[(1'h0):(1'h0)])));
endmodule
