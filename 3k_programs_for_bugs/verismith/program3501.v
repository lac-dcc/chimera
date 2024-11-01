module top
#(parameter param81 = (((((&(8'haa)) && {(8'ha6), (8'hb8)}) << {((8'h9d) ? (8'hb3) : (8'hb8)), ((8'ha4) || (8'hbe))}) ? ((((8'hb3) ? (7'h44) : (8'ha2)) >>> (8'hb3)) ? (8'ha6) : (((8'haa) == (8'h9e)) && ((8'hbb) ? (7'h43) : (8'h9f)))) : (((+(8'hb8)) - (~&(8'hb8))) ? (((8'hae) ? (8'h9d) : (8'ha5)) * {(8'ha1), (8'hae)}) : (^~((8'hb2) && (8'hb0))))) * (~&(~(~((8'hb3) ? (8'hb7) : (8'hb5)))))), 
parameter param82 = (((~|{param81}) ^ ((+(param81 - param81)) ? ({param81, param81} ? param81 : (param81 ? param81 : param81)) : ({(8'ha1), param81} <<< (param81 ? (8'hb9) : param81)))) >>> ({((^~param81) ? {(8'ha5)} : {param81})} << (~(param81 ? (param81 << param81) : param81)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg4 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire74,
                 wire58,
                 wire57,
                 wire55,
                 wire6,
                 wire5,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ({(wire0 ? $signed(wire2[(1'h0):(1'h0)]) : (+$signed(wire1)))} ?
          {$unsigned((+$signed(wire0))),
              $signed((((8'ha1) ?
                  (8'hb1) : wire3) && wire1))} : $signed(wire2[(3'h5):(2'h2)]));
    end
  assign wire5 = reg4;
  assign wire6 = (!$signed(wire1));
  module7 #() modinst56 (wire55, clk, wire6, wire5, wire2, wire3);
  assign wire57 = wire2[(5'h12):(4'hf)];
  assign wire58 = wire0[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      if (wire0[(4'hb):(2'h2)])
        begin
          reg59 <= $signed((({((7'h43) ? wire3 : (8'hb3))} ?
                  wire57[(1'h0):(1'h0)] : (!wire3[(2'h2):(2'h2)])) ?
              ($unsigned({wire0, wire55}) ?
                  wire5 : ((wire5 ^ wire5) & (wire55 ?
                      wire5 : reg4))) : (~$signed($signed(wire0)))));
          reg60 <= (~^$unsigned((|$signed(wire58[(4'hb):(2'h2)]))));
          reg61 <= wire5[(4'h9):(4'h8)];
          if ({reg60, wire2})
            begin
              reg62 <= $signed((~|$signed((|(wire6 ? reg4 : reg60)))));
              reg63 <= (($unsigned((&$unsigned((7'h43)))) >= reg60[(3'h6):(3'h4)]) == wire0[(4'h9):(4'h9)]);
              reg64 <= $signed((|(~|{reg4[(5'h10):(4'ha)], $unsigned(wire5)})));
            end
          else
            begin
              reg62 <= (~^wire2[(4'he):(3'h4)]);
              reg63 <= ($signed(((~|$signed(reg63)) * wire57)) >>> $unsigned($unsigned(({wire6,
                  wire5} || (|wire3)))));
            end
          reg65 <= (~^{($unsigned($unsigned(reg60)) ~^ ({wire2, (8'hb5)} ?
                  (-wire0) : (wire6 ? wire3 : wire57))),
              $unsigned($signed((|(8'ha0))))});
        end
      else
        begin
          reg59 <= wire5[(3'h5):(3'h4)];
          reg60 <= ($unsigned(reg59) >> $signed(($unsigned((^~wire2)) > wire57)));
          reg61 <= wire5[(1'h0):(1'h0)];
        end
      if ($unsigned($unsigned(reg63)))
        begin
          reg66 <= ((~^wire0) == reg59);
          reg67 <= ($unsigned(wire55) ?
              $unsigned(wire2[(3'h6):(3'h4)]) : (~|$signed({wire57,
                  (-reg62)})));
          reg68 <= {reg59[(2'h2):(2'h2)],
              (reg64[(4'he):(3'h5)] ? (!$unsigned(wire6)) : reg64)};
          if (reg4[(4'hc):(1'h1)])
            begin
              reg69 <= $unsigned(wire3[(4'he):(4'ha)]);
              reg70 <= reg61[(3'h7):(1'h1)];
              reg71 <= ($signed($signed((&$unsigned(reg62)))) ?
                  (($unsigned(reg61) >> $unsigned(reg68)) ?
                      $unsigned(wire55[(2'h3):(2'h2)]) : (&wire5)) : (~|$signed(reg67[(1'h1):(1'h1)])));
              reg72 <= $signed($unsigned((~$signed($signed(wire1)))));
            end
          else
            begin
              reg69 <= (-{$unsigned(wire58),
                  ($signed(wire3[(5'h13):(1'h0)]) ?
                      (reg62[(1'h0):(1'h0)] ^ reg62) : (wire6 || reg62))});
              reg70 <= $signed({$signed((8'had))});
              reg71 <= wire2;
              reg72 <= reg67;
            end
        end
      else
        begin
          reg66 <= (~|(reg59 ? reg64[(4'hf):(3'h6)] : (reg64 ? wire5 : wire3)));
          reg67 <= reg64;
          reg68 <= $signed(reg68);
        end
      reg73 <= $unsigned((wire55[(2'h3):(1'h0)] ?
          (+$unsigned(reg60[(4'hc):(2'h3)])) : ((!reg61[(2'h3):(2'h3)]) ?
              reg63 : $signed(reg62[(4'hc):(2'h2)]))));
    end
  assign wire74 = (($unsigned(((reg67 < reg62) ?
                              (reg68 ? wire57 : wire1) : ((8'hbc) || reg61))) ?
                          (~&(8'hb6)) : ((+(^reg62)) > ((reg64 - reg4) >= (wire57 ?
                              wire6 : (8'hb2))))) ?
                      ($signed((~$unsigned(reg4))) ?
                          ((^(^reg70)) >>> reg64) : (+(~^((8'hb2) ?
                              reg73 : (8'ha6))))) : (({(reg62 || reg61),
                                  reg62} ?
                              reg73 : $unsigned($signed(reg65))) ?
                          wire6 : reg59));
  always
    @(posedge clk) begin
      reg75 <= reg71[(3'h4):(3'h4)];
      reg76 <= reg63;
      reg77 <= (!reg72);
      reg78 <= (reg77 ^~ wire1[(4'h9):(2'h2)]);
    end
  assign wire79 = $unsigned($unsigned(reg70));
  assign wire80 = ($signed(wire2) <= $signed($unsigned({(reg77 ? reg63 : reg62),
                      reg77[(3'h4):(2'h2)]})));
endmodule

module module7
#(parameter param54 = {({(~&((8'hb3) | (8'ha9))), ((~(7'h42)) & (~(7'h41)))} | ((8'had) * (~&(-(8'h9c))))), (&(~^(~&(!(8'hb9)))))})
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire50;
  assign y = {wire53, wire52, wire12, wire13, wire50, (1'h0)};
  assign wire12 = wire8[(4'hd):(2'h3)];
  assign wire13 = (^$unsigned(wire8[(4'hd):(3'h5)]));
  module14 #() modinst51 (wire50, clk, wire9, wire10, wire13, wire8, wire12);
  assign wire52 = wire8[(4'h9):(2'h2)];
  assign wire53 = (^(8'ha0));
endmodule

module module14  (y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire [(3'h7):(1'h0)] wire17;
  input wire [(5'h10):(1'h0)] wire16;
  input wire signed [(4'hb):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire20;
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire20,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire20 = $unsigned(wire17[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg21 <= wire16;
      reg22 <= (~^{wire15,
          ((~^(&wire19)) ?
              $signed((+wire20)) : ($signed((8'hae)) ?
                  $unsigned(wire18) : (~&reg21)))});
      reg23 <= $unsigned($signed((8'ha3)));
    end
  always
    @(posedge clk) begin
      reg24 <= $signed({wire19[(1'h0):(1'h0)], {wire20}});
      reg25 <= $unsigned({reg24[(2'h2):(1'h1)]});
      reg26 <= ($unsigned(wire20) ^~ $unsigned(reg21));
      if (((+(wire19[(3'h7):(1'h0)] ?
          reg25[(2'h3):(2'h2)] : (!{wire19,
              reg23}))) ^ (+(!$signed($signed((8'hb4)))))))
        begin
          if ({(~^$unsigned((((8'hb8) + wire18) ?
                  $signed(wire17) : reg24[(2'h3):(1'h0)])))})
            begin
              reg27 <= $signed((((wire18[(5'h15):(4'ha)] & (reg22 ?
                      (8'haa) : wire18)) ?
                  reg23[(1'h0):(1'h0)] : (wire17[(3'h4):(1'h1)] ?
                      (~|wire19) : reg23[(1'h1):(1'h0)])) && (^(~&(-reg21)))));
              reg28 <= (-($unsigned(wire18) & $unsigned({wire19,
                  (wire18 ? reg21 : (8'ha4))})));
              reg29 <= $unsigned($signed(($unsigned((wire15 <= reg26)) ?
                  $unsigned(reg26[(4'h9):(3'h4)]) : $signed($signed((8'ha9))))));
            end
          else
            begin
              reg27 <= wire19[(1'h0):(1'h0)];
              reg28 <= $unsigned((reg23 ?
                  $unsigned(reg23) : wire20[(3'h5):(2'h3)]));
            end
          if ((~|reg23[(2'h3):(1'h0)]))
            begin
              reg30 <= ($signed($signed({$unsigned(reg22), $signed(wire16)})) ?
                  $signed(((^wire15) ?
                      ((reg28 ?
                          wire17 : reg29) << reg26) : (-$signed(wire19)))) : {(&(^~(|(8'h9e))))});
              reg31 <= $signed(wire18[(2'h2):(1'h0)]);
              reg32 <= reg30;
              reg33 <= (reg29[(3'h5):(2'h2)] ?
                  (^reg25) : $signed($unsigned($signed((wire17 ?
                      reg27 : wire16)))));
              reg34 <= (+wire16);
            end
          else
            begin
              reg30 <= $signed((($signed(reg22[(4'hb):(4'hb)]) ?
                  $signed((wire18 >= reg25)) : $unsigned((wire16 ?
                      reg22 : wire16))) & (7'h42)));
              reg31 <= $signed($unsigned({((wire19 ? (8'hb6) : reg33) ?
                      {reg34} : reg25[(1'h0):(1'h0)]),
                  $signed({wire17, wire17})}));
              reg32 <= (8'hb0);
              reg33 <= $unsigned(reg28[(1'h1):(1'h0)]);
            end
          if ((+(reg23[(2'h2):(1'h1)] ?
              $unsigned($unsigned(reg27[(1'h1):(1'h0)])) : $unsigned(((reg29 ?
                      reg31 : reg29) ?
                  (wire17 ? reg25 : reg26) : (^~wire19))))))
            begin
              reg35 <= ((!(~^$unsigned(((7'h44) != (8'ha0))))) <= ($unsigned(wire16) << (8'hbd)));
              reg36 <= reg34[(3'h6):(1'h1)];
            end
          else
            begin
              reg35 <= $signed(reg28[(2'h2):(1'h1)]);
              reg36 <= {reg29[(1'h1):(1'h0)]};
              reg37 <= (~|reg21[(5'h10):(1'h0)]);
              reg38 <= $unsigned($signed(reg32[(2'h2):(2'h2)]));
            end
          reg39 <= ((reg24 - ((reg37[(4'h8):(3'h7)] * (reg35 ^ reg29)) ?
                  reg21 : ((reg34 ? wire17 : reg31) ?
                      ((8'hb8) ? wire19 : reg32) : $signed(reg36)))) ?
              reg31[(3'h4):(1'h1)] : ($unsigned(reg33) ?
                  $unsigned(((8'hae) ?
                      reg27[(5'h11):(5'h10)] : reg36[(4'hc):(4'h8)])) : {$signed((&wire16))}));
          reg40 <= wire15[(4'h8):(3'h5)];
        end
      else
        begin
          if ((wire16[(5'h10):(1'h1)] ^ reg38))
            begin
              reg27 <= (reg23[(2'h2):(1'h1)] ?
                  $unsigned(wire16[(4'hd):(2'h2)]) : (reg27 ?
                      reg36[(4'h9):(4'h8)] : wire15[(1'h0):(1'h0)]));
              reg28 <= $unsigned($unsigned(wire18[(1'h0):(1'h0)]));
              reg29 <= (reg40 ?
                  wire16[(3'h7):(3'h6)] : $signed($signed(reg26[(2'h2):(1'h0)])));
              reg30 <= ($unsigned(($unsigned(wire16[(5'h10):(4'h8)]) + ((reg24 == reg38) ?
                      reg24[(3'h5):(3'h4)] : reg28[(2'h2):(1'h0)]))) ?
                  (7'h40) : $signed((^~reg28[(2'h2):(1'h1)])));
            end
          else
            begin
              reg27 <= $unsigned((8'ha7));
              reg28 <= $signed({(&($unsigned(wire20) ?
                      wire18 : $unsigned(reg38))),
                  ($signed(((7'h40) * wire17)) ?
                      $signed((reg32 ?
                          reg33 : reg34)) : $signed((wire18 - reg36)))});
              reg29 <= (7'h43);
            end
          reg31 <= reg33[(3'h5):(3'h5)];
          if ($signed(reg21))
            begin
              reg32 <= $signed(($unsigned($unsigned((reg28 ?
                      (7'h44) : reg23))) ?
                  $unsigned({reg30[(5'h12):(4'ha)],
                      $signed(wire17)}) : wire17[(3'h7):(3'h6)]));
            end
          else
            begin
              reg32 <= ($unsigned($signed(((&reg26) ?
                  (wire18 ? reg30 : reg39) : (reg27 >= reg34)))) << reg38);
            end
          reg33 <= $signed(reg27[(5'h11):(4'he)]);
          if ((reg25[(1'h1):(1'h1)] ?
              $unsigned($signed(wire19)) : (($signed((reg39 < reg33)) ?
                      ((wire19 && reg40) ?
                          $unsigned(reg27) : $signed(reg21)) : $signed((reg34 >> reg38))) ?
                  $unsigned($signed(wire15)) : ($signed((reg37 * reg32)) && $signed(((8'hbf) | reg29))))))
            begin
              reg34 <= (~|wire18[(4'h8):(3'h7)]);
              reg35 <= (reg39 ?
                  ((($unsigned(reg33) ? reg38 : (reg23 <<< reg39)) ?
                          (~^reg32[(1'h1):(1'h1)]) : ($unsigned(reg29) ?
                              {reg23} : $unsigned(reg37))) ?
                      (reg40 << $signed($signed(reg28))) : (~$signed((reg24 ?
                          wire17 : reg30)))) : ({reg21,
                      $unsigned((wire15 - wire17))} < ($unsigned((~&(8'hbb))) ?
                      reg24 : $unsigned($signed(reg22)))));
              reg36 <= reg32;
            end
          else
            begin
              reg34 <= wire19[(4'h9):(3'h6)];
              reg35 <= $signed(wire15);
            end
        end
      reg41 <= (^~(^$signed({wire17[(3'h7):(3'h6)], (!(8'hb6))})));
    end
  assign wire42 = $signed($unsigned((^~$unsigned((~(8'hba))))));
  assign wire43 = reg28;
  assign wire44 = (reg29 <= reg33);
  assign wire45 = reg36;
  assign wire46 = {$signed(wire19),
                      ((reg33[(2'h2):(1'h0)] & wire17[(3'h4):(3'h4)]) == ((^$unsigned((8'hab))) ?
                          {(-wire42)} : ({reg28, wire15} ?
                              reg25 : (~^reg24))))};
  assign wire47 = (~wire17);
  assign wire48 = (($signed($unsigned($signed(reg25))) - wire42) || ((^wire44[(1'h1):(1'h0)]) > ($signed($unsigned(reg22)) ?
                      reg26 : (-(wire46 == reg36)))));
  assign wire49 = $unsigned({($unsigned($signed(reg33)) ~^ reg38)});
endmodule
