module top
#(parameter param20 = ({{(((8'ha0) ? (8'ha8) : (8'hbe)) ^~ ((8'ha7) != (8'ha5)))}} ^~ (8'hb1)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg4 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2;
      reg5 <= {$unsigned({{$unsigned(wire1), wire2[(4'hd):(3'h5)]}})};
      reg6 <= ($unsigned($signed(reg5)) <<< wire2);
      reg7 <= ($unsigned(wire1[(3'h7):(1'h1)]) ?
          (~^(-$signed($signed(wire0)))) : reg6[(4'hb):(4'h9)]);
    end
  always
    @(posedge clk) begin
      reg8 <= ((-$unsigned(wire1)) <<< $unsigned((8'hb1)));
      if ($signed((reg6[(4'h8):(3'h6)] << ((8'ha2) < (&$unsigned(reg7))))))
        begin
          reg9 <= reg6[(4'hc):(3'h4)];
          if ((-(+($signed($unsigned((8'hb2))) ?
              wire1[(3'h7):(3'h6)] : $signed(wire0)))))
            begin
              reg10 <= (^(((~wire0[(2'h3):(2'h3)]) ?
                      reg7 : {$unsigned(reg8), (^reg6)}) ?
                  wire1[(1'h1):(1'h0)] : (reg5[(4'h9):(2'h3)] ?
                      ($signed(wire1) ^~ (^(8'hb8))) : $unsigned((wire2 ?
                          reg6 : wire3)))));
              reg11 <= {($signed(reg9) ?
                      (wire0 ?
                          (reg4 ?
                              (reg4 ?
                                  (8'hb9) : (8'ha5)) : $unsigned(reg8)) : reg6) : {{wire1[(4'h8):(2'h2)]},
                          reg10[(4'hc):(2'h3)]}),
                  ((!(~^$unsigned((8'hb7)))) ~^ (^~((reg9 & (8'hbf)) ?
                      $unsigned(reg6) : ((8'hb0) ? reg9 : wire2))))};
            end
          else
            begin
              reg10 <= reg10;
              reg11 <= (reg8 ?
                  wire2 : $unsigned($unsigned(($unsigned(wire2) >> $signed(reg7)))));
              reg12 <= (((&$signed(reg7[(1'h1):(1'h1)])) == (reg10[(4'h8):(4'h8)] >> $unsigned((&(8'hb7))))) ?
                  $unsigned({$signed({reg9, (8'hb5)}),
                      (reg6[(3'h7):(2'h3)] ?
                          $signed(reg7) : (reg11 >>> reg7))}) : (~&$unsigned($signed((wire1 ?
                      reg9 : (8'ha4))))));
            end
        end
      else
        begin
          reg9 <= (|(+(~&$signed(reg7))));
        end
      reg13 <= (8'hae);
      reg14 <= ($signed($signed(($signed(reg11) ?
          (~&reg5) : {reg5}))) && reg13);
    end
  assign wire15 = $unsigned(reg10);
  assign wire16 = $unsigned($unsigned(wire0));
  assign wire17 = (wire15 ? (wire16 - (&(~&$signed(wire2)))) : $signed(reg8));
  assign wire18 = (^~((-{$unsigned((7'h43))}) >> wire3[(4'h9):(2'h2)]));
  assign wire19 = (reg8 ?
                      (wire15[(4'hf):(3'h7)] ?
                          $unsigned(wire3) : $unsigned(($signed(wire17) ?
                              $unsigned(reg10) : (8'ha5)))) : (~^reg13));
endmodule
