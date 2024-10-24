module top
#(parameter param36 = (8'haf), 
parameter param37 = (param36 * (~{param36})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire35,
                 wire32,
                 wire31,
                 wire16,
                 wire8,
                 wire4,
                 reg34,
                 reg33,
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
                 reg17,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ((!{(&$signed(wire3)),
                         (wire1[(1'h1):(1'h1)] | (wire1 ~^ (8'hb7)))}) ?
                     (|$unsigned(wire2)) : wire3[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg5 <= wire3[(4'hc):(2'h2)];
      reg6 <= ($signed((($unsigned(wire2) ?
              $unsigned(wire0) : (wire4 & wire3)) + ({wire3} - ((8'hba) & wire3)))) ?
          ((({reg5} >= {reg5, wire0}) < wire4[(1'h0):(1'h0)]) ?
              reg5[(5'h12):(5'h11)] : (wire3 ?
                  $unsigned(wire2) : (8'hb9))) : $unsigned(((^((8'hbe) ?
              wire3 : wire4)) - (wire2[(4'hb):(3'h4)] < reg5[(4'h9):(1'h0)]))));
      reg7 <= (wire3[(3'h7):(3'h6)] ?
          $signed({{(wire3 >= reg6)}, (reg5 && (wire4 != wire1))}) : {wire4});
    end
  assign wire8 = (^~(~^$signed($signed(wire1))));
  always
    @(posedge clk) begin
      reg9 <= wire0;
      reg10 <= (($signed(wire1) ^ (reg5[(5'h13):(3'h5)] + ($signed(reg9) << (wire3 == reg6)))) ?
          wire0[(1'h1):(1'h1)] : wire0);
      if (wire8)
        begin
          reg11 <= $unsigned((reg5[(3'h5):(1'h0)] ?
              $signed($signed(wire4[(2'h2):(1'h1)])) : reg6));
          reg12 <= $signed($unsigned((~^$signed((+reg7)))));
        end
      else
        begin
          reg11 <= (($signed((|reg10[(3'h5):(2'h3)])) != $signed(((reg9 < reg11) >>> $unsigned(reg11)))) << (^~($signed((~|reg5)) && $signed((reg10 <<< reg7)))));
          reg12 <= ($signed(reg6) ?
              (reg12 << (reg11 ?
                  $signed(reg9) : $unsigned(((8'hba) ^~ reg11)))) : reg10);
          reg13 <= (^($signed(($unsigned((8'hb0)) ?
                  reg6[(4'hb):(4'ha)] : (wire0 ? wire3 : wire0))) ?
              (reg9 ?
                  ((wire3 ? wire4 : reg7) ?
                      $unsigned(wire0) : (^reg5)) : $signed($unsigned(wire1))) : (wire0[(4'ha):(4'h8)] ?
                  $unsigned((8'h9c)) : reg11)));
          reg14 <= $signed((($unsigned($signed((8'hb0))) ?
              $unsigned(reg11) : (~&wire3[(3'h5):(1'h1)])) && $unsigned(({wire8,
                  (8'ha6)} ?
              {wire4, wire2} : reg5[(5'h13):(5'h10)]))));
        end
      reg15 <= (reg13 ?
          (($signed((wire8 && wire3)) ?
              reg10 : (^(!(8'hb7)))) <<< wire8) : reg10[(3'h7):(3'h6)]);
    end
  assign wire16 = (~^reg15[(4'hd):(1'h0)]);
  always
    @(posedge clk) begin
      reg17 <= wire3[(2'h2):(1'h1)];
      reg18 <= $unsigned((reg15 & reg9));
      if ($unsigned({(((|reg5) ? $signed(reg13) : reg15) <= reg17),
          (((reg13 <<< reg9) ? $unsigned(reg10) : $signed((8'hac))) ?
              ((^wire0) - {reg12}) : wire1)}))
        begin
          reg19 <= $unsigned((reg7[(2'h2):(2'h2)] >>> wire2));
        end
      else
        begin
          reg19 <= $signed($signed($unsigned(((reg6 ?
              wire2 : reg19) > wire4[(2'h3):(2'h2)]))));
          reg20 <= ((wire16 >= reg13[(3'h4):(1'h0)]) ?
              $signed(((^~$unsigned((8'hba))) ?
                  $unsigned($signed(wire2)) : ((+wire0) ?
                      ((8'ha9) | reg15) : $signed(reg9)))) : (reg11[(1'h0):(1'h0)] == wire2));
          if ({({(^wire4), reg15} || ({$signed(wire0), wire0} ?
                  (^~(reg6 ? wire16 : reg13)) : $unsigned($unsigned(wire1)))),
              (^~wire0)})
            begin
              reg21 <= reg19;
              reg22 <= $unsigned(((({(8'ha0)} > ((8'hb9) ? wire8 : reg17)) ?
                      reg15 : $signed(((8'ha2) << reg6))) ?
                  (^~{(reg5 ? reg9 : reg17),
                      (reg13 ? wire8 : reg13)}) : (^~(8'hbf))));
              reg23 <= reg12;
              reg24 <= (reg5 >> {{reg13[(4'h9):(1'h1)], $unsigned({(8'haa)})},
                  $signed(reg13[(3'h5):(1'h1)])});
            end
          else
            begin
              reg21 <= wire16[(2'h3):(2'h2)];
              reg22 <= $signed((wire4 != (+wire2[(4'hb):(4'h8)])));
              reg23 <= reg12[(5'h13):(5'h10)];
            end
          if ((~&reg22))
            begin
              reg25 <= ($signed({$unsigned(wire0[(3'h6):(1'h1)])}) ?
                  reg6[(2'h2):(2'h2)] : reg9[(2'h3):(2'h2)]);
              reg26 <= $unsigned(wire4);
              reg27 <= (~|$unsigned(reg15[(5'h11):(4'h8)]));
              reg28 <= $unsigned(reg7[(2'h2):(2'h2)]);
              reg29 <= reg27;
            end
          else
            begin
              reg25 <= reg5[(5'h13):(1'h0)];
              reg26 <= $unsigned(wire4[(3'h4):(2'h3)]);
            end
          reg30 <= wire3[(4'h9):(3'h7)];
        end
    end
  assign wire31 = reg7[(3'h7):(1'h0)];
  assign wire32 = $unsigned(reg18[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg33 <= reg17[(3'h5):(1'h0)];
      reg34 <= {reg5,
          (($signed(wire4) ?
              reg25[(1'h1):(1'h1)] : reg17) & reg22[(1'h0):(1'h0)])};
    end
  assign wire35 = reg33[(3'h5):(1'h1)];
endmodule
