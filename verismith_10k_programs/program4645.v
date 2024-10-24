module top
#(parameter param41 = ((-{({(8'h9d), (8'h9f)} ^ ((8'hba) <= (8'haf))), ({(7'h40), (7'h44)} ? (~^(8'hb0)) : ((7'h41) ^~ (8'hb3)))}) ? (((|((8'haa) ? (8'hb7) : (8'hb0))) ? (((8'hba) ? (8'hbc) : (8'hb0)) >> ((8'h9c) << (8'hbf))) : (((8'hac) ? (7'h41) : (8'h9d)) ? ((8'ha7) != (8'hb5)) : ((8'hba) == (8'hb0)))) >> (-(!((7'h43) + (8'hac))))) : (~(+((8'hac) <<< ((7'h41) ? (8'hb3) : (8'hbc)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire38;
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire40,
                 wire24,
                 wire38,
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
  always
    @(posedge clk) begin
      reg5 <= (wire3[(3'h4):(1'h1)] ? (7'h42) : wire4);
      if (((+$unsigned(((wire0 ?
          wire2 : wire0) * (^reg5)))) <= wire2[(3'h7):(3'h7)]))
        begin
          if ({$signed($signed({(wire4 * wire2), wire1})),
              ($signed(({wire4, wire1} ?
                      wire3[(3'h4):(1'h0)] : wire0[(1'h1):(1'h0)])) ?
                  wire0[(4'hf):(4'he)] : reg5)})
            begin
              reg6 <= reg5[(1'h0):(1'h0)];
              reg7 <= (reg6[(2'h3):(2'h3)] ?
                  ((((~^wire0) * reg6[(3'h4):(2'h3)]) < wire1[(3'h7):(2'h3)]) > wire4[(2'h3):(1'h1)]) : {(reg6 * wire3[(3'h4):(2'h3)])});
              reg8 <= (wire2[(2'h3):(1'h0)] ~^ ($unsigned(wire2[(3'h6):(3'h4)]) <<< $signed(({wire4} ?
                  (wire3 >>> (8'hb1)) : {reg6, wire2}))));
            end
          else
            begin
              reg6 <= ({wire2[(4'h9):(3'h5)]} ?
                  $unsigned((^{$signed(wire3)})) : wire3);
              reg7 <= reg8[(3'h6):(3'h5)];
              reg8 <= $unsigned(((~$unsigned(((8'ha0) >> reg7))) == $signed((~|$signed(wire1)))));
              reg9 <= ((+({(wire2 <= wire1)} ? reg8[(2'h3):(1'h0)] : wire3)) ?
                  (reg5[(1'h0):(1'h0)] ?
                      $unsigned((~&wire4[(1'h1):(1'h0)])) : $unsigned($unsigned({wire2,
                          (8'ha6)}))) : $unsigned($unsigned(reg7[(3'h5):(2'h3)])));
              reg10 <= {reg5};
            end
        end
      else
        begin
          if ($unsigned({$signed(reg7[(4'hd):(3'h6)])}))
            begin
              reg6 <= ({(reg7[(1'h1):(1'h0)] ?
                          ((reg10 + wire3) ?
                              (~(8'ha3)) : (&reg7)) : (((8'ha0) ^~ wire3) ?
                              $unsigned(reg10) : reg7[(4'hc):(4'hb)])),
                      (({wire4} > {reg10, wire1}) || $signed(wire3))} ?
                  (reg6 + $signed(wire2[(4'h9):(1'h1)])) : reg8);
              reg7 <= (((~&$unsigned(reg8)) ?
                      $unsigned((+$unsigned(reg5))) : wire3) ?
                  (!(wire0[(1'h0):(1'h0)] ?
                      wire3 : $unsigned(wire1[(4'hf):(2'h3)]))) : (((wire3[(1'h1):(1'h0)] ?
                      reg5 : $signed(reg7)) ^~ reg5[(2'h2):(2'h2)]) >= $signed($unsigned(wire0))));
              reg8 <= ((~|$unsigned(((reg7 + reg5) ?
                      (wire0 ? reg6 : reg7) : $unsigned((8'hbb))))) ?
                  wire0 : ({$signed((~reg10)),
                          $unsigned((reg9 ? reg6 : reg10))} ?
                      (wire1[(4'hc):(3'h4)] || reg7[(4'h9):(4'h9)]) : wire4[(1'h1):(1'h1)]));
            end
          else
            begin
              reg6 <= ($unsigned((8'hae)) | {($signed(reg10[(5'h12):(5'h12)]) ?
                      $unsigned({reg8, wire2}) : $unsigned((reg5 ?
                          reg6 : (8'hbc))))});
            end
          reg9 <= {(8'hb3)};
          if ((wire4[(1'h1):(1'h0)] >> $signed(reg9)))
            begin
              reg10 <= reg9[(1'h1):(1'h1)];
              reg11 <= (wire3[(2'h2):(1'h1)] >> (^($signed($unsigned(wire3)) - $unsigned(reg5[(1'h1):(1'h0)]))));
              reg12 <= (((!(~^wire2[(2'h2):(2'h2)])) < $unsigned(wire4[(2'h2):(1'h1)])) <= $unsigned(((~&((8'hbf) + wire3)) ?
                  wire3 : (reg11 ? (wire2 << reg11) : $signed(wire1)))));
            end
          else
            begin
              reg10 <= reg7[(4'h9):(1'h1)];
              reg11 <= (~^{reg7[(4'h8):(3'h7)], (8'hb7)});
              reg12 <= reg9;
              reg13 <= reg12[(1'h1):(1'h0)];
            end
          if (wire2)
            begin
              reg14 <= ($signed(((8'hb3) < $unsigned($unsigned((8'hb3))))) ~^ wire2);
            end
          else
            begin
              reg14 <= (~reg5);
              reg15 <= ({reg6[(3'h7):(3'h4)]} ?
                  wire4 : $signed(((reg10[(1'h0):(1'h0)] ?
                      {reg12} : (wire0 < reg13)) == $unsigned($unsigned(reg14)))));
              reg16 <= wire2[(4'ha):(2'h2)];
              reg17 <= reg14[(1'h1):(1'h0)];
              reg18 <= wire1[(3'h7):(1'h0)];
            end
          if (reg14[(2'h2):(2'h2)])
            begin
              reg19 <= $signed(reg10);
              reg20 <= $signed((reg13 && $unsigned($signed($unsigned(reg9)))));
              reg21 <= (reg17[(1'h0):(1'h0)] ?
                  $unsigned(reg9[(1'h1):(1'h1)]) : reg5[(1'h1):(1'h0)]);
              reg22 <= {reg16, (^~(~((wire0 * reg16) ? (~(7'h44)) : reg8)))};
            end
          else
            begin
              reg19 <= ($signed((reg13[(2'h2):(1'h1)] ?
                  reg7[(4'hd):(2'h3)] : ($unsigned(reg11) << (~(8'hb7))))) > (^(wire2 && (|((8'hb4) || reg11)))));
              reg20 <= reg20;
              reg21 <= reg15[(2'h2):(1'h0)];
              reg22 <= (reg15[(2'h2):(1'h0)] < reg10[(4'ha):(3'h5)]);
            end
        end
      reg23 <= $unsigned(($unsigned(reg5) >= $signed((reg20 >= ((8'ha5) ?
          (8'hb1) : (8'hb4))))));
    end
  assign wire24 = {reg12[(2'h2):(1'h0)]};
  module25 #() modinst39 (wire38, clk, reg15, reg5, wire1, reg7, reg6);
  assign wire40 = (($unsigned(wire0) != {({reg19, reg18} <= wire3)}) | wire4);
endmodule

module module25
#(parameter param36 = (8'ha9), 
parameter param37 = (7'h44))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(3'h6):(1'h0)] wire28;
  input wire [(5'h12):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  assign y = {wire35, wire34, wire33, wire32, wire31, (1'h0)};
  assign wire31 = $signed(wire26);
  assign wire32 = $signed({(~|((8'ha5) <<< wire28[(2'h3):(1'h0)]))});
  assign wire33 = wire29[(3'h5):(2'h3)];
  assign wire34 = (&wire27);
  assign wire35 = $unsigned((((wire26 != wire26) && ({wire33} || wire27[(4'hc):(4'hc)])) ?
                      (8'h9d) : (((wire28 <<< wire26) != (wire28 >= wire27)) > ({wire34,
                          wire27} <<< (wire27 >> (8'hb0))))));
endmodule
