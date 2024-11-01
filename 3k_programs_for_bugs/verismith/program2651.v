module top
#(parameter param35 = (&(~|({((7'h44) < (8'ha5)), ((7'h41) * (8'hbf))} <<< (|((8'hbf) + (8'hb3)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire17,
                 wire8,
                 wire7,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire1[(3'h4):(2'h3)] ? wire2 : (&wire2[(1'h0):(1'h0)]));
      reg6 <= $unsigned($unsigned({((wire4 ? (8'hb5) : wire4) ?
              {wire3} : wire1),
          wire1}));
    end
  assign wire7 = (reg6 ?
                     ({((reg6 >>> reg5) ?
                             $signed(wire0) : (!wire1))} * $signed(($unsigned(wire2) ^ (wire1 - wire4)))) : (~^($unsigned($signed((8'hb5))) ?
                         wire3[(3'h6):(1'h1)] : ($signed((8'hbd)) ?
                             $unsigned(wire4) : wire1))));
  assign wire8 = reg6[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg9 <= $signed($signed($unsigned((wire3[(3'h4):(2'h3)] < wire8))));
      reg10 <= {wire3};
      if (((({(wire3 + wire3)} + (reg9 ?
              $unsigned(reg10) : wire3)) || (($signed(wire3) && wire2[(3'h5):(3'h5)]) - wire3)) ?
          (|$signed(reg10)) : ({(~&reg9)} ?
              $signed(wire0[(1'h0):(1'h0)]) : $signed($signed({wire0, reg5})))))
        begin
          reg11 <= $unsigned({(($signed(wire2) ? wire4 : $signed((7'h43))) ?
                  ((reg9 >> wire8) < (wire4 + reg5)) : reg5),
              (~(8'ha2))});
          reg12 <= wire4[(1'h1):(1'h0)];
          reg13 <= $unsigned(wire2[(3'h6):(1'h1)]);
          reg14 <= ($signed($signed($signed({wire2, wire8}))) ?
              ((-$unsigned($signed(reg12))) ?
                  ((~&$unsigned(reg9)) ^~ reg10[(3'h5):(3'h4)]) : $unsigned(((reg12 ?
                          (8'hbd) : reg9) ?
                      (^wire2) : $signed(wire1)))) : ($unsigned(((reg13 >> reg10) ?
                  (-reg13) : wire3)) >>> (($unsigned(wire1) >>> $unsigned(reg10)) ?
                  ((wire0 == reg13) ?
                      {wire1} : (wire8 ? wire1 : wire1)) : $signed(wire3))));
        end
      else
        begin
          reg11 <= {wire1};
          reg12 <= reg14;
          if (wire4)
            begin
              reg13 <= wire2[(1'h1):(1'h1)];
              reg14 <= (!{wire8});
              reg15 <= $unsigned((-wire8));
            end
          else
            begin
              reg13 <= (wire8 ^~ {((wire1 || (reg13 - reg15)) || ((&reg13) << wire7[(2'h2):(1'h1)]))});
            end
          reg16 <= wire0;
        end
    end
  assign wire17 = (~($unsigned((wire1[(1'h0):(1'h0)] ?
                          (8'haf) : (reg5 ? reg16 : (8'hb2)))) ?
                      (($unsigned(wire1) ? (~reg16) : {wire4}) ?
                          ($unsigned(reg9) ?
                              $signed(reg10) : ((8'hba) ?
                                  wire7 : reg13)) : ((wire2 ?
                              reg14 : wire8) <= (&reg11))) : (wire1[(3'h5):(2'h2)] != reg12[(3'h7):(1'h0)])));
  always
    @(posedge clk) begin
      reg18 <= ($unsigned(wire17[(5'h10):(2'h3)]) ?
          $signed({(^$unsigned(reg11))}) : $signed($signed((wire8 ?
              {wire2} : {(8'hbe)}))));
      reg19 <= $signed(({wire17[(4'h8):(2'h3)], {(~&(7'h41))}} ?
          reg11[(4'ha):(3'h7)] : $unsigned(wire8[(3'h5):(1'h0)])));
      reg20 <= $unsigned(wire8[(3'h5):(3'h5)]);
      if ((^reg9[(4'hb):(2'h3)]))
        begin
          reg21 <= (^reg5[(2'h2):(1'h1)]);
          reg22 <= (wire3[(1'h0):(1'h0)] ?
              wire0[(1'h1):(1'h0)] : {($unsigned((|wire17)) && $signed(wire2[(3'h4):(2'h2)])),
                  (^{(reg20 ? (8'hb2) : reg21), wire1[(2'h3):(1'h1)]})});
          reg23 <= $unsigned(reg9);
          reg24 <= $unsigned($signed(wire17));
          reg25 <= reg20[(2'h2):(1'h1)];
        end
      else
        begin
          reg21 <= $unsigned($signed(reg16));
          reg22 <= reg19;
          reg23 <= wire17;
          if (reg20)
            begin
              reg24 <= $signed(reg14[(1'h1):(1'h1)]);
              reg25 <= {reg22, wire0[(3'h5):(2'h2)]};
              reg26 <= (((($unsigned(wire4) ? $signed(reg15) : $signed(wire1)) ?
                      (~^reg20[(3'h7):(2'h2)]) : reg18[(2'h3):(2'h3)]) && (reg9[(3'h4):(2'h2)] * (^reg15[(3'h5):(3'h4)]))) ?
                  $signed(reg11) : $unsigned((reg10 | $signed((reg20 ?
                      reg21 : reg24)))));
              reg27 <= $signed((~|$unsigned((wire17 ^ (~&reg24)))));
              reg28 <= (8'hb6);
            end
          else
            begin
              reg24 <= $signed(reg19[(2'h2):(1'h1)]);
              reg25 <= reg18;
              reg26 <= $unsigned(((wire1[(4'h9):(3'h7)] && $signed({reg15,
                  reg15})) << ((~&(reg22 < reg24)) * {$unsigned(reg19),
                  (8'hb0)})));
            end
          reg29 <= wire8[(1'h0):(1'h0)];
        end
      reg30 <= $unsigned((8'ha1));
    end
  always
    @(posedge clk) begin
      reg31 <= {$unsigned((reg29[(1'h0):(1'h0)] ?
              (-(reg20 || (7'h44))) : $unsigned((-reg26)))),
          $unsigned(reg19)};
    end
  assign wire32 = (reg5 ?
                      (~|((~|(+reg19)) ?
                          reg20[(4'h8):(1'h0)] : ($unsigned((8'hab)) != $unsigned(wire2)))) : (((!(wire1 != reg19)) ?
                              (~^$unsigned(wire4)) : reg27) ?
                          reg10[(1'h0):(1'h0)] : ($unsigned(wire1) << reg28)));
  assign wire33 = wire7[(1'h1):(1'h0)];
  assign wire34 = ($unsigned(reg25) != $signed($unsigned((8'ha0))));
endmodule
