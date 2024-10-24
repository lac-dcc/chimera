module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  wire [(5'h11):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire102;
  wire signed [(4'hc):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire8;
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire100,
                 wire99,
                 wire97,
                 wire8,
                 reg101,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire3[(4'he):(3'h7)])
        begin
          reg4 <= $unsigned($unsigned(($unsigned((wire3 ?
              wire3 : wire0)) != (wire0 * (wire1 ? wire2 : wire1)))));
        end
      else
        begin
          reg4 <= wire3[(4'he):(1'h0)];
          reg5 <= $unsigned((&{((wire3 && wire0) * $signed(wire0)),
              $unsigned(wire2[(2'h2):(2'h2)])}));
        end
      reg6 <= reg5[(4'ha):(3'h6)];
      reg7 <= (reg5 ? reg6[(4'hc):(4'hc)] : $signed((^~wire1[(4'hf):(3'h7)])));
    end
  assign wire8 = $signed($signed((~((8'hb6) > $unsigned(wire2)))));
  module9 #() modinst98 (.wire12(wire8), .wire10(reg7), .clk(clk), .wire11(wire0), .y(wire97), .wire13(reg5));
  assign wire99 = (~&(($unsigned($signed((8'h9d))) || (7'h41)) && $unsigned($signed((^reg4)))));
  assign wire100 = wire99[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg101 <= $signed((wire100 == $signed({reg7[(5'h12):(4'hf)],
          $unsigned(wire0)})));
    end
  assign wire102 = ($signed((((reg6 << reg101) ^~ $unsigned((8'hbd))) > (~|$unsigned(reg4)))) ?
                       $unsigned((^~($signed(wire99) ?
                           reg4 : (~reg6)))) : ($signed((~&wire0[(1'h0):(1'h0)])) >> wire2));
  assign wire103 = $unsigned($unsigned({reg6, wire3}));
  assign wire104 = $unsigned(reg7[(1'h1):(1'h0)]);
  assign wire105 = ((reg7 ~^ wire1) <<< $signed(wire3[(1'h0):(1'h0)]));
  assign wire106 = (8'ha8);
  assign wire107 = $unsigned(wire3[(5'h11):(2'h2)]);
endmodule

module module9
#(parameter param95 = ((((((8'ha1) >= (8'ha5)) ? (^(8'h9c)) : ((8'ha4) ? (7'h42) : (8'hbf))) ? (^((7'h40) ? (8'hb3) : (8'ha5))) : (&((8'hb9) | (7'h43)))) + ((((7'h42) && (8'ha9)) ? ((8'hb8) ? (8'hae) : (8'hbf)) : ((8'ha8) ? (8'hb7) : (8'ha9))) ? (((8'hab) - (7'h41)) ? {(8'hbd), (8'h9c)} : ((8'hb7) ^ (8'ha3))) : (~&(-(8'ha3))))) ^ (((^{(7'h42), (8'ha7)}) ? ((|(8'haa)) << (~^(8'hb1))) : (((8'ha1) * (8'ha8)) & ((8'hb0) | (8'ha8)))) ? ((!((8'hb5) ^ (8'hbd))) ? (-((8'hbe) ^ (8'had))) : (((8'hac) - (8'h9f)) - {(8'hb0)})) : ((((8'ha0) | (8'hb4)) ? (~^(8'ha0)) : ((8'hb8) ? (8'hbd) : (8'haf))) ? (((7'h41) ? (8'ha8) : (8'ha2)) >>> (-(8'hb2))) : ((^(8'hb0)) >>> (~&(8'hba)))))), 
parameter param96 = (((((param95 ^~ param95) != (param95 < param95)) ? ((param95 < param95) ? (!param95) : (param95 ~^ param95)) : (8'ha0)) < ((^~(param95 >= param95)) ? (|(param95 ? param95 : (8'ha3))) : param95)) ? (~^(((8'h9e) >= (param95 != param95)) ? {param95, (param95 ? (8'hb6) : param95)} : ((param95 - param95) <= (param95 ? param95 : param95)))) : (param95 ? ((~param95) ? (~(7'h42)) : (|(param95 ? param95 : param95))) : (+((param95 ? param95 : param95) ? param95 : (param95 ? param95 : param95))))))
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire90;
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire14,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire90,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg30,
                 reg31,
                 (1'h0)};
  assign wire14 = ($signed(wire10[(1'h1):(1'h1)]) ?
                      wire10 : (wire11[(3'h5):(1'h0)] ?
                          ($unsigned($unsigned(wire13)) >= $unsigned($signed(wire11))) : (~(8'had))));
  always
    @(posedge clk) begin
      if ($unsigned(wire10))
        begin
          reg15 <= wire11;
          reg16 <= $signed((wire14[(3'h6):(1'h0)] ?
              {$signed($unsigned(wire12)), wire13} : $signed(wire11)));
          if (({$signed(((reg15 ~^ wire11) ?
                      (wire11 && reg15) : (wire12 ? wire14 : wire12))),
                  $unsigned((reg16 ? (8'h9f) : (reg15 ? reg16 : wire10)))} ?
              {($unsigned((!reg15)) ?
                      ($signed(wire11) && (-wire10)) : (8'ha9))} : $signed(wire13[(1'h1):(1'h0)])))
            begin
              reg17 <= reg16[(3'h6):(2'h3)];
              reg18 <= wire11[(3'h5):(3'h5)];
            end
          else
            begin
              reg17 <= (wire13[(3'h4):(1'h0)] || {reg15[(1'h0):(1'h0)]});
              reg18 <= (~&$signed((reg15[(1'h0):(1'h0)] ?
                  (wire13 <= {(8'hba)}) : ($unsigned(reg16) <= (wire12 * reg16)))));
              reg19 <= reg16;
              reg20 <= ($unsigned(wire10[(1'h0):(1'h0)]) >>> $signed($unsigned((((8'haf) ?
                  (8'hba) : wire11) + reg18))));
            end
        end
      else
        begin
          reg15 <= $unsigned((wire11 ?
              (((reg19 & reg19) ?
                  wire12 : (-wire12)) << (!(|reg19))) : ((wire13[(2'h2):(1'h1)] - ((8'ha2) << wire13)) ?
                  $signed((wire13 ?
                      (8'hb6) : reg15)) : (reg18[(4'he):(3'h6)] | (!wire10)))));
          reg16 <= wire13;
          reg17 <= ((-reg17) ?
              $signed((wire11 ?
                  $unsigned((wire10 ?
                      reg15 : wire10)) : (|reg19))) : (reg19 ^~ reg15));
        end
      reg21 <= (!wire12);
      reg22 <= $unsigned((wire10[(2'h3):(2'h2)] ^~ ($unsigned((wire10 - wire11)) ?
          reg20[(2'h2):(1'h1)] : (|wire11))));
      reg23 <= reg21[(3'h7):(3'h5)];
    end
  assign wire24 = $signed((((~&reg23) ~^ $unsigned((~^reg17))) ?
                      reg21 : wire14));
  assign wire25 = $unsigned((+reg22));
  assign wire26 = {(reg22[(3'h5):(3'h5)] | (reg21[(3'h5):(3'h4)] >= (-wire25))),
                      $unsigned(wire13[(3'h5):(2'h2)])};
  assign wire27 = ((8'hac) ?
                      {(~&$signed((reg20 ?
                              reg19 : wire12)))} : wire26[(3'h4):(2'h2)]);
  assign wire28 = ((-($unsigned(((8'hb8) >> wire14)) != ($unsigned(reg19) ^ wire26[(3'h4):(1'h1)]))) ?
                      ((8'hbd) <= ((~&(8'ha0)) > (^reg21[(2'h3):(1'h1)]))) : ($signed((+wire12)) ?
                          $signed({(^~wire24)}) : (!{(wire10 ?
                                  wire14 : reg22)})));
  assign wire29 = $unsigned(reg18);
  always
    @(posedge clk) begin
      reg30 <= (8'hb4);
      reg31 <= (8'ha4);
    end
  assign wire32 = {(((wire11 ? reg23[(2'h3):(1'h1)] : reg21) ?
                              reg22[(1'h1):(1'h1)] : (-wire13[(3'h6):(3'h5)])) ?
                          $unsigned($signed(reg22)) : wire26)};
  assign wire33 = (wire13[(4'h8):(1'h1)] ?
                      $unsigned(((8'ha5) >>> wire11)) : ({(^~{wire25, reg15}),
                          (reg17 ^ $signed(reg19))} <= reg31));
  assign wire34 = $unsigned($unsigned(reg21[(2'h3):(2'h3)]));
  assign wire35 = ($signed($signed((&$unsigned(wire11)))) ^ reg22[(4'h9):(3'h5)]);
  assign wire36 = (^(^{$signed($signed(wire14)), (|(reg15 - wire34))}));
  assign wire37 = (^$unsigned(wire24[(3'h4):(1'h1)]));
  assign wire38 = wire24;
  assign wire39 = $signed(wire35[(3'h7):(3'h7)]);
  assign wire40 = ($signed(wire25[(4'hd):(4'hc)]) >> $unsigned(wire14[(3'h5):(3'h5)]));
  module41 #() modinst91 (.y(wire90), .clk(clk), .wire43(wire39), .wire44(reg20), .wire45(reg18), .wire42(reg19));
  assign wire92 = $unsigned({$signed($signed(reg20)),
                      $signed(($signed(wire34) | (reg22 && wire14)))});
  assign wire93 = (^~(8'hb8));
  assign wire94 = ((reg31 - reg16) ?
                      reg19 : (reg21 << ($signed((reg22 ? wire92 : wire40)) ?
                          wire39 : $signed(((8'hb8) ? reg21 : reg30)))));
endmodule

module module41
#(parameter param88 = (!(|((((8'hb3) > (8'hbc)) ? {(8'h9e), (8'h9e)} : (~^(8'hbd))) ? (~^((7'h44) ? (7'h43) : (8'hba))) : {((8'hac) & (8'h9e))}))), 
parameter param89 = ((((~^(~&param88)) || {(+param88)}) ? param88 : (((param88 > param88) ? (param88 ? param88 : (8'hac)) : (param88 <<< param88)) ? param88 : {(!param88), (param88 ? param88 : param88)})) ~^ (^((^param88) ? param88 : (((8'ha2) <= (8'haa)) ? (param88 || param88) : (param88 ? param88 : param88))))))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h1ee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire45;
  input wire [(4'hd):(1'h0)] wire44;
  input wire signed [(5'h14):(1'h0)] wire43;
  input wire [(4'h9):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  assign y = {wire87,
                 wire65,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
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
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire46 = wire42;
  assign wire47 = (((8'hb3) ? wire43 : (~&$signed($signed((8'haa))))) ?
                      wire45[(3'h7):(3'h7)] : (wire43 && wire42));
  assign wire48 = (8'hbe);
  assign wire49 = (($unsigned((~(^~wire43))) >>> (!wire46[(3'h7):(2'h2)])) ?
                      $signed({$signed(wire45),
                          $unsigned($unsigned(wire43))}) : wire43[(3'h4):(3'h4)]);
  assign wire50 = {{((((8'hbd) ? wire43 : (8'hba)) ?
                                  {(8'ha5), wire44} : (wire46 ?
                                      wire42 : wire46)) ?
                              (wire45 != $signed(wire46)) : wire43),
                          $unsigned((|(wire46 <= wire42)))}};
  assign wire51 = {wire48[(3'h5):(2'h3)]};
  assign wire52 = (wire46[(2'h3):(1'h1)] ?
                      {wire50} : (^$signed(wire45[(1'h1):(1'h0)])));
  assign wire53 = $unsigned((wire50[(3'h4):(3'h4)] ?
                      (^~(-$signed(wire49))) : (wire48[(4'he):(3'h4)] >= {$signed(wire45),
                          wire49})));
  assign wire54 = (((wire46[(1'h0):(1'h0)] ?
                      (8'hbb) : wire49[(4'hc):(3'h6)]) & (^~(&(~^wire43)))) >>> $signed(((((8'ha4) | wire43) > wire47) << ($unsigned(wire48) ?
                      $signed(wire44) : wire43))));
  assign wire55 = wire53;
  always
    @(posedge clk) begin
      if (({$signed(((8'h9d) <<< $signed(wire49)))} >> (+{($unsigned(wire43) ?
              (wire47 ? (8'ha7) : wire45) : wire50[(3'h4):(2'h3)])})))
        begin
          reg56 <= $signed((~|$unsigned($unsigned((wire43 ^~ wire45)))));
          if (wire42)
            begin
              reg57 <= $unsigned(((wire47 < $signed((~&wire49))) ?
                  (+wire43) : (8'ha1)));
            end
          else
            begin
              reg57 <= wire52;
              reg58 <= reg57[(4'h8):(4'h8)];
              reg59 <= (|reg56[(4'hd):(3'h5)]);
            end
        end
      else
        begin
          reg56 <= $signed((({$unsigned(wire46), $unsigned(wire43)} + wire49) ?
              (((wire48 && wire46) ?
                  (~|reg59) : wire55) ^~ (~wire48[(3'h7):(1'h1)])) : (&(^~{wire45}))));
          reg57 <= (((((reg56 ? reg56 : wire55) <= ((8'hb5) ? wire46 : reg57)) ?
              wire49[(2'h2):(1'h1)] : (|(wire49 ?
                  (7'h43) : wire42))) <= {$unsigned(reg57[(4'hb):(3'h4)]),
              ((^wire50) ? wire46 : wire52)}) ^~ (({$signed(wire45),
                  $signed((8'h9d))} - (^~$signed((8'ha6)))) ?
              (^($signed(wire49) ?
                  (|wire44) : ((8'ha1) >= wire51))) : wire48[(3'h4):(1'h1)]));
          reg58 <= $signed(wire54[(4'hc):(3'h5)]);
          reg59 <= $unsigned((~&(^$signed(reg59))));
        end
      reg60 <= ((~^(((wire42 || wire47) ?
              $unsigned(reg56) : (~&wire49)) + wire45)) ?
          ((($unsigned((8'hab)) ?
                  (wire50 ?
                      wire51 : wire43) : $signed(wire53)) != (^~$unsigned(reg58))) ?
              (8'haa) : (({wire54, (8'hbe)} ?
                      reg58[(4'hf):(4'hd)] : $unsigned(wire44)) ?
                  wire49 : (-{wire53}))) : $unsigned((wire46[(4'h9):(3'h7)] ?
              $unsigned(wire52[(4'ha):(3'h6)]) : $unsigned($unsigned(wire49)))));
      reg61 <= ((8'ha4) ? wire54 : $signed(wire42));
      reg62 <= wire52;
      if ($signed((($signed($unsigned((8'ha2))) ?
              ($unsigned(wire48) ?
                  (8'hba) : $unsigned(wire52)) : ($signed(reg62) ?
                  $unsigned(wire50) : $signed(reg60))) ?
          $unsigned({wire46[(4'h9):(1'h1)]}) : reg58)))
        begin
          reg63 <= ($signed($unsigned($signed((wire43 ~^ reg59)))) & (~reg59));
          reg64 <= $signed(wire42);
        end
      else
        begin
          reg63 <= wire44[(4'h9):(4'h9)];
          reg64 <= wire45;
        end
    end
  assign wire65 = ({($signed(reg61) && ($unsigned(wire50) == $signed(reg57))),
                          $unsigned(wire43[(4'hd):(3'h5)])} ?
                      ((~(^~(&wire45))) < wire46[(5'h12):(4'h9)]) : (($unsigned((~(8'ha4))) >>> ((!reg63) && (|reg57))) ?
                          wire54[(5'h12):(3'h4)] : $signed(reg61[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      reg66 <= ($unsigned({$unsigned($unsigned(reg63)),
              $signed(((8'hae) ? wire42 : reg63))}) ?
          reg62[(2'h2):(1'h1)] : $signed({{{wire53}, (reg64 & reg62)}}));
      if ((wire54[(3'h5):(3'h5)] ^~ wire44[(4'ha):(1'h1)]))
        begin
          reg67 <= ($unsigned($unsigned(((reg62 <= reg58) || $unsigned(wire54)))) ?
              ($signed(({(8'hb9)} ?
                  {wire43,
                      reg60} : $unsigned(wire44))) & $unsigned({(^wire55)})) : (~|reg58));
          reg68 <= {reg64};
          if (($unsigned({(-{(8'hbc)}), ((~|reg58) == wire52)}) ?
              $signed(($unsigned((&reg59)) ~^ $signed((~^reg56)))) : $signed(((wire43 * $signed((8'ha0))) ?
                  (~^(wire48 ? wire53 : reg68)) : $signed((&reg63))))))
            begin
              reg69 <= $signed({wire51[(4'h9):(4'h9)], reg57[(4'hc):(1'h0)]});
              reg70 <= ((~$unsigned(wire44)) << $unsigned({wire42}));
            end
          else
            begin
              reg69 <= $signed((wire45[(4'ha):(3'h5)] ?
                  reg61[(1'h1):(1'h0)] : (reg67[(1'h0):(1'h0)] ^ {$unsigned(reg69)})));
            end
        end
      else
        begin
          if ((((~^((~^(8'hbe)) ?
                  (reg64 && wire44) : {wire46,
                      reg66})) == $unsigned({$unsigned(wire49)})) ?
              ((|(-(reg56 + (7'h40)))) ?
                  ($unsigned((~^wire52)) ?
                      $unsigned((wire53 + reg68)) : $signed((reg56 < wire51))) : (^~$signed($signed(reg62)))) : (reg59[(2'h2):(1'h1)] ?
                  (wire54[(3'h4):(3'h4)] ?
                      $signed((wire42 ?
                          reg56 : wire42)) : {reg70}) : wire45[(4'h8):(4'h8)])))
            begin
              reg67 <= (reg68[(4'h9):(4'h9)] ?
                  $signed(wire51[(2'h2):(2'h2)]) : (~^$signed(wire43[(4'ha):(3'h6)])));
              reg68 <= ((^wire53) ^ wire46[(5'h12):(4'ha)]);
              reg69 <= (~((&{(reg56 + wire52)}) ?
                  wire47 : (!($unsigned(wire48) == $signed(reg60)))));
              reg70 <= ($signed($signed($signed(wire48))) ?
                  ((reg68 ?
                          $unsigned({wire49}) : ($unsigned(wire42) != $signed(wire46))) ?
                      reg69[(3'h5):(1'h0)] : $signed($unsigned(reg57[(4'he):(4'he)]))) : reg61);
              reg71 <= {$unsigned(wire50[(1'h1):(1'h0)]), $signed(reg57)};
            end
          else
            begin
              reg67 <= $signed($signed($signed(({reg66} ?
                  reg70[(3'h7):(1'h1)] : (!reg57)))));
            end
          if (reg58[(1'h0):(1'h0)])
            begin
              reg72 <= (|($unsigned(((reg66 ? wire51 : reg68) ?
                  wire65[(3'h6):(3'h4)] : (wire48 >>> reg64))) * reg70));
            end
          else
            begin
              reg72 <= wire53;
            end
          reg73 <= (reg68[(4'ha):(4'h9)] ?
              (~(|((reg72 ? (8'hbc) : reg67) ?
                  $signed(reg69) : (wire43 >> (8'ha4))))) : (~$signed(reg58[(3'h5):(1'h1)])));
          reg74 <= wire54;
        end
    end
  always
    @(posedge clk) begin
      if (reg67[(4'he):(3'h4)])
        begin
          reg75 <= {wire47};
          reg76 <= reg69[(1'h1):(1'h1)];
          reg77 <= wire43[(3'h5):(1'h1)];
          if (wire50[(3'h5):(3'h4)])
            begin
              reg78 <= reg76;
              reg79 <= reg69;
            end
          else
            begin
              reg78 <= (wire51[(3'h5):(3'h4)] ~^ ($unsigned($unsigned(((8'ha1) ?
                      reg64 : wire52))) ?
                  ($unsigned(reg79[(3'h5):(1'h1)]) ?
                      ((wire50 != reg59) ?
                          (wire53 ?
                              wire51 : wire53) : $unsigned(wire49)) : ($unsigned(reg57) ?
                          ((8'ha1) >> reg75) : (+wire43))) : wire52[(3'h4):(2'h2)]));
              reg79 <= (|$unsigned($signed(wire43)));
              reg80 <= reg76;
              reg81 <= reg59;
              reg82 <= ((8'hb9) ?
                  $unsigned(((+{wire47,
                      wire53}) << (^wire51[(4'h9):(4'h8)]))) : $signed(($unsigned({(8'hb3)}) ?
                      ($signed(wire51) != (wire55 & wire55)) : wire65)));
            end
        end
      else
        begin
          reg75 <= ($signed(reg58[(5'h11):(3'h4)]) - reg60);
          reg76 <= (wire65 ?
              reg58[(3'h6):(1'h1)] : {$signed(reg81[(1'h0):(1'h0)])});
          reg77 <= ((wire43[(1'h1):(1'h1)] - $signed(reg73)) ^ reg59[(2'h2):(1'h1)]);
        end
      reg83 <= ($signed(((~|$signed(wire45)) <<< (8'ha4))) ?
          ($unsigned($signed(reg64[(2'h2):(2'h2)])) >= ($unsigned((+reg61)) * $unsigned($signed(reg69)))) : {((^~{reg70,
                  reg80}) & (-wire52)),
              $unsigned($unsigned((^~wire52)))});
      reg84 <= (($unsigned(reg77[(1'h0):(1'h0)]) ?
              $unsigned((-$signed(reg74))) : $signed(reg67[(4'hd):(3'h7)])) ?
          (|$unsigned($signed(reg70))) : $signed((^~($signed(reg56) ?
              {wire45, wire54} : (wire65 ? reg81 : wire44)))));
      reg85 <= $unsigned($unsigned($signed(((wire44 ?
          wire53 : wire65) << $unsigned(wire47)))));
      reg86 <= ($signed(reg59[(1'h0):(1'h0)]) * $unsigned({reg57[(3'h7):(3'h6)]}));
    end
  assign wire87 = $unsigned((reg60 ?
                      $signed($unsigned(wire50[(4'h9):(1'h1)])) : $unsigned($unsigned(((8'hb9) == reg85)))));
endmodule
