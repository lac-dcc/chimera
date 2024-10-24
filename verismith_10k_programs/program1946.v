module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg4 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
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
      reg4 <= (7'h40);
      if ($unsigned((^~(wire0 >= (wire0[(4'he):(4'he)] ?
          (^wire0) : (wire3 ? wire1 : wire1))))))
        begin
          if (((wire2 == (&$signed((~&wire0)))) * $unsigned($unsigned(($unsigned(reg4) << wire1[(4'ha):(3'h7)])))))
            begin
              reg5 <= wire1;
              reg6 <= wire2[(4'ha):(2'h2)];
            end
          else
            begin
              reg5 <= (wire1[(4'h8):(1'h1)] ~^ $signed($signed($signed(wire1))));
            end
          reg7 <= $signed(reg4);
          reg8 <= (((&({(8'hbf), wire3} ^~ {(8'ha7)})) ?
                  (|{reg4}) : $unsigned(wire2[(3'h5):(1'h1)])) ?
              $signed(reg7[(4'ha):(3'h6)]) : (~&($signed((reg6 ?
                      reg4 : wire1)) ?
                  {(reg7 & reg7), $unsigned((8'hb1))} : ($unsigned(reg6) ?
                      (+wire3) : (wire2 ? reg6 : wire2)))));
          reg9 <= (reg7 ?
              wire3[(3'h4):(1'h0)] : (wire3[(2'h3):(2'h3)] ?
                  (~$signed(wire1[(2'h2):(1'h1)])) : $signed($signed((reg6 ?
                      reg6 : reg5)))));
        end
      else
        begin
          reg5 <= reg4;
          reg6 <= $unsigned(({wire1[(3'h5):(1'h1)]} ?
              $signed($signed(wire0[(3'h7):(2'h2)])) : (~|wire3[(3'h7):(1'h1)])));
          reg7 <= (8'hb9);
        end
      if (($unsigned((((7'h40) ?
              reg5 : ((7'h41) >= reg6)) >> (~(wire3 > reg6)))) ?
          (|{(!{(8'hb0)})}) : {reg6[(4'hb):(3'h6)], (8'ha1)}))
        begin
          reg10 <= wire2[(2'h2):(2'h2)];
          reg11 <= $signed({({(-wire0), wire2} != $unsigned((wire2 && wire1))),
              $unsigned(reg8)});
          reg12 <= reg10;
        end
      else
        begin
          reg10 <= reg6[(3'h4):(3'h4)];
          if ($signed(((reg5 ^~ ({(8'hab)} ?
              ((8'hb5) >> reg10) : wire0[(3'h4):(2'h3)])) <= reg11)))
            begin
              reg11 <= ($unsigned((^($signed(reg12) <<< $signed(wire3)))) | $signed($unsigned((!(wire1 ?
                  reg4 : wire2)))));
            end
          else
            begin
              reg11 <= $signed({(|wire3)});
              reg12 <= $signed(wire0);
              reg13 <= reg12[(3'h5):(3'h5)];
              reg14 <= $signed($signed((((wire2 ?
                  reg11 : reg9) == (~&(8'hb1))) & reg12)));
            end
          if (wire3)
            begin
              reg15 <= $signed(((|((wire1 ? wire2 : wire0) ?
                      reg6[(3'h5):(3'h5)] : (reg8 >= reg11))) ?
                  $unsigned((!reg11[(3'h6):(3'h4)])) : (reg11 == reg8)));
              reg16 <= reg14;
            end
          else
            begin
              reg15 <= (8'ha1);
            end
          reg17 <= (+wire1);
          if (reg11[(3'h5):(3'h5)])
            begin
              reg18 <= ((reg8 - reg13) != ($unsigned((~&reg15[(5'h14):(4'h9)])) ^~ ((+(wire1 ?
                  (8'haa) : wire0)) ^~ $unsigned((wire3 ? reg12 : reg9)))));
              reg19 <= (({reg4} ?
                  $unsigned($unsigned($unsigned(reg5))) : ($signed($unsigned((8'hb0))) & ((~^wire3) ?
                      ((8'hb0) ?
                          wire3 : reg14) : $unsigned((8'haf))))) == (8'hb7));
              reg20 <= ($signed($unsigned((reg16 || (8'ha9)))) ?
                  (reg7 ?
                      (|(~(+reg7))) : $unsigned(reg18[(2'h3):(2'h2)])) : ((reg4 != (|reg18[(4'hf):(4'hd)])) ?
                      reg6 : $signed($unsigned((reg18 ? reg14 : reg8)))));
            end
          else
            begin
              reg18 <= {(-$signed(wire1)),
                  $signed(($signed($signed(reg6)) <= ((~reg13) ?
                      ((8'ha2) ? reg12 : reg19) : reg6)))};
              reg19 <= wire0;
            end
        end
    end
  assign wire21 = (~($unsigned($unsigned($signed(wire1))) ?
                      ($unsigned((|wire1)) + reg17[(1'h0):(1'h0)]) : wire3[(4'h9):(4'h8)]));
  assign wire22 = ((~({(reg14 ? reg5 : (8'hb0)),
                      $signed(reg14)} >>> $unsigned($signed(reg10)))) << reg19[(3'h4):(3'h4)]);
  assign wire23 = $signed({wire21,
                      (((reg12 ? reg19 : wire2) ?
                              (reg14 >>> reg15) : reg18[(5'h12):(4'hb)]) ?
                          ((wire1 >> reg7) ? (&reg7) : reg7) : (wire21 ?
                              reg13[(4'hd):(4'h8)] : reg6[(2'h3):(1'h1)]))});
endmodule
