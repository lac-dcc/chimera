module top #(parameter param37 = (8'h9c)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
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
      reg4 <= $unsigned((wire1[(1'h0):(1'h0)] ?
          $signed($signed($unsigned(wire1))) : ($signed($unsigned(wire2)) <<< $unsigned({(7'h41)}))));
      reg5 <= wire1[(3'h5):(3'h4)];
      reg6 <= {wire1};
      reg7 <= $signed((&$signed((+(reg4 ? wire0 : wire2)))));
    end
  always
    @(posedge clk) begin
      reg8 <= reg6;
      if ((wire1[(3'h5):(3'h5)] | (reg5 && {wire2, (&(reg7 << reg4))})))
        begin
          reg9 <= $signed(wire3);
          reg10 <= (~($unsigned((wire3 || $unsigned(wire1))) ?
              $signed($signed(((8'ha0) ^ (8'h9c)))) : wire2[(4'hc):(4'ha)]));
          reg11 <= (+(wire2[(4'ha):(2'h3)] && (~&($signed(reg8) <= ((8'ha5) ?
              wire2 : reg9)))));
          if ((-reg8))
            begin
              reg12 <= $signed(reg9[(1'h1):(1'h1)]);
            end
          else
            begin
              reg12 <= reg10[(4'ha):(1'h0)];
            end
          reg13 <= (reg5 ^ ($signed((~reg12[(2'h3):(2'h2)])) && ($unsigned(reg4) ?
              ($signed(reg9) == $unsigned(reg7)) : $signed($signed(reg12)))));
        end
      else
        begin
          reg9 <= ($unsigned((!{((8'ha5) ? reg9 : reg6), reg9})) ?
              $unsigned($signed(((reg9 * wire3) ?
                  {reg5, wire0} : $signed(wire3)))) : (!(~reg8)));
          reg10 <= reg13;
        end
      reg14 <= ($signed(((wire3[(4'h8):(3'h6)] ?
                  (wire1 ? reg9 : reg11) : (reg11 ? reg5 : reg12)) ?
              wire3 : (8'hb8))) ?
          $signed((reg4[(3'h5):(3'h5)] ^~ $unsigned(reg8[(3'h4):(2'h2)]))) : reg9[(4'h8):(3'h4)]);
    end
  assign wire15 = $unsigned((~^reg6[(2'h2):(2'h2)]));
  assign wire16 = (reg8[(1'h0):(1'h0)] ^~ ((8'ha7) ?
                      (~^wire0) : $signed(wire3[(1'h0):(1'h0)])));
  assign wire17 = $unsigned(reg6);
  assign wire18 = $unsigned($unsigned($unsigned(wire1[(2'h2):(1'h0)])));
  assign wire19 = $unsigned(($unsigned($signed((~reg7))) ?
                      reg6[(2'h2):(2'h2)] : {(7'h44)}));
  always
    @(posedge clk) begin
      reg20 <= (|wire15);
      reg21 <= ($signed(reg11[(1'h0):(1'h0)]) & (8'hae));
      if ((^((-(8'hb7)) >>> $signed(({reg10, (8'ha4)} ?
          $signed(wire3) : ((8'haf) ? wire3 : reg13))))))
        begin
          reg22 <= reg9;
          reg23 <= $unsigned($unsigned($signed(((reg12 ? wire18 : wire16) ?
              (~^reg12) : (wire17 * wire1)))));
        end
      else
        begin
          reg22 <= (~reg10[(1'h1):(1'h0)]);
          reg23 <= wire18;
          reg24 <= ((^{(!$signed(reg13)),
              $unsigned($unsigned(reg10))}) >> (~&(reg21 ?
              ((wire2 ? reg21 : reg14) <<< (reg23 == wire2)) : (|{(8'had),
                  wire0}))));
          reg25 <= (8'hae);
        end
      if (wire15[(1'h1):(1'h0)])
        begin
          reg26 <= $signed(wire1);
          reg27 <= ($unsigned({({reg26, wire0} ?
                  (^wire2) : (reg11 ? reg8 : (8'h9e))),
              (reg21[(3'h4):(1'h1)] != {(8'ha8)})}) > ((-wire16[(1'h1):(1'h0)]) <= (~&{(!(8'hb2)),
              (|reg5)})));
        end
      else
        begin
          if ((^$unsigned((((~reg5) >> wire17[(1'h1):(1'h1)]) << $unsigned(reg10)))))
            begin
              reg26 <= $unsigned($unsigned((wire0[(2'h3):(1'h0)] >> $unsigned((!reg22)))));
              reg27 <= wire18[(4'hb):(4'h9)];
            end
          else
            begin
              reg26 <= $signed(($signed((|$unsigned(reg25))) ?
                  ($unsigned($unsigned(reg10)) ?
                      reg4 : wire3) : $signed($unsigned((reg5 ?
                      (7'h43) : reg7)))));
              reg27 <= (reg23 << $signed((({(8'ha0), reg9} ?
                  reg26[(3'h5):(2'h3)] : (&wire3)) << ({reg25} ?
                  (|reg20) : $unsigned((8'ha0))))));
            end
          reg28 <= $signed(reg13[(2'h2):(2'h2)]);
        end
    end
  assign wire29 = reg9;
  assign wire30 = $unsigned((^~(~(-wire3[(2'h2):(1'h1)]))));
  assign wire31 = ((+reg24[(3'h5):(2'h2)]) >>> (wire19[(3'h5):(2'h3)] * $signed({(wire15 ?
                          reg8 : reg26),
                      (reg14 ? reg13 : reg11)})));
  always
    @(posedge clk) begin
      reg32 <= ($signed($signed(reg22)) ?
          (~^((reg22[(2'h3):(2'h2)] ?
              wire1 : $signed((8'had))) >= wire30)) : $unsigned($unsigned(wire30)));
      reg33 <= (|$signed(wire30[(1'h0):(1'h0)]));
      reg34 <= ($signed(((wire17 ? (reg25 ? wire1 : wire0) : (reg28 < wire30)) ?
          ((8'ha4) >>> (+wire3)) : ((8'h9f) + reg6))) << reg6[(2'h2):(1'h1)]);
      reg35 <= $unsigned(wire18);
      reg36 <= ($unsigned((~&reg35[(4'h8):(1'h1)])) ?
          ($unsigned($unsigned((wire30 || wire15))) ?
              ($signed((+wire30)) ?
                  $unsigned(reg25) : ((reg28 != reg23) ?
                      ((8'hb7) ?
                          reg8 : wire2) : (~&reg13))) : $unsigned($unsigned((~^reg22)))) : (reg4 > $signed(reg11)));
    end
endmodule
