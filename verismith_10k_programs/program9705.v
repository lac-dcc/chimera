module top
#(parameter param48 = ({{((~&(8'hb3)) >= ((8'h9d) >= (8'hb9))), ((8'had) ? ((8'hb9) ? (8'hb5) : (8'had)) : ((7'h44) + (8'ha2)))}} | (~^(!(^~((8'ha5) ^ (7'h40)))))), 
parameter param49 = ((param48 ? ((param48 >= (param48 ? param48 : param48)) & ((~^param48) ? param48 : (param48 > param48))) : (+((param48 ? param48 : param48) ? (param48 ? param48 : param48) : {param48, param48}))) ? param48 : param48))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  assign y = {wire47, wire46, wire44, wire5, wire4, (1'h0)};
  assign wire4 = wire2;
  assign wire5 = $signed(wire4);
  module6 #() modinst45 (wire44, clk, wire2, wire5, wire1, wire0);
  assign wire46 = $unsigned($unsigned(wire2[(4'h9):(3'h7)]));
  assign wire47 = (-$unsigned($signed(wire2)));
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire11;
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire25,
                 wire24,
                 wire11,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
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
                 (1'h0)};
  assign wire11 = wire7;
  always
    @(posedge clk) begin
      reg12 <= (-wire10);
      if (wire10[(4'h8):(2'h2)])
        begin
          reg13 <= ({((wire10 ~^ (wire9 <<< reg12)) != ($signed((8'ha2)) < wire11[(1'h1):(1'h1)])),
              $signed(wire10)} << wire11[(1'h0):(1'h0)]);
          reg14 <= wire8[(4'hb):(1'h0)];
          reg15 <= (+(wire10 ?
              {$signed((wire9 ? (8'hb1) : wire7)),
                  ((+(8'hb6)) ?
                      $unsigned(wire9) : ((8'h9d) != wire7))} : ((~^{wire9}) >> (^~(wire8 ?
                  (8'h9e) : wire7)))));
          reg16 <= {$signed($signed((~|$unsigned((8'hb6)))))};
          if (reg14[(3'h5):(3'h5)])
            begin
              reg17 <= (!wire9[(2'h3):(2'h3)]);
              reg18 <= $signed((-reg16[(2'h2):(1'h0)]));
              reg19 <= (&wire10[(3'h6):(1'h1)]);
              reg20 <= ($signed($unsigned(reg12[(1'h0):(1'h0)])) ?
                  (+(!$signed((~wire11)))) : wire8[(1'h1):(1'h0)]);
              reg21 <= {{(($signed(reg12) ^ $unsigned(reg20)) ?
                          reg17[(5'h13):(2'h2)] : (reg15[(4'he):(4'hd)] ?
                              (reg15 >> (8'hab)) : (~reg14))),
                      $unsigned($unsigned($unsigned(reg20)))}};
            end
          else
            begin
              reg17 <= (($unsigned({{reg12}, (^~wire7)}) ?
                  $signed(((reg12 ?
                      reg15 : reg12) >>> (~^(8'hb7)))) : reg14) ^ ((wire10[(4'hc):(2'h2)] >> ($unsigned((7'h43)) | $signed(reg13))) && (~^$signed({(8'hbb)}))));
              reg18 <= (wire10 ? reg14 : wire11);
              reg19 <= ({$unsigned($unsigned({(8'ha6), wire7})),
                  wire8} <<< (reg20[(1'h0):(1'h0)] <= $signed($unsigned((reg18 + wire10)))));
              reg20 <= $unsigned(reg13);
              reg21 <= reg15;
            end
        end
      else
        begin
          if ((^~reg15))
            begin
              reg13 <= wire11[(4'h9):(1'h0)];
              reg14 <= ({(|($unsigned(wire11) & $unsigned(wire7)))} ^~ $signed(wire9));
              reg15 <= reg20[(1'h1):(1'h0)];
              reg16 <= wire9;
            end
          else
            begin
              reg13 <= $unsigned({$unsigned($unsigned((reg12 ?
                      wire10 : reg17)))});
              reg14 <= {{wire11[(4'h9):(3'h5)]}};
              reg15 <= $signed(wire8[(4'h9):(3'h7)]);
              reg16 <= reg12;
              reg17 <= $signed((!reg19));
            end
        end
      reg22 <= reg20;
      reg23 <= $unsigned($unsigned($unsigned((~(~(8'hb4))))));
    end
  assign wire24 = (|wire7[(2'h2):(1'h0)]);
  assign wire25 = $signed($signed((~|(reg15 ? $signed(reg22) : (-wire8)))));
  always
    @(posedge clk) begin
      if (reg20[(3'h4):(2'h2)])
        begin
          if ((!(7'h40)))
            begin
              reg26 <= ($signed({(wire10 << (|(8'hac)))}) == (wire11 ?
                  reg12[(2'h3):(1'h1)] : reg12));
            end
          else
            begin
              reg26 <= ($unsigned(reg19[(3'h5):(3'h5)]) ?
                  {(~^$signed((wire11 > wire8)))} : $unsigned(((!{reg26}) ?
                      reg26 : reg26[(3'h6):(3'h5)])));
              reg27 <= (~($unsigned(($signed(wire7) ?
                      $unsigned(reg19) : {reg17})) ?
                  (($signed(reg20) ?
                      {reg18} : (reg13 ?
                          wire9 : wire25)) & wire7) : $signed(reg26)));
              reg28 <= ($signed($signed((reg27[(4'h9):(1'h0)] >= (reg12 ?
                      wire11 : reg22)))) ?
                  reg18 : (+wire9[(1'h0):(1'h0)]));
              reg29 <= {(-reg13), $signed($unsigned(reg15[(5'h12):(4'hf)]))};
              reg30 <= reg21;
            end
          if (reg17)
            begin
              reg31 <= $signed(($signed($signed(reg26)) ?
                  (|{wire9,
                      (+wire7)}) : ((~^(+wire7)) * $unsigned((wire7 | wire24)))));
              reg32 <= $unsigned(wire24[(1'h0):(1'h0)]);
              reg33 <= (~^reg28);
              reg34 <= wire11;
              reg35 <= reg26;
            end
          else
            begin
              reg31 <= reg15[(3'h7):(3'h6)];
              reg32 <= reg21;
              reg33 <= reg33[(3'h7):(1'h0)];
              reg34 <= $unsigned((reg32[(5'h15):(3'h6)] ?
                  ((reg21[(3'h5):(1'h0)] | (reg21 ?
                      reg16 : reg27)) >= {$signed(reg34),
                      $unsigned(wire7)}) : (~(8'hbb))));
              reg35 <= reg18;
            end
          reg36 <= $unsigned((reg32[(4'ha):(4'h8)] ?
              $signed({$unsigned(reg33)}) : $unsigned($unsigned(((8'h9e) * wire11)))));
          reg37 <= reg18;
          reg38 <= ((~|$unsigned($signed(((8'hab) ? reg15 : reg26)))) ?
              $unsigned(reg12[(1'h1):(1'h1)]) : reg21[(1'h1):(1'h0)]);
        end
      else
        begin
          if ((~((8'ha7) ? (|(+wire24)) : reg28)))
            begin
              reg26 <= $unsigned(reg16[(2'h2):(1'h0)]);
              reg27 <= $unsigned($unsigned({(reg13 ?
                      (reg14 >= reg17) : (reg36 ? reg21 : reg37))}));
            end
          else
            begin
              reg26 <= ((reg14[(3'h6):(2'h3)] ?
                      (((reg17 - reg30) - $signed(wire25)) > (reg23[(2'h2):(2'h2)] == $signed((8'ha7)))) : (~^(~reg23[(3'h5):(1'h0)]))) ?
                  $unsigned(reg13) : $signed((((+reg21) << (!reg16)) << $signed((reg20 && wire10)))));
            end
          reg28 <= $signed($signed(reg26[(5'h12):(3'h5)]));
          reg29 <= reg22;
        end
      reg39 <= wire9[(2'h2):(1'h1)];
      reg40 <= (($unsigned(($unsigned(reg29) ?
              (wire7 ? wire8 : reg26) : {reg22})) < (|((~^reg30) ?
              (wire25 ? reg28 : reg37) : (+reg27)))) ?
          $unsigned(reg29) : ($signed({$unsigned(reg13)}) ?
              $unsigned(($unsigned(reg13) ?
                  reg34[(5'h10):(4'hd)] : ((8'hb1) ?
                      reg30 : reg18))) : ((wire25[(4'hc):(3'h4)] ?
                  (wire11 * reg14) : $signed(reg38)) * ($unsigned(reg28) ~^ (^(7'h41))))));
      reg41 <= (^~$unsigned(((^~{(8'ha4),
          reg37}) & (reg28[(3'h7):(3'h4)] <= (8'hb6)))));
    end
  assign wire42 = {$unsigned(reg20[(2'h2):(2'h2)]),
                      $unsigned((reg18 <<< ((reg26 + reg28) >= (7'h41))))};
  assign wire43 = $unsigned(($signed(($unsigned(reg32) & (wire8 & reg23))) >> ((~&(reg27 ?
                          wire25 : wire7)) ?
                      (^reg37[(1'h0):(1'h0)]) : ({reg21,
                          (8'ha4)} <= reg12[(1'h0):(1'h0)]))));
endmodule
