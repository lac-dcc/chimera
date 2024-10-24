module top
#(parameter param25 = ({(&{((8'h9c) <= (8'ha9)), ((8'ha0) ? (8'hb7) : (8'h9c))}), ((|((8'ha9) < (8'hbf))) ? (((8'ha0) ~^ (8'hba)) ? (~^(8'hbf)) : (^~(8'ha5))) : {((8'hb2) ? (8'hb1) : (8'haa)), (-(8'hbb))})} ? {(^~{{(8'hb2)}, ((8'h9d) != (7'h44))})} : (((((8'h9c) ? (8'hbb) : (8'hae)) | ((8'hb4) & (8'ha9))) == {((8'hbf) ? (8'ha8) : (8'ha4)), (!(8'hb5))}) & (~{{(7'h42), (8'haa)}}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = {(~&$signed($signed(((8'hbd) + wire0))))};
  assign wire6 = wire0[(2'h3):(2'h3)];
  assign wire7 = wire6[(4'he):(4'hc)];
  assign wire8 = wire3[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg9 <= (((8'ha5) && wire1[(2'h3):(2'h2)]) || (8'hb8));
      reg10 <= reg9[(4'h8):(2'h3)];
      if ($signed((wire5 | wire1)))
        begin
          if ((^wire7))
            begin
              reg11 <= ((($signed($unsigned((8'hb8))) ?
                      $signed({wire5, wire5}) : $unsigned((wire1 | (7'h40)))) ?
                  (~&wire4) : $unsigned(wire5[(1'h1):(1'h0)])) << wire4);
            end
          else
            begin
              reg11 <= ((^($signed($unsigned(wire1)) ?
                      wire7 : $unsigned(wire0))) ?
                  wire8[(2'h3):(2'h2)] : (&$signed($signed(wire4))));
              reg12 <= $signed($signed(wire3[(4'ha):(1'h1)]));
              reg13 <= $signed((wire6[(3'h4):(2'h2)] || (wire1[(3'h6):(3'h5)] | reg9[(4'h8):(1'h1)])));
              reg14 <= reg10[(1'h1):(1'h1)];
            end
          if ($signed((-(~|(!reg14)))))
            begin
              reg15 <= {($unsigned(((wire1 ? reg10 : reg11) ?
                          $unsigned(wire6) : $unsigned(reg9))) ?
                      (|($unsigned(wire7) == ((8'hb1) >>> reg10))) : $unsigned(reg12[(1'h0):(1'h0)])),
                  (^~(^$signed((wire8 ? reg13 : (8'h9f)))))};
            end
          else
            begin
              reg15 <= (+((~^(~^{wire6, reg13})) || {$signed(reg13)}));
            end
          reg16 <= (^~(($signed($unsigned((8'had))) ?
              (7'h40) : ((reg11 != wire3) >= $signed(reg15))) * wire2[(1'h0):(1'h0)]));
          reg17 <= $signed(wire0[(2'h2):(1'h0)]);
          reg18 <= (-$unsigned(reg13));
        end
      else
        begin
          reg11 <= reg18;
          reg12 <= (&($signed(((^reg16) ?
              {wire5, (8'ha1)} : ((7'h44) ?
                  reg17 : wire3))) >> $unsigned((~$signed(wire1)))));
          reg13 <= reg16[(1'h1):(1'h1)];
          reg14 <= (reg16 ?
              {(((-reg9) >= $signed(reg17)) ?
                      (reg10 ? $unsigned(wire3) : $unsigned(reg13)) : wire4),
                  wire1[(4'h9):(3'h5)]} : wire1[(3'h7):(2'h3)]);
          reg15 <= ($unsigned($unsigned(((~|reg18) ^ $unsigned(reg12)))) << (8'ha2));
        end
      reg19 <= {reg18[(3'h4):(3'h4)], $unsigned(wire2[(4'h8):(2'h3)])};
      reg20 <= reg15[(5'h11):(3'h5)];
    end
  assign wire21 = reg13;
  assign wire22 = (($signed(reg9) ?
                          reg17[(4'hf):(4'h9)] : {$unsigned($signed(wire7))}) ?
                      reg10 : (reg16 ?
                          {reg10[(2'h2):(1'h1)]} : $signed(wire0[(1'h1):(1'h0)])));
  assign wire23 = $signed($unsigned((reg10[(1'h1):(1'h1)] > (!(reg18 <<< reg16)))));
  assign wire24 = (8'hbc);
endmodule
