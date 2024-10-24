module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h210):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg4 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  assign y = {wire65,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 reg68,
                 reg67,
                 reg4,
                 reg5,
                 reg6,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
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
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((($unsigned($unsigned(wire2)) ?
          {(wire2 >> wire3),
              (wire1 ?
                  (8'hbc) : wire0)} : wire0) | wire3) ~^ ($unsigned(wire0[(4'h8):(2'h3)]) ?
          wire2 : $unsigned((wire2 || $unsigned(wire0)))));
      reg5 <= (8'had);
      reg6 <= $signed($signed((^reg5)));
    end
  assign wire7 = (&{$unsigned(((wire1 ? wire1 : (8'hb9)) * (8'h9e))),
                     ($signed($signed(reg6)) >> ((reg5 ?
                         reg6 : (8'haa)) != $unsigned((8'hba))))});
  assign wire8 = {wire0[(3'h5):(3'h5)],
                     $unsigned($unsigned(wire1[(2'h3):(1'h0)]))};
  assign wire9 = wire1[(2'h3):(2'h3)];
  assign wire10 = wire2[(4'hb):(3'h5)];
  assign wire11 = ({wire8} & $unsigned((^((8'ha1) ?
                      (reg6 ? wire0 : wire0) : $unsigned(wire3)))));
  always
    @(posedge clk) begin
      reg12 <= wire9;
      reg13 <= (-((((reg12 ? reg4 : reg4) ?
              $signed(wire3) : reg6[(3'h4):(3'h4)]) ?
          {(8'ha3)} : reg6) <= wire1[(3'h4):(1'h0)]));
      reg14 <= wire11[(3'h7):(2'h3)];
      reg15 <= wire0;
    end
  assign wire16 = $unsigned($signed($signed($signed(reg6[(3'h7):(1'h1)]))));
  assign wire17 = wire1;
  assign wire18 = (~|$signed(reg14));
  assign wire19 = (8'hae);
  assign wire20 = $signed($unsigned(($unsigned((reg14 + (8'hb2))) <<< wire10)));
  assign wire21 = (reg13 ^ $unsigned((-{(reg6 <= reg12)})));
  assign wire22 = (~|wire0[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg23 <= $signed((~|wire3));
      if (wire1)
        begin
          reg24 <= reg4;
          reg25 <= (^~(reg5[(3'h4):(1'h1)] * $signed((|(8'hb5)))));
          reg26 <= (reg5 ^ (wire2 << $signed(($signed((8'haa)) >= wire19[(2'h3):(2'h3)]))));
        end
      else
        begin
          reg24 <= $signed((($signed({reg23, wire22}) ?
              (!reg13) : wire11) && ((8'hb1) ?
              ({wire19, reg14} ? $signed(wire0) : (|wire22)) : wire21)));
          if (reg24[(4'h8):(4'h8)])
            begin
              reg25 <= $signed({wire16});
              reg26 <= wire1;
              reg27 <= (-(-(!wire21)));
              reg28 <= (~&{(!(wire8[(2'h2):(1'h1)] != {reg5, reg14})),
                  reg25[(2'h2):(1'h0)]});
              reg29 <= (((&reg6) ?
                  $unsigned((^$signed(reg5))) : $unsigned($unsigned((wire2 == reg4)))) >> $unsigned(($signed(reg6) ?
                  (wire0 <<< wire11[(3'h5):(1'h1)]) : (-(wire11 || (8'haf))))));
            end
          else
            begin
              reg25 <= (reg28[(3'h5):(2'h2)] ?
                  {$unsigned({(|wire3)}),
                      $signed($signed($signed(reg29)))} : $unsigned((~&$signed((reg29 <= (8'hb4))))));
              reg26 <= {reg5[(3'h6):(2'h3)]};
              reg27 <= $unsigned($signed($unsigned((-$unsigned(wire20)))));
            end
          reg30 <= $unsigned(($signed(reg24[(4'he):(4'he)]) ?
              {reg12[(3'h7):(1'h0)]} : (wire10 ?
                  $signed((~&reg6)) : (|(|wire20)))));
        end
      if ({(reg5[(2'h3):(1'h0)] == ($signed(reg25[(2'h2):(1'h1)]) & {$unsigned(reg4),
              $unsigned(reg29)}))})
        begin
          reg31 <= $signed($signed(wire1[(2'h2):(2'h2)]));
          reg32 <= {$signed({((-wire19) ?
                      (wire0 && wire18) : reg26[(5'h10):(4'hf)])}),
              ($signed(reg30) ?
                  $signed(wire11[(2'h2):(1'h0)]) : $unsigned(wire9))};
        end
      else
        begin
          if (wire0)
            begin
              reg31 <= ((($unsigned(reg14) ?
                          ($signed(wire18) ?
                              $signed(wire21) : (-wire11)) : {(-(8'hbe)),
                              $signed((8'hb6))}) ?
                      (-(7'h41)) : reg14[(4'h9):(3'h4)]) ?
                  ((&reg31) ?
                      reg30[(5'h10):(1'h1)] : (~|(^$unsigned((8'h9c))))) : {(((+reg29) ?
                          $signed(reg25) : $unsigned(wire10)) * {$unsigned(reg28),
                          $signed(wire22)}),
                      wire20[(4'h9):(3'h7)]});
            end
          else
            begin
              reg31 <= wire8;
              reg32 <= (($unsigned(({wire20, reg12} < wire9[(4'hf):(4'h8)])) ?
                  reg27[(1'h1):(1'h0)] : reg24[(1'h0):(1'h0)]) ^~ (wire1 ?
                  (($signed(reg23) ? (wire0 == wire21) : (~^wire16)) << (wire7 ?
                      $unsigned(wire11) : wire9[(1'h0):(1'h0)])) : wire9[(3'h7):(2'h2)]));
              reg33 <= $signed(($unsigned(wire17) || reg32));
              reg34 <= {(8'haa),
                  {reg13,
                      ({(^reg14), $unsigned(wire22)} ?
                          ($signed(wire9) ?
                              $signed(wire19) : $signed(wire22)) : (!reg12[(2'h3):(2'h3)]))}};
              reg35 <= $signed(wire10);
            end
          reg36 <= (($unsigned((reg26[(3'h6):(3'h5)] ?
              $signed((8'hb5)) : wire1[(1'h1):(1'h1)])) && $signed((wire2 ?
              ((8'hb7) ? (8'h9d) : reg4) : (reg25 ?
                  wire20 : reg14)))) * $unsigned(((^$unsigned((8'had))) << (^(8'hb1)))));
          reg37 <= {(8'hbd), $signed($unsigned(reg5[(3'h7):(2'h3)]))};
          reg38 <= ({reg31} ? reg33 : reg31[(4'hc):(4'ha)]);
        end
      if ((^~($unsigned((~|reg35)) ?
          (((|reg4) ?
              (reg30 ? wire3 : reg37) : (wire9 ?
                  reg26 : (7'h44))) >>> (~^(wire7 ?
              reg15 : reg15))) : ($signed(reg13[(2'h3):(1'h1)]) ?
              (^reg30[(2'h2):(2'h2)]) : (wire7 <= {reg36})))))
        begin
          reg39 <= (((((~reg32) ? $signed(reg34) : (reg24 != reg33)) ?
                      (-((8'hbf) ? reg29 : reg31)) : (reg24 ?
                          wire9[(4'h8):(1'h0)] : $unsigned(wire18))) ?
                  $unsigned(((wire18 >> wire22) << reg31[(4'hc):(2'h2)])) : wire1[(3'h4):(2'h2)]) ?
              wire17 : (wire11 == $signed(wire8)));
          reg40 <= {$signed($signed(((~&(8'hbc)) ?
                  reg27 : wire0[(4'h9):(4'h8)])))};
          reg41 <= wire1[(1'h1):(1'h1)];
        end
      else
        begin
          reg39 <= (8'hac);
          reg40 <= (($unsigned(wire19[(1'h1):(1'h0)]) ?
              $signed(((+wire2) ?
                  (reg12 ?
                      wire22 : (8'h9d)) : (reg32 != wire11))) : $signed(wire11)) <= ((reg39[(3'h7):(3'h7)] && ($signed(reg27) >= reg37[(4'h8):(4'h8)])) ?
              ((((8'hb5) ? wire16 : (8'ha0)) | (+wire17)) ?
                  (^~wire9[(1'h0):(1'h0)]) : (~|((8'hb5) ?
                      wire17 : wire10))) : $unsigned((~&{(8'hb3)}))));
          if ({($unsigned(({(8'hbc)} ?
                  (wire2 << reg35) : wire8[(3'h6):(3'h6)])) >> {({wire8} ?
                      (^(8'hb5)) : (wire7 ? reg33 : reg38)),
                  (~&reg25)}),
              {$signed($signed((reg34 < wire21)))}})
            begin
              reg41 <= $signed((+($signed((wire22 ? reg37 : wire21)) ?
                  $signed((-wire18)) : ($unsigned(reg30) ?
                      $signed(reg37) : (!wire22)))));
              reg42 <= $signed($unsigned(reg34[(4'h8):(1'h1)]));
              reg43 <= (~&{((~(reg5 >= wire7)) < {$signed(wire11),
                      ((8'haf) ? wire17 : reg39)}),
                  reg28[(3'h4):(3'h4)]});
            end
          else
            begin
              reg41 <= ((7'h44) ?
                  $unsigned((~|wire9[(4'hd):(1'h1)])) : wire10[(3'h4):(2'h3)]);
              reg42 <= reg30[(3'h7):(3'h4)];
              reg43 <= $unsigned(reg34);
              reg44 <= ($unsigned(({reg31[(1'h1):(1'h1)],
                  ((7'h42) > wire17)} || ((~^wire21) ?
                  wire10 : (reg43 + wire3)))) ~^ wire7[(4'hb):(2'h3)]);
            end
          reg45 <= reg37;
        end
    end
  module46 #() modinst66 (wire65, clk, reg32, reg43, wire1, wire16, reg40);
  always
    @(posedge clk) begin
      reg67 <= reg41;
      reg68 <= (wire1[(3'h7):(2'h3)] - (&(reg31 ? reg36 : (8'hb5))));
    end
endmodule

module module46
#(parameter param64 = (((&(~^((8'ha4) ? (8'haa) : (8'h9f)))) | ((^~((8'hbf) ? (8'ha1) : (8'hac))) ? (-(~^(8'ha8))) : (((7'h43) ? (8'hab) : (8'hba)) & ((8'ha2) ? (8'hb0) : (8'hbf))))) >>> ((^~{(^~(8'h9c))}) != ((((8'ha7) * (8'h9f)) ? ((8'ha9) ? (8'haf) : (8'hbc)) : ((8'ha6) ? (8'hac) : (8'hba))) ^ (((8'hbe) ? (8'ha9) : (8'hb1)) ? ((8'hb0) ? (8'hbd) : (8'ha4)) : {(7'h41), (8'h9f)})))))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire51;
  input wire signed [(3'h7):(1'h0)] wire50;
  input wire [(5'h12):(1'h0)] wire49;
  input wire signed [(5'h10):(1'h0)] wire48;
  input wire signed [(3'h4):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire59;
  wire [(3'h4):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 (1'h0)};
  assign wire52 = wire47[(3'h4):(3'h4)];
  assign wire53 = wire51[(3'h4):(2'h3)];
  assign wire54 = (((8'hbf) ^~ (~(^(wire49 * wire47)))) <= wire53);
  assign wire55 = ($signed(wire51) < $signed((wire51 ?
                      $signed((wire53 * wire51)) : $unsigned($signed(wire50)))));
  assign wire56 = $signed($signed(wire51));
  assign wire57 = $unsigned((~^(wire53[(4'h8):(3'h6)] << (8'hbb))));
  assign wire58 = ({(($unsigned(wire51) + (wire51 > wire52)) ?
                              $unsigned((^wire56)) : wire52[(4'hb):(3'h6)])} ?
                      $signed({$unsigned((&wire49)),
                          $unsigned((~|wire47))}) : (((8'hb5) ?
                              wire57[(2'h2):(2'h2)] : $unsigned(wire57[(1'h0):(1'h0)])) ?
                          $unsigned((wire55[(2'h2):(1'h1)] ?
                              $signed((8'ha5)) : wire54[(5'h14):(2'h3)])) : $signed($unsigned(wire49[(4'he):(4'h8)]))));
  assign wire59 = (~^$signed($unsigned((!wire50))));
  assign wire60 = ((&$signed($unsigned((|wire55)))) || $unsigned(wire52));
  assign wire61 = wire52;
  assign wire62 = wire56[(2'h3):(1'h1)];
  assign wire63 = {$signed((((^(8'ha3)) >>> wire57) << wire47[(1'h1):(1'h1)])),
                      (|wire50[(2'h3):(1'h1)])};
endmodule
