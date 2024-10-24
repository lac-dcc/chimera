module top
#(parameter param20 = {(^~({((8'haf) != (8'hb0)), ((8'h9e) != (8'hbb))} != {((7'h43) ? (8'hba) : (8'haa)), {(8'hb1), (8'ha4)}})), (~((((8'h9d) ? (8'hb2) : (8'h9f)) >>> ((8'hb5) ^ (8'had))) > (((8'ha2) ? (8'hb6) : (8'hba)) ? ((8'ha7) ? (8'hbf) : (8'hab)) : ((7'h40) > (8'hac)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire15;
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  reg [(3'h6):(1'h0)] reg4 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire15,
                 reg16,
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
      if ($signed(wire1))
        begin
          reg4 <= $signed((wire0[(3'h6):(3'h5)] ?
              $unsigned($unsigned($unsigned(wire3))) : $signed($signed({wire0,
                  wire3}))));
          reg5 <= (+(!(($unsigned(wire2) <<< ((8'hbd) ?
              wire3 : (8'ha4))) > wire2[(5'h10):(4'hb)])));
          reg6 <= (reg5[(3'h6):(1'h0)] ?
              {((!$unsigned(wire3)) ?
                      $unsigned((8'hb1)) : $unsigned({reg5,
                          (8'h9c)}))} : $signed(($signed((wire3 && reg4)) >> reg5[(1'h1):(1'h1)])));
        end
      else
        begin
          reg4 <= (wire0 * ($signed((~reg5[(3'h6):(1'h0)])) >>> reg6));
          if ({(^{$unsigned((reg6 ? (8'hb3) : reg4)),
                  $unsigned(wire3[(2'h2):(1'h0)])})})
            begin
              reg5 <= $signed((wire1[(4'ha):(2'h2)] ^ ((wire2 ?
                  (~&reg4) : $unsigned((8'ha1))) <<< $unsigned((wire0 && wire3)))));
              reg6 <= $signed(reg4[(3'h5):(2'h3)]);
              reg7 <= wire1;
              reg8 <= ((({{wire1, reg5},
                          (wire2 ? reg6 : reg4)} | $signed($signed((8'hb2)))) ?
                      $signed($signed((reg5 <= reg7))) : ((8'ha4) && reg6[(3'h7):(3'h4)])) ?
                  wire3 : $unsigned($unsigned(wire1)));
              reg9 <= ($signed($signed($unsigned($unsigned(reg4)))) && wire1[(2'h2):(1'h1)]);
            end
          else
            begin
              reg5 <= ((~^wire2) ?
                  reg4[(1'h1):(1'h0)] : (|{reg9[(3'h7):(1'h0)]}));
              reg6 <= wire3[(1'h0):(1'h0)];
              reg7 <= ({(($unsigned(wire3) ?
                          $unsigned(wire3) : (wire2 <= reg7)) ?
                      reg6[(4'he):(3'h4)] : reg4),
                  $signed(wire1[(4'ha):(1'h1)])} == (~(wire3[(4'hf):(4'hd)] <= $unsigned(reg9))));
            end
        end
      reg10 <= $signed($unsigned((reg8[(3'h5):(3'h5)] ?
          {(-(8'hba))} : reg9[(3'h4):(2'h3)])));
      if (wire2[(5'h10):(4'ha)])
        begin
          reg11 <= {(wire0[(2'h2):(1'h0)] ^~ wire3), wire0};
          reg12 <= (~&(+wire2));
        end
      else
        begin
          reg11 <= (reg12[(2'h2):(1'h1)] ^~ $unsigned(($signed({reg10,
              reg6}) >>> {wire3})));
          reg12 <= wire0[(1'h1):(1'h1)];
          reg13 <= (((~$unsigned((wire2 && reg12))) && wire0) - (^~reg5));
        end
      reg14 <= {(8'hb8), ($unsigned($unsigned(reg5)) ? {reg12} : reg6)};
    end
  assign wire15 = $unsigned((($unsigned((~&reg12)) ?
                          reg14 : (+wire1[(4'ha):(1'h1)])) ?
                      ((reg8 & (8'hb3)) ?
                          (reg8[(2'h2):(2'h2)] ?
                              $signed((8'ha6)) : (reg4 ?
                                  reg11 : (8'ha0))) : $signed(wire1[(1'h1):(1'h1)])) : reg9));
  always
    @(posedge clk) begin
      reg16 <= (($signed(($signed(reg13) & (wire1 ? reg13 : reg12))) ?
              reg5[(1'h0):(1'h0)] : (($unsigned(reg4) ?
                  (^~reg4) : reg7) >> wire15)) ?
          $signed($unsigned($signed(((8'hb0) ? reg14 : wire1)))) : (~|(({reg6,
                  reg8} >>> reg10[(3'h7):(1'h1)]) ?
              ($signed(wire3) ^ $signed(wire1)) : ((~reg12) << (reg10 != wire1)))));
    end
  assign wire17 = (~reg4);
  assign wire18 = (^~$signed(wire0));
  assign wire19 = $unsigned($unsigned((^((8'h9c) ?
                      (wire18 ? reg14 : wire1) : {reg10, reg5}))));
endmodule
