module top
#(parameter param42 = ((((!{(7'h43)}) < (~|((7'h41) ? (8'ha6) : (8'ha0)))) | ((|((8'hb9) ^~ (8'hba))) & {((7'h40) | (8'hb1))})) >>> ({(((8'ha5) == (8'hae)) ? ((8'hb2) >> (8'hb7)) : (8'hb6)), ({(7'h40), (8'hb8)} ~^ (-(8'hb9)))} ? {{{(8'hb6)}}, {((8'hbf) < (8'hb6)), ((8'hb1) ? (8'h9c) : (8'hbe))}} : (+(^~((8'hb6) <<< (8'hba)))))), 
parameter param43 = (^((^(~|(param42 ? param42 : (7'h40)))) ? (!((^~param42) || (param42 < param42))) : {(8'ha5)})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire38,
                 wire35,
                 wire34,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg39,
                 reg37,
                 reg36,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (($signed($unsigned((wire4 ? (8'hb5) : wire3))) ?
              wire0 : ((((8'hae) ? (8'h9c) : (8'ha2)) || $unsigned(wire1)) ?
                  ($signed(wire1) & (wire1 >>> (8'h9c))) : ($signed(wire4) ?
                      $signed(wire4) : wire0))) ?
          $unsigned(($signed($signed(wire1)) ?
              (~$signed(wire0)) : $unsigned(wire0))) : (wire1 ?
              wire3 : (($signed(wire0) ^~ (|wire1)) == $unsigned(wire0[(5'h13):(4'hc)]))));
    end
  assign wire6 = $unsigned(wire0);
  assign wire7 = $unsigned(((^wire0) ?
                     wire6 : (|{(wire4 != wire1), $signed(wire4)})));
  assign wire8 = ((($signed((~&(8'hb3))) >= wire3[(4'ha):(1'h1)]) ?
                     $signed(wire1) : ((wire0 ?
                         (wire2 ?
                             wire6 : wire4) : wire7[(4'hc):(1'h1)]) >= $signed($signed(wire0)))) == (&(8'haf)));
  assign wire9 = wire6;
  assign wire10 = wire6;
  assign wire11 = (((|(|reg5[(3'h4):(1'h0)])) ?
                      (reg5 ~^ ((reg5 ?
                          wire2 : wire1) || $unsigned(wire0))) : (wire7[(4'hf):(4'hf)] ?
                          $signed(wire6) : ($signed(wire10) ?
                              (wire0 << wire3) : (!wire9)))) | $unsigned(($unsigned($unsigned(wire10)) ?
                      (wire7[(4'h8):(3'h6)] < $unsigned((8'hbf))) : (&$signed(wire7)))));
  always
    @(posedge clk) begin
      reg12 <= {reg5,
          (reg5 ? $unsigned($signed((reg5 ? wire3 : (8'hb9)))) : (8'hb1))};
      reg13 <= ((((8'hb7) ? reg12 : wire7) == $signed((~^wire8))) ?
          $unsigned({wire9[(2'h3):(2'h2)]}) : (((|(8'hae)) ?
                  ($signed(reg12) >= wire8[(4'hf):(1'h0)]) : $signed(wire10)) ?
              (~^wire6) : $unsigned(((&(8'ha2)) && {wire0, wire7}))));
      if ({(wire10[(3'h5):(2'h3)] ?
              (((wire11 ? wire2 : (8'h9d)) ?
                  wire0 : $signed(wire8)) << wire2[(1'h1):(1'h0)]) : $signed((wire4 ?
                  wire9 : ((8'hbd) >= wire3))))})
        begin
          if (wire3[(4'h8):(4'h8)])
            begin
              reg14 <= $signed(wire2);
              reg15 <= $unsigned(wire1[(2'h3):(2'h3)]);
            end
          else
            begin
              reg14 <= wire3[(4'hb):(4'hb)];
              reg15 <= {{$signed((wire1[(3'h4):(3'h4)] ? reg12 : wire6)),
                      $unsigned($unsigned(((8'h9c) ? reg12 : wire7)))},
                  $signed($signed($unsigned($signed(wire3))))};
              reg16 <= reg14[(1'h0):(1'h0)];
              reg17 <= $signed($unsigned(wire3));
              reg18 <= ((((~^$signed(wire6)) ?
                  reg16 : $signed($signed(reg14))) - $signed(reg12)) ^~ reg13);
            end
          if (reg14[(2'h2):(1'h0)])
            begin
              reg19 <= reg15;
              reg20 <= (!((wire3[(3'h5):(1'h1)] >= ((reg12 && (8'ha1)) ?
                      (^wire11) : $unsigned(wire1))) ?
                  (~|(8'hbe)) : ((-(reg15 ? (8'haa) : wire4)) ?
                      $unsigned($signed(wire6)) : wire7)));
            end
          else
            begin
              reg19 <= (!$unsigned(reg13));
              reg20 <= (reg12 <<< reg19[(4'he):(3'h4)]);
              reg21 <= wire3[(4'hc):(1'h0)];
              reg22 <= (~&$signed((((-reg16) | $unsigned(reg17)) == (^$unsigned(wire2)))));
              reg23 <= reg5;
            end
          reg24 <= (+(^~$signed(wire1)));
          reg25 <= {($unsigned(wire0[(5'h14):(4'hb)]) ^~ reg15),
              ($signed($unsigned((wire10 <<< reg13))) ?
                  {($unsigned(wire2) ? $unsigned((8'ha4)) : wire6),
                      $signed($signed(wire11))} : wire11)};
        end
      else
        begin
          reg14 <= wire2[(2'h2):(2'h2)];
          reg15 <= (wire1 * (^~reg22[(3'h4):(3'h4)]));
          reg16 <= (($unsigned(wire11[(1'h1):(1'h0)]) ?
              reg16[(3'h5):(1'h0)] : ({wire7,
                  {(8'haf)}} ^~ ($unsigned(wire4) ^~ wire8))) >>> {$signed(reg15)});
        end
      if ($signed($signed($unsigned(reg20[(3'h5):(3'h4)]))))
        begin
          reg26 <= $signed($unsigned(((reg14[(3'h7):(3'h6)] ?
              (wire8 && wire9) : reg5[(2'h2):(1'h1)]) != {reg23[(1'h1):(1'h1)],
              reg20[(2'h2):(2'h2)]})));
          reg27 <= wire7;
          reg28 <= ((wire4 >>> $signed((-$signed(wire3)))) ?
              ($signed((reg20 ? reg18[(4'he):(4'hc)] : (reg21 ^ reg27))) ?
                  reg27[(5'h13):(5'h10)] : $unsigned((!(wire9 ^~ reg24)))) : $unsigned((8'hb6)));
          reg29 <= wire7[(4'he):(4'h9)];
          reg30 <= ((!($signed($signed((8'hb9))) ?
              reg20[(5'h10):(4'hc)] : ((reg24 && wire11) < $signed((8'ha7))))) ^~ (^reg25[(2'h3):(1'h1)]));
        end
      else
        begin
          if ((|$signed((!$unsigned($signed(reg24))))))
            begin
              reg26 <= (($unsigned(($signed(reg26) ?
                          (reg28 ? wire0 : reg5) : $signed(wire3))) ?
                      ($unsigned(reg28[(4'h8):(2'h3)]) << reg29) : {$unsigned((^~(8'hb1)))}) ?
                  ($signed(($signed(wire9) ? (8'ha4) : (+reg16))) ?
                      wire11 : (^reg18[(2'h2):(1'h1)])) : {reg30});
              reg27 <= ({$unsigned({$signed(wire6), (^reg30)}),
                      {{{reg16}, (wire3 ? reg20 : reg29)},
                          wire9[(3'h4):(1'h0)]}} ?
                  $signed({((reg5 >= wire0) ? $signed(reg30) : reg23),
                      reg24[(4'h8):(3'h7)]}) : ((8'hbd) | reg29[(1'h1):(1'h0)]));
              reg28 <= {reg27};
              reg29 <= (+(~$signed(reg26[(3'h5):(2'h3)])));
            end
          else
            begin
              reg26 <= reg22[(1'h0):(1'h0)];
              reg27 <= (($signed({$signed(wire0),
                  (reg26 ? (8'hae) : reg24)}) || (~&wire7)) <= wire1);
              reg28 <= reg23[(4'h8):(1'h0)];
            end
          reg30 <= reg18;
          reg31 <= $signed((($unsigned(reg13[(2'h3):(2'h2)]) || (^~((7'h44) <<< reg15))) ^ ((8'ha9) ?
              reg23 : (~^(reg30 && reg13)))));
          reg32 <= ((!($signed(reg17[(5'h12):(4'he)]) ?
              $unsigned($signed(reg14)) : reg20[(4'ha):(2'h3)])) ~^ reg26[(4'h9):(4'h9)]);
          reg33 <= (reg5 * wire10);
        end
    end
  assign wire34 = ({$signed((8'ha3)),
                      (8'haf)} <= (($signed(reg23[(2'h3):(2'h3)]) - ($signed(wire3) ?
                          $unsigned(reg29) : reg16[(3'h7):(2'h3)])) ?
                      ((+(8'hb6)) ?
                          ({wire3,
                              reg20} && (wire3 | reg24)) : (^(&reg33))) : {reg20[(4'h9):(3'h6)]}));
  assign wire35 = (reg15 != wire4);
  always
    @(posedge clk) begin
      reg36 <= (reg13 > $unsigned((reg29[(1'h1):(1'h1)] ?
          ($signed(reg5) ? wire34 : $unsigned((8'hbe))) : reg28)));
      reg37 <= $signed((reg30[(3'h6):(2'h3)] ?
          ($unsigned(wire7[(1'h0):(1'h0)]) ?
              (wire9 ?
                  (-reg36) : $unsigned(reg17)) : ($signed(wire34) ^~ $unsigned(reg27))) : wire10[(3'h4):(2'h3)]));
    end
  assign wire38 = (8'haa);
  always
    @(posedge clk) begin
      reg39 <= (wire10[(2'h2):(1'h0)] << wire8[(4'h8):(1'h1)]);
    end
  assign wire40 = $unsigned((!wire11));
  assign wire41 = $signed((!reg15));
endmodule
