module top
#(parameter param20 = (((~^(((8'hab) + (8'hab)) != ((8'hbf) >= (8'ha5)))) | (~(((7'h42) ? (8'hab) : (8'h9f)) ? ((8'hb1) >= (7'h40)) : ((8'hbb) >>> (8'ha7))))) + (({((8'hb7) == (8'h9c)), ((8'hb9) >> (8'ha4))} ? ({(8'hab), (8'hb1)} ? ((8'hb6) & (8'hb0)) : ((8'hb7) - (8'hb2))) : (+(~^(8'ha7)))) ^ (({(8'hb5)} ? (~|(8'hab)) : (^(8'ha5))) >= ((+(8'haf)) * {(8'ha0), (8'ha7)})))), 
parameter param21 = (^{param20}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire5,
                 wire4,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (($unsigned($signed(wire3)) ?
                         ($signed((wire2 >> wire3)) ?
                             (wire1[(3'h6):(1'h0)] ?
                                 wire0[(2'h2):(2'h2)] : (wire0 > wire1)) : (!$signed(wire3))) : (~&$signed({wire2}))) ?
                     ($unsigned($unsigned({wire1})) ~^ ({(wire3 ?
                                 wire4 : wire4),
                             wire4[(3'h6):(3'h5)]} ?
                         wire0 : (-(wire1 | (8'ha9))))) : ($signed((|$unsigned((8'hbe)))) ?
                         wire0 : (wire1[(4'h8):(3'h5)] >> (8'hbd))));
  always
    @(posedge clk) begin
      reg6 <= (^((^~$unsigned($signed(wire2))) <= wire0));
      if ($signed(($unsigned(wire0[(2'h3):(2'h2)]) + $unsigned($signed(wire1)))))
        begin
          reg7 <= wire2;
          reg8 <= $signed((($unsigned(wire2) * (wire5[(2'h2):(1'h0)] ^ reg7)) ?
              {{wire0[(3'h4):(2'h3)], (8'hb0)}, wire0} : ((^$signed(reg7)) ?
                  $unsigned(wire3[(5'h11):(4'ha)]) : ((wire2 ~^ wire1) ?
                      $signed((8'hae)) : {reg6, (8'h9e)}))));
          reg9 <= $unsigned({(wire5[(2'h2):(1'h0)] ? (~|(~wire3)) : wire0)});
        end
      else
        begin
          reg7 <= (~&reg8[(1'h0):(1'h0)]);
          reg8 <= ((~^(&$signed((wire3 ?
              reg8 : reg8)))) ^~ $signed($signed((reg7 ?
              (reg7 ? wire2 : reg8) : $unsigned(wire3)))));
          if ((^(8'ha9)))
            begin
              reg9 <= wire1;
            end
          else
            begin
              reg9 <= $signed(reg7);
            end
          reg10 <= wire1;
        end
    end
  assign wire11 = $unsigned(((reg6 ? $signed({wire2}) : reg9) ?
                      reg10 : reg10[(1'h0):(1'h0)]));
  assign wire12 = ((wire2[(4'hf):(4'h8)] <= $signed(reg6)) ?
                      ($unsigned((^(reg10 ? (8'ha1) : reg6))) ?
                          wire4[(3'h4):(1'h0)] : (-$unsigned($unsigned(wire2)))) : ((reg7[(4'h8):(2'h3)] ^ (reg10 ^ reg9)) ?
                          $signed($unsigned((wire11 ?
                              wire5 : reg7))) : (((&wire5) ?
                                  wire11[(2'h3):(2'h2)] : (&wire0)) ?
                              (((8'hb8) > (8'hbb)) >= ((8'hab) ?
                                  wire2 : (8'hb8))) : $unsigned(wire1[(3'h6):(2'h2)]))));
  assign wire13 = $signed($signed(reg7[(4'h8):(1'h1)]));
  always
    @(posedge clk) begin
      if (($signed($unsigned(wire13)) ^~ wire3))
        begin
          reg14 <= (~&(&$signed(reg7)));
          reg15 <= (8'hb6);
          reg16 <= wire3[(2'h2):(1'h0)];
        end
      else
        begin
          if ((+(wire11[(5'h12):(4'h8)] | ($unsigned((wire0 ?
              (8'ha0) : wire5)) || wire3))))
            begin
              reg14 <= (~^{$unsigned({$signed(reg7)}),
                  {(wire13[(2'h2):(1'h0)] ? $unsigned((8'hb8)) : (~|reg7)),
                      $unsigned($signed(wire0))}});
              reg15 <= (((8'hac) != $signed($unsigned((wire11 ?
                      (8'hbf) : reg14)))) ?
                  $unsigned(reg9) : $unsigned((^~$signed((reg7 == wire3)))));
              reg16 <= {$unsigned($unsigned(reg10))};
              reg17 <= wire2[(1'h1):(1'h0)];
            end
          else
            begin
              reg14 <= $signed((!(wire13[(1'h1):(1'h1)] ?
                  (7'h40) : (^~(reg7 && reg17)))));
              reg15 <= wire5[(2'h2):(2'h2)];
            end
          reg18 <= ($unsigned((wire2[(3'h5):(3'h5)] >= $unsigned($unsigned(reg16)))) - wire11);
          reg19 <= (reg14 > ((~&$signed(wire0[(1'h0):(1'h0)])) ?
              wire4 : reg18));
        end
    end
endmodule
