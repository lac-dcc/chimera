module top #(parameter param43 = (8'hbb)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = $signed($signed(wire2));
  assign wire5 = $unsigned($signed({{$unsigned(wire0)}}));
  assign wire6 = wire1;
  assign wire7 = (((|$signed(wire4[(3'h4):(1'h1)])) <<< ((wire4[(4'ha):(3'h5)] ?
                         (wire1 == wire2) : (wire5 && wire0)) < wire5)) ?
                     wire2[(4'h8):(1'h0)] : ($signed(wire2[(1'h1):(1'h0)]) ?
                         wire1 : wire3));
  assign wire8 = wire4;
  always
    @(posedge clk) begin
      reg9 <= {(+(wire4 ? wire4 : wire1))};
      if ($signed(((+$signed((wire2 ? (8'hac) : (8'hbd)))) ?
          wire7 : (~&(wire0 ? (wire3 != wire4) : $signed(wire5))))))
        begin
          reg10 <= (~^wire0[(4'hb):(1'h1)]);
          reg11 <= wire4;
          reg12 <= (&$unsigned($signed($unsigned(wire3[(3'h5):(2'h2)]))));
          reg13 <= $unsigned(((8'haf) + wire2));
        end
      else
        begin
          if (wire7)
            begin
              reg10 <= (wire6[(1'h1):(1'h0)] ? reg13[(3'h4):(1'h0)] : reg9);
              reg11 <= $unsigned($signed({(-(^~wire6))}));
              reg12 <= wire1;
              reg13 <= $unsigned($signed((7'h43)));
            end
          else
            begin
              reg10 <= wire5;
              reg11 <= ($signed((^~$signed($unsigned((8'ha9))))) ?
                  ((-$unsigned($unsigned(wire6))) && $signed((~^(&wire1)))) : reg10);
            end
          if (reg12[(4'he):(4'hc)])
            begin
              reg14 <= ($unsigned(($unsigned($signed(reg9)) ? wire8 : reg9)) ?
                  $unsigned(($unsigned($signed(reg13)) ?
                      wire1 : $signed((wire8 >= wire4)))) : ({(reg10[(3'h7):(3'h6)] ?
                          $unsigned(wire7) : (+reg9)),
                      reg10} + $unsigned((reg12 - reg10))));
            end
          else
            begin
              reg14 <= {($signed(((|wire2) ^~ (reg13 || reg13))) == wire6[(1'h1):(1'h1)])};
              reg15 <= wire6;
            end
          reg16 <= reg13;
        end
      reg17 <= wire1[(2'h3):(2'h3)];
      reg18 <= $unsigned($unsigned($unsigned((!(reg10 * wire2)))));
    end
  always
    @(posedge clk) begin
      reg19 <= ($signed({($signed(reg14) || wire6)}) ?
          (7'h44) : $signed(($signed($signed(wire5)) | wire6)));
      if ((~&reg14))
        begin
          reg20 <= wire3[(2'h3):(1'h1)];
          if (wire0)
            begin
              reg21 <= wire4;
              reg22 <= $signed((((&wire2[(1'h1):(1'h0)]) == ((reg17 ?
                  reg14 : (8'ha0)) >> {reg19})) <= ($signed($signed(wire1)) & reg19)));
              reg23 <= ($unsigned($unsigned($unsigned($unsigned(reg13)))) ?
                  {$signed($signed(reg14))} : ($signed($unsigned(reg17)) << wire4));
              reg24 <= $signed($unsigned(reg10));
              reg25 <= reg21;
            end
          else
            begin
              reg21 <= (&(7'h43));
              reg22 <= $unsigned($signed(reg10[(4'h9):(2'h3)]));
              reg23 <= ({$unsigned(((reg14 & (8'hb9)) * $signed(reg16)))} ?
                  reg24 : ($unsigned(($signed(wire3) ?
                          ((8'hb4) ? (8'hb4) : reg20) : (-reg9))) ?
                      wire5[(2'h3):(1'h1)] : ((wire1[(1'h0):(1'h0)] >> (wire3 ?
                              (8'haf) : reg9)) ?
                          $unsigned((^wire4)) : reg16)));
              reg24 <= $signed((~^{(((8'haf) ?
                      wire8 : reg19) + $unsigned((8'hb2))),
                  ((reg24 <<< reg18) ? $unsigned(wire6) : {reg13})}));
            end
        end
      else
        begin
          reg20 <= (~|((!(7'h43)) ? reg15 : $signed(wire6)));
          if (reg16[(3'h6):(1'h1)])
            begin
              reg21 <= reg10;
            end
          else
            begin
              reg21 <= ((&(!(reg22[(4'hc):(4'hb)] ?
                  {reg12} : (-reg20)))) > {{($signed((7'h44)) + (wire4 ?
                          wire0 : wire8)),
                      (wire8[(3'h4):(2'h3)] - (8'hb4))}});
              reg22 <= (-((|(reg17 == $signed(reg21))) >>> $unsigned({(reg23 ?
                      reg10 : (7'h42))})));
            end
          reg23 <= wire1[(2'h2):(1'h0)];
          if (reg17[(2'h2):(1'h1)])
            begin
              reg24 <= reg22;
              reg25 <= ($signed(wire4) ^ wire7[(3'h7):(3'h4)]);
            end
          else
            begin
              reg24 <= ((((((8'hba) > (8'ha2)) >> reg11) ^~ (8'hb3)) && wire3) | ((((wire1 ?
                  wire0 : reg17) < (~&(8'ha2))) ^ ($signed(reg11) ?
                  $unsigned(reg15) : $unsigned(wire0))) * ((!(reg17 ?
                      reg24 : reg11)) ?
                  $signed((8'h9f)) : $unsigned($unsigned(reg12)))));
              reg25 <= $signed(reg16[(1'h1):(1'h0)]);
              reg26 <= (8'ha6);
              reg27 <= $unsigned(((+((reg20 ? wire3 : wire4) ?
                      reg25 : ((8'ha6) ? reg26 : reg22))) ?
                  wire0[(4'hc):(4'h9)] : (wire5 ?
                      $signed($signed(reg22)) : wire3)));
              reg28 <= ((|reg27[(5'h12):(4'ha)]) ?
                  ($unsigned(wire5) ?
                      (~&reg22) : $unsigned(($signed(reg9) ?
                          (~&reg24) : $signed((8'ha8))))) : (~&((~reg13[(3'h6):(1'h0)]) & (8'hb4))));
            end
          reg29 <= wire4[(3'h5):(1'h1)];
        end
      reg30 <= $unsigned(reg17[(1'h0):(1'h0)]);
    end
  assign wire31 = reg26;
  assign wire32 = ($signed((!((~^reg20) ?
                      (&(8'hbe)) : $unsigned(reg16)))) >>> reg19);
  assign wire33 = reg10[(4'hb):(4'hb)];
  assign wire34 = ($signed($signed($signed(reg10[(1'h0):(1'h0)]))) ?
                      (($unsigned($signed(wire0)) ?
                          (~^wire32[(4'hd):(3'h5)]) : (^(reg14 ?
                              reg10 : (8'hbb)))) > $unsigned($unsigned({wire2}))) : ((wire1[(2'h2):(2'h2)] & (8'hbb)) ?
                          wire1[(2'h2):(1'h1)] : $signed($unsigned(wire1[(3'h4):(3'h4)]))));
  always
    @(posedge clk) begin
      reg35 <= ((8'hbf) && (!$signed($signed(reg22))));
      reg36 <= $unsigned(($unsigned($signed({(7'h43)})) ?
          (+$unsigned((reg17 * reg14))) : ($signed(wire1) + wire4[(3'h5):(1'h1)])));
      reg37 <= $signed((reg30[(3'h5):(2'h2)] << ({reg36[(4'h8):(3'h7)]} == {$unsigned((8'haf))})));
      reg38 <= ($unsigned(reg27) ? reg29[(2'h2):(1'h0)] : reg36[(4'he):(4'hc)]);
      reg39 <= reg37[(2'h2):(1'h1)];
    end
  assign wire40 = (~&(^~$signed($unsigned((7'h43)))));
  assign wire41 = ({(wire3 ^ (~(reg19 <<< reg12))), reg29[(4'he):(4'ha)]} ?
                      $signed((~|$signed(reg18))) : $signed(wire7[(3'h6):(1'h1)]));
  assign wire42 = ((8'hb7) || (wire5 ?
                      (!{$signed((8'hbe)),
                          $unsigned(reg29)}) : wire33[(2'h3):(1'h1)]));
endmodule
