module top
#(parameter param220 = ((~|((((8'hb9) ? (8'hae) : (7'h40)) ? ((8'ha4) ~^ (8'hba)) : {(8'ha8)}) && (~((7'h41) && (8'hbf))))) ? (+{(((7'h44) ? (8'hba) : (8'hb4)) >> ((7'h42) ? (8'hb9) : (8'ha0))), ({(7'h43), (8'hba)} + (~(8'ha6)))}) : (((((8'ha3) ? (8'ha9) : (8'ha4)) || (&(8'haf))) ? (8'ha0) : (((8'hb6) ? (8'hb4) : (8'ha2)) <<< ((8'hb9) ? (8'ha0) : (7'h44)))) ? {(((8'ha9) | (8'hae)) ? ((7'h40) ? (8'hb9) : (8'hb9)) : ((8'ha4) ^~ (8'h9d))), (((8'ha6) ? (8'ha6) : (8'hac)) ? ((8'hbb) >> (8'hb2)) : {(8'ha4), (8'ha5)})} : (8'hb0))), 
parameter param221 = (8'hac))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire218;
  wire signed [(5'h15):(1'h0)] wire217;
  wire [(5'h15):(1'h0)] wire216;
  wire signed [(5'h11):(1'h0)] wire215;
  wire [(2'h3):(1'h0)] wire214;
  wire [(3'h6):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire212;
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  assign y = {wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire48,
                 wire5,
                 wire50,
                 wire52,
                 wire212,
                 reg51,
                 (1'h0)};
  assign wire5 = $unsigned((((~^(wire2 ? wire4 : wire1)) & ((wire1 ?
                             (8'h9c) : wire3) ?
                         (8'hbe) : (wire1 <<< wire4))) ?
                     $unsigned({{wire4, wire3},
                         (wire0 ? (8'hb2) : wire1)}) : wire3));
  module6 #() modinst49 (wire48, clk, wire5, wire4, wire3, wire1, wire0);
  assign wire50 = $signed(wire0[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg51 <= (~$unsigned($signed($unsigned(wire0))));
    end
  assign wire52 = wire3[(4'hd):(3'h6)];
  module53 #() modinst213 (wire212, clk, wire3, reg51, wire52, wire4);
  assign wire214 = (8'had);
  assign wire215 = wire214;
  assign wire216 = wire3;
  assign wire217 = wire216[(4'he):(3'h4)];
  module53 #() modinst219 (.y(wire218), .wire56(wire212), .wire54(wire215), .clk(clk), .wire57(wire52), .wire55(wire1));
endmodule

module module53
#(parameter param211 = {(+({(~|(8'hb9))} ^~ (((8'hbf) > (8'hb2)) ? (~(8'hb9)) : ((8'ha2) ? (8'ha5) : (8'hb8)))))})
(y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h1e3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire57;
  input wire [(3'h6):(1'h0)] wire56;
  input wire [(4'he):(1'h0)] wire55;
  input wire [(5'h11):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire210;
  wire [(2'h3):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(3'h5):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire87;
  wire [(4'hb):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire208;
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  assign y = {wire210,
                 wire126,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire70,
                 wire69,
                 wire68,
                 wire58,
                 wire208,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 (1'h0)};
  assign wire58 = wire57[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if (($unsigned((($unsigned(wire58) & {wire54, wire56}) ?
          (wire57 ?
              wire58 : (&wire58)) : (~^$unsigned((8'ha4))))) != $unsigned($signed({(wire54 && wire56),
          (wire55 || wire55)}))))
        begin
          reg59 <= (-$unsigned((8'haf)));
          if ($signed((+{{(!wire58)}, $signed($signed(wire54))})))
            begin
              reg60 <= (8'ha7);
              reg61 <= (8'hbf);
              reg62 <= $signed($unsigned(wire58[(2'h2):(1'h0)]));
            end
          else
            begin
              reg60 <= ((reg60[(1'h0):(1'h0)] ?
                  $signed($signed((-(8'hbc)))) : (~|wire56)) ^ {$unsigned((!((8'ha8) * (8'hb5)))),
                  wire57[(1'h0):(1'h0)]});
              reg61 <= ((8'hbb) ?
                  $unsigned($unsigned(((^wire54) << (^wire57)))) : reg61[(4'ha):(2'h3)]);
              reg62 <= (~|$signed($signed(wire54[(2'h3):(1'h0)])));
            end
          reg63 <= $unsigned({{$unsigned((wire55 ? reg59 : wire56))}});
          reg64 <= $unsigned($unsigned($signed((wire58 ?
              {wire57, reg59} : (reg63 ? reg59 : wire58)))));
          reg65 <= reg59[(4'he):(3'h6)];
        end
      else
        begin
          reg59 <= (+($signed((^~$signed(reg60))) <= {$unsigned($signed(reg64)),
              $unsigned((&reg60))}));
          reg60 <= (reg61 ?
              {(^~{$unsigned(reg61), wire58[(1'h1):(1'h0)]}),
                  wire56[(2'h2):(2'h2)]} : (~({(-reg59),
                  wire56} == $signed($unsigned((8'h9e))))));
          reg61 <= (!(($unsigned($unsigned(reg63)) ?
                  (^~$signed(reg63)) : {((8'ha7) ? reg64 : wire55)}) ?
              (!reg65) : reg61[(4'hb):(3'h5)]));
          reg62 <= $unsigned(((+((wire57 == (8'hb5)) | $signed(reg60))) && ((~|reg60) | ((~(8'hb5)) ?
              $unsigned(wire56) : ((8'hb2) ? reg61 : wire55)))));
          if (reg64)
            begin
              reg63 <= (^reg59[(5'h13):(2'h3)]);
            end
          else
            begin
              reg63 <= reg59[(2'h3):(2'h2)];
              reg64 <= (|(reg64[(3'h4):(2'h3)] && reg64));
              reg65 <= $signed($unsigned($unsigned(($unsigned(reg62) ?
                  (reg62 < (8'ha1)) : $unsigned(wire55)))));
              reg66 <= reg63[(3'h7):(3'h7)];
              reg67 <= ($signed((|reg66[(3'h6):(3'h6)])) ?
                  ((-$signed((&reg66))) <= $signed($unsigned((wire55 < wire56)))) : wire58);
            end
        end
    end
  assign wire68 = {({wire54[(1'h0):(1'h0)]} ?
                          (~|$unsigned($signed(reg67))) : wire58[(2'h3):(2'h3)])};
  assign wire69 = (+(wire56[(2'h2):(1'h1)] ?
                      ((8'haa) ^ wire56) : $signed($unsigned($unsigned((8'h9d))))));
  assign wire70 = (8'ha1);
  module71 #() modinst82 (.wire75(reg65), .wire72(wire68), .wire74(reg61), .y(wire81), .clk(clk), .wire73(wire58));
  assign wire83 = (~&$signed({({(8'ha1), reg64} ?
                          (reg67 ? wire70 : wire56) : (wire58 ^~ reg60))}));
  assign wire84 = (wire83[(1'h1):(1'h1)] ~^ wire70);
  assign wire85 = (^wire56);
  assign wire86 = $unsigned($unsigned({wire81[(4'h8):(1'h0)]}));
  assign wire87 = reg60;
  assign wire88 = wire54;
  assign wire89 = ((-(wire85[(4'hb):(4'h8)] ^~ ((wire85 ?
                          reg61 : reg65) || $unsigned(wire83)))) ?
                      wire88 : reg64[(2'h2):(1'h0)]);
  assign wire90 = $unsigned((wire58 <= (8'hb1)));
  assign wire91 = wire68[(2'h3):(1'h1)];
  assign wire92 = $unsigned((8'hb4));
  assign wire93 = ($unsigned((wire88 ? (-$unsigned(wire86)) : {(8'hb4)})) ?
                      ($signed(((+(8'ha0)) & wire85[(2'h3):(2'h3)])) ?
                          (8'hb2) : wire69) : reg65[(5'h11):(3'h4)]);
  assign wire94 = $unsigned({{($signed(wire58) == wire70[(5'h10):(4'h9)]),
                          {(!wire84), {wire89, wire84}}}});
  assign wire95 = wire84;
  module96 #() modinst127 (.wire98(wire55), .wire97(wire54), .clk(clk), .wire100(reg66), .wire99(wire88), .y(wire126));
  always
    @(posedge clk) begin
      if (reg59)
        begin
          if ((reg66 == (^(reg61 ?
              $unsigned(wire83[(1'h0):(1'h0)]) : $signed((wire56 > (8'ha1)))))))
            begin
              reg128 <= {(-wire86), $signed(reg62[(3'h7):(2'h3)])};
            end
          else
            begin
              reg128 <= wire58[(5'h14):(4'h9)];
              reg129 <= {wire70[(3'h7):(1'h1)]};
              reg130 <= wire55;
              reg131 <= $signed((+reg130[(1'h0):(1'h0)]));
              reg132 <= ($signed({($signed(reg59) ?
                      reg131[(3'h7):(2'h2)] : (wire56 | reg59))}) ^~ $signed(wire86[(4'ha):(4'h8)]));
            end
          reg133 <= wire88;
          if (reg60[(3'h6):(1'h0)])
            begin
              reg134 <= (((+(wire89[(3'h5):(2'h3)] && wire93[(2'h2):(1'h0)])) <<< {$unsigned((wire57 ?
                      (8'hbc) : reg128))}) - (|((((8'hb0) || wire58) != (+reg132)) < reg64)));
            end
          else
            begin
              reg134 <= wire89[(2'h3):(2'h3)];
              reg135 <= reg61;
              reg136 <= wire57[(1'h0):(1'h0)];
              reg137 <= (^~wire81[(4'h8):(2'h2)]);
            end
        end
      else
        begin
          if ((((reg133[(1'h1):(1'h0)] ? reg129 : reg130[(1'h1):(1'h0)]) ?
                  wire86 : reg135) ?
              ($unsigned($signed((wire93 ? (8'ha4) : wire84))) ?
                  (&(8'ha4)) : ((+$unsigned((8'hab))) > $signed({wire56}))) : reg137[(3'h6):(1'h0)]))
            begin
              reg128 <= $signed($unsigned(reg134));
            end
          else
            begin
              reg128 <= (wire93[(5'h10):(5'h10)] ?
                  wire91[(4'h8):(4'h8)] : (&($signed((reg65 <<< wire84)) ?
                      reg66[(1'h1):(1'h1)] : wire70[(3'h5):(1'h0)])));
              reg129 <= (wire69[(4'hc):(4'hc)] | $signed((($unsigned(wire70) ?
                  (!reg59) : wire86[(4'hb):(1'h1)]) & ((wire85 <= wire70) >>> reg59[(2'h2):(1'h0)]))));
            end
          reg130 <= $signed({{wire57, wire58}});
          reg131 <= wire91[(4'hc):(4'ha)];
          reg132 <= ((+((reg128[(3'h6):(1'h0)] != $unsigned(reg131)) ?
                  $unsigned((-reg132)) : {((8'hbb) ? wire69 : reg131)})) ?
              wire84[(3'h5):(2'h2)] : {wire70});
        end
      reg138 <= (~|($signed($signed((~|reg63))) ?
          $unsigned($signed($signed(reg134))) : $unsigned((reg66 & ((8'ha5) != wire126)))));
    end
  module139 #() modinst209 (wire208, clk, reg138, reg61, wire91, reg130);
  assign wire210 = $signed(((reg59[(3'h5):(2'h2)] - ($signed(reg134) ^~ wire88[(4'ha):(2'h2)])) ?
                       $unsigned(reg59[(5'h13):(4'hb)]) : (((wire90 ?
                               wire69 : (8'h9e)) ?
                           (wire55 | (8'ha3)) : $signed(reg130)) | ({wire57,
                               wire57} ?
                           (wire84 ~^ wire95) : (reg63 > wire85)))));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire41;
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire12,
                 wire41,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire12 = wire11[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg13 <= (-$signed(({(wire9 ? wire7 : (7'h40))} ?
          $unsigned((^wire11)) : wire11[(3'h7):(2'h3)])));
      reg14 <= wire11;
    end
  module15 #() modinst42 (wire41, clk, wire10, wire8, reg14, wire11);
  assign wire43 = reg13[(3'h5):(1'h1)];
  assign wire44 = (8'hac);
  assign wire45 = ((!(~^$unsigned(reg14))) == $unsigned((~&reg14)));
  assign wire46 = (wire44[(4'h9):(2'h3)] ? (8'ha8) : wire9[(4'hd):(3'h4)]);
  assign wire47 = $signed((!$unsigned({(~|(8'hb4))})));
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire signed [(4'hc):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  assign y = {wire40,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire31,
                 wire30,
                 wire29,
                 wire21,
                 wire20,
                 reg39,
                 reg34,
                 reg33,
                 reg32,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire20 = wire16;
  assign wire21 = wire19;
  always
    @(posedge clk) begin
      reg22 <= $unsigned(((wire21[(3'h4):(1'h0)] ?
          (7'h42) : {$unsigned(wire16)}) + wire21));
      reg23 <= $signed((~|$signed($signed({wire17, wire19}))));
      if ({$unsigned(wire20[(3'h7):(3'h4)])})
        begin
          reg24 <= $unsigned((+(~&$signed((-reg23)))));
          if ({$unsigned(($unsigned(((8'ha8) ? wire21 : wire16)) < (8'hb3)))})
            begin
              reg25 <= (|(&$signed($signed(wire18[(3'h6):(2'h3)]))));
              reg26 <= {reg22, wire19[(3'h6):(3'h4)]};
            end
          else
            begin
              reg25 <= reg26;
              reg26 <= $unsigned(wire19);
            end
        end
      else
        begin
          reg24 <= ($unsigned((wire16[(3'h6):(2'h2)] << wire21)) | {(((!wire21) & wire18) - wire21[(1'h0):(1'h0)]),
              wire21[(1'h1):(1'h0)]});
        end
      reg27 <= wire18[(4'hd):(3'h7)];
      reg28 <= $signed((~{(-(wire19 ? reg23 : reg22))}));
    end
  assign wire29 = ((8'hbf) < reg28);
  assign wire30 = ($unsigned((wire29 ?
                          $unsigned(reg27[(3'h4):(1'h0)]) : wire18[(4'hb):(4'hb)])) ?
                      {((~&((8'hbd) ? reg23 : wire20)) == reg26[(4'hf):(3'h6)]),
                          wire16[(4'hc):(4'hb)]} : reg26);
  assign wire31 = wire18[(4'hb):(4'h9)];
  always
    @(posedge clk) begin
      reg32 <= (wire17[(1'h0):(1'h0)] ?
          (8'h9e) : ((~&$unsigned((reg26 ?
              reg28 : (8'hb3)))) >> {wire21[(3'h4):(2'h3)]}));
      reg33 <= reg28;
      reg34 <= reg25;
    end
  assign wire35 = reg32;
  assign wire36 = wire19[(2'h3):(2'h2)];
  assign wire37 = (~|wire19);
  assign wire38 = $signed(((^~wire21[(1'h0):(1'h0)]) >= ((~&$signed(reg33)) >= ($signed(reg24) >> (~reg25)))));
  always
    @(posedge clk) begin
      reg39 <= wire31[(3'h7):(1'h0)];
    end
  assign wire40 = $signed((!wire17[(2'h2):(2'h2)]));
endmodule

module module139
#(parameter param206 = ((~^(7'h42)) ? (|{((!(8'hb1)) ^ {(7'h41)}), ({(8'ha5)} * ((7'h41) + (8'ha9)))}) : (^~(~(~^((8'hb7) + (8'ha3)))))), 
parameter param207 = ((^(+(param206 ^~ param206))) >>> param206))
(y, clk, wire143, wire142, wire141, wire140);
  output wire [(32'h289):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire143;
  input wire [(5'h11):(1'h0)] wire142;
  input wire [(5'h11):(1'h0)] wire141;
  input wire [(4'hf):(1'h0)] wire140;
  wire [(4'he):(1'h0)] wire205;
  wire signed [(5'h15):(1'h0)] wire204;
  wire signed [(3'h4):(1'h0)] wire203;
  wire signed [(3'h7):(1'h0)] wire202;
  wire signed [(4'ha):(1'h0)] wire201;
  wire [(3'h5):(1'h0)] wire197;
  wire signed [(3'h4):(1'h0)] wire196;
  wire [(4'h9):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire152;
  wire [(4'he):(1'h0)] wire151;
  wire signed [(3'h5):(1'h0)] wire150;
  wire [(5'h11):(1'h0)] wire149;
  wire [(3'h7):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire147;
  wire signed [(4'h8):(1'h0)] wire146;
  reg signed [(4'h8):(1'h0)] reg200 = (1'h0);
  reg [(4'ha):(1'h0)] reg199 = (1'h0);
  reg [(3'h5):(1'h0)] reg198 = (1'h0);
  reg [(5'h14):(1'h0)] reg195 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg194 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg193 = (1'h0);
  reg [(2'h3):(1'h0)] reg192 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg191 = (1'h0);
  reg [(4'h9):(1'h0)] reg190 = (1'h0);
  reg [(4'h8):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg188 = (1'h0);
  reg [(4'hb):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg184 = (1'h0);
  reg [(4'h8):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg181 = (1'h0);
  reg [(3'h7):(1'h0)] reg180 = (1'h0);
  reg [(5'h12):(1'h0)] reg179 = (1'h0);
  reg [(3'h4):(1'h0)] reg178 = (1'h0);
  reg [(2'h2):(1'h0)] reg177 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg174 = (1'h0);
  reg [(5'h14):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg172 = (1'h0);
  reg signed [(4'he):(1'h0)] reg171 = (1'h0);
  reg [(4'h9):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg168 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg167 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg165 = (1'h0);
  reg [(4'he):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg163 = (1'h0);
  reg [(4'he):(1'h0)] reg162 = (1'h0);
  reg [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg159 = (1'h0);
  reg [(4'hb):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg144 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire197,
                 wire196,
                 wire182,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 reg200,
                 reg199,
                 reg198,
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
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
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
                 reg145,
                 reg144,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg144 <= (~&{((wire140 | wire143) && $signed($unsigned(wire142)))});
      reg145 <= {$unsigned(wire140[(4'hb):(1'h1)]),
          $signed({{wire141, (wire140 ? wire142 : wire141)}})};
    end
  assign wire146 = $unsigned((|{((+wire143) < wire142)}));
  assign wire147 = ((({(8'hb2), reg144} && reg144) - (reg145[(1'h0):(1'h0)] ?
                       wire142[(1'h0):(1'h0)] : $unsigned((~|wire143)))) > wire141);
  assign wire148 = ((~^(&(wire140 ^ $signed(wire141)))) ?
                       $unsigned($unsigned(((!wire147) << wire141))) : wire140[(3'h5):(2'h3)]);
  assign wire149 = (|(~$unsigned({(wire147 >>> (7'h44))})));
  assign wire150 = (wire141 >> (&$signed({$signed((8'ha9)),
                       $unsigned(wire140)})));
  assign wire151 = $signed($unsigned(wire142));
  assign wire152 = $unsigned(wire143);
  always
    @(posedge clk) begin
      reg153 <= (wire148[(3'h6):(2'h2)] ? wire146[(3'h7):(1'h0)] : wire146);
      reg154 <= ($unsigned(wire148[(2'h2):(2'h2)]) ?
          ((8'h9e) ?
              (^(|(|reg144))) : ({$unsigned(wire142)} & $unsigned($unsigned(wire148)))) : {((~^$unsigned(wire141)) ?
                  $unsigned({(8'hb0), reg153}) : $unsigned(wire150)),
              (8'h9f)});
      reg155 <= {((wire147 > (wire142 ~^ reg154[(1'h0):(1'h0)])) & wire151),
          (8'hbd)};
      reg156 <= $signed(wire147);
    end
  always
    @(posedge clk) begin
      reg157 <= ($signed($signed((^~wire151[(4'hb):(2'h2)]))) <<< wire141[(5'h11):(3'h7)]);
      if ($signed(($unsigned((^~$unsigned(reg145))) ?
          wire152 : $unsigned({wire143}))))
        begin
          reg158 <= (wire148[(1'h0):(1'h0)] ?
              ($unsigned(reg144) ?
                  {$unsigned((reg153 ? reg145 : wire146)),
                      $unsigned($signed(reg157))} : $unsigned((8'haf))) : $unsigned($unsigned(wire147)));
          if (((+reg156) ?
              (^~$unsigned($unsigned(reg157[(4'hb):(4'ha)]))) : reg145[(1'h0):(1'h0)]))
            begin
              reg159 <= wire149[(4'h9):(1'h0)];
              reg160 <= (|wire141[(2'h3):(2'h2)]);
              reg161 <= $signed(wire148[(2'h2):(1'h0)]);
              reg162 <= $unsigned($unsigned(reg156[(1'h1):(1'h0)]));
            end
          else
            begin
              reg159 <= $signed(((+reg145[(1'h0):(1'h0)]) ?
                  wire143 : wire150[(1'h1):(1'h0)]));
              reg160 <= $signed(($unsigned($signed((wire152 ?
                      wire150 : wire141))) ?
                  ((-(reg160 >>> reg145)) ?
                      wire151[(3'h6):(2'h2)] : (&(reg155 ?
                          wire149 : (8'ha8)))) : (+$signed((reg154 >= reg144)))));
            end
          reg163 <= $signed(wire140);
          reg164 <= wire152;
          reg165 <= reg155;
        end
      else
        begin
          reg158 <= $signed(reg161);
          reg159 <= (^(+wire140));
          reg160 <= reg165[(2'h3):(2'h3)];
          reg161 <= reg156;
        end
    end
  always
    @(posedge clk) begin
      if ((((^(-(reg165 >>> reg153))) == $unsigned(($signed(wire141) > $signed(reg157)))) && (($unsigned($unsigned(reg165)) || ({reg163} + $signed((8'hac)))) ?
          ($signed((8'hb0)) ? reg155 : reg162) : {(~|((8'hb8) ?
                  wire141 : (8'ha8)))})))
        begin
          reg166 <= (reg165 ^ {$signed($unsigned(((7'h40) ?
                  (8'h9e) : wire143))),
              (8'hb8)});
          reg167 <= (reg164 ?
              (~|$signed($unsigned(((8'hb8) ~^ wire140)))) : $unsigned(({wire146[(1'h1):(1'h1)],
                      (wire148 + reg164)} ?
                  {(8'ha9)} : {reg154, (~reg164)})));
          reg168 <= ($signed(reg144) && wire152);
          if ((+reg159[(4'h8):(1'h0)]))
            begin
              reg169 <= $unsigned(reg164[(2'h3):(1'h0)]);
              reg170 <= reg160;
              reg171 <= reg169[(1'h1):(1'h0)];
              reg172 <= {reg154};
            end
          else
            begin
              reg169 <= {$unsigned(reg164[(4'hb):(2'h3)]),
                  $unsigned({((!reg168) ~^ ((8'hb2) ? wire149 : reg159))})};
              reg170 <= {(reg153[(1'h0):(1'h0)] || wire147),
                  $signed(((^~$signed(reg158)) >= ((reg158 ?
                      wire149 : wire142) || (~^reg162))))};
            end
        end
      else
        begin
          reg166 <= $unsigned($signed($signed((&wire152[(3'h6):(3'h4)]))));
          reg167 <= reg164[(4'ha):(4'ha)];
        end
      if (reg168)
        begin
          reg173 <= $signed(wire151);
        end
      else
        begin
          reg173 <= ($unsigned((($unsigned(reg158) + reg172[(5'h13):(1'h1)]) ?
                  (~^(+wire150)) : $unsigned({wire142}))) ?
              $signed(reg155[(2'h2):(1'h0)]) : ({(8'hb3),
                  (|$signed(wire140))} - $signed($unsigned($unsigned(wire151)))));
          if ((($unsigned(wire142[(4'hb):(4'ha)]) && reg172[(4'hf):(4'he)]) + {$unsigned($unsigned($signed(wire142)))}))
            begin
              reg174 <= reg167[(4'h9):(1'h1)];
              reg175 <= $unsigned(reg165);
              reg176 <= reg165;
              reg177 <= (reg173 << (reg166[(3'h6):(1'h0)] ?
                  reg168[(3'h7):(3'h7)] : $unsigned((-reg160))));
              reg178 <= $signed((-{((reg162 ? (8'hb9) : reg144) ?
                      {(8'hb4)} : reg144)}));
            end
          else
            begin
              reg174 <= reg177[(1'h1):(1'h1)];
              reg175 <= reg172[(4'h9):(3'h6)];
              reg176 <= (^(8'h9e));
              reg177 <= (wire142[(4'ha):(4'h9)] ?
                  $signed(((~reg158[(2'h3):(1'h0)]) << {(wire152 >> reg172)})) : $signed((reg162 <<< $unsigned((|reg163)))));
            end
        end
      reg179 <= $unsigned(($signed(reg160) | reg173));
      reg180 <= ($signed(reg165[(1'h0):(1'h0)]) > $signed($unsigned(({reg145} ~^ (wire150 ?
          reg166 : (8'ha1))))));
      reg181 <= reg173;
    end
  assign wire182 = (+reg157[(3'h6):(1'h1)]);
  always
    @(posedge clk) begin
      reg183 <= (($unsigned((reg158 | ((7'h43) ? wire152 : wire146))) ?
              wire148[(3'h5):(2'h2)] : reg172[(4'hf):(3'h6)]) ?
          wire147 : reg181);
      reg184 <= reg156[(4'he):(4'h8)];
      if ((reg144[(3'h7):(3'h7)] ^ $unsigned(reg183[(1'h1):(1'h0)])))
        begin
          reg185 <= $signed((|{$unsigned(reg159[(5'h11):(1'h1)]),
              $signed((reg167 ? reg167 : reg154))}));
          reg186 <= ($signed($unsigned((((8'hbc) ? (8'ha8) : reg156) ?
              reg168 : (reg160 ? reg183 : reg157)))) == ((((reg183 ?
                  wire149 : reg175) ?
              {reg172} : (wire146 && reg184)) != (reg173 ?
              (~^(8'ha5)) : $signed(reg185))) ^~ ($signed(reg181) ?
              wire141[(3'h4):(1'h0)] : reg166[(4'h9):(3'h4)])));
          reg187 <= (8'hb3);
          reg188 <= (^(^(8'ha2)));
        end
      else
        begin
          reg185 <= ((reg183 ^~ {$signed(((8'hb5) < reg186)),
                  (reg154 ? reg155 : $unsigned(wire141))}) ?
              wire146[(1'h1):(1'h0)] : $unsigned((reg161[(1'h0):(1'h0)] ?
                  $signed({reg168}) : $unsigned({(8'hb9), (8'hab)}))));
        end
    end
  always
    @(posedge clk) begin
      if ((~|($signed(((wire182 ? (8'ha2) : reg153) >> (reg178 ?
              wire150 : reg178))) ?
          $signed(wire150) : reg157)))
        begin
          reg189 <= $unsigned(($unsigned($unsigned((wire150 && reg165))) ?
              reg172 : ($signed($signed(wire140)) ?
                  wire143 : reg173[(5'h13):(2'h3)])));
          reg190 <= ((reg181 ?
              $signed(((~reg185) ?
                  {wire141} : (~|reg161))) : $unsigned({$signed((8'hac)),
                  (wire146 ?
                      reg164 : reg187)})) << (+(reg183 <= (~^(+reg158)))));
          reg191 <= $unsigned((!reg173));
          reg192 <= reg183;
          reg193 <= ($unsigned($signed(((reg172 <<< reg169) << $unsigned(reg180)))) >> $unsigned(reg181));
        end
      else
        begin
          reg189 <= (((~reg166[(3'h4):(1'h0)]) ?
              $signed($signed((&wire146))) : {$unsigned({(8'ha3)})}) ~^ reg174[(4'hf):(1'h0)]);
          reg190 <= $signed(((~^reg193) ^~ wire152[(3'h6):(3'h5)]));
          reg191 <= ((^~(8'ha2)) ? {(+(8'ha9))} : reg189[(2'h3):(2'h3)]);
        end
      reg194 <= ((reg145[(1'h1):(1'h0)] - {$unsigned((&reg155))}) <<< reg186[(2'h2):(1'h0)]);
      reg195 <= reg166;
    end
  assign wire196 = reg177;
  assign wire197 = reg156;
  always
    @(posedge clk) begin
      reg198 <= (($signed({(reg163 - reg156), (reg157 && (7'h42))}) ?
          $unsigned((((8'hbb) ? reg189 : reg179) ?
              $unsigned(wire197) : ((8'h9d) ? (8'ha9) : reg194))) : {{{reg177}},
              reg193}) | $signed(reg194));
      reg199 <= $unsigned((reg154[(3'h6):(1'h0)] ?
          ($signed((reg165 ^ (8'hb8))) <<< reg191) : (~^(reg158[(4'h8):(3'h5)] < (reg188 & reg171)))));
      reg200 <= (^~$unsigned({reg178}));
    end
  assign wire201 = (^$unsigned(reg144));
  assign wire202 = reg176;
  assign wire203 = (^$signed($unsigned((reg200 ?
                       reg199[(4'h8):(1'h1)] : (8'hbf)))));
  assign wire204 = $signed({wire203});
  assign wire205 = reg185[(4'he):(3'h5)];
endmodule

module module96
#(parameter param125 = {(((((8'ha9) >= (8'hae)) ? ((8'ha4) ? (8'hbe) : (8'h9e)) : (&(8'hac))) ? (~|((7'h40) <<< (8'hbf))) : (|{(8'hba)})) ? ((^((7'h43) == (8'hae))) ? (~(8'ha9)) : ((+(8'ha4)) ? ((7'h42) & (8'hb1)) : ((8'had) >= (8'haa)))) : (((8'had) >> (~^(8'ha4))) << (((7'h41) && (8'ha0)) ? {(8'hb4), (8'haa)} : ((8'hb2) > (8'hbb))))), ({((8'hb9) != ((8'hb8) <= (8'hb9))), (((8'ha8) ? (8'hae) : (8'hbb)) && ((8'haf) ? (8'haa) : (8'h9f)))} ? ((~&(!(8'ha9))) == (8'haa)) : (~|({(8'h9d), (7'h41)} ? (~^(8'hbc)) : ((8'hb5) > (8'hb3)))))})
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire100;
  input wire [(5'h13):(1'h0)] wire99;
  input wire signed [(4'hc):(1'h0)] wire98;
  input wire [(5'h11):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire116;
  wire signed [(5'h13):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire109;
  wire [(4'hc):(1'h0)] wire108;
  wire [(3'h4):(1'h0)] wire102;
  wire [(4'he):(1'h0)] wire101;
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  assign y = {wire116,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire102,
                 wire101,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg115,
                 reg114,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire101 = {$unsigned(($signed($unsigned(wire99)) ?
                           $signed((wire99 | (8'ha2))) : (((8'hbb) ?
                               wire97 : wire98) ~^ (wire98 >> wire99)))),
                       (~&(((wire99 ? wire97 : wire100) ?
                               (wire98 ?
                                   wire99 : wire98) : wire99[(4'hd):(4'hd)]) ?
                           {(wire99 ?
                                   (7'h42) : wire98)} : ($signed(wire98) + wire97)))};
  assign wire102 = wire100;
  always
    @(posedge clk) begin
      reg103 <= wire101[(3'h7):(3'h7)];
      reg104 <= $signed((|((wire98[(1'h1):(1'h0)] ^ $unsigned(wire101)) << $signed(wire97[(5'h10):(4'ha)]))));
      reg105 <= (reg103[(1'h0):(1'h0)] | {(^~{$unsigned(reg104)})});
      if ((!wire100[(4'h9):(2'h3)]))
        begin
          reg106 <= ($unsigned({(^~wire101[(4'he):(4'h8)]),
                  (^(reg105 ? wire100 : wire98))}) ?
              reg105[(1'h0):(1'h0)] : wire100);
          reg107 <= ((8'hba) * ({(~&$unsigned(wire101))} ?
              ($signed({(8'ha8)}) ?
                  (8'hb0) : {(7'h42)}) : $unsigned(($signed(wire97) ?
                  $unsigned(wire100) : (8'haa)))));
        end
      else
        begin
          reg106 <= $signed(($signed((~&(wire101 - wire100))) ^~ (~$signed($signed(wire100)))));
        end
    end
  assign wire108 = (!wire99);
  assign wire109 = ({(((reg103 ? wire102 : (8'hb6)) && (reg103 ?
                               wire98 : (8'h9f))) ?
                           ((wire100 >> (8'hb3)) < reg106) : $unsigned((~|(8'hb4)))),
                       reg105[(2'h2):(1'h1)]} & ((8'had) ?
                       wire98[(3'h4):(1'h1)] : ($unsigned((&reg103)) ?
                           ((wire97 == reg103) >> {(8'hbc),
                               (8'hbd)}) : $unsigned(reg106[(1'h0):(1'h0)]))));
  assign wire110 = $unsigned($unsigned(wire98[(4'hb):(3'h6)]));
  assign wire111 = $signed($signed(($signed((reg103 ? (8'h9c) : wire99)) ?
                       (wire98[(1'h0):(1'h0)] << $signed(wire108)) : wire98[(4'hc):(4'ha)])));
  assign wire112 = reg107;
  assign wire113 = {reg106};
  always
    @(posedge clk) begin
      reg114 <= $unsigned(wire109);
      reg115 <= {{$signed((reg105[(1'h0):(1'h0)] ?
                  $signed((8'h9e)) : (~|wire110))),
              reg106[(1'h1):(1'h1)]},
          ($signed(((+(8'hb9)) ? (wire111 ? (8'ha2) : wire113) : (~(8'hbe)))) ?
              (|(~^wire100)) : ($signed((wire108 | wire102)) ^~ (~|(-(8'h9e)))))};
    end
  assign wire116 = (wire111[(4'h9):(2'h2)] ?
                       $unsigned($unsigned(reg115)) : wire113[(3'h5):(2'h3)]);
  always
    @(posedge clk) begin
      if ($signed($unsigned(((8'hb6) ? wire112[(3'h7):(3'h6)] : (~{(8'hb3)})))))
        begin
          reg117 <= reg106;
          if ({((~|wire116) ?
                  $unsigned((reg117[(1'h1):(1'h1)] ?
                      (^reg106) : (reg107 ?
                          wire102 : wire109))) : $signed($unsigned(reg103)))})
            begin
              reg118 <= $unsigned(wire113[(1'h0):(1'h0)]);
              reg119 <= wire101[(3'h7):(3'h7)];
              reg120 <= $signed(reg107[(1'h0):(1'h0)]);
            end
          else
            begin
              reg118 <= (-reg118);
              reg119 <= {(~(wire109[(4'h9):(4'h9)] ?
                      wire116[(4'h9):(2'h3)] : wire99)),
                  ($signed({$signed(reg118), wire110}) ?
                      (reg114 ?
                          (reg103 >= ((8'haa) >> reg104)) : (~|$unsigned(wire100))) : (({wire100} * {wire97}) ?
                          wire108[(3'h7):(2'h2)] : (-(~|reg103))))};
            end
        end
      else
        begin
          reg117 <= reg117;
          reg118 <= ((((reg104 <<< $signed(wire108)) == reg114[(3'h7):(1'h0)]) == (~^wire97)) ~^ $signed(reg105));
          if (wire110[(4'hc):(3'h5)])
            begin
              reg119 <= reg106;
            end
          else
            begin
              reg119 <= {(8'hb3), $unsigned($unsigned((^$unsigned((8'ha9)))))};
              reg120 <= $unsigned(wire108);
              reg121 <= (&$signed(((wire97[(2'h3):(1'h0)] != $signed(reg115)) ?
                  (((7'h44) ? wire109 : wire102) ?
                      (wire102 ?
                          reg107 : wire116) : (wire116 ~^ wire102)) : wire116[(4'hb):(4'hb)])));
              reg122 <= $signed((8'hbe));
            end
          reg123 <= $signed((-(8'ha1)));
        end
      reg124 <= reg105[(1'h0):(1'h0)];
    end
endmodule

module module71  (y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire75;
  input wire signed [(4'ha):(1'h0)] wire74;
  input wire [(5'h14):(1'h0)] wire73;
  input wire [(5'h11):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  assign y = {wire80, wire79, wire78, wire77, wire76, (1'h0)};
  assign wire76 = (wire73[(3'h4):(3'h4)] - (8'hb6));
  assign wire77 = wire75;
  assign wire78 = wire77[(1'h1):(1'h1)];
  assign wire79 = $signed(wire75);
  assign wire80 = $signed((^wire77[(2'h2):(1'h0)]));
endmodule
