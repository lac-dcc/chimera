module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire22,
                 wire21,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg20,
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
      if ({(^~{$signed(wire4[(1'h0):(1'h0)])})})
        begin
          reg5 <= ((wire0[(1'h1):(1'h0)] ^ wire3) >= (wire2 ?
              (~&($unsigned((8'hbe)) ^ (wire3 ?
                  wire4 : (8'hae)))) : (+(~&(|(8'ha3))))));
          reg6 <= $unsigned({reg5[(3'h4):(1'h1)], reg5});
          reg7 <= $unsigned(reg6);
          if ((+(~|(+wire3[(1'h0):(1'h0)]))))
            begin
              reg8 <= wire4;
            end
          else
            begin
              reg8 <= (wire1[(4'h9):(1'h0)] ~^ $unsigned(reg7[(2'h3):(1'h0)]));
              reg9 <= reg7[(2'h3):(2'h3)];
              reg10 <= wire0[(3'h4):(2'h2)];
              reg11 <= $signed({(^reg8)});
              reg12 <= ({{$unsigned((reg8 ? wire3 : reg11)),
                      (~^$signed(wire1))}} < {$signed(wire4[(3'h4):(2'h2)])});
            end
          reg13 <= ($signed(reg5) ? reg7 : wire3);
        end
      else
        begin
          if ((+$unsigned(reg13)))
            begin
              reg5 <= $unsigned((8'hb9));
              reg6 <= $signed((!((~|{wire3, (8'hb8)}) ?
                  wire1[(4'h8):(2'h3)] : $signed({wire0, wire1}))));
              reg7 <= (~(~|$unsigned(({reg9} <<< $signed(reg10)))));
              reg8 <= (^~(|wire1));
              reg9 <= reg6;
            end
          else
            begin
              reg5 <= {({((reg5 - reg8) ^~ {reg5})} ?
                      {wire0, wire2} : (~^wire4[(1'h0):(1'h0)])),
                  (~&(^~$signed((reg6 * wire3))))};
              reg6 <= wire1[(4'h8):(3'h6)];
              reg7 <= wire4;
              reg8 <= $unsigned(reg7[(1'h0):(1'h0)]);
              reg9 <= reg11[(1'h1):(1'h0)];
            end
        end
    end
  assign wire14 = (wire4[(1'h0):(1'h0)] ?
                      $unsigned($unsigned($signed((reg9 ?
                          wire3 : wire1)))) : wire4);
  assign wire15 = $signed((|reg11));
  assign wire16 = ($signed($signed(((+reg8) ?
                          (reg9 ? (8'haa) : (8'hb2)) : (|wire2)))) ?
                      reg7 : (^((wire1 ?
                              wire4[(3'h4):(3'h4)] : (reg12 > reg9)) ?
                          {(wire15 ? wire1 : wire4),
                              reg12[(2'h2):(2'h2)]} : reg5[(1'h1):(1'h0)])));
  assign wire17 = reg10;
  assign wire18 = ({{wire0[(1'h0):(1'h0)]},
                          (((wire17 ?
                              wire15 : wire17) - ((7'h43) > wire15)) >> wire4)} ?
                      {($signed($signed(reg5)) - $signed(wire4))} : {$signed(reg11),
                          ($unsigned($signed(wire3)) ?
                              (~|(reg8 ? reg9 : wire4)) : ((~reg13) ?
                                  $signed(reg8) : (wire0 ? (8'had) : reg7)))});
  assign wire19 = $unsigned($signed({wire2}));
  always
    @(posedge clk) begin
      reg20 <= $signed(reg13[(4'hd):(3'h5)]);
    end
  assign wire21 = $signed({$unsigned((reg5 ? $unsigned(wire15) : reg6))});
  assign wire22 = ((^~({reg10, (wire18 ? wire4 : (8'h9e))} ?
                      ($signed((8'ha9)) > wire14) : (reg7 <<< reg20[(5'h10):(4'h8)]))) == $signed(reg8));
  always
    @(posedge clk) begin
      reg23 <= reg10;
      reg24 <= reg9;
      reg25 <= ((&($signed(reg8) ? $signed({(7'h42)}) : (8'hb9))) ?
          $unsigned((wire16[(3'h6):(1'h0)] ?
              $signed($unsigned(reg6)) : $unsigned(((8'hb7) | reg24)))) : (~&(7'h43)));
      reg26 <= {(wire15[(4'h8):(3'h7)] != $unsigned($signed(reg12)))};
      reg27 <= reg10[(2'h2):(1'h1)];
    end
  assign wire28 = $signed(wire4);
  assign wire29 = (&reg9);
  assign wire30 = {{$unsigned({wire28[(2'h3):(2'h2)]})}};
endmodule
