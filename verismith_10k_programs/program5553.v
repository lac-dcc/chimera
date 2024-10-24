module top
#(parameter param69 = {((!(~|{(8'hb4), (7'h41)})) <= (((8'hb1) < ((8'ha2) ? (8'haf) : (8'hb6))) ? (((8'h9f) >= (8'ha4)) + (!(8'ha6))) : ({(7'h43)} ? ((7'h41) != (8'haf)) : {(8'hbc)})))}, 
parameter param70 = ((((~^(param69 ? param69 : param69)) ? (param69 + param69) : param69) ? (((param69 ? param69 : param69) >> param69) <= ((param69 - (8'haa)) ? (param69 >> param69) : (param69 + (8'hbc)))) : ((^(!param69)) ? (!(param69 ? param69 : param69)) : ((param69 ? param69 : param69) ? param69 : (param69 ? param69 : param69)))) ? ({param69} || param69) : param69))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h203):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire67;
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire17,
                 wire18,
                 wire33,
                 wire34,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire67,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 (1'h0)};
  assign wire5 = $signed(((!wire2) < (8'had)));
  assign wire6 = $unsigned($unsigned({{(~wire0)}, $signed({wire4, wire0})}));
  assign wire7 = $unsigned(wire1);
  always
    @(posedge clk) begin
      reg8 <= $signed($unsigned(((&$signed(wire3)) ?
          $signed((wire1 ? wire3 : wire5)) : ((wire0 ? wire2 : wire7) ?
              (wire0 - (8'hbd)) : wire4[(4'hc):(4'hc)]))));
      if ({($unsigned(wire1[(1'h0):(1'h0)]) > (^~(wire5 ?
              $unsigned((7'h41)) : (wire1 ? wire3 : wire0))))})
        begin
          reg9 <= $unsigned(wire1);
          reg10 <= (($signed(wire4[(2'h3):(2'h2)]) <<< (^$unsigned($unsigned(wire7)))) ^~ $signed(wire2));
        end
      else
        begin
          reg9 <= reg9;
          reg10 <= (((8'haa) ?
                  {$unsigned(reg9[(5'h14):(1'h0)]),
                      ((wire5 != reg8) * (wire0 - wire2))} : {(reg9 != reg8[(4'h8):(3'h5)])}) ?
              reg9 : wire1[(3'h4):(1'h1)]);
          reg11 <= ({(wire4 ^~ {$signed(wire1)})} << $unsigned(($signed(reg10[(4'hd):(2'h2)]) > $signed($unsigned(wire2)))));
          if (((!$signed(reg8)) > ($unsigned($signed(((7'h44) ?
              wire3 : wire2))) & (wire5 << (~^$unsigned(reg11))))))
            begin
              reg12 <= (^reg8);
              reg13 <= wire7[(1'h1):(1'h0)];
              reg14 <= ({(~{(wire0 ? reg13 : wire0)}),
                  $signed(wire1)} == ((wire6 * $unsigned(reg11)) ^ reg12));
              reg15 <= {(~^$unsigned($signed({reg12})))};
            end
          else
            begin
              reg12 <= $signed(($unsigned(reg13) ?
                  $unsigned({wire2}) : (&($signed(wire1) ? (^reg13) : reg8))));
              reg13 <= {(^(+$unsigned($signed((8'hae)))))};
            end
        end
      reg16 <= reg8;
    end
  assign wire17 = (+reg12);
  assign wire18 = $signed(reg14);
  always
    @(posedge clk) begin
      reg19 <= {({(wire1 ? wire6 : reg15)} << $unsigned((~{wire17})))};
      if ($unsigned((($signed((reg12 ^~ reg8)) ?
          ((wire1 ? wire4 : (8'ha4)) * $signed(wire4)) : ((+wire17) << (reg16 ?
              reg10 : wire1))) > ($unsigned({wire17, wire18}) ?
          $unsigned(wire3[(3'h4):(3'h4)]) : ((wire7 >= wire3) ?
              $signed(reg13) : $unsigned(reg16))))))
        begin
          if ($unsigned(($signed(reg11[(2'h2):(1'h0)]) ~^ (|$unsigned(wire3)))))
            begin
              reg20 <= ($unsigned((wire18 ?
                  $signed(((8'h9c) ?
                      (8'h9e) : reg12)) : (^~(8'ha5)))) * $unsigned((reg8[(3'h5):(2'h2)] != wire17[(2'h2):(1'h0)])));
            end
          else
            begin
              reg20 <= ((({(reg8 ? reg11 : reg10)} ?
                      wire17 : {(wire18 ? (8'h9c) : reg16),
                          reg9[(5'h12):(4'h8)]}) ?
                  ($unsigned(reg9[(4'hd):(3'h7)]) ^~ reg8[(3'h5):(1'h1)]) : (reg11 != wire18[(3'h5):(2'h3)])) ^ {(~|{(-(8'hbd)),
                      $signed(wire0)}),
                  {$unsigned($signed(wire7)), reg12[(3'h6):(2'h3)]}});
              reg21 <= $unsigned({(~wire5), wire18[(1'h0):(1'h0)]});
              reg22 <= wire0[(2'h2):(2'h2)];
              reg23 <= reg12[(2'h3):(1'h1)];
            end
          reg24 <= ($signed(wire4) ? reg19 : reg9);
        end
      else
        begin
          if ((7'h40))
            begin
              reg20 <= (reg15 - ($signed(reg23) ?
                  ((&(8'had)) & $unsigned($signed(wire17))) : {$signed(reg16[(4'he):(4'hc)])}));
              reg21 <= (wire0[(4'h8):(4'h8)] ~^ {reg23});
              reg22 <= (((8'hb7) - $unsigned(((wire7 && reg8) ?
                      {reg14, (8'hb8)} : wire18[(3'h7):(3'h6)]))) ?
                  (~$signed(((reg15 ?
                      reg12 : wire4) ^ $signed(reg15)))) : $unsigned($signed($unsigned((wire1 < wire3)))));
              reg23 <= ({(-$unsigned((wire2 ? wire18 : reg9))),
                  $signed(((wire7 + reg14) ?
                      reg19 : wire0[(2'h2):(2'h2)]))} + (((!wire2[(3'h4):(3'h4)]) <<< ((wire7 ?
                      reg13 : reg21) ?
                  $signed(wire3) : (wire1 ?
                      wire6 : wire17))) * $unsigned($unsigned((reg13 <<< wire4)))));
            end
          else
            begin
              reg20 <= reg24;
              reg21 <= reg8;
              reg22 <= ((reg13 ?
                  {$signed((reg20 <<< wire0)),
                      reg21[(4'ha):(4'h8)]} : wire2) || wire3);
              reg23 <= reg10[(3'h5):(1'h0)];
              reg24 <= reg10[(1'h0):(1'h0)];
            end
          reg25 <= $signed((reg20 ?
              (reg12 ?
                  {$signed(wire4),
                      reg23[(4'hc):(4'h9)]} : wire0[(3'h6):(1'h1)]) : (^($signed(reg11) ?
                  (-reg20) : (wire5 ? wire3 : reg14)))));
          reg26 <= (+$unsigned($signed(reg22[(1'h0):(1'h0)])));
        end
      reg27 <= $unsigned($unsigned($unsigned(reg9[(4'hc):(4'h8)])));
      if ((~(|$signed({reg15, reg12[(4'hb):(4'h8)]}))))
        begin
          reg28 <= reg9;
        end
      else
        begin
          reg28 <= reg14;
          reg29 <= reg27;
        end
    end
  always
    @(posedge clk) begin
      reg30 <= $unsigned(((reg15[(2'h3):(1'h0)] && (reg11[(5'h12):(4'hf)] | wire7)) && ($unsigned((reg26 || reg28)) + reg19[(2'h2):(1'h0)])));
      reg31 <= $signed({(({reg16} == $unsigned(reg27)) - {$signed(reg24),
              (~wire7)}),
          reg8[(4'ha):(2'h3)]});
      reg32 <= (&($unsigned($unsigned((reg29 ? wire7 : reg14))) & reg22));
    end
  assign wire33 = $unsigned($signed($unsigned((-(reg25 ? reg28 : reg30)))));
  assign wire34 = reg12;
  always
    @(posedge clk) begin
      reg35 <= reg10[(4'h8):(1'h0)];
      reg36 <= reg25;
      reg37 <= (!wire4[(4'h9):(4'h9)]);
      reg38 <= reg19[(3'h5):(3'h4)];
    end
  assign wire39 = $unsigned((reg23[(4'ha):(2'h2)] ?
                      $unsigned({{reg37},
                          reg31[(2'h2):(2'h2)]}) : $unsigned($signed(reg14))));
  assign wire40 = (|$unsigned((8'ha6)));
  assign wire41 = reg28[(5'h10):(2'h3)];
  assign wire42 = $signed($signed(($unsigned($signed(reg24)) * $signed((reg27 ?
                      (8'haa) : wire17)))));
  assign wire43 = (((+{wire1[(3'h6):(3'h6)]}) ?
                          $signed(reg20[(5'h10):(4'hf)]) : ($signed({wire18}) >= wire41)) ?
                      (($signed($unsigned(reg25)) ^ wire33) ?
                          ({(-wire4)} > $unsigned(wire17[(1'h0):(1'h0)])) : (~|$signed((wire40 ?
                              reg23 : reg20)))) : (&wire2));
  assign wire44 = reg36[(5'h15):(5'h12)];
  assign wire45 = $unsigned((7'h41));
  assign wire46 = reg22;
  assign wire47 = {((~&(!$signed((7'h42)))) ~^ (-(~^(reg12 ?
                          wire43 : reg32))))};
  assign wire48 = $signed({reg26, (~|reg36[(3'h6):(2'h2)])});
  module49 #() modinst68 (wire67, clk, reg26, reg25, reg19, wire43);
endmodule

module module49
#(parameter param66 = (({{(!(8'hbe)), (8'haa)}} ? ((((8'hae) ? (7'h42) : (8'ha0)) ? ((8'hbb) | (8'hbf)) : (8'ha7)) <<< {(8'hba)}) : ((((8'hb6) || (8'hb9)) <<< ((8'hb3) ? (8'hbe) : (8'ha7))) ? ((!(8'hba)) ~^ (|(8'ha2))) : (^~{(7'h42), (7'h43)}))) ? (((8'hb0) ? (((8'hb9) != (8'hbd)) ? {(8'hb4)} : (~&(8'hb3))) : {((8'h9d) ? (8'ha0) : (8'hae))}) <<< (8'hba)) : (^~((((8'hba) > (8'ha0)) ~^ (8'hb2)) ? {{(8'hae)}} : {((8'h9d) & (8'hb7)), ((8'ha2) > (8'hb7))}))))
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire53;
  input wire signed [(2'h2):(1'h0)] wire52;
  input wire [(5'h15):(1'h0)] wire51;
  input wire signed [(3'h6):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire55,
                 wire54,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire54 = (8'ha6);
  assign wire55 = $signed(($signed((-((8'ha7) ^~ wire54))) || ((~&wire50) && ($unsigned(wire53) ?
                      wire54 : wire52))));
  always
    @(posedge clk) begin
      if (wire53[(2'h2):(1'h1)])
        begin
          reg56 <= $signed(($unsigned(wire52) ?
              $signed($unsigned((+wire54))) : $unsigned(((wire53 != wire52) & (wire53 ?
                  wire51 : wire55)))));
        end
      else
        begin
          reg56 <= ((reg56 ?
                  (wire51[(3'h7):(1'h1)] & (8'hb9)) : {$signed(reg56),
                      {$signed((7'h40)), (wire52 ? wire54 : (7'h40))}}) ?
              $signed(((+(^~(8'haf))) ?
                  wire54[(4'hd):(2'h2)] : (!$unsigned(wire54)))) : $signed(reg56));
          reg57 <= wire54[(4'hd):(1'h0)];
          if (wire51[(2'h3):(2'h3)])
            begin
              reg58 <= (~reg57);
              reg59 <= (+(($unsigned((^~wire51)) ?
                      {wire53[(4'ha):(1'h1)], wire55} : wire53[(4'hc):(4'h9)]) ?
                  ((wire54 ? wire55 : wire55) ?
                      (8'hbc) : wire52) : {((reg56 && wire52) == $signed(reg57))}));
              reg60 <= {$unsigned({(~^wire54), wire52})};
            end
          else
            begin
              reg58 <= {wire53};
              reg59 <= $signed($signed({reg60}));
              reg60 <= (!(($unsigned($unsigned(wire54)) ?
                  {wire54} : {(-reg60), wire51}) < reg57));
              reg61 <= (~&$unsigned({$unsigned(reg56)}));
              reg62 <= wire51;
            end
        end
      reg63 <= wire55;
    end
  assign wire64 = wire50;
  assign wire65 = {$unsigned(wire55[(4'hf):(1'h0)])};
endmodule
