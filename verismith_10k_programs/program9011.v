module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = $unsigned(wire3);
  assign wire5 = $unsigned($unsigned(($unsigned((wire3 ? wire1 : wire2)) ?
                     (8'haf) : (((8'hb4) ~^ wire4) ? {wire2} : wire3))));
  always
    @(posedge clk) begin
      if ((wire3[(2'h3):(1'h0)] ?
          $signed(wire1[(2'h2):(1'h0)]) : wire2[(3'h4):(2'h3)]))
        begin
          reg6 <= wire1[(3'h5):(3'h4)];
          reg7 <= (wire3[(1'h0):(1'h0)] ?
              (($unsigned(wire5) ?
                  (&((8'hbe) ?
                      wire5 : wire2)) : wire3[(2'h2):(2'h2)]) >= ($unsigned(wire0) >> $unsigned(wire0))) : $signed(($signed(wire0) ?
                  wire1 : (8'hb7))));
          reg8 <= (~|{(wire2 ? (8'hb6) : (&(~^wire5)))});
          if ({(reg7[(4'hc):(4'ha)] ?
                  $signed((&reg8[(3'h4):(1'h0)])) : ($unsigned($signed(reg7)) || (~^(~|wire3))))})
            begin
              reg9 <= $signed((8'ha2));
              reg10 <= $signed(($unsigned($unsigned(wire0)) ?
                  $signed($signed($unsigned(wire3))) : $unsigned(reg8[(3'h7):(3'h6)])));
              reg11 <= reg8;
              reg12 <= {{$unsigned($unsigned((wire5 ? reg8 : reg8)))}};
              reg13 <= reg12[(1'h1):(1'h1)];
            end
          else
            begin
              reg9 <= reg6[(2'h2):(2'h2)];
              reg10 <= (^~$unsigned(reg8[(3'h4):(2'h2)]));
              reg11 <= (wire3[(1'h1):(1'h0)] ?
                  ((+$signed(reg10[(1'h1):(1'h1)])) ^~ reg9[(1'h1):(1'h0)]) : $signed((^~wire1[(1'h0):(1'h0)])));
              reg12 <= ((!(((~reg9) ?
                      reg8 : wire5[(1'h1):(1'h0)]) + $signed({(8'h9f)}))) ?
                  $signed($unsigned(((wire5 ? (8'hbb) : wire0) ?
                      $signed(wire3) : $signed(reg8)))) : reg10);
              reg13 <= ((+$signed($unsigned((reg13 ? wire5 : reg9)))) ?
                  {$signed(wire1)} : $unsigned((!$signed((-wire0)))));
            end
        end
      else
        begin
          if ($unsigned((^~(($signed(reg11) ?
                  (reg6 && reg12) : wire2[(3'h4):(1'h0)]) ?
              (wire3 - (7'h41)) : ($signed(reg11) ?
                  wire5[(2'h2):(1'h0)] : wire4[(4'hd):(4'h8)])))))
            begin
              reg6 <= reg7;
            end
          else
            begin
              reg6 <= (^~$signed($signed(((8'hb8) ? (|(8'h9f)) : (|wire5)))));
              reg7 <= $signed((reg9[(3'h5):(3'h5)] ?
                  {((&wire5) - (reg7 >= wire5)),
                      $unsigned((reg7 ? (8'hbc) : reg10))} : $unsigned(({wire3,
                      reg6} ~^ {reg12, wire0}))));
              reg8 <= wire2[(3'h7):(2'h2)];
            end
          reg9 <= ($unsigned(reg12[(3'h7):(2'h3)]) == $signed(wire3));
          if ((((^$unsigned(wire2)) ^ (^~reg7[(4'hd):(4'hb)])) ?
              wire4 : $unsigned($signed(reg9))))
            begin
              reg10 <= $signed((8'h9f));
              reg11 <= wire2[(2'h2):(2'h2)];
            end
          else
            begin
              reg10 <= {$signed(wire4)};
              reg11 <= $unsigned($signed($unsigned($unsigned(wire4[(2'h3):(1'h0)]))));
            end
        end
      reg14 <= wire0[(4'ha):(4'ha)];
      if (wire0)
        begin
          reg15 <= $signed($signed(((8'had) ?
              ($unsigned(wire5) << wire4) : reg14[(1'h1):(1'h1)])));
          reg16 <= ($signed((reg10[(2'h2):(2'h2)] >> $signed(reg6[(1'h0):(1'h0)]))) ?
              $unsigned($unsigned((~&$unsigned(wire1)))) : $unsigned($unsigned({(~^(8'h9f)),
                  (wire2 < wire1)})));
        end
      else
        begin
          reg15 <= reg6;
        end
    end
  assign wire17 = wire0[(4'h8):(3'h7)];
  assign wire18 = wire0[(4'h8):(3'h7)];
  assign wire19 = {($unsigned($unsigned(wire1[(4'hc):(4'hc)])) ^ (&(((8'h9d) ?
                              (8'ha1) : wire0) ?
                          (8'had) : (wire1 ? (8'ha0) : reg15))))};
  assign wire20 = $signed(wire2[(3'h7):(3'h5)]);
  assign wire21 = (($signed($signed({reg15})) ?
                          $signed(((!wire20) << (~^wire4))) : $unsigned({((8'ha2) ?
                                  (8'h9d) : wire3)})) ?
                      $unsigned(($unsigned((reg13 ?
                          wire1 : wire20)) <= ((+reg8) <<< {reg10,
                          reg16}))) : reg10[(4'h8):(3'h5)]);
  assign wire22 = {(~|(reg14[(3'h4):(3'h4)] == reg11))};
endmodule
