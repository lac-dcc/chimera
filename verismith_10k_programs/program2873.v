module top
#(parameter param44 = ({((((8'hb9) ? (7'h43) : (8'ha1)) ? ((8'ha7) ? (7'h42) : (8'hb0)) : {(8'ha3)}) ? (((8'hbc) >> (8'hba)) ? (~(8'hab)) : (|(8'hb0))) : {{(8'hb7), (8'ha1)}, ((8'hb5) <= (8'hb7))}), (^(&((8'haf) >> (8'hab))))} && (((((8'hb0) ? (8'hba) : (8'hac)) ? ((8'had) ? (8'hbd) : (8'hb7)) : ((8'ha4) * (8'ha8))) ? (((8'h9c) ? (8'hb5) : (7'h42)) ? (+(7'h41)) : {(8'hae), (8'ha6)}) : ({(7'h43)} ? ((8'hb2) ^ (8'ha2)) : (8'hb1))) ? (7'h40) : (|({(8'ha1), (8'ha8)} <= ((7'h41) ? (8'ha7) : (8'hb4)))))), 
parameter param45 = ({(~param44), param44} ~^ {((~&(!param44)) ? {(~&param44), param44} : (!{(7'h43)}))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire41;
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire43,
                 wire25,
                 wire41,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire4[(4'ha):(1'h1)];
      if ((((!$signed($unsigned(wire1))) ?
          wire1 : (((wire4 ? wire0 : (8'ha9)) ?
                  (reg5 ? wire2 : wire4) : $unsigned(wire1)) ?
              ($unsigned(wire1) ?
                  $signed((8'ha2)) : (wire2 | wire0)) : (wire0[(1'h1):(1'h1)] ?
                  $signed((8'hbe)) : ((8'ha1) ?
                      wire1 : wire1)))) >> $signed(wire0)))
        begin
          if ((wire2[(2'h3):(2'h2)] << wire2[(2'h2):(2'h2)]))
            begin
              reg6 <= wire2;
              reg7 <= wire3[(1'h0):(1'h0)];
              reg8 <= (((($unsigned(wire0) >= reg6[(4'he):(3'h4)]) <<< ((8'ha8) ?
                          $unsigned(reg6) : (|reg6))) ?
                      $signed((&(8'hbe))) : reg7[(4'hd):(3'h5)]) ?
                  $unsigned(wire0[(2'h2):(1'h1)]) : wire3[(3'h5):(2'h3)]);
              reg9 <= wire2[(2'h2):(2'h2)];
            end
          else
            begin
              reg6 <= $unsigned((wire0 >= (^(~&$unsigned(wire0)))));
              reg7 <= $signed((((reg9[(1'h0):(1'h0)] && (~wire2)) ?
                  reg8 : reg7) ^ ({(reg9 ? (8'hbb) : wire2),
                  reg5} << (8'ha2))));
              reg8 <= (!{$unsigned(reg6[(4'h8):(3'h6)])});
              reg9 <= $signed({(8'ha0)});
              reg10 <= $signed($signed($unsigned(wire1)));
            end
          if (reg9)
            begin
              reg11 <= $unsigned($signed($signed(wire3)));
              reg12 <= ((~&reg6) ?
                  {$unsigned(wire2[(2'h2):(2'h2)]),
                      reg7} : reg8[(4'h9):(2'h3)]);
              reg13 <= $signed($signed($signed(reg11[(2'h2):(2'h2)])));
              reg14 <= reg9;
            end
          else
            begin
              reg11 <= $unsigned(($unsigned($signed((reg10 || reg12))) ?
                  {reg5[(4'hf):(4'h9)]} : (+(^~(wire1 | (8'hbb))))));
              reg12 <= ((!$unsigned(reg10)) <<< wire3[(4'ha):(2'h3)]);
            end
          reg15 <= reg8[(4'h9):(2'h3)];
          reg16 <= $signed(reg14);
        end
      else
        begin
          reg6 <= $signed($unsigned({reg13}));
          reg7 <= $signed(reg5[(4'h9):(4'h8)]);
          reg8 <= reg6[(3'h5):(1'h0)];
          if ($signed(reg11))
            begin
              reg9 <= $unsigned($signed(reg15[(3'h4):(1'h0)]));
              reg10 <= ({(&$unsigned(reg11)),
                  reg8} ^~ ({reg13} >= reg13[(4'hb):(1'h1)]));
              reg11 <= {({(reg6 ? (&wire0) : $unsigned(wire1)),
                      $signed(wire0)} < $signed((&$unsigned(reg9)))),
                  $signed($signed(((reg12 ^ (8'hab)) ? (-(8'hbc)) : wire3)))};
              reg12 <= $unsigned(reg7);
            end
          else
            begin
              reg9 <= $signed(wire4[(3'h6):(3'h5)]);
              reg10 <= (~&$signed(wire1[(4'hf):(1'h0)]));
              reg11 <= ((~^$signed((!(wire2 >> reg11)))) >= (^(&(&(reg6 ?
                  wire0 : wire4)))));
              reg12 <= reg8;
              reg13 <= reg6[(3'h6):(1'h1)];
            end
          reg14 <= (reg12 ? {$signed((8'ha5))} : $signed(reg10[(1'h1):(1'h0)]));
        end
      if (((|reg15) ?
          {$signed((~^wire4[(4'hd):(3'h7)]))} : reg9[(1'h0):(1'h0)]))
        begin
          reg17 <= $signed($signed(reg12[(4'hb):(3'h4)]));
          reg18 <= reg12;
          reg19 <= reg10[(1'h1):(1'h0)];
          reg20 <= (wire2[(1'h1):(1'h0)] == (~&$signed((+(-reg6)))));
          reg21 <= {(-(&$unsigned((~^reg10)))), {wire4}};
        end
      else
        begin
          if ((~(~(~({reg5, reg21} ?
              (reg14 ? reg17 : reg12) : $signed(reg11))))))
            begin
              reg17 <= ((~^(reg18 >> reg17[(2'h3):(2'h3)])) <<< (^~(7'h41)));
              reg18 <= wire3[(3'h6):(3'h6)];
              reg19 <= ((~^$signed($unsigned((reg6 ?
                  reg10 : reg6)))) != (~|reg11));
              reg20 <= (~|reg7[(4'h9):(2'h2)]);
              reg21 <= reg9;
            end
          else
            begin
              reg17 <= {(($signed((reg5 ?
                      reg20 : reg7)) << $unsigned((~wire4))) <<< reg19[(3'h4):(3'h4)])};
              reg18 <= reg16;
            end
          reg22 <= $signed(reg13);
        end
      reg23 <= {reg8[(1'h0):(1'h0)]};
      reg24 <= $unsigned((reg16[(3'h5):(1'h1)] * ((reg21[(4'hf):(3'h4)] ?
              {reg18, wire4} : reg10[(2'h3):(2'h2)]) ?
          (reg11 ?
              (reg15 ?
                  reg22 : (8'hb2)) : reg21) : $signed($unsigned((7'h43))))));
    end
  assign wire25 = reg23[(1'h1):(1'h1)];
  module26 #() modinst42 (wire41, clk, reg12, wire25, reg22, reg17, reg10);
  assign wire43 = (~($signed((reg16 ?
                      (|wire1) : (reg7 + wire41))) >>> (8'ha9)));
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire31;
  input wire [(4'h8):(1'h0)] wire30;
  input wire signed [(2'h2):(1'h0)] wire29;
  input wire signed [(3'h4):(1'h0)] wire28;
  input wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire32;
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire33,
                 wire32,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire32 = wire27[(4'hb):(2'h2)];
  assign wire33 = ((wire30 & $signed($signed(wire27))) ?
                      wire28[(3'h4):(3'h4)] : $signed($unsigned($unsigned($signed((7'h43))))));
  always
    @(posedge clk) begin
      reg34 <= (!$unsigned((wire31 + (~$signed(wire28)))));
      reg35 <= $unsigned(({{(&(8'had)), $signed(wire31)}, $unsigned({wire32})} ?
          (8'ha7) : (~^((~|wire29) ? (wire30 ? wire33 : wire27) : reg34))));
      reg36 <= (&($unsigned(wire30[(1'h1):(1'h0)]) - $signed(($signed(wire27) ?
          (!wire27) : (wire32 ? wire31 : reg35)))));
      reg37 <= ({{((wire30 ? wire29 : wire33) ?
                      reg35[(4'h8):(1'h1)] : $unsigned(wire27)),
                  (~&((8'ha7) * wire28))},
              {reg34[(4'h9):(2'h2)]}} ?
          ((wire27[(4'hf):(1'h0)] ~^ $unsigned({reg35, (8'hbb)})) ?
              wire32 : (+((wire27 ?
                  wire30 : reg36) * (~wire27)))) : {reg36[(1'h0):(1'h0)],
              ({(8'ha9), (&wire33)} ?
                  wire27[(3'h6):(3'h4)] : reg36[(1'h0):(1'h0)])});
    end
  assign wire38 = ({(~|$unsigned({wire31}))} ?
                      ($unsigned($signed((+wire29))) ^~ {{wire32[(2'h3):(2'h3)]}}) : ((&(!((8'ha7) ?
                          wire30 : reg36))) + $unsigned(((+reg36) * (^(8'ha9))))));
  assign wire39 = (^{(wire30[(2'h2):(2'h2)] ^ reg34)});
  assign wire40 = (-($unsigned(($signed(reg37) <= wire33)) ?
                      ($unsigned((reg37 ~^ wire30)) || (^~{wire28,
                          reg37})) : (~((~wire32) ?
                          $unsigned(reg34) : wire30[(3'h6):(1'h0)]))));
endmodule
