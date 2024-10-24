module top
#(parameter param88 = (({((~&(8'hbb)) ? (&(8'hbe)) : (^~(8'hbb))), (8'ha8)} ? (~&(&((8'hbe) | (8'haa)))) : (^~(((7'h40) + (7'h40)) - ((8'hac) ^ (8'h9e))))) ? ({(~^((8'hb2) | (8'ha0))), ((7'h43) <<< (~&(8'ha3)))} ? (&{(!(8'hb3)), ((8'haf) & (8'hbe))}) : ((^~{(8'ha4)}) ^ ((8'hb8) != ((8'hb7) ? (8'ha4) : (8'hb6))))) : (((^~{(8'h9e)}) || (((8'h9c) ^ (8'hac)) ? {(8'hb6), (8'ha0)} : ((7'h42) ? (8'hb4) : (8'hbe)))) ? {(8'h9c), (((8'h9d) ? (7'h40) : (8'hbc)) ? ((8'hb7) ^~ (7'h41)) : (~(7'h41)))} : ((((8'hb6) * (8'ha5)) < (~^(8'hb6))) ? (((8'hb7) <<< (8'ha4)) - ((8'hae) ^~ (7'h41))) : ((|(8'had)) ? (&(8'ha4)) : (~^(8'hbb)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire71;
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire71,
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
                 (1'h0)};
  module4 #() modinst72 (.wire9((8'hbb)), .wire8(wire0), .wire6(wire2), .wire5(wire3), .y(wire71), .clk(clk), .wire7(wire1));
  always
    @(posedge clk) begin
      reg73 <= wire71;
      reg74 <= $unsigned((wire71 | (~^wire2[(3'h4):(1'h1)])));
      reg75 <= $unsigned($unsigned(wire2));
    end
  always
    @(posedge clk) begin
      if ((($signed((wire3 != (reg73 ? (8'hac) : wire71))) ?
              ($signed((|(8'hb0))) >>> $unsigned(wire1[(4'he):(4'hb)])) : (wire3 ?
                  wire2 : wire1[(3'h4):(2'h3)])) ?
          reg73[(2'h3):(2'h3)] : ((wire3 ?
              ($unsigned(wire3) < $unsigned(reg73)) : ($unsigned(reg74) ?
                  (reg73 - reg74) : (&reg75))) >>> reg73)))
        begin
          reg76 <= (reg75 ? reg75 : wire1[(2'h3):(2'h2)]);
          reg77 <= ((8'h9d) ^ ({reg76[(3'h6):(1'h0)]} <= wire1));
          reg78 <= wire0[(3'h7):(3'h4)];
        end
      else
        begin
          reg76 <= $unsigned(($signed($unsigned((!wire3))) <= ((!(wire0 - reg78)) ?
              ($unsigned((8'hbe)) != (wire2 == reg77)) : $signed($unsigned(wire71)))));
          reg77 <= reg77;
          if (reg77)
            begin
              reg78 <= {(~$unsigned(($unsigned(wire2) ?
                      $signed(wire2) : {wire2}))),
                  reg76[(1'h0):(1'h0)]};
              reg79 <= $unsigned({$signed(reg73[(1'h0):(1'h0)]),
                  $signed(((wire0 ? reg77 : reg73) ?
                      (reg76 * reg73) : reg74))});
              reg80 <= (wire1 ?
                  (reg75[(4'hb):(3'h6)] && wire71) : (reg77[(1'h1):(1'h1)] + $signed(reg79[(2'h3):(2'h2)])));
              reg81 <= (reg77 < ((^{wire1}) >> wire2));
              reg82 <= $signed((reg77 || (wire1[(4'ha):(3'h4)] ?
                  (~|(reg78 ? reg75 : (8'ha3))) : reg75)));
            end
          else
            begin
              reg78 <= (8'hbc);
              reg79 <= reg80[(5'h14):(2'h3)];
              reg80 <= wire3;
              reg81 <= $signed((&$unsigned(((reg73 ? reg77 : reg81) ?
                  {wire0, wire1} : $unsigned(wire2)))));
            end
          reg83 <= $unsigned((8'h9e));
          reg84 <= {(8'ha4)};
        end
      reg85 <= wire2;
    end
  assign wire86 = (reg83 ?
                      (~^({reg83, reg83[(2'h3):(1'h1)]} ?
                          $signed((reg75 ? reg78 : reg74)) : ((reg78 ?
                                  reg80 : reg75) ?
                              (^~wire3) : ((8'hbb) ?
                                  (7'h40) : wire2)))) : (|$signed(((reg76 ?
                              (8'hb3) : reg79) ?
                          (^reg76) : $unsigned(reg85)))));
  assign wire87 = $signed(reg78);
endmodule

module module4
#(parameter param69 = ((((((8'hbe) ? (7'h42) : (8'h9e)) ? (~(8'hb3)) : ((8'hbe) >>> (8'ha5))) != (((8'ha5) ? (8'haa) : (8'hab)) ^~ {(8'hb0)})) != (&((^(8'hb8)) ? ((8'hb3) ? (8'ha5) : (8'hab)) : {(8'hbd)}))) ? (-{(((8'ha6) | (8'haf)) - (&(8'hbe)))}) : {(((8'hb4) >> ((8'ha2) ? (8'haa) : (8'ha8))) >> (~|((7'h42) * (8'hb3))))}), 
parameter param70 = {(+param69), param69})
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire5;
  input wire [(4'hc):(1'h0)] wire6;
  input wire [(4'hd):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire62;
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire47,
                 wire62,
                 (1'h0)};
  assign wire10 = {$signed(wire5),
                      ($unsigned($signed((wire9 ^~ wire7))) & (wire9[(3'h5):(2'h3)] ^~ ((+wire5) ^ wire7)))};
  assign wire11 = $signed(wire8[(3'h6):(3'h6)]);
  assign wire12 = $signed($signed((~&$signed(wire5))));
  assign wire13 = $unsigned((((wire10 ?
                          $unsigned((8'h9e)) : $unsigned(wire12)) ?
                      wire12 : $unsigned((wire6 << (8'ha5)))) ^ $signed(wire12[(1'h1):(1'h0)])));
  module14 #() modinst48 (wire47, clk, wire8, wire10, wire12, wire11);
  module49 #() modinst63 (wire62, clk, wire13, wire9, wire6, wire12, wire47);
  assign wire64 = wire8[(4'he):(4'he)];
  assign wire65 = ($signed($signed($signed(wire5[(3'h7):(1'h0)]))) ?
                      (wire12 ?
                          {(~^wire7[(2'h3):(1'h1)])} : {$signed($unsigned(wire5)),
                              $signed({wire12})}) : wire12[(4'h9):(2'h3)]);
  assign wire66 = wire5;
  assign wire67 = $unsigned(wire11);
  assign wire68 = wire12[(5'h14):(5'h10)];
endmodule

module module49
#(parameter param60 = ((&(|(((7'h40) << (8'hb6)) ? ((7'h40) ? (8'had) : (8'hb5)) : (8'haa)))) ? ((~^(((8'ha3) >>> (8'hbb)) >>> (^(8'ha3)))) ? (|({(7'h44)} ? ((8'hba) != (8'ha4)) : ((8'ha2) | (8'h9c)))) : ((&((8'hbc) << (8'h9f))) ~^ (|(|(8'hbf))))) : (8'hb5)), 
parameter param61 = (((param60 >>> ((param60 * param60) ? (-param60) : (param60 ? (8'h9d) : param60))) >> {((^(8'ha6)) ? (param60 >>> param60) : (~&(8'h9c))), ({(8'hb8)} & (~param60))}) ? (|{((~^param60) ? (|param60) : param60), (^((8'ha1) == param60))}) : {(8'hbc), (param60 * {(param60 ? param60 : (8'h9f)), (!param60)})}))
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire54;
  input wire [(4'hf):(1'h0)] wire53;
  input wire [(2'h3):(1'h0)] wire52;
  input wire [(5'h14):(1'h0)] wire51;
  input wire [(4'hf):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  assign y = {wire59, wire58, wire57, wire56, wire55, (1'h0)};
  assign wire55 = $unsigned((^~$unsigned((-(|wire52)))));
  assign wire56 = (^wire51[(4'hd):(3'h4)]);
  assign wire57 = wire51;
  assign wire58 = $signed(($signed((^{wire51, wire54})) ? (!(8'h9d)) : wire52));
  assign wire59 = wire55[(2'h2):(1'h0)];
endmodule

module module14
#(parameter param46 = ((-(+(+(&(7'h44))))) <<< (8'hbf)))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire [(4'h8):(1'h0)] wire16;
  input wire [(5'h14):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire [(2'h3):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
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
                 (1'h0)};
  assign wire19 = ({wire16[(3'h5):(2'h2)],
                      ((^{wire15}) ~^ $signed($signed(wire16)))} << wire18[(2'h3):(2'h2)]);
  assign wire20 = wire17;
  assign wire21 = wire16[(2'h3):(1'h1)];
  assign wire22 = wire21;
  assign wire23 = (({wire17[(1'h0):(1'h0)]} != (-wire15)) & (~&wire22));
  always
    @(posedge clk) begin
      reg24 <= $signed({$signed((wire16 ?
              $signed(wire20) : (wire20 ? wire17 : wire16))),
          ($unsigned({(8'hb2)}) ?
              ((wire21 ? wire15 : (8'ha7)) ?
                  (!(8'ha5)) : $unsigned(wire20)) : $unsigned((wire17 ?
                  (8'hb6) : wire18)))});
      reg25 <= ((({wire18, wire19} ?
              ((wire20 ? (8'h9f) : reg24) ?
                  reg24 : (!wire17)) : reg24) ~^ wire18) ?
          wire15 : reg24);
      reg26 <= $signed((~&(~^(!$signed(wire16)))));
      if ({{wire20[(3'h6):(2'h3)]},
          (^((~^(reg25 || wire18)) ^~ (+(~^wire17))))})
        begin
          if (wire17[(1'h1):(1'h0)])
            begin
              reg27 <= $unsigned((((wire15 > ((8'hac) != (8'hbb))) >= $unsigned($unsigned((8'hb0)))) && (((wire21 != (8'hac)) << $unsigned(wire20)) & $signed($unsigned(wire21)))));
              reg28 <= wire19[(2'h2):(1'h0)];
            end
          else
            begin
              reg27 <= (((~|wire17[(1'h1):(1'h1)]) <= (((^reg26) > {(8'ha5)}) << {$unsigned((8'hbd)),
                      (wire21 == wire21)})) ?
                  reg24 : $unsigned((($signed(wire23) ?
                          $unsigned(wire19) : wire18) ?
                      wire16 : $unsigned(wire20))));
              reg28 <= {$signed((($unsigned(wire18) ?
                          reg28 : (wire21 ^ reg24)) ?
                      wire16 : (~^(wire22 | reg24))))};
            end
          reg29 <= $signed(reg28);
        end
      else
        begin
          reg27 <= $signed(($unsigned(wire21) ?
              wire21 : ($signed($unsigned(reg26)) ?
                  (reg24 ?
                      reg27[(4'hb):(2'h2)] : (8'h9c)) : (^~(wire21 && (8'hb1))))));
          reg28 <= wire18[(4'hc):(4'ha)];
        end
      if ($unsigned($unsigned((((^reg25) ? wire20 : (reg27 >> (8'h9c))) ?
          (!(reg28 > (7'h40))) : $unsigned(wire21[(4'hd):(2'h3)])))))
        begin
          reg30 <= (({($signed(wire23) ?
                      ((8'ha2) ? reg29 : reg25) : (wire16 | reg27)),
                  $unsigned($signed(reg27))} ?
              reg26 : wire20) >= wire21);
          if ($unsigned($signed($signed((^(wire18 && wire22))))))
            begin
              reg31 <= {reg24};
              reg32 <= (reg25[(1'h1):(1'h0)] < (8'hb8));
              reg33 <= (~&{$signed(reg26[(2'h3):(1'h0)]),
                  reg30[(4'hf):(3'h7)]});
              reg34 <= {(((wire20 ?
                      wire21 : $signed((8'hba))) ~^ {$unsigned(reg27),
                      $unsigned(wire17)}) >= (7'h42)),
                  (((|wire23[(4'hd):(4'hc)]) ?
                          ((reg31 ?
                              reg30 : reg32) >>> $unsigned(reg27)) : ((reg32 ?
                              reg30 : (8'hb1)) ~^ {(8'hba)})) ?
                      reg32[(1'h0):(1'h0)] : $signed($unsigned((~|wire16))))};
            end
          else
            begin
              reg31 <= ({$signed({(^~wire17), wire19})} ?
                  (~^$signed(wire23)) : reg29);
            end
          reg35 <= wire22[(5'h13):(4'hd)];
          if ((wire15 ?
              (wire15[(5'h10):(5'h10)] ?
                  (reg28 >= $signed(reg25[(4'hb):(4'h8)])) : $unsigned(($unsigned(reg30) ?
                      (wire16 != wire21) : wire15))) : ((~((wire23 ?
                      wire21 : reg26) ?
                  $signed((8'hae)) : $unsigned(wire16))) | (reg30 ?
                  {reg30, ((8'ha7) ? reg35 : (8'hb5))} : $unsigned((wire20 ?
                      (7'h43) : reg28))))))
            begin
              reg36 <= wire18[(4'ha):(2'h3)];
              reg37 <= ((($signed($signed((8'ha6))) ?
                      $signed((wire19 ? wire17 : wire16)) : (wire23 ?
                          wire22 : {reg30, reg32})) ?
                  reg30 : ($unsigned(reg35) <<< {(reg31 << wire22)})) - reg32);
              reg38 <= reg33;
            end
          else
            begin
              reg36 <= $unsigned(((reg30[(5'h10):(3'h4)] ?
                      ({reg27,
                          wire20} >>> $signed(reg26)) : $signed((~^reg36))) ?
                  wire16[(3'h5):(2'h3)] : (((~|reg34) == $unsigned(reg30)) ?
                      $signed((reg27 && reg35)) : $signed(wire17))));
              reg37 <= reg32[(1'h0):(1'h0)];
              reg38 <= $unsigned((~&wire16));
            end
        end
      else
        begin
          reg30 <= wire18;
          reg31 <= {reg29, (-{$unsigned((wire20 >= reg33))})};
          reg32 <= (~^reg34[(3'h5):(2'h3)]);
        end
    end
  assign wire39 = reg31[(4'h8):(3'h5)];
  assign wire40 = ($signed($signed(reg33)) ?
                      wire23[(4'h8):(2'h3)] : ($signed({(wire22 ~^ reg31),
                              (^~reg25)}) ?
                          $unsigned(reg27) : reg29));
  assign wire41 = $unsigned((^~((reg36 ?
                      (8'ha0) : ((8'hb8) ? wire16 : reg29)) < wire19)));
  assign wire42 = $signed(($unsigned($unsigned((^~wire41))) ^~ (+(~$unsigned((8'hb6))))));
  assign wire43 = (^~$signed((-($unsigned((7'h41)) ?
                      $signed(wire19) : (reg33 + reg34)))));
  assign wire44 = $unsigned(((^(^~(wire43 << wire17))) ?
                      wire19[(1'h0):(1'h0)] : reg34));
  assign wire45 = wire44;
endmodule
