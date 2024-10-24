module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire4,
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
  assign wire4 = $signed($unsigned($signed(($signed(wire2) ?
                     $unsigned(wire1) : (wire1 <<< wire2)))));
  always
    @(posedge clk) begin
      reg5 <= $unsigned($unsigned(($signed(wire3) ?
          {(8'ha9), (8'ha8)} : $unsigned($signed(wire4)))));
      reg6 <= wire1[(3'h6):(2'h3)];
      reg7 <= ({((^(reg5 || wire2)) ?
              (((8'hb5) ? reg5 : reg6) ?
                  reg6 : $signed(reg6)) : $unsigned({wire3})),
          ($unsigned(wire1[(3'h5):(1'h0)]) - wire2)} <= wire0);
      if ((wire2[(4'h8):(2'h3)] > $signed($signed(((reg6 ?
          (8'hb3) : wire1) < $signed(wire2))))))
        begin
          reg8 <= (&$unsigned($signed((reg5[(3'h4):(1'h1)] * $signed(wire3)))));
          reg9 <= (reg7 - (^wire4[(3'h7):(1'h0)]));
          if ($unsigned({$signed(wire3)}))
            begin
              reg10 <= {((wire3[(2'h2):(1'h1)] ?
                      (~|reg8[(3'h5):(3'h4)]) : ((^~(8'hb6)) ~^ ((8'h9d) - (8'hb0)))) ^~ $signed($signed($signed(wire4)))),
                  (($unsigned(reg7[(4'h8):(3'h5)]) & (wire1[(1'h0):(1'h0)] & (wire1 ?
                      wire2 : reg8))) <= (!wire1[(4'h8):(1'h0)]))};
              reg11 <= {$signed((wire4 * $signed((reg10 && reg10))))};
              reg12 <= reg9;
              reg13 <= wire3;
            end
          else
            begin
              reg10 <= (~&((~|$unsigned((reg9 ? (8'hbf) : reg5))) ?
                  $signed((|((8'hb1) + reg13))) : (&{(reg11 ? (8'hbb) : reg8),
                      (reg13 == (8'hb3))})));
            end
          reg14 <= (reg7[(4'h8):(3'h6)] >>> $signed((reg6[(3'h7):(3'h4)] ^ wire1[(2'h2):(2'h2)])));
          reg15 <= (^~$unsigned((~|{(reg8 ? reg11 : reg9)})));
        end
      else
        begin
          reg8 <= reg12;
          reg9 <= reg14[(2'h2):(1'h0)];
          reg10 <= (!(~^(~{$signed(reg9), $signed((8'ha3))})));
          reg11 <= $signed(($signed({$unsigned(reg11),
              (reg9 ?
                  reg7 : wire2)}) <<< ($signed((~^reg15)) <= $signed($unsigned((8'hb0))))));
        end
    end
  assign wire16 = ((reg13[(3'h6):(2'h2)] <<< $unsigned($signed(reg7))) ?
                      ($unsigned((8'ha4)) ^~ {{$unsigned((8'hb9))},
                          reg13}) : wire3[(1'h0):(1'h0)]);
  assign wire17 = (((~|{$signed(reg13), $unsigned((8'ha1))}) ?
                          ((reg5 ? $unsigned((7'h42)) : $signed(reg5)) ?
                              ((~&reg11) > {wire16}) : $signed({reg8})) : {(((8'hbc) * (8'ha3)) <= ((8'hb4) > (8'h9e)))}) ?
                      (~&{reg5,
                          (reg11 ?
                              (~^reg12) : (reg5 ? (8'hb8) : reg9))}) : reg5);
  assign wire18 = reg15[(4'h8):(3'h7)];
  assign wire19 = (7'h43);
endmodule
