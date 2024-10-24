module top
#(parameter param22 = ((((|((8'hb9) ? (8'hb4) : (8'hb9))) ? (~((8'hb8) ? (8'ha7) : (8'hae))) : (~^{(7'h43)})) ? ({((8'ha5) & (8'hbf)), (|(8'ha3))} ? (+{(8'ha5), (8'haf)}) : {(~^(8'hbb))}) : (!(^~{(8'ha8)}))) ? (~&((((8'hb5) < (8'ha1)) - {(8'ha5), (8'hbe)}) == (~^((8'ha6) >= (8'hb7))))) : ((~^(!((8'haf) >> (8'hb9)))) + (~{((8'hb0) ~^ (8'ha2)), (^(8'hb1))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire21,
                 wire17,
                 wire16,
                 wire5,
                 wire4,
                 reg20,
                 reg19,
                 reg18,
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
  assign wire4 = ((!wire1[(4'h9):(3'h4)]) << {(((wire3 & wire2) << $signed((8'hb5))) ~^ (wire1[(4'hb):(3'h4)] << $unsigned(wire0))),
                     ($signed($unsigned(wire2)) ?
                         (~wire1) : $signed((wire3 ? wire2 : wire0)))});
  assign wire5 = ($signed((wire2[(3'h4):(1'h0)] ?
                     (~^(wire2 ~^ (8'hb3))) : (^~{wire1}))) + ((|(|$unsigned(wire2))) ?
                     wire2[(2'h3):(1'h1)] : $signed({(wire2 && wire2),
                         (wire3 ^~ wire2)})));
  always
    @(posedge clk) begin
      if ($signed(((^~wire2) ?
          $signed({$unsigned(wire5),
              (wire1 ?
                  wire2 : (7'h44))}) : $unsigned($signed((wire0 >= wire1))))))
        begin
          reg6 <= $signed(((wire5 ? wire4 : wire5) && wire0));
          reg7 <= $unsigned(wire0);
          if (wire5)
            begin
              reg8 <= {reg7[(3'h4):(2'h3)]};
              reg9 <= {wire4[(1'h1):(1'h1)], (~&reg7[(2'h2):(1'h1)])};
            end
          else
            begin
              reg8 <= {($signed(reg9[(1'h0):(1'h0)]) ?
                      $unsigned((!(wire3 * wire2))) : {({wire5} ^~ ((8'hbd) ?
                              (8'ha3) : wire5)),
                          ((reg9 ? wire5 : wire4) ^~ (^~reg9))}),
                  wire2};
            end
          reg10 <= (~&(~|wire3));
        end
      else
        begin
          reg6 <= reg10;
          reg7 <= ((|((reg6[(2'h2):(1'h1)] ?
              reg6[(4'hc):(4'h9)] : $signed((8'hbc))) || (wire5[(1'h1):(1'h0)] ?
              $signed(reg6) : $unsigned(reg7)))) + reg8);
          if ($signed(($signed((7'h40)) * $signed($unsigned((|wire3))))))
            begin
              reg8 <= (~|wire3[(5'h11):(4'hc)]);
              reg9 <= (($signed((((8'h9c) ? reg7 : wire0) ?
                      $unsigned(wire4) : ((8'haf) ?
                          reg6 : (7'h44)))) * (reg10[(2'h3):(2'h3)] ~^ (wire5[(2'h2):(1'h1)] ?
                      $signed(wire5) : reg10))) ?
                  reg7[(1'h0):(1'h0)] : ({wire5[(1'h0):(1'h0)],
                          ((|wire2) <= wire1[(4'h9):(2'h2)])} ?
                      $unsigned((wire5[(3'h7):(3'h4)] && (8'hb5))) : ((8'ha2) < wire0[(2'h2):(1'h0)])));
              reg10 <= (!wire0[(1'h1):(1'h0)]);
            end
          else
            begin
              reg8 <= $unsigned((!reg10));
            end
          reg11 <= (8'h9c);
          if (wire0)
            begin
              reg12 <= $signed(reg9[(2'h2):(1'h1)]);
            end
          else
            begin
              reg12 <= $unsigned((&$signed(wire4[(3'h6):(1'h0)])));
            end
        end
      reg13 <= (7'h43);
      reg14 <= wire3[(2'h3):(2'h3)];
      reg15 <= (!reg8[(4'hb):(4'h9)]);
    end
  assign wire16 = (wire3[(5'h10):(3'h4)] != (($unsigned(reg15[(5'h10):(2'h3)]) && ({wire5} ?
                          reg15 : (wire2 ? reg14 : reg12))) ?
                      $unsigned((~^(^reg14))) : {wire2[(3'h6):(3'h5)]}));
  assign wire17 = {reg14[(3'h6):(3'h6)], (-wire5[(3'h7):(3'h6)])};
  always
    @(posedge clk) begin
      reg18 <= ((($unsigned(wire2[(3'h4):(1'h1)]) ?
                  ((~^reg6) ? reg11 : $signed(reg6)) : wire1[(2'h3):(1'h1)]) ?
              (^~$signed(reg13)) : (reg12 ?
                  reg8[(5'h11):(4'hb)] : (reg11[(2'h3):(1'h0)] == wire16))) ?
          wire3 : $unsigned((8'haf)));
      reg19 <= (((^wire1) ?
          $unsigned(reg18[(1'h1):(1'h1)]) : wire4[(3'h6):(1'h0)]) >= wire4);
      reg20 <= wire3[(5'h10):(1'h1)];
    end
  assign wire21 = ((({reg15} ?
                      $signed($signed(wire4)) : reg8) ^ ({$unsigned(wire16),
                      $signed(reg13)} & $signed(wire2[(3'h6):(1'h0)]))) ^ (wire0[(1'h0):(1'h0)] ?
                      $unsigned($unsigned(wire2)) : ($signed(wire4[(2'h3):(2'h3)]) ~^ wire0)));
endmodule
