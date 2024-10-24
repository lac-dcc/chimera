module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire15;
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  assign y = {wire45,
                 wire43,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg47,
                 reg46,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed(wire0[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire3))
        begin
          reg6 <= {(~({$signed(wire4)} || $signed(wire0[(2'h3):(2'h2)]))),
              (reg5 || (((8'hb9) ?
                  $signed((8'hbb)) : (wire0 <<< (8'hb1))) & (!(wire0 << wire1))))};
          reg7 <= (wire1[(1'h0):(1'h0)] & $unsigned(wire3));
          reg8 <= $signed(((~|((8'hae) ?
                  ((8'haf) ? wire1 : wire0) : reg5[(1'h1):(1'h0)])) ?
              reg7 : ((~|reg7[(2'h3):(2'h2)]) < reg5)));
        end
      else
        begin
          reg6 <= wire3;
          if (reg7)
            begin
              reg7 <= wire2;
              reg8 <= reg6;
              reg9 <= $signed($signed({$unsigned((wire4 ? reg7 : wire4)),
                  {(wire4 - wire3)}}));
            end
          else
            begin
              reg7 <= ((-($unsigned($signed(reg7)) > reg5)) ?
                  $signed(wire4[(4'h9):(4'h8)]) : reg7[(2'h2):(2'h2)]);
              reg8 <= wire1;
              reg9 <= {{($unsigned(reg8) ?
                          $unsigned((reg6 ?
                              reg5 : wire4)) : reg7[(1'h1):(1'h0)]),
                      (~reg8)}};
            end
          reg10 <= $signed({({reg6} + {$signed((8'ha2)), reg7[(1'h1):(1'h0)]}),
              ({(reg7 ? reg9 : wire0), (reg6 ? wire3 : (8'hac))} ?
                  ($signed(reg9) ?
                      $signed((8'ha2)) : (reg5 ?
                          (8'ha6) : (8'hb2))) : wire1[(3'h7):(3'h6)])});
          reg11 <= (-(wire0 + ($unsigned($signed(reg5)) | $signed($signed(reg5)))));
        end
      reg12 <= wire3[(4'hb):(1'h1)];
      reg13 <= wire4[(3'h7):(3'h5)];
      reg14 <= reg13;
    end
  assign wire15 = $signed($signed((8'hbd)));
  assign wire16 = (^($unsigned($signed($signed(reg12))) ?
                      $signed((^~(~^reg7))) : reg5[(1'h1):(1'h1)]));
  assign wire17 = (|$signed($unsigned($signed(reg13[(4'hd):(3'h4)]))));
  assign wire18 = $unsigned((^(({reg7} || (|reg14)) & (-(wire3 < wire0)))));
  assign wire19 = $unsigned($unsigned($unsigned(wire3)));
  assign wire20 = reg12[(5'h11):(1'h1)];
  assign wire21 = reg5[(3'h5):(2'h3)];
  assign wire22 = wire4;
  assign wire23 = reg8[(3'h4):(1'h0)];
  module24 #() modinst44 (.wire26(reg13), .clk(clk), .wire29(wire16), .wire25(wire20), .wire27(wire0), .y(wire43), .wire28(wire3));
  assign wire45 = $unsigned(({wire16[(1'h0):(1'h0)],
                      $unsigned((+wire43))} >>> $signed(((8'hbd) ?
                      (reg7 ? wire16 : wire22) : wire23))));
  always
    @(posedge clk) begin
      reg46 <= ($unsigned(wire19) ?
          reg6[(3'h4):(3'h4)] : (wire1[(4'he):(4'hd)] <= $signed({(8'ha9),
              $signed(reg11)})));
      reg47 <= (~&(8'h9d));
    end
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire [(4'he):(1'h0)] wire28;
  input wire [(4'hf):(1'h0)] wire27;
  input wire signed [(4'hb):(1'h0)] wire26;
  input wire [(4'he):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg38,
                 reg37,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg30 <= wire27[(1'h0):(1'h0)];
      reg31 <= (8'hbe);
      reg32 <= $unsigned($signed(($signed(reg30[(4'hb):(4'h9)]) >>> ({(8'ha3),
              reg31} ?
          (8'ha9) : (reg31 >= wire28)))));
    end
  assign wire33 = $unsigned(wire28);
  assign wire34 = wire29;
  assign wire35 = $signed($signed(($signed($signed(reg30)) ?
                      reg31 : $unsigned(wire27[(3'h5):(2'h3)]))));
  assign wire36 = (wire34 ?
                      ($signed((|{wire29, (7'h41)})) ?
                          ($signed((wire27 < wire27)) ?
                              $signed((wire25 >= wire35)) : ((wire34 ?
                                  reg32 : wire33) & (-wire28))) : ({(wire25 ?
                                  wire33 : wire26)} ^ $signed($unsigned(wire25)))) : reg30);
  always
    @(posedge clk) begin
      reg37 <= $signed($signed(wire36[(4'he):(3'h4)]));
      reg38 <= $signed((&({(wire36 ? reg30 : (8'hbc))} ?
          wire33 : wire29[(2'h2):(1'h0)])));
    end
  assign wire39 = ((~|$signed($unsigned(wire36[(2'h3):(1'h1)]))) ?
                      $unsigned(wire34[(2'h3):(1'h0)]) : (+((^$signed(reg30)) < ($unsigned((8'hac)) != reg30))));
  assign wire40 = (!{reg31, (~|$signed(reg31[(1'h0):(1'h0)]))});
  assign wire41 = $signed((-wire34[(4'hf):(4'hf)]));
  assign wire42 = reg37;
endmodule
