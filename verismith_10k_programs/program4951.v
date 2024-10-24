module top
#(parameter param22 = {(({((8'hbb) ? (8'ha5) : (8'had))} * (!((8'hb7) ? (8'h9f) : (8'hba)))) ? (~|(^~((8'hb7) ? (8'hb1) : (8'ha8)))) : (((~^(8'hb3)) - ((8'h9c) ~^ (8'hbe))) << {(-(8'ha9))}))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire10,
                 wire9,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3[(4'he):(4'hc)];
      reg6 <= wire1;
      reg7 <= $unsigned({wire2[(3'h7):(2'h3)]});
      reg8 <= (|$unsigned((~(wire3 >= $unsigned(wire1)))));
    end
  assign wire9 = $unsigned(((^~(~&reg5)) ? (~^reg8) : {wire2}));
  assign wire10 = ({(^wire1)} ? wire9 : $unsigned($unsigned(reg5)));
  always
    @(posedge clk) begin
      if ($unsigned(wire4))
        begin
          reg11 <= {$unsigned(($signed($unsigned(wire2)) >>> $signed(wire4)))};
          reg12 <= $unsigned(($unsigned($signed({wire1, wire10})) ?
              $unsigned(($signed(wire3) | wire10[(1'h0):(1'h0)])) : (~({wire9,
                      (8'h9e)} ?
                  (wire3 ? (8'ha1) : wire10) : $signed(wire0)))));
          if (((&wire10) >= (8'hae)))
            begin
              reg13 <= reg8[(5'h10):(4'he)];
              reg14 <= $unsigned((8'ha2));
              reg15 <= ((((&wire1) ^~ ($signed(reg14) >> $signed(reg6))) ?
                  $unsigned(({wire1, reg12} ?
                      wire10 : (^~reg7))) : wire1) == ((!(!reg13)) == reg12));
              reg16 <= (wire3 ?
                  $unsigned(reg15[(1'h0):(1'h0)]) : ({(^(wire9 ?
                          reg8 : reg15))} - $signed($unsigned($unsigned(reg8)))));
              reg17 <= $unsigned(reg7);
            end
          else
            begin
              reg13 <= wire4;
              reg14 <= ($signed(reg13) < (^~((reg8 | ((8'hbb) ?
                  reg14 : reg17)) << $signed($signed(wire3)))));
              reg15 <= reg11[(2'h3):(1'h1)];
              reg16 <= ($signed($unsigned($unsigned((reg8 || reg15)))) - wire1[(3'h4):(2'h2)]);
            end
          reg18 <= (reg13 ? wire10 : (^(-$unsigned(wire1))));
          reg19 <= $unsigned($signed(reg18[(4'h8):(3'h6)]));
        end
      else
        begin
          reg11 <= $signed((reg17 ?
              (reg7 >>> (~^(reg11 > wire0))) : (&{$unsigned(reg7)})));
          reg12 <= $unsigned({reg14[(1'h0):(1'h0)], ((7'h42) * reg12)});
          reg13 <= $unsigned($signed($signed((~reg7))));
        end
      reg20 <= (reg8 ?
          $signed($unsigned((&(reg12 ?
              (8'hbe) : reg8)))) : wire9[(3'h5):(1'h0)]);
      reg21 <= $unsigned(reg18[(4'h9):(3'h5)]);
    end
endmodule
