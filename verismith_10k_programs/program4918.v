module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h23a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire219;
  wire signed [(5'h12):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire219,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire30,
                 wire29,
                 wire11,
                 wire10,
                 wire5,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (~&wire4);
  always
    @(posedge clk) begin
      reg6 <= $unsigned(($signed((~|$signed(wire5))) ?
          (wire0[(3'h4):(2'h2)] ?
              {(wire1 ?
                      (8'hae) : wire1)} : ((~&wire0) >>> $unsigned(wire2))) : wire0));
      reg7 <= reg6[(3'h4):(3'h4)];
      reg8 <= (wire2 ?
          {(($signed(reg7) && $unsigned(wire5)) ?
                  (((8'hb0) ?
                      wire3 : wire4) || (^wire2)) : wire3[(4'ha):(2'h3)])} : $unsigned((&((wire2 ?
                  (8'hb0) : (8'h9d)) ?
              $signed(wire3) : (-wire4)))));
      reg9 <= ($signed({wire1,
          wire3[(5'h12):(5'h11)]}) << $unsigned($signed(($signed(reg8) ?
          wire3 : (!wire2)))));
    end
  assign wire10 = wire1;
  assign wire11 = (((wire5[(4'h9):(2'h3)] | $signed($unsigned((8'hbf)))) ?
                          {(wire4[(2'h3):(1'h1)] ?
                                  $signed(reg7) : reg8[(3'h5):(1'h1)]),
                              ((-reg7) ^ (reg9 + wire4))} : reg8) ?
                      {({$signed(wire10)} ?
                              $signed($unsigned(reg6)) : $unsigned(((8'h9c) != reg6))),
                          $unsigned(((reg8 ? reg6 : wire1) ?
                              $unsigned(wire10) : reg9))} : $unsigned(reg9));
  always
    @(posedge clk) begin
      if ($unsigned($signed({reg6[(1'h0):(1'h0)]})))
        begin
          if (((wire0[(1'h0):(1'h0)] ?
              $unsigned((((8'hb2) ?
                  (8'hab) : (8'h9d)) >>> (~|(8'ha7)))) : {($signed(wire10) ?
                      (wire11 < wire3) : (wire1 ?
                          wire5 : wire4))}) <= {((((8'hb4) - wire5) | (wire1 ?
                  wire11 : reg6)) ~^ $signed(wire5[(3'h5):(3'h5)]))}))
            begin
              reg12 <= wire1[(3'h7):(3'h5)];
            end
          else
            begin
              reg12 <= wire2[(4'hc):(3'h4)];
              reg13 <= reg12;
              reg14 <= ((8'hb5) > (!(~&(~&(wire5 ? wire4 : reg9)))));
              reg15 <= wire5;
            end
          reg16 <= $unsigned($signed(((wire2[(5'h12):(4'h9)] - (reg14 * wire5)) >> reg14)));
          reg17 <= wire4[(4'ha):(3'h7)];
          if ($unsigned($unsigned(((wire11 && $unsigned(reg9)) || $unsigned(wire1)))))
            begin
              reg18 <= $unsigned($unsigned(($unsigned((reg15 ?
                  reg12 : reg16)) <= ($signed(reg7) ?
                  (reg7 ? reg14 : wire10) : $unsigned(reg14)))));
              reg19 <= wire1[(2'h3):(1'h1)];
              reg20 <= {$unsigned($signed({(|reg16)}))};
              reg21 <= wire11;
              reg22 <= (|reg12);
            end
          else
            begin
              reg18 <= (((((wire3 ? wire3 : wire4) << (reg9 ?
                  reg8 : wire4)) * ((reg16 ?
                  wire3 : reg21) != (wire3 ~^ reg15))) | $unsigned({(7'h40),
                  reg21[(1'h1):(1'h1)]})) <= $unsigned($signed(((!wire10) << (wire4 ?
                  wire10 : wire10)))));
              reg19 <= {$signed(wire10[(3'h4):(2'h2)])};
              reg20 <= ($signed($signed({$unsigned(reg15), wire10})) ?
                  $signed($unsigned(reg9)) : $unsigned(((8'haa) ?
                      $signed($unsigned(wire4)) : (reg20 + $signed(reg8)))));
            end
        end
      else
        begin
          if ((!wire5))
            begin
              reg12 <= reg9[(1'h1):(1'h1)];
              reg13 <= ((8'hb5) ?
                  $unsigned($signed(((reg12 == wire3) ?
                      (wire3 | wire11) : wire2))) : (8'hb3));
              reg14 <= (((reg17[(4'h8):(2'h3)] * (8'ha7)) ?
                  wire0 : wire0) >> reg9);
              reg15 <= $signed($unsigned(wire11[(3'h4):(2'h3)]));
            end
          else
            begin
              reg12 <= (reg22[(2'h2):(1'h1)] | (wire5[(2'h2):(2'h2)] >> (|((reg21 ?
                      reg14 : wire3) ?
                  $unsigned(reg15) : (reg14 ? reg15 : (8'haf))))));
            end
          if ((8'hb0))
            begin
              reg16 <= $unsigned($signed($signed(reg15)));
              reg17 <= $unsigned((~&reg15[(3'h6):(1'h0)]));
            end
          else
            begin
              reg16 <= $signed($signed(wire2[(1'h0):(1'h0)]));
              reg17 <= (&{{reg13[(4'hb):(3'h6)]}, wire5[(1'h0):(1'h0)]});
              reg18 <= (reg12[(4'ha):(2'h2)] | {(+((^wire10) + {reg8,
                      reg19}))});
              reg19 <= (reg12[(1'h1):(1'h1)] << {$signed(reg8[(3'h6):(3'h6)])});
            end
        end
      reg23 <= $signed(reg20);
      if (reg9)
        begin
          reg24 <= ($signed(reg20) ? wire0[(2'h2):(1'h0)] : $unsigned(wire3));
          reg25 <= wire10;
        end
      else
        begin
          reg24 <= ($signed($unsigned($unsigned({reg18,
              wire1}))) * $unsigned(($signed($signed((8'ha4))) ?
              ($unsigned(wire0) || (reg20 ^ reg23)) : (8'hb8))));
          reg25 <= ((|(((reg7 ? reg16 : wire0) ? (wire1 * wire0) : (&wire0)) ?
                  $signed({reg22}) : reg24[(1'h0):(1'h0)])) ?
              wire3[(4'ha):(4'h9)] : (8'hb5));
          reg26 <= ({(reg23 ?
                  $signed((reg15 == wire10)) : (^~(reg18 ? reg22 : reg12))),
              $unsigned((reg21[(2'h3):(2'h2)] ?
                  (reg21 >> reg13) : (~reg16)))} && $unsigned(reg14[(2'h2):(1'h1)]));
          reg27 <= (reg8[(2'h3):(2'h3)] ?
              ($unsigned((8'hab)) >> (8'ha5)) : reg8);
          reg28 <= $unsigned({$signed($unsigned((~&wire2))),
              (~wire10[(1'h0):(1'h0)])});
        end
    end
  assign wire29 = ({reg24, {reg18[(1'h1):(1'h1)]}} ?
                      (reg19 ?
                          (~&reg14) : (7'h42)) : $signed($unsigned(reg14)));
  assign wire30 = (|reg28[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg31 <= wire10[(1'h1):(1'h1)];
      reg32 <= $unsigned((reg14 ? (^$unsigned(wire29)) : reg25[(1'h1):(1'h1)]));
      reg33 <= reg15[(4'he):(4'hb)];
      if (reg14[(1'h1):(1'h1)])
        begin
          if (reg6[(3'h6):(1'h1)])
            begin
              reg34 <= (reg6 != (((+reg13) ?
                      (reg19[(1'h0):(1'h0)] < {wire11}) : reg20[(2'h3):(2'h3)]) ?
                  ((^(^~(8'ha1))) ?
                      reg24[(2'h2):(1'h1)] : ((8'hb4) ?
                          $unsigned((8'hb4)) : $signed(wire4))) : (reg6 ?
                      reg6 : (reg24[(2'h2):(2'h2)] ?
                          (~^(8'ha2)) : (~&reg19)))));
            end
          else
            begin
              reg34 <= ((8'hb9) ?
                  reg22[(1'h1):(1'h1)] : $unsigned((reg31 * $signed((+reg19)))));
              reg35 <= ($unsigned($signed(((reg26 <<< reg18) ?
                      $unsigned(reg13) : (reg12 || wire30)))) ?
                  {$unsigned(reg24), $unsigned(reg12)} : reg6);
              reg36 <= wire3[(2'h3):(2'h3)];
              reg37 <= reg25;
              reg38 <= reg25;
            end
          if ((&($signed((+reg27[(3'h6):(1'h0)])) << $signed(((reg22 ?
              reg12 : reg19) != $unsigned(wire11))))))
            begin
              reg39 <= (8'hb3);
            end
          else
            begin
              reg39 <= reg16;
              reg40 <= $signed((($unsigned($unsigned(wire29)) | reg26[(4'hd):(4'hb)]) ?
                  ($unsigned((reg13 ? (8'ha4) : reg23)) ?
                      ($signed(wire29) ?
                          reg13 : $signed(wire3)) : $unsigned($signed(reg7))) : {(~^(wire5 ?
                          wire4 : reg12)),
                      {wire30[(2'h2):(1'h1)], $signed(reg34)}}));
              reg41 <= {reg18[(4'ha):(2'h2)], wire5};
            end
          if ({reg35})
            begin
              reg42 <= ((reg27 ?
                  reg24[(2'h2):(2'h2)] : (~&((reg39 ^ (8'hb6)) ^ (8'hbf)))) <= reg21);
              reg43 <= (reg39[(3'h5):(1'h0)] ?
                  wire0[(1'h1):(1'h1)] : $unsigned({(~(reg37 ?
                          reg38 : reg9))}));
              reg44 <= wire2[(5'h10):(4'hc)];
            end
          else
            begin
              reg42 <= (!({(~^$signed(reg34)),
                  (~(reg16 || reg15))} ^ $signed($signed(reg16))));
              reg43 <= $unsigned(((~$unsigned(reg25[(1'h0):(1'h0)])) ?
                  ((&(reg22 ? reg42 : (7'h44))) ?
                      (^~reg23[(1'h1):(1'h1)]) : (wire29[(1'h0):(1'h0)] ?
                          {reg23,
                              reg21} : $unsigned(wire5))) : (~$signed((!wire1)))));
              reg44 <= reg6;
              reg45 <= reg42[(1'h1):(1'h0)];
              reg46 <= (~|(~^((!{(8'hb0)}) ^~ $unsigned((reg7 ?
                  wire1 : reg38)))));
            end
          reg47 <= ($unsigned(((reg45 ?
              $signed(wire1) : (reg14 != wire5)) ^~ (+$unsigned(reg6)))) * reg8[(3'h6):(3'h4)]);
          reg48 <= reg41[(3'h5):(2'h2)];
        end
      else
        begin
          reg34 <= reg43;
        end
      reg49 <= reg48[(4'ha):(4'ha)];
    end
  assign wire50 = (reg7[(1'h1):(1'h1)] & ((($signed((8'haa)) <<< $signed(wire11)) ?
                          ((~&reg39) * {reg34, wire1}) : {(&reg24),
                              reg22[(3'h4):(2'h3)]}) ?
                      (($unsigned((7'h40)) >> (reg26 ?
                          (8'h9d) : reg18)) & (~|reg14[(1'h1):(1'h1)])) : reg44[(2'h2):(1'h0)]));
  assign wire51 = (~|$unsigned((wire11[(4'hc):(1'h1)] | ((wire30 ?
                      wire30 : reg44) >> (^reg8)))));
  assign wire52 = {reg43};
  assign wire53 = (!(+$signed((~&reg6[(1'h0):(1'h0)]))));
  assign wire54 = (reg24 ?
                      $unsigned((|(wire51[(5'h10):(3'h4)] ?
                          $signed(reg35) : $signed(wire10)))) : $signed(wire51[(3'h4):(1'h1)]));
  assign wire55 = wire29;
  assign wire56 = reg45[(5'h12):(4'h8)];
  module57 #() modinst220 (.wire58(reg22), .clk(clk), .wire61(wire50), .wire60(reg6), .y(wire219), .wire59(wire53));
endmodule

module module57  (y, clk, wire61, wire60, wire59, wire58);
  output wire [(32'h1d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire61;
  input wire [(5'h13):(1'h0)] wire60;
  input wire [(4'hb):(1'h0)] wire59;
  input wire signed [(5'h12):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire218;
  wire [(4'hd):(1'h0)] wire217;
  wire [(4'hf):(1'h0)] wire216;
  wire signed [(2'h3):(1'h0)] wire215;
  wire [(3'h4):(1'h0)] wire214;
  wire [(5'h11):(1'h0)] wire213;
  wire signed [(5'h11):(1'h0)] wire212;
  wire [(3'h6):(1'h0)] wire211;
  wire signed [(4'he):(1'h0)] wire210;
  wire signed [(4'hb):(1'h0)] wire209;
  wire [(4'he):(1'h0)] wire208;
  wire signed [(5'h13):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire112;
  wire [(4'hf):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire206;
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  assign y = {wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire110,
                 wire64,
                 wire112,
                 wire113,
                 wire206,
                 reg63,
                 reg62,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg62 <= $unsigned((wire60 ^ wire59[(4'h8):(3'h7)]));
      reg63 <= {$signed(wire59), (~|$unsigned((8'hbb)))};
    end
  assign wire64 = $signed((~$unsigned($signed(wire59[(3'h5):(2'h2)]))));
  module65 #() modinst111 (.wire68(wire60), .wire69(wire58), .wire67(reg63), .wire66(wire61), .y(wire110), .clk(clk));
  assign wire112 = (((8'hb1) <= wire61) ?
                       (wire58 <= $signed(wire59)) : $signed(({(wire61 ~^ wire60)} << $signed(reg63))));
  assign wire113 = (({reg63[(2'h2):(1'h0)],
                           $unsigned($unsigned(reg63))} || reg62) ?
                       {$signed(($signed(wire64) ?
                               (~^wire110) : (wire59 ? wire110 : wire61))),
                           wire110} : $signed((~&(wire60[(1'h0):(1'h0)] ?
                           ((8'hbd) ^~ wire60) : (wire112 || wire58)))));
  always
    @(posedge clk) begin
      reg114 <= {wire59[(3'h5):(2'h2)], {(~^wire60)}};
      reg115 <= (((-{((7'h43) ? reg63 : wire110),
          $signed(wire112)}) >>> $signed(reg114)) | (!$unsigned(wire61[(3'h5):(1'h0)])));
      if (($signed((reg114 ? {((8'h9e) != wire58)} : wire60[(5'h10):(4'he)])) ?
          ((reg115[(1'h0):(1'h0)] ?
                  $unsigned(reg114[(1'h1):(1'h0)]) : wire58[(4'hb):(4'h8)]) ?
              (~|reg62) : ($signed($unsigned(wire64)) ?
                  ((^wire61) >= wire64) : (8'ha8))) : $unsigned((wire61 ?
              (&$unsigned(wire61)) : (wire112 ?
                  wire61[(4'h8):(2'h3)] : $signed(wire61))))))
        begin
          if ($signed($unsigned($unsigned(wire112[(4'h8):(2'h2)]))))
            begin
              reg116 <= $unsigned((!wire64));
            end
          else
            begin
              reg116 <= reg115[(1'h0):(1'h0)];
              reg117 <= wire60[(4'hc):(3'h5)];
            end
          if (({wire59[(4'ha):(2'h3)]} ?
              reg114[(3'h4):(3'h4)] : (($unsigned((-reg115)) ?
                  ((!reg114) ?
                      $signed(wire60) : {reg114, wire61}) : {$unsigned(reg114),
                      (reg114 ^~ wire58)}) >> (|wire58))))
            begin
              reg118 <= $unsigned($unsigned(wire112[(4'hd):(4'h8)]));
              reg119 <= {(^({$unsigned(reg117)} ?
                      wire59[(4'h8):(3'h7)] : (&reg115[(1'h0):(1'h0)])))};
              reg120 <= $unsigned(reg117);
              reg121 <= (($unsigned(reg116[(3'h5):(3'h4)]) | reg115) ?
                  wire112 : wire58);
              reg122 <= $signed($unsigned((($signed(reg119) ?
                      $signed(reg120) : (~|wire58)) ?
                  $unsigned((&wire60)) : $signed((^reg120)))));
            end
          else
            begin
              reg118 <= wire112[(4'h8):(1'h1)];
            end
        end
      else
        begin
          reg116 <= reg116;
        end
      if ((&($unsigned(reg119[(3'h5):(2'h3)]) ?
          ($signed(wire112[(3'h4):(2'h3)]) != ({reg122,
              reg122} && $unsigned(wire112))) : (8'ha8))))
        begin
          reg123 <= reg122[(2'h3):(2'h2)];
        end
      else
        begin
          reg123 <= reg122[(4'hd):(4'ha)];
        end
      if (reg116)
        begin
          reg124 <= wire112[(2'h2):(2'h2)];
          if (reg118[(2'h3):(2'h2)])
            begin
              reg125 <= (wire64[(4'h8):(2'h2)] ?
                  wire110 : (~|(~^($unsigned(reg122) ?
                      (reg122 + reg117) : $signed(reg63)))));
            end
          else
            begin
              reg125 <= (reg122[(1'h0):(1'h0)] < (&$signed($signed((wire61 == wire61)))));
              reg126 <= $signed(reg122[(4'he):(3'h6)]);
              reg127 <= ((((~wire113[(4'he):(4'he)]) ?
                      (+wire110) : (!{reg117})) ?
                  ($unsigned((-reg118)) ?
                      reg62 : $unsigned((wire113 > reg120))) : reg123[(1'h0):(1'h0)]) >>> (&(^({reg63,
                      (8'ha5)} ?
                  reg115[(1'h1):(1'h1)] : $signed(reg124)))));
              reg128 <= $signed((($unsigned($unsigned(reg114)) | wire61) ?
                  $unsigned(($signed(reg115) ?
                      (8'h9d) : {(8'ha9),
                          reg114})) : (reg118 != (!$unsigned(reg123)))));
              reg129 <= reg117;
            end
          if ($signed(((((reg125 >>> (7'h40)) ? reg122 : $unsigned((8'ha9))) ?
                  $signed((reg124 - reg125)) : reg120[(3'h7):(2'h2)]) ?
              (^(wire61[(3'h7):(3'h4)] ?
                  reg62[(1'h0):(1'h0)] : (^reg125))) : (((-wire112) >>> (~reg114)) ^~ $signed((reg63 || wire60))))))
            begin
              reg130 <= $signed(reg114);
              reg131 <= $signed((reg117 < ((^~reg129) ?
                  (!{(8'hb4), reg114}) : reg125[(4'hb):(1'h0)])));
              reg132 <= (!(7'h43));
              reg133 <= $unsigned(wire110[(4'hd):(2'h2)]);
            end
          else
            begin
              reg130 <= ($unsigned(($signed((wire110 > reg115)) <= reg117[(1'h0):(1'h0)])) <= $signed(wire61[(3'h5):(2'h2)]));
              reg131 <= (~&{reg122,
                  (reg132 << ((wire60 && wire64) ?
                      $unsigned(reg121) : reg131[(1'h1):(1'h0)]))});
              reg132 <= (!(&reg121[(5'h14):(3'h5)]));
            end
        end
      else
        begin
          reg124 <= (~^(^reg123));
        end
    end
  module134 #() modinst207 (wire206, clk, reg128, reg119, reg130, wire110);
  assign wire208 = (^{(($signed(reg63) ?
                           $signed(wire60) : (&wire58)) & wire113)});
  assign wire209 = ($unsigned((wire59[(4'h8):(2'h2)] ?
                           reg130 : ({reg120, (8'hb9)} <= ((8'hb5) ?
                               reg119 : (8'hbb))))) ?
                       (~|$unsigned(({reg122} >= $unsigned((8'ha6))))) : reg122[(4'h9):(3'h6)]);
  assign wire210 = wire206[(2'h2):(1'h0)];
  assign wire211 = ((8'hb0) ? reg127[(3'h6):(3'h4)] : $signed(reg120));
  assign wire212 = ({(((reg116 ? reg130 : wire208) >> (|wire209)) ?
                           (wire110[(4'hd):(1'h1)] != reg126[(4'hd):(3'h4)]) : reg117)} || $unsigned((~|$signed((|wire59)))));
  assign wire213 = reg121[(3'h5):(3'h4)];
  assign wire214 = $signed((((reg128[(4'hb):(4'h8)] ?
                       (wire206 >>> wire206) : (7'h41)) ^ $signed(((8'hbd) == reg122))) > (-reg133)));
  assign wire215 = (reg62 ?
                       (((~|$signed(wire210)) >>> ($unsigned(wire208) < $unsigned(wire113))) ?
                           $unsigned(($unsigned(wire110) | (wire214 ?
                               (7'h40) : reg128))) : reg120[(3'h4):(1'h0)]) : reg123[(3'h4):(2'h2)]);
  assign wire216 = (($signed(({reg114} ?
                       (-reg125) : (~reg119))) > $signed($signed(reg119[(4'hc):(2'h2)]))) >= reg118[(1'h0):(1'h0)]);
  assign wire217 = (((~&(^$unsigned(reg124))) ?
                       (^{wire110,
                           (!(8'hb3))}) : wire213[(4'he):(3'h4)]) ~^ (|reg62));
  assign wire218 = {$signed($signed(wire60))};
endmodule

module module134
#(parameter param205 = ((((8'hab) ? ({(7'h41)} ? {(8'ha8)} : ((8'h9f) << (8'hb3))) : (~&((8'hb1) << (8'hab)))) ? {(~|((8'hab) && (8'ha5))), (((8'hb4) ? (8'had) : (7'h43)) << (7'h43))} : (((8'hb8) ? ((8'hb3) ? (7'h42) : (8'hba)) : (^(7'h44))) ~^ (&((8'hbc) ? (8'hac) : (8'ha0))))) | (((((8'hbe) ? (8'h9d) : (7'h41)) | ((7'h42) ? (7'h43) : (7'h44))) ? {((8'ha8) ? (8'hbb) : (8'hb0))} : ((|(7'h42)) ~^ (~(8'h9c)))) ? (~(((8'haf) ^ (8'ha7)) >= ((8'hb3) ? (8'ha4) : (8'ha2)))) : ((((8'hb8) ^ (8'hb2)) ~^ ((8'ha3) << (8'hbf))) ? (((8'ha3) << (7'h44)) << ((8'h9d) & (8'h9e))) : {((8'hb2) ? (8'hb4) : (8'ha6))}))))
(y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'h33f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire138;
  input wire [(4'hd):(1'h0)] wire137;
  input wire signed [(5'h15):(1'h0)] wire136;
  input wire signed [(5'h13):(1'h0)] wire135;
  wire signed [(4'h8):(1'h0)] wire204;
  wire signed [(2'h2):(1'h0)] wire203;
  wire signed [(5'h12):(1'h0)] wire202;
  wire signed [(3'h6):(1'h0)] wire201;
  wire [(5'h14):(1'h0)] wire200;
  wire [(3'h6):(1'h0)] wire199;
  wire [(4'he):(1'h0)] wire198;
  wire [(5'h14):(1'h0)] wire197;
  wire [(3'h6):(1'h0)] wire180;
  wire [(5'h11):(1'h0)] wire179;
  wire signed [(5'h15):(1'h0)] wire178;
  wire [(5'h13):(1'h0)] wire177;
  wire signed [(5'h15):(1'h0)] wire146;
  wire signed [(4'hc):(1'h0)] wire145;
  wire signed [(4'hc):(1'h0)] wire144;
  wire signed [(4'hc):(1'h0)] wire143;
  wire signed [(5'h12):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire141;
  wire [(4'hf):(1'h0)] wire140;
  wire signed [(4'h8):(1'h0)] wire139;
  reg [(5'h13):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg195 = (1'h0);
  reg [(4'hf):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg193 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg190 = (1'h0);
  reg [(5'h12):(1'h0)] reg189 = (1'h0);
  reg signed [(4'he):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg187 = (1'h0);
  reg [(2'h2):(1'h0)] reg186 = (1'h0);
  reg [(4'he):(1'h0)] reg185 = (1'h0);
  reg [(5'h13):(1'h0)] reg184 = (1'h0);
  reg signed [(4'he):(1'h0)] reg183 = (1'h0);
  reg [(4'ha):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg174 = (1'h0);
  reg [(4'hc):(1'h0)] reg173 = (1'h0);
  reg [(4'h9):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg171 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg170 = (1'h0);
  reg [(5'h10):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg167 = (1'h0);
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg164 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg [(4'hb):(1'h0)] reg158 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg147 = (1'h0);
  assign y = {wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire139 = (~((~|wire135[(4'hd):(2'h3)]) << {wire136,
                       {{wire137, wire136}, {wire138, wire137}}}));
  assign wire140 = (wire139[(3'h4):(1'h1)] ?
                       (~^{wire139[(3'h7):(2'h3)],
                           $unsigned($signed(wire139))}) : wire135);
  assign wire141 = $unsigned({$unsigned((~&wire139))});
  assign wire142 = (($unsigned($unsigned((wire140 >>> (8'hae)))) ?
                           ((-{wire136}) ?
                               wire139[(3'h6):(2'h2)] : (|wire136)) : (((wire135 << wire137) * wire136[(5'h14):(4'h9)]) ^~ wire140)) ?
                       ((~^{(wire135 ? wire141 : wire136)}) - ((+(~&wire135)) ?
                           (&(^wire135)) : ((~|wire141) ?
                               (wire136 + wire137) : {wire138}))) : {$signed(($unsigned(wire141) & wire135)),
                           (&{wire137[(1'h0):(1'h0)],
                               wire137[(2'h3):(1'h0)]})});
  assign wire143 = (~&($signed((-(-wire135))) ?
                       (wire138[(3'h5):(2'h3)] << (wire137[(4'ha):(3'h6)] <= wire139)) : ((~&(~|wire141)) ?
                           (8'ha2) : $signed({wire137, wire136}))));
  assign wire144 = $unsigned($signed(wire143[(2'h3):(2'h3)]));
  assign wire145 = (wire141[(1'h1):(1'h1)] ?
                       wire139 : $unsigned((wire143[(4'hc):(2'h3)] ?
                           ($signed(wire141) >> $signed(wire143)) : (^~(7'h41)))));
  assign wire146 = (~wire143[(4'hb):(2'h3)]);
  always
    @(posedge clk) begin
      if (wire135[(5'h10):(3'h6)])
        begin
          if ($signed(wire146[(5'h15):(5'h14)]))
            begin
              reg147 <= (^wire140[(4'h9):(1'h1)]);
              reg148 <= (wire145 ?
                  ((^~$signed((reg147 >= wire136))) ?
                      {$signed((~|reg147))} : (+wire138)) : $signed((~((8'ha2) ?
                      $unsigned((8'hb7)) : $unsigned(wire144)))));
              reg149 <= ($unsigned($signed(($signed(wire145) || $unsigned(wire135)))) ?
                  $unsigned(({$signed(reg147),
                      (reg148 ?
                          (8'had) : wire140)} && $signed(((8'ha9) >>> wire142)))) : ({wire146,
                          ($signed(wire144) ? {wire136, wire139} : (8'h9f))} ?
                      wire137[(1'h0):(1'h0)] : wire135));
              reg150 <= $unsigned((($unsigned({reg147, wire142}) << (8'hba)) ?
                  (((~reg147) >>> (~&wire135)) >= (wire137 ?
                      wire143 : wire135[(5'h10):(4'he)])) : (~&reg147)));
            end
          else
            begin
              reg147 <= (($signed({wire137[(2'h2):(2'h2)],
                  {(8'hab),
                      wire137}}) <= (~^wire141[(3'h4):(1'h1)])) >>> wire145);
              reg148 <= ($signed((-(wire138[(4'he):(3'h4)] ?
                  (8'ha6) : wire138[(4'hf):(4'hb)]))) ^ wire144[(3'h5):(2'h3)]);
              reg149 <= $signed(wire135[(5'h10):(3'h4)]);
              reg150 <= wire136[(3'h5):(2'h3)];
              reg151 <= wire142;
            end
          reg152 <= ($signed((-wire139[(2'h2):(1'h1)])) != (!($signed(wire137) ?
              (8'hba) : (((8'ha6) >> wire145) ? wire142 : wire138))));
          if (wire144[(3'h7):(3'h5)])
            begin
              reg153 <= wire146[(4'hd):(4'hd)];
              reg154 <= reg152;
            end
          else
            begin
              reg153 <= wire138[(3'h7):(2'h2)];
              reg154 <= $signed($unsigned((((reg152 ? (8'hae) : (7'h41)) ?
                      (wire138 ^~ (8'hb0)) : (^~(8'had))) ?
                  {$signed((8'hab)), (8'h9e)} : reg150)));
              reg155 <= wire136[(1'h1):(1'h1)];
              reg156 <= reg150;
              reg157 <= (wire141[(2'h2):(1'h1)] ?
                  $unsigned({wire138}) : $signed((((^reg152) && (+wire139)) ?
                      ((8'h9f) ?
                          $signed(wire142) : wire141) : ($signed(reg147) ?
                          $signed(reg148) : (~|wire138)))));
            end
          if ({$unsigned($unsigned(((wire138 ? wire136 : reg148) ?
                  {wire145, reg153} : reg157)))})
            begin
              reg158 <= (&(8'haa));
              reg159 <= wire135[(1'h0):(1'h0)];
            end
          else
            begin
              reg158 <= {reg150[(4'ha):(4'h8)], wire136};
              reg159 <= $unsigned($unsigned(({wire136[(4'he):(2'h2)], reg147} ?
                  (~|(~|reg148)) : $unsigned(reg152))));
              reg160 <= ((wire143 >> (wire146[(2'h2):(1'h1)] - $unsigned((reg149 > wire144)))) ^ (~^$signed((-$signed(wire142)))));
              reg161 <= $unsigned((($signed((&wire146)) ?
                      $unsigned(wire136) : ($unsigned(reg159) >> (reg159 >>> wire138))) ?
                  (wire140 >> $unsigned(reg152)) : wire140[(4'h9):(1'h0)]));
              reg162 <= wire138[(4'h8):(3'h6)];
            end
          if (wire138)
            begin
              reg163 <= reg162[(2'h3):(1'h1)];
            end
          else
            begin
              reg163 <= $signed($signed($signed(reg160)));
              reg164 <= {$unsigned((&(~^$unsigned(reg163))))};
              reg165 <= reg150[(5'h14):(4'hd)];
              reg166 <= {$unsigned($unsigned((&$signed(wire143)))), reg157};
              reg167 <= wire146[(3'h6):(3'h4)];
            end
        end
      else
        begin
          if (reg162)
            begin
              reg147 <= ((wire146[(2'h2):(1'h1)] | $unsigned((8'hbc))) ?
                  (wire138 ~^ (reg154[(4'h8):(1'h1)] != $unsigned(reg152))) : ((~&({reg160,
                      reg153} ~^ ((8'ha0) ? wire143 : (8'hba)))) ~^ {(((8'hbc) ?
                          reg167 : (8'hbb)) != $unsigned(reg161)),
                      $unsigned((wire140 ? reg154 : reg167))}));
            end
          else
            begin
              reg147 <= ($signed(($signed((~|wire140)) ?
                      ($unsigned(reg161) ?
                          $unsigned((8'ha9)) : wire139[(3'h6):(3'h5)]) : ((reg153 ?
                              wire140 : wire140) ?
                          $unsigned(reg163) : $unsigned((8'h9d))))) ?
                  $signed((wire137 <<< $unsigned($unsigned(wire144)))) : reg149[(1'h1):(1'h1)]);
              reg148 <= ((({reg156} >> wire145[(3'h5):(3'h4)]) ?
                  ($unsigned(wire140[(4'hd):(1'h0)]) <<< ($unsigned((8'ha1)) | $unsigned(wire137))) : (($unsigned(reg151) ?
                          (reg162 || reg149) : ((8'hab) ? reg156 : wire139)) ?
                      wire136[(3'h5):(1'h1)] : reg155[(1'h1):(1'h1)])) ^ $unsigned($signed($signed($unsigned(wire146)))));
              reg149 <= wire140;
              reg150 <= (^($signed($unsigned((+reg166))) ?
                  (~|wire138) : ($unsigned($unsigned(reg152)) ?
                      $unsigned((wire141 != reg156)) : $signed(wire143[(4'h8):(2'h2)]))));
            end
          reg151 <= (|reg151[(3'h7):(3'h5)]);
          reg152 <= {reg163};
        end
      if (reg167)
        begin
          if ((wire135[(2'h2):(1'h1)] & wire135[(4'h8):(1'h1)]))
            begin
              reg168 <= (($signed((|(wire141 > wire135))) >>> $unsigned($unsigned((reg148 ?
                      wire136 : reg159)))) ?
                  $unsigned((+($signed(wire140) ?
                      {reg153} : reg161))) : reg150[(4'hc):(3'h7)]);
              reg169 <= $unsigned(reg157);
              reg170 <= reg166;
              reg171 <= ((~(^~$unsigned((+wire141)))) ?
                  $signed(wire146) : wire139);
              reg172 <= ($signed($signed((+reg151))) ^ ((($unsigned(reg160) << reg167[(3'h5):(2'h3)]) ?
                  wire136 : (+reg166[(3'h4):(2'h2)])) + (+(~&$unsigned(reg149)))));
            end
          else
            begin
              reg168 <= $unsigned($unsigned((&(~&(reg171 ?
                  wire135 : wire145)))));
              reg169 <= (~|{$signed({{(8'hb8)}, reg150})});
              reg170 <= $signed(wire144[(1'h1):(1'h0)]);
              reg171 <= (8'hbb);
            end
          reg173 <= (reg154 ?
              ($signed(reg162[(1'h1):(1'h1)]) ^ (~{(reg154 >= (8'hb8))})) : (wire135 ?
                  (8'had) : $unsigned($signed(wire140))));
          reg174 <= $unsigned(reg153);
          reg175 <= (~|reg160[(2'h2):(1'h0)]);
          reg176 <= {(-(-reg171))};
        end
      else
        begin
          if (reg157[(4'ha):(3'h6)])
            begin
              reg168 <= {$signed($signed($unsigned($unsigned((8'hbb)))))};
            end
          else
            begin
              reg168 <= wire143;
            end
          if ((!wire140))
            begin
              reg169 <= reg174;
              reg170 <= (reg170[(4'h8):(3'h4)] || ($unsigned(wire142) ?
                  (^(|(8'ha1))) : $unsigned(reg164)));
              reg171 <= ($signed($unsigned(reg150[(3'h6):(3'h4)])) >> $unsigned(($unsigned(((8'hac) >>> reg172)) ?
                  wire143 : reg174[(3'h7):(2'h2)])));
              reg172 <= ({reg156,
                      ((~^$signed(reg167)) ?
                          (~reg169[(4'hf):(4'hd)]) : (!reg172[(2'h2):(1'h1)]))} ?
                  $unsigned({(!{(8'ha1),
                          reg161})}) : ($unsigned($signed($unsigned(reg161))) ?
                      (~&({(8'ha2), reg154} ^~ {reg166,
                          reg170})) : reg169[(4'hf):(4'he)]));
            end
          else
            begin
              reg169 <= reg168[(2'h3):(2'h2)];
            end
        end
    end
  assign wire177 = $signed(reg151[(3'h6):(3'h6)]);
  assign wire178 = (&reg176[(3'h5):(2'h3)]);
  assign wire179 = $unsigned(wire139);
  assign wire180 = $signed(reg157);
  always
    @(posedge clk) begin
      if ((8'hbf))
        begin
          if (wire142)
            begin
              reg181 <= $signed(reg151);
              reg182 <= wire178[(3'h6):(2'h3)];
              reg183 <= wire146;
              reg184 <= (+{(reg169 || (wire142[(4'ha):(3'h5)] ?
                      $signed(wire144) : (reg182 ^ reg159)))});
            end
          else
            begin
              reg181 <= $unsigned((!reg164));
            end
          if ($unsigned(($unsigned(($signed(wire138) ?
                  reg171 : (reg158 <<< wire140))) ?
              reg153 : (~^wire137[(1'h1):(1'h0)]))))
            begin
              reg185 <= ((reg161[(4'he):(1'h1)] >= (-reg171[(2'h3):(2'h2)])) ?
                  (((reg157 ^ $signed(reg181)) ?
                          {(^~reg157)} : $signed(wire144)) ?
                      $signed(wire143) : (-((wire139 << reg168) ?
                          wire137[(3'h7):(3'h6)] : reg148[(1'h1):(1'h1)]))) : (-$unsigned(($signed((8'hac)) != ((8'ha3) && reg151)))));
              reg186 <= (((^$unsigned(reg164[(1'h0):(1'h0)])) ?
                      wire142 : (8'hb3)) ?
                  ($signed(wire136[(4'hf):(4'hf)]) & ($unsigned(((8'ha7) != (8'ha7))) || ($signed(reg174) == (reg176 ?
                      (8'ha5) : wire137)))) : $unsigned(reg168));
              reg187 <= wire140[(4'h9):(4'h8)];
            end
          else
            begin
              reg185 <= $signed(reg154[(5'h11):(5'h11)]);
              reg186 <= wire136;
              reg187 <= (&reg182);
              reg188 <= reg176[(5'h11):(2'h2)];
            end
          reg189 <= (reg183[(3'h5):(1'h0)] ?
              ($unsigned(($signed(wire136) ?
                      {wire179} : wire178[(4'h8):(3'h4)])) ?
                  ($unsigned((wire143 ^ wire144)) ?
                      $signed($unsigned(reg183)) : ((reg167 ?
                          wire146 : reg182) > $signed(wire178))) : reg183[(4'h8):(3'h7)]) : $unsigned($signed($signed({(8'ha0),
                  reg163}))));
          reg190 <= (wire146 ?
              $unsigned((!reg160)) : (|{$unsigned($signed(reg186))}));
          reg191 <= ((reg156 && (^$signed(reg186))) > ((-$unsigned((~reg164))) ?
              (7'h42) : (reg171 ?
                  $signed($unsigned(wire140)) : $unsigned((reg161 >>> reg186)))));
        end
      else
        begin
          reg181 <= (|$unsigned((~$unsigned(((8'hbd) == wire177)))));
          reg182 <= $signed({$unsigned({(wire144 <= reg157),
                  ((7'h41) >> reg185)})});
          reg183 <= {(reg171 * reg188[(4'hd):(2'h3)])};
          reg184 <= (+(~(wire178 ?
              $unsigned({reg153}) : ({wire145,
                  (7'h44)} << (wire178 ^~ wire141)))));
          if ({($unsigned(reg153) + {$unsigned((reg172 ? reg187 : reg147))}),
              (-(7'h44))})
            begin
              reg185 <= reg182;
              reg186 <= $unsigned($signed($unsigned($signed((reg166 || wire179)))));
              reg187 <= (reg166 <= (~^wire180));
              reg188 <= $unsigned(({wire140[(1'h0):(1'h0)],
                      $signed(((8'ha3) ? reg188 : (8'ha1)))} ?
                  {$unsigned(((8'hab) & reg163))} : $signed((8'h9e))));
              reg189 <= (8'hb8);
            end
          else
            begin
              reg185 <= ($signed((((reg161 ?
                          reg159 : reg172) - $unsigned(wire136)) ?
                      (^$unsigned(reg171)) : $unsigned((-reg171)))) ?
                  reg150[(5'h11):(4'h9)] : (wire138 ?
                      (~&wire143) : (wire144[(3'h7):(1'h0)] ?
                          wire136[(3'h7):(3'h5)] : ($signed(wire177) ?
                              reg160 : (reg184 < reg191)))));
              reg186 <= ($unsigned($unsigned(reg171)) >= ($signed(($unsigned(reg148) | (reg173 ?
                  reg156 : wire177))) ^ {(-reg172[(2'h2):(1'h0)]),
                  $signed((reg152 ? (8'hbc) : reg150))}));
              reg187 <= reg190;
            end
        end
      reg192 <= {$signed(($unsigned((-reg168)) >> ({(8'ha3)} ?
              wire180[(3'h4):(1'h1)] : (wire140 ? wire145 : wire137))))};
      reg193 <= ((reg183[(3'h5):(1'h0)] ?
              ($signed({reg163}) >> reg159) : {(~|(wire135 ? reg151 : reg191)),
                  (~^(-wire143))}) ?
          $unsigned(reg170[(1'h1):(1'h1)]) : reg163);
    end
  always
    @(posedge clk) begin
      reg194 <= reg181;
      reg195 <= ($signed($unsigned($unsigned($signed(reg160)))) ?
          wire179 : (8'haf));
      if (reg152)
        begin
          reg196 <= $unsigned((~^($signed(reg189[(4'ha):(2'h3)]) || $signed(reg158))));
        end
      else
        begin
          reg196 <= ((((reg155 <<< wire141[(2'h2):(1'h0)]) * $unsigned($unsigned(reg157))) << {({wire139} ?
                  $signed(reg157) : {wire140})}) + $unsigned(({$unsigned(reg168),
                  $unsigned(reg149)} ?
              (reg148 ? (&wire138) : {wire177}) : wire140[(4'h8):(2'h2)])));
        end
    end
  assign wire197 = (8'ha5);
  assign wire198 = wire143;
  assign wire199 = $signed((wire138[(1'h0):(1'h0)] - $unsigned(($signed(reg174) ?
                       $unsigned(reg196) : {reg187, reg159}))));
  assign wire200 = $signed(reg186[(2'h2):(1'h1)]);
  assign wire201 = $signed((reg193 >= wire136));
  assign wire202 = reg153[(2'h3):(1'h0)];
  assign wire203 = (~|((reg159[(5'h14):(4'ha)] > $unsigned((^~reg148))) >>> (!(!(&wire198)))));
  assign wire204 = reg168;
endmodule

module module65
#(parameter param108 = ((((~^((8'hab) << (8'ha9))) ? (((7'h40) ? (8'h9c) : (8'hb1)) ? ((8'ha0) ? (8'hbc) : (7'h42)) : ((7'h40) * (8'haa))) : (~|((8'ha0) ? (8'ha2) : (8'ha6)))) ? ({((8'ha3) >= (7'h43))} ? {((8'h9f) ? (8'ha5) : (8'hbe)), (-(8'hb1))} : (((8'hb4) ? (8'hac) : (8'hb7)) ? (^~(8'hb5)) : ((8'hb7) <<< (7'h44)))) : (8'hb2)) ? (((((8'hbe) - (8'hae)) ? ((8'h9f) + (8'hbf)) : ((8'ha8) != (8'hae))) ? ({(8'h9d)} || ((8'ha3) >= (8'ha8))) : (+((8'hac) > (7'h42)))) ? (!{((8'ha1) ^ (8'hb1)), ((8'ha6) ? (8'haf) : (8'hb4))}) : ((~&{(8'hbf), (8'hbe)}) >>> (~^((8'hbe) ? (8'hb7) : (8'hb0))))) : {(+(7'h42))}), 
parameter param109 = ((param108 - (~|(param108 + (param108 ? param108 : param108)))) >= (+{(~{param108, param108}), param108})))
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire69;
  input wire [(5'h13):(1'h0)] wire68;
  input wire [(4'hb):(1'h0)] wire67;
  input wire [(3'h6):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire89;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire70;
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire90,
                 wire89,
                 wire83,
                 wire70,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire70 = $unsigned(wire68[(4'h9):(3'h6)]);
  always
    @(posedge clk) begin
      if ((wire70 ? wire70 : $signed(wire68)))
        begin
          reg71 <= (wire68 ?
              wire69 : $unsigned($signed($unsigned({wire66, wire70}))));
        end
      else
        begin
          reg71 <= $signed(wire67);
          reg72 <= {wire66[(2'h2):(2'h2)]};
        end
      if ((wire69 > $unsigned($signed((wire69 ?
          (reg72 >= reg72) : (wire67 ? wire70 : wire67))))))
        begin
          reg73 <= {(~$unsigned(($unsigned((8'hbb)) * (reg71 ?
                  wire66 : wire68))))};
          reg74 <= reg71;
          reg75 <= reg71[(1'h1):(1'h1)];
        end
      else
        begin
          reg73 <= (reg74 << (wire69[(4'hb):(4'h9)] > $signed((wire66[(2'h3):(2'h3)] <<< reg75[(2'h3):(1'h0)]))));
          if ((reg71 ?
              (($unsigned(wire66[(2'h3):(1'h0)]) ?
                      (reg74[(3'h5):(3'h5)] <<< (~|wire68)) : {{wire67, wire66},
                          $unsigned(reg74)}) ?
                  {$unsigned($unsigned(wire66))} : reg71[(2'h2):(2'h2)]) : (($signed({reg72}) >> reg71[(2'h2):(1'h1)]) ?
                  $unsigned(reg74[(4'ha):(1'h1)]) : wire69)))
            begin
              reg74 <= $unsigned({{(-wire69)},
                  (({wire70, reg75} ?
                      $unsigned(reg74) : (wire70 ?
                          wire66 : wire68)) <<< {(~^reg72)})});
              reg75 <= ((reg72 ?
                      $unsigned((-(wire69 >>> reg72))) : (~&($unsigned((8'hb6)) & (^wire67)))) ?
                  reg74 : $signed(((reg72[(4'hb):(3'h5)] >> wire69[(3'h6):(2'h3)]) ?
                      wire66 : $signed((wire66 != (8'hb2))))));
              reg76 <= (8'hbd);
              reg77 <= (reg76[(1'h0):(1'h0)] >= (8'haa));
            end
          else
            begin
              reg74 <= ((reg71[(1'h1):(1'h0)] & reg72[(2'h2):(1'h0)]) <<< ($signed($unsigned($signed(reg72))) ?
                  reg77 : {reg71, reg71}));
              reg75 <= $unsigned((8'ha4));
            end
          reg78 <= (-wire69);
          reg79 <= ((~$signed($unsigned(reg75))) ?
              {{$unsigned(wire68[(3'h6):(1'h1)]),
                      (wire69[(4'h8):(2'h2)] & $signed(reg72))},
                  ($signed((wire70 ? reg76 : (8'ha2))) ?
                      $signed((wire67 || wire66)) : reg78)} : $signed($signed(wire70[(3'h5):(1'h0)])));
        end
      reg80 <= reg71[(2'h2):(2'h2)];
      reg81 <= reg78;
      reg82 <= (~&(8'hb8));
    end
  assign wire83 = wire69[(4'hf):(4'hb)];
  always
    @(posedge clk) begin
      reg84 <= $signed(reg81[(1'h1):(1'h1)]);
      reg85 <= ((!($unsigned({(8'h9d), reg72}) | reg80[(1'h0):(1'h0)])) ?
          $signed(($unsigned(wire68) ?
              wire83[(4'ha):(4'h8)] : ($signed(reg80) ?
                  (wire68 ? reg84 : reg76) : (^reg74)))) : (reg81 ?
              reg81 : (reg75 ? (^$signed((8'ha2))) : {(reg81 < reg76)})));
      reg86 <= $unsigned((^reg74[(4'hf):(4'h8)]));
      reg87 <= (reg80 ~^ reg86[(2'h3):(1'h1)]);
      reg88 <= $unsigned($unsigned($unsigned((-reg76))));
    end
  assign wire89 = reg86[(3'h5):(1'h0)];
  assign wire90 = (+reg88[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      if ($unsigned((~|$unsigned($signed({(8'ha5)})))))
        begin
          if ((reg85[(3'h5):(3'h4)] ?
              reg85 : (+$signed($unsigned(reg71[(2'h2):(1'h1)])))))
            begin
              reg91 <= (|$signed(({(reg85 <<< (8'h9d))} >>> wire66[(1'h1):(1'h1)])));
              reg92 <= ($unsigned($signed(wire83[(3'h5):(3'h4)])) ?
                  (-$unsigned($signed((&wire66)))) : ($signed((wire68 * wire90[(4'hd):(2'h3)])) ?
                      ($unsigned(wire70) ?
                          $signed($signed((8'hb9))) : {$unsigned(reg79),
                              (reg91 ? wire89 : (8'h9f))}) : ((reg80 ?
                              reg75 : (~&wire83)) ?
                          (&(8'hb0)) : reg72)));
              reg93 <= ($unsigned(reg84) ?
                  (((reg79[(4'hb):(4'h8)] ?
                              reg92[(4'hc):(4'h8)] : wire83[(3'h4):(3'h4)]) ?
                          reg82 : reg82) ?
                      (8'hbe) : reg72) : $signed(({(wire69 ? wire66 : wire67)} ?
                      (reg82[(1'h1):(1'h1)] <= $signed(wire68)) : (~$signed(reg78)))));
              reg94 <= reg81;
              reg95 <= (8'h9c);
            end
          else
            begin
              reg91 <= (!$unsigned({reg94, $signed($signed(wire89))}));
              reg92 <= {(~(8'hb8)),
                  $unsigned($unsigned(($unsigned(reg95) ^~ $unsigned(wire68))))};
            end
        end
      else
        begin
          if ($signed((({((8'ha1) ? reg77 : (8'hb8))} ?
              (reg79[(4'hc):(3'h6)] ?
                  $signed(reg81) : reg92) : reg94[(1'h0):(1'h0)]) << ({$unsigned(reg84),
              (reg95 ? reg95 : wire66)} > reg95[(2'h2):(2'h2)]))))
            begin
              reg91 <= $signed(($signed((-reg79)) ?
                  (((wire70 <<< (8'ha0)) && $unsigned(reg84)) ?
                      reg82[(2'h2):(1'h0)] : ((+reg88) >= (reg86 ?
                          reg77 : reg71))) : $signed(((reg84 > reg71) ?
                      $signed(reg94) : $unsigned(reg86)))));
              reg92 <= $unsigned((((~|((8'hac) ^~ reg79)) || (~^$unsigned(reg78))) ?
                  (wire89[(5'h13):(5'h11)] ?
                      $unsigned($signed(reg78)) : wire83[(4'hb):(4'h9)]) : reg84[(1'h1):(1'h1)]));
              reg93 <= reg73[(1'h0):(1'h0)];
              reg94 <= (7'h44);
            end
          else
            begin
              reg91 <= reg75;
              reg92 <= $unsigned(($signed($unsigned($signed(reg84))) ~^ (~(((8'had) ?
                      (8'hab) : (8'hae)) ?
                  $signed(reg92) : (wire90 << reg76)))));
              reg93 <= $unsigned((wire66[(3'h5):(2'h3)] ?
                  (+(reg81 ?
                      (reg95 ? reg76 : wire70) : (reg78 ?
                          reg85 : reg88))) : reg91[(1'h0):(1'h0)]));
              reg94 <= (&reg93);
              reg95 <= ((((-(|reg72)) ?
                  ((reg85 >= wire89) & ((8'ha8) ? reg91 : (8'hba))) : (wire67 ?
                      (reg92 | reg87) : $unsigned(reg95))) ~^ reg93) <= reg77[(1'h1):(1'h1)]);
            end
          reg96 <= ({{wire69},
              (^~(reg82[(1'h0):(1'h0)] ?
                  $unsigned(wire68) : $signed((8'ha9))))} && (8'hba));
          reg97 <= reg80[(1'h1):(1'h1)];
          if (((^~$signed({$unsigned(reg93)})) ?
              (reg94[(1'h0):(1'h0)] ?
                  ({{reg77, wire67},
                      (reg85 ?
                          reg74 : reg93)} ~^ $unsigned((~reg94))) : reg78[(2'h2):(2'h2)]) : (^~((&reg82) ?
                  $unsigned((reg81 | reg87)) : $signed((8'hbf))))))
            begin
              reg98 <= $signed((!reg86[(4'ha):(4'h8)]));
              reg99 <= reg75;
              reg100 <= $unsigned(reg72);
              reg101 <= $signed($unsigned(($unsigned($signed(wire66)) ?
                  reg82[(1'h1):(1'h0)] : $signed(((8'ha6) ? wire68 : reg80)))));
              reg102 <= $unsigned(reg81);
            end
          else
            begin
              reg98 <= (((!reg87[(4'hc):(4'ha)]) << {$signed(((8'hae) ?
                          reg80 : wire68))}) ?
                  ({(+reg74[(4'hd):(4'hc)]),
                      reg95[(2'h2):(1'h0)]} | ({$unsigned(reg101)} || (((7'h40) ~^ reg102) ?
                      $signed(wire69) : (~^reg98)))) : $signed($signed(wire66[(1'h1):(1'h0)])));
              reg99 <= $signed(reg77);
            end
          reg103 <= (^{($unsigned($unsigned(reg101)) >>> reg88),
              $signed({(reg97 <= reg97)})});
        end
      reg104 <= ((&(^((8'hb7) * (!reg96)))) - reg85);
    end
  assign wire105 = {reg71};
  assign wire106 = {(8'hbf)};
  assign wire107 = wire83;
endmodule
