module top
#(parameter param46 = (({(8'hae), ((~^(8'h9d)) ? {(8'hab)} : ((7'h40) ? (8'hbc) : (8'h9c)))} ^ ((&((8'h9d) ? (8'hb0) : (8'hb7))) ? (+{(8'ha2)}) : (((8'hb1) == (8'hb9)) + ((8'hac) ? (8'hb0) : (8'h9d))))) & {(((~&(8'hbf)) ? ((8'ha8) & (8'ha9)) : (-(8'hb7))) <<< ((|(8'ha2)) ? {(7'h41)} : (^~(8'haa)))), ((((8'ha8) - (8'h9f)) ? {(8'ha5), (8'hba)} : {(7'h41), (7'h41)}) <<< (!((8'hb5) ? (8'hb3) : (8'haf))))}), 
parameter param47 = ((((|(param46 ? param46 : param46)) | {((8'hb1) < (8'hbf)), (param46 - param46)}) ? ((7'h44) || ((~^param46) & (param46 && param46))) : param46) + param46))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire23,
                 wire22,
                 wire21,
                 wire18,
                 wire17,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg20,
                 reg19,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = ($signed(($signed($signed((8'ha8))) <<< {wire2,
                         (wire3 & wire3)})) ?
                     (&($unsigned((~&wire1)) == (-wire2))) : ($signed((~wire2)) ^ wire0));
  assign wire5 = {(($signed($signed((8'hb0))) ?
                             (^~$signed((8'ha7))) : $signed(wire1)) ?
                         $unsigned(wire4) : (wire1[(3'h4):(1'h0)] > wire0))};
  assign wire6 = wire3;
  assign wire7 = {$signed($unsigned((wire1 == (!wire3)))),
                     wire3[(3'h6):(1'h1)]};
  assign wire8 = (($unsigned(wire3[(3'h7):(3'h7)]) ?
                     wire5 : (-((wire3 ?
                         wire3 : wire7) <<< wire3[(3'h4):(2'h3)]))) >>> ($unsigned((^wire2[(4'hc):(3'h7)])) ?
                     $signed($signed(wire5)) : (!(~|{wire6, wire3}))));
  always
    @(posedge clk) begin
      if (wire0[(3'h5):(3'h5)])
        begin
          reg9 <= (wire2 ?
              $unsigned(($signed(wire8[(5'h11):(4'hb)]) - ({wire0, wire0} ?
                  wire3[(1'h1):(1'h1)] : {wire1,
                      wire0}))) : $signed(({$signed(wire6),
                  $signed(wire7)} >> $unsigned(wire1))));
          reg10 <= wire2[(4'h8):(3'h7)];
          if ($signed($unsigned({$signed((!wire4)), (~reg9)})))
            begin
              reg11 <= ((wire2[(1'h0):(1'h0)] ?
                      (8'hbc) : ($unsigned((^~wire4)) ?
                          (~|$unsigned(wire5)) : wire6)) ?
                  {($unsigned($signed(reg10)) ?
                          ($unsigned(wire0) > wire8) : $signed(reg9[(2'h3):(1'h1)])),
                      (7'h42)} : wire1);
              reg12 <= (!(wire8 > ($unsigned($unsigned(wire1)) ?
                  $unsigned(wire7) : (^$signed(wire4)))));
              reg13 <= ($signed((|$unsigned($unsigned(wire7)))) ?
                  ((~|wire6[(1'h0):(1'h0)]) * (~|(^~(wire4 <<< (8'ha0))))) : {reg9,
                      wire7[(1'h1):(1'h1)]});
              reg14 <= {reg12};
            end
          else
            begin
              reg11 <= (~&($unsigned($signed($signed((8'hbb)))) >> wire0[(3'h4):(1'h0)]));
            end
          reg15 <= (((^~wire5) ?
                  (((~reg12) >> $unsigned(reg10)) >= ($signed(wire4) < wire7[(2'h2):(1'h0)])) : reg9) ?
              $signed($signed((reg11[(4'hc):(3'h5)] != (wire4 << reg12)))) : $signed($unsigned($signed((wire6 << reg9)))));
          reg16 <= $unsigned($signed(reg13[(3'h6):(2'h2)]));
        end
      else
        begin
          reg9 <= $unsigned(wire0[(3'h5):(2'h3)]);
          if (reg10)
            begin
              reg10 <= wire2[(2'h3):(2'h3)];
            end
          else
            begin
              reg10 <= $unsigned({{$unsigned((!reg10))},
                  (((~wire7) ? (-wire4) : (|reg12)) ?
                      $signed((reg10 && wire3)) : reg9[(3'h7):(1'h1)])});
              reg11 <= (&(^reg12[(4'hf):(4'hc)]));
              reg12 <= $signed((+(wire7 >> $signed(reg11))));
              reg13 <= $unsigned(((~&$signed($unsigned(reg12))) ?
                  reg15 : $signed((reg13 ? (8'h9f) : reg15[(1'h0):(1'h0)]))));
            end
          reg14 <= (($signed($unsigned((reg16 ? reg13 : wire3))) ?
                  (((wire2 ? reg14 : wire8) ? {wire2} : ((8'hb3) != (8'h9f))) ?
                      $signed((wire0 - wire2)) : $unsigned(reg9)) : wire6) ?
              (^~wire6) : $signed(reg16[(3'h4):(2'h2)]));
          reg15 <= ({(wire8[(4'hf):(4'h8)] - wire4), reg16} ?
              (~&reg16) : (reg11[(2'h3):(1'h1)] >> wire8));
        end
    end
  assign wire17 = {$signed(reg13[(3'h5):(2'h2)]),
                      $unsigned((reg10[(2'h2):(1'h0)] >>> (8'hab)))};
  assign wire18 = wire8;
  always
    @(posedge clk) begin
      reg19 <= (~&wire17[(4'he):(4'ha)]);
      reg20 <= ((^(|(!(reg15 ? reg9 : wire0)))) & $signed((^reg10)));
    end
  assign wire21 = $signed($unsigned(wire8[(5'h10):(2'h3)]));
  assign wire22 = $unsigned($signed(reg9[(4'h8):(3'h6)]));
  assign wire23 = reg16;
  always
    @(posedge clk) begin
      if ($signed(reg19))
        begin
          reg24 <= $unsigned($unsigned(((~^wire17[(5'h10):(3'h4)]) ?
              {$signed(wire23)} : wire3)));
          reg25 <= reg24[(4'hb):(4'ha)];
          reg26 <= (|{$signed((wire3 == ((7'h42) ? wire22 : wire2)))});
          reg27 <= ($signed(wire0) ? reg16 : (^$unsigned(reg26)));
          reg28 <= reg12;
        end
      else
        begin
          if ($unsigned((~^(($unsigned(wire17) >= $unsigned(reg28)) >> {(wire6 ?
                  reg11 : wire6)}))))
            begin
              reg24 <= ($signed(($unsigned((8'hb9)) ?
                      reg24[(3'h6):(1'h0)] : (~^(wire6 ? reg16 : wire7)))) ?
                  $unsigned(reg9[(2'h2):(2'h2)]) : wire7[(2'h2):(2'h2)]);
              reg25 <= $signed(reg14);
            end
          else
            begin
              reg24 <= $unsigned((^~$signed((~^reg15))));
            end
          if ((+$signed((+wire22))))
            begin
              reg26 <= $signed(reg14);
              reg27 <= reg28[(1'h0):(1'h0)];
              reg28 <= $signed((($unsigned((~^reg20)) <<< (~^(^~reg9))) | reg26[(2'h3):(1'h0)]));
              reg29 <= $signed({{reg12, ((^reg16) ? (8'hb2) : $signed(wire5))},
                  (({reg25, (8'ha1)} ? (^wire0) : (reg25 && wire3)) ?
                      (+(&wire7)) : ((reg14 ? reg10 : wire23) ?
                          $signed(reg27) : $unsigned((8'hba))))});
            end
          else
            begin
              reg26 <= wire6;
              reg27 <= wire17;
              reg28 <= $signed(wire8[(2'h3):(1'h1)]);
              reg29 <= (8'ha9);
              reg30 <= {(!$unsigned($unsigned((reg12 & wire3)))),
                  {(!$signed(reg14))}};
            end
          reg31 <= $unsigned((wire8 ?
              {$unsigned($signed(reg24))} : ((&(reg29 >> (8'ha2))) && reg29[(1'h0):(1'h0)])));
        end
      if ($signed((8'ha4)))
        begin
          reg32 <= wire1[(5'h13):(1'h0)];
          reg33 <= $unsigned(reg16[(3'h6):(3'h6)]);
          reg34 <= $unsigned(($unsigned((wire4[(4'hf):(3'h7)] * $signed(reg13))) && {(^$unsigned((7'h42)))}));
          reg35 <= (^((-(8'hb4)) ?
              reg15[(3'h4):(1'h0)] : reg28[(1'h1):(1'h1)]));
        end
      else
        begin
          reg32 <= ($signed(((^(reg34 - wire21)) - (&(wire4 <<< reg9)))) >> reg10[(1'h0):(1'h0)]);
          reg33 <= (reg15[(2'h2):(1'h0)] < {$signed(reg13)});
        end
    end
  assign wire36 = (~^((^~{(~(8'ha9)),
                      reg10[(1'h0):(1'h0)]}) ^~ (($signed(reg28) | (+wire6)) ?
                      (reg15[(1'h0):(1'h0)] ?
                          $unsigned(wire6) : reg27[(2'h2):(1'h0)]) : ($signed(wire18) ?
                          $unsigned(wire3) : (!reg32)))));
  assign wire37 = $signed((|(reg13[(3'h6):(3'h6)] ?
                      {reg33, reg33} : $signed((~&(8'ha1))))));
  assign wire38 = reg35;
  assign wire39 = ($signed(((-(reg28 == (8'hb5))) & wire2[(4'hb):(4'h9)])) != (~^$signed($signed(reg25[(3'h5):(3'h5)]))));
  assign wire40 = $unsigned($signed(wire22[(1'h1):(1'h0)]));
  assign wire41 = (($signed(((~&reg13) != (&wire8))) ?
                      $signed((~|(8'ha3))) : (~|wire21[(4'hd):(4'ha)])) && wire5);
  assign wire42 = $signed($signed($unsigned($signed(wire4))));
  assign wire43 = reg10[(3'h4):(2'h2)];
  assign wire44 = reg28;
  assign wire45 = $signed(reg25);
endmodule
