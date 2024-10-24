module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire18,
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
      reg4 <= {wire3[(4'h8):(4'h8)]};
      reg5 <= ($unsigned((($signed(wire2) ?
          $unsigned(wire3) : $unsigned(wire3)) <= ((wire1 + (8'ha3)) ?
          (~^reg4) : (wire1 && reg4)))) > reg4[(1'h1):(1'h0)]);
      if ({($signed(wire3[(2'h3):(2'h2)]) <<< reg5[(3'h5):(2'h2)]),
          $unsigned(($unsigned(reg4) | (wire0 | (~^wire1))))})
        begin
          if (wire2[(4'hb):(4'hb)])
            begin
              reg6 <= (8'ha1);
              reg7 <= $unsigned($signed(((reg5 < $signed(wire0)) ?
                  {((8'hba) == reg5)} : (+(-wire0)))));
              reg8 <= reg7[(1'h1):(1'h1)];
            end
          else
            begin
              reg6 <= (~|reg6[(3'h6):(2'h2)]);
              reg7 <= $unsigned($signed(($signed((&wire3)) ?
                  (~&{(8'ha4), reg5}) : (+$unsigned((8'ha5))))));
              reg8 <= $signed(({($signed(wire3) ?
                      (wire2 <= reg4) : $unsigned(reg5))} << $unsigned(reg5[(1'h1):(1'h1)])));
            end
          reg9 <= {{wire0, $unsigned(reg8[(2'h3):(1'h1)])}};
          reg10 <= $unsigned(wire3);
          reg11 <= {(($unsigned(wire1) ?
                      $unsigned(wire1[(1'h0):(1'h0)]) : (-reg6)) ?
                  (+reg5) : (wire1[(2'h2):(1'h0)] ?
                      (~^{reg4, (8'haa)}) : $signed($unsigned(reg9))))};
          reg12 <= {(reg8 ?
                  {($signed(reg9) <= $unsigned(wire3))} : ($signed((wire2 ?
                      (8'ha8) : (8'ha6))) ~^ wire2)),
              reg10[(1'h1):(1'h0)]};
        end
      else
        begin
          reg6 <= (($signed((wire0 | (reg7 - reg10))) << $unsigned($signed((^wire3)))) ?
              (&((^~$unsigned(wire2)) ?
                  (reg11 && wire3) : reg10)) : $unsigned((+{(^~wire0),
                  {reg12, (8'hbd)}})));
          reg7 <= $unsigned($signed((~&wire0[(1'h1):(1'h0)])));
          reg8 <= (!((-(reg8 ? {wire2, reg7} : $signed(reg10))) < ((((8'hb7) ?
              wire2 : reg8) <<< reg10) ~^ reg8)));
        end
      reg13 <= wire3[(4'ha):(3'h5)];
      reg14 <= reg9[(1'h0):(1'h0)];
    end
  assign wire15 = ($signed(wire2) * $signed(reg4));
  assign wire16 = ($signed($signed($signed(reg10))) ?
                      (^~$unsigned(((|reg8) >= reg4[(1'h1):(1'h0)]))) : ($signed(((~wire2) + ((8'hbb) | reg6))) == (reg14[(2'h3):(2'h3)] ~^ $unsigned($unsigned(wire15)))));
  assign wire17 = reg13[(3'h5):(2'h3)];
  assign wire18 = ((~(~&($signed(wire2) ? reg6 : $signed(reg5)))) << (((-{reg6,
                          (8'hb5)}) > (wire1 ? $signed((8'haf)) : reg7)) ?
                      (8'hb0) : wire15[(4'ha):(4'h9)]));
endmodule
