module top
#(parameter param42 = ((({{(8'hb3)}, ((8'ha7) - (8'h9d))} ? (+{(8'hb1), (8'hb7)}) : (-(~|(8'hb9)))) ? (({(8'h9d)} ? ((8'hbf) ? (8'hb1) : (8'hb5)) : ((8'hb7) ~^ (8'hb0))) ~^ (((8'ha7) ? (8'hab) : (8'hae)) >= ((8'ha4) & (7'h41)))) : ({((8'had) ? (8'had) : (8'hba))} ? (8'h9f) : (~^(^~(8'hb4))))) ? (((+((8'hb5) ? (7'h40) : (7'h42))) ? ((8'h9d) ^ ((8'had) - (7'h43))) : {{(8'hb3), (8'hbf)}, ((8'ha3) >= (8'ha6))}) != (+(8'hb3))) : (((&((8'hb4) ? (8'ha2) : (8'ha5))) ? (!((8'hbd) ? (8'hb7) : (8'ha2))) : (~{(8'ha3)})) & ((^((8'hb1) ? (8'hab) : (8'ha2))) && (-((7'h40) ? (8'hb2) : (8'haa)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  assign y = {wire36,
                 wire17,
                 wire4,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire4 = ((|wire3) * wire2[(1'h0):(1'h0)]);
  module5 #() modinst18 (wire17, clk, wire0, wire4, wire1, wire3);
  always
    @(posedge clk) begin
      reg19 <= wire4[(5'h10):(1'h0)];
      if (reg19)
        begin
          reg20 <= ({reg19[(3'h7):(3'h5)], (7'h43)} >>> ((($unsigned(wire0) ?
              wire0[(4'h9):(1'h1)] : {wire17,
                  wire4}) <= $signed((reg19 & wire17))) && wire1));
          reg21 <= $unsigned({((^$signed(wire17)) ? wire0 : (~reg19))});
          reg22 <= wire4;
          reg23 <= $unsigned($signed($unsigned((8'hb1))));
          reg24 <= reg19[(2'h2):(2'h2)];
        end
      else
        begin
          if (wire4)
            begin
              reg20 <= wire2;
              reg21 <= {(reg22[(4'hd):(2'h2)] >> ((8'had) ?
                      $unsigned((reg23 ?
                          wire17 : wire3)) : ((reg19 >= wire3) >= {wire4}))),
                  (($unsigned({wire2, (8'ha0)}) ?
                      {reg24,
                          reg19[(5'h11):(2'h3)]} : $signed($signed(reg21))) >> reg20)};
              reg22 <= $unsigned(((8'hab) & $signed(((wire4 ?
                      (8'ha2) : (8'haf)) ?
                  $unsigned(reg23) : (reg24 > (8'hb8))))));
              reg23 <= (+reg24[(1'h0):(1'h0)]);
              reg24 <= reg24[(1'h1):(1'h1)];
            end
          else
            begin
              reg20 <= wire3;
              reg21 <= (wire17 ?
                  ((reg23[(4'hd):(3'h6)] ?
                      wire0 : {wire1[(4'ha):(3'h5)]}) != (reg22 >= (wire3[(4'h8):(2'h2)] ?
                      reg24 : $signed(wire1)))) : reg24[(1'h0):(1'h0)]);
            end
          if ($unsigned($unsigned(($unsigned($unsigned(reg21)) && (!(wire1 ^ reg19))))))
            begin
              reg25 <= reg23;
              reg26 <= ((^~((reg21[(1'h1):(1'h0)] ?
                      (wire4 || reg19) : (!wire17)) || wire4[(5'h10):(4'hb)])) ?
                  wire17 : (^~wire2[(2'h3):(1'h0)]));
            end
          else
            begin
              reg25 <= wire1;
              reg26 <= (8'ha1);
              reg27 <= (8'ha1);
              reg28 <= (wire17 >= $signed({(reg25 ?
                      $unsigned(reg20) : $signed(reg26)),
                  ((reg20 != wire1) ?
                      $unsigned(wire2) : (reg20 ? reg19 : wire0))}));
            end
          reg29 <= reg23[(3'h5):(1'h0)];
          reg30 <= ((wire0[(5'h12):(4'hd)] ?
                  $signed($signed($unsigned(reg24))) : {wire3,
                      $unsigned({wire3, wire3})}) ?
              $unsigned({(reg29 >= wire1[(4'hb):(2'h3)])}) : reg20[(2'h2):(1'h0)]);
          if ((reg23[(3'h6):(3'h5)] ?
              ($signed(reg27[(1'h0):(1'h0)]) ?
                  (8'had) : $unsigned(reg23)) : $unsigned((reg24 ?
                  (reg26[(2'h3):(2'h3)] ?
                      ((8'hb5) ?
                          reg23 : reg28) : wire17) : $unsigned($signed(reg26))))))
            begin
              reg31 <= reg29;
              reg32 <= (8'hba);
            end
          else
            begin
              reg31 <= $signed($signed((~(|reg21))));
              reg32 <= ({$unsigned(($unsigned(reg28) <= reg29[(4'h8):(2'h3)]))} ^ $unsigned(({reg32[(2'h2):(1'h1)],
                      $signed(reg19)} ?
                  ($unsigned(reg27) >= $signed(reg22)) : $unsigned($signed(reg24)))));
              reg33 <= reg31[(4'hd):(2'h3)];
              reg34 <= reg21;
              reg35 <= $signed(reg31[(3'h6):(2'h2)]);
            end
        end
    end
  assign wire36 = {(^$signed($signed($unsigned(wire2)))),
                      (+(wire3[(1'h1):(1'h0)] + reg33[(4'hb):(3'h4)]))};
  always
    @(posedge clk) begin
      reg37 <= ($signed(reg26) * $unsigned(reg31[(2'h2):(1'h1)]));
      reg38 <= $unsigned(wire17[(4'ha):(4'h9)]);
      reg39 <= reg34;
      reg40 <= reg27;
      reg41 <= $signed(($signed(($signed(reg40) <<< reg20)) ?
          $unsigned($signed(reg24[(1'h1):(1'h0)])) : reg20));
    end
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  assign y = {wire16, wire15, wire11, wire10, reg14, reg13, reg12, (1'h0)};
  assign wire10 = wire8[(5'h12):(5'h12)];
  assign wire11 = wire7[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg12 <= (-wire6[(2'h3):(2'h3)]);
      reg13 <= wire11;
      reg14 <= $signed(((wire6 ?
          (~^$unsigned(wire9)) : {$unsigned(reg13)}) == (($unsigned(wire8) - ((8'had) && wire6)) - $unsigned({wire9}))));
    end
  assign wire15 = (8'ha7);
  assign wire16 = (~wire9[(5'h11):(4'he)]);
endmodule
