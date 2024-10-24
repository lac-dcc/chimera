module top
#(parameter param88 = ((~^(8'h9c)) ? (~&({(^~(8'haf)), ((8'hb9) ? (8'h9c) : (8'hbc))} ? (8'hb3) : (+((8'hbe) ^~ (8'h9e))))) : (((((8'ha7) <<< (8'hb8)) ^ {(8'hb7), (8'hb3)}) ? (((7'h40) ? (8'hb3) : (8'hb0)) <= ((8'ha3) <<< (8'hbd))) : (((8'hb0) ? (8'ha5) : (7'h44)) ? ((7'h41) ? (8'ha2) : (8'hb6)) : ((8'hbc) ? (8'ha8) : (8'had)))) == {(~&((8'had) >= (8'hb9)))})), 
parameter param89 = param88)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire74;
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire4,
                 wire74,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire4 = ((&(+(^~((8'hb4) ? (8'ha3) : wire3)))) + ($signed((~&((8'ha4) ?
                     wire2 : (8'haf)))) + wire3));
  module5 #() modinst75 (.y(wire74), .wire6(wire3), .clk(clk), .wire9(wire0), .wire8(wire4), .wire7(wire1), .wire10(wire2));
  assign wire76 = wire2[(4'h9):(3'h5)];
  assign wire77 = (~^(7'h40));
  assign wire78 = wire3;
  assign wire79 = wire1;
  assign wire80 = (wire3[(4'hc):(3'h4)] ? wire3[(4'h8):(3'h5)] : wire74);
  always
    @(posedge clk) begin
      reg81 <= wire3;
      reg82 <= {wire76,
          ((~$signed($unsigned(wire4))) ?
              (~&((+wire0) & (8'hbf))) : $unsigned($signed((wire77 ?
                  wire4 : wire2))))};
      reg83 <= $unsigned((wire77[(5'h10):(1'h1)] ? wire77 : wire3));
      reg84 <= wire1;
    end
  assign wire85 = {$signed($unsigned({$unsigned((8'hbc))})),
                      ($unsigned($signed({wire1})) <<< wire79)};
  assign wire86 = wire4;
  assign wire87 = wire1;
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire11;
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire59,
                 wire11,
                 reg61,
                 (1'h0)};
  assign wire11 = ($unsigned({($unsigned(wire9) ?
                          wire8[(1'h1):(1'h0)] : $unsigned(wire7)),
                      wire6[(3'h4):(2'h2)]}) > {wire6});
  module12 #() modinst60 (.clk(clk), .y(wire59), .wire14(wire11), .wire16(wire8), .wire15(wire6), .wire13(wire9));
  always
    @(posedge clk) begin
      reg61 <= $signed($signed($signed({$unsigned((8'hbe))})));
    end
  assign wire62 = wire59;
  assign wire63 = wire7;
  assign wire64 = $signed(wire9[(2'h3):(2'h3)]);
  assign wire65 = {$signed($unsigned(($unsigned((8'h9f)) << {wire63}))),
                      (^~($signed($unsigned(wire11)) ?
                          $signed(wire63[(2'h2):(1'h0)]) : ((wire6 <<< wire9) ?
                              (~&wire64) : $unsigned(wire59))))};
  assign wire66 = {(8'hba)};
  assign wire67 = (wire8 ?
                      (~|((-(^wire66)) ~^ (wire8[(3'h5):(2'h3)] * (wire10 | wire63)))) : (($signed((wire11 << wire65)) || $signed((wire6 > (8'ha7)))) ?
                          wire6 : $unsigned($unsigned($signed(wire11)))));
  assign wire68 = wire66;
  assign wire69 = (($unsigned({(wire67 & wire6), (wire7 ? wire67 : wire8)}) ?
                          ((~^(wire67 ?
                              wire6 : wire63)) >> $signed($unsigned(wire64))) : wire9[(4'hd):(3'h7)]) ?
                      ($signed({$signed(wire11), $signed((8'had))}) ?
                          (~^wire6[(3'h6):(1'h0)]) : wire10) : (wire8[(4'h8):(2'h3)] > $unsigned($signed((wire66 * wire63)))));
  assign wire70 = wire65[(3'h6):(2'h2)];
  assign wire71 = $signed(wire10);
  assign wire72 = (~&$unsigned((-($unsigned(wire68) - (^~reg61)))));
  assign wire73 = {$unsigned($unsigned($unsigned((-wire64))))};
endmodule

module module12
#(parameter param57 = ((+{((~|(8'hb3)) ? ((8'ha9) ? (8'h9c) : (8'hbe)) : ((8'hbe) == (8'hb3)))}) ^~ (({((7'h44) >>> (8'ha2)), (+(8'ha5))} ? (&((8'hbb) && (8'hbc))) : (!(~|(8'ha6)))) >> ((~|((7'h43) <<< (8'haf))) <= (((8'hb0) ? (8'hb8) : (7'h44)) ? ((8'had) ? (8'hb2) : (8'hb1)) : ((8'ha9) - (8'hb6)))))), 
parameter param58 = (param57 ? (~^param57) : ({(&(^~(8'ha7)))} ? (!((param57 ? param57 : (8'hb8)) ^ param57)) : param57)))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h220):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire16;
  input wire signed [(5'h11):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
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
                 reg36,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= wire15[(4'h9):(2'h3)];
      if ($unsigned($unsigned(reg17[(4'h8):(2'h2)])))
        begin
          reg18 <= wire16;
        end
      else
        begin
          if ($unsigned(wire16[(1'h0):(1'h0)]))
            begin
              reg18 <= wire16;
              reg19 <= $unsigned({{({wire16, reg17} ?
                          $unsigned(wire13) : {wire15}),
                      (^(reg17 ? wire16 : reg17))}});
              reg20 <= $signed((~^(((8'hb7) ?
                      (wire13 && reg17) : $unsigned(wire16)) ?
                  $signed((wire13 >> reg17)) : (^(reg19 > reg18)))));
              reg21 <= (|reg20);
            end
          else
            begin
              reg18 <= {((|($unsigned(reg19) & wire15)) >>> $unsigned(((reg18 ?
                      wire16 : wire15) >> reg17)))};
              reg19 <= (wire16 <<< (($signed($signed(wire14)) + (reg19 ?
                  wire15 : $unsigned(wire16))) + $signed(((&reg17) ^~ {(7'h40)}))));
              reg20 <= (&reg20);
            end
          reg22 <= $signed((($signed($unsigned(wire15)) ?
              $unsigned((&wire15)) : (-((8'hbd) >= reg19))) < $unsigned($unsigned(wire16))));
        end
      reg23 <= (^((reg22 | (reg19 || $signed((8'ha7)))) && (~(~^(wire14 ?
          reg20 : wire14)))));
    end
  assign wire24 = reg20;
  assign wire25 = (wire15[(3'h5):(3'h4)] ?
                      (8'ha4) : $unsigned(reg21[(3'h5):(2'h2)]));
  assign wire26 = (^$signed(reg22[(3'h4):(2'h3)]));
  assign wire27 = $signed((^~(8'hbd)));
  assign wire28 = $signed((wire16 ?
                      (+(&$unsigned(reg18))) : $signed(((wire25 ?
                          reg21 : reg21) < wire13))));
  assign wire29 = (-$signed($unsigned($signed((wire16 ? wire25 : reg18)))));
  assign wire30 = reg19[(3'h6):(3'h5)];
  assign wire31 = ($signed($signed((-(^(8'hb2))))) ~^ (((((8'hb7) ?
                          reg18 : reg22) ^~ (reg20 - reg18)) * {$signed(wire29)}) ?
                      wire26[(4'he):(4'hd)] : ($signed((wire26 ?
                          wire27 : wire13)) != (^~(wire24 != wire25)))));
  assign wire32 = ((~|wire27) ?
                      ((($unsigned((8'ha3)) ?
                              {wire14, reg18} : $unsigned(wire14)) ?
                          (^~(reg20 ?
                              reg19 : (8'hba))) : reg17[(1'h0):(1'h0)]) + ((+wire26) + (~|$signed(wire15)))) : (reg18 ?
                          $unsigned(wire24) : ((8'ha8) ?
                              (^~(+wire14)) : reg17)));
  assign wire33 = $unsigned(($signed($unsigned((^~wire29))) || (($unsigned((8'ha2)) ^~ (reg20 << reg19)) || ({wire31} >> wire15[(5'h11):(3'h4)]))));
  assign wire34 = (wire28 << wire14);
  assign wire35 = wire29;
  always
    @(posedge clk) begin
      reg36 <= reg17;
    end
  assign wire37 = ($unsigned(((wire26 ? (wire24 - wire13) : $unsigned(wire16)) ?
                          ($signed(wire35) <= (reg36 <= wire27)) : reg20)) ?
                      reg17[(5'h15):(4'hb)] : wire15);
  assign wire38 = {wire16, wire29[(1'h1):(1'h1)]};
  always
    @(posedge clk) begin
      reg39 <= wire31[(3'h6):(2'h3)];
      reg40 <= wire26;
      if (($unsigned(((wire35 ? $signed(wire33) : $unsigned(reg40)) ?
          ($signed((8'hb8)) ^ ((8'hb6) ?
              reg40 : wire33)) : ((wire16 ^~ wire31) ?
              (wire26 - wire34) : {wire31}))) ^ wire27))
        begin
          if ({(reg20 && wire14[(3'h4):(1'h0)])})
            begin
              reg41 <= $unsigned($unsigned((~(!reg39[(3'h5):(2'h3)]))));
            end
          else
            begin
              reg41 <= reg21[(5'h12):(4'hb)];
              reg42 <= (wire37 ^~ ((~(((8'h9c) ? reg17 : wire26) ?
                  (reg41 ^~ (8'ha1)) : wire28[(3'h6):(3'h4)])) <<< wire28));
              reg43 <= (({wire13, reg40} ?
                      (^$signed($unsigned(wire32))) : wire33) ?
                  ((~wire30) ?
                      wire34[(3'h4):(2'h2)] : (^~($signed((8'ha1)) <= $unsigned(reg22)))) : wire38[(2'h3):(1'h1)]);
              reg44 <= (((+$unsigned($signed(reg20))) ?
                  wire26[(1'h1):(1'h1)] : $signed($signed(wire32))) >>> $unsigned($signed(wire37[(3'h4):(2'h3)])));
              reg45 <= $unsigned((((wire24 ?
                      $unsigned(reg44) : ((8'h9c) < (8'h9c))) > (wire38[(1'h0):(1'h0)] ?
                      wire32[(4'hb):(1'h1)] : $unsigned(wire38))) ?
                  $unsigned(((!wire26) || $signed(reg22))) : ($unsigned((reg41 ?
                          reg21 : wire33)) ?
                      ((reg19 >= wire16) ?
                          wire24[(3'h6):(3'h4)] : (wire14 != wire27)) : $unsigned({reg19}))));
            end
          if (({$unsigned(reg40[(5'h10):(4'he)]),
                  {$unsigned($signed(wire35)),
                      ((reg45 ? wire38 : (8'hbf)) > reg21)}} ?
              (reg23[(2'h3):(2'h2)] ?
                  reg36[(3'h5):(1'h1)] : wire14[(4'hc):(1'h0)]) : (|wire29)))
            begin
              reg46 <= {(~|wire34)};
              reg47 <= wire29;
              reg48 <= reg40;
            end
          else
            begin
              reg46 <= reg39[(2'h3):(2'h2)];
              reg47 <= (~(^reg40));
              reg48 <= {$unsigned($signed($unsigned($signed((8'ha6)))))};
              reg49 <= wire35[(4'h9):(1'h0)];
              reg50 <= ($unsigned((((wire34 && reg46) ?
                          wire32[(4'he):(4'hc)] : ((8'hab) ? wire35 : wire32)) ?
                      wire26[(4'ha):(1'h0)] : ({reg17} ?
                          (+reg17) : $unsigned(wire30)))) ?
                  ((^~((8'ha7) ?
                      (8'h9c) : (^reg21))) << wire15[(4'hd):(4'hb)]) : ((~|((wire29 ?
                              reg20 : wire38) ?
                          (reg21 <= reg36) : (reg48 >>> reg40))) ?
                      (reg36 << $unsigned(reg42)) : reg48[(3'h4):(1'h1)]));
            end
          reg51 <= (|reg39[(4'hb):(2'h3)]);
          if (wire38[(1'h1):(1'h1)])
            begin
              reg52 <= (wire24[(3'h6):(2'h2)] ?
                  (~|$unsigned($signed((wire35 >> reg40)))) : $unsigned(($signed($unsigned(reg23)) ?
                      (reg45 - {wire34, (8'ha4)}) : {(!reg48)})));
              reg53 <= reg22;
              reg54 <= reg45[(5'h11):(1'h1)];
              reg55 <= $signed(({$signed((reg19 ? reg42 : wire30))} ?
                  wire28[(2'h2):(2'h2)] : $unsigned((((8'ha4) ? reg39 : reg18) ?
                      $unsigned(reg47) : (reg47 ? reg50 : reg17)))));
            end
          else
            begin
              reg52 <= (reg55 ?
                  $unsigned(($unsigned(((8'hb5) >= reg41)) >> {reg22[(3'h5):(3'h5)]})) : (!$signed(wire37[(3'h5):(3'h4)])));
              reg53 <= ((((!$signed(wire29)) << {$signed(wire15)}) ^ ((!wire31[(3'h4):(2'h3)]) ?
                  $unsigned(reg53) : (reg39[(4'ha):(3'h5)] >= {reg20,
                      reg36}))) + wire25[(2'h3):(2'h2)]);
              reg54 <= reg45;
              reg55 <= {(!($unsigned(reg50) << {(wire34 | wire33)})),
                  (reg22 ?
                      (+$unsigned((wire34 * wire16))) : $unsigned((((7'h42) * wire31) ?
                          wire29 : $unsigned(reg54))))};
              reg56 <= $unsigned((~wire29));
            end
        end
      else
        begin
          reg41 <= ((!($signed((wire29 ? reg50 : wire16)) <= (+{reg36,
                  wire13}))) ?
              ($signed(((reg49 + wire38) ?
                  (reg48 ?
                      reg18 : reg41) : reg50[(1'h1):(1'h1)])) >> $signed(wire32)) : ($signed((reg17 & $signed(wire24))) ^ reg18[(4'ha):(2'h2)]));
          reg42 <= (reg56[(2'h3):(2'h3)] ?
              ((wire32 ?
                  wire28[(1'h0):(1'h0)] : ((+wire30) ?
                      (reg17 ?
                          reg55 : (8'hb9)) : $unsigned(reg36))) ~^ wire13) : $signed(($signed(reg48) ?
                  (+$signed(wire37)) : reg47)));
          reg43 <= $signed(wire38);
          reg44 <= (reg52[(4'hb):(4'h9)] >>> ((8'hb3) >> {wire37[(1'h0):(1'h0)]}));
        end
    end
endmodule
