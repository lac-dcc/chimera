module top
#(parameter param40 = {({(((8'ha6) ? (8'hae) : (8'ha6)) >>> (|(8'hb2)))} ? (^((8'hb3) <= (|(8'hb3)))) : (~|(&{(8'hb9)})))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire27,
                 wire26,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned($unsigned((({wire2, wire0} | wire3[(2'h2):(1'h1)]) ?
          $signed((|(8'h9c))) : {(wire1 ? (8'hbe) : (8'h9c))})));
      reg5 <= (~^(wire0 <<< (~|(^$unsigned(wire1)))));
      if (($signed(wire1[(2'h3):(1'h1)]) <<< $unsigned((|{(reg5 ?
              wire0 : wire2)}))))
        begin
          reg6 <= wire1;
        end
      else
        begin
          reg6 <= (reg5[(4'hc):(4'hc)] * ($unsigned($unsigned((-reg6))) - (8'hb7)));
          reg7 <= $unsigned((~&$unsigned($unsigned($signed((8'ha8))))));
          if (wire3)
            begin
              reg8 <= (($signed((8'ha6)) ?
                      {$signed(reg4[(2'h2):(1'h0)])} : reg4[(2'h2):(1'h1)]) ?
                  reg7[(3'h5):(3'h4)] : ((wire0[(1'h0):(1'h0)] ^ $unsigned(((8'h9c) | wire3))) ~^ (reg7[(2'h2):(2'h2)] && {reg5})));
              reg9 <= (^~(~|wire3));
              reg10 <= {{(wire0[(4'hf):(1'h1)] ?
                          reg7 : $unsigned((reg9 ? wire1 : wire0))),
                      reg4}};
              reg11 <= reg4;
            end
          else
            begin
              reg8 <= ($unsigned((~&$unsigned((&reg11)))) ?
                  ($signed(wire1) >>> (&wire1)) : (8'hb4));
              reg9 <= $unsigned(reg4[(1'h0):(1'h0)]);
              reg10 <= reg5;
            end
          reg12 <= $unsigned(($unsigned({(~reg7), $signed(reg4)}) ?
              reg11 : $signed($unsigned((reg11 && (8'haf))))));
          reg13 <= ($signed(reg10) || {{reg5[(4'h8):(3'h6)],
                  reg12[(1'h1):(1'h0)]},
              ((~|{reg12, reg7}) & (^(reg6 ? wire0 : wire0)))});
        end
      reg14 <= wire1[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ({$signed(({$unsigned((8'had))} - $signed((+reg6))))})
        begin
          reg15 <= (~^($signed($unsigned((!reg8))) ^~ $signed($unsigned((reg7 ?
              (8'ha2) : wire1)))));
          reg16 <= (^({$signed((^~wire3))} ~^ wire2));
          reg17 <= reg16;
        end
      else
        begin
          if (($unsigned((reg12[(5'h11):(3'h5)] >>> (^~{reg10,
              reg11}))) <<< $unsigned(reg9)))
            begin
              reg15 <= (!(~|(($unsigned(wire1) & {(7'h40)}) || ((reg11 ?
                      reg7 : reg13) ?
                  (^reg17) : reg6))));
              reg16 <= ($unsigned($signed((~|$signed(reg11)))) ?
                  ($signed((~^(^reg17))) ?
                      (wire1 ?
                          $unsigned((8'hb3)) : ((reg6 ?
                              reg10 : reg8) ^ wire0[(4'hd):(3'h4)])) : ((^~$signed(reg4)) ?
                          (wire0[(2'h3):(2'h2)] ?
                              (wire3 ? reg17 : (8'hb1)) : (reg13 ?
                                  reg12 : reg15)) : (~|wire3))) : (reg8 <<< reg13));
              reg17 <= (reg12 ?
                  reg14 : (+($unsigned((-reg9)) ?
                      $unsigned(((7'h40) <= (7'h41))) : $unsigned((reg14 & (8'ha9))))));
              reg18 <= (~^reg4[(3'h5):(2'h3)]);
              reg19 <= reg7;
            end
          else
            begin
              reg15 <= reg10;
            end
          reg20 <= reg11;
          reg21 <= (-(^(^$unsigned($unsigned(wire3)))));
          if ((({$unsigned(wire1), ((reg4 == (8'hb1)) ? $signed(reg5) : reg5)} ?
              (^~reg20) : $unsigned($unsigned(reg15))) + ((~|wire0[(5'h10):(1'h1)]) + $signed(((!wire0) + $unsigned(reg17))))))
            begin
              reg22 <= reg6[(1'h1):(1'h0)];
              reg23 <= $unsigned($signed($unsigned((reg14 ?
                  ((8'had) ? reg16 : reg11) : (~reg4)))));
              reg24 <= $unsigned(reg18[(1'h0):(1'h0)]);
            end
          else
            begin
              reg22 <= (-wire1[(2'h2):(2'h2)]);
            end
          reg25 <= {reg11[(3'h5):(1'h0)]};
        end
    end
  assign wire26 = ($signed((~reg13)) < $unsigned((~((~^(8'hb3)) >= (8'hbe)))));
  assign wire27 = {((reg22[(3'h5):(2'h3)] ? $unsigned((8'hb5)) : reg21) ?
                          $unsigned((8'ha1)) : ((&$unsigned(wire0)) + ($signed(reg16) | (reg5 ?
                              wire26 : reg5))))};
  always
    @(posedge clk) begin
      if (reg21)
        begin
          if (reg5[(5'h15):(4'hc)])
            begin
              reg28 <= ((reg11 ? reg13 : reg10) ?
                  $signed(wire26[(5'h10):(5'h10)]) : $unsigned(reg18[(1'h1):(1'h0)]));
              reg29 <= (((^~($unsigned(reg25) >= $signed(wire26))) ?
                      $signed({(~|reg11),
                          $signed(reg8)}) : $unsigned((((8'h9c) ? reg8 : reg5) ?
                          {reg9, wire26} : reg12[(4'h8):(3'h5)]))) ?
                  $signed((reg11 ?
                      $unsigned($unsigned(reg10)) : $unsigned({(8'ha7)}))) : $unsigned($unsigned((-reg4[(3'h4):(1'h1)]))));
            end
          else
            begin
              reg28 <= (((($unsigned(reg10) ?
                      $signed(reg29) : reg6[(3'h5):(1'h1)]) ^ ((~(8'haf)) ?
                      $signed(wire1) : {(8'ha2)})) && (&reg21)) ?
                  ((+(~&$signed(reg18))) | $signed(wire0)) : $signed(reg25[(3'h6):(2'h2)]));
              reg29 <= reg21;
              reg30 <= (((~^wire1) | (^$unsigned($signed(reg18)))) - (wire1[(3'h5):(1'h0)] <= $unsigned((|(~|reg23)))));
            end
        end
      else
        begin
          reg28 <= reg29;
          reg29 <= reg30;
          if (({reg23[(3'h4):(1'h0)]} >>> {$signed((reg28[(5'h11):(2'h3)] ?
                  (reg15 ^~ reg17) : (~|reg20)))}))
            begin
              reg30 <= (^~(reg13[(1'h0):(1'h0)] ?
                  $unsigned(((reg4 ?
                      reg28 : reg12) ~^ $signed(wire27))) : $signed($signed(((8'h9e) ?
                      reg16 : reg19)))));
              reg31 <= reg16[(5'h10):(4'hf)];
            end
          else
            begin
              reg30 <= $unsigned(((!reg21[(5'h10):(4'hd)]) >= $unsigned($unsigned((!(8'hab))))));
              reg31 <= $signed(wire1[(1'h0):(1'h0)]);
              reg32 <= $signed((^(&((reg7 ? reg15 : (8'hb0)) ?
                  $signed(reg22) : {reg12}))));
            end
          reg33 <= ((reg17[(2'h3):(1'h1)] ?
              {reg13[(1'h1):(1'h1)]} : $unsigned((wire0[(4'h9):(4'h9)] ?
                  reg22 : (wire0 ?
                      reg24 : (8'hb2))))) | ((|$unsigned((reg28 & reg13))) + ({(7'h44),
              $unsigned(reg8)} >>> (+$signed(reg8)))));
          reg34 <= ($unsigned((8'h9f)) ? $unsigned(reg29) : reg19);
        end
      reg35 <= (reg28 ? reg30 : reg15);
    end
  assign wire36 = ((reg17[(4'h9):(4'h8)] * wire0) >>> $signed({{{reg32, reg12},
                          $unsigned(reg16)},
                      (8'hac)}));
  assign wire37 = $signed(reg16);
  assign wire38 = reg33[(4'h9):(2'h3)];
  assign wire39 = $signed($signed($signed($unsigned((reg34 ? reg16 : reg16)))));
endmodule
