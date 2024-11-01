module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire38,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire18,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg41,
                 reg40,
                 reg39,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
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
  assign wire5 = wire0;
  assign wire6 = {wire2};
  assign wire7 = wire6[(2'h2):(1'h1)];
  assign wire8 = $signed(((($unsigned((8'ha0)) ?
                     {wire2} : $unsigned(wire2)) ^~ (~(wire0 >>> wire4))) || ((~|wire5) ?
                     $signed($unsigned(wire6)) : ($unsigned((8'had)) ^~ ((8'hbb) ?
                         wire2 : (8'hb2))))));
  always
    @(posedge clk) begin
      if ((wire6 == ((wire6[(1'h0):(1'h0)] ?
              (+(wire6 ? wire7 : (7'h41))) : wire6) ?
          (wire4[(3'h4):(2'h3)] ?
              wire8 : ((wire1 ? wire3 : wire6) ?
                  $signed(wire2) : wire8[(2'h2):(2'h2)])) : $unsigned(((|(8'hab)) ?
              (8'ha9) : wire7)))))
        begin
          if (wire8)
            begin
              reg9 <= {(-wire7[(1'h1):(1'h1)]),
                  ((($unsigned(wire4) != $signed((8'hbe))) ?
                      wire7[(1'h1):(1'h0)] : $signed((wire6 ?
                          wire5 : wire3))) - $signed(wire2[(3'h4):(2'h2)]))};
              reg10 <= (&$unsigned((wire8 ?
                  $signed((wire5 ? wire6 : wire0)) : wire7[(1'h0):(1'h0)])));
            end
          else
            begin
              reg9 <= wire0[(3'h4):(3'h4)];
              reg10 <= wire3[(3'h6):(1'h0)];
              reg11 <= ((~$signed(wire4[(3'h4):(2'h3)])) << (-(8'h9e)));
              reg12 <= $unsigned($signed((-$signed($signed(wire0)))));
            end
          if ((wire8[(2'h3):(2'h2)] ?
              $unsigned(wire2[(1'h0):(1'h0)]) : $signed((wire1[(1'h0):(1'h0)] ?
                  ($signed(wire0) ?
                      $signed((8'hac)) : $unsigned(reg12)) : $unsigned((^~wire3))))))
            begin
              reg13 <= wire8[(3'h5):(2'h3)];
              reg14 <= (^~wire1[(4'ha):(2'h2)]);
            end
          else
            begin
              reg13 <= wire4[(4'ha):(2'h3)];
            end
          reg15 <= ((^~(8'h9c)) && $unsigned((&$signed((^~wire0)))));
          reg16 <= $signed((reg12 < (wire5[(2'h2):(1'h1)] ?
              (+reg11) : (8'haa))));
        end
      else
        begin
          reg9 <= ($unsigned(reg11) - ({$signed((-reg11))} + ($signed($unsigned(reg9)) && (+reg14[(2'h3):(2'h2)]))));
        end
      reg17 <= ($unsigned(((~$signed(reg16)) * {wire3[(3'h6):(1'h1)]})) * (reg16 ?
          (&(reg16 ?
              $signed(wire1) : reg15[(3'h7):(3'h7)])) : wire1[(5'h15):(4'hd)]));
    end
  assign wire18 = ((wire6[(2'h2):(2'h2)] != reg9) ?
                      (8'hb4) : (($signed(reg9) || reg15) ?
                          $unsigned($signed((+wire7))) : wire4));
  always
    @(posedge clk) begin
      if (wire3)
        begin
          if ((-wire2))
            begin
              reg19 <= $signed($signed(wire2[(4'hc):(4'h9)]));
              reg20 <= $unsigned($unsigned({(8'haa)}));
              reg21 <= reg19;
              reg22 <= (({((!reg13) ?
                      (+wire7) : wire5[(5'h11):(3'h4)])} - ((~&wire18[(4'hd):(1'h1)]) ?
                  (^~$unsigned(reg17)) : (|$signed(reg17)))) ~^ {$unsigned($signed((+wire6)))});
              reg23 <= (wire1[(1'h1):(1'h1)] >> ((~&wire18[(3'h4):(1'h1)]) < (wire0 >= ({wire1} <<< (~|(8'ha3))))));
            end
          else
            begin
              reg19 <= wire8;
              reg20 <= ($signed((~^reg16)) ? wire7[(2'h2):(2'h2)] : reg21);
              reg21 <= wire5[(4'hc):(1'h0)];
              reg22 <= ((8'hb8) == wire7);
              reg23 <= (reg9[(2'h3):(1'h1)] != $signed(((~&(reg11 >= reg13)) + $unsigned($unsigned(reg12)))));
            end
        end
      else
        begin
          reg19 <= $unsigned($unsigned($signed((~|(reg16 * reg23)))));
        end
      reg24 <= reg19;
      reg25 <= $signed($unsigned((&reg20)));
    end
  assign wire26 = $signed(wire7[(1'h0):(1'h0)]);
  assign wire27 = wire0;
  assign wire28 = (8'hb1);
  assign wire29 = (^wire3);
  assign wire30 = ($signed((~|$signed((~&wire8)))) ?
                      $signed($signed(wire28[(4'he):(4'hc)])) : reg12[(1'h0):(1'h0)]);
  assign wire31 = (7'h44);
  always
    @(posedge clk) begin
      reg32 <= (8'hbc);
      if ((^(wire30 ?
          (~^($signed(reg25) ?
              $unsigned((8'hac)) : $unsigned((8'hb8)))) : ({wire3,
              reg17} <= (8'hbe)))))
        begin
          reg33 <= reg22[(1'h0):(1'h0)];
        end
      else
        begin
          reg33 <= (wire27 ?
              reg23 : ($signed((&(&(8'hb4)))) ?
                  $unsigned($unsigned((|wire8))) : (((~|reg12) ?
                          (reg25 >>> wire28) : (8'hab)) ?
                      {wire28[(3'h7):(3'h5)]} : reg21)));
          reg34 <= $signed(reg13);
          reg35 <= $signed((reg24 ? reg21 : {(reg24 > (wire6 == (8'ha8)))}));
        end
      reg36 <= reg34[(3'h6):(3'h4)];
      reg37 <= ($unsigned($signed({((8'ha7) ? wire3 : wire0),
              (wire5 >= (8'hb5))})) ?
          reg14 : $unsigned((~$signed(reg9[(4'hd):(4'h8)]))));
    end
  assign wire38 = $signed((($unsigned((~|reg23)) ?
                      {(reg32 ^ reg20), (^reg34)} : (reg21[(2'h2):(1'h0)] ?
                          reg37 : (8'ha8))) << (({reg20, reg32} || reg21) ?
                      $unsigned(((7'h43) >= wire30)) : $signed(reg25))));
  always
    @(posedge clk) begin
      reg39 <= wire8;
      reg40 <= reg23;
      if ((&($signed($signed((reg40 != reg11))) ?
          $signed((reg10 ? (reg32 << reg36) : (wire2 <= wire2))) : wire26)))
        begin
          reg41 <= (reg21[(4'hf):(4'hc)] != reg32[(2'h3):(1'h1)]);
        end
      else
        begin
          reg41 <= reg12;
        end
    end
  assign wire42 = reg25[(4'h9):(3'h5)];
  assign wire43 = ($signed(($unsigned(((8'hb6) <= wire1)) ?
                          $unsigned(reg40[(2'h3):(1'h1)]) : (+$signed(wire38)))) ?
                      {((~$unsigned((8'hbc))) ?
                              wire1 : wire4[(4'hc):(1'h1)])} : reg34[(1'h0):(1'h0)]);
  assign wire44 = reg41[(3'h5):(1'h1)];
endmodule
