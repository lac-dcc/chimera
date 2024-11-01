module top
#(parameter param16 = {(+((((8'hbe) ? (8'hab) : (8'ha3)) && ((8'h9e) ? (8'h9c) : (8'hac))) < (-{(8'ha3)}))), ((((~(8'ha0)) ? (~&(8'hbf)) : ((8'hb7) | (7'h43))) ^~ (!(~&(8'ha0)))) ? {(&((8'h9d) && (8'hbc))), (~|((8'ha4) ? (8'hbc) : (8'hb8)))} : {({(8'hbe)} ? (~|(8'hb2)) : (~(8'hb4)))})}, 
parameter param17 = (param16 ? ({param16, param16} ? (&(~^(8'hb3))) : ((((8'hab) ? param16 : (8'ha7)) ? (8'hb7) : (param16 + param16)) ? param16 : param16)) : ((param16 ? ((!param16) ? (~&param16) : (8'hab)) : param16) - param16)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
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
  assign wire5 = (|($unsigned($signed($unsigned(wire3))) ?
                     $signed(wire2[(1'h1):(1'h0)]) : wire4));
  assign wire6 = {(wire4 ?
                         (({wire3, wire1} ?
                             ((8'had) ?
                                 wire4 : wire2) : (~wire3)) ~^ {wire3[(1'h0):(1'h0)],
                             $signed((8'ha9))}) : wire1)};
  always
    @(posedge clk) begin
      reg7 <= wire1[(4'h8):(2'h3)];
    end
  always
    @(posedge clk) begin
      if ($signed(wire6[(1'h0):(1'h0)]))
        begin
          if (wire5)
            begin
              reg8 <= (wire4[(3'h7):(3'h5)] ?
                  (~&$signed(((~reg7) | $unsigned(wire0)))) : reg7[(3'h7):(3'h6)]);
              reg9 <= $unsigned(wire1[(4'ha):(3'h6)]);
              reg10 <= (!wire3[(4'hb):(1'h1)]);
              reg11 <= (8'hac);
            end
          else
            begin
              reg8 <= (wire3[(4'h8):(1'h1)] >= (^~(7'h42)));
              reg9 <= $signed(wire2[(1'h0):(1'h0)]);
              reg10 <= (({$signed($signed(wire2))} ?
                  (!$signed($signed(wire0))) : reg7) <= reg7);
              reg11 <= (&$signed((wire1 || (((8'hbf) ? reg10 : wire4) ?
                  ((8'ha3) ? (8'ha9) : wire0) : $signed(wire0)))));
              reg12 <= ((wire3 ?
                  $unsigned($unsigned(reg7[(4'hb):(3'h6)])) : (wire2[(2'h2):(2'h2)] != wire6)) <<< {reg9});
            end
          reg13 <= ($unsigned({reg12[(4'he):(4'hd)]}) == (($signed($signed(reg11)) > $signed(reg12[(2'h3):(1'h1)])) ^~ (reg8[(1'h0):(1'h0)] ?
              $unsigned(reg9[(1'h1):(1'h1)]) : $signed((reg7 ^ reg12)))));
          reg14 <= $signed({((wire4[(3'h4):(2'h3)] == (wire5 * wire4)) ?
                  (^(-(8'hb4))) : ((wire6 ^ reg7) ?
                      (wire0 ^~ reg7) : $signed(reg12)))});
        end
      else
        begin
          if ({$unsigned((^reg10[(5'h10):(3'h4)])),
              {((~&(reg12 << reg12)) ?
                      ($unsigned((8'hab)) || {wire2,
                          (8'ha5)}) : $unsigned(wire6)),
                  wire5}})
            begin
              reg8 <= $unsigned(($signed($unsigned(reg7)) ?
                  $signed($signed($unsigned(reg7))) : ($signed((reg10 || reg11)) + $signed(wire4))));
              reg9 <= (($unsigned(($signed(reg9) - (wire6 >= reg11))) ?
                  $signed(wire4[(1'h1):(1'h1)]) : $unsigned(($signed((8'ha0)) ~^ ((8'h9d) ?
                      reg8 : wire3)))) ^~ (8'ha4));
              reg10 <= $unsigned({$signed((8'hb4)), $unsigned(reg13)});
              reg11 <= (^~($unsigned((reg12 || reg14)) ^~ (^~wire4)));
            end
          else
            begin
              reg8 <= $signed((~$unsigned(((wire6 ? reg11 : wire4) ?
                  $unsigned(reg12) : reg10[(4'hc):(1'h0)]))));
            end
          reg12 <= $unsigned($unsigned(reg10[(2'h3):(2'h2)]));
          reg13 <= (8'hbf);
          reg14 <= reg9[(3'h5):(2'h2)];
        end
      reg15 <= {reg14[(4'hf):(1'h1)], $signed(wire4[(3'h5):(1'h0)])};
    end
endmodule
